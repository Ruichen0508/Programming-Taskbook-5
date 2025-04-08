{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI6File_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  alphabet = '0123456789abcdefghijklmnopqrstuvwxyz';
  prcname = 'Процесс %d: ';
  title1 = 'Локальный файловый ввод-вывод';
  title2 = 'Коллективный файловый ввод-вывод';
  title3 = 'Настройка вида файловых данных';


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
);
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
 'В главном процессе дано имя файла. В каждом из подчиненных процессов'#13#10
+'дано количество пар целых чисел и сами пары, в которых первый член равен'#13#10
+'порядковому номеру файлового элемента, а второй \= значению этого файлового'#13#10
+'элемента (элементы нумеруются от~1, все номера различны и принимают все'#13#10
+'значения от 1 до некоторого целого числа). Создать новый файл целых чисел'#13#10
+'с указанным именем и записать в него данные элементы, используя в каждом'#13#10
+'подчиненном процессе требуемое количество вызовов'#13#10
+'локальной функции MPI\_File\_write\_at.'
);
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
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего элементы прямоугольной матрицы размера {K}~\x~{N}, где {K} \= число'#13#10
+'подчиненных процессов. В каждом подчиненном процессе прочесть и вывести'#13#10
+'элементы {R}-й строки матрицы, где {R} \= ранг подчиненного процесса (строки'#13#10
+'нумеруются от~1), используя один вызов локальной функции MPI\_File\_read\_at.'#13#10
+'Для определения размера файла использовать функцию MPI\_File\_get\_size.'
);
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
 'В главном процессе дано имя файла, в каждом из подчиненных процессов'#13#10
+'дано {R} вещественных чисел, где {R} \= ранг процесса. Создать новый файл'#13#10
+'вещественных чисел с указанным именем и записать в него данные элементы'#13#10
+'в порядке возрастания рангов содержащих их процессов. Использовать в каждом'#13#10
+'подчиненном процессе один вызов локальной функции MPI\_File\_write\_at.'
);
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
);
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
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дано'#13#10
+'целое число. Создать новый файл целых чисел с указанным именем и записать'#13#10
+'в него {K} подряд идущих копий каждого числа, где {K} равно количеству'#13#10
+'подчиненных процессов. Порядок следования чисел в файле должен быть обратным'#13#10
+'порядку подчиненных процессов ({K} копий числа из процесса 1 должны находиться'#13#10
+'в конце файла, перед ними должны располагаться {K} копий числа из процесса 2,'#13#10
+'и~т.\,д.). Использовать в каждом подчиненном процессе один вызов локальной'#13#10
+'функции MPI\_File\_write, а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);
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
);
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
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дано'#13#10
+'вещественное число. Создать новый файл вещественных чисел с указанным именем'#13#10
+'и записать в него {R} подряд идущих копий каждого числа, где {R} равно рангу'#13#10
+'процесса, в котором дано это число. Порядок следования чисел в файле должен'#13#10
+'быть \Iобратным\i порядку подчиненных процессов (в конце файла должно находиться'#13#10
+'единственное число из процесса~1, перед ним должны располагаться две копии'#13#10
+'числа из процесса~2, и т.\,д.). Использовать в каждом подчиненном процессе'#13#10
+'один вызов локальной функции MPI\_File\_write, а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);
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
);
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
 'В главном процессе дано имя файла, в каждом из подчиненных процессов дан набор'#13#10
+'из {R} целых чисел, где {R} \= ранг процесса (1, 2,~\.). Создать новый файл'#13#10
+'целых чисел с указанным именем и записать в него все данные числа в порядке'#13#10
+'их следования (процессы перебираются в порядке возрастания их рангов).'#13#10
+'Использовать один вызов коллективной функции MPI\_File\_write\_all (для всех'#13#10
+'процессов, в том числе и для процесса ранга~0), а также функцию MPI\_File\_seek'#13#10
+'с параметром MPI\_SEEK\_SET.'
);
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
 'В главном процессе дано имя существующего файла вещественных чисел.'#13#10
+'Кроме того, в каждом процессе дано целое число, равное либо~0,'#13#10
+'либо порядковому номеру одного из существующих файловых элементов'#13#10
+'(элементы нумеруются от~1). Используя функцию MPI\_Comm\_split, создать'#13#10
+'новый коммуникатор, содержащий только те процессы, в которых дано число,'#13#10
+'отличное от~0, и с помощью коллективной функции MPI\_File\_read\_at\_all'#13#10
+'прочесть и вывести в каждом процессе из этого коммуникатора элемент,'#13#10
+'расположенный в позиции с указанным порядковым номером.'
);
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
 'В главном процессе дано имя существующего файла вещественных чисел.'#13#10
+'Кроме того, в каждом процессе дано целое число, равное либо~0,'#13#10
+'либо порядковому номеру одного из существующих файловых элементов'#13#10
+'(элементы нумеруются от~1). Используя функцию MPI\_Comm\_split, создать'#13#10
+'новый коммуникатор, содержащий только те процессы, в которых дано число,'#13#10
+'отличное от~0, и с помощью коллективной функции MPI\_File\_write\_at\_all'#13#10
+'заменить исходное значение файлового элемента в позиции с указанным'#13#10
+'порядковым номером на значение ранга процесса в новом коммуникаторе'#13#10
+'(преобразовав ранг в вещественное число).'
);
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
);
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
 'В главном процессе дано имя файла. Кроме того, в каждом процессе дано целое'#13#10
+'число {N}. Создать новый файл целых чисел с указанным именем. Используя функцию'#13#10
+'MPI\_Comm\_split, создать новый коммуникатор, содержащий только те процессы,'#13#10
+'в которых число {N} не равно 0, и с помощью коллективной функции'#13#10
+'MPI\_File\_write\_ordered записать в файл {K} подряд идущих копий каждого'#13#10
+'из чисел {N}, где {K} равно количеству процессов в \Iновом\i коммуникаторе, а числа'#13#10
+'располагаются в порядке возрастания рангов содержащих их процессов.'
);
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
);
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
);
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
 'В главном процессе дано имя существующего файла целых чисел, содержащего'#13#10
+'2{K} элементов, где {K} \= количество процессов. Используя единственный вызов'#13#10
+'коллективной функции MPI\_File\_read\_all (и не применяя функцию MPI\_File\_seek),'#13#10
+'прочесть и вывести по 2 элемента в каждом процессе, перебирая элементы'#13#10
+'в порядке их следования в файле. Для этого предварительно с помощью функции'#13#10
+'MPI\_File\_set\_view определить новый вид данных с базовым типом MPI\_INT,'#13#10
+'таким же файловым типом и подходящим смещением (своим для каждого процесса).'
);
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
);
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
);
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
);
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
);
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
);
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
);
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
);
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
);
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
);
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
 'В главном процессе дано имя существующего файла вещественных чисел,'#13#10
+'содержащего элементы прямоугольной матрицы размера ({K}/2)~\x~{K},'#13#10
+'где {K} \= количество процессов (четное число). В процессе ранга {R},'#13#10
+'{R}~=~0,~\., {K}~\-~1, прочесть и вывести элементы столбца исходной матрицы'#13#10
+'с номером {R}~+~1 (столбцы нумеруются от~1). Для этого использовать единственный'#13#10
+'вызов функции MPI\_File\_read\_all, предварительно определив новый файловый вид'#13#10
+'данных с базовым типом MPI\_DOUBLE, подходящим смещением (своим для каждого'#13#10
+'процесса) и новым файловым типом, состоящим из вещественного элемента'#13#10
+'и завершающего пустого промежутка подходящего размера.'
);
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
);
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
);
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
);
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
  CreateGroup('MPI6File', 'Параллельный ввод-вывод файловых данных (MPI-2)',
    'М. Э. Абрамян, 2017', 'sddwertfghklbfdgfgd', 30, InitTask);
end;

//  exports inittaskgroup;  //----------------------------

begin
end.
