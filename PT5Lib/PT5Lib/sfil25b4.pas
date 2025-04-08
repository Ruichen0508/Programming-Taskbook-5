{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SFil25B4;

{$MODE Delphi}

interface

procedure SFil25Bn1(Name, Key: string);
procedure SFil25Bn2(Name, Key: string);
procedure SFil25Bn3(Name, Key: string);
procedure SFil25Bn4(Name, Key: string);
procedure SFil25Bn5(Name, Key: string);
procedure SFil25Bn6(Name, Key: string);
procedure SFil25Bn7(Name, Key: string);
procedure SFil25Bn8(Name, Key: string);
procedure SFil25Bn9(Name, Key: string);
procedure SFil25Bn10(Name, Key: string);
procedure SFil25Bn11(Name, Key: string);
procedure SFil25Bn12(Name, Key: string);
procedure SFil25Bn13(Name, Key: string);
procedure SFil25Bn14(Name, Key: string);
procedure SFil25Bn15(Name, Key: string);
procedure SFil25Bn16(Name, Key: string);
procedure SFil25Bn17(Name, Key: string);
procedure SFil25Bn18(Name, Key: string);
procedure SFil25Bn19(Name, Key: string);
procedure SFil25Bn20(Name, Key: string);
procedure SFil25Bn21(Name, Key: string);
procedure SFil25Bn22(Name, Key: string);
procedure SFil25Bn23(Name, Key: string);
procedure SFil25Bn24(Name, Key: string);
procedure SFil25Bn25(Name, Key: string);

implementation

uses PT5TaskMaker;

var code, code1, code2: byte;
    s,s0,s1,s2,s3 : shortstring;
    Fi1,Fi2 : file of integer;
    Fr,Fr1,Fr2,Fr3 : file of real;
    Fc,Fc1,Fc3 : file of char;
    Fs1,Fs2 : file of shortstring;
    x,x1,x2,x3 : real;
    n,n1,n2,n3 : integer;
    c,c1 : char;
    bln : Boolean;
    iar1,iar2: array [1..50] of integer;
    Topic,Topic3,Topic4,Author : string;

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

procedure genDate(var date:shortstring; var day,mon,year : integer);
var s : string;
begin
year := Random(10)+1995;
mon := Random(12)+1;
case mon of
2 : day := Random(28)+1;
4,6,9,11: day := Random(30)+1;
else day := Random(31)+1;
end;
Str(day,s);
if length(s)=1 then s := '0'+s;
date := s+'/';
Str(mon,s);
if length(s)=1 then s := '0'+s;
date := date+ s+'/';
Str(year,s);
date := date+ s;
end;


procedure Add31_32(m,n,dop,i1,j1:integer);
var i,j:integer;
begin
S := FileName(8) + '.tst';
Assign(Fr,S);
rewrite(Fr);
if dop=1 then
  begin
    x := n;
    write(Fr,x);
  end;
x1 := 0;
for i := 1 to m do
  for j := 1 to n do
  begin
    x := Random * 9.9;
    if (i = i1)and(j=j1) then x1 := x;
    write(Fr,x);
  end;
Close(Fr);
setFileItemsInLine(n);
dataFileR(S,4,6);
dataN('I = ',i1,xLeft,2,1);
dataN('J = ',j1,xRight,2,1);
dataS('��� �����: ',S,xLeft,3);
dataComment('���������� �����: ',xRight,3);
resultR('',x1,0,3,5);
end;

procedure Add33_34(m,n,dop:integer);
var i,j:integer;
begin
S := '1' + FileName(7) + '.tst';
S1 :='2' + FileName(7) + '.tst';
Assign(Fr,S);
rewrite(Fr);
Assign(Fr1,S1);
rewrite(Fr1);
if dop = 1 then
  begin
    x := n;
    write(Fr,x);
    x := m;
    write(Fr1,x);
  end;
for i := 1 to m do
  for j := 1 to n do
  begin
    x := Random * 9.9;
    write(Fr,x);
  end;
for i := 0 to n-1 do
  for j := 0 to m-1 do
    begin
      seek(Fr,j*n+i+dop);
      read(Fr,x);
      write(Fr1,x);
    end;
Close(Fr);
Close(Fr1);
setFileItemsInLine(n);
dataFileR(S,4,6);
setFileItemsInLine(m);
resultFileR(S1,3,6);
dataS('��� ��������� �����: ',S,xLeft,2);
dataS('��� ����� �����������: ',S1,xRight,2);
dataComment('���������� ��������� �����:',0,3);
resultComment('���������� ����� �����������:',0,2);
end;


procedure Add35_36(m,n,m1,n1,dop:integer);
var k,i,j:integer;
begin
S1 := 'a' + FileName(7) + '.tst';
S2 := 'b' + FileName(7) + '.tst';
S3 := 'c' + FileName(7) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
Assign(Fr2,S2);
rewrite(Fr2);
Assign(Fr3,S3);
rewrite(Fr3);
if dop = 1 then
  begin
    x := n;
    write(Fr1,x);
    x := n1;
    write(Fr2,x);
  end;
for i := 1 to m do
  for j := 1 to n do
  begin
    x := Random * 9.9;
    write(Fr1,x);
  end;
for i := 1 to m1 do
  for j := 1 to n1 do
  begin
    x := Random * 9.9;
    write(Fr2,x);
  end;
if m1=n then
begin
if dop = 1 then
  begin
    x := n1;
    write(Fr3,x);
  end;
for i := 0 to m-1 do
  for j := 0 to n1-1 do
    begin
      x3 := 0;
      seek(Fr1,i*n+dop);
      for k := 0 to n-1 do
        begin
          read(Fr1,x1);
          seek(Fr2,n1*k+j+dop);
          read(Fr2,x2);
          x3 := x3 + x1*x2;
        end;
      write(Fr3,x3);
    end;
end;
Close(Fr1);             
Close(Fr2);
Close(Fr3);
setFileItemsInLine(n);
dataFileR(S1,4,6);
setFileItemsInLine(n1);
dataFileR(S2,5,6);
setFileItemsInLine(n1);
resultFileR(S3,3,8);
dataS('S_A = ',S1,Center(1,3,18,4),2);
dataS('S_B = ',S2,Center(2,3,18,4),2);
dataS('S_C = ',S3,Center(3,3,18,4),2);
dataComment('���������� �������� ������:',0,3);
resultComment('���������� ����� �����������:',0,2);
end;



procedure SFil25Bn1(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,63{level});(*DEMO*)
getVariant(3,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���������� ����, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ��� ���\ ��������, ������������� �����',0,3);
taskText('������� ������� �������, ������� �\ ����\ ������.',0,4);
(*
*)
end;
1: begin
taskText('��� ���������� ����, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ��� ���\ ��������, ������������� �����',0,3);
taskText('��������� �������� �������, ������� �\ ����\ ������.',0,4);
(*
*)
end;
end;
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
bln := False;
repeat
Assign(Fc,S1);
rewrite(Fc);
for i := 0 to 45 + Random(20) do
  begin
    if Random(4) = 0 then
      begin
        if not bln then n1 := i;
        n2 := i; c := ' '; bln := True;
      end
    else
      begin
      s2 := FileName(1);
      c := s2[1];
      end;
    write(Fc,c);
  end;
  Close(Fc);
until bln;
Assign(Fc1,S);
rewrite(Fc1);
reset(Fc);
case Code of
0 : n := n1;
1 : n := n2;
end;
case Code of
0:
for i := 0 to n-1 do
  begin
    read(Fc,c);
    write(Fc1,c);
  end;
1:begin
Seek(Fc,n+1);
for i := n+2 to FileSize(Fc) do
  begin
    read(Fc,c);
    write(Fc1,c);
  end;
end;
end;
Close(Fc);
Close(Fc1);

resultFileC(S,3,4);
Rename(Fc,S);
dataFileC(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;

procedure SFil25Bn2(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,63{level});
getVariant(4,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���������� ����, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ��� ���\ ��������, ������������� �����',0,3);
taskText('������ �������� �������, ������� �\ ����\ ������.',0,4);
(*
*)
end;
1: begin
taskText('��� ���������� ����, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ��� ���\ ��������, ������������� �����',0,3);
taskText('���������� ������� �������, ������� �\ ����\ ������.',0,4);
(*
*)
end;
end;
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
bln := False;
repeat
Assign(Fc,S1);
rewrite(Fc);
for i := 0 to 45 + Random(20) do
  begin
    if Random(4) = 0 then
      begin
        if not bln then n1 := i;
        n2 := i; c := ' '; bln := True;
      end
    else
      begin
      s2 := FileName(1);
      c := s2[1];
      end;
    write(Fc,c);
  end;
  Close(Fc);
until bln;
Assign(Fc1,S);
rewrite(Fc1);
reset(Fc);
case Code of
0 : n := n1;
1 : n := n2;
end;
case Code of
0:begin
Seek(Fc,n+1);
for i := n+2 to FileSize(Fc) do
  begin
    read(Fc,c);
    write(Fc1,c);
  end;
end;
1: 
for i := 0 to n-1 do
  begin
    read(Fc,c);
    write(Fc1,c);
  end;
end;
Close(Fc);
Close(Fc1);

resultFileC(S,3,4);
Rename(Fc,S);
dataFileC(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;
procedure SFil25Bn3(Name, Key: string);
var i,j,j1:integer;
    c0 : array [1..50] of char;
begin
start(Name,Topic3,Author,Key,63{level});
getVariant(5,0,0,0,code,code1,code2);
   j1 := 1;
taskText('��� ���������� ����.',0,2);
taskText('����������� ���\ �������� ��\ ����������� ��\ �����.',0,4);
(*
*)
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
n := 20 + Random(31);
Assign(Fc,S1);
rewrite(Fc);
for i := 1 to n do
  begin
  c0[i] := Chr(33+Random(90));
  write(Fc,c0[i]);
  end;
Close(Fc);
for j := 1 to n-1 do
  for i := 1 to n-j do
    if j1*ord(c0[i])>j1*ord(c0[i+1]) then
      begin
        c := c0[i];
        c0[i] := c0[i+1];
        c0[i+1] := c;
      end;
Assign(Fc1,S);
rewrite(Fc1);
for i := 1 to n do
  write(Fc1,c0[i]);
Close(Fc1);

resultFileC(S,3,4);
Rename(Fc,S);
dataFileC(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;
procedure SFil25Bn4(Name, Key: string);
var k,i,j,jmax:integer;
begin
start(Name,Topic3,Author,Key,63{level});(*DEMO*)
getVariant(6,0,0,0,code,code1,code2);
taskText('���� ����� �����~{K} (>\,0) �\ ��������� ����.',0,1);
taskText('������� ��� ����� �����: ���������, ���������� ������ {K}~��������',0,2);
taskText('������ ������ ��������� �����, �\ ����������, ����������\ \Um{K}-�\um~������',0,3);
taskText('������ ������ (���� ����� ������ ������~{K}, ��\ �\ ��������� ����',0,4);
taskText('������������ ��� ������, �\ �\ ���������� ���� ������������ ������).',0,5);
(*
*)
S1 := '1' + FileName(5) + '.tst';
S2 := '2' + FileName(5) + '.tst';
S3 := '3' + FileName(5) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fs2,S2);
rewrite(Fs2);
Assign(Fc3,S3);
rewrite(Fc3);
n1 := Random(5)+1;
n2 := Random(5)+6;
k := Random(n2-n1)+1;
jmax := 0;
for i := 0 to 10 + Random(20) do
  begin
    j := n1 + Random(n2);
    if jmax < j then jmax := j;
    s0 := FileName(j);
    write(Fs1,s0);
    if j>=k then c1 := s0[k]
            else c1 := ' ';
    write(Fc3,c1);
    s0 := Copy(s0,1,k);
    write(Fs2,s0);
  end;
Close(fs1);
Close(fs2);
Close(fc3);
dataN('K =',k,0,1,2);


dataS('��� ��������� �����: ',S1,3,2);
dataS('��� ��������������� ���������� �����:  ',S2,3,4);
dataS('��� ��������������� ����������� �����: ',S3,3,5);
dataComment('���������� ��������� �����:',xRight,2);
dataFileS(S1,3,jmax+3);



resultComment('���������� ��������������� ���������� �����:',0,2);
resultComment('���������� ��������������� ����������� �����:',0,4);
resultFileS(S2,3,k+3);
resultFileC(S3,5,4);
pause;
end;


procedure SFil25Bn5(Name, Key: string);
var i,j,j1,jmin,jmax:integer;
begin
start(Name,Topic3,Author,Key,63{level});
getVariant(7,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ��������� ����. ������� ����� ��������� ����,',0,2);
taskText('���������� ���\ ������ ��������� �����',0,3);
taskText('���������� ����� (�\ ���\ �� �������).',0,4);
(*
*)
end;
1: begin
taskText('��� ��������� ����. ������� ����� ��������� ����,',0,2);
taskText('���������� ���\ ������ ��������� �����',0,3);
taskText('���������� ����� (�\ �������� �������).',0,4);
(*
*)
end;
end;
(*==*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
n1 := Random(5)+1;
n2 := Random(5)+6;
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fs2,S2);
rewrite(Fs2);
jmin := 100;
jmax := 0;
for i := 0 to 10 + Random(20) do
  begin
    j := n1 + Random(n2);
    s0 := FileName(j);
    if j<jmin then jmin := j;
    if j>jmax then jmax := j;
    write(Fs1,s0);
  end;
Seek(Fs1,0);
j1 := jmin;
if code=1 then
  j1 := jmax;
for i := 1 to FileSize(Fs1) do
  begin
    if Code = 1 then Seek(Fs1,FileSize(Fs1)-i);
    read(Fs1,s0);
    if length(s0)=j1 then write(Fs2,s0);
  end;
Close(Fs1);
Close(Fs2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileS(S1,4,jmax+3);
resultComment('���������� ����� �����������:',0,2);
resultFileS(S2,3,j1+3);
Pause;
end;


procedure SFil25Bn6(Name, Key: string);
var
  i,j:integer;
  v1, v2, v3: Byte;
  s :array[1..30] of string[20];

begin
  Start(Name, Topic3, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('��� ��������� ����. ������� ����� ��������� ����, �\ ������� ������',0,2);
taskText('��\ ��������� ����� �������������\ �� �\ \I������������������\i �������,',0,3);
taskText('�.\,�. ��\ ����������� ����� ��\ ��������, ������� � ������� �������.',0,4);
(*
*)
(*==*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fs2,S2);
n := 10 + Random(20);
for i := 1 to n do
  begin
    j := 2 + Random(9);
    s0 := FileName(j);
    s[i] := s0;
    write(Fs1,s0);
  end;
Close(Fs1);
for i := 1 to n-1 do
  for j := 1 to n-i do
    if s[j]>s[j+1] then
      begin
        s0 := s[j+1]; s[j+1] := s[j]; s[j] := s0;
      end;
rewrite(Fs2);
for i := 1 to n do
  begin
    s0 := s[i];
    write(Fs2,s0);
  end;
Close(Fs2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileS(S1,4,13);
resultComment('���������� ����� �����������:',0,2);
resultFileS(S2,3,13);
Pause;
end;







procedure SFil25Bn7(Name, Key: string);
var i,d,m,y:integer;
begin
start(Name,Topic3,Author,Key,63{level});(*DEMO*)
getVariant(8,0,0,0,code,code1,code2);
taskText('��� ��������� ����, ���������� ���� �\ ������� \<����/�����/���\>,',0,1);
taskText('������ ���\ ���� �\ ����� ��������� ��\ ��� �������, �\ ��� ���\ \= ������',0,2);
taskText('(��������, \<16/04/2001\>). ������� ��� ����� ����� �����, ������ ��\ �������',0,3);
taskText('�������� �������� ����, �\ ������\ \= �������� ������� ���\ ���',0,4);
taskText('��\ ��������� ���������� ����� (�\ ���\ �� �������).',0,5);
(*
*)
S1 := '1'+FileName(7) + '.tst';
S2 := '2'+FileName(7) + '.tst';
S3 := '3'+FileName(7) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fi1,S2);
rewrite(Fi1);
Assign(Fi2,S3);
rewrite(Fi2);
n := 5 + Random(20);
for i := 1 to n do
  begin
    genDate(s,d,m,y);
    write(Fs1,s);
     begin
         iar1[i] := d;
         iar2[i] := m;
     end;
  end;
for i := 1 to n do
begin
   write(Fi1,iar1[i]);
   write(Fi2,iar2[i]);
end;
Close(Fs1);
Close(Fi1);
Close(Fi2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('����� �������������� ������: ',S2,3,4);
dataS('',S3,48,4);
dataComment('���������� ��������� �����:',xRight,2);
dataFileS(S1,3,13);
resultComment('���������� �������������� ������:',0,2);
resultFileN(S2,3,5);
resultFileN(S3,4,5);
pause;
end;




procedure SFil25Bn8(Name, Key: string);
var i,d,m,y:integer;
begin
start(Name,Topic3,Author,Key,63{level});
getVariant(8,0,0,0,code,code1,code2);
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,2);
taskText('�\ ������� \1. ������� ��� ����� ����� �����, ������ ��\ �������',0,3);
taskText('�������� �������� �������, �\ ������\ \= �������� ��� ���\ ���',0,4);
taskText('��\ ��������� ���������� ����� (�\ �������� �������).',0,5);
(*
*)
(*==*)
S1 := '1'+FileName(7) + '.tst';
S2 := '2'+FileName(7) + '.tst';
S3 := '3'+FileName(7) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fi1,S2);
rewrite(Fi1);
Assign(Fi2,S3);
rewrite(Fi2);
n := 5 + Random(20);
for i := 1 to n do
  begin
    genDate(s,d,m,y);
    write(Fs1,s);
     begin
         iar1[n-i+1] := m;
         iar2[n-i+1] := y;
     end;
  end;
for i := 1 to n do
begin
   write(Fi1,iar1[i]);
   write(Fi2,iar2[i]);
end;
Close(Fs1);
Close(Fi1);
Close(Fi2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('����� �������������� ������: ',S2,3,4);
dataS('',S3,48,4);
dataComment('���������� ��������� �����:',xRight,2);
dataFileS(S1,3,13);
resultComment('���������� �������������� ������:',0,2);
resultFileN(S2,3,5);
resultFileN(S3,4,5);
Pause;
end;


procedure SFil25Bn9(Name, Key: string);
var i,d,m,y:integer;
    sar: array [1..30] of string[10];

begin
start(Name,Topic3,Author,Key,63{level});
getVariant(9,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,1);
taskText('�\ ������� \2. ������� ����� ��������� ����, ����������',0,2);
taskText('���\ ������ ���� ��\ ��������� ����� (�\ ���\ �� �������).',0,3);
taskText('���� ���� �\ ��������� �������� ���� �\ ����� �����������,',0,4);
taskText('��\ �������� �������������� ���� ������.',0,5);
(*
*)
   end;
1: begin
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,1);
taskText('�\ ������� \3. ������� ����� ��������� ����, ����������',0,2);
taskText('���\ ������ ���� ��\ ��������� ����� (�\ �������� �������).',0,3);
taskText('���� ���� �\ ��������� �������� ���� �\ ����� �����������,',0,4);
taskText('��\ �������� �������������� ���� ������.',0,5);
(*
*)
   end;
end;
(*==*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fs2,S2);
rewrite(Fs2);
n := 0;
for i := 1 to 5 + Random(20) do
  begin
    genDate(s,d,m,y);
    write(Fs1,s);
    case code of
    0: bln := m in [6..8];
    1: bln := m in [1..2,12];
    end;
    if bln then
    begin
      inc(n);
      sar[n] := s;
    end;
  end;
for i := 1 to n do
begin
  case code of
  0: s := sar[i];
  1: s := sar[n-i+1];
  end;
  write(Fs2,s);
end;
Close(Fs1);
Close(Fs2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileS(S1,4,13);
resultComment('���������� ����� �����������:',0,2);
resultFileS(S2,3,13);
Pause;
end;


procedure SFil25Bn10(Name, Key: string);
var j1,dmin,mmin,ymin,d,m,y:integer;
begin
start(Name,Topic3,Author,Key,63{level});
getVariant(9,2,0,0,code,code1,code2);
dec(Code);
j1 := 0;
dmin := 0;
mmin := 0;
ymin := 0;
case code of
0: begin
   j1 := 1;
   dmin := 40;
   mmin := 20;
   ymin := 3000;
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,2);
taskText('�\ ������� \4. ����� ������, ���������� ����� ������ �������� ����.',0,3);
taskText('���� ���� �\ ��������� �������� ���� �\ ����� �����������,',0,4);
taskText('��\ ������� ������ ������.',0,5);
(*
*)
   end;
1: begin
   j1 := -1;
   dmin := 0;
   mmin := 0;
   ymin := 0;
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,2);
taskText('�\ ������� \5. ����� ������, ���������� ����� ������� ������� ����.',0,3);
taskText('���� ���� �\ ��������� �������� ���� �\ ����� �����������,',0,4);
taskText('��\ ������� ������ ������.',0,5);
(*
*)
   end;
end;
(*==*)
S1 := FileName(8) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
s3 := '01/01/1900';
n := 0;
n1 := Random(4);
case curtest of //
3: n1 := 0;
5: n1 := 1;
end;
n2 := Random(10)+20;
n3 := 0;
while true do
  begin
    genDate(s,d,m,y);
    case code of
    0: bln := m in [3..5];
    1: bln := m in [9..11];
    end;
    if (n1=0) and bln then continue;
    inc(n3);
    if bln then inc(n);
    if (n > 5) or (n1=0) and (n3>n2) then break;
    write(Fs1,s);
    if ((j1*y<j1*ymin) or ((y=ymin)and(j1*m<j1*mmin)) or
        ((y=ymin)and(m=mmin)and(j1*d<j1*dmin))) and bln then
      begin
        s3 := s;
        ymin := y;
        mmin := m;
        dmin := d;
      end;
  end;
Close(Fs1);
dataS('��� �����: ',S1,xLeft,2);
dataComment('���������� �����:',xRight,2);
dataFileS(S1,3,13);
if s3 = '01/01/1900' then s3 := '';
resultS('',S3,0,3);
setNumberOfTests(7);
Pause;
end;


procedure SFil25Bn11(Name, Key: string);
var i,j:integer;
    d,m,y:array[1..30] of integer;
    s :array[1..30] of string[10];
procedure swap(var i1,i2:integer);
var i : integer;
begin
i := i1;
i1 := i2;
i2 := i;
end;
begin
start(Name,Topic3,Author,Key,63{level});
taskText('��� ��������� ����, ���������� ���� �\ �������, ���������',0,2);
taskText('� ������� \6. ������� ����� ��������� ����, �\ ������� ����',0,3);
taskText('��\ ��������� ����� �������������\ �� �\ ������� ��������.',0,4);
(*
*)
(*==*)
S1 := '1'+FileName(7) + '.tst';
S2 := '2'+FileName(7) + '.tst';
Assign(Fs1,S1);
rewrite(Fs1);
Assign(Fs2,S2);
n := 5 + Random(20);
for i := 1 to n do
  begin
    genDate(s0,d[i],m[i],y[i]);
    s[i] := s0;
    write(Fs1,s0);
  end;
Close(Fs1);
for i := 1 to n-1 do
  for j := 1 to n-i do
  begin
    bln := (y[j+1]<y[j]) or ((y[j+1]=y[j])and(m[j+1]<m[j])) or
        ((y[j+1]=y[j])and(m[j+1]=m[j])and(d[j+1]<=d[j]));
    if not bln then
      begin
        swap(y[j+1],y[j]);
        swap(m[j+1],m[j]);
        swap(d[j+1],d[j]);
        s0 := s[j+1]; s[j+1] := s[j]; s[j] := s0;
      end;
  end;
rewrite(Fs2);
for i := 1 to n do
  begin
    s0 := s[i];
    write(Fs2,s0);
  end;
Close(Fs2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileS(S1,4,13);
resultComment('���������� ����� �����������:',0,2);
resultFileS(S2,3,13);
Pause;
end;


procedure SFil25Bn12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SFil25Bn13(Name, Key: string);
var i1,j1:integer;
begin
start(Name,Topic4,Author,Key,63{level});(*DEMO*)
taskText('���� ��� ����� �����~{I}, {J} �\ ���� ������������ �����,',0,1);
taskText('���������� �������� ���������� ������� (��\ �������).',0,2);
taskText('������� ������� �������, ������������� �~\Um{I}-�\um\ ������ �~\Um{J}-�\um\ �������',0,3);
taskText('(������ �\ ������� ����������\ ��~1).',0,4);
taskText('���� ��������� ������� �����������, ��\ �������~0.',0,5);
(*
*)
n := 4 + Random(4);
i1 := Random(7) + 1;
j1 := Random(7) + 1;
Add31_32(n,n,0,i1,j1);
pause;
end;


procedure SFil25Bn14(Name, Key: string);
begin
start(Name,Topic4,Author,Key,63{level});
taskText('��� ���� ������������ �����,',0,2);
taskText('���������� �������� ���������� ������� (��\ �������).',0,3);
taskText('������� ����� ����, ���������� �������� �������,',0,4);
taskText('����������������� �\ ��������.',0,5);
(*
*)
(*==*)
S := '1' + FileName(7) + '.tst';
S1 :='2' + FileName(7) + '.tst';
n := 3 + Random(5);
Add33_34(n,n,0);
Pause;
end;

procedure SFil25Bn15(Name, Key: string);
begin
start(Name,Topic4,Author,Key,63{level});
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_A �~{S}_B,',0,2);
taskText('���������� �������� ���������� ������~{A} �~{B} (��\ �������).',0,3);
taskText('������� ����� ���� �\ ������~{S}_C, ���������� �������� ������������~{A}\*{B}.',0,4);
taskText('���� �������~{A} �~{B} ������ �����������, ��\ �������� ����~{S}_C ������.',0,5);
(*
*)
(*==*)
n := 3 + Random(5);
if Random(4) = 0 then
  n1 := 3 + Random(5)
else n1 := n;
case curtest of //2012
3: repeat n1 := 3 + Random(5); until n1 <> n;
4: n1 := n;
end;
Add35_36(n,n,n1,n1,0);
Pause;
end;



procedure SFil25Bn16(Name, Key: string);
var m,i1,j1:integer;
begin
start(Name,Topic4,Author,Key,63{level});
taskText('���� ��� ����� �����~{I}, {J} �\ ���� ������������ �����,',0,1);
taskText('���������� �������� ������������� ������� (��\ �������),',0,2);
taskText('������ ������ ������� ����� �������� ���������� �������� �������.',0,3);
taskText('������� ������� �������, ������������� �~\Um{I}-�\um\ ������ �~\Um{J}-�\um\ ������� (������',0,4);
taskText('� ������� ���������� ��~1). ���� ��������� ������� �����������, ��\ �������~0.',0,5);
(*
*)
(*==*)
S := FileName(8) + '.tst';
m := 3 + Random(5);
n := 3 + Random(5);
i1 := Random(7) + 1;
j1 := Random(7) + 1;
Add31_32(m,n,1,i1,j1);
Pause;
end;

procedure SFil25Bn17(Name, Key: string);
var m:integer;
begin
start(Name,Topic4,Author,Key,63{level});
taskText('��� ���� ������������ �����,',0,1);
taskText('���������� �������� ������������� ������� (��\ �������),',0,2);
taskText('������ ������ ������� ����� �������� ���������� �������� �������.',0,3);
taskText('������� ����� ���� ���\ �� ���������,',0,4);
taskText('���������� �������, ����������������� �\ ��������.',0,5);
(*
*)
(*==*)
m := 3 + Random(5);
n := 3 + Random(5);
Add33_34(m,n,1);
Pause;
end;
procedure SFil25Bn18(Name, Key: string);
var m1,m:integer;
begin
start(Name,Topic4,Author,Key,63{level});
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_A �~{S}_B, ����������',0,1);
taskText('�������� ������������� ������~{A} �~{B} (��\ �������), ������ ������ �������',0,2);
taskText('������� ����� �������� ���������� �������� ��������������� �������. �������',0,3);
taskText('���� ���\ �� ��������� �\ ������~{S}_C, ���������� �������� ������������~{A}\*{B}.',0,4);
taskText('���� �������~{A} �~{B} ������ �����������, ��\ �������� ����~{S}_C ������.',0,5);
(*
*)
(*==*)
n := 3 + Random(5);
m := 3 + Random(5);
n1 := 3 + Random(5);
if Random(4) = 0 then
  m1 := 3 + Random(5)
else
  m1 := n;
case curtest of //2012
2: repeat m1 := 3 + Random(5); until m1 <> n;
3: m1 := n;
end;
Add35_36(m,n,m1,n1,1);
Pause;
end;
procedure Add37_39(dop : integer);
var i,j:integer;
begin
S := 'a' + FileName(7) + '.tst';
S1 := '1' + FileName(7) + '.tst';
Assign(Fr,S);
rewrite(Fr);
Assign(Fr1,S1);
rewrite(Fr1);
n := 3 + Random(5);
for i := 1 to n do
  for j := 1 to n do
  begin
    case code of
    0: bln := j < i;
    1: bln := j > i;
    2: bln := (j < i-1)or(j>i+1);
    end;
    if bln then x := 0
    else
    begin
      if Random(10) = 0 then x := 0
      else x := Random * 9.9;
      write(Fr1,x);
    end;
    write(Fr,x);
  end;
Close(Fr);
Close(Fr1);
setFileItemsInLine(n);
if dop=1 then dataFileR(S,4,6)
         else resultFileR(S,3,6);
setFileItemsInLine(0);
if dop=1 then resultFileR(S1,3,6)
         else dataFileR(S1,4,6);
if dop=1 then
begin
dataS('��� ��������� �����: ',S,xLeft,2);
dataS('��� ����� �����������: ',S1,xRight,2);
end
else
begin
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S,xRight,2);
end;
dataComment('���������� ��������� �����:',0,3);
resultComment('���������� ����� �����������:',0,2);
end;
procedure SFil25Bn19(Name, Key: string);
begin
start(Name,Topic4,Author,Key,63{level});
getVariant(9,3,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���� ������������ �����, ���������� ��������',0,2);
taskText('����������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� �������� ��������� ����� ������ ������� (��\ �������).',0,4);
(*
*)
end;
1: begin
taskText('��� ���� ������������ �����, ���������� ��������',0,2);
taskText('���������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� �������� ��������� ����� ������ ������� (��\ �������).',0,4);
(*
*)
end;
2: begin
taskText('��� ���� ������������ �����, ���������� ��������',0,2);
taskText('���������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� �������� ��������� ����� ������ ������� (��\ �������).',0,4);
(*
*)
end;
end;
(*==*)
setNumberOfTests(5);
Add37_39(1);
Pause;
end;
procedure SFil25Bn20(Name, Key: string);
var i1,j1,i,j:integer;
begin
start(Name,Topic4,Author,Key,63{level});
getVariant(10,3,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('���� ��� ����� �����~{I}, {J} �\ ���� ������������ �����, ���������� ���������',0,1);
taskText('����� ����������������� ������� (��\ �������). ������� ������� �������',0,2);
taskText('�\ ��\ �������, ������������� �~\Um{I}-�\um\ ������ �~\Um{J}-�\um\ ������� (������ �\ �������',0,3);
taskText('���������� ��~1). ���� ��������� ������� ��������� �\ ������� ����� �������,',0,4);
taskText('��\ �������~0; ���� ������� �����������, ��\ �������~\-1.',0,5);
(*
*)
end;
1: begin
taskText('���� ��� ����� �����~{I}, {J} �\ ���� ������������ �����, ���������� ���������',0,1);
taskText('����� ���������������� ������� (��\ �������). ������� ������� �������',0,2);
taskText('�\ ��\ �������, ������������� �~\Um{I}-�\um\ ������ �~\Um{J}-�\um\ ������� (������ �\ �������',0,3);
taskText('���������� ��~1). ���� ��������� ������� ��������� �\ ������� ����� �������,',0,4);
taskText('��\ �������~0; ���� ������� �����������, ��\ �������~\-1.',0,5);
(*
*)
end;
2: begin
taskText('���� ��� ����� �����~{I}, {J} �\ ���� ������������ �����, ���������� ���������',0,1);
taskText('����� ���������������� ������� (��\ �������). ������� ������� �������',0,2);
taskText('�\ ��\ �������, ������������� �~\Um{I}-�\um\ ������ �~\Um{J}-�\um\ ������� (������ �\ �������',0,3);
taskText('���������� ��~1). ���� ��������� ������� ��������� �\ ������� ����� �������,',0,4);
taskText('��\ �������~0; ���� ������� �����������, ��\ �������~\-1.',0,5);
(*
*)
end;
end;
(*==*)
S := 'a' + FileName(7) + '.tst';
Assign(Fr,S);
rewrite(Fr);
n := 3 + Random(5);
i1 := Random(n) + 2;
j1 := Random(n) + 1;
x1 := -1;
for i := 1 to n do
  for j := 1 to n do
  begin
    case code of
    0: bln := j < i;
    1: bln := j > i;
    2: bln := (j < i-1)or(j>i+1);
    end;
    if not bln then
      begin x := Random * 9.9; write(Fr,x); end
    else x := 0;
    if (i = i1) and (j = j1) then x1 := x;
  end;
Close(Fr);
dataFileR(S,4,6);
dataN('I = ',i1,xLeft,2,1);
dataN('J = ',j1,xRight,2,1);
dataS('��� �����: ',S,xLeft,3);
dataComment('���������� �����:',xRight,3);
resultN('������� �������:  ',n,29,2,1);
resultR('������� �������: ',x1,0,4,5);
Pause;
end;
procedure SFil25Bn21(Name, Key: string);
begin
start(Name,Topic4,Author,Key,63{level});
getVariant(1,3,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���� ������������ �����, ���������� ��������� �����',0,2);
taskText('����������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� ���\ �������� ������ ������� (��\ �������).',0,4);
(*
*)
end;
1: begin
taskText('��� ���� ������������ �����, ���������� ��������� �����',0,2);
taskText('���������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� ���\ �������� ������ ������� (��\ �������).',0,4);
(*
*)
end;
2: begin
taskText('��� ���� ������������ �����, ���������� ��������� �����',0,2);
taskText('���������������� ������� (��\ �������). ������� ����� ����,',0,3);
taskText('���������� ���\ �������� ������ ������� (��\ �������).',0,4);
(*
*)
end;
end;
(*==*)
Add37_39(2);
setNumberOfTests(5);
Pause;
end;
procedure SFil25Bn22(Name, Key: string);
var k,j1,i,j:integer;
    a,b : array [1..7,1..7] of real;
begin
start(Name,Topic4,Author,Key,63{level});
getVariant(2,2,0,0,code,code1,code2);
dec(Code);
j1 := 0;
case code of
0: begin
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_A �~{S}_B,',0,1);
taskText('���������� ��������� ����� ����������������� ������~{A} �~{B} (��\ �������).',0,2);
taskText('������� ����� ���� �\ ������~{S}_C, ����������',0,3);
taskText('��������� ����� ������������~{A}\*{B} (��\ �������).',0,4);
taskText('���� �������~{A} �~{B} ������ �����������, ��\ �������� ����~{S}_C ������.',0,5);
(*
*)
   j1 := 1;
   end;
1: begin
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_A �~{S}_B,',0,1);
taskText('���������� ��������� ����� ���������������� ������~{A} �~{B} (��\ �������).',0,2);
taskText('������� ����� ���� �\ ������~{S}_C, ����������',0,3);
taskText('��������� ����� ������������~{A}\*{B} (��\ �������).',0,4);
taskText('���� �������~{A} �~{B} ������ �����������, ��\ �������� ����~{S}_C ������.',0,5);
(*
*)
   j1 := -1;
   end;
end;
(*==*)
S1 := 'a' + FileName(7) + '.tst';
S2 := 'b' + FileName(7) + '.tst';
S3 := 'c' + FileName(7) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
n := 3 + Random(5);
for i := 1 to n do
  for j := 1 to n do
    if j*j1 < i*j1 then a[i,j] := 0
    else
      begin
        a[i,j] := Random * 9.9;
        write(Fr1,a[i,j]);
      end;
Close(Fr1);
Assign(Fr2,S2);
rewrite(Fr2);
if Random(4) = 0 then
  n1 := 3 + Random(5)
else n1 := n;
case curtest of //2012
3: repeat n1 := 3 + Random(5); until n1 <> n;
5: n1 := n;
end;
for i := 1 to n1 do
  for j := 1 to n1 do
    if j*j1<i*j1 then b[i,j] := 0
    else
      begin
        b[i,j] := Random * 9.9;
        write(Fr2,b[i,j]);
      end;
Close(Fr2);
Assign(Fr3,S3);
rewrite(Fr3);
if n1=n then
for i := 1 to n do
  for j := 1 to n do
    if j*j1>=i*j1 then
    begin
      x3 := 0;
      for k := 1 to n do
        begin
          x3 := x3 + a[i,k]*b[k,j];
        end;
      write(Fr3,x3);
    end;
Close(Fr3);
dataFileR(S1,4,6);
dataFileR(S2,5,6);
setFileItemsInLine(n);
resultFileR(S3,3,8);
dataS('S_A = ',S1,Center(1,3,18,4),2);
dataS('S_B = ',S2,Center(2,3,18,4),2);
dataS('S_C = ',S3,Center(3,3,18,4),2);
dataComment('���������� �������� ������:',0,3);
resultComment('���������� ����� �����������:',0,2);
setNumberOfTests(7);
Pause;
end;


procedure SFil25Bn23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFil25Bn24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFil25Bn25(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 63{level});
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
Topic := '�������� �����';
Topic3 := '���������� � ��������� �����';
Topic4 := '������������� ������ ��� ������ � ���������';
{Author := '�.~�.~�������, 2002';}
end.
