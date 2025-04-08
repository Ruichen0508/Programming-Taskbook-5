{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SFor65C4;

{$MODE Delphi}

interface

procedure SFor65Cn1(Name, Key: string);
procedure SFor65Cn2(Name, Key: string);
procedure SFor65Cn3(Name, Key: string);
procedure SFor65Cn4(Name, Key: string);
procedure SFor65Cn5(Name, Key: string);
procedure SFor65Cn6(Name, Key: string);
procedure SFor65Cn7(Name, Key: string);
procedure SFor65Cn8(Name, Key: string);
procedure SFor65Cn9(Name, Key: string);
procedure SFor65Cn10(Name, Key: string);
procedure SFor65Cn11(Name, Key: string);
procedure SFor65Cn12(Name, Key: string);
procedure SFor65Cn13(Name, Key: string);
procedure SFor65Cn14(Name, Key: string);
procedure SFor65Cn15(Name, Key: string);
procedure SFor65Cn16(Name, Key: string);
procedure SFor65Cn17(Name, Key: string);
procedure SFor65Cn18(Name, Key: string);
procedure SFor65Cn19(Name, Key: string);
procedure SFor65Cn20(Name, Key: string);
procedure SFor65Cn21(Name, Key: string);
procedure SFor65Cn22(Name, Key: string);
procedure SFor65Cn23(Name, Key: string);
procedure SFor65Cn24(Name, Key: string);
procedure SFor65Cn25(Name, Key: string);
procedure SFor65Cn26(Name, Key: string);
procedure SFor65Cn27(Name, Key: string);
procedure SFor65Cn28(Name, Key: string);
procedure SFor65Cn29(Name, Key: string);
procedure SFor65Cn30(Name, Key: string);
procedure SFor65Cn31(Name, Key: string);
procedure SFor65Cn32(Name, Key: string);
procedure SFor65Cn33(Name, Key: string);
procedure SFor65Cn34(Name, Key: string);
procedure SFor65Cn35(Name, Key: string);
procedure SFor65Cn36(Name, Key: string);
procedure SFor65Cn37(Name, Key: string);
procedure SFor65Cn38(Name, Key: string);
procedure SFor65Cn39(Name, Key: string);
procedure SFor65Cn40(Name, Key: string);
procedure SFor65Cn41(Name, Key: string);
procedure SFor65Cn42(Name, Key: string);
procedure SFor65Cn43(Name, Key: string);
procedure SFor65Cn44(Name, Key: string);
procedure SFor65Cn45(Name, Key: string);
procedure SFor65Cn46(Name, Key: string);
procedure SFor65Cn47(Name, Key: string);
procedure SFor65Cn48(Name, Key: string);
procedure SFor65Cn49(Name, Key: string);
procedure SFor65Cn50(Name, Key: string);
procedure SFor65Cn51(Name, Key: string);
procedure SFor65Cn52(Name, Key: string);
procedure SFor65Cn53(Name, Key: string);
procedure SFor65Cn54(Name, Key: string);
procedure SFor65Cn55(Name, Key: string);
procedure SFor65Cn56(Name, Key: string);
procedure SFor65Cn57(Name, Key: string);
procedure SFor65Cn58(Name, Key: string);
procedure SFor65Cn59(Name, Key: string);
procedure SFor65Cn60(Name, Key: string);
procedure SFor65Cn61(Name, Key: string);
procedure SFor65Cn62(Name, Key: string);
procedure SFor65Cn63(Name, Key: string);
procedure SFor65Cn64(Name, Key: string);
procedure SFor65Cn65(Name, Key: string);

implementation

uses PT5TaskMaker;

const Pi = 3.14;
      dir : array [0..3] of char = ('Ñ','Ç','Þ','Â');
      day : array [0..11] of integer = (31,28,31,30,31,30,31,31,30,31,30,31);

var Topic1,Topic2,Topic3,Author : string;
    a,b,c,a1,b1,c1,a2,b2,c2,d,x,y,x1,y1,x2,y2,z,x0 : real;
    i,j,k,m,m1,m2,m3,m4,n,n1,n2,n3,n4,a0,b0 : integer;
    s,s1,s2,s3,s4 : string;
    bln : Boolean;
    ai : array [1..10] of integer;

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
0: s1 := 'íîëü';
1: s1 := 'îäèí';
2: s1 := 'äâà';
3: s1 := 'òðè';
4: s1 := '÷åòûðå';
5: s1 := 'ïÿòü';
6: s1 := 'øåñòü';
7: s1 := 'ñåìü';
8: s1 := 'âîñåìü';
9: s1 := 'äåâÿòü';
end;
digit := s1;
end;


procedure SFor65Cn1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Given integers~{K} and~{N} ({N}~>~0), output the number~{K} {N}~times.',0,3);
(*
*)
(*==*)
k := integer(Random(29))-9;
n := 1 + Random(12);
dataN('K = ',k,xLeft,3,2);
dataN('N = ',n,xRight,3,2);
for i := 1 to n do
resultN('',k,center(i,n,2,4),3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given two integers~{A} and~{B} ({A}~<~{B}), output in ascending order',0,2);
taskText('all integers in the range~{A} to~{B} (including~{A} and~{B}).',0,3);
taskText('Also output the amount~{N} of these integers.',0,4);
(*
*)
(*==*)
repeat
a0 := integer(Random(20))-9;
b0 := integer(Random(20))-9;
m := b0-a0+1;
until (a0<b0) and (m<=10);
dataN('A = ',a0,xLeft,3,2);
dataN('B = ',b0,xRight,3,2);
for i := a0+j to b0-j do
  resultN('',i,center(i-a0+1,m,2,4),2,2);
resultN('N = ',m,0,4,2);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given two integers~{A} and~{B} ({A}~<~{B}), output in descending order',0,2);
taskText('all integers in the range~{A} to~{B} (excluding~{A} and~{B}).',0,3);
taskText('Also output the amount~{N} of these integers.',0,4);
(*
*)
(*==*)
repeat
a0 := integer(Random(20))-9;
b0 := integer(Random(20))-9;
m := (b0-a0+1)-2;
until (a0<b0) and (m<=10);
dataN('A = ',a0,xLeft,3,2);
dataN('B = ',b0,xRight,3,2);
for i := b0-1 downto a0+1 do
     resultN('',i,center(b0-i,m,2,4),2,2);
resultN('N = ',m,0,4,2);
setNumberOfTests(5);
Pause;
end;


procedure SFor65Cn4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given the price of 1~kg of sweets (as a\ real number),',0,2);
taskText('output the cost of 1, 2,~\., 10~kg of these sweets.',0,4);
(*
*)
(*==*)
a := (100 + Random(900))/10;
dataR('',a,0,3,5);
for i := 1 to 10 do
  resultR('',i*a,center(i,10,6,2),3,6);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Given the price of 1~kg of sweets (as a\ real number),',0,2);
taskText('output the cost of 0.1, 0.2,~\., 1~kg of these sweets.',0,4);
(*
*)
a := (100 + Random(900))/10;
dataR('',a,0,3,5);
for i := 1 to 10 do
  resultR('',i*a/10,center(i,10,6,2),3,6);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Given the price of 1~kg of sweets (as a\ real number),',0,2);
taskText('output the cost of 1.2, 1.4,~\., 2~kg of these sweets.',0,4);
(*
*)
(*==*)
a := (100 + Random(900))/10;
dataR('',a,0,3,5);
for i := 1 to 5 do
  resultR('',(1+i/5)*a,center(i,5,6,2),3,6);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Given two integers~{A} and~{B} ({A}~<~{B}),',0,2);
taskText('find the sum of all integers in the range~{A} to~{B} inclusive.',0,4);
(*
*)
(*==*)
a0 := integer(Random(15))-9;
b0 := a0+ 1 + Random(10);
dataN('A = ',a0,xLeft,3,2);
dataN('B = ',b0,xRight,3,2);
n := 0;
for i := a0 to b0 do
  n := n + i;
resultN('',n,0,3,3);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Given two integers~{A} and~{B} ({A}~<~{B}),',0,2);
taskText('find the product of all integers in the range~{A} to~{B} inclusive.',0,4);
(*
*)
(*==*)
a0 := integer(Random(15))-9;
b0 := a0+ 1 + Random(4);
dataN('A = ',a0,xLeft,3,2);
dataN('B = ',b0,xRight,3,2);
n := 1;
for i := a0 to b0 do
begin
  n := n * i;
end;
resultN('',n,0,3,6);
setNumberOfTests(4);
Pause;
end;

procedure SFor65Cn9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Given two integers~{A} and~{B} ({A}~<~{B}),',0,2);
taskText('find the sum of squares of all integers in the range~{A} to~{B} inclusive.',0,4);
(*
*)
(*==*)
a0 := integer(Random(8))-5;
b0 := a0+ 1 + Random(4);
dataN('A = ',a0,xLeft,3,2);
dataN('B = ',b0,xRight,3,2);
n := 0;
for i := a0 to b0 do
  n := n + i*i;
resultN('',n,0,3,4);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0),',0,2);
taskText('find the value of a\ following sum (as a\ real number):',0,3);
taskText('\[ 1\;+\;1/2\;+\;1/3\;+\;\.\;+\;1/{N}.\]',0,4);
(*
*)
(*==*)
case Random(3) of
0 : n := 1 + Random(2);
1,2 : n := 3 + Random(12);
end;
dataN('N = ',n,0,3,1);
d := 0;
for i := 1 to n do
  d := d + 1/i;
setPrecision(6);
resultR('',d,0,3,8);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0),',0,2);
taskText('find the value of a\ following sum (as an integer):',0,3);
taskText('\[ {N}^2\;+\;({N}\,+\,1)^2\;+\;({N}\,+\,2)^2\;+\;\.\;+\;(2\*{N})^2.\]',0,4);
(*
*)
(*==*)
case Random(3) of
0 : n := 1 + Random(2);
1,2 : n := 3 + Random(8);
end;
dataN('N = ',n,0,3,1);
k := 0;
for i := n to 2*n do
  k := k + i*i;
resultN('',k,0,3,4);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0),',0,2);
taskText('find the value of a\ following product of {N}~factors:',0,3);
taskText('\[ 1.1\,\*\,1.2\,\*\,1.3\,\*\,\.\;.\]',0,4);
(*
*)
case Random(3) of
0 : n := 1 + Random(2);
1,2 : n := 3 + Random(8);
end;
dataN('N = ',n,0,3,1);
d := 1;
for i := 1 to n do
  d := d * (1+i*0.1);
setPrecision(6);
resultR('',d,0,3,8);
setNumberOfTests(3);
pause;
end;

procedure SFor65Cn13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), find the value',0,2);
taskText('of the following expression of {N}~terms with alternating signs:',0,3);
taskText('\[ 1.1\;\-\;1.2\;+\;1.3\;\-\;\.\;.\] Do not use conditional statements.',0,4);
(*
*)
case Random(3) of
0 : n := 1 + Random(2);
1,2 : n := 3 + Random(12);
end;
dataN('N = ',n,0,3,1);
d := 0;
k := 1;
for i := 1 to n do
  begin
  d := d + k*(1+i*0.1);
  k := -k;
  end;
resultR('',d,0,3,5);
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), compute~{N}^2 by means of the formula',0,2);
taskText('\[{N}^2~=~1\;+\;3\;+\;5\;+\;\.\;+\;(2\*{N}\,\-\,1).\]',0,3);
taskText('Output the value of the sum after addition of each term.',0,4);
taskText('As a\ result, squares of all integers in the range~1 to~{N} will be output.',0,5);
(*
*)
(*==*)
case Random(3) of
0 : n := 1 + Random(2);
1,2 : n := 3 + Random(8);
end;
dataN('N = ',n,0,3,1);
k := 0;
for i := 1 to n do
  begin
  k := k + (2*i-1);
  resultN('',k,center(i,n,2,3),3,2);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Given a real number~{A} and an integer~{N} (>\,0),',0,2);
taskText('find~{A} raised to the power~{N} (i.~e., the product of~{N} values of~{A}):',0,3);
taskText('\[{A}^N = {A}\*{A}\*\,\.\,\*{A}.\]',0,4);
(*
*)
x := integer(Random(19))-9;
n := Random(10)+1;
y := 1;
for i := 1 to n do
  y := y*x;
dataR('A = ',x,xLeft,3,5);
dataN('N = ',n,xRight,3,1);
resultR('A^N = ',y,0,3,5);
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('A real number~{A} and an integer~{N} (>\,0) are given.',0,2);
taskText('Using one loop-statement compute and output powers~{A}^K',0,3);
taskText('for all integer exponents~{K} in the range~1 to~{N}.',0,4);
(*
Îðãàíèçîâàòü âûâîä äàííûõ â\ öèêëå (êàê â\ çàäàíèè \2).
*)
x := integer(Random(19))-9;
n := Random(6)+1;
y := 1;
dataR('A = ',x,xLeft,3,5);
dataN('N = ',n,xRight,3,1);
for i := 1 to n do
  begin
  y := y*x;
  resultR('',y,center(i,n,6,6),3,6);
  end;
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,0,0,0,v1,v2,v3);
taskText('A real number~{A} and an integer~{N} (>\,0) are given.',0,2);
taskText('Using one loop-statement compute the sum',0,3);
taskText('  \[1\;+\;{A}\;+\;{A}^2\;+\;{A}^3\;+\;\.\;+\;{A}^N.\]',0,4);
(*
*)
(*==*)
x := integer(Random(19))-9;
n := Random(5)+1;
y := 1;
z := 1;
dataR('A = ',x,xLeft,3,5);
dataN('N = ',n,xRight,3,1);
for i := 1 to n do
  begin
  y := y*x;
  z := z + y;
  end;
resultR('',z,0,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('A real number~{A} and an integer~{N} (>\,0) are given.',0,2);
taskText('Using one loop-statement compute the expression',0,3);
taskText('\[1\;\-\;{A}\;+\;{A}^2\;\-\;{A}^3\;+\;\.\;+\;(\-1)^N\*{A}^N.\]',0,4);
taskText('Do not use conditional statements.',0,5);
(*
*)
(*==*)
x := integer(Random(19))-9;
n := Random(5)+1;
y := 1;
z := 1;
dataR('A = ',x,xLeft,3,5);
dataN('N = ',n,xRight,3,1);
for i := 1 to n do
  begin
  y := -y*x;
  z := z + y;
  end;
resultR('',z,0,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0),',0,2);
taskText('find the value of a following product:\[ {N}!~=~1\*2\*\.\*{N}\]',0,3);
taskText('(\I{N}\:factorial\i). To avoid the integer overflow, compute the product',0,4);
taskText('using a\ real variable and output the result as a\ real number.',0,5);
(*
*)
n := Random(12)+1;
x := 1;
dataN('N = ',n,0,3,1);
while n>0 do
  begin
    x := x*n;
    n := n-1;
  end;
str(x:0:2,s3);
resultR('N! = ',x,0,3,length(s3));
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,0) is given. Using one loop-statement compute the sum',0,1);
taskText('\[1!\;+\;2!\;+\;3!\;+\;\.\;+\;{N}!, \]where {N}! (\I{N}\:factorial\i) is the product',0,2);
taskText(' of all integers in the range~1 to~{N}:\q   {N}!~=~1\*2\*\.\*{N}.',0,3);
taskText('To avoid the integer overflow, compute the sum',0,4);
taskText('using real variables and output the result as a\ real number.',0,5);
(*
*)
n := Random(12)+1;
dataN('N = ',n,0,3,1);
x := 0;
y := 1;
for i := 1 to n do
begin
y := y*i;
x := x + y;
end;
str(x:0:2,s3);
resultR('',x,0,3,length(s3));
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,0) is given. Using one loop-statement compute the sum',0,1);
taskText('\[1\;+\;1/(1!)\;+\;1/(2!)\;+\;1/(3!)\;+\;\.\;+\;1/({N}!),\]',0,2);
taskText('where {N}! (\I{N}\:factorial\i) is the product of all integers',0,3);
taskText('in the range~1 to~{N}:\q   {N}!~=~1\*2\*\.\*{N}.',0,4);
taskText('The result is an approximate value of the constant {e}~=~exp(1).',0,5);
(*
*)
(*==*)
n := Random(9)+1;
dataN('N = ',n,0,3,1);
x := 1;
y := 1;
for i := 1 to n do
begin
y := y/i;
x := x + y;
end;
setPrecision(8);
resultR('',x,0,2,10);
Str(exp(1):0:8,s3);
resultComment('Remark: exp(1) approximately equals '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(2,0,0,0,v1,v2,v3);
taskText('A real number~{X} and an integer~{N} (>\,0) are given. Compute the expression',0,2);
taskText('\[1\;+\;{X}\;+\;{X}^2/(2!)\;+\;\.\;+\;{X}^N/({N}!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). The result is an approximate value of exp({X}).',0,4);
(*
*)
(*==*)
n := Random(9)+1;
x := Random*4-2;
setPrecision(8);
dataR('X = ',x,xLeft,3,10);
dataN('N = ',n,xRight,3,1);
z := 1;
y := 1;
for i := 1 to n do
begin
y := y*x/i;
z := z + y;
end;
resultR('',z,0,2,10);
Str(exp(x):0:8,s3);
resultComment('Remark: exp(X) approximately equals '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
s2 := 'sin';
taskText('A real number~{X} and an integer~{N} (>\,0) are given. Compute the expression',0,2);
taskText('\[  {X}\;\-\;{X}^3/(3!)\;+\;{X}^5/(5!)\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N+1}/((2\*{N}+1)!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). The result is an approximate value of sin({X}).',0,4);
(*
*)
   end;
2: begin
s2 := 'cos';
taskText('A real number~{X} and an integer~{N} (>\,0) are given. Compute the expression',0,2);
taskText('\[1\;\-\;{X}^2/(2!)\;+\;{X}^4/(4!)\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N}/((2\*{N})!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). The result is an approximate value of cos({X}).',0,4);
(*
*)
   end;
end;
(*==*)
n := Random(9)+1;
x := Random*4-2;
setPrecision(8);
dataR('X = ',x,xLeft,3,10);
dataN('N = ',n,xRight,3,1);
case v1 of
1: begin y := x; Str(sin(x):0:8,s3); end;
2: begin y := 1; Str(cos(x):0:8,s3); end;
end;
z := y;
for i := 1 to n do
begin
  case v1 of
  1: y := -y*x*x/((2*i)*(2*i+1));
  2: y := -y*x*x/((2*i-1)*(2*i));
  end;
  z := z + y;
end;
resultR('',z,0,2,10);
resultComment('Remark: '+s2+'(X) approximately equals '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,2,0,0,v1,v2,v3);
case v1 of
1: begin
         s2 := 'ln(1+X)';
taskText('A real number~{X} (|{X}|\,<\,1) and an integer~{N} (>\,0) are given.',0,2);
taskText('Compute the expression',0,3);
taskText('\[{X}\;\-\;{X}^2/2\;+\;{X}^3/3\;\-\;\.\;+\;(\-1)^{N\-1}\*{X}^N/{N}.\]',0,4);
taskText('The result is an approximate value of ln(1\,+\,{X}).',0,5);
(*
*)
   end;
2: begin
         s2 := 'atan(X)';
taskText('A real number~{X} (|{X}|\,<\,1) and an integer~{N} (>\,0) are given.',0,2);
taskText('Compute the expression',0,3);
taskText('\[{X}\;\-\;{X}^3/3\;+\;{X}^5/5\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N+1}/(2\*{N}+1).\]',0,4);
taskText('The result is an approximate value of atan({X}).',0,5);
(*
*)
   end;
end;
(*==*)
n := Random(9)+1;
x := Random*1.9-0.95;
setPrecision(8);
dataR('X = ',x,xLeft,3,10);
dataN('N = ',n,xRight,3,1);
case v1 of
1: begin
     y := -1;
     z := 0;
     Str(ln(x+1):0:8,s3);
     for i := 1 to n do
     begin
       y := -y*x;
       z := z + y/i;
     end;
   end;
2: begin
     y := x;
     z := x;
     Str(arctan(x):0:8,s3);
     for i := 1 to n do
     begin
       y := -y*x*x;
       z := z + y/(2*i+1);
     end;
   end;
end;
resultR('',z,0,2,10);
resultComment('Remark: '+s2+' approximately equals '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,2,0,0,v1,v2,v3);
case v1 of
1: begin
         s2 := 'asin(X)';
taskText('A real number~{X} (|{X}|\,<\,1) and an integer~{N} (>\,0) are given.',0,1);
taskText('Compute the expression',0,2);
taskText('\[{X}\;+\;1\*{X}^3/(2\*3)\;+\;1\*3\*{X}^5/(2\*4\*5)\;+\;\.\;+\|',0,3);
taskText('+\;1\*3\*\.\*(2\*{N}\-1)\*{X}^{2\*N+1}/(2\*4\*\.\*(2\*{N})\*(2\*{N}+1)).\]',0,4);
taskText('The result is an approximate value of asin({X}).',0,5);
(*
*)
   end;
2: begin
         s2 := '\R1+X\r';
taskText('A real number~{X} (|{X}|\,<\,1) and an integer~{N} (>\,0) are given.',0,1);
taskText('Compute the expression',0,2);
taskText('\[1\;+\;{X}/2\;\-\;1\*{X}^2/(2\*4)\;+\;1\*3\*{X}^3/(2\*4\*6)\;\-\;\.\;+\|',0,3);
taskText('+\;(\-1)^{N\-1}\*1\*3\*\.\*(2\*{N}\-3)\*{X}^N/(2\*4\*\.\*(2\*{N})).\]',0,4);
taskText('The result is an approximate value of the square root of~1\,+\,{X}.',0,5);
(*
*)
   end;
end;
(*==*)
n := Random(9)+1;
x := Random*1.9-0.95;
setPrecision(8);
dataR('X = ',x,xLeft,3,10);
dataN('N = ',n,xRight,3,1);
case v1 of
1: begin
     y := x;
     z := x;
     Str(ArcTan (x/sqrt (1-sqr (x))):0:8,s3);
     for i := 1 to n do
     begin
       y := y*x*x*(2*i-1)/(2*i);
       z := z + y/(2*i+1);
     end;
   end;
2: begin
     y := 1;
     z := 1;
     Str(sqrt(x+1):0:8,s3);
     for i := 1 to n do
     begin
       y := -y*x*(2*i-3)/(2*i);
       z := z + y;
     end;
   end;
end;
resultR('',z,0,2,10);
resultComment('Remark: '+s2+' approximately equals '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(5,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) and two points {A},\;{B} ({A}~<~{B}) on the real axis are given.',0,1);
taskText('The segment [{A},\;{B}] is divided into~{N} sub-segments of equal length.',0,2);
taskText('Output the length~{H} of each sub-segment and then output the sequence of points',0,3);
taskText('\[ {A},\q {A}\;+\;{H},\q {A}\;+\;2\*{H},\q {A}\;+\;3\*{H},\q \.,\q {B},\]',0,4);
taskText('which forms a partition of the segment [{A},\;{B}].',0,5);
(*
*)
(*==*)
n := 3+Random(7);
repeat
x := Int(10*Random*9.9)/10;
y := Int(10*Random*9.9)/10;
until x<y;
dataN('N = ',n-1,0,2,1);
dataR('A = ',x,xLeft,4,4);
dataR('B = ',y,xRight,4,4);
z := (y-x)/(n-1);
setprecision(5);
resultR('H = ',z,0,2,7);
resultComment('Partition of the segment:',0,3);
for i := 1 to n do
  resultR('',x+(i-1)*z,center(i,n,7,1),4,7);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) and two points {A},\;{B} ({A}~<~{B}) on the real axis are given.',0,1);
taskText('The segment [{A},\;{B}] is divided into~{N} sub-segments of equal length.',0,2);
taskText('Output the length~{H} of each sub-segment and then output the values',0,3);
taskText('of a function {F}({X})~=~1\;\-\;sin({X}) at points dividing the segment [{A},\;{B}]:',0,4);
taskText('\[{F}({A}),\q {F}({A}\;+\;{H}),\q {F}({A}\;+\;2\*{H}),\q \.,\q {F}({B}).\]',0,5);
(*
*)
(*==*)
n := 3+Random(7);
repeat
x := Pi*Random(5)/2;
y := Pi*Random(5)/2;
until x<y;
dataN('N = ',n-1,0,2,1);
dataR('A = ',x,xLeft,4,4);
dataR('B = ',y,xRight,4,4);
z := (y-x)/(n-1);
setprecision(5);
resultR('H = ',z,0,2,7);
resultComment('Values of the function:',0,3);
for i := 1 to n do
  begin
  x0 := x+(i-1)*z;
  resultR('',1-sin(x0),center(i,n,7,1),4,7);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,2,0,0,v1,v2,v3);
if v1 = 1 then
  begin
  a := 2;
taskText('An integer~{N} (>\,0) is given.',0,2);
taskText('A\ sequence of real numbers~{A}_{K} is defined as:',0,3);
taskText('\[{A}_{0}~=~2,\Q    {A}_{K}~=~2\;+\;1/{A}_{K\-1},\q  {K}~=~1,\,2,\,\.~.\]',0,4);
taskText('Output terms {A}_{1}, {A}_{2},~\.,~{A}_{N} of the sequence.',0,5);
(*
*)
  end
else
  begin
  a := 1;
taskText('An integer~{N} (>\,0) is given.',0,2);
taskText('A\ sequence of real numbers~{A}_{K} is defined as:',0,3);
taskText('\[{A}_{0}~=~1,\Q    {A}_{K}~=~({A}_{K\-1}\;+\;1)/{K},\q  {K}~=~1,\,2,\,\.~.\]',0,4);
taskText('Output terms {A}_{1}, {A}_{2},~\.,~{A}_{N} of the sequence.',0,5);
(*
*)
  end;
(*==*)
n := 1+Random(7);
dataN('N = ',n,0,3,1);
setPrecision(6);
for i := 1 to n do
   begin
     if v1 = 1 then a := 2 + 1/a
               else a := (a+1)/i;
     resultR('',a,center(i,n,8,3),3,8);
   end;
setNumberOfTests(3);
Pause;
end;



procedure SFor65Cn29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,0) is given.',0,2);
taskText('An integer-valued sequence of the \IFibonacci numbers\i~{F}_{K} is defined as:',0,3);
taskText('\[{F}_{1}~=~1,\Q    {F}_{2}~=~1,\Q    {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\,4,\,\.~.\]',0,4);
taskText('Output terms {F}_{1}, {F}_{2},~\.,~{F}_{N} of the sequence.',0,5);
(*
*)
n := 2+Random(11);
dataN('N = ',n,0,3,1);
n1 := 1;
n2 := 1;
resultN('',1,center(1,n,2,4),3,2);
resultN('',1,center(2,n,2,4),3,2);
for i := 3 to n do
   begin
     k := n1 + n2;
     resultN('',k,center(i,n,2,4),3,2);
     n1 := n2;
     n2 := k;
   end;
setNumberOfTests(3);
pause;
end;

procedure SFor65Cn30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) is given.',0,2);
taskText('A\ sequence of real numbers~{A}_{K} is defined as:',0,3);
taskText('\[{A}_{1}~=~1,\Q    {A}_{2}~=~2,\Q    {A}_{K}~=~({A}_{K\-2}\;+\;2\*{A}_{K\-1})/3,\q  {K}~=~3,\,4,\,\.~.\]',0,4);
taskText('Output terms {A}_{1}, {A}_{2},~\.,~{A}_{N} of the sequence.',0,5);
(*
*)
(*==*)
n := 2+Random(6);
dataN('N = ',n,0,3,1);
a1 := 1;
a2 := 2;
setPrecision(6);
resultR('',1,center(1,n,8,3),3,8);
resultR('',2,center(2,n,8,3),3,8);
for i := 3 to n do
   begin
     a := (a1 + 2*a2)/3;
     resultR('',a,center(i,n,8,3),3,8);
     a1 := a2;
     a2 := a;
   end;
setNumberOfTests(3);
Pause;
end;

procedure SFor65Cn31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,2) is given.',0,1);
taskText('A\ sequence of integers~{A}_{K} is defined as:',0,2);
taskText('\[{A}_{1}~=~1,\Q    {A}_{2}~=~2,\Q    {A}_{3}~=~3,',0,3);
taskText('\Q{A}_{K}~=~{A}_{K\-1}\;+\;{A}_{K\-2}\;\-\;2\*{A}_{K\-3},\q  {K}~=~4,\,5,\,\.~.\]',0,4);
taskText('Output terms {A}_{1}, {A}_{2},~\.,~{A}_{N} of the sequence.',0,5);
(*
*)
(*==*)
n := 3+Random(10); //fixed 2017.01
dataN('N = ',n,0,3,1);
n1 := 1;
n2 := 2;
n3 := 3;
resultN('',n1,center(1,n,2,4),3,2);
resultN('',n2,center(2,n,2,4),3,2);
resultN('',n3,center(3,n,2,4),3,2);
for i := 4 to n do
   begin
     k := n2 + n3 - 2*n1;
     resultN('',k,center(i,n,2,4),3,2);
     n1 := n2;
     n2 := n3;
     n3 := k;
   end;
setNumberOfTests(3);
Pause;
end;



procedure SFor65Cn32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('ÔÎÐÌÓËÈÐÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ÐÅÇÓËÜÒÈÐÓÞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;





procedure SFor65Cn33(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Given positive integers~{N} and~{K}, find the sum\[ 1^K\;+\;2^K\;+\;\.\;+\;{N}^K.\]',0,2);
taskText('To avoid the integer overflow, compute the sum',0,3);
taskText('using real variables and output the result as a real number.',0,4);
(*
*)
case Random(3) of
0,1 : begin k := 1 + Random(5);
            n := 1 + Random(5);
      end;
2 :   begin k := 1 + Random(10);
            n := 1 + Random(10);
      end;
end;
a := 0;
for i := 1 to k do
  begin
  b := 1;
  for j := 1 to n do
    b := b * i;
  a := a + b;
  end;
dataN('N = ',k,xLeft,3,1);
dataN('K = ',n,xRight,3,1);
str(a:0:2,s);
resultR('',a,0,3,length(s));
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(2,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Given an integer~{N} (>\,0), find the sum\[ 1^1\;+\;2^2\;+\;\.\;+\;{N}^N.\]',0,2);
taskText('To avoid the integer overflow, compute the sum',0,3);
taskText('using real variables and output the result as a real number.',0,4);
(*
*)
end
else
begin
taskText('Given an integer~{N} (>\,0), find the sum\[ 1^N\;+\;2^{N\-1}\;+\;\.\;+\;{N}^1.\]',0,2);
taskText('To avoid the integer overflow, compute the sum',0,3);
taskText('using real variables and output the result as a real number.',0,4);
(*
*)
end;
(*==*)
case Random(3) of
0,1 : n := 1 + Random(5);
2 :   n := 1 + Random(10);
end;
a := 0;
for i := 1 to n do
  begin
  b := 1;
  if v1 =1 then
  for j := 1 to i do
    b := b * i
  else
  for j := 1 to n-i+1 do
    b := b * i;
  a := a + b;
  end;
dataN('N = ',n,0,3,1);
str(a:0:2,s);
resultR('',a,0,3,length(s));
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Positive integers~{A} and~{B} ({A}~<~{B}) are given.',0,2);
taskText('Output all integers in the range~{A} to~{B},',0,3);
taskText('with an integer of a\ value~{K} being output {K}~times',0,4);
taskText('(for example, the number~3 must be output 3~times).',0,5);
(*
*)
(*==*)
while True do
  begin
  n1 := 1 + Random(8);
  n2 := n1 + 1 + Random(5);
  k := 0;
  for i := n1 to n2 do
    k := k + i;
  if k <= 20 then break;
  end;
dataN('A = ',n1,xLeft,3,1);
dataN('B = ',n2,xRight,3,1);
m := 0;
for i := n1 to n2 do
  for j := 1 to i do
    begin
      m := m + 1;
      resultN('',i,center(m,k,2,2),3,2);
    end;
setNumberOfTests(5);
Pause;
end;



procedure SFor65Cn36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Integers~{A} and~{B} ({A}~<~{B}) are given.',0,2);
taskText('Output all integers in the range~{A} to~{B}, with the number~{A}',0,3);
taskText('being output once, the number~{A}\;+\;1 being output twice, and so\ on.',0,4);
(*
*)
(*==*)
  n1 := 0 + Random(21);
  n2 := n1 + 1 + Random(5);
  k := 0;
  for i := 1 to n2-n1+1 do
    k := k + i;

dataN('A = ',n1,xLeft,3,2);
dataN('B = ',n2,xRight,3,2);
m := 0;
n := 0;
for i := n1 to n2 do
  begin
  m := m + 1;
  for j := 1 to m do
    begin
      n := n + 1;
      resultN('',i,center(n,k,2,1),3,2);
    end;
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('ÔÎÐÌÓËÈÐÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ÐÅÇÓËÜÒÈÐÓÞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;


procedure SFor65Cn38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});(*DEMO*)
getVariant(10,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Two positive real numbers~{A} and~{B} ({A}~>~{B}) are given.',0,1);
taskText('A\ segment of length~{A} contains the greatest possible amount',0,2);
taskText('of segments of length~{B} (without overlaps).',0,3);
taskText('Not using multiplication and division,',0,4);
taskText('find the length of unused part of the segment~{A}.',0,5);
(*
*)
end
else
begin
taskText('Two positive real numbers~{A} and~{B} ({A}~>~{B}) are given.',0,1);
taskText('A\ segment of length~{A} contains the greatest possible amount',0,2);
taskText('of segments of length~{B} (without overlaps).',0,3);
taskText('Not using multiplication and division,',0,4);
taskText('find the amount of segments~{B}, which are placed on the segment~{A}.',0,5);
(*
*)
end;
a := 20 + Random(51) + Random(100)/100;
b := 2 + Random(18) + Random(100)/100;
dataR('A = ',a,xleft,3,5);
dataR('B = ',b,xright,3,5);
n := trunc(a/b);
if v1 = 1 then
resultR('Length of unused part: ',a-n*b,0,3,5)
else
resultN('Amount of segments B: ',n,0,3,2);
setNumberOfTests(3);
pause;
end;



procedure SFor65Cn39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Two positive integers~{N} and~{K} are given.',0,2);
taskText('Using addition and subtraction only, find a quotient',0,3);
taskText('of the integer division~{N} on~{K} and also a remainder after this division.',0,4);
(*
*)
(*==*)
n := 1 + Random(99);
k := 1 + Random(49);
dataN('N = ',n,xleft,3,2);
dataN('K = ',k,xright,3,2);
resultN('Quotient: ',n div k,xLeft,3,2);
resultN('Remainder: ',n mod k,xRight,3,2);
setNumberOfTests(5);
Pause;
end;




procedure SFor65Cn40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,0) is given.',0,2);
taskText('If it equals~3 raised to some integer power',0,3);
taskText('then output \t, otherwise output \f.',0,4);
(*
*)
m := Random(2);
k := -1;
case curtest of //2012
2: m := 1;
4: m := 0;
5: begin m := 0; k := 0; end;
end;
if m=0 then
begin
if k = -1 then
  k := Random(8);
n := 1;
for i := 1 to k do
  n := n * 3;
end
else
begin
k := -1;
case Random(3) of
0: n := 2 + Random(99);
1: n := 2 + Random(499);
2: n := 2 + Random(2999);
end;
m := 1;
while m<n do
  m := m * 3;
if m = n then k := 0;
end;
dataN('N = ',n,0,3,1);
resultB('',k<>-1,0,3);
setNumberOfTests(6);
pause;
end;

procedure SFor65Cn41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0)',0,2);
taskText('that equals~2 raised to some integer power: {N}~=~2^K,',0,3);
taskText('find the exponent~{K} of the power.',0,4);
(*
*)
(*==*)
k := Random(15);
if curtest = 3 then //2012
  k := 0;
n := 1;
for i := 1 to k do
  n := n * 2;
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
setNumberOfTests(6);
Pause;
end;

procedure SFor65Cn42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('',0,1);
taskText('Given an integer~{N} (>\,0), compute the \Idouble factorial of~{N}\i:',0,1);
taskText('\[{N}!!~=~{N}\*({N}\-2)\*({N}\-4)\*\.,\]',0,2);
taskText('where the last factor equals~2 if~{N} is an even number, and~1 otherwise.',0,3);
taskText('To avoid the integer overflow, compute the double factorial',0,4);
taskText('using a\ real variable and output the result as a\ real number.',0,5);
(*
*)
(*==*)
case Random(2) of
0: n := Random(6)+1;
1: n := Random(20)+1;
end;
x := 1;
str(n,s3);
dataN('N = ',n,0,3,length(s3));
while n>0 do
  begin
    x := x*n;
    n := n-2;
  end;
str(x:0:2,s3);
resultR('',x,0,3,length(s3));
setNumberOfTests(5);
Pause;
end;



procedure SFor65Cn43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), find the smallest positive integer~{K}',0,2);
taskText('such that its square is greater than~{N}: {K}^2~>~{N}.',0,3);
taskText('Do not use the operation of extracting a\ root.',0,4);
(*
*)
case Random(5) of
0: n := Random(2)+2;
1: n := Random(7)+3;
2: n := Random(90)+10;
3: n := Random(5000)+10;
4: begin
     m := 1+Random(6);
     n := m*m;
   end;
end;
if curtest = 4 then //2012
  begin
     m := 1+Random(6);
     n := m*m;
   end;
m := 1;
k := 1;
repeat
Inc(k);
m := k*k;
until m>n;
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), find the largest integer~{K}',0,2);
taskText('such that its square is not greater than~{N}: {K}^2~\l~{N}.',0,3);
taskText('Do not use the operation of extracting a\ root.',0,4);
(*
*)
(*==*)
case Random(5) of
0: n := Random(2)+2;
1: n := Random(7)+3;
2: n := Random(90)+10;
3: n := Random(5000)+10;
4: begin
     m := 1+Random(6);
     n := m*m;
   end;
end;
if curtest = 3 then //2012
  begin
     m := 1+Random(6);
     n := m*m;
   end;
m := 1;
k := 1;
repeat
Inc(k);
m := k*k;
bln := m>n;
until bln;
Dec(k);
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,1), find the smallest integer~{K}',0,2);
taskText('such that the inequality 3^K~>~{N} is fulfilled.',0,4);
(*
*)
(*==*)
case Random(5) of
0: n := Random(2)+2;
1: n := Random(7)+3;
2: n := Random(90)+10;
3: n := Random(5000)+10;
4: begin
     n := 1;
     m := 1+Random(6);
     for i := 1 to m do
       n := n*3;
   end;
end;
if curtest = 2 then //2012
  begin
     n := 1;
     m := 1+Random(6);
     for i := 1 to m do
       n := n*3;
   end;
m := 1;
k := -1;
repeat
Inc(k);
bln := m>n;
m := m*3;
until bln;
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
{resultN('3^K = ',m div 3,xRight,3,2);}
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,1), find the largest integer~{K}',0,2);
taskText('such that the inequality 3^K~<~{N} is fulfilled.',0,4);
(*
*)
(*==*)
case Random(5) of
0: n := Random(2)+2;
1: n := Random(7)+3;
2: n := Random(90)+10;
3: n := Random(5000)+10;
4: begin
     n := 1;
     m := 1+Random(6);
     for i := 1 to m do
       n := n*3;
   end;
end;
if curtest = 3 then //2012
  begin
     n := 1;
     m := 1+Random(6);
     for i := 1 to m do
       n := n*3;
   end;
m := 1;
k := -1;
repeat
Inc(k);
bln := m>=n;
m := m*3;
until bln;
m := m div 3;
Dec(k);
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
{resultN('3^K = ',m div 3,xRight,3,2);}
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) is given. Find the smallest integer~{K}',0,2);
taskText('such that the sum 1\;+\;2\;+\;\.\;+\;{K} is greater than or equal to~{N}.',0,3);
taskText('Output~{K} and the corresponding sum.',0,4);
(*
*)
k := Random(3);
case k of
0: n := Random(9) + 2;
1: n := Random(40)+11;
2: n := Random(450)+51;
end;
n1 := 1;
k := 1;
while n1<n do
  begin
    inc(k);
    n1 := n1 + k;
  end;
dataN('N = ',n,0,3,2);
resultN('K = ',k,xLeft,3,2);
resultN('Sum: ',n1,xRight,3,2);
setNumberOfTests(5);
pause;
end;

procedure SFor65Cn48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) is given. Find the largest integer~{K}',0,2);
taskText('such that the sum 1\;+\;2\;+\;\.\;+\;{K} is less than or equal to~{N}.',0,3);
taskText('Output~{K} and the corresponding sum.',0,4);
(*
*)
k := Random(3);
case k of
0: n := Random(9) + 2;
1: n := Random(40)+11;
2: n := Random(450)+51;
end;
n1 := 1;
k := 1;
while n1<=n do
  begin
    inc(k);
    n1 := n1 + k;
  end;
n1 := n1 - k;
dataN('N = ',n,0,3,2);
resultN('K = ',k-1,xLeft,3,2);
resultN('Sum: ',n1,xRight,3,2);
setNumberOfTests(5);
pause;
end;



procedure SFor65Cn49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('A real number~{A} (>\,1) is given. Find the smallest integer~{K}',0,2);
taskText('such that the sum 1\;+\;1/2\;+\;\.\;+\;1/{K} is greater than~{A}.',0,3);
taskText('Output~{K} and the corresponding sum.',0,4);
(*
*)
(*==*)
k := Random(3);
case k of
0: x := Random(2)+1+Random+0.1;
1: x := Random(3)+3+Random;
2: x := Random(3)+6+Random;
end;
y := 1;
n := 1;
while y<x do
  begin
    inc(n);
    y := y + 1/n;
  end;
setPrecision(5);
dataR('A = ',x,0,3,6);
resultN('K = ',n,xLeft,3,1);
resultR('Sum: ',y,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('A real number~{A} (>\,1) is given. Find the largest integer~{K}',0,2);
taskText('such that the sum 1\;+\;1/2\;+\;\.\;+\;1/{K} is less than~{A}.',0,3);
taskText('Output~{K} and the corresponding sum.',0,4);
(*
*)
(*==*)
k := Random(3);
case k of
0: x := Random(2)+1+Random+0.1;
1: x := Random(3)+3+Random;
2: x := Random(3)+6+Random;
end;
y := 1;
n := 1;
while y<x do
  begin
    inc(n);
    y := y + 1/n;
  end;
y := y-1/n;
dec(n);
setPrecision(5);
dataR('A = ',x,0,3,6);
resultN('K = ',n,xLeft,3,2);
resultR('Sum: ',y,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('A principal of 1000~euro is invested at a\ rate of {P}~percent compounded',0,1);
taskText('annually. A\ real number~{P} is given, 0\;<\;{P}\;<\;25. Find, how many years~{K}',0,2);
taskText('it will take for an investment to exceed 1100~euro.',0,3);
taskText('Output~{K} (as an integer) and the compound amount~{S} of the principal',0,4);
taskText('at the end of {K}~years (as a\ real number).',0,5);
(*
*)
(*==*)
case Random(3) of
0: a2 := 0.25*(1+Random(8));
1: a2 := 0.5*(1+Random(16));
2: a2 := 0.5*(1+Random(47));
end;

dataR('P = ',a2,0,3,4);
b2 := 1000;
k := 0;
while b2 <=1100 do
  begin
    inc(k);
    b2 := b2*(1+a2/100);
  end;
resultN('K = ',k,xLeft,3,2);
{setprecision(4);}
resultR('S = ',b2,xRight,3,7);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('The skier began trainings having run 10~km. Each next day he increased',0,1);
taskText('the run distance by {P}~percent from the distance of the last day.',0,2);
taskText('A real number~{P} is given, 0\;<\;{P}\;<\;50). Find, how many days~{K}',0,3);
taskText('it will take for a\ total run to exceed 200~km.',0,4);
taskText('Output~{K} (as an integer) and the total run~{S} (as a\ real number).',0,5);
(*
*)
(*==*)
case Random(3) of
0: a2 := 1+Random(8);
1: a2 := 1+Random(20);
2: a2 := 1+Random(49);
end;
dataR('P = ',a2,0,3,4);
z := 10;
b2 := 10;
k := 1;
while z<=200 do
  begin
    inc(k);
    b2 := b2*(1+a2/100);
    z := z + b2;
  end;
resultN('K = ',k,xLeft,3,2);
setprecision(3);
resultR('S = ',z,xRight,3,7);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), output all digits of the number~{N}',0,2);
taskText('starting from the right digit (a\ ones digit). Use the operators',0,3);
taskText('of integer division and taking the remainder after integer division.',0,4);
(*
*)
(*==*)
case Random(5) of
0: n := 1 + Random(9);
1: n := 1 + Random(99);
2: n := 1 + Random(999);
3: n := 1 + Random(9999);
4: n := 1 + Random(32000);
end;
Str(n,s);
k := length(s);
dataN('N = ',n,0,3,1);
for i := 1 to k do
  begin
  val(s[k-i+1],m,j);
  resultN('',m,center(i,k,1,4),3,1);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0), find the amount and the sum of its digits.',0,2);
taskText('Use the operators of integer division',0,3);
taskText('and taking the remainder after integer division.',0,4);
(*
*)
(*==*)
case Random(5) of
0: n := 1 + Random(9);
1: n := 1 + Random(99);
2: n := 1 + Random(999);
3: n := 1 + Random(9999);
4: n := 1 + Random(32000);
end;
Str(n,s);
k := length(s);
m1 := 0;
for i := 1 to k do
  begin
  val(s[k-i+1],m,j);
  m1 := m1 + m;
  end;
dataN('N = ',n,0,3,1);
resultN('Amount of digits: ',k,xLeft,3,2);
resultN('Sum of digits: ',m1,xRight,3,2);
setNumberOfTests(6);
Pause;
end;

procedure SFor65Cn55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,0) is given. Output an integer obtained from the given one',0,2);
taskText('by reading it from right to left. Use the operators of integer division',0,3);
taskText('and taking the remainder after integer division.',0,4);
(*
*)
(*==*)
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
  dataN('N = ',m,0,3,3);
  n := 0;
  while m <> 0 do
  begin
  n := n * 10 + m mod 10;
  m := m div 10;
  end;
  resultN('',n,0,3,3);
setNumberOfTests(5);
Pause;
end;



procedure SFor65Cn56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1: begin
taskText('An integer~{N} (>\,0) is given. Determine whether its decimal representation',0,2);
taskText('contains a digit~\<2\> or not, and output \t or \f respectively.',0,3);
taskText('Use the operators of integer division ',0,4);
taskText('and taking the remainder after integer division.',0,5);
(*
*)
   end;
2: begin
taskText('An integer~{N} (>\,0) is given. Determine whether its decimal representation',0,2);
taskText('contains odd digits or not, and output \t or \f respectively.',0,3);
taskText('Use the operators of integer division ',0,4);
taskText('and taking the remainder after integer division.',0,5);
(*
*)
   end;
end;
(*==*)
m1 := Random(2);
case curtest of //2012
2: m1 := 1;
3: m1 := 0;
end;
m2 := Random(5);
repeat
case m2 of
0: n := 1 + Random(9);
1: n := 1 + Random(99);
2: n := 1 + Random(999);
3: n := 1 + Random(9999);
4: n := 1 + Random(32000);
end;
Str(n,s);
k := length(s);
bln := false;
for i := 1 to k do
begin
  case v1 of
  1: bln := s[i] = '2';
  2: bln := s[i] in ['1','3','5','7','9'];
  end;
  if bln then break;
end;
if (bln and (m1=0)) or (not bln and (m1=1)) then break;
until False;

dataN('N = ',n,0,3,1);
resultB('',bln,0,3);
setNumberOfTests(6);
Pause;
end;

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


procedure SFor65Cn57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) is given. If it is a \Iprime number\i,',0,2);
taskText('i.~e., it has not positive divisors except~1 and itself,',0,3);
taskText('then output \t, otherwise output \f.',0,4);
(*
*)
m := Random(2);
case curtest of //2012
2: m := 1;
4: m := 0;
end;
while True do
begin
case Random(3) of
0: n := 2 + Random(15);
1: n := 2 + Random(200);
2: n := 2 + Random(999);
end;
if (Random(5)<3)and not Odd(n) then n := n + 1;
bln := Prime(n);
case m of
0: if bln then break;
1: if not bln then break;
end;
end;
dataN('N = ',n,0,3,1);
resultB('',bln,0,3);
setNumberOfTests(6);
pause;
end;

function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;


procedure SFor65Cn58(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Two positive integers~{A} and~{B} are given.',0,1);
taskText('Find their \Igreatest common divisor\i (GCD) using the \IEuclidean algorithm\i:',0,2);
taskText('\[GCD({A}, {B})~=~GCD({B}, {A}\;mod\;{B}),\q if {B}~\n~0;\Q    GCD({A}, 0)~=~{A},\]',0,3);
taskText('where \<mod\> denotes the operator of taking',0,4);
taskText('the remainder after integer division.',0,5);
(*
*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
    n2 := n[1]*(Random(300)+1);
dataN('A = ',n1,xLeft,3,2);
dataN('B = = ',n2,xRight,3,2);
resultN('GCD(A, B) = ',NOD(n1,n2),0,3,2);
setNumberOfTests(5);
pause;
end;



procedure SFor65Cn59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('An integer~{N} (>\,1) is given. An integer-valued sequence',0,1);
taskText('of the \IFibonacci numbers\i~{F}_{K} is defined as:',0,2);
taskText('\[{F}_{1}~=~1,\Q    {F}_{2}~=~1,\Q    {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\,4,\,\.~.\]',0,3);
taskText('Determine whether~{N} is a Fibonacci number or not,',0,4);
taskText('and output \t or \f respectively.',0,5);
(*
*)
(*==*)
m := Random(2);
case curtest of //2012
3: m := 1;
5: m := 0;
end;
if m=0 then
begin
k := Random(13);
n1 := 1;
n2 := 1;
n := 2;
for i := 1 to k do
  begin
  n := n1+n2;
  n1 := n2;
  n2 := n;
  end;
end
else
begin
case Random(3) of
0: n := 2 + Random(16);
1: n := 2 + Random(80);
2: n := 2 + Random(200);
end;
end;
n1 := 1;
n2 := 1;
k := 2;
m := 1;
while m<n do
  begin
  k := k + 1;
  m := n1+n2;
  n1 := n2;
  n2 := m;
  end;
dataN('N = ',n,0,3,2);
resultB('',m = n,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SFor65Cn60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,1),',0,2);
taskText('find the first Fibonacci number greater than~{N}',0,3);
taskText('(see the \IFibonacci numbers\i definition in \1).',0,4);
(*
*)
(*==*)
m := Random(2);
case curtest of //2012
2: m := 0;
4: m := 1;
end;
if m=0 then
begin
k := Random(13);
n1 := 1;
n2 := 1;
n := 2;
for i := 1 to k do
  begin
  n := n1+n2;
  n1 := n2;
  n2 := n;
  end;
end
else
begin
case Random(3) of
0: n := 2 + Random(16);
1: n := 2 + Random(80);
2: n := 2 + Random(200);
end;
end;
n1 := 1;
n2 := 1;
k := 2;
m := 1;
while m<=n do
  begin
  k := k + 1;
  m := n1+n2;
  n1 := n2;
  n2 := m;
  end;
dataN('N = ',n,0,3,1);
resultN('',m,0,3,3);
{resultN('×èñëî Ôèáîíà÷÷è: ',m,xLeft,3,3);
resultN('Åãî íîìåð: ',k,xRight,3,2);}
setNumberOfTests(5);
Pause;
end;


procedure SFor65Cn61(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,1) that is a Fibonacci number: {N}~=~{F}_{K},',0,2);
taskText('output previous and next Fibonacci numbers:~{F}_{K\-1} and~{F}_{K+1}',0,3);
taskText('(see the \IFibonacci numbers\i definition in \2).',0,4);
(*
*)
(*==*)
k := Random(13);
n1 := 1;
n2 := 1;
n := 2;
for i := 1 to k do
  begin
  n := n1+n2;
  n1 := n2;
  n2 := n;
  end;
n1 := 1;
n2 := 1;
k := 2;
m := 1;
while m<n do
  begin
  k := k + 1;
  m := n1+n2;
  n1 := n2;
  n2 := m;
  end;
dataN('N = ',n,0,3,2);
resultN('Previous Fibonacci number: ',n1,xLeft,3,2);
resultN('Next Fibonacci number: ',n1+n,xRight,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn62(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,1) that is a Fibonacci number: {N}~=~{F}_{K},',0,2);
taskText('find its order number~{K}',0,3);
taskText('(see the \IFibonacci numbers\i definition in \3).',0,4);
(*
*)
(*==*)
k := Random(13);
n1 := 1;
n2 := 1;
n := 2;
for i := 1 to k do
  begin
  n := n1+n2;
  n1 := n2;
  n2 := n;
  end;
n1 := 1;
n2 := 1;
k := 2;
m := 1;
while m<n do
  begin
  k := k + 1;
  m := n1+n2;
  n1 := n2;
  n2 := m;
  end;
dataN('N = ',n,0,3,2);
resultN('K = ',k,0,3,2);
setNumberOfTests(5);
Pause;
end;



procedure SFor65Cn63(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('A real number~\e (>\,0) is given.',0,1);
taskText('A\ sequence of real numbers~{A}_{K} is defined as:',0,2);
taskText('\[{A}_{1}~=~2,\Q   {A}_{K}~=~2\;+\;1/{A}_{K\-1},\q  {K}~=~2,\,3,\,\.~.\]',0,3);
taskText('Find the first index~{K} such that the inequality |{A}_{K}\;\-\;{A}_{K\-1}|~<~\e',0,4);
taskText(' is fulfilled. Output the index~{K} and the terms~{A}_{K\-1} and~{A}_{K}.',0,5);
(*
*)
(*==*)
n := 1+Random(5);
x0 := 0.5+Random*0.5;
for i := 1 to n do
  x0 := x0/10;
setPrecision(6);
dataR('\e = ',x0,0,3,8);
x := 2;
y := 2 + 1/x;
k := 2;
repeat
inc(k);
z := 2+1/y;
x := y;
y := z;
until abs(x-y)<x0;
resultN('K = ',k,0,2,2);
resultR('A_{K\-1} = ',x,xLeft,4,8);
resultR('A_{K} = ',y,xRight,4,8);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn64(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('A real number~\e (>\,0) is given.',0,1);
taskText('A\ sequence of real numbers~{A}_{K} is defined as:',0,2);
taskText('\[{A}_{1}~=~1,\Q  {A}_{2}~=~2,\Q  {A}_{K}~=~({A}_{K\-2}\;+\;2\*{A}_{K\-1})/3,\q  {K}~=~3,\,4,\,\.~.\]',0,3);
taskText('Find the first index~{K} such that the inequality |{A}_{K}\;\-\;{A}_{K\-1}|~<~\e',0,4);
taskText(' is fulfilled. Output the index~{K} and the terms~{A}_{K\-1} and~{A}_{K}.',0,5);
(*
*)
(*==*)
n := 1+Random(5);
x0 := 0.5+Random*0.5;
for i := 1 to n do
  x0 := x0/10;
setPrecision(6);
dataR('\e = ',x0,0,3,8);
x := 1;
y := 2;
k := 2;
repeat
inc(k);
z := (x+2*y)/3;
x := y;
y := z;
until abs(x-y)<x0;
resultN('K = ',k,0,2,2);
resultR('A_{K\-1} = ',x,xLeft,4,8);
resultR('A_{K} = ',y,xRight,4,8);
setNumberOfTests(5);
Pause;
end;

procedure SFor65Cn65(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Three positive real numbers~{A}, {B},~{C} are given.',0,1);
taskText('A\ rectangle of size~{A}\;\x\;{B} contains the greatest possible amount',0,2);
taskText('of squares with side~{C} (without overlaps).',0,3);
taskText('Find the amount of squares placed on the rectangle.',0,4);
taskText('Do not use the operators of multiplication and division.',0,5);
(*
*)
(*==*)
a := 10 + Random(50) + Random(100)/100;
b := 10 + Random(50) + Random(100)/100;
c := 2 + Random(10) + Random(100)/100;
n1 := Trunc(a/c)*Trunc(b/c);
dataR('A = ',a,xleft,3,5);
dataR('B = ',b,0,3,5);
dataR('C = ',c,xright,3,5);
resultN('Amount of squares: ',n1,0,3,3);
setNumberOfTests(3);
Pause;
end;





begin
Topic3 := 'LOOP WITH THE PARAMETER';
Topic2 := 'LOOP WITH THE PARAMETER: NESTED LOOPS';
Topic1 := 'LOOP WITH THE CONDITION';
{Author := 'M.~E.~Abramyan, 2002';}
end.
