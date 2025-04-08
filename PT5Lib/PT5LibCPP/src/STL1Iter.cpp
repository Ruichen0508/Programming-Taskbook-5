#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include <list>
#include <algorithm>
#include <functional>
#include "pt5taskmaker.h"

namespace STL1
{

vector<int> vn;
vector<double> vr;
vector<string> vs;
vector<char> vc;

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

void MakeVN(int n, int a1, int b1)
{
  vn.clear();
  for (int i = 0; i < n; i++)
    vn.push_back(RandomN(a1,b1));
}

void MakeVR(int n, int a1, int b1)
{
  vr.clear();
  for (int i = 0; i < n; i++)
    vr.push_back(RandomN(a1,b1)/100.0);
}

void MakeVS(int n)
{
  vs.clear();
  int nw = EnWordCount()-1;
  for (int i = 0; i < n; i++)
    vs.push_back(EnWordSample(RandomN(0,nw)));
//  for (int i = 0; i <= nw; i++)
//    vs.push_back(EnWordSample(i));
}

void MakeVC(int n, string s)
{
  vc.clear();
  int nw = s.size()-1;
  for (int i = 0; i < n; i++)
    vc.push_back(s[RandomN(0,nw)]);
}

string RandomStr(int n)
{
        string res;
        for (int i = 0; i < n; i++)
                res += abc[RandomN(0, abc.size()-1)];
        return res;
}


void DataVN(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    DataComment(comm,p,y);
  p += 2;
  int n = vn.size();
  DataN("(",n,p,y,2);
  p += 3;
  DataComment("):",p,y);
  p += 2;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      DataN("",vn[i],p,y,4);
          p += 4;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}

void ResultVN(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vn.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultN("",vn[i],p,y,4);
          p += 4;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}

void DataVR(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    DataComment(comm,p,y);
  p += 2;
  int n = vr.size();
  DataN("(",n,p,y,2);
  p += 3;
  DataComment("):",p,y);
  p += 2;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      DataR("",vr[i],p,y,6);
          p += 6;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}

void ResultVR(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vr.size();
//  DataN(" ",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultR("",vr[i],p,y,6);
          p += 6;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}


void DataVS(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    DataComment(comm,p,y);
  p += 2;
  int n = vs.size();
  DataN("(",n,p,y,2);
  p += 3;
  DataComment("):",p,y);
  p += 3;
  int p0 = p;
  int step = max_element(vs.begin(), vs.end(), [](string s1, string s2){return s1.size() < s2.size();})->size()+3;
  for (int i = 0; i < n; i++)
  {
      DataS("",vs[i].c_str(),p,y);
          p += step;
          if (p > 78 - step)
          {
                  y++;
                  p = p0;
          }
  }
}

void ResultVS(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vs.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 6;
  int p0 = p;
  int step = max_element(vs.begin(), vs.end(), [](string s1, string s2){return s1.size() < s2.size();})->size()+3;
  for (int i = 0; i < n; i++)
  {
      ResultS("",vs[i].c_str(),p,y);
          p += step;
          if (p > 78 - step)
          {
                  y++;
                  p = p0;
          }
  }
}


void DataVC(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    DataComment(comm,p,y);
  p += 2;
  int n = vc.size();
  DataN("(",n,p,y,2);
  p += 3;
  DataComment("):",p,y);
  p += 3;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      DataC("",vc[i],p,y);
          p += 4;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}

void ResultVC(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vc.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
  ResultComment(":",p,y);
  p += 6;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultC("",vc[i],p,y);
          p += 4;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}


void DataFileVN(const char* name, int y1, int y2)
{
  ofstream f(name);
  int n = 0, l = RandomN(1,8);
  while (n < (int)vn.size())
  {
          f << vn[n++];
          l--;
          bool b = n < (int)vn.size();
          if (l == 0)
          {
                  f << endl;
                  l = RandomN(1,8);
          }
          else
                  if (b) 
                  f << " ";
  }
  f.close();
  DataFileT(name, y1, y2);
}

void DataFileVR(const char* name, int y1, int y2)
{
  ofstream f(name);
  int n = 0, l = RandomN(1,7);
  while (n < (int)vr.size())
  {
          f << vr[n++];
          l--;
          bool b = n < (int)vr.size();
          if (l == 0)
          {
                  f << endl;
                  l = RandomN(1,7);
          }
          else
                  if (b) 
                  f << " ";
  }
  f.close();
  DataFileT(name, y1, y2);
}

void DataFileVS(const char* name, int y1, int y2)
{
  ofstream f(name);
  int n = 0, l = RandomN(1,7), cnt = 0;
  while (n < (int)vs.size())
  {
          cnt += vs[n].size()+1;
          f << vs[n++];
          l--;
          bool b = n < (int)vs.size();
          if (l == 0 || b && cnt + vs[n].size() > 70)
          {
                  f << endl;
                  cnt = 0;
                  l = RandomN(1,7);
          }
          else
                  if (b)
                      f << " ";
  }
  f.close();
  DataFileT(name, y1, y2);
}


void ResultFileVN(const char* name, int y1, int y2)
{
  ofstream f(name);
  int n = 0;
  while (n < (int)vn.size())
  {
          f << vn[n++] << endl;
  }
  f.close();
  ResultFileT(name, y1, y2);
}

void ResultFileVN1(const char* name, int y1, int y2, const char* delim)
{
  ofstream f(name);
  int n = 0;
  while (n < (int)vn.size())
  {
          f << vn[n++] << delim;
  }
  f.close();
  ResultFileT(name, y1, y2);
}



void ResultFileVS(const char* name, int y1, int y2)
{
  ofstream f(name);
  int n = 0;
  while (n < (int)vs.size())
  {
          f << vs[n++] << endl;
  }
  f.close();
  ResultFileT(name, y1, y2);
}


void ResultFileVC(const char* name, int y1, int y2, const char* delim)
{
  ofstream f(name);
  int n = 0;
  while (n < (int)vc.size())
  {
          f << vc[n++] << delim;
  }
  f.close();
  ResultFileT(name, y1, y2);
}



//void ResultSeqN(const char* comm, int y)
//{
//  if (comm != "")
//    ResultComment(comm,0,y++);
//  int n = a.size();
//  for (int i = 0;  i < n; i++)
//    ResultN("",a[i],Center(i+1,n,3,1),y,3);
//}

void Stl1() 
{
  CreateTask();
  TaskText(
  "��� ����� ����� �����. ����� ���������� ����� � �������� ������.\n"
  "������������ �������� ptin\\_iterator � �������� count."
  );
  MakeVN(RandomN(10, 34), -5, 5);
  DataVN("", 3);
  ResultN(count(vn.begin(), vn.end(), 0), 0, 3, 2);
}

void Stl2()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "������������ �����. ����� ���������� ������������� ����� � �������� �����.\n"
  "������������ �������� istream\\_iterator � �������� count\\_if."
  );
  MakeVR(RandomN(10, 33), -999, 999);
//  DataVR("", 3);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  DataFileVR(name.c_str(), 2, 5);
  ResultN(count_if(vr.begin(), vr.end(), [](double e){return e > 0;}), 0, 3, 2);
}

void Stl3()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ���������� �����.\n"
  "����� ���������� ���� �����~6. ������������ �������� istream\\_iterator\n"
  "� �������� count\\_if."
  );
  MakeVS(RandomN(10, 34));
//  DataVS("", 3);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  DataFileVS(name.c_str(), 2, 5);

  ResultN(count_if(vs.begin(), vs.end(), [](string e){return e.size() == 6;}), 0, 3, 2);
}

void Stl4()
{
  CreateTask();
  TaskText(
  "��� ����� ������������ �����. ������� ��� �������� ����� ������\n"
  "� ��� �� �������. ������������ ��������� ptin\\_iterator,\n"
  "ptout\\_iterator � �������� copy."
  );
  MakeVR(RandomN(10, 33), -999, 999);
  DataVR("", 3);
  ResultVR("", 3);
}

void Stl5()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "����� �����. ������� ��� ����� �� ����� � ��� �� �������. ������������\n"
  "��������� istream\\_iterator, ptout\\_iterator � �������� copy."
  );
  MakeVN(RandomN(10, 34), -99, 99);
//  DataVR("", 3);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  DataFileVN(name.c_str(), 2, 5);
  ResultVN("", 3);
}

void Stl6()
{
  CreateTask();
  TaskText(
  "���� ������ {name} � ����� ��������. �������� � ��������� ����\n"
  "� ������ {name} �������� ����� �������� � ��� �� �������, ��������\n"
  "����� ������� ������� ������. ������������ ��������� ptin\\_iterator,\n"
  "ostream\\_iterator � �������� copy."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 2);
  MakeVC(RandomN(10, 34), abcext);
  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  ResultFileVC(name.c_str(), 3, 3, " ");
}

void Stl7(int k)
{
  CreateTask();
  if (k == 0)
  TaskText(
  "��� ��������� ���� � ������ {name1}, ���������� ��������� �������������\n"
  "����� �����, � ������ {name2}. �������� � ��������� ���� � ������ {name2}\n"
  "��� ��������� ����� �� ��������� ����� � ��� �� �������, ����������\n"
  "������ ����� �� ����� ������. ������������ ��������� istream\\_iterator,\n"
  "ostream\\_iterator � �������� remove\\_copy."
  );
  else
  TaskText(
  "������ ������ \\4, ��������� ������ ��������� remove\\_copy\n"
  "���� for � ����������-����������."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  MakeVN(RandomN(10, 34), -9, 9);
//  DataVC("", 3);
  DataFileVN(name1.c_str(), 2, 5);
  auto it = remove(vn.begin(), vn.end(), 0);
  vn.erase(it, vn.end());
  ResultFileVN(name2.c_str(), 1, 5);
}

void Stl8(int k)
{
  CreateTask();
  if (k == 0)
  TaskText(
  "���� ����� ����� {K} (>\\,0), ��������� ���� � ������ {name1}, ���������� ����������\n"
  "�����, � ������ {name2}. �������� � ��������� ���� � ������ {name2} ��� �����\n"
  "�� ��������� �����, ����� ������� �� �����������~{K}, �������� �������� �������\n"
  "�� ���������� � ���������� ������ ����� �� ����� ������. ������������\n"
  "��������� istream\\_iterator, ostream\\_iterator � �������� remove\\_copy\\_if."
  );
  else
  TaskText(
  "������ ������ \\4, ��������� ������ ��������� remove\\_copy\\_if\n"
  "���� for � ����������-����������."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  size_t kk;
  do
  {
  kk = RandomN(5, 8);
  MakeVS(RandomN(10, 34));
  }
  while (count_if(vs.begin(), vs.end(), [kk](string e){return e.length() <= kk;}) <= 2);
  DataN("K = ", kk, 1, 1, 1);
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
//  MakeVS(RandomN(10, 34));
//  DataVC("", 3);
  DataFileVS(name1.c_str(), 2, 5);
  auto it = remove_if(vs.begin(), vs.end(), [kk](string e){return e.length() > kk;});
  vs.erase(it, vs.end());
  ResultFileVS(name2.c_str(), 1, 5);
}

void Stl9(int k)
{
  CreateTask();
  if (k == 0)
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "����� �����. ������� ����� �� ��������� ����� � ��������� �����������\n"
  "�������� (�.\\,�. ������ �����, ������ ����� � �.\\,�.). ������������\n"
  "��������� istream\\_iterator, ptout\\_iterator � �������� remove\\_copy\\_if."
  );
  else
  TaskText(
  "������ ������ \\4, ��������� ������ ��������� remove\\_copy\\_if\n"
  "���� for � ����������-����������."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  MakeVN(RandomN(10, 34), -99, 99);
//  DataVC("", 3);
  DataFileVN(name.c_str(), 2, 5);
  bool c = true;
  auto it = remove_if(vn.begin(), vn.end(), [&c](int e){return c = !c;});
  vn.erase(it, vn.end());
  ResultVN("", 3);
}

void Stl10(int k)
{
  CreateTask();
  if (k == 0)
  TaskText(
  "��� ����� ������������ �����, ���������� �� ����� ���� ���������.\n"
  "������� ����� �� ��������� ������ � ������� ����������� ��������\n"
  "(�.\\,�. ������ �����, ��������� ����� � �.\\,�.). ������������ ���������\n"
  "ptin\\_iterator, ptout\\_iterator � �������� remove\\_copy\\_if."
  );
  else
  TaskText(
  "������ ������ \\4, ��������� ������ ��������� remove\\_copy\\_if\n"
  "���� for � ����������-����������."
  );
  MakeVR(RandomN(10, 33), -999, 999);
//  DataVC("", 3);
  DataVR("", 3);
  bool c = false;
  auto it = remove_if(vr.begin(), vr.end(), [&c](int e){return c = !c;});
  vr.erase(it, vr.end());
  ResultVR("", 3);
}

void Stl15()
{
  CreateTask();
  TaskText(
  "���� ������ {name} � ����� ����� �����. �������� � ��������� ����\n"
  "� ������ {name} ��� ����� �� ��������� ������ � ��� �� �������, �������\n"
  "������ ����� 0 �� ����� 10 � �������� ����� ������� ����� ��� �������.\n"
  "������������ ��������� ptin\\_iterator, ostream\\_iterator\n"
  "� �������� replace\\_copy."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 2);
  MakeVN(RandomN(10, 17), 0, 9);
  DataVN("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  replace(vn.begin(), vn.end(), 0, 10);
  ResultFileVN1(name.c_str(), 3, 3, "  ");
}

void Stl16()
{
  CreateTask();
  TaskText(
  "��� ����� ��������. ������� ��� ������� �� ��������� ������ � ��� ��\n"
  "�������, ������� �������� ������� �� ������ �������������. ������������\n"
  "��������� ptin\\_iterator, ptout\\_iterator � �������� replace\\_copy\\_if."
  );
  MakeVC(RandomN(10, 34), abcext);
  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  replace_if(vc.begin(), vc.end(), [](char e){return e >= '0' && e <= '9';}, '_');
  ResultVC("", 3);
}

void Stl17()
{
  CreateTask();
  TaskText(
  "���� ������ {name} � ����� ��������. �������� � ��������� ���� � ������ {name}\n"
  "��������� ������� �������� ���� �������� �� ��������� ������ � ��� �� �������,\n"
  "�������� ����� ������� ����� ���� ������. ������������ ���������\n"
  "ptin\\_iterator, ostream\\_iterator � �������� transform."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 2);
  MakeVC(RandomN(10, 17), ABCext);
  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  vn.clear();
  transform(vc.begin(), vc.end(), back_inserter(vn), [](char e){return 2*(int)e;});
  ResultFileVN1(name.c_str(), 3, 3, " ");
}

void Stl18()
{
  CreateTask();
  TaskText(
  "���� ������ {name} � ����� ����� {K} (>\\,0). �������� � ��������� ����\n"
  "� ������ {name} {K} �������� \\<*\\>. ������������ �������� ostream\\_iterator\n"
  "� �������� fill\\_n."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), xLeft, 3);
//  MakeVC(RandomN(10, 23), ABCext);
  int k = RandomN(10,50);
  DataN("K = ", k, xRight, 3, 2);
//  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  vc.clear();
  fill_n(back_inserter(vc), k, '*');
  ResultFileVC(name.c_str(), 3, 3, "");
}

void Stl19()
{
  CreateTask();
  TaskText(
  "���� ������������ ����� {A}, {D} � ����� ����� {N}. ������� {N} ������ ������\n"
  "�������������� ���������� � ������ ��������� {A} � ��������� {D}.\n"
  "������������ �������� ptout\\_iterator � �������� generate\\_n."
  );
//  string name = RandomStr(8) + ".tst";
//  MakeVC(RandomN(10, 23), ABCext);
  double a = RandomN(100,999)/100.0;
  double d = RandomN(100,500)/100.0;
  int k = RandomN(10,20);
  DataR("A = ", a, xLeft, 3, 4);
  DataR("D = ", d, 0, 3, 4);
  DataN("N = ", k, xRight, 3, 2);
//  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  vr.clear();
  generate_n(back_inserter(vr), k, [&a, d]()->double{ a += d; return a-d;});
  ResultVR("", 3);
}

void Stl20()
{
  CreateTask();
  TaskText(
  "���� ������ {name} � ����� ����� {N} (1~\\l~{N}~\\l~26). �������� � ���������\n"
  "���� � ������ {name} {N} ��������� ��������� ���� ���������� ��������.\n"
  "������������ �������� ostream\\_iterator � �������� generate\\_n."
  );
  string name = RandomStr(8) + ".tst";
//  MakeVC(RandomN(10, 23), ABCext);
  int k = RandomN(1,26);
  DataS("name = ", name.c_str(), xLeft, 3);
  DataN("N = ", k, xRight, 3, 1);
//  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  vc.clear();
  int c = (int)'A';
  generate_n(back_inserter(vc), k, [&c]()->char{ return (char)(c++);});
  ResultFileVC(name.c_str(), 3, 3, "");
}

void Stl21()
{
  CreateTask();
  TaskText(
  "���� ��� ��������� ����� � ������� {name1} � {name2}, ���������� ���������\n"
  "������������� ����� �����, ������ � ������ ����� ����� �������������\n"
  "�� ��������. ������� ��� ����� �� �������� ������ � ���� ������\n"
  "������������������, ������������� �� ��������. ������������\n"
  "��������� istream\\_iterator, ptout\\_iterator � �������� merge\n"
  "� ���������� \\= �������������� ��������."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  MakeVN(RandomN(10, 34), -99, 99);
  sort(vn.begin(), vn.end(), greater<int>());
  DataFileVN(name1.c_str(), 2, 3);
//  DataVC("", 3);
//  DataFileVN(name.c_str(), 2, 5);
  vector<int> v1(vn);
  MakeVN(RandomN(10, 34), -99, 99);
  sort(vn.begin(), vn.end(), greater<int>());
  DataFileVN(name2.c_str(), 4, 5);
  vector<int> v2(vn);
  vn.clear();
  merge(v1.begin(), v1.end(), v2.begin(), v2.end(), back_inserter(vn), greater<int>());
  ResultVN("", 2);
}

bool StrComp(string s1, string s2)
{
        return s1.size() < s2.size() ||
                s1.size() == s2.size() && s1 < s2;
}

void Stl22()
{
  CreateTask();
  TaskText(
  "���� ��� ��������� ����� � ������� {name1} � {name2}, ���������� ���������� �����,\n"
  "������ � ������ ����� ����� ������������� �� ����������� �����, � ����� ������\n"
  "����� \\= � ������������������ �������. ������� ��� ����� �� �������� ������\n"
  "� ���� ������ ������������������, ������������� ����� �� �������,\n"
  "��� � �������� �����. ������������ ��������� istream\\_iterator, ptout\\_iterator\n"
  "� �������� merge � ���������� \\= �������������� ��������."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  MakeVS(RandomN(4, 10));
  sort(vs.begin(), vs.end(), StrComp);
  DataFileVS(name1.c_str(), 2, 3);
  vector<string> v1(vs);
  MakeVS(RandomN(4, 10));
  sort(vs.begin(), vs.end(), StrComp);
  DataFileVS(name2.c_str(), 4, 5);
  vector<string> v2(vs);
  vs.clear();
  merge(v1.begin(), v1.end(), v2.begin(), v2.end(), back_inserter(vs), StrComp);
  ResultVS("", 1);
}

void Stl23()
{
  CreateTask();
  TaskText(  
  "���� ��� ��������� ����� � ������� {name1} � {name2}, ���������� ����������\n"
  "���������� ��������� ������������� ������������ �����. ������� ��������\n"
  "{B}_1~\\-~{A}_1, {B}_2~\\-~{A}_2, \\., {B}_N~\\-~{A}_N, ��� {N} \\= ���������� �����\n"
  "� ������ �����, {A}_1, {A}_2, \\., {A}_N \\= ����� �� ����� {name1},\n"
  "� {B}_1, {B}_2, \\., {B}_N \\= ����� �� ����� {name2}. ������������ ���������\n"
  "istream\\_iterator, ptout\\_iterator � �������� transform."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  int k = RandomN(10, 22);
  MakeVR(k, -500, 500);
  DataFileVR(name1.c_str(), 2, 3);
  vector<double> v1(vr);
  MakeVR(k, -500, 500);
  DataFileVR(name2.c_str(), 4, 5);
  vector<double> v2(vr);
  vr.clear();
  transform(v1.begin(), v1.end(), v2.begin(), back_inserter(vr), 
          [](double e1, double e2){return e2-e1;});
  ResultVR("", 3);
}

void Stl24()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name1}, ���������� ���������� �����,\n"
  "������ {name2} � ����� ���������� ����, ������ �������� �� �����������\n"
  "���������� ����, ������������ � ����� {name1}. �������� � ��������� ����\n"
  "� ������ {name2} ��� ����� �� ��������� ������, �������� ������ �����\n"
  "�������� \\<-\\> (�����) � ������ �� ����� {name1} � ��� �� ���������� �������\n"
  "(���� ���� {name1} �������� ������ ����, ��� �������� �����, �� ������ �����\n"
  "� ����� ������������). ������ ����������� ����� ���������� � ����\n"
  "� ����� ������. ������������ ��������� ptin\\_iterator, istream\\_iterator,\n"
  "\\Mostream\\_iterator\\m � �������� transform."
  );
  string name1 = RandomStr(7) + "1.tst", name2 = RandomStr(7) + "2.tst";
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  int k = RandomN(10, 12);
  MakeVS(k + RandomN(0, 6));
  DataFileVS(name1.c_str(), 2, 2);
  vector<string> v1(vs);
  MakeVS(k);
  DataVS("", 3);
  vector<string> v2(vs);
  vs.clear();
  transform(v2.begin(), v2.end(), v1.begin(), back_inserter(vs), 
          [](string e1, string e2){return e1+"-"+e2;});
  ResultFileVS(name2.c_str(), 1, 5);
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
    case 7:      Stl7(0); break;
    case 8:      Stl8(0); break;
    case 9:      Stl9(0); break;
    case 10:      Stl10(0); break;
    case 11:      Stl7(1); break;
    case 12:      Stl8(1); break;
    case 13:      Stl9(1); break;
    case 14:      Stl10(1); break;
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
  }
}

void  inittaskgroup_()
{
    if ((CurrentLanguage() & lgCPP) == 0) return;
  CreateGroup("STL1Iter", "���������� � ����������� � �����������", 
    "�. �. �������, 2015, 2021" , "qwq233#EnTopic<Introduction to iterators and algorithms>#4sd255335hfgd5ttd", 24, InitTask_); 

  CommentText("��� ���� �������� ������� ������ ������� ����������� �� ������ (�.\\,�. ���������� ���������),");
  CommentText("� ����� �������� ���������.");
}
}

//----------------------------------------

void  inittaskgroup1()
{
    STL1::inittaskgroup_();
}
void  InitTask1(int num)
{
    STL1::InitTask_(num);
}

//-------------------------------------
