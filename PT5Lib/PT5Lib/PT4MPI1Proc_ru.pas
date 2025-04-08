{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI1Proc_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;


const DebugSec = 'Содержимое раздела отладки должно быть следующим:';

procedure MpiA1;
var i,n,y: integer;
    d: real;
    s: string;
begin
  n := Random(3)+3;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом из процессов, входящих в коммуникатор MPI\_COMM\_WORLD,',0,1);
  TaskText('прочесть одно вещественное число {X} и вывести его противоположное значение \-{X}.',0,2);
  TaskText('Для ввода и вывода данных использовать поток ввода-вывода pt,',0,3);
  TaskText('определенный в задачнике. Кроме того, отобразить значение \-{X}',0,4);
  TaskText('в разделе отладки, используя функцию Show, также определенную в задачнике.',0,5);
  y := 1;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random*199.99-100;
    DataR('Процесс '+Chr(i+48)+': ', d, 0, y+i, 6);
    ResultR('Процесс '+Chr(i+48)+': ', -d, 0, y+i, 6);
    Str(-d:0:2, s);
    DataComment(' '+IntToStr(i)+'|  1>  '+s, 1, n+2+i);
  end;
  DataComment(DebugSec, 1, n+1);
  SetTestCount(5);
end;



procedure MpiA2;
var i,n,y: integer;
    d, d0: integer;
begin
  n := Random(3)+3;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом из процессов, входящих в коммуникатор MPI\_COMM\_WORLD,',0,1);
  TaskText('прочесть одно целое число {A} и вывести его удвоенное значение.',0,2);
  TaskText('Кроме того, для \Iглавного процесса\i (процесса ранга~0)',0,3);
  TaskText('вывести количество процессов, входящих в коммуникатор MPI\_COMM\_WORLD.',0,4);
  TaskText('Для ввода и вывода данных использовать поток ввода-вывода pt.',0,5);
  TaskText('В главном процессе продублировать вывод данных в разделе отладки,',0,0);
  TaskText('отобразив на отдельных строках удвоенное значение {A} и количество',0,0);
  TaskText('процессов (использовать два вызова функции ShowLine, определенной',0,0);
  TaskText('в задачнике наряду с функцией Show).',0,0);
  y := 1;
  d0 := Random(40)+10;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random(40)+10;
    DataN('Процесс '+Chr(i+48)+':  A = ', d, 0, y+i, 2);
    if i > 0 then
    ResultN('Процесс '+Chr(i+48)+': ', 2*d, 0, y+i, 2)
    else
    begin
    d0 := d;
    ResultN2('Процесс '+Chr(i+48)+': ', 2*d0, n, 34, y+i, 2);
    end;
  end;
  DataComment(DebugSec, 1, n+2);
  DataComment(' '+IntToStr(0)+'|  1>  '+IntToStr(2*d0), 1, n+3);
  DataComment(' '+IntToStr(0)+'|  2>  '+IntToStr(n), 1, n+4);
  SetTestCount(5);
end;

procedure MpiA3;
var i,n,y: integer;
    d: real;
    s: string;
begin
  n := Random(3)+3;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В главном процессе прочесть вещественное число {X} и вывести',0,1);
  TaskText('его противоположное значение, в каждом из остальных процессов',0,2);
  TaskText('(\Iподчиненных процессов\i, ранг которых больше~0) вывести его ранг.',0,3);
  TaskText('Кроме того, продублировать вывод данных в разделе отладки,',0,4);
  TaskText('отобразив значение \-{X} с комментарием \<-X=\>, а значения рангов',0,5);
  TaskText('с комментариями \<rank=\> (использовать функцию Show с двумя параметрами).',0,0);
  y := 1;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    if i > 0 then
    begin
    ResultN('Процесс '+Chr(i+48)+': ', i, 0, y+i, 6);
    DataComment(' '+IntToStr(i)+'|  1>  rank='+IntToStr(i), 1, 3+i);
    end
    else
    begin
      d := Random*199.99-100;
      DataR('Процесс '+Chr(i+48)+':  X = ', d, 0, 1, 6);
      ResultR('Процесс '+Chr(i+48)+': ', -d, 0, y+i, 6);
      Str(-d:0:2, s);
      DataComment(' '+IntToStr(i)+'|  1>  -X='+s, 1, 3+i);
    end;
  end;
  DataComment(DebugSec, 1, 2);
  SetTestCount(5);
end;

procedure MpiA4;
var i,n,y: integer;
    d: integer;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В процессах четного ранга (включая главный) ввести целое число',0,2);
  TaskText('и вывести его удвоенное значение. В процессах нечетного ранга',0,3);
  TaskText('не выполнять никаких действий.',0,4);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    DataN('Процесс '+Chr(2*i+48)+': ', d, 0, y+i, 2);
    ResultN('Процесс '+Chr(2*i+48)+': ', 2*d, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiA5;
var i,n,y: integer;
    d: integer;
    r: real;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В процессах четного ранга (включая главный) ввести целое число,',0,2);
  TaskText('в процессах нечетного ранга ввести вещественное число.',0,3);
  TaskText('В каждом процессе вывести удвоенное значение введенного числа.',0,4);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    DataN('Процесс '+Chr(2*i+48)+': ', d, xLeft, y+i, 2);
    ResultN('Процесс '+Chr(2*i+48)+': ', 2*d, xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 39.98*Random+10;
    DataR('Процесс '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    ResultR('Процесс '+Chr(2*i-1+48)+': ', 2*r, xRight, y+i-1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA6;
var i,n,y,y1: integer;
    d: integer;
    r: real;
begin
  n := Random(5)+6;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В подчиненных процессах четного ранга ввести целое число,',0,2);
  TaskText('в процессах нечетного ранга ввести вещественное число.',0,3);
  TaskText('В каждом подчиненном процессе вывести удвоенное значение введенного числа.',0,4);
  TaskText('В главном процессе не выполнять никаких действий.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    y1 := y+i;
    if (n-1) mod 4 <> 0 then
      y1 := y1 - 1;
    DataN('Процесс '+Chr(2*i+48)+': ', d, xRight, y1, 2);
    ResultN('Процесс '+Chr(2*i+48)+': ', 2*d, xRight, y1, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 39.98*Random+10;
    y1 := y+i;
    if (n-1) mod 4 <> 0 then
      y1 := y1 - 1;
    DataR('Процесс '+Chr(2*i-1+48)+': ', r, xLeft, y1, 5);
    ResultR('Процесс '+Chr(2*i-1+48)+': ', 2*r, xLeft, y1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA7;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом процессе четного ранга (включая главный)',0,2);
  TaskText('дано целое число~{N} (>\,0) и набор из {N} вещественных чисел.',0,3);
  TaskText('Вывести в каждом из этих процессов сумму чисел из данного набора.',0,4);
  TaskText('В процессах нечетного ранга не выполнять никаких действий.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    s := 0;
    DataN('Процесс '+Chr(2*i+48)+': N = ', k, 21, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 28+5*(j+1), y+i, 5);
    end;
    ResultR('Процесс '+Chr(2*i+48)+': ', s, 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA8;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N} (>\,0) и набор',0,1);
  TaskText('из {N} вещественных чисел. В процессах четного ранга',0,2);
  TaskText('(включая главный) вывести сумму чисел из данного набора,',0,3);
  TaskText('в процессах нечетного ранга вывести среднее арифметическое',0,4);
  TaskText('чисел из данного набора.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    s := 0;
    DataN('Процесс '+Chr(2*i+48)+': N = ', k, 3, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 10+5*(j+1), y+i, 5);
    end;
    ResultR('Процесс '+Chr(2*i+48)+': ', s, 14, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    k := 1 + Random(4);
    s := 0;
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', k, 41, y+i-1, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 48+5*(j+1), y+i-1, 5);
    end;
    ResultR('Процесс '+Chr(2*i-1+48)+': ', s/k, 52, y+i-1, 1);
  end;
  SetTestCount(5);
end;

procedure MpiA9;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N} (>\,0) и набор',0,1);
  TaskText('из {N} вещественных чисел. В подчиненных процессах четного ранга',0,2);
  TaskText('вывести сумму чисел из данного набора, в процессах нечетного ранга',0,3);
  TaskText('вывести среднее арифметическое чисел из данного набора,',0,4);
  TaskText('в главном процессе вывести произведение чисел из данного набора.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    if i = 0 then
      s := 1
    else
      s := 0;
    DataN('Процесс '+Chr(2*i+48)+': N = ', k, 3, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    if i = 0 then
      s := s * r
    else
      s := s + r;
    DataR('', r, 9+5*(j+1), y+i, 5);
    end;
    ResultR('Процесс '+Chr(2*i+48)+': ', s, 14, y+i, 7);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    k := 1 + Random(4);
    s := 0;
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', k, 41, y+i-1, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 48+5*(j+1), y+i-1, 5);
    end;
    ResultR('Процесс '+Chr(2*i-1+48)+': ', s/k, 52, y+i-1, 1);
  end;
  SetTestCount(5);
end;

procedure MpiA9a;
var i,n,y,k,j: integer;
    r,s: real;
    r0,s0: integer;
begin
  n := Random(6)+5;
  CreateTask('Процессы и их ранги', n);
  if n = 0 then exit;
TaskText(
 'В каждом процессе дано целое число~{N} (>\,0) и набор из {N}~чисел,'#13#10
+'причем в подчиненных процессах нечетного ранга (1, 3,~\.) набор содержит'#13#10
+'вещественные числа, в подчиненных процессах четного ранга (2, 4,~\.) \='#13#10
+'целые числа, а тип элементов в главном процессе зависит от общего количества'#13#10
+'процессов: если количество процессов нечетное, то набор содержит целые числа,'#13#10
+'а если четное, то вещественные. В процессах четного ранга (включая главный)'#13#10
+'вывести минимальный элемент из данного набора, в процессах нечетного ранга'#13#10
+'вывести максимальный элемент.'
);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 2 + Random(5);
    s := 100;
    s0 := 100;
    DataN('Процесс '+Chr(2*i+48)+': N = ', k, 3, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    r0 := RandomN(10, 99);
    if s > r then
      s := r;
    if s0 > r0 then
      s0 := r0;
    if (i > 0) or Odd(n) then
      DataN('', r0, 14+3*(j+1), y+i, 3)
    else
      DataR('', r, 10+5*(j+1), y+i, 5);
    end;
    if (i > 0) or Odd(n) then
      ResultN('Процесс '+Chr(2*i+48)+': ', s0, 14, y+i, 4)
    else
      ResultR('Процесс '+Chr(2*i+48)+': ', s, 14, y+i, 3);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    k := 2 + Random(3);
    s := 0;
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', k, 41, y+i-1, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    if s < r then
      s := r;
    DataR('', r, 48+5*(j+1), y+i-1, 5);
    end;
    ResultR('Процесс '+Chr(2*i-1+48)+': ', s, 52, y+i-1, 1);
  end;
  SetTestCount(5);
end;

(*
procedure MpiB1;
var i,n,y: integer;
    d: integer;
begin
  n := Random(3)+4;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя функции MPI\_Send и MPI\_Recv',0,2);
  TaskText('(стандартные блокирующие функции для передачи и приема сообщения),',0,3);
  TaskText('и вывести их в главном процессе. Полученные числа выводить',0,4);
  TaskText('в порядке возрастания рангов переславших их процессов.',0,5);
  y := 1;
  if n = 6 then y := 0;
  ResultComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random(90)+10;
    DataN('Процесс '+Chr(i+48)+': ', d, 0, y+i, 2);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано вещественное число. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя функции MPI\_Bsend (посылка сообщения',0,2);
  TaskText('с буферизацией) и MPI\_Recv, и вывести их в главном процессе. Полученные',0,3);
  TaskText('числа выводить в порядке убывания рангов переславших их процессов.',0,4);
  TaskText('Для задания буфера использовать функцию MPI\_Buffer\_attach.',0,5);
  y := 1;
  if n = 6 then y := 0;
  ResultComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    DataR('Процесс '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе даны четыре целых числа. Переслать эти числа',0,1);
  TaskText('в главный процесс, используя по одному вызову функции MPI\_Send',0,2);
  TaskText('для каждого передающего процесса, и вывести их в главном процессе.',0,3);
  TaskText('Полученные числа выводить в порядке возрастания',0,4);
  TaskText('рангов переславших их процессов.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    DataComment('Процесс '+Chr(i+48)+': ',30,y+i);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число~{N} (0~<~{N}~<~5) и набор из',0,1);
  TaskText('{N}~целых чисел. Переслать данные наборы в главный процесс, используя по одному',0,2);
  TaskText('вызову функции MPI\_Bsend для каждого передающего процесса, и вывести наборы',0,3);
  TaskText('в главном процессе в порядке возрастания рангов переславших их процессов. Для',0,4);
  TaskText('определения размера пересланного набора использовать функцию MPI\_Get\_count.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('Процесс 0: ',0,2);
  k0 := 0;
  for i := 1 to n-1 do
  begin
    k[i] := Random(4)+1;
    k0 := k0 + k[i]
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('Процесс '+Chr(i+48)+': N = ',k[i], 23, y+i, 1);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор вещественных чисел; количество чисел',0,1);
  TaskText('равно количеству подчиненных процессов. С помощью функции MPI\_Send',0,2);
  TaskText('переслать по одному числу в каждый из подчиненных процессов',0,3);
  TaskText('(первое число в процесс~1, второе~\= в процесс~2, и т.\,д.)',0,4);
  TaskText('и вывести в подчиненных процессах полученные числа.',0,5);
  y := 1;
  if n = 6 then y := 0;
  DataComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('Процесс '+Chr(i+48)+': ', d, 0, y+i, 5);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор вещественных чисел; количество чисел равно',0,1);
  TaskText('количеству подчиненных процессов. С помощью функции MPI\_Bsend переслать',0,2);
  TaskText('по одному числу в каждый из подчиненных процессов, перебирая процессы в',0,3);
  TaskText('обратном порядке (первое число в последний процесс, второе~\= в предпоследний',0,4);
  TaskText('процесс, и т.\,д.), и вывести в подчиненных процессах полученные числа.',0,5);
  y := 1;
  if n = 6 then y := 0;
  DataComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    ResultR('Процесс '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В главном процессе дано целое число~{N} и набор из {N}~чисел; {K}\,\-\,1~\l~{N}~<~10,',0,1);
  TaskText('где {K}~\= количество процессов. С помощью функции MPI\_Send переслать',0,2);
  TaskText('по одному числу их данного набора в процессы~1, 2,~\., {K}\,\-\,2, а оставшиеся',0,3);
  TaskText('числа~\= в процесс~{K}\,\-\,1, и вывести полученные числа. В процессе~{K}\,\-\,1 для',0,4);
  TaskText('определения количества полученных чисел использовать функцию MPI\_Get\_count.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := Random(5) + n - 1;
  DataN('Процесс 0: N = ',c,0,2,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('Процесс '+Chr(i+48)+': ', d, 0, y+i, 5);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число, причем только для одного',0,1);
  TaskText('процесса это число отлично от нуля. Переслать ненулевое число в главный',0,2);
  TaskText('процесс и вывести в главном процессе полученное число и ранг процесса,',0,3);
  TaskText('переславшего это число. Для приема сообщения в главном процессе',0,4);
  TaskText('использовать функцию MPI\_Recv с параметром MPI\_ANY\_SOURCE.',0,5);
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
    DataN('Процесс '+Chr(i+48)+': ', d1, 0, y+i, 2)
  end;
  SetProcess(0);
  ResultN2('Процесс 0: ', d, c, 34, 3, 2);
  SetTestCount(5);
end;

procedure MpiB9;
var i,n,y,j,c: integer;
    d,d1: integer;
    r: real;
begin
  n := Random(3)+4;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число~{N}, причем для одного процесса',0,1);
  TaskText('это число больше нуля, а для остальных равно нулю. В процессе с ненулевым~{N}',0,2);
  TaskText('дан также набор из {N}~чисел. Переслать данный набор чисел в главный процесс',0,3);
  TaskText('и вывести в главном процессе полученные числа и ранг процесса, переславшего',0,4);
  TaskText('этот набор. При приеме сообщения использовать параметр MPI\_ANY\_SOURCE.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := Random(n-1)+1;
  d := Random(9)+1;
  ResultComment('Процесс 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    if i = c then
      d1 := d
    else
      d1 := 0;
    DataN('Процесс '+Chr(i+48)+': N = ', d1, 2, y+i, 1);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число~{N}, в главном процессе дано',0,1);
  TaskText('целое число~{K} (>\,0), равное количеству тех подчиненных процессов, в которых',0,2);
  TaskText('даны положительные числа~{N}. Переслать все положительные числа~{N} в главный',0,3);
  TaskText('процесс и вывести в нем сумму полученных чисел. Для приема сообщений',0,4);
  TaskText('в главном процессе использовать функцию MPI\_Recv с параметром MPI\_ANY\_SOURCE.',0,5);
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
  ResultN('Процесс 0: ',s,0,3,2);
  DataN('Процесс 0: K = ',k,xLeft,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('Процесс '+Chr(i+48)+': N = ', a[i], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB11;
var i,n,y: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+4;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано вещественное число. Переслать число из главного',0,2);
  TaskText('процесса во все подчиненные процессы, а все числа из подчиненных процессов~\=',0,3);
  TaskText('в главный, и вывести в каждом процессе полученные числа (в главном процессе',0,4);
  TaskText('числа выводить в порядке возрастания рангов переславших их процессов).',0,5);
  y := 1;
  if n = 6 then y := 0;
  for i := 0 to n-1 do
    a[i] := Random*9.98;
  SetProcess(0);
  DataR('Процесс 0: ',a[0],12,3,3);
  ResultComment('Процесс 0: ',12,3);
  for i := 1 to n-1 do
    ResultR('',a[i],18+5*i,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataR('Процесс '+Chr(i+48)+': ', a[i], xRight, y+i, 2);
    ResultR('Процесс '+Chr(i+48)+': ', a[0], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB12;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число. С помощью функций MPI\_Send и MPI\_Recv',0,1);
  TaskText('осуществить для всех процессов циклический сдвиг данных с шагом~1,',0,2);
  TaskText('переслав число из процесса~0 в процесс~1, из процесса~1 в процесс~2, \.,',0,3);
  TaskText('из последнего процесса в процесс~0. В каждом процессе',0,4);
  TaskText('вывести полученное число.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('Процесс '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+1) mod n;
    SetProcess(c);
    ResultN('Процесс '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB13;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число. С помощью функций MPI\_Send и MPI\_Recv',0,1);
  TaskText('осуществить для всех процессов циклический сдвиг данных с шагом~\-1,',0,2);
  TaskText('переслав число из процесса~1 в процесс~0, из процесса~2 в процесс~1, \.,',0,3);
  TaskText('из процесса~0 в последний процесс. В каждом процессе',0,4);
  TaskText('вывести полученное число.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('Процесс '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+n-1) mod n;
    SetProcess(c);
    ResultN('Процесс '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB14;
var i,n,y: integer;
    a,b: array[0..5] of integer;
begin
  n := Random(3)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе даны два целых числа. С помощью функций MPI\_Send и MPI\_Recv',0,1);
  TaskText('переслать первое число в предыдущий процесс, а второе~\= в последующий процесс',0,2);
  TaskText('(для процесса~0 считать предыдущим последний процесс, а для последнего',0,3);
  TaskText('процесса считать последующим процесс~0). В каждом процессе вывести числа,',0,4);
  TaskText('полученные от предыдущего и последующего процесса (в указанном порядке).',0,5);
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
    DataN2('Процесс '+Chr(i+48)+':', a[i], b[i], 0, y+i, 3);
    ResultN2('Процесс '+Chr(i+48)+':', b[(i+n-1) mod n], a[(i+1) mod n], 0, y+i, 3);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе даны два числа: вещественное~{A} и целое~{N}, причем набор',0,1);
  TaskText('чисел~{N} содержит все значения от~0 до~{K}\;\-\;1, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функции MPI\_Send и MPI\_Recv (с параметром MPI\_ANY\_SOURCE),',0,3);
  TaskText('выполнить в каждом процессе пересылку числа~{A} в процесс~{N} и вывести',0,4);
  TaskText('полученное число, а также ранг процесса, из которого число было получено.',0,5);
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
    DataR('Процесс '+Chr(i+48)+': A = ', r, 26, y+i, 5);
    DataN('N = ',b[i],48,y+i, 1);
    SetProcess(b[i]);
    ResultR('Процесс '+Chr(b[i]+48)+': ', r, 30, y+b[i], 5);
    ResultN('',i,48,y+b[i], 1);
  end;
  SetTestCount(5);
end;

procedure MpiB16;
var i,n,y,c,k,j: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано целое число~{N}, причем для одного процесса значение~{N}',0,1);
  TaskText('равно~1, а для остальных равно~0. В процессе с {N}~=~1 дан также набор из {K}\,\-\,1',0,2);
  TaskText('числа, где {K}~\= количество процессов. Переслать из этого процесса по одному',0,3);
  TaskText('из чисел данного набора в остальные процессы, перебирая ранги получателей',0,4);
  TaskText('в возрастающем порядке, и вывести в каждом из них полученное число.',0,5);
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
    DataN('Процесс '+Chr(i+48)+': N = ', k, 0, y+i, 1);
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
    ResultR('Процесс '+Chr(i+48)+': ', a[i-j], 0, y+i-j, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB17;
var i,n,y,k,j: integer;
    a: array[0..4,0..4] of integer;
begin
  n := Random(3)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,\-\,1 целого числа, где {K}~\= количество',0,1);
  TaskText('процессов. Для каждого процесса переслать по одному из данных в нем',0,2);
  TaskText('чисел в остальные процессы, перебирая ранги процессов-получателей',0,3);
  TaskText('в возрастающем порядке, и вывести полученные числа в порядке',0,4);
  TaskText('возрастания рангов переславших их процессов.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+':', 30, y+i);
    k := -1;
    for j := 0 to n-2 do
    begin
      k := k + 1;
      if i = j then
        k := k + 1;
      DataN('',a[i,k], 41+j*3,y+i,2);
    end;

    ResultComment('Процесс '+Chr(i+48)+':', 30, y+i);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('Количество процессов~\= четное число. В каждом процессе дано целое число~{N}',0,2);
  TaskText('(0~<~{N}~<~5) и набор из {N}~чисел. С помощью функции MPI\_Sendrecv выполнить',0,3);
  TaskText('обмен исходными наборами между парами процессов~0 и~1, 2 и~3, и т.\,д.',0,4);
  TaskText('В каждом процессе вывести полученный набор чисел.',0,5);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', k[2*i], 3, y+i, 1);
    for j := 1 to k[2*i] do
      DataR('',a[2*i,j],16+j*5,y+i,4);
    ResultComment('Процесс '+Chr(2*i+48)+': ', 3, y+i);
    for j := 1 to k[2*i+1] do
      ResultR('',a[2*i+1,j],9+j*5,y+i,4);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', k[2*i-1], 41, y+i-1, 1);
    for j := 1 to k[2*i-1] do
      DataR('',a[2*i-1,j],54+j*5,y+i-1,4);
    ResultComment('Процесс '+Chr(2*i-1+48)+': ', 41, y+i-1);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано вещественное число. С помощью функции',0,1);
  TaskText('MPI\_Sendrecv\_replace поменять порядок исходных чисел на обратный (число из',0,2);
  TaskText('процесса~0 должно быть передано в последний процесс, число из процесса~1~\=',0,3);
  TaskText('в предпоследний процесс, \., число из последнего процесса~\= в процесс~0).',0,4);
  TaskText('В каждом процессе вывести полученное число.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to n-1 do
    a[i] := Random*89.99+10;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataR('Процесс '+Chr(2*i+48)+': ', a[2*i], xLeft, y+i, 5);
    ResultR('Процесс '+Chr(2*i+48)+': ', a[n-1-2*i], xLeft, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataR('Процесс '+Chr(2*i-1+48)+': ', a[2*i-1], xRight, y+i-1, 5);
    ResultR('Процесс '+Chr(2*i-1+48)+': ', a[n-2*i], xRight, y+i-1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB20;
var i,n,y: integer;
    d,d1: array [1..5] of real;
    k: array [1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано вещественное число~{A} и его порядковый',0,1);
  TaskText('номер~{N} (целое число); набор всех номеров~{N} содержит все целые числа от~1',0,2);
  TaskText('до~{K}\,\-\,1, где {K}~\= количество процессов. Переслать числа~{A} в главный процесс',0,3);
  TaskText('и вывести их в порядке, соответствующем возрастанию их номеров~{N}. Для',0,4);
  TaskText('передачи номера~{N} указывать его в качестве параметра msgtag функции MPI\_Send.',0,5);
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
    DataR('Процесс '+Chr(i+48)+': A = ', d[i], 27, y+i, 5);
    DataN('N = ', k[i], 49, y+i, 1);
  end;
  ResultComment('Процесс 0: ',0,2);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе дано целое число~{L} (\g\,0) и набор из {L}~пар чисел',0,1);
  TaskText('({A},~{N}), где {A}~\= вещественное, а {N}~\= его порядковый номер. Все числа~{L} в сумме',0,2);
  TaskText('равны 2{K}, где {K}~\= количество процессов; набор номеров~{N}, данных во всех',0,3);
  TaskText('процессах, содержит все целые числа от~1 до~2{K}. Переслать числа~{A} в главный',0,4);
  TaskText('процесс и вывести их в порядке, соответствующем возрастанию их номеров~{N}. Для',0,5);
  TaskText('передачи номера~{N} указывать его в качестве параметра msgtag функции MPI\_Send.',0,0);
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
    DataN('Процесс '+Chr(i+48)+': L = ', l[i], 3, y+i, 1);
    for j := 1 to l[i] do
    begin
    m := m + 1;
    DataR('', d[m], 12+j*11, y+i, 4);
    DataN('', k[m], 17+j*11, y+i, 2);
    end;
  end;
  ResultComment('Процесс 0: ',0,2);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор пар чисел ({T}, {A}); количество пар равно числу',0,1);
  TaskText('подчиненных процессов. Число~{T}~\= целое, равное~0 или~1. Число~{A}~\= целое, если',0,2);
  TaskText('{T}~=~0, и вещественное, если {T}~=~1. Переслать по одному числу~{A} в каждый из',0,3);
  TaskText('подчиненных процессов (первое число в процесс~1, второе~\= в процесс~2, и т.\,д.)',0,4);
  TaskText('и вывести полученные числа. Для передачи информации о типе пересланного числа',0,5);
  TaskText('указывать число~{T} в качестве параметра msgtag функции MPI\_Send, для получения',0,0);
  TaskText('этой информации использовать функцию MPI\_Probe с параметром MPI\_ANY\_TAG.',0,0);
  for i := 1 to 5 do
  begin
    a[i] := 89.98*Random+10;
    b[i] := Random(90)+10;
    t[i] := Random(2);
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  DataComment('Процесс 0:',xleft, y+1);
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
    0: ResultN('Процесс '+Chr(i+48)+': ', b[i], 32, y+i, 2);
    1: ResultR('Процесс '+Chr(i+48)+': ', a[i], 0, y+i, 5);
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
  CreateTask('Обмен сообщениями между отдельными процессами', n);
  if n = 0 then exit;
  TaskText('В каждом подчиненном процессе даны два целых числа~{T}, {N} и набор из~{N} чисел.',0,1);
  TaskText('Число~{T} равно~0 или~1. Набор содержит целые числа, если {T}~=~0, и вещественные',0,2);
  TaskText('числа, если {T}~=~1. Переслать исходные наборы в главный процесс и вывести',0,3);
  TaskText('полученные числа в порядке возрастания рангов переславших их процессов.',0,4);
  TaskText('Для передачи информации о типе пересланного числа указывать число~{T}',0,5);
  TaskText('в качестве параметра msgtag функции MPI\_Send, для получения этой',0,0);
  TaskText('информации использовать функцию MPI\_Probe с параметром MPI\_ANY\_TAG.',0,0);
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
  ResultComment('Процесс 0:',11, y+1);
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
    DataN('Процесс '+Chr(i+48)+': T = ', t[i], 3, y+i, 1);
    DataN('N = ', k[i], 21, y+i, 1);
    for j := 1 to k[i] do
    case t[i] of
    0: DataN('', b[i,j], 25+4*j, y+i, 2);
    1: DataR('', a[i,j], 22+7*j, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiC1;
var i,n,y,k: integer;
begin
  n := Random(3)+4;
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дано целое число.',0,2);
  TaskText('Используя функцию MPI\_Bcast, переслать это число',0,3);
  TaskText('во все подчиненные процессы и вывести в них полученное число.',0,4);
  k := Random(90) + 10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataN('Процесс 0: ', k, 0, 3, 2);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultN('Процесс '+Chr(i+48)+': ', k, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC2;
var i,n,y,j: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+4;
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из 5 чисел.',0,2);
  TaskText('Используя функцию MPI\_Bcast, переслать этот набор во все подчиненные',0,3);
  TaskText('процессы и вывести в них полученные числа в том же порядке.',0,4);
  for i := 1 to 5 do
    r[i] := Random*89.99+10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataComment('Процесс 0:',13,3);
  for i := 1 to 5 do
  DataR('', r[i], Center(i,5,5,2), 3, 5);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',13,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано вещественное число.',0,2);
  TaskText('Используя функцию MPI\_Gather, переслать эти числа в главный процесс',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(первым вывести число, данное в главном процессе).',0,5);
  for i := 1 to n do
    r[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Процесс 0:',0,2);
  for i := 1 to n do
  ResultR('', r[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Процесс '+Chr(i+48)+': ', r[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC4;
var i,n,y,j: integer;
  a: array[1..5,1..5] of integer;
begin
  n := Random(3)+3;
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из 5 целых чисел.',0,2);
  TaskText('Используя функцию MPI\_Gather, переслать эти наборы в главный процесс',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(первым вывести набор чисел, данный в главном процессе).',0,5);
  for i := 1 to 5 do
    for j := 1 to 5 do
    a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Процесс 0:',0,2);
  for i := 1 to n do
    for j := 1 to 5 do
  ResultN('', a[i,j], Center((i-1)*5+j,5*n,2,1), 3, 2);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',22,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {R}\,+\,2 целых чисел, где число~{R} равно рангу',0,1);
  TaskText('процесса (в процессе~0 даны 2~числа, в процессе~1 даны 3~числа, и т.\,д.).',0,2);
  TaskText('Используя функцию MPI\_Gatherv, переслать эти наборы в главный процесс',0,3);
  TaskText('и вывести полученные наборы в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (первым вывести набор, данный в главном процессе).',0,5);
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
  ResultComment('Процесс 0:',0,2);
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
    DataComment('Процесс '+Chr(i+48)+': ',20,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Scatter, переслать по одному числу в каждый',0,3);
  TaskText('процесс (включая главный) и вывести в каждом процессе полученное число.',0,4);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Процесс 0:',0,2);
  for i := 1 to n do
      DataR('', a[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Процесс '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC7;
var i,n,y,j: integer;
  a: array[1..5,1..3] of real;
begin
  n := Random(3)+3;
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из 3{K} чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Scatter, переслать по 3~числа в каждый процесс',0,3);
  TaskText('(включая главный) и вывести в каждом процессе полученные числа.',0,4);
  for i := 1 to n do
    for j := 1 to 3 do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Процесс 0:',0,2);
  for i := 1 to n do
    for j := 1 to 3 do
      DataR('', a[i,j], Center((i-1)*3+j,3*n,4,1), 3, 4);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',21,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Не меняя порядок расположения чисел в исходном наборе и используя функцию',0,2);
  TaskText('MPI\_Scatterv, переслать по одному числу в каждый процесс; при этом первое',0,3);
  TaskText('число надо переслать в процесс~{K}\,\-\,1, второе число~\= в процесс~{K}\,\-\,2, \.,',0,4);
  TaskText('последнее число~\= в процесс~0. Вывести в каждом процессе полученное число.',0,5);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Процесс 0:',0,2);
  for i := 1 to n do
      DataR('', a[n-i+1], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Процесс '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC9;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из {K}({K}\,+\,3)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Scatterv, переслать в каждый процесс',0,2);
  TaskText('часть чисел из данного набора; при этом в процесс ранга~{R} надо переслать',0,3);
  TaskText('{R}\,+\,2~очередных числа (в процесс~0~\= первые два числа, в процесс~1~\=',0,4);
  TaskText('следующие три числа, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
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
  DataComment('Процесс 0:',0,2);
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
    ResultComment('Процесс '+Chr(i+48)+': ',20,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В главном процессе дан набор из {K}\,+\,2 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scatterv, переслать в каждый процесс три числа',0,2);
  TaskText('из данного набора; при этом в процесс ранга~{R} должны быть пересланы числа',0,3);
  TaskText('с номерами от {R}\,+\,1 до {R}\,+\,3 (в процесс~0~\= первые три числа, в процесс~1~\= числа',0,4);
  TaskText('со второго по четвертое, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
  for i := 1 to n+2 do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Процесс 0:',0,2);
  for i := 1 to n+2 do
      DataR('', a[i], Center(i,n+2,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',20,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дано вещественное число.',0,2);
  TaskText('Используя функцию MPI\_Allgather, переслать эти числа во все процессы',0,3);
  TaskText('и вывести их в каждом процессе в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (включая число, полученное из этого же процесса).',0,5);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Процесс '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',13,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе даны четыре целых числа.',0,2);
  TaskText('Используя функцию MPI\_Allgather, переслать эти числа во все процессы',0,3);
  TaskText('и вывести их в каждом процессе в порядке возрастания рангов переславших',0,4);
  TaskText('их процессов (включая числа, полученные из этого же процесса).',0,5);
  for i := 1 to n do
    for j := 1 to 4 do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
    for j := 1 to 4 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {R}\,+\,2 целых чисел, где число~{R} равно рангу',0,1);
  TaskText('процесса (в процессе~0 даны 2~числа, в процессе~1 даны~3 числа, и т.\,д.).',0,2);
  TaskText('Используя функцию MPI\_Allgatherv, переслать эти наборы во все процессы',0,3);
  TaskText('и вывести их в порядке возрастания рангов переславших их процессов',0,4);
  TaskText('(включая числа, полученные из этого же процесса).',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoall, переслать в каждый процесс по одному числу',0,2);
  TaskText('из всех наборов: в процесс~0~\= первые числа из наборов, в процесс~1~\= вторые',0,3);
  TaskText('числа, и т.\,д. В каждом процессе вывести числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая число, полученное из этого же процесса).',0,5);
  for i := 1 to n do
    for j := 1 to n do
      a[i,j] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      DataR('', a[i+1,j], Center(j,n,5,2), y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',13,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из 3{K} целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoall, переслать в каждый процесс три очередных числа',0,2);
  TaskText('из каждого набора (в процесс~0~\= первые три числа, в процесс~1~\= следующие три',0,3);
  TaskText('числа, и т.\,д.). В каждом процессе вывести числа в порядке возрастания рангов',0,4);
  TaskText('переславших их процессов (включая числа, полученные из этого же процесса).',0,5);
  for i := 1 to n do
    for j := 1 to 3*n do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',7,y+i);
    for j := 1 to 3*n do
      DataN('', a[i+1,j], Center(j,3*n,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',7,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}({K}\,+\,1)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Alltoallv, переслать в каждый процесс',0,2);
  TaskText('часть чисел из каждого набора; при этом в процесс~{R} должно быть переслано',0,3);
  TaskText('{R}\,+\,1~очередное число (в процесс~0~\= первое число каждого набора, в процесс~1~\=',0,4);
  TaskText('следующие два числа, и т.\,д.). В каждом процессе вывести полученные числа.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,1,1), y+i, 1);
  end;
  c1 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',15,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,1 числа, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoallv, переслать в каждый процесс два числа из',0,2);
  TaskText('каждого набора; при этом в процесс~0 надо переслать первые два числа,',0,3);
  TaskText('в процесс~1~\= второе и третье число, \., в последний процесс~\= последние',0,4);
  TaskText('два числа каждого набора. В каждом процессе вывести полученные числа.',0,5);
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
  CreateTask('Коллективная пересылка данных', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,1 числа, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Alltoallv, переслать в каждый процесс два числа из',0,2);
  TaskText('каждого набора; при этом в процесс~0 надо переслать последние два числа, в',0,3);
  TaskText('процесс~1~\= два числа, предшествующих последнему, \., в последний процесс~\=',0,4);
  TaskText('первые два числа каждого набора. В каждом процессе вывести полученные числа.',0,5);
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество',0,2);
  TaskText('процессов. Используя функцию MPI\_Reduce для операции MPI\_SUM, просуммировать',0,3);
  TaskText('элементы данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные суммы в главном процессе.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
    SetProcess(0);
    ResultComment('Процесс '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiD2;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Reduce для операции MPI\_MIN, найти минимальное',0,3);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные минимумы в главном процессе.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
    SetProcess(0);
    ResultComment('Процесс '+Chr(0+48)+':',0,2);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce для операции MPI\_MAXLOC, найти максимальное',0,2);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,3);
  TaskText('и ранг процесса, содержащего это максимальное значение. Вывести в главном',0,4);
  TaskText('процессе вначале все максимумы, а затем~\= ранги содержащих их процессов.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',15,y+i);
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
    ResultComment('Процесс '+Chr(0+48)+':',0,2);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,2);
  TaskText('Используя функцию MPI\_Allreduce для операции MPI\_PROD, перемножить',0,3);
  TaskText('элементы данных наборов с одним и тем же порядковым номером',0,4);
  TaskText('и вывести полученные произведения во всех процессах.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] * a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',6,y+i);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Allreduce для операции MPI\_MINLOC, найти минимальное',0,2);
  TaskText('значение среди элементов данных наборов с одним и тем же порядковым номером',0,3);
  TaskText('и ранг процесса, содержащего минимальное значение. Вывести в главном процессе',0,4);
  TaskText('минимумы, а в остальных процессах~\= ранги процессов, содержащих эти минимумы.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
    ResultComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}~целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce\_scatter, просуммировать элементы данных',0,2);
  TaskText('наборов с одним и тем же порядковым номером, переслать по одной',0,3);
  TaskText('из полученных сумм в каждый процесс (первую сумму~\= в процесс~0, вторую~\=',0,4);
  TaskText('в процесс~1, и т.\,д.) и вывести в каждом процессе полученную сумму.',0,5);
  c := n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',22,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+':',22,y+i);
    ResultN('', a[1,i+1], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiD7;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из 2{K}~чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Reduce\_scatter, найти максимумы среди элементов этих',0,2);
  TaskText('наборов с одним и тем же порядковым номером, переслать по два найденных',0,3);
  TaskText('максимума в каждый процесс (первые два максимума~\= в процесс~0, следующие',0,4);
  TaskText('два~\= в процесс~1, и т.\,д.) и вывести в каждом процессе полученные данные.',0,5);
  c := 2*n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Процесс '+Chr(i+48)+': ',5,y+i);
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
    ResultComment('Процесс '+Chr(i+48)+':',25,y+i);
    ResultR2('', a[1,2*i+1], a[1,2*i+2], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD8;
var i,n,y,j,k,c,k1: integer;
  a: array[1..5,1..20] of integer;
begin
  n := Random(3)+3;
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}({K}\,+\,3)/2 целых чисел, где {K}~\= количество',0,1);
  TaskText('процессов. Используя функцию MPI\_Reduce\_scatter, найти минимальные значения',0,2);
  TaskText('среди элементов этих наборов с одним и тем же порядковым номером и переслать',0,3);
  TaskText('первые два минимума в процесс~0, следующие три~\= в процесс~1, \., последние',0,4);
  TaskText('{K}\,+\,1~минимумов~\= в процесс~{K}\,\-\,1. Вывести в каждом процессе полученные данные.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',6,y+i);
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
    ResultComment('Процесс '+Chr(i+48)+':',6,y+i);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scan, найти в процессе ранга~{R} ({R}~=~0, 1,~\., {K}\,\-\,1)',0,2);
  TaskText('произведения элементов с одним и тем же порядковым номером для наборов, данных',0,3);
  TaskText('в процессах с рангами от~0 до~{R}, и вывести найденные произведения (при этом',0,4);
  TaskText('в процессе {K}\,\-\,1 будут выведены произведения элементов из всех наборов).',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',6,y+i);
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
  CreateTask('Коллективные операции редукции', n);
  if n = 0 then exit;
  TaskText('В каждом процессе дан набор из {K}\,+\,5 целых чисел, где {K}~\= количество процессов.',0,1);
  TaskText('Используя функцию MPI\_Scan, найти в процессе ранга~{R} ({R}~=~0, \.,~{K}\,\-\,1)',0,2);
  TaskText('максимальные значения среди элементов с одним и тем же порядковым номером',0,3);
  TaskText('для наборов, данных в процессах с рангами от~0 до~{R},',0,4);
  TaskText('и вывести в каждом процессе найденные максимумы.',0,5);
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
    DataComment('Процесс '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
    begin
      if a[i+1,j] > b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

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
    ResultComment('Процесс '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    ResultComment('Процесс '+Chr(i+48)+': ',3,y+i);
      ResultN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    DataComment('Процесс '+Chr(i+48)+': ',3,y+i);
      DataN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    ResultComment('Процесс 0:',3,3);
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
    ResultComment('Процесс '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    ResultComment('Процесс '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
      DataN('', a[i], 35+6, y+i, 2);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Процесс 0:',3,3);
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
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataR('', b[i], 35+3, y+i, 5);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Процесс '+Chr(i+48)+': ',3,y+i);
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
    DataComment('Процесс '+Chr(i+48)+': ',3,y+i);
    x := 13;
    for j := 1 to i do
    begin
      DataN2('', a[i,j], c[i,j], x, y+i, 3);
      DataR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetProcess(0);
    ResultComment('Процесс 0:',3,y+1);
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
    ResultComment('Процесс '+Chr(i+48)+': ',9,y+i);
    for j := 1 to n do
      ResultN('', a[j], Center(j,n,2,1)-12, y+i, 2);
    for j := 1 to n do
      ResultR('', b[j], Center(j,n,5,1)+16, y+i, 5);
  end;
  SetProcess(0);
    DataComment('Процесс 0:',9,3);
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
    ResultComment('Процесс '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    ResultComment('Процесс '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Процесс 0:',3,3);
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
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataN('', c[i], 35+3, y+i, 2);
      DataR('', b[i], 35+6, y+i, 5);
  end;
  SetProcess(0);
    ResultComment('Процесс 0:',3,3);
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
    DataComment('Процесс '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
    for j := 1 to i do
      DataN('', a[i,j], 38+j*3, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Процесс 0:',3,3);
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
    DataComment('Процесс 0:',0,2);
    for j := 1 to n1 do
      DataN('', a[j], Center(j,n1,2,1), 3, 2);
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    ResultN('Процесс '+Chr(k+48)+': ', a[i], 0, y+i, 2);
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
    DataR2('Процесс '+Chr(k+48)+':', a[k], a[k+1], 0, y+i, 6);
  end;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    ResultComment('Процесс '+Chr(k+48)+':',5,y+i);
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
    DataN3('Процесс '+s+':', a[k+1], a[k+2], a[k+3], 0, y+i, 3);
  end;
    SetProcess(0);
    ResultComment('Процесс 0:',0,2);
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
    DataR3('Процесс '+Chr(k+48)+':', a[i,1], a[i,2], a[i,3], 0, y+i, 6);
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
    DataR('Процесс '+Chr(2*i+48)+': ', r, xLeft, y+i, 5);
    if r > max then
      max := r;
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 89.98*Random+10;
    DataR('Процесс '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    if r < min then
      min := r;
  end;
    SetProcess(0);
    ResultR('Процесс 0: ', max, xLeft, 3, 5);
    SetProcess(1);
    ResultR('Процесс 1: ', min, xRight, 3, 5);
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
  TaskText('процесс с {N}~=~1 и вывести в этих подчиненных процессах полученные числа.',0,0);
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
    DataN('Процесс 0: K = ', k, xLeft, 1, 1);
    for j := 1 to k do
      DataR('',r[j],25+j*7,1,5);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], xLeft, y+i-1, 1);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], xRight, y+i-1, 1)
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
      ResultR('Процесс '+Chr(i+48)+': ', r[j], 0, y+j, 5);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Процесс '+Chr(m+48)+':', 5, 3);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Процесс '+Chr(m+48)+':', 5, 3);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
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
      ResultComment('Процесс '+Chr(m+48)+':', 5, y+j);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataN('A = ', r1[2*i], 23, y+i, 2)
    else
      DataN('A = ', r2[2*i], 23, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataN('A = ', r1[2*i-1], 63, y+i-1, 2)
    else
      DataN('A = ', r2[2*i-1], 63, y+i-1, 2)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Процесс '+Chr(2*i+48)+':', 5, y+i);
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
    ResultComment('Процесс '+Chr(2*i-1+48)+':', 45, y+i-1);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
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
      ResultR('Процесс '+Chr(m+48)+': ', sum, 5, y+j, 6);
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
    DataN('Процесс '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5)
    else
      DataR('A = ', r2[2*i], 23, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5)
    else
      DataR('A = ', r2[2*i-1], 63, y+i-1, 5)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Процесс '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      ResultR('', min, 16, y+i, 5)
    else
      ResultR('', max, 16, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Процесс '+Chr(2*i-1+48)+':', 45, y+i-1);
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
  DataN('Процесс 0: N = ',k,0,3,1);
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
      ResultN2('Процесс ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
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
  DataN('Процесс 0: N = ',k,0,3,1);
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
      ResultN2('Процесс ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
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
    DataR('Процесс '+Chr((i-1)*(n div k)+48)+': A = ',r[i],0,2*i,3);
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
      ResultR('Процесс ' + Chr(m+48)+': ', r[i],Center(j,n div k,14,d),y+i,3);
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
    DataR('Процесс '+Chr(i-1+48)+': A = ',r[i],0,2*i,3);
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
      ResultR('Процесс ' + Chr(m+48)+': ', r[j],Center(j,k,14,d),y+i,3);
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
    DataComment('Процесс '+Chr((i-1)*n+48)+':',22,i+1);
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
      ResultN('Процесс ' + s+': ', r[i,j],Center(j,n,13,d),y+i,2);
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
    DataComment('Процесс '+Chr(i-1+48)+':',22,i+1);
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
      ResultN('Процесс ' + s+': ', r[j,i],Center(j,k,13,d),y+i,2);
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
        DataN('Процесс '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  m := 0;
  y := 1;
  for l := 1 to 2 do
  for i := 1 to 2 do
  begin
    SetProcess(m);
    y := y + 1;
    str(m,s);
    ResultComment('Процесс ' + s+':', 20, y);
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
        DataN('Процесс '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  y := 1;
  if k = 2 then y := 2;
  for j := 1 to k do
  begin
    SetProcess(j-1);
    str(j-1,s);
    ResultComment('Процесс ' + s+':', 20, y+j);
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
        DataR('Процесс '+s+': ',r[i,l,j],Center(j,k,17,4),i+(l-1)*3,4);
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
      ResultR('Процесс ' + s+': ', r1[i,j],Center(j,k,17,4),y+2*i,5);
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
        DataR('Процесс '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
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
        ResultR('Процесс '+s+': ',r1[j],Center(j,k,17,5),i+(l-1)*3,5);
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
    DataComment('Процесс '+Chr(2*i+48)+': ', 5, y+i);
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
    DataComment('Процесс '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Процесс '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],1,0), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Процесс '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],1,0), 45, y+i-1, 2);
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
    DataComment('Процесс '+Chr(2*i+48)+': ', 5, y+i);
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
    DataComment('Процесс '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Процесс '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],0,1), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Процесс '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],0,1), 45, y+i-1, 2);
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
    DataR('Процесс '+Chr(i+48)+': ', a[i], 0, y+i, 5);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i-1);
    ResultR('Процесс '+Chr(i-1+48)+': ', a[i], 0, y+i, 5);
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
      ResultR('Процесс ' + Chr(m+48)+': ', r[i,j-1],Center(j,n div k,14,d),y+i,3);
    end;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      DataR('Процесс ' + Chr(m+48)+': ', r[i,j mod (n div k)],Center(j,n div k,14,d),y+i,3);
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
        DataR('Процесс '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
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
        ResultR('Процесс '+s+': ',r[i,l,j1],Center(j,k,17,5),i+(l-1)*3,5);
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
    DataN('Процесс 0: A = ', a[0], xLeft, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': A = ', a[2*i-1], xLeft, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Процесс '+Chr(2*i+48)+': A = ', a[2*i], xRight, y+i, 2)
  end;
    SetProcess(0);
    ResultComment('Процесс 0:',12,y);
    for i := 1 to k do
      ResultN('', a[2*i-1], 20+i*3, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Процесс '+Chr(2*i-1+48)+':',12,y+i);
    ResultN('', a[0], 23, y+i, 2);
    ResultN('', a[2*i], 26, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Процесс '+Chr(2*i+48)+':',51,y+i);
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
  TaskText('процесс нечетного ранга~{R} (1, 3,~\., 2{N}\,\-\,1) связан с процессом ранга~{R}\,\-\,1',0,5);
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
    DataN('Процесс '+Chr(2*i+48)+': A = ', a[2*i], xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Процесс '+Chr(2*i-1+48)+': A = ', a[2*i-1], xRight, y+i-1, 2);
  end;

  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Процесс '+Chr(2*i+48)+':', 12, y+i);
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
    ResultN('Процесс '+Chr(2*i-1+48)+': ', a[2*i-2], 51, y+i-1, 2);
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
    DataN('Процесс  0: A = ', a[0], 0, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    DataN('Процесс '+s+': A = ', a[m], Center(j,3,18,6), y+i, 2);
  end;
  SetProcess(0);
  ResultComment('Процесс  0:', 31, y);
  for i := 1 to k do
    ResultN('', a[3*i], 40+i*3, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    ResultComment('Процесс '+s+':', -17+j*24, y+i);
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
    DataR('Процесс '+s+': ', d, 0, i+1, 6);
    ResultR('Процесс '+s+': ', -d, 0, i+1, 6);
  end;
  SetTestCount(5);
end;
*)


procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: MpiA1;
  2: MpiA2;
  3: MpiA3;
  4: MpiA4;
  5: MpiA5;
  6: MpiA6;
  7: MpiA7;
  8: MpiA8;
  9: MpiA9;
  10: MpiA9a;
{  7: MpiB1;
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
  CreateGroup('MPI1Proc', 'Процессы и их ранги', 'М. Э. Абрамян, 2010,2017', 'sddfgfsjnbvvdfsd78fgfgd', 10, InitTask);
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
