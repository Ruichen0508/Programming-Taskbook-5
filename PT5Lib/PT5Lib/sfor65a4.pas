{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SFor65A4;

{$MODE Delphi}

interface

procedure SFor65An1(Name, Key: string);
procedure SFor65An2(Name, Key: string);
procedure SFor65An3(Name, Key: string);
procedure SFor65An4(Name, Key: string);
procedure SFor65An5(Name, Key: string);
procedure SFor65An6(Name, Key: string);
procedure SFor65An7(Name, Key: string);
procedure SFor65An8(Name, Key: string);
procedure SFor65An9(Name, Key: string);
procedure SFor65An10(Name, Key: string);
procedure SFor65An11(Name, Key: string);
procedure SFor65An12(Name, Key: string);
procedure SFor65An13(Name, Key: string);
procedure SFor65An14(Name, Key: string);
procedure SFor65An15(Name, Key: string);
procedure SFor65An16(Name, Key: string);
procedure SFor65An17(Name, Key: string);
procedure SFor65An18(Name, Key: string);
procedure SFor65An19(Name, Key: string);
procedure SFor65An20(Name, Key: string);
procedure SFor65An21(Name, Key: string);
procedure SFor65An22(Name, Key: string);
procedure SFor65An23(Name, Key: string);
procedure SFor65An24(Name, Key: string);
procedure SFor65An25(Name, Key: string);
procedure SFor65An26(Name, Key: string);
procedure SFor65An27(Name, Key: string);
procedure SFor65An28(Name, Key: string);
procedure SFor65An29(Name, Key: string);
procedure SFor65An30(Name, Key: string);
procedure SFor65An31(Name, Key: string);
procedure SFor65An32(Name, Key: string);
procedure SFor65An33(Name, Key: string);
procedure SFor65An34(Name, Key: string);
procedure SFor65An35(Name, Key: string);
procedure SFor65An36(Name, Key: string);
procedure SFor65An37(Name, Key: string);
procedure SFor65An38(Name, Key: string);
procedure SFor65An39(Name, Key: string);
procedure SFor65An40(Name, Key: string);
procedure SFor65An41(Name, Key: string);
procedure SFor65An42(Name, Key: string);
procedure SFor65An43(Name, Key: string);
procedure SFor65An44(Name, Key: string);
procedure SFor65An45(Name, Key: string);
procedure SFor65An46(Name, Key: string);
procedure SFor65An47(Name, Key: string);
procedure SFor65An48(Name, Key: string);
procedure SFor65An49(Name, Key: string);
procedure SFor65An50(Name, Key: string);
procedure SFor65An51(Name, Key: string);
procedure SFor65An52(Name, Key: string);
procedure SFor65An53(Name, Key: string);
procedure SFor65An54(Name, Key: string);
procedure SFor65An55(Name, Key: string);
procedure SFor65An56(Name, Key: string);
procedure SFor65An57(Name, Key: string);
procedure SFor65An58(Name, Key: string);
procedure SFor65An59(Name, Key: string);
procedure SFor65An60(Name, Key: string);
procedure SFor65An61(Name, Key: string);
procedure SFor65An62(Name, Key: string);
procedure SFor65An63(Name, Key: string);
procedure SFor65An64(Name, Key: string);
procedure SFor65An65(Name, Key: string);

implementation

uses PT5TaskMaker;

const Pi = 3.14;
      dir : array [0..3] of char = ('�','�','�','�');
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
0: s1 := '����';
1: s1 := '����';
2: s1 := '���';
3: s1 := '���';
4: s1 := '������';
5: s1 := '����';
6: s1 := '�����';
7: s1 := '����';
8: s1 := '������';
9: s1 := '������';
end;
digit := s1;
end;


procedure SFor65An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{K} �~{N} ({N}~>~0). ������� {N}~��� �����~{K}.',0,3);
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

procedure SFor65An2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����~{A} �~{B} ({A}~<~{B}). ������� �\ ������� �����������',0,2);
taskText('��� ����� �����, ������������� �����~{A} �~{B} (������� ���� �����~{A} �~{B}),',0,3);
taskText('�\ ����� ����������~{N} ���� �����.',0,4);
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

procedure SFor65An3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����~{A} �~{B} ({A}~<~{B}). ������� �\ ������� ��������',0,2);
taskText('��� ����� �����, ������������� �����~{A} �~{B} (��\ ������� �����~{A} �~{B}),',0,3);
taskText('�\ ����� ����������~{N} ���� �����.',0,4);
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


procedure SFor65An4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ������������ �����\ \= ���� 1~�� ������.',0,2);
taskText('������� ��������� 1, 2,~\., 10~�� ������.',0,4);
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

procedure SFor65An5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('���� ������������ �����\ \= ���� 1~�� ������.',0,2);
taskText('������� ��������� 0.1, 0.2,~\., 1~�� ������.',0,4);
(*
*)
a := (100 + Random(900))/10;
dataR('',a,0,3,5);
for i := 1 to 10 do
  resultR('',i*a/10,center(i,10,6,2),3,6);
setNumberOfTests(3);
Pause;
end;

procedure SFor65An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� ������������ �����\ \= ���� 1~�� ������.',0,2);
taskText('������� ��������� 1.2, 1.4,~\., 2~�� ������.',0,4);
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

procedure SFor65An7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����~{A} �~{B} ({A}~<~{B}).',0,2);
taskText('����� ����� ���� ����� ����� ��~{A} ��~{B} ������������.',0,4);
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

procedure SFor65An8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����~{A} �~{B} ({A}~<~{B}).',0,2);
taskText('����� ������������ ���� ����� ����� ��~{A} ��~{B} ������������.',0,4);
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

procedure SFor65An9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����~{A} �~{B} ({A}~<~{B}).',0,2);
taskText('����� ����� ��������� ���� ����� ����� ��~{A} ��~{B} ������������.',0,4);
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

procedure SFor65An10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('����� �����\[ 1\;+\;1/2\;+\;1/3\;+\;\.\;+\;1/{N}\] (������������ �����).',0,4);
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

procedure SFor65An11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('����� �����\[ {N}^2\;+\;({N}\,+\,1)^2\;+\;({N}\,+\,2)^2\;+\;\.\;+\;(2\*{N})^2\] (����� �����).',0,4);
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

procedure SFor65An12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('����� ������������\[ 1.1\,\*\,1.2\,\*\,1.3\,\*\,\.\] ({N}~������������).',0,4);
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

procedure SFor65An13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('����� �������� ���������\[ 1.1\;\-\;1.2\;+\;1.3\;\-\;\.\] ({N}~���������,',0,3);
taskText('����� ����������). �������� �������� ��\ ������������.',0,4);
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

procedure SFor65An14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ����� ������� ������� �����,',0,1);
taskText('��������� ��� ���\ ���������� ��������� �������:',0,2);
taskText('\[{N}^2~=~1\;+\;3\;+\;5\;+\;\.\;+\;(2\*{N}\,\-\,1).\]',0,3);
taskText('����� ���������� �\ ����� ������� ���������� �������� ������� ��������',0,4);
taskText('����� (�\ ���������� ����� �������� �������� ���� ����� ����� ��~1 ��~{N}).',0,5);
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

procedure SFor65An15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~{A} �\ ����� �����~{N} (>\,0). �����~{A} �\ �������~{N}:',0,2);
taskText('\[{A}^N = {A}\*{A}\*\,\.\,\*{A}\]   (�����~{A} �������������~{N} ���).',0,4);
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

procedure SFor65An16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~{A} �\ ����� �����~{N} (>\,0).',0,2);
taskText('��������� ���� ����, ������� ��� ����� ������� �����~{A} ��~1 ��~{N}.',0,4);
(*
������������ ����� ������ �\ ����� (��� �\ ������� \2).
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

procedure SFor65An17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~{A} �\ ����� �����~{N} (>\,0).',0,2);
taskText('��������� ���� ����, ����� �����',0,3);
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

procedure SFor65An18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~{A} �\ ����� �����~{N} (>\,0).',0,2);
taskText('��������� ���� ����, ����� �������� ���������',0,3);
taskText('\[1\;\-\;{A}\;+\;{A}^2\;\-\;{A}^3\;+\;\.\;+\;(\-1)^N\*{A}^N.\]',0,4);
taskText('�������� �������� ��\ ������������.',0,5);
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

procedure SFor65An19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ����� ������������\[ {N}!~=~1\*2\*\.\*{N}\] (\I{N}\:���������\i).',0,2);
taskText('����� �������� �������������� ������������, ��������� ��� ������������',0,3);
taskText('�\ ������� ������������ ���������� �\ ������� ��� ��� ������������ �����.',0,4);
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

procedure SFor65An20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ��������� ���� ����, ����� �����',0,1);
taskText('\[1!\;+\;2!\;+\;3!\;+\;\.\;+\;{N}!    \](��������� {N}!\ \= \I{N}\:���������\i\ \= ����������',0,2);
taskText('������������ ���� ����� ����� ��~1 ��~{N}:\q   {N}!~=~1\*2\*\.\*{N}).',0,3);
taskText('����� �������� �������������� ������������, ��������� ����������',0,4);
taskText('�\ ������� ������������ ���������� �\ ������� ��������� ��� ������������ �����.',0,5);
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

procedure SFor65An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ��������� ���� ����, ����� �����',0,1);
taskText('\[1\;+\;1/(1!)\;+\;1/(2!)\;+\;1/(3!)\;+\;\.\;+\;1/({N}!)\]',0,2);
taskText('(��������� {N}!\ \= \I{N}\:���������\i\ \= ����������',0,3);
taskText('������������ ���� ����� ����� ��~1 ��~{N}:\q   {N}!~=~1\*2\*\.\*{N}).',0,4);
taskText('���������� ����� �������� ������������ ��������� ��������� {e}~=~exp(1).',0,5);
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
resultComment('����������: �������� exp(1) ����������� ����� '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~{X} �\ ����� �����~{N} (>\,0). ����� �������� ���������',0,2);
taskText('\[1\;+\;{X}\;+\;{X}^2/(2!)\;+\;\.\;+\;{X}^N/({N}!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). ���������� ����� �������� ������������ ���������',0,4);
taskText('������� exp �\ �����~{X}.',0,5);
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
resultComment('����������: �������� exp(X) ����������� ����� '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
s2 := 'sin';
taskText('���� ������������ �����~{X} �\ ����� �����~{N} (>\,0). ����� �������� ���������',0,2);
taskText('\[  {X}\;\-\;{X}^3/(3!)\;+\;{X}^5/(5!)\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N+1}/((2\*{N}+1)!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). ���������� ����� �������� ������������ ���������',0,4);
taskText('������� sin �\ �����~{X}.',0,5);
(*
*)
   end;
2: begin
s2 := 'cos';
taskText('���� ������������ �����~{X} �\ ����� �����~{N} (>\,0). ����� �������� ���������',0,2);
taskText('\[1\;\-\;{X}^2/(2!)\;+\;{X}^4/(4!)\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N}/((2\*{N})!)\]',0,3);
taskText('({N}!~=~1\*2\*\.\*{N}). ���������� ����� �������� ������������ ���������',0,4);
taskText('������� cos �\ �����~{X}.',0,5);
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
resultComment('����������: �������� '+s2+'(X) ����������� ����� '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,2,0,0,v1,v2,v3);
case v1 of
1: begin
         s2 := 'ln(1+X)';
taskText('���� ������������ �����~{X} (|{X}|\,<\,1) �\ ����� �����~{N} (>\,0).',0,2);
taskText('����� �������� ���������',0,3);
taskText('\[{X}\;\-\;{X}^2/2\;+\;{X}^3/3\;\-\;\.\;+\;(\-1)^{N\-1}\*{X}^N/{N}.\]',0,4);
taskText('���������� ����� �������� ������������ ��������� ������� ln �\ �����~1\,+\,{X}.',0,5);
(*
*)
   end;
2: begin
         s2 := 'arctg(X)';
taskText('���� ������������ �����~{X} (|{X}|\,<\,1) �\ ����� �����~{N} (>\,0).',0,2);
taskText('����� �������� ���������',0,3);
taskText('\[{X}\;\-\;{X}^3/3\;+\;{X}^5/5\;\-\;\.\;+\;(\-1)^N\*{X}^{2\*N+1}/(2\*{N}+1).\]',0,4);
taskText('���������� ����� �������� ������������ ��������� ������� arctg �\ �����~{X}.',0,5);
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
resultComment('����������: �������� '+s2+' ����������� ����� '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(1,2,0,0,v1,v2,v3);
case v1 of
1: begin
         s2 := 'arcsin(X)';
taskText('���� ������������ �����~{X} (|{X}|\,<\,1) �\ ����� �����~{N} (>\,0).',0,1);
taskText('����� �������� ���������',0,2);
taskText('\[{X}\;+\;1\*{X}^3/(2\*3)\;+\;1\*3\*{X}^5/(2\*4\*5)\;+\;\.\;+\|',0,3);
taskText('+\;1\*3\*\.\*(2\*{N}\-1)\*{X}^{2\*N+1}/(2\*4\*\.\*(2\*{N})\*(2\*{N}+1)).\]',0,4);
taskText('���������� ����� �������� ������������ ��������� ������� arcsin �\ �����~{X}.',0,5);
(*
*)
   end;
2: begin
         s2 := '\R1+X\r';
taskText('���� ������������ �����~{X} (|{X}|\,<\,1) �\ ����� �����~{N} (>\,0).',0,1);
taskText('����� �������� ���������',0,2);
taskText('\[1\;+\;{X}/2\;\-\;1\*{X}^2/(2\*4)\;+\;1\*3\*{X}^3/(2\*4\*6)\;\-\;\.\;+\|',0,3);
taskText('+\;(\-1)^{N\-1}\*1\*3\*\.\*(2\*{N}\-3)\*{X}^N/(2\*4\*\.\*(2\*{N})).\]',0,4);
taskText('���������� ����� �������� ������������ ��������� ������� \R1+{X}\r.',0,5);
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
resultComment('����������: �������� '+s2+' ����������� ����� '+s3,0,4);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(5,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1) �\ ��� ������������ ����� ��\ �������� ���: {A},\,{B} ({A}~<~{B}).',0,2);
taskText('������� [{A},\,{B}] ������ ��~{N} ������ ��������. �������~{H}\ \= ����� ������� �������,',0,3);
taskText('�\ ����� ����� �����\[ {A},\q {A}\,+\,{H},\q {A}\,+\,2\*{H},\q {A}\,+\,3\*{H},\q \.,\q {B},\]',0,4);
taskText('���������� ��������� ������� [{A},\,{B}].',0,5);
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
resultComment('��������� �������:',0,3);
for i := 1 to n do
  resultR('',x+(i-1)*z,center(i,n,7,1),4,7);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1) �\ ��� ������������ ����� ��\ �������� ���: {A},\,{B} ({A}~<~{B}).',0,2);
taskText('������� [{A},\,{B}] ������ ��~{N} ������ ��������. �������~{H}\ \= ����� ������� �������,',0,3);
taskText('�\ ����� �������� ������� {F}({X})~=~1\;\-\;sin({X}) �\ ������, �����������',0,4);
taskText('������� [{A},\,{B}]:\[    {F}({A}),\q {F}({A}\,+\,{H}),\q {F}({A}\,+\,2\*{H}),\q \.,\q {F}({B}).\]',0,5);
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
resultComment('�������� �������:',0,3);
for i := 1 to n do
  begin
  x0 := x+(i-1)*z;
  resultR('',1-sin(x0),center(i,n,7,1),4,7);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFor65An28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(7,2,0,0,v1,v2,v3);
if v1 = 1 then
  begin
  a := 2;
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('������������������ ������������ �����~{A}_{K} ������������ ��������� �������:',0,3);
taskText('\[{A}_{0}~=~2,\Q    {A}_{K}~=~2\;+\;1/{A}_{K\-1},\q  {K}~=~1,\,2,\,\.~.\]',0,4);
taskText('������� �������� {A}_{1}, {A}_{2},~\.,~{A}_{N}.',0,5);
(*
*)
  end
else
  begin
  a := 1;
taskText('���� ����� �����~{N} (>\,0).',0,2);
taskText('������������������ ������������ �����~{A}_{K} ������������ ��������� �������:',0,3);
taskText('\[{A}_{0}~=~1,\Q    {A}_{K}~=~({A}_{K\-1}\;+\;1)/{K},\q  {K}~=~1,\,2,\,\.~.\]',0,4);
taskText('������� �������� {A}_{1}, {A}_{2},~\.,~{A}_{N}.',0,5);
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



procedure SFor65An29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ������������������ \I����� ���������\i~{F}_{K}',0,2);
taskText('(������ ����) ������������ ��������� �������:',0,3);
taskText('\[{F}_{1}~=~1,\Q    {F}_{2}~=~1,\Q    {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\,4,\,\.~.\]',0,4);
taskText('������� �������� {F}_{1}, {F}_{2},~\.,~{F}_{N}.',0,5);
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

procedure SFor65An30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1).',0,2);
taskText('������������������ ������������ �����~{A}_{K} ������������ ��������� �������:',0,3);
taskText('\[{A}_{1}~=~1,\Q    {A}_{2}~=~2,\Q    {A}_{K}~=~({A}_{K\-2}\;+\;2\*{A}_{K\-1})/3,\q  {K}~=~3,\,4,\,\.~.\]',0,4);
taskText('������� �������� {A}_{1}, {A}_{2},~\.,~{A}_{N}.',0,5);
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

procedure SFor65An31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(10,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,2).',0,1);
taskText('������������������ ����� �����~{A}_{K} ������������ ��������� �������:',0,2);
taskText('\[{A}_{1}~=~1,\Q    {A}_{2}~=~2,\Q    {A}_{3}~=~3,',0,3);
taskText('\Q{A}_{K}~=~{A}_{K\-1}\;+\;{A}_{K\-2}\;\-\;2\*{A}_{K\-3},\q  {K}~=~4,\,5,\,\.~.\]',0,4);
taskText('������� �������� {A}_{1}, {A}_{2},~\.,~{A}_{N}.',0,5);
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



procedure SFor65An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;





procedure SFor65An33(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� ������������� �����~{N} �~{K}. ����� �����\[ 1^K\;+\;2^K\;+\;\.\;+\;{N}^K.\]',0,2);
taskText('����� �������� �������������� ������������, ��������� ��������� ���� �����',0,3);
taskText('�\ ������� ������������ ���������� �\ �������� ��������� ��� ������������ �����.',0,4);
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

procedure SFor65An34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(2,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('���� ����� �����~{N} (>\,0). ����� �����\[ 1^1\;+\;2^2\;+\;\.\;+\;{N}^N.\]',0,2);
taskText('����� �������� �������������� ������������, ��������� ��������� ���� �����',0,3);
taskText('�\ ������� ������������ ���������� �\ �������� ��������� ��� ������������ �����.',0,4);
(*
*)
end
else
begin
taskText('���� ����� �����~{N} (>\,0). ����� �����\[ 1^N\;+\;2^{N\-1}\;+\;\.\;+\;{N}^1.\]',0,2);
taskText('����� �������� �������������� ������������, ��������� ��������� ���� �����',0,3);
taskText('�\ ������� ������������ ���������� �\ �������� ��������� ��� ������������ �����.',0,4);
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

procedure SFor65An35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ����� ������������� �����~{A} �~{B} ({A}~<~{B}).',0,2);
taskText('������� ��� ����� ����� ��~{A} ��~{B} ������������; ��� ���� ������ �����',0,3);
taskText('������ ���������� ������� ���, ������ ��� ��������',0,4);
taskText('(��������, �����~3 ��������� 3~����).',0,5);
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



procedure SFor65An36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,18{level3});
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{A} �~{B} ({A}~<~{B}).',0,2);
taskText('������� ��� ����� ����� ��~{A} ��~{B} ������������; ��� ����',0,3);
taskText('�����~{A} ������ ����������~1 ���, ����� {A}\;+\;1 ������ ���������� 2~���� �~�.\,�.',0,4);
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

procedure SFor65An37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,18{level3});
getVariant(6,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;


procedure SFor65An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});(*DEMO*)
getVariant(10,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('���� ������������� �����~{A} �~{B} ({A}~>~{B}).',0,1);
taskText('��\ ������� �����~{A} ��������� ����������� ���������',0,2);
taskText('���������� �������� �����~{B} (���\ ���������).',0,3);
taskText('��\ ��������� �������� ��������� �\ �������,',0,4);
taskText('����� ����� ��������� ����� �������~{A}.',0,5);
(*
*)
end
else
begin
taskText('���� ������������� �����~{A} �~{B} ({A}~>~{B}).',0,1);
taskText('��\ ������� �����~{A} ��������� ����������� ���������',0,2);
taskText('���������� �������� �����~{B} (���\ ���������).',0,3);
taskText('��\ ��������� �������� ��������� �\ �������,',0,4);
taskText('����� ���������� ��������~{B}, ����������� ��\ �������~{A}.',0,5);
(*
*)
end;
a := 20 + Random(51) + Random(100)/100;
b := 2 + Random(18) + Random(100)/100;
dataR('A = ',a,xleft,3,5);
dataR('B = ',b,xright,3,5);
n := trunc(a/b);
if v1 = 1 then
resultR('����� ��������� �����: ',a-n*b,0,3,5)
else
resultN('���������� ��������: ',n,0,3,2);
setNumberOfTests(3);
pause;
end;



procedure SFor65An39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});
getVariant(8,0,0,0,v1,v2,v3);
taskText('���� ����� ������������� �����~{N} �~{K}.',0,2);
taskText('��������� ������ �������� �������� �\ ���������,',0,3);
taskText('����� ������� ��\ ������� ������~{N} ��~{K}, �\ ����� ������� ��\ ����� �������.',0,4);
(*
*)
(*==*)
n := 1 + Random(99);
k := 1 + Random(49);
dataN('N = ',n,xleft,3,2);
dataN('K = ',k,xright,3,2);
resultN('�������: ',n div k,xLeft,3,2);
resultN('�������: ',n mod k,xRight,3,2);
setNumberOfTests(5);
Pause;
end;




procedure SFor65An40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ���� ��� �������� �������� �����~3,',0,2);
taskText('��\ ������� \t, ���� ��\ ��������\ \= ������� \f.',0,4);
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

procedure SFor65An41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0), ���������� ��������� �������� �����~2: {N}~=~2^K.',0,2);
taskText('����� ����� �����~{K}\ \= ���������� ���� �������.',0,4);
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

procedure SFor65An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('',0,1);
taskText('���� ����� �����~{N} (>\,0). ����� \I������� ���������~{N}\i:\[ {N}!!~=~{N}\*({N}\-2)\*({N}\-4)\*\.\]',0,2);
taskText('(��������� ����������� �����~2, ���� {N}\ \= ������, �~1, ���� {N}\ \= ��������).',0,3);
taskText('����� �������� �������������� ������������, ��������� ��� ������������',0,4);
taskText('�\ ������� ������������ ���������� �\ ������� ��� ��� ������������ �����.',0,5);
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



procedure SFor65An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ����� ���������� ����� ������������� �����~{K},',0,2);
taskText('������� �������� �����������~{N}: {K}^2~>~{N}.',0,3);
taskText('������� ���������� ����������� ����� ��\ ������������.',0,4);
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

procedure SFor65An44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ����� ���������� ����� �����~{K},',0,2);
taskText('������� �������� ��\ ����������� {N}: {K}^2~\l~{N}.',0,3);
taskText('������� ���������� ����������� ����� ��\ ������������.',0,4);
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

procedure SFor65An45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ����� ���������� ����� �����~{K},',0,2);
taskText('��� ������� ����������� ����������� 3^K~>~{N}.',0,4);
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

procedure SFor65An46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ����� ���������� ����� �����~{K},',0,2);
taskText('��� ������� ����������� ����������� 3^K~<~{N}.',0,4);
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

procedure SFor65An47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ������� ���������� ��\ ����� �����~{K},',0,2);
taskText('��� ������� ����� 1\;+\;2\;+\;\.\;+\;{K} ����� ������ ��� �����~{N},',0,3);
taskText('�\ ���� ��� �����.',0,4);
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
resultN('�����: ',n1,xRight,3,2);
setNumberOfTests(5);
pause;
end;

procedure SFor65An48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ������� ���������� ��\ ����� �����~{K},',0,2);
taskText('��� ������� ����� 1\;+\;2\;+\;\.\;+\;{K} ����� ������ ��� �����~{N},',0,3);
taskText('�\ ���� ��� �����.',0,4);
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
resultN('�����: ',n1,xRight,3,2);
setNumberOfTests(5);
pause;
end;



procedure SFor65An49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('���� �����~{A} (>\,1). ������� ���������� ��\ ����� �����~{K},',0,2);
taskText('��� ������� ����� 1\;+\;1/2\;+\;\.\;+\;1/{K} ����� ������~{A},',0,3);
taskText('�\ ���� ��� �����.',0,4);
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
resultR('�����: ',y,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� �����~{A} (>\,1). ������� ���������� ��\ ����� �����~{K},',0,2);
taskText('��� ������� ����� 1\;+\;1/2\;+\;\.\;+\;1/{K} ����� ������~{A},',0,3);
taskText('�\ ���� ��� �����.',0,4);
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
resultR('�����: ',y,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('��������� ����� �\ ����� ����� 1000~���. � ����� �������',0,1);
taskText('������ ������ ������ ������������� ��\ {P}~��������� ��\ ��������� �����',0,2);
taskText('({P}~\= ������������ �����, 0\,<\,{P}\,<\,25). ��\ �������~{P} ����������, ����� �������',0,3);
taskText('������� ������ ������ �������� 1100~���., �\ ������� ��������� ����������',0,4);
taskText('�������~{K} (����� �����) �\ �������� ������ ������~{S} (������������ �����).',0,5);
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

procedure SFor65An52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���������-������ ����� ����������, �������� �\ ������ ���� 10~��. ������',0,1);
taskText('��������� ���� ��\ ���������� ����� ������� ��\ {P}~��������� ��\ �������',0,2);
taskText('����������� ��� ({P}~\= ������������, 0\,<\,{P}\,<\,50). ��\ �������~{P} ����������, �����',0,3);
taskText('������ ��� ��������� ������ ������� ��\ ��� ��� �������� 200~��, �\ �������',0,4);
taskText('��������� ���������� ����~{K} (�����) �\ ��������� ������~{S} (������������ �����).',0,5);
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

procedure SFor65An53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ��������� �������� ������� ������',0,2);
taskText('�\ ������ ������� ��\ �������, ������� ��� ��� �����,',0,3);
taskText('������� �\ ����� ������ (������� ������).',0,4);
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

procedure SFor65An54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ��������� �������� ������� ������',0,2);
taskText('�\ ������ ������� ��\ �������, ����� ���������� �\ ����� ���\ ����.',0,4);
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
resultN('���������� ����: ',k,xLeft,3,2);
resultN('����� ����: ',m1,xRight,3,2);
setNumberOfTests(6);
Pause;
end;

procedure SFor65An55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0). ��������� �������� ������� ������',0,2);
taskText('�\ ������ ������� ��\ �������, ����� �����,',0,3);
taskText('���������� ���\ ��������� �����~{N} ������ ������.',0,4);
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



procedure SFor65An56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1: begin
taskText('���� ����� �����~{N} (>\,0). �\ ������� ��������',0,2);
taskText('������� ������ �\ ������ ������� ��\ ������� ����������,',0,3);
taskText('�������\ �� �\ ������ �����~{N} �����~\<2\>. ���� �������,',0,4);
taskText('��\ ������� \t, ���� ���\ \= ������� \f.',0,5);
(*
*)
   end;
2: begin
taskText('���� ����� �����~{N} (>\,0). �\ ������� ��������',0,2);
taskText('������� ������ �\ ������ ������� ��\ ������� ����������,',0,3);
taskText('�������\ �� �\ ������ �����~{N} �������� �����. ���� �������,',0,4);
taskText('��\ ������� \t, ���� ���\ \= ������� \f.',0,5);
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


procedure SFor65An57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1). ���� ��� �������� \I�������\i,',0,2);
taskText('�.\,�. ��\ ����� ������������� ���������, �����~1 �\ ������ ����,',0,3);
taskText('��\ ������� \t, ����� ������� \f.',0,4);
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


procedure SFor65An58(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,21{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� ����� ������������� �����~{A} �~{B}.',0,2);
taskText('����� �� \I���������� ����� ��������\i (���), ��������� \I�������� �������\i:',0,3);
taskText('\[���({A}, {B})~=~���({B}, {A}\;mod\;{B}),\q ���� {B}~\n~0;\Q    ���({A}, 0)~=~{A},\]',0,4);
taskText('��� \<mod\> ���������� �������� ������ ������� ��\ �������.',0,5);
(*
*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
    n2 := n[1]*(Random(300)+1);
dataN('A = ',n1,xLeft,3,2);
dataN('B = ',n2,xRight,3,2);
resultN('���(A, B) = ',NOD(n1,n2),0,3,2);
setNumberOfTests(5);
pause;
end;



procedure SFor65An59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1).',0,1);
taskText('������������������ \I����� ���������\i~{F}_{K} ������������ ��������� �������:',0,2);
taskText('\[{F}_{1}~=~1,\Q    {F}_{2}~=~1,\Q    {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\,4,\,\.~.\]',0,3);
taskText('���������, ��������\ �� �����~{N} ������ ���������.',0,4);
taskText('���� ��������, ��\ ������� \t, ���� ���\ \= ������� \f.',0,5);
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

procedure SFor65An60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1).',0,2);
taskText('����� ������ ����� ���������, �������~{N}',0,3);
taskText('(����������� \I����� ���������\i ���� �\ ������� \1).',0,4);
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
{resultN('����� ���������: ',m,xLeft,3,3);
resultN('��� �����: ',k,xRight,3,2);}
setNumberOfTests(5);
Pause;
end;


procedure SFor65An61(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1), ���������� ������ ���������: {N}~=~{F}_{K}',0,2);
taskText('(����������� \I����� ���������\i ���� �\ ������� \2).',0,3);
taskText('����� ����� �����~{F}_{K\-1} �~{F}_{K+1}\ \= ���������� �\ ����������� ����� ���������.',0,4);
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
resultN('���������� �����: ',n1,xLeft,3,2);
resultN('����������� �����: ',n1+n,xRight,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFor65An62(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,1), ���������� ������ ���������: {N}~=~{F}_{K}',0,2);
taskText('(����������� \I����� ���������\i ���� �\ ������� \3).',0,3);
taskText('����� ����� �����~{K}\ \= ���������� ����� ����� ���������~{N}.',0,4);
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



procedure SFor65An63(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~\e (>\,0).',0,1);
taskText('������������������ ������������ ����� {A}_{K} ������������ ��������� �������:',0,2);
taskText('\[{A}_{1}~=~2,\Q   {A}_{K}~=~2\;+\;1/{A}_{K\-1},\q  {K}~=~2,\,3,\,\.~.\]',0,3);
taskText('����� ������ ��\ �������~{K}, ��� ������� ����������� �������',0,4);
taskText('|{A}_{K}\;\-\;{A}_{K\-1}|~<~\e, �\ ������� ���� �����, �\ ����� �����~{A}_{K\-1} �~{A}_{K}.',0,5);
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

procedure SFor65An64(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('���� ������������ �����~\e (>\,0).',0,1);
taskText('������������������ ������������ ����� {A}_{K} ������������ ��������� �������:',0,2);
taskText('\[{A}_{1}~=~1,\Q  {A}_{2}~=~2,\Q  {A}_{K}~=~({A}_{K\-2}\;+\;2\*{A}_{K\-1})/3,\q  {K}~=~3,\,4,\,\.~.\]',0,3);
taskText('����� ������ ��\ �������~{K}, ��� ������� ����������� �������',0,4);
taskText('|{A}_{K}\;\-\;{A}_{K\-1}|~<~\e, �\ ������� ���� �����, �\ ����� �����~{A}_{K\-1} �~{A}_{K}.',0,5);
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

procedure SFor65An65(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,21{level3});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ������������� �����~{A}, {B},~{C}.',0,1);
taskText('��\ �������������� �������~{A}\;\x\;{B} ��������� ����������� ���������',0,2);
taskText('���������� ��������� ��\ ��������~{C} (���\ ���������).',0,3);
taskText('����� ���������� ���������, ����������� ��\ ��������������.',0,4);
taskText('�������� ��������� � ������� �� ������������.',0,5);
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
resultN('���������� ���������: ',n1,0,3,3);
setNumberOfTests(3);
Pause;
end;





begin
Topic3 := '���� � ����������';
Topic2 := '���� � ����������: ��������� �����';
Topic1 := '���� � ��������';
{Author := '�.~�.~�������, 2002';}
end.
