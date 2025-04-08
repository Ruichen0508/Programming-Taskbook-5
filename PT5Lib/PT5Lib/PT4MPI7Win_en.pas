{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI7Win_en;

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
  title1 = 'One-sided communications with the simplest synchronization';
  title2 = 'Additional types of synchronization';
//  title3 = 'Настройка вида данных для файлового ввода-вывода';


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

function PrcLong(n, nmax: integer): string;
begin
  result := Format(prcname, [n]);
  if (nmax > 9) and (n < 10) then
    result := result + ' ';
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure SwapR(var a,b: real);
var c: real;
begin
  c := a;
  a := b;
  b := c;
end;

var a: array[1..64] of integer;
    b, b1: array[1..64] of real;
    n, m, k: integer;

procedure MPIWin1;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An integer is given in each slave process. Create an access window of the'#13+
'size {K} of integers in the master process ({K} is the number of slave processes).'#13+
'Using the MPI\_Put function call in the slave processes, send all the given'#13+
'integers to the master process and output received integers in the ascending'#13+
'order of ranks of sending processes.');
(*
TaskText(
 'В каждом из подчиненных процессов дано одно целое число. В главном процессе'#13#10
+'определить окно доступа размера {K} целых чисел ({K} \= количество подчиненных'#13#10
+'процессов) и, используя функцию MPI\_Put в подчиненных процессах, записать'#13#10
+'в главный процесс все исходные числа, после чего вывести эти числа в порядке'#13#10
+'возрастания рангов переславших их процессов.'
);
*)
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    a[i] := RandomN(10,99);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2;
    DataN(prc(i), a[i], x1, y1, 2);
    end;
  SetProcess(0);
  ResultComment(prc(0),1,3);
  x2 := 13;
  y2 := 3;
  for i := 1 to n - 1 do
  begin
    ResultN(a[i], x2, y2, 2);
    x2 := x2 + 4;
  end;

end;

procedure MPIWin2;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'A sequence of {R} real numbers is given in each slave process, where {R} is'#13+
'the process rank (1, 2,~\.). Create an access window of the appropriate size'#13+
'in the master process. Using the MPI\_Put function call in the slave processes,'#13+
'send all the given real numbers to the master process and output received'#13+
'numbers in the ascending order of ranks of sending processes.');
(*
TaskText(
 'В каждом из подчиненных процессов дано {R} вещественных чисел, где {R} \= ранг'#13#10
+'процесса (1, 2,~\.). В главном процессе определить окно доступа подходящего'#13#10
+'размера и, используя функцию MPI\_Put в подчиненных процессах, записать'#13#10
+'в главный процесс все исходные числа, после чего вывести эти числа в порядке'#13#10
+'возрастания рангов переславших их процессов.'
);
*)
  k0 := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2;
    if i = 8 then
    begin
      x1 := 1;
      y1 := 5;
    end;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i do
    begin
      k0 := k0 + 1;
      b[k0] := RandomR(1,9.99);
      x1 := x1 + 5;
      DataR(b[k0], x1, y1, 5);
    end;
  end;
  SetProcess(0);
  ResultComment(prc(0),1,2);
  x2 := 12;
  y2 := 2;
  for i := 1 to k0 do
  begin
    ResultR(b[i], x2, y2, 2);
    x2 := x2 + 5;
    if x2 > 75 then
    begin
      x2 := 12;
      y2 := y2 + 1;
    end;
  end;

end;

procedure MPIWin3;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} integers is given in the master process, where {K} is'#13+
'the number of slave processes. Create an access window containing the array {A}'#13+
'in the master process. Using the MPI\_Get function call in the slave processes,'#13+
'receive and output one element of the array {A} in each slave process. Elements'#13+
'of the array {A} should be received in the slave processes in descending order'#13+
'of their indices (that is, the element {A}_0 should be received'#13+
'in the last process, the element {A}_1 should be received'#13+
'in the last but one process, and so~on).');
(*
TaskText(
 'В главном процессе дан массив {A} из {K} целых чисел, где {K} \= количество'#13#10
+'подчиненных процессов. Определить в главном процессе окно доступа, содержащее'#13#10
+'массив {A}, и, используя функцию MPI\_Get в подчиненных процессах, получить'#13#10
+'и вывести в них по одному элементу массива {A}, перебирая элементы с конца'#13#10
+'(элемент {A}_0 получить в последнем процессе, {A}_1 в предпоследнем, и~т.\,д.).'
);
*)
  for i := 1 to n - 1 do
    a[i] := RandomN(10,99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    ResultN(prc(i), a[n-i], x1, y1, 2);
    end;
  SetProcess(0);
  DataComment(prc(0),1,3);
  x2 := 13;
  y2 := 3;
  for i := 1 to n - 1 do
  begin
    DataN(a[i], x2, y2, 2);
    x2 := x2 + 4;
  end;

end;

procedure MPIWin4;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K}~+~4 real numbers is given in the master process, where {K} is'#13+
'the number of slave processes. Create an access window containing the array {A}'#13+
'in the master process. Using the MPI\_Get function call in the slave processes,'#13+
'receive and output five elements of the array {A} in each slave process'#13+
'starting with the element of index {R}~\-~1, where {R} is'#13+
'the slave process rank ({R}~=~1, 2,~\., {K}~\-~1).');
(*
TaskText(
 'В главном процессе дан массив {A} из {K}~+~4 вещественных чисел, где {K} \='#13#10
+'количество подчиненных процессов. Определить в главном процессе окно доступа,'#13#10
+'содержащее массив {A}, и, используя функцию MPI\_Get в подчиненных процессах,'#13#10
+'получить и вывести в них по пять элементов массива {A}, начиная с элемента'#13#10
+'с индексом {R}~\-~1, где {R} \= ранг подчиненного процесса ({R}~=~1, 2,~\., {K}~\-~1).'
);
*)
  for i := 1 to 3 + n do
    b[i] := RandomR(1,9.99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;

    y1 := (i+1) div 2;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 6;
    for j := i to i + 4 do
    begin
    x1 := x1 + 5;
    ResultR(b[j], x1, y1, 5);
    end;
    end;
  SetProcess(0);
  DataComment(prc(0),1,3);
  x2 := 12;
  y2 := 3;
  for i := 1 to 3 + n do
  begin
    DataR(b[i], x2, y2, 5);
    x2 := x2 + 5;
  end;

end;

procedure MPIWin5;
var
  i, j, x1, x2, y1, y2: integer;
  k0, k1, a1: array [1..20] of integer;
  f: boolean;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} integers is given in the master process, where {K} is the number'#13+
'of slave processes. In addition, an index {N} (an integer in the range 0'#13+
'to {K}~\-~1) and an integer {B} are given in each slave process. Create an access'#13+
'window containing the array {A} in the master process. Using the MPI\_Accumulate'#13+
'function call in the slave processes, multiply the element {A}_{N} by the number {B}'#13+
'and then output the modified array {A} in the master process.'#13+
'\P\SNote.\s Some slave processes can contain the same value of {N}; in this case'#13+
'the element {A}_{N} will be multiplied several times. This circumstance does not'#13+
'require additional synchronization due to the features'#13+
'of the MPI\_Accumulate function implementation.');
(*
TaskText(
 'В главном процессе дан массив {A} из {K} целых чисел, где {K} \= количество'#13#10
+'подчиненных процессов. В каждом подчиненном процессе дан индекс {N}'#13#10
+'(число от 0 до {K}~\-~1) и целое число {B}. В главном процессе определить окно'#13#10
+'доступа, содержащее массив {A}, и, используя функцию MPI\_Accumulate в каждом'#13#10
+'подчиненном процессе, умножить элемент {A}_N на число {B}, после чего вывести'#13#10
+'в главном процессе измененный массив {A}.'#13#10
+'\P\SПримечание.\s Некоторые подчиненные процессы могут содержать совпадающие'#13#10
+'значения {N}; в этом случае элемент {A}_N должен умножаться на несколько чисел.'#13#10
+'Данное обстоятельство не требует дополнительных действий по синхронизации'#13#10
+'в силу особенностей реализации функции MPI\_Accumulate.'
);
*)

  x2 := 9;
  y2 := 1;
  DataComment(prc(0),x2,1);
  x2 := x2 + 8;
  for i := 1 to n - 1 do
  begin
    x2 := x2 + 4;
    a[i] := RandomN(1,20);
    DataN(a[i], x2, y2, 3);
  end;
  repeat
  for i := 1 to n - 1 do
  begin
    k0[i] := RandomN(0, n-2);
    k1[i] := RandomN(2, 8);
    a1[i] := a[i];
  end;
  f := true;
  for i := 1 to n - 1 do
  begin
    a1[k0[i]+1] := a1[k0[i]+1] * k1[i];
    if a1[k0[i]+1] > 999 then
    begin
      f := false;
      break;
    end;
  end;
  until f;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 9 + 39 * ((i+1) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i+1) div 2 + 1;
    DataN(prc(i)+' N = ', k0[i], x1, y1, 1);
    DataN('B = ', k1[i], x1+19, y1, 1);
    end;
//    DataComment(prc(i)+' K = 1  B = 2', xLeft, 6);
//    DataComment(prc(i)+' K = 1  B = 2', xRight, 6);

  SetProcess(0);
  x2 := 9;
  y2 := 1;
  ResultComment(prc(0),x2,1);
  x2 := x2 + 8;
  for i := 1 to n - 1 do
  begin
    x2 := x2 + 4;
    ResultN(a1[i], x2, y2, 3);
  end;



end;

procedure MPIWin6;
var
  i, j, k0, x1, x2, y1, y2: integer;
  b0: real;
begin
  n := RandomN(4,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 2{K}~\-~1 real numbers is given in the master process ({K} is the'#13+
'number of slave processes), and array {B} of {R} real numbers is given in each'#13+
'slave process ({R} is the process rank, {R}~=~1, 2,~\., {K}~\-~1). Create an access'#13+
'window containing the array {A} in the master process. Using the MPI\_Accumulate'#13+
'function call in the slave processes, add the values of all the elements'#13+
'of array {B} from the process of rank {R} to the elements of array {A} starting with'#13+
'the index {R}~\-~1 (the single element {B}_0 from the process 1 should be added'#13+
'to the element {A}_0, the elements {B}_0 and {B}_1 from the process 2 should be added'#13+
'to the elements {A}_1 and {A}_2 respectively, the elements {B}_0, {B}_1, and {B}_2 from'#13+
'the process 3 should be added to elements {A}_2, {A}_3, and {A}_4 respectively,'#13+
'and so~on). Output the modified array {A} in the master process.'#13+
'\P\SNote.\s Elements of array {A}, starting from the index 2, will be modified several'#13+
'times by adding values from the different slave processes. This circumstance'#13+
'does not require additional synchronization due to the features'#13+
'of the MPI\_Accumulate function implementation.');
(*
TaskText(
 'В главном процессе дан вещественный массив {A} размера 2{K}~\-~1 ({K} \= количество'#13#10
+'подчиненных процессов), в каждом подчиненном процессе дан вещественный'#13#10
+'массив {B} размера {R}, где {R} \= ранг процесса (1, 2,~\., {K}~\-~1). В главном'#13#10
+'процессе определить окно доступа, содержащее массив {A}, и, используя функцию'#13#10
+'MPI\_Accumulate в каждом подчиненном процессе, прибавить к элементам массива {A},'#13#10
+'начиная с индекса {R}~\-~1, значения всех элементов массива {B} из процесса'#13#10
+'ранга {R}, после чего вывести в главном процессе измененный массив {A}'#13#10
+'(единственный элемент {B}_0 из процесса 1 прибавляется к элементу {A}_0, элементы {B}_0'#13#10
+'и {B}_1 из процесса 2 прибавляются соответственно к элементам {A}_1 и {A}_2,'#13#10
+'элементы {B}_0, {B}_1 и {B}_2 из процесса 3 прибавляются соответственно'#13#10
+'к элементам {A}_2, {A}_3 и {A}_4, и~т.\,д.).'#13#10
+'\P\SПримечание.\s К элементам массива {A}, начиная с индекса 2, потребуется прибавлять'#13#10
+'несколько значений из разных подчиненных процессов. Данное обстоятельство'#13#10
+'не требует дополнительных действий по синхронизации в силу особенностей'#13#10
+'реализации функции MPI\_Accumulate.'
);
*)
  SetProcess(0);
  DataComment(prc(0),1,1);
  x2 := 12;
  y2 := 1;
  for i := 1 to 2*n-3 do
  begin
    b[i] := RandomR(10,50);
    DataR(b[i], x2, y2, 5);
    x2 := x2 + 6;
//    if x2 > 75 then
//    begin
//      x2 := 12;
//      y2 := y2 + 1;
//    end;
  end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i do
    begin
      b0 := RandomR(1,9.99);
      x1 := x1 + 5;
      DataR(b0, x1, y1, 5);
      b[i+j-1] := b[i+j-1] + b0;
    end;
  end;
  SetProcess(0);
  ResultComment(prc(0),1,2);
  x2 := 12;
  y2 := 2;
  for i := 1 to 2*n-3 do
  begin
    ResultR(b[i], x2, y2, 5);
    x2 := x2 + 6;
//    if x2 > 75 then
//    begin
//      x2 := 12;
//      y2 := y2 + 1;
//    end;
  end;

end;


procedure MPIWin7;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := 9;//RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 2{K} integers is given in the master process, where {K} is the'#13+
'number of slave processes. Create an access window containing two integers'#13+
'in each slave process. Using the MPI\_Put function call in the master process,'#13+
'send and output two elements of the array {A} in each slave process. Elements'#13+
'of the array {A} should be sent to slave processes in ascending order of their'#13+
'indices (that is, the elements {A}_0 and {A}_1 should be sent to the process 1,'#13+
'the elements {A}_2 and {A}_3 should be sent to the process 2, and so~on).');
(*
TaskText(
 'В главном процессе дан массив {A} из 2{K} целых чисел, где {K} \= количество'#13#10
+'подчиненных процессов. Во всех подчиненных процессах определить окно доступа'#13#10
+'из двух целых чисел и, используя несколько вызовов функции MPI\_Put в главном'#13#10
+'процессе, записать и вывести в каждом подчиненном процессе по два элемента'#13#10
+'из массива {A}, перебирая их в исходном порядке (элементы {A}_0 и {A}_1 надо вывести'#13#10
+'в процессе 1, элементы {A}_2 и {A}_3 \= в процессе 2, и~т.\,д.).'
);
*)
  for i := 1 to 2*n - 2 do
    a[i] := RandomN(10,99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    ResultN2(prc(i), a[2*i-1], a[2*i], x1, y1, 3);
    end;
  SetProcess(0);
  DataComment(prc(0),1,3);
  x2 := 13;
  y2 := 3;
  for i := 1 to 2*n - 2 do
  begin
    DataN(a[i], x2, y2, 2);
    x2 := x2 + 4;
  end;

end;

procedure MPIWin8;
var
  i, j, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An integer {R} and a real number B are given in each process. All the integers {R}'#13+
'are different and are in the range from 0 to {K}~\-~1, where {K} is the number of'#13+
'processes. Create an access window containing one real number in each process.'#13+
'Using the MPI\_Put function call in each process, send the number B from this'#13+
'process to the process {R} and output received numbers in all processes.');
(*
TaskText(
 'В каждом процессе дано целое число {R} и вещественное число {B}. Все числа {R}'#13#10
+'различны и лежат в диапазоне от 0 до {K}~\-~1, где {K} \= количество процессов.'#13#10
+'Во всех процессах определить окно доступа из одного вещественного числа и,'#13#10
+'используя функцию MPI\_Put в каждом процессе, переслать число {B} из этого'#13#10
+'процесса в процесс {R}, после чего вывести полученные числа во всех процессах.'
);
*)

  for i := 1 to n do
  begin
    a[i] := i-1;
    b[i] := RandomR(10,99.99);
  end;
  for i := 1 to 2 * n do
    SwapN(a[RandomN(1, n)], a[RandomN(1, n)]);

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 7 + 39 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    DataN(prc(i)+' R = ', a[i+1], x1, y1, 1);
    DataR('B = ', b[a[i+1]+1], x1+19, y1, 5);
  end;
//    DataComment(prc(2)+' K = 1  B = 21.11', xLeft, 6);
//    DataComment(prc(2)+' K = 1  B = 21.11', xRight, 6);

  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 9 + 39 * ((i) mod 2);
    if not Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i) div 2 + 1;
    ResultR(prc(i), b[i+1], x1, y1, 1);
  end;



end;

procedure MPIWin9;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of integer;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} integers is given in each process, where {K} is the number of'#13+
'processes. Create an access window containing the array {A} in each process.'#13+
'Using several calls of the MPI\_Get function in each process {R} ({R}~=~0,~\.,'#13+
'{K}~\-~1), receive and output elements of all arrays {A} with the index {R}. Received'#13+
'elements should be output in descending order of ranks of sending processes'#13+
'(that is, the element received from the process {K}\,\-\,1 should be output first,'#13+
'the element received from the process {K}\,\-\,2 should be output second, and so~on).'#13+
'\P\SNote.\s The function MPI\_Get, as well as other one-way communication functions,'#13+
'can also be used to access the window created in the calling process.');
(*
TaskText(
 'В каждом процессе дан массив {A} из {K} целых чисел, где {K} \= количество процессов.'#13#10
+'Во всех процессах определить окно доступа, содержащее массив {A}, и, используя'#13#10
+'несколько вызовов функции MPI\_Get в каждом процессе {R} ({R}~=~0,~\., {K}~\-~1),'#13#10
+'получить и вывести элементы всех массивов {A} с индексом {R}, перебирая'#13#10
+'эти элементы в порядке убывания рангов содержащих их процессов'#13#10
+'(вначале выводится элемент, полученный из процесса ранга {K}~\-~1,'#13#10
+'затем элемент из процесса ранга {K}~\-~2, и~т.\,д.).'#13#10
+'\P\SПримечание.\s Функцию MPI\_Get, как и другие функции, обеспечивающие'#13#10
+'односторонние коммуникации, можно использовать и для доступа к окну,'#13#10
+'определенному в вызывающем процессе.'
);
*)

  for i := 1 to n do
  for j := 1 to n do
    c[i,j] := RandomN(10,99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    DataN(c[i+1,j], x1, y1, 2);
    x1 := x1 + 3;
    end;
    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    ResultN(c[n-j+1,i+1], x1, y1, 2);
    x1 := x1 + 3;
    end;
  end;

end;

procedure MPIWin10;
var
  i, j, k1, k2, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of real;
begin
  n := RandomN(5,10);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 3 real numbers and integers {N}_1 and {N}_2 are given in each process.'#13+
'Each of the numbers {N}_1 and {N}_2 is in the range 0 to 2. Create an access window'#13+
'containing the array {A} in each process. Using two calls of the MPI\_Get'#13+
'function in each process, receive and output the element of index {N}_1 from'#13+
'the array {A} of the previous process and then receive and output the element'#13+
'of index {N}_2 from the array {A} of the next process (the numbers {N}_1 and {N}_2 are'#13+
'taken from the calling process, processes are taken in a cyclic order).');
(*
TaskText(
 'В каждом процессе дан массив {A} из 3 вещественных чисел и целые числа {N}_1 и {N}_2,'#13#10
+'каждое из которых лежит в диапазоне от 0 до 2. Во всех процессах определить'#13#10
+'окно доступа, содержащее массив {A}, и, используя по два вызова функции MPI\_Get'#13#10
+'в каждом процессе, получить из предыдущего процесса элемент его массива {A}'#13#10
+'с индексом {N}_1, а из последующего процесса \= элемент с индексом {N}_2 (числа {N}_1'#13#10
+'и {N}_2 берутся из вызывающего процесса, процессы перебираются циклически).'#13#10
+'Вывести в каждом процессе полученные числа в указанном порядке.'
);
*)
  for i := 1 to n do
  for j := 1 to 3 do
    c[i,j] := RandomR(1,9.99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to 3 do
    begin
    DataR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
    k1 := RandomN(0,2);
    k2 := RandomN(0,2);
    DataN('N_1=', k1, x1+1, y1, 1);
    DataN('N_2=', k2, x1+7, y1, 1);
//    x1 := 1 + 40 * ((i) mod 2);
    if not Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i) div 2 + 1;
    ResultR2(prc(i), c[(i+n-1) mod n + 1, k1+1],
      c[(i+1) mod n + 1, k2+1], x1, y1, 5);
  end;

end;

procedure MPIWin11;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of integer;
begin
  n := 2*RandomN(3,5);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An array {A} of {K}/2 integers is'#13+
'given in each process. Create an access window containing the array {A} in all'#13+
'the odd-rank processes (1, 3,~\., {K}~\-~1). Using the required number of calls'#13+
'of the MPI\_Accumulate function in each even-rank process, add the element {A}[{I}]'#13+
'of the process 2{J} to the element {A}[{J}] of the process 2{I}~+~1 and output'#13+
'the changed arrays {A} in all the odd-rank processes.'#13+
'\P\SNote.\s The required changing of the given arrays can be described in'#13+
'the another way: if {B} denotes a matrix of order {K}/2 whose rows coincide'#13+
'with the arrays {A} given in the even-rank processes and {C} denotes a matrix'#13+
'of the same order whose rows coincide with the arrays {A} given'#13+
'in the odd-rank processes then the matrix {C} should be transformed as follows:'#13+
'elements of the row {I} of the matrix {B} should be added to the corresponding'#13+
'elements of the column {I} of the matrix {C}.');
(*
TaskText(
 'Количество процессов {K} \= четное число. В каждом процессе дан массив {A}'#13#10
+'из {K}/2 целых чисел. Во всех процессах нечетного ранга (1, 3,~\., {K}~\-~1)'#13#10
+'определить окно доступа, содержащее массив {A}, и, используя требуемое число'#13#10
+'вызовов функции MPI\_Accumulate в каждом процессе четного ранга, добавить'#13#10
+'элемент {A}[{I}] из процесса ранга 2{J} к элементу {A}[{J}] из процесса ранга 2{I}~+~1'#13#10
+'({I}, {J}~=~0,~\., {K}/2~\-~1) и вывести измененные массивы {A} во всех процессах'#13#10
+'нечетного ранга.'#13#10
+'\P\SУказание.\s Требуемое преобразование можно описать по-другому: если через {B}'#13#10
+'обозначить матрицу порядка {K}/2, строки которой совпадают с массивами {A}'#13#10
+'из процессов четного ранга, а через {C} \= матрицу того же порядка,'#13#10
+'строки которой совпадают с массивами {A} из процессов нечетного ранга,'#13#10
+'то преобразование состоит в прибавлении к {I}-му столбцу матрицы {C}'#13#10
+'соответствующих элементов {I}-й строки матрицы {B}.'
);
*)
  for i := 1 to n do
  for j := 1 to n div 2 do
    c[i,j] := RandomN(10,99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n div 2 do
    begin
    DataN(c[i+1,j], x1, y1, 2);
    x1 := x1 + 3;
    end;
  end;
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i+1);
    x1 := 29 - 2 * (n div 2 - 3);//1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := i+1;
    ResultComment(prc(2*i+1), x1, y1);
    x1 := x1 + 11;
    for j := 0 to n div 2 - 1 do
    begin
    ResultN(c[2*j+1,i+1] + c[2*(i+1),j+1], x1, y1, 3);
    x1 := x1 + 4;
    end;
  end;

end;

procedure MPIWin12;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of integer;
begin
  n := 2*RandomN(3,5);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'Solve the \1 task by creating access windows in even-rank processes'#13+
'and using the MPI\_Get function calls instead of the MPI\_Accumulate'#13+
'function calls in odd-rank processes.'#13+
'\P\SNote.\s Since the numbers received from the even-rank processes must be added'#13+
'to the elements of array {A} after the second MPI\_Win\_fence synchronization'#13+
'function call, it is convenient to use an auxiliary array'#13+
'to store the received numbers.');
(*
TaskText(
 'Решить задачу \1, определив окна доступа в процессах четного ранга'#13#10
+'и используя вместо функций MPI\_Accumulate функции MPI\_Get в процессах'#13#10
+'нечетного ранга.'#13#10
+'\P\SУказание.\s Поскольку числа, полученные из процессов четного ранга, необходимо'#13#10
+'добавлять к элементам массива {A} после вызова функции синхронизации'#13#10
+'MPI\_Win\_fence, удобно использовать вспомогательный массив'#13#10
+'для хранения полученных чисел.'
);
*)
  for i := 1 to n do
  for j := 1 to n div 2 do
    c[i,j] := RandomN(10,99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n div 2 do
    begin
    DataN(c[i+1,j], x1, y1, 2);
    x1 := x1 + 3;
    end;
  end;
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i+1);
    x1 := 29 - 2 * (n div 2 - 3);//1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := i+1;
    ResultComment(prc(2*i+1), x1, y1);
    x1 := x1 + 11;
    for j := 0 to n div 2 - 1 do
    begin
    ResultN(c[2*j+1,i+1] + c[2*(i+1),j+1], x1, y1, 3);
    x1 := x1 + 4;
    end;
  end;

end;


procedure MPIWin13;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[1..10,1..10] of real;
  k: array[1..10,1..3] of integer;
  f: boolean;
begin
  n := RandomN(4,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'Three integers {N}_1, {N}_2, {N}_3 are given in each process; each given integer is'#13+
'in the range 0 to {K}~\-~1, where {K} is the number of processes (the values'#13+
'of some of these integers in each process may coincide). In addition,'#13+
'an array {A} of {R}~+~1 real numbers is given in each process, where {R} is the'#13+
'process rank  (0,~\., {K}~\-~1). Create an access window containing the array {A}'#13+
'in all the processes. Using three calls of the MPI\_Accumulate function in each'#13+
'process, add the integer {R}~+~1 to all elements of the arrays {A} given in the'#13+
'processes {N}_1, {N}_2, {N}_3, where {R} is the rank of the process that calls'#13+
'the MPI\_Accumulate function (for instance, if the number {N}_1 in the process 3'#13+
'is equal to 2 then a real number 4.0 should be added to all the elements'#13+
'of array {A} in the process 2). If some of the integers {N}_1, {N}_2, {N}_3 coincide'#13+
'in the process {R} then the number {R}~+~1 should be added to the elements'#13+
'of the corresponding arrays several times. Output the changed'#13+
'arrays {A} in each process.');
(*
TaskText(
 'В каждом процессе даны три целых числа {N}_1, {N}_2, {N}_3, каждое из которых лежит'#13#10
+'в диапазоне от 0 до {K}~\-~1, где {K} \= количество процессов (значения некоторых'#13#10
+'из этих чисел в каждом процессе могут совпадать). Кроме того, в каждом'#13#10
+'процессе дан массив {A} вещественных чисел размера {R}~+~1, где {R} \= ранг процесса'#13#10
+'(0,~\., {K}~\-~1). Во всех процессах определить окно доступа, содержащее'#13#10
+'массив {A}, и, используя по три вызова функции MPI\_Accumulate в каждом процессе,'#13#10
+'добавить ко всем элементам массива {A} в процессах рангов {N}_1, {N}_2 и {N}_3'#13#10
+'вещественное число, равное {R}~+~1, где {R} \= ранг процесса, вызвавшего функции'#13#10
+'MPI\_Accumulate (например, если число {N}_1 в процессе ранга 3 равно 2, то ко всем'#13#10
+'элементам массива {A} из процесса 2 надо добавить вещественное число 4.0).'#13#10
+'Если некоторые из чисел {N}_1, {N}_2, {N}_3 в процессе {R} совпадают, то числа {R}~+~1'#13#10
+'надо добавлять к элементам соответствующих массивов несколько раз.'#13#10
+'Вывести измененные массивы {A} в каждом процессе.'
);
*)
  repeat
    for i := 1 to n do
    begin
      for j := 1 to 3 do
        k[i,j] := RandomN(0, n-1);
      if (k[i,1]=k[i,2]) or (k[i,2]=k[i,3]) or (k[i,1]=k[i,3]) then
        f := true;
    end;
  until f;
  k0 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i) mod 2);
    y1 := (i) div 2 + 1;
    if i >= 4 then
    begin
      x1 := 1;
      y1 := i-1;
    end;
    DataN3(prc(i), k[i+1,1], k[i+1,2], k[i+1,3], x1, y1, 2);
    x1 := x1 + 13;
    for j := 1 to i+1 do
    begin
      c[i+1, j] := RandomR(1,9.99);
      x1 := x1 + 5;
      DataR(c[i+1, j], x1, y1, 5);
    end;
  end;
  for i := 0 to n-1 do
    for j := 1 to 3 do
      for k0 := 1 to k[i+1, j]+ 1 do
        c[k[i+1, j]+1, k0] := c[k[i+1, j]+1, k0] + (i+1);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i) mod 2);
    y1 := (i) div 2 + 1;
    if i >= 4 then
    begin
      x1 := 1;
      y1 := i-1;
    end;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i+1 do
    begin
      x1 := x1 + 6;
      ResultR(c[i+1, j], x1, y1, 6);
    end;
  end;

end;


procedure MPIWin14;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An array of {K} real numbers is given in each process, where {K} is the number'#13+
'of processes. The given array contains a row of an upper triangular matrix {A},'#13+
'including its zero-valued part (the process of rank {R} contains the {R}th row'#13+
'of the matrix, the rows are numbered from 0). Create an access window'#13+
'containing the given array in all the processes. Using the required number'#13+
'of calls of the MPI\_Get function in each process, write the rows of the matrix'#13+
'transposed to the given matrix {A} (including its zero-valued part)'#13+
'in the given arrays. Then output the changed arrays in each process.'#13+
'Do not use auxiliary arrays.'#13+
'\P\SNotes.\s (1)~The rows of the transposed matrix coincide with the columns of the'#13+
'original matrix, so the resulting matrix will be the lower triangular one.'#13+
'(2)~You should write zero values to the required array elements only after'#13+
'the second call of the MPI\_Win\_fence function.'#13+
'(3)~You can not create an access window for the last process.');
(*
TaskText(
 'В каждом процессе дан массив вещественных чисел размера {K} ({K} \= количество'#13#10
+'процессов), содержащий строку верхнетреугольной матрицы {A}, включая ее'#13#10
+'начальную нулевую часть (процесс ранга {R} содержит {R}-ю строку матрицы'#13#10
+'в предположении, что строки нумеруются от~0). Во всех процессах определить'#13#10
+'окно доступа, содержащее исходный массив, и, используя требуемое количество'#13#10
+'вызовов функции MPI\_Get в каждом процессе, записать в эти массивы'#13#10
+'(и затем вывести) строки матрицы, транспонированной к исходной матрице {A},'#13#10
+'включая ее завершающую нулевую часть. Вспомогательные массивы не использовать.'#13#10
+'\P\SУказания.\s (1)~Строки транспонированной матрицы совпадают со столбцами исходной'#13#10
+'матрицы, таким образом, полученная матрица будет нижнетреугольной.'#13#10
+'(2)~Обнулять требуемые элементы массивов перед их выводом необходимо после'#13#10
+'второго вызова функции MPI\_Win\_fence.'#13#10
+'(3)~Окно доступа для последнего процесса можно не создавать.'
);
*)
  for i := 1 to n do
  for j := 1 to n do
    c[i,j] := 0;
  for i := 1 to n do
  for j := i to n do
    c[i,j] := RandomR(1,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    DataR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;
//    DataComment('----------------------------------------', 0, 7);
  for i := 1 to n do
    for j := i + 1 to n do
      swapR(c[i,j], c[j,i]);

  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    ResultR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;

end;

procedure MPIWin15;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'Solve the \1 task by using the MPI\_Put function calls instead'#13+
'of the MPI\_Get function calls. \P\SNote.\s In this case, you can not'#13+
'create an access window for the master process.');
(*
TaskText(
 'Решить задачу \1, используя вместо вызовов функций MPI\_Get'#13#10
+'вызовы функций MPI\_Put.'#13#10
+'\P\SУказание.\s В данном случае можно не создавать окно доступа'#13#10
+'для главного процесса.'
);
*)
  for i := 1 to n do
  for j := 1 to n do
    c[i,j] := 0;
  for i := 1 to n do
  for j := i to n do
    c[i,j] := RandomR(1,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    DataR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;
//    DataComment('----------------------------------------', 0, 7);
  for i := 1 to n do
    for j := i + 1 to n do
      swapR(c[i,j], c[j,i]);

  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    ResultR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;

end;

procedure MPIWin16;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'One row of the square real-valued matrix {A} of order {K} is given in each'#13+
'process, where {K} is the number of processes (the process of rank {R} contains'#13+
'the {R}th row of the matrix, the rows are numbered from 0). In addition, a real'#13+
'number {B} is given in each process. Create an access window containing'#13+
'the given row of the matrix {A} in all the processes. Using the required number'#13+
'of calls of the MPI\_Accumulate function in each process {R} ({R}~=~0,~\., {K}~\-~1),'#13+
'change the matrix row given in the next process as follows: all row elements'#13+
'that are less than the number {B} from the process {R} should be replaced by this'#13+
'number {B} (processes are taken in a cyclic order). Then, using {K} calls'#13+
'of the MPI\_Get function in each process, receive and output the {R}th column'#13+
'of the transformed matrix {A} in the process {R} ({R}~=~0,~\., {K}~\-~1, the columns'#13+
'are numbered from 0). \P\SNote.\s You should call the MPI\_Win\_fence synchronization'#13+
'function \Ithree times\i in each process.');
(*
TaskText(
 'В каждом процессе дана одна строка вещественной квадратной матрицы {A}'#13#10
+'порядка {K}, где {K} \= количество процессов (процесс ранга {R} содержит {R}-ю строку'#13#10
+'матрицы в предположении, что строки нумеруются от~0). Кроме того, в каждом'#13#10
+'процессе дано вещественное число {B}. Во всех процессах определить окно доступа,'#13#10
+'содержащее строку матрицы {A}, и, используя требуемое число вызовов функции'#13#10
+'MPI\_Accumulate в каждом процессе ранга {R} ({R}~=~0,~\., {K}~\-~1), заменить'#13#10
+'в строке матрицы из следующего процесса все элементы, меньшие числа {B}'#13#10
+'из процесса {R}, на это число (процессы перебираются циклически). Затем,'#13#10
+'используя {K} вызовов функции MPI\_Get в каждом процессе, получить и вывести'#13#10
+'столбец преобразованной матрицы {A} с номером, совпадающим с рангом процесса'#13#10
+'(столбцы также нумеруются от~0).'#13#10
+'\P\SУказание.\s При выполнении этого задания в каждом процессе необходимо \Iтрижды\i'#13#10
+'вызывать функцию синхронизации MPI\_Win\_fence.'
);
*)
  for i := 1 to n do
  begin
    for j := 1 to n do
      c[i,j] := RandomR(1,9.99);
    b[i] := RandomR(1,9.99);
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    DataR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
    DataR('B = ', b[i+1], x1+2, y1, 4);

  end;
//    DataComment('----------------------------------------', 0, 7);
  for i := 1 to n do
    for j := 1 to n do
      if c[i mod n + 1, j] < b[i] then
         c[i mod n + 1, j] := b[i];

  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    ResultR(c[j,i+1], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;

end;


procedure MPIWin17;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..20,1..20] of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'One row of the square real-valued matrix {A} of order {K} is given in each'#13+
'process, where {K} is the number of processes (the process of rank {R} contains'#13+
'the {R}th row of the matrix, the rows are numbered from 0). In addition, a real'#13+
'number {B} is given in each process. Create an access window containing'#13+
'the given row of the matrix {A} in all the processes. Using the required number'#13+
'of calls of the MPI\_Accumulate function in each process {R} ({R}~=~0,~\., {K}~\-~1),'#13+
'change the matrix row given in the previous process as follows: all row'#13+
'elements that are greater than the number {B} from the process {R} should be'#13+
'replaced by this number {B} (processes are taken in a cyclic order). Then,'#13+
'using {K} calls of the MPI\_Accumulate function in each slave process, add'#13+
'the first element of the row from each slave process {R} (1,~\., {K}~\-~1) to all'#13+
'the elements of the {R}th column of the transformed matrix {A} (the columns are'#13+
'numbered from 0). Output the new contents of the given row of the matrix {A}'#13+
'in each process after all transformations. \P\SNote.\s You should call'#13+
'the MPI\_Win\_fence synchronization function \Ithree times\i in each process.');
(*
TaskText(
 'В каждом процессе дана одна строка вещественной квадратной матрицы {A}'#13#10
+'порядка {K}, где {K} \= количество процессов (процесс ранга {R} содержит {R}-ю строку'#13#10
+'матрицы в предположении, что строки нумеруются от~0). Кроме того, в каждом'#13#10
+'процессе дано вещественное число {B}. Во всех процессах определить окно доступа,'#13#10
+'содержащее строку матрицы {A}, и, используя требуемое число вызовов функции'#13#10
+'MPI\_Accumulate в каждом процессе ранга {R} ({R}~=~0,~\., {K}~\-~1), заменить'#13#10
+'в строке матрицы из предыдущего процесса все элементы, большие числа {B}'#13#10
+'из процесса {R}, на это число (процессы перебираются циклически). Затем,'#13#10
+'используя {K} вызовов функции MPI\_Accumulate в каждом подчиненном процессе,'#13#10
+'добавить начальный элемент строки из каждого подчиненного процесса ранга {R}'#13#10
+'(1,~\., {K}~\-~1) ко всем элементам столбца преобразованной матрицы {A}'#13#10
+'с номером {R} (столбцы также нумеруются от 0). После всех описанных'#13#10
+'преобразований вывести в каждом процессе новое содержимое'#13#10
+'соответствующей строки матрицы {A}.'#13#10
+'\P\SУказание.\s При выполнении этого задания в каждом процессе необходимо \Iтрижды\i'#13#10
+'вызывать функцию синхронизации MPI\_Win\_fence.'
);
*)
  for i := 1 to n do
  begin
    for j := 1 to n do
      c[i,j] := RandomR(1,4.95);
    b[i] := RandomR(1,4.95);
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    DataR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
    DataR('B = ', b[i+1], x1+2, y1, 4);

  end;
//    DataComment('----------------------------------------', 0, 7);
  for i := 1 to n do
    for j := 1 to n do
      if c[(i+n-2) mod n + 1, j] > b[i] then
         c[(i+n-2)  mod n + 1, j] := b[i];
  for i := 1 to n do
    for j := 2 to n do
      c[i,j] := c[i,j] + c[j,1];
  for i := 0 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 20+5*(6-n) div 2;
    y1 := i + 1;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 11;
    for j := 1 to n do
    begin
    ResultR(c[i+1,j], x1, y1, 4);
    x1 := x1 + 5;
    end;
  end;

end;

procedure MPIWin18;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := 2*RandomN(3,5);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {A} is given in each'#13+
'even-rank process (0, 2,~\., {K}~\-~2). Create an access window containing one'#13+
'integer in all the odd-rank processes (1, 3,~\., {K}~\-~1). Using the MPI\_Put'#13+
'function call in each even-rank process 2{N}, send the integer {A} to the'#13+
'process 2{N}~+~1 and output the received integers. Use the MPI\_Win\_start and'#13+
'MPI\_Win\_complete synchronization functions in the even-rank processes and the'#13+
'MPI\_Win\_post and MPI\_Win\_wait synchronization functions in the odd-rank'#13+
'processes. Use the MPI\_Group\_incl function to create a group of processes'#13+
'specified as the first parameter of the MPI\_Win\_start and MPI\_Win\_post'#13+
'functions. The MPI\_Group\_incl function should be applied to the group'#13+
'of the MPI\_COMM\_WORLD communicator (use the MPI\_Comm\_group function'#13+
'to obtain the group of the MPI\_COMM\_WORLD communicator).'#13+
'\P\SNote.\s Unlike the MPI\_Win\_fence \Icollective\i synchronization function, used'#13+
'in previous tasks, the synchronization functions used in this and'#13+
'the subsequent tasks are \Ilocal\i ones and, in addition, allow to specify'#13+
'the groups of origin and target processes for one-way communications.');
(*
TaskText(
 'Количество процессов {K} \= четное число. В каждом процессе четного ранга'#13#10
+'(0, 2,~\., {K}~\-~2) дано целое число {A}. Во всех процессах нечетного ранга'#13#10
+'(1, 3,~\., {K}~\-~1) определить окно доступа из одного целого числа и, используя'#13#10
+'функцию MPI\_Put в каждом процессе четного ранга 2{N}, переслать число {A}'#13#10
+'в процесс ранга 2{N}~+~1 и вывести его в этом процессе. Для синхронизации'#13#10
+'использовать функции MPI\_Win\_start и MPI\_Win\_complete в процессах четного'#13#10
+'ранга и функции MPI\_Win\_post и MPI\_Win\_wait в процессах нечетного ранга;'#13#10
+'для создания группы процессов, указываемой в качестве первого параметра'#13#10
+'функций MPI\_Win\_start и MPI\_Win\_post, использовать функцию MPI\_Group\_incl,'#13#10
+'применив ее к группе, полученной из коммуникатора MPI\_COMM\_WORLD'#13#10
+'(с помощью функции MPI\_Comm\_group).'#13#10
+'\P\SПримечание.\s В отличие от \Iколлективной\i функции MPI\_Win\_fence,'#13#10
+'использовавшейся в предыдущих заданиях данной группы, синхронизирующие'#13#10
+'функции, используемые в этом и последующих заданиях, являются \Iлокальными\i'#13#10
+'и, кроме того, позволяют явным образом определить группы инициирующих (origin)'#13#10
+'и целевых (target) процессов при односторонних коммуникациях.'
);
*)
  for i := 1 to n div 2 do
  begin
    SetProcess(2*(i-1));
//    x1 := 1 + 40 * ((i+1) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := i;
    a[i] := RandomN(10,99);
    DataN(prc(2*(i-1)), a[i], 0, y1, 2);
    end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*(i-1)+1);
//    x1 := 1 + 40 * ((i+1) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := i;
//    a[i] := RandomN(10,99);
    ResultN(prc(2*(i-1)+1), a[i], 0, y1, 2);
    end;

end;

procedure MPIWin19;
var
  i, j, k0, x1, x2, y1, y2: integer;
begin
  n := RandomN(5,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} real numbers is given in the master process, where {K} is'#13+
'the number of slave processes. Create an access window containing the array {A}'#13+
'in the master process. Using the MPI\_Get function call in each slave process,'#13+
'receive and output one of elements of the array {A}. The elements should be'#13+
'received in descending order of their indices (that is, the element with'#13+
'the index {K}~\-~1 should be received in the process 1, the element with'#13+
'the index {K}~\-~2 should be received in the process 2, and so~on). Use'#13+
'the MPI\_Win\_start and MPI\_Win\_complete synchronization functions in the slave'#13+
'processes and the MPI\_Win\_post and MPI\_Win\_wait synchronization functions'#13+
'in the master process. Use the MPI\_Group\_incl function to create a group'#13+
'of processes specified as the first parameter of the MPI\_Win\_start function,'#13+
'use the MPI\_Group\_excl function to create a group of processes specified'#13+
'as the first parameter of the MPI\_Win\_post function. The MPI\_Group\_incl'#13+
'and MPI\_Group\_excl functions should be applied to the group'#13+
'of the MPI\_COMM\_WORLD communicator.');
(*
TaskText(
 'В главном процессе дан массив {A} из {K} вещественных чисел, где {K} \= количество'#13#10
+'подчиненных процессов. В главном процессе определить окно доступа, содержащее'#13#10
+'массив {A}, и, используя функцию MPI\_Get в каждом подчиненном процессе, получить'#13#10
+'и вывести один из элементов массива {A}, перебирая элементы в обратном порядке'#13#10
+'(в процессе ранга 1 надо получить элемент массива с индексом {K}~\-~1, в процессе'#13#10
+'ранга 2 \= элемент с индексом {K}~\-~2, и~т.\,д.). Для синхронизации использовать'#13#10
+'функции MPI\_Win\_start и MPI\_Win\_complete в подчиненных процессах и функции'#13#10
+'MPI\_Win\_post и MPI\_Win\_wait в главном процессе; для создания группы процессов,'#13#10
+'указываемой в качестве первого параметра функции MPI\_Win\_start, использовать'#13#10
+'функцию MPI\_Group\_incl, для создания группы, указываемой в функции'#13#10
+'MPI\_Win\_post, использовать функцию MPI\_Group\_excl (применив обе эти функции'#13#10
+'к группе, полученной из коммуникатора MPI\_COMM\_WORLD).'
);
*)
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    b[i] := RandomR(1,9.99);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2;
    ResultR(prc(i), b[i], x1, y1, 4);
    end;
  SetProcess(0);
  DataComment(prc(0),1,3);
  x2 := 13;
  y2 := 3;
  for i := 1 to n - 1 do
  begin
    DataR(b[n-i], x2, y2, 4);
    x2 := x2 + 5;
  end;

end;

procedure MPIWin20;
var
  i, j, k0, x1, x2, y1, y2: integer;
  k1, k2, k3: real;
begin
  n := 3*RandomN(2,5);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 3. An array {A} of 3 real numbers'#13+
'is given in the processes of rank 3{N} ({N}~=~0,~\., {K}/3~\-~1). Create an access'#13+
'window containing the array {A} in all processes in which this array is given.'#13+
'Using one call of the MPI\_Get function in the processes of rank 3{N}~+~1'#13+
'and 3{N}~+~2 ({N}~=~0,~\., {K}/3~\-~1), receive and output one element {A}_0 and two'#13+
'elements {A}_1, {A}_2 respectively from the process 3{N} (namely, the process 1 should'#13+
'output the element {A}_0 received from the process 0, the process 2 should output'#13+
'the elements {A}_1 and {A}_2 received from the process 0, the process 4 should'#13+
'output the element {A}_0 received from the process 3, and so~on). Use'#13+
'the MPI\_Win\_post and MPI\_Win\_wait synchronization functions in the processes'#13+
'of rank 3{N} and the MPI\_Win\_start and MPI\_Win\_complete'#13+
'synchronization functions in the other processes.');
(*
TaskText(
 'Число процессов {K} кратно 3. В процессах ранга 3{N} ({N}~=~0,~\., {K}/3~\-~1)'#13#10
+'дан массив {A} из трех вещественных чисел. Во всех процессах, в которых дан'#13#10
+'массив, определить окно доступа, содержащее этот массив, и, используя'#13#10
+'по одному вызову функции MPI\_Get в процессах ранга 3{N}~+~1 и 3{N}~+~2'#13#10
+'({N}~=~0,~\., {K}/3~\-~1), прочесть и вывести соответственно один элемент {A}_0'#13#10
+'и два элемента {A}_1 и {A}_2 из процесса ранга 3{N} (процесс 1 должен вывести'#13#10
+'элемент {A}_0, полученный из процесса~0, процесс 2 \= элементы {A}_1 и {A}_2, полученные'#13#10
+'из процесса~0, процесс 4 \= элемент {A}_0, полученный из процесса~3, и~т.\,д.).'#13#10
+'Для синхронизации использовать функции MPI\_Win\_post и MPI\_Win\_wait в процессах'#13#10
+'ранга 3{N} и функции MPI\_Win\_start и MPI\_Win\_complete в остальных процессах.'
);
*)
  for i := 1 to n div 3 do
  begin
    SetProcess(3*(i-1));
    k1 := RandomR(1,9.99);
    k2 := RandomR(1,9.99);
    k3 := RandomR(1,9.99);
//    x1 := 1 + 40 * ((i+1) mod 2);
    DataR3(prcLong(3*(i-1),n-1), k1, k2, k3, 0, i, 5);
    SetProcess(3*(i-1)+1);
    ResultR(prcLong(3*(i-1)+1,n-1), k1, xLeft, i, 5);
    SetProcess(3*(i-1)+2);
    ResultR2(prcLong(3*(i-1)+2,n-1), k2, k3, xRight, i, 5);
  end;

end;

procedure MPIWin21;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[1..20] of real;
begin
  n := 2*RandomN(2,5);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An array {A} of {K}/2 real numbers'#13+
'and an array {N} of {K}/2 integers are given in the master process. All the'#13+
'elements of the array {N} are distinct and are in the range 1 to {K}~\-~1. Create'#13+
'an access window containing one real number in each slave process. Using'#13+
'the required number of calls of the MPI\_Put function in the master process,'#13+
'send the real number {A}_{I} to the slave process of rank {N}_{I} ({I}~=~0,~\., {K}/2~\-~1).'#13+
'Output the received number (оr 0.0 if the process did not receive data)'#13+
'in each slave process. Use the MPI\_Win\_post and MPI\_Win\_wait synchronization'#13+
'functions in the slave processes and the MPI\_Win\_start and MPI\_Win\_complete'#13+
'synchronization functions in the master process.');
(*
TaskText(
 'Количество процессов {K} \= четное число. В главном процессе дан массив {A}'#13#10
+'из {K}/2 вещественных чисел и массив {N} целых чисел того же размера. Все элементы'#13#10
+'массива {N} различны и лежат в диапазоне от 1 до {K}~\-~1. В каждом подчиненном'#13#10
+'процессе определить окно доступа из одного вещественного числа и, используя'#13#10
+'требуемое количество вызовов функции MPI\_Put в главном процессе, переслать'#13#10
+'в каждый из подчиненных процессов ранга {N}_I ({I}~=~0,~\., {K}/2~\-~1) число {A}_I'#13#10
+'и вывести полученное число (в остальных подчиненных процессах вывести'#13#10
+'вещественное число 0.0). Для синхронизации использовать функции MPI\_Win\_post'#13#10
+'и MPI\_Win\_wait в подчиненных процессах и функции MPI\_Win\_start'#13#10
+'и MPI\_Win\_complete в главном процессе.'
);
*)
  for i := 1 to n-1 do
  begin
    a[i] := i;
    c[i] := 0;
  end;
  for i := 1 to 2 * n do
    SwapN(a[RandomN(1, n-1)], a[RandomN(1, n-1)]);

  for i := 1 to n div 2 do
    b[i] := RandomR(1,9.99);

  for i := 1 to n div 2 do
    c[a[i]] := b[i];

  SetProcess(0);
  DataComment(prc(0), 1, 1);
  x1 := 14;
  DataComment('A:', x1, 1);
  for i := 1 to n div 2 do
  begin
    x1 := x1 + 6;
    DataR(b[i], x1, 1, 4);
  end;
  x1 := 14;
  DataComment('N:', x1, 2);
  for i := 1 to n div 2 do
  begin
    x1 := x1 + 6;
    DataN(a[i], x1, 2, 4);
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2;
    ResultR(prc(i), c[i], x1, y1, 4);
  end;

end;

procedure MPIWin22;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..10,1..10] of real;
begin
  n := RandomN(5,8);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} real numbers (where {K} is the number of slave processes) and'#13+
'an array {N} of 8 integers are given in the master process. All the elements'#13+
'of the array {N} are in the range 1 to {K}; some elements of this array may have'#13+
'the same value. In addition, an array {B} of {R} real numbers is given in the'#13+
'slave process of rank {R} ({R}~=~1,~\., {K}). Create an access window containing'#13+
'the array {B} in each slave process. Using the required number of calls'#13+
'of the MPI\_Accumulate function in the master process, add all the elements'#13+
'of the array {A} to the corresponding elements of the array {B} from the process'#13+
'of rank {N}_{I}, {I}~=~0,~\., 7 (that is, the element {A}_0 should be added to'#13+
'the element {B}_0, the element {A}_1 should be added to the element {B}_1, and so~on).'#13+
'Elements of the array {A} can be added several times to some arrays {B}. Output'#13+
'the array {B} (which may be changed or not) in each slave process.'#13+
'Use the MPI\_Win\_post and MPI\_Win\_wait synchronization functions in the slave'#13+
'processes and the MPI\_Win\_start and MPI\_Win\_complete synchronization'#13+
'functions in the master process.');
(*
TaskText(
 'В главном процессе дан массив {A} вещественных чисел размера {K} ({K} \= количество'#13#10
+'подчиненных процессов) и массив {N} целых чисел размера 8. Все элементы'#13#10
+'массива {N} лежат в диапазоне от 1 до {K}; некоторые элементы данного массива'#13#10
+'могут совпадать. В каждом подчиненном процессе дан вещественный массив {B}'#13#10
+'размера {R}, где {R} \= ранг процесса ({R}~=~1,~\., {K}). Определить в каждом'#13#10
+'подчиненном процессе окно доступа, содержащее массив {B}, и, используя требуемое'#13#10
+'количество вызовов функции MPI\_Accumulate в главном процессе, добавить ко всем'#13#10
+'элементам массивов {B} из процессов ранга {N}_I ({I}~=~0,~\., 7) элементы массива {A}'#13#10
+'с теми же индексами (к элементу {B}_0 добавляется элемент {A}_0, к элементу {B}_1 \='#13#10
+'элемент {A}_1, и~т.\,д.); для некоторых массивов {B} элементы из массива {A} могут'#13#10
+'добавляться несколько раз. В каждом подчиненном процессе вывести массив {B}'#13#10
+'(который либо изменится, либо сохранит исходные значения элементов). Для'#13#10
+'синхронизации использовать функции MPI\_Win\_post и MPI\_Win\_wait в подчиненных'#13#10
+'процессах и функции MPI\_Win\_start и MPI\_Win\_complete в главном процессе.'
);
*)
  for i := 1 to 8 do
  begin
    a[i] := RandomN(1, n-1);
  end;
  for i := 1 to n do
  begin
    b[i] := RandomR(1, 8.99);
  end;
  SetProcess(0);
  x1 := 1;
  DataComment(prc(0), x1, 1);
  x1 := x1 + 6;
  for i := 1 to n-1 do
  begin
    x1 := x1 + 5;
    DataR(b[i], x1, 1, 4);
  end;
  x1 := x1 + 5;
  for i := 1 to 8 do
  begin
    x1 := x1 + 3;
    DataN(a[i], x1, 1, 1);
  end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
{    if i > 5 then
    begin
      x1 := 1;
      y1 := i-2;
    end;}
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i do
    begin
      c[i,j] := RandomR(1,9.99);
      x1 := x1 + 5;
      DataR(c[i,j], x1, y1, 5);
    end;
  end;

  for i := 1 to 8 do
  begin
    for j := 1 to a[i] do
     c[a[i], j] := c[a[i], j] + b[j];
  end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    if i > 5 then
    begin
      x1 := 1;
      y1 := i-1;
    end;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 4;
    for j := 1 to i do
    begin
      x1 := x1 + 6;
      ResultR(c[i,j], x1, y1, 6);
    end;
  end;

end;

procedure MPIWin23;
var
  i, j, x1, x2, y1, y2: integer;
  c: array[1..10,1..10] of real;
  k,m: array[1..10] of integer;
begin
  n := 9;//RandomN(5,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 5 real numbers is given in each process. In addition, two'#13+
'arrays {N} and {M} of 5 integers are given in the master process. All the elements'#13+
'of the array {N} are in the range 1 to {K}, where {K} is the number of slave'#13+
'processes, all the elements of the array {M} are in the range 0 to 4. Some'#13+
'elements of both the array {N} and the array {M} may have the same value. Create'#13+
'an access window containing the array {A} in each slave process. Using'#13+
'the required number of calls of the MPI\_Get function in the master process,'#13+
'receive the element of {A} with the index {M}_{I} from the process {N}_{I} ({I}~=~0,~\., 4)'#13+
'and add the received element to the element {A}_{I} in the master process. After'#13+
'changing the array {A} in the master process, change all the arrays {A} in the'#13+
'slave processes as follows: if some element of the array {A} from the slave'#13+
'process is greater than the element, with the same index, of the array {A} from'#13+
'the master process then replace this element in the slave process by the'#13+
'corresponding element from the master process (to do this, use the required'#13+
'number of calls of the MPI\_Accumulate function in the master process).'#13+
'Output the changed arrays {A} in each process. Use two calls of the MPI\_Win\_post'#13+
'and MPI\_Win\_wait synchronization functions in the slave processes and'#13+
'two calls of the MPI\_Win\_start and MPI\_Win\_complete synchronization functions'#13+
'in the master process.');
(*
TaskText(
 'Во всех процессах даны вещественные массивы {A} размера 5. Кроме того, в главном'#13#10
+'процессе даны целочисленные массивы {N} и {M} размера 5 каждый. Все элементы'#13#10
+'массива {N} лежат в диапазоне от 1 до {K}, где {K} \= количество подчиненных'#13#10
+'процессов, все элементы массива {M} лежат в диапазоне от 0 до 4; некоторые'#13#10
+'элементы как в массиве {N}, так и в массиве {M} могут совпадать. В каждом'#13#10
+'подчиненном процессе определить окно доступа, содержащее массив {A},'#13#10
+'и, используя требуемое количество вызовов функции MPI\_Get в главном процессе,'#13#10
+'получить из процесса ранга {N}_I ({I}~=~0,~\., 4) элемент массива {A} с индексом {M}_I'#13#10
+'и добавить его значение к элементу массива {A} главного процесса с индексом {I}.'#13#10
+'После изменения массива {A} в главном процессе выполнить следующую корректировку'#13#10
+'массивов {A} всех подчиненных процессов: заменить в них те элементы, которые'#13#10
+'больше элемента массива {A} с тем же индексом из главного процесса, на этот'#13#10
+'элемент, используя требуемое количество вызовов функции MPI\_Accumulate'#13#10
+'в главном процессе. В каждом процессе вывести преобразованные массивы {A}.'#13#10
+'Для синхронизации использовать два вызова пары функции MPI\_Win\_post'#13#10
+'и MPI\_Win\_wait в подчиненных процессах и два вызова пары функции MPI\_Win\_start'#13#10
+'и MPI\_Win\_complete в главном процессе.'
);
*)
  for j := 1 to 5 do
  begin
    m[j] := RandomN(0,4);
    k[j] := RandomN(1,n-1);
  end;
  for j := 1 to n do
  begin
    c[1,j] := RandomR(1, 1.99);
  end;
  for i := 2 to n do
  for j := 1 to n do
    c[i,j] := RandomR(1, 9.99);
  SetProcess(0);
  x1 := 1;
  DataComment(prc(0), x1, 1);
  x1 := x1 + 6;
  for i := 1 to 5 do
  begin
    x1 := x1 + 5;
    DataR(c[1,i], x1, 1, 4);
  end;
  x1 := x1 + 7;
  DataComment('N:', x1, 1);
  x1 := x1 + 2;
  for i := 1 to 5 do
  begin
    x1 := x1 + 2;
    DataN(k[i], x1, 1, 1);
  end;
  x1 := x1 + 4;
  DataComment('M:', x1, 1);
  x1 := x1 + 2;
  for i := 1 to 5 do
  begin
    x1 := x1 + 2;
    DataN(m[i], x1, 1, 1);
  end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
{    if i > 5 then
    begin
      x1 := 1;
      y1 := i-2;
    end;}
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to 5 do
    begin
      x1 := x1 + 5;
      DataR(c[i+1,j], x1, y1, 5);
    end;
  end;

{  for i := 1 to 8 do
  begin
    for j := 1 to a[i] do
     c[a[i], j] := c[a[i], j] + b[j];
  end;
}


  for i := 1 to 5 do
    c[1,i] := c[1,i] + c[k[i]+1, m[i]+1];
  for i := 2 to n do
    for j := 1 to 5 do
      if c[1,j] < c[i, j] then
        c[i, j] := c[1,j];




  SetProcess(0);
  x1 := 20;
  ResultComment(prc(0), x1, 1);
  x1 := x1 + 5;
  for i := 1 to 5 do
  begin
    x1 := x1 + 6;
    ResultR(c[1,i], x1, 1, 5);
  end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
{    if i > 5 then
    begin
      x1 := 1;
      y1 := i-2;
    end;}
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to 5 do
    begin
      x1 := x1 + 5;
      ResultR(c[i+1,j], x1, y1, 5);
    end;
  end;


end;

procedure MPIWin24;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[1..10] of integer;
begin
  n := RandomN(5,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'An integer {N} is given in each slave process, all the integers {N} are distinct'#13+
'and are in the range 0 to {K}~\-~1, where {K} is the number of slave processes.'#13+
'Create an access window containing an array {A} of {K} integers in each slave'#13+
'process. Without performing any synchronization function calls in the master'#13+
'process (except calling the MPI\_Barrier function) and using a sequence'#13+
'of calls of the MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier, MPI\_Win\_lock,'#13+
'MPI\_Win\_unlock synchronization functions in the slave processes, change'#13+
'element of the array {A} with index {N} by assigning the rank of the slave'#13+
'process, which contains the integer {N}, to this element (to do this, use'#13+
'the MPI\_Put function) and then receive and output all the elements of the'#13+
'changed array {A} in each slave process (to do this, use the MPI\_Get function).'#13+
'Use the MPI\_LOCK\_SHARED constant as the first parameter of the MPI\_Win\_lock'#13+
'function. \P\SNote.\s The MPI\_Win\_lock and MPI\_Win\_unlock synchronization functions'#13+
'are used mainly for one-way communications with \Ipassive targets\i. In such'#13+
'a kind of one-way communications, the target process does not process'#13+
'the data transferred to it but acts as their storage,'#13+
'which is accessible to other processes.');
(*
TaskText(
 'В каждом подчиненном процессе дано целое число {N}; все числа {N} различны'#13#10
+'и лежат в диапазоне от 0 до {K}~\-~1, где {K} \= количество подчиненных процессов.'#13#10
+'В главном процессе определить окно доступа, содержащее целочисленный массив {A}'#13#10
+'размера {K}. Не выполняя никаких вызовов синхронизирующих функций в главном'#13#10
+'процессе (кроме вызова функции MPI\_Barrier) и используя в подчиненных'#13#10
+'процессах последовательность вызовов синхронизирующих функции MPI\_Win\_lock,'#13#10
+'MPI\_Win\_unlock, MPI\_Barrier, MPI\_Win\_lock, MPI\_Win\_unlock, записать в элементы'#13#10
+'массива {A} с индексом {N} ранг подчиненного процесса, содержащего данное'#13#10
+'значение {N} (с помощью функции MPI\_Put), после чего получить и вывести в каждом'#13#10
+'подчиненном процессе все элементы преобразованного массива {A} (с помощью'#13#10
+'функции MPI\_Get). В качестве первого параметра функции MPI\_Win\_lock'#13#10
+'указывать MPI\_LOCK\_SHARED.'#13#10
+'\P\SПримечание.\s Синхронизирующие функции MPI\_Win\_lock, MPI\_Win\_unlock используются'#13#10
+'преимущественно при односторонних коммуникациях с \Iпассивными целевыми\i'#13#10
+'\Iпроцессами\i (passive targets), при которых целевой процесс не обрабатывает'#13#10
+'переданные ему данные, а выступает в роли их хранилища,'#13#10
+'доступного для других процессов.'
);
*)
  for i := 1 to n - 1 do
    a[i] := i;
  for i := 1 to 2 * n do
    SwapN(a[RandomN(1, n-1)], a[RandomN(1, n-1)]);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2;
    DataN(prc(i), a[i]-1, x1, y1, 2);
  end;
  for i := 1 to n - 1 do
    c[a[i]] := i;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
{    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    y1 := (i+1) div 2;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 8;
    for j := 1 to n-1 do
    begin
      x1 := x1 + 3;
      ResultN(c[j], x1, y1, 2);
    end;
  end;


end;


procedure MPIWin25;
var
  i, j, k, k1, x1, x2, y1, y2: integer;
  c: array[1..10,1..10] of real;
  s: string;
begin
  n := 3*RandomN(3,5);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 3. An array {A} of 5 real numbers'#13+
'is given in the processes of rank 3{N} ({N}~=~0,~\., {K}/3~\-~1), an integer {M}'#13+
'and a real number {B} are given in the processes of rank 3{N}~+~1. The given'#13+
'integers {M} are in the range 0 to 4. Create an access window containing'#13+
'the array {A} in all processes in which this array is given.'#13+
'Using the MPI\_Accumulate function call in the processes of rank 3{N}~+~1'#13+
'({N}~=~0,~\., {K}/3~\-~1), change the array {A} from the process 3{N} as follows:'#13+
'if the array element with the index {M} is greater than the number {B} then this'#13+
'element should be replaced by the number {B} (the numbers {M} and {B} are taken'#13+
'from the process 3{N}~+~1). Then send the changed array {A} from the process 3{N}'#13+
'to the process 3{N}~+~2 and output the received array in the process 3{N}~+~2;'#13+
'to do this, use the MPI\_Get function call in the process of rank 3{N}~+~2.'#13+
'Use the  MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier synchronization functions'#13+
'in the processes of rank 3{N}~+~1, the MPI\_Barrier, MPI\_Win\_lock, MPI\_Win\_unlock'#13+
'synchronization functions in the processes of rank 3{N}~+~2, and the MPI\_Barrier'#13+
'function in the processes of rank 3{N}. Use the MPI\_LOCK\_EXCLUSIVE constant'#13+
'as the first parameter of the MPI\_Win\_lock function.');
(*
TaskText(
 'Количество процессов {K} кратно 3. В процессах ранга 3{N} ({N}~=~0,~\., {K}/3~\-~1)'#13#10
+'дан вещественный массив {A} размера 5, в процессах ранга 3{N}~+~1 дано целое'#13#10
+'число {M}, лежащее в диапазоне от 0 до 4, и вещественное число {B}. В каждом'#13#10
+'процессе, содержащем исходный массив {A}, определить окно доступа с этим'#13#10
+'массивом. Используя функцию MPI\_Accumulate в каждом процессе ранга 3{N}~+~1'#13#10
+'({N}~=~0,~\., {K}/3~\-~1), преобразовать массив {A} из процесса ранга 3{N} следующим'#13#10
+'образом: если элемент массива с индексом {M} больше числа {B}, то он заменяется'#13#10
+'на число {B} (числа {M} и {B} берутся из процесса ранга 3{N}~+~1). После этого,'#13#10
+'используя функцию MPI\_Get в каждом процессе ранга 3{N}~+~2, получить и вывести'#13#10
+'в нем все элементы преобразованного массива {A} из процесса ранга 3{N}.'#13#10
+'Использовать синхронизирующие функции MPI\_Win\_Lock, MPI\_Win\_unlock,'#13#10
+'MPI\_Barrier в процессах ранга 3{N}~+~1, функции MPI\_Barrier, MPI\_Win\_Lock,'#13#10
+'MPI\_Win\_unlock в процессах ранга 3{N}~+~2 и функцию MPI\_Barrier в процессах'#13#10
+'ранга 3{N}. В качестве первого параметра функции MPI\_Win\_lock'#13#10
+'указывать MPI\_LOCK\_EXCLUSIVE.'
);
*)
  k := n div 3;
  for i := 1 to k do
    for j := 1 to 5 do
      c[i,j] := RandomR(1,9.99);
  repeat
  k1 := 0;
  for i := 1 to k do
  begin
    a[i] := RandomN(1,5);
    b[i] := RandomR(1,9.99);
    if c[1,a[i]] > b[i] then
      k1 := k1 + 1;
  end;
  until k1 > 1;
  for i := 1 to k do
  begin
  SetProcess(3*(i-1));
  x1 := 1;
  y1 := i;
  s := prclong(3*(i-1),3*k+2);
  DataComment(s, x1, y1);
  x1 := x1 + 7;
  for j := 1 to 5 do
  begin
    x1 := x1 + 5;
    DataR(c[i,j], x1, y1, 4);
  end;
  SetProcess(3*(i-1)+1);
  x1 := 40;
  s := prclong(3*(i-1)+1,3*k+2);
  DataN(s + ' M = ', a[i]-1, x1, y1, 1);
  x1 := x1 + 19;
  DataR('  B = ', b[i], x1, y1, 4);
  end;

  for i := 1 to k do
  begin
    if c[i,a[i]] > b[i] then
      c[i,a[i]] := b[i];
  end;
  for i := 1 to k do
  begin
  SetProcess(3*(i-1)+2);
  x1 := 1;
  y1 := i;
  ResultComment(prclong(3*(i-1)+2,3*k+2), x1, y1);
  x1 := x1 + 7;
  for j := 1 to 5 do
  begin
    x1 := x1 + 5;
    ResultR(c[i,j], x1, y1, 4);
  end;
  end;



end;


procedure MPIWin26;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[0..10,1..5] of real;
  x, y: real;
begin
  n := RandomN(5,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 5 positive real numbers is given in each slave process.'#13+
'Create an access window containing an array {B} of 5 zero-valued real numbers'#13+
'in the master process. Without performing any synchronization function calls'#13+
'in the master process (except calling the MPI\_Barrier function) and using'#13+
'a sequence of calls of the MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier,'#13+
'MPI\_Win\_lock, MPI\_Win\_unlock synchronization functions in the slave processes,'#13+
'change elements of the array {B} by assigning the maximal value of the array {A}'#13+
'elements with the index {I} ({I}~=~0,~\., 4) to the array {B} element with the same'#13+
'index (to do this, use the MPI\_Accumulate function) and then receive'#13+
'and output all the elements of the changed array {B} in each slave process'#13+
'(to do this, use the MPI\_Get function). Use the MPI\_LOCK\_SHARED constant'#13+
'as the first parameter of the MPI\_Win\_lock function.');
(*
TaskText(
 'В каждом подчиненном процессе дан вещественный массив {A} размера 5'#13#10
+'с положительными элементами. В главном процессе определить окно доступа,'#13#10
+'содержащее вещественный массив {B} размера 5 с нулевыми элементами. Не выполняя'#13#10
+'никаких вызовов синхронизирующих функций в главном процессе (кроме вызова'#13#10
+'функции MPI\_Barrier) и используя в подчиненных процессах последовательность'#13#10
+'вызовов синхронизирующих функции MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier,'#13#10
+'MPI\_Win\_lock, MPI\_Win\_unlock, записать в каждый из элементов массива {B}'#13#10
+'максимальный из элементов массивов {A} с тем же индексом (с помощью функции'#13#10
+'MPI\_Accumulate), после чего получить и вывести в каждом подчиненном процессе'#13#10
+'все элементы преобразованного массива {B} (с помощью функции MPI\_Get).'#13#10
+'В качестве первого параметра функции MPI\_Win\_lock указывать MPI\_LOCK\_SHARED.'
);
*)
  for j := 1 to 5 do
  begin
  c[0,j] := 0;
  for i := 1 to n - 1 do
    c[i,j] := RandomR(1,9.9);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;

    y1 := (i+1) div 2;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 6;
    for j := 1 to 5 do
    begin
    x1 := x1 + 5;
    DataR(c[i,j], x1, y1, 5);
    end;
  end;
  for i := 1 to n - 1 do
  for j := 1 to 5 do
    if c[0,j]<c[i,j] then
      c[0,j] := c[i,j];

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;

    y1 := (i+1) div 2;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 6;
    for j := 1 to 5 do
    begin
    x1 := x1 + 5;
    ResultR(c[0,j], x1, y1, 5);
    end;
  end;


end;

procedure MPIWin27;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[0..10,1..2] of real;
  x, y: real;
begin
  n := RandomN(5,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'Two real numbers {X}, {Y} (the coordinates of a some point on a plane) are given'#13+
'in each slave process. Using the MPI\_Get function in the master process,'#13+
'receive real numbers {X}_0, {Y}_0 in this process that are equal to the coordinates'#13+
'of the point that is the most remote from the origin among all the points'#13+
'given in the slave processes. Then send the numbers {X}_0, {Y}_0 from the master'#13+
'process to all the slave processes and output these numbers in the slave'#13+
'processes; to do this, use the MPI\_Get function call in the slave processes.'#13+
'Use the  MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier synchronization functions'#13+
'in the master process and the MPI\_Barrier, MPI\_Win\_lock, MPI\_Win\_unlock'#13+
'synchronization functions in the slave processes. \P\SNote.\s This task can not be'#13+
'solved by using one-way communications only on the side of the slave processes'#13+
'by means of the lock/unlock synchronizations.');
(*
TaskText(
 'В каждом подчиненном процессе даны два вещественных числа {X}, {Y} \= координаты'#13#10
+'точки на плоскости. Используя вызовы функции MPI\_Get в главном процессе,'#13#10
+'получить в нем числа {X}_0, {Y}_0, равные координатам той точки ({X},~{Y}) среди точек,'#13#10
+'данных в подчиненных процессах, которая является наиболее удаленной от начала'#13#10
+'координат. После этого, используя вызовы функции MPI\_Get в подчиненных'#13#10
+'процессах, получить и вывести в каждом из них числа {X}_0, {Y}_0, найденные'#13#10
+'в главном процессе. В каждом процессе определить окно доступа, содержащее'#13#10
+'два вещественных числа ({X}, {Y} для подчиненных процессов, {X}_0, {Y}_0 для главного'#13#10
+'процесса). Использовать синхронизирующие функции MPI\_Win\_lock, MPI\_Win\_unlock,'#13#10
+'MPI\_Barrier в главном процессе и функции MPI\_Barrier, MPI\_Win\_lock,'#13#10
+'MPI\_Win\_unlock в подчиненных процессах.'#13#10
+'\P\SПримечание.\s Данную задачу невозможно решить, используя односторонние'#13#10
+'коммуникации только на стороне подчиненных процессов и при этом выполняя'#13#10
+'синхронизацию с помощью блокировок lock/unlock.'
);
*)
  for j := 1 to 2 do
  begin
  c[0,j] := 0;
  for i := 1 to n - 1 do
    c[i,j] := RandomR(-9.9,9.9);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    DataR2(prc(i), c[i,1], c[i,2], x1, y1, 6);
  end;
  for i := 1 to n - 1 do
    if sqr(c[0,1])+sqr(c[0,2]) <
       sqr(c[i,1])+sqr(c[i,2]) then
    begin
      c[0,1] := c[i,1];
      c[0,2] := c[i,2];
    end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    ResultR2(prc(i), c[0,1], c[0,2], x1, y1, 6);
  end;


end;


procedure MPIWin28;
var
  i, j, k0, x1, x2, y1, y2: integer;
  c: array[0..10,1..2] of real;
  x, y: real;
begin
  n := RandomN(5,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'Solve the \1 task using the single access window containing'#13+
'the numbers {X}_0, {Y}_0 in the master process. Use the MPI\_Get and MPI\_Put'#13+
'functions in the slave processes to find the numbers {X}_0, {Y}_0 (for some'#13+
'processes, the MPI\_Put function is not required), use the MPI\_Get function'#13+
'to send the numbers X0, Y0 to all the slave processes (as in the \1'#13+
'task). To synchronize exchanges when find the numbers {X}_0, {Y}_0, use two calls'#13+
'of each of the MPI\_Win\_start and MPI\_Win\_complete functions in the slave'#13+
'processes and calls of the MPI\_Win\_post and MPI\_Win\_wait functions \Iin a loop\i'#13+
'in the master process (it is necessary to define \Ia new group of processes\i'#13+
'at each iteration of the loop; this group should be used in the MPI\_Win\_post'#13+
'function call). To synchronize sending numbers {X}_0, {Y}_0 to slave processes,'#13+
'use the MPI\_Barrier function in the master process and the MPI\_Barrier,'#13+
'MPI\_Win\_Lock, MPI\_Win\_unlock functions in the slave processes'#13+
'(as in the \1 task). \P\SNote.\s The solution method described in this'#13+
'task allows one-way communications to be used only on the side of the slave'#13+
'processes (in contrast to the method described in the \1 task) but it'#13+
'requires to apply a synchronizations that different from the lock/unlock ones.');
(*
TaskText(
 'Решить задачу \1, используя единственное окно доступа в главном'#13#10
+'процессе, содержащее числа {X}_0, {Y}_0. Для нахождения чисел {X}_0, {Y}_0 использовать'#13#10
+'функцию MPI\_Get и функцию MPI\_Put в подчиненных процессах (для некоторых'#13#10
+'процессов вызывать функцию MPI\_Put не потребуется), для пересылки найденных'#13#10
+'чисел {X}_0, {Y}_0 во все подчиненные процессы использовать в них функцию MPI\_Get'#13#10
+'(как и в задаче \1). Для синхронизации обменов на этапе нахождения'#13#10
+'чисел {X}_0, {Y}_0 использовать два вызова пары функций MPI\_Win\_start'#13#10
+'и MPI\_Win\_complete в подчиненных процессах и вызовы \Iв цикле\i двух пар функций'#13#10
+'MPI\_Win\_post и MPI\_Win\_wait в главном процессе (при этом на каждой итерации'#13#10
+'цикла необходимо определять \Iновую группу процессов\i, используемую при вызове'#13#10
+'функций MPI\_Win\_post). Для синхронизации действий при пересылке'#13#10
+'чисел {X}_0, {Y}_0 в подчиненные процессы использовать, как и в задаче \1,'#13#10
+'функцию MPI\_Barrier в главном процессе и функции MPI\_Barrier, MPI\_Win\_Lock,'#13#10
+'MPI\_Win\_unlock в подчиненных процессах.'#13#10
+'\P\SПримечание.\s Описанный вариант решения (в отличие от варианта, приведенного'#13#10
+'в задаче \1) позволяет использовать односторонние коммуникации только'#13#10
+'на стороне подчиненных процессов, однако при этом на первом этапе решения'#13#10
+'требуется применять вариант синхронизации, отличный от блокировок lock/unlock.'
);
*)
  for j := 1 to 2 do
  begin
  c[0,j] := 0;
  for i := 1 to n - 1 do
    c[i,j] := RandomR(-9.9,9.9);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    DataR2(prc(i), c[i,1], c[i,2], x1, y1, 6);
  end;
  for i := 1 to n - 1 do
    if sqr(c[0,1])+sqr(c[0,2]) <
       sqr(c[i,1])+sqr(c[i,2]) then
    begin
      c[0,1] := c[i,1];
      c[0,2] := c[i,2];
    end;

  for i := 1 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;

    y1 := (i+1) div 2;
    ResultR2(prc(i), c[0,1], c[0,2], x1, y1, 6);
  end;


end;

procedure MPIWin29;
var
  i, j, k0, k1, k3, x1, x2, y1, y2: integer;
  c: array[0..10,0..10] of integer;
  x, y: real;
function s(i: integer): integer;
var j: integer;
begin
  result := 0;
  for j := 1 to n do
    result := result + c[i,j];
end;
begin
  n := RandomN(5,8);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'One row of the square integer-valued matrix of order {K} is given in each'#13+
'process, where {K} is the number of processes (the process of rank {R} contains'#13+
'the {R}th row of the matrix, the rows are numbered from 0). Using the MPI\_Get'#13+
'function calls in the master process, receive a matrix row with the minimal'#13+
'sum {S} of elements in this process and also find the number {N} of matrix rows'#13+
'with this minimal sum (if {N}~>~1 then the last of such rows, that is, the row'#13+
'with the maximal ordinal number, should be saved in the master process). Then'#13+
'send this matrix row, the sum {S}, and the number {N} to each slave process using'#13+
'the MPI\_Get function in these processes. Output all received data in each'#13+
'process. To do this, create an access window containing {K}~+~2 integers in each'#13+
'process; the first {K} elements of the window should contain the elements'#13+
'of the matrix row, the next element should contain the sum {S} of its elements,'#13+
'and the last element should contain the number {N}. Use the  MPI\_Win\_lock,'#13+
'MPI\_Win\_unlock, MPI\_Barrier synchronization functions in the master process'#13+
'and the MPI\_Barrier, MPI\_Win\_lock, MPI\_Win\_unlock synchronization functions'#13+
'in the slave processes. \P\SNote.\s This task can not be solved by using one-way'#13+
'communications only on the side of the slave processes by means'#13+
'of the lock/unlock synchronizations.');
(*
TaskText(
 'В каждом процессе дана одна строка целочисленной квадратной матрицы порядка {K},'#13#10
+'где {K} \= количество процессов (в процессе ранга {R} дана строка матрицы'#13#10
+'с номером {R}; строки нумеруются от~0). Используя вызовы функции MPI\_Get'#13#10
+'в главном процессе, получить в нем строку матрицы с минимальной суммой'#13#10
+'элементов {S} и, кроме того, найти количество {N} строк с минимальной суммой'#13#10
+'(если {N}~>~1, то в главном процессе надо сохранить последнюю из таких строк,'#13#10
+'т.\,е. строку с наибольшим номером). После этого, используя вызовы функции'#13#10
+'MPI\_Get в подчиненных процессах, получить и вывести в каждом из них строку'#13#10
+'с минимальной суммой {S}, найденную в главном процессе, значение суммы {S}'#13#10
+'и количество {N} строк с минимальной суммой. В каждом процессе определить окно'#13#10
+'доступа, содержащее {K}~+~2 целых числа; в первых {K} элементах окна содержатся'#13#10
+'элементы строки матрицы, в следующем элементе \= сумма их значений {S},'#13#10
+'а последний элемент предназначен для хранения числа~{N}. Использовать'#13#10
+'синхронизирующие функции MPI\_Win\_lock, MPI\_Win\_unlock, MPI\_Barrier в главном'#13#10
+'процессе и функции MPI\_Barrier, MPI\_Win\_lock, MPI\_Win\_unlock'#13#10
+'в подчиненных процессах.'#13#10
+'\P\SПримечание.\s Данную задачу невозможно решить, используя односторонние'#13#10
+'коммуникации только на стороне подчиненных процессов и выполняя синхронизацию'#13#10
+'с помощью блокировок lock/unlock.'
);
*)
  k3 := RandomN(1,5);
  repeat
  for i := 1 to n do
  begin
    for j := 1 to n do
      c[i,j] := RandomN(0,9);
  end;
  for i := 1 to 5 do
  begin
    x1 := RandomN(1,n);
    x2 := RandomN(1,n);
    for j := 1 to n do
      SwapN(c[x1,j],c[x2,j]);
    for j := 1 to 2 * n do
      SwapN(c[x1,RandomN(1, n)], c[x1,RandomN(1, n)]);
  end;
  k0 := n; k1 := 1;
  for i := n-1 downto 1 do // ищем с конца!
    if s(k0) = s(i) then
      k1 := k1 + 1
    else
      if s(k0) > s(i) then
      begin
        k0 := i;
        k1 := 1;
      end;
  until (k1 >= k3) and (s(k0) > 9);

  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
    y1 := i;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to n do
    begin
      x1 := x1 + 4;
      DataN(c[i,j], x1, y1, 3);
    end;
  end;

  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
    y1 := i;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to n do
    begin
      x1 := x1 + 4;
      ResultN(c[k0,j], x1, y1, 3);
    end;
      x1 := x1 + 8;
      ResultN('S = ', s(k0), x1, y1, 2);
      x1 := x1 + 11;
      ResultN('N = ', k1, x1, y1, 1);
  end;


end;


procedure MPIWin30;
var
  i, j, k0, k1, k3, x1, x2, y1, y2: integer;
  c: array[0..10,0..10] of integer;
  x, y: real;
function s(i: integer): integer;
var j: integer;
begin
  result := 0;
  for j := 1 to n do
    result := result + c[i,j];
end;
begin
  n := RandomN(5,8);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'Solve the \1 task using the single access window containing the matrix'#13+
'row and the numbers {S} and {N} in the master process. Use the MPI\_Get and MPI\_Put'#13+
'functions in the slave processes to find the matrix row with the minimal sum'#13+
'and the related numbers {S} and {N} (for some processes, the MPI\_Put function'#13+
'is not required), use the MPI\_Get function to send the row with the minimal'#13+
'sum and the numbers {S} and {N} to all the slave processes (as in the \1'#13+
'task). To synchronize exchanges when find the matrix row, use two calls'#13+
'of each of the MPI\_Win\_start and MPI\_Win\_complete functions in the slave'#13+
'processes and calls of the  MPI\_Win\_post and MPI\_Win\_wait functions \Iin a loop\i'#13+
'in the master process (it is necessary to define \Ia new group of processes\i'#13+
'at each iteration of the loop; this group should be used in the MPI\_Win\_post'#13+
'function call). To synchronize sending the row with the minimal sum'#13+
'and the numbers {S} and {N} to slave processes, use the MPI\_Barrier function'#13+
'in the master process and the MPI\_Barrier, MPI\_Win\_Lock, MPI\_Win\_unlock'#13+
'functions in the slave processes (as in the \1 task).'#13+
'\P\SNote.\s The solution method described in this task allows one-way'#13+
'communications to be used only on the side of the slave processes'#13+
'(in contrast to the method described in the \1 task) but it requires'#13+
'to apply a synchronizations that different from the lock/unlock ones.');
(*
TaskText(
 'Решить задачу \1, используя единственное окно доступа в главном'#13#10
+'процессе, содержащее строку матрицы и числа {S} и {N}. Для нахождения строки'#13#10
+'с минимальной суммой элементов и связанных с ней характеристик использовать'#13#10
+'функцию MPI\_Get и функцию MPI\_Put в подчиненных процессах (для некоторых'#13#10
+'процессов вызывать функцию MPI\_Put не потребуется), для пересылки найденных'#13#10
+'данных во все подчиненные процессы использовать в них функцию MPI\_Get'#13#10
+'(как и в задаче \1). На этапе нахождения строки с минимальной суммой'#13#10
+'функцию MPI\_Get следует использовать только для получения значений {S} и {N}.'#13#10
+'Для синхронизации обменов на этапе нахождения строки с минимальной суммой'#13#10
+'использовать два вызова пары функций MPI\_Win\_start и MPI\_Win\_complete'#13#10
+'в подчиненных процессах и вызовы \Iв цикле\i двух пар функций MPI\_Win\_post'#13#10
+'и MPI\_Win\_wait в главном процессе (при этом на каждой итерации цикла'#13#10
+'необходимо определять \Iновую группу процессов\i, используемую при вызове функций'#13#10
+'MPI\_Win\_post). Для синхронизации действий при пересылке найденных данных'#13#10
+'в подчиненные процессы использовать, как и в задаче \1, функцию'#13#10
+'MPI\_Barrier в главном процессе и функции MPI\_Barrier, MPI\_Win\_Lock,'#13#10
+'MPI\_Win\_unlock в подчиненных процессах.'#13#10
+'\P\SПримечание.\s Описанный вариант решения (в отличие от варианта, приведенного'#13#10
+'в задаче \1) позволяет использовать односторонние коммуникации только'#13#10
+'на стороне подчиненных процессов, однако при этом на первом этапе решения'#13#10
+'требуется применять вариант синхронизации, отличный от блокировок lock/unlock.'
);
*)
  k3 := RandomN(1,5);
  repeat
  for i := 1 to n do
  begin
    for j := 1 to n do
      c[i,j] := RandomN(0,9);
  end;
  for i := 1 to 5 do
  begin
    x1 := RandomN(1,n);
    x2 := RandomN(1,n);
    for j := 1 to n do
      SwapN(c[x1,j],c[x2,j]);
    for j := 1 to 2 * n do
      SwapN(c[x1,RandomN(1, n)], c[x1,RandomN(1, n)]);
  end;
  k0 := n; k1 := 1;
  for i := n-1 downto 1 do // ищем с конца!
    if s(k0) = s(i) then
      k1 := k1 + 1
    else
      if s(k0) > s(i) then
      begin
        k0 := i;
        k1 := 1;
      end;
  until (k1 >= k3) and (s(k0) > 9);

  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
    y1 := i;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to n do
    begin
      x1 := x1 + 4;
      DataN(c[i,j], x1, y1, 3);
    end;
  end;

  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
    y1 := i;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to n do
    begin
      x1 := x1 + 4;
      ResultN(c[k0,j], x1, y1, 3);
    end;
      x1 := x1 + 8;
      ResultN('S = ', s(k0), x1, y1, 2);
      x1 := x1 + 11;
      ResultN('N = ', k1, x1, y1, 1);
  end;


end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: MPIWin1;
  2: MPIWin2;
  3: MPIWin3;
  4: MPIWin4;
  5: MPIWin5;
  6: MPIWin6;
  7: MPIWin7;
  8: MPIWin8;
  9: MPIWin9;
  10: MPIWin10;
  11: MPIWin11;
  12: MPIWin12;
  13: MPIWin13;
  14: MPIWin14;
  15: MPIWin15;
  16: MPIWin16;
  17: MPIWin17;
  18: MPIWin18;
  19: MPIWin19;
  20: MPIWin20;
  21: MPIWin21;
  22: MPIWin22;
  23: MPIWin23;
  24: MPIWin24;
  25: MPIWin25;
  26: MPIWin26;
  27: MPIWin27;
  28: MPIWin28;
  29: MPIWin29;
  30: MPIWin30;

  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI7Win', 'One-sided communications (MPI-2)',
    'M. E. Abramyan, 2017', 'sddwertfghklbfdgfgd', 30, InitTask);
end;

// exports inittaskgroup;  //----------------------------------------------------

begin
end.
