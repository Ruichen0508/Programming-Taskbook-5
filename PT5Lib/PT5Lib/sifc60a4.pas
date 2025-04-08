{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SIfc60A4;

{$MODE Delphi}

interface

procedure SIfc60An1(Name, Key: string);
procedure SIfc60An2(Name, Key: string);
procedure SIfc60An3(Name, Key: string);
procedure SIfc60An4(Name, Key: string);
procedure SIfc60An5(Name, Key: string);
procedure SIfc60An6(Name, Key: string);
procedure SIfc60An7(Name, Key: string);
procedure SIfc60An8(Name, Key: string);
procedure SIfc60An9(Name, Key: string);
procedure SIfc60An10(Name, Key: string);
procedure SIfc60An11(Name, Key: string);
procedure SIfc60An12(Name, Key: string);
procedure SIfc60An13(Name, Key: string);
procedure SIfc60An14(Name, Key: string);
procedure SIfc60An15(Name, Key: string);
procedure SIfc60An16(Name, Key: string);
procedure SIfc60An17(Name, Key: string);
procedure SIfc60An18(Name, Key: string);
procedure SIfc60An19(Name, Key: string);
procedure SIfc60An20(Name, Key: string);
procedure SIfc60An21(Name, Key: string);
procedure SIfc60An22(Name, Key: string);
procedure SIfc60An23(Name, Key: string);
procedure SIfc60An24(Name, Key: string);
procedure SIfc60An25(Name, Key: string);
procedure SIfc60An26(Name, Key: string);
procedure SIfc60An27(Name, Key: string);
procedure SIfc60An28(Name, Key: string);
procedure SIfc60An29(Name, Key: string);
procedure SIfc60An30(Name, Key: string);
procedure SIfc60An31(Name, Key: string);
procedure SIfc60An32(Name, Key: string);
procedure SIfc60An33(Name, Key: string);
procedure SIfc60An34(Name, Key: string);
procedure SIfc60An35(Name, Key: string);
procedure SIfc60An36(Name, Key: string);
procedure SIfc60An37(Name, Key: string);
procedure SIfc60An38(Name, Key: string);
procedure SIfc60An39(Name, Key: string);
procedure SIfc60An40(Name, Key: string);
procedure SIfc60An41(Name, Key: string);
procedure SIfc60An42(Name, Key: string);
procedure SIfc60An43(Name, Key: string);
procedure SIfc60An44(Name, Key: string);
procedure SIfc60An45(Name, Key: string);
procedure SIfc60An46(Name, Key: string);
procedure SIfc60An47(Name, Key: string);
procedure SIfc60An48(Name, Key: string);
procedure SIfc60An49(Name, Key: string);
procedure SIfc60An50(Name, Key: string);
procedure SIfc60An51(Name, Key: string);
procedure SIfc60An52(Name, Key: string);
procedure SIfc60An53(Name, Key: string);
procedure SIfc60An54(Name, Key: string);
procedure SIfc60An55(Name, Key: string);
procedure SIfc60An56(Name, Key: string);
procedure SIfc60An57(Name, Key: string);
procedure SIfc60An58(Name, Key: string);
procedure SIfc60An59(Name, Key: string);
procedure SIfc60An60(Name, Key: string);

implementation

uses PT5TaskMaker;

const Pi = 3.14;
      dir : array [0..3] of char = ('С','З','Ю','В');
      day : array [0..11] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);

var Topic1,Topic2,Topic3,Author : string;
    a,b,c,a1,b1,c1,a2,b2,c2,d,x,y,x1,y1,x2,y2,z,x0 : real;
    i,j,k,m,m1,m2,m3,m4,n,n1,n2,n3,n4,a0,b0 : integer;
    s,s1,s2,s3,s4 : string;
    bln : Boolean;

procedure swap(var x,y:real);
var z : real;
begin
if x > y then
  begin
    z := x;
    x := y;
    y := z;
  end;
end;

procedure swapN(var x,y:integer);
var z : integer;
begin
if x > y then
  begin
    z := x;
    x := y;
    y := z;
  end;
end;

function digit(n:integer):string;
var s1 : string;
begin
case n of
0: s1 := 'ноль';
1: s1 := 'один';
2: s1 := 'два';
3: s1 := 'три';
4: s1 := 'четыре';
5: s1 := 'пять';
6: s1 := 'шесть';
7: s1 := 'семь';
8: s1 := 'восемь';
9: s1 := 'девять';
end;
digit := s1;
end;

procedure SIfc60An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
{Вариант до версии 4.15
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то\ прибавить к\ нему~1; в\ противном случае не\ изменять\ его.',0,3);
taskText('Вывести полученное число.',0,4);
}
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то вычесть из него~8; в\ противном случае не\ изменять\ его.',0,3);
taskText('Вывести полученное число.',0,4);
(*
Использовать сокращенную форму
условного оператора:
\(
\uPif <условие> then\|
~~<оператор>;
\uVIf <условие> Then\|
~~<оператор>\|
End If
\uE
\)
*)
(*==*)
  begin
    case Random(3) of
    0: begin n := 1+Random(15); end;
    1: begin n := 0; end;
    2: begin n := -integer(1+Random(9)); end;
    end;
    case curtest of //2012
    5: begin n := 1+Random(15); end;
    6: begin n := 1+Random(8); end;
    3: begin n := 0; end;
    8: begin n := -integer(1+Random(6)); end;
    end;
    dataN('',n,0,3,3);
    if n>0 then n := n-8;
    resultN('',n,0,3,3);
  end;
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(2,0,0,0,v1,v2,v3);
{Вариант до версии 4.15
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то прибавить к нему~1; в\ противном случае вычесть из\ него~2.',0,3);
taskText('Вывести полученное число.',0,4);
}
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то вычесть из него~8; в\ противном случае прибавить к нему~6.',0,3);
taskText('Вывести полученное число.',0,4);
(*
Использовать полную форму условного оператора:
\(
\uPif <условие> then\|
~~<оператор1>\|
else <оператор2>;
\uVIf <условие> Then\|
~~<оператор1>\|
Else\|
~~<оператор2>\|
End If
\uE
\)
*)
(*==*)
  begin
    case Random(3) of
    0: begin n := 1+Random(15); end;
    1: begin n := 0; end;
    2: begin n := -integer(1+Random(9)); end;
    end;
    case curtest of //2012
    2: begin n := 1+Random(15); end;
    5: begin n := 1+Random(8); end;
    7: begin n := 0; end;
    4: begin n := -integer(1+Random(6)); end;
    end;
    dataN('',n,0,3,3);
    if n>0 then n := n-8
           else n := n+6;
    resultN('',n,0,3,3);
  end;
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
{Вариант до версии 4.15
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то прибавить к нему~1; если отрицательным, то вычесть из\ него~2;',0,3);
taskText('если нулевым, то\ заменить его на~10. Вывести полученное число.',0,4);
}
taskText('Дано целое число. Если оно является положительным,',0,2);
taskText('то вычесть из него~8; если отрицательным, то прибавить к нему~6;',0,3);
taskText('если нулевым, то\ заменить его на~10. Вывести полученное число.',0,4);
(*
Использовать вложенные условные операторы:
\(
\uPif <условие1> then\|
~~<оператор1>\|
else if <условие2> then\|
~~<оператор2>\|
else <оператор3>;
\uVIf <условие1> Then\|
~~<оператор1>\|
ElseIf <условие2> Then\|
~~<оператор2>\|
Else\|
~~<оператор3>\|
End If
\uE
\)
*)
(*==*)
  begin
    case Random(3) of
    0: begin n := 1+Random(15); end;
    1: begin n := 0; end;
    2: begin n := -integer(1+Random(9)); end;
    end;
    case curtest of //2012
    4: begin n := 1+Random(15); end;
    3: begin n := 1+Random(8); end;
    2: begin n := 0; end;
    5: begin n := -6; end;
    6: begin n := -integer(1+Random(9)); end;
    7: begin n := -integer(1+Random(6)); end;
    end;
    dataN('',n,0,3,3);
    if n > 0 then n := n - 8
    else
      if n < 0 then n := n + 6
      else
        n := 10;
    resultN('',n,0,3,3);
  end;
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны три целых числа.',0,2);
taskText('Найти количество положительных чисел в\ исходном наборе.',0,4);
(*
Использовать вспомогательную переменную-счетчик.
*)
m := 0;
for i := 1 to 3 do
  begin
    case Random(3) of
    0: begin n := 1+Random(20); m := m+1; end;
    1: begin n := 0; end;
    2: begin n := -integer(1+Random(20)); end;
    end;
    dataN('',n,center(i,3,2,17),3,3);
  end;
resultN('',m,0,3,3);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны три целых числа. Найти количество положительных',0,2);
taskText('и\ количество отрицательных чисел в\ исходном наборе.',0,4);
(*
Использовать две вспомогательных переменных-счетчика.
*)
(*==*)
m := 0; k := 0;
for i := 1 to 3 do
  begin
    case Random(3) of
    0: begin n := 1+Random(20); m := m+1; end;
    1: begin n := 0; end;
    2: begin n := -integer(1+Random(20)); k := k+1; end;
    end;
    dataN('',n,center(i,3,2,17),3,3);
  end;
resultN('Количество положительных чисел: ',m,0,2,3);
resultN('Количество отрицательных чисел: ',k,0,4,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны два числа. Вывести большее из\ них.',0,3);
(*
*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('',a,xLeft,3,5);
dataR('',b,xRight,3,5);
if a > b then c := a else c := b;
resultR('',c,0,3,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны два числа. Вывести порядковый номер меньшего из\ них.',0,3);
(*
*)
(*==*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('',a,xLeft,3,5);
dataR('',b,xRight,3,5);
if a < b then n := 1 else n := 2;
resultN('',n,0,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны два числа.',0,2);
taskText('Вывести вначале большее, а\ затем меньшее из\ них.',0,4);
(*
*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('',a,xLeft,3,5);
dataR('',b,xRight,3,5);
if a > b then begin c := a; d := b; end
         else begin c := b; d := a; end;
resultR('Большее число: ',c,0,2,5);
resultR('Меньшее число: ',d,0,4,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны две переменные вещественного типа:~{A},~{B}.',0,2);
taskText('Перераспределить значения данных переменных так, чтобы',0,3);
taskText('в~{A} оказалось меньшее из\ значений, а\ в~{B}\ \= большее.',0,4);
taskText('Вывести новые значения переменных~{A} и~{B}.',0,5);
(*
*)
(*==*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,xRight,3,5);
swap(a,b);
resultComment(' Новые значения переменных:',0,2);
resultR('A = ',a,xLeft,3,5);
resultR('B = ',b,xRight,3,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны две переменные целого типа:~{A} и~{B}. Если их\ значения не\ равны,',0,2);
taskText('то\ присвоить каждой переменной сумму этих значений,',0,3);
taskText('а\ если равны, то\ присвоить переменным нулевые значения.',0,4);
taskText('Вывести новые значения переменных~{A} и~{B}.',0,5);
(*
*)
(*==*)
n := Random(2);
while True do
  begin
    n1 := Random(50); //2012
    n2 := Random(50);
    case n of
    0: if n1=n2 then
         begin
           m1 := 0;
           break;
         end;
    1: if n1<>n2 then
         begin
           m1 := n1+n2;
           break;
         end;
    end;
  end;
dataN('A = ',n1,xLeft,3,2);
dataN('B = ',n2,xRight,3,2);
resultComment(' Новые значения переменных:',0,2);
resultN('A = ',m1,xLeft,3,2);
resultN('B = ',m1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Даны две переменные целого типа:~{A} и~{B}. Если их\ значения не\ равны,',0,2);
taskText('то\ присвоить каждой переменной большее из\ этих значений,',0,3);
taskText('а\ если равны, то\ присвоить переменным нулевые значения.',0,4);
taskText('Вывести новые значения переменных~{A} и~{B}.',0,5);
(*
*)
(*==*)
n := Random(2);
while True do
  begin
    n1 := Random(50); //2012
    n2 := Random(50);
    case n of
    0: if n1=n2 then
         begin
           m1 := 0;
           break;
         end;
    1: if n1<>n2 then
         begin
           if n1 > n2 then
             m1 := n1
           else
             m1 := n2;
           break;
         end;
    end;
  end;
dataN('A = ',n1,xLeft,3,2);
dataN('B = ',n2,xRight,3,2);
resultComment(' Новые значения переменных:',0,2);
resultN('A = ',m1,xLeft,3,2);
resultN('B = ',m1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Даны три числа. Найти наименьшее из\ них.',0,3);
(*
*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
c := Random*19.99-10;
dataR('',a,center(1,3,5,17),3,5);
dataR('',b,center(2,3,5,17),3,5);
dataR('',c,center(3,3,5,17),3,5);
swap(a,b);
swap(a,c);
resultR('',a,0,3,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны три числа. Найти среднее из\ них',0,2);
taskText('(т.\,е. число, расположенное между наименьшим и\ наибольшим).',0,4);
(*
*)
(*==*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
c := Random*19.99-10;
dataR('',a,center(1,3,5,17),3,5);
dataR('',b,center(2,3,5,17),3,5);
dataR('',c,center(3,3,5,17),3,5);
swap(a,b);
if c < a then x := a else
if c > b then x := b
else x := c;
resultR('',x,0,3,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны три числа. Вывести вначале наименьшее,',0,2);
taskText('а\ затем наибольшее из\ данных чисел.',0,4);
(*
*)
(*==*)
a := Random*19.99-10;  //2012
b := Random*19.99-10;
c := Random*19.99-10;
dataR('',a,center(1,3,5,17),3,5);
dataR('',b,center(2,3,5,17),3,5);
dataR('',c,center(3,3,5,17),3,5);
swap(a,b);
if c < a then a := c;
if c > b then b := c;
resultR('Наименьшее число: ',a,0,2,5);
resultR('Наибольшее число: ',b,0,4,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны три числа. Найти сумму двух наибольших из\ них.',0,3);
(*
*)
(*==*)
a := RandomR2(-9.9,9.9); //Random*19.99-10; //2012 //2018
b := RandomR2(-9.9,9.9); //Random*19.99-10;
c := RandomR2(-9.9,9.9); //Random*19.99-10;
dataR('',a,center(1,3,5,17),3,5);
dataR('',b,center(2,3,5,17),3,5);
dataR('',c,center(3,3,5,17),3,5);
swap(a,b);
if c < a then x := a + b
         else x := c + b;
resultR('',x,0,3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны три переменные вещественного типа:~{A}, {B},\ {C}.',0,2);
taskText('Если их\ значения упорядочены по\ возрастанию, то\ удвоить\ их;',0,3);
taskText('в\ противном случае заменить значение каждой переменной на\ противоположное.',0,4);
taskText('Вывести новые значения переменных~{A}, {B},~{C}.',0,5);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
4: n := 0;
8: n := 1;
end;
while True do
  begin
    a := Random*19.99-10;
    b := Random*19.99-10;
    c := Random*19.99-10;
    case n of
    0: if (a<b) and (b<c) then break;
    1: if (a>b) and (b>c) then break;
    2: break;
    end;
  end;
dataR('A = ',a,center(1,3,10,15),3,6);
dataR('B = ',b,center(2,3,10,15),3,6);
dataR('C = ',c,center(3,3,10,15),3,6);
if (a<b)and(b<c) then m := 2
                 else m := -1;
resultComment(' Новые значения переменных:',0,2);
resultR('A = ',m*a,center(1,3,10,15),3,6);
resultR('B = ',m*b,center(2,3,10,15),3,6);
resultR('C = ',m*c,center(3,3,10,15),3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны три переменные вещественного типа:~{A}, {B},\ {C}.',0,2);
taskText('Если их\ значения упорядочены по\ возрастанию или\ убыванию, то\ удвоить\ их;',0,3);
taskText('в\ противном случае заменить значение каждой переменной на\ противоположное.',0,4);
taskText('Вывести новые значения переменных~{A}, {B},~{C}.',0,5);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
7: n := 0;
3: n := 1;
end;
while True do
  begin
    a := RandomR2(-9.9,9.9); //Random*19.99-10; //2018
    b := RandomR2(-9.9,9.9); //Random*19.99-10;
    c := RandomR2(-9.9,9.9); //Random*19.99-10;
    case n of
    0: if (a<b) and (b<c) then break;
    1: if (a>b) and (b>c) then break;
    2: break;
    end;
  end;
dataR('A = ',a,center(1,3,10,15),3,6);
dataR('B = ',b,center(2,3,10,15),3,6);
dataR('C = ',c,center(3,3,10,15),3,6);
if (a-b)*(b-c)>0 then m := 2
                 else m := -1;
resultComment(' Новые значения переменных:',0,2);
resultR('A = ',m*a,center(1,3,10,15),3,6);
resultR('B = ',m*b,center(2,3,10,15),3,6);
resultR('C = ',m*c,center(3,3,10,15),3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Даны три целых числа, одно из\ которых отлично от\ двух других, равных',0,2);
taskText('между собой. Определить порядковый номер числа, отличного от\ остальных.',0,4);
(*
*)
(*==*)
n := Random(3)+1;
case curtest of //2012
2: n := 3;
5: n := 1;
8: n := 2;
end;
while True do
begin
n1 := Random(10);
n2 := Random(10);
if n1<>n2 then break;
end;
case n of
1 : begin m1 := n1; m2 := n2; m3 := n2; end;
2 : begin m1 := n2; m2 := n1; m3 := n2; end;
3 : begin m1 := n2; m2 := n2; m3 := n1; end;
end;
dataN('',m1,center(1,3,1,17),3,1);
dataN('',m2,center(2,3,1,17),3,1);
dataN('',m3,center(3,3,1,17),3,1);
resultN('',n,0,3,1);
if n = 3 then setnumberofusedData(2);  //2010.11.23
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Даны четыре целых числа, одно из\ которых отлично от\ трех других, равных',0,2);
taskText('между собой. Определить порядковый номер числа, отличного от\ остальных.',0,4);
(*
*)
(*==*)
n := Random(4)+1;
case curtest of //2012
2: n := 2;
4: n := 3;
6: n := 4;
7: n := 1;
end;
while True do
begin
n1 := Random(10);
n2 := Random(10);
if n1<>n2 then break;
end;
case n of
1 : begin m1 := n1; m2 := n2; m3 := n2; m4 := n2; end;
2 : begin m1 := n2; m2 := n1; m3 := n2; m4 := n2; end;
3 : begin m1 := n2; m2 := n2; m3 := n1; m4 := n2; end;
4 : begin m1 := n2; m2 := n2; m3 := n2; m4 := n1; end;
end;
dataN('',m1,center(1,4,1,17),3,1);
dataN('',m2,center(2,4,1,17),3,1);
dataN('',m3,center(3,4,1,17),3,1);
dataN('',m4,center(4,4,1,17),3,1);
resultN('',n,0,3,1);
setnumberofusedData(3);  //2010.11.23
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('На\ числовой оси расположены три точки:~{A}, {B},\ {C}.',0,2);
taskText('Определить, какая из\ двух последних точек ({B} или~{C}) расположена ближе к~{A},',0,3);
taskText('и\ вывести эту точку и\ ее расстояние от\ точки~{A}.',0,4);
(*
*)
(*==*)
a := RandomR2(-9.9,9.9); //Random*19.99-10; //2018
b := RandomR2(-9.9,9.9); //Random*19.99-10;
c := RandomR2(-9.9,9.9); //Random*19.99-10;
dataR('A = ',a,center(1,3,10,15),3,6);
dataR('B = ',b,center(2,3,10,15),3,6);
dataR('C = ',c,center(3,3,10,15),3,6);
x1 := abs(a-b);
x2 := abs(a-c);
if x1>x2 then begin b := c; x1 := x2; end;
resultR('Ближайшая точка: ',b,0,2,6);
resultR('Расстояние:      ',x1,0,4,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны целочисленные координаты точки на\ плоскости.',0,1);
taskText('Если точка совпадает с\ началом координат, то\ вывести~0.',0,2);
taskText('Если точка не\ совпадает с\ началом координат, но\ лежит',0,3);
taskText('на\ оси~{OX} или~{OY}, то\ вывести соответственно~1 или~2.',0,4);
taskText('Если точка не\ лежит на координатных осях, то\ вывести~3.',0,5);
(*
*)
(*==*)
n := Random(4);
case curtest of //2012
3: n := 3;
4: n := 0;
7: n := 2;
8: n := 1;
end;
if n = 0 then begin n1 := 0; n2 := 0; end
else
while True do
  begin
    n1 := integer(Random(10))-5;
    n2 := integer(Random(10))-5;
    case n of
    3 : bln := (n1<>0)and(n2<>0);
    1 : bln := (n1<>0)and(n2=0);
    2 : bln := (n1=0)and(n2<>0);
    end;
    if bln then break;
  end;
dataN2('Координаты точки: ',n1,n2,0,3,3);
resultN('',n,0,3,1);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны координаты точки, не\ лежащей на\ координатных осях~{OX} и~{OY}.',0,2);
taskText('Определить номер координатной четверти, в\ которой находится данная точка.',0,4);
(*
*)
n := Random(4);
case curtest of //2012
2: n := 0;
5: n := 3;
6: n := 1;
8: n := 2;
end;
while True do
  begin
    x1 := Random*19.99-10;
    x2 := Random*19.99-10;
    case n of
    0 : bln := (x1>0)and(x2>0);
    1 : bln := (x1<0)and(x2>0);
    2 : bln := (x1<0)and(x2<0);
    3 : bln := (x1>0)and(x2<0);
    end;
    if bln then break;
  end;
dataR2('Координаты точки:',x1,x2,0,3,6);
resultN('',n+1,0,3,1);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An23(Name, Key: string);
var v1,v2,v3 : byte;
    a: array [0..4] of record x,y: integer end;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны целочисленные координаты трех вершин прямоугольника,',0,2);
taskText('стороны которого параллельны координатным осям.',0,3);
taskText('Найти координаты его четвертой вершины.',0,4);
(*
*)
(*==*)
repeat
m1 := integer(Random(20))-9;
m2 := integer(Random(20))-9;
n1 := integer(Random(20))-9;
n2 := integer(Random(20))-9;
until (m1<m2) and (n1<n2);
a[1].x := m1; a[1].y := n1;
a[2].x := m1; a[2].y := n2;
a[3].x := m2; a[3].y := n1;
a[4].x := m2; a[4].y := n2;
for i := 1 to 20 do
begin
n1 := Random(4)+1;
n2 := Random(4)+1;
a[0] := a[n1];
a[n1] := a[n2];
a[n2] := a[0];
end;

for i := 1 to 3 do
begin
  str(i,s);
  dataN2('x_'+s+', y_'+s+':',a[i].x,a[i].y,center(i,3,12,12),3,3);
end;
resultN2('x_4, y_4:',a[4].x,a[4].y,0,3,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Для данного вещественного~{x} найти значение следующей функции~{f},',0,2);
taskText('принимающей вещественные значения:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~& 2\*sin({x}),& если {x}~>~0,',26,4);
taskText('        &\,&\,&6\;\-\;{x},&    если {x}~\l~0.\j\]',26,5);
(*
*)
(*==*)
n := Random(2);
while True do
  begin
    x := RandomR2(-9.9,9.9); //Random*19.99-10; //2018
    case n of
    0: if x<=0 then begin y:=6-x; break end;
    1: if x>0 then begin y:=2*sin(x); break end;
    end;
  end;
  dataR('   x = ',x,0,3,6);
resultR('f(x) = ',y,0,3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Для данного целого~{x} найти значение следующей функции~{f},',0,2);
taskText('принимающей значения целого типа:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~&  2\*{x},& если {x}~<~\-2 или {x}~>~2,',26,4);
taskText('&\,&\,&        \-3\*{x}&  в противном случае.\j\]',26,5);
(*
*)
(*==*)
n := Random(4);
case curtest of //2012
3: n := 2;
4: n := 1;
6: n := 0;
7: n := 3;
end;
while True do
  begin
    m := integer(Random(21))-10;
    case n of
    0: if m<-2 then begin k:=2*m; break end;
    1: if m>2 then begin k:=2*m; break end;
    2: if abs(m)= 2 then begin k:=-3*m; break end;
    3: if abs(m) < 2 then begin k:=-3*m; break end;
    end;
  end;
  dataN('   x = ',m,0,3,3);
resultN('f(x) = ',k,0,3,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Для данного вещественного~{x} найти значение следующей функции~{f},',0,1);
taskText('принимающей вещественные значения:',0,2);
taskText('\[\Jrcrl&\,&\,&       \-{x},& если {x}~\l~0,',26,3);
taskText('&{f}({x})&~=~&{x}^2,& если 0~<~{x}~<~2,',26,4);
taskText('&\,&\,&        4,& если {x}~\g~2.\j\]',26,5);
(*
*)
n := Random(3);
case curtest of //2012
4: n := 2;
5: n := 0;
7: n := 1;
end;
while True do
  begin
    x := RandomR2(-9.9,9.9); //Random*19.99-10; //2018
    if (n=0)and(x<=0) then begin y:=-x; break end;
    if (n=1)and(x>0)and(x<2) then begin y:=x*x; break end;
    if (n=2)and(x>=2) then begin y:=4; break end;
  end;
  dataR('   x = ',x,0,3,5);
resultR('f(x) = ',y,0,3,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Для данного вещественного~{x} найти значение следующей функции~{f},',0,1);
taskText('принимающей значения целого типа:',0,2);
taskText('\[\Jrcrl&\,&\,&        0,& если {x}~<~0,',18,3);
taskText('&{f}({x})&~=~& 1,& если {x} принадлежит [0,\,1), [2,\,3),~\.,',18,4);
taskText('&\,&\,&       \-1,& если {x} принадлежит [1,\,2), [3,\,4),~\. .\j\]',18,5);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
2: n := 1;
4: n := 0;
8: n := 2;
end;
case n of
0: begin x := -Random*19.99-0.01; k:=0; end;
1: begin x := Random(10)*2+Random*0.98; k:=1; end;
2: begin x := Random(10)*2+1+Random*0.98; k:=-1; end;
end;
dataR('x = ',x,0,3,6);
resultN('f(x) = ',k,0,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дан номер года (положительное целое число). Определить количество дней',0,1);
taskText('в\ этом году, учитывая, что обычный год насчитывает 365~дней, а високосный\ \=',0,2);
taskText('366~дней. Високосным считается год, делящийся на~4, за\ исключением',0,3);
taskText('тех годов, которые делятся на~100 и не\ делятся на~400 (например,',0,4);
taskText('годы~300, 1300 и~1900 не\ являются високосными, а~1200 и~2000\ \= являются).',0,5);
(*
*)
(*==*)
n := Random(25);
m := 365;
n := n*100;
case curtest of //2012
3: n := n+100;
7: n := n+Random(99)+1;
else
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
end;
if (n mod 4 = 0) and ((n mod 100 <> 0) or (n mod 400 =0)) then inc(m);
dataN('',n,0,3,4);
resultN('',m,0,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(8,0,0,0,v1,v2,v3);

taskText('Дано целое число. Вывести его строку-описание вида',0,2);
taskText('\<отрицательное четное число\>, \<нулевое число\>,',0,3);
taskText('\<положительное нечетное число\> и~т.\,д.',0,4);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
3: n := 2;
5: n := 1;
6: n := 0;
end;
case n of
0: begin m := 0; s1 := 'нулевое число'; end;
1: begin m := 2*(Random(49)+1); s1 := 'четное число'; end;
2: begin m := 2*(Random(49)+1)+1; s1 := 'нечетное число'; end;
end;
if n<>0 then
  if Random(2)=0 then begin m := -m; s1 := 'отрицательное '+s1; end
  else s1 := 'положительное '+s1;
dataN('',m,0,3,abs(n));
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);

taskText('Дано целое число, лежащее в диапазоне 1\:999.',0,2);
taskText('Вывести его строку-описание вида \<четное двузначное число\>,',0,3);
taskText('\<нечетное трехзначное число\> и~т.\,д.',0,4);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
2: n := 1;
4: n := 0;
7: n := 2;
end;
case n of
0: begin m := Random(9)+1; s1 := 'однозначное число'; end;
1: begin m := Random(90)+10; s1 := 'двузначное число'; end;
2: begin m := Random(900)+100; s1 := 'трехзначное число'; end;
end;
if m mod 2 = 0 then s1 := 'четное '+s1
else s1 := 'нечетное '+s1;
dataN('',m,0,3,n+1);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;


procedure SIfc60An31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;



procedure SIfc60An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано целое число в\ диапазоне~1\:7. Вывести строку\ \= название дня недели,',0,2);
taskText('соответствующее данному числу (1~\= \<понедельник\>, 2~\= \<вторник\> и~т.\,д.).',0,4);
(*
*)
(*==*)
n := 1+Random(7);
case curtest of //2012
2: n := 3;
3: n := 7;
4: n := 5;
5: n := 1;
6: n := 2;
7: n := 4;
8: n := 6;
end;
case n of
1: s1 := 'понедельник';
2: s1 := 'вторник';
3: s1 := 'среда';
4: s1 := 'четверг';
5: s1 := 'пятница';
6: s1 := 'суббота';
7: s1 := 'воскресенье';
end;
dataN('',n,0,3,1);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An33(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);

taskText('Дано целое число~{K}. Вывести строку-описание оценки,',0,2);
taskText('соответствующей числу~{K} (1~\= \<плохо\>, 2~\= \<неудовлетворительно\>,',0,3);
taskText('3~\= \<удовлетворительно\>, 4~\= \<хорошо\>, 5~\= \<отлично\>).',0,4);
taskText('Если~{K} не\ лежит в\ диапазоне~1\:5, то\ вывести строку \<ошибка\>.',0,5);
(*
*)
if Random(3)<>0 then
  n := 1 + Random(5)
else
  n := -9 + Random(30);
case curtest of //2012
2: n := 2;
3: if Random(2)=0 then n := -Random(10) else n := Random(15)+6;
4: n := 5;
5: n := 3;
7: n := 1;
8: n := 4;
end;
case n of
1: s1 := 'плохо';
2: s1 := 'неудовлетворительно';
3: s1 := 'удовлетворительно';
4: s1 := 'хорошо';
5: s1 := 'отлично';
else s1 := 'ошибка';
end;
dataN('K = ',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60An34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Дан номер месяца\ \= целое число в\ диапазоне~1\:12',0,2);
taskText('(1~\= январь, 2~\= февраль и~т.\,д.). Вывести название',0,3);
taskText('соответствующего времени года (\<зима\>, \<весна\>, \<лето\>, \<осень\>).',0,4);
(*
*)
(*==*)
n := Random(12)+1;
case curtest of //2012
2: n := 4;
3: n := 1;
5: n := 8;
8: n := 11;
end;
case n of
1,2,12: s1 := 'зима';
3,4,5: s1 := 'весна';
6,7,8: s1 := 'лето';
9,10,11: s1 := 'осень';
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дан номер месяца\ \= целое число в\ диапазоне~1\:12',0,2);
taskText('(1~\= январь, 2~\= февраль и~т.\,д.). Определить',0,3);
taskText('количество дней в\ этом месяце для невисокосного года.',0,4);
(*
*)
n := Random(12)+1;
case curtest of //2012
2: n := 8;
4: n := 2;
5: n := 4;
end;
dataN('',n,0,3,2);
resultN('',day[n-1],0,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Арифметические действия над числами пронумерованы следующим образом:',0,2);
taskText('1~\= сложение, 2~\= вычитание, 3~\= умножение, 4~\= деление.',0,3);
taskText('Дан номер действия~{N} (целое число в диапазоне 1\:4) и\ вещественные числа~{A} и~{B}',0,4);
taskText('({B} не\ равно 0). Выполнить над числами указанное действие и\ вывести результат.',0,5);
(*
*)
(*==*)
n := 1+Random(4);
case curtest of //2012
3: n := 3;
5: n := 4;
6: n := 2;
8: n := 1;
end;
dataN('N = ',n,0,2,1);
x := (1+Random(100))/10;
x1 := (1+Random(100))/10;
case n of
1: begin y := x+x1; s1 := 'A + B = '; end;
2: begin y := x-x1; s1 := 'A - B = '; end;
3: begin y := x*x1;   s1 := 'A \* B = '; end;
4: begin y := x/x1;  s1 := 'A / B = '; end;
end;
dataR('A = ',x,xLeft,4,4);
dataR('B = ',x1,xRight,4,4);
resultR(s1,y,0,3,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Единицы длины пронумерованы следующим образом:',0,1);
taskText('1~\= дециметр, 2~\= километр, 3~\= метр, 4~\= миллиметр, 5~\= сантиметр.',0,2);
taskText('Дан номер единицы длины (целое число в диапазоне 1\:5) ',0,3);
taskText('и\ длина отрезка в\ этих единицах (вещественное число).',0,4);
taskText('Найти длину отрезка в\ метрах.',0,5);
(*
*)
(*==*)
n := 1+Random(5);
case curtest of //2012
2: n := 2;
4: n := 4;
5: n := 5;
7: n := 1;
8: n := 3;
end;
dataN('',n,0,2,1);
x := Int(100*(0.01+Random*9.97))/100;
case n of
1: begin y := x/10; k := 3;   s1 := 'дм): '; end;
2: begin y := x*1000; k := 1; s1 := 'км): '; end;
3: begin y := x;    k := 2;   s1 := 'м):  '; end;
4: begin y := x/1000; k := 5; s1 := 'мм): '; end;
5: begin y := x/100; k := 4;  s1 := 'см): '; end;
end;
dataR('Длина отрезка ('+s1,x,28,4,4);
setPrecision(k);
resultR('Длина отрезка (м):  ',y,28,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Единицы массы пронумерованы следующим образом:',0,1);
taskText('1~\= килограмм, 2~\= миллиграмм, 3~\= грамм, 4~\= тонна, 5~\= центнер.',0,2);
taskText('Дан номер единицы массы (целое число в диапазоне 1\:5) ',0,3);
taskText('и\ масса тела в\ этих единицах (вещественное число).',0,4);
taskText('Найти массу тела в\ килограммах.',0,5);
(*
*)
(*==*)
n := 1+Random(5);
case curtest of //2012
2: n := 3;
3: n := 1;
6: n := 4;
7: n := 5;
8: n := 2;
end;
dataN('',n,0,2,1);
x := Int(100*(0.01+Random*9.97))/100;
case n of
1: begin y := x; k := 2;          s1 := 'кг): '; end;
2: begin y := x/1000000.; k := 8; s1 := 'мг): '; end;
3: begin y := x/1000;    k := 5;  s1 := 'г):  '; end;
4: begin y := x*1000; k := 1;     s1 := 'т):  '; end;
5: begin y := x*100; k := 1;      s1 := 'ц):  '; end;
end;
dataR('Масса тела ('+s1,x,28,4,4);
setPrecision(k);
resultR('Масса тела (кг): ',y,28,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны два целых числа:~{D} (день) и~{M} (месяц),',0,2);
taskText('определяющие правильную дату невисокосного года.',0,3);
taskText('Вывести значения~{D} и~{M} для даты, предшествующей указанной.',0,4);
(*
*)
(*==*)
m := Random(12);
n := Random(3);
case curtest of //2012
3: begin m := 0; n := 0; end;
4: n := 0;
6: n := 1;
7: n := 0;
end;
m1 := m;
case n of
0 : begin
      n1 := 1;
      m1 := (m+11) mod 12;
      n2 := day[m1];
    end;
1,2 : begin
      n1 := 2 + Random(day[m]-1);
      n2 := n1-1;
    end;
end;
dataComment('Исходная дата:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment('Предыдущая дата:',0,2);
resultN('D = ',n2,xLeft,3,2);
resultN('M = ',m1+1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны два целых числа:~{D} (день) и~{M} (месяц),',0,2);
taskText('определяющие правильную дату невисокосного года.',0,3);
taskText('Вывести значения~{D} и~{M} для даты, следующей за\ указанной.',0,4);
(*
*)
m := Random(12);
n := Random(3);
case curtest of //2012
2: n := 0;
4: begin m := 11; n := 0; end;
5: n := 1;
7: n := 0;
end;
m1 := m;
case n of
0 :   begin
        n1 := day[m];
        n2 := 1;
        m1 := (m+1)mod 12;
      end;
1,2 : begin
      if n=2 then n1 := day[m]-1
             else n1 := 1 + Random(day[m]-1);
      n2 := n1+1;
    end;
end;
dataComment('Исходная дата:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment('Следующая дата:',0,2);
resultN('D = ',n2,xLeft,3,2);
resultN('M = ',m1+1,xRight,3,2);
setNumberOfTests(9);
pause;
end;


procedure SIfc60An41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Робот может перемещаться в\ четырех направлениях (\<С\>~\= север, \<З\>~\= запад,',0,1);
taskText('\<Ю\>~\= юг, \<В\>~\= восток) и\ принимать три цифровые команды:',0,2);
taskText('0~\= продолжать движение, 1~\= поворот налево, \-1~\= поворот направо.',0,3);
taskText('Дан символ~{C}\ \= исходное направление робота и\ целое число {N}\ \= посланная ему',0,4);
taskText('команда. Вывести направление робота после выполнения полученной команды.',0,5);
(*
*)
n := Random(4);
m := integer(Random(3))-1;
case curtest of //2012
2: n := 2;
3: m := -1;
4: n := 3;
5: n := 0;
6: m := 1;
7: n := 1;
end;
n1 := (4+n+m) mod 4;
dataC('Исходное направление: C = ',dir[n],0,2);
dataN('Команда: N = ',m,0,4,2);
resultC('Новое направление: ',dir[n1],0,3);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Локатор ориентирован на\ одну из\ сторон света (\<С\>~\= север, \<З\>~\= запад,',0,1);
taskText('\<Ю\>~\= юг, \<В\>~\= восток) и\ может принимать три цифровые команды поворота:',0,2);
taskText('1~\= поворот налево, \-1~\= поворот направо, 2~\= поворот на 180\o.',0,3);
taskText('Дан символ~{C}\ \= исходная ориентация локатора и\ целые числа~{N}_1 и~{N}_2\ \= две',0,4);
taskText('посланные команды. Вывести ориентацию локатора после выполнения этих команд.',0,5);
(*
*)
(*==*)
n := Random(4);
m1 := integer(Random(3))-1;
m2 := integer(Random(3))-1;
case curtest of //2012
2: begin m1 := -1; m2 := -1; end;
3: n := 3;
4: n := 1;
5: begin m1 := 1; m2 := 1; end;
6: n := 0;
7: n := 2;
8: m1 := 2;
end;
if m1=0 then m1 := 2;
if m2=0 then m2 := 2;
n1 := (4+n+m1+m2) mod 4;
dataC('Исходная ориентация: C = ',dir[n],0,2);
dataComment('Команды:',0,3);
dataN('N_1 = ',m1,xLeft,4,2);
dataN('N_2 = ',m2,xRight,4,2);
resultC('Новая ориентация: ',dir[n1],0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Элементы окружности пронумерованы следующим образом: 1~\= радиус~{R},',0,1);
taskText('2~\= диаметр~{D}~=~2\*{R}, 3~\= длина~{L}~=~2\*\p\*{R}, 4~\= площадь круга~{S}~=~\p\*{R}^2.',0,2);
taskText('Дан номер одного из\ этих элементов и\ его значение.',0,3);
taskText('Вывести значения остальных элементов данной окружности (в\ том же порядке).',0,4);
taskText('В качестве значения \p использовать 3.14.',0,5);
(*
*)
(*==*)
n := Random(4)+1;
case curtest of //2012
2: n := 2;
5: n := 4;
7: n := 1;
8: n := 3;
end;
x := RandomR2(0.5,9.9); //0.5+Random*9.49; //2018
dataN('',n,0,2,1);
case n of
1: begin
     dataR('R = ',x,0,4,5);
     resultR('D = ',2*x,center(1,3,9,15),3,5);
     resultR('L = ',2*Pi*x,center(2,3,9,15),3,5);
     resultR('S = ',Pi*x*x,center(3,3,9,15),3,5);
   end;
2: begin
     dataR('D = ',x,0,4,5);
     resultR('R = ',x/2,center(1,3,9,15),3,5);
     resultR('L = ',Pi*x,center(2,3,9,15),3,5);
     resultR('S = ',Pi*x*x/4,center(3,3,9,15),3,5);
   end;
3: begin
     x := x*5;
     dataR('L = ',x,0,4,5);
     resultR('R = ',x/(2*Pi),center(1,3,9,15),3,5);
     resultR('D = ',x/Pi,center(2,3,9,15),3,5);
     resultR('S = ',x*x/(4*Pi),center(3,3,9,15),3,5);
   end;
4: begin
     x := x*10;
     dataR('S = ',x,0,4,5);
     resultR('R = ',sqrt(x/Pi),center(1,3,9,15),3,5);
     resultR('D = ',sqrt(x/Pi)*2,center(2,3,9,15),3,5);
     resultR('L = ',2*sqrt(Pi*x),center(3,3,9,15),3,5);
   end;
end;
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Элементы равнобедренного прямоугольного треугольника пронумерованы',0,1);
taskText('следующим образом: 1~\= катет~{a}, 2~\= гипотенуза~{c}~=~{a}\*\R2\r,',0,2);
taskText('3~\= высота~{h}, опущенная на гипотенузу ({h}~=~{c}/2), 4~\= площадь~{S}~=~{c}\*{h}/2.',0,3);
taskText('Дан номер одного из\ этих элементов и\ его значение.',0,4);
taskText('Вывести значения остальных элементов данного треугольника (в\ том же порядке).',0,5);
(*
*)
(*==*)
n := Random(4)+1;
case curtest of //2012
2: n := 4;
4: n := 2;
5: n := 3;
7: n := 1;
end;
x := RandomR2(0.5,9.9); //0.5+Random*9.49; //2018
dataN('',n,0,2,1);
case n of
1: begin
     dataR('a = ',x,0,4,5);
     resultR('c = ',sqrt(2)*x,center(1,3,9,15),3,5);
     resultR('h = ',x/sqrt(2),center(2,3,9,15),3,5);
     resultR('S = ',x*x/2,center(3,3,9,15),3,5);
   end;
2: begin
     dataR('c = ',x,0,4,5);
     resultR('a = ',x/sqrt(2),center(1,3,9,15),3,5);
     resultR('h = ',x/2,center(2,3,9,15),3,5);
     resultR('S = ',x*x/4,center(3,3,9,15),3,5);
   end;
3: begin
     dataR('h = ',x,0,4,5);
     resultR('a = ',sqrt(2)*x,center(1,3,9,15),3,5);
     resultR('c = ',2*x,center(2,3,9,15),3,5);
     resultR('S = ',x*x,center(3,3,9,15),3,5);
   end;
4: begin
     x := x*10;
     dataR('S = ',x,0,4,5);
     resultR('a = ',sqrt(2*x),center(1,3,9,15),3,5);
     resultR('c = ',2*sqrt(x),center(2,3,9,15),3,5);
     resultR('h = ',sqrt(x),center(3,3,9,15),3,5);
   end;
end;
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Элементы равностороннего треугольника пронумерованы следующим образом:',0,1);
taskText('1~\= сторона~{a}, 2~\= радиус~{R}_1 вписанной окружности ({R}_1~=~{a}\*\R3\r/6),',0,2);
taskText('3~\= радиус~{R}_2 описанной окружности ({R}_2~=~2\*{R}_1), 4~\= площадь~{S}~=~{a}^2\*\R3\r/4.',0,3);
taskText('Дан номер одного из\ этих элементов и\ его значение.',0,4);
taskText('Вывести значения остальных элементов данного треугольника (в\ том же порядке).',0,5);
(*
*)
(*==*)
n := Random(4)+1;
case curtest of //2012
2: n := 1;
3: n := 3;
6: n := 4;
7: n := 2;
end;
x := RandomR2(0.5,9.9); //0.5+Random*9.49; //2018
dataN('',n,0,2,1);
case n of
1: begin
     dataR('a  = ',x,0,4,5);
     resultR('R_1 = ',x/(2*sqrt(3)),center(1,3,10,14),3,5);
     resultR('R_2 = ',x/sqrt(3),center(2,3,10,14),3,5);
     resultR('S  = ',x*x*sqrt(3)/4,center(3,3,10,14),3,5);
   end;
2: begin
     dataR('R_1 = ',x,0,4,5);
     resultR('a  = ',x*2*sqrt(3),center(1,3,10,14),3,5);
     resultR('R_2 = ',x*2,center(2,3,10,14),3,5);
     resultR('S  = ',3*sqrt(3)*x*x,center(3,3,10,14),3,5);
   end;
3: begin
     dataR('R_2 = ',x,0,4,5);
     resultR('a  = ',sqrt(3)*x,center(1,3,10,14),3,5);
     resultR('R_1 = ',x/2,center(2,3,10,14),3,5);
     resultR('S  = ',3*sqrt(3)*x*x/4,center(3,3,10,14),3,5);
   end;
4: begin
     x := x*10;
     dataR('S  = ',x,0,4,5);
     resultR('a  = ',2*sqrt(x/sqrt(3)),center(1,3,10,14),3,5);
     resultR('R_1 = ',sqrt(x/(3*sqrt(3))),center(2,3,10,14),3,5);
     resultR('R_2 = ',2*sqrt(x/(3*sqrt(3))),center(3,3,10,14),3,5);
   end;
end;
setNumberOfTests(9);
Pause;
end;



procedure SIfc60An46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Мастям игральных карт присвоены порядковые номера: 1~\= пики, 2~\= трефы,',0,1);
taskText('3~\= бубны, 4~\= червы. Достоинству карт, старших десятки, присвоены номера:',0,2);
taskText('11~\= валет, 12~\= дама, 13~\= король, 14~\= туз. Даны два целых числа: {N}~\=',0,3);
taskText('достоинство (6~\l~{N}~\l~14) и {M}~\= масть карты (1~\l~{M}~\l~4). Вывести название',0,4);
taskText('соответствующей карты вида \<шестерка бубен\>, \<дама червей\>, \<туз треф\> и~т.\,п.',0,5);
(*
*)
(*==*)
m := 1 + Random(4);
n := 6 + Random(9);
case curtest of //2012
3: m := 3;
4: m := 4;
6: m := 1;
8: m := 2;
end;
dataN('Достоинство: N = ',n,xLeft,3,2);
dataN('Масть: M = ',m,xRight,3,1);
case N of
6: s := 'шестерка';
7: s := 'семерка';
8: s := 'восьмерка';
9: s := 'девятка';
10: s := 'десятка';
11: s := 'валет';
12: s := 'дама';
13: s := 'король';
14: s := 'туз';
end;
case M of
1: s := s + ' пик';
2: s := s + ' треф';
3: s := s + ' бубен';
4: s := s + ' червей';
end;
resultS('',s,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дано целое число в\ диапазоне~20\:69, определяющее возраст (в\ годах).',0,2);
taskText('Вывести строку-описание указанного возраста, обеспечив',0,3);
taskText('правильное согласование числа со\ словом \<год\>, например:',0,4);
taskText('20~\= \<двадцать лет\>, 32~\= \<тридцать два года\>, 41~\= \<сорок один год\>.',0,5);
(*
*)
(*==*)
n := 2+Random(5);
case n of
2: s1 := 'двадцать';
3: s1 := 'тридцать';
4: s1 := 'сорок';
5: s1 := 'пятьдесят';
6: s1 := 'шестьдесят';
end;
m := Random(4);
case curtest of //2012
2: m := 2;
4: m := 0;
6: m := 1;
7: m := 3;
end;
case m of
0: begin
     n:=n*10;
     s1 := s1 + ' лет';
   end;
1: begin
     n:=n*10+1;
     s1 := s1 + ' один год';
   end;
2: begin
     n1 := Random(3)+2;
     n:=n*10+n1;
     s1 := s1 + ' '+digit(n1)+' года';
   end;
3: begin
     n1 := Random(5)+5;
     n:=n*10+n1;
     s1 := s1 + ' '+digit(n1)+' лет';
   end;
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Дано целое число в\ диапазоне~10\:40, определяющее количество учебных заданий',0,1);
taskText('по\ некоторой теме. Вывести строку-описание указанного количества заданий,',0,2);
taskText('обеспечив правильное согласование числа со\ словами \<учебное задание\>,',0,3);
taskText('например: 18~\= \<восемнадцать учебных заданий\>,',0,4);
taskText('23~\= \<двадцать три учебных задания\>, 31~\= \<тридцать одно учебное задание\>.',0,5);
(*
*)
(*==*)
n1 := Random(5);
case curtest of //2012
2: n1 := 4;
3: n1 := 3;
6: n1 := 0;
7: n1 := 2;
8: n1 := 1;
end;
case n1 of
0: m := (Random(2)+2)*10 + 1;
1: m := (Random(2)+2)*10 + 2+ Random(3);
2: m := 10 + Random(10);
3: m := (Random(3)+2)*10;
4: m := (Random(2)+2)*10 + 5+ Random(5);
end;
n := m div 10;
n1:= m mod 10;
s := ' учебных заданий';
case n1 of
0: s2 := s;
1: s2 := ' одно учебное задание';
2..4: s2 := ' '+ digit(n1)+' учебных задания';
5..9: s2 := ' '+digit(n1)+ s;
end;
case n of
1: begin
   case n1 of
     0: s1 := 'десять';
     1: s1 := 'одиннадцать';
     2: s1 := 'двенадцать';
     3: s1 := 'тринадцать';
     4: s1 := 'четырнадцать';
     5: s1 := 'пятнадцать';
     6: s1 := 'шестнадцать';
     7: s1 := 'семнадцать';
     8: s1 := 'восемнадцать';
     9: s1 := 'девятнадцать';
     end;
    s1 := s1 + s;
    end;
2: s1 := 'двадцать' + s2;
3: s1 := 'тридцать' + s2;
4: s1 := 'сорок' + s2;
end;
dataN('',m,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дано целое число в\ диапазоне~100\:999.',0,2);
taskText('Вывести строку-описание данного числа, например:',0,3);
taskText('256~\= \<двести пятьдесят шесть\>, 814~\= \<восемьсот четырнадцать\>.',0,4);
(*
*)
n := 1+Random(8);
case n of
1: s1 := 'сто';
2: s1 := 'двести';
3: s1 := 'триста';
4: s1 := 'четыреста';
5..9: s1 := digit(n)+'сот';
end;
m := Random(4);
case curtest of //2012
3: m := 3;
5: m := 1;
7: m := 2;
8: m := 0;
end;
case m of
0: begin
     n:=n*100;
   end;
1: begin
     n1 := 1+Random(9);
     n:=n*100+n1;
     s1 := s1 + ' '+digit(n1);
   end;
2: begin
     n1 := 10+Random(9);
     n:=n*100+n1;
     case n1 of
     10: s1 := s1 + ' десять';
     11: s1 := s1 + ' одиннадцать';
     12: s1 := s1 + ' двенадцать';
     13: s1 := s1 + ' тринадцать';
     14: s1 := s1 + ' четырнадцать';
     15: s1 := s1 + ' пятнадцать';
     16: s1 := s1 + ' шестнадцать';
     17: s1 := s1 + ' семнадцать';
     18: s1 := s1 + ' восемнадцать';
     19: s1 := s1 + ' девятнадцать';
     end;
   end;
3: begin
     n1 := 2+Random(8);
     n2 := Random(10);
     n:=n*100+n1*10+n2;
     case n1 of
     2: s1 := s1 + ' двадцать';
     3: s1 := s1 + ' тридцать';
     4: s1 := s1 + ' сорок';
     5..8: s1 := s1 + ' '+digit(n1)+'десят';
     9: s1 := s1 + ' девяносто';
     end;
     if n2<>0 then s1 := s1 + ' '+digit(n2);
   end;
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(8,0,0,0,v1,v2,v3);
taskText('В\ восточном календаре принят 60-летний цикл, состоящий из\ 12-летних подциклов,',0,1);
taskText('обозначаемых названиями цвета: зеленый, красный, желтый, белый и\ черный.',0,2);
taskText('В\ каждом подцикле годы носят названия животных: крысы, коровы, тигра, зайца,',0,3);
taskText('дракона, змеи, лошади, овцы, обезьяны, курицы, собаки и\ свиньи. По\ номеру года',0,4);
taskText('определить его название, если 1984~год\ \= начало цикла: \<год зеленой крысы\>.',0,5);
(*
*)
(*==*)
n := 1800+Random(300);
m := (n-1984+12000) mod 60; // исправил ошибку! 2016.12.11 (+12000)
//if m<0 then m := m + 60;
case m div 12 of
0: s1 := 'год зелено';
1: s1 := 'год красно';
2: s1 := 'год желто';
3: s1 := 'год бело';
4: s1 := 'год черно';
end;
case m mod 12 of
0: s1 := s1 + 'й крысы';
1: s1 := s1 + 'й коровы';
2: s1 := s1 + 'го тигра';
3: s1 := s1 + 'го зайца';
4: s1 := s1 + 'го дракона';
5: s1 := s1 + 'й змеи';
6: s1 := s1 + 'й лошади';
7: s1 := s1 + 'й овцы';
8: s1 := s1 + 'й обезьяны';
9: s1 := s1 + 'й курицы';
10: s1 := s1 + 'й собаки';
11: s1 := s1 + 'й свиньи';
end;
dataN('',n,0,3,4);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An51(Name, Key: string);
var v1,v2,v3 : byte;
    z: array [1..12] of string;
    d: array [1..12] of integer;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны два целых числа:~{D} (день) и~{M} (месяц), определяющие правильную дату.',0,1);
taskText('Вывести знак Зодиака, соответствующий этой дате: \<Водолей\> (20.1\:18.2), \<Рыбы\>',0,2);
taskText('(19.2\:20.3), \<Овен\> (21.3\:19.4), \<Телец\> (20.4\:20.5), \<Близнецы\> (21.5\:21.6),',0,3);
taskText('\<Рак\> (22.6\:22.7), \<Лев\> (23.7\:22.8), \<Дева\> (23.8\:22.9), \<Весы\> (23.9\:22.10),',0,4);
taskText('\<Скорпион\> (23.10\:22.11), \<Стрелец\> (23.11\:21.12), \<Козерог\> (22.12\:19.1).',0,5);
(*
*)
(*==*)
z[1] := 'Водолей'; z[2] := 'Рыбы'; z[3] := 'Овен'; z[4] := 'Телец'; z[5] := 'Близнецы';
z[6] := 'Рак'; z[7] := 'Лев'; z[8] := 'Дева'; z[9] := 'Весы'; z[10] := 'Скорпион';
z[11] := 'Стрелец'; z[12] := 'Козерог';
d[1] := 20; d[2] := 19; d[3] := 21; d[4] := 20; d[5] := 21; d[6] := 22;
d[7] := 23; d[8] := 23; d[9] := 23; d[10] := 23; d[11] := 23; d[12] := 22;
m := Random(12)+1;
n := Random(day[m-1])+1;
if n >= d[m] then s := z[m]
else
  if m>1 then s := z[m-1]
  else s := z[12];
dataN('D = ',n,xLeft,3,2);
dataN('M = ',m,xRight,3,2);
resultS('',s,0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60An52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An58(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

begin
Topic1 := 'УСЛОВНЫЙ ОПЕРАТОР';
Topic2 := 'ОПЕРАТОР ВЫБОРА';
{Author := 'М.~Э.~Абрамян, 2002';}
end.
