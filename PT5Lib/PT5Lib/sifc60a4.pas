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
      dir : array [0..3] of char = ('�','�','�','�');
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

procedure SIfc60An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(1,0,0,0,v1,v2,v3);
{������� �� ������ 4.15
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('��\ ��������� �\ ����~1; �\ ��������� ������ ��\ ��������\ ���.',0,3);
taskText('������� ���������� �����.',0,4);
}
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('�� ������� �� ����~8; �\ ��������� ������ ��\ ��������\ ���.',0,3);
taskText('������� ���������� �����.',0,4);
(*
������������ ����������� �����
��������� ���������:
\(
\uPif <�������> then\|
~~<��������>;
\uVIf <�������> Then\|
~~<��������>\|
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
{������� �� ������ 4.15
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('�� ��������� � ����~1; �\ ��������� ������ ������� ��\ ����~2.',0,3);
taskText('������� ���������� �����.',0,4);
}
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('�� ������� �� ����~8; �\ ��������� ������ ��������� � ����~6.',0,3);
taskText('������� ���������� �����.',0,4);
(*
������������ ������ ����� ��������� ���������:
\(
\uPif <�������> then\|
~~<��������1>\|
else <��������2>;
\uVIf <�������> Then\|
~~<��������1>\|
Else\|
~~<��������2>\|
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
{������� �� ������ 4.15
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('�� ��������� � ����~1; ���� �������������, �� ������� ��\ ����~2;',0,3);
taskText('���� �������, ��\ �������� ��� ��~10. ������� ���������� �����.',0,4);
}
taskText('���� ����� �����. ���� ��� �������� �������������,',0,2);
taskText('�� ������� �� ����~8; ���� �������������, �� ��������� � ����~6;',0,3);
taskText('���� �������, ��\ �������� ��� ��~10. ������� ���������� �����.',0,4);
(*
������������ ��������� �������� ���������:
\(
\uPif <�������1> then\|
~~<��������1>\|
else if <�������2> then\|
~~<��������2>\|
else <��������3>;
\uVIf <�������1> Then\|
~~<��������1>\|
ElseIf <�������2> Then\|
~~<��������2>\|
Else\|
~~<��������3>\|
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
taskText('���� ��� ����� �����.',0,2);
taskText('����� ���������� ������������� ����� �\ �������� ������.',0,4);
(*
������������ ��������������� ����������-�������.
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
taskText('���� ��� ����� �����. ����� ���������� �������������',0,2);
taskText('�\ ���������� ������������� ����� �\ �������� ������.',0,4);
(*
������������ ��� ��������������� ����������-��������.
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
resultN('���������� ������������� �����: ',m,0,2,3);
resultN('���������� ������������� �����: ',k,0,4,3);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('���� ��� �����. ������� ������� ��\ ���.',0,3);
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
taskText('���� ��� �����. ������� ���������� ����� �������� ��\ ���.',0,3);
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
taskText('���� ��� �����.',0,2);
taskText('������� ������� �������, �\ ����� ������� ��\ ���.',0,4);
(*
*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('',a,xLeft,3,5);
dataR('',b,xRight,3,5);
if a > b then begin c := a; d := b; end
         else begin c := b; d := a; end;
resultR('������� �����: ',c,0,2,5);
resultR('������� �����: ',d,0,4,5);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ��� ���������� ������������� ����:~{A},~{B}.',0,2);
taskText('���������������� �������� ������ ���������� ���, �����',0,3);
taskText('�~{A} ��������� ������� ��\ ��������, �\ �~{B}\ \= �������.',0,4);
taskText('������� ����� �������� ����������~{A} �~{B}.',0,5);
(*
*)
(*==*)
a := Random*19.99-10; //2012
b := Random*19.99-10;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,xRight,3,5);
swap(a,b);
resultComment(' ����� �������� ����������:',0,2);
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
taskText('���� ��� ���������� ������ ����:~{A} �~{B}. ���� ��\ �������� ��\ �����,',0,2);
taskText('��\ ��������� ������ ���������� ����� ���� ��������,',0,3);
taskText('�\ ���� �����, ��\ ��������� ���������� ������� ��������.',0,4);
taskText('������� ����� �������� ����������~{A} �~{B}.',0,5);
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
resultComment(' ����� �������� ����������:',0,2);
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
taskText('���� ��� ���������� ������ ����:~{A} �~{B}. ���� ��\ �������� ��\ �����,',0,2);
taskText('��\ ��������� ������ ���������� ������� ��\ ���� ��������,',0,3);
taskText('�\ ���� �����, ��\ ��������� ���������� ������� ��������.',0,4);
taskText('������� ����� �������� ����������~{A} �~{B}.',0,5);
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
resultComment(' ����� �������� ����������:',0,2);
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
taskText('���� ��� �����. ����� ���������� ��\ ���.',0,3);
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
taskText('���� ��� �����. ����� ������� ��\ ���',0,2);
taskText('(�.\,�. �����, ������������� ����� ���������� �\ ����������).',0,4);
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
taskText('���� ��� �����. ������� ������� ����������,',0,2);
taskText('�\ ����� ���������� ��\ ������ �����.',0,4);
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
resultR('���������� �����: ',a,0,2,5);
resultR('���������� �����: ',b,0,4,5);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('���� ��� �����. ����� ����� ���� ���������� ��\ ���.',0,3);
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
taskText('���� ��� ���������� ������������� ����:~{A}, {B},\ {C}.',0,2);
taskText('���� ��\ �������� ����������� ��\ �����������, ��\ �������\ ��;',0,3);
taskText('�\ ��������� ������ �������� �������� ������ ���������� ��\ ���������������.',0,4);
taskText('������� ����� �������� ����������~{A}, {B},~{C}.',0,5);
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
resultComment(' ����� �������� ����������:',0,2);
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
taskText('���� ��� ���������� ������������� ����:~{A}, {B},\ {C}.',0,2);
taskText('���� ��\ �������� ����������� ��\ ����������� ���\ ��������, ��\ �������\ ��;',0,3);
taskText('�\ ��������� ������ �������� �������� ������ ���������� ��\ ���������������.',0,4);
taskText('������� ����� �������� ����������~{A}, {B},~{C}.',0,5);
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
resultComment(' ����� �������� ����������:',0,2);
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
taskText('���� ��� ����� �����, ���� ��\ ������� ������� ��\ ���� ������, ������',0,2);
taskText('����� �����. ���������� ���������� ����� �����, ��������� ��\ ���������.',0,4);
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
taskText('���� ������ ����� �����, ���� ��\ ������� ������� ��\ ���� ������, ������',0,2);
taskText('����� �����. ���������� ���������� ����� �����, ��������� ��\ ���������.',0,4);
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
taskText('��\ �������� ��� ����������� ��� �����:~{A}, {B},\ {C}.',0,2);
taskText('����������, ����� ��\ ���� ��������� ����� ({B} ���~{C}) ����������� ����� �~{A},',0,3);
taskText('�\ ������� ��� ����� �\ �� ���������� ��\ �����~{A}.',0,4);
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
resultR('��������� �����: ',b,0,2,6);
resultR('����������:      ',x1,0,4,6);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('���� ������������� ���������� ����� ��\ ���������.',0,1);
taskText('���� ����� ��������� �\ ������� ���������, ��\ �������~0.',0,2);
taskText('���� ����� ��\ ��������� �\ ������� ���������, ��\ �����',0,3);
taskText('��\ ���~{OX} ���~{OY}, ��\ ������� ��������������~1 ���~2.',0,4);
taskText('���� ����� ��\ ����� �� ������������ ����, ��\ �������~3.',0,5);
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
dataN2('���������� �����: ',n1,n2,0,3,3);
resultN('',n,0,3,1);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,12{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('���� ���������� �����, ��\ ������� ��\ ������������ ����~{OX} �~{OY}.',0,2);
taskText('���������� ����� ������������ ��������, �\ ������� ��������� ������ �����.',0,4);
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
dataR2('���������� �����:',x1,x2,0,3,6);
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
taskText('���� ������������� ���������� ���� ������ ��������������,',0,2);
taskText('������� �������� ����������� ������������ ����.',0,3);
taskText('����� ���������� ��� ��������� �������.',0,4);
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
taskText('��� ������� �������������~{x} ����� �������� ��������� �������~{f},',0,2);
taskText('����������� ������������ ��������:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~& 2\*sin({x}),& ���� {x}~>~0,',26,4);
taskText('        &\,&\,&6\;\-\;{x},&    ���� {x}~\l~0.\j\]',26,5);
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
taskText('��� ������� ������~{x} ����� �������� ��������� �������~{f},',0,2);
taskText('����������� �������� ������ ����:',0,3);
taskText('\[\Jrcrl&{f}({x})&~=~&  2\*{x},& ���� {x}~<~\-2 ��� {x}~>~2,',26,4);
taskText('&\,&\,&        \-3\*{x}&  � ��������� ������.\j\]',26,5);
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
taskText('��� ������� �������������~{x} ����� �������� ��������� �������~{f},',0,1);
taskText('����������� ������������ ��������:',0,2);
taskText('\[\Jrcrl&\,&\,&       \-{x},& ���� {x}~\l~0,',26,3);
taskText('&{f}({x})&~=~&{x}^2,& ���� 0~<~{x}~<~2,',26,4);
taskText('&\,&\,&        4,& ���� {x}~\g~2.\j\]',26,5);
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
taskText('��� ������� �������������~{x} ����� �������� ��������� �������~{f},',0,1);
taskText('����������� �������� ������ ����:',0,2);
taskText('\[\Jrcrl&\,&\,&        0,& ���� {x}~<~0,',18,3);
taskText('&{f}({x})&~=~& 1,& ���� {x} ����������� [0,\,1), [2,\,3),~\.,',18,4);
taskText('&\,&\,&       \-1,& ���� {x} ����������� [1,\,2), [3,\,4),~\. .\j\]',18,5);
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
taskText('��� ����� ���� (������������� ����� �����). ���������� ���������� ����',0,1);
taskText('�\ ���� ����, ��������, ��� ������� ��� ����������� 365~����, � ����������\ \=',0,2);
taskText('366~����. ���������� ��������� ���, ��������� ��~4, ��\ �����������',0,3);
taskText('��� �����, ������� ������� ��~100 � ��\ ������� ��~400 (��������,',0,4);
taskText('����~300, 1300 �~1900 ��\ �������� �����������, �~1200 �~2000\ \= ��������).',0,5);
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

taskText('���� ����� �����. ������� ��� ������-�������� ����',0,2);
taskText('\<������������� ������ �����\>, \<������� �����\>,',0,3);
taskText('\<������������� �������� �����\> �~�.\,�.',0,4);
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
0: begin m := 0; s1 := '������� �����'; end;
1: begin m := 2*(Random(49)+1); s1 := '������ �����'; end;
2: begin m := 2*(Random(49)+1)+1; s1 := '�������� �����'; end;
end;
if n<>0 then
  if Random(2)=0 then begin m := -m; s1 := '������������� '+s1; end
  else s1 := '������������� '+s1;
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

taskText('���� ����� �����, ������� � ��������� 1\:999.',0,2);
taskText('������� ��� ������-�������� ���� \<������ ���������� �����\>,',0,3);
taskText('\<�������� ����������� �����\> �~�.\,�.',0,4);
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
0: begin m := Random(9)+1; s1 := '����������� �����'; end;
1: begin m := Random(90)+10; s1 := '���������� �����'; end;
2: begin m := Random(900)+100; s1 := '����������� �����'; end;
end;
if m mod 2 = 0 then s1 := '������ '+s1
else s1 := '�������� '+s1;
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
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;



procedure SIfc60An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� ����� �\ ���������~1\:7. ������� ������\ \= �������� ��� ������,',0,2);
taskText('��������������� ������� ����� (1~\= \<�����������\>, 2~\= \<�������\> �~�.\,�.).',0,4);
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
1: s1 := '�����������';
2: s1 := '�������';
3: s1 := '�����';
4: s1 := '�������';
5: s1 := '�������';
6: s1 := '�������';
7: s1 := '�����������';
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

taskText('���� ����� �����~{K}. ������� ������-�������� ������,',0,2);
taskText('��������������� �����~{K} (1~\= \<�����\>, 2~\= \<�������������������\>,',0,3);
taskText('3~\= \<�����������������\>, 4~\= \<������\>, 5~\= \<�������\>).',0,4);
taskText('����~{K} ��\ ����� �\ ���������~1\:5, ��\ ������� ������ \<������\>.',0,5);
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
1: s1 := '�����';
2: s1 := '�������������������';
3: s1 := '�����������������';
4: s1 := '������';
5: s1 := '�������';
else s1 := '������';
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
taskText('��� ����� ������\ \= ����� ����� �\ ���������~1\:12',0,2);
taskText('(1~\= ������, 2~\= ������� �~�.\,�.). ������� ��������',0,3);
taskText('���������������� ������� ���� (\<����\>, \<�����\>, \<����\>, \<�����\>).',0,4);
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
1,2,12: s1 := '����';
3,4,5: s1 := '�����';
6,7,8: s1 := '����';
9,10,11: s1 := '�����';
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
taskText('��� ����� ������\ \= ����� ����� �\ ���������~1\:12',0,2);
taskText('(1~\= ������, 2~\= ������� �~�.\,�.). ����������',0,3);
taskText('���������� ���� �\ ���� ������ ��� ������������� ����.',0,4);
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
taskText('�������������� �������� ��� ������� ������������� ��������� �������:',0,2);
taskText('1~\= ��������, 2~\= ���������, 3~\= ���������, 4~\= �������.',0,3);
taskText('��� ����� ��������~{N} (����� ����� � ��������� 1\:4) �\ ������������ �����~{A} �~{B}',0,4);
taskText('({B} ��\ ����� 0). ��������� ��� ������� ��������� �������� �\ ������� ���������.',0,5);
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
taskText('������� ����� ������������� ��������� �������:',0,1);
taskText('1~\= ��������, 2~\= ��������, 3~\= ����, 4~\= ���������, 5~\= ���������.',0,2);
taskText('��� ����� ������� ����� (����� ����� � ��������� 1\:5) ',0,3);
taskText('�\ ����� ������� �\ ���� �������� (������������ �����).',0,4);
taskText('����� ����� ������� �\ ������.',0,5);
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
1: begin y := x/10; k := 3;   s1 := '��): '; end;
2: begin y := x*1000; k := 1; s1 := '��): '; end;
3: begin y := x;    k := 2;   s1 := '�):  '; end;
4: begin y := x/1000; k := 5; s1 := '��): '; end;
5: begin y := x/100; k := 4;  s1 := '��): '; end;
end;
dataR('����� ������� ('+s1,x,28,4,4);
setPrecision(k);
resultR('����� ������� (�):  ',y,28,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������� ����� ������������� ��������� �������:',0,1);
taskText('1~\= ���������, 2~\= ����������, 3~\= �����, 4~\= �����, 5~\= �������.',0,2);
taskText('��� ����� ������� ����� (����� ����� � ��������� 1\:5) ',0,3);
taskText('�\ ����� ���� �\ ���� �������� (������������ �����).',0,4);
taskText('����� ����� ���� �\ �����������.',0,5);
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
1: begin y := x; k := 2;          s1 := '��): '; end;
2: begin y := x/1000000.; k := 8; s1 := '��): '; end;
3: begin y := x/1000;    k := 5;  s1 := '�):  '; end;
4: begin y := x*1000; k := 1;     s1 := '�):  '; end;
5: begin y := x*100; k := 1;      s1 := '�):  '; end;
end;
dataR('����� ���� ('+s1,x,28,4,4);
setPrecision(k);
resultR('����� ���� (��): ',y,28,3,4);
setNumberOfTests(9);
Pause;
end;

procedure SIfc60An39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(3,0,0,0,v1,v2,v3);
taskText('���� ��� ����� �����:~{D} (����) �~{M} (�����),',0,2);
taskText('������������ ���������� ���� ������������� ����.',0,3);
taskText('������� ��������~{D} �~{M} ��� ����, �������������� ���������.',0,4);
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
dataComment('�������� ����:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment('���������� ����:',0,2);
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
taskText('���� ��� ����� �����:~{D} (����) �~{M} (�����),',0,2);
taskText('������������ ���������� ���� ������������� ����.',0,3);
taskText('������� ��������~{D} �~{M} ��� ����, ��������� ��\ ���������.',0,4);
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
dataComment('�������� ����:',0,2);
dataN('D = ',n1,xLeft,3,2);
dataN('M = ',m+1,xRight,3,2);
resultComment('��������� ����:',0,2);
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
taskText('����� ����� ������������ �\ ������� ������������ (\<�\>~\= �����, \<�\>~\= �����,',0,1);
taskText('\<�\>~\= ��, \<�\>~\= ������) �\ ��������� ��� �������� �������:',0,2);
taskText('0~\= ���������� ��������, 1~\= ������� ������, \-1~\= ������� �������.',0,3);
taskText('��� ������~{C}\ \= �������� ����������� ������ �\ ����� ����� {N}\ \= ��������� ���',0,4);
taskText('�������. ������� ����������� ������ ����� ���������� ���������� �������.',0,5);
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
dataC('�������� �����������: C = ',dir[n],0,2);
dataN('�������: N = ',m,0,4,2);
resultC('����� �����������: ',dir[n1],0,3);
setNumberOfTests(9);
pause;
end;

procedure SIfc60An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('������� ������������ ��\ ���� ��\ ������ ����� (\<�\>~\= �����, \<�\>~\= �����,',0,1);
taskText('\<�\>~\= ��, \<�\>~\= ������) �\ ����� ��������� ��� �������� ������� ��������:',0,2);
taskText('1~\= ������� ������, \-1~\= ������� �������, 2~\= ������� �� 180\o.',0,3);
taskText('��� ������~{C}\ \= �������� ���������� �������� �\ ����� �����~{N}_1 �~{N}_2\ \= ���',0,4);
taskText('��������� �������. ������� ���������� �������� ����� ���������� ���� ������.',0,5);
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
dataC('�������� ����������: C = ',dir[n],0,2);
dataComment('�������:',0,3);
dataN('N_1 = ',m1,xLeft,4,2);
dataN('N_2 = ',m2,xRight,4,2);
resultC('����� ����������: ',dir[n1],0,3);
setNumberOfTests(9);
Pause;
end;



procedure SIfc60An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,15{level2});
getVariant(10,0,0,0,v1,v2,v3);
taskText('�������� ���������� ������������� ��������� �������: 1~\= ������~{R},',0,1);
taskText('2~\= �������~{D}~=~2\*{R}, 3~\= �����~{L}~=~2\*\p\*{R}, 4~\= ������� �����~{S}~=~\p\*{R}^2.',0,2);
taskText('��� ����� ������ ��\ ���� ��������� �\ ��� ��������.',0,3);
taskText('������� �������� ��������� ��������� ������ ���������� (�\ ��� �� �������).',0,4);
taskText('� �������� �������� \p ������������ 3.14.',0,5);
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
taskText('�������� ��������������� �������������� ������������ �������������',0,1);
taskText('��������� �������: 1~\= �����~{a}, 2~\= ����������~{c}~=~{a}\*\R2\r,',0,2);
taskText('3~\= ������~{h}, ��������� �� ���������� ({h}~=~{c}/2), 4~\= �������~{S}~=~{c}\*{h}/2.',0,3);
taskText('��� ����� ������ ��\ ���� ��������� �\ ��� ��������.',0,4);
taskText('������� �������� ��������� ��������� ������� ������������ (�\ ��� �� �������).',0,5);
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
taskText('�������� ��������������� ������������ ������������� ��������� �������:',0,1);
taskText('1~\= �������~{a}, 2~\= ������~{R}_1 ��������� ���������� ({R}_1~=~{a}\*\R3\r/6),',0,2);
taskText('3~\= ������~{R}_2 ��������� ���������� ({R}_2~=~2\*{R}_1), 4~\= �������~{S}~=~{a}^2\*\R3\r/4.',0,3);
taskText('��� ����� ������ ��\ ���� ��������� �\ ��� ��������.',0,4);
taskText('������� �������� ��������� ��������� ������� ������������ (�\ ��� �� �������).',0,5);
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
taskText('������ ��������� ���� ��������� ���������� ������: 1~\= ����, 2~\= �����,',0,1);
taskText('3~\= �����, 4~\= �����. ����������� ����, ������� �������, ��������� ������:',0,2);
taskText('11~\= �����, 12~\= ����, 13~\= ������, 14~\= ���. ���� ��� ����� �����: {N}~\=',0,3);
taskText('����������� (6~\l~{N}~\l~14) � {M}~\= ����� ����� (1~\l~{M}~\l~4). ������� ��������',0,4);
taskText('��������������� ����� ���� \<�������� �����\>, \<���� ������\>, \<��� ����\> �~�.\,�.',0,5);
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
dataN('�����������: N = ',n,xLeft,3,2);
dataN('�����: M = ',m,xRight,3,1);
case N of
6: s := '��������';
7: s := '�������';
8: s := '���������';
9: s := '�������';
10: s := '�������';
11: s := '�����';
12: s := '����';
13: s := '������';
14: s := '���';
end;
case M of
1: s := s + ' ���';
2: s := s + ' ����';
3: s := s + ' �����';
4: s := s + ' ������';
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
taskText('���� ����� ����� �\ ���������~20\:69, ������������ ������� (�\ �����).',0,2);
taskText('������� ������-�������� ���������� ��������, ���������',0,3);
taskText('���������� ������������ ����� ��\ ������ \<���\>, ��������:',0,4);
taskText('20~\= \<�������� ���\>, 32~\= \<�������� ��� ����\>, 41~\= \<����� ���� ���\>.',0,5);
(*
*)
(*==*)
n := 2+Random(5);
case n of
2: s1 := '��������';
3: s1 := '��������';
4: s1 := '�����';
5: s1 := '���������';
6: s1 := '����������';
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
     s1 := s1 + ' ���';
   end;
1: begin
     n:=n*10+1;
     s1 := s1 + ' ���� ���';
   end;
2: begin
     n1 := Random(3)+2;
     n:=n*10+n1;
     s1 := s1 + ' '+digit(n1)+' ����';
   end;
3: begin
     n1 := Random(5)+5;
     n:=n*10+n1;
     s1 := s1 + ' '+digit(n1)+' ���';
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
taskText('���� ����� ����� �\ ���������~10\:40, ������������ ���������� ������� �������',0,1);
taskText('��\ ��������� ����. ������� ������-�������� ���������� ���������� �������,',0,2);
taskText('��������� ���������� ������������ ����� ��\ ������� \<������� �������\>,',0,3);
taskText('��������: 18~\= \<������������ ������� �������\>,',0,4);
taskText('23~\= \<�������� ��� ������� �������\>, 31~\= \<�������� ���� ������� �������\>.',0,5);
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
s := ' ������� �������';
case n1 of
0: s2 := s;
1: s2 := ' ���� ������� �������';
2..4: s2 := ' '+ digit(n1)+' ������� �������';
5..9: s2 := ' '+digit(n1)+ s;
end;
case n of
1: begin
   case n1 of
     0: s1 := '������';
     1: s1 := '�����������';
     2: s1 := '����������';
     3: s1 := '����������';
     4: s1 := '������������';
     5: s1 := '����������';
     6: s1 := '�����������';
     7: s1 := '����������';
     8: s1 := '������������';
     9: s1 := '������������';
     end;
    s1 := s1 + s;
    end;
2: s1 := '��������' + s2;
3: s1 := '��������' + s2;
4: s1 := '�����' + s2;
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
taskText('���� ����� ����� �\ ���������~100\:999.',0,2);
taskText('������� ������-�������� ������� �����, ��������:',0,3);
taskText('256~\= \<������ ��������� �����\>, 814~\= \<��������� ������������\>.',0,4);
(*
*)
n := 1+Random(8);
case n of
1: s1 := '���';
2: s1 := '������';
3: s1 := '������';
4: s1 := '���������';
5..9: s1 := digit(n)+'���';
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
     10: s1 := s1 + ' ������';
     11: s1 := s1 + ' �����������';
     12: s1 := s1 + ' ����������';
     13: s1 := s1 + ' ����������';
     14: s1 := s1 + ' ������������';
     15: s1 := s1 + ' ����������';
     16: s1 := s1 + ' �����������';
     17: s1 := s1 + ' ����������';
     18: s1 := s1 + ' ������������';
     19: s1 := s1 + ' ������������';
     end;
   end;
3: begin
     n1 := 2+Random(8);
     n2 := Random(10);
     n:=n*100+n1*10+n2;
     case n1 of
     2: s1 := s1 + ' ��������';
     3: s1 := s1 + ' ��������';
     4: s1 := s1 + ' �����';
     5..8: s1 := s1 + ' '+digit(n1)+'�����';
     9: s1 := s1 + ' ���������';
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
taskText('�\ ��������� ��������� ������ 60-������ ����, ��������� ��\ 12-������ ���������,',0,1);
taskText('������������ ���������� �����: �������, �������, ������, ����� �\ ������.',0,2);
taskText('�\ ������ �������� ���� ����� �������� ��������: �����, ������, �����, �����,',0,3);
taskText('�������, ����, ������, ����, ��������, ������, ������ �\ ������. ��\ ������ ����',0,4);
taskText('���������� ��� ��������, ���� 1984~���\ \= ������ �����: \<��� ������� �����\>.',0,5);
(*
*)
(*==*)
n := 1800+Random(300);
m := (n-1984+12000) mod 60; // �������� ������! 2016.12.11 (+12000)
//if m<0 then m := m + 60;
case m div 12 of
0: s1 := '��� ������';
1: s1 := '��� ������';
2: s1 := '��� �����';
3: s1 := '��� ����';
4: s1 := '��� �����';
end;
case m mod 12 of
0: s1 := s1 + '� �����';
1: s1 := s1 + '� ������';
2: s1 := s1 + '�� �����';
3: s1 := s1 + '�� �����';
4: s1 := s1 + '�� �������';
5: s1 := s1 + '� ����';
6: s1 := s1 + '� ������';
7: s1 := s1 + '� ����';
8: s1 := s1 + '� ��������';
9: s1 := s1 + '� ������';
10: s1 := s1 + '� ������';
11: s1 := s1 + '� ������';
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
taskText('���� ��� ����� �����:~{D} (����) �~{M} (�����), ������������ ���������� ����.',0,1);
taskText('������� ���� �������, ��������������� ���� ����: \<�������\> (20.1\:18.2), \<����\>',0,2);
taskText('(19.2\:20.3), \<����\> (21.3\:19.4), \<�����\> (20.4\:20.5), \<��������\> (21.5\:21.6),',0,3);
taskText('\<���\> (22.6\:22.7), \<���\> (23.7\:22.8), \<����\> (23.8\:22.9), \<����\> (23.9\:22.10),',0,4);
taskText('\<��������\> (23.10\:22.11), \<�������\> (23.11\:21.12), \<�������\> (22.12\:19.1).',0,5);
(*
*)
(*==*)
z[1] := '�������'; z[2] := '����'; z[3] := '����'; z[4] := '�����'; z[5] := '��������';
z[6] := '���'; z[7] := '���'; z[8] := '����'; z[9] := '����'; z[10] := '��������';
z[11] := '�������'; z[12] := '�������';
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
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An58(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

procedure SIfc60An60(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,15{level2});
getVariant(7,0,0,0,v1,v2,v3);
taskText('������������ �������',0,3);
(*
*)
dataS('','�������� ������',0,3);
resultS('','�������������� ������',0,3);
setNumberOfTests(5);
pause;
end;

begin
Topic1 := '�������� ��������';
Topic2 := '�������� ������';
{Author := '�.~�.~�������, 2002';}
end.
