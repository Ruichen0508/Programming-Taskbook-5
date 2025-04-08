{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI5Comm_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const topic1 = 'Creation of new communicators';
      topic2 = 'Virtual topologies';
      topic3 = 'The distributed graph topology (MPI-2)';

procedure Swap(var a, b: integer);
var v: integer;
begin
  v := a;
  a := b;
  b := v;
end;

procedure MpiG1;
var i,n,n1,k,y,j: integer;
  a: array[1..5] of integer;
begin
  n := Random(6)+5;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~integers is given in then master process; {K} is the number'#13+
'of processes whose rank is an even number (0, 2,~\.). Create'#13+
'a new communicator that contains all even-rank processes using'#13+
'the MPI\_Comm\_group, MPI\_Group\_incl, and MPI\_Comm\_create functions. Send'#13+
'one given integer to each even-rank process (including the master process)'#13+
'using one collective operation with the created communicator.'#13+
'Output received integer in each even-rank process.'
  );
(*
  TaskText('В главном процессе дан набор из {K}~целых чисел, где {K}~\= количество процессов',0,1);
  TaskText('четного ранга (0,~2,~\.). С помощью функций MPI\_Comm\_group, MPI\_Group\_incl',0,2);
  TaskText('и MPI\_Comm\_create создать новый коммуникатор, включающий процессы четного',0,3);
  TaskText('ранга. Используя одну коллективную операцию пересылки данных для созданного',0,4);
  TaskText('коммуникатора, переслать по одному исходному числу в каждый процесс четного',0,5);
  TaskText('ранга (включая главный) и вывести полученные числа.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'Two real numbers are given in each process whose rank is an odd number'#13+
'(1, 3,~\.). Create a new communicator that contains all odd-rank processes'#13+
'using the MPI\_Comm\_group, MPI\_Group\_excl, and MPI\_Comm\_create functions.'#13+
'Send all given numbers to each odd-rank process using one collective operation'#13+
'with the created communicator. Output received numbers in each odd-rank'#13+
'process in ascending order of ranks of sending processes'#13+
'(including numbers received from itself).'#13+
  ''
  );
(*
  TaskText('В каждом процессе нечетного ранга (1,~3,~\.) даны два вещественных числа.',0,1);
  TaskText('С помощью функций MPI\_Comm\_group, MPI\_Group\_excl и MPI\_Comm\_create создать',0,2);
  TaskText('новый коммуникатор, включающий процессы нечетного ранга. Используя одну',0,3);
  TaskText('коллективную операцию пересылки данных для созданного коммуникатора, переслать',0,4);
  TaskText('исходные числа во все процессы нечетного ранга и вывести эти числа в порядке',0,5);
  TaskText('возрастания рангов переславших их процессов (включая числа,',0,0);
  TaskText('полученные из этого же процесса).',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'Three integers are given in each process whose rank is a multiple of 3'#13+
'(including the master process). Using the MPI\_Comm\_split function,'#13+
'create a new communicator that contains all processes with ranks that are'#13+
'a multiple of 3. Send all given numbers to master process using one collective'#13+
'operation with the created communicator. Output received integers'#13+
'in the master process in ascending order of ranks of sending processes'#13+
'(including integers received from the master process).'#13+
'\P\SNote.\s When calling the MPI\_Comm\_split function in processes that'#13+
'are not required to include in the new communicator, one should specify'#13+
'the constant MPI\_UNDEFINED as the color parameter.'
  );
(*
  TaskText('В каждом процессе, ранг которого делится на~3 (включая главный процесс), даны',0,1);
  TaskText('три целых числа. С помощью функции MPI\_Comm\_split создать новый коммуникатор,',0,2);
  TaskText('включающий процессы, ранг которых делится на 3. Используя одну коллективную',0,3);
  TaskText('операцию пересылки данных для созданного коммуникатора, переслать исходные',0,4);
  TaskText('числа в главный процесс и вывести эти числа в порядке возрастания рангов',0,5);
  TaskText('переславших их процессов (включая числа, полученные из главного процесса).',0,0);
  TaskText('\P\SУказание.\s При вызове функции MPI\_Comm\_split в процессах, которые не требуется',0,0);
  TaskText('включать в новый коммуникатор, в качестве параметра color следует указывать',0,0);
  TaskText('константу MPI\_UNDEFINED.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 3 real numbers is given in each process whose rank is'#13+
'an even number (including the master process). Find the minimal value'#13+
'among the elements of the given sequences with the same order number using'#13+
'a new communicator and one global reduction operation.'#13+
'Output received minimums in the master process.'#13+
'\P\SNote.\s See the note to \1.'
  );
(*
  TaskText('В каждом процессе четного ранга (включая главный процесс) дан набор',0,1);
  TaskText('из трех элементов~\= вещественных чисел. Используя новый коммуникатор',0,2);
  TaskText('и одну коллективную операцию редукции, найти минимальные значения среди',0,3);
  TaskText('элементов исходных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести найденные минимумы в главном процессе. Новый коммуникатор',0,5);
  TaskText('создать с помощью функции MPI\_Comm\_split.',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \1.',0,0);
*)
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
    ResultComment(' Process 0:',0,2); //2020.10
    for j := 1 to 3 do
      ResultR('', min[j], Center(j,3,5,1), 3, 5);
  SetTestCount(5);
end;

procedure MpiG5;
var i,n,y: integer;
    r,min,max: real;
begin
  n := Random(6)+5;
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Using the MPI\_Comm\_split function'#13+
'and one global reduction operation, find the maximal value among the numbers'#13+
'given in the even-rank processes (including the master process) and'#13+
'the minimal value among the numbers given in the odd-rank processes. Output'#13+
'the maximal value in the process~0 and the minimal value in the process~1.'#13+
'\P\SNote.\s The program should contain a single MPI\_Comm\_split call, which'#13+
'creates the both required communicators (each for the corresponding'#13+
'group of processes).'
);
(*
  TaskText('В каждом процессе дано вещественное число. Используя функцию MPI\_Comm\_split',0,1);
  TaskText('и одну коллективную операцию редукции, найти максимальное из чисел, данных',0,2);
  TaskText('в процессах с четным рангом (включая главный процесс), и минимальное',0,3);
  TaskText('из чисел, данных в процессах с нечетным рангом. Найденный максимум',0,4);
  TaskText('вывести в процессе~0, а найденный минимум~\= в процессе~1.',0,5);
  TaskText('\P\SУказание.\s Программа должна содержать единственный вызов функции',0,0);
  TaskText('MPI\_Comm\_split, создающий оба требуемых коммуникатора',0,0);
  TaskText('(каждый в соответствующей группе процессов).',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{K} and a sequence of {K}~real numbers are given in the master process,'#13+
'an integer~{N} is given in each slave process. The value of~{N} is equal to~1'#13+
'for some processes and is equal to~0 for others; the number of processes'#13+
'with {N}~=~1 is equal to~{K}. Send one real number from the master process'#13+
'to each slave process with {N}~=~1 using the MPI\_Comm\_split function'#13+
'and one collective operation. Output the received numbers'#13+
'in these slave processes. \P\SNote.\s See the note to \3.'
  );
(*
  TaskText('В главном процессе дано целое число~{K} и набор из {K}~вещественных чисел,',0,1);
  TaskText('в каждом подчиненном процессе дано целое число~{N}, которое может принимать два',0,2);
  TaskText('значения:~0 и~1 (количество подчиненных процессов с {N}~=~1 равно~{K}). Используя',0,3);
  TaskText('функцию MPI\_Comm\_split и одну коллективную операцию пересылки данных,',0,4);
  TaskText('переслать по одному вещественному числу из главного процесса в каждый',0,5);
  TaskText('подчиненный процесс с {N}~=~1 и вывести в этих подчиненных процессах',0,0);
  TaskText('полученные числа. \P\SУказание.\s См. указание к задаче \3.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for at least one process and is equal to~0 for others.'#13+
'Also a real number~{A} is given in each process with {N}~=~1. Send all'#13+
'numbers~{A} to the first process with {N}~=~1 using the MPI\_Comm\_split function'#13+
'and one collective operation. Output received numbers in this process'#13+
'in ascending order of ranks of sending processes (including the number'#13+
'received from this process). \P\SNote.\s See the note to \4.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} в первый',0,4);
  TaskText('из процессов с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \4.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for at least one process and is equal to~0 for others.'#13+
'Also a real number~{A} is given in each process with {N}~=~1. Send all'#13+
'numbers~{A} to the last process with {N}~=~1 using the MPI\_Comm\_split function'#13+
'and one collective operation. Output received numbers in this process'#13+
'in ascending order of ranks of sending processes (including the number'#13+
'received from this process). \P\SNote.\s See the note to \5.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} в последний',0,4);
  TaskText('из процессов с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \5.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for at least one process and is equal to~0 for others.'#13+
'Also a real number~{A} is given in each process with {N}~=~1. Send all'#13+
'numbers~{A} to each process with {N}~=~1 using the MPI\_Comm\_split function'#13+
'and one collective operation. Output received numbers in these processes'#13+
'in ascending order of ranks of sending processes (including the number'#13+
'received from itself). \P\SNote.\s See the note to \6.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию пересылки данных, переслать числа~{A} во все',0,4);
  TaskText('процессы с {N}~=~1 и вывести их в порядке возрастания рангов переславших',0,5);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \6.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for some processes and is equal to~2 for others, there are at least'#13+
'one process with {N}~=~1 and one process with {N}~=~2. Also an integer~{A} is given'#13+
'in each process. Using the MPI\_Comm\_split function and one collective'#13+
'operation, send integers~{A} from all processes with {N}~=~1 to each process'#13+
'with {N}~=~1 and from all processes with {N}~=~2 to each process with {N}~=~2.'#13+
'Output received integers in each process in ascending order of ranks'#13+
'of sending processes (including the integer received from itself).'#13+
'\P\SNote.\s See the note to \5.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два значения:',0,1);
  TaskText('1 и~2 (имеется хотя бы один процесс с каждым из возможных значений).',0,2);
  TaskText('Кроме того, в каждом процессе дано целое число~{A}. Используя функцию',0,3);
  TaskText('MPI\_Comm\_split и одну коллективную операцию пересылки данных, переслать',0,4);
  TaskText('числа~{A}, данные в процессах с {N}~=~1, во все процессы с {N}~=~1, а числа~{A},',0,5);
  TaskText('данные в процессах с {N}~=~2, во все процессы с {N}~=~2. Во всех процессах',0,0);
  TaskText('вывести полученные числа в порядке возрастания рангов переславших',0,0);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \5.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for at least one process and is equal to~0 for others.'#13+
'Also a real number~{A} is given in each process with {N}~=~1. Find the sum'#13+
'of all real numbers~{A} using the MPI\_Comm\_split function and one global'#13+
'reduction operation. Output the received sum in each process with {N}~=~1.'#13+
'\P\SNote.\s See the note to \8.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два',0,1);
  TaskText('значения:~0 и~1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом',0,2);
  TaskText('процессе с {N}~=~1 дано вещественное число~{A}. Используя функцию MPI\_Comm\_split',0,3);
  TaskText('и одну коллективную операцию редукции, найти сумму всех исходных чисел~{A}',0,4);
  TaskText('и вывести ее во всех процессах с {N}~=~1.',0,5);
  TaskText('\P\SУказание.\s См. указание к задаче \8.',0,0);
*)
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
  CreateTask(topic1, n);
  if n = 0 then exit;
  TaskText(
'An integer~{N} is given in each process; the value of~{N} is equal to~1'#13+
'for some processes and is equal to~2 for others, there are at least'#13+
'one process with {N}~=~1 and one process with {N}~=~2. Also a real number~{A}'#13+
'is given in each process. Using the MPI\_Comm\_split function and one global'#13+
'reduction operation, find the minimal value among the numbers~{A}'#13+
'given in the processes with {N}~=~1 and the maximal value among the numbers~{A}'#13+
'given in the processes with {N}~=~2. Output the minimal value in each process'#13+
'with {N}~=~1 and the maximal value in each process with {N}~=~2.'#13+
'\P\SNote.\s See the note to \7.'
  );
(*
  TaskText('В каждом процессе дано целое число~{N}, которое может принимать два значения:',0,1);
  TaskText('1 и~2 (имеется хотя бы один процесс с каждым из возможных значений).',0,2);
  TaskText('Кроме того, в каждом процессе дано вещественное число~{A}. Используя функцию',0,3);
  TaskText('MPI\_Comm\_split и одну коллективную операцию редукции, найти минимальное',0,4);
  TaskText('значение среди чисел~{A}, которые даны в процессах с {N}~=~1, и максимальное',0,5);
  TaskText('значение среди чисел~{A}, которые даны в процессах с {N}~=~2. Найденный минимум',0,0);
  TaskText('вывести в процессах с {N}~=~1, а найденный максимум~\= в процессах с {N}~=~2.',0,0);
  TaskText('\P\SУказание.\s См. указание к задаче \7.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  repeat
    k := 2 + Random(4);
  until n mod k = 0;
  TaskText(
'An integer~{N} (>\,1) is given in the master process; the number of processes~{K} is'#13+
'assumed to be a multiple of {N}. Send the integer~{N} to all processes and define'#13+
'a Cartesian topology for all processes as a ({N}\;\x\;{K}/{N}) grid using'#13+
'the MPI\_Cart\_create function (ranks of processes should not be reordered).'#13+
'Find the process coordinates in the created topology using the MPI\_Cart\_coords'#13+
'function and output the process coordinates in each process.'
  );
(*
  TaskText('В главном процессе дано целое число~{N} (>\,1), причем известно, что количество',0,1);
  TaskText('процессов~{K} делится на~{N}. Переслать число~{N} во все процессы, после чего,',0,2);
  TaskText('используя функцию MPI\_Cart\_create, определить для всех процессов декартову',0,3);
  TaskText('топологию в виде двумерной решетки~\= матрицы размера {N}\;\x\;{K}/{N} (порядок',0,4);
  TaskText('нумерации процессов оставить прежним). Используя функцию MPI\_Cart\_coords,',0,5);
  TaskText('вывести для каждого процесса его координаты в созданной топологии.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 2 + Random(n-1);
  TaskText(
'An integer~{N} (>\,1) is given in the master process; the number~{N} is not greater'#13+
'than the number of processes~{K}. Send the integer~{N} to all processes'#13+
'and define a Cartesian topology for the initial part of processes'#13+
'as a ({N}\;\x\;{K}/{N}) grid using the MPI\_Cart\_create function'#13+
'(the symbol \</\> denotes the operator of integer division, ranks of processes'#13+
'should not be reordered). Output the process coordinates in each process'#13+
'included in the Cartesian topology.'
  );
(*
  TaskText('В главном процессе дано целое число~{N} (>\,1), не превосходящее количества',0,1);
  TaskText('процессов~{K}. Переслать число~{N} во все процессы, после чего определить',0,2);
  TaskText('декартову топологию для начальной части процессов в виде двумерной решетки~\=',0,3);
  TaskText('матрицы размера {N}\;\x\;{K}/{N} (символ \</\> обозначает операцию деления нацело,',0,4);
  TaskText('порядок нумерации процессов следует оставить прежним). Для каждого процесса,',0,5);
  TaskText('включенного в декартову топологию, вывести его координаты в этой топологии.',0,0);
*)  
  SetProcess(0);
  DataN('Process 0: N = ',k,0,3,1);
  Str(n, s);
  DataComment('Remark: the number of processes K is equal to '+s+'.',0,5);
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 2;
  TaskText(
'The number of processes~{K} is an even number: {K}~=~2{N}, {N}~>~1.'#13+
'A real number~{A} is given in the processes~0 and~{N}. Define a Cartesian'#13+
'topology for all processes as a (2\;\x\;{N}) grid. Using the MPI\_Cart\_sub'#13+
'function, split this grid into two one-dimensional subgrids (namely, \Irows\i)'#13+
'such that the processes~0 and~{N} were the master processes in these rows.'#13+
'Send the given number~{A} from the master process of each row to each process'#13+
'of the same row using one collective operation. Output the received number'#13+
'in each process (including the processes~0 and~{N}).'
  );
(*
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1. В процессах~0 и~{N} дано',0,1);
  TaskText('по одному вещественному числу~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера 2\;\x\;{N}, после чего, используя функцию',0,3);
  TaskText('MPI\_Cart\_sub, расщепить матрицу процессов на две одномерные строки (при этом',0,4);
  TaskText('процессы~0 и~{N} будут главными процессами в полученных строках). Используя',0,5);
  TaskText('одну коллективную операцию пересылки данных, переслать число~{A} из главного',0,0);
  TaskText('процесса каждой строки во все процессы этой же строки и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0 и~{N}).',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 2;
  TaskText(
'The number of processes~{K} is an even number: {K}~=~2{N}, {N}~>~1.'#13+
'A real number~{A} is given in the processes~0 and~1. Define a Cartesian'#13+
'topology for all processes as a ({N}\;\x\;2) grid. Using the MPI\_Cart\_sub'#13+
'function, split this grid into two one-dimensional subgrids (namely, \Icolumns\i)'#13+
'such that the processes~0 and~1 were the master processes in these columns.'#13+
'Send the given number~{A} from the master process of each column to each process'#13+
'of the same column using one collective operation. Output the received number'#13+
'in each process (including the processes~0 and~1).'
  );
(*
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1. В процессах~0 и~1 дано',0,1);
  TaskText('по одному вещественному числу~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера {N}\;\x\;2, после чего, используя функцию',0,3);
  TaskText('MPI\_Cart\_sub, расщепить матрицу процессов на два одномерных столбца (при этом',0,4);
  TaskText('процессы~0 и~1 будут главными процессами в полученных столбцах). Используя',0,5);
  TaskText('одну коллективную операцию пересылки данных, переслать число~{A} из главного',0,0);
  TaskText('процесса каждого столбца во все процессы этого же столбца и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0 и~1).',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText(
'The number of processes~{K} is a multiple of 3: {K}~=~3{N}, {N}~>~1. A sequence'#13+
'of {N} integers is given in the processes 0, {N}, and 2{N}. Define a Cartesian'#13+
'topology for all processes as a (3\;\x\;{N}) grid. Using the MPI\_Cart\_sub'#13+
'function, split this grid into three one-dimensional subgrids (namely, \Irows\i)'#13+
'such that the processes 0, {N}, and 2{N} were the master processes in these rows.'#13+
'Send one given integer from the master process of each row to each process'#13+
'of the same row using one collective operation. Output the received integer'#13+
'in each process (including the processes~0, {N}, and~2{N}).'
  );
(*
  TaskText('Число процессов~{К} кратно трем: {K}~=~3{N}, {N}~>~1. В процессах~0,~{N} и~2{N} дано',0,1);
  TaskText('по {N}~целых чисел. Определить для всех процессов декартову топологию в виде',0,2);
  TaskText('матрицы размера 3\;\x\;{N}, после чего, используя функцию MPI\_Cart\_sub, расщепить',0,3);
  TaskText('матрицу процессов на три одномерные строки (при этом процессы~0,~{N} и~2{N}',0,4);
  TaskText('будут главными процессами в полученных строках). Используя одну коллективную',0,5);
  TaskText('операцию пересылки данных, переслать по одному исходному числу из главного',0,0);
  TaskText('процесса каждой строки во все процессы этой же строки и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0,~{N} и~2{N}).',0,0);
*)  
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText(
'The number of processes~{K} is a multiple of 3: {K}~=~3{N}, {N}~>~1. A sequence'#13+
'of {N} integers is given in the processes 0, 1, and 2. Define a Cartesian'#13+
'topology for all processes as a ({N}\;\x\;3) grid. Using the MPI\_Cart\_sub'#13+
'function, split this grid into three one-dimensional subgrids (namely,'#13+
'\Icolumns\i) such that the processes 0, 1, and 2 were the master processes'#13+
'in these columns. Send one given integer from the master process of each'#13+
'column to each process of the same column using one collective operation.'#13+
'Output the received integer in each process'#13+
'(including the processes 0, 1, and~2).'
  );
(*
  TaskText('Число процессов~{К} кратно трем: {K}~=~3{N}, {N}~>~1. В процессах~0,~1 и~2 дано',0,1);
  TaskText('по {N}~целых чисел. Определить для всех процессов декартову топологию в виде',0,2);
  TaskText('матрицы размера {N}\;\x\;3, после чего, используя функцию MPI\_Cart\_sub, расщепить',0,3);
  TaskText('матрицу процессов на три одномерных столбца (при этом процессы~0,~1 и~2',0,4);
  TaskText('будут главными процессами в полученных столбцах). Используя одну коллективную',0,5);
  TaskText('операцию пересылки данных, переслать по одному исходному числу из главного',0,0);
  TaskText('процесса каждого столбца во все процессы этого же столбца и вывести полученное',0,0);
  TaskText('число в каждом процессе (включая процессы~0,~1 и~2).',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText(
'The number of processes~{K} is equal to~8 or~12. An integer is given in each'#13+
'process. Define a Cartesian topology for all processes as a three-dimensional'#13+
'(2\;\x\;2\;\x\;{K}/4) grid (ranks of processes should not be reordered),'#13+
'which should be considered as 2 two-dimensional (2\;\x\;{K}/4) subgrids'#13+
'(namely, \Imatrices\i) that contain processes with the identical first coordinate'#13+
'in the Cartesian topology. Split each matrix into two one-dimensional rows'#13+
'of processes. Send given integers from all processes of each row'#13+
'to the master process of the same row using one collective operation.'#13+
'Output received integers in the master process of each row'#13+
'(including integer received from itself).'
  );
(*
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано целое число.',0,1);
  TaskText('Определить для всех процессов декартову топологию в виде трехмерной решетки',0,2);
  TaskText('размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя эту решетку как две матрицы размера 2\;\x\;{K}/4 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой первой координатой), расщепить каждую матрицу',0,5);
  TaskText('процессов на две одномерные строки. Используя одну коллективную операцию',0,0);
  TaskText('пересылки данных, переслать в главный процесс каждой строки исходные числа из',0,0);
  TaskText('процессов этой же строки и вывести полученные наборы чисел (включая числа,',0,0);
  TaskText('полученные из главных процессов строк).',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText(
'The number of processes~{K} is equal to~8 or~12. An integer is given in each'#13+
'process. Define a Cartesian topology for all processes as a three-dimensional'#13+
'(2\;\x\;2\;\x\;{K}/4) grid (ranks of processes should not be reordered),'#13+
'which should be considered as {K}/4 two-dimensional (2\;\x\;2) subgrids'#13+
'(namely, \Imatrices\i) that contain processes with the identical third coordinate'#13+
'in the Cartesian topology. Split this grid into {K}/4 matrices of processes.'#13+
'Send given integers from all processes of each matrix to the master process'#13+
'of the same matrix using one collective operation.'#13+
'Output received integers in the master process of each matrix'#13+
'(including integer received from itself).'
  );
(*
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано целое число.',0,1);
  TaskText('Определить для всех процессов декартову топологию в виде трехмерной решетки',0,2);
  TaskText('размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя полученную решетку как {K}/4 матриц размера 2\;\x\;2 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой третьей координатой), расщепить эту решетку',0,5);
  TaskText('на {K}/4 указанных матриц. Используя одну коллективную операцию пересылки',0,0);
  TaskText('данных, переслать в главный процесс каждой из полученных матриц исходные',0,0);
  TaskText('числа из процессов этой же матрицы и вывести полученные наборы чисел (включая',0,0);
  TaskText('числа, полученные из главных процессов матриц).',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText(
'The number of processes~{K} is equal to~8 or~12. A real number is given'#13+
'in each process. Define a Cartesian topology for all processes'#13+
'as a three-dimensional (2\;\x\;2\;\x\;{K}/4) grid (ranks of processes should not be'#13+
'reordered), which should be considered as 2 two-dimensional (2\;\x\;{K}/4) subgrids'#13+
'(namely, \Imatrices\i) that contain processes with the identical first coordinate'#13+
'in the Cartesian topology. Split each matrix into {K}/4 one-dimensional'#13+
'columns of processes. Using one global reduction operation, find the product'#13+
'of all numbers given in the processes of each column. Output the product'#13+
'in the master process of the corresponding column.'
  );
(*
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано вещественное',0,1);
  TaskText('число. Определить для всех процессов декартову топологию в виде трехмерной',0,2);
  TaskText('решетки размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя эту решетку как две матрицы размера 2\;\x\;{K}/4 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой первой координатой), расщепить каждую матрицу',0,5);
  TaskText('процессов на {K}/4 одномерных столбцов. Используя одну коллективную операцию',0,0);
  TaskText('редукции, для каждого столбца процессов найти произведение исходных',0,0);
  TaskText('чисел и вывести найденные произведения в главных процессах каждого столбца.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText(
'The number of processes~{K} is equal to~8 or~12. A real number is given'#13+
'in each process. Define a Cartesian topology for all processes'#13+
'as a three-dimensional (2\;\x\;2\;\x\;{K}/4) grid (ranks of processes should not be'#13+
'reordered), which should be considered as {K}/4 two-dimensional (2\;\x\;2) subgrids'#13+
'(namely, \Imatrices\i) that contain processes with the identical third coordinate'#13+
'in the Cartesian topology. Split this grid into {K}/4 matrices of processes.'#13+
'Using one global reduction operation, find the sum of all numbers given'#13+
'in the processes of each matrix. Output the sum in the master process'#13+
'of the corresponding matrix.'
  );
(*
  TaskText('Количество процессов~{K} равно~8 или 12, в каждом процессе дано вещественное',0,1);
  TaskText('число. Определить для всех процессов декартову топологию в виде трехмерной',0,2);
  TaskText('решетки размера 2\;\x\;2\;\x\;{K}/4 (порядок нумерации процессов оставить прежним).',0,3);
  TaskText('Интерпретируя полученную решетку как {K}/4 матриц размера 2\;\x\;2 (в одну матрицу',0,4);
  TaskText('входят процессы с одинаковой третьей координатой), расщепить эту решетку',0,5);
  TaskText('на {K}/4 указанных матриц. Используя одну коллективную операцию редукции,',0,0);
  TaskText('для каждой из полученных матриц найти сумму исходных чисел и вывести',0,0);
  TaskText('найденные суммы в каждом процессе соответствующей матрицы.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText(
'Positive integers~{M} and~{N} are given in the master process; the product'#13+
'of the numbers~{M} and~{N} is less than or equal to the number of processes.'#13+
'Also integers~{X} and~{Y} are given in each process whose rank is'#13+
'in the range~0 to~{M}\*{N}\,\-\,1. Send the numbers~{M} and~{N} to all processes'#13+
'and define a Cartesian topology for initial {M}\*{N} processes'#13+
'as a two-dimensional ({M}\;\x\;{N}) grid, which is periodic in the first dimension'#13+
'(ranks of processes should not be reordered). Using the MPI\_Cart\_rank'#13+
'function, output the rank of process with the coordinates~{X}, {Y}'#13+
'(taking into account periodicity) in each process included in the Cartesian'#13+
'topology. Output \-1 in the case of erroneous coordinates.'#13+
'\P\SNote.\s If invalid coordinates are specified when calling the MPI\_Cart\_rank'#13+
'function (for instance, in the case of negative coordinates for non-periodic'#13+
'dimensions) then the function itself returns an error code (instead of'#13+
'the successful return code MPI\_SUCCESS) whereas the return value of the rank'#13+
'parameter is undefined. So, in this task, the number \-1 should be output when'#13+
'the MPI\_Cart\_rank function return a value that differs from MPI\_SUCCESS.'#13+
'To suppress the output of error messages in the debug section of the'#13+
'Programming Taskbook window, it is enough to set the special error handler'#13+
'named MPI\_ERRORS\_RETURN before calling a function that may be erroneous'#13+
'(use the MPI\_Comm\_set\_errhandler function or, in MPI-1, the MPI\_Errhandler\_set'#13+
'function). When an error occurs in some function, this error handler performs'#13+
'no action except setting an error return value for this function.'#13+
'In MPICH version 1.2.5, the MPI\_Cart\_rank function returns the rank'#13+
'parameter equal to \-1 when the process coordinates are invalid. This feature'#13+
'may sumplify the solution; however, in this case, one also should suppress'#13+
'the output of error messages by means of special error handler setting.'
  );
//2020.10
(*
TaskText(
 'В главном процессе даны положительные целые числа~{M} и~{N}, произведение которых'#13#10
+'не превосходит количества процессов; кроме того, в процессах с рангами от 0'#13#10
+'до~{M}\*{N}\,\-\,1 даны целые числа~{X} и~{Y}. Переслать числа~{M} и~{N} во все процессы,'#13#10
+'после чего определить для начальных {M}\*{N}~процессов декартову топологию в виде'#13#10
+'двумерной решетки размера {M}\;\x\;{N}, являющейся периодической по первому'#13#10
+'измерению (порядок нумерации процессов оставить прежним). В каждом процессе,'#13#10
+'входящем в созданную топологию, вывести ранг процесса с координатами'#13#10
+'{X},~{Y} (с учетом периодичности), используя для этого функцию'#13#10
+'MPI\_Cart\_rank. В случае недопустимых координат вывести~\-1.'#13#10
+'\P\SПримечание.\s Если при вызове функции MPI\_Cart\_rank указаны недопустимые'#13#10
+'координаты (например, отрицательные координаты для измерений, по которым'#13#10
+'декартова решетка не является периодической), то сама функция возвращает'#13#10
+'ненулевое значение (являющееся признаком ошибки), а возвращаемое значение'#13#10
+'параметра rank является неопределенным. Таким образом, в данном задании'#13#10
+'число \-1 следует выводить, если функция MPI\_Cart\_rank вернула ненулевое'#13#10
+'значение. Чтобы подавить возникающие при этом сообщения об ошибках,'#13#10
+'отображаемые в разделе отладки окна задачника, достаточно перед вызовом'#13#10
+'функции, который может привести к ошибке, установить с помощью функции'#13#10
+'MPI\_Comm\_set\_errhandler (MPI\_Errhandler\_set в MPI-1) специальный вариант'#13#10
+'\Iобработчика ошибок\i MPI\_ERRORS\_RETURN, который при возникновении ошибки'#13#10
+'не выполняет никаких действий, кроме установки ненулевого возвращаемого'#13#10
+'значения для этой функции. Следует заметить, что в версии MPICH 1.2.5 в случае'#13#10
+'указания недопустимых координат функция MPI\_Cart\_rank возвращает значение'#13#10
+'параметра rank, равное \-1, что позволяет упростить решение, избавившись'#13#10
+'от проверки возвращаемого значения функции. Однако и в этом случае желательно'#13#10
+'подавить вывод сообщений об ошибках описанным выше способом.'
);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText(
'Positive integers~{M} and~{N} are given in the master process; the product'#13+
'of the numbers~{M} and~{N} is less than or equal to the number of processes.'#13+
'Also integers~{X} and~{Y} are given in each process whose rank is'#13+
'in the range~0 to~{M}\*{N}\,\-\,1. Send the numbers~{M} and~{N} to all processes'#13+
'and define a Cartesian topology for initial {M}\*{N} processes'#13+
'as a two-dimensional ({M}\;\x\;{N}) grid, which is periodic in the second dimension'#13+
'(ranks of processes should not be reordered). Using the MPI\_Cart\_rank'#13+
'function, output the rank of process with the coordinates~{X}, {Y}'#13+
'(taking into account periodicity) in each process included in the Cartesian'#13+
'topology. Output \-1 in the case of erroneous coordinates.'#13+
'\P\SNote.\s See the note to \1.'
  );
(*
  TaskText('В главном процессе даны положительные целые числа~{M} и~{N}, произведение которых',0,1);
  TaskText('не превосходит количества процессов; кроме того, в процессах с рангами от~0',0,2);
  TaskText('до~{M}\*{N}\,\-\,1 даны целые числа~{X} и~{Y}. Переслать числа~{M} и~{N} во все процессы,',0,3);
  TaskText('после чего определить для начальных {M}\*{N}~процессов декартову топологию в виде',0,4);
  TaskText('двумерной решетки размера {M}\;\x\;{N}, являющейся периодической по второму',0,5);
  TaskText('измерению (порядок нумерации процессов оставить прежним). В каждом процессе,',0,0);
  TaskText('входящем в созданную топологию, вывести ранг процесса с координатами',0,0);
  TaskText('{X},~{Y} (с учетом периодичности), используя для этого функцию',0,0);
  TaskText('MPI\_Cart\_rank. В случае недопустимых координат вывести~\-1.',0,0);
  TaskText('\P\SПримечание.\s См. примечание к заданию \1.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each slave process. Define a Cartesian topology'#13+
'for all processes as a one-dimensional grid. Using the MPI\_Send and MPI\_Recv'#13+
'functions, perform a shift of given data by step~\-1 (that is, the real number'#13+
'given in each process should be sent to the process of the previous rank).'#13+
'Ranks of source and destination process should be determined by means'#13+
'of the MPI\_Cart\_shift function. Output received data'#13+
'in each destination process.'
  );
(*
  TaskText('В каждом подчиненном процессе дано вещественное число. Определить для',0,1);
  TaskText('всех процессов декартову топологию в виде одномерной решетки и осуществить',0,2);
  TaskText('простой сдвиг исходных данных с шагом~\-1 (число из каждого \Iподчиненного\i',0,3);
  TaskText('процесса пересылается в предыдущий процесс). Для определения рангов посылающих',0,4);
  TaskText('и принимающих процессов использовать функцию MPI\_Cart\_shift, пересылку',0,5);
  TaskText('выполнять с помощью функций MPI\_Send и MPI\_Recv. Во всех процессах,',0,0);
  TaskText('получивших данные, вывести эти данные.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := 2;
  TaskText(
'The number of processes~{K} is an even number: {K}~=~2{N}, {N}~>~1.'#13+
'A real number~{A} is given in each process. Define a Cartesian topology'#13+
'for all processes as a two-dimensional (2\;\x\;{N}) grid (namely, \Imatrix\i);'#13+
'ranks of processes should not be reordered. Using the MPI\_Sendrecv function,'#13+
'perform a cyclic shift of data given in all processes of each row'#13+
'of the matrix by step 1 (that is, the number~{A} should be sent from'#13+
'each process in the row, except the last process, to the next process'#13+
'in the same row and from the last process in the row to the first'#13+
'process in the same row). Ranks of source and destination process should be'#13+
'determined by means of the MPI\_Cart\_shift function.'#13+
'Output received data in each process.'
  );
(*
  TaskText('Число процессов~{К} является четным: {K}~=~2{N}, {N}~>~1; в каждом процессе',0,1);
  TaskText('дано вещественное число~{A}. Определить для всех процессов декартову',0,2);
  TaskText('топологию в виде матрицы размера 2\;\x\;{N} (порядок нумерации процессов оставить',0,3);
  TaskText('прежним) и для каждой строки матрицы осуществить циклический сдвиг исходных',0,4);
  TaskText('данных с шагом~1 (число~{A} из каждого процесса, кроме последнего в строке,',0,5);
  TaskText('пересылается в следующий процесс этой же строки, а из последнего процесса~\= в',0,0);
  TaskText('главный процесс этой строки). Для определения рангов посылающих и принимающих',0,0);
  TaskText('процессов использовать функцию MPI\_Cart\_shift, пересылку выполнять с помощью',0,0);
  TaskText('функции MPI\_Sendrecv. Во всех процессах вывести полученные данные.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText(
'The number of processes~{K} is equal to~8 or~12. A real number~{A} is given'#13+
'in each process. Define a Cartesian topology for all processes'#13+
'as a three-dimensional (2\;\x\;2\;\x\;{K}/4) grid (ranks of processes should not be'#13+
'reordered), which should be considered as {K}/4 two-dimensional (2\;\x\;2) subgrids'#13+
'(namely, \Imatrices\i) that contain processes with the identical third coordinate'#13+
'in the Cartesian topology and are ordered by the value of this third'#13+
'coordinate. Using the MPI\_Sendrecv\_replace function, perform a cyclic shift'#13+
'of data given in all processes of each matrix by step 1 (that is,'#13+
'the numbers~{A} should be sent from all processes of each matrix,'#13+
'except the last matrix, to the corresponding processes of the next'#13+
'matrix and from all processes of the last matrix to the corresponding'#13+
'processes of the first matrix). Ranks of source and destination process'#13+
'should be determined by means of the MPI\_Cart\_shift function.'#13+
'Output received data in each process.'
  );
(*
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
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 2;
  TaskText(
'The number of processes~{K} is an odd number: {K}~=~2{N}\,+\,1 (1~<~{N}~<~5).'#13+
'An integer~{A} is given in each process. Using the MPI\_Graph\_create function,'#13+
'define a graph topology for all processes as follows: the master process'#13+
'must be connected by edges to all odd-rank processes (that is,'#13+
'to the processes~1, 3,~\., 2{N}\,\-\,1); each process of the rank~{R},'#13+
'where~{R} is a positive even number (2, 4,~\., 2{N}), must be connected'#13+
'by edge to the process of the rank~{R}\,\-\,1. Thus, the graph represents'#13+
'{N}-beam star whose center is the master process, each star beam consists'#13+
'of two slave processes of ranks~{R} and~{R}\,+\,1, and each odd-rank'#13+
'process~{R} is adjacent to star center (namely, the master process).\G<Graph\MPI5Comm28.png>'#13+
'\PUsing the MPI\_Send and MPI\_Recv functions, send the given integer~{A} from each'#13+
'process to all its adjacent processes (its \Ineighbors\i). The amount and ranks'#13+
'of neighbors should be determined by means of the MPI\_Graph\_neighbors\_count'#13+
'and MPI\_Graph\_neighbors functions respectively. Output received data'#13+
'in each process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('Число процессов~{K} является нечетным: {K}~=~2{N}\,+\,1 (1~<~{N}~<~5); в каждом процессе',0,1);
  TaskText('дано целое число~{A}. Используя функцию MPI\_Graph\_create, определить для всех',0,2);
  TaskText('процессов топологию графа, в которой главный процесс связан ребрами со всеми',0,3);
  TaskText('процессами нечетного ранга (1,~3,~\., 2{N}\,\-\,1), а каждый процесс четного',0,4);
  TaskText('положительного ранга~{R} (2, 4,~\., 2{N}) связан ребром с процессом ранга~{R}\,\-\,1',0,5);
  TaskText('(в результате получается {N}-лучевая звезда, центром которой является главный',0,0);
  TaskText('процесс, а каждый луч состоит из двух подчиненных процессов~{R} и~{R}\,+\,1, причем',0,0);
  TaskText('ближайшим к центру является процесс нечетного ранга~{R}).\G<Graph\MPI5Comm28.png> \PПереслать число~{A} из',0,0);
  TaskText('каждого процесса всем процессам, связанным с ним ребрами (\Iпроцессам-соседям\i).',0,0);
  TaskText('Для определения количества процессов-соседей и их рангов использовать функции',0,0);
  TaskText('MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors, пересылку выполнять',0,0);
  TaskText('с помощью функций MPI\_Send и MPI\_Recv. Во всех процессах вывести полученные',0,0);
  TaskText('числа в порядке возрастания рангов переславших их процессов.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 2;
  TaskText(
'The number of processes~{K} is an even number: {K}~=~2{N} (1~<~{N}~<~6).'#13+
'An integer~{A} is given in each process. Using the MPI\_Graph\_create'#13+
'function, define a graph topology for all processes as follows:'#13+
'all even-rank processes (including the master process) are linked'#13+
'in a chain 0 \= 2 \= 4 \= 6 \= \. \= (2{N}\,\-\,2); each process with'#13+
'odd rank~{R} (1, 3,~\., 2{N}\,\-\,1) is connected by edge to the process'#13+
'with the rank~{R}\,\-\,1. Thus, each odd-rank process has a single neighbor,'#13+
'the first and the last even-rank processes have two neighbors, and other'#13+
'even-rank processes (the \<inner\> ones) have three neighbors.\G<Graph\MPI5Comm29.png> \PUsing'#13+
'the MPI\_Sendrecv function, send the given integer {A} from each process'#13+
'to all its neighbors. The amount and ranks of neighbors should be determined'#13+
'by means of the MPI\_Graph\_neighbors\_count and MPI\_Graph\_neighbors functions'#13+
'respectively. Output received data in each process in ascending order'#13+
'of ranks of sending processes.'
  );
(*
  TaskText('Число процессов~{K} является четным: {K}~=~2{N} (1~<~{N}~<~6); в каждом процессе',0,1);
  TaskText('дано целое число~{A}. Используя функцию MPI\_Graph\_create, определить для всех',0,2);
  TaskText('процессов топологию графа, в которой все процессы четного ранга (включая',0,3);
  TaskText('главный процесс) связаны в цепочку: 0 \= 2 \= 4 \= 6 \= \. \= (2{N}\,\-\,2), а каждый',0,4);
  TaskText('Process нечетного ранга~{R} (1, 3,~\., 2{N}\,\-\,1) связан с процессом ранга~{R}\,\-\,1',0,5);
  TaskText('(в результате каждый процесс нечетного ранга будет иметь единственного соседа,',0,0);
  TaskText('первый и последний процессы четного ранга будут иметь по два соседа,',0,0);
  TaskText('а остальные~\= \<внутренние\>~\= процессы четного ранга будут иметь по три',0,0);
  TaskText('соседа).\G<Graph\MPI5Comm29.png> \PПереслать число~{A} из каждого процесса всем процессам-соседям. Для',0,0);
  TaskText('определения количества процессов-соседей и их рангов использовать функции',0,0);
  TaskText('MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors, пересылку выполнять',0,0);
  TaskText('с помощью функции MPI\_Sendrecv. Во всех процессах вывести полученные',0,0);
  TaskText('числа в порядке возрастания рангов переславших их процессов.',0,0);
*)
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
  CreateTask(topic2, n);
  if n = 0 then exit;
  k := n div 3;
  TaskText(
'The number of processes~{K} is equal to 3{N}\,+\,1 (1~<~{N}~<~5).'#13+
'An integer~{A} is given in each process. Using the MPI\_Graph\_create function,'#13+
'define a graph topology for all processes as follows: processes'#13+
'of ranks~{R}, {R}\,+\,1, {R}\,+\,2, where {R}~=~1, 4, 7,~\., are linked by edges'#13+
'and, moreover, each process whose rank is positive and is a multiple of 3'#13+
'(that is, the process 3, 6,~\.) is connected by edge to the master process.'#13+
'Thus, the graph represents {N}-beam star whose center is the master process,'#13+
'each star beam consists of three linked slave processes, and each slave'#13+
'process with rank that is a multiple of 3 is adjacent to star center (namely,'#13+
'the master process).\G<Graph\MPI5Comm30.png> \PUsing the MPI\_Sendrecv function, send the given integer~{A}'#13+
'from each process to all its neighbors. The amount and ranks of neighbors'#13+
'should be determined by means of the MPI\_Graph\_neighbors\_count'#13+
'and MPI\_Graph\_neighbors functions respectively. Output received data'#13+
'in each process in ascending order of ranks of sending processes.'
  );
(*
  TaskText('Количество процессов~{K} равно~3{N}\,+\,1 (1~<~{N}~<~5); в каждом процессе дано целое',0,1);
  TaskText('число~{A}. Используя функцию MPI\_Graph\_create, определить для всех процессов',0,2);
  TaskText('топологию графа, в которой процессы~{R}, {R}\,+\,1, {R}\,+\,2, где {R}~=~1,~4, 7,~\., связаны',0,3);
  TaskText('между собой ребрами, и, кроме того, каждый процесс положительного ранга,',0,4);
  TaskText('кратного трем (3, 6,~\.), связан ребром с главным процессом (в результате',0,5);
  TaskText('получается {N}-лучевая звезда, центром которой является главный процесс,',0,0);
  TaskText('а каждый луч состоит из трех связанных между собой процессов, причем с центром',0,0);
  TaskText('связан процесс ранга, кратного трем).\G<Graph\MPI5Comm30.png> \PПереслать число~{A} из каждого процесса',0,0);
  TaskText('всем процессам-соседям. Для определения количества процессов-соседей и их',0,0);
  TaskText('рангов использовать функции MPI\_Graph\_neighbors\_count и MPI\_Graph\_neighbors,',0,0);
  TaskText('пересылку выполнять с помощью функции MPI\_Sendrecv. Во всех процессах вывести',0,0);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,0);
*)
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


procedure MpiH19a;
var i,n,y,k,j,m,x: integer;
    a: array [0..14] of integer;
    s: string;
begin
  n := 3*RandomN(3,5);
  CreateTask(topic3, n);
  if n = 0 then exit;
  k := n div 3;
TaskText(
'The number of processes {K} is a multiple of 3; an integer {A} is given in each'#13+
'process. Using the MPI\_Dist\_graph\_create function, define a distributed graph'#13+
'topology for all processes as follows: all processes whose rank is a multiple'#13+
'of 3 (0, 3,~\., {K}\,\-\,3) are linked in a ring, each process in this ring is'#13+
'the source for the next process of the ring (that is, the process 0 is the'#13+
'source for the process 3, the process 3 is the source for the process 6,~\.,'#13+
'the process {K}\,\-\,3 is the source for the process 0); besides, the process 3{N}'#13+
'({N}~=~0, 1,~\., {K}/3\,\-\,1) is the source for the processes 3{N}\,+\,1 and 3{N}\,+\,2,'#13+
'and the process 3{N}\,+\,1 is the source for the process 3{N}\,+\,2.\G<Graph\MPI5Comm31.png> \PThe complete'#13+
'definition of the graph topology should be given in the master process'#13+
'(whereas the second parameter of the MPI\_Dist\_graph\_create function should be'#13+
'equal to 0 in all slave processes). The weights parameter should be equal to'#13+
'MPI\_UNWEIGHTED, the info parameter should be equal to MPI\_INFO\_NULL, ranks'#13+
'of processes should not be reordered. Using the MPI\_Send and MPI\_Recv'#13+
'functions, send the given numbers from the source processes to the destination'#13+
'processes and output the sum of the given number {A} and all received numbers'#13+
'in each process. The amount and ranks of source and destination processes'#13+
'should be determined by means of the MPI\_Dist\_graph\_neighbors\_count'#13+
'and MPI\_Dist\_graph\_neighbors functions.'
);
(*
TaskText(
 'Количество процессов {K} кратно 3; в каждом процессе дано целое число {A}.'#13#10
+'Используя функцию MPI\_Dist\_graph\_create, определить для всех процессов'#13#10
+'топологию распределенного графа, в которой все процессы рангов, кратных 3'#13#10
+'(0, 3,~\., {K}\,\-\,3) образуют кольцо, причем каждый из процессов, входящих'#13#10
+'в кольцо, является источником для последующего процесса (процесс 0 является'#13#10
+'источником для процесса 3, процесс 3 \= для процесса 6,~\., процесс {K}\,\-\,3 \='#13#10
+'для процесса 0) и, кроме того, процесс ранга 3{N} ({N}~=~0, 1,~\., K/3\,\-\,1)'#13#10
+'является источником для процессов ранга 3{N}\,+\,1 и 3{N}\,+\,2, а процесс'#13#10
+'ранга 3{N}\,+\,1 является источником для процесса ранга 3{N}\,+\,2.\G<Graph\MPI5Comm31.png> \PПолное определение'#13#10
+'топологии дать в главном процессе (в подчиненных процессах второй параметр'#13#10
+'функции MPI\_Dist\_graph\_create должен быть равен 0); параметр weights положить'#13#10
+'равным MPI\_UNWEIGHTED, параметр info \= равным MPI\_INFO\_NULL, порядок нумерации'#13#10
+'процессов не изменять. Переслать числа {A} от процессов-источников'#13#10
+'процессам-приемникам и вывести в каждом процессе сумму исходного числа {A}'#13#10
+'и всех чисел, полученных от процессов-источников. Для определения количества'#13#10
+'источников и приемников, а также их рангов использовать функции'#13#10
+'MPI\_Dist\_graph\_neighbors\_count и MPI\_Dist\_graph\_neighbors, пересылку выполнять'#13#10
+'с помощью функций MPI\_Send и MPI\_Recv.'
);
*)
  for i := 0 to n-1 do
    a[i] := RandomN(10,99);
  for i := 0 to k -1 do
  begin
    x := xleft;
    y := i+1;
    SetProcess(3*i);
    Str(3*i:2,s);
    DataN('Process '+s+': ', a[i], x, y, 3);
    ResultN('Process '+s+': ', a[i] + a[(i+k-1) mod k], x, y, 3);
    x := 0;
    SetProcess(3*i+1);
    Str(3*i+1:2,s);
    DataN('Process '+s+': ', a[i+k], x, y, 3);
    ResultN('Process '+s+': ', a[i] + a[i+k], x, y, 3);
    x := xRight;
    SetProcess(3*i+2);
    Str(3*i+2:2,s);
    DataN('Process '+s+': ', a[i+2*k], x, y, 3);
    ResultN('Process '+s+': ', a[i] + a[i+k] + a[i+2*k], x, y, 3);
  end;
  SetTestCount(5);
end;

procedure MpiH20a;
var i,n,y,k,j,m,x: integer;
    a,b: array [0..14] of integer;
    s: string;
begin
  n := RandomN(4,15);
  CreateTask(topic3, n);
  if n = 0 then exit;
TaskText(
'The number of processes is in the range 4 to 15; an integer {A} is given in each'#13+
'process. Using the MPI\_Dist\_graph\_create function, define a distributed graph'#13+
'topology for all processes as follows: all processes form a binary tree'#13+
'with the process 0 as a tree root, the processes 1 and 2 as a tree nodes'#13+
'of level 1, the processes from 3 to 6 as a tree nodes of level 2'#13+
'(the processes 3 and 4 are the child nodes of the process 1 and'#13+
'the processes 5 and 6 are the child nodes of the process 2), and so~on.'#13+
'Each process is the source for all its child nodes, so each process has 0'#13+
'to 2 destination processes.\G<Graph\MPI5Comm32.png> \PThe complete definition of the graph topology'#13+
'should be given in the master process (whereas the second parameter of the'#13+
'MPI\_Dist\_graph\_create function should be equal to 0 in all slave processes).'#13+
'The weights parameter should be equal to MPI\_UNWEIGHTED, the info parameter'#13+
'should be equal to MPI\_INFO\_NULL, ranks of processes should not be reordered.'#13+
'Using the MPI\_Send and MPI\_Recv functions in each process, find and output'#13+
'the sum of the given number {A} and all the numbers that are given in ancestors'#13+
'of all levels\=from the tree root (the master process) to the nearest ancestor'#13+
'(the parent process). The amount and ranks of source and destination processes'#13+
'should be determined by means of the MPI\_Dist\_graph\_neighbors\_count'#13+
'and MPI\_Dist\_graph\_neighbors functions.'
);
(*
TaskText(
 'Количество процессов лежит в диапазоне от 4 до 15, в каждом процессе дано'#13#10
+'целое число {A}. Используя функцию MPI\_Dist\_graph\_create, определить для всех'#13#10
+'процессов топологию распределенного графа, которая представляет собой бинарное'#13#10
+'дерево с корнем в главном процессе 0, вершинами первого уровня в процессах'#13#10
+'рангов 1 и 2, вершинами второго уровня в процессах рангов 3-6 (причем процессы'#13#10
+'ранга 3 и 4 являются дочерними вершинами процесса 1, а процессы ранга 5 и 6 \='#13#10
+'дочерними вершинами процесса 2), и~т.\,д. Каждый процесс является источником для'#13#10
+'своих дочерних вершин; таким образом, каждый процесс имеет от 0 до 2'#13#10
+'процессов-приемников.\G<Graph\MPI5Comm32.png> \PПолное определение топологии дать в главном процессе'#13#10
+'(в подчиненных процессах второй параметр функции MPI\_Dist\_graph\_create должен'#13#10
+'быть равен 0); параметр weights положить равным MPI\_UNWEIGHTED, параметр'#13#10
+'info \= равным MPI\_INFO\_NULL, порядок нумерации процессов не изменять. Найти'#13#10
+'и вывести в каждом процессе сумму исходного числа {A} и чисел, данных'#13#10
+'в процессах-предках \Iвсех уровней\i \= от корня (главного процесса) до ближайшего'#13#10
+'предка (родительского процесса-источника). Для определения количества'#13#10
+'источников и приемников, а также их рангов использовать функции'#13#10
+'MPI\_Dist\_graph\_neighbors\_count и MPI\_Dist\_graph\_neighbors, пересылку данных'#13#10
+'выполнять с помощью функций MPI\_Send и MPI\_Recv.'
);
*)
  k := n div 3;
  for i := 0 to n-1 do
    a[i] := RandomN(10,99);
  b[0] := a[0];
  for i := 0 to 6 do
  begin
    b[i*2+1] := a[i*2+1] + b[i];
    b[i*2+2] := a[i*2+2] + b[i];
  end;
  SetProcess(0);
  DataN('Process  0: ', a[0], 0, 1, 3);
  ResultN('Process  0: ', b[0], 0, 1, 3);
  SetProcess(1);
  DataN('Process  1: ', a[1], 23, 2, 3);
  ResultN('Process  1: ', b[1], 23, 2, 3);
  SetProcess(2);
  DataN('Process  2: ', a[2], 43, 2, 3);
  ResultN('Process  2: ', b[2], 43, 2, 3);
  y := 2;
  k := 2;
  for j := 1 to 3 do
  begin
    x := -17;
    y := y + 1;
    for i := 1 to 4 do
    begin
      k := k + 1;
      if k > n-1 then break;
      x := x + 20;
      Str(k:2,s);
      SetProcess(k);
      DataN('Process '+s+': ', a[k], x, y, 3);
      ResultN('Process '+s+': ', b[k], x, y, 3);
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

//------------------------------------------------------------------------

const Topic5 = 'Nonblocking collective functions (MPI-3)';
  DebugSec = 'Example data output in the debug section:';

var ndeb: array[0..9] of integer;
    rdeb: array[0..9] of real;

procedure ShowDebN(r1, r2, step, y: integer);
var i: integer;
    s: string;
begin
  DataComment(DebugSec, 1, y);
  i := r1;
  while i <= r2 do
  begin
    if ndeb[i] <> 0 then
    begin
      y := y + 1;
      Str(ndeb[i], s);
      DataComment(' '+Chr(i + 48)+'|  1> '+s, 1, y);
    end;
    i := i + step;
  end;

end;


procedure ShowDebR(r1, r2, step, y: integer);
var i: integer;
    s: string;
begin
  DataComment(DebugSec, 1, y);
  i := r1;
  while i <= r2 do
  begin
    if rdeb[i] <> 0 then
    begin
      y := y + 1;
      Str(rdeb[i]:0:2, s);
      DataComment(' '+Chr(i + 48)+'|  1> '+s, 1, y);
    end;
    i := i + step;
  end;
end;

procedure InitShowR;
begin
  rdeb[0] := 0.34;
  rdeb[1] := 0.48;
  rdeb[2] := 0.23;
  rdeb[3] := 0.54;
  rdeb[4] := 0.39;
  rdeb[5] := 0.27;
  rdeb[6] := 0.41;
  rdeb[7] := 0.46;
  rdeb[8] := 0.31;
  rdeb[9] := 0.52;
end;

procedure InitShowRSmall;
begin
  rdeb[0] := 0.03;
  rdeb[1] := 0.01;
  rdeb[2] := 0.02;
  rdeb[3] := 0.01;
  rdeb[4] := 0.03;
  rdeb[5] := 0.02;
  rdeb[6] := 0.01;
  rdeb[7] := 0.03;
  rdeb[8] := 0.02;
  rdeb[9] := 0.01;
end;

procedure InitShowN;
begin
  ndeb[0] := 249;
  ndeb[1] := 513;
  ndeb[2] := 468;
  ndeb[3] := 311;
  ndeb[4] := 285;
  ndeb[5] := 429;
  ndeb[6] := 528;
  ndeb[7] := 365;
  ndeb[8] := 276;
  ndeb[9] := 418;
end;

procedure InitShowNSmall;
begin
  ndeb[0] := 1;
  ndeb[1] := 2;
  ndeb[2] := 2;
  ndeb[3] := 1;
  ndeb[4] := 3;
  ndeb[5] := 2;
  ndeb[6] := 1;
  ndeb[7] := 3;
  ndeb[8] := 1;
  ndeb[9] := 2;
end;

procedure MpiE1;
var i,n,j: integer;
  r: array[1..5] of real;
begin
  n := 2*(Random(3)+3);
  CreateTask(Topic5, n);
  if n = 0 then exit;

  TaskText(
(*'В процессе ранга {K}/2 дано 5 чисел; {K}~\= количество процессов.'#13+
'Используя функцию MPI\_Ibcast для подходящего коммуникатора, переслать'#13+
'эти числа в процессы с меньшими рангами и вывести полученные числа'#13+
'в процессах с рангами от 0 до {K}/2.'#13+
'Для проверки окончания неблокирующей операции MPI\_Ibcast использовать'#13+
'функцию MPI\_Wait. Дополнительно для процессов с рангами от 0 до {K}/2'#13+
'отобразить в разделе отладки продолжительность каждого вызова'#13+
'функции MPI\_Wait в миллисекундах; для этого вызвать функцию MPI\_Wtime'#13+
'до и после MPI\_Wait и с помощью функции Show вывести разность'#13+
'возвращенных функцией MPI\_Wtime значений, умноженную на 1000.'#13+
'---'#13+*)
'A sequence of 5 real numbers is given in the process of rank {K}/2,'#13+
'where {K} is the number of processes. Use the MPI\_Ibcast function'#13+
'for an appropriate communicator to send these numbers to processes'#13+
'with lower ranks and output the numbers in processes with ranks'#13+
'from 0 to {K}/2.'#13+
'Use the MPI\_Wait function to check if the MPI\_Ibcast non-blocking'#13+
'operation finishes. Additionally, display the duration of each call'#13+
'of MPI\_Wait function in milliseconds for processes with ranks from 0'#13+
'to {K}/2 in the debug section; for this purpose, call MPI\_Wtime'#13+
'before and after MPI\_Wait and use the Show function to display'#13+
'the difference of values returned by MPI\_Wtime multiplied by 1000.'
);
  InitShowR;
  for i := 1 to 5 do
    r[i] := Random*89.99+10;
  SetProcess(n div 2);
  DataComment('Process '+Chr(n div 2+48)+': ',13,3);
  for i := 1 to 5 do
  DataR('', r[i], Center(i,5,5,2), 3, 5);
  for i := 0 to n div 2 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,i+1);
    for j := 1 to 5 do
    ResultR('', r[j], Center(j,5,5,2), i+1, 5);
  end;
  rdeb[n div 2] := 0.01;
  ShowDebR(0, n div 2, 1, n div 2 + 2);
  SetTestCount(5);
end;


procedure MpiE2;
var i,j,n: integer;
  r: array[1..5,1..5] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;

TaskText(
(*'В каждом процессе нечетного ранга дан набор из 5 целых чисел.'#13+
'Используя функцию MPI\_Igather для подходящего коммуникатора, переслать'#13+
'эти числа в процесс ранга~1 и вывести их в порядке убывания рангов'#13+
'переславших их процессов (первым вывести набор чисел, данный в процессе'#13+
'максимального нечетного ранга, последним~\= набор чисел, данный в процессе'#13+
'ранга~1).'#13+
'Для проверки окончания неблокирующей операции MPI\_Igather использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов'#13+
'нечетного ранга отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'A sequence of 5 integers is given in each process of odd rank. Using'#13+
'the MPI\_Igather function for an appropriate communicator, send these'#13+
'numbers to a process of rank~1 and output them in descending order of'#13+
'ranks of the processes that sent them (first output the sequence of'#13+
'numbers given in the process with the highest odd rank, last~\= the sequence'#13+
'of numbers given in the process of rank~1).'#13+
'Use the MPI\_Test function to check if the MPI\_Igather non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it'#13+
'returns a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section for all odd-rank'#13+
'processes using the Show function.'
);

//-----------------
// Реализация задания
  InitShowNSmall;
  for i := 1 to n div 2 do
    for j := 1 to 5 do
    r[i,j] := Random(90) + 10;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataComment('Process '+Chr(2*i-1+48)+': ',22,i);
    for j := 1 to 5 do
      DataN('', r[i,j], Center(j,5,2,1), i, 1);
  end;

  SetProcess(1);
  ResultComment('Process 1:',0,2);
  for i := 1 to n div 2 do
    for j := 1 to 5 do
  ResultN('', r[i,j], Center(((n div 2)-i)*5+j,5*(n div 2),2,1), 3, 2);
//----------------
  ndeb[1] := 513;
  ShowDebN(1, n div 2 * 2 - 1, 2, n div 2 + 1);
  SetTestCount(5);
end;

procedure MpiE3;
var i,j,n,c: integer;
  r: array[1..5,1..10] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;


TaskText(
(*'В каждом процессе четного ранга дан набор из {R}~+~2 целых чисел, где число {R}'#13+
'равно рангу процесса (в процессе~0 даны 2 числа, в процессе~2 даны 4 числа,'#13+
'и т.\,д.). Используя функцию MPI\_Igatherv для подходящего коммуникатора,'#13+
'переслать эти наборы в главный процесс и вывести полученные наборы в порядке'#13+
'возрастания рангов переславших их процессов (первым вывести набор,'#13+
'данный в главном процессе).'#13+
'Для проверки окончания неблокирующей операции MPI\_Igatherv использовать'#13+
'функцию MPI\_Wait. Дополнительно для процессов четного ранга отобразить'#13+
'в разделе отладки продолжительность каждого вызова функции MPI\_Wait'#13+
'в миллисекундах; для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait'#13+
'и с помощью функции Show вывести разность возвращенных функцией'#13+
'MPI\_Wtime значений, умноженную на 1000.'#13+
'---'#13+*)
'A sequence of {R}~+~2 integers is given in each process of even rank, where'#13+
'the number {R} equals the rank of the process (process~0 has 2 numbers,'#13+
'process~2 has 4 numbers, and so on). Use the MPI\_Igatherv function'#13+
'for an appropriate communicator to send these numbers to master process.'#13+
'Output these numbers in ascending order of the ranks of the processes that'#13+
'sent them (first output the sequence of numbers given in the master process).'#13+
'Use MPI\_Wait function to check if MPI\_Igatherv non-blocking'#13+
'operation finishes. Additionally, display the duration of each call'#13+
'to the MPI\_Wait function in milliseconds for even-rank processes'#13+
'in the debug section; for this purpose, call MPI\_Wtime before and'#13+
'after MPI\_Wait and use the Show function to display the difference'#13+
'of the values returned by MPI\_Wtime multiplied by 1000.'
);
//-----------------
// Реализация задания
  InitShowRSmall;
  c := (n+1) div 2;
  for i := 1 to c do
    for j := 1 to i*2 do
    r[i,j] := Random(90) + 10;
  for i := 1 to c do
  begin
    SetProcess(2*(i-1));
    DataComment('Process '+Chr(2*(i-1)+48)+': ',22,i);
    for j := 1 to 2*i do
      DataN('', r[i,j], Center(j,5,2,1), i, 1);
  end;

  SetProcess(0);
  ResultComment('Process 0: ',0,2);
  for i := 1 to c do
    for j := 1 to i*2 do
      if c <> 5 then
      ResultN('', r[i,j], Center(i*(i-1)+j,(1+c)*c,2,1),3, 2)
      else if i <> 5 then
      ResultN('', r[i,j], Center(i*(i-1)+j,20,2,1),3, 2)
      else
      ResultN('', r[i,j], Center(j,10,2,1),4, 2);

//----------------
  rdeb[0] := 0.34;
  ShowDebR(0, 2 * (c - 1), 2, c + 1);
  SetTestCount(5);
end;

procedure MpiE4;
var i,n,y: integer;
r: array[1..5] of real;
begin
  n := 2*(Random(3)+3);
  CreateTask(Topic5, n);
  if n = 0 then exit;


TaskText(
(*'Количество процессов {K} является четным. В главном процессе дан набор'#13+
'из {K}/2 чисел. Используя функцию MPI\_Iscatter для подходящего коммуникатора,'#13+
'переслать по одному числу в каждый процесс четного ранга (включая главный)'#13+
'и вывести в каждом процессе полученное число; при этом числа надо пересылать'#13+
'в процессы в обратном порядке: первое число должно быть послано в последний'#13+
'процесс четного ранга, а последнее число~\= в процесс ранга~0.'#13+
'Для проверки окончания неблокирующей операции MPI\_Iscatter использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов'#13+
'четного ранга отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'The number of processes {K} is an even number. A sequence of {K}/2 real'#13+
'numbers is given in the master process. Use the MPI\_Iscatter function'#13+
'for an appropriate communicator to send a number to each process of even rank'#13+
'(including the master process) and output the received number in each'#13+
'process; the numbers must be sent to the processes in reverse order:'#13+
'the first number must be sent to the last process of even rank,'#13+
'the last number~\= to the process of rank~0.'#13+
'Use the MPI\_Test function to check if the MPI\_Iscatter non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it'#13+
'returns a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section for all even-rank'#13+
'processes using the Show function.'
);
//-----------------
// Реализация задани
  InitShowN;
  for i := 1 to n div 2 do
    r[i] := Random*89.99+10;
  y := 2;
  if n div 2 = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n div 2 do
  DataR('', r[n div 2-i+1], Center(i,n div 2,5,2), 3, 5);
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultR('Process '+Chr(2*i+48)+': ', r[i+1], 0, y+i, 5);
  end;
//----------------
  ndeb[0] := 1;
  ShowDebN(0, 2 * (n div 2 - 1), 2, 4);
  SetTestCount(5);
end;

procedure MpiE5;
var i,n,y,j: integer;
  r: array[1..7] of real;
begin
  n := 2*(Random(3)+3);
  CreateTask(Topic5, n);
  if n = 0 then exit;


TaskText(
(*'Количество процессов {K} является четным. В процессе ранга~1 дан набор'#13+
'из {K}/2~+~2 чисел. Используя функцию MPI\_Iscatterv для подходящего'#13+
'коммуникатора, переслать в каждый процесс нечетного ранга три числа'#13+
'из данного набора, при этом в процесс ранга~1 должны быть пересланы'#13+
'первые три числа, в процесс ранга~3~\= числа со второго по четвертое, и т.\,д.'#13+
'В каждом процессе вывести полученные числа.'#13+
'Для проверки окончания неблокирующей операции MPI\_Iscatterv'#13+
'использовать функцию MPI\_Wait. Дополнительно для процессов нечетного'#13+
'ранга отобразить в разделе отладки продолжительность каждого вызова'#13+
'функции MPI\_Wait в миллисекундах; для этого вызвать функцию MPI\_Wtime'#13+
'до и после MPI\_Wait и с помощью функции Show вывести разность '#13+
'возвращенных функцией MPI\_Wtime значений, умноженную на 1000.'#13+
'---'#13+*)
'The number of processes {K} is an even number. A sequence of {K}/2~+~2 real'#13+
'numbers is given in the process of rank~1. Using the MPI\_Iscatterv function'#13+
'for an appropriate communicator, send three numbers of given sequence'#13+
'to each process of odd rank, with the first three numbers sent to the process'#13+
'of rank~1, the second, the third and the fourth numbers sent to the process'#13+
'of rank~3, and so~on. Output the received numbers in each process.'#13+
'Use the MPI\_Wait function to check if the MPI\_Iscatterv non-blocking'#13+
'operation finishes. Additionally, display the duration of each call'#13+
'to the MPI\_Wait function in milliseconds for odd-rank processes'#13+
'in the debug section; for this purpose, call MPI\_Wtime'#13+
'before and after MPI\_Wait and use the Show function to display'#13+
'the difference of values returned by MPI\_Wtime multiplied by 1000.'
);
//-----------------
// Реализация задания
  InitShowR;
  for i := 1 to n div 2 + 2 do
      r[i] := Random*89.99+10;
  y := 2;
  if n div 2 = 5 then y := 1;
  SetProcess(1);
  DataComment('Process 1:',0,2);
  for i := 1 to n div 2+2 do
      DataR('', r[i], Center(i,n div 2+2,5,2), 3, 5);
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i+1);
    ResultComment('Process '+Chr(2*i+1+48)+': ',25,y+i);
    for j := i+1 to i+3 do
      ResultR('', r[j], Center(j-i,3,5,2) + 5, y+i, 5);
  end;
//----------------
  rdeb[1] := 0.03;
  ShowDebR(1, 2 * (n div 2 - 1) + 1, 2, 4);
  SetTestCount(5);
end;

procedure MpiE6;
var i,j,n,m,x: integer;
  A: array[1..10] of integer;
  B: array[1..10] of real;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;


TaskText(
(*'В каждом процессе дано целое число {N}, которое может принимать два значения:'#13+
'0 и 1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом процессе'#13+
'с {N}~=~1 дано вещественное число {A}. Используя функцию MPI\_Iallgather, переслать'#13+
'числа {A} во все процессы, для которых {N}~=~1, и вывести их в каждом процессе'#13+
'в порядке возрастания рангов переславших их процессов (включая число,'#13+
'полученное из этого же процесса).'#13+
'Для проверки окончания неблокирующей операции MPI\_Iallgather использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов'#13+
'с {N}~=~1 отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'An integer {N} is given in each process; the number {N} can take'#13+
'two values: 0 and 1 (there is at least one process with {N}~=~1).'#13+
'Also a real number {A} is given in each process with {N}~=~1.'#13+
'Use the MPI\_Iallgather function to send the number {A} to each process'#13+
'for which {N}~=~1 and output the numbers in each process in ascending'#13+
'order of the ranks of the processes that sent the numbers'#13+
'(including the number received from the same process).'#13+
'Use the MPI\_Test function to check if the MPI\_Iallgather non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it'#13+
'returns a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section for all processes'#13+
'with {N}~=~1 using the Show function.'
);
//-----------------
// Реализация задания
  InitShowN;
  x := Random(n)+1;
  A[x] := 1;
  m := 0;
  for i := 1 to n do
  begin
    if i <> x then A[i] := Random(2);
    if A[i] =1 then m := m+1;
  end;
  for i := 1 to m do
  B[i] := Random*89.99+10;
  j := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5+(i mod 2)*35,i div 2+1);
    DataN('N = ', A[i+1], 17+(i mod 2)*35, i div 2+1, 1);
    if A[i+1]<>0 then
    begin
    DataR('A = ', B[j], 25+(i mod 2)*35, i div 2+1, 5);
    j := j+1;
    end
    else
      ndeb[i] := 0;
  end;
  for i := 0 to n -1 do
  begin
    if A[i+1] = 1 then
      begin
        SetProcess(i);
        ResultComment('Process '+Chr(i+48)+': ',5,i+1);
        for j := 1 to m do
        ResultR('', B[j],10+6*j, i+1, 5);
      end;
  end;
  ShowDebN(0,  n - 1, 1, n div 2 + 2);
//----------------
  SetTestCount(5);
end;

procedure MpiE7;
var i,j,q,n,m,x,y,c: integer;
  A: array[1..10] of integer;
  B: array[1..10,1..10] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;


  TaskText(
(*'В каждом процессе дано целое число {N}, которое может принимать два значения:'#13+
'0 и 1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом процессе'#13+
'с {N}~=~1 дан набор {A} целых чисел, причем известно, что для первого процесса'#13+
'с {N}~=~1 набор {A} содержит одно число, для второго процесса с {N}~=~1 набор {A}'#13+
'содержит два числа, и т.\,д. Используя функцию MPI\_Iallgatherv, переслать'#13+
'наборы чисел {A} во все процессы, для которых {N}~=~1, и вывести их в каждом'#13+
'процессе в порядке возрастания рангов переславших их процессов (включая числа,'#13+
'полученные из этого же процесса).'#13+
'Для проверки окончания неблокирующей операции MPI\_Iallgatherv'#13+
'использовать функцию MPI\_Wait. Дополнительно для всех процессов с {N}~=~1'#13+
'отобразить в разделе отладки продолжительность каждого вызова функции'#13+
'MPI\_Wait в миллисекундах; для этого вызвать функцию MPI\_Wtime'#13+
'до и после MPI\_Wait и с помощью функции Show вывести разность'#13+
'возвращенных функцией MPI\_Wtime значений, умноженную на 1000.'#13+
'---'#13+*)
'An integer {N} is given in each process; the number {N} can take'#13+
'two values: 0 and 1 (there is at least one process with {N}~=~1).'#13+
'Also, a sequence {A} of integers is given in each process with {N}~=~1'#13+
'and it is known that the sequence {A} in the first process with {N}~=~1'#13+
'includes one number, the sequence {A} in the second process with {N}~=~1'#13+
'includes two numbers, and so on. Use the MPI\_Iallgatherv function to send'#13+
'the sequences of numbers {A} to all processes with {N}~=~1 and output'#13+
'the numbers in each process in ascending order of the ranks of the processes'#13+
'that sent them (including the numbers received from the same process).'#13+
'Use the MPI\_Wait function to check if the MPI\_Iallgatherv non-blocking'#13+
'operation finishes. Additionally, display the duration of each call'#13+
'of MPI\_Wait in milliseconds for all processes with {N}~=~1 in the debug section.'#13+
'For this purpose, call MPI\_Wtime before and after MPI\_Wait and use'#13+
'the Show function to display the difference of values returned'#13+
'by MPI\_Wtime multiplied by 1000.'
);
//----------------
// Реализация задания
  InitShowR;
  x := Random(n)+1;
  A[x] := 1;
  m := 0;
  for i := 1 to n do
  begin
    if i <> x then A[i] := Random(2);
    if A[i] =1 then m := m+1;
  end;
  for i := 1 to m do
  begin
    for j := 1 to i do
    B[i,j] := Random(90) + 10;
  end;
  y := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+':',1,i+1);
    DataN('N = ', A[i+1], 13, i+1, 1);
    if A[i+1]<>0 then
    begin
      y := y+1;
      DataComment('A:',21,i+1);
      for j := 1 to y do
      DataN('', B[y,j], j*3+21, i+1, 1);
    j := j+1;
    end
    else
      rdeb[i] := 0;
  end;
  c := ((1+m)*m) div 2;
  for i := 0 to n -1 do
  begin
    if A[i+1] = 1 then
      begin
        SetProcess(i);
        ResultComment('Process '+Chr(i+48)+': ',1,(c div 21+1)*i+1);
        for j := 1 to m do
        for q := 1 to j do
        ResultN('', B[j,q], 13+3*(((j*(j-1)) div 2+q-1) mod 21),1+(c div 21+1)*i+((j*(j-1)) div 2+q-1) div 21, 2);
      end;
  end;
  ShowDebR(0,  n - 1, 1, n + 1);
//----------------
  SetTestCount(5);
end;

procedure MpiE8;
var i,n,c0,j,k: integer;
  a: array[1..5,1..10] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе четного ранга дан набор из 2{K} целых чисел, где {K}~\='#13+
'количество процессов четного ранга. Используя функцию MPI\_Ialltoall,'#13+
'переслать в каждый процесс четного ранга два очередных числа из каждого набора'#13+
'(в главный процесс~\= первые два числа из каждого набора, в процесс ранга~2~\='#13+
'следующие два числа, и т.\,д.). В каждом процессе четного ранга вывести числа'#13+
'в порядке возрастания рангов переславших их процессов'#13+
'(включая числа, полученные из этого же процесса).'#13+
'Для проверки окончания неблокирующей операции MPI\_Ialltoall использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов'#13+
'четного ранга отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'A sequence of 2{K} integers is given in each process of even rank;'#13+
'{K} is the number of even-rank processes. Using the MPI\_Ialltoall function,'#13+
'send two elements of each given sequence to each process of even rank'#13+
'as follows: the initial two elements of each sequence should be sent'#13+
'to the master process, the next two elements of each sequence should be sent'#13+
'to the process of rank~2, and so~on. Output received numbers in each'#13+
'even-rank process in ascending order of ranks of sending processes'#13+
'(including the numbers received from the same process).'#13+
'Use the MPI\_Test function to check if the MPI\_Ialltoall non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it returns'#13+
'a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section for all even-rank'#13+
'processes using the Show function.'
);
  InitShowN;
  for i := 1 to (n+1) div 2 do
    for j := 1 to ((n+1) div 2) *2 do
      a[i,j] := Random(90) + 10;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataComment('Process '+Chr(2*i+48)+': ',14,1+i);
    for j := 1 to ((n+1) div 2) *2 do
      DataN('', a[i+1,j], Center(j,((n+1) div 2) *2,2,1), 1+i, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+': ',14,1+i);
    c0 := 0;
    for j := 1 to (n+1) div 2 do
      for k := 1 to 2 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,i*2+k], Center(c0,((n+1) div 2) *2,2,1), 1+i, 2);
      end;
  end;
  ShowDebN(0,  2*((n+1) div 2 - 1), 2, (n+1) div 2 + 1);
  SetTestCount(5);
end;


procedure MpiE9;
var i,n,j,k,c0,c: integer;
  a: array[1..10,1..15] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе нечетного ранга дан набор из {K}\,+\,1 целых чисел,'#13+
'где {K}~\= количество процессов нечетного ранга. Используя функцию'#13+
'MPI\_Ialltoallv, переслать в каждый процесс нечетного ранга два числа из'#13+
'каждого набора; при этом в процесс~1 надо переслать первые два числа,'#13+
'в процесс~3~\= второе и третье число, \., в последний процесс нечетного'#13+
'ранга~\= последние два числа каждого набора. В каждом процессе нечетного'#13+
'ранга вывести полученные числа в порядке возрастания рангов переславших их'#13+
'процессов (включая числа, полученные из этого же процесса).'#13+
'Для проверки окончания неблокирующей операции MPI\_Ialltoallv использовать'#13+
'функцию MPI\_Wait. Для всех процессов нечетного ранга отобразить в разделе'#13+
'отладки продолжительность каждого вызова функции MPI\_Wait в миллисекундах;'#13+
'для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait и с помощью'#13+
'функции Show вывести разность возвращенных функцией MPI\_Wtime значений,'#13+
'умноженную на 1000.'#13+
'---'#13+*)
'A sequence of {K}\,+\,1 integers is given in each process of odd rank; {K} is'#13+
'the number of odd-rank processes. Using the MPI\_Alltoallv function, send'#13+
'two elements of each given sequence to each odd-rank process as follows:'#13+
'the initial two elements of each sequence should be sent to the process~1,'#13+
'the second element and the third element of each sequence should be sent'#13+
'to the process~3, \., the last two elements of each sequence should be sent'#13+
'to the last odd-rank process. Output received numbers in each odd-rank process'#13+
'in ascending order of ranks of sending processes (including the numbers'#13+
'received from the same process).'#13+
'Use MPI\_Wait function to check if MPI\_Ialltoallv non-blocking operation'#13+
'finishes. Additionally, display the duration of each call to the MPI\_Wait'#13+
'function in milliseconds for all odd-rank processes in the debug section;'#13+
'for this purpose, call MPI\_Wtime before and after MPI\_Wait and use'#13+
'the Show function to display the difference of the values returned'#13+
'by MPI\_Wtime multiplied by 1000.'
);

  InitShowR;
  c := n div 2 + 1;
  for i := 1 to n div 2 do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for i := 1 to n div 2 do
  begin
    SetProcess(2 * i - 1);
    DataComment('Process '+Chr(2 * i + 47)+': ',14,i);
    for j := 1 to c do
      DataN('', a[i,j], Center(j,c,2,1), i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2 * i - 1);
    ResultComment('Process '+Chr(2 * i + 47)+': ',14,i);
    c0 := 0;
    for j := 1 to n div 2 do
      for k := 0 to 1 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,i+k], Center(c0,(n div 2)*2,2,1), i, 2);
      end;
  end;
  ShowDebR(1,  n div 2 * 2 - 1, 2, n div 2 + 1);
  SetTestCount(5);
end;



procedure MpiE10;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;


  TaskText(
(*'В каждом процессе четного ранга дан набор из {K}\,+\,5 чисел,'#13+
'где {K}~\= количество процессов четного ранга. Используя функцию'#13+
'MPI\_Ireduce для операции MPI\_MAX, найти максимальное значение среди'#13+
'элементов данных наборов с одним и тем же порядковым номером'#13+
'и вывести полученные максимумы в главном процессе.'#13+
'Для проверки окончания неблокирующей операции MPI\_Ireduce использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов'#13+
'четного ранга отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'A sequence of {K}\,+\,5 real numbers is given in each process of even rank;'#13+
'{K} is the number of even-rank processes. Find the maximal value'#13+
'among the elements of all given sequences with the same order number'#13+
'using the MPI\_Ireduce function with the MPI\_MAX operation.'#13+
'Output received maximal values in the master process.'#13+
'Use the MPI\_Test function to check if the MPI\_Ireduce non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop'#13+
'until it returns a non-zero flag. Additionally, display the number'#13+
'of required loop iterations with MPI\_Test calls in the debug section'#13+
'for all even-rank processes using the Show function.'
);
  InitShowNSmall;
  c := (n+1) div 2 + 5;
  for i := 1 to (n+1) div 2 do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataComment('Process '+Chr(2*i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to (n+1) div 2 do
    for j := 1 to c do
      if a[i,j] > a[1,j] then
        a[1,j] := a[i,j];
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,4,1), 3, 4);
  ndeb[0] := 249;
  ShowDebN(0,  2 * ((n+1) div 2 - 1), 2, (n+1) div 2 + 3);
  SetTestCount(5);
end;


procedure MpiE11;
var i,n,j,y,x,m: integer;
  a, a1: array[1..12,1..12] of real;
  B: array[1..12] of integer;
  max: real;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе дано целое число {N}, которое может принимать два значения:'#13+
'0 и 1 (имеется хотя бы один процесс с {N}~=~1). Кроме того, в каждом процессе'#13+
'с {N}~=~1 дан набор из {K} чисел, где {K}~= количество процессов с {N}~=~1.'#13+
'Используя функцию MPI\_Iallreduce для операции MPI\_PROD, перемножить'#13+
'элементы данных наборов с одним и тем же порядковым номером и вывести'#13+
'полученные произведения во всех процессах с {N}~=~1.'#13+
'Для проверки окончания неблокирующей операции MPI\_Iallreduce использовать'#13+
'функцию MPI\_Wait. Дополнительно для всех процессов с {N}~=~1 отобразить'#13+
'в разделе отладки продолжительность каждого вызова функции MPI\_Wait'#13+
'в миллисекундах; для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait'#13+
'и с помощью функции Show вывести разность возвращенных функцией'#13+
'MPI\_Wtime значений, умноженную на 1000.'#13+
'---'#13+*)
'An integer {N} is given in each process; the number {N} can take'#13+
'two values: 0 and 1 (there is at least one process with {N}~=~1). Also'#13+
'a sequence of {K} real numbers, where {K} is the number of processes with {N}~=~1,'#13+
'is given in each process with {N}~=~1. Find products of elements'#13+
'of all given sequences with the same order number using the MPI\_Iallreduce'#13+
'function with the MPI\_PROD operation. Output received products'#13+
'in each process with {N}~=~1.'#13+
'Use the MPI\_Wait function to check if the MPI\_Iallreduce non-blocking'#13+
'operation finishes. Additionally, display the duration of each call of'#13+
'MPI\_Wait in milliseconds for all processes with {N}~=~1 in the debug section.'#13+
'For this purpose, call MPI\_Wtime before and after MPI\_Wait'#13+
'and use the Show function to display the difference'#13+
'of values returned by MPI\_Wtime multiplied by 1000.'
);
  InitShowR;
  x := Random(n)+1;
  while true do
  begin
  B[x] := 1;
  m := 0;
  for i := 1 to n do
  begin
    if i <> x then B[i] := Random(2);
    if B[i] =1 then m := m+1;
  end;
  if m > 9 then continue;


  for i := 1 to m do
    for j := 1 to m do
      a[i,j] := Random*1.5+1;
  for j := 1 to m do
      a1[1,j] := a[1,j];
  for i := 2 to m do
    for j := 1 to m do
      a1[1,j] := a1[1,j] * a[i,j];
  max := 0;
  for j := 1 to m do
    if a1[1,j] > max then
      max := a1[1,j];
  if max <= 99.9 then
    break;

  end;
  y := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',10,1+i);
    DataN('N = ', B[i+1], 22, i+1, 1);
    if B[i+1]=1 then
    begin
      y := y + 1;
      for j := 1 to m do
      DataR('', a[y,j],23+5*j, 1+i, 5);
    end
    else
      rdeb[i] := 0;
  end;
  for i := 0 to n - 1 do
  begin
    if B[i+1]=1 then
    begin
      SetProcess(i);
      ResultComment('Process '+Chr(i+48)+': ',10,1+i);
      for j := 1 to m do
      ResultR('', a1[1,j], 15+6*j, 1+i, 6);
    end;
  end;
  ShowDebR(0,  n - 1, 1, n + 1);
  SetTestCount(5);
end;


procedure MpiE12;
var i,n,j,c,k: integer;
  a: array[1..10,1..20] of integer;
begin
  n := 2*(2*(Random(4)+1)+1);
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'Количество процессов равно 2{K}, причем известно, что число {K} является нечетным.'#13+
'В каждом процессе ранга от 0 до {K} дан набор из {N}~целых чисел,'#13+
'где {N}~=~3(1\,+\,{K})/2. Используя функцию MPI\_Ireduce\_scatter, просуммировать'#13+
'элементы данных наборов с одним и тем же порядковым номером и переслать'#13+
'полученные суммы в процессы ранга от 0 до {K} следующим образом: первые две'#13+
'суммы~\= в процесс~0, третью сумму~\= в процесс~1, четвертую и пятую сумму~\='#13+
'в процесс~2, шестую сумму~\= в процесс~3, и т.\,д. (в процессы  четного ранга'#13+
'пересылаются по две очередные суммы, а в процессы нечетного ранга~\='#13+
'по одной). Вывести в каждом процессе полученные суммы.'#13+
'Для проверки окончания неблокирующей операции MPI\_Ireduce\_scatter'#13+
'использовать функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле'#13+
'до тех пор, пока она не вернет ненулевой флаг. Дополнительно для всех'#13+
'процессов с рангами от 0 до {K} отобразить в разделе отладки потребовавшееся'#13+
'количество итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'The number of processes is 2{K}, and it is known that the number {K} is odd.'#13+
'A sequence of {N}~integers is given in each process with ranks from 0 to {K},'#13+
'where {N}~=~3(1\,+\,{K})/2. Using the MPI\_Ireduce\_scatter function, find sums'#13+
'of elements of all given sequences with the same order number and send sums'#13+
'to processes with ranks from 0 to {K} as follows: the first two sums should'#13+
'be sent to the process~0, the third sum should be sent to the process~1,'#13+
'the fourth and the fifth sum should be sent to the process~2,'#13+
'the sixth sum should be sent to the process~3, and so~on (two sums are sent'#13+
'to the even-rank processes and one sum is sent to the odd-rank processes).'#13+
'Output the received sums in each process.'#13+
'Use the MPI\_Test function to check if the MPI\_Ireduce\_scatter non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it returns'#13+
'a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section for processes'#13+
'with ranks from 0 to {K} using the Show function.'
);
  InitShowN;
//DataN('2K = ', n, 1, 1, 2);
c := 3 * (1 + n div 2) div 2;
//DataN('N = ', c, 1, 2, 2);
k := n div 2;
//DataN('K = ', k, 1, 3, 2);
  for i := 1 to k+1 do
    for j := 1 to c do
      a[i,j] := Random(90)+10;
  for i := 0 to k do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',7,1+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), 1+i, 3);
  end;
  for i := 2 to k+1 do
    for j := 1 to c do
    a[1,j] := a[1,j] + a[i,j];
  for i := 0 to k div 2 do
  begin
    SetProcess(2*i);
    ResultN2('Process '+Chr(2*i+48)+':', a[1,3*i+1], a[1,3*i+2], xLeft, 1+i, 5);
    SetProcess(2*i + 1);
    ResultN('Process '+Chr(2*i+49)+':', a[1,3*i+3], xRight, 1+i, 5);
  end;
  ShowDebN(0,  k, 1, k + 2);
  SetTestCount(5);
end;


procedure MpiE13;
var i,n,j,c: integer;
  a: array[1..5,1..20] of integer;
begin
  n := Random(5)+6;
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе четного ранга дан набор из 3{K}~целых чисел,'#13+
'где {K}~\= количество процессов четного ранга. Используя функцию'#13+
'MPI\_Ireduce\_scatter\_block, просуммировать элементы данных наборов'#13+
'с одним и тем же порядковым номером, переслать по три полученных суммы'#13+
'в каждый процесс четного ранга (первые три суммы~\= в процесс~0, следующие три'#13+
'суммы~\= в процесс~2, и т.\,д.) и вывести в каждом процессе полученные суммы.'#13+
'Для проверки окончания неблокирующей операции MPI\_Ireduce\_scatter\_block'#13+
'использовать функцию MPI\_Wait. Дополнительно для всех процессов с четными'#13+
'рангами отобразить в разделе отладки продолжительность каждого вызова функции'#13+
'MPI\_Wait в миллисекундах; для этого вызвать функцию MPI\_Wtime до и после'#13+
'MPI\_Wait и с помощью функции Show вывести разность возвращенных функцией'#13+
'MPI\_Wtime значений, умноженную на 1000.'#13+

'\P\SПримечание\s. Соответствующая блокирующая коллективная функция'#13+
'MPI\_Reduce\_scatter\_block появилась в стандарте MPI-2. Она упрощает'#13+
'раcпределение результатов редукции по различным процессам (по сравнению'#13+
'с функцией MPI\_Reduce\_scatter), если в каждый процесс требуется передать'#13+
'набор данных одного и того же размера.'#13+

'---'#13+*)
'A sequence of 3{K}~integers is given in each process of even rank; {K} is'#13+
'the number of even-rank processes. Using the MPI\_Ireduce\_scatter\_block'#13+
'function, find sums of elements of all given sequences with the same order'#13+
'number and send three sums to each even-rank process as follows: the first'#13+
'three sums should be sent to the process~0, the next three sums should be sent'#13+
'to the process~2, and so~on. Output the received sums in each process.'#13+
'Use the MPI\_Wait function to check if the MPI\_Ireduce\_scatter\_block'#13+
'non-blocking operation finishes. Additionally, display the duration'#13+
'of each call of MPI\_Wait in milliseconds for all even-rank processes'#13+
'in the debug section. For this purpose, call MPI\_Wtime before and after'#13+
'MPI\_Wait and use the Show function to display the difference'#13+
'of values returned by MPI\_Wtime multiplied by 1000.'#13+
'\P\SNote\s. The corresponding blocking collective function'#13+
'MPI\_Reduce\_scatter\_block appeared in the MPI-2 standard. It simplifies'#13+
'the distribution of reduction results to different processes (compared'#13+
'to the MPI\_Reduce\_scatter function) if each process must receive'#13+
'a reduction dataset of the same size.'

);
  InitShowR;
  c := 3*((n+1) div 2);
  for i := 1 to (n+1) div 2 do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataComment('Process '+Chr(2*i+48)+': ',6,1+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), 1+i, 2);
  end;
  for i := 2 to (n+1) div 2 do
    for j := 1 to c do
    a[1,j] := a[1,j] + a[i,j];
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN3('Process '+Chr(2*i+48)+':', a[1,3*i+1], a[1,3*i+2], a[1,3*i+3], 0, 1+i, 5);
  end;
  ShowDebR(0, 2 * ((n+1) div 2 - 1), 2, (n+1) div 2 + 2);
  SetTestCount(5);
end;







procedure MpiE14;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := 2*(Random(3)+3);
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе четного ранга дан набор из {K}\,+\,5 целых чисел, где 2{K}~\='#13+
'количество процессов. Используя функцию MPI\_Iscan, найти в процессе четного'#13+
'ранга~{R} ({R}~=~0, 2,~\., 2{K}\,\-\,2) максимальные значения среди элементов'#13+
'с одним и тем же порядковым номером для наборов, данных в процессах'#13+
'с рангами~0, 2,~\., {R}, и вывести в каждом процессе найденные максимумы.'#13+
'Для проверки окончания неблокирующей операции MPI\_Iscan использовать'#13+
'функцию MPI\_Test; вызов функции MPI\_Test повторять в цикле до тех пор,'#13+
'пока она не вернет ненулевой флаг. Дополнительно для всех процессов с четными'#13+
'рангами отобразить в разделе отладки потребовавшееся количество'#13+
'итераций цикла с вызовами MPI\_Test, используя функцию Show.'#13+
'---'#13+*)
'A sequence of {K}\,+\,5 integers is given in each even-rank process; 2{K} is'#13+
'the number of processes. Using the MPI\_Iscan function, find maximal values'#13+
'among elements of given sequences with the same order number as follows:'#13+
'the maximal values of elements of sequences given in the processes of even'#13+
'ranks~0, 2,~\., {R} should be found in the process~{R} ({R}~=~0, 2,~\., 2{K}\,\-\,2).'#13+
'Output received data in each process.'#13+
'Use the MPI\_Test function to check if the MPI\_Iscan non-blocking'#13+
'operation finishes; call the MPI\_Test function in a loop until it returns'#13+
'a non-zero flag. Additionally, display the number of required loop'#13+
'iterations with MPI\_Test calls in the debug section'#13+
'for even-rank processes using the Show function.'
);
  InitShowN;
  c := n div 2 + 5;
  for i := 1 to n div 2 do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for j := 1 to c do
    b[j] := 0;
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i);
    DataComment('Process '+Chr(2*i+48)+': ',14,1+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), 1+i, 2);
  end;
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+': ',14,1+i);
    for j := 1 to c do
    begin
      if a[i+1,j] > b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), 1+i, 2);
    end;
  end;
  ShowDebN(0, 2 * (n div 2 - 1), 2, n div 2 + 2);
  SetTestCount(5);
end;

procedure MpiE15;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := 2*(Random(3)+3);
  CreateTask(Topic5, n);
  if n = 0 then exit;
  TaskText(
(*'В каждом процессе нечетного ранга дан набор из {K}\,+\,5 целых чисел, где 2{K}~\='#13+
'количество процессов. Используя функцию MPI\_Iexscan, найти в процессах'#13+
'нечетного ранга~{R}, начиная с ранга~3 ({R}~=~3, 5,~\., 2{K}\,\-\,1), минимальные'#13+
'значения среди элементов с одним и тем же порядковым номером для наборов,'#13+
'данных в процессах с нечетными рангами~1, 3,~\., {R}\,\-\,2, и вывести'#13+
'в процессах ранга~{R} найденные минимумы.'#13+
'Для проверки окончания неблокирующей операции MPI\_Iexscan использовать'#13+
'функцию MPI\_Wait. Дополнительно для процессов нечетного ранга отобразить'#13+
'в разделе отладки продолжительность каждого вызова функции MPI\_Wait'#13+
'в миллисекундах; для этого вызвать функцию MPI\_Wtime до и после MPI\_Wait'#13+
'и с помощью функции Show вывести разность возвращенных функцией MPI\_Wtime'#13+
'значений, умноженную на 1000.'#13+

'\P\SПримечание\s. Соответствующая блокирующая коллективная функция MPI\_Exscan'#13+
'(\<exclusive scan\>) появилась в стандарте MPI-2. Она является более'#13+
'универсальной, чем функция MPI\_Scan, так как позволяет промоделировать функцию'#13+
'MPI\_Scan (\<inclusive scan\>) без выполнения дополнительных коллективных'#13+
'операций (достаточно после применения функции MPI\_Exscan вызвать локальную'#13+
'функцию MPI\_Reduce\_local, которая также появилась в стандарте MPI-2).'#13+
'Следует заметить, что обратное действие (моделирование функции MPI\_Exscan'#13+
'с помощью функции MPI\_Scan) возможно не для всех операций редукции'#13+
'(в частности, такое действие невозможно для операций'#13+
'нахождения минимума или максимума).'#13+

'---'#13+*)
'A sequence of {K}\,+\,5 integers is given in each odd-rank process; 2{K} is'#13+
'the number of processes. Using the MPI\_Iexscan function, find minimal values'#13+
'among elements of given sequences with the same order number as follows:'#13+
'the minimal values of elements of sequences given in the processes of odd'#13+
'ranks~1, 3,~\., {R}\,\-\,2 should be found in the process of rank~{R},'#13+
'{R}~=~3, 5,~\., 2{K}\,\-\,1). Output received data in processes of rank {R}.'#13+
'Use MPI\_Wait function to check if MPI\_Iexscan non-blocking operation finishes.'#13+
'Additionally, display the duration of each call to the MPI\_Wait function'#13+
'in milliseconds for even-rank processes in the debug section; for this'#13+
'purpose, call MPI\_Wtime before and after MPI\_Wait and use the Show'#13+
'function to display the difference of the values returned by MPI\_Wtime'#13+
'multiplied by 1000.'#13+

'\P\SNote\s. The corresponding blocking collective function MPI\_Exscan'#13+
'(\<exclusive scan\>) appeared in the MPI-2 standard. It is more general than'#13+
'the MPI\_Scan function, because it allows to model the MPI\_Scan function'#13+
'(\<inclusive scan\>) without performing additional collective operations'#13+
'(it is enough, after applying the MPI\_Exscan function, to call the local'#13+
'function MPI\_Reduce\_local, which also appeared in the MPI-2 standard).'#13+
'It should be noted that the inverse action (modeling the MPI\_Exscan function'#13+
'with the MPI\_Scan function) is not possible for some reduction operations'#13+
'(in particular, such action is not possible for the operations'#13+
'of finding the minimum or maximum).'

);
  InitShowR;
  c := n div 2 + 5;
  for i := 1 to n div 2 do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for j := 1 to c do
    b[j] := 10000;
  for i := 0 to n div 2 - 1 do
  begin
    SetProcess(2*i + 1);
    DataComment('Process '+Chr(2*i+49)+': ',14,1+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), 1+i, 2);
  end;
  for i := 0 to n div 2 - 2 do
  begin
    SetProcess(2*i+3);
    ResultComment('Process '+Chr(2*i+51)+': ',14,1+i);
    for j := 1 to c do
    begin
      if a[i+1,j] < b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), 1+i, 2);
    end;
  end;
  ShowDebR(3, 2 * (n div 2 - 1) + 1, 2, n div 2 + 2);
  SetTestCount(5);
end;


//2023<


procedure InitTask(num: integer); stdcall;
begin
  case num of
  {
//  1: MpiA1;
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
 57: MpiD10;
 58: MpiE1;
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
 }
 1: MpiG1;
 2: MpiG2;
 3: MpiG3;
 4: MpiG4;
 5: MpiG5;
 6: MpiG6;
 7: MpiG7;
 8: MpiG8;
 9: MpiG9;
 10: MpiG10;
 11: MpiG11;
 12: MpiG12;
 13: MpiH1;
 14: MpiH2;
 15: MpiH3;
 16: MpiH4;
 17: MpiH5;
 18: MpiH6;
 19: MpiH7;
 20: MpiH8;
 21: MpiH9;
 22: MpiH10;
 23: MpiH11;
 24: MpiH12;
 25: MpiH13;
 26: MpiH14;
 27: MpiH15;
 28: MpiH16;
 29: MpiH17;
 30: MpiH18;
 31: MpiH19a;
 32: MpiH20a;

//2023>
 33: MpiE1;
 34: MpiE2;
 35: MpiE3;
 36: MpiE4;
 37: MpiE5;
 38: MpiE6;
 39: MpiE7;
 40: MpiE8;
 41: MPIE9;
 42: MPIE10;
 43: MPIE11;
 44: MPIE12;
 45: MPIE13;
 46: MPIE14;
 47: MPIE15;
//2023<

  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI5Comm', 'Process groups and communicators',
  'M. E. Abramyan, 2014,2017,2023', 'sddfgfsjnbvvdfsd78fgfgd', 47, InitTask);
//  CommentText('Если количество процессов в задании не определено, то можно считать, что это количество не превосходит~12.');
//  CommentText('Под \Iглавным процессом\i всюду в формулировках заданий понимается');
//  CommentText('Процесс ранга~0 для коммуникатора MPI\_COMM\_WORLD. Для всех процессов ненулевого ранга в заданиях используется');
//  CommentText('общее наименование \Iподчиненных процессов\i.');
//  CommentText('\PЕсли в задании не указан тип обрабатываемых чисел, то числа считаются вещественными.');
//  CommentText('Если в задании не определяется максимальный размер набора чисел, то его следует считать равным~10.');
end;

//exports inittaskgroup;   //---------------------------------------------------

begin
end.
