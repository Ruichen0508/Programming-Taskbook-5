{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SArr65A4z;

interface

procedure SArr65An1(Name, Key: string);
procedure SArr65An2(Name, Key: string);
procedure SArr65An3(Name, Key: string);
procedure SArr65An4(Name, Key: string);
procedure SArr65An5(Name, Key: string);
procedure SArr65An6(Name, Key: string);
procedure SArr65An7(Name, Key: string);
procedure SArr65An8(Name, Key: string);
procedure SArr65An9(Name, Key: string);
procedure SArr65An10(Name, Key: string);
procedure SArr65An11(Name, Key: string);
procedure SArr65An12(Name, Key: string);
procedure SArr65An13(Name, Key: string);
procedure SArr65An14(Name, Key: string);
procedure SArr65An15(Name, Key: string);
procedure SArr65An16(Name, Key: string);
procedure SArr65An17(Name, Key: string);
procedure SArr65An18(Name, Key: string);
procedure SArr65An19(Name, Key: string);
procedure SArr65An20(Name, Key: string);
procedure SArr65An21(Name, Key: string);
procedure SArr65An22(Name, Key: string);
procedure SArr65An23(Name, Key: string);
procedure SArr65An24(Name, Key: string);
procedure SArr65An25(Name, Key: string);
procedure SArr65An26(Name, Key: string);
procedure SArr65An27(Name, Key: string);
procedure SArr65An28(Name, Key: string);
procedure SArr65An29(Name, Key: string);
procedure SArr65An30(Name, Key: string);
procedure SArr65An31(Name, Key: string);
procedure SArr65An32(Name, Key: string);
procedure SArr65An33(Name, Key: string);
procedure SArr65An34(Name, Key: string);
procedure SArr65An35(Name, Key: string);
procedure SArr65An36(Name, Key: string);
procedure SArr65An37(Name, Key: string);
procedure SArr65An38(Name, Key: string);
procedure SArr65An39(Name, Key: string);
procedure SArr65An40(Name, Key: string);
procedure SArr65An41(Name, Key: string);
procedure SArr65An42(Name, Key: string);
procedure SArr65An43(Name, Key: string);
procedure SArr65An44(Name, Key: string);
procedure SArr65An45(Name, Key: string);
procedure SArr65An46(Name, Key: string);
procedure SArr65An47(Name, Key: string);
procedure SArr65An48(Name, Key: string);
procedure SArr65An49(Name, Key: string);
procedure SArr65An50(Name, Key: string);
procedure SArr65An51(Name, Key: string);
procedure SArr65An52(Name, Key: string);
procedure SArr65An53(Name, Key: string);
procedure SArr65An54(Name, Key: string);
procedure SArr65An55(Name, Key: string);
procedure SArr65An56(Name, Key: string);
procedure SArr65An57(Name, Key: string);
procedure SArr65An58(Name, Key: string);
procedure SArr65An59(Name, Key: string);
procedure SArr65An60(Name, Key: string);
procedure SArr65An61(Name, Key: string);
procedure SArr65An62(Name, Key: string);
procedure SArr65An63(Name, Key: string);
procedure SArr65An64(Name, Key: string);
procedure SArr65An65(Name, Key: string);

implementation

uses PT5TaskMaker;

var
  Topic, Topic1, Topic2, Topic3, Topic4, Author: string;
  a : array [0..20] of real;
  a1: array [0..20] of real;
  a2: array [0..20] of real;
  b : array [0..20] of integer;
  b1 : array [0..20] of integer;
  b2,b3 : array [1..20] of integer;
  a0,b0,c0 : real;
  x,y,x1,y1: array[0..8] of real;
  x2,y2: array[0..8] of integer;
  x0,y0,r,r0 : real;
  amin,amax : real;
  bmin,bmax : integer;
  i,j,k,m,n1,n2,n0,n,nmin,nmax : integer;
  s,s1,s2,s3,s4 : string;


procedure SArr65An1(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 46{level});
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,0).', 0, 2);
  TaskText('������������ �\ ������� ������������� ������ �������~{N},', 0, 3);
  TaskText('���������� {N}~������ ������������� �������� �����: 1,~3, 5,~\.~.', 0, 4);
(*
*)
(*==*)
  n := 1 + Random(10);
  DataN('N = ', n, 0, 3,1);
  for i := 1 to n do
    ResultN('', 2*i-1, center(i,n,2,5),3,2);
  SetNumberOfTests(3);
Pause;
end;

procedure SArr65An2(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 46{level});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,0).', 0, 2);
  TaskText('������������ �\ ������� ������������� ������ �������~{N},', 0, 3);
  TaskText('���������� ������� ������ ��\ ������ ��~\Um{N}-�\um: 2,~4, 8,~16,~\.~.', 0, 4);
(*
*)
(*==*)
  n := 1 + Random(10);
  k := 1;
  DataN('N = ', n, 0, 3,1);
  for i := 1 to n do
  begin
    k := k * 2;
    ResultN('', k, center(i,n,2,5),3,2);
  end;
  SetNumberOfTests(3);
Pause;
end;

procedure SArr65An3(Name, Key: string);
var
  v1, v2, v3: Byte;
  x, y, r: Real;
begin
  Start(Name, Topic1, Author, Key, 46{level});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,1),', 0, 1);
  TaskText('�\ ����� ������ ����~{A} �\ ��������~{D} \I�������������� ����������\i.', 0, 2);
  TaskText('������������ �\ ������� ������ �������~{N},', 0, 3);
  TaskText('���������� {N}~������ ������ ������ ����������:', 0, 4);
  TaskText('\[{A},\q {A}\;+\;{D},\q {A}\;+\;2\*{D},\q {A}\;+\;3\*{D},\q \.~.\]', 0, 5);
(*
*)
(*==*)
  s := 'D = ';
  x := RandomR2(-5,5); //Random*10-5; //2018
  y := RandomR2(-5,5); //Random*10-5;
  n := 2 + Random(7);
  r := x;
  DataN('N = ', n, 0, 2,1);
  DataR('A = ', x, xLeft, 4, 5);
  DataR(s, y, xRight, 4, 5);
  for i := 1 to n do
  begin
    ResultR('', r, center(i,n,6,3),3,6);
    r := r + y;
  end;
  SetNumberOfTests(3);
Pause;
end;

procedure SArr65An4(Name, Key: string);
var
  v1, v2, v3: Byte;
  x, y, r: Real;
begin
  Start(Name, Topic1, Author, Key, 46{level});(*DEMO*)
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,1),', 0, 1);
  TaskText('�\ ����� ������ ����~{A} �\ �����������~{D} \I�������������� ����������\i.', 0, 2);
  TaskText('������������ �\ ������� ������ �������~{N},', 0, 3);
  TaskText('���������� {N}~������ ������ ������ ����������:', 0, 4);
  TaskText('\[  {A},\q {A}\*{D},\q {A}\*{D}^2,\q {A}\*{D}^3,\q \.~.\]', 0, 5);
(*
*)
  s := 'D = ';
  x := RandomR1(-5,5); //Random*10-5;  //2018
  repeat
  y := RandomR1(-2.5,2.5); //Random*5-2.5;
  until abs(y)>1;
  n := 2 + Random(7);
  r := x;
  DataN('N = ', n, 0, 2,1);
  DataR('A = ', x, xLeft, 4, 5);
  DataR(s, y, xRight, 4, 5);
  for i := 1 to n do
  begin
    ResultR('', r, center(i,n,6,3),3,6);
    r := r * y;
  end;
  SetNumberOfTests(3);
Pause;
end;


procedure SArr65An5(Name, Key: string);
var
  v1, v2, v3: Byte;
  k1, k2: Integer;
begin
  Start(Name, Topic1, Author, Key, 46{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,2).', 0, 2);
  TaskText('������������ �\ ������� ������������� ������ �������~{N},', 0, 3);
  TaskText('���������� {N}~������ ��������� ������������������ \I����� ���������\i {F}_{K}:', 0, 4);
  TaskText('\[{F}_{0}~=~1,\Q    {F}_{1}~=~1,\Q    {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~2,\,3,\,\.~.\]', 0, 5);
(*
*)
(*==*)
  n := 3 + Random(8);
  DataN('N = ', n, 0, 3,1);
  k1 := 1;
  k2 := 1;
  ResultN('', k1, center(1,n,2,5),3,2);
  ResultN('', k2, center(2,n,2,5),3,2);
  for i := 3 to n do
  begin
    k := k1+k2;
    ResultN('', k, center(i,n,2,5),3,2);
    k1 := k2;
    k2 := k;
  end;
  SetNumberOfTests(3);
Pause;
end;

procedure SArr65An6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 46{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{N} (>\,2), {A} �~{B}. ������������ �\ �������', 0, 2);
  TaskText('������������� ������ �������~{N}, � ������� ������� � ��������~0 �����~{A},', 0, 3);
  TaskText('������� � ��������~1 �����~{B}, �\ ������ ����������� �������', 0, 4);
  TaskText('����� ����� ���� ����������.', 0, 5);
(*
*)
(*==*)
  n := 3 + Random(8);
  b[1] := Integer(Random(11))-5;
  b[2] := Integer(Random(11))-5;
  DataN('N = ', n, 0, 2,1);
  DataN('A = ', b[1], xLeft, 4,1);
  DataN('B = ', b[2], xRight, 4,1);
  for i := 3 to n do
  begin
    b[i] := 0;
    for j := 1 to i-1 do
      b[i] := b[i] + b[j];
  end;
  for i := 1 to n do
    ResultN('', b[i], center(i,n,2,5),3,2);
  SetNumberOfTests(3);
Pause;
end;

{procedure SArr65An(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 46{level}{);}
(*  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('���� �����~{M} (>\,0). ������������ �\ ������� ������������� ������ �������~10,', 0, 1);
  TaskText('���������� ����� �����~{M} �\ �������� ������� (������ ������� ������� ��������', 0, 2);
  TaskText('����� �����~{M} ��\ ������� ������, ������\ \= ��\ ������� �������� �\ �.\,�.).', 0, 3);
  TaskText('������������� �������� ������� �������� �������~0. ��� �����������������', 0, 4);
  TaskText('��������� ���� ������������ �������� ������� ������ � ������ �������.', 0, 5);
(*
*)
(*  n := 1 + Random(5);
  if n = 5 then k := 32000
  else
  begin
  k := 1;
  for i := 1 to n do
    k := k * 10;
  end;
  m := 1 + Random(k);
  Str(m,s);
  DataN('M = ', m, 0, 3, length(s));
  for i := 1 to length(s) do
  begin
    Val(s[length(s)-i+1],k,j);
    ResultN('', k, center(i,10,1,6), 3,1);
  end;
  for i := length(s)+1 to 10 do
    ResultN('', 0, center(i,10,1,6), 3,1);
  SetNumberOfTests(5);
  Pause;
end;*)

procedure SArr65An7(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr65An8(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr65An9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 46{level});(*DEMO*)
  GetVariant(8, 0, 0, 0, v1, v2, v3);
taskText('��� ������ �������~{N}.',0,2);
taskText('������� ���\ �������� �\ �������� �������.',0,4);
(*
������� ����� ������� ���������� �\ �.\,10.1.
*)
n := Random(9)+2;
for i:=1 to n do
    a[i] := 9.98*Random;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to n do
  resultR('',a[n+1-i],center(i,n,5,2),3,5);
setNumberOfTests(3);
  Pause;
end;

procedure SArr65An10(Name, Key: string);
var
  v1, v2, v3: Byte;
  i1: integer;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ���\ ������������ �\ ������ ������� �������� �����', 0, 3);
  TaskText('�\ ������� ����������� ��\ ��������, �\ ����� ��\ ����������~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ���\ ������������ �\ ������ ������� ������ �����', 0, 3);
  TaskText('�\ ������� �������� ��\ ��������, �\ ����� ��\ ����������~{K}.', 0, 4);
(*
*)
  end;
(*==*)
n := Random(9)+2;
for i:=1 to 10 do
  b[i] := 1+Random(10);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
    i1 := 0;
    for i := 1 to n do
      case v1 of
      1: if b[i] mod 2 <> 0 then begin inc(i1); b1[i1] := b[i]; end;
      2: if b[n-i+1] mod 2 = 0 then begin inc(i1); b1[i1] := b[n-i+1]; end;
      end;
for i := 1 to i1 do
  resultN('',b1[i],center(i,i1,2,5),2,2);
  resultN('K = ',i1,0,4,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An11(Name, Key: string);
var
  v1, v2, v3: Byte;
  i1: integer;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ������� ���\ ������������ � ������ ������� ������ �����', 0, 3);
  TaskText('�\ ������� ����������� ��\ ��������, �\ �����\ \= ���\ �������� �����', 0, 4);
  TaskText('�\ ������� �������� ��\ ��������.', 0, 5);
(*
*)
(*==*)
n := Random(9)+2;
for i:=1 to 10 do
  b[i] := 1+Random(10);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
    i1 := 0;
    for i := 1 to n do
      if b[i] mod 2 = 0 then begin inc(i1); b1[i1] := b[i]; end;
    for i := 1 to n do
      if b[n-i+1] mod 2 <> 0 then begin inc(i1); b1[i1] := b[n-i+1]; end;
for i := 1 to i1 do
  resultN('',b1[i],center(i,i1,2,5),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An12(Name, Key: string); //!!
var
  v1, v2, v3: Byte;
  a: real;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} (2~\l~{K}~\l~{N}\,\-\,1).', 0, 2);
  TaskText('������� �������� ������� �\ ���������, ��������~{K}:', 0, 3);
  TaskText('{A}_{0}, {A}_{K}, {A}_{2\*K}, {A}_{3\*K},~\.~.', 0, 4);
  TaskText('�������� �������� �� ������������.', 0, 5);
(*
*)
(*==*)
  n := 4 + Random(7);
  k := 2 + Random(2);
  m := (n-1) div k + 1;
  DataN('N = ', n, 0, 2,1);
  j := 0;
  for i := 1 to n do
  begin
    a := Random*9.98;
    DataR('', a, center(i,n,5,2), 3,5);
    if (i-1) mod k = 0 then
    begin
      inc(j);
      ResultR('', a, center(j,m,5,2), 3, 5);
    end;
  end;
  DataN('K = ', k, 0, 4,1);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr65An13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
1:  begin
  s1 := '';
  s2 := '';
  n := 2 + 2*Random(5);
  TaskText('��� ������~{A} �������~{N} ({N}\ \= ������ �����).', 0, 2);
  TaskText('������� ���\ �������� �\ ������� ��������� �\ ������� ����������� ��������:', 0, 3);
  TaskText('{A}_{0}, {A}_{2}, {A}_{4},~\., {A}_{N\-2}.', 0, 4);
  TaskText('�������� �������� ��\ ������������.', 0, 5);
(*
��� �������� ������� ����� ��� 2\*{k}\,\-\,1, ��� ������\ \= 2\*{k}\,\-\,1
({k}~=~1, 2,~\.).
*)
  end;
2:  begin
  s1 := '';
  s2 := '';
  n := 3 + 2*Random(4);
  TaskText('��� ������~{A} �������~{N} ({N}\ \= �������� �����).', 0, 2);
  TaskText('������� ���\ �������� �\ ��������� ��������� �\ ������� �������� ��������:', 0, 3);
  TaskText('{A}_{N\-2}, {A}_{N\-4}, {A}_{N\-6},~\., {A}_{1}.', 0, 4);
  TaskText('�������� �������� ��\ ������������.', 0, 5);
(*
*)
  end;
  end;
(*==*)
for i:=1 to n do
    a[i] := 9.98*Random;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
case v1 of
1:
 for i := 1 to n div 2 do
  resultR('',a[2*i-1],center(i,n div 2,5,2),3,5);
2:
 for i := 1 to n div 2 do
  resultR('',a[n-2*(i-1)-1],center(i,n div 2,5,2),3,5);
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:
  begin
  TaskText('��� ������~{A} �������~{N}. ������� ������� ���\ �������� �\ ������� ���������', 0, 1);
  TaskText('(�\ ������� ����������� ��������), �\ �����\ \= �������� �\ ��������� ���������', 0, 2);
  TaskText('(����� �\ ������� ����������� ��������):', 0, 3);
  TaskText('\[{A}_{0},\q {A}_{2},\q {A}_{4},\q \.,\q {A}_{1},\q {A}_{3},\q {A}_{5},\q \.~.\]', 0, 4);
  TaskText('�������� �������� ��\ ������������.', 0, 5);
(*
+
*)
  end;
  2:
  begin
  TaskText('��� ������~{A} �������~{N}. ������� ������� ���\ �������� �\ ��������� ���������', 0, 1);
  TaskText('�\ ������� ����������� ��������, �\ �����\ \= �������� �\ ������� ���������', 0, 2);
  TaskText('�\ ������� �������� ��������:', 0, 3);
  TaskText('\[{A}_{1},\q {A}_{3},\q {A}_{5},\q \.,\q {A}_{4},\q {A}_{2},\q {A}_{0}.\]', 0, 4);
  TaskText('�������� �������� ��\ ������������.', 0, 5);
(*
+
*)
  end;
  end;
(*==*)
  n := 2 + Random(9);
  case curtest of //2012
  2: n := (Random(5)+1)*2;
  4: n := (Random(4)+1)*2+1;
  end;
for i:=1 to n do
    a[i] := 9.98*Random;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
case v1 of
1:
begin
for i := 1 to (n+1) div 2 do
  resultR('',a[2*i-1],center(i,n,5,2),3,5);
for i := 1 to n div 2 do
  resultR('',a[2*i],center((n+1) div 2 + i,n,5,2),3,5);
end;
2:
begin
for i := 1 to n div 2 do
  resultR('',a[2*i],center(i,n,5,2),3,5);
j := (n) div 2;
for i := (n+1) div 2 downto 1 do
begin
  inc(j);
  resultR('',a[2*i-1],center(j,n,5,2),3,5);
end;
end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 46{level});(*DEMO*)
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ������� ���\ �������� �\ ��������� �������:', 0, 2);
  TaskText('\[{A}_{0},\q {A}_{N\-1},\q {A}_{1},\q {A}_{N\-2},\q {A}_{2},\q {A}_{N\-3},\q \.~.\]', 0, 4);
(*
*)
  n := 2 + Random(9);
  case curtest of //2012
  2: n := (Random(5)+1)*2;
  3: n := (Random(4)+1)*2+1;
  end;
  for i:=1 to n do
      a[i] := 9.98*Random;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  j := 0;
  for i := 1 to n div 2 do
  begin
    inc(j);
    ResultR('',a[i],center(j,n,5,2),3,5);
    inc(j);
    ResultR('',a[n-i+1],center(j,n,5,2),3,5);
  end;
  if n mod 2 <> 0 then
    ResultR('',a[n div 2 + 1],center(n,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 46{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ������� ���\ �������� �\ ��������� �������:', 0, 2);
  TaskText('\[{A}_{0},\q {A}_{1},\q {A}_{N\-1},\q {A}_{N\-2},\q {A}_{2},\q {A}_{3},'+
         '\q {A}_{N\-3},\q {A}_{N\-4},\q \.~.\]', 0, 4);
(*==*)
  n := 2 + Random(9);
  case curtest of //2012
  2: n := (Random(2)+1)*4;
  3: n := (Random(2)+1)*4-1;
  5: n := (Random(3)+1)*4-2;
  6: n := (Random(2)+1)*4+1;
  end;
  for i:=1 to n do
      a[i] := 9.98*Random;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  j := 0;
  for i := 1 to n div 4 do
  begin
    inc(j);
    ResultR('',a[2*i-1],center(j,n,5,2),3,5);
    inc(j);
    ResultR('',a[2*i],center(j,n,5,2),3,5);
    inc(j);
    ResultR('',a[n-2*i+2],center(j,n,5,2),3,5);
    inc(j);
    ResultR('',a[n-2*i+1],center(j,n,5,2),3,5);
  end;
  for i := 1 to n mod 4 do
  begin
    inc(j);
    ResultR('',a[2*(n div 4)+i],center(j,n,5,2),3,5);
  end;
  SetNumberOfTests(7);
Pause;
end;

procedure SArr65An17(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr65An18(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������~{A} ��������� ����� ����� �������~10.',0,2);
taskText('������� �������� ������� ��\ ��� ���\ ���������~{A}_{K},',0,3);
taskText('������� ������������� ����������� {A}_{K}~<~{A}_{9}.',0,4);
taskText('���� ����� ��������� ���, ��\ �������~0.',0,5);
(*
*)
end;
2:
begin
taskText('��� ������������� ������~{A} �������~10.',0,2);
taskText('������� ������ ���������� ��\ ��� ���\ ���������~{A}_{K},',0,3);
taskText('������� ������������� �������� ����������� {A}_{0}~<~{A}_{K}~<~{A}_{9}.',0,4);
taskText('���� ����� ��������� ���, ��\ �������~\-1.',0,5);
(*
*)
end;
end;
(*==*)
repeat
k := 1;
{a0:=Random(3); b0:=3+Random(3);}
a0 := 20; b0 := 80;
for i:=1 to 9 do
begin
  b[i] := a0+Random(b0);
  if b[i] = 0 then k := 0;
end;
case v1 of
1:
begin
m := Random(3);
case curtest of //2012
2: m := 0;
3: m := 1;
end;
if 0 = m then b[10] := a0+Random(b0)
else  b[10] := b[1] - 1 - Random(20);
end;
2:
begin
m := Random(4);
case curtest of //2012
3: m := 0;
4: m := 1;
end;
if 0 = m then b[10] := b[1] + 3
else  b[10] := b[1] + 3 + Random(40);
end;
end;
if (b[10] > 99)or(b[10]<10) then k := 0;
until k <> 0;
for i := 1 to 10 do
  dataN('',b[i],center(i,10,2,5),3,2);
c0 := 0;
b0 := 0;
if v1 = 1 then
begin
  for i:=1 to 9 do
  if b[i]<b[10] then
    begin
      b0 := b[i];
      c0 := i;
      break;
    end
end
else
begin
  for i:=9 downto 2 do
  if (b[i]<b[10])and(b[i]>b[1]) then
    begin
      b0 := b[i];
      c0 := i;
      break;
    end;
end;
case v1 of
1: resultN('',b0,xCenter,3,2);
2: resultN('',c0-1,xCenter,3,2);
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An19(Name, Key: string);
var
  v1, v2, v3: Byte;
  n1,n2: integer;
  a0: real;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} �~{L} (0~\l~{K}~\l~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����� ����� ��������� �������', 0, 3);
  TaskText('�\ ��������� ��~{K} ��~{L} ������������.', 0, 4);
(*
*)
  end;
  2:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} �~{L} (0~\l~{K}~\l~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����� ������� �������������� ��������� �������', 0, 3);
  TaskText('�\ ��������� ��~{K} ��~{L} ������������.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
      a[i] := RandomR1(0.1,9.9); //9.98*Random; //2018
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  n1 := 1 + Random(n);
  n2 := n1 + Random(n+1-n1);
  dataN('K = ',n1-1,xLeft,4,1);
  dataN('L = ',n2-1,xRight,4,1);
  a0 := 0;
  for i := n1 to n2 do
    a0 := a0 + a[i];
  if v1=2 then a0 := a0 / (n2-n1+1);
  resultR('',a0,0,3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An20(Name, Key: string);
var
  v1, v2, v3: Byte;
  n1,n2: integer;
  a0: real;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} �~{L} (0~<~{K}~\l~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����� ����� ���� ��������� �������,', 0, 3);
  TaskText('����� ��������� �\ ��������� ��~{K} ��~{L} ������������.', 0, 4);
(*
*)
  end;
  2:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} �~{L} (0~<~{K}~\l~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����� ������� �������������� ���� ��������� �������,', 0, 3);
  TaskText('����� ��������� �\ ��������� ��~{K} ��~{L} ������������.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
      a[i] := RandomR1(0.1,9.9); //9.98*Random; //2018
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  n1 := 2 + Random(n-1);
  n2 := n1 + Random(n+1-n1);
  dataN('K = ',n1-1,xLeft,4,1);
  dataN('L = ',n2-1,xRight,4,1);
  a0 := 0;
  for i := 1 to n1-1 do
    a0 := a0 + a[i];
  for i := n2+1 to n do
    a0 := a0 + a[i];
  if v1=2 then a0 := a0 / (n-n2+n1-1);
  resultR('',a0,0,3,5);
  SetNumberOfTests(5);
  if n = 2 then setNumberOfUsedData(2)
  else
  if n1=n then setNumberOfUsedData(n+2);
Pause;
end;

procedure SArr65An21(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  d0: Word;
 //2014
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('��� ������������� ������ �������~{N}, ��\ ���������� ���������� �����.',0,2);
taskText('���������, ��������\ �� ���\ �������� \I�������������� ����������\i.',0,3);
taskText('���� ��������, ��\ ������� �������� ����������, ���� ���\ \= �������~0.',0,4);
(*
*)
   end;
2: begin
taskText('��� ������ ��������� ����� ����� �������~{N}. ���������, ��������\ ��',0,2);
taskText('��� �������� \I�������������� ����������\i � ������������� ������������.',0,3);
taskText('���� ��������, ��\ ������� ����������� ����������,',0,4);
taskText('���� ���\ \= �������~0.',0,5);
(*
*)
   end;
end;
(*==*)
n := 5 + Random(6);
c0 := Random(3);
case curtest of //2012
2: c0 := 0;
3: if v1 = 2 then c0 := 3; //2012
5: c0 := 1;
end;
while true do
begin
repeat
k := 3 - integer(Random(7));
until k <> 0;
a0:=1 + Random(3); b0:=3+Random(7);
b[1] := a0+Random(b0);
//2012>
if c0 = 3 then
begin
  repeat
    b[1] := 2 + Random(4);
    b[2] := 7 + Random(7);
  until (b[2] div b[1] > 1) and (b[2] mod b[1] <> 0);
  k := b[2] div b[1];
  if Random(2) = 0 then
  begin
    k := -k;
    b[2] := -b[2];
  end;
end;
//2012<
for i:=2 to n do
  case v1 of
  1:  b[i] := b[i-1]+k;
  2:  begin
      if (c0=3) and (i=2) then continue; //2012
      r := b[i-1];
      r := r * k;
      if abs(r)>32000 then
        begin
          n := i-1;
          break;
        end;
      b[i] := b[i-1]*k;
      end;
  end;
//2012>
if c0 = 3 then
begin
  k := 0;
  d0 := 2; //2014
end;
//2012<
if c0 = 0 then
  begin
    k := 0;
    d0 := Random(n)+1; //2014
    b[d0] := b[d0] + 1 + Random(5);  //2014
  end;
j := 0;
for i := 1 to n do
  case v1 of
  1: for n1 := 1 to i - 1 do
       if b[n1] = b[i] then begin j := 1; break; end;
  2: if b[i] = 0 then begin j := 1; break; end;
  end;
if j = 0 then break;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
resultN('',k,0,3,2);
if k = 0 then setNumberOfUsedData(1+d0); //2014
setNumberOfTests(6);
Pause;
end;

procedure SArr65An22(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: Word;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('���������, ����������\ �� �\ ��� ������ �\ �������� �����.',0,3);
taskText('���� ����������, ��\ �������~\-1, ���� ���, ��\ �������',0,4);
taskText('������ ������� ��������, ����������� ��������������.',0,5);
(*
*)
end;
2:
begin
taskText('��� ������ ��������� ����� ����� �������~{N}.',0,2);
taskText('���������, ����������\ �� �\ ��� ������������� � ������������� �����.',0,3);
taskText('���� ����������, ��\ �������~\-1, ���� ���, ��\ �������',0,4);
taskText('������ ������� ��������, ����������� ��������������.',0,5);
(*
*)
end;
end;
(*==*)
n := 5 + Random(6);
a0:=1 + Random(3); b0:=3+Random(6);
c0 := Random(4);
case curtest of //2012
2: c0 := 0;
4: c0 := 2;
5: c0 := 1;
end;
for i:=1 to (n +1) div 2 do
 begin
   b[2*i-1] := a0+integer(Random(b0));
   b[2*i] := a0+integer(Random(b0));
   if Random(2)=1 then b[2*i-1] := -b[2*i-1]-1;
   if Random(2)=1 then b[2*i] := -b[2*i]-1;
 case v1 of
 1:
 case c0 of
0: begin
   if Odd(b[2*i-1]) then b[2*i-1]:=b[2*i-1]+1;
   if not Odd(b[2*i]) then b[2*i]:= b[2*i-1]+1;
   end;
1: begin
   if not Odd(b[2*i-1]) then b[2*i-1]:=b[2*i-1]+1;
   if Odd(b[2*i]) then b[2*i]:= b[2*i-1]+1;
   end;
  end;
 2:
 case c0 of
0: begin
   if b[2*i-1]<0 then b[2*i-1]:=-b[2*i-1];
   if b[2*i]>0 then b[2*i]:= -b[2*i-1];
   end;
1: begin
   if b[2*i-1]>0 then b[2*i-1]:=-b[2*i-1];
   if b[2*i]<0 then b[2*i]:= -b[2*i-1];
   end;
  end;
end;
end;
k := 0;
for i:=2 to n do
  case v1 of
  1:if not odd(b[i]-b[i-1]) then
    begin
      k := i;
      break;
    end;
  2:if b[i]*b[i-1]>=0 then
    begin
      k := i;
      break;
    end;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
resultN('',k-1,0,3,2);
if k <> 0 then setNumberOfUsedData(k+1);
setNumberOfTests(6);
Pause;
end;


procedure SArr65An23(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0: real;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ����� ����������� �������', 0, 2);
  TaskText('��\ ��� ��������� �\ ��������� ���������:~{A}_{1}, {A}_{3}, {A}_{5},~\.~.', 0, 4);
(*
*)
(*==*)
n := 2 + Random(9);
a0 := 1000;
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99; //2012
  if not odd(i) and (a[i]<a0) then a0 := a[i];
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a0,0,3,5);
  SetNumberOfTests(6);
Pause;
end;

procedure SArr65An24(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0: real;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ����� ������������ �������', 0, 2);
  TaskText('��\ ��� ��������� �\ ������� ���������:~{A}_{0}, {A}_{2}, {A}_{4},~\.~.', 0, 4);
(*
*)
(*==*)
n := 2 + Random(9);
a0 := -1000;
k := 0;
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99; //2012
  if odd(i) and (a[i]>a0) then
  begin
    a0 := a[i];
    k := i;
  end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a0,0,3,5);
  SetNumberOfTests(6);
Pause;
end;




procedure SArr65An25(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0: real;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(10, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:
    begin
      k := 1;
  TaskText('��� ������ �������~{N}. ����� ������� ��� ��������� �������,', 0, 2);
  TaskText('������� ������ ������ ������� ������, �\ ���������� ����� ���������.', 0, 3);
  TaskText('��������� ������� �������� �\ ������� ��\ �����������.', 0, 4);
(*
*)
    end;
  2:
    begin
      k := -1;
  TaskText('��� ������ �������~{N}. ����� ������� ��� ��������� �������,', 0, 2);
  TaskText('������� ������ ������ ������ ������, �\ ���������� ����� ���������.', 0, 3);
  TaskText('��������� ������� �������� �\ ������� ��\ ��������.', 0, 4);
(*
*)
    end;
  end;
(*==*)
  n := 2 + Random(9);
  for i := 1 to n do
    a[i] := 19.98*Random-9.99; //2012
  if Random(4)=0 then
    for j := 1 to n-1 do
      for i := 1 to n-j do
        if a[i]*k>a[i+1]*k then
        begin
          a0 := a[i];
          a[i] := a[i+1];
          a[i+1] := a0;
        end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  j := 0;
  case v1 of
  1: for i := 1 to n-1 do
       if a[i]>a[i+1] then
         begin
           inc(j);
           b[j] := i;
         end;
  2: for i := 2 to n do
       if a[i]>a[i-1] then
         begin
           inc(j);
           b[j] := i;
         end;
  end;
    for i := 1 to j do
      if v1 = 1 then
        resultN('',b[i]-1,center(i,j,2,5)-1,2,3)
      else
        resultN('',b[j-i+1]-1,center(i,j,2,5)-1,2,3);
    resultN('���������� ���������: ',j,0,4,2);
  SetNumberOfTests(6);
Pause;
end;



procedure SArr65An26(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
     TaskText('��� ������ �������~{N}.', 0, 2);
     TaskText('����� ������ ���\ ������� ���������� ��������', 0, 3);
     TaskText('(\I��������� �������\i\ \= ��� �������, ������� ������ ������ ��\ ����� �������).', 0, 4);
(*
*)
n := 5 + Random(6);
case Random(4) of
0: k := 1;
1: k := n;
2,3: k := 2 + Random(n-2);
end;
case curtest of //2012
2: k := n;
3: k := 2 + Random(n-2);
5: k := 1;
end;
    a[k] := 3 + Random*4;
    a[k+1] := a[k] + 0.1 + Random;
    for i := k-1 downto 1 do
      a[i] := a[i+1]+0.1+0.3*Random;
    for i := k+2 to n do
      a[i] := 9.98*Random;
    dataN('N = ',n,0,2,1);
    for i := 1 to n do
      dataR('',a[i],center(i,n,5,2),4,5);
    resultN('',k-1,0,3,2);
  setNumberOfUsedData(k+2);
  SetNumberOfTests(6);
Pause;
end;


procedure SArr65An27(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(1, 0, 0, 0, v1, v2, v3);
     TaskText('��� ������ �������~{N}.', 0, 2);
     TaskText('����� ������ ���\ ���������� ���������� ���������', 0, 3);
     TaskText('(\I��������� ��������\i\ \= ��� �������, ������� ������ ������ ��\ ����� �������).', 0, 4);
(*
*)
(*==*)
n := 5 + Random(6);
case Random(4) of
0: k := 1;
1: k := n;
2,3: k := 2 + Random(n-2);
end;
case curtest of //2012
3: k := n;
4: k := 2 + Random(n-2);
5: k := 1;
end;
    a[k] := 3 + Random*4;
    a[k-1] := a[k] - 0.1 - Random;
    for i := k+1 to n do
      a[i] := a[i-1]- 0.1 - 0.3*Random;
    for i := 1 to k-2 do
      a[i] := 9.98*Random;
    dataN('N = ',n,0,2,1);
    for i := 1 to n do
      dataR('',a[i],center(i,n,5,2),4,5);
    resultN('',k-1,0,3,2);
  SetNumberOfTests(6);
Pause;
end;


procedure SArr65An28(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('��� ������ �������~{N}.',0,2);
taskText('����� ������������ ��\ ��� ��������� ���������',0,3);
taskText('(����������� \I���������� ��������\i ���� �\ ������� \2).',0,4);
(*
*)
end;
2: begin
taskText('��� ������ �������~{N}.',0,2);
taskText('����� ����������� ��\ ��� ��������� ����������',0,3);
taskText('(����������� \I���������� ���������\i ���� �\ ������� \2).',0,4);
(*
*)
end;
end;
(*==*)
n := 5 + Random(6);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 := -1000;
y0 := 1000;
for i := 2 to n-1 do
  if (a[i]<a[i-1])and(a[i]<a[i+1])and(a[i]>x0) then x0 := a[i]
  else
    if (a[i]>a[i-1])and(a[i]>a[i+1])and(a[i]<y0) then y0 := a[i];
if (a[1]<a[2])and(a[1]>x0) then x0 := a[1];
if (a[n]<a[n-1])and(a[n]>x0) then x0 := a[n];
if (a[1]>a[2])and(a[1]<y0) then y0 := a[1];
if (a[n]>a[n-1])and(a[n]<y0) then y0 := a[n];
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
case v1 of
1:
resultR('',x0,0,3,5);
2:
resultR('',y0,0,3,5);
end;
  SetNumberOfTests(6);
Pause;
end;

procedure SArr65An29(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
taskText('��� ������ �������~{N}. ����� ������������ ��\ ��� ���������,',0,1);
taskText('��\ ���������� ��\ ��������� ���������, ��\ ��������� ����������',0,2);
taskText('(����������� \I���������� ��������\i �\ \I���������� ���������\i',0,3);
taskText('���� �\ �������� \4 �\ \3). ���� ����� ���������',0,4);
taskText('�\ ������� ���, ��\ �������~0 (��� ������������ �����).',0,5);
(*
*)
(*==*)
n1 := Random(3);
case curtest of //2012
3: n1 := 1;
4: n1 := 0;
end;
while true do
begin
n := 5 + Random(6);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 := -1000;
for i := 2 to n-1 do
  if ((a[i]-a[i-1])*(a[i]-a[i+1])<0)and(a[i]>x0) then x0 := a[i];
if x0 = -1000 then x0 := 0;
if (n1 <> 0) or (x0 = 0) then break;

end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',x0,0,3,5);
  SetNumberOfTests(5);
Pause;
end;




procedure SArr65An30(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
n1 := 1;
taskText('��� ������ �������~{N}. ����� ���������� ��������,',0,2);
taskText('��\ ������� ���\ �������� ����������.',0,4);
(*
*)
   end;
2: begin
n1 := -1;
taskText('��� ������ �������~{N}. ����� ���������� ��������,',0,2);
taskText('��\ ������� ���\ �������� �������.',0,4);
(*
*)
   end;
end;
(*==*)
n := 5 + Random(6);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
k:=0;
j:=2;
while j<=n do
  begin
    i:=j;
    while (n1*a[i]>n1*a[i-1]) do
      begin
        inc(i);
        if i>n then break;
      end;
    if i>j then inc(k);
    j:=i+1;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultN('',k,0,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An31(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
taskText('��� ������ �������~{N}. ����� ���������� ���\ \I����������� ������������\i',0,2);
taskText('(�.\,�. ��������, ��\ ������� ���\ �������� ���������� ���\ �������).',0,4);
(*
������� ���������� ��������� ������� ������� �\ ����� �����������
\I��������� �����������\i (��������� �\ ����������).
��� ����,
����� ��������, ��������\ �� ������� {A}_{i} ��������� �����������,
����� ����� ��������� ���������� �����������
\[({A}_{i}\;\-\;{A}_{i\-1})\*({A}_{i}\;\-\;{A}_{i+1})~>~0.\]
*)
(*==*)
n := 2 + Random(9);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
k:=0;
j:=2;
while j<=n do
  begin
    i:=j;
    while (a[i]>a[i-1]) do
      begin
        inc(i);
        if i>n then break;
      end;
    if i>j then inc(k);
    j:=i+1;
  end;
j:=2;
while j<=n do
  begin
    i:=j;
    while (a[i]<a[i-1]) do
      begin
        inc(i);
        if i>n then break;
      end;
    if i>j then inc(k);
    j:=i+1;
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultN('',k,0,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An32(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('���� �����~{R} �\ ������~{A} �������~{N}.', 0, 2);
  TaskText('����� ������� �������, ������� \I�������� ������\i �\ �����~{R}', 0, 3);
  TaskText('(�.\,�. ����� ������� {A}_{K}, ��� �������� �������� |{A}_{K}\;\-\;{R}| �������� �����������).', 0, 4);
(*
��� ������� �������� �\ ���������� ������������/�������������
�������� ���\ ���������������� ������ ������.
*)
(*==*)
n := 2 + Random(9);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 :=  19.98*Random-9.99;
y0 := Abs(x0-a[1]);
k := 1;
for i := 2 to n do
  if Abs(x0-a[i])<y0 then
    begin
      y0 := Abs(x0-a[i]);
      k := i;
    end;
dataR('R = ',x0,xLeft,2,5);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a[k],0,3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An33(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}. ����� ���\ �������� ��������, ����� �������', 0, 2);
  TaskText('�����������, �\ ������� ���\ �������� �\ ������� ����������� ��\ ��������.', 0, 4);
(*
*)
(*==*)
n := 2 + Random(9);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 :=  -1000;
for i := 2 to n do
  if a[i-1]+a[i]>x0 then
    begin
      x0 := a[i-1]+a[i];
      k := i;
    end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a[k-1],center(1,2,5,2),3,5);
resultR('',a[k],center(2,2,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An34(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('���� �����~{R} �\ ������ �������~{N}.', 0, 2);
  TaskText('����� ���\ �������� �������� �������, ����� ������� �������� ������', 0, 3);
  TaskText('�\ �����~{R}, �\ ������� ���\ �������� �\ ������� ����������� ��\ ��������', 0, 4);
  TaskText('(����������� �������� ������� ����� ���� �\ ������� \2).', 0, 5);
(*
*)
(*==*)
n := 3 + Random(8);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 :=  19.98*Random-9.99;
y0 := Abs(x0-a[1]-a[2]);
k := 2;
for i := 3 to n do
  if Abs(x0-a[i]-a[i-1])<y0 then
    begin
      y0 := Abs(x0-a[i]-a[i-1]);
      k := i;
    end;
dataR('R = ',x0,xLeft,2,5);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a[k-1],center(1,2,5,2),3,5);
resultR('',a[k],center(2,2,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An35(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N},', 0, 2);
  TaskText('��� �������� �������� ����������� (��\ ����������� ���\ ��\ ��������).', 0, 3);
  TaskText('����� ���������� ��������� ��������� �\ ������ �������.', 0, 4);
(*
*)
(*==*)
  n := 5 + Random(6);
  for i := 1 to n do
    b[i] := 2 + Random(8);
  if Random(2)=0 then k := 1
  else k := -1;
  case curtest of //2012
  3: k := 1;
  4: k := -1;
  end;
  for j := 1 to n do
    for i := 1 to n-j do
      if b[i]*k<b[i+1]*k then
      begin
        n0 := b[i];
        b[i] := b[i+1];
        b[i+1] := n0;
      end;
  k := 1;
  for i := 2 to n do
    if b[i] <> b[i-1] then inc(k);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',k,0,3,2);

  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An36(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N}, ����������', 0, 2);
  TaskText('����� ���\ ���������� ��������. ����� ������� ���������� ���������', 0, 3);
  TaskText('�\ ������� ���\ ������� �\ ������� �����������.', 0, 4);
(*
*)
(*==*)
  n := 5 + Random(6);
  b[1] := 100 + Random(900);
  for i := 2 to n do
    repeat
      b[i] := 100 + Random(900);
      k := 0;
      for j := 1 to i-1 do
        if b[i]=b[j] then
        begin
          k := 1;
          break;
        end;
    until k = 0;
  n1 := 1 + Random(n-1);
  n2 := n1+1+Random(n-n1);
  b[n2] := b[n1];
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
resultN('',n1-1,center(1,2,2,5)-1,3,2);
resultN('',n2-1,center(2,2,2,5)-1,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An37(Name, Key: string);
var
  v1, v2, v3: Byte;
  k1, k2: integer;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}. ����� ������� ���� ��������� ���������', 0, 2);
  TaskText('��\ ����� ������� (�.\,�. ��������� �\ ���������� ������� ��������)', 0, 3);
  TaskText('�\ ������� ���\ ������� �\ ������� �����������.', 0, 4);
(*
������� ��� ��������� ������� ���� ������������ ����� �������,
����� �\ ���� ������� ��������� �������� �\ ����� ������ ����
��������������� \I����� ���� ���\i
(���\ ����� ���������� �\ ��������������� ������� ����� �������
���� ��\ �������� ��������� ���������� ����������� �����
��������� ��\ �������� �������� ���������� �������� �����).
*)
(*==*)
n := 5 + Random(6);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
y0 := Abs(a[1]-a[2]);
k1 := 1; k2 := 2;
for i := 1 to n do
  for j := i+1 to n do
  if Abs(a[i]-a[j])<y0 then
    begin
      y0 := Abs(a[i]-a[j]);
      k1 := i;
      k2 := j;
    end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultN('',k1-1,center(1,2,2,5)-1,3,2);
resultN('',k2-1,center(2,2,2,5)-1,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('���� �����~{R} �\ ������ �������~{N}.', 0, 2);
  TaskText('����� ���\ ��������� �������� �������, ����� ������� �������� ������', 0, 3);
  TaskText('�\ �����~{R}, �\ ������� ���\ �������� �\ ������� ����������� ��\ ��������', 0, 4);
  TaskText('(����������� �������� ������� ����� ���� �\ ������� \6).', 0, 5);
(*
+
*)
(*==*)
n := 3 + Random(8);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
x0 :=  19.98*Random-9.99;
y0 := 1000;
for i := 1 to n-1 do
  for j := i+1 to n do
  if Abs(x0-a[i]-a[j])<y0 then
    begin
      y0 := Abs(x0-a[i]-a[j]);
      n1 := i;
      n2 := j;
    end;
dataR('R = ',x0,xLeft,2,5);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
resultR('',a[n1],center(1,2,5,2),3,5);
resultR('',a[n2],center(2,2,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 46{level});(*DEMO*)
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('����� ���������� ��������� ��������� �\ ������ �������.', 0, 4);
(*
*)
  n := 5 + Random(6);
  for i := 1 to n do
  begin
    b[i] := 2 + Random(8);
    b1[i] := b[i];
  end;
  if Random(2)=0 then k := 1
  else k := -1;
  for j := 1 to n do
    for i := 1 to n-j do
      if b[i]*k<b[i+1]*k then
      begin
        n0 := b[i];
        b[i] := b[i+1];
        b[i+1] := n0;
      end;
  k := 1;
  for i := 2 to n do
    if b[i] <> b[i-1] then inc(k);
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b1[i],center(i,n,1,6),4,1);
resultN('',k,0,3,2);
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr65An40(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: Word;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('����� ������������ ���������� ���\ ���������� ���������.',0,4);
(*
������� ����� ������� ���������� �\ �.\,10.1.
*)
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
for i:=1 to n do
  begin
    b1[i] := 1;
    for j:=i+1 to n do
      if b[j]=b[i] then inc(b1[i]);
  end;
nmax := b1[1];
for i:=2 to n do
  if b1[i]>nmax then nmax := b1[i];
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',nmax,0,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An41(Name, Key: string);
var
  v1, v2, v3: Byte;
  k,n,i,j,j1,j2:integer;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('��� ������������� ������ �������~{N}. ���� ��\ ��������',0,2);
taskText('\I�������������\i, �.\,�. �������� ���\ ����� ��~1 ��~{N}, ��\ �������~\-1;',0,3);
taskText('�\ ��������� ������ ������� ������ ������� ������������� ��������.',0,4);
(*
������� ����� ������������ ���� �� ���� ��\ ����� �\ ���������� 1..{N}, ����
���\ ������������� ����� �\ �������. ����� �������, ���\ ������� �������
���������� �������� ��������������� �������� ���\ ������� �������� �������.
�������, ���\ ��� �������� ����, ����������\ �� �����
�\ ������� ������ �������, ���\ ������������� ���������� ���\ ����������
��������: ���������� ������� ��������������� ������~{b} �������~{N},
���������������� ��� ������, �\ ���\ ������� ��������~{a}_{i} ���������
������� �������� ������� �������~{b} \I�\ ��������\i {a}_{i} ������~1
(����\ �� ������ ������� �������~{b} \I��� ����� �������\i,
������, �����~{a}_{i} ���������� �\ ������� ��\ ������ ���).
����~{N} ��\ ���������~255, ��\ � ����� \UP ������ ��������������� �����
\Mset\m (���������). ������ ��������������� ���������~{s} ���
\Mset of 1..255\m. ������� ������� ���\ ������ ������� ���������
(\Ms~:=~[]\m). ����� (�\ �����) ����� ��������� �\ ���� ��\ ������ ��������
��������� ������� �\ ������� ���������  \Ms~:=~s~+~[a[i]]\m
(����� ������������ �������� \I�����������\i
���������~{s} �\ ��������������� ���������, ����������� �����~{a}_{i}),
\I�������������� ��������, ���\ ���� ������� ��� ��\ ������ �~{s}\i
(������� ����� ���: \Mnot~(a[i]~in~s)\m). ���� ��������� �������
��\ �����������, ������, ����� {a}_{i} ���������� �\ �������
��\ ������ ���.
*)
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 4 + Random(7);
for i:=1 to n do
 begin
  b[i] := i;
 end;
for i := 1 to 20 do
  begin
    j1 := 1 + Random(n);
    j2 := 1 + Random(n);
    k := b[j1];
    b[j1] := b[j2];
    b[j2] := k;
  end;
k := Random(7);
case curtest of //2012
2: k:= 1;
4: k := 4;
5: k := 2;
end;
case k of
0,1 : begin
      j := 1 + Random(n);
      b[j] := b[j]+Random(5)+1;
      for j1 := j+1 to n do
        if b[j1]=b[j] then j := j1;
    end;
2,3 : begin
      j := 1 + Random(n);
      b[j] := b[j]-integer(Random(2))-1;
      for j1 := j+1 to n do
        if b[j1]=b[j] then j := j1;
    end;
4,5,6: j := 0;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',j-1,0,3,2);
if j <> 0 then setNumberOfUsedData(j+1);
  SetNumberOfTests(6);
Pause;
end;

procedure SArr65An42(Name, Key: string);
var
  v1, v2, v3: Byte;
  k,n,i,j,j1,j2:integer;
begin
  Start(Name, Topic3, Author, Key, 46{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('��� ������������� ������~{A} �������~{N}, ���������� �������������',0,2);
taskText('(����������� \I������������\i ���� � ������� \1). ����� ����������',0,3);
taskText('\I��������\i �\ ������ ������������, �.\,�. ����� ��� ���������~{A}_{I} �~{A}_{J},',0,4);
taskText('�\ ������� ������� ����� ��������� ����� �� ��������: {A}_{I}~>~{A}_{J} ���\ {I}~<~{J}.',0,5);
(*
*)
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 4 + Random(7);
for i:=1 to n do
 begin
  b[i] := i;
 end;
for i := 1 to 20 do
  begin
    j1 := 1 + Random(n);
    j2 := 1 + Random(n);
    k := b[j1];
    b[j1] := b[j2];
    b[j2] := k;
  end;
k := 0;
for i := 2 to n do
  for j := 1 to i-1 do
    if b[j] > b[i] then inc(k);

dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',k,0,3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An43(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr65An44(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} (0~\l~{K}~\l~{N}\-1). ������������� ������,', 0, 2);
  TaskText('�������� ������ ���\ ������� ��\ �������� �������� �������� {A}_{K}.', 0, 4);
(*
*)
(*==*)
n := 3 + Random(8);
k := 1 + Random(n);
for i:=1 to n do
   a[i] := RandomR2(0.1,9.9); //9.98*Random; //2018
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),3,5);
dataN('K = ',k-1,0,4,1);
x0 := a[k];
for i := 1 to n do
  resultR('',a[i]+x0,center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������������� ������ �������~{N}. ��������� ���\ ������ �����,', 0, 2);
  TaskText('������������ �\ �������, ��\ �������� �������� ������� ������� �����.', 0, 3);
  TaskText('���� ������ ����� �\ ������� �����������, ��\ �������� ������ ���\ ���������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������������� ������ �������~{N}. ��������� ���\ �������� �����,', 0, 2);
  TaskText('������������ �\ �������, ��\ �������� �������� ���������� ��������� �����.', 0, 3);
  TaskText('���� �������� ����� �\ ������� �����������, ��\ �������� ������ ���\ ���������.', 0, 4);
(*
*)
  end;
(*==*)
  n := 3 + Random(8);
  j := Random(4);
  case curtest of //2012
  2: j := 1;
  3: j := 0;
  end;
  for i:=1 to n do
  begin
    if j = 0 then
      case v1 of
      1: b[i] := 1 + 2*Random(5);
      2: b[i] := 2 + 2*Random(4);
      end
    else
      b[i] := 1 + Random(9);
    if Random(2) = 0 then b[i] := -b[i]; //2012
  end;
  k := 0;
  if v1 = 1 then
    for i := 1 to n do
    begin
      if not Odd(b[i]) then
      begin
        k := b[i];
        break;
      end;
    end
  else
    for i := n downto 1 do
      if Odd(b[i]) then
      begin
        k := b[i];
        break;
      end;
for i := 1 to n do
begin
b1[i] := b[i];
case v1 of
1: if not Odd(b1[i]) then b1[i] := b1[i]+k;
2: if Odd(b1[i]) then b1[i] := b1[i]+k;
end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
for i := 1 to n do
  resultN('',b1[i],center(i,n,3,4),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An46(Name, Key: string);
var
  v1, v2, v3: Byte;
  min,max: real;
  nmin,nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}.', 0, 2);
  TaskText('�������� ������� ���\ ����������� �\ ������������ ��������.', 0, 4);
(*
*)
(*==*)
n := 3 + Random(8);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
min := a[1];
nmin := 1;
max := a[1];
nmax := 1;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 2 to n do
  if a[i]<min then
  begin
    min := a[i];
    nmin := i;
  end
  else
  if a[i]>max then
  begin
    max := a[i];
    nmax := i;
  end;
  a[nmin] := max;
  a[nmax] := min;
for i := 1 to n do
  resultR('',a[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;




procedure SArr65An47(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ {A} �������~{N} ({N}\ \= ������ �����).', 0, 2);
  TaskText('�������� ������� �������� {A}_0 � {A}_1, {A}_2 � {A}_3 �\ �.\,�.', 0, 4);
(*
*)
(*==*)
  n := 2 + 2*Random(5);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99; //2012
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n div 2 do
  begin
  a1[2*i-1] := a[2*i];
  a1[2*i] := a[2*i-1];
  end;
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An48(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N} ({N}\ \= ������ �����).', 0, 2);
  TaskText('�������� ������� ������ �\ ������ �������� �������.', 0, 4);
(*
*)
(*==*)
  n := 2 + 2*Random(5);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99; //2012
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n div 2 do
  begin
  a1[i] := a[n div 2 + i];
  a1[n div 2 + i] := a[i];
  end;
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An49(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});(*DEMO*)
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}.', 0, 2);
  TaskText('�������� ������� ���\ ��������� ��\ ��������.', 0, 4);
(*
*)
  n := 2 + Random(9);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99; //2012
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n do
    resultR('',a[n-i+1],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An50(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
    j := 0;
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} �~{L} (0~\l~{K}~<~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����������� �\ �������� ������� �������� �������,', 0, 3);
  TaskText('������������� ����� ����������~{A}_{K} �~{A}_{L}, ������� ���\ ��������.', 0, 4);
(*
*)
  end
  else
  begin
    s := '';
    j := 1;
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} �~{L} (0~\l~{K}~<~{L}~\l~{N}\-1).', 0, 2);
  TaskText('����������� �\ �������� ������� �������� �������,', 0, 3);
  TaskText('������������� ����� ����������~{A}_{K} �~{A}_{L}, ��\ ������� ���\ ��������.', 0, 4);
(*
*)
  end;
(*==*)
  n := 5 + Random(6);
  for i:=1 to n do
  begin
    a[i] := 19.98*Random-9.99; //2012
    a1[i] := a[i];
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  n1 := 1 + Random(n-2);
  n2 := n1 + 1 + Random(n-n1);
  dataN('K = ',n1-1,xLeft,4,1);
  dataN('L = ',n2-1,xRight,4,1);
  for i := n1+j to n2-j do
    a1[i] := a[n2-i+n1];
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(7);
Pause;
end;

procedure SArr65An51(Name, Key: string);
var
  v1, v2, v3: Byte;
  min,max: real;
  nmin,nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}. �������� �������� �������,', 0, 2);
  TaskText('������������� ����� ���\ ����������� �\ ������������ ����������', 0, 3);
  TaskText('(�� ������� ����������� �\ ������������ ��������).', 0, 4);
(*
*)
(*==*)
n := 3 + Random(8);
for i:=1 to n do
  a[i] := 19.98*Random-9.99; //2012
min := a[1];
nmin := 1;
max := a[1];
nmax := 1;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 2 to n do
  if a[i]<min then
  begin
    min := a[i];
    nmin := i;
  end
  else
  if a[i]>max then
  begin
    max := a[i];
    nmax := i;
  end;
if nmin>nmax then
begin
  n1 := nmin;
  nmin := nmax;
  nmax := n1;
end;
for i := nmin+1 to nmax-1 do
  a[i] := 0;
for i := 1 to n do
  resultR('',a[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr65An52(Name, Key: string);
var
  v1, v2, v3: Byte;
  min,max: real;
  nmin,nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}. ����������� �\ �������� ������� �������� �������,', 0, 2);
  TaskText('������������� ����� ���\ ����������� �\ ������������ ����������,', 0, 3);
  TaskText('������� ����������� �\ ������������ ��������.', 0, 4);
(*
*)
(*==*)
n := 5 + Random(6);
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99; //2012
  a1[i] := a[i];
end;
min := a[1];
nmin := 1;
max := a[1];
nmax := 1;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 2 to n do
  if a[i]<min then
  begin
    min := a[i];
    nmin := i;
  end
  else
  if a[i]>max then
  begin
    max := a[i];
    nmax := i;
  end;
if nmin>nmax then
begin
  n1 := nmin;
  nmin := nmax;
  nmax := n1;
end;
  for i := nmin to nmax do
    a1[i] := a[nmax-i+nmin];
for i := 1 to n do
  resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(7);
Pause;
end;

procedure SArr65An53(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('��� ������ �������~{N}. �������� ��� ���\ \I���������\i', 0, 2);
  TaskText('\I���������\i (�.\,�. �����, ������� ����� �������).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('��� ������ �������~{N}. �������� �\ ������� ��� ���\ \I���������\i', 0, 2);
  TaskText('\I��������\i (�.\,�. �����, ������� ����� �������).', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('��� ������ �������~{N}. �������� ������ ������� �������', 0, 2);
  TaskText('��\ ������� �������������� ����� �������� �\ ��� �������.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
   a[i] := RandomR2(-9.9,9.9); //19.98*Random-9.99; //2012 //2018
  case v1 of
  1,2:
  begin
  a[0] := a[2];
  a[n+1] := a[n-1];
  end;
  3:
  begin
  a[0] := (a[1]+a[2])/2;
  a[n+1] := (a[n-1]+a[n])/2;
  end;
  end;

  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n do
    case v1 of
    1:
    if (a[i]>a[i-1])and(a[i]>a[i+1]) then
      resultR('',0,center(i,n,5,2),3,5)
    else
      resultR('',a[i],center(i,n,5,2),3,5);
    2:
    if (a[i]<a[i-1])and(a[i]<a[i+1]) then
      resultR('',a[i]*a[i],center(i,n,5,2),3,5)
    else
      resultR('',a[i],center(i,n,5,2),3,5);
    3:
    resultR('',(a[i]+a[i-1]+a[i+1])/3,center(i,n,5,2),3,5);
    end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An54(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}.', 0, 1);
  TaskText('����������� \I�����\i ��������� ������� ������ ��\ ���� �������', 0, 2);
  TaskText('(���\ ���� {A}_{0}~�������� �~{A}_{1}, {A}_{1}\ \= �~{A}_{2},~\., {A}_{N\-2}\ \= �~{A}_{N\-1},', 0, 3);
  TaskText('a �������� �������� ���������� �������� ����� ��������).', 0, 4);
  TaskText('��������� ������� ����������� ������� �������� ������~0.', 0, 5);
(*
*)
  n := 2 + Random(9);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  resultR('',0,center(1,n,5,2),3,5);
  for i := 1 to n-1 do
    resultR('',a[i],center(i+1,n,5,2),3,5);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr65An55(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}.', 0, 1);
  TaskText('����������� \I�����\i ��������� ������� ����� ��\ ���� �������', 0, 2);
  TaskText('(���\ ���� {A}_{N\-1}~�������� �~{A}_{N\-2}, {A}_{N\-2}\ \= �~{A}_{N\-3},~\., {A}_{1}\ \= �~{A}_{0},', 0, 3);
  TaskText('a �������� �������� ���������� �������� ����� ��������).', 0, 4);
  TaskText('��������� ������� ����������� ������� �������� ������~0.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 2 to n do
    resultR('',a[i],center(i-1,n,5,2),3,5);
  resultR('',0,center(n,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An56(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
case v1 of
1:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} (1~\l~{K}~<~{N}).', 0, 1);
  TaskText('����������� \I�����\i ��������� ������� ������ ��\ {K}~�������', 0, 2);
  TaskText('(���\ ���� {A}_{0}~�������� �~{A}_{K}, {A}_{1}\ \= �~{A}_{K+1},~\., {A}_{N\-K\-1}\ \= �~{A}_{N\-1},', 0, 3);
  TaskText('� �������� �������� {K}~��������� ��������� ����� ��������).', 0, 4);
  TaskText('������ {K}~��������� ����������� ������� �������� �������~0.', 0, 5);
(*
*)
  end;
2:
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} (1~\l~{K}~<~{N}).', 0, 1);
  TaskText('����������� \I�����\i ��������� ������� ����� ��\ {K}~�������', 0, 2);
  TaskText('(���\ ���� {A}_{N\-1}~�������� �~{A}_{N\-K\-1}, {A}_{N\-2}\ \= �~{A}_{N\-K\-2},~\., {A}_{K}\ \= �~{A}_{0},', 0, 3);
  TaskText('� �������� �������� {K}~������ ��������� ����� ��������).', 0, 4);
  TaskText('��������� {K}~��������� ����������� ������� �������� �������~0.', 0, 5);
(*
*)
  end;
end;
(*==*)
  n := 5 + Random(6);
  k := 1 + Random(n-1);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k,0,4,1);
  case v1 of
  2:
  begin
  for i := 1+k to n do
    resultR('',a[i],center(i-k,n,5,2),3,5);
  for i := 1 to k do
    resultR('',0,center(n-k+i,n,5,2),3,5);
  end;
  1:
  begin
  for i := 1 to k do
    resultR('',0,center(i,n,5,2),3,5);
  for i := 1 to n-k do
    resultR('',a[i],center(i+k,n,5,2),3,5);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An57(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������ �������~{N}.',0,2);
taskText('����������� \I����������� �����\i ��������� ������� ������ ��\ ���� �������',0,3);
taskText('(���\ ���� {A}_{0}~�������� �~{A}_{1}, {A}_{1}\ \= �~{A}_{2},~\., {A}_{N\-1}\ \= �~{A}_{0}).',0,4);
(*
*)
end;
2:
begin
taskText('��� ������ �������~{N}.',0,2);
taskText('����������� \I����������� �����\i ��������� ������� ����� ��\ ���� �������',0,3);
taskText('(���\ ���� {A}_{N\-1}~�������� �~{A}_{N\-2}, {A}_{N\-2}\ \= �~{A}_{N\-3},~\., {A}_{0}\ \= �~{A}_{N\-1}).',0,4);
(*
*)
end;
end;
(*==*)
n := 5 + Random(6);
k := 1;
for i:=1 to n do
    a[i] := 19.98*Random-9.99;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
case v1 of
1:
for i := 1 to n do
if i+k<=n then  a1[i+k] := a[i]
          else  a1[(i+k)mod n] := a[i];
2:
for i := 1 to n do
if n-k+i<=n then  a1[n-k+i] := a[i]
            else  a1[(n-k+i)mod n] := a[i];
end;
for i := 1 to n do
  resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An58(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} (1~\l~{K}~\l~4, {K}~<~{N}).', 0, 2);
  TaskText('����������� \I����������� �����\i ��������� ������� ������ ��\ {K}~�������', 0, 3);
  TaskText('(���\ ���� {A}_{0}~�������� �~{A}_{K}, {A}_{1}\ \= �~{A}_{K+1},~\., {A}_{N\-1}\ \= �~{A}_{K\-1}).', 0, 4);
  TaskText('����������� ������������ ��������������� ������ ��~4~���������.', 0, 5);
(*
*)
end;
2:
begin
  TaskText('��� ������~{A} �������~{N} �\ ����� �����~{K} (1~\l~{K}~\l~4, {K}~<~{N}).', 0, 2);
  TaskText('����������� \I����������� �����\i ��������� ������� ����� ��\ {K}~������� (���\ ����', 0, 3);
  TaskText('{A}_{N\-1}~�������� �~{A}_{N\-K\-1}, {A}_{N\-2}\ \= �~{A}_{N\-K\-2},~\., {A}_{0}\ \= �~{A}_{N\-K}).', 0, 4);
  TaskText('����������� ������������ ��������������� ������ ��~4~���������.', 0, 5);
(*
*)
end;
end;
(*==*)
n := 5 + Random(6);
k := 1 + Random(4);
for i:=1 to n do
    a[i] := 19.98*Random-9.99;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),3,5);
dataN('K = ',k,0,4,1);
case v1 of
1:
for i := 1 to n do
if i+k<=n then  a1[i+k] := a[i]
          else  a1[(i+k)mod n] := a[i];
2:
for i := 1 to n do
if n-k+i<=n then  a1[n-k+i] := a[i]
            else  a1[(n-k+i)mod n] := a[i];
end;
for i := 1 to n do
  resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An59(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(10, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������ �������~{N}, ���\ �������� ��������, ����� ������� (� ��������~0),', 0, 2);
  TaskText('����������� ��\ �����������. ������� ������ �������������,', 0, 3);
  TaskText('���������� ������ ������� ��\ ����� �������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������ �������~{N}, ���\ �������� ��������, ����� ����������,', 0, 2);
  TaskText('����������� ��\ �����������. ������� ������ �������������,', 0, 3);
  TaskText('���������� ��������� ������� ��\ ����� �������.', 0, 4);
(*
*)
  end;
(*==*)
n := 5 + Random(6);
for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  for j := 1 to n do
    for i := 1 to n-j do
      if a[i]>a[i+1] then
      begin
        a0 := a[i];
        a[i] := a[i+1];
        a[i+1] := a0;
      end;
m := Random(3);
case curtest of //2012
3: m := 0;
4: m := 2;
end;
case m of
0,1: k := 2 + Random(n-2);
2: if v1 = 1 then k := n
   else k := 1;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  resultR('',a[i],center(i,n,5,2),3,5);
a0 := a[k];
case v1 of
1:
  begin
  for i := k-1 downto 1 do
    a[i+1] := a[i];
  a[1] := a0;
  end;
2:
  begin
  for i := k+1 to n do
    a[i-1] := a[i];
  a[n] := a0;
  end;
end;
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An60(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}, ���\ �������� ��������, ����� ������,', 0, 2);
  TaskText('����������� ��\ ��������. ������� ������ �������������,', 0, 3);
  TaskText('���������� �������, ���������� ���������������, ��\ ����� �������.', 0, 4);
(*
*)
n := 5 + Random(6);
for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  for j := 1 to n do
    for i := 1 to n-j do
      if a[i]<a[i+1] then
      begin
        a0 := a[i];
        a[i] := a[i+1];
        a[i+1] := a0;
      end;
repeat
n1 := 1 + Random(n);
n2 := 1 + Random(n);
until n1 <> n2;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  resultR('',a[i],center(i,n,5,2),3,5);
a0 := a[n1];
for i := n1+1 to n do
  a[i-1] := a[i];
for i := n-1 downto n2 do
  a[i+1] := a[i];
a[n2] := a0;
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
  SetNumberOfTests(9);
Pause;
end;


procedure SArr65An61(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr65An62(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('������� ��\ ������� ������� �\ ��������~{K}.', 0, 4);
(*
*)
(*==*)
  n := 5 + Random(6);
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,0,4,1);
  for i := k to n do
    a[i] := a[i+1];
  for i := 1 to n-1 do
    resultR('',a[i],center(i,n-1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr65An63(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} �~{L} (0~\l~{K}~<~{L}~\l~{N}\-1).', 0, 2);
  TaskText('������� ��\ ������� �������� �\ ��������� ��~{K} ��~{L} ������������', 0, 3);
  TaskText('�\ ������� ������ ����������� ������� �\ ���\ ����������.', 0, 4);
(*
*)
(*==*)
  n := 5 + Random(6);
  repeat
  n1 := 1 + Random(n);
  n2 := 1 + Random(n);
  until n1 < n2;
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',n1-1,xLeft,4,1);
  dataN('L = ',n2-1,xRight,4,1);
  for i := n2+1 to n do
    a[n1+i-1-n2] := a[i];
  k := n-n2+n1-1;
  resultN('����� ������ �������: ',k,0,2,1);
  for i := 1 to k do
    resultR('',a[i],center(i,k,5,2),4,5);
  SetNumberOfTests(9);
Pause;
end;

procedure SArr65An64(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level});(*DEMO*)
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ��\ ������� ���\ �������� �����', 0, 3);
  TaskText('�\ ������� ������ ����������� ������� �\ ���\ ����������.', 0, 4);
(*
*)
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if not Odd(b[i]) then inc(k);
    if Random(2) = 0 then b[i] := -b[i];
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
resultN('����� ������ �������: ',k,0,2,1);
j := 0;
for i := 1 to n do
  begin
  if not Odd(b[i]) then
  begin
    inc(j);
    resultN('',b[i],center(j,k,3,4),4,3);
  end;
  end;
SetNumberOfTests(5);
Pause;
end;

procedure SArr65An65(Name, Key: string);
var
  v1, v2, v3: Byte;
  bln: Boolean;

begin
  Start(Name, Topic4, Author, Key, 46{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������������� ������ �������~{N} (>\,2).', 0, 2);
  TaskText('������� ��\ ������� ���\ �������� �\ ��������� ��������� (1,~3,~\.).', 0, 3);
  TaskText('�������� �������� �� ������������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������������� ������ �������~{N} (>\,2).', 0, 2);
  TaskText('������� ��\ ������� ���\ �������� �\ ������� ��������� (0,~2,~\.).', 0, 3);
  TaskText('�������� �������� �� ������������.', 0, 4);
(*
*)
  end;
(*==*)
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
if v1 = 1 then
  k := (n+1) div 2
else
  k := n div 2;
j := 0;
for i := 1 to n do
  begin
  if v1 = 1 then bln := Odd(i)
  else bln := not Odd(i);
  if bln then
  begin
    inc(j);
    resultN('',b[i],center(j,k,3,4),3,3);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;



begin
Topic := '���������� �������';
Topic1 := '���������� �������: ������������';
Topic2 := '���������� �������: ����� ���������';
Topic3 := '���������� �������: ������ ���������';
Topic4 := '���������� �������: ��������������';
{Author := '�.~�.~�������, 2002';}
end.

