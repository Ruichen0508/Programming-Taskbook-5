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

const char* tit1 = "Множества. Теоретико-множественные алгоритмы";
const char* tit2 = "Отображения. Группировка и объединение данных";

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
  "Дан вектор {V} с четным количеством элементов. Если все значения,\n"
  "содержащиеся во второй половине вектора, входят хотя бы один раз\n"
  "в его первую половину, то вывести true, иначе вывести false.\n"
  "Использовать алгоритм includes, применив его к двум \\Iмножествам\\i\n"
  "(контейнерам типа set), созданным на основе вектора {V}."
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
  "Дан вектор {V}_0, целое число {N} (>\\,0) и набор векторов {V}_1,~\\., {V}_{N}. Известно,\n"
  "что размер вектора {V}_0 не превосходит размера любого из векторов {V}_1,~\\., {V}_{N}.\n"
  "Найти количество векторов {V}_{I}, {I}~=~1,~\\., {N}, в которых содержатся\n"
  "все элементы вектора {V}_0 (без учета их повторений). Использовать\n"
  "алгоритм includes, применяя его в цикле к двум множествам, одно из которых\n"
  "создано на основе вектора {V}_0, а другое на очередной итерации содержит\n"
  "элементы очередного из векторов {V}_{I}, {I}~=~1,~\\.,~{N}."
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
  "Дан вектор {V}_0, целое число {N} (>\\,0) и набор векторов {V}_1,~\\., {V}_{N}. Известно,\n"
  "что размер вектора {V}_0 не превосходит размера любого из векторов {V}_1,~\\., {V}_{N}.\n"
  "Найти количество векторов {V}_{I}, {I}~=~1,~\\., {N}, в которых содержатся\n"
  "все элементы вектора {V}_0 (с учетом их повторений). Использовать\n"
  "алгоритм includes, применяя его в цикле к двум \\Iмультимножествам\\i\n"
  "(контейнерам типа multiset), одно из которых создано на основе вектора {V}_0,\n"
  "а другое на очередной итерации содержит элементы\n"
  "очередного из векторов {V}_{I}, {I}~=~1,~\\.,~{N}."
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
  "Дана строка {name} и вектор {V} с четным количеством элементов.\n"
  "Найти все различные числа, которые одновременно входят и в первую,\n"
  "и во вторую половину исходного вектора, и записать их в текстовый файл\n"
  "с именем {name} в возрастающем порядке, добавляя после каждого числа\n"
  "символ пробела. Использовать алгоритм set\\_intersection для двух\n"
  "вспомогательных множеств и итератора ostream\\_iterator."
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
  "Дана строка {name} и вектор {V} с четным количеством элементов.\n"
  "Найти все различные числа, которые входят во вторую половину исходного\n"
  "вектора и при этом отсутствуют в первой половине. Записать найденные\n"
  "числа в текстовый файл с именем {name} в убывающем порядке, выводя каждое\n"
  "число на новой строке. Использовать алгоритм set\\_difference для двух\n"
  "вспомогательных множеств и итератора ostream\\_iterator. Чтобы обеспечить\n"
  "вывод чисел в нужном порядке, при создании множеств и в алгоритме\n"
  "использовать функциональный объект greater."
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
  ResultFileVN1(name.c_str(), 3, 3, "\n");  //2021.12 исправил ошибку (было " ")
  SetTestCount(7);
}

void Stl6()
{
  CreateTask(tit1);
  TaskText(
  "Даны векторы {V}_1 и {V}_2. Найти все числа (с учетом повторений), которые\n"
  "входят хотя бы в один из исходных векторов, и вывести их в порядке\n"
  "возрастания; при этом если, например, некоторое число входит в один\n"
  "из векторов 3 раза, а в другой 5 раз, то его надо вывести 5 раз.\n"
  "Использовать алгоритм set\\_union для двух вспомогательных мультимножеств\n"
  "и итератора ptout\\_iterator."
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
  "Даны векторы {V}_1 и {V}_2 с различным количеством элементов. Найти все числа\n"
  "(с учетом повторений), которые входят в один из исходных векторов\n"
  "и отсутствуют в другом, и вывести их в порядке убывания; при этом если,\n"
  "например, некоторое число входит в один из векторов 3 раза,\n"
  "а в другой 5 раз, то его надо вывести 2 раза. Использовать алгоритм\n"
  "set\\_symmetric\\_difference для двух вспомогательных мультимножеств\n"
  "и итератора ptout\\_iterator. Чтобы обеспечить вывод чисел в нужном\n"
  "порядке, при создании множеств и в алгоритме использовать\n"
  "функциональный объект greater."
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
  "Дан вектор {V}, содержащий не менее трех различных чисел.\n"
  "Вывести все его различные элементы, кроме максимального и минимального,\n"
  "в порядке убывания. Использовать вспомогательное множество и алгоритм copy\n"
  "с обратными итераторами, указывающими на предпоследний и первый элементы\n"
  "множества, и с итератором ptout\\_iterator."
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
  "Решить задачу \\1, не используя вспомогательное множество.\n"
  "Вместо него последовательно использовать для исходного вектора\n"
  "алгоритмы sort, unique и copy."
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
  "Дан вектор {V}, содержащий не менее трех различных чисел.\n"
  "Вывести все его элементы (с учетом повторений), кроме минимального\n"
  "и максимального, в порядке возрастания. Использовать вспомогательное\n"
  "мультимножество, его функции-члены lower\\_bound и upper\\_bound\n"
  "и алгоритм copy с итератором ptout\\_iterator."
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
  "Решить задачу \\1, не используя вспомогательное мультимножество.\n"
  "Вместо него последовательно использовать для исходного вектора\n"
  "алгоритмы sort, lower\\_bound, upper\\_bound и copy."
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
  "Дан вектор {V}. Определить количество повторений каждого числа\n"
  "в векторе {V} и вывести все различные элементы вектора {V} вместе\n"
  "с количеством их повторений (в порядке возрастания значений элементов);\n"
  "количество повторений выводить сразу после значения соответствующего\n"
  "элемента. Использовать вспомогательное мультимножество и цикл,\n"
  "в котором вызывается функция-член upper\\_bound для мультимножества\n"
  "и функция distance для его итераторов."  // исправил опечатку (difference) //2022.10
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
  "Решить задачу \\1, не используя вспомогательное мультимножество\n"
  "и функцию distance. Вместо это использовать для исходного вектора\n" // исправил опечатку (difference) //2022.10
  "алгоритм sort и в цикле алгоритм upper\\_bound\n"
  "и операцию разности для итераторов вектора."
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
  "Решить задачу \\2, не используя функцию upper\\_bound и цикл.\n"
  "Вместо этого использовать вспомогательное мультимножество {M}\n"
  "и вспомогательное множество {S} (создав их на основе исходного вектора)\n"
  "и алгоритм for\\_each для множества {S} с параметром \\= функциональным\n"
  "объектом, в котором использовать функцию-член count мультимножества {M}."
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
  "Дан вектор {V}. Определить количество повторений каждого числа\n"
  "в векторе {V} и вывести все различные элементы вектора {V} вместе\n"
  "с количеством их повторений (в порядке возрастания значений элементов);\n"
  "количество повторений выводить сразу после значения соответствующего\n"
  "элемента. Использовать вспомогательное \\Iотображение\\i {M} (класс map), ключами\n"
  "которого являются различные элементы вектора {V}, а значениями~\\= количество\n"
  "повторений этих элементов. При заполнении отображения {M} не использовать\n"
  "условные конструкции (достаточно операций индексирования [] и инкремента).\n"
  "Элементы вектора {V} (при заполнении отображения {M}) и элементы\n"
  "отображения {M} (при выводе полученных результатов) перебирать\n"
  "в цикле с параметром-итератором соответствующего контейнера."
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
  "Решить задачу \\1, используя для перебора элементов вектора {V}\n"
  "и отображения {M} вызовы алгоритма for\\_each или, если компилятор\n"
  "поддерживает стандарт C++11, циклы for по элементам контейнера.\n"
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
  "Дан вектор {V}, элементами которого являются английские слова, набранные\n"
  "заглавными буквами. Определить суммарную длину слов, начинающихся с одной\n"
  "и той же буквы, и вывести все различные буквы, с которых начинаются\n"
  "элементы вектора {V}, вместе с суммарной длиной этих элементов (в алфавитном\n"
  "порядке букв); длину выводить сразу после соответствующей буквы.\n"
  "Использовать вспомогательное отображение {M}, ключами которого являются\n"
  "начальные буквы элементов вектора {V}, а значениями~\\= суммарная\n"
  "длина этих элементов. При заполнении отображения {M} не использовать\n"
  "условные конструкции (достаточно операций индексирования [], инкремента\n"
  "и функции-члена size для строк). Элементы вектора {V} (при заполнении\n"
  "отображения {M}) и элементы отображения {M} (при выводе полученных\n"
  "результатов) перебирать в цикле с параметром-итератором\n"
  "соответствующего контейнера."
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
  "Решить задачу \\1, используя для перебора элементов вектора {V}\n"
  "и отображения {M} вызовы алгоритма for\\_each или, если компилятор\n"
  "поддерживает стандарт C++11, циклы for по элементам контейнера."
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
  "Дан вектор {V}. Выполнить \\Iгруппировку\\i элементов вектора {V}, используя\n"
  "в качестве ключа группировки последнюю (т.\\,е. правую) цифру элемента:\n"
  "в одну группу должны входить все элементы вектора {V}, оканчивающиеся\n"
  "на одну и ту же цифру (сгруппированные элементы должны располагаться\n"
  "в том же порядке, в котором они располагались в исходном векторе).\n"
  "Представить результат группировки в виде отображения {M}, ключами которого\n"
  "являются ключи группировки, а значениями~\\= векторы, содержащие\n"
  "сгруппированные элементы (таким образом, отображение {M} должно иметь\n"
  "тип map<int,~vector<int>>). Вывести полученное отображение (для каждого\n"
  "элемента отображения {M} вначале выводить ключ, а затем элементы связанного\n"
  "с ним вектора). Для перебора элементов контейнеров\n"
  "использовать циклы с параметрами-итераторами."
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
  "Дан вектор {V}, элементами которого являются английские слова, набранные\n"
  "заглавными буквами. Выполнить группировку элементов вектора {V}, используя\n"
  "в качестве ключа группировки первую букву элемента: в одну группу должны\n"
  "входить все элементы вектора {V}, начинающиеся с одной и той же буквы\n"
  "(сгруппированные элементы должны располагаться в алфавитном порядке\n"
  "с учетом повторений). Представить результат группировки в виде\n"
  "отображения {M}, ключами которого являются ключи группировки, а значениями~\\=\n"
  "мультимножества, содержащие сгруппированные элементы (таким образом,\n"
  "отображение {M} должно иметь тип map<char,~multiset<string>>). Вывести\n"
  "полученное отображение (для каждого элемента отображения {M} вначале\n"
  "выводить ключ, а затем элементы связанного с ним мультимножества).\n"
  "Для перебора элементов контейнеров использовать алгоритм for\\_each или,\n"
  "если компилятор поддерживает стандарт C++11, цикл for по элементам контейнера."
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
  "Дан вектор {V}. Выполнить группировку элементов вектора {V}, используя\n"
  "в качестве ключа группировки последнюю (т.\\,е. правую) цифру элемента:\n"
  "в одну группу должны входить все элементы вектора {V}, оканчивающиеся\n"
  "на одну и ту же цифру (сгруппированные элементы должны располагаться\n"
  "в том же порядке, в котором они располагались в исходном векторе).\n"
  "Представить результат группировки в виде \\Iмультиотображения\\i {M} (класса\n"
  "multimap), ключами которого являются ключи группировки, т.\\,е. последние\n"
  "цифры элементов вектора {V}, а значениями~\\= элементы вектора, оканчивающиеся\n"
  "на соответствующую цифру (таким образом, отображение {M} должно иметь тип\n"
  "multimap<int,~int>). Вывести полученное отображение (для каждого элемента\n"
  "отображения {M} вначале выводить ключ, а затем связанный с ним элемент\n"
  "вектора {V}; ключи могут повторяться). Для перебора элементов\n"
  "контейнеров использовать циклы с параметрами-итераторами."
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
  "Дан вектор {V}, элементами которого являются английские слова, набранные\n"
  "заглавными буквами. Выполнить группировку элементов вектора {V}, используя\n"
  "в качестве ключа группировки последнюю букву элемента: в одну группу\n"
  "должны входить все элементы вектора {V}, оканчивающиеся одной и той же\n"
  "буквой (сгруппированные элементы должны располагаться в порядке, обратном\n"
  "порядку их расположения в исходном векторе). Представить результат\n"
  "группировки в виде мультиотображения {M}, ключами которого являются ключи\n"
  "группировки, т.\\,е. последние буквы элементов вектора {V}, а значениями~\\=\n"
  "элементы вектора, оканчивающиеся на соответствующую букву (таким образом,\n"
  "отображение {M} должно иметь тип multimap<char,~string>). Вывести полученное\n"
  "отображение (для каждого элемента отображения {M} вначале выводить ключ,\n"
  "а затем связанный с ним элемент вектора {V}; ключи могут повторяться).\n"
  "Для перебора элементов контейнеров использовать алгоритм for\\_each или,\n" 
  "если компилятор поддерживает стандарт C++11, цикл for по элементам контейнера.\n"
  "\\P\\SУказание.\\s Для размещения элементов в группе в порядке, обратном\n"
  "исходному порядку их расположения в векторе, достаточно при формировании\n"
  "мультиотображения {M} перебирать элементы вектора {V} в обратном порядке\n"
  "(используя обратные итераторы). Требуемый результат можно получить\n"
  "и при прямом переборе элементов вектора, если использовать вариант\n"
  "функции-члена \\MM.insert\\m с первым параметром-итератором (\\<подсказкой\\>),\n"
  "в качестве которого указывать возвращаемое значение функции-члена\n"
  "\\MM.lower\\_bound\\m для соответствующего ключа."
  );
  int n1 = RandomN(12,40);
  MakeVS(n1);
  mnvs.clear();
  for (int i = 0; i < (int)vs.size(); ++i)
	  mnvs[(int)(vs[i][vs[i].size()-1])].push_back(vs[i]);  //2021.12 исправил опечатку (было 0, а надо vs[i].size()-1)
  DataVS("V", 1);
  ResultMNIntVector2("", 1);
  SetTestCount(7);
}

void Stl23()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V}. В каждой группе его элементов, оканчивающихся на одну\n"
  "и ту же цифру, найти сумму значений этих элементов, за исключением\n"
  "начального элемента группы (предполагается, что элементы группы\n"
  "располагаются в том же порядке, что и в исходном векторе). Если группа\n"
  "состоит из единственного элемента, то сумма должна равняться~0. Для каждой\n"
  "группы вывести соответствующую ей цифру и найденную сумму, упорядочивая\n"
  "выводимые пары по возрастанию цифр. Использовать вспомогательное\n"
  "отображение {M} и вариант группировки, описанный в задаче \\4.\n"
  "Для нахождения сумм использовать алгоритм accumulate."
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
  "Решить задачу \\1, используя вспомогательное мультиотображение {M}\n"
  "и вариант группировки, описанный в задаче \\3.\n"
  "Для нахождения сумм использовать алгоритм accumulate."
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
  "Решить задачу \\2, не прибегая к этапу предварительной\n"
  "группировки. Использовать отображение {M} с ключом~\\= последней цифрой числа\n"
  "и значением~\\= суммой требуемых чисел (ср. с задачей \\10).\n"
  "При формировании отображения {M} использовать, наряду\n"
  "с операциями индексирования и инкремента, функцию-член find."
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
  "Дан вектор {V}, элементами которого являются английские слова, набранные\n"
  "заглавными буквами. В каждой группе его элементов, оканчивающихся\n"
  "на одну и ту же букву, получить строку, являющуюся суммой всех слов\n"
  "из этой группы, кроме последнего слова (предполагается, что элементы\n"
  "группы располагаются в том же порядке, что и в исходном векторе).\n"
  "При построении строки добавлять после каждого слова пробел. Если группа\n"
  "состоит из единственного элемента, то строка должна остаться пустой.\n"
  "Для каждой группы вывести соответствующую ей букву и найденную строку,\n"
  "упорядочивая выводимые пары в алфавитном порядке букв. Использовать\n"
  "вспомогательное отображение {M} и вариант группировки, описанный в задаче\n"
  "\\6. Для нахождения сумм использовать алгоритм accumulate."
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
  "Решить задачу \\1, используя вспомогательное мультиотображение {M}\n"
  "и вариант группировки, описанный в задаче \\5. Для нахождения\n"
  "сумм использовать алгоритм accumulate."
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
  "Решить задачу \\2, не прибегая к этапу предварительной\n"
  "группировки. Использовать отображение {M} с ключом~\\= последней буквой\n"
  "слова и значением~\\= суммой требуемых слов (ср. с задачей \\11).\n"
  "При формировании отображения {M} организовать перебор исходного вектора {V}\n"
  "с конца и использовать, наряду с операциями\n"
  "индексирования и инкремента, функцию-член find."
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
  "Даны векторы {V}_1 и {V}_2; все элементы в каждом векторе различны. Получить\n"
  "вектор {V}, содержащий пары чисел (типа pair<int,~int>), удовлетворяющие\n"
  "следующим условиям: первый элемент пары принадлежит вектору {V}_1, второй\n"
  "принадлежит вектору {V}_2, и оба элемента оканчиваются одной и той же цифрой.\n"
  "Полученный набор пар называется \\Iвнутренним объединением\\i векторов {V}_1 и {V}_2\n"
  "по ключу, определяемому последними цифрами исходных чисел. Порядок\n"
  "следования пар определяется исходным порядком элементов вектора {V}_1,\n"
  "а для равных первых элементов~\\= исходным порядком элементов вектора {V}_2.\n"
  "Для построения вектора {V} выполнить группировку элементов вектора {V}_2\n"
  "по ключу~\\= последней цифре, используя вариант группировки\n"
  "со вспомогательным отображением {M}, описанный в задаче \\10,\n"
  "после чего в цикле по элементам вектора {V}_1 сформировать требуемое\n"
  "внутреннее объединение, перебирая для каждого элемента вектора {V}_1\n"
  "соответствующие ему элементы отображения {M}. Вывести размер\n"
  "полученного вектора {V} и все его элементы."
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
  "Решить задачу \\1, выполняя группировку элементов вектора {V}_2\n"
  "способом, описанным в задаче \\9 (с использованием\n"
  "вспомогательного мультиотображения {M}). Для поиска в мультиотображении {M}\n"
  "элементов с требуемым ключом использовать функцию-член equal\\_range."
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
  "Даны векторы {V}_1 и {V}_2, элементами которых являются английские слова,\n"
  "набранные заглавными буквами, причем все слова в каждом векторе различны.\n"
  "Получить вектор {V}, являющийся внутренним объединением векторов {V}_1 и {V}_2\n"
  "(см. \\2), каждая пара которого содержит слова одинаковой\n"
  "длины. Порядок следования пар определяется алфавитным порядком первых\n"
  "элементов пар, а для равных первых элементов~\\= порядком вторых элементов,\n"
  "обратным алфавитному. Для построения вектора {V} выполнить группировку\n"
  "элементов вектора {V}_2 по ключу~\\= длине слова, используя вариант\n"
  "группировки со вспомогательным отображением {M} типа map<int,~set<string>>\n"
  "(ср. с задачей \\11), после чего в цикле по отсортированным\n"
  "элементам вектора {V}_1 сформировать требуемое внутреннее объединение,\n"
  "перебирая для каждого элемента вектора {V}_1 соответствующие ему элементы\n"
  "отображения {M}. Вывести размер полученного вектора {V} и все его элементы."
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
  //2021.12> Исправление ошибки! 
  auto vs10 = vs1;
  auto vs20 = vs2;
  sort(vs10.begin(), vs10.end(), less<string>());
  sort(vs20.begin(), vs20.end(), greater<string>());
  //2021.12< Исправление ошибки! 

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
  "Даны векторы {V}_1 и {V}_2, элементами которых являются английские слова,\n"
  "набранные заглавными буквами, причем все слова в каждом векторе различны.\n"
  "Получить вектор {V}, являющийся внутренним объединением векторов {V}_1 и {V}_2\n"
  "(см. \\3), в каждой паре которого первое слово начинается\n"
  "с буквы, которой оканчивается второе слово. Порядок следования пар\n"
  "определяется алфавитным порядком первых элементов пар, а для равных первых\n"
  "элементов~\\= порядком вторых элементов, обратным порядку их следования\n"
  "в векторе {V}_2. Для построения вектора {V} выполнить группировку элементов\n"
  "вектора {V}_2 по ключу~\\= последней букве слова, используя вариант\n"
  "группировки со вспомогательным мультиотображением {M}, описанный\n"
  "в задаче \\10, после чего в цикле по отсортированным элементам\n"
  "вектора {V}_1 сформировать требуемое внутреннее объединение, перебирая\n"
  "для каждого элемента вектора {V}_1 соответствующие ему элементы\n"
  "отображения {M}. Вывести размер полученного вектора {V} и все его элементы."
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
  "Даны векторы {V}_1 и {V}_2; все элементы в каждом векторе различны и являются\n"
  "положительными числами. Получить вектор {V} пар типа pair<int,~vector<int>>,\n"
  "в которых первый элемент пары принадлежит вектору {V}_1, а второй\n"
  "представляет собой набор тех элементов вектора {V}_2, которые оканчиваются\n"
  "той же цифрой, что и первый элемент пары (если подходящие элементы\n"
  "в векторе {V}_2 отсутствуют, то второй элемент пары должен содержать\n"
  "единственный элемент, равный~0). Полученный набор пар называется\n"
  "\\Iлевым внешним объединением\\i векторов {V}_1 и {V}_2 по ключу, определяемому\n"
  "последними цифрами исходных чисел. Порядок следования пар определяется\n"
  "исходным порядком элементов вектора {V}_1; порядок чисел, входящих во вторые\n"
  "элементы пар, определяется исходным порядком элементов вектора {V}_2.\n"
  "Для построения вектора {V} выполнить группировку элементов вектора {V}_2\n"
  "по ключу~\\= последней цифре, используя вариант группировки\n"
  "со вспомогательным отображением {M}, описанный в задаче \\14,\n"
  "после чего в цикле по элементам вектора {V}_1 сформировать требуемое внешнее\n"
  "объединение, перебирая для каждого элемента вектора {V}_1 соответствующие ему\n"
  "элементы отображения {M}. Вывести полученный вектор {V}, указывая после\n"
  "первого элемента пары все числа, входящие во второй элемент данной пары."
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
  "Даны векторы {V}_1 и {V}_2, элементами которых являются английские слова,\n"
  "набранные заглавными буквами, причем все слова в каждом векторе различны.\n"
  "Получить левое внешнее объединение векторов {V}_1 и {V}_2 (см. \\1)\n"
  "по ключу~\\= длине слова: каждому элементу вектора {V}_1 должен соответствовать\n"
  "набор всех элементов вектора {V}_2, имеющих ту же длину, или набор,\n"
  "содержащий только пустую строку, если требуемые элементы в векторе {V}_2\n"
  "отсутствуют. Левое внешнее объединение должно быть упорядочено\n"
  "в алфавитном порядке элементов из вектора {V}_1; в каждом наборе элементов,\n"
  "соответствующих элементу из {V}_1, порядок должен быть обратным алфавитному\n"
  "порядку. Реализовать левое внешнее объединение в виде отображения {M}\n"
  "с ключом~\\= строкой и значением~\\= строковым множеством. Для построения\n"
  "множества {M} выполнить группировку элементов вектора {V}_2 по ключу~\\= длине\n"
  "слова, используя вариант группировки со вспомогательным отображением {M}_0\n"
  "типа map<int,~set<string,~greater<string>>> (ср. с задачей \\14),\n"
  "после чего в цикле по элементам вектора {V}_1 сформировать требуемое внутреннее\n"
  "объединение, перебирая для каждого элемента вектора {V}_1 соответствующие\n"
  "ему элементы отображения {M}_0. Вывести полученное отображение {M}, указывая\n"
  "после каждого его ключа (т.\\,е. элемента вектора {V}_1) все слова, входящие\n"
  "в связанное с этим ключом множество значений (т.\\,е. все соответствующие ему\n"
  "элементы вектора {V}_2 или, при их отсутствии, пустую строку).\n"
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
  "Даны векторы {V}_1 и {V}_2; все элементы в каждом векторе различны и являются\n"
  "положительными числами. Получить вектор {V} пар типа pair<int,~int>,\n"
  "в которых первый элемент пары принадлежит вектору {V}_1, а второй\n"
  "представляет собой сумму значений тех элементов вектора {V}_2, которые\n"
  "оканчиваются той же цифрой, что и первый элемент пары (если подходящие\n"
  "элементы в векторе {V}_2 отсутствуют, то второй элемент пары должен быть\n"
  "равен~0). Порядок следования пар должен быть обратным порядку следования\n"
  "элементов вектора {V}_1. При построении вектора {V} использовать\n"
  "вспомогательное отображение {M}, построенное на основе вектора {V}_2\n"
  "и сопоставляющее каждой цифре сумму элементов вектора {V}_2, оканчивающихся\n"
  "этой цифрой (по поводу вариантов построения отображения {M} см. задачи\n"
  "\\12\\:\\10; допускается использовать любой вариант)."
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
  "Даны векторы {V}_1 и {V}_2, элементами которых являются английские слова,\n"
  "набранные заглавными буквами, причем все слова в каждом векторе различны.\n"
  "Получить отображение {M}, в котором ключом является элемент вектора {V}_1,\n"
  "а значением~\\= строка, полученная суммированием следующего набора элементов\n"
  "вектора {V}_2: в набор включаются все слова, оканчивающиеся на ту же букву,\n"
  "что и ключ, за исключением последнего подходящего слова. Порядок слов\n"
  "в наборе должен соответствовать их порядку в векторе {V}_2. При построении\n"
  "строки добавлять после каждого слова пробел. Если требуемый набор является\n"
  "пустым, то строка также должна остаться пустой. При построении\n"
  "отображения {M} использовать вспомогательное отображение {M}_0, построенное\n"
  "на основе вектора {V}_2 и сопоставляющее каждой букве описанную выше сумму\n"
  "элементов вектора {V}_2, оканчивающихся этой буквой (по поводу вариантов\n"
  "построения отображения {M}_0 см. задачи \\10\\:\\8;\n"
  "допускается использовать любой вариант)."
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
  CreateGroup("STL5Assoc", "Ассоциативные контейнеры", 
    "М. Э. Абрамян, 2016, 2021", "qwq2334sd#EnTopic<Associative containers>#2663338hfgd5ttd", 36, InitTask_);

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
