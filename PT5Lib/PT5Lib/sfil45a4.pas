{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SFil45A4;

{$MODE Delphi}

interface

procedure SFil45An1(Name, Key: string);
procedure SFil45An2(Name, Key: string);
procedure SFil45An3(Name, Key: string);
procedure SFil45An4(Name, Key: string);
procedure SFil45An5(Name, Key: string);
procedure SFil45An6(Name, Key: string);
procedure SFil45An7(Name, Key: string);
procedure SFil45An8(Name, Key: string);
procedure SFil45An9(Name, Key: string);
procedure SFil45An10(Name, Key: string);
procedure SFil45An11(Name, Key: string);
procedure SFil45An12(Name, Key: string);
procedure SFil45An13(Name, Key: string);
procedure SFil45An14(Name, Key: string);
procedure SFil45An15(Name, Key: string);
procedure SFil45An16(Name, Key: string);
procedure SFil45An17(Name, Key: string);
procedure SFil45An18(Name, Key: string);
procedure SFil45An19(Name, Key: string);
procedure SFil45An20(Name, Key: string);
procedure SFil45An21(Name, Key: string);
procedure SFil45An22(Name, Key: string);
procedure SFil45An23(Name, Key: string);
procedure SFil45An24(Name, Key: string);
procedure SFil45An25(Name, Key: string);
procedure SFil45An26(Name, Key: string);
procedure SFil45An27(Name, Key: string);
procedure SFil45An28(Name, Key: string);
procedure SFil45An29(Name, Key: string);
procedure SFil45An30(Name, Key: string);
procedure SFil45An31(Name, Key: string);
procedure SFil45An32(Name, Key: string);
procedure SFil45An33(Name, Key: string);
procedure SFil45An34(Name, Key: string);
procedure SFil45An35(Name, Key: string);
procedure SFil45An36(Name, Key: string);
procedure SFil45An37(Name, Key: string);
procedure SFil45An38(Name, Key: string);
procedure SFil45An39(Name, Key: string);
procedure SFil45An40(Name, Key: string);
procedure SFil45An41(Name, Key: string);
procedure SFil45An42(Name, Key: string);
procedure SFil45An43(Name, Key: string);
procedure SFil45An44(Name, Key: string);
procedure SFil45An45(Name, Key: string);

implementation

uses PT5TaskMaker;

var code, code1, code2 : byte;
    s,s0,s1,s2,s3,s4 : shortstring;
    Fi,Fi0,Fi1,Fi2,Fi3,Fi4 : file of integer;
    Fr,Fr0,Fr1,Fr2,Fr3,Fr4 : file of real;
    Fc,Fc0,Fc1,Fc2,Fc3,Fc4 : file of char;
    x,x0,x1,x2,x3,x4,x5 : real;
    n,n0,n1,n2,n3,n4,n5 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    bln : Boolean;
    Topic,Topic1,Topic1a,Topic2,Author : string;
    iar1,iar2: array [1..50] of integer;

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

procedure SFil45An1(Name, Key: string);
var i : integer;
    b : Boolean;
begin

start(Name,Topic1,Author,Key,63{level});
taskText('���� ������~{S}. ���� {S}~�������� ���������� ������ �����,',0,2);
taskText('��\ ������� ������ ���� �\ ���� ������ �\ ������� \t.',0,3);
taskText('���� ���� �\ ������~{S} ������� ������, ��\ ������� \f.',0,4);
(*
*)
(*==*)
S := FileName(8)+'.'+FileName(3);
s1 := '*?<>|';
i := Random(2);
case curtest of //2012
3: i := 0;
5: i := 1;
end;
if i = 0 then
  begin
    s[Random(8)+1] := s1[Random(5)+1];
    s[Random(10)+3] := s1[Random(5)+1];
    b := False;
  end
else
  begin
    Assign(Fc,S);
    Rewrite(Fc);
    Close(Fc);
    ResultFileC(S,0,0);
    b := True;
  end;
dataS('S = ',S,0,3);
resultB('',b,0,3);
setNumberOfTests(7);
Pause;
end;


procedure SFil45An2(Name, Key: string);
var i,j:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});(*DEMO*)
GetVariant(1, 0, 0, 0, v1, v2, v3);
taskText('���� ��� ����� �\ ����� �����~{N} (>\,1).',0,2);
taskText('������� ���� ����� ����� �\ ������ ������',0,3);
taskText('�\ �������� �\ ���� {N}~������ ������������� ������ ����� (2, 4,~\.).',0,4);
(*
*)
S2 := FileName(8) + '.tst';
N := 2 + Random(19);
Assign(Fi1,S2);
rewrite(Fi1);
for i := 1 to N do
  begin
    j := 2*i;
    write(Fi1,j);
  end;
Close(Fi1);
dataS('��� �����: ',S2,0,2);
dataN('N = ',N,0,4,1);
resultComment('���������� �����:',0,2);
resultFileN(S2,3,4);
  Pause;
end;


procedure SFil45An3(Name, Key: string);
var i,j:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});
GetVariant(1, 0, 0, 0, v1, v2, v3);
taskText('���� ��� ����� �\ ������������ �����~{A} �~{D}.',0,1);
taskText('������� ���� ������������ ����� �\ ������ ������',0,2);
taskText('�\ �������� �\ ���� 10~������ ������ \I�������������� ����������\i',0,3);
taskText('�\ ��������� ������~{A} �\ ���������~{D}:',0,4);
taskText('\[{A},\q {A}~+~{D},\q {A}~+~2\*{D},\q {A}~+~3\*{D},\q \.~.\]',0,5);
(*
*)
(*==*)
S2 := FileName(8) + '.tst';
N := 10;
x0 := Random(998)/100;
x1 := Random(500)/100;
Assign(Fr1,S2);
rewrite(Fr1);
for i := 1 to N do
  begin
    x := x0 + x1*(i-1);
    write(Fr1,x);
  end;
Close(Fr1);
dataS('��� �����: ',S2,0,2);
dataR('A = ',x0,xLeft,4,4);
dataR('D = ',x1,xRight,4,4);
resultComment('���������� �����:',0,2);
resultFileR(S2,3,6);
Pause;
end;



procedure SFil45An4(Name, Key: string);
var S : array [1..4] of string;
    i,j : integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('���� ����� ������� ������.',0,2);
taskText('����� ���������� ������ �\ ���������� �������,',0,3);
taskText('������� ������� �\ ������� ��������.',0,4);
(*
*)
(*==*)
j := 0;
for i := 1 to 4 do
  begin
    S[i] := chr(96+i)+FileName(7)+'.tst';
    dataS('',S[i],Center(i,4,12,4),3);
    if Random(3) <> 0 then
      begin
        inc(j);
        Assign(Fc,S[i]);
        Rewrite(Fc);
        Close(Fc);
        dataFileC(S[i],0,0);
      end;
  end;
resultN('',j,0,3,1);
Pause;
end;

procedure SFil45An5(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('���� ��� ����� ����� �����.',0,2);
taskText('����� ���������� ���������, ������������ �\ ������ �����.',0,3);
taskText('���� ����� �\ ����� ������ ��\ ����������, ��\ �������~\-1.',0,4);
(*
*)
(*==*)
S := FileName(8)+'.tst';
{dataS('',S,0,3);}
dataS('��� �����: ',S,0,2);
{dataComment('���������� �����: ',xRight,2);}
j := Random(3);
case curtest of //2012
3: j := 1;
6: j := 0;
end;
k := -1;
if j <> 1 then
  begin
    Assign(Fi,S);
    Rewrite(Fi);
    case Random(4) of
    0: k := 0;
    1,2: k := Random(12)+1;
    3: k := 13 + Random(28);
    end;
    for i := 1 to k do
    begin
      j := 10+ Random(89);
      write(Fi,j);
    end;
    Close(Fi);
    dataFileN(S,3,5);
{    dataFileN(S,0,0);}
  end
else
  dataComment('���� �����������.',6,3);
resultN('',k,0,3,2);
setNumberOfTests(7);
Pause;
end;
procedure SFil45An6(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('���� ����� �����~{K} �\ ����, ���������� ��������������� ����� �����.',0,2);
taskText('������� \Um{K}-�\um ������� ����� (�������� ���������� ��~1).',0,3);
taskText('���� ����� ������� �����������, ��\ �������~\-1.',0,4);
(*
*)
(*==*)
n := Random(20)+5;
k := random(15);
if Random(4) = 0 then k := n + Random(5) + 1;
case curtest of //2012
4: k := n + Random(5) + 1;
5: k := random(n);
end;
dataN('� = ',k+1,0,2,2);
S := FileName(8)+'.tst';
dataS('��� �����: ',S,xLeft,3);
dataComment('���������� �����: ',xRight,3);
    Assign(Fi,S);
    Rewrite(Fi);
    for i := 1 to n do
      begin
      if Random(3)=0 then j := 0
                     else j := 1+Random(40);
      write(Fi,j);
      end;
    j := -1;
    if k < n then
      begin
        seek(Fi,k);
        read(Fi,j);
      end;
    Close(Fi);
    dataFileN(S,4,5);
    resultN('',j,0,3,2);
  SetNumberOfTests(7);
Pause;
end;
procedure SFil45An7(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('��� ���� ����� �����, ���������� ��\ ����� ������� ���������.',0,2);
taskText('������� ������, ������, ������������� �\ ��������� �������� ������� �����.',0,4);
(*
*)
(*==*)
S := FileName(8)+'.tst';
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
    Assign(Fi,S);
    Rewrite(Fi);
    k := Random(17)+14;
    for i := 1 to k do
      begin
      j := Random(100);
      write(Fi,j);
      end;
    Seek(fi,0);
    read(fi,i);
    resultN('',i,center(1,4,2,7),3,2);
    read(fi,i);
    resultN('',i,center(2,4,2,7),3,2);
    Seek(fi,FileSize(fi)-2);
    read(fi,i);
    resultN('',i,center(3,4,2,7),3,2);
    read(fi,i);
    resultN('',i,center(4,4,2,7),3,2);
    Close(Fi);
    dataFileN(S,3,5);
Pause;
end;
procedure SFil45An8(Name, Key: string);
var i: integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
n := 5;
taskText('���� ����� ���� ������ ������������ �����.',0,1);
taskText('��������, ��� ������ ��\ ��� ���������� �\ �������� ��������,',0,2);
taskText('�\ ������ �\ ������� �������� �����������.',0,3);
taskText('������� ������������� ���� �\ �������� �\ ���� ��������� �\ ��������',0,4);
taskText('�������� ������������� ����� (�\ ��������� �������).',0,5);
(*
*)
end;
2: begin
n := 9;
taskText('���� ����� ���� ������ ������������ �����.',0,1);
taskText('��������, ��� ���� ��\ ��� (�� ����������� ������) ����������',0,2);
taskText('�\ �������� ��������, �\ ������ �\ ������� �������� �����������.',0,3);
taskText('������� ������������� ���� �\ �������� �\ ���� �������� �\ ���������',0,4);
taskText('�������� ������������� ����� (� ��������� �������).',0,5);
(*
*)
end;
end;
(*==*)
S1 := 'a'+FileName(7)+'.tst';
S2 := 'b'+FileName(7)+'.tst';
dataS('',S1,xLeft,2);
dataS('',S2,xRight,2);
if (v1 = 2) and (Random(2) = 0) then
  begin
    s := s1;
    s1 := s2;
    s2 := s;
  end;
Assign(Fr1,S1);
Rewrite(Fr1);
Assign(Fr2,S2);
Rewrite(Fr2);
x1 := Random * 9.98;
write(Fr1,x1);
for i := 1 to Random(6)+5 do
  begin
    x := Random * 9.98;
    write(Fr1,x);
  end;
x2 := Random * 9.98;
write(Fr1,x2);
case v1 of
1: write(Fr2,x1,x2);
2: write(Fr2,x2,x1);
end;
Close(Fr1);
Close(Fr2);
dataComment('���������� ������������� �����:',0,3);
dataFileR(S1,4,6);
resultComment('���������� ���������� �����:',0,2);
resultFileR(S2,3,6);
setNumberOfTests(n);
Pause;
end;









procedure SFil45An9(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic1,Author,Key,63{level});(*DEMO*)
taskText('��� ���� ����� �����.',0,2);
taskText('������� ����� ����, ���������� ��\ ��\ ��������,',0,3);
taskText('��� �\ �������� ����, ��\ �\ �������� �������.',0,4);
(*
*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
Assign(Fi1,S1);
rewrite(Fi1);
for i := 0 to 10 + Random(20) do
  begin
    j := Random(51);
    write(Fi1,j);
  end;
Assign(Fi2,S2);
Rewrite(Fi2);
for i := FileSize(Fi1)-1 downto 0 do
  begin
    Seek(Fi1,i);
    read(Fi1,j);
    write(Fi2,j);
  end;
Close(Fi1);
Close(Fi2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileN(S1,4,4);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S2,3,4);
Pause;
end;
procedure SFil45An10(Name, Key: string);
var i: integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('��� ���� ������������ �����. ������� ��� ����� �����,',0,2);
taskText('������ ��\ ������� �������� �������� ��������� ����� �\ ��������� ��������',0,3);
taskText('(1,\;3,\;\.), �\ ������\ \= �\ ������� (2,\;4,\;\.).',0,4);
(*
*)
(*==*)
S1 := '1' + FileName(7) + '.tst';
S2 := '2' + FileName(7) + '.tst';
S3 := '3' + FileName(7) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
Assign(Fr2,S2);
rewrite(Fr2);
Assign(Fr3,S3);
rewrite(Fr3);
for i := 0 to 10 + Random(20) do
  begin
    x := Random*9.9999;
    write(Fr1,x);
    write(Fr2,x);
    x := Random*9.9999;
    write(Fr1,x);
    write(Fr3,x);
  end;
if (Random(2) = 0)
  or (curtest = 3) then //2012
  begin
    x := Random*9.9999;
    write(Fr1,x);
    write(Fr2,x);
  end;
Close(fr1);
Close(fr2);
Close(fr3);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('����� �������������� ������: ',S2,3,4);
dataS('',S3,48,4);
dataComment('���������� ��������� �����:',xRight,2);
dataFileR(S1,3,6);
resultComment('���������� �������������� ������:',0,2);
resultFileR(S2,3,6);
resultFileR(S3,4,6);
Pause;
end;
procedure SFil45An11(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic1,Author,Key,63{level});
getVariant(4,2,0,0,code,code1,code2);
dec(Code);
case Code of
0 : begin
taskText('��� ���� ����� �����. ������� ��� ����� �����,',0,1);
taskText('������ ��\ ������� �������� ������ ����� ��\ ��������� �����,',0,2);
taskText('�\ ������\ \= �������� (�\ ���\ �� �������). ���� ������',0,3);
taskText('���\ �������� ����� �\ �������� ����� �����������,',0,4);
taskText('��\ ��������������� �������������� ���� �������� ������.',0,5);
(*
*)
end;
1 : begin
taskText('��� ���� ����� �����. ������� ��� ����� �����,',0,1);
taskText('������ ��\ ������� �������� ������������� ����� ��\ ��������� �����',0,2);
taskText('(�\ �������� �������), �\ ������\ \= ������������� (����� �\ �������� �������).',0,3);
taskText('���� ������������� ���\ ������������� ����� �\ �������� ����� �����������,',0,4);
taskText('��\ ��������������� �������������� ���� �������� ������.',0,5);
(*
*)
end;
end;
(*==*)
S1 := 'a' + FileName(7) + '.tst';
S2 := 'b' + FileName(7) + '.tst';
S3 := 'c' + FileName(7) + '.tst';
Assign(Fi1,S1);
rewrite(Fi1);
n1 := 0;
n2 := 0;
for i := 0 to 15 + Random(20) do
  begin
    j := 20 - integer(Random(40));
    if j = 0 then j := 1;
    write(Fi1,j);
    case Code of
    0: bln := not Odd(j);
    1: bln := j > 0;
    end;
    if bln then begin inc(n1); iar1[n1] := j; end
            else begin inc(n2); iar2[n2] := j; end;
  end;
Close(fi1);
Assign(Fi2,S2);
rewrite(Fi2);
Assign(Fi3,S3);
rewrite(Fi3);
case Code of
0: begin
for i := 1 to n1 do write(fi2,iar1[i]);
for i := 1 to n2 do write(fi3,iar2[i]);
end;
1: begin
for i := n1 downto 1 do write(fi2,iar1[i]);
for i := n2 downto 1 do write(fi3,iar2[i]);
end;
end;
Close(fi2);
Close(fi3);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('����� �������������� ������: ',S2,3,4);
dataS('',S3,48,4);
dataComment('���������� ��������� �����:',xRight,2);
dataFileN(S1,3,4);
resultComment('���������� �������������� ������:',0,2);
resultFileN(S2,3,4);
resultFileN(S3,4,4);
Pause;
end;


procedure SFil45An12(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,k: integer;
begin
  Start(Name, Topic1, Author, Key, 63{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:begin
  TaskText('��� ���� ������������ �����.', 0, 2);
  TaskText('����� ������� �������������� ���\ ���������.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('��� ���� ������������ �����.', 0, 2);
  TaskText('����� ����� ���\ ��������� �\ ������� ��������.', 0, 4);
(*
*)
  end;
  end;
(*==*)
S := FileName(8)+'.tst';
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
k := Random(19) + 2;
Assign(fr,S);
Rewrite(Fr);
x0 := 0;
for i := 1 to k do
  begin
    x := 9.98*Random;
    write(Fr,x);
    case v1 of
    1: x0 := x0 + x;
    2: if not Odd(i) then x0 := x0 + x;
    end;
  end;
Close(Fr);
DataFileR(S,3,6);
if v1 = 1 then x0 := x0/k;
resultR('',x0,0,3,5);
Pause;
end;





procedure SFil45An13(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,63{level});

taskText('��� ���� ����� �����. ����� ���������� ������������ �\ ��� \I�����\i',0,2);
taskText('(�.\,�. ������� ��������������� ������������� ���������� ���������).',0,3);
taskText('��������, ���\ ����� �\ ���������� 1,~5, 5, 5, 4, 4,~5 ��������� �����~4.',0,4);
(*
*)
(*==*)
S := FileName(8)+'.tst';
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
k := Random(9) + 2;
Assign(fi,S);
Rewrite(Fi);
for i := 1 to k do
  begin
    n0 := n;
    n := Random(10);
    if n = n0 then inc(n);
    for j := 1 to 1 + Random(5) do
      write(Fi,n);
  end;
Close(Fi);
DataFileN(S,3,4);
resultN('',k,0,3,2);
Pause;
end;


procedure SFil45An14(Name, Key: string);
var i,j,k,j1:integer;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('��� ���� ����� �����. ������� ����� ���� ����� �����, ����������',0,1);
taskText('����� ���� ����� ��������� ����� (\I������\i ���������� ����� ���������������',0,2);
taskText('������������� ���������� ���������, �\ \I������ �����\i\ \= ���������� ����',0,3);
taskText('���������). ��������, ���\ ��������� ����� �\ ���������� 1, 5, 5, 5, 4, 4,~5',0,4);
taskText('���������� ��������������� ����� ������ ���� ���������: 1, 3, 2,~1.',0,5);
(*
*)
(*==*)
S1 := 'a' + FileName(7) + '.tst';
S2 := 'b' + FileName(7) + '.tst';
Assign(Fi1,S1);
rewrite(Fi1);
Assign(Fi2,S2);
rewrite(Fi2);
k := Random(10) + 2;
for i := 1 to k do
  begin
    n0 := n;
    n := Random(10);
    if n = n0 then inc(n);
    j1 := 1 + Random(5);
    for j := 1 to j1 do
      write(Fi1,n);
    write(Fi2,j1);
  end;
Close(fi1);
Close(fi2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileN(S1,4,4);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S2,3,4);
Pause;
end;

procedure SFil45An15(Name, Key: string);
var i,j,k,nmin,nmax : integer;
    a : array [0..40] of real;
    amin, amax: real;
begin
start(Name,Topic1,Author,Key,63{level});
getVariant(1,3,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���� ������������ �����. ����� ���\ ������ ��������� �������',0,2);
taskText('(\I��������� ���������\i ���������� �������, ������� ������ ����� �������).',0,4);
(*
*)
   end;
1: begin
taskText('��� ���� ������������ �����. ����� ���\ ��������� ��������� ��������',0,2);
taskText('(\I��������� ����������\i ���������� �������, ������� ������ ����� �������).',0,4);
(*
*)
   end;
2: begin
taskText('��� ���� ������������ �����. ����� ����� ���������� ���\ \I��������� �����������\i,',0,2);
taskText('�.\,�. ��������� ��������� �\ ��������� ���������� (����������� ����������',0,3);
taskText('�������� �\ ���������� ��������� ���� �\ �������� \2 � \1).',0,4);
(*
*)
   end;
end;
(*==*)
S := FileName(8)+'.tst';
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
if code <> 2 then
n := 8 + Random(20)
else
n := 8 + Random(10);
for i:=1 to n do
  begin
    a[i] := 9.98*Random;
  end;
j := Random(3);
case curtest of //2012
3: j := 1;
4: j := 0;
6: j := 2;
end;
case j of
0: j := 2+Random(n-2);
1: begin
     j := 1;
     if a[2]<a[1] then
       begin
         x := a[2];
         a[2] := a[1];
         a[1] := x;
       end;
     if a[n]<a[n-1] then
       begin
         x := a[n];
         a[n] := a[n-1];
         a[n-1] := x;
       end;
    end;
2: j := n;
end;
case Code of
0: for k := 1 to j-1 do
     for i := 1 to j-k do
       if a[i]<a[i+1] then
       begin
         x := a[i];
         a[i] := a[i+1];
         a[i+1] := x;
       end;
1: for k := 1 to j-1 do
     for i := n-j+1 to n-k do
       if a[i]<a[i+1] then
       begin
         x := a[i];
         a[i] := a[i+1];
         a[i+1] := x;
       end;
end;
a[0] := a[2];
a[n+1] := a[n-1];
Assign(Fr,S);
Rewrite(Fr);
for i:=1 to n do
    write(Fr,a[i]);
Close(Fr);
nmin := 0;nmax := 0;
amin := -10;
amax := -10;
for i := 1 to n do
  begin
  if (a[i]>a[i-1])and(a[i]>a[i+1]) then begin inc(nmax); amax := a[i]; end;
  if (a[i]<a[i-1])and(a[i]<a[i+1]) then begin inc(nmin); if amin = -10 then amin := a[i]; end;
  end;
dataFileR(S,3,6);
case code of
0 : resultR('',amin,0,3,5);
1 : resultR('',amax,0,3,5);
2 : resultN('',nmin+nmax,0,3,2);
end;
setnumberOfTests(8);
Pause;
end;


procedure SFil45An16(Name, Key: string);
var i: integer;
    a : array [0..25] of real;
begin
start(Name,Topic1,Author,Key,63{level});
getVariant(2,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���� ������������ �����. ������� ���� ����� �����, ����������',0,2);
taskText('������ ���� \I��������� ����������\i ��������� ����� �\ ������� �����������',0,3);
taskText('(����������� ���������� ��������� ���� �\ ������� \2).',0,4);
(*
*)
   end;
1: begin
taskText('��� ���� ������������ �����. ������� ���� ����� �����, ����������',0,2);
taskText('������ ���� \I��������� �����������\i ��������� ����� �\ ������� ��������',0,3);
taskText('(����������� ���������� ���������� ���� �\ ������� \2).',0,4);
(*
*)
   end;
end;
(*==*)
S := 'a'+FileName(7)+'.tst';
S0 := 'b'+FileName(7)+'.tst';
n := 5 + Random(10);
Assign(Fr,S);
Rewrite(Fr);
for i:=1 to n do
  begin
    a[i] := 9.98*Random;
    write(Fr,a[i]);
  end;
Close(Fr);
a[0] := a[2];
a[n+1] := a[n-1];
Assign(Fi,S0);
Rewrite(Fi);
case code of
0: for i := 1 to n do
    if (a[i]>a[i-1])and(a[i]>a[i+1]) then write(Fi,i);
1: for i := n downto 1 do
    if (a[i]-a[i-1])*(a[i]-a[i+1])>0 then write(Fi,i);
end;
Close(Fi);
dataS('��� ��������� �����: ',S,xLeft,2);
dataS('��� ����� �����������: ',S0,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileR(S,4,6);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S0,3,4);
Pause;
end;


procedure SFil45An17(Name, Key: string);
var i: integer;
    a : array [1..35] of real;
begin
start(Name,Topic1,Author,Key,63{level});
getVariant(5,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('��� ���� ������������ �����. ������� ���� ����� �����, ����������',0,2);
taskText('����� ���� ��������� ������������������� ��������� ��������� �����.',0,3);
taskText('��������, ���\ ��������� ����� �\ ���������� 1.7, 4.5, 3.4, 2.2, 8.5,~1.2',0,4);
taskText('���������� ��������������� ����� ������ ���� ���������: 3,~2.',0,5);
(*
*)
end;
1: begin
taskText('��� ���� ������������ �����. ������� ���� ����� �����, ����������',0,2);
taskText('����� ���� ���������� ������������������� ��������� ��������� �����.',0,3);
taskText('��������, ���\ ��������� ����� �\ ���������� 1.7, 4.5, 3.4, 2.2, 8.5,~1.2',0,4);
taskText('���������� ��������������� ����� ������ ���� ���������: 2, 3, 2,~2.',0,5);
(*
*)
end;
end;
(*==*)
S1 := 'a' + FileName(7) + '.tst';
S2 := 'b' + FileName(7) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
Assign(Fi2,S2);
rewrite(Fi2);
n := 10 + Random(10);
for i:=1 to n do
  begin
    a[i] := 10*Random;
    write(Fr1,a[i]);
  end;
Close(Fr1);
n1 := 1;
for i := 2 to n-1 do
  begin
  if (a[i]>a[i-1])and(a[i]>a[i+1]) then
    begin
      n2 := i-n1+1;
      n1 := i;
      if Code in [1] then write(fi2,n2);
    end;
  if (a[i]<a[i-1])and(a[i]<a[i+1]) then
    begin
      n2 := i-n1+1;
      n1 := i;
      if Code in [0,1] then write(fi2,n2);
    end;
  end;
if a[n]>a[n-1] then
    begin
      n2 := n-n1+1;
      if Code in [1] then write(fi2,n2);
    end;
if a[n]<a[n-1] then
    begin
      n2 := n-n1+1;
      if Code in [0,1] then write(fi2,n2);
    end;
close(Fi2);
dataS('��� ��������� �����: ',S1,xLeft,2);
dataS('��� ����� �����������: ',S2,xRight,2);
dataComment('���������� ��������� �����:',0,3);
dataFileR(S1,4,6);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S2,3,4);
Pause;
end;


procedure SFil45An18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SFil45An19(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,63{level});(*DEMO*)
taskText('��� ���� ������������ �����.',0,2);
taskText('�������� �\ ��� ���\ �������� ��\ ��\ ��������.',0,4);
(*
*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fr,S);
rewrite(Fr);
Assign(Fr1,S1);
rewrite(Fr1);
for i := 0 to 10 + Random(20) do
  begin
    x := RandomR1(1.1,9.9); //Random*9.9999; //2018
    write(Fr1,x);
    x := x*x;
    write(Fr,x);
  end;
Close(fr);
Close(Fr1);
resultFileR(S,3,7);
Rename(Fr1,S);
dataFileR(S,3,7);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
pause;
end;

procedure SFil45An20(Name, Key: string);
var i,jmin,jmax:integer;
    xmin,xmax : real;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('��� ���� ������������ �����.',0,2);
taskText('�������� �\ ��� ������� ����������� �\ ������������ ��������.',0,4);
(*
*)
(*==*)
S := FileName(8) + '.tst';
Assign(Fr,S);
rewrite(Fr);
n := 10 + Random(20);
xmin := 10000;
xmax := -10000;
jmin := 1;
jmax := 1;
for i := 0 to n-1 do
  begin
    x := Random * 9.9;
    if x > xmax then
      begin
        xmax := x; jmax := i;
      end;
    if x < xmin then
      begin
        xmin := x; jmin := i;
      end;
    write(Fr,x);
  end;
Close(Fr);
NoEraseNextFile;
resultFileR(S,3,6);
Reset(Fr);
Seek(Fr,jmin); write(Fr,xmax);
Seek(Fr,jmax); write(Fr,xmin);
Close(Fr);
dataFileR(S,3,6);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;

procedure SFil45An21(Name, Key: string);
var i:integer;
    n0 : array[1..20] of integer;
begin
start(Name,Topic1,Author,Key,63{level});(*DEMO*)
taskText('��� ���� ����� ����� �\ ����������~{A}_{1}, {A}_{2},~\., {A}_{N}',0,2);
taskText('({N}\ \= ���������� ��������� � �����).',0,3);
taskText('�������� �������� ������������ ���\ ��������� ��\ ���������:',0,4);
taskText('\[{A}_{1},\q {A}_{N},\q {A}_{2},\q {A}_{N\-1},\q {A}_{3},\q \.~.\]',0,5);
(*
*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi,S);
rewrite(Fi);
Assign(Fi1,S1);
rewrite(Fi1);
n :=10 + Random(11);
case curtest of //2012
2: n := (5 + Random(5))*2;
4: n := (5 + Random(5))*2+1;
end;
for i:=1 to n do
  begin
  n0[i] := Random(51);
  write(Fi1,n0[i]);
  end;
for i := 1 to n div 2 do
  begin
    write(Fi,n0[i]);
    write(Fi,n0[n-i+1]);
  end;
if Odd(n) then write(Fi,n0[n div 2 + 1]);
Close(Fi);
Close(Fi1);
resultFileN(S,3,4);
Rename(Fi1,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;

procedure SFil45An22(Name, Key: string);
var i:integer;
    x0 : array[0..30] of real;
begin
start(Name,Topic1,Author,Key,63{level});
taskText('��� ���� ������������ �����.',0,2);
taskText('�������� �\ ����� ������ �������, ����� ���������� �\ ���������,',0,3);
taskText('��\ ��� ������� �������������� �\ ���������� �\ ����������� ���������.',0,4);
(*
*)
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fr,S);
rewrite(Fr);
Assign(Fr1,S1);
rewrite(Fr1);
n :=10 + Random(21);
for i:=0 to n do
  x0[i] := RandomR1(1.1,9.9); //Random*9.9999; //2018
write(Fr1,x0[0]);
write(Fr,x0[0]);
for i := 1 to n-1 do
  begin
    write(Fr1,x0[i]);
    x := (x0[i-1]+x0[i]+x0[i+1])/3;
    write(Fr,x);
  end;
write(Fr1,x0[n]);
write(Fr,x0[n]);
Close(fr);
Close(Fr1);
resultFileR(S,3,7);
Rename(Fr1,S);
dataFileR(S,3,7);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;


procedure SFil45An23(Name, Key: string);
var i,j:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});
GetVariant(1, 4, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('��� ���� ����� �����, ���������� ����� 50~���������.',0,2);
taskText('��������� ���\ ������ ��\ 50~���������, ������ ��\ �����',0,3);
taskText('����������� ���������� �������� ���������.',0,4);
(*
*)
end;
2: begin
taskText('��� ���� ����� �����, ���������� ������ ���������� ���������.',0,2);
taskText('������� ��\ ������� ����� ������ �������� ���������.',0,4);
(*
*)
end;
3: begin
taskText('��� ���� ����� �����, ���������� ����� 50~���������.',0,2);
taskText('��������� ���\ ������ ��\ 50~���������, ������ ��\ �����',0,3);
taskText('����������� ���������� ��������� ���������.',0,4);
(*
*)
end;
4: begin
taskText('��� ���� ����� �����, ���������� ������ ���������� ���������.',0,2);
taskText('������� ��\ ������� ����� ������ �������� ���������.',0,4);
(*
*)
end;
end;
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
if v1 in [1,3] then
begin
    n := 51 + Random(20);
    if v1 = 3 then
    for i := 51 to n do
      begin
        j := Random(50) + 1;
        write(Fi2,j);
      end;
    for i := 1 to 50 do
      begin
        j := Random(50) + 1;
        write(Fi1,j);
        write(Fi2,j);
      end;
    if v1 = 1 then
    for i := 51 to n do
      begin
        j := Random(50) + 1;
        write(Fi2,j);
      end;
end
else
begin
    n := 5 + Random(15);
    if v1 = 4 then
    for i := 1 to n do
      begin
        j := Random(50) + 1;
        write(Fi2,j);
      end;
    for i := 1 to n do
      begin
        j := Random(50) + 1;
        write(Fi1,j);
        write(Fi2,j);
      end;
    if v1 = 2 then
    for i := 1 to n do
      begin
        j := Random(50) + 1;
        write(Fi2,j);
      end;
end;
Close(fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;


procedure SFil45An24(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic1,Author,Key,63{level});
getVariant(6,2,0,0,code,code1,code2);
dec(Code);
case Code of
0 : begin
taskText('��� ���� ����� �����.',0,2);
taskText('������� ��\ ���� ���\ �������� �\ ������� ��������.',0,4);
(*
*)
end;
1 : begin
taskText('��� ���� ����� �����.',0,2);
taskText('������� ��\ ���� ���\ ������������� �����.',0,4);
(*
*)
end;
end;
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
n := 10 + Random(20);
for i := 1 to n do
  begin
    j := 20 - integer(Random(40));
    case Code of
    0: bln := not Odd(i);
    1: bln := j < 0;
    end;
    if not bln then write(Fi1,j);
    write(Fi2,j);
  end;
Close(Fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;


procedure SFil45An25(Name, Key: string);
var i,j:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});
GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('��� ���� ����� �����, ���������� ����� 50~���������.',0,2);
taskText('��������� ���\ ������ ��\ 50~���������, ������� �\ ������ �����',0,3);
taskText('����������� ���������� �����.',0,4);
(*
*)
end;
2: begin
taskText('��� ���� ����� �����. ������� ���\ ������,',0,2);
taskText('������� �\ ����� ����� ��� ���\ �������� �������� (�\ ���\ �� �������).',0,4);
(*
*)
end;
3: begin
taskText('��� ���� ����� �����. ������� ���\ ������,',0,2);
taskText('������� �\ ����� ����� ��� ���\ �������� �������� (�\ �������� �������).',0,4);
(*
*)
end;
end;
(*==*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
if v1 = 1 then
begin
    n := 20 + Random(30);
    j := 0;
    for i := n+1 to 50 do
      write(Fi1,j);
    for i := 1 to n do
      begin
        j := Random(50) + 1;
        write(Fi1,j);
        write(Fi2,j);
      end;
end
else
begin
    n := 3 + Random(10);
    for i := 1 to n do
      begin
        j := Random(50) + 1;
        write(Fi1,j);
        write(Fi2,j);
      end;
    Reset(Fi2);
    for i := 1 to n do
    begin
      if v1 = 3 then Seek(Fi2,n-i);
      read(Fi2,j);
      write(Fi1,j);
    end;
end;
Close(fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;


procedure SFil45An26(Name, Key: string);
var i,j,j1:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,63{level});
GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1:begin
taskText('��� ���� ����� �����.',0,2);
taskText('�������������� �\ ��� ���\ �������� �\ ��������� ��������.',0,4);
(*
*)
end;
2:begin
taskText('��� ���� ����� �����.',0,2);
taskText('�������������� �\ ��� ���\ �����, ������������� ���������~5\:10.',0,4);
(*
*)
end;
3: begin
taskText('��� ���� ����� �����.',0,2);
taskText('�������� �\ ��� ������ ������� � ������ ������� �� ��� ����.',0,4);
(*
*)
end;
end;
(*==*)
case v1 of
1,2:
begin
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
n := 10 + Random(10);
for i := 1 to n do
  begin
    j := Random(16);
    case v1 of
    1: if Odd(i) then write(Fi1,j);
    2: if (j >= 5)and(j<=10) then write(Fi1,j);
    end;
    write(Fi1,j);
    write(Fi2,j);
  end;
Close(fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
end;
3:begin
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
n := 10 + Random(20);
j1 := 0;
for i := 1 to n do
  begin
    j := 20 - integer(Random(40));
    if j = 0 then j := 1;
    bln := not Odd(i);
    if bln then
      begin
      write(Fi1,j1);
      write(Fi1,j1);
      end
    else
      write(Fi1,j);
    write(Fi2,j);
  end;
Close(fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
end;
end;
Pause;
end;
procedure SFil45An27(Name, Key: string);
var i,j,j1:integer;
begin
start(Name,Topic1,Author,Key,63{level});(*DEMO*)
getVariant(7,0,0,0,code,code1,code2);
taskText('��� ���� ����� �����.',0,2);
taskText('�������� �\ ��� ������ ������������� ����� �� ��� ����.',0,4);
(*
*)
S := FileName(8) + '.tst';
S1 := '#' + FileName(7) + '.tst';
Assign(Fi1,S);
rewrite(Fi1);
Assign(Fi2,S1);
rewrite(Fi2);
n := 10 + Random(20);
j1 := 0;
for i := 1 to n do
  begin
    j := 20 - integer(Random(40));
    if j = 0 then j := 1;
    bln := j > 0;
    if bln then
      begin
      write(Fi1,j1);
      write(Fi1,j1);
      write(Fi1,j1);
      end
    else
      write(Fi1,j);
    write(Fi2,j);
  end;
Close(fi1);
Close(Fi2);
ResultFileN(S,3,4);
Rename(Fi2,S);
dataFileN(S,3,4);
dataS('��� �����: ',S,xLeft,2);
dataComment('���������� �����: ',xRight,2);
resultComment('����� ���������� �����: ',0,2);
Pause;
end;

procedure SFil45An28(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SFil45An29(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic1a,Author,Key,63{level});
taskText('���� ��� ����� ������������� ����.',0,2);
taskText('�������� ������� ��\ ����������.',0,4);
(*
����� ����� ������������� �������� �����.
� \UP ����������� ���\ ����� ��������� Rename, �\ \UV \= ��������� Name.
*)
(*==*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
S3 := 'c'+FileName(7) + '.tst';
n1 := Random(3);
n2 := Random(3);
case n1 of
0: begin
     Assign(Fi1,S1);
     rewrite(Fi1);
   end;
1: begin
     Assign(Fr1,S1);
     rewrite(Fr1);
   end;
2: begin
     Assign(Fc1,S1);
     rewrite(Fc1);
   end;
end;
case n2 of
0: begin
     Assign(Fi2,S2);
     rewrite(Fi2);
   end;
1: begin
     Assign(Fr2,S2);
     rewrite(Fr2);
   end;
2: begin
     Assign(Fc2,S2);
     rewrite(Fc2);
   end;
end;
for i := 0 to 10 + Random(30) do
  case n1 of
  0:  begin
        j := Random(51);
        write(Fi1,j);
      end;
  1:  begin
        x := Random*9.99;
        write(Fr1,x);
      end;
  2:  begin
        s0 := FileName(1);
        write(Fc1,s0[1]);
      end;
  end;
for i := 0 to 10 + Random(30) do
  case n2 of
  0:  begin
        j := Random(51);
        write(Fi2,j);
      end;
  1:  begin
        x := Random*9.99;
        write(Fr2,x);
      end;
  2:  begin
        s0 := FileName(1);
        write(Fc2,s0[1]);
      end;
  end;
noEraseNextFile;
case n1 of
0 : begin
      Close(Fi1);
      resultFileN(S1,2,4);
      Rename(Fi1,S3);
    end;
1 : begin
      Close(Fr1);
      resultFileR(S1,2,6);
      Rename(Fr1,S3);
    end;
2 : begin
      Close(Fc1);
      resultFileC(S1,2,4);
      Rename(Fc1,S3);
    end;
end;
noEraseNextFile;
case n2 of
0 : begin
      Close(Fi2);
      resultFileN(S2,4,4);
      Rename(Fi2,S1);
    end;
1 : begin
      Close(Fr2);
      resultFileR(S2,4,6);
      Rename(Fr2,S1);
    end;
2 : begin
      Close(Fc2);
      resultFileC(S2,4,4);
      Rename(Fc2,S1);
    end;
end;
dataS('��� ������� �����: ',S1,xLeft,1);
dataComment('���������� ������� �����:',xRight,1);
dataS('��� ������� �����: ',S2,xLeft,3);
dataComment('���������� ������� �����:',xRight,3);
resultComment('����� ���������� ������� �����:',0,1);
resultComment('����� ���������� ������� �����:',0,3);
case n2 of
0: dataFileN(S1,2,4);
1: dataFileR(S1,2,6);
2: dataFileC(S1,2,4);
end;
case n1 of
0 : begin
      Rename(Fi1,S2);
      dataFileN(S2,4,4);
    end;
1 : begin
      Rename(Fr1,S2);
      dataFileR(S2,4,6);
    end;
2 : begin
      Rename(Fc1,S2);
      dataFileC(S2,4,4);
    end;
end;
Pause;
end;
procedure SFil45An30(Name, Key: string);
var i,j:integer;
    F : file;
begin
start(Name,Topic1a,Author,Key,63{level});(*DEMO*)
taskText('��� ���� ������������� ����.',0,2);
taskText('������� ���\ ����� �\ ����� ������.',0,4);
(*
*)
S2 := 'a'+FileName(7) + '.tst';
S1 := 'b'+FileName(7) + '.tst';

n := Random(3);
noEraseNextFile;
case n of
0: begin
     Assign(Fi1,S1);
     rewrite(Fi1);
     for i := 0 to 10 + Random(30) do
       begin
        j := Random(51);
        write(Fi1,j);
       end;
     Close(Fi1);
     resultFileN(S1,3,4);
   end;
1: begin
     Assign(Fr1,S1);
     rewrite(Fr1);
     for i := 0 to 10 + Random(30) do
       begin
         x := Random*9.99;
         write(Fr1,x);
       end;
     Close(Fr1);
     resultFileR(S1,3,6);
   end;
2: begin
     Assign(Fc1,S1);
     rewrite(Fc1);
     for i := 0 to 10 + Random(30) do
       begin
         s0 := FileName(1);
         write(Fc1,s0[1]);
       end;
     Close(Fc1);
     resultFileC(S1,3,4);
   end;
end;
Assign(F,S1);
Rename(F,S2);
case n of
0: dataFileN(S2,4,4);
1: dataFileR(S2,4,6);
2: dataFileC(S2,4,4);
end;
dataS('��� ��������� �����: ',S2,xLeft,2);
dataS('��� ��� �����: ',S1,xRight,2);
dataComment('���������� ��������� �����:',0,3);
resultComment('���������� ����� ��������� �����:',0,2);
pause;
end;

procedure SFil45An31(Name, Key: string);
var i,j,j1,j2,j3:integer;
    n : array [1..3] of integer;
    S : array [1..4] of string;
    Fc : array [1..4] of file of char;
    Fi : array [1..4] of file of integer;
    Fr : array [1..4] of file of real;

begin
start(Name,Topic1a,Author,Key,63{level});
getVariant(3,2,0,0,code,code1,code2);
dec(Code);
case Code of
0 : begin
taskText('���� ��� ����� ������ �\ ����\ �� ����, ��\ ������� �������.',0,2);
taskText('�������� ���������� ������ �������� ����� ��\ ���������� ������ ���������.',0,4);
(*
*)
    end;
1 : begin
taskText('���� ��� ����� ������ �\ ����\ �� ����, ��\ ������� �������.',0,2);
taskText('�������� ���������� ������ ��������� ����� ��\ ���������� ������ ��������.',0,4);
(*
*)
    end;
end;
(*==*)
repeat
n1 := 100; n2 := 0;
j1 := 1;
j2 := 1;
dataComment('����� ������: ',8,1);
S[4] := '#'+FileName(7) + '.tst';
for i := 1 to 3 do
  begin
    S[i] := chr(96+i)+FileName(7) + '.tst';
    n[i] :=  6 + Random(12);
    if n[i]>n2 then begin n2 := n[i]; j2 := i; end;
    if n[i]<n1 then begin n1 := n[i]; j1 := i; end;
  end;
until (n[1]-n[2])*(n[1]-n[3])*(n[2]-n[3])<>0;
for i := 1 to 3 do
    dataS('',S[i],8+17*i,1);
dataComment('���������� ������: ',0,2);

for i := 1 to 3 do
  if (i<>j1)and(i<>j2) then j3 := i;
n3 := Random(3);
for i:=1 to 3 do
case n3 of
0:begin
    Assign(Fi[i],S[i]);
    Rewrite(Fi[i]);
    for j := 1 to n[i] do
      begin
        j3 := Random(51);
        write(Fi[i],j3);
      end;
    Close(Fi[i]);
  end;
1:begin
    Assign(Fr[i],S[i]);
    Rewrite(Fr[i]);
    for j := 1 to n[i] do
      begin
        x := Random*9.99;
        write(Fr[i],x);
      end;
    Close(Fr[i]);
  end;
2:begin
    Assign(Fc[i],S[i]);
    Rewrite(Fc[i]);
    for j := 1 to n[i] do
      begin
        s0 := FileName(1);
        write(Fc[i],s0[1]);
      end;
    Close(Fc[i]);
  end;
end;
if Code=1 then
  begin
    j := j1;
    j1 := j2;
    j2 :=j;
  end;
Assign(Fc[j2],S[j2]);
Rename(Fc[j2],S[4]);
for i:= 1 to 3 do
  Assign(Fc[i],S[i]);
Reset(Fc[j1]);
Rewrite(Fc[j2]);
for i:= 1 to FileSize(Fc[j1]) do
  begin
    read(Fc[j1],c);
    write(Fc[j2],c);
  end;
Close(Fc[j1]);
Close(Fc[j2]);
for i:=1 to 3 do
  begin
    noEraseNextFile;
    case n3 of
    0:resultFileN(S[i],2+i,4);
    1:resultFileR(S[i],2+i,6);
    2:resultFileC(S[i],2+i,4);
    end;
  end;
Erase(Fc[j2]);
Assign(Fc[j2],S[4]);
Rename(Fc[j2],S[j2]);
for i:=1 to 3 do
    case n3 of
    0:dataFileN(S[i],2+i,4);
    1:dataFileR(S[i],2+i,6);
    2:dataFileC(S[i],2+i,4);
    end;
resultComment('����� ���������� ������:',0,2);
Pause;
end;


procedure SFil45An32(Name, Key: string);
var i,i0,j,k:integer;
    S : array[0..4] of string;

begin
start(Name,Topic1a,Author,Key,63{level});
taskText('���� ������~{S}_{0}, ����� �����~{N} (\l\,4) �\ {N}~������ ������ �\ ����\ �� ����',0,2);
taskText('�\ ������� {S}_{1},~\., {S}_{N}. ���������� ���������� ���� ������',0,3);
taskText('(�\ ��������� �������) �\ ����� ����� �\ ������ {S}_{0}.',0,4);
(*
*)
(*==*)
k := Random(3)+2;
n := Random(3);
if k = 4 then n1 := 1 else n1 := 2;
for i := 1 to k do
  S[i] := chr(48+i) + FileName(1) + '.tst';
S[0] := chr(48) + FileName(1) + '.tst';
case n of
0 : begin
     Assign(Fi0,S[0]);
     rewrite(Fi0);
    end;
1 : begin
     Assign(Fr0,S[0]);
     rewrite(Fr0);
    end;
2 : begin
     Assign(Fc0,S[0]);
     rewrite(Fc0);
    end;
end;
for i := 1 to k do
case n of
0: begin
     Assign(Fi,S[i]);
     rewrite(Fi);
     for i0 := 0 to 6 + Random(15) do
       begin
        j := Random(51);
        write(Fi,j);
        write(Fi0,j);
       end;
     Close(Fi);
     dataFileN(S[i],i+n1,4);
   end;
1: begin
     Assign(Fr,S[i]);
     rewrite(Fr);
     for i0 := 0 to 6 + Random(15) do
       begin
         x := Random*9.99;
         write(Fr,x);
         write(Fr0,x);
       end;
     Close(Fr);
     dataFileR(S[i],i+n1,6);
   end;
2: begin
     Assign(Fc,S[i]);
     rewrite(Fc);
     for i0 := 0 to 6 + Random(15) do
       begin
         s0 := FileName(1);
         write(Fc,s0[1]);
         write(Fc0,s0[1]);
       end;
     Close(Fc);
     dataFileC(S[i],i+n1,4);
   end;
end;
case n of
0: begin
     Close(Fi0);
     resultFileN(S[0],3,4);
   end;
1: begin
     Close(Fr0);
     resultFileR(S[0],3,6);
   end;
2: begin
     Close(Fc0);
     resultFileC(S[0],3,4);
   end;
end;
dataS('S_{0}=',S[0],3,1);
dataN('N = ',k,17,1,1);
for i := 1 to k do
  dataS('S_{'+Chr(48+i)+'}=',S[i],14*(i+1)-4,1);
if k < 4 then dataComment('���������� �������� ������:',0,2);
resultComment('���������� ��������������� �����:',0,2);
Pause;
end;
procedure SFil45An33(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic1a,Author,Key,63{level});
taskText('���� ��� ����� ������ �\ ����\ �� ����.',0,2);
taskText('�������� �\ ������� ����� ���������� ������� �����,',0,3);
taskText('�\ ��\ ������� �����\ \= ���������� �������.',0,4);
(*
*)
(*==*)
S1 := 'a'+FileName(7) + '.tst';
S2 := 'b'+FileName(7) + '.tst';
S3 := '#a'+FileName(6) + '.tst';
S4 := '#b'+FileName(6) + '.tst';
n := Random(3);
n1 := 10 + Random(10);
n2 := 10 + Random(10);
case n of
0: begin
     Assign(Fi1,S3);
     rewrite(Fi1);
     for i := 1 to n1 do
       begin
        j := Random(51);
        write(Fi1,j);
       end;
     Close(Fi1);
     Assign(Fi2,S4);
     rewrite(Fi2);
     for i := 1 to n2 do
       begin
        j := Random(51);
        write(Fi2,j);
       end;
     Close(Fi2);
     n1 := n1 * SizeOf(integer);
     n2 := n2 * SizeOf(integer);
   end;
1: begin
     Assign(Fr1,S3);
     rewrite(Fr1);
     for i := 1 to n1 do
       begin
        x := Random*9.99;
        write(Fr1,x);
       end;
     Close(Fr1);
     Assign(Fr2,S4);
     rewrite(Fr2);
     for i := 1 to n2 do
       begin
        x := Random*9.99;
        write(Fr2,x);
       end;
     Close(Fr2);
     n1 := n1 * SizeOf(real);
     n2 := n2 * SizeOf(real);
   end;
2: begin
     Assign(Fc1,S3);
     rewrite(Fc1);
     for i := 1 to n1 do
       begin
        s0 := FileName(1);
        write(Fc1,s0[1]);
       end;
     Close(Fc1);
     Assign(Fc2,S4);
     rewrite(Fc2);
     for i := 1 to n2 do
       begin
        s0 := FileName(1);
        write(Fc2,s0[1]);
       end;
     Close(Fc2);
   end;
end;
Assign(Fc3,s3);
Reset(Fc3);
Assign(Fc4,s4);
Reset(Fc4);
Assign(Fc1,s1);
Rewrite(Fc1);
for i := 1 to n1 do
  begin
    read(Fc3,c);
    write(Fc1,c);
  end;
for i := 1 to n2 do
  begin
    read(Fc4,c);
    write(Fc1,c);
  end;
Close(Fc1);
Seek(Fc3,0);
Seek(Fc4,0);
Assign(Fc2,s2);
Rewrite(Fc2);
for i := 1 to n2 do
  begin
    read(Fc4,c);
    write(Fc2,c);
  end;
for i := 1 to n1 do
  begin
    read(Fc3,c);
    write(Fc2,c);
  end;
Close(Fc2);
Close(Fc3);
Close(Fc4);
case n of
0: begin
     resultFileN(S1,3,4);
     resultFileN(S2,5,4);
    end;
1:  begin
     resultFileR(S1,3,6);
     resultFileR(S2,5,6);
    end;
2:  begin
     resultFileC(S1,3,4);
     resultFileC(S2,5,4);
    end;
end;
Rename(Fc3,S1);
Rename(Fc4,S2);
case n of
0: begin
     dataFileN(S1,3,4);
     dataFileN(S2,5,4);
    end;
1:  begin
     dataFileR(S1,3,6);
     dataFileR(S2,5,6);
    end;
2:  begin
     dataFileC(S1,3,4);
     dataFileC(S2,5,4);
    end;
end;
dataS('��� ������� �����: ',S1,xLeft,1);
dataS('��� ������� �����: ',S2,xRight,1);
dataComment('���������� ������� �����:',0,2);
dataComment('���������� ������� �����:',0,4);
resultComment('����� ���������� ������� �����:',0,2);
resultComment('����� ���������� ������� �����:',0,4);
Pause;
end;


procedure SFil45An34(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 63{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFil45An35(Name, Key: string);
var i,j:integer;
begin
start(Name,Topic2,Author,Key,63{level});(*DEMO*)
taskText('���� ��� ����� ����� ����� ����������� ������� �\ �������~{S}_A, {S}_B, {S}_C',0,2);
taskText('�\ ������~{S}_D. ������� ����� ���� �\ ������~{S}_D,',0,3);
taskText('�\ ������� ������������\ �� �������� �������� ������',0,4);
taskText('�\ ����� �\ ���\ �� �������:\[ {A}_1,\q {B}_1,\q {C}_1,\q {A}_2,\q {B}_2,\q {C}_2,\q \.~.\]',0,5);
(*
*)
S1 := 'a' + FileName(3) + '.tst';
S2 := 'b' + FileName(3) + '.tst';
S3 := 'c' + FileName(3) + '.tst';
S4 := 'd' + FileName(3) + '.tst';
Assign(Fi1,S1);
rewrite(Fi1);
Assign(Fi2,S2);
rewrite(Fi2);
Assign(Fi3,S3);
rewrite(Fi3);
Assign(Fi4,S4);
rewrite(Fi4);
for i := 0 to 10 + Random(20) do
  begin
    j := Random(51);
    write(Fi1,j);
    write(Fi4,j);
    j := Random(51);
    write(Fi2,j);
    write(Fi4,j);
    j := Random(51);
    write(Fi3,j);
    write(Fi4,j);
  end;
Close(fi1);
Close(fi2);
Close(fi3);
Close(fi4);
dataS('S_A = ',S1,Center(1,4,14,4)-1,1);
dataS('S_B = ',S2,Center(2,4,14,4)-1,1);
dataS('S_C = ',S3,Center(3,4,14,4)-1,1);
dataS('S_D = ',S4,Center(4,4,14,4)-1,1);
dataComment('���������� �������� ������:',0,2);
dataFileN(S1,3,4);
dataFileN(S2,4,4);
dataFileN(S3,5,4);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S4,3,4);
pause;
end;
procedure SFil45An36(Name, Key: string);
var i,j,j1:integer;
    j0 : array[1..3] of integer;
    Fi : array [0..4] of File of integer;
    S : array[0..4] of string;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������ ����� ����� ����� ������� ������� �\ �������~{S}_A, {S}_B, {S}_C, {S}_D',0,2);
taskText('� ������ {S}_E. ������� ����� ���� �\ ������~{S}_E, �\ ������� ������������\ ��',0,3);
taskText('�������� �������� ������ �\ ����� �\ ���\ �� ������� (��� �\ ������� \1).',0,4);
taskText('\<������\> �������� ����� ������� ������ �\ �������������� ���� ��~����������.',0,5);
(*
*)
(*==*)
S[0] := 'a' + FileName(1) + '.tst';
S[1] := 'b' + FileName(1) + '.tst';
S[2] := 'c' + FileName(1) + '.tst';
S[3] := 'd' + FileName(1) + '.tst';
S[4] := 'e' + FileName(1) + '.tst';
for i := 0 to 4 do
  begin
    Assign(Fi[i],S[i]);
    rewrite(Fi[i]);
  end;
for i := 0 to 5 + Random(10) do
  for j := 0 to 3 do
  begin
    j1 := Random(51);
    write(Fi[j],j1);
    write(Fi[4],j1);
  end;
case Random(4) of
0 : begin
      j0[1] := 1; j0[2] := 2; j0[3] := 3;
    end;
1 : begin
      j0[1] := 0; j0[2] := 2; j0[3] := 3;
    end;
2 : begin
      j0[1] := 0; j0[2] := 1; j0[3] := 3;
    end;
3 : begin
      j0[1] := 0; j0[2] := 1; j0[3] := 2;
    end;
end;
for j1 := 1 to 3 do
 for i := 1 to Random(12) + 2 do
  begin
    j := Random(51);
    write(Fi[j0[j1]],j);
  end;
for i := 0 to 4 do
  Close(fi[i]);
dataS('S_A=',S[0],Center(1,5,10,4)-1,1);
dataS('S_B=',S[1],Center(2,5,10,4)-1,1);
dataS('S_C=',S[2],Center(3,5,10,4)-1,1);
dataS('S_D=',S[3],Center(4,5,10,4)-1,1);
dataS('S_E=',S[4],Center(5,5,10,4)-1,1);
dataFileN(S[0],2,4);
dataFileN(S[1],3,4);
dataFileN(S[2],4,4);
dataFileN(S[3],5,4);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S[4],3,4);
Pause;
end;
procedure SFil45An37(Name, Key: string);
var i,k1,k2,k:integer;
    a,a1 : array [1..30] of real;
    a2 : array [1..60] of real;
begin
start(Name,Topic2,Author,Key,63{level});(*DEMO*)
getVariant(8,0,0,0,code,code1,code2);
n1 := 10 + Random(20);
n2 := 10 + Random(20);
n3 := n1;
if n2 > n3 then n3 := n2;
     a[1] := Random; a1[1] := Random;
     k := 1;
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_1 �~{S}_2, �������� �������',0,2);
taskText('����������� ��\ �����������. ���������� ��� ����� �\ ����� ���� �\ ������~{S}_3 ���,',0,3);
taskText('����� ���\ �������� ����� ��������� �������������� �� �����������.',0,4);
(*
*)
for i:=2 to n1 do
  a[i] := a[i-1]+(1+Random(4))*k*Random;
for i:=2 to n2 do
  a1[i] := a1[i-1]+(1+Random(4))*k*Random;
a[n1 + 1] := k*1000;
a1[n2 + 1] := k*1000;
k1 := 1; k2 := 1;
for i := 1 to n1+n2 do
  if k*a[k1]<k*a1[k2] then
    begin
      a2[i]:=a[k1];
      inc(k1);
    end
  else
    begin
      a2[i]:=a1[k2];
      inc(k2);
    end;
S1 := '1'+FileName(7) + '.tst';
S2 := '2'+FileName(7) + '.tst';
S3 := '3'+FileName(7) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
for i := 1 to n1 do
  write(Fr1,a[i]);
Close(Fr1);
Assign(Fr2,S2);
rewrite(Fr2);
for i := 1 to n2 do
  write(Fr2,a1[i]);
Close(Fr2);
Assign(Fr3,S3);
rewrite(Fr3);
for i := 1 to n1+n2 do
  write(Fr3,a2[i]);
Close(Fr3);
dataS('S_1 = ',S1,Center(1,3,18,6),2);
dataS('S_2 = ',S2,Center(2,3,18,6),2);
dataS('S_3 = ',S3,Center(3,3,18,6),2);
dataComment('���������� �������� ������:',0,3);
dataFileR(S1,4,7);
dataFileR(S2,5,7);
resultComment('���������� ����� �����������:',0,2);
resultFileR(S3,3,7);
Pause;
end;

procedure SFil45An38(Name, Key: string);
var i,k1,k2,k3:integer;
    a,a1,a2 : array [1..20] of real;
    a3 : array [1..60] of real;
begin
start(Name,Topic2,Author,Key,63{level});
getVariant(8,0,0,0,code,code1,code2);
dec(Code);
n1 := 10 + Random(10);
n2 := 10 + Random(10);
n3 := 10 + Random(10);
n4 := n1;
if n2 > n4 then n4 := n2;
if n3 > n4 then n4 := n3;
     a[1] :=  n4 - Random; a1[1] := n4 - Random; a2[1] := n4 - Random;
taskText('���� ��� ����� ������������ ����� �\ �������~{S}_1, {S}_2 �~{S}_3, �������� �������',0,2);
taskText('����������� ��\ ��������. ���������� ��� ����� �\ ����� ���� �\ ������~{S}_4 ���,',0,3);
taskText('����� ���\ �������� ����� ��������� �������������� �� ��������.',0,4);
(*
*)
(*==*)
for i:=2 to n1 do
  a[i] := a[i-1]-(1+Random(4))*Random;
for i:=2 to n2 do
  a1[i] := a1[i-1]-(1+Random(4))*Random;
for i:=2 to n3 do
  a2[i] := a2[i-1]-(1+Random(4))*Random;
a[n1 + 1] := -1000;
a1[n2 + 1] := -1000;
a2[n3 + 1] := -1000;
k1 := 1;  k2 := 1; k3 := 1;
for i := 1 to n1+n2+n3 do
  if (a[k1]>a1[k2]) and (a[k1]>a2[k3]) then
    begin
      a3[i]:=a[k1];
      inc(k1);
    end
  else
  if (a1[k2]>a[k1]) and (a1[k2]>a2[k3]) then
    begin
      a3[i]:=a1[k2];
      inc(k2);
    end
  else
    begin
      a3[i]:=a2[k3];
      inc(k3);
    end;
S1 := '1'+FileName(4) + '.tst';
S2 := '2'+FileName(4) + '.tst';
S3 := '3'+FileName(4) + '.tst';
S4 := '4'+FileName(4) + '.tst';
Assign(Fr1,S1);
rewrite(Fr1);
for i := 1 to n1 do
  write(Fr1,a[i]);
Close(Fr1);
Assign(Fr2,S2);
rewrite(Fr2);
for i := 1 to n2 do
  write(Fr2,a1[i]);
Close(Fr2);
Assign(Fr3,S3);
rewrite(Fr3);
for i := 1 to n3 do
  write(Fr3,a2[i]);
Close(Fr3);
Assign(Fr4,S4);
rewrite(Fr4);
for i := 1 to n1+n2+n3 do
  write(Fr4,a3[i]);
Close(Fr4);
dataS('S_1 = ',S1,Center(1,4,16,3),1);
dataS('S_2 = ',S2,Center(2,4,16,3),1);
dataS('S_3 = ',S3,Center(3,4,16,3),1);
dataS('S_4 = ',S4,Center(4,4,16,3),1);
dataComment('���������� �������� ������:',0,2);
dataFileR(S1,3,7);
dataFileR(S2,4,7);
dataFileR(S3,5,7);
resultComment('���������� ����� �����������:',0,2);
resultFileR(S4,3,7);
Pause;
end;


procedure SFil45An39(Name, Key: string);
var i1,i,j,k:integer;
    S : array[0..4] of string;
    Fi : array [0..4] of file of Integer;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������~{S}_{0}, ����� �����~{N} (\l\,4) �\ {N}~������ ����� ����� �\ �������',0,1);
taskText('{S}_{1},~\., {S}_{N}. ���������� ��\ ���������� �\ ����� �����-\I������\i �\ ������~{S}_{0},',0,2);
taskText('��������� ��������� ������: �\ ������ �������� �����-������ �������� �����~{N},',0,3);
taskText('�\ ��������� {N}~��������� �������� ������ (����� ���������) ������� �� ��������',0,4);
taskText('������, �\ ����� ��������������� ����������� ������ ��\ ������� ��������� �����.',0,5);
(*
*)
(*==*)
k := Random(3)+2;
for i := 1 to k do
  S[i] := chr(48+i) + FileName(1) + '.tst';
S[0] := '0' + FileName(1) + '.tst';
Assign(Fi[0],S[0]);
rewrite(Fi[0]);
for i := 0 to k do
write(Fi[0],k);
for i := 1 to k do
  begin
    Assign(Fi[i],S[i]);
    rewrite(Fi[i]);
    n := 5 + Random(10);
    seek(Fi[0],i);
    write(Fi[0],n);
    seek(Fi[0],FileSize(Fi[0]));
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        write(Fi[i],j);
        write(Fi[0],j);
      end;
    Close(Fi[i]);
  end;
Close(Fi[0]);

dataS('S_{0}=',S[0],3,1);
dataN('N = ',k,17,1,1);
if k = 4 then n1 := 1 else n1 := 2;
for i := 1 to k do
  begin
  dataS('S_{'+Chr(48+i)+'}=',S[i],14*(i+1)-4,1);
  dataFileN(S[i],i+n1,5);
  end;
if k < 4 then dataComment('���������� �������� ������:',0,2);
resultFileN(S[0],3,5);
resultComment('���������� �����-������:',0,2);
Pause;
end;
procedure SFil45An40(Name, Key: string);
var i1,i,j,k,k0:integer;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������ {S}, ����� ����� {N} (>\,0) � ����-\I�����\i ����� �����,',0,1);
taskText('���������� ������ ��\ ���������� ������ �\ �������, ���������',0,2);
taskText('�\ ������� \1. ������������ ��\ �����-������ ���� �\ �������~{N}',0,3);
taskText('�\ ���������\ ��� ���\ ������~{S}. ���� ����-����� �������� ������',0,4);
taskText('��\ ����� ��� {N}~������, ��\ �������� �������������� ���� ������.',0,5);
(*
*)
(*==*)
k := Random(5)+2;
case Random(3) of
0..1: k0 := 1 + Random(k);
else k0 := k + 1 + Random(3);
end;
case curtest of //2012
3: k0 := 1 + Random(k);
4: k0 := k + 1 + Random(3);
end;
S1  := Chr(48+k0)+ FileName(7) + '.tst';
S0 := 'a'+FileName(7) + '.tst';
Assign(Fi0,S0);
rewrite(Fi0);
Assign(Fi1,S1);
rewrite(Fi1);
for i := 0 to k do
write(Fi0,k);
for i := 1 to k do
  begin
    n := 5 + Random(10);
    seek(Fi0,i);
    write(Fi0,n);
    seek(Fi0,FileSize(Fi0));
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        if i = k0 then
          write(Fi1,j);
        write(Fi0,j);
      end;
  end;
Close(Fi1);
Close(Fi0);
dataS('S = ', S1,xLeft,2);
dataN('N = ', k0,xRight,2,1);
dataS('��� �����-������: ',S0,xLeft,3);
dataComment('���������� �����-������:',xRight,3);
dataFileN(S0,4,5);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S1,3,5);
Pause;
end;

procedure SFil45An41(Name, Key: string);
var i1,i,j,k,k0:integer;
    a: real;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������~{S} � ����-\I�����\i ����� �����, ���������� ������ ��\ ����������',0,1);
taskText('(��\ ����� �����) ������ �\ �������, ��������� �\ ������� \2.',0,2);
taskText('���\ ������� ��\ ������, ������������ �\ ������, ����� ������� ��������������',0,3);
taskText('���� ���\ ��������� (������������ �����) �\ �������� ��������� �����',0,4);
taskText('(�\ ���\ �� �������) �\ ���� ������������ ����� �\ ������~{S}.',0,5);
(*
*)
(*==*)
k := Random(5)+2;
S1  := '0' + FileName(7) + '.tst';
S0 := 'a'+FileName(7) + '.tst';
Assign(Fi0,S0);
rewrite(Fi0);
Assign(Fr1,S1);
rewrite(Fr1);
for i := 0 to k do
write(Fi0,k);
for i := 1 to k do
  begin
    n := 5 + Random(10);
    seek(Fi0,i);
    write(Fi0,n);
    seek(Fi0,FileSize(Fi0));
    k0 := 0;
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        k0 := k0 + j;
        write(Fi0,j);
      end;
    a := k0/n;
    write(Fr1,a);
  end;
Close(Fr1);
Close(Fi0);
dataS('S = ', S1,0,2);
dataS('��� �����-������: ',S0,xLeft,3);
dataComment('���������� �����-������:',xRight,3);
dataFileN(S0,4,5);
resultComment('���������� ����� �����������:',0,2);
resultFileR(S1,3,6);
Pause;
end;

procedure SFil45An42(Name, Key: string);
var i1,i,j,k:integer;
    S : array[0..4] of string;
    Fi : array [0..4] of file of Integer;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������~{S}_{0}, ����� �����~{N} (\l\,4) �\ {N}~������ ����� �����  �\ �������',0,1);
taskText('{S}_{1},~\., {S}_{N}. ���������� ��\ ���������� �\ ����� �����-\I������\i �\ ������~{S}_{0},',0,2);
taskText('��������������� ��������� � ���� ��������� ������: ������ (����� ���������)',0,3);
taskText('������� ��������� ����� �\ ��� �������� ����� �����, ������ ������� ���������',0,4);
taskText('����� �\ ��� ���\ ��������, \., ������ \Um{N}-��\um ��������� ����� �\ ��� ���\ ��������.',0,5);
(*
*)
(*==*)
k := Random(3)+2;
for i := 1 to k do
  S[i] := chr(48+i) + FileName(1) + '.tst';
S[0] := '0' + FileName(1) + '.tst';
Assign(Fi[0],S[0]);
rewrite(Fi[0]);
for i := 1 to k do
  begin
    Assign(Fi[i],S[i]);
    rewrite(Fi[i]);
    n := 5 + Random(10);
    write(Fi[0],n);
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        write(Fi[i],j);
        write(Fi[0],j);
      end;
    Close(Fi[i]);
  end;
Close(Fi[0]);
dataS('S_{0}=',S[0],3,1);
dataN('N = ',k,17,1,1);
if k = 4 then n1 := 1 else n1 := 2;
for i := 1 to k do
  begin
  dataS('S_{'+Chr(48+i)+'}=',S[i],14*(i+1)-4,1);
  dataFileN(S[i],i+n1,5);
  end;
if k < 4 then dataComment('���������� �������� ������:',0,2);
resultFileN(S[0],3,5);
resultComment('���������� �����-������:',0,2);
Pause;
end;
procedure SFil45An43(Name, Key: string);
var i1,i,j,k,k0:integer;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������ {S}, ����� ����� {N} (>\,0) � ����-\I�����\i ����� �����,',0,1);
taskText('���������� ������ ��\ ���������� ������ �\ �������, ���������',0,2);
taskText('�\ ������� \1. ������������ ��\ �����-������ ���� �\ �������~{N}',0,3);
taskText('�\ ���������\ ��� ���\ ������~{S}. ���� ����-����� �������� ������',0,4);
taskText('��\ ����� ��� {N}~������, ��\ �������� �������������� ���� ������.',0,5);
(*
*)
(*==*)
k := Random(5)+2;
case Random(3) of
0..1: k0 := 1 + Random(k);
else k0 := k + 1 + Random(3);
end;
case curtest of //2012
2: k0 := 1 + Random(k);
3: k0 := k + 1 + Random(3);
end;
S1  := Chr(48+k0)+ FileName(7) + '.tst';
S0 := 'a'+FileName(7) + '.tst';
Assign(Fi0,S0);
rewrite(Fi0);
Assign(Fi1,S1);
rewrite(Fi1);
for i := 1 to k do
  begin
    n := 5 + Random(10);
    write(Fi0,n);
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        if i = k0 then
          write(Fi1,j);
        write(Fi0,j);
      end;
  end;
Close(Fi1);
Close(Fi0);
dataS('S = ', S1,xLeft,2);
dataN('N = ', k0,xRight,2,1);
dataS('��� �����-������: ',S0,xLeft,3);
dataComment('���������� �����-������:',xRight,3);
dataFileN(S0,4,5);
resultComment('���������� ����� �����������:',0,2);
resultFileN(S1,3,5);
Pause;
end;

procedure SFil45An44(Name, Key: string);
var i1,i,j,k:integer;
begin
start(Name,Topic2,Author,Key,63{level});
taskText('���� ������~{S}_1, {S}_2 � ����-\I�����\i ����� �����, ���������� ������',0,1);
taskText('��\ ���������� ������ �\ �������, ��������� �\ ������� \2.',0,2);
taskText('������� ����� ����� ����� ����� �\ �������~{S}_1 �~{S}_2 �\ ��������',0,3);
taskText('�\ ������ �� ��� ��������� �������� ���� ������, ������������ �\ ������,',0,4);
taskText('� �� ������\ \= �������� �������� ���� ������ (�\ ���\ �� �������).',0,5);
(*
*)
(*==*)
k := Random(5)+2;
S1  := '1' + FileName(7) + '.tst';
S2  := '2' + FileName(7) + '.tst';
S0 := 'a'+FileName(7) + '.tst';
Assign(Fi0,S0);
rewrite(Fi0);
Assign(Fi1,S1);
rewrite(Fi1);
Assign(Fi2,S2);
rewrite(Fi2);
for i := 1 to k do
  begin
    n := 5 + Random(10);
    write(Fi0,n);
    for i1 := 1 to n do
      begin
        j := 20 - integer(Random(40));
        write(Fi0,j);
        if i1 = 1 then write(Fi1,j);
        if i1 = n then write(Fi2,j);
      end;
  end;
Close(Fi1);
Close(Fi2);
Close(Fi0);
dataS('S_1 = ', S1,xLeft,2);
dataS('S_2 = ', S2,xRight,2);
dataS('��� �����-������: ',S0,xLeft,3);
dataComment('���������� �����-������:',xRight,3);
dataFileN(S0,4,5);
resultComment('���������� �������������� ������:',0,2);
resultFileN(S1,3,6);
resultFileN(S2,4,6);
Pause;
end;


procedure SFil45An45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 63{level});
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
Topic1 := '�������� �����: �������� ��������';
Topic1a := '��������� ���������������� �������� ������';
Topic2 := '������ � ����������� ��������� �������. �����-������';
{Author := '�.~�.~�������, 2002';}
end.
