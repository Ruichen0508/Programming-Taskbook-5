{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SStr60A4;

{$MODE Delphi}

interface

procedure SStr60An1(Name, Key: string);
procedure SStr60An2(Name, Key: string);
procedure SStr60An3(Name, Key: string);
procedure SStr60An4(Name, Key: string);
procedure SStr60An5(Name, Key: string);
procedure SStr60An6(Name, Key: string);
procedure SStr60An7(Name, Key: string);
procedure SStr60An8(Name, Key: string);
procedure SStr60An9(Name, Key: string);
procedure SStr60An10(Name, Key: string);
procedure SStr60An11(Name, Key: string);
procedure SStr60An12(Name, Key: string);
procedure SStr60An13(Name, Key: string);
procedure SStr60An14(Name, Key: string);
procedure SStr60An15(Name, Key: string);
procedure SStr60An16(Name, Key: string);
procedure SStr60An17(Name, Key: string);
procedure SStr60An18(Name, Key: string);
procedure SStr60An19(Name, Key: string);
procedure SStr60An20(Name, Key: string);
procedure SStr60An21(Name, Key: string);
procedure SStr60An22(Name, Key: string);
procedure SStr60An23(Name, Key: string);
procedure SStr60An24(Name, Key: string);
procedure SStr60An25(Name, Key: string);
procedure SStr60An26(Name, Key: string);
procedure SStr60An27(Name, Key: string);
procedure SStr60An28(Name, Key: string);
procedure SStr60An29(Name, Key: string);
procedure SStr60An30(Name, Key: string);
procedure SStr60An31(Name, Key: string);
procedure SStr60An32(Name, Key: string);
procedure SStr60An33(Name, Key: string);
procedure SStr60An34(Name, Key: string);
procedure SStr60An35(Name, Key: string);
procedure SStr60An36(Name, Key: string);
procedure SStr60An37(Name, Key: string);
procedure SStr60An38(Name, Key: string);
procedure SStr60An39(Name, Key: string);
procedure SStr60An40(Name, Key: string);
procedure SStr60An41(Name, Key: string);
procedure SStr60An42(Name, Key: string);
procedure SStr60An43(Name, Key: string);
procedure SStr60An44(Name, Key: string);
procedure SStr60An45(Name, Key: string);
procedure SStr60An46(Name, Key: string);
procedure SStr60An47(Name, Key: string);
procedure SStr60An48(Name, Key: string);
procedure SStr60An49(Name, Key: string);
procedure SStr60An50(Name, Key: string);
procedure SStr60An51(Name, Key: string);
procedure SStr60An52(Name, Key: string);
procedure SStr60An53(Name, Key: string);
procedure SStr60An54(Name, Key: string);
procedure SStr60An55(Name, Key: string);
procedure SStr60An56(Name, Key: string);
procedure SStr60An57(Name, Key: string);
procedure SStr60An58(Name, Key: string);
procedure SStr60An59(Name, Key: string);
procedure SStr60An60(Name, Key: string);

implementation

uses PT5TaskMaker;

const NS = 115;
      NP = 61;
      slovo: array [0..NS-1] of string[10] =
('������','�������','�������','�����','��������','�������','�����',
'��������','���������','������','�����','����','����','��������',
'����������','���������','��������','�������','�������','�������',
'���������','����������','����������','����������','�����','����������',
'�����','�������','����','���������','���������','����������','����',
'����������','�����','������','�������','�������','���������','��������',
'��������','������','��������','����������','�������','��������',
'����������','����������','�������','���������','������','����������',
'�����','�������','��������','������','�������','������','����������',
'����������','�������','�����','���������','������','�����','��������',
'�����','����������','���������','�����','�����','�������','����������',
'��������','�������','����������','����������','����������','������',
'������','�����','���','�����','����������','����������','����������',
'��������','��������','��������','����������','�����','�������',
'����������','����������','�������','�������','����������','����������',
'������','����������','��������','�������','��������','��������','�����',
'�����','����������','�����','�������','�������','�������','�����',
'������','������','����������');
       predl: array[0..NP-1] of string[80] =
('������ ������ ������� ������ �������, ��� �� �������.',
'�� ���� ������������� ���������� ������ ��, ����� �� ������� ������.',
'����� ����������� ���� �������� �����, ��� ��� ��� �� ������.',
'���� ������ �������������, �� ������ ������� �� ������ ������� ����.',
'����� ��� ��� ����������, �������� ����������.',
'��������� ������ �������� � ��������� �������.',
'��� ����� - ������, ��� �� ����� - ����, ��� �� ����� ����� - ���������.',
'����� ������, ������� ����� ���� ����� �����������, ���������� �����������.',
'���������� ���������, �� ���� ��� ����������.',
'������ ������ ��������, ������� - ������.',
'������ ������� ��������� ����������, ����� ������� ���������� ������ ������.',
'������� ������ ����� �������, ����� ������� ���������� �����.',
'� ���� ������ ������.',
'��� ����� ��������, ���� ������� � ����� ���������� �����.',
'���� ���������� ����� ������� ������, ��� ���������.',
'���� ����� ������ �� ��������, ��������, �������, ����������.',
'���� ����� �� ������������ ������, �� ��� ���� ����������.',
'������� ��� �������� ������, ������ ������� ����� �����.',
'��� ������� �������� �������� �� ������.',
'������ ������ ������� ������ ����� ���������, ���������� ��������� ������.',
'������� �� ��������� ��������� ������� �����������.',
'��� ����� ������ ��������, ������� �� ����� �� ����� ��� ����.',
'����� ������� ��������� ������ ������, ��� ���������.',
'����� ���� ��������, ����� ������ ���������.',
'��, ��� �����, ������� ������ ������� ���.',
'�������� ������ ���� � ������ ������������� �����.',
'�������� ������ ��, ��� �� �����.',
'���� ��� ��� �����, ��� �� ����������, ������, �� �� �����������.',
'��������� ������� ������ �� �������.',
'����� ��� ������ ������ ������, ��� ��� �� ������ �����.',
'������ - ���� �������.',
'����� ������� ������ �� ������, �� ������ �� ������������������.',
'��, ��� �� �������� � �������, ����� �������� ����� ����.',
'�������� ������� ������ �������� �������.',
'����� ���������� ������, ��� � ������ �������� ������ �����.',
'������� ������ ������ �������� ��� �������� ���������.',
'��� ���� ������, ��� ������� ����.',
'����� �������� ��������, ��� ����������.',
'�� ������� ������ ������ ����������, ��� �� �����.',
'������� �� �����, ��� ����, �� ������ ��������, ��� � ������.',
'������� �� ������� � ��������: ���� ����� �� �������� ����� ���� �������.',
'������ ���� � �������� - ����������.',
'������ ������ ������� � ������� ����, ���� �� �������� � ���.',
'��� ������������ ������ ��� ��������, ������� �� ������ ������ �� ���.',
'������� �����������; ������� �����; ������� �������.',
'������ �������� ��, ��� �� �������.',
'������ � ������� ����� �����: ��� ��������� ������� ���� �� �������.',
'������� � ���������� ���� �������� ������� � ���������� ������.',
'��������� - ������, �������� - ������.',
'�� ������������ ����� ������ � ���, ��� ������ ��������� ���������.',
'���� ���� ���� ���������, ���� �� �������� ����.',
'��������� - ��� ���, ��� ���� ������ ������ �����.',
'�� ������� ��� ������� ������ �� ����� ��������� ��� ���������.',
'���������� ������� ������� ��� ����, ����� ��������� �� ������.',
'����� ����� ������ �� ������� - �������� ����������, � ��������� ������.',
'����������� � ����������� ����� �� ���������� �� ����������.',
'������ �������� � ������, � ����� �������������.',
'����������������� ����� ������� ��������������� �������� �� �������.',
'���, ��� ������, �������� ������.',
'���, ��� ������� ���������, ��������, �� ����� �����.',
'���� ���� ���� ���� ���������, �� �� ���� � �������������.');

function digits(N : integer) : string;
const c : string = '0123456789';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(10)+1];
digits := s;
end;

function latsymbs(N : integer) : string;
const c : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
                   'abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(52)+1];
latsymbs := s;
end;

function russymbs(N : integer) : string;
const c : string = '��������������������������������'+
                   '��������������������������������';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(64)+1];
russymbs := s;
end;

function stroka(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'��������������������������������'+
'��������������������������������';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(126)+1];
stroka := s;
end;
function strokaASCII(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(62)+1];
strokaASCII := s;
end;
procedure FileName(var full, disk, dir, name, ext:string);
const c : string = '0123456789abcdefghijklmnopqrstuvwxyz';
var s: string;
    k,i: integer;
begin
disk := chr(random(10)+97)+':';
dir := '\';
for i:=1 to random(5) do
  begin
   s := '';
   for k:=1 to random(8)+1 do
      s := s + c[Random(36)+1];
// 01.2007
   if (length(s)>3) and (random(3)=0) then
     insert('.',s,length(s)-Random(3));
// =======
   dir := dir + s + '\';
  end;
name := '';
for i:=1 to random(8)+1 do
   name := name + c[Random(36)+1];
ext := '';
if Random(3) <> 0 then
begin
for i:=1 to random(4) do
   ext := ext + c[Random(36)+1];

full := disk + dir + name + '.' + ext;
end
else
full := disk + dir + name;
end;

var s,s0,s1,s2,s3,s4: string;
    k,n,m,n1,n2,k1,k2: integer;
    c,c1,c2: char;
    Topic, Topic1, Topic2, Topic3, Author : string;
    var count: integer;

procedure SStr60An1(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('��� ������~{C}. ������� ��� \I���\i (�.\,�. ����� �\ ������� �������).',0,3);
(*
��� ����������� �������� ������ ������� ������� ������������ ������� Ord. 
*)
(*==*)
n := Random(95)+32;
dataC('C = ',chr(n),0,3);
resultN('��� ������� C: ',n,0,3,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An2(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('���� ����� �����~{N} (32~\l~{N}~\l~126). ������� ������ �\ �����, ������~{N}.',0,3);
(*
��� ����������� ������� �\ ������ ������� ������� ������� ������������ ������� Chr. 
*)
(*==*)
n := Random(95)+32;
dataN('N = ',n,0,3,3);
resultC('������ � ����� N: ',chr(n),0,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An3(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('��� ������~{C}. ������� ��� �������,',0,2);
taskText('������ ��\ ������� ������������ �������~{C} �\ ������� �������,',0,3);
taskText('�\ ������ ������� ��\ ��������~{C}.',0,4);
(*
*)
(*==*)
n := Random(93)+33;
dataC('C = ',chr(n),0,3);
resultC('',chr(n-1),xLeft,3);
resultC('',chr(n+1),xRight,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An4(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('���� ����� �����~{N} (1~\l~{N}~\l~26).',0,2);
taskText('������� {N}~������ \I���������\i (�.\,�. ���������) ���� ���������� ��������.',0,4);
(*
*)
(*==*)
n := Random(18)+1;
dataN('N = ',n,0,3,2);
for i := 1 to n do
  resultC('',chr(ord('A')-1+i),center(i,n,3,1),3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('���� ����� �����~{N} (1~\l~{N}~\l~26).',0,2);
taskText('������� {N}~��������� \I��������\i (�.\,�. ���������) ���� ���������� ��������',0,3);
taskText('�\ �������� ������� (������� �\ ����� \<z\>).',0,4);
(*
*)
(*==*)
n := Random(18)+1;
dataN('N = ',n,0,3,2);
for i := 1 to n do
  resultC('',chr(ord('z')+1-i),center(i,n,3,1),3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('��� ������~{C}, ������������ ����� ���\ ����� (��������� ���\ �������).',0,2);
taskText('����~{C} ���������� �����, ��\ ������� ������ \<digit\>, ���� ��������� �����\ \=',0,3);
taskText('������� ������ \<lat\>, ���� �������\ \= ������� ������ \<rus\>.',0,4);
(*
����� ���������, ��������\ �� ������~{C} ������, ����� ������������
�������� ��������� ({C}\;\g\;\<0\>) And ({C}\;\l\;\<9\>) ���\
(�\ ����� \UP) �������� \I�������������� ���������\i: \MC~in~['0'..'9']\m.
����� ������������� ����������.
*)
(*==*)
n := Random(3);
case curtest of //2012
2: n := 1;
4: n := 2;
5: n := 0;
end;
case n of
0: begin
   s := digits(1);
   c := s[1];
   s := 'digit';
   end;
1: begin
   s := latSymbs(1);
   c := s[1];
   s := 'lat';
   end;
2: begin
   s := rusSymbs(1);
   c := s[1];
   s := 'rus';
   end;
end;
dataC('C = ',c,0,3);
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60An7(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� �������� ������. ������� ���� ��\ ������� �\ ���������� �������.',0,3);
(*
��� ������� �\ {i}-�� ������� ������~{S} �\ ����� \UP ���������� ���������
�\ ������ �������� �������������� (��� �\ �������� �������): \MS[i]\m.
�\ ����� \UV ������� ������������ ������� Mid.
*)
(*==*)
s := strokaASCII(Random(15)+4);
dataS('',s,0,3);
resultN('��� ������� �������:    ',Ord(s[1]),0,2,3);
resultN('��� ���������� �������: ',Ord(s[length(s)]),0,4,3);
setNumberOfTests(3);
Pause;
end;


procedure SStr60An8(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ����� �����~{N} (>\,0) �\ ������~{C}.',0,2);
taskText('������� ������ �����~{N}, ������� ������� ��\ ��������~{C}.',0,4);
(*
*)
(*==*)
   n := Random(14)+1;
   s := latsymbs(1);
   c := s[1];
   for i := 1 to n-1 do s := s + c;
   dataN('N = ',n,0,2,2);
   dataC('C = ',c,0,4);
   resultS('',s,0,3);
setNumberOfTests(5);
Pause;
end;





procedure SStr60An9(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('���� ������ �����~{N} (>\,0) �\ �������~{C}_1 �~{C}_2. ������� ������ �����~{N},',0,2);
taskText('������� ������� ��\ ������������ ��������~{C}_1 �~{C}_2, ������� �~{C}_1.',0,4);
(*
������� ����� ������� ���������� � �.\,10.3.
*)
   n := (Random(10)+1)*2;
s := latsymbs(1);
c1 := s[1];
s := digits(1);
c2 := s[1];
s := '';
for i:=1 to n div 2 do
  s := s + c1 + c2;
dataN('N = ',n,0,2,2);
dataC('C_1 = ',c1,xLeft,4);
dataC('C_2 = ',c2,xRight,4);
resultS('',s,0,3);
setNumberOfTests(5);
pause;
end;



procedure SStr60An10(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('���� ������. ������� ������, ���������� ��\ ��\ �������,',0,2);
taskText('��\ ������������� �\ �������� �������.',0,4);
(*
������� ����� ������� ���������� � �.\,10.3.
*)
s := stroka(Random(15)+4);
dataS('',s,0,3);
s0 := s;
n := Length(s);
for i := 1 to n do
  s0[i] := s[n-i+1];
resultS('',s0,0,3);
setNumberOfTests(3);
pause;
end;

procedure SStr60An11(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� �������� ������~{S}. ������� ������, ���������� ������� ������~{S},',0,2);
taskText('����� �������� ��������� �� ������ �������.',0,4);
(*
*)
(*==*)
s := stroka(Random(15)+4);
dataS('S = ',s,0,3);
s0 := s[1];
n := Length(s);
for i := 2 to n do
  s0 := s0 + ' '+s[i];
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An12(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� �������� ������~{S} �\ ����� �����~{N} (>\,0). ������� ������, ����������',0,2);
taskText('������� ������~{S}, ����� �������� ��������� ��\ {N}~�������� \<*\> (���������).',0,4);
(*
*)
(*==*)
repeat
s := stroka(Random(15)+4);
n := Random(5)+1;
s0 := s[1];
for i := 2 to Length(s) do
begin
  for j := 1 to n do
    s0 := s0 + '*';
  s0 := s0 + s[i];
end;
until length(s0)<75;
dataS('S = ',s,0,2);
dataN('N = ',n,0,4,1);
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;




procedure SStr60An13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60An14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SStr60An15(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������. ���������� ���������� ������������ � ��� ����.',0,3);
(*
*)
   end;
2: begin
taskText('���� ������. ���������� ����������',0,2);
taskText('������������ �\ ��� ��������� ��������� ����.',0,4);
(*
*)
   end;
3: begin
taskText('���� ������. ���������� ����� ����������',0,2);
taskText('������������ �\ ��� �������� ��������� �\ ������� ����.',0,4);
(*
*)
   end;
end;
(*==*)
s := stroka(Random(20)+10);
dataS('',s,0,3);
n := 0;
for i := 1 to length(s) do
  case v1 of
  1 : if s[i] in ['0'..'9'] then inc(n);
  2 : if s[i] in ['A'..'Z'] then inc(n);
  3 : if s[i] in ['�'..'�','�'..'�','a'..'z'] then inc(n);
  end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;



procedure SStr60An16(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(2, 3, 0, 0, v1, v2, v3);
case v1 of
1: taskText('���� ������. ������������� �\ ��� ���\ ��������� ��������� ����� �\ ��������.',0,3);
(*
*)
2: begin
   taskText('���� ������. ������������� �\ ��� ���\ �������� �����',0,2);
   taskText('(���\ ���������, ��� �\ �������) �\ ���������.',0,4);
(*
*)
end;
3: begin
   taskText('���� ������. ������������� �\ ��� ���\ �������� �����',0,2);
   taskText('(���\ ���������, ��� �\ �������) �\ ���������, �\ ���������\ \= �\ ��������.',0,4);
(*
*)
end;
end;
(*==*)
s := stroka(Random(15)+10);
dataS('',s,0,3);
s0 := s;
for i := 1 to length(s) do
  case v1 of
  1:  if s[i] in ['A'..'Z'] then s0[i] := Chr(Ord(s[i])+32);
  2:  begin
         if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32)
         else
           if Pos(s[i],c2)<>0 then s0[i] := c1[Pos(s[i],c2)];
       end;
  3:  begin
         if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32)
         else
         if s[i] in ['A'..'Z'] then s0[i] := Chr(Ord(s[i])+32)
         else
           if Pos(s[i],c2)<>0 then s0[i] := c1[Pos(s[i],c2)]
         else
           if Pos(s[i],c1)<>0 then s0[i] := c2[Pos(s[i],c1)]
       end;
  end;
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;
procedure SStr60An17(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('���� ������. ���� ��� ������������ ����� ������ ������ �����,',0,1);
taskText('��\ �������~1, ���� ������������� (�\ ������� ������)\ \= �������~2;',0,2);
taskText('���� ������ ������ ������������� �\ �����, ��\ �������~0.',0,3);
taskText('�������, ���\ ������� ����� ������������� �����',0,4);
taskText('���������� ��\ ���\ ����� ����� ���������� \I������\i~\<.\>.',0,5);
(*
� ����� \UP ����������� ��������� Val.
*)
n := Random(3);
case curtest of //2012
3: n := 2;
5,6: n := 0;
7: n := 1;
end;
case n of
0 : case Random(3) of
    0 : s := stroka(random(7)+5)+chr(random(60)+65);
    1 : begin
          Str(random*10000-5000:0:random(5)+2,s);
          Insert('-',s,Random(length(s))+ 2);
        end;
    2 : begin
          Str(random*10000-5000:0:random(5)+2,s);
          Insert('.',s,Random(length(s))+1);
        end;
    end;
1 : Str(integer(random(20000))-10000,s);
2 : Str(random*10000-5000:0:random(5)+2,s);
end;
dataS('',s,0,3);
n := n;
resultN('',n,0,3,1);
setNumberOfTests(9);
pause;
end;
procedure SStr60An18(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
     taskText('���� ����� ������������� �����. ������� �������,',0,2);
     taskText('������������ ����� ����� ����� (�\ ������� ����� �������).',0,4);
(*
����������� ��������� Str. ������� �������� �������� ��\ ��,
���\ ������� ��������� ��\ ������, �\ \I������ ��������\i.
*)
   end;
2: begin
     taskText('���� ����� ������������� �����. ������� �������,',0,2);
     taskText('������������ ����� ����� ����� (�\ ������� ������ ������).',0,4);
(*
+
*)
   end;
end;
(*==*)
n := Random(32100)+ 10;
dataN('',n,0,3,5);
Str(n,s);
Str(length(s),s0);
resultComment('����� �� '+s0+' ��������:',0,2);
for i := 1 to Length(s) do
case v1 of
1 : resultC('',s[i],center(i,length(s),3,5),4);
2 : resultC('',s[length(s)-i+1],center(i,length(s),3,5),4);
end;
setNumberOfTests(4);
Pause;
end;

procedure SStr60An19(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� ������, ������������ ����� ������������� �����.',0,2);
taskText('������� ����� ���� ����� �����.',0,4);
(*
��� ���� ����� ��\ �������~{c}, ������������� �����, ����������
��������������� �����, ����� ��������������� ��������� ����������:
Ord({c})\,\-\,Ord(\<0\>).
*)
(*==*)
k := 1+random(32000);
Str(k,s);
dataS('',s,0,3);
m := 0;
for i := 1 to length(s) do
  begin
  s0 := s[i];
  val(s0,k1,k);
  m := m + k1;
  end;
resultN('',m,0,3,3);
setNumberOfTests(4);
Pause;
end;

function Vir2 : string;
var i : integer; s : string;
begin
s := chr(48+Random(10));
for i := 1 to Random(7) do
  begin
  case Random(2) of
  0: s := s + '+';
  1: s := s + '-';
  end;
  s := s + chr(48+Random(10));
  end;
Vir2 := s;
end;

function Calc2(s : string) : integer;
var count : integer;
function vir : integer;
var i : integer; z : char;
begin
i :=ord(s[count])-48;  dec(count);
if (count>0) and (s[count]in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir + i;
    '-': i := vir - i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc2 := vir;
end;



procedure SStr60An20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('���� ������, ������������ �������������� ��������� ����', 0, 2);
  TaskText('\<<�����>\+<�����>\+\.\+<�����>\>, ��� �� ����� ����� �������� \<\+\>', 0, 3);
  TaskText('��������� ������ \<+\> ��� \<\-\> (��������, \<4+7\-2\-8\>).', 0, 4);
  TaskText('������� �������� ������� ��������� (����� �����).', 0, 5);
(*
*)
(*==*)
repeat
count := 0;
s := Vir2;
n := Calc2(s);
until (n>-10) and (n<99);
dataS('',s,0,3);
resultN('',n,0,3,3);
setNumberOfTests(9);
Pause;
end;




procedure SStr60An21(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ������������ �������� ������ ������ �������������� �����.',0,2);
taskText('������� ������, ������������ ���������� ������ �����\ �� �����.',0,4);
(*
*)
end;
2: begin
taskText('���� ������, ������������ ���������� ������ ������ �������������� �����.',0,2);
taskText('������� ������, ������������ �������� ������ �����\ �� �����.',0,4);
(*
*)
end;
end;
(*==*)
case v1 of
1 : begin
      n := 3+Random(8);
      k := 0;
      m := 1;
      s := '';
      for i := 1 to n-1 do
        if Random(2)=0 then
          begin
            s := '0'+s;
            m := m * 2;
          end
        else
          begin
            s := '1'+s;
            k := k + m;
            m := 2*m;
          end;
      s := '1'+s;
      k := k + m;
      m := 2*m;
      Str(k,s0);
   end;
2 : begin
      n := 1+Random(1000);
      Str(n,s);
      m := 512;
      k := 0;
      s0 := '';
      for i := 1 to 10 do
        begin
          if n div m = 1 then s0 := s0+'1'
          else s0 := s0+'0';
          n := n mod m;
          m := m div 2;
        end;
      m := 0;
      for i := 1 to length(s0) do
        if s0[i]='1' then break
        else Inc(m);
      s0 := Copy(s0,m+1,length(s0));
   end;
end;
dataS('',s,0,3);
resultS('',s0,0,3);
setNumberOfTests(4);
Pause;
end;


procedure SStr60An22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60An23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SStr60An24(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� ����� �����~{N} (>\,0) �\ ������~{S}. ������������� ������~{S} �\ ������ �����~{N}',0,2);
taskText('��������� �������: ���� ����� ������~{S} ������~{N},',0,3);
taskText('��\ ��������� ������ �������, ���� ����� ������~{S} ������~{N},',0,4);
taskText('��\ �\ ��\ ������ �������� �������~\<.\> (�����).',0,5);
(*
*)
(*==*)
s := strokaASCII(2 + Random(13));
n := 2 + Random(13);
case curtest of //2012
3: while length(s) >= n do n := 10 + Random(8);
4: while length(s) <= n do n := 1 + Random(6);
end;
dataN('N = ',n,0,2,1);
dataS('S = ',s,0,4);
if length(s) > n then s := copy(s,length(s)-n+1,n)
else
  for i:=length(s)+1 to n do
     s := '.'+s;
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60An25(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� ����� ������������� �����~{N}_1 �~{N}_2 � ������~{S}_1 �~{S}_2.',0,2);
taskText('�������� ��\ ���� ����� ����� ������, ���������� ������ {N}_1~��������',0,3);
taskText('������~{S}_1 �\ ��������� {N}_2~�������� ������~{S}_2 (�\ ��������� �������).',0,4);
(*
*)
(*==*)
s1 := strokaASCII(10 + Random(13));
s2 := strokaASCII(10 + Random(13));
k1 := random(length(s1)-1)+2;
k2 := random(length(s2)-1)+2;
dataN('N_1 = ',k1,xLeft,2,1);
dataN('N_2 = ',k2,xRight,2,1);
dataS('S_1 = ',s1,xLeft,4);
dataS('S_2 = ',s2,xRight,4);
s := copy(s1,1,k1) + copy(s2,length(s2)-k2+1,k2);
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60An26(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('��� ������~{C} �\ ������~{S}.',0,2);
taskText('������� ������ ��������� �������~{C} �\ ������~{S}.',0,4);
(*
�������� �������� ������� ��������� �\ ����� ������
*)
(*==*)
s1 := strokaASCII(Random(10)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s2 := '';
for i := 1 to k do
  begin
  s2 := s2 + s1[i];
  if s1[i]=c1 then s2 := s2 + c1;
  end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,0,4);
resultS('',s2,0,3);
setNumberOfTests(6);
Pause;
end;


procedure SStr60An27(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('��� ������~{C} �\ ������~{S}, {S}_0.',0,2);
taskText('����� ������ ���������� �������~{C} �\ ������~{S} �������� ������~{S}_0.',0,4);
(*
*)
s1 := strokaASCII(Random(8)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
s2 := strokaASCII(2+Random(3));
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s3 := '';
for i := 1 to k do
    begin
       if s1[i]=c1 then s3 := s3 + s2;
       s3 := s3 + s1[i];
      end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,xLeft,4);
dataS('S_0 = ',s2,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
pause;
end;


procedure SStr60An28(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('��� ������~{C} �\ ������~{S}, {S}_0.',0,2);
taskText('����� ������� ��������� �������~{C} �\ ������~{S} �������� ������~{S}_0.',0,4);
(*
*)
(*==*)
s1 := strokaASCII(Random(8)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
s2 := strokaASCII(2+Random(3));
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s3 := '';
for i := 1 to k do
    begin
       s3 := s3 + s1[i];
       if s1[i]=c1 then s3 := s3 + s2;
      end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,xLeft,4);
dataS('S_0 = ',s2,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;




procedure SStr60An29(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� ������~{S} �~{S}_0. ���������, ����������\ ��',0,2);
taskText('������~{S}_0 �\ ������~{S}. ���� ����������, ��\ ������� \t,',0,3);
taskText('���� ��\ ����������, ��\ ������� \f.',0,4);
(*
*)
(*==*)
s1 := strokaASCII(Random(5)+20);
n:=random(3);
case curtest of //2012
3: n := 0;
5: n := 1;
end;
s2 := strokaASCII(Random(4)+3);
if n=0 then
    k := pos(s2,s1)
else
  begin
    if pos(s2,s1) <> 0 then k := pos(s2,s1)
    else
      begin
        k := Random(length(s1)-length(s2))+1;
        for i := 1 to length(s2) do
          s1[k+i-1] := s2[i];
      end;
  end;
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultB('',k<>0,0,3);
setNumberOfTests(9);
Pause;
end;
procedure SStr60An30(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('���� ������~{S} �~{S}_0.',0,2);
taskText('����� ���������� ��������� ������~{S}_0 �\ ������~{S}.',0,4);
(*
*)
(*==*)
n:=random(7);
if n>5 then n:=0;
case curtest of //2012
2: n := 1+random(5);
4: n := 0;
end;
s2 := strokaASCII(Random(4)+3);
s1 := strokaASCII(Random(5));
for i := 1 to n do
  s1 := s1 + s2 + strokaASCII(Random(5));
s1 := s1 +strokaASCII(Random(5));
if length(s1)<25 then
  s1 := strokaASCII(5) + s1 + strokaASCII(20-length(s1));
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultN('',n,0,3,1);
setNumberOfTests(6);
Pause;
end;
procedure SStr60An31(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������~{S} �~{S}_0.',0,2);
taskText('������� ��\ ������~{S} ������ ���������, ����������� �~{S}_0.',0,3);
taskText('���� ����������� ��������\ ���, ��\ ������� ������~{S} ���\ ���������.',0,4);
(*
*)
end;
2: begin
taskText('���� ������~{S} �~{S}_0.',0,2);
taskText('������� ��\ ������~{S} ��������� ���������, ����������� �~{S}_0.',0,3);
taskText('���� ����������� ��������\ ���, ��\ ������� ������~{S} ���\ ���������.',0,4);
(*
*)
end;
3: begin
taskText('���� ������~{S} �~{S}_0.',0,2);
taskText('������� ��\ ������~{S} ���\ ���������, ����������� �~{S}_0.',0,3);
taskText('���� ����������� ��������\ ���, ��\ ������� ������~{S} ���\ ���������.',0,4);
(*
*)
end;
end;
(*==*)
n:=random(7);
if n>5 then n:=0;
case curtest of //2012
3: n := 1+random(5);
5: n := 0;
end;
s2 := strokaASCII(Random(3)+3);
s1 := strokaASCII(Random(5));
s3 := s1;
for i := 1 to n do
  case v1 of
1:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=1 then s3 := s3+s
  else
    s3 := s3+s2+s;
  end;
2:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=n then s3 := s3+s
  else
    s3 := s3+s2+s;
  end;
3:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  s3 := s3 + s;
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
s3 := s3 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  s3 := s + s3 + s4;
  end;
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;
procedure SStr60An32(Name, Key: string);
label 1;
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������~{S}, {S}_1 �~{S}_2.',0,2);
taskText('�������� �\ ������~{S} ������ ��������� ������~{S}_1 ��\ ������~{S}_2.',0,4);
(*
*)
end;
2: begin
taskText('���� ������~{S}, {S}_1 �~{S}_2.',0,2);
taskText('�������� �\ ������~{S} ��������� ��������� ������~{S}_1 ��\ ������~{S}_2.',0,4);
(*
*)
end;
3: begin
taskText('���� ������~{S}, {S}_1 �~{S}_2.',0,2);
taskText('�������� �\ ������~{S} ���\ ��������� ������~{S}_1 ��\ ������~{S}_2.',0,4);
(*
*)
end;
end;
(*==*)
n:=1 + random(5);
1 : s2 := strokaASCII(Random(3)+3);
    s0 := strokaASCII(Random(3)+3);
if length(s2) = length(s0) then goto 1;
s1 := strokaASCII(Random(5));
s3 := s1;
for i := 1 to n do
  case v1 of
1:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=1 then s3 := s3+s0 + s
  else
    s3 := s3+s2+s;
  end;
2:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=n then s3 := s3+s0+s
  else
    s3 := s3+s2+s;
  end;
3:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  s3 := s3 + s0 + s;
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
s3 := s3 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  s3 := s + s3 + s4;
  end;
dataS('S = ',s1,0,2);
dataS('S_1 = ',s2,xLeft,4);
dataS('S_2 = ',s0,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;
procedure SStr60An33(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ���������, ������������� ����� ������ �\ ������ ��������',0,3);
taskText('�������� ������. ���� ������ �������� ������ ���� ������,',0,4);
taskText('��\ ������� ������ ������.',0,5);
(*
*)
end;
2: begin
taskText('���� ������, ���������� ��\ ������� ���� ���� ������ �������.',0,2);
taskText('������� ���������, ������������� ����� ������ �\ ��������� ��������',0,3);
taskText('�������� ������. ���� ������ �������� ������ ���� ������,',0,4);
taskText('��\ ������� ������ ������.',0,5);
(*
*)
end;
end;
(*==*)
n:=random(11)+1;
if n>8 then n:=1;
case curtest of //2012
2: n := 1;
5: n := 1+random(8);
end;
s1 := strokaASCII(Random(5));
s3 := '';
for i := 1 to n do
  begin
  s := strokaASCII(Random(5)+3);
  s1 := s1 + ' ' + s;
  case v1 of
  1:  if i=1 then s3 := s;
  2:  if i=1 then s3 := s
      else
        if i < n then
          s3 := s3 + ' ' + s
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  end;
if n<2 then s3 := '';
dataS('',s1,0,3);
resultS('',s3,0,3);
setNumberOfTests(8);
Pause;
end;

procedure SStr60An34(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SStr60An35(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('���� ������, ��������� ��\ ������� ����, ����������� ���������',0,2);
taskText('(����� ���\ �����������). ����� ���������� ���� �\ ������.',0,4);
(*
������� ����� ������� ���������� �\ �.\,10.3.
*)
repeat
s := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s := s + slovo[random(NS)];
    for i := 1 to random(5)+1 do
      s := s + ' ';
  end;
s := s + slovo[random(NS)];
until length(s)<77;
dataS('',s,0,3);
resultN('',n,0,3,1);
setNumberOfTests(5);
pause;
end;
procedure SStr60An36(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,2);
taskText('�\ ����������� ��������� (����� ���\ �����������). ����� ���������� ����,',0,3);
taskText('������� ���������� �\ ������������� ����� �\ ���\ �� ������.',0,4);
(*
*)
end;
2: begin
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,2);
taskText('�\ ����������� ��������� (����� ���\ �����������). ����� ���������� ����,',0,3);
taskText('������� �������� ����\ �� ���� �����~\<�\>.',0,4);
(*
*)
end;
end;
(*==*)
repeat
s := '';
n := random(6)+2;
k1 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    case v1 of
    1:    if s1[1] = s1[length(s1)] then inc(k1);
    2:    if pos('�',s1)>0 then inc(k1);
    end;
  end;
s1 := slovo[random(NS)];
s := s + s1;
case v1 of
1:    if s1[1] = s1[length(s1)] then inc(k1);
2:    if pos('�',s1)>0 then inc(k1);
end;
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An37(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,2);
taskText('�\ ����������� ��������� (����� ���\ �����������). ����� ���������� ����,',0,3);
taskText('������� �������� ����� ���\ �����~\<�\>.',0,4);
(*
*)
repeat
s := '';
n := random(6)+2;
k1 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    k2 := 0;
    for i := 1 to length(s1) do
      if s1[i] = '�' then inc(k2);
    if k2=3 then inc(k1);
  end;
s1 := slovo[random(NS)];
s := s + s1;
k2 := 0;
for i := 1 to length(s1) do
  if s1[i] = '�' then inc(k2);
if k2=3 then inc(k1);
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An38(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('���� ������, ��������� ��\ ������� ����, ����������� ���������',0,2);
taskText('(����� ���\ �����������). ����� ����� ������ ��������� �����.',0,4);
(*
*)
end;
2: begin s0 := '';
taskText('���� ������, ��������� ��\ ������� ����, ����������� ���������',0,2);
taskText('(����� ���\ �����������). ����� ����� ������ �������� �����.',0,4);
(*
*)
end;
end;
(*==*)
repeat
s := '';
n := random(6)+2;
k1 := 20; k2 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    if length(s1)<k1 then k1 := length(s1);
    if length(s1)>k2 then k2 := length(s1);
  end;
s1 := slovo[random(NS)];
s := s + s1;
if length(s1)<k1 then k1 := length(s1);
if length(s1)>k2 then k2 := length(s1);
until length(s)<77;
dataS('',s,0,3);
case v1 of
1:   resultN('',k1,0,3,2);
2:   resultN('',k2,0,3,2);
end;
setNumberOfTests(5);
Pause;
end;
procedure SStr60An39(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('���� ������, ��������� ��\ ������� ����, ����������� ���������',0,2);
taskText('(����� ���\ �����������). ������� ������, ���������� ���\ �� �����,',0,3);
taskText('����������� ����� �������� \<.\> (�����). �\ ����� ������ ����� ��\ �������.',0,4);
(*
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s2 := s2 + s1 + '.';
  end;
s1 := slovo[random(NS)];
s := s + s1;
s2 := s2 + s1;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An40(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,1);
taskText('�\ ����������� ��������� (����� ���\ �����������). ������������� ������ �����',0,2);
taskText('�\ ������, ������� �\ ��� ���\ ����������� ��������� ���\ ������ �����',0,3);
taskText('��\ ������ \<.\> (�����). ��������, ����� \<�������\> ���� �������������',0,4);
taskText('�\ \<����.�.\>. ���������� �������� ����� ������� ��\ ��������.',0,5);
(*
*)
end;
2: begin
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,1);
taskText('�\ ����������� ��������� (����� ���\ �����������). ������������� ������ �����',0,2);
taskText('�\ ������, ������� �\ ��� ���\ ���������� ��������� ���\ ��������� �����',0,3);
taskText('��\ ������ \<.\> (�����). ��������, ����� \<�������\> ���� �������������',0,4);
taskText('�\ \<.���.��\>. ���������� �������� ����� ������� ��\ ��������.',0,5);
(*
*)
end;
end;
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    case v1 of
    1 : c1 := s1[1];
    2 : c1 := s1[length(s1)];
    end;
    s3 := '';
    for i := 1 to length(s1) do
      case v1 of
      1 : if (s1[i] <> c1) or (i = 1) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
      2 : if (s1[i] <> c1) or (i = length(s1)) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
      end;
    s2 := s2 + s3;
    for i := 1 to random(5)+1 do
      begin
      s := s + ' ';
      s2 := s2 + ' ';
      end;
  end;
s1 := slovo[random(NS)];
case v1 of
1 : c1 := s1[1];
2 : c1 := s1[length(s1)];
end;
s3 := '';
for i := 1 to length(s1) do
 case v1 of
 1 : if (s1[i] <> c1) or (i = 1) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
 2 : if (s1[i] <> c1) or (i = length(s1)) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
 end;
s := s + s1;
s2 := s2 + s3;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;

procedure SStr60An41(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('���� ������, ��������� ��\ ������� ����, ����������� ���������',0,2);
taskText('(����� ���\ �����������). ������� ������, ���������� ���\ �� �����,',0,3);
taskText('����������� ����� �������� �\ ������������� �\ �������� �������.',0,4);
(*
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s2 :=  ' ' + s1 +s2;
  end;
s1 := slovo[random(NS)];
s := s + s1;
s2 := s1 + s2;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;


procedure SStr60An42(Name, Key: string);
var i,k:integer;
    s0 : array [1..7] of string[20];
begin
start(Name,Topic2,Author,Key,60{level});
taskText('���� ������, ��������� ��\ ������� ����, ��������� ���������� �������',0,2);
taskText('�\ ����������� ��������� (����� ���\ �����������). ������� ������, ����������',0,3);
taskText('���\ �� �����, ����������� ����� �������� �\ ������������� �\ ���������� �������.',0,4);
(*
���������� ������������ ������ ����,
������������� ��� ��\ ����������� �\ ���������� ��������
������� �\ ���� ������.
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s0[k] := s1;
  end;
s1 := slovo[random(NS)];
s := s + s1;
s0[n] := s1;
until length(s)<77;
for k := 1 to n-1 do
  for i := 1 to n-k do
    if s0[i]>s0[i+1] then
      begin
      s1 := s0[i];
      s0[i] := s0[i+1];
      s0[i+1] := s1;
      end;
s2 := s0[1];
for i := 2 to n do
s2 := s2 + ' ' + s0[i];
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(9);
Pause;
end;
procedure SStr60An43(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('���� ������-����������� ��\ ������� �����. ������������� ������ ���,',0,2);
taskText('����� ������ ����� ���������� �\ ��������� �����. \I������\i �������',0,3);
taskText('����� ��������, ��\ ���������� �������� �\ ������������ ���������',0,4);
taskText('���\ �������/������ ������. �����, ��\ ������������ �\ �����, ��\ ��������.',0,5);
(*
*)
(*==*)
s := predl[Random(NP)];
s1 := s;
for i:=2 to length(s) do
  if (s[i]<>' ') and (s[i-1]=' ') then
    if Pos(s[i],c2)<>0 then
      s[i] := c1[Pos(s[i],c2)];
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An44(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������-����������� ��\ ������� �����. ���������� ����������',0,2);
taskText('������������ �\ ������ ������ ����������.',0,4);
(*
*)
end;
2: begin
taskText('���� ������-����������� ��\ ������� �����. ���������� ����������',0,2);
taskText('������������ �\ ������ ������� ����.',0,4);
(*
*)
end;
end;
(*==*)
s := predl[Random(NP)];
k1 := 0;
k2 := 0;
for i:=1 to length(s) do
  begin
     if s[i] in [',','.',':',';','-','"'] then inc(k1);
     if s[i] in ['�','�','�','�','�','�','�','�','�',
                   '�','�','�','�','�','�','�','�','�']
         then inc(k2);
  end;
dataS('',s,0,3);
case v1 of
1:  resultN('',k1,0,3,2);
2:  resultN('',k2,0,3,2);
end;
setNumberOfTests(8);
Pause;
end;
procedure SStr60An45(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('���� ������-����������� ��\ ������� �����.',0,1);
taskText('������� ����� ������� ����� �\ �����������. ���� ����� ���� ���������,',0,2);
taskText('��\ ������� ������ ��\ ���. \I������\i ������� ����� ��������,',0,3);
taskText('��\ ���������� ��������, ������ ���������� �\ ������������ ���������,',0,4);
taskText('������� ���������� ���\ �������/������ ������.',0,5);
(*
*)
end;
2: begin s0 := '';
taskText('���� ������-����������� ��\ ������� �����.',0,1);
taskText('������� ����� �������� ����� �\ �����������. ���� ����� ���� ���������,',0,2);
taskText('��\ ������� ��������� ��\ ���. \I������\i ������� ����� ��������,',0,3);
taskText('��\ ���������� ��������, ������ ���������� �\ ������������ ���������,',0,4);
taskText('������� ���������� ���\ �������/������ ������.',0,5);
(*
*)
end;
end;
(*==*)
s1 := predl[Random(NP)];
s := s1;
s2 := '';
s3 := '                                        ';
for i:=2 to length(s) do
  if s[i] in [',','.',':',';','-','"'] then s[i] := ' ';
k1 := 1;
for i := 2 to length(s) do
    if (s[i] = ' ') and (s[i-1]<>' ') then
      begin
        s4 := Copy(s,k1,i-k1);
             if length(s4)>length(s2) then s2 := s4;
             if length(s4)<=length(s3) then s3 := s4;
      end
    else
      if (s[i] <> ' ') and (s[i-1] = ' ') then
        k1 := i;
dataS('',s1,0,3);
case v1 of
1: resultS('',s2,0,3);
2: resultS('',s3,0,3);
end;
setNumberOfTests(5);
Pause;
end;
procedure SStr60An46(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('���� ������-����������� �\ ����������� ��������� ����� �������.',0,2);
taskText('������������� ��\ ���, ����� ����� ������� ��� ����� ���� ������.',0,4);
(*
*)
(*==*)
repeat
s1 := predl[Random(NP)];
s := s1;
for i:=length(s) downto 2 do
    if (s[i] = ' ') and (s[i-1]<>' ') then
      for k := 1 to Random(4) do
        insert(' ',s,i);
until length(s)<77;
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(5);
Pause;
end;

procedure SStr60An47(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60An48(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ���������� \I������ ��� �����\i, �.\,�. ��� �����,',0,2);
taskText('������ ��������� (����), ���������� ��� �\ ����������.',0,3);
taskText('�������� ��\ ���� ������ ��� ����� (���\ ����������).',0,4);
(*
��� ����� ���������� ��\ ���� ����������, ���� ����������
��\ ����� ����� ����� ������ \<\\\>, ��� ����� ���������� ��\ ����������
������. ������� ����� �\ ����, ���\ ����� ����� ����� ���������
��������, ������������� �\ ����.
*)
end;
 2: begin
taskText('���� ������, ���������� \I������ ��� �����\i, �.\,�. ��� �����,',0,2);
taskText('������ ��������� (����), ���������� ��� �\ ����������.',0,3);
taskText('�������� ��\ ���� ������ ���������� ����� (���\ �������������� �����).',0,4);
(*
+
*)
end;
end;
(*==*)
FileName(s,s1,s2,s3,s4);
dataS('',s,0,3);
case v1 of
1: resultS('',s3,0,3);
2: resultS('',s4,0,3);
end;
setNumberOfTests(4);
Pause;
end;
procedure SStr60An49(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('���� ������, ���������� ������ ��� �����. �������� ��\ ���� ������',0,2);
taskText('�������� ������� �������� (���\ ��������~\<\\\>). ����\ ���� ����������',0,3);
taskText('�\ �������� ��������, ��\ ������� ������~\<\\\>.',0,4);
(*
+
*)
end;
2: begin
taskText('���� ������, ���������� ������ ��� �����. �������� ��\ ���� ������',0,2);
taskText('�������� ���������� �������� (���\ ��������~\<\\\>). ����\ ���� ����������',0,3);
taskText('�\ �������� ��������, ��\ ������� ������~\<\\\>.',0,4);
(*
+
*)
end;
end;
(*==*)

FileName(s,s1,s2,s3,s4);
if s2 = '\' then s1 := s2
else
    case v1 of
    1:begin
      delete(s2,1,1);
      for i:= 1 to length(s2) do
        begin
          k := i;
          if s2[i]='\' then break;
        end;
        s1 := copy(s2,1,k-1);
      end;
    2:begin
       delete(s2,length(s2),1);
        for i:= length(s2) downto 2 do
        begin
          k := i;
          if s2[i-1]='\' then break;
        end;
        s1 := copy(s2,k,length(s2)-k+1);
      end;
  end;
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(7);
Pause;
end;
procedure SStr60An50(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� ������-����������� ��\ ������� �����. �����������\ ��, �������� �����������',0,1);
taskText('������ ������ ����� ��\ ��������� ��\ ��� �\ �������� �\ �������� ���\ ���� �������',0,2);
taskText('���� (\<�\> �������� �~\<�\>, \<�\>\ \= �~\<�\>, \<�\>\ \= �~\<�\>, \<�\>\ \= �~\<�\> �\ �.\,�.).',0,3);
taskText('�����~\<�\> �\ �������� ��\ ��������� (\<�\> ������ ���������� �~\<�\>).',0,4);
taskText('����� ���������� �\ ������� ��\ ��������.',0,5);
(*
�\ ����� \UP ����������� ������� Ord �\ Chr �\ ��������������� ������
�\ �������� ������.
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  case s[i] of
  '�'..'�','�'..'�','�'..'�' : s[i] := chr(ord(s[i])+1);
  '�' : s[i] := '�';
  '�' : s[i] := '�';
  '�' : s[i] := '�';
  end;
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An51(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});(*DEMO*)
taskText('���� ������-����������� ��\ ������� ����� �\ �����~{K} (0~<~{K}~<~10). �����������',0,1);
taskText('������, �������� ����������� ������ ������ ����� ��\ ����� ����\ �� ��������,',0,2);
taskText('������������� �\ �������� �� \Um{K}-�\um ������� ����� ��������� ����� (��������,',0,3);
taskText('��� {K}\,=\,2 \<�\> �������� �~\<�\>, \<�\>\ \= �~\<�\>, \<�\>\ \= �~\<�\>, \<�\>\ \= �~\<�\> �\ �.\,�.).',0,4);
taskText('�����~\<�\> �\ �������� ��\ ���������, ����� ���������� �\ ������� ��\ ��������.',0,5);
(*
+
*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s1,0,2);
dataN('K = ',k,0,4,1);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An52(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� ������������� ����������� ��\ ������� �����',0,2);
taskText('(������ ���������� ������ �\ ������� \1)',0,3);
taskText('�\ ������� ��������~{K} (0~<~{K}~<~10). ������������ �����������.',0,4);
(*
+
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s,0,2);
dataN('K = ',k,0,4,1);
resultS('',s1,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An53(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� ������������� ����������� ��\ ������� ����� (������ ����������',0,2);
taskText('������ �\ ������� \2) �\ ���\ �������������� ������ ������~{C}.',0,3);
taskText('����� ������� ��������~{K} �\ ������������ �����������.',0,4);
(*
+
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s,0,2);
dataC('C = ',s1[1],0,4);
resultN('������� ��������: ',k,0,2,2);
resultComment('�������������� �����������:',0,3);
resultS('',s1,0,4);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An54(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� ������-�����������. �����������\ ��, �������� �������',0,1);
taskText('���\ �������, ������������� ��\ ������ �������� ������,',0,2);
taskText('�\ �����, �\ �������� �������,',0,3);
taskText('���\ �������, ������������� ��\ �������� ��������',0,4);
taskText('(��������, ������ \<���������\> ����������� �\ \<���������\>).',0,5);
(*
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) div 2 do
  s[i] := s1[2*i];
for i:=1 to length(s) div 2 do
  s[length(s)-i+1] := s1[2*i-1];
if length(s) mod 2 <> 0 then
  s[length(s) div 2 + 1] := s1[length(s)];
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(7);
Pause;
end;
procedure SStr60An55(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� �����������, ������������� ��\ �������,',0,2);
taskText('���������� �\ ������� \1. ������������ ���\ �����������.',0,4);
(*
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) div 2 do
  s[i] := s1[2*i];
for i:=1 to length(s) div 2 do
  s[length(s)-i+1] := s1[2*i-1];
if length(s) mod 2 <> 0 then
  s[length(s) div 2 + 1] := s1[length(s)];
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(7);
Pause;
end;

procedure SStr60An56(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,k: integer;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('���� ������, ���������� ����� �\ �������� ��������� �����.', 0, 2);
  TaskText('���� ����� �\ ������ ����������� ��\ ��������, ��\ �������~0;', 0, 3);
  TaskText('�\ ��������� ������ ������� ����� ������� ������� ������,', 0, 4);
  TaskText('����������� ���������� �������.', 0, 5);
(*
*)
(*==*)
  n := random(15)+15;
  s := '';
  for i := 1 to n do
    s := s + chr(ord('a')+Random(26));
  if Random(3)<>0 then
  for k := 1 to n-1 do
    for i := 1 to n - k do
    if s[i]>s[i+1] then
    begin
    c := s[i];
    s[i] := s[i+1];
    s[i+1] := c;
    end;
  for i := 1 to Random(10)+4 do
  begin
  k := Random(length(s)-1)+1;
  insert(digits(Random(3)+1),s,k);
  end;
  if Random(2)=0 then s := digits(Random(3)+1)+s;

  if Random(2)=0 then
  for i := 1 to Random(4)+2 do
  begin
  k := Random(length(s)-1)+1;
  insert(chr(ord('a')+Random(26)),s,k);
  end;
  c1 := #0;
  k := 0;
  for i := 1 to length(s) do
  if s[i] in ['a'..'z'] then
    if s[i] < c1 then
      begin
        k := i;
        break;
      end
    else c1 := s[i];
  DataS('', s, 0, 3);
  ResultN('', k, 0, 3,2);
  SetNumberOfTests(9);
Pause;
end;

procedure SStr60An57(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('���� ������, ���������� ��������� ����� �\ ������� ������.',0,1);
taskText('���� ������ ����������� ��������� (�.\,�. ������ �����������',0,2);
taskText('������������� ���� �����������), ��\ ������� �����~0. �\ ��������� ������',0,3);
taskText('������� ���\ ����� �������, �\ ������� ����������� ������ ���������',0,4);
taskText('����������� ������, ���, ����\ ����������� ������ ��\ �������, �����~\-1.',0,5);
(*
�������������� ������, ���������� ��\ ������� �����������
����������-������� ���\ ��������� �\ ������ ����������� ������
�\ �������� ��\ ��\ ������� ���\ ��������� ������ �����������.
*)
(*==*)
n := random(15)+15;
s := '';
for i := 1 to n do
  s := s + chr(ord('a')+Random(26));
k := random(7)+2;
k1 := random(3);
case curtest of //2012
3: k1 := 0;
4: k1 := 1;
end;
if k1 = 0 then
for i := 1 to k div 2 + 1 do
  begin
    n1 := random(n) + 1;
    n2 := n1 + random(6)+2;
    if n2 > n then n2 := n;
    insert('(',s,n1);
    insert(')',s,n2);
  end
else
for i := 1 to k do
  begin
    case random(2) of
    0: insert('(',s,random(n)+1);
    1: insert(')',s,random(n)+1);
    end;
  end;
k := 0;
for i := 1 to length(s) do
  case s[i] of
  '(' : k := k+1;
  ')' : begin
          k := k-1;
          if k<0 then
            begin
              k := -i;
              break
            end;
        end;
  end;
if k > 0 then k := -1
else k := -k;
dataS('',s,0,3);
resultN('',k,0,3,2);
setNumberOfTests(9);
Pause;
end;

function Vir8 : string;
var s:string; i,j : integer;
begin
inc(count);
s := '';
for j := 1 to 3 do
if (count>5) then
  for i := 1 to Random(2)+1 do
  s := s + chr(97+Random(26))
else
  case Random(5) of
  0: s := s+'('+Vir8+')';
  1: s := s+'['+Vir8+']';
  2: s := s+'{'+Vir8+'}';
  3,4:for i := 1 to Random(2)+1 do
      s := s + chr(97+Random(26))
  end;
Vir8 := s;
end;



function Check2a(s:string) : integer;
var count:integer;z : char;
function Check20a(z1:char):Boolean;
begin
check20a := False;
while count<=length(s) do
  begin
    z := s[count];
    inc(count);
    if z=z1 then begin check20a := true; exit; end;
    case z of
    'a'..'z': ;
    '(':if not Check20a(')') then exit;
    '[':if not Check20a(']') then exit;
    '{':if not Check20a('}') then exit;
    else exit;
    end;
  end;
inc(count);
exit;
end;
begin
count := 1;
check2a := -1;
while (count<=length(s)) do
  begin
    z := s[count];
    inc(count);
    case z of
    'a'..'z': ;
    '(':if not Check20a(')') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    '[':if not Check20a(']') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    '{':if not Check20a('}') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    else begin check2a := count-1;exit;end;
    end;
  end;
check2a := 0;
end;


procedure SStr60An58(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('���� ������, ���������� ��������� ����� �\ ������ ���� �����:~\<()\>, \<[]\>,~\<\{\}\>.',0,1);
taskText('���� ������ ����������� ��������� (�.\,�. ������ ����������� �������������',0,2);
taskText('����������� ������ ����\ �� ����), ��\ ������� �����~0. �\ ��������� ������',0,3);
taskText('������� ���\ ����� �������, �\ ������� ����������� ������ ���������',0,4);
taskText('������, ���, ����\ ����������� ������ ��\ �������, �����~\-1.',0,5);
(*
� ������ ������ ������ �������� ���������������� �����������-����������
(��� �\ ������� \1), ��������� �\ ��\ ������� ������ ����������
��������� �������� ���� \<[(])\>. ����� ������������
��������������� \I������\i,
�\ ������� ���������� ���\ ����������� ������, �\ ���\ ��������� �����������
������ ���������� ��\ �\ ��������� ������� ��\ ��������������� ������.
���� ������ ����� ������ ����, ��\ ������� ��\ ��������������� ������
��������� ������ �\ ���������� ��������, ���� ��\ ������ ������� ����,
������, ��������� ����������� ������ �������� ���������.
��������� ����� ���������� �������� ��\ ���������, ����� �����
����������� ������ ��\ ����� ����� �����������.
*)
repeat
count := 0;
s := Vir8;
until length(s)<30;
s1 := '()[]{}';
if Random(2)=0 then
  case Random(4) of
  0: delete(s,length(s) div 2+2,40);
  1: insert(s1[Random(6)+1],s,random(length(s))+1);
  2,3: if Length(s)>=5 then insert(s1[2*(Random(3)+1)],s,Random(5)+1);
  end;
dataS('S = ',s,0,3);
resultN('',Check2a(s),0,3,2);
setNumberOfTests(9);
  Pause;
end;


procedure SStr60An59(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SStr60An60(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
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
Topic := '������� � ������';
Topic1 := '������� � ������: �������� ��������';
Topic2 := '������ � �������������� ���� � ������';
Topic3 := '������� � ������: �������������� �������';
{Author := '�.~�.~�������, 2002';}
end.

