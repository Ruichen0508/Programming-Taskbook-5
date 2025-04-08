#include <string>
#include <fstream>
#include <iostream>
#include <sstream>
#include <vector>
#include <deque>
#include <list>
#include <algorithm>
#include <iterator>
#include <functional>
#include <numeric>
#include "pt5taskmaker.h"

namespace STL6
{

vector<int> vn, vn1, vn2, vn3;
vector<double> vr;
vector<string> vs;

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

using namespace std::placeholders;

void MakeVN(int n, int a1, int b1)
{
  vn.clear();
  vn.reserve(50);
  for (int i = 0; i < n; i++)
    vn.push_back(RandomN(a1,b1));
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

void ResultVN1(const char* comm, int y)
{
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  int n = vn.size();
  ResultN("(",n,p,y,2);
  if (comm != "")
    ResultComment("):",p+3,y);
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

void ResultVS(int y)
{
  int p = 6;
  int n = vs.size();
  int p0 = p;
  for (int i = 0; i < n; i++)
  {
      ResultS(vs[i].c_str(),p,y);
          p += 18;
          if (p > 60)
          {
                  y++;
                  p = p0;
          }
  }
}


struct less_abs: function<bool(int, int)>
{
        bool operator()(int a, int b) const
        {
                return abs(a) < abs(b);
        }
};

void Stl1()
{
  CreateTask();
  TaskText(
  "���������� \\I�������������� ������\\i (\\I������-�������\\i, \\I�������\\i)~\\=\n"
  "��������� less\\_abs � ��������� ()~\\= ����������� ��������-������, ������� ���\n"
  "������������� ��������� {a} � {b} � ������������ ��������� ��������� |{a}|~<~|{b}|.\n"
  "��������� less\\_abs ������ ���� ��������� �� ����������� ����������\n"
  "��������� \\Mfunction<bool(int,~int)>\\m. ��������� �������������� ������\n"
  "less\\_abs � �������� sort, ������������� �������� ������ {V}\n"
  "����� ����� �� ����������� �� ���������� ��������."
  );
  MakeVN(RandomN(10, 34), -99, 99);
  DataVN("V", 3);
  sort(vn.begin(), vn.end(), less_abs());
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl2()
{
  CreateTask();
  TaskText(
  "��� ������ {V} ����� �����. ��������� ����� ��������� adjacent\\_find,\n"
  "����� ��������� ���� ��������� ({a},~{b}) ������� {V}, ��� �������\n"
  "����������� ����������� |{a}|~\\g~|{b}|, � ������� ��������� ����\n"
  "��������� � ������� ����������� �� ��������. ���� ���������� ��� ���,\n"
  "�� ������� ������������ �����~0. ��� ������ ��������� ����\n"
  "������������ \\I�������������� �������\\i not2 (\\I��������\\i),\n"
  "�������� ��� � ��������������� ������� less\\_abs, ���������� � \\1."
  );
  int m = RandomN(0,4);
  switch (CurrentTest())
  {
  case 5:      
          m = 0;          break;
  case 4: 
      m = 2;      break;
  case 2: 
      m = 1;      break;
  }
  int a, b, c, d;
  int m1 = -1;
  do
  {
  MakeVN(RandomN(5, 17), -9, 9);
          if (m == 0)
          {
         sort(vn.begin(), vn.end(), less_abs());
          }

  auto i1 = adjacent_find(vn.begin(), vn.end(), not2(less_abs()));
  if (i1 == vn.end())
  {
          m1 = 0;
          a = 0;
  }
  else
  {
     auto i2 = adjacent_find(i1+1, vn.end(), not2(less_abs()));
          if (i2 == vn.end())
          {
                  m1 = 1;
                  a = *i1++;
                  b = *i1;
          }
          else
          {
                  m1 = 2;
                  a = *i1++;
                  b = *i1;
                  c = *i2++;
                  d = *i2;
          }
  }
  }
  while (m == 0 && m1 != 0 || m == 1 && m1 != 1 || 
          m == 2 && (m1 != 2 || m1 == 2 && abs(a) != abs(b) && abs(c) != abs(d))
          || m > 2 && m1 != 2);
  DataVN("V", 3);
  if (m1 == 0)
  ResultN(0, 0, 3, 3);
  else
          if (m1 == 1)
                  ResultN2(a, b, 0, 3, 4);
          else
          {
                  ResultN2(a, b, xLeft, 3, 4);
                  ResultN2(c, d, xRight, 3, 4);
          }
  SetTestCount(7);
}

void Stl3()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {V}, ���������� ����� �����. ���������\n"
  "�������������� ������ less\\_abs, ��������� � \\2, ���������\n"
  "� �������������� ��������� bind (\\I������������\\i) � ��������� remove\\_if,\n"
  "� ����� ����� erase, ������� �� ������� {V} ��� ��������, ���������� ��������\n"
  "������� ������~{K}. ������� ������ ���������������� ������� {V} � ��� ��������.\n"
  "��� ����������� ������������� ��������� \\_1 �������� bind � ���������\n"
  "���������� �������� ��������� \\Musing namespace std::placeholders\\m,\n"
  "������ �� ����� ��������� \\M#include <functional>\\m."
  );
  int k = RandomN(1,99);
  MakeVN(RandomN(5, 17), -99, 99);
  vn1 = vn;
  auto i1 = remove_if(vn1.begin(), vn1.end(), bind(less_abs(), _1, k));
  vn1.erase(i1, vn1.end());
  DataN("K = ", k, 0, 2, 2);
  DataVN("V", 3);
  vn = vn1;
  ResultVN1("V", 3);
  SetTestCount(7);
}

void Stl4()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {V}, ���������� ����� �����. ���������\n"
  "�������������� ������ less\\_abs, ��������� � \\3, ���������\n"
  "� �������������� ��������� bind � ��������� find\\_if, ����� � �������\n"
  "��������� ������� �������, ���������� �������� �������� ������~{K}. ���� ������\n"
  "�� �������� ��������� ���������, �� �������~0."
  );
  int k, x, d;
  int m = RandomN(0,4);
  switch (CurrentTest())
  {
  case 5:      
          m = 0;          break;
  case 4: 
      m = 4;      break;
  case 2: 
      m = 3;      break;
  }
  do
  {
  k = RandomN(1,99);
  MakeVN(RandomN(5, 17), -99, 99);
//  auto i1 = find_if(vn.rbegin(), vn.rend(), bind(less_abs(), k, _1));
  auto i1 = find_if(vn.rbegin(), vn.rend(), bind1st(less_abs(), k));
  x = 0;
  if (i1 != vn.rend())
          x = *i1;
  d = vn.end()-i1.base();
  }
  while (m == 0 && x != 0 || m > 0 && (x == 0 || d < m));
  DataN("K = ", k, 0, 2, 2);
  DataVN("V", 3);
  ResultN(x, 0, 3, 3);
  SetTestCount(7);
}

void Stl5()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} (>\\,0) � ������ {V}, ���������� ����� �����. ���������\n"
  "�������������� ������ less\\_abs, ��������� � ������ \\4, � ��������\n"
  "��������������� ����������� �������� not2 � ����������� bind, ���������\n"
  "������� �������� ��� �������� ������� {K}~\\g~|{x}| � ������������ ��� � ��������\n"
  "���������� ��������� ��������� count\\_if ��� ���������� ���������� ���������\n"
  "�������, ���������� �������� ������� ������ ��� �����~{K}."
  );
  int k, x;
/*  int m = RandomN(0,4);
  switch (CurrentTest())
  {
  case 5:      
          m = 0;          break;
  case 4: 
      m = 4;      break;
  case 2: 
      m = 3;      break;
  }
*/
  k = RandomN(1,9);
  MakeVN(RandomN(5, 17), -9, 9);
  x = count_if(vn.begin(), vn.end(), bind(not2(less_abs()), k, _1));
//  x = count_if(vn.begin(), vn.end(), not1(bind(less_abs(), k, _1))); //�� ��������
//  x = count_if(vn.begin(), vn.end(), not1(bind1st(less_abs(), k)));
  DataN("K = ", k, 0, 2, 2);
  DataVN("V", 3);
  ResultN(x, 0, 3, 3);
  SetTestCount(7);
}

void Stl6()
{
  CreateTask();
  TaskText(
  "���� ������� {V}_1 � {V}_2 � ���������� ����������� ���������~\\= ����� �����.\n"
  "��������� �������� transform � ����������� �������������� ������ multiplies,\n"
  "������������� ������ {V}_2, ������� ��� ��������\n"
  "�� ��������������� �������� ������� {V}_1."
  );
  int n = RandomN(5, 17);
  MakeVN(n, -9, 9);
  DataVN("V_1", 3);
  vn1 = vn;
  MakeVN(n, -9, 9);
  DataVN("V_2", 4);
  transform(vn1.begin(), vn1.end(), vn.begin(), vn.begin(), multiplies<int>());
  ResultVN("V_2", 3);
  SetTestCount(7);
}

void Stl7()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} � ������ {V}, ���������� ����� �����. ���������\n"
  "�������� transform � ����������� ������-������� minus\n"
  "�� ������������ bind, ������������� �������� ������, �������� ��������\n"
  "���� ��� ��������� �� ��������~{K}."
  );
  int k = RandomN(-9,9);
  int n = RandomN(5, 17);
  MakeVN(n, -90, 90);
  DataN("K = ", k, 0, 2, 1);
  DataVN("V", 3);
//  transform(vn.begin(), vn.end(), vn.begin(), bind(minus<int>(),_1, k));
  transform(vn.begin(), vn.end(), vn.begin(), bind2nd(minus<int>(), k));
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl8()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} � ��� ������� {V}_1 � {V}_2 ����������� �������, ����������\n"
  "����� �����. ��������� �������� transform � ����������� �������������� �������\n"
  "plus � multiplies � ���������� ������������� bind, ������������� ������ {V_1},\n"
  "������� ������ ��� ������� �� �����~{K} � �������� � ����������\n"
  "�������� ���������������� �������� �������~{V}_2.\n"
  );
  int a = RandomN(-9,9);
  DataN("K = ", a, 0, 2, 1);
  int n = RandomN(5, 17);
  MakeVN(n, -9, 9);
  DataVN("V_1", 3);
  vn1 = vn;
  MakeVN(n, -9, 9);
  DataVN("V_2", 4);
  transform(vn1.begin(), vn1.end(), vn.begin(), vn.begin(), 
      bind(plus<int>(), bind(multiplies<int>(), a, _1), _2));
  ResultVN("V_1", 3);


/*
  MakeVN(n, -9, 9);
  DataN("A = ", a, xLeft, 2, 2);
  DataN("B = ", b, xRight, 2, 2);
  DataVN("V", 3);
  transform(vn.begin(), vn.end(), vn.begin(), bind(plus<int>(), bind(multiplies<int>(), _1, a), b));
  ResultVN("V", 3);
*/
  SetTestCount(7);
}

struct point
{
        int x;
        int y;
        string s;
        point(int x0, int y0, string s0):x(x0),y(y0),s(s0)
        {}
        bool operator<(const point& b) const
        {
                return this->x < b.x || this->x == b.x && this->y < b.y;
        }

    operator string()
    {
        ostringstream os;
        os << x << " " << y << " " << s;
        return os.str();
    }

    bool is_positive()
    {
        return x > 0 && y > 0;
    }

    point mult(int k)
    {
        return point(k*x, k*y, s);
    }
};

istream& operator>>(istream& is, point& p)
{
        return is >> p.x >> p.y >> p.s;
}

ostream& operator<<(ostream& os, const point& p)
{
        return os << p.x << " " << p.y << " " << p.s << endl;
}

void Stl9()
{
  CreateTask();
  TaskText(
  "���������� ��������� point � �������������� ������� {x}, {y} � ��������� ������~{s}.\n"
  "��������������, ��� ��������� ���� {s} �� �������� ��������.\n"
  "��������� ������� ��� ������ ��������� ������������ ��������� �������: {A}~<~{B},\n"
  "���� {A}.{x}~<~{B}.{x} ��� ({A}.{x}~==~{B}.{x} � {A}.{y}~<~{B}.{y}). ����������� ��� ��������� �������\n"
  "� ���� ����������� �������-����� \\Mbool operator<(const point\\& b) const\\m.\n"
  "����� ����, ����������� �������� \\Mistream\\& operator>>(istream\\& is, point\\& p)\\m,\n"
  "������� ��������������� ��������� �� �������� ������ {is} ����� {x}, {y} � {s}\n"
  "��������� {p}, � �������� \\Mostream\\& operator<<(ostream\\& os, const point\\& p)\\m,\n"
  "������� ���������� ��� ����� ��������� {p} � �������� ����� {os}\n"
  "(����� ������������ � ��� �� �������, � ������� �����������; ����� ����\n"
  "����������� ������). ��� ��������� ���� � ������ {name}, ���������� ���������\n"
  "������������� ��������� ��������� ���� ���������. ��������� �������� ������\n"
  "istream\\_iterator, ��������� ����� ������� ������ {V} � ���������� ���� point.\n"
  "��������� �������� stable\\_sort, ������������� ���������� ������ � ������\n"
  "��������� ��������� ������� � � ������� ��������� copy � ��������� ������\n"
  "ostream\\_iterator �������� ��������������� ������ � �������� ����, �������\n"
  "��� ������� ���������� (��� ���� ����� � ����������� ������������ �����\n"
  "������������� � ��� �� �������, ��� � � �������� �����, ���������\n"
  "�������� stable\\_sort ������������ ���������� ����������).\n"
  "������ ����� ������ ������������ �� ����� ������."
  );
  int n = RandomN(5, 20);
  vector<point> v, v1;
  for (int i=0; i < n; ++i)
          v.push_back(point(RandomN(-9,9), RandomN(-9,9), RandomStr(RandomN(4,8))));
  int k = RandomN(1,4);
  for (int i=0; i < k; ++i)
  {
          point p0 = v[RandomN(0,v.size()-1)];
          p0.s = RandomStr(RandomN(4,8));
          v.push_back(p0);
//2021.12> ������� ������ ���������� �����, ����� ���������� ��������� ������ ���������� ����������
          p0.s = RandomStr(RandomN(4,8)); 
          v[RandomN(0, v.size() - 2)] = p0;
//2021.12<
  }
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  v1 = v;
  stable_sort(v1.begin(), v1.end());
  ofstream f(name);
  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
  f.close();
//  ResultComment("���������� ���������������� �����:",0,1);
  ResultFileT(name.c_str(), 1, 5);
  f.open(name, ios::trunc);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
//  DataComment("���������� ��������� �����:",xRight,1);
  DataFileT(name.c_str(), 2, 5);
  SetTestCount(9);
}

void Stl10()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "��������� ��������� point, ������������� � \\1. ��������� ���������\n"
  "point, ������� � ��� �������� �������������� operator string(), ������������\n"
  "������ � ���������� ��������������� ������ {x}, {y}, {s}, ������������ ���������.\n"
  "����� ����, ������� ���������� �������-���� is\\_positive(), ������������\n" 
  "�������� \\t, ���� ����� {x} � {y} �������� ��������������. ��������� ��������\n" 
  "replace\\_copy\\_if ��������� � ���������� ������ \\Mistream\\_iterator<point>\\m\n" 
  "� ���������� ������ \\Mptout\\_iterator<string>\\m, �������� �� ��������\n" 
  "�� ��������� ���������� �����, ������� ����� ������������� ����� {x} � {y},\n" 
  "�� ������ point (0,~0,~\"A\"), � ������� ��������� ������������� ����\n"
  "��������� ���������������� ������. ��������������� ���������� �� ���������.\n"
  "� �������� ���������-��������� ��������� replace\\_copy\\_if ������������\n"
  "�������-���� is\\_positive, ������������ �� � �������������� ������\n"
  "� ������� ��������������� �������� mem\\_fn: \\Mmem\\_fn(\\&point::is\\_positive)\\m."
  );
  int n = RandomN(5, 20);
  vector<point> v, v1;
  int cnt;
  do
  {
      v.clear();
      cnt = 0;
      for (int i=0; i < n; ++i)
      {
          v.push_back(point(RandomN(-9,9), RandomN(-9,9), RandomStr(RandomN(4,8))));
          if (v.back().is_positive())
              cnt++;
      }
  }
  while (cnt > 3);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  v1 = v;
  point A(0, 0, "A");
  replace_if(v1.begin(), v1.end(), mem_fn(&point::is_positive), A);
  ofstream f(name);
/*
  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
  f.close();
//  ResultComment("���������� ���������������� �����:",0,1);
  ResultFileT(name.c_str(), 1, 5);
*/
  vs.clear();
  copy(v1.begin(), v1.end(), back_inserter(vs));
  ResultVS(1);
//  int i = 0;
  //for (auto it = v1.begin(); it != v1.end(); it++)
    //  ResultS(((string)*it).c_str(), 6, ++i);


//  f.open(name, ios::trunc);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
//  DataComment("���������� ��������� �����:",xRight,1);
  DataFileT(name.c_str(), 2, 5);
  SetTestCount(5);
}


void Stl11()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "��������� ��������� point, ������������� � \\2. ���������\n"
  "��������������� ������ {V} � ���������� ���� point � �������� stable\\_partition,\n"
  "���������������� �������� � �������� ������, ���������� � ������ ������\n"
  "��� ��������, ������� ������ ����� � ������������ (0,~0). ������� ���������\n"
  "������������� ���� ��������� ���������������� ������ (��.~\\1).\n"
  "� �������� ��������� \\= ��������������� ������� � ��������� stable\\_partition\n"
  "������������ ������ \\Mless<point>()\\m, �������� � ���� ����������� bind."
  );
  int n = RandomN(5, 20);
  vector<point> v, v1;
  for (int i=0; i < n; ++i)
          v.push_back(point(RandomN(-9,9), RandomN(-9,9), RandomStr(RandomN(4,8))));
  int k = RandomN(2,5);
  for (int i=0; i < k; ++i)
          v.insert(v.begin()+RandomN(0,v.size()),point(0, RandomN(-9,9), RandomStr(RandomN(4,8))));
  k = RandomN(1,2);
  for (int i=0; i < k; ++i)
          v.insert(v.begin()+RandomN(0,v.size()),point(0, 0, RandomStr(RandomN(4,8))));
//  k = count_if(v.begin(), v.end(), bind(mem_fun_ref(&point::operator<), p0, _1));
//    k = count_if(v.begin(), v.end(), bind(mem_fun_ref(&point::operator<), _1, p0));
  v1 = v;
  point A(0, 0, "A");
  stable_partition(v1.begin(), v1.end(), bind(less<point>(), _1, A));
  vs.clear();
  copy(v1.begin(), v1.end(), back_inserter(vs));
  ResultVS(1);

//  int i = 0;
//  for (auto it = v1.begin(); it != v1.end(); it++)
//      ResultS(((string)*it).c_str(), 6, ++i);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  ofstream f(name);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
  DataFileT(name.c_str(), 2, 5);
  SetTestCount(5);
}

point operator+(const point& a, const point& b)
{
        return point(a.x + b.x, a.y + b.y, a.s + b.s);
}


void Stl12()
{
  CreateTask();
  TaskText(
  "���� ��������� ����� � ������� {name1} � {name2}, ���������� ���������\n"
  "������������� ��������� ��������� point, ������������� � \\3.\n"
  "����� �������� ���������� ���������� ���������. ����������\n"
  "�������� �������� ��� �������� point, ������� ���������� ��������\n"
  "��������������� ����� (��� ��������, ��� � ���������), � ���� �������������\n"
  "������� \\Mpoint operator+(const point\\& a, const point\\& b)\\m. �������� ������\n"
  "�� ������ {name1} � {name2} � ������� {V}_1 � {V}_2 ��������������. ��������� ��������\n"
  "transform � ���������� \\Mplus<point>()\\m, ������������� �������� ������� {V}_1,\n"
  "�������� � ��� ��������������� �������� ������� {V}_2. ��������\n"
  "��������������� ������ {V}_1 � ���� {name1}, ������� ��� ������� ����������."
  );
  int n = RandomN(5, 20);
  vector<point> v1, v2, v;
  for (int i=0; i < n; ++i)
          v1.push_back(point(RandomN(-49,49), RandomN(-49,49), RandomStr(RandomN(4,8))));
  for (int i=0; i < n; ++i)
          v2.push_back(point(RandomN(-49,49), RandomN(-49,49), RandomStr(RandomN(4,8))));
  transform(v1.begin(), v1.end(), v2.begin(), back_inserter(v), plus<point>());
  string name1(RandomStr(7) + "1.tst"), name2(RandomStr(7) + "2.tst");
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  ofstream f(name1);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
  ResultComment("���������� ���������������� ����� name1:",0,1);
  ResultFileT(name1.c_str(), 2, 5);
  f.open(name1, ios::trunc);
  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
  f.close();
  DataFileT(name1.c_str(), 2, 3);
  f.open(name2, ios::trunc);
  copy(v2.begin(), v2.end(), ostream_iterator<point>(f));
  f.close();
  DataFileT(name2.c_str(), 4, 5);
  SetTestCount(3);
}

void Stl13()
{
  CreateTask();
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "��������� ��������� point, ������������� � \\4. ���������\n"
  "��������������� ������ {V} � ���������� ���� point � �������� transtorm\n"
  "� �������������� �������� plus (��. \\1) � ������������ bind,\n"
  "������������� �������� �����, �������� � ������� ��� ��������\n"
  "������ point (10,~20,~\"Z\"). ������� ��������� �������������\n"
  "���� ��������� ���������������� ������ (��.~\\2).\n"
  );
  int n = RandomN(5, 20);
  vector<point> v, v1;
  for (int i=0; i < n; ++i)
          v.push_back(point(RandomN(-99,89), RandomN(-99,79), RandomStr(RandomN(3,6))));
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  point p0(10,20,"Z");
//  transform(v.begin(), v.end(), back_inserter(v1), bind(plus<point>(), _1, p0));
  transform(v.begin(), v.end(), back_inserter(v1), bind(plus<point>(), _1, p0));
  vs.clear();
  copy(v1.begin(), v1.end(), back_inserter(vs));
  ResultVS(1);

  ofstream f(name);
//  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
//  f.close();
//  ResultComment("���������� ���������������� �����:",0,1);
//  ResultFileT(name.c_str(), 1, 5);
//  f.open(name, ios::trunc);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
//  DataComment("���������� ��������� �����:",xRight,1);
  DataFileT(name.c_str(), 2, 5);
  SetTestCount(3);
}

void Stl14()
{
  CreateTask();
  TaskText(
  "���� ����� ����� {K} � ��������� ����� � ������� {name1} � {name2}, ����������\n"
  "��������� ������������� ��������� ��������� point, �������������\n"
  "� \\4. ����� �������� ���������� ���������� ���������.\n"
  "��������� ��������� point, ������� � ��� �������-���� point mult(int k),\n"
  "����������� ��������� ������� point �� �����: ����� p.mult(k) ����������\n"
  "������ ���� point, � �������� ����� {x} � {y} ����� �������������� {k}*{p.x} � {k}*{p.y},\n"
  "� ���� {s} ��������� �� ������� {p.s}. �������� ������ �� ������ {name1} � {name2}\n"
  "� ������� {V}_1 � {V}_2. ��������� �������� transform � ����������\n"
  "�������������� ��������, ���������� ��� ����������� bind, ������ plus\n"
  "(��.~\\2) � �������-���� mult, ������������� �������� ������� {V}_1,\n"
  "������� ������ �� ��� �� ����� {K} � �������� � ���������� ���������\n"
  "��������������� ������� ������� {V}_2. ������� ��������� �������������\n"
  "���� ��������� ���������������� ������� {V}_1 (��.~\\3)."




/*
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "��������� ��������� point, ������������� � \\5. �������� ������\n"
  "�� ����� {name} � ������ {V}. ��������� �������� transform � ��������-��������\n"
  "plus<point>() (��. \\1) � ������������ bind, �������������\n"
  "�������� ������� {V}, �������� � ��� ����� � ������ (10, 20, \\<Z\\>). ��������\n"
  "��������������� ������ {V} � ���� {name}, ������� ��� ������� ����������.\n"
  "\\P\\S����������.\\s ���� ���������� �� ������������ �������� �++11,\n"
  "�� ������ ����������� bind ����� ������������ bind1st ��� bind2nd."
*/
  );
  int k = RandomN(1, 5);
  if (RandomN(1,2) == 1)
      k = -k;
  int n = RandomN(5, 20);
  vector<point> v1, v2, v;
  for (int i=0; i < n; ++i)
          v1.push_back(point(RandomN(-10,10), RandomN(-10,10), RandomStr(RandomN(2,3))));
  for (int i=0; i < n; ++i)
          v2.push_back(point(RandomN(-29,29), RandomN(-29,29), RandomStr(RandomN(2,3))));
//  transform(v1.begin(), v1.end(), v2.begin(), back_inserter(v), bind(plus<point>(), bind(mem_fn(&point::mult), _1, k), _2));
  transform(v1.begin(), v1.end(), back_inserter(v), bind2nd(mem_fun_ref(&point::mult), k));
  transform(v.begin(), v.end(), v2.begin(), v.begin(), plus<point>());
  string name1(RandomStr(7) + "1.tst"), name2(RandomStr(7) + "2.tst");
  DataN("K = ", k, 1, 1, 1);
  DataS("name1 = ", name1.c_str(), xLeft, 1);
  DataS("name2 = ", name2.c_str(), xRight, 1);
  ofstream f(name1);
//  copy(v.begin(), v.end(), ostream_iterator<point>(f));
//  f.close();
//  ResultComment("���������� ���������������� ����� name1:",0,1);
//  ResultFileT(name1.c_str(), 2, 5);
  vs.clear();
  copy(v.begin(), v.end(), back_inserter(vs));
  ResultVS(1);

//  f.open(name1, ios::trunc);
  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
  f.close();
  DataFileT(name1.c_str(), 2, 3);
  f.open(name2, ios::trunc);
  copy(v2.begin(), v2.end(), ostream_iterator<point>(f));
  f.close();
  DataFileT(name2.c_str(), 4, 5);
  SetTestCount(3);



/*
  int n = RandomN(5, 20);
  vector<point> v, v1;
  for (int i=0; i < n; ++i)
          v.push_back(point(RandomN(-99,89), RandomN(-99,79), RandomStr(RandomN(4,8))));
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  point p0(10,20,"Z");
//  transform(v.begin(), v.end(), back_inserter(v1), bind(plus<point>(), _1, p0));
  transform(v.begin(), v.end(), back_inserter(v1), bind1st(plus<point>(), p0));
  ofstream f(name);
  copy(v1.begin(), v1.end(), ostream_iterator<point>(f));
  f.close();
//  ResultComment("���������� ���������������� �����:",0,1);
  ResultFileT(name.c_str(), 1, 5);
  f.open(name, ios::trunc);
  copy(v.begin(), v.end(), ostream_iterator<point>(f));
  f.close();
//  DataComment("���������� ��������� �����:",xRight,1);
  DataFileT(name.c_str(), 2, 5);
  SetTestCount(3);
*/
}


/*
struct range
{
        int n;
        range(int n0): n(n0)
        {}
        int operator()()
        {
                return n++;
        }
};

void Stl13()
{
  CreateTask();
  TaskText(
  "���������� ��������� range � ������������� ����� {n} � ��������� (), �������\n"
  "���������� ��������� {n}++. ����� ���������� ����������� range � �����\n"
  "����������~\\= ��������� ��������� ���� {n}. ���� ����� ����� {K} � {N} ({N}~>~0).\n"
  "��������� �������� generate\\_n � ��������-�������� range � ����������\n"
  "�������, ��������� ������ {V} ������� �� {N} ���������������� ��������,\n"
  "������� �� �������� {K} (� ���������� ������ ������ ��������� ��������\n"
  "{K}, {K}\\,+\\,1, {K}\\,+\\,2, \\., {K}\\,+\\,{N}\\,\\-\\,1), � ������� �������� ����������� �������.\n"
  "\\P\\S����������.\\s ���� ���������� ������������ �������� C++11, �� ������\n"
  "�������-������� range ���������� ������������ ������-��������� � �����������\n"
  "�� ������ ������� ���������� \\Mx\\m (������� ���������������� ��������� {K}):\n"
  "\\M[\\&x]()\\{return x++;\\}\\m."
  );
  int k = RandomN(-99, 83);
  int n = RandomN(5, 17);
  DataN("K = ", k, xLeft, 2, 3);
  DataN("N = ", n, xRight, 2, 2);
  vn.clear();
//  generate_n(back_inserter(vn), n, range(k));
  int x = k;
  generate_n(back_inserter(vn), n, [&x](){return x++;});
  ResultVN("V", 3);
  SetTestCount(5);
}

struct arith_pr
{
        double a, d;
        arith_pr(double a0, double d0): a(a0), d(d0)
        {}
        double operator()()
        {
                double a0 = a;
                a += d;
                return a0;
        }
};


void Stl14()
{
  CreateTask();
  TaskText(
  "���������� ��������� arith\\_pr � ������������� ������ {a} � {d}~\\= �������\n"
  "������ � ��������� �������������� ����������~\\= � ��������� (), �������\n"
  "���������� ��������� ���� ����������, ������� � �������. ����� ����������\n"
  "����������� arith\\_pr � ����� �����������~\\= ������ ������ ����������\n"
  "� ���������. ���� ������������ ����� {A}, {D} � ����� ����� {N} (>\\,0). ���������\n"
  "�������� generate\\_n � ��������-�������� arith\\_pr � ���������� �������,\n"
  "��������� ������ {V} ������� �� {N} ��������� ������ �������������� ����������\n"
  "� ������ ������ {A} � ��������� {D} (� ���������� ������ ������ ��������� ��������\n"
  "{A}, {A}\\,+\\,{D}, {A}\\,+\\,2{D},~\\., {A}\\,+\\,({N}\\,\\-\\,1){D}) � ������� �������� ����������� �������.\n"
  "\n"
  "\\P\\S����������.\\s ���� ���������� ������������ �������� C++11, �� ������\n"
  "�������-������� arith\\_pr ���������� ������������ ������-��������� � �����\n"
  "������������ �������� ����������� (��. ���������� � \\1)."
  );
  double a = RandomN(100, 5000)/100.0;
  int n = RandomN(2, 9);
  double x = (100 - a)/n - 0.5;
  double d = RandomN(100, (int)(x*100))/100.0;
  DataR("A = ", a, xLeft, 2, 5);
  DataR("D = ", d, xRight, 2, 5);
  DataN("N = ", n, 0, 3, 1);
  vr.clear();
//  x = a-d;
//  generate_n(back_inserter(vr), n, [&x,d](){return x=x+d;});
  generate_n(back_inserter(vr), n, arith_pr(a,d));
  ResultVR("V", 3);
  SetTestCount(5);
}
*/

void InitTask_(int num)
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
  }
}

void  inittaskgroup_()
{
    if ((CurrentLanguage() & lgCPP) == 0) return;
        CreateGroup("STL6Func", "�������������� �������: �������������� �����������", 
    "�. �. �������, 2016, 2021", "qwq2334sd#EnTopic<Function objects: additional features>#2778833gd5ttd", 14, InitTask_);



}
}

//----------------------------------------

void  inittaskgroup6()
{
    STL6::inittaskgroup_();
}
void  InitTask6(int num)
{
    STL6::InitTask_(num);
}

//-------------------------------------
