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
  NotAllInputMsg := LocER('Some required data are not input.', '������� �� ��� ��������� �������� ������.');   //ResultsDat
  TooManyInputMsg := LocER('An attempt to input superfluous data.', '������� ������ ������ �������� ������.'); //ResultsDat
  AcquaintanceRunMsg := LocER('Acquaintance with the task.', '��������������� ������.'); //ResultsDat
  WrongTypeInputMsgBrief := LocER('Invalid type is used for an input data item.', '������� ������ ��� ��� ����� �������� ������.'); //ResultsDat
  TooManyOutputMsgBrief := LocER('An attempt to output superfluous data.', '������� ������� ������ �������������� ������.'); //ResultsDat
  NotAllOutputMsgBrief := LocER('Some data are not output.', '�������� �� ��� �������������� ������.'); //ResultsDat
  WrongTypeOutputMsgBrief := LocER('Invalid type is used for an output data item.', '������� ������ ��� ��� ������ �����������.'); //ResultsDat
  AllInputNoOutputMsgBrief := LocER('Correct data input.', '������ � ���������� ������ ������.'); //ResultsDat
  WrongSolutionMsg := LocER('Wrong solution.', '��������� �������.'); //ResultsDat
  TaskIsSolvedMsgBrief := LocER('The task is solved! ', '������� ���������! '); //ResultsDat ��� ���������� ������ PT4Res � ����� ����� ������!!

  NoInputMsg := LocER('No data are input.', '�������� ������ �� �������.');
  NoOutputMsg := LocER('No results are output.', '���������� �� ��������.');
  WrongTypeInputMsg := LocER('Invalid type is used for an input data item.', '������ �������� ��� ��� ����� �������� ������.');
  WrongTypeOutputMsg := LocER('Invalid type is used for an output data item.', '������ �������� ��� ��� ������ �����������.');
  NotAllOutputMsg := LocER('Some results are not output.', '�������� �� ��� ����������.');
  TooManyOutputMsg := LocER('An attempt to output superfluous data.', '������� ������� ������ ����������.');
  AllInputNoOutputMsg := LocER('All required data are input, no results are output.', '��� ��������� �������� ������ �������, ���������� �� ��������.');
  DemoRunMsg := LocER('Demo running.', '���������������� ������.');
  RightSolutionMsg := LocER('Right solution.', '���������� �������.');
  TaskIsSolvedMsg := LocER('The task is solved!', '������� ���������!'); 


  FileNotFoundMsg := LocER('File not found', '���� �� ������'); 
  DebugInfoMsg := LocER('Debug information', '���������� ����������');
  AddInfoMsg := LocER('Additional information', '�������������� ����������');
  InputDataInfoMsg := LocER('Input data', '�������� ������');
  OutputDataInfoMsg := LocER('Output data', '����������');
  ExampleInfoMsg := LocER('Example of right solution', '������ ����������� �������');
//  StudentMsg := LocER('Student: ', '���������: ');
  if lang <> 'Python' then
    NoTaskCallMsg := LocER('The Task function is not called at beginning of the program.', '� ������ ��������� �� ������� ������� Task.')
  else
    NoTaskCallMsg := LocER('Syntax error or the task function is not called at beginning of the program.', 
                            '���������� ������ ���������� ��� � ������ ��������� �� ������� ������� task.');
  NoTaskCallMsgBrief := LocER('The Task function is not called.', '� ������ ��������� �� ������� ������� Task.');

  TaskIncludedInVariantMsg := LocER('This task is included in variant ', 
                                    '������ ������� �������� � ������� ');
  BallsMsg := LocER('Points: ', '�����: ');
  TaskNotIncludedInVariantMsg := LocER('THE TASK IS NOT INCLUDED IN YOUR VARIANT.', 
                                       '������ ������� � ��� ������� �� ��������.');
  VariantDatIsCorruptedMsg :=    LocER('The Variant.dat file contains invalid data.', 
                                       '���� Variant.dat ��������.');
  VariantDatHasWrongFormatMsg := LocER('The Variant.dat file has a wrong format.', 
                                       '���� Variant.dat ����� �������� ������.');

  SetLocale(SPTAccFileDenied, '�������� � ������� � ����� access.dat. ',
      'Access to the access.dat file is denied. ');
  SetLocale(SPTAccFileWrong, '���� access.dat ����� �������� ������. ',
      'Wrong format of access.dat. ');
  SetLocale(SPTAccFileNotActivated, '���� access.dat �� �����������. ',
      'The access.dat file is not activated. ');
  SetLocale(SPTAccFileWrongStud, '��� ��������� � ����� ����������� ���������� �� ����� � ����� access.dat. ',
      'The student names in the results file and in the access.dat file are different. ');
  SetLocale(SPTAccCannotCreateTempDir, '�� ������� ������� ��������� ������� "%s". ',
      'Could not create the "%s" directory. ');

  SetLocale(SPTAccTaskFileNotFound, '�� ������ ���� � �������� (%s). ��������, ��� ����� � ���������� �� ��������� � ������ ������������ �������. ��������� ��������� ��� ��������� ������.',
      'File with the task solution (%s) is not found. It is likely that the source file name differs from the task name. Save your source file with the name of task being solved.');
  SetLocale(SPTAccNoAutoSave, '��������, ���� � �������� (%s) �� ��� �������� ����� �������� ��������� (� ���� ������ �������� ����� ��������������)'+
  ' ��� ��� ����� � ���������� �� ��������� � ������ ������������ ������� (� ���� ������ ��������� ��������� ��� ��������� ������).',
      'It is likely that file with the task solution (%s) was not saved before running the program (maybe autosave mode is off)'+
      'or the source file name differs from the task name (save your source file with the name of task being solved).');

  SetLocale(SPTAccMesWinInet, '�� ������� ���������� WinInet.dll.',
      'Unable to get access to WinInet.dll.');
  SetLocale(SPTAccMesHost, '���� ����������� ����������. ��������� ����������� � ���������.',
      'The repository host is not available. Check your internet connection.');
  SetLocale(SPTAccMesDir, '�� ������ ������� ���������� �����������. �������� � ������ ������ �������������.',
      'The repository directory is not found. Inform your teacher about this error.');
  SetLocale(SPTAccMesStud, '�� ������ ������� ��������� � �����������. �������� � ������ ������ �������������.',
      'The student directory in the repository is not found. Inform your teacher about this error.');
  SetLocale(SPTAccPutFileError, '������ ��� ���������� ������ � ��������� �����������. �������� � ������ ������ �������������.',
      'Can''t upload data to the repository. Inform your teacher about this error.');
  SetLocale(SPTAccGetFileError, '������ ��� ���������� ������ �� ���������� �����������. �������� � ������ ������ �������������.',
      'Can''t download data from the repository. Inform your teacher about this error.');
  SetLocale(SPTAccGetZipFileError, '������ ��� ������ ������ �� ��������� ����� "%s". �������� � ������ ������ �������������.',
      'Can''t read data from the "%s" file. Inform your teacher about this error.');
  SetLocale(SPTAccSaving, '���������� ����������� � �����������...',
      'Saving results in the repository...');
//2017.12>
  SetLocale(SPTAccSaved, '����� ��������� ������� �������� � �����������',
      'The program was successfully saved in the repository');
  SetLocale(SPTAccLocalMode, ' (��������� �����)',
      ' (local mode)');
  SetLocale(SPTEmptyPrefixLine, '� ������ ��������� ���������� �������� �����������:'#13#10'%sFile: "%s"',
      'The comment'#13#10'%sFile: "%s"'#13#10'must be added to the beginning of the program.');
  SetLocale(SPTWrongPrefixLine, '���������� �������� � ������ ��������� �����������'#13#10+
      '%sFile: "%s"'#13#10'�� ���������:'#13#10'%sFile: "%s"',
      'You must replace the comment'#13#10'%sFile: "%s"'#13#10+
      'at the beginning of the program with the following:'#13#10'%sFile: "%s"');

  SetLocale(SPTAccMesExt20Problem, '���� � ������� ����������� � ���������� �����������. ��������� ��������� ��� ���.',
      'Failure in the system of connecting to the remote repository. Run the program again.');

  SetLocale(SPTHeaderTitle, 'Programming Taskbook - ����������� �������� �� ���������������� ', 'Programming Taskbook ');
  SPTHeaderTitle := SPTHeaderTitle + '[' + lang + ']';
end;

function TaskIsFulfilledInfo(msg: string): boolean;
begin
  result := (Pos('The task is solved', msg) > 0) or (Pos('������� ���������', msg) > 0);
end;

function AcquaintanceRunInfo(msg: string): boolean;
begin
  result := (Pos('Acquaintance with the task.', msg) > 0) or (Pos('��������������� ������.', msg) > 0);
end;


begin
  InitLocale;
end.
