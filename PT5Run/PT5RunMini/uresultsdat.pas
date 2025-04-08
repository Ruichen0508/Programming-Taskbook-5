{$A+,B-,C-,D-,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R+,S-,T-,U-,V+,W-,X+,Y-,Z1}

{$MODE Delphi}
unit uresultsdat;

// !!!!ВЕРСИЯ БЕЗ ПОДДЕРЖКИ РАБОТЫ С РЕПОЗИТОРИЕМ!!!!


interface

const AccDirName = 'ptaccess.dir';

type
  TResultsDatState = (rdNotFound,rdAccessDenied,rdCorrupted,
     rdWrongRegData,rdReady,rdWritten,rdNull,rdAccessError);

  TResultsDat = class
   private
     FPath : string;
     FState : TResultsDatState;
     Winner,Marked : Boolean;
     FTaskName : string;
     FLangModif : boolean;
     LangChar: char;
     procedure writeLast(datetime, TaskMess : string; n : integer);
     procedure getLast(var TaskName, datetime, TaskMess, TaskInfo: string; var n : integer);
     procedure deleteLast;
   public
     RepTaskMess, RepTaskInfo: string; //2017.08
     constructor Create(aPath, aTaskName: string; aLangChar: char; {UseMinGW,} LangModif: boolean{; SysDir: string});
     destructor Destroy; override;
     function getNumberOfSuccess : integer;
     procedure writeResult(TaskMess : string);
     procedure setMark(TaskName : string);
     procedure removeMark;
     property State:TResultsDatState read FState;
     function PupilName:string;
     property Path:string read FPath;
//2017.05>
     procedure RepBackupData(TaskMess, TaskInfo: string; var CommentCaption: string; var CommentColor: char);
//2017.05<
   end;


function CheckAccessDat(studname: string; var _RepHost, _RepDir, _RepLog, _RepPsw, _RepStud: string;
     var LocalMode: integer //2022.03
     ): integer;
{
 -1 - сертификат не найден
  0 - сертификат найден и с ним всё в порядке
  1 - сертификат нельзя открыть
  2 - сертификат испорчен
  3 - сертификат не активирован
  4 - имя студента не соответствует сертификату
  5 - не удалось создать каталог AccDirName
}

function AnsiToOem(s : string) : string;
function OemToAnsi(s : string) : string;

var AccessErrorMes: string;

implementation

uses SysUtils, xPlatform, ULocale, ansiutf8;

type
  string80 = string[78];
  string0 = ShortString;


   
var _RepHost, _RepDir, _RepLog, _RepPsw, _RepStud: string;
    _RepLocalMode: integer;
     PupilOEM, PupilAnsi: string;
    RND : integer;

function TResultsDat.PupilName: string;
begin
  result := PupilAnsi;
end;


function StudentCode(code : byte) : word;
var i,l : integer;
    n : word;
begin
n := 1;
l := length(pupilOEM);
for i := 1 to l do
  n := n + ord(pupilOEM[i]);
StudentCode := n + 1231 * code;
end;


function CodeStr(s : string80; num : integer) : string80;
var n,i,j,istud,iRND,n1,pos1,pos2,cnt,con1,con2 : integer;
    long : longint;
    s1 : string80;
    s2 : string0;
begin
  if num <= 2 then
    begin
      istud := 2453;
      iRND := 367;
      pos1 := 3;
      pos2 := 29;
    end
  else
    begin
      istud := StudentCode(num mod 10 + 1);
      iRND := RND;
      long :=abs(longint(longint(istud * 4768642) + longint(num * 89543752) + longint(iRnd*96731745)));
      pos1 := long mod 16 + 1;
      long :=abs(longint(longint(istud * 275384) + longint(num * 8456326) + longint(iRnd*6437853)));
      pos2 := long mod 16 + 17;
    end;
  cnt := 0;
  for i := 1 to length(s) do
    cnt := cnt + ord(s[i]);
  long :=abs(longint(longint(istud * 7653386) + longint(num * 4684364) + longint(iRnd*9867327) + longint(cnt * 2367564)));
  con1 := long mod 200 + 32;
  long :=abs(longint(longint(istud * 543286) + longint(num * 46234444) + longint(iRnd*46577237) + longint(cnt * 654384)));
  con2 := long mod 200 + 32;
  insert(chr(con2),s,pos2);
  insert(chr(con1),s,pos1);
  n := length(s);
  long :=abs(longint(longint(istud * 436829322) + longint(num * 225786533) + longint(iRnd*376434694)));
  Str(long,s2);
  for i := 1 to 10 - length(s2) do s2 := chr(i+48)+s2 ;
  s2 := Copy(s2,length(s2)-9,10);
  for i := 1 to n do
    begin
      n1 := ord(s[i]);
      j := ord(s2[(i mod 10)+1])-46;
      if n1 in [32..241] then s[i]:= chr(n1+j);//2006.03
    end;
  long := abs(longint(longint(istud * 4432082) + longint(num * 42736) + longint(iRnd*34694)));
  n1 := Long mod 25 + 4;
  for j:=1 to n1 do
    begin
      s1 := s;
      for i:=1 to n div 2 do
        s1[i] := s[2*i];
      for i:=1 to n div 2 do
        s1[length(s)-i+1] := s[2*i-1];
      if n mod 2 <> 0 then
        s1[n div 2 + 1] := s[n];
      s := s1;
    end;
  CodeStr := s;
end;


function DecodeStr(var s : string80; num : integer) : Boolean;
var n,n1,i,j,istud,iRND,pos1,pos2,con1,con2,cnt,con10,con20 : integer;
    long : longint;
    s1 : string80;
    s2 : string0;
begin
  if (length(s)<34)or(length(s)>78) then
    begin
      DecodeStr := False;
      Exit;
    end;
  if num <= 2 then
    begin
      istud := 2453;
      iRND := 367;
      pos1 := 3;
      pos2 := 29;
    end
  else
    begin
      istud := StudentCode(num mod 10 + 1);
      iRND := RND;
      long :=abs(longint(longint(istud * 4768642) + longint(num * 89543752) + longint(iRnd*96731745)));
      pos1 := long mod 16 + 1;
      long :=abs(longint(longint(istud * 275384) + longint(num * 8456326) + longint(iRnd*6437853)));
      pos2 := long mod 16 + 17;
    end;
  n := length(s);
  long := abs(longint(longint(istud * 4432082) + longint(num * 42736) + longint(iRnd*34694)));
  n1 := Long mod 25 + 4;
  for j := 1 to n1 do
  begin
    s1 := s;
    for i:=1 to n div 2 do
     begin
      s1[2*i-1]:= s[n-i+1];
      s1[2*i]:=s[i];
     end;
    if n mod 2 <> 0 then
    s1[n] := s[n div 2 + 1];
    s := s1;
  end;
  long :=abs(longint(longint(istud * 436829322) + longint(num * 225786533) + longint(iRnd*376434694)));
  Str(long,s2);
  for i := 1 to 10 - length(s2) do s2 := chr(i+48)+s2 ;
  s2 := Copy(s2,length(s2)-9,10);
  for i := 1 to n do
    begin
      n1 := ord(s[i]);
      j := ord(s2[(i mod 10)+1])-46;
      if n1 in [32..252] then s[i]:= chr(n1-j);
    end;
  con10 := ord(s[pos1]);
  delete(s,pos1,1);
  con20 := ord(s[pos2]);
  delete(s,pos2,1);
  cnt := 0;
  for i := 1 to length(s) do
    cnt := cnt + ord(s[i]);
  long :=abs(longint(longint(istud * 7653386) + longint(num * 4684364) + longint(iRnd*9867327) + longint(cnt * 2367564)));
  con1 := long mod 200 + 32;
  long :=abs(longint(longint(istud * 543286) + longint(num * 46234444) + longint(iRnd*46577237) + longint(cnt * 654384)));
  con2 := long mod 200 + 32;
  if (con1 <> con10) or (con2 <> con20) then DecodeStr := False
  else DecodeStr := True;
end;

function AnsiToOem(s : string) : string;
var i : integer;
begin
for i := 1 to length(s) do
  case ord(s[i]) of
  168 : s[i] := #240;
  184 : s[i] := #241;
  192..239 : s[i] := chr(ord(s[i])-64);
  240..255 : s[i] := chr(ord(s[i])-16);
  end;
Result := s;
end;

function OemToAnsi(s : string) : string;
var i : integer;
begin
for i := 1 to length(s) do
  case ord(s[i]) of
  128..175 : s[i] := chr(ord(s[i])+64);
  224..239 : s[i] := chr(ord(s[i])+16);
  240 : s[i] := #168;
  241 : s[i] := #184;
  end;
Result := s;
end;

constructor TResultsDat.Create(aPath, aTaskName: string; aLangChar: char; {UseMinGW,} LangModif: boolean{; SysDir: string});
var F : File of string80;
    s,s0,sCode : string80;
    j : integer;
    c: char;

begin
inherited Create;
LangChar := aLangChar;
FLangModif := LangModif;
FTaskName := aTaskName;
_RepHost := ''; //2017.05
//2017.08>
RepTaskMess := '';
RepTaskInfo := '';
//2017.08<
FPath := aPath;
Marked := False;
Winner := False;
//2009.10>
if aPath = '*' then
begin
  FState := rdNull;
  exit;
end;
if not FileExists(FPath+_results_dat) then
  FState := rdNotFound
else
  begin
    AssignFile(F,FPath+_results_dat);
    {$I-}
    Reset(F);
    {$I+}
    if IOResult <> 0 then
      begin
        FState := rdAccessDenied;
        exit;
      end;
    if FileSize(F) < 3 then
      begin
        FState := rdCorrupted;
        CloseFile(F);
        exit;
      end
    else
      begin
        read(F,s);
        read(F,s0);
        s0 := Trim(s0); {2006.01}
        read(F,s);
        CloseFile(F);
        if DecodeStr(s,2) then
           begin
             sCode := Copy(S,59,18);
             pupilOEM := Copy(S,3,25);
             while pupilOEM[length(pupilOEM)]=' ' do Delete(pupilOEM,length(pupilOEM),1);
             pupilANSI := OEMTOANSI(pupilOEM);
//2017.05>
             j := CheckAccessDat(pupilANSI, _RepHost, _RepDir, _RepLog, _RepPsw, _RepStud,
               _RepLocalMode); //2022.03
             if j > 0 then
             begin
               FState := rdAccessError;
               case j of
               1: AccessErrorMes := LocER('Access to the access.dat file is denied. ', 'Отказано в доступе к файлу access.dat. '); //SPTAccFileDenied;
               2: AccessErrorMes := LocER('Wrong format of access.dat. ', 'Файл access.dat имеет неверный формат. ');//SPTAccFileWrong;
               3: AccessErrorMes := LocER('The access.dat file is not activated. ', 'Файл access.dat не активирован. ');//SPTAccFileNotActivated;
               4: AccessErrorMes := LocER('The student names in the results file and in the access.dat file are different. ', 
                                          'Имя учащегося в файле результатов отличается от имени в файле access.dat. ');//SPTAccFileWrongStud;
               5: AccessErrorMes := Format(LocER('Could not create the "%s" directory. ',
                                                 'Не удалось создать резервный каталог "%s". '), [AccDirName]);  //SPTAccCannotCreateTempDir;
               end;
               exit;
             end;
//2017.05<
            Val(Copy(S,28,3),RND,j);
            FState := rdReady;
  {          j := 2;
            while not EOF(F) do
            begin
              read(F, s);
              Inc(j);
              DecodeStr(s, j);
              writeln(PT4AnsiToUtf8(OEMTOAnsi(s)));

            end;       }
          end;
//        CloseFile(F);
      end;
  end;
end;

destructor TResultsDat.Destroy;
begin
inherited Destroy;
end;

procedure TResultsDat.writeLast(datetime, TaskMess : string; n : integer);
var F : File of string80;
    s : string80;
//2013.09>
    TaskInfo: string;
//2013.09<
begin
if FState = rdNull then exit; //2009.10
AssignFile(F,{FPath+}_results_dat);
Reset(F);
Seek(F,FileSize(F));
if n > 1 then TaskMess := TaskMess + '--' + IntToStr(n);
s := Trim(FTaskName);
if s = '' then begin CloseFile(F); exit; end;
while length(s) < 12 do s := s + ' '; {VB&C}
s := s + LangChar;
TaskInfo := s + datetime;
s := s + datetime + ' ' + TaskMess;
s := CodeStr(ANSITOOEM(s),FileSize(F));
write(F,s);
CloseFile(F);
RepTaskMess := TaskMess;
if TaskIsFulfilledInfo(RepTaskMess) then //2020.06
begin
  Delete(RepTaskMess, 1, 13);
end;
RepTaskInfo := TaskInfo;
end;

procedure TResultsDat.getLast(var TaskName, datetime, TaskMess,
  TaskInfo: string; var n : integer);
var F : File of string80;
    s : string80;
    s0,sn : string;
    p,j : integer;
begin
if FState = rdNull then exit; //2009.10
TaskName := '';
datetime := '';
TaskMess := '';
n := 0;
AssignFile(F,{FPath+}_results_dat);
Reset(F);
if FileSize(F) > 3 then
  begin
  Seek(F,FIleSize(F)-1);
  read(F,s);
  if DecodeStr(s,FileSize(F)-1) then
    begin
      s0 := OEMTOANSI(s);
      TaskName := Trim(Copy(s0,1,12));
      datetime:= copy(s0,14,11);
      TaskMess := Copy(s0,26,100);
//2013.09>
      TaskInfo := Copy(s0,1,24);
//2013.09<
      n := 1;
      p := Pos('--',TaskMess);
      if p <> 0 then
        begin
          sn := Copy(TaskMess,p+2,100);
          val(sn,n,j);
          TaskMess := Copy(TaskMess,1,p-1);
        end;
     end;
  end;
CloseFile(F);
end;

function TResultsDat.getNumberOfSuccess : integer;
var F : File of string80;
    s : string80;
    s0,TaskName,TaskMess : string;
begin
if FState = rdNull then exit; //2009.10
Result := 0;
AssignFile(F,{FPath+}_results_dat);
Reset(F);
if FileSize(F) > 3 then
  begin
  Seek(F,FileSize(F)-1);
  read(F,s);
  if DecodeStr(s,FileSize(F)-1) then
    begin
      s0 := OEMTOANSI(s);
      TaskName := Trim(Copy(s0,1,12));
      if TaskName = FTaskName then
        begin
          TaskMess := Copy(s0,26,100);
          if TaskIsFulfilledInfo(TaskMess) then
            result := 10;
        end;
     end;
  end;
CloseFile(F);
end;


procedure TResultsDat.deleteLast;
var F : File of string80;
begin
if FState = rdNull then exit; //2009.10
AssignFile(F,{FPath+}_results_dat);
Reset(F);
if FileSize(F) > 3 then
  begin
  Seek(F,FIleSize(F)-1);
  Truncate(F);
  end;
CloseFile(F);
end;

procedure TResultsDat.setMark(TaskName : string);
begin
if FState = rdNull then exit; //2009.10
if (FState in [rdReady,rdWritten]) and not Marked then
  begin
  FTaskName := TaskName;
  Marked := True;
  writeLast(FormatDateTime('dd"/"mm hh":"nn',Now),
     LocER('The test run is interrupted.',
     'Выполнение задания прервано.'),1); //2020.06
  end;
end;

procedure TResultsDat.removeMark;
begin
if FState = rdNull then exit; //2009.10
if Marked then
  begin
  Marked := false;
  deleteLast;
  end;
end;

procedure TResultsDat.writeResult(TaskMess : string);
//2020.06 Для всех констант SPT выполняется обратное перекодирование
var oldTaskName, oldDatetime, oldTaskMess : string;
    iii, oldn : integer;
var TaskInfo: string;
begin

if FState = rdNull then exit; //2009.10
//TaskMess := PT4UTF8toAnsi(TaskMess); //2020.06 //2024.03 В ДАННОМ СЛУЧАЕ УЖЕ ИСПОЛЬЗУЕТСЯ КОДИРОВКА ANSI! 
if (FState in [rdReady,rdWritten]) and (Trim(FTaskName)<>'') then
  begin
//   if TaskForm.Demo then exit;
   if Marked then
      begin
        deleteLast;
        Marked := false;
      end;
//2013.09> На всякий случай, чтобы не записать ерунду в файл результатов
//    writeln('WriteRes1: ', taskMess);
    if length(taskMess)>45 then
      Delete(taskmess,46,length(taskmess));
//    writeln('WriteRes2: ', taskMess);
    for iii := 1 to length(taskmess) do
      if not (taskmess[iii] in [' '..#127,'А'..'я','Ё','ё']) then
      begin
//      writeln(iii, ' ', ord(taskmess[iii]), ' ''', taskmess[iii], '''');
        TaskMess[iii] := '?';
      end;
//    writeln('WriteRes3: ', taskMess);
//2013.09<
    getLast(oldTaskName, oldDatetime, oldTaskMess, TaskInfo, oldn);
    if oldTaskName <> FTaskName then
      begin
      writeLast(FormatDateTime('dd"/"mm hh":"nn',Now),
                TaskMess,1);
      if TaskIsFulfilledInfo(TaskMess) then Winner := True;
      FState := rdwritten;
      exit;
      end;
      (*
    if (Pos(PT4UTF8toAnsi(SPTCorrectResult),OldTaskMess) <> 0)
//2017.05>
       or (Pos(PT4UTF8toAnsi(SPTTaskIsChecked),OldTaskMess) <> 0) // если задание не только проверено задачником,
                                                  // но и подтверждено преподавателем
//2017.05<
    then
      begin
        FState := rdReady;
        deleteLast;
//2017.12>
//        writeResult(TaskMess);   // то же, что и для изменения информации об успешном выполнении задания.
                                   // число строк в файле результатов не должно уменьшиться!
        writeLast(FormatDateTime('dd"/"mm hh":"nn',Now),
                TaskMess,1);
        FState := rdwritten;
//2017.12<
        exit;
      end;
    if Pos(PT4UTF8toAnsi(SPTCorrectResult),TaskMess)<> 0 then
      begin
        writeLast(FormatDateTime('dd"/"mm hh":"nn',Now),
                TaskMess,1);
        FState := rdwritten;
        exit;
      end;
      *)
    if TaskIsFulfilledInfo(oldTaskMess) and TaskIsFulfilledInfo(TaskMess) then
        begin
          FState := rdwritten;
//2013.09>
//2007.04  BACKUPMODE // обработка случая, когда повторно запускается успешно выполненное задание
                      // (при этом в файл результатов нечего дополнительно не записывается,
                      // но текст решения может быть изменен, поэтому, возможно, его надо отправить в репозиторий)
//2017.08>
RepTaskMess := TaskMess;
if TaskIsFulfilledInfo(RepTaskMess) then
  Delete(RepTaskMess, 1, 13);
RepTaskInfo := TaskInfo;
//RepBackupData(TaskMess, TaskInfo); //2017.05
//2017.08<
//=======
//2013.09<
          exit;
        end;
    if TaskIsFulfilledInfo(oldTaskMess) then
        begin
          FState := rdReady;
          deleteLast;
//2017.12>
// Вместо рекурсивного вызова явно добавляется новая строка.
// Это сделано для того, чтобы размер файла не уменьшался
// в случае, если после сообщения об успешном решении будет получено
// сообщение об ошибка. Правда, в этой ситуации рядом могут оказаться
// одинаковые сообщения об ошибке, но это даже хорошо, поскольку
// их наличие будет показывать, что "между ними произошло что-то особое".
          writeLast(FormatDateTime('dd"/"mm hh":"nn',Now),TaskMess,1);
          FState := rdwritten;
//          writeResult(TaskMess);
//2017.12>
          exit;
        end;
    if FState = rdWritten then exit;
    FState := rdwritten;
    if oldTaskMess = TaskMess then
      begin
        inc(oldn);
        deleteLast;
      end
    else
      begin
        oldn := 1;
        oldDatetime := FormatDateTime('dd"/"mm hh":"nn',Now);
      end;
    writeLast(oldDatetime,TaskMess,oldn);
    if TaskIsFulfilledInfo(TaskMess) then Winner := True;
  end;
end;

function CheckAccessDat(studname: string; var _RepHost, _RepDir, _RepLog, _RepPsw, _RepStud: string;
     var LocalMode: integer //2022.03
     ): integer;
begin
  result := -1;  // ЗАГЛУШКА!
end;


procedure TResultsDat.RepBackupData(TaskMess, TaskInfo: string; var CommentCaption: string; var CommentColor: char);
begin
// ЗАГЛУШКА!
  CommentCaption := '';
  CommentColor := 'C';
end;


end.
