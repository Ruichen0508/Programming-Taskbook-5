//ver 2.1
{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit PT5MakeCore;

{$MODE Delphi}

interface

const
  xCenter = 0;
  xLeft = 100;
  xRight = 200;

  SampleError = '#ERROR?';
  MaxLineCount = 50;
  
  lgPascal       = $0000001;
  lgPascalABCNET = $0000401;
  lgPascalABCNET_flag = $0000400; // добавлено в версии 4.14
  lgPascalNET    = $0000400;
  lgVB           = $0000002;
  lgCPP          = $0000004;
  lg1C           = $0000040;
  lgPython       = $0000080;
  lgPython3      = $1000080; // добавлено в версии 4.14
  lgPython3_flag = $1000000; // добавлено в версии 4.14
  lgCS           = $0000100;
  lgVBNET        = $0000200;
  lgJava         = $0010000; // добавлено в версии 4.11
  lgRuby         = $0020000; // добавлено в версии 4.12
  lgWithPointers = $000003D;
  lgWithObjects  = $0FFFF80; // изменено в версии 4.22
  lgNET          = $000FF00;
  lgAll          = $0FFFFFF; // изменено в версии 4.10
  lgFS           = $0000800; // добавлено в версии 4.18
  lgJulia        = $0040000; // добавлено в версии 4.22
  lgC            = $0000008; // добавлено в версии 4.23

type
  TInitTaskProc = procedure(n: integer); stdcall;

procedure SetGroupData(topic, descr, author, key: string; n: integer);
procedure ClearGroupData;
function GetTopic: string;
function GetTaskCount: integer;
function SetTaskData(task, test: integer): string;
function GetTestCount: integer;
function GetCode: string;

procedure Start(name, topic, author, key: string; lvl: integer);
procedure getVariant(code,nv1,nv2,nv3 : byte; var v1,v2,v3 : byte);

procedure taskText(s: string; x,y: integer); overload;
procedure dataComment(cmt: string; x,y: integer);
procedure dataB(cmt: string; a: boolean; x,y: integer); overload;
procedure dataN(cmt: string; a: integer; x,y,w: integer); overload;
procedure dataN2(cmt: string; a1, a2: integer; x,y,w: integer); overload;
procedure dataN3(cmt: string; a1, a2, a3: integer; x,y,w: integer); overload;
procedure dataR(cmt: string; a: real; x,y,w: integer); overload;
procedure dataR2(cmt: string; a1, a2: real; x,y,w: integer); overload;
procedure dataR3(cmt: string; a1, a2, a3: real; x,y,w: integer); overload;
procedure dataC(cmt: string; a: char; x,y: integer); overload;
procedure dataS(cmt: string; a: string; x,y: integer); overload;
procedure resultComment(cmt: string; x,y: integer);
procedure resultB(cmt: string; a: boolean; x,y: integer); overload;
procedure resultN(cmt: string; a: integer; x,y,w: integer); overload;
procedure resultN2(cmt: string; a1, a2: integer; x,y,w: integer); overload;
procedure resultN3(cmt: string; a1, a2, a3: integer; x,y,w: integer); overload;
procedure resultR(cmt: string; a: real; x,y,w: integer); overload;
procedure resultR2(cmt: string; a1, a2: real; x,y,w: integer); overload;
procedure resultR3(cmt: string; a1, a2, a3: real; x,y,w: integer); overload;
procedure resultC(cmt: string; a: char; x,y: integer); overload;
procedure resultS(cmt: string; a: string; x,y: integer); overload;


procedure dataB(a: boolean; x,y: integer); overload;
procedure dataN(a: integer; x,y,w: integer); overload;
procedure dataN2(a1, a2: integer; x,y,w: integer); overload;
procedure dataN3(a1, a2, a3: integer; x,y,w: integer); overload;
procedure dataR(a: real; x,y,w: integer); overload;
procedure dataR2(a1, a2: real; x,y,w: integer); overload;
procedure dataR3(a1, a2, a3: real; x,y,w: integer); overload;
procedure dataC(a: char; x,y: integer); overload;
procedure dataS(a: string; x,y: integer); overload;
procedure resultB(a: boolean; x,y: integer); overload;
procedure resultN(a: integer; x,y,w: integer); overload;
procedure resultN2(a1, a2: integer; x,y,w: integer); overload;
procedure resultN3(a1, a2, a3: integer; x,y,w: integer); overload;
procedure resultR(a: real; x,y,w: integer); overload;
procedure resultR2(a1, a2: real; x,y,w: integer); overload;
procedure resultR3(a1, a2, a3: real; x,y,w: integer); overload;
procedure resultC(a: char; x,y: integer); overload;
procedure resultS(a: string; x,y: integer); overload;


procedure SetNumberOfTests(n: integer);
procedure SetNumberOfUsedData(n: integer);
procedure SetRequiredDataCount(n: integer);
procedure SetPrecision(p: integer);
procedure Pause;
function RandomN(M, N: integer): integer;
function RandomR(A, B: real): real;
function RandomR1(a, b: real): real;
function RandomR2(a, b: real): real;
function curtest: integer;
procedure setFileItemsInLine(n: integer);
function center(j,n,k,r : byte) : byte;

function refName(n : integer) : string;

//MPI-----------------------------

procedure taskText(s: string); overload;

procedure CreateTask; overload;
procedure CreateTask(SubgroupName: string); overload;
procedure CreateTask(SubgroupName: string; var ProcessCount: integer); overload;
procedure SetProcess(ProcessRank: integer);
procedure SetTestCount(n: integer);
function CurrentLanguage: integer;
procedure SetLanguage(n: integer);
procedure CreateGroup(GroupName, GroupDescription, GroupAuthor,
  GroupKey: string; TaskCount: integer; InitTaskProc: TInitTaskProc);

//V2>
procedure DataFileN(name: string; y, w: integer);
procedure DataFileR(name: string; y, w: integer);
procedure DataFileC(name: string; y, w: integer);
procedure DataFileS(name: string; y, w: integer);
procedure DataFileT(name: string; y1, y2: integer);

procedure ResultFileN(name: string; y, w: integer);
procedure ResultFileR(name: string; y, w: integer);
procedure ResultFileC(name: string; y, w: integer);
procedure ResultFileS(name: string; y, w: integer);
procedure ResultFileT(name: string; y1, y2: integer);

procedure NoEraseNextFile;

function EnWordCount: integer;     //116
function EnSentenceCount: integer; //61
function EnTextCount: integer;     //85
function EnWordSample(N: integer): string;
function EnSentenceSample(N: integer): string;
function EnTextSample(N: integer): string;

function CurrentTest: integer;
procedure SetFileRow(n: integer);
procedure UseTask(GroupName: string; TaskNumber: integer);

//V2<

function CurrentVersion: string;


implementation

uses SysUtils, UComments, UCommon, pt4dat; //V2

var
  FTrueMark: string = 'true ';
  FFalseMark: string = 'false';
  FStringQMark: char = '"';
  FCharQMark: char = '''';
  curRank: integer = 0;
  curSize: integer = 1;
  lang: integer = lgCPP;

var _v1: byte;
var TaskCount, NumberOfTests, FileItemsInLine, NumberOfUsedData,
    TaskNumber, TestNumber, Precision: integer;
    TaskTextHeight, DataHeight, ResultHeight: integer;
var GrTopic, UpperGrTopic, GrDescr, GrAuthor, GrKey, SubGrDescr: string;

var idata, odata: TDataArray;
    icmt, ocmt, ttext: TCommentArray;
    nidata, nodata, nicmt, nocmt, nttext: integer;
//V2>
    ifdata, ofdata: TFileDataArray;
    fdata: TFileArray;
    nifdata, nofdata, nfdata: integer;
    EraseNextFile: boolean;

    useGroup: string;
    useTaskNumber: integer; 
//V2<

    function PositionX(X,Width,XMax : integer):integer;
    begin
    Result := X + 1;
    case X of
    0:      Result := (Xmax - Width + 1) div 2 + 1 + 1;                     //V2: + 1
    xRight: Result := (Xmax div 2 - Width + 1) div 2 + Xmax div 2 + 1 + 1;  //V2: + 1
    xLeft:  Result := (Xmax div 2 - Width + 1) div 2 + 1 + 1;               //V2: + 1
    end;
    end;


    function PosX(X,Width : integer):integer;
    begin
      Result := PositionX(X, Width, MaxWidth - 2);
    end;

function CorrectY(var a: TDataArray; na: integer; var b: TCommentArray; nb: integer;
   var f: TFileDataArray; nf: integer           //V2 
   ): integer;
var i, j, c: integer;
    y1: array [1..maxItemSize] of integer;  //V2
begin
  for i := 1 to maxItemSize do              //V2
    y1[i] := 0;
  for i := 0 to na-1 do
    y1[a[i].y] := a[i].y;
  for i := 0 to nb-1 do
    y1[b[i].y] := b[i].y;
//V2>
  for i := 0 to nf-1 do                     
    y1[f[i].y] := f[i].y;                   //initially, we reserve ONE text line for each file 
//V2<
  c := 0;
  for i := 1 to maxItemSize do              //V2
    if y1[i] > 0 then
      begin
        Inc(c);
        y1[i] := c;
      end;
  for i := 0 to na-1 do
    a[i].y := y1[a[i].y];
  for i := 0 to nb-1 do
    b[i].y := y1[b[i].y];
//V2>
  for i := 0 to nf-1 do
    f[i].y := y1[f[i].y];
//V2<
  result := c;
end;

function AddICmt(s: string; x, y, addwidth: integer): integer;
begin
//  s := RealComment(s);
  result := RealCommentLength(s, GrTopic, TaskNumber);
  if result = 0 then
    exit;
  icmt[nicmt].s := s;
  icmt[nicmt].x := PosX(x, result + addWidth);
  icmt[nicmt].y := y;
  inc(nicmt);
end;

function AddOCmt(s: string; x, y, addwidth: integer): integer;
begin
//  s := RealComment(s);
  result := RealCommentLength(s, GrTopic, TaskNumber);
  if result = 0 then
    exit;
  ocmt[nocmt].s := s;
  ocmt[nocmt].x := PosX(x, result + addWidth);
  ocmt[nocmt].y := y;
  inc(nocmt);
end;

procedure AddIData(id: char; n: real; s: string; x, y, w: integer);
begin
idata[nidata].id := id;
idata[nidata].n := n;
idata[nidata].s := s;
idata[nidata].x := x;
idata[nidata].y := y;
idata[nidata].w := w;
idata[nidata].p := Precision;
idata[nidata].r := curRank;
inc(nidata);
end;

procedure AddOData(id: char; n: real; s: string; x, y, w: integer);
begin
odata[nodata].id := id;
odata[nodata].n := n;
odata[nodata].s := s;
odata[nodata].x := x;
odata[nodata].y := y;
odata[nodata].w := w;
odata[nodata].p := Precision;
odata[nodata].r := curRank;
inc(nodata);
end;

procedure ClearGroupData;
begin
  GrTopic := '';
  UpperGrTopic := '';
  GrDescr := '';
  GrAuthor := '';
  GrKey := 'asdf12345678ghjkuytre';
  TaskCount := 0;
  SubgrDescr := '';
end;

function GetTopic: string;
begin
  result := GrTopic;
end;

function GetTaskCount: integer;
begin
  result := TaskCount;
end;

procedure SetGroupData(topic, descr, author, key: string; n: integer);
begin
  GrTopic := topic;
  UpperGrTopic := Uppercase(topic);
  GrDescr := descr;
  GrAuthor := author;
  GrKey := key;
  TaskCount := n;
  SubgrDescr := '';
//  writeln(GrDescr); 
end;

function center(j,n,k,r : byte) : byte;
begin
Result := (j-1)*(k+r)+(81-n*k-(n-1)*r) div 2;
end;


procedure setFileItemsInLine(n: integer);
begin
//  SetFileRow(n);
  FileItemsInLine := n;
end;

procedure SetPrecision(p: integer);
begin
  Precision := p;
end;

procedure Start(name, topic, author, key: string; lvl: integer);
var i: byte;
begin
  //PT4TaskMaker.CreateTask(lvl, topic);
  NumberOfTests := 5;
  FileItemsInLine := 0;
  NumberOfUsedData := 0;
  Precision := 2;
  Randomize;
  _v1 := 1;
  for i := 2 to 9 do
    if Pos('('+IntToStr(i)+')', key) > 0 then
      _v1 := i;
  nidata := 0;
  nodata := 0;
  nicmt := 0;
  nocmt := 0;
  nttext := 0;
  TaskTextHeight := 0;
  DataHeight := 0;
  ResultHeight := 0;
  SubgrDescr := '';
  curSize := 1;
  curRank := 0;
//V2>
  nifdata := 0;
  nofdata := 0;
  nfdata := 0;  
  EraseNextFile := true;
  SubgrDescr := topic;
  useGroup := '';
//V2< 
end;

procedure getVariant(code,nv1,nv2,nv3 : byte; var v1,v2,v3 : byte);
begin
  v1 := _v1;
end;

procedure SetNumberOfTests(n: integer);
begin
//  PT4TaskMaker.SetTestCount(n);
  NumberOfTests := n;
end;

function GetTestCount: integer;
begin
  result := NumberOfTests;
end;


function RandomN(M, N: integer): integer;
begin
  result := M;
  if M < N then
    result := Random(N-M+1) + M;
end;

function RandomR(A, B: real): real;
begin
  result := A;
  if A < B then
    result := Random * (B-A) + A;
end;

function RandomRD(a, b: real; d: integer): real;
var i, k, c: integer;
begin
  c := 1;
  for i := 1 to d do
    c := c * 10;
  result := RandomN(Round(a*c), Round(b*c)) / c
     + Random * 1.0e-7; // чтобы НИКОГДА не возникало ситуации, когда приходится
                        // округлять до сотых числа вида 1.125!
end;

function RandomR1(a, b: real): real;
begin
  result := RandomRD(a, b, 1);
end;

function RandomR2(a, b: real): real;
begin
  result := RandomRD(a, b, 2);
end;

procedure SetNumberOfUsedData(n: integer);
begin
//  PT4TaskMaker.SetRequiredDataCount(n);
  NumberOfUsedData := n;
end;

procedure SetRequiredDataCount(n: integer);
begin
//  PT4TaskMaker.SetRequiredDataCount(n);
  NumberOfUsedData := n;
end;

function SetTaskData(task, test: integer): string;
begin
  TaskNumber := task;
  TestNumber := test;
  result := UpperGrTopic;
end;

function curtest: integer;
begin
//  result := PT4TaskMaker.CurrentTest;
  result := TestNumber;
end;

function refName(n : integer) : string;
var k : integer;
    num: integer;
    topic: string;
    ptTopicLength, deltaRef: integer;
begin
//2008.09.01>
ptTopicLength := 9;
deltaref := 0;
topic := GrTopic;
num := TaskNumber;
result := '';
for k := 1 to ptTopicLength do
  result := result + '*';
k := num - n - deltaRef;
if (k < 1)or(k > 999) then exit;
if Length(topic)>ptTopicLength then
  result := Copy(topic,1,ptTopicLength-1)
    +'*'+intToStr(k)
else
  result := topic + intToStr(k);
end;

procedure taskText(s: string; x,y: integer);
begin
//  s := RealComment(s);
  if s = '' then exit;
  ttext[nttext].s := s;
  ttext[nttext].x := PosX(x, RealCommentLength(s, GrTopic, TaskNumber));
  ttext[nttext].y := y;
  inc(nttext);
end;

procedure dataB(cmt: string; a: boolean; x,y: integer);
var w, n, w1: integer;
begin
  w := Length(FTrueMark);
  w1 := AddICmt(cmt, x, y, w);
  if a then
    n := 1
  else
    n := 0;
  AddOData('b', n, '', w1 + PosX(x, w1 + w), y, w);
end;

procedure dataN(cmt: string; a: integer; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, w);
  AddIData('i', a, '', w1 + PosX(x, w1 + w), y, w);
end;

procedure dataN2(cmt: string; a1, a2: integer; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, 2 * w);
  AddIData('i', a1, '', w1 + PosX(x, w1 + 2 * w), y, w);
  AddIData('i', a2, '', w1 + w + PosX(x, w1 + 2 * w), y, w);
end;

procedure dataN3(cmt: string; a1, a2, a3: integer; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, 3 * w);
  AddIData('i', a1, '', w1 + PosX(x, w1 + 3 * w), y, w);
  AddIData('i', a2, '', w1 + w + PosX(x, w1 + 3 * w), y, w);
  AddIData('i', a3, '', w1 + 2 * w + PosX(x, w1 + 3 * w), y, w);
end;

procedure dataR(cmt: string; a: real; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, w);
  AddIData('r', a, '', w1 + PosX(x, w1 + w), y, w);
end;

procedure dataR2(cmt: string; a1, a2: real; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, 2 * w);
  AddIData('r', a1, '', w1 + PosX(x, w1 + 2 * w), y, w);
  AddIData('r', a2, '', w1 + w + PosX(x, w1 + 2 * w), y, w);
end;

procedure dataR3(cmt: string; a1, a2, a3: real; x,y,w: integer);
var w1: integer;
begin
  w1 := AddICmt(cmt, x, y, 3 * w);
  AddIData('r', a1, '', w1 + PosX(x, w1 + 3 * w), y, w);
  AddIData('r', a2, '', w1 + w + PosX(x, w1 + 3 * w), y, w);
  AddIData('r', a3, '', w1 + 2 * w + PosX(x, w1 + 3 * w), y, w);
end;

procedure dataC(cmt: string; a: char; x,y: integer);
var w, n, w1: integer;
begin
  w := 3;
  w1 := AddICmt(cmt, x, y, w);
  AddIData('c', 0, a, w1 + PosX(x, w1 + w), y, w);
end;

procedure dataS(cmt: string; a: string; x,y: integer);
var w, n, w1: integer;
begin
  w := Length(a) + 2;
  w1 := AddICmt(cmt, x, y, w);
  AddIData('s', 0, a, w1 + PosX(x, w1 + w), y, w);
end;

procedure dataComment(cmt: string; x,y: integer);
begin
  AddICmt(cmt, x, y, 0);
end;

procedure resultB(cmt: string; a: boolean; x,y: integer);
var w, n, w1: integer;
begin
  w := Length(FTrueMark);
  w1 := AddOCmt(cmt, x, y, w);
  if a then
    n := 1
  else
    n := 0;
  AddOData('b', n, '', w1 + PosX(x, w1 + w), y, w);
end;

procedure resultR(cmt: string; a: real; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := RealToStr(a, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, w);
  AddOData('r', a, '', w1 + PosX(x, w1 + w), y, w2);
end;

procedure resultR2(cmt: string; a1, a2: real; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := RealToStr(a1, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
  s := RealToStr(a2, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, 2 * w);
  AddOData('r', a1, '', w1 + PosX(x, w1 + 2 * w), y, w2);
  AddOData('r', a2, '', w1 + w + PosX(x, w1 + 2 * w), y, w2);
end;

procedure resultR3(cmt: string; a1, a2, a3: real; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := RealToStr(a1, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
  s := RealToStr(a2, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
  s := RealToStr(a3, w, Precision); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, 3 * w);
  AddOData('r', a1, '', w1 + PosX(x, w1 + 3 * w), y, w2);
  AddOData('r', a2, '', w1 + w + PosX(x, w1 + 3 * w), y, w2);
  AddOData('r', a3, '', w1 + 2 * w + PosX(x, w1 + 3 * w), y, w2);
end;

procedure resultN(cmt: string; a: integer; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := IntToStr(a); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, w);
  AddOData('i', a, '', w1 + PosX(x, w1 + w), y, w2);
end;

procedure resultN2(cmt: string; a1, a2: integer; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := IntToStr(a1); 
  if length(s) > w2 then
    w2 := length(s);
  s := IntToStr(a2); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, 2 * w);
  AddOData('i', a1, '', w1 + PosX(x, w1 + 2 * w), y, w2);
  AddOData('i', a2, '', w1 + w + PosX(x, w1 + 2 * w), y, w2);
end;

procedure resultN3(cmt: string; a1, a2, a3: integer; x,y,w: integer);
var w1, w2: integer;
    s: string;
begin
//V2>
  w2 := w;
  s := IntToStr(a1); 
  if length(s) > w2 then
    w2 := length(s);
  s := IntToStr(a2); 
  if length(s) > w2 then
    w2 := length(s);
  s := IntToStr(a3); 
  if length(s) > w2 then
    w2 := length(s);
//V2<
  w1 := AddOCmt(cmt, x, y, 3 * w);
  AddOData('i', a1, '', w1 + PosX(x, w1 + 3 * w), y, w2);
  AddOData('i', a2, '', w1 + w + PosX(x, w1 + 3 * w), y, w2);
  AddOData('i', a3, '', w1 + 2 * w + PosX(x, w1 + 3 * w), y, w2);
end;

procedure resultC(cmt: string; a: char; x,y: integer);
var w, n, w1: integer;
begin
  w := 3;
  w1 := AddOCmt(cmt, x, y, w);
  AddOData('c', 0, a, w1 + PosX(x, w1 + w), y, w);
end;

procedure resultS(cmt: string; a: string; x,y: integer);
var w, n, w1: integer;
begin
  w := Length(a) + 2;
  w1 := AddOCmt(cmt, x, y, w);
  AddOData('s', 0, a, w1 + PosX(x, w1 + w), y, w);
end;

procedure resultComment(cmt: string; x,y: integer);
begin
  AddOCmt(cmt, x, y, 0);
end;

procedure Pause;
var i, j: integer;  //V2
    f: textfile;
begin
if useGroup <> '' then
begin
  AssignFile(f, UTDirName + UseFileName); //V2
  Rewrite(f);
  writeln(f, PTVer); // file version 
  writeln(f, useGroup);
  writeln(f, useTaskNumber);
  writeln(f, GrDescr);
  Close(f);
  exit;
end;
TaskTextHeight := nttext;
for i := 0 to nttext - 1 do
  ttext[i].y := i + 1;
DataHeight := CorrectY(idata, nidata, icmt, nicmt, ifdata, nifdata);  //V2
ResultHeight := CorrectY(odata, nodata, ocmt, nocmt, ofdata, nofdata); //V2
AssignFile(f, UTDirName + DatFileName); //V2
Rewrite(f);
writeln(f, PTVer); // file version 
writeln(f, GrTopic);
writeln(f, TaskNumber, ' ', TaskCount);
writeln(f, GrDescr);
writeln(f, SubgrDescr);
writeln(f, GrAuthor);
writeln(f, NumberOfTests, ' ', TestNumber, ' ', NumberOfUsedData, ' ', DataHeight, ' ', ResultHeight);
writeln(f, nttext, ' ', nicmt, ' ', nocmt, ' ', nidata, ' ', nodata, ' ', cursize);
for i := 0 to nttext - 1 do
begin
  writeln(f, ttext[i].x, ' ', ttext[i].y);
  writeln(f, ttext[i].s);
end;
for i := 0 to nicmt - 1 do
begin
  writeln(f, icmt[i].x, ' ', icmt[i].y);
  writeln(f, icmt[i].s);
end;
for i := 0 to nocmt - 1 do
begin
  writeln(f, ocmt[i].x, ' ', ocmt[i].y);
  writeln(f, ocmt[i].s);
end;
for i := 0 to nidata - 1 do
begin
  writeln(f, idata[i].id, ' ', idata[i].x, ' ', idata[i].y, ' ', idata[i].w, ' ', idata[i].p, ' ', idata[i].r);
  case idata[i].id of
  'b': writeln(f, Round(idata[i].n));
  'i': writeln(f, Round(idata[i].n));
  'r': writeln(f, idata[i].n:20);
  'c','s': writeln(f, idata[i].s);
  end;
end;
for i := 0 to nodata - 1 do
begin
  writeln(f, odata[i].id, ' ', odata[i].x, ' ', odata[i].y, ' ', odata[i].w, ' ', odata[i].p, ' ', odata[i].r);
  case odata[i].id of
  'b': writeln(f, Round(odata[i].n));
  'i': writeln(f, Round(odata[i].n));
  'r': writeln(f, odata[i].n:20);
  'c','s': writeln(f, odata[i].s);
  end;
end;
//V2>
writeln(f, nifdata, ' ', nofdata, ' ', nfdata);
for i := 0 to nifdata - 1 do
begin
  writeln(f, ifdata[i].s);
  writeln(f, ifdata[i].id, ' ', Round(ifdata[i].n), ' ', ifdata[i].x, ' ', ifdata[i].y, ' ', ifdata[i].w, ' ', ifdata[i].p, ' ', ifdata[i].r);
end;
for i := 0 to nofdata - 1 do
begin
  writeln(f, ofdata[i].s);
  writeln(f, ofdata[i].id, ' ', Round(ofdata[i].n), ' ', ofdata[i].x, ' ', ofdata[i].y, ' ', ofdata[i].w, ' ', ofdata[i].p, ' ', ofdata[i].r);
end;
for i := 0 to nfdata - 1 do
begin
  writeln(f, fdata[i].name);
  writeln(f, fdata[i].id, ' ', fdata[i].size);
  for j := 0 to fdata[i].size - 1 do 
  case fdata[i].id of
  'I': writeln(f, Round(fdata[i].n[j]));
  'R': writeln(f, fdata[i].n[j]:20);
  'C','S','T': writeln(f, fdata[i].s[j]);
  end;
  DeleteFile(fdata[i].name);  //!!!!!!!!!! we delete ALL files, so input files should be created again (in the proper format corresponding to language)
end;
//V2<
CloseFile(f);
end;


function CurrentLanguage: integer;
begin
  result := lang;
end;

procedure SetLanguage(n: integer);
begin
  lang := n;
end;



procedure TaskText(s: string);
var p,y: integer;
begin
//V2>
  p := Pos(#10, s);
  while p > 0 do
  begin
    Delete(s, p, 1);
    p := Pos(#10, s);
  end;
//V2<
  p := Pos(#13, s);
  y := 0;
  while p <> 0 do
  begin
    inc(y);
    TaskText(TrimRight(copy(s, 1, p-1)), 0, y);
    delete(s, 1, p);
    p := Pos(#13, s);
  end;
  if s <> '' then
    TaskText(TrimRight(s), 0, y+1);
end;

procedure CreateTask;
begin
  Start('', '', '', '', 1);
  curSize := 1;
end;

procedure CreateTask(SubgroupName: string);
begin
  Start('', '', '', '', 1);
  if SubgroupName <> '' then
    SubgrDescr := SubgroupName;
  curSize := 1;
end;

procedure CreateTask(SubgroupName: string; var ProcessCount: integer);
begin
  Start('', '', '', '', 1);
  if SubgroupName <> '' then
    SubgrDescr := SubgroupName;
  curSize := ProcessCount;
end;

procedure SetProcess(ProcessRank: integer);
begin
  curRank := ProcessRank;
end;

procedure SetTestCount(n: integer);
begin
  SetNumberOfTests(n);
end;

procedure CreateGroup(GroupName, GroupDescription, GroupAuthor,
  GroupKey: string; TaskCount: integer; InitTaskProc: TInitTaskProc);
begin
  SetGroupData(GroupName, GroupDescription, GroupAuthor, GroupKey, TaskCount);
end;

procedure dataB(a: boolean; x,y: integer);
begin
  dataB('', a, x, y);
end;
procedure dataN(a: integer; x,y,w: integer);
begin
  dataN('', a, x, y, w);
end;
procedure dataN2(a1, a2: integer; x,y,w: integer);
begin
  dataN2('', a1, a2, x, y, w);
end;
procedure dataN3(a1, a2, a3: integer; x,y,w: integer);
begin
  dataN3('', a1, a2, a3, x, y, w);
end;
procedure dataR(a: real; x,y,w: integer);
begin
  dataR('', a, x, y, w);
end;
procedure dataR2(a1, a2: real; x,y,w: integer);
begin
  dataR2('', a1, a2, x, y, w);
end;
procedure dataR3(a1, a2, a3: real; x,y,w: integer);
begin
  dataR3('', a1, a2, a3, x, y, w);
end;
procedure dataC(a: char; x,y: integer);
begin
  dataC('', a, x, y);
end;
procedure dataS(a: string; x,y: integer);
begin
  dataS('', a, x, y);
end;
procedure resultB(a: boolean; x,y: integer);
begin
  resultB('', a, x, y);
end;
procedure resultN(a: integer; x,y,w: integer);
begin
  resultN('', a, x, y, w);
end;
procedure resultN2(a1, a2: integer; x,y,w: integer);
begin
  resultN2('', a1, a2, x, y, w);
end;
procedure resultN3(a1, a2, a3: integer; x,y,w: integer);
begin
  resultN3('', a1, a2, a3, x, y, w);
end;
procedure resultR(a: real; x,y,w: integer);
begin
  resultR('', a, x, y, w);
end;
procedure resultR2(a1, a2: real; x,y,w: integer);
begin
  resultR2('', a1, a2, x, y, w);
end;
procedure resultR3(a1, a2, a3: real; x,y,w: integer);
begin
  resultR3('', a1, a2, a3, x, y, w);
end;
procedure resultC(a: char; x,y: integer);
begin
  resultC('', a, x, y);
end;
procedure resultS(a: string; x,y: integer);
begin
  resultS('', a, x, y);
end;

//V2>

procedure DataFileN(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ifdata, nifdata, 'I', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
end;
procedure DataFileR(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ifdata, nifdata, 'R', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
end;
procedure DataFileC(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ifdata, nifdata, 'C', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
end;
procedure DataFileS(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ifdata, nifdata, 'S', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
end;
procedure DataFileT(name: string; y1, y2: integer);
var filesize: integer;
begin
  AddFileData(ifdata, nifdata, 'T', name, FileItemsInLine, y1, 72, Precision, fdata, nfdata, filesize, lgPascal);
end;

procedure ResultFileN(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ofdata, nofdata, 'I', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
  if EraseNextFile then
    DeleteFile(name)
  else
    EraseNextFile := True;
end;
procedure ResultFileR(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ofdata, nofdata, 'R', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
  if EraseNextFile then
    DeleteFile(name)
  else
    EraseNextFile := True;
end;
procedure ResultFileC(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ofdata, nofdata, 'C', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
  if EraseNextFile then
    DeleteFile(name)
  else
    EraseNextFile := True;
end;
procedure ResultFileS(name: string; y, w: integer);
var filesize: integer;
begin
  AddFileData(ofdata, nofdata, 'S', name, FileItemsInLine, y, w, Precision, fdata, nfdata, filesize, lgPascal);
  if EraseNextFile then
    DeleteFile(name)
  else
    EraseNextFile := True;
end;
procedure ResultFileT(name: string; y1, y2: integer);
var filesize: integer;
begin
  AddFileData(ofdata, nofdata, 'T', name, FileItemsInLine, y1, 72, Precision, fdata, nfdata, filesize, lgPascal);
  if EraseNextFile then
    DeleteFile(name)
  else
    EraseNextFile := True;
end;

procedure NoEraseNextFile;
begin
  EraseNextFile := false;
// Erasing of ALL files is also performed in the Pause procedure (data files must be created by Unix Taskbook!)
end;

function CurrentTest: integer;
begin
  result := TestNumber;
end;

procedure SetFileRow(n: integer);
begin
//  SetFileRow(n);
  FileItemsInLine := n;
end;

function EnWordCount: integer;     //116
begin
  result := PT4Dat.EnWordCount;
end;

function EnSentenceCount: integer; //61
begin
  result := PT4Dat.EnSentenceCount;
end;

function EnTextCount: integer;     //85
begin
  result := PT4Dat.EnTextCount;
end;

function EnWordSample(N: integer): string;
begin
  result := PT4Dat.EnWordSample(N);
end;

function EnSentenceSample(N: integer): string;
begin
  result := PT4Dat.EnSentenceSample(N);
end;

function EnTextSample(N: integer): string;
begin
  result := PT4Dat.EnTextSample(N);
end;

procedure UseTask(GroupName: string; TaskNumber: integer);
begin
  useGroup := GroupName;
  useTaskNumber := TaskNumber;
end;

function GetCode: string;
const c : string =
'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
var CodeID : string;
    l : array [1..20] of longint;
    j0 : longint;
    i,j : integer;
begin
 CodeID := '';
 l[1] := 234674654;
 l[2] := 323576572;
 l[3] := 242444243;
 l[4] := 296346651;
 l[5] := 274544651;
 l[6] := 654334564;
 l[7] := 986326563;
 l[8] := 974453871;
 l[9] := 765327097;
l[10] := 789523235;
l[11] := 973435782;
l[12] := 864486396;
l[13] := 938261951;
l[14] := 653777321;
l[15] := 834973252;
l[16] := 566238242;
l[17] := 890832178;
l[18] := 675292632;
l[19] := 853684329;
l[20] := 463830875;
for i := 1 to 10 do
  begin
    j0 := l[i];
    for j := 1 to length(GrKey) do
      j0 := longint(longint(j0*ord(GrKey[j]))+l[2*i]);
    j0 := abs(j0);
    CodeID := CodeID + c[j0 mod 62 + 1];
    writeln(i, ': ', CodeID);
  end;
  result := 'TM-'+CodeID;
  writeln('res: ', result);
end;

//V2<

function CurrentVersion: string;
begin
  result := '5.01';
end;

end.

