program pt5run;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

{$IFDEF WINDOWS}
uses Classes, SysUtils, Windows, Process, UData, UPrint, UCommon, USpecExt, PT4Html, UPreamble, ansiutf8,
     //StrUtils, ULocale, UResultsDat, xPlatform, UVariantDat{, PT4Zip};
{$ENDIF}
{$IFDEF LINUX}
uses Classes, SysUtils,Process, UData, UPrint, UCommon, USpecExt, PT4Html, UPreamble, ansiutf8,
      ULocale, UResultsDat, xPlatform, UVariantDat,StrUtils,dynlibs{, PT4Zip};
{$ENDIF}
type
  TInitGroup = function (name, code: PChar; lang: integer): integer; cdecl;  // 2024.03
  // �������� name ����� ����������, ����� ������� � ����� ������ ������������ � ���������� ��������
  // �������� code ���������� ��� ������ (������������ ��� ���������� ����������� � ����� results.dat)
  TInitTask = function (num, test: integer): integer; cdecl;
  TActivate = procedure (dllname: PChar); cdecl;

const 
  PathFile = UTDirName + 'ptpath.dat';
  OptFile = UTDirName + 'ptopt.dat';
  HtmlListFile = UTDirName + 'htmllist.dat';

var
  MainLibHandle: TLibHandle = 0;

var
  MainInitTask_: TInitTask;
  SysDir, CurDir, LangDir, TaskFile, TaskName, FileExt, Topic, GroupCode, SLang, TLang: string; 
   // TLang - ���� ��� �������� � ������� ��������� ��������
  ColorMode, Lang: integer;
  TaskCount, TestCount, TaskNum, CurTest, Timeout: integer;
  ExeName, Run, RArgs, RWD: string;
  ShowAllTests, DemoMode, HtmlMode, optT, optF, optD, optA, optS, utf8: boolean;
  AddInfo, StudName: string;
  CLang: char;   // CLang - ������ ����� ��� ���������� � ����� �����������
  VarInfo, RepInfo: string;
  aVarInfo, aRepInfo: char;
  outputDir: string;
procedure Error(errmes_ru, errmes_en: string); forward;

function SLangToLangName: string; // �������������� ������������ ����� ����� ���������������� � "��������" �����
begin
  if SLang = 'C' then
    result := 'C'
  else if SLang = 'CPP' then
    result := 'C++'
  else if SLang = 'PY' then
    result := 'Python'
  else
    Error('�������� ���� ���������������� [SLangToLangName]: ' + SLang, 
          'wrong programming language [SLangToLangName]: ' + SLang);
end;

function SLangToCLang: char; // �������������� ������������ ����� ����� ���������������� � ������� ����� ��� ����� results.dat
begin
  if SLang = 'C' then
    result := 'C'
  else if SLang = 'CPP' then
    result := 'c'
  else if SLang = 'PY' then
    result := 'y'
  else
    Error('�������� ���� ���������������� [SLangToCLang]: ' + SLang, 
          'wrong programming language [SLangToCLang]: ' + SLang);
end;

procedure PrintTaskText;
begin
  if optT then
     upPrintSection(upMiniTaskText)
  else
     upPrintSection(upTaskText);
end;

procedure PrintInfo;  // ����������� �� ������ ����������� ������ ��������� � ����������� ������
var printShowEndline: boolean;
begin
    upStartPrint;
    if optD and not upEmptySection(upShowRank) then
    begin
      upSetBorder(false);
      upPrintSection(upShowRank);
      upPrintSection(upShowEndLine);
    end
    else
    begin
      printShowEndline := false;
      upSetBorder(true);
//      upPrintSection(upHeader);
      upPrintSection(upStartLine);
  
      if not optS then
        PrintTaskText;
      if optF then
        upPrintSection(upMiniIOData)
      else
        upPrintSection(upIOData);
      if optS then
        PrintTaskText;

      upPrintSection(upHeader);
      upPrintSection(upEndLine);	
      upSetBorder(false);
      if not upEmptySection(upAddInfo) then
      begin
        if optA then
          upPrintSection(upMiniAddInfo)
        else
          upPrintSection(upAddInfo);
        printShowEndline := true;
      end;
      if not upEmptySection(upShowRank) then
      begin
        upPrintSection(upShowRank);
        printShowEndline := true;
      end;
      if printShowEndline then 
        upPrintSection(upShowEndLine);
    end;
end;

procedure PrintInfoDemo; // ����������� �� ������ ����������� ������ ��������� � ����-������
begin
    upStartPrint;
    upSetBorder(true);
    upPrintSection(upStartLine);
    if not optS then
      PrintTaskText;
    if optF then
      upPrintSection(upMiniIOData)
    else
      upPrintSection(upIOData);
    if optS then
      PrintTaskText;
    upPrintSection(upHeader);
    upPrintSection(upEndLine);	
    if not upEmptySection(upAddInfo) then
    begin
      upSetBorder(false);
      if optA then
        upPrintSection(upMiniAddInfo)
      else
        upPrintSection(upAddInfo);
      upPrintSection(upShowEndLine);
    end;
end;

procedure FreeLib(var handle: TLibHandle); // ���������� ����������� ������������ ����������
begin
  if handle <> 0 then
  begin
    {$IFDEF WINDOWS}
    FreeLibrary(handle);
    {$ENDIF}
    {$IFDEF LINUX}
    UnloadLibrary(handle);
    {$ENDIF}
    handle := 0;
  end;
end;

procedure Error(errmes_ru, errmes_en: string); // ������������� ���������� ������; ��� ����� �������� � ������������ ���������� ���������
begin
  writelnLoc('������: ' + errmes_ru +  '.', 'ERROR: ' + errmes_en + '.');
  FreeLib(MainLibHandle);
  DeleteFile(UTDirName + DatFileName);  
  DeleteAddFilesAndFreeObjects;  
  Halt(0);
end;

procedure WriteToFile(name, s: string); // �������� ���������� ����� � ������ � ���� ������������ ������
var f: TextFile;
begin
  AssignFile(f, name);
  {$I-}
  Rewrite(f);
  {$I+}
  if IOResult <> 0 then
    Error('�� ������� ������� ���� ' + name, 'cannot create file ' + name)
  else
      begin
      writeln(f, s);
      CloseFile(f);
      end;
end;

function FileSizeExt(name: string): integer;  // ������� ����������� �������� ����� � ������
var s: TSearchRec;
begin
  result := -1;
  if FindFirst(name, faAnyFile, s) = 0 then
    result := s.Size;
  SysUtils.FindClose(s);
end;

procedure LoadLib(libname: string; var handle: TLibHandle;  // �������� ������������ ���������� � ���������
                                                         // � �������� ������� � ��� ����������� �������������� �������
  var InitGroup_: TInitGroup;
  var InitTask_: TInitTask);
  var Activate_: TActivate;
begin
  FreeLib(handle);
  InitGroup_ := nil;
  InitTask_ := nil;
  Activate_ := nil;
  handle := LoadLibrary(PChar(libname));
  if handle = 0 then
     Error('�� ������� ��������� ���������� ' + libname, 'cannot load library ' + libname);
  {$IFDEF WINDOWS}
  Activate_ := TActivate(GetProcAddress(handle, 'activate'));
  {$ENDIF}
  {$IFDEF LINUX}
  Activate_ := TActivate(GetProcedureAddress(handle, 'activate'));
  {$ENDIF}
  if not Assigned(Activate_) then
  begin
      FreeLib(handle);
      Error('���������� ' + libname + ' �� �������� ������� activate',
            'library ' + libname + ' does not contain the activate function');
  end;
  {$IFDEF WINDOWS}
  InitGroup_ := TInitGroup(GetProcAddress(handle, 'initgroup'));
  {$ENDIF}
  {$IFDEF LINUX}
  InitGroup_ := TInitGroup(GetProcedureAddress(handle, 'initgroup'));
  {$ENDIF}
  if not Assigned(InitGroup_) then
  begin
      FreeLib(handle);
      Error('���������� ' + libname + ' �� �������� ������� initgroup',
            'library ' + libname + ' does not contain the initgroup function');
  end;
  {$IFDEF WINDOWS}
  InitTask_ := TInitTask(GetProcAddress(handle, 'inittask'));
  {$ENDIF}
  {$IFDEF LINUX}
  InitTask_ := TInitTask(GetProcedureAddress(handle, 'inittask'));
  {$ENDIF}
  if not Assigned(InitTask_) then
  begin
      FreeLib(handle);
      Error('���������� ' + libname + ' �� �������� ������� inittask',
            'library ' + libname + ' does not contain the inittask function');
  end;
  Activate_(PChar(SysDir + PathDelim + UTLibName + UTLibCore));
end;

function InitGroup(var name, code: string; lang: integer;   // �������-�������� ��� ������� InitGroup, ��������������� �� ����������
  InitGroup_: TInitGroup): integer;                         // �����: ����� name ������ var, ��� �������� ����� ����������!
var pname, pcode: PChar;
begin
  result := 0;
  if not Assigned(InitGroup_) then
      exit;
  SetLength(code, 15); // ����� ���� �� ����� 13 ��������
  pname := PChar(name);
  pcode := PChar(code);
  result := InitGroup_(pname, pcode, lang);
  code := string(pcode);
  name := string(pname);
end;

procedure CheckLib(var top, code: string; tnum: integer; var tcount: integer; var tname: string; // ����������� ����� ���������� � ���������,
  var handle: TLibHandle; var inittask_: TInitTask);                                          // �� �������� � �������������� ��������. 
var libname: string;
    initgroup_: TInitGroup;
begin
  libname := GetLibFile(SysDir, top, SLocale);
  writeln(libname);
  if libname = '' then
    Error('���������� � ��������� ��� ������ ' + top + ' �� �������',
          'task library for group ' + top + ' not found');
  LoadLib(libname, handle, initgroup_, inittask_);
  tcount := InitGroup(top, code, Lang, initgroup_);
  if tcount = 0 then
    Error('��� ����� ' + SLang + ' �� ������� ������ ������� ' + top,
          'task group ' + top + ' not found for ' + SLang + ' language');
  if tnum > tcount then
    Error('�������� ����� �������: ' + IntToStr(tnum) + ' (���������� ������� ����� ' + IntToStr(tcount) + ')',
          'wrong task number: ' + IntToStr(tnum) + ' (task count is ' + IntToStr(tcount) + ')');
  tname := top + IntToStr(TaskNum);      // ��� ������� �������������� � ������������ � "����������" ������ ������, ������������ �������� InitGroup                                    // (��� ����� TaskFile ���� �� ��������������, ��������� �� ��� ����� ������������, � �������
                                         // ��� �� � ������� ������, ���������� �� ��������, ��� ��� ������ ������).
                                         // ���� ������ ����� ��� ��� (��� ����������� �����), 
                                         // �� ��� ��� �������� ������������ "����������" ��� ������.

                                         // ��� Linux (��� �������������� �����) ��� �� ����� ��������, ��� ��� ��� ��� ������ ������ ���������������
                                         // ����� ����������. ���� ����� ��������� ��� ������.
end;


function InitTask(num, test: integer; InitTask_: TInitTask): integer; // �������-�������� ��� ������� InitTask, ��������������� �� ����������.
                                         // � ��� ������������� ������ �������� ��� �������� �������, ��������������� �� ������ ����� �������� UseTask
             
var f, f0: Text;
    useTopic, useCode, useTaskName, GrDescr: string;
    useTaskNum, useTaskCount: integer;
    s: string;
    useHandle: TLibHandle;
    useInitTask_: TInitTask;
begin
  result := 0;
  if not Assigned(InitTask_) then
      exit;
  DeleteFile(UTDirName + DatFileName);
  result := InitTask_(num, test);
  if FileExists(UTDirName + DatFileName) then
    exit;
  // ����������� ����� ������� ������������ �������� �������, ���������������� �� ������ ������ �������� UseTask.  
  // � ���� �������� �������� ���������� ������� �� ���� DatFileName, � ����������� ���� UseFileName,
  // ���������� ���������� � ������, �� ������� ���� ������������� �������.
  // ����� UseFileName ����� ����������� ����������.
  result := 0;
  GrDescr := '';
  while true do
  begin
    AssignFile(f, UTDirName + UseFileName);
    {$I-}
    Reset(f);
    {$I+}
    if IOResult <> 0 then exit;
    readln(f, s);
    if s <> PTVer then exit;
    readln(f, useTopic);
    readln(f, useTaskNum);
    if GrDescr = '' then
      readln(f, GrDescr);
    Close(f);
    CheckLib(useTopic, useCode, useTaskNum, useTaskCount, useTaskName, useHandle, useInitTask_);
    result := useInitTask_(useTaskNum, test);
    if FileExists(UTDirName + DatFileName) then
      break;
  end;
  // ���������� ��������� ����� ����� DatFileName
  AssignFile(f, UTDirName + DatFileName);
  Reset(f);
  AssignFile(f0, UTDirName + DatFileName + '0');
  Rewrite(f0);
  readln(f, s);  // PTVer
  writeln(f0, s);
  readln(f, s);  // Topic
  writeln(f0, Topic);
  readln(f, s);  // TaskNumber, TaskCount
  writeln(f0, TaskNum, ' ', TaskCount);
  readln(f, s);  // GrDescr
  writeln(f0, GrDescr);
  while not EOF(f) do
  begin
    readln(f, s);
    writeln(f0, s);
  end;
  Close(f);
  Close(f0);
  Erase(f);
  Rename(f0, UTDirName + DatFileName);
  DeleteFile(UTDirName + UseFileName);
end;

procedure CheckTaskName(s: string; var topic: string; var tasknum: integer); // ����������� ����� ������� �� ��� ���� � �����,
                                                                             // ���� ����� �����������, �� tasknum = -1
var s0: string;
begin
  s0 := '';
  while (s <> '') and (s[length(s)] in ['0'..'9']) do 
  begin
    s0 := s[length(s)] + s0;
    Delete(s, length(s), 1);
  end;
  if s0 = '' then
    tasknum := -1
  else
    tasknum := StrToInt(s0);
  topic := s;
end;

procedure CheckMainParams;  // ������ ���������� ��������� ������ � ����������� ���������� ����������
var p, j: integer;
    s, s0: string;
begin
  TaskFile := '';
  FileExt := '';
  Lang := -1;
  LangDir := '';
  TaskNum := -2;
  Topic := '';
  HtmlMode := false;
//  Locale := 0;     //2024.03
//  SLocale := 'en'; //2024.03 
  DemoMode := false;
  HtmlMode := false;
  ShowAllTests := false;
  if Uppercase(SLang) = 'C' then
  begin
    SLang := 'C';
    TLang := 'C';
    Lang := lgC;
    FileExt := '.c';
    LangDir := 'C' + pathdelim;
  end
  else if Uppercase(SLang) = 'CPP' then
  begin
    SLang := 'CPP';
    TLang := 'CPP';
    Lang := lgCPP;
    FileExt := '.cpp';
    LangDir := 'CPP' + pathdelim;
  end
  else if Uppercase(SLang) = 'PY' then
  begin
    SLang := 'PY';
    TLang := 'PYTHON-3';
    Lang := lgPython3;
    FileExt := '.py';
    LangDir := 'PY' + pathdelim;
  end
  else
    Error('������ �������� ���� (�������� �� c, cpp � py)',
          'wrong language name (not c, cpp or py)');
  if Pos('MPI', Uppercase(TaskName)) = 1 then // ��� ������� �� MPI ������������ ��������� �������
    LangDir := 'CPPMPI' + pathdelim;
  p := Pos('_EN', Uppercase(TaskName)); // 0 - English, 1 - Russian;
  if p > 0 then
  begin
    ChangeLocale(0);  
    Delete(TaskName, p, 3);
  end;
  p := Pos('_RU', Uppercase(TaskName));
  if p > 0 then
  begin
    ChangeLocale(1); 
    Delete(TaskName, p, 3);
  end;
  if TaskName = '#' then
  begin
    HtmlMode := true;
    exit;
  end;
  p := Pos('?', TaskName);
  if p > 0 then
  begin
    DemoMode := true;
    Delete(TaskName, p, 1);
  end;
  p := Pos('#', TaskName);
  if p > 0 then
  begin
    if not DemoMode then
      HtmlMode := true;
    Delete(TaskName, p, 1);
  end;
  p := Pos('!', TaskName);
  if p > 0 then
  begin
    ShowAllTests := true;  // ���������� ���������� ���� ������, � ��� ����� �������� 
    Delete(TaskName, p, 1);
  end;
  CheckTaskName(TaskName, Topic, TaskNum);
  if Topic = '' then
    Error('�� ������� ��� ������ �������',
          'empty task topic');
  if (TaskNum = -1) and not HtmlMode then  // ���� �� ������ ����� ������� � ��� ���� �� ������ ������ #, �� �������������
                                           // ���������� ����-�����, ������� � ������� 1. 
  begin
    DemoMode := true;
    TaskNum := 1;
    exit;
  end;
  if (TaskNum < 1) and not HtmlMode then
    Error('������ �������� ����� �������',
          'wrong task number');
  TaskFile := TaskName + FileExt;
end;

function GetSpecFileName(specname: string): string; // ������������� ����� ����� � ������ ������ ����� �������.
begin
  result := specname;
  if Uppercase(Copy(TaskName, 1, 3)) = 'MPI' then
    result := result + 'mpi';
  result := result + FileExt;
  if not FileExists(result) then
    Error('���� ' + result + ' �� ������',
          'file ' + result + ' not found');
end; 

procedure Replace(var s: string; s1, s2: string); // ������������� ������� ������ �����. 
var p: integer;
begin
  p := Pos(s1, s);
  while p > 0 do
  begin
    Delete(s, p, length(s1));
    Insert(s2, s, p);
    p := PosEx(s1, s, p + length(s2));
  end;
end;

procedure CopyFileExt(s1, s2, t1, t2: string); // ������� ����������� ���������� ����� � ������� ����� t1 �� ������ t2
var f1, f2: TextFile;
    s, dir: string;
begin
  Assign(f1, s1);
  {$I-}
  Reset(f1);
  {$I+}
  if IOResult <> 0 then
    Error('�� ������� ������� ���� ' + s1,
          'cannot open file ' + s1);
  dir := ExtractFileDir(s2);
  if not DirectoryExists(dir) then
    MkDir(dir);
  Assign(f2, s2);
  {$I-}
  Rewrite(f2);
  {$I+}
  if IOResult <> 0 then
  begin
    CloseFile(f1);
    Error('�� ������� ������� ���� ' + s2,
          'cannot create file ' + s2);
  end;
  while not EOF(f1) do
  begin
    readln(f1, s);
    if t1 <> t2 then
      Replace(s, t1, t2);
    writeln(f2, s);
  end;
  CloseFile(f1);
  CloseFile(f2);
end;

procedure CopyFileBin(s1, s2: string); // ������� ����������� ������ ����� � ������������ �������� ����������� ��� �����-�����
var f1, f2: file of byte;
    s, dir: string;
    b: array [1..2048] of byte;
    k: integer;
begin
  Assign(f1, s1);
  {$I-}
  Reset(f1);
  {$I+}
  if IOResult <> 0 then
    Error('�� ������� ������� ���� ' + s1,
          'cannot open file ' + s1);
  dir := ExtractFileDir(s2);
  if not DirectoryExists(dir) then
    MkDir(dir);
  Assign(f2, s2);
  {$I-}
  Rewrite(f2);
  {$I+}
  if IOResult <> 0 then
  begin
    CloseFile(f1);
    Error('�� ������� ������� ���� ' + s2,
          'cannot create file ' + s2);
  end;
  while not EOF(f1) do
  begin
    blockread(f1, b, 2048, k);
    blockwrite(f2, b, k, k);
  end;
  CloseFile(f1);
  CloseFile(f2);
end;

procedure ProcessTempl(var ss: string; templ: string; tnum: integer); // ��������������� �������, ���������� � ����������� �����-���������
                                                                      // ����������� ������������������ �� ���, ������ �� ����� ����������.
var p, i, num: integer;
    ss0, s0, sp, t, snum: string;
    digits: boolean;
begin
  ss0 := ss;
  p := Pos(templ, ss0);
  if p = 0 then
    exit;
  s0 := '';
  snum := '';
  digits := true;
  for i := p + 3 to length(ss0) do
    if ss0[i] = '>' then
    begin
      Delete(ss0, p, i - p + 1);
      break;
    end
    else if s0 = '' then
    begin
      if ss0[i] in ['0'..'9'] then
        snum := snum + ss0[i]
      else
        s0 := ss0[i];
    end
    else
      s0 := s0 + ss0[i];
  if (snum = '') or (s0 = '') then
    exit;
  num := StrToInt(snum);
  t := GetLoadText(SysDir, CurDir, Topic, SLocale, TLang, tnum, utf8);  // TLang - PY!  
  if t = '' then
    t := GetLoadText(SysDir, CurDir, s0, SLocale, TLang, tnum, utf8);   // TLang - PY!  
  sp := '';
  for i := 1 to num do
    sp := sp + ' ';
  for i := length(t) - 3 downto 1 do
    if (Copy(t, i, 2) = '%#') and (Copy(t, i + 2, 2) <> '%#') then
      Insert(sp, t, i + 2);
  Insert(t, ss0, p);
  ss := ss0;
end;


procedure CreateTaskFile;  // �������� �����-���������
var ss, s, fname: string;
    f: TextFile;
begin
  FileExt := LowerCase(FileExt);
  TaskFile := TaskName + FileExt;
  fname := GetSpecFileName(SysDir + PathDelim + LangDir + 'pt5templ');
  ss := '';
  AssignFile(f, fname);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then
    Error('�� ������� ������� ���� ' + fname,
          'cannot open file ' + fname);
  while not EOF(f) do
  begin
    readln(f, s);
    ss := ss + s + LineBreak;
  end;
  CloseFile(f);
  ProcessTempl(ss, '%x<', 0);
  ProcessTempl(ss, '%X<', TaskNum);
  Replace(ss, '%#', LineBreak);
  Replace(ss, '%f', TaskName);
  WriteToFile(TaskFile, ss);
end;

procedure Check(s, s0: string; var res: string);  // ������������� �����, ���������� �� ����� compl
begin
  if Copy(s, 1, length(s0)) <> s0 then
    exit;
  Delete(s, 1, length(s0));
  Replace(s, '${fileName}', TaskFile);
  Replace(s, '${fileDirname}', CurDir);
  Replace(s, '${exeName}', ExeName);
  res := s;
end;

function CreateParams(s: string): TStringList; // �������������� ������ � ������������� || � ������ �����
var p: integer;
    s0: string;
begin
  result := TStringList.Create;
  p := Pos('||', s);
  while p > 0 do
  begin
    s0 := Trim(Copy(s, 1, p - 1));
    if s0 <> '' then
      result.Add(s0);
    Delete(s, 1, p + 1);
    p := Pos('||', s);
  end;
  s0 := Trim(s);
  if s0 <> '' then
    result.Add(s0);
end;

procedure CheckAddFiles(s: string);  // ��������� �������������� ������
var p: integer;
// ��������� �������
procedure ProcessDest(dest: string);
var orig: string;
begin
    orig := SysDir + PathDelim + LangDir + dest;
    if not FileExists(orig) then
        Error('���� ' + orig + ' �� ������',
              'file ' + orig + ' not found');
    if FileSizeExt(orig) <> FileSizeExt(dest) then
    begin
        CopyFileBin(orig, dest);
    end;
end;
// ����� ��������� �������
begin
  p := Pos(';', s);    
  while p > 0 do
  begin
    ProcessDest(Trim(Copy(s, 1, p - 1)));
    Delete(s, 1, p);
    p := Pos(';', s);    
  end;
  ProcessDest(Trim(s));
end;

procedure GetInfoAndCompileTaskProgram(compile: boolean); // ������ ������ �� ����� compl � ���������� ������� ��������� 
                                                          // (���� compile = true)
var f: TextFile;
    proc: TProcess;
    params: TStringList;
    addfiles: string;
    s, complname, errmes: string;
    compiler, cargs, cwd: string;
    stimeout: string;
    j: integer;
begin
  addfiles := '';
  compiler := '';
  cargs := '';
  cwd := '';
  Run := '';
  RArgs := '';
  RWD := '';
  stimeout := '0';
  complname := GetSpecFileName(SysDir + PathDelim + LangDir + 'pt5compl');
  Assign(f, complname);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then
    Error('�� ������� ������� ���� ' + complname,
          'cannot open file ' + complname);
  while not EOF(f) do
  begin
    readln(f, s);
    s := Trim(s);
    Check(s, 'addfiles=', addfiles);
    Check(s, 'compiler=', compiler);
    Check(s, 'cargs=', cargs);
    Check(s, 'cwd=', cwd);
    if ExeName = '' then
      Check(s, 'exename=', ExeName);
    Check(s, 'run=', Run);
    Check(s, 'rargs=', RArgs);
    Check(s, 'rwd=', RWD);
    Check(s, 'timeout=', stimeout);
  end;
  CloseFile(f);
  if addfiles <> '' then
    CheckAddFiles(addfiles);  // �������������� ���������� �������������� ������!
  Timeout := 0;
  Val(stimeout, Timeout, j);
  if Timeout = 0 then
    Timeout := 1000;
if not compile or (ExeName = '') then
     exit;// ExeName = '' for Python
     //exit;
  // ���������� ������� ���������
  if FileExists(ExeName) then
    if not DeleteFile(PChar(ExeName)) then
      Error('�� ������� ������� ���������� ������ ����� ' + ExeName,
            'cannot delete old version of file ' + ExeName);
  if compiler <> '' then
    if not FileExists(compiler) then
      Error('���������� �� ������: ' + compiler,
            'compiler not found: ' + compiler);
  proc := TProcess.Create(nil);
  proc.Executable := compiler;
  if cargs <> '' then
      proc.Parameters := CreateParams(cargs);
  proc.CurrentDirectory := cwd;
  proc.Execute;
  proc.WaitOnExit();
  proc.Free;             
end;

procedure LoadOptions;  // �������� ����� �� ����� OptFile
var f: TextFile;
    s, opt: string;
    i: integer;
begin
  optT := false; 
  optF := false; 
  optD := false;
  optA := false;
  optS := false;
  ColorMode := 0;
  opt := '';
  if FileExists(OptFile) then
  begin
    AssignFile(f, OptFile);
    {$I-}
    Reset(f);
    {$I+}
    if IOResult <> 0 then
       exit;
    readln(f, opt);
    CloseFile(f);
    for i := 1 to length(opt) do
      case opt[i] of
      't': optT := true;
      'f': optF := true;
      'd': optD := true;
      'a': optA := true;
      's': optS := true;
      'n': ColorMode := 0;
      'w': ColorMode := 1;
      'b': ColorMode := 2;
//2024.03>
      'r': ChangeLocale(1); 
      'e': ChangeLocale(0); 
//2024.03<
      end;
  end;
end;

procedure SaveOptions;  // ���������� ����� � ����� OptFile
var f1, f2: TextFile;
    s, opt: string;
    fopt, futpath: boolean;
begin
  opt := '';
  if optT then
    opt := opt + 't';
  if optF then
    opt := opt + 'f';
  if optD then
    opt := opt + 'd';
  if optA then
    opt := opt + 'a';
  if optS then
    opt := opt + 's';
  case ColorMode of
  0: opt := opt + 'n';
  1: opt := opt + 'w';
  2: opt := opt + 'b';
  end;
  case Locale of
  0: opt := opt + 'e';
  1: opt := opt + 'r';
  end;
  WriteToFile(OptFile, opt);
end;

procedure RunHtmlMode(currenttask: boolean);    // ����������� ������ ������� � ���� html-���������
const maxItems = 250;
var topics: array[0..maxItems - 1] of string;
    nums: array[0..maxItems - 1] of integer;
    n, i: integer;
    rawtext, addinfo: string;
// ������ �������� ��������� �������
procedure ProcessHtmlList(name: string);  // ��������� ����� �� ������� �������
var f: TextFile;
    s, topic: string;
    num: integer;
begin
  AssignFile(f, name);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then
  begin
    Error('������ html �� ������: ' + name,
          'html list not found: ' + name);
    exit;
  end;
  while not EOF(f) do
  begin
    readln(f, s);
    s := Trim(s);
    if s <> '' then
    begin
      CheckTaskName(s, topics[n], nums[n]);
      Inc(n);
    end;
  end;
  CloseFile(f);
end;

function GetRawText: string;  // ��������� ������ ������� ������ � �������������� ����������� �� ����� ����������
var i: integer;
    s: string;
    utf8:boolean;
begin
  result := '';
  if not currenttask then
  begin
  TestCount := InitTask(TaskNum, 0, MainInitTask_);
  if (TestCount = 0) or not LoadData then
      Error('�� ������� ������� ������ ��� ������� ' + TaskName,
            'cannot create data for the task ' + TaskName);
  end;
  result :=  GetRawTaskText;
  s := GetHtmlText(SysDir, CurDir, Topic, SLocale, // �������� �������������� ���������� �� ����� ����������, ���� �� ���������� 
        TLang, TaskNum, TaskCount, utf8);  // TLang - PY!
  if s <> '' then
  begin
    if not utf8 then
      addinfo := addinfo + s + ExternalDataMark1
    else
      addinfo := addinfo + UTFTextMark + s + UTFTextMark + ExternalDataMark1;
    result := result + ' ' + ExternalDataMark1;
  end;
  result := result + #13#10;
end;

function GetRawString(k: integer): string; // ������ ��������� ������ ������� �� ������ (� ��� ����� ���� ������� ��������� ������,
                                           // ���� ����� ������� �� ������)
var i: integer;
    s: string;
begin
  result := '';
  Topic := topics[k];
  TaskNum := nums[k];
  if TaskNum = -1 then
    TaskNum := 1;
  TaskName := Topic + IntToStr(TaskNum);
  if not currenttask then
    CheckLib(Topic, GroupCode, TaskNum, TaskCount, TaskName, MainLibHandle, MainInitTask_);
  s := GetHtmlText(SysDir, CurDir, Topic, SLocale, 
        // �������� �������������� ���������� � ���������� �� ����� ����������, ���� �� ���������� 
        TLang, 0, TaskCount, utf8);  // TLang - PY!
  if s <> '' then
  begin
    if s[1] <> _PreambleStart then
      s := _PreambleStart + _PreambleEnd + s;
    SetHtmlPreamble(Topic, s);
  end;
  result := GetRawText;
  if nums[k] = -1 then
     for i := 2 to TaskCount do
     begin
       TaskNum := i;
       TaskName := Topic + IntToStr(TaskNum);
       result := result + GetRawText;
     end;
  if not currenttask then
    FreeLib(MainLibHandle);
end;
// ����� �������� ��������� �������
begin
   HtmlInit(Lang, SLocale, SysDir); 
   InitHtmlPreambles;
   n := 0;
   if TaskName = '#' then
     ProcessHtmlList(HtmlListFile)
   else 
   begin
     topics[0] := Topic;
     nums[0] := TaskNum;
     n := 1;
   end;
   rawtext := '';
   addinfo := '';
   for i := 0 to n - 1 do
   begin
      rawtext := rawtext + GetRawString(i);
//   writeln(rawtext);
   end;
   if addinfo <> '' then
      rawtext := rawtext + ExternalDataMark2 + addinfo;
   ProcessHtmlText(rawtext);
   if not currenttask then
     DeleteFile(UTDirName + DatFileName);  
end;



procedure ProcessKeys;  // ��������� ������� ������
var i, num, j: integer;
    opt, snum: string;
    refreshData: boolean;
begin
  WriteLoc('[ENTER - �����, ? - �������] PT5Run> ',
           '[ENTER - quit, ? - info] PT5Run> ');
  readln(opt);
  while opt <> '' do
  begin
    refreshData := false;
    snum := '';
    num := 0;
    for i := 1 to length(opt) do
	case opt[i] of
	't': optT := not optT;
	'f': optF := not optF;
	'a': optA := not optA;
	's': optS := not optS;
	'd': if not DemoMode then 
	       optD := not optD;
	'n': begin
	       ColorMode := 0;
   	       upSetColorMode(0);
   	     end;
	'w': begin
	       ColorMode := 1;
               upSetColorMode(1);
             end;
	'b': begin
	       ColorMode := 2;
	       upSetColorMode(2);
	     end;
	'=': if DemoMode then
	       refreshData := true;
	'+': if DemoMode then
	     begin
	       refreshData := true;
	       TaskNum := TaskNum + 1;
	       if TaskNum > TaskCount then
	         TaskNum := 1;
	     end;
	'-': if DemoMode then
	     begin
	       refreshData := true;
	       TaskNum := TaskNum - 1;
	       if TaskNum = 0 then
	         TaskNum := TaskCount;
	     end;
	'*': if not DemoMode and (GetProcessCount > 0) and testShowRank(-1) then
  	       makeShowRank(-1);
  	'#': RunHtmlMode(true);
	'0'..'9': if DemoMode or (GetProcessCount > 0) then
	     begin
	       snum := snum + opt[i];
	       if (i = length(opt)) or not (opt[i + 1] in ['0'..'9']) then
	       begin
	         Val(snum, num, j);
	         if DemoMode then
	         begin
  	           if (num > 0) and (num <= TaskCount) then
	           begin
   	             refreshData := true;
   	             TaskNum := num;
	           end;
	         end
	         else
	         begin
	           if (num > -1) and testShowRank(num) then
      	             makeShowRank(num);
	         end;
	         snum := '';
	       end;
	     end;
	end;
    if not DemoMode then	
    begin
      PrintInfo;	
    end
    else
    begin
      if refreshData then
      begin
        TestCount := InitTask(TaskNum, 0, MainInitTask_);
        if (TestCount = 0) or not LoadData then
          Error('�� ������� ������� ������ ��� ������� ' + Topic + IntToStr(TaskNum),
                'cannot create data for the task ' + Topic + IntToStr(TaskNum));
        DeleteFile(UTDirName + DatFileName);  
        AddInfo := GetPlainText(SysDir, CurDir, Topic, SLocale, 
          // ��������� �������������� ���������� �� ����� ����������, ���� �� ���������� 
          TLang, TaskNum, TaskCount, utf8);  // TLang - PY!
        CheckVariantDat(StudName, Topic + IntToStr(TaskNum), VarInfo, aVarInfo);
        PrintTaskDemo(AddInfo, utf8, StudName, VarInfo, aVarInfo);
      end;
      PrintInfoDemo;
    end;
    if Pos('?', opt) > 0 then
      if not DemoMode then
      begin
        writelnLoc('  === Programming Taskbook 5.1 for ' + SLangToLangName + ' (����������� �����) ===',
                   '  === Programming Taskbook 5.1 for ' + SLangToLangName + ' (standard mode) ===');
        writelnLoc('  ? - ����� ���� �������,  f - ��������/���������� ���������� ��������� ������,',
                   '  ? - show this info,      f - collapse/expand content of text files,');
        writelnLoc('  a - ������/�������� �������������� ����������, ���� ��� ����������,',
                   '  a - hide/show additional info if additional info is not empty,');
        writelnLoc('  s - �������� ������� ������ � ������������� � ������� � �������,',
                   '  s - swap task text section and data sections,');
        writelnLoc('  t - ������/�������� ������������, d - �������� ������ ������� / ��� �������,',
                   '  t - hide/show task text, d - hide/show task info if debug info is not empty,');
        if GetProcessCount > 1 then
        writelnLoc('  * - �������� ��� ���������� ����������, NUMBER - ������ ��� �������� NUMBER,',
                   '  * - show all debug info, NUMBER - show debug info for process of rank NUMBER,');
        writelnLoc('  # - �������� ������� � ���� html,',
                   '  # - show task in html format,');
        writelnLoc('  w - ������� �����,  b - ������ �����,  n - �� ��������� �����,  ENTER - �����',
                   '  w - white color scheme,  b - black color scheme,  n - no color,  ENTER - quit');
      end
      else
      begin
        writelnLoc('  === Programming Taskbook 5.1 for ' + SLangToLangName + ' (����-�����) ===',
                   '  === Programming Taskbook 5.1 for ' + SLangToLangName + ' (demo mode) ===');
        writelnLoc('  ? - ����� ���� �������,  f - ��������/���������� ���������� ��������� ������,',
                   '  ? - show this info,      f - collapse/expand content of text files,');
        writelnLoc('  a - ������/�������� �������������� ����������, ���� ��� ����������,',
                   '  a - hide/show additional info if additional info is not empty,');
        writelnLoc('  s - �������� ������� ������ � ������������� � ������� � �������,',
                   '  s - swap task text section and data sections,');
        writelnLoc('  t - ������/�������� ������������,  NUMBER - �������� ������� ����� NUMBER,',
                   '  t - hide/show task text, NUMBER (one or more digits) - task with this number,');
        writelnLoc('  = - ����� �������� ������,  + - ��������� �������,  - - ���������� �������,',
                   '  = - new data for the current task,  + - next task,  - - previous task,');
        writelnLoc('  # - �������� ������� � ���� html,',
                   '  # - show task in html format,');
        writelnLoc('  w - ������� �����,  b - ������ �����,  n - �� ��������� �����,  ENTER - �����',
                   '  w - white color scheme,  b - black color scheme,  n - no color,  ENTER - quit');
      end;
    write('PT5Run> ');
    readln(opt);
  end;
end;

procedure PrintCommandLine(cmd: string; params: TStringList); // ����� �� ����� ��������� ������ (������������ � ������ ������������� ����������)
var s: string;
    i, p: integer;
begin
  s := '"' + cmd + '" ';
  for i := 0 to params.Count - 1 do
  begin
    p := Pos(' ', params[i]);
    if p > 0 then
      s := s + '"' + params[i] + '" '
    else
      s := s + params[i] + ' ';
  end;
  writeln(s);
end;

procedure CheckResultsDat;
var res: TResultsDat;
begin
  res := TResultsDat.Create(CurDir+PathDelim, '', ' ', false);
  case res.State of
  rdNotFound: StudName := '';
  rdReady: StudName := {StudentMsg +} res.PupilName; // �� ������� ���������� �����: � ��� ����, ��� ����������� ��� ��������
  rdAccessDenied: Error('�� ������� ������� ���� ����������� '+_results_dat, 'cannot open the '+_results_dat+ ' file');
  rdCorrupted: Error('���� ����������� '+_results_dat +' ����� �������� ������', 'wrong format for the '+_results_dat+ ' file');
  rdAccessError: Error(AccessErrorMes, AccessErrorMes);
  else Error('������ ��� ������� � ����� '+_results_dat, 'file '+_results_dat+ ' access error');
  end;
  res.Free;
end;

procedure SaveResultsDatInfo(mess: string; var RepInfo: string; var aRepInfo: char);
var res: TResultsDat;
begin
  if StudName = '' then
    exit;
  res := TResultsDat.Create(CurDir+PathDelim, TaskName, SLangToCLang, false);
  if res.State = rdReady then
    res.WriteResult(mess) // mess ������ ���� � ��������� ANSI!!
  else if res.State <> rdNotFound then
    Error('������ ��� ������� � ����� '+_results_dat + ' [SaveResultsDatInfo]', 'file '+_results_dat+ ' access error [SaveResultsDatInfo]');
  res.RepBackupData(res.RepTaskMess, res.RepTaskInfo, RepInfo, aRepInfo); //2024.04
  res.Free;
end;

{
procedure writechar;
var s: string;
    i: integer;
begin
  for i := 32 to 255 do
    s := s + chr(i);
  writeln(PT4AnsiToUTF8(s));
end;
}

// �������� ���������
//===============================================================================================
//===============================================================================================
var i, j: integer;
    b, optTorig: boolean;
    s: string;
    n1, n2: integer;
    proc: TProcess;
    params: TStringList;
    tt: TextFile;
    ff: File of char;
    c: char;
    infobrief: string;
begin
  {$IFDEF WINDOWS}
  UTF8ConsoleInit;
  {$ENDIF}


  CurDir := GetCurrentDir;
  SysDir := ExtractFileDir(ParamStr(0)); // ��� "\"! ��� ������������� ���� ������������ PathDelim
  LangDir := '';
  if ParamCount < 2 then
  begin
    writeln('Programming Taskbook 5.1'); // [-n|-b|-w]');
    writelnLoc('������: pt5run.exe <������>[<�����>][?|#|!][_ru|_en] c|cpp',
               'USING: pt5run.exe <topic>[<num>][?|#|!][_ru|_en] c|cpp');
    writelnLoc('? - ����-�����, # - �������� html, ! - �������� ���������� ���� ������',
               '? - demo mode, # - show html, ! - show all test results');
    exit;
  end;
  TaskName := ParamStr(1);
  SLang := ParamStr(2);

  LoadOptions; //2024.03

  CheckMainParams;
  SetLocaleConsts(SLangToLangName);
  ExeName := '';
  for i := 3 to ParamCount do
    if Copy(ParamStr(i), 1, 2) = '-E' then
    begin
        ExeName := SysDir+ PathDelim + Copy(ParamStr(i), 3, length(ParamStr(i)));
        if not FileExists(ExeName) then
           Error('�������� �������� -E: ���� ' + ExeName + ' �� ������',
                 'wrong -E parameter: file ' + ExeName + ' not found');
    end
    else
        Error('�������� �������� ��������� ������: ' + ParamStr(i),
              'wrong command-line parameter: ' + ParamStr(i));

  if (UTDirName <> '') and not DirectoryExists(UTDirName) then
      MkDir(UTDirName);
  if not FileExists(PathFile) then
      WriteToFile(PathFile, ParamStr(0));
  if HtmlMode then  // special html mode
  begin
    RunHtmlMode(false);
    DeleteAddFilesAndFreeObjects;
    exit;
  end;
  StudName := '';
  CheckResultsDat;
  CheckLib(Topic, GroupCode, TaskNum, TaskCount, TaskName, MainLibHandle, MainInitTask_);
// ������ ��� ��������� ��������� � �������� �����������

  CurTest := 1;
  if not DemoMode and (ExeName = '') and not FileExists(TaskFile) then  // � ����-������ ��� ��� ������������� exe-�����
                                                                        // ���� � ���������� �� ���������
                                                                        // ��� �������� ����� � ���������� ������������ ������������������ ��� ������
                                                                        // ������������ �������� InitGroup, � ����������, ����������� � ������� ��������
  CreateTaskFile;
  GetInfoAndCompileTaskProgram(not DemoMode and (ExeName = ''));  // � ����-������ ��� ��� ������������� exe-�����                                                                  // ���������� �� ���������
  if not DemoMode and (ExeName <> '') then
    if not FileExists(ExeName) then
      Error('���������� ������ ����������',
            'compilation errors detected');

  // ExeName = '' � ����������� ������� (��������, ��� ����� Python)

//  LoadOptions; //2024.03 - ������� ����!
  upSetColorMode(ColorMode);

  AddInfo := GetPlainText(SysDir, CurDir, Topic, SLocale, 
    // ��������� �������������� ���������� �� ����� ����������, ���� �� ���������� 
    TLang, TaskNum, TaskCount, utf8);  // TLang - PY!

 
  optTorig := optT;  // ��������� �������� ��������� optT

  if not DemoMode then // Standard Mode
  begin
    while true do
    begin
    TestCount := InitTask(TaskNum, CurTest, MainInitTask_);
      if (TestCount = 0) or not LoadData then
        Error('�� ������� ������� ���� ��� ������� ' + TaskName,
              'cannot create data for the task ' + TaskName);
      DeleteFile(UTDirName + DatFileName);
      CreateAddFiles;
      proc := TProcess.Create(nil);
      proc.Executable := Run;
      if RArgs <> '' then
      begin
        s := RArgs;
        Replace(s, '${procNum}', IntToStr(GetProcessCount));
        params := CreateParams(s);
        proc.Parameters := params;
      end;
      proc.CurrentDirectory := RWD;
      proc.Execute;
      {$IFDEF WINDOWS}
      b := proc.WaitOnExit(Timeout);
      {$ENDIF}
      {$IFDEF LINUX}
      b := proc.WaitOnExit;
      {$ENDIF}

      if not b then
        proc.Terminate(0);
      proc.Free;             
      if not b then
        writelnLoc('��������� ��������� �������� ��-�� ���������� ������ ������� (' + IntToStr(Timeout) + ' ��)',
                   'The program was terminated early due to exceeding the timeout (' + IntToStr(Timeout) + ' ms)');
      if CheckAllResults and (CurTest < TestCount) then
      begin
        if ShowAllTests then
        begin
          if GetProcessCount > 1 then
            PrintCommandLine(Run, params);
          PrintTask('', utf8, '', '', 'C', '', 'C'); // ��� ���������� �������� �������� �� ���������� �������������� ���������� � ������ � �������� � � ��������
          MakeShowRank(-1);
          optT := true; // ��� ���������� �������� �������� �� ���������� ������������ ������
          PrintInfo;
          writeln;
        end;
        Inc(CurTest);
      end
      else
      begin
        if GetProcessCount > 1 then
          PrintCommandLine(Run, params);
        infobrief := GroupCode; // ���� ������� ���������, �� � ���� results.dat ������������� ����������� ��� ������!
        SetHeaderInfoBrief(infobrief); // ����������� �������� ��������� ��� ����� ����������� � ��� �����������
        CheckVariantDat(StudName, TaskName, VarInfo, aVarInfo);
        if infobrief = '' then
          Error('����������� ���������� ��� ����� �����������', 'no information for the results file');
        SaveResultsDatInfo(infobrief, RepInfo, aRepInfo);  // ������ ����������� � ���� � � �����������, 
                                                           // ������� ���������� � ���������� ���������� � �����������
        PrintTask(AddInfo, utf8, StudName, VarInfo, aVarInfo, RepInfo, aRepInfo);
        break;
      end;
    end;  
    FreeLib(MainLibHandle);
    DeleteDatFiles;   
    MakeShowRank(-1);
    optT := optTorig;  // ��������������� �������� ��������� optT
    PrintInfo;
    ProcessKeys;
  end
  else  //Demo Mode
  begin
      TestCount := InitTask(TaskNum, 0, MainInitTask_);
      if (TestCount = 0) or not LoadData then
        Error('�� ������� ������� ������ ��� ������� ' + TaskName,
              'cannot create data for the task ' + TaskName);
      DeleteFile(UTDirName + DatFileName);  
      CheckVariantDat(StudName, TaskName, VarInfo, aVarInfo);
      PrintTaskDemo(AddInfo, utf8, StudName, VarInfo, aVarInfo);
      optT := false;  // � ������ ����-������ ������������ ������� ������ ������������
      MakeShowRank(-1);
      PrintInfoDemo;
      ProcessKeys;
  end;
  FreeLib(MainLibHandle);
  SaveOptions;
  DeleteAddFilesAndFreeObjects;  
end.

