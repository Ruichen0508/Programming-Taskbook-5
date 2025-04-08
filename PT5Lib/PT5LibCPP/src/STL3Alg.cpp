#include <string>
#include <fstream>
#include <vector>
#include <deque>
#include <list>
#include <algorithm>
#include <iterator>
#include <functional>
#include <numeric>
#include "pt5taskmaker.h"

namespace STL3
{

vector<int> vn, vn1, vn2, vn3;
vector<double> vr;
vector<string> vs, vs1;

string abc("0123456789abcdefghijklmnopqrstuvwxyz");
string ABCext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");
string abcext("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

const char* tit1 = "Алгоритмы поиска";
const char* tit2 = "Базовые модифицирующие алгоритмы. Итераторы вставки";
const char* tit3 = "Сортировка и слияние";
const char* tit4 = "Перестановки и работа с кучей";
const char* tit5 = "Численные алгоритмы";

void MakeVN(int n, int a1, int b1)
{
  vn.clear();
  vn.reserve(50);
  for (int i = 0; i < n; i++)
    vn.push_back(RandomN(a1,b1));
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

void ResultVR1(const char* comm)
{
  int n = vr.size();
  int y = (n <= 8) ? 3 : 2;
  int p = 2;
  if (comm != "")
    ResultComment(comm,p,y);
  p += 2;
  if (comm != "")
    ResultComment(":",p,y);
  p += 5;
  int p0 = p;
  SetPrecision(1);
  for (int i = 0; i < n; i++)
  {
      ResultR("",vr[i],p,y,17);
          p += 17;
          if (p > 64)
          {
                  y++;
                  p = p0;
          }
  }
  SetPrecision(2);
}

int linestotal = 0;

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
  linestotal = 1;
  int out = 1;
  for (int i = 0; i < n; i++)
  {
      ResultS("",vs[i].c_str(),p,y);
          out = 0;
          p += step;
          if (p > 78 - step)
          {
                  y++;
                  linestotal++;
                  out = 1;
                  p = p0;
          }
  }
  linestotal -= out;
}



void Stl1()
{
  CreateTask(tit1);
  TaskText(
  "Дан вектор {V}. Удалить второй из элементов вектора, равных нулю.\n"
  "Если нулевых элементов меньше двух, то вектор не изменять.\n"
  "Использовать два вызова алгоритма find и функцию-член erase."
  );
  MakeVN(RandomN(10, 34), 1, 9);
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
  case 5:      
          m = 0;          break;
  case 4: case 8:
      m = 1;      break;
  case 2: case 7:
      m = 2;      break;
  case 6: 
      m = 3;      break;
  }
  int n = vn.size();
  for (int k = 0; k < m; k++)
          vn[RandomN(0,n-1)] = 0;
  DataVN("V", 3);
  auto i = find(vn.begin(), vn.end(), 0);
  if (i != vn.end())
    i = find(++i, vn.end(), 0);
  if (i != vn.end())
          vn.erase(i);
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl2()
{
  CreateTask(tit1);
  TaskText(
  "Дан дек {D}. Удалить последний нулевой элемент дека. Если нулевых\n"
  "элементов нет, то дек не изменять. Использовать алгоритм find\n"
  "с обратными итераторами и функцию-член erase."
  );
  MakeVN(RandomN(10, 34), 1, 9);
  int m = RandomN(0,3);
  switch (CurrentTest())
  {
  case 5:  case 8: 
          m = 0;          break;
  case 4: case 7:
      m = 1;      break;
  case 2: 
      m = 2;      break;
  case 6:
      m = 3;      break;
  }
  int n = vn.size();
  for (int k = 0; k < m; k++)
          vn[RandomN(0,n-1)] = 0;
  DataVN("D", 3);
  auto i = find(vn.rbegin(), vn.rend(), 0);
  if (i != vn.rend())
          vn.erase(--i.base());
  ResultVN("D", 3);
  SetTestCount(9);
}

void Stl3()
{
  CreateTask(tit1);
  TaskText(
  "Дан список {L}. Удалить первый и последний нулевой элемент списка.\n"
  "Если нулевых элементов нет, то список не изменять, если нулевой элемент\n"
  "всего один, то удалить только его. Использовать два вызова\n"
  "алгоритма find и два вызова функции-члена erase."
  );
  MakeVN(RandomN(10, 34), 1, 9);
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 5:  
          m = 0;          break;
  case 4: 
      m = 1;      break;
  case 2: 
      m = 2;      break;
  case 6:
      m = 3;      break;
  case 7:
      m = 5;      break;
  case 8:
      m = 4;      break;
  }
  int n = vn.size();
  for (int k = 0; k < m; k++)
          vn[RandomN(0,n-1)] = 0;
  DataVN("L", 3);
  auto i = find(vn.rbegin(), vn.rend(), 0);
  if (i != vn.rend())
          vn.erase(--i.base());
  auto i1 = find(vn.begin(), vn.end(), 0);
  if (i1 != vn.end())
          vn.erase(i1);
  ResultVN("L", 3);
  SetTestCount(9);
}

void Stl4()
{
  CreateTask(tit1);
  TaskText(
  "Дан список {L}. Удалить все элементы списка, расположенные между первым\n"
  "и вторым отрицательным элементом (не включая сами отрицательные элементы).\n"
  "Если список не содержит отрицательных элементов, то не изменять его,\n"
  "если отрицательный элемент всего один, то удалить все элементы, следующие\n"
  "за этим отрицательным элементом. Использовать два вызова\n"
  "алгоритма find\\_if и один вызов функции-члена erase."
  );
  MakeVN(RandomN(10, 34), 0, 9);
  int m = RandomN(0,10);
  if (m > 6) 
          m = 1;
  switch (CurrentTest())
  {
  case 5:  
          m = 0;          break;
  case 4:  
      m = 1;      break;
  case 2: 
      m = 2;      break;
  case 3: 
      m = 6;      break;
  case 6:
      m = 3;      break;
  case 7:
      m = 5;      break;
  case 8:
      m = 4;      break;
  }
  int n = vn.size();
  if (m == 6)
  {
          int k = RandomN(0, n-2);
          vn[k] = RandomN(-9,-1);
          vn[k+1] = RandomN(-9,-1);
  }
  else
  for (int k = 0; k < m; k++)
          vn[RandomN(0,n-1)] = RandomN(-9,-1);
  DataVN("L", 3);
  auto f = [](int e){return e < 0;};
  auto i = find_if(vn.begin(), vn.end(), f);
  if (i != vn.end())
  {
          ++i;
      auto i1 = find_if(i, vn.end(), f);
          vn.erase(i, i1);
  }
  ResultVN("L", 3);
  SetTestCount(9);
}

void Stl5()
{
  CreateTask(tit1);
  TaskText(
  "Дан список {L}, содержащий как отрицательные, так и положительные элементы.\n"
  "Вставить нулевой элемент после первого отрицательного элемента и перед\n"
  "последним положительным элементом. Использовать два вызова\n"
  "алгоритма find\\_if и два вызова функции-члена insert."
  );
  int m1 = RandomN(0,1) * 2 - 1;
  if (m1 == -1)
      MakeVN(RandomN(6, 15), 1, 9);
  else
      MakeVN(RandomN(6, 15), -9, -1);
  int n = vn.size();
  int m = RandomN(1,n - 1);
  switch (CurrentTest())
  {
  case 5:  
          m = 1;          break;
  case 4:  
      m = 2;      break;
  case 2: 
      m = 3;      break;
  case 3: 
      m = 5;      break;
  case 6:
      m = n-1;    break;
  }
  for (int k = 0; k < m; k++)
          vn[RandomN(0,n-1)] = RandomN(1,9)*m1;
  DataVN("L", 3);
  auto i = find_if(vn.begin(), vn.end(), [](int e){return e < 0;});
  vn.insert(++i, 0);
  auto i1 = find_if(vn.rbegin(), vn.rend(), [](int e){return e > 0;});
  vn.insert(--i1.base(), 0);
  ResultVN("L", 3);
  SetTestCount(9);
}

void Stl6()
{
  CreateTask(tit1);
  TaskText(
  "Даны вектор {V} и список {L}; вектор {V} имеет четное количество элементов.\n"
  "Продублировать последний элемент списка, совпадающий с каким-либо\n"
  "элементом из первой половины исходного вектора. Если список не содержит\n"
  "требуемых элементов, то не изменять его. Использовать\n"
  "алгоритм find\\_first\\_of и функцию-член insert для списка."
  );
  MakeVN(RandomN(1, 5)*2, 1, 9);
  vn1 = vn;
  MakeVN(RandomN(5, 16), 1, 9);
  vn2 = vn;
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 3:    case 5:  

          m = 0;          break;
  case 2:    case 4:  
      m = 1;      break;
  }
  if (m == 0)
  {
          for (auto j = vn1.begin(); j != vn1.begin() + vn1.size()/2; j++)
                  *j = RandomN(6, 9);
          for (auto j = vn2.begin(); j != vn2.end(); j++)
                  *j = RandomN(1, 5);
  }
  vn = vn1;
  DataVN("V", 3);
  vn = vn2;
  DataVN("L", 4);
  auto i = find_first_of(vn.rbegin(), vn.rend(), vn1.begin(), vn1.begin() + vn1.size()/2);
  if (i != vn.rend())
          vn.insert(i.base(), *i);
  ResultVN("L", 3);
  SetTestCount(7);
}

void Stl7()
{
  CreateTask(tit1);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Добавить нулевой элемент\n"
  "перед последним элементом в первой половине вектора, совпадающим\n"
  "с каким-либо элементом из второй половины этого же вектора. Если вектор\n"
  "не содержит требуемых элементов, то не изменять его. Использовать\n"
  "алгоритм find\\_first\\_of и функцию-член insert."
  );
  int m = RandomN(0,1);
  switch (CurrentTest())
  {
  case 3:    case 5:  
          m = 0;          break;
  case 2:    case 4:  
      m = 1;      break;
  }
  vector<int>::reverse_iterator i;
  do
  {
    MakeVN(RandomN(1, 5)*2, 1, 9);
    i = find_first_of(vn.rbegin() + vn.size()/2, vn.rend(), vn.begin() + vn.size()/2, vn.end());
  }
  while (m == 0 && i == vn.rend() || m == 1 && i != vn.rend());
  DataVN("V", 3);
  if (i != vn.rend())
          vn.insert(--i.base(), 0);
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl8()
{
  CreateTask(tit1);
  TaskText(
  "Дано целое число {K} (>\\,0) и вектор {V}, содержащий только нули и единицы.\n"
  "Удалить в векторе {V} последний набор из {K} подряд расположенных нулей\n"
  "(если в этом наборе имеется больше {K} нулей, то требуется удалить только\n"
  "последние {K} из них). Если вектор не содержит требуемого набора нулей,\n"
  "то не изменять его. Использовать алгоритм search\\_n и функцию-член erase,\n"
  "а также обратные итераторы."
  );
  int k = RandomN(2,5);
  DataN("K = ", k, 0, 2, 1);
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 3:    case 5:  
          m = 0;          break;
  case 2:    case 4:  
      m = 1;      break;
  }
  vector<int>::reverse_iterator i;
  do
  {
    MakeVN(RandomN(12, 34), 0, 1);
    i = search_n(vn.rbegin(), vn.rend(), k, 0);
  }
  while (m == 0 && i != vn.rend() || m > 0 && i == vn.rend());
  DataVN("V", 3);
  if (i != vn.rend())
          vn.erase(i.base()-k, i.base());
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl9()
{
  CreateTask(tit1);
  TaskText(
  "Дано целое число {K} (>\\,0) и вектор {V}. Продублировать в векторе {V}\n"
  "первый набор из {K} подряд расположенных положительных чисел, вставив\n"
  "после этого набора его копию (если в наборе имеется больше {K} положительных\n"
  "чисел, то лишние числа во внимание не принимаются, и дублируется только\n"
  "начальная часть набора, содержащая {K} чисел). Если вектор не содержит\n"
  "требуемого набора чисел, то не изменять его. Использовать\n"
  "алгоритм search\\_n с параметром \\= функциональным объектом."
  );
  int k = RandomN(2,5);
  DataN("K = ", k, 0, 2, 1);
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 3:    case 5:  
          m = 0;          break;
  case 2:    case 4:  
      m = 1;      break;
  }
  vector<int>::iterator i;
  do
  {
    MakeVN(RandomN(12, 29), -9, 9);
        i = search_n(vn.begin(), vn.end(), k, 0, [](int e, int e1){return e > 0;});
  }
  while (m == 0 && i != vn.end() || m > 0 && i == vn.end());
  DataVN("V", 3);
  if (i != vn.end())
          vn.insert(i+k, i, i+k);
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl10()
{
  CreateTask(tit1);
  TaskText(
  "Даны список {L} и дек {D}; дек {D} содержит четное количество элементов.\n"
  "Продублировать в деке {D} первый набор элементов, расположенный в его второй\n"
  "половине и совпадающий с элементами списка {L}, взятыми в обратном порядке.\n"
  "Например, для списка 1, 2 и дека 2, 1, 1, 2, 3, 2, 1, 1, 2, 1 дек должен\n"
  "быть преобразован следующим образом: 2, 1, 1, 2, 3, 2, 1, (2, 1,) 1, 2, 1\n"
  "(вставленные элементы заключены в скобки). Если дек не содержит\n"
  "требуемого набора чисел, то не изменять его. Использовать\n"
  "алгоритм search и функцию-член insert."
  );
  int k = RandomN(2,5);
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 4:    case 7:  
          m = 0;          break;
  case 3:    case 5:  
      m = 1;      break;
  case 6:    case 8:  
      m = 3;      break;
  }
  MakeVN(k, 1, 9);
  DataVN("L", 2);
  vn1 = vn;
  int m2 = RandomN(5,14);
  MakeVN(m2*2, 1, 9);
  if (m > 2 || m == 0)
  copy(vn1.rbegin(), vn1.rend(), vn.begin() + RandomN(0, m2));
  if (m != 0)
  {
          copy(vn1.rbegin(), vn1.rend(), vn.begin() + m2 + RandomN(0, m2-k));
          if (m > 1)
            copy(vn1.rbegin(), vn1.rend(), vn.begin() + m2 + RandomN(0, m2-k));
  }
  DataVN("D", 3);
  auto i = search(vn.begin()+m2, vn.end(), vn1.rbegin(), vn1.rend());
  if (i != vn.end())
          vn.insert(i+k, i, i+k);
  ResultVN("D", 3);
  SetTestCount(9);
}

void change11(int k, int m2)
{
        int m1 = RandomN(0, m2-k-1);
        for (int i = 0; i < k; ++i)
                vn[m1 + i] = vn1[i] % 2 == 0 ? RandomN(1,4)*2 : RandomN(1,5)*2-1;
}

void Stl11_12(int k0)
{
  CreateTask(tit1);
  if (k0 == 11)
  TaskText(
  "Даны вектор {V} и дек {D}; дек {D} содержит четное количество элементов. Удалить\n"
  "в векторе {V} последний набор элементов, в котором четные и нечетные числа\n"
  "располагаются в том же порядке, что и в первой половине дека {D}. Например,\n"
  "для дека 1, 2, 3, 4, 5, 6 и вектора 11, 14, (15, 16, 17,) 17, 18, 10\n"
  "в векторе должны быть удалены элементы, заключенные в скобки. Если вектор\n"
  "не содержит требуемого набора чисел, то не изменять его. Использовать\n"
  "алгоритм search с параметром \\= функциональным объектом и функцию-член erase."
  );
  else
  TaskText(
  "Решить задачу \\1, используя алгоритм find\\_end\n"
  "с параметром \\= функциональным объектом и функцию-член erase."
  );
  int k = RandomN(2,5);
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 4:    case 7:  
          m = 0;          break;
  case 3:    case 5:  
      m = 1;      break;
  case 6:    case 8:  
      m = 3;      break;
  }
  MakeVN(k*2, 1, 9);
  vn1 = vn;
  int m2 = RandomN(10,34);
  MakeVN(m2, 1, 9);
  if (m != 0)
  {
      change11(k, m2);
      for (int j = m+1; j <= 5; ++j)
        change11(k, m2);
  }
  DataVN("V", 2);
  auto i = search(vn.rbegin(), vn.rend(), vn1.rend()-k, vn1.rend(), 
          [](int e1, int e2){ return (e1+e2) % 2 == 0;});
  vn2.clear();
  if (i != vn.rend())
          vn.erase(i.base()-k, i.base());
  ResultVN("V", 3);
  vn = vn1;
  DataVN("D", 4);
  SetTestCount(9);
}

void Stl13()
{
  CreateTask(tit1);
  TaskText(
  "Дан список {L}. Удвоить значения в последней паре соседних совпадающих\n"
  "элементов. Например, список 1, 2, 2, 3, 3, 1, 2, 2, 2, 4 должен быть\n"
  "преобразован следующим образом: 1, 2, 2, 3, 3, 1, 2, 4, 4, 4. Если список\n"
  "не содержит соседних совпадающих элементов, то не изменять его.\n"
  "Использовать алгоритм adjacent\\_find и обратные итераторы."
  );
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 3:    case 5:  
          m = 0;          break;
  case 2:    case 4:  
      m = 1;      break;
  }
  vector<int>::reverse_iterator i, i1;
  do
  {
          i1 = vn.rend();
    MakeVN(RandomN(12, 34), 1, 9);
    i = adjacent_find(vn.rbegin(), vn.rend());
    if (i != vn.rend())
          i1 = adjacent_find(i+1, vn.rend());
  }
  while (m == 0 && i != vn.rend() || m > 0 && (i == vn.rend() || i1 == vn.rend()));
  DataVN("L", 3);
  if (i != vn.rend())
  {
          *i *= 2;
          *(++i) *= 2;
  }
  ResultVN("L", 3);
  SetTestCount(7);
}

void Stl14()
{
  CreateTask(tit1);
  TaskText(
  "Дан вектор {V}. Обнулить первую пару соседних элементов, имеющих одинаковую\n"
  "четность. Например, список 1, 2, 3, 4, 6, 8, 3, 1 должен быть преобразован\n"
  "следующим образом: 1, 2, 3, 0, 0, 8, 3, 1. Если список не содержит\n"
  "соседних элементов с одинаковой четностью, то не изменять его. Использовать\n"
  "алгоритм adjacent\\_find с параметром \\= функциональным объектом."
  );
  int m = RandomN(0,8);
  switch (CurrentTest())
  {
  case 3:    case 5:  
          m = 0;          break;
  case 2:    
      m = 3;      break;
  case 4:  
      m = 7;      break;
  }
  vector<int>::iterator i, i1;
  do
  {
          i1 = vn.end();
    MakeVN(RandomN(12, 34), 1, 9);
        if (m == 0)
                for (int i0 = 1; i0 < (int)vn.size(); ++i0)
                        vn[i0] = vn[i0-1] % 2 == 0 ? RandomN(1,5)*2-1 : RandomN(1,4)*2;
        i = adjacent_find(vn.begin(), vn.end(), [](int e1, int e2){return (e1+e2)%2 == 0;});
    if (i != vn.end())
          i1 = adjacent_find(i+1, vn.end());
  }
  while (m == 0 && i != vn.end() || m > 0 && (i != vn.begin() + m || i1 == vn.end()));
  DataVN("V", 3);
  if (i != vn.end())
  {
          *i = 0;
          *(++i) = 0;
  }
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl15()
{
  CreateTask(tit1);
  TaskText(
  "Дан дек {D}. Удвоить значения всех пар соседних элементов, исходные значения\n"
  "которых отличаются только знаком (преобразованные элементы не должны\n"
  "повторно анализироваться при последующих вызовах алгоритма). Например,\n"
  "дек 1, \\-1, 2, \\-3, 3, 3, \\-3, 6 должен быть преобразован следующим образом:\n"
  "2, \\-2, 2, \\-6, 6, 6, \\-6, 6. Использовать алгоритм adjacent\\_find\n"
  "с параметром \\= функциональным объектом в цикле по итератору дека."
  );
  int m = RandomN(0,5);
  switch (CurrentTest())
  {
  case 4:    case 6:  
          m = 0;          break;
  case 5:    
      m = 3;      break;
  case 3:  
      m = 7;      break;
  }
  int i1 = 0;
  vector<int>::iterator i;
  do
  {
        i1 = 0;
    MakeVN(RandomN(10, 17), -45, 45);
        for (int i2 = 0; i2 < m; ++i2)
        {
                int kk = RandomN(0, vn.size() - 3);
                vn[kk + 1] = -vn[kk];
                if (RandomN(0,1) == 0)
                  vn[kk + 2] = vn[kk] * 2;
        }
        auto i = adjacent_find(vn.begin(), vn.end(), [](int e1, int e2){return (e1+e2) == 0;});
        while (i != vn.end())
        {
                i1++;
            i = adjacent_find(i+2, vn.end(), [](int e1, int e2){return (e1+e2) == 0;});
        }
  }
  while (m == 0 && i1 != 0 || m > 0 && i1 < m);
  DataVN("D", 3);
        i1 = 0;
        i = adjacent_find(vn.begin(), vn.end(), [](int e1, int e2){return (e1+e2) == 0;});
        while (i != vn.end())
        {
                *i++ *= 2;
                *i++ *= 2;
            i = adjacent_find(i, vn.end(), [](int e1, int e2){return (e1+e2) == 0;});
        }
  ResultVN("D", 3);
  SetTestCount(7);
}

void Stl16()
{
  CreateTask(tit2);
  TaskText(
  "Даны числа {A} и {B} и векторы {V}_1 и {V}_2, каждый из которых содержит\n"
  "не менее 10~элементов. Заполнить первые 5~элементов каждого вектора\n"
  "значениями~{A}, а последние 5~\\= значениями~{B}. При преобразовании вектора {V}_1\n"
  "использовать два вызова алгоритма fill, при преобразовании вектора {V}_2\n"
  "использовать два вызова алгоритма fill\\_n."
  );
  int a = RandomN(1,99);
  int b = RandomN(-99,1);
  DataN("A = ", a, xLeft, 2, 1);
  DataN("B = ", b, xRight, 2, 1);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V_1", 3);
  fill(vn.begin(), vn.begin()+5, a);
  fill_n(vn.rbegin(), 5, b);
  ResultVN("V_1", 3);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V_2", 4);
  fill(vn.begin(), vn.begin()+5, a);
  fill_n(vn.rbegin(), 5, b);
  ResultVN("V_2", 4);
  SetTestCount(5);
}

void Stl17()
{
  CreateTask(tit2);
  TaskText(
  "Даны числа {A} и {B} и векторы {V}_1 и {V}_2. Добавить в начало каждого вектора\n"
  "5~элементов со значениями {A}, а в конец~\\= 5~элементов со значениями {B}.\n"
  "При преобразовании вектора {V}_1 использовать два вызова алгоритма fill\\_n\n"
  "с функциями inserter и back\\_inserter (данные функции возвращают итераторы\n"
  "вставки), при преобразовании вектора {V}_2 использовать два вызова\n"
  "функции-члена insert. \\P\\SЗамечание.\\s Второй способ является более эффективным."
  );
  int a = RandomN(1,99);
  int b = RandomN(-99,1);
  DataN("A = ", a, xLeft, 2, 1);
  DataN("B = ", b, xRight, 2, 1);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V_1", 3);
  fill_n(inserter(vn, vn.begin()), 5, a);
  fill_n(back_inserter(vn), 5, b);
  ResultVN("V_1", 2);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("V_2", 4);
  fill_n(inserter(vn, vn.begin()), 5, a);
  fill_n(back_inserter(vn), 5, b);
  ResultVN("V_2", 4);
  SetTestCount(5);
}

void Stl18()
{
  CreateTask(tit2);
  TaskText(
  "Дано число {N} (>\\,0) и дек {D}, содержащий не менее 2{N} элементов. Заполнить\n"
  "первые {N}~элементов дека последовательностью чисел 1, 2, \\.,~{N}, а последние\n"
  "{N}~элементов дека~\\= последовательностью {N}, {N}\\-1, \\.,~2,~1. Использовать\n"
  "два вызова алгоритма generate с одинаковым параметром \\= функциональным\n"
  "объектом, а также обратные итераторы."
  );
  int n = RandomN(1,9);
  DataN("N = ", n, 0, 2, 1);
  MakeVN(RandomN(2*n, 34), -99, 99);
  DataVN("D", 3);
  int i = 1;
  auto f = [&i](){return i++;};
  generate(vn.begin(), vn.begin()+n, f);
  i = 1;
  generate(vn.rbegin(), vn.rbegin()+n, f);
  ResultVN("D", 3);
  SetTestCount(5);
}

void Stl19()
{
  CreateTask(tit2);
  TaskText(
  "Дано число {N} (>\\,0) и дек {D}. Добавить в начало дека последовательность\n"
  "чисел 1, 2, \\.,~{N}, а в его конец \\= последовательность {N}, {N}\\-1, \\.,~2,~1.\n"
  "Использовать два вызова алгоритма generate\\_n с одинаковым\n"
  "параметром \\= функциональным объектом, а также итераторы вставки,\n"
  "возвращаемые функциями front\\_inserter и back\\_inserter."
  );
  int n = RandomN(1,9);
  DataN("N = ", n, 0, 2, 1);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("D", 3);
  int i = 1;
  generate_n(inserter(vn, vn.begin()), n, [&i](){return i++;});
  i = n;
  generate_n(back_inserter(vn), n, [&i](){return i--;});
  ResultVN("D", 3);
  SetTestCount(5);
}

void Stl20()
{
  CreateTask(tit2);
  TaskText(
  "Даны списки {L}_1 и {L}_2, каждый из которых содержит четное количество\n"
  "элементов. Поменять местами первую и вторую половину каждого списка\n"
  "(например, список 1, 2, 3, 4 должен быть преобразован следующим образом:\n"
  "3, 4, 1, 2). Для первого списка использовать алгоритм swap\\_ranges,\n"
  "для второго~\\= алгоритм rotate. Использовать также функцию advance."
  );
  MakeVN(RandomN(9, 17)*2, -99, 99);
  DataVN("L_1", 2);
  swap_ranges(vn.begin(), vn.begin()+vn.size()/2, vn.begin()+vn.size()/2);
  ResultVN("L_1", 2);
  MakeVN(RandomN(9, 17)*2, -99, 99);
  DataVN("L_2", 4);
  rotate(vn.begin(), vn.begin()+vn.size()/2, vn.end());
  ResultVN("L_2", 4);
  SetTestCount(5);
}

void Stl21()
{
  CreateTask(tit2);
  TaskText(
  "Дано число {K} (0~<~{K}~<~10) и списки {L}_1 и {L}_2, каждый из которых содержит\n"
  "не менее 10~элементов. Выполнить для списка {L}_1 циклический сдвиг\n"
  "элементов вправо на {K} позиций, а для списка {L}_2 \\= циклический сдвиг\n"
  "влево на {K} позиций. Использовать алгоритм rotate и функцию advance."
  );
  int k = RandomN(1,9);
  DataN("K = ", k, 0, 2, 1);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("L_1", 3);
  rotate(vn.begin(), vn.end()-k, vn.end());
  ResultVN("L_1", 3);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("L_2", 4);
  rotate(vn.begin(), vn.begin()+k, vn.end());
  ResultVN("L_2", 4);
  SetTestCount(5);
}

void Stl22()
{
  CreateTask(tit2);
  TaskText(
  "Дано число {K} (0~<~{K}~<~5) и список {L}, содержащий не менее 10~элементов.\n"
  "Набор из первых 5~элементов списка скопировать в конец списка,\n"
  "выполнив для этой копии циклический сдвиг на {K} позиций вправо,\n"
  "а набор из последних 5~элементов исходного списка скопировать в начало\n"
  "списка, выполнив для этой копии циклический сдвиг на {K} позиций влево.\n"
  "Использовать два вызова алгоритма rotate\\_copy и итераторы вставки,\n"
  "а также функцию advance."
  );
  int k = RandomN(1,4);
  DataN("K = ", k, 0, 3, 1);
  MakeVN(RandomN(10, 17), -99, 99);
  DataVN("L", 4);
  rotate_copy(vn.begin(), vn.begin()+5-k, vn.begin()+5, back_inserter(vn));
  vn1.clear();
  rotate_copy(vn.end()-10, vn.end()-10+k, vn.end()-5, inserter(vn1, vn1.begin()));
  copy(vn1.begin(), vn1.end(), inserter(vn, vn.begin()));
  ResultVN("L", 3);
  SetTestCount(5);
}

void Stl23()
{
  CreateTask(tit2);
  TaskText(
  "Даны списки {L}_1 и {L}_2, у каждого из которых количество элементов делится\n"
  "на~4. В первом списке инвертировать (расположить в обратном порядке)\n"
  "первую половину элементов, во втором списке~\\= вторую половину.\n"
  "Для первого списка использовать алгоритм swap\\_ranges и обратные итераторы,\n"
  "для второго~\\= алгоритм reverse. Использовать также функцию advance."
  );
  MakeVN(RandomN(3, 8)*4, -99, 99);
  DataVN("L_1", 2);
  swap_ranges(vn.begin(), vn.begin()+vn.size()/4, vn.rbegin()+vn.size()/2);
  ResultVN("L_1", 2);
  MakeVN(RandomN(3, 8)*4, -99, 99);
  DataVN("L_2", 4);
  reverse(vn.begin()+vn.size()/2, vn.end());
  ResultVN("L_2", 4);
  SetTestCount(5);
}

void Stl24()
{
  CreateTask(tit2);
  TaskText(
  "Даны списки {L}_1 и {L}_2, каждый из которых содержит четное количество\n"
  "элементов. В каждом списке продублировать первую половину, добавив\n"
  "ее элементы в конец списка в обратном порядке. Для первого списка\n"
  "использовать алгоритм reverse\\_copy и итератор вставки, для второго~\\=\n"
  "функцию-член insert и обратные итераторы. Использовать также функцию advance.\n"
  "\\P\\SЗамечание.\\s Второй способ является более эффективным."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L_1", 2);
  reverse_copy(vn.begin(), vn.begin()+vn.size()/2, back_inserter(vn));
  ResultVN("L_1", 2);
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L_2", 4);
  vn.insert(vn.end(), vn.rend()-vn.size()/2, vn.rend());
  ResultVN("L_2", 4);
  SetTestCount(7);
}

void Stl25()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. В первой половине исходного\n"
  "вектора заменить все отрицательные числа на~\\-1, а во второй~\\=\n"
  "все положительные числа на~1. Использовать два вызова алгоритма replace\\_if\n"
  "с различными параметрами \\= функциональными объектами."
  );
  MakeVN(RandomN(6, 17)*2, -99, 99);
  DataVN("V", 3);
  replace_if(vn.begin(), vn.begin()+vn.size()/2, [](int e){return e < 0;}, -1);
  replace_if(vn.begin()+vn.size()/2, vn.end(), [](int e){return e > 0;}, 1);
  ResultVN("V", 3);
  SetTestCount(5);
}

void Stl26()
{
  CreateTask(tit2);
  TaskText(
  "Дан список {L} с четным количеством элементов. Скопировать в конец списка\n"
  "все элементы, расположенные в его первой половине, заменив при этом\n"
  "отрицательные элементы на нули и расположив скопированные элементы\n"
  "в обратном порядке. Использовать алгоритм replace\\_copy\\_if,\n"
  "итератор вставки и обратные итераторы, а также функцию advance."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L", 3);
  replace_copy_if(vn.rbegin()+vn.size()/2, vn.rend(), back_inserter(vn), 
          [](int e){return e < 0;}, 0);
  ResultVN("L", 3);
  SetTestCount(7);
}

void Stl27()
{
  CreateTask(tit2);
  TaskText(
  "Дан дек {D} с четным количеством элементов. Решить для него\n"
  "задачу \\1. Поскольку операция вставки делает все итераторы дека\n"
  "недействительными, для решения задачи использовать вспомогательный дек {D}_0.\n"
  "Инициализировать дек {D}_0 первой половиной элементов дека {D}, после чего\n"
  "применить алгоритм replace\\_copy\\_if, используя дек {D}_0 как источник,\n"
  "а дек {D} как приемник данных."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("D", 3);
  replace_copy_if(vn.rbegin()+vn.size()/2, vn.rend(), back_inserter(vn), 
          [](int e){return e < 0;}, 0);
  ResultVN("D", 3);
  SetTestCount(7);
}

void Stl28()
{
  CreateTask(tit2);
  TaskText(
  "Дан список {L} с четным количеством элементов. Скопировать в начало списка\n"
  "все положительные элементы, расположенные в его второй половине, сохранив\n"
  "для них исходный порядок следования. Использовать алгоритм remove\\_copy\\_if\n"
  "и итератор вставки, а также функцию advance."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("L", 3);
  list<int> ln(vn.begin(), vn.end());
  auto it = ln.begin();
  advance(it, ln.size()/2);
  remove_copy_if(it, ln.end(), inserter(ln, ln.begin()), 
          [](int e){return e <= 0;});
  vn.clear();
  copy(ln.begin(), ln.end(), back_inserter(vn));
  ResultVN("L", 3);
  SetTestCount(7);
}

void Stl29()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Решить для него\n"
  "задачу \\1. Поскольку операция вставки в начало вектора делает\n"
  "все его итераторы недействительными, для решения задачи использовать\n"
  "вспомогательный вектор {V}_0. Инициализировать вектор {V}_0 второй половиной\n"
  "элементов вектора {V}, после чего применить алгоритм remove\\_copy\\_if,\n"
  "используя вектор {V}_0 как источник, а вектор {V} как приемник данных."
  );
  MakeVN(RandomN(5, 11)*2, -99, 99);
  DataVN("V", 3);
  list<int> ln(vn.begin(), vn.end());
  auto it = ln.begin();
  advance(it, ln.size()/2);
  remove_copy_if(it, ln.end(), inserter(ln, ln.begin()), 
          [](int e){return e <= 0;});
  vn.clear();
  copy(ln.begin(), ln.end(), back_inserter(vn));
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl30()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Удалить все нулевые\n"
  "элементы, расположенные во второй половине исходного вектора.\n"
  "Использовать алгоритм remove и функцию-член erase."
  );
  MakeVN(RandomN(10, 17)*2, 0, 5);
  DataVN("V", 3);
  auto i = remove(vn.begin() + vn.size()/2, vn.end(), 0); 
  vn.erase(i, vn.end());
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl31()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Удалить все четные\n"
  "элементы, расположенные в первой половине исходного вектора.\n"
  "Использовать алгоритм remove\\_if и функцию-член erase."
  );
  MakeVN(RandomN(10, 17)*2, -99, 99);
  DataVN("V", 3);
  auto i = remove_if(vn.begin(), vn.begin() + vn.size()/2, [](int e){return e % 2 == 0;}); 
  vn.erase(i, vn.begin() + vn.size()/2);
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl32()
{
  CreateTask(tit2);
  TaskText(
  "Дан вектор {V}. В каждой группе подряд расположенных элементов\n"
  "с одинаковой четностью удалить все элементы, кроме начального.\n"
  "Использовать алгоритм unique с параметром \\= функциональным\n"
  "объектом и функцию-член erase."
  );
  MakeVN(RandomN(10, 34), -99, 99);
  DataVN("V", 3);
  auto i = unique(vn.begin(), vn.end(), [](int e1, int e2){return (e1+e2) % 2 == 0;}); 
  vn.erase(i, vn.end());
  ResultVN("V", 3);
  SetTestCount(9);
}

void Stl33()
{
  CreateTask(tit2);
  TaskText(
  "Дан дек {D}. Из каждой группы подряд расположенных положительных,\n"
  "отрицательных или нулевых элементов выбрать последний и скопировать\n"
  "выбранные элементы в том же порядке в начало дека. Например, дек\n"
  "1, 2, \\-3, 4, 0, 0, \\-5, \\-6, 7, 8, 9 должен быть преобразован следующим\n"
  "образом: (2, \\-3, 4, 0, \\-6, 9,) 1, 2, \\-3, 4, 0, 0, \\-5, \\-6, 7, 8, 9\n"
  "(добавленные элементы заключены в скобки). Использовать вспомогательный\n"
  "дек {D}_0 (инициализировав его с помощью дека {D}), алгоритм unique\\_copy\n"
  "с функциональным объектом и обратными итераторами, а также подходящий\n"
  "итератор вставки (в алгоритме дек {D}_0 должен быть источником,\n"
  "а дек {D}~\\= приемником данных)."
  );
  MakeVN(RandomN(10, 17), -9, 9);
  int k = RandomN(1,4);
  int p = RandomN(0, vn.size() - k);
  for (int j = p; j < p + k; ++j)
          vn[j] = 0;
  DataVN("D", 3);
  deque<int> dn1(vn.begin(), vn.end());
  deque<int> dn(dn1);
  auto i = unique_copy(dn1.rbegin(), dn1.rend(), front_inserter(dn),
          [](int e1, int e2){return (e1 == 0 && e2 == 0) || (e1*e2 > 0);}); 
  vn.clear();
  copy(dn.begin(), dn.end(), back_inserter(vn));
  ResultVN("D", 3);
  SetTestCount(9);
}

void Stl34()
{
  CreateTask(tit2);
  TaskText(
  "Дан дек {D} с четным количеством элементов. Заменить в нем\n"
  "вторую половину элементов на удвоенные значения элементов\n"
  "первой половины, расположив эти удвоенные значения в обратном порядке.\n"
  "Использовать алгоритм transform с обратным итератором."
  );
  MakeVN(RandomN(5, 17)*2, -49, 49);
  DataVN("D", 3);
  transform(vn.begin(), vn.begin() + vn.size()/2, vn.rbegin(), 
          [](int e){return 2*e;});
  ResultVN("D", 3);
  SetTestCount(5);
}

void Stl35()
{
  CreateTask(tit2);
  TaskText(
  "Дан список {L} с четным количеством элементов {N}. Добавить в начало списка\n"
  "{N}/2 новых элементов со следующими значениями: {A}_1\\,+\\,{A}_{N}, {A}_2\\,+\\,{A}_{N\\-1}, \\.,\n"
  "{A}_{N/2}\\,+\\,{A}_{N/2+1}, где {A}_1, {A}_2, \\.,~{A}_{N} обозначают исходные элементы списка.\n"
  "Использовать алгоритм transform с обратным итератором и итератором вставки."
  );
  MakeVN(RandomN(5, 11)*2, -49, 49);
  DataVN("L", 3);
  list<int> ln(vn.begin(), vn.end());
  auto it = ln.begin();
  advance(it, ln.size()/2);
  transform(ln.begin(), it, ln.rbegin(), inserter(ln, ln.begin()),
          [](int e1, int e2){return e1 + e2;});
  vn.clear();
  copy(ln.begin(), ln.end(), back_inserter(vn));
  ResultVN("L", 3);
  SetTestCount(5);
}

void Stl36()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V} с нечетным количеством элементов {N} (\\g\\,3). Определить значения\n"
  "трех средних элементов вектора после того, как вектор будет отсортирован\n"
  "(по возрастанию), и вывести их в порядке возрастания. Использовать\n"
  "алгоритмы nth\\_element (для нахождения центрального элемента), max\\_element\n"
  "(для нахождения элемента, предшествующего центральному) и min\\_element\n"
  "(для нахождения элемента, следующего за центральным)."
  );
  int m = RandomN(1,16);
  switch (CurrentTest())
  {
  case 1:    case 6:  
          m = 1;          break;
  case 5:    
      m = 2;      break;
  case 3:  
      m = 16;     break;
  }
  MakeVN(m*2 + 1, -99, 99);
  DataVN("V", 3);
  nth_element(vn.begin(), vn.begin() + vn.size()/2, vn.end());
  auto imax = max_element(vn.begin(), vn.begin() + vn.size()/2);
  auto imin = min_element(vn.begin() + vn.size()/2 + 1, vn.end());
  ResultN(*imax, xLeft, 3, 3);
  ResultN(vn[vn.size()/2], 0, 3, 3);
  ResultN(*imin, xRight, 3, 3);
  SetTestCount(7);
}

void Stl37()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V}, содержащий не менее 3 элементов. Определить значения трех\n"
  "начальных элементов вектора после того, как вектор будет отсортирован\n"
  "(по возрастанию), и вывести их в порядке возрастания. Использовать\n"
  "один вызов алгоритма partial\\_sort и алгоритм copy\n"
  "для вывода требуемых элементов."
  );
  int m = RandomN(3,34);
  switch (CurrentTest())
  {
  case 5:  
          m = 3;          break;
  case 1:    
      m = 10;     break;
  case 3:  
      m = 34;     break;
  }
  MakeVN(m, -99, 99);
  DataVN("V", 3);
  partial_sort(vn.begin(), vn.begin() + 3, vn.end());
  auto i = vn.begin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl38()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V}, содержащий не менее 3 элементов. Определить значения трех\n"
  "конечных элементов вектора после того, как вектор будет отсортирован\n"
  "(по возрастанию) и вывести их в порядке убывания. Использовать один\n"
  "вызов алгоритма partial\\_sort с параметром \\= функциональным объектом\n"
  "greater и алгоритм copy для вывода требуемых элементов."
  );
  int m = RandomN(3,34);
  switch (CurrentTest())
  {
  case 4:  
          m = 3;          break;
  case 1:    
      m = 10;     break;
  case 6:  
      m = 34;     break;
  }
  MakeVN(m, -99, 99);
  DataVN("V", 3);
  partial_sort(vn.begin(), vn.begin() + 3, vn.end(), greater<int>());
  auto i = vn.begin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl39()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Добавить в его конец первую\n"
  "половину элементов, которые содержал бы отсортированный по возрастанию вариант\n"
  "исходного вектора. Использовать функцию-член insert для увеличения количества\n"
  "элементов вектора на требуемую величину и алгоритм partial\\_sort\\_copy."
  );
  int m = RandomN(2,11);
  switch (CurrentTest())
  {
  case 3:  
          m = 2;          break;
  case 1:    
      m = 5;      break;
  case 5:  
      m = 17;     break;
  }
  MakeVN(m*2, -99, 99);
  DataVN("V", 3);
  vn.insert(vn.end(), m, 0);
  partial_sort_copy(vn.begin(), vn.end() - m, vn.end() - m, vn.end());
  ResultVN("V", 3);
  SetTestCount(7);
}

void Stl40()
{
  CreateTask(tit3);
  TaskText(
  "Дан список {L}. Определить количество четных и нечетных чисел в исходном\n"
  "списке (вначале вывести количество четных, затем количество нечетных\n"
  "чисел). Использовать алгоритм partition и два вызова\n"
  "функции distance для итераторов."
  );
  int m = RandomN(2,34);
  int n = RandomN(0,6);
  switch (CurrentTest())
  {
  case 3:  
          m = 2;          break;
  case 4:    
      m = 9;    n = 0;  break;
  case 5:  
      m = 17;   n = 1;  break;
  case 6:  
      m = 34;   n = 2;  break;
  }
  MakeVN(m, -99, 99);
  if (n == 0)
          for (auto i = vn.begin(); i != vn.end(); ++i)
                  *i = RandomN(-49,49)*2;
  else if (n == 1)
          for (auto i = vn.begin(); i != vn.end(); ++i)
                  *i = RandomN(-49,49)*2+1;
  DataVN("L", 3);
  auto res = partition(vn.begin(), vn.end(), [](int e){return e % 2 == 0;});
  ResultN("Количество четных чисел: ", res - vn.begin(), xLeft, 3, 2);
  ResultN("Количество нечетных чисел: ", vn.end() - res, xRight, 3, 2);
  SetTestCount(7);
}

void Stl41()
{
  CreateTask(tit3);
  TaskText(
  "Дан список {L}. Перегруппировать элементы списка, расположив в нем вначале\n"
  "положительные, а затем неположительные элементы (порядок расположения\n"
  "элементов в каждой группе должен совпадать с исходным).\n"
  "Использовать алгоритм stable\\_partition."
  );
  MakeVN(RandomN(10, 34), -99, 99);
  for (auto i = vn.begin(); i != vn.end(); ++i)
          if (RandomN(0,6) == 0)
          *i = 0;
  DataVN("L", 3);
  stable_partition(vn.begin(), vn.end(), [](int e){return e > 0;});
  ResultVN("L", 3);
  SetTestCount(5);
}

void Stl42()
{
  CreateTask(tit3);
  TaskText(
  "Дан список {L}. Перегруппировать элементы списка, расположив в нам вначале\n"
  "отрицательные, затем нулевые, а затем положительные элементы (порядок\n"
  "расположения элементов в каждой группе должен совпадать с исходным).\n"
  "Использовать два вызова алгоритма stable\\_partition."
  );
  MakeVN(RandomN(10, 34), -99, 99);
  for (auto i = vn.begin(); i != vn.end(); ++i)
          if (RandomN(0,6) == 0)
          *i = 0;
  DataVN("L", 3);
  auto i = stable_partition(vn.begin(), vn.end(), [](int e){return e <= 0;});
  stable_partition(vn.begin(), i, [](int e){return e < 0;});
  ResultVN("L", 3);
  SetTestCount(5);
}

void Stl43()
{
  CreateTask(tit3);
  TaskText(
  "Дан список {L} с четным количеством элементов. Перегруппировать элементы\n"
  "списка, расположив в нем вначале все четные элементы из первой половины\n"
  "исходного списка, затем все нечетные элементы, а затем~\\= все четные\n"
  "элементы из второй половины списка (порядок расположения элементов\n"
  "в каждой группе должен совпадать с исходным). Использовать\n"
  "два вызова алгоритма stable\\_partition."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  for (auto i = vn.begin(); i != vn.end(); ++i)
          if (RandomN(0,6) == 0)
          *i = 0;
  DataVN("L", 3);
  stable_partition(vn.begin(), vn.begin() + vn.size()/2, [](int e){return e % 2 == 0;});
  stable_partition(vn.begin() + vn.size()/2, vn.end(), [](int e){return e % 2 != 0;});
  ResultVN("L", 3);
  SetTestCount(5);
}

void Stl44()
{
  CreateTask(tit3);
  TaskText(
  "Дан дек {D}. Решить для него задачу \\2, используя один вызов\n"
  "алгоритма stable\\_sort с параметром \\= функциональным объектом."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  for (auto i = vn.begin(); i != vn.end(); ++i)
          if (RandomN(0,6) == 0)
          *i = 0;
  DataVN("D", 3);
  stable_sort(vn.begin(), vn.end(), 
          [](int e1, int e2){return e1 < 0 && e2 >= 0 || e1 == 0 && e2 > 0;});
  ResultVN("D", 3);
  SetTestCount(5);
}

void Stl45()
{
  CreateTask(tit3);
  TaskText(
  "Дан дек {D}, элементами которого являются английские слова. Отсортировать\n"
  "его элементы по возрастанию их длин, а элементы одинаковой длины~\\=\n"
  "в алфавитном порядке. Использовать алгоритм sort для сортировки\n"
  "по алфавиту и затем алгоритм stable\\_sort с параметром \\=\n"
  "функциональным объектом для сортировки по длине. Выводить новое\n"
  "содержимое дека после применения каждого алгоритма."
  );
  MakeVS(RandomN(10, 16));
  DataVS("D", 2);
  sort(vs.begin(), vs.end());
  ResultVS("D", 1);
  stable_sort(vs.begin(), vs.end(), 
          [](string e1, string e2){return e1.size() < e2.size();});
  ResultVS("D", 1+linestotal);
  SetTestCount(5);
}

void Stl46()
{
  CreateTask(tit3);
  TaskText(
  "Дан дек {D}, элементами которого являются английские слова. Отсортировать\n"
  "его элементы по убыванию их длин, а элементы одинаковой длины~\\=\n"
  "в алфавитном порядке. Использовать единственный вызов алгоритма sort\n"
  "с параметром \\= функциональным объектом, включающим как сравнение\n"
  "строк, так и сравнение их длин."
  );
  MakeVS(RandomN(10, 16));
  DataVS("D", 2);
  sort(vs.begin(), vs.end(), 
          [](string e1, string e2){return e1.size() > e2.size() ||
          e1.size() == e2.size() && e1 < e2;});
  ResultVS("D", 2);
  SetTestCount(5);
}

void Stl47()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V} с четным количеством элементов. Известно, что первая половина\n"
  "вектора уже отсортирована по возрастанию. Отсортировать все элементы вектора,\n"
  "по возрастанию, выполнив вначале сортировку его второй половины алгоритмом\n"
  "sort, а затем слияние обеих половин алгоритмом inplace\\_merge. Выводить новое\n"
  "содержимое вектора {V} после применения каждого алгоритма."
  );
  MakeVN(RandomN(5, 17)*2, -99, 99);
  sort(vn.begin(), vn.begin() + vn.size()/2);
  DataVN("V", 3);
  sort(vn.begin() + vn.size()/2, vn.end());
  ResultVN("V", 2);
  inplace_merge(vn.begin(), vn.begin() + vn.size()/2, vn.end());
  ResultVN("V", 4);
  SetTestCount(5);
}

void Stl48()
{
  CreateTask(tit3);
  TaskText(
  "Дан вектор {V}, количество элементов которого делится на 3.\n"
  "Известно, что каждая треть вектора уже упорядочена по возрастанию.\n"
  "Решить для исходного вектора задачу \\6, используя два вызова\n"
  "алгоритма inplace\\_merge с одним и тем же параметром \\=\n"
  "функциональным объектом."
  );
  int m = RandomN(4, 11);
  MakeVN(m*3, -99, 99);
  for (auto i = vn.begin(); i != vn.end(); ++i)
          if (RandomN(0,6) == 0)
          *i = 0;
  sort(vn.begin(), vn.begin() + m);
  sort(vn.begin()+m, vn.begin() + 2*m);
  sort(vn.begin()+2*m, vn.begin() + 3*m);
  DataVN("V", 3);
  auto f = [](int e1, int e2){return e1 < 0 && e2 >= 0 || e1 == 0 && e2 > 0;};
  inplace_merge(vn.begin(), vn.begin() + m, vn.begin() + 2*m, f);
  inplace_merge(vn.begin(), vn.begin() + 2*m, vn.begin() + 3*m, f);
  ResultVN("V", 3);
  SetTestCount(5);
}

void Stl49()
{
  CreateTask(tit4);
  TaskText(
  "Дан вектор {V}, элементы которого не упорядочены по убыванию. Получить\n"
  "все перестановки исходных элементов, которые больше исходного вектора\n"
  "в лексикографическом порядке и вывести полученные перестановки\n"
  "по возрастанию их лексикографического порядка (при этом последняя\n"
  "выведенная перестановка должна содержать элементы, упорядоченные\n"
  "по убыванию). Использовать в цикле алгоритм next\\_permutation."
  );
  int n = RandomN(1,6);
  switch (CurrentTest())
  {
  case 3:  
          n = 2;          break;
  case 5:    
      n = 5;  break;
  }
  bool f = true;
  do
  {
  MakeVN(RandomN(4, 6), 0, 9);
  sort(vn.begin(), vn.end(), greater<int>());
  for (int i = 0; i < n; ++i)
  {
      f = prev_permutation(vn.begin(), vn.end());
          if (!f)
                  break;
  }
  }
  while (!f);
  DataVN("V", 3);
  for (int i = 0; i < n; ++i)
  {
      next_permutation(vn.begin(), vn.end());
      ResultVN((string("V") + char(49+i)).c_str(), i+1);
  }
  SetTestCount(7);
}

void Stl50()
{
  CreateTask(tit4);
  TaskText(
  "Дан вектор {V}, элементы которого не упорядочены по убыванию.\n"
  "Решить задачу \\1, используя в цикле алгоритм prev\\_permutation\n"
  "с параметром \\= функциональным объектом greater."
  );
  int n = RandomN(1,6);
  switch (CurrentTest())
  {
  case 3:  
          n = 5;          break;
  case 5:    
      n = 2;  break;
  }
  bool f = true;
  do
  {
  MakeVN(RandomN(4, 6), 0, 9);
  sort(vn.begin(), vn.end(), greater<int>());
  for (int i = 0; i < n; ++i)
  {
      f = prev_permutation(vn.begin(), vn.end());
          if (!f)
                  break;
  }
  }
  while (!f);
  DataVN("V", 3);
  for (int i = 0; i < n; ++i)
  {
      next_permutation(vn.begin(), vn.end());
      ResultVN((string("V") + char(49+i)).c_str(), i+1);
  }
  SetTestCount(7);
}

void Stl51()
{
  CreateTask(tit4);
  TaskText(
  "Дан вектор {V}, содержащий не менее 3 элементов. Решить для него\n"
  "задачу \\13, используя один вызов алгоритма make\\_heap,\n"
  "цикл из трех итераций, в котором вызывается алгоритм pop\\_heap,\n"
  "и алгоритм copy (с обратными итераторами) для вывода требуемых элементов."
  );
  int m = RandomN(3,34);
  switch (CurrentTest())
  {
  case 4:  
          m = 3;          break;
  case 1:    
      m = 10;     break;
  case 6:  
      m = 34;     break;
  }
  MakeVN(m, -99, 99);
  DataVN("V", 3);
  make_heap(vn.begin(), vn.end());
  for (int j=0; j < 3; ++j)
          pop_heap(vn.begin(), vn.end()-j);
  auto i = vn.rbegin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl52()
{   
  CreateTask(tit4);
  TaskText(
  "Дан вектор {V}, содержащий не менее 3 элементов. Решить для него\n"
  "задачу \\15, используя один вызов алгоритма make\\_heap,\n"
  "цикл из трех итераций, в котором вызывается алгоритм pop\\_heap,\n"
  "и алгоритм copy (с обратными итераторами) для вывода требуемых элементов."
  );
  int m = RandomN(3,34);
  switch (CurrentTest())
  {
  case 5:  
          m = 3;          break;
  case 1:    
      m = 10;     break;
  case 3:  
      m = 34;     break;
  }
  MakeVN(m, -99, 99);
  DataVN("V", 3);
  make_heap(vn.begin(), vn.end(), greater<int>());
  for (int j=0; j < 3; ++j)
          pop_heap(vn.begin(), vn.end()-j, greater<int>());
  auto i = vn.rbegin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl53()
{
  CreateTask(tit4);
  TaskText(
  "Дан дек {D}_1, содержащий не менее 3 элементов, и дек {D}_2, содержащий\n"
  "ровно 3~элемента. Определить три максимальных элемента среди всех\n"
  "элементов набора, полученного из дека {D}_1 в результате удаления\n"
  "трех его максимальных элементов и добавления к нему всех элементов\n"
  "из дека {D}_2. Вывести требуемые элементы в порядке убывания. Использовать\n"
  "алгоритмы make\\_heap, pop\\_heap и push\\_heap, а также алгоритм copy\n"
  "(с обратными итераторами) для вывода требуемых элементов. Размеры\n"
  "исходных деков не изменять, алгоритм make\\_heap использовать один раз."
  );
  int m = RandomN(3,8);
  switch (CurrentTest())
  {
  case 5:  
          m = 3;          break;
  case 3:    
      m = 5;      break;
  case 7:  
      m = 7;      break;
  }
  MakeVN(m, -99, 99);
  DataVN("D_1", 3);
  vn1 = vn;
  MakeVN(3, -99, 99);
  DataVN("D_2", 4);
  vn2 = vn;
  make_heap(vn1.begin(), vn1.end());
  for (int j=0; j < 3; ++j)
          pop_heap(vn1.begin(), vn1.end()-j);
  for (int j=2; j >= 0; --j)
  {
          vn1[m-j-1] = vn2[j];
          push_heap(vn1.begin(), vn1.end()-j);
  }
  for (int j=0; j < 3; ++j)
          pop_heap(vn1.begin(), vn1.end()-j);
  auto i = vn1.rbegin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl54()
{
  CreateTask(tit4);
  TaskText(
  "Дан дек {D}_1, содержащий не менее 3 элементов, и дек {D}_2, содержащий\n"
  "ровно 3~элемента. Определить три минимальных элемента среди всех элементов\n"
  "набора, полученного из дека {D}_1 в результате удаления трех его минимальных\n"
  "элементов и добавления к нему всех элементов из дека {D}_2. Вывести требуемые\n"
  "элементы в порядке возрастания. Использовать алгоритмы make\\_heap, pop\\_heap\n"
  "и push\\_heap, а также алгоритм copy (с обратными итераторами) для вывода\n"
  "требуемых элементов. Размеры исходных деков не изменять,\n"
  "алгоритм make\\_heap использовать один раз."
  );
  int m = RandomN(3,8);
  switch (CurrentTest())
  {
  case 5:  
          m = 3;          break;
  case 3:    
      m = 5;      break;
  case 7:  
      m = 7;      break;
  }
  MakeVN(m, -99, 99);
  DataVN("D_1", 3);
  vn1 = vn;
  MakeVN(3, -99, 99);
  DataVN("D_2", 4);
  vn2 = vn;
  make_heap(vn1.begin(), vn1.end(), greater<int>());
  for (int j=0; j < 3; ++j)
          pop_heap(vn1.begin(), vn1.end()-j, greater<int>());
  for (int j=2; j >= 0; --j)
  {
          vn1[m-j-1] = vn2[j];
          push_heap(vn1.begin(), vn1.end()-j, greater<int>());
  }
  for (int j=0; j < 3; ++j)
          pop_heap(vn1.begin(), vn1.end()-j, greater<int>());
  auto i = vn1.rbegin();
  ResultN(*i++, xLeft, 3, 3);
  ResultN(*i++, 0, 3, 3);
  ResultN(*i, xRight, 3, 3);
  SetTestCount(7);
}

void Stl55()
{
  CreateTask(tit5);
  TaskText(
  "Дан вектор {V} с четным количеством элементов.\n"
  "Найти сумму элементов из первой и из второй половины вектора.\n"
  "Использовать два вызова алгоритма accumulate."
  );
  MakeVN(RandomN(3,8)*2, -99, 99);
  DataVN("V", 3);
  auto s1 = accumulate(vn.begin(), vn.begin()+vn.size()/2, 0);
  auto s2 = accumulate(vn.begin()+vn.size()/2, vn.end(), 0);
  ResultN("Сумма элементов из первой половины вектора V: ", s1, 0, 2, 4);
  ResultN("Сумма элементов из второй половины вектора V: ", s2, 0, 4, 4);
  SetTestCount(5);
}

void Stl56()
{
  CreateTask(tit5);
  TaskText(
  "Дан вектор {V}. Найти сумму отрицательных и сумму положительных элементов\n"
  "вектора. Использовать два вызова алгоритма accumulate\n"
  "с параметрами \\= функциональными объектами."
  );
  MakeVN(RandomN(6,16), -99, 99);
  DataVN("V", 3);
  auto s1 = accumulate(vn.begin(), vn.end(), 0,
          [](int t, int e){ return e < 0 ? t + e : t;});
  auto s2 = accumulate(vn.begin(), vn.end(), 0,
          [](int t, int e){ return e > 0 ? t + e : t;});
  ResultN("Сумма отрицательных элементов вектора V: ", s1, 0, 2, 4);
  ResultN("Сумма положительных элементов вектора V: ", s2, 0, 4, 4);
  SetTestCount(5);
}

void Stl57()
{
  CreateTask(tit5);
  TaskText(
  "Дан вектор {V}, элементами которого являются английские слова.\n"
  "Получить строку, содержащую начальные символы всех элементов вектора,\n"
  "расположенные в обратном порядке. Использовать алгоритм\n"
  "accumulate с параметром \\= функциональным объектом."
  );
  MakeVS(RandomN(10, 16));
  DataVS("V", 2);
  string s;
  s = accumulate(vs.begin(), vs.end(), s,
          [](string t, string e){ return  e[0] + t;});
  ResultS(s.c_str(), 0, 3);
  SetTestCount(5);
}

void Stl58()
{
  CreateTask(tit5);
  TaskText(
  "Дан вектор {V}, элементами которого являются английские слова.\n"
  "Получить строку, содержащую конечные символы всех элементов вектора,\n"
  "расположенные в исходном порядке. Использовать\n"
  "алгоритм accumulate с параметром \\= функциональным объектом."
  );
  MakeVS(RandomN(10, 16));
  DataVS("V", 2);
  string s;
  s = accumulate(vs.begin(), vs.end(), s,
          [](string t, string e){ return  t + e[e.size()-1];});
  ResultS(s.c_str(), 0, 3);
  SetTestCount(5);
}

void Stl59()
{
  CreateTask(tit5);
  TaskText(
  "Дан вектор {V}, элементами которого являются английские слова.\n"
  "Получить строку, являющуюся суммой строк, описанных\n"
  "в задачах \\2 и \\1 (в указанном порядке). Использовать\n"
  "один вызов алгоритма accumulate с параметром \\= функциональным объектом."
  );
  MakeVS(RandomN(10, 16));
  DataVS("V", 2);
  string s;
  s = accumulate(vs.begin(), vs.end(), s,
          [](string t, string e){ return e[0] + t + e[e.size()-1];});
  ResultS(s.c_str(), 0, 3);
  SetTestCount(5);
}

void Stl60()
{
  CreateTask(tit5);
  TaskText(
  "Дан список {L}. Получить вектор {V} вещественных чисел, содержащий значения\n"
  "среднего арифметического для всех пар соседних элементов исходного списка\n"
  "(количество элементов вектора {V} должно быть на 1 меньше количества\n"
  "элементов списка {L}). Например, для исходного списка 1, 3, 4, 6 полученный\n"
  "вектор должен содержать значения 2.0, 3.5, 5.0. Использовать алгоритм\n"
  "adjacent\\_difference с итератором вставки и функциональным объектом,\n"
  "а также функцию-член erase для вектора~{V}."
  );
  MakeVN(RandomN(6,16), 0, 99);
  DataVN("L", 3);
  vr.clear();
  adjacent_difference(vn.begin(), vn.end(), back_inserter(vr),
          [](int e1, int e2){return (e1+e2)/2.0;});
  vr.erase(vr.begin());
  ResultVR("V", 3);
  SetTestCount(5);
}

void Stl61()
{
  CreateTask(tit5);
  TaskText(
  "Дан список {L}, элементами которого являются английские слова. Получить\n"
  "дек {D} со строковыми элементами, каждый из которых строится по паре\n"
  "соседних элементов исходного списка {L} следующим образом: последняя буква\n"
  "правого элемента пары приписывается справа к первой букве левого элемента\n"
  "пары. Количество элементов дека {D} должно быть на 1 меньше количества\n"
  "элементов списка {L}. Например, для исходного списка ABC, DEF, KLM, XYZ\n"
  "полученный дек должен содержать строки AF, DM, KZ. Использовать алгоритм\n"
  "adjacent\\_difference с итератором вставки и функциональным объектом,\n"
  "а также функцию-член erase для дека~{D}."
  );
  MakeVS(RandomN(6,16));
  DataVS("L", 3);
  vs1.clear();
  adjacent_difference(vs.begin(), vs.end(), back_inserter(vs1),
          [](string e2, string e1){return string() + e1[0] + e2[e2.size()-1];});
  vs1.erase(vs1.begin());
  vs = vs1;
  ResultVS("D", 3);
  SetTestCount(5);
}

void Stl62()
{
  CreateTask(tit5);
  TaskText(
  "Даны векторы {V}_1 и {V}_2 одинакового размера {N}, каждый из которых\n"
  "содержит координаты точки в {N}-мерном пространстве с евклидовой метрикой\n"
  "{r}({x},{y})~=~(\\H53({x}_{i}~\\-~{y}_{i})^2)^{1/2} (сумма берется по всем~{i} от~0 до~{N}\\-1).\n"
  "Найти значение квадрата метрики для двух данных точек. Использовать\n"
  "алгоритм inner\\_product с двумя функциональными объектами (в качестве\n"
  "первого из них можно указать стандартный объект plus)."
  );
  int m = RandomN(1, 6);
  MakeVN(m, -9, 9);
  DataVN("V_1", 3);
  vn1 = vn;
  MakeVN(m, -9, 9);
  DataVN("V_2", 4);
  vn2 = vn;
  int a = inner_product(vn1.begin(), vn1.end(), vn2.begin(), 0,
          plus<int>(), [](int e1, int e2){return (e2-e1)*(e2-e1);});
  ResultN(a, 0, 3, 3);
  SetTestCount(7);
}

void Stl63()
{
  CreateTask(tit5);
  TaskText(
  "Даны векторы {V}_1 и {V}_2 одинакового размера {N}, каждый из которых\n"
  "содержит координаты точки в {N}-мерном пространстве с метрикой\n"
  "{r}({x},{y})~=~max\\{|{x}_{i}~\\-~{y}_{i}|\\} (максимум берется по всем~{i} от~0 до~{N}\\-1).\n"
  "Найти значение метрики для двух данных точек. Использовать\n"
  "алгоритм inner\\_product с двумя функциональными объектами."
  );
  int m = RandomN(1, 6);
  MakeVN(m, -9, 9);
  DataVN("V_1", 3);
  vn1 = vn;
  MakeVN(m, -9, 9);
  DataVN("V_2", 4);
  vn2 = vn;
  int a = inner_product(vn1.begin(), vn1.end(), vn2.begin(), 0,
          [](int e1, int e2){return max(e1,e2);}, [](int e1, int e2){return abs(e2-e1);});
  ResultN(a, 0, 3, 3);
  SetTestCount(7);
}

void Stl64()
{
  CreateTask(tit5);
  TaskText(
  "Дано целое число {N} (1~\\l~{N}~\\l~16). Получить вектор {V} вещественных чисел, равных\n"
  "факториалам всех чисел от~1 до~{N} (вещественные числа используются для того,\n"
  "чтобы избежать целочисленного переполнения). Для этого последовательно вызвать\n"
  "конструктор вектора {V}, заполняющий его единицами, алгоритм partial\\_sum\n"
  "(с параметром \\= функциональным объектом) для получения в векторе всех чисел\n"
  "от~1 до~{N} и алгоритм partial\\_sum (с параметром \\= функциональным объектом,\n"
  "в качестве которого достаточно использовать стандартный объект multiplies)\n" 
  "для получения в векторе требуемых факториалов."
  );
  int m = RandomN(1, 16);
  DataN("N = ", m, 0, 3, 2);
  vector<double> v(m, 1.0);
  partial_sum(v.begin(), v.end(), v.begin());
  partial_sum(v.begin(), v.end(), v.begin(), multiplies<double>());
  vr = v;
  ResultVR1("V");
  SetTestCount(5);
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
    case 11:      Stl11_12(11); break;
    case 12:      Stl11_12(12); break;
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
    case 37:      Stl37(); break;
    case 38:      Stl38(); break;
    case 39:      Stl39(); break;
    case 40:      Stl40(); break;
    case 41:      Stl41(); break;
    case 42:      Stl42(); break;
    case 43:      Stl43(); break;
    case 44:      Stl44(); break;
    case 45:      Stl45(); break;
    case 46:      Stl46(); break;
    case 47:      Stl47(); break;
    case 48:      Stl48(); break;
    case 49:      Stl49(); break;
    case 50:      Stl50(); break;
    case 51:      Stl51(); break;
    case 52:      Stl52(); break;
    case 53:      Stl53(); break;
    case 54:      Stl54(); break;
    case 55:      Stl55(); break;
    case 56:      Stl56(); break;
    case 57:      Stl57(); break;
    case 58:      Stl58(); break;
    case 59:      Stl59(); break;
    case 60:      Stl60(); break;
    case 61:      Stl61(); break;
    case 62:      Stl62(); break;
    case 63:      Stl63(); break;
    case 64:      Stl64(); break;
  }
}

void  inittaskgroup_()
{
  if ((CurrentLanguage() & lgCPP) == 0) return;
  CreateGroup("STL3Alg", "Обобщенные алгоритмы", 
    "М. Э. Абрамян, 2016, 2021", "qwq2334sd#EnTopic<Template algorithms>#266775hfgd5ttd", 64, InitTask_);



}
}

//----------------------------------------

void  inittaskgroup3()
{
    STL3::inittaskgroup_();
}
void  InitTask3(int num)
{
    STL3::InitTask_(num);
}

//-------------------------------------
