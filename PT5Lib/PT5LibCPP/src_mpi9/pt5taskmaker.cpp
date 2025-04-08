#include <ctime>
#include <string>
#include <iostream>
#include <dlfcn.h>
#include "pt5taskmaker.h"

//------------------------------------------------------------------------------
// ����������� ��� ������������ ��������� Programming Taskbook 5.1
//------------------------------------------------------------------------------
// ������ ��� �������� ������������-��������� � �������� ������� �� ����� C++
//
// Copyright (c) 2013-2024 �.�.�������
// ����������� �������� Programming Taskbook Copyright (c) �.�.�������,1998-2024
//------------------------------------------------------------------------------


typedef  int    ( *TNFunc)(void);
typedef  int    ( *TNFuncN4)(int, int, int, int);
typedef         char*   (  *TSFunc)(void);
typedef         char* (  *TSFuncN)(int);
typedef         void    (  *TProc)(void);
typedef         void    (  *TProcS)(const char *);  
typedef         void    (  *TProcSCN2)(const char *, char, int, int);  
typedef         void    (  *TProcSN)(const char *, int);  
typedef         void    (  *TProcSN2)(const char *, int, int);    
typedef         void    (  *TProcSN3)(const char *, int, int, int);    
typedef         void    (  *TProcSN4)(const char *, int, int, int, int);    
typedef         void    (  *TProcSN5)(const char *, int, int, int, int, int);      
typedef         void    (  *TProcSN6)(const char *, int, int, int, int, int, int);        
typedef         void    (  *TProcSRN3)(const char *, double, int, int, int);    
typedef         void    (  *TProcSR2N3)(const char *, double, double, int, int, int);    
typedef         void    (  *TProcSR3N3)(const char *, double, double, double, int, int, int);    
typedef         void    (  *TProcS2)(const char *, const char *);    
typedef         void    (  *TProcS2N2)(const char *, const char *, int, int);      
typedef         void    (  *TProcS4NP)(const char *, const char *, const char *, const char *, int, void *);      
typedef         void    (  *TProcN)(int);      
typedef         void    (  *TProcNP)(int, void *);      
typedef         void    (  *TProcN2)(int, int);        
typedef         void    (  *TProcN3)(int, int, int);        
typedef         void    (  *TProcN4)(int, int, int, int);        
typedef         void    (  *TProcSvN)(const char *, int *);        
typedef         void    (  *TProcSNS)(const char *, int, const char *);        
//typedef         int     (  *TMsgBox)(int, const char *, const char *, int);

//2024.04>
typedef         void    (  *TProcvS)(char *);
typedef         void  (  *TProcN2vS)(int, int, char *);
typedef         int  (  *TNFuncN2)(int, int);
typedef         double  (  *TRFuncR2)(double, double);
typedef         void  (  *TProcNvS)(int, char *);
typedef         void  (  *TProcS4N)(const char *, const char *, const char *, const char *, int);
//2024.04>





class  PT5TaskMakerLink {

protected :
                TProcS4NP       creategroup_;
                TProcSN         usetask_;
                TProcS          createtask_;
                TNFunc          currentlanguage_;
                //TSFunc          currentlocale_;
                TProcSN2        tasktext_;
                TProcSN3        datab_, resultb_;
                TProcSN4        datan_, resultn_;
                TProcSN5        datan2_, resultn2_;
                TProcSN6        datan3_, resultn3_;
                TProcSRN3       datar_, resultr_;
                TProcSR2N3      datar2_, resultr2_;
                TProcSR3N3      datar3_, resultr3_;
                TProcSCN2       datac_, resultc_;
                TProcS2N2       datas_, results_;
                //TProcSN3        datap_, resultp_;
                TProcSN2        datacomment_, resultcomment_;
                TProcN          setprecision_, settestcount_, setrequireddatacount_;
                TNFuncN4        center_;
                TProcSN2        datafilen_, datafiler_, datafilec_, datafiles_, datafilet_;
                TProcSN2        resultfilen_, resultfiler_, resultfilec_, resultfiles_, resultfilet_;
                //TProcNP         setpointer_;
                //TProcN3         datalist_, resultlist_;
                //TProcN4         databintree_, datatree_, resultbintree_, resulttree_;
                //TProcN          showpointer_, setnewnode_, setdisposednode_;
                //TNFunc          wordcount_, sentencecount_, textcount_;
                TNFunc          enwordcount_, ensentencecount_, entextcount_;
                //TSFuncN         wordsample_, sentencesample_, textsample_;
                TProcNvS         enwordsample_, ensentencesample_, entextsample_; //2024.04 !!!!!
                //TProcS          commenttext_;
                //TProcS2         usecomment_ ;
                //TProcS          subgroup_;
                //TProc           setobjectstyle_;
                TProcSvN        createtask2_;
                TProcN          setprocess_;
                TSFunc          currentversion_; // ��������� � ������ 4.10
                TNFunc          currenttest_; // ��������� � ������ 4.11
                //TProcSNS        usetaskex_; // ��������� � ������ 4.19
                //TMsgBox         msgbox_;
                //2024.04> // �������, ����������� � ������ 5
                TProc  cleargroupdata_;
                TProcvS  gettopic_;
                TNFunc  gettaskcount_;
                TProcN2vS  settaskdata_;
                TNFunc  gettestcount_;
                TProcvS  getcode_;
                TProcN  setlanguage_;
                TProc  noerasenextfile_;
                TProc  pause_;
                TNFuncN2  randomn_;
                TRFuncR2  randomr_;
                TProcS  tasktext0_;
                TProcS4N  start_;
                TNFuncN4  getvariant_;
                TProcN  setfileitemsinline_;
                TProcS4N  setgroupdata_;
                //2024.04<

                void* FHandle;//HMODULE         FHandle; //, User32Handle ;

private:
        PT5TaskMakerLink(PT5TaskMakerLink&);
        PT5TaskMakerLink & operator=(PT5TaskMakerLink&);
        void ShowError(const char* S1, const char* S2) ;
        
public: 
        PT5TaskMakerLink() {};
        virtual ~PT5TaskMakerLink() 
        { 
            dlclose(FHandle);//UnloadLibrary(FHandle);//FreeLibrary (FHandle); 
            //FreeLibrary (User32Handle); 
        };

        inline void CreateGroup(const char*             GroupName, 
                                        const char*             GroupDescription, 
                                        const char*             GroupAuthor,
                                        const char*             GroupKey,
                                        int     TaskCount,
                                        TInitTaskProc   InitTaskProc);

        inline void UseTask(const char* GroupName, int TaskNumber);
        inline void CreateTask(const char* SubgroupName, int*);
        inline void CreateTask(const char* SubgroupName);
        inline void CreateTask(int *);
        inline int CurrentLanguage();
        //inline char* CurrentLocale();
        inline char* CurrentVersion();  // ��������� � ������ 4.10
        inline void TaskText(const char* S, int X , int Y);
        inline void DataB(const char*  Cmt, bool B, int X, int Y);
        inline void DataN(const char* Cmt, int N, int X, int Y, int W);
        inline void DataN(const char* Cmt, int  N1, int N2, int  X, int  Y, int  W);
        inline void DataN(const char* Cmt, int N1, int  N2, int  N3, int X, int Y, int W);
        inline void DataR(const char* Cmt, double R, int  X, int Y, int W);
        inline void DataR(const char* Cmt, double R1, double R2, int X, int Y, int W);
        inline void DataR(const char* Cmt, double R1, double R2, double R3, int  X, int Y, int W);
        inline void DataC(const char* Cmt,  char C, int  X, int Y);
        inline void DataS(const char* Cmt, const char* S,  int X,  int Y);
        //inline void DataP(const char* Cmt, int NP,  int X,  int Y);
        inline void DataComment(const char* Cmt, int  X, int Y);
        inline void ResultB(const char* Cmt, bool  B, int X, int Y);
        inline void ResultN(const char* Cmt, int  N, int X, int Y, int  W);
        inline void ResultN(const char* Cmt, int N1, int N2, int X, int Y, int W);
        inline void ResultN(const char* Cmt, int N1, int N2, int N3, int X, int Y, int W);
        inline void ResultR(const char* Cmt, double R, int X, int Y, int W);
        inline void ResultR(const char* Cmt, double R1, double R2, int X, int Y, int W);
        inline void ResultR(const char* Cmt, double R1, double  R2, double R3, int X, int Y,  int W);
        inline void ResultC(const char* Cmt,  char C, int X, int Y);
        inline void ResultS(const char* Cmt, const char* S, int X, int Y);
        //inline void ResultP(const char* Cmt, int NP, int X, int Y);
        inline void ResultComment(const char* Cmt, int X, int Y);
        inline void SetPrecision(int N);
        inline void SetRequiredDataCount(int N);
        inline void SetTestCount(int N);
        inline int  Center(int I, int  N, int  W, int B);
        inline void DataFileN(const char* FileName, int Y, int W);
        inline void DataFileR(const char* FileName, int Y, int W);
        inline void DataFileC(const char* FileName, int Y, int W);
        inline void DataFileS(const char* FileName, int Y, int W);
        inline void DataFileT(const char* FileName, int Y1, int Y2);
        inline void ResultFileN(const char* FileName,  int Y, int W);
        inline void ResultFileR(const char* FileName, int Y, int W);
        inline void ResultFileC(const char* FileName,  int Y, int W);
        inline void ResultFileS(const char* FileName, int Y, int W);
        inline void ResultFileT(const char* FileName, int Y1, int Y2);
        //inline void SetPointer(int NP, PNode P);
        //inline void DataList(int NP, int X, int Y);
        //inline void ResultList(int NP, int X, int Y);
        //inline void DataBinTree(int NP, int X, int Y1, int Y2);
        //inline void ResultBinTree(int NP, int X, int Y1, int Y2);
        //inline void DataTree(int NP,  int X, int Y1, int Y2);
        //inline void ResultTree(int NP, int X, int Y1, int Y2);
        //inline void ShowPointer( int NP);
        //inline void SetNewNode(int NNode);
        //inline void SetDisposedNode(int NNode);
        //inline int WordCount();     //116
        //inline int SentenceCount(); //61
        //inline int TextCount();     //85
        //inline char* WordSample(int N);
        //inline char* SentenceSample(int N);
        //inline char* TextSample(int N);
        inline int EnWordCount();     //116
        inline int EnSentenceCount(); //61
        inline int EnTextCount();     //85
        inline std::string EnWordSample(int N);
        inline std::string EnSentenceSample(int N);
        inline std::string EnTextSample(int N);
        //inline void CommentText(const char* S);
        //inline void UseComment(const char* GroupName,const char* SubgroupName);
        //inline void UseComment(const char* GroupName);
        //inline void Subgroup(const char* SubgroupName);
        //inline void SetObjectStyle();
        inline void activate(const char * DllName);
        inline void SetProcess(int ProcessRank);
        inline int CurrentTest(); // ��������� � ������ 4.11
        //inline void UseTask(const char* GroupName, int TaskNumber, const char* TopicDescription); // ��������� � ������ 4.19

//2024.04>
        inline void SetGroupData(const char* topic, const char* descr, const char* author, const char* key, int n);
        inline void ClearGroupData();
        inline std::string GetTopic();
        inline int GetTaskCount();
        inline std::string SetTaskData(int task, int test);
        inline int GetTestCount();
        inline std::string GetCode();
        inline void SetLanguage(int n);
        inline void Pause();
        inline void NoEraseNextFile();
        inline void SetFileRow(int N);
        inline void TaskText(const char* S);
        inline int RandomN(int M, int N);
        inline double RandomR(double A, double B);

//2024.04<
};


PT5TaskMakerLink PTLink;

void * GetProcAddress1(void* handle, const char *s)
{
   void *p = dlsym(handle, s);
   if (p == 0)
      std::cout << "Not found: " << s << '\n';
   return p;
}


void PT5TaskMakerLink::activate(const char* DllName) {
                
                //User32Handle = LoadLibraryA("User32.dll");
                //msgbox_ = (TMsgBox) GetProcAddress(User32Handle, "MessageBoxA");
                FHandle = dlopen(DllName, RTLD_LAZY);
                creategroup_ = (TProcS4NP) GetProcAddress1(FHandle, "creategroup");
                usetask_ = (TProcSN) GetProcAddress1(FHandle, "usetask");
                createtask_ = (TProcS)GetProcAddress1(FHandle, "createtask");
                currentlanguage_ =(TNFunc)  GetProcAddress1(FHandle, "currentlanguage");
                //currentlocale_ = (TSFunc) GetProcAddress1(FHandle, "currentlocale");
                tasktext_ =  (TProcSN2) GetProcAddress1(FHandle, "tasktext");
                datab_ =(TProcSN3) GetProcAddress1(FHandle, "datab");
                datan_ = (TProcSN4) GetProcAddress1(FHandle, "datan");
                datan2_ =(TProcSN5) GetProcAddress1(FHandle, "datan2");
                datan3_ = (TProcSN6) GetProcAddress1(FHandle, "datan3");
                datar_ =(TProcSRN3) GetProcAddress1(FHandle, "datar");
                datar2_ = (TProcSR2N3)GetProcAddress1(FHandle, "datar2");
                datar3_ = (TProcSR3N3)GetProcAddress1(FHandle, "datar3");
                datac_ =(TProcSCN2) GetProcAddress1(FHandle, "datac");
                datas_ = (TProcS2N2) GetProcAddress1(FHandle, "datas");
//                datap_ = (TProcSN3)GetProcAddress1(FHandle, "datap");
                datacomment_ = (TProcSN2)GetProcAddress1(FHandle, "datacomment");
                resultb_ = (TProcSN3)GetProcAddress1(FHandle, "resultb");
                resultn_ =(TProcSN4) GetProcAddress1(FHandle, "resultn");
                resultn2_ =(TProcSN5) GetProcAddress1(FHandle, "resultn2");
                resultn3_ = (TProcSN6)GetProcAddress1(FHandle, "resultn3");
                resultr_ = (TProcSRN3) GetProcAddress1(FHandle, "resultr");
                resultr2_ =(TProcSR2N3) GetProcAddress1(FHandle, "resultr2");
                resultr3_ = (TProcSR3N3)GetProcAddress1(FHandle, "resultr3");
                resultc_ = (TProcSCN2)  GetProcAddress1(FHandle, "resultc");
                results_ = (TProcS2N2)  GetProcAddress1(FHandle, "results");
//                resultp_ = (TProcSN3) GetProcAddress1(FHandle, "resultp");
                resultcomment_ = (TProcSN2) GetProcAddress1(FHandle, "resultcomment");
                setprecision_ = (TProcN) GetProcAddress1(FHandle, "setprecision");
                settestcount_ = (TProcN) GetProcAddress1(FHandle, "settestcount");
                setrequireddatacount_ = (TProcN) GetProcAddress1(FHandle, "setrequireddatacount");
                center_ = (TNFuncN4) GetProcAddress1(FHandle, "center");
                datafilen_ = (TProcSN2) GetProcAddress1(FHandle, "datafilen");
                datafiler_ = (TProcSN2) GetProcAddress1(FHandle, "datafiler");
                datafilec_ =(TProcSN2) GetProcAddress1(FHandle, "datafilec");
                datafiles_ =(TProcSN2) GetProcAddress1(FHandle, "datafiles");
                datafilet_ = (TProcSN2)GetProcAddress1(FHandle, "datafilet");
                resultfilen_ = (TProcSN2)GetProcAddress1(FHandle, "resultfilen");
                resultfiler_ = (TProcSN2)GetProcAddress1(FHandle, "resultfiler");
                resultfilec_ = (TProcSN2)GetProcAddress1(FHandle, "resultfilec");
                resultfiles_ =(TProcSN2) GetProcAddress1(FHandle, "resultfiles");
                resultfilet_ = (TProcSN2)GetProcAddress1(FHandle, "resultfilet");
//                setpointer_ =(TProcNP) GetProcAddress1(FHandle, "setpointer");
//                datalist_ =(TProcN3) GetProcAddress1(FHandle, "datalist");
//                resultlist_ = (TProcN3)GetProcAddress1(FHandle, "resultlist");
//                databintree_ =(TProcN4) GetProcAddress1(FHandle, "databintree");
//                datatree_ = (TProcN4) GetProcAddress1(FHandle, "datatree");
//                resultbintree_ = (TProcN4)GetProcAddress1(FHandle, "resultbintree");
//                resulttree_ =(TProcN4) GetProcAddress1(FHandle, "resulttree");
//                showpointer_ =(TProcN) GetProcAddress1(FHandle, "showpointer");
//                setnewnode_ =(TProcN) GetProcAddress1(FHandle, "setnewnode");
//                setdisposednode_ = (TProcN)GetProcAddress1(FHandle, "setdisposednode");
//                wordcount_ =(TNFunc) GetProcAddress1(FHandle, "wordcount");
//                sentencecount_ =(TNFunc) GetProcAddress1(FHandle, "sentencecount");
//                textcount_ = (TNFunc)GetProcAddress1(FHandle, "textcount");
//                wordsample_ =(TSFuncN) GetProcAddress1(FHandle, "wordsample");
//                sentencesample_ = (TSFuncN)GetProcAddress1(FHandle, "sentencesample");
//                textsample_ = (TSFuncN)GetProcAddress1(FHandle, "textsample");
                enwordcount_ = (TNFunc)GetProcAddress1(FHandle, "enwordcount");
                ensentencecount_ = (TNFunc)GetProcAddress1(FHandle, "ensentencecount");
                entextcount_ = (TNFunc)GetProcAddress1(FHandle, "entextcount");
                enwordsample_ = (TProcNvS) GetProcAddress1(FHandle, "enwordsample");
                ensentencesample_ = (TProcNvS)GetProcAddress1(FHandle, "ensentencesample");
                entextsample_ =(TProcNvS) GetProcAddress1(FHandle, "entextsample");
//                commenttext_ =(TProcS) GetProcAddress1(FHandle, "commenttext");
//                usecomment_ = (TProcS2)GetProcAddress1(FHandle, "usecomment");
//                subgroup_ = (TProcS) GetProcAddress1(FHandle, "subgroup");
//                setobjectstyle_ = (TProc) GetProcAddress1(FHandle, "setobjectstyle");
                createtask2_ = (TProcSvN) GetProcAddress1(FHandle, "createtask2");
                setprocess_ = (TProcN) GetProcAddress1(FHandle, "setprocess");
                currentversion_ = (TSFunc) GetProcAddress1(FHandle, "currentversion"); // ��������� � ������ 4.10
                currenttest_ = (TNFunc) GetProcAddress1(FHandle, "curt"); // ��������� � ������ 4.11
//                usetaskex_ = (TProcSNS) GetProcAddress1(FHandle, "usetaskex"); // ��������� � ������ 4.19
//2024.04>
  cleargroupdata_= (TProc)GetProcAddress1(FHandle, "cleargroupdata");
  gettopic_= (TProcvS)GetProcAddress1(FHandle, "gettopic");
  gettaskcount_= (TNFunc)GetProcAddress1(FHandle, "gettaskcount");
  settaskdata_= (TProcN2vS)GetProcAddress1(FHandle, "settaskdata");
  gettestcount_= (TNFunc)GetProcAddress1(FHandle, "gettestcount");
  getcode_= (TProcvS)GetProcAddress1(FHandle, "getcode");
  setlanguage_= (TProcN)GetProcAddress1(FHandle, "setlanguage");
  pause_= (TProc)GetProcAddress1(FHandle, "pause");
  randomn_= (TNFuncN2)GetProcAddress1(FHandle, "randomn");
  randomr_= (TRFuncR2)GetProcAddress1(FHandle, "randomr");
//  randomr1_= GetProcAddress1(FHandle, "randomr1");
//  randomr2_= GetProcAddress1(FHandle, "randomr2");
  tasktext0_= (TProcS)GetProcAddress1(FHandle, "tasktext0");
//  start_= GetProcAddress1(FHandle, "start");
//  getvariant_= GetProcAddress1(FHandle, "getvariant");
  noerasenextfile_= (TProc)GetProcAddress1(FHandle, "noerasenextfile");
  setfileitemsinline_= (TProcN)GetProcAddress1(FHandle, "setfileitemsinline");
  setgroupdata_= (TProcS4N)GetProcAddress1(FHandle, "setgroupdata");
//2024.04<

}

inline void PT5TaskMakerLink::CreateGroup(      const char*             GroupName,
                                                                        const char*             GroupDescription, 
                                                                        const char*             GroupAuthor,
                                                                        const char*             GroupKey,
                                                                        int     TaskCount,
                                                                        TInitTaskProc   InitTaskProc)
{
        creategroup_(GroupName , GroupDescription , GroupAuthor ,GroupKey , TaskCount, reinterpret_cast<void*>(InitTaskProc));
        srand((unsigned int)time(0));
}

inline void PT5TaskMakerLink::UseTask(const char* GroupName, int TaskNumber)
{
  usetask_(GroupName, TaskNumber);
}
/*
inline void PT5TaskMakerLink::UseTask(const char* GroupName, int TaskNumber, const char* TopicDescription)
{
  if (usetaskex_)
    usetaskex_(GroupName, TaskNumber, TopicDescription);
  else
    usetask_(GroupName, TaskNumber);
}
*/
inline void PT5TaskMakerLink::CreateTask(const char* SubgroupName)
{
  createtask_(SubgroupName );
}

inline int PT5TaskMakerLink::CurrentLanguage()
{
        return currentlanguage_();
}

/*
inline char* PT5TaskMakerLink::CurrentLocale()
{
        
  return currentlocale_();
}
*/
inline void PT5TaskMakerLink::TaskText(const char* S, int X, int Y)
{
  tasktext_(S , X, Y);
}


inline void PT5TaskMakerLink::DataB(const char*  Cmt, bool B, int X, int Y)
{
  datab_(Cmt , (int)B, X, Y);
}

inline void PT5TaskMakerLink::DataN(const char* Cmt, int N, int X, int Y, int W)
{
  datan_(Cmt , N, X, Y, W);
}

inline  void PT5TaskMakerLink::DataN(const char* Cmt, int  N1, int N2, int  X, int  Y, int  W)
{
  datan2_(Cmt , N1, N2,  X, Y, W);
}

inline void PT5TaskMakerLink::DataN(const char* Cmt, int N1, int  N2, int  N3, int X, int Y, int W)
{
  datan3_(Cmt , N1, N2, N3, X, Y, W);
}

inline void PT5TaskMakerLink::DataR(const char* Cmt, double R, int  X, int Y, int W)
{
  datar_(Cmt , R, X, Y, W);
}

inline void PT5TaskMakerLink::DataR(const char* Cmt, double R1, double R2, int X, int Y, int W)
{
  datar2_(Cmt , R1, R2, X, Y, W);
}

inline void PT5TaskMakerLink::DataR(const char* Cmt, double R1, double R2, double R3, int  X, int Y, int W)
{
  datar3_(Cmt , R1, R2, R3, X, Y, W);
}

inline void PT5TaskMakerLink::DataC(const char* Cmt,  char C, int  X, int Y)
{
  datac_(Cmt , C, X, Y);
}

inline void PT5TaskMakerLink::DataS(const char* Cmt, const char* S,  int X,  int Y)
{
  datas_(Cmt , S , X, Y);
}
/*
inline void PT5TaskMakerLink::DataP(const char* Cmt, int NP,  int X,  int Y)
{
  datap_ (Cmt , NP, X, Y);
}
*/
inline void PT5TaskMakerLink::DataComment(const char* Cmt, int  X, int Y)
{
  datacomment_(Cmt , X, Y);
}

inline void PT5TaskMakerLink::ResultB(const char* Cmt, bool  B, int X, int Y)
{       
  resultb_(Cmt , B, X, Y);
}

inline void PT5TaskMakerLink::ResultN(const char* Cmt, int  N, int X, int Y, int  W)
{
  resultn_(Cmt , N, X, Y, W);
}

inline void PT5TaskMakerLink::ResultN(const char* Cmt, int N1, int N2, int X, int Y, int W)
{
  resultn2_(Cmt , N1, N2, X, Y, W);
}

inline void PT5TaskMakerLink::ResultN(const char* Cmt, int N1, int N2, int N3, int X, int Y, int W)
{
  resultn3_(Cmt , N1, N2, N3, X, Y, W);
}

inline void PT5TaskMakerLink::ResultR(const char* Cmt, double R, int X, int Y, int W)
{
  resultr_(Cmt , R, X, Y, W);
}

inline void PT5TaskMakerLink::ResultR(const char* Cmt, double R1, double R2, int X, int Y, int W)
{
  resultr2_(Cmt , R1, R2, X, Y, W);
}

inline void PT5TaskMakerLink::ResultR(const char* Cmt, double R1, double  R2, double R3, int X, int Y,  int W)
{
  resultr3_(Cmt , R1, R2, R3, X, Y, W);
}

inline void PT5TaskMakerLink::ResultC(const char* Cmt,  char C, int X, int Y)
{
  resultc_(Cmt , C, X, Y);
}

inline void PT5TaskMakerLink::ResultS(const char* Cmt, const char* S, int X, int Y)
{
        results_(Cmt , S , X, Y);
}
/*
inline void PT5TaskMakerLink::ResultP(const char* Cmt, int NP, int X, int Y)
{
  resultp_(Cmt , NP, X, Y);
}
*/

inline void PT5TaskMakerLink::ResultComment(const char* Cmt, int X, int Y)
{
  resultcomment_(Cmt , X, Y);
}

inline void PT5TaskMakerLink::SetPrecision(int N)
{
  setprecision_(N);
}

inline void PT5TaskMakerLink::SetTestCount(int N)
{
  settestcount_(N);
}

inline void PT5TaskMakerLink::SetRequiredDataCount(int N)
{
  setrequireddatacount_(N);
}

inline int PT5TaskMakerLink::Center(int I, int  N, int  W, int B)
{
  return center_(I, N, W, B);
}

inline void PT5TaskMakerLink::DataFileN(const char* FileName, int Y, int W)
{
  datafilen_(FileName , Y, W);
}

inline void PT5TaskMakerLink::DataFileR(const char* FileName, int Y, int W)
{
  datafiler_(FileName , Y, W);
}

inline void PT5TaskMakerLink::DataFileC(const char* FileName, int Y, int W)
{
  datafilec_(FileName , Y, W);
}

inline void PT5TaskMakerLink::DataFileS(const char* FileName, int Y, int W)
{
  datafiles_(FileName , Y, W);
}

inline void PT5TaskMakerLink::DataFileT(const char* FileName, int Y1, int Y2)
{
  datafilet_(FileName , Y1, Y2);
}

inline void PT5TaskMakerLink::ResultFileN(const char* FileName,  int Y, int W)
{
  resultfilen_(FileName , Y, W);
}

inline void PT5TaskMakerLink::ResultFileR(const char* FileName, int Y, int W)
{
  resultfiler_(FileName , Y, W);
}

inline void PT5TaskMakerLink::ResultFileC(const char* FileName,  int Y, int W)
{
  resultfilec_(FileName , Y, W);
}

inline void PT5TaskMakerLink::ResultFileS(const char* FileName, int Y, int W)
{
  resultfiles_(FileName , Y, W);
}

inline void PT5TaskMakerLink::ResultFileT(const char* FileName, int Y1, int Y2)
{
  resultfilet_(FileName , Y1, Y2);
}
/*
inline void PT5TaskMakerLink::SetPointer(int NP, PNode P)
{
  setpointer_(NP, P);
}

inline void PT5TaskMakerLink::DataList(int NP, int X, int Y)
{
  datalist_(NP, X, Y);
}

inline void PT5TaskMakerLink::ResultList(int NP, int  X, int Y)
{
  resultlist_(NP, X, Y);
}

inline void PT5TaskMakerLink::DataBinTree(int NP, int X, int Y1, int Y2)
{
  databintree_(NP, X, Y1, Y2);
}

inline void PT5TaskMakerLink::ResultBinTree(int NP, int X, int Y1, int  Y2)
{
  resultbintree_(NP, X, Y1, Y2);
}

inline void PT5TaskMakerLink::DataTree(int NP, int X, int Y1, int Y2)
{
  datatree_(NP, X, Y1, Y2);
}

inline void PT5TaskMakerLink::ResultTree(int NP,int X,int  Y1,int  Y2)
{
  resulttree_(NP, X, Y1, Y2);
}

inline void PT5TaskMakerLink::ShowPointer(int NP)
{
  showpointer_(NP);
}

inline void PT5TaskMakerLink::SetNewNode(int NNode)
{
  setnewnode_(NNode);
}

inline void PT5TaskMakerLink::SetDisposedNode(int NNode)
{
  setdisposednode_(NNode);
}

inline int PT5TaskMakerLink::WordCount()
{
  return wordcount_();
}

inline int PT5TaskMakerLink::SentenceCount()
{
  return sentencecount_();
}

inline int PT5TaskMakerLink::TextCount()
{
  return textcount_();
}

inline char* PT5TaskMakerLink::WordSample(int n)
{
  return wordsample_(n);
}


inline char* PT5TaskMakerLink::SentenceSample(int n)
{
  return sentencesample_(n);
}

inline char* PT5TaskMakerLink::TextSample(int n)
{
  return textsample_(n);
}
*/
inline int PT5TaskMakerLink::EnWordCount()
{
  return enwordcount_();
}

inline int PT5TaskMakerLink::EnSentenceCount()
{
  return ensentencecount_();
}

inline int  PT5TaskMakerLink::EnTextCount()
{
  return entextcount_();
}

inline std::string PT5TaskMakerLink::EnWordSample(int n)
{
  char s[21];
  enwordsample_(n, s);
  return s;
}

inline std::string PT5TaskMakerLink::EnSentenceSample(int n)
{
  char s[101];
  ensentencesample_(n, s);
  return s;
}

inline std::string PT5TaskMakerLink::EnTextSample(int n)
{
  char s[1101];
  entextsample_(n, s);
  string s2 = s;
  size_t p = s2.find('\r');
  while (p != string::npos)
  {
      s2.erase(p, 1);
      p = s2.find('\r');
  }
  return s2;
}
/*
inline void PT5TaskMakerLink::CommentText(const char* S)
{
        commenttext_(S);
}

inline void PT5TaskMakerLink::UseComment(const char* GroupName, const char* SubgroupName)
{
        usecomment_(GroupName, SubgroupName);
}

inline void  PT5TaskMakerLink::UseComment(const char* GroupName)
{
        usecomment_(GroupName , "");
}

inline void  PT5TaskMakerLink::Subgroup(const char* SubgroupName)
{
        subgroup_(SubgroupName);
}

inline void  PT5TaskMakerLink::SetObjectStyle()
{
  setobjectstyle_();
}
*/
inline void PT5TaskMakerLink::ShowError(const char* S1, const char* S2)
{
  string tmpstring(S1);
  tmpstring +="\n is not found in the PT5 library.\nYou should update the Programming Taskbook to ";
  tmpstring += S2;
  tmpstring += " version.";
//  msgbox_(0, tmpstring.c_str(), "PT5TaskMaker Error", MB_ICONERROR);
  std::cout << tmpstring << '\n';
}

inline void PT5TaskMakerLink::CreateTask(const char* SubgroupName, int* ProcessCount)
{
  createtask2_(SubgroupName, ProcessCount);
}

inline void PT5TaskMakerLink::CreateTask(int* ProcessCount)
{
        CreateTask("", ProcessCount);
}

inline void PT5TaskMakerLink::SetProcess(int ProcessRank)
{
  setprocess_(ProcessRank);
}

inline char* PT5TaskMakerLink::CurrentVersion()
{
  return currentversion_();
}

inline int PT5TaskMakerLink::CurrentTest()
{
  return currenttest_();
}

//2024.04>
// -----------------------------------------------------------------

inline void PT5TaskMakerLink::SetGroupData(const char *topic, const char *descr, const char *author, const char *key, int n)
{
  setgroupdata_(topic, descr, author, key, n);
}

inline void PT5TaskMakerLink::ClearGroupData()
{
  cleargroupdata_();
}

inline std::string PT5TaskMakerLink::GetTopic()
{
  char s[21];
  gettopic_(s);
  return s;
}

inline int PT5TaskMakerLink::GetTaskCount()
{
   return gettaskcount_();
}

inline std::string PT5TaskMakerLink::SetTaskData(int task, int test)
{
   char s[21];
   settaskdata_(task, test, s);
   return s;
}

inline int PT5TaskMakerLink::GetTestCount()
{
   return gettestcount_();
}

inline std::string PT5TaskMakerLink::GetCode()
{
   char s[21];
   getcode_(s);
   return s;
}

inline void PT5TaskMakerLink::SetLanguage(int n)
{
   setlanguage_(n);
}

inline void PT5TaskMakerLink::Pause()
{
   pause_();
}

inline void PT5TaskMakerLink::NoEraseNextFile()
{
   noerasenextfile_();
}

inline void PT5TaskMakerLink::SetFileRow(int N)
{
    setfileitemsinline_(N);
}

inline void PT5TaskMakerLink::TaskText(const char *S)
{
    string s2 = S;
    for (size_t i = s2.size() - 1; i >= 1; i--)
        if (s2[i] == '\n' && s2[i - 1] != '\r')
            s2.insert(i, 1, '\r');
    tasktext0_(s2.c_str());
}

inline int PT5TaskMakerLink::RandomN(int M, int N)
{
    return randomn_(M, N);
}

inline double PT5TaskMakerLink::RandomR(double A, double B)
{
    return randomr_(A, B);
}

// -----------------------------------------------------------------
//2024.04<






void CreateGroup(const char* GroupName, const char* GroupDescription,
  const char* GroupAuthor, const char* GroupKey,
  int TaskCount, TInitTaskProc InitTaskProc)
{
        PTLink.CreateGroup(GroupName,GroupDescription, GroupAuthor, GroupKey, TaskCount, InitTaskProc);
}

void UseTask(const char* GroupName, int TaskNumber)
{
        PTLink.UseTask(GroupName,TaskNumber);
}
/*
void UseTask(const char* GroupName, int TaskNumber, const char* TopicDescription)
{
        PTLink.UseTask(GroupName,TaskNumber,TopicDescription);
}
*/
void CreateTask(const char* SubgroupName)
{
        PTLink.CreateTask(SubgroupName);
}

void CreateTask()
{
        PTLink.CreateTask("");
}

void CreateTask(const char* SubgroupName, int* ProcessCount)
{
        PTLink.CreateTask(SubgroupName, ProcessCount);
}

void CreateTask(int* ProcessCount)
{
        PTLink.CreateTask(ProcessCount);
}

int CurrentLanguage()
{
        return PTLink.CurrentLanguage();
}
/*
char* CurrentLocale(){
        return PTLink.CurrentLocale();
}
*/
char* CurrentVersion()
{
        return PTLink.CurrentVersion();
}

int CurrentTest()
{
        return PTLink.CurrentTest();
}

void TaskText(const char* S, int X , int Y)
{
        PTLink.TaskText(S,X,Y);
}

void DataB(const char* Cmt, bool B, int X, int Y)
{
        PTLink.DataB(Cmt,B,X,Y);
}

void DataB(bool B, int X, int Y)
{
        PTLink.DataB("",B,X,Y);
}

void DataN(const char* Cmt, int N, int X, int Y, int W)
{
        PTLink.DataN(Cmt,N,X,Y,W);
}

void DataN(int N, int X, int Y, int W)
{
        PTLink.DataN("",N,X,Y,W);
}

void DataN2(const char* Cmt, int  N1, int N2, int  X, int  Y, int  W)
{
        PTLink.DataN(Cmt,N1,N2,X,Y,W);
}

void DataN2(int  N1, int N2, int  X, int  Y, int  W)
{
        PTLink.DataN("",N1,N2,X,Y,W);
}

void DataN3(const char* Cmt, int N1, int  N2, int  N3, int X, int Y, int W)
{
        PTLink.DataN(Cmt,N1,N2,N3,X,Y,W);
}

void DataN3(int N1, int  N2, int  N3, int X, int Y, int W)
{
        PTLink.DataN("",N1,N2,N3,X,Y,W);
}

void DataR(const char* Cmt, double R, int  X, int Y, int W)
{
        PTLink.DataR(Cmt,R,X,Y,W);
}

void DataR(double R, int  X, int Y, int W)
{
        PTLink.DataR("",R,X,Y,W);
}

void DataR2(const char* Cmt, double R1, double R2, int X, int Y, int W)
{
        PTLink.DataR(Cmt,R1,R2,X,Y,W);
}

void DataR2(double R1, double R2, int X, int Y, int W)
{
        PTLink.DataR("",R1,R2,X,Y,W);
}

void DataR3(const char* Cmt, double R1, double R2, double R3, int  X, int Y, int W)
{
        PTLink.DataR(Cmt,R1,R2,R3,X,Y,W);
}

void DataR3(double R1, double R2, double R3, int  X, int Y, int W)
{
        PTLink.DataR("",R1,R2,R3,X,Y,W);
}

void DataC(const char* Cmt,  char C, int  X, int Y)
{
        PTLink.DataC(Cmt,C,X,Y);
}

void DataC(char C, int  X, int Y)
{
        PTLink.DataC("",C,X,Y);
}

void DataS(const char* Cmt, const char* S,  int X,  int Y)
{
        PTLink.DataS(Cmt,S,X,Y);
}

void DataS(const char* S,  int X,  int Y)
{
        PTLink.DataS("",S,X,Y);
}

/*void DataP(const char* Cmt, int NP,  int X,  int Y)
{
        PTLink.DataP(Cmt,NP,X,Y);
}

void DataP(int NP,  int X,  int Y)
{
        PTLink.DataP("",NP,X,Y);
}
*/

void DataComment(const char* Cmt, int  X, int Y)
{
        PTLink.DataComment(Cmt,X,Y);
}

void ResultB(const char* Cmt, bool  B, int X, int Y)
{
        PTLink.ResultB(Cmt,B,X,Y);
}

void ResultB(bool B, int X, int Y)
{
        PTLink.ResultB("",B,X,Y);
}

void ResultN(const char* Cmt, int  N, int X, int Y, int  W)
{
        PTLink.ResultN(Cmt,N,X,Y,W);
}

void ResultN(int N, int X, int Y, int  W)
{
        PTLink.ResultN("",N,X,Y,W);
}

void ResultN2(const char* Cmt, int N1, int N2, int X, int Y, int W)
{
        PTLink.ResultN(Cmt,N1,N2,X,Y,W);
}

void ResultN2(int N1, int N2, int X, int Y, int W)
{
        PTLink.ResultN("",N1,N2,X,Y,W);
}

void ResultN3(const char* Cmt, int N1, int N2, int N3, int X, int Y, int W)
{
        PTLink.ResultN(Cmt,N1,N2,N3,X,Y,W);
}

void ResultN3(int N1, int N2, int N3, int X, int Y, int W)
{
        PTLink.ResultN("",N1,N2,N3,X,Y,W);
}

void ResultR(const char* Cmt, double R, int X, int Y, int W)
{
        PTLink.ResultR(Cmt,R,X,Y,W);
}

void ResultR(double R, int X, int Y, int W)
{
        PTLink.ResultR("",R,X,Y,W);
}

void ResultR2(const char* Cmt, double R1, double R2, int X, int Y, int W)
{
        PTLink.ResultR(Cmt,R1,R2,X,Y,W);
}

void ResultR2(double R1, double R2, int X, int Y, int W)
{
        PTLink.ResultR("",R1,R2,X,Y,W);
}

void ResultR3(const char* Cmt, double R1, double  R2, double R3, int X, int Y,  int W)
{
        PTLink.ResultR(Cmt,R1,R2,R3,X,Y,W);
}

void ResultR3(double R1, double  R2, double R3, int X, int Y,  int W)
{
        PTLink.ResultR("",R1,R2,R3,X,Y,W);
}

void ResultC(const char* Cmt,  char C, int X, int Y)
{
        PTLink.ResultC(Cmt,C,X,Y);
}

void ResultC(char C, int X, int Y)
{
        PTLink.ResultC("",C,X,Y);
}

void ResultS(const char* Cmt, const char* S, int X, int Y)
{
        PTLink.ResultS(Cmt, S, X,Y);
}

void ResultS(const char* S, int X, int Y)
{
        PTLink.ResultS("", S, X,Y);
}
/*
void ResultP(const char* Cmt, int NP, int X, int Y)
{
        PTLink.ResultP(Cmt,NP,X,Y);
}

void ResultP(int NP, int X, int Y)
{
        PTLink.ResultP("",NP,X,Y);
}
*/
void ResultComment(const char* Cmt, int X, int Y)
{
        PTLink.ResultComment(Cmt,X,Y);
}

void SetPrecision(int N)
{
        PTLink.SetPrecision(N);
}

void SetRequiredDataCount(int N)
{
        PTLink.SetRequiredDataCount(N);
}

void SetTestCount(int N)
{
        PTLink.SetTestCount(N);
}

int Center(int I, int  N, int  W, int B)
{
        return PTLink.Center(I,N,W,B);
}

void DataFileN(const char* FileName, int Y, int W)
{
        PTLink.DataFileN(FileName,Y,W);
}

void DataFileR(const char* FileName, int Y, int W)
{
        PTLink.DataFileR(FileName,Y,W);
}

void DataFileC(const char* FileName, int Y, int W)
{
        PTLink.DataFileC(FileName,Y,W);
}

void DataFileS(const char* FileName, int Y, int W)
{
        PTLink.DataFileS(FileName,Y,W);
}


void DataFileT(const char* FileName, int Y1, int Y2)
{
        PTLink.DataFileT(FileName,Y1,Y2);
}

void ResultFileN(const char* FileName,  int Y, int W)
{
        PTLink.ResultFileN(FileName,Y,W);
}

void ResultFileR(const char* FileName, int Y, int W)
{
        PTLink.ResultFileR(FileName, Y,W);
}

void ResultFileC(const char* FileName,  int Y, int W)
{
        PTLink.ResultFileC(FileName,Y,W);
}


void ResultFileS(const char* FileName, int Y, int W)
{
        PTLink.ResultFileS(FileName,Y,W);
}

void ResultFileT(const char* FileName, int Y1, int Y2)
{
        PTLink.ResultFileT(FileName,Y1,Y2);
}
/*
void SetPointer(int NP, PNode P)
{
        PTLink.SetPointer(NP,P);
}

void DataList(int NP, int X, int Y)
{
        PTLink.DataList(NP,X,Y);
}


void ResultList(int NP, int X, int Y)
{
        PTLink.ResultList(NP,X,Y);
}

void DataBinTree(int NP, int X, int Y1, int Y2)
{
        PTLink.DataBinTree(NP,X,Y1,Y2);
}

void ResultBinTree(int NP, int X, int Y1, int Y2)
{
        PTLink.ResultBinTree(NP,X,Y1,Y2);
}

void DataTree(int NP,  int X, int Y1, int Y2)
{
        PTLink.DataTree(NP,X,Y1,Y2);
}

void ResultTree(int NP, int X, int Y1, int Y2)
{
        PTLink.ResultTree(NP,X,Y1,Y2);
}

void ShowPointer( int NP)
{
        PTLink.ShowPointer(NP);
}

void SetNewNode(int NNode)
{
        PTLink.SetNewNode(NNode);
}

void SetDisposedNode(int NNode)
{
        PTLink.SetDisposedNode(NNode);
}

int WordCount()
{
        return PTLink.WordCount();
}

int SentenceCount()
{
        return PTLink.SentenceCount();
}

int TextCount()
{
        return PTLink.TextCount();
}

char* WordSample(int N)
{
        return PTLink.WordSample(N);
}

char* SentenceSample(int N)
{
        return PTLink.SentenceSample(N);
}

char* TextSample(int N)
{
        return PTLink.TextSample(N);
}
*/
int EnWordCount()
{
        return PTLink.EnWordCount();
}

int EnSentenceCount()
{
        return PTLink.EnSentenceCount();
}

int EnTextCount()
{
        return PTLink.EnTextCount();
}

std::string EnWordSample(int N)
{
        return PTLink.EnWordSample(N);
}

std::string EnSentenceSample( int N)
{
        return PTLink.EnSentenceSample(N);
}

std::string EnTextSample(int N)
{
        return PTLink.EnTextSample(N);
}
/*
void CommentText(const char* S)
{
        PTLink.CommentText(S);
}

void UseComment(const char* GroupName,const char* SubgroupName)
{
        PTLink.UseComment(GroupName,SubgroupName);
}

void UseComment(const char* GroupName)
{
        PTLink.UseComment(GroupName);
}

void Subgroup(const char* SubgroupName)
{
        PTLink.Subgroup(SubgroupName);
}

void SetObjectStyle()
{
        PTLink.SetObjectStyle();
}
*/
void   activate(const char * DllName)
{
        PTLink.activate(DllName);
}

void SetProcess(int ProcessRank)
{
        PTLink.SetProcess(ProcessRank);
}

int RandomN(int M, int N)
{
       return PTLink.RandomN(M, N);
}

double RandomR(double A, double B)
{
       return PTLink.RandomR(A, B);
}


//2024.04>
// -----------------------------------------------------------------

void SetGroupData(const char *topic, const char *descr, const char *author, const char *key, int n)
{
  PTLink.SetGroupData(topic, descr, author, key, n);
}

void ClearGroupData()
{
  PTLink.ClearGroupData();
}

std::string GetTopic()
{
   return PTLink.GetTopic();
}

int GetTaskCount()
{
   return PTLink.GetTaskCount();
}

std::string SetTaskData(int task, int test)
{
   return PTLink.SetTaskData(task, test);
}

int GetTestCount()
{
   return PTLink.GetTestCount();
}

std::string GetCode()
{
   return PTLink.GetCode();
}

void SetLanguage(int n)
{
    PTLink.SetLanguage(n);
}

void Pause()
{
    PTLink.Pause();
}

void NoEraseNextFile()
{
    PTLink.NoEraseNextFile();
}

void SetFileRow(int N)
{
    PTLink.SetFileRow(N);
}

void TaskText(const char *S)
{
    PTLink.TaskText(S);
}

std::string TopicToUpperCase(const std::string& topic) 
{
    string result = topic;
    for (int i = 0; i < result.size(); i++) 
        if (result[i] >= 'a' && result[i] <= 'z') 
            result[i] = result[i] - 32;
    return result;
}

void CommentText(const char* S)
{
   // ��������
} 

// -----------------------------------------------------------------
//2024.04<

