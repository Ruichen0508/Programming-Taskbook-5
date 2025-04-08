{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI3Coll_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  Topic3 = 'Collective data transfer';
  Topic4 = 'Global reduction operations';

procedure MpiC1;
var i,n,y,k: integer;
begin
  n := Random(3)+4;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in the master process. Send the given integer'#13+
'to all slave processes using the MPI\_Bcast function.'#13+
'Output the received integer in all slave processes.'
  );
(*
  TaskText('В главном процессе дано целое число.',0,2);
  TaskText('Используя функцию MPI\_Bcast, переслать это число',0,3);
  TaskText('во все подчиненные процессы и вывести в них полученное число.',0,4);
*)
  k := Random(90) + 10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataN('Process 0: ', k, 0, 3, 2);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultN('Process '+Chr(i+48)+': ', k, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC2;
var i,n,y,j: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+4;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 5 real numbers is given in the master process.'#13+
'Send the given sequence to all slave processes using the MPI\_Bcast function.'#13+
'Output received data in all slave processes.'
  );

(*
  TaskText('В главном процессе дан набор из 5 чисел.',0,2);
  TaskText('Используя функцию MPI\_Bcast, переслать этот набор во все подчиненные',0,3);
  TaskText('процессы и вывести в них полученные числа в том же порядке.',0,4);
*)
  for i := 1 to 5 do
    r[i] := Random*89.99+10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataComment('Process 0:',13,3);
  for i := 1 to 5 do
  DataR('', r[i], Center(i,5,5,2), 3, 5);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
    for j := 1 to 5 do
    ResultR('', r[j], Center(j,5,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC3;
var i,n,y: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Send the given numbers to master'#13+
'process using the MPI\_Gather function. Output received numbers'#13+
'in the master process in ascending order of ranks of sending processes'#13+
'(starting with the number that is given in the master process).'
  );
(*
  TaskText('В каждом процессе дано вещественное число.',0,2);
  TaskText('Используя функцию MPI\_Gather, переслать эти числа в главный процесс',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(первым вывести число, данное в главном процессе).',0,5);
*)
  for i := 1 to n do
    r[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Process 0:',0,2);
  for i := 1 to n do
  ResultR('', r[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', r[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC4;
var i,n,y,j: integer;
  a: array[1..5,1..5] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 5 integers is given in each process. Send the given sequences'#13+
'to master process using the MPI\_Gather function. Output received data'#13+
'in the master process in ascending order of ranks of sending processes'#13+
'(starting with the sequence that is given in the master process).'
  );
(*
  TaskText('В каждом процессе дан набор из 5 целых чисел.',0,2);
  TaskText('Используя функцию MPI\_Gather, переслать эти наборы в главный процесс',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(первым вывести набор чисел, данный в главном процессе).',0,5);
*)
  for i := 1 to 5 do
    for j := 1 to 5 do
    a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Process 0:',0,2);
  for i := 1 to n do
    for j := 1 to 5 do
  ResultN('', a[i,j], Center((i-1)*5+j,5*n,2,1), 3, 2);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',22,y+i);
    for j := 1 to 5 do
      DataN('', a[i+1,j], Center(j,5,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC5;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {R}\,+\,2 integers is given in each process; the integer {R} is'#13+
'equal to rank of the process (there are given 2~integers in the process~0,'#13+
'3~integers in the process~1, and so~on). Send the given sequences to master'#13+
'process using the MPI\_Gatherv function. Output received data in the master'#13+
'process in ascending order of ranks of sending processes (starting with'#13+
'the sequence that is given in the master process).'
  );
(*
  TaskText('В каждом процессе дан набор из {R}\,+\,2 целых чисел, где число~{R} равно рангу',0,1);
  TaskText('процесса (в процессе~0 даны 2~числа, в процессе~1 даны 3~числа, и т.\,д.).',0,2);
  TaskText('Используя функцию MPI\_Gatherv, переслать эти наборы в главный процесс',0,3);
  TaskText('и вывести полученные наборы в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (первым вывести набор, данный в главном процессе).',0,5);
*)
  c := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
      c := c + 1;
    end;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Process 0:',0,2);
  c0 := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      c0 := c0 + 1;
      ResultN('', a[i,j], Center(c0,c,2,1), 3, 2);
    end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',20,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,n+1,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC6;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~real numbers is given in the master process; {K} is'#13+
'the number of processes. Send one element of given sequence to each process'#13+
'(including the master process) using the MPI\_Scatter function.'#13+
'Output the received number in each process.'
  );
(*
  TaskText('В главном процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Scatter, переслать по одному числу в каждый',0,3);
  TaskText('процесс (включая главный) и вывести в каждом процессе полученное число.',0,4);
*)
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
      DataR('', a[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC7;
var i,n,y,j: integer;
  a: array[1..5,1..3] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 3{K} real numbers is given in the master process, {K} is the number'#13+
'of processes. Send three elements of given sequence to each process'#13+
'(including the master process) using the MPI\_Scatter function.'#13+
'Output received numbers in each process.'
  );

(*
  TaskText('В главном процессе дан набор из 3{K} чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Scatter, переслать по 3~числа в каждый процесс',0,3);
  TaskText('(включая главный) и вывести в каждом процессе полученные числа.',0,4);
*)
  for i := 1 to n do
    for j := 1 to 3 do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
    for j := 1 to 3 do
      DataR('', a[i,j], Center((i-1)*3+j,3*n,4,1), 3, 4);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',21,y+i);
    for j := 1 to 3 do
      ResultR('', a[i+1,j], Center(j,3,4,2), y+i, 4);
  end;
  SetTestCount(5);
end;

procedure MpiC8;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~real numbers is given in the master process; {K} is the number'#13+
'of processes. Using the MPI\_Scatterv function, send elements of given'#13+
'sequence to all processes as follows: the first element should be sent'#13+
'to the process~{K}\,\-\,1, the second element should be sent'#13+
'to the process~{K}\,\-\,2, \., the last element should be sent to the process~0).'#13+
'Output the received number in each process.'
  );
(*
  TaskText('В главном процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Не меняя порядок расположения чисел в исходном наборе и используя функцию',0,2);
  TaskText('MPI\_Scatterv, переслать по одному числу в каждый процесс; при этом первое',0,3);
  TaskText('число надо переслать в процесс~{K}\,\-\,1, второе число~\= в процесс~{K}\,\-\,2, \.,',0,4);
  TaskText('последнее число~\= в процесс~0. Вывести в каждом процессе полученное число.',0,5);
*)  
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
      DataR('', a[n-i+1], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC9;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,3)/2 integers is given in the master process;'#13+
'{K} is the number of processes. Using the MPI\_Scatterv function,'#13+
'send {R}\,+\,2 elements of given sequence to the process of rank {R},'#13+
'where {R}~=~0,~\., {K}\,\-\,1: the first two elements should be sent'#13+
'to the process~0, the next three elements should be sent to the process~1,'#13+
'and so~on. Output received numbers in each process.'
  );
(*
  TaskText('В главном процессе дан набор из {K}({K}\,+\,3)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Scatterv, переслать в каждый процесс',0,2);
  TaskText('часть чисел из данного набора; при этом в процесс ранга~{R} надо переслать',0,3);
  TaskText('{R}\,+\,2~очередных числа (в процесс~0~\= первые два числа, в процесс~1~\=',0,4);
  TaskText('следующие три числа, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
*)
  c := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
      c := c + 1;
    end;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  c0 := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      c0 := c0 + 1;
      DataN('', a[i,j], Center(c0,c,2,1), 3, 2);
    end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',20,y+i);
    for j := 1 to i+2 do
      ResultN('', a[i+1,j], Center(j,n+1,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC10;
var i,n,y,j: integer;
  a: array[1..7] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,2 real numbers is given in the master process;'#13+
'{K} is the number of processes. Using the MPI\_Scatterv function, send'#13+
'three elements of given sequence to each process as follows: elements'#13+
'with order numbers in the range~{R}\,+\,1 to~{R}\,+\,3 should be sent'#13+
'to the process of rank~{R}, where {R}~=~0,~\., {K}\,\-\,1 (the initial three'#13+
'elements should be sent to the process~0; the second, the third,'#13+
'and the fourth element should be sent to the process~1, and so~on).'#13+
'Output received numbers in each process.'
  );
(*
  TaskText('В главном процессе дан набор из {K}\,+\,2 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scatterv, переслать в каждый процесс три числа',0,2);
  TaskText('из данного набора; при этом в процесс ранга~{R} должны быть пересланы числа',0,3);
  TaskText('с номерами от {R}\,+\,1 до {R}\,+\,3 (в процесс~0~\= первые три числа, в процесс~1~\= числа',0,4);
  TaskText('со второго по четвертое, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
*)
  for i := 1 to n+2 do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n+2 do
      DataR('', a[i], Center(i,n+2,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',20,y+i);
    for j := i+1 to i+3 do
      ResultR('', a[j], Center(j-i,3,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC11;
var i,n,y,j: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Send given numbers to all process'#13+
'using the MPI\_Allgather function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the number received from itself).'
  );
(*
  TaskText('В каждом процессе дано вещественное число.',0,2);
  TaskText('Используя функцию MPI\_Allgather, переслать эти числа во все процессы',0,3);
  TaskText('и вывести их в каждом процессе в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,5);
*)
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      ResultR('', a[j], Center(j,n,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC12;
var i,n,y,j,k: integer;
  a: array[1..5,1..4] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'Four integers are given in each process. Send given integers to all processes'#13+
'using the MPI\_Allgather function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе даны четыре целых числа.',0,2);
  TaskText('Используя функцию MPI\_Allgather, переслать эти числа во все процессы',0,3);
  TaskText('и вывести их в каждом процессе в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (включая числа, полученные из этого же процесса).',0,5);
*)
  for i := 1 to n do
    for j := 1 to 4 do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
    for j := 1 to 4 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
    for k := 1 to n do
      for j := 1 to 4 do
        ResultN('', a[k,j], ((k-1)*4+j)*3+13, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC13;
var i,n,y,j,k,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {R}\,+\,2 integers is given in each process; {R} is the rank'#13+
'of process (that is, two integers are given in the process~0, three integers'#13+
'are given in the process~1, and so~on). Send given integers to all processes'#13+
'using the MPI\_Allgatherv function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из {R}\,+\,2 целых чисел, где число~{R} равно рангу',0,1);
  TaskText('процесса (в процессе~0 даны 2~числа, в процессе~1 даны~3 числа, и т.\,д.).',0,2);
  TaskText('Используя функцию MPI\_Allgatherv, переслать эти наборы во все процессы',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(включая числа, полученные из этого же процесса).',0,5);
*)
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
    end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for k := 1 to n do
      for j := 1 to k+1 do
      begin
        c0 := c0 + 1;
        ResultN('', a[k,j], c0*3+13, y+i, 2);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC14;
var i,n,y,j: integer;
  a: array[1..5,1..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K} real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Alltoall function, send one element of each'#13+
'given sequence to each process as follows: first element of each sequence'#13+
'should be sent to the process~0, second element of each sequence'#13+
'should be sent to the process~1, and so~on. Output received numbers'#13+
'in each process in ascending order of ranks of sending processes'#13+
'(including the number received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoall, переслать в каждый процесс по одному числу',0,2);
  TaskText('из всех наборов: в процесс~0~\= первые числа из наборов, в процесс~1~\= вторые',0,3);
  TaskText('числа, и т.\,д. В каждом процессе вывести числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая число, полученное из этого же процесса).',0,5);
*)  
  for i := 1 to n do
    for j := 1 to n do
      a[i,j] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      DataR('', a[i+1,j], Center(j,n,5,2), y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      ResultR('', a[j,i+1], Center(j,n,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC15;
var i,n,y,j,k,c0: integer;
  a: array[1..5,1..15] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 3{K} integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Alltoall function, send three elements of each'#13+
'given sequence to each process as follows: the initial three elements'#13+
'of each sequence should be sent to the process~0, the next three elements'#13+
'of each sequence should be sent to the process~1, and so~on. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из 3{K} целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoall, переслать в каждый процесс три очередных числа',0,2);
  TaskText('из каждого набора (в процесс~0~\= первые три числа, в процесс~1~\= следующие три',0,3);
  TaskText('числа, и т.\,д.). В каждом процессе вывести числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая числа, полученные из этого же процесса).',0,5);
*)
  for i := 1 to n do
    for j := 1 to 3*n do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',7,y+i);
    for j := 1 to 3*n do
      DataN('', a[i+1,j], Center(j,3*n,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',7,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 3 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,i*3+k], Center(c0,3*n,2,1), y+i, 2);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC16;
var i,n,y,j,k,c0,c1,c,k1: integer;
  a: array[1..5,1..15] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,1)/2 integers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send some'#13+
'elements of each given sequence to each process as follows: the first element'#13+
'of each sequence should be sent to the process~0, the next two elements'#13+
'of each sequence should be sent to the process~1, the next three elements'#13+
'of each sequence should be sent to the process~2, and so~on. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из {K}({K}\,+\,1)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Alltoallv, переслать в каждый процесс',0,2);
  TaskText('часть чисел из каждого набора; при этом в процесс~{R} должно быть переслано',0,3);
  TaskText('{R}\,+\,1~очередное число (в процесс~0~\= первое число каждого набора, в процесс~1~\=',0,4);
  TaskText('следующие два числа, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
*)
  c := n*(n+1) div 2;
  k1 := 19;
  case n of
  4: k1 := 15;
  5: k1 := 10;
  end;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(9) + 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,1,1), y+i, 1);
  end;
  c1 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',15,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to i+1 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,c1+k], Center(c0,25,1,1)+k1, y+i, 1);
      end;
    c1 := c1 + (i+1);
  end;
  SetTestCount(5);
end;

procedure MpiC17;
var i,n,y,j,k,c0,c: integer;
  a: array[1..5,1..15] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,1 real numbers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send two elements'#13+
'of each given sequence to each process as follows: the initial two elements'#13+
'of each sequence should be sent to the process~0, the second and the third'#13+
'element of each sequence should be sent to the process~1, \., the last two'#13+
'elements of each sequence should be sent to the last process. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,1 числа, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoallv, переслать в каждый процесс два числа из',0,2);
  TaskText('каждого набора; при этом в процесс~0 надо переслать первые два числа,',0,3);
  TaskText('в процесс~1~\= второе и третье число, \., в последний процесс~\= последние',0,4);
  TaskText('два числа каждого набора. В каждом процессе вывести полученные числа.',0,5);
*)
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 2 do
      begin
        c0 := c0 + 1;
        ResultR('', a[j,i+k], Center(c0,2*n,4,1), y+i, 4);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC18;
var i,n,y,j,k,c0,c: integer;
  a: array[1..5,1..15] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,1 real numbers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send two elements'#13+
'of each given sequence to each process as follows: the last two elements'#13+
'of each sequence (with the order numbers {K}\,+\,1 and~{K}) should be sent'#13+
'to the process~0, the elements of each sequence with the order numbers {K}\,\-\,1'#13+
'and~{K} should be sent to the process~1, \., the initial two elements'#13+
'of each sequence should be sent to the last process. Output received numbers'#13+
'in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,1 числа, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoallv, переслать в каждый процесс два числа из',0,2);
  TaskText('каждого набора; при этом в процесс~0 надо переслать последние два числа, в',0,3);
  TaskText('процесс~1~\= два числа, предшествующих последнему, \., в последний процесс~\=',0,4);
  TaskText('первые два числа каждого набора. В каждом процессе вывести полученные числа.',0,5);
*)
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 2 do
      begin
        c0 := c0 + 1;
        ResultR('', a[j,n-i-1+k], Center(c0,2*n,4,1), y+i, 4);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiD1;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Find sums of elements of all given sequences'#13+
'with the same order number using the MPI\_Reduce function'#13+
'with the MPI\_SUM operation. Output received sums in the master process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество',0,2);
  TaskText('процессов. Используя функцию MPI\_Reduce для операции MPI\_SUM, просуммировать',0,3);
  TaskText('элементы данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные суммы в главном процессе.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiD2;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Find the minimal value among the elements of all given'#13+
'sequences with the same order number using the MPI\_Reduce function'#13+
'with the MPI\_MIN operation. Output received minimal values'#13+
'in the master process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Reduce для операции MPI\_MIN, найти минимальное',0,3);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные минимумы в главном процессе.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,4,1), 3, 4);
  SetTestCount(5);
end;

procedure MpiD3;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce function with the MPI\_MAXLOC'#13+
'operation, find the maximal value among the elements of all given sequences'#13+
'with the same order number and also the rank of process that contains this'#13+
'maximal value. Output received maximal values and ranks in the master process'#13+
'(first, output all maximal values, then output all corresponding ranks).'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce для операции MPI\_MAXLOC, найти максимальное',0,2);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,3);
  TaskText('и ранг процесса, содержащего это максимальное значение. Вывести в главном',0,4);
  TaskText('процессе вначале все максимумы, а затем~\= ранги содержащих их процессов.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90)+10;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] > a[1,j] then
      begin
        a[1,j] := a[i,j];
        b[j] := i;
      end;
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
    for j := 1 to c do
      ResultN('', b[j]-1, Center(j,c,2,1), 4, 2);
  SetTestCount(5);
end;

procedure MpiD4;
var i,n,y,j,c,k1: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Find products of elements of all given sequences with the same'#13+
'order number using the MPI\_Allreduce function with the MPI\_PROD operation.'#13+
'Output received products in each process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Allreduce для операции MPI\_PROD, перемножить',0,3);
  TaskText('элементы данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные произведения во всех процессах.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*1.5+1;
  y := 2;
  if n = 5 then y := 1;
  k1 := 0;
  case n of
  4: k1 := 3;
  5: k1 := 6;
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] * a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD5;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Allreduce function with the MPI\_MINLOC'#13+
'operation, find the minimal value among the elements of all given sequences'#13+
'with the same order number and also the rank of process that contains'#13+
'this minimal value. Output received minimal values in the master process'#13+
'and output corresponding ranks in each slave process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Allreduce для операции MPI\_MINLOC, найти минимальное',0,2);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,3);
  TaskText('и ранг процесса, содержащего минимальное значение. Вывести в главном процессе',0,4);
  TaskText('минимумы, а в остальных процессах~\= ранги процессов, содержащих эти минимумы.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
      begin
        a[1,j] := a[i,j];
        b[j] := i;
      end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
    if i = 0 then
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,4,1), y+i, 4)
    else
    for j := 1 to c do
      ResultN('', b[j]-1, Center(j,c,4,1), y+i, 4);
  end;
  SetTestCount(5);
end;

procedure MpiD6;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find sums of elements'#13+
'of all given sequences with the same order number and send one sum'#13+
'to each process as follows: the first sum should be sent to the process~0,'#13+
'the second sum should be sent to the process~1, and so~on.'#13+
'Output the received sum in each process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}~целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce\_scatter, просуммировать элементы данных',0,2);
  TaskText('наборов с одним и тем же порядковым номером, переслать по одной',0,3);
  TaskText('из полученных сумм в каждый процесс (первую сумму~\= в процесс~0, вторую~\=',0,4);
  TaskText('в процесс~1, и т.\,д.) и вывести в каждом процессе полученную сумму.',0,5);
*)
  c := n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',22,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+':',22,y+i);
    ResultN('', a[1,i+1], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiD7;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 2{K}~real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find maximal'#13+
'values among elements of all given sequences with the same order number'#13+
'and send two maximal values to each process as follows: the initial'#13+
'two maximums should be sent to the process~0, the next two maximums should be'#13+
'sent to the process~1, and so~on. Output received data in each process.'
  );
(*
  TaskText('В каждом процессе дан набор из 2{K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce\_scatter, найти максимумы среди элементов этих',0,2);
  TaskText('наборов с одним и тем же порядковым номером, переслать по два найденных',0,3);
  TaskText('максимума в каждый процесс (первые два максимума~\= в процесс~0, следующие',0,4);
  TaskText('два~\= в процесс~1, и т.\,д.) и вывести в каждом процессе полученные данные.',0,5);
*)
  c := 2*n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] > a[1,j] then
        a[1,j] := a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+':',25,y+i);
    ResultR2('', a[1,2*i+1], a[1,2*i+2], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD8;
var i,n,y,j,k,c,k1: integer;
  a: array[1..5,1..20] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,3)/2 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find minimal'#13+
'values among elements of all given sequences with the same order number'#13+
'and send some minimal values to each process as follows: the initial'#13+
'two minimums should be sent to the process~0, the next three minimums'#13+
'should be sent to the process~1, \., the last {K}\,+\,1 minimums should be'#13+
'sent to the process~{K}\,\-\,1. Output received data in each process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}({K}\,+\,3)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Reduce\_scatter, найти минимальные значения',0,2);
  TaskText('среди элементов этих наборов с одним и тем же порядковым номером и переслать',0,3);
  TaskText('первые два минимума в процесс~0, следующие три~\= в процесс~1, \., последние',0,4);
  TaskText('{K}\,+\,1~минимумов~\= в процесс~{K}\,\-\,1. Вывести в каждом процессе полученные данные.',0,5);
*)
  c := n*(n+3) div 2;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  k1 := 0;
  case n of
  5: k1 := 6;
  end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1)+k1, y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
  k := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+':',6,y+i);
    for j := 1 to i+2 do
    begin
      k := k + 1;
      ResultN('', a[1,k], Center(j,c,2,1)+k1, y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiD9;
var i,n,y,j,c,k1: integer;
  a: array[1..5,1..10] of real;
  b: array[1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Scan function, find products of elements'#13+
'of given sequences with the same order number as follows:'#13+
'the products of elements of sequences given in the processes'#13+
'of rank~0,~\., {R} should be found in the process~{R} ({R}~=~0, 1,~\., {K}\,\-\,1).'#13+
'Output received data in each process; in particular, products of elements'#13+
'of all given sequences should be output in the process~{K}\,\-\,1.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scan, найти в процессе ранга~{R} ({R}~=~0, 1,~\., {K}\,\-\,1)',0,2);
  TaskText('произведения элементов с одним и тем же порядковым номером для наборов, данных',0,3);
  TaskText('в процессах с рангами от~0 до~{R}, и вывести найденные произведения (при этом',0,4);
  TaskText('в процессе {K}\,\-\,1 будут выведены произведения элементов из всех наборов).',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*1.5+1;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  k1 := 0;
  case n of
  4: k1 := 3;
  5: k1 := 6;
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
    begin
      b[j] := b[j]*a[i+1,j];
      ResultR('', b[j], Center(j,c,5,1)+k1, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiD10;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Scan function, find maximal values'#13+
'among elements of given sequences with the same order number as follows:'#13+
'the maximal values of elements of sequences given in the processes'#13+
'of rank~0,~\., {R} should be found in the process~{R} ({R}~=~0, 1,~\., {K}\,\-\,1).'#13+
'Output received data in each process.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scan, найти в процессе ранга~{R} ({R}~=~0, \.,~{K}\,\-\,1)',0,2);
  TaskText('максимальные значения среди элементов с одним и тем же порядковым номером',0,3);
  TaskText('для наборов, данных в процессах с рангами от~0 до~{R},',0,4);
  TaskText('и вывести в каждом процессе найденные максимумы.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for j := 1 to c do
    b[j] := 0;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
    begin
      if a[i+1,j] > b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), y+i, 2);
    end;
  end;
  SetTestCount(5);
end;
(*
procedure MpiE1;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1~тройка целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя производный тип, содержащий три целых числа,',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1~тройка целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя производный тип, содержащий три целых числа,',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('по одной тройке чисел в каждый из подчиненных процессов',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дана тройка целых чисел.',0,1);
  TaskText('Используя производный тип, содержащий три целых числа, ',0,2);
  TaskText('и одну коллективную операцию пересылки данных, переслать',0,3);
  TaskText('числа из подчиненных процессов в главный и вывести',0,4);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первые два числа каждой тройки являются целыми, а третье число~\=',0,2);
  TaskText('вещественным. Используя производный тип, содержащий три числа (два целых',0,3);
  TaskText('и одно вещественное), переслать числа из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1}~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первое и третье число каждой тройки являются целыми, а второе число~\=',0,2);
  TaskText('вещественным. Используя производный тип, содержащий три числа (два целых',0,3);
  TaskText('и одно вещественное), переслать по одной тройке чисел в каждый из',0,4);
  TaskText('подчиненных процессов и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе даны три числа: одно вещественное',0,1);
  TaskText('и два целых. Используя производный тип, содержащий три числа (два целых',0,2);
  TaskText('и одно вещественное), переслать числа из подчиненных',0,3);
  TaskText('процессов в главный и вывести полученные числа',0,4);
  TaskText('в порядке возрастания рангов переславших их процессов.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе даны три числа: первое и третье являются целыми, а второе \=',0,1);
  TaskText('вещественным. Используя производный тип, содержащий три числа (два целых',0,2);
  TaskText('и одно вещественное), переслать данные из каждого процесса во все процессы',0,3);
  TaskText('и вывести в каждом процессе полученные числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая числа, полученные из этого же процесса).',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе даны {R}~троек чисел, где {R}~\= ранг процесса.',0,1);
  TaskText('Два первых числа в каждой тройке являются целыми, а последнее~\= вещественным.',0,2);
  TaskText('Используя производный тип, содержащий три числа (два целых и одно',0,3);
  TaskText('вещественное), переслать числа из подчиненных процессов в главный и вывести',0,4);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе даны два набора: первый содержит {K}~целых, а второй',0,1);
  TaskText('{K}~вещественных чисел, где {K}~\= количество процессов. Используя функции',0,2);
  TaskText('упаковки MPI\_Pack и MPI\_Unpack и одну коллективную операцию пересылки данных,',0,3);
  TaskText('переслать все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первое и третье число каждой тройки является целым, а второе число~\=',0,2);
  TaskText('вещественным. Используя функции упаковки и одну коллективную операцию',0,3);
  TaskText('пересылки данных, переслать по одной тройке чисел в подчиненные процессы',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дана {K}\,\-\,1~тройка чисел, где {K}~\= количество процессов,',0,1);
  TaskText('причем первые два числа каждой тройки являются целыми, а третье число~\=',0,2);
  TaskText('вещественным. Используя функции упаковки и одну коллективную операцию',0,3);
  TaskText('пересылки данных, переслать все данные из главного процесса в подчиненные',0,4);
  TaskText('и вывести их в подчиненных процессах в том же порядке.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе даны три числа: два целых и одно',0,1);
  TaskText('вещественное. Используя функции упаковки и одну коллективную операцию',0,2);
  TaskText('пересылки данных, переслать числа из подчиненных процессов в главный',0,3);
  TaskText('и вывести полученные числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов.',0,5);
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
  CreateTask('Производные типы и упаковка данных', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дан набор из одного вещественного и {R}~целых',0,1);
  TaskText('чисел, где значение~{R} равно рангу процесса (в процессе 1 дано одно целое',0,2);
  TaskText('число, в процессе 2~\= два целых числа, и т.\,д.). Используя функции упаковки',0,3);
  TaskText('и одну функцию передачи и приема, переслать все данные в главный процесс',0,4);
  TaskText('и вывести эти данные в порядке возрастания рангов переславших их процессов.',0,5);
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

procedure MpiG1;
var i,n,n1,k,y,j: integer;
  a: array[1..5] of integer;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из {K}~целых чисел, где {K}~\= количество процессов',0,1);
  TaskText('четного ранга (0,~2,~\.). С помощью функций MPI\_Comm\_group, MPI\_Group\_incl',0,2);
  TaskText('и MPI\_Comm\_create создать новый коммуникатор, включающий процессы четного',0,3);
  TaskText('ранга. Используя одну коллективную операцию пересылки данных для созданного',0,4);
  TaskText('коммуникатора, переслать по одному исходному числу в каждый процесс четного',0,5);
  TaskText('ранга (включая главный) и вывести полученные числа.',0,0);
  for i := 1 to 5 do
      a[i] := Random(90) + 10;
  n1 := (n+1) div 2;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  SetProcess(0);
    DataComment('Process 0:',0,2);
    for j := 1 to n1 do
      DataN('', a[j], Center(j,n1,2,1), 3, 2);
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    ResultN('Process '+Chr(k+48)+': ', a[i], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiG2;
var i,n,n1,k,y,j: integer;
  a: array[1..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе нечетного ранга (1,~3,~\.) даны два вещественных числа.',0,1);
  TaskText('С помощью функций MPI\_Comm\_group, MPI\_Group\_excl и MPI\_Comm\_create создать',0,2);
  TaskText('новый коммуникатор, включающий процессы нечетного ранга. Используя одну',0,3);
  TaskText('коллективную операцию пересылки данных для созданного коммуникатора, переслать',0,4);
  TaskText('исходные числа во все процессы нечетного ранга и вывести эти числа в порядке',0,5);
  TaskText('возрастания рангов переславших их процессов (включая числа,',0,0);
  TaskText('полученные из этого же процесса).',0,0);
  for i := 1 to 10 do
      a[i] := 10+Random*89.98;
  n1 := n div 2;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    DataR2('Process '+Chr(k+48)+':', a[k], a[k+1], 0, y+i, 6);
  end;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    ResultComment('Process '+Chr(k+48)+':',5,y+i);
    for j := 1 to 2*n1 do
      ResultR('', a[j], 10+j*6, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiG3;
var i,n,n1,k,y,j: integer;
  a: array[1..15] of integer;
  s: string;
begin
  n := Random(9)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе, ранг которого делится на~3 (включая главный процесс), даны',0,1);
  TaskText('три целых числа. С помощью функции MPI\_Comm\_split создать новый коммуникатор,',0,2);
  TaskText('включающий процессы, ранг которых делится на 3. Используя одну коллективную',0,3);
  TaskText('операцию пересылки данных для созданного коммуникатора, переслать исходные',0,4);
  TaskText('числа в главный процесс и вывести эти числа в порядке возрастания рангов',0,5);
  TaskText('переславших их процессов (включая числа, полученные из главного процесса).',0,0);
  for i := 1 to 15 do
      a[i] := Random(90) + 10;
  n1 := (n+2) div 3;
  y := 1;
  j := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then
  begin
    y := 0;
    j := 2;
  end;
  for i := 1 to n1 do
  begin
    k := 3*i-3;
    SetProcess(k);
    Str(k:j,s);
    DataN3('Process '+s+':', a[k+1], a[k+2], a[k+3], 0, y+i, 3);
  end;
    SetProcess(0);
    ResultComment('Process 0:',0,2);
    for j := 1 to 3*n1 do
      ResultN('', a[j], Center(j,3*n1,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiG4;
var i,n,n1,k,y,j: integer;
  a: array[1..5,1..3] of real;
  min: array[1..3] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе четного ранга (включая главный процесс) дан набор',0,1);
  TaskText('из трех элементов~\= вещественных чисел. Используя новый коммуникатор',0,2);
  TaskText('и одну коллективную операцию редукции, найти минимальные значения среди',0,3);
  TaskText('элементов исходных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести найденные минимумы в главном процессе.',0,5);
  n1 := (n+1) div 2;
  for j := 1 to 3 do
  begin
    min[j] := 1000;
    for i := 1 to n1 do
    begin
      a[i,j] := 10+Random*89.98;
      if a[i,j]< min[j] then
        min[j] := a[i,j];
    end;
  end;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    DataR3('Process '+Chr(k+48)+':', a[i,1], a[i,2], a[i,3], 0, y+i, 6);
  end;
    SetProcess(0);
    ResultComment(' Процесс 0:',0,2);
    for j := 1 to 3 do
      ResultR('', min[j], Center(j,3,5,1), 3, 5);
  SetTestCount(5);
end;

procedure MpiG5;
var i,n,y: integer;
    r,min,max: real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано вещественное число. Используя функцию MPI\_Comm\_split',0,1);
  TaskText('и одну коллективную операцию редукции, найти максимальное из чисел, данных',0,2);
  TaskText('в процессах с четным рангом (включая главный процесс), и минимальное',0,3);
  TaskText('из чисел, данных в процессах с нечетным рангом. Найденный максимум',0,4);
  TaskText('вывести в процессе~0, а найденный минимум~\= в процессе~1.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  min := 1000;
  max := -1000;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    r := 89.98*Random+10;
    DataR('Process '+Chr(2*i+48)+': ', r, xLeft, y+i, 5);
    if r > max then
      max := r;
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 89.98*Random+10;
    DataR('Process '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    if r < min then
      min := r;
  end;
    SetProcess(0);
    ResultR('Process 0: ', max, xLeft, 3, 5);
    SetProcess(1);
    ResultR('Process 1: ', min, xRight, 3, 5);
  SetTestCount(5);
end;

procedure MpiG6;
var i,n,y,k,j: integer;
    a,b: array [1..10] of integer;
    r: array [1..10] of real;
begin
  n := Random(4)+6;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В главном процессе дано целое число~{K} и набор из {K}~вещественных чисел,',0,1);
  TaskText('в каждом подчиненном процессе дано целое число~{N}, которое может принимать два',0,2);
  TaskText('значения:~0 и~1 (количество подчиненных процессов с {N}~=~1 равно~{K}). Используя',0,3);
  TaskText('функцию MPI\_Comm\_split и одну коллективную операцию пересылки, переслать',0,4);
  TaskText('по одному вещественному числу из главного процесса в каждый подчиненный',0,5);
  TaskText('Process с {N}~=~1 и вывести в этих подчиненных процессах полученные числа.',0,0);
  k := Random(4)+2;
  for i := 1 to n-1 do
    a[i] := i;
  for i := 1 to n-1 do
    swap(a[i], a[Random(n-1)+1]);
  for i := 1 to k do
    b[a[i]] := 1;
  for i := k+1 to n-1 do
    b[a[i]] := 0;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  y := 2;
//  if (n+1) div 2 = 5 then y := 1;
    SetProcess(0);
    DataN('Process 0: K = ', k, xLeft, 1, 1);
    for j := 1 to k do
      DataR('',r[j],25+j*7,1,5);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], xLeft, y+i-1, 1);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], xRight, y+i-1, 1)
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for i := 1 to n-1 do
  begin
    if b[i]=1 then
    begin
      j := j + 1;
      SetProcess(i);
      ResultR('Process '+Chr(i+48)+': ', r[j], 0, y+j, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiG7;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} в первый',0,4);
  TaskText('из процессов с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  m := -1;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      if m = -1 then
        m := i;
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Process '+Chr(m+48)+':', 5, 3);
    for i := 1 to k do
      ResultR('', r[i], 9+i*7, 3, 5);
  SetTestCount(5);
end;

procedure MpiG8;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} в последний',0,4);
  TaskText('из процессов с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  m := -1;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      m := i;
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Process '+Chr(m+48)+':', 5, 3);
    for i := 1 to k do
      ResultR('', r[i], 9+i*7, 3, 5);
  SetTestCount(5);
end;

procedure MpiG9;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} во все',0,4);
  TaskText('процессы с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for m := 0 to n-1 do
    if b[m]=1 then
    begin
      j := j + 1;
      SetProcess(m);
      ResultComment('Process '+Chr(m+48)+':', 5, y+j);
      for i := 1 to k do
        ResultR('', r[i], 9+i*7, y+j, 5);
    end;
  SetTestCount(5);
end;

procedure MpiG10;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1,r2: array [0..10] of integer;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два значения:',0,1);
  TaskText('1 и~2 (имеется хотя бы один процесс с каждым из возможных значений).',0,2);
  TaskText('Кроме того, в каждом процессе дано целое число~{A}. Используя функцию',0,3);
  TaskText('MPI\_Comm\_split и одну коллективную операцию пересылки данных, переслать',0,4);
  TaskText('числа~{A}, данные в процессах с {N}~=~1, во все процессы с {N}~=~1, а числа~{A},',0,5);
  TaskText('данные в процессах с {N}~=~2, во все процессы с {N}~=~2. Во всех процессах',0,0);
  TaskText('вывести полученные числа в порядке возрастания рангов переславших',0,0);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  repeat
  k := Random(4)+2;
  until (n-k>0) and (n-k<7);
  for i := 1 to n do
    r[i] := Random(90) + 10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 2;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  j := k;
  for i := 0 to n-1 do
    if b[i]=2 then
    begin
      j := j + 1;
      r2[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataN('A = ', r1[2*i], 23, y+i, 2)
    else
      DataN('A = ', r2[2*i], 23, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataN('A = ', r1[2*i-1], 63, y+i-1, 2)
    else
      DataN('A = ', r2[2*i-1], 63, y+i-1, 2)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      for m := 1 to k do
        ResultN('', r[m], 13 + m*3, y+i, 2)
    else
      for m := 1 to n-k do
        ResultN('', r[k+m], 13+m*3, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    if b[2*i-1]=1 then
      for m := 1 to k do
        ResultN('', r[m], 53+m*3, y+i-1, 2)
    else
      for m := 1 to n-k do
        ResultN('', r[k+m], 53+m*3, y+i-1, 2)
  end;
  SetTestCount(5);
end;

procedure MpiG11;
var i,n,y,k,j,m: integer;
    sum: real;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию редукции, найти сумму всех исходных чисел~{A}',0,4);
  TaskText('и вывести ее во всех процессах с {N}~=~1.',0,5);
  k := Random(4)+2;
  sum := 0;
  for i := 1 to k do
  begin
    r[i] := 89.98*Random+10;
    sum := sum + r[i];
  end;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for m := 0 to n-1 do
    if b[m]=1 then
    begin
      j := j + 1;
      SetProcess(m);
      ResultR('Process '+Chr(m+48)+': ', sum, 5, y+j, 6);
    end;
  SetTestCount(5);
end;

procedure MpiG12;
var i,n,y,k,j: integer;
    min, max: real;
    a,b: array [0..10] of integer;
    r,r1,r2: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('Группы процессов и коммуникаторы', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два значения:',0,1);
  TaskText('1 и~2 (имеется хотя бы один процесс с каждым из возможных значений).',0,2);
  TaskText('Кроме того, в каждом процессе дано вещественное число~{A}. Используя функцию',0,3);
  TaskText('MPI\_Comm\_split и одну коллективную операцию редукции, найти минимальное',0,4);
  TaskText('значение среди чисел~{A}, которые даны в процессах с {N}~=~1, и максимальное',0,5);
  TaskText('значение среди чисел~{A}, которые даны в процессах с {N}~=~2. Найденный минимум',0,0);
  TaskText('вывести в процессах с {N}~=~1, а найденный максимум~\= в процессах с {N}~=~2.',0,0);
  repeat
  k := Random(4)+2;
  until (n-k>0) and (n-k<7);
  for i := 1 to n do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 2;
  j := 0;
  min := 1000;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
      if min > r[j] then
        min := r[j];
    end;
  j := k;
  max := -1000;
  for i := 0 to n-1 do
    if b[i]=2 then
    begin
      j := j + 1;
      r2[i] := r[j];
      if max < r[j] then
        max := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5)
    else
      DataR('A = ', r2[2*i], 23, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5)
    else
      DataR('A = ', r2[2*i-1], 63, y+i-1, 5)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      ResultR('', min, 16, y+i, 5)
    else
      ResultR('', max, 16, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    if b[2*i-1]=1 then
        ResultR('', min, 56, y+i-1, 5)
    else
        ResultR('', max, 56, y+i-1, 5)
  end;
  SetTestCount(5);
end;

procedure MpiH1;
var i,n,k,y,j,m,d: integer;
begin
  case 2 + Random(4) of
  2: n := 2*(2 + Random(4));
  3: n := 3*(2 + Random(2));
  4: n := 8;
  else n := 10;
  end;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  repeat
    k := 2 + Random(4);
  until n mod k = 0;
  TaskText('В главном процессе дано целое число~{N} (>\,1), причем известно, что количество',0,1);
  TaskText('процессов~{K} делится на~{N}. Переслать число~{N} во все процессы, после чего,',0,2);
  TaskText('используя функцию MPI\_Cart\_create, определить для всех процессов декартову',0,3);
  TaskText('топологию в виде двумерной решетки~\= матрицы размера {N}\;\x\;{K}/{N} (порядок',0,4);
  TaskText('нумерации процессов оставить прежним). Используя функцию MPI\_Cart\_coords,',0,5);
  TaskText('вывести для каждого процесса его координаты в созданной топологии.',0,0);
  SetProcess(0);
  DataN('Process 0: N = ',k,0,3,1);
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultN2('Process ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH2;
var i,n,k,y,j,m,d: integer;
    s: string;
begin
  k := 2 + Random(4);
  n := k + 1 + Random(10-k);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 2 + Random(n-1);
  TaskText('В главном процессе дано целое число~{N} (>\,1), не превосходящее количества',0,1);
  TaskText('процессов~{K}. Переслать число~{N} во все процессы, после чего определить',0,2);
  TaskText('декартову топологию для начальной части процессов в виде двумерной решетки~\=',0,3);
  TaskText('матрицы размера {N}\;\x\;{K}/{N} (символ \</\> обозначает операцию деления нацело,',0,4);
  TaskText('порядок нумерации процессов следует оставить прежним). Для каждого процесса,',0,5);
  TaskText('включенного в декартову топологию, вывести его координаты в этой топологии.',0,0);
  SetProcess(0);
  DataN('Process 0: N = ',k,0,3,1);
  Str(n, s);
  DataComment('Примечание: количество процессов K равно '+s+'.',0,5);
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultN2('Process ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH3;
var i,n,k,y,j,m,d: integer;
    r: array[1..2] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 2;
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1. В процессах~0 и~{N} дано',0,1);
  TaskText('по одному вещественному числу~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера 2\;\x\;{N}, после чего, используя функцию',0,3);
  TaskText('MPI\_Cart\_sub, расщепить матрицу процессов на две одномерные строки (при этом',0,4);
  TaskText('процессы~0 и~{N} будут главными процессами в полученных строках). Используя',0,5);
  TaskText('одну коллективную операцию пересылки данных, переслать число~{A} из главного',0,0);
  TaskText('процесса каждой строки во все процессы этой же строки и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0 и~{N}).',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  begin
    SetProcess((i-1)*(n div k));
    r[i] := 8.98*Random+1;
    DataR('Process '+Chr((i-1)*(n div k)+48)+': A = ',r[i],0,2*i,3);
  end;
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('Process ' + Chr(m+48)+': ', r[i],Center(j,n div k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH4;
var i,n,k,y,j,m,d: integer;
    r: array[1..2] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 2;
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1. В процессах~0 и~1 дано',0,1);
  TaskText('по одному вещественному числу~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера {N}\;\x\;2, после чего, используя функцию',0,3);
  TaskText('MPI\_Cart\_sub, расщепить матрицу процессов на два одномерных столбца (при этом',0,4);
  TaskText('процессы~0 и~1 будут главными процессами в полученных столбцах). Используя',0,5);
  TaskText('одну коллективную операцию пересылки данных, переслать число~{A} из главного',0,0);
  TaskText('процесса каждого столбца во все процессы этого же столбца и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0 и~1).',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  begin
    SetProcess(i-1);
    r[i] := 8.98*Random+1;
    DataR('Process '+Chr(i-1+48)+': A = ',r[i],0,2*i,3);
  end;
  y := 1;
  if n div k = 5 then y := 0;
  if n div k = 2 then y := 2;
  d := 4;
  m := -1;
  for i := 1 to n div k do
    for j := 1 to k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('Process ' + Chr(m+48)+': ', r[j],Center(j,k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH5;
var i,n,k,y,j,m,d: integer;
    r: array[1..3,1..4] of integer;
    s: string;
begin
  n := 3*(2+Random(3));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText('Число процессов~{К} кратно трем: {K}~=~3{N}, {N}~>~1. В процессах~0,~{N} и~2{N} дано',0,1);
  TaskText('по {N}~целых чисел. Определить для всех процессов декартову топологию в виде',0,2);
  TaskText('матрицы размера 3\;\x\;{N}, после чего, используя функцию MPI\_Cart\_sub, расщепить',0,3);
  TaskText('матрицу процессов на три одномерные строки (при этом процессы~0,~{N} и~2{N}',0,4);
  TaskText('будут главными процессами в полученных строках). Используя одну коллективную',0,5);
  TaskText('операцию пересылки данных, переслать по одному исходному числу из главного',0,0);
  TaskText('процесса каждой строки во все процессы этой же строки и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0,~{N} и~2{N}).',0,0);
  for i := 1 to k do
    for j := 1 to n do
  begin
    SetProcess((i-1)*n);
    DataComment('Process '+Chr((i-1)*n+48)+':',22,i+1);
    r[i,j] := Random(90) + 10;
    DataN('',r[i,j],Center(j,n,2,2),i+1,2);
  end;
  y := 1;
  d := 4;
  m := -1;
  for i := 1 to k do
    for j := 1 to n do
    begin
      m := m + 1;
      SetProcess(m);
      str(m:2,s);
      ResultN('Process ' + s+': ', r[i,j],Center(j,n,13,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH6;
var i,n,k,y,j,m,d: integer;
    r: array[1..3,1..4] of integer;
    s: string;
begin
  n := 3*(2+Random(3));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText('Число процессов~{К} кратно трем: {K}~=~3{N}, {N}~>~1. В процессах~0,~1 и~2 дано',0,1);
  TaskText('по {N}~целых чисел. Определить для всех процессов декартову топологию в виде',0,2);
  TaskText('матрицы размера {N}\;\x\;3, после чего, используя функцию MPI\_Cart\_sub, расщепить',0,3);
  TaskText('матрицу процессов на три одномерных столбца (при этом процессы~0,~1 и~2',0,4);
  TaskText('будут главными процессами в полученных столбцах). Используя одну коллективную',0,5);
  TaskText('операцию пересылки данных, переслать по одному исходному числу из главного',0,0);
  TaskText('процесса каждого столбца во все процессы этого же столбца и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0,~1 и~2).',0,0);
  for i := 1 to k do
    for j := 1 to n do
  begin
    SetProcess(i-1);
    DataComment('Process '+Chr(i-1+48)+':',22,i+1);
    r[i,j] := Random(90) + 10;
    DataN('',r[i,j],Center(j,n,2,2),i+1,2);
  end;
  y := 1;
  if n = 2 then y := 2;
  d := 4;
  m := -1;
  for i := 1 to n do
    for j := 1 to k do
    begin
      m := m + 1;
      SetProcess(m);
      str(m:2,s);
      ResultN('Process ' + s+': ', r[j,i],Center(j,k,13,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH7;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of integer;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано целое число.',0,1);
  TaskText('Определить для всех процессов декартову топологию в виде трехмерной решетки',0,2);
  TaskText('размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя эту решетку как две матрицы размера 2\;\x\;{K}/4 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой первой координатой), расщепить каждую матрицу',0,5);
  TaskText('процессов на две одномерные строки. Используя одну коллективную операцию',0,0);
  TaskText('пересылки данных, переслать в главный процесс каждой строки исходные числа из',0,0);
  TaskText('процессов этой же строки и вывести полученные наборы чисел (включая числа,',0,0);
  TaskText('полученные из главных процессов строк).',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := Random(90) + 10;
        DataN('Process '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  m := 0;
  y := 1;
  for l := 1 to 2 do
  for i := 1 to 2 do
  begin
    SetProcess(m);
    y := y + 1;
    str(m,s);
    ResultComment('Process ' + s+':', 20, y);
    for j := 1 to k do
      ResultN('', r[i,l,j],Center(j,k,2,2),y,2);
    m := m + k;
  end;
  SetTestCount(5);
end;

procedure MpiH8;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of integer;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано целое число.',0,1);
  TaskText('Определить для всех процессов декартову топологию в виде трехмерной решетки',0,2);
  TaskText('размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя полученную решетку как {K}/4 матриц размера 2\;\x\;2 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой третьей координатой), расщепить эту решетку',0,5);
  TaskText('на {K}/4 указанных матриц. Используя одну коллективную операцию пересылки',0,0);
  TaskText('данных, переслать в главный процесс каждой из полученных матриц исходные',0,0);
  TaskText('числа из процессов этой же матрицы и вывести полученные наборы чисел (включая',0,0);
  TaskText('числа, полученные из главных процессов матриц).',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := Random(90) + 10;
        DataN('Process '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  y := 1;
  if k = 2 then y := 2;
  for j := 1 to k do
  begin
    SetProcess(j-1);
    str(j-1,s);
    ResultComment('Process ' + s+':', 20, y+j);
    m := 0;
    for l := 1 to 2 do
    for i := 1 to 2 do
    begin
      m := m + 1;
      ResultN('', r[i,l,j],Center(m,4,2,2),y+j,2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiH9;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    r1: array[1..2,1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано вещественное',0,1);
  TaskText('число. Определить для всех процессов декартову топологию в виде трехмерной',0,2);
  TaskText('решетки размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя эту решетку как две матрицы размера 2\;\x\;{K}/4 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой первой координатой), расщепить каждую матрицу',0,5);
  TaskText('процессов на {K}/4 одномерных столбцов. Используя одну коллективную операцию',0,0);
  TaskText('редукции, для каждого столбца процессов найти произведение исходных',0,0);
  TaskText('чисел и вывести найденные произведения в главных процессах каждого столбца.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,4),i+(l-1)*3,4);
      end;
  for i := 1 to 2 do
  for j := 1 to k do
    r1[i,j] := r[1,i,j]*r[2,i,j];

  y := 0;
  for i := 1 to 2 do
  begin
    m := (i-1)*k*2;
    for j := 1 to k do
    begin
      SetProcess(m);
      str(m,s);
      ResultR('Process ' + s+': ', r1[i,j],Center(j,k,17,4),y+2*i,5);
      m := m + 1;
    end;
  end;
  SetTestCount(5);
end;

procedure MpiH10;
var i,n,k,j,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    r1: array[1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано вещественное',0,1);
  TaskText('число. Определить для всех процессов декартову топологию в виде трехмерной',0,2);
  TaskText('решетки размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя полученную решетку как {K}/4 матриц размера 2\;\x\;2 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой третьей координатой), расщепить эту решетку',0,5);
  TaskText('на {K}/4 указанных матриц. Используя одну коллективную операцию редукции,',0,0);
  TaskText('для каждой из полученных матриц найти сумму исходных чисел и вывести',0,0);
  TaskText('найденные суммы в каждом процессе соответствующей матрицы.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  for j := 1 to k do
  begin
    r1[j] := 0;
    for i := 1 to 2 do
    for l := 1 to 2 do
      r1[j] := r1[j]+r[i,l,j];
  end;
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        ResultR('Process '+s+': ',r1[j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  SetTestCount(5);
end;

function GetRank(m,n,x,y,p1,p2: integer): integer;
begin
  result := -1;
  if ((x < 0) or (x >= m))and(p1=0) then exit;
  if ((y < 0) or (y >= n))and(p2=0) then exit;
  x := (x+10*m) mod m;
  y := (y+10*n) mod n;
  result := x * n + y;
end;

procedure MpiH11;
var i,n,y,x,m,k: integer;
    a,b: array [0..9] of integer;
begin
  m := Random(4)+2;
  n := 2*m + Random(10-2*m+1);
  k := n div m;
  n := m*k+1;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText('В главном процессе даны положительные целые числа~{M} и~{N}, произведение которых',0,1);
  TaskText('не превосходит количества процессов; кроме того, в процессах с рангами от~0',0,2);
  TaskText('до~{M}\*{N}\,\-\,1 даны целые числа~{X} и~{Y}. Переслать числа~{M} и~{N} во все процессы,',0,3);
  TaskText('после чего определить для начальных {M}\*{N}~процессов декартову топологию в виде',0,4);
  TaskText('двумерной решетки размера {M}\;\x\;{N}, являющейся периодической по первому',0,5);
  TaskText('измерению (порядок нумерации процессов оставить прежним). В каждом процессе,',0,0);
  TaskText('входящем в созданную топологию, вывести ранг процесса с координатами',0,0);
  TaskText('{X},~{Y} (с учетом периодичности), используя для этого функцию',0,0);
  TaskText('MPI\_Cart\_rank. В случае недопустимых координат вывести~\-1.',0,0);
  n := m*k;
  for i := 0 to n-1 do
  begin
    a[i] := Random(m+4)-2;
    b[i] := Random(k+4)-2;
  end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  if (n+1) div 2 = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    x := 16;
    DataComment('Process '+Chr(2*i+48)+': ', 5, y+i);
    if i=0 then
    begin
    DataN('M =', m, x, y+i, 2);
    DataN('N =', k, x+7, y+i, 2);
    x := x + 14;
    end;
    DataN('X =', a[2*i], x, y+i, 2);
    DataN('Y =', b[2*i], x+7, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Process '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],1,0), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Process '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],1,0), 45, y+i-1, 2);
  end;
  SetTestCount(5);
end;

procedure MpiH12;
var i,n,y,x,m,k: integer;
    a,b: array [0..9] of integer;
begin
  m := Random(4)+2;
  n := 2*m + Random(10-2*m+1);
  k := n div m;
  n := m*k+1;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText('В главном процессе даны положительные целые числа~{M} и~{N}, произведение которых',0,1);
  TaskText('не превосходит количества процессов; кроме того, в процессах с рангами от~0',0,2);
  TaskText('до~{M}\*{N}\,\-\,1 даны целые числа~{X} и~{Y}. Переслать числа~{M} и~{N} во все процессы,',0,3);
  TaskText('после чего определить для начальных {M}\*{N}~процессов декартову топологию в виде',0,4);
  TaskText('двумерной решетки размера {M}\;\x\;{N}, являющейся периодической по второму',0,5);
  TaskText('измерению (порядок нумерации процессов оставить прежним). В каждом процессе,',0,0);
  TaskText('входящем в созданную топологию, вывести ранг процесса с координатами',0,0);
  TaskText('{X},~{Y} (с учетом периодичности), используя для этого функцию',0,0);
  TaskText('MPI\_Cart\_rank. В случае недопустимых координат вывести~\-1.',0,0);
  n := m*k;
  for i := 0 to n-1 do
  begin
    a[i] := Random(m+4)-2;
    b[i] := Random(k+4)-2;
  end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  if (n+1) div 2 = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    x := 16;
    DataComment('Process '+Chr(2*i+48)+': ', 5, y+i);
    if i=0 then
    begin
    DataN('M =', m, x, y+i, 2);
    DataN('N =', k, x+7, y+i, 2);
    x := x + 14;
    end;
    DataN('X =', a[2*i], x, y+i, 2);
    DataN('Y =', b[2*i], x+7, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Process '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],0,1), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Process '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],0,1), 45, y+i-1, 2);
  end;
  SetTestCount(5);
end;

procedure MpiH13;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(4)+3;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано вещественное число. Определить для',0,1);
  TaskText('всех процессов декартову топологию в виде одномерной решетки и осуществить',0,2);
  TaskText('простой сдвиг исходных данных с шагом~\-1 (число из каждого подчиненного',0,3);
  TaskText('процесса пересылается в предыдущий процесс). Для определения рангов посылающих',0,4);
  TaskText('и принимающих процессов использовать функцию MPI\_Cart\_shift, пересылку',0,5);
  TaskText('выполнять с помощью функций MPI\_Send и MPI\_Recv. Во всех процессах,',0,0);
  TaskText('получивших данные, вывести эти данные.',0,0);
  for i := 1 to 5 do
    a[i] := 89.98*Random+10;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', a[i], 0, y+i, 5);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i-1);
    ResultR('Process '+Chr(i-1+48)+': ', a[i], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiH14;
var i,n,k,y,j,m,d: integer;
    r: array[1..2,0..10] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := 2;
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1; в каждом процессе',0,1);
  TaskText('дано вещественное число~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера 2\;\x\;{N} (порядок нумерации процессов оставить',0,3);
  TaskText('прежним) и для каждой строки матрицы осуществить циклический сдвиг исходных',0,4);
  TaskText('данных с шагом~1 (число~{A} из каждого процесса, кроме последнего в строке,',0,5);
  TaskText('пересылается в следующий процесс этой же строки, а из последнего процесса~\= в',0,0);
  TaskText('главный процесс этой строки). Для определения рангов посылающих и принимающих',0,0);
  TaskText('процессов использовать функцию MPI\_Cart\_shift, пересылку выполнять с помощью',0,0);
  TaskText('функции MPI\_Sendrecv. Во всех процессах вывести полученные данные.',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  for j := 0 to n do
    r[i,j] := 8.98*Random+1;
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('Process ' + Chr(m+48)+': ', r[i,j-1],Center(j,n div k,14,d),y+i,3);
    end;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      DataR('Process ' + Chr(m+48)+': ', r[i,j mod (n div k)],Center(j,n div k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH15;
var i,n,k,j,j1,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано вещественное',0,1);
  TaskText('число. Определить для всех процессов декартову топологию в виде трехмерной',0,2);
  TaskText('решетки размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя полученную решетку как {K}/4 матриц размера 2\;\x\;2 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой третьей координатой, матрицы упорядочены',0,5);
  TaskText('по возрастанию третьей координаты), осуществить циклический сдвиг исходных',0,0);
  TaskText('данных из процессов каждой матрицы в соответствующие процессы следующей',0,0);
  TaskText('матрицы (из процессов последней матрицы данные перемещаются в первую',0,0);
  TaskText('матрицу). Для определения рангов посылающих и принимающих процессов',0,0);
  TaskText('использовать функцию MPI\_Cart\_shift, пересылку выполнять с помощью функции',0,0);
  TaskText('MPI\_Sendrecv\_replace. Во всех процессах вывести полученные данные.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        j1 := j - 1;
        if j1 = 0 then j1 := k;
        ResultR('Process '+s+': ',r[i,l,j1],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  SetTestCount(5);
end;

procedure MpiH16;
var i,n,y,k: integer;
    a: array [0..10] of integer;
begin
  n := 2*(2+Random(3))+1;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 2;
  TaskText('Число процессов~{K} является нечетным: {K}~=~2{N}\,+\,1 (1~<~{N}~<~5); в каждом процессе',0,1);
  TaskText('дано целое число~{A}. Используя функцию MPI\_Graph\_create, определить для всех',0,2);
  TaskText('процессов топологию графа, в которой главный процесс связан ребрами со всеми',0,3);
  TaskText('процессами нечетного ранга (1,~3,~\., 2{N}\,\-\,1), а каждый процесс четного',0,4);
  TaskText('положительного ранга~{R} (2, 4,~\., 2{N}) связан ребром с процессом ранга~{R}\,\-\,1',0,5);
  TaskText('(в результате получается {N}-лучевая звезда, центром которой является главный',0,0);
  TaskText('процесс, а каждый луч состоит из двух подчиненных процессов~{R} и~{R}\,+\,1, причем',0,0);
  TaskText('ближайшим к центру является процесс нечетного ранга~{R}). Переслать число~{A} из',0,0);
  TaskText('каждого процесса всем процессам, связанным с ним ребрами (\Iпроцессам-соседям\i).',0,0);
  TaskText('Для определения количества процессов-соседей и их рангов использовать функции',0,0);
  TaskText('MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors, пересылку выполнять',0,0);
  TaskText('с помощью функций MPI\_Send и MPI\_Recv. Во всех процессах вывести полученные',0,0);
  TaskText('числа в порядке возрастания рангов переславших их процессов.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 4 then y := 1;
    SetProcess(0);
    DataN('Process 0: A = ', a[0], xLeft, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': A = ', a[2*i-1], xLeft, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': A = ', a[2*i], xRight, y+i, 2)
  end;
    SetProcess(0);
    ResultComment('Process 0:',12,y);
    for i := 1 to k do
      ResultN('', a[2*i-1], 20+i*3, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Process '+Chr(2*i-1+48)+':',12,y+i);
    ResultN('', a[0], 23, y+i, 2);
    ResultN('', a[2*i], 26, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':',51,y+i);
    ResultN('', a[2*i-1], 62, y+i, 2)
  end;
  SetTestCount(5);
end;

procedure MpiH17;
var i,n,y,k,j: integer;
    a: array [0..10] of integer;
begin
  n := 2*(2+Random(4));
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 2;
  TaskText('Число процессов~{K} является четным: {K}~=~2{N} (1~<~{N}~<~6); в каждом процессе',0,1);
  TaskText('дано целое число~{A}. Используя функцию MPI\_Graph\_create, определить для всех',0,2);
  TaskText('процессов топологию графа, в которой все процессы четного ранга (включая',0,3);
  TaskText('главный процесс) связаны в цепочку: 0 \= 2 \= 4 \= 6 \= \. \= (2{N}\,\-\,2), а каждый',0,4);
  TaskText('Process нечетного ранга~{R} (1, 3,~\., 2{N}\,\-\,1) связан с процессом ранга~{R}\,\-\,1',0,5);
  TaskText('(в результате каждый процесс нечетного ранга будет иметь единственного соседа,',0,0);
  TaskText('первый и последний процессы четного ранга будут иметь по два соседа,',0,0);
  TaskText('а остальные~\= \<внутренние\>~\= процессы четного ранга будут иметь по три',0,0);
  TaskText('соседа). Переслать число~{A} из каждого процесса всем процессам-соседям. Для',0,0);
  TaskText('определения количества процессов-соседей и их рангов использовать функции',0,0);
  TaskText('MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors, пересылку выполнять',0,0);
  TaskText('с помощью функции MPI\_Sendrecv. Во всех процессах вывести полученные',0,0);
  TaskText('числа в порядке возрастания рангов переславших их процессов.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 5 then y := 1;
  if k = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': A = ', a[2*i], xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': A = ', a[2*i-1], xRight, y+i-1, 2);
  end;

  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 12, y+i);
    j := 23;
    if 2*i-2 >=0 then
    begin
      ResultN('', a[2*i-2], j, y+i, 2);
      j := j + 3;
    end;
    ResultN('', a[2*i+1], j, y+i, 2);
    j := j + 3;
    if 2*i+2 <n then
      ResultN('', a[2*i+2], j, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Process '+Chr(2*i-1+48)+': ', a[2*i-2], 51, y+i-1, 2);
  end;
  SetTestCount(5);
end;                                 

procedure MpiH18;
var i,n,y,k,j,m: integer;
    a: array [0..12] of integer;
    s: string;
begin
  n := 3*(2+Random(3))+1;
  CreateTask('Виртуальные топологии', n);
  if n = 0 then exit;
  k := n div 3;
  TaskText('Количество процессов~{K} равно~3{N}\,+\,1 (1~<~{N}~<~5); в каждом процессе дано целое',0,1);
  TaskText('число~{A}. Используя функцию MPI\_Graph\_create, определить для всех процессов',0,2);
  TaskText('топологию графа, в которой процессы~{R}, {R}\,+\,1, {R}\,+\,2, где {R}~=~1,~4, 7,~\., связаны',0,3);
  TaskText('между собой ребрами, и, кроме того, каждый процесс положительного ранга,',0,4);
  TaskText('кратного трем (3, 6,~\.), связан ребром с главным процессом (в результате',0,5);
  TaskText('получается {N}-лучевая звезда, центром которой является главный процесс,',0,0);
  TaskText('а каждый луч состоит из трех связанных между собой процессов, причем с центром',0,0);
  TaskText('связан процесс ранга, кратного трем). Переслать число~{A} из каждого процесса',0,0);
  TaskText('всем процессам-соседям. Для определения количества процессов-соседей и их',0,0);
  TaskText('рангов использовать функции MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors,',0,0);
  TaskText('пересылку выполнять с помощью функции MPI\_Sendrecv. Во всех процессах вывести',0,0);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 4 then y := 1;
  SetProcess(0);
    DataN('Process  0: A = ', a[0], 0, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    DataN('Process '+s+': A = ', a[m], Center(j,3,18,6), y+i, 2);
  end;
  SetProcess(0);
  ResultComment('Process  0:', 31, y);
  for i := 1 to k do
    ResultN('', a[3*i], 40+i*3, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    ResultComment('Process '+s+':', -17+j*24, y+i);
    case j of
    1: begin
         ResultN('', a[m+1], -5+j*24, y+i, 2);
         ResultN('', a[m+2], -2+j*24, y+i, 2);
       end;
    2: begin
         ResultN('', a[m-1], -5+j*24, y+i, 2);
         ResultN('', a[m+1], -2+j*24, y+i, 2);
       end;
    3: begin
         ResultN('', a[0], -5+j*24, y+i, 2);
         ResultN('', a[m-2], -2+j*24, y+i, 2);
         ResultN('', a[m-1], 1+j*24, y+i, 2);
       end;
    end;
  end;
  SetTestCount(5);
end;

(*procedure MpiA0;
var i,n: integer;
    d: real;
    s: string;
begin
  n := 36;//Random(3)+31;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом из процессов, входящих в коммуникатор MPI\_COMM\_WORLD,',0,2);
  TaskText('прочесть одно вещественное число и вывести его противоположное значение.',0,4);
  SetProcess(0);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random*199.99-100;
    Str(i:2, s);
    DataR('Process '+s+': ', d, 0, i+1, 6);
    ResultR('Process '+s+': ', -d, 0, i+1, 6);
  end;
  SetTestCount(5);
end;
*)


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
 29: MpiB23;}
 1: MpiC1;
 2: MpiC2;
 3: MpiC3;
 4: MpiC4;
 5: MpiC5;
 6: MpiC6;
 7: MpiC7;
 8: MpiC8;
 9: MpiC9;
 10: MpiC10;
 11: MpiC11;
 12: MpiC12;
 13: MpiC13;
 14: MpiC14;
 15: MpiC15;
 16: MpiC16;
 17: MpiC17;
 18: MpiC18;
 19: MpiD1;
 20: MpiD2;
 21: MpiD3;
 22: MpiD4;
 23: MpiD5;
 24: MpiD6;
 25: MpiD7;
 26: MpiD8;
 27: MpiD9;
 28: MpiD10;
{ 58: MpiE1;
 59: MpiE2;
 60: MpiE3;
 61: MpiE4;
 62: MpiE5;
 63: MpiE6;
 64: MpiE7;
 65: MpiE8;
 66: MpiF1;
 67: MpiF2;
 68: MpiF3;
 69: MpiF4;
 70: MpiF5;
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
  CreateGroup('MPI3Coll', 'Collective communications', 'M. E. Abramyan, 2014,2017',
  'sddfgfsjnbvvdfsd78fgfgd', 28, InitTask);
//  CommentText('Если количество процессов в задании не определено, то можно считать, что это количество не превосходит~12.');
//  CommentText('Под \Iглавным процессом\i всюду в формулировках заданий понимается');
//  CommentText('процесс ранга~0 для коммуникатора MPI\_COMM\_WORLD. Для всех процессов ненулевого ранга в заданиях используется');
//  CommentText('общее наименование \Iподчиненных процессов\i.');
//  CommentText('\PЕсли в задании не указан тип обрабатываемых чисел, то числа считаются вещественными.');
//  CommentText('Если в задании не определяется максимальный размер набора чисел, то его следует считать равным~10.');
end;

//exports inittaskgroup;

begin
end.
