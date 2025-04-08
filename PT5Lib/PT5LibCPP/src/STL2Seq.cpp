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

const char* tit1 = "Последовательные контейнеры: заполнение и доступ. Обратные итераторы";
const char* tit2 = "Последовательные контейнеры: вставка элементов";
const char* tit3 = "Последовательные контейнеры: удаление элементов";

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
  "Дан текстовый файл с именем {name}, содержащий строковые представления\n"
  "целых чисел. Заполнить вектор {V} числами из исходного файла и вывести\n"
  "элементы вектора в исходном порядке. Для заполнения вектора использовать\n"
  "итератор istream\\_iterator и конструктор вектора, для вывода элементов\n"
  "вектора использовать алгоритм copy, применяя его к итераторам полученного\n"
  "вектора и итератору ptout\\_iterator."
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
  "Дан набор целых чисел. Заполнить список {L} исходными числами и вывести\n"
  "элементы списка {L} вначале в исходном, а затем в обратном порядке.\n"
  "Для заполнения списка использовать итератор ptin\\_iterator и конструктор\n"
  "списка, для вывода элементов списка дважды применить алгоритм copy\n"
  "к итераторам полученного списка и итератору ptout\\_iterator, причем\n"
  "для вывода элементов в обратном порядке использовать обратные итераторы,\n"
  "возвращаемые функциями-членами rbegin и rend."
  );
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("", 3);
  ResultComment("Элементы списка в исходном порядке:", 0, 2);
  ResultVN("L", 3);
  vn1 = vn;
  reverse_copy(vn1.begin(), vn1.end(), vn.begin());
  ResultComment("Элементы списка в обратном порядке:", 0, 4);
  ResultVN("L", 5);
}

void Stl3()
{
  CreateTask(tit1);
  TaskText(
  "Дан набор целых чисел с четным количеством элементов. Заполнить вектор {V}\n"
  "исходными числами и вывести вначале вторую половину элементов вектора {V},\n"
  "а затем первую половину (в каждой половине порядок элементов не изменять).\n"
  "Для заполнения вектора использовать итератор ptin\\_iterator и конструктор\n"
  "вектора, для вывода элементов дважды применить алгоритм copy к итераторам\n"
  "полученного вектора и итератору ptout\\_iterator. При задании некоторых\n"
  "итераторов вектора использовать выражение \\MV.size()/2\\m и операцию \\<+\\>."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.erase(vn.begin(), vn.begin()+vn.size()/2);
  ResultComment("Вторая половина элементов вектора:", 0, 2);
  ResultVN("V", 3);
  copy(vn1.begin(), vn1.begin()+vn.size(), vn.begin());
  ResultComment("Первая половина элементов вектора:", 0, 4);
  ResultVN("V", 5);
}

void Stl4()
{
  CreateTask(tit1);
  TaskText(
  "Дан набор целых чисел с четным количеством элементов. Заполнить дек {D}\n"
  "исходными числами и вывести первую половину элементов дека {D} в обратном\n"
  "порядке, а затем \\= вторую половину (также в обратном порядке).\n"
  "Для заполнения дека использовать итератор ptin\\_iterator и конструктор\n"
  "дека, для вывода элементов дважды применить алгоритм copy к итераторам\n"
  "полученного дека и итератору ptout\\_iterator. Использовать обратные\n"
  "итераторы дека; при определении некоторых из них\n"
  "использовать выражение \\MD.size()/2\\m и операцию \\<+\\>."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.clear();
  reverse_copy(vn1.begin(), vn1.begin() + vn1.size()/2, back_inserter(vn));
  ResultComment("Первая половина элементов дека (в обратном порядке):", 0, 2);
  ResultVN("D", 3);
  reverse_copy(vn1.begin() + vn1.size()/2, vn1.end(), vn.begin());
  ResultComment("Вторая половина элементов дека (в обратном порядке):", 0, 4);
  ResultVN("D", 5);
}

void Stl5()
{
  CreateTask(tit1);
  TaskText(
  "Дан набор целых чисел, количество которых делится на 3. Заполнить список {L}\n"
  "исходными числами и вывести вначале первую треть элементов списка {L}\n"
  "в исходном порядке, затем вторую треть элементов в обратном порядке,\n"
  "а затем последнюю треть (также в обратном порядке). Для заполнения списка\n"
  "использовать итератор ptin\\_iterator и конструктор списка, для вывода\n"
  "элементов трижды применить алгоритм copy к итераторам полученного списка\n"
  "и итератору ptout\\_iterator. Использовать как прямые, так и обратные\n"
  "итераторы; при определении некоторых из них использовать\n"
  "выражение \\ML.size()/3\\m и функцию advance."
  );
  MakeVN(RandomN(3, 11)*3, -99, 99);
  DataVN("", 3);
  vn1 = vn;
  vn.clear();
  copy(vn1.begin(), vn1.begin() + vn1.size()/3, back_inserter(vn));
  ResultComment("Первая треть элементов списка (в исходном порядке):", 0, 1);
  ResultVN("L", 2);
  reverse_copy(vn1.begin() + vn1.size()/3, vn1.begin() + 2*vn1.size()/3, vn.begin());
  ResultComment("Вторая треть элементов списка (в обратном порядке):", 0, 3);
  ResultVN("L", 4);
  reverse_copy(vn1.begin() + 2*vn1.size()/3, vn1.end(), vn.begin());
  ResultComment("Последняя треть элементов списка (в обратном порядке):", 0, 5);
  ResultVN("L", 6);
}

void Stl6()
{
  CreateTask(tit1);
  TaskText(
  "Даны вектор {V}, дек {D} и список {L}. Каждый исходный контейнер содержит\n"
  "не менее трех элементов, количество элементов является нечетным. Удвоить\n"
  "значения первого, среднего и последнего элемента каждого из исходных\n"
  "контейнеров. Для доступа к первому и последнему элементу любого контейнера\n"
  "использовать функции-члены front и back. Для доступа к среднему элементу\n"
  "вектора и дека использовать операцию индексирования []. Для доступа\n"
  "к среднему элементу списка использовать функцию advance для итераторов\n"
  "и операцию разыменования итератора *."
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
  "Даны вектор {V}, дек {D} и список {L}. Каждый исходный контейнер содержит\n"
  "не менее двух элементов, количество элементов является четным. Поменять\n"
  "значения двух средних элементов каждого из исходных контейнеров. Использовать\n"
  "алгоритм swap (не путать его с одноименной функцией-членом контейнера)."
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
  "Дан вектор {V} с четным количеством элементов.\n"
  "Добавить в середину вектора 5~нулевых элементов.\n"
  "Использовать один вызов функции-члена insert."
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
  "Дан дек {D} с нечетным количеством элементов {N} (\\g\\,5).\n"
  "Добавить в начало дека пять его средних элементов в исходном порядке.\n"
  "Использовать один вызов функции-члена insert."
  );
  MakeVN(RandomN(6, 15)*2-1, -99, 99);
  DataVN("D", 3);
  deque<int> dn(vn.begin(),vn.end());  //2021.11  исправление! 
  dn.insert(dn.begin(), dn.begin() + dn.size()/2 - 2, dn.begin() + dn.size()/2 + 3);
  vn.assign(dn.begin(),dn.end());
  ResultVN("D", 3);
}

void Stl10()
{
  CreateTask(tit2);
  TaskText(
  "Дан список {L}, количество элементов которого делится на 3.\n"
  "Добавить в конец списка первую треть его исходных элементов\n"
  "в обратном порядке. Использовать один вызов функции-члена insert."
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
  "Даны вектор {V} и список {L}. Каждый исходный контейнер содержит\n"
  "не менее 5~элементов. Вставить после элемента списка с порядковым\n"
  "номером~5 первые 5~элементов вектора в обратном порядке.\n"
  "Использовать один вызов функции-члена insert."
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
  "Даны дек {D} и список {L}. Каждый исходный контейнер содержит\n"
  "не менее 5~элементов. Вставить перед пятым с конца элементом списка\n"
  "последние 5~элементов дека в обратном порядке.\n"
  "Использовать один вызов функции-члена insert."
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
  "Даны вектор {V} и дек {D}, имеющие четное количество элементов. Добавить\n"
  "в конец вектора первую половину элементов дека (в исходном порядке),\n"
  "а в начало дека \\= вторую половину исходных элементов вектора\n"
  "(в обратном порядке). Использовать два вызова функции-члена insert."
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
  "Дан вектор {V}. Вставить после каждого элемента исходного вектора число~\\-1.\n"
  "Использовать функцию-член insert в цикле с параметром-итератором."
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
  "Дан дек {D} с четным количеством элементов. Вставить перед\n"
  "каждым элементом из первой половины исходного дека число~\\-1.\n"
  "Использовать функцию-член insert в цикле с числовым параметром."
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
  "Решить задачу \\1, используя функцию-член insert\n"
  "в цикле по обратному итератору."
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
  "Дан список {L}. Вставить перед каждым элементом исходного списка число~\\-1.\n"
  "Использовать функцию-член insert в цикле с параметром-итератором."
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
  "Дан список {L} с четным количеством элементов. Вставить после каждого\n"
  "элемента из первой половины исходного списка число~\\-1.\n"
  "Использовать функцию-член insert в цикле с параметром-итератором."
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
  "Решить задачу \\1, используя функцию-член insert\n"
  "в цикле по обратному итератору."
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
  "Дан дек {D} с нечетным количеством элементов {N} (\\g\\,3).\n"
  "Удалить средний элемент дека. Использовать функцию-член erase."
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
  "Дан вектор {V} с нечетным количеством элементов {N} (\\g\\,5). Удалить\n"
  "три средних элемента вектора. Использовать один вызов функции-члена erase."
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
  "Даны список {L} и вектор {V}; список {L} имеет нечетное количество элементов.\n"
  "Переместить средний элемент списка~{L} в конец вектора~{V}.\n"
  "Использовать функции-члены push\\_back и erase."
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
	  "Даны список {L} и дек {D}; дек {D} имеет четное количество элементов.\n"
  "Переместить первую половину элементов дека~{D} в начало списка~{L}.\n"
  "Использовать один вызов функций-членов insert и erase."
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
  "Даны списки {L}_1 и {L}_2; список {L}_1 имеет нечетное количество элементов.\n"
  "Переместить средний элемент списка~{L}_1 в конец списка~{L}_2.\n"
  "Использовать один вызов функции-члена splice."
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
  "Даны списки {L}_1 и {L}_2; список {L}_2 имеет четное количество элементов.\n"
  "Переместить первую половину элементов списка~{L}_2 в начало списка~{L}_1.\n"
  "Использовать один вызов функции-члена splice."
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
  "Даны списки {L}_1 и {L}_2, имеющие четное количество элементов.\n"
  "Поменять местами первую половину исходного списка~{L}_1 и вторую половину\n"
  "исходного списка~{L}_2. Использовать два вызова функции-члена splice."
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
  "Дан вектор {V}. Удалить все элементы исходного вектора с нечетными\n"
  "порядковыми номерами (считая, что начальный элемент вектора имеет\n"
  "порядковый номер~1). Использовать функцию-член erase\n"
  "в цикле с параметром-итератором."
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
  "Дан дек {D} с количеством элементов, кратным 4. Удалить в первой половине\n"
  "исходного дека все элементы с четными порядковыми номерами (считая,\n"
  "что начальный элемент дека имеет порядковый номер~1).\n"
  "Использовать функцию-член erase в цикле с числовым параметром."
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
  "Решить задачу \\1, используя функцию-член erase\n"
  "в цикле по обратному итератору."
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
  "Дан список {L}. Удалить все элементы исходного списка с четными порядковыми\n"
  "номерами (считая, что начальный элемент списка имеет порядковый номер~1).\n"
  "Использовать функцию-член erase в цикле с параметром-итератором."
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
  "Дан список {L} с количеством элементов, кратным 4. Удалить в первой половине\n"
  "исходного списка все элементы с нечетными порядковыми номерами (считая,\n"
  "что начальный элемент списка имеет порядковый номер~1).\n"
  "Использовать функцию-член erase в цикле с параметром-итератором."
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
  "Решить задачу \\1, используя функцию-член erase\n"
  "в цикле по обратному итератору."
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
  "Дан список {L} с элементами {A}_1, {A}_2, {A}_3, \\., {A}_{N\\-1}, {A}_{N} ({N} \\= четное).\n"
  "Изменить порядок элементов в списке на следующий:\n"
  "{A}_{N}, {A}_1, {A}_{N\\-1}, {A}_2, {A}_{N\\-2}, \\., {A}_{N/2}, {A}_{N/2\\-1}.\n"
  "Для этого использовать два итератора \\Mi\\m и \\Mr\\m, связав их с первым и последним\n"
  "элементом списка. В цикле, который должен повторяться {N}/2 раз,\n"
  "вызывать функцию-член splice с первым параметром \\Mi++\\m и третьим параметром \\Mr--\\m."
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
  "Даны два списка {L}_1 и {L}_2 с одинаковым количеством элементов~{N}. Получить\n"
  "в списке {L}_2 комбинированный набор элементов исходных списков вида\n"
  "{A}_1, {B}_1, {A}_2, {B}_2, {A}_3, {B}_3, \\., {A}_{N}, {B}_{N}, где {A}_{I} обозначают элементы исходного\n"
  "списка~{L}_1, а~{B}_{I}~\\= элементы исходного списка~{L}_2. Для этого использовать\n"
  "итераторы \\Mi1\\m (для списка~{L}_1) и~\\Mi2\\m (для списка~{L}_2), связав их с первым\n"
  "элементом соответствующего списка. В цикле, который должен повторяться\n"
  "{N}~раз, вызывать функцию-член splice для списка~{L}_2 с первым параметром \\M++i2\\m\n"
  "и третьим параметром~\\Mi1++\\m."
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
  CreateGroup("STL2Seq", "Последовательные контейнеры", 
    "М. Э. Абрамян, 2016, 2021", "qwq2334#EnTopic<Sequence containers>#sd255445hfgd5ttd", 34, InitTask_);

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
