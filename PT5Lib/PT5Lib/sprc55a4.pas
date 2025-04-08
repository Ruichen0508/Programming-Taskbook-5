{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SPrc55A4;

{$MODE Delphi}

interface

procedure SPrc55An1(Name, Key: string);
procedure SPrc55An2(Name, Key: string);
procedure SPrc55An3(Name, Key: string);
procedure SPrc55An4(Name, Key: string);
procedure SPrc55An5(Name, Key: string);
procedure SPrc55An6(Name, Key: string);
procedure SPrc55An7(Name, Key: string);
procedure SPrc55An8(Name, Key: string);
procedure SPrc55An9(Name, Key: string);
procedure SPrc55An10(Name, Key: string);
procedure SPrc55An11(Name, Key: string);
procedure SPrc55An12(Name, Key: string);
procedure SPrc55An13(Name, Key: string);
procedure SPrc55An14(Name, Key: string);
procedure SPrc55An15(Name, Key: string);
procedure SPrc55An16(Name, Key: string);
procedure SPrc55An17(Name, Key: string);
procedure SPrc55An18(Name, Key: string);
procedure SPrc55An19(Name, Key: string);
procedure SPrc55An20(Name, Key: string);
procedure SPrc55An21(Name, Key: string);
procedure SPrc55An22(Name, Key: string);
procedure SPrc55An23(Name, Key: string);
procedure SPrc55An24(Name, Key: string);
procedure SPrc55An25(Name, Key: string);
procedure SPrc55An26(Name, Key: string);
procedure SPrc55An27(Name, Key: string);
procedure SPrc55An28(Name, Key: string);
procedure SPrc55An29(Name, Key: string);
procedure SPrc55An30(Name, Key: string);
procedure SPrc55An31(Name, Key: string);
procedure SPrc55An32(Name, Key: string);
procedure SPrc55An33(Name, Key: string);
procedure SPrc55An34(Name, Key: string);
procedure SPrc55An35(Name, Key: string);
procedure SPrc55An36(Name, Key: string);
procedure SPrc55An37(Name, Key: string);
procedure SPrc55An38(Name, Key: string);
procedure SPrc55An39(Name, Key: string);
procedure SPrc55An40(Name, Key: string);
procedure SPrc55An41(Name, Key: string);
procedure SPrc55An42(Name, Key: string);
procedure SPrc55An43(Name, Key: string);
procedure SPrc55An44(Name, Key: string);
procedure SPrc55An45(Name, Key: string);
procedure SPrc55An46(Name, Key: string);
procedure SPrc55An47(Name, Key: string);
procedure SPrc55An48(Name, Key: string);
procedure SPrc55An49(Name, Key: string);
procedure SPrc55An50(Name, Key: string);
procedure SPrc55An51(Name, Key: string);
procedure SPrc55An52(Name, Key: string);
procedure SPrc55An53(Name, Key: string);
procedure SPrc55An54(Name, Key: string);
procedure SPrc55An55(Name, Key: string);

implementation

uses PT5TaskMaker;

type Mas10 = array [1..30] of integer;
var code,code1,code2,code3 : byte;
    s,s0,s1,s2,s3,s4,s5 : string;
    ar,br,cr,x,x0,x1,x2,x3,x4,x5 : real;
    i,j,k,m,n,n0,n1,n2,n3,n4,n5 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    Topic1,Topic2,Topic3,Author : string;
    a : mas10;

procedure Factors(A : integer; var N : integer; var F : Mas10);
var i : integer;
begin
N := 0;
if A = 1 then begin N := 1; F[1] := 1; exit; end;
while A mod 2 = 0 do
  begin
    inc(N);
    F[N] := 2;
    A := A div 2;
  end;
for i := 1 to A div 2 do
  while A mod (2*i+1) = 0 do
  begin
    inc(N);
    F[N] := 2*i+1;
    A := A div (2*i+1);
  end;
end;

{function otr(x1,y1,x2,y2:real):real;
begin
otr := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;}

function stroka(N : integer) : string;
const c : string = '          (){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
var s: string;
    k,i: integer;
begin
s := '';
k := length(c);
for i:=1 to N do
  s := s + c[Random(k)+1];
stroka := s;
end;
function stroka1(N : integer;C: char) : string;
var s,c0: string;
    k,i: integer;
begin
s := '';
c0 := c+c+c+c+c+c+c+c+c+c+'(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
k := length(c0);
for i:=1 to N do
  s := s + c0[Random(k)+1];
stroka1 := s;
end;
function stroka_(N : integer) : string;
const c : string = '(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
var s: string;
    k,i: integer;
begin
s := '';
k := length(c);
for i:=1 to N do
  s := s + c[Random(k)+1];
stroka_ := s;
end;

{function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;}

{procedure Frac(a,b:integer; var p,q : integer);
var n : integer;
begin
n := NOD(a,b);
p := abs(a div n);
q := abs(b div n);
if a*b<0 then p := -p;
end;}

procedure DecToBinHex(nDec : integer; var sBin,sHex : string);
var n,k: integer;
    s0 :string;
begin
      n := nDec;
      s0 := '';
      while n>1 do
        begin
          s0 := chr(n mod 2 + 48) + s0;
          n := n div 2;
        end;
      sBin := chr(n + 48) + s0;
      n := nDec;
      s0 := '';
      while n>15 do
        begin
          k := n mod 16;
          if k>9 then k := k+7;
          s0 := chr(k + 48) + s0;
          n := n div 16;
        end;
      if n>9 then n:= n+7;
      sHex := chr(n + 48) + s0;
end;

procedure SPrc55An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать процедуру PowerA3({A},\ {B}), вычисляющую третью степень числа~{A}',0,2);
taskText('и\ возвращающую ее в\ переменной~{B} ({A}\ \= входной, {B}\ \= выходной параметр;',0,3);
taskText('оба параметра являются вещественными). С\ помощью этой процедуры',0,4);
taskText('найти третьи степени пяти данных чисел.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  ar := RandomR2(-9.9,9.9); //19.8 * Random - 9.9; //2018
  Str(i,s);
  dataR('A_'+s+' = ',ar,0,i,5);
  resultR('PowerA3(A_'+s+', B_'+s+'):   B_'+s+' =',ar*ar*ar,0,i,8);
end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Описать процедуру PowerA234({A}, {B}, {C}, {D}), вычисляющую вторую, третью',0,1);
taskText('и\ четвертую степень числа~{A} и\ возвращающую эти\ степени соответственно',0,2);
taskText('в\ переменных~{B}, {C} и~{D} ({A}\ \= входной, {B},~{C}, {D}\ \= выходные параметры;',0,3);
taskText('все параметры являются вещественными). С\ помощью этой процедуры найти',0,4);
taskText('вторую, третью и\ четвертую степень пяти данных чисел.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  ar := RandomR2(-9.9,9.9); //19.8 * Random - 9.9; //2018
  Str(i,s);
  dataR('A_'+s+' = ',ar,0,i,5);
  resultR('PowerA234(A_'+s+', B_'+s+', C_'+s+', D_'+s+'):   B_'+s+' =',ar*ar,6,i,6);
  resultR('C_'+s+' =',ar*ar*ar,48,i,8);
  resultR('D_'+s+' =',ar*ar*ar*ar,63,i,8);

end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An3(Name, Key: string);
var v1,v2,v3 : byte;
    s: array[1..3] of char;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Описать процедуру Mean({X}, {Y}, {AMean}, {GMean}), вычисляющую \Iсреднее арифметическое\i',0,1);
taskText('{AMean}~=~({X}+{Y})/2 и\ \Iсреднее геометрическое\i {GMean}~=~\R{X}\*{Y}\r двух положительных',0,2);
taskText('чисел~{X} и~{Y} ({X} и~{Y}\ \= входные, {AMean} и~{GMean}\ \= выходные параметры вещественного',0,3);
taskText('типа). С\ помощью этой процедуры найти среднее арифметическое и\ среднее',0,4);
taskText('геометрическое для\ пар ({A},\;{B}), ({A},\;{C}), ({A},\;{D}), если даны~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(0.1,9.9); //9.98 * Random; //2018
dataR('A = ',x1,center(1,4,8,6),3,4);
s[1] := 'B';
s[2] := 'C';
s[3] := 'D';
for i := 1 to 3 do
begin
x2 := RandomR2(0.1,9.9); //9.98 * Random;
dataR(s[i]+' = ',x2,center(i+1,4,8,6),3,4);
resultR('Mean(A, '+s[i]+', AMean, GMean):   AMean =',(x1+x2)/2,12,i+1,5);
resultR('GMean =',Sqrt(x1*x2),55,i+1,5);
end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Описать процедуру TrianglePS({a}, {P},\ {S}), вычисляющую по стороне~{a}',0,1);
taskText('равностороннего треугольника его периметр~{P}~=~3\*{a} и\ площадь~{S}~=~{a}^2\*\R3\r/4',0,2);
taskText('({a}\ \= входной, {P} и~{S}\ \= выходные параметры; все параметры являются',0,3);
taskText('вещественными). С\ помощью этой процедуры найти периметры и\ площади',0,4);
taskText(' трех равносторонних треугольников с\ данными сторонами.',0,5);
(*
*)
for i := 1 to 3 do
begin
  Str(i,s);
  x := RandomR2(0.1,9.9); //9.98 * Random; //2018
  dataR('a_'+s+' = ',x,0,i+1,4);
  resultR('TrianglePS(a_'+s+', P_'+s+', S_'+s+'):    P_'+s+' =',3*x,14,i+1,6);
  resultR('S_'+s+' =',x*x*sqrt(3)/4,55,i+1,6);
end;
setNumberOfTests(3);
pause;
end;

function dist(x1,y1,x2,y2:real):real;
begin
dist := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;


procedure SPrc55An5(Name, Key: string);
var
  v1, v2, v3: Byte;
  y,y1,y2: real;
  i: integer;
  s,s1,s2: string;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Описать процедуру RectPS({x}_1,\,{y}_1,\,{x}_2,\,{y}_2,\,{P},\,{S}), вычисляющую периметр~{P} и\ площадь~{S}',0,1);
taskText('прямоугольника со\ сторонами, параллельными осям координат, по\ координатам',0,2);
taskText('({x}_1,\,{y}_1), ({x}_2,\,{y}_2) его противоположных вершин ({x}_1,\,{y}_1,\,{x}_2,\,{y}_2\ \= входные,'+
         ' {P} и~{S}\ \=',0,3);
taskText('выходные параметры вещественного типа). С\ помощью этой процедуры найти',0,4);
taskText('периметры и\ площади трех прямоугольников с\ данными противоположными вершинами.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
repeat
x1 := (Random(200) - 99.0)/10;
y1 := (Random(200) - 99.0)/10;
x2 := (Random(200) - 99.0)/10;
y2 := (Random(200) - 99.0)/10;
until (x1<>x2) and (y1<>y2);
Str(2*i-1,s1);
Str(2*i,s2);
Str(i,s);
case i of
1: dataComment('Первый прямоугольник:',5,i+1);
2: dataComment('Второй прямоугольник:',5,i+1);
3: dataComment('Третий прямоугольник:',5,i+1);
end;
dataR2('x_'+s1+', y_'+s1+':',x1,y1,31,i+1,6);
dataR2('x_'+s2+', y_'+s2+':',x2,y2,55,i+1,6);
x := x1;
y := y2;
ar := dist(x1,y1,x,y);
br := dist(x2,y2,x,y);
resultR('RectPS(x_'+s1+', y_'+s1+', x_'+s2+', y_'+s2+', P_'+s+', S_'+s+'):    P_'+s+' = ',2*(ar+br),9,i+1,6);
resultR('S_'+s+' = ',ar*br,59,i+1,6);
end;
setNumberOfTests(3);
Pause;
end;


procedure SPrc55An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Описать процедуру DigitCountSum({K}, {C},\ {S}), находящую количество~{C}',0,1);
taskText('цифр целого положительного числа~{K}, а\ также их\ сумму~{S}',0,2);
taskText('({K}~\= входной, {C} и~{S}\ \= выходные параметры целого типа).',0,3);
taskText('С\ помощью этой процедуры найти количество и\ сумму цифр',0,4);
taskText('для\ каждого из\ пяти данных целых чисел.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(10);
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,5);
  resultN('DigitCountSum(K_'+s+', C_'+s+', S_'+s+'):    C_'+s+' =',n+1,15,i,2);
  resultN('S_'+s+' =',n1,55,i,3);
end;
setNumberOfTests(3);
Pause;
end;


procedure SPrc55An7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Описать процедуру InvDigits({K}), меняющую порядок следования цифр',0,1);
taskText('целого положительного числа~{K} на\ обратный ({K}\ \= параметр целого типа,',0,2);
taskText('являющийся одновременно входным и\ выходным). С\ помощью этой процедуры',0,3);
taskText('поменять порядок следования цифр на\ обратный',0,4);
taskText('для\ каждого из\ пяти данных целых чисел.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    if j = 4 then
      k := Random(3)
    else
      k := Random(10);
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,5);
  n := 0;
  while m <> 0 do
  begin
  n := n * 10 + m mod 10;
  m := m div 10;
  end;
  resultN('InvDigits(K_'+s+'):  K_'+s+' = ',n,25,i,5);
end;
setNumberOfTests(3);
Pause;
end;


procedure SPrc55An8(Name, Key: string);
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
s1 := 'Right';
taskText('Описать процедуру AddRightDigit({D}, {K}), добавляющую к\ целому положительному',0,1);
taskText('числу~{K} справа цифру~{D} ({D}\ \= входной параметр целого типа, лежащий в\ диапазоне\',0,2);
taskText('0\:9, {K}\ \= параметр целого типа, являющийся одновременно входным и\ выходным).',0,3);
taskText('С\ помощью этой процедуры последовательно добавить к\ данному числу~{K} справа',0,4);
taskText('данные цифры~{D}_1 и {D}_2, выводя результат каждого добавления.',0,5);
(*
*)
  n := Random(3)+2;
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(9)+1;
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(m,s);
  Val(s[length(s)],n1,k);
  Val(s[length(s)-1],n2,k);
  Val(Copy(s,1,length(s)-1),n4,k);
  Val(Copy(s,1,length(s)-2),n5,k);
  dataN('K = ',n5,0,2,1);
  dataN('D_1 = ',n2,xLeft,4,1);
  dataN('D_2 = ',n1,xRight,4,1);
  resultN('Add'+s1+'Digit(D_1, K):   K =',n4,25,2,length(s)+1);
  resultN('Add'+s1+'Digit(D_2, K):   K =',m,25,4,length(s)+1);
setNumberOfTests(5);
pause;
end;

procedure SPrc55An9(Name, Key: string);
begin
start(Name,Topic1,Author,Key,36{level1});
s1 := 'Left';
taskText('Описать процедуру AddLeftDigit({D}, {K}), добавляющую к\ целому положительному',0,1);
taskText('числу~{K} слева цифру~{D} ({D}\ \= входной параметр целого типа, лежащий в\ диапазоне\',0,2);
taskText('1\:9, {K}\ \= параметр целого типа, являющийся одновременно входным и\ выходным).',0,3);
taskText('С\ помощью этой процедуры последовательно добавить к\ данному числу~{K} слева',0,4);
taskText('данные цифры~{D}_1 и {D}_2, выводя результат каждого добавления.',0,5);
(*
*)
(*==*)
  n := Random(3)+2;
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(9)+1;
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(m,s);
  Val(s[1],n1,k);
  Val(s[2],n2,k);
  Val(Copy(s,2,100),n4,k);
  Val(Copy(s,3,100),n5,k);
  dataN('K = ',n5,0,2,1);
  dataN('D_1 = ',n2,xLeft,4,1);
  dataN('D_2 = ',n1,xRight,4,1);
  resultN('Add'+s1+'Digit(D_1, K):   K =',n4,25,2,length(s)+1);
  resultN('Add'+s1+'Digit(D_2, K):   K =',m,25,4,length(s)+1);
setNumberOfTests(5);
Pause;
end;



procedure SPrc55An10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать процедуру Swap({X}, {Y}), меняющую содержимое переменных~{X} и~{Y}',0,1);
taskText('({X} и~{Y}\ \= вещественные параметры, являющиеся одновременно входными',0,2);
taskText('и\ выходными). С\ ее\ помощью для\ данных переменных~{A}, {B}, {C},~{D}',0,3);
taskText('последовательно поменять содержимое следующих пар: {A} и~{B}, {C} и~{D}, {B} и~{C}',0,4);
taskText('и\ вывести новые значения~{A},~{B}, {C},~{D}.',0,5);
(*
*)
x1 := 9.98 * Random;
x2 := 9.98 * Random;
x3 := 9.98 * Random;
x4 := 9.98 * Random;
dataR('A = ',x1,center(1,4,8,6),3,4);
dataR('B = ',x2,center(2,4,8,6),3,4);
dataR('C = ',x3,center(3,4,8,6),3,4);
dataR('D = ',x4,center(4,4,8,6),3,4);
resultR('A = ',x2,center(1,4,8,6),3,4);
resultR('B = ',x4,center(2,4,8,6),3,4);
resultR('C = ',x1,center(3,4,8,6),3,4);
resultR('D = ',x3,center(4,4,8,6),3,4);
setNumberOfTests(5);
pause;
end;

procedure SPrc55An11(Name, Key: string);
var v1,v2,v3 : byte;
    min,max : real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Описать процедуру Minmax({X}, {Y}), записывающую в\ переменную~{X} минимальное',0,1);
taskText('из\ значений~{X} и~{Y}, а\ в\ переменную~{Y}\ \= максимальное из\ этих значений',0,2);
taskText('({X} и~{Y}\ \= вещественные параметры, являющиеся одновременно входными',0,3);
taskText('и\ выходными). Используя четыре вызова этой процедуры,',0,4);
taskText('найти минимальное и\ максимальное из\ данных чисел~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
min := 100; max := -100;
for i := 1 to 4 do
  begin
    x := Random * 19.98 - 9.98;
    if x > max then max := x;
    if x < min then min := x;
    dataR(chr(64+i)+' = ',x,Center(i,4,9,10),3,5);
  end;
resultR('Min =',min,xLeft,3,6);
resultR('Max =',max,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure swap(var x,y: real);
var z: real;
begin
z := x;
x := y;
y := z;
end;

procedure SPrc55An12(Name, Key: string);
var v1,v2,v3 : byte;
    i,j,k: integer;
    x: array [1..3] of real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
s1 := 'Inc';
taskText('Описать процедуру SortInc3({A}, {B},~{C}), меняющую содержимое переменных~{A}, {B},~{C}',0,1);
taskText('таким образом, чтобы их\ значения оказались упорядоченными по\ возрастанию',0,2);
taskText('({A},~{B}, {C}\ \= вещественные параметры, являющиеся одновременно входными',0,3);
taskText('и\ выходными). С\ помощью этой процедуры упорядочить по\ возрастанию',0,4);
taskText('два\ данных набора из\ трех чисел: ({A}_1, {B}_1, {C}_1) и ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end
else
begin
s1 := 'Dec';
taskText('Описать процедуру SortDec3({A}, {B},~{C}), меняющую содержимое переменных~{A}, {B},~{C}',0,1);
taskText('таким образом, чтобы их\ значения оказались упорядоченными по\ убыванию',0,2);
taskText('({A},~{B}, {C}\ \= вещественные параметры, являющиеся одновременно входными',0,3);
taskText('и\ выходными). С\ помощью этой процедуры упорядочить по\ убыванию',0,4);
taskText('два\ данных набора из\ трех чисел: ({A}_1, {B}_1, {C}_1) и ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end;
(*==*)
for j := 1 to 2 do
begin
  Str(j,s);
  for i := 1 to 3 do
  begin
    x[i] := Random * 19.98 - 9.98;
    dataR(chr(64+i)+'_'+s+' = ',x[i],center(i,3,10,9),2*j,5);
  end;
  for k := 1 to 2 do
    for i := 1 to 3-k do
      if x[i]>x[i+1] then Swap(x[i],x[i+1]);
  if v1 = 2 then Swap(x[1],x[3]);
  resultR('Sort'+s1+'3(A_'+s+', B_'+s+', C_'+s+'):    A_'+s+' = ',x[1],9,2*j,5);
  resultR('B_'+s+' = ',x[2],48,2*j,5);
  resultR('C_'+s+' = ',x[3],62,2*j,5);
end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An13(Name, Key: string);
var v1,v2,v3 : byte;
    i,j,k: integer;
    x: array [1..3] of real;
    a,b,c: real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
s1 := 'Right';
s2 := '';
taskText('Описать процедуру ShiftRight3({A}, {B},~{C}), выполняющую \Iправый циклический сдвиг\i:',0,1);
taskText('значение~{A} переходит в~{B}, значение~{B}\ \= в~{C}, значение~{C}\ \= в~{A}',0,2);
taskText('({A}, {B},~{C}\ \= вещественные параметры, являющиеся одновременно входными',0,3);
taskText('и\ выходными). С\ помощью этой процедуры выполнить правый циклический сдвиг',0,4);
taskText('для двух данных наборов из\ трех чисел: ({A}_1, {B}_1, {C}_1) и ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end
else
begin
s1 := 'Left';
s2 := ' ';
taskText('Описать процедуру ShiftLeft3({A}, {B},~{C}), выполняющую \Iлевый циклический сдвиг\i:',0,1);
taskText('значение~{A} переходит в~{C}, значение~{C}\ \= в~{B}, значение~{B}\ \= в~{A}',0,2);
taskText('({A}, {B},~{C}\ \= вещественные параметры, являющиеся одновременно входными',0,3);
taskText('и\ выходными). С\ помощью этой процедуры выполнить левый циклический сдвиг',0,4);
taskText('для двух данных наборов из\ трех чисел: ({A}_1, {B}_1, {C}_1) и ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end;
(*==*)
for j := 1 to 2 do
begin
  Str(j,s);
  for i := 1 to 3 do
  begin
    x[i] := Random * 19.98 - 9.98;
    dataR(chr(64+i)+'_'+s+' = ',x[i],center(i,3,10,9),2*j,5);
  end;
  if v1 = 1 then
  begin
    a := x[3]; b := x[1]; c := x[2];
  end
  else
  begin
    a := x[2]; b := x[3]; c := x[1];
  end;
  resultR(s2+'Shift'+s1+'3(A_'+s+', B_'+s+', C_'+s+'):    A_'+s+' = ',a,6,2*j,5);
  resultR('B_'+s+' = ',b,48,2*j,5);
  resultR('C_'+s+' = ',c,62,2*j,5);
end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SPrc55An17(Name, Key: string);
var v1,v2,v3 : byte;
    a: array[1..2] of real;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Описать функцию Sign({X}) целого типа, возвращающую для\ вещественного числа~{X}',0,1);
taskText('следующие значения:',0,2);
taskText('\[\-1,\q если {X}~<~0;\Q         0,\q если {X}~=~0;\Q         1,\q если {X}~>~0.\]',0,3);
taskText('С\ помощью этой функции найти значение выражения Sign({A})\;+\;Sign({B})',0,4);
taskText('для\ данных вещественных чисел~{A} и~{B}.',0,5);
(*
*)
(*==*)
n := 0;
for i := 1 to 2 do
  case Random(3) of
  0: begin a[i] := -integer(1+Random(99))/10; n := n - 1; end;
  1: a[i] := 0;
  2: begin a[i] := (1+Random(99))/10; n := n + 1; end;
  end;
dataR('A = ',a[1],xLeft,3,5);
dataR('B = ',a[2],xRight,3,5);
resultN('Sign(A) + Sign(B) = ',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Описать функцию RootCount({A}, {B},~{C}) целого типа, определяющую',0,1);
taskText('количество корней квадратного уравнения {A}\*{x}^2\;+\;{B}\*{x}\;+\;{C}~=~0',0,2);
taskText('({A},~{B}, {C}\ \= вещественные параметры, {A}~\n~0). С\ ее\ помощью найти количество',0,3);
taskText('корней для\ каждого из\ трех квадратных уравнений с\ данными коэффициентами.',0,4);
taskText('Количество корней определять по\ значению \Iдискриминанта\i: \[{D}~=~{B}^2\;\-\;4\*{A}\*{C}.\]',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  case Random(3) of
  0: begin
       x1 := Integer(Random(10)) - 5;
       x2 := Integer(Random(10)) - 5;
       while x2 = x1 do
         x2 := Integer(Random(10)) - 5;
       Ar := 1 + Random(5);
       Br := -Ar * (x1+x2);
       Cr := Ar*x1*x2;
       n := 2;
     end;
  1: begin
       x1 := Integer(Random(10)) - 5;
       x2 := x1;
       Ar := 1 + Random(5);
       Br := -Ar * (x1+x2);
       Cr := Ar*x1*x2;
       n := 1;
     end;
  2: begin
       Ar := 1 + Random(5);
       Br := Integer(Random(20)) - 10;
       Cr := Integer(Random(20)) - 10;
       while Br*Br-4*Ar*Cr >= 0 do
       begin
         Br := Integer(Random(20)) - 10;
         Cr := Integer(Random(20)) - 10;
       end;
       n := 0;
     end;
  end;
  dataR('A_'+s+' = ',Ar,center(1,3,12,6),i+1,6);
  dataR('B_'+s+' = ',Br,center(2,3,12,6),i+1,6);
  dataR('C_'+s+' = ',Cr,center(3,3,12,6),i+1,6);
  resultN('RootCount(A_'+s+', B_'+s+', C_'+s+') = ',n,0,i+1,1);
end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию CircleS({R}) вещественного типа, находящую площадь круга', 0, 2);
  TaskText('радиуса~{R} ({R}\ \= вещественное). С\ помощью этой функции найти площади', 0, 3);
  TaskText('трех кругов с\ данными радиусами. Площадь круга радиуса~{R} вычисляется', 0, 4);
  TaskText('по\ формуле {S}~=~\p\*{R}^2. В\ качестве значения \p использовать~3.14.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  ar := RandomR2(0.1,9.9); //Random*9.98; //2018
  dataR('R_'+s+' = ',ar,0,i+1,4);
  resultR('CircleS(R_'+s+') = ',ar*ar*3.14,0,i+1,6);
end;
  SetNumberOfTests(3);
Pause;
end;

procedure SPrc55An20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию RingS({R}_1, {R}_2) вещественного типа, находящую площадь кольца,', 0, 1);
  TaskText('заключенного между двумя окружностями с\ общим центром и\ радиусами~{R}_1 и~{R}_2', 0, 2);
  TaskText('({R}_1 и~{R}_2\ \= вещественные, {R}_1~>~{R}_2). С\ ее\ помощью найти площади трех колец,', 0, 3);
  TaskText('для\ которых даны внешние и\ внутренние радиусы. Воспользоваться формулой', 0, 4);
  TaskText('площади круга радиуса~{R}: {S}~=~\p\*{R}^2. В\ качестве значения~\p использовать~3.14.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  Str(2*i-1,s1);
  Str(2*i,s2);
  ar := RandomR2(0.1,9.9); //Random*9.98; //2018
  br := RandomR2(0.1,9.9); //Random*9.98;
  if ar < br then swap(ar,br);
  case i of
  1: datacomment('Первое кольцо:',17,i+1);
  2: datacomment('Второе кольцо:',17,i+1);
  3: datacomment('Третье кольцо:',17,i+1);
  end;
  dataR('R_'+s1+' = ',ar,37,i+1,4);
  dataR('R_'+s2+' = ',br,52,i+1,4);
  resultR('RingS(R_'+s1+', R_'+s2+') = ',(ar*ar-br*br)*3.14,0,i+1,6);
end;
  SetNumberOfTests(3);
Pause;
end;

procedure SPrc55An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Описать функцию TriangleP({a},\ {h}), находящую периметр равнобедренного',0,1);
taskText('треугольника по\ его основанию~{a} и\ высоте~{h}, проведенной к\ основанию ({a} и~{h}\ \=',0,2);
taskText('вещественные). С\ помощью этой функции найти периметры трех треугольников,',0,3);
taskText('для\ которых даны основания и\ высоты. Для\ нахождения боковой стороны~{b}',0,4);
taskText('треугольника использовать \Iтеорему Пифагора\i:\[  {b}^2~=~({a}/2)^2\;+\;{h}^2.\]',0,5);
(*
*)
for i := 1 to 3 do
begin
  Str(i,s);
  x := 1 + Random(9);
  x1 := 1 + Random(9);
  dataR('a_'+s+' = ',x,xLeft,i+1,4);
  dataR('h_'+s+' = ',x1,xRight,i+1,4);
  resultR('TriangleP(a_'+s+', h_'+s+') =',2*sqrt(x*x/4 + x1*x1) + x,0,i+1,6);
end;
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An22(Name, Key: string);
var
  v1, v2, v3: Byte;
function sum(a,b: integer): integer;
var i,n: integer;
begin
n := 0;
for i := a to b do
  n := n + i;
sum := n;
end;
begin
  Start(Name, Topic2, Author, Key, 36{level1}); (*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию SumRange({A}, {B}) целого типа, находящую сумму всех целых чисел', 0, 2);
  TaskText('от~{A} до~{B} включительно ({A}\ и~{B}\ \= целые). Если {A}~>~{B}, то\ функция возвращает~0.', 0, 3);
  TaskText('С\ помощью этой функции найти суммы чисел от~{A} до~{B} и\ от~{B} до~{C},', 0, 4);
  TaskText('если даны числа~{A}, {B},~{C}.', 0, 5);
(*
*)
  n1 := 1 + Random(99);
  n2 := Random(3);
  case curtest of //2012
  2: n2 := 0;
  4: n2 := 1;
  end;
  if n2=0 then
  n2 := n1 + Random(5)
  else
  n2 := 1 + Random(99);
  n3 := 1 + Random(99);
  dataN('A = ',n1,center(1,3,6,10),3,2);
  dataN('B = ',n2,center(2,3,6,10),3,2);
  dataN('C = ',n3,center(3,3,6,10),3,2);
  ResultN('SumRange(A, B) = ', sum(n1,n2), 0, 2, 4);
  ResultN('SumRange(B, C) = ', sum(n2,n3), 0, 4, 4);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An23(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию Calc({A}, {B}, {Op}) вещественного типа, выполняющую над\ ненулевыми', 0, 1);
  TaskText('вещественными числами~{A} и~{B} одну из\ арифметических операций и\ возвращающую', 0, 2);
  TaskText('ее\ результат. Вид операции определяется целым параметром~{Op}: 1\ \= вычитание,', 0, 3);
  TaskText('2\ \= умножение, 3\ \= деление, остальные значения\ \= сложение. С\ помощью\ Calc', 0, 4);
  TaskText('выполнить для\ данных~{A} и~{B} операции, определяемые данными целыми~{N}_1, {N}_2,~{N}_3.', 0, 5);
(*
*)
(*==*)
ar := (Random(200) - 90.0)/10;
br := (Random(200) - 90.0)/10;
if ar = 0 then ar := 0.1;
if br = 0 then br := 0.1;
dataR('A = ',ar,center(1,2,9,10),2,5);
dataR('B = ',br,center(2,2,9,10),2,5);
for i := 1 to 3 do
begin
Str(i,s);
k := Random(5);
case k of
0..3: n := k;
4: n := 4 + Random(6);
end;
dataN('N_'+s+' = ',n,center(i,3,6,13),4,1);
case n of
1: cr := ar-br;
2: cr := ar*br;
3: cr := ar/br;
else cr := ar+br;
end;
resultR('Calc(A, B, N_'+s+') = ',cr,0,i+1,7);
end;
  SetNumberOfTests(7);
Pause;
end;

procedure SPrc55An24(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию Quarter({x}, {y}) целого типа, определяющую номер', 0, 1);
  TaskText('координатной четверти, в\ которой находится точка с\ ненулевыми', 0, 2);
  TaskText('вещественными координатами ({x},~{y}). С\ помощью этой функции найти', 0, 3);
  TaskText('номера координатных четвертей для\ трех точек', 0, 4);
  TaskText('с\ данными ненулевыми координатами.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
    Str(i,s);
    ar := Random * 19.98 - 9.98;
    br := Random * 19.98 - 9.98;
    dataR2('x_'+s+', y_'+s+':',ar,br,0,i+1,6);
    if ar > 0 then
      if br > 0 then n := 1
      else n := 4
    else
      if br > 0 then n := 2
      else n := 3;
    resultN('Quarter(x_'+s+', y_'+s+') = ',n,0,i+1,1);
end;
  SetNumberOfTests(7);
Pause;
end;



procedure SPrc55An25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Описать функцию Even({K}) логического типа, возвращающую \t,',0,2);
taskText('если целый параметр~{K} является четным, и\ \f в\ противном случае.',0,3);
taskText('С\ ее\ помощью найти количество четных чисел в\ наборе из\ 10~целых чисел.',0,4);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  m := Random(99)+1;
  if Random(2) = 0 then m := -m;
  if not Odd(m) then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Описать функцию IsSquare({K}) логического типа, возвращающую \t,',0,2);
taskText('если целый параметр~{K} (>\,0) является квадратом некоторого целого числа,',0,3);
taskText('и\ \f в\ противном случае. С\ ее\ помощью найти количество квадратов',0,4);
taskText('в\ наборе из\ 10~целых положительных чисел.',0,5);
(*
*)
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: m := Random(225)+1;
  1: m := sqr(Random(15)+1);
  end;
  if sqr(int(sqrt(m)))=m then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
pause;
end;

procedure SPrc55An27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать функцию IsPower5({K}) логического типа, возвращающую \t, если',0,2);
taskText('целый параметр~{K} (>\,0) является степенью числа~5, и\ \f в\ противном случае.',0,3);
taskText('С\ ее\ помощью найти количество степеней числа~5',0,4);
taskText('в\ наборе из\ 10~целых положительных чисел.',0,5);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: case Random(3) of
     0: m := Random(100)+1;
     1: m := Random(600)+1;
     2: m := Random(3500)+1;
     end;
  1: begin
     m := 1;
     for j := 1 to Random(6) do
       m := m * 5;
     end;
  end;
  n1 := 1;
  while n1 < m do
    n1 := n1 * 5;
  if n1 = m then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Описать функцию IsPowerN({K}, {N}) логического типа, возвращающую \t, если',0,2);
taskText('целый параметр~{K} (>\,0) является степенью числа~{N} (>\,1), и\ \f в\ противном',0,3);
taskText('случае. Дано число~{N} (>\,1) и\ набор из\ 10~целых положительных чисел. С\ помощью',0,4);
taskText('функции IsPowerN найти количество степеней числа~{N} в\ данном наборе.',0,5);
(*
*)
(*==*)
k := Random(5)+2;
dataN('N = ',k,0,2,1);
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: case Random(3) of
     0: m := Random(100)+1;
     1: m := Random(600)+1;
     2: m := Random(3500)+1;
     end;
  1: begin
     m := 1;
     for j := 1 to Random(6) do
       m := m * k;
     end;
  end;
  n1 := 1;
  while n1 < m do
    n1 := n1 * k;
  if n1 = m then inc(n);
  dataN('',m,center(i,10,3,4),4,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SPrc55An29(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
function Prime(n : integer) : Boolean;
var i : integer;
begin
Prime := True;
for i := 2 to n div 2 do
  if n mod i = 0 then
    begin
      Prime := false;
      exit;
    end;
end;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Описать функцию IsPrime({N}) логического типа, возвращающую \t, если целый',0,1);
taskText('параметр~{N} (>\,1) является простым числом, и\ \f в\ противном случае (число,',0,2);
taskText('большее~1, называется \Iпростым\i, если оно не\ имеет положительных делителей,',0,3);
taskText('кроме~1 и\ самого себя). Дан\ набор из\ 10~целых чисел, больших~1.',0,4);
taskText('С\ помощью функции IsPrime найти количество простых чисел в\ данном наборе.',0,5);
(*
*)
(*==*)
n1 := 0;
for i := 1 to 10 do
begin
  case Random(3) of
  0: n := 2 + Random(15);
  1: n := 2 + Random(100);
  2: n := 2 + Random(999);
  end;
  if Prime(n) then n1 := n1 + 1;
  dataN('',n,center(i,10,3,4),3,3);
end;
resultN('',n1,0,3,2);
setNumberOfTests(5);
Pause;
end;




procedure SPrc55An30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Описать функцию DigitCount({K}) целого типа, находящую количество цифр',0,2);
taskText('целого положительного числа~{K}. Используя эту функцию, найти количество цифр',0,3);
taskText('для\ каждого из\ пяти данных целых положительных чисел.',0,4);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  for j := 1 to n do
    m := m*10 + Random(10);
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,1);
  resultN('DigitCount(K_'+s+') =',n+1,0,i,2);
end;
setNumberOfTests(5);
Pause;
end;


procedure SPrc55An31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Описать функцию DigitN({K}, {N}) целого типа, возвращающую \Um{N}-ю\um цифру целого',0,1);
taskText('положительного числа~{K} (цифры в\ числе нумеруются справа налево).',0,2);
taskText('Если количество цифр в\ числе~{K} меньше~{N}, то\ функция возвращает \-1.',0,3);
taskText('Для\ каждого из\ пяти данных целых положительных чисел~{K}_1, {K}_2,~\.,\ {K}_5',0,4);
taskText('вызвать функцию DigitN с\ параметром~{N}, изменяющимся от~1 до~5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  a[n+1] := m;
  for j := 1 to n do
  begin
    a[n-j+1] := Random(10);
    m := m*10 + a[n-j+1];
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,1);
  resultComment('Значения функции DigitN для K = K_'+s+', N = 1, \., 5: ',5,i);
  for j := 1 to 5 do
  begin
    if j <= n+1 then k := a[j]
                else k := -1;
    Str(j,s1);
    resultN('',k,center(j+11,16,2,2)+4,i,2);
  end;
end;
setNumberOfTests(5);
Pause;
end;




procedure SPrc55An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Описать функцию IsPalindrome({K}), возвращающую \t,',0,1);
taskText('если целый параметр~{K} (>\,0) является \Iпалиндромом\i',0,2);
taskText('(т.\,е. его запись читается одинаково слева направо и\ справа налево),',0,3);
taskText('и\ \f в\ противном случае. С\ ее\ помощью найти количество палиндромов',0,4);
taskText('в\ наборе из\ 10~целых положительных чисел.',0,5);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  case Random(5) of
  4:
     begin
       s1 := Chr(Random(2)+49);
       s2 := Chr(Random(10)+48);
       s := s1 + s2 + Chr(Random(10)+48) + s2 + s1;
     end;
  3:
     begin
       s1 := Chr(Random(9)+49);
       s2 := Chr(Random(10)+48);
       s := s1 + s2 + s2 + s1;
     end;
  2:
     begin
       s2 := Chr(Random(9)+49);
       s := s2 + Chr(Random(10)+48) + s2;
     end;
  1:
     begin
       s2 := Chr(Random(9)+49);
       s := s2 + s2;
     end;
  0:
     begin
       s := Chr(Random(9)+49);
     end;
  end;
  if Random(2) = 0 then
    if length(s) > 1 then
      s[Random(length(s)-1)+2] := Chr(Random(10)+48);
  k := 1;
  for j := 1 to length(s) div 2 do
    if s[j]<>s[length(s)-j+1] then
    begin
      k := 0;
      break;
    end;
  n := n + k;
  Val(s,k,j);
  if Odd(i) then j := xLeft
  else
    j := xRight;
  dataN('',k,j,(i-1) div 2 + 1,5);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SPrc55An33(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,2,0,0,v1,v2,v3);

if v1 = 1 then
begin
s1 := 'D_';
s2 := 'DegToRad(';
n1 := 6;
n2 := 3;
taskText('Описать функцию DegToRad({D}) вещественного типа, находящую величину угла',0,1);
taskText('в\ радианах, если дана его\ величина~{D} в\ градусах ({D}\ \= вещественное число,',0,2);
taskText('0~\l~{D}~<~360). Воспользоваться следующим соотношением: 180\o~=~\p\ радианов.',0,3);
taskText('В\ качестве значения~\p использовать~3.14. С\ помощью функции DegToRad',0,4);
taskText('перевести из\ градусов в\ радианы пять данных углов.',0,5);
(*
*)
end
else
begin
s1 := 'R_';
s2 := 'RadToDeg(';
n1 := 3;
n2 := 6;
taskText('Описать функцию RadToDeg({R}) вещественного типа, находящую величину угла',0,1);
taskText('в\ градусах, если дана его\ величина~{R} в\ радианах ({R}\ \= вещественное число,',0,2);
taskText('0~\l~{R}~<~2\*\p). Воспользоваться следующим соотношением: 180\o~=~\p\ радианов.',0,3);
taskText('В\ качестве значения~\p использовать~3.14. С\ помощью функции RadToDeg',0,4);
taskText('перевести из\ радианов в\ градусы пять данных углов.',0,5);
(*
*)
end;
(*==*)
for i := 1 to 5 do
begin
if v1 =1 then
begin
ar := RandomR2(0.1,360); //Random*360; //2018
br := ar/180*3.14;
end
else
begin
ar := RandomR2(0.1,6.28); //Random*2*3.14;
br := ar/3.14*180;
end;
Str(i,s);
dataR(s1+s+ ' = ',ar,0,i,n1);
resultR(s2+s1+s+') = ',br,0,i,n2);
end;
setNumberOfTests(3);
Pause;
end;


procedure SPrc55An34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Описать функцию Fact({N}) вещественного типа, вычисляющую',0,1);
taskText('значение \Iфакториала\i {N}!~=~1\*2\*\.\*{N} ({N}~>~0\ \= параметр целого типа;',0,2);
taskText('вещественное возвращаемое значение используется для того, чтобы избежать',0,3);
taskText('целочисленного переполнения при\ больших значениях~{N}).',0,4);
taskText('С\ помощью этой функции найти факториалы пяти данных целых чисел.',0,5);
(*
*)
(*==*)
setPrecision(0);
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(30)+1;
    x0 := 1;
    for j := 1 to n do
      x0 := x0 * j;
    dataN('N_'+s+' = ',n,0,i,2);
    resultR('Fact(N_'+s+') =',x0,31,i,14);
{    dataN('',n,center(i,5,2,13),3,2);
    resultR('',x0,center(i,5,14,1),3,14);}
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Описать функцию Fact2({N}) вещественного типа, вычисляющую \Iдвойной факториал\i:',0,1);
taskText('\({N}!!~=~1\*3\*5\*\.\*{N},\q если {N}\ \= нечетное;\| {N}!!~=~2\*4\*6\*\.\*{N},\q если {N}\ \= четное\)',0,2);
taskText('({N}~>~0\ \= параметр целого типа; вещественное возвращаемое значение используется',0,3);
taskText('для того, чтобы избежать целочисленного переполнения при\ больших значениях~{N}).',0,4);
taskText('С\ помощью этой функции найти двойные факториалы пяти данных целых чисел.',0,5);
(*
*)
(*==*)
setPrecision(0);
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(30)+1;
    x0 := n;
    j := n;
    while j>2 do
      begin
        j := j-2;
        x0 := x0*j;
      end;
    dataN('N_'+s+' = ',n,0,i,2);
    resultR('Fact2(N_'+s+') =',x0,30,i,14);

{    dataN('',n,center(i,5,2,13),3,2);
    resultR('',x0,center(i,5,14,1),3,14);}
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Описать функцию Fib({N}) целого типа, вычисляющую {N}-й~элемент',0,1);
taskText('последовательности \Iчисел Фибоначчи\i~{F}_{K}, которая описывается следующими',0,2);
taskText('формулами:\[   {F}_{1}~=~1,\Q   {F}_{2}~=~1,\Q   '+
         '{F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('Используя функцию Fib, найти пять чисел Фибоначчи',0,4);
taskText('с\ данными номерами~{N}_1, {N}_2,~\.,\ {N}_5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(15)+1;
    n0 := 1; n1 := 1;
    for j := 2 to n do
      begin
        n2 := n1;
        n1 := n0+n1;
        n0 := n2;
      end;
    dataN('N_'+s+' = ',n,0,i,2);
    resultN('Fib(N_'+s+') =',n0,32,i,4);
{    dataN('',n,center(i,10,4,2),3,4);
    resultN('',n0,center(i,10,4,2),3,4);}
  end;
setNumberOfTests(5);
Pause;
end;


procedure SPrc55An37(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An39(Name, Key: string);
var v1,v2,v3 : byte;
    p,a,b: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Описать функцию Power1({A}, {B}) вещественного типа, находящую величину {A}^B',0,1);
taskText('по\ формуле {A}^B~=~exp({B}\*ln({A})) (параметры~{A} и~{B}\ \= вещественные).',0,2);
taskText('В\ случае нулевого или\ отрицательного параметра~{A} функция возвращает~0.',0,3);
taskText('С~помощью этой функции найти степени~{A}^P, {B}^P, {C}^P,',0,4);
taskText('если даны числа~{P},~{A}, {B},~{C}.',0,5);
(*
*)
(*==*)
p := 0.5 + 5*random;
dataR('P = ',p,Center(2,3,9,10),2,5);
for i := 1 to 3 do
  begin
    case Random(2) of
    0: repeat a := Random * 5; b := exp(p*ln(a)); until (b>0.5) and (b<100);
    1: if Random(3) <> 0 then begin a := -Random * 5; b := 0; end
       else begin a := 0; b := 0; end;
    end;
    dataR(chr(64+i)+' = ',a,Center(i,3,9,10),4,5);
    resultR('Power1('+chr(64+i)+', P) = ',b,0,i+1,5);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An40(Name, Key: string);
var v1,v2,v3 : byte;
    a, b: real;
    m: Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Описать функцию Power2({A}, {N}) вещественного типа, находящую величину {A}^N',0,1);
taskText('({A}\ \= вещественный, {N}\ \= целый параметр) по\ следующим формулам:',0,2);
taskText('\(  {A}^0 = 1;\|    {A}^N = {A}\*{A}\*\.\*{A}\q  ({N}~сомножителей),\q если {N}~>~0;\|',9,3);
taskText('     {A}^N = 1/({A}\*{A}\*\.\*{A})\q  (|{N}|~сомножителей),\q если {N}~<~0.\)',6,4);
taskText('С\ помощью этой функции найти~{A}^K, {A}^L, {A}^M, если даны числа~{A}, {K}, {L},~{M}.',0,5);
(*
*)
(*==*)
a := RandomR2(-5,5); //10 * random - 5; //2018
dataR('A = ',a,Center(2,3,10,10),2,5);
for i := 1 to 3 do
  begin
    case Random(3) of
      2:
        begin
          m := 0;
          b := 1;
        end;
      0,1:
         repeat
           repeat
             m := Integer(Random(10))-5;
           until m <> 0;
           b := 1;
           for j := 1 to Abs(m) do
             if m > 0 then b := b * a
             else b := b / a;
         until (abs(b) > 0.5) and (abs(b) < 100);
    end;
    dataN(chr(74+i)+' = ',m,Center(i,3,6,10),4,2);
    resultR('Power2(A, '+chr(74+i)+') = ',b,0,i+1,6);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An41(Name, Key: string);
var v1,v2,v3 : byte;
    p,a,b: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Используя функции Power1 и\ Power2 из\ \2 и\ \1, описать функцию',0,1);
taskText('Power3({A},\;{B}) вещественного типа с\ вещественными параметрами, находящую {A}^B',0,2);
taskText('следующим образом: если {B}~имеет нулевую дробную часть, то\ вызывается',0,3);
taskText('Power2({A},\;{N}), где {N} \= переменная \Iцелого типа\i, равная числу\ {B}; иначе вызывается',0,4);
taskText('Power1({A},\;{B}). С\ помощью Power3 найти~{A}^P, {B}^P, {C}^P, если даны числа~{P}, {A}, {B},~{C}.',0,5);
(*
Для\ проверки того, что число~{B} имеет дробную часть, в\ языках \UP и\ \UV
можно использовать условие {B}~=~Int({B}).
*)
(*==*)
case Random(2) of
  0: p := 0.5 + 5*random;
  1: p := Integer(Random(11)-5);
end;
dataR('P = ',p,Center(2,3,10,10),2,5);
for i := 1 to 3 do
  begin
    if Frac(p) <> 0 then
      case Random(2) of
      0: repeat a := Random * 5; b := exp(p*ln(a)); until (b>0.5) and (b<100);
      1: if Random(3) <> 0 then begin a := -Random * 5; b := 0; end
         else begin a := 0; b := 0; end;
      end
    else
      repeat
        a := 10 * Random - 5;
        m := Round(p);
        b := 1;
        for j := 1 to Abs(m) do
          if m > 0 then b := b * a
          else b := b / a;
      until (Abs(b) > 0.5) and (Abs(b) < 100);
    dataR(chr(64+i)+' = ',a,Center(i,3,10,10),4,5);
    resultR('Power3('+chr(64+i)+', P) = ',b,0,i+1,6);
  end;
setNumberOfTests(5);
Pause;
end;


function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;


procedure SPrc55An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Описать функцию Exp1({x}, \e) вещественного типа (параметры~{x}, \e\ \=',0,1);
taskText('вещественные, \e~>~0), находящую приближенное значение функции exp({x}):',0,2);
taskText('\[exp({x}) = 1\;+\;{x}\;+\;{x}^2/(2!)\;+\;{x}^3/(3!)\;+\;\.\;+\;{x}^n/({n}!)\;+\;\.\]',0,3);
taskText('({n}!~=~1\*2\*\.\*{n}). В\ сумме учитывать все слагаемые, большие~\e. С\ помощью Exp1',0,4);
taskText('найти приближенное значение экспоненты для\ данного~{x} при шести данных~\e.',0,5);
(*
*)
x := Random * 4;
setPrecision(7);
dataR('x = ',x,0,2,9);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    x0 := 0; x1 := 1;
    j := 0;
    while x1>x2 do
      begin
       x0 := x0+x1;
       inc(j);
       x1 := x1*x/j;
      end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
Str(exp(x):10:7,s3);
resultComment('Примечание: значение exp(x) равно '+s3,0,4);
setNumberOfTests(3);
pause;
end;

procedure SPrc55An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(9,2,0,0,v1,v2,v3);
case v1 of
1: begin
     s0 := 'Sin';
     s2 := '';
     s3 := 'синуса';
     s4 := 'sin';
taskText('Описать функцию Sin1({x}, \e) вещественного типа (параметры {x}, \e\ \=',0,1);
taskText('вещественные, \e~>~0), находящую приближенное значение функции sin({x}):',0,2);
taskText('\[sin({x})~=~{x}\;\-\;{x}^3/(3!)\;+\;{x}^5/(5!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/((2\*{n}+1)!)\;+\;\.~.\]',0,3);
taskText('В\ сумме учитывать все слагаемые, модуль которых больше~\e. С\ помощью Sin1',0,4);
taskText('найти приближенное значение синуса для\ данного~{x} при шести данных~\e.',0,5);
(*
*)
  end;
2: begin
     s0 := 'Cos';
     s2 := '';
     s3 := 'косинуса';
     s4 := 'cos';
     i := 0;
taskText('Описать функцию Cos1({x}, \e) вещественного типа (параметры~{x}, \e\ \=',0,1);
taskText('вещественные, \e~>~0), находящую приближенное значение функции cos({x}):',0,2);
taskText('\[cos({x})~=~1\;\-\;{x}^2/(2!)\;+\;{x}^4/(4!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n}/((2\*{n})!)\;+\;\.~.\]',0,3);
taskText('В\ сумме учитывать все слагаемые, модуль которых больше~\e. С\ помощью Cos1',0,4);
taskText('найти приближенное значение косинуса для\ данного~{x} при шести данных~\e.',0,5);
(*
*)
  end;
end;
(*==*)
x := Random * 8-4;
setPrecision(7);
dataR('x = ',x,0,2,10);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    case v1 of
    1: begin
         x0 := 0; x1 := x;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j)*(2*j+1));
           end;
       end;
    2: begin
         x0 := 0; x1 := 1;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j-1)*(2*j));
           end;
       end;
    end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
case v1 of
1: Str(sin(x):10:7,s3);
2: Str(cos(x):10:7,s3);
end;
resultComment('Примечание: значение '+s4+'(x) равно '+s3,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
     s0 := 'Ln';
     s2 := '';
     s3 := 'ln(1+x)';
taskText('Описать функцию Ln1({x}, \e) вещественного типа (параметры~{x}, \e\ \=',0,1);
taskText('вещественные, |{x}|\,<\,1, \e\,>\,0), находящую приближенное значение функции ln(1\,+\,{x}):',0,2);
taskText('\[ln(1\,+\,{x})~=~{x}\;\-\;{x}^2/2\;+\;{x}^3/3\;\-\;\.\;+\;(\-1)^n\*{x}^{n+1}/({n}+1)\;+\;\.~.\]',0,3);
taskText('В\ сумме учитывать все слагаемые, модуль которых больше~\e. С\ помощью Ln1',0,4);
taskText('найти приближенное значение ln(1\;+\;{x}) для\ данного~{x} при шести данных~\e.',0,5);
(*
*)
  end;
2: begin
     s0 := 'Arctg';
     s2 := '';
     s3 := 'arctg(x)';
taskText('Описать функцию Arctg1({x}, \e) вещественного типа (параметры~{x}, \e\ \=',0,1);
taskText('вещественные, |{x}|\,<\,1, \e\,>\,0), находящую приближенное значение функции arctg({x}):',0,2);
taskText('\[arctg({x})~=~{x}\;\-\;{x}^3/3\;+\;{x}^5/5\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/(2\*{n}+1)\;+\;\.~.\]',0,3);
taskText('В\ сумме учитывать все слагаемые, модуль которых больше~\e. С\ помощью Arctg1',0,4);
taskText('найти приближенное значение arctg({x}) для\ данного~{x} при шести данных~\e.',0,5);
(*
*)
  end;
end;
(*==*)
x := Random * 1.9-1;
setPrecision(7);
dataR('x = ',x,0,2,10);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
         x0 := 0; x1 := x;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j)*(2*j+1));
           end;
    x0 := 0; x1 := x;
    j := 1;
    case v1 of
    1: while abs(x1)/j>x2 do
         begin
           x0 := x0+x1/j;
           x1 := -x1*x;
           inc(j);
         end;
    2: while abs(x1)/(2*j-1)>x2 do
         begin
           x0 := x0+x1/(2*j-1);
           x1 := -x1*x*x;
           inc(j);
         end;
    end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
case v1 of
1: Str(ln(1+x):10:7,s4);
2: Str(arctan(x):10:7,s4);
end;
resultComment('Примечание: значение '+s3+' равно '+s4,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An45(Name, Key: string);
var v1,v2,v3 : byte;
    a: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Описать функцию Power4({x}, {a}, \e) вещественного типа (параметры~{x}, {a}, \e\ \=',0,1);
taskText('вещественные, |{x}|\,<\,1;\,{a},\,\e\,>\,0), находящую приближенное значение функции (1\,+\,{x})^a:',0,2);
taskText('\[(1\,+\,{x})^a\;=\;1\;+\;{a}\*{x}\;+\;{a}\*({a}\-1)\*{x}^2/(2!)\;'+
         '+\,\.\,+ {a}\*({a}\-1)\*\.\*({a}\-{n}+1)\*{x}^n/({n}!)\;+\,\.~.\]',0,3);
taskText('В\ сумме учитывать все слагаемые, модуль которых больше~\e. С\ помощью Power4',0,4);
taskText('найти приближенное значение (1\,+\,{x})^a для\ данных~{x} и~{a} при шести данных~\e.',0,5);
(*
*)
(*==*)
x := Random * 1.9-1;
a := Random * 7;
setPrecision(7);
dataR('x = ',x,xLeft,2,10);
dataR('a = ',a,xRight,2,9);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    x0 := 0; x1 := 1;
    j := 0;
    while abs(x1)>x2 do
      begin
       x0 := x0+x1;
       inc(j);
       x1 := x1*x*(a-j+1)/j;
      end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
Str(exp(a*ln(1+x)):10:7,s3);
resultComment('Примечание: значение (1+x)^a равно '+s3,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An46(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Описать функцию GCD2({A}, {B}) целого типа, находящую \Iнаибольший общий делитель\i',0,1);
taskText('(НОД, greatest common divisor) двух целых положительных чисел~{A} и~{B}, используя',0,2);
taskText('\Iалгоритм Евклида\i:   \[НОД({A}, {B})~=~НОД({B}, {A}\;mod\;{B}),\q если {B}~\n~0;\Q   НОД({A}, 0)~=~{A},\]',0,3);
taskText('где \<mod\> обозначает операцию взятия остатка от деления. С\ помощью GCD2 найти',0,4);
taskText('наибольшие общие делители пар ({A},\,{B}), ({A},\,{C}), ({A},\,{D}), если даны числа~{A}, {B}, {C},~{D}.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,2);
for i := 1 to 3 do
  begin
    n2 := n[i]*(Random(300)+1);
    dataN(chr(65+i)+' = ',n2,Center(i,3,7,18),4,2);
    resultN('GCD2(A, '+chr(65+i)+') = ',NOD(n1,n2),center(i,3,15,10),3,2);
  end;
setNumberOfTests(5);
Pause;
end;

procedure Frac1(a,b:integer; var p,q : integer);
var n : integer;
begin
n := NOD(a,b);
p := abs(a div n);
q := abs(b div n);
if a*b<0 then p := -p;
end;

procedure SPrc55An47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Используя функцию GCD2 (см.\ \1), описать процедуру Frac1({a},\;{b},\;{p},\;{q}),',0,1);
taskText('преобразующую дробь~{a}/{b} к\ несократимому виду~{p}/{q} (все параметры процедуры\ \=',0,2);
taskText('целого типа, {a} и~{b}\ \= входные, {p} и~{q}\ \= выходные). Знак результирующей дроби~{p}/{q}',0,3);
taskText('приписывается числителю (т.\,е. {q}~>~0). С\ помощью Frac1 найти несократимые',0,4);
taskText('дроби, равные {a}/{b}\;+\;{c}/{d}, {a}/{b}\;+\;{e}/{f}, {a}/{b}\;+\;{g}/{h} '+
         '(числа {a},\,{b},\,{c},\,{d},\,{e},\,{f},\,{g},\,{h} даны).',  0,5);
(*
*)
(*==*)
n1 := -50+Random(100);
repeat
n2 := -50+Random(100);
until n2<>0;
dataN('a = ',n1,Center(1,2,7,4),2,3);
dataN('b = ',n2,Center(2,2,7,4),2,3);
for i := 1 to 3 do
  begin
    n3 := -50+Random(100);
    repeat
    n4 := -50+Random(100);
    until n4<>0;
    dataN(chr(97+2*i)+' = ',n3,Center(2*i-1,6,7,4),4,3);
    dataN(chr(98+2*i)+' = ',n4,Center(2*i,6,7,4),4,3);
    Frac1(n1*n4+n2*n3,n2*n4,n3,n4);
    resultComment('a/b + '+chr(97+2*i)+'/'+chr(98+2*i)+':',10,i+1);
    resultN('Числитель = ',n3,27,i+1,5);
    resultN('Знаменатель = ',n4,50,i+1,4);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An48(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
    r: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('\IНаименьшее общее кратное\i (least common multiple) двух целых положительных',0,1);
taskText('чисел~{A} и~{B} равно {A}\*({B}/НОД({A},\;{B})), где НОД({A},\;{B})\ \= наибольший общий делитель',0,2);
taskText('{A} и~{B}. Используя функцию GCD2 (см.\ \2), описать функцию LCM2({A}, {B})',0,3);
taskText('целого типа, находящую наименьшее общее кратное чисел~{A} и~{B}. С\ помощью LCM2',0,4);
taskText('найти наименьшие общие кратные пар ({A},\,{B}),\,({A},\,{C}),\,({A},\,{D}), если даны числа {A},\,{B},\,{C},\,{D}.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,2);
for i := 1 to 3 do
  begin
    repeat
    n2 := n[i]*(Random(30)+1);
    r := (n1/NOD(n1,n2))*n2;
    until r<=32000;
    dataN(chr(65+i)+' = ',n2,Center(i,3,7,16),4,2);
    resultN('LCM2(A, '+chr(65+i)+') = ',(n1 div NOD(n1,n2))*n2,center(i,3,18,6),3,5);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An49(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
    a,b,c,d: Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Учитывая соотношение НОД({A}, {B}, {C})~=~НОД(НОД({A}, {B}), {C}) и\ используя функцию',0,1);
taskText('GCD2 (см.\ \3), описать функцию GCD3({A}, {B},~{C}) целого типа, находящую',0,2);
taskText('наибольший общий делитель трех целых положительных чисел~{A}, {B},~{C}.',0,3);
taskText('С\ помощью GCD3 найти наибольшие общие делители',0,4);
taskText('троек ({A},\,{B},\,{C}), ({A},\,{C},\,{D}) и~({B},\,{C},\,{D}), если даны числа~{A}, {B}, {C},~{D}.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
a := n[1] * n[2] * (Random(30)+1);
b := n[2] * n[3] * (Random(30)+1);
c := n[1] * n[2] * n[3];
d := n[1] * n[3] * (Random(30)+1);
dataN('A = ',a,0,2,2);
dataN('B = ',b,Center(1,3,7,18),4,2);
dataN('C = ',c,Center(2,3,7,18),4,2);
dataN('D = ',d,Center(3,3,7,18),4,2);
resultN('GCD3(A, B, C) = ',NOD(NOD(a,b),c),center(1,3,19,6),3,2);
resultN('GCD3(A, C, D) = ',NOD(NOD(a,c),d),center(2,3,19,6),3,2);
resultN('GCD3(B, C, D) = ',NOD(NOD(b,c),d),center(3,3,19,6),3,2);
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать процедуру TimeToHMS({T},\ {H}, {M},\ {S}), определяющую по\ времени~{T}',0,1);
taskText('(в\ секундах) содержащееся в\ нем количество часов~{H}, минут~{M} и\ секунд~{S}',0,2);
taskText('({T}\ \= входной, {H},~{M} и~{S}\ \= выходные параметры целого типа).',0,3);
taskText('Используя эту\ процедуру, найти количество часов, минут и\ секунд',0,4);
taskText('для пяти данных отрезков времени~{T}_1, {T}_2,~\.,\ {T}_5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  Str(i,s);
  if Random(2)= 0 then
  n := 1 + Random(12000)
  else
  n := 1 + Random(200);
  dataN('T_'+s+' = ',n,0,i,5);
  n1 := n div 3600;
  n := n mod 3600;
  n2 := n div 60;
  n3 := n mod 60;
  resultN('TimeToHMS(T_'+s+', H_'+s+', M_'+s+', S_'+s+'):   H_'+s+' =', n1,13,i,2);
  resultN('M_'+s+' =', n2,51,i,3);
  resultN('S_'+s+' =', n3,61,i,3);
end;
setNumberOfTests(5);
Pause;
end;


procedure SPrc55An51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать процедуру IncTime({H},\;{M},\;{S},\;{T}), которая увеличивает на\ {T}~секунд время,',0,1);
taskText('заданное в\ часах~{H}, минутах~{M} и\ секундах~{S} ({H}, {M} и~{S}\ \= входные и\ выходные',0,2);
taskText('параметры, {T}\ \= входной параметр; все параметры\ \= целые положительные). Дано',0,3);
taskText('время (в\ часах~{H}, минутах~{M}, секундах~{S}) и\ целое число~{T}. Используя процедуру',0,4);
taskText('IncTime, увеличить данное время на~{T} секунд и\ вывести новые значения~{H}, {M},~{S}.',0,5);
(*
*)
(*==*)
n1 := Random(3);
n2 := Random(60);
n3 := Random(60);
dataN('H = ',n1,center(1,3,6,18),2,1);
dataN('M = ',n2,center(2,3,6,18),2,2);
dataN('S = ',n3,center(3,3,6,18),2,2);
  case Random(3) of
  0: n := 1 + Random(60);
  1: n := 1 + Random(600);
  2: n := 1 + Random(6000);
  end;
  dataN('T = ',n,0,4,2);
  n := n1*3600 + n2*60 + n3 + n;
  n1 := n div 3600;
  n := n mod 3600;
  n2 := n div 60;
  n3 := n mod 60;
resultN('IncTime(H, M, S, T):      H =',n1,13,3,2);
resultN('M =',n2,50,3,3);
resultN('S =',n3,62,3,3);
setNumberOfTests(5);
Pause;
end;

function IsLeapYear(n: Integer): Boolean;
begin
  IsLeapYear := (n mod 4 = 0) and ((n mod 100 <> 0) or (n mod 400 =0));
end;

procedure SPrc55An52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Описать функцию IsLeapYear({Y}) логического типа, которая возвращает \t,',0,1);
taskText('если год~{Y} (целое положительное число) является високосным, и\ \f',0,2);
taskText('в\ противном случае. Вывести значение функции IsLeapYear для\ пяти данных',0,3);
taskText('значений параметра~{Y}. \IВисокосным\i считается год, делящийся на~4,',0,4);
taskText('за\ исключением тех годов, которые делятся на~100 и\ не\ делятся на~400.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  Str(i,s);
  n := 1 + Random(25);
  n := n*100;
  if Random(3)=0 then n := n+100
  else n := n+Random(99)+1;
  dataN('Y_'+s+' = ',n,0,i,4);
  resultB('IsLeapYear(Y_'+s+') = ',IsLeapYear(n),0,i);
end;
setNumberOfTests(9);
Pause;
end;

procedure SPrc55An53(Name, Key: string);
var v1,v2,v3 : byte;
    n, k: Integer;
    m: array[1..3] of Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Используя функцию IsLeapYear из\ задания \1, описать функцию',0,2);
taskText('MonthDays({M}, {Y}) целого типа, которая возвращает количество дней',0,3);
taskText('для\ {M}-го месяца года~{Y} (1~\l~{M}~\l~12, {Y}~>~0\ \= целые числа).',0,4);
taskText('Вывести значение функции MonthDays для\ данного года~{Y} и\ месяцев~{M}_1, {M}_2,~{M}_3.',0,5);
(*
*)
(*==*)
n := 1 + Random(25);
n := n*100;
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
dataN('Y = ',n,0,2,4);
m[1] := 20;
m[2] := 30;
m[3] := 40;
for i := 1 to 3 do
begin
  repeat
  case Random(3) of
    0: m[i] := 2;
    1,2 : m[i] := 1 + Random(12);
  end;
  until (m[1]<>m[2]) and (m[2] <> m[3]) and (m[3] <> m[1]);
  case m[i] of
  1, 3, 5, 7, 8, 10, 12: k := 31;
  4, 6, 9, 11: k := 30;
  2: if IsLeapYear(n) then k := 29
     else k := 28;
  end;
  dataN('M_'+chr(ord('0')+i)+' = ',m[i],center(i,3,6,10),4,2);
  resultN('MonthDays(M_'+chr(ord('0')+i)+', Y) = ',k,0,i+1,2);
end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An54(Name, Key: string);
var v1,v2,v3 : byte;
    m1, m2: Integer;
    day : array[0..11] of integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(4,2,0,0,v1,v2,v3);
day[0] := 31; day[1] := 28; day[2] := 31; day[3] := 30;
day[4] := 31; day[5] := 30; day[6] := 31; day[7] := 31;
day[8] := 30; day[9] := 31; day[10] := 30; day[11] := 31;
case v1 of
  1:
    begin
    s1 := 'PrevDate';
taskText('Используя функцию MonthDays из\ задания \1, описать процедуру',0,1);
taskText('PrevDate({D}, {M}, {Y}), которая по\ информации о\ правильной дате, включающей день~{D},',0,2);
taskText('номер месяца~{M} и\ год~{Y}, определяет предыдущую дату (параметры целого типа',0,3);
taskText('{D}, {M},~{Y} являются одновременно входными и\ выходными). Применить процедуру',0,4);
taskText('PrevDate к\ трем исходным датам и\ вывести полученные значения предыдущих\ дат.',0,5);
(*
*)
    end;
  2:
    begin
    s1 := 'NextDate';
taskText('Используя функцию MonthDays из\ задания \2, описать процедуру',0,1);
taskText('NextDate({D}, {M}, {Y}), которая по\ информации о\ правильной дате, включающей день~{D},',0,2);
taskText('номер месяца~{M} и\ год~{Y}, определяет следующую дату (параметры целого типа',0,3);
taskText('{D}, {M},~{Y} являются одновременно входными и\ выходными). Применить процедуру',0,4);
taskText('NextDate к\ трем исходным датам и\ вывести полученные значения следующих\ дат.',0,5);
(*
*)
    end;
end;
(*==*)
for i := 1 to 3 do
begin
n := 1 + Random(25);
n := n*100;
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
m2 := n;
if IsLeapYear(n) then day[1] := 29
else day[1] := 28;
case Random(3) of
  0: if v1 = 2 then m := 1
     else m := 2;
  1,2 : m := Random(12);
end;
m1 := m;
k := Random(3);
if v1 = 2 then
case k of
0 :   begin
        n1 := day[m];
        n2 := 1;
        m1 := (m+1)mod 12;
        if m1 < m then inc(m2);
      end;
1,2 : begin
      if (k=2) and (m<>1) then n1 := day[m]-1
             else n1 := 1 + Random(day[m]-1);
      n2 := n1+1;
    end;
end
else
case k of
0 : begin
      n1 := 1;
      m1 := (m+11) mod 12;
      if m1 > m then dec(m2);
      n2 := day[m1];
    end;
1,2 : begin
      n1 := 2 + Random(day[m]-1);
      n2 := n1-1;
    end;
end;
c := Chr(Ord('0')+i);
dataN('D_'+c+' = ',n1,center(1,3,2,10),i+1,2);
dataN('M_'+c+' = ',m+1,center(2,3,2,10),i+1,2);
dataN('Y_'+c+' = ',n,center(3,3,2,10),i+1,4);
resultComment(s1+'(D_'+c+', M_'+c+', Y_'+c+'):',10,i+1);
resultN('D_'+c+' = ',n2,center(3,5,2,10),i+1,2);
resultN('M_'+c+' = ',m1+1,center(4,5,2,10),i+1,2);
resultN('Y_'+c+' = ',m2,center(5,5,2,10),i+1,4);
end;
setNumberOfTests(5);
Pause;
end;

procedure SPrc55An55(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




begin
Topic1 := 'ПРОЦЕДУРЫ С ЧИСЛОВЫМИ ПАРАМЕТРАМИ';
Topic2 := 'ФУНКЦИИ С ЧИСЛОВЫМИ ПАРАМЕТРАМИ';
Topic3 := 'ДОПОЛНИТЕЛЬНЫЕ ЗАДАНИЯ НА ПРОЦЕДУРЫ И ФУНКЦИИ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.
