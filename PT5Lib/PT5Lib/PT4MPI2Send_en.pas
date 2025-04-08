{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI2Send_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  prcname = 'Process %d: ';
  DebugSec = 'The content of the debug section should be as follows:';
  Title2a = 'Blocking communications';
  Title2b = 'Nonblocking communications';


function Prc(n: integer): string;
begin
  result := Format(prcname, [n]);
end;



procedure MpiB1;
var i,n,y: integer;
    d: integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in each process. Send all given integers to the master'#13+
'process using the MPI\_Send and MPI\_Recv functions (the blocking functions'#13+
'for standard communication mode) and output received integers in the master'#13+
'process in ascending order of ranks of sending processes.'
  );

(*
  TaskText('В каждом подчиненном процессе дано целое число. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя функции MPI\_Send и MPI\_Recv',0,2);
  TaskText('(стандартные блокирующие функции для передачи и приема сообщения),',0,3);
  TaskText('и вывести их в главном процессе. Полученные числа выводить',0,4);
  TaskText('в порядке возрастания рангов переславших их процессов.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  ResultComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random(90)+10;
    DataN('Process '+Chr(i+48)+': ', d, 0, y+i, 2);
    SetProcess(0);
    ResultN('', d, Center(i,n-1,2,2), 3, 2)
  end;
  SetTestCount(5);
end;

procedure MpiB2;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each slave process. Send all given numbers'#13+
'to the master process using the MPI\_Bsend (the blocking function'#13+
'for buffered send) and MPI\_Recv functions and output received numbers'#13+
'in the master process in descending order of ranks of sending processes.'#13+
'Use the MPI\_Buffer\_attach function for attaching a buffer to a process.'
  );
(*
  TaskText('В каждом подчиненном процессе дано вещественное число. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя функции MPI\_Bsend (посылка сообщения',0,2);
  TaskText('с буферизацией) и MPI\_Recv, и вывести их в главном процессе. Полученные',0,3);
  TaskText('числа выводить в порядке убывания рангов переславших их процессов.',0,4);
  TaskText('Для задания буфера использовать функцию MPI\_Buffer\_attach.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  ResultComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    DataR('Process '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
    SetProcess(0);
    ResultR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB3;
var i,j,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'Four integers are given in each slave process. Send all given integers'#13+
'to the master process using one call of the MPI\_Send function for each'#13+
'sending process. Output received integers in the master process'#13+
'in ascending order of ranks of sending processes.'
  );

(*
  TaskText('В каждом подчиненном процессе даны четыре целых числа. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя по одному вызову функции MPI\_Send',0,2);
  TaskText('для каждого передающего процесса, и вывести их в главном процессе.',0,3);
  TaskText('Полученные числа выводить в порядке возрастания',0,4);
  TaskText('рангов переславших их процессов.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    DataComment('Process '+Chr(i+48)+': ',30,y+i);
    for j := 1 to 4 do
    begin
      inc(c);
      d := Random(90)+10;
      SetProcess(i);
      DataN('', d, Center(4+j,8,2,1), y+i, 1);
      SetProcess(0);
      ResultN('', d, Center(c,4*(n-1),2,1), 3, 2)
     end;
  end;
  SetTestCount(5);
end;

procedure MpiB4;
var i,j,n,k0,y,c: integer;
    d: integer;
    k: array[1..5] of integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} (0~<~{N}~<~5) and a sequence of {N}~integers are given in each'#13+
'slave process. Send all given sequences to the master process using one call'#13+
'of the MPI\_Bsend function for each sending process. Output received integers'#13+
'in the master process in ascending order of ranks of sending processes.'#13+
'Use the MPI\_Get\_count to determine the size of received sequences.'
  );
(*
  TaskText('В каждом подчиненном процессе дано целое число~{N} (0~<~{N}~<~5) и набор из',0,1);
  TaskText('{N}~целых чисел. Переслать данные наборы в главный процесс, используя по одному',0,2);
  TaskText('вызову функции MPI\_Bsend для каждого передающего процесса, и вывести наборы',0,3);
  TaskText('в главном процессе в порядке возрастания рангов переславших их процессов. Для',0,4);
  TaskText('определения размера пересланного набора использовать функцию MPI\_Get\_count.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('Process 0: ',0,2);
  k0 := 0;
  for i := 1 to n-1 do
  begin
    k[i] := Random(4)+1;
    k0 := k0 + k[i]
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': N = ',k[i], 23, y+i, 1);
    for j := 1 to k[i] do
    begin
      inc(c);
      d := Random(90)+10;
      SetProcess(i);
      DataN('', d, Center(4+j,8,2,1), y+i, 1);
      SetProcess(0);
      ResultN('', d, Center(c,k0,2,1), 3, 2)
     end;
  end;
  SetTestCount(5);
end;

procedure MpiB5;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A sequence of real numbers is given in the master process; the size'#13+
'of sequence is equal to the number of slave processes. Send each element'#13+
'of given sequence to corresponding slave process using the MPI\_Send function:'#13+
'the first number should be sent to the process~1, the second number'#13+
'should be sent to the process~2, and so~on. Output received numbers'#13+
'in the slave processes.'
  );
(*
  TaskText('В главном процессе дан набор вещественных чисел; количество чисел',0,1);
  TaskText('равно количеству подчиненных процессов. С помощью функции MPI\_Send',0,2);
  TaskText('переслать по одному числу в каждый из подчиненных процессов',0,3);
  TaskText('(первое число в процесс~1, второе~\= в процесс~2, и т.\,д.)',0,4);
  TaskText('и вывести в подчиненных процессах полученные числа.',0,5);
  *)
  y := 1;
  if n = 6 then y := 0;
  DataComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('Process '+Chr(i+48)+': ', d, 0, y+i, 5);
    SetProcess(0);
    DataR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB6;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A sequence of real numbers is given in the master process; the size'#13+
'of sequence is equal to the number of slave processes. Send each element'#13+
'of given sequence to corresponding slave process (in inverse order)'#13+
'using the MPI\_Bsend function: the first number should be sent to the last'#13+
'process, the second number should be sent to the last but one process,'#13+
'and so~on. Output received numbers in the slave processes.'
  );
(*
  TaskText('В главном процессе дан набор вещественных чисел; количество чисел равно',0,1);
  TaskText('количеству подчиненных процессов. С помощью функции MPI\_Bsend переслать',0,2);
  TaskText('по одному числу в каждый из подчиненных процессов, перебирая процессы в',0,3);
  TaskText('обратном порядке (первое число в последний процесс, второе~\= в предпоследний',0,4);
  TaskText('процесс, и т.\,д.), и вывести в подчиненных процессах полученные числа.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  DataComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    ResultR('Process '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
    SetProcess(0);
    DataR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB7;
var i,n,y,c: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} and a sequence of {N}~real numbers is given in the master process;'#13+
'{K}\,\-\,1~\l~{N}~<~10, {K} is the number of processes. Send elements of given'#13+
'sequence with order number~1, 2,~\., {K}\,\-\,2 to slave process'#13+
'of rank~1, 2,~\., {K}\,\-\,2 respectively, and send remaining elements'#13+
'of the sequence to the process~{K}\,\-\,1. Output received numbers'#13+
'in the slave processes. Use the MPI\_Send function to send data,'#13+
'use the MPI\_Get\_count function to determine the size of received'#13+
'sequences in the process~{K}\,\-\,1.'
  );
(*
  TaskText('В главном процессе дано целое число~{N} и набор из {N}~чисел; {K}\,\-\,1~\l~{N}~<~10,',0,1);
  TaskText('где {K}~\= количество процессов. С помощью функции MPI\_Send переслать',0,2);
  TaskText('по одному числу их данного набора в процессы~1, 2,~\., {K}\,\-\,2, а оставшиеся',0,3);
  TaskText('числа~\= в процесс~{K}\,\-\,1, и вывести полученные числа. В процессе~{K}\,\-\,1 для',0,4);
  TaskText('определения количества полученных чисел использовать функцию MPI\_Get\_count.',0,5);
  *)
  y := 1;
  if n = 6 then y := 0;
  c := Random(5) + n - 1;
  DataN('Process 0: N = ',c,0,2,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('Process '+Chr(i+48)+': ', d, 0, y+i, 5);
    SetProcess(0);
    DataR('', d, Center(i,c,5,2), 3, 5)
  end;
  for i := n to c do
  begin
    SetProcess(n-1);
    d := Random*89.99+10;
    ResultR('', d, 50+(i-n)*7, y+n-1, 5);
    SetProcess(0);
    DataR('', d, Center(i,c,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB8;
var i,n,y,c: integer;
    d,d1: integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in each slave process; only one of given integers'#13+
'is nonzero-valued. Send nonzero integer to the master process. Output'#13+
'the received number and the rank of sending process in the master process.'#13+
'Use the MPI\_Recv function with the MPI\_ANY\_SOURCE parameter to receive'#13+
'data in the master process.'
  );
(*
  TaskText('В каждом подчиненном процессе дано целое число, причем только для одного',0,1);
  TaskText('процесса это число отлично от нуля. Переслать ненулевое число в главный',0,2);
  TaskText('Process и вывести в главном процессе полученное число и ранг процесса,',0,3);
  TaskText('переславшего это число. Для приема сообщения в главном процессе',0,4);
  TaskText('использовать функцию MPI\_Recv с параметром MPI\_ANY\_SOURCE.',0,5);
*)
  y := 1;
  if n = 6 then y := 0;
  c := Random(n-1)+1;
  d := Random(90)+10;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    if i = c then
      d1 := d
    else
      d1 := 0;
    DataN('Process '+Chr(i+48)+': ', d1, 0, y+i, 2)
  end;
  SetProcess(0);
  ResultN2('Process 0: ', d, c, 34, 3, 2);
  SetTestCount(5);
end;

procedure MpiB9;
var i,n,y,j,c: integer;
    d,d1: integer;
    r: real;
    s: string;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each slave process; one of given integers'#13+
'is positive, others are zero-valued. Also a sequence of {N}~real numbers'#13+
'is given in the slave process with nonzero integer~{N}. Send the given sequence'#13+
'to the master process. Output the received numbers and the rank of sending'#13+
'process in the master process. Use the MPI\_Recv function'#13+
'with the MPI\_ANY\_SOURCE parameter to receive data in the master process.'
  );
(*
  TaskText('В каждом подчиненном процессе дано целое число~{N}, причем для одного процесса',0,1);
  TaskText('это число больше нуля, а для остальных равно нулю. В процессе с ненулевым~{N}',0,2);
  TaskText('дан также набор из {N}~чисел. Переслать данный набор чисел в главный процесс',0,3);
  TaskText('и вывести в главном процессе полученные числа и ранг процесса, переславшего',0,4);
  TaskText('этот набор. При приеме сообщения использовать параметр MPI\_ANY\_SOURCE.',0,5);
  *)
  y := 1;
  if n = 6 then y := 0;
  c := Random(n-1)+1;
  d := Random(9)+1;
  ResultComment('Process 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    if i = c then
      d1 := d
    else
      d1 := 0;
    DataN('Process '+Chr(i+48)+': N = ', d1, 2, y+i, 1);
    if i = c then
    for j := 1 to d do
    begin
      r := Random*89.99+10;
      SetProcess(i);
      DataR('', r, 14+j*6, y+i, 5);
      SetProcess(0);
      ResultR('', r, Center(j,d,5,2), 3, 5);
    end;
  end;
  SetProcess(0);
  ResultN('', c, 0, 4, 1);
  SetTestCount(5);
end;

procedure MpiB10;
var i,n,y,k,s: integer;
    a: array[1..5] of integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each slave process, an integer~{K} (>\,0) is given'#13+
'in the master process; the number~{K} is equal to number of slave processes'#13+
'whose given integers~{N} are positive. Send all positive integers~{N}'#13+
'to the master process. Output sum of received numbers in the master process.'#13+
'Use the MPI\_Recv function with the MPI\_ANY\_SOURCE parameter'#13+
'to receive data in the master process.'
  );
(*
  TaskText('В каждом подчиненном процессе дано целое число~{N}, в главном процессе дано',0,1);
  TaskText('целое число~{K} (>\,0), равное количеству тех подчиненных процессов, в которых',0,2);
  TaskText('даны положительные числа~{N}. Переслать все положительные числа~{N} в главный',0,3);
  TaskText('Process и вывести в нем сумму полученных чисел. Для приема сообщений',0,4);
  TaskText('в главном процессе использовать функцию MPI\_Recv с параметром MPI\_ANY\_SOURCE.',0,5);
  *)
  y := 1;
  if n = 6 then y := 0;
  repeat
  k := 0;
  s := 0;
  for i := 1 to n-1 do
    case Random(3) of
    0: a[i] := 0;
    1: a[i] := Random(9)-9;
    2: begin
         a[i] := Random(9)+1;
         s := s + a[i];
         inc(k);
       end;
    end;
  until k>0;
  SetProcess(0);
  ResultN('Process 0: ',s,0,3,2);
  DataN('Process 0: K = ',k,xLeft,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': N = ', a[i], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB11;
var i,n,y: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Send the given number from'#13+
'the master process to all slave processes and send the given numbers from'#13+
'the slave processes to the master process. Output the received numbers'#13+
'in each process. The numbers received by the master process should be'#13+
'output in ascending order of ranks of sending processes.'#13+
'Use the MPI\_Ssend function to send data.'#13+
'\P\SNote.\s The MPI\_Ssend function provides a \Isynchronous data transfer mode\i,'#13+
'in which the operation of sending a message will be completed only after'#13+
'the receiving process starts to receive this message. In the case of data'#13+
'transfer in synchronous mode, there is a danger of \Ideadlocks\i because of'#13+
'the incorrect order of the function calls for sending and receiving data.'
  );
(*
  TaskText('В каждом процессе дано вещественное число. Переслать число из главного',0,1);
  TaskText('процесса во все подчиненные процессы, а все числа из подчиненных процессов~\=',0,2);
  TaskText('в главный, и вывести в каждом процессе полученные числа (в главном процессе',0,3);
  TaskText('числа выводить в порядке возрастания рангов переславших их процессов).',0,4);
  TaskText('Для отправки сообщений использовать функцию MPI\_Ssend.',0,5);
  TaskText('\P\SУказание.\s Функция MPI\_Ssend обеспечивает \Iсинхронный режим\i пересылки данных,',0,0);
  TaskText('при котором операция отправки сообщения будет завершена только после начала',0,0);
  TaskText('приема этого сообщения процессом-получателем. В случае пересылки данных',0,0);
  TaskText('в синхронном режиме возникает опасность \Iвзаимных блокировок\i (deadlocks)',0,0);
  TaskText('из-за неправильного порядка вызова функций отправки и получения сообщений.',0,0);
  *)
  y := 1;
  if n = 6 then y := 0;
  for i := 0 to n-1 do
    a[i] := Random*9.98;
  SetProcess(0);
  DataR('Process 0: ',a[0],12,3,3);
  ResultComment('Process 0: ',12,3);
  for i := 1 to n-1 do
    ResultR('',a[i],18+5*i,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', a[i], xRight, y+i, 2);
    ResultR('Process '+Chr(i+48)+': ', a[0], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB12;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in each process. Using the MPI\_Ssend and MPI\_Recv'#13+
'functions, perform the right cyclic shift of given data by step~1 (that is,'#13+
'the given integer should be sent from the process~0 to the process~1,'#13+
'from the process~1 to the process~2, \., from the last process'#13+
'to the process~0). Output the received number in each process.'#13+
'\P\SNote.\s See note to \1.'
  );

(*
  TaskText('В каждом процессе дано целое число. С помощью функций MPI\_Ssend и MPI\_Recv',0,1);
  TaskText('осуществить для всех процессов циклический сдвиг данных с шагом~1,',0,2);
  TaskText('переслав число из процесса~0 в процесс~1, из процесса~1 в процесс~2, \.,',0,3);
  TaskText('из последнего процесса в процесс~0. В каждом процессе вывести полученное',0,4);
  TaskText('число. \P\SУказание.\s См. указание к задаче \1.',0,5);
*)
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+1) mod n;
    SetProcess(c);
    ResultN('Process '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB13;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in each process. Using the MPI\_Ssend and MPI\_Recv'#13+
'functions, perform the left cyclic shift of given data by step~\-1 (that is,'#13+
'the given integer should be sent from the process~1 to the process~0,'#13+
'from the process~2 to the process~1, \., from the process~0'#13+
'to the last process). Output the received number in each process.'#13+
'\P\SNote.\s See note to \2.'
  );
(*
  TaskText('В каждом процессе дано целое число. С помощью функций MPI\_Ssend и MPI\_Recv',0,1);
  TaskText('осуществить для всех процессов циклический сдвиг данных с шагом~\-1,',0,2);
  TaskText('переслав число из процесса~1 в процесс~0, из процесса~2 в процесс~1, \.,',0,3);
  TaskText('из процесса~0 в последний процесс. В каждом процессе вывести полученное',0,4);
  TaskText('число. \P\SУказание.\s См. указание к задаче \2.',0,5);
*)
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+n-1) mod n;
    SetProcess(c);
    ResultN('Process '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB14;
var i,n,y: integer;
    a,b: array[0..5] of integer;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'Two integers are given in each process. Send the first integer to the previous'#13+
'process and the second integer to the next process (use the MPI\_Ssend'#13+
'and MPI\_Recv functions). The last process is assumed to be the previous'#13+
'one for the master process, the master process is assumed to be the next one'#13+
'for the last process. Output the received numbers in each process'#13+
'in the following order: the number received from the previous process,'#13+
'then the number received from the next process.'#13+
'\P\SNote.\s See note to \3.'
  );
(*
  TaskText('В каждом процессе даны два целых числа. С помощью функций MPI\_Ssend и MPI\_Recv',0,1);
  TaskText('переслать первое число в предыдущий процесс, а второе~\= в последующий процесс',0,2);
  TaskText('(для процесса~0 считать предыдущим последний процесс, а для последнего',0,3);
  TaskText('процесса считать последующим процесс~0). В каждом процессе вывести числа,',0,4);
  TaskText('полученные от предыдущего и последующего процесса (в указанном порядке).',0,5);
  TaskText('\P\SУказание.\s См. указание к задаче \3.',0,0);
*)
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    a[i] := Random(90)+10;
    b[i] := Random(90)+10;
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    DataN2('Process '+Chr(i+48)+':', a[i], b[i], 0, y+i, 3);
    ResultN2('Process '+Chr(i+48)+':', b[(i+n-1) mod n], a[(i+1) mod n], 0, y+i, 3);
  end;
  SetTestCount(5);
end;

procedure Swap(var a, b: integer);
var v: integer;
begin
  v := a;
  a := b;
  b := v;
end;

procedure MpiB15;
var i,n,y: integer;
    b: array[0..4] of integer;
    r: real;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A real number~{A} and an integer~{N} are given in each process; the set of given'#13+
'integers {N} contains all values in the range~0 to~{K}\,\-\,1, {K} is the number'#13+
'of processes. Send the number~{A} to the process~{N} in each process'#13+
'(use the MPI\_Send and MPI\_Recv functions and the MPI\_ANY\_SOURCE parameter).'#13+
'Output the received number and the rank of sending process in each process.'#13+
'\P\SNote.\s If the value {N} equals the rank of the process in which it is given,'#13+
'then the required results can be output without calling the MPI functions.'#13+
'This is the only way for MPICH2 version 1.3, since, in this version,'#13+
'the MPI\_Send function call is erroneous if the sending'#13+
'and receiving processes are the same.'
  );
(*
//2020.10 Примечание добавлено в версии 1.2
  TaskText('В каждом процессе даны два числа: вещественное~{A} и целое~{N}, причем набор',0,1);
  TaskText('чисел~{N} содержит все значения от~0 до~{K}\;\-\;1, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функции MPI\_Send и MPI\_Recv (с параметром MPI\_ANY\_SOURCE),',0,3);
  TaskText('выполнить в каждом процессе пересылку числа~{A} в процесс~{N} и вывести',0,4);
  TaskText('полученное число, а также ранг процесса, из которого число было получено.',0,5);
  TaskText('\P\SПримечание.\s Если значение {N} совпадает с рангом процесса, в котором оно дано,',0,0);
  TaskText('то требуемые результаты можно вывести, не вызывая функции библиотеки MPI.',0,0);
  TaskText('Такой способ надо обязательно применять при использовании MPICH2 версии 1.3',0,0);
  TaskText('так как в этой версии вызов функции MPI\_Send приводит к зависанию',0,0);
  TaskText('процесса-отправителя, если его ранг совпадает с рангом процесса-получателя.',0,0);
*)
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
    b[i] := i;
  for i := 0 to n-1 do
    Swap(b[i], b[Random(n)]);
  for i := 0 to n-1 do
  begin
    r := Random*89.99+10;
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': A = ', r, 26, y+i, 5);
    DataN('N = ',b[i],48,y+i, 1);
    SetProcess(b[i]);
    ResultR('Process '+Chr(b[i]+48)+': ', r, 30, y+b[i], 5);
    ResultN('',i,48,y+b[i], 1);
  end;
  SetTestCount(5);
end;

procedure MpiB16;
var i,n,y,c,k,j: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for one process and is equal to~0 for others. Also a sequence'#13+
'of {K}\,\-\,1 real numbers is given in the process with nonzero integer~{N};'#13+
'{K} is the number of processes. Send each number from the given sequence'#13+
'to one of other processes in ascending order of ranks of receiving processes.'#13+
'Output the received number in each process.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, причем для одного процесса значение~{N}',0,1);
  TaskText('равно~1, а для остальных равно~0. В процессе с {N}~=~1 дан также набор из {K}\,\-\,1',0,2);
  TaskText('числа, где {K}~\= количество процессов. Переслать из этого процесса по одному',0,3);
  TaskText('из чисел данного набора в остальные процессы, перебирая ранги получателей',0,4);
  TaskText('в возрастающем порядке, и вывести в каждом из них полученное число.',0,5);
*)
  y := 2;
  if n = 5 then y := 1;
  c := Random(n);
  for i := 0 to n-2 do
    a[i] := Random*89.99+10;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    if i <> c then
      k := 0
    else
      k := 1;
    DataN('Process '+Chr(i+48)+': N = ', k, 0, y+i, 1);
    if i = c then
      for j := 0 to n-2 do
        DataR('', a[j], 49+j*6, y+i, 5);
  end;
  j := 0;
  y := 2;
  if n = 3 then y := 3;
  for i := 0 to n-1 do
  begin
    if i = c then
    begin
      j := 1;
      continue;
    end;
    SetProcess(i);
    ResultR('Process '+Chr(i+48)+': ', a[i-j], 0, y+i-j, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB17;
var i,n,y,k,j: integer;
    a: array[0..4,0..4] of integer;
begin
  n := Random(3)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,\-\,1 integers is given in each process; {K} is the number'#13+
'of processes. Send one of the integers from the given sequence in each'#13+
'process to the corresponding process in ascending order of ranks of receiving'#13+
'processes. Output the received numbers in each process in ascending order'#13+
'of ranks of sending processes.'
  );
(*
  TaskText('В каждом процессе дан набор из {K}\,\-\,1 целого числа, где {K}~\= количество',0,1);
  TaskText('процессов. Для каждого процесса переслать по одному из данных в нем',0,2);
  TaskText('чисел в остальные процессы, перебирая ранги процессов-получателей',0,3);
  TaskText('в возрастающем порядке, и вывести полученные числа в порядке',0,4);
  TaskText('возрастания рангов переславших их процессов.',0,5);
*)
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
    for j := 0 to n-1 do
    a[i,j] := Random(90)+10;
  for i := 0 to n-1 do
    a[i,i] := 0;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+':', 30, y+i);
    k := -1;
    for j := 0 to n-2 do
    begin
      k := k + 1;
      if i = j then
        k := k + 1;
      DataN('',a[i,k], 41+j*3,y+i,2);
    end;

    ResultComment('Process '+Chr(i+48)+':', 30, y+i);
    k := -1;
    for j := 0 to n-2 do
    begin
      k := k + 1;
      if i = j then
        k := k + 1;
      ResultN('',a[k,i], 41+j*3,y+i,2);
    end;

  end;
  SetTestCount(5);
end;

procedure MpiB18;
var i,n,y,j: integer;
    a: array[0..9,1..4] of real;
    k: array[0..9] of integer;
begin
  n := 2*(Random(4)+2);
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'The number of processes is an even number. An integer~{N} (0~<~{N}~<~5)'#13+
'and a sequence of {N}~real numbers are given in each process. Exchange given'#13+
'sequences of processes~0 and~1, 2 and~3, and so~on, using'#13+
'the MPI\_Sendrecv function. Output the received sequence'#13+
'of real numbers in each process.'
  );
(*
  TaskText('Количество процессов~\= четное число. В каждом процессе дано целое число~{N}',0,2);
  TaskText('(0~<~{N}~<~5) и набор из {N}~чисел. С помощью функции MPI\_Sendrecv выполнить',0,3);
  TaskText('обмен исходными наборами между парами процессов~0 и~1, 2 и~3, и т.\,д.',0,4);
  TaskText('В каждом процессе вывести полученный набор чисел.',0,5);
*)
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    k[i] := 1 + Random(4);
    for j := 1 to k[i] do
      a[i,j] := Random*9.99;
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', k[2*i], 3, y+i, 1);
    for j := 1 to k[2*i] do
      DataR('',a[2*i,j],16+j*5,y+i,4);
    ResultComment('Process '+Chr(2*i+48)+': ', 3, y+i);
    for j := 1 to k[2*i+1] do
      ResultR('',a[2*i+1,j],9+j*5,y+i,4);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', k[2*i-1], 41, y+i-1, 1);
    for j := 1 to k[2*i-1] do
      DataR('',a[2*i-1,j],54+j*5,y+i-1,4);
    ResultComment('Process '+Chr(2*i-1+48)+': ', 41, y+i-1);
    for j := 1 to k[2*i-2] do
      ResultR('',a[2*i-2,j],47+j*5,y+i-1,4);
  end;
  SetTestCount(5);
end;

procedure MpiB19;
var i,n,y: integer;
    a: array[0..9] of real;
begin
  n := Random(6)+5;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Change the order of given numbers'#13+
'to inverse one by sending the given numbers from the process~0 to the last'#13+
'process, from the process~1 to the last but one process, \., from the last'#13+
'process to the process~0. Use the MPI\_Sendrecv\_replace function. Output'#13+
'the received number in each process.'
  );
(*
  TaskText('В каждом процессе дано вещественное число. С помощью функции',0,1);
  TaskText('MPI\_Sendrecv\_replace поменять порядок исходных чисел на обратный (число из',0,2);
  TaskText('процесса~0 должно быть передано в последний процесс, число из процесса~1~\=',0,3);
  TaskText('в предпоследний процесс, \., число из последнего процесса~\= в процесс~0).',0,4);
  TaskText('В каждом процессе вывести полученное число.',0,5);
*)
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to n-1 do
    a[i] := Random*89.99+10;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataR('Process '+Chr(2*i+48)+': ', a[2*i], xLeft, y+i, 5);
    ResultR('Process '+Chr(2*i+48)+': ', a[n-1-2*i], xLeft, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataR('Process '+Chr(2*i-1+48)+': ', a[2*i-1], xRight, y+i-1, 5);
    ResultR('Process '+Chr(2*i-1+48)+': ', a[n-2*i], xRight, y+i-1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB20;
var i,n,y: integer;
    d,d1: array [1..5] of real;
    k: array [1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A real number~{A} and its order number~{N} (as an integer) are given in each'#13+
'slave process; the set of integers~{N} contains all values in the range~0'#13+
'to~{K}\,\-\,1, {K} is the number of processes. Send all numbers~{A}'#13+
'to the master process and output the received numbers in ascending order'#13+
'of their order numbers~{N}. Do not use arrays. Use the order number~{N}'#13+
'as a msgtag parameter of the MPI\_Send function.'
  );
(*
  TaskText('В каждом подчиненном процессе дано вещественное число~{A} и его порядковый',0,1);
  TaskText('номер~{N} (целое число); набор всех номеров~{N} содержит все целые числа от~1',0,2);
  TaskText('до~{K}\,\-\,1, где {K}~\= количество процессов. Переслать числа~{A} в главный процесс',0,3);
  TaskText('и вывести их в порядке, соответствующем возрастанию их номеров~{N}.',0,4);
  TaskText('Массивы не использовать; для передачи номера~{N} указывать его',0,5);
  TaskText('в качестве параметра msgtag функции MPI\_Send.',0,0);
*)
  for i := 1 to n-1 do
  begin
    d[i] := Random*89.98+10;
    k[i] := i;
  end;
  for i := 1 to n-1 do
    Swap(k[i], k[random(n-1)+1]);
  for i := 1 to n-1 do
    d1[k[i]] := d[i];
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': A = ', d[i], 27, y+i, 5);
    DataN('N = ', k[i], 49, y+i, 1);
  end;
  ResultComment('Process 0: ',0,2);
  SetProcess(0);
  for i := 1 to n-1 do
    ResultR('', d1[i], Center(i,n-1,5,2), 3, 5);
  SetTestCount(5);
end;

procedure MpiB21;
var i,n,y,j,m: integer;
    d,d1: array [1..12] of real;
    k,l: array [1..12] of integer;
begin
  n := Random(3)+4;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'An integer~{L} (\g\,0) and a sequence of {L}~pairs ({A},~{N}) are given in each'#13+
'slave process; {A} is a real number and {N} is the order number of~{A}.'#13+
'The sum of all integers~{L} is equal to 2{K}, where {K}~is the number of processes;'#13+
'the set of integers~{N} contains all values in the range~1 to~2{K}.'#13+
'Send all numbers~{A} to the master process and output the received numbers'#13+
'in ascending order of their order numbers~{N}. Do not use arrays.'#13+
'Use the order number~{N} as a msgtag parameter of the MPI\_Send function.'
  );

(*
  TaskText('В каждом подчиненном процессе дано целое число~{L} (\g\,0) и набор из {L}~пар чисел',0,1);
  TaskText('({A},~{N}), где {A}~\= вещественное число, а {N}~\= его порядковый номер. Все числа~{L}',0,2);
  TaskText('в сумме равны 2{K}, где {K}~\= количество процессов; набор номеров~{N}, данных',0,3);
  TaskText('во всех процессах, содержит все целые числа от~1 до~2{K}. Переслать числа~{A}',0,4);
  TaskText('в главный процесс и вывести их в порядке, соответствующем возрастанию',0,5);
  TaskText('их номеров~{N}. Массивы не использовать; для передачи номера~{N}',0,0);
  TaskText('указывать его в качестве параметра msgtag функции MPI\_Send.',0,0);
*)
  for i := 1 to 2*n do
  begin
    d[i] := Random*8.98+1;
    k[i] := i;
  end;
  for i := 1 to 2*n do
    Swap(k[i], k[random(2*n)+1]);
  for i := 1 to 2*n do
    d1[k[i]] := d[i];
  repeat
    l[n-1] := 2*n;
    for i := 1 to n-2 do
    begin
      l[i] := Random(4);
      l[n-1] := l[n-1]-l[i];
    end;
  until (l[n-1] >= 0) and (l[n-1]<6);;
  y := 1;
  if n = 6 then y := 0;
  m := 0;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': L = ', l[i], 3, y+i, 1);
    for j := 1 to l[i] do
    begin
    m := m + 1;
    DataR('', d[m], 12+j*11, y+i, 4);
    DataN('', k[m], 17+j*11, y+i, 2);
    end;
  end;
  ResultComment('Process 0: ',0,2);
  SetProcess(0);
  for i := 1 to 2*n do
    ResultR('', d1[i], Center(i,2*n,4,2), 3, 4);
  SetTestCount(5);
end;

procedure MpiB22;
var i,n,y: integer;
  a: array[1..5] of real;
  t,b: array[1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'A sequence of pairs ({T},~{A}) is given in the master process; the size'#13+
'of sequence is equal to the number of slave processes. An integer~{T} is equal'#13+
'to~0 or~1; if {T}~=~0 then {A} is an integer, otherwise {A} is a real number.'#13+
'Send one of the numbers~{A} to the corresponding slave process (the first'#13+
'number to the process~1, the second number to the process~2, and so~on) and'#13+
'output received numbers in the slave processes. Use the value of {T}'#13+
'as a msgtag parameter of the MPI\_Send function to send information about'#13+
'the type of number~{A}; use the MPI\_Probe function with the parameter'#13+
'MPI\_ANY\_TAG to receive this information. \P\SNote.\s To avoid the code'#13+
'duplication, use the auxiliary \Itemplate functions\i'#13+
'\Mtemplate <typename T> void send (int t, int dest, MPI\_Datatype d)\m'#13+
'to send data and \Mtemplate <typename T> void recv (MPI\_Datatype d)\m'#13+
'to receive data. Use a number equal to 0 or 1 for the t parameter'#13+
'and the rank of receiving process for the dest parameter.'
  );
(*
  TaskText('В главном процессе дан набор пар чисел ({T}, {A}); количество пар равно числу',0,1);
  TaskText('подчиненных процессов. Число~{T}~\= целое, равное~0 или~1. Число~{A}~\= целое, если',0,2);
  TaskText('{T}~=~0, и вещественное, если {T}~=~1. Переслать по одному числу~{A} в каждый из',0,3);
  TaskText('подчиненных процессов (первое число в процесс~1, второе~\= в процесс~2, и т.\,д.)',0,4);
  TaskText('и вывести полученные числа. Для передачи информации о типе пересланного числа',0,5);
  TaskText('указывать число~{T} в качестве параметра msgtag функции MPI\_Send, для получения',0,0);
  TaskText('этой информации использовать функцию MPI\_Probe с параметром MPI\_ANY\_TAG.',0,0);

  TaskText('\P\SУказание.\s Чтобы избежать дублирования кода, используйте вспомогательные',0,0);
  TaskText('\Iшаблонные функции\i \Mtemplate<typename T> void send(int t, int dest,\m',0,0);
  TaskText('\MMPI\_Datatype d)\m (для отправки данных) и \Mtemplate<typename T> void\m',0,0);
  TaskText('\Mrecv(MPI\_Datatype d)\m (для получения данных). В качестве параметра t',0,0);
  TaskText('указывайте число, равное 0 или 1, в качестве параметра dest \=',0,0);
  TaskText('ранг процесса-получателя.',0,0);
*)

  for i := 1 to 5 do
  begin
    a[i] := 89.98*Random+10;
    b[i] := Random(90)+10;
    t[i] := Random(2);
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  DataComment('Process 0:',xleft, y+1);
  SetProcess(0);
  for i := 1 to n - 1 do
  begin
    DataN('T = ',t[i], 32, y+i, 1);
    case t[i] of
    0: DataN('A = ', b[i], 39, y+i, 2);
    1: DataR('A = ', a[i], 39, y+i, 5);
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    case t[i] of
    0: ResultN('Process '+Chr(i+48)+': ', b[i], 32, y+i, 2);
    1: ResultR('Process '+Chr(i+48)+': ', a[i], 0, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiB23;
var i,n,y,j: integer;
  a: array[1..5,1..8] of real;
  b: array[1..5,1..8] of integer;
  t,k: array[1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'Two integers {T}, {N} and a sequence of {N} numbers are given in each slave'#13+
'process. An integer~{T} is equal to~0 or~1; if {T}~=~0 then the given'#13+
'sequence contains integers, otherwise it contains real numbers.'#13+
'Send all given sequences to the master process and output received numbers'#13+
'in the ascending order of ranks of sending processes. Use the value of {T}'#13+
'as a msgtag parameter of the MPI\_Send function to send information about'#13+
'the sequence type; use the MPI\_Probe function with the parameter MPI\_ANY\_TAG'#13+
'to receive this information. \P\SNote.\s To avoid the code duplication,'#13+
'use the auxiliary \Itemplate functions\i'#13+
'\Mtemplate <typename T> void send(int t, MPI\_Datatype d)\m to send data'#13+
'and \Mtemplate <typename T> void recv(MPI\_Datatype d, MPI\_Status s)\m'#13+
'to receive data. Use a number equal to 0 or 1 for the t parameter'#13+
'and the result returned by the MPI\_Probe function for the s parameter.'
  );
  (*
  TaskText('В каждом подчиненном процессе даны два целых числа~{T}, {N} и набор из~{N} чисел.',0,1);
  TaskText('Число~{T} равно~0 или~1. Набор содержит целые числа, если {T}~=~0, и вещественные',0,2);
  TaskText('числа, если {T}~=~1. Переслать исходные наборы в главный процесс и вывести',0,3);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,4);
  TaskText('Для передачи информации о типе пересланных чисел указывать число~{T}',0,5);
  TaskText('в качестве параметра msgtag функции MPI\_Send, для получения этой',0,0);
  TaskText('информации использовать функцию MPI\_Probe с параметром MPI\_ANY\_TAG.',0,0);

  TaskText('\P\SУказание.\s Чтобы избежать дублирования кода, используйте вспомогательные',0,0);
  TaskText('\Iшаблонные функции\i \Mtemplate<typename T> void send(int t, MPI\_Datatype d)\m',0,0);
  TaskText('(для отправки данных) и \Mtemplate<typename T> void recv(MPI\_Datatype d,\m',0,0);
  TaskText('\MMPI\_Status s)\m (для получения данных). В качестве параметра t',0,0);
  TaskText('указывайте число, равное 0 или 1, в качестве параметра s \=',0,0);
  TaskText('результат, возвращенный функцией MPI\_Probe.',0,0);
  *)

  for i := 1 to 5 do
  begin
    t[i] := Random(2);
    k[i] := Random(6)+2;
    for j := 1 to k[i] do
    begin
    a[i,j] := 89.98*Random+10;
    b[i,j] := Random(90)+10;
    end;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  ResultComment('Process 0:',11, y+1);
  SetProcess(0);
  for i := 1 to n - 1 do
  begin
    for j := 1 to k[i] do
    case t[i] of
    0: ResultN('', b[i,j], 25+4*j, y+i, 2);
    1: ResultR('', a[i,j], 22+7*j, y+i, 5);
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataN('Process '+Chr(i+48)+': T = ', t[i], 3, y+i, 1);
    DataN('N = ', k[i], 21, y+i, 1);
    for j := 1 to k[i] do
    case t[i] of
    0: DataN('', b[i,j], 25+4*j, y+i, 2);
    1: DataR('', a[i,j], 22+7*j, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiB24b;
var i,j,n,k,k0,x1,y1: integer;
    a: array[0..4,1..5] of integer;
    b: array[0..4,1..5] of real;

begin
  n := 2*RandomN(3, 5);
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'The number of processes {K} is an even number: {K}~=~2{N}. A sequence of {N} real'#13+
'numbers is given in each even-rank process (0, 2,~\., {K}\,\-\,2), a sequence'#13+
'of {N} integers is given in each odd-rank process (1, 3,~\., {K}\,\-\,1).'#13+
'Using the MPI\_Sendrecv\_replace function, рerform the cyclic shift of all'#13+
'real-valued sequences in the direction of increasing the ranks of processes'#13+
'and the cyclic shift of all integer sequences in the direction of decreasing'#13+
'the ranks of processes (that is, the real-valued sequences should'#13+
'be sent from the process 0 to the process 2, from the process 2'#13+
'to the process 4,~\., from the process {K}\,\-\,2 to the process 0'#13+
'and the integer sequences should be sent from the process {K}\,\-\,1'#13+
'to the process {K}\,\-\,3, from the process {K}\,\-\,3 to the process {K}\,\-\,5,~\.,'#13+
'from the process 1 to the process {K}\,\-\,1). Output received data in each'#13+
'process. To determine the rank of the receiving process, use the expression'#13+
'containing the % operator of taking the remainder after integer division.'#13+
'Use the MPI\_ANY\_SOURCE parameter as the rank of sending process.'#13+
'\P\SNote.\s To avoid the code duplication, use the auxiliary \Itemplate function\i'#13+
'\Mtemplate <typename T> void sendrecv(int rank, int size, MPI\_Datatype d,\m'#13+
'\Mint step)\m. The step parameter specifies a shift value, which should be'#13+
'equal to 2 for real-valued sequences and equal to \-2 for integer ones.'
);

(*
TaskText(
 'Количество процессов {K} является четным: {K}~=~2{N}. В процессах четного ранга'#13#10
+'(0, 2,~\., {K}\,\-\,2) дан набор из {N} вещественных чисел, в процессах нечетного'#13#10
+'ранга (1, 3,~\., {K}\,\-\,1) \= набор из {N} целых чисел. Используя функцию'#13#10
+'MPI\_Sendrecv\_replace, выполнить циклический сдвиг всех наборов вещественных'#13#10
+'чисел в направлении увеличения рангов процессов и циклический сдвиг всех'#13#10
+'наборов целых чисел в направлении уменьшения рангов (таким образом,'#13#10
+'вещественные наборы надо переслать из процесса 0 в процесс 2, из процесса 2 \='#13#10
+'в процесс 4,~\., из процесса {K}\,\-\,2 \= в процесс 0; целочисленные наборы надо'#13#10
+'переслать из процесса {K}\,\-\,1 в процесс {K}\,\-\,3, из процесса {K}\,\-\,3 в процесс {K}\,\-\,5,~\.,'#13#10
+'из процесса 1 в процесс {K}\,\-\,1). Вывести в каждом процессе полученные числа.'#13#10
+'Для определения рангов процессов-получателей использовать выражение,'#13#10
+'содержащее операцию % нахождения остатка от деления, в качестве ранга'#13#10
+'процесса-отправителя достаточно указывать константу MPI\_ANY\_SOURCE.'#13#10
+'\P\SУказание.\s Чтобы избежать дублирования кода, используйте вспомогательную'#13#10
+'\Iшаблонную функцию\i \Mtemplate<typename T> void sendrecv(int rank, int size,\m'#13#10
+'\MMPI\_Datatype d, int step)\m, где параметр step указывает величину сдвига,'#13#10
+'равную 2 для наборов вещественных чисел и \-2 для целочисленных наборов.'
);
*)

  k := n div 2;
  for i := 0 to k-1 do
    for j := 1 to k do
    begin
      a[i,j] := RandomN(10,99);
      b[i,j] := RandomR(1.0,9.9);
    end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataComment(prc(i), x1, y1);
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k do
    if Odd(i) then
    begin
      DataN(a[y1-1, j], x1, y1, 2);
      ResultN(a[(y1)mod k, j], x1, y1, 2);
      x1 := x1 + 3;
    end
    else
    begin
      DataR(b[y1-1, j], x1, y1, 4);
      ResultR(b[(y1+k-2)mod k, j], x1, y1, 4);
      x1 := x1 + 5;
    end;
  end;

  SetTestCount(5);
end;

procedure MpiB25b;
var i,j,n,k,k0,x0,x1,y1: integer;
    a: array[0..4,1..5] of integer;
    b: array[0..4,1..5] of real;

begin
  n := 2*RandomN(3, 5);
  CreateTask(Title2a, n);
  if n = 0 then exit;
  TaskText(
'The number of processes {K} is an even number: {K}~=~2{N}. A sequence'#13+
'of {R}\,+\,1 integers is given in the first half of the processes, where'#13+
'{R} is the process rank ({R}~=~0, 1,~\., {N}\,\-\,1). A sequence of 2{N}\,\-\,{R} real numbers'#13+
'is given in the second half of the processes, where {R} is the process rank'#13+
'({R}~=~{N}, {N}\,+\,1,~\., 2{N}\,\-\,1). Using the MPI\_Sendrecv function, send'#13+
'the given seguences from each half of the processes to the corresponding'#13+
'process of the other half (that is, the sequence from the process 0 should'#13+
'be sent to the process {N}, from the process 1 \= to the process {N}\,+\,1,'#13+
'from the process {N} \= to the process 0, from the process 2{N}\,\-\,1 \='#13+
'to the process {N}\,\-\,1, and so~on). Output received data in each process.'#13+
'\P\SNote.\s To avoid the code duplication, use the auxiliary \Itemplate function\i'#13+
'\Mtemplate <typename T1, typename T2> void sendrecv(MPI\_Datatype d1,\m'#13+
'\Mint cnt1, int rank2, MPI\_Datatype d2, int cnt2)\m, where the d1 and cnt1'#13+
'parameters define the properties of the process that calls the function'#13+
'(the type and the number of elements of sending sequence) and the parameters'#13+
'rank2, d2, cnt2 are the rank and the similar properties of the process'#13+
'involved in data exchange.'
);
//2020.10
  
(*
TaskText(
 'Количество процессов {K} является четным: {K}~=~2{N}. В первой половине процессов'#13#10
+'дан набор целых чисел размера {R}\,+\,1, где {R} \= ранг процесса ({R}~=~0, 1,~\., {N}\,\-\,1),'#13#10
+'во второй половине процессов дан набор вещественных чисел размера 2{N}-{R},'#13#10
+'где {R} \= ранг процесса ({R}~=~{N}, {N}\,+\,1,~\., 2{N}\,\-\,1). Используя функцию MPI\_Sendrecv,'#13#10
+'переслать исходные наборы из каждой половины процессов в соответствующий'#13#10
+'Process другой половины (в частности, набор из процесса 0 надо переслать'#13#10
+'в процесс {N}, из процесса 1 \= в процесс {N}\,+\,1, из процесса {N} \= в процесс 0,'#13#10
+'из процесса 2{N}\,\-\,1 \= в процесс {N}\,\-\,1). Вывести в каждом процессе полученные числа.'#13#10
+'\P\SУказание.\s Чтобы избежать дублирования кода, используйте вспомогательную'#13#10
+'\Iшаблонную функцию\i \Mtemplate<typename T1, typename T2> void\m'#13#10
+'\Msendrecv(MPI\_Datatype d1, int cnt1, int rank2, MPI\_Datatype d2, int cnt2)\m,'#13#10
+'где параметры d1 и cnt1 определяют характеристики процесса, вызвавшего функцию'#13#10
+'(тип элементов в наборе и их количество), а параметры rank2, d2, cnt2 \= ранг'#13#10
+'и аналогичные характеристики процесса, с которым выполняется обмен данными.'
);
*)
  k := n div 2;
  for i := 0 to k-1 do
    for j := 1 to k do
    begin
      a[i,j] := RandomN(10,99);
      b[i,j] := RandomR(1.0,9.9);
    end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    k0 := i+1;
    x0 := 3;
    if i >= k then
    begin
      x1 := 41;
      y1 := y1 - k;
      k0 := n-i;
      x0 := 5;
    end;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k0 do
    begin
      if i< k then
        DataN(a[y1-1, j], x1, y1, 2)
      else
        DataR(b[y1-1, j], x1, y1, 4);
      x1 := x1 + x0;
    end;  
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    k0 := k-i;
    x0 := 5;
    if i >= k then
    begin
      x1 := 41;
      y1 := y1 - k;
      k0 := i+1-k;
      x0 := 3;
    end;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k0 do
    begin
      if i< k then
        ResultR(b[y1-1, j], x1, y1, 4)
      else
        ResultN(a[y1-1, j], x1, y1, 2);
      x1 := x1 + x0;
    end;
  end;

  SetTestCount(5);
end;


procedure MpiB24a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of integer;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;

  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to 0 in all'#13+
'processes, except for one, and it is equal to 1 in some selected process.'#13+
'Also an integer sequence {A} of size {K}\,\-\,1 is given in the selected process,'#13+
'where {K} is the number of processes. Do not save the sequence {A} in array.'#13+
'Send one element of the sequence {A} at a time to other processes in ascending'#13+
'order of their ranks and output the received number in each process.'#13+
'Use the required number of the MPI\_Issend and MPI\_Wait function calls'#13+
'(sending a message in synchronous nonblocking mode) in the selected process'#13+
'and the MPI\_Recv function call in the other processes. Additionally,'#13+
'display the duration of each MPI\_Wait function call (in milliseconds)'#13+
'in the debug section. To do this, call the MPI\_Wtime function before'#13+
'and after the MPI\_Wait call and use the Show function to display'#13+
'the difference between returned values of the MPI\_Wtime function multiplied'#13+
'by 1000. Check how the debugging information changes if the MPI\_Isend'#13+
'function (sending a message in standard nonblocking mode) will be used'#13+
'instead of the MPI\_Issend function.'
);

(*
TaskText(
 'В каждом процессе дано целое число {N}; во всех процессах, кроме одного,'#13#10
+'значение {N} равно~0, в некотором выделенном процессе значение {N} равно~1.'#13#10
+'В выделенном процессе также дан набор целых чисел {A} размера {K}~\-~1,'#13#10
+'где {K} \= количество процессов. Не сохраняя набор {A} в массиве, переслать'#13#10
+'по одному элементу этого набора из выделенного процесса во все остальные'#13#10
+'процессы, перебирая их в порядке возрастания рангов, и вывести в каждом'#13#10
+'процессе полученное число. Для пересылки данных использовать требуемое'#13#10
+'количество вызовов функций MPI\_Issend (посылка сообщения в синхронном'#13#10
+'неблокирующем режиме) и MPI\_Wait в выделенном процессе и функцию MPI\_Recv'#13#10
+'в остальных процессах. Дополнительно отобразить в разделе отладки'#13#10
+'продолжительность  каждого вызова функции MPI\_Wait в миллисекундах;'#13#10
+'для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait и с помощью функции'#13#10
+'Show вывести разность возвращенных функцией MPI\_Wtime значений, умноженную'#13#10
+'на 1000. Проверить, как изменится отладочная информация, если вместо'#13#10
+'функции MPI\_Issend использовать функцию MPI\_Isend (посылка сообщения'#13#10
+'в стандартном неблокирующем режиме).'
);
*)
  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomN(10,99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := 1
    else
      k0 := 0;
    DataN(prc(i)+ 'N=', k0, x1, y1, 1);
    if i = k then
    begin
    x1 := x1 + 15;
    DataComment('A: ', x1, y1);
    for j := 1 to n-1 do
    begin
      x1 := x1+3;
      DataN(a[j], x1, y1, 2);
    end;
    end
    else
    begin
      j := i+1;
      if i > k then
        j := j-1;
      ResultN(prc(i)+'A=', a[j], x1, y1, 2);
    end;
  end;
  s[1] := '1.89';
  s[2] := '0.00';
  s[3] := '0.01';
  s[4] := '0.30';
  s[5] := '0.19';
  s[6] := '0.28';
  s[7] := '0.02';
  DataComment(DebugSec, 1, (n-1) div 2 +2);
  DataComment(' '+IntToStr(k)+'|  1>  '+s[1], 1, (n-1) div 2 +3);
  for i := 2 to n-1 do
    DataComment(s[i], 5+i*5, (n-1) div 2 +3);

  SetTestCount(5);
end;

procedure MpiB25a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of real;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to \-1 in some'#13+
'selected process of the rank {R} and it is equal to {R} in the other processes.'#13+
'A real number {A} is also given in all processes, except for the selected one.'#13+
'Send the numbers {A} to the selected process and output received numbers'#13+
'in ascending order of ranks of sending processes. Use the required number'#13+
'of the MPI\_Recv function calls in the selected process and the MPI\_Issend'#13+
'and MPI\_Test function call in the other processes. Repeat the MPI\_Test'#13+
'function call until it returns a nonzero flag, and display the required'#13+
'number of iterations of the loop in the debug section using the Show'#13+
'function. Check how the debugging information changes if the MPI\_Isend'#13+
'function will be used instead of the MPI\_Issend function.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; в некотором выделенном процессе'#13#10
+'значение {N} равно \-1, а в остальных процессах {N} является одинаковым и равно'#13#10
+'рангу {R} выделенного процесса. Во всех процессах, кроме выделенного, также дано'#13#10
+'вещественное число {A}. Переслать данные числа {A} в выделенный процесс и вывести'#13#10
+'их в порядке возрастания рангов процессов-отправителей. Для пересылки данных'#13#10
+'использовать требуемое количество вызовов функции MPI\_Recv в выделенном'#13#10
+'процессе и функции MPI\_Issend и MPI\_Test в остальных процессах. Вызов функции'#13#10
+'MPI\_Test повторять в цикле до тех пор, пока она не вернет ненулевой флаг,'#13#10
+'и отобразить в разделе отладки потребовавшееся количество итераций этого'#13#10
+'цикла, используя функцию Show. Проверить, как изменится отладочная информация,'#13#10
+'если вместо функции MPI\_Issend использовать функцию MPI\_Isend.'
);
*)
  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomR(1.0,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
      if i > k then
        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
    end
    else
    begin
    ResultComment(prc(i)+'A: ', 1, 1);
    x1 := 10;
    for j := 1 to n-1 do
    begin
      x1 := x1+5;
      ResultR(a[j], x1, 1, 4);
    end;
    end;
  end;
  s[1] := '30379';
  s[2] := '99750';
  s[3] := '32805';
  s[4] := '63904';
  s[5] := '32022';
  s[6] := '98283';
  s[7] := '35860';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to n-1 do
  begin
      j := i-1;
      if i > k then
        j := j+1;
    DataComment(' '+IntToStr(j)+'|  1>  '+s[i], 1, (n-1) div 2 + 2 + i);
  end;

  SetTestCount(5);
end;

procedure MpiB26a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of real;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to \-1 in some'#13+
'selected process of the rank {R} and it is equal to {R} in the other processes.'#13+
'A real number {A} is also given in all processes, except for the selected one.'#13+
'Send the numbers {A} to the selected process and output received numbers'#13+
'in descending order of ranks of sending processes. Use the required number'#13+
'of the MPI\_Irecv and MPI\_Test function calls (receiving a message'#13+
'in nonblocking mode) in the selected process and the MPI\_Ssend function call'#13+
'in the other processes. Repeat the MPI\_Test function call after each MPI\_Irecv'#13+
'function call until MPI\_Test returns a nonzero flag, and display the required'#13+
'number of iterations of the loop in the debug section using the Show function.'#13+
'Check how the debugging information changes if the MPI\_Send function'#13+
'will be used instead of the MPI\_Ssend function.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; в некотором выделенном процессе'#13#10
+'значение {N} равно \-1, а в остальных процессах {N} является одинаковым и равно'#13#10
+'рангу {R} выделенного процесса. Во всех процессах, кроме выделенного, также дано'#13#10
+'вещественное число {A}. Переслать данные числа {A} в выделенный процесс и вывести'#13#10
+'их в порядке убывания рангов процессов-отправителей. Для пересылки данных'#13#10
+'использовать требуемое количество вызовов функций MPI\_Irecv (прием сообщения'#13#10
+'в неблокирующем режиме) и MPI\_Test в выделенном процессе и функцию MPI\_Ssend'#13#10
+'в остальных процессах. После каждого вызова функции MPI\_Irecv организовать'#13#10
+'цикл, в котором вызывать функцию MPI\_Test, пока она не вернет ненулевой флаг,'#13#10
+'и отображать в разделе отладки потребовавшееся количество итераций этого'#13#10
+'цикла, используя функцию Show. Проверить, как изменится отладочная информация,'#13#10
+'если вместо функции MPI\_Ssend использовать функцию MPI\_Send.'
);
*)
  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomR(1.0,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
      if i > k then
        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
    end
    else
    begin
    ResultComment(prc(i)+'A: ', 1, 1);
    x1 := 10;
    for j := n-1 downto 1 do
    begin
      x1 := x1+5;
      ResultR(a[j], x1, 1, 4);
    end;
    end;
  end;
  s[1] := '3319';
  s[2] := '1';
  s[3] := '1';
  s[4] := '1';
  s[5] := '1';
  s[6] := '1';
  s[7] := '1';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  DataComment(' '+IntToStr(k)+'|  1>  '+s[1], 1, (n-1) div 2 + 3);
  for i := 2 to n-1 do
    DataComment(s[i], 11+i*2, (n-1) div 2 + 3);


{  ResultComment('Пример данных, выведенных в разделе отладки:', 1, (n+1) div 2 +1);
  for i := 1 to n-1 do
  begin
      j := i-1;
      if i > k then
        j := j+1;
    ResultComment(' '+IntToStr(j)+'|  1>  '+s[i], 1, (n+1) div 2 +1+i);
  end;}

  SetTestCount(5);
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure MpiB27a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of integer;
    sum: real;
    a: array[1..10] of real;
    s0: string;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to \-1 in some'#13+
'selected process of the rank {R} and it is equal to {R} in the other processes.'#13+
'A real number {A} is also given in all processes, except for the selected one.'#13+
'Send the numbers {A} to the selected process and output the sum {S} of received'#13+
'numbers. Use the required number of the MPI\_Irecv and MPI\_Waitany function'#13+
'calls in the selected process and the MPI\_Ssend function call in the other'#13+
'processes. Declare an array {Q} of the MPI\_Request type in the selected process'#13+
'and call the MPI\_Irecv functions in a loop with the a separate element of {Q}'#13+
'for each function call. Then call the MPI\_Waitany function in a second loop'#13+
'to accumulate the sum {S}. Additionally, display the following data in the debug'#13+
'section in each iteration of the second loop (using the Show and ShowLine'#13+
'function call): the value of {A} added to the sum at this iteration,'#13+
'and the rank of the process that sent this value.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; в некотором выделенном процессе'#13#10
+'значение {N} равно \-1, а в остальных процессах {N} является одинаковым и равно'#13#10
+'рангу {R} выделенного процесса. Во всех процессах, кроме выделенного, также дано'#13#10
+'вещественное число {A}. Переслать данные числа {A} в выделенный процесс и вывести'#13#10
+'их сумму {S}. Для пересылки данных использовать требуемое количество вызовов'#13#10
+'функций MPI\_Irecv и MPI\_Waitany в выделенном процессе и функцию MPI\_Ssend'#13#10
+'в остальных процессах. В выделенном процессе описать массив {Q} типа MPI\_Request'#13#10
+'и организовать вызов функций MPI\_Irecv в отдельном цикле, указывая для каждого'#13#10
+'вызова свой элемент массива {Q}. После выхода из этого цикла организовать второй'#13#10
+'цикл, в котором вызывать функцию MPI\_Waitany и накапливать сумму {S}.'#13#10
+'Дополнительно на каждой итерации второго цикла отображать в разделе отладки'#13#10
+'следующие данные (используя по одному вызову функций Show и ShowLine):'#13#10
+'значение {A}, добавленное к сумме на данной итерации цикла,'#13#10
+'и ранг процесса, переславшего это значение.'
);
*)
  k := RandomN(0,n-1);
  sum := 0;
  for i := 1 to n do
  begin
    a[i] := RandomR(1.0,9.9);
  end;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
//      if i > k then
//        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
      sum := sum + a[j];
    end;
  end;
    SetProcess(k);
    ResultR(prc(k)+'Sum=', sum, 1, 1, 5);
    for i := 1 to n do
      s[i] := i-1;
    for i := 1 to 2 * n do
      SwapN(s[RandomN(1, n)], s[RandomN(1, n)]);

  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  k0 := 0;
  for i := 1 to n do
  begin
      j := s[i];
      if j = k then continue;
      k0 := k0 + 1;
      Str(a[j+1]:0:2,s0);
    DataComment(' '+IntToStr(k)+'|  '+IntToStr(k0)+'>  '+s0 + ' '+IntToStr(j), 1, (n-1) div 2 + 2+i);
  end;

  SetTestCount(5);
end;

procedure MpiB28a;
var i,j,n,k1, k2,k0,x1,y1: integer;
    s: array [1..10] of integer;
    sum: real;
    a: array[1..10] of integer;
    s0: string;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to 0 in all'#13+
'processes, except for two, and it is equal to 1 in the first selected'#13+
'process (\Ithe sender\i) and it is equal to 2 in the second selected process'#13+
'(\Ithe receiver\i). Also an integer {R} and a sequence of {K} integers are given'#13+
'in the sender, where {R} is the rank of the receiver and {K} is the number'#13+
'of processes. Do not save the sequence {A} in array. Send all elements'#13+
'of the sequence {A} to the receiver and output the received numbers in the same'#13+
'order. Use the single call of the MPI\_Ssend\_init function and the required'#13+
'number of the MPI\_Start and MPI\_Wait function calls in the sender,'#13+
'and the single call of the MPI\_Recv\_init function and the required number'#13+
'of the MPI\_Start and MPI\_Wait function calls in the receiver. Additionally,'#13+
'display the duration of each MPI\_Wait function call (in milliseconds)'#13+
'in the debug section (for both the sender and the receiver). To do this,'#13+
'call the MPI\_Wtime function before and after the MPI\_Wait call and use'#13+
'the Show function to display the difference between returned values'#13+
'of the MPI\_Wtime function multiplied by 1000. Check how the debugging'#13+
'information changes if the MPI\_Send\_init function will be used'#13+
'instead of the MPI\_Ssend\_init function.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; во всех процессах, за исключением двух,'#13#10
+'значение {N} равно~0; в одном из оставшихся процессов (\Iпроцессе-отправителе\i)'#13#10
+'значение {N} равно~1, в другом (\Iпроцессе-получателе\i) значение {N} равно~2.'#13#10
+'В процессе-отправителе также дано целое число {R} \= ранг процесса получателя'#13#10
+'и набор {A} целых чисел размера {K}, где {K} \= количество процессов. Не сохраняя'#13#10
+'набор {A} в массиве, переслать все его элементы процессу-получателю и вывести их'#13#10
+'в том же порядке. Для пересылки данных использовать единственный вызов функции'#13#10
+'MPI\_Ssend\_init и требуемое количество вызовов функций MPI\_Start и MPI\_Wait'#13#10
+'в процессе-отправителе и единственный вызов функции MPI\_Recv\_init и требуемое'#13#10
+'количество вызовов функций MPI\_Start и MPI\_Wait в процессе-получателе.'#13#10
+'Дополнительно отобразить в разделе отладки продолжительность каждого вызова'#13#10
+'функции MPI\_Wait в миллисекундах (как для процесса-отправителя, так и для'#13#10
+'процесса-получателя); для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait'#13#10
+'и с помощью функции Show вывести разность возвращенных функцией MPI\_Wtime'#13#10
+'значений, умноженную на 1000. Проверить, как изменится отладочная информация,'#13#10
+'если вместо функции MPI\_Ssend\_init использовать функцию MPI\_Send\_init.'
);
*)
  k1 := RandomN(0,n-1);
  k2 := RandomN(0,n-1);
  while k2 = k1 do
    k2 := RandomN(0,n-1);

  for i := 1 to n do
  begin
    a[i] := RandomN(1,9);
  end;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k1 then
      k0 := 1
    else
    if i = k2 then
      k0 := 2
    else
      k0 := 0;
    DataN(prc(i)+ 'N=', k0, x1, y1, 1);
    if i = k1 then
    begin
      x1 := x1 + 15;
      DataN('R=', k2, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('A: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to n do
      begin
        x1 := x1 + 2;
        DataN(a[j], x1, y1, 1);
      end;
    end;
  end;
    SetProcess(k2);
    ResultComment(prc(k2)+'A: ', 1, 1);
    x1 := 13;
    for j := 1 to n do
    begin
      x1 := x1 + 2;
      ResultN(a[j], x1, 1, 1);
    end;

  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  DataComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, (n-1) div 2 + 3);
  DataComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, (n-1) div 2 + 4);
  SetTestCount(5);
end;

procedure MpiB29a;
var i,j,n,k1,k2,j0,k0,x1,y1: integer;
    k: array [1..10] of integer;
    sum: real;
    a: array[1..10,1..10] of integer;
    s,c: array[1..10] of integer;
    s0: array [1..10] of string;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to 2'#13+
'in the first selected process (\Ithe receiver\i), it is equal to 1 in some other'#13+
'selected processes (\Ithe senders\i), it is equal to 0 in all other processes.'#13+
'Also an integer {R} and a sequence {A} of {K} integers are given in each sender,'#13+
'where {R} is the rank of the receiver and {K} is the number of processes,'#13+
'and the number of senders {C} is given in the receiver. Send all sequences {A}'#13+
'to the receiver and output the sums {S} of elements of all sequences {A} with'#13+
'the same indices (in ascending order of indices). Use the single call'#13+
'of the MPI\_Ssend function in each sender. Declare an array {Q}'#13+
'of the MPI\_Request type in the receiver and call the MPI\_Recv\_init functions'#13+
'in a loop with a separate element of {Q} for each function call. Then call'#13+
'the MPI\_Startall function in the receiver and, after that, call'#13+
'the MPI\_Waitany function in a second loop to accumulate the sums {S}.'#13+
'Additionally, display the following data in the debug section'#13+
'in each iteration of the second loop (using two Show function and'#13+
'one ShowLine function calls): the duration of each MPI\_Waitany function call'#13+
'(in milliseconds), the returned value of the third parameter (named index)'#13+
'of the MPI\_Waitany function, and the rank of current sender that corresponds'#13+
'to the index parameter. To find the duration, call the MPI\_Wtime function'#13+
'before and after the MPI\_Waitany call and calculate the difference between'#13+
'returned values of the MPI\_Wtime function multiplied by 1000. To find'#13+
'the rank of the current sender, use the value of the last parameter'#13+
'(of the MPI\_Status type) returned by the MPI\_Waitany function.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; в одном из процессов'#13#10
+'(\Iпроцессе-получателе\i) значение {N} равно~2, в некоторых процессах'#13#10
+'(\Iпроцессах-отправителях\i) значение {N} равно~1, в остальных процессах'#13#10
+'значение {N} равно~0. В каждом из процессов-отправителей также дано целое'#13#10
+'число {R} \= ранг процесса-получателя и набор {A} целых чисел размера {K},'#13#10
+'где {K} \= количество процессов. В процессе-получателе дано целое число {C} \='#13#10
+'количество процессов-отправителей. Переслать все наборы {A} процессу-получателю'#13#10
+'и вывести набор {S} суммарных значений элементов всех наборов {A} с одинаковыми'#13#10
+'индексами (в порядке возрастания индексов). Для пересылки данных использовать'#13#10
+'единственный вызов функции MPI\_Ssend в процессах-отправителях.'#13#10
+'В процессе-получателе описать массив {Q} типа MPI\_Request и организовать вызов'#13#10
+'функций MPI\_Recv\_init в отдельном цикле, указывая для каждого вызова свой'#13#10
+'элемент массива {Q}. После выхода из этого цикла выполнить единственный вызов'#13#10
+'функции MPI\_Startall и организовать второй цикл, в котором вызывать функцию'#13#10
+'MPI\_Waitany и накапливать суммарные значения в массиве {S}. Дополнительно'#13#10
+'на каждой итерации второго цикла отображать в разделе отладки следующие данные'#13#10
+'(используя два вызова функции Show и один вызов ShowLine): продолжительность'#13#10
+'каждого вызова функции MPI\_Waitany в миллисекундах, значение третьего'#13#10
+'параметра index, возвращенное функцией MPI\_Waitany, и ранг'#13#10
+'процесса-отправителя, соответствующий параметру index. Для нахождения'#13#10
+'продолжительности вызвать функцию MPI\_Wtime до и после MPI\_Waitany и вычислить'#13#10
+'разность возвращенных функцией MPI\_Wtime значений, умножив ее на 1000.'#13#10
+'Для нахождения ранга процесса-отправителя проанализировать значение последнего'#13#10
+'параметра (типа MPI\_Status), возвращенного функцией MPI\_Waitany.'
);
*)
  k0 := RandomN(2, n-2);
  for i := 1 to n do
    s[i] := 0;
  for i := 1 to k0 do
  begin
    k[i] := 1;
    for j := 1 to n do
    begin
      a[i, j] := RandomN(1, 9);
      s[j] := s[j] + a[i,j];
    end;
  end;
  k[k0+1] := 2;
  for i := k0+2 to n do
    k[i] := 0;
  for i := 1 to 2 * n do
    SwapN(k[RandomN(1, n)], k[RandomN(1, n)]);
  j := 0;
  for i := 1 to n do
  begin
    if k[i] = 2 then
      k2 := i-1;
    if k[i] = 1 then
    begin
      j := j + 1;
      c[j] := i-1;
    end;
  end;
  for i := 1 to 2 * n do
    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);
  j0 := 0;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataN(prc(i)+ 'N=', k[i+1], x1, y1, 1);
    if k[i+1] = 1 then
    begin
      j0 := j0 + 1;
      x1 := x1 + 15;
      DataN('R=', k2, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('A: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to n do
      begin
        x1 := x1 + 2;
        DataN(a[j0,j], x1, y1, 1);
      end;
    end
    else
    if k[i+1] = 2 then
    begin
      x1 := x1 + 15;
      DataN('C=', k0, x1, y1, 1);
    end;
  end;
    SetProcess(k2);
    ResultComment(prc(k2)+'A: ', 1, 1);
    x1 := 12;
    for j := 1 to n do
    begin
      x1 := x1 + 3;
      ResultN(s[j], x1, 1, 2);
    end;
  s0[1] := '1>  3.02 0 ';
  s0[2] := '2>  0.01 1 ';
  s0[3] := '3>  0.69 2 ';
  s0[4] := '4>  0.95 3 ';
  s0[5] := '5>  1.12 4 ';
  s0[6] := '6>  0.14 5 ';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to k0 do
    DataComment(' '+IntToStr(k2)+'|  '+s0[i]+IntToStr(c[i]), 1, (n-1) div 2 + 2+i);
{
   3|  1>  1.76 0 5
 3|  2>  2.30 1 4


  1|  1>  0.94 0 4
 1|  2>  1.53 1 0
 1|  3>  0.00 2 3


 1|  2>  0.01 1 6
 1|  3>  0.00 2 2

 2|  s[1] := '1>  3.02 0' 3
 2|  2>  0.01 1 6
 2|  3>  0.69 2 4
 2|  4>  0.95 3 0
 1|  5>  1.12 3 3
 1|  1>  0.14 0 5
}

//  ResultComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
//    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, 3);
//  ResultComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
//    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, 4);
  SetTestCount(5);
end;

procedure MpiB30a;
var i,j,n,k1,k2,j0,k0,x1,y1: integer;
    k: array [1..10] of integer;
    d: real;
    a: array[1..10,1..10] of integer;
    s,c: array[1..10] of integer;
    s0: array [1..10] of string;

begin
  n := RandomN(5, 8);
  CreateTask(Title2b, n);
  if n = 0 then exit;
  TaskText(
'An integer {N} is given in each process. The value of {N} is equal to 1'#13+
'in the first selected process (\Ithe sender\i), it is equal to 2 in some other'#13+
'selected processes (\Ithe receivers\i), it is equal to 0 in all other processes.'#13+
'Also a real number {A}, an integer {C}, and a sequence {R} of {C} integers are given'#13+
'in the sender, where {C} is the number of receivers and {R} contains ranks'#13+
'of all receivers. Send the number {A} to all receivers and output it in each'#13+
'receiver. Use the single call of the MPI\_Recv function in each receiver.'#13+
'Declare an array {Q} of the MPI\_Request type in the sender and call'#13+
'the MPI\_Ssend\_init functions in a loop with a separate element of {Q} for each'#13+
'function call. Then call the MPI\_Startall function in the sender and,'#13+
'after that, call the MPI\_Testany function in a second loop (the MPI\_Testany'#13+
'function should be called in a nested loop until it returns a nonzero flag).'#13+
'Additionally, display the following data in the debug section in each'#13+
'iteration of the second loop (using the Show and ShowLine function call):'#13+
'the returned value of the third parameter (named index) of the MPI\_Testany'#13+
'function (when it returns a nonzero flag), and the number of MPI\_Testany'#13+
'function calls (that is, the number of iterations of the nested loop).'#13+
'Check how the debugging information changes if the MPI\_Send\_init function'#13+
'will be used instead of the MPI\_Ssend\_init function.'
);
(*
TaskText(
 'В каждом процессе дано целое число {N}; в одном из процессов'#13#10
+'(\Iпроцессе-отправителе\i) значение {N} равно~1, в некоторых процессах'#13#10
+'(\Iпроцессах-получателях\i) значение {N} равно~2, в остальных процессах'#13#10
+'значение {N} равно~0. В процессе-отправителе также дано вещественное число {A},'#13#10
+'целое число {C} \= количество процессов-получателей и набор целых чисел {R}'#13#10
+'размера {C}, содержащий ранги процессов-получателей. Переслать число {A} всем'#13#10
+'процессам-получателям и вывести его в каждом из этих процессов. Для пересылки'#13#10
+'данных использовать функцию MPI\_Recv в процессах-получателях.'#13#10
+'В процессе-отправителе описать массив {Q} типа MPI\_Request и организовать вызов'#13#10
+'функций MPI\_Ssend\_init в отдельном цикле, указывая для каждого вызова свой'#13#10
+'элемент массива {Q}. После выхода из этого цикла выполнить единственный вызов'#13#10
+'функции MPI\_Startall и организовать второй цикл, в котором вызывать функцию'#13#10
+'MPI\_Testany во вложенном цикле, пока она не вернет ненулевой флаг.'#13#10
+'Дополнительно на каждой итерации второго цикла отображать в разделе отладки'#13#10
+'следующие данные (используя по одному вызову функций Show и ShowLine):'#13#10
+'значение третьего параметра index, возвращенное функцией MPI\_Testany'#13#10
+'(в ситуации, когда она вернула ненулевой флаг), и количество произведенных'#13#10
+'вызовов функции MPI\_Testany (т.\,е. количество итераций вложенного цикла).'#13#10
+'Проверить, как изменится отладочная информация, если вместо'#13#10
+'функции MPI\_Ssend\_init использовать функцию MPI\_Send\_init.'
);
*)
  k0 := RandomN(2, n-2);
  if k0 = 6 then
    k0 := 5;
  for i := 1 to n do
    s[i] := 0;
  for i := 1 to k0 do
  begin
    k[i] := 2;
    for j := 1 to n do
    begin
      a[i, j] := RandomN(1, 9);
      s[j] := s[j] + a[i,j];
    end;
  end;
  k[k0+1] := 1;
  for i := k0+2 to n do
    k[i] := 0;
  for i := 1 to 2 * n do
    SwapN(k[RandomN(1, n)], k[RandomN(1, n)]);
  j := 0;
  for i := 1 to n do
  begin
    if k[i] = 1 then
      k2 := i-1;
    if k[i] = 2 then
    begin
      j := j + 1;
      c[j] := i-1;
    end;
  end;
//  for i := 1 to 2 * n do
//    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);
  d := RandomR(1, 9.9);
  j0 := 0;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataN(prc(i)+ 'N=', k[i+1], x1, y1, 1);
    if k[i+1] = 1 then
    begin
      j0 := j0 + 1;
      x1 := x1 + 15;
      DataR('A=', d, x1, y1, 4);
      x1 := x1 + 7;
      DataN('C=', k0, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('R: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to k0 do
      begin
        x1 := x1 + 2;
        DataN(c[j], x1, y1, 1);
      end;
    end
{    else
    if k[i+1] = 2 then
    begin
      x1 := x1 + 15;
      DataN('A=', d, x1, y1, 4);
    end;}
  end;
  for i := 0 to k0-1 do
  begin
    SetProcess(c[i+1]);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    ResultR(prc(c[i+1])+ 'A=', d, x1, y1, 4);
  end;

  for i := 1 to n do
    c[i] := i - 1;

  for i := 1 to 2 * n do
    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);

  s0[1] := ' 3';
  s0[2] := ' 36994';
  s0[3] := ' 2339';
  s0[4] := ' 2';
  s0[5] := ' 34889';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to k0 do
    DataComment(' '+IntToStr(k2)+'|  '+IntToStr(i) + '>  ' +IntToStr(c[i])+s0[i], 1, (n-1) div 2 + 2 + i);
{

 4|  2>  2 3
 4|  3>  1 36994
 6|  1>  0 2339
 6|  2>  2 2
 6|  3>  1 34889



   3|  1>  1.76 0 5
 3|  2>  2.30 1 4


  1|  1>  0.94 0 4
 1|  2>  1.53 1 0
 1|  3>  0.00 2 3


 1|  2>  0.01 1 6
 1|  3>  0.00 2 2

 2|  s[1] := '1>  3.02 0' 3
 2|  2>  0.01 1 6
 2|  3>  0.69 2 4
 2|  4>  0.95 3 0
 1|  5>  1.12 3 3
 1|  1>  0.14 0 5
}

//  ResultComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
//    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, 3);
//  ResultComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
//    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, 4);
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
  6: MpiA9;}
  1: MpiB1;
  2: MpiB2;
  3: MpiB3;
 4: MpiB4;
 5: MpiB5;
 6: MpiB6;
 7: MpiB7;
 8: MpiB8;
 9: MpiB9;
 10: MpiB10;
 11: MpiB11;
 12: MpiB12;
 13: MpiB13;
 14: MpiB14;
 15: MpiB15;
 16: MpiB16;
 17: MpiB17;
 18: MpiB18;
 19: MpiB19;
 20: MpiB20;
 21: MpiB21;
 22: MpiB22;
 23: MpiB23;
 24: MpiB24b;
 25: MpiB25b;
 26: MpiB24a;
 27: MpiB25a;
 28: MpiB26a;
 29: MpiB27a;
 30: MpiB28a;
 31: MpiB29a;
 32: MpiB30a;

  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI2Send', 'Point-to-point communication', 'M. E. Abramyan, 2014,2017',
  'sddfgfsjnbvvdfsd78fgfgd', 32, InitTask);
//  CommentText('Если количество процессов в задании не определено, то можно считать, что это количество не превосходит~12.');
//  CommentText('Под \Iглавным процессом\i всюду в формулировках заданий понимается');
//  CommentText('Process ранга~0 для коммуникатора MPI\_COMM\_WORLD. Для всех процессов ненулевого ранга в заданиях используется');
//  CommentText('общее наименование \Iподчиненных процессов\i.');
//  CommentText('\PЕсли в задании не указан тип обрабатываемых чисел, то числа считаются вещественными.');
//  CommentText('Если в задании не определяется максимальный размер набора чисел, то его следует считать равным~10.');
end;

exports inittaskgroup;

begin
end.
