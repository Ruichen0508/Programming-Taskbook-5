#include <string>
#include <fstream>
#include "pt5taskmaker.h"
#include <cstring>
void MakerDemo3()
{
  CreateTask("Ввод и вывод данных, оператор присваивания");
  TaskText("Даны стороны прямоугольника~{a} и~{b}.", 0, 2);
  TaskText("Найти его площадь {S}~=~{a}\\*{b} и периметр {P}~=~2\\*({a}\\;+\\;{b}).", 0, 4);
  double a = RandomN(1, 99) / 10.0,
    b = RandomN(1, 99) / 10.0;
  DataR("a = ", a, xLeft, 3, 4);
  DataR("b = ", b, xRight, 3, 4);
  ResultR("S = ", a * b, 0, 2, 4);
  ResultR("P = ", 2 * (a + b), 0, 4, 4);
  SetTestCount(3);
}

void MakerDemo4()
{
  CreateTask("Двумерные массивы (матрицы): вывод элементов");
  TaskText("Дана матрица размера~{M}\\;\\x\\;{N} и целое число~{K} (1~\\l~{K}~\\l~{M}).", 0, 2);
  TaskText("Вывести элементы {K}-й строки данной матрицы.", 0, 4);
  int m = RandomN(2, 5), n = RandomN(4, 8), k = 1;
  if (m == 5) 
    k = 0;
  DataN("M = ", m, 3, 1, 1);
  DataN("N = ", n, 10, 1, 1);
  double a[5][8];
  for (int i = 0; i < m; i++)
    for (int j = 0; j < n; j++)
    {
      a[i][j] = RandomR(-9.99, 9.99);
      DataR(a[i][j], Center(j+1, n, 5, 1), i + k + 1, 5);
    }
  k = RandomN(1, m);
  DataN("K = ", k, 68, 5, 1);
  for (int j = 0; j < n; j++)
    ResultR(a[k-1][j], Center(j+1, n, 5, 1), 3, 5);
  SetTestCount(5);
}

void MakerDemo5()
{
  CreateTask("Символы и строки: основные операции");
  TaskText("Дана непустая строка~{S}.", 0, 2);
  TaskText("Вывести ее первый и последний символ.", 0, 4);
  string s = EnWordSample(RandomN(0, EnWordCount() - 1));
  if (CurrentTest() == 3)
    while (s[0] == s[s.size()-1])
      s = EnWordSample(RandomN(0, EnWordCount() - 1));
  DataS("S = ", s.c_str(), 0, 3);
  ResultC("Первый символ: ", s[0], xLeft, 3);
  ResultC("Последний символ: ", s[s.size()-1], xRight, 3);
  SetTestCount(4);
}

const string c = "0123456789abcdefghijklmnopqrstuvwxyz";

string FileName(int Len)
{
  string result = "";
  int L = c.length();
  for (int i = 0; i < Len; i++)
    result = result + c[RandomN(0, L - 1)];
  return result;
}

void ConvertToPascalStr(string s, char buf[256])
{
  buf[0] = (char)s.length();
  for (size_t i = 1; i <= s.length(); i++)
    buf[i] = s[i-1];
}

void MakerDemo6()
{
  CreateTask("Символьные и строковые файлы");
  TaskText("Дано целое число~{K} (>\\,0) и строковый файл.\n"
  "Создать два новых файла: строковый, содержащий первые {K}~символов\n"
  "каждой строки исходного файла, и символьный, содержащий {K}-й символ\n"
  "каждой строки (если длина строки меньше~{K}, то в строковый файл\n"
  "записывается вся строка, а в символьный файл записывается пробел).");
  string s1 = "1" + FileName(5) + ".tst",   
    s2 = "2" + FileName(5) + ".tst",
    s3 = "3" + FileName(5) + ".tst";
  fstream fs1(s1.c_str(), ios_base::binary | ios_base::out),
    fs2(s2.c_str(), ios::binary | ios_base::out),
    fc3(s3.c_str(), ios::binary | ios_base::out);
  int k = RandomN(2, 11), jmax = 0, n = RandomN(10, 20);
  for (int i = 0; i < n; i++)
  {
    char buf[256];
    int j = RandomN(2, 16);
    if (jmax < j)
      jmax = j;
    string s = FileName(j);
    ConvertToPascalStr(s, buf);
    fs1.write(buf, 256);
    char c = ' ';
    if (j >= k)
    {
      c = s[k-1];
      buf[0] = (char)k;
    }
    fs2.write(buf, 256);
    fc3.write((char*) &c, 1);
  }
  fs1.close();
  fs2.close();
  fc3.close();            
  DataN("K = ", k, 0, 1, 1);
  DataS("Имя исходного файла: ", s1.c_str(), 3, 2);
  DataS("Имя результирующего строкового файла:  ", s2.c_str(), 3, 4);
  DataS("Имя результирующего символьного файла: ", s3.c_str(), 3, 5);
  DataComment("Содержимое исходного файла:", xRight, 2);
  DataFileS(s1.c_str(), 3, jmax + 3);
  ResultN("K = ", k, 0, 1, 1);
  ResultComment("Содержимое результирующего строкового файла:", 0, 2);
  ResultComment("Содержимое результирующего символьного файла:", 0, 4);
  ResultFileS(s2.c_str(), 3, k + 3);
  ResultFileC(s3.c_str(), 5, 4);
}

void MakerDemo7()
{
  CreateTask("Текстовые файлы: основные операции");
  TaskText("Дан текстовый файл.", 0, 2);
  TaskText("Удалить из него все пустые строки.", 0, 4);
  string s1 = FileName(6) + ".tst",
    s2 = "#" + FileName(6) + ".tst", 
    s = EnTextSample(RandomN(0, EnTextCount() - 1));
  ofstream t2(s2.c_str()), t1(s1.c_str());
  t2 << s << endl;
  t2.close();
  char* s0 = "\n\n";
  size_t p = s.find(s0);
  while (p != string::npos)
  {
    s.erase(p, 1);
    p = s.find(s0);
  }
  t1 << s << endl;
  t1.close();
  ResultFileT(s1.c_str(), 1, 5);
  rename(s2.c_str(), s1.c_str());
  DataFileT(s1.c_str(), 2, 5);
  DataS("Имя файла: ", s1.c_str(), 0, 1);
  SetTestCount(3);
}


void InitTask(int num)
{
    switch (num)
    {
    case 1:
        UseTask("Begin", num); break;
    case 2:
        UseTask("Begin", num); break;
    case 3:
        MakerDemo3(); break;
    case 4:
        MakerDemo4(); break;
    case 5:
        MakerDemo5(); break;
    case 6:
        MakerDemo6(); break;
    case 7:
        MakerDemo7(); break;
    }
}

void  inittaskgroup()
{
  int n = 7;
  CreateGroup("DemoCpp", "Примеры различных задач (конструктор для языка C++)", 
    "М. Э. Абрамян, 2014,2024", "qwqfsdf13dfttd", n, InitTask);
}

int InitGroup(string& name, string& code, int lang)
{
    string name0;
    ClearGroupData();
    SetLanguage(lang);
    name0 = TopicToUpperCase(name);
    if (name0 == "DEMOCPP")
        inittaskgroup();
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
    string name = SetTaskData(num, test);
    if (name == "DEMOCPP")
        InitTask(num);
    Pause();
    return GetTestCount();
}


int initgroup(char* name, char* code, int lang)
{
    string sname(name), scode;
    int res = InitGroup(sname, scode, lang);
    if (res > 0)
    {
        //sstrcpy(name, sname.c_str());
        //strcpy(code, scode.c_str());
             strncpy(name, sname.c_str(), strlen(name));
     strncpy(code, scode.c_str(), strlen(code));
    }
    return res;
}

int inittask(int num, int test)
{
    return InitTask(num, test);
}
