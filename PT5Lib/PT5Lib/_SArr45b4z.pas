{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SArr45B4z;

interface

procedure SArr45Bn1(Name, Key: string);
procedure SArr45Bn2(Name, Key: string);
procedure SArr45Bn3(Name, Key: string);
procedure SArr45Bn4(Name, Key: string);
procedure SArr45Bn5(Name, Key: string);
procedure SArr45Bn6(Name, Key: string);
procedure SArr45Bn7(Name, Key: string);
procedure SArr45Bn8(Name, Key: string);
procedure SArr45Bn9(Name, Key: string);
procedure SArr45Bn10(Name, Key: string);
procedure SArr45Bn11(Name, Key: string);
procedure SArr45Bn12(Name, Key: string);
procedure SArr45Bn13(Name, Key: string);
procedure SArr45Bn14(Name, Key: string);
procedure SArr45Bn15(Name, Key: string);
procedure SArr45Bn16(Name, Key: string);
procedure SArr45Bn17(Name, Key: string);
procedure SArr45Bn18(Name, Key: string);
procedure SArr45Bn19(Name, Key: string);
procedure SArr45Bn20(Name, Key: string);
procedure SArr45Bn21(Name, Key: string);
procedure SArr45Bn22(Name, Key: string);
procedure SArr45Bn23(Name, Key: string);
procedure SArr45Bn24(Name, Key: string);
procedure SArr45Bn25(Name, Key: string);
procedure SArr45Bn26(Name, Key: string);
procedure SArr45Bn27(Name, Key: string);
procedure SArr45Bn28(Name, Key: string);
procedure SArr45Bn29(Name, Key: string);
procedure SArr45Bn30(Name, Key: string);
procedure SArr45Bn31(Name, Key: string);
procedure SArr45Bn32(Name, Key: string);
procedure SArr45Bn33(Name, Key: string);
procedure SArr45Bn34(Name, Key: string);
procedure SArr45Bn35(Name, Key: string);
procedure SArr45Bn36(Name, Key: string);
procedure SArr45Bn37(Name, Key: string);
procedure SArr45Bn38(Name, Key: string);
procedure SArr45Bn39(Name, Key: string);
procedure SArr45Bn40(Name, Key: string);
procedure SArr45Bn41(Name, Key: string);
procedure SArr45Bn42(Name, Key: string);
procedure SArr45Bn43(Name, Key: string);
procedure SArr45Bn44(Name, Key: string);
procedure SArr45Bn45(Name, Key: string);

implementation

uses PT5TaskMaker;
var
  Topic, Topic4, Topic5, Topic6, Topic7, Topic8, Author: string;
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




procedure SArr45Bn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ��\ ������� ���\ �������� ���������� ��������,', 0, 3);
  TaskText('������� ��\ ������ ���������.', 0, 4);
(*
*)
(*==*)
  a0:=1 + Random(5); b0:=1+Random(3);
  n := 5 + Random(6);
  k := 1;
  b[1] := Random(b0)+a0;
  for i:=2 to n do
  begin
    b[i] := Random(b0)+a0;
    if b[i]<>b[i-1] then inc(k);
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',b[1],center(1,k,1,6),3,1);
j := 1;
for i := 2 to n do
  if b[i]<>b[i-1] then
  begin
    inc(j);
    resultN('',b[i],center(j,k,1,6),3,1);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn2(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  if v1=1 then
  begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ��\ ������� ���\ ���������� ��������,', 0, 3);
  TaskText('������� ��\ ������ ���������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ��\ ������� ���\ ���������� ��������,', 0, 3);
  TaskText('������� ��\ ��������� ���������.', 0, 4);
(*
*)
  end;
(*==*)
a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
  b[i] := Random(b0)+a0;
k := 0;
if v1 = 1 then
begin
  for i:=1 to n do
  begin
    l := 0;
    for j := 1 to i-1 do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
  end;
end
else
begin
  for i:=n downto 1 do
  begin
    l := 0;
    for j := i+1 to n do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
   end;
   for i := 1 to k div 2 do
   begin
     l := b1[i];
     b1[i] := b1[k-i+1];
     b1[k-i+1] := l;
   end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
for i := 1 to k do
  resultN('',b1[i],center(i,k,1,6),3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn3(Name, Key: string);
label 0;
var
  v1, v2, v3: Byte;
  k,n:integer;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('������� ��\ ������� ���\ ��������, ������������� ����� ����\ ���,',0,3);
taskText('�\ ������� ������ ����������� ������� �\ ���\ ����������.',0,4);
(*
*)
end;
2:
begin
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('������� ��\ ������� ���\ ��������, ������������� ����� ����\ ���,',0,3);
taskText('�\ ������� ������ ����������� ������� �\ ���\ ����������.',0,4);
(*
*)
end;
3:
begin
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('������� ��\ ������� ���\ ��������, ������������� ����� ���\ ����,',0,3);
taskText('�\ ������� ������ ����������� ������� �\ ���\ ����������.',0,4);
(*
*)
end;
end;
(*==*)
0:  a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
for i:=1 to n do
  begin
    b1[i] := 0;
    for j:=1 to n do
      if b[j]=b[i] then inc(b1[i]);
  end;
k := 0;
for i := 1 to n do
  case v1 of
  1 : if b1[i]>=3 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  2 : if b1[i]<=2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  3 : if b1[i]<>2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  end;
if (k = 0)or(k = n) then goto 0;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('����� ������ �������: ',k,0,2,1);
for i := 1 to k do
  resultN('',b2[i],center(i,k,1,6),4,1);
  SetNumberOfTests(5);
Pause;
end;







procedure SArr45Bn4(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('����� ��������� ������� �\ ��������~{K}', 0, 3);
  TaskText('�������� ����� ������� �\ ������� ���������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������ �������~{N} �\ ����� �����~{K} (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('����� �������� ������� �\ ��������~{K} ', 0, 3);
  TaskText('�������� ����� ������� �\ ������� ���������.', 0, 4);
(*
*)
  end;
(*==*)
  n := 5 + Random(5);
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,0,4,1);
  for i := n downto k do
    a[i+1] := a[i];
  if v1 = 1 then a[k] := 0
  else a[k+1] := 0;
  for i := 1 to n+1 do
    resultR('',a[i],center(i,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  max, min: real;
  nmin, nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}. �������� ������� �\ ������� ���������', 0, 2);
  TaskText('����� ����������� �\ ����� ������������� �������� �������.', 0, 4);
(*
*)
(*==*)
n := 3 + Random(6);
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99;
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
j := 0;
for i := 1 to n do
begin
  if i=nmin then
  begin
    resultR('',0,center(i+j,n+2,5,2),3,5);
    inc(j);
  end;
  resultR('',a[i],center(i+j,n+2,5,2),3,5);
  if i=nmax then
  begin
    inc(j);
    resultR('',0,center(i+j,n+2,5,2),3,5);
  end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������ �������~{N} �\ ��� ����� �����~{K} �~{M} (0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10).', 0, 2);
  TaskText('����� ��������� ������� �\ ��������~{K}', 0, 3);
  TaskText('�������� {M}~����� ��������� �\ �������� ����������.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������ �������~{N} �\ ��� ����� �����~{K} �~{M} (0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10).', 0, 2);
  TaskText('����� �������� ������� �\ ��������~{K}', 0, 3);
  TaskText('�������� {M}~����� ��������� �\ �������� ����������.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 2 + Random(9);
  m := 1 + Random(7);
  until n + m <= 10;
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,xLeft,4,1);
  dataN('M = ',m,xRight,4,1);
  for i := n downto k do
    a[i+m] := a[i];
  for i := k+1 to k+m-1 do
    a[i] := 0;
  if v1 = 1 then a[k] := 0
  else a[k+m] := 0;
  for i := 1 to n+m do
    resultR('',a[i],center(i,n+m,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn7(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������ �������~{N}. �������������� �\ ��� ��������', 0, 2);
  TaskText('�\ ��������� ��������� (1,~3,~\.).', 0, 3);
  TaskText('�������� �������� �\ ����� ��\ ������������.', 0, 4);
(*
+
*)
  end
  else
  begin
  TaskText('��� ������ �������~{N}. ������� �\ ��� ��������� ���� ���������', 0, 2);
  TaskText('�\ ������� ��������� (0,~2,~\.).', 0, 3);
  TaskText('�������� �������� �\ ����� ��\ ������������.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    a[i] := 9.88*Random;
    case v1 of
    1: if not Odd(i) then inc(k);
    2: if Odd(i) then k := k + 2;
    end;
  end;
  until n+k<=19;
setprecision(1);
dataN('N = ',n,0,2,1);
for i := 1 to n do
    dataR('',a[i],center(i,n,3,2),4,3);
j := 0;
case v1 of
1:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,2),3,3);
    if not Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,2),3,3);
    end;
  end;
2:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,1),3,3);
    if Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Bn8(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������ �������~{N}.', 0, 2);
  TaskText('����� ������ ������������� ��������� �������', 0, 3);
  TaskText('�������� ������� �\ ������� ���������.', 0, 4);
(*
*)
n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
if a[i]>0 then
     begin
            a1[k+1] := 0;
            a1[k+2] := a[i];
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
  TaskText('��� ������ �������~{N}.', 0, 2);
  TaskText('����� ������� �������������� �������� �������', 0, 3);
  TaskText('�������� ������� �\ ������� ���������.', 0, 4);
(*
*)
end;
2:begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('�������������� �\ ��� ���\ ������ �����.', 0, 4);
(*
*)
  end;
3:begin
  TaskText('��� ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� �\ ��� ��������� ���� �������� �����.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin

n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
 if a[i]<0 then
          begin
            a1[k+1] := a[i];
            a1[k+2] := 0;
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);

   end;
2,3: begin
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    case v1 of
    2: if not Odd(b[i]) then inc(k);
    3: if Odd(b[i]) then k := k + 2;
    end;
  end;
  until n+k<=18;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
j := 0;
case v1 of
2:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if not Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
3:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn10(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;





procedure SArr45Bn11(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N} (\l\,6). ����������� ��� ��\ ����������� �������', 0, 1);
  TaskText('���������� \I������� �������\i (\I\<�����������\> �����������\i): ������������� ������,', 0, 2);
  TaskText('��������� ���\ �������� �������� ({A}_{0}~�~{A}_{1}, {A}_{1} �~{A}_{2} �~�.\,�.) �\ �����\ ��', 0, 3);
  TaskText('�������, ���� ����� ������� ���� ������ �������; ��������� ��������� ��������', 0, 4);
  TaskText('{N}\,\-\,1~���. ���\ �������� ��\ ������������ ���������� �������� ����������', 0, 5);
  TaskText('������� ����� ������� ���������. ������, ��� ���\ ������ ���������', 0, 0);
  TaskText('���������� ������������� ��� ����� ��������� ��~1.', 0, 0);
(*
*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    if (i = n) and (Random(3)=0) then a[i] := 2*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[i]>a[i+1] then
      begin
        a0 := a[i];
        a[i] := a[i+1];
        a[i+1] := a0;
      end;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Bn12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N} (\l\,6). ����������� ��� ��\ ����������� �������', 0, 1);
  TaskText('���������� \I������� �������\i: ����� ������������ ������� ������� �\ ��������', 0, 2);
  TaskText('��� ������� �\ ��������� ��������� (������� ������ {N}\,\-\,1); ��������� ���������', 0, 3);
  TaskText('�������� {N}\,\-\,1~���, ������ ��� �������� ��~1 ���������� ������������� ���������', 0, 4);
  TaskText('�\ ������ ���������� �������.', 0, 5);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    a0 := a[1];
    n1 := 1;
    for i := 2 to n-k+1 do
      if a[i]>a0 then
      begin
        a0 := a[i];
        n1 := i;
      end;
    a[n1] := a[n-k+1];
    a[n-k+1] := a0;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N} (\l\,6). ����������� ��� ��\ ����������� �������', 0, 1);
  TaskText('���������� \I�������� ���������\i: �������� ��������~{A}_{0} �~{A}_{1} �,\ ���', 0, 2);
  TaskText('������������� �����\ �� �������, �������� ����, ����� ��� ���������', 0, 3);
  TaskText('�������������� ��\ �����������; ����� ���������� �\ ��������~{A}_{2} �\ �����������', 0, 4);
  TaskText('��� �\ ����� (��� �������������) ����� �������, �������� ��\ ���������������;', 0, 5);
  TaskText('��������� ���� ������� ���\ ��������� ���������, ������ ���������� �������', 0, 0);
  TaskText('����� ��������� ������� �������� (��~{A}_{1} ��~{A}_{N\-1}).', 0, 0);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 2 to n do
  begin
    a[0] := a[k];
    i := k;
    while a[i-1]>a[0] do
    begin
      a[i] := a[i-1];
      dec(i);
    end;
    a[i] := a[0];
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k-1,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ��\ ������� ������~{A}, ������� ������� ���\ ���������', 0, 1);
  TaskText('�\ ��� �������, �\ ������� ���������������\ �� �������� �������� ������������', 0, 2);
  TaskText('������������������. ������������ ����� \I\<�����������\> ����������\i (��.\ �������', 0, 3);
  TaskText('\3), �������������\ ��� ��������� �������: ������� ���������������', 0, 4);
  TaskText('\I������ ��������\i~{I}, ��������\ ��� ������� ��~0 ��~{N}\-1; �������������', 0, 5);
  TaskText('������~{A}, ��������� ���� ��������� �������~{A} �\ ���������~{I}_{0} �~{I}_{1},', 0, 0);
  TaskText('{I}_{1} �~{I}_{2},~\. �~����� ������� ��������������� �������� �������~{I}, ����', 0, 0);
  TaskText('����� ������� ���� ������ �������. �������� ��������� ��������� ���������', 0, 0);
  TaskText('{N}\,\-\,1~���, ������� �\ �������~{I} ��������� ������������������ ��������.', 0, 0);
(*
*)
(*==*)
  n := 5 + Random(6);
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
    b[i] := i;
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[b[i]]>a[b[i+1]] then
      begin
        j := b[i];
        b[i] := b[i+1];
        b[i+1] := j;
      end;
  end;
  for i := 1 to n do
    resultN('',b[i]-1,center(i,n,3,4)-1,3,3);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr45Bn16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('���� �������~{A} �~{B} ����������� �������~{N}. �������� ������� ��\ ����������', 0, 2);
  TaskText('�\ ������� ������� �������� ���������������� �������~{A},', 0, 3);
  TaskText(' �\ �����\ \= �������� ���������������� �������~{B}.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    a1[i] := 19.98*Random - 9.99;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),4,5);
  resultComment('A:',center(1,n+1,5,2),3);
  resultComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    resultR('',a1[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),4,5);
  SetNumberOfTests(5);
Pause;
end;




procedure SArr45Bn17(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ������������ ����� ������~{B} ����\ �� �������,', 0, 2);
  TaskText('�������� �������� ������������ ��������� �������:', 0, 3);
  TaskText('\[\Jrcrl&{B}_{K}&~=~&2\*{A}_{K},& ���� {A}_{K}~<~5,     ', 0, 4);
  TaskText('     &\,&\,& {A}_{K}/2&  � ��������� ������.\j\]', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := RandomR1(0.1, 9.9); //9.97*Random + 0.01; //2018
    if a[i] < 5 then a1[i] := a[i]*2
    else a1[i] := a[i]/2;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('���� ��� �������~{A} �~{B} ����������� �������~{N}.', 0, 2);
  TaskText('������������ ����� ������~{C} ����\ �� �������, ������ ������� ��������', 0, 3);
  TaskText('����� ������������� ��\ ��������� ��������~{A} �~{B} �\ ���\ �� ��������.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a1[i] := 19.98*Random - 9.99;
    a2[i] := 19.98*Random - 9.99;
    if a1[i]>a2[i] then a[i] := a1[i]
    else a[i] := a2[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),3,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+1,5,2),3);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������~{A} �������~{N}. ���������� �\ ����� �������������', 0, 2);
  TaskText('������~{B} ���\ ������ ����� �� ��������� ������� (�\ ���\ �� �������)', 0, 3);
  TaskText('�\ ������� ������ ����������� �������~{B} �\ ���\ ����������.', 0, 4);
(*
*)
  n := 2 + Random(9);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    if not Odd(b[i]) then inc(k);
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,4),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,4),4,3);
  resultN('������ ������� B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,4),4);
  j := 0;
  for i := 1 to n do
  if not Odd(b[i]) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,4),4,3);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������������� ������~{A} �������~{N} (\l\,15). ���������� �\ ����� �������������', 0, 2);
  TaskText('������~{B} ���\ �������� �\ ������� ��������� (0, 2,~\.)', 0, 3);
  TaskText('�\ ������� ������ ����������� �������~{B} �\ ���\ ����������.', 0, 4);
  TaskText('�������� �������� �� ������������.', 0, 5);
(*
*)
  end
  else
  begin
  TaskText('��� ������������� ������~{A} �������~{N} (\l\,15). ���������� �\ ����� �������������', 0, 2);
  TaskText('������~{B} ���\ �������� �\ ���������, �������� ���� (0, 3, 6,~\.),', 0, 3);
  TaskText('�\ ������� ������ ����������� �������~{B} �\ ���\ ����������.', 0, 4);
  TaskText('�������� �������� �� ������������.', 0, 5);
(*
*)
  end;
(*==*)
  n := 2 + Random(14);
  case curtest of //2012
  2: n := (Random(7)+1)*2;
  4: n := (Random(7)+1)*2+1;
  end;
  if v1 = 1 then k := (n+1) div 2
  else k := (n-1) div 3 + 1;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,1),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,1),4,3);
  resultN('������ ������� B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,3),4);
  j := 0;
  for i := 1 to n do
  case v1 of
  1:
  if Odd(i) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  2:
  if (i-1) mod 3 = 0 then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn21(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������~{A} �������~{N}. ���������� �\ �����', 0, 1);
  TaskText('������������� ������~{B} ����\ �� ������� ������� ���\ ��������', 0, 2);
  TaskText('��������� ������� �\ ��������� ���������, �\ �����\ \= �\ �������:', 0, 3);
  TaskText('\[{A}_{1},\q {A}_{3},\q {A}_{5},\q \.,\q {A}_{0},\q {A}_{2},\q {A}_{4},\q \.~.\]', 0, 4);
  TaskText('�������� �������� �� ������������.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  case curtest of //2012
  3: n := (Random(5)+1)*2;
  4: n := (Random(4)+1)*2+1;
  end;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,3),4);
  for i := 1 to n do
    dataN('',b[i],center(i+1,n+1,3,3),4,3);
  resultComment('B:',center(1,n+1,3,3),3);
  for i := 1 to n div 2 do
    resultN('',b[2*i],center(i+1,n+1,3,3),3,3);
  for i := 1 to (n+1) div 2 do
    resultN('',b[2*i-1],center(n div 2 +i+1,n+1,3,3),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('��� ������~{A} �������~{N}.', 0, 2);
  TaskText('������������ ����� ������~{B} ����\ �� ������� ��\ ���������� �������:', 0, 3);
  TaskText('�������~{B}_{K} ����� ����� ��������� �������~{A} �\ ��������� ��~0 ��~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('��� ������~{A} �������~{N}.', 0, 2);
  TaskText('������������ ����� ������~{B} ����\ �� ������� ��\ ���������� �������:', 0, 3);
  TaskText('�������~{B}_{K} ����� �������� ��������������� ��������� �������~{A}', 0, 4);
  TaskText('�\ ��������� ��~0 ��~{K}.', 0, 5);
(*
*)
  end;
(*==*)
  n := 2 + Random(9);
  if v1 = 1 then
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i-1]+a[i];
    end;
  end
  else
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((i-1)*a1[i-1]+a[i])/i;
    end;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}.', 0, 2);
  TaskText('������������ ����� ������~{B} ����\ �� ������� ��\ ���������� �������:', 0, 3);
  TaskText('�������~{B}_{K} ����� ����� ��������� �������~{A} �\ ��������� ��~{K} ��~{N}\-1.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
    a[N] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[N] := a[N];
    for i:=N-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i+1]+a[i];
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}.', 0, 2);
  TaskText('������������ ����� ������~{B} ����\ �� ������� ��\ ���������� �������:', 0, 3);
  TaskText('�������~{B}_{K} ����� �������� ��������������� ��������� �������~{A}', 0, 4);
  TaskText('�\ ��������� ��~{K} ��~{N}\-1.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
    a[n] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[n] := a[n];
    for i := n-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((n-i)*a1[i+1]+a[i])/(n-i+1);
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Bn25(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������~{A} �������~{N}. ������������ ���\ ����� �������~{B} �~{C}:', 0, 1);
  TaskText('�\ ������~{B} �������� ���\ ������������� �������� �������~{A},', 0, 2);
  TaskText('�\ ������~{C}\ \= ���\ ������������� (�������� �������� �������', 0, 3);
  TaskText('���������� ���������). ������� ������� ������ �\ ����������', 0, 4);
  TaskText('�������~{B}, �\ �����\ \= ������ �\ ���������� �������~{C}.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  n1 := 0;
  n2 := 0;
  for i:=1 to n do
  begin
    a[i] := 19.98*Random-9.99;
    if a[i]>0 then
    begin
      inc(n1);
      a1[n1] := a[i];
    end
    else
    if a[i] < 0 then
    begin
      inc(n2);
      a2[n2] := a[i];
    end;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),4,5);
  if n1 > n2 then k := n1
  else k := n2;
  resultN('������ ������� B: ',n1,0,2,2);
  if n1 > 0 then
    resultComment('B:',center(1,k+1,5,2),3);
  for i := 1 to n1 do
    resultR('',a1[i],center(i+1,k+1,5,2),3,5);
  resultN('������ ������� C: ',n2,0,4,2);
  if n2 > 0 then
    resultComment('C:',center(1,k+1,5,2),5);
  for i := 1 to n2 do
    resultR('',a2[i],center(i+1,k+1,5,2),5,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn26(Name, Key: string);
var
  v1, v2, v3: Byte;
  k1, k2: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('���� ��� �������~{A} �~{B} �������~5, �������� �������', 0, 2);
  TaskText('����������� ��\ �����������. ���������� ���\ ������� ���, �����', 0, 3);
  TaskText('�������������� ������~{C} (�������~10) ������� ������������� ��\ �����������.', 0, 4);
(*
����������� ���\ ������� ������� ��������������� ����������,
\<�����������\> ��\ ������ ��\ ���������, ��� ��\ ����������
�\ �������������� ������. �\ ������ ������ ������� �\ ��������������
������ ����� ���������� ���� ��\ ���������, ��\ ������� ���������
��������������� ����������. ������ �������� ��������� �\ ��������,
����� ������������� �������� ������ ��\ ��������. ��� ��\ �������
������ ������������ ����� \I�������\i, ������� �\ ����� �������
������� ���\ ���� �������, �������� ������� (�������) ���� ����������.
*)
  n := 5;
  for i := 1 to n do
  begin
    a1[i] := 19.98*Random-9.99;
    a2[i] := 19.98*Random-9.99;
  end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a1[i]>a1[i+1] then
      begin
        a0 := a1[i];
        a1[i] := a1[i+1];
        a1[i+1] := a0;
      end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a2[i]>a2[i+1] then
      begin
        a0 := a2[i];
        a2[i] := a2[i+1];
        a2[i+1] := a0;
      end;
  a1[n+1] := 1000;
  a2[n+1] := 1000;
  k1 := 1;
  k2 := 1;
  k := 0;
  for i := 1 to n+n do
    if a1[k1]<a2[k2] then
    begin
      inc(k);
      a[k] := a1[k1];
      inc(k1);
    end
    else
    begin
      inc(k);
      a[k] := a2[k2];
      inc(k2);
    end;
  dataComment('A:',center(1,n+1,5,2),2);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),2,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+n+1,5,2),3);
  for i := 1 to n+n do
    resultR('',a[i],center(i+1,n+n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn27(Name, Key: string);
function maxInd(n1,n2,n3: integer): integer;
begin
if (n1>n2)and(n1>n3) then maxInd := 1
else
  if n2>n3 then maxInd := 2
  else maxInd := 3;
end;
var
  v1, v2, v3: Byte;
  n1,n2,n3,k1,k2,k3: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('���� ��� ������������� �������~{A}, {B} �~{C} �������~{N}_A, {N}_B, {N}_C ��������������,', 0, 2);
  TaskText('�������� ������� ����������� ��\ ��������.', 0, 3);
  TaskText('���������� ���\ ������� ���, ����� �������������� ������������� ������~{D}', 0, 4);
  TaskText('(�������~{N}_A\;+\;{N}_B\;+\;{N}_C) ������� ������������� ��\ ��������.', 0, 5);
(*
+
*)
(*==*)
  repeat
  n1 := 3 + Random(8);
  n2 := 3 + Random(8);
  n3 := 3 + Random(8);
  n := n1 + n2 + n3;
  until n <=18;
  for i := 1 to n1 do
    b1[i] := Random(199)-99;
  for i := 1 to n2 do
    b2[i] := Random(199)-99;
  for i := 1 to n3 do
    b3[i] := Random(199)-99;
  for k := 1 to n1-1 do
    for i := 1 to n1-k do
      if b1[i]<b1[i+1] then
      begin
        j := b1[i];
        b1[i] := b1[i+1];
        b1[i+1] := j;
      end;
  for k := 1 to n2-1 do
    for i := 1 to n2-k do
      if b2[i]<b2[i+1] then
      begin
        j := b2[i];
        b2[i] := b2[i+1];
        b2[i+1] := j;
      end;
  for k := 1 to n3-1 do
    for i := 1 to n3-k do
      if b3[i]<b3[i+1] then
      begin
        j := b3[i];
        b3[i] := b3[i+1];
        b3[i+1] := j;
      end;
  b1[n1+1] := -1000;
  b2[n2+1] := -1000;
  b3[n3+1] := -1000;
  k1 := 1;
  k2 := 1;
  k3 := 1;
  k := 0;
  for i := 1 to n1+n2+n3 do
    case MaxInd(b1[k1],b2[k2],b3[k3]) of
    1:
      begin
        inc(k);
        b[k] := b1[k1];
        inc(k1);
      end;
    2:
      begin
        inc(k);
        b[k] := b2[k2];
        inc(k2);
      end;
    3:
      begin
        inc(k);
        b[k] := b3[k3];
        inc(k3);
      end;
     end;
  dataN('N_A = ',n1,5,2,1);
  dataComment('A:',15,2);
  for i := 1 to n1 do
    dataN('',b1[i],15+i*4,2,3);
  dataN('N_B = ',n2,5,3,1);
  dataComment('B:',15,3);
  for i := 1 to n2 do
    dataN('',b2[i],15+i*4,3,3);
  dataN('N_C = ',n3,5,4,1);
  dataComment('C:',15,4);
  for i := 1 to n3 do
    dataN('',b3[i],15+i*4,4,3);
  resultComment('D:',center(1,n+1,3,1),3);
  for i := 1 to n do
    resultN('',b[i],center(i+1,n+1,3,1),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn28(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Bn29(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('��� ������������� ������~{A} �������~{N}. ������� \I������\i ������ ������ ������', 0, 1);
  TaskText('���������� ���������, �\ \I������ �����\i\ \= ���������� ���� ��������� (����� �����', 0, 2);
  TaskText('����� ���� �����~1). ������������ ��� ����� ������������� �������~{B} �~{C}', 0, 3);
  TaskText('����������� �������, ������� �\ ������~{B} ����� ���� ����� ��������� �������,', 0, 4);
  TaskText('�\ �\ ������~{C}\ \= �������� ���������, ���������� ���\ �����.', 0, 5);
(*
������� ����� ������� ���������� �\ �.\,10.1.
*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
dataN('N = ',n,0,2,1);
dataComment('A:',center(1,n+1,1,6),4);
for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,2,5),4,2);
resultComment('B:',center(1,m+1,1,6),2);
for i := 1 to m do
  resultN('',b1[i],center(i+1,m+1,2,5),2,2);
resultComment('C:',center(1,m+1,1,6),4);
for i := 1 to m do
  resultN('',b2[i],center(i+1,m+1,2,5),4,2);
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Bn30(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
s := '';
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('�������� ����� ������ ���\ ������ ������� � ������� ���������',0,3);
taskText('(����������� ����� ���� �\ ������� \1).',0,4);
(*
*)
end;
2:
begin
s := '';
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('�������� ����� ������ ���\ ����� ������� � ������� ���������',0,3);
taskText('(����������� ����� ���� �\ ������� \2).',0,4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
if v1=1 then
  begin
    m := 1;
    b1[m] := 0;
  end;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := 0;
        m := m+2;
      end;
Inc(m);
b1[m] := b[n];
if v1=2 then
    begin
      Inc(m);
      b1[m] := 0;
    end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn31(Name, Key: string);
label 2;
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������������� ������ �������~{N}.',0,2);
taskText('������������� ������, �������� ������ ���\ ����� ��\ ���� �������',0,3);
taskText('(����������� ����� ���� �\ ������� \3).',0,4);
(*
*)
end;
2:
begin
taskText('��� ������������� ������ �������~{N},',0,2);
taskText('���������� ��\ ������� ���� ���� �����, ����� ������� ������~1.',0,3);
taskText('������������� ������, �������� ������ ���\ ����� ��\ ���� �������',0,4);
taskText('(����������� ����� ���� �\ ������� \4).',0,5);
(*
*)
end;
end;
(*==*)
2:
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
    if v1=1 then
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := b[i-1];
        m := m+2;
      end;
if v1=1 then
    begin
      b1[m+1] := b[n];
      b1[m+2] := b[n];
      m := m+2;
    end;
if m = 0 then goto 2;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn32(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{K} (\g\,0) �\ ������������� ������ �������~{N}.', 0, 2);
  TaskText('������������� ������, ������ ����� ���\ ����� �\ �������~{K}', 0, 3);
  TaskText('(����������� ����� ���� �\ ������� \5, ����� ���������� ��~0).',0,4);
  TaskText('���� ����� ����� �\ ������� ������~{K}\,+\,1, ��\ ������� ������ ���\ ���������.', 0, 5);
(*
*)
(*==*)
  k := 1 + Random(4);
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
   b1[k] := 2*b1[k];
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
if j <= 10 then l := 5
else l := 2;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,l),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn33(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l,f: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('���� ����� �����~{K} (\g\,1) �\ ������������� ������ �������~{N}.', 0, 2);
  TaskText('������� ��\ ������� ����� �\ �������~{K}', 0, 3);
  TaskText('(����������� ����� ���� �\ ������� \6, ����� ���������� ��~0).', 0, 4);
  TaskText('���� ����� ����� �\ ������� ������~{K}\,+\,1, ��\ ������� ������ ���\ ���������.', 0, 5);
(*
*)
(*==*)
  k := 2 + Random(4);
  f := Random(5);
repeat
for i := 1 to 20 do b1[i] := 0;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
until b1[k]=f;
if k <=m then
   b1[k] := 0;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn34(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('���� ����� �����~{K} (\g\,1) �\ ������������� ������ �������~{N}.',0,2);
taskText('�������� ������� ��������� ����� ������� �\ ���\ ����� �\ �������~{K}',0,3);
TaskText('(����������� ����� ���� �\ ������� \7, ����� ���������� ��~0).', 0, 4);
taskText('���� ����� ����� �\ ������� ������~{K}\,+\,1, ��\ ������� ������ ���\ ���������.',0,5);
(*
*)
end;
2:
begin
taskText('���� ����� �����~{K} (\g\,0) �\ ������������� ������ �������~{N}.',0,2);
taskText('�������� ������� ��������� ����� ������� �\ ���\ ����� �\ �������~{K}',0,3);
TaskText('(����������� ����� ���� �\ ������� \8, ����� ���������� ��~0).', 0, 4);
taskText('���� ����� ����� �\ ������� ������~{K}\,+\,1, ��\ ������� ������ ���\ ���������.',0,5);
(*
*)
end;
end;
(*==*)
case v1 of
1: k := 2 + Random(4);
2: k := 1 + Random(4);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
case v1 of
1: begin
     j := b1[1];
     b1[1] := b1[k];
     b1[k] := j;
     j := b2[1];
     b2[1] := b2[k];
     b2[k] := j;
   end;
2: begin
     j := b1[m];
     b1[m] := b1[k];
     b1[k] := j;
     j := b2[m];
     b2[m] := b2[k];
     b2[k] := j;
   end;
end;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to n do
  resultN('',b[i],center(i,n,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn35(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(7, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('���� ����� �����~{L} (>\,1) �\ ������������� ������ �������~{N}.',0,2);
taskText('�������� ������ ����� �������, ����� ������� ������~{L}, ��\ ���� �������',0,3);
TaskText('�\ ������� ��������� (����������� ����� ���� �\ ������� \9).', 0, 4);
(*
*)
end;
2:
begin
taskText('���� ����� �����~{L} (>\,0) �\ ������������� ������ �������~{N}.',0,2);
taskText('�������� ������ ����� �������, ����� ������� �����~{L}, ��\ ���� �������',0,3);
TaskText('�\ ������� ��������� (����������� ����� ���� �\ ������� \10).', 0, 4);
(*
*)
end;
3:
begin
taskText('���� ����� �����~{L} (>\,0) �\ ������������� ������ �������~{N}.',0,2);
taskText('�������� ������ ����� �������, ����� ������� ������~{L}, ��\ ���� �������',0,3);
TaskText('�\ ������� ��������� (����������� ����� ���� �\ ������� \11).', 0, 4);
(*
*)
end;
end;
(*==*)
case v1 of
2: k := 1 + Random(4);
3: k := 1 + Random(3);
1: k := 2 + Random(3);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
j := 0;
for i := 1 to m do
  case v1 of
  1: if b1[i]>=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  2: if b1[i]<>k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  3: if b1[i]<=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  end;
dataN('L = ',k,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
for i := 1 to j do
  resultN('',b3[i],center(i,j,2,5),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Bn36(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('��� ������������� ������ �������~{N}. ������������� ������,',0,2);
taskText('�������� ���\ ������ ����� ���������� ����� ��\ ���� �������',0,3);
TaskText('(����������� ����� ���� �\ ������� \12).', 0, 4);
(*
*)
end;
2:
begin
taskText('��� ������������� ������ �������~{N}. ������������� ������,',0,2);
taskText('�������� ���\ ��������� ����� ���������� ����� ��\ ���� �������',0,3);
TaskText('(����������� ����� ���� �\ ������� \13).', 0, 4);
(*
*)
end;
3:
begin
taskText('��� ������������� ������ �������~{N}. ������������� ������,',0,2);
taskText('�������� ��� ���\ ����� ���������� ����� ��\ ���� �������',0,3);
TaskText('(����������� ����� ���� �\ ������� \14).', 0, 4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(5);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
bmax := -1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      if l >= bmax then
        begin
          bmax := l;
          j := i-1;
        end;
      l := 1;
    end;
if l >= bmax then
 begin
  bmax := l;
  j:=n;
 end;
m := 0;
l := 1;
case v1 of
3:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if l = bmax then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if l = bmax then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
1:
begin
j := 0;
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=0) then
        begin
          j := 1;
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=0) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
2:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];
  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=i-1) then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=n) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Bn37(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Bn38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('���� ���������~{A} ��\ {N}~����� ��\ ��������� �\ �����~{B}',0,1);
taskText('(����� ������ ������ ������������~{x},\;{y}).',0,2);
taskText('����� ����� ��\ ���������~{A}, �������� ������� �\ �����~{B}.',0,3);
taskText('\I����������\i~{R} ����� ������� �\ ������������ ({x}_1,\;{y}_1) �~({x}_2,\;{y}_2)',0,4);
taskText('����������� ��\ �������:\[      {R}~=~\R({x}_2\,\-\,{x}_1)^2\;+\;({y}_2\,\-\,{y}_1)^2\r.\]',0,5);
(*
��� ���������� ������� � �������� ��� ������� ����� ��������
���\ ���������� ���������� ������, ��������� \I��������\i ����������.
*)
(*==*)
n := 4 + Random(5);
for i:=0 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[1]-x[0])+sqr(y[1]-y[0]);
amax := amin;
nmin := 1;
nmax := 1;
for i := 2 to n do
  begin
    r0 := sqr(x[i]-x[0])+sqr(y[i]-y[0]);
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end
    else
      if amax < r0 then
        begin
          amax := r0;
          nmax := i;
        end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
dataR2(' B:  ',x[0],y[0],0,5,6);
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(10, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('���� ���������~{A} ��\ {N}~����� (����� ������ ������ ������������ {x},\;{y}).',0,2);
taskText('����� ���� ����� ����� ���������, ������� ��\ ������ ��������,',0,3);
taskText('����� �����, �������� ��������� ��\ ������ ���������.',0,4);
taskText('���� ����� �����\ ���, ��\ ������� ����� �\ �������� ������������.',0,5);
(*
*)
end;
2:
begin
taskText('���� ���������~{A} ��\ {N}~����� (����� ������ ������ ������������ {x},\;{y}).',0,2);
taskText('����� ���� ����� ����� ���������, ������� �\ ������ ���\ ������� ��������,',0,3);
taskText('����� �����, �������� ������� �\ ������ ���������.',0,4);
taskText('���� ����� �����\ ���, ��\ ������� ����� �\ �������� ������������.',0,5);
(*
*)
end;
end;
(*==*)
n := 3 + Random(6);
x[0] := 0; y[0] := 0;
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
case v1 of
2: begin amin := 1000; k := 1; end;
1: begin amin := 0; k := -1; end;
end;
nmin := 0;
for i := 1 to n do
  begin
    r0 := sqr(x[i])+sqr(y[i]);
    case v1 of
    2 : if (x[i]*y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    1 : if (x[i]<0)and(y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Bn40(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
taskText('���� ���������~{A} ��\ {N}~����� (����� ������ ������ ������������~{x},\;{y}).',0,2);
taskText('����� ���� ����� ����� ��������� �\ ������������ ����������� ����� ����',0,3);
taskText('�\ ���� ���\ ���������� (����� ��������� �\ ���\ �� �������,',0,4);
taskText('�\ ������� ���\ ����������� ���\ ������� ���������~{A}).',0,5);
(*
*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[2]-x[1])+sqr(y[2]-y[1]);
bmin := 1;
nmin := 2;
for i := 1 to n-1 do
  for j := i+1 to n do
  begin
    r0 := sqr(x[i]-x[j])+sqr(y[i]-y[j]);
    if amin < r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('������ �����:',x[bmin],y[bmin],xLeft,2,6);
resultR2('������ �����:',x[nmin],y[nmin],xRight,2,6);
resultR('����������: ',sqrt(amin),0,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn41(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('���� ���������~{A} �~{B}, ��������� �������������� ��~{N}_1 �~{N}_2 �����', 0, 2);
  TaskText('(����� ������ ������ ������������~{x},\;{y}). ����� ����������� ����������', 0, 3);
  TaskText('����� ������� ���� �������� �\ ���� �����, ������������� ��\ ���� ����������', 0, 4);
  TaskText('(������� ��������� ����� ��\ ���������~{A}, ����� ����� ��\ ���������~{B}).', 0, 5);
(*
*)
(*==*)
n := 4 + Random(5);
n1 := 4 + Random(5);
{//n := 8;}
{//n1 := 8;}
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i:=1 to n1 do
  begin
  x1[i] := 19.98*Random-9.99;
  y1[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  for j := 1 to n1 do
  begin
    r0 := sqrt(sqr(x[i]-x1[j])+sqr(y[i]-y1[j]));
    if amin > r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N_1 = ',n,3,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i,n0,14,3)+3,2,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i-n0,n0,14,3)+3,3,6); //!
dataN('N_2 = ',n1,3,4,1);
n0 := (n1 +1) div 2;
j := n1 mod 2;
for i := 1 to n0 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i,n0,14,3)+3,4,6); //!
for i := n0+1 to n1 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i-n0,n0,14,3)+3,5,6); //!
resultR('����������:',amin,0,2,5);
resultR2('����� �� ��������� A:',x[bmin],y[bmin],xLeft,4,6);
resultR2('����� �� ��������� B:',x1[nmin],y1[nmin],xRight,4,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn42(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
taskText('���� ���������~{A} ��\ {N}~����� ({N}~>~2, ����� ������ ������ ������������~{x},\;{y}).',0,2);
taskText('����� ����� ����� ��\ ������� ���������, ����� ���������� ��\ �������',0,3);
taskText('��\ ��������� ���\ ����� ����������, �\ ���� ���\ �����.',0,4);
(*
*)
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  begin
  r0 := 0;
  for j := 1 to n do
    r0 := r0 + sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR2('���������� �����:',x[nmin],y[nmin],25,2,6);
resultR('����� ����������: ',amin,25,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Bn43(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  n0 := -1;
amin := -10000;
  TaskText('���� ���������~{A} ��\ {N}~����� ({N}~>~2, ����� ������ ������ ������������~{x},\;{y}).', 0, 2);
  TaskText('����� ���������� �������� ������������, ������� �������� �����������', 0, 3);
  TaskText('��������� ������ ���������~{A}, �\ ���� ���\ ����� (����� ���������', 0, 4);
  TaskText('�\ ���\ �� �������, �\ ������� ��� ����������� ���\ ������� ���������~{A}).', 0, 5);
(*
*)
  end;
  2: begin
  n0 := 1;
amin := 10000;
  TaskText('���� ���������~{A} ��\ {N}~����� ({N}~>~2, ����� ������ ������ ������������~{x},\;{y}).', 0, 2);
  TaskText('����� ���������� �������� ������������, ������� �������� �����������', 0, 3);
  TaskText('��������� ������ ���������~{A}, �\ ���� ���\ ����� (����� ���������', 0, 4);
  TaskText('�\ ���\ �� �������, �\ ������� ��� ����������� ���\ ������� ���������~{A}).', 0, 5);
(*
*)
  end;
  end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i := 1 to n-2 do
  for j := i + 1 to n-1 do
    for k := j + 1 to n do
      begin
        r0 := sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j])) +
              sqrt(sqr(x[i]-x[k])+sqr(y[i]-y[k])) +
              sqrt(sqr(x[k]-x[j])+sqr(y[k]-y[j]));
       if n0*amin > n0*r0 then
         begin
           amin := r0;
           b[1] := i;
           b[2] := j;
           b[3] := k;
        end;
      end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6); //!
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6); //!
resultR('�������� ������������:',amin,0,2,6);
resultComment('���������� ������ ������������:',0,3);
for i := 1 to 3 do
  resultR2(' '+chr(47+i)+': ',x[b[i]],y[b[i]],center(i,3,15,4),4,6); //!
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn44(Name, Key: string);
var
  v1, v2, v3: Byte;
  bln: Boolean;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  TaskText('���� ���������~{A} ��\ {N}~����� �\ �������������� ������������~{x},\;{y}.', 0, 1);
  TaskText('\I�������\i ��\ ������������ ��������� ��������� ��������� �������:', 0, 2);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q ���� ���� {x}_1~<~{x}_2, ���� {x}_1~=~{x}_2 � {y}_1~<~{y}_2.\]', 0, 3);
  TaskText('����������� ����� ������� ��������� ��\ �����������', 0, 4);
  TaskText('�\ ������������ �\ ��������� ��������.', 0, 5);
(*
*)
end;
2:
begin
  TaskText('���� ���������~{A} ��\ {N}~����� �\ �������������� ������������~{x},\;{y}.', 0, 1);
  TaskText('\I�������\i ��\ ������������ ��������� ��������� ��������� �������:', 0, 2);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q ���� ���� {x}_1\,+\,{y}_1~<~{x}_2\,+\,{y}_2, '+
         '���� {x}_1\,+\,{y}_1~=~{x}_2\,+\,{y}_2 �\ {x}_1~<~{x}_2.\]', 0, 3);
  TaskText('����������� ����� ������� ��������� ��\ ��������', 0, 4);
  TaskText('�\ ������������ �\ ��������� ��������.', 0, 5);
(*
*)
end;
end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x2[i] := integer(Random(19))-9;
  y2[i] := integer(Random(19))-9;
  end;
for i := 1 to 3 do
  case v1 of
  1:
  x2[Random(n)+1] := x2[Random(n)+1];
  2:
  y2[Random(n)+1] := y2[Random(n)+1];
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i,n0,9,7),3,3); //!
for i := n0+1 to n do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i-n0,n0,9,7),4,3); //!
for k := 1 to n-1 do
  for i := 1 to n-k do
   begin
     case v1 of
     1: bln := (x2[i]>x2[i+1])or((x2[i]=x2[i+1])and(y2[i]>y2[i+1]));
     2: bln := (x2[i]+y2[i]<x2[i+1]+y2[i+1])or((x2[i]+y2[i]=x2[i+1]+y2[i+1])and(x2[i]<x2[i+1]));
     end;
     if bln then
        begin
          n1 := x2[i];
          x2[i] := x2[i+1];
          x2[i+1] := n1;
          n1 := y2[i];
          y2[i] := y2[i+1];
          y2[i+1] := n1;
        end;
   end;
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i,n0,9,7),3,3); //!
for i := n0+1 to n do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i-n0,n0,9,7),4,3); //!
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Bn45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




begin
Topic := '���������� �������';
Topic4 := '���������� �������: ��������������';
Topic5 := '������ � ����������� ����������� ���������';
Topic6 := '���������� �������: ����������';
Topic7 := '���������� �������: ����� ����� �����';
Topic8 := '���������� �������: ��������� ����� �� ���������';
{Author := '�.~�.~�������, 2002';}
end.

