{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

library libpt5core;

{$MODE Delphi}{$H+}

uses strings, PT5MakeCore,dynlibs;

procedure setgroupdata(topic, descr, author, key: PChar; n: integer); cdecl;
begin
  PT5MakeCore.SetGroupData(topic, descr, author, key, n);
end;
procedure cleargroupdata; stdcall;
begin
  PT5MakeCore.ClearGroupData;
end;
procedure gettopic(res: PChar);  stdcall;
begin
  StrCopy(res, PChar(PT5MakeCore.GetTopic));
end;
function gettaskcount: integer; stdcall;
begin
  result := PT5MakeCore.GetTaskCount;
end;
procedure settaskdata(task, test: integer; res: PChar); stdcall;
begin
    StrCopy(res, PChar(PT5MakeCore.SetTaskData(task, test)));
end;
function gettestcount: integer; stdcall;
begin
  result := PT5MakeCore.GetTestCount;
end;
procedure getcode(res: PChar);  stdcall;
begin
  StrCopy(res, PChar(PT5MakeCore.GetCode));
end;

procedure start(name, topic, author, key: PChar; lvl: integer); stdcall;
begin
  PT5MakeCore.Start(name, topic, author, key, lvl);
end;
function getvariant(code, nv1, nv2, nv3: integer): integer; stdcall;  //!!!!!!!!!!!
var v1, v2, v3: byte;
begin
  PT5MakeCore.getVariant(code, nv1, nv2, nv3, v1, v2, v3);
  result := v1;
end;

procedure tasktext(s: PChar; x,y: integer); stdcall;
begin
  PT5MakeCore.taskText(s, x, y);
end;
procedure tasktext0(s: PChar); stdcall;  //!!!!!!!!!!!!!!!!!!!
begin
  PT5MakeCore.taskText(s);
end;
procedure datacomment(cmt: PChar; x,y: integer); stdcall;
begin
  PT5MakeCore.dataComment(cmt, x,y);
end;
procedure datab(cmt: PChar; a: integer; x,y: integer);  stdcall; //!!!!!!!!!!!
begin
  PT5MakeCore.dataB(cmt, a<>0, x,y);
end;
procedure datan(cmt: PChar; a: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.dataN(cmt, a, x,y,w);
end;
procedure datan2(cmt: PChar; a1, a2: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.dataN2(cmt, a1,a2, x,y,w);
end;
procedure datan3(cmt: PChar; a1, a2, a3: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.dataN3(cmt, a1,a2,a3, x,y,w);
end;
procedure datar(cmt: PChar; a: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.datar(cmt, a, x,y,w);
end;
procedure datar2(cmt: PChar; a1, a2: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.datar2(cmt, a1,a2, x,y,w);
end;
procedure datar3(cmt: PChar; a1, a2, a3: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.datar3(cmt, a1,a2,a3, x,y,w);
end;
procedure datac(cmt: PChar; a: char; x,y: integer);  stdcall;
begin
  PT5MakeCore.datac(cmt, a, x,y);
end;
procedure datas(cmt: PChar; a: PChar; x,y: integer);  stdcall;
begin
  PT5MakeCore.dataS(cmt, a, x,y);
end;
procedure resultcomment(cmt: PChar; x,y: integer); stdcall;
begin
  PT5MakeCore.resultComment(cmt, x,y);
end;
procedure resultb(cmt: PChar; a: integer; x,y: integer);  stdcall; //!!!!!!!!!!!
begin
  PT5MakeCore.resultB(cmt, a<>0, x,y);
end;
procedure resultn(cmt: PChar; a: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultN(cmt, a, x,y,w);
end;
procedure resultn2(cmt: PChar; a1, a2: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultN2(cmt, a1,a2, x,y,w);
end;
procedure resultn3(cmt: PChar; a1, a2, a3: integer; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultN3(cmt, a1,a2,a3, x,y,w);
end;
procedure resultr(cmt: PChar; a: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultR(cmt, a, x,y,w);
end;
procedure resultr2(cmt: PChar; a1, a2: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultR2(cmt, a1,a2, x,y,w);
end;
procedure resultr3(cmt: PChar; a1, a2, a3: real; x,y,w: integer);  stdcall;
begin
  PT5MakeCore.resultR3(cmt, a1,a2,a3, x,y,w);
end;
procedure resultc(cmt: PChar; a: char; x,y: integer);  stdcall;
begin
  PT5MakeCore.resultC(cmt, a, x,y);
end;
procedure results(cmt: PChar; a: PChar; x,y: integer);  stdcall;
begin
  PT5MakeCore.resultS(cmt, a, x,y);
end;



procedure settestcount(n: integer); stdcall;
begin
  PT5MakeCore.SetTestCount(n);
end;
//procedure setnumberoftests(n: integer); stdcall;
//begin
//  PT5MakeCore.SetNumberOfTests(n);
//end;
procedure setrequireddatacount(n: integer); stdcall;
begin
  PT5MakeCore.SetRequiredDataCount(n);
end;
//procedure setnumberofuseddata(n: integer); stdcall;
//begin
//  PT5MakeCore.SetNumberOfUsedData(n);
//end;
procedure setprecision(p: integer); stdcall;
begin
  PT5MakeCore.SetPrecision(p);
end;
procedure pause; stdcall;
begin
  PT5MakeCore.pause;
end;
function randomn(M, N: integer): integer; stdcall;
begin
  result := PT5MakeCore.RandomN(M, N);
end;
function randomr(A, B: real): real; stdcall;
begin
  result := PT5MakeCore.RandomR(A, B);
end;
function randomr1(a, b: real): real; stdcall;
begin
  result := PT5MakeCore.RandomR1(A, B);
end;
function randomr2(a, b: real): real; stdcall;
begin
  result := PT5MakeCore.RandomR2(A, B);
end;
procedure setfileitemsinline(n: integer); stdcall;
begin
  PT5MakeCore.setFileItemsInLine(n);
end;
//procedure setfilerow(n: integer); stdcall;
//begin
//  PT5MakeCore.SetFileRow(n);
//end;

function center(j,n,k,r : integer) : integer; stdcall; //!!!!!!!!!!!!!!!!!!
begin
  result := PT5MakeCore.center(j,n,k,r);
end;

procedure refname(n : integer; res : PChar); stdcall;  //!!!!!!!!!!!!!!!!!!
begin
  StrCopy(res, PChar(PT5MakeCore.refName(n)));
end;

//MPI-----------------------------

procedure createtask(SubgroupName: PChar);  stdcall;
begin
  PT5MakeCore.CreateTask(SubgroupName);
end;
procedure createtask2(SubgroupName: PChar; var ProcessCount: integer);  stdcall;
begin
  PT5MakeCore.CreateTask(SubgroupName, ProcessCount);
end;
procedure setprocess(ProcessRank: integer); stdcall;
begin
  PT5MakeCore.SetProcess(ProcessRank);
end;
function currentlanguage: integer; stdcall;
begin
  result := PT5MakeCore.CurrentLanguage;
end;
procedure setlanguage(n: integer); stdcall;
begin
  PT5MakeCore.SetLanguage(n);
end;
procedure creategroup(GroupName, GroupDescription, GroupAuthor,
  GroupKey: PChar; TaskCount: integer; InitTaskProc: pointer); stdcall;
begin
  PT5MakeCore.CreateGroup(GroupName, GroupDescription, GroupAuthor,
    GroupKey, TaskCount, TInitTaskProc(InitTaskProc));
end;

//V2>
procedure datafilen(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.DataFileN(name, y, w);
end;
procedure datafiler(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.DataFileR(name, y, w);
end;
procedure datafilec(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.DataFileC(name, y, w);
end;
procedure datafiles(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.DataFileS(name, y, w);
end;
procedure datafilet(name: PChar; y1, y2: integer); stdcall;
begin
  PT5MakeCore.DataFileT(name, y1, y2);
end;

procedure resultfilen(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.ResultFileN(name, y, w);
end;
procedure resultfiler(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.ResultFileR(name, y, w);
end;
procedure resultfilec(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.ResultFileC(name, y, w);
end;
procedure resultfiles(name: PChar; y, w: integer); stdcall;
begin
  PT5MakeCore.ResultFileS(name, y, w);
end;
procedure resultfilet(name: PChar; y1, y2: integer); stdcall;
begin
  PT5MakeCore.ResultFileT(name, y1, y2);
end;

procedure noerasenextfile; stdcall;
begin
  PT5MakeCore.NoEraseNextFile;
end;

function enwordcount: integer;  stdcall; //116
begin
  result := PT5MakeCore.EnWordCount;
end;
function ensentencecount: integer;  stdcall; //61
begin
  result := PT5MakeCore.EnSentenceCount;
end;//61
function entextcount: integer;   stdcall; //85
begin
  result := PT5MakeCore.EnTextCount;
end;   //85
procedure enwordsample(N: integer; res: PChar); stdcall;
begin
  StrCopy(res, PChar(PT5MakeCore.EnWordSample(N)));
end;
procedure ensentencesample(N: integer; res : PChar); stdcall;
begin
  StrCopy(res, PChar(PT5MakeCore.EnSentenceSample(N)));
end;
procedure entextsample(N: integer; res : PChar); stdcall;
begin
  StrCopy(res, PChar(PT5MakeCore.EnTextSample(N)));
end;

function curt: integer; stdcall;
begin
  result := PT5MakeCore.CurrentTest;
end;
//function curtest: integer; stdcall;
//begin
//  PT5MakeCore.;
//end;

procedure usetask(GroupName: PChar; TaskNumber: integer); stdcall;
begin
  PT5MakeCore.UseTask(GroupName, TaskNumber);
end;

//V2<

procedure currentversion(res: PChar); stdcall;
begin
    StrCopy(res, PChar(PT5MakeCore.CurrentVersion));
end;


exports

setgroupdata, cleargroupdata,
gettopic, gettaskcount, settaskdata, gettestcount, getcode,

start, getvariant, tasktext, tasktext0,

datacomment, datab, datan, datan2, datan3,
datar, datar2, datar3, datac, datas,

resultcomment, resultb, resultn, resultn2, resultn3,
resultr, resultr2, resultr3, resultc, results,

settestcount, setrequireddatacount, setprecision, pause,

randomn, randomr, randomr1, randomr2,

setfileitemsinline, center, refname,

createtask, createtask2, setprocess,

currentlanguage, setlanguage, creategroup,

datafilen, datafiler, datafilec, datafiles, datafilet,
resultfilen, resultfiler, resultfilec, resultfiles, resultfilet,

noerasenextfile,

enwordcount, ensentencecount, entextcount,
enwordsample, ensentencesample, entextsample,

curt, usetask,

currentversion;


begin
end.
