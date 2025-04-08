#include <string>
#include <fstream>
#include <vector>
#include <deque>
#include <list>
#include <algorithm>
#include <iterator>
#include "pt5taskmaker.h"

namespace STL2
{

vector<int> vn, vn1, vn2, vn3;

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

const char* tit1 = "���������������� ����������: ���������� � ������. �������� ���������";
const char* tit2 = "���������������� ����������: ������� ���������";
const char* tit3 = "���������������� ����������: �������� ���������";

void MakeVN(int n, int a1, int b1)
{
  vn.clear();
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



void Stl1()
{
  CreateTask(tit1);
  TaskText(
  "��� ��������� ���� � ������ {name}, ���������� ��������� �������������\n"
  "����� �����. ��������� ������ {V} ������� �� ��������� ����� � �������\n"
  "�������� ������� � �������� �������. ��� ���������� ������� ������������\n"
  "�������� istream\\_iterator � ����������� �������, ��� ������ ���������\n"
  "������� ������������ �������� copy, �������� ��� � ���������� �����������\n"
  "������� � ��������� ptout\\_iterator."
  );
  MakeVN(RandomN(10, 34), -99, 99);
  string name = RandomStr(8) + ".tst";
  DataS("name = ", name.c_str(), 0, 1);
  DataFileVN(name.c_str(), 2, 5);
  ResultVN("V", 3);
}


void Stl2()
{
  CreateTask(tit1);
  TaskText(
  "��� ����� ����� �����. ��������� ������ {L} ��������� ������� � �������\n"
  "�������� ������ {L} ������� � ��������, � ����� � �������� �������.\n"
  "��� ���������� ������ ������������ �������� ptin\\_iterator � �����������\n"
  "������, ��� ������ ��������� ������ ������ ��������� �������� copy\n"
  "� ���������� ����������� ������ � ��������� ptout\\_iterator, ������\n"
  "��� ������ ��������� � �������� ������� ������������ �������� ���������,\n"
  "������������ ���������-������� rbegin � rend."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("", 3);
  ResultComment("�������� ������ � �������� �������:", 0, 2);
  ResultVN("L", 3);
  vn1 = vn;
  reverse_copy(vn1.begin(), vn1.end(), vn.begin());
  ResultComment("�������� ������ � �������� �������:", 0, 4);
  ResultVN("L", 5);
}

void Stl3()
{
  CreateTask(tit1);
  TaskText(
  "��� ����� ����� ����� � ������ ����������� ���������. ��������� ������ {V}\n"
  "��������� ������� � ������� ������� ������ �������� ��������� ������� {V},\n"
  "� ����� ������ �������� (� ������ �������� ������� ��������� �� ��������).\n"
  "��� ���������� ������� ������������ �������� ptin\\_iterator � �����������\n"
  "�������, ��� ������ ��������� ������ ��������� �������� copy � ����������\n"
  "����������� ������� � ��������� ptout\\_iterator. ��� ������� ���������\n"
  "���������� ������� ������������ ��������� \\MV.size()/2\\m � �������� \\<+\\>."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.erase(vn.begin(), vn.begin()+vn.size()/2);
  ResultComment("������ �������� ��������� �������:", 0, 2);
  ResultVN("V", 3);
  copy(vn1.begin(), vn1.begin()+vn.size(), vn.begin());
  ResultComment("������ �������� ��������� �������:", 0, 4);
  ResultVN("V", 5);
}

void Stl4()
{
  CreateTask(tit1);
  TaskText(
  "��� ����� ����� ����� � ������ ����������� ���������. ��������� ��� {D}\n"
  "��������� ������� � ������� ������ �������� ��������� ���� {D} � ��������\n"
  "�������, � ����� \\= ������ �������� (����� � �������� �������).\n"
  "��� ���������� ���� ������������ �������� ptin\\_iterator � �����������\n"
  "����, ��� ������ ��������� ������ ��������� �������� copy � ����������\n"
  "����������� ���� � ��������� ptout\\_iterator. ������������ ��������\n"
  "��������� ����; ��� ����������� ��������� �� ���\n"
  "������������ ��������� \\MD.size()/2\\m � �������� \\<+\\>."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.clear();
  reverse_copy(vn1.begin(), vn1.begin() + vn1.size()/2, back_inserter(vn));
  ResultComment("������ �������� ��������� ���� (� �������� �������):", 0, 2);
  ResultVN("D", 3);
  reverse_copy(vn1.begin() + vn1.size()/2, vn1.end(), vn.begin());
  ResultComment("������ �������� ��������� ���� (� �������� �������):", 0, 4);
  ResultVN("D", 5);
}

void Stl5()
{
  CreateTask(tit1);
  TaskText(
  "��� ����� ����� �����, ���������� ������� ������� �� 3. ��������� ������ {L}\n"
  "��������� ������� � ������� ������� ������ ����� ��������� ������ {L}\n"
  "� �������� �������, ����� ������ ����� ��������� � �������� �������,\n"
  "� ����� ��������� ����� (����� � �������� �������). ��� ���������� ������\n"
  "������������ �������� ptin\\_iterator � ����������� ������, ��� ������\n"
  "��������� ������ ��������� �������� copy � ���������� ����������� ������\n"
  "� ��������� ptout\\_iterator. ������������ ��� ������, ��� � ��������\n"
  "���������; ��� ����������� ��������� �� ��� ������������\n"
  "��������� \\ML.size()/3\\m � ������� advance."
  );
  MakeVN(RandomN(3, 11)*3, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.clear();
  copy(vn1.begin(), vn1.begin() + vn1.size()/3, back_inserter(vn));
  ResultComment("������ ����� ��������� ������ (� �������� �������):", 0, 1);
  ResultVN("L", 2);
  reverse_copy(vn1.begin() + vn1.size()/3, vn1.begin() + 2*vn1.size()/3, vn.begin());
  ResultComment("������ ����� ��������� ������ (� �������� �������):", 0, 3);
  ResultVN("L", 4);
  reverse_copy(vn1.begin() + 2*vn1.size()/3, vn1.end(), vn.begin());
  ResultComment("��������� ����� ��������� ������ (� �������� �������):", 0, 5);
  ResultVN("L", 6);
}

void Stl6()
{
  CreateTask(tit1);
  TaskText(
  "���� ������ {V}, ��� {D} � ������ {L}. ������ �������� ��������� ��������\n"
  "�� ����� ���� ���������, ���������� ��������� �������� ��������. �������\n"
  "�������� �������, �������� � ���������� �������� ������� �� ��������\n"
  "�����������. ��� ������� � ������� � ���������� �������� ������ ����������\n"
  "������������ �������-����� front � back. ��� ������� � �������� ��������\n"
  "������� � ���� ������������ �������� �������������� []. ��� �������\n"
  "� �������� �������� ������ ������������ ������� advance ��� ����������\n"
  "� �������� ������������� ��������� *."
  );
  MakeVN(RandomN(5, 9)*2-1, -50, 50);
  DataVN("V", 2);
  vn.front() *= 2;
  vn[vn.size()/2] *= 2;
  vn.back() *= 2;
  ResultVN("V", 2);
  MakeVN(RandomN(5, 9)*2-1, -50, 50);
  DataVN("D", 3);
  vn.front() *= 2;
  vn[vn.size()/2] *= 2;
  vn.back() *= 2;
  ResultVN("D", 3);
  MakeVN(RandomN(5, 9)*2-1, -50, 50);
  DataVN("L", 4);
  vn.front() *= 2;
  vn[vn.size()/2] *= 2;
  vn.back() *= 2;
  ResultVN("L", 4);

}

void Stl7()
{
  CreateTask(tit1);
  TaskText(
  "���� ������ {V}, ��� {D} � ������ {L}. ������ �������� ��������� ��������\n"
  "�� ����� ���� ���������, ���������� ��������� �������� ������. ��������\n"
  "�������� ���� ������� ��������� ������� �� �������� �����������. ������������\n"
  "�������� swap (�� ������ ��� � ����������� ��������-������ ����������)."
  );
  MakeVN(RandomN(5, 8)*2, -99, 99);
  DataVN("V", 2);
  swap(vn[vn.size()/2-1], vn[vn.size()/2]);
  ResultVN("V", 2);
  MakeVN(RandomN(5, 8)*2, -99, 99);
  DataVN("D", 3);
  swap(vn[vn.size()/2-1], vn[vn.size()/2]);
  ResultVN("D", 3);
  MakeVN(RandomN(5, 8)*2, -99, 99);
  DataVN("L", 4);
  swap(vn[vn.size()/2-1], vn[vn.size()/2]);
  ResultVN("L", 4);
}

void Stl8()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V} � ������ ����������� ���������.\n"
  "�������� � �������� ������� 5~������� ���������.\n"
  "������������ ���� ����� �������-����� insert."
  );
  MakeVN(RandomN(5, 14)*2, -99, 99);
  DataVN("V", 3);
  vn.insert(vn.begin() + vn.size()/2, 5, 0);
  ResultVN("V", 3);
}

void Stl9()
{
  CreateTask(tit2);
  TaskText(
  "��� ��� {D} � �������� ����������� ��������� {N} (\\g\\,5).\n"
  "�������� � ������ ���� ���� ��� ������� ��������� � �������� �������.\n"
  "������������ ���� ����� �������-����� insert."
  );
  MakeVN(RandomN(6, 15)*2-1, -99, 99);
  DataVN("D", 3);
  deque<int> dn(vn.begin(),vn.end());  //2021.11  �����������! 
  dn.insert(dn.begin(), dn.begin() + dn.size()/2 - 2, dn.begin() + dn.size()/2 + 3);
  vn.assign(dn.begin(),dn.end());
  ResultVN("D", 3);
}

void Stl10()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {L}, ���������� ��������� �������� ������� �� 3.\n"
  "�������� � ����� ������ ������ ����� ��� �������� ���������\n"
  "� �������� �������. ������������ ���� ����� �������-����� insert."
  );
  MakeVN(RandomN(3, 11)*3, -99, 99);
  DataVN("L", 3);
  vn.insert(vn.end(), vn.rend() - vn.size()/3, vn.rend());
  ResultVN("L", 3);
}

void Stl11()
{
  CreateTask(tit2);
  TaskText(
  "���� ������ {V} � ������ {L}. ������ �������� ��������� ��������\n"
  "�� ����� 5~���������. �������� ����� �������� ������ � ����������\n"
  "�������~5 ������ 5~��������� ������� � �������� �������.\n"
  "������������ ���� ����� �������-����� insert."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V", 2);
  vn1 = vn;
  MakeVN(RandomN(10, 29), -99, 99);
  DataVN("L", 3);
  vn.insert(vn.begin() + 5, vn1.rend() - 5, vn1.rend());
  ResultVN("L", 3);
}

void Stl12()
{
  CreateTask(tit2);
  TaskText(
  "���� ��� {D} � ������ {L}. ������ �������� ��������� ��������\n"
  "�� ����� 5~���������. �������� ����� ����� � ����� ��������� ������\n"
  "��������� 5~��������� ���� � �������� �������.\n"
  "������������ ���� ����� �������-����� insert."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("D", 2);
  vn1 = vn;
  MakeVN(RandomN(10, 29), -99, 99);
  DataVN("L", 3);
  vn.insert(vn.end() - 5, vn1.rbegin(), vn1.rbegin() + 5);
  ResultVN("L", 3);
}

void Stl13()
{
  CreateTask(tit2);
  TaskText(
  "���� ������ {V} � ��� {D}, ������� ������ ���������� ���������. ��������\n"
  "� ����� ������� ������ �������� ��������� ���� (� �������� �������),\n"
  "� � ������ ���� \\= ������ �������� �������� ��������� �������\n"
  "(� �������� �������). ������������ ��� ������ �������-����� insert."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("V", 2);
  vn1 = vn;
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("D", 4);
  vn2 = vn;
  vn.insert(vn.begin(), vn1.rbegin(), vn1.rbegin() + vn1.size()/2);
  vn3 = vn;
  vn = vn1;
  vn.insert(vn.end(), vn2.begin(), vn2.begin() + vn2.size()/2);
  ResultVN("V", 2);
  vn = vn3;
  ResultVN("D", 4);
}

void Stl14()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {V}. �������� ����� ������� �������� ��������� ������� �����~\\-1.\n"
  "������������ �������-���� insert � ����� � ����������-����������."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V", 3);
  for (auto i = vn.begin(); i != vn.end(); i++)
          i = vn.insert(++i, -1);
  ResultVN("V", 3);
}

void Stl15()
{
  CreateTask(tit2);
  TaskText(
  "��� ��� {D} � ������ ����������� ���������. �������� �����\n"
  "������ ��������� �� ������ �������� ��������� ���� �����~\\-1.\n"
  "������������ �������-���� insert � ����� � �������� ����������."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("D", 3);
  int n = vn.size()/2;
  auto i = vn.begin() + n;
  for (int k = 0; k != n; k++)
          i = vn.insert(--i, -1);
  ResultVN("D", 3);
}

void Stl16()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� �������-���� insert\n"
  "� ����� �� ��������� ���������."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("D", 3);
  int n = vn.size()/2;
  auto i = vn.begin() + n;
  for (int k = 0; k != n; k++)
          i = vn.insert(--i, -1);
  ResultVN("D", 3);
}

void Stl17()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {L}. �������� ����� ������ ��������� ��������� ������ �����~\\-1.\n"
  "������������ �������-���� insert � ����� � ����������-����������."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("L", 3);
  int n = vn.size();
  auto i = vn.end();
  for (int k = 0; k != n; k++)
          i = vn.insert(--i, -1);
  ResultVN("L", 3);
}

void Stl18()
{
  CreateTask(tit2);
  TaskText(
  "��� ������ {L} � ������ ����������� ���������. �������� ����� �������\n"
  "�������� �� ������ �������� ��������� ������ �����~\\-1.\n"
  "������������ �������-���� insert � ����� � ����������-����������."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L", 3);
  int n = vn.size()/2;
  auto i = vn.begin() + n + 1;
  for (int k = 0; k != n; k++)
          i = vn.insert(--i, -1);
  ResultVN("L", 3);
}

void Stl19()
{
  CreateTask(tit2);
  TaskText(
  "������ ������ \\1, ��������� �������-���� insert\n"
  "� ����� �� ��������� ���������."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L", 3);
  int n = vn.size()/2;
  auto i = vn.begin() + n + 1;
  for (int k = 0; k != n; k++)
          i = vn.insert(--i, -1);
  ResultVN("L", 3);
}

void Stl20()
{
  CreateTask(tit3);
  TaskText(
  "��� ��� {D} � �������� ����������� ��������� {N} (\\g\\,3).\n"
  "������� ������� ������� ����. ������������ �������-���� erase."
  );
  MakeVN(RandomN(7, 17)*2-1, -99, 99);
  DataVN("D", 3);
  vn.erase(vn.begin() + vn.size()/2);
  ResultVN("D", 3);
}

void Stl21()
{
  CreateTask(tit3);
  TaskText(
  "��� ������ {V} � �������� ����������� ��������� {N} (\\g\\,5). �������\n"
  "��� ������� �������� �������. ������������ ���� ����� �������-����� erase."
  );
  MakeVN(RandomN(7, 17)*2-1, -99, 99);
  DataVN("V", 3);
  vn.erase(vn.begin() + vn.size()/2 - 1, vn.begin() + vn.size()/2 + 2);
  ResultVN("V", 3);
}

void Stl22()
{
  CreateTask(tit3);
  TaskText(
  "���� ������ {L} � ������ {V}; ������ {L} ����� �������� ���������� ���������.\n"
  "����������� ������� ������� ������~{L} � ����� �������~{V}.\n"
  "������������ �������-����� push\\_back � erase."
  );
  MakeVN(RandomN(7, 17)*2-1, -99, 99);
  DataVN("L", 2);
  vn1 = vn;
  MakeVN(RandomN(14, 34), -99, 99);
  DataVN("V", 4);
  vn.push_back(vn1[vn1.size()/2]);
  vn2 = vn;
  vn = vn1;
  vn.erase(vn.begin() + vn.size()/2);
  ResultVN("L", 2);
  vn = vn2;
  ResultVN("V", 4);
}

void Stl23()
{
  CreateTask(tit3);
  TaskText(
	  "���� ������ {L} � ��� {D}; ��� {D} ����� ������ ���������� ���������.\n"
  "����������� ������ �������� ��������� ����~{D} � ������ ������~{L}.\n"
  "������������ ���� ����� �������-������ insert � erase."
  );
  MakeVN(RandomN(8, 16), -99, 99);
  DataVN("L", 2);
  vn1 = vn;
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("D", 4);
  vn1.insert(vn1.begin(), vn.begin(), vn.begin() + vn.size()/2);
  vn2 = vn;
  vn = vn1;
  vn2.erase(vn2.begin(), vn2.begin() + vn2.size()/2);
  ResultVN("L", 2);
  vn = vn2;
  ResultVN("V", 4);
}

void Stl24()
{
  CreateTask(tit3);
  TaskText(
  "���� ������ {L}_1 � {L}_2; ������ {L}_1 ����� �������� ���������� ���������.\n"
  "����������� ������� ������� ������~{L}_1 � ����� ������~{L}_2.\n"
  "������������ ���� ����� �������-����� splice."
  );
  MakeVN(RandomN(7, 17)*2-1, -99, 99);
  DataVN("L_1", 2);
  vn1 = vn;
  MakeVN(RandomN(14, 34), -99, 99);
  DataVN("L_2", 4);
  vn.push_back(vn1[vn1.size()/2]);
  vn2 = vn;
  vn = vn1;
  vn.erase(vn.begin() + vn.size()/2);
  ResultVN("L_1", 2);
  vn = vn2;
  ResultVN("L_2", 4);
}

void Stl25()
{
  CreateTask(tit3);
  TaskText(
  "���� ������ {L}_1 � {L}_2; ������ {L}_2 ����� ������ ���������� ���������.\n"
  "����������� ������ �������� ��������� ������~{L}_2 � ������ ������~{L}_1.\n"
  "������������ ���� ����� �������-����� splice."
  );
  MakeVN(RandomN(8, 16), -99, 99);
  DataVN("L_1", 2);
  vn1 = vn;
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("L_2", 4);
  vn1.insert(vn1.begin(), vn.begin(), vn.begin() + vn.size()/2);
  vn2 = vn;
  vn = vn1;
  vn2.erase(vn2.begin(), vn2.begin() + vn2.size()/2);
  ResultVN("L_1", 2);
  vn = vn2;
  ResultVN("L_2", 4);
}

void Stl26()
{
  CreateTask(tit3);
  TaskText(
  "���� ������ {L}_1 � {L}_2, ������� ������ ���������� ���������.\n"
  "�������� ������� ������ �������� ��������� ������~{L}_1 � ������ ��������\n"
  "��������� ������~{L}_2. ������������ ��� ������ �������-����� splice."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("L_1", 2);
  vn1 = vn;
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("L_2", 4);
  vn2 = vn;
  vn2.erase(vn2.begin() + vn2.size()/2, vn2.end());
  vn2.insert(vn2.end(), vn1.begin(), vn1.begin() + vn1.size()/2);
  vn1.erase(vn1.begin(), vn1.begin() + vn1.size()/2);
  vn1.insert(vn1.begin(), vn.begin() + vn.size()/2, vn.end());
  vn = vn1;
  ResultVN("L_1", 2);
  vn = vn2;
  ResultVN("L_2", 4);
}

void Stl27()
{
  CreateTask(tit3);
  TaskText(
  "��� ������ {V}. ������� ��� �������� ��������� ������� � ���������\n"
  "����������� �������� (������, ��� ��������� ������� ������� �����\n"
  "���������� �����~1). ������������ �������-���� erase\n"
  "� ����� � ����������-����������."
  );
  MakeVN(RandomN(9, 34), -99, 99);
  DataVN("V", 3);
  for (auto i = vn.begin(); i != vn.end(); i++)
  {
          i = vn.erase(i);
          if (i == vn.end()) break;
  }
  ResultVN("V", 3);
}

void Stl28()
{
  CreateTask(tit3);
  TaskText(
  "��� ��� {D} � ����������� ���������, ������� 4. ������� � ������ ��������\n"
  "��������� ���� ��� �������� � ������� ����������� �������� (������,\n"
  "��� ��������� ������� ���� ����� ���������� �����~1).\n"
  "������������ �������-���� erase � ����� � �������� ����������."
  );
  MakeVN(RandomN(2, 8)*4, -99, 99);
  DataVN("D", 3);
  int n = vn.size()/4;
  auto i = vn.begin();
  for (int k = 1; k <= n; k++)
          i = vn.erase(++i);
  ResultVN("D", 3);
}

void Stl29()
{
  CreateTask(tit3);
  TaskText(
  "������ ������ \\1, ��������� �������-���� erase\n"
  "� ����� �� ��������� ���������."
  );
  MakeVN(RandomN(2, 8)*4, -99, 99);
  DataVN("D", 3);
  int n = vn.size()/4;
  auto i = vn.begin();
  for (int k = 1; k <= n; k++)
          i = vn.erase(++i);
  ResultVN("D", 3);
}

void Stl30()
{
  CreateTask(tit3);
  TaskText(
  "��� ������ {L}. ������� ��� �������� ��������� ������ � ������� �����������\n"
  "�������� (������, ��� ��������� ������� ������ ����� ���������� �����~1).\n"
  "������������ �������-���� erase � ����� � ����������-����������."
  );
  MakeVN(RandomN(9, 34), -99, 99);
  DataVN("L", 3);
  for (auto i = vn.begin()+1; i != vn.end(); i++)
  {
          i = vn.erase(i);
          if (i == vn.end()) break;
  }
  ResultVN("L", 3);
}

void Stl31()
{
  CreateTask(tit3);
  TaskText(
  "��� ������ {L} � ����������� ���������, ������� 4. ������� � ������ ��������\n"
  "��������� ������ ��� �������� � ��������� ����������� �������� (������,\n"
  "��� ��������� ������� ������ ����� ���������� �����~1).\n"
  "������������ �������-���� erase � ����� � ����������-����������."
  );
  MakeVN(RandomN(2, 8)*4, -99, 99);
  DataVN("L", 3);
  int n = vn.size()/4;
  auto i = vn.begin();
  for (int k = 1; k <= n; k++, i++)
          i = vn.erase(i);
  ResultVN("L", 3);
}

void Stl32()
{
  CreateTask(tit3);
  TaskText(
  "������ ������ \\1, ��������� �������-���� erase\n"
  "� ����� �� ��������� ���������."
  );
  MakeVN(RandomN(2, 8)*4, -99, 99);
  DataVN("L", 3);
  int n = vn.size()/4;
  auto i = vn.begin();
  for (int k = 1; k <= n; k++, i++)
          i = vn.erase(i);
  ResultVN("L", 3);
}

void Stl33()
{
  CreateTask(tit3);
  TaskText(
  "��� ������ {L} � ���������� {A}_1, {A}_2, {A}_3, \\., {A}_{N\\-1}, {A}_{N} ({N} \\= ������).\n"
  "�������� ������� ��������� � ������ �� ���������:\n"
  "{A}_{N}, {A}_1, {A}_{N\\-1}, {A}_2, {A}_{N\\-2}, \\., {A}_{N/2}, {A}_{N/2\\-1}.\n"
  "��� ����� ������������ ��� ��������� \\Mi\\m � \\Mr\\m, ������ �� � ������ � ���������\n"
  "��������� ������. � �����, ������� ������ ����������� {N}/2 ���,\n"
  "�������� �������-���� splice � ������ ���������� \\Mi++\\m � ������� ���������� \\Mr--\\m."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("L", 3);
  int n = vn.size();
  vn1.clear();
  for (int i = 0; i < n/2; i++)
  {
          vn1.push_back(vn[n-i-1]);
          vn1.push_back(vn[i]);
  }
  vn = vn1;
  ResultVN("L", 3);
}

void Stl34()
{
  CreateTask(tit3);
  TaskText(
  "���� ��� ������ {L}_1 � {L}_2 � ���������� ����������� ���������~{N}. ��������\n"
  "� ������ {L}_2 ��������������� ����� ��������� �������� ������� ����\n"
  "{A}_1, {B}_1, {A}_2, {B}_2, {A}_3, {B}_3, \\., {A}_{N}, {B}_{N}, ��� {A}_{I} ���������� �������� ���������\n"
  "������~{L}_1, �~{B}_{I}~\\= �������� ��������� ������~{L}_2. ��� ����� ������������\n"
  "��������� \\Mi1\\m (��� ������~{L}_1) �~\\Mi2\\m (��� ������~{L}_2), ������ �� � ������\n"
  "��������� ���������������� ������. � �����, ������� ������ �����������\n"
  "{N}~���, �������� �������-���� splice ��� ������~{L}_2 � ������ ���������� \\M++i2\\m\n"
  "� ������� ����������~\\Mi1++\\m."
  );
  MakeVN(RandomN(5, 17), -99, 99);
  DataVN("L_1", 3);
  int n = vn.size();
  vn1 = vn;
  MakeVN(n, -99, 99);
  DataVN("L_2", 4);
  vn2 = vn;
  vn.clear();
  for (int i = 0; i < n; i++)
  {
          vn.push_back(vn1[i]);
          vn.push_back(vn2[i]);
  }
  ResultVN("L_2", 3);
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
  }
}

void inittaskgroup_()
{
  if ((CurrentLanguage() & lgCPP) == 0) return;
  CreateGroup("STL2Seq", "���������������� ����������", 
    "�. �. �������, 2016, 2021", "qwq2334#EnTopic<Sequence containers>#sd255445hfgd5ttd", 34, InitTask_);

}

}

//----------------------------------------

void  inittaskgroup2()
{
    STL2::inittaskgroup_();
}
void  InitTask2(int num)
{
    STL2::InitTask_(num);
}

//-------------------------------------
