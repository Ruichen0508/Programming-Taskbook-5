{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SMin60A4z;

interface

procedure SMin60An1(Name, Key: string);
procedure SMin60An2(Name, Key: string);
procedure SMin60An3(Name, Key: string);
procedure SMin60An4(Name, Key: string);
procedure SMin60An5(Name, Key: string);
procedure SMin60An6(Name, Key: string);
procedure SMin60An7(Name, Key: string);
procedure SMin60An8(Name, Key: string);
procedure SMin60An9(Name, Key: string);
procedure SMin60An10(Name, Key: string);
procedure SMin60An11(Name, Key: string);
procedure SMin60An12(Name, Key: string);
procedure SMin60An13(Name, Key: string);
procedure SMin60An14(Name, Key: string);
procedure SMin60An15(Name, Key: string);
procedure SMin60An16(Name, Key: string);
procedure SMin60An17(Name, Key: string);
procedure SMin60An18(Name, Key: string);
procedure SMin60An19(Name, Key: string);
procedure SMin60An20(Name, Key: string);
procedure SMin60An21(Name, Key: string);
procedure SMin60An22(Name, Key: string);
procedure SMin60An23(Name, Key: string);
procedure SMin60An24(Name, Key: string);
procedure SMin60An25(Name, Key: string);
procedure SMin60An26(Name, Key: string);
procedure SMin60An27(Name, Key: string);
procedure SMin60An28(Name, Key: string);
procedure SMin60An29(Name, Key: string);
procedure SMin60An30(Name, Key: string);
procedure SMin60An31(Name, Key: string);
procedure SMin60An32(Name, Key: string);
procedure SMin60An33(Name, Key: string);
procedure SMin60An34(Name, Key: string);
procedure SMin60An35(Name, Key: string);
procedure SMin60An36(Name, Key: string);
procedure SMin60An37(Name, Key: string);
procedure SMin60An38(Name, Key: string);
procedure SMin60An39(Name, Key: string);
procedure SMin60An40(Name, Key: string);
procedure SMin60An41(Name, Key: string);
procedure SMin60An42(Name, Key: string);
procedure SMin60An43(Name, Key: string);
procedure SMin60An44(Name, Key: string);
procedure SMin60An45(Name, Key: string);
procedure SMin60An46(Name, Key: string);
procedure SMin60An47(Name, Key: string);
procedure SMin60An48(Name, Key: string);
procedure SMin60An49(Name, Key: string);
procedure SMin60An50(Name, Key: string);
procedure SMin60An51(Name, Key: string);
procedure SMin60An52(Name, Key: string);
procedure SMin60An53(Name, Key: string);
procedure SMin60An54(Name, Key: string);
procedure SMin60An55(Name, Key: string);
procedure SMin60An56(Name, Key: string);
procedure SMin60An57(Name, Key: string);
procedure SMin60An58(Name, Key: string);
procedure SMin60An59(Name, Key: string);
procedure SMin60An60(Name, Key: string);

implementation

uses PT5TaskMaker;

var a,a1 : array [1..41] of real;
    b,b1 : array [0..41] of integer;
    Topic1,Topic2,Topic3,Author : string;
    c,c1,a2,b2,c2,d,x,y,x1,y1,x2,y2,z,x0,y0,amin,amax : real;
    i,j,k,m,m1,m2,m3,m4,n,n1,n2,n3,n4,a0,b0,c0,bmin,bmax,bmin1,bmax1 : integer;
    nmin,nmax,nmin1,nmax1 : integer;
    s,s1,s2,s3,s4 : string;
    bln : Boolean;
    ai : array [1..10] of integer;


procedure SMin60An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны десять вещественных чисел. Найти их\ сумму.',0,3);
(*
*)
x := 0;
for i := 1 to 10 do
  begin
    x0 := RandomR2(-9.9,9.9); //Random*19.99-10;          //2012 //2018
    dataR('',x0,center(i,10,5,2),3,5);
    x := x + x0;
  end;
//Str(x:0:2,s);
resultR('',x,0,3,6);
setNumberOfTests(5);
pause;
end;



procedure SMin60An2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(8,2,0,0,v1,v2,v3);
case v1 of
1:
taskText('Даны десять вещественных чисел. Найти их\ произведение.',0,3);
(*
*)
2:
taskText('Даны десять вещественных чисел. Найти их\ среднее арифметическое.',0,3);
(*
*)
end;
(*==*)
if v1 = 1 then x := 1
          else x := 0;
for i := 1 to 10 do
  begin
    x0 := RandomR2(-9.9,9.9); //Random*19.99-10; //2012 //2018
    dataR('',x0,center(i,10,5,2),3,5);
    if v1 = 1 then x := x * x0
    else x := x + x0;
  end;
if v1 = 2 then x := x/10;
Str(x:0:2,s);
case v1 of
1: resultR('',x,0,3,length(s));
2: resultR('',x,0,3,6);
end;
setNumberOfTests(5);
Pause;
end;




procedure SMin60An3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~вещественных чисел.',0,2);
taskText('Вывести сумму и\ произведение чисел из\ данного набора.',0,4);
(*
*)
(*==*)
x := 0; y := 1;
n := 2 + Random(9);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
    x0 := RandomR2(-9.9,9.9); //Random*19.99-10; //2012 //2018
    dataR('',x0,center(i,n,5,2),4,5);
    x := x + x0;
    y := y*x0;
  end;
resultR('Сумма: ',x,xLeft,3,6);
resultR('Произведение: ',y,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(3,3,0,0,v1,v2,v3);
case v1 of
1: begin
taskText('Дано целое число~{N} и\ набор из\ {N}~положительных вещественных чисел.',0,2);
taskText('Вывести в\ том же порядке целые части всех чисел из\ данного набора',0,3);
taskText('(как вещественные числа с\ нулевой дробной частью),',0,4);
taskText('а\ также сумму всех целых частей.',0,5);
(*
Использовать функцию Int, которая имеется и в языке \UP, и в языке \UV.
Для положительного числа~{x} функция Int({x}) возвращает ближайшее к~{x}
вещественное число с нулевой дробной частью, расположенное левее~{x}.
Например, Int(2.6)~=~2.0. Для нахождения дробной части положительного числа~{x}
достаточно воспользоваться формулой {x}\;\-\;Int({x}).
В языке \UP имеется стандартная функция Frac для вычисления дробной части
по указанной формуле.
Следует заметить, что
для отрицательных чисел функция Int в языке \UP работает не так, как
в языке \UV: в \UP Int({x}) возвращает ближайшее к~{x} число с нулевой дробной частью,
расположенное \Iправее\i~{x} (например, Int(\-2.6)~=~\-2.0), тогда как в языке \UV
функция Int({x}) для отрицательных чисел выполняется по тому же правилу, что и для
положительных, т.\,е. возвращает число, расположенное \Iлевее\i~{x} (например,
в \UV Int(\-2.6)~=~\-3.0). В языке \UV имеется также функция Fix,
которая и для положительных, и для отрицательных чисел действует
аналогично функции Int из языка \UP.
*)
   end;
2: begin
taskText('Дано целое число~{N} и\ набор из\ {N}~положительных вещественных чисел.',0,2);
taskText('Вывести в\ том же порядке дробные части всех чисел из\ данного набора',0,3);
taskText('(как вещественные числа с\ нулевой целой частью),',0,4);
taskText('а\ также произведение всех дробных частей.',0,5);
(*
+
*)
   end;
3: begin
taskText('Дано целое число~{N} и\ набор из\ {N}~вещественных чисел.',0,2);
taskText('Вывести в\ том же порядке округленные значения ',0,3);
taskText('всех чисел из\ данного набора (как целые числа),',0,4);
taskText('а\ также сумму всех округленных значений.',0,5);
(*
Использовать функцию Round округления до ближайшего целого числа, которая имеется
и в языке \UP, и в языке \UV.
*)
   end;
end;
(*==*)
x := 0; y := 1; k := 0;
n := 2 + Random(9);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
    repeat
    x0 := RandomR2(0.1,9.9); //Random*9.99; //2018
    until frac(x0)>0.01;
    if (v1 = 3) and (Random(2)=0) then x0 := -x0;
    case v1 of
    1: begin
             dataR('',x0,center(i,n,4,3),4,4);
             x := x + Int(x0);  resultR('',Int(x0),center(i,n,4,3),2,4);
       end;
    2: begin
             dataR('',x0,center(i,n,4,3),4,4);
             y := y*Frac(x0);   resultR('',Frac(x0),center(i,n,4,3),2,4);
       end;
    3: begin
             dataR('',x0,center(i,n,5,2),4,5);
             k := k + Round(x0);   resultN('',Round(x0),center(i,n,2,5),2,2);
       end;
    end;
  end;
case v1 of
1: resultR('Сумма целых частей: ',x,0,4,5);
2: begin
   setPrecision(6);
   resultR('Произведение дробных частей: ',y,0,4,8);
   end;
3: resultN('Сумма округленных значений: ',k,0,4,2);
end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(4,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Вывести в\ том\ же порядке все четные числа из\ данного набора',0,3);
taskText('и\ количество~{K} таких чисел.',0,4);
(*
*)
end
else
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Вывести в\ том\ же порядке индексы всех нечетных чисел из\ данного набора',0,3);
taskText('и\ количество~{K} таких чисел.',0,4);
(*
*)
end;
(*==*)
n := 2 + Random(9);
dataN('N = ',n,0,2,1);
k := 0;
for i := 1 to n do
  begin
    m := integer(Random(19))-9;
//    if m=0 then m := 1+Random(2); //2012
    dataN('',m,center(i,n,2,5),4,2);
    case v1 of
    1:
    if not Odd(m) then
      begin
        inc(k);
        b[k]:=m;
      end;
    2:
    if Odd(m) then
      begin
        inc(k);
        b[k]:=i;
      end;
  end;
  end;
if v1 = 1 then //2021.04 исправлена ошибка!
  for i := 1 to k do
    resultN('',b[i],center(i,k,2,5),2,2)
else
  for i := 1 to k do
    resultN('',b[i]-1,center(i,k,2,5),2,2);
resultN('K = ',k,0,4,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Если в\ наборе имеются положительные числа, то\ вывести \t;',0,3);
taskText('в\ противном случае вывести \f.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
n1 := 0;
dataN('N = ',n,0,2,1);
n2 := Random(2);
case curtest of //2012
3: n2 := 0;
4: n2 := 1;
end;
if n2 = 0 then n3 := n
else
n3 := 1 + Random(n);
for i := 1 to n do
  begin
    if n2 = 0 then
      m := -integer(Random(10))
    else
      if i < n3 then
        m := -integer(Random(10))
      else
      if i = n3 then
        m := 1+integer(Random(9))
      else
        m := 9-integer(Random(19));
    dataN('',m,center(i,n,2,5),4,2);
  end;
resultB('',n2=1,0,3);
setNumberOfUsedData(n3+1);
setNumberOfTests(9);
Pause;
end;

procedure SMin60An7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K},~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Если в\ наборе имеются числа, меньшие~{K}, то\ вывести \t;',0,3);
taskText('в\ противном случае вывести \f.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
k := Random(7)+2;
n1 := 0;
dataN('K = ',k,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
n2 := Random(2);
case curtest of //2012
5: n2 := 0;
7: n2 := 1;
end;
if n2 = 0 then n3 := n
else
n3 := 1 + Random(n);
for i := 1 to n do
  begin
    if n2 = 0 then
      m := k+Random(9-k+1)
    else
      if i < n3 then
        m := k+Random(9-k+1)
      else
      if i = n3 then
        m := 1+Random(k-1)
      else
        m := Random(9)+1;
    dataN('',m,center(i,n,1,6),4,1);
    if m<k then
      begin
      inc(n1);
      end;
  end;
resultB('',n1>0,0,3);
setNumberOfUsedData(n3+2);
setNumberOfTests(9);
Pause;
end;





procedure SMin60An8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дан набор ненулевых целых чисел; признак его завершения\ \= число~0.',0,2);
taskText('Вывести количество чисел в\ наборе.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
for i := 1 to n do
begin
    m := integer(Random(19))-9; //2012
    if m=0 then m := 1+Random(2);
    dataN('',m,center(i,n+1,2,5),3,2);
end;
dataN('',0,center(n+1,n+1,1,6),3,1);
resultN('',n,0,3,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Дан набор ненулевых целых чисел; признак его завершения\ \= число~0.',0,2);
taskText('Вывести сумму всех положительных четных чисел из\ данного набора.',0,3);
taskText('Если требуемые числа в\ наборе отсутствуют, то\ вывести~0.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
k := 0;
for i := 1 to n do
  begin
    m := integer(Random(19))-9;
    if m=0 then m := 1+Random(2);
    dataN('',m,center(i,n+1,2,5),3,2);
    if (m>0) and (not Odd(m)) then k := k + m;
  end;
dataN('',0,center(n+1,n+1,2,5),3,2);
resultN('',k,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K} и\ набор ненулевых целых чисел;',0,2);
taskText('признак его завершения\ \= число~0.',0,3);
taskText('Вывести количество чисел в\ наборе, меньших~{K}.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
k := Random(7)+2;
n1 := 0;
dataN('K = ',k,0,2,1);
n2 := Random(3);
case curtest of //2012
3: n2 := 1;
4: n2 := 0;
end;
for i := 1 to n do
  begin
    if n2 = 0 then
      m := k+Random(9-k+1)
    else  m := Random(9)+1;
    dataN('',m,center(i,n+1,1,6),4,1);
    if m<k then inc(n1);
  end;
dataN('',0,center(n+1,n+1,1,6),4,1);
resultN('',n1,0,3,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K} и\ набор ненулевых целых чисел; признак его завершения\ \=',0,2);
taskText('число~0. Вывести индекс первого числа в\ наборе, большего~{K}.',0,3);
taskText('Если таких чисел нет, то\ вывести~\-1.',0,4);
(*
*)
n := 2 + Random(8);
k := Random(7)+2;
n1 := 0;
dataN('K = ',k,0,2,1);
n2 := Random(2);
case curtest of //2012
2: n2 := 0;
4: n2 := 1;
end;
if n2 = 0 then n3 := n+1
else
n3 := 1 + Random(n);
for i := 1 to n do
  begin
    if n2 = 0 then
      m := 1+Random(k)
    else
      if i < n3 then
        m := 1+Random(k)
      else
      if i = n3 then
        m := 1+k+Random(9-k)
      else
        m := Random(9)+1;
    dataN('',m,center(i,n+1,1,6),4,1);
    if (m>k) and (n1=0) then
      begin
        n1 := i;
      end;
  end;
dataN('',0,center(n+1,n+1,1,6),4,1);
resultN('',n1-1,0,3,1);
setNumberOfUsedData(n3+1);
setNumberOfTests(5);
pause;
end;

procedure SMin60An12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K} и\ набор ненулевых целых чисел; признак его завершения\ \=',0,2);
taskText('число~0. Вывести индекс последнего числа в\ наборе, большего~{K}.',0,3);
taskText('Если таких чисел нет, то\ вывести~\-1.',0,4);
(*
*)
n := 2 + Random(8);
k := Random(7)+2;
n1 := 0;
dataN('K = ',k,0,2,1);
n2 := Random(3);
case curtest of //2012
3: n2 := 1;
4: n2 := 0;
end;
if n2 = 0 then n3 := n+1
else
n3 := 1 + Random(n);
for i := 1 to n do
  begin
    if n2 = 0 then
      m := 1+Random(k)
    else
      if i > n3 then
        m := 1+Random(k)
      else
      if i = n3 then
        m := 1+k+Random(9-k)
      else
        m := Random(9)+1;
    dataN('',m,center(i,n+1,1,6),4,1);
    if m>k then n1 := i;
  end;
dataN('',0,center(n+1,n+1,1,6),4,1);
resultN('',n1-1,0,3,1);
setNumberOfTests(5);
pause;
end;


procedure SMin60An13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Дано вещественное число~{B}, целое число~{N} и\ набор из\ {N}~вещественных чисел,',0,2);
taskText('упорядоченных по\ возрастанию. Вывести элементы набора вместе с\ числом~{B},',0,3);
taskText('сохраняя упорядоченность выводимых чисел.',0,4);
(*
*)
n := 2 + Random(8);
for i := 1 to n do
  a[i] := 0.5 + Random*9.00; //2012
for k := 1 to n-1 do
  for i := 1 to n-k do
    if a[i]>a[i+1] then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
m := Random(4); //2012
case curtest of //2012
2: m := 0;
3: m := 3;
5: m := 1;
end;
repeat
case m of
0: b2 := a[1]-Random;
1,2: b2 := Random*9.98;
3: b2 := a[n]+Random;
end;
until (b2>0) and (b2<10);
dataR('B = ',b2,xLeft,2,4);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,4,3),4,4);
k := 0;
if b2 < a[1] then
    begin
    inc(k);
    resultR('',b2,center(k,n+1,4,3),3,4);
    end;
inc(k);
resultR('',a[1],center(k,n+1,4,3),3,4);
for i:=2 to n do
  begin
  if (b2 > a[i-1])and(b2 < a[i]) then
    begin
    inc(k);
    resultR('',b2,center(k,n+1,4,3),3,4);
    end;
  inc(k);
  resultR('',a[i],center(k,n+1,4,3),3,4);
  end;
if k < n+1 then
  resultR('',b2,center(n+1,n+1,4,3),3,4);
setNumberOfTests(7);
pause;
end;

procedure SMin60An14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел, упорядоченный по\ возрастанию.',0,2);
taskText('Данный набор может содержать одинаковые элементы.',0,3);
taskText('Вывести в\ том\ же порядке все различные элементы данного набора.',0,4);
(*
*)
(*==*)
n := 10 + Random(16);
for i := 1 to n do
  b[i] := 1+Random(19);
for k := 1 to n-1 do
  for i := 1 to n-k do
    if b[i]>b[i+1] then
      begin
        m := b[i];
        b[i] := b[i+1];
        b[i+1] := m;
      end;
k := 0;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,1),4,2);
k := 1;
for i := 2 to n do
  if b[i]<>b[i-1] then inc(k);
j := 1;
resultN('',b[1],center(1,k,2,1),3,2);
for i := 2 to n do
  if b[i]<>b[i-1] then
    begin
      inc(j);
      resultN('',b[i],center(j,k,2,1),3,2);
    end;
setNumberOfTests(5);
Pause;
end;



procedure SMin60An15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~целых чисел.',0,2);
taskText('Вывести те\ элементы в\ наборе, которые меньше своего левого соседа,',0,3);
taskText('и\ количество~{K} таких элементов.',0,4);
(*
*)
j := 1;
n := 2 + Random(8);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
    b[i] := Random(9)+1;
    dataN('',b[i],center(i,n,1,6),4,1);
  end;
k := 0;

for i := 1+j to n-1+j do
  begin
  if b[i]<b[i+1-2*j] then
    begin
      inc(k);
      b1[k] := b[i];
    end;
  end;
for i := 1 to k do
  resultN('',b1[i],center(i,k,1,6),2,1);
resultN('K = ',k,0,4,1);
setNumberOfTests(5);
pause;
end;




procedure SMin60An16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~целых чисел.',0,2);
taskText('Вывести те\ элементы в\ наборе, которые меньше своего правого соседа,',0,3);
taskText('и\ количество~{K} таких элементов.',0,4);
(*
*)
(*==*)
j := 0;
n := 2 + Random(8);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
    b[i] := Random(9)+1;
    dataN('',b[i],center(i,n,1,6),4,1);
  end;
k := 0;

for i := 1+j to n-1+j do
  begin
  if b[i]<b[i+1-2*j] then
    begin
      inc(k);
      b1[k] := b[i];
    end;
  end;
for i := 1 to k do
  resultN('',b1[i],center(i,k,1,6),2,1);
resultN('K = ',k,0,4,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~вещественных чисел. Проверить,',0,2);
taskText('образует\ ли данный набор возрастающую последовательность.',0,3);
taskText('Если образует, то\ вывести \t, если нет\ \= вывести \f.',0,4);
(*
*)
n := 2 + Random(8);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  a[i] := Random*19.98-10; //2012
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a[i]>a[i+1] then
        begin
          x := a[i];
          a[i] := a[i+1];
          a[i+1] := x;
        end;
m := Random(2);
case curtest of //2012
3,7: m := 0;
5: m := 1;
end;
if m=0 then
  for i := 1 to Random(3)+1 do
    a[Random(n)+1] := Random*19.98-10; //2012
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
n3 := 1 + n;
bln := True;
for i:=1 to n-1 do
  if a[i]>a[i+1] then
    begin
      n3 := 2 + i;
      bln := False;
      break;
    end;
resultB('',bln,0,3);
setNumberOfUsedData(n3);
setNumberOfTests(9);
pause;
end;

procedure SMin60An18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(4,0,0,0,v1,v2,v3);
j := -1;
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~вещественных чисел. Если данный набор',0,2);
taskText('образует убывающую последовательность, то\ вывести~\-1; в\ противном случае',0,3);
taskText('вывести индекс первого числа, нарушающего закономерность.',0,4);
(*
*)
(*==*)
n := 2 + Random(8);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  a[i] := Random*19.98-10; //2012
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a[i]<a[i+1] then
        begin
          x := a[i];
          a[i] := a[i+1];
          a[i+1] := x;
        end;
m := Random(3);
case curtest of //2012
4,6: m := 0;
3: m := 1;
end;
if m=0 then
  for i := 1 to Random(3)+1 do
    a[Random(n)+1] := Random*19.98-10; //2012
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
n3 := 1 + n;
k := 0;
for i:=1 to n-1 do
  if a[i]<a[i+1] then
    begin
      n3 := 2 + i;
      k := i+1;
      break;
    end;
resultN('',k-1,0,3,1);
setNumberOfUsedData(n3);
setNumberOfTests(7);
Pause;
end;

procedure SMin60An19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,2) и\ набор из\ {N}~вещественных чисел.',0,1);
taskText('Набор называется \Iпилообразным\i, если каждый его внутренний элемент',0,2);
taskText('либо больше, либо меньше обоих своих соседей (т.\,е. является \<зубцом\>).',0,3);
taskText('Если данный набор является пилообразным, то\ вывести~\-1; в\ противном случае',0,4);
taskText('вывести индекс первого элемента, не\ являющегося зубцом.',0,5);
(*
*)
(*==*)
n := 3 + Random(7);
if Random(2)=0 then j := -1 else j := 1;
a[1] := Random*9.98;
for i := 2 to n do
  begin
  j := -j;
  repeat
  a[i] := a[i-1] + j*Random*9.98;
  until (a[i]>0) and (a[i]<10);
  end;
j := 0;
m := Random(2);
case curtest of //2012
3: m := 1;
6: m := 0;
end;
if (m=0) and (n>2) then
  begin
  j := 2 + Random(n-2);
  repeat
    a[j] := Random*9.98
  until (a[j]-a[j-1])*(a[j]-a[j+1])<0;
  end;
j := 0;
for i := 2 to n-1 do
  if (a[i]-a[i-1])*(a[i]-a[i+1])<0 then
   begin
     j := i;
     break;
   end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,4,3),4,4);
resultN('',j-1,0,3,1);
if n = 2 then
  setNumberOfUsedData(1)
else if j <> 0 then
  setNumberOfUsedData(j+2);
setNumberOfTests(7);
Pause;
end;

procedure SMin60An20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел, содержащий по\ крайней мере',0,2);
taskText('два нуля. Вывести сумму чисел из\ данного набора, расположенных между',0,3);
taskText('последними двумя нулями (если последние нули идут подряд, то\ вывести~0).',0,4);
(*
*)
(*==*)
n := 10 + Random(9);
k := Random(4)+2;
for i := 1 to n do
  b[i] := Random(9)+1;
for i := 1 to k do
  begin
  repeat
    j := Random(n)+1;
  until b[j]<>0;
  b[j] := 0;
  end;
dataN('N = ',n,0,2,1);
n1 := 0;
n2 := 0;
bln := False;
for i := 1 to n do
  dataN('',b[i],center(i,n,1,3),4,1);
for i := n downto 1 do
  begin
    if b[i]=0 then
      begin
        inc(n2);
        bln := n2=1;
      end;
    if bln then n1 := n1 + b[i];
  end;
resultN('',n1,0,3,2);
setNumberOfTests(8);
Pause;
end;


procedure SMin60An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,33{level2});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел, содержащий по\ крайней мере',0,2);
taskText('два нуля. Вывести сумму чисел из\ данного набора, расположенных между первым',0,3);
taskText('и последним нулем (если первый и последний нули идут подряд, то\ вывести~0).',0,4);
(*
*)
(*==*)
n := 10 + Random(9);
k := Random(4)+2;
for i := 1 to n do
  b[i] := Random(9)+1;
for i := 1 to k do
  begin
  repeat
    j := Random(n)+1;
  until b[j]<>0;
  b[j] := 0;
  end;
dataN('N = ',n,0,2,1);
n1 := 0;
n2 := 0;
bln := False;
for i := 1 to n do
  begin
    dataN('',b[i],center(i,n,1,3),4,1);
    if b[i]=0 then
      begin
        n1 := n1 + n2;
        n2 := 0;
        bln := true;
      end
    else
      if bln then
        n2 := n2 + b[i];
  end;
resultN('',n1,0,3,2);
setNumberOfTests(8);
Pause;
end;



procedure SMin60An22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;




procedure SMin60An23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N} и\ набор из\ {N}~вещественных чисел:~{A}_{0}, {A}_{1},~\., {A}_{N\-1}.',0,2);
taskText('Вывести {K}-e\ степени чисел из\ данного набора:',0,3);
taskText('\[({A}_{0})^K, ({A}_{1})^K,~\., ({A}_{N\-1})^K.\]',0,4);
(*
*)
(*==*)
n := 2 + Random(6);
k := 1 + Random(6);
dataN('K = ',k,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
j := 0;
for i := 1 to n do
  begin
  repeat
  a[i] := RandomR2(0.1,9.9); //Random*9.98; //2018
  a1[i] := 1;
  for j := 1 to k do
    a1[i] := a1[i]*a[i];
  Str(a1[i]:0:2,s2);
  until length(s2)<9;
  if length(s2)>j then j := length(s2);
  end;
for i := 1 to n do
  begin
  dataR('',a[i],center(i,n,j,11-j),4,j);
  resultR('',a1[i],center(i,n,j,11-j),3,j);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~вещественных чисел:~{A}_{0}, {A}_{1},~\., {A}_{N\-1}.',0,2);
taskText('Вывести следующие числа:\[ {A}_{0}, ({A}_{1})^2,~\., ({A}_{N\-2})^{N\-1}, ({A}_{N\-1})^N.\]',0,4);
(*
*)
(*==*)
n := 2 + Random(6);
n :=  7;
dataN('N = ',n,0,2,1);
j := 0;
for i := 1 to n do
  begin
  repeat
  a[i] := RandomR2(0.1,9.9); //Random*9.98; //2018
  a1[i] := 1;
  k := i;
  for j := 1 to k do
    a1[i] := a1[i]*a[i];
  Str(a1[i]:0:2,s2);
  until length(s2)<9;
  if length(s2)>j then j := length(s2);
  end;
for i := 1 to n do
  begin
  dataR('',a[i],center(i,n,j,11-j),4,j);
  resultR('',a1[i],center(i,n,j,11-j),3,j);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~вещественных чисел:~{A}_{0}, {A}_{1},~\., {A}_{N\-1}.',0,2);
taskText('Вывести следующие числа:\[ ({A}_{0})^N, ({A}_{1})^{N\-1},~\., ({A}_{N\-2})^2, {A}_{N\-1}.\]',0,4);
(*
*)
(*==*)
n := 2 + Random(6);
n :=  7;
dataN('N = ',n,0,2,1);
j := 0;
for i := 1 to n do
  begin
  repeat
  a[i] := RandomR2(0.1,9.9); //Random*9.98; //2018
  a1[i] := 1;
  k := n+1-i;
  for j := 1 to k do
    a1[i] := a1[i]*a[i];
  Str(a1[i]:0:2,s2);
  until length(s2)<9;
  if length(s2)>j then j := length(s2);
  end;
for i := 1 to n do
  begin
  dataR('',a[i],center(i,n,j,11-j),4,j);
  resultR('',a1[i],center(i,n,j,11-j),3,j);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,2);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,3);
taskText('Вывести общую сумму всех элементов, входящих в\ данные наборы.',0,4);
(*
*)
(*==*)
k := 1 + Random(5);
n := 2 + Random(8);
a0 := 0;
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
for i := 1 to k do
  begin
  str(i,s);
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  a0 := a0 + b0;
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  end;
  end;
resultN('',a0,0,3,3);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,2);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,3);
taskText('Для каждого набора вывести сумму его элементов.',0,4);
(*
*)
k := 1 + Random(5);
n := 2 + Random(8);
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
for i := 1 to k do
  begin
  a0 := 0;
  str(i,s);
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  a0 := a0 + b0;
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  end;
  resultN('Набор '+s+':   ',a0,23,i,2);
  end;
setNumberOfTests(5);
pause;
end;

procedure SMin60An28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,2);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,3);
taskText('Найти количество наборов, содержащих число~2.',0,4);
taskText('Если таких наборов нет, то\ вывести~0.',0,5);
(*
*)
(*==*)
k := 1 + Random(5);
n := 2 + Random(8);
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
a0 := 0;
for i := 1 to k do
  begin
  str(i,s);
  m := 0;
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  if (m=0) and (b0=2) then m := j;
  end;
  if m <> 0 then inc(a0);
  end;
resultN('',a0,0,3,1);
if m <> 0 then
  setNumberOfUsedData(2+(k-1)*n+m);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,2);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,3);
taskText('Для каждого набора вывести индекс его первого элемента, равного~2,',0,4);
taskText('или число~\-1, если в\ данном наборе нет двоек.',0,5);
(*
*)
(*==*)
k := 1 + Random(5);
n := 2 + Random(8);
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
for i := 1 to k do
  begin
  str(i,s);
  m := 0;
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  if (m=0) and (b0=2) then m := j;
  end;
  resultN('Набор '+s+':   ',m-1,23,i,2);
  end;
if m <> 0 then
  setNumberOfUsedData(2+(k-1)*n+m);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,2);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,3);
taskText('Для каждого набора вывести индекс его последнего элемента, равного~2,',0,4);
taskText('или число~\-1, если в\ данном наборе нет двоек.',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
n := 6 + Random(4);
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
for i := 1 to k do
  begin
  str(i,s);
  m := 0;
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  if b0=2 then m := j;
  end;
  resultN('Набор '+s+':   ',m-1,23,i,2);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны целые числа~{K}, {N},',0,1);
taskText('а\ также {K}~наборов целых чисел по\ {N}~элементов в\ каждом наборе.',0,2);
taskText('Для каждого набора выполнить следующее действие: если в\ наборе',0,3);
taskText('содержится число~2, то\ вывести сумму его элементов;',0,4);
taskText('если в\ наборе нет двоек, то\ вывести~0.',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
n := 4 + Random(6);
dataN('K = ',k,5,1,1);
dataN('N = ',n,14,1,1);
for i := 1 to k do
  begin
  str(i,s);
  a0 := 0;
  m := 0;
  datacomment('Набор '+s+':',23,i);
  for j := 1 to n do
  begin
  b0 := 1 + Random(9);
  a0 := a0 + b0;
  dataN('',b0,center(j+5,14,1,4)+3,i,1);
  if b0=2 then m := j;
  end;
  if m <> 0 then m := a0;
  resultN('Набор '+s+':   ',m,23,i,2);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K}, а\ также {K}~наборов ненулевых целых чисел.',0,2);
taskText('Признаком завершения каждого набора является число~0.',0,3);
taskText('Для каждого набора вывести количество его элементов.',0,4);
taskText('Вывести также общее количество элементов во\ всех наборах.',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
dataN('K = ',k,7,1,1);
m := 0;
for i := 1 to k do
  begin
  n := 1 + Random(9);
  str(i,s);
  datacomment('Набор '+s+':',18,i);
  for j := 1 to n do
  begin
  b0 := Random(19)-9; //2012
  if b0 = 0 then b0 := Random(5)+1;
  dataN('',b0,center(j+5,14,2,3)-3,i,2);
  end;
  dataN('',0,center(n+6,14,2,3)-3,i,2);
  m := m + n;
  resultN('Набор '+s+':   ',n,18,i,2);
  end;
resultN('Общее количество элементов: ',m,xRight,5,2);
setNumberOfTests(5);
Pause;
end;


procedure SMin60An33(Name, Key: string);
var v1,v2,v3 : byte;
    x: array [1..10] of integer;
    b: boolean;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(4,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Дано целое число~{K}, а также~{K} наборов ненулевых целых чисел. Каждый набор',0,2);
taskText('содержит не менее двух элементов, признаком его завершения является число~0.',0,3);
taskText('Найти количество наборов, элементы которых возрастают.',0,4);
(*
*)
end
else
begin
taskText('Дано целое число~{K}, а также~{K} наборов ненулевых целых чисел. Каждый набор',0,2);
taskText('содержит не менее двух элементов, признаком его завершения является число~0.',0,3);
taskText('Найти количество наборов, элементы которых возрастают или убывают.',0,4);
(*
*)
end;
(*==*)
k := 2 + Random(4);
dataN('K = ',k,7,1,1);
m := 0;
for i := 1 to k do
  begin
  n := 2 + Random(8);
  str(i,s);
  datacomment('Набор '+s+':',18,i);
  repeat
  for j := 1 to n do
    x[j] := 1 + Random(99);
  b := true;
  for j := 1 to n do
    for k := 1 to j-1 do
      if x[k] = x[j] then b := false;
  until b;
  case Random(3) of
  0:
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]>x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  1:
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]<x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  2:
  begin //2012
  if Random(2) = 0 then
  for k := 1 to n-1 do
    for j := 1 to n-k do
    begin
    if x[j]>x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end
    end
  else
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]<x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  for k := 1 to Random(2)+1 do
    x[Random(n)+1] := 1 + Random(99);
  end;
  end;
  for j := 1 to n do
    dataN('',x[j],center(j+5,14,2,3)-2,i,2);
  dataN('',0,center(n+6,14,2,3)-2,i,2);
  k := 0;
  for j := 2 to n do
    if x[j]>x[j-1] then inc(k);
  if v1 = 1 then
    b := k = n-1
  else
    b := (k = n-1) or (k = 0);
  if b then inc(m);
  end;
resultN('',m,0,3,1);
setNumberOfTests(7);
Pause;
end;


procedure SMin60An34(Name, Key: string);
var v1,v2,v3 : byte;
    x: array [1..10] of integer;
    b: boolean;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K}, а также~{K} наборов ненулевых целых чисел. Каждый набор',0,1);
taskText('содержит не менее двух элементов, признаком его завершения является число~0.',0,2);
taskText('Для каждого набора выполнить следующее действие: если элементы набора',0,3);
taskText('возрастают, то\ вывести~1; если элементы набора убывают, то вывести~\-1;',0,4);
taskText('если элементы набора не\ возрастают и\ не\ убывают, то вывести~0.',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
dataN('K = ',k,7,1,1);
m := 0;
for i := 1 to k do
  begin
  n := 2 + Random(8);
  str(i,s);
  datacomment('Набор '+s+':',18,i);
  repeat
  for j := 1 to n do
    x[j] := 1 + Random(99);
  b := true;
  for j := 1 to n do
    for k := 1 to j-1 do
      if x[k] = x[j] then b := false;
  until b;
  case Random(3) of
  0:
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]>x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  1:
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]<x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  2:
  begin //2012
  if Random(2) = 0 then
  for k := 1 to n-1 do
    for j := 1 to n-k do
    begin
    if x[j]>x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end
    end
  else
  for k := 1 to n-1 do
    for j := 1 to n-k do
    if x[j]<x[j+1] then
      begin
        m1 := x[j];
        x[j] := x[j+1];
        x[j+1] := m1;
      end;
  for k := 1 to Random(2)+1 do
    x[Random(n)+1] := 1 + Random(99);
  end;
  end;
  for j := 1 to n do
    dataN('',x[j],center(j+5,14,2,3)-2,i,2);
  dataN('',0,center(n+6,14,2,3)-2,i,2);
  k := 0;
  for j := 2 to n do
    if x[j]>x[j-1] then inc(k);
  if k = n-1 then m := 1
  else
  if k = 0 then m := -1
  else
    m := 0;
  resultN('Набор '+s+':   ',m,18,i,2);
  end;
setNumberOfTests(5);
Pause;
end;


procedure SMin60An35(Name, Key: string);
var v1,v2,v3 : byte;
    x: array [1..10] of integer;
    b: boolean;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K}, а также~{K} наборов ненулевых целых чисел. Каждый набор',0,2);
taskText('содержит не менее трех элементов, признаком его завершения является число~0.',0,3);
taskText('Найти количество пилообразных наборов',0,4);
taskText('(определение пилообразного набора дано в\ задании \16).',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
dataN('K = ',k,7,1,1);
m := 0;
for i := 1 to k do
  begin
  n := 3 + Random(7);
  str(i,s);
  datacomment('Набор '+s+':',18,i);
  repeat
  for j := 1 to n do
    x[j] := 1 + Random(99);
  b := true;
  for j := 1 to n do
    for k := 1 to j-1 do
      if x[k] = x[j] then b := false;
  until b;
  if Random(2) = 1 then
  for j := 3 to n do
  repeat
    x[j] := 1 + Random(99)
  until (x[j-1]-x[j-2])*(x[j-1]-x[j])>0;
  for j := 1 to n do
    dataN('',x[j],center(j+5,14,2,3)-2,i,2);
  dataN('',0,center(n+6,14,2,3)-2,i,2);
  k := 1;
  for j := 2 to n-1 do
    if (x[j]-x[j-1])*(x[j]-x[j+1])<0 then
    begin
      k := 0;
      break;
    end;
  m := m + k;
  end;
resultN('',m,0,3,1);
setNumberOfTests(7);
Pause;
end;




procedure SMin60An36(Name, Key: string);
var v1,v2,v3 : byte;
    x: array [1..10] of integer;
    b: boolean;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{K}, а также~{K} наборов ненулевых целых чисел. Каждый набор',0,1);
taskText('содержит не менее трех элементов, признаком его завершения является число~0.',0,2);
taskText('Для каждого набора выполнить следующее действие: если набор является',0,3);
taskText('пилообразным (см.\ задание \17), то\ вывести количество его\ элементов;',0,4);
taskText('в\ противном случае вывести индекс первого элемента, не являющегося зубцом.',0,5);
(*
*)
(*==*)
k := 2 + Random(4);
dataN('K = ',k,7,1,1);
m := 0;
for i := 1 to k do
  begin
  n := 3 + Random(7);
  str(i,s);
  datacomment('Набор '+s+':',18,i);
  repeat
  for j := 1 to n do
    x[j] := 1 + Random(99);
  b := true;
  for j := 1 to n do
    for k := 1 to j-1 do
      if x[k] = x[j] then b := false;
  until b;
  if Random(2) = 1 then
  for j := 3 to n do
  repeat
    x[j] := 1 + Random(99)
  until (x[j-1]-x[j-2])*(x[j-1]-x[j])>0;
  for j := 1 to n do
    dataN('',x[j],center(j+5,14,2,3)-2,i,2);
  dataN('',0,center(n+6,14,2,3)-2,i,2);
  k := n;
  for j := 2 to n-1 do
    if (x[j]-x[j-1])*(x[j]-x[j+1])<0 then
    begin
      k := j-1;
      break;
    end;
  resultN('Набор '+s+':   ',k,18,i,2);
  end;
setNumberOfTests(5);
Pause;
end;




procedure SMin60An37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;



procedure SMin60An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~чисел.',0,2);
taskText('Найти минимальный и\ максимальный из\ элементов данного набора',0,3);
taskText('и\ вывести\ их в\ указанном порядке.',0,4);
(*
Решение этого задания приводится в\ п.\,9.1.
*)
n := 1 + Random(10);
a[1] := 19.98*Random-10;           //2012
amin := a[1];
amax := a[1];
for i:=2 to n do
  begin
    a[i] := 19.98*Random-10;
    if amin > a[i] then amin := a[i]
    else
      if amax < a[i] then amax := a[i];
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('Минимальный элемент:  ',amin,0,2,5);
resultR('Максимальный элемент: ',amax,0,4,5);
setNumberOfTests(5);
pause;
end;

procedure SMin60An39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(6,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~прямоугольников,',0,2);
taskText('заданных своими сторонами\ \= парами чисел ({a},\,{b}).',0,3);
taskText('Найти минимальную площадь прямоугольника из\ данного набора.',0,4);
(*
*)
end;
2:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~прямоугольников,',0,2);
taskText('заданных своими сторонами\ \= парами чисел ({a},\,{b}).',0,3);
taskText('Найти максимальный периметр прямоугольника из\ данного набора.',0,4);
(*
*)
end;
end;
(*==*)
n := 1 + Random(6);
a[1] := RandomR2(0.1,9.9); //9.98*Random; //2018
a1[1] := RandomR2(0.1,9.9); //9.98*Random;
amin := a[1]*a1[1];
amax := 2*(a[1]+a1[1]);
for i:=2 to n do
  begin
    a[i] := RandomR2(0.1,9.9); //9.98*Random;
    a1[i] := RandomR2(0.1,9.9); //9.98*Random;
    if amin > a[i]*a1[i] then amin := a[i]*a1[i];
    if amax < 2*(a[i]+a1[i]) then amax := 2*(a[i]+a1[i]);
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
  Str(i-1,s); //!
  datacomment(' a_'+s+'   b_'+s,center(i,n,10,3),3);
  dataR2('',a[i],a1[i],center(i,n,10,3),4,5);
  end;
case v1 of
1: resultR('',amin,0,3,4);
2: resultR('',amax,0,3,4);
end;
setNumberOfTests(5);
Pause;
end;



procedure SMin60An40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);

taskText('Дано целое число~{N} и\ набор из\ {N}~чисел.',0,2);
taskText('Найти индекс минимального элемента из\ данного набора.',0,4);
(*
*)
n := 1 + Random(10);
a[1] := 19.98*Random - 10;
amin := a[1];
k := 1;
for i:=2 to n do
  begin
    a[i] := 19.98*Random -10;
    if amin > a[i] then begin amin := a[i]; k := i; end;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultN('',k-1,0,3,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~пар чисел ({m},\,{v})\ \= данные',0,1);
taskText('о\ массе~{m} и\ объеме~{v} деталей, изготовленных из\ различных материалов.',0,2);
taskText('Вывести индекс детали, изготовленной из\ материала максимальной плотности,',0,3);
taskText('а\ также величину этой максимальной плотности.',0,4);
taskText('Плотность~{P} вычисляется по\ формуле \[{P}~=~{m}/{v}.\]',0,5);
(*
*)
(*==*)
n := 1 + Random(6);
a[1] := 1+8.98*Random;
a1[1] := 1+8.98*Random;
amax := a[1]/a1[1];
nmax := 1;
for i:=2 to n do
  begin
    a[i] := 1+8.98*Random;
    a1[i] := 1+8.98*Random;
    if amax < a[i]/a1[i] then
      begin
      amax := a[i]/a1[i];
      nmax := i;
      end;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  begin
  Str(i-1,s); //!
  datacomment(' m_'+s+'   v_'+s,center(i,n,10,3),3);
  dataR2('',a[i],a1[i],center(i,n,10,3),4,5);
  end;
resultN('Индекс детали: ',nmax-1,xLeft,3,1);
resultR('Плотность детали: ',amax,xRight,3,4);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел. Найти индексы',0,2);
taskText('первого минимального и\ последнего максимального элемента из\ данного набора',0,3);
taskText('и\ вывести\ их в\ указанном порядке.',0,4);
(*
В\ алгоритме важно выбрать правильную операцию отношения
(<, > или <=, >=) при сравнении исходных элементов с\ переменной
{min}/{max} (см.\ решение задания Minmax1 в\ п.\,9.1).
*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMax:=b[1];bMin:=b[1];
nmin:=1;nmax:=1;
nmin1:=1;nmax1:=1;
for i:=2 to n do
  begin
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
      nmax1 := i;
  if b[i]<bMin then
      begin
        bMin:=b[i];
        nmin1:=i;
        nmin:=i;
      end
  else if b[i]=bmin then
         nmin1 := i;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
    resultN('Индекс первого минимального элемента:     ',nmin-1,0,2,2);
    resultN('Индекс последнего максимального элемента: ',nmax1-1,0,4,2);
setNumberOfTests(5);
pause;
end;


procedure SMin60An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел. Найти индексы',0,2);
taskText('первого максимального и\ последнего минимального элемента из\ данного набора',0,3);
taskText('и\ вывести\ их в\ указанном порядке.',0,4);
(*
В\ алгоритме важно выбрать правильную операцию отношения
(<, > или <=, >=) при сравнении исходных элементов с\ переменной
{min}/{max} (см.\ решение задания Minmax1 в\ п.\,9.1).
*)
(*==*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMax:=b[1];bMin:=b[1];
nmin:=1;nmax:=1;
nmin1:=1;nmax1:=1;
for i:=2 to n do
  begin
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
      nmax1 := i;
  if b[i]<bMin then
      begin
        bMin:=b[i];
        nmin1:=i;
        nmin:=i;
      end
  else if b[i]=bmin then
         nmin1 := i;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
    resultN('Индекс первого максимального элемента:    ',nmax-1,0,2,2);
    resultN('Индекс последнего минимального элемента:  ',nmin1-1,0,4,2);
setNumberOfTests(5);
Pause;
end;



procedure SMin60An44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1:
begin
k := -1;
s := 'мини';
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти индексы первого и\ последнего минимального элемента из\ данного набора',0,3);
taskText('и\ вывести\ их в\ указанном порядке.',0,4);
(*
*)
end;
2:
begin
k := 1;
s := 'макси';
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти индексы первого и\ последнего максимального элемента из\ данного набора',0,3);
taskText('и\ вывести\ их в\ указанном порядке.',0,4);
(*
*)
end;
end;
(*==*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMax:=b[1];
nmax:=1;
nmax1:=1;
for i:=2 to n do
  if k*b[i]>k*bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
      nmax1 := i;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('Индекс первого '+s+'мального элемента:    ',nmax-1,0,2,2);
resultN('Индекс последнего '+s+'мального элемента: ',nmax1-1,0,4,2);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(5,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти индекс первого \Iэкстремального\i (т.\,е. минимального',0,3);
taskText('или максимального) элемента из\ данного набора.',0,4);
(*
*)
end;
2:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти индекс последнего \Iэкстремального\i (т.\,е. минимального',0,3);
taskText('или максимального) элемента из\ данного набора.',0,4);
(*
*)
end;
end;
(*==*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMax:=b[1];bMin:=b[1];
nmin:=1;nmax:=1;
nmin1:=1;nmax1:=1;
for i:=2 to n do
  begin
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
      nmax1 := i;
  if b[i]<bMin then
      begin
        bMin:=b[i];
        nmin1:=i;
        nmin:=i;
      end
  else if b[i]=bmin then
         nmin1 := i;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
case v1 of
1: if  nmax < nmin then i := nmax
                   else i := nmin;
2: if  nmax1 > nmin1 then i := nmax1
                     else i := nmin1;
end;
resultN('',i-1,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~чисел.',0,2);
taskText('Найти минимальное положительное число из\ данного набора.',0,3);
taskText('Если положительные числа в\ наборе отсутствуют, то\ вывести~0.',0,4);
(*
*)
n := 1 + Random(10);
c0 := Random(4);
case curtest of //2012
3: c0 := 2;
4: c0 := 1;
end;
for i:=1 to n do
 begin
  a[i] := 1+8.98*Random;
  case c0 of
  0 : a[i] := a[i];
  1 : a[i] := -a[i];
  2 : if (i=1) or (Random(2)=0) then a[i] := -a[i];
  3 : if Random(2)=0 then a[i] := -a[i];
  end;
 end;
aMin:=32000; aMax:=-32000;
for i:=1 to n do
  if (a[i]>0)and(a[i]<aMin) then
 begin
      aMin:=a[i];
      nMin := i;
 end;
if aMin = 32000 then aMin := 0;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',amin,0,3,4);
setNumberOfTests(5);
pause;
end;


procedure SMin60An47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти индекс первого максимального нечетного числа из\ данного набора.',0,3);
taskText('Если нечетные числа в\ наборе отсутствуют, то\ вывести~\-1.',0,4);
(*
+
*)
(*==*)
n := 1 + Random(10);
c0:=Random(4);
case curtest of //2012
2: c0 := 2;
3: c0 := 0;
end;
for i:=1 to n do
 begin
  b[i] := 1+Random(10);
  case c0 of
  0 : b[i] := 2*b[i];
  1 : b[i] := 2*b[i]-1;
  2 : if (i=1) or (Random(2)=0) then b[i] := 2*b[i]
                       else b[i] := 2*b[i]-1;
  3 : if Random(2)=0 then b[i] := 2*b[i]
                       else b[i] := 2*b[i]-1;
  end;
  if Random(2)=0 then b[i] := -b[i]; //2012
 end;
bMax:=-32000;
for i:=1 to n do
  if Odd(b[i])and(b[i]>bMax) then
  begin
      bMax:=b[i];
      nmax := i;
  end;
if bMax = -32000 then nMax := 0
else
if nmax<n then
begin
k := Random(4);
for i := 1 to k do
  b[nmax + 1 + Random(n-nmax)] := b[nmax];
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
resultN('',nmax-1,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SMin60An48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
taskText('Дано число~{B} (>\,0) и\ набор из\ десяти чисел. Вывести минимальный',0,2);
taskText('из\ тех элементов набора, которые больше~{B}, а\ также его индекс.',0,3);
taskText('Если чисел, больших~{B}, в\ наборе нет, то\ дважды вывести~\-1.',0,4);
(*
+
*)
end;
2: begin
taskText('Даны числа~{B}, {C} (0\;<\;{B}\;<\;{C}) и\ набор из\ десяти чисел. Вывести максимальный',0,2);
taskText('из\ элементов набора, содержащихся в\ интервале ({B},\,{C}), и\ его индекс.',0,3);
taskText('Если требуемые числа в\ наборе отсутствуют, то\ дважды вывести~\-1.',0,4);
(*
*)
end;
end;
(*==*)
k := Random(2);
x0:=3+6.8*Random; y0:=10*Random;
case curtest of //2012
2: begin k := 0; y0:=x0+Random/10; end;
4: k := 1;
end;
if y0<x0 then y0:=x0+Random/10;
if v1 = 1 then y0 := 100;
aMin:=y0;
aMax := x0;
for i:=1 to 10 do
 begin
  a[i]:=9.98*Random;
  if (k = 1) and (v1 = 1) then
    a[i] := x0*Random;
  if (a[i]>aMax)and(a[i]<y0) then
    begin
      aMax:=a[i];
      nmax := i;
    end;
  if (a[i]<aMin)and(a[i]>x0) then
    begin
      aMin:=a[i];
      nmin := i;
    end;
 end;
if aMax=x0 then begin aMax:=-1; nmax := 0; end;
if aMin=y0 then begin aMin:=-1; nmin := 0; end;
case v1 of
1:dataR('B = ',x0,0,2,4);
2: begin
dataR('B = ',x0,xLeft,2,4);
dataR('C = ',y0,xRight,2,4);
end;
end;
for i := 1 to 10 do
  dataR('',a[i],center(i,10,4,3),4,4);
case v1 of
1: begin
resultR('Минимальный элемент: ',amin,xLeft,3,4);
resultN('Индекс минимального элемента: ',nmin-1,xRight,3,1);
end;
2: begin
resultR('Максимальный элемент: ',amax,xLeft,3,4);
resultN('Индекс максимального элемента: ',nmax-1,xRight,3,1);
end;
end;
setNumberOfTests(5);
Pause;
end;

procedure SMin60An49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(1,3,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти количество элементов, расположенных',0,3);
taskText('перед первым минимальным элементом.',0,4);
(*
*)
end;
2:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти количество элементов, расположенных',0,3);
taskText('после последнего максимального элемента.',0,4);
(*
*)
end;
3:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел. Найти количество элементов,',0,2);
taskText('содержащихся между первым и\ последним максимальным элементом.',0,3);
taskText('Если в\ наборе имеется единственный максимальный элемент, то\ вывести~0.',0,4);
(*
*)
end;
end;
(*==*)
case v1 of
1,2: begin
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMax:=b[1];bMin:=b[1];
nmin:=1;nmax:=1;
nmin1:=1;nmax1:=1;
for i:=2 to n do
  begin
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
      nmax1 := i;
  if b[i]<bMin then
      begin
        bMin:=b[i];
        nmin1:=i;
        nmin:=i;
      end
  else if b[i]=bmin then
         nmin1 := i;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
case v1 of
1: k:=nmin-1;
2: k:=n-nmax1;
end;
resultN('',k,0,3,2);
setNumberOfTests(5);
end;
3:begin
a0:=Random(3); b0:=3+Random(3); c0:=Random(4);
n := 1 + Random(10);
for i:=1 to n do
  b[i] := a0+Random(b0);
if c0=0 then b[1+Random(n)] := a0+b0;
bMax:=b[1];
nmax:=1;
nmax1:=1;
for i:=2 to n do
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax1:=i;
      nmax:=i;
    end
  else if b[i]=bmax then
       nmax1 := i;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
if nmax = nmax1 then i := 0
                else i := nmax1 - nmax - 1;
resultN('',i,0,3,2);
setNumberOfTests(7);
end;
end;
Pause;
end;

procedure SMin60An50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти количество минимальных элементов из\ данного набора.',0,4);
(*
*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
if (Random(5) = 0) or (curtest=4) then //2012
  begin
   a0 := Random(10);
   b0 := 1;
  end;
for i:=1 to n do
  b[i] := a0+Random(b0);
bMin:=b[1];
nmin:=1;
bMax:=b[1];
nmax:=1;
for i:=2 to n do
begin
  if b[i]<bMin then
    begin
      bMin:=b[i];
      nmin:=1;
    end
  else
    if b[i]=bMin then
      Inc(nmin);
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax:=1;
    end
  else
    if b[i]=bMax then
      Inc(nmax);
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',nmin,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти общее количество \Iэкстремальных\i (т.\,е. минимальных',0,3);
taskText('и\ максимальных) элементов из\ данного набора.',0,4);
(*
*)
(*==*)
n := 1 + Random(10);
a0:=Random(3); b0:=3+Random(3);
if (Random(5) = 0) or (curtest=3) then //2012
  begin
   a0 := Random(10);
   b0 := 1;
  end;
for i:=1 to n do
  b[i] := a0+Random(b0);
bMin:=b[1];
nmin:=1;
bMax:=b[1];
nmax:=1;
for i:=2 to n do
begin
  if b[i]<bMin then
    begin
      bMin:=b[i];
      nmin:=1;
    end
  else
    if b[i]=bMin then
      Inc(nmin);
  if b[i]>bMax then
    begin
      bMax:=b[i];
      nmax:=1;
    end
  else
    if b[i]=bMax then
      Inc(nmax);
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
if bMax<>bMin then
     resultN('',nmin+nmax,0,3,2)
   else
     resultN('',nmax,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SMin60An52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,2) и\ набор из\ {N}~чисел\ \=',0,2);
taskText('значений некоторой величины, полученных в\ {N}~опытах.',0,3);
taskText('Найти среднее значение этой величины. При вычислении среднего значения',0,4);
taskText('не\ учитывать минимальное и\ максимальное из\ имеющихся в\ наборе значений.',0,5);
(*
*)
(*==*)
case Random(3) of
0,1 : n := 3 + Random(8);
2 : n := 3 + Random(2);
end;
a[1] := 9.98*Random;
amin := a[1];
amax := a[1];
x := a[1];
for i:=2 to n do
  begin
    a[i] := 9.98*Random;
    if amin > a[i] then amin := a[i]
    else
      if amax < a[i] then amax := a[i];
    x := x + a[i];
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,4,3),4,4);
resultR('',(x-amin-amax)/(n-2),0,3,4);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
   s := '2';
   n := 2 + Random(9);
taskText('Дано целое число~{N} (>\,2) и\ набор из\ {N}~чисел.',0,2);
taskText('Найти два наименьших элемента из\ данного набора',0,3);
taskText('и\ вывести эти элементы в\ порядке возрастания их\ значений.',0,4);
(*
*)
for i:=1 to n do
  a[i] := 19.98*Random-10; //2012
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
aMax:=A[1];aMin:=A[2];
if aMin<aMax then
  begin
     x0:=aMin; aMin:=aMax; aMax:=x0;
  end;
for i:=3 to n do
   if a[i]<aMax then begin aMin := aMax; aMax:=a[i]; end
     else
       if a[i]<aMin then aMin:=a[i];
resultR('',aMax,xLeft,3,5);
resultR('',aMin,xRight,3,5);
setNumberOfTests(5);
Pause;
end;


procedure SMin60An54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(9,0,0,0,v1,v2,v3);
   s := '3';
   n := 3 + Random(8);
taskText('Дано целое число~{N} (>\,3) и\ набор из\ {N}~чисел.',0,2);
taskText('Найти три наибольших элемента из\ данного набора',0,3);
taskText('и\ вывести эти элементы в\ порядке убывания их\ значений.',0,4);
(*
*)
(*==*)
for i:=1 to n do
  a[i] := 19.98*Random-10; //2012
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for k := 1 to 2 do
  for j := 1 to 3-k do
    if A[j]<A[j+1] then
      begin
        x := A[j];
        A[j] := A[j+1];
        A[j+1] := x;
      end;
aMax:=A[1];z := A[2];aMin:=A[3];
for i:=4 to n do
   if a[i]>aMax then
     begin
       aMin := z;
       z := aMax;
       aMax := a[i];
     end
   else
    if a[i]>z then
     begin
       aMin := z;
       z := a[i];
     end
   else
    if a[i]>aMin then
       aMin := a[i];
resultR('',aMax,center(1,3,4,12),3,5);
resultR('',z,center(2,3,4,12),3,5);
resultR('',aMin,center(3,3,4,12),3,5);
setNumberOfTests(5);
Pause;
end;




procedure SMin60An55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~чисел.',0,2);
taskText('Найти максимальную сумму двух соседних чисел из\ данного набора.',0,4);
(*
*)
(*==*)
n := 2 + Random(9);
a[1] := RandomR2(-9.9,9.9); //19.98*Random-10; //2012 //2018
amax := -1000;
for i:=2 to n do
  begin
    a[i] := RandomR2(-9.9,9.9); //19.98*Random-10;
    if amax < a[i-1]+a[i] then amax := a[i-1]+a[i];
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',amax,0,3,5);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,1) и\ набор из\ {N}~чисел.',0,2);
taskText('Найти индексы двух соседних чисел из\ данного набора, произведение которых',0,3);
taskText('является минимальным, и\ вывести вначале меньший, а\ затем больший индекс.',0,4);
(*
*)
(*==*)
n := 2 + Random(9);
a[1] := 19.98*Random-10; //2012
amin := 1000;
nmin := 0;
for i:=2 to n do
  begin
    a[i] := 19.98*Random-10;
    if amin > a[i-1]*a[i] then
      begin
      amin := a[i-1]*a[i];
      nmin := i-1;
      end;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultN('Меньший индекс: ',nmin-1,0,2,1);
resultN('Больший индекс: ',nmin,0,4,1);
setNumberOfTests(5);
Pause;
end;

procedure SMin60An57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел.',0,2);
taskText('Найти максимальное количество четных чисел в\ наборе, идущих подряд.',0,3);
taskText('Если четные числа в\ наборе отсутствуют, то\ вывести~0.',0,4);
(*
*)
(*==*)
n := 7 + Random(4);
c0:=Random(6);
case curtest of //2012
2: c0 := 0;
3: c0 := 1;
5: c0 := 2;
end;
for i:=1 to n do
 begin
  b[i] := 1+Random(5);
 end;
  case c0 of
  0 : for i:=1 to n do
        b[i] := 2*b[i];
  1 : for i:=1 to n do
        b[i] := 2*b[i]-1;
  else
      begin
       bln := Random(2) = 0;
       i := n;
       while i >= 1 do
       begin
         k := random(4)+1;
         m := i - k + 1;
         if m < 1 then
           m := 1;
         if bln then
           for j := m to i do
             b[j] := 2*b[j]
         else
           for j := m to i do
             b[j] := 2*b[j]-1;
         i := m - 1;
         bln := not bln;
       end;
      end;
  end;
  for i := 1 to n do //2012
    if (Random(2)=0) and (b[i]<>10) then
      b[i] := -b[i];
bMax := 0;
if not Odd(b[1]) then k := 1
else k := 0;
for i:=2 to n do
  if not Odd(b[i]) then
    begin
    if not Odd(b[i-1]) then inc(k)
    else k := 1;
    end
  else
    begin
      if k > bMax then bMax := k;
      k := 0;
    end;
if k > bMax then bMax := k;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
resultN('',bMax,0,3,2);
setNumberOfTests(6);
Pause;
end;

procedure SMin60An58(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(7,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел, содержащий только',0,1);
taskText('нули и\ единицы. Найти индекс элемента, с\ которого начинается',0,2);
taskText('самая длинная последовательность одинаковых чисел, и\ количество элементов',0,3);
taskText('в\ этой последовательности. Если таких последовательностей несколько,',0,4);
taskText('то\ вывести индекс первой из\ них.',0,5);
(*
*)
end;
2:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел, содержащий только',0,1);
taskText('нули и\ единицы. Найти индекс элемента, с\ которого начинается самая длинная',0,2);
taskText('последовательность единиц, и\ количество элементов в\ этой последовательности.',0,3);
taskText('Если таких последовательностей несколько, то\ вывести индекс последней из\ них.',0,4);
taskText('Если единицы в\ исходном наборе отсутствуют, то\ вывести~\-1 и~0.',0,5);
(*
*)
end;
end;
(*==*)
n := 1 + Random(10);
c0:=Random(4);
b0 := Random(2);
case curtest of //2012
3: begin c0 := 0; b0 := 1; end;
5: c0 := 1;
6: begin c0 := 0; b0 := 0; end;
end;
for i:=1 to n do
  case c0 of
  0 : b[i] := b0;
  1,2,3 : b[i] := Random(2);
  end;
b[0] := 10;
bMax := 0;
k := 1;
j := 1;
nmax := 1;
for i:=1 to n do
  if b[i]=b[i-1] then inc(k)
  else
    begin
    case v1 of
    1: bln := k > bMax;
    2: bln := (k >= bMax) and (b[i-1]=1);
    end;
    if bln then
      begin
        bMax := k;
        nmax := j;
      end;
    k := 1;
    j := i;
    end;
case v1 of
1: bln := k > bMax;
2: bln := (k >= bMax) and (b[n]=1);
end;
if bln then
  begin
    bMax := k;
    nmax := j;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
if bmax = 0 then nmax := 0;
resultN('Индекс начального элемента: ',nMax-1,xLeft,3,1);
resultN('Количество элементов: ',bMax,xRight,3,1);
setNumberOfTests(9);
Pause;
end;


procedure SMin60An59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,43{level3});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел. Найти максимальное количество',0,2);
taskText('подряд идущих минимальных элементов из\ данного набора.',0,4);
(*
*)
end;
2:
begin
taskText('Дано целое число~{N} и\ набор из\ {N}~целых чисел. Найти минимальное количество',0,2);
taskText('подряд идущих максимальных элементов из\ данного набора.',0,4);
(*
*)
end;
end;
(*==*)
case v1 of
1:
begin
a0:=Random(3); b0:=2+Random(2);
n := 1 + Random(10);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMin:=b[1];
nmin:=1;nmax:=1;nmin1:=1;
for i:=2 to n do
  if b[i]<bMin then
    begin
      bMin:=b[i];
      nmin:=1;nmax:=1;nmin1:=1;
    end
  else
    if b[i]=bMin then
      if nmax=1 then nmin:=nmin+1
      else
        begin
          nmax:=1; nmin:=1;
        end
    else
      begin
        nmax:=0;
        if nmin>nmin1 then nmin1:=nmin;
      end;
if nmax=1 then
  if nmin>nmin1 then nmin1:=nmin;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',nmin1,0,3,2);
end;
2:
begin
k := Random(4)+1;

while true do
begin
m := 0;
a0:=Random(3); b0:=2+Random(2);
n := 1 + Random(10);
for i:=1 to n do
  b[i] := a0+Random(b0);
bMin:=b[1];
nmin:=1;nmax:=1;nmin1:=10;
for i:=2 to n do
  if b[i]>bMin then
    begin
      m := 0;
      bMin:=b[i];
      nmin:=1;nmax:=1;nmin1:=10;
    end
  else
    if b[i]=bMin then
    begin
      if nmax=1 then nmin:=nmin+1
      else
        begin
          nmax:=1; nmin:=1;
        end
    end
    else
      begin
        if nmax = 1 then m := m + 1;
        nmax:=0;
        if nmin<nmin1 then nmin1:=nmin;
      end;
if nmax=1 then
  if nmin<nmin1 then nmin1:=nmin;
if (nmin1 = k) and (m > 1) then break;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',nmin1,0,3,2);
end;
end;
setNumberOfTests(8);
Pause;
end;

procedure SMin60An60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,33{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;


begin
Topic2 := 'ПОСЛЕДОВАТЕЛЬНОСТИ';
Topic1 := 'ПОСЛЕДОВАТЕЛЬНОСТИ: ВЛОЖЕННЫЕ ЦИКЛЫ';
Topic3 := 'МИНИМУМЫ И МАКСИМУМЫ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.

