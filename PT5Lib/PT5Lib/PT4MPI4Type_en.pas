{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI4Type_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  prcname = 'Process %d: ';
  topic1 = 'The simplest derived types'; //'Использование простейших производных типов';
  topic2 = 'Data packing';
  topic3 = 'Additional ways of derived type creation';
  topic4 = 'The MPI_Alltoallw function (MPI-2)';

function Prc(n: integer): string;
begin
  result := Format(prcname, [n]);
end;



procedure MpiE1;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1 triples of integers is given in the master process;'#13+
'{K} is the amount of processes. Send all given data to each slave process'#13+
'using derived datatype with three integer elements and one collective'#13+
'operation with the derived datatype. Output received data'#13+
'in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1~тройка целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя производный тип, содержащий три целых числа,',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
      DataN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE2;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1 triples of integers is given in the master process;'#13+
'{K} is the amount of processes. Send one given triple at a time to each slave'#13+
'process using derived datatype with three integer elements and one collective'#13+
'operation with the derived datatype. Output received integers'#13+
'in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1~тройка целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя производный тип, содержащий три целых числа,',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('по одной тройке чисел в каждый из подчиненных процессов',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
      ResultN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
      DataN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE3;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A triple of integers is given in each slave process. Send all given triples'#13+
'to the master process using derived datatype with three integer elements'#13+
'and one collective operation with the derived datatype. Output received data'#13+
'in the master process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('В каждом подчиненном процессе дана тройка целых чисел.',0,1);
  TaskText('Используя производный тип, содержащий три целых числа, ',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('числа из подчиненных процессов в главный и вывести',0,4);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',3,y+i);
      DataN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE4;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1 triples of numbers is given in the master process;'#13+
'{K} is the amount of processes. Two initial items of each triple are'#13+
'integers, the last item is a real number. Send all given triples to each'#13+
'slave process using derived datatype with three elements (two integers'#13+
'and a real number) and one collective operation with the derived datatype.'#13+
'Output received data in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первые два числа каждой тройки являются целыми, а третье число~\=',0,2);
  TaskText('вещественным. Используя производный тип, содержащий три числа (два целых',0,3);
  TaskText('и одно вещественное), переслать числа из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataN('', c[j], 1+j*13+3, 3, 2);
      DataR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiE5;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1 triples of numbers is given in the master process;'#13+
'{K} is the amount of processes. The first item and the last item'#13+
'of each triple are integers, the middle item is a real number. Send one given'#13+
'triple at a time to each slave process using derived datatype with three'#13+
'elements (an integer, a real number, an integer) and one collective operation'#13+
'with the derived datatype. Output received data'#13+
'in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1}~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первое и третье число каждой тройки являются целыми, а второе число~\=',0,2);
  TaskText('вещественным. Используя производный тип, содержащий три числа (целое,',0,3);
  TaskText('вещественное, целое), переслать по одной тройке чисел в каждый из',0,4);
  TaskText('подчиненных процессов и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataR('', b[j], 1+j*13+3, 3, 5);
      DataN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiE6;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A triple of numbers is given in each slave process. The first item of each'#13+
'triple is a real number, the other items are integers. Send all given triples'#13+
'to the master process using derived datatype with three elements'#13+
'(a real number and two integers) and one collective operation'#13+
'with the derived datatype. Output received data in the master process'#13+
'in ascending order of ranks of sending processes.'
  );
(*
  TaskText('В каждом подчиненном процессе даны три числа: одно вещественное',0,1);
  TaskText('и два целых. Используя производный тип, содержащий три числа (одно',0,2);
  TaskText('вещественное и два целых), переслать числа из подчиненных',0,3);
  TaskText('процессов в главный и вывести полученные числа',0,4);
  TaskText('в порядке возрастания рангов переславших их процессов.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
      DataN('', a[i], 35+6, y+i, 2);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      ResultR('', b[j], 1+j*13, 3, 5);
      ResultN('', a[j], 1+j*13+6, 3, 2);
      ResultN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiE7;
var i,n,y,j: integer;
  a: array[0..6] of integer;
  c: array[0..6] of integer;
  b: array[0..6] of real;
begin
  n := Random(3)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A triple of numbers is given in each process. The first item and the last item'#13+
'of each triple are integers, the middle item is a real number. Send the given'#13+
'triples from each process to all processes using derived datatype'#13+
'with three elements (an integer, a real number, an integer) and one collective'#13+
'operation with the derived datatype. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including data received from itself).'
  );
(*
  TaskText('В каждом процессе даны три числа: первое и третье являются целыми, а второе \=',0,1);
  TaskText('вещественным. Используя производный тип, содержащий три числа (целое,',0,2);
  TaskText('вещественное, целое), переслать данные из каждого процесса во все процессы',0,3);
  TaskText('и вывести в каждом процессе полученные числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая числа, полученные из этого же процесса).',0,5);
*)
  for i := 0 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataR('', b[i], 35+3, y+i, 5);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 0 to n-1 do
    begin
      ResultN('', a[j], 14+j*13, y+i, 2);
      ResultR('', b[j], 14+j*13+3, y+i, 5);
      ResultN('', c[j], 14+j*13+9, y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiE8;
var i,n,y,j,x: integer;
  a: array[1..6,1..5] of integer;
  c: array[1..6,1..5] of integer;
  b: array[1..6,1..5] of real;
begin
  n := Random(4)+3;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {R}~triples of numbers is given in each slave process;'#13+
'{R}~is the rank of process. Two initial items of each triple are integers,'#13+
'the last item is a real number. Send all given triples to the master process'#13+
'using derived datatype with three elements (two integers and a real number)'#13+
'and one collective operation with the derived datatype. Output received data'#13+
'in the master process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('В каждом подчиненном процессе даны {R}~троек чисел, где {R}~\= ранг процесса.',0,1);
  TaskText('Два первых числа в каждой тройке являются целыми, а последнее~\= вещественным.',0,2);
  TaskText('Используя производный тип, содержащий три числа (два целых и одно',0,3);
  TaskText('вещественное), переслать числа из подчиненных процессов в главный и вывести',0,4);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,5);
*)
  for i := 1 to n-1 do
  for j := 1 to i do
  begin
      a[i,j] := Random(90) + 10;
      c[i,j] := Random(90) + 10;
      b[i,j] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',3,y+i);
    x := 13;
    for j := 1 to i do
    begin
      DataN2('', a[i,j], c[i,j], x, y+i, 3);
      DataR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,y+1);
  for i := 1 to n - 1 do
  begin
    x := 13;
    for j := 1 to i do
    begin
      ResultN2('', a[i,j], c[i,j], x, y+i, 3);
      ResultR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetTestCount(5);
end;

procedure MpiF1;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'Two sequences of {K}~numbers are given in the master process;'#13+
'{K} is the amount of processes. The first given sequence contains integers,'#13+
'the second given sequence contains real numbers. Send all data to each slave'#13+
'process using the MPI\_Pack and MPI\_Unpack functions and one collective'#13+
'operation. Output received data in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе даны два набора: первый содержит {K}~целых, а второй',0,1);
  TaskText('{K}~вещественных чисел, где {K}~\= количество процессов. Используя функции',0,2);
  TaskText('упаковки MPI\_Pack и MPI\_Unpack и одну коллективную операцию пересылки данных,',0,3);
  TaskText('переслать все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n do
  begin
      a[i] := Random(90) + 10;
      b[i] := 10 + Random*89.98;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',9,y+i);
    for j := 1 to n do
      ResultN('', a[j], Center(j,n,2,1)-12, y+i, 2);
    for j := 1 to n do
      ResultR('', b[j], Center(j,n,5,1)+16, y+i, 5);
  end;
  SetProcess(0);
    DataComment('Process 0:',9,3);
    for j := 1 to n do
      DataN('', a[j], Center(j,n,2,1)-12, 3, 2);
    for j := 1 to n do
      DataR('', b[j], Center(j,n,5,1)+16, 3, 5);
  SetTestCount(5);
end;

procedure MpiF2;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1~triples of numbers is given in the master process;'#13+
'{K}~is the amount of processes. The first item and the last item'#13+
'of each triple are integers, the middle item is a real number. Send'#13+
'one given triple at a time to each slave process using the pack/unpack'#13+
'functions and one collective operation. Output received numbers'#13+
'in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первое и третье число каждой тройки является целым, а второе число~\=',0,2);
  TaskText('вещественным. Используя функции упаковки и одну коллективную операцию',0,3);
  TaskText('пересылки данных, переслать по одной тройке чисел в подчиненные процессы',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataR('', b[j], 1+j*13+3, 3, 5);
      DataN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiF3;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1~triples of numbers is given in the master process;'#13+
'{K}~is the amount of processes. Two initial items of each triple'#13+
'are integers, the last item is a real number. Send all given triples'#13+
'to each slave process using the pack/unpack functions and one collective'#13+
'operation. Output received data in each slave process in the same order.'
  );
(*
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первые два числа каждой тройки являются целыми, а третье число~\=',0,2);
  TaskText('вещественным. Используя функции упаковки и одну коллективную операцию',0,3);
  TaskText('пересылки данных, переслать все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataN('', c[j], 1+j*13+3, 3, 2);
      DataR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiF4;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'A triple of numbers is given in each slave process. Two initial items'#13+
'of each triple are integers, the last item is a real number. Send the given'#13+
'triples from each slave process to the master process using the pack/unpack'#13+
'functions and one collective operation. Output received data in the master'#13+
'process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('В каждом подчиненном процессе даны три числа: два целых и одно',0,1);
  TaskText('вещественное. Используя функции упаковки и одну коллективную операцию',0,2);
  TaskText('пересылки данных, переслать числа из подчиненных процессов в главный',0,3);
  TaskText('и вывести полученные числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов.',0,5);
*)
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataN('', c[i], 35+3, y+i, 2);
      DataR('', b[i], 35+6, y+i, 5);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, 3, 2);
      ResultN('', c[j], 1+j*13+3, 3, 2);
      ResultR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiF5;
var i,n,y,j: integer;
  a: array[1..6,1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(3)+3;
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'A real number and a sequence of {R}~integers are given in each slave process;'#13+
'{R} is the rank of process (one integer is given in the process~1,'#13+
'two integers are given in the process~2, and so~on). Send all given data'#13+
'from each slave process to the master process using the pack/unpack'#13+
'functions and one collective operation. Output received data in the master'#13+
'process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('В каждом подчиненном процессе дан набор из одного вещественного и {R}~целых',0,1);
  TaskText('чисел, где значение~{R} равно рангу процесса (в процессе 1 дано одно целое',0,2);
  TaskText('число, в процессе 2~\= два целых числа, и т.\,д.). Используя функции упаковки',0,3);
  TaskText('и одну функцию передачи и приема, переслать все данные в главный процесс',0,4);
  TaskText('и вывести эти данные в порядке возрастания рангов переславших их процессов.',0,5);
*)
  for i := 1 to n-1 do
  begin
    for j := 1 to i do
      a[i,j] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
    for j := 1 to i do
      DataN('', a[i,j], 38+j*3, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
    y := 13;
    for i := 1 to n-1 do
    begin
      y := y + 1;
      ResultR('', b[i], y, 3, 5);
      y := y + 6;
      for j := 1 to i do
      begin
        ResultN('', a[i,j], y, 3, 2);
        y := y + 3;
      end;
    end;
  SetTestCount(5);
end;

procedure MpiF14a;
var i,j,k,n,x1,y1: integer;
    a,b: array[0..40] of integer;

    s: string;
begin
  n := RandomN(5,9);
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'Two sequences of integers are given in the master process: the sequence {A}'#13+
'of the size 3{K} and the sequence {N} of the size {K}, where {K} is the number'#13+
'of slave processes. The elements of sequences are numbered from 1.'#13+
'Send {N}_{R} elements of the sequence {A} to each slave process {R} ({R}~=~1, 2,~\., {K})'#13+
'starting with the {A}_{R} and increasing the ordinal number by 2 ({R}, {R}\,+\,2,'#13+
'{R}\,+\,4,~\.). For example, if {N}_2 is equal to 3 then the process 2 should receive'#13+
'the elements {A}_2, {A}_4, {A}_6. Output all received data in each slave process.'#13+
'Use one call of the MPI\_Send, MPI\_Probe, and MPI\_Recv functions for sending'#13+
'numbers to each slave process; the MPI\_Recv function should return an array'#13+
'that contains only elements that should be output. To do this, define'#13+
'a new datatype that contains a single integer and an additional empty space'#13+
'(\Ia hole\i) of a size that is equal to the size of integer datatype.'#13+
'Use the following data as parameters for the MPI\_Send function: the given'#13+
'array {A} with the appropriate displacement, the amount {N}_{R} of sending elements,'#13+
'a new datatype. Use an integer array of the size {N}_{R} and the MPI\_INT datatype'#13+
'in the MPI\_Recv function. To determine the number {N}_{R} of received elements,'#13+
'use the MPI\_Get\_count function in the slave processes.'#13+
'\P\SNote.\s Use the MPI\_Type\_create\_resized function to define the hole size'#13+
'for a new datatype (this function should be applied to the MPI\_INT datatype).'#13+
'In the MPI-1, the zero-size \Iupper-bound marker\i MPI\_UB should be used jointly'#13+
'with the the MPI\_Type\_struct for this purpose (in MPI-2, the MPI\_UB'#13+
'pseudo-datatype is deprecated).'
);
//2020.10

(*
TaskText(
 'В главном процессе даны два набора целых чисел: {A} размера 3{K} и {N} размера {K},'#13#10
+'где {K} \= количество подчиненных процессов. Считая, что элементы наборов'#13#10
+'нумеруются от 1, переслать и вывести в каждом подчиненном процессе ранга {R}'#13#10
+'({R}~=~1, 2,~\., {K}) {N}_{R} элементов из набора {A}, начиная с элемента {A}_{R} и перебирая'#13#10
+'их через один (например, если {N}_2 равно 3, то в процесс ранга 2 надо переслать'#13#10
+'элементы {A}_2, {A}_4, {A}_6). Использовать для пересылки каждого набора элементов'#13#10
+'по одному вызову функций MPI\_Send, MPI\_Probe и MPI\_Recv, причем функция'#13#10
+'MPI\_Recv должна возвращать массив, содержащий только те элементы, которые'#13#10
+'требуется вывести. Для этого в главном процессе определить новый тип,'#13#10
+'содержащий единственный целочисленный элемент и дополнительный конечный'#13#10
+'\Iпустой промежуток\i, равный размеру элемента целого типа. Использовать в функции'#13#10
+'MPI\_Send исходный массив {A} с требуемым смещением, указав в качестве второго'#13#10
+'параметра количество элементов, равное {N}_{R}, а в качестве третьего'#13#10
+'параметра \= новый тип. В функции MPI\_Recv использовать целочисленный массив'#13#10
+'размера {N}_{R} и тип MPI\_INT. Для определения количества {N}_{R} переданных'#13#10
+'элементов использовать в подчиненных процессах функцию MPI\_Get\_count.'#13#10
+'\P\SУказание.\s Для задания завершающего пустого промежутка при определении нового'#13#10
+'типа в MPI-2 следует использовать функцию MPI\_Type\_create\_resized (в данном'#13#10
+'случае эту функцию надо применить к типу MPI\_INT). В MPI-1 надо использовать'#13#10
+'\Iметку нулевого размера\i типа MPI\_UB совместно с функцией MPI\_Type\_struct'#13#10
+'(в стандарте MPI-2 тип MPI\_UB объявлен устаревшим).'
);
*)
  for i := 0 to 3*n do
  begin
    a[i] := RandomN(10,99);
    b[i] := RandomN(2, n);
  end;
  SetProcess(0);
  x1 := 1;
  DataComment(prc(0), 1, 1);
  DataComment('A: ', 4, 2);
  x1 := 5;
  for i := 0 to 3*n-4 do
  begin
    x1 := x1 + 3;
    DataN(a[i], x1, 2, 2);
  end;
  DataComment('N: ', 4, 4);
  x1 := 5;
  for i := 1 to n-1 do
  begin
    x1 := x1 + 3;
    DataN(b[i], x1, 4, 2);
  end;

  for i := 1 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    ResultComment(prc(i) + 'A: ', 1, i);
    x1 := x1 + 12;
    k := i - 1;
    for j := 1 to b[i] do
    begin
      x1 := x1 + 3;
      ResultN(a[k], x1, i, 2);
      k := k + 2;
    end;
  end;
  SetTestCount(5);
end;

procedure MpiF15a;
var i,j,k,n,x1,y1: integer;
    a: array[1..10,1..10] of real;

    s: string;
begin
  n := RandomN(5,9);
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'An real-valued square matrix of order {K} is given in the master process;'#13+
'{K} is the number of slave processes. Elements of the matrix should be stored'#13+
'in a one-dimensional array {A} in a row-major order. The columns of matrix'#13+
'are numbered from 1. Send {R}-th column of matrix to the process of rank {R}'#13+
'({R}~=~1, 2,~\., {K}) and output all received elements in each slave process.'#13+
'Use one call of the MPI\_Send and MPI\_Recv functions for sending elements'#13+
'to each slave process; the MPI\_Recv function should return an array that'#13+
'contains only elements that should be output. To do this, define a new'#13+
'datatype that contains a single real number and an additional empty space'#13+
'(\Ia hole\i) of the appropriate size. Use the following data as parameters'#13+
'for the MPI\_Send function: the given array {A} with the appropriate'#13+
'displacement, the amount {K} of sending elements (i.~e., the size of column),'#13+
'a new datatype. Use a real-valued array of the size {K} and the MPI\_DOUBLE'#13+
'datatype in the MPI\_Recv function. \P\SNote.\s See the note to \1.'
);
(*
TaskText(
 'В главном процессе дана вещественная квадратная матрица порядка {K}, где {K} \='#13#10
+'количество подчиненных процессов (матрица должна храниться в одномерном'#13#10
+'массиве {A}, в котором элементы матрицы располагаются по строкам). Считая,'#13#10
+'что столбцы матрицы нумеруются от 1, переслать и вывести в каждом подчиненном'#13#10
+'процессе ранга {R} ({R}~=~1, 2,~\., {K}) элементы столбца матрицы с номером {R}.'#13#10
+'Использовать по одному вызову функций MPI\_Send и MPI\_Recv, причем функция'#13#10
+'MPI\_Recv должна возвращать массив, содержащий только те элементы, которые'#13#10
+'требуется вывести. Для этого в главном процессе определить новый тип,'#13#10
+'содержащий единственный вещественный элемент и дополнительный конечный пустой'#13#10
+'промежуток требуемого размера. Использовать в функции MPI\_Send массив {A}'#13#10
+'с требуемым смещением, указав в качестве второго параметра число {K}'#13#10
+'(т.\,е. количество элементов в каждом столбце), а в качестве третьего'#13#10
+'параметра \= новый тип. В функции MPI\_Recv использовать вещественный массив'#13#10
+'размера {K} и тип MPI\_DOUBLE. \P\SУказание.\s См. указание к задаче \1.'
);
*)
  for i := 1 to n-1 do
  for j := 1 to n-1 do
  begin
    a[i,j] := RandomR(1,9.9);
  end;
  SetProcess(0);
  x1 := 1;
  DataComment(prc(0), 1, 1);
  for i := 1 to n-1 do
  begin
  x1 := 8;
  for j := 1 to n-1 do
  begin
    x1 := x1 + 5;
    DataR(a[i,j], x1, i, 4);
  end;
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    ResultComment(prc(i), 1, i);
    x1 := 8;
    for j := 1 to n-1 do
    begin
      x1 := x1 + 5;
      ResultR(a[j,i], x1, i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiF16a;
var i,j,k,n,x1,y1: integer;
    a: array[1..10,1..10] of real;

    s: string;
begin
  n := RandomN(5,9);
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'{R}-th column of a real-valued square matrix of order {K} is given in the slave'#13+
'process of rank {R} ({R}~=~1, 2,~\., {K}); {K} is the number of slave processes,'#13+
'the columns of matrix are numbered from 1. Send all columns to the master'#13+
'process and store them in a one-dimensional array {A} in a row-major order.'#13+
'Output all elements of {A} in the master process. Use one call of the MPI\_Send'#13+
'and MPI\_Recv functions for sending elements of each column; the resulting'#13+
'array {A} with the appropriate displacement should be the first parameter'#13+
'for the MPI\_Recv function, and a number 1 should be its second parameter.'#13+
'To do this, define a new datatype (in the master process) that contains'#13+
'{K} real numbers and an empty space (\Ia hole\i) of the appropriate size after'#13+
'each number. Define a new datatype in two steps. In the first step, define'#13+
'auxiliary datatype that contains one real number and additional hole'#13+
'(see the note to \2). In the second step, define the final datatype'#13+
'using the MPI\_Type\_contiguous function (this datatype should be the third'#13+
'parameter for the MPI\_Recv function). The MPI\_Type\_commit function'#13+
'is sufficient to call only for the final datatype. Use a real-valued array'#13+
'of size {K} and the MPI\_DOUBLE datatype in the MPI\_Send function.'
);
(*
TaskText(
 'В каждом из подчиненных процессов дан столбец вещественной квадратной матрицы'#13#10
+'порядка {K}, где {K} \= количество подчиненных процессов, причем в процессе ранга {R}'#13#10
+'({R}~=~1,~\., {K}) содержится столбец с номером {R}, если считать, что столбцы'#13#10
+'нумеруются от 1. Переслать все столбцы матрицы в главный процесс, разместив их'#13#10
+'в одномерном массиве {A}, в котором элементы матрицы хранятся по строкам,'#13#10
+'и вывести полученный массив {A}. Для пересылки каждого столбца использовать'#13#10
+'по одному вызову функций MPI\_Send и MPI\_Recv, причем функция MPI\_Recv должна'#13#10
+'в качестве первого параметра содержать массив {A} (с требуемым смещением),'#13#10
+'а в качестве второго параметра \= число 1. Для этого в главном процессе'#13#10
+'определить новый тип, содержащий {K} вещественных элементов, после каждого'#13#10
+'из которых следует пустой промежуток требуемого размера. Определение нового'#13#10
+'типа провести в два этапа: на первом создать вспомогательный тип, состоящий'#13#10
+'из одного вещественного числа и требуемого конечного пустого промежутка'#13#10
+'(см. указание к \2), на втором \= создать на его основе итоговый'#13#10
+'тип с помощью функции MPI\_Type\_contiguous, который использовать в качестве'#13#10
+'третьего параметра функции MPI\_Recv (функцию MPI\_Type\_commit достаточно'#13#10
+'вызвать только для итогового типа). В функции MPI\_Send использовать'#13#10
+'вещественный массив размера {K} и тип MPI\_DOUBLE.'
);
*)
  for i := 1 to n-1 do
  for j := 1 to n-1 do
  begin
    a[i,j] := RandomR(1,9.9);
  end;
  SetProcess(0);
  x1 := 1;
  ResultComment(prc(0), 1, 1);
  for i := 1 to n-1 do
  begin
  x1 := 8;
  for j := 1 to n-1 do
  begin
    x1 := x1 + 5;
    ResultR(a[i,j], x1, i, 4);
  end;
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    DataComment(prc(i), 1, i);
    x1 := 8;
    for j := 1 to n-1 do
    begin
      x1 := x1 + 5;
      DataR(a[j,i], x1, i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiF17a;
var
  n, m, k, i, j, j0, j1, x1, x2, y1, y2: integer;
  f: file of integer;
  c: array[1..250] of integer;
begin
  n := 3*RandomN(1,3)+1;
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'The number of slave processes {K} is a multiple of 3 and does not exceed~9.'#13+
'An integer {N} is given in each process, all the numbers {N} are the same'#13+
'and are in the range from 3 to 5. Also an integer square matrix of order {N}'#13+
'(\Ia block\i) is given in each slave process; the block should be stored'#13+
'in a one-dimensional array {B} in a row-major order. Send all arrays {B}'#13+
'to the master process and compose a block matrix of the size ({K}/3)~\x~3'#13+
'(the size is indicated in blocks) using a row-major order for blocks'#13+
'(i.~e., the first row of blocks should include blocks being received'#13+
'from the processes 1, 2, 3, the second row of blocks should include blocks'#13+
'from the processes 4, 5, 6, and so~on). Store the block matrix'#13+
'in the one-dimensional array {A} in a row-major order. Output all elements of {A}'#13+
'in the master process. Use one call of the MPI\_Send and MPI\_Recv functions'#13+
'for sending each block {B}; the resulting array {A} with the appropriate'#13+
'displacement should be the first parameter for the MPI\_Recv function,'#13+
'and a number 1 should be its second parameter. To do this, define a new'#13+
'datatype (in the master process) that contains {N} sequences, each sequence'#13+
'contains {N} integers, and an empty space (\Ia hole\i) of the appropriate size'#13+
'should be placed between the sequences. Define the required datatype using'#13+
'the MPI\_Type\_vector function (this datatype should be the third parameter'#13+
'for the MPI\_Recv function). Use the array {B} of size {N}\*{N}'#13+
'and the MPI\_INT datatype in the MPI\_Send function.'
);
(*
TaskText(
 'Количество подчиненных процессов {K} кратно 3 и не превосходит 9. В каждом'#13#10
+'процессе дано целое число {N}; все числа {N} одинаковы и лежат в диапазоне'#13#10
+'от 3 до 5. Кроме того, в каждом подчиненном процессе дана целочисленная'#13#10
+'квадратная матрица порядка {N} (\Iблок\i), которую следует прочесть в одномерный'#13#10
+'массив {B} по строкам. Переслать все массивы {B} в главный процесс и составить'#13#10
+'из них \Iблочную матрицу\i размера ({K}/3)~\x~3 (размер указан в блоках), располагая'#13#10
+'блоки по строкам (первая строка блоков должна содержать блоки, полученные'#13#10
+'из процессов ранга 1, 2, 3, вторая \= из процессов ранга 4, 5, 6, и~т.\,д.).'#13#10
+'Блочная матрица должна храниться по строкам в одномерном массиве {A}.'#13#10
+'Использовать для пересылки каждого блока {B} по одному вызову функций MPI\_Send'#13#10
+'и MPI\_Recv, причем функция MPI\_Recv должна в качестве первого параметра'#13#10
+'содержать массив {A} (с требуемым смещением), а в качестве второго параметра \='#13#10
+'число 1. Для этого в главном процессе определить новый тип, содержащий'#13#10
+'{N} наборов элементов, причем каждый набор содержит {N} целых чисел, а между'#13#10
+'наборами располагается пустой промежуток требуемого размера (при определении'#13#10
+'нового типа использовать функцию MPI\_Type\_vector). Указать созданный тип'#13#10
+'в качестве третьего параметра функции MPI\_Recv. В функции MPI\_Send'#13#10
+'использовать целочисленный массив {B} (размера {N}\*{N}) и тип MPI\_INT.'
);
*)
  k := RandomN(2,5);
  if n = 10 then
    k := RandomN(2,4);
  m := (n-1)*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
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
        DataN(prc(i)+'N = ', k, x1, y1, 1);
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        DataN(c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3], x1, y1, 2);
      end;
      end;
    end;
  end;
  SetProcess(0);
  DataN(prc(0)+'N = ', k, 1, y1 + 1, 1);
  ResultComment(prc(0), 1, 1);
  x1 := 8;
  y1 := 2;
  for i := 1 to m do
  begin
    ResultN(c[i], x1, y1, 3);
    x1 := x1 + 4;
    if i mod (3*k) = 0 then
    begin
      x1 := 8;
      y1 := y1 + 1;
    end;
  end;

end;

procedure MpiF18a;
var
  n, m, k, i, j, i0, j0, j1, x1, x2, y1, y2, c0: integer;
  f: file of integer;
  c: array[1..250] of integer;
begin
  n := 3*RandomN(1,3)+1;
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'The number of slave processes {K} is a multiple of 3 and does not exceed~9.'#13+
'An integer {N} in the range from 3 to 5 and an integer \Iblock matrix\i'#13+
'of the size ({K}/3)~\x~3 (the size is indicated in blocks) are given'#13+
'in the master process. Each block is \Ia lower triangular matrix\i of order {N},'#13+
'the block contains all matrix elements, including zero-valued ones.'#13+
'The block matrix should be stored in the one-dimensional array {A}'#13+
'in a row-major order. Send a non-zero part of each block to the corresponding'#13+
'slave process in a row-major order of blocks (i.~e., the blocks'#13+
'of the first row should be sent to the processes 1, 2, 3, the blocks'#13+
'of the second row should be sent to the processes 4, 5, 6, and so on).'#13+
'Output all received elements in each slave process (in a row-major order).'#13+
'Use one call of the MPI\_Send, MPI\_Probe, and MPI\_Recv functions for sending'#13+
'each block; the resulting array {A} with the appropriate displacement should be'#13+
'the first parameter for the MPI\_Send function, and a number 1 should be'#13+
'its second parameter. To do this, define a new datatype (in the master'#13+
'process) that contains {N} sequences, each sequence contains non-zero part'#13+
'of the next row of a lower triangular block (the first sequence consists'#13+
'of 1 element, the second sequence consists of 2 elements, and so~on),'#13+
'and an empty space (\Ia hole\i) of the appropriate size should be placed between'#13+
'the sequences. Define the required datatype using the MPI\_Type\_indexed'#13+
'function (this datatype should be the third parameter for the MPI\_Send'#13+
'function). Use an integer array {B}, which contains a non-zero part of received'#13+
'block, and the MPI\_INT datatype in the MPI\_Recv function. To determine'#13+
'the number of received elements, use the MPI\_Get\_count function'#13+
'in the slave processes.'
);
(*
TaskText(
 'Количество подчиненных процессов {K} кратно 3 и не превосходит 9. В главном'#13#10
+'процессе дано целое число {N}, лежащее в диапазоне от 3 до 5, и целочисленная'#13#10
+'блочная матрица порядка ({K}/3)~\x~3 (размер указан в блоках). Каждый блок'#13#10
+'представляет собой \Iнижнетреугольную\i квадратную матрицу порядка {N}'#13#10
+'и содержит все элементы этой матрицы (в том числе и нулевые). Блочную'#13#10
+'матрицу следует прочесть в одномерный массив {A} по строкам. Переслать в каждый'#13#10
+'подчиненный процесс ненулевую часть соответствующего блока исходной матрицы,'#13#10
+'перебирая блоки по строкам (блоки из первой строки должны пересылаться'#13#10
+'в процессы ранга 1, 2,~3, блоки из второй строки \= в процессы ранга 4, 5,~6,'#13#10
+'и~т.\,д.), и вывести в каждом подчиненном процессе полученные данные'#13#10
+'(по строкам). Использовать для пересылки каждого блока по одному вызову'#13#10
+'функций MPI\_Send, MPI\_Probe и MPI\_Recv, причем функция MPI\_Send должна'#13#10
+'в качестве первого параметра содержать массив {A} (с требуемым смещением),'#13#10
+'а в качестве второго параметра \= число 1. Для этого в главном процессе'#13#10
+'определить новый тип, содержащий {N} наборов элементов, причем каждый набор'#13#10
+'содержит ненулевую часть очередной строки блока (первый набор состоит'#13#10
+'из одного элемента, второй из двух, и~т.\,д.), а между наборами располагается'#13#10
+'пустой промежуток требуемого размера (при определении нового типа использовать'#13#10
+'функцию MPI\_Type\_indexed). Указать созданный тип в качестве третьего параметра'#13#10
+'функции MPI\_Send. В функции MPI\_Recv использовать целочисленный массив {B}'#13#10
+'(содержащий ненулевую часть полученного блока) и тип MPI\_INT. Для определения'#13#10
+'количества переданных элементов использовать в подчиненных'#13#10
+'процессах функцию MPI\_Get\_count.'
);
*)
  k := RandomN(2,5);
  if n = 10 then
    k := RandomN(2,4);
  m := (n-1)*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to (n-1) div 3 do
    for j := 1 to 3 do
    begin
      for i0 := 0 to k-1 do
        for j0 := i0+1 to k-1 do
          c[(i-1)*3*k*k + i0*3*k + (j-1)*k + 1 + j0] := 0
    end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
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
        ResultComment(prc(i), x1, y1);
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        c0 := c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3];
        if c0 <> 0 then
          ResultN(c0, x1, y1, 2);
      end;
      end;
    end;
  end;
  SetProcess(0);
  DataN(prc(0)+'N = ', k, 1, 1, 1);
  x1 := 8;
  y1 := 2;
  for i := 1 to m do
  begin
    DataN(c[i], x1, y1, 3);
    x1 := x1 + 4;
    if i mod (3*k) = 0 then
    begin
      x1 := 8;
      y1 := y1 + 1;
    end;
  end;

end;

procedure MpiF19a;
var
  n, m, k, i, j, i0, j0, j1, x1, x2, y1, y2, c0, p1, p2: integer;
  f: file of integer;
  c: array[1..250] of integer;
  a: array[1..5,1..5] of integer;
begin
  n := 3*RandomN(1,3)+1;
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'The number of slave processes {K} is a multiple of 3 and does not exceed~9.'#13+
'An integer {N} is given in each process, all the numbers {N} are the same and are'#13+
'in the range from 3 to 5. Also an integer {P} and a non-zero part of an integer'#13+
'square matrix of order {N} (\Ia Z-block\i) are given in each slave process.'#13+
'The given elements of Z-block should be stored in a one-dimensional array {B}'#13+
'in a row-major order. These elements are located in the Z-block in the form'#13+
'of the symbol \<Z\>, i.~e. they occupy the first and last row, and also'#13+
'the antidiagonal. Define a zero-valued integer matrix of the size {N}\*({K}/3)~\x~3{N}'#13+
'in the master process (all elements of this matrix are equal to 0 and should'#13+
'be stored in a one-dimensional array {A} in a row-major order). Send a non-zero'#13+
'part of the given Z-block from each slave process to the master process'#13+
'in ascending order of ranks of sending processes and write each received'#13+
'Z-block in the array {A} starting from the element of array {A} with index {P}'#13+
'(the positions of Z-blocks can overlap, in this case the elements of blocks'#13+
'received from processes of higher rank will replace some of the elements'#13+
'of previously written blocks). Output all elements of {A} in the master process.'#13+
'Use one call of the MPI\_Send and MPI\_Recv functions for sending each Z-block;'#13+
'the array {A} with the appropriate displacement should be the first parameter'#13+
'for the MPI\_Recv function, and a number 1 should be its second parameter.'#13+
'To do this, define a new datatype (in the master process) that contains'#13+
'{N} sequences, the first and the last sequences contain {N} integers, the other'#13+
'sequences contain 1 integer, and an empty space (\Ia hole\i) of the appropriate'#13+
'size should be placed between the sequences. Define the required datatype'#13+
'using the MPI\_Type\_indexed function (this datatype should be the third'#13+
'parameter for the MPI\_Recv function). Use the array {B}, which contains'#13+
'a non-zero part of a Z-block, and the MPI\_INT datatype in the MPI\_Send'#13+
'function. \P\SNote.\s Use the msgtag parameter to send the Z-block insertion'#13+
'position {P} to the master process. To do this, set the value of {P} as the msgtag'#13+
'parameter for the MPI\_Send function in slave processes, call the MPI\_Probe'#13+
'function with the MPI\_ANY\_TAG parameter in the master process'#13+
'(before calling the MPI\_Recv function), and analyze'#13+
'its returned parameter of the MPI\_Status type.'
);
(*
TaskText(
 'Количество подчиненных процессов {K} кратно 3 и не превосходит 9. В каждом'#13#10
+'процессе дано целое число {N}; все числа {N} одинаковы и лежат в диапазоне'#13#10
+'от 3 до 5. Кроме того, в каждом подчиненном процессе дано целое число {P}'#13#10
+'и ненулевые элементы целочисленной квадратной матрицы порядка {N} (\I{Z}-блока\i),'#13#10
+'которую следует прочесть в одномерный массив {B} по строкам. Ненулевые элементы'#13#10
+'располагаются в {Z}-блоке в форме символа \<Z\>, т.\,е. занимают первую и последнюю'#13#10
+'строку, а также побочную диагональ. Определить в главном процессе нулевую'#13#10
+'целочисленную прямоугольную матрицу размера {N}\*({K}/3)~\x~3{N}, создав для этого'#13#10
+'одномерный массив {A} и обнулив его элементы (которые должны храниться'#13#10
+'в массиве {A} по строкам). Перебирая подчиненные процессы в порядке возрастания'#13#10
+'их рангов, переслать из каждого подчиненного процесса данную в нем ненулевую'#13#10
+'часть {Z}-блока и записать полученный блок в массив {A}, начиная с элемента'#13#10
+'массива {A} с индексом {P} (позиции {Z}-блоков могут перекрываться; в этом случае'#13#10
+'элементы блоков, полученных из процессов большего ранга, будут заменять'#13#10
+'некоторые из элементов ранее записанных блоков). Использовать для пересылки'#13#10
+'ненулевой части каждого {Z}-блока по одному вызову функций MPI\_Send и MPI\_Recv,'#13#10
+'причем функция MPI\_Recv должна в качестве первого параметра содержать массив {A}'#13#10
+'(с требуемым смещением), а в качестве второго параметра \= число 1. Для этого'#13#10
+'в главном процессе определить новый тип, содержащий {N} наборов элементов,'#13#10
+'причем первый и последний набор содержат по {N} целых чисел, остальные наборы \='#13#10
+'по одному числу, а между наборами располагается пустой промежуток требуемого'#13#10
+'размера (при определении нового типа использовать функцию MPI\_Type\_indexed).'#13#10
+'Указать созданный тип в качестве третьего параметра функции MPI\_Recv.'#13#10
+'В функции MPI\_Send использовать целочисленный массив {B}, содержащий ненулевую'#13#10
+'часть {Z}-блока (по строкам), и тип MPI\_INT.'#13#10
+'\P\SУказание.\s Для передачи в главный процесс позиции {P} вставки {Z}-блока'#13#10
+'используйте параметр msgtag; для этого в подчиненных процессах задавайте'#13#10
+'значение {P} в качестве параметра msgtag функции MPI\_Send, а в главном'#13#10
+'процессе до вызова функции MPI\_Recv вызывайте функцию MPI\_Probe с параметром'#13#10
+'MPI\_ANY\_TAG и анализируйте возвращенный ею параметр типа MPI\_Status.'
);
*)
  k := RandomN(3,5);
  if n = 10 then
    k := RandomN(3,4);
  m := (n-1)*k*k;
  for i := 1 to m do
    c[i] := 0;
{  for i := 1 to (n-1) div 3 do
    for j := 1 to 3 do
    begin
      for i0 := 0 to k-1 do
        for j0 := i0+1 to k-1 do
          c[(i-1)*3*k*k + i0*3*k + (j-1)*k + 1 + j0] := 0
    end;}
  for i := 1 to n-1 do
  begin
    SetProcess(i);
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
        DataN(prc(i)+ 'N=', k, x1, y1, 1);
        p1 := RandomN(1, (n-1) div 3 *k - k + 1);
        p2 := RandomN(1, 2*k + 1);
        DataN('P=', (p1-1)*3*k+p2-1, x1+16, y1, 1);
        for i0 := 1 to k do
          for j0 := 1 to k do
          begin
            a[i0,j0] := i * 10 + RandomN(1,9);
            if (i0 > 1) and (i0 < k) and (j0+i0<>k+1) then
              a[i0,j0] := 0;
          end;
        a[1,1] := i * 10;
        for i0 := 1 to k do
          for j0 := 1 to k do
          if a[i0, j0] <> 0 then
            c[(p1-1)*3*k+p2-1 + (i0-1)*3*k + j0] := a[i0,j0];

      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        c0 := a[j,j0];//c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3];
        if c0 <> 0 then
          DataN(c0, x1, y1, 2);
      end;
      end;
    end;
  end;
  SetProcess(0);
  DataN(prc(0)+'N=', k, 1, y1 + 1, 1);
  ResultComment(prc(0), 1, 1);
  x1 := 8;
  y1 := 2;
  for i := 1 to m do
  begin
    ResultN(c[i], x1, y1, 3);
    x1 := x1 + 4;
    if i mod (3*k) = 0 then
    begin
      x1 := 8;
      y1 := y1 + 1;
    end;
  end;

end;

procedure MpiF20a;
var
  n, m, k, i, j, i0, j0, j1, x1, x2, y1, y2, c0, p1, p2: integer;
  f: file of integer;
  c: array[1..250] of integer;
  a: array[1..5,1..5] of integer;
begin
  n := 3*RandomN(1,3)+1;
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'The number of slave processes {K} is a multiple of 3 and does not exceed~9.'#13+
'An integer {N} is given in each process, all the numbers {N} are the same and are'#13+
'in the range from 3 to 5. Also an integer {P} and a non-zero part of an integer'#13+
'square matrix of order {N} (\Ian U-block\i) are given in each slave process.'#13+
'The given elements of U-block should be stored in a one-dimensional array {B}'#13+
'in a row-major order. These elements are located in the U-block in the form'#13+
'of the symbol \<U\>, i.~e. they occupy the first and last column, and also'#13+
'the last row. Define a zero-valued integer matrix of the size {N}\*({K}/3)~\x~3{N}'#13+
'in the master process (all elements of this matrix are equal to 0 and should'#13+
'be stored in a one-dimensional array {A} in a row-major order). Send a non-zero'#13+
'part of the given U-block from each slave process to the master process'#13+
'in ascending order of ranks of sending processes and write each received'#13+
'U-block in the array {A} starting from the element of array {A} with index {P}'#13+
'(the positions of U-blocks can overlap, in this case the elements of blocks'#13+
'received from processes of higher rank will replace some of the elements'#13+
'of previously written blocks). Output all elements of {A} in the master process.'#13+
'Use one call of the MPI\_Send and MPI\_Recv functions for sending each U-block;'#13+
'the array {A} with the appropriate displacement should be the first parameter'#13+
'for the MPI\_Recv function, and a number 1 should be its second parameter.'#13+
'To do this, define a new datatype (in the master process) that contains'#13+
'appropriate number of sequences with empty spaces (\Iholes\i) between them. Define'#13+
'the required datatype using the MPI\_Type\_indexed function (this datatype'#13+
'should be the third parameter for the MPI\_Recv function). Use the array {B},'#13+
'which contains a non-zero part of an U-block, and the MPI\_INT datatype'#13+
'in the MPI\_Send function. \P\SNote.\s See the note to \1.'
);
(*
TaskText(
 'Количество подчиненных процессов {K} кратно 3 и не превосходит 9. В каждом'#13#10
+'процессе дано целое число {N}; все числа {N} одинаковы и лежат в диапазоне'#13#10
+'от 3 до 5. Кроме того, в каждом подчиненном процессе дано целое число {P}'#13#10
+'и ненулевые элементы целочисленной квадратной матрицы порядка {N} (\I{U}-блока\i),'#13#10
+'которую следует прочесть в одномерный массив {B} по строкам. Ненулевые элементы'#13#10
+'располагаются в {U}-блоке в форме символа \<U\>, т.\,е. занимают первый и последний'#13#10
+'столбец, а также последнюю строку. Определить в главном процессе нулевую'#13#10
+'целочисленную прямоугольную матрицу размера {N}\*({K}/3)~\x~3{N}, создав для этого'#13#10
+'одномерный массив {A} и обнулив его элементы (которые должны храниться'#13#10
+'в массиве {A} по строкам). Перебирая подчиненные процессы в порядке возрастания'#13#10
+'их рангов, переслать из каждого подчиненного процесса данную в нем ненулевую'#13#10
+'часть {U}-блока и записать полученный блок в массив {A}, начиная с элемента'#13#10
+'массива {A} с индексом {P} (позиции {U}-блоков могут перекрываться; в этом случае'#13#10
+'элементы блоков, полученных из процессов большего ранга, будут заменять'#13#10
+'некоторые из элементов ранее записанных блоков). Использовать для пересылки'#13#10
+'ненулевой части каждого {U}-блока по одному вызову функций MPI\_Send и MPI\_Recv,'#13#10
+'причем функция MPI\_Recv должна в качестве первого параметра содержать массив {A}'#13#10
+'(с требуемым смещением), а в качестве второго параметра \= число 1. Для этого'#13#10
+'в главном процессе определить новый тип, содержащий требуемое количество'#13#10
+'наборов элементов с пустыми промежутками между ними (при определении нового'#13#10
+'типа использовать функцию MPI\_Type\_indexed). Указать созданный тип в качестве'#13#10
+'третьего параметра функции MPI\_Recv. В функции MPI\_Send использовать'#13#10
+'целочисленный массив {B}, содержащий ненулевую часть {U}-блока (по строкам),'#13#10
+'и тип MPI\_INT. \P\SУказание.\s См. указание к задаче \1.'
);
*)
  k := RandomN(3,5);
  if n = 10 then
    k := RandomN(3,4);
  m := (n-1)*k*k;
  for i := 1 to m do
    c[i] := 0;
{  for i := 1 to (n-1) div 3 do
    for j := 1 to 3 do
    begin
      for i0 := 0 to k-1 do
        for j0 := i0+1 to k-1 do
          c[(i-1)*3*k*k + i0*3*k + (j-1)*k + 1 + j0] := 0
    end;}
  for i := 1 to n-1 do
  begin
    SetProcess(i);
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
        DataN(prc(i)+ 'N=', k, x1, y1, 1);
        p1 := RandomN(1, (n-1) div 3 *k - k + 1);
        p2 := RandomN(1, 2*k + 1);
        DataN('P=', (p1-1)*3*k+p2-1, x1+16, y1, 1);
        for i0 := 1 to k do
          for j0 := 1 to k do
          begin
            a[i0,j0] := i * 10 + RandomN(1,9);
            if (j0 > 1) and (j0 < k) and (i0<k) then
              a[i0,j0] := 0;
          end;
        a[1,1] := i * 10;
        for i0 := 1 to k do
          for j0 := 1 to k do
          if a[i0, j0] <> 0 then
            c[(p1-1)*3*k+p2-1 + (i0-1)*3*k + j0] := a[i0,j0];

      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        c0 := a[j,j0];//c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3];
        if c0 <> 0 then
          DataN(c0, x1, y1, 2);
      end;
      end;
    end;
  end;
  SetProcess(0);
  DataN(prc(0)+'N=', k, 1, y1 + 1, 1);
  ResultComment(prc(0), 1, 1);
  x1 := 8;
  y1 := 2;
  for i := 1 to m do
  begin
    ResultN(c[i], x1, y1, 3);
    x1 := x1 + 4;
    if i mod (3*k) = 0 then
    begin
      x1 := 8;
      y1 := y1 + 1;
    end;
  end;

end;


procedure MpiF21a;
var i,j,k,n,x1,y1: integer;
    a: array[1..10,1..10] of real;

    s: string;
begin
  n := RandomN(5,9);
  CreateTask(topic4, n);
  if n = 0 then exit;
TaskText(
'Solve the \6 task by using one collective operation instead of'#13+
'the MPI\_Send and MPI\_Recv functions to pass data.'#13+
'\P\SNote.\s You cannot use the functions of the Scatter group, since'#13+
'the displacements for the passing data items (columns of the matrix) should be'#13+
'specified in \Ibytes\i rather than in elements. Therefore, you should use'#13+
'the function MPI\_Alltoallw introduced in MPI-2, which allows you to configure'#13+
'the collective communications in the most flexible way. In this case,'#13+
'the MPI\_Alltoallw function should be used to implement a data passing'#13+
'of the Scatter type (and most of the array parameters used in this function'#13+
'need to be defined differently in the master and slave processes).'
);
(*
TaskText(
 'Решить задачу \6, используя для пересылки данных вместо функций'#13#10
+'MPI\_Send и MPI\_Recv одну коллективную операцию.'#13#10
+'\P\SУказание.\s Использовать функции группы Scatter не удастся, так как значения'#13#10
+'смещений для рассылаемых элементов (столбцов матрицы) требуется указывать'#13#10
+'не в элементах, а в \Iбайтах\i. Поэтому подходящим вариантом будет введенная'#13#10
+'в MPI-2 функция MPI\_Alltoallw, позволяющая наиболее гибким образом настраивать'#13#10
+'вариант коллективной пересылки. В данном случае с ее помощью следует'#13#10
+'реализовать вариант рассылки вида Scatter (при этом большинство'#13#10
+'параметров-массивов, используемых в этой функции, необходимо'#13#10
+'по-разному определять в главном и подчиненных процессах).'
);
*)
  for i := 1 to n-1 do
  for j := 1 to n-1 do
  begin
    a[i,j] := RandomR(1,9.9);
  end;
  SetProcess(0);
  x1 := 1;
  DataComment(prc(0), 1, 1);
  for i := 1 to n-1 do
  begin
  x1 := 8;
  for j := 1 to n-1 do
  begin
    x1 := x1 + 5;
    DataR(a[i,j], x1, i, 4);
  end;
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    ResultComment(prc(i), 1, i);
    x1 := 8;
    for j := 1 to n-1 do
    begin
      x1 := x1 + 5;
      ResultR(a[j,i], x1, i, 2);
    end;
  end;
  SetTestCount(5);
end;


procedure MpiF22a;
var i,j,k,n,x1,y1: integer;
    a: array[1..10,1..10] of real;

    s: string;
begin
  n := RandomN(5,9);
  CreateTask(topic4, n);
  if n = 0 then exit;
TaskText(
'Solve the \6 task by using one collective operation instead of'#13+
'the MPI\_Send and MPI\_Recv functions to pass data.'#13+
'\P\SNote.\s See the note to \1. In this case, the MPI\_Alltoallw function'#13+
'should be used to implement a data passing of the Gather type.'
);
(*
TaskText(
 'Решить задачу \6, используя для пересылки данных вместо функций'#13#10
+'MPI\_Send и MPI\_Recv одну коллективную операцию.'#13#10
+'\P\SУказание.\s См. указание к задаче \1. В данном случае с помощью'#13#10
+'функции MPI\_Alltoallw следует реализовать вариант рассылки вида Gather.'
);
*)
  for i := 1 to n-1 do
  for j := 1 to n-1 do
  begin
    a[i,j] := RandomR(1,9.9);
  end;
  SetProcess(0);
  x1 := 1;
  ResultComment(prc(0), 1, 1);
  for i := 1 to n-1 do
  begin
  x1 := 8;
  for j := 1 to n-1 do
  begin
    x1 := x1 + 5;
    ResultR(a[i,j], x1, i, 4);
  end;
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    DataComment(prc(i), 1, i);
    x1 := 8;
    for j := 1 to n-1 do
    begin
      x1 := x1 + 5;
      DataR(a[j,i], x1, i, 2);
    end;
  end;
  SetTestCount(5);
end;


procedure InitTask(num: integer); stdcall;
begin
  case num of
{//  1: MpiA1;
  1: MpiA2;
  2: MpiA3;
//  4: MpiA4;
  3: MpiA5;
  4: MpiA6;
//  7: MpiA7;
  5: MpiA8;
  6: MpiA9;
  7: MpiB1;
  8: MpiB2;
  9: MpiB3;
 10: MpiB4;
 11: MpiB5;
 12: MpiB6;
 13: MpiB7;
 14: MpiB8;
 15: MpiB9;
 16: MpiB10;
 17: MpiB11;
 18: MpiB12;
 19: MpiB13;
 20: MpiB14;
 21: MpiB15;
 22: MpiB16;
 23: MpiB17;
 24: MpiB18;
 25: MpiB19;
 26: MpiB20;
 27: MpiB21;
 28: MpiB22;
 29: MpiB23;
 30: MpiC1;
 31: MpiC2;
 32: MpiC3;
 33: MpiC4;
 34: MpiC5;
 35: MpiC6;
 36: MpiC7;
 37: MpiC8;
 38: MpiC9;
 39: MpiC10;
 40: MpiC11;
 41: MpiC12;
 42: MpiC13;
 43: MpiC14;
 44: MpiC15;
 45: MpiC16;
 46: MpiC17;
 47: MpiC18;
 48: MpiD1;
 49: MpiD2;
 50: MpiD3;
 51: MpiD4;
 52: MpiD5;
 53: MpiD6;
 54: MpiD7;
 55: MpiD8;
 56: MpiD9;
 57: MpiD10;}
 1: MpiE1;
 2: MpiE2;
 3: MpiE3;
 4: MpiE4;
 5: MpiE5;
 6: MpiE6;
 7: MpiE7;
 8: MpiE8;
 9: MpiF1;
 10: MpiF2;
 11: MpiF3;
 12: MpiF4;
 13: MpiF5;
 14: MpiF14a;
 15: MpiF15a;
 16: MpiF16a;
 17: MpiF17a;
 18: MpiF18a;
 19: MpiF19a;
 20: MpiF20a;
 21: MpiF21a;
 22: MpiF22a;
 {
 71: MpiG1;
 72: MpiG2;
 73: MpiG3;
 74: MpiG4;
 75: MpiG5;
 76: MpiG6;
 77: MpiG7;
 78: MpiG8;
 79: MpiG9;
 80: MpiG10;
 81: MpiG11;
 82: MpiG12;
 83: MpiH1;
 84: MpiH2;
 85: MpiH3;
 86: MpiH4;
 87: MpiH5;
 88: MpiH6;
 89: MpiH7;
 90: MpiH8;
 91: MpiH9;
 92: MpiH10;
 93: MpiH11;
 94: MpiH12;
 95: MpiH13;
 96: MpiH14;
 97: MpiH15;
 98: MpiH16;
 99: MpiH17;
100: MpiH18;
}
  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI4Type', 'Derived datatypes and data packing', 'M. E. Abramyan, 2014,2017',
  'sddfgfsjnbvvdfsd78fgfgd', 22, InitTask);
//  CommentText('Если количество процессов в задании не определено, то можно считать, что это количество не превосходит~12.');
//  CommentText('Под \Iглавным процессом\i всюду в формулировках заданий понимается');
//  CommentText('Процесс ранга~0 для коммуникатора MPI\_COMM\_WORLD. Для всех процессов ненулевого ранга в заданиях используется');
//  CommentText('общее наименование \Iподчиненных процессов\i.');
//  CommentText('\PЕсли в задании не указан тип обрабатываемых чисел, то числа считаются вещественными.');
//  CommentText('Если в задании не определяется максимальный размер набора чисел, то его следует считать равным~10.');
end;

//exports inittaskgroup;

begin
end.
