unit ucommon;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface

const
  PTVer = 'V5.1';
  MaxWidth = 80;
  UTDirName = '.pt/';
  UTLibName = 'lib/';
  UTLibCore = 'libpt5core.so';
  DatFileName = '$pt5dat$.dat';
  UseFileName = '$pt5use$.dat';
  HtmlFileName = '$pt5htm$.dat';
  maxItemSize = 810;  
  maxFileSize = 999;  
  maxFileCount = 20;   //Double size (we reserve items for result files)
  maxProcessCount = 36;
  HLine1 = #196;  // -
  HLine2 = #205;  // =
  ProcessInfoDelim = '|';
  PathDelim = '/';
  LineBreak = #13#10;
  LibExt    = '.so';

  ExternalDataMark1 = '[[!EXTMARK1!]]';
  ExternalDataMark2 = '[[!EXTMARK2!]]';

  lgPascal       = $0000001;
  lgPascalABCNET = $0000401;
  lgPascalABCNET_flag = $0000400; // ��������� � ������ 4.14
  lgPascalNET    = $0000400;
  lgVB           = $0000002;
  lgCPP          = $0000004;
  lg1C           = $0000040;
  lgPython       = $0000080;
  lgPython3      = $1000080; // ��������� � ������ 4.14
  lgPython3_flag = $1000000; // ��������� � ������ 4.14
  lgCS           = $0000100;
  lgVBNET        = $0000200;
  lgJava         = $0010000; // ��������� � ������ 4.11
  lgRuby         = $0020000; // ��������� � ������ 4.12
  lgWithPointers = $000003D;
  lgWithObjects  = $0FFFF80; // �������� � ������ 4.22
  lgNET          = $000FF00;
  lgAll          = $0FFFFFF; // �������� � ������ 4.10
  lgFS           = $0000800; // ��������� � ������ 4.18
  lgJulia        = $0040000; // ��������� � ������ 4.22
  lgC            = $0000008; // ��������� � ������ 4.23

type
  TData = record
    id: char;            // b, i, r, c, s      // I, R, C, S, T (files)
    n: real;             // used for b, i, r   // index in file array fdata
    s: string;           // used for c, s      // file name
    x, y, w, p, r: integer;  // r - rank       // x - ItemsInLine, y - start line y, w - width or y2 (for T), p - precision of reals, r - number of lines
                                               // rank is always = 0 for files
  end;

  TComment = record
    s: string;
    a: string;
    x, y: integer;
    end;

  TFile = record
    name: string;
    id: char;
    size: integer;
    n: array[0..maxFileSize - 1] of real;
    s: array[0..maxFileSize - 1] of string;
  end;

  TDataArray = array[0..maxItemSize - 1] of TData;  
  TCommentArray = array[0..maxItemSize - 1] of TComment; 
  TFileDataArray = array[0..maxFileCount - 1] of TData;  
  TFileArray = array[0..maxFileCount - 1] of TFile;

function RealToStr(r: real; w, p: integer): string; 
function AddFile(var fdata: TFileArray; var nfdata: integer; id: char; name: string; lang: integer): integer;
procedure AddFileData(var xfdata: TFileDataArray; var nxfdata: integer; id: char; name: string; items, y, w, p: integer;
                      var fdata: TFileArray; var nfdata, size: integer; lang: integer);
procedure DeleteFiles(Path, Mask:string);
function GetLibFile(SysDir, Topic, SLocale: string): string;

//function LangConstToLangName(n: integer): string;

implementation

uses SysUtils;

const
   libmain = '|BEGIN|INTEGER|BOOLEAN|IF|CASE|FOR|WHILE|PROC|FUNC'+
             '|STRING|FILE|TEXT|PARAM|RECUR|ZSERIES|ZMINMAX|ZARRAY|ZMATRIX|';
   libmpi  = '|MPI1PROC|MPI2SEND|MPI3COLL|MPI4TYPE|MPI5COMM|MPI6FILE|MPI7WIN|MPI8INTER|';
   liboop  = '|OOP0BEGIN|OOP1CREAT|OOP2STRUC|OOP3BEHAV|';
   libstl  = '|STL1ITER|STL2SEQ|STL3ALG|STL4STR|STL5ASSOC|STL6FUNC|STL7MIX';
   libdemo  = '|DEMOCPP|';
   libmpi9='|MPI9MATR|' ;


function GetLibFile(SysDir, Topic, SLocale: string): string;  // SLocale: en or ru
var d: array[1..2] of string;
    loc: array[1..2] of string;
    baselib, topics, utopic: string;
    i, j: integer;
begin
  d[1] := '';
  d[2] := SysDir + PathDelim + UTLibName;
  loc[1] := SLocale;
  if loc[1] = 'en' then
    loc[2] := 'ru'
  else
    loc[2] := 'en';
  utopic := Uppercase(Topic);
  if Copy(utopic, 1, 4) = 'MPI9' then
  begin
    baselib := 'libpt5mpi9';
    topics := libmpi9;
  end
  else if Copy(utopic, 1, 3) = 'OOP' then
  begin
    baselib := 'libpt5oop';
    topics := liboop;
  end
  else if Copy(utopic, 1, 3) = 'STL' then
  begin
    baselib := 'libpt5stl';
    topics := libstl;
  end
  else if Copy(utopic, 1, 4) = 'DEMO' then
  begin
    baselib := 'libpt5demo';
    topics := libdemo;
  end
  else if Copy(utopic, 1, 3) = 'MPI' then
  begin
    baselib := 'libpt5mpi';
    topics := libmpi;
  end
  else 
  begin
    baselib := 'libpt5';
    topics := libmain;
  end;
  if Pos('|' + utopic + '|', topics) > 0 then
  begin
    for i := 1 to 2 do
    begin
      result := d[2] + baselib + '_' + loc[i] + LibExt;
      if FileExists(result) then
        exit;
    end;
    result := '';
    exit;
  end;
  for i := 1 to 2 do
    for j := 1 to 2 do
    begin
      result := d[i] + 'PT5' + Topic + '_' + loc[j] + LibExt;
      if FileExists(result) then
        exit;
    end;
  result := '';
  
end;

procedure DeleteFiles(Path, Mask:string);
var DirInfo : TSearchRec;
    DosError : integer;
begin
  DosError := FindFirst(Path + Mask, faAnyfile, DirInfo);
  while DosError = 0 do
  begin
    if (faDirectory and DirInfo.Attr <> faDirectory) then
    begin
        DeleteFile(Path + ExtractFilePath(Mask) + DirInfo.Name);
    end;
{
    else
    if (DirInfo.Name<>'.') and (DirInfo.Name<>'..') then
    begin
      DeleteFiles(path + extractFileDir(Mask), '\' + DirInfo.Name + '\*.*');
    end;
}
    DosError:= FindNext(DirInfo);
  end;
  FindClose(DirInfo);
end;



function RealToStr(r: real; w, p: integer): string;
begin
  if p > 0 then
    result := Format('%*.*f',[w,p,r])
  else  //when p = 0
    result := Format('%*.*e',[w,w-7,r]);  
  p := Pos(',', result);
  if p > 0 then
     result[p] := '.';
end;

function AddFile(var fdata: TFileArray; var nfdata: integer; id: char; name: string; lang: integer): integer;
var fi: file of integer;
    fr: file of real;
    fc: file of char;
    fs: file of shortstring;
    ft: text;
    size, n, i: integer;
    r: real;
    c: char;
    s: shortstring;
    flag: boolean;
begin
  if nfdata >= maxFileCount then
  begin
    writeln('ERROR: too many files (> ', maxFileCount, ')');
    result := -2;
    exit;
  end;
  fdata[nfdata].name := name;
  fdata[nfdata].id := id;
  if not FileExists(name) then
  begin
    fdata[nfdata].size := -1;
    result := -1;
    Inc(nfdata);
    exit;
  end;
  size := 0;
  case id of
  'I': begin
         Assign(fi, name);
         Reset(fi);
         while not EOF(fi) and (size < maxFileSize) do
         begin
           read(fi, n);
           fdata[nfdata].n[size] := n;
           Inc(size);
         end;
         Close(fi);
       end;
  'R': begin
         Assign(fr, name);
         Reset(fr);
         while not EOF(fr) and (size < maxFileSize) do
         begin
           read(fr, r);
           fdata[nfdata].n[size] := r;
           Inc(size);
         end;
         Close(fr);
       end;
  'C': begin
         Assign(fc, name);
         Reset(fc);
         while not EOF(fc) and (size < maxFileSize) do
         begin
           read(fc, c);
           fdata[nfdata].s[size] := c;
           Inc(size);
         end;
         Close(fc);
       end;
  'S': begin
         if lang = lgPascal then
         begin
           Assign(fs, name);
           Reset(fs);
           while not EOF(fs) and (size < maxFileSize) do
           begin
             read(fs, s);
             fdata[nfdata].s[size] := s;
             Inc(size);
           end;
           Close(fs);
         end
         else  //C and C++
         begin
           Assign(fc, name);
           Reset(fc);
           while not EOF(fc) and (size < maxFileSize) do
           begin
             s := '';
             flag := true;
             for i := 1 to 80 do
             begin
               read(fc, c);
               if flag and (c <> #0) then
                 s := s + c
               else
                 flag := false;
             end;
             fdata[nfdata].s[size] := s;
             Inc(size);
           end;
           Close(fc);
         end;
       end;
  'T': begin
         Assign(ft, name);
         Reset(ft);
         while not EOF(ft) and (size < maxFileSize) do
         begin
           readln(ft, s);
           fdata[nfdata].s[size] := s;
           Inc(size);
         end;
         Close(ft);
       end;
  end;
  fdata[nfdata].size := size;
  result := size;
  Inc(nfdata);
end;

procedure AddFileData(var xfdata: TFileDataArray; var nxfdata: integer; id: char; name: string; items, y, w, p: integer;
                      var fdata: TFileArray; var nfdata, size: integer; lang: integer);
var lines: integer;
begin
  if nxfdata >= maxFileCount then
  begin
    writeln('ERROR: too many files (> ', maxFileCount, ')');
    exit;
  end;
  xfdata[nxfdata].id := id;
  xfdata[nxfdata].n := nfdata;  // index in the fdata array
  xfdata[nxfdata].s := name;
  size := AddFile(fdata, nfdata, id, name, lang);
  if items = 0 then
    if w > 0 then
      items := 72 div w
    else
      items := 1;
  lines := size div items;
  if size mod items > 0 then
    lines := lines + 1;
  if lines = 0 then
    lines := 1;
  xfdata[nxfdata].s := name;
  xfdata[nxfdata].x := items;
  xfdata[nxfdata].y := y;
  xfdata[nxfdata].w := w;
  xfdata[nxfdata].p := p;
  xfdata[nxfdata].r := lines;
  inc(nxfdata);
end;

begin

end.
