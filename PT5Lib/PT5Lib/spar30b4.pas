{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SPar30B4;

{$MODE Delphi}

interface

procedure SPar30Bn1(Name, Key: string);
procedure SPar30Bn2(Name, Key: string);
procedure SPar30Bn3(Name, Key: string);
procedure SPar30Bn4(Name, Key: string);
procedure SPar30Bn5(Name, Key: string);
procedure SPar30Bn6(Name, Key: string);
procedure SPar30Bn7(Name, Key: string);
procedure SPar30Bn8(Name, Key: string);
procedure SPar30Bn9(Name, Key: string);
procedure SPar30Bn10(Name, Key: string);
procedure SPar30Bn11(Name, Key: string);
procedure SPar30Bn12(Name, Key: string);
procedure SPar30Bn13(Name, Key: string);
procedure SPar30Bn14(Name, Key: string);
procedure SPar30Bn15(Name, Key: string);
procedure SPar30Bn16(Name, Key: string);
procedure SPar30Bn17(Name, Key: string);
procedure SPar30Bn18(Name, Key: string);
procedure SPar30Bn19(Name, Key: string);
procedure SPar30Bn20(Name, Key: string);
procedure SPar30Bn21(Name, Key: string);
procedure SPar30Bn22(Name, Key: string);
procedure SPar30Bn23(Name, Key: string);
procedure SPar30Bn24(Name, Key: string);
procedure SPar30Bn25(Name, Key: string);
procedure SPar30Bn26(Name, Key: string);
procedure SPar30Bn27(Name, Key: string);
procedure SPar30Bn28(Name, Key: string);
procedure SPar30Bn29(Name, Key: string);
procedure SPar30Bn30(Name, Key: string);

implementation

uses PT5TaskMaker,PT4Dat_ru;

type string80 = string[80];
     pstring80 = ^string80;
     ar80 = array [0..100] of pString80;

var
    x0,x1,x2: real;
    k,m,n,n1: integer;
    c1: char;
    Topic3, Topic4,Topic5,Author : string;

    s__ : array[0..29] of pString50;
    len : integer;
    s0,s1,s2: shortstring;



function otr(x1,y1,x2,y2:real):real;
begin
otr := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

procedure SPar30Bn1(Name, Key: string);
var v1,v2,v3 : byte;
    y1, y2: Real;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('������� ������� Leng({x}_A, {y}_A, {x}_B, {y}_B) ������������� ����,',0,1);
taskText('��������� ����� ������� {AB} ��\ ��������� ��\ ����������� ��� ������:',0,2);
taskText('\[|{AB}|~=~\R({x}_A\;\-\;{x}_B)^2\;+\;({y}_A\;\-\;{y}_B)^2\r\]',0,3);
taskText('({x}_A, {y}_A, {x}_B, {y}_B\ \= ������������ ���������). �\ ������� ���� �������',0,4);
taskText('����� ����� ��������~{AB}, {AC},~{AD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    x0 := otr(x1,y1,x2,y2);
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    resultR('|A'+chr(65+i)+'| = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn2(Name, Key: string);
var v1,v2,v3 : byte;
    y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('��������� ������� Leng ��\ ������� \1, ������� �������',0,1);
taskText('Perim({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C) ������������� ����, ��������� ��������',0,2);
taskText('������������~{ABC} ��\ ����������� ���\ ������ ({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C\ \=',0,3);
taskText('������������ ���������). �\ ������� ���� ������� ����� ���������',0,4);
taskText('�������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := '_{ABC}'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := '_{ABD}'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := '_{ACD}'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    x0 := otr(x1,y1,x[i,1],y[i,1])+otr(x1,y1,x[i,2],y[i,2])+
          otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    resultR('P'+s[i]+' = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn3(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('��������� ������� Leng �~Perim ��\ ������� \2 �\ \1, �������',0,1);
taskText('������� Area({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C) ������������� ����, ��������� �������',0,2);
taskText('������������~{ABC} ��\ �������\[  {S}_{ABC}~=~\R{p}\*({p}\-|{AB}|)\*({p}\-|{AC}|)\*({p}\-|{BC}|)\r,\]',0,3);
taskText('��� {p}\ \= \I������������\i. �\ ������� ���� ������� ����� �������',0,4);
taskText('�������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := '_{ABC}'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := '_{ABD}'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := '_{ACD}'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    a := otr(x1,y1,x[i,1],y[i,1]);
    b := otr(x1,y1,x[i,2],y[i,2]);
    c := otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    resultR('S'+s[i]+' = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn4(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('��������� ������� Leng �~Area ��\ ������� \3 �\ \1, �������',0,1);
taskText('������� Dist({x}_P, {y}_P, {x}_A, {y}_A, {x}_B, {y}_B) ������������� ����, ��������� ����������',0,2);
taskText('{D}({P},\,{AB}) ��\ �����~{P} ��\ ������~{AB} ��\ �������\[ {D}({P},\,{AB})~=~2\*{S}_{PAB}/|{AB}|,\] ��� {S}_{PAB}\ \=',0,3);
taskText('������� ������������~{PAB}. �\ ������� ���� ������� ����� ���������� ��\ �����~{P}',0,4);
taskText('��\ ������~{AB}, {AC},~{BC}, ���� ���� ���������� �����~{P},~{A}, {B},~{C}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('P: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(64+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := 'AB'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := 'AC'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := 'BC'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    a := otr(x1,y1,x[i,1],y[i,1]);
    b := otr(x1,y1,x[i,2],y[i,2]);
    c := otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    x0 := 2*x0/c;
    resultR('D(P,'+s[i]+') = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn5(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('��������� ������� Dist ��\ ������� \1, ������� ���������',0,1);
taskText('Altitudes({x}_A,\,{y}_A,\,{x}_B,\,{y}_B,\,{x}_C,\,{y}_C,\,{h}_A,\,{h}_B,\,{h}_C), '+
         '��������� ������~{h}_A,\,{h}_B,\,{h}_C ������������',0,2);
taskText('{ABC} (�������� ���������), ����������� �������������� ��\ ������~{A}, {B},~{C}',0,3);
taskText('(��\ ���������� �������� �������� �����������). �\ ������� ���� ��������� �����',0,4);
taskText('������ �������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := 'BC'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := 'BD'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := 'CD'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    c := sqrt(sqr(x1-x[i,1])+sqr(y1-y[i,1]));
    b := sqrt(sqr(x1-x[i,2])+sqr(y1-y[i,2]));
    a := sqrt(sqr(x[i,1]-x[i,2])+sqr(y[i,1]-y[i,2]));
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    a := 2*x0/a;
    b := 2*x0/b;
    c := 2*x0/c;
    resultComment('A'+s[i]+': ',11,i+1);
    resultR('h_A = ',a,22,i+1,5);
    resultR('h_'+s[i][1]+' = ',b,41,i+1,5);
    resultR('h_'+s[i][2]+' = ',c,60,i+1,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn6(Name, Key: string);
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

procedure SPar30Bn7(Name, Key: string);
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


procedure DecToBinHex(nDec : integer; var sBin,sHex : shortstring);
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

procedure getText;
var k,i,j,NS : integer;
    s0 : string50;
begin
  NS := NS0;
  j := Random(NS)+1;
  Len := beg_[j+1] - beg_[j];
  k := -1;
    for i := 0 to Len - 1 do
      begin
        Inc(k);
        if i = 0 then s0 := Copy(S_[beg_[j]+i],2,60)
        else
          begin
            s0 := S_[beg_[j]+i];
            if i = Len-1 then
              s0 := Copy(s0,1,length(s0)-1);
          end;
        New(S__[k]);
        if s0[length(s0)]='#' then
          begin
            S__[k]^ := Copy(s0,1,length(s0)-1);
            Inc(k);
            New(S__[k]); S__[k]^ := '';
          end
        else S__[k]^ := s0;
    end;
Len := k+1;
end;
procedure freeText;
var i : integer;
begin
  for i := 0 to len-1 do
    system.dispose(S__[i]);
end;

procedure Margin(mar : integer; var s_0 : ar80; var len_0 : integer);
var i,j : integer;
    s0,s1 : string;
begin
len_0 := 0;
s1 := '';
for i := 0 to len-1 do
  begin
    if s__[i]^='' then
      begin
        new(s_0[len_0]);
        s_0[len_0]^ := s1;
        inc(len_0);
        new(s_0[len_0]);
        s_0[len_0]^ := '';
        inc(len_0);
        s1 := '';
      end
    else
      begin
        s0 := '';
        for  j := 1 to length(s__[i]^) do
          begin
            if s__[i]^[j]<>' ' then s0 := s0 + s__[i]^[j]
            else
              if s1='' then
                begin
                  s1 := s0;
                  s0 := '';
                end
              else
              begin
                if length(s1)+length(s0)+1<=mar then
                  s1 := s1 + ' '+s0
                else
                  begin
                    new(s_0[len_0]);
                    s_0[len_0]^ := s1;
                    inc(len_0);
                    s1 := s0;
                  end;
                s0 := '';
              end;
            end;
          if length(s1)+length(s0)+1<=mar then
            s1 := s1 + ' '+s0
          else
            begin
              new(s_0[len_0]);
              s_0[len_0]^ := s1;
              inc(len_0);
              s1 := s0;
            end;
      end;
  end;
if s1 <> '' then
  begin
    new(s_0[len_0]);
    s_0[len_0]^ := s1;
    inc(len_0);
  end;
end;
procedure freeMargin(s_0 : ar80; len_0 : integer);
var i : integer;
begin
  for i := 0 to len_0-1 do
    system.dispose(S_0[i]);
end;

















procedure SPar30Bn8(Name, Key: string);
var F : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('������� ������� IntFileSize({S}) ������ ����,',0,2);
taskText('������������ ���������� ��������� �\ ����� ����� ����� �\ ������~{S}.',0,3);
taskText('���� ���� ��\ ����������, ��\ ������� ����������~\-1. �\ ������� ���� �������',0,4);
taskText('����� ���������� ��������� �\ ���� ������ �\ ������� �������.',0,5);
(*
*)
(*==*)
dataComment('���������� ������:',0,2);
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if Random(3)=0 then
    begin
      dataComment('���� �����������.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then n := 0
    else n := 6 + Random(15);
    Rewrite(F);
    for j := 1 to n do
      begin
        m := 1 + Random(30);
        write(F,m);
      end;
    Close(F);
    dataFileN(s0,i+2,5);
    end;
    resultN('IntFileSize(S_'+chr(48+i)+') = ',n,0,i+1,2);
  end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Bn9(Name, Key: string);
var F : text;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});(*DEMO*)
taskText('������� ������� LineCount({S}) ������ ����,',0,2);
taskText('������������ ���������� ����� �\ ��������� ����� �\ ������~{S}.',0,3);
taskText('���� ���� ��\ ����������, ��\ ������� ����������~\-1. �\ ������� ���� �������',0,4);
taskText('����� ���������� ����� �\ ���� ������ �\ ������� �������.',0,5);
(*
*)
dataComment('���������� ������:',0,2);
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if Random(3)=0 then
    begin
      dataComment('���� �����������.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then Len := 0
                   else getText;
    Rewrite(F);
    for j := 0 to Len-1 do
        writeln(F,S__[j]^);
    Close(F);
    if Len <> 0 then FreeText;
    dataFileT(s0,i+2,i+2);
    n := Len;
    end;
  resultN('LineCount(S_'+chr(48+i)+') = ',n,0,i+1,2);
  end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Bn10(Name, Key: string);
var F,F1 : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('������� ��������� InvIntFile({S}), �������� ������� ����������',0,1);
taskText('��������� ����� ������ ���� �\ ������~{S} ��\ ��������.',0,2);
taskText('���� ���� ��\ ���������� ���\ �������� ����� ���� ���������,',0,3);
taskText('��\ ��������� ��\ ��������� ������� ��������.',0,4);
taskText('���������� �\ ������� ���� ��������� ���\ ����� �\ ������� �������.',0,5);
(*
*)
(*==*)
dataComment('�������� ���������� ������:',0,2);
resultComment('�������������� ���������� ������:',0,2);
k := 0;
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if (Random(3)=0) and ((i<>3)or(k<>0)) then
    begin
      dataComment('���� �����������.',6,i+2);
      resultComment('���� �����������.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then n := 1 //2015.10
    else n := 6 + Random(15);
    Rewrite(F);
    for j := 1 to n do
      begin
        m := 1 + Random(30);
        write(F,m);
      end;
    Assign(F1,'#'+FileName(7)+'.tst');
    Rewrite(F1);
    for j := 1 to n do
      begin
        Seek(F,n-j);
        read(F,m);
        write(F1,m);
      end;
    Close(F);
    Close(F1);
    resultFileN(s0,i+2,5);
    Rename(F1,s0);
    dataFileN(s0,i+2,5);
    end;
    k := k + n + 1;
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPar30Bn11(Name, Key: string);
var F,F1 : text;
    j,n,k,l,p : integer;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������� ��������� AddLineNumbers({S},\;{N},\;{K},\;{L}), ����������� �\ ������ ������', 0, 1);
  TaskText('������ ������������� ���������� ����� �\ ������~{S} ��\ ���������� �����: ������', 0, 2);
  TaskText('������ �������� �����~{N}, ������\ \= {N}\,+\,1 �\ �.\ �. ����� ������������ �\ {K}~��������,', 0, 3);
  TaskText('������������� ��\ ������� ���� �\ ���������� ��\ ������������ ������ {L}~���������', 0, 4);
  TaskText('({K}\;>\;0, {L}\;>\;0). ���� ������ ����� �������� ������, ��\ ��� ����� ����������,', 0, 5);
  TaskText('��\ ������� ����� ������ ��\ �����������. ��������� ���\ ���������', 0, 0);
  TaskText('�\ ������� �����, ��������� ��������� ��������~{N}, {K} �~{L}.', 0, 0);
(*
*)
(*==*)
s0 := FileName(8)+'.tst';
dataS('��� �����: ',s0,xLeft,1);
dataComment('���������� �����:',xRight,1);
n := 0; k := 0;
case Random(4) of
0: begin
     n := Random(10)+1;
     k := 2 + Random(3);
   end;
1: begin
     n := Random(100)+100;
     k := 3 + Random(4);
   end;
2: begin
     n := Random(300)+1000;
     k := 4 + Random(5);
   end;
3: begin
     n := Random(5000)+10000;
     k := 5 + Random(6);
   end;
end;
p := Random(3);
l := Random(6)+1;
dataN('N = ',n,center(1,3,6,15),5,1);
dataN('K = ',k,center(2,3,6,15),5,1);
dataN('L = ',l,center(3,3,6,15),5,1);
    Assign(F,s0);
    Assign(F1,'#'+FileName(7)+'.tst');
    getText;
    Rewrite(F);
    Rewrite(F1);
    for j := 0 to Len-1 do
    begin
        writeln(F1,S__[j]^);
        write(F,n+j:k);
        if S__[j]^ <> '' then write(F,' ':l,S__[j]^);
        writeln(F);
    end;
    Close(F);
    Close(F1);
    if Len <> 0 then FreeText;
  resultComment('����� ���������� �����:',0,1);
  resultFileT(s0,2,5);
  rename(F1,s0);
  dataFileT(s0,2,4);
  SetNumberOfTests(7);
Pause;
end;



procedure SPar30Bn12(Name, Key: string);
var F,F1 : text;
    j,n,k,l,p : integer;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������� ��������� RemoveLineNumbers({S}), ��������� ��\ ������ ������ ������', 0, 1);
  TaskText('������������� ���������� ����� �\ ������~{S} ��\ ���������� �����, �\ �����', 0, 2);
  TaskText('�������, ���������� ����� ��\ ������������ ������ (��������������, ��� ������', 0, 3);
  TaskText('����� ���� ����� ��������� �\ ������� ����� �\ ������� ��������� AddLineNumbers', 0, 4);
  TaskText('\= ��.\ ������� \1). ���� ������ ��\ �������� �������, ��\ ��������� ��\', 0, 5);
  TaskText('��������� ������� ��������. ��������� ���\ ��������� �\ ����� �\ ������ ������.', 0, 0);
(*
*)
(*==*)
s0 := FileName(8)+'.tst';
dataS('��� �����: ',s0,xLeft,1);
dataComment('���������� �����:',xRight,1);
n := 0; k := 0;
case Random(4) of
0: begin
     n := Random(10)+1;
     k := 2 + Random(3);
   end;
1: begin
     n := Random(100)+100;
     k := 3 + Random(4);
   end;
2: begin
     n := Random(300)+1000;
     k := 4 + Random(5);
   end;
3: begin
     n := Random(5000)+10000;
     k := 5 + Random(6);
   end;
end;
p := Random(3);
l := Random(6)+1;
    Assign(F,s0);
    Assign(F1,'#'+FileName(7)+'.tst');
    getText;
    Rewrite(F);
    Rewrite(F1);
    for j := 0 to Len-1 do
    begin
        writeln(F,S__[j]^);
        if p = 0 then         writeln(F1,S__[j]^)
        else
        begin
        write(F1,n+j:k);
        if S__[j]^ <> '' then write(F1,' ':l,S__[j]^);
        writeln(F1);
        end;
    end;
    Close(F);
    Close(F1);
    if Len <> 0 then FreeText;
  resultComment('����� ���������� �����:',0,1);
  resultFileT(s0,2,5);
  rename(F1,s0);
  dataFileT(s0,2,5);
  SetNumberOfTests(7);
Pause;
end;



procedure SPar30Bn13(Name, Key: string);
var F0,F1,F2 : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});(*DEMO*)
taskText('������� ��������� SplitIntFile({S}_0,\;{K},\;{S}_1,\;{S}_2), ���������� ������~{K} (\g\,0)',0,1);
taskText('��������� ������������� ����� ����� ����� �\ ������~{S}_0 �\ ����� ���� ����� �����',0,2);
taskText('�\ ������~{S}_1, a\ ��������� ��������\ \= �\ ����� ���� ����� ����� �\ ������~{S}_2.',0,3);
taskText('���� ��\ ��������� ������ ����� �������� ������. ��������� ���\ ���������',0,4);
taskText('�\ ����� �\ ������ ������~{S}_0, ��������� ��������� ��������~{K}, {S}_1 �~{S}_2.',0,5);
(*
*)
s0 := '0'+FileName(7)+'.tst';
s1 := '1'+FileName(7)+'.tst';
s2 := '2'+FileName(7)+'.tst';
dataS('S_0 = ',s0,xLeft,2);
dataComment('���������� ��������� �����:',xRight,2);
resultComment('���������� �������������� ������:',0,2);
m := 6 + Random(15);
case Random(4) of
0: n := 0;
1: n := m + Random(5);
2,3: n := 1 + Random(m);
end;
case curtest of //2012
2: n := m + Random(5);
3: n := 1 + Random(m);
5: n := 0;
end;
dataN('K = ',n,0,4,1);
dataS('S_1 = ',s1,xLeft,5);
dataS('S_2 = ',s2,xRight,5);
Assign(F0,s0);
Rewrite(F0);
Assign(F1,s1);
Rewrite(F1);
Assign(F2,s2);
Rewrite(F2);
if n>m then n := m;
for i := 1 to n do
  begin
    j := 1 + Random(30);
    write(F0,j);
    write(F1,j);
  end;
for i := n+1 to m do
  begin
    j := 1 + Random(30);
    write(F0,j);
    write(F2,j);
  end;
Close(F0);
Close(F1);
Close(F2);
dataFileN(s0,3,5);
resultFileN(s1,3,5);
resultFileN(s2,4,5);
setNumberOfTests(7);
Pause;
end;
procedure SPar30Bn14(Name, Key: string);
var F0,F1,F2 : text;
    i : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('������� ��������� SplitText({S}_0,\;{K},\;{S}_1,\;{S}_2), ���������� ������~{K} (\g\,0)',0,1);
taskText('����� ������������� ���������� ����� �\ ������~{S}_0 �\ ����� ��������� ����',0,2);
taskText('�\ ������~{S}_1, a\ ��������� ������\ \= �\ ����� ��������� ���� �\ ������~{S}_2.',0,3);
taskText('���� ��\ ��������� ������ ����� �������� ������. ��������� ���\ ���������',0,4);
taskText('�\ ����� �\ ������ ������~{S}_0, ��������� ��������� ��������~{K}, {S}_1 �~{S}_2.',0,5);
(*
*)
(*==*)
s0 := '0'+FileName(7)+'.tst';
s1 := '1'+FileName(7)+'.tst';
s2 := '2'+FileName(7)+'.tst';
dataS('S_0 = ',s0,xLeft,1);
dataComment('���������� ��������� �����:',xRight,1);
resultComment('���������� �������������� ������:',0,1);
getText;
case Random(4) of
0: n := 0;
1: n := Len + Random(5);
2,3: n := 1 + Random(Len);
end;
case curtest of //2012
3: n := 1 + Random(Len);
4: n := 0;
6: n := Len + Random(5);
end;
dataN('K = ',n,0,4,1);
dataS('S_1 = ',s1,xLeft,5);
dataS('S_2 = ',s2,xRight,5);
Assign(F0,s0);
Rewrite(F0);
Assign(F1,s1);
Rewrite(F1);
Assign(F2,s2);
Rewrite(F2);
if n>Len then n := Len;
for i := 0 to n-1 do
  begin
    writeln(F0,S__[i]^);
    writeln(F1,S__[i]^);
  end;
for i := n to Len-1 do
  begin
    writeln(F0,S__[i]^);
    writeln(F2,S__[i]^);
  end;
freeText;
Close(F0);
Close(F1);
Close(F2);
dataFileT(s0,2,3);
resultFileT(s1,2,3);
resultFileT(s2,4,5);
setNumberOfTests(7);
Pause;
end;

procedure SPar30Bn15(Name, Key: string);
var v1,v2,v3 : byte;
    i,j: integer;
    F: file of shortString;
    T: text;
    k: array[1..2] of integer;
begin
start(Name,Topic4,Author,Key,73{level2});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
1: begin
k[1] := xLeft;
k[2] := xRight;
taskText('������� ��������� StringFileToText({S}), �������������',0,2);
taskText('�������� ��������� ���� �\ ������~{S} �\ ��������� ���� �\ ���\ �� ������.',0,3);
taskText('��������� ���\ ���������, ������������� ���\ ������ ��������� �����',0,4);
taskText('�\ �������~{S}_1 �~{S}_2 �\ ���������.',0,5);
(*
*)
   end;
2: begin
k[1] := 3;
k[2] := 25;
taskText('������� ��������� TextToStringFile({S}), �������������',0,2);
taskText('��������� ���� �\ ������~{S} �\ �������� ��������� ���� �\ ���\ �� ������.',0,3);
taskText('��������� ���\ ���������, ������������� ���\ ������ ��������� �����',0,4);
taskText('�\ �������~{S}_1 �~{S}_2 �\ ���������.',0,5);
(*
*)
   end;
end;
(*==*)
for i := 1 to 2 do
begin
s1 := chr(48+i)+FileName(7)+'.tst';
dataS('S_'+chr(48+i)+' = ',s1,k[i],1);
Assign(F,'a'+FileName(7)+'.tst');
Rewrite(F);
Assign(T,'b'+FileName(7)+'.tst');
Rewrite(T);
for j := 1 to 6+Random(15) do
  begin
    s0 := FileName(Random(9));
    write(F,s0);
    writeln(T,s0);
  end;
Close(F);
Close(T);
case v1 of
1: begin
     dataComment('���������� �������� ��������� ������:',0,2);
     resultComment('���������� �������������� ��������� ������:',0,1);
     Rename(T,s1);
     resultFileT(s1,2*i,2*i+1);
     Rename(F,s1);
     dataFileS(s1,i+2,12);
   end;
2: begin
     dataComment('���������� �������� ������:',48,1);
     resultComment('���������� �������������� ��������� ������:',0,2);
     Rename(F,s1);
     resultFileS(s1,i+2,12);
     Rename(T,s1);
     dataFileT(s1,2*i,2*i+1);
   end;
end;
end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Bn16(Name, Key: string);

const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i,j:integer;
    T1,T2 : text;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('������� ��������� EncodeText({S},\;{K}), ������� ������� ��������� ���� �\ ������~{S},',0,1);
taskText('�������� ����������� ������ ������ ������� ����� ��\ ����� ���� �� ��������,',0,2);
taskText('������������� �\ �������� ��\ \Um{K}-�\um\ ������� ����� ��������� ����� (0~<~{K}~<~10).',0,3);
taskText('��������, ���\ {K}~=~3 \<�\> �������� �~\<�\>, \<�\>\ \= �~\<�\>. �����~\<�\> �\ ��������',0,4);
taskText('��\ ���������, ������, ��� ��\ ������~\<�\> ����� ����~\<�\>. �������, ��\ ����������',0,5);
taskText('�������� �������, ���\ ���������� ��\ ��������. ��������� ���\ ���������',0,0);
taskText('�\ ���� ������� ��������~{K}, ����������� ���� �\ ��������� ������.',0,0);
(*
*)
(*==*)
s1 := FileName(8) + '.tst';
Assign(T1,'{'+FileName(7)+'.tst');
Rewrite(T1);
Assign(T2,'}'+FileName(7)+'.tst');
Rewrite(T2);
n := 1+Random(9);
dataN('K = ',n,xLeft,1,1);
dataS('��� �����: ',s1,xRight,1);
resultComment('���������� �������������� �����:',0,1);
getText;
for j := 0 to Len-1 do
  begin
    s0 := S__[j]^;
    writeln(T1,s0);
    for i:=1 to length(s0) do
      if Pos(s0[i],c1)<>0 then s0[i] := c1[(Pos(s0[i],c1)+n-1) mod 32 + 1]
      else
      if Pos(s0[i],c2)<>0 then s0[i] := c2[(Pos(s0[i],c2)+n-1) mod 32 + 1];
    writeln(T2,s0);
  end;
freeText;
Close(T1);
Close(T2);
     Rename(T2,s1);
     resultFileT(s1,2,5);
     Rename(T1,s1);
     dataFileT(s1,2,5);
setNumberOfTests(5);
Pause;
end;

procedure SPar30Bn17(Name, Key: string);
const c1 : string = '��������������������������������';
      c2 : string = '��������������������������������';
var i,j:integer;
    T1,T2 : text;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('������� ��������� DecodeText({S},\;{K}), ������� ��������� ��������� ����',0,2);
taskText('�\ ������~{S}, ������������� � �������������� �������� ��������~{K}',0,3);
taskText('(������ ���������� ������ � ������� \1). ��������� ���\ ���������',0,4);
taskText('�\ ���� ������� ��������~{K}, ������������ ���� �\ ��������� ������.',0,5);
(*
*)
(*==*)
s1 := FileName(8) + '.tst';
Assign(T1,'{'+FileName(7)+'.tst');
Rewrite(T1);
Assign(T2,'}'+FileName(7)+'.tst');
Rewrite(T2);
n := 1+Random(10);
dataN('K = ',n,xLeft,1,1);
dataS('��� �����: ',s1,xRight,1);
resultComment('���������� ��������������� �����:',0,1);
getText;
for j := 0 to Len-1 do
  begin
    s0 := S__[j]^;
    writeln(T1,s0);
    for i:=1 to length(s0) do
      if Pos(s0[i],c1)<>0 then s0[i] := c1[(Pos(s0[i],c1)+n-1) mod 32 + 1]
      else
      if Pos(s0[i],c2)<>0 then s0[i] := c2[(Pos(s0[i],c2)+n-1) mod 32 + 1];
    writeln(T2,s0);
  end;
freeText;
Close(T1);
Close(T2);
     Rename(T1,s1);
     resultFileT(s1,2,5);
     Rename(T2,s1);
     dataFileT(s1,2,5);
setNumberOfTests(5);
Pause;
end;


procedure SPar30Bn18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPar30Bn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('������������ �������', 0, 3);
(*
*)
  DataS('', '�������� ������', 0, 3);
  ResultS('', '�������������� ������', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

function IsLeapYear(n: Integer): Boolean;
begin
  IsLeapYear := (n mod 4 = 0) and ((n mod 100 <> 0) or (n mod 400 =0));
end;

function getYear: integer;
var n : integer;
begin
  n := 1 + Random(25);
  n := n*100;
  if Random(3)=0 then n := n+100
  else n := n+Random(99)+1;
  getYear := n;
end;

function daysinmonth(m,y: integer): integer;
var k: integer;
begin
  k := 0;
  case m of
  1, 3, 5, 7, 8, 10, 12: k := 31;
  4, 6, 9, 11: k := 30;
  2: if IsLeapYear(y) then k := 29
     else k := 28;
  end;
  daysinmonth := k;
end;

function dateiscorrect(d,m,y: integer): integer;
var n: integer;
begin
n := 0;
if (m<1) or (m>12) then n := 1
else
  if (d<1) or (d>daysinmonth(m,y)) then n := 2;
dateiscorrect := n;

end;

procedure SPar30Bn20(Name, Key: string);
var v1,v2,v3 : byte;
    i,y,m,d: integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('������� ��� TDate\ \= ������ �\ ������ ������ ���� Day (����), Month (�����) �\',0,1);
taskText('Year (���)\ \= �\ ������� LeapYear({D}) ����������� ���� �\ ���������� ���� TDate,',0,2);
taskText('������� ���������� \t, ���� ��� �\ ����~{D} �������� ����������, �\ \f',0,3);
taskText('�\ ��������� ������. ������� �������� ������� LeapYear ��� ���� ������ ���',0,4);
taskText('(��������������, ��� ��� ���� �������� �����������). \I����������\i ���������',0,5);
taskText('���, ��������� ��~4, ��\ ����������� ���\ �����,',0,0);
taskText('������� ������� ��~100 �\ ��\ ������� ��~400.',0,0);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  m := Random(12)+1;
  d := Random(30)+1;
  if m = 2 then d := Random(28)+1;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultB('LeapYear(D_'+chr(i+48)+') = ',IsLeapYear(y),0,i);
end;
setNumberOfTests(9);
pause;
end;

procedure SPar30Bn21(Name, Key: string);
var v1,v2,v3 : byte;
    y,m,d,i: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('��������� ��� TDate �\ ������� LeapYear (��.\ ������� \1), �������',0,1);
taskText('������� DaysInMonth({D}) ������ ���� �\ ���������� ���� TDate, �������',0,2);
taskText('���������� ���������� ���� ���\ ������, ���������� �\ ����~{D}.',0,3);
taskText('������� �������� ������� DaysInMonth ���\ ���� ������ ���',0,4);
taskText('(��������������, ���\ ��� ���� �������� �����������).',0,5);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  case Random(3) of
    0: m := 2;
    else m := 1 + Random(12);
  end;
  d := Random(30)+1;
  if m = 2 then d := Random(28)+1;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN('DaysInMonth(D_'+chr(i+48)+') = ',daysinmonth(m,y),0,i,2);
end;
setNumberOfTests(5);
Pause;
end;

procedure SPar30Bn22(Name, Key: string);
var v1,v2,v3 : byte;
    y,m,d,i: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('��������� ��� TDate �\ ������� DaysInMonth (��.\ ������� \2',0,1);
taskText('�\ \1), ������� ������� CheckDate({D}) ������ ���� �\ ���������� ����',0,2);
taskText('TDate, ������� ��������� ������������ ����, ��������� �\ ���������~{D}. ����',0,3);
taskText('����~{D} �������� ����������, ��\ ������� ����������~0; ���� �\ ���� ������',0,4);
taskText('�������� ����� ������, ��\ ������� ����������~1; ���� �\ ���� ������ ��������',0,5);
taskText('���� ���\ ����������� ������, ��\ ������������~2. ������� ��������',0,0);
taskText('������� CheckDate ���\ ���� ������ ���.',0,0);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  case Random(6) of
    0: m := 2;
    1,2,3 : m := 1 + Random(12);
    4: m := 13+ Random(8);
    else m := -integer(Random(13));
  end;
  case Random(8) of
  0,1: d := Random(31)+1;
  2,3: begin d := 29; m := 2; end;
  4,5: d := 31;
  6: d := 30 + Random(11);
  else d := -integer(Random(31));
  end;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN('CheckDate(D_'+chr(i+48)+') = ',dateiscorrect(d,m,y),0,i,2);
end;
setNumberOfTests(5);
Pause;
end;


procedure SPar30Bn23(Name, Key: string);
var v1,v2,v3 : byte;
    i,d,m,y,ms,d2,m2,y2: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
  1:
    begin
taskText('��������� ��� TDate �\ ������� DaysInMonth �\ CheckDate (��.\ ������� ',0,1);
taskText('\3\-\1), ������� ��������� PrevDate({D}) �\ ���������� ���� TDate,',0,2);
taskText('������� ����������� ����~{D} �\ ���������� ���� (���� ����~{D} ��������',0,3);
taskText('������������, ��\ ��� ��\ ����������). ������~{D} �������� �������',0,4);
taskText('�\ �������� ����������. ��������� ��������� PrevDate �\ ���� ������ �����.',0,5);
(*
*)
    end;
  2:
    begin
taskText('��������� ��� TDate �\ ������� DaysInMonth �\ CheckDate (��.\ ������� ',0,1);
taskText('\4\-\2), ������� ��������� NextDate({D}) �\ ���������� ���� TDate,',0,2);
taskText('������� ����������� ����~{D} �\ ��������� ���� (���� ����~{D} ��������',0,3);
taskText('������������, ��\ ��� ��\ ����������). ������~{D} �������� �������',0,4);
taskText('�\ �������� ����������. ��������� ��������� NextDate �\ ���� ������ �����.',0,5);
(*
*)
    end;
end;
(*==*)
d := 0; d2 := 0;
for i := 1 to 5 do
begin
y := getYear;
y2 := y;
m := 0;
case Random(3) of
  0: if v1 = 2 then m := 2
     else m := 3;
  1,2 : m := Random(12) + 1;
end;
m2 := m;
ms := DaysinMonth(m,y);
k := Random(3);
if v1 = 1 then
case k of
0,1 : begin
      d := 1;
      m2 := m-1;
      if m2 = 0 then
      begin
        m2 := 12;
        dec(y2);
      end;
      d2 := DaysinMonth(m2,y2);
    end;
2 : begin
      d := 2 + Random(ms-1);
      d2 := d-1;
    end;
end
else
case k of
0,1 :   begin
        d := ms;
        d2 := 1;
        m2 := m+1;
        if m2 = 13 then
        begin
         m2 := 1;
         inc(y2);
        end;
        end;
2 : begin
      if (k=2) and (m<>2) then d := ms-1
             else d := 1 + Random(ms-1);
      d2 := d+1;
    end;
end;
if Random(5) = 0 then
repeat
m := 1 + random(12);
d := 30+ random(2);
m2 := m;
d2 := d;
y2 := y;
until dateiscorrect(d,m,y) = 2;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN2('D_'+chr(i+48)+':',d2,m2,32,i,4);
  resultN('',y2,43,i,6);
end;
resultComment('��������������� ����:',3,1);
setNumberOfTests(5);
Pause;
end;

procedure SPar30Bn24(Name, Key: string);
var v1,v2,v3 : byte;
    y1, y2: Real;
    i: integer;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('������� ��� TPoint\ \= ������ �\ ������ ������������� ����~{X} �~{Y} (����������',0,1);
taskText('����� ��\ ���������)\ \= �\ ������� Leng({A},\;{B}) ������������� ����, ���������',0,2);
taskText('����� ������� {AB} ��\ ��������� ��\ ����������� ���\ ������:',0,3);
taskText('\[|{AB}|~=~\R({A}.{X}\;\-\;{B}.{X})^2\;+\;({A}.{Y}\;\-\;{B}.{Y})^2\r\]',0,4);
taskText('({A} �~{B}\ \= ��������� ���� TPoint). �\ ������� ���� ������� ����� �����',0,5);
taskText('��������~{AB}, {AC},~{AD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    x0 := otr(x1,y1,x2,y2);
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    resultR('|A'+chr(65+i)+'| = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn25(Name, Key: string);
var v1,v2,v3 : byte;
    y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('��������� ��� TPoint �\ ������� Leng (��.\ ������� \1), ������� ���',0,1);
taskText('TTriangle\ \= ������ �\ ������~{A}, {B},~{C} ���� TPoint (������� ������������)\ \=',0,2);
taskText('�\ ������� Perim({T}) ������������� ����, ��������� �������� ������������~{T}',0,3);
taskText('({T}\ \= �������� ���� TTriangle). �\ ������� ���� ������� ����� ���������',0,4);
taskText('�������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := '_{ABC}'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := '_{ABD}'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := '_{ACD}'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    x0 := otr(x1,y1,x[i,1],y[i,1])+otr(x1,y1,x[i,2],y[i,2])+
          otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    resultR('P'+s[i]+' = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn26(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('��������� ���� TPoint, TTriangle �\ ������� Leng �\ Perim (��.\ �������',0,1);
taskText('\2 �\ \1), ������� ������� Area({T}) ������������� ����,',0,2);
taskText('��������� ������� ������������~{T} ({T}\ \= �������� ���� TTriangle)',0,3);
taskText('�� \I������� ������\i:\[ {S}_{ABC}~=~\R{p}\*({p}\;\-\;|{AB}|)\*({p}\;\-\;|{AC}|)\*({p}\;\-\;|{BC}|)\r,\]',0,4);
taskText('��� {p}\ \= \I������������\i. �\ ������� ���� ������� ����� �������',0,5);
taskText('�������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := '_{ABC}'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := '_{ABD}'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := '_{ACD}'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    a := otr(x1,y1,x[i,1],y[i,1]);
    b := otr(x1,y1,x[i,2],y[i,2]);
    c := otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    resultR('S'+s[i]+' = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn27(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('��������� ���� TPoint, TTriangle �\ ������� Leng �\ Area (��.\ �������',0,1);
taskText('\3\:\1), ������� ������� Dist({P},\;{A},\;{B}) ������������� ����',0,2);
taskText('({P}, {A},~{B}\ \= ��������� ���� TPoint), ��������� ���������� {D}({P},\;{AB})',0,3);
taskText('��\ �����~{P} ��\ ������ {AB} �� �������\[ {D}({P},\,{AB})~=~2\*{S}_{PAB}/|{AB}|,\] ��� {S}_{PAB}\ \= �������',0,4);
taskText('������������~{PAB}. �\ ������� ���� ������� ����� ���������� ��\ �����~{P}',0,5);
taskText('��\ ������~{AB}, {AC},~{BC}, ���� ���� ���������� �����~{P},~{A}, {B},~{C}.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('P: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(64+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := 'AB'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := 'AC'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := 'BC'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    a := otr(x1,y1,x[i,1],y[i,1]);
    b := otr(x1,y1,x[i,2],y[i,2]);
    c := otr(x[i,1],y[i,1],x[i,2],y[i,2]);
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    x0 := 2*x0/c;
    resultR('D(P,'+s[i]+') = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Bn28(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('��������� ���� TPoint, TTriangle �\ ������� Dist (��. ������� \4,',0,1);
taskText('\3, \1), ������� ��������� Altitudes({T},\;{h}_1,\;{h}_2,\;{h}_3),',0,2);
taskText('��������� ������~{h}_1, {h}_2,~{h}_3 ������������~{T} ({T}\ \= ������� �������� ����',0,3);
taskText('TTriangle, {h}_1, {h}_2, {h}_3\ \= �������� ������������ ���������), �����������',0,4);
taskText('�������������� ��\ ������ {T}.{A}, {T}.{B}, {T}.{C}. �\ ������� ���� ��������� �����',0,5);
taskText('������ �������������~{ABC}, {ABD},~{ACD}, ���� ���� ���������� �����~{A},~{B}, {C},~{D}.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    case i of
    1 : begin x[1,1] := x2; y[1,1] := y2; x[2,1] := x2; y[2,1] := y2; s[1] := 'BC'; end;
    2 : begin x[1,2] := x2; y[1,2] := y2; x[3,1] := x2; y[3,1] := y2; s[2] := 'BD'; end;
    3 : begin x[2,2] := x2; y[2,2] := y2; x[3,2] := x2; y[3,2] := y2; s[3] := 'CD'; end;
    end;
  end;
for i := 1 to 3 do
  begin
    c := sqrt(sqr(x1-x[i,1])+sqr(y1-y[i,1]));
    b := sqrt(sqr(x1-x[i,2])+sqr(y1-y[i,2]));
    a := sqrt(sqr(x[i,1]-x[i,2])+sqr(y[i,1]-y[i,2]));
    p := (a+b+c)/2;
    x0 := sqrt(p*(p-a)*(p-b)*(p-c));
    a := 2*x0/a;
    b := 2*x0/b;
    c := 2*x0/c;
    resultComment('A'+s[i]+': ',11,i+1);
    resultR('h_1 = ',a,22,i+1,5);
    resultR('h_2 = ',b,41,i+1,5);
    resultR('h_3 = ',c,60,i+1,5);
  end;
setNumberOfTests(3);
Pause;
end;

function area(x1,y1,x2,y2,x3,y3: real): real;
var a12,a13,a23,p: real;
begin
a12 := otr(x1,y1,x2,y2);
a23 := otr(x2,y2,x3,y3);
a13 := otr(x1,y1,x3,y3);
p := (a12+a23+a13)/2;
area := sqrt(p*(p-a12)*(p-a13)*(p-a23));
end;

procedure SPar30Bn29(Name, Key: string);
var i,j,k : integer;
    t,r: real;
    x,y : array [1..9] of real;
    n : array [1..3] of integer;
    v1,v2,v3 : byte;
begin
start(Name,Topic5,Author,Key,73{level2});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('��������� ��� TPoint �\ ������� Leng (��.\ ������� \5), ������� �������',0,1);
taskText('PerimN({P},\;{N}) ������������� ����, ��������� �������� {N}-���������, �������',0,2);
taskText('�������� (�\ ������� ��\ ������) ���������� �\ �������~{P} �������~{N} (>\,2)',0,3);
taskText('�\ ���������� ���� TPoint. �\ ������� ���� ������� ����� ��������� ����',0,4);
taskText('���������������, ���� ���� ����� ��\ ������ �\ ���������� ��\ ������.',0,5);
(*
*)
end;
2:
begin
taskText('��������� ���� TPoint, TTriangle �\ ������� Area (��.\ �������',0,1);
taskText('\6\:\4), ������� ������� AreaN({P},\;{N}) ������������� ����,',0,2);
taskText('��������� ������� ��������� {N}-���������, ������� �������� (�\ �������',0,3);
taskText('��\ ������) ���������� �\ �������~{P} �������~{N} (>\,2) �\ ���������� ���� TPoint.',0,4);
taskText('�\ ������� ���� ������� ����� ������� ���� ���������������,',0,5);
taskText('���� ���� ����� ��\ ������ �\ ���������� ��\ ������.',0,0);
(*
*)
end;
end;
(*==*)
repeat
  for i := 1 to 3 do n[i] := Random(7)+3;
until (n[1]<6)or(n[2]<6)or(n[3]<6);
k := 0;
if (n[1]<6)and(n[2]<6)and(n[3]<6) then k := 1;
for i := 1 to 3 do
  begin
    inc(k);
    c1 := chr(64+i);
    dataN('N_'+c1+'=',n[i],3,k,1);
    repeat
    t := 0;
    r := RandomR2(3,7); //4*random+3; //2018
    for j := 1 to n[i] do
      begin
        t := t + 6.28*(0.5+Random)/n[i];
        x[j] := r*cos(t);
        y[j] := r*sin(t);
      end;
    until t < 6.28;
    n1 := 0;
    for j := 1 to n[i] do
      begin
        if j=6 then begin inc(k); n1 := 5; end;
        dataR2(c1+'_'+chr(j+48)+':',x[j],y[j],Center(j+1-n1,5,13,1)-11,k,5);
      end;
    case v1 of
    1: begin
    x0 := otr(x[n[i]],y[n[i]],x[1],y[1]);
    for j := 1 to n[i]-1 do
      x0 := x0 + otr(x[j],y[j],x[j+1],y[j+1]);
    resultR('�������� �������������� '+c1+' = ',x0,0,1+i,6);
    end;
    2: begin
    x0 := area(x[1],y[1],x[2],y[2],x[3],y[3]);
    for j := 3 to n[i]-1 do
      x0 := x0 + area(x[1],y[1],x[j],y[j],x[j+1],y[j+1]);
    resultR('������� �������������� '+c1+' = ',x0,0,1+i,6);
    end;
    end;
  end;
setNumberOfTests(3);
Pause;
end;


procedure SPar30Bn30(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  start(Name,Topic5,Author,Key,73{level2});
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
Topic3 := '�������������� ������� �� ��������� � �������';
Topic4 := '��������� � �������: ������ � �������';
Topic5 := '��������� � �������: ������ � ��������';
{Author := '�.~�.~�������, 2002';}
end.

