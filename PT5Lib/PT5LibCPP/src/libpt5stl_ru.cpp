#include <string>  
#include <iostream>  
#include "pt5taskmaker.h"  
#include <cstring>
#include <string.h>

using namespace std;

void  inittaskgroup1();
void  inittaskgroup2();
void  inittaskgroup3();
void  inittaskgroup4();
void  inittaskgroup5();
void  inittaskgroup6();

void  InitTask1(int num);
void  InitTask2(int num);
void  InitTask3(int num);
void  InitTask4(int num);
void  InitTask5(int num);
void  InitTask6(int num);

int InitGroup(string &name, string &code, int lang)
{
    
  string name0;
  ClearGroupData();
  SetLanguage(lang);
  name0 = TopicToUpperCase(name);
  if (name0 == "STL1ITER")
      inittaskgroup1();
  else if (name0 == "STL2SEQ")
    inittaskgroup2();
  else if (name0 == "STL3ALG")
    inittaskgroup3();
  else if (name0 == "STL4STR")
    inittaskgroup4();
  else if (name0 == "STL5ASSOC")
    inittaskgroup5();
  else if (name0 == "STL6FUNC")
    inittaskgroup6();
  int res = GetTaskCount();
  if (res > 0)
  {
    name = GetTopic();
    code = GetCode();
  }
  return res;
}

int InitTask(int num, int test)
{
    string name0 = SetTaskData(num, test);
    if (name0 == "STL1ITER")
      InitTask1(num);
    else if (name0 == "STL2SEQ")
      InitTask2(num);
    else if (name0 == "STL3ALG")
      InitTask3(num);
    else if (name0 == "STL4STR")
      InitTask4(num);
    else if (name0 == "STL5ASSOC")
      InitTask5(num);
    else if (name0 == "STL6FUNC")
      InitTask6(num);
    Pause();
    return GetTestCount();
}
int  initgroup(char *name, char *code, int lang)
{
  string sname(name), scode;
  int res = InitGroup(sname, scode, lang);

  if (res > 0)
  {
     //strcpy(name, sname.c_str());
     strncpy(name, sname.c_str(), strlen(name));
     strncpy(code, scode.c_str(), strlen(code));
     //strcpy(code, scode.c_str());
  }
  return res;
}

int  inittask(int num, int test)
{
    return InitTask(num, test);
}



