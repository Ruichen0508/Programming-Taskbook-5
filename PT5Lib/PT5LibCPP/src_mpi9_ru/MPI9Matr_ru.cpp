#include <string>  
#include <sstream>
#include <iomanip>
#include <fstream>
#include <cmath>
#include <cstring>
#include "pt5taskmaker.h"  

const char topic0[] = "Непараллельный алгоритм умножения матриц";
const char topic1[] = "Ленточный алгоритм 1 (горизонтальные полосы)";
const char topic2[] = "Ленточный алгоритм 2 (горизонтальные и вертикальные полосы)";
const char topic3[] = "Блочный алгоритм Фокса";
const char topic4[] = "Блочный алгоритм Кэннона";
const char alph[] = "0123456789abcdefghijklmnopqrstuvwxyz";

std::string prc(int n)
{
        std::ostringstream os;
        os << "Процесс " << n << ": ";
        return os.str();
}

std::string prc0(int n)
{
        std::ostringstream os;
        os << n;
        //if (n < 10)
                os << ":";
        return os.str();
}

std::string ind(const char* c1, int n, std::string c2)
{
        std::ostringstream os;
        os << c1 << "_{" << n << "}" << c2;
        return os.str();
}

std::string ind2(const char* c1, int n, std::string c2)
{
        std::ostringstream os;
        if (n < 10)
                os << c1 << "_{0" << n << '}' << c2;
        else
                os << c1 << "_{" << n << '}' << c2;
        return os.str();
}

std::string FileName(int len)
{
        std::string result = "";
        int L = 36;
        for (int i = 0; i < len; i++)
                result = result + alph[RandomN(0, L - 1)];
        return result;
}


void DataProcComment(int i, int y)
{
        SetProcess(i);
        DataComment(prc(i).c_str(), 1, y);
}

void DataProcComment(int i, int x, int y)
{
        SetProcess(i);
        DataComment(prc(i).c_str(), x, y);
}

void ResultProcComment(int i, int y)
{
        SetProcess(i);
        ResultComment(prc(i).c_str(), 1, y);
}

void ResultProcComment(int i, int x, int y)
{
        SetProcess(i);
        ResultComment(prc(i).c_str(), x, y);
}

void ResultProcComment0(int i, int x, int y)
{
        SetProcess(i);
        ResultComment(prc0(i).c_str(), x, y);
}

void DataMatr0(int* a, int m, int n, int displ, int x, int &y)
{
        for (int i = 0; i < m; i++)
        {
                int x0 = x;
                for (int j = 0; j < n; j++)
                {
                        DataN(a[i*displ + j], x0, y, 4);
                        x0 += 4;
                }
                y++;
        }
}

void ResultMatr0(int* a, int m, int n, int displ, int x, int &y)
{
        for (int i = 0; i < m; i++)
        {
                int x0 = x;
                for (int j = 0; j < n; j++)
                {
                        ResultN(a[i*displ + j], x0, y, 4);
                        x0 += 4;
                }
                y++;
        }
}


int n, k1, k2, k3, m, p, q, x, y, y3, n0;

int *a = 0, *b = 0, *c = 0, *d = 0, *t = 0;

void MakeDim1()
{
        int kmax = n < 5 ? 4 : 3;
        k1 = RandomN(2, kmax);
        k2 = RandomN(2, kmax);
        m = RandomN(n * (k1 - 1) + 1, n * k1);
        p = RandomN(n * (k2 - 1) + 1, n * k2);
        q = RandomN(5, 7);
}

void MakeDim2()
{
        int kmax = n < 5 ? 4 : 3;
        k1 = RandomN(2, kmax);
        k2 = RandomN(2, kmax);
        m = RandomN(n * (k1 - 1) + 1, n * k1);
        q = RandomN(n * (k2 - 1) + 1, n * k2);
        p = RandomN(5, 7);
}

void MakeDim3()
{
        int kmax = n < 4 ? 4 : 3;
        k1 = RandomN(2, kmax);
        k2 = RandomN(2, kmax);
        k3 = RandomN(2, kmax);
        m = RandomN(n * (k1 - 1) + 1, n * k1);
        p = RandomN(n * (k2 - 1) + 1, n * k2);
        q = RandomN(n * (k3 - 1) + 1, n * k3);
}

void InitConst(int* a, int m, int n, int displ, int val)
{
        for (int i = 0; i < m; i++)
                for (int j = 0; j < n; j++)
                        a[i*displ + j] = val;
}

void InitRandom(int* a, int m, int n, int displ)
{
        for (int i = 0; i < m; i++)
                for (int j = 0; j < n; j++)
                        a[i*displ + j] = RandomN(-7, 7);
}

void Prod1Test()
{
        d = new int[k1*n*q];
        InitConst(d, k1*n, q, q, 0);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        for (int k0 = 0; k0 < p; k0++)
                                d[i*q + j] += a[i*p + k0] * b[k0*q + j];
}

void DataMatr1(const char* s, int* a, int m, int n, int displ, int &y)
{
        DataComment(s, 12, y++);
        DataMatr0(a, m, n, displ, 15, y);
}

void ResultMatr1(const char* s, int* a, int m, int n, int displ, int &y)
{
        ResultComment(s, 12, y++);
        ResultMatr0(a, m, n, displ, 15, y);
}

void DataMatr2(const char* s, int* a, int m, int n, int displ, int x, int &y)
{
        DataComment(s, x, y++);
        DataMatr0(a, m, n, displ, x+1, y);
}

void ResultMatr2(const char* s, int* a, int m, int n, int displ, int x, int &y)
{
        ResultComment(s, x, y++);
        ResultMatr0(a, m, n, displ, x+1, y);
}

void Init1()
{
        a = new int[k1*n*p];
        b = new int[k2*n*q];
        c = new int[k1*n*q];
        InitConst(a, k1*n, p, p, 0);
        InitRandom(a, m, p, p);
        InitConst(b, k2*n, q, q, 0);
        InitRandom(b, p, q, q);
        InitConst(c, k1*n, q, q, 0);
}

void Prod1(int cnt, int out)
{
        for (int j = 0; j < cnt; j++)
                for (int i = 0; i < n; i++)
                {
                        for (int i0 = 0; i0 < k1; i0++)
                                for (int j0 = 0; j0 < q; j0++)
                                        for (int k0 = 0; k0 < k2; k0++)
                                                c[i*k1*q + i0*q + j0] +=
                                                a[i*k1*p + (i + j) % n*k2 + i0*p + k0] * b[(i + j) % n*k2*q + j0 + k0*q];
                        if (out == 1)
                        {
                                ResultProcComment(i, y);
                                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
                        }
                        else if (out == 2)
                        {

                                t[i*n + j] = c[i*k1*q + j];

                        }
                }
}

void Init2()
{
        a = new int[k1*n*p];
        b = new int[p*k2*n];
        c = new int[k1*n*k2*n];
        InitConst(a, k1*n, p, p, 0);
        InitRandom(a, m, p, p);
        InitConst(b, p, k2*n, k2*n, 0);
        InitRandom(b, p, q, k2*n);
        InitConst(c, k1*n, k2*n, k2*n, 0);
}

void Prod2Test()
{
        d = new int[k1*n*q];
        InitConst(d, k1*n, q, q, 0);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                {
                        for (int k0 = 0; k0 < p; k0++)
                        {
                                d[i*q + j] += a[i*p + k0] * b[k0*k2*n + j];
                        }
                }
}


void Prod2(int cnt, int out)
{
        for (int j = 0; j < cnt; j++)
                for (int i = 0; i < n; i++)
                {
                        for (int i0 = 0; i0 < k1; i0++)
                                for (int j0 = 0; j0 < k2; j0++)
                                {
                                        for (int k0 = 0; k0 < p; k0++)
                                        {
                                                c[i*k2 + (i + j) % n*k1*k2*n + i0*k2*n + j0] +=
                                                        a[((i + j) % n*k1 + i0)*p + k0] * b[j0 + i*k2 + k0*k2*n];
                                        }
                                }
                        if (out == 1)
                        {
                                ResultProcComment(i, y);
                                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1*n, k2, k2*n, y);
                        }
                        else if (out == 2)
                        {

                                t[i*n + j] = c[i*k2 + j/k2*q + j%k2];

                        }

                }
}


void Init3()
{
        a = new int[k1*n*k2*n];
        b = new int[k2*n*k3*n];
        c = new int[k1*n*k3*n];
        InitConst(a, k1*n, k2*n, k2*n, 0);
        InitRandom(a, m, p, k2*n);
        InitConst(b, k2*n, k3*n, k3*n, 0);
        InitRandom(b, p, q, k3*n);
        InitConst(c, k1*n, k3*n, k3*n, 0);
}

void Prod3Test()
{
        d = new int[k1*n*k3*n];
        InitConst(d, k1*n, k3*n, k3*n, 0);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                {
                        for (int k0 = 0; k0 < p; k0++)
                        {
                                d[i*k3*n + j] += a[i*k2*n + k0] * b[k0*k3*n + j];
                        }
                }
}

void Prod3(int cnt, int out)
{
        for (int k = 0; k < cnt; k++)
                for (int i = 0; i < n; i++)
                {
                        x = 0;
                        for (int j = 0; j < n; j++)
                        {
                                y3 = y;
                                for (int i0 = 0; i0 < k1; i0++)
                                        for (int j0 = 0; j0 < k3; j0++)
                                        {
                                                for (int k0 = 0; k0 < k2; k0++)
                                                {
                                                        c[i*k1*k3*n + j*k3 + i0*k3*n + j0] +=
                                                                a[i*k1*k2*n + (i + k) % n * k2 + i0*k2*n + k0] *
                                                                b[(i + k) % n * k2*k3*n + j * k3 + k0*k3*n + j0];
                                                }
                                        }
                                if (out == 1)
                                {
                                        ResultProcComment(i*n + j, x + 1, y3++);
                                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                                }
                                else if (out == 2)
                                {
                                        t[(i*n + j)*n + k] = c[i*k1*k3*n + j*k3 + k/k3*k3*n + k%k3];


                                }

                                x += 20;
                        }
                        y = y3;
                }
}


void Prod4(int cnt, int out)
{
        for (int k = 0; k < cnt; k++)
                for (int i = 0; i < n; i++)
                {
                        x = 0;
                        for (int j = 0; j < n; j++)
                        {
                                y3 = y;
                                for (int i0 = 0; i0 < k1; i0++)
                                        for (int j0 = 0; j0 < k3; j0++)
                                        {
                                                for (int k0 = 0; k0 < k2; k0++)
                                                {
                                                        c[i*k1*k3*n + j*k3 + i0*k3*n + j0] +=
                                                                a[i* k1*k2*n + (i + j + k) % n * k2 + i0*k2*n + k0] *
                                                                b[(j + i + k)%n* k2*k3*n + j * k3 + k0*k3*n + j0];
                                                }
                                        }
                                if (out == 1)
                                {
                                        ResultProcComment(i*n + j, x + 1, y3++);
                                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                                }
                                else if (out == 2)
                                {
                                        t[(i*n + j)*n + k] = c[i*k1*k3*n + j*k3 + k / k3*k3*n + k%k3];

                                }
                                x += 20;
                        }
                        y = y3;
                }
}


void Delete1()
{
        delete[] a;
        delete[] b;
        delete[] c;
}


void Matr0()
{
        n = 2;
        CreateTask(topic0, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно. Найти и вывести в главном процессе матрицу {C} размера {M}~\\x~{Q},\n"
                        "являющуюся произведением матриц {A} и {B}.\n"
                        "\\PФормула для вычисления элементов матрицы {C} в предположении, что строки\n"
                        "и столбцы всех матриц нумеруются от 0, имеет вид:\n"
                        "{C}_{I,J}~=~{A}_{I,0}\\*{B}_{0,J}~+~{A}_{I,1}\\*{B}_{1,J}~+~\\.~+~{A}_{I,P-1}\\*{B}_{P-1,J},\n"
                        "где {I}~=~0,~\\., {M}~\\-~1, {J}~=~0,~\\., {Q}~\\-~1.\n"
                        "\\PДля хранения матриц {A}, {B}, {C} использовать одномерные массивы размера {M}\\*{P},\n"
                        "{P}\\*{Q} и {M}\\*{Q}, размещая в них элементы матриц по строкам (при этом элемент матрицы\n"
                        "с индексами {I} и {J} будет храниться в элементе соответствующего массива\n"
                        "с индексом {I}\\*{N}~+~{J}, где {N}~\\=~количество столбцов матрицы).\n"
                        "При выполнении данного задания подчиненные процессы не используются.");

        MakeDim1();
        Init1();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, p, y);
        DataMatr1("B:", b, p, q, q, y);
        Prod1Test();
        y = 1;
        ResultProcComment(0, y);
        ResultMatr1("C:", d, m, q, q, y);
        Delete1();
        delete[] d;
}


void Matr1ScatterData()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;
  
                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно. В первом варианте ленточного алгоритма перемножения матриц\n"
                        "каждая матрица-сомножитель разбивается на {K} горизонтальных полос, где {K}~\\=\n"
                        "количество процессов (в дальнейшем полосы распределяются по процессам\n"
                        "и используются для вычисления в каждом процессе части итогового\n"
                        "матричного произведения).\n"
                        "\\PПолоса для матрицы {A} содержит {N}_{A} строк, полоса для матрицы {B} содержит\n"
                        "{N}_{B} строк; числа {N}_{A} и {N}_{B} вычисляются по формулам {N}_{A}~=~ceil({M}/{K}),\n"
                        "{N}_{B}~=~ceil({P}/{K}), где операция \\</\\> означает вещественное деление, а функция ceil\n"
                        "выполняет округление с избытком. Если матрица содержит недостаточно строк\n"
                        "для заполнения последней полосы, то полоса дополняется нулевыми строками.\n"
                        "\\PСохранить исходные матрицы, дополненные при необходимости нулевыми строками,\n"
                        "в одномерных массивах в главном процессе, после чего организовать пересылку\n"
                        "полос из этих массивов во все процессы: в процесс ранга {R} ({R}~=~0, 1,~\\.,\n"
                        "{K}~\\-~1) пересылается полоса с индексом {R}, все полосы {A}_{R} имеют размер {N}_{A}~\\x~{P},\n"
                        "все полосы {B}_{R} имеют размер {N}_{B}~\\x~{Q}. Кроме того, создать в каждом процессе\n"
                        "полосу {C}_{R} для хранения фрагмента матричного произведения {C}~=~{A}{B}, которое будет\n"
                        "вычисляться в этом процессе; каждая полоса {C}_{R} имеет размер {N}_{A}~\\x~{Q}\n"
                        "и заполняется нулевыми элементами.\n"
                        "\\PПолосы, как и исходные матрицы, должны храниться по строкам в одномерных\n"
                        "массивах соответствующего размера. Для пересылки размеров матриц использовать\n"
                        "коллективную функцию MPI\\_Bcast, для пересылки полос матриц {A} и {B} использовать\n"
                        "коллективную функцию MPI\\_Scatter.\n"
                        "\\PОформить все описанные действия в виде функции Matr1ScatterData\n"
                        "(без параметров), в результате вызова которой каждый процесс получает\n"
                        "значения {N}_{A}, {P}, {N}_{B}, {Q}, а также одномерные массивы, заполненные\n"
                        "соответствующими полосами матриц {A}, {B}, {C}. После вызова функции\n"
                        "Matr1ScatterData вывести в каждом процессе полученные данные (числа {N}_{A}, {P},\n"
                        "{N}_{B}, {Q} и полосы матриц {A}, {B}, {C}). Ввод исходных данных осуществлять в функции\n"
                        "Matr1ScatterData, вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SУказание.\\s Для уменьшения числа вызовов функции MPI\\_Bcast все пересылаемые\n"
                        "размеры матриц можно поместить во вспомогательный массив.");

        MakeDim1();
        Init1();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, p, y);
        DataMatr1("B:", b, p, q, q, y);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultN("N_A = ", k1, 12, y, 1);
                ResultN("P = ", p, 21, y, 1);
                ResultN("N_B = ", k2, 29, y, 1);
                ResultN("Q = ", q, 38, y++, 1);
                ResultMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                ResultMatr1(ind("B", i, ":").c_str(), &b[i*k2*q], k2, q, q, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
        }
        Delete1();
}

void Matr1Calc(int cnt)
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

        if (cnt == 1)

                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, {Q}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\1).\n"
                                "Реализовать первый шаг ленточного алгоритма перемножения матриц, выполнив\n"
                                "перемножение элементов, содержащихся в полосах {A}_{R} и {B}_{R} каждого процесса,\n"
                                "после чего организовать циклическую пересылку каждой полосы {B}_{R} в процесс\n"
                                "предыдущего ранга (из процесса 1 в процесс 0, из процесса 2 в процесс 1,~\\.,\n"
                                "из процесса 0 в процесс {K}~\\-~1, где {K}~\\= количество процессов).\n"
                                "\\PЦиклическую пересылку полос {B}_{R} выполнять с помощью функции\n"
                                "MPI\\_Sendrecv\\_replace, используя для определения рангов процесса-отправителя\n"
                                "и процесса-получателя операцию % взятия остатка от деления.\n"
                                "\\PОформить эти действия в виде функции Matr1Calc (без параметров).\n"
                                "Вывести новое содержимое полос {C}_{R} и {B}_{R} в каждом процессе\n"
                                "(ввод и вывод данных выполнять во внешней функции Solve).\n"
                                "\\P\\SУказание.\\s В результате перемножения полос {A}_{R} и {B}_{R} каждый элемент полосы {C}_{R}\n"
                                "будет содержать \\Iчасть\\i слагаемых, входящих в итоговое произведение {A}{B}; при этом\n"
                                "будут использованы все элементы полосы {B}_{R} и часть элементов полосы {A}_{R}\n"
                                "(в частности, на первом шаге в процессе 0 будут использованы {N}_{B} первых\n"
                                "столбцов полосы {A}_0, а в процессе {K}~\\-~1~\\= {N}_{B} последних столбцов полосы {A}_{K-1}).");
                else if (cnt == 2)
                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, {Q}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\2).\n"
                                "Модифицировать функцию Matr1Calc, реализованную в предыдущем задании,\n"
                                "таким образом, чтобы она обеспечивала выполнение любого шага\n"
                                "алгоритма ленточного умножения.\n"
                                "\\PДля этого добавить к ней параметр step, определяющий номер шага (изменяется\n"
                                "от 0 до {K}~\\-~1, где {K}~\\= количество процессов), и использовать значение этого\n"
                                "параметра в той части алгоритма, которая связана с пересчетом элементов\n"
                                "полосы {C}_{R} (действия, связанные с циклической пересылкой полос {B}_{R},\n"
                                "от значения параметра step не зависят).\n"
                                "\\PИспользуя два вызова модифицированной функции Matr1Calc с параметрами 0 и 1,\n"
                                "выполнить два начальных шага ленточного алгоритма и вывести в каждом процессе\n"
                                "новое содержимое полос {C}_{R} и {B}_{R} (ввод и вывод данных\n"
                                "выполнять во внешней функции Solve).\n"
                                "\\P\\SУказание.\\s Номер шага step определяет, какая часть элементов полосы {A}_{R} будет\n"
                                "использована при очередном пересчете элементов полосы {C}_{R} (следует обратить\n"
                                "внимание на то, что эти части перебираются циклически).");
                else
        {
                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, {Q}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\3).\n"
                                "Кроме того, в каждом процессе дано одно и то же число {L}, лежащее в диапазоне\n"
                                "от 3 до {K} ({K}~\\= количество процессов) и определяющее\n"
                                "требуемое число шагов ленточного алгоритма.\n"
                                "\\PВызывая в цикле по параметру {I} ({I}~=~0,~\\., {L}~\\-~1) функцию Matr1Calc({I}),\n"
                                "разработанную в предыдущем задании, выполнить {L} начальных шагов ленточного\n"
                                "алгоритма и вывести в каждом процессе новое содержимое полос {C}_{R} и {B}_{R}\n"
                                "(ввод и вывод данных выполнять во внешней функции Solve).\n"
                                "\\P\\SПримечание.\\s Если значение {L} равно {K}, то полосы {C}_{R} будут содержать\n"
                                "соответствующие фрагменты итогового матричного произведения {A}{B}.");
                cnt = RandomN(3, n);
        }

        MakeDim1();
        Init1();

        y = 1;
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("P = ", p, 21, y, 1);
                DataN("N_B = ", k2, 29, y, 1);
                DataN("Q = ", q, 38, y++, 1);
                DataMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                DataMatr1(ind("B", i, ":").c_str(), &b[i*k2*q], k2, q, q, y);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
                if (cnt > 2)
                        DataN("L = ", cnt, 12, y++, 1);
        }
        Prod1(cnt, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
                ResultMatr1(ind("B", i, ":").c_str(), &b[(i + cnt) % n*k2*q], k2, q, q, y);
        }
        Delete1();
}



void Matr1GatherData()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе дано число {M}~\\= количество строк результирующего матричного\n"
                        "произведения. Кроме того, в каждом процессе даны числа {N}_{A}, {Q}, а также\n"
                        "одномерные массивы, заполненные полосами матрицы {C} (размера {N}_{A}~\\x~{Q}), которые\n"
                        "были получены в результате выполнения {K} шагов ленточного алгоритма\n"
                        "перемножения матриц (см. \\1). Переслать все полосы {C}_{R} в главный\n"
                        "процесс и вывести в нем полученную матрицу {C} (размера {M}~\\x~{Q}).\n"
                        "\\PДля хранения результирующей матрицы {C} в главном процессе использовать\n"
                        "одномерный массив, достаточный для хранения матрицы размера ({N}_{A}\\*{K})~\\x~{Q};\n"
                        "для пересылки данных в этот массив использовать коллективную\n"
                        "функцию MPI\\_Gather.\n"
                        "\\PОформить эти действия в виде функции Matr1GatherData (без параметров).\n"
                        "Ввод данных выполнять во внешней функции Solve, вывод полученной матрицы\n"
                        "включить в функцию Matr1GatherData.");

        MakeDim1();
        Init1();

        Prod1(n, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                if (i == 0)
                        DataN("M = ", m, 12, y++, 1);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("Q = ", q, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
        }
        y = 1;
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, q, y);
        Delete1();
}

void Matr1Complete()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно (таким образом, исходные данные совпадают с исходными данными\n"
                        "для задания \\5).\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\5\\-\\1\n"
                        "функции Matr1ScatterData, Matr1Calc (в цикле) и Matr1GatherData, получить\n"
                        "и вывести в главном процессе матрицу {C}, равную произведению\n"
                        "исходных матриц {A} и {B}.\n"
                        "\\PПосле каждого вызова функции Matr1Calc дополнительно выводить в каждом\n"
                        "процессе текущее содержимое полосы {C}_{R}. Перед использованием в данном задании\n"
                        "следует модифицировать разработанную в \\3 функцию Matr1Calc таким\n"
                        "образом, чтобы при значении параметра step, равном {K}~\\-~1,\n"
                        "не выполнялась пересылка полос {B}_{R}.");

        MakeDim1();
        Init1();

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, p, y);
        DataMatr1("B:", b, p, q, q, y);
        y = 1;
        Prod1(n, 1);
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, q, y);
        Delete1();
}


void Matr1ScatterFile()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена двух файлов, содержащих\n"
                        "элементы матриц {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно. Модифицировать\n"
                        "начальный этап ленточного алгоритма перемножения матриц (см. \\6)\n"
                        "таким образом, чтобы каждый процесс считывал соответствующие полосы\n"
                        "матриц {A} и {B} непосредственно из исходных файлов, используя коллективные\n"
                        "функции MPI\\_File\\_seek и MPI\\_File\\_read\\_all (новый вид файловых данных\n"
                        "создавать не требуется).\n"
                        "\\PДля пересылки размеров матриц и имен файлов использовать коллективную\n"
                        "функцию MPI\\_Bcast.\n"
                        "\\PОформить все действия в виде функции Matr1ScatterFile (без параметров),\n"
                        "в результате вызова которой каждый процесс получает значения {N}_{A}, {P}, {N}_{B}, {Q},\n"
                        "а также одномерные массивы, заполненные соответствующими полосами\n"
                        "матриц {A}, {B}, {C}. После вызова функции Matr1ScatterFile вывести в каждом\n"
                        "процессе полученные данные (числа {N}_{A}, {P}, {N}_{B}, {Q} и полосы матриц {A}, {B}, {C}).\n"
                        "Ввод исходных данных осуществлять в функции Matr1ScatterFile,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SПримечание.\\s Для некоторых полос часть элементов (последние строки) или даже\n"
                        "вся полоса не должна считываться из исходных файлов и будет оставаться\n"
                        "нулевой. Однако эта ситуация не требует специальной обработки, так как\n"
                        "при достижении конца файла функция MPI\\_File\\_read\\_all автоматически прекращает\n"
                        "считывание данных, не генерируя никакого сообщения об ошибке.");

        MakeDim1();
        Init1();

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
//      DataMatr1("A:", a, m, p, p, y);
//      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst",    sb = "B" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m*p; i++)
                fa.write((char*)&a[i], sizeof(a[i]));
        for (int i = 0; i < p*q; i++)
                fb.write((char*)&b[i], sizeof(a[i]));
        fa.close();
        fb.close();     
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y++, 4);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultN("N_A = ", k1, 12, y, 1);
                ResultN("P = ", p, 21, y, 1);
                ResultN("N_B = ", k2, 29, y, 1);
                ResultN("Q = ", q, 38, y++, 1);
                ResultMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                ResultMatr1(ind("B", i, ":").c_str(), &b[i*k2*q], k2, q, q, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
        }
        Delete1();
}

void Matr1GatherFile()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {N}_{A}, {Q}, а также одномерные массивы, заполненные\n"
                        "полосами {C}_{R} (размера {N}_{A}~\\x~{Q}), полученными в результате выполнения {K} шагов\n"
                        "ленточного алгоритма перемножения матриц (см. \\4). Кроме того,\n"
                        "в главном процессе дано число {M}~\\= количество строк результирующего матричного\n"
                        "произведения и имя файла для хранения этого произведения.\n"
                        "\\PПереслать число {M} и имя файла во все процессы (используя функцию MPI\\_Bcast)\n"
                        "и записать все фрагменты матричного произведения, содержащиеся в полосах {C}_{R},\n"
                        "в результирующий файл, который в итоге будет содержать\n"
                        "матрицу {C} размера {M}~\\x~{Q}.\n"
                        "\\PДля записи полос в файл использовать коллективные функции MPI\\_File\\_seek\n"
                        "и MPI\\_File\\_write\\_all.\n"
                        "\\PОформить считывание имени файла, пересылку значения {M} и имени файла,\n"
                        "а также все действия по записи полос в файл в виде функции Matr1GatherFile\n"
                        "(считывание всех исходных данных, кроме имени файла,\n"
                        "должно осуществляться во внешней функции Solve).\n"
                        "\\P\\SУказание.\\s При записи данных в результирующий файл необходимо учитывать,\n"
                        "что некоторые полосы {C}_{R} могут содержать завершающие нулевые строки,\n"
                        "не связанные с полученным произведением (именно для проверки этой ситуации\n"
                        "требуется пересылать во все процессы значение {M}).");

        MakeDim1();
        Init1();

        Prod1(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";
//      DataS("Имя файла для матрицы C: ", sc.c_str(), 1, y++);
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("Q = ", q, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
                if (i == 0)
                {
                        DataN("M = ", m, 12, y++, 1);
                        DataS("Имя файла для матрицы C: ", sc.c_str(), 12, y++);
                }
        }
//      ResultProcComment(0, y);
//      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m*q; i++)
                fc.write((char*)&c[i], sizeof(c[i]));
        fc.close();
        y = 1;
        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);

        Delete1();
}

void Matr1CompleteFile()
{
        n = RandomN(3, 5);
        CreateTask(topic1, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена трех файлов: вначале\n"
                        "даются имена двух существующих файлов, содержащих элементы матриц {A} и {B}\n"
                        "размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно, а затем имя файла для хранения\n"
                        "результирующего матричного произведения {C}~=~{A}{B}.\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\2, \\5\n"
                        "и \\1 функции Matr1ScatterFile, Matr1Calc (в цикле) и Matr1GatherFile,\n"
                        "получить в результирующем файле произведение исходных матриц {A} и {B}, найденное\n"
                        "с помощью первого варианта ленточного алгоритма.\n"
                        "\\PПосле каждого вызова функции Matr1Calc дополнительно выводить в каждом\n"
                        "процессе текущее значение элемента c[step], где c~\\= одномерный массив,\n"
                        "содержащий полосу {C}_{R}, а step~\\= номер шага алгоритма (0, 1,~\\., {K}~\\-~1);\n"
                        "таким образом, на первом шаге алгоритма следует вывести элемент c[0],\n"
                        "на втором шаге~\\= элемент c[1], и~т.\\,д.");

        MakeDim1();


    Init1();

        t = new int[n*n];
        InitConst(t, n, n, n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
//      DataMatr1("A:", a, m, p, p, y);
//      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst",
                sc = "C" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m*p; i++)
                fa.write((char*)&a[i], sizeof(a[i]));
        for (int i = 0; i < p*q; i++)
                fb.write((char*)&b[i], sizeof(a[i]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y);
        DataS("Имя файла для матрицы C: ", sc.c_str(), xRight, y++);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);

        y = 1;
        Prod1(n, 2);
//      ResultProcComment(0, y);
//      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m*q; i++)
                fc.write((char*)&c[i], sizeof(c[i]));
        fc.close();

        for (int i = 0; i < n; i++)
        {
                if (i % 2 == 0)
                        x = 0;
                else
                        x = 40;
                ResultProcComment(i, x + 1, y);
                ResultMatr0(&t[i*n], 1, n, n, x + 11, y);
//              y++;
                if (i % 2 == 0)
                        y--;
        }
        if (n % 2 != 0)
                y++;

        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);
        Delete1();
}


void Matr2CreateColumnType()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {P} и {Q}; кроме того, в главном процессе дана\n"
                        "матрица {B} размера {P}~\\x~{Q}. Известно, что число {Q} кратно количеству процессов {K}.\n"
                        "Прочесть в главном процессе матрицу {B} в одномерный массив размера {P}\\*{Q}\n"
                        "и определить новый тип MPI\\_BAND\\_B, содержащий вертикальную полосу матрицы {B}\n"
                        "шириной {N}_{B}~=~{Q}/{K} столбцов.\n"
                        "\\PПри определении типа MPI\\_BAND\\_B использовать функции MPI\\_Type\\_vector\n"
                        "и MPI\\_Type\\_commit, оформив это определение в виде функции\n"
                        "Matr2CreateTypeBand(p, n, q, t), где целочисленные параметры p, n, q\n"
                        "являются входными, а параметр t типа MPI\\_Datatype является выходным;\n"
                                            "при этом параметры p и n определяют размер вертикальной полосы\n"
                        "(число ее строк и столбцов), а параметр q~\\= число столбцов\n"
                                            "матрицы, из которой извлекается эта полоса.\n"
                                            "\\PИспользуя тип MPI\\_BAND\\_B, переслать в каждый процесс (включая главный)\n"
                        "соответствующую полосу матрицы {B}, перебирая полосы в порядке возрастания\n"
                        "рангов процессов-получателей. Пересылку выполнять с помощью функций MPI\\_Send\n"
                        "и MPI\\_Recv; полосы хранить в одномерных массивах размера {P}\\*{N}_{B}.\n"
                        "Вывести в каждом процессе полученную полосу.\n"
                        "\\P\\SПримечание.\\s В реализации MPICH2 версии 1.3 с помощью функции MPI\\_Send нельзя\n"
                        "выполнить пересылку данных в тот же процесс, из которого данные посылаются\n"
                        "(происходит зависание программы). Для пересылки полосы в главный процесс можно\n"
                        "использовать функцию MPI\\_Sendrecv; можно также заполнить соответствующую\n"
                        "полосу в главном процессе, не прибегая к средствам библиотеки MPI.");

        MakeDim2();
        Init2();
        q = k2*n;
        InitRandom(b, p, q, k2*n);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("P = ", p, 12, y, 1);
                DataN("Q = ", q, 20, y++, 1);
                if (i == 0)
                        DataMatr1("B:", b, p, q, k2*n, y);
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultMatr1("", &b[i*k2], p, k2, k2*n, y);
        }
        Delete1();
}


void Matr2ScatterData()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно. Во втором варианте ленточного алгоритма перемножения матриц\n"
                        "первая матрица ({A}) разбивается на {K} горизонтальных полос, а вторая ({B})~\\=\n"
                        "на {K} вертикальных полос, где {K}~\\= количество процессов (в дальнейшем полосы\n"
                        "распределяются по процессам и используются для вычисления в каждом процессе\n"
                        "части итогового матричного произведения).\n"
                        "\\PПолоса для матрицы {A} содержит {N}_{A} строк, полоса для матрицы {B}\n"
                        "содержит {N}_{B} столбцов; числа {N}_{A} и {N}_{B} вычисляются по формулам {N}_{A}~=~ceil({M}/{K}),\n"
                        "{N}_{B}~=~ceil({Q}/{K}), где операция \\</\\> означает вещественное деление, а функция ceil\n"
                        "выполняет округление с избытком. Если матрица содержит недостаточно строк\n"
                        "(или столбцов) для заполнения последней полосы, то полоса дополняется\n"
                        "нулевыми строками (столбцами).\n"
                        "\\PСохранить исходные матрицы, дополненные при необходимости нулевыми строками\n"
                        "или столбцами, в одномерных массивах в главном процессе, после чего\n"
                        "организовать пересылку полос из этих массивов во все процессы: в процесс\n"
                        "ранга {R} ({R}~=~0, 1,~\\., {K}~\\-~1) пересылается полоса с индексом {R}, все полосы {A}_{R}\n"
                        "имеют размер {N}_{A}~\\x~{P}, все полосы {B}_{R} имеют размер {P}~\\x~{N}_{B}. Кроме того, создать\n"
                        "в каждом процессе полосу {C}_{R} для хранения фрагмента матричного произведения\n"
                        "{C}~=~{A}{B}, который будет вычисляться в этом процессе; каждая полоса {C}_{R} имеет\n"
                        "размер ({N}_{A}\\*{K})~\\x~{N}_{B} и заполняется нулевыми элементами.\n"
                        "\\PПолосы, как и исходные матрицы, должны храниться по строкам в одномерных\n"
                        "массивах соответствующего размера. Для пересылки размеров матриц использовать\n"
                        "коллективную функцию MPI\\_Bcast, для пересылки полос матрицы {A} использовать\n"
                        "коллективную функцию MPI\\_Scatter, для пересылки полос матрицы {B} использовать\n"
                        "функции MPI\\_Send и MPI\\_Recv, а также вспомогательный тип MPI\\_BAND\\_B, созданный\n"
                        "с помощью функции Matr2CreateTypeBand (см. предыдущее задание\n"
                        "и примечание к нему).\n"
                        "\\PОформить все описанные действия в виде функции Matr2ScatterData\n"
                        "(без параметров), в результате вызова которой каждый процесс получает\n"
                        "значения {N}_{A}, {P}, {N}_{B}, а также одномерные массивы, заполненные соответствующими\n"
                        "полосами матриц {A}, {B}, {C}. После вызова функции Matr2ScatterData вывести\n"
                        "в каждом процессе полученные данные (числа {N}_{A}, {P}, {N}_{B} и полосы матриц {A}, {B}, {C}).\n"
                        "Ввод исходных данных осуществлять в функции Matr2ScatterData,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SУказания.\\s (1) При считывании матрицы {B} в главном процессе следует учитывать,\n"
                        "что предназначенный для ее хранения массив может содержать элементы,\n"
                        "соответствующие дополнительным нулевым столбцам.\n"
                        "\\P(2) Для уменьшения числа вызовов функции MPI\\_Bcast все пересылаемые размеры\n"
                        "матриц можно поместить во вспомогательный массив.");

        MakeDim2();
        Init2();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, p, y);
        DataMatr1("B:", b, p, q, k2*n, y);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultN("N_A = ", k1, 12, y, 1);
                ResultN("P = ", p, 21, y, 1);
                ResultN("N_B = ", k2, 29, y++, 1);
//              ResultN("Q = ", q, 38, y++, 1);
                ResultMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                ResultMatr1(ind("B", i, ":").c_str(), &b[i*k2], p, k2, k2*n, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1*n, k2, k2*n, y);
        }
        Delete1();
}

void Matr2Calc(int cnt)
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

        if (cnt == 1)

                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\1).\n"
                                "Реализовать первый шаг ленточного алгоритма перемножения матриц, выполнив\n"
                                "перемножение элементов, содержащихся в полосах {A}_{R} и {B}_{R} каждого процесса,\n"
                                "после чего организовать циклическую пересылку каждой полосы {A}_{R} в процесс\n"
                                "предыдущего ранга (из процесса 1 в процесс 0, из процесса 2 в процесс 1,~\\.,\n"
                                "из процесса 0 в процесс {K}~\\-~1, где {K}~\\= количество процессов).\n"
                                "\\PЦиклическую пересылку полос {A}_{R} выполнять с помощью функции\n"
                                "MPI\\_Sendrecv\\_replace, используя для определения рангов процесса-отправителя\n"
                                "и процесса-получателя операцию % взятия остатка от деления.\n"
                                "\\PОформить эти действия в виде функции Matr2Calc (без параметров).\n"
                                "Вывести новое содержимое полос {C}_{R} и {A}_{R} в каждом процессе (ввод и вывод\n"
                                "данных выполнять во внешней функции Solve).\n"
                                "\\P\\SУказание.\\s Поскольку в данном варианте ленточного алгоритма полосы {A}_{R} содержат\n"
                                "полные строки матрицы {A}, а полосы {B}_{R}~\\= полные столбцы матрицы {B}, в результате\n"
                                "их перемножения уже на первом шаге алгоритма полоса {C}_{R} будет содержать часть\n"
                                "элементов итогового матричного произведения (прочие элементы полосы останутся\n"
                                "нулевыми). Расположение найденных элементов в полосе {C}_{R} зависит от ранга\n"
                                "процесса (в частности, на первом шаге в процессе 0 будут заполнены {N}_{A} первых\n"
                                "строк полосы {C}_0, а в процессе {K}~\\-~1~\\= {N}_{A} последних строк полосы {C}_{K-1}).");
                
        else if (cnt == 2)
                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\2).\n"
                                "Модифицировать функцию Matr2Calc, реализованную в предыдущем задании,\n"
                                "таким образом, чтобы она обеспечивала выполнение любого шага\n"
                                "алгоритма ленточного умножения.\n"
                                "\\PДля этого добавить к ней параметр step, определяющий номер шага (изменяется\n"
                                "от 0 до {K}~\\-~1, где {K}~\\= количество процессов) и использовать значение этого\n"
                                "параметра в той части алгоритма, которая связана с пересчетом элементов\n"
                                "полосы {C}_{R} (действия, связанные с циклической пересылкой полос {A}_{R},\n"
                                "от значения параметра step не зависят).\n"
                                "\\PИспользуя два вызова модифицированной функции Matr2Calc с параметрами 0 и 1,\n"
                                "выполнить два начальных шага ленточного алгоритма и вывести в каждом процессе\n"
                                "новое содержимое полос {C}_{R} и {A}_{R} (ввод и вывод данных\n"
                                "выполнять во внешней функции Solve).\n"
                                "\\P\\SУказание.\\s Номер шага step определяет, какие наборы строк полосы {C}_{R} будут\n"
                                "вычислены на данном этапе алгоритма (следует обратить внимание на то,\n"
                                "что эти наборы строк перебираются циклически).");
                else
        {
                        TaskText(
                                "В каждом процессе даны числа {N}_{A}, {P}, {N}_{B}, а также одномерные массивы,\n"
                                "заполненные соответствующими полосами матриц {A}, {B}, {C} (таким образом, исходные\n"
                                "данные совпадают с результатами, полученными в задании \\3).\n"
                                "Кроме того, в каждом процессе дано одно и то же число {L}, лежащее в диапазоне\n"
                                "от 3 до {K} ({K}~\\= количество процессов) и определяющее требуемое число шагов\n"
                                "ленточного алгоритма.\n"
                                "\\PВызывая в цикле по параметру {I} ({I}~=~0,~\\., {L}~\\-~1) функцию Matr2Calc({I}),\n"
                                "разработанную в предыдущем задании, выполнить {L} начальных шагов ленточного\n"
                                "алгоритма и вывести в каждом процессе новое содержимое полос {C}_{R} и {A}_{R}\n"
                                "(ввод и вывод данных выполнять во внешней функции Solve).\n"
                                "\\P\\SПримечание.\\s Если значение {L} равно {K}, то полосы {C}_{R} будут содержать\n"
                                "соответствующие фрагменты итогового матричного произведения {A}{B}.");
                        cnt = RandomN(3, n);
        }

        MakeDim2();
        Init2();

        y = 1;
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("P = ", p, 21, y, 1);
                DataN("N_B = ", k2, 29, y++, 1);
        //      DataN("Q = ", q, 38, y++, 1);
                DataMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                DataMatr1(ind("B", i, ":").c_str(), &b[i*k2], p, k2, k2*n, y);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1*n, k2, k2*n, y);
                if (cnt > 2)
                        DataN("L = ", cnt, 12, y++, 1);
        }
        Prod2(cnt, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1 *n, k2, k2*n, y);
                ResultMatr1(ind("A", i, ":").c_str(), &a[(i + cnt) % n*k1*p], k1, p, p, y);
        }
        Delete1();
}

void Matr2GatherData()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M} и {Q}~\\= количество строк и столбцов\n"
                        "результирующего матричного произведения. Кроме того, в каждом процессе даны\n"
                        "числа {N}_{A}, {N}_{B}, а также одномерные массивы, заполненные полосами матрицы {C}\n"
                        "(размера ({N}_{A}\\*{K})~\\x~{N}_{B}), которые были получены в результате выполнения {K} шагов\n"
                        "ленточного алгоритма перемножения матриц (см. \\1). Переслать\n"
                        "все полосы {C}_{R} в главный процесс и вывести в нем полученную матрицу {C}\n"
                        "(размера {M}~\\x~{Q}).\n"
                        "\\PДля хранения результирующей матрицы {C} в главном процессе использовать\n"
                        "одномерный массив, достаточный для хранения матрицы размера ({N}_{A}\\*{K})~\\x~({N}_{B}\\*{K}).\n"
                        "Для пересылки полос {C}_{R} использовать функции MPI\\_Send и MPI\\_Recv, а также\n"
                        "вспомогательный тип MPI\\_BAND\\_C, созданный с помощью функции\n"
                        "Matr2CreateTypeBand (см. задание \\5 и примечание к нему).\n"
                        "\\PОформить эти действия в виде функции Matr2GatherData (без параметров).\n"
                        "Ввод данных выполнять во внешней функции Solve, вывод полученной матрицы\n"
                        "включить в функцию Matr2GatherData.\n"
                        "\\P\\SУказание.\\s При выводе матрицы {C} в главном процессе следует учитывать,\n"
                        "что предназначенный для ее хранения массив может содержать элементы,\n"
                        "соответствующие дополнительным нулевым столбцам.");

        MakeDim2();
        Init2();

        Prod2(n, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                if (i == 0)
                {
                        DataN("M = ", m, 12, y, 1);
                        DataN("Q = ", q, 21, y++, 1);
                }
                DataN("N_A = ", k1, 12, y, 1);
                DataN("N_B = ", k2, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1 *n, k2, k2*n, y);
        }
        y = 1;
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k2*n, y);
//      Prod2Test();
//      ResultMatr1(ind('D', 0, ":").c_str(), &d[0], k1*n, q, q, y);
        Delete1();
}


void Matr2Complete()
{
        n = RandomN(3, 4);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно (таким образом, исходные данные совпадают с исходными данными\n"
                        "для задания \\5).\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\5\\-\\1\n"
                        "функции Matr2ScatterData, Matr2Calc (в цикле) и Matr2GatherData, получить\n"
                        "и вывести в главном процессе матрицу {C}, равную\n"
                        "произведению исходных матриц {A} и {B}.\n"
                        "\\PПосле каждого вызова функции Matr2Calc дополнительно выводить в каждом\n"
                        "процессе текущее содержимое полосы {C}_{R}.\n"
                        "\\PПеред использованием в данном задании следует модифицировать разработанную\n"
                        "в \\3 функцию Matr2Calc таким образом, чтобы при значении\n"
                        "параметра step, равном {K}~\\-~1, не выполнялась пересылка полос {A}_{R}.");
                do
        { 
        MakeDim2();
        } while (n*n*n* k1*k2 > 600 || n*n*n*k1+2*n*n+1 > 250);
        Init2();

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, p, y);
        DataMatr1("B:", b, p, q, k2*n, y);
        y = 1;
        Prod2(n, 1);
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k2*n, y);

//              Prod2Test();
//              ResultMatr1(ind('D', 0, ":").c_str(), &d[0], m, q, q, y);

        Delete1();
}

void Matr2ScatterFile()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена двух файлов, содержащих\n"
                        "элементы матриц {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно. Известно,\n"
                        "что число {Q} кратно количеству процессов {K}. Модифицировать начальный этап\n"
                        "ленточного алгоритма перемножения матриц (см. \\6) таким образом,\n"
                        "чтобы каждый процесс считывал соответствующие полосы матриц {A} и {B}\n"
                        "непосредственно из исходных файлов.\n"
                        "\\PДля пересылки размеров матриц и имен файлов использовать коллективную\n"
                        "функцию MPI\\_Bcast. Для считывания горизонтальных полос матрицы {A} использовать\n"
                        "коллективные функции MPI\\_File\\_seek и MPI\\_File\\_read\\_all; для считывания\n"
                        "вертикальных полос матрицы {B} задать соответствующий вид данных, используя\n"
                        "функцию MPI\\_File\\_set\\_view и новый файловый тип MPI\\_BAND\\_B, определенный\n"
                        "с помощью функции Matr2CreateTypeBand (см. \\7), после чего\n"
                        "также использовать функцию MPI\\_File\\_read\\_all.\n"
                        "\\PОформить все действия в виде функции Matr2ScatterFile (без параметров),\n"
                        "в результате вызова которой каждый процесс получает значения {N}_{A}, {P}, {N}_{B},\n"
                        "а также одномерные массивы, заполненные соответствующими полосами\n"
                        "матриц {A}, {B}, {C}. После вызова функции Matr2ScatterFile вывести в каждом\n"
                        "процессе полученные данные (числа {N}_{A}, {P}, {N}_{B} и полосы матриц {A}, {B}, {C}).\n"
                        "Ввод исходных данных осуществлять в функции Matr2ScatterFile,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SПримечание.\\s Дополнительное условие о кратности значения {Q} числу {K} позволяет\n"
                        "организовать считывание полос {B}_{R} с использованием одинакового файлового типа\n"
                        "во всех процессах.\n"
                        "\\PПри отсутствии этого условия потребовалось бы применять специальные типы,\n"
                        "обеспечивающие корректное считывание из файла и запись в массив \\<укороченных\\>\n"
                        "полос матрицы {B} в последних процессах (кроме того, в этом случае\n"
                        "потребовалось бы переслать каждому процессу значение {Q}, необходимое\n"
                        "для правильного определения типов для \\<укороченных\\> полос).");

        MakeDim2();
        q = n * k2; // для упрощения решения!
        Init2();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m*p; i++)
                fa.write((char*)&a[i], sizeof(a[i]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k2*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y++, 4);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                ResultProcComment(i, y);
                ResultN("N_A = ", k1, 12, y, 1);
                ResultN("P = ", p, 21, y, 1);
                ResultN("N_B = ", k2, 29, y++, 1);
                ResultMatr1(ind("A", i, ":").c_str(), &a[i*k1*p], k1, p, p, y);
                ResultMatr1(ind("B", i, ":").c_str(), &b[i*k2], p, k2, k2*n, y);
                ResultMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1*n, k2, k2*n, y);
        }
        Delete1();
}

void Matr2GatherFile()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {N}_{A}, {N}_{B}, а также одномерные массивы, заполненные\n"
                        "полосами {C}_{R} (размера ({N}_{A}\\*{K})~\\x~{N}_{B}), полученными в результате выполнения {K} шагов\n"
                        "ленточного алгоритма перемножения матриц (см. \\4). Кроме того,\n"
                        "в главном процессе дано число {M}~\\= количество строк результирующего матричного\n"
                        "произведения и имя файла для хранения этого произведения. Дополнительно\n"
                        "известно, что количество столбцов {Q} результирующего матричного произведения\n"
                        "кратно числу процессов (и, следовательно, равно {N}_{B}\\*{K}).\n"
                        "\\PПереслать число {M} и имя файла во все процессы (используя функцию MPI\\_Bcast)\n"
                        "и записать все фрагменты матричного произведения, содержащиеся в полосах {C}_{R},\n"
                        "в результирующий файл, который в итоге будет содержать\n"
                        "матрицу {C} размера {M}~\\x~{Q}.\n"
                        "\\PДля записи полос в файл задать соответствующий вид данных, используя функцию\n"
                        "MPI\\_File\\_set\\_view и новый файловый тип MPI\\_BAND\\_C, определенный с помощью\n"
                        "функции Matr2CreateTypeBand (см. \\8), после чего использовать\n"
                        "коллективную функцию MPI\\_File\\_write\\_all.\n"
                        "\\PОформить считывание имени файла, пересылку значения {M} и имени файла, а также\n"
                        "все действия по записи полос в файл в виде функции Matr2GatherFile\n"
                        "(считывание всех исходных данных, кроме имени файла,\n"
                        "должно осуществляться во внешней функции Solve).\n"
                        "\\P\\SУказание.\\s При записи данных в результирующий файл необходимо учитывать,\n"
                        "что полосы {C}_{R} могут содержать завершающие нулевые строки, не связанные\n"
                        "с полученным произведением (именно для проверки этой ситуации\n"
                        "требуется пересылать во все процессы значение {M}).");

        MakeDim2();
        q = n * k2; // для упрощения решения!
        Init2();

        Prod2(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";
//      DataS("Имя файла для матрицы C: ", sc.c_str(), 1, y++);
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("N_B = ", k2, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1 *n, k2, k2*n, y);
                if (i == 0)
                {
                        DataN("M = ", m, 12, y++, 1);
//                      DataN("Q = ", q, 21, y++, 1); // не нужно, учитывая, что q = n * k2
                        DataS("Имя файла для матрицы C: ", sc.c_str(), 12, y++);
                }
        }
        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k2*n+j], sizeof(c[0]));
        fc.close();
        y = 1;
        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);

        Delete1();
}

void Matr2CompleteFile()
{
        n = RandomN(3, 5);
        CreateTask(topic2, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена трех файлов: вначале\n"
                        "даются имена двух существующих файлов, содержащих элементы матриц {A} и {B}\n"
                        "размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно, а затем имя файла для хранения\n"
                        "результирующего матричного произведения {C}~=~{A}{B}. Дополнительно известно,\n"
                        "что число {Q} кратно количеству процессов {K}.\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\2, \\5\n"
                        "и \\1 функции Matr2ScatterFile, Matr2Calc (в цикле) и Matr2GatherFile,\n"
                        "получить в результирующем файле произведение исходных матриц {A} и {B}, найденное\n"
                        "с помощью второго варианта ленточного алгоритма.\n"
                        "\\PПосле каждого вызова функции Matr2Calc дополнительно выводить в каждом\n"
                        "процессе текущее значение элемента c[step], где c~\\= одномерный массив,\n"
                        "содержащий полосу {C}_{R}, а step~\\= номер шага алгоритма (0, 1,~\\., {K}~\\-~1);\n"
                        "таким образом, на первом шаге алгоритма следует вывести элемент c[0],\n"
                        "на втором шаге~\\= элемент c[1], и~т.\\,д.");

        MakeDim2();
        q = n * k2; // для упрощения решения!
        Init2();

        t = new int[n*n];
        InitConst(t, n, n, n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst",
                sc = "C" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m*p; i++)
                fa.write((char*)&a[i], sizeof(a[i]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k2*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        DataS("Имя файла для матрицы C: ", sc.c_str(), xRight, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);

        y = 1;
        Prod2(n, 2);
        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k2*n + j], sizeof(c[0]));
        fc.close();

        for (int i = 0; i < n; i++)
        {
                if (i % 2 == 0)
                        x = 0;
                else
                        x = 40;
                ResultProcComment(i, x + 1, y);
                ResultMatr0(&t[i*n], 1, n, n, x + 11, y);
                //              y++;
                if (i % 2 == 0)
                        y--;
        }
        if (n % 2 != 0)
                y++;


        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);
        Delete1();
}


void Matr3CreateBlockType()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M} и {P}; кроме того, в главном процессе дана\n"
                        "матрица {A} размера {M}~\\x~{P}. Известно, что количество процессов {K} является полным\n"
                        "квадратом: {K}~=~{K}_0\\*{K}_0, а числа {M} и {P} кратны числу {K}_0. Прочесть в главном\n"
                        "процессе матрицу {A} в одномерный массив размера {M}\\*{P} и определить новый тип\n"
                        "MPI\\_BLOCK\\_A, содержащий блок матрицы {A} размера {M}_0~\\x~{P}_0,\n"
                        "где {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\PПри определении типа MPI\\_BLOCK\\_A использовать функции MPI\\_Type\\_vector\n"
                        "и MPI\\_Type\\_commit, оформив это определение в виде функции\n"
                        "Matr4CreateTypeBlock(m0, p0, p, t), где целочисленные параметры m0, p0, p\n"
                        "являются входными, а параметр t типа MPI\\_Datatype является выходным;\n"
                        "при этом параметры m0 и p0 определяют размеры блока, а параметр p~\\= число\n"
                        "столбцов матрицы, из которой извлекается этот блок.\n"
                        "\\PИспользуя тип MPI\\_BLOCK\\_A, переслать в каждый процесс (включая главный)\n"
                        "соответствующий блок матрицы {A}, перебирая блоки по строкам и пересылая их\n"
                        "в процессы в порядке возрастания их рангов (первый блок пересылается\n"
                        "в процесс 0, следующий за ним блок в этой же строке пересылается в процесс 1,\n"
                        "и~т.\\,д.). Пересылку выполнять с помощью коллективной функции MPI\\_Alltoallw;\n"
                        "блоки хранить в одномерных массивах размера {M}_0\\*{P}_0.\n"
                        "Вывести в каждом процессе полученный блок.\n"
                        "\\P\\SУказания.\\s (1) При выполнении задания с применением библиотеки MPI-1 вместо\n"
                        "функции MPI\\_Alltoallw следует использовать функции MPI\\_Send и MPI\\_Recv.\n"
                        "\\P(2) Функция MPI\\_Alltoallw, введенная в MPI-2, является единственной\n"
                        "коллективной функцией, которая позволяет указывать смещения для пересылаемых\n"
                        "данных в \\Iбайтах\\i, а не в элементах. Это дает возможность использовать ее\n"
                        "совместно со сложными типами данных для реализации любых вариантов\n"
                        "коллективных обменов (в данном случае требуется реализовать вариант\n"
                        "вида Scatter).\n"
                        "\\PСледует учитывать, что при подобном варианте рассылки все параметры-массивы\n"
                        "функции MPI\\_Alltoallw, связанные с посылаемыми данными, необходимо по-разному\n"
                        "определять в главном и подчиненных процессах. В частности, массив scounts\n"
                        "(определяющий количество посылаемых данных) должен содержать значения 0\n"
                        "во всех подчиненных процессах и значения 1 в главном процессе\n"
                        "(посылаемые элементы имеют тип MPI\\_BLOCK\\_A).\n"
                        "\\PВ то же время, массивы, связанные с принимаемыми данными, будут определяться\n"
                        "одинаковым образом во всех процессах; в частности, в массиве rcounts\n"
                        "(определяющем количество принимаемых данных) элемент с индексом 0 должен быть\n"
                        "равен {M}_0\\*{P}_0, а все остальные элементы должны быть равны 0\n"
                        "(принимаемые элементы имеют тип MPI\\_INT).\n"
                        "\\PНеобходимо обратить особое внимание на правильное определение элементов\n"
                        "в массиве sdispls смещений для посылаемых данных в главном процессе\n"
                        "(в подчиненных процессах этот массив достаточно обнулить).");
                n = (int)round(sqrt(n));
        MakeDim3();
        m = n * k1;
        p = n * k2;
        Init3();
        y = 1;
        for (int i = 0; i < n*n; i++)
        {
                DataProcComment(i, y);
                int x0 = (i < 10) ? 0 : 1;
                DataN("M = ", m, 12 + x0, y, 1);
                DataN("P = ", p, 20 + x0, y++, 1);
                if (i == 0)
                        DataMatr1("A:", a, m, p, k2*n, y);
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr3CreateRowComm()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M}_0 и {P}_0, а также матрица {A} размера {M}_0~\\x~{P}_0.\n"
                        "Известно, что количество процессов {K} является полным квадратом: {K}~=~{K}_0\\*{K}_0.\n"
                        "Прочесть в каждом процессе матрицу {A} в одномерный массив размера {M}_0\\*{P}_0\n"
                        "и определить на множестве исходных процессов коммуникатор MPI\\_COMM\\_GRID,\n"
                        "задающий декартову топологию двумерной квадратной циклической решетки\n"
                        "порядка {K}_0 (исходный порядок нумерации процессов сохраняется).\n"
                        "\\PПри определении коммуникатора MPI\\_COMM\\_GRID использовать функцию\n"
                        "MPI\\_Cart\\_create, оформив это определение в виде функции\n"
                        "Matr4CreateCommGrid(comm) с выходным параметром comm типа MPI\\_Comm.\n"
                        "Вывести в каждом процессе координаты ({I}_0, {J}_0) этого процесса\n"
                        "в созданной топологии, используя функцию MPI\\_Cart\\_coords.\n"
                        "\\PНа основе коммуникатора MPI\\_COMM\\_GRID создать набор коммуникаторов\n"
                        "MPI\\_COMM\\_ROW, связанных со строками исходной двумерной решетки.\n"
                        "Для определения коммуникаторов MPI\\_COMM\\_ROW использовать функцию\n"
                        "MPI\\_Cart\\_sub, оформив это определение в виде вспомогательной функции\n"
                        "Matr4CreateCommRow(grid, row) с входным параметром grid (коммуникатором,\n"
                        "связанным с исходной двумерной решеткой) и выходным параметром row\n"
                        "(оба параметра типа MPI\\_Comm). Вывести в каждом процессе его ранг {R}_0\n"
                        "для коммуникатора MPI\\_COMM\\_ROW (этот ранг должен совпадать со значением {J}_0).\n"
                        "\\PКроме того, для каждой строки {I}_0 полученной решетки осуществить пересылку\n"
                        "матрицы {A} из столбца {I}_0 во все процессы этой же строки, используя коллективную\n"
                        "функцию MPI\\_Bcast для коммуникатора MPI\\_COMM\\_ROW и сохранив результат\n"
                        "во вспомогательной матрице {T} того же размера, что и матрица {A}\n"
                        "(перед пересылкой необходимо скопировать в матрицу {T} рассылающего процесса\n"
                        "элементы пересылаемой матрицы {A}). Вывести в каждом процессе\n"
                        "полученную матрицу {T}.");
                n = (int)round(sqrt(n));
        MakeDim3();
        m = n * k1;
        p = n * k2;
        Init3();
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("I_0= ", i, x + 1, y3, 1);
                        ResultN("J_0= ", j, x + 7, y3, 1);
                        ResultN("R_0= ", j, x + 13, y3++, 1);
                        ResultMatr2((ind("T", i * n + j, " (") + ind("A", i * n + (i) % n, "):")).c_str(), &a[i*k1*k2*n + (i) % n * k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr3CreateColComm()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {P}_0 и {Q}_0, а также матрица {B} размера {P}_0~\\x~{Q}_0.\n"
                        "Известно, что количество процессов {K} является полным квадратом: {K}~=~{K}_0\\*{K}_0.\n"
                        "Прочесть в каждом процессе матрицу {B} в одномерный массив размера {P}_0\\*{Q}_0\n"
                        "и определить на множестве исходных процессов коммуникатор MPI\\_COMM\\_GRID,\n"
                        "задающий декартову топологию двумерной квадратной циклической решетки\n"
                        "порядка {K}_0.\n"
                        "\\PДля определения коммуникатора MPI\\_COMM\\_GRID использовать функцию\n"
                        "Matr4CreateCommGrid (см. задание \\1). Вывести в каждом процессе\n"
                        "его координаты ({I}_0, {J}_0) в созданной топологии,\n"
                        "используя функцию MPI\\_Cart\\_coords.\n"
                        "\\PНа основе коммуникатора MPI\\_COMM\\_GRID создать набор коммуникаторов\n"
                        "MPI\\_COMM\\_COL, связанных со столбцами исходной двумерной решетки.\n"
                        "Для определения коммуникаторов MPI\\_COMM\\_COL использовать функцию MPI\\_Cart\\_sub,\n"
                        "оформив это определение в виде функции Matr4CreateCommCol(grid, col) с входным\n"
                        "параметром grid (коммуникатором, связанным с исходной двумерной решеткой)\n"
                        "и выходным параметром col (оба параметра типа MPI\\_Comm). Вывести в каждом\n"
                        "процессе его ранг {R}_0 для коммуникатора MPI\\_COMM\\_COL\n"
                        "(этот ранг должен совпадать со значением {I}_0).\n"
                        "\\PКроме того, для каждого столбца {J}_0 полученной решетки осуществить циклический\n"
                        "сдвиг матриц {B} на 1 позицию вверх (т.\\,е. в направлении убывания рангов\n"
                        "процессов), используя функции MPI\\_Sendrecv\\_replace для коммуникатора\n"
                        "MPI\\_COMM\\_COL (при определении рангов процесса-отправителя\n"
                        "и процесса-получателя использовать операцию % взятия остатка от деления).\n"
                        "Вывести в каждом процессе матрицу, полученную в результате сдвига.");
                n = (int)round(sqrt(n));
        MakeDim3();
        p = n * k2;
        q = n * k3;
        Init3();
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("P_0= ", k2, x + 1, y3, 1);
                        DataN("Q_0= ", k3, x + 7, y3++, 1);
                        DataMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("I_0= ", i, x + 1, y3, 1);
                        ResultN("J_0= ", j, x + 7, y3, 1);
                        ResultN("R_0= ", i, x + 13, y3++, 1);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + 1) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}


void Matr3ScatterData()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно. Известно, что количество процессов {K} является полным\n"
                        "квадратом: {K}~=~{K}_0\\*{K}_0. В блочных алгоритмах перемножения матриц исходные\n"
                        "матрицы разбиваются на {K} блоков, образуя квадратные блочные матрицы порядка {K}_0\n"
                        "(в дальнейшем блоки распределяются по процессам и используются для вычисления\n"
                        "в каждом процессе части итогового матричного произведения).\n"
                        "\\PБлок для матрицы {A} имеет размер {M}_0~\\x~{P}_0, блок для матрицы {B} имеет\n"
                        "размер {P}_0~\\x~{Q}_0; числа {M}_0, {P}_0, {Q}_0 вычисляются по формулам {M}_0~=~ceil({M}/{K}_0),\n"
                        "{P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), где операция \\</\\> означает вещественное\n"
                        "деление, а функция ceil выполняет округление с избытком. Если матрица содержит\n"
                        "недостаточно строк (или столбцов) для заполнения последних блоков, то блоки\n"
                        "дополняются нулевыми строками (столбцами).\n"
                        "\\PСохранить исходные матрицы {A} и {B}, дополненные при необходимости нулевыми\n"
                        "строками и столбцами до размеров ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0) и ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0),\n"
                        "в одномерных массивах в главном процессе, после чего организовать пересылку\n"
                        "блоков из этих массивов во все процессы, перебирая блоки по строкам\n"
                        "и пересылая их в процессы в порядке возрастания их рангов (процесс ранга {R}\n"
                        "получит блоки {A}_{R} и {B}_{R}, {R}~=~0,~\\., {K}~\\-~1). Кроме того, создать в каждом\n"
                        "процессе два блока, заполненных нулевыми элементами: блок {C}_{R} размера {M}_0~\\x~{Q}_0\n"
                        "для хранения фрагмента матричного произведения {C}~=~{A}{B}, которое будет\n"
                        "вычисляться в этом процессе, и вспомогательный блок {T}_{R}\n"
                        "того же размера {M}_0~\\x~{P}_0, что и блок {A}_{R}.\n"
                        "\\PБлоки, как и исходные матрицы, должны храниться по строкам в одномерных\n"
                        "массивах соответствующего размера. Для пересылки размеров матриц использовать\n"
                        "коллективную функцию MPI\\_Bcast, для пересылки блоков матриц {A} и {B} использовать\n"
                        "коллективную функцию MPI\\_Alltoallw, а также вспомогательные типы MPI\\_BLOCK\\_A\n"
                        "и MPI\\_BLOCK\\_B, созданные с помощью функции Matr4CreateTypeBlock\n"
                        "(см. задание \\3, а также указания к нему).\n"
                        "\\PОформить все описанные действия в виде функции Matr4ScatterData\n"
                        "(без параметров), в результате вызова которой каждый процесс получает\n"
                        "значения {M}_0, {P}_0, {Q}_0, а также одномерные массивы, содержащие элементы\n"
                        "блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R}. После вызова функции Matr4ScatterData вывести\n"
                        "в каждом процессе полученные данные (числа {M}_0, {P}_0, {Q}_0 и блоки {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}).\n"
                        "Ввод исходных данных осуществлять в функции Matr4ScatterData, вывод данных\n"
                        "выполнять во внешней функции Solve.\n"
                        "\\P\\SУказания.\\s (1) При считывании матриц {A} и {B} в главном процессе следует\n"
                        "учитывать, что предназначенные для ее хранения массивы могут содержать\n"
                        "элементы, соответствующие дополнительным нулевым столбцам.\n"
                        "\\P(2) Для уменьшения числа вызовов функции MPI\\_Bcast все пересылаемые размеры\n"
                        "матриц можно поместить во вспомогательный массив.");
                n = (int)round(sqrt(n));
        MakeDim3();
        Init3();

        t = new int[k1*n*k2*n];
        InitConst(t, k1*n, k2*n, k2*n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, k2*n, y);
        DataMatr1("B:", b, p, q, k3*n, y);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x+1, y3++);
                        ResultN("M_0= ", k1, x + 1, y3, 1);
                        ResultN("P_0= ", k2, x + 7, y3, 1);
                        ResultN("Q_0= ", k3, x+ 13, y3++, 1);
                        ResultMatr2(ind("A", i*n + j, ":").c_str(), &a[i*k1*k2*n+j*k2], k1, k2, k2*n, x+1, y3);
                        ResultMatr2(ind("B", i*n + j, ":").c_str(), &b[i*k2*k3*n+j*k3], k2, k3, k3*n, x+1, y3);
                        ResultMatr2(ind("C", i*n + j, ":").c_str(), &c[i*k1*k3*n+j*k3], k1, k3, k3*n, x+1, y3);
                        ResultMatr2(ind("T", i*n + j, ":").c_str(), &t[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr3Calc1(int cnt)
{
        n = RandomN(2, 4);
        if (cnt == 3)
                n = RandomN(3, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

        n = (int)round(sqrt(n));

        if (cnt == 1)

                        TaskText(
                                "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                                "содержащие элементы блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R} (таким образом, исходные данные\n"
                                "совпадают с результатами, полученными в задании \\1). Каждый шаг\n"
                                "блочного алгоритма Фокса перемножения матриц состоит из двух этапов.\n"
                                "\\PНа первом этапе первого шага для каждой строки {I}_0 квадратной решетки\n"
                                "процессов порядка {K}_0 ({I}_0~=~0,~\\., {K}_0~\\-~1, где {K}_0\\*{K}_0 равно количеству\n"
                                "процессов) выполняется пересылка блока {A}_{R} из процесса, расположенного\n"
                                "в строке {I}_0 и столбце с тем же номером {I}_0, во все процессы этой же строки\n"
                                "(с сохранением пересланного блока в блоке {T}_{R}), после чего полученный\n"
                                "в результате этой пересылки блок {T}_{R} умножается на блок {B}_{R} из этого процесса,\n"
                                "и результат добавляется к блоку {C}_{R}.\n"
                                "\\PРеализовать первый этап первого шага алгоритма Фокса. Для пересылки блоков {A}_{R}\n"
                                "использовать функцию MPI\\_Bcast для коммуникатора MPI\\_COMM\\_ROW, создав этот\n"
                                "коммуникатор с помощью функции Matr4CreateCommRow (см. задание \\3,\n"
                                "в котором описывается аналогичная пересылка данных).\n"
                                "\\PОформить все описанные действия в виде функции Matr4Calc1 (без параметров).\n"
                                "Вывести новое содержимое блоков {T}_{R} и {C}_{R} в каждом процессе (ввод и вывод данных\n"
                                "выполнять во внешней функции Solve).");
                else if (cnt == 2)
                        TaskText(
                                "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                                "содержащие элементы блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R} (таким образом, исходные данные\n"
                                "совпадают с результатами, полученными в задании \\3).\n"
                                "\\PМодифицировать функцию Matr4Calc1, реализованную в задании \\2,\n"
                                "таким образом, чтобы она обеспечивала выполнение первого этапа на любом шаге\n"
                                "алгоритма Фокса. Для этого добавить к ней параметр step, определяющий\n"
                                "номер шага (изменяется от 0 до {K}_0~\\-~1, где {K}_0~\\= порядок декартовой решетки\n"
                                "процессов), и учесть значение этого шага при рассылке блоков {A}_{R}: на шаге step\n"
                                "для каждой строки {I}_0 декартовой решетки должна выполняться рассылка блока {A}_{R}\n"
                                "из процесса, расположенного в столбце с номером ({I}_0~+~step)%{K}_0 (действия,\n"
                                "связанные с пересчетом блоков {C}_{R}, от номера шага не зависят).\n"
                                "\\PВыполнить два начальных шага алгоритма Фокса, последовательно вызвав функции\n"
                                "Matr4Calc1(0), Matr4Calc2() (обеспечивающую второй этап шага алгоритма~\\=\n"
                                "см. \\1) и Matr4Calc1(1), и вывести в каждом процессе новое содержимое\n"
                                "блоков {T}_{R}, {B}_{R} и {C}_{R} (ввод и вывод данных выполнять во внешней функции Solve).");
                else
        {
                        TaskText(
                                "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                                "содержащие элементы блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R} (таким образом, исходные данные\n"
                                "совпадают с результатами, полученными в задании \\4). Кроме того,\n"
                                "в каждом процессе дано одно и то же число {L}, лежащее в диапазоне от 3 до {K}_0\n"
                                "и определяющее требуемое число шагов алгоритма Фокса.\n"
                                "\\PВыполнить {L} начальных шагов алгоритма Фокса, вызвав функции, разработанные\n"
                                "в заданиях \\1 и \\2, в следующей последовательности:\n"
                                "Matr4Calc1(0), Matr4Calc2(), Matr4Calc1(1), Matr4Calc2(),~\\.,\n"
                                "Matr4Calc1({L}~\\-~1). Вывести в каждом процессе новое содержимое блоков {T}_{R},\n"
                                "{B}_{R} и {C}_{R} (ввод и вывод данных выполнять во внешней функции Solve).\n"
                                "\\P\\SПримечание.\\s Если значение {L} равно {K}_0, то блоки {C}_{R} будут содержать\n"
                                "соответствующие фрагменты матричного произведения {A}{B}. Обратите внимание на то,\n"
                                "что второй этап (связанный с вызовом функции Matr4Calc2) на последнем шаге\n"
                                "алгоритма выполнять не требуется.");
                        cnt = RandomN(3, n);
        }

/*    if (cnt > 2)
        {
                do
                {
                        MakeDim3();
                } while (n == 4 && k1*k3 >= 9);
        }
*/
        MakeDim3();
        Init3();

        t = new int[k1*n*k2*n];
        InitConst(t, k1*n, k2*n, k2*n, 0);

//      ShowDebugInfo(to_string(k1*k3).c_str());
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3, 1);
                        DataN("Q_0= ", k3, x + 13, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        DataMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("T", i * n + j, ":").c_str(), &t[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        if (cnt > 2)
                                DataN("L = ", cnt, x + 1, y3++, 1);
                        x += 20;
                }
                y += y3;
        }
        y = 1;
//      Prod3Test();
        Prod3(cnt, 0);
//      Prod3Test();
//      ResultMatr1("C:", c, m, q, k3*n, y);
//      ResultMatr1("D:", d, m, q, k3*n, y);

//      Prod3(cnt, false);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                                ResultMatr2((ind("T", i * n + j, " (") + ind("A", i * n + (i) % n, "):")).c_str(), &a[i*k1*k2*n + (i + cnt-1) % n * k2], k1, k2, k2*n, x + 1, y3);
                        if (cnt != 1)
                                ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + cnt-1) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                                ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        //      Prod3Test();
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        Delete1();
}

void Matr3Calc2()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

        n = (int)round(sqrt(n));

                TaskText(
                        "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                        "содержащие элементы блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R} (таким образом, исходные данные\n"
                        "совпадают с результатами, полученными в задании \\2).\n"
                        "\\PРеализовать второй этап первого шага алгоритма Фокса, который состоит\n"
                        "в циклическом сдвиге блоков {B}_{R} для каждого столбца декартовой решетки\n"
                        "на 1 позицию вверх (т.\\,е. в направлении убывания рангов процессов).\n"
                        "\\PДля циклической пересылки блоков {B}_{R} использовать функцию MPI\\_Sendrecv\\_replace\n"
                        "для коммуникатора MPI\\_COMM\\_COL, создав этот коммуникатор с помощью функции\n"
                        "Matr4CreateCommCol (см. задание \\3, в котором описывается\n"
                        "аналогичная пересылка данных).\n"
                        "\\PОформить эти действия в виде функции Matr4Calc2 (без параметров).\n"
                        "Вывести новое содержимое блока {B}_{R} в каждом процессе\n"
                        "(ввод и вывод данных выполнять во внешней функции Solve).");

        /*    if (cnt > 2)
        {
        do
        {
        MakeDim3();
        } while (n == 4 && k1*k3 >= 9);
        }
        */
        MakeDim3();
        Init3();

        t = new int[k1*n*k2*n];
        InitConst(t, k1*n, k2*n, k2*n, 0);

        //      ShowDebugInfo(to_string(k1*k3).c_str());
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3, 1);
                        DataN("Q_0= ", k3, x + 13, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        DataMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("T", i * n + j, ":").c_str(), &t[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y += y3;
        }
        y = 1;
        //      Prod3Test();
        Prod3(1, 0);
        //      ResultN(y, 1, 1, 3);
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        //      Prod3(cnt, false);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + 1) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr3GatherData()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M} и {Q}~\\= число строк и столбцов результирующего\n"
                        "матричного произведения. Кроме того, в каждом процессе даны числа {M}_0, {Q}_0,\n"
                        "а также одномерные массивы, заполненные блоками матрицы {C} (размера {M}_0~\\x~{Q}_0),\n"
                        "которые были получены в результате выполнения {K}_0 шагов блочного\n"
                        "алгоритма Фокса перемножения матриц (см. \\1).\n"
                        "\\PПереслать все блоки {C}_{R} в главный процесс и вывести в нем полученную матрицу {C}\n"
                        "(размера {M}~\\x~{Q}). Для хранения результирующей матрицы {C} в главном процессе\n"
                        "использовать одномерный массив, достаточный для хранения матрицы\n"
                        "размера ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0). Для пересылки блоков {C}_{R} использовать коллективную\n"
                        "функцию MPI\\_Alltoallw, а также вспомогательный тип MPI\\_BLOCK\\_C, созданный\n"
                        "с помощью функции Matr4CreateTypeBlock (см. задание \\8,\n"
                        "а также указания к нему).\n"
                        "\\PОформить эти действия в виде функции Matr4GatherData (без параметров).\n"
                        "Ввод данных выполнять во внешней функции Solve, вывод полученной матрицы\n"
                        "включить в функцию Matr4GatherData.\n"
                        "\\P\\SУказание.\\s При выводе матрицы {C} в главном процессе следует учитывать,\n"
                        "что предназначенный для ее хранения массив может содержать элементы,\n"
                        "соответствующие дополнительным нулевым столбцам.");
                n = (int)round(sqrt(n));

        MakeDim3();
        Init3();

        Prod3(n, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        if (i == 0 && j == 0)
                        {
                                DataN("M = ", m, x + 1, y3, 1);
                                DataN("Q = ", q, x + 8, y3, 1);
                        }
                        y3++;
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("Q_0= ", k3, x + 8, y3++, 1);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y += y3;
        }
        //      Prod3Test();
        //      ResultN(y, 1, 1, 3);
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        //      Prod3(cnt, false);
        y = 1;
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k3*n, y);
//              Prod3Test();
//              ResultMatr1("D:", d, m, q, k3*n, y);
        Delete1();
}

void Matr3Complete()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно (таким образом, исходные данные совпадают с исходными данными\n"
                        "для задания \\6).\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\6\\-\\1\n"
                        "функции Matr4ScatterData, Matr4Calc1, Matr4Calc2 и Matr4GatherData, получить\n"
                        "и вывести в главном процессе матрицу {C}, равную произведению исходных\n"
                        "матриц {A} и {B}. Функции Matr4Calc1 и Matr4Calc2 должны вызываться в цикле,\n"
                        "причем количество вызовов функции Matr4Calc2 должно быть на 1 меньше\n"
                        "количества вызовов функции Matr4Calc1.\n"
                        "\\PПосле каждого вызова функции Matr4Calc1 дополнительно выводить в каждом\n"
                        "процессе текущее содержимое блока {C}_{R}.\n"
                        "\\PДля того чтобы вспомогательные коммуникаторы MPI\\_COMM\\_GRID, MPI\\_COMM\\_ROW\n"
                        "и MPI\\_COMM\\_COL, используемые в функциях Matr4Calc1 и Matr4Calc2,\n"
                        "не создавались несколько раз, модифицировать функции Matr4CreateCommGrid,\n"
                        "Matr4CreateCommRow, Matr4CreateCommCol (см. \\8 и \\7)\n"
                        "таким образом, чтобы при их вызове для уже определенного коммуникатора\n"
                        "(не равного MPI\\_COMM\\_NULL) они не выполняли никаких действий.");

        n = (int)round(sqrt(n));

        do
        {
                MakeDim3();
        } while (n == 4 && k1*k3 >= 9);

        Init3();

        y = 1;
        DataProcComment(0, y);

        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, k2*n, y);
        DataMatr1("B:", b, p, q, k3*n, y);

        y = 1;
        Prod3(n, 1);
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k3*n, y);

        //              Prod2Test();
        //              ResultMatr1(ind('D', 0, ":").c_str(), &d[0], m, q, q, y);

        Delete1();
}

void Matr3ScatterFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена двух файлов, содержащих\n"
                        "элементы матриц {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно. Дополнительно\n"
                        "известно, что числа {M}, {P} и {Q} кратны порядку {K}_0 квадратной решетки процессов.\n"
                        "\\PМодифицировать этап формирования блоков для блочного алгоритма Фокса\n"
                        "перемножения матриц (см. \\7) таким образом, чтобы каждый процесс\n"
                        "считывал соответствующие блоки матриц {A} и {B} непосредственно\n"
                        "из исходных файлов.\n"
                        "\\PДля пересылки размеров матриц и имен файлов использовать коллективную функцию\n"
                        "MPI\\_Bcast. Для считывания блоков задать соответствующий вид данных, используя\n"
                        "функцию MPI\\_File\\_set\\_view и типы MPI\\_BLOCK\\_A и MPI\\_BLOCK\\_B, определенные\n"
                        "с помощью функции Matr4CreateTypeBlock (см. \\10) после чего\n"
                        "использовать коллективную функцию MPI\\_File\\_read\\_all.\n"
                        "\\PОформить все действия в виде функции Matr4ScatterFile (без параметров),\n"
                        "в результате вызова которой каждый процесс получает значения {M}_0, {P}_0, {Q}_0,\n"
                        "одномерные массивы, содержащие элементы блоков {A}_{R}, {B}_{R}, {C}_{R} и {T}_{R} (блоки {C}_{R} и {T}_{R}\n"
                        "должны быть нулевыми). После вызова функции Matr4ScatterFile вывести в каждом\n"
                        "процессе полученные данные (числа {M}_0, {P}_0, {Q}_0 и блоки {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}).\n"
                        "Ввод исходных данных осуществлять в функции Matr4ScatterFile,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SПримечание.\\s Дополнительное условие о кратности чисел {M}, {P}, {Q} числу {K}_0\n"
                        "означает, что блоки, полученные из матриц {A} и {B}, не требуется дополнять\n"
                        "нулевыми строками и/или столбцами, и поэтому для чтения из файлов блоков\n"
                        "матриц {A} и {B} в любые процессы можно использовать одинаковые файловые\n"
                        "типы MPI\\_BLOCK\\_A и MPI\\_BLOCK\\_B.\n"
                        "\\PПри отсутствии этого условия потребовалось бы применять специальные типы,\n"
                        "обеспечивающие корректное считывание из файла и запись в массив \\<укороченных\\>\n"
                        "блоков матриц {A} и {B} (кроме того, в этом случае потребовалось бы переслать\n"
                        "каждому процессу значения {P} и {Q}, необходимые для правильного\n"
                        "определения типов для \\<укороченных\\> блоков).");

        n = (int)round(sqrt(n));

        MakeDim3();
        m = n * k1; // для упрощения решения!
        p = n * k2;
        q = n * k3;
        Init3();

        t = new int[k1*n*k2*n];
        InitConst(t, k1*n, k2*n, k2*n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < p; j++)
                        fa.write((char*)&a[i*k2*n + j], sizeof(a[0]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k3*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("M_0= ", k1, x + 1, y3, 1);
                        ResultN("P_0= ", k2, x + 7, y3, 1);
                        ResultN("Q_0= ", k3, x + 13, y3++, 1);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        ResultMatr2(ind("T", i * n + j, ":").c_str(), &t[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr3GatherFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M}_0, {Q}_0, а также одномерные массивы, заполненные\n"
                        "блоками {C}_{R} (размера {M}_0~\\x~{Q}_0), полученными в результате выполнения {K}_0 шагов\n"
                        "блочного алгоритма Фокса перемножения матриц (см. \\4). Кроме того,\n"
                        "в главном процессе дано имя файла для хранения результирующего матричного\n"
                        "произведения. Дополнительно известно, что число строк {M} и число столбцов {Q}\n"
                        "матричного произведения кратны порядку {K}_0 квадратной решетки процессов\n"
                        "(таким образом, {M}~=~{M}_0\\*{K}_0, {Q}~=~{Q}_0\\*{K}_0).\n"
                        "\\PПереслать имя файла во все процессы (используя функцию MPI\\_Bcast)\n"
                        "и записать все фрагменты матричного произведения, содержащиеся в блоках {C}_{R},\n"
                        "в результирующий файл, который в итоге будет содержать\n"
                        "матрицу {C} размера {M}~\\x~{Q}.\n"
                        "\\PДля записи блоков задать соответствующий вид данных, используя функцию\n"
                        "MPI\\_File\\_set\\_view и файловый тип MPI\\_BLOCK\\_C, определенный с помощью функции\n"
                        "Matr4CreateTypeBlock (см. \\11), после чего использовать\n"
                        "коллективную функцию MPI\\_File\\_write\\_all.\n"
                        "\\PОформить считывание имени файла, его пересылку, а также все действия по записи\n"
                        "данных в файл в виде функции Matr4GatherFile (считывание всех исходных данных,\n"
                        "кроме имени файла, должно осуществляться во внешней функции Solve).\n"
                        "\\P\\SПримечание.\\s Дополнительное условие о кратности чисел {M} и {Q} числу {K}_0 означает,\n"
                        "что блоки {C}_{R} не содержат \\<лишних\\> нулевых строк и/или столбцов, и поэтому\n"
                        "для их записи в файл из любых процессов можно использовать\n"
                        "одинаковые файловые типы MPI\\_BLOCK\\_C.");
                n = (int)round(sqrt(n));

        MakeDim3();

        m = n * k1; // для упрощения решения!
        p = n * k2;
        q = n * k3;
        Init3();

        Prod3(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";

        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("Q_0= ", k3, x + 7, y3++, 1);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        if (i == 0 && j == 0)
                        {
                        //      DataN("M = ", m, x + 1, y3, 1);
                        //      DataN("Q = ", q, x + 8, y3++, 1);
                                DataComment("Имя файла", 1, y3++);
                                DataComment("  для матрицы C: ", 1, y3++);
                                DataS(sc.c_str(), 3, y3++);
                        }
                        else
                          y3 += 4;
                        x += 20;
                }
                y += y3;
        }


        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k3*n + j], sizeof(c[0]));
        fc.close();
        y = 1;
        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);

        Delete1();
}

void Matr3CompleteFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic3, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена трех файлов: вначале\n"
                        "даются имена двух существующих файлов, содержащих элементы матриц {A} и {B}\n"
                        "размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно, а затем имя файла для хранения\n"
                        "результирующего матричного произведения {C}~=~{A}{B}. Дополнительно известно,\n"
                        "что числа {M}, {P} и {Q} кратны порядку {K}_0 квадратной решетки процессов.\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\2, \\6,\n"
                        "\\7 и \\1 функции Matr4ScatterFile, Matr4Calc1, Matr4Calc2\n"
                        "и Matr4GatherFile, получить в результирующем файле произведение исходных\n"
                        "матриц {A} и {B}, найденное с помощью блочного алгоритма Фокса. Функции\n"
                        "Matr4Calc1 и Matr4Calc2 должны вызываться в цикле, причем количество вызовов\n"
                        "функции Matr4Calc2 должно быть на 1 меньше количества\n"
                        "вызовов функции Matr4Calc1.\n"
                        "\\PПосле каждого вызова функции Matr4Calc1 дополнительно выводить в каждом\n"
                        "процессе текущее значение элемента c[step], где c~\\= одномерный массив,\n"
                        "содержащий блок {C}_{R}, а step~\\= номер шага алгоритма (0, 1,~\\., {K}_0~\\-~1);\n"
                        "таким образом, на первом шаге алгоритма следует вывести элемент c[0],\n"
                        "на втором шаге~\\= элемент c[1], и~т.\\,д.");

        n = (int)round(sqrt(n));

        MakeDim3();

        m = n * k1; // для упрощения решения!
        p = n * k2;
        q = n * k3;

        Init3();

        t = new int[n*n*n];
        InitConst(t, n*n, n, n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst",
                sc = "C" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < p; j++)
                        fa.write((char*)&a[i*k2*n + j], sizeof(a[0]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k3*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        DataS("Имя файла для матрицы C: ", sc.c_str(), xRight, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);

        y = 1;
        Prod3(n, 2);
        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k3*n + j], sizeof(c[0]));
        fc.close();
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        if (n == 4)
                        {
                                int x0 = (j*n + i > 9) ? 0 : 1;
                        ResultProcComment0(j*n + i, x + x0, y3);
                        ResultMatr0(&t[(j*n + i)*n], 1, n, n, x + 3, y3);
                        x += 20;
                        }
                        else
                        {
                                ResultProcComment(j*n + i, x + 1, y3);
                                ResultMatr0(&t[(j*n + i)*n], 1, n, n, x + 11, y3);
                                x += 27;
                        }
                }
                y = y3;
        }


        if (n < 4)
        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);
        Delete1();
}

void Matr4CreateBlockType()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M} и {P}; кроме того, в главном процессе\n"
                        "дана матрица {A} размера {M}~\\x~{P}. Известно, что количество процессов {K}\n"
                        "является полным квадратом: {K}~=~{K}_0\\*{K}_0, а числа {M} и {P} кратны числу {K}_0.\n"
                        "Прочесть в главном процессе матрицу {A} в одномерный массив размера {M}\\*{P}\n"
                        "и определить новый тип MPI\\_BLOCK\\_A, содержащий блок матрицы {A}\n"
                        "размера {M}_0~\\x~{P}_0, где {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\PПри определении типа MPI\\_BLOCK\\_A использовать функции MPI\\_Type\\_vector\n"
                        "и MPI\\_Type\\_commit, оформив это определение в виде функции\n"
                        "Matr3CreateTypeBlock(m0, p0, p, t), где целочисленные параметры m0, p0, p\n"
                        "являются входными, а параметр t типа MPI\\_Datatype является выходным;\n"
                        "при этом параметры m0 и p0 определяют размеры блока, а параметр p~\\= число\n"
                        "столбцов матрицы, из которой извлекается этот блок.\n"
                        "\\PИспользуя тип MPI\\_BLOCK\\_A, переслать в каждый процесс (включая главный)\n"
                        "соответствующий блок матрицы {A}, перебирая блоки по строкам и пересылая их\n"
                        "в процессы в порядке возрастания их рангов (первый блок пересылается\n"
                        "в процесс 0, следующий за ним блок в этой же строке пересылается в процесс 1,\n"
                        "и~т.\\,д.). Пересылку выполнять с помощью функций MPI\\_Send и MPI\\_Recv;\n"
                        "блоки хранить в одномерных массивах размера {M}_0\\*{P}_0.\n"
                        "Вывести в каждом процессе полученный блок.\n"
                        "\\P\\SПримечание.\\s В реализации MPICH2 версии 1.3 с помощью функции MPI\\_Send нельзя\n"
                        "выполнить пересылку данных в тот же процесс, из которого данные посылаются\n"
                        "(происходит зависание программы). Для пересылки блока в главный процесс можно\n"
                        "использовать функцию MPI\\_Sendrecv; можно также заполнить соответствующий блок\n"
                        "в главном процессе, не прибегая к средствам библиотеки MPI.");
                n = (int)round(sqrt(n));
        MakeDim3();
        m = n * k1;
        p = n * k2;
        Init3();
        y = 1;
        for (int i = 0; i < n*n; i++)
        {
                DataProcComment(i, y);
                int x0 = (i < 10) ? 0 : 1;
                DataN("M = ", m, 12 + x0, y, 1);
                DataN("P = ", p, 20 + x0, y++, 1);
                if (i == 0)
                        DataMatr1("A:", a, m, p, k2*n, y);
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr4CreateCartComm()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M}_0 и {P}_0, а также матрица {A} размера {M}_0~\\x~{P}_0.\n"
                        "Известно, что количество процессов {K} является полным квадратом: {K}~=~{K}_0\\*{K}_0.\n"
                        "Прочесть в каждом процессе матрицу {A} в одномерный массив размера {M}_0\\*{P}_0\n"
                        "и определить на множестве исходных процессов коммуникатор MPI\\_COMM\\_GRID,\n"
                        "задающий декартову топологию двумерной квадратной циклической решетки\n"
                        "порядка {K}_0 (исходный порядок нумерации процессов сохраняется).\n"
                        "\\PПри определении коммуникатора MPI\\_COMM\\_GRID использовать функцию\n"
                        "MPI\\_Cart\\_create, оформив это определение в виде функции\n"
                        "Matr3CreateCommGrid(comm) с выходным параметром comm типа MPI\\_Comm. Вывести\n"
                        "в каждом процессе координаты ({I}_0, {J}_0) этого процесса в созданной топологии,\n"
                        "используя функцию MPI\\_Cart\\_coords.\n"
                        "\\PДля каждой строки {I}_0 полученной решетки осуществить циклический сдвиг\n"
                        "матриц {A} на {I}_0 позиций влево (т.\\,е. в направлении убывания рангов процессов),\n"
                        "используя функции MPI\\_Cart\\_shift и MPI\\_Sendrecv\\_replace. Вывести в каждом\n"
                        "процессе матрицу, полученную в результате сдвига.");
                n = (int)round(sqrt(n));
        MakeDim3();
        m = n * k1;
        p = n * k2;
        Init3();
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("I_0= ", i, x + 1, y3, 1);
                        ResultN("J_0= ", j, x + 7, y3++, 1);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + (i + j) % n * k2], k1, k2, k2*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}


void Matr4ScatterData()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно. Известно, что количество процессов {K} является полным\n"
                        "квадратом: {K}~=~{K}_0\\*{K}_0. В блочных алгоритмах перемножения матриц исходные\n"
                        "матрицы разбиваются на {K} блоков, образуя квадратные блочные матрицы порядка {K}_0\n"
                        "(в дальнейшем блоки распределяются по процессам и используются для вычисления\n"
                        "в каждом процессе части итогового матричного произведения).\n"
                        "\\PБлок для матрицы {A} имеет размер {M}_0~\\x~{P}_0, блок для матрицы {B} имеет\n"
                        "размер {P}_0~\\x~{Q}_0; числа {M}_0, {P}_0, {Q}_0 вычисляются по формулам {M}_0~=~ceil({M}/{K}_0),\n"
                        "{P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), где операция \\</\\> означает вещественное\n"
                        "деление, а функция ceil выполняет округление с избытком. Если матрица содержит\n"
                        "недостаточно строк (или столбцов) для заполнения последних блоков, то блоки\n"
                        "дополняются нулевыми строками (столбцами).\n"
                        "\\PСохранить исходные матрицы {A} и {B}, дополненные при необходимости нулевыми\n"
                        "строками и столбцами до размеров ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0) и ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0),\n"
                        "в одномерных массивах в главном процессе, после чего организовать пересылку\n"
                        "блоков из этих массивов во все процессы, перебирая блоки по строкам\n"
                        "и пересылая их в процессы в порядке возрастания их рангов (процесс ранга {R}\n"
                        "получит блоки {A}_{R} и {B}_{R}, {R}~=~0,~\\., {K}~\\-~1). Кроме того, создать в каждом\n"
                        "процессе блок {C}_{R} для хранения фрагмента матричного произведения {C}~=~{A}{B},\n"
                        "которое будет вычисляться в этом процессе; каждый блок {C}_{R} имеет размер {M}_0~\\x~{Q}_0\n"
                        "и заполняется нулевыми элементами.\n"
                        "\\PБлоки, как и исходные матрицы, должны храниться по строкам в одномерных\n"
                        "массивах соответствующего размера. Для пересылки размеров матриц использовать\n"
                        "коллективную функцию MPI\\_Bcast, для пересылки блоков матриц {A} и {B} использовать\n"
                        "функции MPI\\_Send и MPI\\_Recv, а также вспомогательные типы MPI\\_BLOCK\\_A\n"
                        "и MPI\\_BLOCK\\_B, созданные с помощью функции Matr3CreateTypeBlock\n"
                        "(см. задание \\2 и примечание к нему).\n"
                        "\\PОформить все описанные действия в виде функции Matr3ScatterData\n"
                        "(без параметров), в результате вызова которой каждый процесс получает\n"
                        "значения {M}_0, {P}_0, {Q}_0, а также одномерные массивы, заполненные соответствующими\n"
                        "блоками матриц {A}, {B}, {C}. После вызова функции Matr3ScatterData вывести в каждом\n"
                        "процессе полученные данные (числа {M}_0, {P}_0, {Q}_0 и блоки матриц {A}, {B}, {C}).\n"
                        "Ввод исходных данных осуществлять в функции Matr3ScatterData,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SУказания.\\s (1) При считывании матриц {A} и {B} в главном процессе следует\n"
                        "учитывать, что предназначенные для ее хранения массивы могут содержать\n"
                        "элементы, соответствующие дополнительным нулевым столбцам.\n"
                        "\\P(2) Для уменьшения числа вызовов функции MPI\\_Bcast все пересылаемые размеры\n"
                        "матриц можно поместить во вспомогательный массив.");
                n = (int)round(sqrt(n));
        MakeDim3();
        Init3();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, k2*n, y);
        DataMatr1("B:", b, p, q, k3*n, y);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("M_0= ", k1, x + 1, y3, 1);
                        ResultN("P_0= ", k2, x + 7, y3, 1);
                        ResultN("Q_0= ", k3, x + 13, y3++, 1);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
//      Prod4(n, 0);
//              ResultMatr1("C:", c, m, q, k3*n, y);
//                      Prod3Test();
//                      ResultMatr1("D:", d, m, q, k3*n, y);


        Delete1();
}

void Matr4CalcInit()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                        "заполненные соответствующими блоками матриц {A}, {B}, {C} (таким образом, исходные\n"
                        "данные совпадают с результатами, полученными в задании \\1).\n"
                        "Реализовать начальное перераспределение блоков, используемое в алгоритме\n"
                        "Кэннона блочного перемножения матриц.\n"
                        "\\PДля этого задать на множестве исходных процессов декартову топологию\n"
                        "двумерной квадратной циклической решетки порядка {K}_0 (где {K}_0\\*{K}_0 равно\n"
                        "количеству процессов), сохранив исходный порядок нумерации процессов,\n"
                        "и выполнить для каждой строки {I}_0 полученной решетки ({I}_0~=~0,~\\., {K}_0~\\-~1)\n"
                        "циклический сдвиг блоков {A}_{R} на {I}_0 позиций влево (т.\\,е. в направлении убывания\n"
                        "рангов процессов), а для каждого столбца {J}_0 решетки ({J}_0~=~0,~\\., {K}_0~\\-~1)\n"
                        "циклический сдвиг блоков {B}_{R} на {J}_0 позиций вверх (т.\\,е. также в направлении\n"
                        "убывания рангов процессов).\n"
                        "\\PДля определения коммуникатора MPI\\_COMM\\_GRID, связанного с декартовой\n"
                        "топологией, использовать функцию Matr3CreateCommGrid, реализованную в задании\n"
                        "\\2. При выполнении циклического сдвига использовать функции\n"
                        "MPI\\_Cart\\_coords, MPI\\_Cart\\_shift, MPI\\_Sendrecv\\_replace (ср. с \\2).\n"
                        "\\PОформить описанные действия в виде функции Matr3Init (без параметров).\n"
                        "Вывести в каждом процессе блоки {A}_{R} и {B}_{R}, полученные в результате сдвига\n"
                        "(ввод и вывод данных выполнять во внешней функции Solve).");
                n = (int)round(sqrt(n));

        /*    if (cnt > 2)
        {
        do
        {
        MakeDim3();
        } while (n == 4 && k1*k3 >= 9);
        }
        */
        MakeDim3();
        Init3();
        //      ShowDebugInfo(to_string(k1*k3).c_str());
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3, 1);
                        DataN("Q_0= ", k3, x + 13, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        DataMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y += y3;
        }
        y = 1;
        //      Prod3Test();
        //      Prod3Test();
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        //      Prod3(cnt, false);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + (i + j) % n * k2], k1, k2, k2*n, x + 1, y3);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + j) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        //      Prod3Test();
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        Delete1();
}


void Matr4Calc(int cnt)
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

        n = (int)round(sqrt(n));

        if (cnt == 1)

                        TaskText(
                                "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                                "заполненные соответствующими блоками матриц {A}, {B} и {C}, причем известно,\n"
                                "что блоки {C}_{R} являются нулевыми, а для блоков {A}_{R} и {B}_{R} уже выполнено\n"
                                "их начальное перераспределение в соответствии с алгоритмом Кэннона\n"
                                "(см. предыдущее задание). Реализовать один шаг алгоритма Кэннона перемножения\n"
                                "матриц, выполнив перемножение элементов, содержащихся в блоках {A}_{R} и {B}_{R} каждого\n"
                                "процесса, после чего организовать для каждой строки декартовой решетки\n"
                                "циклический сдвиг блоков {A}_{R} на 1 позицию влево (т.\\,е. в направлении убывания\n"
                                "рангов процессов), а для каждого столбца решетки циклический сдвиг блоков {B}_{R}\n"
                                "на 1 позицию вверх (т.\\,е. также в направлении убывания рангов процессов).\n"
                                "\\PДля циклической пересылки данных использовать коммуникатор MPI\\_COMM\\_GRID,\n"
                                "создав его с помощью функции Matr3CreateCommGrid (см. задание \\3),\n"
                                "и функции MPI\\_Cart\\_shift и MPI\\_Sendrecv\\_replace (ср. с \\3).\n"
                                "\\PОформить эти действия в виде функции Matr3Calc (без параметров). Вывести\n"
                                "новое содержимое блоков {C}_{R}, {A}_{R} и {B}_{R} в каждом процессе (ввод и вывод данных\n"
                                "выполнять во внешней функции Solve).\n"
                                "\\P\\SПримечание.\\s Особенность алгоритма Кэннона состоит в том, что действия\n"
                                "на каждом его шаге не зависят от номера шага.");
                else
        {
                        TaskText(
                                "В каждом процессе даны числа {M}_0, {P}_0, {Q}_0, а также одномерные массивы,\n"
                                "заполненные соответствующими блоками матриц {A}, {B} и {C}, причем известно,\n"
                                "что блоки {C}_{R} являются нулевыми, а для блоков {A}_{R} и {B}_{R} уже выполнено\n"
                                "их начальное перераспределение в соответствии с алгоритмом Кэннона\n"
                                "(см. задание \\2). Кроме того, в каждом процессе дано одно и то же\n"
                                "число {L}, лежащее в диапазоне от 2 до {K}_0 (где {K}_0\\*{K}_0 равно количеству процессов)\n"
                                "и определяющее требуемое число шагов алгоритма Кэннона.\n"
                                "\\PВызывая в цикле функцию Matr3Calc, разработанную в предыдущем задании,\n"
                                "выполнить {L} начальных шагов алгоритма Кэннона и вывести в каждом процессе\n"
                                "новое содержимое блоков {C}_{R}, {A}_{R} и {B}_{R} (ввод и вывод данных выполнять\n"
                                "во внешней функции Solve).\n"
                                "\\P\\SПримечание.\\s Если значение {L} равно {K}_0, то блоки {C}_{R} будут содержать\n"
                                "соответствующие фрагменты итогового матричного произведения {A}{B}.");
                        cnt = RandomN(2, n);
        }

        /*    if (cnt > 2)
        {
        do
        {
        MakeDim3();
        } while (n == 4 && k1*k3 >= 9);
        }
        */
        MakeDim3();
        Init3();
        //      ShowDebugInfo(to_string(k1*k3).c_str());
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("P_0= ", k2, x + 7, y3, 1);
                        DataN("Q_0= ", k3, x + 13, y3++, 1);
                        DataMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + (i + j) % n * k2], k1, k2, k2*n, x + 1, y3);
                        DataMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + j) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        if (cnt > 1)
                                DataN("L = ", cnt, x + 1, y3++, 1);
                        x += 20;
                }
                y += y3;
        }
        y = 1;
        //      Prod3Test();
        Prod4(cnt, 0);
        //      Prod3Test();
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        //      Prod3(cnt, false);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + (i + j + cnt) % n * k2], k1, k2, k2*n, x + 1, y3);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[(i + j + cnt) % n * k2*k3*n + j * k3], k2, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
//              Prod3Test();
//              ResultMatr1("C:", c, m, q, k3*n, y);
//              ResultMatr1("D:", d, m, q, k3*n, y);

        Delete1();
}

void Matr4GatherData()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M} и {Q}~\\= число строк и столбцов результирующего\n"
                                            "матричного произведения. Кроме того, в каждом процессе даны числа {M}_0, {Q}_0,\n"
                        "а также одномерные массивы, заполненные блоками матрицы {C} (размера {M}_0~\\x~{Q}_0),\n"
                        "которые были получены в результате выполнения {K}_0 шагов блочного алгоритма\n"
                        "Кэннона перемножения матриц (см. \\1). Переслать все блоки {C}_{R}\n"
                        "в главный процесс и вывести в нем полученную матрицу {C} (размера {M}~\\x~{Q}).\n"
                        "\\PДля хранения результирующей матрицы {C} в главном процессе использовать\n"
                        "одномерный массив, достаточный для хранения матрицы размера ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0).\n"
                        "Для пересылки блоков {C}_{R} использовать функции MPI\\_Send и MPI\\_Recv, а также\n"
                        "вспомогательный тип MPI\\_BLOCK\\_C, созданный с помощью функции\n"
                        "Matr3CreateTypeBlock (см. задание \\6 и примечание к нему).\n"
                        "\\PОформить эти действия в виде функции Matr3GatherData (без параметров).\n"
                        "Ввод данных выполнять во внешней функции Solve, вывод полученной матрицы\n"
                        "включить в функцию Matr3GatherData.\n"
                        "\\P\\SУказание.\\s При выводе матрицы {C} в главном процессе следует учитывать,\n"
                        "что предназначенный для ее хранения массив может содержать элементы,\n"
                        "соответствующие дополнительным нулевым столбцам.");
                n = (int)round(sqrt(n));

        MakeDim3();
        Init3();

        Prod4(n, 0);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        if (i == 0 && j == 0)
                        {
                                DataN("M = ", m, x + 1, y3, 1);
                                DataN("Q = ", q, x + 8, y3, 1);
                        }
                        y3++;
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("Q_0= ", k3, x + 8, y3++, 1);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y += y3;
        }
        y = 1;
        //      Prod3Test();
        //      ResultN(y, 1, 1, 3);
        //      ResultMatr1("C:", c, m, q, k3*n, y);
        //      ResultMatr1("D:", d, m, q, k3*n, y);

        //      Prod3(cnt, false);
        y = 1;
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k3*n, y);
        //              Prod3Test();
        //              ResultMatr1("D:", d, m, q, k3*n, y);
        Delete1();
}

void Matr4Complete()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q} и матрицы {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q}\n"
                        "соответственно (таким образом, исходные данные совпадают с исходными данными\n"
                        "для задания \\5).\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\5\\-\\1\n"
                        "функции Matr3ScatterData, Matr3Init, Matr3Calc (в цикле) и Matr3GatherData,\n"
                        "получить и вывести в главном процессе матрицу {C}, равную произведению\n"
                        "исходных матриц {A} и {B}.\n"
                        "\\PПосле каждого вызова функции Matr3Calc дополнительно выводить в каждом\n"
                        "процессе текущее содержимое блока {C}_{R}.\n"
                        "\\PДля того чтобы коммуникатор MPI\\_COMM\\_GRID, используемый в функциях Matr3Init\n"
                        "и Matr3Calc, не создавался несколько раз, модифицировать функцию\n"
                        "Matr3CreateCommGrid таким образом, чтобы при ее вызове для уже определенного\n"
                        "коммуникатора (не равного MPI\\_COMM\\_NULL) она не выполняла никаких действий.\n"
                        "\\PПеред использованием в данном задании следует модифицировать разработанную\n"
                        "в \\3 функцию Matr3Calc, добавив в нее параметр step, равный номеру\n"
                        "шага (step~=~0,~\\., {K}_0~\\-~1), и изменив ее таким образом, чтобы при значении\n"
                        "параметра step, равном {K}_0~\\-~1, не выполнялась пересылка блоков {A}_{R} и {B}_{R}.");

        n = (int)round(sqrt(n));

        do
        {
                MakeDim3();
        } while (n == 4 && k1*k3 >= 9);

        Init3();

        y = 1;
        DataProcComment(0, y);

        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        DataMatr1("A:", a, m, p, k2*n, y);
        DataMatr1("B:", b, p, q, k3*n, y);

        y = 1;
        Prod4(n, 1);
        ResultProcComment(0, y);
        ResultMatr1("C:", c, m, q, k3*n, y);

//                      Prod3Test();
//                      ResultMatr1(ind("D", 0, ":").c_str(), &d[0], m, q, q, y);

        Delete1();
}

void Matr4ScatterFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена двух файлов, содержащих\n"
                        "элементы матриц {A} и {B} размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно. Модифицировать\n"
                        "этап получения блоков для блочного алгоритма Кэннона перемножения матриц\n"
                        "(см. \\6) таким образом, чтобы каждый процесс считывал соответствующие\n"
                        "блоки матриц {A} и {B} непосредственно из исходных файлов. В данном случае\n"
                        "всем процессам требуется переслать не только размеры блоков {M}_0, {P}_0, {Q}_0,\n"
                        "но и размеры исходных матриц {M}, {P}, {Q}, которые требуются для правильного\n"
                        "определения позиций блоков в исходных файлах.\n"
                        "\\PДля пересылки размеров матриц и имен файлов использовать коллективную\n"
                        "функцию MPI\\_Bcast. Для считывания блоков использовать локальные функции\n"
                        "MPI\\_File\\_read\\_at, вызывая отдельную функцию для считывания каждой строки\n"
                        "блока (новый вид файловых данных создавать не требуется).\n"
                        "\\PОформить все действия в виде функции Matr3ScatterFile (без параметров),\n"
                        "в результате вызова которой каждый процесс получает значения {M}, {P}, {Q}, {M}_0,\n"
                        "{P}_0, {Q}_0, а также одномерные массивы, заполненные соответствующими блоками\n"
                        "матриц {A}, {B}, {C}. После вызова функции Matr3ScatterFile вывести в каждом\n"
                        "процессе полученные данные (числа {M}, {P}, {Q}, {M}_0, {P}_0, {Q}_0 и блоки матриц {A}, {B}, {C}).\n"
                        "Ввод исходных данных осуществлять в функции Matr3ScatterFile,\n"
                        "вывод результатов выполнять во внешней функции Solve.\n"
                        "\\P\\SУказание.\\s При чтении файловых данных следует учитывать, что для некоторых\n"
                        "блоков часть элементов (последние строки и/или столбцы) не должна считываться\n"
                        "из исходных файлов и будет оставаться нулевой. Для определения фактического\n"
                        "размера считываемого блока (числа строк и числа столбцов) потребуется\n"
                        "использовать размеры исходных матриц и координаты блока ({I}_0, {J}_0) в квадратной\n"
                        "декартовой решетке порядка {K}_0, которые легко определить\n"
                        "по рангу процесса {R}: {I}_0~=~{R}/{K}_0, {J}_0~=~{R}%{K}_0.\n"
                        "\\P\\SПримечание.\\s В то время как значения {P} и {Q} необходимы для обеспечения\n"
                        "правильного считывания файловых блоков, значение {M} можно не использовать,\n"
                        "поскольку попытка чтения данных за концом файла просто игнорируется,\n"
                        "не приводя к ошибке. Однако значение {M} потребуется на завершающем этапе\n"
                        "алгоритма (см. следующее задание), поэтому его тоже необходимо\n"
                        "переслать всем процессам.");

        n = (int)round(sqrt(n));

        MakeDim3();
        Init3();
        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < p; j++)
                        fa.write((char*)&a[i*k2*n + j], sizeof(a[0]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k3*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);
        y = 1;
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        ResultProcComment(i*n + j, x + 1, y3++);
                        ResultN("M =", m, x + 1, y3, 2);
                        ResultN("P =", p, x + 7, y3, 2);
                        ResultN("Q =", q, x + 13, y3++, 2);
                        ResultN("M_0= ", k1, x + 1, y3, 1);
                        ResultN("P_0= ", k2, x + 7, y3, 1);
                        ResultN("Q_0= ", k3, x + 13, y3++, 1);
                        ResultMatr2(ind("A", i * n + j, ":").c_str(), &a[i*k1*k2*n + j*k2], k1, k2, k2*n, x + 1, y3);
                        ResultMatr2(ind("B", i * n + j, ":").c_str(), &b[i*k2*k3*n + j*k3], k2, k3, k3*n, x + 1, y3);
                        ResultMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        x += 20;
                }
                y = y3;
        }
        Delete1();
}

void Matr4GatherFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В каждом процессе даны числа {M}, {Q}, {M}_0, {Q}_0, а также одномерные массивы,\n"
                        "заполненные блоками {C}_{R} (размера {M}_0~\\x~{Q}_0), полученными в результате\n"
                        "выполнения {K}_0 шагов блочного алгоритма Кэннона перемножения матриц\n"
                        "(см. \\5). Кроме того, в главном процессе дано имя файла\n"
                        "для хранения результирующего матричного произведения.\n"
                        "\\PПереслать имя файла во все процессы (используя функцию MPI\\_Bcast) и записать\n"
                        "все фрагменты матричного произведения, содержащиеся в блоках {C}_{R},\n"
                        "в результирующий файл, который в итоге будет содержать матрицу {C}\n"
                        "размера {M}~\\x~{Q}.\n"
                        "\\PДля записи данных в файл использовать локальные функции MPI\\_File\\_write\\_at,\n"
                        "вызывая отдельную функцию для записи каждой строки блока (новый вид файловых\n"
                        "данных создавать не требуется).\n"
                        "\\PОформить считывание имени файла, его пересылку, а также все действия по записи\n"
                        "данных в файл в виде функции Matr3GatherFile (считывание всех исходных данных,\n"
                        "кроме имени файла, должно осуществляться во внешней функции Solve).\n"
                        "\\P\\SУказание.\\s При записи файловых данных следует учитывать, что для некоторых\n"
                        "блоков {C}_{R} часть элементов (последние строки и/или столбцы, заполненные нулями)\n"
                        "не должна записываться в результирующий файл. См. также указание\n"
                        "и примечание к предыдущему заданию.");

        n = (int)round(sqrt(n));

        MakeDim3();
        Init3();

        Prod3(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";

        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        //                      n0 = i*n + j;
                        DataProcComment(i*n + j, x + 1, y3++);
                        DataN("M = ", m, x + 1, y3, 1);
                        DataN("Q = ", q, x + 8, y3++, 1);
                        DataN("M_0= ", k1, x + 1, y3, 1);
                        DataN("Q_0= ", k3, x + 8, y3++, 1);
                        DataMatr2(ind("C", i * n + j, ":").c_str(), &c[i*k1*k3*n + j*k3], k1, k3, k3*n, x + 1, y3);
                        if (i == 0 && j == 0)
                        {
                                DataComment("Имя файла", 1, y3++);
                                DataComment("  для матрицы C: ", 1, y3++);
                                DataS(sc.c_str(), 3, y3++);
                        }
                        else
                                y3 += 4;
                        x += 20;
                }
                y += y3;
        }


        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k3*n + j], sizeof(c[0]));
        fc.close();
        y = 1;
        ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);

        Delete1();
}

void Matr4CompleteFile()
{
        n = RandomN(2, 4);
        n = n*n;
        CreateTask(topic4, &n);
        if (n == 0)
                return;

                TaskText(
                        "В главном процессе даны числа {M}, {P}, {Q}, а также имена трех файлов: вначале\n"
                        "даются имена двух существующих файлов, содержащих элементы матриц {A} и {B}\n"
                        "размера {M}~\\x~{P} и {P}~\\x~{Q} соответственно, а затем имя файла для хранения\n"
                        "результирующего матричного произведения {C}~=~{A}{B}.\n"
                        "\\PПоследовательно вызывая разработанные в заданиях \\2, \\7,\n"
                        "\\6 и \\1 функции Matr3ScatterFile, Matr3Init, Matr3Calc\n"
                        "(в цикле) и Matr3GatherFile, получить в результирующем файле произведение\n"
                        "исходных матриц {A} и {B}, найденное с помощью блочного алгоритма Кэннона.\n"
                        "\\PПосле каждого вызова функции Matr3Calc дополнительно выводить в каждом\n"
                        "процессе текущее значение элемента c[step], где c~\\= одномерный массив,\n"
                        "содержащий блок {C}_{R}, а step~\\= номер шага алгоритма (0, 1,~\\., {K}_0~\\-~1);\n"
                        "таким образом, на первом шаге алгоритма следует вывести элемент c[0],\n"
                        "на втором шаге~\\= элемент c[1], и~т.\\,д.");

        n = (int)round(sqrt(n));

        MakeDim3();
        Init3();

        t = new int[n*n*n];
        InitConst(t, n*n, n, n, 0);

        y = 1;
        DataProcComment(0, y);
        DataN("M = ", m, 12, y, 1);
        DataN("P = ", p, 20, y, 1);
        DataN("Q = ", q, 28, y++, 1);
        //      DataMatr1("A:", a, m, p, p, y);
        //      DataMatr1("B:", b, p, q, q, y);
        std::string sa = "A" + FileName(5) + ".tst", sb = "B" + FileName(5) + ".tst",
                sc = "C" + FileName(5) + ".tst";
        std::fstream fa(sa.c_str(), std::ios_base::binary | std::ios_base::out),
                fb(sb.c_str(), std::ios::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < p; j++)
                        fa.write((char*)&a[i*k2*n + j], sizeof(a[0]));
        for (int i = 0; i < p; i++)
                for (int j = 0; j < q; j++)
                        fb.write((char*)&b[i*k3*n + j], sizeof(b[0]));
        fa.close();
        fb.close();
        DataS("Файл с матрицей A: ", sa.c_str(), 1, y++);
//      DataComment("Содержимое файла (матрица A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("Файл с матрицей B: ", sb.c_str(), 1, y);
//      DataComment("Содержимое файла (матрица B): ", 1, y++);
        DataS("Имя файла для матрицы C: ", sc.c_str(), xRight, y++);
        SetFileRow(q);
        DataFileN(sb.c_str(), y, 4);

        y = 1;
        Prod4(n, 2);
        //      ResultProcComment(0, y);
        //      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m; i++)
                for (int j = 0; j < q; j++)
                        fc.write((char*)&c[i*k3*n + j], sizeof(c[0]));
        fc.close();
        for (int i = 0; i < n; i++)
        {
                x = 0;
                for (int j = 0; j < n; j++)
                {
                        y3 = y;
                        if (n == 4)
                        {
                                int x0 = (j*n + i > 9) ? 0 : 1;
                                ResultProcComment0(j*n + i, x + x0, y3);
                                ResultMatr0(&t[(j*n + i)*n], 1, n, n, x + 3, y3);
                                x += 20;
                        }
                        else
                        {
                                ResultProcComment(j*n + i, x + 1, y3);
                                ResultMatr0(&t[(j*n + i)*n], 1, n, n, x + 11, y3);
                                x += 27;
                        }
                }
                y = y3;
        }


        if (n < 4)
                ResultComment("Файл с матрицей C: ", 1, y++);
        SetFileRow(q);
        ResultFileN(sc.c_str(), y++, 4);
        Delete1();
 }



void InitTask(int num)
{
  switch (num)  
  {
        case 1:      Matr0(); break;
        case 2:      Matr1ScatterData(); break;
    case 3:      Matr1Calc(1); break;
    case 4:      Matr1Calc(2); break;
        case 5:      Matr1Calc(3); break;
        case 6:      Matr1GatherData(); break;
        case 7:      Matr1Complete(); break;
    case 8:      Matr1ScatterFile(); break;
    case 9:      Matr1GatherFile(); break;
    case 10:      Matr1CompleteFile(); break;
        case 11:      Matr2CreateColumnType(); break;
        case 12:          Matr2ScatterData(); break;
        case 13:      Matr2Calc(1); break;
        case 14:      Matr2Calc(2); break;
        case 15:      Matr2Calc(3); break;
        case 16:      Matr2GatherData(); break;
        case 17:      Matr2Complete(); break;
        case 18:      Matr2ScatterFile(); break;
        case 19:      Matr2GatherFile(); break;
        case 20:      Matr2CompleteFile(); break;
        case 21:      Matr4CreateBlockType(); break;
        case 22:      Matr4CreateCartComm(); break;
        case 23:      Matr4ScatterData(); break;
        case 24:      Matr4CalcInit(); break;
        case 25:      Matr4Calc(1); break;
        case 26:      Matr4Calc(3); break;
        case 27:      Matr4GatherData(); break;
        case 28:      Matr4Complete(); break;
        case 29:      Matr4ScatterFile(); break;
        case 30:      Matr4GatherFile(); break;
        case 31:      Matr4CompleteFile(); break;
        case 32:      Matr3CreateBlockType(); break;
        case 33:      Matr3CreateRowComm(); break;
        case 34:      Matr3CreateColComm(); break;
        case 35:      Matr3ScatterData(); break;
        case 36:      Matr3Calc1(1); break;
        case 37:      Matr3Calc2(); break;
        case 38:      Matr3Calc1(2); break;
        case 39:      Matr3Calc1(3); break;
        case 40:      Matr3GatherData(); break;
        case 41:      Matr3Complete(); break;
        case 42:      Matr3ScatterFile(); break;
        case 43:      Matr3GatherFile(); break;
        case 44:      Matr3CompleteFile(); break;
  }
}

void inittaskgroup()
{
  if ((CurrentLanguage() & lgCPP) == 0) return;

  CreateGroup("MPI9Matr", "Параллельные матричные алгоритмы",
    "М. Э. Абрамян, 2017", "qwq2334sqwjdfkvl4567ttd", 44, InitTask);

  }

int InitGroup(string &name, string &code, int lang)
{
  string name0;
  ClearGroupData();
  SetLanguage(lang);
  name0 = TopicToUpperCase(name);
  if (name0 == "MPI9MATR")
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
    if (name == "MPI9MATR")
     InitTask(num);
    Pause();
    return GetTestCount();
}


int initgroup(char *name, char *code, int lang)
{
  string sname(name), scode;
  int res = InitGroup(sname, scode, lang);
  if (res > 0)
  {
     //strcpy(name, sname.c_str());
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

