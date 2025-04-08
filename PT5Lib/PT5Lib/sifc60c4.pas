{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SIfc60C4;

{$MODE Delphi}

interface

procedure SIfc60Cn1(Name, Key: string);
procedure SIfc60Cn2(Name, Key: string);
procedure SIfc60Cn3(Name, Key: string);
procedure SIfc60Cn4(Name, Key: string);
procedure SIfc60Cn5(Name, Key: string);
procedure SIfc60Cn6(Name, Key: string);
procedure SIfc60Cn7(Name, Key: string);
procedure SIfc60Cn8(Name, Key: string);
procedure SIfc60Cn9(Name, Key: string);
procedure SIfc60Cn10(Name, Key: string);
procedure SIfc60Cn11(Name, Key: string);
procedure SIfc60Cn12(Name, Key: string);
procedure SIfc60Cn13(Name, Key: string);
procedure SIfc60Cn14(Name, Key: string);
procedure SIfc60Cn15(Name, Key: string);
procedure SIfc60Cn16(Name, Key: string);
procedure SIfc60Cn17(Name, Key: string);
procedure SIfc60Cn18(Name, Key: string);
procedure SIfc60Cn19(Name, Key: string);
procedure SIfc60Cn20(Name, Key: string);
procedure SIfc60Cn21(Name, Key: string);
procedure SIfc60Cn22(Name, Key: string);
procedure SIfc60Cn23(Name, Key: string);
procedure SIfc60Cn24(Name, Key: string);
procedure SIfc60Cn25(Name, Key: string);
procedure SIfc60Cn26(Name, Key: string);
procedure SIfc60Cn27(Name, Key: string);
procedure SIfc60Cn28(Name, Key: string);
procedure SIfc60Cn29(Name, Key: string);
procedure SIfc60Cn30(Name, Key: string);
procedure SIfc60Cn31(Name, Key: string);
procedure SIfc60Cn32(Name, Key: string);
procedure SIfc60Cn33(Name, Key: string);
procedure SIfc60Cn34(Name, Key: string);
procedure SIfc60Cn35(Name, Key: string);
procedure SIfc60Cn36(Name, Key: string);
procedure SIfc60Cn37(Name, Key: string);
procedure SIfc60Cn38(Name, Key: string);
procedure SIfc60Cn39(Name, Key: string);
procedure SIfc60Cn40(Name, Key: string);
procedure SIfc60Cn41(Name, Key: string);
procedure SIfc60Cn42(Name, Key: string);
procedure SIfc60Cn43(Name, Key: string);
procedure SIfc60Cn44(Name, Key: string);
procedure SIfc60Cn45(Name, Key: string);
procedure SIfc60Cn46(Name, Key: string);
procedure SIfc60Cn47(Name, Key: string);
procedure SIfc60Cn48(Name, Key: string);
procedure SIfc60Cn49(Name, Key: string);
procedure SIfc60Cn50(Name, Key: string);
procedure SIfc60Cn51(Name, Key: string);
procedure SIfc60Cn52(Name, Key: string);
procedure SIfc60Cn53(Name, Key: string);
procedure SIfc60Cn54(Name, Key: string);
procedure SIfc60Cn55(Name, Key: string);
procedure SIfc60Cn56(Name, Key: string);
procedure SIfc60Cn57(Name, Key: string);
procedure SIfc60Cn58(Name, Key: string);
procedure SIfc60Cn59(Name, Key: string);
procedure SIfc60Cn60(Name, Key: string);

implementation

uses PT5TaskMaker;

const Pi = 3.14;
      dir : array [0..3] of char = ('N','W','S','E');
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
0: s1 := 'zero';
1: s1 := 'one';
2: s1 := 'two';
3: s1 := 'three';
4: s1 := 'four';
5: s1 := 'five';
6: s1 := 'six';
7: s1 := 'seven';
8: s1 := 'eight';
9: s1 := 'nine';
end;
digit := s1;
end;

procedure SIfc60Cn1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
{before 4.15
taskText('An integer is given. If the integer is positive',0,2);
taskText('then increase it by~1, otherwise do not change it.',0,3);
taskText('Output the obtained integer.',0,4);
}
taskText('An integer is given. If the integer is positive',0,2);
taskText('then decrease it by~8, otherwise do not change it.',0,3);
taskText('Output the obtained integer.',0,4);
(*
Èñïîëüçîâàòü ñîêğàùåííóş ôîğìó
óñëîâíîãî îïåğàòîğà:
\(
\uPif <óñëîâèå> then\|
~~<îïåğàòîğ>;
\uVIf <óñëîâèå> Then\|
~~<îïåğàòîğ>\|
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

procedure SIfc60Cn2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(2,0,0,0,v1,v2,v3);
{before 4.15
taskText('An integer is given. If the integer is positive',0,2);
taskText('then increase it by~1, otherwise decrease it by~2.',0,3);
taskText('Output the obtained integer.',0,4);
}
taskText('An integer is given. If the integer is positive',0,2);
taskText('then decrease it by~8, otherwise increase it by~6.',0,3);
taskText('Output the obtained integer.',0,4);
(*
Èñïîëüçîâàòü ïîëíóş ôîğìó óñëîâíîãî îïåğàòîğà:
\(
\uPif <óñëîâèå> then\|
~~<îïåğàòîğ1>\|
else <îïåğàòîğ2>;
\uVIf <óñëîâèå> Then\|
~~<îïåğàòîğ1>\|
Else\|
~~<îïåğàòîğ2>\|
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

procedure SIfc60Cn3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
{before 4.15
taskText('An integer is given. If the integer is positive',0,2);
taskText('then increase it by~1, if the integer is negative then decrease it by~2,',0,3);
taskText('if the integer equals~0 then change it to~10. Output the obtained integer.',0,4);
}
taskText('An integer is given. If the integer is positive',0,2);
taskText('then decrease it by~8, if the integer is negative then increase it by~6,',0,3);
taskText('if the integer equals~0 then change it to~10. Output the obtained integer.',0,4);
(*
Èñïîëüçîâàòü âëîæåííûå óñëîâíûå îïåğàòîğû:
\(
\uPif <óñëîâèå1> then\|
~~<îïåğàòîğ1>\|
else if <óñëîâèå2> then\|
~~<îïåğàòîğ2>\|
else <îïåğàòîğ3>;
\uVIf <óñëîâèå1> Then\|
~~<îïåğàòîğ1>\|
ElseIf <óñëîâèå2> Then\|
~~<îïåğàòîğ2>\|
Else\|
~~<îïåğàòîğ3>\|
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

procedure SIfc60Cn4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Three integers are given.',0,2);
taskText('Find the amount of positive integers in the input data.',0,4);
(*
Èñïîëüçîâàòü âñïîìîãàòåëüíóş ïåğåìåííóş-ñ÷åò÷èê.
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

procedure SIfc60Cn5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Three integers are given. Find the amount of positive',0,2);
taskText('and amount of negative integers in the input data.',0,4);
(*
Èñïîëüçîâàòü äâå âñïîìîãàòåëüíûõ ïåğåìåííûõ-ñ÷åò÷èêà.
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
resultN('Amount of positive integers: ',m,0,2,3);
resultN('Amount of negative integers: ',k,0,4,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Given two real numbers, output the larger value of them.',0,3);
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

procedure SIfc60Cn7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Given two real numbers, output the order number of the smaller of them.',0,3);
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

procedure SIfc60Cn8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Given two real numbers,',0,2);
taskText('output the larger value and then the smaller value of them.',0,4);
(*
*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('',a,xLeft,3,5);
dataR('',b,xRight,3,5);
if a > b then begin c := a; d := b; end
         else begin c := b; d := a; end;
resultR('The larger value:  ',c,0,2,5);
resultR('The smaller value: ',d,0,4,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60Cn9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('The values of two real variables~{A} and~{B} are given.',0,2);
taskText('Redistribute the values so that~{A} and~{B} have',0,3);
taskText('the smaller and the larger value respectively.',0,4);
taskText('Output the new values of the variables~{A} and~{B}.',0,5);
(*
*)
(*==*)
a := Random*19.99-10;  //2012
b := Random*19.99-10;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,xRight,3,5);
swap(a,b);
resultComment(' New values of the variables:',0,2);
resultR('A = ',a,xLeft,3,5);
resultR('B = ',b,xRight,3,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('The values of two integer variables~{A} and~{B} are given.',0,2);
taskText('If the values are not equal then assign the sum of given values',0,3);
taskText('to each variable, otherwise assign zero value to each variable.',0,4);
taskText('Output the new values of the variables~{A} and~{B}.',0,5);
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
resultComment(' New values of the variables:',0,2);
resultN('A = ',m1,xLeft,3,2);
resultN('B = ',m1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('The values of two integer variables~{A} and~{B} are given.',0,2);
taskText('If the values are not equal then assign the larger value to each variable,',0,3);
taskText('otherwise assign zero value to each variable.',0,4);
taskText('Output the new values of the variables~{A} and~{B}.',0,5);
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
resultComment(' New values of the variables:',0,2);
resultN('A = ',m1,xLeft,3,2);
resultN('B = ',m1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given three real numbers, output the minimal value of them.',0,3);
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

procedure SIfc60Cn13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given three real numbers,',0,2);
taskText('output the value between the minimum and the maximum.',0,4);
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

procedure SIfc60Cn14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given three real numbers,',0,2);
taskText('output the minimal value and then the maximal value.',0,4);
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
if c < a then a := c;
if c > b then b := c;
resultR('The minimum value: ',a,0,2,5);
resultR('The maximum value: ',b,0,4,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Given three real numbers, output the sum of two largest values.',0,3);
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

procedure SIfc60Cn16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('The values of three real variables~{A}, {B},~{C} are given.',0,2);
taskText('If the values are in ascending order then double them,',0,3);
taskText('otherwise replace the value of each variable by its opposite value.',0,4);
taskText('Output the new values of the variables~{A}, {B},~{C}.',0,5);
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
resultComment(' New values of the variables:',0,2);
resultR('A = ',m*a,center(1,3,10,15),3,6);
resultR('B = ',m*b,center(2,3,10,15),3,6);
resultR('C = ',m*c,center(3,3,10,15),3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('The values of three real variables~{A}, {B},~{C} are given.',0,2);
taskText('If the values are in ascending or descending order then double them,',0,3);
taskText('otherwise replace the value of each variable by its opposite value.',0,4);
taskText('Output the new values of the variables~{A}, {B},~{C}.',0,5);
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
resultComment(' New values of the variables:',0,2);
resultR('A = ',m*a,center(1,3,10,15),3,6);
resultR('B = ',m*b,center(2,3,10,15),3,6);
resultR('C = ',m*c,center(3,3,10,15),3,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Three integers are given. One of them differs from two other equal integers.',0,2);
taskText('Output the order number of the integer that differs from the others.',0,4);
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

procedure SIfc60Cn19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Four integers are given. One of them differs from three other equal integers.',0,2);
taskText('Output the order number of the integer that differs from the others.',0,4);
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

procedure SIfc60Cn20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Three points~{A}, {B},~{C} on the real axis are given.',0,2);
taskText('Determine whether~{B} or~{C} is closer to~{A}.',0,3);
taskText('Output the nearest point and its distance from~{A}.',0,4);
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
resultR('The nearest point:   ',b,0,2,6);
resultR('Its distance from A: ',x1,0,4,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Integer coordinates of a point in the coordinate plane are given.',0,2);
taskText('If the point coincides with the origin of coordinates then output~0,',0,3);
taskText('otherwise if the point lies on the {x}-axis or {y}-axis then output~1 or~2',0,4);
taskText('respectively. If the point does not lie on the coordinate axes then output~3.',0,5);
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
dataN2('Coordinates of the point:',n1,n2,0,3,3);
resultN('',n,0,3,1);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Given coordinates of a\ point that does not lie on the coordinate axes,',0,2);
taskText('find the number of a coordinate quarter containing the point.',0,4);
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
dataR2('Coordinates of the point:',x1,x2,0,3,6);
resultN('',n+1,0,3,1);
setNumberOfTests(9);
pause;
end;

procedure SIfc60Cn23(Name, Key: string);
var v1,v2,v3 : byte;
    a: array [0..4] of record x,y: integer end;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Given integer coordinates of three vertices of a rectangle',0,2);
taskText('whose sides are parallel to coordinate axes,',0,3);
taskText('find the coordinates of the fourth vertex of the rectangle.',0,4);
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

procedure SIfc60Cn24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given a real independent variable~{x},',0,2);
taskText('find the value of a\ real function~{f} defined as:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~& 2\*sin({x}),& if {x}~>~0,',26,4);
taskText('        &\,&\,&6\;\-\;{x},&    if {x}~\l~0.\j\]',26,5);

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

procedure SIfc60Cn25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given an integer independent variable~{x},',0,2);
taskText('find the value of an integer function~{f} defined as:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~&  2\*{x},& if {x}~<~\-2 or {x}~>~2,',26,4);
taskText('&\,&\,&        \-3\*{x}&  otherwise.\j\]',26,5);


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

procedure SIfc60Cn26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Given a real independent variable~{x},',0,1);
taskText('find the value of a real function~{f} defined as:',0,2);
taskText('\[\Jrcrl&\,&\,&       \-{x},& if {x}~\l~0,',26,3);
taskText('&{f}({x})&~=~&{x}^2,& if 0~<~{x}~<~2,',26,4);
taskText('&\,&\,&        4,& if {x}~\g~2.\j\]',26,5);
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

procedure SIfc60Cn27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Given a real independent variable~{x},',0,1);
taskText('find the value of an integer function~{f} defined as:',0,2);
taskText('\[\Jrcrl&\,&\,&        0,& if {x}~<~0,',18,3);
taskText('&{f}({x})&~=~& 1,& if {x} belongs to [0,\,1), [2,\,3),~\.,',18,4);
taskText('&\,&\,&       \-1,& if {x} belongs to [1,\,2), [3,\,4),~\. .\j\]',18,5);
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
resultN('f(x) =  ',k,0,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Given a number of year (as a\ positive integer), find the amount of days',0,1);
taskText('in the year. Note that the length of year is 365~days for an ordinary year',0,2);
taskText('and 366~days for a\ leap year. A\ \Ileap year\i is every year whose number is',0,3);
taskText('divisible by~4, as~1980, except centenary years that are not divisible by~400',0,4);
taskText('(for example, 1300 and~1900 are ordinary years, 1200 and~2000 are leap years).',0,5);
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

procedure SIfc60Cn29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Given an integer, output its description string as:',0,2);
taskText('\<negative even number\>, \<zero number\>, \<positive odd number\>, etc.',0,4);
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
0: begin m := 0; s1 := 'zero number'; end;
1: begin m := 2*(Random(49)+1); s1 := 'even number'; end;
2: begin m := 2*(Random(49)+1)+1; s1 := 'odd number'; end;
end;
if n<>0 then
  if Random(2)=0 then begin m := -m; s1 := 'negative '+s1; end
  else s1 := 'positive '+s1;
dataN('',m,0,3,abs(n));
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);

taskText('An integer in the range~1 to~999 is given.',0,2);
taskText('Output its description string as:',0,3);
taskText('\<two-digit even number\>, \<three-digit odd number\>, etc.',0,4);
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
0: begin m := Random(9)+1; s1 := 'one-digit '; end;
1: begin m := Random(90)+10; s1 := 'two-digit '; end;
2: begin m := Random(900)+100; s1 := 'three-digit '; end;
end;
if m mod 2 = 0 then s1 := s1+'even'
else s1 := s1+'odd';
s1 := s1 + ' number';
dataN('',m,0,3,n+1);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;


procedure SIfc60Cn31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;



procedure SIfc60Cn32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('An integer in the range~1 to~7 is given.',0,2);
taskText('Output the name of the respective day of week:',0,3);
taskText('1~\= \<Monday\>, 2~\= \<Tuesday\>,~\., 7~\= \<Sunday\>.',0,4);
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
1: s1 := 'Monday';
2: s1 := 'Tuesday';
3: s1 := 'Wednesday';
4: s1 := 'Thursday';
5: s1 := 'Friday';
6: s1 := 'Saturday';
7: s1 := 'Sunday';
end;
dataN('',n,0,3,1);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn33(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Given an integer~{K}, output the respective examination mark:',0,2);
taskText('1~\= \<bad\>, 2~\= \<unsatisfactory\>, 3~\= \<mediocre\>, 4~\= \<good\>, 5~\= \<excellent\>.',0,3);
taskText('If~{K} is not in the range~1 to~5 then output string \<error\>.',0,4);
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
1: s1 := 'bad';
2: s1 := 'unsatisfactory';
3: s1 := 'mediocre';
4: s1 := 'good';
5: s1 := 'excellent';
else s1 := 'error';
end;
dataN('K = ',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60Cn34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('A number of month is given (as an integer in the range~1 to~12):',0,2);
taskText('1~\= January, 2~\= February, etc. Output the name of the respective season:',0,3);
taskText('\<Winter\>, \<Spring\>, \<Summer\>, \<Autumn\>.',0,4);
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
1,2,12: s1 := 'Winter';
3,4,5: s1 := 'Spring';
6,7,8: s1 := 'Summer';
9,10,11: s1 := 'Autumn';
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('A number of month is given (as an integer in the range~1 to~12):',0,2);
taskText('1~\= January, 2~\= February, etc.',0,3);
taskText('Output the amount of days in the month for a\ non-leap year.',0,4);
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

procedure SIfc60Cn36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(5,0,0,0,v1,v2,v3);
taskText('The arithmetic operations are numbered as:',0,1);
taskText('1~\= addition, 2~\= subtraction, 3~\= multiplication, 4~\= division.',0,2);
taskText('The order number~{N} of an operation and two real numbers~{A} and~{B} are given',0,3);
taskText('({N}~is an integer in the range~1 to~4, {Â}~is not equal to~0).',0,4);
taskText('Perform the operation with the operands~{A} and~{B} and output the result.',0,5);
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

procedure SIfc60Cn37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('The units of length are numbered as:',0,1);
taskText('1~\= decimeter, 2~\= kilometer, 3~\= meter, 4~\= millimeter, 5~\= centimeter.',0,2);
taskText('The order number~{N} of a\ unit of length and also the length~{L} of a segment',0,3);
taskText('are given ({N}~is an integer in the range~1 to~5, {L}~is a real number).',0,4);
taskText('Output the length of the segment in meters.',0,5);
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
1: begin y := x/10; k := 3;   s1 := 'dm): '; end;
2: begin y := x*1000; k := 1; s1 := 'km): '; end;
3: begin y := x;    k := 2;   s1 := 'm):  '; end;
4: begin y := x/1000; k := 5; s1 := 'mm): '; end;
5: begin y := x/100; k := 4;  s1 := 'cm): '; end;
end;
dataR('Length of the segment ('+s1,x,22,4,4);
setPrecision(k);
resultR('Length of the segment (m):  ',y,22,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('The units of weight are numbered as: 1~\= kilogram,',0,1);
taskText('2~\= milligram, 3~\= gram, 4~\= ton, 5~\= centner (=~100~kilograms).',0,2);
taskText('The order number~{N} of a\ unit of weight and the mass~{M} of a solid are given',0,3);
taskText('({N}~is an integer in the range~1 to~5, {M}~is a real number).',0,4);
taskText('Output the mass of the solid in kilograms.',0,5);
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
1: begin y := x; k := 2;          s1 := 'kg): '; end;
2: begin y := x/1000000.; k := 8; s1 := 'mg): '; end;
3: begin y := x/1000;    k := 5;  s1 := 'g):  '; end;
4: begin y := x*1000; k := 1;     s1 := 't):  '; end;
5: begin y := x*100; k := 1;      s1 := 'c):  '; end;
end;
dataR('Mass of the solid ('+s1,x,25,4,4);
setPrecision(k);
resultR('Mass of the solid (kg): ',y,25,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Given two integers~{D} (day) and~{M} (month)',0,2);
taskText('representing a correct date of a non-leap year,',0,3);
taskText('output values~{D} and~{M} for the previous date.',0,4);
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
dataComment('Given date:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment(' Previous date:',0,2);
resultN('D = ',n2,xLeft,3,2);
resultN('M = ',m1+1,xRight,3,2);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Given two integers~{D} (day) and~{M} (month)',0,2);
taskText('representing a correct date of a non-leap year,',0,3);
taskText('output values~{D} and~{M} for the next date.',0,4);
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
dataComment('Given date:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment('Next date:',0,2);
resultN('D = ',n2,xLeft,3,2);
resultN('M = ',m1+1,xRight,3,2);
setNumberOfTests(9);
pause;
end;


procedure SIfc60Cn41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('A robot can move in four directions (\<N\>~\= north, \<W\>~\= west, \<S\>~\= south,',0,1);
taskText(' \<E\>~\= east) and perform three digital instructions: 0~\= \<move in the former',0,2);
taskText('direction\>, 1~\= \<turn left\>, \-1~\= \<turn right\>. A\ symbol~{C} (an initial',0,3);
taskText('direction of the robot) and an integer~{N} (an instruction) are given. Output',0,4);
taskText('the direction of the robot (as symbol) after performing the instruction.',0,5);
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
dataC('Initial direction: C = ',dir[n],0,2);
dataN('Instruction: N = ',m,0,4,2);
resultC('New direction: ',dir[n1],0,3);
setNumberOfTests(9);
pause;
end;

procedure SIfc60Cn42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('A locator can be focused on the directions \<N\> (north), \<W\> (west), \<S\>',0,1);
taskText('(south), \<E\> (east) and perform three digital instructions: 1~\= \<turn left\>,',0,2);
taskText('\-1~\= \<turn right\>, 2~\= \<turn on 180\o\>). A\ symbol~{C} (an initial direction',0,3);
taskText('of the locator) and two integers~{N}_1 and~{N}_2 (instructions) are given. Output',0,4);
taskText('the direction of the locator (as symbol) after performing the instructions.',0,5);
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
dataC('Initial direction: C = ',dir[n],0,2);
dataComment('Instructions:',0,3);
dataN('N_1 = ',m1,xLeft,4,2);
dataN('N_2 = ',m2,xRight,4,2);
resultC('New direction: ',dir[n1],0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60Cn43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Elements of a\ circle are numbered as: 1~\= radius~{R}, 2~\= diameter {D}~=~2\*{R},',0,1);
taskText('3~\= length {L}~=~2\*\p\*{R} of the circumference, 4 \= area {S}~=~\p\*{R}^2.',0,2);
taskText('The order number of one element and its value (as a\ real number)',0,3);
taskText('are given. Output values of other elements in the same order.',0,4);
taskText('Use~3.14 for a\ value of~\p.',0,5);
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

procedure SIfc60Cn44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Elements of a right isosceles triangle are numbered as: 1~\= leg~{a},',0,1);
taskText('2~\= hypotenuse {c}~=~{a}\*\R2\r, 3~\= altitude~{h} drawn onto hypotenuse',0,2);
taskText('({h}~=~{c}/2), 4~\= area {S}~=~{c}\*{h}/2. The order number of one element',0,3);
taskText('and its value (as a\ real number) are given.',0,4);
taskText(' Output values of other elements in the same order.',0,5);
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

procedure SIfc60Cn45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Elements of an equilateral triangle are numbered as: 1~\= side~{a},',0,1);
taskText('2~\= radius~{R}_1 of inscribed circle ({R}_1~=~{a}\*\R3\r/6), 3~\= radius~{R}_2',0,2);
taskText('of circumscribed circle ({R}_2~=~2\*{R}_1), 4~\= area {S}~=~{a}^2\*\R3\r/4.',0,3);
taskText('The order number of one element and its value (as a\ real number) are given.',0,4);
taskText('Output values of other elements in the same order.',0,5);
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



procedure SIfc60Cn46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(5,0,0,0,v1,v2,v3);
taskText('The suits of playing cards are numbered as: 1~\= spades, 2~\= clubs,',0,1);
taskText('3~\= diamonds, 4~\= hearts. Card values \<Jack\>, \<Queen\>, \<King\>, \<Ace\> are',0,2);
taskText('numbered as~11, 12, 13,~14 respectively. A\ card value~{N} (as an integer in the',0,3);
taskText('range~ 6 to~14) and a\ suit~{M} (as an integer in the range~1 to~4) are given.',0,4);
taskText('Output the card description as: \<six of diamonds\>, \<queen of spades\>, etc.',0,5);
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
dataN('Card value: N = ',n,xLeft,3,2);
dataN('Suit: M = ',m,xRight,3,1);
case N of
6: s := 'six';
7: s := 'seven';
8: s := 'eight';
9: s := 'nine';
10: s := 'ten';
11: s := 'jack';
12: s := 'queen';
13: s := 'king';
14: s := 'ace';
end;
case M of
1: s := s + ' of spades';
2: s := s + ' of clubs';
3: s := s + ' of diamonds';
4: s := s + ' of hearts';
end;
resultS('',s,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Given an age in years (as an integer in the range~20 to~69),',0,2);
taskText('output its alphabetic equivalent as:',0,3);
taskText('\<twenty years\>, \<thirty-two years\>, \<forty-one years\>, etc.',0,4);
(*
*)
(*==*)
n := 2+Random(5);
case n of
2: s1 := 'twenty';
3: s1 := 'thirty';
4: s1 := 'forty';
5: s1 := 'fifty';
6: s1 := 'sixty';
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
     s1 := s1 + ' years';
   end;
1: begin
     n:=n*10+1;
     s1 := s1 + '-one years';
   end;
2: begin
     n1 := Random(3)+2;
     n:=n*10+n1;
     s1 := s1 + '-'+digit(n1)+' years';
   end;
3: begin
     n1 := Random(5)+5;
     n:=n*10+n1;
     s1 := s1 + '-'+digit(n1)+' years';
   end;
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Given an order number of some training task',0,2);
taskText('(as an integer in the range 10 to 40),',0,3);
taskText('output its alphabetic equivalent as: \<the eighteenth task\>,',0,4);
taskText('\<the twenty-third task\>, \<the thirtieth task\>, etc.',0,5);
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
s := ' task';
case n1 of
0: s2 := '';
1: s2 := '-first';
2: s2 := '-second';
3: s2 := '-third';
4: s2 := '-fourth';
5: s2 := '-fifth';
6: s2 := '-sixth';
7: s2 := '-seventh';
8: s2 := '-eighth';
9: s2 := '-ninth';
end;
case n of
1: begin
   case n1 of
     0: s1 := 'tenth';
     1: s1 := 'eleventh';
     2: s1 := 'twelfth';
     3: s1 := 'thirteenth';
     4: s1 := 'fourteenth';
     5: s1 := 'fifteenth';
     6: s1 := 'sixteenth';
     7: s1 := 'seventeenth';
     8: s1 := 'eighteenth';
     9: s1 := 'nineteenth';
     end;
    end;
2: if n1 = 0 then
     s1 := 'twentieth'
   else
     s1 := 'twenty' + s2;
3: if n1 = 0 then
     s1 := 'thirtieth'
   else
     s1 := 'thirty' + s2;
4: s1 := 'fortieth';
end;
dataN('',m,0,3,2);
resultS('','the '+ s1 + s,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Given an integer in the range~100 to~999, output its alphabetic equivalent.',0,2);
taskText('For example, 100~\= \<one hundred\>, 256~\= \<two hundred and fifty-six\>,',0,3);
taskText('814~\= \<eight hundred and fourteen\>, 901~\= \<nine hundred and one\>.',0,4);
(*
*)
n := 1+Random(8);
s1 := digit(n)+' hundred';
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
     s1 := s1 + ' and '+digit(n1);
   end;
2: begin
     n1 := 10+Random(9);
     n:=n*100+n1;
     case n1 of
     10: s1 := s1 + ' and ten';
     11: s1 := s1 + ' and eleven';
     12: s1 := s1 + ' and twelve';
     13: s1 := s1 + ' and thirteen';
     14: s1 := s1 + ' and fourteen';
     15: s1 := s1 + ' and fifteen';
     16: s1 := s1 + ' and sixteen';
     17: s1 := s1 + ' and seventeen';
     18: s1 := s1 + ' and eighteen';
     19: s1 := s1 + ' and nineteen';
     end;
   end;
3: begin
     n1 := 2+Random(8);
     n2 := Random(10);
     n:=n*100+n1*10+n2;
     case n1 of
     2: s1 := s1 + ' and twenty';
     3: s1 := s1 + ' and thirty';
     4: s1 := s1 + ' and forty';
     5: s1 := s1 + ' and fifty';
     6: s1 := s1 + ' and sixty';
     7: s1 := s1 + ' and seventy';
     8: s1 := s1 + ' and eighty';
     9: s1 := s1 + ' and ninety';
     end;
     if n2<>0 then s1 := s1 + '-'+digit(n2);
   end;
end;
dataN('',n,0,3,2);
resultS('',s1,0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(8,0,0,0,v1,v2,v3);
taskText('One of the Asian calendars uses 60-years periods divided into 12-years cycles,',0,1);
taskText('which are associated with a color: green, red, yellow, white, black. Each',0,2);
taskText('year in a cycle is connected with some animal: rat, cow, tiger, hare, dragon,',0,3);
taskText('snake, horse, sheep, monkey, hen, dog, pig. Given some year (as positive',0,4);
taskText('integer), output its name provided that 1984 is \<The Green Rat`s year\>.',0,5);
(*
*)
(*==*)
n := 1800+Random(300);
m := (n-1984+12000) mod 60; // fixed bug! 2016.12.11 (+12000)
//if m<0 then m := m + 60;
case m div 12 of
0: s1 := 'Green ';
1: s1 := 'Red ';
2: s1 := 'Yellow ';
3: s1 := 'White ';
4: s1 := 'Black ';
end;
case m mod 12 of
0: s1 := s1 + 'Rat';
1: s1 := s1 + 'Cow';
2: s1 := s1 + 'Tigers';
3: s1 := s1 + 'Hare';
4: s1 := s1 + 'Dragon';
5: s1 := s1 + 'Snake';
6: s1 := s1 + 'Horse';
7: s1 := s1 + 'Sheep';
8: s1 := s1 + 'Monkey';
9: s1 := s1 + 'Hen';
10: s1 := s1 + 'Dog';
11: s1 := s1 + 'Pig';
end;
dataN('',n,0,3,4);
resultS('','The '+s1+'''s year',0,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60Cn51(Name, Key: string);
var v1,v2,v3 : byte;
    z: array [1..12] of string;
    d: array [1..12] of integer;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Given two integers~{D} (day) and~{M} (month) that represent a correct date,',0,1);
taskText('output the zodiacal name corresponding to this date: \<Aquarius\> 20.1\:18.2,',0,2);
taskText('\<Pisces\> 19.2\:20.3, \<Aries\> 21.3\:19.4, \<Taurus\> 20.4\:20.5, \<Gemini\> 21.5\:21.6,',0,3);
taskText('\<Cancer\> 22.6\:22.7, \<Leo\> 23.7\:22.8, \<Virgo\> 23.8\:22.9, \<Libra\> 23.9\:22.10,',0,4);
taskText('\<Scorpio\> 23.10\:22.11, \<Sagittarius\> 23.11\:21.12, \<Capricorn\> 22.12\:19.1.',0,5);
(*
*)
(*==*)
z[1] := 'Aquarius'; z[2] := 'Pisces'; z[3] := 'Aries'; z[4] := 'Taurus'; z[5] := 'Gemini';
z[6] := 'Cancer'; z[7] := 'Leo'; z[8] := 'Virgo'; z[9] := 'Libra'; z[10] := 'Scorpio';
z[11] := 'Sagittarius'; z[12] := 'Capricorn';
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



procedure SIfc60Cn52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(6,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn58(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60Cn60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('ÔÎĞÌÓËÈĞÎÂÊÀ ÇÀÄÀÍÈß',0,3);
(*
*)
dataS('','ÈÑÕÎÄÍÛÅ ÄÀÍÍÛÅ',0,3);
resultS('','ĞÅÇÓËÜÒÈĞÓŞÙÈÅ ÄÀÍÍÛÅ',0,3);
setNumberOfTests(5);
pause;
end;

begin
Topic1 := 'CONDITIONAL STATEMENT';
Topic2 := 'SELECTION STATEMENT';
{Author := 'Ì.~İ.~Àáğàìÿí, 2002';}
end.
