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
char* tit1 = "Алгоритмы поиска";
char* tit2 = "Базовые модифицирующие алгоритмы. Итераторы вставки";
char* tit3 = "Сортировка и слияние";
char* tit4 = "Перестановки и работа с кучей";
char* tit5 = "Численные алгоритмы";
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
  "Дано целое положительное число {N} и символ {C}.\n"
  "Используя конструктор класса string, заполнить строку {S},\n"
  "записав в нее {N} копий символа {C}."
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
  "Дана строка {S}_0 четной длины.\n"
  "Используя конструктор класса string с параметрами-итераторами,\n"
  "записать в строку {S} вторую половину символов строки {S}_0 в обратном порядке."
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
  "Дана строка {S} четной длины {N} ({N}~\\g~4).\n"
  "Дважды используя подходящий обобщенный алгоритм, поменять местами\n"
  "первый и последний символ, а также два средних символа строки~{S}."
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
  "Дано целое число {K} (>\\,0) и строка {S} четной длины.\n"
  "Используя один вызов функции-члена insert с параметром-итератором,\n"
  "добавить в середину строки~{S} {K}~символов~\\<*\\>."
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
  "Дано целое число {K} (>\\,0) и строка {S}, длина которой больше {K}.\n"
  "Используя один вызов функции-члена insert с параметрами-итераторами,\n"
  "добавить в конец строки {S} ее первые {K} символов в обратном порядке."
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
  "Дано целое число {K} (>\\,0) и строки {S}_1 и {S}_2. Строка {S}_1 содержит\n"
  "не менее {K} символов, а строка {S}_2~\\= не менее двух символов.\n"
  "Используя два вызова функции-члена insert с параметрами-итераторами,\n"
  "преобразовать строку {S}_2, вставив после ее первого символа первые {K} символов\n"
  "строки {S}_1 в исходном порядке, а перед ее последним символом~\\=\n"
  "последние {K} символов строки {S}_1 в обратном порядке."
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
  "Дана строка {S}. Используя функцию-член insert в цикле с параметром-итератором,\n"
  "вставить перед каждым символом строки {S} символ \\<*\\>."
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
  "Дана строка {S}, содержащая не менее двух символов. Используя функцию-член\n"
  "insert в цикле с параметром-итератором, вставить после каждого символа\n"
  "строки {S} с четным порядковым номером три символа \\<*\\> (например,\n"
  "строка \\<abcde\\> должна быть преобразована в \\<ab***cd***e\\>)."
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
  "Дана строка {S} четной длины. Используя функцию-член insert в цикле\n"
  "с параметром-итератором, продублировать каждый символ\n"
  "из первой половины строки {S} (например, строка \\<abcdef\\>\n"
  "должна быть преобразована в \\<aabbccdef\\>)."
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
  "Дана строка {S} нечетной длины {N} ({N}~\\g~5).\n"
  "Используя один вызов функции-члена erase с параметрами-итераторами,\n"
  "удалить три средних символа строки."
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
  "Дана строка {S}, содержащая не менее трех символов.\n"
  "Используя функцию-член erase в цикле с параметром-итератором,\n"
  "удалить каждый третий символ строки~{S}."
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
  "Дана строка {S}, содержащая не менее трех символов.\n"
  "Используя подходящий обобщенный алгоритм в цикле,\n"
  "переместить каждый третий символ строки {S} в ее конец,\n"
  "располагая перемещенные символы в исходном порядке."
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
  "Дана строка {S}, длина которой делится на 3.\n"
  "Используя подходящий обобщенный алгоритм, переместить вторую треть\n"
  "символов строки {S} в ее конец (с сохранением порядка символов)."
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
  "Дана строка {S}, содержащая не менее трех символов \\<*\\>.\n"
  "Используя три вызова подходящего обобщенного алгоритма и два вызова\n"
  "функции-члена erase, удалить в строке {S} второй и последний из этих символов."
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
  "Дана строка {S}. Используя два вызова подходящего обобщенного алгоритма и один\n"
  "вызов функции-члена erase, удалить все символы, расположенные в строке {S}\n"
  "между первой и последней цифрой. Если цифр меньше двух, то строку не изменять."
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
  "Дана строка {S} четной длины. Используя в цикле подходящий обобщенный\n"
  "алгоритм и функцию-член erase, удалить во второй половине строки {S}\n"
  "все символы, совпадающие с символами из ее первой половины."
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
   "Дана строка {S}. Используя подходящий обобщенный алгоритм и функцию-член erase,\n"
   "удалить все соседние цифровые и буквенные символы, оставив в каждом\n"
   "наборе подряд идущих цифр или букв только начальный символ. Например,\n"
   "строка \\<123abc456de\\> должна быть преобразована к виду \\<1a4d\\>.\n"
   "Считать, что строка {S} содержит только латинские буквенные символы."
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
  "Дано целое число {K} (>\\,0) и строка {S}, длина которой превосходит число {K}.\n"
  "Используя подходящий обобщенный алгоритм и функцию-член insert, продублировать\n"
  "в строке {S} первую из подстрок, содержащих {K} подряд расположенных цифр.\n"
  "Если подстрока содержит более {K} цифр, то продублировать {K} начальных цифр\n"
  "этой подстроки. Если требуемых подстрок нет, то строку не изменять."
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
  "Даны строки {S}_1 и {S}_2, длина строки {S}_1 не превосходит длины строки {S}_2. Используя\n"
  "подходящий обобщенный алгоритм и функцию-член erase, удалить в строке {S}_2\n"
  "последнюю подстроку, совпадающую с инвертированной строкой {S}_1 (строку {S}_1\n"
  "не изменять). Если требуемых подстрок нет, то строку {S}_2 не изменять."
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
  "Дано число {N} (1~\\l~{N}~\\l~26) и строка {S}. Используя два вызова подходящего\n"
  "обобщенного алгоритма с итератором вставки, добавить в начало и в конец\n"
  "строки {S} по {N} первых заглавных букв латинского алфавита, расположив эти буквы\n"
  "в конце строки по алфавиту, а в начале~\\= в порядке, обратном алфавитному.\n"
  "Например, при {N}~=~3 и {S}~=~\\<567\\> требуется получить строку \\<CBA567ABC\\>."
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
  "Дано целое число {K} (>\\,0) и строка {S} четной длины, большей 2{K}.\n"
  "Используя два вызова подходящего обобщенного алгоритма, выполнить\n"
  "в первой половине строки {S} циклический сдвиг символов на {К} позиций влево,\n"
  "а в ее второй половине~\\= циклический сдвиг символов на {K} позиций вправо."
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
  "Дана строка {S} четной длины. Используя два вызова подходящего обобщенного\n"
  "алгоритма, заменить в первой половине строки {S} все цифровые символы\n"
  "на символ \\<*\\>, а в ее второй половине~\\= все заглавные\n"
  "латинские буквы на символ~\\<\\_\\>."
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
  "Дана строка {S}. Используя один вызов подходящего обобщенного алгоритма,\n"
  "изменить регистр всех буквенных символов строки {S} на противоположный,\n"
  "а цифровые символы заменить на символ~\\<*\\>."
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
  "Даны строки {S}_1 и {S}_2 одинаковой длины. Используя подходящий обобщенный\n"
  "алгоритм, преобразовать строку {S}_2, заменив на символ \\<*\\> те ее символы,\n"
  "которые не совпадают с символами строки {S}_1, расположенными\n"
  "в тех же позициях. Например, в случае {S}_1~=~\\<ab2CD\\> и {S}_2~=~\\<as2Cd\\>\n"
  "строка {S}_2 должна быть преобразована к виду \\<a*2C*\\>."
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
  "Дана строка {S}. Используя подходящий обобщенный алгоритм, скопировать\n"
  "в конец строки {S} все содержащиеся в ней цифровые символы в том же порядке."
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
  "Дана строка {S}. Используя подходящий обобщенный алгоритм и функцию-член erase,\n"
  "удалить в строке {S} все цифровые символы."
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
  "Дана строка {S}. Используя подходящий обобщенный алгоритм, перегруппировать\n"
  "элементы строки {S}, переместив все цифровые символы\n"
  "в ее начало в том же порядке."
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
  "Дана строка {S} четной длины. Используя два вызова подходящего\n"
  "обобщенного алгоритма, отсортировать первую половину строки {S}\n"
  "по убыванию кодов символов, а вторую~\\= по их возрастанию."
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
  CreateGroup("STL4Str", "Строки как последовательные контейнеры", 
    "М. Э. Абрамян, 2016, 2021", "qwq2334sd#EnTopic<Strings as sequence containers>#477995hfgd5ttd", 28, InitTask_);

  CommentText("Во всех заданиях данной группы требуется обработать строку,");
  CommentText("рассматривая ее как последовательный контейнер и используя конструкторы");
  CommentText("класса string, его функции-члены insert и erase и/или подходящие обобщенные алгоритмы.");
  CommentText("Вспомогательные строки при решении задач использовать не следует.");


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
