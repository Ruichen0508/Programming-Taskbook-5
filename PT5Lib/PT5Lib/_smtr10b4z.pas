{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SMtr10B4z;

interface

procedure SMtr10Bn1(Name, Key: string);
procedure SMtr10Bn2(Name, Key: string);
procedure SMtr10Bn3(Name, Key: string);
procedure SMtr10Bn4(Name, Key: string);
procedure SMtr10Bn5(Name, Key: string);
procedure SMtr10Bn6(Name, Key: string);
procedure SMtr10Bn7(Name, Key: string);
procedure SMtr10Bn8(Name, Key: string);
procedure SMtr10Bn9(Name, Key: string);
procedure SMtr10Bn10(Name, Key: string);

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
    a[i,j] := 9.98 * Random;
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
dataN('M = ',m,8,1,1);
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
dataN('M = ',m,8,1,1);
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




procedure SMtr10Bn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Найти сумму элементов', 0, 2);
  TaskText('ее\ \Iглавной диагонали\i, т.\,е. диагонали, содержащей следующие элементы:', 0, 3);
  TaskText('\[{A}_{0,0},\q  {A}_{1,1},\q  {A}_{2,2},\q  \.,\q  {A}_{M\-1,M\-1}.\]', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Найти среднее арифметическое элементов', 0, 2);
  TaskText('ее\ \Iпобочной диагонали\i, т.\,е. диагонали, содержащей следующие элементы:', 0, 3);
  TaskText('\[{A}_{0,M\-1},\q  {A}_{1,M\-2},\q  {A}_{2,M\-3},\q  \.,\q  {A}_{M\-1,0}.\]', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  r := 0;
  case v1 of
  1: for i := 1 to m do
       r := r + a[i,i];
  2: for i := 1 to m do
       r := r + a[i,m-i+1];
  end;
  if v1 = 2 then r := r / m;
  ResultR('', r, 0, 3, 5);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr10Bn2(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});(*DEMO*)
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти сумму элементов каждой ее\ диагонали, параллельной главной', 0, 3);
  TaskText('(начиная с\ одноэлементной диагонали~{A}_{0,M\-1}).', 0, 4);
(*
*)
  m := 3 + Random(5); //2 + Random(4);
  inaM1(m);
  for i := 1 to 2*m-1 do
    a1[i] := 0;
  for i := 1 to m do
    for j := 1 to m do
      a1[i-j+m] := a1[i-j+m] + a[i,j];
  for i := 1 to 2*m-1 do
    ResultR('', a1[i], center(i,2*m-1,5,1), 3, 5);
  SetNumberOfTests(5);
  Pause;
end;


procedure SMtr10Bn3(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти сумму элементов каждой ее\ диагонали, параллельной побочной', 0, 3);
  TaskText('(начиная с\ одноэлементной диагонали~{A}_{0,0}).', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(5); //2 + Random(4);
  inaM1(m);
  for i := 1 to 2*m-1 do
    a1[i] := 0;
  for i := 1 to m do
    for j := 1 to m do
      a1[i+j-1] := a1[i+j-1] + a[i,j];
  for i := 1 to 2*m-1 do
    ResultR('', a1[i], center(i,2*m-1,5,1), 3, 5);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr10Bn4(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти среднее арифметическое элементов каждой ее\ диагонали,', 0, 3);
  TaskText('параллельной главной (начиная с\ одноэлементной диагонали~{A}_{0,M\-1}).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти среднее арифметическое элементов каждой ее\ диагонали,', 0, 3);
  TaskText('параллельной побочной (начиная с\ одноэлементной диагонали~{A}_{0,0}).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(5); //2 + Random(4);
  inaM1(m);
  for i := 1 to 2*m-1 do
  begin
    a1[i] := 0;
    b1[i] := 0;
  end;

  for i := 1 to m do
    for j := 1 to m do
    case v1 of
    1:  begin a1[i-j+m] := a1[i-j+m] + a[i,j];
              inc(b1[i-j+m]);
        end;
    2:  begin a1[i+j-1] := a1[i+j-1] + a[i,j];
              inc(b1[i+j-1]);
        end;
    end;
  for i := 1 to 2*m-1 do
    ResultR('', a1[i]/b1[i], center(i,2*m-1,5,1), 3, 5);
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr10Bn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  k1 := 1;
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти минимальный элемент для\ каждой ее\ диагонали,', 0, 3);
  TaskText('параллельной главной (начиная с\ одноэлементной диагонали~{A}_{0,M\-1}).', 0, 4);
(*
*)
  end;
  2: begin
  k1 := -1;
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 2);
  TaskText('Найти максимальный элемент для\ каждой ее\ диагонали,', 0, 3);
  TaskText('параллельной побочной (начиная с\ одноэлементной диагонали~{A}_{0,0}).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(5); //2 + Random(4);
  inaM1(m);
  for i := 1 to 2*m-1 do
    a1[i] := k1*1000;
  for i := 1 to m do
    for j := 1 to m do
    case v1 of
    1:  if a1[i-j+m] > a[i,j] then a1[i-j+m] := a[i,j];
    2:  if a1[i+j-1] < a[i,j] then a1[i+j-1] := a[i,j];
    end;
  for i := 1 to 2*m-1 do
    ResultR('', a1[i], center(i,2*m-1,5,1), 3, 5);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr10Bn6(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие ниже\ главной диагонали.', 0, 3);
  TaskText('Условный оператор не\ использовать.', 0, 4);
(*
Для того чтобы в\ двойном цикле перебирались только требуемые
элементы, пределы изменения переменной внутреннего цикла должны
зависеть от\ текущего значения переменной внешнего цикла.
*)
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
  for i := 1 to m do
   for j := 1 to i-1 do
       a0[i,j] := 0;
  outa01(m,m);
  SetNumberOfTests(5);
  Pause;
end;

procedure SMtr10Bn7(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие выше\ побочной диагонали.', 0, 3);
  TaskText('Условный оператор не\ использовать.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие на\ побочной диагонали', 0, 3);
  TaskText('и\ ниже нее. Условный оператор не\ использовать.', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие на\ главной диагонали', 0, 3);
  TaskText('и\ выше нее. Условный оператор не\ использовать.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
  for i := 1 to m do
  case v1 of
  1: for j := 1 to m-i do
       a0[i,j] := 0;
  2: for j := m-i+1 to m do
       a0[i,j] := 0;
  3: for j := i to m do
       a0[i,j] := 0;
  end;
  outa01(m,m);
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr10Bn8(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(2, 4, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие одновременно выше\ главной диагонали', 0, 3);
  TaskText('и\ выше\ побочной диагонали. Условный оператор не\ использовать.', 0, 4);
(*
+
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица порядка~{M}.', 0, 2);
  TaskText('Обнулить элементы матрицы, лежащие одновременно выше\ главной диагонали', 0, 3);
  TaskText('и\ ниже\ побочной диагонали. Условный оператор не использовать.', 0, 4);
(*
+
*)
  end;
  3: begin
  TaskText('Дана квадратная матрица порядка~{M}. Обнулить элементы матрицы,', 0, 2);
  TaskText('лежащие одновременно ниже\ главной диагонали (включая эту\ диагональ)', 0, 3);
  TaskText('и\ выше\ побочной диагонали (также включая эту\ диагональ).', 0, 4);
  TaskText('Условный оператор не использовать.', 0, 5);
(*
+
*)
  end;
  4: begin
  TaskText('Дана квадратная матрица порядка~{M}. Обнулить элементы матрицы,', 0, 2);
  TaskText('лежащие одновременно ниже\ главной диагонали (включая эту\ диагональ)', 0, 3);
  TaskText('и\ ниже\ побочной диагонали (также включая эту\ диагональ).', 0, 4);
  TaskText('Условный оператор не использовать.', 0, 5);
(*
+
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
  case v1 of
  1: for i := 1 to (m+1) div 2 do
       for j := i+1 to m-i do
         a0[i,j] := 0;
  2: for j := m downto (m+1) div 2 do
       for i := m-j+2 to j-1 do
         a0[i,j] := 0;
  3: for j := 1 to (m+1) div 2 do
       for i := j to m-j+1 do
         a0[i,j] := 0;
  4: for i := m downto (m+1) div 2 do
       for j := m-i+1 to i do
         a0[i,j] := 0;
  end;
  outa01(m,m);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr10Bn9(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});
  GetVariant(3, 4, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 1);
  TaskText('Зеркально отразить ее\ элементы относительно главной диагонали', 0, 2);
  TaskText('(при\ этом элементы главной диагонали останутся на\ прежнем месте,', 0, 3);
  TaskText('элемент~{A}_{0,1} поменяется местами с~{A}_{1,0},', 0, 4);
  TaskText('элемент~{A}_{0,2}\ \= с~{A}_{2,0} и\ т.\,д.). Вспомогательную матрицу не\ использовать.', 0, 5);
(*
Задача сводится к\ определению симметричных элементов (относительно
данной оси симметрии) и\ перемене их\ местами.
*)
  end;
  2: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}.', 0, 1);
  TaskText('Зеркально отразить ее\ элементы относительно побочной диагонали', 0, 2);
  TaskText('(при\ этом элементы побочной диагонали останутся на\ прежнем месте,', 0, 3);
  TaskText('элемент~{A}_{0,0} поменяется местами с~{A}_{M\-1,M\-1},', 0, 4);
  TaskText('элемент~{A}_{0,1}\ \= с~{A}_{M\-2,M\-1} и\ т.\,д.). Вспомогательную матрицу не\ использовать.', 0, 5);
(*
+
*)
  end;
  3: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Повернуть\ ее на\ угол 180\o', 0, 2);
  TaskText('(при этом элемент~{A}_{0,0} поменяется местами с~{A}_{M\-1,M\-1},', 0, 3);
  TaskText('элемент~{A}_{0,1}\ \= с~{A}_{M\-1,M\-2} и\ т.\,д.). Вспомогательную матрицу не\ использовать.', 0, 4);
(*
Задача сводится к\ определению симметричных элементов (относительно
центра матрицы) и\ перемене их\ местами.
*)
  end;
  4: begin
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Повернуть\ ее на\ угол 90\o', 0, 2);
  TaskText('в\ положительном направлении, т.\,е. против часовой стрелки', 0, 3);
  TaskText('(при\ этом элемент~{A}_{0,0} перейдет в~{A}_{M\-1,0}, элемент~{A}_{M\-1,0}\ \= в~{A}_{M\-1,M\-1} и\ т.\,д.).', 0, 4);
  TaskText('Вспомогательную матрицу не\ использовать.', 0, 5);
(*
При решении, не\ использующем вспомогательную матрицу, необходимо
рассматривать четверки элементов, циклически переходящих друг в\ друга.
Для\ обеспечения однократной перестановки элементов цикл надо организовать
не\ по\ всем элементам,
а\ только по\ одной их\ четверти (например, по\ элементам, лежащим выше
и\ на\ главной диагонали и\ одновременно строго выше побочной диагонали).
*)
  end;
  end;
(*==*)
case v1 of
1,2: begin
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
  for i := 1 to m-1 do
  case v1 of
  1: for j := i+1 to m do
       begin
         r := a0[i,j];
         a0[i,j] := a0[j,i];
         a0[j,i] := r;
       end;
  2: for j := 1 to m-i  do
       begin
         r := a0[i,j];
         a0[i,j] := a0[m-j+1,m-i+1];
         a0[m-j+1,m-i+1] := r;
       end;
  end;
  outa01(m,m);
  end;
3,4: begin
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
  case v1 of
  3: begin
   for i := 1 to m do
     for j := 1 to i-1 do
       begin
         r := a0[i,j];
         a0[i,j] := a0[m-i+1,m+1-j];
         a0[m-i+1,m+1-j] := r;
       end;
    for i := 1 to m div 2 do
      begin
        r := a0[i,i];
        a0[i,i] := a0[m-i+1,m+1-i];
        a0[m-i+1,m+1-i] := r;
      end;
     end;
  4: begin
   for i := 1 to m div 2 do
     for j := i to m-i do
       begin
         r := a0[i,j];
         a0[i,j] := a0[j,m-i+1];
         a0[j,m-i+1] := a0[m-i+1,m-j+1];
         a0[m-i+1,m-j+1] := a0[m-j+1,i];
         a0[m-j+1,i] := r;
       end;
     end;
  end;
  outa01(m,m);
end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr10Bn10(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic5, Author, Key, 57{level});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Дана квадратная матрица~{A} порядка~{M}. Повернуть\ ее на\ угол 90\o', 0, 2);
  TaskText('в\ отрицательном направлении, т.\,е. по\ часовой стрелке', 0, 3);
  TaskText('(при\ этом элемент~{A}_{0,0} перейдет в~{A}_{0,M\-1}, элемент~{A}_{0,M\-1}\ \= в~{A}_{M\-1,M\-1} и\ т.\,д.).', 0, 4);
  TaskText('Вспомогательную матрицу не\ использовать.', 0, 5);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  inaM1(m);
  a0 := a;
   for i := 1 to m div 2 do
     for j := i to m-i do
       begin
         r := a0[i,j];
         a0[i,j] := a0[m-j+1,i];
         a0[m-j+1,i] := a0[m-i+1,m-j+1];
         a0[m-i+1,m-j+1] := a0[j,m-i+1];
         a0[j,m-i+1] := r;
       end;
  outa01(m,m);
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










