{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI6File_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  alphabet = '0123456789abcdefghijklmnopqrstuvwxyz';
  prcname = 'Process %d: ';
  title1 = 'Local functions for file input-output';
  title2 = 'Collective functions for file input-output';
  title3 = 'File view setting';


function RandomName(len: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to len do
    result := result + alphabet[Random(length(alphabet))+1];
end;

function Prc(n: integer): string;
begin
  result := Format(prcname, [n]);
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

var a: array[1..64] of integer;
    b, b1: array[1..64] of real;
    n, m, k: integer;

procedure MPIIO1;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process;'#13+
'the amount of file items, which should be read, and their ordinal numbers'#13+
'are given in each slave process (the file items are numbered from 1). File'#13+
'items with some numbers may be missing in the source file. Using the required'#13+
'number of the MPI\_File\_read\_at local function calls in each process, read'#13+
'existing file items with the specified ordinal numbers from the source file'#13+
'and output them in the same order. To check existence of file item with the'#13+
'specified ordinal number, you can either use the MPI\_File\_get\_size function,'#13+
'or analyze the MPI\_Status parameter of the MPI\_File\_read\_at function.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел. В каждом'#13#10
+'из подчиненных процессов дано количество файловых элементов, предназначенных'#13#10
+'для считывания в этом процессе, и порядковые номера этих элементов (элементы'#13#10
+'нумеруются от~1). Элементы с некоторыми номерами в исходном файле могут'#13#10
+'отсутствовать. Используя в каждом процессе требуемое количество вызовов'#13#10
+'локальной функции MPI\_File\_read\_at, прочесть из файла существующие элементы'#13#10
+'с указанными номерами и вывести их в том же порядке. Для проверки наличия'#13#10
+'элемента с указанным порядковым номером можно либо использовать функцию'#13#10
+'MPI\_File\_get\_size, либо анализировать информацию, возвращенную в параметре'#13#10
+'типа MPI\_Status функции MPI\_File\_read\_at.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,30);
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    k := RandomN(4,8);
    x1 := 1 + 40 * ((i+1) mod 2);
    x2 := x1;
    y1 := (i+1) div 2 + 1;
    y2 := (i+1) div 2 + 2;
    DataN(prc(i)+'(', k, x1, y1, 1);
    DataComment(')', x1+13, y1);
    ResultComment(prc(i), x2, y2);
    x1 := x1 + 12;
    x2 := x2 + 8;
    for j := 1 to k do
    begin
      k0 := RandomN(1, m + 5);
      x1 := x1 + 3;
      DataN(k0, x1, y1, 2);
      if k0<=m then
      begin
        x2 := x2 + 3;
        ResultN(a[k0], x2, y2, 2);
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO2;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(3,5);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process; the amount of pairs of'#13+
'integers and the pairs themselves are given in each slave process; the first'#13+
'term of the pair is the ordinal number of the file item, the second term of'#13+
'the pair is the value of this file item (the file items are numbered from 1,'#13+
'all ordinal numbers are different and cover range from 1 to some integer).'#13+
'Create a new file of integers with the given name and write the given data'#13+
'to this file using the required number of the MPI\_File\_write\_at'#13+
'local function calls in each slave process.');

(*TaskText(
 'В главном процессе дано имя файла. В каждом из подчиненных процессов'#13#10
+'дано количество пар целых чисел и сами пары, в которых первый член равен'#13#10
+'порядковому номеру файлового элемента, а второй \= значению этого файлового'#13#10
+'элемента (элементы нумеруются от~1, все номера различны и принимают все'#13#10
+'значения от 1 до некоторого целого числа). Создать новый файл целых чисел'#13#10
+'с указанным именем и записать в него данные элементы, используя в каждом'#13#10
+'подчиненном процессе требуемое количество вызовов'#13#10
+'локальной функции MPI\_File\_write\_at.');*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[i] := RandomN(4,7);
    m := m + k0[i];
  end;
  for i := 1 to m do
  begin
    a[i] := RandomN(10,99);
    p[i] := i;
  end;
  for i := 1 to 2 * m do
    SwapN(p[RandomN(1, m)], p[RandomN(1, m)]);
  j0 := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i + 1;
    DataN(prc(i)+'(', k0[i], x1, y1, 1);
    DataComment(')', x1 + 13, y1);
    x1 := x1 + 9;
    for j := 1 to k0[i] do
    begin
      x1 := x1 + 7;
      DataN('', p[j0+j], x1, y1, 2);
      x1 := x1 + 2;
      DataN(' - ', a[p[j0+j]], x1, y1, 2);
    end;
    j0 := j0 + k0[i];
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO3;
var
  i, j, j0, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'The file contains elements of the {K}~\x~{N} matrix, where {K} is the number of slave'#13+
'processes. Using one call of the MPI\_File\_read\_at local function in each slave'#13+
'process, read and output elements of {R}th matrix row in the process of rank {R}'#13+
'(rows are numbered from 1). Use the MPI\_File\_get\_size function'#13+
'to determine the file size.');

(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего элементы прямоугольной матрицы размера {K}~\x~{N}, где {K} \= число'#13#10
+'подчиненных процессов. В каждом подчиненном процессе прочесть и вывести'#13#10
+'элементы {R}-й строки матрицы, где {R} \= ранг подчиненного процесса (строки'#13#10
+'нумеруются от~1), используя один вызов локальной функции MPI\_File\_read\_at.'#13#10
+'Для определения размера файла использовать функцию MPI\_File\_get\_size.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 3);
  k := RandomN(5,10);
  m := k * (n - 1);
  j0 := 0;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x2 := 5;
    y2 := i;
//    DataN(prc(i)+'(', k, x1, y1, 1);
//    DataComment(')', x1+13, y1);
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 4;
    for j := 1 to k do
    begin
      x2 := x2 + 6;
      ResultR(b[j+j0], x2, y2, 6);
    end;
    j0 := j0 + k;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(k);
  DataFileR(s,4,6);
end;

procedure MPIIO4;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process; a sequence of {R} real numbers'#13+
'is given in each slave process, where {R} is the process rank. Create a new file'#13+
'of real numbers with the given name and write the given data to this file'#13+
'in ascending order of ranks of processes containing these data. Use one call'#13+
'of the MPI\_File\_write\_at local function in each slave process.');
  
(*TaskText(
 'В главном процессе дано имя файла, в каждом из подчиненных процессов'#13#10
+'дано {R} вещественных чисел, где {R} \= ранг процесса. Создать новый файл'#13#10
+'вещественных чисел с указанным именем и записать в него данные элементы'#13#10
+'в порядке возрастания рангов содержащих их процессов. Использовать в каждом'#13#10
+'подчиненном процессе один вызов локальной функции MPI\_File\_write\_at.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i do
    begin
      x1 := x1 + 5;
      m := m + 1;
      b[m] := RandomR(1,9.99);
      DataR('', b[m], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO5;
var
  i, j, k0, kmax, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains all integers in the range from 1 to {K}, where {K} is the maximal rank'#13+
'of process. Read and output two sequences of the file items in each slave'#13+
'process. The first sequence contains the \Iinitial\i part of the file items until'#13+
'the first item whose value is equal to the process rank (including this'#13+
'item); the second sequence contains the \Ifinal\i part of the file items and has'#13+
'the same size as the first one. Elements of each sequence should be output'#13+
'in the order they are stored in the file. Use the required number of the'#13+
'MPI\_File\_read local function calls in each process (without using arrays)'#13+
'and also the MPI\_File\_get\_position function call to determine the size of'#13+
'the first sequence and the MPI\_File\_seek function call with the MPI\_SEEK\_END'#13+
'parameter to move the file pointer to the beginning of the second sequence.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел. Файл обязательно'#13#10
+'содержит все целые числа в диапазоне от 1 до {K}, где {K} \= максимальный ранг'#13#10
+'процесса. В каждом подчиненном процессе прочесть и вывести два фрагмента'#13#10
+'файловых данных: первый содержит \Iначальную\i часть элементов до первого'#13#10
+'элемента, равного рангу процесса (включая этот элемент), второй содержит'#13#10
+'\Iзавершающую\i часть файловых элементов и имеет тот же размер, что и первый'#13#10
+'фрагмент. Элементы в каждом фрагменте выводятся в порядке их следования'#13#10
+'в файле. Использовать в каждом подчиненном процессе необходимое количество'#13#10
+'вызовов локальной функции MPI\_File\_read (без применения массивов), а также'#13#10
+'вызовы функций MPI\_File\_get\_position для определения размера первого фрагмента'#13#10
+'и MPI\_File\_seek с параметром MPI\_SEEK\_END для перемещения'#13#10
+'к началу второго фрагмента.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,20);
  repeat
  for i := 1 to 9 do
    a[i] := i;
  for i := 9 to m do
    a[i] := RandomN(1,9);
  for i := 1 to 2 * m do
    SwapN(a[RandomN(1, m)], a[RandomN(1, m)]);
  kmax := 0;
  for i := 1 to n - 1 do
  begin
    k0 := 0;
    for j := 1 to m do
      if a[j] = i then
      begin
        k0 := j;
        break;
      end;
    if k0 > kmax then
      kmax := k0;
  end;
  until kmax <= 15;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    k := 0;
    x2 := 5;
    y2 := i;
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 8;
    k := 1;
    while a[k] <> i do
    begin
      x2 := x2 + 2;
      ResultN(a[k], x2, y2, 2);
      k := k + 1;
    end;
    x2 := x2 + 2;
    ResultN(a[k], x2, y2, 2);
    x2 := 14 + kmax*2;
    for j := 1 to k do
    begin
      x2 := x2 + 2;
      ResultN(a[m-k+j], x2, y2, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO6;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process; an integer is given in each'#13+
'slave process. Create a new file of integers with the given name and write'#13+
'{K} successive copies of each given integer to this file, where {K} is the number'#13+
'of slave processes. The order of integers in the file should be the inverse'#13+
'of the order of the slave processes (i.\,e., {K} copies of the integer from the'#13+
'process 1 should be written at the end of file, {K} copies of the integer from'#13+
'the process 2 should be written before them, and so~on). Use one call of'#13+
'the MPI\_File\_write local function in each slave process and also'#13+
'the MPI\_File\_seek function with the MPI\_SEEK\_SET parameter.');
  
(*TaskText(
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дано'#13#10
+'целое число. Создать новый файл целых чисел с указанным именем и записать'#13#10
+'в него {K} подряд идущих копий каждого числа, где {K} равно количеству'#13#10
+'подчиненных процессов. Порядок следования чисел в файле должен быть обратным'#13#10
+'порядку подчиненных процессов ({K} копий числа из процесса 1 должны находиться'#13#10
+'в конце файла, перед ними должны располагаться {K} копий числа из процесса 2,'#13#10
+'и~т.\,д.). Использовать в каждом подчиненном процессе один вызов локальной'#13#10
+'функции MPI\_File\_write, а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[n-i] := RandomN(10,99);
    for j := 1 to n-1 do
    begin
      m := m + 1;
      a[m] := k0[n-i];
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 14 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataN(prc(i), k0[i], x1, y1, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO7;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The sum'#13+
'of all file item values is greater than {K}, where {K} is the number of slave'#13+
'processes. Read initial file items in each slave process until the sum of'#13+
'their values exceeds the rank of process and output this sum and the amount {N}'#13+
'of read numbers. After that, in addition, read and output the values of the'#13+
'\Ilast\i {N} file items in the order they are stored in the file. Use the required'#13+
'number of the MPI\_File\_read local function calls in each slave process'#13+
'(without using arrays) and also the MPI\_File\_get\_position function call'#13+
'to determine the amount {N} and the MPI\_File\_seek function call with the'#13+
'MPI\_SEEK\_END parameter to move the file pointer to beginning'#13+
'of the group of the last {N} items.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел. Известно,'#13#10
+'что сумма значений всех файловых элементов превосходит {K}, где {K} \= количество'#13#10
+'подчиненных процессов. В каждом подчиненном процессе считывать начальные'#13#10
+'элементы файла, пока сумма их значений не превысит ранг процесса, после чего'#13#10
+'вывести найденную сумму {S} и количество {N} прочитанных чисел. После этого'#13#10
+'дополнительно прочесть и вывести значения {N} \Iпоследних\i файловых элементов'#13#10
+'(в порядке их следования в файле). Использовать в каждом подчиненном процессе'#13#10
+'необходимое количество вызовов локальной функции MPI\_File\_read (без применения'#13#10
+'массивов), а также вызовы функций MPI\_File\_get\_position для определения {N}'#13#10
+'и MPI\_File\_seek с параметром MPI\_SEEK\_END для перемещения к началу фрагмента'#13#10
+'из {N} последних файловых элементов.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,20);
  repeat
  bmax := 0;
  k := 30;
  for i := 1 to m do
    b[i] := RandomR(0.3, 1.3);
  for i := 1 to m do
  begin
    bmax := bmax + b[i];
    if bmax > n-1 then
    begin
      k := i;
      break;
    end;
  end;
  until k < 10;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    sum := 0;
    x2 := 5;
    y2 := i;
    ResultComment(prc(i), x2, y2);
    k := 1;
    sum := b[1];
    while sum <= i do
    begin
      k := k + 1;
      sum := sum + b[k];
    end;
    x2 := x2 + 12;
    ResultR('S = ', sum, x2, y2, 4);
    x2 := x2 + 10;
    ResultN('N = ', k, x2, y2, 1);
    x2 := x2 + 2;
    for j := 1 to k do
    begin
      x2 := x2 + 5;
      ResultR(b[m-k+j], x2, y2, 4);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO8;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0: array[1..50] of real;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process; a real number is given'#13+
'in each slave process. Create a new file of real numbers with the given name'#13+
'and write {R} successive copies of each given real number to this file, where {R}'#13+
'is equal to the rank of the process in which this number is given. The order'#13+
'of numbers in the file should be the \Iinverse\i of the order of the slave'#13+
'processes (i.\,e., single copy of the real number from the process 1 should be'#13+
'written at the end of file, two copies of the real number from the process 2'#13+
'should be written before it, and so~on). Use one call of the MPI\_File\_write'#13+
'local function in each slave process and also the MPI\_File\_seek function'#13+
'with the MPI\_SEEK\_SET parameter.');
  
(*TaskText(
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дано'#13#10
+'вещественное число. Создать новый файл вещественных чисел с указанным именем'#13#10
+'и записать в него {R} подряд идущих копий каждого числа, где {R} равно рангу'#13#10
+'процесса, в котором дано это число. Порядок следования чисел в файле должен'#13#10
+'быть \Iобратным\i порядку подчиненных процессов (в конце файла должно находиться'#13#10
+'единственное число из процесса~1, перед ним должны располагаться две копии'#13#10
+'числа из процесса~2, и т.\,д.). Использовать в каждом подчиненном процессе'#13#10
+'один вызов локальной функции MPI\_File\_write, а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[n-i] := RandomR(10,99.99);
    for j := 1 to n-i do
    begin
      m := m + 1;
      b[m] := k0[n-i];
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 12 + 41 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataR(prc(i), k0[i], x1, y1, 5);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO9;
var
  i, j, k0, kmax, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(5,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. Read'#13+
'and output the {R}~+~1 file items in each process starting with the item with'#13+
'the ordinal number {R}~+~1, where {R} is the process rank (0, 1,~\.). File items'#13+
'are numbered from 1; thus, you should read only the initial file item in'#13+
'the process 0, the two following items in the process 1, the three items'#13+
'starting with the third one in the process 2, and so~on. If the file does not'#13+
'contain enough items then, in some processes, the number of output items may'#13+
'be less than the required one. Use one call of the MPI\_File\_read\_all'#13+
'collective function call and also the MPI\_File\_get\_size function'#13+
'to determine the file size.'#13+
'\P\SNote.\s In MPICH2 1.3, the function MPI\_File\_read\_all does not allow'#13+
'to determine the number of actually read file items based on the information'#13+
'contained in the MPI\_Status parameter: this parameter always contain'#13+
'the number of items to be read, and if there are not enough items'#13+
'in the file then zero values are appended to the output array.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел. В каждом процессе'#13#10
+'прочесть и вывести {R}~+~1 элемент файла, начиная с элемента с номером {R}~+~1,'#13#10
+'где число {R} равно рангу процесса (0, 1,~\.). Файловые элементы нумеруются'#13#10
+'от~1; таким образом, в процессе ранга 0 требуется прочесть и вывести только'#13#10
+'начальный файловый элемент, в процессе ранга 1 \= два следующих файловых'#13#10
+'элемента, в процессе ранга 2 \= три элемента, начиная с третьего, и~т.\,д.'#13#10
+'Если файл содержит недостаточное количество элементов, то в некоторых'#13#10
+'процессах число выведенных элементов может быть меньше требуемого.'#13#10
+'Использовать один вызов коллективной функции MPI\_File\_read\_all, а также'#13#10
+'функцию MPI\_File\_seek с параметром MPI\_SEEK\_SET и функцию MPI\_File\_get\_size'#13#10
+'для определения размера исходного файла.'#13#10
+'\P\SПримечание.\s В реализации MPICH2 версии~1.3 функция MPI\_File\_read\_all'#13#10
+'не позволяет определить количество фактически считанных файловых элементов'#13#10
+'на основе информации, содержащейся в параметре типа MPI\_Status: в этом'#13#10
+'параметре количество прочитанных элементов всегда равно требуемому,'#13#10
+'а при недостаточном количестве файловых элементов в завершающую часть'#13#10
+'выходного массива записываются нулевые значения.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 3);
  m := RandomN(n, 3*n);
  case CurrentTest of
  3: m := n + RandomN(0,2);
  4: m := 2 * n + RandomN(1, 5);
  end;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x2 := 1 + 40 * (i mod 2);
    y2 := i div 2 + 1;
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 8;
    for j := 1 to i + 1 do
    if i + j <= m then
    begin
      x2 := x2 + 3;
      ResultN(a[i + j], x2, y2, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,4,3);
end;

procedure MPIIO10;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(5,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process; a sequence of {R} integers'#13+
'is given in each slave process, where {R} is the process rank (1, 2,~\.).'#13+
'Create a new file of integers with the given name and write the given'#13+
'sequences to this file in ascending order of ranks of processes containing'#13+
'these sequences. Use one call of the MPI\_File\_write\_all collective function'#13+
'(for all processes including the process 0) and also the MPI\_File\_seek'#13+
'function with the MPI\_SEEK\_SET parameter.');
  
(*TaskText(
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дан набор'#13#10
+'из {R} целых чисел, где {R} \= ранг процесса (1, 2,~\.). Создать новый файл'#13#10
+'целых чисел с указанным именем и записать в него все данные числа в порядке'#13#10
+'их следования (процессы перебираются в порядке возрастания их рангов).'#13#10
+'Использовать один вызов коллективной функции MPI\_File\_write\_all (для всех'#13#10
+'процессов, в том числе и для процесса ранга~0), а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n * (n - 1) div 2;
  for i := 1 to m do
  begin
    a[i] := RandomN(10,99);
  end;
  k := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 8;
    for j := 1 to i do
    begin
      k := k + 1;
      x1 := x1 + 3;
      DataN(a[k], x1, y1, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO11;
var
  i, j, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'In addition, an integer is given in each process. This integer is equal to 0'#13+
'or it is equal to the ordinal number of one of the existing items of the file'#13+
'(the file items are numbered from 1). Using the MPI\_Comm\_split function,'#13+
'create a new communicator containing only those processes in which a non-zero'#13+
'integer is given. Using the MPI\_File\_read\_at\_all collective function for all'#13+
'processes of this communicator, read and output a file item located'#13+
'at a position with the given ordinal number.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел.'#13#10
+'Кроме того, в каждом процессе дано целое число, равное либо~0,'#13#10
+'либо порядковому номеру одного из существующих файловых элементов'#13#10
+'(элементы нумеруются от~1). Используя функцию MPI\_Comm\_split, создать'#13#10
+'новый коммуникатор, содержащий только те процессы, в которых дано число,'#13#10
+'отличное от~0, и с помощью коллективной функции MPI\_File\_read\_at\_all'#13#10
+'прочесть и вывести в каждом процессе из этого коммуникатора элемент,'#13#10
+'расположенный в позиции с указанным порядковым номером.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(1, m);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k := k + 1;
    SetProcess(i-1);
    case k mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (k-1) div 3 + 2;
    ResultR(prc(i-1), b[k0[i]], x1, y1, 5);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO12;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0,k1: array[1..50] of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'In addition, an integer is given in each process. This integer is equal to 0'#13+
'or it is equal to the ordinal number of one of the existing items of the file'#13+
'(the file items are numbered from 1). Using the MPI\_Comm\_split function,'#13+
'create a new communicator containing only those processes in which a non-zero'#13+
'integer is given. Using the MPI\_File\_write\_at\_all collective function for all'#13+
'processes of this communicator, replace the value of the file item, that has'#13+
'the given ordinal number, by the value of the process rank in the new'#13+
'communicator (the rank should be converted to a real number).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел.'#13#10
+'Кроме того, в каждом процессе дано целое число, равное либо~0,'#13#10
+'либо порядковому номеру одного из существующих файловых элементов'#13#10
+'(элементы нумеруются от~1). Используя функцию MPI\_Comm\_split, создать'#13#10
+'новый коммуникатор, содержащий только те процессы, в которых дано число,'#13#10
+'отличное от~0, и с помощью коллективной функции MPI\_File\_write\_at\_all'#13#10
+'заменить исходное значение файлового элемента в позиции с указанным'#13#10
+'порядковым номером на значение ранга процесса в новом коммуникаторе'#13#10
+'(преобразовав ранг в вещественное число).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to m do
    k1[i] := 1;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      repeat
        k0[i] := RandomN(1, m);
      until k1[k0[i]] = 1;
      k1[k0[i]] := 0;
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  b1 := b;
  AssignFile(f, s);
  Rewrite(f);
  k := -1;
  for i := 1 to n do
    if k0[i] > 0 then
    begin
      k := k + 1;
      b1[k0[i]] := k;
    end;
  for i := 1 to m do
    write(f, b1[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO13;
var
  i, j, k1, k2, k3, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process.'#13+
'In addition, an integer is given in each process. This integer is equal to 0'#13+
'or 1. Using the MPI\_Comm\_split function, create a new communicator containing'#13+
'only those processes in which the number 1 is given. Using'#13+
'the MPI\_File\_read\_ordered collective function for all processes of this'#13+
'communicator, read and output the {R}~+~1 file item, where {R} is the process rank'#13+
'in the new communicator (items should be read in ascending order: the first'#13+
'item in the process 0, two next items in the process 1, three next items in'#13+
'the process 2, and so~on). If the file does not contain enough items, then,'#13+
'in some processes, the number {N} of output items may be less than required one'#13+
'or even may be equal to zero. In addition, output the number {N} of actually'#13+
'read items and the new value {P} of the shared file pointer in each process'#13+
'of the new communicator. Use the MPI\_Status parameter of'#13+
'the MPI\_File\_read\_ordered function to determine the number {N} of actually read'#13+
'items. Use the MPI\_File\_get\_position\_shared function to determine the current'#13+
'value of {P} (this value should be the same in all processes).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел. Кроме того,'#13#10
+'в каждом процессе дано целое число, равное либо 0, либо~1. Используя'#13#10
+'функцию MPI\_Comm\_split, создать новый коммуникатор, содержащий только'#13#10
+'те процессы, в которых дано число~1, и с помощью коллективной функции'#13#10
+'MPI\_File\_read\_ordered прочесть и вывести в каждом процессе из этого'#13#10
+'коммуникатора {R}~+~1 элемент исходного файла, где {R} \= ранг процесса'#13#10
+'в новом коммуникаторе (элементы считываются последовательно: один элемент'#13#10
+'в процессе~0, два следующих элемента \= в процессе~1, три следующих \='#13#10
+'в процессе~2, и т.\,д.). Если файл содержит недостаточное количество элементов,'#13#10
+'то в некоторых процессах число выведенных элементов {N} может быть меньше'#13#10
+'требуемого или даже равно нулю. В каждом процессе, входящем в новый'#13#10
+'коммуникатор, дополнительно вывести количество {N} фактически прочитанных'#13#10
+'элементов и новое значение {P} коллективного файлового указателя.'#13#10
+'Для определения количества прочитанных элементов {N} использовать информацию,'#13#10
+'возвращенную в параметре типа MPI\_Status функции MPI\_File\_read\_ordered,'#13#10
+'для нахождения значения {P} использовать функцию MPI\_File\_get\_position\_shared'#13#10
+'(во всех процессах значение {P} должно быть одинаковым).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  if RandomN(0,1) = 0 then
  m := RandomN(4,8)
  else
  m := RandomN(15, 20);
  case CurrentTest of
  3: m := RandomN(4,5);
  4: m := RandomN(15,20);
  end;
  for i := 1 to 20 do
    a[i] := 0;
  for i := 1 to m do
    a[i] := RandomN(10, 99);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := 1;
      k := k + 1;
    end;
  until (k > 2) and (k < 6) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k1 := 0;
  k2 := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k1 := k1 + 1;
    SetProcess(i-1);
    x2 := 14;
    y2 := k1;
    ResultComment(prc(i-1), x2, y2);
    x2 := x2 + 8;
    k3 := 0;
    for j := 1 to k1 do
    begin
      x2 := x2 + 3;
      k2 := k2 + 1;
      if a[k2] > 0 then
      begin
      k3 := k3 + 1;
      ResultN(a[k2], x2, y2, 2);
      end;
    end;
    x2 := 42;
    ResultN('N = ', k3, x2, y2, 1);
    x2 := 50;
    ResultN('P = ', k*(k+1) * 2, x2, y2, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO14;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, an integer {N}'#13+
'is given in each process. Create a new file of integers with the given name.'#13+
'Using the MPI\_Comm\_split function, create a new communicator containing only'#13+
'those processes in which a non-zero integer is given. Using'#13+
'the MPI\_File\_write\_ordered collective function for all processes of the new'#13+
'communicator, write {K} successive copies of each given integer {N} to this file,'#13+
'where {K} is the number of processes in the \Inew\i communicator. The integers {N}'#13+
'should be written to the file in the ascending order of ranks'#13+
'of processes containing these integers.');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано целое'#13#10
+'число {N}. Создать новый файл целых чисел с указанным именем. Используя функцию'#13#10
+'MPI\_Comm\_split, создать новый коммуникатор, содержащий только те процессы,'#13#10
+'в которых число {N} не равно 0, и с помощью коллективной функции'#13#10
+'MPI\_File\_write\_ordered записать в файл {K} подряд идущих копий каждого'#13#10
+'из чисел {N}, где {K} равно количеству процессов в \Iновом\i коммуникаторе, а числа'#13#10
+'располагаются в порядке возрастания рангов содержащих их процессов.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(10, 99);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  j0 := 0;
  for i := 1 to n do
    if k0[i] > 0 then
    for j := 1 to k do
    begin
      j0 := j0 + 1;
      a[j0] := k0[i];
    end;
  for i := 1 to j0 do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO15;
var
  i, j, k1, k2, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(6,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains at least {K} items, where {K} is the number of processes. Using the'#13+
'MPI\_Comm\_split function, create a new communicator containing only processes'#13+
'with odd rank (1, 3,~\.). Using one call of the MPI\_File\_seek\_shared and'#13+
'MPI\_File\_read\_ordered collective functions, read and output two file items'#13+
'at a time in each process of the new communicator: the second and the first'#13+
'item from the end (in this order) should be read and output in the process of'#13+
'the rank 1 in the MPI\_COMM\_WORLD communicator, the fourth and third item from'#13+
'the end should be read and output in the process of the rank 3, and so~on.'#13+
'\P\SNote.\s To ensure the required order of data reading in'#13+
'the MPI\_File\_read\_ordered function, you should inverse the order'#13+
'of the processes in the created communicator (in comparison with'#13+
'the processes in the MPI\_COMM\_WORLD communicator).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'не менее {K} элементов, где {K} \= количество процессов. С помощью функции'#13#10
+'MPI\_Comm\_split создать новый коммуникатор, содержащий только процессы'#13#10
+'с нечетным рангом (1, 3,~\.). Используя по одному вызову коллективных'#13#10
+'функций MPI\_File\_seek\_shared и MPI\_File\_read\_ordered, прочесть и вывести'#13#10
+'в каждом процессе из нового коммуникатора по 2 элемента исходного файла,'#13#10
+'причем предпоследний и последний файловые элементы должны считываться'#13#10
+'и выводиться (в указанном порядке) в процессе с рангом 1 в исходном'#13#10
+'коммуникаторе MPI\_COMM\_WORLD, четвертый и третий с конца элементы \='#13#10
+'в процессе с рангом 3, и т.\,д.'#13#10
+'\P\SУказание.\s Для того чтобы обеспечить требуемый порядок считывания данных'#13#10
+'в функции MPI\_File\_read\_ordered, необходимо изменить в созданном коммуникаторе'#13#10
+'порядок следования процессов на противоположный (по сравнению'#13#10
+'с исходным порядком в коммуникаторе MPI\_COMM\_WORLD).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(2*n, 2*n + 5);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to n do
    if Odd(i){RandomN(0,1) = 0} then
      k0[i] := 0
    else
    begin
      k0[i] := 1;
      k := k + 1;
    end;
  until (k > 2) and (k < 6) and (k < n);
  for i := 1 to n do
  begin
//    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
//    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k1 := m + 1;
  k2 := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k1 := k1 - 2;
    k2 := k2 + 1;
    SetProcess(i-1);
    y2 := k2;
    ResultR2(prc(i-1), b[k1], b[k1+1], 0, y2, 6);
    x2 := x2 + 8;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO16;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0,k1: array[1..50] of integer;
begin
  n := RandomN(5,8);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, an integer {N}'#13+
'(\g\,0) and {N} real numbers are given in each process. Create a new file of real'#13+
'numbers with the given name. Using the MPI\_Comm\_split function, create a new'#13+
'communicator containing only those processes in which a non-zero integer {N}'#13+
'is given. Using one call of the MPI\_File\_write\_ordered collective function'#13+
'for all processes of the new communicator, write the given real numbers'#13+
'to the file in the \Iinverse\i order: at first, all the real numbers from'#13+
'the process with the maximal rank in the communicator MPI\_COMM\_WORLD should'#13+
'be written (in inverse order), after that, all the numbers from the process'#13+
'with the previous rank, and so~on.'#13+
'\P\SNote.\s To ensure the required order of data writing'#13+
'in the MPI\_File\_write\_ordered function, you should inverse the order'#13+
'of the processes in the created communicator (in comparison with'#13+
'the processes in the MPI\_COMM\_WORLD communicator).');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано'#13#10
+'целое число {N} (\g\,0) и {N} вещественных чисел. Создать новый файл вещественных'#13#10
+'чисел с указанным именем. Используя функцию MPI\_Comm\_split, создать новый'#13#10
+'коммуникатор, содержащий только те процессы, в которых число {N} не равно~0,'#13#10
+'и с помощью единственного вызова коллективной функции MPI\_File\_write\_ordered'#13#10
+'записать в файл все вещественные числа в порядке, \Iобратном\i их следованию'#13#10
+'в наборе исходных данных: вначале записываются (в обратном порядке) все числа'#13#10
+'из процесса с наибольшим рангом в коммуникаторе MPI\_COMM\_WORLD, затем'#13#10
+'все числа из процесса с предыдущим рангом, и т.\,д.'#13#10
+'\P\SУказание.\s Для того чтобы обеспечить требуемый порядок записи данных в функции'#13#10
+'MPI\_File\_write\_ordered, необходимо изменить в созданном коммуникаторе порядок'#13#10
+'следования процессов на противоположный (по сравнению с исходным порядком'#13#10
+'в коммуникаторе MPI\_COMM\_WORLD).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(1, 9.99);
  repeat
  k := 0;
  for i := 1 to m do
    k1[i] := 1;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(1, 4);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  k := 0;
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+ 'N = ', k0[i], x1, y1, 1);
    x1 := x1 + 13;
    for j := 1 to k0[i] do
    begin
      k := k + 1;
      x1 := x1 + 5;
      DataR(b[k], x1, y1, 4);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to k do
    write(f, b[k-i+1]);
  CloseFile(f);
  ResultFileR(s,3,5);
end;

procedure MPIIO17;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(6,10);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains 2{K} items, where {K} is the number of processes. Using one call of the'#13+
'MPI\_File\_read\_all collective function (and without using the MPI\_File\_seek'#13+
'function), read and output two file items at a time in each process. The file'#13+
'items should be read and output in the order in which they are stored in'#13+
'a file. To do this, use the MPI\_File\_set\_view function to define a new file'#13+
'view with the MPI\_INT elementary datatype, the same filetype,'#13+
'and the appropriate displacement (the displacement'#13+
'will be different for different processes).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'2{K} элементов, где {K} \= количество процессов. Используя единственный вызов'#13#10
+'коллективной функции MPI\_File\_read\_all (и не применяя функцию MPI\_File\_seek),'#13#10
+'прочесть и вывести по 2 элемента в каждом процессе, перебирая элементы'#13#10
+'в порядке их следования в файле. Для этого предварительно с помощью функции'#13#10
+'MPI\_File\_set\_view определить новый вид данных с базовым типом MPI\_INT,'#13#10
+'таким же файловым типом и подходящим смещением (своим для каждого процесса).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 2*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    ResultN2(prc(i-1), a[2*i-1], a[2*i], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO18;
var
  i, j, j0, i0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains elements of the {K}~\x~5 matrix, where K is the number of processes.'#13+
'In addition, an integer {N} (1~\l~{N}~\l~5) is given in each process; this integer'#13+
'determines the ordinal number of a \Iselected\i element in some matrix row,'#13+
'namely, in the first row for the process 0, in the second row for the'#13+
'process 1, and so on (the row elements are numbered from 1). Using one call'#13+
'of the MPI\_File\_write\_at\_all collective function with the second parameter'#13+
'equal to {N}~\-~1, replace the value of the selected element in each matrix row'#13+
'by the rank of the corresponding process (the selected element in the first'#13+
'row should be replaced by 0, the selected element in the second row should be'#13+
'replaced by 1, and so~on). To do this, use the MPI\_File\_set\_view function'#13+
'to define a new file view with the MPI\_INT elementary datatype, the same'#13+
'filetype, and the appropriate displacement (the displacement'#13+
'will be different for different processes).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'элементы прямоугольной матрицы размера {K}~\x~5, где {K} \= количество процессов.'#13#10
+'Кроме того, в каждом процессе дано целое число {N} (1~\l~{N}~\l~5) \= порядковый'#13#10
+'номер \Iвыделенного\i элемента в некоторой строке матрицы (элементы в строке'#13#10
+'нумеруются от~1), причем с процессом ранга 0 связывается первая строка'#13#10
+'матрицы, с процессом ранга 1 \= вторая строка, и т.\,д. Используя единственный'#13#10
+'вызов коллективной функции MPI\_File\_write\_at\_all со вторым параметром,'#13#10
+'равным {N}~\-~1, изменить в каждой строке исходной матрицы выделенный элемент,'#13#10
+'заменив его значение на ранг связанного с ним процесса (выделенный элемент'#13#10
+'в первой строке следует заменить на 0, во второй строке \= на 1, и т.\,д.).'#13#10
+'Для этого предварительно с помощью функции MPI\_File\_set\_view определить новый'#13#10
+'вид данных с базовым типом MPI\_INT, таким же файловым типом и подходящим'#13#10
+'смещением (своим для каждого процесса).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 5*n;
  for i := 1 to n do
  begin
    k0[i] := RandomN(1,5);
  end;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+'N = ', k0[i], x1, y1, 1);
  end;
  AssignFile(f, s);
  Rewrite(f);
  k := 0;
  for i := 1 to n do
    for j := 1 to 5 do
    begin
      k := k + 1;
      i0 := i - 1;
      if j <> k0[i] then
        write(f, a[k])
      else
        write(f, i0);
    end;
  CloseFile(f);
  SetFileRow(5);
  ResultFileN(s,3,3);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO19;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0: array[1..50] of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'The file contains elements of the {K}~\x~6 matrix, where K is the number of'#13+
'processes. In addition, an integer {N} (1~\l~{N}~\l~6) is given in each process;'#13+
'this integer determines the ordinal number of a \Iselected\i element in some'#13+
'matrix row, namely, in the last row for the process 0, in the last but one row'#13+
'for the process 1, and so on (the row elements are numbered from 1). Using'#13+
'one call of the MPI\_File\_read\_at\_all collective function with the second'#13+
'parameter equal to {N}~\-~1, read and output the value of the selected row'#13+
'element in the corresponding process (the selected element in the first row'#13+
'should be output in the last process, the selected element in the second row'#13+
'should be output in the last but one process, and so~on). To do this, use'#13+
'the MPI\_File\_set\_view function to define a new file view with the MPI\_DOUBLE'#13+
'elementary datatype, the same filetype, and the appropriate displacement'#13+
'(the displacement will be different for different processes).');
  
(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего элементы прямоугольной матрицы размера {K}~\x~6, где {K} \= количество'#13#10
+'процессов. Кроме того, в каждом процессе дано целое число {N} (1~\l~{N}~\l~6) \='#13#10
+'порядковый номер \Iвыделенного\i элемента в некоторой строке матрицы (элементы'#13#10
+'в строке нумеруются от~1), причем с процессом ранга 0 связывается последняя'#13#10
+'строка матрицы, с процессом ранга 1 \= предпоследняя строка, и~т.\,д. Используя'#13#10
+'единственный вызов коллективной функции MPI\_File\_read\_at\_all со вторым'#13#10
+'параметром, равным {N}~\-~1, прочесть в каждой строке исходной матрицы выделенный'#13#10
+'элемент и вывести его значение в соответствующем процессе (выделенный элемент'#13#10
+'в первой строке следует вывести в последнем процессе, во второй строке \='#13#10
+'в предпоследнем процессе, и~т.\,д.). Для этого предварительно с помощью функции'#13#10
+'MPI\_File\_set\_view определить новый вид данных с базовым типом MPI\_DOUBLE,'#13#10
+'таким же файловым типом и подходящим смещением (своим для каждого процесса).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n * 6;
  for i := 1 to n do
  begin
    k0[i] := RandomN(1,6);
  end;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+'N = ', k0[i], x1, y1, 1);
    ResultR(prc(i-1), b[(n-i)*6+k0[i]], x1, y1, 5);

  end;
  SetFileRow(6);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO20;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, a sequence'#13+
'of {R}~+~1 real numbers is given in each process, where {R} is the process rank'#13+
'(0, 1,~\.). Create a new file of real numbers with the given name. Using'#13+
'one call of the MPI\_File\_write\_all collective function (and without using'#13+
'the MPI\_File\_seek function), write all given numbers to the file in the order'#13+
'that is inverse to the order in which they are given in processes: at first,'#13+
'the numbers from the last process (in the inverse order) should be written,'#13+
'after that, the numbers from the last but one process (in the inverse order),'#13+
'and so~on. To do this, use the MPI\_File\_set\_view function to define a new'#13+
'file view with the MPI\_DOUBLE elementary datatype, the same filetype,'#13+
'and the appropriate displacement (the displacement'#13+
'will be different for different processes).');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дан набор'#13#10
+'из {R}~+~1 вещественного числа, где {R} \= ранг процесса (0, 1,~\.). Создать'#13#10
+'новый файл вещественных чисел с указанным именем. Используя единственный вызов'#13#10
+'коллективной функции MPI\_File\_write\_all (и не применяя функцию MPI\_File\_seek),'#13#10
+'записать в файл все данные числа в порядке, обратном их следованию в исходном'#13#10
+'наборе: вначале записываются (в обратном порядке) все числа из процесса'#13#10
+'с наибольшим рангом, затем все числа из процесса с предыдущим рангом, и т.\,д.'#13#10
+'Для этого предварительно с помощью функции MPI\_File\_set\_view определить новый'#13#10
+'вид данных с базовым типом MPI\_DOUBLE, таким же файловым типом'#13#10
+'и подходящим смещением (своим для каждого процесса).'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n*(n+1) div 2;
  j0 := m;
  for i := 1 to n do
  begin
    j0 := j0 - i;
    SetProcess(i-1);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 5;
    for j := i downto 1 do
    begin
      x1 := x1 + 5;
      b[j0+ j] := RandomR(1,9.99);
      DataR('', b[j0+j], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
      write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO21;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(6,10);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains 3{K} items, where {K} is the number of processes. Read and output three'#13+
'file items, namely, {A}, {B}, {C}, in each process. These items are located in the'#13+
'given file as follows: {A}_0, {A}_1,~\., {A}_{K-1}, {B}_0, {B}_1,~\., {B}_{K-1}, {C}_0, {C}_1,~\., {C}_{K-1}'#13+
'(an index indicates the process rank). To do this, use one call of the'#13+
'MPI\_File\_read\_all collective function and a new file view with the MPI\_INT'#13+
'elementary datatype, the appropriate displacement (the displacement will be'#13+
'different for different processes), and a new filetype that consists'#13+
'of an integer and a terminal empty space of a size'#13+
'equal to the extent of {K}~\-~1 integers.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'3{K} элементов, где {K} \= количество процессов. В каждом процессе прочесть'#13#10
+'и вывести три элемента {A}, {B}, {C}, расположенных в исходном файле в следующем'#13#10
+'порядке (индекс указывает ранг процесса): {A}_0, {A}_1,~\., {A}_{K-1}, {B}_0, {B}_1,~\.,'#13#10
+'{B}_{K-1}, {C}_0, {C}_1,~\., {C}_{K-1}. Для этого использовать единственный вызов'#13#10
+'коллективной функции MPI\_File\_read\_all, предварительно определив новый'#13#10
+'файловый вид данных с базовым типом MPI\_INT, подходящим смещением'#13#10
+'(своим для каждого процесса) и новым файловым типом, состоящим'#13#10
+'из одного целочисленного элемента и завершающего пустого промежутка,'#13#10
+'размер которого равен протяженности набора из {K}~\-~1 целого числа.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 3*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 0;
    ResultN3(prc(i-1), a[i], a[n + i], a[2*n + i], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,3,3);
end;

procedure MPIIO22;
var
  i, j, j0, i0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, three integers,'#13+
'namely, {A}, {B}, {C}, are given in each process. The number of processes is equal'#13+
'to {K}. Create a new file of integers with the given name and write the given'#13+
'integers to this file as follows: {A}_{K-1}, {A}_{K-2},~\., {A}_0, {B}_{K-1}, {B}_{K-2},~\., {B}_0,'#13+
'{C}_{K-1}, {C}_{K-2},~\., {C}_0 (an index indicates the process rank). To do this,'#13+
'use one call of the MPI\_File\_write\_all collective function and a new file'#13+
'view with the MPI\_INT elementary datatype, the appropriate displacement'#13+
'(the displacement will be different for different processes), and a new'#13+
'filetype that consists of an integer and a terminal empty space'#13+
'of a size equal to the extent of {K}~\-~1 integers.');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано'#13#10
+'по 3 целых числа: {A}, {B}, {C}. Количество процессов равно {K}. Создать новый файл'#13#10
+'целых чисел с указанным именем и записать в него исходные числа в следующем'#13#10
+'порядке (индекс указывает ранг процесса): {A}_{K-1}, {A}_{K-2},~\., {A}_0, {B}_{K-1},'#13#10
+'{B}_{K-2},~\., {B}_0, {C}_{K-1}, {C}_{K-2},~\., {C}_0. Для этого использовать единственный вызов'#13#10
+'коллективной функции MPI\_File\_write\_all, предварительно определив новый'#13#10
+'файловый вид данных с базовым типом MPI\_INT, подходящим смещением'#13#10
+'(своим для каждого процесса) и новым файловым типом, состоящим'#13#10
+'из одного целочисленного элемента и завершающего пустого промежутка,'#13#10
+'размер которого равен протяженности набора из {K}~\-~1 целого числа.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 3*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN3(prc(i-1), a[n-i+1], a[2*n - i + 1], a[3*n - i + 1], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO23;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'The file contains 6{K} items, where {K} is the number of processes. Read and'#13+
'output six file items, namely, {A}, {B}, {C}, {D}, {E}, {F}, in each process. These items'#13+
'are located in the given file as follows: {A}_0, {B}_0, {C}_0, {A}_1, {B}_1, {C}_1,~\., {A}_{K-1},'#13+
'{B}_{K-1}, {C}_{K-1}, {D}_0, {E}_0, {F}_0, {D}_1, {E}_1, {F}_1,~\., {D}_{K-1}, {E}_{K-1}, {F}_{K-1} (an index indicates'#13+
'the process rank). To do this, use one call of the MPI\_File\_read\_all'#13+
'collective function and a new file view with the MPI\_DOUBLE elementary'#13+
'datatype, the appropriate displacement (the displacement will be different'#13+
'for different processes), and a new filetype that consists of three real'#13+
'numbers and a terminal empty space of the appropriate size.');

(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего 6{K} элементов, где {K} \= количество процессов. В каждом процессе'#13#10
+'прочесть и вывести шесть элементов {A}, {B}, {C}, {D}, {E}, {F}, расположенных в исходном'#13#10
+'файле в следующем порядке (индекс указывает ранг процесса): {A}_0, {B}_0, {C}_0, {A}_1,'#13#10
+'{B}_1, {C}_1,~\., {A}_{K-1}, {B}_{K-1}, {C}_{K-1}, {D}_0, {E}_0, {F}_0, {D}_1, {E}_1, {F}_1,~\., {D}_{K-1}, {E}_{K-1}, {F}_{K-1}.'#13#10
+'Для этого использовать единственный вызов коллективной функции'#13#10
+'MPI\_File\_read\_all, предварительно определив новый файловый вид данных'#13#10
+'с базовым типом MPI\_DOUBLE, подходящим смещением (своим для каждого процесса)'#13#10
+'и новым файловым типом, состоящим из трех вещественных элементов'#13#10
+'и завершающего пустого промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 6*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 17;//1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := i;//(i+1) div 2 + 0;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 - 7;
    for j := 0 to 1 do
    begin
    x1 := x1 + 18;
    ResultR3(b[3*i-2+j*3*n], b[3*i-1+j*3*n], b[3*i+j*3*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,3,6);
end;

procedure MPIIO24;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, four real'#13+
'numbers, namely, {A}, {B}, {C}, {D}, are given in each process. The number'#13+
'of processes is equal to {K}. Create a new file of real numbers with the given'#13+
'name and write the given real numbers to this file as follows:'#13+
'{A}_{K-1}, {B}_{K-1}, {A}_{K-2}, {B}_{K-2},~\., {A}_0, {B}_0, {C}_{K-1}, {D}_{K-1}, {C}_{K-2}, {D}_{K-2},~\., {C}_0, {D}_0'#13+
'(an index indicates the process rank). To do this, use one call'#13+
'of the MPI\_File\_write\_all collective function and a new file view'#13+
'with the MPI\_DOUBLE elementary datatype, the appropriate displacement'#13+
'(the displacement will be different for different processes), and a new'#13+
'filetype that consists of two real numbers and a terminal'#13+
'empty space of the appropriate size.');

(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано'#13#10
+'по 4 вещественных числа: {A}, {B}, {C}, {D}. Количество процессов равно {K}. Создать'#13#10
+'новый файл вещественных чисел с указанным именем и записать в него исходные'#13#10
+'числа в следующем порядке (индекс указывает ранг процесса): {A}_{K-1}, {B}_{K-1}, {A}_{K-2},'#13#10
+'{B}_{K-2},~\., {A}_0, {B}_0, {C}_{K-1}, {D}_{K-1}, {C}_{K-2}, {D}_{K-2},~\., {C}_0, {D}_0. Для этого использовать'#13#10
+'единственный вызов коллективной функции MPI\_File\_write\_all, предварительно'#13#10
+'определив новый файловый вид данных с базовым типом MPI\_DOUBLE, подходящим'#13#10
+'смещением (своим для каждого процесса) и новым файловым типом,'#13#10
+'состоящим из двух вещественных элементов и завершающего пустого'#13#10
+'промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 4*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 - 1;
    for j := 0 to 1 do
    begin
    x1 := x1 + 12;
    DataR2(b[2*(n-i+1)-1+j*2*n], b[2*(n-i+1)+j*2*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO25;
var
  i, j, j0, j1, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, 3\*({R}\,+\,1) integers'#13+
'are given in the process of rank {R} ({R}~=~0, 1,~\., {K}~\-~1, where {K} is the'#13+
'number of processes): 3 integers, namely, {A}, {B}, {C}, are given in the process 0,'#13+
'6 integers, namely, {A}, {A}’, {B}, {B}’, {C}, {C}’, are given in the process 1,'#13+
'9 integers, namely, {A}, {A}’, {A}’’, {B}, {B}’, {B}’’, {C}, {C}’, {C}’’, are given'#13+
'in the process 2, and so~on. Create a new file of real numbers with the given'#13+
'name and write the given integers to this file as follows: {A}_0, {A}_1, {A}’_1,'#13+
'{A}_2, {A}’_2, {A}’’_2,~\., {B}_0, {B}_1, {B}’_1, {B}_2, {B}’_2, {B}’’_2,~\. (an index indicates'#13+
'the process rank). To do this, use one call of the MPI\_File\_write\_all'#13+
'collective function and a new file view with the MPI\_INT elementary datatype,'#13+
'the appropriate displacement (the displacement will be different for different'#13+
'processes), and a new filetype that consists of {R}~+~1 integers'#13+
'and a terminal empty space of the appropriate size.');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в процессе ранга {R}'#13#10
+'({R}~=~0, 1,~\., {K}~\-~1, где {K} \= количество процессов) дано 3\*({R}~+~1) целых'#13#10
+'чисел: в процессе 0 даны 3 числа {A}, {B}, {C}, в процессе 1 \= 6 чисел {A}, {A}’, {B}, {B}’,'#13#10
+'{C}, {C}’, в процессе 2 \= 9 чисел {A}, {A}’, {A}’’, {B}, {B}’, {B}’’, {C}, {C}’, {C}’’, и т.\,д.'#13#10
+'Создать новый файл целых чисел с указанным именем и записать в него исходные'#13#10
+'числа в следующем порядке (индекс указывает ранг процесса): {A}_0, {A}_1, {A}’_1, {A}_2,'#13#10
+'{A}’_2, {A}’’_2,~\., {B}_0, {B}_1, {B}’_1, {B}_2, {B}’_2, {B}’’_2,~\.~. Для этого использовать'#13#10
+'единственный вызов коллективной функции MPI\_File\_write\_all, предварительно'#13#10
+'определив новый файловый вид данных с базовым типом MPI\_INT, подходящим'#13#10
+'смещением (своим для каждого процесса) и новым файловым типом'#13#10
+'(своим для каждого процесса), состоящим из {R}~+~1 целого элемента'#13#10
+'и завершающего пустого промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 1, 1);
  m := (3*n + 3)*n div 2;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  k := (1 + n)*n div 2;
  for i := 1 to 3 do
  begin
    SetProcess(i-1);
    case i of
    1: x1 := 41;
    2: x1 := 1;
    3: x1 := 41;
    end;
//    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    if i = 1 then y1 := 1
    else
      y1 := 2;//(i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 7;
    j0 := (i-1)*i div 2;
    for j1 := 1 to 3 do
      for j := 1 to i do
      begin
      x1 := x1 + 3;
      DataN(a[j0 + (j1-1)*k + j], x1, y1, 3);
      end;
  end;
  for i := 4 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := i-1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 7;
    j0 := (i-1)*i div 2;
    for j1 := 1 to 3 do
      for j := 1 to i do
      begin
      x1 := x1 + 3;
      DataN(a[j0 + (j1-1)*k + j], x1, y1, 3);
      end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  SetFileRow(k);
  ResultFileN(s,3,3);
end;

procedure MPIIO26;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, four real'#13+
'numbers, namely, {A}, {B}, {C}, {D}, are given in each process. The number'#13+
'of processes is equal to {K}. Create a new file of real numbers with the given'#13+
'name and write the given real numbers to this file as follows:'#13+
'{A}_0, {A}_1,~\., {A}_{K-1}, {B}_{K-1},~\., {B}_1, {B}_0, {C}_0, {C}_1,~\., {C}_{K-1}, {D}_{K-1},~\., {D}_0'#13+
'(an index indicates the process rank). To do this, use one call'#13+
'of the MPI\_File\_write\_all collective function and a new file view'#13+
'with the MPI\_DOUBLE elementary datatype, the appropriate displacement'#13+
'(the displacement will be different for different processes), and a new'#13+
'filetype that consists of two real numbers (with an additional'#13+
'empty space between these numbers) and a terminal'#13+
'empty space of the appropriate size.');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано'#13#10
+'по 4 вещественных числа: {A}, {B}, {C}, {D}. Количество процессов равно {K}. Создать'#13#10
+'новый файл вещественных чисел с указанным именем и записать в него исходные'#13#10
+'числа в следующем порядке (индекс указывает ранг процесса): {A}_0, {A}_1,~\., {A}_{K-1},'#13#10
+'{B}_{K-1},~\., {B}_1, {B}_0, {C}_0, {C}_1,~\., {C}_{K-1}, {D}_{K-1},~\., {D}_0. Для этого'#13#10
+'использовать единственный вызов коллективной функции MPI\_File\_write\_all,'#13#10
+'предварительно определив новый файловый вид данных с базовым типом MPI\_DOUBLE,'#13#10
+'подходящим смещением (своим для каждого процесса) и новым файловым типом,'#13#10
+'состоящим из двух вещественных элементов (с дополнительным пустым промежутком'#13#10
+'между этими элементами) и завершающего пустого промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 4*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 - 1;
    for j := 0 to 1 do
    begin
    x1 := x1 + 12;
    DataR2(b[i+j*2*n], b[2*n-i+1+j*2*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  ResultFileR(s,3,6);
end;

procedure MPIIO27;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := 2*RandomN(2,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of real numbers is given in the master process.'#13+
'The file contains elements of the ({K}/2)~\x~{K} matrix, where {K} is the number'#13+
'of processes ({K} is an even number). Read and output elements of ({R}\,+\,1)th matrix'#13+
'column in the process of rank {R} ({R}~=~0,~\., {K}~\-~1, columns are numbered'#13+
'from~1). To do this, use one call of the MPI\_File\_read\_all collective function'#13+
'and a new file view with the MPI\_DOUBLE elementary datatype, the appropriate'#13+
'displacement (the displacement will be different for different processes),'#13+
'and a new filetype that consists of one real number and a terminal'#13+
'empty space of the appropriate size.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего элементы прямоугольной матрицы размера ({K}/2)~\x~{K},'#13#10
+'где {K} \= количество процессов (четное число). В процессе ранга {R},'#13#10
+'{R}~=~0,~\., {K}~\-~1, прочесть и вывести элементы столбца исходной матрицы'#13#10
+'с номером {R}~+~1 (столбцы нумеруются от~1). Для этого использовать единственный'#13#10
+'вызов функции MPI\_File\_read\_all, предварительно определив новый файловый вид'#13#10
+'данных с базовым типом MPI\_DOUBLE, подходящим смещением (своим для каждого'#13#10
+'процесса) и новым файловым типом, состоящим из вещественного элемента'#13#10
+'и завершающего пустого промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  k := n div 2;
  m := n*k;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to k do
    begin
    x1 := x1 + 5;
    ResultR(b[i + (j-1)*n], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  DataFileR(s,3,6);
end;

procedure MPIIO28;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  p: array[1..50] of integer;
begin
  n := 2*RandomN(2,4);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file is given in the master process. In addition, an integer {N}'#13+
'and a sequence of {K}/2 real numbers are given in each process, where {K} is the'#13+
'number of processes ({K} is an even number). The numbers {N} are different for all'#13+
'processes and are in the range from 1 to {K}. Create a new file of real numbers'#13+
'with the given name. Write a ({K}/2)~\x~{K} matrix to this file; each process'#13+
'should write its sequence of real numbers into a column of the matrix with'#13+
'the ordinal number {N} (the columns are numbered from 1). To do this, use one'#13+
'call of the MPI\_File\_write\_all collective function and a new file view with'#13+
'the MPI\_DOUBLE elementary datatype, the appropriate displacement'#13+
'(the displacement will be different for different processes), and'#13+
'a new filetype that consists of one real number and a terminal'#13+
'empty space of the appropriate size.');
  
(*TaskText(
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано целое'#13#10
+'число {N} и {K}/2 вещественных чисел, где {K} \= количество процессов (четное число).'#13#10
+'Числа {N} для всех процессов различны и лежат в диапазоне от 1 до {K}. Создать'#13#10
+'новый файл вещественных чисел с указанным именем и записать в него матрицу'#13#10
+'размера ({K}/2)~\x~{K}, причем каждый процесс должен записать свой набор'#13#10
+'вещественных чисел в столбец матрицы с порядковым номером {N} (столбцы'#13#10
+'нумеруются от~1). Для этого использовать единственный вызов коллективной'#13#10
+'функции MPI\_File\_write\_all, предварительно определив новый файловый вид данных'#13#10
+'с базовым типом MPI\_DOUBLE, подходящим смещением (своим для каждого процесса)'#13#10
+'и новым файловым типом, состоящим из вещественного элемента'#13#10
+'и завершающего пустого промежутка подходящего размера.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  k := n div 2;
  m := n*k;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n do
    p[i] := i;
  for i := 1 to 2 * n do
    SwapN(p[RandomN(1, n)], p[RandomN(1, n)]);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 11;
    DataN('N = ', p[i], x1, y1, 1);
    x1 := x1 + 1;
    for j := 1 to k do
    begin
    x1 := x1 + 5;
    DataR(b[p[i] + (j-1)*n], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  ResultFileR(s,3,6);
end;

procedure MPIIO29;
var
  i, j, j0, j1, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  c: array[1..250] of integer;
begin
  n := 3*RandomN(1,3);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of existing file of integers is given in the master process. The file'#13+
'contains elements of a block matrix of the size ({K}/3)~\x~3 (the size is'#13+
'indicated in blocks), where {K} is the number of processes ({K} is a multiple'#13+
'of~3). Each block is a square matrix of order {N} (all the numbers {N} are the'#13+
'same and are in the range from 2 to~5). Read and output one block of the given'#13+
'matrix in each process in a row-major order of blocks. To do this, use one'#13+
'call of the MPI\_File\_read\_all collective function and a new file view with the'#13+
'MPI\_INT elementary datatype, the appropriate displacement (the displacement'#13+
'will be different for different processes), and a new filetype that consists'#13+
'of {N} integers and a terminal empty space of the appropriate size. Use the'#13+
'MPI\_File\_get\_size function to determine the number {N}.');
  
(*TaskText(
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'элементы блочной прямоугольной матрицы. Размер матрицы в блоках'#13#10
+'равен ({K}/3)~\x~3, где {K} \= количество процессов (число {K} кратно~3).'#13#10
+'Каждый блок представляет собой квадратную матрицу порядка {N} (значение {N}'#13#10
+'может лежать в диапазоне от 2 до 5). В каждом процессе требуется прочесть'#13#10
+'и вывести один блок исходной матрицы, перебирая блоки по строкам. Для этого'#13#10
+'использовать единственный вызов функции MPI\_File\_read\_all, предварительно'#13#10
+'определив новый файловый вид данных с базовым типом MPI\_INT, подходящим'#13#10
+'смещением (своим для каждого процесса) и новым файловым типом, состоящим'#13#10
+'из {N} целочисленных элементов и завершающего пустого промежутка подходящего'#13#10
+'размера. Для определения числа {N} использовать размер исходного файла,'#13#10
+'получив его с помощью функции MPI\_File\_get\_size.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);

  k := RandomN(2,5);
  if n = 9 then
    k := RandomN(2,4);
  m := n*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case (i-1) div 3 of
    0: y1 := 0;
    1: y1 := k+1;
    2: y1 := 2*(k+1);
    end;
    for j := 0 to k do
    begin
      y1 := y1 + 1;
      case i mod 3 of
      1: begin x1 := 1;  j1 := 0; end;
      2: begin x1 := 29; j1 := 1; end;
      0: begin x1 := 57; j1 := 2; end;
      end;
      if j = 0 then
      begin
        ResultComment(prc(i-1), x1, y1);
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        ResultN(c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3], x1, y1, 2);
      end;
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, c[i]);
  CloseFile(f);
  SetFileRow(3*k);
  DataFileN(s,3,3);
end;

procedure MPIIO30;
var
  i, j, j0, j1, j2, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  c: array[1..250] of integer;
  p: array[1..9] of integer;
begin
  n := 3*RandomN(1,3);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The name of file and an integer {N} are given in the master process ({N} is in the'#13+
'range 2 to~5). In addition, two integers {I} and {J} are given in each process.'#13+
'The integers {I} and {J} determine a position (that is, row and column numbers)'#13+
'of some square block of a block matrix of the size ({K}/3)~\x~3 (the size is'#13+
'indicated in blocks), where {K} is the number of processes ({K} is a multiple'#13+
'of~3). The integers {I} are in the range of 1 to {K}/3, the integers {J} are in the'#13+
'range 1 to 3; all processes contain different positions of blocks. Each block'#13+
'is a square matrix of order {N}. Create a new file of integers with the given'#13+
'name. Write a ({K}/3)~\x~3 block matrix to this file; each process should write'#13+
'a matrix block to the block position ({I},~{J}). All the elements of the block'#13+
'written by the process of rank {R} ({R}~=~0, 1,~\., {K}~\-~1) should be equal to the'#13+
'number {R}. To do this, use one call of the MPI\_File\_write\_all collective'#13+
'function and a new file view with the MPI\_INT elementary datatype,'#13+
'the appropriate displacement (the displacement will be different for different'#13+
'processes), and a new filetype that consists of {N} integers and a terminal'#13+
'empty space of the appropriate size. Use the MPI\_Bcast collective function'#13+
'to send the value of {N} to all processes.');
  
(*TaskText(
 'В главном процессе дано имя файла и число {N}, которое может лежать в диапазоне'#13#10
+'от 2 до 5. Кроме того, в каждом процессе даны два целых числа {I} и {J},'#13#10
+'определяющие позицию (номер строки и столбца) некоторого квадратного блока'#13#10
+'блочной прямоугольной матрицы размера ({K}/3)~\x~3 блоков, где {K} \= количество'#13#10
+'процессов (число {K} кратно~3). Значения {I} лежат в диапазоне от 1 до {K}/3,'#13#10
+'значения {J} лежат в диапазоне от 1 до 3; все процессы содержат различные'#13#10
+'позиции блоков. Каждый блок представляет собой квадратную матрицу целых чисел'#13#10
+'порядка {N}. Создать новый файл целых чисел с указанным именем и записать в него'#13#10
+'блочную матрицу размера ({K}/3)~\x~3, причем каждый процесс должен записать'#13#10
+'в матрицу блок в позиции ({I},~{J}), а все элементы блока, записанного процессом'#13#10
+'ранга {R} ({R}~=~0, 1,~\., {K}~\-~1), должны быть равны числу {R}. Для этого'#13#10
+'использовать единственный вызов функции MPI\_File\_write\_all, предварительно'#13#10
+'определив новый файловый вид данных с базовым типом MPI\_INT, подходящим'#13#10
+'смещением (своим для каждого процесса) и новым файловым типом, состоящим'#13#10
+'из {N} целочисленных элементов и завершающего пустого промежутка подходящего'#13#10
+'размера. Для передачи значения {N} во все процессы'#13#10
+'использовать коллективную функцию MPI\_Bcast.'
);*)
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 25, 1);
  k := RandomN(2,5);
  if n = 9 then
    k := RandomN(2,4);
  SetProcess(0);
  DataN('N = ', k, 50, 1, 1);
  m := n*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to n do
    p[i] := i;
  for i := 1 to 2 * n do
    SwapN(p[RandomN(1, n)], p[RandomN(1, n)]);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case (i-1) div 3 of
    0: y1 := 2;
    1: y1 := 3;
    2: y1 := 4;
    end;
    for j := 0 to k do
    begin
//      y1 := y1 + 2;
      case i mod 3 of
      1: begin x1 := 1;  j1 := 0; end;
      2: begin x1 := 28; j1 := 1; end;
      0: begin x1 := 55; j1 := 2; end;
      end;
      if j = 0 then
      begin
        DataComment(prc(i-1), x1, y1);
//        DataN(' K = ', p[i]-1{k}, x1+2, y1+1, 1);
        DataN('I = ', (p[i]-1) div 3 + 1, x1+12, y1, 1);
        DataN('J = ', (p[i]-1) mod 3 + 1, x1+19, y1, 1);
        for j0 := 1 to n do
          if p[j0] = i then
          begin
            j2 := j0;
            break;
          end;
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        //ResultN(c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3], x1, y1, 2);
        c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3] := j2 - 1;
      end;
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, c[i]);
  CloseFile(f);
  SetFileRow(3*k);
  ResultFileN(s,3,3);
end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: MPIIO1;
  2: MPIIO2;
  3: MPIIO3;
  4: MPIIO4;
  5: MPIIO5;
  6: MPIIO6;
  7: MPIIO7;
  8: MPIIO8;
  9: MPIIO9;
  10: MPIIO10;
  11: MPIIO11;
  12: MPIIO12;
  13: MPIIO13;
  14: MPIIO14;
  15: MPIIO15;
  16: MPIIO16;
  17: MPIIO17;
  18: MPIIO18;
  19: MPIIO19;
  20: MPIIO20;
  21: MPIIO21;
  22: MPIIO22;
  23: MPIIO23;
  24: MPIIO24;
  25: MPIIO25;
  26: MPIIO26;
  27: MPIIO27;
  28: MPIIO28;
  29: MPIIO29;
  30: MPIIO30;
  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI6File', 'Parallel file input-output (MPI-2)',
    'M. E. Abramyan, 2017', 'sddwertfghklbfdgfgd', 30, InitTask);
end;

// exports inittaskgroup;  //---------------------------------

begin
end.
