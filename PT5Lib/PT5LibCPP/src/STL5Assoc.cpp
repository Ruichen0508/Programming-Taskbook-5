#include <string>
#include <fstream>
#include <vector>
#include <list>
#include <set>
#include <map>
#include <algorithm>
#include <iterator>
#include <functional>
#include "pt5taskmaker.h"

namespace STL5
{

vector<int> vn, vn1, vn2, vn3;
vector<string> vs, vs1, vs2, vs3;
vector<pair<int, int>> vnp;
vector<pair<int, vector<int>>> vnpv;
vector<pair<string, string>> vsp;
map<int, int> mn;
map<int, string> ms;
map<int, vector<int>> mnv;
map<int, vector<string>> mnvs;
map<int, multiset<string>> mnm;
map<int, set<string, greater<string>>> ms1;
map<string, set<string, greater<string>>> mss;
map<string, string> mss1;

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

const char* tit1 = "���������. ���������-������������� ���������";
const char* tit2 = "�����������. ����������� � ����������� ������";

int max_(int a, int b)
{
    return a > b ? a : b;
}

void MakeVN(int n, int a1, int b1)
{
  vn.clear();
  for (int i = 0; i < n; i++)
    vn.push_back(RandomN(a1,b1));
}

void MakeVNDist(int n, int a1, int b1)
{
  vn.clear();
  for (int i = 0; i < n; i++)
  {
	  int d = RandomN(a1,b1);
	  while (find(vn.begin(), vn.end(), d) != vn.end())
		  d = RandomN(a1,b1);
      vn.push_back(d);
  }
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

void ResultVNP(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vnp.size();
  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment("):",p+3,y);
  p += 5;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultN("",vnp[i].first,p,y,4);
          p += 4;
      ResultN("",vnp[i].second,p,y,4);
          p += 6;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}

void ResultVNP1(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vnp.size();
//  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultN("",vnp[i].first,p,y,4);
          p += 4;
      ResultN("",vnp[i].second,p,y,4);
          p += 6;
          if (p > 74)
          {
                  y++;
                  p = p0;
          }
  }
}


void ResultVNPV(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vnpv.size();
//  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultN("",vnpv[i].first,p,y,4);
          p += 6;
for (int j = 0; j < (int)vnpv[i].second.size(); ++j)
{
		  ResultN("",vnpv[i].second[j],p,y,4);
          p += 4;
}
      y++;
      p = p0;
  }
}

void ResultMSS(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mss.size();
//  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  for (auto i = mss.begin(); i != mss.end(); i++)
  {
      ResultS("",i->first.c_str(),p,y);
      p += 5 + i->first.size();
	  int pp = p;

      for (auto j = i->second.begin(); j != i->second.end(); ++j)
{
          if (p+j->size()+3 > 74)
          {
                  y++;
                  p = pp;
          }
		  ResultS("",j->c_str(),p,y);
          p += 3 + j->size();
}
      y++;
      p = p0;
  }
}

void ResultMSS1(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mss1.size();
//  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 6;
  int p0 = p;
  for (auto i = mss1.begin(); i != mss1.end(); i++)
  {
      ResultS("",i->first.c_str(),p,y);
      p += 3 + i->first.size();
	  int pp = p;
      ResultS("",i->second.c_str(),p,y);
      y++;
      p = p0;
  }
}

void ResultVSP(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vsp.size();
  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment("):",p+3,y);
  p += 6;
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
          if (p + vsp[i].first.size() + vsp[i].second.size() + 8 > 74)
          {
                  y++;
                  p = p0;
          }
      ResultS("",vsp[i].first.c_str(),p,y);
          p += 3 + vsp[i].first.size();
      ResultS("",vsp[i].second.c_str(),p,y);
          p += 5 + vsp[i].second.size();
  }
}

void ResultMN(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mn.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mn.begin();
  for (int i = 0; i < n; i++)
  {
      ResultN("",jj->first,p,y,4);
          p += 4;
      ResultN("",jj->second,p,y,3);
          p += 4;
          if (p > 70)
          {
                  y++;
                  p = p0;
          }
		  ++jj;
  }
}

void ResultMN1(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mn.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mn.begin();
  for (int i = 0; i < n; i++)
  {
      ResultN("",jj->first,p,y,3);
          p += 4;
      ResultN("",jj->second,p,y,4);
          p += 4;
          if (p > 70)
          {
                  y++;
                  p = p0;
          }
		  ++jj;
  }
}

void ResultMS(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = ms.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = ms.begin();
  for (int i = 0; i < n; i++)
  {
      ResultC(" ",(char)jj->first,p,y);
          p += 5;
      ResultS("",jj->second.c_str(),p,y);
      y++;
      p = p0;
      ++jj;
  }
}

void ResultMNCharInt(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mn.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mn.begin();
  for (int i = 0; i < n; i++)
  {
      ResultC(" ",(char)jj->first,p,y);
          p += 4;
      ResultN("",jj->second,p,y,3);
          p += 4;
          if (p > 70)
          {
                  y++;
                  p = p0;
          }
		  ++jj;
  }
}

void ResultMNIntVector(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mnv.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mnv.begin();
  for (int i = 0; i < n; i++)
  {
	  p = p0;
      ResultN("   ",jj->first,p,y,1);
          p += 4;
		  for (int ii=0; ii < (int)(jj->second).size(); ++ii)
		  {
             ResultN("",(jj->second)[ii],p,y,4);
             p += 4;
             if (p > 70)
             {
                  y++;
                  p = p0 + 4;
             }
		  }
		  ++jj;
		  y++;
  }
}

void ResultMNIntVector1(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mnv.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mnv.begin();
  for (int i = 0; i < n; i++)
  {
	  p = p0;
		  for (int ii=0; ii < (int)(jj->second).size(); ++ii)
		  {
             ResultN("   ",jj->first,p,y,1);
             p += 4;
             ResultN("",(jj->second)[ii],p,y,4);
             p += 4;
             if (p > 70)
             {
                  y++;
                  p = p0;
             }
		  }
		  ++jj;
		  y++;
  }
}

void ResultMNIntVector2(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mnvs.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mnvs.begin();
  for (int i = 0; i < n; i++)
  {
	  p = p0;
		  for (int ii=(int)(jj->second).size()-1; ii >= 0; --ii)
		  {
             if (p+5+(jj->second)[ii].size() > 72)
             {
                  y++;
                  p = p0;
             }
             ResultC(" ",(char)(jj->first),p,y);
             p += 5;
             ResultS("",(jj->second)[ii].c_str(),p,y);
             p += (jj->second)[ii].size() + 2;
		  }
		  ++jj;
		  y++;
  }
}

void ResultMNCharMultiset(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = mnm.size();
//  DataN("(",n,p,y,2);
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  auto jj = mnm.begin();
  for (int i = 0; i < n; i++)
  {
	  p = p0;
      ResultC(" ",(char)(jj->first),p,y);
          p += 5;
		  auto jjj = (jj->second).begin();
		  for (int ii=0; ii < (int)(jj->second).size(); ++ii)
		  {
             if (p+2+(*jjj).size() > 72)
             {
                  y++;
                  p = p0 + 5;
             }
             ResultS("",(*jjj).c_str(),p,y);
             p += (*jjj).size() + 3;
			 ++jjj;
		  }
		  ++jj;
		  y++;
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

void MakeVS(int n)
{
  vs.clear();
  int nw = EnWordCount()-1;
  for (int i = 0; i < n; i++)
    vs.push_back(EnWordSample(RandomN(0,nw)));
//  for (int i = 0; i <= nw; i++)
//    vs.push_back(EnWordSample(i));
}

void MakeVSDist(int n)
{
  vs.clear();
  int nw = EnWordCount()-1;
  for (int i = 0; i < n; i++)
  {
	  string d = EnWordSample(RandomN(0,nw));
	  while (find(vs.begin(), vs.end(), d) != vs.end())
		  d = EnWordSample(RandomN(0,nw));
      vs.push_back(d);
  }
}

int ylast = 0;
int steptotal = 0;

int calc_step(vector<string> &vs)
{
	return max_element(vs.begin(), vs.end(), [](string s1, string s2){return s1.size() < s2.size();})->size()+3;
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
  if (steptotal != 0)
	  step = steptotal;
  ylast = y;
  for (int i = 0; i < n; i++)
  {
      DataS("",vs[i].c_str(),p,y);
	  ylast = y;
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


void Stl1()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V} � ������ ����������� ���������. ���� ��� ��������,\n"
  "������������ �� ������ �������� �������, ������ ���� �� ���� ���\n"
  "� ��� ������ ��������, �� ������� true, ����� ������� false.\n"
  "������������ �������� includes, �������� ��� � ���� \\I����������\\i\n"
  "(����������� ���� set), ��������� �� ������ ������� {V}."
  );
  MakeVN(RandomN(4, 17)*2, -9, 9);
  int m = RandomN(0,1);
  switch (CurrentTest())
  {
      case 3:
      m = 0;         break;
      case 5: 
      m = 1;     break;
  }
  int n = vn.size();
  if (m == 1)
	  for (int i = n/2; i < n; ++i)
		  vn[i] = vn[RandomN(0, n/2-1)];
  else
	  for (int i = 0; i < RandomN(n/4,n/2-1); ++i)
		  vn[RandomN(n/2, n-1)] = vn[RandomN(0, n/2-1)];
  DataVN("V", 3);
  set<int> s1(vn.begin(), vn.begin() + n/2);
  set<int> s2(vn.begin()+n/2, vn.end());
  bool b = includes(s1.begin(), s1.end(), s2.begin(), s2.end());
  ResultB(b, 0, 3);
  SetTestCount(7);
}

void Stl2()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V}_0, ����� ����� {N} (>\\,0) � ����� �������� {V}_1,~\\., {V}_{N}. ��������,\n"
  "��� ������ ������� {V}_0 �� ����������� ������� ������ �� �������� {V}_1,~\\., {V}_{N}.\n"
  "����� ���������� �������� {V}_{I}, {I}~=~1,~\\., {N}, � ������� ����������\n"
  "��� �������� ������� {V}_0 (��� ����� �� ����������). ������������\n"
  "�������� includes, �������� ��� � ����� � ���� ����������, ���� �� �������\n"
  "������� �� ������ ������� {V}_0, � ������ �� ��������� �������� ��������\n"
  "�������� ���������� �� �������� {V}_{I}, {I}~=~1,~\\.,~{N}."
  );
  int n0 = RandomN(4, 8);
  MakeVN(n0, -9, 9);
  DataVN("V_0", 1);
  vn1 = vn;
  set<int> s1(vn.begin(), vn.end());
  int k = RandomN(3,6);
  DataN("N = ", k, 0, 2, 1);
  int cnt = 0;
  for (int j = 0; j < k; ++j)
  {
	  int n = RandomN(n0+1, 15);
      MakeVN(n, -9, 9);
      int m = RandomN(0,1);
      if (m == 1)
	    for (int i = 0; i < n; ++i)
		  vn[RandomN(0, n-1)] = vn1[i % n0];
      else
	    for (int i = 0; i < RandomN(n/2,n-1); ++i)
		  vn[RandomN(0, n-1)] = vn1[RandomN(0, n0-1)];
	  string s("V_");
	  s += (char)(49+j);
      DataVN(s.c_str(), j+3);
      set<int> s2(vn.begin(), vn.end());
	  if (includes(s2.begin(), s2.end(), s1.begin(), s1.end()))
		  ++cnt;
  }
  ResultN(cnt, 0, 3, 2);
  SetTestCount(9);
}

void Stl3()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V}_0, ����� ����� {N} (>\\,0) � ����� �������� {V}_1,~\\., {V}_{N}. ��������,\n"
  "��� ������ ������� {V}_0 �� ����������� ������� ������ �� �������� {V}_1,~\\., {V}_{N}.\n"
  "����� ���������� �������� {V}_{I}, {I}~=~1,~\\., {N}, � ������� ����������\n"
  "��� �������� ������� {V}_0 (� ������ �� ����������). ������������\n"
  "�������� includes, �������� ��� � ����� � ���� \\I����������������\\i\n"
  "(����������� ���� multiset), ���� �� ������� ������� �� ������ ������� {V}_0,\n"
  "� ������ �� ��������� �������� �������� ��������\n"
  "���������� �� �������� {V}_{I}, {I}~=~1,~\\.,~{N}."
  );
  int n0 = RandomN(4, 8);
  MakeVN(n0, -9, 9);
  DataVN("V_0", 1);
  vn1 = vn;
  multiset<int> s1(vn.begin(), vn.end());
  int k = RandomN(3,6);
  DataN("N = ", k, 0, 2, 1);
  int cnt = 0;
  for (int j = 0; j < k; ++j)
  {
	  int n = RandomN(n0+1, 15);
      MakeVN(n, -9, 9);
      int m = RandomN(0,1);
      if (m == 1)
	    for (int i = 0; i < n; ++i)
		  vn[RandomN(0, n-1)] = vn1[i % n0];
      else
	    for (int i = 0; i < RandomN(n/2,n-1); ++i)
		  vn[RandomN(0, n-1)] = vn1[RandomN(0, n0-1)];
	  string s("V_");
	  s += (char)(49+j);
      DataVN(s.c_str(), j+3);
      multiset<int> s2(vn.begin(), vn.end());
	  if (includes(s2.begin(), s2.end(), s1.begin(), s1.end()))
		  ++cnt;
  }
  ResultN(cnt, 0, 3, 2);
  SetTestCount(9);
}

void Stl4()
{
  CreateTask(tit1);
  TaskText(
  "���� ������ {name} � ������ {V} � ������ ����������� ���������.\n"
  "����� ��� ��������� �����, ������� ������������ ������ � � ������,\n"
  "� �� ������ �������� ��������� �������, � �������� �� � ��������� ����\n"
  "� ������ {name} � ������������ �������, �������� ����� ������� �����\n"
  "������ �������. ������������ �������� set\\_intersection ��� ����\n"
  "��������������� �������� � ��������� ostream\\_iterator."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 2);
  MakeVN(RandomN(5,17)*2, -9, 9);
  DataVN("V", 3);
  set<int> s1(vn.begin(), vn.begin()+vn.size()/2);
  set<int> s2(vn.begin()+vn.size()/2, vn.end());
  vn1.clear();
  set_intersection(s1.begin(), s1.end(), s2.begin(), s2.end(), back_inserter(vn1));
  vn = vn1;
  ResultFileVN1(name.c_str(), 3, 3, " ");
  SetTestCount(7);
}

void Stl5()
{
  CreateTask(tit1);
  TaskText(
  "���� ������ {name} � ������ {V} � ������ ����������� ���������.\n"
  "����� ��� ��������� �����, ������� ������ �� ������ �������� ���������\n"
  "������� � ��� ���� ����������� � ������ ��������. �������� ���������\n"
  "����� � ��������� ���� � ������ {name} � ��������� �������, ������ ������\n"
  "����� �� ����� ������. ������������ �������� set\\_difference ��� ����\n"
  "��������������� �������� � ��������� ostream\\_iterator. ����� ����������\n"
  "����� ����� � ������ �������, ��� �������� �������� � � ���������\n"
  "������������ �������������� ������ greater."
  );
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 2);
  MakeVN(RandomN(5,17)*2, -9, 9);
  DataVN("V", 3);
  set<int, greater<int>> s1(vn.begin(), vn.begin()+vn.size()/2);
  set<int, greater<int>> s2(vn.begin()+vn.size()/2, vn.end());
  vn1.clear();
  set_difference(s2.begin(), s2.end(), s1.begin(), s1.end(), 
	  back_inserter(vn1), greater<int>());
  vn = vn1;
  ResultFileVN1(name.c_str(), 3, 3, "\n");  //2021.12 �������� ������ (���� " ")
  SetTestCount(7);
}

void Stl6()
{
  CreateTask(tit1);
  TaskText(
  "���� ������� {V}_1 � {V}_2. ����� ��� ����� (� ������ ����������), �������\n"
  "������ ���� �� � ���� �� �������� ��������, � ������� �� � �������\n"
  "�����������; ��� ���� ����, ��������, ��������� ����� ������ � ����\n"
  "�� �������� 3 ����, � � ������ 5 ���, �� ��� ���� ������� 5 ���.\n"
  "������������ �������� set\\_union ��� ���� ��������������� ��������������\n"
  "� ��������� ptout\\_iterator."
  );
  MakeVN(RandomN(5,17), -9, 9);
  DataVN("V_1", 3);
  multiset<int> s1(vn.begin(), vn.end());
  MakeVN(RandomN(5,17), -9, 9);
  DataVN("V_2", 4);
  multiset<int> s2(vn.begin(), vn.end());
  vn.clear();
  set_union(s1.begin(), s1.end(), s2.begin(), s2.end(), 
	  back_inserter(vn));
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl7()
{
  CreateTask(tit1);
  TaskText(
  "���� ������� {V}_1 � {V}_2 � ��������� ����������� ���������. ����� ��� �����\n"
  "(� ������ ����������), ������� ������ � ���� �� �������� ��������\n"
  "� ����������� � ������, � ������� �� � ������� ��������; ��� ���� ����,\n"
  "��������, ��������� ����� ������ � ���� �� �������� 3 ����,\n"
  "� � ������ 5 ���, �� ��� ���� ������� 2 ����. ������������ ��������\n"
  "set\\_symmetric\\_difference ��� ���� ��������������� ��������������\n"
  "� ��������� ptout\\_iterator. ����� ���������� ����� ����� � ������\n"
  "�������, ��� �������� �������� � � ��������� ������������\n"
  "�������������� ������ greater."
  );
  int n1 = RandomN(5,17);
  MakeVN(n1, -9, 9);
  DataVN("V_1", 3);
  multiset<int, greater<int>> s1(vn.begin(), vn.end());
  int n2 = RandomN(5,17);
  while (n1 == n2)
	  n2 = RandomN(5,17);
  MakeVN(n2, -9, 9);
  DataVN("V_2", 4);
  multiset<int, greater<int>> s2(vn.begin(), vn.end());
  vn.clear();
  set_symmetric_difference(s1.begin(), s1.end(), s2.begin(), s2.end(), 
	  back_inserter(vn), greater<int>());
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl8()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V}, ���������� �� ����� ���� ��������� �����.\n"
  "������� ��� ��� ��������� ��������, ����� ������������� � ������������,\n"
  "� ������� ��������. ������������ ��������������� ��������� � �������� copy\n"
  "� ��������� �����������, ������������ �� ������������� � ������ ��������\n"
  "���������, � � ���������� ptout\\_iterator."
  );
  int n1 = RandomN(5,17);
  MakeVN(n1, -9, 9);
  set<int> s0(vn.begin(), vn.end());
  while (s0.size()<=2)
  {
  MakeVN(n1, -9, 9);
  s0 = set<int>(vn.begin(), vn.end());
  }
  DataVN("V", 3);
  vn.clear();
  copy(++s0.rbegin(), --s0.rend(), back_inserter(vn));
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl9()
{
  CreateTask(tit1);
  TaskText(
  "������ ������ \\1, �� ��������� ��������������� ���������.\n"
  "������ ���� ��������������� ������������ ��� ��������� �������\n"
  "��������� sort, unique � copy."
  );
  int n1 = RandomN(5,17);
  MakeVN(n1, -9, 9);
  set<int> s0(vn.begin(), vn.end());
  while (s0.size()<=2)
  {
  MakeVN(n1, -9, 9);
  s0 = set<int>(vn.begin(), vn.end());
  }
  DataVN("V", 3);
  vn.clear();
  copy(++s0.rbegin(), --s0.rend(), back_inserter(vn));
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl10()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V}, ���������� �� ����� ���� ��������� �����.\n"
  "������� ��� ��� �������� (� ������ ����������), ����� ������������\n"
  "� �������������, � ������� �����������. ������������ ���������������\n"
  "���������������, ��� �������-����� lower\\_bound � upper\\_bound\n"
  "� �������� copy � ���������� ptout\\_iterator."
  );
  int n1 = RandomN(8,17);
  MakeVN(n1, -9, 9);
  int k1 = *max_element(vn.begin(), vn.end());
  int k2 = *min_element(vn.begin(), vn.end());
  int n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k1;
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k2;
  set<int> s0(vn.begin(), vn.end());
  while (s0.size()<=2)
  {
  MakeVN(n1, -9, 9);
  k1 = *max_element(vn.begin(), vn.end());
  k2 = *min_element(vn.begin(), vn.end());
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k1;
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k2;
  s0 = set<int>(vn.begin(), vn.end());
  }
  DataVN("V", 3);
  multiset<int> s1(vn.begin(), vn.end());
  vn.clear();
  copy(s1.upper_bound(*s1.begin()), s1.lower_bound(*(--s1.end())), back_inserter(vn));
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl11()
{
  CreateTask(tit1);
  TaskText(
  "������ ������ \\1, �� ��������� ��������������� ���������������.\n"
  "������ ���� ��������������� ������������ ��� ��������� �������\n"
  "��������� sort, lower\\_bound, upper\\_bound � copy."
  );
  int n1 = RandomN(8,17);
  MakeVN(n1, -9, 9);
  int k1 = *max_element(vn.begin(), vn.end());
  int k2 = *min_element(vn.begin(), vn.end());
  int n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k1;
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k2;
  set<int> s0(vn.begin(), vn.end());
  while (s0.size()<=2)
  {
  MakeVN(n1, -9, 9);
  k1 = *max_element(vn.begin(), vn.end());
  k2 = *min_element(vn.begin(), vn.end());
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k1;
  n0 = RandomN(1,3);
  for (int i = 0; i < n0; ++i)
	  vn[RandomN(0, n1-1)] = k2;
  s0 = set<int>(vn.begin(), vn.end());
  }
  DataVN("V", 3);
  multiset<int> s1(vn.begin(), vn.end());
  vn.clear();
  copy(s1.upper_bound(*s1.begin()), s1.lower_bound(*(--s1.end())), back_inserter(vn));
  ResultVN("", 3);
  SetTestCount(7);
}

void Stl12()
{
  CreateTask(tit1);
  TaskText(
  "��� ������ {V}. ���������� ���������� ���������� ������� �����\n"
  "� ������� {V} � ������� ��� ��������� �������� ������� {V} ������\n"
  "� ����������� �� ���������� (� ������� ����������� �������� ���������);\n"
  "���������� ���������� �������� ����� ����� �������� ����������������\n"
  "��������. ������������ ��������������� ��������������� � ����,\n"
  "� ������� ���������� �������-���� upper\\_bound ��� ���������������\n"
  "� ������� distance ��� ��� ����������."  // �������� �������� (difference) //2022.10
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -9, 9);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mn[vn[i]]++;
  DataVN("V", 3);
  ResultMN("", 3);
  SetTestCount(7);
}

void Stl13()
{
  CreateTask(tit1);
  TaskText(
  "������ ������ \\1, �� ��������� ��������������� ���������������\n"
  "� ������� distance. ������ ��� ������������ ��� ��������� �������\n" // �������� �������� (difference) //2022.10
  "�������� sort � � ����� �������� upper\\_bound\n"
  "� �������� �������� ��� ���������� �������."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -9, 9);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mn[vn[i]]++;
  DataVN("V", 3);
  ResultMN("", 3);
  SetTestCount(7);
}

void Stl14()
{
  CreateTask(tit1);
  TaskText(
  "������ ������ \\2, �� ��������� ������� upper\\_bound � ����.\n"
  "������ ����� ������������ ��������������� ��������������� {M}\n"
  "� ��������������� ��������� {S} (������ �� �� ������ ��������� �������)\n"
  "� �������� for\\_each ��� ��������� {S} � ���������� \\= ��������������\n"
  "��������, � ������� ������������ �������-���� count ��������������� {M}."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -9, 9);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mn[vn[i]]++;
  DataVN("V", 3);
  ResultMN("", 3);
  SetTestCount(7);
}

void Stl15()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}. ���������� ���������� ���������� ������� �����\n"
  "� ������� {V} � ������� ��� ��������� �������� ������� {V} ������\n"
  "� ����������� �� ���������� (� ������� ����������� �������� ���������);\n"
  "���������� ���������� �������� ����� ����� �������� ����������������\n"
  "��������. ������������ ��������������� \\I�����������\\i {M} (����� map), �������\n"
  "�������� �������� ��������� �������� ������� {V}, � ����������~\\= ����������\n"
  "���������� ���� ���������. ��� ���������� ����������� {M} �� ������������\n"
  "�������� ����������� (���������� �������� �������������� [] � ����������).\n"
  "�������� ������� {V} (��� ���������� ����������� {M}) � ��������\n"
  "����������� {M} (��� ������ ���������� �����������) ����������\n"
  "� ����� � ����������-���������� ���������������� ����������."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -9, 9);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mn[vn[i]]++;
  DataVN("V", 3);
  ResultMN("", 3);
  SetTestCount(7);
}

void Stl16()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� ��� �������� ��������� ������� {V}\n"
  "� ����������� {M} ������ ��������� for\\_each ���, ���� ����������\n"
  "������������ �������� C++11, ����� for �� ��������� ����������.\n"
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -9, 9);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mn[vn[i]]++;
  DataVN("V", 3);
  ResultMN("", 3);
  SetTestCount(7);
}

void Stl17()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}, ���������� �������� �������� ���������� �����, ���������\n"
  "���������� �������. ���������� ��������� ����� ����, ������������ � �����\n"
  "� ��� �� �����, � ������� ��� ��������� �����, � ������� ����������\n"
  "�������� ������� {V}, ������ � ��������� ������ ���� ��������� (� ����������\n"
  "������� ����); ����� �������� ����� ����� ��������������� �����.\n"
  "������������ ��������������� ����������� {M}, ������� �������� ��������\n"
  "��������� ����� ��������� ������� {V}, � ����������~\\= ���������\n"
  "����� ���� ���������. ��� ���������� ����������� {M} �� ������������\n"
  "�������� ����������� (���������� �������� �������������� [], ����������\n"
  "� �������-����� size ��� �����). �������� ������� {V} (��� ����������\n"
  "����������� {M}) � �������� ����������� {M} (��� ������ ����������\n"
  "�����������) ���������� � ����� � ����������-����������\n"
  "���������������� ����������."
  );
  int n1 = RandomN(10,16);
  MakeVS(n1);
  mn.clear();
  for (int i = 0; i < (int)vs.size(); ++i)
	  mn[(int)(vs[i][0])]+= vs[i].size();
  DataVS("V", 2);
  ResultMNCharInt("", 3);
  SetTestCount(7);
}

void Stl18()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� ��� �������� ��������� ������� {V}\n"
  "� ����������� {M} ������ ��������� for\\_each ���, ���� ����������\n"
  "������������ �������� C++11, ����� for �� ��������� ����������."
  );
  int n1 = RandomN(10,16);
  MakeVS(n1);
  mn.clear();
  for (int i = 0; i < (int)vs.size(); ++i)
	  mn[(int)(vs[i][0])]+= vs[i].size();
  DataVS("V", 2);
  ResultMNCharInt("", 3);
  SetTestCount(7);
}

void Stl19()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}. ��������� \\I�����������\\i ��������� ������� {V}, ���������\n"
  "� �������� ����� ����������� ��������� (�.\\,�. ������) ����� ��������:\n"
  "� ���� ������ ������ ������� ��� �������� ������� {V}, ��������������\n"
  "�� ���� � �� �� ����� (��������������� �������� ������ �������������\n"
  "� ��� �� �������, � ������� ��� ������������� � �������� �������).\n"
  "����������� ��������� ����������� � ���� ����������� {M}, ������� ��������\n"
  "�������� ����� �����������, � ����������~\\= �������, ����������\n"
  "��������������� �������� (����� �������, ����������� {M} ������ �����\n"
  "��� map<int,~vector<int>>). ������� ���������� ����������� (��� �������\n"
  "�������� ����������� {M} ������� �������� ����, � ����� �������� ����������\n"
  "� ��� �������). ��� �������� ��������� �����������\n"
  "������������ ����� � �����������-�����������."
  );
  int n1 = RandomN(10,51);
  MakeVN(n1, -99, 99);
  mnv.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mnv[abs(vn[i])%10].push_back(vn[i]);
  DataVN("V", 3);
  ResultMNIntVector("", 1);
  SetTestCount(7);
}

void Stl20()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}, ���������� �������� �������� ���������� �����, ���������\n"
  "���������� �������. ��������� ����������� ��������� ������� {V}, ���������\n"
  "� �������� ����� ����������� ������ ����� ��������: � ���� ������ ������\n"
  "������� ��� �������� ������� {V}, ������������ � ����� � ��� �� �����\n"
  "(��������������� �������� ������ ������������� � ���������� �������\n"
  "� ������ ����������). ����������� ��������� ����������� � ����\n"
  "����������� {M}, ������� �������� �������� ����� �����������, � ����������~\\=\n"
  "���������������, ���������� ��������������� �������� (����� �������,\n"
  "����������� {M} ������ ����� ��� map<char,~multiset<string>>). �������\n"
  "���������� ����������� (��� ������� �������� ����������� {M} �������\n"
  "�������� ����, � ����� �������� ���������� � ��� ���������������).\n"
  "��� �������� ��������� ����������� ������������ �������� for\\_each ���,\n"
  "���� ���������� ������������ �������� C++11, ���� for �� ��������� ����������."
  );
  int n1 = RandomN(12,40);
  MakeVS(n1);
  mnm.clear();
  for (int i = 0; i < (int)vs.size(); ++i)
	  mnm[(int)(vs[i][0])].insert(vs[i]);
  DataVS("V", 1);
  ResultMNCharMultiset("", 1);
  SetTestCount(7);
}

void Stl21()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}. ��������� ����������� ��������� ������� {V}, ���������\n"
  "� �������� ����� ����������� ��������� (�.\\,�. ������) ����� ��������:\n"
  "� ���� ������ ������ ������� ��� �������� ������� {V}, ��������������\n"
  "�� ���� � �� �� ����� (��������������� �������� ������ �������������\n"
  "� ��� �� �������, � ������� ��� ������������� � �������� �������).\n"
  "����������� ��������� ����������� � ���� \\I�����������������\\i {M} (������\n"
  "multimap), ������� �������� �������� ����� �����������, �.\\,�. ���������\n"
  "����� ��������� ������� {V}, � ����������~\\= �������� �������, ��������������\n"
  "�� ��������������� ����� (����� �������, ����������� {M} ������ ����� ���\n"
  "multimap<int,~int>). ������� ���������� ����������� (��� ������� ��������\n"
  "����������� {M} ������� �������� ����, � ����� ��������� � ��� �������\n"
  "������� {V}; ����� ����� �����������). ��� �������� ���������\n"
  "����������� ������������ ����� � �����������-�����������."
  );
  int n1 = RandomN(12,51);
  MakeVN(n1, -99, 99);
  mnv.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
	  mnv[abs(vn[i])%10].push_back(vn[i]);
  DataVN("V", 3);
  ResultMNIntVector1("", 1);
  SetTestCount(7);
}

void Stl22()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}, ���������� �������� �������� ���������� �����, ���������\n"
  "���������� �������. ��������� ����������� ��������� ������� {V}, ���������\n"
  "� �������� ����� ����������� ��������� ����� ��������: � ���� ������\n"
  "������ ������� ��� �������� ������� {V}, �������������� ����� � ��� ��\n"
  "������ (��������������� �������� ������ ������������� � �������, ��������\n"
  "������� �� ������������ � �������� �������). ����������� ���������\n"
  "����������� � ���� ����������������� {M}, ������� �������� �������� �����\n"
  "�����������, �.\\,�. ��������� ����� ��������� ������� {V}, � ����������~\\=\n"
  "�������� �������, �������������� �� ��������������� ����� (����� �������,\n"
  "����������� {M} ������ ����� ��� multimap<char,~string>). ������� ����������\n"
  "����������� (��� ������� �������� ����������� {M} ������� �������� ����,\n"
  "� ����� ��������� � ��� ������� ������� {V}; ����� ����� �����������).\n"
  "��� �������� ��������� ����������� ������������ �������� for\\_each ���,\n" 
  "���� ���������� ������������ �������� C++11, ���� for �� ��������� ����������.\n"
  "\\P\\S��������.\\s ��� ���������� ��������� � ������ � �������, ��������\n"
  "��������� ������� �� ������������ � �������, ���������� ��� ������������\n"
  "����������������� {M} ���������� �������� ������� {V} � �������� �������\n"
  "(��������� �������� ���������). ��������� ��������� ����� ��������\n"
  "� ��� ������ �������� ��������� �������, ���� ������������ �������\n"
  "�������-����� \\MM.insert\\m � ������ ����������-���������� (\\<����������\\>),\n"
  "� �������� �������� ��������� ������������ �������� �������-�����\n"
  "\\MM.lower\\_bound\\m ��� ���������������� �����."
  );
  int n1 = RandomN(12,40);
  MakeVS(n1);
  mnvs.clear();
  for (int i = 0; i < (int)vs.size(); ++i)
	  mnvs[(int)(vs[i][vs[i].size()-1])].push_back(vs[i]);  //2021.12 �������� �������� (���� 0, � ���� vs[i].size()-1)
  DataVS("V", 1);
  ResultMNIntVector2("", 1);
  SetTestCount(7);
}

void Stl23()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}. � ������ ������ ��� ���������, �������������� �� ����\n"
  "� �� �� �����, ����� ����� �������� ���� ���������, �� �����������\n"
  "���������� �������� ������ (��������������, ��� �������� ������\n"
  "������������� � ��� �� �������, ��� � � �������� �������). ���� ������\n"
  "������� �� ������������� ��������, �� ����� ������ ���������~0. ��� ������\n"
  "������ ������� ��������������� �� ����� � ��������� �����, ������������\n"
  "��������� ���� �� ����������� ����. ������������ ���������������\n"
  "����������� {M} � ������� �����������, ��������� � ������ \\4.\n"
  "��� ���������� ���� ������������ �������� accumulate."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -99, 99);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
  {
	  int d = abs(vn[i])%10;
	  if (mn.find(d) == mn.end())
		  mn[d] = 0;
	  else
	      mn[d] += vn[i];
  }
  DataVN("V", 3);
  ResultMN1("", 3);
  SetTestCount(7);
}

void Stl24()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� ��������������� ����������������� {M}\n"
  "� ������� �����������, ��������� � ������ \\3.\n"
  "��� ���������� ���� ������������ �������� accumulate."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -99, 99);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
  {
	  int d = abs(vn[i])%10;
	  if (mn.find(d) == mn.end())
		  mn[d] = 0;
	  else
	      mn[d] += vn[i];
  }
  DataVN("V", 3);
  ResultMN1("", 3);
  SetTestCount(7);
}

void Stl25()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\2, �� �������� � ����� ���������������\n"
  "�����������. ������������ ����������� {M} � ������~\\= ��������� ������ �����\n"
  "� ���������~\\= ������ ��������� ����� (��. � ������� \\10).\n"
  "��� ������������ ����������� {M} ������������, ������\n"
  "� ���������� �������������� � ����������, �������-���� find."
  );
  int n1 = RandomN(10,34);
  MakeVN(n1, -99, 99);
  mn.clear();
  for (int i = 0; i < (int)vn.size(); ++i)
  {
	  int d = abs(vn[i])%10;
	  if (mn.find(d) == mn.end())
		  mn[d] = 0;
	  else
	      mn[d] += vn[i];
  }
  DataVN("V", 3);
  ResultMN1("", 3);
  SetTestCount(7);
}

void Stl26()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}, ���������� �������� �������� ���������� �����, ���������\n"
  "���������� �������. � ������ ������ ��� ���������, ��������������\n"
  "�� ���� � �� �� �����, �������� ������, ���������� ������ ���� ����\n"
  "�� ���� ������, ����� ���������� ����� (��������������, ��� ��������\n"
  "������ ������������� � ��� �� �������, ��� � � �������� �������).\n"
  "��� ���������� ������ ��������� ����� ������� ����� ������. ���� ������\n"
  "������� �� ������������� ��������, �� ������ ������ �������� ������.\n"
  "��� ������ ������ ������� ��������������� �� ����� � ��������� ������,\n"
  "������������ ��������� ���� � ���������� ������� ����. ������������\n"
  "��������������� ����������� {M} � ������� �����������, ��������� � ������\n"
  "\\6. ��� ���������� ���� ������������ �������� accumulate."
  );
  int n1 = RandomN(12,20);
  int max = 0;
  do
  {
  max = 0;
  MakeVS(n1);
  ms.clear();
  for (int i = (int)vs.size()-1; i >= 0; --i)
  {
	  int sz = vs[i].size();
	  int d = (int)(vs[i][sz-1]);
	  if (ms.find(d) == ms.end())
		  ms[d] = "";
	  else
	      ms[d] = vs[i] + " " + ms[d];
	  if ((int)ms[d].size() > max)
		  max = ms[d].size();
  }
  }
  while (max > 63);
  DataVS("V", 1);
  ResultMS("", 1);
  SetTestCount(7);
}

void Stl27()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� ��������������� ����������������� {M}\n"
  "� ������� �����������, ��������� � ������ \\5. ��� ����������\n"
  "���� ������������ �������� accumulate."
  );
  int n1 = RandomN(12,20);
  int max = 0;
  do
  {
  max = 0;
  MakeVS(n1);
  ms.clear();
  for (int i = (int)vs.size()-1; i >= 0; --i)
  {
	  int sz = vs[i].size();
	  int d = (int)(vs[i][sz-1]);
	  if (ms.find(d) == ms.end())
		  ms[d] = "";
	  else
	      ms[d] = vs[i] + " " + ms[d];
	  if ((int)ms[d].size() > max)
		  max = ms[d].size();
  }
  }
  while (max > 63);
  DataVS("V", 1);
  ResultMS("", 1);
  SetTestCount(7);
}

void Stl28()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\2, �� �������� � ����� ���������������\n"
  "�����������. ������������ ����������� {M} � ������~\\= ��������� ������\n"
  "����� � ���������~\\= ������ ��������� ���� (��. � ������� \\11).\n"
  "��� ������������ ����������� {M} ������������ ������� ��������� ������� {V}\n"
  "� ����� � ������������, ������ � ����������\n"
  "�������������� � ����������, �������-���� find."
  );
  int n1 = RandomN(12,20);
  int max = 0;
  do
  {
  max = 0;
  MakeVS(n1);
  ms.clear();
  for (int i = (int)vs.size()-1; i >= 0; --i)
  {
	  int sz = vs[i].size();
	  int d = (int)(vs[i][sz-1]);
	  if (ms.find(d) == ms.end())
		  ms[d] = "";
	  else
	      ms[d] = vs[i] + " " + ms[d];
	  if ((int)ms[d].size() > max)
		  max = ms[d].size();
  }
  }
  while (max > 63);
  DataVS("V", 1);
  ResultMS("", 1);
  SetTestCount(7);
}

void Stl29()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2; ��� �������� � ������ ������� ��������. ��������\n"
  "������ {V}, ���������� ���� ����� (���� pair<int,~int>), ���������������\n"
  "��������� ��������: ������ ������� ���� ����������� ������� {V}_1, ������\n"
  "����������� ������� {V}_2, � ��� �������� ������������ ����� � ��� �� ������.\n"
  "���������� ����� ��� ���������� \\I���������� ������������\\i �������� {V}_1 � {V}_2\n"
  "�� �����, ������������� ���������� ������� �������� �����. �������\n"
  "���������� ��� ������������ �������� �������� ��������� ������� {V}_1,\n"
  "� ��� ������ ������ ���������~\\= �������� �������� ��������� ������� {V}_2.\n"
  "��� ���������� ������� {V} ��������� ����������� ��������� ������� {V}_2\n"
  "�� �����~\\= ��������� �����, ��������� ������� �����������\n"
  "�� ��������������� ������������ {M}, ��������� � ������ \\10,\n"
  "����� ���� � ����� �� ��������� ������� {V}_1 ������������ ���������\n"
  "���������� �����������, ��������� ��� ������� �������� ������� {V}_1\n"
  "��������������� ��� �������� ����������� {M}. ������� ������\n"
  "����������� ������� {V} � ��� ��� ��������."
  );
  int m = RandomN(0,3);
  int m1 = RandomN(0,1);
  switch (CurrentTest())
  {
      case 2: 
      m = 0; m1 = 1;        break;
	  case 4:
      m = 0; m1 = 0;        break;
      case 6: 
      m = 1;     break;
  }
//  m = 0; //m1 = 0;
  do
  {
  int n1 = RandomN(10,34);
  if (m == 0)
	  n1 = RandomN(3,6);
  MakeVNDist(n1, -99, 99);
  vn1 = vn;
  int n2 = RandomN(10,34);
  if (m == 0)
	  n2 = RandomN(3,6);
  MakeVNDist(n2, -99, 99);
  vn2 = vn;
  mnv.clear();
  vnp.clear();
  for (int i = 0; i < n2; ++i)
	      mnv[abs(vn2[i])%10].push_back(vn2[i]);
  for (int i = 0; i < n1; ++i)
  {
	  auto it = mnv.find(abs(vn1[i])%10);
	  if (it != mnv.end())
		  for (int j = 0; j < (int)it->second.size(); ++j)
			  vnp.push_back(make_pair(vn1[i], it->second[j]));
  }
  }
  while (vnp.size() > 99 || (m + m1 == 0 && vnp.size() > 0));
  vn = vn1;
  DataVN("V_1", 2);
  vn = vn2;
  DataVN("V_2", 4);
  ResultVNP("V", 1);
  SetTestCount(7);
}

void Stl30()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, �������� ����������� ��������� ������� {V}_2\n"
  "��������, ��������� � ������ \\9 (� ��������������\n"
  "���������������� ����������������� {M}). ��� ������ � ����������������� {M}\n"
  "��������� � ��������� ������ ������������ �������-���� equal\\_range."
  );
  int m = RandomN(0,3);
  int m1 = RandomN(0,1);
  switch (CurrentTest())
  {
      case 2: 
      m = 0; m1 = 1;        break;
	  case 4:
      m = 0; m1 = 0;        break;
      case 6: 
      m = 1;     break;
  }
//  m = 0; //m1 = 0;
  do
  {
  int n1 = RandomN(10,34);
  if (m == 0)
	  n1 = RandomN(3,6);
  MakeVNDist(n1, -99, 99);
  vn1 = vn;
  int n2 = RandomN(10,34);
  if (m == 0)
	  n2 = RandomN(3,6);
  MakeVNDist(n2, -99, 99);
  vn2 = vn;
  mnv.clear();
  vnp.clear();
  for (int i = 0; i < n2; ++i)
	      mnv[abs(vn2[i])%10].push_back(vn2[i]);
  for (int i = 0; i < n1; ++i)
  {
	  auto it = mnv.find(abs(vn1[i])%10);
	  if (it != mnv.end())
		  for (int j = 0; j < (int)it->second.size(); ++j)
			  vnp.push_back(make_pair(vn1[i], it->second[j]));
  }
  }
  while (vnp.size() > 99 || (m + m1 == 0 && vnp.size() > 0));
  vn = vn1;
  DataVN("V_1", 2);
  vn = vn2;
  DataVN("V_2", 4);
  ResultVNP("V", 1);
  SetTestCount(7);
}

void Stl31()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2, ���������� ������� �������� ���������� �����,\n"
  "��������� ���������� �������, ������ ��� ����� � ������ ������� ��������.\n"
  "�������� ������ {V}, ���������� ���������� ������������ �������� {V}_1 � {V}_2\n"
  "(��. \\2), ������ ���� �������� �������� ����� ����������\n"
  "�����. ������� ���������� ��� ������������ ���������� �������� ������\n"
  "��������� ���, � ��� ������ ������ ���������~\\= �������� ������ ���������,\n"
  "�������� �����������. ��� ���������� ������� {V} ��������� �����������\n"
  "��������� ������� {V}_2 �� �����~\\= ����� �����, ��������� �������\n"
  "����������� �� ��������������� ������������ {M} ���� map<int,~set<string>>\n"
  "(��. � ������� \\11), ����� ���� � ����� �� ���������������\n"
  "��������� ������� {V}_1 ������������ ��������� ���������� �����������,\n"
  "��������� ��� ������� �������� ������� {V}_1 ��������������� ��� ��������\n"
  "����������� {M}. ������� ������ ����������� ������� {V} � ��� ��� ��������."
  );
  int m = RandomN(0,3);
  int m1 = RandomN(0,1);
  switch (CurrentTest())
  {
      case 2: 
      m = 0; m1 = 1;        break;
	  case 5:
      m = 0; m1 = 0;        break;
      case 6: 
      m = 1;     break;
  }
//  m = 0; m1 = 0;
  do
  {
  int n1 = RandomN(10,14);
  if (m == 0)
	  n1 = RandomN(3,6);
  MakeVSDist(n1);
  vs1 = vs;
  int n2 = RandomN(10,14);
  if (m == 0)
	  n2 = RandomN(3,6);
  MakeVSDist(n2);
  vs2 = vs;
  mnvs.clear();
  vsp.clear();
  //2021.12> ����������� ������! 
  auto vs10 = vs1;
  auto vs20 = vs2;
  sort(vs10.begin(), vs10.end(), less<string>());
  sort(vs20.begin(), vs20.end(), greater<string>());
  //2021.12< ����������� ������! 

  for (int i = 0; i < n2; ++i)
	      mnvs[vs20[i].size()].push_back(vs20[i]); //2021.12
  for (int i = 0; i < n1; ++i)
  {
	  auto it = mnvs.find(vs10[i].size()); //2021.12
	  if (it != mnvs.end())
		  for (int j = 0; j < (int)it->second.size(); ++j)
			  vsp.push_back(make_pair(vs10[i], it->second[j])); //2021.12
  }
  }
  while (vsp.size() > 99 || (m + m1 == 0 && vsp.size() > 0));
  steptotal = max_(calc_step(vs1),calc_step(vs2));
  vs = vs1;
  DataVS("V_1", 1);
  vs = vs2;
  DataVS("V_2", ylast+1);
  ResultVSP("V", 1);
  steptotal = 0;
  SetTestCount(7);
}

void Stl32()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2, ���������� ������� �������� ���������� �����,\n"
  "��������� ���������� �������, ������ ��� ����� � ������ ������� ��������.\n"
  "�������� ������ {V}, ���������� ���������� ������������ �������� {V}_1 � {V}_2\n"
  "(��. \\3), � ������ ���� �������� ������ ����� ����������\n"
  "� �����, ������� ������������ ������ �����. ������� ���������� ���\n"
  "������������ ���������� �������� ������ ��������� ���, � ��� ������ ������\n"
  "���������~\\= �������� ������ ���������, �������� ������� �� ����������\n"
  "� ������� {V}_2. ��� ���������� ������� {V} ��������� ����������� ���������\n"
  "������� {V}_2 �� �����~\\= ��������� ����� �����, ��������� �������\n"
  "����������� �� ��������������� ������������������ {M}, ���������\n"
  "� ������ \\10, ����� ���� � ����� �� ��������������� ���������\n"
  "������� {V}_1 ������������ ��������� ���������� �����������, ���������\n"
  "��� ������� �������� ������� {V}_1 ��������������� ��� ��������\n"
  "����������� {M}. ������� ������ ����������� ������� {V} � ��� ��� ��������."
  );
  int m = RandomN(0,3);
  int m1 = RandomN(0,1);
  switch (CurrentTest())
  {
      case 6: 
      m = 0; m1 = 1;        break;
	  case 3:
      m = 0; m1 = 0;        break;
      case 4: 
      m = 1;     break;
  }
//  m = 0; m1 = 0;
  do
  {
  int n1 = RandomN(10,14);
  if (m == 0)
	  n1 = RandomN(3,6);
  MakeVSDist(n1);
  vs1 = vs;
  int n2 = RandomN(10,14);
  if (m == 0)
	  n2 = RandomN(3,6);
  MakeVSDist(n2);
  vs2 = vs;
  mnvs.clear();
  vsp.clear();
  for (int i = 0; i < n2; ++i)
	      mnvs[(int)vs2[i][vs2[i].size()-1]].push_back(vs2[i]);
  vs3 = vs1;
  sort(vs3.begin(), vs3.end());
  for (int i = 0; i < n1; ++i)
  {
	  auto it = mnvs.find((int)vs3[i][0]);
	  if (it != mnvs.end())
		  for (int j = (int)it->second.size() - 1; j >= 0; --j)
			  vsp.push_back(make_pair(vs3[i], it->second[j]));
  }
  }
  while (vsp.size() > 99  || (m + m1 == 0 && vsp.size() > 0));
  steptotal = max_(calc_step(vs1),calc_step(vs2));
  vs = vs1;
  DataVS("V_1", 1);
  vs = vs2;
  DataVS("V_2", ylast+1);
  ResultVSP("V", 1);
  steptotal = 0;
  SetTestCount(7);
}

void Stl33()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2; ��� �������� � ������ ������� �������� � ��������\n"
  "�������������� �������. �������� ������ {V} ��� ���� pair<int,~vector<int>>,\n"
  "� ������� ������ ������� ���� ����������� ������� {V}_1, � ������\n"
  "������������ ����� ����� ��� ��������� ������� {V}_2, ������� ������������\n"
  "��� �� ������, ��� � ������ ������� ���� (���� ���������� ��������\n"
  "� ������� {V}_2 �����������, �� ������ ������� ���� ������ ���������\n"
  "������������ �������, ������~0). ���������� ����� ��� ����������\n"
  "\\I����� ������� ������������\\i �������� {V}_1 � {V}_2 �� �����, �������������\n"
  "���������� ������� �������� �����. ������� ���������� ��� ������������\n"
  "�������� �������� ��������� ������� {V}_1; ������� �����, �������� �� ������\n"
  "�������� ���, ������������ �������� �������� ��������� ������� {V}_2.\n"
  "��� ���������� ������� {V} ��������� ����������� ��������� ������� {V}_2\n"
  "�� �����~\\= ��������� �����, ��������� ������� �����������\n"
  "�� ��������������� ������������ {M}, ��������� � ������ \\14,\n"
  "����� ���� � ����� �� ��������� ������� {V}_1 ������������ ��������� �������\n"
  "�����������, ��������� ��� ������� �������� ������� {V}_1 ��������������� ���\n"
  "�������� ����������� {M}. ������� ���������� ������ {V}, �������� �����\n"
  "������� �������� ���� ��� �����, �������� �� ������ ������� ������ ����."
  );
  do
  {
  int n1 = RandomN(10,17);
  MakeVNDist(n1, 1, 99);
  vn1 = vn;
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
      case 3: case 6:
      m = 0;         break;
      case 5: 
      m = 1;     break;
  }
  int n2 = RandomN(10,34);
  if (m == 0)
	  n2 = RandomN(5, 8);

  MakeVNDist(n2, 1, 99);
  vn2 = vn;
  mnv.clear();
  vnpv.clear();
  vector<int> vzero(1,0);
  for (int i = 0; i < n2; ++i)
	      mnv[abs(vn2[i])%10].push_back(vn2[i]);
  for (int i = 0; i < n1; ++i)
  {
	  auto it = mnv.find(abs(vn1[i])%10);
	  if (it != mnv.end())
			  vnpv.push_back(make_pair(vn1[i], it->second));
	  else
			  vnpv.push_back(make_pair(vn1[i], vzero));
  }
  }
  while (vnpv.size() > 99);
  vn = vn1;
  DataVN("V_1", 2);
  vn = vn2;
  DataVN("V_2", 3);
  ResultVNPV("V", 1);
  SetTestCount(7);
}

void Stl34()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2, ���������� ������� �������� ���������� �����,\n"
  "��������� ���������� �������, ������ ��� ����� � ������ ������� ��������.\n"
  "�������� ����� ������� ����������� �������� {V}_1 � {V}_2 (��. \\1)\n"
  "�� �����~\\= ����� �����: ������� �������� ������� {V}_1 ������ ���������������\n"
  "����� ���� ��������� ������� {V}_2, ������� �� �� �����, ��� �����,\n"
  "���������� ������ ������ ������, ���� ��������� �������� � ������� {V}_2\n"
  "�����������. ����� ������� ����������� ������ ���� �����������\n"
  "� ���������� ������� ��������� �� ������� {V}_1; � ������ ������ ���������,\n"
  "��������������� �������� �� {V}_1, ������� ������ ���� �������� �����������\n"
  "�������. ����������� ����� ������� ����������� � ���� ����������� {M}\n"
  "� ������~\\= ������� � ���������~\\= ��������� ����������. ��� ����������\n"
  "��������� {M} ��������� ����������� ��������� ������� {V}_2 �� �����~\\= �����\n"
  "�����, ��������� ������� ����������� �� ��������������� ������������ {M}_0\n"
  "���� map<int,~set<string,~greater<string>>> (��. � ������� \\14),\n"
  "����� ���� � ����� �� ��������� ������� {V}_1 ������������ ��������� ����������\n"
  "�����������, ��������� ��� ������� �������� ������� {V}_1 ���������������\n"
  "��� �������� ����������� {M}_0. ������� ���������� ����������� {M}, ��������\n"
  "����� ������� ��� ����� (�.\\,�. �������� ������� {V}_1) ��� �����, ��������\n"
  "� ��������� � ���� ������ ��������� �������� (�.\\,�. ��� ��������������� ���\n"
  "�������� ������� {V}_2 ���, ��� �� ����������, ������ ������).\n"
  );
  do
  {
  int n1 = RandomN(10,14);
  MakeVSDist(n1);
  vs1 = vs;
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
      case 2: case 4:
      m = 0;         break;
      case 5: 
      m = 1;     break;
  }
  int n2 = RandomN(10,28);
  if (m == 0)
	  n2 = RandomN(5, 8);

  MakeVSDist(n2);
  vs2 = vs;
  set<string, greater<string>> szero;
  szero.insert("");
  ms1.clear();
  mss.clear();
  for (int i = 0; i < n2; ++i)
	      ms1[vs2[i].size()].insert(vs2[i]);
  for (int i = 0; i < n1; ++i)
  {
	  auto it = ms1.find(vs1[i].size());
	  if (it != ms1.end())
			  mss.insert(make_pair(vs1[i], ms1[vs1[i].size()]));
	  else
			  mss.insert(make_pair(vs1[i], szero));
  }
  }
  while (mss.size() > 99);
  steptotal = max_(calc_step(vs1),calc_step(vs2));
  vs = vs1;
  DataVS("V_1", 1);
  vs = vs2;
  DataVS("V_2", ylast+1);
  ResultMSS("M", 1);
  steptotal = 0;
  SetTestCount(7);
}

void Stl35()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2; ��� �������� � ������ ������� �������� � ��������\n"
  "�������������� �������. �������� ������ {V} ��� ���� pair<int,~int>,\n"
  "� ������� ������ ������� ���� ����������� ������� {V}_1, � ������\n"
  "������������ ����� ����� �������� ��� ��������� ������� {V}_2, �������\n"
  "������������ ��� �� ������, ��� � ������ ������� ���� (���� ����������\n"
  "�������� � ������� {V}_2 �����������, �� ������ ������� ���� ������ ����\n"
  "�����~0). ������� ���������� ��� ������ ���� �������� ������� ����������\n"
  "��������� ������� {V}_1. ��� ���������� ������� {V} ������������\n"
  "��������������� ����������� {M}, ����������� �� ������ ������� {V}_2\n"
  "� �������������� ������ ����� ����� ��������� ������� {V}_2, ��������������\n"
  "���� ������ (�� ������ ��������� ���������� ����������� {M} ��. ������\n"
  "\\12\\:\\10; ����������� ������������ ����� �������)."
  );
  do
  {
  int n1 = RandomN(10,17);
  MakeVNDist(n1, 1, 99);
  vn1 = vn;
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
      case 3: case 6:
      m = 0;         break;
      case 5: 
      m = 1;     break;
  }
  int n2 = RandomN(10,34);
  if (m == 0)
	  n2 = RandomN(5, 8);

  MakeVNDist(n2, 1, 99);
  vn2 = vn;
  mn.clear();
  vnp.clear();
  for (int i = 0; i < n2; ++i)
	      mn[abs(vn2[i])%10]+=vn2[i];
  for (int i = n1-1; i >= 0; --i)
  {
	  auto it = mn.find(abs(vn1[i])%10);
	  if (it != mn.end())
			  vnp.push_back(make_pair(vn1[i], it->second));
	  else
			  vnp.push_back(make_pair(vn1[i], 0));
  }
  }
  while (vnp.size() > 99);
  vn = vn1;
  DataVN("V_1", 2);
  vn = vn2;
  DataVN("V_2", 3);
  ResultVNP1("V", 1);
  SetTestCount(7);
}

void Stl36()
{
  CreateTask(tit2);
  TaskText(
  "���� ������� {V}_1 � {V}_2, ���������� ������� �������� ���������� �����,\n"
  "��������� ���������� �������, ������ ��� ����� � ������ ������� ��������.\n"
  "�������� ����������� {M}, � ������� ������ �������� ������� ������� {V}_1,\n"
  "� ���������~\\= ������, ���������� ������������� ���������� ������ ���������\n"
  "������� {V}_2: � ����� ���������� ��� �����, �������������� �� �� �� �����,\n"
  "��� � ����, �� ����������� ���������� ����������� �����. ������� ����\n"
  "� ������ ������ ��������������� �� ������� � ������� {V}_2. ��� ����������\n"
  "������ ��������� ����� ������� ����� ������. ���� ��������� ����� ��������\n"
  "������, �� ������ ����� ������ �������� ������. ��� ����������\n"
  "����������� {M} ������������ ��������������� ����������� {M}_0, �����������\n"
  "�� ������ ������� {V}_2 � �������������� ������ ����� ��������� ���� �����\n"
  "��������� ������� {V}_2, �������������� ���� ������ (�� ������ ���������\n"
  "���������� ����������� {M}_0 ��. ������ \\10\\:\\8;\n"
  "����������� ������������ ����� �������)."
  );
  int n1 = RandomN(10,14);
  MakeVSDist(n1);
  vs1 = vs;
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
      case 2: case 4:
      m = 0;         break;
      case 5: 
      m = 1;     break;
  }
  int n2 = RandomN(10,14);
  if (m == 0)
	  n2 = RandomN(5, 8);
  int max = 0;
  do
  {

  MakeVSDist(n2);
  vs2 = vs;
  set<string, greater<string>> szero;
  szero.insert("");
  ms.clear();
  mss1.clear();
  max = 0;
  for (int i = (int)vs.size()-1; i >= 0; --i)
  {
	  int sz = vs[i].size();
	  int d = (int)(vs[i][sz-1]);
	  if (ms.find(d) == ms.end())
		  ms[d] = "";
	  else
	      ms[d] = vs[i] + " " + ms[d];
	  if ((int)ms[d].size() > max)
		  max = ms[d].size();
  }
  }
  while (max > 50);

  for (int i = 0; i < n1; ++i)
  {
	  int sz = vs1[i].size();
	  auto it = ms.find(vs1[i][sz-1]);
	  if (it != ms.end())
			  mss1.insert(make_pair(vs1[i], it->second));
	  else
			  mss1.insert(make_pair(vs1[i], ""));
  }
  steptotal = max_(calc_step(vs1),calc_step(vs2));
  vs = vs1;
  DataVS("V_1", 1);
  vs = vs2;
  DataVS("V_2", ylast+1);
  ResultMSS1("M", 1);
  steptotal = 0;
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
    case 29:      Stl29(); break;
    case 30:      Stl30(); break;
    case 31:      Stl31(); break;
    case 32:      Stl32(); break;
    case 33:      Stl33(); break;
    case 34:      Stl34(); break;
    case 35:      Stl35(); break;
    case 36:      Stl36(); break;
  }
}

void  inittaskgroup_()
{
  if ((CurrentLanguage() & lgCPP) == 0) return;
  CreateGroup("STL5Assoc", "������������� ����������", 
    "�. �. �������, 2016, 2021", "qwq2334sd#EnTopic<Associative containers>#2663338hfgd5ttd", 36, InitTask_);

}
}

//----------------------------------------

void  inittaskgroup5()
{
    STL5::inittaskgroup_();
}
void  InitTask5(int num)
{
    STL5::InitTask_(num);
}

//-------------------------------------
