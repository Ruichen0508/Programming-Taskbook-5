{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SArr45B4z;

interface

procedure SArr45Bn1(Name, Key: string);
procedure SArr45Bn2(Name, Key: string);
procedure SArr45Bn3(Name, Key: string);
procedure SArr45Bn4(Name, Key: string);
procedure SArr45Bn5(Name, Key: string);
procedure SArr45Bn6(Name, Key: string);
procedure SArr45Bn7(Name, Key: string);
procedure SArr45Bn8(Name, Key: string);
procedure SArr45Bn9(Name, Key: string);
procedure SArr45Bn10(Name, Key: string);
procedure SArr45Bn11(Name, Key: string);
procedure SArr45Bn12(Name, Key: string);
procedure SArr45Bn13(Name, Key: string);
procedure SArr45Bn14(Name, Key: string);
procedure SArr45Bn15(Name, Key: string);
procedure SArr45Bn16(Name, Key: string);
procedure SArr45Bn17(Name, Key: string);
procedure SArr45Bn18(Name, Key: string);
procedure SArr45Bn19(Name, Key: string);
procedure SArr45Bn20(Name, Key: string);
procedure SArr45Bn21(Name, Key: string);
procedure SArr45Bn22(Name, Key: string);
procedure SArr45Bn23(Name, Key: string);
procedure SArr45Bn24(Name, Key: string);
procedure SArr45Bn25(Name, Key: string);
procedure SArr45Bn26(Name, Key: string);
procedure SArr45Bn27(Name, Key: string);
procedure SArr45Bn28(Name, Key: string);
procedure SArr45Bn29(Name, Key: string);
procedure SArr45Bn30(Name, Key: string);
procedure SArr45Bn31(Name, Key: string);
procedure SArr45Bn32(Name, Key: string);
procedure SArr45Bn33(Name, Key: string);
procedure SArr45Bn34(Name, Key: string);
procedure SArr45Bn35(Name, Key: string);
procedure SArr45Bn36(Name, Key: string);
procedure SArr45Bn37(Name, Key: string);
procedure SArr45Bn38(Name, Key: string);
procedure SArr45Bn39(Name, Key: string);
procedure SArr45Bn40(Name, Key: string);
procedure SArr45Bn41(Name, Key: string);
procedure SArr45Bn42(Name, Key: string);
procedure SArr45Bn43(Name, Key: string);
procedure SArr45Bn44(Name, Key: string);
procedure SArr45Bn45(Name, Key: string);

implementation

uses PT5TaskMaker;
var
  Topic, Topic4, Topic5, Topic6, Topic7, Topic8, Author: string;
  a : array [0..20] of real;
  a1: array [0..20] of real;
  a2: array [0..20] of real;
  b : array [0..20] of integer;
  b1 : array [0..20] of integer;
  b2,b3 : array [1..20] of integer;
  a0,b0,c0 : real;
  x,y,x1,y1: array[0..8] of real;
  x2,y2: array[0..8] of integer;
  x0,y0,r,r0 : real;
  amin,amax : real;
  bmin,bmax : integer;
  i,j,k,m,n1,n2,n0,n,nmin,nmax : integer;
  s,s1,s2,s3,s4 : string;




procedure SArr45Bn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Дан целочисленный массив размера~{N}.', 0, 2);
  TaskText('Удалить из\ массива все\ соседние одинаковые элементы,', 0, 3);
  TaskText('оставив их\ первые вхождения.', 0, 4);
(*
*)
(*==*)
  a0:=1 + Random(5); b0:=1+Random(3);
  n := 5 + Random(6);
  k := 1;
  b[1] := Random(b0)+a0;
  for i:=2 to n do
  begin
    b[i] := Random(b0)+a0;
    if b[i]<>b[i-1] then inc(k);
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',b[1],center(1,k,1,6),3,1);
j := 1;
for i := 2 to n do
  if b[i]<>b[i-1] then
  begin
    inc(j);
    resultN('',b[i],center(j,k,1,6),3,1);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn2(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  if v1=1 then
  begin
  TaskText('Дан целочисленный массив размера~{N}.', 0, 2);
  TaskText('Удалить из\ массива все\ одинаковые элементы,', 0, 3);
  TaskText('оставив их\ первые вхождения.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('Дан целочисленный массив размера~{N}.', 0, 2);
  TaskText('Удалить из\ массива все\ одинаковые элементы,', 0, 3);
  TaskText('оставив их\ последние вхождения.', 0, 4);
(*
*)
  end;
(*==*)
a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
  b[i] := Random(b0)+a0;
k := 0;
if v1 = 1 then
begin
  for i:=1 to n do
  begin
    l := 0;
    for j := 1 to i-1 do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
  end;
end
else
begin
  for i:=n downto 1 do
  begin
    l := 0;
    for j := i+1 to n do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
   end;
   for i := 1 to k div 2 do
   begin
     l := b1[i];
     b1[i] := b1[k-i+1];
     b1[k-i+1] := l;
   end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
for i := 1 to k do
  resultN('',b1[i],center(i,k,1,6),3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn3(Name, Key: string);
label 0;
var
  v1, v2, v3: Byte;
  k,n:integer;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Удалить из\ массива все\ элементы, встречающиеся менее трех\ раз,',0,3);
taskText('и\ вывести размер полученного массива и\ его\ содержимое.',0,4);
(*
*)
end;
2:
begin
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Удалить из\ массива все\ элементы, встречающиеся более двух\ раз,',0,3);
taskText('и\ вывести размер полученного массива и\ его\ содержимое.',0,4);
(*
*)
end;
3:
begin
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Удалить из\ массива все\ элементы, встречающиеся ровно два\ раза,',0,3);
taskText('и\ вывести размер полученного массива и\ его\ содержимое.',0,4);
(*
*)
end;
end;
(*==*)
0:  a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
for i:=1 to n do
  begin
    b1[i] := 0;
    for j:=1 to n do
      if b[j]=b[i] then inc(b1[i]);
  end;
k := 0;
for i := 1 to n do
  case v1 of
  1 : if b1[i]>=3 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  2 : if b1[i]<=2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  3 : if b1[i]<>2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  end;
if (k = 0)or(k = n) then goto 0;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('Новый размер массива: ',k,0,2,1);
for i := 1 to k do
  resultN('',b2[i],center(i,k,1,6),4,1);
  SetNumberOfTests(5);
Pause;
end;







procedure SArr45Bn4(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Дан массив размера~{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Перед элементом массива с\ индексом~{K}', 0, 3);
  TaskText('вставить новый элемент с\ нулевым значением.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('Дан массив размера~{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('После элемента массива с\ индексом~{K} ', 0, 3);
  TaskText('вставить новый элемент с\ нулевым значением.', 0, 4);
(*
*)
  end;
(*==*)
  n := 5 + Random(5);
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,0,4,1);
  for i := n downto k do
    a[i+1] := a[i];
  if v1 = 1 then a[k] := 0
  else a[k+1] := 0;
  for i := 1 to n+1 do
    resultR('',a[i],center(i,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  max, min: real;
  nmin, nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив размера~{N}. Вставить элемент с\ нулевым значением', 0, 2);
  TaskText('перед минимальным и\ после максимального элемента массива.', 0, 4);
(*
*)
(*==*)
n := 3 + Random(6);
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99;
  a1[i] := a[i];
end;
min := a[1];
nmin := 1;
max := a[1];
nmax := 1;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 2 to n do
  if a[i]<min then
  begin
    min := a[i];
    nmin := i;
  end
  else
  if a[i]>max then
  begin
    max := a[i];
    nmax := i;
  end;
j := 0;
for i := 1 to n do
begin
  if i=nmin then
  begin
    resultR('',0,center(i+j,n+2,5,2),3,5);
    inc(j);
  end;
  resultR('',a[i],center(i+j,n+2,5,2),3,5);
  if i=nmax then
  begin
    inc(j);
    resultR('',0,center(i+j,n+2,5,2),3,5);
  end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Дан массив размера~{N} и\ два целых числа~{K} и~{M} (0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10).', 0, 2);
  TaskText('Перед элементом массива с\ индексом~{K}', 0, 3);
  TaskText('вставить {M}~новых элементов с\ нулевыми значениями.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('Дан массив размера~{N} и\ два целых числа~{K} и~{M} (0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10).', 0, 2);
  TaskText('После элемента массива с\ индексом~{K}', 0, 3);
  TaskText('вставить {M}~новых элементов с\ нулевыми значениями.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 2 + Random(9);
  m := 1 + Random(7);
  until n + m <= 10;
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,xLeft,4,1);
  dataN('M = ',m,xRight,4,1);
  for i := n downto k do
    a[i+m] := a[i];
  for i := k+1 to k+m-1 do
    a[i] := 0;
  if v1 = 1 then a[k] := 0
  else a[k+m] := 0;
  for i := 1 to n+m do
    resultR('',a[i],center(i,n+m,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn7(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Дан массив размера~{N}. Продублировать в\ нем элементы', 0, 2);
  TaskText('с\ нечетными индексами (1,~3,~\.).', 0, 3);
  TaskText('Условный оператор в\ цикле не\ использовать.', 0, 4);
(*
+
*)
  end
  else
  begin
  TaskText('Дан массив размера~{N}. Утроить в\ нем вхождения всех элементов', 0, 2);
  TaskText('с\ четными индексами (0,~2,~\.).', 0, 3);
  TaskText('Условный оператор в\ цикле не\ использовать.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    a[i] := 9.88*Random;
    case v1 of
    1: if not Odd(i) then inc(k);
    2: if Odd(i) then k := k + 2;
    end;
  end;
  until n+k<=19;
setprecision(1);
dataN('N = ',n,0,2,1);
for i := 1 to n do
    dataR('',a[i],center(i,n,3,2),4,3);
j := 0;
case v1 of
1:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,2),3,3);
    if not Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,2),3,3);
    end;
  end;
2:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,1),3,3);
    if Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Bn8(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив размера~{N}.', 0, 2);
  TaskText('Перед каждым положительным элементом массива', 0, 3);
  TaskText('вставить элемент с\ нулевым значением.', 0, 4);
(*
*)
n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
if a[i]>0 then
     begin
            a1[k+1] := 0;
            a1[k+2] := a[i];
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
  TaskText('Дан массив размера~{N}.', 0, 2);
  TaskText('После каждого отрицательного элемента массива', 0, 3);
  TaskText('вставить элемент с\ нулевым значением.', 0, 4);
(*
*)
end;
2:begin
  TaskText('Дан целочисленный массив размера~{N}.', 0, 2);
  TaskText('Продублировать в\ нем все\ четные числа.', 0, 4);
(*
*)
  end;
3:begin
  TaskText('Дан целочисленный массив размера~{N}.', 0, 2);
  TaskText('Утроить в\ нем вхождения всех нечетных чисел.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin

n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
 if a[i]<0 then
          begin
            a1[k+1] := a[i];
            a1[k+2] := 0;
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);

   end;
2,3: begin
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    case v1 of
    2: if not Odd(b[i]) then inc(k);
    3: if Odd(b[i]) then k := k + 2;
    end;
  end;
  until n+k<=18;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
j := 0;
case v1 of
2:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if not Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
3:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn10(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;





procedure SArr45Bn11(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N} (\l\,6). Упорядочить его по\ возрастанию методом', 0, 1);
  TaskText('сортировки \Iпростым обменом\i (\I\<пузырьковой\> сортировкой\i): просматривать массив,', 0, 2);
  TaskText('сравнивая его\ соседние элементы ({A}_{0}~и~{A}_{1}, {A}_{1} и~{A}_{2} и~т.\,д.) и\ меняя\ их', 0, 3);
  TaskText('местами, если левый элемент пары больше правого; повторить описанные действия', 0, 4);
  TaskText('{N}\,\-\,1~раз. Для\ контроля за\ выполняемыми действиями выводить содержимое', 0, 5);
  TaskText('массива после каждого просмотра. Учесть, что при\ каждом просмотре', 0, 0);
  TaskText('количество анализируемых пар можно уменьшить на~1.', 0, 0);
(*
*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    if (i = n) and (Random(3)=0) then a[i] := 2*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[i]>a[i+1] then
      begin
        a0 := a[i];
        a[i] := a[i+1];
        a[i+1] := a0;
      end;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Bn12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N} (\l\,6). Упорядочить его по\ возрастанию методом', 0, 1);
  TaskText('сортировки \Iпростым выбором\i: найти максимальный элемент массива и\ поменять', 0, 2);
  TaskText('его местами с\ последним элементом (имеющим индекс {N}\,\-\,1); выполнить описанные', 0, 3);
  TaskText('действия {N}\,\-\,1~раз, каждый раз уменьшая на~1 количество анализируемых элементов', 0, 4);
  TaskText('и\ выводя содержимое массива.', 0, 5);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    a0 := a[1];
    n1 := 1;
    for i := 2 to n-k+1 do
      if a[i]>a0 then
      begin
        a0 := a[i];
        n1 := i;
      end;
    a[n1] := a[n-k+1];
    a[n-k+1] := a0;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N} (\l\,6). Упорядочить его по\ возрастанию методом', 0, 1);
  TaskText('сортировки \Iпростыми вставками\i: сравнить элементы~{A}_{0} и~{A}_{1} и,\ при', 0, 2);
  TaskText('необходимости меняя\ их местами, добиться того, чтобы они оказались', 0, 3);
  TaskText('упорядоченными по\ возрастанию; затем обратиться к\ элементу~{A}_{2} и\ переместить', 0, 4);
  TaskText('его в\ левую (уже упорядоченную) часть массива, сохранив ее\ упорядоченность;', 0, 5);
  TaskText('повторить этот процесс для\ остальных элементов, выводя содержимое массива', 0, 0);
  TaskText('после обработки каждого элемента (от~{A}_{1} до~{A}_{N\-1}).', 0, 0);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 2 to n do
  begin
    a[0] := a[k];
    i := k;
    while a[i-1]>a[0] do
    begin
      a[i] := a[i-1];
      dec(i);
    end;
    a[i] := a[0];
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k-1,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N}. Не\ изменяя массив~{A}, вывести индексы его\ элементов', 0, 1);
  TaskText('в\ том порядке, в\ котором соответствующие\ им элементы образуют возрастающую', 0, 2);
  TaskText('последовательность. Использовать метод \I\<пузырьковой\> сортировки\i (см.\ задание', 0, 3);
  TaskText('\3), модифицировав\ его следующим образом: создать вспомогательный', 0, 4);
  TaskText('\Iмассив индексов\i~{I}, заполнив\ его числами от~0 до~{N}\-1; просматривать', 0, 5);
  TaskText('массив~{A}, сравнивая пары элементов массива~{A} с\ индексами~{I}_{0} и~{I}_{1},', 0, 0);
  TaskText('{I}_{1} и~{I}_{2},~\. и~меняя местами соответствующие элементы массива~{I}, если', 0, 0);
  TaskText('левый элемент пары больше правого. Повторив описанную процедуру просмотра', 0, 0);
  TaskText('{N}\,\-\,1~раз, получим в\ массиве~{I} требуемую последовательность индексов.', 0, 0);
(*
*)
(*==*)
  n := 5 + Random(6);
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
    b[i] := i;
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[b[i]]>a[b[i+1]] then
      begin
        j := b[i];
        b[i] := b[i+1];
        b[i+1] := j;
      end;
  end;
  for i := 1 to n do
    resultN('',b[i]-1,center(i,n,3,4)-1,3,3);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr45Bn16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('Даны массивы~{A} и~{B} одинакового размера~{N}. Поменять местами их\ содержимое', 0, 2);
  TaskText('и\ вывести вначале элементы преобразованного массива~{A},', 0, 3);
  TaskText(' а\ затем\ \= элементы преобразованного массива~{B}.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    a1[i] := 19.98*Random - 9.99;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),4,5);
  resultComment('A:',center(1,n+1,5,2),3);
  resultComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    resultR('',a1[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),4,5);
  SetNumberOfTests(5);
Pause;
end;




procedure SArr45Bn17(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N}. Сформировать новый массив~{B} того\ же размера,', 0, 2);
  TaskText('элементы которого определяются следующим образом:', 0, 3);
  TaskText('\[\Jrcrl&{B}_{K}&~=~&2\*{A}_{K},& если {A}_{K}~<~5,     ', 0, 4);
  TaskText('     &\,&\,& {A}_{K}/2&  в противном случае.\j\]', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := RandomR1(0.1, 9.9); //9.97*Random + 0.01; //2018
    if a[i] < 5 then a1[i] := a[i]*2
    else a1[i] := a[i]/2;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Даны два массива~{A} и~{B} одинакового размера~{N}.', 0, 2);
  TaskText('Сформировать новый массив~{C} того\ же размера, каждый элемент которого', 0, 3);
  TaskText('равен максимальному из\ элементов массивов~{A} и~{B} с\ тем\ же индексом.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a1[i] := 19.98*Random - 9.99;
    a2[i] := 19.98*Random - 9.99;
    if a1[i]>a2[i] then a[i] := a1[i]
    else a[i] := a2[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),3,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+1,5,2),3);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('Дан целочисленный массив~{A} размера~{N}. Переписать в\ новый целочисленный', 0, 2);
  TaskText('массив~{B} все\ четные числа из исходного массива (в\ том\ же порядке)', 0, 3);
  TaskText('и\ вывести размер полученного массива~{B} и\ его\ содержимое.', 0, 4);
(*
*)
  n := 2 + Random(9);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    if not Odd(b[i]) then inc(k);
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,4),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,4),4,3);
  resultN('Размер массива B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,4),4);
  j := 0;
  for i := 1 to n do
  if not Odd(b[i]) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,4),4,3);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Дан целочисленный массив~{A} размера~{N} (\l\,15). Переписать в\ новый целочисленный', 0, 2);
  TaskText('массив~{B} все\ элементы с\ четными индексами (0, 2,~\.)', 0, 3);
  TaskText('и\ вывести размер полученного массива~{B} и\ его\ содержимое.', 0, 4);
  TaskText('Условный оператор не использовать.', 0, 5);
(*
*)
  end
  else
  begin
  TaskText('Дан целочисленный массив~{A} размера~{N} (\l\,15). Переписать в\ новый целочисленный', 0, 2);
  TaskText('массив~{B} все\ элементы с\ индексами, кратными трем (0, 3, 6,~\.),', 0, 3);
  TaskText('и\ вывести размер полученного массива~{B} и\ его\ содержимое.', 0, 4);
  TaskText('Условный оператор не использовать.', 0, 5);
(*
*)
  end;
(*==*)
  n := 2 + Random(14);
  case curtest of //2012
  2: n := (Random(7)+1)*2;
  4: n := (Random(7)+1)*2+1;
  end;
  if v1 = 1 then k := (n+1) div 2
  else k := (n-1) div 3 + 1;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,1),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,1),4,3);
  resultN('Размер массива B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,3),4);
  j := 0;
  for i := 1 to n do
  case v1 of
  1:
  if Odd(i) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  2:
  if (i-1) mod 3 = 0 then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn21(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('Дан целочисленный массив~{A} размера~{N}. Переписать в\ новый', 0, 1);
  TaskText('целочисленный массив~{B} того\ же размера вначале все\ элементы', 0, 2);
  TaskText('исходного массива с\ нечетными индексами, а\ затем\ \= с\ четными:', 0, 3);
  TaskText('\[{A}_{1},\q {A}_{3},\q {A}_{5},\q \.,\q {A}_{0},\q {A}_{2},\q {A}_{4},\q \.~.\]', 0, 4);
  TaskText('Условный оператор не использовать.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  case curtest of //2012
  3: n := (Random(5)+1)*2;
  4: n := (Random(4)+1)*2+1;
  end;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,3),4);
  for i := 1 to n do
    dataN('',b[i],center(i+1,n+1,3,3),4,3);
  resultComment('B:',center(1,n+1,3,3),3);
  for i := 1 to n div 2 do
    resultN('',b[2*i],center(i+1,n+1,3,3),3,3);
  for i := 1 to (n+1) div 2 do
    resultN('',b[2*i-1],center(n div 2 +i+1,n+1,3,3),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Дан массив~{A} размера~{N}.', 0, 2);
  TaskText('Сформировать новый массив~{B} того\ же размера по\ следующему правилу:', 0, 3);
  TaskText('элемент~{B}_{K} равен сумме элементов массива~{A} с\ индексами от~0 до~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('Дан массив~{A} размера~{N}.', 0, 2);
  TaskText('Сформировать новый массив~{B} того\ же размера по\ следующему правилу:', 0, 3);
  TaskText('элемент~{B}_{K} равен среднему арифметическому элементов массива~{A}', 0, 4);
  TaskText('с\ индексами от~0 до~{K}.', 0, 5);
(*
*)
  end;
(*==*)
  n := 2 + Random(9);
  if v1 = 1 then
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i-1]+a[i];
    end;
  end
  else
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((i-1)*a1[i-1]+a[i])/i;
    end;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N}.', 0, 2);
  TaskText('Сформировать новый массив~{B} того\ же размера по\ следующему правилу:', 0, 3);
  TaskText('элемент~{B}_{K} равен сумме элементов массива~{A} с\ индексами от~{K} до~{N}\-1.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
    a[N] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[N] := a[N];
    for i:=N-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i+1]+a[i];
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N}.', 0, 2);
  TaskText('Сформировать новый массив~{B} того\ же размера по\ следующему правилу:', 0, 3);
  TaskText('элемент~{B}_{K} равен среднему арифметическому элементов массива~{A}', 0, 4);
  TaskText('с\ индексами от~{K} до~{N}\-1.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
    a[n] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[n] := a[n];
    for i := n-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((n-i)*a1[i+1]+a[i])/(n-i+1);
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Bn25(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('Дан массив~{A} размера~{N}. Сформировать два\ новых массива~{B} и~{C}:', 0, 1);
  TaskText('в\ массив~{B} записать все\ положительные элементы массива~{A},', 0, 2);
  TaskText('в\ массив~{C}\ \= все\ отрицательные (сохраняя исходный порядок', 0, 3);
  TaskText('следования элементов). Вывести вначале размер и\ содержимое', 0, 4);
  TaskText('массива~{B}, а\ затем\ \= размер и\ содержимое массива~{C}.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  n1 := 0;
  n2 := 0;
  for i:=1 to n do
  begin
    a[i] := 19.98*Random-9.99;
    if a[i]>0 then
    begin
      inc(n1);
      a1[n1] := a[i];
    end
    else
    if a[i] < 0 then
    begin
      inc(n2);
      a2[n2] := a[i];
    end;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),4,5);
  if n1 > n2 then k := n1
  else k := n2;
  resultN('Размер массива B: ',n1,0,2,2);
  if n1 > 0 then
    resultComment('B:',center(1,k+1,5,2),3);
  for i := 1 to n1 do
    resultR('',a1[i],center(i+1,k+1,5,2),3,5);
  resultN('Размер массива C: ',n2,0,4,2);
  if n2 > 0 then
    resultComment('C:',center(1,k+1,5,2),5);
  for i := 1 to n2 do
    resultR('',a2[i],center(i+1,k+1,5,2),5,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn26(Name, Key: string);
var
  v1, v2, v3: Byte;
  k1, k2: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Даны два массива~{A} и~{B} размера~5, элементы которых', 0, 2);
  TaskText('упорядочены по\ возрастанию. Объединить эти\ массивы так, чтобы', 0, 3);
  TaskText('результирующий массив~{C} (размера~10) остался упорядоченным по\ возрастанию.', 0, 4);
(*
Используйте для\ каждого массива вспомогательную переменную,
\<указывающую\> на\ первый из\ элементов, еще не\ помещенных
в\ результирующий массив. В\ каждый момент времени в\ результирующий
массив будет помещаться один из\ элементов, на\ которые указывают
вспомогательные переменные. Особая проблема возникает в\ ситуации,
когда исчерпываются элементы одного из\ массивов. Для ее\ решения
удобно использовать прием \Iбарьера\i, добавив в\ конец каждого
массива еще\ один элемент, заведомо больший (меньший) всех предыдущих.
*)
  n := 5;
  for i := 1 to n do
  begin
    a1[i] := 19.98*Random-9.99;
    a2[i] := 19.98*Random-9.99;
  end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a1[i]>a1[i+1] then
      begin
        a0 := a1[i];
        a1[i] := a1[i+1];
        a1[i+1] := a0;
      end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a2[i]>a2[i+1] then
      begin
        a0 := a2[i];
        a2[i] := a2[i+1];
        a2[i+1] := a0;
      end;
  a1[n+1] := 1000;
  a2[n+1] := 1000;
  k1 := 1;
  k2 := 1;
  k := 0;
  for i := 1 to n+n do
    if a1[k1]<a2[k2] then
    begin
      inc(k);
      a[k] := a1[k1];
      inc(k1);
    end
    else
    begin
      inc(k);
      a[k] := a2[k2];
      inc(k2);
    end;
  dataComment('A:',center(1,n+1,5,2),2);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),2,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+n+1,5,2),3);
  for i := 1 to n+n do
    resultR('',a[i],center(i+1,n+n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn27(Name, Key: string);
function maxInd(n1,n2,n3: integer): integer;
begin
if (n1>n2)and(n1>n3) then maxInd := 1
else
  if n2>n3 then maxInd := 2
  else maxInd := 3;
end;
var
  v1, v2, v3: Byte;
  n1,n2,n3,k1,k2,k3: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Даны три целочисленных массива~{A}, {B} и~{C} размера~{N}_A, {N}_B, {N}_C соответственно,', 0, 2);
  TaskText('элементы которых упорядочены по\ убыванию.', 0, 3);
  TaskText('Объединить эти\ массивы так, чтобы результирующий целочисленный массив~{D}', 0, 4);
  TaskText('(размера~{N}_A\;+\;{N}_B\;+\;{N}_C) остался упорядоченным по\ убыванию.', 0, 5);
(*
+
*)
(*==*)
  repeat
  n1 := 3 + Random(8);
  n2 := 3 + Random(8);
  n3 := 3 + Random(8);
  n := n1 + n2 + n3;
  until n <=18;
  for i := 1 to n1 do
    b1[i] := Random(199)-99;
  for i := 1 to n2 do
    b2[i] := Random(199)-99;
  for i := 1 to n3 do
    b3[i] := Random(199)-99;
  for k := 1 to n1-1 do
    for i := 1 to n1-k do
      if b1[i]<b1[i+1] then
      begin
        j := b1[i];
        b1[i] := b1[i+1];
        b1[i+1] := j;
      end;
  for k := 1 to n2-1 do
    for i := 1 to n2-k do
      if b2[i]<b2[i+1] then
      begin
        j := b2[i];
        b2[i] := b2[i+1];
        b2[i+1] := j;
      end;
  for k := 1 to n3-1 do
    for i := 1 to n3-k do
      if b3[i]<b3[i+1] then
      begin
        j := b3[i];
        b3[i] := b3[i+1];
        b3[i+1] := j;
      end;
  b1[n1+1] := -1000;
  b2[n2+1] := -1000;
  b3[n3+1] := -1000;
  k1 := 1;
  k2 := 1;
  k3 := 1;
  k := 0;
  for i := 1 to n1+n2+n3 do
    case MaxInd(b1[k1],b2[k2],b3[k3]) of
    1:
      begin
        inc(k);
        b[k] := b1[k1];
        inc(k1);
      end;
    2:
      begin
        inc(k);
        b[k] := b2[k2];
        inc(k2);
      end;
    3:
      begin
        inc(k);
        b[k] := b3[k3];
        inc(k3);
      end;
     end;
  dataN('N_A = ',n1,5,2,1);
  dataComment('A:',15,2);
  for i := 1 to n1 do
    dataN('',b1[i],15+i*4,2,3);
  dataN('N_B = ',n2,5,3,1);
  dataComment('B:',15,3);
  for i := 1 to n2 do
    dataN('',b2[i],15+i*4,3,3);
  dataN('N_C = ',n3,5,4,1);
  dataComment('C:',15,4);
  for i := 1 to n3 do
    dataN('',b3[i],15+i*4,4,3);
  resultComment('D:',center(1,n+1,3,1),3);
  for i := 1 to n do
    resultN('',b[i],center(i+1,n+1,3,1),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn28(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Bn29(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('Дан целочисленный массив~{A} размера~{N}. Назовем \Iсерией\i группу подряд идущих', 0, 1);
  TaskText('одинаковых элементов, а\ \Iдлиной серии\i\ \= количество этих элементов (длина серии', 0, 2);
  TaskText('может быть равна~1). Сформировать два новых целочисленных массива~{B} и~{C}', 0, 3);
  TaskText('одинакового размера, записав в\ массив~{B} длины всех серий исходного массива,', 0, 4);
  TaskText('а\ в\ массив~{C}\ \= значения элементов, образующих эти\ серии.', 0, 5);
(*
Решение этого задания приводится в\ п.\,10.1.
*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
dataN('N = ',n,0,2,1);
dataComment('A:',center(1,n+1,1,6),4);
for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,2,5),4,2);
resultComment('B:',center(1,m+1,1,6),2);
for i := 1 to m do
  resultN('',b1[i],center(i+1,m+1,2,5),2,2);
resultComment('C:',center(1,m+1,1,6),4);
for i := 1 to m do
  resultN('',b2[i],center(i+1,m+1,2,5),4,2);
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Bn30(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
s := '';
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Вставить перед каждой его\ серией элемент с нулевым значением',0,3);
taskText('(определение серии дано в\ задании \1).',0,4);
(*
*)
end;
2:
begin
s := '';
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Вставить после каждой его\ серии элемент с нулевым значением',0,3);
taskText('(определение серии дано в\ задании \2).',0,4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
if v1=1 then
  begin
    m := 1;
    b1[m] := 0;
  end;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := 0;
        m := m+2;
      end;
Inc(m);
b1[m] := b[n];
if v1=2 then
    begin
      Inc(m);
      b1[m] := 0;
    end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn31(Name, Key: string);
label 2;
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дан целочисленный массив размера~{N}.',0,2);
taskText('Преобразовать массив, увеличив каждую его\ серию на\ один элемент',0,3);
taskText('(определение серии дано в\ задании \3).',0,4);
(*
*)
end;
2:
begin
taskText('Дан целочисленный массив размера~{N},',0,2);
taskText('содержащий по\ крайней мере одну серию, длина которой больше~1.',0,3);
taskText('Преобразовать массив, уменьшив каждую его\ серию на\ один элемент',0,4);
taskText('(определение серии дано в\ задании \4).',0,5);
(*
*)
end;
end;
(*==*)
2:
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
    if v1=1 then
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := b[i-1];
        m := m+2;
      end;
if v1=1 then
    begin
      b1[m+1] := b[n];
      b1[m+2] := b[n];
      m := m+2;
    end;
if m = 0 then goto 2;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn32(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Дано целое число~{K} (\g\,0) и\ целочисленный массив размера~{N}.', 0, 2);
  TaskText('Преобразовать массив, удвоив длину его\ серии с\ номером~{K}', 0, 3);
  TaskText('(определение серии дано в\ задании \5, серии нумеруются от~0).',0,4);
  TaskText('Если число серий в\ массиве меньше~{K}\,+\,1, то\ вывести массив без\ изменений.', 0, 5);
(*
*)
(*==*)
  k := 1 + Random(4);
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
   b1[k] := 2*b1[k];
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
if j <= 10 then l := 5
else l := 2;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,l),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn33(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l,f: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Дано целое число~{K} (\g\,1) и\ целочисленный массив размера~{N}.', 0, 2);
  TaskText('Удалить из\ массива серию с\ номером~{K}', 0, 3);
  TaskText('(определение серии дано в\ задании \6, серии нумеруются от~0).', 0, 4);
  TaskText('Если число серий в\ массиве меньше~{K}\,+\,1, то\ вывести массив без\ изменений.', 0, 5);
(*
*)
(*==*)
  k := 2 + Random(4);
  f := Random(5);
repeat
for i := 1 to 20 do b1[i] := 0;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
until b1[k]=f;
if k <=m then
   b1[k] := 0;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn34(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дано целое число~{K} (\g\,1) и\ целочисленный массив размера~{N}.',0,2);
taskText('Поменять местами начальную серию массива и\ его\ серию с\ номером~{K}',0,3);
TaskText('(определение серии дано в\ задании \7, серии нумеруются от~0).', 0, 4);
taskText('Если число серий в\ массиве меньше~{K}\,+\,1, то\ вывести массив без\ изменений.',0,5);
(*
*)
end;
2:
begin
taskText('Дано целое число~{K} (\g\,0) и\ целочисленный массив размера~{N}.',0,2);
taskText('Поменять местами последнюю серию массива и\ его\ серию с\ номером~{K}',0,3);
TaskText('(определение серии дано в\ задании \8, серии нумеруются от~0).', 0, 4);
taskText('Если число серий в\ массиве меньше~{K}\,+\,1, то\ вывести массив без\ изменений.',0,5);
(*
*)
end;
end;
(*==*)
case v1 of
1: k := 2 + Random(4);
2: k := 1 + Random(4);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
case v1 of
1: begin
     j := b1[1];
     b1[1] := b1[k];
     b1[k] := j;
     j := b2[1];
     b2[1] := b2[k];
     b2[k] := j;
   end;
2: begin
     j := b1[m];
     b1[m] := b1[k];
     b1[k] := j;
     j := b2[m];
     b2[m] := b2[k];
     b2[k] := j;
   end;
end;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to n do
  resultN('',b[i],center(i,n,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn35(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(7, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дано целое число~{L} (>\,1) и\ целочисленный массив размера~{N}.',0,2);
taskText('Заменить каждую серию массива, длина которой меньше~{L}, на\ один элемент',0,3);
TaskText('с\ нулевым значением (определение серии дано в\ задании \9).', 0, 4);
(*
*)
end;
2:
begin
taskText('Дано целое число~{L} (>\,0) и\ целочисленный массив размера~{N}.',0,2);
taskText('Заменить каждую серию массива, длина которой равна~{L}, на\ один элемент',0,3);
TaskText('с\ нулевым значением (определение серии дано в\ задании \10).', 0, 4);
(*
*)
end;
3:
begin
taskText('Дано целое число~{L} (>\,0) и\ целочисленный массив размера~{N}.',0,2);
taskText('Заменить каждую серию массива, длина которой больше~{L}, на\ один элемент',0,3);
TaskText('с\ нулевым значением (определение серии дано в\ задании \11).', 0, 4);
(*
*)
end;
end;
(*==*)
case v1 of
2: k := 1 + Random(4);
3: k := 1 + Random(3);
1: k := 2 + Random(3);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
j := 0;
for i := 1 to m do
  case v1 of
  1: if b1[i]>=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  2: if b1[i]<>k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  3: if b1[i]<=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  end;
dataN('L = ',k,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
for i := 1 to j do
  resultN('',b3[i],center(i,j,2,5),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Bn36(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дан целочисленный массив размера~{N}. Преобразовать массив,',0,2);
taskText('увеличив его\ первую серию наибольшей длины на\ один элемент',0,3);
TaskText('(определение серии дано в\ задании \12).', 0, 4);
(*
*)
end;
2:
begin
taskText('Дан целочисленный массив размера~{N}. Преобразовать массив,',0,2);
taskText('увеличив его\ последнюю серию наибольшей длины на\ один элемент',0,3);
TaskText('(определение серии дано в\ задании \13).', 0, 4);
(*
*)
end;
3:
begin
taskText('Дан целочисленный массив размера~{N}. Преобразовать массив,',0,2);
taskText('увеличив все его\ серии наибольшей длины на\ один элемент',0,3);
TaskText('(определение серии дано в\ задании \14).', 0, 4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(5);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
bmax := -1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      if l >= bmax then
        begin
          bmax := l;
          j := i-1;
        end;
      l := 1;
    end;
if l >= bmax then
 begin
  bmax := l;
  j:=n;
 end;
m := 0;
l := 1;
case v1 of
3:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if l = bmax then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if l = bmax then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
1:
begin
j := 0;
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=0) then
        begin
          j := 1;
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=0) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
2:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];
  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=i-1) then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=n) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Bn37(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Bn38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дано множество~{A} из\ {N}~точек на\ плоскости и\ точка~{B}',0,1);
taskText('(точки заданы своими координатами~{x},\;{y}).',0,2);
taskText('Найти точку из\ множества~{A}, наиболее близкую к\ точке~{B}.',0,3);
taskText('\IРасстояние\i~{R} между точками с\ координатами ({x}_1,\;{y}_1) и~({x}_2,\;{y}_2)',0,4);
taskText('вычисляется по\ формуле:\[      {R}~=~\R({x}_2\,\-\,{x}_1)^2\;+\;({y}_2\,\-\,{y}_1)^2\r.\]',0,5);
(*
При выполнении данного и подобных ему заданий можно обойтись
без\ извлечения квадратных корней, сравнивая \Iквадраты\i расстояний.
*)
(*==*)
n := 4 + Random(5);
for i:=0 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[1]-x[0])+sqr(y[1]-y[0]);
amax := amin;
nmin := 1;
nmax := 1;
for i := 2 to n do
  begin
    r0 := sqr(x[i]-x[0])+sqr(y[i]-y[0]);
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end
    else
      if amax < r0 then
        begin
          amax := r0;
          nmax := i;
        end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
dataR2(' B:  ',x[0],y[0],0,5,6);
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(10, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Дано множество~{A} из\ {N}~точек (точки заданы своими координатами {x},\;{y}).',0,2);
taskText('Среди всех точек этого множества, лежащих во\ второй четверти,',0,3);
taskText('найти точку, наиболее удаленную от\ начала координат.',0,4);
taskText('Если таких точек\ нет, то\ вывести точку с\ нулевыми координатами.',0,5);
(*
*)
end;
2:
begin
taskText('Дано множество~{A} из\ {N}~точек (точки заданы своими координатами {x},\;{y}).',0,2);
taskText('Среди всех точек этого множества, лежащих в\ первой или\ третьей четверти,',0,3);
taskText('найти точку, наиболее близкую к\ началу координат.',0,4);
taskText('Если таких точек\ нет, то\ вывести точку с\ нулевыми координатами.',0,5);
(*
*)
end;
end;
(*==*)
n := 3 + Random(6);
x[0] := 0; y[0] := 0;
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
case v1 of
2: begin amin := 1000; k := 1; end;
1: begin amin := 0; k := -1; end;
end;
nmin := 0;
for i := 1 to n do
  begin
    r0 := sqr(x[i])+sqr(y[i]);
    case v1 of
    2 : if (x[i]*y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    1 : if (x[i]<0)and(y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn40(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
taskText('Дано множество~{A} из\ {N}~точек (точки заданы своими координатами~{x},\;{y}).',0,2);
taskText('Найти пару точек этого множества с\ максимальным расстоянием между ними',0,3);
taskText('и\ само это\ расстояние (точки выводятся в\ том\ же порядке,',0,4);
taskText('в\ котором они\ перечислены при\ задании множества~{A}).',0,5);
(*
*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[2]-x[1])+sqr(y[2]-y[1]);
bmin := 1;
nmin := 2;
for i := 1 to n-1 do
  for j := i+1 to n do
  begin
    r0 := sqr(x[i]-x[j])+sqr(y[i]-y[j]);
    if amin < r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('Первая точка:',x[bmin],y[bmin],xLeft,2,6);
resultR2('Вторая точка:',x[nmin],y[nmin],xRight,2,6);
resultR('Расстояние: ',sqrt(amin),0,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn41(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('Даны множества~{A} и~{B}, состоящие соответственно из~{N}_1 и~{N}_2 точек', 0, 2);
  TaskText('(точки заданы своими координатами~{x},\;{y}). Найти минимальное расстояние', 0, 3);
  TaskText('между точками этих множеств и\ сами точки, расположенные на\ этом расстоянии', 0, 4);
  TaskText('(вначале выводится точка из\ множества~{A}, затем точка из\ множества~{B}).', 0, 5);
(*
*)
(*==*)
n := 4 + Random(5);
n1 := 4 + Random(5);
{//n := 8;}
{//n1 := 8;}
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i:=1 to n1 do
  begin
  x1[i] := 19.98*Random-9.99;
  y1[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  for j := 1 to n1 do
  begin
    r0 := sqrt(sqr(x[i]-x1[j])+sqr(y[i]-y1[j]));
    if amin > r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N_1 = ',n,3,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i,n0,14,3)+3,2,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i-n0,n0,14,3)+3,3,6); //!
dataN('N_2 = ',n1,3,4,1);
n0 := (n1 +1) div 2;
j := n1 mod 2;
for i := 1 to n0 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i,n0,14,3)+3,4,6); //!
for i := n0+1 to n1 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i-n0,n0,14,3)+3,5,6); //!
resultR('Расстояние:',amin,0,2,5);
resultR2('Точка из множества A:',x[bmin],y[bmin],xLeft,4,6);
resultR2('Точка из множества B:',x1[nmin],y1[nmin],xRight,4,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn42(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
taskText('Дано множество~{A} из\ {N}~точек ({N}~>~2, точки заданы своими координатами~{x},\;{y}).',0,2);
taskText('Найти такую точку из\ данного множества, сумма расстояний от\ которой',0,3);
taskText('до\ остальных его\ точек минимальна, и\ саму эту\ сумму.',0,4);
(*
*)
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  begin
  r0 := 0;
  for j := 1 to n do
    r0 := r0 + sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('Координаты точки:',x[nmin],y[nmin],25,2,6);
resultR('Сумма расстояний: ',amin,25,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn43(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  n0 := -1;
amin := -10000;
  TaskText('Дано множество~{A} из\ {N}~точек ({N}~>~2, точки заданы своими координатами~{x},\;{y}).', 0, 2);
  TaskText('Найти наибольший периметр треугольника, вершины которого принадлежат', 0, 3);
  TaskText('различным точкам множества~{A}, и\ сами эти\ точки (точки выводятся', 0, 4);
  TaskText('в\ том\ же порядке, в\ котором они перечислены при\ задании множества~{A}).', 0, 5);
(*
*)
  end;
  2: begin
  n0 := 1;
amin := 10000;
  TaskText('Дано множество~{A} из\ {N}~точек ({N}~>~2, точки заданы своими координатами~{x},\;{y}).', 0, 2);
  TaskText('Найти наименьший периметр треугольника, вершины которого принадлежат', 0, 3);
  TaskText('различным точкам множества~{A}, и\ сами эти\ точки (точки выводятся', 0, 4);
  TaskText('в\ том\ же порядке, в\ котором они перечислены при\ задании множества~{A}).', 0, 5);
(*
*)
  end;
  end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i := 1 to n-2 do
  for j := i + 1 to n-1 do
    for k := j + 1 to n do
      begin
        r0 := sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j])) +
              sqrt(sqr(x[i]-x[k])+sqr(y[i]-y[k])) +
              sqrt(sqr(x[k]-x[j])+sqr(y[k]-y[j]));
       if n0*amin > n0*r0 then
         begin
           amin := r0;
           b[1] := i;
           b[2] := j;
           b[3] := k;
        end;
      end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR('Периметр треугольника:',amin,0,2,6);
resultComment('Координаты вершин треугольника:',0,3);
for i := 1 to 3 do
  resultR2(' '+chr(47+i)+': ',x[b[i]],y[b[i]],center(i,3,15,4),4,6); //!
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn44(Name, Key: string);
var
  v1, v2, v3: Byte;
  bln: Boolean;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  TaskText('Дано множество~{A} из\ {N}~точек с\ целочисленными координатами~{x},\;{y}.', 0, 1);
  TaskText('\IПорядок\i на\ координатной плоскости определим следующим образом:', 0, 2);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q если либо {x}_1~<~{x}_2, либо {x}_1~=~{x}_2 и {y}_1~<~{y}_2.\]', 0, 3);
  TaskText('Расположить точки данного множества по\ возрастанию', 0, 4);
  TaskText('в\ соответствии с\ указанным порядком.', 0, 5);
(*
*)
end;
2:
begin
  TaskText('Дано множество~{A} из\ {N}~точек с\ целочисленными координатами~{x},\;{y}.', 0, 1);
  TaskText('\IПорядок\i на\ координатной плоскости определим следующим образом:', 0, 2);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q если либо {x}_1\,+\,{y}_1~<~{x}_2\,+\,{y}_2, '+
         'либо {x}_1\,+\,{y}_1~=~{x}_2\,+\,{y}_2 и\ {x}_1~<~{x}_2.\]', 0, 3);
  TaskText('Расположить точки данного множества по\ убыванию', 0, 4);
  TaskText('в\ соответствии с\ указанным порядком.', 0, 5);
(*
*)
end;
end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x2[i] := integer(Random(19))-9;
  y2[i] := integer(Random(19))-9;
  end;
for i := 1 to 3 do
  case v1 of
  1:
  x2[Random(n)+1] := x2[Random(n)+1];
  2:
  y2[Random(n)+1] := y2[Random(n)+1];
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i,n0,9,7),3,3); //!
for i := n0+1 to n do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i-n0,n0,9,7),4,3); //!
for k := 1 to n-1 do
  for i := 1 to n-k do
   begin
     case v1 of
     1: bln := (x2[i]>x2[i+1])or((x2[i]=x2[i+1])and(y2[i]>y2[i+1]));
     2: bln := (x2[i]+y2[i]<x2[i+1]+y2[i+1])or((x2[i]+y2[i]=x2[i+1]+y2[i+1])and(x2[i]<x2[i+1]));
     end;
     if bln then
        begin
          n1 := x2[i];
          x2[i] := x2[i+1];
          x2[i+1] := n1;
          n1 := y2[i];
          y2[i] := y2[i+1];
          y2[i+1] := n1;
        end;
   end;
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i,n0,9,7),3,3); //!
for i := n0+1 to n do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i-n0,n0,9,7),4,3); //!
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




begin
Topic := 'ОДНОМЕРНЫЕ МАССИВЫ';
Topic4 := 'ОДНОМЕРНЫЕ МАССИВЫ: ПРЕОБРАЗОВАНИЕ';
Topic5 := 'РАБОТА С НЕСКОЛЬКИМИ ОДНОМЕРНЫМИ МАССИВАМИ';
Topic6 := 'ОДНОМЕРНЫЕ МАССИВЫ: СОРТИРОВКА';
Topic7 := 'ОДНОМЕРНЫЕ МАССИВЫ: СЕРИИ ЦЕЛЫХ ЧИСЕЛ';
Topic8 := 'ОДНОМЕРНЫЕ МАССИВЫ: МНОЖЕСТВА ТОЧЕК НА ПЛОСКОСТИ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.

