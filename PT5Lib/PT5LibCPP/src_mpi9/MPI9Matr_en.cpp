#include <string>
#include <sstream>
#include <iomanip>
#include <fstream>
#include <iostream>
#include "pt5taskmaker.h"

using namespace std;

const char topic0[] = "Non-parallel matrix multiplication algorithm";
const char topic1[] = "Band algorithm 1 (horizontal bands)";
const char topic2[] = "Band algorithm 2 (horizontal and vertical bands)";
const char topic3[] = "Fox's block algorithm";
const char topic4[] = "Cannon's block algorithm";
const char alph[] = "0123456789abcdefghijklmnopqrstuvwxyz";

std::string prc(int n)
{
        std::ostringstream os;
        os << "Process " << n << ": ";
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process. Find and output\n"
                        "a {M}~\\x~{Q} matrix {C} that is the product of the matrices {A} and {B}.\n"
                        "\\PThe formula for calculating the elements of the matrix {C} under the assumption\n"
                        "that the rows and columns of all matrices are numbered from 0 is as follows:\n"
                        "{C}_{I,J}~=~{A}_{I,0}\\*{B}_{0,J}~+~{A}_{I,1}\\*{B}_{1,J}~+~\\.~+~{A}_{I,P-1}\\*{B}_{P-1,J},\n"
                        "where {I}~=~0,~\\., {M}~\\-~1, {J}~=~0,~\\., {Q}~\\-~1.\n"
                        "\\PTo store the matrices {A}, {B}, {C}, use one-dimensional arrays of size {M}\\*{P},\n"
                        "{P}\\*{Q}, and {M}\\*{Q} placing elements of matrices in a row-major order (that is,\n"
                        "the matrix element with indices {I} and {J} will be stored in the element\n"
                        "of the corresponding array with the index {I}\\*{N}~+~{J}, where {N} is the number\n"
                        "of columns of the matrix). The slave processes are not used in this task.");/*
                                                                                                                                                                                 TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "��������������. ����� � ������� � ������� �������� ������� {C} ������� {M}~\\x~{Q},\n"
                        "���������� ������������� ������ {A} � {B}.\n"
                        "\\P������� ��� ���������� ��������� ������� {C} � �������������, ��� ������\n"
                        "� ������� ���� ������ ���������� �� 0, ����� ���:\n"
                        "{C}_{I,J}~=~{A}_{I,0}\\*{B}_{0,J}~+~{A}_{I,1}\\*{B}_{1,J}~+~\\.~+~{A}_{I,P-1}\\*{B}{P-1,J},\n"
                        "��� {I}~=~0,~\\., {M}~\\-~1, {J}~=~0,~\\., {Q}~\\-~1.\n"
                        "\\P��� �������� ������ {A}, {B}, {C} ������������ ���������� ������� ������� {M}\\*{P},\n"
                        "{P}\\*{Q} � {M}\\*{Q}, �������� � ��� �������� ������ �� ������� (��� ���� ������� �������\n"
                        "� ��������� {I} � {J} ����� ��������� � �������� ���������������� �������\n"
                        "� �������� {I}\\*{N}~+~{J}, ��� {N}~\\=~���������� �������� �������).\n"
                        "��� ���������� ������� ������� ����������� �������� �� ������������.");
                        */
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process. In the first variant\n"
                        "of the band algorithm of matrix multiplication, each matrix multiplier\n"
                        "is divided into {K} horizontal bands, where {K} is the number of processes\n"
                        "(hereinafter bands are distributed by processes and used to calculate\n"
                        "a part of the total matrix product in each process).\n"
                        "\\PThe band of the matrix {A} contains {N}_{A} rows, the band of the matrix {B}\n"
                        "contains {N}_{B} rows. The numbers {N}_{A} and {N}_{B} are calculated as follows:\n"
                        "{N}_{A}~=~ceil({M}/{K}), {N}_{B}~=~ceil({P}/{K}), where the operation \\</\\> means the division\n"
                        "of real numbers and the function ceil performs rounding up. If the matrix\n"
                        "contains insufficient number of rows to fill the last band then\n"
                        "the zero-valued rows should be added to this band.\n"
                        "\\PAdd, if necessary, the zero-valued rows to the initial matrices, save them\n"
                        "in one-dimensional arrays in the master process, and then send\n"
                        "the matrix bands from these arrays to all processes as follows: a band\n"
                        "with the index {R} is sent to the process of rank {R} ({R}~=~0, 1,~\\., {K}~\\-~1),\n"
                        "all the bands {A}_{R} are of the size {N}_{A}~\\x~{P}, all the bands {B}_{R} are\n"
                        "of the size {N}_{B}~\\x~{Q}. In addition, create a band {C}_{R} in each process to store\n"
                        "the part of the matrix product {C}~=~{A}{B} which will be calculated\n"
                        "in this process. Each band {C}_{R} is of the size {N}_{A}~\\x~{Q} and is filled\n"
                        "with zero-valued elements.\n"
                        "\\PThe bands, like the initial matrices, should be stored in one-dimensional\n"
                        "arrays in a row-major order. To send the matrix sizes, use the MPI\\_Bcast\n"
                        "collective function, to send the bands of the matrices {A} and {B},\n"
                        "use the MPI\\_Scatter collective function.\n"
                        "\\PInclude all the above mentioned actions in a Matr1ScatterData function\n"
                        "(without parameters). As a result of the call of this function, each process\n"
                        "will receive the values {N}_{A}, {P}, {N}_{B}, {Q}, as well as one-dimensional arrays\n"
                        "filled with the corresponding bands of the matrices {A}, {B}, {C}. Output\n"
                        "all obtained data (that is, the numbers {N}_{A}, {P}, {N}_{B}, {Q} and the bands\n"
                        "of the matrices {A}, {B}, {C}) in each process after calling the Matr1ScatterData\n"
                        "function. Perform the input of initial data in the Matr1ScatterData function,\n"
                        "perform the output of the results in the Solve function.\n"
                        "\\P\\SNote.\\s To reduce the number of the MPI\\_Bcast function calls,\n"
                        "all matrix sizes may be sent as a single array.");/*

                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "��������������. � ������ �������� ���������� ��������� ������������ ������\n"
                        "������ �������-����������� ����������� �� {K} �������������� �����, ��� {K}~\\=\n"
                        "���������� ��������� (� ���������� ������ �������������� �� ���������\n"
                        "� ������������ ��� ���������� � ������ �������� ����� ���������\n"
                        "���������� ������������).\n"
                        "\\P������ ��� ������� {A} �������� {N}_{A} �����, ������ ��� ������� {B} ��������\n"
                        "{N}_{B} �����; ����� {N}_{A} � {N}_{B} ����������� �� �������� {N}_{A}~=~ceil({M}/{K}),\n"
                        "{N}_{B}~=~ceil({P}/{K}), ��� �������� \\</\\> �������� ������������ �������, � ������� ceil\n"
                        "��������� ���������� � ��������. ���� ������� �������� ������������ �����\n"
                        "��� ���������� ��������� ������, �� ������ ����������� �������� ��������.\n"
                        "\\P��������� �������� �������, ����������� ��� ������������� �������� ��������,\n"
                        "� ���������� �������� � ������� ��������, ����� ���� ������������ ���������\n"
                        "����� �� ���� �������� �� ��� ��������: � ������� ����� {R} ({R}~=~0, 1,~\\.,\n"
                        "{K}~\\-~1) ������������ ������ � �������� {R}, ��� ������ {A}_{R} ����� ������ {N}_{A}~\\x~{P},\n"
                        "��� ������ {B}_{R} ����� ������ {N}_{B}~\\x~{Q}. ����� ����, ������� � ������ ��������\n"
                        "������ {C}_{R} ��� �������� ��������� ���������� ������������ {C}~=~{A}{B}, ������� �����\n"
                        "����������� � ���� ��������; ������ ������ {C}_{R} ����� ������ {N}_{A}~\\x~{Q}\n"
                        "� ����������� �������� ����������.\n"
                        "\\P������, ��� � �������� �������, ������ ��������� �� ������� � ����������\n"
                        "�������� ���������������� �������. ��� ��������� �������� ������ ������������\n"
                        "������������ ������� MPI\\_Bcast, ��� ��������� ����� ������ {A} � {B} ������������\n"
                        "������������ ������� MPI\\_Scatter.\n"
                        "\\P�������� ��� ��������� �������� � ���� ������� Matr1ScatterData\n"
                        "(��� ����������), � ���������� ������ ������� ������ ������� ��������\n"
                        "�������� {N}_{A}, {P}, {N}_{B}, {Q}, � ����� ���������� �������, �����������\n"
                        "���������������� �������� ������ {A}, {B}, {C}. ����� ������ �������\n"
                        "Matr1ScatterData ������� � ������ �������� ���������� ������ (����� {N}_{A}, {P},\n"
                        "{N}_{B}, {Q} � ������ ������ {A}, {B}, {C}). ���� �������� ������ ������������ � �������\n"
                        "Matr1ScatterData, ����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S��������.\\s ��� ���������� ����� ������� ������� MPI\\_Bcast ��� ������������\n"
                        "������� ������ ����� ��������� �� ��������������� ������.");
                        */

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
                                "Integers {N}_{A}, {P}, {N}_{B}, {Q} and one-dimensional arrays filled\n"
                                "with the corresponding bands of matrices {A}, {B}, {C} are given in each process\n"
                                "(thus, the given data coincide with the results obtained in the \\1\n"
                                "task). Implement the first step of the band algorithm of matrix multiplication\n"
                                "as follows: multiply elements in the bands {A}_{R} and {B}_{R} of each process\n"
                                "and perform the cyclic sending each band {B}_{R} to the process of the previous\n"
                                "rank (that is, from the process 1 to the process 0, from the process 2\n"
                                "to the process 1,~\\., from the process 0 to the process {K}~\\-~1,\n"
                                "where {K} is the number of processes).\n"
                                "\\PUse the MPI\\_Sendrecv\\_replace function to send the bands. To determine\n"
                                "the ranks of the sending and receiving processes, use the expression\n"
                                "containing the % operator that gives the remainder of a division.\n"
                                "\\PInclude all the above mentioned actions in a Matr1Calc function (without\n"
                                "parameters). Output the new contents of the bands {C}_{R} and {B}_{R} in each process;\n"
                                "perform data input and output in the Solve function.\n"
                                "\\P\\SNote.\\s As a result of multiplying the bands {A}_{R} and {B}_{R}, each element\n"
                                "of the band {C}_{R} will contain a \\Ipart\\i of the terms included in the elements\n"
                                "of the product {A}{B}; all elements of the band {B}_{R} and some of the elements\n"
                                "of the band {A}_{R} will be used (in particular, the first {N}_{B} elements\n"
                                "of the band {A}_0 will be used in the process 0 in the first step\n"
                                "and the last {N}_{B} elements of the band {A}_{K-1} will be used\n"
                                "in the process {K}~\\-~1 in the first step).");/*

                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, {Q}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\1).\n"
                                "����������� ������ ��� ���������� ��������� ������������ ������, ��������\n"
                                "������������ ���������, ������������ � ������� {A}_{R} � {B}_{R} ������� ��������,\n"
                                "����� ���� ������������ ����������� ��������� ������ ������ {B}_{R} � �������\n"
                                "����������� ����� (�� �������� 1 � ������� 0, �� �������� 2 � ������� 1,~\\.,\n"
                                "�� �������� 0 � ������� {K}~\\-~1, ��� {K}~\\= ���������� ���������).\n"
                                "\\P����������� ��������� ����� {B}_{R} ��������� � ������� �������\n"
                                "MPI\\_Sendrecv\\_replace, ��������� ��� ����������� ������ ��������-�����������\n"
                                "� ��������-���������� �������� % ������ ������� �� �������.\n"
                                "\\P�������� ��� �������� � ���� ������� Matr1Calc (��� ����������).\n"
                                "������� ����� ���������� ����� {C}_{R} � {B}_{R} � ������ ��������\n"
                                "(���� � ����� ������ ��������� �� ������� ������� Solve).\n"
                                "\\P\\S��������.\\s � ���������� ������������ ����� {A}_{R} � {B}_{R} ������ ������� ������ {C}_{R}\n"
                                "����� ��������� \\I�����\\i ���������, �������� � �������� ������������ {A}{B}; ��� ����\n"
                                "����� ������������ ��� �������� ������ {B}_{R} � ����� ��������� ������ {A}_{R}\n"
                                "(� ���������, �� ������ ���� � �������� 0 ����� ������������ {N}_{B} ������\n"
                                "�������� ������ {A}_0, � � �������� {K}~\\-~1~\\= {N}_{B} ��������� �������� ������ {A}_{K-1}).");
                                */
                else if (cnt == 2)
                        TaskText(
                                "Integers {N}_{A}, {P}, {N}_{B}, {Q} and one-dimensional arrays filled with the corresponding\n"
                                "bands of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                                "coincide with the results obtained in the \\2 task). Modify\n"
                                "the Matr1Calc function, which was implemented in the previous task;\n"
                                "the modified function should provide execution of any step\n"
                                "of the band algorithm of matrix multiplication.\n"
                                "\\PTo do this, add the parameter named step to the function (this parameter\n"
                                "specifies the step number and may be in the range 0 to {K}~\\-~1, where {K} is\n"
                                "the number of processes) and use the value of this parameter in the part\n"
                                "of the algorithm that deals with the recalculation of the elements\n"
                                "of the band {C}_{R} (the cyclic sending of the bands {B}_{R} does not depend\n"
                                "on the value of the parameter step).\n"
                                "\\PUsing two calls of the modified Matr1Calc function with the parameters 0\n"
                                "and 1, execute two initial steps of the band algorithm and output\n"
                                "the new contents of the bands {C}_{R} and {B}_{R} in each process. Perform data input\n"
                                "and output in the Solve function.\n"
                                "\\P\\SNote.\\s The parameter step determines which part of the band {A}_{R} will be used\n"
                                "for the next recalculation of the elements of the band {C}_{R}\n"
                                "(note that these parts should be selected cyclically).");/*


                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, {Q}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\2).\n"
                                "�������������� ������� Matr1Calc, ������������� � ���������� �������,\n"
                                "����� �������, ����� ��� ������������ ���������� ������ ����\n"
                                "��������� ���������� ���������.\n"
                                "\\P��� ����� �������� � ��� �������� step, ������������ ����� ���� (����������\n"
                                "�� 0 �� {K}~\\-~1, ��� {K}~\\= ���������� ���������), � ������������ �������� �����\n"
                                "��������� � ��� ����� ���������, ������� ������� � ���������� ���������\n"
                                "������ {C}_{R} (��������, ��������� � ����������� ���������� ����� {B}_{R},\n"
                                "�� �������� ��������� step �� �������).\n"
                                "\\P��������� ��� ������ ���������������� ������� Matr1Calc � ����������� 0 � 1,\n"
                                "��������� ��� ��������� ���� ���������� ��������� � ������� � ������ ��������\n"
                                "����� ���������� ����� {C}_{R} � {B}_{R} (���� � ����� ������\n"
                                "��������� �� ������� ������� Solve).\n"
                                "\\P\\S��������.\\s ����� ���� step ����������, ����� ����� ��������� ������ {A}_{R} �����\n"
                                "������������ ��� ��������� ��������� ��������� ������ {C}_{R} (������� ��������\n"
                                "�������� �� ��, ��� ��� ����� ������������ ����������).");
                                */
                else
        {
                        TaskText(
                                "Integers {N}_{A}, {P}, {N}_{B}, {Q} and one-dimensional arrays filled with the corresponding\n"
                                "bands of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                                "coincide with the results obtained in the \\3 task). In addition,\n"
                                "a number {L} with the same value is given in each process. The value of {L}\n"
                                "is in the range 3 to {K}, where {K} is the number of processes, and determines\n"
                                "the number of steps of the band algorithm.\n"
                                "\\PUsing the function Matr1Calc({I}) (see the previous task) in a loop\n"
                                "with the parameter {I} ({I}~=~0,~\\., {L}~\\-~1), execute the initial {L} steps\n"
                                "of the band algorithm and output the new contents of the bands {C}_{R} and {B}_{R}\n"
                                "in each process. Perform data input and output in the Solve function.\n"
                                "\\P\\SRemark.\\s If the value of {L} is equal to {K} then the bands {C}_{R} will contain\n"
                                "the corresponding parts of the final matrix product {A}{B}.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, {Q}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\3).\n"
                                "����� ����, � ������ �������� ���� ���� � �� �� ����� {L}, ������� � ���������\n"
                                "�� 3 �� {K} ({K}~\\= ���������� ���������) � ������������\n"
                                "��������� ����� ����� ���������� ���������.\n"
                                "\\P������� � ����� �� ��������� {I} ({I}~=~0,~\\., {L}~\\-~1) ������� Matr1Calc({I}),\n"
                                "������������� � ���������� �������, ��������� {L} ��������� ����� ����������\n"
                                "��������� � ������� � ������ �������� ����� ���������� ����� {C}_{R} � {B}_{R}\n"
                                "(���� � ����� ������ ��������� �� ������� ������� Solve).\n"
                                "\\P\\S����������.\\s ���� �������� {L} ����� {K}, �� ������ {C}_{R} ����� ���������\n"
                                "��������������� ��������� ��������� ���������� ������������ {A}{B}.");
                                */
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
                        "An integer {M} (the number of rows of the matrix product) is given in the master\n"
                        "process. In addition, integers {N}_{A}, {Q} and one-dimensional arrays filled\n"
                        "with the {N}_{A}~\\x~{Q} bands of matrix {C} are given in each process (the given bands\n"
                        "of {C} are obtained as a result of {K} steps of the band algorithm~\\=\n"
                        "see the \\1 task). Send all the bands {C}_{R} to the master process\n"
                        "and output the received matrix {C} of the size {M}~\\x~{Q} in this process.\n"
                        "\\PTo store the resulting matrix {C} in the master process, use a one-dimensional\n"
                        "array sufficient to store the matrix of the size ({N}_{A}\\*{K})~\\x~{Q}. To send data\n"
                        "to this array, use the MPI\\_Gather collective function.\n"
                        "\\PInclude all the above mentioned actions in a Matr1GatherData function\n"
                        "(without parameters). Perform the input of initial data in the Solve function,\n"
                        "perform the output of the resulting matrix in the Matr1GatherData function.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}~\\= ���������� ����� ��������������� ����������\n"
                        "������������. ����� ����, � ������ �������� ���� ����� {N}_{A}, {Q}, � �����\n"
                        "���������� �������, ����������� �������� ������� {C} (������� {N}_{A}~\\x~{Q}), �������\n"
                        "���� �������� � ���������� ���������� {K} ����� ���������� ���������\n"
                        "������������ ������ (��. \\1). ��������� ��� ������ {C}_{R} � �������\n"
                        "������� � ������� � ��� ���������� ������� {C} (������� {M}~\\x~{Q}).\n"
                        "\\P��� �������� �������������� ������� {C} � ������� �������� ������������\n"
                        "���������� ������, ����������� ��� �������� ������� ������� ({N}_{A}\\*{K})~\\x~{Q};\n"
                        "��� ��������� ������ � ���� ������ ������������ ������������\n"
                        "������� MPI\\_Gather.\n"
                        "\\P�������� ��� �������� � ���� ������� Matr1GatherData (��� ����������).\n"
                        "���� ������ ��������� �� ������� ������� Solve, ����� ���������� �������\n"
                        "�������� � ������� Matr1GatherData.");
                        */

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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process (thus, the given data\n"
                        "coincide with the given data in the \\5 task).\n"
                        "\\PUsing successively the Matr1ScatterData, Matr1Calc (in a loop),\n"
                        "and Matr1GatherData functions, that are developed in the \\5\\-\\1\n"
                        "tasks, find a matrix {C}, which is equal to the product of the initial\n"
                        "matrices {A} and {B}, and output this matrix in the master process.\n"
                        "\\PIn addition, output the current contents of the band {C}_{R} in each process\n"
                        "after each call of the Matr1Calc function. Modify the Matr1Calc function\n"
                        "(see the \\3 task), before using in this task, as follows:\n"
                        "the bands {B}_{R} should not be sent when the parameter step is equal to {K}~\\-~1.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "�������������� (����� �������, �������� ������ ��������� � ��������� �������\n"
                        "��� ������� \\5).\n"
                        "\\P��������������� ������� ������������� � �������� \\5\\-\\1\n"
                        "������� Matr1ScatterData, Matr1Calc (� �����) � Matr1GatherData, ��������\n"
                        "� ������� � ������� �������� ������� {C}, ������ ������������\n"
                        "�������� ������ {A} � {B}.\n"
                        "\\P����� ������� ������ ������� Matr1Calc ������������� �������� � ������\n"
                        "�������� ������� ���������� ������ {C}_{R}. ����� �������������� � ������ �������\n"
                        "������� �������������� ������������� � \\3 ������� Matr1Calc �����\n"
                        "�������, ����� ��� �������� ��������� step, ������ {K}~\\-~1,\n"
                        "�� ����������� ��������� ����� {B}_{R}.");
                        */

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
                        "Integers {M}, {P}, {Q} and two file names are given in the master process.\n"
                        "The given files contain elements of a matrix {A} of the size {M}~\\x~{P}\n"
                        "and a matrix {B} of the size {P}~\\x~{Q}. Modify the initial stage of the band\n"
                        "algorithm of matrix multiplication (see the \\6 task) as follows:\n"
                        "each process should read the corresponding bands of the matrices {A} and {B}\n"
                        "directly from the given files using the MPI\\_File\\_seek and MPI\\_File\\_read\\_all\n"
                        "collective functions (a new file view is not required).\n"
                        "\\PTo send the sizes of matrices and file names, use the MPI\\_Bcast\n"
                        "collective function.\n"
                        "\\PInclude all these actions in a Matr1ScatterFile function (without parameters).\n"
                        "As a result of the call of this function, each process will receive\n"
                        "the values {N}_{A}, {P}, {N}_{B}, {Q}, as well as one-dimensional arrays filled\n"
                        "with the corresponding bands of the matrices {A}, {B}, {C}. Output all obtained data\n"
                        "(that is, the numbers {N}_{A}, {P}, {N}_{B}, {Q} and the bands of the matrices {A}, {B}, {C})\n"
                        "in each process after calling the Matr1ScatterFile function. Perform the input\n"
                        "of initial data in the Matr1ScatterFile function, perform the output\n"
                        "of the results in the Solve function.\n"
                        "\\P\\SRemark.\\s For some bands, some of their elements (namely, the last rows)\n"
                        "or even the entire bands should not be read from the source files\n"
                        "and will remain zero-valued ones. However, this situation does not require\n"
                        "special processing, since the MPI\\_File\\_read\\_all function automatically stops\n"
                        "reading the data (without generating any error message)\n"
                        "when the end of the file is reached.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������, ����������\n"
                        "�������� ������ {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������. ��������������\n"
                        "��������� ���� ���������� ��������� ������������ ������ (��. \\6)\n"
                        "����� �������, ����� ������ ������� �������� ��������������� ������\n"
                        "������ {A} � {B} ��������������� �� �������� ������, ��������� ������������\n"
                        "������� MPI\\_File\\_seek � MPI\\_File\\_read\\_all (����� ��� �������� ������\n"
                        "��������� �� ���������).\n"
                        "\\P��� ��������� �������� ������ � ���� ������ ������������ ������������\n"
                        "������� MPI\\_Bcast.\n"
                        "\\P�������� ��� �������� � ���� ������� Matr1ScatterFile (��� ����������),\n"
                        "� ���������� ������ ������� ������ ������� �������� �������� {N}_{A}, {P}, {N}_{B}, {Q},\n"
                        "� ����� ���������� �������, ����������� ���������������� ��������\n"
                        "������ {A}, {B}, {C}. ����� ������ ������� Matr1ScatterFile ������� � ������\n"
                        "�������� ���������� ������ (����� {N}_{A}, {P}, {N}_{B}, {Q} � ������ ������ {A}, {B}, {C}).\n"
                        "���� �������� ������ ������������ � ������� Matr1ScatterFile,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S����������.\\s ��� ��������� ����� ����� ��������� (��������� ������) ��� ����\n"
                        "��� ������ �� ������ ����������� �� �������� ������ � ����� ����������\n"
                        "�������. ������ ��� �������� �� ������� ����������� ���������, ��� ���\n"
                        "��� ���������� ����� ����� ������� MPI\\_File\\_read\\_all ������������� ����������\n"
                        "���������� ������, �� ��������� �������� ��������� �� ������.");
                        */

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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y++);
//      DataComment("���������� ����� (������� B): ", 1, y++);
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
                        "Integers {N}_{A}, {Q} and one-dimensional arrays filled with the {N}_{A}~\\x~{Q} bands {C}_{R}\n"
                        "are given in each process (the given bands {C}_{R} are obtained as a result\n"
                        "of {K} steps of the band algorithm of matrix multiplication~\\=\n"
                        "see the \\4 task). In addition, an integer {M} (the number of rows\n"
                        "of the matrix product) and the name of file (to store this product) are given\n"
                        "in the master process.\n"
                        "\\PSend the number {M} and the file name to all processes using the MPI\\_Bcast\n"
                        "function. Write all the parts of the matrix product contained in the bands {C}_{R}\n"
                        "to the resulting file, which will eventually contain a matrix {C}\n"
                        "of the size {M}~\\x~{Q}. To write the bands to the file, use the MPI\\_File\\_seek\n"
                        "and MPI\\_File\\_write\\_all collective functions.\n"
                        "\\PInclude all these actions (namely, the input of file name, sending number {M}\n"
                        "and the file name, and writing all bands to the file) in a Matr1GatherFile\n"
                        "function. Perform the input of all initial data, except the file name,\n"
                        "in the Solve function.\n"
                        "\\P\\SNote.\\s When writing data to the resulting file, it is necessary to take\n"
                        "into account that some of the bands {C}_{R} may contain trailing zero-valued rows\n"
                        "that are not related to the resulting matrix product (the number {M} should\n"
                        "be sent to all processes in order to control this situation).");/*


                TaskText(
                        "� ������ �������� ���� ����� {N}_{A}, {Q}, � ����� ���������� �������, �����������\n"
                        "�������� {C}_{R} (������� {N}_{A}~\\x~{Q}), ����������� � ���������� ���������� {K} �����\n"
                        "���������� ��������� ������������ ������ (��. \\4). ����� ����,\n"
                        "� ������� �������� ���� ����� {M}~\\= ���������� ����� ��������������� ����������\n"
                        "������������ � ��� ����� ��� �������� ����� ������������.\n"
                        "\\P��������� ����� {M} � ��� ����� �� ��� �������� (��������� ������� MPI\\_Bcast)\n"
                        "� �������� ��� ��������� ���������� ������������, ������������ � ������� {C}_{R},\n"
                        "� �������������� ����, ������� � ����� ����� ���������\n"
                        "������� {C} ������� {M}~\\x~{Q}.\n"
                        "\\P��� ������ ����� � ���� ������������ ������������ ������� MPI\\_File\\_seek\n"
                        "� MPI\\_File\\_write\\_all.\n"
                        "\\P�������� ���������� ����� �����, ��������� �������� {M} � ����� �����,\n"
                        "� ����� ��� �������� �� ������ ����� � ���� � ���� ������� Matr1GatherFile\n"
                        "(���������� ���� �������� ������, ����� ����� �����,\n"
                        "������ �������������� �� ������� ������� Solve).\n"
                        "\\P\\S��������.\\s ��� ������ ������ � �������������� ���� ���������� ���������,\n"
                        "��� ��������� ������ {C}_{R} ����� ��������� ����������� ������� ������,\n"
                        "�� ��������� � ���������� ������������� (������ ��� �������� ���� ��������\n"
                        "��������� ���������� �� ��� �������� �������� {M}).");
                        */

        MakeDim1();
        Init1();

        Prod1(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";
//      DataS("��� ����� ��� ������� C: ", sc.c_str(), 1, y++);
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("Q = ", q, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k1*q], k1, q, q, y);
                if (i == 0)
                {
                        DataN("M = ", m, 12, y++, 1);
                        DataS("Name of file for matrix C: ", sc.c_str(), 12, y++);
                }
        }
//      ResultProcComment(0, y);
//      ResultMatr1("C:", c, m, q, q, y);
        std::fstream fc(sc.c_str(), std::ios_base::binary | std::ios_base::out);
        for (int i = 0; i < m*q; i++)
                fc.write((char*)&c[i], sizeof(c[i]));
        fc.close();
        y = 1;
        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M}, {P}, {Q} and three file names are given in the master process.\n"
                        "The first two file names are related to the existing files containing\n"
                        "the elements of matrices {A} and {B} of the size {M}~\\x~{P} and {P}~\\x~{Q}, respectively,\n"
                        "the third file should be created to store the resulting matrix product {C}~=~{A}{B}.\n"
                        "Using successively the Matr1ScatterFile, Matr1Calc (in a loop),\n"
                        "and Matr1GatherFile functions (see the \\2, \\5, \\1\n"
                        "tasks), find a matrix {C} and write its elements to the resulting file.\n"
                        "\\PIn addition, output the current value of the c[step] in each process\n"
                        "after each call of the Matr1Calc function, where c is a one-dimensional array\n"
                        "containing the band {C}_{R}, and step is the algorithm step number (0, 1,~\\.,\n"
                        "{K}~\\-~1). Thus, the element c[0] should be output on the first step\n"
                        "of the algorithm, the element c[1] should be output on the second step\n"
                        "of the algorithm, and~so~on.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������: �������\n"
                        "������ ����� ���� ������������ ������, ���������� �������� ������ {A} � {B}\n"
                        "������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������, � ����� ��� ����� ��� ��������\n"
                        "��������������� ���������� ������������ {C}~=~{A}{B}.\n"
                        "\\P��������������� ������� ������������� � �������� \\2, \\5\n"
                        "� \\1 ������� Matr1ScatterFile, Matr1Calc (� �����) � Matr1GatherFile,\n"
                        "�������� � �������������� ����� ������������ �������� ������ {A} � {B}, ���������\n"
                        "� ������� ������� �������� ���������� ���������.\n"
                        "\\P����� ������� ������ ������� Matr1Calc ������������� �������� � ������\n"
                        "�������� ������� �������� �������� c[step], ��� c~\\= ���������� ������,\n"
                        "���������� ������ {C}_{R}, � step~\\= ����� ���� ��������� (0, 1,~\\., {K}~\\-~1);\n"
                        "����� �������, �� ������ ���� ��������� ������� ������� ������� c[0],\n"
                        "�� ������ ����~\\= ������� c[1], �~�.\\,�.");
                        */

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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y);
        DataS("Name of file for matrix C: ", sc.c_str(), xRight, y++);
//      DataComment("���������� ����� (������� B): ", 1, y++);
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

        ResultComment("File with matrix C: ", 1, y++);
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
                                        "Integers {P} and {Q} are given in each process; in addition, a matrix {B}\n"
                        "of the size {P}~\\x~{Q} is given in the master process. The number {Q} is a multiple\n"
                        "of the number of processes {K}. Input the matrix {B} into a one-dimensional array\n"
                        "of the size {P}\\*{Q} in the master process and define a new datatype named\n"
                        "MPI\\_BAND\\_B that contains a vertical band of the matrix {B}. The width\n"
                        "of the vertical band should be equal to {N}_{B}~=~{Q}/{K} columns. When\n"
                                            "defining the MPI\\_BAND\\_B datatype, use the MPI\\_Type\\_vector\n"
                                        "and MPI\\_Type\\_commit functions.\n"
                                        "\\PInclude this definition in a Matr2CreateTypeBand(p, n, q, t) function\n"
                        "with the input integer parameters p, n, q and the output parameter t\n"
                        "of the MPI\\_Datatype type; the parameters p and n determine the size\n"
                                            "of the vertical band (the number of its rows and columns),\n"
                                            "and the parameter q determines the number of columns\n"
                        "of the matrix from which this band is extracted.\n"
                        "\\PUsing the MPI\\_BAND\\_B datatype, send to each process (including the master\n"
                        "process) the corresponding band of the matrix {B} in the ascending order\n"
                        "of ranks of receiving processes. Sending should be performed using\n"
                        "the MPI\\_Send and MPI\\_Recv functions; the bands should be stored\n"
                        "in one-dimensional arrays of the size {P}\\*{N}_{B}.\n"
                        "Output the received band in each process.\n"
                        "\\P\\SRemark.\\s In the MPICH2 version 1.3, the MPI\\_Send function call is erroneous\n"
                        "if the sending and receiving processes are the same. You may use\n"
                        "the MPI\\_Sendrecv function to send a band to the master process. You may also\n"
                        "fill a band in the master process without using tools of the MPI library.");/*


                TaskText(
                        "� ������ �������� ���� ����� {P} � {Q}; ����� ����, � ������� �������� ����\n"
                        "������� {B} ������� {P}~\\x~{Q}. ��������, ��� ����� {Q} ������ ���������� ��������� {K}.\n"
                        "�������� � ������� �������� ������� {B} � ���������� ������ ������� {P}\\*{Q}\n"
                        "� ���������� ����� ��� MPI\\_BAND\\_B, ���������� ������������ ������ ������� {B}\n"
                        "������� {N}_{B}~=~{Q}/{K} ��������.\n"
                        "\\P��� ����������� ���� MPI\\_BAND\\_B ������������ ������� MPI\\_Type\\_vector\n"
                        "� MPI\\_Type\\_commit, ������� ��� ����������� � ���� �������\n"
                                                "Matr2CreateTypeBand(p, n, q, t), ��� ������������� ��������� p, n, q\n"
                                                "�������� ��������, � �������� t ���� MPI\\_Datatype �������� ��������;\n"
                                                "��� ���� ��������� p � n ���������� ������ ������������ ������\n"
                                                "(����� �� ����� � ��������), � �������� q~\\= ����� ��������\n"
                                                "�������, �� ������� ����������� ��� ������.\n"
                        "\\P��������� ��� MPI\\_BAND\\_B, ��������� � ������ ������� (������� �������)\n"
                        "��������������� ������ ������� {B}, ��������� ������ � ������� �����������\n"
                        "������ ���������-�����������. ��������� ��������� � ������� ������� MPI\\_Send\n"
                        "� MPI\\_Recv; ������ ������� � ���������� �������� ������� {P}\\*{N}_{B}.\n"
                        "������� � ������ �������� ���������� ������.\n"
                        "\\P\\S����������.\\s � ���������� MPICH2 ������ 1.3 � ������� ������� MPI\\_Send ������\n"
                        "��������� ��������� ������ � ��� �� �������, �� �������� ������ ����������\n"
                        "(���������� ��������� ���������). ��� ��������� ������ � ������� ������� �����\n"
                        "������������ ������� MPI\\_Sendrecv; ����� ����� ��������� ���������������\n"
                        "������ � ������� ��������, �� �������� � ��������� ���������� MPI.");
                        */

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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process. In the second variant\n"
                        "of the band algorithm of matrix multiplication, the first multiplier\n"
                        "(the matrix {A}) is divided into {K} horizontal bands and the second multiplier\n"
                        "(the matrix {B}) is divided into {K} vertical bands, where {K} is the number\n"
                        "of processes (hereinafter bands are distributed by processes and used\n"
                        "to calculate a part of the total matrix product in each process).\n"
                        "\\PThe band of the matrix {A} contains {N}_{A} rows, the band of the matrix {B}\n"
                        "contains {N}_{B} columns. The numbers {N}_{A} and {N}_{B} are calculated as follows:\n"
                        "{N}_{A}~=~ceil({M}/{K}), {N}_{B}~=~ceil({Q}/{K}), where the operation \\</\\> means the division\n"
                        "of real numbers and the function ceil performs rounding up. If the matrix\n"
                        "contains insufficient number of rows (or columns) to fill the last band\n"
                        "then the zero-valued rows (or columns) should be added to this band.\n"
                        "\\PAdd, if necessary, the zero-valued rows or columns to the initial matrices,\n"
                        "save them in one-dimensional arrays in the master process, and then send\n"
                        "the matrix bands from these arrays to all processes as follows: a band\n"
                        "with the index {R} is sent to the process of rank {R} ({R}~=~0, 1,~\\., {K}~\\-~1),\n"
                        "all the bands {A}_{R} are of the size {N}_{A}~\\x~{P}, all the bands {B}_{R} are\n"
                        "of the size {P}~\\x~{N}_{B}. In addition, create a band {C}_{R} in each process\n"
                        "to store the part of the matrix product {C}~=~{A}{B} which will be calculated\n"
                        "in this process. Each band {C}_{R} is of the size ({N}_{A}\\*{K})~\\x~{N}_{B}\n"
                        "and is filled with zero-valued elements.\n"
                        "\\PThe bands, like the initial matrices, should be stored in one-dimensional\n"
                        "arrays in a row-major order. To send the matrix sizes, use the MPI\\_Bcast\n"
                        "collective function, to send the bands of the matrix {A}, use the MPI\\_Scatter\n"
                        "collective function, to send the bands of the matrix {B}, use the MPI\\_Send\n"
                        "and MPI\\_Recv functions and also the MPI\\_BAND\\_B datatype created\n"
                        "by the Matr2CreateTypeBand function (see the previous task and a note to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr2ScatterData function\n"
                        "(without parameters). As a result of the call of this function, each process\n"
                        "will receive the values {N}_{A}, {P}, {N}_{B}, as well as one-dimensional arrays filled\n"
                        "with the corresponding bands of the matrices {A}, {B}, {C}. Output all obtained data\n"
                        "(that is, the numbers {N}_{A}, {P}, {N}_{B} and the bands of the matrices {A}, {B}, {C}) in each\n"
                        "process after calling the Matr2ScatterData function. Perform the input\n"
                        "of initial data in the Matr2ScatterData function, perform the output\n"
                        "of the results in the Solve function.\n"
                        "\\P\\SNotes.\\s (1) When input the matrix {B} into an array in the master process,\n"
                        "it should be taken into account that this array may contain elements\n"
                        "corresponding to additional zero-valued columns.\n"
                        "\\P(2) To reduce the number of the MPI\\_Bcast function calls,\n"
                        "all matrix sizes may be sent as a single array.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "��������������. �� ������ �������� ���������� ��������� ������������ ������\n"
                        "������ ������� ({A}) ����������� �� {K} �������������� �����, � ������ ({B})~\\=\n"
                        "�� {K} ������������ �����, ��� {K}~\\= ���������� ��������� (� ���������� ������\n"
                        "�������������� �� ��������� � ������������ ��� ���������� � ������ ��������\n"
                        "����� ��������� ���������� ������������).\n"
                        "\\P������ ��� ������� {A} �������� {N}_{A} �����, ������ ��� ������� {B}\n"
                        "�������� {N}_{B} ��������; ����� {N}_{A} � {N}_{B} ����������� �� �������� {N}_{A}~=~ceil({M}/{K}),\n"
                        "{N}_{B}~=~ceil({Q}/{K}), ��� �������� \\</\\> �������� ������������ �������, � ������� ceil\n"
                        "��������� ���������� � ��������. ���� ������� �������� ������������ �����\n"
                        "(��� ��������) ��� ���������� ��������� ������, �� ������ �����������\n"
                        "�������� �������� (���������).\n"
                        "\\P��������� �������� �������, ����������� ��� ������������� �������� ��������\n"
                        "��� ���������, � ���������� �������� � ������� ��������, ����� ����\n"
                        "������������ ��������� ����� �� ���� �������� �� ��� ��������: � �������\n"
                        "����� {R} ({R}~=~0, 1,~\\., {K}~\\-~1) ������������ ������ � �������� {R}, ��� ������ {A}_{R}\n"
                        "����� ������ {N}_{A}~\\x~{P}, ��� ������ {B}_{R} ����� ������ {P}~\\x~{N}_{B}. ����� ����, �������\n"
                        "� ������ �������� ������ {C}_{R} ��� �������� ��������� ���������� ������������\n"
                        "{C}~=~{A}{B}, ������� ����� ����������� � ���� ��������; ������ ������ {C}_{R} �����\n"
                        "������ ({N}_{A}\\*{K})~\\x~{N}_{B} � ����������� �������� ����������.\n"
                        "\\P������, ��� � �������� �������, ������ ��������� �� ������� � ����������\n"
                        "�������� ���������������� �������. ��� ��������� �������� ������ ������������\n"
                        "������������ ������� MPI\\_Bcast, ��� ��������� ����� ������� {A} ������������\n"
                        "������������ ������� MPI\\_Scatter, ��� ��������� ����� ������� {B} ������������\n"
                        "������� MPI\\_Send � MPI\\_Recv, � ����� ��������������� ��� MPI\\_BAND\\_B, ���������\n"
                        "� ������� ������� Matr2CreateTypeBand (��. ���������� �������\n"
                        "� ���������� � ����).\n"
                        "\\P�������� ��� ��������� �������� � ���� ������� Matr2ScatterData\n"
                        "(��� ����������), � ���������� ������ ������� ������ ������� ��������\n"
                        "�������� {N}_{A}, {P}, {N}_{B}, � ����� ���������� �������, ����������� ����������������\n"
                        "�������� ������ {A}, {B}, {C}. ����� ������ ������� Matr2ScatterData �������\n"
                        "� ������ �������� ���������� ������ (����� {N}_{A}, {P}, {N}_{B} � ������ ������ {A}, {B}, {C}).\n"
                        "���� �������� ������ ������������ � ������� Matr2ScatterData,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S��������.\\s (1) ��� ���������� ������� {B} � ������� �������� ������� ���������,\n"
                        "��� ��������������� ��� �� �������� ������ ����� ��������� ��������,\n"
                        "��������������� �������������� ������� ��������.\n"
                        "\\P(2) ��� ���������� ����� ������� ������� MPI\\_Bcast ��� ������������ �������\n"
                        "������ ����� ��������� �� ��������������� ������.");
                        */

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
                                "Integers {N}_{A}, {P}, {N}_{B} and one-dimensional arrays filled with the corresponding\n"
                                "bands of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                                "coincide with the results obtained in the \\1 task). Implement\n"
                                "the first step of the band algorithm of matrix multiplication as follows:\n"
                                "multiply elements in the bands {A}_{R} and {B}_{R} of each process and perform\n"
                                "the cyclic sending each band {A}_{R} to the process of the previous rank (that is,\n"
                                "from the process 1 to the process 0, from the process 2 to the process 1,~\\.,\n"
                                "from the process 0 to the process {K}~\\-~1, where {K} is the number of processes).\n"
                                "\\PUse the MPI\\_Sendrecv\\_replace function to send the bands. To determine\n"
                                "the ranks of the sending and receiving processes, use the expression\n"
                                "containing the % operator that gives the remainder of a division.\n"
                                "\\PInclude all the above mentioned actions in a Matr2Calc function (without\n"
                                "parameters). Output the new contents of the bands {C}_{R} and {A}_{R} in each process;\n"
                                "perform data input and output in the Solve function.\n"
                                "\\P\\SNote.\\s In this variant of the band algorithm, the bands {A}_{R} contain\n"
                                "the full rows of the matrix {A} and the bands {B}_{R} contain the full columns\n"
                                "of the matrix {B}, so, as a result of their multiplication, the band {C}_{R}\n"
                                "will contain part of the elements of the final matrix product already\n"
                                "at the first step of the algorithm (the other elements of the band {C}_{R}\n"
                                "will remain zero-valued). The location of the found elements in the band {C}_{R}\n"
                                "depends on the rank of the process (in particular, the first {N}_{A} rows\n"
                                "of the band {C}_0 in the process 0 will be filled in the first step\n"
                                "and the last {N}_{A} rows of the band {C}_{K-1} in the process {K}~\\-~1\n"
                                "will be filled in the first step).");/*


                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\1).\n"
                                "����������� ������ ��� ���������� ��������� ������������ ������, ��������\n"
                                "������������ ���������, ������������ � ������� {A}_{R} � {B}_{R} ������� ��������,\n"
                                "����� ���� ������������ ����������� ��������� ������ ������ {A}_{R} � �������\n"
                                "����������� ����� (�� �������� 1 � ������� 0, �� �������� 2 � ������� 1,~\\.,\n"
                                "�� �������� 0 � ������� {K}~\\-~1, ��� {K}~\\= ���������� ���������).\n"
                                "\\P����������� ��������� ����� {A}_{R} ��������� � ������� �������\n"
                                "MPI\\_Sendrecv\\_replace, ��������� ��� ����������� ������ ��������-�����������\n"
                                "� ��������-���������� �������� % ������ ������� �� �������.\n"
                                "\\P�������� ��� �������� � ���� ������� Matr2Calc (��� ����������).\n"
                                "������� ����� ���������� ����� {C}_{R} � {A}_{R} � ������ �������� (���� � �����\n"
                                "������ ��������� �� ������� ������� Solve).\n"
                                "\\P\\S��������.\\s ��������� � ������ �������� ���������� ��������� ������ {A}_{R} ��������\n"
                                "������ ������ ������� {A}, � ������ {B}_{R}~\\= ������ ������� ������� {B}, � ����������\n"
                                "�� ������������ ��� �� ������ ���� ��������� ������ {C}_{R} ����� ��������� �����\n"
                                "��������� ��������� ���������� ������������ (������ �������� ������ ���������\n"
                                "��������). ������������ ��������� ��������� � ������ {C}_{R} ������� �� �����\n"
                                "�������� (� ���������, �� ������ ���� � �������� 0 ����� ��������� {N}_{A} ������\n"
                                "����� ������ {C}_0, � � �������� {K}~\\-~1~\\= {N}_{A} ��������� ����� ������ {C}_{K-1}).");
                                */

        else if (cnt == 2)
                        TaskText(
                                "Integers {N}_{A}, {P}, {N}_{B} and one-dimensional arrays filled with the corresponding\n"
                                "bands of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                                "coincide with the results obtained in the \\2 task). Modify\n"
                                "the Matr2Calc function, which was implemented in the previous task;\n"
                                "the modified function should provide execution of any step\n"
                                "of the band algorithm of matrix multiplication.\n"
                                "\\PTo do this, add the parameter named step to the function (this parameter\n"
                                "specifies the step number and may be in the range 0 to {K}~\\-~1, where {K}\n"
                                "is the number of processes) and use the value of this parameter in the part\n"
                                "of the algorithm that deals with the recalculation of the elements\n"
                                "of the band {C}_{R} (the cyclic sending of the bands {A}_{R} does not depend\n"
                                "on the value of the parameter step).\n"
                                "\\PUsing two calls of the modified Matr2Calc function with the parameters 0\n"
                                "and 1, execute two initial steps of the band algorithm and output\n"
                                "the new contents of the bands {C}_{R} and {A}_{R} in each process.\n"
                                "Perform data input and output in the Solve function.\n"
                                "\\P\\SNote.\\s The parameter step determines which rows of the band {C}_{R}\n"
                                "will be calculated in this step of the algorithm\n"
                                "(note that these rows are selected cyclically).");/*


                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\2).\n"
                                "�������������� ������� Matr2Calc, ������������� � ���������� �������,\n"
                                "����� �������, ����� ��� ������������ ���������� ������ ����\n"
                                "��������� ���������� ���������.\n"
                                "\\P��� ����� �������� � ��� �������� step, ������������ ����� ���� (����������\n"
                                "�� 0 �� {K}~\\-~1, ��� {K}~\\= ���������� ���������) � ������������ �������� �����\n"
                                "��������� � ��� ����� ���������, ������� ������� � ���������� ���������\n"
                                "������ {C}_{R} (��������, ��������� � ����������� ���������� ����� {A}_{R},\n"
                                "�� �������� ��������� step �� �������).\n"
                                "\\P��������� ��� ������ ���������������� ������� Matr2Calc � ����������� 0 � 1,\n"
                                "��������� ��� ��������� ���� ���������� ��������� � ������� � ������ ��������\n"
                                "����� ���������� ����� {C}_{R} � {A}_{R} (���� � ����� ������\n"
                                "��������� �� ������� ������� Solve).\n"
                                "\\P\\S��������.\\s ����� ���� step ����������, ����� ������ ����� ������ {C}_{R} �����\n"
                                "��������� �� ������ ����� ��������� (������� �������� �������� �� ��,\n"
                                "��� ��� ������ ����� ������������ ����������).");
                                */
                else
        {
                        TaskText(
                                "Integers {N}_{A}, {P}, {N}_{B} and one-dimensional arrays filled with the corresponding\n"
                                "bands of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                                "coincide with the results obtained in the \\3 task). In addition,\n"
                                "a number {L} with the same value is given in each process. The value of {L}\n"
                                "is in the range 3 to {K}, where {K} is the number of processes, and determines\n"
                                "the number of steps of the band algorithm.\n"
                                "\\PUsing the function Matr2Calc({I}) (see the previous task) in a loop\n"
                                "with the parameter {I} ({I}~=~0,~\\., {L}~\\-~1), execute the initial {L} steps\n"
                                "of the band algorithm and output the new contents of the bands {C}_{R} and {A}_{R}\n"
                                "in each process. Perform data input and output in the Solve function.\n"
                                "\\P\\SRemark.\\s If the value of {L} is equal to {K} then the bands {C}_{R} will contain\n"
                                "the corresponding parts of the final matrix product {A}{B}.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {N}_{A}, {P}, {N}_{B}, � ����� ���������� �������,\n"
                                "����������� ���������������� �������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                                "������ ��������� � ������������, ����������� � ������� \\3).\n"
                                "����� ����, � ������ �������� ���� ���� � �� �� ����� {L}, ������� � ���������\n"
                                "�� 3 �� {K} ({K}~\\= ���������� ���������) � ������������ ��������� ����� �����\n"
                                "���������� ���������.\n"
                                "\\P������� � ����� �� ��������� {I} ({I}~=~0,~\\., {L}~\\-~1) ������� Matr2Calc({I}),\n"
                                "������������� � ���������� �������, ��������� {L} ��������� ����� ����������\n"
                                "��������� � ������� � ������ �������� ����� ���������� ����� {C}_{R} � {A}_{R}\n"
                                "(���� � ����� ������ ��������� �� ������� ������� Solve).\n"
                                "\\P\\S����������.\\s ���� �������� {L} ����� {K}, �� ������ {C}_{R} ����� ���������\n"
                                "��������������� ��������� ��������� ���������� ������������ {A}{B}.");
                                */
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
                        "Integers {M} and {Q} (the numbers of rows and columns of the matrix product)\n"
                        "are given in the master process. In addition, integers {N}_{A}, {N}_{B}\n"
                        "and one-dimensional arrays filled with the ({N}_{A}\\*{K})~\\x~{N}_{B} bands of the matrix {C}\n"
                        "are given in each process (the given bands of {C} are obtained as a result\n"
                        "of {K} steps of the band algorithm~\\= see the \\1 task).\n"
                        "Send all the bands {C}_{R} to the master process and output the received matrix {C}\n"
                        "of the size {M}~\\x~{Q} in this process.\n"
                        "\\PTo store the resulting matrix {C} in the master process, use a one-dimensional\n"
                        "array sufficient to store the matrix of the size ({N}_{A}\\*{K})~\\x~({N}_{B}\\*{K}). To send data\n"
                        "to this array, use the MPI\\_Send and MPI\\_Recv functions and the MPI\\_BAND\\_C\n"
                        "datatype created by the Matr2CreateTypeBand function\n"
                        "(see the \\5 task and a note to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr2GatherData function\n"
                        "(without parameters). Perform the input of initial data in the Solve function,\n"
                        "perform the output of the resulting matrix in the Matr2GatherData function.\n"
                        "\\P\\SNote.\\s When output the matrix {C} in the master process, it should be taken\n"
                        "into account that an array, which is intended for matrix storage, may contain\n"
                        "elements corresponding to additional zero-valued columns.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M} � {Q}~\\= ���������� ����� � ��������\n"
                        "��������������� ���������� ������������. ����� ����, � ������ �������� ����\n"
                        "����� {N}_{A}, {N}_{B}, � ����� ���������� �������, ����������� �������� ������� {C}\n"
                        "(������� ({N}_{A}\\*{K})~\\x~{N}_{B}), ������� ���� �������� � ���������� ���������� {K} �����\n"
                        "���������� ��������� ������������ ������ (��. \\1). ���������\n"
                        "��� ������ {C}_{R} � ������� ������� � ������� � ��� ���������� ������� {C}\n"
                        "(������� {M}~\\x~{Q}).\n"
                        "\\P��� �������� �������������� ������� {C} � ������� �������� ������������\n"
                        "���������� ������, ����������� ��� �������� ������� ������� ({N}_{A}\\*{K})~\\x~({N}_{B}\\*{K}).\n"
                        "��� ��������� ����� {C}_{R} ������������ ������� MPI\\_Send � MPI\\_Recv, � �����\n"
                        "��������������� ��� MPI\\_BAND\\_C, ��������� � ������� ������� Matr2CreateTypeBand\n"
                        "(��. ������� \\5 � ���������� � ����).\n"
                        "\\P�������� ��� �������� � ���� ������� Matr2GatherData (��� ����������).\n"
                        "���� ������ ��������� �� ������� ������� Solve, ����� ���������� �������\n"
                        "�������� � ������� Matr2GatherData.\n"
                        "\\P\\S��������.\\s ��� ������ ������� {C} � ������� �������� ������� ���������,\n"
                        "��� ��������������� ��� �� �������� ������ ����� ��������� ��������,\n"
                        "��������������� �������������� ������� ��������.");
                        */

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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process (thus, the given data\n"
                        "coincide with the given data in the \\5 task).\n"
                        "\\PUsing successively the Matr2ScatterData, Matr2Calc (in a loop),\n"
                        "and Matr2GatherData functions, that are developed\n"
                        "in the \\5\\-\\1 tasks, find a matrix {C}, which is equal\n"
                        "to the product of the initial matrices {A} and {B},\n"
                        "and output this matrix in the master process.\n"
                        "\\PIn addition, output the current contents of the band {C}_{R} in each process\n"
                        "after each call of the Matr2Calc function.\n"
                        "\\PModify the Matr2Calc function (see the \\3 task), before using\n"
                        "in this task, as follows: the bands {A}_{R} should not be sent\n"
                        "when the parameter step is equal to {K}~\\-~1.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "�������������� (����� �������, �������� ������ ��������� � ��������� �������\n"
                        "��� ������� \\5).\n"
                        "\\P��������������� ������� ������������� � �������� \\5\\-\\1\n"
                        "������� Matr2ScatterData, Matr2Calc (� �����) � Matr2GatherData, ��������\n"
                        "� ������� � ������� �������� ������� {C}, ������\n"
                        "������������ �������� ������ {A} � {B}.\n"
                        "\\P����� ������� ������ ������� Matr2Calc ������������� �������� � ������\n"
                        "�������� ������� ���������� ������ {C}_{R}.\n"
                        "\\P����� �������������� � ������ ������� ������� �������������� �������������\n"
                        "� \\3 ������� Matr2Calc ����� �������, ����� ��� ��������\n"
                        "��������� step, ������ {K}~\\-~1, �� ����������� ��������� ����� {A}_{R}.");
                        */
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
                        "Integers {M}, {P}, {Q} and two file names are given in the master process.\n"
                        "The given files contain elements of a matrix {A} of the size {M}~\\x~{P}\n"
                        "and a matrix {B} of the size {P}~\\x~{Q}. The number {Q} is a multiple of the number\n"
                        "of processes {K}. Modify the initial stage of the band algorithm of matrix\n"
                        "multiplication (see the \\6 task) as follows: each process\n"
                        "should read the corresponding bands of the matrices {A} and {B} directly\n"
                        "from the given files.\n"
                        "\\PTo send the sizes of matrices and file names, use the MPI\\_Bcast collective\n"
                        "function. Use the MPI\\_File\\_seek and MPI\\_File\\_read\\_all collective functions\n"
                        "to read the horizontal bands of the matrix {A}. To read the vertical bands\n"
                        "of the matrix {B}, set the appropriate file view using the MPI\\_File\\_set\\_view\n"
                        "function and the MPI\\_BAND\\_B file type defined with the Matr2CreateTypeBand\n"
                        "function (see the \\7 task), and then\n"
                        "use the MPI\\_File\\_read\\_all function.\n"
                        "\\PInclude all these actions in a Matr2ScatterFile function (without parameters).\n"
                        "As a result of the call of this function, each process will receive\n"
                        "the values {N}_{A}, {P}, {N}_{B}, as well as one-dimensional arrays filled with\n"
                        "the corresponding bands of the matrices {A}, {B}, {C}. Output all obtained data\n"
                        "(that is, the numbers {N}_{A}, {P}, {N}_{B} and the bands of the matrices {A}, {B}, {C})\n"
                        "in each process after calling the Matr2ScatterFile function. Perform the input\n"
                        "of initial data in the Matr2ScatterFile function, perform the output\n"
                        "of the results in the Solve function.\n"
                        "\\P\\SNote.\\s A condition that the number {Q} is a multiple of {K} allows us to perform\n"
                        "reading of the bands {B}_{R} using the same file type in all processes.\n"
                        "\\PIf this condition is not fulfilled then it would be necessary to use special\n"
                        "types that ensure the correct reading from the file and write to the array\n"
                        "of \\<truncated\\> bands of the matrix {B} in the last processes (in addition,\n"
                        "in this case it would be necessary to send to each process the value of {Q}\n"
                        "which is necessary for the correct type definition for \\<truncated\\> bands).");/*



                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������, ����������\n"
                        "�������� ������ {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������. ��������,\n"
                        "��� ����� {Q} ������ ���������� ��������� {K}. �������������� ��������� ����\n"
                        "���������� ��������� ������������ ������ (��. \\6) ����� �������,\n"
                        "����� ������ ������� �������� ��������������� ������ ������ {A} � {B}\n"
                        "��������������� �� �������� ������.\n"
                        "\\P��� ��������� �������� ������ � ���� ������ ������������ ������������\n"
                        "������� MPI\\_Bcast. ��� ���������� �������������� ����� ������� {A} ������������\n"
                        "������������ ������� MPI\\_File\\_seek � MPI\\_File\\_read\\_all; ��� ����������\n"
                        "������������ ����� ������� {B} ������ ��������������� ��� ������, ���������\n"
                        "������� MPI\\_File\\_set\\_view � ����� �������� ��� MPI\\_BAND\\_B, ������������\n"
                        "� ������� ������� Matr2CreateTypeBand (��. \\7), ����� ����\n"
                        "����� ������������ ������� MPI\\_File\\_read\\_all.\n"
                        "\\P�������� ��� �������� � ���� ������� Matr2ScatterFile (��� ����������),\n"
                        "� ���������� ������ ������� ������ ������� �������� �������� {N}_{A}, {P}, {N}_{B},\n"
                        "� ����� ���������� �������, ����������� ���������������� ��������\n"
                        "������ {A}, {B}, {C}. ����� ������ ������� Matr2ScatterFile ������� � ������\n"
                        "�������� ���������� ������ (����� {N}_{A}, {P}, {N}_{B} � ������ ������ {A}, {B}, {C}).\n"
                        "���� �������� ������ ������������ � ������� Matr2ScatterFile,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S����������.\\s �������������� ������� � ��������� �������� {Q} ����� {K} ���������\n"
                        "������������ ���������� ����� {B}_{R} � �������������� ����������� ��������� ����\n"
                        "�� ���� ���������.\n"
                        "\\P��� ���������� ����� ������� ������������� �� ��������� ����������� ����,\n"
                        "�������������� ���������� ���������� �� ����� � ������ � ������ \\<�����������\\>\n"
                        "����� ������� {B} � ��������� ��������� (����� ����, � ���� ������\n"
                        "������������� �� ��������� ������� �������� �������� {Q}, �����������\n"
                        "��� ����������� ����������� ����� ��� \\<�����������\\> �����).");
                        */

        MakeDim2();
        q = n * k2; // ��� ��������� �������!
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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y++);
//      DataComment("���������� ����� (������� B): ", 1, y++);
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
                        "Integers {N}_{A}, {N}_{B} and one-dimensional arrays filled\n"
                        "with the ({N}_{A}\\*{K})~\\x~{N}_{B} bands {C}_{R} are given in each process (the given bands {C}_{R}\n"
                        "are obtained as a result of {K} steps of the band algorithm of matrix\n"
                        "multiplication~\\= see the \\4 task). In addition, an integer {M}\n"
                        "(the number of rows of the matrix product) and the name of file (to store\n"
                        "this product) are given in the master process. The number of columns {Q}\n"
                        "of the matrix product is a multiple of the number of processes {K}\n"
                        "(and, therefore, is equal to {N}_{B}\\*{K}).\n"
                        "\\PSend the number {M} and the file name to all processes using the MPI\\_Bcast\n"
                        "function. Write all the parts of the matrix product contained in the bands {C}_{R}\n"
                        "to the resulting file, which will eventually contain\n"
                        "a matrix {C} of the size {M}~\\x~{Q}.\n"
                        "\\PTo write the bands to the file, set the appropriate file view using\n"
                        "the MPI\\_File\\_set\\_view function and the MPI\\_BAND\\_C file type defined\n"
                        "with the Matr2CreateTypeBand function (see the \\8 task), and then\n"
                        "use the MPI\\_File\\_write\\_all function.\n"
                        "\\PInclude all these actions (namely, the input of file name, sending number {M}\n"
                        "and the file name, and writing all bands to the file) in a Matr2GatherFile\n"
                        "function. Perform the input of all initial data, except the file name,\n"
                        "in the Solve function.\n"
                        "\\P\\SNote.\\s When writing data to the resulting file, it is necessary to take\n"
                        "into account that the bands {C}_{R} may contain trailing zero-valued rows\n"
                        "that are not related to the resulting matrix product (the number {M}\n"
                        "should be sent to all processes in order to control this situation).");/*


                TaskText(
                        "� ������ �������� ���� ����� {N}_{A}, {N}_{B}, � ����� ���������� �������, �����������\n"
                        "�������� {C}_{R} (������� ({N}_{A}\\*{K})~\\x~{N}_{B}), ����������� � ���������� ���������� {K} �����\n"
                        "���������� ��������� ������������ ������ (��. \\4). ����� ����,\n"
                        "� ������� �������� ���� ����� {M}~\\= ���������� ����� ��������������� ����������\n"
                        "������������ � ��� ����� ��� �������� ����� ������������. �������������\n"
                        "��������, ��� ���������� �������� {Q} ��������������� ���������� ������������\n"
                        "������ ����� ��������� (�, �������������, ����� {N}_{B}\\*{K}).\n"
                        "\\P��������� ����� {M} � ��� ����� �� ��� �������� (��������� ������� MPI\\_Bcast)\n"
                        "� �������� ��� ��������� ���������� ������������, ������������ � ������� {C}_{R},\n"
                        "� �������������� ����, ������� � ����� ����� ���������\n"
                        "������� {C} ������� {M}~\\x~{Q}.\n"
                        "\\P��� ������ ����� � ���� ������ ��������������� ��� ������, ��������� �������\n"
                        "MPI\\_File\\_set\\_view � ����� �������� ��� MPI\\_BAND\\_C, ������������ � �������\n"
                        "������� Matr2CreateTypeBand (��. \\8), ����� ���� ������������\n"
                        "������������ ������� MPI\\_File\\_write\\_all.\n"
                        "\\P�������� ���������� ����� �����, ��������� �������� {M} � ����� �����, � �����\n"
                        "��� �������� �� ������ ����� � ���� � ���� ������� Matr2GatherFile\n"
                        "(���������� ���� �������� ������, ����� ����� �����,\n"
                        "������ �������������� �� ������� ������� Solve).\n"
                        "\\P\\S��������.\\s ��� ������ ������ � �������������� ���� ���������� ���������,\n"
                        "��� ������ {C}_{R} ����� ��������� ����������� ������� ������, �� ���������\n"
                        "� ���������� ������������� (������ ��� �������� ���� ��������\n"
                        "��������� ���������� �� ��� �������� �������� {M}).");
                        */

        MakeDim2();
        q = n * k2; // ��� ��������� �������!
        Init2();

        Prod2(n, 0);
        y = 1;
        std::string sc = "C" + FileName(5) + ".tst";
//      DataS("��� ����� ��� ������� C: ", sc.c_str(), 1, y++);
        for (int i = 0; i < n; i++)
        {
                DataProcComment(i, y);
                DataN("N_A = ", k1, 12, y, 1);
                DataN("N_B = ", k2, 21, y++, 1);
                DataMatr1(ind("C", i, ":").c_str(), &c[i*k2], k1 *n, k2, k2*n, y);
                if (i == 0)
                {
                        DataN("M = ", m, 12, y++, 1);
//                      DataN("Q = ", q, 21, y++, 1); // �� �����, ��������, ��� q = n * k2
                        DataS("Name of file for matrix C: ", sc.c_str(), 12, y++);
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
        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M}, {P}, {Q} and three file names are given in the master process.\n"
                        "The first two file names are related to the existing files containing\n"
                        "the elements of matrices {A} and {B} of the size {M}~\\x~{P} and {P}~\\x~{Q}, respectively,\n"
                        "the third file should be created to store the resulting matrix product {C}~=~{A}{B}.\n"
                        "The number {Q} is a multiple of the number of processes {K}. Using successively\n"
                        "the Matr2ScatterFile, Matr2Calc (in a loop), and Matr2GatherFile functions\n"
                        "(see the \\2, \\5, \\1 tasks), find a matrix {C}\n"
                        "and write its elements to the resulting file.\n"
                        "\\PIn addition, output the current value of the c[step] in each process\n"
                        "after each call of the Matr2Calc function, where c is a one-dimensional array\n"
                        "containing the band {C}_{R}, and step is the algorithm step number (0, 1,~\\.,\n"
                        "{K}~\\-~1). Thus, the element c[0] should be output on the first step\n"
                        "of the algorithm, the element c[1] should be output\n"
                        "on the second step of the algorithm, and~so~on.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������: �������\n"
                        "������ ����� ���� ������������ ������, ���������� �������� ������ {A} � {B}\n"
                        "������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������, � ����� ��� ����� ��� ��������\n"
                        "��������������� ���������� ������������ {C}~=~{A}{B}. ������������� ��������,\n"
                        "��� ����� {Q} ������ ���������� ��������� {K}.\n"
                        "\\P��������������� ������� ������������� � �������� \\2, \\5\n"
                        "� \\1 ������� Matr2ScatterFile, Matr2Calc (� �����) � Matr2GatherFile,\n"
                        "�������� � �������������� ����� ������������ �������� ������ {A} � {B}, ���������\n"
                        "� ������� ������� �������� ���������� ���������.\n"
                        "\\P����� ������� ������ ������� Matr2Calc ������������� �������� � ������\n"
                        "�������� ������� �������� �������� c[step], ��� c~\\= ���������� ������,\n"
                        "���������� ������ {C}_{R}, � step~\\= ����� ���� ��������� (0, 1,~\\., {K}~\\-~1);\n"
                        "����� �������, �� ������ ���� ��������� ������� ������� ������� c[0],\n"
                        "�� ������ ����~\\= ������� c[1], �~�.\\,�.");
                        */

        MakeDim2();
        q = n * k2; // ��� ��������� �������!
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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y);
//      DataComment("���������� ����� (������� B): ", 1, y++);
        DataS("Name of file for matrix C: ", sc.c_str(), xRight, y++);
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


        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M} and {P} are given in each process; in addition, a matrix {A}\n"
                        "of the size {M}~\\x~{P} is given in the master process. The number of processes {K}\n"
                        "is a perfect square: {K}~=~{K}_0\\*{K}_0, the numbers {M} and {P} are multiples of {K}_0.\n"
                        "Input the matrix {A} into a one-dimensional array of the size {M}\\*{P} in the master\n"
                        "process and define a new datatype named MPI\\_BLOCK\\_A that contains\n"
                        "a {M}_0~\\x~{P}_0 block of the matrix {A}, where {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\PWhen defining the MPI\\_BLOCK\\_A type, use the MPI\\_Type\\_vector\n"
                        "and MPI\\_Type\\_commit functions. Include this definition\n"
                        "in a Matr4CreateTypeBlock(m0, p0, p, t) function with the input integer\n"
                        "parameters m0, p0, p and the output parameter t of the MPI\\_Datatype type;\n"
                        "the parameters m0 and p0 determine the size of the block, and the parameter p\n"
                        "determines the number of columns of the matrix\n"
                        "from which this block is extracted.\n"
                        "\\PUsing the MPI\\_BLOCK\\_A datatype, send to each process (in ascending order\n"
                        "of ranks of processes, including the master process) the corresponding\n"
                        "block of the matrix {A} in a row-major order of blocks (that is, the first block\n"
                        "should be sent to the process 0, the next block in the same row of blocks\n"
                        "should be sent to the process 1, and~so~on). Sending should be performed using\n"
                        "the MPI\\_Alltoallw function; the blocks should be stored in one-dimensional\n"
                        "arrays of the size {M}_0\\*{P}_0. Output the received block in each process.\n"
                        "\\P\\SNotes.\\s (1) Use the MPI\\_Send and MPI\\_Recv functions instead\n"
                        "of the MPI\\_Alltoallw function when solving this task using the MPI-1 library.\n"
                        "\\P(2) The MPI\\_Alltoallw function introduced in MPI-2 is the only collective\n"
                        "function that allows you to specify the displacements for the sent data\n"
                        "in \\Ibytes\\i (not in elements). This gives opportunity to use it in conjunction\n"
                        "with complex data types to implement any variants of collective communications\n"
                        "(in our case, we need to implement a communication of the scatter type).\n"
                        "\\PIt should be noted that all array parameters of the MPI\\_Alltoallw function\n"
                        "associated with the sent data must be differently defined in the master\n"
                        "and slave processes. In particular, the array scounts (which determines\n"
                        "the number of sent elements) must contain the values 0 in all the slave\n"
                        "processes and the value 1 in the master process (the sent elements\n"
                        "are of the MPI\\_BLOCK\\_A datatype).\n"
                        "\\PAt the same time, arrays associated with the received data will be defined\n"
                        "in the same way in all processes; in particular, the zero-indexed element\n"
                        "of the array rcounts (which determines the number of received elements)\n"
                        "must be equal to {M}_0\\*{P}_0, and all other elements of this array\n"
                        "must be equal to 0 (the received elements are of the MPI\\_INT datatype).\n"
                        "\\PIt is necessary to pay special attention to the correct definition\n"
                        "of elements in the array sdispls of displacements for the sent data\n"
                        "in the master process (in the slave processes, it is enough\n"
                        "to use the zero-valued array sdispls).");/*
                        //2020.10

                TaskText(
                        "� ������ �������� ���� ����� {M} � {P}; ����� ����, � ������� �������� ����\n"
                        "������� {A} ������� {M}~\\x~{P}. ��������, ��� ���������� ��������� {K} �������� ������\n"
                        "���������: {K}~=~{K}_0\\*{K}_0, � ����� {M} � {P} ������ ����� {K}_0. �������� � �������\n"
                        "�������� ������� {A} � ���������� ������ ������� {M}\\*{P} � ���������� ����� ���\n"
                        "MPI\\_BLOCK\\_A, ���������� ���� ������� {A} ������� {M}_0~\\x~{P}_0,\n"
                        "��� {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\P��� ����������� ���� MPI\\_BLOCK\\_A ������������ ������� MPI\\_Type\\_vector\n"
                        "� MPI\\_Type\\_commit, ������� ��� ����������� � ���� �������\n"
                        "Matr4CreateTypeBlock(m0, p0, p, t), ��� ������������� ��������� m0, p0, p\n"
                        "�������� ��������, � �������� t ���� MPI\\_Datatype �������� ��������;\n"
                        "��� ���� ��������� m0 � p0 ���������� ������� �����, � �������� p~\\= �����\n"
                        "�������� �������, �� ������� ����������� ���� ����.\n"
                        "\\P��������� ��� MPI\\_BLOCK\\_A, ��������� � ������ ������� (������� �������)\n"
                        "��������������� ���� ������� {A}, ��������� ����� �� ������� � ��������� ��\n"
                        "� �������� � ������� ����������� �� ������ (������ ���� ������������\n"
                        "� ������� 0, ��������� �� ��� ���� � ���� �� ������ ������������ � ������� 1,\n"
                        "�~�.\\,�.). ��������� ��������� � ������� ������������ ������� MPI\\_Alltoallw;\n"
                        "����� ������� � ���������� �������� ������� {M}_0\\*{P}_0.\n"
                        "������� � ������ �������� ���������� ����.\n"
                        "\\P\\S��������.\\s (1) ��� ���������� ������� � ����������� ���������� MPI-1 ������\n"
                        "������� MPI\\_Alltoallw ������� ������������ ������� MPI\\_Send � MPI\\_Recv.\n"
                        "\\P(2) ������� MPI\\_Alltoallw, ��������� � MPI-2, �������� ������������\n"
                        "������������ ��������, ������� ��������� ��������� �������� ��� ������������\n"
                        "������ � \\I������\\i, � �� � ���������. ��� ���� ����������� ������������ ��\n"
                        "��������� �� �������� ������ ������ ��� ���������� ����� ���������\n"
                        "������������ ������� (� ������ ������ ��������� ����������� �������\n"
                        "���� Scatter).\n"
                        "\\P������� ���������, ��� ��� �������� �������� �������� ��� ���������-�������\n"
                        "������� MPI\\_Alltoallw, ��������� � ����������� �������, ���������� ��-�������\n"
                        "���������� � ������� � ����������� ���������. � ���������, ������ scounts\n"
                        "(������������ ���������� ���������� ������) ������ ��������� �������� 0\n"
                        "�� ���� ����������� ��������� � �������� 1 � ������� ��������\n"
                        "(���������� �������� ����� ��� MPI\\_BLOCK\\_A).\n"
                        "\\P� �� �� �����, �������, ��������� � ������������ �������, ����� ������������\n"
                        "���������� ������� �� ���� ���������; � ���������, � ������� rcounts\n"
                        "(������������ ���������� ����������� ������) ������� � �������� 0 ������ ����\n"
                        "����� {M}_0\\*{P}_0, � ��� ��������� �������� ������ ���� ����� 0\n"
                        "(����������� �������� ����� ��� MPI\\_INT).\n"
                        "\\P���������� �������� ������ �������� �� ���������� ����������� ���������\n"
                        "� ������� sdispls �������� ��� ���������� ������ � ������� ��������\n"
                        "(� ����������� ��������� ���� ������ ���������� ��������).");
                        */
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
                        "Integers {M}_0, {P}_0 and a matrix {A} of the size {M}_0~\\x~{P}_0 are given in each process.\n"
                        "The number of processes {K} is a perfect square: {K}~=~{K}_0\\*{K}_0. Input the matrix {A}\n"
                        "into a one-dimensional array of the size {M}_0\\*{P}_0 in each process and create\n"
                        "a new communicator named MPI\\_COMM\\_GRID using the MPI\\_Cart\\_create function.\n"
                        "The MPI\\_COMM\\_GRID communicator defines a Cartesian topology for all processes\n"
                        "as a two-dimensional periodic {K}_0~\\x~{K}_0 grid (ranks of processes\n"
                        "should not be reordered).\n"
                        "\\PInclude the creation of the MPI\\_COMM\\_GRID communicator\n"
                        "in a Matr4CreateCommGrid(comm) function with the output parameter comm\n"
                        "of the MPI\\_Comm type. Using the MPI\\_Cart\\_coords function\n"
                        "for this communicator, output the process\n"
                        "coordinates ({I}_0, {J}_0) in each process.\n"
                        "\\POn the base of the MPI\\_COMM\\_GRID communicator, create a set of communicators\n"
                        "named MPI\\_COMM\\_ROW, which are associated with the rows of the initial\n"
                        "two-dimensional grid. Use the MPI\\_Cart\\_sub function to create the MPI\\_COMM\\_ROW\n"
                        "communicators.\n"
                        "\\PInclude the creation of the MPI\\_COMM\\_ROW communicators\n"
                        "in a Matr4CreateCommRow(grid, row) function with the input parameter grid\n"
                        "(the communicator associated with the initial two-dimensional grid)\n"
                        "and the output parameter row (both parameters are of the MPI\\_Comm type).\n"
                        "Output the process rank {R}_0 for the MPI\\_COMM\\_ROW communicator\n"
                        "in each process (this rank must be equal to {J}_0).\n"
                        "\\PIn addition, send the matrix {A} from the grid element ({I}_0, {I}_0)\n"
                        "to all processes of the same grid row {I}_0 ({I}_0~=~0,~\\., {K}_0~\\-~1)\n"
                        "using the MPI\\_Bcast collective function for the MPI\\_COMM\\_ROW communicator.\n"
                        "Save the received matrix in the auxiliary matrix {T} of the same size\n"
                        "as the matrix {A} (it is necessary to copy the matrix {A} to the matrix {T}\n"
                        "in the sending process before the call of the MPI\\_Bcast function).\n"
                        "Output the received matrix {T} in each process.");/*


                TaskText(
                        "� ������ �������� ���� ����� {M}_0 � {P}_0, � ����� ������� {A} ������� {M}_0~\\x~{P}_0.\n"
                        "��������, ��� ���������� ��������� {K} �������� ������ ���������: {K}~=~{K}_0\\*{K}_0.\n"
                        "�������� � ������ �������� ������� {A} � ���������� ������ ������� {M}_0\\*{P}_0\n"
                        "� ���������� �� ��������� �������� ��������� ������������ MPI\\_COMM\\_GRID,\n"
                        "�������� ��������� ��������� ��������� ���������� ����������� �������\n"
                        "������� {K}_0 (�������� ������� ��������� ��������� �����������).\n"
                        "\\P��� ����������� ������������� MPI\\_COMM\\_GRID ������������ �������\n"
                        "MPI\\_Cart\\_create, ������� ��� ����������� � ���� �������\n"
                        "Matr4CreateCommGrid(comm) � �������� ���������� comm ���� MPI\\_Comm.\n"
                        "������� � ������ �������� ���������� ({I}_0, {J}_0) ����� ��������\n"
                        "� ��������� ���������, ��������� ������� MPI\\_Cart\\_coords.\n"
                        "\\P�� ������ ������������� MPI\\_COMM\\_GRID ������� ����� ��������������\n"
                        "MPI\\_COMM\\_ROW, ��������� �� �������� �������� ��������� �������.\n"
                        "��� ����������� �������������� MPI\\_COMM\\_ROW ������������ �������\n"
                        "MPI\\_Cart\\_sub, ������� ��� ����������� � ���� ��������������� �������\n"
                        "Matr4CreateCommRow(grid, row) � ������� ���������� grid (��������������,\n"
                        "��������� � �������� ��������� ��������) � �������� ���������� row\n"
                        "(��� ��������� ���� MPI\\_Comm). ������� � ������ �������� ��� ���� {R}_0\n"
                        "��� ������������� MPI\\_COMM\\_ROW (���� ���� ������ ��������� �� ��������� {J}_0).\n"
                        "\\P����� ����, ��� ������ ������ {I}_0 ���������� ������� ����������� ���������\n"
                        "������� {A} �� ������� {I}_0 �� ��� �������� ���� �� ������, ��������� ������������\n"
                        "������� MPI\\_Bcast ��� ������������� MPI\\_COMM\\_ROW � �������� ���������\n"
                        "�� ��������������� ������� {T} ���� �� �������, ��� � ������� {A}\n"
                        "(����� ���������� ���������� ����������� � ������� {T} ������������ ��������\n"
                        "�������� ������������ ������� {A}). ������� � ������ ��������\n"
                        "���������� ������� {T}.");
                        */
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
                        "Integers {P}_0, {Q}_0 and a matrix {B} of the size {P}_0~\\x~{Q}_0 are given in each process.\n"
                        "The number of processes {K} is a perfect square: {K}~=~{K}_0\\*{K}_0. Input the matrix {B}\n"
                        "into a one-dimensional array of the size {P}_0\\*{Q}_0 in each process and create\n"
                        "a new communicator named MPI\\_COMM\\_GRID, which defines a Cartesian topology\n"
                        "for all processes as a two-dimensional periodic {K}_0~\\x~{K}_0 grid.\n"
                        "\\PUse the Matr4CreateCommGrid function (see the \\1 task) to create\n"
                        "the MPI\\_COMM\\_GRID communicator. Using the MPI\\_Cart\\_coords function\n"
                        "for this communicator, output the process coordinates ({I}_0, {J}_0)\n"
                        "in each process.\n"
                        "\\POn the base of the MPI\\_COMM\\_GRID communicator, create a set of communicators\n"
                        "named MPI\\_COMM\\_COL, which are associated with the columns of the initial\n"
                        "two-dimensional grid. Use the MPI\\_Cart\\_sub function to create the MPI\\_COMM\\_COL\n"
                        "communicators.\n"
                        "\\PInclude the creation of the MPI\\_COMM\\_COL communicators\n"
                        "in a Matr4CreateCommCol(grid, col) function with the input parameter grid\n"
                        "(the communicator associated with the initial two-dimensional grid)\n"
                        "and the output parameter col (both parameters are of the MPI\\_Comm type).\n"
                        "Output the process rank {R}_0 for the MPI\\_COMM\\_COL communicator in each process\n"
                        "(this rank must be equal to {I}_0).\n"
                        "\\PIn addition, perform a cyclic shift of the matrices {B} given in all processes\n"
                        "of each grid column {J}_0 by 1 position up (that is, in descending order of ranks\n"
                        "of processes) using the MPI\\_Sendrecv\\_replace function for the MPI\\_COMM\\_COL\n"
                        "communicator (to determine the ranks of the sending and receiving processes,\n"
                        "use the expression containing the % operator that gives the remainder\n"
                        "of a division). Output the received matrix in each process.");/*


                TaskText(
                        "� ������ �������� ���� ����� {P}_0 � {Q}_0, � ����� ������� {B} ������� {P}_0~\\x~{Q}_0.\n"
                        "��������, ��� ���������� ��������� {K} �������� ������ ���������: {K}~=~{K}_0\\*{K}_0.\n"
                        "�������� � ������ �������� ������� {B} � ���������� ������ ������� {P}_0\\*{Q}_0\n"
                        "� ���������� �� ��������� �������� ��������� ������������ MPI\\_COMM\\_GRID,\n"
                        "�������� ��������� ��������� ��������� ���������� ����������� �������\n"
                        "������� {K}_0.\n"
                        "\\P��� ����������� ������������� MPI\\_COMM\\_GRID ������������ �������\n"
                        "Matr4CreateCommGrid (��. ������� \\1). ������� � ������ ��������\n"
                        "��� ���������� ({I}_0, {J}_0) � ��������� ���������,\n"
                        "��������� ������� MPI\\_Cart\\_coords.\n"
                        "\\P�� ������ ������������� MPI\\_COMM\\_GRID ������� ����� ��������������\n"
                        "MPI\\_COMM\\_COL, ��������� �� ��������� �������� ��������� �������.\n"
                        "��� ����������� �������������� MPI\\_COMM\\_COL ������������ ������� MPI\\_Cart\\_sub,\n"
                        "������� ��� ����������� � ���� ������� Matr4CreateCommCol(grid, col) � �������\n"
                        "���������� grid (��������������, ��������� � �������� ��������� ��������)\n"
                        "� �������� ���������� col (��� ��������� ���� MPI\\_Comm). ������� � ������\n"
                        "�������� ��� ���� {R}_0 ��� ������������� MPI\\_COMM\\_COL\n"
                        "(���� ���� ������ ��������� �� ��������� {I}_0).\n"
                        "\\P����� ����, ��� ������� ������� {J}_0 ���������� ������� ����������� �����������\n"
                        "����� ������ {�} �� 1 ������� ����� (�.\\,�. � ����������� �������� ������\n"
                        "���������), ��������� ������� MPI\\_Sendrecv\\_replace ��� �������������\n"
                        "MPI\\_COMM\\_COL (��� ����������� ������ ��������-�����������\n"
                        "� ��������-���������� ������������ �������� % ������ ������� �� �������).\n"
                        "������� � ������ �������� �������, ���������� � ���������� ������.");
                        */
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process. The number of processes {K}\n"
                        "is a perfect square: {K}~=~{K}_0\\*{K}_0. In the block algorithms of matrix\n"
                        "multiplication, the initial matrices are divided into {K} blocks\n"
                        "and are interpreted as square block matrices of the order {K}_0 (hereinafter\n"
                        "blocks are distributed by processes and used to calculate\n"
                        "a part of the total matrix product in each process).\n"
                        "\\PThe block of the matrix {A} is of the size {M}_0~\\x~{P}_0, the block of the matrix {B}\n"
                        "is of the size {P}_0~\\x~{Q}_0, the numbers {M}_0, {P}_0, {Q}_0 are calculated as follows:\n"
                        "{M}_0~=~ceil({M}/{K}_0), {P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), where the operation \\</\\>\n"
                        "means the division of real numbers and the function ceil performs rounding up.\n"
                        "If the matrix contains insufficient number of rows (or columns) to fill\n"
                        "the last blocks then the zero-valued rows (or columns)\n"
                        "should be added to these blocks.\n"
                        "\\PAdd, if necessary, the zero-valued rows or columns to the initial matrices\n"
                        "(as a result, the matrices {A} and {B} will have the size ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0)\n"
                        "and ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0) respectively), save them in one-dimensional arrays\n"
                        "in the master process, and then send the matrix blocks (in a row-major order)\n"
                        "from these arrays to all processes (in ascending order of its ranks):\n"
                        "the process {R} will receive the blocks {A}_{R} and {B}_{R}, {R}~=~0,~\\., {K}~\\-~1.\n"
                        "In addition, create two blocks {C}_{R} and {T}_{R} filled with zero-valued elements\n"
                        "in each process: the block {C}_{R} (of the size {M}_0~\\x~{Q}_0) is intended to store\n"
                        "the part of the matrix product {C}~=~{A}{B}, which will be calculated\n"
                        "in this process, the block {T}_{R} (of the size {M}_0~\\x~{P}_0) is an auxiliary one.\n"
                        "\\PThe blocks, like the initial matrices, should be stored in one-dimensional\n"
                        "arrays in a row-major order. To send the matrix sizes, use the MPI\\_Bcast\n"
                        "collective function, to send the blocks of the matrices {A} and {B},\n"
                        "use the MPI\\_Alltoallw collective function and also the MPI\\_BLOCK\\_A\n"
                        "and MPI\\_BLOCK\\_B datatypes created by the Matr4CreateTypeBlock function\n"
                        "(see the \\3 task and notes to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr4ScatterData function\n"
                        "(without parameters). As a result of the call of this function, each process\n"
                        "will receive the values {M}_0, {P}_0, {Q}_0, as well as one-dimensional arrays filled\n"
                        "with the blocks {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}. Output all obtained data (that is,\n"
                        "the numbers {M}_0, {P}_0, {Q}_0 and the blocks {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}) in each process\n"
                        "after calling the Matr4ScatterData function. Perform the input\n"
                        "of initial data in the Matr4ScatterData function, perform\n"
                        "the output of the results in the Solve function.\n"
                        "\\P\\SNotes.\\s (1) When input the matrices {A} and {B} into arrays in the master process,\n"
                        "it should be taken into account that these arrays may contain elements\n"
                        "corresponding to additional zero-valued columns.\n"
                        "\\P(2) To reduce the number of the MPI\\_Bcast function calls,\n"
                        "all matrix sizes may be sent as a single array.");/*
                        //2020.10

                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "��������������. ��������, ��� ���������� ��������� {K} �������� ������\n"
                        "���������: {K}~=~{K}_0\\*{K}_0. � ������� ���������� ������������ ������ ��������\n"
                        "������� ����������� �� {K} ������, ������� ���������� ������� ������� ������� {K}_0\n"
                        "(� ���������� ����� �������������� �� ��������� � ������������ ��� ����������\n"
                        "� ������ �������� ����� ��������� ���������� ������������).\n"
                        "\\P���� ��� ������� {A} ����� ������ {M}_0~\\x~{P}_0, ���� ��� ������� {B} �����\n"
                        "������ {P}_0~\\x~{Q}_0; ����� {M}_0, {P}_0, {Q}_0 ����������� �� �������� {M}_0~=~ceil({M}/{K}_0),\n"
                        "{P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), ��� �������� \\</\\> �������� ������������\n"
                        "�������, � ������� ceil ��������� ���������� � ��������. ���� ������� ��������\n"
                        "������������ ����� (��� ��������) ��� ���������� ��������� ������, �� �����\n"
                        "����������� �������� �������� (���������).\n"
                        "\\P��������� �������� ������� {A} � {B}, ����������� ��� ������������� ��������\n"
                        "�������� � ��������� �� �������� ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0) � ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0),\n"
                        "� ���������� �������� � ������� ��������, ����� ���� ������������ ���������\n"
                        "������ �� ���� �������� �� ��� ��������, ��������� ����� �� �������\n"
                        "� ��������� �� � �������� � ������� ����������� �� ������ (������� ����� {R}\n"
                        "������� ����� {A}_{R} � {B}_{R}, {R}~=~0,~\\., {K}~\\-~1). ����� ����, ������� � ������\n"
                        "�������� ��� �����, ����������� �������� ����������: ���� {C}_{R} ������� {M}_0~\\x~{Q}_0\n"
                        "��� �������� ��������� ���������� ������������ {C}~=~{A}{B}, ������� �����\n"
                        "����������� � ���� ��������, � ��������������� ���� {T}_{R}\n"
                        "���� �� ������� {M}_0~\\x~{P}_0, ��� � ���� {A}_{R}.\n"
                        "\\P�����, ��� � �������� �������, ������ ��������� �� ������� � ����������\n"
                        "�������� ���������������� �������. ��� ��������� �������� ������ ������������\n"
                        "������������ ������� MPI\\_Bcast, ��� ��������� ������ ������ {A} � {B} ������������\n"
                        "������������ ������� MPI\\_Alltoallw, � ����� ��������������� ���� MPI\\_BLOCK\\_A\n"
                        "� MPI\\_BLOCK\\_B, ��������� � ������� ������� Matr4CreateTypeBlock\n"
                        "(��. ������� \\3, � ����� �������� � ����).\n"
                        "\\P�������� ��� ��������� �������� � ���� ������� Matr4ScatterData\n"
                        "(��� ����������), � ���������� ������ ������� ������ ������� ��������\n"
                        "�������� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������, ���������� ��������\n"
                        "������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R}. ����� ������ ������� Matr4ScatterData �������\n"
                        "� ������ �������� ���������� ������ (����� {M}_0, {P}_0, {Q}_0 � ����� {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}).\n"
                        "���� �������� ������ ������������ � ������� Matr4ScatterData, ����� ������\n"
                        "��������� �� ������� ������� Solve.\n"
                        "\\P\\S��������.\\s (1) ��� ���������� ������ {A} � {B} � ������� �������� �������\n"
                        "���������, ��� ��������������� ��� �� �������� ������� ����� ���������\n"
                        "��������, ��������������� �������������� ������� ��������.\n"
                        "\\P(2) ��� ���������� ����� ������� ������� MPI\\_Bcast ��� ������������ �������\n"
                        "������ ����� ��������� �� ��������������� ������.");
                        */
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
                                "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the blocks {A}_{R}, {B}_{R},\n"
                                "{C}_{R}, {T}_{R} are given in each process (thus, the given data coincide\n"
                                "with the results obtained in the \\1 task). A virtual Cartesian\n"
                                "topology in the form of a square grid of order {K}_0 is used for all processes,\n"
                                "the value of {K}_0\\*{K}_0 is equal to the number of the processes. Each step\n"
                                "of the Fox's block algorithm of matrix multiplication consists of two stages.\n"
                                "\\PIn the first stage of the first step, the block {A}_{R} is sent from the process\n"
                                "with the grid coordinates ({I}_0, {I}_0) to all processes of the same grid row {I}_0\n"
                                "({I}_0~=~0,~\\., {K}_0~\\-~1). The received block is saved in the block {T}_{R}\n"
                                "in the receiving processes. Then the block {T}_{R} is multiplied by the block {B}_{R}\n"
                                "from the same process and the result is added to the block {C}_{R}.\n"
                                "\\PImplement the first stage of the first step of the Fox's algorithm.\n"
                                "To do this, create the MPI\\_COMM\\_GRID and MPI\\_COMM\\_ROW communicators\n"
                                "using the Matr4CreateCommGrid and Matr4CreateCommRow functions implemented\n"
                                "in the \\3 task. Use the MPI\\_Bcast function for the MPI\\_COMM\\_ROW\n"
                                "communicator to send the blocks {A}_{R} (compare with \\3).\n"
                                "\\PInclude all the above mentioned actions in a Matr4Calc1 function (without\n"
                                "parameters). Output the new contents of the blocks {T}_{R} and {C}_{R} in each process;\n"
                                "perform data input and output in the Solve function.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                                "���������� �������� ������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R} (����� �������, �������� ������\n"
                                "��������� � ������������, ����������� � ������� \\1). ������ ���\n"
                                "�������� ��������� ����� ������������ ������ ������� �� ���� ������.\n"
                                "\\P�� ������ ����� ������� ���� ��� ������ ������ {I}_0 ���������� �������\n"
                                "��������� ������� {K}_0 ({I}_0~=~0,~\\., {K}_0~\\-~1, ��� {K}_0\\*{K}_0 ����� ����������\n"
                                "���������) ����������� ��������� ����� {A}_{R} �� ��������, ��������������\n"
                                "� ������ {I}_0 � ������� � ��� �� ������� {I}_0, �� ��� �������� ���� �� ������\n"
                                "(� ����������� ������������ ����� � ����� {T}_{R}), ����� ���� ����������\n"
                                "� ���������� ���� ��������� ���� {T}_{R} ���������� �� ���� {B}_{R} �� ����� ��������,\n"
                                "� ��������� ����������� � ����� {C}_{R}.\n"
                                "\\P����������� ������ ���� ������� ���� ��������� �����. ��� ��������� ������ {A}_{R}\n"
                                "������������ ������� MPI\\_Bcast ��� ������������� MPI\\_COMM\\_ROW, ������ ����\n"
                                "������������ � ������� ������� Matr4CreateCommRow (��. ������� \\3,\n"
                                "� ������� ����������� ����������� ��������� ������).\n"
                                "\\P�������� ��� ��������� �������� � ���� ������� Matr4Calc1 (��� ����������).\n"
                                "������� ����� ���������� ������ {T}_{R} � {C}_{R} � ������ �������� (���� � ����� ������\n"
                                "��������� �� ������� ������� Solve).");
                                */
                else if (cnt == 2)
                        TaskText(
                                "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the blocks {A}_{R}, {B}_{R},\n"
                                "{C}_{R}, {T}_{R} are given in each process (thus, the given data coincide\n"
                                "with the results obtained in the \\3 task).\n"
                                "\\PModify the Matr4Calc1 function, which was implemented in the \\2 task;\n"
                                "the modified function should provide execution of the first stage of any step\n"
                                "of the Fox's algorithm. To do this, add the parameter named step\n"
                                "to the function (this parameter specifies the step number and may be\n"
                                "in the range 0 to {K}_0~\\-~1, where {K}_0 is the order of the Cartesian grid\n"
                                "of processes) and use the value of this parameter in the part of the algorithm\n"
                                "that deals with the sending the blocks {A}_{R}: the block {A}_{R} should be sent\n"
                                "from the process with the grid coordinates ({I}_0, ({I}_0~+~step)%{K}_0)\n"
                                "to all processes of the same grid row {I}_0, {I}_0~=~0,~\\., {K}_0~\\-~1\n"
                                "(the recalculation of the elements of the block {C}_{R}\n"
                                "does not depend on the value of the parameter step).\n"
                                "\\PUsing successively the calls of Matr4Calc1(0), Matr4Calc2(), Matr4Calc1(1)\n"
                                "(the Matr4Calc2 function provides the second stage of each step\n"
                                "of the algorithm~\\= see the \\1 task), execute two initial steps\n"
                                "of the Fox's algorithm and output the new contents of the blocks {T}_{R}, {B}_{R},\n"
                                "and {C}_{R} in each process. Perform data input and output in the Solve function.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                                "���������� �������� ������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R} (����� �������, �������� ������\n"
                                "��������� � ������������, ����������� � ������� \\3).\n"
                                "\\P�������������� ������� Matr4Calc1, ������������� � ������� \\2,\n"
                                "����� �������, ����� ��� ������������ ���������� ������� ����� �� ����� ����\n"
                                "��������� �����. ��� ����� �������� � ��� �������� step, ������������\n"
                                "����� ���� (���������� �� 0 �� {K}_0~\\-~1, ��� {K}_0~\\= ������� ���������� �������\n"
                                "���������), � ������ �������� ����� ���� ��� �������� ������ {A}_{R}: �� ���� step\n"
                                "��� ������ ������ {I}_0 ���������� ������� ������ ����������� �������� ����� {A}_{R}\n"
                                "�� ��������, �������������� � ������� � ������� ({I}_0~+~step)%{K}_0 (��������,\n"
                                "��������� � ���������� ������ {C}_{R}, �� ������ ���� �� �������).\n"
                                "\\P��������� ��� ��������� ���� ��������� �����, ��������������� ������ �������\n"
                                "Matr4Calc1(0), Matr4Calc2() (�������������� ������ ���� ���� ���������~\\=\n"
                                "��. \\1) � Matr4Calc1(1), � ������� � ������ �������� ����� ����������\n"
                                "������ {T}_{R}, {B}_{R} � {C}_{R} (���� � ����� ������ ��������� �� ������� ������� Solve).");
                                */
                else
        {
                        TaskText(
                                "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the blocks {A}_{R}, {B}_{R},\n"
                                "{C}_{R}, {T}_{R} are given in each process (thus, the given data coincide\n"
                                "with the results obtained in the \\4 task). In addition,\n"
                                "a number {L} with the same value is given in each process.\n"
                                "The value of {L} is in the range 3 to {K}_0 and determines\n"
                                "the number of steps of the Fox's algorithm.\n"
                                "\\PUsing successively the calls of Matr4Calc1(0), Matr4Calc2(), Matr4Calc1(1),\n"
                                "Matr4Calc2(),~\\., Matr4Calc1({L}~\\-~1) (see the \\1 and \\2\n"
                                "tasks), execute the initial {L} steps of the Fox's algorithm and output\n"
                                "the new contents of the blocks {T}_{R}, {B}_{R}, and {C}_{R} in each process.\n"
                                "Perform data input and output in the Solve function.\n"
                                "\\P\\SRemark.\\s If the value of {L} is equal to {K}_0 then the blocks {C}_{R} will contain\n"
                                "the corresponding parts of the final matrix product {A}{B}. Note that the second\n"
                                "stage (associated with the call of the Matr4Calc2 function)\n"
                                "is not necessary at the last step of the algorithm.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                                "���������� �������� ������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R} (����� �������, �������� ������\n"
                                "��������� � ������������, ����������� � ������� \\4). ����� ����,\n"
                                "� ������ �������� ���� ���� � �� �� ����� {L}, ������� � ��������� �� 3 �� {K}_0\n"
                                "� ������������ ��������� ����� ����� ��������� �����.\n"
                                "\\P��������� {L} ��������� ����� ��������� �����, ������ �������, �������������\n"
                                "� �������� \\1 � \\2, � ��������� ������������������:\n"
                                "Matr4Calc1(0), Matr4Calc2(), Matr4Calc1(1), Matr4Calc2(),~\\.,\n"
                                "Matr4Calc1({L}~\\-~1). ������� � ������ �������� ����� ���������� ������ {T}_{R},\n"
                                "{B}_{R} � {C}_{R} (���� � ����� ������ ��������� �� ������� ������� Solve).\n"
                                "\\P\\S����������.\\s ���� �������� {L} ����� {K}_0, �� ����� {C}_{R} ����� ���������\n"
                                "��������������� ��������� ���������� ������������ {A}{B}. �������� �������� �� ��,\n"
                                "��� ������ ���� (��������� � ������� ������� Matr4Calc2) �� ��������� ����\n"
                                "��������� ��������� �� ���������.");
                                */
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
                        "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled\n"
                        "with the blocks {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R} are given in each process (thus,\n"
                        "the given data coincide with the results obtained in the \\2 task).\n"
                        "\\PImplement the second stage of the first step of the Fox's algorithm of matrix\n"
                        "multiplication as follows: perform a cyclic shift of the blocks {B}_{R} given\n"
                        "in all processes of each column of the Cartesian periodic grid\n"
                        "by 1 position up (that is, in descending order of ranks of processes).\n"
                        "\\PTo do this, create the MPI\\_COMM\\_GRID and MPI\\_COMM\\_COL communicators using\n"
                        "the Matr4CreateCommGrid and Matr4CreateCommCol functions implemented\n"
                        "in the \\3 task, then use the MPI\\_Sendrecv\\_replace function\n"
                        "for the MPI\\_COMM\\_COL communicator to perform the cyclic shift\n"
                        "of the blocks {B}_{R} (compare with \\3).\n"
                        "\\PInclude all the above mentioned actions in a Matr4Calc2 function (without\n"
                        "parameters). Output the received blocks {B}_{R} in each process;\n"
                        "perform data input and output in the Solve function.");/*
                        //2020.10

                TaskText(
                        "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                        "���������� �������� ������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R} (����� �������, �������� ������\n"
                        "��������� � ������������, ����������� � ������� \\2).\n"
                        "\\P����������� ������ ���� ������� ���� ��������� �����, ������� �������\n"
                        "� ����������� ������ ������ {B}_{R} ��� ������� ������� ���������� �������\n"
                        "�� 1 ������� ����� (�.\\,�. � ����������� �������� ������ ���������).\n"
                        "\\P��� ����������� ��������� ������ {B}_{R} ������������ ������� MPI\\_Sendrecv\\_replace\n"
                        "��� ������������� MPI\\_COMM\\_COL, ������ ���� ������������ � ������� �������\n"
                        "Matr4CreateCommCol (��. ������� \\3, � ������� �����������\n"
                        "����������� ��������� ������).\n"
                        "\\P�������� ��� �������� � ���� ������� Matr4Calc2 (��� ����������).\n"
                        "������� ����� ���������� ����� {B}_{R} � ������ ��������\n"
                        "(���� � ����� ������ ��������� �� ������� ������� Solve).");
                        */

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
                        "Integers {M} and {Q} (the numbers of rows and columns of the matrix product)\n"
                        "are given in the master process. In addition, integers {M}_0, {Q}_0\n"
                        "and one-dimensional arrays filled with the {M}_0~\\x~{Q}_0 blocks of the matrix {C}\n"
                        "are given in each process (the given blocks of {C} are obtained as a result\n"
                        "of {K}_0 steps of the Fox's algorithm~\\= see the \\1 task).\n"
                        "\\PSend all the blocks {C}_{R} to the master process and output the received matrix {C}\n"
                        "of the size {M}~\\x~{Q} in this process. To store the resulting matrix {C}\n"
                        "in the master process, use a one-dimensional array sufficient to store\n"
                        "the matrix of the size ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0). To send the blocks {C}_{R} to this array,\n"
                        "use the MPI\\_Alltoallw collective function and the MPI\\_BLOCK\\_C datatype created\n"
                        "by the Matr4CreateTypeBlock function (see the \\8 task\n"
                        "and notes to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr4GatherData function\n"
                        "(without parameters). Perform the input of initial data in the Solve function,\n"
                        "perform the output of the resulting matrix in the Matr4GatherData function.\n"
                        "\\P\\SNote.\\s When output the matrix {C} in the master process, it should be taken\n"
                        "into account that an array, which is intended for matrix storage, may contain\n"
                        "elements corresponding to additional zero-valued columns.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M} � {Q}~\\= ����� ����� � �������� ���������������\n"
                        "���������� ������������. ����� ����, � ������ �������� ���� ����� {M}_0, {Q}_0,\n"
                        "� ����� ���������� �������, ����������� ������� ������� {C} (������� {M}_0~\\x~{Q}_0),\n"
                        "������� ���� �������� � ���������� ���������� {K}_0 ����� ��������\n"
                        "��������� ����� ������������ ������ (��. \\1).\n"
                        "\\P��������� ��� ����� {C}_{R} � ������� ������� � ������� � ��� ���������� ������� {C}\n"
                        "(������� {M}~\\x~{Q}). ��� �������� �������������� ������� {C} � ������� ��������\n"
                        "������������ ���������� ������, ����������� ��� �������� �������\n"
                        "������� ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0). ��� ��������� ������ {C}_{R} ������������ ������������\n"
                        "������� MPI\\_Alltoallw, � ����� ��������������� ��� MPI\\_BLOCK\\_C, ���������\n"
                        "� ������� ������� Matr4CreateTypeBlock (��. ������� \\8,\n"
                        "� ����� �������� � ����).\n"
                        "\\P�������� ��� �������� � ���� ������� Matr4GatherData (��� ����������).\n"
                        "���� ������ ��������� �� ������� ������� Solve, ����� ���������� �������\n"
                        "�������� � ������� Matr4GatherData.\n"
                        "\\P\\S��������.\\s ��� ������ ������� {C} � ������� �������� ������� ���������,\n"
                        "��� ��������������� ��� �� �������� ������ ����� ��������� ��������,\n"
                        "��������������� �������������� ������� ��������.");
                        */
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process (thus, the given data\n"
                        "coincide with the given data in the \\6 task).\n"
                        "\\PUsing successively the Matr4ScatterData, Matr4Calc1, Matr4Calc2,\n"
                        "and Matr4GatherData functions, that are developed\n"
                        "in the \\6\\-\\1 tasks, find a matrix {C}, which is equal\n"
                        "to the product of the initial matrices {A} and {B}, and output this matrix\n"
                        "in the master process. The Matr4Calc1 and Matr4Calc2 functions should\n"
                        "be called in a loop, the number of Matr4Calc2 function calls must be one less\n"
                        "than the number of Matr4Calc1 function calls.\n"
                        "\\PIn addition, output the current contents of the block {C}_{R} in each process\n"
                        "after each call of the Matr4Calc1 function.\n"
                        "\\PThe MPI\\_COMM\\_GRID, MPI\\_COMM\\_ROW, and MPI\\_COMM\\_COL communicators that are used\n"
                        "in the Matr4Calc1 and Matr4Calc2 functions, should not be created\n"
                        "several times. To do this, modify the Matr4CreateCommGrid, Matr4CreateCommRow,\n"
                        "and Matr4CreateCommCol functions (see the \\8 and \\7 tasks);\n"
                        "the modified functions should not perform any actions when it is called\n"
                        "with the parameter comm that is not equal to MPI\\_COMM\\_NULL.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "�������������� (����� �������, �������� ������ ��������� � ��������� �������\n"
                        "��� ������� \\6).\n"
                        "\\P��������������� ������� ������������� � �������� \\6\\-\\1\n"
                        "������� Matr4ScatterData, Matr4Calc1, Matr4Calc2 � Matr4GatherData, ��������\n"
                        "� ������� � ������� �������� ������� {C}, ������ ������������ ��������\n"
                        "������ {A} � {B}. ������� Matr4Calc1 � Matr4Calc2 ������ ���������� � �����,\n"
                        "������ ���������� ������� ������� Matr4Calc2 ������ ���� �� 1 ������\n"
                        "���������� ������� ������� Matr4Calc1.\n"
                        "\\P����� ������� ������ ������� Matr4Calc1 ������������� �������� � ������\n"
                        "�������� ������� ���������� ����� {C}_{R}.\n"
                        "\\P��� ���� ����� ��������������� ������������� MPI\\_COMM\\_GRID, MPI\\_COMM\\_ROW\n"
                        "� MPI\\_COMM\\_COL, ������������ � �������� Matr4Calc1 � Matr4Calc2,\n"
                        "�� ����������� ��������� ���, �������������� ������� Matr4CreateCommGrid,\n"
                        "Matr4CreateCommRow, Matr4CreateCommCol (��. \\8 � \\7)\n"
                        "����� �������, ����� ��� �� ������ ��� ��� ������������� �������������\n"
                        "(�� ������� MPI\\_COMM\\_NULL) ��� �� ��������� ������� ��������.");
                        */

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
                        "Integers {M}, {P}, {Q} and two file names are given in the master process.\n"
                        "The given files contain elements of a matrix {A} of the size {M}~\\x~{P} and\n"
                        "a matrix {B} of the size {P}~\\x~{Q}. The numbers {M}, {P}, and {Q} are multiples\n"
                        "of the order {K}_0 of square grid of processes.\n"
                        "\\PModify the stage of receiving blocks for the Fox's algorithm of matrix\n"
                        "multiplication (see the \\7 task) as follows: each process\n"
                        "should read the corresponding blocks of the matrices {A} and {B}\n"
                        "directly from the given files.\n"
                        "\\PTo send the sizes of matrices and file names, use the MPI\\_Bcast collective\n"
                        "function. To read the blocks from the files, set the appropriate file views\n"
                        "using the MPI\\_File\\_set\\_view function and the MPI\\_BLOCK\\_A and MPI\\_BLOCK\\_B file\n"
                        "types defined with the Matr4CreateTypeBlock function (see the \\10\n"
                        "task), and then use the MPI\\_File\\_read\\_all function.\n"
                        "\\PInclude all these actions in a Matr4ScatterFile function (without parameters).\n"
                        "As a result of the call of this function, each process will receive\n"
                        "the values {M}_0, {P}_0, {Q}_0, as well as one-dimensional arrays filled\n"
                        "with the blocks {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R} (the blocks {C}_{R} and {T}_{R} should contain\n"
                        "zero-valued elements). Output all obtained data (that is, the numbers {M}_0,\n"
                        "{P}_0, {Q}_0 and the blocks {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}) in each process after calling\n"
                        "the Matr4ScatterFile function. Perform the input of initial data\n"
                        "in the Matr4ScatterFile function, perform the output\n"
                        "of the results in the Solve function.\n"
                        "\\P\\SRemark.\\s A condition that the numbers {M}, {P}, {Q} are multiples of {K}_0 means\n"
                        "that you do not need to add zero-valued rows and/or zero-valued columns\n"
                        "to the blocks obtained from the matrices {A} and {B}, and therefore you may\n"
                        "perform reading of the blocks {A}_{R} and {B}_{R} using the same file types\n"
                        "(namely, MPI\\_BLOCK\\_A and MPI\\_BLOCK\\_B) in all processes.\n"
                        "\\PIf this condition is not fulfilled then it would be necessary to use special\n"
                        "types that ensure the correct reading from the file and write to the array\n"
                        "of \\<truncated\\> blocks of the matrices {A} and {B} in some processes (in addition,\n"
                        "in this case it would be necessary to send to each process the values of {P}\n"
                        "and {Q} that are necessary for the correct type definition\n"
                        "for \\<truncated\\> blocks).");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������, ����������\n"
                        "�������� ������ {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������. �������������\n"
                        "��������, ��� ����� {M}, {P} � {Q} ������ ������� {K}_0 ���������� ������� ���������.\n"
                        "\\P�������������� ���� ������������ ������ ��� �������� ��������� �����\n"
                        "������������ ������ (��. \\7) ����� �������, ����� ������ �������\n"
                        "�������� ��������������� ����� ������ {A} � {B} ���������������\n"
                        "�� �������� ������.\n"
                        "\\P��� ��������� �������� ������ � ���� ������ ������������ ������������ �������\n"
                        "MPI\\_Bcast. ��� ���������� ������ ������ ��������������� ��� ������, ���������\n"
                        "������� MPI\\_File\\_set\\_view � ���� MPI\\_BLOCK\\_A � MPI\\_BLOCK\\_B, ������������\n"
                        "� ������� ������� Matr4CreateTypeBlock (��. \\10) ����� ����\n"
                        "������������ ������������ ������� MPI\\_File\\_read\\_all.\n"
                        "\\P�������� ��� �������� � ���� ������� Matr4ScatterFile (��� ����������),\n"
                        "� ���������� ������ ������� ������ ������� �������� �������� {M}_0, {P}_0, {Q}_0,\n"
                        "���������� �������, ���������� �������� ������ {A}_{R}, {B}_{R}, {C}_{R} � {T}_{R} (����� {C}_{R} � {T}_{R}\n"
                        "������ ���� ��������). ����� ������ ������� Matr4ScatterFile ������� � ������\n"
                        "�������� ���������� ������ (����� {M}_0, {P}_0, {Q}_0 � ����� {A}_{R}, {B}_{R}, {C}_{R}, {T}_{R}).\n"
                        "���� �������� ������ ������������ � ������� Matr4ScatterFile,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S����������.\\s �������������� ������� � ��������� ����� {M}, {P}, {Q} ����� {K}_0\n"
                        "��������, ��� �����, ���������� �� ������ {A} � {B}, �� ��������� ���������\n"
                        "�������� �������� �/��� ���������, � ������� ��� ������ �� ������ ������\n"
                        "������ {A} � {B} � ����� �������� ����� ������������ ���������� ��������\n"
                        "���� MPI\\_BLOCK\\_A � MPI\\_BLOCK\\_B.\n"
                        "\\P��� ���������� ����� ������� ������������� �� ��������� ����������� ����,\n"
                        "�������������� ���������� ���������� �� ����� � ������ � ������ \\<�����������\\>\n"
                        "������ ������ {A} � {B} (����� ����, � ���� ������ ������������� �� ���������\n"
                        "������� �������� �������� {P} � {Q}, ����������� ��� �����������\n"
                        "����������� ����� ��� \\<�����������\\> ������).");
                        */

        n = (int)round(sqrt(n));

        MakeDim3();
        m = n * k1; // ��� ��������� �������!
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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y++);
//      DataComment("���������� ����� (������� B): ", 1, y++);
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
                        "Integers {M}_0, {Q}_0 and one-dimensional arrays filled with the {M}_0~\\x~{Q}_0 blocks {C}_{R}\n"
                        "are given in each process (the given blocks {C}_{R} are obtained as a result\n"
                        "of {K}_0 steps of the Fox's block algorithm of matrix multiplication~\\=\n"
                        "see the \\4 task). In addition, the name of file to store the matrix\n"
                        "product is given in the master process. The numbers {M} and {Q} (the numbers\n"
                        "of rows and columns of the matrix product) are multiples of the order {K}_0\n"
                        "of square grid of processes (thus, {M}~=~{M}_0\\*{K}_0, {Q}~=~{Q}_0\\*{K}_0).\n"
                        "\\PSend the file name to all processes using the MPI\\_Bcast function.\n"
                        "Write all the parts of the matrix product contained in the blocks {C}_{R}\n"
                        "to the resulting file, which will eventually contain\n"
                        "a matrix {C} of the size {M}~\\x~{Q}.\n"
                        "\\PTo write the blocks to the files, set the appropriate file view using\n"
                        "the MPI\\_File\\_set\\_view function and the MPI\\_BLOCK\\_C file type defined\n"
                        "with the Matr4CreateTypeBlock function (see the \\11 task),\n"
                        "and then use the MPI\\_File\\_write\\_all collective function.\n"
                        "\\PInclude all these actions (namely, the input of file name, sending\n"
                        "the file name, and writing all blocks to the file) in a Matr4GatherFile\n"
                        "function. Perform the input of all initial data,\n"
                        "except the file name, in the Solve function.\n"
                        "\\P\\SRemark.\\s A condition that the numbers {M} and {Q} are multiples of {K}_0 means\n"
                        "that the blocks {C}_{R} do not contain \\<extra\\> zero-valued rows and/or columns,\n"
                        "and therefore you may perform writing of the blocks {C}_{R} to the file\n"
                        "using the same file type (namely, MPI\\_BLOCK\\_C) in all processes.");/*

                TaskText(
                        "� ������ �������� ���� ����� {M}_0, {Q}_0, � ����� ���������� �������, �����������\n"
                        "������� {C}_{R} (������� {M}_0~\\x~{Q}_0), ����������� � ���������� ���������� {K}_0 �����\n"
                        "�������� ��������� ����� ������������ ������ (��. \\4). ����� ����,\n"
                        "� ������� �������� ���� ��� ����� ��� �������� ��������������� ����������\n"
                        "������������. ������������� ��������, ��� ����� ����� {M} � ����� �������� {Q}\n"
                        "���������� ������������ ������ ������� {K}_0 ���������� ������� ���������\n"
                        "(����� �������, {M}~=~{M}_0\\*{K}_0, {Q}~=~{Q}_0\\*{K}_0).\n"
                        "\\P��������� ��� ����� �� ��� �������� (��������� ������� MPI\\_Bcast)\n"
                        "� �������� ��� ��������� ���������� ������������, ������������ � ������ {C}_{R},\n"
                        "� �������������� ����, ������� � ����� ����� ���������\n"
                        "������� {C} ������� {M}~\\x~{Q}.\n"
                        "\\P��� ������ ������ ������ ��������������� ��� ������, ��������� �������\n"
                        "MPI\\_File\\_set\\_view � �������� ��� MPI\\_BLOCK\\_C, ������������ � ������� �������\n"
                        "Matr4CreateTypeBlock (��. \\11), ����� ���� ������������\n"
                        "������������ ������� MPI\\_File\\_write\\_all.\n"
                        "\\P�������� ���������� ����� �����, ��� ���������, � ����� ��� �������� �� ������\n"
                        "������ � ���� � ���� ������� Matr4GatherFile (���������� ���� �������� ������,\n"
                        "����� ����� �����, ������ �������������� �� ������� ������� Solve).\n"
                        "\\P\\S����������.\\s �������������� ������� � ��������� ����� {M} � {Q} ����� {K}_0 ��������,\n"
                        "��� ����� {C}_{R} �� �������� \\<������\\> ������� ����� �/��� ��������, � �������\n"
                        "��� �� ������ � ���� �� ����� ��������� ����� ������������\n"
                        "���������� �������� ���� MPI\\_BLOCK\\_C.");
                        */
                n = (int)round(sqrt(n));

        MakeDim3();

        m = n * k1; // ��� ��������� �������!
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
                                DataComment("Name of file", 1, y3++);
                                DataComment("  for matrix C: ", 1, y3++);
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
        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M}, {P}, {Q} and three file names are given in the master process.\n"
                        "The first two file names are related to the existing files containing\n"
                        "the elements of matrices {A} and {B} of the size {M}~\\x~{P} and {P}~\\x~{Q}, respectively,\n"
                        "the third file should be created to store the resulting matrix product {C}~=~{A}{B}.\n"
                        "The numbers {M}, {P}, and {Q} are multiples of the order {K}_0\n"
                        "of square grid of processes.\n"
                        "\\PUsing successively the Matr4ScatterFile, Matr4Calc1, Matr3Calc2,\n"
                        "and Matr4GatherFile functions (see the \\2, \\6, \\7,\n"
                        "and \\1 tasks), find a matrix {C} and write its elements\n"
                        "to the resulting file. The Matr4Calc1 and Matr4Calc2 functions\n"
                        "should be called in a loop, the number of Matr4Calc2 function calls\n"
                        "must be one less than the number of Matr4Calc1 function calls.\n"
                        "\\PIn addition, output the current value of the c[step] in each process\n"
                        "after each call of the Matr4Calc1 function, where c is a one-dimensional array\n"
                        "containing the block {C}_{R}, and step is the algorithm step number (0, 1,~\\.,\n"
                        "{K}_0~\\-~1). Thus, the element c[0] should be output on the first step\n"
                        "of the algorithm, the element c[1] should be output\n"
                        "on the second step of the algorithm, and~so~on.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������: �������\n"
                        "������ ����� ���� ������������ ������, ���������� �������� ������ {A} � {B}\n"
                        "������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������, � ����� ��� ����� ��� ��������\n"
                        "��������������� ���������� ������������ {C}~=~{A}{B}. ������������� ��������,\n"
                        "��� ����� {M}, {P} � {Q} ������ ������� {K}_0 ���������� ������� ���������.\n"
                        "\\P��������������� ������� ������������� � �������� \\2, \\6,\n"
                        "\\7 � \\1 ������� Matr4ScatterFile, Matr4Calc1, Matr4Calc2\n"
                        "� Matr4GatherFile, �������� � �������������� ����� ������������ ��������\n"
                        "������ {A} � {B}, ��������� � ������� �������� ��������� �����. �������\n"
                        "Matr4Calc1 � Matr4Calc2 ������ ���������� � �����, ������ ���������� �������\n"
                        "������� Matr4Calc2 ������ ���� �� 1 ������ ����������\n"
                        "������� ������� Matr4Calc1.\n"
                        "\\P����� ������� ������ ������� Matr4Calc1 ������������� �������� � ������\n"
                        "�������� ������� �������� �������� c[step], ��� c~\\= ���������� ������,\n"
                        "���������� ���� {C}_{R}, � step~\\= ����� ���� ��������� (0, 1,~\\., {K}_0~\\-~1);\n"
                        "����� �������, �� ������ ���� ��������� ������� ������� ������� c[0],\n"
                        "�� ������ ����~\\= ������� c[1], �~�.\\,�.");
                        */

        n = (int)round(sqrt(n));

        MakeDim3();

        m = n * k1; // ��� ��������� �������!
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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y);
//      DataComment("���������� ����� (������� B): ", 1, y++);
        DataS("Name of file for matrix C: ", sc.c_str(), xRight, y++);
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
        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M} and {P} are given in each process; in addition, a matrix {A}\n"
                        "of the size {M}~\\x~{P} is given in the master process. The number of processes {K}\n"
                        "is a perfect square: {K}~=~{K}_0\\*{K}_0, the numbers {M} and {P} are multiples of {K}_0.\n"
                        "Input the matrix {A} into a one-dimensional array of the size {M}\\*{P} in the master\n"
                        "process and define a new datatype named MPI\\_BLOCK\\_A that contains\n"
                        "a {M}_0~\\x~{P}_0 block of the matrix {A}, where {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\PWhen defining the MPI\\_BLOCK\\_A type, use the MPI\\_Type\\_vector\n"
                        "and MPI\\_Type\\_commit functions. Include this definition\n"
                        "in a Matr3CreateTypeBlock(m0, p0, p, t) function with the input integer\n"
                        "parameters m0, p0, p and the output parameter t of the MPI\\_Datatype type;\n"
                        "the parameters m0 and p0 determine the size of the block, and the parameter p\n"
                        "determines the number of columns of the matrix\n"
                        "from which this block is extracted.\n"
                        "\\PUsing the MPI\\_BLOCK\\_A datatype, send to each process (in ascending order\n"
                        "of ranks of processes, including the master process) the corresponding\n"
                        "block of the matrix {A} in a row-major order of blocks (that is, the first block\n"
                        "should be sent to the process 0, the next block in the same row of blocks\n"
                        "should be sent to the process 1, and~so~on). Sending should be performed\n"
                        "using the MPI\\_Send and MPI\\_Recv functions; the blocks should\n"
                        "be stored in one-dimensional arrays of the size {M}_0\\*{P}_0.\n"
                        "Output the received block in each process.\n"
                        "\\P\\SRemark.\\s In the MPICH2 version 1.3, the MPI\\_Send function call is erroneous\n"
                        "if the sending and receiving processes are the same. You may use\n"
                        "the MPI\\_Sendrecv function to send a block to the master process. You may also\n"
                        "fill a block in the master process without using tools of the MPI library.");/*


                TaskText(
                        "� ������ �������� ���� ����� {M} � {P}; ����� ����, � ������� ��������\n"
                        "���� ������� {A} ������� {M}~\\x~{P}. ��������, ��� ���������� ��������� {K}\n"
                        "�������� ������ ���������: {K}~=~{K}_0\\*{K}_0, � ����� {M} � {P} ������ ����� {K}_0.\n"
                        "�������� � ������� �������� ������� {A} � ���������� ������ ������� {M}\\*{P}\n"
                        "� ���������� ����� ��� MPI\\_BLOCK\\_A, ���������� ���� ������� {A}\n"
                        "������� {M}_0~\\x~{P}_0, ��� {M}_0~=~{M}/{K}_0, {P}_0~=~{P}/{K}_0.\n"
                        "\\P��� ����������� ���� MPI\\_BLOCK\\_A ������������ ������� MPI\\_Type\\_vector\n"
                        "� MPI\\_Type\\_commit, ������� ��� ����������� � ���� �������\n"
                        "Matr3CreateTypeBlock(m0, p0, p, t), ��� ������������� ��������� m0, p0, p\n"
                        "�������� ��������, � �������� t ���� MPI\\_Datatype �������� ��������;\n"
                        "��� ���� ��������� m0 � p0 ���������� ������� �����, � �������� p~\\= �����\n"
                        "�������� �������, �� ������� ����������� ���� ����.\n"
                        "\\P��������� ��� MPI\\_BLOCK\\_A, ��������� � ������ ������� (������� �������)\n"
                        "��������������� ���� ������� {A}, ��������� ����� �� ������� � ��������� ��\n"
                        "� �������� � ������� ����������� �� ������ (������ ���� ������������\n"
                        "� ������� 0, ��������� �� ��� ���� � ���� �� ������ ������������ � ������� 1,\n"
                        "�~�.\\,�.). ��������� ��������� � ������� ������� MPI\\_Send � MPI\\_Recv;\n"
                        "����� ������� � ���������� �������� ������� {M}_0\\*{P}_0.\n"
                        "������� � ������ �������� ���������� ����.\n"
                        "\\P\\S����������.\\s � ���������� MPICH2 ������ 1.3 � ������� ������� MPI\\_Send ������\n"
                        "��������� ��������� ������ � ��� �� �������, �� �������� ������ ����������\n"
                        "(���������� ��������� ���������). ��� ��������� ����� � ������� ������� �����\n"
                        "������������ ������� MPI\\_Sendrecv; ����� ����� ��������� ��������������� ����\n"
                        "� ������� ��������, �� �������� � ��������� ���������� MPI.");
                        */
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
                        "Integers {M}_0, {P}_0 and a matrix {A} of the size {M}_0~\\x~{P}_0 are given in each process.\n"
                        "The number of processes {K} is a perfect square: {K}~=~{K}_0\\*{K}_0. Input the matrix {A}\n"
                        "into a one-dimensional array of the size {M}_0\\*{P}_0 in each process and create\n"
                        "a new communicator named MPI\\_COMM\\_GRID using the MPI\\_Cart\\_create function.\n"
                        "The MPI\\_COMM\\_GRID communicator defines a Cartesian topology for all processes\n"
                        "as a two-dimensional periodic {K}_0~\\x~{K}_0 grid (ranks of processes\n"
                        "should not be reordered).\n"
                        "\\PInclude the creation of the MPI\\_COMM\\_GRID communicator\n"
                        "in a Matr3CreateCommGrid(comm) function with the output parameter comm\n"
                        "of the MPI\\_Comm type. Using the MPI\\_Cart\\_coords function\n"
                        "for this communicator, output the process coordinates ({I}_0, {J}_0)\n"
                        "in each process.\n"
                        "\\PPerform a cyclic shift of the matrices {A} given in all processes\n"
                        "of each grid row {I}_0 by {I}_0 positions left (that is, in descending order\n"
                        "of ranks of processes) using the MPI\\_Cart\\_shift and MPI\\_Sendrecv\\_replace\n"
                        "functions. Output the received matrix in each process.");/*


                TaskText(
                        "� ������ �������� ���� ����� {M}_0 � {P}_0, � ����� ������� {A} ������� {M}_0~\\x~{P}_0.\n"
                        "��������, ��� ���������� ��������� {K} �������� ������ ���������: {K}~=~{K}_0\\*{K}_0.\n"
                        "�������� � ������ �������� ������� {A} � ���������� ������ ������� {M}_0\\*{P}_0\n"
                        "� ���������� �� ��������� �������� ��������� ������������ MPI\\_COMM\\_GRID,\n"
                        "�������� ��������� ��������� ��������� ���������� ����������� �������\n"
                        "������� {K}_0 (�������� ������� ��������� ��������� �����������).\n"
                        "\\P��� ����������� ������������� MPI\\_COMM\\_GRID ������������ �������\n"
                        "MPI\\_Cart\\_create, ������� ��� ����������� � ���� �������\n"
                        "Matr3CreateCommGrid(comm) � �������� ���������� comm ���� MPI\\_Comm. �������\n"
                        "� ������ �������� ���������� ({I}_0, {J}_0) ����� �������� � ��������� ���������,\n"
                        "��������� ������� MPI\\_Cart\\_coords.\n"
                        "\\P��� ������ ������ {I}_0 ���������� ������� ����������� ����������� �����\n"
                        "������ {A} �� {I}_0 ������� ����� (�.\\,�. � ����������� �������� ������ ���������),\n"
                        "��������� ������� MPI\\_Cart\\_shift � MPI\\_Sendrecv\\_replace. ������� � ������\n"
                        "�������� �������, ���������� � ���������� ������.");
                        */
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process. The number of processes {K}\n"
                        "is a perfect square: {K}~=~{K}_0\\*{K}_0. In the block algorithms\n"
                        "of matrix multiplication, the initial matrices are divided into {K} blocks\n"
                        "and are interpreted as square block matrices of the order {K}_0 (hereinafter\n"
                        "blocks are distributed by processes and used to calculate\n"
                        "a part of the total matrix product in each process).\n"
                        "\\PThe block of the matrix {A} is of the size {M}_0~\\x~{P}_0, the block of the matrix {B}\n"
                        "is of the size {P}_0~\\x~{Q}_0, the numbers {M}_0, {P}_0, {Q}_0 are calculated as follows:\n"
                        "{M}_0~=~ceil({M}/{K}_0), {P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), where the operation \\</\\>\n"
                        "means the division of real numbers and the function ceil performs rounding up.\n"
                        "If the matrix contains insufficient number of rows (or columns) to fill\n"
                        "the last blocks then the zero-valued rows (or columns)\n"
                        "should be added to these blocks.\n"
                        "\\PAdd, if necessary, the zero-valued rows or columns to the initial matrices\n"
                        "(as a result, the matrices {A} and {B} will have the size ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0)\n"
                        "and ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0) respectively), save them in one-dimensional arrays\n"
                        "in the master process, and then send the matrix blocks (in a row-major order)\n"
                        "from these arrays to all processes (in ascending order of its ranks):\n"
                        "the process {R} will receive the blocks {A}_{R} and {B}_{R}, {R}~=~0,~\\., {K}~\\-~1.\n"
                        "In addition, create a block {C}_{R} in each process to store the part of the matrix\n"
                        "product {C}~=~{A}{B} which will be calculated in this process. Each block {C}_{R}\n"
                        "is of the size {M}_0~\\x~{Q}_0 and is filled with zero-valued elements.\n"
                        "\\PThe blocks, like the initial matrices, should be stored in one-dimensional\n"
                        "arrays in a row-major order. To send the matrix sizes, use the MPI\\_Bcast\n"
                        "collective function, to send the blocks of the matrices {A} and {B},\n"
                        "use the MPI\\_Send and MPI\\_Recv functions and also the MPI\\_BLOCK\\_A\n"
                        "and MPI\\_BLOCK\\_B datatypes created by the Matr3CreateTypeBlock function\n"
                        "(see the \\2 task and a note to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr3ScatterData function\n"
                        "(without parameters). As a result of the call of this function, each process\n"
                        "will receive the values {M}_0, {P}_0, {Q}_0, as well as one-dimensional arrays\n"
                        "filled with the corresponding blocks of the matrices {A}, {B}, {C}.\n"
                        "Output all obtained data (that is, the numbers {M}_0, {P}_0, {Q}_0 and the blocks\n"
                        "of the matrices {A}, {B}, {C}) in each process after calling the Matr3ScatterData\n"
                        "function. Perform the input of initial data in the Matr3ScatterData function,\n"
                        "perform the output of the results in the Solve function.\n"
                        "\\P\\SNotes.\\s (1) When input the matrices {A} and {B} into arrays in the master process,\n"
                        "it should be taken into account that these arrays may contain elements\n"
                        "corresponding to additional zero-valued columns.\n"
                        "\\P(2) To reduce the number of the MPI\\_Bcast function calls,\n"
                        "all matrix sizes may be sent as a single array.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "��������������. ��������, ��� ���������� ��������� {K} �������� ������\n"
                        "���������: {K}~=~{K}_0\\*{K}_0. � ������� ���������� ������������ ������ ��������\n"
                        "������� ����������� �� {K} ������, ������� ���������� ������� ������� ������� {K}_0\n"
                        "(� ���������� ����� �������������� �� ��������� � ������������ ��� ����������\n"
                        "� ������ �������� ����� ��������� ���������� ������������).\n"
                        "\\P���� ��� ������� {A} ����� ������ {M}_0~\\x~{P}_0, ���� ��� ������� {B} �����\n"
                        "������ {P}_0~\\x~{Q}_0; ����� {M}_0, {P}_0, {Q}_0 ����������� �� �������� {M}_0~=~ceil({M}/{K}_0),\n"
                        "{P}_0~=~ceil({P}/{K}_0), {Q}_0~=~ceil({Q}/{K}_0), ��� �������� \\</\\> �������� ������������\n"
                        "�������, � ������� ceil ��������� ���������� � ��������. ���� ������� ��������\n"
                        "������������ ����� (��� ��������) ��� ���������� ��������� ������, �� �����\n"
                        "����������� �������� �������� (���������).\n"
                        "\\P��������� �������� ������� {A} � {B}, ����������� ��� ������������� ��������\n"
                        "�������� � ��������� �� �������� ({M}_0\\*{K}_0)~\\x~({P}_0\\*{K}_0) � ({P}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0),\n"
                        "� ���������� �������� � ������� ��������, ����� ���� ������������ ���������\n"
                        "������ �� ���� �������� �� ��� ��������, ��������� ����� �� �������\n"
                        "� ��������� �� � �������� � ������� ����������� �� ������ (������� ����� {R}\n"
                        "������� ����� {A}_{R} � {B}_{R}, {R}~=~0,~\\., {K}~\\-~1). ����� ����, ������� � ������\n"
                        "�������� ���� {C}_{R} ��� �������� ��������� ���������� ������������ {C}~=~{A}{B},\n"
                        "������� ����� ����������� � ���� ��������; ������ ���� {C}_{R} ����� ������ {M}_0~\\x~{Q}_0\n"
                        "� ����������� �������� ����������.\n"
                        "\\P�����, ��� � �������� �������, ������ ��������� �� ������� � ����������\n"
                        "�������� ���������������� �������. ��� ��������� �������� ������ ������������\n"
                        "������������ ������� MPI\\_Bcast, ��� ��������� ������ ������ {A} � {B} ������������\n"
                        "������� MPI\\_Send � MPI\\_Recv, � ����� ��������������� ���� MPI\\_BLOCK\\_A\n"
                        "� MPI\\_BLOCK\\_B, ��������� � ������� ������� Matr3CreateTypeBlock\n"
                        "(��. ������� \\2 � ���������� � ����).\n"
                        "\\P�������� ��� ��������� �������� � ���� ������� Matr3ScatterData\n"
                        "(��� ����������), � ���������� ������ ������� ������ ������� ��������\n"
                        "�������� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������, ����������� ����������������\n"
                        "������� ������ {A}, {B}, {C}. ����� ������ ������� Matr3ScatterData ������� � ������\n"
                        "�������� ���������� ������ (����� {M}_0, {P}_0, {Q}_0 � ����� ������ {A}, {B}, {C}).\n"
                        "���� �������� ������ ������������ � ������� Matr3ScatterData,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S��������.\\s (1) ��� ���������� ������ {A} � {B} � ������� �������� �������\n"
                        "���������, ��� ��������������� ��� �� �������� ������� ����� ���������\n"
                        "��������, ��������������� �������������� ������� ��������.\n"
                        "\\P(2) ��� ���������� ����� ������� ������� MPI\\_Bcast ��� ������������ �������\n"
                        "������ ����� ��������� �� ��������������� ������.");
                        */
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
                        "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the corresponding\n"
                        "blocks of matrices {A}, {B}, {C} are given in each process (thus, the given data\n"
                        "coincide with the results obtained in the \\1 task). Implement\n"
                        "the initial block redistribution used in the Cannon's algorithm\n"
                        "for block matrix multiplication.\n"
                        "\\PTo do this, define a Cartesian topology for all processes\n"
                        "as a two-dimensional periodic {K}_0~\\x~{K}_0 grid, where {K}_0\\*{K}_0 is equal to the number\n"
                        "of processes (ranks of processes should not be reordered), and perform\n"
                        "a cyclic shift of the blocks {A}_{R} given in all processes of each grid row {I}_0\n"
                        "by {I}_0 positions left (that is, in descending order of ranks of processes),\n"
                        "{I}_0~=~0,~\\., {K}_0~\\-~1, and perform a cyclic shift of the blocks {B}_{R} given\n"
                        "in all processes of each grid column {J}_0 by {J}_0 positions up (that is,\n"
                        "in descending order of ranks of processes), {J}_0~=~0,~\\., {K}_0~\\-~1.\n"
                        "\\PTo create the MPI\\_COMM\\_GRID communicator associated with the Cartesian\n"
                        "topology, use the Matr3CreateCommGrid function implemented in the \\2\n"
                        "task. Use the MPI\\_Cart\\_coords, MPI\\_Cart\\_shift, MPI\\_Sendrecv\\_replace functions\n"
                        "to perform the cyclic shifts (compare with \\2).\n"
                        "\\PInclude all the above mentioned actions in a Matr3Init function (without\n"
                        "parameters). Output the received blocks {A}_{R} and {B}_{R} in each process; perform\n"
                        "data input and output in the Solve function.");/*


                TaskText(
                        "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                        "����������� ���������������� ������� ������ {A}, {B}, {C} (����� �������, ��������\n"
                        "������ ��������� � ������������, ����������� � ������� \\1).\n"
                        "����������� ��������� ����������������� ������, ������������ � ���������\n"
                        "������� �������� ������������ ������.\n"
                        "\\P��� ����� ������ �� ��������� �������� ��������� ��������� ���������\n"
                        "��������� ���������� ����������� ������� ������� {K}_0 (��� {K}_0\\*{K}_0 �����\n"
                        "���������� ���������), �������� �������� ������� ��������� ���������,\n"
                        "� ��������� ��� ������ ������ {I}_0 ���������� ������� ({I}_0~=~0,~\\., {K}_0~\\-~1)\n"
                        "����������� ����� ������ {A}_{R} �� {I}_0 ������� ����� (�.\\,�. � ����������� ��������\n"
                        "������ ���������), � ��� ������� ������� {J}_0 ������� ({J}_0~=~0,~\\., {K}_0~\\-~1)\n"
                        "����������� ����� ������ {B}_{R} �� {J}_0 ������� ����� (�.\\,�. ����� � �����������\n"
                        "�������� ������ ���������).\n"
                        "\\P��� ����������� ������������� MPI\\_COMM\\_GRID, ���������� � ����������\n"
                        "����������, ������������ ������� Matr3CreateCommGrid, ������������� � �������\n"
                        "\\2. ��� ���������� ������������ ������ ������������ �������\n"
                        "MPI\\_Cart\\_coords, MPI\\_Cart\\_shift, MPI\\_Sendrecv\\_replace (��. � \\2).\n"
                        "\\P�������� ��������� �������� � ���� ������� Matr3Init (��� ����������).\n"
                        "������� � ������ �������� ����� {A}_{R} � {B}_{R}, ���������� � ���������� ������\n"
                        "(���� � ����� ������ ��������� �� ������� ������� Solve).");
                        */
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
                                "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the corresponding\n"
                                "blocks of matrices {A}, {B}, {C} are given in each process. The blocks {C}_{R}\n"
                                "are zero-valued, the initial redistribution for the blocks {A}_{R} and {B}_{R}\n"
                                "has already been performed in accordance with the Cannon's algorithm\n"
                                "(see the previous task). Implement one step of the Cannon's algorithm\n"
                                "of matrix multiplication as follows: multiply elements in the blocks {A}_{R}\n"
                                "and {B}_{R} of each process and perform a cyclic shift of the blocks {A}_0 given\n"
                                "in all processes of each row of the Cartesian periodic grid by 1 position\n"
                                "left (that is, in descending order of ranks of processes) and perform\n"
                                "a cyclic shift of the blocks {B}_0 given in all processes of each grid column\n"
                                "by 1 position up (that is, in descending order of ranks of processes).\n"
                                "\\PTo create the MPI\\_COMM\\_GRID communicator associated with the Cartesian\n"
                                "topology, use the Matr3CreateCommGrid function implemented in the \\3\n"
                                "task. Use the MPI\\_Cart\\_shift and MPI\\_Sendrecv\\_replace functions to perform\n"
                                "the cyclic shifts (compare with \\3).\n"
                                "\\PInclude all the above mentioned actions in a Matr3Calc function (without\n"
                                "parameters). Output the new contents of the blocks {C}_{R}, {A}_{R}, and {B}_{R}\n"
                                "in each process; perform data input and output in the Solve function.\n"
                                "\\P\\SRemark.\\s A special feature of the Cannon's algorithm is that the actions\n"
                                "at each step are not depend on the step number.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                                "����������� ���������������� ������� ������ {A}, {B} � {C}, ������ ��������,\n"
                                "��� ����� {C}_{R} �������� ��������, � ��� ������ {A}_{R} � {B}_{R} ��� ���������\n"
                                "�� ��������� ����������������� � ������������ � ���������� �������\n"
                                "(��. ���������� �������). ����������� ���� ��� ��������� ������� ������������\n"
                                "������, �������� ������������ ���������, ������������ � ������ {A}_{R} � {B}_{R} �������\n"
                                "��������, ����� ���� ������������ ��� ������ ������ ���������� �������\n"
                                "����������� ����� ������ {A}_{R} �� 1 ������� ����� (�.\\,�. � ����������� ��������\n"
                                "������ ���������), � ��� ������� ������� ������� ����������� ����� ������ {B}_{R}\n"
                                "�� 1 ������� ����� (�.\\,�. ����� � ����������� �������� ������ ���������).\n"
                                "\\P��� ����������� ��������� ������ ������������ ������������ MPI\\_COMM\\_GRID,\n"
                                "������ ��� � ������� ������� Matr3CreateCommGrid (��. ������� \\3),\n"
                                "� ������� MPI\\_Cart\\_shift � MPI\\_Sendrecv\\_replace (��. � \\3).\n"
                                "\\P�������� ��� �������� � ���� ������� Matr3Calc (��� ����������). �������\n"
                                "����� ���������� ������ {C}_{R}, {A}_{R} � {B}_{R} � ������ �������� (���� � ����� ������\n"
                                "��������� �� ������� ������� Solve).\n"
                                "\\P\\S����������.\\s ����������� ��������� ������� ������� � ���, ��� ��������\n"
                                "�� ������ ��� ���� �� ������� �� ������ ����.");
                                */
                else
        {
                        TaskText(
                                "Integers {M}_0, {P}_0, {Q}_0 and one-dimensional arrays filled with the corresponding\n"
                                "blocks of matrices {A}, {B}, {C} are given in each process. The blocks {C}_{R}\n"
                                "are zero-valued, the initial redistribution for the blocks {A}_{R} and {B}_{R} has\n"
                                "already been performed in accordance with the Cannon's algorithm\n"
                                "(see the \\2 task). In addition, a number {L} with the same value\n"
                                "is given in each process. The value of {L} is in the range 2 to {K}_0, where {K}_0\\*{K}_0\n"
                                "is the number of processes, and determines the number\n"
                                "of steps of the Cannon's algorithm.\n"
                                "\\PUsing the function Matr3Calc (see the previous task) in a loop, execute\n"
                                "the initial {L} steps of the Cannon's algorithm and output the new contents\n"
                                "of the blocks {C}_{R}, {A}_{R}, and {B}_{R} in each process. Perform data input\n"
                                "and output in the Solve function.\n"
                                "\\P\\SNote.\\s If the value of {L} is equal to {K}_0 then the blocks {C}_{R} will contain\n"
                                "the corresponding parts of the final matrix product {A}{B}.");/*


                        TaskText(
                                "� ������ �������� ���� ����� {M}_0, {P}_0, {Q}_0, � ����� ���������� �������,\n"
                                "����������� ���������������� ������� ������ {A}, {B} � {C}, ������ ��������,\n"
                                "��� ����� {C}_{R} �������� ��������, � ��� ������ {A}_{R} � {B}_{R} ��� ���������\n"
                                "�� ��������� ����������������� � ������������ � ���������� �������\n"
                                "(��. ������� \\2). ����� ����, � ������ �������� ���� ���� � �� ��\n"
                                "����� {L}, ������� � ��������� �� 2 �� {K}_0 (��� {K}_0\\*{K}_0 ����� ���������� ���������)\n"
                                "� ������������ ��������� ����� ����� ��������� �������.\n"
                                "\\P������� � ����� ������� Matr3Calc, ������������� � ���������� �������,\n"
                                "��������� {L} ��������� ����� ��������� ������� � ������� � ������ ��������\n"
                                "����� ���������� ������ {C}_{R}, {A}_{R} � {B}_{R} (���� � ����� ������ ���������\n"
                                "�� ������� ������� Solve).\n"
                                "\\P\\S����������.\\s ���� �������� {L} ����� {K}_0, �� ����� {C}_{R} ����� ���������\n"
                                "��������������� ��������� ��������� ���������� ������������ {A}{B}.");
                                */
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
                        "Integers {M} and {Q} (the numbers of rows and columns of the matrix product)\n"
                        "are given in the master process. In addition, integers {M}_0, {Q}_0\n"
                        "and one-dimensional arrays filled with the {M}_0~\\x~{Q}_0 blocks of the matrix {C}\n"
                        "are given in each process (the given blocks of {C} are obtained as a result\n"
                        "of {K}_0 steps of the Cannon's algorithm~\\= see the \\1 task). Send\n"
                        "all the blocks {C}_{R} to the master process and output the received matrix {C}\n"
                        "of the size {M}~\\x~{Q} in this process.\n"
                        "\\PTo store the resulting matrix {C} in the master process, use a one-dimensional\n"
                        "array sufficient to store the matrix of the size ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0). To send\n"
                        "the blocks {C}_{R} to this array, use the MPI\\_Send and MPI\\_Recv functions\n"
                        "and the MPI\\_BLOCK\\_C datatype created by the Matr3CreateTypeBlock function\n"
                        "(see the \\6 task and a note to it).\n"
                        "\\PInclude all the above mentioned actions in a Matr3GatherData function\n"
                        "(without parameters). Perform the input of initial data in the Solve function,\n"
                        "perform the output of the resulting matrix in the Matr3GatherData function.\n"
                        "\\P\\SNote.\\s When output the matrix {C} in the master process, it should be taken\n"
                        "into account that an array, which is intended for matrix storage, may\n"
                        "contain elements corresponding to additional zero-valued columns.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M} � {Q}~\\= ����� ����� � �������� ���������������\n"
                        "���������� ������������. ����� ����, � ������ �������� ���� ����� {M}_0, {Q}_0,\n"
                        "� ����� ���������� �������, ����������� ������� ������� {C} (������� {M}_0~\\x~{Q}_0),\n"
                        "������� ���� �������� � ���������� ���������� {K}_0 ����� �������� ���������\n"
                        "������� ������������ ������ (��. \\1). ��������� ��� ����� {C}_{R}\n"
                        "� ������� ������� � ������� � ��� ���������� ������� {C} (������� {M}~\\x~{Q}).\n"
                        "\\P��� �������� �������������� ������� {C} � ������� �������� ������������\n"
                        "���������� ������, ����������� ��� �������� ������� ������� ({M}_0\\*{K}_0)~\\x~({Q}_0\\*{K}_0).\n"
                        "��� ��������� ������ {C}_{R} ������������ ������� MPI\\_Send � MPI\\_Recv, � �����\n"
                        "��������������� ��� MPI\\_BLOCK\\_C, ��������� � ������� �������\n"
                        "Matr3CreateTypeBlock (��. ������� \\6 � ���������� � ����).\n"
                        "\\P�������� ��� �������� � ���� ������� Matr3GatherData (��� ����������).\n"
                        "���� ������ ��������� �� ������� ������� Solve, ����� ���������� �������\n"
                        "�������� � ������� Matr3GatherData.\n"
                        "\\P\\S��������.\\s ��� ������ ������� {C} � ������� �������� ������� ���������,\n"
                        "��� ��������������� ��� �� �������� ������ ����� ��������� ��������,\n"
                        "��������������� �������������� ������� ��������.");
                        */
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
                        "Integers {M}, {P}, {Q}, a matrix {A} of the size {M}~\\x~{P}, and a matrix {B}\n"
                        "of the size {P}~\\x~{Q} are given in the master process (thus, the given data\n"
                        "coincide with the given data in the \\5 task).\n"
                        "\\PUsing successively the Matr3ScatterData, Matr3Calc (in a loop),\n"
                        "and Matr3GatherData functions, that are developed\n"
                        "in the \\5\\-\\1 tasks, find a matrix {C}, which\n"
                        "is equal to the product of the initial matrices {A} and {B},\n"
                        "and output this matrix in the master process.\n"
                        "\\PIn addition, output the current contents of the block {C}_{R} in each process\n"
                        "after each call of the Matr3Calc function.\n"
                        "\\PThe MPI\\_COMM\\_GRID communicator, which is used in the Matr3Init and Matr3Calc\n"
                        "functions, should not be created several times. To do this, modify\n"
                        "the Matr3CreateCommGrid function; the modified function should not perform\n"
                        "any actions when it is called with the parameter comm\n"
                        "that is not equal to MPI\\_COMM\\_NULL.\n"
                        "\\PIn addition, modify the Matr3Calc function (see the \\3 task),\n"
                        "before using in this task, as follows: add the parameter named step\n"
                        "to this function (step~=~0,~\\., {K}_0~\\-~1); the blocks {A}_{R} and {B}_{R}\n"
                        "should not be sent when the parameter step is equal to {K}_0~\\-~1.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q} � ������� {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q}\n"
                        "�������������� (����� �������, �������� ������ ��������� � ��������� �������\n"
                        "��� ������� \\5).\n"
                        "\\P��������������� ������� ������������� � �������� \\5\\-\\1\n"
                        "������� Matr3ScatterData, Matr3Init, Matr3Calc (� �����) � Matr3GatherData,\n"
                        "�������� � ������� � ������� �������� ������� {C}, ������ ������������\n"
                        "�������� ������ {A} � {B}.\n"
                        "\\P����� ������� ������ ������� Matr3Calc ������������� �������� � ������\n"
                        "�������� ������� ���������� ����� {C}_{R}.\n"
                        "\\P��� ���� ����� ������������ MPI\\_COMM\\_GRID, ������������ � �������� Matr3Init\n"
                        "� Matr3Calc, �� ���������� ��������� ���, �������������� �������\n"
                        "Matr3CreateCommGrid ����� �������, ����� ��� �� ������ ��� ��� �������������\n"
                        "������������� (�� ������� MPI\\_COMM\\_NULL) ��� �� ��������� ������� ��������.\n"
                        "\\P����� �������������� � ������ ������� ������� �������������� �������������\n"
                        "� \\3 ������� Matr3Calc, ������� � ��� �������� step, ������ ������\n"
                        "���� (step~=~0,~\\., {K}_0~\\-~1), � ������� �� ����� �������, ����� ��� ��������\n"
                        "��������� step, ������ {K}_0~\\-~1, �� ����������� ��������� ������ {A}_{R} � {B}_{R}.");
                        */

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
                        "Integers {M}, {P}, {Q} and two file names are given in the master process.\n"
                        "The given files contain elements of a matrix {A} of the size {M}~\\x~{P} and\n"
                        "a matrix {B} of the size {P}~\\x~{Q}. Modify the stage of receiving blocks\n"
                        "for the Cannon's algorithm of matrix multiplication (see the \\6 task)\n"
                        "as follows: each process should read the corresponding blocks\n"
                        "of the matrices {A} and {B} directly from the given files. In this case,\n"
                        "all processes should receive not only the sizes {M}_0, {P}_0, {Q}_0 of the blocks,\n"
                        "but also the sizes {M}, {P}, {Q} of the initial matrices, which are needed\n"
                        "to determine correctly the positions of blocks in the source files.\n"
                        "\\PTo send the sizes of matrices and file names, use the MPI\\_Bcast collective\n"
                        "function. Use the MPI\\_File\\_read\\_at local function to read each row\n"
                        "of the block (a new file view is not required).\n"
                        "\\PInclude all these actions in a Matr3ScatterFile function (without parameters).\n"
                        "As a result of the call of this function, each process will receive\n"
                        "the values {M}, {P}, {Q}, {M}_0, {P}_0, {Q}_0, as well as one-dimensional arrays\n"
                        "filled with the corresponding blocks of the matrices {A}, {B}, {C}. Output\n"
                        "all obtained data (that is, the numbers {M}, {P}, {Q}, {M}_0, {P}_0, {Q}_0 and the blocks\n"
                        "of the matrices {A}, {B}, {C}) in each process after calling the Matr3ScatterFile\n"
                        "function. Perform the input of initial data in the Matr3ScatterFile function,\n"
                        "perform the output of the results in the Solve function.\n"
                        "\\P\\SNote.\\s For some blocks, some of their elements (namely, the last rows\n"
                        "and/or columns) should not be read from the source files and will remain\n"
                        "zero-valued ones. To determine the actual size of the block being read\n"
                        "(the number of rows and columns), it is required to use the sizes\n"
                        "of the initial matrices and the coordinates ({I}_0, {J}_0) of the block\n"
                        "in a square Cartesian grid of order {K}_0 (note that {I}_0~=~{R}/{K}_0,\n"
                        "{J}_0~=~{R}%{K}_0, where {R} is the process rank).\n"
                        "\\P\\SRemark.\\s Whereas the values of {P} and {Q} are necessary to ensure the correct\n"
                        "reading of the file blocks, the value of {M} is not required for this purpose,\n"
                        "since the attempt to read data beyond the end of file is ignored (without\n"
                        "generating any error message). However, the value of {M} is required\n"
                        "at the final stage of the algorithm (see the next task),\n"
                        "so it must also be sent to all processes.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������, ����������\n"
                        "�������� ������ {A} � {B} ������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������. ��������������\n"
                        "���� ��������� ������ ��� �������� ��������� ������� ������������ ������\n"
                        "(��. \\6) ����� �������, ����� ������ ������� �������� ���������������\n"
                        "����� ������ {A} � {B} ��������������� �� �������� ������. � ������ ������\n"
                        "���� ��������� ��������� ��������� �� ������ ������� ������ {M}_0, {P}_0, {Q}_0,\n"
                        "�� � ������� �������� ������ {M}, {P}, {Q}, ������� ��������� ��� �����������\n"
                        "����������� ������� ������ � �������� ������.\n"
                        "\\P��� ��������� �������� ������ � ���� ������ ������������ ������������\n"
                        "������� MPI\\_Bcast. ��� ���������� ������ ������������ ��������� �������\n"
                        "MPI\\_File\\_read\\_at, ������� ��������� ������� ��� ���������� ������ ������\n"
                        "����� (����� ��� �������� ������ ��������� �� ���������).\n"
                        "\\P�������� ��� �������� � ���� ������� Matr3ScatterFile (��� ����������),\n"
                        "� ���������� ������ ������� ������ ������� �������� �������� {M}, {P}, {Q}, {M}_0,\n"
                        "{P}_0, {Q}_0, � ����� ���������� �������, ����������� ���������������� �������\n"
                        "������ {A}, {B}, {C}. ����� ������ ������� Matr3ScatterFile ������� � ������\n"
                        "�������� ���������� ������ (����� {M}, {P}, {Q}, {M}_0, {P}_0, {Q}_0 � ����� ������ {A}, {B}, {C}).\n"
                        "���� �������� ������ ������������ � ������� Matr3ScatterFile,\n"
                        "����� ����������� ��������� �� ������� ������� Solve.\n"
                        "\\P\\S��������.\\s ��� ������ �������� ������ ������� ���������, ��� ��� ���������\n"
                        "������ ����� ��������� (��������� ������ �/��� �������) �� ������ �����������\n"
                        "�� �������� ������ � ����� ���������� �������. ��� ����������� ������������\n"
                        "������� ������������ ����� (����� ����� � ����� ��������) �����������\n"
                        "������������ ������� �������� ������ � ���������� ����� ({I}_0, {J}_0) � ����������\n"
                        "���������� ������� ������� {K}_0, ������� ����� ����������\n"
                        "�� ����� �������� {R}: {I}_0~=~{R}/{K}_0, {J}_0~=~{R}%{K}_0.\n"
                        "\\P\\S����������.\\s � �� ����� ��� �������� {P} � {Q} ���������� ��� �����������\n"
                        "����������� ���������� �������� ������, �������� {M} ����� �� ������������,\n"
                        "��������� ������� ������ ������ �� ������ ����� ������ ������������,\n"
                        "�� ������� � ������. ������ �������� {M} ����������� �� ����������� �����\n"
                        "��������� (��. ��������� �������), ������� ��� ���� ����������\n"
                        "��������� ���� ���������.");
                        */

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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y++);
//      DataComment("���������� ����� (������� B): ", 1, y++);
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
                        "Integers {M}, {Q}, {M}_0, {Q}_0 and one-dimensional arrays filled\n"
                        "with the {M}_0~\\x~{Q}_0 blocks {C}_{R} are given in each process (the given blocks {C}_{R}\n"
                        "are obtained as a result of {K}_0 steps of the Cannon's block algorithm\n"
                        "of matrix multiplication~\\= see the \\5 task). In addition, the name\n"
                        "of file to store the matrix product is given in the master process.\n"
                        "\\PSend the file name to all processes using the MPI\\_Bcast function.\n"
                        "Write all the parts of the matrix product contained in the blocks {C}_{R}\n"
                        "to the resulting file, which will eventually contain a matrix {C}\n"
                        "of the size {M}~\\x~{Q}.\n"
                        "\\PUse the MPI\\_File\\_write\\_at local function to write each row of the block\n"
                        "to the file (a new file view is not required).\n"
                        "\\PInclude all these actions (namely, the input of file name, sending\n"
                        "the file name, and writing all blocks to the file) in a Matr3GatherFile\n"
                        "function. Perform the input of all initial data, except the file name,\n"
                        "in the Solve function.\n"
                        "\\P\\SNote.\\s When writing data to the resulting file, it is necessary to take\n"
                        "into account that some of the blocks {C}_{R} may contain trailing zero-valued rows\n"
                        "and/or columns that are not related to the resulting matrix product\n"
                        "(see also the note and the remark for the previous task).");/*


                TaskText(
                        "� ������ �������� ���� ����� {M}, {Q}, {M}_0, {Q}_0, � ����� ���������� �������,\n"
                        "����������� ������� {C}_{R} (������� {M}_0~\\x~{Q}_0), ����������� � ����������\n"
                        "���������� {K}_0 ����� �������� ��������� ������� ������������ ������\n"
                        "(��. \\5). ����� ����, � ������� �������� ���� ��� �����\n"
                        "��� �������� ��������������� ���������� ������������.\n"
                        "\\P��������� ��� ����� �� ��� �������� (��������� ������� MPI\\_Bcast) � ��������\n"
                        "��� ��������� ���������� ������������, ������������ � ������ {C}_{R},\n"
                        "� �������������� ����, ������� � ����� ����� ��������� ������� {C}\n"
                        "������� {M}~\\x~{Q}.\n"
                        "\\P��� ������ ������ � ���� ������������ ��������� ������� MPI\\_File\\_write\\_at,\n"
                        "������� ��������� ������� ��� ������ ������ ������ ����� (����� ��� ��������\n"
                        "������ ��������� �� ���������).\n"
                        "\\P�������� ���������� ����� �����, ��� ���������, � ����� ��� �������� �� ������\n"
                        "������ � ���� � ���� ������� Matr3GatherFile (���������� ���� �������� ������,\n"
                        "����� ����� �����, ������ �������������� �� ������� ������� Solve).\n"
                        "\\P\\S��������.\\s ��� ������ �������� ������ ������� ���������, ��� ��� ���������\n"
                        "������ {C}_{R} ����� ��������� (��������� ������ �/��� �������, ����������� ������)\n"
                        "�� ������ ������������ � �������������� ����. ��. ����� ��������\n"
                        "� ���������� � ����������� �������.");
                        */

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
                                DataComment("Name of file", 1, y3++);
                                DataComment("  for matrix C: ", 1, y3++);
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
        ResultComment("File with matrix C: ", 1, y++);
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
                        "Integers {M}, {P}, {Q} and three file names are given in the master process.\n"
                        "The first two file names are related to the existing files containing\n"
                        "the elements of matrices {A} and {B} of the size {M}~\\x~{P} and {P}~\\x~{Q}, respectively,\n"
                        "the third file should be created to store the resulting matrix product {C}~=~{A}{B}.\n"
                        "\\PUsing successively the Matr3ScatterFile, Matr3Init, Matr3Calc (in a loop),\n"
                        "and Matr3GatherFile functions (see the \\2, \\7, \\6,\n"
                        "and \\1 tasks), find a matrix {C} and write its elements\n"
                        "to the resulting file.\n"
                        "\\PIn addition, output the current value of the c[step] in each process\n"
                        "after each call of the Matr3Calc function, where c is a one-dimensional array\n"
                        "containing the block {C}_{R}, and step is the algorithm step number (0, 1,~\\.,\n"
                        "{K}_0~\\-~1). Thus, the element c[0] should be output on the first step\n"
                        "of the algorithm, the element c[1] should be output on the second step\n"
                        "of the algorithm, and~so~on.");/*


                TaskText(
                        "� ������� �������� ���� ����� {M}, {P}, {Q}, � ����� ����� ���� ������: �������\n"
                        "������ ����� ���� ������������ ������, ���������� �������� ������ {A} � {B}\n"
                        "������� {M}~\\x~{P} � {P}~\\x~{Q} ��������������, � ����� ��� ����� ��� ��������\n"
                        "��������������� ���������� ������������ {C}~=~{A}{B}.\n"
                        "\\P��������������� ������� ������������� � �������� \\2, \\7,\n"
                        "\\6 � \\1 ������� Matr3ScatterFile, Matr3Init, Matr3Calc\n"
                        "(� �����) � Matr3GatherFile, �������� � �������������� ����� ������������\n"
                        "�������� ������ {A} � {B}, ��������� � ������� �������� ��������� �������.\n"
                        "\\P����� ������� ������ ������� Matr3Calc ������������� �������� � ������\n"
                        "�������� ������� �������� �������� c[step], ��� c~\\= ���������� ������,\n"
                        "���������� ���� {C}_{R}, � step~\\= ����� ���� ��������� (0, 1,~\\., {K}_0~\\-~1);\n"
                        "����� �������, �� ������ ���� ��������� ������� ������� ������� c[0],\n"
                        "�� ������ ����~\\= ������� c[1], �~�.\\,�.");
                        */

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
        DataS("File with matrix A: ", sa.c_str(), 1, y++);
//      DataComment("���������� ����� (������� A): ", 1, y++);
        SetFileRow(p);
        DataFileN(sa.c_str(), y++, 4);
        DataS("File with matrix B: ", sb.c_str(), 1, y);
//      DataComment("���������� ����� (������� B): ", 1, y++);
        DataS("Name of file for matrix C: ", sc.c_str(), xRight, y++);
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
                ResultComment("File with matrix C", 1, y++);
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

  CreateGroup("MPI9Matr", "Parallel matrix algorithms",
    "M. E. Abramyan, 2017", "qwq2334sqwjdfkvl4567ttd", 44, InitTask);
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


int  initgroup(char *name, char *code, int lang)
{
  string sname(name), scode;
  int res = InitGroup(sname, scode, lang);
  if (res > 0)
  {
     strcpy(name, sname.c_str());
     strcpy(code, scode.c_str());
  }
  return res;
}

int inittask(int num, int test)
{
    return InitTask(num, test);
}

