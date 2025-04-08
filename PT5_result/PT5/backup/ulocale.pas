unit ULocale;

{$MODE Delphi}

interface

var
  NoInputMsg, NotAllInputMsg, TooManyInputMsg, WrongTypeInputMsg, DemoRunMsg,
  AcquaintanceRunMsg, NoOutputMsg, NotAllOutputMsg, TooManyOutputMsg, 
  WrongTypeOutputMsg, AllInputNoOutputMsg, RightSolutionMsg, WrongSolutionMsg, TaskIsSolvedMsg, NoTaskCallMsg,
  FileNotFoundMsg, DebugInfoMsg, AddInfoMsg, InputDataInfoMsg, OutputDataInfoMsg, ExampleInfoMsg,
  WrongTypeInputMsgBrief, TooManyOutputMsgBrief, NotAllOutputMsgBrief, WrongTypeOutputMsgBrief,
  AllInputNoOutputMsgBrief, NoTaskCallMsgBrief, TaskIsSolvedMsgBrief, 
  TaskIncludedInVariantMsg, BallsMsg, TaskNotIncludedInVariantMsg,
  VariantDatIsCorruptedMsg, VariantDatHasWrongFormatMsg,


  SPTAccFileDenied, SPTAccFileWrong, SPTAccFileNotActivated, SPTAccFileWrongStud, SPTTaskIsChecked,
  SPTAccMesWinInet, SPTAccMesHost, SPTAccMesDir, SPTAccMesStud, SPTAccPutFileError, SPTAccCannotCreateTempDir,
  SPTAccGetFileError, SPTAccGetZipFileError, SPTAccTaskFileNotFound, SPTAccNoAutoSave, SPTAccSaving, SPTAccSaved,
  SPTAccMesExt20Problem, SPTAccLocalMode, SPTEmptyPrefixLine, SPTWrongPrefixLine,
  
  SPTHeaderTitle : string;

procedure SetLocaleConsts(lang: string); // 0 - English, 1 - Russian;  lang - complete lang name
function TaskIsFulfilledInfo(msg: string): boolean;
function AcquaintanceRunInfo(msg: string): boolean;
//function Loc(s_ru, s_en: string): string;
procedure WriteLoc(s_ru, s_en: string);
procedure WritelnLoc(s_ru, s_en: string);
procedure ChangeLocale(newLoc: integer);
function Locale: integer; // 0 - en, 1 - ru
function SLocale: string;
function LocER(s_en, s_ru: string): string;

implementation

uses 
{$IFDEF MSWINDOWS} 
  Windows,
{$ENDIF}

  ansiUTF8, SysUtils;

var FLocale: integer;

{$IFDEF WINDOWS}
function GetOSLocaleInformation(Flag: integer): string;
var
  pcLCA: array[0..101] of char;
begin
  if (Windows.GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, Flag, pcLCA, 100) <= 0) then
  begin
    pcLCA[0] := #0;
  end;
  Result := pcLCA;
end;
{$ENDIF}

function GetOSLocaleLang: string;
begin
{$IFDEF WINDOWS}
   Result := GetOSLocaleInformation(LOCALE_SENGLANGUAGE);
{$ENDIF}
{$IFDEF LINUX}
   Result := SysUtils.GetEnvironmentVariable('LANG');
{$ENDIF}
  if result = 'Russian' then
    result := 'ru'
  else if result = 'Chinese (Simplified)' then
    result := 'ch'
  else
    result := 'en';
end;

procedure InitLocale;
begin
  if GetOSLocaleLang = 'ru' then
    ChangeLocale(1)
  else
    ChangeLocale(0);
end;


procedure ChangeLocale(newLoc: integer);
begin
  if newLoc = 1 then
    FLocale := 1
  else
    FLocale := 0;
end;

function Locale: integer;
begin
  result := FLocale;
end;

function SLocale: string;
begin
  if FLocale = 1 then
    result := 'ru'
  else
    result := 'en';
end;

(*
function Loc(s_ru, s_en: string): string;
begin
  result := '';
  if FLocale = 0 then
    result := s_en
  else 
    result := PT4AnsiToUtf8(s_ru);
end;
*)

procedure WriteLoc(s_ru, s_en: string);
begin
  if FLocale = 1 then
    write(PT4AnsiToUtf8(s_ru))
  else
    write(s_en)
end;

procedure WritelnLoc(s_ru, s_en: string);
begin
  WriteLoc(s_ru, s_en);
  Writeln;
end;


function LocER(s_en, s_ru: string): string;
begin
  result := '';
  if FLocale = 0 then
    result := s_en
  else 
    result := s_ru;
end;

procedure SetLocale(var s: string; s_ru, s_en: string);
begin
  if FLocale = 0 then
    s := s_en
  else
    s := s_ru;
end;

procedure SetLocaleConsts(lang: string);
begin
  NotAllInputMsg := LocER('Some required data are not input.', 'Введены не все требуемые исходные данные.');   //ResultsDat
  TooManyInputMsg := LocER('An attempt to input superfluous data.', 'Попытка ввести лишние исходные данные.'); //ResultsDat
  AcquaintanceRunMsg := LocER('Acquaintance with the task.', 'Ознакомительный запуск.'); //ResultsDat
  WrongTypeInputMsgBrief := LocER('Invalid type is used for an input data item.', 'Неверно указан тип при вводе исходных данных.'); //ResultsDat
  TooManyOutputMsgBrief := LocER('An attempt to output superfluous data.', 'Попытка вывести лишние результирующие данные.'); //ResultsDat
  NotAllOutputMsgBrief := LocER('Some data are not output.', 'Выведены не все результирующие данные.'); //ResultsDat
  WrongTypeOutputMsgBrief := LocER('Invalid type is used for an output data item.', 'Неверно указан тип при выводе результатов.'); //ResultsDat
  AllInputNoOutputMsgBrief := LocER('Correct data input.', 'Запуск с правильным вводом данных.'); //ResultsDat
  WrongSolutionMsg := LocER('Wrong solution.', 'Ошибочное решение.'); //ResultsDat
  TaskIsSolvedMsgBrief := LocER('The task is solved! ', 'Задание выполнено! '); //ResultsDat Для нормальной работы PT4Res в конце нужен пробел!!

  NoInputMsg := LocER('No data are input.', 'Исходные данные не введены.');
  NoOutputMsg := LocER('No results are output.', 'Результаты не выведены.');
  WrongTypeInputMsg := LocER('Invalid type is used for an input data item.', 'Указан неверный тип при вводе исходных данных.');
  WrongTypeOutputMsg := LocER('Invalid type is used for an output data item.', 'Указан неверный тип при выводе результатов.');
  NotAllOutputMsg := LocER('Some results are not output.', 'Выведены не все результаты.');
  TooManyOutputMsg := LocER('An attempt to output superfluous data.', 'Попытка вывести лишние результаты.');
  AllInputNoOutputMsg := LocER('All required data are input, no results are output.', 'Все требуемые исходные данные введены, результаты не выведены.');
  DemoRunMsg := LocER('Demo running.', 'Демонстрационный запуск.');
  RightSolutionMsg := LocER('Right solution.', 'Правильное решение.');
  TaskIsSolvedMsg := LocER('The task is solved!', 'Задание выполнено!'); 


  FileNotFoundMsg := LocER('File not found', 'Файл не найден'); 
  DebugInfoMsg := LocER('Debug information', 'Отладочная информация');
  AddInfoMsg := LocER('Additional information', 'Дополнительная информация');
  InputDataInfoMsg := LocER('Input data', 'Исходные данные');
  OutputDataInfoMsg := LocER('Output data', 'Результаты');
  ExampleInfoMsg := LocER('Example of right solution', 'Пример правильного решения');
//  StudentMsg := LocER('Student: ', 'Выполняет: ');
  if lang <> 'Python' then
    NoTaskCallMsg := LocER('The Task function is not called at beginning of the program.', 'В начале программы не вызвана функция Task.')
  else
    NoTaskCallMsg := LocER('Syntax error or the task function is not called at beginning of the program.', 
                            'Обнаружена ошибка синтаксиса или в начале программы не вызвана функция task.');
  NoTaskCallMsgBrief := LocER('The Task function is not called.', 'В начале программы не вызвана функция Task.');

  TaskIncludedInVariantMsg := LocER('This task is included in variant ', 
                                    'Данное задание включено в вариант ');
  BallsMsg := LocER('Points: ', 'Баллы: ');
  TaskNotIncludedInVariantMsg := LocER('THE TASK IS NOT INCLUDED IN YOUR VARIANT.', 
                                       'ДАННОЕ ЗАДАНИЕ В ВАШ ВАРИАНТ НЕ ВКЛЮЧЕНО.');
  VariantDatIsCorruptedMsg :=    LocER('The Variant.dat file contains invalid data.', 
                                       'Файл Variant.dat испорчен.');
  VariantDatHasWrongFormatMsg := LocER('The Variant.dat file has a wrong format.', 
                                       'Файл Variant.dat имеет неверный формат.');

  SetLocale(SPTAccFileDenied, 'Отказано в доступе к файлу access.dat. ',
      'Access to the access.dat file is denied. ');
  SetLocale(SPTAccFileWrong, 'Файл access.dat имеет неверный формат. ',
      'Wrong format of access.dat. ');
  SetLocale(SPTAccFileNotActivated, 'Файл access.dat не активирован. ',
      'The access.dat file is not activated. ');
  SetLocale(SPTAccFileWrongStud, 'Имя учащегося в файле результатов отличается от имени в файле access.dat. ',
      'The student names in the results file and in the access.dat file are different. ');
  SetLocale(SPTAccCannotCreateTempDir, 'Не удалось создать резервный каталог "%s". ',
      'Could not create the "%s" directory. ');

  SetLocale(SPTAccTaskFileNotFound, 'Не найден файл с решением (%s). Вероятно, имя файла с программой не совпадает с именем выполняемого задания. Сохраните программу под требуемым именем.',
      'File with the task solution (%s) is not found. It is likely that the source file name differs from the task name. Save your source file with the name of task being solved.');
  SetLocale(SPTAccNoAutoSave, 'Вероятно, файл с решением (%s) не был сохранен перед запуском программы (в этом случае включите режим автосохранения)'+
  ' или имя файла с программой не совпадает с именем выполняемого задания (в этом случае сохраните программу под требуемым именем).',
      'It is likely that file with the task solution (%s) was not saved before running the program (maybe autosave mode is off)'+
      'or the source file name differs from the task name (save your source file with the name of task being solved).');

  SetLocale(SPTAccMesWinInet, 'Не найдена библиотека WinInet.dll.',
      'Unable to get access to WinInet.dll.');
  SetLocale(SPTAccMesHost, 'Сайт репозитория недоступен. Проверьте подключение к интернету.',
      'The repository host is not available. Check your internet connection.');
  SetLocale(SPTAccMesDir, 'Не найден каталог удаленного репозитория. Сообщите о данной ошибке преподавателю.',
      'The repository directory is not found. Inform your teacher about this error.');
  SetLocale(SPTAccMesStud, 'Не найден каталог учащегося в репозитории. Сообщите о данной ошибке преподавателю.',
      'The student directory in the repository is not found. Inform your teacher about this error.');
  SetLocale(SPTAccPutFileError, 'Ошибка при сохранении данных в удаленном репозитории. Сообщите о данной ошибке преподавателю.',
      'Can''t upload data to the repository. Inform your teacher about this error.');
  SetLocale(SPTAccGetFileError, 'Ошибка при скачивании данных из удаленного репозитория. Сообщите о данной ошибке преподавателю.',
      'Can''t download data from the repository. Inform your teacher about this error.');
  SetLocale(SPTAccGetZipFileError, 'Ошибка при чтении данных из архивного файла "%s". Сообщите о данной ошибке преподавателю.',
      'Can''t read data from the "%s" file. Inform your teacher about this error.');
  SetLocale(SPTAccSaving, 'Сохранение результатов в репозитории...',
      'Saving results in the repository...');
//2017.12>
  SetLocale(SPTAccSaved, 'Текст программы успешно сохранен в репозитории',
      'The program was successfully saved in the repository');
  SetLocale(SPTAccLocalMode, ' (локальный режим)',
      ' (local mode)');
  SetLocale(SPTEmptyPrefixLine, 'В начало программы необходимо добавить комментарий:'#13#10'%sFile: "%s"',
      'The comment'#13#10'%sFile: "%s"'#13#10'must be added to the beginning of the program.');
  SetLocale(SPTWrongPrefixLine, 'Необходимо заменить в начале программы комментарий'#13#10+
      '%sFile: "%s"'#13#10'на следующий:'#13#10'%sFile: "%s"',
      'You must replace the comment'#13#10'%sFile: "%s"'#13#10+
      'at the beginning of the program with the following:'#13#10'%sFile: "%s"');

  SetLocale(SPTAccMesExt20Problem, 'Сбой в системе подключения к удаленному репозиторию. Запустите программу еще раз.',
      'Failure in the system of connecting to the remote repository. Run the program again.');

  SetLocale(SPTHeaderTitle, 'Programming Taskbook - Электронный задачник по программированию ', 'Programming Taskbook ');
  SPTHeaderTitle := SPTHeaderTitle + '[' + lang + ']';
end;

function TaskIsFulfilledInfo(msg: string): boolean;
begin
  result := (Pos('The task is solved', msg) > 0) or (Pos('Задание выполнено', msg) > 0);
end;

function AcquaintanceRunInfo(msg: string): boolean;
begin
  result := (Pos('Acquaintance with the task.', msg) > 0) or (Pos('Ознакомительный запуск.', msg) > 0);
end;


begin
  InitLocale;
end.
