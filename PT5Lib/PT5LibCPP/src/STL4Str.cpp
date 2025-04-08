#include <string>
#include <fstream>
#include <algorithm>
#include <iterator>
#include <functional>
#include <numeric>
#include "pt5taskmaker.h"

namespace STL4
{

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

/*
char* tit1 = "��������� ������";
char* tit2 = "������� �������������� ���������. ��������� �������";
char* tit3 = "���������� � �������";
char* tit4 = "������������ � ������ � �����";
char* tit5 = "��������� ���������";
*/

string s, s0, s1;
int m;

string RandomStr(int n)
{
        string res;
        for (int i = 0; i < n; i++)
                res += abcext[RandomN(0, abcext.size()-1)];
        return res;
}

string RandomName(int n)
{
        string res;
        for (int i = 0; i < n; i++)
                res += abc[RandomN(0, abc.size()-1)];
        return res;
}

void DataStr(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    DataComment(comm,p,y);
  p += 2;
  DataComment(":",p,y);
  p += 2;
  DataS(s.c_str(), p, y);
}

void ResultStr(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  ResultComment(":",p,y);
  p += 2;
  ResultS(s.c_str(), p, y);
}

void Stl1()
{
  CreateTask();
  TaskText(
  "���� ����� ������������� ����� {N} � ������ {C}.\n"
  "��������� ����������� ������ string, ��������� ������ {S},\n"
  "������� � ��� {N} ����� ������� {C}."
  );
  int n = RandomN(1,40);
  char c = RandomStr(1)[0];
  DataN("N = ", n, xLeft, 3, 1);
  DataC("C = ", c, xRight, 3);
  s = string(n, c);
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl2()
{
  CreateTask();
  TaskText(
  "���� ������ {S}_0 ������ �����.\n"
  "��������� ����������� ������ string � �����������-�����������,\n"
  "�������� � ������ {S} ������ �������� �������� ������ {S}_0 � �������� �������."
  );
  s0 = RandomStr(RandomN(2, 10)*2);
  s = s0;
  DataStr("S_0", 3);
  s = string(s0.rbegin(), s0.rbegin()+s0.size()/2);
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl3()
{
  CreateTask();
  TaskText(
  "���� ������ {S} ������ ����� {N} ({N}~\\g~4).\n"
  "������ ��������� ���������� ���������� ��������, �������� �������\n"
  "������ � ��������� ������, � ����� ��� ������� ������� ������~{S}."
  );
  s = RandomStr(RandomN(2, 10)*2);
  DataStr("S", 3);
  swap(s[0], s[s.size()-1]);
  swap(*(s.begin()+s.size()/2-1),*(s.begin()+s.size()/2));
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl4()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {S} ������ �����.\n"
  "��������� ���� ����� �������-����� insert � ����������-����������,\n"
  "�������� � �������� ������~{S} {K}~��������~\\<*\\>."
  );
  int k = RandomN(1, 10);
  s = RandomStr(RandomN(2, 10)*2);
  DataN("K = ", k, 0, 2, 1);
  DataStr("S", 3);
  s.insert(s.begin()+s.size()/2, k, '*');
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl5()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {S}, ����� ������� ������ {K}.\n"
  "��������� ���� ����� �������-����� insert � �����������-�����������,\n"
  "�������� � ����� ������ {S} �� ������ {K} �������� � �������� �������."
  );
  int k = RandomN(1, 10);
  s = RandomStr(RandomN(k+1, k+10));
  DataN("K = ", k, 0, 2, 1);
  DataStr("S", 3);
  s.insert(s.end(), s.rend()-k, s.rend());
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl6()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {S}_1 � {S}_2. ������ {S}_1 ��������\n"
  "�� ����� {K} ��������, � ������ {S}_2~\\= �� ����� ���� ��������.\n"
  "��������� ��� ������ �������-����� insert � �����������-�����������,\n"
  "������������� ������ {S}_2, ������� ����� �� ������� ������� ������ {K} ��������\n"
  "������ {S}_1 � �������� �������, � ����� �� ��������� ��������~\\=\n"
  "��������� {K} �������� ������ {S}_1 � �������� �������."
  );
  int k = RandomN(1, 10);
  DataN("K = ", k, 0, 2, 1);
  s = RandomStr(RandomN(k, k+10));
  DataStr("S_1", 3);
  s0 = s;
  s = RandomStr(RandomN(2, 10));
  DataStr("S_2", 4);
  s.insert(s.end()-1, s0.rbegin(), s0.rbegin()+k);
  s.insert(s.begin()+1, s0.begin(), s0.begin()+k);
  ResultStr("S_2", 3);
  SetTestCount(5);
}

void Stl7()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� �������-���� insert � ����� � ����������-����������,\n"
  "�������� ����� ������ �������� ������ {S} ������ \\<*\\>."
  );
  s = RandomStr(RandomN(1, 20));
  DataStr("S", 3);
  for (auto i = s.begin(); i != s.end(); i+=2)
          i = s.insert(i,'*');
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl8()
{
  CreateTask();
  TaskText(
  "���� ������ {S}, ���������� �� ����� ���� ��������. ��������� �������-����\n"
  "insert � ����� � ����������-����������, �������� ����� ������� �������\n"
  "������ {S} � ������ ���������� ������� ��� ������� \\<*\\> (��������,\n"
  "������ \\<abcde\\> ������ ���� ������������� � \\<ab***cd***e\\>)."
  );
  m = RandomN(2, 20);
    switch (CurrentTest())
  {
  case 2: 
          m = RandomN(1,9)*2;     break;
  case 4: 
      m = RandomN(1,9)*2+1;       break;
  }
  s = RandomStr(m);
  DataStr("S", 3);
  for (auto i = s.begin()+2; ; i++)
  {
          i = s.insert(i,3,'*')+3;
          if (i == s.end())
                  break;
          if (++i == s.end())
                  break;
          
  }
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl9()
{
  CreateTask();
  TaskText(
  "���� ������ {S} ������ �����. ��������� �������-���� insert � �����\n"
  "� ����������-����������, �������������� ������ ������\n"
  "�� ������ �������� ������ {S} (��������, ������ \\<abcdef\\>\n"
  "������ ���� ������������� � \\<aabbccdef\\>)."
  );
  m = RandomN(1, 10)*2;
//  m = 20;
  s = RandomStr(m);
  s.reserve(50);
  DataStr("S", 3);
  for (auto i = s.rbegin()+s.size()/2; i != s.rend(); i++)
  {
          s.insert(--i.base(),*i);
  }
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl10()
{
  CreateTask();
  TaskText(
  "���� ������ {S} �������� ����� {N} ({N}~\\g~5).\n"
  "��������� ���� ����� �������-����� erase � �����������-�����������,\n"
  "������� ��� ������� ������� ������."
  );
  m = RandomN(2, 9)*2+1;
  s = RandomStr(m);
  DataStr("S", 3);
  s.erase(s.begin()+s.size()/2-1,s.begin()+s.size()/2+2);
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl11()
{
  CreateTask();
  TaskText(
  "���� ������ {S}, ���������� �� ����� ���� ��������.\n"
  "��������� �������-���� erase � ����� � ����������-����������,\n"
  "������� ������ ������ ������ ������~{S}."
  );
  m = RandomN(3, 20);
    switch (CurrentTest())
  {
  case 2: 
          m = RandomN(1,6)*3;     break;
  case 3: 
          m = RandomN(1,6)*3+1;   break;
  case 4: 
      m = RandomN(1,6)*3+2;       break;
  }
  s = RandomStr(m);
  DataStr("S", 3);
  for (auto i = s.begin()+2; i!=s.end(); i++)
  {
          i = s.erase(i);
          if (i == s.end())
                  break;
          if (++i == s.end())
                  break;
          
  }
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl12()
{
  CreateTask();
  TaskText(
  "���� ������ {S}, ���������� �� ����� ���� ��������.\n"
  "��������� ���������� ���������� �������� � �����,\n"
  "����������� ������ ������ ������ ������ {S} � �� �����,\n"
  "���������� ������������ ������� � �������� �������."
  );
  m = RandomN(3, 20);
    switch (CurrentTest())
  {
  case 2: 
          m = RandomN(1,6)*3+1;   break;
  case 3: 
          m = RandomN(1,6)*3;     break;
  case 4: 
      m = RandomN(1,6)*3+2;       break;
  }
  s = RandomStr(m);
  DataStr("S", 3);
  auto i = s.begin();
  for (int j = 0; j < (int)s.size()/3; j++)
  {
          i += 2;
          rotate(i, i+1, s.end());
  }
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl13()
{
  CreateTask();
  TaskText(
  "���� ������ {S}, ����� ������� ������� �� 3.\n"
  "��������� ���������� ���������� ��������, ����������� ������ �����\n"
  "�������� ������ {S} � �� ����� (� ����������� ������� ��������)."
  );
  m = RandomN(1, 6)*3;
  s = RandomStr(m);
  DataStr("S", 3);
  rotate(s.begin()+s.size()/3, s.begin()+2*s.size()/3, s.end());
  ResultStr("S", 3);
  SetTestCount(5);
}

void Stl14()
{
  CreateTask();
  TaskText(
  "���� ������ {S}, ���������� �� ����� ���� �������� \\<*\\>.\n"
  "��������� ��� ������ ����������� ����������� ��������� � ��� ������\n"
  "�������-����� erase, ������� � ������ {S} ������ � ��������� �� ���� ��������."
  );
  s = RandomStr(RandomN(16, 30));
  m = RandomN(3, s.size()/4);
  int k;
  for (int i=0; i < m; ++i)
  {
          do
          {
                  k = RandomN(0, s.size()-1);
          }
          while (s[k] == '*');
          s[k] = '*';
  }
  DataStr("S", 3);
  auto j = find(s.begin(), s.end(), '*');
  s.erase(find(j+1, s.end(), '*'));
  s.erase(--find(s.rbegin(), s.rend(), '*').base());
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl15()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� ��� ������ ����������� ����������� ��������� � ����\n"
  "����� �������-����� erase, ������� ��� �������, ������������� � ������ {S}\n"
  "����� ������ � ��������� ������. ���� ���� ������ ����, �� ������ �� ��������."
  );
  s = RandomStr(RandomN(16, 30));
  m = RandomN(0, 4);
      switch (CurrentTest())
  {
  case 2: 
          m = 0;          break;
  case 3: 
          m = 2;          break;
  case 4: 
      m = 1;      break;
  }
          if (m < 2)
                  for (int i = 0; i < (int)s.size(); ++i)
                          if (s[i] >= '0' && s[i] <= '9')
                                  s[i] = (char)RandomN((int)'A',(int)'Z');
          if (m == 1)
          {
                  m = RandomN(0, s.size()-1);
                  s[m] = (char)RandomN((int)'0',(int)'9');
          }
  DataStr("S", 3);
          auto j = find_if(s.begin(), s.end(), [](char e){return e >= '0' && e <= '9';});
          if (j != s.end())
          {
                  auto j1 = --find_if(s.rbegin(), s.rend(),[](char e){return e >= '0' && e <= '9';}).base();
                  if (j != j1)
                  s.erase(j+1,j1);
          }
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl16()
{
  CreateTask();
  TaskText(
  "���� ������ {S} ������ �����. ��������� � ����� ���������� ����������\n"
  "�������� � �������-���� erase, ������� �� ������ �������� ������ {S}\n"
  "��� �������, ����������� � ��������� �� �� ������ ��������."
  );
  s = RandomStr(RandomN(8, 15)*2);
  m = RandomN(4, s.size()/2-2);
  for (int i = 0; i < m; ++i)
          s[RandomN(s.size()/2, s.size()-1)] = s[RandomN(0, s.size()/2-1)];
  DataStr("S", 3);
  m = s.size();
  auto j = s.begin()+s.size()/2;
  while (j != s.end())
  {
          j = find_first_of(j, s.end(), s.begin(), s.begin()+m/2);
          if (j!= s.end())
                  s.erase(j);
  }
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl17()
{
  CreateTask();
  TaskText(
   "���� ������ {S}. ��������� ���������� ���������� �������� � �������-���� erase,\n"
   "������� ��� �������� �������� � ��������� �������, ������� � ������\n"
   "������ ������ ������ ���� ��� ���� ������ ��������� ������. ��������,\n"
   "������ \\<123abc456de\\> ������ ���� ������������� � ���� \\<1a4d\\>.\n"
   "�������, ��� ������ {S} �������� ������ ��������� ��������� �������."
  );
  s = RandomStr(RandomN(10, 30));
  DataStr("S", 3);
  s.erase(unique(s.begin(), s.end(), [](char c1, char c2)
  {return '0' <= c1 && c1 <='9' && '0' <= c2 && c2 <= '9' ||
  'A' <= c1 && c1 <='z' && 'A' <= c2 && c2 <= 'z';}), s.end());
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl18()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {S}, ����� ������� ����������� ����� {K}.\n"
  "��������� ���������� ���������� �������� � �������-���� insert, ��������������\n"
  "� ������ {S} ������ �� ��������, ���������� {K} ������ ������������� ����.\n"
  "���� ��������� �������� ����� {K} ����, �� �������������� {K} ��������� ����\n"
  "���� ���������. ���� ��������� �������� ���, �� ������ �� ��������."
  );
  m = RandomN(1,5);
  s = RandomStr(RandomN(10, 30));
  int m0 = RandomN(0, 4);
      switch (CurrentTest())
  {
          case 3: case 6: case 8:
          m0 = 0;         break;
  case 4: case 5: case 7:
      m0 = 1;     break;
  }
  if (m0 > 0)
  for (int j = 0; j < 3; ++j)
  {
          int k = RandomN(1, s.size()-m-1);
          for (int jj = k; jj < k+m; ++jj)
                  s[jj] = (char)RandomN((int)'0',(int)'9');
  }
  else
          if (m < 3)
  for (int j = 0; j < (int)s.size(); ++j)
  {
          if (s[j]>='0' && s[j] <= '9')
                  s[j] = (char)RandomN((int)'A',(int)'Z');
  }

  DataN("K = ", m, 0, 2, 1);
  DataStr("S", 3);
  auto i = search_n(s.begin(), s.end(), m, 0, [](char e, char v)
  {return '0' <= e && e <='9';});
  if (i != s.end())
  s.insert(i+m, i, i+m);
  ResultStr("S", 3);
  SetTestCount(9);
}

void Stl19()
{
  CreateTask();
  TaskText(
  "���� ������ {S}_1 � {S}_2, ����� ������ {S}_1 �� ����������� ����� ������ {S}_2. ���������\n"
  "���������� ���������� �������� � �������-���� erase, ������� � ������ {S}_2\n"
  "��������� ���������, ����������� � ��������������� ������� {S}_1 (������ {S}_1\n"
  "�� ��������). ���� ��������� �������� ���, �� ������ {S}_2 �� ��������."
  );
  s0 = RandomStr(RandomN(5, 10));
  s = RandomStr(RandomN(30, 40));
  int m0 = RandomN(0, 4);
  switch (CurrentTest())
  {
          case 3: case 6:
          m0 = 0;         break;
      case 4: case 5: 
      m0 = 2;     break;
      case 2: case 7: 
      m0 = 3;     break;
  }
  m = s0.size();
  for (int j = 0; j < m0; ++j)
  {
          int k = RandomN(1, s.size()-m);
          int k0=m;
          for (int jj = k; jj < k+m; ++jj)
                  s[jj] = s0[--k0];
  }
  s1 = s;
  s = s0;
  DataStr("S_1", 2);
  s = s1;
  DataStr("S_2", 4);
  auto i = search(s1.rbegin(), s1.rend(), s0.begin(), s0.end());
  if (i != s1.rend())
    s1.erase(i.base() - m, i.base());
  s = s1;
  ResultStr("S_2", 3);
  SetTestCount(9);
}

void Stl20()
{
  CreateTask();
  TaskText(
  "���� ����� {N} (1~\\l~{N}~\\l~26) � ������ {S}. ��������� ��� ������ �����������\n"
  "����������� ��������� � ���������� �������, �������� � ������ � � �����\n"
  "������ {S} �� {N} ������ ��������� ���� ���������� ��������, ���������� ��� �����\n"
  "� ����� ������ �� ��������, � � ������~\\= � �������, �������� �����������.\n"
  "��������, ��� {N}~=~3 � {S}~=~\\<567\\> ��������� �������� ������ \\<CBA567ABC\\>."
  );
  s = RandomStr(RandomN(5, 10));
  m = RandomN(1,26);
  switch (CurrentTest())
  {
          case 3:
          m = 1;          break;
      case 5: 
      m = 26;     break;
      case 6:
      m = 20;     break;
  }
  DataN("N = ", m, 0, 2, 1);
  DataStr("S", 3);
  int c = (int)'A';
  generate_n(back_inserter(s), m, [&c](){return (char)(c++);});
  generate_n(inserter(s, s.begin()), m, [&c](){return (char)(--c);});
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl21()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {S} ������ �����, ������� 2{K}.\n"
  "��������� ��� ������ ����������� ����������� ���������, ���������\n"
  "� ������ �������� ������ {S} ����������� ����� �������� �� {�} ������� �����,\n"
  "� � �� ������ ��������~\\= ����������� ����� �������� �� {K} ������� ������."
  );
  s = RandomStr(RandomN(5, 10)*2);
  m = RandomN(1,s.size()/2-1);
  DataN("K = ", m, 0, 2, 1);
  DataStr("S", 3);
  rotate(s.begin(), s.begin()+m, s.begin() + s.size()/2);
  rotate(s.begin()+s.size()/2, s.end() -m, s.end());
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl22()
{
  CreateTask();
  TaskText(
  "���� ������ {S} ������ �����. ��������� ��� ������ ����������� �����������\n"
  "���������, �������� � ������ �������� ������ {S} ��� �������� �������\n"
  "�� ������ \\<*\\>, � � �� ������ ��������~\\= ��� ���������\n"
  "��������� ����� �� ������~\\<\\_\\>."
  );
  s = RandomStr(RandomN(10, 15)*2);
  DataStr("S", 3);
  replace_if(s.begin(), s.begin()+s.size()/2, [](char e){return '0'<=e && e <='9';},'*');
  replace_if(s.begin()+s.size()/2, s.end(), [](char e){return 'A'<=e && e <='Z';},'_');
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl23()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� ���� ����� ����������� ����������� ���������,\n"
  "�������� ������� ���� ��������� �������� ������ {S} �� ���������������,\n"
  "� �������� ������� �������� �� ������~\\<*\\>."
  );
  s = RandomStr(RandomN(10, 20));
  DataStr("S", 3);
  transform(s.begin(), s.end(), s.begin(), [](char c){return 'A'<=c && c <= 'Z'?
          char((int)c+32):('a'<=c && c <= 'z' ? char((int)c-32) : '*');});
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl24()
{
  CreateTask();
  TaskText(
  "���� ������ {S}_1 � {S}_2 ���������� �����. ��������� ���������� ����������\n"
  "��������, ������������� ������ {S}_2, ������� �� ������ \\<*\\> �� �� �������,\n"
  "������� �� ��������� � ��������� ������ {S}_1, ��������������\n"
  "� ��� �� ��������. ��������, � ������ {S}_1~=~\\<ab2CD\\> � {S}_2~=~\\<as2Cd\\>\n"
  "������ {S}_2 ������ ���� ������������� � ���� \\<a*2C*\\>."
  );
  m = RandomN(10, 20);
  s0 = RandomStr(m);
  s1 = s0;
  int m0 = RandomN(1,8);
  for (int j = 0; j < m0; ++j)
          s1[RandomN(0, m-1)] = RandomStr(1)[0];
  s = s0;
  DataStr("S_1", 2);
  s = s1;
  DataStr("S_2", 4);
  transform(s.begin(), s.end(), s0.begin(), s.begin(), 
          [](char c1, char c2){return c1 != c2 ? '*' : c1;});
  ResultStr("S_2", 3);
  SetTestCount(7);
}

void Stl25()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� ���������� ���������� ��������, �����������\n"
  "� ����� ������ {S} ��� ������������ � ��� �������� ������� � ��� �� �������."
  );
  m = RandomN(10, 20);
  s = RandomStr(m);
  int m0 = RandomN(1,8);
  for (int j = 0; j < m0; ++j)
          s[RandomN(0, m-1)] = (char)RandomN((int)'0',(int)'9');
  DataStr("S", 3);
  remove_copy_if(s.begin(), s.end(), back_inserter(s), 
          [](char c){return !('0'<=c && c <= '9');});
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl26()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� ���������� ���������� �������� � �������-���� erase,\n"
  "������� � ������ {S} ��� �������� �������."
  );
  m = RandomN(10, 20);
  s = RandomStr(m);
  int m0 = RandomN(0,8);
  switch (CurrentTest())
  {
          case 3:
          m0 = 0;         break;
      case 5: 
      m0 = 3;     break;
      case 6:
      m0 = 8;     break;
  }
  for (int j = 0; j < m0; ++j)
          s[RandomN(0, m-1)] = (char)RandomN((int)'0',(int)'9');
  if (m0 == 0)
  for (int j = 0; j < m; ++j)
          if ('0'<=s[j] && s[j] <= '9')
          s[j] = (char)RandomN((int)'A',(int)'Z');
  DataStr("S", 3);
  s.erase(remove_if(s.begin(), s.end(), [](char c){return '0'<=c && c <= '9';}), s.end());
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl27()
{
  CreateTask();
  TaskText(
  "���� ������ {S}. ��������� ���������� ���������� ��������, ����������������\n"
  "�������� ������ {S}, ���������� ��� �������� �������\n"
  "� �� ������ � ��� �� �������."
  );
  m = RandomN(10, 20);
  s = RandomStr(m);
  int m0 = RandomN(0,8);
  switch (CurrentTest())
  {
          case 3:
          m0 = 0;         break;
      case 5: 
      m0 = 3;     break;
      case 6:
      m0 = 8;     break;
  }
  for (int j = 0; j < m0; ++j)
          s[RandomN(0, m-1)] = (char)RandomN((int)'0',(int)'9');
  if (m0 == 0)
  for (int j = 0; j < m; ++j)
          if ('0'<=s[j] && s[j] <= '9')
          s[j] = (char)RandomN((int)'A',(int)'Z');
  DataStr("S", 3);
  stable_partition(s.begin(), s.end(), 
          [](char c){return '0'<=c && c <= '9';});
  ResultStr("S", 3);
  SetTestCount(7);
}

void Stl28()
{
  CreateTask();
  TaskText(
  "���� ������ {S} ������ �����. ��������� ��� ������ �����������\n"
  "����������� ���������, ������������� ������ �������� ������ {S}\n"
  "�� �������� ����� ��������, � ������~\\= �� �� �����������."
  );
  m = RandomN(5, 10)*2;
  s = RandomStr(m);
  DataStr("S", 3);
  sort(s.begin(), s.begin()+s.size()/2, greater<char>());
  sort(s.begin()+s.size()/2, s.end());
  ResultStr("S", 3);
  SetTestCount(7);
}

void  InitTask_(int num)
{
  switch (num)  
  {
    case 1:      Stl1(); break;
    case 2:      Stl2(); break;
    case 3:      Stl3(); break;
    case 4:      Stl4(); break;
    case 5:      Stl5(); break;
    case 6:      Stl6(); break;
    case 7:      Stl7(); break;
    case 8:      Stl8(); break;
    case 9:      Stl9(); break;
    case 10:      Stl10(); break;
    case 11:      Stl11(); break;
    case 12:      Stl12(); break;
    case 13:      Stl13(); break;
    case 14:      Stl14(); break;
    case 15:      Stl15(); break;
    case 16:      Stl16(); break;
    case 17:      Stl17(); break;
    case 18:      Stl18(); break;
    case 19:      Stl19(); break;
    case 20:      Stl20(); break;
    case 21:      Stl21(); break;
    case 22:      Stl22(); break;
    case 23:      Stl23(); break;
    case 24:      Stl24(); break;
    case 25:      Stl25(); break;
    case 26:      Stl26(); break;
    case 27:      Stl27(); break;
    case 28:      Stl28(); break;
  }
}

void  inittaskgroup_()
{
  if ((CurrentLanguage() & lgCPP) == 0) return;
  CreateGroup("STL4Str", "������ ��� ���������������� ����������", 
    "�. �. �������, 2016, 2021", "qwq2334sd#EnTopic<Strings as sequence containers>#477995hfgd5ttd", 28, InitTask_);

  CommentText("�� ���� �������� ������ ������ ��������� ���������� ������,");
  CommentText("������������ �� ��� ���������������� ��������� � ��������� ������������");
  CommentText("������ string, ��� �������-����� insert � erase �/��� ���������� ���������� ���������.");
  CommentText("��������������� ������ ��� ������� ����� ������������ �� �������.");


}
}

//----------------------------------------

void  inittaskgroup4()
{
    STL4::inittaskgroup_();
}
void  InitTask4(int num)
{
    STL4::InitTask_(num);
}

//-------------------------------------
