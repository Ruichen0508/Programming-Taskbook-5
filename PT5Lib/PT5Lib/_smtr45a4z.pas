{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit _SMtr45A4z;

{$MODE Delphi}

interface

procedure SMtr45An1(Name, Key: string);
procedure SMtr45An2(Name, Key: string);
procedure SMtr45An3(Name, Key: string);
procedure SMtr45An4(Name, Key: string);
procedure SMtr45An5(Name, Key: string);
procedure SMtr45An6(Name, Key: string);
procedure SMtr45An7(Name, Key: string);
procedure SMtr45An8(Name, Key: string);
procedure SMtr45An9(Name, Key: string);
procedure SMtr45An10(Name, Key: string);
procedure SMtr45An11(Name, Key: string);
procedure SMtr45An12(Name, Key: string);
procedure SMtr45An13(Name, Key: string);
procedure SMtr45An14(Name, Key: string);
procedure SMtr45An15(Name, Key: string);
procedure SMtr45An16(Name, Key: string);
procedure SMtr45An17(Name, Key: string);
procedure SMtr45An18(Name, Key: string);
procedure SMtr45An19(Name, Key: string);
procedure SMtr45An20(Name, Key: string);
procedure SMtr45An21(Name, Key: string);
procedure SMtr45An22(Name, Key: string);
procedure SMtr45An23(Name, Key: string);
procedure SMtr45An24(Name, Key: string);
procedure SMtr45An25(Name, Key: string);
procedure SMtr45An26(Name, Key: string);
procedure SMtr45An27(Name, Key: string);
procedure SMtr45An28(Name, Key: string);
procedure SMtr45An29(Name, Key: string);
procedure SMtr45An30(Name, Key: string);
procedure SMtr45An31(Name, Key: string);
procedure SMtr45An32(Name, Key: string);
procedure SMtr45An33(Name, Key: string);
procedure SMtr45An34(Name, Key: string);
procedure SMtr45An35(Name, Key: string);
procedure SMtr45An36(Name, Key: string);
procedure SMtr45An37(Name, Key: string);
procedure SMtr45An38(Name, Key: string);
procedure SMtr45An39(Name, Key: string);
procedure SMtr45An40(Name, Key: string);
procedure SMtr45An41(Name, Key: string);
procedure SMtr45An42(Name, Key: string);
procedure SMtr45An43(Name, Key: string);
procedure SMtr45An44(Name, Key: string);
procedure SMtr45An45(Name, Key: string);

implementation

uses PT5TaskMaker;

var a,a0 : array [0..10,0..10] of real;
    b,b0 : array [1..10,1..10] of integer;
    a1: array [1..15] of real;
    b1,b2: array [0..20] of integer;
    m,n,k,k1,k2,k3: integer;
    amax,amin,r,r1,r2 : real;
    Topic, Topic1, Topic2, Topic3, Topic4, Topic5, Author : string;

procedure inita(M,N : integer);
var i,j:integer;
  begin
  for i:=1 to M do
  for j:=1 to N do
    a[i,j] := RandomR2(0.1,9.9); //9.98 * Random; //2018
  end;

procedure ina(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,N,4,2),i+k,4);
  end;
end;


procedure ina3(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := RandomR2(-9.9,9.9); //19.98*Random-10; //2018
    dataR('',a[i,j],center(j,N,5,1),i+k,5);
  end;
end;


procedure ina1(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
    dataR('',a[i,j],center(j,N,4,2),i+k,4);
end;

procedure ina2(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
    dataR('',a[i,j],center(j,N,5,1),i+k,5);
end;

procedure inb(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    dataN('',b[i,j],center(j,N,2,4),i+k,2);
  end;
end;

procedure inaM(M: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,12,1,1);
for i := 1 to M do
  for j := 1 to M do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,M,4,2),i+k,4);
  end;
end;

procedure inaM1(M: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,12,1,1);
for i := 1 to M do
  for j := 1 to M do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,M,5,1),i+k,5);
  end;
end;

procedure outa0(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,4,2),i+k,4);
end;

procedure outa03(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,5,1),i+k,5);
end;



procedure outa01(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,5,1),i+k,5);
end;

procedure outb0(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultN('',b0[i,j],center(j,N,2,3),i+k,2);
end;


procedure SMtr45An1(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic1, Author, Key, 57{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Даны целые положительные числа~{M} и~{N}.', 0, 2);
  TaskText('Сформировать целочисленную матрицу размера {M}\;\x\;{N},', 0, 3);
  TaskText('у\ которой все\ элементы \Um{I}-й\um~строки имеют значение~10\*({I}~+~1) ({I}~=~0,\,\.,\,{M}\-1).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Даны целые положительные числа~{M} и~{N}.', 0, 2);
  TaskText('Сформировать целочисленную матрицу размера {M}\;\x\;{N},', 0, 3);
  TaskText('у\ которой все\ элементы \Um{J}-го\um~столбца имеют значение~5\*({J}~+~1) ({J}~=~0,\,\.,\,{N}\-1).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(7); //2 + Random(4);
  n := 3 + Random(7);
  dataN('M = ',m,xleft,3,1);
  dataN('N = ',n,xright,3,1);
  for i := 1 to m do
    for j := 1 to n do
      case v1 of
      1: b0[i,j] := 10*i;
      2: b0[i,j] := 5*j;
      end;
  outb0(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An2(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic1, Author, Key, 57{level});
  GetVariant(1, 4, 0, 0, v1, v2, v3);
case v1 of
  1: begin
  TaskText('Даны целые положительные числа~{M}, {N} и\ набор из\ {M}~чисел.', 0, 2);
  TaskText('Сформировать матрицу размера~{M}\;\x\;{N}, у\ которой в\ каждом столбце', 0, 3);
  TaskText('содержатся все\ числа из\ исходного набора (в\ том\ же порядке).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Даны целые положительные числа~{M}, {N} и\ набор из\ {N}~чисел.', 0, 2);
  TaskText('Сформировать матрицу размера~{M}\;\x\;{N}, у\ которой в\ каждой строке', 0, 3);
  TaskText('содержатся все\ числа из\ исходного набора (в\ том\ же порядке).', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('Даны целые положительные числа~{M}, {N}, число~{D} и\ набор из\ {M}~чисел.', 0, 1);
  TaskText('Сформировать матрицу размера~{M}\;\x\;{N}, у\ которой первый столбец совпадает', 0, 2);
  TaskText('с\ исходным набором чисел, а\ элементы каждого следующего столбца равны', 0, 3);
  TaskText('сумме соответствующего элемента предыдущего столбца и\ числа~{D} (в\ результате', 0, 4);
  TaskText('каждая строка матрицы будет содержать элементы \Iарифметической прогрессии\i).', 0, 5);
(*
*)
  end;
  4: begin
  TaskText('Даны целые положительные числа~{M}, {N}, число~{D} и\ набор из\ {N}~чисел.', 0, 1);
  TaskText('Сформировать матрицу размера~{M}\;\x\;{N}, у\ которой первая строка совпадает', 0, 2);
  TaskText('с\ исходным набором чисел, а\ элементы каждой следующей строки равны', 0, 3);
  TaskText('соответствующему элементу предыдущей строки, умноженному на~{D} (в\ результате', 0, 4);
  TaskText('каждый столбец матрицы будет содержать элементы \Iгеометрической прогрессии\i).', 0, 5);
(*
*)
  end;
  end;
(*==*)
while true do
begin
  m := 3 + Random(7); //2 + Random(4);
  n := 3 + Random(7);
  for i := 1 to 10 do
    a1[i] := RandomR2(0.1,9.9); //9.98 * Random; //2018
  if v1 in [2,4] then k := n else k := m;
  case v1 of
  3: begin
    r := RandomR2(2,6); //2 + 4*Random;
  end;
  4: begin
    r := RandomR2(0.5,2); //0.5 + 1.5*Random;
  end;
  end;
  k1 := 0;
  for i := 1 to m do
    for j := 1 to n do
      begin
      case v1 of
      1: a0[i,j] := a1[i];
      2: a0[i,j] := a1[j];
      3: a0[i,j] := a1[i] + (j-1)*r;
      4: if i = 1 then a0[i,j] := a1[j]
                  else a0[i,j] := a0[i-1,j]*r;
      end;
      if (a0[i,j]<0.1) or (a0[i,j]>99) then
          k1 := 1;
      end;
  if k1 = 0 then break;
  end;
  dataN('M = ',m,xleft,2,1);
  dataN('N = ',n,xright,2,1);
  case v1 of
  3: begin
    dataR('D = ',r,0,3,4);
  end;
  4: begin
    dataR('D = ',r,0,3,4);
  end;
  end;
  for i := 1 to k do
    dataR('',a1[i],center(i,k,5,1),4,5);
  outa01(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An3(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});(*DEMO*)
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Вывести элементы \Um{K}-й\um~строки данной матрицы.', 0, 4);
(*
*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
    k := 1+Random(m);
  dataN('K = ',k-1,68,m,1);
   for j := 1 to n do
     resultR('',a[k,j],center(j,n,4,2),3,4);
  SetNumberOfTests(5);
  Pause;
end;

procedure SMtr45An4(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Вывести элементы \Um{K}-го\um~столбца данной матрицы.', 0, 4);
(*
*)
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
    k := 1+Random(n);
  dataN('K = ',k-1,68,m,1);
    for i := 1 to m do
       resultR('',a[i,k],center(i,m,4,2),3,4);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Вывести ее\ элементы,', 0, 2);
  TaskText('расположенные в\ строках с\ нечетными индексами (1, 3,~\.).', 0, 3);
  TaskText('Вывод элементов производить по\ строкам, условный оператор не использовать.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Вывести ее\ элементы,', 0, 2);
  TaskText('расположенные в\ столбцах с\ четными индексами (0, 2,~\.).', 0, 3);
  TaskText('Вывод элементов производить по\ столбцам, условный оператор не использовать.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
  case v1 of
  1: begin
     if m < 4 then k := 2 else k := 1;
     for i := 1 to m div 2 do
       for j := 1 to n do
         resultR('',a[2*i,j], center(j,n,4,2),i+k,4);
     end;
  2: for j := 1 to (n+1) div 2 do
       for i := 1 to m do
         resultR('',a[i,2*j-1], center(i,m,4,2),j+1,4);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An6(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Вывести ее\ элементы в\ следующем порядке:', 0, 2);
  TaskText('строка~0 слева направо, строка~1 справа налево,', 0, 3);
  TaskText('строка~2 слева направо, строка~3 справа налево и~т.\,д.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Вывести ее\ элементы в\ следующем порядке:', 0, 2);
  TaskText('столбец~0 сверху вниз, столбец~1 снизу вверх,', 0, 3);
  TaskText('столбец~2 сверху вниз, столбец~3 снизу вверх и~т.\,д.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
  case v1 of
  1: begin
     for i := 1 to m do
     begin
       if Odd(i) then
       for j := 1 to n do
         resultR('',a[i,j], center(j,n,4,2),i,4)
       else
       for j := 1 to n do
         resultR('',a[i,n-j+1], center(j,n,4,2),i,4);
     end;
     end;
  2: begin
     for j := 1 to n do
     begin
       if Odd(j) then
       for i := 1 to m do
         resultR('',a[i,j], center(i,m,4,2),j,4)
       else
       for i := 1 to m do
         resultR('',a[m-i+1,j], center(i,m,4,2),j,4);
     end;
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An7(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Начиная с\ элемента~{A}_{0,0},', 0, 1);
  TaskText('вывести ее\ элементы следующим образом (\<\Iуголками\i\>): все\ элементы', 0, 2);
  TaskText('строки~0; элементы столбца~{M}\-1, кроме первого (уже\ выведенного)', 0, 3);
  TaskText('элемента; оставшиеся элементы строки~1; оставшиеся элементы', 0, 4);
  TaskText('столбца~{M}\-2 и~т.\,д.; последним выводится элемент~{A}_{M\-1,0}.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Начиная с\ элемента~{A}_{0,0},', 0, 1);
  TaskText('вывести ее\ элементы следующим образом (\<\Iуголками\i\>): все\ элементы', 0, 2);
  TaskText('столбца~0; элементы строки~{M}\-1, кроме первого (уже\ выведенного)', 0, 3);
  TaskText('элемента; оставшиеся элементы столбца~1; оставшиеся элементы', 0, 4);
  TaskText('строки~{M}\-2 и~т.\,д.; последним выводится элемент~{A}_{0,M\-1}.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3+Random(5);
  inaM(m);
//  if m = 5 then k := 0 else k := 1;
  k := 0;
  case v1 of
  1: for k1 := 1 to m do
     begin
       for j := 1 to m-k1+1 do
         resultR('',a[k1,j], center(j,2*m,4,1),k1+k,4);
       for i := k1+1 to m do
         resultR('',a[i,m-k1+1], center(i+m,2*m,4,1),k1+k,4);
     end;
  2: for k1 := 1 to m do
     begin
       for i := 1 to m-k1+1 do
         resultR('',a[i,k1], center(i,2*m,4,1),k1+k,4);
       for j := k1+1 to m do
         resultR('',a[m-k1+1,j], center(j+m,2*m,4,1),k1+k,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An8(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M} ({M}\ \= нечетное число).', 0, 1);
  TaskText('Начиная с\ элемента~{A}_{0,0} и\ перемещаясь по\ часовой стрелке, вывести все', 0, 2);
  TaskText('ее\ элементы \Iпо\ спирали\i: строка~0, столбец~{M}\-1, строка~{M}\-1', 0, 3);
  TaskText('в\ обратном порядке, столбец~0 в\ обратном порядке, оставшиеся элементы', 0, 4);
  TaskText('строки~1 и~т.\,д.; последним выводится центральный элемент матрицы.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M} ({M}\ \= нечетное число).', 0, 1);
  TaskText('Начиная с\ элемента~{A}_{0,0} и\ перемещаясь против часовой стрелки, вывести все', 0, 2);
  TaskText('ее\ элементы \Iпо\ спирали\i: столбец~0, строка~{M}\-1, столбец~{M}\-1', 0, 3);
  TaskText('в\ обратном порядке, строка~0 в\ обратном порядке, оставшиеся элементы', 0, 4);
  TaskText('столбца~1 и~т.\,д.; последним выводится центральный элемент матрицы.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 2*(Random(3)+1)+1;
  inaM(m);
//  if m = 5 then k := 0 else k := 1;
  k := 0;
  case v1 of
  1: begin
     for k1 := 1 to (m-1) div 2 do
     begin
       for j := k1 to m-k1+1 do
         resultR('',a[k1,j], center(j,2*m,4,1),2*k1-1+k,4);
       for i := k1+1 to m-k1+1 do
         resultR('',a[i,m-k1+1], center(i+m,2*m,4,1),2*k1-1+k,4);
       for j := k1+1 to m-k1+1 do
         resultR('',a[m-k1+1,m-j+1], center(j,2*m,4,1),2*k1+k,4);
       for i := k1+1 to m-k1 do
         resultR('',a[m-i+1,k1], center(i+m,2*m,4,1),2*k1+k,4);
     end;
     k1 := (m+1) div 2;
     resultR('',a[k1,k1], center(k1,2*m,4,1),2*k1-1+k,4);
     end;
  2: begin
     for k1 := 1 to (m-1) div 2 do
     begin
       for i := k1 to m-k1+1 do
         resultR('',a[i,k1], center(i,2*m,4,1),2*k1-1+k,4);
       for j := k1+1 to m-k1+1 do
         resultR('',a[m-k1+1,j], center(j+m,2*m,4,1),2*k1-1+k,4);
       for i := k1+1 to m-k1+1 do
         resultR('',a[m-i+1,m-k1+1], center(i,2*m,4,1),2*k1+k,4);
       for j := k1+1 to m-k1 do
         resultR('',a[k1,m-j+1], center(j+m,2*m,4,1),2*k1+k,4);
     end;
     k1 := (m+1) div 2;
     resultR('',a[k1,k1], center(k1,2*m,4,1),2*k1-1+k,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SMtr45An10(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Найти сумму и\ произведение элементов \Um{K}-й\um~строки данной матрицы.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Найти сумму и\ произведение элементов \Um{K}-го\um~столбца данной матрицы.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  r1 := 0;
  r2 := 1;
  case v1 of
  1: for j := 1 to n do
     begin
       r1 := r1 + a[k,j];
       r2 := r2 * a[k,j];
     end;
  2: for i := 1 to m do
     begin
       r1 := r1 + a[i,k];
       r2 := r2 * a[i,k];
     end;
  end;
  resultR('Сумма: ',r1,xLeft,3,5);
  resultR('Произведение: ',r2,xRight,3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An11(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Для\ каждой строки матрицы найти сумму ее\ элементов.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Для\ каждого столбца матрицы найти произведение его\ элементов.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(4); //2 + Random(4);
  n := 3 + Random(5);
  ina(M,N);
  case v1 of
  1: for i := 1 to m do
     begin
     r1 := 0;
     for j := 1 to n do
       r1 := r1 + a[i,j];
     resultR('',r1,center(i,m,5,2),3,5);
     end;
  2: for j := 1 to n do
     begin
     r2 := 1;
     for i := 1 to m do
       r2 := r2 * a[i,j];
     resultR('',r2,center(j,n,10,1),3,8);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An12(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Для\ каждой строки матрицы с\ четным индексом (0,~2,~\.)', 0, 3);
  TaskText('найти среднее арифметическое ее\ элементов. Условный оператор не использовать.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Для\ каждого столбца матрицы с\ нечетным индексом (1,~3,~\.)', 0, 3);
  TaskText('найти сумму его\ элементов. Условный оператор не использовать.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: for i := 1 to (m+1) div 2 do
     begin
     r1 := 0;
     for j := 1 to n do
       r1 := r1 + a[2*i-1,j];
     resultR('',r1/n,center(i,(m+1) div 2,4,2),3,4);
     end;
  2: for j := 1 to n div 2 do
     begin
     r2 := 0;
     for i := 1 to m do
       r2 := r2 + a[i,2*j];
     resultR('',r2,center(j,n div 2,5,2),3,5);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An13(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('В каждой строке матрицы найти минимальный элемент.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
   for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       if a[i,j] < r1 then r1 := a[i,j];
     resultR('',r1,center(i,m,4,2),3,4);
     end;
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45An14(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('В каждом столбце матрицы найти максимальный элемент.', 0, 4);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
   for j := 1 to n do
     begin
     r2 := a[1,j];
     for i := 2 to m do
       if a[i,j] > r2 then r2 := a[i,j];
     resultR('',r2,center(j,n,4,2),3,4);
     end;
  SetNumberOfTests(5);
  Pause;
end;



procedure SMtr45An15(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс ее\ строки с\ наибольшей суммой элементов', 0, 3);
  TaskText('и\ вывести данный индекс, а\ также значение наибольшей суммы.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс ее\ столбца с\ наименьшим произведением элементов', 0, 3);
  TaskText('и\ вывести данный индекс, а\ также значение наименьшего произведения.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     r2 := -10000;
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       r1 := r1 + a[i,j];
     if r1 > r2 then
       begin
         r2 := r1;
         k := i;
       end;
     end;
     resultN('Индекс строки: ',k-1,xLeft,3,1);
     resultR('Наибольшая сумма: ',r2,xRight,3,4);
     end;
  2: begin
     r2 := 10000000000.0;
     for j := 1 to n do
     begin
     r1 := a[1,j];
     for i := 2 to m do
       r1 := r1 * a[i,j];
     if r1 < r2 then
       begin
         r2 := r1;
         k := j;
       end;
     end;
     resultN('Индекс столбца: ',k-1,xLeft,3,1);
     resultR('Наименьшее произведение: ',r2,xRight,3,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An16(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти максимальный среди минимальных элементов ее\ строк.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти минимальный среди максимальных элементов ее\ столбцов.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     amax := -1000;
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       if a[i,j] < r1 then r1 := a[i,j];
     if r1 > amax then amax := r1;
     end;
     resultR('',amax,0,3,4);
     end;
  2: begin
     amin := 1000;
     for j := 1 to n do
     begin
     r2 := a[1,j];
     for i := 2 to m do
       if a[i,j] > r2 then r2 := a[i,j];
     if r2 < amin then amin := r2;
     end;
     resultR('',amin,0,3,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An17(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('В\ каждой ее\ строке найти количество элементов,', 0, 3);
  TaskText('меньших среднего арифметического всех\ элементов этой\ строки.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('В\ каждом ее\ столбце найти количество элементов,', 0, 3);
  TaskText('больших среднего арифметического всех\ элементов этого\ столбца.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       r1 := r1 + a[i,j];
     r1 := r1/n;
     k := 0;
     for j := 1 to n do
       if a[i,j] < r1  then inc(k);
     resultN('',k,center(i,m,1,5),3,1);
     end;
     end;
  2: begin
     for j := 1 to n do
     begin
     r1 := a[1,j];
     for i := 2 to m do
       r1 := r1 + a[i,j];
     r1 := r1/m;
     k := 0;
     for i := 1 to m do
       if a[i,j] > r1  then inc(k);
     resultN('',k,center(j,n,1,5),3,1);
     end;
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr45An18(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индексы строки и\ столбца для\ элемента матрицы,', 0, 3);
  TaskText('наиболее близкого к\ среднему значению всех\ ее\ элементов.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  r := 0;
  for i := 1 to m do
    for j := 1 to n do
      r := r + a[i,j];
  r := r / (m*n);
  amin := 1000;
  for i := 1 to m do
    for j := 1 to n do
      if abs(a[i,j]-r) < amin then
        begin
          amin := abs(a[i,j]-r);
          k1 := i;
          k2 := j;
        end;
  resultN('Индекс строки: ',k1-1,xLeft,3,1);
  resultN('Индекс столбца: ',k2-1,xRight,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An19(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс первой из\ ее\ строк, содержащих равное количество', 0, 3);
  TaskText('положительных и\ отрицательных элементов (нулевые элементы матрицы', 0, 4);
  TaskText('не\ учитываются). Если таких строк нет, то\ вывести~\-1.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс последнего из\ ее\ столбцов, содержащих равное количество', 0, 3);
  TaskText('положительных и\ отрицательных элементов (нулевые элементы матрицы', 0, 4);
  TaskText('не\ учитываются). Если таких столбцов нет, то\ вывести~\-1.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  case Random(5) of
  0: for i:=1 to m do
       for j:=1 to n do
         case Random(3) of
         0..1: b[i,j] := Random(10);
         2: b[i,j] := 0;
         end;
  1..4:
     for i:=1 to m do
       for j:=1 to n do
         case Random(3) of
         0..1: b[i,j] := 9 - integer(Random(19));
         2: b[i,j] := 0;
         end;
   end;
  inb(m,n);
  k := 0;
   case v1 of
   1:
   begin
     for i := 1 to m do
     begin
       k1 := 0;
       for j := 1 to n do
         if b[i,j]>0 then inc(k1)
         else if b[i,j]<0 then dec(k1);
       if k1 = 0 then
       begin
         k := i;
         break;
       end;
     end;
   end;
   2:
   begin
     for j := n downto 1 do
     begin
       k1 := 0;
       for i := 1 to m do
         if b[i,j]>0 then inc(k1)
         else if b[i,j]<0 then dec(k1);
       if k1 = 0 then
       begin
         k := j;
         break;
       end;
     end;
   end;
  end;
  resultN('',k-1,0,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An20(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс последней из\ ее\ строк, содержащих только четные числа.', 0, 3);
  TaskText('Если таких строк нет, то\ вывести~\-1.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс первого из\ ее\ столбцов, содержащих только нечетные числа.', 0, 3);
  TaskText('Если таких столбцов нет, то\ вывести~\-1.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  case Random(5) of
  0: for i:=1 to m do
       for j:=1 to n do
         b[i,j] := 10 + Random(90);
  1..4:
     case v1 of
     1: for i:=1 to m do
       case Random(2) of
       0: for j:=1 to n do
               b[i,j] := 10 + Random(90);
       1: for j:=1 to n do
               b[i,j] := 10 + 2*Random(45);
       end;
     2: for j:=1 to n do
       case Random(2) of
       0: for i:=1 to m do
               b[i,j] := 10 + Random(90);
       1: for i:=1 to m do
               b[i,j] := 11 + 2*Random(45);
       end;
     end;
   end;
  inb(m,n);
  k := 0;
   case v1 of
   1:
   begin
     for i := m downto 1 do
     begin
       k1 := 0;
       for j := 1 to n do
         if not Odd(b[i,j]) then inc(k1);
       if k1 = n then
       begin
         k := i;
         break;
       end;
     end;
   end;
   2:
   begin
     for j := 1 to n do
     begin
       k1 := 0;
       for i := 1 to m do
         if Odd(b[i,j]) then inc(k1);
       if k1 = m then
       begin
         k := j;
         break;
       end;
     end;
   end;
  end;
  resultN('',k-1,0,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An21(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  set1,set2: set of 0..10;
begin
  Start(Name, Topic3, Author, Key, 57{level});(*DEMO*)
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N},', 0, 1);
  TaskText('элементы которой могут принимать значения от~0 до~100.', 0, 2);
  TaskText('Различные строки матрицы назовем \Iпохожими\i,', 0, 3);
  TaskText('если совпадают множества чисел, встречающихся в\ этих\ строках.', 0, 4);
  TaskText('Найти количество строк, похожих на\ начальную строку данной матрицы.', 0, 5);
(*
*)
      m := 3 + Random(6); //2 + Random(4);
      n := 2 + Random(3);
  k := Random(6);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(3);
  inb(m,n);
  k := 0;
     set1 := [b[1,1]];
     for j := 2 to n do
       set1 := set1 + [b[1,j]];
     for i := 2 to m do
     begin
       set2 := [b[i,1]];
       for j := 2 to n do
         set2 := set2 + [b[i,j]];
       if set1 = set2 then inc(k);
     end;
  resultN('',k,0,3,1);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45An22(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  set1,set2: set of 0..10;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N},', 0, 1);
  TaskText('элементы которой могут принимать значения от~0 до~100.', 0, 2);
  TaskText('Различные столбцы матрицы назовем \Iпохожими\i,', 0, 3);
  TaskText('если совпадают множества чисел, встречающихся в\ этих\ столбцах.', 0, 4);
  TaskText('Найти количество столбцов, похожих на\ последний столбец данной матрицы.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти количество ее\ строк, все\ элементы которых различны.', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти количество ее\ столбцов, все\ элементы которых различны.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin
      m := 2 + Random(3);
      n := 5 + Random(4);
  k := Random(6);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(3);
  inb(m,n);
  k := 0;
     set1 := [b[1,n]];
     for i := 2 to m do
       set1 := set1 + [b[i,n]];
     for j := 1 to n-1 do
     begin
       set2 := [b[1,j]];
       for i := 2 to m do
         set2 := set2 + [b[i,j]];
       if set1 = set2 then inc(k);
     end;
  resultN('',k,0,3,1);

end;
2,3: begin
  case v1 of
  2: begin
      m := 5 + Random(4); //2 + Random(4);
      n := 2 + Random(3);
     end;
  3: begin
      m := 2 + Random(3);
      n := 5 + Random(4);
     end;
  end;
  k := Random(3);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(6);
  inb(m,n);
  k := 0;
   case v1 of
   2:
     for i := 1 to m do
     begin
     k1 := 1;
     set1 := [b[i,1]];
     for j := 2 to n do
       if b[i,j] in set1 then k1 := 0
       else set1 := set1 + [b[i,j]];
     k := k + k1;
     end;
   3:
     for j := 1 to n do
     begin
     k1 := 1;
     set1 := [b[1,j]];
     for i := 2 to m do
       if b[i,j] in set1 then k1 := 0
       else set1 := set1 + [b[i,j]];
     k := k + k1;
     end;
  end;
  resultN('',k,0,3,1);
end;
end;
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45An23(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс последней из\ ее\ строк, содержащих', 0, 3);
  TaskText('максимальное количество одинаковых элементов.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти индекс первого из\ ее\ столбцов, содержащих', 0, 3);
  TaskText('максимальное количество одинаковых элементов.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  case v1 of
  1: begin
      m := 5 + Random(4);
      n := 2 + Random(6);
     end;
  2: begin
      m := 2 + Random(6); //2 + Random(4);
      n := 5 + Random(4);
     end;
  end;
  k := Random(5);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(4);
  inb(m,n);
   case v1 of
  1:
    begin
      for i:=1 to m do
      begin
        for j := 0 to 10 do
          b1[j] := 0;
        for j := 1 to n do
          Inc(b1[b[i,j]]);
        b2[i] := 0;
        for j := 0 to 10 do
          if b2[i]<b1[j] then b2[i] := b1[j];
      end;
      k := b2[1];
      k1 := 1;
      for i := 2 to m do
        if k <= b2[i] then
          begin k := b2[i]; k1 := i; end;
    end;
  2:
    begin
      for j:=1 to n do
      begin
        for i := 0 to 10 do
          b1[i] := 0;
        for i := 1 to m do
          Inc(b1[b[i,j]]);
        b2[j] := 0;
        for i := 0 to 10 do
          if b2[j]<b1[i] then b2[j] := b1[i];
      end;
      k := b2[1];
      k1 := 1;
      for j := 2 to n do
        if k < b2[j] then
          begin k := b2[j]; k1 := j; end;
    end;
  end;
  resultN('',k1-1,0,3,1);
  SetNumberOfTests(9);
Pause;
end;

procedure sorta(m,n,v1,nom,d: integer);
var i,j,k: integer;
    x: real;
begin
case v1 of
1: for k := 1 to n-1 do
    for j := 1 to n-k do
      if a[nom,j]*d < a[nom,j+1]*d then
        begin
        x := a[nom,j];
        a[nom,j] := a[nom,j+1];
        a[nom,j+1] := x;
        end;
2: for k := 1 to m-1 do
    for i := 1 to m-k do
      if a[i,nom]*d < a[i+1,nom]*d then
        begin
        x := a[i,nom];
        a[i,nom] := a[i+1,nom];
        a[i+1,nom] := x;
        end;
end;
end;

procedure SMtr45An24(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти количество ее\ строк, элементы которых упорядочены по\ возрастанию.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Найти количество ее\ столбцов, элементы которых упорядочены по\ убыванию.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  inita(M,N);
  case v1 of
  1: for i := 1 to m do
       case Random(3) of
       0: sorta(m,n,v1,i,1);
       1: sorta(m,n,v1,i,-1);
       end;
  2: for j := 1 to n do
       case Random(3) of
       0: sorta(m,n,v1,j,1);
       1: sorta(m,n,v1,j,-1);
       end;
  end;
  ina1(m,n);
  k := 0;
  case v1 of
  1: for i := 1 to m do
     begin
     k1 := 1;
     for j := 2 to n do
       if a[i,j-1] >= a[i,j] then k1 := 0;
     k := k + k1;
     end;
  2: for j := 1 to n do
     begin
     k1 := 1;
     for i := 2 to m do
       if a[i-1,j] <= a[i,j] then k1 := 0;
     k := k + k1;
     end;
  end;
  resultN('',k,0,3,1);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45An25(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  r := 1000;
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Найти минимальный среди элементов тех\ строк,', 0, 2);
  TaskText('которые упорядочены либо по\ возрастанию, либо по\ убыванию.', 0, 3);
  TaskText('Если\ упорядоченные строки в\ матрице отсутствуют, то\ вывести~0.', 0, 4);
(*
*)
  end;
  2: begin
  r := -1000;
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6); //2 + Random(4);
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Найти максимальный среди элементов тех\ столбцов,', 0, 2);
  TaskText('которые упорядочены либо по\ возрастанию, либо по\ убыванию.', 0, 3);
  TaskText('Если\ упорядоченные столбцы в\ матрице отсутствуют, то\ вывести~0.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  inita(M,N);
  case v1 of
  1: for i := 1 to m do
       case Random(6) of
       0: sorta(m,n,v1,i,1);
       1: sorta(m,n,v1,i,-1);
       end;
  2: for j := 1 to n do
       case Random(6) of
       0: sorta(m,n,v1,j,1);
       1: sorta(m,n,v1,j,-1);
       end;
  end;
  ina1(m,n);
  case v1 of
  1: for i := 1 to m do
     begin
       k1 := 1;
       for j := 2 to n-1 do
         if (a[i,j]-a[i,j-1])*(a[i,j]-a[i,j+1]) >= 0 then k1 := 0;
       if k1 = 1 then
       begin
         r1 := a[i,1];
         if a[i,n] < r1 then r1 := a[i,n];
         if r > r1 then begin r := r1; k := i; end;
       end;
     end;
  2: for j := 1 to n do
     begin
       k1 := 1;
       for i := 2 to m-1 do
         if (a[i,j]-a[i-1,j])*(a[i,j]-a[i+1,j]) >= 0 then k1 := 0;
       if k1 = 1 then
       begin
         r1 := a[1,j];
         if a[m,j] > r1 then r1 := a[m,j];
         if r < r1 then begin r := r1; k := j; end;
       end;
     end;
  end;
  if abs(r) = 1000  then begin r := 0; k := 0; end;
  resultR('',r,0,3,4);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45An26(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('Дана целочисленная матрица размера~{M}\;\x\;{N}. Найти элемент,', 0, 2);
  TaskText('являющийся максимальным в\ своей строке и\ минимальным в\ своем столбце.', 0, 3);
  TaskText('Если\ такой элемент отсутствует, то\ вывести~0.', 0, 4);
(*
Для каждой строки находите максимальные элементы и\ номера их\ столбцов,
после чего проверяйте эти\ элементы на\ минимальность в\ данных столбцах.
Заметим, что\ задание сформулировано корректно даже в\ том\ случае,
когда матрица содержит несколько элементов, удовлетворяющих указанным
условиям, поскольку нетрудно доказать, что в\ этом случае все\ они \Iравны
между собой\i.
*)
(*==*)
  m := 2 + Random(3);
  n := 2 + Random(3);
  for i:=1 to M do
  for j:=1 to N do
    b[i,j] := Random(9)+1;
  inb(m,n);
  for i:=1 to m do
    begin
      b1[i] := b[i,1];
      for j:=2 to n do
        if b1[i]<b[i,j] then
          b1[i] := b[i,j];
    end;
  k2 := 0;
  for k:=1 to m do
    begin
      if k2 <> 0 then break;
      for j := 1 to n do
        if b[k,j]=b1[k] then
        begin
          k1 := 0;
          for i := 1 to m do
            begin
              if b[i,j]<b1[k] then break;
              inc(k1);
            end;
          if k1=m then
            begin
              k2 := b1[k];
              break;
            end;
        end;
    end;
  resultN('',k2,0,3,2);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45An27(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SMtr45An28(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целые числа~{K}_1 и~{K}_2 (0~\l~{K}_1~<~{K}_2~\l~{M}\-1).', 0, 2);
  TaskText('Поменять местами строки матрицы с\ индексами~{K}_1 и~{K}_2.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целые числа~{K}_1 и~{K}_2 (0~\l~{K}_1~<~{K}_2~\l~{N}\-1).', 0, 2);
  TaskText('Поменять местами столбцы матрицы с\ индексами~{K}_1 и~{K}_2.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6);
  n := 3 + Random(6);
  repeat
  case v1 of
  1: begin k1 := 1 + Random(m); k2 := 1 + Random(m); end;
  2: begin k1 := 1 + Random(n); k2 := 1 + Random(n); end;
  end
  until k1 < k2;
  ina(M,N);
  dataN('K_1 = ',k1-1,65,m,1);
  dataN('K_2 = ',k2-1,72,m,1);
  a0 := a;
  case v1 of
  1: for j := 1 to n do
     begin
     r := a0[k1,j];
     a0[k1,j] := a0[k2,j];
     a0[k2,j] := r;
     end;
  2: for i := 1 to m do
     begin
     r := a0[i,k1];
     a0[i,k1] := a0[i,k2];
     a0[i,k2] := r;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr45An29(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Преобразовать матрицу,', 0, 2);
  TaskText('поменяв местами минимальный и\ максимальный элемент в\ каждой строке.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Преобразовать матрицу,', 0, 2);
  TaskText('поменяв местами минимальный и\ максимальный элемент в\ каждом столбце.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m do
     begin
     amin := 1000; amax := -1000;
     for j := 1 to n do
     begin
       if a0[i,j] < amin then begin amin := a0[i,j]; k1 := j; end;
       if a0[i,j] > amax then begin amax := a0[i,j]; k2 := j; end;
     end;
     a0[i,k1] := amax;
     a0[i,k2] := amin;
     end;
  2: for j := 1 to n do
     begin
     amin := 1000; amax := -1000;
     for i := 1 to m do
     begin
       if a0[i,j] < amin then begin amin := a0[i,j]; k1 := i; end;
       if a0[i,j] > amax then begin amax := a0[i,j]; k2 := i; end;
     end;
     a0[k1,j] := amax;
     a0[k2,j] := amin;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45An30(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  imin, imax, jmin, jmax: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Поменять местами строки,', 0, 2);
  TaskText('содержащие минимальный и\ максимальный элементы матрицы.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Поменять местами столбцы,', 0, 2);
  TaskText('содержащие минимальный и\ максимальный элементы матрицы.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  amin := 1000;
  amax := -1000;
  for i := 1 to m do
    for j := 1 to n do
    begin
      if a[i,j] < amin then
        begin
          amin := a[i,j]; imin := i; jmin := j;
        end;
      if a[i,j] > amax then
        begin
          amax := a[i,j]; imax := i; jmax := j;
        end;
    end;
  a0 := a;
  case v1 of
  1: for j := 1 to n do
     begin
     r := a0[imin,j];
     a0[imin,j] := a0[imax,j];
     a0[imax,j] := r;
     end;
  2: for i := 1 to m do
     begin
     r := a0[i,jmin];
     a0[i,jmin] := a0[i,jmax];
     a0[i,jmax] := r;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45An31(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Поменять местами столбец с\ индексом~0', 0, 2);
  TaskText('и\ последний из\ столбцов, содержащих только положительные элементы.', 0, 3);
  TaskText('Если\ требуемых столбцов\ нет, то\ вывести матрицу без\ изменений.', 0, 4);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
  for j := n downto 1 do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
if k1<>0 then
for i:=1 to m do
  begin
    r1 := a0[i,k1];
    a0[i,k1] := a0[i,1];
    a0[i,1] := r1;
  end;
  ina2(m,n);
  outa01(m,n);
  SetNumberOfTests(8);
  Pause;
end;




procedure SMtr45An32(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Поменять местами столбец с\ индексом~{N}\-1', 0, 2);
  TaskText('и\ первый из\ столбцов, содержащих только отрицательные элементы.', 0, 3);
  TaskText('Если\ требуемых столбцов\ нет, то\ вывести матрицу без\ изменений.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
for j := 1 to n do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
  for i := 1 to m do
    for j := 1 to n do
      begin
        a[i,j] := -a[i,j];
        a0[i,j] := -a0[i,j];
      end;
if k1<>0 then
for i:=1 to m do
  begin
    r1 := a0[i,k1];
    a0[i,k1] := a0[i,n];
    a0[i,n] := r1;
  end;
  ina2(m,n);
  outa01(m,n);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45An33(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 2 + 2*Random(4);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N} ({M}\ \= четное число).', 0, 2);
  TaskText('Поменять местами верхнюю и\ нижнюю половины матрицы.', 0, 4);
(*
*)
  end;
  2: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 2 + 2*Random(4);
  TaskText('Дана матрица размера~{M}\;\x\;{N} ({N}\ \= четное число).', 0, 2);
  TaskText('Поменять местами левую и\ правую половины матрицы.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i+m div 2,j];
           a0[i+m div 2,j] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i,j+n div 2];
           a0[i,j+n div 2] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45An34(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} ({M} и~{N}\ \= четные числа).', 0, 2);
  TaskText('Поменять местами левую верхнюю и\ правую нижнюю четверти матрицы.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} ({M} и~{N}\ \= четные числа).', 0, 2);
  TaskText('Поменять местами левую нижнюю и\ правую верхнюю четверти матрицы.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 2 + 2*Random(4);
  n := 2 + 2*Random(4);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n div 2 do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i+m div 2,j+n div 2];
           a0[i+m div 2,j+n div 2] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m div 2 do
         begin
           r1 := a0[i+m div 2,j];
           a0[i+m div 2,j] := a0[i,j+n div 2];
           a0[i,j+n div 2] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;




procedure SMtr45An35(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Зеркально отразить ее\ элементы', 0, 2);
  TaskText('относительно горизонтальной оси симметрии матрицы (при\ этом поменяются', 0, 3);
  TaskText('местами строки с\ индексами~0 и~{M}\-1, 1 и~{M}\-2 и\ т.\,д.).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}. Зеркально отразить ее\ элементы', 0, 2);
  TaskText('относительно вертикальной оси симметрии матрицы (при\ этом поменяются', 0, 3);
  TaskText('местами столбцы с\ индексами~0 и~{M}\-1, 1 и~{N}\-2 и\ т.\,д.).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[m-i+1,j];
           a0[m-i+1,j] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i,n-j+1];
           a0[i,n-j+1] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An36(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Удалить строку матрицы с\ индексом~{K}.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Удалить столбец матрицы с\ индексом~{K}.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  a0 := a;
  case v1 of
  1: begin
     for i := k+1 to m do
       for j := 1 to n do
          a0[i-1,j] := a0[i,j];
     outa0(m-1,n);
     end;
  2: begin
     for j := k+1 to n do
       for i := 1 to m do
           a0[i,j-1] := a0[i,j];
     outa0(m,n-1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An37(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Удалить строку, содержащую минимальный элемент матрицы.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Удалить столбец, содержащий максимальный элемент матрицы.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     amin := 1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] < amin then
           begin
             amin := a[i,j];
             k := i;
           end;
     end;
  2: begin
     amax := -1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] > amax then
           begin
             amax := a[i,j];
             k := j;
           end;
     end;
  end;
  a0 := a;
  case v1 of
  1: begin
     for i := k+1 to m do
       for j := 1 to n do
          a0[i-1,j] := a0[i,j];
     outa0(m-1,n);
     end;
  2: begin
     for j := k+1 to n do
       for i := 1 to m do
           a0[i,j-1] := a0[i,j];
     outa0(m,n-1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An38(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k: integer;
  k3: array [1..10] of integer;
  n3: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(9, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Удалить ее\ первый столбец, содержащий только положительные элементы.', 0, 3);
  TaskText('Если\ требуемых столбцов\ нет, то\ вывести матрицу без\ изменений.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Удалить ее\ последний столбец, содержащий только отрицательные элементы.', 0, 3);
  TaskText('Если\ требуемых столбцов\ нет, то\ вывести матрицу без\ изменений.', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}, содержащая', 0, 2);
  TaskText('как\ положительные, так\ и\ отрицательные элементы.', 0, 3);
  TaskText('Удалить все\ ее\ столбцы, содержащие только положительные элементы.', 0, 4);
  TaskText('Если\ требуемых столбцов\ нет, то\ вывести матрицу без\ изменений.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  repeat
  k := 0;
  for i:=1 to m do
    for j:=1 to n do
    begin
      a[i,j] := (10 * Random)-2;
      if a[i,j]<0 then inc(k);
    end;
  until (k>0)and(k<m*n);
  a0 := a;
  n3 := 0;
  for j := 1 to n do
  begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
    begin
      inc(n3);
      k3[n3] := j;
    end;
  end;
k2 := n;
if v1 = 2 then
   for i := 1 to m do
     for j := 1 to n do
       begin
         a[i,j] := -a[i,j];
         a0[i,j] := -a0[i,j];
       end;
if n3<>0 then
case v1 of
1: begin
   for j := k3[1]+1 to n do
     for i := 1 to m do
        a0[i,j-1] := a0[i,j];
   k2 := n-1;
   end;
2: begin
   for j := k3[n3]+1 to n do
     for i := 1 to m do
        a0[i,j-1] := a0[i,j];
   k2 := n-1;
   end;
3: begin
   for k := n3 downto 1 do
     for j := k3[k]+1 to n do
       for i := 1 to m do
         a0[i,j-1] := a0[i,j];
   k2 := n-n3;
   end;
end;
  ina2(m,n);
  outa01(m,k2);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45An39(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 3 + Random(6);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Перед строкой матрицы с\ индексом~{K} вставить строку из\ нулей.', 0, 4);
(*
*)
  end;
  2: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N} и\ целое число~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('После столбца матрицы с\ индексом~{K} вставить столбец из\ единиц.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  a0 := a;
  case v1 of
  1: begin
     for i := m downto k do
       for j := 1 to n do
          a0[i+1,j] := a0[i,j];
     for j := 1 to n do
       a0[k,j] := 0;
     outa0(m+1,n);
     end;
  2: begin
     for j := n downto k+1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
         a0[i,k+1] := 1;
     outa0(m,n+1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An40(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 3 + Random(6);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Продублировать строку матрицы, содержащую ее\ максимальный элемент.', 0, 4);
(*
*)
  end;
  2: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Продублировать столбец матрицы, содержащий ее\ минимальный элемент.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  case v1 of
  1: begin
     amax := -1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] > amax then
           begin
             amax := a[i,j];
             k := i;
           end;
     end;
  2: begin
     amin := 1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] < amin then
           begin
             amin := a[i,j];
             k := j;
           end;
     end;
  end;
  a0 := a;
  case v1 of
  1: begin
     for i := m downto k do
       for j := 1 to n do
          a0[i+1,j] := a0[i,j];
     outa0(m+1,n);
     end;
  2: begin
     for j := n downto k do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     outa0(m,n+1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An41(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Перед первым столбцом, содержащим только положительные элементы,', 0, 3);
  TaskText('вставить столбец из\ единиц. Если\ требуемых столбцов\ нет,', 0, 4);
  TaskText('то\ вывести матрицу без\ изменений.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('После последнего столбца, содержащего только отрицательные элементы,', 0, 3);
  TaskText('вставить столбец из\ нулей. Если\ требуемых столбцов\ нет,', 0, 4);
  TaskText('то\ вывести матрицу без\ изменений.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
case v1 of
1:for j := 1 to n do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
2:for j := n downto 1 do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
end;
if v1 = 2 then
  for i := 1 to m do
    for j := 1 to n do
      begin
        a[i,j] := -a[i,j];
        a0[i,j] := -a0[i,j];
      end;
k2 := n;
if k1<>0 then
case v1 of
  1: begin
     k2 := n+1;
     for j := n downto k1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
       a0[i,k1] := 1;
     end;
  2: begin
     k2 := n+1;
     for j := n downto k1+1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
       a0[i,k1+1] := 0;
     end;
  end;
  ina2(m,n);
  outa01(m,k2);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45An42(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1,k2: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});(*DEMO*)
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  k3 := -1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 1);
  TaskText('Элемент матрицы называется ее\ \Iлокальным минимумом\i,', 0, 2);
  TaskText('если он\ меньше всех окружающих его элементов.', 0, 3);
  TaskText('Заменить все\ локальные минимумы данной матрицы на\ нули.', 0, 4);
  TaskText('При\ решении допускается использовать вспомогательную матрицу.', 0, 5);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina3(M,N);

  for i:=0 to m+1 do
    for j:=0 to n+1 do
      a0[i,j]:=-k3*1000;
  for i:=1 to m do
    for j:=1 to n do
      a0[i,j]:=a[i,j];
for i:=1 to m do
  for j:=1 to n do
    begin
    k:=0;
    for k1:=-1 to 1 do
      for k2:=-1 to 1 do
        begin
          if k3*a0[i,j] < k3*a0[i+k1,j+k2] then break;
          inc(k);
        end;
    if k<>9 then a[i,j] := a0[i,j]
    else
      a[i,j] := 0;
    end;
  a0 := a;
  outa03(M,N);
  SetNumberOfTests(5);
Pause;
end;


procedure sorta0(m,n,v1,d: integer);
var i,j,k: integer;
    x: real;
begin
case v1 of
1: for k := 1 to m-1 do
    for i := 1 to m-k do
      if a1[i]*d > a1[i+1]*d then
      begin
        x := a1[i];
        a1[i] := a1[i+1];
        a1[i+1] := x;
        for j := 1 to n do
        begin
          x := a0[i,j];
          a0[i,j] := a0[i+1,j];
          a0[i+1,j] := x;
        end;
      end;
2: for k := 1 to n-1 do
    for j := 1 to n-k do
      if a1[j]*d > a1[j+1]*d then
      begin
        x := a1[j];
        a1[j] := a1[j+1];
        a1[j+1] := x;
        for i := 1 to m do
        begin
          x := a0[i,j];
          a0[i,j] := a0[i,j+1];
          a0[i,j+1] := x;
        end;
      end;
end;
end;


procedure SMtr45An43(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(5, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  k3 := 1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 1);
  TaskText('Элемент матрицы называется ее\ \Iлокальным максимумом\i,', 0, 2);
  TaskText('если он\ больше всех окружающих его элементов.', 0, 3);
  TaskText('Поменять знак всех\ локальных максимумов данной матрицы на\ противоположный.', 0, 4);
  TaskText('При\ решении допускается использовать вспомогательную матрицу.', 0, 5);
(*
*)
  end;
  2: begin
  k1 := 1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Упорядочить ее\ строки так, чтобы их\ первые элементы', 0, 3);
  TaskText('образовывали возрастающую последовательность.', 0, 4);
(*
*)
  end;
  3: begin
  k1 := -1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Упорядочить ее\ столбцы так, чтобы их\ последние элементы', 0, 3);
  TaskText('образовывали убывающую последовательность.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
       inita(m,n);
       ina2(M,N);
  for i:=0 to m+1 do
    for j:=0 to n+1 do
      a0[i,j]:=-k3*1000;
  for i:=1 to m do
    for j:=1 to n do
      a0[i,j]:=a[i,j];
for i:=1 to m do
  for j:=1 to n do
    begin
    k:=0;
    for k1:=-1 to 1 do
      for k2:=-1 to 1 do
        begin
          if k3*a0[i,j] < k3*a0[i+k1,j+k2] then break;
          inc(k);
        end;
    if k<>9 then a[i,j] := a0[i,j]
    else
       a[i,j] := -a0[i,j];
    end;
  a0 := a;
  outa01(M,N);
end;
2,3: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  2: for i := 1 to m do
       a1[i] := a0[i,1];
  3: for j := 1 to n do
       a1[j] := a0[m,j];
  end;
  sorta0(m,n,v1-1,k1);
  outa0(M,N);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45An44(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  k1 := -1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Упорядочить ее\ строки так, чтобы их\ минимальные элементы', 0, 3);
  TaskText('образовывали убывающую последовательность.', 0, 4);
(*
*)
  end;
  2: begin
  k1 := 1;
  TaskText('Дана матрица размера~{M}\;\x\;{N}.', 0, 2);
  TaskText('Упорядочить ее\ столбцы так, чтобы их\ максимальные элементы', 0, 3);
  TaskText('образовывали возрастающую последовательность.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m do
     begin
       a1[i] := a0[i,1];
       for j := 2 to n do
         if a0[i,j] < a1[i] then a1[i] := a0[i,j];
     end;
  2: for j := 1 to n do
     begin
       a1[j] := a0[1,j];
       for i := 2 to m do
         if a0[i,j] > a1[j] then a1[j] := a0[i,j];
     end;
  end;
  sorta0(m,n,v1,k1);
  outa0(M,N);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45An45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



begin
Topic := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ)';
Topic1 := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ): ФОРМИРОВАНИЕ';
Topic2 := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ): ВЫВОД ЭЛЕМЕНТОВ';
Topic3 := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ): АНАЛИЗ ЭЛЕМЕНТОВ';
Topic4 := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ): ПРЕОБРАЗОВАНИЕ';
Topic5 := 'ДВУМЕРНЫЕ МАССИВЫ (МАТРИЦЫ): РАБОТА С ДИАГОНАЛЯМИ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.










