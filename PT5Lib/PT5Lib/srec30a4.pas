{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit SRec30A4;

interface

procedure SRec30An1(Name, Key: string);
procedure SRec30An2(Name, Key: string);
procedure SRec30An3(Name, Key: string);
procedure SRec30An4(Name, Key: string);
procedure SRec30An5(Name, Key: string);
procedure SRec30An6(Name, Key: string);
procedure SRec30An7(Name, Key: string);
procedure SRec30An8(Name, Key: string);
procedure SRec30An9(Name, Key: string);
procedure SRec30An10(Name, Key: string);
procedure SRec30An11(Name, Key: string);
procedure SRec30An12(Name, Key: string);
procedure SRec30An13(Name, Key: string);
procedure SRec30An14(Name, Key: string);
procedure SRec30An15(Name, Key: string);
procedure SRec30An16(Name, Key: string);
procedure SRec30An17(Name, Key: string);
procedure SRec30An18(Name, Key: string);
procedure SRec30An19(Name, Key: string);
procedure SRec30An20(Name, Key: string);
procedure SRec30An21(Name, Key: string);
procedure SRec30An22(Name, Key: string);
procedure SRec30An23(Name, Key: string);
procedure SRec30An24(Name, Key: string);
procedure SRec30An25(Name, Key: string);
procedure SRec30An26(Name, Key: string);
procedure SRec30An27(Name, Key: string);
procedure SRec30An28(Name, Key: string);
procedure SRec30An29(Name, Key: string);
procedure SRec30An30(Name, Key: string);

implementation

uses PT5TaskMaker;

var code,code1,code2,code3 : byte;
    s : string;
    x,x0,x1,x2,x3,x4,x5 : real;
    m,n,n0,n1,n2,n3,n4,n5 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    b : Boolean;
    count : integer;
    Topic,Topic1,Topic2,Topic3,Author : string;
    s0,s1,s2,s3,s4,s5,s6 : shortstring;
    k : integer;

function tst: string;
begin
  if CurrentLanguage and lg1C <> 0 then 
    tst := '.txt'
  else
    tst := '.tst';
end;

function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;

function stroka(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
var s: string;
    k,i: integer;
begin
s := '';
k := length(c);
for i:=1 to N do
  s := s + c[Random(k)+1];
stroka := s;
end;



function SqrtK(x:real; k,n:integer):real;
var y,yk : real;
    i : integer;
begin
if n=0 then SqrtK := 1
else
  begin
    y := SqrtK(x,k,n-1);
    yk := y;
    for i := 2 to k-1 do yk := yk*y;
    SqrtK := y+(x/yk-y)/k;
  end;
end;

function FileName(len : integer) : string;
const c : string = '0123456789abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to len do
   s := s + c[Random(36)+1];
FileName := s;
end;




procedure SRec30An1(Name, Key: string);
var i,j,k: integer;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
taskText('Описать рекурсивную функцию Fact({N}) вещественного типа,',0,2);
taskText('вычисляющую значение \Iфакториала\i\[ {N}!~=~1\*2\*\.\*{N}\]',0,3);
taskText('({N}~>~0\ \= параметр целого типа). С\ помощью этой функции',0,4);
taskText('вычислить факториалы пяти данных чисел.',0,5);
(*
*)
setPrecision(1);
for i := 1 to 5 do
  begin
    c := chr(96+i);
    n := Random(18)+1;
    x0 := 1;
    for j := 1 to n do
      x0 := x0 * j;
    dataN(c+' = ',n,0,i,2);
    resultR('Fact('+c+') = ',x0,28,i,18);
  end;
setNumberOfTests(3);
pause;
end;

procedure SRec30An2(Name, Key: string);
var i,j,k: integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию Fact2({N}) вещественного типа,',0,1);
taskText('вычисляющую значение \Iдвойного факториала\i\[ {N}!!~=~{N}\*({N}\-2)\*({N}\-4)\*\.\]',0,2);
taskText('({N}~>~0\ \= параметр целого типа; последний сомножитель в\ произведении',0,3);
taskText('равен~2, если {N}\ \= четное число, и~1, если {N}\ \= нечетное).',0,4);
taskText('С\ помощью этой функции вычислить двойные факториалы пяти данных чисел.',0,5);
(*
*)
(*==*)
setPrecision(1);
for i := 1 to 5 do
  begin
    c := chr(96+i);
    n := Random(18)+1;
    x1 := n;
    j := n;
    while j>2 do
      begin
        j := j-2;
        x1 := x1*j;
      end;
    dataN(c+' = ',n,0,i,2);
    resultR('Fact2('+c+') = ',x1,27,i,11);
  end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30An3(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию PowerN({X},\;{N}) вещественного типа,',0,1);
taskText('находящую значение {N}-й\ степени числа~{X} по\ формулам: \[{X}^{\,0}~=~1,\|',0,2);
taskText('{X}^{\,N}~=~({X}^{\,N/2})^{2} при \Iчетных\i {N}~>~0,\Q  '+
         '{X}^{\,N}~=~{X}\*{X}^{\,N\-1} при \Iнечетных\i {N}~>~0,\|',0,3);
taskText('{X}^{\,N}~=~1/{X}^{\,\-N} при {N}~<~0\] ({X}~\n~0\ \= вещественное число, {N}\ \= целое;',9,4);
taskText('в\ формуле для четных~{N} должна использоваться операция \Iцелочисленного деления\i).',0,5);
taskText('С\ помощью этой функции найти значения {X}^{\,N} для данного~{X}',0,0);
taskText('при\ пяти данных значениях~{N}.',0,0);
(*
*)
(*==*)
x := RandomR2(-25,25); //Random * 50-25; //2018
dataR('X = ',x,38,2,6);
setPrecision(0);
n := -6;

for i := 1 to 5 do
  begin
    n :=n + Random(4)+1;
    x0 := 1;
    for j := 1 to abs(n) do
      x0 := x0*x;
    if n<0 then x0 := 1/x0;
    dataN('N_'+chr(i+48)+' = ',n,center(i,5,7,5),4,2);
    resultR('PowerN(X, N_'+chr(i+48)+') =',x0,0,i,15);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SRec30An4(Name, Key: string);
var cnt,i:integer;
    n: array [1..5] of integer;
    v1, v2, v3: Byte;
function  Fib(n:integer):integer;
begin
inc(cnt);
if n in [1,2] then Fib := 1
else
  Fib := Fib(n-2)+Fib(n-1);
end;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Описать рекурсивную функцию Fib1({N}) целого типа, вычисляющую',0,1);
taskText('\Um{N}-й\um элемент последовательности \Iчисел Фибоначчи\i ({N}\ \= целое число):',0,2);
taskText('\[ {F}_{1}~=~{F}_{2}~=~1,\Q   {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('С\ помощью этой функции найти пять чисел Фибоначчи с\ данными номерами,',0,4);
taskText('и\ вывести эти\ числа вместе с\ количеством рекурсивных вызовов функции',0,5);
taskText('Fib1, потребовавшихся для\ их\ нахождения.',0,0);
(*
*)
end;
2: begin
taskText('Описать рекурсивную функцию Fib2({N}) целого типа, вычисляющую',0,1);
taskText('\Um{N}-й\um элемент последовательности \Iчисел Фибоначчи\i ({N}\ \= целое число):',0,2);
taskText('\[ {F}_{1}~=~{F}_{2}~=~1,\Q   {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('Считать, что\ номер~{N} не\ превосходит~20. Для\ уменьшения количества рекурсивных',0,4);
taskText('вызовов по\ сравнению с\ функцией Fib1 (см.\ задание \1) создать',0,5);
taskText('вспомогательный массив для\ хранения \Iуже\ вычисленных\i чисел Фибоначчи',0,0);
taskText('и\ обращаться к\ нему при\ выполнении функции Fib2. С\ помощью функции Fib2',0,0);
taskText('найти пять чисел Фибоначчи с\ данными номерами.',0,0);
(*
*)
end;
end;
repeat
n[1] := 1+Random(5);
for i := 2 to 5 do
  n[i] := n[i-1]+1+Random(5);
until n[5]<=16;
for i := 1 to 5 do
begin
  cnt := 0;
  dataN('N_'+chr(I+48)+' = ',n[i],center(i,5,7,6),3,1);
  str(n[i]:2,s);
  case v1 of
  1: begin
       resultN('Fib1(N_'+chr(I+48)+') = ',Fib(n[i]),xLeft,i,3);
       resultN('Количество вызовов: ',cnt,xRight,i,4);
     end;
  2: begin
       resultN('Fib2(N_'+chr(I+48)+') = ',Fib(n[i]),0,i,3);
     end;
  end;
end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30An5(Name, Key: string);
var i,j,k : integer;
    m: array [1..5] of integer;
    cnt:integer;
function C_(m,n:integer):integer;
begin
cnt:= cnt+1;
if (m=0)or(m=n) then C_ := 1
else C_ := C_(m,n-1)+C_(m-1,n-1);
end;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию Combin1({N},\;{K}) целого типа, находящую {C}({N},\,{K})\ \=',0,1);
taskText('\Iчисло сочетаний\i из\ {N}~элементов по~{K}\ \= с\ помощью рекуррентного соотношения:',0,2);
taskText('\[{C}({N},\,0)~=~C({N},\,{N})~=~1,\|   {C}({N},\,{K})~=~{C}({N}\,\-\,1,\,{K})\;+\;'+
         '{C}({N}\,\-\,1,\,{K}\,\-\,1)\q  при 0~<~{K}~<~{N}.\]',0,3);
taskText('Параметры функции\ \= целые числа; {N}~>~0, 0~\l~{K}~\l~{N}. Дано число~{N}',0,4);
taskText('и\ пять различных значений~{K}. Вывести числа~{C}({N},\,{K}) вместе с\ количеством',0,5);
taskText('рекурсивных вызовов функции Combin1, потребовавшихся для\ их\ нахождения.',0,0);
(*
*)
(*==*)
n := Random(11)+4;
dataN('N = ',n,0,2,1);
str(n,s1);
if n=4 then
  for i := 1 to 5 do m[i] := i-1
else
repeat
m[1] := Random(5);
for i := 2 to 5 do
  m[i] := m[i-1]+1+Random(5);
until m[5]<=n;
for i := 1 to 5 do
  begin
    cnt := 0;
    dataN('K_'+chr(I+48)+' = ',m[i],center(i,5,7,6),4,1);
    str(m[i]:length(s1),s2);
    resultN('Combin1(N, K_'+chr(I+48)+') = ',C_(m[i],n),xLeft,i,4);
    resultN('Количество вызовов: ',cnt,xRight,i,4);
  end;
setNumberOfTests(3);
Pause;
end;



procedure SRec30An6(Name, Key: string);
var i,j,k : integer;
    m: array [1..5] of integer;
    cnt:integer;
function C_(m,n:integer):integer;
begin
cnt:= cnt+1;
if (m=0) then C_ := 1
else C_ := C_(m-1,n)*(n-m+1) div m;
end;

begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию Combin2({N},\;{K}) целого типа, находящую {C}({N},\,{K})\ \=',0,1);
taskText('\Iчисло сочетаний\i из\ {N}~элементов по~{K}\ \= с\ помощью рекуррентного соотношения:',0,2);
taskText('\[{C}({N},\,0)~=~C({N},\,{N})~=~1,\|   {C}({N},\,{K})~=~{C}({N}\,\-\,1,\,{K})\;+\;'+
         '{C}({N}\,\-\,1,\,{K}\,\-\,1)\q  при 0~<~{K}~<~{N}.\]',0,3);
taskText('Параметры функции\ \= целые числа; {N}~>~0, 0~\l~{K}~\l~{N}. Считать, что\ параметр~{N}',0,4);
taskText('не\ превосходит~20. Для\ уменьшения количества рекурсивных вызовов по\ сравнению',0,5);
taskText('с\ функцией Combin1 (см.\ задание \1) описать вспомогательный двумерный',0,0);
taskText('массив для\ хранения \Iуже\ вычисленных\i чисел {C}({N},\,{K}) и\ обращаться к\ нему',0,0);
taskText('при\ выполнении функции Combin2. С\ помощью функции Combin2 найти числа {C}({N},\,{K})',0,0);
taskText('для\ данного значения~{N} и\ пяти различных значений~{K}.',0,0);
(*
*)
(*==*)
n := Random(11)+4;
dataN('N = ',n,0,2,1);
str(n,s1);
if n=4 then
  for i := 1 to 5 do m[i] := i-1
else
repeat
m[1] := Random(5);
for i := 2 to 5 do
  m[i] := m[i-1]+1+Random(5);
until m[5]<=n;
for i := 1 to 5 do
  begin
    cnt := 0;
    dataN('K_'+chr(I+48)+' = ',m[i],center(i,5,7,6),4,1);
    str(m[i]:length(s1),s2);
    resultN('Combin2(N, K_'+chr(I+48)+') = ',C_(m[i],n),0,i,4);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SRec30An7(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию RootK({X},\;{K},\;{N}) вещественного типа, находящую',0,1);
taskText('приближенное значение корня \Um{K}-й\um\ степени из\ числа~{X} по\ формуле:',0,2);
taskText('\[{Y}_{0}~=~1,\Q  {Y}_{N+1}~=~{Y}_{N}\;\-\;({Y}_{N}\;\-\;{X}/({Y}_{N})^{K\-1})/{K},\]',0,3);
taskText('где {Y}_{N} обозначает RootK({X},\;{K},\;{N}) при\ фиксированных~{X} и~{K}.',0,4);
taskText('Параметры функции: {X}\ (>\,0)\ \= вещественное число, {K}\ (>\,1) и~{N}\ (>\,0)\ \= целые.',0,5);
taskText('С\ помощью функции RootK найти для данного числа~{X} приближенные значения',0,0);
taskText('его\ корня \Um{K}-й\um\ степени при\ шести данных значениях~{N}.',0,0);
(*
*)
(*==*)
x := RandomR2(0.1,50); //Random * 50; //2018
k := Random(6)+2;
dataR('X = ',x,xLeft,2,5);
dataN('K = ',k,xRight,2,1);
setPrecision(8);
n := 0;

for i := 1 to 6 do
  begin
    n :=n + Random(3)+1;
    x0 := sqrtK(x,k,n);
    dataN('N_'+chr(i+48)+' = ',n,center(i,6,7,6),4,1);
    resultR('',x0,center(i,6,11,2),2,11);
  end;
Str(exp(ln(x)/k):10:8,s0);
Str(k,s1);
Str(x:0:2,s2);
resultComment('Примечание: значение корня '+s1+'-й степени из '+s2+' равно '+s0,0,4);
setNumberOfTests(3);
Pause;
end;


procedure SRec30An8(Name, Key: string);
var i,j,k : integer;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию GCD({A},\;{B}) целого типа, находящую \Iнаибольший общий\i',0,1);
taskText('\Iделитель\i (НОД, greatest common divisor) двух целых положительных чисел~{A} и~{B},',0,2);
taskText('используя \Iалгоритм Евклида\i: \[НОД({A},\,{B})~=~НОД({B}, {A}\;mod\;{B}),\q {B}~\n~0;\Q НОД({A},\,0)~=~{A},\]',0,3);
taskText('где \<mod\> обозначает операцию взятия остатка от деления. С\ помощью этой',0,4);
taskText('функции найти НОД({A},\,{B}), НОД({A},\,{C}), НОД({A},\,{D}), если даны числа~{A}, {B}, {C},~{D}.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,4);
for i := 1 to 3 do
  begin
    n2 := n[i]*(Random(300)+1);
    dataN(chr(65+i)+' = ',n2,Center(i,3,8,16),4,4);
    resultN('GCD(A, '+chr(65+i)+') = ',NOD(n1,n2),center(i,3,18,6),3,3);
  end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30An9(Name, Key: string);
var i,j,k : integer;
function dsum(k: integer):integer;
begin
if k < 0 then dsum := dsum(-k)
else
  if (k>=0) and (k<=9) then dsum := k
  else
    dsum := k mod 10 + dsum(k div 10);
end;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
getVariant(4,0,0,0,code,code1,code2);
taskText('Описать рекурсивную функцию DigitSum({K}) целого типа, которая находит',0,2);
taskText('сумму цифр целого числа~{K}, не\ используя оператор цикла.',0,3);
taskText('С\ помощью этой функции найти суммы цифр для пяти данных целых чисел.',  0,4);
(*
*)
for i := 1 to 5 do
  begin
    c := chr(48+i);
    n := Random(30000)+1;
    if Random(2) = 0 then n := -n;
    dataN('K_'+c+' = ',n,0,i,6);
    resultN('DigitSum(K_'+c+') = ',dsum(n),0,i,2);
  end;
setNumberOfTests(3);
pause;
end;

function Digits(s : string) : integer;
function Digits0(i: integer):integer;
var
  j: integer;
begin
if i > length(s) then Digits0 := 0
else
  begin
  if s[i] in ['0'..'9'] then j := 1
  else j := 0;
  Digits0 := j + Digits0(i+1);
  end;
end;
begin
  Digits := Digits0(1);
end;
procedure SRec30An10(Name, Key: string);
var i,j,k,n : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
getVariant(4,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Описать рекурсивную функцию MaxElem({A}, {N}) целого типа, которая находит',0,2);
taskText('максимальный элемент целочисленного массива~{A} размера~{N} (1~\l~{N}~\l~10),',0,3);
taskText('не\ используя оператор цикла. С\ помощью этой функции найти',  0,4);
taskText('максимальные элементы массивов~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
(*
*)
  end;
2: begin
taskText('Описать рекурсивную функцию DigitCount({S}) целого типа,',0,2);
taskText('которая находит количество цифр в\ строке~{S}, не\ используя оператор цикла.',0,3);
taskText('С\ помощью этой функции найти количество цифр в\ каждой из пяти данных строк.',0,4);
(*
*)
end;
end;
(*==*)
case Code of
1:
begin
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    k := -100;
    for j := 1 to n do
      begin
        m := 10 + Random(90);
        dataN('',m,Center(j+2,12,2,4),1+i,2);
        if k<m then k := m;
      end;
    resultN('MaxElem('+c+', N_'+c+') = ',k,0,1+i,3);
   end;
end;
2:
begin
for i := 1 to 5 do
  begin
  c := chr(48+i);
  s := Stroka(Random(20)+10);
  dataS('S_'+c+' = ',s,27,i);
  resultN('DigitCount(S_'+c+') = ',Digits(s),0,i,1);
  end;
end;
end;
setNumberOfTests(3);
Pause;
end;
procedure SRec30An11(Name, Key: string);
var i,j,k : integer;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Описать рекурсивную функцию Palindrome({S}) логического типа,',0,1);
taskText('возвращающую \t, если строка~{S} является \Iпалиндромом\i (т.\,е. читается',0,2);
taskText('одинаково слева направо и\ справа налево), и\ \f в\ противном случае.',0,3);
taskText('Оператор цикла в\ теле функции не\ использовать.',0,4);
taskText('Вывести значения функции Palindrome для\ пяти данных строк.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
  c := chr(48+i);
      s := Stroka(Random(10)+5);
      for j := length(s)-Random(2) downto 1 do
        s := s + s[j];
      b:= true;
      if Random(2)=0 then
        begin
          inc(s[random(length(s) div 2)+1]);
          b := false;
        end;
  dataS('S_'+c+' = ',s,27,i);
  resultB('Palindrome(S_'+c+') = ',b,0,i);
  end;
setNumberOfTests(9);
Pause;
end;


procedure SRec30An12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 83{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


    



function Vir1 : string;
var z:char;
begin
inc(count);
if (count>5)or(Random(4)<1) then Vir1 := chr(48+Random(10))
else
  begin
  case Random(3) of
  0: z := '+';
  1: z := '-';
  2: z := '*';
  end;
  Vir1 := '('+Vir1+z+Vir1+')';
  end;
end;
function Calc1 : integer;
var z,z1:char; i1,i2 : integer;
begin
if s[count] in ['0'..'9'] then begin Calc1 := ord(s[count])-48; inc(count);end
else
  begin
    inc(count);
    i1 := Calc1;
    z := s[count]; inc(count);
    i2 := Calc1;
    inc(count);
    case z of
    '+' : Calc1 := i1+i2;
    '-' : Calc1 := i1-i2;
    '*' : Calc1 := i1*i2;
    end;
  end;
end;
function Vir9 : string;
var z:char;
begin
inc(count);
if (count>6)or(Random(4)<2) then Vir9 := chr(48+Random(10))
else
  begin
  case Random(2) of
  0: z := 'M';
  1: z := 'm';
  end;
  Vir9 := z+'('+Vir9+','+Vir9+')';
  end;
end;
function Calc9 : integer;
var z,z1:char; i1,i2 : integer;
begin
if s[count] in ['0'..'9'] then begin Calc9 := ord(s[count])-48; inc(count);end
else
  begin
    z := s[count];
    inc(count);
    inc(count);
    i1 := Calc9;
    inc(count);
    i2 := Calc9;
    inc(count);
    case z of
    'M' : if i1 > i2 then Calc9 := i1 else Calc9 := i2;
    'm' : if i1 < i2 then Calc9 := i1 else Calc9 := i2;
    end;
  end;
end;



function Check1 : Boolean;
var z,z1:char; i1,i2 : integer;
begin
if count>length(s) then begin Check1 := false; exit; end;
if s[count] in ['0'..'9'] then begin Check1 := true; inc(count);end
else
  begin
    if s[count] <> '(' then begin Check1 := False; exit; end;
    inc(count);
    if not Check1 then begin Check1 := False; exit; end;
    if (count>length(s)) or (not (s[count] in ['+','-','*'])) then begin Check1 := False; exit; end;
    inc(count);
    if not Check1 then begin Check1 := False; exit; end;
    if (count>length(s)) or (s[count] <> ')') then begin Check1 := False; exit; end;
    inc(count);
    Check1 := true;
  end;
end;
function Check1a : integer;
var z,z1:char; i : integer;
begin
if count>length(s) then begin Check1a := count; exit; end;
if s[count] in ['0'..'9'] then begin Check1a := 0; inc(count);end
else
  begin
    if s[count] <> '(' then begin Check1a := count; exit; end;
    inc(count);
    i := Check1a;
    if i<>0 then begin Check1a := i; exit; end;
    if (count>length(s)) or (not (s[count] in ['+','-','*'])) then begin Check1a := count; exit; end;
    inc(count);
    i := Check1a;
    if i<>0 then begin Check1a := i; exit; end;
    if (count>length(s)) or (s[count] <> ')') then begin Check1a := count; exit; end;
    inc(count);
    Check1a := 0;
  end;
end;
function Vir2 : string;
var i : integer; s : string;
begin
s := chr(48+Random(10));
for i := 1 to Random(7) do
  begin
  case Random(2) of
  0: s := s + '+';
  1: s := s + '-';
  end;
  s := s + chr(48+Random(10));
  end;
Vir2 := s;
end;
function Vir3 : string;
var i,c : integer; s : string;
begin
s := chr(48+Random(10));
c := 0;
for i := 1 to Random(7) do
  begin
  if c = 4 then
  case Random(2) of
  0: begin s := s + '+'; c := 0; end;
  1: begin s := s + '-'; c := 0; end;
  end
  else
  case Random(4) of
  0,1: begin s := s + '*'; c := c + 1; end;
  2: begin s := s + '+'; c := 0; end;
  3: begin s := s + '-'; c := 0; end;
  end;
  s := s + chr(48+Random(10));
  end;
Vir3 := s;
end;
var Vir4K: Integer;
function Vir4 : string;
var i,c : integer; s : string[80];
begin
  Vir4K := Vir4K + 1;
  if (Random(3)=0) and (Vir4K <= 6) then
  s := '('+vir4+')'
  else
  s := chr(48+Random(10));
  c := 0;
for i := 1 to Random(3)+1 do
  begin
  if c = 4 then
  case Random(2) of
  0: begin s := s + '+'; c := 0; end;
  1: begin s := s + '-'; c := 0; end;
  end
  else
  case Random(4) of
  0,1: begin s := s + '*'; c := c + 1; end;
  2: begin s := s + '+'; c := 0; end;
  3: begin s := s + '-'; c := 0; end;
  end;
  if (Random(3)=0) and (Vir4K <= 6) then
  s := s + '('+vir4+')'
  else
  s := s + chr(48+Random(10));
  end;
Vir4 := s;
end;
function Calc2(s : string) : integer;
var count : integer;
function vir : integer;
var i : integer; z : char;
begin
i :=ord(s[count])-48;  dec(count);
if (count>0) and (s[count]in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir + i;
    '-': i := vir - i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc2 := vir;
end;
function Calc3(s : string) : integer;
var count : integer;
function chlen : integer;
var i : integer;
begin
i :=ord(s[count])-48;  dec(count);
if (count>0) and (s[count]='*') then
  begin
    dec(count);
    i := chlen * i;
  end;
chlen := i;
end;
function vir : integer;
var i : integer; z : char;
begin
i := chlen;
if (count>0) and (s[count] in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir+i;
    '-': i := vir-i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc3 := vir;
end;
function Calc4(s : string) : real;
var count : integer;
function vir:real; forward;
function elem : real;
var i : integer;
begin
if (count>0) and (s[count]=')') then
  begin
    dec(count);
    elem := vir;
  end
else
    elem :=ord(s[count])-48;
dec(count);
end;
function chlen : real;
var i : real;
begin
i :=elem;
if (count>0) and (s[count]='*') then
  begin
    dec(count);
    i := chlen * i;
  end;
chlen := i;
end;
function vir : real;
var i : real; z : char;
begin
i := chlen;
if (count>0) and (s[count] in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir+i;
    '-': i := vir-i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc4 := vir;
end;
function lCon(i:integer):char;
begin
if i=0 then lCon := 'F'
else lCon := 'T';
end;
function Vir5 : string;
var s:string;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(3) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
      s := s+Vir5+','+Vir5+')';
  end;
Vir5 := s;
end;
function Vir6 : string;
var s:string; i : integer;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(3) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
    begin
      for i:=1 to Random(4) do
        s := s+Vir6+',';
      s := s + Vir6+')';
    end;
  end;
Vir6 := s;
end;
function Vir7 : string;
var s,z:string; i : integer;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(5) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := 'Not('+Vir7+')';
  3,4: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
    begin
      for i:=1 to Random(4) do
        s := s+Vir7+',';
      s := s + Vir7+')';
    end;
  end;
Vir7 := s;
end;
function Vir8 : string;
var s,z:string; i : integer;
begin
inc(count);
if (count>6) then s := chr(48+Random(10))
else
  begin
  case Random(4) of
  0: s := 'M(';
  1: s := 'm(';
  2,3: s := chr(48+Random(10));
  end;
  if s[1]in ['M','m'] then
    begin
      for i:=1 to 2 + Random(3) do
        s := s+Vir8+',';
      s := s + Vir8+')';
    end;
  end;
Vir8 := s;
end;


function Calc5(s : string) : Boolean;
var count : integer;
function vir : Boolean;
var b: boolean;i : integer; z : char;
begin
if s[count] in ['T','F'] then
  begin
  case s[count] of
  'T' : vir := true;
  'F' : vir := false;
  end;
  inc(count);
  end
else
 begin
 if s[count]='O' then
   begin
     count := count + 3;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir or b;    {в этом порядке!}
       end;
   end
 else
   begin
     count := count + 4;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir and b;
       end;
   end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc5 := vir;
end;
function Calc7(s : string) : Boolean;
var count : integer;
function vir : Boolean;
var b: boolean;i : integer; z : char;
begin
if s[count] in ['T','F'] then
  begin
  case s[count] of
  'T' : vir := true;
  'F' : vir := false;
  end;
  inc(count);
  end
else
 begin
 case s[count] of
 'O':
   begin
     count := count + 3;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir or b;    {в этом порядке!}
       end;
   end;
 'A':
   begin
     count := count + 4;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir and b;
       end;
   end;
 'N':
   begin
     count := count + 4;
     b := not vir;
   end;
 end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc7 := vir;
end;
function Calc8(s : string) : integer;
var count : integer;
function min(a,b: integer): integer;
begin
if a < b then min := a
else min := b;
end;
function max(a,b: integer): integer;
begin
if a > b then max := a
else max := b;
end;
function vir : integer;
var b: integer;i : integer; z : char;
begin
if s[count] in ['0'..'9'] then
  begin
  vir := ord(s[count])-ord('0');
  inc(count);
  end
else
 begin
 case s[count] of
 'M':
   begin
     count := count + 2;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := max(vir,b);    {в этом порядке!}
       end;
   end;
 'm':
   begin
     count := count + 2;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := min(vir,b);
       end;
   end;
 end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc8 := vir;
end;
procedure SRec30An13(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,2);
taskText('Выражение определяется следующим образом:',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & <цифра> | <выражение>\,+\,<цифра> |&\,&\,& <выражение>\,\-\,<цифра>\j\]',0,4);
(*
*)
count := 0;
s := Vir2;
dataS('S = ',s,0,3);
resultN('',Calc2(s),0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30An14(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,2);
taskText('Выражение определяется следующим образом:',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & <терм> | <выражение>\,+\,<терм> |&\,&\,& <выражение>\,\-\,<терм>&',7,4);
taskText('<терм>      & \M::=\m & <цифра> | <терм>\,*\,<цифра>\j\]',7,5);
(*
*)
count := 0;
s := Vir3;
dataS('S = ',s,0,3);
resultN('',Calc3(s),0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30An15(Name, Key: string);
var i,j,k : integer;
    r: real;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,1);
taskText('Выражение определяется следующим образом:',0,2);
taskText('\[\Jlcl&<выражение> & \M::=\m & <терм> | <выражение>\,+\,<терм> |&\,&\,& <выражение>\,\-\,<терм>&',7,3);
taskText('<терм>      & \M::=\m & <элемент> | <терм>\,*\,<элемент>&',7,4);
taskText('<элемент>   & \M::=\m & <цифра> | (<выражение>)\j\]',7,5);
(*
*)

count := 0;
while true do
begin
Vir4K := 0;
s := Vir4;
if length(s)<30 then
  begin
    r := Calc4(s);
    if abs(r)<32000 then break;
  end;
end;
dataS('S = ',s,0,3);
resultN('',Round(r),0,3,2);
setNumberOfTests(9);
pause;
end;

procedure SRec30An16(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,2);
taskText('Выражение определяется следующим образом:',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & <цифра> |&\,&\,& (<выражение><знак><выражение>)&',10,4);
taskText('<знак>      & \M::=\m & + | \- | *\j\]',10,5);
(*
*)

count := 0;
s := Vir1;
dataS('S = ',s,0,3);
count := 1;
resultN('',Calc1,0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30An17(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Проверить правильность выражения, заданного в\ виде непустой строки~{S}',0,2);
taskText('(выражение определяется по\ тем\ же правилам, что\ и\ в\ задании \1).',0,3);
taskText('Если выражение составлено правильно, то\ вывести \t, иначе вывести \f.',0,4);
(*
*)
count := 0;
s := Vir1;
if Random(2)=0 then
  for i := 1 to {Random(3) +} 1 do
  case Random(13) of
  0 : insert(chr(48+Random(10)),s,random(length(s)+1));
  1 : insert('(',s,random(length(s)+1));
  2 : insert(')',s,random(length(s)+1));
  3 : insert('*',s,random(length(s)+1));
  4 : insert('+',s,random(length(s)+1));
  5 : insert(chr(65+Random(23)),s,random(length(s)+1));
  6 : insert(chr(48+Random(10)),s,1);
  7..8: s := s + chr(48+Random(10));
  9..12: if length(s)>2 then delete(s,2+Random(length(s)-2),200);
  end;
dataS('S = ',s,0,3);
count := 1;
resultB('',Check1 and (count=length(s)+1),0,3);
setNumberOfTests(9);
pause;
end;
procedure SRec30An18(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Проверить правильность выражения, заданного в\ виде непустой строки~{S}',0,2);
taskText('(выражение определяется по\ тем\ же правилам, что\ и\ в\ задании \2).',0,3);
taskText('Если выражение составлено правильно, то\ вывести~0, в\ противном случае',0,4);
taskText('вывести номер первого ошибочного, лишнего или\ недостающего символа в\ строке~{S}.',0,5);
(*
*)
(*==*)
count := 0;
s := Vir1;
if Random(2)=0 then
  for i := 1 to {Random(3) +} 1 do
  case Random(13) of
  0 : insert(chr(48+Random(10)),s,random(length(s)+1));
  1 : insert('(',s,random(length(s)+1));
  2 : insert(')',s,random(length(s)+1));
  3 : insert('*',s,random(length(s)+1));
  4 : insert('+',s,random(length(s)+1));
  5 : insert(chr(65+Random(23)),s,random(length(s)+1));
  6 : insert(chr(48+Random(10)),s,1);
  7..8: s := s + chr(48+Random(10));
  9..12: if length(s)>2 then delete(s,2+Random(length(s)-2),200);
  end;
dataS('S = ',s,0,3);
count := 1;
i := check1a;
if count <> length(s)+1 then i := count;
resultN('',i,0,3,2);
setNumberOfTests(9);
Pause;
end;


procedure SRec30An19(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,1);
taskText('Выражение определяется следующим образом (функция~M возвращает',0,2);
taskText('максимальный из\ своих параметров, а\ функция~m\ \= минимальный):',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & <цифра> | M(<выражение>\,,\,<выражение>) |',10,4);
taskText('&\,&\,&                  m(<выражение>\,,\,<выражение>)\j\]',10,5);
(*
*)
(*==*)
count := 0;
s := Vir9;
dataS('S = ',s,0,3);
count := 1;
resultN('',Calc9,0,3,2);
setNumberOfTests(9);
Pause;
end;



procedure SRec30An20(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Вывести значение логического выражения, заданного в\ виде строки~{S}.',0,2);
taskText('Выражение определяется следующим образом (\<T\>\ \= \t, \<F\>\ \= \f):',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & T | F | And(<выражение>\,,\,<выражение>) |',10,4);
taskText('&\,&\,&                  Or(<выражение>\,,\,<выражение>)\j\]',10,5);
(*
*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir5;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',calc5(s),0,3);
setNumberOfTests(9);
pause;
end;

procedure SRec30An21(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Вывести значение целочисленного выражения, заданного в\ виде строки~{S}.',0,1);
taskText('Выражение определяется следующим образом (функция~M возвращает',0,2);
taskText('максимальный из\ своих параметров, а\ функция~m\ \= минимальный):',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & <цифра> | M(<параметры>) | m(<параметры>)&',10,4);
taskText('<параметры> & \M::=\m & <выражение> | <выражение>\,,\,<параметры>\j\]',10,5);
(*
*)
(*==*)
if Random(8)=0 then s := chr(48+Random(10))
else
repeat
count := 0;
s := Vir8;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultN('',calc8(s),0,3,2);
setNumberOfTests(9);
Pause;
end;


procedure SRec30An22(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Вывести значение логического выражения, заданного в\ виде строки~{S}.',0,2);
taskText('Выражение определяется следующим образом (\<T\>\ \= \t, \<F\>\ \= \f):',0,3);
taskText('\[\Jlcl&<выражение> & \M::=\m & T | F | And(<параметры>) | Or(<параметры>)&',10,4);
taskText('<параметры> & \M::=\m & <выражение> | <выражение>\,,\,<параметры>\j\]',10,5);
(*
*)
(*==*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir6;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',calc5(s),0,3);
setNumberOfTests(9);
Pause;
end;                 
procedure SRec30An23(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Вывести значение логического выражения, заданного в\ виде строки~{S}.',0,1);
taskText('Выражение определяется следующим образом (\<T\>\ \= \t, \<F\>\ \= \f):',0,2);
taskText('\[\Jlcl&<выражение> & \M::=\m & T | F | And(<параметры>) |',10,3);
taskText('&\,&\,&                  Or(<параметры>) | Not(<выражение>)&',10,4);
taskText('<параметры> & \M::=\m & <выражение> | <выражение>\,,\,<параметры>\j\]',10,5);
(*
*)
(*==*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir7;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',Calc7(s),0,3);
setNumberOfTests(9);
Pause;
end;


procedure SRec30An24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 83{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;








procedure SRec30An25(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..10] of integer;
procedure step(n0,k0 : integer);
var i : integer;
begin
  s[n0] := k0;
  if n0=n then
    begin
      s1 := '';     
      for i := 1 to n do
        s1 := s1 + char(48+s[i]);
      writeln(T,s1);
    end
  else
    for i := 1 to k do
      step(n0+1,i);
end;
begin
start(Name,Topic3,Author,Key,83{level3});(*DEMO*)
taskText('Дано дерево глубины~{N}, каждая внутренняя вершина которого имеет',0,1);
taskText('{K}\ (<\,10) непосредственных потомков (нумеруются от~1 до~{K}). Корень дерева',0,2);
taskText('имеет номер~0. Записать в\ текстовый файл с\ данным именем все возможные пути,',0,3);
taskText('ведущие от\ корня к\ листьям. Перебирать пути, начиная с\ \<самого левого\> и\',0,4);
taskText('заканчивая \<самым правым\> (при\ этом первыми заменять конечные элементы пути).',0,5);
(*
*)
repeat
n := Random(10)+2;
k := 2 + Random(6);
x := exp((n-1)*ln(k));
until x<500;
s0 := FileName(8)+tst;
dataN('N = ',n-1,xLeft,2,1);
dataN('K = ',k,xRight,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to k do
  step(2,i);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(5);
pause;
end;
procedure SRec30An26(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..10] of integer;
procedure step(n0,k0 : integer);
var i : integer;
begin
  s[n0] := k0;
  if n0=n then
    begin
      s1 := '';
      for i := 1 to n do
        s1 := s1 + char(48+s[i]);
      writeln(T,s1);
    end
  else
    for i := 1 to k do
      if i <> k0 then
      step(n0+1,i);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
taskText('Дано дерево глубины~{N}, каждая внутренняя вершина которого имеет',0,1);
taskText('{K}\ (<\,10) непосредственных потомков (нумеруются от~1 до~{K}). Корень дерева имеет',0,2);
taskText('номер~0. Записать в\ текстовый файл с\ данным именем все\ пути, ведущие от\ корня',0,3);
taskText('к\ листьям и\ удовлетворяющие следующему условию: никакие соседние элементы',0,4);
taskText('пути не\ нумеруются одной и\ той\ же цифрой. Порядок перебора путей',0,5);
taskText('такой\ же, как\ в\ задании \1.',0,0);
(*
*)
(*==*)
repeat
n := Random(10)+2;
k := 2 + Random(6);
x := exp((n-1)*ln(k));
until x<500;
s0 := FileName(8)+tst;
dataN('N = ',n-1,xLeft,2,1);
dataN('K = ',k,xRight,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to k do
  step(2,i);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(5);
Pause;
end;
procedure SRec30An27(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..2] of char;
    w : array [0..2] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if n0=n then
    begin
    if sum = 0 then
    begin
      s1 := '';
      for i := 1 to n do
        s1 := s1 + c[s[i]];
      writeln(T,s1);
    end;
    end
  else
    if abs(sum)<=n-n0 then
      {Повышает эффективность, уменьшая число рекурсивных вызовов k:
      n               3    5    7    9    11    13
      k без проверки  6    30   126  510  2046  8190
      k с проверкой   6    26   98   362  1342  5014
      отношение       1    0.87 0.78 0.71 0.66  0.61
      }
      for i := 1 to 2 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});(*DEMO*)
taskText('Дано дерево глубины~{N} ({N}\ \= четное), каждая внутренняя вершина которого',0,1);
taskText('имеет 2~непосредственных потомка: {A} с\ весом~1 и~{B} с\ весом~\-1. Корень',0,2);
taskText('дерева~{C} имеет вес~0. Записать в\ текстовый файл с\ данным именем все\ пути от\',0,3);
taskText('корня к\ листьям, удовлетворяющие следующему условию: суммарный вес элементов',0,4);
taskText('пути равен~0. Порядок перебора путей такой\ же, как\ в\ задании \2.',0,5);
(*
*)
c[0] := 'C';
c[1] := 'A';
c[2] := 'B';
w[0] := 0;
w[1] := 1;
w[2] := -1;
n := 2*(Random(5)+1)+1;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 2 do
  step(2,i,0);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

pause;
end;
procedure SRec30An28(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..2] of char;
    w : array [0..2] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if k*sum>=0 then
    if n0=n then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
    else
      for i := 1 to 2 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
k := 1;
taskText('Дано дерево глубины~{N} того\ же\ типа, что\ и\ в\ задании \1.',0,1);
taskText('Записать в текстовый файл с данным именем все\ пути от\ корня к\ листьям,',0,2);
taskText('удовлетворяющие следующему условию: суммарный вес элементов',0,3);
taskText('для\ любого начального отрезка пути неотрицателен.',0,4);
taskText('Порядок перебора путей такой\ же, как\ в\ задании \3.',0,5);
(*
*)
(*==*)
c[0] := 'C';
c[1] := 'A';
c[2] := 'B';
w[0] := 0;
w[1] := 1;
w[2] := -1;
n := Random(11)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 2 do
  step(2,i,0);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;

procedure SRec30An29(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..3] of char;
    w : array [0..3] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if k*sum>=0 then
    if n0=n then
     begin
      if sum = 0 then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
     end
    else
    if abs(sum)<=n-n0 then
      for i := 1 to 3 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
     k := -1;
taskText('Дано дерево глубины~{N}, каждая внутренняя вершина которого',0,1);
taskText('имеет 3~непосредственных потомка: {A} с\ весом~1, {B} с\ весом~0 и~{C} с\ весом~\-1.',0,2);
taskText('Корень дерева~{D} имеет вес~0. Записать в\ текстовый файл с\ данным именем все',0,3);
taskText('пути от\ корня к\ листьям, удовлетворяющие следующим условиям: суммарный вес',0,4);
taskText('элементов для\ любого начального отрезка пути неположителен, а\ суммарный вес',0,5);
taskText('всех элементов пути равен~0. Порядок перебора путей такой\ же,',0,0);
taskText('как\ в\ задании \4.',0,0);
(*
*)
(*==*)
c[0] := 'D';
c[1] := 'A';
c[2] := 'B';
c[3] := 'C';
w[0] := 0;
w[1] := 1;
w[2] := 0;
w[3] := -1;
n := Random(8)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 3 do
  step(2,i,0);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;


procedure SRec30An30(Name, Key: string);
var i,j: integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..3] of char;
    w : array [0..3] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
    if n0=n then
     begin
      if sum = 0 then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
     end
    else
      for i := 1 to 3 do
      if i <> s[n0] then
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
taskText('Дано дерево глубины~{N} того\ же\ типа, что\ и\ в\ задании \1.',0,1);
taskText('Записать в\ текстовый файл с\ данным именем все пути от\ корня к\ листьям,',0,2);
taskText('удовлетворяющие следующим условиям: никакие соседние элементы пути',0,3);
taskText('не\ обозначаются одной и\ той\ же буквой, а\ суммарный вес всех элементов пути',0,4);
taskText('равен~0. Порядок перебора путей такой\ же, как\ в\ задании \5.',0,5);
(*
*)
(*==*)
c[0] := 'D';
c[1] := 'A';
c[2] := 'B';
c[3] := 'C';
w[0] := 0;
w[1] := 1;
w[2] := 0;
w[3] := -1;
n := Random(9)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('Имя файла: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 3 do
  step(2,i,0);
Close(T);
resultComment('Содержимое результирующего текстового файла:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;

begin
Topic1 := 'РЕКУРСИЯ: ПРОСТЕЙШИЕ АЛГОРИТМЫ';
Topic2 := 'РЕКУРСИЯ: РАЗБОР ВЫРАЖЕНИЙ';
Topic3 := 'РЕКУРСИЯ: ПЕРЕБОР С ВОЗВРАТОМ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.
