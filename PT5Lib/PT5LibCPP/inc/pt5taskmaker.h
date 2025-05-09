#ifndef _PT5TASKMAKER

#define _PT5TASKMAKER

//#include <windows.h>
#include <string>

//------------------------------------------------------------------------------
// ����������� ��� ������������ ��������� Programming Taskbook 5.1
//------------------------------------------------------------------------------
// ������������ ���� ������ ��� �������� ������������ ��������� 
//   � �������� ������� �� ����� C++
//
// Copyright (c) 2013-2024 �.�.�������
// ����������� �������� Programming Taskbook Copyright (c) �.�.�������,1998-2024
//------------------------------------------------------------------------------

using namespace std;
#pragma GCC visibility push(default)

extern "C" void activate(const char*);   // Use appropriate parameter types
extern "C" int initgroup(char*, char*, int);  // Use appropriate parameter types
extern "C" int inittask(int, int);  // Use appropriate parameter types

#pragma GCC visibility pop
//#pragma comment(linker, "/export:activate=_activate@4")
//#pragma comment(linker, "/export:initgroup=_initgroup@12")
//#pragma comment(linker, "/export:inittask=_inittask@8")

#define xCenter 0
#define xLeft 100
#define xRight 200

#define SampleError "#ERROR?"
#define MaxLineCount 50

#define lgPascal       0x0000001 
#define lgPascalABCNET 0x0000401 
#define lgPascalNET    0x0000400
#define lgPascalABCNET_flag 0x0000400 // ��������� � ������ 4.14
#define lgVB           0x0000002
#define lgCPP          0x0000004
#define lg1C           0x0000040
#define lgPython       0x0000080 
#define lgPython3      0x1000080 // ��������� � ������ 4.14
#define lgPython3_flag 0x1000000 // ��������� � ������ 4.14
#define lgCS           0x0000100
#define lgVBNET        0x0000200
#define lgJava         0x0010000 // ��������� � ������ 4.11
#define lgRuby         0x0020000 // ��������� � ������ 4.12
#define lgWithPointers 0x000003D
#define lgWithObjects  0x0FFFF80 // �������� � ������ 4.22
#define lgNET          0x000FF00
#define lgAll          0x0FFFFFF // �������� � ������ 4.10
#define lgFS           0x0000800 // ��������� � ������ 4.19
#define lgJulia        0x0040000 // ��������� � ������ 4.22
#define lgC            0x0000008 // ��������� � ������ 4.23

/*
/// ���� ������������ ���������
struct TNode
{
  int Data;
  TNode* Next;
  TNode* Prev;
  TNode* Left;
  TNode* Right;
  TNode* Parent;
};

/// ��������� �� ���� ������������ ���������
typedef TNode* PNode;
*/
/// ����������� ���, ������������ ��� �������� ����� �������
typedef void (*TInitTaskProc)(int);

/// ��������� � ��������� ����� ������ ������� � ���������� ����������������
void CreateGroup(const char* GroupName, const char* GroupDescription, 
  const char* GroupAuthor, const char* GroupKey, int TaskCount, 
  TInitTaskProc InitTaskProc);

/// ��������� � ����������� ������ ������� �� ������ ������
void UseTask(const char* GroupName, int TaskNumber);
/*
/// ��������� � ����������� ������ ������� �� ������ ������
void UseTask(const char* GroupName, int TaskNumber, const char* TopicDescription); // ��������� � ������ 4.19
*/
/// ������ ����������� ������ ��� ����������� ������ �������
void CreateTask(const char* SubgroupName);

/// ������ ����������� ������ ��� ����������� ������ �������
void CreateTask();

/// ������ ����������� ������ ��� ����������� ������ �������
/// (������� ��� ������������� ������ ���������)
void CreateTask(const char* SubgroupName, int* ProcessCount);

//// ������ ����������� ������ ��� ����������� ������ �������
/// (������� ��� ������������� ������ ���������)
void CreateTask(int* ProcessCount);

/// ��������� ���������� ������� ���� ����������������, ��������� ��� ���������
/// ���������� ��������, ��������� � ����������� lgXXX
int CurrentLanguage();
/*
/// ���������� ������������� ������ � ��������� ������� ������
/// (� ����� ������ ������������ ���� "ru", ���� "en")
char* CurrentLocale();
*/
/// ���������� ����� ������� ������ ��������� � ������� "d.dd"
/// (��� ������, ������� 4.10, ���������� "4.00")
char* CurrentVersion();  // ��������� � ������ 4.10

//-----------------------------------------------------------------------------

/// ��������� � ������������ ������� ������
void TaskText(const char* S, int X , int Y);

/// ���������� ��� ������ ������������ �������
/// (� ��������� S ��������� ������ ������������
/// ������ ����������� ��������� \r, \n ��� ����� \r\n;
/// ��������� � �������� ������� � ������� ���������,
/// ������ ������ � ������������ �� ����������)
void TaskText(const char* S); // ��������� � ������ 4.11

//-----------------------------------------------------------------------------

/// ��������� � �������� ������ ������� ����������� ���� � ������������
void DataB(const char* Cmt, bool B, int X, int Y);

/// ��������� � �������� ������ ������� ����������� ����
void DataB(bool B, int X, int Y); // ��������� � ������ 4.11

/// ��������� � �������� ������ ������������� ������� � ������������
void DataN(const char* Cmt, int N, int X, int Y, int W);

/// ��������� � �������� ������ ������������� �������
void DataN(int N, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������� �������� � ����� ������������
void DataN2(const char* Cmt, int N1, int N2, int X, int Y, int W);

/// ��������� � �������� ������ ��� ������������� ��������
void DataN2(int N1, int N2, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������� �������� � ����� ������������
void DataN3(const char* Cmt, int N1, int  N2, int  N3, int X, int Y, int W);

/// ��������� � �������� ������ ��� ������������� ��������
void DataN3(int N1, int  N2, int  N3, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ������������ ������� � ������������
void DataR(const char* Cmt, double R, int  X, int Y, int W);

/// ��������� � �������� ������ ������������ �������
void DataR(double R, int  X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������ �������� � ����� ������������
void DataR2(const char* Cmt, double R1, double R2, int X, int Y, int W);

/// ��������� � �������� ������ ��� ������������ ��������
void DataR2(double R1, double R2, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ��� ������������ �������� � ����� ������������
void DataR3(const char* Cmt, double R1, double R2, double R3, int  X, int Y, int W);

/// ��������� � �������� ������ ��� ������������ ��������
void DataR3(double R1, double R2, double R3, int  X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������� ������ ���������� ������� � ������������
void DataC(const char* Cmt, char C, int  X, int Y);

/// ��������� � �������� ������ ���������� �������
void DataC(char C, int  X, int Y); // ��������� � ������ 4.11

/// ��������� � �������� ������ ��������� ������� � ������������
void DataS(const char* Cmt, const char* S, int X, int Y);

/// ��������� � �������� ������ ��������� �������
void DataS(const char* S, int X, int Y); // ��������� � ������ 4.11
/*
/// ��������� � �������� ������ ������� ���� PNode � ������������
void DataP(const char* Cmt, int NP, int X, int Y);

/// ��������� � �������� ������ ������� ���� PNode
void DataP(int NP, int X, int Y); // ��������� � ������ 4.11
*/
/// ��������� ����������� � ������� �������� ������
void  DataComment(const char* Cmt, int  X, int Y);

//-----------------------------------------------------------------------------

/// ��������� � �������������� ������ ���������� ������� � ������������
void ResultB(const char* Cmt, bool B, int X, int Y);

/// ��������� � �������������� ������ ���������� �������
void ResultB(bool B, int X, int Y); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ������������� ������� � ������������
void ResultN(const char* Cmt, int N, int X, int Y, int W);

/// ��������� � �������������� ������ ������������� �������
void ResultN(int N, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������� �������� � ����� ������������
void ResultN2(const char* Cmt, int N1, int N2, int X, int Y, int W);

/// ��������� � �������������� ������ ��� ������������� ��������
void ResultN2(int N1, int N2, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������� �������� � ����� ������������
void ResultN3(const char* Cmt, int N1, int N2, int N3, int X, int Y, int W);

/// ��������� � �������������� ������ ��� ������������� ��������
void ResultN3(int N1, int N2, int N3, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ������������ ������� � ������������
void ResultR(const char* Cmt, double R, int X, int Y, int W);

/// ��������� � �������������� ������ ������������ �������
void ResultR(double R, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������ �������� � ����� ������������
void ResultR2(const char* Cmt, double R1, double R2, int X, int Y, int W);

/// ��������� � �������������� ������ ��� ������������ ��������
void ResultR2(double R1, double R2, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��� ������������ �������� � ����� ������������
void ResultR3(const char* Cmt, double R1, double R2, double R3, int X, int Y, int W);

/// ��������� � �������������� ������ ��� ������������ ��������
void ResultR3(double R1, double R2, double R3, int X, int Y, int W); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ���������� ������� � ������������
void ResultC(const char* Cmt, char C, int X, int Y);

/// ��������� � �������������� ������ ���������� �������
void ResultC(char C, int X, int Y); // ��������� � ������ 4.11

/// ��������� � �������������� ������ ��������� ������� � ������������
void ResultS(const char* Cmt, const char* S, int X, int Y);

/// ��������� � �������������� ������ ��������� �������
void ResultS(const char* S, int X, int Y); // ��������� � ������ 4.11
/*
/// ��������� � �������������� ������ ������� ���� PNode � ������������
void ResultP(const char* Cmt, int NP, int X, int Y);

/// ��������� � �������������� ������ ������� ���� PNode
void ResultP(int NP, int X, int Y); // ��������� � ������ 4.11
*/
/// ��������� ����������� � ������� �������������� ������
void ResultComment(const char* Cmt, int X, int Y);

//-----------------------------------------------------------------------------

/// ������ ����� ������� ������ ��� ����������� ������������ �����
void SetPrecision(int N);

/// ������ ����� �������� ������, ���������� �����������
/// ��� ���������� ���������� �������������� ������
void SetRequiredDataCount(int N);

/// ������ ����� �������� ��������� (�� 2 �� 9), ��� ��������
/// ����������� ������� ������� ����� ��������� �����������
void SetTestCount(int N);

/// ���������� �������������� ����������, ������� � ������� ������� �������� I-� ������� �� ������,
/// ����������� N ���������, ��� �������, ��� ������ ������� �������� ����� W, � ����� ����������
/// ���� ��������� B �������� (�������� ���������� �� 1)
int Center(int I, int  N, int  W, int B);

/// ���������� ��������������� ����� �����, �������
/// � ��������� �� M �� N ������������. ���� ���������
/// �������� ����, �� ���������� M.
int RandomN(int M, int N); // ��������� � ������ 4.11

/// ���������� ��������������� ������������ �����, �������
/// �� ������������� [A, B). ���� ��������� ������������
/// ����, �� ���������� A.
double RandomR(double A, double B); // ��������� � ������ 4.11

/// ���������� ���������� ����� �������� ��������� �������
/// (����������� ������ �������� �������� �������). ���� ����� ��������
/// �������� �� ����, �� ���������� 1. ���� ������� ��� ���������
/// ��� �������� � ���������������� ������, �� ���������� 0.
/// ��� ������������� ���������� ������ ��������� (�� 4.10 ������������)
/// ������ ���������� 0.
int CurrentTest(); // ��������� � ������ 4.11

//-----------------------------------------------------------------------------

/// ��������� � �������� ������ �������� ���� � �������������� ����������
void DataFileN(const char* FileName, int Y, int W);

/// ��������� � �������� ������ �������� ���� � ������������� ����������
void DataFileR(const char* FileName, int Y, int W);

/// ��������� � �������� ������ �������� ���� � ����������� ����������
void DataFileC(const char* FileName, int Y, int W);

/// ��������� � �������� ������ �������� ���� �� ���������� ����������
void DataFileS(const char* FileName, int Y, int W);

/// ��������� � �������� ������ ��������� ����
void DataFileT(const char* FileName, int Y1, int Y2);

//-----------------------------------------------------------------------------

/// ��������� � �������������� ������ �������� ���� � �������������� ����������
void ResultFileN(const char* FileName, int Y, int W);

/// ��������� � �������������� ������ �������� ���� � ������������� ����������
void ResultFileR(const char* FileName, int Y, int W);

/// ��������� � �������������� ������ �������� ���� � ����������� ����������
void ResultFileC(const char* FileName, int Y, int W);

/// ��������� � �������������� ������ �������� ���� �� ���������� ����������
void ResultFileS(const char* FileName, int Y, int W);

/// ��������� � �������������� ������ ��������� ����
void ResultFileT(const char* FileName, int Y1, int Y2);

//-----------------------------------------------------------------------------
/*
/// ��������� ����� NP � ���������� P
void SetPointer(int NP, PNode P);

/// ��������� � �������� ������ �������� ������������ ���������
void DataList(int NP, int X, int Y);

/// ��������� � �������������� ������ �������� ������������ ���������
void ResultList(int NP, int X, int Y);

/// ��������� � �������� ������ �������� ������
void DataBinTree(int NP, int X, int Y1, int Y2);

/// ��������� � �������������� ������ �������� ������
void ResultBinTree(int NP, int X, int Y1, int Y2);

/// ��������� � �������� ������ ������ ������ ����
void DataTree(int NP, int X, int Y1, int Y2);

/// ��������� � �������������� ������ ������ ������ ����
void ResultTree(int NP, int X, int Y1, int Y2);

/// ���������� � ������� ������������ ��������� ��������� � ������� NP
void ShowPointer(int NP);

/// �������� � ������� �������������� ������������ ��������� ���������, ��������� ��������
void SetNewNode(int NNode);

/// �������� � ������� �������� ������������ ��������� ���������, ��������� ��������
void SetDisposedNode(int NNode);

//-----------------------------------------------------------------------------

/// ���������� ���������� ����-�������� ��� �����, ���������������� ������� ������
int WordCount(); //116

/// ���������� ���������� �����������-�������� ��� �����, ���������������� ������� ������
int SentenceCount(); //61

/// ���������� ���������� �������-�������� ��� �����, ���������������� ������� ������
int TextCount(); //85

/// ���������� �����-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������
char* WordSample(int N);

/// ���������� �����������-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������
char* SentenceSample(int N);

/// ���������� �����-������� � ������� N (��������� �� 0) ��� �����, ���������������� ������� ������,
/// ����� �������� ������ ������������� ������� \r\n, � ����� ������ ��� ������� �����������,
/// ����� ����� �� ��������� MaxLineCount, ����� �������� ������ ���������� ���� ������ ������
char* TextSample(int N);
*/
//-----------------------------------------------------------------------------

/// ���������� ���������� ���������� ����-��������
int EnWordCount(); //116

/// ���������� ���������� ���������� �����������-��������
int EnSentenceCount(); //61

/// ���������� ���������� ���������� �������-��������
int EnTextCount(); //85

/// ���������� ���������� �����-������� � ������� N (��������� �� 0)
string EnWordSample(int N);

/// ���������� ���������� �����������-������� � ������� N (��������� �� 0)
string EnSentenceSample(int N);

/// ���������� ���������� �����-������� � ������� N (��������� �� 0),
/// ����� �������� ������ ������������� ������� \r\n, � ����� ������ ��� ������� �����������,
/// ����� ����� �� ��������� MaxLineCount, ����� �������� ������ ���������� ���� ������ ������
string EnTextSample(int N);

//-----------------------------------------------------------------------------
/*
/// ��������� ������ ����������� � ������� ������ ��� ��������� �������
void CommentText(const char* S);

/// ��������� ����������� �� ������ ������ ������� (��� �� ���������,
/// ���� �� ������ �������� �� �������� ������ �������)
void UseComment(const char* GroupName,const char* SubgroupName);

/// ��������� ����������� �� ������ ������ �������
void UseComment(const char* GroupName);

/// ������������� ����� ���������� ����������� � ��������� �������
void Subgroup(const char* SubgroupName);

//-----------------------------------------------------------------------------

/// ���������, �������������� ����������� ������������ �������� ������
/// � "��������� �����" ��� ���������� ������� � ����� PascalABC.NET
/// (��� ������������� ������ ���� �� ��������� ������� ��������)
void SetObjectStyle();
*/
//-----------------------------------------------------------------------------

//2024.04>
/// ��������� ��� ����������� ������������� ��� ���������� �������
extern "C"  void  activate(const char * DllName);
extern "C"  int  initgroup(char *name, char *code, int lang);
extern "C"  int  inittask(int num, int test);
//2024.04<

//-----------------------------------------------------------------------------

/// ������������� ������� ������� ��� ����������� �������� ��� ������ 
/// �������� ����� (��� ���������� ������� � ������������ ������)
void SetProcess(int ProcessRank);

//-----------------------------------------------------------------------------

//2024.04>
// -----------------------------------------------------------------

/// ������������� ������� ��������� ������
void SetGroupData(const char *topic, const char *descr, const char *author, const char *key, int n);

/// ���������� ���������, ������������� ��� ���������� ������
void ClearGroupData();

/// ���������� ��� ������ �������
std::string GetTopic();

/// ���������� ���������� ������� � ������
int GetTaskCount();

/// ������������� ����� ������� � ����� �����;
/// ���������� ��� ������� ������ ������� � ������� ��������
std::string SetTaskData(int task, int test);

/// ���������� ���������� �������� ��������� ��� �������� �������
int GetTestCount();

/// ���������� ��� ��� ������� ������
std::string GetCode();

/// ������������� ���� ��� ������������ �������
void SetLanguage(int n);

/// �������� ����������� �������� ����� � ������������ �������
/// ����� ��� ����������� � �������
/// (��� �� �����, ��� ������ ������� Pause, � ����� ������������ �������,
/// ��� ����� ����� ����������� ���������)
void NoEraseNextFile();

/// ������ ���������� ��������� ��������� �����, ������������ �� ����� ������,
/// ���� ��������� �������� ����������, ������������ �� ���������
void SetFileRow(int N);

/// ������ ������� ������ ���������� ����� ���������� ������������ �������
void Pause();

/// ��������������� �������, ������������� ��� ������ ������� � �������� ��������
std::string TopicToUpperCase(const std::string& topic);

void CommentText(const char* S);

// -----------------------------------------------------------------
//2024.04<



#endif
