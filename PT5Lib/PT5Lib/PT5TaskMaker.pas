{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$mode delphi}{$H+}
{$WARNINGS OFF}

/// ����������� ��� ������������ ��������� Programming Taskbook 5.1
unit PT5TaskMaker;

//------------------------------------------------------------------------------
// ����������� ��� ������������ ��������� Programming Taskbook 5.1
//------------------------------------------------------------------------------
// ������ ��� �������� ������������ ��������� � �������� ������� 
//   � ������� Turbo Delphi � Free Pascal Lazarus
//
// Copyright (c) 2009-2024 �.�.�������
// ����������� �������� Programming Taskbook Copyright (c) �.�.�������,1998-2024
//------------------------------------------------------------------------------

interface

const

  xCenter = 0;
  xLeft   = 100;
  xRight  = 200;

  SampleError = '#ERROR?';
  MaxLineCount = 50;

  lgPascal       = $0000001; 
  lgPascalABCNET = $0000401; 
  lgPascalNET    = $0000400;
  lgPascalABCNET_flag 
                 = $0000400; // ��������� � ������ 4.14
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
  lgFS           = $0000800; // ��������� � ������ 4.19
  lgJulia        = $0040000; // ��������� � ������ 4.22
  lgC            = $0000008; // ��������� � ������ 4.23

type

/// ����������� ���, ������������ ��� �������� ����� �������
  TInitTaskProc = procedure(N: integer); stdcall;

//2024.04>
(*
/// ��������� �� ���� ������������ ���������
  PNode = ^TNode;

/// ���� ������������ ���������
  TNode = record
    Data: integer;
    Next: PNode;
    Prev: PNode;
    Left: PNode;
    Right: PNode;
    Parent: PNode;
  end;
*)
//2024.04<

//2024.04>
// --------------------------------------------------------------------
// �������, ����������� � ����������� ������ 5

/// ������������� ������� ��������� ������
procedure SetGroupData(topic, descr, author, key: string; n: integer);

/// ���������� ���������, ������������� ��� ���������� ������
procedure ClearGroupData;

/// ���������� ��� ������ �������
function GetTopic: string;

/// ���������� ���������� ������� � ������
function GetTaskCount: integer;

/// ������������� ����� ������� � ����� �����;
/// ���������� ��� ������� ������ ������� � ������� ��������
function SetTaskData(task, test: integer): string;

/// ���������� ���������� �������� ��������� ��� �������� �������
function GetTestCount: integer;

/// ���������� ��� ��� ������� ������
function GetCode: string;

/// ������������� ���� ��� ������������ �������
procedure SetLanguage(n: integer);

/// �������� ����������� �������� ����� � ������������ �������
/// ����� ��� ����������� � �������
/// (��� �� �����, ��� ������ ������� Pause, � ����� ������������ �������,
/// ��� ����� ����� ����������� ���������)
procedure NoEraseNextFile;

/// ������ ���������� ��������� ��������� �����, ������������ �� ����� ������,
/// ���� ��������� �������� ����������, ������������ �� ���������
procedure SetFileRow(N: integer);

/// ������ ���������� ��������� ��������� �����, ������������ �� ����� ������,
/// ���� ��������� �������� ����������, ������������ �� ���������
/// (������������ ��� ������� �����)
procedure SetFileItemsInLine(N: integer);

/// ������ ������� ������ ���������� ����� ���������� ������������ �������
procedure Pause;

/// ��������� � ��������� ����� ������ ������� � ���������� ����������������
/// (������������ ��� ������� �����)
procedure Start(name, topic, author, key: string; lvl: integer);

/// ������������ �������������� ��������� ������� (������������ ��� ������� �����)
procedure getVariant(code,nv1,nv2,nv3 : byte; var v1,v2,v3 : byte);

/// ���������� ���������� ����� �������� ��������� �������
/// (����������� ������ �������� �������� �������). ���� ����� ��������
/// �������� �� ����, �� ���������� 1. ���� ������� ��� ���������
/// ��� �������� � ���������������� ������, �� ���������� 0.
/// (������� CurrentTest; ������������ ��� ������� �����)
function curtest: integer;

/// ������ ����� �������� ������, ���������� �����������
/// ��� ���������� ���������� �������������� ������
/// (������� SetRequiredDataCount; ������������ ��� ������� �����)
procedure SetNumberOfUsedData(n: integer);

/// ������ ����� �������� ��������� (�� 2 �� 9), ��� ��������
/// ����������� ������� ������� ����� ��������� �����������
/// (������� SetTestCount; ������������ ��� ������� �����)
procedure SetNumberOfTests(n: integer);




// --------------------------------------------------------------------
//2024.04<


/// ��������� � ��������� ����� ������ ������� � ���������� ����������������
procedure CreateGroup(GroupName, GroupDescription, GroupAuthor, GroupKey: string;
  TaskCount: integer; InitTaskProc: TInitTaskProc);

/// ��������� � ����������� ������ ������� �� ������ ������
procedure UseTask(GroupName: string; TaskNumber: integer); //overload; //2024.04

//2024.04>
(*
/// ��������� � ����������� ������ ������� �� ������ ������
procedure UseTask(GroupName: string; TaskNumber: integer; TopicDescription: string); overload;  // ��������� � ������ 4.19
*)
//2024.04<

/// ������ ����������� ������ ��� ����������� ������ �������
procedure CreateTask(SubgroupName: string); overload;

/// ������ ����������� ������ ��� ����������� ������ �������
procedure CreateTask; overload;

/// ������ ����������� ������ ��� ����������� ������ �������
/// (������� ��� ������������� ������ ���������)
procedure CreateTask(SubgroupName: string; var ProcessCount: integer); overload;

/// ������ ����������� ������ ��� ����������� ������ �������
/// (������� ��� ������������� ������ ���������)
procedure CreateTask(var ProcessCount: integer); overload;

/// ��������� ���������� ������� ���� ����������������, ��������� ��� ���������
/// ���������� ��������, ��������� � ����������� lgXXX
function CurrentLanguage: integer;

//2024.04>
(*
/// ���������� ������������� ������ � ��������� ������� ������
/// (� ����� ������ ������������ ���� 'ru', ���� 'en')
function CurrentLocale: string;
*)
//2024.04<

/// ���������� ����� ������� ������ ��������� � ������� 'd.dd'
/// (��� ������, ������� 4.10, ���������� '4.00')
function CurrentVersion: string;  // ��������� � ������ 4.10

//-----------------------------------------------------------------------------

/// ��������� � ������������ ������� ������
procedure TaskText(S: string; X, Y: integer); overload;

/// ���������� ��� ������ ������������ �������
/// (� ��������� S ��������� ������ ������������
/// ������ ����������� ��������� #13, #10 ��� ����� #13#10;
/// ��������� � �������� ������� � ������� ���������, 
/// ������ ������ � ������������ �� ����������)
procedure TaskText(S: string); overload; // ��������� � ������ 4.11

//-----------------------------------------------------------------------------

/// ��������� � �������� ������ ������� ����������� ���� � ������������
procedure DataB(Cmt: string; B: boolean; X, Y: integer); overload;

/// ��������� � �������� ������ ������� ����������� ����
procedure DataB(B: boolean; X, Y: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ������������� ������� � ������������
procedure DataN(Cmt: string; N: integer; X, Y, W: integer); overload;

/// ��������� � �������� ������ ������������� �������
procedure DataN(N: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������� �������� � ����� ������������
procedure DataN2(Cmt: string; N1, N2: integer; X, Y, W: integer); overload;

/// ��������� � �������� ������ ��� ������������� ��������
procedure DataN2(N1, N2: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������� �������� � ����� ������������
procedure DataN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); overload;

/// ��������� � �������� ������ ��� ������������� ��������
procedure DataN3(N1, N2, N3: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ������������ ������� � ������������
procedure DataR(Cmt: string; R: real; X, Y, W: integer); overload;

/// ��������� � �������� ������ ������������ �������
procedure DataR(R: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������ �������� � ����� ������������
procedure DataR2(Cmt: string; R1, R2: real; X, Y, W: integer); overload;

/// ��������� � �������� ������ ��� ������������ ��������
procedure DataR2(R1, R2: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������ �������� � ����� ������������
procedure DataR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); overload;

/// ��������� � �������� ������ ��� ������������ ��������
procedure DataR3(R1, R2, R3: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ���������� ������� � ������������
procedure DataC(Cmt: string; C: char; X, Y: integer); overload;

/// ��������� � �������� ������ ���������� �������
procedure DataC(C: char; X, Y: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������� ������ ��������� ������� � ������������
procedure DataS(Cmt: string; S: string; X, Y: integer); overload;

/// ��������� � �������� ������ ��������� �������
procedure DataS(S: string; X, Y: integer); overload; // ��������� � ������ 4.11

(*
/// ��������� � �������� ������ ������� ���� PNode � ������������
procedure DataP(Cmt: string; NP: integer; X, Y: integer); overload;

/// ��������� � �������� ������ ������� ���� PNode
procedure DataP(NP: integer; X, Y: integer); overload; // ��������� � ������ 4.11
*)

/// ��������� ����������� � ������� �������� ������
procedure DataComment(Cmt: string; X, Y: integer);

//-----------------------------------------------------------------------------

/// ��������� � �������������� ������ ������� ����������� ���� � ������������
procedure ResultB(Cmt: string; B: boolean; X, Y: integer); overload;

/// ��������� � �������������� ������ ������� ����������� ����
procedure ResultB(B: boolean; X, Y: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ������������� ������� � ������������
procedure ResultN(Cmt: string; N: integer; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ������������� �������
procedure ResultN(N: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������� �������� � ����� ������������
procedure ResultN2(Cmt: string; N1, N2: integer; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ��� ������������� ��������
procedure ResultN2(N1, N2: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������� �������� � ����� ������������
procedure ResultN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ��� ������������� ��������
procedure ResultN3(N1, N2, N3: integer; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ������������ ������� � ������������
procedure ResultR(Cmt: string; R: real; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ������������ �������
procedure ResultR(R: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������ �������� � ����� ������������
procedure ResultR2(Cmt: string; R1, R2: real; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ��� ������������ ��������
procedure ResultR2(R1, R2: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������ �������� � ����� ������������
procedure ResultR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer); overload;

/// ��������� � �������������� ������ ��� ������������ ��������
procedure ResultR3(R1, R2, R3: real; X, Y, W: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ���������� ������� � ������������
procedure ResultC(Cmt: string; C: char; X, Y: integer); overload;

/// ��������� � �������������� ������ ���������� �������
procedure ResultC(C: char; X, Y: integer); overload; // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��������� ������� � ������������
procedure ResultS(Cmt: string; S: string; X, Y: integer); overload;

/// ��������� � �������������� ������ ��������� �������
procedure ResultS(S: string; X, Y: integer); overload; // ��������� � ������ 4.11

(*
/// ��������� � �������������� ������ ������� ���� PNode � ������������
procedure ResultP(Cmt: string; NP: integer; X, Y: integer); overload;

/// ��������� � �������������� ������ ������� ���� PNode
procedure ResultP(NP: integer; X, Y: integer); overload; // ��������� � ������ 4.11
*)

/// ��������� ����������� � ������� �������������� ������
procedure ResultComment(Cmt: string; X, Y: integer);

//-----------------------------------------------------------------------------

/// ������ ����� ������� ������ ��� ����������� ������������ �����
procedure SetPrecision(N: integer);

/// ������ ����� �������� ������, ���������� �����������
/// ��� ���������� ���������� �������������� ������
procedure SetRequiredDataCount(N: integer);

/// ������ ����� �������� ��������� (�� 2 �� 9), ��� ��������
/// ����������� ������� ������� ����� ��������� �����������
procedure SetTestCount(N: integer);

/// ���������� �������������� ����������, ������� � ������� ������� �������� I-� ������� �� ������,
/// ����������� N ���������, ��� �������, ��� ������ ������� �������� ����� W, � ����� ����������
/// ���� ��������� B �������� (�������� ���������� �� 1)
function Center(I, N, W, B: integer): integer;

/// ���������� ��������������� ����� �����, �������
/// � ��������� �� M �� N ������������. ���� ���������
/// �������� ����, �� ���������� M.
function RandomN(M, N: integer): integer; // ��������� � ������ 4.11

/// ���������� ��������������� ������������ �����, �������
/// �� ������������� [A, B). ���� ��������� ������������
/// ����, �� ���������� A.
function RandomR(A, B: real): real; // ��������� � ������ 4.11

/// ���������� ��������������� ������������ �����, �������
/// �� ������������� [A, B). ���� ��������� ������������
/// ����, �� ���������� A.
function RandomR1(A, B: real): real; // ��������� � ������ 4.11

/// ���������� ��������������� ������������ �����, �������
/// �� ������������� [A, B). ���� ��������� ������������
/// ����, �� ���������� A.
function RandomR2(A, B: real): real; // ��������� � ������ 4.11

/// ���������� ���������� ����� �������� ��������� �������
/// (����������� ������ �������� �������� �������). ���� ����� ��������
/// �������� �� ����, �� ���������� 1. ���� ������� ��� ���������
/// ��� �������� � ���������������� ������, �� ���������� 0.
/// ��� ������������� ���������� ������ ��������� (�� 4.10 ������������)
/// ������ ���������� 0.
function CurrentTest: integer; // ��������� � ������ 4.11

//-----------------------------------------------------------------------------

/// ��������� � �������� ������ �������� ���� � �������������� ���������� (file of integer)
procedure DataFileN(FileName: string; Y, W: integer);

/// ��������� � �������� ������ �������� ���� � ������������� ���������� (file of real)
procedure DataFileR(FileName: string; Y, W: integer);

/// ��������� � �������� ������ �������� ���� � ����������� ���������� (file of char)
procedure DataFileC(FileName: string; Y, W: integer);

/// ��������� � �������� ������ �������� ���� �� ���������� ���������� (file of ShortString)
procedure DataFileS(FileName: string; Y, W: integer);

/// ��������� � �������� ������ ��������� ����
procedure DataFileT(FileName: string; Y1, Y2: integer);

//-----------------------------------------------------------------------------

/// ��������� � �������������� ������ �������� ���� � �������������� ���������� (file of integer)
procedure ResultFileN(FileName: string; Y, W: integer);

/// ��������� � �������������� ������ �������� ���� � ������������� ���������� (file of real)
procedure ResultFileR(FileName: string; Y, W: integer);

/// ��������� � �������������� ������ �������� ���� � ����������� ���������� (file of char)
procedure ResultFileC(FileName: string; Y, W: integer);

/// ��������� � �������������� ������ �������� ���� �� ���������� ���������� (file of ShortString)
procedure ResultFileS(FileName: string; Y, W: integer);

/// ��������� � �������������� ������ ��������� ����
procedure ResultFileT(FileName: string; Y1, Y2: integer);

//-----------------------------------------------------------------------------

//2024.04>
(*

/// ��������� ����� NP � ���������� P
procedure SetPointer(NP: integer; P: PNode);

/// ��������� � �������� ������ �������� ������������ ���������
procedure DataList(NP: integer; X, Y: integer);

/// ��������� � �������������� ������ �������� ������������ ���������
procedure ResultList(NP: integer; X, Y: integer);

/// ��������� � �������� ������ �������� ������
procedure DataBinTree(NP: integer; X, Y1, Y2: integer);

/// ��������� � �������������� ������ �������� ������
procedure ResultBinTree(NP: integer; X, Y1, Y2: integer);

/// ��������� � �������� ������ ������ ������ ����
procedure DataTree(NP: integer; X, Y1, Y2: integer);

/// ��������� � �������������� ������ ������ ������ ����
procedure ResultTree(NP: integer; X, Y1, Y2: integer);

/// ���������� � ������� ������������ ��������� ��������� � ������� NP
procedure ShowPointer(NP: integer);

/// �������� � ������� �������������� ������������ ��������� ���������, ��������� ��������
procedure SetNewNode(NNode: integer);

/// �������� � ������� �������� ������������ ��������� ���������, ��������� ��������
procedure SetDisposedNode(NNode: integer);

*)
//2024.04<

//-----------------------------------------------------------------------------

//2024.04>
(*
/// ���������� ���������� ����-�������� ��� �����, ���������������� ������� ������
function WordCount: integer;     //116

/// ���������� ���������� �����������-�������� ��� �����, ���������������� ������� ������
function SentenceCount: integer; //61

/// ���������� ���������� �������-�������� ��� �����, ���������������� ������� ������
function TextCount: integer;     //85

/// ���������� �����-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������
function WordSample(N: integer): string;

/// ���������� �����������-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������
function SentenceSample(N: integer): string;

/// ���������� �����-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������,
/// ����� �������� ������ ������������� ������� #13#10, � ����� ������ ��� ������� �����������,
/// ����� ����� �� ��������� MaxLineCount, ����� �������� ������ ���������� ���� ������ ������
function TextSample(N: integer): string;

*)
//2024.04<
//-----------------------------------------------------------------------------

/// ���������� ���������� ���������� ����-��������
function EnWordCount: integer;     //116

/// ���������� ���������� ���������� �����������-��������
function EnSentenceCount: integer; //61

/// ���������� ���������� ���������� �������-��������
function EnTextCount: integer;     //85

/// ���������� ���������� �����-������� � ������� N (��������� �� 0)
function EnWordSample(N: integer): string;

/// ���������� ���������� �����������-������� � ������� N (��������� �� 0)
function EnSentenceSample(N: integer): string;

/// ���������� ���������� �����-������� � ������� N (��������� �� 0),
/// ����� �������� ������ ������������� ������� #13#10, � ����� ������ ��� ������� �����������,
/// ����� ����� �� ��������� MaxLineCount, ����� �������� ������ ���������� ���� ������ ������
function EnTextSample(N: integer): string;

//-----------------------------------------------------------------------------

//2024.04>
(*

/// ��������� ������ ����������� � ������� ������ ��� ��������� �������
procedure CommentText(S: string);

/// ��������� ����������� �� ������ ������ ������� (��� �� ���������,
/// ���� �� ������ �������� �� �������� ������ �������)
procedure UseComment(GroupName, SubgroupName: string); overload;

/// ��������� ����������� �� ������ ������ �������
procedure UseComment(GroupName: string); overload;

/// ������������� ����� ���������� ����������� � ��������� �������
procedure Subgroup(SubgroupName: string);

//-----------------------------------------------------------------------------

/// ���������, �������������� ����������� ������������ �������� ������
/// � "��������� �����" ��� ���������� ������� � ����� PascalABC.NET
/// (��� ������������� ������ ���� �� ��������� ������� ��������)
procedure SetObjectStyle;

*)
//2024.04<

//-----------------------------------------------------------------------------

/// ��������� ��� ����������� �������������; ������ ����������
/// ��� ������������� ����� ������������ ���������� � ���������
procedure activate(DllName: string);

//-----------------------------------------------------------------------------

/// ������������� ������� ������� ��� ����������� �������� ��� ������ 
/// �������� ����� (��� ���������� ������� � ������������ ������)
procedure SetProcess(ProcessRank: integer);


/// ��������� ������ ����������� � ������� ������ ��� ��������� �������
/// � ������ ������������ �������� ���������
procedure CommentText(S: string);

/// ������������� ����� ���������� ����������� � ��������� �������
/// � ������ ������������ �������� ���������
procedure Subgroup(SubgroupName: string);

//-----------------------------------------------------------------------------

implementation

//uses Windows; //2024.04
















type
  TNFunc = function : integer; stdcall;
  TNFuncN4 = function (N1, N2, N3, N4: integer): integer; stdcall;
  TSFunc = function : PChar;
  TSFuncN = function (N: integer): PChar; stdcall;
  TProc = procedure; stdcall;
  TProcS = procedure (S: PChar); stdcall;
  TProcSCN2 = procedure (S: PChar; C: Char; N1, N2: integer); stdcall;
  TProcSN = procedure (S: PChar; N: integer); stdcall;
  TProcSN2 = procedure (S: PChar; N1, N2: integer); stdcall;
  TProcSN3 = procedure (S: PChar; N1, N2, N3: integer); stdcall;
  TProcSN4 = procedure (S: PChar; N1, N2, N3, N4: integer); stdcall;
  TProcSN5 = procedure (S: PChar; N1, N2, N3, N4, N5: integer); stdcall;
  TProcSN6 = procedure (S: PChar; N1, N2, N3, N4, N5, N6: integer); stdcall;
  TProcSRN3 = procedure (S: PChar; R: real; N1, N2, N3: integer); stdcall;
  TProcSR2N3 = procedure (S: PChar; R1, R2: real; N1, N2, N3: integer); stdcall;
  TProcSR3N3 = procedure (S: PChar; R1, R2, R3: real; N1, N2, N3: integer); stdcall;
  TProcS2 = procedure (S1, S2: PChar); stdcall;
  TProcS2N2 = procedure (S1, S2: PChar; N1, N2: integer); stdcall;
  TProcS4NP = procedure (S1, S2, S3, S4: PChar; N: integer; P: pointer); stdcall;
  TProcN = procedure (N: integer); stdcall;
  TProcNP = procedure (N: integer; P: pointer); stdcall;
  TProcN3 = procedure (N1, N2, N3: integer); stdcall;
  TProcN4 = procedure (N1, N2, N3, N4: integer); stdcall;
  TProcSvN = procedure (S: PChar; var N: integer); stdcall;
  TProcSNS = procedure (S1: PChar; N: integer; S2: PChar); stdcall;
//2024.04>
  TProcN2S = procedure (N1,N2: integer; S: PChar); stdcall;
  TNFuncN2 = function (N1,N2: integer): integer; stdcall;
  TRFuncR2 = function (N1,N2: real): real; stdcall;
  TProcNS = procedure (N: integer; S: PChar); stdcall;
  TProcS4N = procedure (S1, S2, S3, S4: PChar; N: integer); stdcall;
//2024.04>

var
  creategroup_: TProcS4NP;
  usetask_: TProcSN;
  createtask_: TProcS;
  currentlanguage_: TNFunc;
//  currentlocale_: TSFunc;
  tasktext_: TProcSN2;
  datab_, resultb_: TProcSN3;
  datan_, resultn_: TProcSN4;
  datan2_, resultn2_: TProcSN5;
  datan3_, resultn3_: TProcSN6;
  datar_, resultr_: TProcSRN3;
  datar2_, resultr2_: TProcSR2N3;
  datar3_, resultr3_: TProcSR3N3;
  datac_, resultc_: TProcSCN2;
  datas_, results_: TProcS2N2;
//  datap_, resultp_: TProcSN3;
  datacomment_, resultcomment_: TProcSN2;
  setprecision_, settestcount_, setrequireddatacount_: TProcN;
  center_: TNFuncN4;
  datafilen_, datafiler_, datafilec_, datafiles_, datafilet_: TProcSN2;
  resultfilen_, resultfiler_, resultfilec_, resultfiles_, resultfilet_: TProcSN2;
//  setpointer_: TProcNP;
//  datalist_, resultlist_: TProcN3;
//  databintree_, datatree_, resultbintree_, resulttree_: TProcN4;
//  showpointer_, setnewnode_, setdisposednode_: TProcN;
//  wordcount_, sentencecount_, textcount_: TNFunc;
  enwordcount_, ensentencecount_, entextcount_: TNFunc;
//  wordsample_, sentencesample_, textsample_: TSFuncN;
  enwordsample_, ensentencesample_, entextsample_: TProcNS; //2024.04 !!!!!
//  commenttext_: TProcS;
//  usecomment_: TProcS2;
//  subgroup_: TProcS;
//  setobjectstyle_: TProc;
  createtask2_: TProcSvN;
  setprocess_: TProcN;
  currentversion_: TSFunc; // ��������� � ������ 4.10
  currenttest_: TNFunc; // ��������� � ������ 4.11
//  usetaskex_: TProcSNS; // ��������� � ������ 4.19


//2024.04> // �������, ����������� � ������ 5
  cleargroupdata_: TProc;
  gettopic_: TProcS;
  gettaskcount_: TNFunc;
  settaskdata_: TProcN2S;
  gettestcount_: TNFunc;
  getcode_: TProcS;
  setlanguage_: TProcN;
  noerasenextfile_: TProc;
  pause_: TProc;
  randomn_:   TNFuncN2;
  randomr_, randomr1_, randomr2_: TRFuncR2;
  tasktext0_: TProcS;
  start_: TProcS4N;
  getvariant_: TNFuncN4;
  setfileitemsinline_: TProcN;
  setgroupdata_: TProcS4N;
//2024.04<



  FHandle: TLibHandle;
  var cnt : integer = 0;

function GetProcAddress1(h: TLibHandle; s: string): pointer;
begin
  {$IFDEF WINDOWS}
  result := GetProcAddress(h, s);
  {$ENDIF}
  {$IFDEF LINUX}
  result := GetProcedureAddress(h,s);
  {$ENDIF}
  if result = nil then
    writeln('Not found: ', s);
end;

procedure activate(DllName: string);
begin
  {$IFDEF WINDOWS}
  FHandle := LoadLibraryA(DllName);
  {$ENDIF}
    {$IFDEF LINUX}
  FHandle := LoadLibrary(DllName);
  {$ENDIF}
  creategroup_ := GetProcAddress1(FHandle, 'creategroup');
  usetask_ := GetProcAddress1(FHandle, 'usetask');
  createtask_ := GetProcAddress1(FHandle, 'createtask');
  currentlanguage_ := GetProcAddress1(FHandle, 'currentlanguage');
//  currentlocale_ := GetProcAddress1(FHandle, 'currentlocale');
  tasktext_ := GetProcAddress1(FHandle, 'tasktext');
  datab_ := GetProcAddress1(FHandle, 'datab');
  datan_ := GetProcAddress1(FHandle, 'datan');
  datan2_ := GetProcAddress1(FHandle, 'datan2');
  datan3_ := GetProcAddress1(FHandle, 'datan3');
  datar_ := GetProcAddress1(FHandle, 'datar');
  datar2_ := GetProcAddress1(FHandle, 'datar2');
  datar3_ := GetProcAddress1(FHandle, 'datar3');
  datac_ := GetProcAddress1(FHandle, 'datac');
  datas_ := GetProcAddress1(FHandle, 'datas');
//  datap_ := GetProcAddress1(FHandle, 'datap');
  datacomment_ := GetProcAddress1(FHandle, 'datacomment');
  resultb_ := GetProcAddress1(FHandle, 'resultb');
  resultn_ := GetProcAddress1(FHandle, 'resultn');
  resultn2_ := GetProcAddress1(FHandle, 'resultn2');
  resultn3_ := GetProcAddress1(FHandle, 'resultn3');
  resultr_ := GetProcAddress1(FHandle, 'resultr');
  resultr2_ := GetProcAddress1(FHandle, 'resultr2');
  resultr3_ := GetProcAddress1(FHandle, 'resultr3');
  resultc_ := GetProcAddress1(FHandle, 'resultc');
  results_ := GetProcAddress1(FHandle, 'results');
//  resultp_ := GetProcAddress1(FHandle, 'resultp');
  resultcomment_ := GetProcAddress1(FHandle, 'resultcomment');
  setprecision_ := GetProcAddress1(FHandle, 'setprecision');
  settestcount_ := GetProcAddress1(FHandle, 'settestcount');
  setrequireddatacount_ := GetProcAddress1(FHandle, 'setrequireddatacount');
  center_ := GetProcAddress1(FHandle, 'center');
  datafilen_ := GetProcAddress1(FHandle, 'datafilen');
  datafiler_ := GetProcAddress1(FHandle, 'datafiler');
  datafilec_ := GetProcAddress1(FHandle, 'datafilec');
  datafiles_ := GetProcAddress1(FHandle, 'datafiles');
  datafilet_ := GetProcAddress1(FHandle, 'datafilet');
  resultfilen_ := GetProcAddress1(FHandle, 'resultfilen');
  resultfiler_ := GetProcAddress1(FHandle, 'resultfiler');
  resultfilec_ := GetProcAddress1(FHandle, 'resultfilec');
  resultfiles_ := GetProcAddress1(FHandle, 'resultfiles');
  resultfilet_ := GetProcAddress1(FHandle, 'resultfilet');
//  setpointer_ := GetProcAddress1(FHandle, 'setpointer');
//  datalist_ := GetProcAddress1(FHandle, 'datalist');
//  resultlist_ := GetProcAddress1(FHandle, 'resultlist');
//  databintree_ := GetProcAddress1(FHandle, 'databintree');
//  datatree_ := GetProcAddress1(FHandle, 'datatree');
//  resultbintree_ := GetProcAddress1(FHandle, 'resultbintree');
//  resulttree_ := GetProcAddress1(FHandle, 'resulttree');
//  showpointer_ := GetProcAddress1(FHandle, 'showpointer');
//  setnewnode_ := GetProcAddress1(FHandle, 'setnewnode');
//  setdisposednode_ := GetProcAddress1(FHandle, 'setdisposednode');
//  wordcount_ := GetProcAddress1(FHandle, 'wordcount');
//  sentencecount_ := GetProcAddress1(FHandle, 'sentencecount');
//  textcount_ := GetProcAddress1(FHandle, 'textcount');
//  wordsample_ := GetProcAddress1(FHandle, 'wordsample');
//  sentencesample_ := GetProcAddress1(FHandle, 'sentencesample');
//  textsample_ := GetProcAddress1(FHandle, 'textsample');
  enwordcount_ := GetProcAddress1(FHandle, 'enwordcount');
  ensentencecount_ := GetProcAddress1(FHandle, 'ensentencecount');
  entextcount_ := GetProcAddress1(FHandle, 'entextcount');
  enwordsample_ := GetProcAddress1(FHandle, 'enwordsample');
  ensentencesample_ := GetProcAddress1(FHandle, 'ensentencesample');
  entextsample_ := GetProcAddress1(FHandle, 'entextsample');
//  commenttext_ := GetProcAddress1(FHandle, 'commenttext');
//  usecomment_ := GetProcAddress1(FHandle, 'usecomment');
//  subgroup_ := GetProcAddress1(FHandle, 'subgroup');
//  setobjectstyle_ := GetProcAddress1(FHandle, 'setobjectstyle');
  createtask2_ := GetProcAddress1(FHandle, 'createtask2');
  setprocess_ := GetProcAddress1(FHandle, 'setprocess');
  currentversion_ := GetProcAddress1(FHandle, 'currentversion'); // ��������� � ������ 4.10
  currenttest_ := GetProcAddress1(FHandle, 'curt'); // ��������� � ������ 4.11
//  usetaskex_ := GetProcAddress1(FHandle, 'usetaskex'); // ��������� � ������ 4.19  //2024.04

//2024.04>
  cleargroupdata_:= GetProcAddress1(FHandle, 'cleargroupdata');
  gettopic_:= GetProcAddress1(FHandle, 'gettopic');
  gettaskcount_:= GetProcAddress1(FHandle, 'gettaskcount');
  settaskdata_:= GetProcAddress1(FHandle, 'settaskdata');
  gettestcount_:= GetProcAddress1(FHandle, 'gettestcount');
  getcode_:= GetProcAddress1(FHandle, 'getcode');
  setlanguage_:= GetProcAddress1(FHandle, 'setlanguage');
  pause_:= GetProcAddress1(FHandle, 'pause');
  randomn_:= GetProcAddress1(FHandle, 'randomn');
  randomr_:= GetProcAddress1(FHandle, 'randomr');
  randomr1_:= GetProcAddress1(FHandle, 'randomr1');
  randomr2_:= GetProcAddress1(FHandle, 'randomr2');
  tasktext0_:= GetProcAddress1(FHandle, 'tasktext0');
  start_:= GetProcAddress1(FHandle, 'start');
  getvariant_:= GetProcAddress1(FHandle, 'getvariant');
  noerasenextfile_:= GetProcAddress1(FHandle, 'noerasenextfile');
  setfileitemsinline_:= GetProcAddress1(FHandle, 'setfileitemsinline');
  setgroupdata_:= GetProcAddress1(FHandle, 'setgroupdata');
//2024.04<

end;

//=============================================================================



procedure CreateGroup(GroupName, GroupDescription, GroupAuthor, GroupKey: string;
  TaskCount: integer; InitTaskProc: TInitTaskProc);
begin
  creategroup_(PChar(GroupName), PChar(GroupDescription), PChar(GroupAuthor),
    PChar(GroupKey), TaskCount, @InitTaskProc);
  Randomize;
end;

procedure UseTask(GroupName: string; TaskNumber: integer);
begin
  usetask_(PChar(GroupName), TaskNumber);
end;

//2024.04>
(*
procedure UseTask(GroupName: string; TaskNumber: integer; TopicDescription: string);
begin
  if Assigned(usetaskex_) then
    usetaskex_(PChar(GroupName), TaskNumber, PChar(TopicDescription))
  else  
    usetask_(PChar(GroupName), TaskNumber);
end;
*)
//2024.04<

procedure CreateTask(SubgroupName: string);
begin
  createtask_(PChar(SubgroupName));
end;

procedure CreateTask;
begin
  CreateTask('');
end;

function CurrentLanguage: integer;
begin
  result := currentlanguage_;
end;

//2024.04>
(*
function CurrentLocale: string;
begin
  result := currentlocale_;
end;
*)
//2024.04<

procedure TaskText(S: string; X, Y: integer);
begin
  tasktext_(PChar(S), X, Y);
end;

function BtoN(B: boolean): integer;
begin
  if B then
    result := 1
  else
    result := 0;
end;

procedure DataB (Cmt: string; B: boolean; X, Y: integer);
begin
  datab_(PChar(Cmt), BtoN(B), X, Y);
end;

procedure DataB (B: boolean; X, Y: integer);
begin
  datab_('', BtoN(B), X, Y);
end;

procedure DataN (Cmt: string; N: integer; X, Y, W: integer);
begin
  datan_(PChar(Cmt), N, X, Y, W);
end;

procedure DataN (N: integer; X, Y, W: integer);
begin
  datan_('', N, X, Y, W);
end;

procedure DataN2(Cmt: string; N1, N2: integer; X, Y, W: integer);
begin
  datan2_(PChar(Cmt), N1, N2,  X, Y, W);
end;

procedure DataN2(N1, N2: integer; X, Y, W: integer);
begin
  datan2_('', N1, N2,  X, Y, W);
end;

procedure DataN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer);
begin
  datan3_(PChar(Cmt), N1, N2, N3, X, Y, W);
end;

procedure DataN3(N1, N2, N3: integer; X, Y, W: integer);
begin
  datan3_('', N1, N2, N3, X, Y, W);
end;

procedure DataR(Cmt: string; R: real; X, Y, W: integer);
begin
  datar_(PChar(Cmt), R, X, Y, W);
end;

procedure DataR(R: real; X, Y, W: integer);
begin
  datar_('', R, X, Y, W);
end;

procedure DataR2(Cmt: string; R1, R2: real; X, Y, W: integer);
begin
  datar2_(PChar(Cmt), R1, R2, X, Y, W);
end;

procedure DataR2(R1, R2: real; X, Y, W: integer);
begin
  datar2_('', R1, R2, X, Y, W);
end;

procedure DataR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer);
begin
  datar3_(PChar(Cmt), R1, R2, R3, X, Y, W);
end;

procedure DataR3(R1, R2, R3: real; X, Y, W: integer);
begin
  datar3_('', R1, R2, R3, X, Y, W);
end;

procedure DataC(Cmt: string; C: char; X, Y: integer);
begin
  datac_(PChar(Cmt), C, X, Y);
end;

procedure DataC(C: char; X, Y: integer);
begin
  datac_('', C, X, Y);
end;

procedure DataS(Cmt: string; S: string; X, Y: integer);
begin
  datas_(PChar(Cmt), PChar(S), X, Y);
end;

procedure DataS(S: string; X, Y: integer);
begin
  datas_('', PChar(S), X, Y);
end;

(*
procedure DataP(Cmt: string; NP: integer; X, Y: integer);
begin
  datap_ (PChar(Cmt), NP, X, Y);
end;

procedure DataP(NP: integer; X, Y: integer);
begin
  datap_ ('', NP, X, Y);
end;
*)

procedure DataComment(Cmt: string; X, Y: integer);
begin
  datacomment_(PChar(Cmt), X, Y);
end;

procedure ResultB(Cmt: string; B: boolean; X, Y: integer);
begin
  resultb_(PChar(Cmt), BtoN(B), X, Y);
end;

procedure ResultB(B: boolean; X, Y: integer);
begin
  resultb_('', BtoN(B), X, Y);
end;

procedure ResultN(Cmt: string; N: integer; X, Y, W: integer);
begin
  resultn_(PChar(Cmt), N, X, Y, W);
end;

procedure ResultN(N: integer; X, Y, W: integer);
begin
  resultn_('', N, X, Y, W);
end;

procedure ResultN2(Cmt: string; N1, N2: integer; X, Y, W: integer);
begin
  resultn2_(PChar(Cmt), N1, N2, X, Y, W);
end;

procedure ResultN2(N1, N2: integer; X, Y, W: integer);
begin
  resultn2_('', N1, N2, X, Y, W);
end;

procedure ResultN3(Cmt: string; N1, N2, N3: integer; X, Y, W: integer);
begin
  resultn3_(PChar(Cmt), N1, N2, N3, X, Y, W);
end;

procedure ResultN3(N1, N2, N3: integer; X, Y, W: integer);
begin
  resultn3_('', N1, N2, N3, X, Y, W);
end;

procedure ResultR(Cmt: string; R: real; X, Y, W: integer);
begin
  resultr_(PChar(Cmt), R, X, Y, W);
end;

procedure ResultR(R: real; X, Y, W: integer);
begin
  resultr_('', R, X, Y, W);
end;

procedure ResultR2(Cmt: string; R1, R2: real; X, Y, W: integer);
begin
  resultr2_(PChar(Cmt), R1, R2, X, Y, W);
end;

procedure ResultR2(R1, R2: real; X, Y, W: integer);
begin
  resultr2_('', R1, R2, X, Y, W);
end;

procedure ResultR3(Cmt: string; R1, R2, R3: real; X, Y, W: integer);
begin
  resultr3_(PChar(Cmt), R1, R2, R3, X, Y, W);
end;

procedure ResultR3(R1, R2, R3: real; X, Y, W: integer);
begin
  resultr3_('', R1, R2, R3, X, Y, W);
end;

procedure ResultC(Cmt: string; C: char; X, Y: integer);
begin
  resultc_(PChar(Cmt), C, X, Y);
end;

procedure ResultC(C: char; X, Y: integer);
begin
  resultc_('', C, X, Y);
end;

procedure ResultS(Cmt: string; S: string; X, Y: integer);
begin
  results_(PChar(Cmt), PChar(S), X, Y);
end;

procedure ResultS(S: string; X, Y: integer);
begin
  results_('', PChar(S), X, Y);
end;

(*
procedure ResultP(Cmt: string; NP: integer; X, Y: integer);
begin
  resultp_(PChar(Cmt), NP, X, Y);
end;

procedure ResultP(NP: integer; X, Y: integer);
begin
  resultp_('', NP, X, Y);
end;
*)

procedure ResultComment(Cmt: string; X, Y: integer);
begin
  resultcomment_(PChar(Cmt), X, Y);
end;

procedure SetPrecision(N: integer);
begin
  setprecision_(N);
end;

procedure SetTestCount(N: integer);
begin
  settestcount_(N);
end;

procedure SetRequiredDataCount(N: integer);
begin
  setrequireddatacount_(N);
end;

function Center(I, N, W, B: integer): integer;
begin
  result := center_(I, N, W, B);
end;

procedure DataFileN(FileName: string; Y, W: integer);
begin
  datafilen_(PChar(FileName), Y, W);
end;

procedure DataFileR(FileName: string; Y, W: integer);
begin
  datafiler_(PChar(FileName), Y, W);
end;

procedure DataFileC(FileName: string; Y, W: integer);
begin
  datafilec_(PChar(FileName), Y, W);
end;

procedure DataFileS(FileName: string; Y, W: integer);
begin
  datafiles_(PChar(FileName), Y, W);
end;

procedure DataFileT(FileName: string; Y1, Y2: integer);
begin
  datafilet_(PChar(FileName), Y1, Y2);
end;

procedure ResultFileN(FileName: string; Y, W: integer);
begin
  resultfilen_(PChar(FileName), Y, W);
end;

procedure ResultFileR(FileName: string; Y, W: integer);
begin
  resultfiler_(PChar(FileName), Y, W);
end;

procedure ResultFileC(FileName: string; Y, W: integer);
begin
  resultfilec_(PChar(FileName), Y, W);
end;

procedure ResultFileS(FileName: string; Y, W: integer);
begin
  resultfiles_(PChar(FileName), Y, W);
end;

procedure ResultFileT(FileName: string; Y1, Y2: integer);
begin
  resultfilet_(PChar(FileName), Y1, Y2);
end;

//2024.04>
(*

procedure SetPointer(NP: integer; P: PNode);
begin
  setpointer_(NP, P);
end;

procedure DataList(NP: integer; X, Y: integer);
begin
  datalist_(NP, X, Y);
end;

procedure ResultList(NP: integer; X, Y: integer);
begin
  resultlist_(NP, X, Y);
end;

procedure DataBinTree(NP: integer; X, Y1, Y2: integer);
begin
  databintree_(NP, X, Y1, Y2);
end;

procedure ResultBinTree(NP: integer; X, Y1, Y2: integer);
begin
  resultbintree_(NP, X, Y1, Y2);
end;

procedure DataTree(NP: integer; X, Y1, Y2: integer);
begin
  datatree_(NP, X, Y1, Y2);
end;

procedure ResultTree(NP: integer; X, Y1, Y2: integer);
begin
  resulttree_(NP, X, Y1, Y2);
end;

procedure ShowPointer(NP: integer);
begin
  showpointer_(NP);
end;

procedure SetNewNode(NNode: integer);
begin
  setnewnode_(NNode);
end;

procedure SetDisposedNode(NNode: integer);
begin
  setdisposednode_(NNode);
end;

*)
//2024.04<

//2024.04>
(*

function WordCount: integer;
begin
  result := wordcount_;
end;

function SentenceCount: integer;
begin
  result := sentencecount_;
end;

function TextCount: integer;
begin
  result := textcount_;
end;

function WordSample(n: integer): string;
begin
  result := string(wordsample_(n));
end;

function SentenceSample(n: integer): string;
begin
  result := string(sentencesample_(n));
end;

function TextSample(n: integer): string;
begin
  result := string(textsample_(n));
end;

*)
//2024.04<

function EnWordCount: integer;
begin
  result := enwordcount_;
end;

function EnSentenceCount: integer;
begin
  result := ensentencecount_;
end;

function EnTextCount: integer;
begin
  result := entextcount_;
end;

function EnWordSample(n: integer): string;
var s: string;
begin
  SetLength(s, 20); // max = 14
  enwordsample_(n, PChar(s));
  result := PChar(s);
end;

function EnSentenceSample(n: integer): string;
var s: string;
begin
  SetLength(s, 100); // max = 76
  ensentencesample_(n, PChar(s));
  result := PChar(s);
end;

function EnTextSample(n: integer): string;
var s: string;
begin
  SetLength(s, 1100); // max = 1009
  entextsample_(n, PChar(s));
  result := PChar(s);
end;


//2024.04>
(*

procedure CommentText(S: string);
begin
  commenttext_(PChar(S));
end;

procedure UseComment(GroupName, SubgroupName: string);
begin
  usecomment_(PChar(GroupName), PChar(SubgroupName));
end;

procedure UseComment(GroupName: string);
begin
  UseComment(GroupName, '');
end;

procedure Subgroup(SubgroupName: string);
begin
  subgroup_(PChar(SubgroupName));
end;

procedure SetObjectStyle;
begin
  setobjectstyle_;
end;

*)
//2024.04<


procedure ShowError(S1, S2: string);
begin
  writeln(S1+#13#10'is not found '+
      'in the PT5 library.'#13#10'You should update '+
      'the Programming Taskbook to '+S2+' version.');
end;

procedure CreateTask(SubgroupName: string; var ProcessCount: integer);
begin
  if Assigned(createtask2_) then
    createtask2_(PChar(SubgroupName), ProcessCount)
  else
    ShowError('The CreateTask procedure with ProcessCount parameter', '4.9');
end;

procedure CreateTask(var ProcessCount: integer);
begin
  CreateTask('', ProcessCount);
end;

procedure SetProcess(ProcessRank: integer);
begin
  setprocess_(ProcessRank);
end;

function CurrentVersion: string;
begin
  result := currentversion_;
end;

function CurrentTest: integer;
begin
  result := currenttest_;
end;

function RandomN(M, N: integer): integer;
begin
  result := randomn_(M, N);
end;

function RandomR(A, B: real): real;
begin
  result := randomr_(A, B);
end;

function RandomR1(A, B: real): real;
begin
  result := randomr1_(A, B);
end;

function RandomR2(A, B: real): real;
begin
  result := randomr2_(A, B);
end;

//2024.04>
// -----------------------------------------------------------------

procedure SetGroupData(topic, descr, author, key: string; n: integer);
begin
  setgroupdata_(PChar(topic), PChar(descr), PChar(author), PChar(key), n);
end;

procedure ClearGroupData;
begin
  cleargroupdata_;
end;

function GetTopic: string;
var s: string;
begin
  SetLength(s, 20);
  gettopic_(PChar(s));
  result := PChar(s);
end;

function GetTaskCount: integer;
begin
  result := gettaskcount_;
end;

function SetTaskData(task, test: integer): string;
var s: string;
begin
  SetLength(s, 20);
  settaskdata_(task, test, PChar(s));
  result := PChar(s);
end;

function GetTestCount: integer;
begin
  result := gettestcount_;
end;

function GetCode: string;
var s: string;
begin
  SetLength(s, 20);
  getcode_(PChar(s));
  result := PChar(s);
end;

procedure SetLanguage(n: integer);
begin
  setlanguage_(n);
end;

procedure Pause;
begin
  pause_;
end;

procedure NoEraseNextFile;
begin
  noerasenextfile_;
end;

procedure SetFileItemsInLine(N: integer);
begin
  setfileitemsinline_(N);
end;

procedure SetFileRow(N: integer);
begin
  setfileitemsinline_(N);
end;

procedure TaskText(S: string);
begin
  tasktext0_(PChar(S));
end;

procedure SetNumberOfTests(n: integer);
begin
  settestcount_(n);
end;

procedure SetNumberOfUsedData(n: integer);
begin
  setrequireddatacount_(n);
end;

procedure Start(name, topic, author, key: string; lvl: integer);
begin
  start_(PChar(name), PChar(topic), PChar(author), PChar(key), lvl);
end;

procedure getVariant(code,nv1,nv2,nv3 : byte; var v1,v2,v3 : byte);
begin
  v1 := getvariant_(code, nv1, nv2, nv3);
  v2 := 0;
  v3 := 0;
end;

function curtest: integer;
begin
  result := currenttest_;
end;

procedure CommentText(S: string);
begin
  // ��������!!!
end;

/// ������������� ����� ���������� ����������� � ��������� �������
procedure Subgroup(SubgroupName: string);
begin
  // ��������!!!
end;

// -----------------------------------------------------------------
//2024.04<



//{$IFNDEF FPC}
//exports activate;
//{$ENDIF}

initialization

finalization
  {$IFDEF WINDOWS}
  FreeLibrary(FHandle);
  {$ENDIF}
  {$IFDEF LINUX}
  UnloadLibrary(FHandle);
  {$ENDIF}

end.

