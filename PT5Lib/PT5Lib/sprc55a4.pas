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
'��������������������������������'+
'��������������������������������';
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
'��������������������������������'+
'��������������������������������';
k := length(c0);
for i:=1 to N do
  s := s + c0[Random(k)+1];
stroka1 := s;
end;
function stroka_(N : integer) : string;
const c : string = '(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'��������������������������������'+
'��������������������������������';
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
taskText('������� ��������� PowerA3({A},\ {B}), ����������� ������ ������� �����~{A}',0,2);
taskText('�\ ������������ �� �\ ����������~{B} ({A}\ \= �������, {B}\ \= �������� ��������;',0,3);
taskText('��� ��������� �������� �������������). �\ ������� ���� ���������',0,4);
taskText('����� ������ ������� ���� ������ �����.',0,5);
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
taskText('������� ��������� PowerA234({A}, {B}, {C}, {D}), ����������� ������, ������',0,1);
taskText('�\ ��������� ������� �����~{A} �\ ������������ ���\ ������� ��������������',0,2);
taskText('�\ ����������~{B}, {C} �~{D} ({A}\ \= �������, {B},~{C}, {D}\ \= �������� ���������;',0,3);
taskText('��� ��������� �������� �������������). �\ ������� ���� ��������� �����',0,4);
taskText('������, ������ �\ ��������� ������� ���� ������ �����.',0,5);
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
taskText('������� ��������� Mean({X}, {Y}, {AMean}, {GMean}), ����������� \I������� ��������������\i',0,1);
taskText('{AMean}~=~({X}+{Y})/2 �\ \I������� ��������������\i {GMean}~=~\R{X}\*{Y}\r ���� �������������',0,2);
taskText('�����~{X} �~{Y} ({X} �~{Y}\ \= �������, {AMean} �~{GMean}\ \= �������� ��������� �������������',0,3);
taskText('����). �\ ������� ���� ��������� ����� ������� �������������� �\ �������',0,4);
taskText('�������������� ���\ ��� ({A},\;{B}), ({A},\;{C}), ({A},\;{D}), ���� ����~{A},~{B}, {C},~{D}.',0,5);
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
taskText('������� ��������� TrianglePS({a}, {P},\ {S}), ����������� �� �������~{a}',0,1);
taskText('��������������� ������������ ��� ��������~{P}~=~3\*{a} �\ �������~{S}~=~{a}^2\*\R3\r/4',0,2);
taskText('({a}\ \= �������, {P} �~{S}\ \= �������� ���������; ��� ��������� ��������',0,3);
taskText('�������������). �\ ������� ���� ��������� ����� ��������� �\ �������',0,4);
taskText(' ���� �������������� ������������� �\ ������� ���������.',0,5);
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
taskText('������� ��������� RectPS({x}_1,\,{y}_1,\,{x}_2,\,{y}_2,\,{P},\,{S}), ����������� ��������~{P} �\ �������~{S}',0,1);
taskText('�������������� ��\ ���������, ������������� ���� ���������, ��\ �����������',0,2);
taskText('({x}_1,\,{y}_1), ({x}_2,\,{y}_2) ��� ��������������� ������ ({x}_1,\,{y}_1,\,{x}_2,\,{y}_2\ \= �������,'+
         ' {P} �~{S}\ \=',0,3);
taskText('�������� ��������� ������������� ����). �\ ������� ���� ��������� �����',0,4);
taskText('��������� �\ ������� ���� ��������������� �\ ������� ���������������� ���������.',0,5);
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
1: dataComment('������ �������������:',5,i+1);
2: dataComment('������ �������������:',5,i+1);
3: dataComment('������ �������������:',5,i+1);
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
taskText('������� ��������� DigitCountSum({K}, {C},\ {S}), ��������� ����������~{C}',0,1);
taskText('���� ������ �������������� �����~{K}, �\ ����� ��\ �����~{S}',0,2);
taskText('({K}~\= �������, {C} �~{S}\ \= �������� ��������� ������ ����).',0,3);
taskText('�\ ������� ���� ��������� ����� ���������� �\ ����� ����',0,4);
taskText('���\ ������� ��\ ���� ������ ����� �����.',0,5);
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
taskText('������� ��������� InvDigits({K}), �������� ������� ���������� ����',0,1);
taskText('������ �������������� �����~{K} ��\ �������� ({K}\ \= �������� ������ ����,',0,2);
taskText('���������� ������������ ������� �\ ��������). �\ ������� ���� ���������',0,3);
taskText('�������� ������� ���������� ���� ��\ ��������',0,4);
taskText('���\ ������� ��\ ���� ������ ����� �����.',0,5);
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
taskText('������� ��������� AddRightDigit({D}, {K}), ����������� �\ ������ ��������������',0,1);
taskText('�����~{K} ������ �����~{D} ({D}\ \= ������� �������� ������ ����, ������� �\ ���������\',0,2);
taskText('0\:9, {K}\ \= �������� ������ ����, ���������� ������������ ������� �\ ��������).',0,3);
taskText('�\ ������� ���� ��������� ��������������� �������� �\ ������� �����~{K} ������',0,4);
taskText('������ �����~{D}_1 � {D}_2, ������ ��������� ������� ����������.',0,5);
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
taskText('������� ��������� AddLeftDigit({D}, {K}), ����������� �\ ������ ��������������',0,1);
taskText('�����~{K} ����� �����~{D} ({D}\ \= ������� �������� ������ ����, ������� �\ ���������\',0,2);
taskText('1\:9, {K}\ \= �������� ������ ����, ���������� ������������ ������� �\ ��������).',0,3);
taskText('�\ ������� ���� ��������� ��������������� �������� �\ ������� �����~{K} �����',0,4);
taskText('������ �����~{D}_1 � {D}_2, ������ ��������� ������� ����������.',0,5);
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
taskText('������� ��������� Swap({X}, {Y}), �������� ���������� ����������~{X} �~{Y}',0,1);
taskText('({X} �~{Y}\ \= ������������ ���������, ���������� ������������ ��������',0,2);
taskText('�\ ���������). �\ ��\ ������� ���\ ������ ����������~{A}, {B}, {C},~{D}',0,3);
taskText('��������������� �������� ���������� ��������� ���: {A} �~{B}, {C} �~{D}, {B} �~{C}',0,4);
taskText('�\ ������� ����� ��������~{A},~{B}, {C},~{D}.',0,5);
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
taskText('������� ��������� Minmax({X}, {Y}), ������������ �\ ����������~{X} �����������',0,1);
taskText('��\ ��������~{X} �~{Y}, �\ �\ ����������~{Y}\ \= ������������ ��\ ���� ��������',0,2);
taskText('({X} �~{Y}\ \= ������������ ���������, ���������� ������������ ��������',0,3);
taskText('�\ ���������). ��������� ������ ������ ���� ���������,',0,4);
taskText('����� ����������� �\ ������������ ��\ ������ �����~{A},~{B}, {C},~{D}.',0,5);
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
taskText('������� ��������� SortInc3({A}, {B},~{C}), �������� ���������� ����������~{A}, {B},~{C}',0,1);
taskText('����� �������, ����� ��\ �������� ��������� �������������� ��\ �����������',0,2);
taskText('({A},~{B}, {C}\ \= ������������ ���������, ���������� ������������ ��������',0,3);
taskText('�\ ���������). �\ ������� ���� ��������� ����������� ��\ �����������',0,4);
taskText('���\ ������ ������ ��\ ���� �����: ({A}_1, {B}_1, {C}_1) � ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end
else
begin
s1 := 'Dec';
taskText('������� ��������� SortDec3({A}, {B},~{C}), �������� ���������� ����������~{A}, {B},~{C}',0,1);
taskText('����� �������, ����� ��\ �������� ��������� �������������� ��\ ��������',0,2);
taskText('({A},~{B}, {C}\ \= ������������ ���������, ���������� ������������ ��������',0,3);
taskText('�\ ���������). �\ ������� ���� ��������� ����������� ��\ ��������',0,4);
taskText('���\ ������ ������ ��\ ���� �����: ({A}_1, {B}_1, {C}_1) � ({A}_2, {B}_2, {C}_2).',0,5);
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
taskText('������� ��������� ShiftRight3({A}, {B},~{C}), ����������� \I������ ����������� �����\i:',0,1);
taskText('��������~{A} ��������� �~{B}, ��������~{B}\ \= �~{C}, ��������~{C}\ \= �~{A}',0,2);
taskText('({A}, {B},~{C}\ \= ������������ ���������, ���������� ������������ ��������',0,3);
taskText('�\ ���������). �\ ������� ���� ��������� ��������� ������ ����������� �����',0,4);
taskText('��� ���� ������ ������� ��\ ���� �����: ({A}_1, {B}_1, {C}_1) � ({A}_2, {B}_2, {C}_2).',0,5);
(*
*)
end
else
begin
s1 := 'Left';
s2 := ' ';
taskText('������� ��������� ShiftLeft3({A}, {B},~{C}), ����������� \I����� ����������� �����\i:',0,1);
taskText('��������~{A} ��������� �~{C}, ��������~{C}\ \= �~{B}, ��������~{B}\ \= �~{A}',0,2);
taskText('({A}, {B},~{C}\ \= ������������ ���������, ���������� ������������ ��������',0,3);
taskText('�\ ���������). �\ ������� ���� ��������� ��������� ����� ����������� �����',0,4);
taskText('��� ���� ������ ������� ��\ ���� �����: ({A}_1, {B}_1, {C}_1) � ({A}_2, {B}_2, {C}_2).',0,5);
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
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SPrc55An17(Name, Key: string);
var v1,v2,v3 : byte;
    a: array[1..2] of real;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('������� ������� Sign({X}) ������ ����, ������������ ���\ ������������� �����~{X}',0,1);
taskText('��������� ��������:',0,2);
taskText('\[\-1,\q ���� {X}~<~0;\Q         0,\q ���� {X}~=~0;\Q         1,\q ���� {X}~>~0.\]',0,3);
taskText('�\ ������� ���� ������� ����� �������� ��������� Sign({A})\;+\;Sign({B})',0,4);
taskText('���\ ������ ������������ �����~{A} �~{B}.',0,5);
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
taskText('������� ������� RootCount({A}, {B},~{C}) ������ ����, ������������',0,1);
taskText('���������� ������ ����������� ��������� {A}\*{x}^2\;+\;{B}\*{x}\;+\;{C}~=~0',0,2);
taskText('({A},~{B}, {C}\ \= ������������ ���������, {A}~\n~0). �\ ��\ ������� ����� ����������',0,3);
taskText('������ ���\ ������� ��\ ���� ���������� ��������� �\ ������� ��������������.',0,4);
taskText('���������� ������ ���������� ��\ �������� \I�������������\i: \[{D}~=~{B}^2\;\-\;4\*{A}\*{C}.\]',0,5);
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
  TaskText('������� ������� CircleS({R}) ������������� ����, ��������� ������� �����', 0, 2);
  TaskText('�������~{R} ({R}\ \= ������������). �\ ������� ���� ������� ����� �������', 0, 3);
  TaskText('���� ������ �\ ������� ���������. ������� ����� �������~{R} �����������', 0, 4);
  TaskText('��\ ������� {S}~=~\p\*{R}^2. �\ �������� �������� \p ������������~3.14.', 0, 5);
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
  TaskText('������� ������� RingS({R}_1, {R}_2) ������������� ����, ��������� ������� ������,', 0, 1);
  TaskText('������������ ����� ����� ������������ �\ ����� ������� �\ ���������~{R}_1 �~{R}_2', 0, 2);
  TaskText('({R}_1 �~{R}_2\ \= ������������, {R}_1~>~{R}_2). �\ ��\ ������� ����� ������� ���� �����,', 0, 3);
  TaskText('���\ ������� ���� ������� �\ ���������� �������. ��������������� ��������', 0, 4);
  TaskText('������� ����� �������~{R}: {S}~=~\p\*{R}^2. �\ �������� ��������~\p ������������~3.14.', 0, 5);
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
  1: datacomment('������ ������:',17,i+1);
  2: datacomment('������ ������:',17,i+1);
  3: datacomment('������ ������:',17,i+1);
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
taskText('������� ������� TriangleP({a},\ {h}), ��������� �������� ���������������',0,1);
taskText('������������ ��\ ��� ���������~{a} �\ ������~{h}, ����������� �\ ��������� ({a} �~{h}\ \=',0,2);
taskText('������������). �\ ������� ���� ������� ����� ��������� ���� �������������,',0,3);
taskText('���\ ������� ���� ��������� �\ ������. ���\ ���������� ������� �������~{b}',0,4);
taskText('������������ ������������ \I������� ��������\i:\[  {b}^2~=~({a}/2)^2\;+\;{h}^2.\]',0,5);
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
  TaskText('������� ������� SumRange({A}, {B}) ������ ����, ��������� ����� ���� ����� �����', 0, 2);
  TaskText('��~{A} ��~{B} ������������ ({A}\ �~{B}\ \= �����). ���� {A}~>~{B}, ��\ ������� ����������~0.', 0, 3);
  TaskText('�\ ������� ���� ������� ����� ����� ����� ��~{A} ��~{B} �\ ��~{B} ��~{C},', 0, 4);
  TaskText('���� ���� �����~{A}, {B},~{C}.', 0, 5);
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
  TaskText('������� ������� Calc({A}, {B}, {Op}) ������������� ����, ����������� ���\ ����������', 0, 1);
  TaskText('������������� �������~{A} �~{B} ���� ��\ �������������� �������� �\ ������������', 0, 2);
  TaskText('��\ ���������. ��� �������� ������������ ����� ����������~{Op}: 1\ \= ���������,', 0, 3);
  TaskText('2\ \= ���������, 3\ \= �������, ��������� ��������\ \= ��������. �\ �������\ Calc', 0, 4);
  TaskText('��������� ���\ ������~{A} �~{B} ��������, ������������ ������� ������~{N}_1, {N}_2,~{N}_3.', 0, 5);
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
  TaskText('������� ������� Quarter({x}, {y}) ������ ����, ������������ �����', 0, 1);
  TaskText('������������ ��������, �\ ������� ��������� ����� �\ ����������', 0, 2);
  TaskText('������������� ������������ ({x},~{y}). �\ ������� ���� ������� �����', 0, 3);
  TaskText('������ ������������ ��������� ���\ ���� �����', 0, 4);
  TaskText('�\ ������� ���������� ������������.', 0, 5);
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
taskText('������� ������� Even({K}) ����������� ����, ������������ \t,',0,2);
taskText('���� ����� ��������~{K} �������� ������, �\ \f �\ ��������� ������.',0,3);
taskText('�\ ��\ ������� ����� ���������� ������ ����� �\ ������ ��\ 10~����� �����.',0,4);
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
taskText('������� ������� IsSquare({K}) ����������� ����, ������������ \t,',0,2);
taskText('���� ����� ��������~{K} (>\,0) �������� ��������� ���������� ������ �����,',0,3);
taskText('�\ \f �\ ��������� ������. �\ ��\ ������� ����� ���������� ���������',0,4);
taskText('�\ ������ ��\ 10~����� ������������� �����.',0,5);
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
taskText('������� ������� IsPower5({K}) ����������� ����, ������������ \t, ����',0,2);
taskText('����� ��������~{K} (>\,0) �������� �������� �����~5, �\ \f �\ ��������� ������.',0,3);
taskText('�\ ��\ ������� ����� ���������� �������� �����~5',0,4);
taskText('�\ ������ ��\ 10~����� ������������� �����.',0,5);
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
taskText('������� ������� IsPowerN({K}, {N}) ����������� ����, ������������ \t, ����',0,2);
taskText('����� ��������~{K} (>\,0) �������� �������� �����~{N} (>\,1), �\ \f �\ ���������',0,3);
taskText('������. ���� �����~{N} (>\,1) �\ ����� ��\ 10~����� ������������� �����. �\ �������',0,4);
taskText('������� IsPowerN ����� ���������� �������� �����~{N} �\ ������ ������.',0,5);
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
taskText('������� ������� IsPrime({N}) ����������� ����, ������������ \t, ���� �����',0,1);
taskText('��������~{N} (>\,1) �������� ������� ������, �\ \f �\ ��������� ������ (�����,',0,2);
taskText('�������~1, ���������� \I�������\i, ���� ��� ��\ ����� ������������� ���������,',0,3);
taskText('�����~1 �\ ������ ����). ���\ ����� ��\ 10~����� �����, �������~1.',0,4);
taskText('�\ ������� ������� IsPrime ����� ���������� ������� ����� �\ ������ ������.',0,5);
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
taskText('������� ������� DigitCount({K}) ������ ����, ��������� ���������� ����',0,2);
taskText('������ �������������� �����~{K}. ��������� ��� �������, ����� ���������� ����',0,3);
taskText('���\ ������� ��\ ���� ������ ����� ������������� �����.',0,4);
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
taskText('������� ������� DigitN({K}, {N}) ������ ����, ������������ \Um{N}-�\um ����� ������',0,1);
taskText('�������������� �����~{K} (����� �\ ����� ���������� ������ ������).',0,2);
taskText('���� ���������� ���� �\ �����~{K} ������~{N}, ��\ ������� ���������� \-1.',0,3);
taskText('���\ ������� ��\ ���� ������ ����� ������������� �����~{K}_1, {K}_2,~\.,\ {K}_5',0,4);
taskText('������� ������� DigitN �\ ����������~{N}, ������������ ��~1 ��~5.',0,5);
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
  resultComment('�������� ������� DigitN ��� K = K_'+s+', N = 1, \., 5: ',5,i);
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
taskText('������� ������� IsPalindrome({K}), ������������ \t,',0,1);
taskText('���� ����� ��������~{K} (>\,0) �������� \I�����������\i',0,2);
taskText('(�.\,�. ��� ������ �������� ��������� ����� ������� �\ ������ ������),',0,3);
taskText('�\ \f �\ ��������� ������. �\ ��\ ������� ����� ���������� �����������',0,4);
taskText('�\ ������ ��\ 10~����� ������������� �����.',0,5);
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
taskText('������� ������� DegToRad({D}) ������������� ����, ��������� �������� ����',0,1);
taskText('�\ ��������, ���� ���� ���\ ��������~{D} �\ �������� ({D}\ \= ������������ �����,',0,2);
taskText('0~\l~{D}~<~360). ��������������� ��������� ������������: 180\o~=~\p\ ��������.',0,3);
taskText('�\ �������� ��������~\p ������������~3.14. �\ ������� ������� DegToRad',0,4);
taskText('��������� ��\ �������� �\ ������� ���� ������ �����.',0,5);
(*
*)
end
else
begin
s1 := 'R_';
s2 := 'RadToDeg(';
n1 := 3;
n2 := 6;
taskText('������� ������� RadToDeg({R}) ������������� ����, ��������� �������� ����',0,1);
taskText('�\ ��������, ���� ���� ���\ ��������~{R} �\ �������� ({R}\ \= ������������ �����,',0,2);
taskText('0~\l~{R}~<~2\*\p). ��������������� ��������� ������������: 180\o~=~\p\ ��������.',0,3);
taskText('�\ �������� ��������~\p ������������~3.14. �\ ������� ������� RadToDeg',0,4);
taskText('��������� ��\ �������� �\ ������� ���� ������ �����.',0,5);
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
taskText('������� ������� Fact({N}) ������������� ����, �����������',0,1);
taskText('�������� \I����������\i {N}!~=~1\*2\*\.\*{N} ({N}~>~0\ \= �������� ������ ����;',0,2);
taskText('������������ ������������ �������� ������������ ��� ����, ����� ��������',0,3);
taskText('�������������� ������������ ���\ ������� ���������~{N}).',0,4);
taskText('�\ ������� ���� ������� ����� ���������� ���� ������ ����� �����.',0,5);
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
taskText('������� ������� Fact2({N}) ������������� ����, ����������� \I������� ���������\i:',0,1);
taskText('\({N}!!~=~1\*3\*5\*\.\*{N},\q ���� {N}\ \= ��������;\| {N}!!~=~2\*4\*6\*\.\*{N},\q ���� {N}\ \= ������\)',0,2);
taskText('({N}~>~0\ \= �������� ������ ����; ������������ ������������ �������� ������������',0,3);
taskText('��� ����, ����� �������� �������������� ������������ ���\ ������� ���������~{N}).',0,4);
taskText('�\ ������� ���� ������� ����� ������� ���������� ���� ������ ����� �����.',0,5);
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
taskText('������� ������� Fib({N}) ������ ����, ����������� {N}-�~�������',0,1);
taskText('������������������ \I����� ���������\i~{F}_{K}, ������� ����������� ����������',0,2);
taskText('���������:\[   {F}_{1}~=~1,\Q   {F}_{2}~=~1,\Q   '+
         '{F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('��������� ������� Fib, ����� ���� ����� ���������',0,4);
taskText('�\ ������� ��������~{N}_1, {N}_2,~\.,\ {N}_5.',0,5);
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
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPrc55An39(Name, Key: string);
var v1,v2,v3 : byte;
    p,a,b: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('������� ������� Power1({A}, {B}) ������������� ����, ��������� �������� {A}^B',0,1);
taskText('��\ ������� {A}^B~=~exp({B}\*ln({A})) (���������~{A} �~{B}\ \= ������������).',0,2);
taskText('�\ ������ �������� ���\ �������������� ���������~{A} ������� ����������~0.',0,3);
taskText('�~������� ���� ������� ����� �������~{A}^P, {B}^P, {C}^P,',0,4);
taskText('���� ���� �����~{P},~{A}, {B},~{C}.',0,5);
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
taskText('������� ������� Power2({A}, {N}) ������������� ����, ��������� �������� {A}^N',0,1);
taskText('({A}\ \= ������������, {N}\ \= ����� ��������) ��\ ��������� ��������:',0,2);
taskText('\(  {A}^0 = 1;\|    {A}^N = {A}\*{A}\*\.\*{A}\q  ({N}~������������),\q ���� {N}~>~0;\|',9,3);
taskText('     {A}^N = 1/({A}\*{A}\*\.\*{A})\q  (|{N}|~������������),\q ���� {N}~<~0.\)',6,4);
taskText('�\ ������� ���� ������� �����~{A}^K, {A}^L, {A}^M, ���� ���� �����~{A}, {K}, {L},~{M}.',0,5);
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
taskText('��������� ������� Power1 �\ Power2 ��\ \2 �\ \1, ������� �������',0,1);
taskText('Power3({A},\;{B}) ������������� ���� �\ ������������� �����������, ��������� {A}^B',0,2);
taskText('��������� �������: ���� {B}~����� ������� ������� �����, ��\ ����������',0,3);
taskText('Power2({A},\;{N}), ��� {N} \= ���������� \I������ ����\i, ������ �����\ {B}; ����� ����������',0,4);
taskText('Power1({A},\;{B}). �\ ������� Power3 �����~{A}^P, {B}^P, {C}^P, ���� ���� �����~{P}, {A}, {B},~{C}.',0,5);
(*
���\ �������� ����, ��� �����~{B} ����� ������� �����, �\ ������ \UP �\ \UV
����� ������������ ������� {B}~=~Int({B}).
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
taskText('������� ������� Exp1({x}, \e) ������������� ���� (���������~{x}, \e\ \=',0,1);
taskText('������������, \e~>~0), ��������� ������������ �������� ������� exp({x}):',0,2);
taskText('\[exp({x}) = 1\;+\;{x}\;+\;{x}^2/(2!)\;+\;{x}^3/(3!)\;+\;\.\;+\;{x}^n/({n}!)\;+\;\.\]',0,3);
taskText('({n}!~=~1\*2\*\.\*{n}). �\ ����� ��������� ��� ���������, �������~\e. �\ ������� Exp1',0,4);
taskText('����� ������������ �������� ���������� ���\ �������~{x} ��� ����� ������~\e.',0,5);
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
resultComment('����������: �������� exp(x) ����� '+s3,0,4);
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
     s3 := '������';
     s4 := 'sin';
taskText('������� ������� Sin1({x}, \e) ������������� ���� (��������� {x}, \e\ \=',0,1);
taskText('������������, \e~>~0), ��������� ������������ �������� ������� sin({x}):',0,2);
taskText('\[sin({x})~=~{x}\;\-\;{x}^3/(3!)\;+\;{x}^5/(5!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/((2\*{n}+1)!)\;+\;\.~.\]',0,3);
taskText('�\ ����� ��������� ��� ���������, ������ ������� ������~\e. �\ ������� Sin1',0,4);
taskText('����� ������������ �������� ������ ���\ �������~{x} ��� ����� ������~\e.',0,5);
(*
*)
  end;
2: begin
     s0 := 'Cos';
     s2 := '';
     s3 := '��������';
     s4 := 'cos';
     i := 0;
taskText('������� ������� Cos1({x}, \e) ������������� ���� (���������~{x}, \e\ \=',0,1);
taskText('������������, \e~>~0), ��������� ������������ �������� ������� cos({x}):',0,2);
taskText('\[cos({x})~=~1\;\-\;{x}^2/(2!)\;+\;{x}^4/(4!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n}/((2\*{n})!)\;+\;\.~.\]',0,3);
taskText('�\ ����� ��������� ��� ���������, ������ ������� ������~\e. �\ ������� Cos1',0,4);
taskText('����� ������������ �������� �������� ���\ �������~{x} ��� ����� ������~\e.',0,5);
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
resultComment('����������: �������� '+s4+'(x) ����� '+s3,0,4);
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
taskText('������� ������� Ln1({x}, \e) ������������� ���� (���������~{x}, \e\ \=',0,1);
taskText('������������, |{x}|\,<\,1, \e\,>\,0), ��������� ������������ �������� ������� ln(1\,+\,{x}):',0,2);
taskText('\[ln(1\,+\,{x})~=~{x}\;\-\;{x}^2/2\;+\;{x}^3/3\;\-\;\.\;+\;(\-1)^n\*{x}^{n+1}/({n}+1)\;+\;\.~.\]',0,3);
taskText('�\ ����� ��������� ��� ���������, ������ ������� ������~\e. �\ ������� Ln1',0,4);
taskText('����� ������������ �������� ln(1\;+\;{x}) ���\ �������~{x} ��� ����� ������~\e.',0,5);
(*
*)
  end;
2: begin
     s0 := 'Arctg';
     s2 := '';
     s3 := 'arctg(x)';
taskText('������� ������� Arctg1({x}, \e) ������������� ���� (���������~{x}, \e\ \=',0,1);
taskText('������������, |{x}|\,<\,1, \e\,>\,0), ��������� ������������ �������� ������� arctg({x}):',0,2);
taskText('\[arctg({x})~=~{x}\;\-\;{x}^3/3\;+\;{x}^5/5\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/(2\*{n}+1)\;+\;\.~.\]',0,3);
taskText('�\ ����� ��������� ��� ���������, ������ ������� ������~\e. �\ ������� Arctg1',0,4);
taskText('����� ������������ �������� arctg({x}) ���\ �������~{x} ��� ����� ������~\e.',0,5);
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
resultComment('����������: �������� '+s3+' ����� '+s4,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An45(Name, Key: string);
var v1,v2,v3 : byte;
    a: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('������� ������� Power4({x}, {a}, \e) ������������� ���� (���������~{x}, {a}, \e\ \=',0,1);
taskText('������������, |{x}|\,<\,1;\,{a},\,\e\,>\,0), ��������� ������������ �������� ������� (1\,+\,{x})^a:',0,2);
taskText('\[(1\,+\,{x})^a\;=\;1\;+\;{a}\*{x}\;+\;{a}\*({a}\-1)\*{x}^2/(2!)\;'+
         '+\,\.\,+ {a}\*({a}\-1)\*\.\*({a}\-{n}+1)\*{x}^n/({n}!)\;+\,\.~.\]',0,3);
taskText('�\ ����� ��������� ��� ���������, ������ ������� ������~\e. �\ ������� Power4',0,4);
taskText('����� ������������ �������� (1\,+\,{x})^a ���\ ������~{x} �~{a} ��� ����� ������~\e.',0,5);
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
resultComment('����������: �������� (1+x)^a ����� '+s3,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SPrc55An46(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('������� ������� GCD2({A}, {B}) ������ ����, ��������� \I���������� ����� ��������\i',0,1);
taskText('(���, greatest common divisor) ���� ����� ������������� �����~{A} �~{B}, ���������',0,2);
taskText('\I�������� �������\i:   \[���({A}, {B})~=~���({B}, {A}\;mod\;{B}),\q ���� {B}~\n~0;\Q   ���({A}, 0)~=~{A},\]',0,3);
taskText('��� \<mod\> ���������� �������� ������ ������� �� �������. �\ ������� GCD2 �����',0,4);
taskText('���������� ����� �������� ��� ({A},\,{B}), ({A},\,{C}), ({A},\,{D}), ���� ���� �����~{A}, {B}, {C},~{D}.',0,5);
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
taskText('��������� ������� GCD2 (��.\ \1), ������� ��������� Frac1({a},\;{b},\;{p},\;{q}),',0,1);
taskText('������������� �����~{a}/{b} �\ ������������� ����~{p}/{q} (��� ��������� ���������\ \=',0,2);
taskText('������ ����, {a} �~{b}\ \= �������, {p} �~{q}\ \= ��������). ���� �������������� �����~{p}/{q}',0,3);
taskText('������������� ��������� (�.\,�. {q}~>~0). �\ ������� Frac1 ����� ������������',0,4);
taskText('�����, ������ {a}/{b}\;+\;{c}/{d}, {a}/{b}\;+\;{e}/{f}, {a}/{b}\;+\;{g}/{h} '+
         '(����� {a},\,{b},\,{c},\,{d},\,{e},\,{f},\,{g},\,{h} ����).',  0,5);
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
    resultN('��������� = ',n3,27,i+1,5);
    resultN('����������� = ',n4,50,i+1,4);
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
taskText('\I���������� ����� �������\i (least common multiple) ���� ����� �������������',0,1);
taskText('�����~{A} �~{B} ����� {A}\*({B}/���({A},\;{B})), ��� ���({A},\;{B})\ \= ���������� ����� ��������',0,2);
taskText('{A} �~{B}. ��������� ������� GCD2 (��.\ \2), ������� ������� LCM2({A}, {B})',0,3);
taskText('������ ����, ��������� ���������� ����� ������� �����~{A} �~{B}. �\ ������� LCM2',0,4);
taskText('����� ���������� ����� ������� ��� ({A},\,{B}),\,({A},\,{C}),\,({A},\,{D}), ���� ���� ����� {A},\,{B},\,{C},\,{D}.',0,5);
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
taskText('�������� ����������� ���({A}, {B}, {C})~=~���(���({A}, {B}), {C}) �\ ��������� �������',0,1);
taskText('GCD2 (��.\ \3), ������� ������� GCD3({A}, {B},~{C}) ������ ����, ���������',0,2);
taskText('���������� ����� �������� ���� ����� ������������� �����~{A}, {B},~{C}.',0,3);
taskText('�\ ������� GCD3 ����� ���������� ����� ��������',0,4);
taskText('����� ({A},\,{B},\,{C}), ({A},\,{C},\,{D}) �~({B},\,{C},\,{D}), ���� ���� �����~{A}, {B}, {C},~{D}.',0,5);
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
taskText('������� ��������� TimeToHMS({T},\ {H}, {M},\ {S}), ������������ ��\ �������~{T}',0,1);
taskText('(�\ ��������) ������������ �\ ��� ���������� �����~{H}, �����~{M} �\ ������~{S}',0,2);
taskText('({T}\ \= �������, {H},~{M} �~{S}\ \= �������� ��������� ������ ����).',0,3);
taskText('��������� ���\ ���������, ����� ���������� �����, ����� �\ ������',0,4);
taskText('��� ���� ������ �������� �������~{T}_1, {T}_2,~\.,\ {T}_5.',0,5);
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
taskText('������� ��������� IncTime({H},\;{M},\;{S},\;{T}), ������� ����������� ��\ {T}~������ �����,',0,1);
taskText('�������� �\ �����~{H}, �������~{M} �\ ��������~{S} ({H}, {M} �~{S}\ \= ������� �\ ��������',0,2);
taskText('���������, {T}\ \= ������� ��������; ��� ���������\ \= ����� �������������). ����',0,3);
taskText('����� (�\ �����~{H}, �������~{M}, ��������~{S}) �\ ����� �����~{T}. ��������� ���������',0,4);
taskText('IncTime, ��������� ������ ����� ��~{T} ������ �\ ������� ����� ��������~{H}, {M},~{S}.',0,5);
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
taskText('������� ������� IsLeapYear({Y}) ����������� ����, ������� ���������� \t,',0,1);
taskText('���� ���~{Y} (����� ������������� �����) �������� ����������, �\ \f',0,2);
taskText('�\ ��������� ������. ������� �������� ������� IsLeapYear ���\ ���� ������',0,3);
taskText('�������� ���������~{Y}. \I����������\i ��������� ���, ��������� ��~4,',0,4);
taskText('��\ ����������� ��� �����, ������� ������� ��~100 �\ ��\ ������� ��~400.',0,5);
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
taskText('��������� ������� IsLeapYear ��\ ������� \1, ������� �������',0,2);
taskText('MonthDays({M}, {Y}) ������ ����, ������� ���������� ���������� ����',0,3);
taskText('���\ {M}-�� ������ ����~{Y} (1~\l~{M}~\l~12, {Y}~>~0\ \= ����� �����).',0,4);
taskText('������� �������� ������� MonthDays ���\ ������� ����~{Y} �\ �������~{M}_1, {M}_2,~{M}_3.',0,5);
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
taskText('��������� ������� MonthDays ��\ ������� \1, ������� ���������',0,1);
taskText('PrevDate({D}, {M}, {Y}), ������� ��\ ���������� �\ ���������� ����, ���������� ����~{D},',0,2);
taskText('����� ������~{M} �\ ���~{Y}, ���������� ���������� ���� (��������� ������ ����',0,3);
taskText('{D}, {M},~{Y} �������� ������������ �������� �\ ���������). ��������� ���������',0,4);
taskText('PrevDate �\ ���� �������� ����� �\ ������� ���������� �������� ����������\ ���.',0,5);
(*
*)
    end;
  2:
    begin
    s1 := 'NextDate';
taskText('��������� ������� MonthDays ��\ ������� \2, ������� ���������',0,1);
taskText('NextDate({D}, {M}, {Y}), ������� ��\ ���������� �\ ���������� ����, ���������� ����~{D},',0,2);
taskText('����� ������~{M} �\ ���~{Y}, ���������� ��������� ���� (��������� ������ ����',0,3);
taskText('{D}, {M},~{Y} �������� ������������ �������� �\ ���������). ��������� ���������',0,4);
taskText('NextDate �\ ���� �������� ����� �\ ������� ���������� �������� ���������\ ���.',0,5);
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
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




begin
Topic1 := '��������� � ��������� �����������';
Topic2 := '������� � ��������� �����������';
Topic3 := '�������������� ������� �� ��������� � �������';
{Author := '�.~�.~�������, 2002';}
end.
