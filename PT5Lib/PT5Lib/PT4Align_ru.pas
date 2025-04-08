{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4Align_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;



const
  Subgroup1 = '������������ ���������� � ����������� ������������ �����������';
  Subgroup2 = '����������� ������������� ����������';
// ������ � ���������
// �����������-���������� ����������
  Subgroup3 = '���������� ������������ �����';
// ������������ �� ������ ������������� �����������
// ������������ �� ������ ������� ������
  Subgroup4 = '����������� ����������� ������������';
// ������������ � ����������� ���������� ���������
// ���� ���������
  Subgroup5 = '������������ ��������� ����� � ��������� ������������';
// ���������� ������������ ��������� �����
// ��������� ������������ �����
  Subgroup6 = '���������� ���������� ����� ���������������������';
// ����� ������������� ����������������
// ������������� ��������
  Rule_ = '|1  |5  1|0  1|5  2|0  2|5  3|0  3|5  4|0  4|5  5|0  5|5  6|0  6|5  7|0';

const
  fleft = 1;
  fup = 2;
  fdiag = 4;

var DType: integer = 0;
// 0 - �������
// 1 - � ��������
// 2 - � ����������� ���������� ���������
// 3 - ��� ������ ������������ ���������
// 4 - ��� ���������� ������������
    WR: integer = 1;
    WD: integer = 1;

const nmax = 51;

type matr = array[0..nmax,0..nmax] of integer;

type Pair = record
       x2,x3: integer;
     end;

var dd, dk, df, da, dv, we, wf: matr;
    tt,t01,t02: array [1..nmax] of string;
    ind,indl,indl2: array [0..nmax] of integer;
    seq,seq1,l: array [0..nmax] of integer;
    cov,ll,ll2: matr;
    seq2: array [0..2*nmax] of pair;
    b2,p2: array [0..2*nmax] of integer;

var s1,s2,s3,s0,t,s,s01,s02,s00,info,p0,t0: string;
    m,i1,i2,ff,aa,cc,k,k1,k2,mm,nn,cnt,y,d,nl: integer;
    c1,c2: char;

function Rule(k,n: integer): string;
var s: string;
    i: integer;
begin
  result := '';
  if n <2 then
    exit;
  s := Copy(Rule_,1,n+1);
  if (s[length(s)] = '|') or
     (s[length(s)] <> ' ') and (s[length(s)-1] = ' ') then
    s[length(s)] := ' ';
  if (s[length(s)-1] <> ' ') and (s[length(s)-2] = ' ') then
    s[length(s)-1] := ' ';
  result := '';
  for i := 1 to k do
    result := result + ' ';
  result := result + ' '+s;
end;

function CPos(s: string; c: integer): integer;
begin
  result := Center(1,1,length(s)+c,0)-1;
end;

function RPos(w: integer): integer;
begin
  result := (41 - w) div 2 + 41;
end;


function rand(a, b: integer): integer;
begin
  if a >= b then
    result := a
  else
    result := Random(b-a+1) + a;
end;

function randc(n: integer): char;
begin
  result := chr(Random(n) + 97);
  if (DType = 1) and (Random(5) = 0) then
    result := '?';
end;

procedure swap(var i,j: integer);
var k: integer;
begin
  k := i;
  i := j;
  j := k;
end;

function min(a,b: integer): integer;
begin
  if a < b then result := a
  else result := b;
end;

function max(a,b: integer): integer;
begin
  if a > b then result := a
  else result := b;
end;

function min3(left, up, diag: integer; var first, all, cnt: integer): integer;
begin
  result := left;
  first := fleft;
  all := fleft;
  cnt := 1;
  if up = result then
  begin
    all := all + fup;
    cnt := cnt + 1;
  end
  else
    if up < result then
    begin
      result := up;
      first := fup;
      all := fup;
      cnt := 1;
    end;
  if diag = result then
  begin
    all := all + fdiag;
    cnt := cnt + 1;
  end
  else
    if diag < result then
    begin
      result := diag;
      first := fdiag;
      all := fdiag;
      cnt := 1;
    end;
end;

function max3(left, up, diag: integer; var first, all, cnt: integer): integer;
begin
  result := left;
  first := fleft;
  all := fleft;
  cnt := 1;
  if up = result then
  begin
    all := all + fup;
    cnt := cnt + 1;
  end
  else
    if up > result then
    begin
      result := up;
      first := fup;
      all := fup;
      cnt := 1;
    end;
  if diag = result then
  begin
    all := all + fdiag;
    cnt := cnt + 1;
  end
  else
    if diag > result then
    begin
      result := diag;
      first := fdiag;
      all := fdiag;
      cnt := 1;
    end;
end;


function TransformStr(m: integer; s: string): string;
var i,j: integer;
    c: char;
begin
  for i := 1 to Rand(6,12) do
    case Rand(1,3) of
    1: Delete(s,Rand(1,length(s)), 1);
    2: insert(randc(m), s, Rand(1,length(s)));
    3: if s = '' then
         s := randc(m)
       else
       begin
         repeat
         c := randc(m);
         j := rand(1,length(s))
         until c <> s[j];
         s[j] := c;
       end;
    end;
  result := s;
end;

procedure MakeStr(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

end;

procedure MakeStrJ(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 1;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
end;

procedure MakeStrW(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 0;
  repeat
  WD := rand(2,30);
  WR := rand(1,2*WD-1);
  until WD <> WR;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
end;


procedure MakeStrLCS(a,b,m: integer; var s1,s2: string);
var i,nn,mm,k: integer;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  nn := length(s1);
  s2 := TransformStr(m,s1);
  mm := length(s2);
  k := Random(3);
  if k in [0,1] then
  for i := 1 to Rand(5,15) do
    s2 := randc(m) + s2;
  if k in [1,2] then
  for i := 1 to Rand(5,15) do
    s1 := randc(m) + s1;
  if length(s1) > b then
  for i := 1 to length(s1)-b do
    delete(s1,Rand(1,length(s1)),1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  s1 := Copy(s1,1,nn);
  s2 := Copy(s2,1,mm);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

end;



//----------------------------------------------------------------------

function CompareD(c1,c2:char): boolean;
begin
  result := (c1 = c2) or (c1 = '?')or(c2 = '?');
end;

function tt0(i,j: integer): integer;
begin
  case DType of
  0: begin
       if s1[i] = s2[j] then
         result := 0
       else
         result := WR;
     end;
  1: begin
       if CompareD(s1[i], s2[j]) then
         result := 0
       else
         result := 1;
     end;
  end;
end;


procedure CalcD;
var i,j: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dd[i,0] := i*WD;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dd[0,j] := j*WD;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      dd[i,j] := min3(dd[i,j-1]+WD, dd[i-1,j]+WD, dd[i-1,j-1]+tt0(i,j), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
end;

function BackD: string;
var s: string;
    i,j,ii: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  i := nn;
  j := mm;
  s := '';
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      j := j-1;
      s := 'I' + s;
    end
    else
    if df[i,j] = fup then
    begin
      i := i-1;
      s := 'D' + s;
    end
    else
    begin
      if CompareD(s1[i],s2[j]) then
        s := 'M' + s
      else
        s := 'R' + s;
      i := i-1;
      j := j-1;
    end
  end;
  result := s;
end;

procedure BackD2(i,j: integer; s: string);
begin
  if i+j = 0 then
  begin
    cnt := cnt + 1;
    tt[cnt] := s;
  end
  else
  begin
    if da[i,j] and fleft = fleft then
      BackD2(i,j-1,'I' + s);
    if da[i,j] and fup = fup then
      BackD2(i-1,j,'D' + s);
    if da[i,j] and fdiag = fdiag then
    begin
      if CompareD(s1[i],s2[j]) then
        s := 'M' + s
      else
        s := 'R' + s;
      BackD2(i-1,j-1,s);
    end
  end;
end;

procedure ShowMatr(Cmt: string; dm: matr; y,typ: integer);
//  typ = 0 - ��� ��������,
//        1 - ������ ������� � �������,
//        2 - ������ ������� � ��������,
//        3 - ������� � ������� � ��������
//        4 - ��� ������� �����/��������
var i,j,nn,mm,startind: integer;
    s0,s00: string;
begin
  DataComment(Cmt,0,y);
  nn := Length(s1);
  mm := Length(s2);
  if typ and 4 = 4 then
    startind := 1
  else
    startind := 0;
  if typ and 2 = 2 then
  begin
    s0 := '';
    for j := startind to mm do
    begin
      str(j:4,s00);
      s0 := s0 + s00;
    end;
    if Odd(length(s0)) then
      s0 := s0+ ' ';
    DataComment(s0,0,y+1);
  end
  else
    y := y - 1;
  for i := startind to nn do
  begin
    if typ and 1 = 1 then
    begin
      Str(i:2,s00);
      DataComment(s00+':',Center(1, mm+1-startind, 3, 1)-4,i+y+2-startind);
    end;
    for j := startind to mm do
      DataN('',dm[i,j],Center(j+1-startind, mm+1-startind, 3, 1), i+y+2-startind, 3);
  end;
end;

function Trim(s: string): string;
begin
  while (s <> '') and (s[1] = ' ') do
    delete(s,1,1);
  while (s <> '') and (s[length(s)] = ' ') do
    delete(s,length(s),1);
  result := s;
end;

procedure TaskTextExt(s: string);
var i,p: integer;
begin
i := 1;
if s[length(s)] <> '\' then
  s := s + '\\';
while s <> '' do
begin
  p := pos('\\',s);
  TaskText(Copy(s,1,p-1),0,i);
  Delete(s,1,p+1);
  if i in [1..4] then
    inc(i)
  else
    i := 0;
end;
end;


procedure Alignment1;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���������� ��������� �������� �������������� ��� ����� {S}_1 � {S}_2: I \= �������\\'+
'����� ������� �������� {S}_1 �������� ������� �� {S}_2 � ������� � ����������\\'+
'������� {S}_2 (������� ������ {S}_1 �� ����������); D \= �������� �������� ������� {S}_1\\'+
'� ������� � ���������� ������� {S}_1 (������� ������ {S}_2 �� ����������),\\'+
'R \= ������ �������� ������� {S}_1 �� ������� ������ {S}_2, M \= \<������ ��������\>,\\'+
'��� ������� ������� ������� {S}_1 � {S}_2 �� ���������� (����� ���������� ��������\\'+
'R � M ���������� ������� � ���������� ������� � ������ ������). � ���������\\'+
'������ �������� ��������� ��������� ������ ������� �����. ������ ��� ���������\\'+
'\{I, D, R, M\}, �������������� �������������� ������ {S}_1 � ������ {S}_2, ����������\\'+
'\I������������ ������������\i (��� ������ \I������������\i) ��� ������ �����.\\'+
'���� ������ {S}_1, ����������� {T} � ��� �������: {C}_1 � {C}_2. �������� ������ {S}_2,\\'+
'���� ��������, ��� ��� ���������� �������� I ������� �������� ������ {S}_2\\'+
'������ ����������� ������ {C}_1, � ��� ���������� �������� R \= ������ {C}_2.'
);
  m := Rand(10,20);
  repeat
  c1 := Randc(m);
  c2 := Randc(m);
  until c1 <> c2;
  repeat
  MakeStr(30,40,m,s1,s2);
  s2 := '';
  t := '';
  i1 := 1;
  while i1 <= length(s1) do
  begin
    case Rand(1,10) of
    1: begin
         t := t + 'I';
         s2 := s2 + c1;
       end;
    2: begin
         t := t + 'D';
         i1 := i1 + 1;
       end;
    3: begin
         t := t + 'R';
         s2 := s2 + c2;
         i1 := i1 + 1;
       end;
    else begin
         t := t + 'M';
         s2 := s2 + s1[i1];
         i1 := i1 + 1;
       end;
    end;
  end;
  until length(t) < 70;
  DataS('S_1 = ',s1,17,2);
  DataComment(Rule(5,length(s1)),17,3);
  DataS('T  = ',t,17,4);
  DataC('C_1 = ',c1,xLeft,5);
  DataC('C_2 = ',c2,xRight,5);
  ResultS('S_2 = ',s2,17,3);
  ResultComment(Rule(5,length(s2)),17,4);
  SetTestCount(5);
end;

procedure Alignment2;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 � {T}. ������ {T} �������� ������ ������� I, D, R, M.\\'+
'���������, �������� �� ������ {T} ������������ ��� ����� {S}_1 � {S}_2 (�����������\\'+
'����������� ��������� �~\1); ��� ����� ��������� ��������\\'+
'�������������� �� {T} ��� ������ {S}_1, ������� ������ {S''}_1. ���� {T} ��������\\'+
'������������, �.\,�. {S''}_1\,=\,{S}_2, �� ������� 0, ���� �� ��������, �� �������\\'+
'����� ������� ������� {S''}_1, ������������� �� ������� {S}_2 � ��� �� �������\\'+
'(������� ���������� �� 1), ��� \-1, ���� ������� {S''}_1 � {S}_2 � �����������\\'+
'�������� ���������, �� ����� ����� {S''}_1 � {S}_2 ��������. �������� ���������\\'+
'� �������� ���������� ������ {S''}_1.'
);
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  s2 := '';
  t := '';
  i1 := 1;
  while i1 <= length(s1) do
  begin
    case Rand(1,10) of
    1: begin
         t := t + 'I';
         s2 := s2 + randc(m);
       end;
    2: begin
         t := t + 'D';
         i1 := i1 + 1;
       end;
    3: begin
         t := t + 'R';
         repeat
         c1 := randc(m);
         until c1 <> s1[i1];
         s2 := s2 + c1;
         i1 := i1 + 1;
       end;
    else begin
         t := t + 'M';
         s2 := s2 + s1[i1];
         i1 := i1 + 1;
       end;
    end;
  end;
  case Random(6) of
  0: i := 0;
  1: i := Rand(1,5);
  2: i := Rand(1,length(s2));
  3: i := Rand(length(s2)-5, length(s2));
  4,5: i := -1;
  end;
  if i > 0 then
  begin
    repeat
      c1 := randc(m);
    until c1 <> s2[i];
    s2[i] := c1;
  end;
  if i = -1 then
  case Random(2) of
  0: Delete(s2,length(s2)-Rand(1,5),100);
  1: for j := 1 to Rand(1,5) do
       s2 := s2 + Randc(m);
  end;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
  DataS('T  = ',t,3,5);
  ResultN('��������� ��������: ',i,0,3,2);
  SetTestCount(5);
end;

procedure Alignment3;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'\I����������� ������������\i {T} ��� ����� {S}_1 � {S}_2 ���������� �����������\\'+
'(��.~\2), ���������� ����������� ���������� �������� I, D, R\\'+
'(�������� M �� �����������). ���������� �������� I, D, R, ��������\\'+
'� ����������� �����������, ���������� \I������������ �����������\i ����� {S}_1 � {S}_2.\\'+
'���� ������ {S}_1, {S}_2 � ������ ������, ���������� ������ ������� I, D, R, M.\\'+
'��������, ��� ���� �� ���� ������� ����� �������� ����������� ������������\\'+
'��� {S}_1 � {S}_2. ������� ������������ ���������� ����� {S}_1 � {S}_2 � ����������\\'+
'����� ��� ������, ������� �������� ����������� ������������.'
);
  m := Rand(10,20);
  repeat
  MakeStr(18,25,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 3) and (dk[nn,mm] <= 10);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  for i := 2 to 4 do
  case Random(4) of
  0: Delete(tt[i],Rand(1,length(tt[i])),1);
  1: begin
     case Random(4) of
     0: c1 := 'I';
     1: c1 := 'D';
     2: c1 := 'M';
     3: c1 := 'R';
     end;
     Insert(c1, tt[i], Rand(1,length(tt[i])));
     end;
  2: begin
       for j := 1 to 20 do
       begin
         k := Rand(1,length(tt[i]));
         if tt[i][j]='R' then
           break;
       end;
       Delete(tt[i],k,1);
       case Random(2) of
       0: Insert('DI',tt[i],k);
       1: Insert('ID',tt[i],k);
       end;
     end;
  3: begin
     repeat
     case Random(4) of
     0: c1 := 'I';
     1: c1 := 'D';
     2: c1 := 'M';
     3: c1 := 'R';
     end;
     k := Rand(1,length(tt[i]));
     until tt[i][k] <> c1;
     tt[i][k] := c1;
     end;
  end;
  j := 0;
  for i := 1 to 4 do
  begin
    ind[i] := i;
    if length(tt[i])>j then
      j := length(tt[i]);
  end;
  for i := 1 to 10 do
    swap(ind[Rand(1,4)],ind[Rand(1,4)]);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataComment(Rule(0,j),43,1);
  for i := 1 to 4 do
  begin
  Str(i,s0);
  DataComment(s0+':',40,i+1);
  DataS('',tt[ind[i]],43,i+1);
  if ind[i]=1 then y := i;
  end;
  ResultN('������������ ����������: ',dd[nn,mm],0,2,2);
  ResultN('����� ������ \= ������������ �����������: ',y,0,4,2);
  SetTestCount(5);
end;

procedure Alignment4;
var
  i,j,cnt: integer;
function D(i,j: integer): integer;
begin
  inc(cnt);
  if i = 0 then
    result := j
  else
    if j = 0 then
      result := i
    else
      result := min3(D(i,j-1)+1, D(i-1,j)+1, D(i-1,j-1)+tt0(i,j), ff,aa,cc);
end;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 � ����� {k}_1, {k}_2 (0\,\l\,{k}_1\,\l\,|{S}_1|, 0\,\l\,{k}_2\,\l\,|{S}_2|).\\'+
'����� {D}({i},\,{j}), ������������ ������������ ���������� ����� �������� {S}_1[1..{i}]\\'+
'� {S}_2[1..{j}] (��.~\1). ����������� ��������� �����������:\\'+
'\(\X ��� ������ {i} {D}({i},\,0)\,=\,{i};\| \X ��� ������ {j} {D}(0,\,{j})\,=\,{j};\| \X ���� {i}\,>\,0 � {j}\,>\,0,\\'+
'�� {D}({i},\,{j})\,=\,min\{{D}({i}\,\-\,1,\,{j})\,+\,1, {D}({i},\,{j}\,\-\,1)\,+\,1, {D}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,t({i},\,{j})\},\\'+
'��� {t}({i},\,{j})\,=\,1, ���� {S}_1[{i}]\,\n\,{S}_2[{j}], � {t}({i},\,{j})\,=\,0, ���� {S}_1[{i}]\,=\,{S}_2[{j}].\)\\'+
'����� {D}({k}_1,\,{k}_2), ��������� ����������� �������, ����������� ����������\\'+
'�� ����������� �������� (��� ���������� \I���������� ��������\i). �������\\'+
'�������� {D}({k}_1,\,{k}_2) � ���������� ����������� ������� �������, �������\\'+
'������������� ��� ��� ����������.\\'+
'\P\S����������\s. �������� ������� ������ �����������\\'+
'(� ����� ������ ���������� ������������� ���������� {D}({k}_1,\,{k}_2))\\'+
'����� �������� ���� ������ � ����������� ������ (��� ������ �����)\\'+
'\<��������\> ������� ���������� \I���������� ������������� ����������������\i.'
);
(*
*)
  m := Rand(10,20);
  MakeStr(30,40,m,s1,s2);
  cnt := 0;
  k1 := Rand(0,8);//length(s1));
  k2 := Rand(0,8);//length(s2));
  DataS('S_1 = ',S1,18,2);
  DataS('S_2 = ',S2,18,3);
  DataComment(Rule(5,max(length(s1),length(s2))),18,4);
  DataN('k_1 = ',k1,xleft,5,1);
  DataN('k_2 = ',k2,xright,5,1);
  ResultN('D(k_1,k_2) = ',D(k1,k2),0,2,1);
  ResultN('���������� ����������� �������: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment5;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
TaskTextExt(
'���� ������ {S}_1 � {S}_2. ��� ������������ ���������� ������������� ����������\\'+
'{D}(|{S}_1|,\,|{S}_2|) ����� ������� �������� �� �������� �� \1 �����\\'+
'������������ ��������� \I����� ���������� ��������\i. �������� � ������������\\'+
'������� {D} ������� (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1), ������� � ������� ������� ����������\\'+
'��~0. ������� ����������� �������� ������� ������� � �������� �������:\\'+
'{D}_{0,j}\,=\,{j}, {D}_{i,0}\,=\,{i}. ����� ����������� ���������������� ����������\\'+
'�� �������� ��������� ��������� �������; ��� ���� ��� ���������� ����������\\'+
'�������� {D}_{i,j} ������������ ��� ��������� ��������, ������������� �����\\'+
'(������� {D}_{i,j\-1}), ���� (������� {D}_{i\-1,j}) � ����� � ���� (������� {D}_{i\-1,j\-1})\\'+
'������������ ��������. �������, ������������� � ��������� �������\\'+
'� ��������� �������, ����� ������������� ����������. ��������� �����\\'+
'���������� ��������, ����� ������� {D} � ������� �������� �� ���� ���������\\'+
'�������: {D}_{n\-1,j}, {j}\,=\,0,\.,\,|{S}_2|, {D}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, ��� {n}\,=\,|{S}_1|.'
);
  m := Rand(10,20);
  MakeStr(20,24,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);

  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:3,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 2, 1), 3, 2);
  ResultComment('D_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 2, 1), 5, 2);
  SetTestCount(5);
end;


procedure Alignment6;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ��������� ����� ���������� �������� (��.~\1)\\'+
'���, ����� �� �������� ����� �� ������ ������������ ����������,\\'+
'�� � ���������� ��������� ����������� �����������. ��� ����� �������������\\'+
'������ � ������������ ������� {K} ���� �� �������, ��� � ������� {D}, � ���������\\'+
'��� ������� ��������� � {D} �� ��������� ��������: {K}_{0,j}\,=\,1, {K}_{i,0}\,=\,1,\\'+
'�������� {K}_{i,j} ��� {i}\,>\,0 � {j}\,>\,0 ����� ����� �������� ��� ��������� {K}_{i,j\-1},\\'+
'{K}_{i\-1,j}, {K}_{i\-1,j\-1}, ������� ������������� ��������� ������� {D}, ������\\'+
'������� � ������� ��� {D}({i},\,{j}). �������, ������������� � ��������� �������\\'+
'� ��������� ������� ������� {K}, ����� ���������� ��������� �����������\\'+
'�����������. ������� ��������� ������� ������ {D} � {K}.'
);
  m := Rand(10,20);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  ResultComment(s0,0,1);
  ResultComment('D_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;

procedure Alignment7;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������� {D}, ���������� ������� ���������� ��������\\'+
'(��.~\2). ��������, ��� ������� ������������ ����������� �����������\\'+
'��� {S}_1 � {S}_2. ����� ��� �����������, �������� \I�������� ������\i �� ������� {D},\\'+
'������� � �� ������� ������� �������� � ���������� ����� ������� ���������;\\'+
'��� ���� ��� ������� �������� {D}_{i,j} ��� {i}\,>\,0 � {j}\,>\,0 ����������� �����������\\'+
'� ��� �� ��������� {D}_{i,j\-1}, {D}_{i\-1,j}, {D}_{i\-1,j\-1}, �� ������� �����������\\'+
'������� � ������� ��� {D}({i},\,{j}) (��.~\3), ��� ��������� {D}_{0,j}\\'+
'����������� ������ ����������� �����, � ��� ��������� {D}_{i,0} \= �����.\\'+
'����������� ����� ������������� �������� I, ����������� ����� \= �������� D,\\'+
'� ����������� �� ��������� ����� � ����� \= �������� R, ���� {S}_1[{i}]\,\n\,{S}_2[{j}],\\'+
'� �������� M, ���� {S}_1[{i}]\,=\,{S}_2[{j}] (�������� ����������� � �����������\\'+
'������ ������). ������� ��������� ����������� �����������.'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] = 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('�������� ������� D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;

procedure Alignment8;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������� {D}, ���������� ������� ���������� ��������\\'+
'(��.~\3). ����� ���� �� ��������� ������������ �����������\\'+
'��� {S}_1 � {S}_2, �������� �������� ������ �� ������� {D} (��.~\1).\\'+
'���� ��� ���������� �������� {D}_{i,j} �������� ����������� ����� ��� � ����\\'+
'�� ��� �������� ��������� {D}_{i,j\-1}, {D}_{i\-1,j}, {D}_{i\-1,j\-1}, �� ������������\\'+
'�������� ����������� ����� (���������������� �������� I), � ��� ���\\'+
'������������� \= ����������� ����� (���������������� �������� D). �������\\'+
'��������� ����������� �����������.'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('�������� ������� D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;

procedure Alignment9;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������� {D}, ���������� ������� ���������� ��������\\'+
'(��.~\4). ����� ��� ����������� ����������� ��� {S}_1 � {S}_2, ��������\\'+
'�������� ������ �� �������~{D} (��.~\2). ���� ��� ����������\\'+
'�������� {D}_{i,j} �������� ����������� ����� ��� � ���� �� ��� ��������\\'+
'��������� {D}_{i,j\-1}, {D}_{i-1,j}, {D}_{i-1,j-1}, �� ������������ ���������\\'+
'������� �������� ���������� � ������ ������� ��������: I (����������� �����),\\'+
'D (����������� �����), R ��� M (����������� �� ���������). ����������� ����\\'+
'��� ��������� ���� � ���� ����������� �������, ���������� ����������� �������\\'+
'������� ������� �� ����� ��������� ����������� � �������� ��������. �������\\'+
'��� ��������� ����������� ����������� (������� ������ �����������\\'+
'������ ��������������� ������� �� ����������).'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('�������� ������� D:',dd,3,0);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);

  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment10;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);

  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ������������ ���������� � ���� �� ���������\\'+
'������������ ����������� ��� {S}_1 � {S}_2, ��������� ����� ���������� ��������\\'+
'��� ���������� �������~{D} (��.~\5) � �������� �������� ������\\'+
'�� �������~{D} (��.~\3). ����� �������� ������������ �����������\\'+
'��������� � ������������ � ���������� \2.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultN('������������ ����������: ',dd[nn,mm],0,2,2);
  ResultComment('������� ������������ �����������:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;

procedure Alignment11;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'\\���� ������ {S}_1 � {S}_2. ����� ������������ ���������� � ��� ��������\\'+
'������������ ����������� ��� {S}_1 � {S}_2, ��������� ����� ���������� ��������\\'+
'��� ���������� �������~{D} (��.~\6) � �������� ��������\\'+
'������ �� �������~{D} (��.~\4 �~\2).'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('������������ ����������: ',dd[nn,mm],xLeft,1,2);
  ResultComment('����������� �����������:',xRight,1);

  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//---------------------------------------------------------------

procedure Alignment12;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ������ ����� ��������� ������ ������-\I������\i \<?\>,\\'+
'������� ��������� ����������� � ����� ��������. ��� ���������� �������������\\'+
'����������� ��� ����� � ��������� \<������\> �������� M ����� �����������\\'+
'�� ������ ��� ���������� ������� �������� �����, �� � � ������, ����� ����\\'+
'��� ��� ������� ������� �������� ���������. �������������� ������� ��� {D}({i},\,{j}),\\'+
'����������� �~\8, � ������ ��������������� ������� ��� ��������\\'+
'� ����� ������������ ���������� ��� {S}_1 � {S}_2, ��������� ����� ����������\\'+
'��������, ��������� �~\7. ������� �������� ���� ���������\\'+
'������� �������~{D}: {D}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {D}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|,\\'+
'��� {n}\,=\,|{S}_1| (��������� ������� ����� ����� ������������� ����������).'
);
  m := Rand(10,20);
  MakeStrJ(20,24,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);

  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:3,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 2, 1), 3, 2);
  ResultComment('D_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 2, 1), 5, 2);
  SetTestCount(5);
end;


procedure Alignment13;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\1). ��������� ����� ���������� �������� (��.~\8) ���,\\'+
'����� �� �������� ����� �� ������ ������������ ���������� (� ������ �������\\'+
'��������), �� � ���������� ��������� ����������� �����������. ��� �����\\'+
'������������� ������ � ������������ ������� {K} ���� �� �������,\\'+
'��� � ������� {D}, � ��������� ��� ������� ��������� � {D}\\'+
'�� ��������, ����������� ����������� �~\7. �������\\'+
'��������� ������� ������ {D} �~{K}.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  ResultComment(s0,0,1);
  ResultComment('D_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment14;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\2), � �������~{D}, ����������� ������� ���������� ��������\\'+
'(��.~\9) � ������ ��������. ����� ���� �� ��������� ������������\\'+
'����������� ��� {S}_1 � {S}_2, ������������� �������� ��������� �������\\'+
'�� �������~{D} (��.~\7) � ������ ������� ��������. ����� ��������\\'+
'������������ ����������� ��������� � ������������ � ���������� \6.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('�������� ������� D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;



procedure Alignment15;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\3), � �������~{D}, ����������� ������� ���������� ��������\\'+
'(��.~\10) � ������ ��������. ����� ��� ����������� �����������\\'+
'��� {S}_1 � {S}_2, ������������� �������� ��������� �������, ���������\\'+
'�~\8 �~\6, � ������ ������� ��������.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('�������� ������� D:',dd,3,0);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);

  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment16;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\4). ����� ������������ ���������� � ���� �� ���������\\'+
'������������ ����������� ��� {S}_1 � {S}_2, ��������� ���������������� �����\\'+
'���������� �������� ��� ���������� �������~{D} (��.~\11) � ������\\'+
'������� �������� � �������� �������� ������ �� �������~{D}\\'+
'(��.~\9). ����� �������� ������������ �����������\\'+
'��������� � ������������ � ���������� \8.'
);

  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultN('������������ ����������: ',dd[nn,mm],0,2,2);
  ResultComment('������� ������������ �����������:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;



procedure Alignment17;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\5). ����� ������������ ���������� � ��� �������� ������������\\'+
'����������� ��� {S}_1 � {S}_2, ��������� ���������������� ����� ����������\\'+
'�������� ��� ���������� �������~{D} (��.~\12) � ������ ������� ��������\\'+
'� �������� �������� ������ �� �������~{D} (��.~\10 �~\8).'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('������������ ����������: ',dd[nn,mm],xLeft,1,2);
  ResultComment('����������� �����������:',xRight,1);
  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//----------------------------------------------------------------------

procedure Alignment18;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������������� ����� {d} � {r}. ����� {d} ���������� \I���\i\\'+
'(\<���������\>) �������� ������� � �������� (I � D), ����� {r} \= ��� ��������\\'+
'������ R (��� \<������\> �������� M ��������� ������ 0). \I����������� ����������\i\\'+
'\I������������\i {T} ��� ����� {S}_1 � {S}_2 ���������� �����������, ��������� ���\\'+
'�������� � ������� �������� �����������. ��������� ��� ��������, ��������\\'+
'� ����������� ���������� �����������, ���������� \I�����������-����������\i\\'+
'\I�����������\i ����� {S}_1 � {S}_2. ����� {D''}({i},\,{j}) ������������ �����������-����������\\'+
'���������� ����� �������� {S}_1[1..{i}] � {S}_2[1..{j}]. �������� ������������ �������\\'+
'��� {D''}({i},\,{j}), ������������� ������� ��� {D}({i},\,{j}), ����������� � \14,\\'+
'� ����� �����������-���������� ���������� ��� {S}_1 � {S}_2, �������� � ������� {D}''\\'+
'����� ���������� �������� (��. �~\13). ������� �������� ���� ���������\\'+
'������� ������� {D''}: {D''}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {D''}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, ��� {n}\,=\,|{S}_1|\\'+
'(��������� ������� ����� ����� �����������-����������� ����������).\\'+
'\P\S����������\s. ��������� �������� ������ R ����� ���� ������� � �����������������\\'+
'���������� �������� ������� I � �������� D, ��� {r} ������ ���� \I������\i\\'+
'���������� ���� {d}; � ��������� ������ ���� ��� ����������� ����������\\'+
'����������� �� ����� ��������� �������� R (��� {r}\,>\,2{d}), ���� �����\\'+
'����������� ���������� ����������� ����� ����� ������������� � ����,\\'+
'�� ����������� R (��� {r}\,=\,2{d}).'
);
  m := Rand(10,20);
  MakeStrW(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D''_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('D''_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment19;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������������� ����� {d} � {r}. ��������� ����� ����������\\'+
'�������� (��.~\1) ���, ����� �� �������� ����� �� ������\\'+
'�����������-���������� ����������, �� � ���������� ��������� �����������\\'+
'���������� �����������. ��� ����� ������������� ������ � ������������\\'+
'������� {K''} ���� �� �������, ��� � ������� {D''}, � ��������� ��� �������\\'+
'��������� � {D''} �� ��������, ����������� �����������\\'+
'�~\13. ������� ��������� ������� ������ {D''} �~{K''}.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  ResultComment(s0,0,1);
  ResultComment('D''_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K''_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment20;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������������� ����� {d}, {r} � ������� {D''}, �����������\\'+
'������� ���������� �������� (��.~\2). ����� ���� �� �����������\\'+
'���������� ����������� ��� {S}_1 � {S}_2, ��������� �������� ��������� �������\\'+
'�� ������� {D''} (��. �~\13). ����� �������� ������������ �����������\\'+
'��������� � ������������ � ���������� \12.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('d = ',WD,52,2,1);
  DataN('r = ',WR,62,2,1);
  ShowMatr('�������� ������� D'':',dd,3,1);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;



procedure Alignment21;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'\\���� ������ {S}_1 � {S}_2, ������������� ����� {d}, {r} � ������� {D''}, �����������\\'+
'������� ���������� �������� (��.~\3). ����� ��� �����������\\'+
'���������� ����������� ��� {S}_1 � {S}_2, �������� � ������� {D''} ��������\\'+
'��������� �������, ��������� �~\14 �~\12.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('d = ',WD,52,2,1);
  DataN('r = ',WR,62,2,1);
  ShowMatr('�������� ������� D'':',dd,3,1);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment22;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������������� ����� {d} � {r}. ����� �����������-����������\\'+
'���������� � ���� �� ��������� ������������ ����������� ����������� ��� {S}_1\\'+
'� {S}_2, ��������� ���������������� ����� ���������� �������� ��� ����������\\'+
'������� {D''} (��.~\4) � �������� �������� ������ �� ������� {D''}\\'+
'(��.~\15). ����� �������� ������������ ����������� �����������\\'+
'��������� � ������������ � ���������� \14.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  ResultN('�����������-���������� ����������: ',dd[nn,mm],0,2,2);
  ResultComment('������� ������������ ����������� �����������:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;

procedure Alignment23;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ������������� ����� {d} � {r}. ����� �����������-����������\\'+
'���������� � ��� �������� ������������ ����������� ����������� ��� {S}_1 � {S}_2,\\'+
'��������� ���������������� ����� ���������� �������� ��� ����������\\'+
'������� {D''} (��.~\5) � �������� �������� ������\\'+
'�� ������� {D''} (��.~\16 �~\14).'
);
  m := Rand(10,20);
  repeat
  MakeStrW(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('�����������-���������� ����������: ',dd[nn,mm],xLeft,1,2);
  ResultComment('����������� ���������� �����������:',xRight,1);
  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------
procedure AlignD(s1,s2,T: string; var s01,s02: string);
var i,n1,n2: integer;
begin
  s01 := '';
  s02 := '';
  n1 := 1;
  n2 := 1;
  for i := 1 to length(T) do
    case T[i] of
    'I': begin
           s01 := s01 + ' ';
           s02 := s02 + s2[n2];
           n2 := n2 + 1;
         end;
    'D': begin
           s01 := s01 + s1[n1];
           s02 := s02 + ' ';
           n1 := n1 + 1;
         end;
    'R','M':
         begin
           s01 := s01 + s1[n1];
           s02 := s02 + s2[n2];
           n1 := n1 + 1;
           n2 := n2 + 1;
         end;
    end;
end;

procedure Alignment24;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'\I���������� �������������\i ���� ����� ���������� ��������� �� ��������������,\\'+
'������� ����������� �� ������� � ��� �������� (��������, � �� ������)\\'+
'� ���������� ������������ ����� ���� ��� ������ ����� �������, ����� ������\\'+
'������ ��� ������ ����� ������ ������������ �������� ������� ��� �������\\'+
'������ ������. ������������, ���������� ����������� ����� ��� �������������\\'+
'�������� (� ��� ����� ��� \<������\:������\>), ���������� \I�����������\i\\'+
'\I������������ �������������\i. ���� ������ {S}_1, {S}_2 � ������ {T} \= ����\\'+
'�� ��������� ������������ ����������� (��.~\21). ���������\\'+
'������ {A}_1 � {A}_2, ����������� ����������� ������������ ������������\\'+
'����� {S}_1 � {S}_2 �� ������ ����������� {T}, �������� ��������� ��������������:\\'+
'���� ��������� ��������� ����������� {T} �������� ������� (I), �� � {A}_1\\'+
'����������� ������, � � {A}_2 \= ������� ������ {S}_2; ���� ��������� ���������\\'+
'�������� �������� (D), �� ������ ����������� � {A}_2, � � {A}_1 \= �������\\'+
'������ S_1; � ������ �������� ������ (R) � \<������\> �������� (M) � {A}_1 � {A}_2\\'+
'����������� ������� ������� {S}_1 � {S}_2 �������������� (����� �������, ��������\\'+
'������ ������������� ���������� �� ����� ������ ��������� �������� ����� {S}_1\\'+
'� {S}_2, � \<������\> �������� \= ���������� �� ����� ������ ���������� ��������).\\'+
'����� ������� �������� ������� �����-���� ������ ������� ����������\\'+
'��������� ������ ���� ������. ������� ���������� ������ {A}_1 � {A}_2.'
);
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataS('T  = ',t,3,5);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(5,length(t)),3,4);
  SetTestCount(5);
end;

procedure Alignment25;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ���� �� ��������� ������������ �����������\\'+
'��� ������ �����, ��������� ����� ���������� �������� ��� ����������\\'+
'�������~{D} (��.~\20) � �������� �������� ������ �� �������~{D}\\'+
'(��.~\18). ����� �������� ������������ ����������� ���������\\'+
'� ������������ � ���������� \17. ��������� �� ������ ����������\\'+
'����������� ����������� ������������ ������������ ({A}_1,~{A}_2)\\'+
'(��.~\1) � ������� ��������� ������������.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(t)),4,4);
  SetTestCount(5);
end;

procedure Alignment26;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ��� �������� ������������ ����������� ��� ������\\'+
'�����, ��������� ����� ���������� �������� ��� ���������� �������~{D}\\'+
'(��.~\21) � �������� �������� ������ �� �������~{D}\\'+
'(��.~\19 �~\17). ��������� �� ������ ������� ����������\\'+
'����������� ����������� ������������ ������������ ({A}_1,~{A}_2)\\'+
'(��.~\2). ������� ��� ��������� ������������ ({A}_1,~{A}_2)\\'+
'� �������, ��������������� ������� ���������� ����������� �����������.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 2) and (dk[nn,mm] < 8);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  AlignD(s1,s2,tt[i],s01,s02);
  ResultS('A_1 = ',s01,14,y);
  y := y + 1;
  ResultS('A_2 = ',s02,14,y);
  y := y + 1;
  ResultComment(Rule(5,length(tt[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment27;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\15). ����� ���� �� ��������� ������������ �����������\\'+
'��� ������ �����, ��������� ���������������� ����� ���������� ��������\\'+
'��� ���������� �������~{D} (��.~\22) � ������ ������� ��������\\'+
'� �������� �������� ������ �� �������~{D} (��.~\20). ����� ��������\\'+
'������������ ����������� ��������� � ������������ � ���������� \19.\\'+
'��������� �� ������ ���������� ����������� ����������� ������������\\'+
'������������ ({A}_1,~{A}_2) (��.~\3) � ������� ��������� ������������.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(t)),4,4);
  SetTestCount(5);
end;

procedure Alignment28;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ������� ����� ��������� ������-������ \<?\>\\'+
'(��.~\16). ����� ��� �������� ������������ �����������\\'+
'��� ������ �����, ��������� ����� ���������� �������� ��� ����������\\'+
'�������~{D} (��.~\23) � ������ ������� �������� � �������� ��������\\'+
'������ �� �������~{D} (��.~\21 �~\19). ��������� �� ������\\'+
'������� ���������� ����������� ����������� ������������ ������������\\'+
'({A}_1,~{A}_2) (��.~\4). ������� ��� ��������� ������������ ({A}_1,~{A}_2)\\'+
'� �������, ��������������� ������� ���������� ����������� �����������.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 2) and (dk[nn,mm] <= 8);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  AlignD(s1,s2,tt[i],s01,s02);
  ResultS('A_1 = ',s01,14,y);
  y := y + 1;
  ResultS('A_2 = ',s02,14,y);
  y := y + 1;
  ResultComment(Rule(5,length(tt[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------------

var ss: array [1..nmax, 1..nmax] of integer;
    jmax, imax: array [1..nmax] of integer;
    njmax,nimax,dvsmax: integer;


procedure CalcSS(smin,smax: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := Rand(0,smax);
  ss[m+1,m+1] := 0;
  for i := 1 to m do
  begin
    ss[i,m+1] := Rand(smin,-1);
    ss[m+1,i] := ss[i,m+1];
  end;
  for i := 1 to m-1 do
    for j := i+1 to m do
    begin
    ss[i,j] := Rand(max(smin, ss[i,m+1]+ss[j,m+1]),-1);
    ss[j,i] := ss[i,j];
    end;
end;

function ShowSS(y: integer): integer;
// ���������� ��������� ������� Y ������� �������� ������
var i,j: integer;
begin
  for i := 1 to m do
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m-1+i,19,4,0),y);
  DataComment(' \< \>',Center(19,19,4,0),y);
  DataComment('������� ����������� �����', 7, y+1);
  DataComment('������������ ������� ������:', 6, y+2);
  for i := 1 to m do
  begin
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m-1,19,4,0),y+i);
    for j := i to m+1 do
      DataN('',ss[i,j],Center(19-m-1+j,19,3,1)-1,y+i,3);
  end;
  DataComment(' \< \>',Center(19-m-1,19,4,0),y+m+1);
  DataN('',ss[m+1,m+1],Center(19,19,3,1)-1,y+m+1,3);
  result := y+m+2;
end;

function ss0(c1,c2: char): integer;
var n1,n2: integer;
begin
  if c1 = ' ' then
    n1 := m+1
  else
    n1 := ord(c1)-97+1;
  if c2 = ' ' then
    n2 := m+1
  else
    n2 := ord(c2)-97+1;
  result := ss[n1,n2];
end;

function FreeSpaces: integer;
var max,i,j,nn,mm: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  max := -MaxInt;
  for j := 0 to mm do
    if dv[nn,j]>max then
      max := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm]>max then
      max := dv[i,mm];
  result := max;
  dvsmax := max;
  njmax := 0;
  for j := 0 to mm-1 do
    if dv[nn,j]=max then
    begin
      njmax := njmax + 1;
      jmax[njmax] := j;
    end;
  nimax := 0;
  for i := 0 to nn-1 do
    if dv[i,mm]=max then
    begin
      nimax := nimax + 1;
      imax[nimax] := i;
    end;

end;

function CalcV: integer;
var i,j,k,k1,k2: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    if DType in [0,3] then
      for k := 1 to i do
        dv[i,0] := dv[i,0] + ss0(s1[k],' ');
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    if DType = 0 then
      for k := 1 to j do
        dv[0,j] := dv[0,j] + ss0(' ',s2[k]);
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      dv[i,j] := max3(dv[i,j-1]+ss0(' ',s2[j]), dv[i-1,j]+ss0(s1[i],' '), dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      if (DType = 4) and (dv[i,j] < 0) then
        dv[i,j] := 0;
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;

procedure BackV(var s01, s02: string);
var s: string;
    i,j,ii,jj: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  s01 := '';
  s02 := '';
  i := nn;
  j := mm;
  if DType = 2 then
    if njmax > 0 then
    begin
      j := jmax[1];
      for jj := mm downto j+1 do
      begin
        s01 := ' '+s01;
        s02 := s2[jj] + s02;
      end;
    end
    else
    if nimax > 0 then
    begin
      i := imax[1];
      for ii := nn downto i+1 do
      begin
        s01 := s1[ii]+s01;
        s02 := ' ' + s02;
      end;
    end;
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
    end
    else
    if df[i,j] = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
  end;
end;

procedure BackV2(i,j: integer; s01, s02: string);
var mm,nn,ii,jj: integer;
begin
  if i+j = 0 then
  begin
    cnt := cnt + 1;
    if cnt <= nmax then
    begin
      t01[cnt] := s01;
      t02[cnt] := s02;
    end;
  end
  else
  begin
    if (DType = 2) and (i = length(s1)) and (j = length(s2)) then
    begin
      nn := Length(s1);
      mm := Length(s2);
      i := nn;
      for k := 1 to njmax do
      begin
        j := jmax[k];
        s01 := '';
        s02 := '';
        for jj := mm downto j+1 do
        begin
          s01 := ' '+s01;
          s02 := s2[jj] + s02;
        end;
        BackV2(i,j,s01,s02);
      end;
      j := mm;
      for k := 1 to nimax do
      begin
        i := imax[k];
        s01 := '';
        s02 := '';
        for ii := nn downto i+1 do
        begin
          s01 := s1[ii]+s01;
          s02 := ' ' + s02;
        end;
        BackV2(i,j,s01,s02);
      end;
      s01 := '';
      s02 := '';
      i := nn;
      j := mm;
      if dvsmax <> dv[nn,mm] then
        exit;
    end;
    if da[i,j] and fleft = fleft then
      BackV2(i,j-1, ' ' + s01, s2[j] + s02);
    if da[i,j] and fup = fup then
      BackV2(i-1,j, s1[i] + s01, ' ' + s02);
    if da[i,j] and fdiag = fdiag then
      BackV2(i-1,j-1, s1[i] + s01, s2[j] + s02);
  end;
end;

procedure Alignment29;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'����� \E \= �������, ������������ ��� ����� {S}_1 � {S}_2, \E{''} \= ������� \E,\\'+
'����������� ��������. ��� {x}, {y} �� \E{''} ����� {s}({x},\,{y}) (=\,{s}({y},\,{x})) ������������\\'+
'\I������\i {x} � {y} \= ������������� ��� ���� �������� {x} � {y} ��� �� ������������\\'+
'���� �������� �����. ������������ �������, ���������� ������� ��������\\'+
'�������� {s}({x},\,{y}), ���������� \I�������� ������\i. ���� ({A}_1,~{A}_2) \= ���������\\'+
'������������ ����� {S}_1 � {S}_2 (��.~\5), �� \I������ ������ ������������\i\\'+
'������������ ��� ����� ���� ������ {s}({A}_1[{i}],\,{A}_2[{i}]), {i}\,=\,1,\,\.,\,|{A}_1|.\\'+
'���� ������������ ({A}_1,~{A}_2) � ����� {m} (<\,10); ������� ������������ �����\\'+
'{m} ������ �������� ��������� ����. ����� ���� ������� ������ (������� {m}\,+\,1),\\'+
'� ������� ������� � ������� ������������� ��������� ������, �������������\\'+
'� ���������� �������, � ������ ������������� ��������� ������� � �������\\'+
'(� ���� �������������� ������� ������ ���������� ������ �� \I�������\i\\'+
'\I����������� �����\i, �.\,�. ��������, ������� �� ������� ���������\\'+
'� ���� ���). ����� ������ ������ ������� ������������.\\'+
'\P\S����������\s. � ������� ������ ��������, ������� �� ������� ���������,\\'+
'��� �������, ��������������, � ��������� �������� ������������; �����\\'+
'�������, ������� �������� ��� ������������� �������� � ������������ ��������\\'+
'� ���������� ������ ������ ������������ �� ���� \<�������\>, ���������\\'+
'� ��������� � ��������������. ��� ���� ������ ��� ������������ �������� {x}, {y}\\'+
'������ ������ ��������� ������ �� ��� �������, ������������� �������� ����\\'+
'��������: {s}({x},\,{y})\,>\,{s}({x},\,\_)\,+\,{s}(\_,\,{y}) (������ \<\_\> ���������� ������);\\'+
'����� �������, ����� �� ������������ ��������� �������� ������ ������\\'+
'�� ���������� �������� �������� ���� ��������).'
);
  m := Rand(4,8);
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  until max(length(s01),length(s02)) < 30;
  CalcSS(-9,9);
  DataS('A_1 = ',s01,3,1);
  DataS('A_2 = ',s02,3,2);
  DataComment(Rule(4,length(t)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  k := 0;
  for i := 1 to length(s01) do
    k := k + ss0(s01[i],s02[i]);
  ResultN('',k,0,3,2);
  SetTestCount(5);
end;


procedure Alignment30;
var
  i,j: integer;
function V(i,j: integer): integer;
var k: integer;
begin
  inc(cnt);
  result := 0;
  if i = 0 then
    for k := 1 to j do
      result := result + ss0(' ',s2[k])
  else
    if j = 0 then
    for k := 1 to i do
      result := result + ss0(s1[k],' ')
    else
      result := max3(V(i,j-1)+ss0(' ',s2[j]), V(i-1,j)+ss0(s1[i],' '), V(i-1,j-1)+ss0(s1[i],s2[j]), ff,aa,cc);

end;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'\I����������� ��������� �������������\i ����� {S}_1 � {S}_2 (��� ������ \I�����������\i\\'+
'\I�������������\i) ���������� ����� ������������, ������� ������������ ������\\'+
'������ (����������� ������ ��������� � \1). ��� ���� ����\\'+
'������������ ������ ������ ���������� \I��������� �����\i {S}_1 � {S}_2.\\'+
'���� ������ {S}_1, {S}_2 � ����� {k}_1, {k}_2 (0\,\l\,{k}_1\,\l\,|{S}_1|, 0\,\l\,{k}_2\,\l\,|{S}_2|). ����� ����, ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ���������\\'+
'����, � ������� ������ (��������� ������� ������� � \1).\\'+
'����� {V}({i},\,{j}) ������������ �������� ����� {S}_1[1..{i}] � {S}_2[1..{j}]. �����������\\'+
'��������� ����������� (������ ������������� \<\_\> ���������� ������):\\'+
'\(\X ��� ������ {i} {V}({i},\,0)\,=\,\E_{k=1,\.,i}{s}({S}_1[{k}],\,\_);\|\\'+
'\X ��� ������ {j} {V}(0,\,{j})\,=\,\E_{k=1,\.,j}{s}(\_,\,{S}_2[{k}]);\|\\'+
'\X ���� {i}\,>\,0 � {j}\,>\,0, �� {V}({i},\,{j})\,=\,max\{{V}({i}\,\-\,1,\,{j})\,+\,{s}({S}_1[{i}],\,\_), {V}({i},\,{j}\,\-\,1)\,+\,{s}(\_,\,{S}_2[{j}]),\\'+
'{V}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\}.\) ����� {V}({k}_1,\,{k}_2), ��������� �����������\\'+
'�������, ����������� ���������� �� ����������� �������� (��� ����������\\'+
'\I���������� ��������\i). ������� �������� {V}({k}_1,\,{k}_2) � ���������� �����������\\'+
'������� �������, ������� ������������� ��� ��� ����������.\\'+
'\P\S����������\s. ������������ ���������� ��� ���� ����� (��.~\27) ������\\'+
'\I����� ��������\i ���� ����� (����� \<�������\> ������ ����� ������� ������������\\'+
'����������). � ����������������� ���� ��������������, �������� ��������\\'+
'����� ����� ��� ������, ��� ����� \<��������\> ����� ������. � ���� ����������\\'+
'(� ���������, ��� \I��������� ������������\i �����) ����������� ����� �������\\'+
'������������ ���� ��������, ��� ���� ��������. ����������� ��������, ���\\'+
'� �������� ���������� ������������� ���������� (��.~\26), ��������\\'+
'���������� \I������������� ����������������\i.'
);
  m := Rand(4,9);
  repeat
  MakeStr(20,29,m,s1,s2);
  until (m<9) or (max(length(s1),length(s2))<25);
  cnt := 0;
  k1 := Rand(0,8);//length(s1));
  k2 := Rand(0,8);//length(s2));
  DataS('S_1 = ',S1,3,1);
  DataS('S_2 = ',S2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataN('k_1 = ',k1,50,2,1);
  DataN('k_2 = ',k2,60,2,1);
  DataN('m = ', m, 70, 2,1);
  CalcSS(-9,9);
  ShowSS(3);

  ResultN('V(k_1,k_2) = ',V(k1,k2),0,2,2);
  ResultN('���������� ����������� �������: ',cnt,0,4,3);
  SetTestCount(5);
end;


procedure Alignment31;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ����, ���� ����� {m} (<\,10) \= ������ ��������,\\'+
'���������� �� ������ �������� ��������� ����, � ������� ������ (���������\\'+
'������� ������� � \2). ��� ������������ ���������� ��������\\'+
'����� {V}(|{S}_1|,\,|{S}_2|) �� �������� �� \1 ����� ������������ \I�����\i\\'+
'\I���������� ��������\i, ���������� �� ���������������� ���������� ���������\\'+
'��������������� ������� {V} ������� (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1) (�������� ��� ����������\\'+
'������� {V} ���������� ��������� ��� ���������� ������� {D}, ���������\\'+
'� \26). �������, ������������� � ��������� ������� � ���������\\'+
'������� ������� {V}, ���������� �������� �������� ������ �����. ���������\\'+
'����� ���������� ��������, ����� ������� {V} � ������� �������� �� ����\\'+
'��������� �������: {V}_{n\-1,\,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {V}_{n,\,j}, {j}\,=\,0,\,\.,\,|{S}_2|, ��� {n}\,=\,|{S}_1|.'
);
  m := Rand(4,9);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for j := 0 to i do
  begin
    y := min(dv[nn-1,j],dv[nn,j]);
    if y < k then
      k := y;
  end;
  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(i,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('V_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dv[nn-1,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('V_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dv[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment32;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ����, ���� ����� {m} (<\,10) \= ������ ��������,\\'+
'���������� �� ������ �������� ��������� ����, � ������� ������ (���������\\'+
'������� ������� � \3). ��������� ����� ���������� ��������\\'+
'(��.~\1) ���, ����� �� �������� ����� �� ������ ��������\\'+
'�������� �����, �� � ���������� ��������� ��������� ������������\\'+
'������������. ��� ����� ������������� ������ � ������������ ������� {K}\\'+
'���� �� �������, ��� � ������� {V}, � ��������� ��� ������� ��������� � {V}\\'+
'�� ��������� ��������: {K}_{0,j}\,=\,1, {K}_{i,0}\,=\,1, �������� {K}_{i,j} ��� {i}\,>\,0 � {j}\,>\,0\\'+
'����� ����� �������� ��� ��������� {K}_{i,j\-1}, {K}_{i\-1,j}, {K}_{i\-1,j\-1}, �������\\'+
'������������� ��������� ������� {V}, ������ �������� � ������� ��� {V}({i},\,{j}).\\'+
'�������, ������������� � ��������� ������� � ��������� ������� ������� {K},\\'+
'����� ���������� ��������� ������������ ������������. �������\\'+
'��������� ������� ������ {V} �~{K}.'
);
  m := Rand(4,9);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for j := 0 to i do
  begin
    y := min(dv[nn-1,j],dv[nn,j]);
    if y < k then
      k := y;
  end;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until (k1 = 0) and (k >= -99);
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(i,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  ResultComment(s0,0,1);
  ResultComment('V_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dv[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;

procedure Alignment33;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \4). ����� ����, ���� ������� {V}, ���������� ������� ����������\\'+
'�������� (��.~\2). ��������, ��� ������� ������������ �������\\'+
'������������ ������������ ��� {S}_1 � {S}_2. ����� ��� ������������ ({A}_1,~{A}_2),\\'+
'�������� \I�������� ������\i �� ������� {V}, ������� � �� ������� �������\\'+
'�������� � ���������� ����� ������� ���������; ��� ���� ��� �������\\'+
'�������� {V}_{i,j} ��� {i}\,>\,0 � {j}\,>\,0 ����������� ����������� � ��� �� ���������\\'+
'{V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, �� ������� ����������� �������� � ������� ��� {V}({i},\,{j})\\'+
'(��.~\3); ��� ��������� {V}_{0,j} ����������� ������ ����������� �����,\\'+
'� ��� ��������� {V}_{i,0} \= �����. ����������� ����� ������������� �������\\'+
'������� � ������ {A}_1 � �������� �������� {S}_2 � ������ {A}_2, �����������\\'+
'����� \= ������� ������� � ������ {A}_2 � �������� �������� {S}_1 � ������ {A}_1,\\'+
'����������� �� ��������� ����� � ����� ������������� ������� � {A}_1 � {A}_2\\'+
'������� ��������� {S}_1 � {S}_2 �������������� (������� � ������� {S}_1 � {S}_2\\'+
'������������ � �����, ������ {A}_1 � {A}_2 ����������� �� ����� � ������). �������\\'+
'��������� ������ {A}_1 � {A}_2.'
);
  repeat
  repeat
  m := Rand(4,9);
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] = 1) and (k >=-99);
  BackV(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);

  SetTestCount(5);
end;

procedure Alignment34;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \5). ����� ����, ���� ������� {V}, ���������� ������� ����������\\'+
'�������� (��.~\3). ����� ���� �� ��������� ������������ ������������\\'+
'��� {S}_1 � {S}_2, �������� �������� ������ �� ������� {V} (��.~\1). ����\\'+
'��� ���������� �������� {V}_{i,j} �������� ����������� ����� ��� � ���� �� ���\\'+
'�������� ��������� {V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, �� ������������ ��������\\'+
'����������� ����� (���������������� ������� ������� � ������ ������),\\'+
'� ��� ��� ������������� \= ����������� ����� (���������������� �������\\'+
'������� �� ������ ������). ������� ��������� ������������ ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] > 1) and (k >=-99);
  BackV(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  SetTestCount(5);
end;

procedure Alignment35;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \6). ����� ����, ���� ������� {V}, ���������� ������� ����������\\'+
'�������� (��.~\4). ����� ��� �������� ������������ ������������\\'+
'��� {S}_1 � {S}_2, �������� �������� ������ �� ������� {V} (��.~\2). ����\\'+
'��� ���������� �������� {V}_{i,j} �������� ����������� ����� ��� � ����\\'+
'�� ��� �������� ��������� {V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, �� ������������\\'+
'��������� ������� �������� ���������� � ������ ������� ��������:\\'+
'������� ������� � ������ ������ � �������� ������� �� ������ ������\\'+
'(����������� �����), ������� ������� �� ������ ������ � �������� �������\\'+
'� ������ ������ (����������� �����), ������� ������� �������� � ��� ������\\'+
'(����������� �� ���������). ����������� ���� ��� ��������� ���� � ����\\'+
'����������� �������, ���������� ����������� ������� ������� �������\\'+
'�� ����� ��������� ����������� � �������� ��������. �������\\'+
'��� ��������� ����������� ������������ (������� ������\\'+
'������������ ������ ��������������� ������� �� ����������).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 8) and (k >=-99);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,y,3);
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);

  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment36;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \7). ����� �������� �������� � ���� �� ��������� ������������\\'+
'������������ ��� {S}_1 � {S}_2, ��������� ����� ���������� �������� ��� ����������\\'+
'�������~{V} (��.~\5) � �������� �������� ������ �� �������~{V}\\'+
'(��.~\3). ����� �������� ������������ ������������\\'+
'��������� � ������������ � ���������� \2.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  CalcV;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  BackV(s01,s02);
  ResultN('�������� ��������: ',dv[nn,mm],0,2,2);
  ResultS('A_1 = ',s01,3,3);
  ResultS('A_2 = ',s02,3,4);
  ResultComment(Rule(4,length(s01)),4,5);
  SetTestCount(5);
end;

procedure Alignment37;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \8). ����� �������� �������� � ��� �������� ������������\\'+
'������������ ��� {S}_1 � {S}_2, ��������� ����� ���������� �������� ��� ����������\\'+
'�������~{V} (��.~\6) � �������� �������� ������ �� �������~{V}\\'+
'(��.~\4). ������� ��������� ������������ ������������ ���������\\'+
'� ������������ � ���������� \2.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  CalcV;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 8);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('�������� ��������: ',dv[nn,mm],0,1,2);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//---------------------------------------------------------------------------


procedure MakeStrS(a,b,m: integer; var s1,s2: string);
// � ����������� ���������� ���������
var i,k1,k2: integer;
begin
  DType := 2;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
  k1 := Rand(length(s1) div 3, length(s1) div 2);
  k2 := Rand(length(s2) div 3, length(s2) div 2);
  case Random(8) of
  0: Delete(s1,1, k1);
  1: Delete(s1,k1,length(s1));
  2: Delete(s2,1, k2);
  3: Delete(s2,k2,length(s2));
  4: begin
       Delete(s1,1, k1);
       Delete(s2,k2,length(s2));
     end;
  5: begin
       Delete(s1,k1,length(s1));
       Delete(s2,1, k2);
     end;
  end;
end;


procedure Alignment38;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \9). ����� �������� �������� ��� ����� {S}_1 � {S}_2\\'+
'(��.~\8) ��� �������������� �������������, ��� ��� ���������\\'+
'������� �������� \I\<�����������\>\i, �.\,�. ����� ������� ������ (��� ����������\\'+
'��������� ���������� �������, ����������� � ������ � ����� ����� �� �����\\'+
'� ���������� �� ������������). ���� ����� {V''}({i},\,{j}) ���������� ��������\\'+
'����� {S}_1[1..{i}] � {S}_2[1..{j}]  ��� ������� ���������� \I���������\i ��������,\\'+
'�� ������������ ������� ��� {V''}({i},\,{j}) ����� ���������� �������� ��� {V}({i},\,{j}),\\'+
'����������� � \8; ���������� ���� �������� ������� �������,\\'+
'������� ��� ������ {i} {V''}({i},\,0)\,=\,0 � ��� ������ {j} {V''}(0,\,{j})\,=\,0.\\'+
'��� ������������ ���������� �������� {V''}({i},\,{j}) ������� ������������ \I�����\i\\'+
'\I���������� ��������\i, ���������� �� ���������������� ���������� ���������\\'+
'��������������� ������� {V''} ������� (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1) (�������� ��� ����������\\'+
'������� {V''} ���������� ��������� ��� ���������� ������� {D}, ���������\\'+
'� \33). ����� ������ ������� ������������ \I��������\i ��������,\\'+
'� �������� �������� �������� ��� ����� {S}_1 � {S}_2 ������� ������� ����������\\'+
'�������� ����� ��������� ������� {V''}, ������������� � �� ��������� �������\\'+
'��� ��������� �������. ������� ��������� �������� �������� ��� {S}_1 � {S}_2,\\'+
'� ����� �������� ��������� ������� � ���������� ������� ������� {V''}:\\'+
'{V''}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {V''}_{i,p}, {i}\,=\,0,\,\.,\,{n}, ��� {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.\\'+
'\P\S����������\s. ������������ ��������� �������� �������� � ����,\\'+
'��� ��� ����������� ��������� ������������ ���� ������ ����� �����\\'+
'��������� ������������� �� ���������� ����� ������ ��� ������� �����\\'+
'������ \= �� �������� ������. ����� �������, ��������� ��������������\\'+
'������� ������� ���������, ���� ��������� ���������� ��������, ��� �������\\'+
'���� ������ �������� ���������, \<�������\> ������ ������, ��� �������\\'+
'����� ������ \<������\> �������� ������.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for j := 0 to mm do
    if dv[nn,j] < k then
      k := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm] < k then
      k := dv[i,mm];
  until (k >= -99) and (njmax + nimax > 0) and (res>0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('�������� ��������: ', res,0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
//  ResultComment('V''_{n,j}, j = 0,\.,m:',0,2);
  ResultComment('V''_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
//  ResultComment('V''_{i,m}, i = 0,\.,n:',0,4);
  ResultComment('V''_{i,p}:',2,4);
  for i := 0 to nn do
    ResultN('',dv[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
  DType := 0;
  Str(CalcV:3,s00);
  ResultComment('����������. �������� �������� � ������ ��������� ��������: '+s00,2,5);
  SetTestCount(5);
end;

procedure Alignment39;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \10). ����� ����, ���� ������� {V''}, ���������� ������� ����������\\'+
'�������� (��.~\1). ����� ���� �� ��������� ������������ ������������\\'+
'��� {S}_1 � {S}_2 ��� ������� ���������� ��������� ��������, �������������\\'+
'��������� ������� �������� ��������� ������� �� ������� {V''}\\'+
'(��.~\6). ���� � ��������� ������� ��� ��������� ������� ������� {V''}\\'+
'������� ��������� ��������� � ������������ ���������, �� ������������ �������\\'+
'������������ ������������ ({A}_1,~{A}_2), � ������� ������ {A}_1 �������� ����������\\'+
'����� �������� ��������, � ��� ���������� ��������� � ��������� ���������\\'+
'��� {A}_1 \= �������, � ������� ���������� ����� �������� �������� ��������\\'+
'������ {A}_2. �� ��������� ������ ���������� ������������ ������������ �����\\'+
'�������� ��������� � ������������ � ���������� \5. �������\\'+
'��������� ������������ ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackV(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)));
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V'':',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  CalcV;
  BackV(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('����������. ������ �������� ������� ������������ � ������ ��������� ��������.',2,5);
  SetTestCount(5);
end;

procedure Alignment40;
var
  i,j: integer;
  b,b1: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \11). ����� ����, ���� ������� {V''}, ���������� ������� ����������\\'+
'�������� (��.~\2). ����� ��� �������� ������������ ������������\\'+
'��� {S}_1 � {S}_2 ��� ������� ���������� ��������� ��������, �������������\\'+
'��������� ������� �������� ��������� ������� �� ������� {V''} (��.~\7).\\'+
'�������� ������������ ������������ ({A}_1,~{A}_2) ���������� ��������� �������:\\'+
'��� ������� ��������� � ��������� ��������� � ������ {A}_1 ���������� ��\\'+
'� ������� �������� ���������� ���� ��������; �����, ��� ������� ���������\\'+
'� ��������� ��������� � ������ {A}_2, ���������� �� � ������� �������� ����\\'+
'��������; �����, ��� ������� �������� ������������ � �������������� ���������\\'+
'���������, ������������ ���� �������. ������� ��������� � ����������� ������\\'+
'�������� �������� ��������� � ������������ � ���������� \5. �������\\'+
'��� ��������� ����������� ������������.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V'':',dv,y,3);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;

  SetTestCount(5);
end;

procedure Alignment41;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \12). ����� �������� �������� � ���� �� ��������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ������� ���������� ��������� ��������, ���������\\'+
'����� ���������� �������� ��� ���������� �������~{V''} (��.~\3)\\'+
'� �������� �������� ������ �� �������~{V''} (��.~\2). ����� ��������\\'+
'������������ ������������ ��������� � ������������ � ���������� \2.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackV(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)))
        and (length(s01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ResultN('�������� ��������: ',res,3,1,2);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  res := CalcV;
  BackV(s01,s02);
  Str(res:3,s00);
  ResultComment('�������� ��������: '+s00,43,1);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('����������. ������ �������� ������� ������������ � ������ ��������� ��������.',2,5);

  SetTestCount(5);
end;

procedure Alignment42;
var
  i,j,b,b1,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \13). ����� �������� �������� � ��� �������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ������� ���������� ��������� ��������,\\'+
'��������� ����� ���������� �������� ��� ���������� �������~{V''}\\'+
'(��.~\4) � �������� �������� ������ �� �������~{V''}\\'+
'(��.~\3). ������� ��������� ������������ ������������ ���������\\'+
'� ������������ � ���������� \2.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ResultN('�������� ��������: ',res,0,1,2);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//-------------------------------------------------------------------------
var ws, wg: integer;

procedure CalcSSW(smin,smax: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := Rand(0,smax);
  ws := Rand(0,3);
  wg := Rand(6,15);
  for i := 1 to m-1 do
    for j := i+1 to m do
    begin
    ss[i,j] := Rand(-3,-1);
    ss[j,i] := ss[i,j];
    end;
  for i := 1 to m do
  begin
    ss[i,m+1] := ws;
    ss[m+1,i] := ws;
  end;
end;

function ShowSSW(y: integer): integer;
// ���������� ��������� ������� Y ������� �������� ������
var i,j: integer;
begin
  for i := 1 to m do
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m+i,19,4,0),y);
  DataComment('������� ����������� �����', 7, y+1);
  DataComment('������������ ������� ������:', 6, y+2);
  for i := 1 to m do
  begin
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m,19,4,0),y+i);
    for j := i to m do
      DataN('',ss[i,j],Center(19-m+j,19,3,1)-1,y+i,3);
  end;
  result := y+m+1;
end;

function CalcWOrig: integer;
var i,j,k,k1,k2,xx,kk: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    we[i,0] := -2*wg-i*ws;
    wf[i,0] := 0;//dv[i,0];//!!!!!!!!!!!!!!
    if DType = 0 then
      dv[i,0] := -wg-i*ws;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    we[0,j] := 0;//dv[0,j];//!!!!!!!!!
    wf[0,j] := -2*wg-j*ws;
    if DType = 0 then
      dv[0,j] := -wg-j*ws;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  dv[0,0] := 0;
  we[0,0] := 0;
  wf[0,0] := 0;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      xx := -maxint;
      for kk := 0 to j-1 do
        if dv[i,kk]-wg-(j-kk)*ws > xx then
          xx := dv[i,kk]-wg-(j-kk)*ws;
      we[i,j] := xx;
      xx := -maxint;
      for kk := 0 to i-1 do
        if dv[kk,j]-wg-(i-kk)*ws > xx then
          xx := dv[kk,j]-wg -(i-kk)*ws;
      wf[i,j] := xx;
{      if j = 1 then
        we[i,j] := dv[i,0]-wg-ws
        else
      we[i,j] := max(we[i,j-1],dv[i,j-1]-wg)-ws;
      if i = 1 then
        wf[i,j] := dv[0,j]-wg-ws
        else
      wf[i,j] := max(wf[i-1,j],dv[i-1,j]-wg)-ws;}
      dv[i,j] := max3(we[i,j], wf[i,j], dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;

function CalcW: integer;
var i,j,k,k1,k2,xx,kk: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    we[i,0] := -2*wg-i*ws;
    wf[i,0] := 0;//dv[i,0];//!!!!!!!!!!!!!!
    if DType = 0 then
      dv[i,0] := -wg-i*ws;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    we[0,j] := 0;//dv[0,j];//!!!!!!!!!
    wf[0,j] := -2*wg-j*ws;
    if DType = 0 then
      dv[0,j] := -wg-j*ws;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  dv[0,0] := 0;
  we[0,0] := 0;
  wf[0,0] := 0;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
{      xx := -maxint;
      for kk := 0 to j-1 do
        if dv[i,kk]-wg-(j-kk)*ws > xx then
          xx := dv[i,kk]-wg-(j-kk)*ws;
      we[i,j] := xx;
      xx := -maxint;
      for kk := 0 to i-1 do
        if dv[kk,j]-wg-(i-kk)*ws > xx then
          xx := dv[kk,j]-wg -(i-kk)*ws;
      wf[i,j] := xx;}

(* �����! � ����� (�.302) � �������� ���������� ������, �� �����������
��������� ��������� �������� E(i,1) � F(1,j). ��� ���� ����� ��� ��������
����������� ��������� (�.�. � ������������ � ����� ������ ���������,
������������ �� �.301), ���������� �������� ������� ��� E(i,0) � F(0,j):
������
E(i,0)=-W_g-i*W_s � F(0,j)=-W_g-j*W_s
���������� ��������
E(i,0)=-2W_g-i*W_s � F(0,j)=-2W_g-j*W_s
��������� ��������� �� �������� �� ��������� �������, ��� ��� ��������
E(i,0) � F(0,j) ��������� � ������ ���������� ��������
������ ��� ������������� ���������� E(i,1) � F(1,j), � ��� �������� ����
������ �� ������������.
*)

//      if j = 1 then
//        we[i,j] := dv[i,0]-wg-ws
//        else
      we[i,j] := max(we[i,j-1],dv[i,j-1]-wg)-ws;
//      if i = 1 then
//        wf[i,j] := dv[0,j]-wg-ws
//        else
      wf[i,j] := max(wf[i-1,j],dv[i-1,j]-wg)-ws;
      dv[i,j] := max3(we[i,j], wf[i,j], dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;


procedure BackW(var s01, s02: string);
var s: string;
    i,j,ii,jj: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  s01 := '';
  s02 := '';
  i := nn;
  j := mm;
  if DType = 2 then
    if njmax > 0 then
    begin
      j := jmax[1];
      for jj := mm downto j+1 do
      begin
        s01 := ' '+s01;
        s02 := s2[jj] + s02;
      end;
    end
    else
    if nimax > 0 then
    begin
      i := imax[1];
      for ii := nn downto i+1 do
      begin
        s01 := s1[ii]+s01;
        s02 := ' ' + s02;
      end;
    end;
  while i+j <> 0 do
  begin
    if i = 0 then //left
    begin
      s01 := ' ' + s01;
      s02 := s2[j] + s02;
      j := j-1;
    end
    else
    if j = 0 then //
    begin
      s01 := s1[i] + s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    if df[i,j] = fleft then
    begin
      jj := j;
      repeat
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
      until dv[i,j]=dv[i,jj]+wg+(jj-j)*ws
    end
    else
    if df[i,j] = fup then
    begin
      ii := i;
      repeat
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
      until dv[i,j]=dv[ii,j]+wg+(ii-i)*ws
    end
    else
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
  end;
end;


function toStr(i,j: integer):string;
var s: string;
begin
  Str(i,s);
  result := '('+s + ',';
  Str(j,s);
  result := result + s + ')';
end;

procedure BackW2(i,j: integer; s01, s02: string);
var mm,nn,ii,jj,i0,j0: integer;
    s001,s002: string;
begin

  if i+j = 0 then
  begin
    cnt := cnt + 1;
    if cnt <= nmax then
    begin
      t01[cnt] := s01;
      t02[cnt] := s02;
    end;
  end
  else
  begin
    if (DType = 2) and (i = length(s1)) and (j = length(s2)) then
    begin
      nn := Length(s1);
      mm := Length(s2);
      i := nn;
      for k := 1 to njmax do
      begin
        j := jmax[k];
        s01 := '';
        s02 := '';
        for jj := mm downto j+1 do
        begin
          s01 := ' '+s01;
          s02 := s2[jj] + s02;
        end;
        BackW2(i,j,s01,s02);
      end;
      j := mm;
      for k := 1 to nimax do
      begin
        i := imax[k];
        s01 := '';
        s02 := '';
        for ii := nn downto i+1 do
        begin
          s01 := s1[ii]+s01;
          s02 := ' ' + s02;
        end;
        BackW2(i,j,s01,s02);
      end;
      s01 := '';
      s02 := '';
      i := nn;
      j := mm;
      if dvsmax <> dv[nn,mm] then
        exit;
    end;
    if i*j=0 then
    begin
      if i = 0 then //left
            BackW2(i,j-1, ' ' + s01, s2[j] + s02)
      else
      if j = 0 then //up
            BackW2(i-1,j, s1[i] + s01, ' ' + s02);
    end
    else
    begin
    i0 := i;
    j0 := j;
    s001 := s01;
    s002 := s02;
    if da[i,j] and fleft = fleft then
    begin
      jj := j;
      repeat
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
      until dv[i,j]=dv[i,jj]+wg+(jj-j)*ws;
      BackW2(i,j, s01, s02);
    end;
    i := i0;
    j := j0;
    s01 := s001;
    s02 := s002;
    if da[i,j] and fup = fup then
    begin
      ii := i;
      repeat
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
      until dv[i,j]=dv[ii,j]+wg+(ii-i)*ws;
      BackW2(i,j, s01, s02);
    end;
    i := i0;
    j := j0;
    s01 := s001;
    s02 := s002;
    if da[i,j] and fdiag = fdiag then
    begin
      BackW2(i-1,j-1, s1[i] + s01, s2[j] + s02);
    end;
    end;
  end;
end;

var dv0, we0, wf0: matr;

procedure Alignment43;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'\I���������\i (����. gap) ���������� ����� ���������������� ��� �������� � ������\\'+
'������������, ������������ ������������� ��������� ��� �������/������ ������.\\'+
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������, ����������� �������, ���������\\'+
'� \14, �� ���������� ������ {m} ������� � {m} �������� (� �������\\'+
'����������� ������� � �������, ��������������� ������� �������, ���������\\'+
'��� ������, ��������� � ��������� ��������� ����������� � ������� \-{w}_s).\\'+
'����� �������� �������� ��� ����� {S}_1 � {S}_2 (��.~\13)\\'+
'��� �������������� �������������, ��� ������ ������� ������ � ��� ��������\\'+
'\<�����\>, ������ \-{w}_g (������ �� �������� \-{w}_s, ��������� ������ ��������,\\'+
'�������� � �������). ���� ����� {W}({i},\,{j}) ���������� �������� ����� {S}_1[1..{i}]\\'+
'� {S}_2[1..{j}] ��� ����� ���������, �� ������������ ������� ��� {W}({i},\,{j}) ������\\'+
'��������� ��� (� ������ �������� ������������ ��������������� ������� {E}({i},\,{j})\\'+
'� {F}({i},\,{j})): \(\X {W}(0,\,0)\,=\,0;\| \X ��� ������ {i}\,>\,0 {W}({i},\,0)\,=\,\-{w}_g\,\-\,{i}\*{w}_s, {E}({i},\,0)\,=\,\-2\*{w}_g\,\-\,{i}\*{w}_s;\|\\'+
'\X ��� ������ {j}\,>\,0 {W}(0,\,{j})\,=\,\-{w}_g\,\-\,{j}\*{w}_s, {F}(0,\,{j})\,=\,\-2\*{w}_g\,\-\,{j}\*{w}_s;\| \X ��� {i}\,>\,0 � {j}\,>\,0\\'+
'{W}({i},\,{j})\,=\,max\{{E}({i},\,{j}), {F}({i},\,{j}), {W}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\},\\'+
'��� {E}({i},\,{j})\,=\,max\{{E}({i},\,{j}\,\-\,1), {W}({i},\,{j}\,\-\,1)\,\-\,{w}_g\}\,\-\,{w}_s, {F}({i},\,{j})\,=\,max\{{F}({i}\,\-\,1,\,{j}),\\'+
'{W}({i}\,\-\,1,\,{j})\,\-\,{w}_g\}\,\-\,{w}_s.\) ��� ������������ ���������� �������� {W}({i},\,{j})\\'+
'������������ ����� ���������� ��������, ���������� �� ����������������\\'+
'���������� ��������� ��������������� ������ {E}, {F} � {W} (��������\\'+
'��� ���������� ������ ���������� ��������� ��� ���������� ������� {D},\\'+
'��������� � \38). �������� �������� ����� {S}_1 � {S}_2 ��� ����� ���������\\'+
'����� ����� {W}(|{S}_1|,\,|{S}_2|). ������� ��������� �������� �������� ��� {S}_1 � {S}_2,\\'+
'� ����� �������� ��������� ������� ������� {E} � ���������� ������� ������� {F}:\\'+
'{E}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {F}_{i,p}, {i}\,=\,0,\,\.,\,{n}, ��� {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.\\'+
'\P\S����������\s. ���� ��������� ����� ��������� ��������� ������������, �������\\'+
'����� ����������� � �������������� (� ���������, ��������������) ��������.\\'+
'������� �������� {w}_g ����� ��������� � ����, ��� ����� ���������\\'+
'� ������������ ����������, � ���������� � ���������� ������������ ������\\'+
'���������� �� ��������� \<�������\> ��������. ������� �������� {w}_g �����\\'+
'��������� � ����� ����������������� �������������. ��� ���������� ������� {w}_s\\'+
'����� ���������� ������~0, � ���� ������ ��� ������������ ����� �����������\\'+
'������ ���������� ���������, �� �� �� ������. ������������� � �������\\'+
'������� ������������� ��������� ���������� \I������� � �������� �����\i,\\'+
'��� ��� ��� ������ �������� ����� {q} ������������ �������� �������� {w}_g\,+\,{q}\*{w}_s.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for j := 0 to mm do
    if we[nn,j] < k then
      k := we[nn,j];
  for i := 0 to nn do
    if wf[i,mm] < k then
      k := wf[i,mm];
  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  ShowSSW(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';

  ResultN('�������� ��������: ', dv[nn,mm],0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
  ResultComment('E_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',we[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
  ResultComment('F_{i,m}:',2,4);
  for i := 0 to nn do
    ResultN('',wf[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
//  DType := 0;
//  Str(CalcV:3,s00);
//  ResultComment('����������. �������� �������� � ������ ��������� ��������: '+s00,2,5);
(*  dv0 := dv;
  we0 := we;
  wf0 := wf;
  CalcWOrig;
  k := 0;
  for i := 0 to nn do
    for j := 0 to nn do
      if (dv0[i,j]<>dv[i,j])or({(i>0)and (j>0) and} ((we0[i,j] <> we[i,j]) or (wf0[i,j] <> wf[i,j]))) then
      begin
        k := 1;
        break;
      end;
  if k=1{dv0[nn,mm]<>dv[nn,mm]} then
  ResultComment('!!!!',90,5);*)
  SetTestCount(5);
end;

procedure Alignment44;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \1). ����� ����, ���� ������� {W}, ���������� ������� ����������\\'+
'�������� (��.~\1), � ��������������� ������� {E} � {F} (��� ������ {E} � {F}\\'+
'�������� ������� ����� � �������� �� ����������). ����� ���� �� ���������\\'+
'������������ ������������ ��� {S}_1 � {S}_2 ��� ����� ���������, ���������\\'+
'��������� �������� ��������� ������� �� ������� {W} (��. �~\11).\\'+
'�������� ������ �� ������� {W} ���������� � �� ������� ������� ��������\\'+
'� ������������� ����� ������� ���������. ��� ��������� {W}_{0,j} �����������\\'+
'������ ����������� �����, ��� ��������� {W}_{i,0} \= �����. ��� {i}\,>\,0 � {j}\,>\,0\\'+
'����������� ����������� ����� � ������ {W}_{i,j}\,=\,{E}_{i,j}, ����� � ������ {W}_{i,j}\,=\,{F}_{i,j}\\'+
'� �� ��������� (����� � �����) � ������ {W}_{i,j}\,=\,{W}_{i\-1,j\-1}\,+\,{s}({S}_1[{i}],\,{S}_2[{j}]),\\'+
'������ ����������� �� ��������� ����������� �� ���� �������, �����������\\'+
'����� \= �� �������� {W}_{i,k} ({k}\,<\,{j}), ��� �������� ����������� �����������\\'+
'{W}_{i,k}\,=\,{W}_{i,j}\,+\,{w}_g\,+\,({j}\,\-\,{k})\*{w}_s, � ����������� ����� \= �� �������� {W}_{k,j} ({k}\,<\,{i}),\\'+
'��� �������� ����������� ����������� {W}_{k,j}\,=\,{W}_{i,j}\,+\,{w}_g\,+\,({i}\,\-\,{k})\*{w}_s. ������\\'+
'����������� ����� �� ���� ������� ������������� ������� ������� � ������ {A}_1\\'+
'� �������� �������� {S}_2 � ������ {A}_2, ������ ����������� ������ �� ����\\'+
'������� \= ������� ������� � ������ {A}_2 � �������� �������� {S}_1 � ������ {A}_1.\\'+
'����������� �� ��������� ������������� ������� � {A}_1 � {A}_2 �������\\'+
'��������� {S}_1 � {S}_2 �������������� (������� � ������� {S}_1 � {S}_2 ������������\\'+
'� �����, ������ {A}_1 � {A}_2 ����������� �� ����� � ������). ��� ������� ����������\\'+
'��������� ������������ ������������ ����� �������� ��������� � ������������\\'+
'� ���������� \10. ������� ��������� ������������ ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until k >=-99;
  BackW(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('�������� ������� W:',dv,y,3);
  ShowMatr('�������� ������� E:',we,y+nn+3,3+4);
  ShowMatr('�������� ������� F:',wf,y+2*(nn+3)-1,3+4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);

  DType := 0;
  CalcV;
  BackV(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('����������. ������ �������� ������� ������������ ��� ����� ���������.',2,5);
  SetTestCount(5);
end;

procedure Alignment45;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'�~\2). ����� ����, ���� ������� {W}, ���������� ������� ����������\\'+
'�������� (��.~\2), � ��������������� ������� {E} � {F} (��� ������ {E} � {F}\\'+
'�������� ������� ����� � �������� �� ����������). ����� ��� ��������\\'+
'������������ ������������ ��� {S}_1 � {S}_2 ��� ����� ���������, �������������\\'+
'��������� ������� �������� ��������� ������� �� �������~{W} (��.~\1).\\'+
'������� ��������� ������������ ������������ ��������� � ������������\\'+
'� ���������� \10. ������� ��� ��������� ����������� ������������.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k <-99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  until (cnt > 2) and (cnt <= 8) and (k >=-99);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('�������� ������� W:',dv,y,3);
  ShowMatr('�������� ������� E:',we,y+nn+3,3+4);
  ShowMatr('�������� ������� F:',wf,y+2*(nn+3)-1,3+4);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment46;
var
  i,j: integer;
  ss01,ss02,ss03: string;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \3). ����� �������� �������� � ���� �� ��������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ����� ���������, ��������� ����� ����������\\'+
'�������� ��� ���������� ������ {W}, {E} � {F} (��.~\3) � ��������\\'+
'�������� ������ �� �������~{W} (��.~\2). ����� �������� ������������\\'+
'������������ ��������� � ������������ � ���������� \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((m<9) or (max(mm,nn)<25));
  CalcSSW(-9,9);
  CalcV;
  BackV(ss01,ss02);
  Str(dv[nn,mm]:3,ss03);
  CalcW;
  BackW(s01,s02);
  until (length(s01)<=32) and (length(ss01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('�������� ��������: ',dv[nn,mm],3,1,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  ResultComment('�������� ��������: '+ss03,43,1);
  ResultComment('\<'+ss01+'\>',43,2);
  ResultComment('\<'+ss02+'\>',43,3);
  ResultComment(Rule(0,length(ss01)),43,4);
  ResultComment('����������. ������ �������� ������� ������������ ��� ����� ���������.',2,5);
  SetTestCount(5);
end;

procedure Alignment47;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \4). ����� �������� �������� � ��� �������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ����� ���������, ��������� ����� ����������\\'+
'�������� ��� ���������� ������ {W}, {E} � {F} (��.~\4) � ��������\\'+
'�������� ������ �� �������~{W} (��.~\3). ������� ���������\\'+
'������������ ������������ ��������� � ������������ � ���������� \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until s1 <> s2;
  CalcSSW(-9,9);
  CalcW;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  until (cnt > 2) and (cnt <= 8);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('�������� ��������: ',dv[nn,mm],0,1,2);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//-----------------------------------------------------------------------

procedure Alignment48;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \5). ����� �������� �������� ��� ����� {S}_1 � {S}_2 ��� ����� ���������\\'+
'(��.~\5) � �������������� �������������, ��� ��� ��������� �������\\'+
'(� ��������� � ���� ��������) �������� \<�����������\>, �.\,�. ����� ������� ���\\'+
'(��.~\10). ���� ����� {W''}({i},\,{j}) ���������� �������� ����� {S}_1[1..{i}]\\'+
'� {S}_2[1..{j}] � ������ ����� ��������� � ���������� ��������� ��������,\\'+
'�� ������������ ������� ��� {W''}({i},\,{j}) ����� ���������� �������� ��� {W}({i},\,{j}),\\'+
'����������� � \5; ���������� ���� �������� ������� �������, �������\\'+
'��� ������ {i} {W''}({i},\,0)\,=\,0 � ��� ������ {j} {W''}(0,\,{j})\,=\,0 (������� �������\\'+
'��� ������� {E} � {F} �� ���������, � ������������ �������� ��� ����������\\'+
'�������� {E} � {F} ���������� ������������ �������� {W''} ������ {W}). ��� ������������\\'+
'���������� �������� {W''}({i},\,{j}) ������� ������������ ����� ���������� ��������,\\'+
'���������� �� ���������������� ���������� ��������� ���������������\\'+
'������ {W''}, {E} � {F} (�������� ��� ���������� ������ ���������� ���������\\'+
'��� ���������� ������� {D}, ��������� � \43). ����� ������ �������\\'+
'������������ �������� ��������, � �������� �������� ��������\\'+
'��� ����� {S}_1 � {S}_2 ������� ������� ���������� �������� ����� ���������\\'+
'������� {W''}, ������������� � �� ��������� ������� ��� ���������\\'+
'�������. ������� ��������� �������� �������� ��� {S}_1 � {S}_2, � �����\\'+
'�������� ��������� ������� � ���������� ������� ������� {W''}:\\'+
'{W''}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {W''}_{i,p}, {i}\,=\,0,\,\.,\,{n}, ��� {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSSW(-9,9);
  res := CalcW;
  k := 0;
  for j := 0 to mm do
    if dv[nn,j] < k then
      k := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm] < k then
      k := dv[i,mm];
  until (k >= -99) and (njmax + nimax > 0) and (res>0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  ShowSSW(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('�������� ��������: ', res,0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
//  ResultComment('V''_{n,j}, j = 0,\.,m:',0,2);
  ResultComment('W''_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
//  ResultComment('V''_{i,m}, i = 0,\.,n:',0,4);
  ResultComment('W''_{i,p}:',2,4);
  for i := 0 to nn do
    ResultN('',dv[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
  DType := 0;
  Str(CalcW:3,s00);
  ResultComment('����������. �������� �������� � ������ ��������� � ��������� ��������: '+s00,2,5);
  SetTestCount(5);
end;

procedure Alignment49;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \6). ����� ����, ���� ������� {W''}, ���������� ������� ����������\\'+
'�������� (��.~\1), � ��������������� ������� {E} � {F} (��� ������ {E} � {F}\\'+
'�������� ������� ����� � �������� �� ����������). ����� ���� �� ���������\\'+
'������������ ������������ ��� {S}_1 � {S}_2 ��� ���������� ��������� ��������\\'+
'� ����� ���������, ������������� ��������������� ������� �������� ���������\\'+
'������� �� �������~{W''} (��.~\5 �~\10). ����� ��������\\'+
'������������ ������������ ��������� � ������������ � ���������� \10.\\'+
'������� ��������� ������������ ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1) + 2*nn*mm + (m+1)*(m+2) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackW(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)));
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('�������� ������� W'':',dv,y,3);
  ShowMatr('�������� ������� E:',we,y+nn+3,3+4);
  ShowMatr('�������� ������� F:',wf,y+2*(nn+3)-1,3+4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  CalcW;
  BackW(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('����������. ������ �������� ������� � ������ ��������� � ��������� ��������.',2,5);
  SetTestCount(5);
end;

procedure Alignment50;
var
  i,j: integer;
  b,b1: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \7). ����� ����, ���� ������� {W''}, ���������� ������� ����������\\'+
'�������� (��.~\2), � ��������������� ������� {E} � {F} (��� ������ {E} � {F}\\'+
'�������� ������� ����� � �������� �� ����������). ����� ��� ��������\\'+
'������������ ������������ ��� {S}_1 � {S}_2 ��� ���������� ��������� ��������\\'+
'� ����� ���������, ������������� ��������������� ������� �������� ���������\\'+
'������� �� �������~{W''} (��.~\6 �~\11).\\'+
'������� ��������� ������������ ������������ ��������� � ������������\\'+
'� ���������� \10. ������� ��� ��������� ����������� ������������.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);

  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('�������� ������� W'':',dv,y,3);
  ShowMatr('�������� ������� E:',we,y+nn+3,3+4);
  ShowMatr('�������� ������� F:',wf,y+2*(nn+3)-1,3+4);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;

  SetTestCount(5);
end;

procedure Alignment51;
var
  i,j,res: integer;
  ss01,ss02,ss03: string;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \8). ����� �������� �������� � ���� �� ��������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ���������� ��������� �������� � ����� ���������,\\'+
'��������� ����� ���������� �������� ��� ���������� ������ {W''}, {E} � {F}\\'+
'(��.~\3) � �������� �������� ������ �� �������~{W''}\\'+
'(��.~\7 �~\12). ����� �������� ������������ ������������\\'+
'��������� � ������������ � ���������� \12.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and (m<9) or (max(mm,nn)<25);
  CalcSSW(-9,9);
  DType := 0;
  res := CalcW;
  BackW(ss01,ss02);
  Str(res:3,ss03);
  DType := 2;
  res := CalcW;
  BackW(s01,s02);
  until (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)))
        and (length(s01)<=32) and (length(ss01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('�������� ��������: ',res,3,1,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  ResultComment('�������� ��������: '+ss03,43,1);
  ResultComment('\<'+ss01+'\>',43,2);
  ResultComment('\<'+ss02+'\>',43,3);
  ResultComment(Rule(0,length(ss01)),43,4);
  ResultComment('����������. ������ �������� ������� � ������ ��������� � ��������� ��������.',2,5);
  SetTestCount(5);
end;

procedure Alignment52;
var
  i,j,b,b1,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {m} (<\,10) \= ������ ��������, ���������� �� ������\\'+
'�������� ��������� ����, ����� {w}_s (\g\,0) � {w}_g (>\,0) \= ��� ������� � ��������\\'+
'��������������, � ����� ������� ������ (��������� ������� �������\\'+
'� \9). ����� �������� �������� � ��� �������� ������������\\'+
'������������ ��� {S}_1 � {S}_2 ��� ���������� ��������� �������� � ����� ���������,\\'+
'��������� ����� ���������� �������� ��� ���������� ������ {W''}, {E} � {F}\\'+
'(��.~\4) � �������� �������� ������ �� �������~{W''}\\'+
'(��.~\8 �~\13). ������� ��������� ������������ ������������\\'+
'��������� � ������������ � ���������� \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2);
  CalcSSW(-9,9);
  res := CalcW;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (b = 0);

  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('�������� ��������: ',res,0,1,2);
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��������� ������������ ������������ ����� ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('������� '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------------

procedure MakeStrP(a,b,m: integer; var s1,s2: string);
// ��� ������ ������������ ���������
var i: integer;
    s0: string;
begin
  DType := 3;
  WD := 0;
  WR := 0;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
  i := length(s2);
  repeat
    s0 := Copy(s2, Rand(2,i), Rand(1,i-1));
  until (length(s0)>=3) and (length(s0)<=i div 2);
  s2 := s1;
  s1 := s0;
end;

var p1: array[1..nmax] of string;
    jjj: integer;

(*
�����! � ����� - �������� ������������ ������� 11.6.2 (�.286).
��������� ������ k ��� ������������ �� ���, � ����� ������
������� ������ ������������ ���� �� �������� ������,
� ����� ��������� ������������ ������ ��� �������� ����� �
������������, ��������������� T'.
*)

function endj(starti, startj: integer; var s01,s02: string): integer;
var i,j: integer;
begin
  i := starti;
  j := startj;
  s01 := '';
  s02 := '';
  while i > 0 do
  begin
    if da[i,j] and fup = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    if da[i,j] and fdiag = fdiag then
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
    else
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
    end;
  end;
  result := j+1;
end;

procedure Alignment53;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. �����\\'+
'���� ����� {m} (<\,10) \= ������ ��������, ���������� �� ������ ��������\\'+
'��������� ����, � ������� ������ (��������� ������� ������� � \24).\\'+
'��������� {T''} ������ {T} ���������� \I������������ ����������\i {P} � {T}\\'+
'(� ��������� {d}), ���� �������� �������� {P} � {T''} (��.~\23) ������\\'+
'��� ����� {d}. ��������� ����� ���������� �������� (��.~\22),\\'+
'����� ��� ��������� ������ {T}, ������� ����� ����� |{P}| � ��������\\'+
'������������� ����������� {P} � {T} � ��������� {d}. ������� ���������\\'+
'������������ ���������; ����� ������� ���������� ��������� �������� ��������\\'+
'��� �������� � {P} (��������� ���������� �� ����������� ������� �� ����������\\'+
'�������). ������� ����� ���������� ��������� ������������ ���������.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
  MakeStrP(20,29,m,p0,t0);
  DType := 0;
  mm := length(p0);
  nn := length(p0);
  CalcSS(-9,9);
  s1 := p0;
  cnt := 0;
  for i := 1 to length(t0)-mm+1 do
  begin
    s2 := Copy(t0,i,mm);
    res := CalcV;
    if res >= d then
    begin
      cnt := cnt + 1;
      p1[cnt] := s2;
      ind[cnt] := res;
    end;
  end;
  until (cnt >0)and (cnt <9);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,length(t0))),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  ShowSS(3);
  case cnt of
  0,1: y := 3;
  2,3: y := 2;
  else y := 1;
  end;
  for i := 1 to cnt do
  begin
    Str(i,s00);
    ResultS('T''_'+s00+' = ',p1[i],3,y+i-1);
    ResultN('�������� �������� T''_'+s00+' � P: ',ind[i],40,y+i-1,2);
  end;
  ResultN('���������� ��������� ������������ ���������: ',cnt,0,y+cnt,2);
  SetTestCount(5);
end;

procedure Alignment54;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ ��������\\'+
'��������� ����, � ������� ������ (��������� ������� ������� � \25).\\'+
'����������� �������� ���������� �������� ������� ���� ������������\\'+
'��������� {P} � {T} ������� � ��������� (����������� ������������� ���������\\'+
'��������� � \1): \(\X � ������� ������ ���������� �������� ���������\\'+
'��������������� ������� {V} (��.~\23) ��� ����� {P} � {T}, ������� �������\\'+
'�������: ��� ������ {j} {V}_{0,j}\,=\,0 (������� ��� {V}_{i,0} �������� ��������);\| \X ������� {k}\\'+
'������ {T} ������������� �������� ������� ���������� ������������� ��������� {P}\\'+
'� {T} � ��������� {d}, ���� {V}_{n,k}\,\g\,{d} ({n} ���������� ����� ������ |{P}|).\) ���������\\'+
'��������� ��������, ���������� ���������� ������� ������ {T}, ���������������\\'+
'�������� �������� ���� ������������ ��������� {P} � {T}, � ������� ��� ����������,\\'+
'� ����� ��������� ������� �������~{V}: {V}_{n,j}, {j}\,=\,0,\,\.,\,|{T}|.'
);
  m := Rand(4,9);
//  repeat
  d := Rand(1,20);
  MakeStrP(14,18,m,p0,t0);
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  nn := length(p0);
  mm := length(t0);
  CalcV;
  cnt := 0;
  for j := 1 to length(s2) do
    if dv[nn,j]>=d then
      cnt := cnt + 1;
//  until (cnt >0)and (cnt <9);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  ShowSS(3);

  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('���������� �������� ������� T, ��������������� ������������ ����������: ', cnt,0,1,2);
  ResultComment('V_{n,j}, j = 0,\.,|T|:',0,2);
  ResultComment(s0,Center(1, mm+1, 3, 1)-1,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 4, 3);
  SetTestCount(5);
end;


procedure Alignment55;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ��������� ����,\\'+
'������� ������ (��������� ������� ������� � \26) � ������� {V},\\'+
'���������� ������� ���������� �������� (��.~\1). ��� ����������\\'+
'��������� ������� {T}, ���������� ������������ ���������� {P} � ��������� {d},\\'+
'���������� ��������� �������� ������ �� ������� {V} �� ��������, �����������\\'+
'� \22 (���������� ��� ���� ��������������� ������ {A}_1 � {A}_2 �����\\'+
'��������� ��������������� ����������� ������������). �������� ������\\'+
'���������� � ������-���� �������� ��������� �������, �������� �������� ������\\'+
'��� �����~{d}: {V}_{n,k}\,\g\,{d}, ��� {n}\,=\,|{P}|. ������������� �������� ������ �� ��������\\'+
'������������� � ������� ������� {V}. ������ {j} ������� ������ {T}, ������������\\'+
'��������� � ������������ {A}_2 ��� �������� �������, ���������� ���������\\'+
'������� ������������� ���������; ����� �������, ������� ������������\\'+
'��������� ����� ��������� {T}[{j}..{k}]. ��������� ��������� ��������, �����\\'+
'������������ ��������� {P} � {T} � ����������� �������� �������� {k}\\'+
'(��������������, ��� ���� �� ���� ������������ ��������� ����������). ����\\'+
'�� ��������� ���� ��������� ���� ������� ��������� ��������� ������ ����������\\'+
'��������, �� ���������������� �������� ����������� �����, � ��� ���\\'+
'������������� \= ����������� �� ���������. ������� ��������� ������������\\'+
'��������� {T''}, ��� ��������� ������� � ������ {T}, � ����� �������� ��������\\'+
'��� ����� {P} � {T''} � ����������� ������������ ({A}_1,~{A}_2) ��� ���� �����.\\'+
'\P\S����������\s. ����������� ������� ������ �������� ���������� ��������\\'+
'������� {V} � ��������� ��������� ���� ������������ ���������� ������\\'+
'�� \I����������\i ������������ ��������� {P} � {T}, ��������������� � ������� {k}.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
  repeat
  MakeStrP(9,12,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := -1;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      k2 := j;
      break;
    end;
  until (k>=-99) and (k2 <> -1);
  k1 := endj(nn,k2,s01,s02);
  s00 := Copy(t0,k1,k2-k1+1);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,y,3);
  ResultS('T'' = ', s00,3,1);
  ResultN('��������� ������� T'' � T: ', k1,3,2,2);
  ResultN('�������� �������� P � T'': ', dv[nn,k2],3,3,2);
  ResultComment('����������� ������������ P � T'':',40,2);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment56;
var
  i,j,res,cnt,k1,k2: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ��������� ����,\\'+
'������� ������ (��������� ������� ������� � \27) � ������� {V},\\'+
'���������� ������� ���������� �������� (��.~\2). ��� ������\\'+
'������� {k} ������ {T}, � ������� ������������ ������������ ��������� {P} � {T},\\'+
'����� ���� �� ����� ���������, �������� �������� ������ �� ������� {V}\\'+
'(��.~\1). ���� � ������� {k} ������������ ��������� ���������\\'+
'������������ ���������, �� ����� �������� ��������� � ������������\\'+
'� ���������� \1. ��� ������� ���������� ��������� {T''}\,=\,{T}[{j}..{k}]\\'+
'������� ������� {j} � {k} ��� ���������� � ��������� ������� � ������ {T},\\'+
'�������� �������� ��� ����� {P} � {T''} � ����������� ������������ ({A}_1,~{A}_2)\\'+
'��� ���� �����. ��������� ���������� �� ����������� ������� {k} �� ���������\\'+
'�������. ������� ����� ���������� ��������� ������������ ���������.'
);
  m := Rand(4,9);
  k1 := Random(5);
  repeat
  d := Rand(1,20);
  repeat
  MakeStrP(9,12,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := 0;
  for j := 0 to mm do
    if dv[nn,j]>=d then
      inc(k2);
  until (k>=-99) and  ((k1 = 0)and(k2 = 0) or (k1 in [1..4])
    and (k2 in [1..4]) or (k1 in [3..4]) and (k2 in [4..8]));
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,y,3);
  cnt := 0;
  for j := 0 to mm do
  if dv[nn,j] >= d then
  begin
  cnt := cnt + 1;
  k2 := j;
  k1 := endj(nn,k2,s01,s02);
//  s00 := Copy(t0,k1,k2-k1+1);
  Str(cnt,s00);
  y := 2*cnt-1;
  ResultComment('T''_'+s00+': ',3,y);
  ResultN('j = ', k1,10,y,2);
  ResultN('k = ', k2,20,y,2);
  ResultN('�������� ��������: ', dv[nn,k2],30,y,2);
  ResultS('A_1 = ', s01,55,y);
  ResultS('A_2 = ', s02,55,y+1);
//  ResultComment(Rule(5,length(s01)),60,3*cnt);
  end;
  if cnt = 0 then
    y := 3
  else
    y := 2*cnt+1;
  ResultN('���������� ��������� ������������ ���������: ', cnt, 0, y, 2);
  SetTestCount(5);
end;

procedure Alignment57;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ��������� ����,\\'+
'� ������� ������ (��������� ������� ������� � \28). �����\\'+
'������������ ��������� {P} � {T} � ����������� �������� �������� {k}, ���������\\'+
'�������� ���������� �������� ��� ���������� �������~{V} (��.~\3)\\'+
'� �������� �������� ������ �� �������~{V} (��.~\2); ��������������,\\'+
'��� ���� �� ���� ������������ ��������� ����������. ���� � ������� {k}\\'+
'������������� ��������� ��������� ������������ ���������, �� ����� ��������\\'+
'��������� � ������������ � ���������� \2. ������� ���������\\'+
'������������ ��������� {T''}, ��� ��������� ������� � ������ {T}, � ����� ��������\\'+
'�������� ��� ����� {P} � {T''} � ����������� ������������ ({A}_1,~{A}_2) ��� ���� �����.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
//  repeat
  MakeStrP(20,29,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := -1;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      k2 := j;
      break;
    end;
  until (k>=-99) and (k2 <> -1);
  k1 := endj(nn,k2,s01,s02);
  s00 := Copy(t0,k1,k2-k1+1);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
//  ShowMatr('�������� ������� V:',dv,y,3);
  ResultS('T'' = ', s00,3,1);
  ResultN('��������� ������� T'' � T: ', k1,3,2,2);
  ResultN('�������� �������� P � T'': ', dv[nn,k2],3,3,2);
  ResultComment('����������� ������������ P � T'':',40,2);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment58;
var
  i,j,res,cnt,k1,k2,b: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {P}, {T} (|{P}|\,<\,|{T}|) � ����� {d} (>\,0) \= �������� �����������. ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ��������� ����,\\'+
'� ������� ������ (��������� ������� ������� � \29). ��� ������\\'+
'������� {k} ������ {T}, � ������� ������������� ������������ ��������� {P} � {T},\\'+
'����� ���� �� ����� ���������, ��������� �������� ���������� ��������\\'+
'��� ���������� �������~{V} (��.~\4) � �������� �������� ������\\'+
'�� �������~{V} (��.~\3). ���� � ������� {k} ������������� ���������\\'+
'��������� ������������ ���������, �� ����� �������� ��������� � ������������\\'+
'� ���������� \3. ��� ������� ���������� ��������� {T''}\,=\,{T}[{j}..{k}]\\'+
'������� ������� {j} � {k} ��� ���������� � ��������� ������� � ������ {T},\\'+
'�������� �������� ��� ����� {P} � {T''} � ����������� ������������ ({A}_1,~{A}_2)\\'+
'��� ���� �����. ��������� ���������� �� ����������� ������� {k} �� ���������\\'+
'�������. ������� ����� ���������� ��������� ������������ ���������.'
);
  m := Rand(4,9);
  k1 := Random(5);
  repeat
  d := Rand(1,20);
//  repeat
  MakeStrP(20,29,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := 0;
  b := 0;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      inc(k2);
      endj(nn,k2,s01,s02);
      if length(s01)>24 then
      begin
        b := 1;
        break;
      end;
    end;
  until (b=0) and (k>=-99) and  ((k1 = 0)and(k2 = 0) or (k1 in [1..4])
    and (k2 in [1..4]) or (k1 in [3..4]) and (k2 in [4..8]));
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
//  ShowMatr('�������� ������� V:',dv,y,3);
  cnt := 0;
  for j := 0 to mm do
  if dv[nn,j] >= d then
  begin
  cnt := cnt + 1;
  k2 := j;
  k1 := endj(nn,k2,s01,s02);
//  s00 := Copy(t0,k1,k2-k1+1);
  Str(cnt,s00);
  y := 2*cnt-1;
  ResultComment('T''_'+s00+': ',3,y);
  ResultN('j = ', k1,9,y,2);
  ResultN('k = ', k2,17,y,2);
  ResultN('�������� ��������: ', dv[nn,k2],25,y,2);
  ResultS('A_1 = ', s01,48,y);
  ResultS('A_2 = ', s02,48,y+1);
//  ResultComment(Rule(5,length(s01)),60,3*cnt);
  end;
  if cnt = 0 then
    y := 3
  else
    y := 2*cnt+1;
  ResultN('���������� ��������� ������������ ���������: ', cnt, 0, y, 2);
  SetTestCount(5);
end;


procedure Alignment59;
var
  i,j: integer;
begin
  CreateTask(Subgroup5);
TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ���� ����� {m} (<\,10) \= ������ ��������, ����������\\'+
'�� ������ �������� ��������� ����, � ������� ������ (��������� �������\\'+
'������� � \30). ������ \I���������� ����������� ������������\i {S}_1 � {S}_2\\'+
'��� ���� ������� ({i},\,{j}) ������� � ���������� (��������, ������)\\'+
'��������� {s}_1 � {s}_2 ����� {S}_1[1..{i}] � {S}_2[1..{j}] �������������� � ������������\\'+
'��������� �������� {v}({i},\,{j}) (�������� ������ �� ���� ����� ��������� ���������\\'+
'����� {S}_1[1..{i}] � {S}_2[1..{j}]). ������������� ��������������, ��� ��� ������\\'+
'������ ����� �������� 0. ��� ���������� {v}({i},\,{j}) ����� ������������ ���������\\'+
'�����������:\( \X ��� ������ {i} {v}({i},\,0)\,=\,0;\| \X ��� ������ {j} {v}(0,\,{j})\,=\,0;\|\\'+
'\X ���� {i}\,>\,0 � {j}\,>\,0, �� {v}({i},\,{j})\,=\,max\{0,~{v}({i}\,\-\,1,\,{j})\,+\,{s}({S}_1[{i}],\,\_), {v}({i},\,{j}\,\-\,1)\,+\,{s}(\_,\,{S}_2[{j}]),\\'+
'{v}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\}\) (������ \<\_\> � ������� ���������� ������;\\'+
'������� �������� �������� �� ��, ��� �������� ������ ����� ���������������).\\'+
'����������� ���������� �������� {v}({i},\,{j}) ����������� ������� ����������\\'+
'��������, ���������� �� ���������������� ���������� ��������� ���������������\\'+
'������� {v} (�������� ��� ���������� ������� {v} ���������� ���������\\'+
'��� ���������� ������� {D}, ��������� � \54). ��������� �����\\'+
'���������� ��������, ����� ������� {v} � ������� �������� �� ���� ���������\\'+
'�������: {v}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {v}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, ��� {n}\,=\,|{S}_1|.'
);
  m := Rand(4,9);
//  repeat
  MakeStr(14,18,m,s1,s2);
  DType := 4;
  mm := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
//  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('v_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to mm do
    ResultN('',dv[nn-1,j],Center(j+1, mm+1, 3, 1), 3, 3);
  ResultComment('v_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


(*
�����! � ����� - �������� �������� ��������, �������������� �����������
��������� ������������ (�. 291): ��������� ������� ���� �������� i' � j'
������������ �� ���, � ����� ������ ����� ���������� ������� ��������
(��� �������� ������ ����� �� ��������������� ������-���� �������, ��� ���
����� ����������� � ������� ������ ��� �������_, � �������� ���������
������������ ��������, ������� ���� ��������� ����� � ������������ A_1 � A_2
��������������.
*)

procedure endij(starti, startj: integer; var i1,j1: integer;
  var s01,s02: string);
var i,j: integer;
begin
  i := starti;
  j := startj;
  s01 := '';
  s02 := '';
  i1 := 0;
  j1 := 0;

  while dv[i,j] > 0 do
  begin
    if da[i,j] and fup = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i1 := i;
      i := i-1;
    end
    else
    if da[i,j] and fdiag = fdiag then
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i1 := i;
      j1 := j;
      i := i-1;
      j := j-1;
    end
    else
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j1 := j;
      j := j-1;
    end;
  end;

end;



procedure Alignment60;
var
  i,j,res,cnt,i1,i2,j1,j2: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 � ����� {i} (\l\,|{S}_1|) � {j} (\l\,|{S}_2|). ����� ����\\'+
'����� {m} (<\,10) \= ������ ��������, ���������� �� ������ �������� ���������\\'+
'����, ������� ������ (��������� ������� ������� � \31)\\'+
'� ������� {v}, ���������� ������� ���������� �������� (��.~\1).\\'+
'������ ������ ���������� ����������� ������������ ��� ������ ����\\'+
'������� ({i},\,{j}); ��� ����� ��������� �������� ������ �� ������� {v}\\'+
'(�� ��������, ����������� ����������� � \27), ������� � �������� {v}_{i,j}\\'+
'� ���������� ���������, ������ 0 (���������� ��� ���� ���������������\\'+
'������ {A}_1 � {A}_2 ����� ��������� ��������������� ����������� ����������\\'+
'������������). ������ {i''} ������� ������ {S}_1, ������������ ���������\\'+
'� ������������ {A}_1 ��� �������� �������, � ������ {j''} ������� ������ {S}_2,\\'+
'������������ ��������� � ������������ {A}_2, ����� ���������� ��������� �������\\'+
'��������� {s}_1 � {s}_2, �������������� ����������� ���������� ������������:\\'+
'{s}_1\,=\,{S}_1[{i''}..{i}], {s}_2\,=\,{S}_2[{j''}..{j}] (��� ���� �������� �������� ����� �����\\'+
'{v}_{i,j}). ���� ��� �������� ������� � ������������ {A}_1 �/��� {A}_2 �� �����\\'+
'��������� �� ������ �������, �� ��������������� ������� ���������� ������\\'+
'������ ������, � �������� {i''} �/��� {j''} \= ������ 0. ���� �� ��������� ����\\'+
'��������� ���� ������� ��������� ��������� ������ ���������� ��������,\\'+
'�� ���������������� �������� ����������� �����, � ��� ��� ������������� \=\\'+
'����������� �� ���������. ������� ��������� �������� {s}_1 � {s}_2, �� ���������\\'+
'������� {i''} � {j''} � ������� {S}_1 � {S}_2 ��������������, � ����� ��������\\'+
'�������� ��� ����� {s}_1 � {s}_2 � ����������� ������������ ({A}_1,~{A}_2)\\'+
'��� ���� �����. ��������� �� ����� {s}_1, {s}_2, {A}_1, {A}_2 (� ��������,\\'+
'� ��� ��� ������) ����� ���� �������.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 5 <=200;
  CalcSS(-9,9);
  CalcV;
    i2 := Rand(1,nn);
    j2 := Rand(1,mm);
    endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (s01 = '') or (y=1) and (length(s01)=1) or (y>1)and(length(s01)>=y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('i = ',i2, 47, 2,1);
  DataN('j = ',j2, 57, 2,1);
  DataN('m = ', m, 67, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultS('s_1 = ', ss01,3,1);
  ResultS('s_2 = ', ss02,25,1);
  ResultN('i'' = ', i1,3,2,2);
  ResultN('j'' = ', j1,25,2,2);
  ResultN('�������� �������� s_1 � s_2: ', dv[i2,j2],40,2,2);
  ResultComment('����������� ������������ s_1 � s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;

procedure Alignment61;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ���� ����� {m} (<\,10) \= ������ ��������, ����������\\'+
'�� ������ �������� ��������� ����, ������� ������ (��������� ������� �������\\'+
'� \32) � ������� {v}, ���������� ������� ���������� ��������\\'+
'(��.~\2). ������ \I���������� ������������\i ��� ����� {S}_1 � {S}_2\\'+
'������� � ���������� �������� {s}_1 � {s}_2 ����� S_1 � S_2 ��������������\\'+
'� ������������ ��������� �������� {v}^* (�������� ������ �� ���� �����\\'+
'��������� �������� ����� {S}_1 � {S}_2). ������ ������ ������� � �������\\'+
'���������� ����������� ������������ (��.~\2) ��������� �������:\\'+
'{v}^*\,=\,max\{{v}({i},\,{j})\}, {i}\,\l\,|{S}_1|, {j}\,\l\,|{S}_2|, ������ ���� �������� {v}({i},\,{j})\\'+
'����������� �� ���� ������� ({i}^*,\,{j}^*), �� ���� ��������, �������� ������\\'+
'���������� ����������� ������������ ��� ({i}^*,\,{j}^*), ������������ ������ ������\\'+
'���������� ������������ ����� {S}_1 � {S}_2. ��������� �������� ��������� �������\\'+
'��� ������� ������ ����������� ������������ (��.~\1), �����\\'+
'��������� {s}_1 � {s}_2, �������� ������ ���������� ������������. ���� �������\\'+
'��������� ��� �������, �� ������� ����������� �������� ������� {v}, �� �������\\'+
'���� � ����������� ��������� {i}^*, � ��� ��� � ���������� �����������\\'+
'��������� {i}^* \= � ����������� ��������� {j}^*. ���� ��� ���������� ���������\\'+
'������� �� ������� ({i}^*,\,{j}^*) ����� �������� ��������� ��������� �������� {s}_1\\'+
'� {s}_2, �� ����� �������� ��������� � ������������ � ���������� \1.\\'+
'������� �������� {v}^*, {i}^*, {j}^*, ��������� {s}_1 � {s}_2, � ����� �����������\\'+
'������������ ({A}_1,~{A}_2) ��� ���� ��������.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('�������� ������� v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultN('v^* = ', dv[i2,j2],3,1,2);
  ResultN('i^* = ', i1,22,1,2);
  ResultN('j^* = ', j1,50,1,2);
  ResultS('s_1 = ', ss01,22,2);
  ResultS('s_2 = ', ss02,50,2);
  ResultComment('����������� ������������ s_1 � s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment62;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ���� ����� {m} (<\,10) \= ������ ��������, ����������\\'+
'�� ������ �������� ��������� ����, � ������� ������ (��������� ������� �������\\'+
'� \33). ����� ���� �� ��� �������� ({s}_1,~{s}_2), �������� ������\\'+
'���������� ������������, ��������� �������� ���������� ��������\\'+
'��� ���������� ������� {v} (��.~\3), �������� ����� ������� {v}\\'+
'� ������� ���������� ������������ (��.~\1) � �������� ��������\\'+
'������ �� �������~{v} (��.~\2). ���� ������� ��������� ��� ��������,\\'+
'�������� ������ ���������� ������������, �� ����� ���� ���������\\'+
'� ������������ � ���������� \1. ������� ������������ ��������\\'+
'�������� {v}^*, ������� {i}^*, {j}^* ������ �������� {s}_1 � {s}_2, ���� ��������� {s}_1 � {s}_2,\\'+
'� ����� ����������� ������������ ({A}_1,~{A}_2) ��� ���� ��������.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
//  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y)and(length(s01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
//  ShowMatr('�������� ������� v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultN('v^* = ', dv[i2,j2],3,1,2);
  ResultN('i^* = ', i1,22,1,2);
  ResultN('j^* = ', j1,50,1,2);
  ResultS('s_1 = ', ss01,3,2);
  ResultS('s_2 = ', ss02,40,2);
  ResultComment('����������� ������������ s_1 � s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure CalcSSSpec(eq,neq: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := eq;
  ss[m+1,m+1] := 0;
  for i := 1 to m do
    for j := i+1 to m+1 do
    begin
    ss[i,j] := neq;
    ss[j,i] := neq;
    end;
end;


procedure Alignment63;
var
  i,j,max0: integer;
begin
  CreateTask(Subgroup5);
TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ����� \I���������� ����� ���������\i ����� {S}_1 � {S}_2,\\'+
'����� ��� ������ � ����������� �������������� {v}^* ������ ����������\\'+
'������������ (��.~\2). ��� ����� �������� ������� ������ {s}\\'+
'���������� ��������� �������: {s}({x},\,{y})\,=\,1 ��� {x}\,=\,{y} � {s}({x},\,{y})\,=\,\-100 ��� {x}\,\n\,{y}\\'+
'({x}, {y} \= �������, �������� � ������ {S}_1 � {S}_2, � ����� ������ �������).\\'+
'��� ���������� �������������� {v}^* ��������� ������� {v}, ��������� ��������\\'+
'���������� �������� (��.~\4). ������� ��������� �������� {v}^*,\\'+
'����� {k} ������ �� ������� ������� {v}, � ������� ���������� �������� {v}^*,\\'+
'� �������� ������� {k} ������� {v}: {v}_{k,j}, {j}\,=\,0,\,\.,\,|{S}_2|.'
);
  m := Rand(10,20);
//  repeat
  MakeStr(14,18,m,s1,s2);
  DType := 4;
  mm := length(s2);
  nn := length(s1);
  CalcSSSpec(1,-100);
  CalcV;
//  until k >= -99;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
//  DataN('m = ', m, xRight, 2,1);
//  ShowSS(3);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  max0 := -1;
  k := 0;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        k := i;
      end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultN('v^* = ',max0,xleft,1,2);
  ResultN('k = ',k,xright,1,2);
  ResultComment('v_{k,j}, j = 0,\.,|S_2|:',0,2);
  ResultComment(s0,0,3);
  for j := 0 to mm do
    ResultN('',dv[k,j],Center(j+1, mm+1, 3, 1), 4, 3);
  SetTestCount(5);
end;

procedure Alignment64;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, � ����� ������� {v}, ���������� ������� ����������\\'+
'�������� (��.~\5) ��� ������������� ������� ������ {s} ������������\\'+
'����, ��������� � \1. ����� ���� �� ����� �������� ����� {S}_1 � {S}_2\\'+
'���������� �����, ����� ��� ������ � ����������� ���� �������� ({s}_1,~{s}_2),\\'+
'�������� ������ ���������� ������������ (��.~\3). ��� ����������\\'+
'�������� {s}_1, {s}_2 ������ ����� ������� {v} � ������� ���������� ������������\\'+
'(��.~\3) � ��������� �������� ������ �� �������~{v}\\'+
'(��.~\4). ���� ������� ��������� ��� ��������, �������� ������\\'+
'���������� ������������, �� ����� ���� ��������� � ������������ � ����������\\'+
'\3. ������� ��������� {s}_1 \= ����� ��������� ����� {S}_1 � {S}_2\\'+
'���������� ����� (��������� ������������ ������ ������� ������ ��� ���������\\'+
'����� ��������� � ���������� {s}_2), � ����� ������� {i}^* � {j}^*, �������\\'+
'� ������� ��������� {s}_1 ������ � ������ {S}_1 � {S}_2 ��������������.'
);
  m := Rand(10,20);
  y := Random(7);
//  repeat
  repeat
  MakeStr(9,13,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+ 2 <=200;
  CalcSSSpec(1,-100);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
//  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
  ShowMatr('�������� ������� v:',dv,3,3);
  ResultS('s_1 = ', s01,0,2);
  ResultN('i^* = ', i1,xleft,4,2);
  ResultN('j^* = ', j1,xright,4,2);
  SetTestCount(5);
end;


procedure Alignment65;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ��� ����� ��������� ����� {S}_1 � {S}_2 ����������\\'+
'�����, ����� ��� ������ � ����������� ��� �������� ({s}_1,~{s}_2), �������� ������\\'+
'���������� ������������ ��� ������������� ������� ������ ������������ ����,\\'+
'��������� � \2. ��� ���������� �������� {s}_1 � {s}_2 ��������� ������� {v},\\'+
'��������� �������� ���������� �������� (��.~\6), ������ �����\\'+
'������� {v} � ������� ���������� ������������ (��.~\4) � ���������\\'+
'�������� ������ �� �������~{v} (��.~\5) ��� ������� ��������\\'+
'������� {v} � ������������ ���������. �������� {v}_{i,j} � ������������ ���������\\'+
'���������� �� ����������� ������� {i}, � ��� ������ �������� {i} \= �� �����������\\'+
'������� {j}. ������� ������ ��������� ����� ��������� ���������� �����\\'+
'� ������� {i}^* � {j}^*, ������� � ������� ��� ��������� ������ � ������ {S}_1 � {S}_2\\'+
'��������������. ������� ����� ���������� ��������� ����� ��������.'
);
  m := Rand(10,20);
  y := Rand(2,6);
  repeat
//  repeat
  MakeStrS(25,45,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSSSpec(1,-100);
  CalcV;
  max0 := -1;
  k := 0;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        k := 1;
        i2 := i;
        j2 := j;
      end
      else
      if dv[i,j]=max0 then
        k := k + 1;
      endij(i2,j2,i1,j1,s01,s02);
  until (k >=y) and (k<=8) and (length(s01)>7-y) and (length(s01)<15);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(mm,nn)),3,4);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
//  ShowMatr('�������� ������� v:',dv,y,3);
  cnt := 0;
  y := 0;
  case k of
  1..4: y := 2;
  5..6: y := 1;
  end;
  for i2 := 1 to nn do
    for j2 := 1 to mm do
    if dv[i2,j2]=max0 then
    begin
      cnt := cnt + 1;
      if odd(cnt) then
      begin
        k := 3;
        y := y + 1;
      end
      else
        k := 41;
      Str(cnt,s00);
      endij(i2,j2,i1,j1,s01,s02);
      ResultS(s00+': ', s01,k,y);
      ResultN('i^* = ', i1,k+20,y,2);
      ResultN('j^* = ', j1,k+29,y,2);
    end;
  ResultN('���������� ����� ��������: ',cnt,0,5,2);
  SetTestCount(5);
end;

procedure BackLCS(var ss: string; var i1,j1: integer);
var i,j,ii,jj: integer;
begin
  ss := '';
  i1 := 0;
  j1 := 0;
  i := Length(s1);
  j := Length(s2);
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      j := j-1;
    end
    else
    if df[i,j] = fup then
    begin
      i := i-1;
    end
    else
    begin
      ss := s1[i] + ss;
      i1 := i;
      j1 := j;
      i := i-1;
      j := j-1;
    end
  end;
end;


procedure Alignment66;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  b,b1: boolean;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {P} � {T} (|{P}|\,<\,|{T}|). \I����������������������\i ������ {T} ����������\\'+
'������, ������������ �� �������� ������ {T}, ������ � ��� �������, � �������\\'+
'��� ������ � ��� ������ (�������, �������� � ���������������������, � �������\\'+
'�� �������� \I��������\i, �� ������� ������������� ������ � �������� ������).\\'+
'������������ ������� ����� {P} � {T} �� ����� ������ ����, ���������, ������ ��\\'+
'������ {P} � �������� ��������������������� � ������ {T}, � ������� \t,\\'+
'���� ������, � \f � ��������� ������. ������� ����� ���������� ���������\\'+
'��������, ������� ������������� ��� ������� ������. � ��������� ������,\\'+
'��� ���� ��� �� ������������� ����� ������ {T} ����� ������, �������\\'+
'��� �� ������������� ����� ������ {P}, �� ������ {P}\\'+
'�� ����� ���� ���������������������� ������ {T}.'
);
  m := Rand(10,20);
//  y := Random(1)+1;
  repeat
  repeat
  MakeStrLCS(25,45,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1)and(abs(i1-j1)>6)and(i1 > 1) and(j1>1);
  mm := length(s00);
  res := Random(2);
  if res = 0 then
    s00[Rand(1,mm)] := Randc(m);
  DataS('P = ',s00,3,2);
  DataS('T = ',s1,3,3);
  DataComment(Rule(4,length(s1)),3,4);
  cnt := 0;
  i1 := 1;
  i2 := 1;
  while (nn-i1 >= mm-i2) and (i2 <= mm) do
  begin
    inc(cnt);
    if s1[i1] = s00[i2] then
      i2 := i2 + 1;
    i1 := i1 + 1;
  end;
  b := i2 > mm;
  ResultB('��������� ��������: ', b,0,2);
  ResultN('���������� ���������: ', cnt,0,4,2);
  SetTestCount(5);
end;


procedure Alignment67;
var
  i,j: integer;
begin
  CreateTask(Subgroup6);
TaskTextExt(
'���� ������ {S}_1 � {S}_2. \I����� ����������������������\i ����� {S}_1 � {S}_2\\'+
'���������� ���������������������, ������� ������ ������������ � {S}_1 � {S}_2.\\'+
'������ � \I���������� ����� ���������������������\i ����������� � ������ �����\\'+
'������� ����� ��������������������� (����. longest common subsequence \= LCS)\\'+
'����� {S}_1 � {S}_2. ����� LCS ��� ���� ����� ��������� �� ��������� ��������\\'+
'���� ����� (��.~\37), ���� ������� ������ ������������ ���������\\'+
'�������: {s}({x},\,{y})\,=\,1 ��� {x}\,=\,{y} � {s}({x},\,{y})\,=\,0 ��� {x}\,\n\,{y} ({x}, {y} \= �������, ��������\\'+
'� ������ {S}_1 � {S}_2, � ����� ������ �������). ����� ����� LCS ��� ������\\'+
'����� {S}_1 � {S}_2, ��������� �������� ���������� �������� ��� ����������\\'+
'�������~{V} (��.~\36). ������� �������� ���� ��������� �������\\'+
'�������~{V}: {V}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {V}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, ��� {n}\,=\,|{S}_1|\\'+
'(������� ����� LCS ����� ����� ���������� �������� �������~{V}).'
);
  m := Rand(10,20);
  repeat
  MakeStr(14,18,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSSSpec(1,0);
  CalcV;
  until dv[nn,mm]>3;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('V_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to mm do
    ResultN('',dv[nn-1,j],Center(j+1, mm+1, 3, 1), 3, 3);
  ResultComment('V_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment68;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, � ����� ������� {V}, ���������� ������� ����������\\'+
'�������� (��.~\37) ��� ������������� ������� ������ ������������\\'+
'����, ��������� � \1. ����� ���� �� ���������� �����\\'+
'���������������������� (LCS) ����� {S}_1 � {S}_2, �������� �������� ������\\'+
'�� ������� {V} �� ��������, ����������� � \35. ������,\\'+
'��������������� LCS, ����������� ������ ������; ��������� ������ �����������\\'+
'� ��� � ������, ����� ������� �� �������� {V}_{i,j} ����������� �� ���������\\'+
'(� �������� {V}_{i\-1,j\-1}, �������� ��������, �� 1 ������� �������� {V}_{i,j});\\'+
'��� ���� � ������ LCS ����������� ������ {S}_1[{i}] (������ ������� {S}_2[{j}]). ����\\'+
'�� ��������� ���� ��������� ���� ������� ��������� ��������� ������ ����������\\'+
'��������, �� ����� ����������������� �������� ��������� � ������������\\'+
'� ���������� \34. ������� ������, ��������������� ��������� LCS,\\'+
'� ������� {i} � {j}, � ������� ���������� ��������� LCS � ������� {S}_1 � {S}_2.\\'+
''
);
//�����, ����� �����, ����� �� ���������//
  m := Rand(10,20);
  y := Random(7);
  repeat
  repeat
  MakeStr(9,13,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]) and ((nn+1)*(mm+1)+ 2 <=200);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
  ShowMatr('�������� ������� V:',dv,3,3);
  ResultS('LCS: ', s00,0,2);
  ResultN('i = ', i1,xleft,4,2);
  ResultN('j = ', j1,xright,4,2);
  SetTestCount(5);
end;

procedure Alignment69;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2. ����� ���� �� ���������� ����� ����������������������\\'+
'(LCS) ����� {S}_1 � {S}_2, ��������� �������� ���������� �������� ��� ����������\\'+
'�������~{V} (��.~\38) � �������� �������� ������ �� �������~{V}\\'+
'(��.~\1). ���� �� ��������� ���� ��������� ���� ������� ���������\\'+
'��������� ������ ���������� ��������, �� ����� ����������������� ��������\\'+
'��������� � ������������ � ���������� \35. ������� ������,\\'+
'��������������� ��������� LCS, � ������� {i} � {j}, � ������� ����������\\'+
'��������� LCS � ������� {S}_1 � {S}_2.'
);
//�����, ����� �����, ����� �� ���������//
  m := Rand(10,20);
//  y := Random(1)+1;
  repeat
  repeat
  MakeStrLCS(25,45,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1)and(abs(i1-j1)>6)and(i1 > 1) and(j1>1);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(mm,nn)),3,4);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
//  ShowMatr('�������� ������� V:',dv,3,3);
  ResultS('LCS: ', s00,0,2);
  ResultN('i = ', i1,xleft,4,2);
  ResultN('j = ', j1,xright,4,2);
  SetTestCount(5);
end;


procedure Cover1;
var i,j,k: integer;
begin
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := seq[1];
  for i := 2 to nn do
  begin
    k := 0;
    for j := 1 to mm do
    begin
      inc(cnt);
      if seq[i]<=cov[j,ind[j]] then
      begin
        k := j;
        break;
      end;
    end;
    if k = 0 then
    begin
      inc(mm);
      ind[mm] := 0;
      k := mm;
    end;
    inc(ind[k]);
    cov[k,ind[k]] := seq[i];
  end;
end;

procedure Cover2;
var i0,i,j,k: integer;
begin
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := seq[1];
  cov[0,1] := -1;
  ind[0] := 1;
  cov[2,1] := 1000;
  ind[2] := 1;
  for i0 := 2 to nn do
  begin
    i := 0;
    j := mm+1;
    while j-i<>1 do
    begin
      k := i+(j-i) div 2;
      inc(cnt);
      if cov[k,ind[k]]>=seq[i0] then
        j := k
      else
        i := k;
    end;
    if j = mm+1 then
    begin
      inc(mm);
      ind[mm] := 0;
      cov[mm+1,1] := 1000;
      ind[mm+1] := 1;
    end;
    inc(ind[j]);
    cov[j,ind[j]] := seq[i0];
  end;
end;

procedure SubSeq;
var i,j,k: integer;
begin
  k := mm;
  seq1[k] := cov[mm,ind[mm]];
  for k := mm-1 downto 1 do
    for i := 1 to ind[k] do
    begin
      inc(cnt);
      if cov[k,i] < seq1[k+1] then
      begin
        seq1[k] := cov[k,i];
        break;
      end;
    end;
end;

procedure Alignment70;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ����� {N} (\l\,50) � ����� {A} �� {N} �����. \I����������������������\i ������ {A}\\'+
'���������� ����� ��������� �� {�}, ������������� � ��� �� �������, � �������\\'+
'��� ������ � �������� �����~{A}. \I���������\i ������ {A} ���������� ������������\\'+
'\I��������������\i ���������������������� {A}; ��� ���� ������ ������� ������ {A}\\'+
'������ � �������� ����� ���� ���. \I�������� ��������\i ���������� �����\\'+
'�������� � ���� ����������������������. \I���������� ���������\i ����������\\'+
'�������� ����������� �������. ����� ���������� �������� {A}, ���������\\'+
'��������� \I������ ��������\i: \(\X �������� {A} ������������, ������� � �������,\\'+
'� ������ ������� ���������� � ����� ������ ��������������\\'+
'���������������������, ������� �� ����� ���������� (������������\\'+
'��������������������� ������������ � ������� ����������� �� �������);\|\\'+
'\X ���� �� ���� ������������ ��������������������� ��������� �������\\'+
'�� {A} ���������� �� �����, �� �� �������� ��������������������� � �����\\'+
'���������� �������.\) ������� ������ ����������� �������� � ��� ��������\\'+
'������ �������� � ���� ���������������������, ��������� ���������������������\\'+
'� ������� ����������� �� �������. ������� ����� ���������� ��������� �����\\'+
'�� ������ {A}, ������� ������������� ��� ���������� ����������� ��������.\\'+
'\P\S����������\s. ��������� �������� ���������� ����������� ��������\\'+
'����� ������� {O}({N}\*{K}), ��� {N} \= ������ ��������� ������,\\'+
'� {K} \= ������ ����������� ��������.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover1;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('����� A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('������ ��������: ',mm,xLeft,1,2);
  ResultComment('���������������������, �������� � ��������:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    ResultComment(s00+':',2,y);
    for j := 1 to ind[i] do
      ResultN('',cov[i,j],6+(j-1)*3,y,2);
  end;
  ResultN('���������� ���������: ',cnt,0,y+1,3);
  SetTestCount(5);
end;


procedure Alignment71;
var
  i,j,k,mind,k1,k2,b: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ����� {N} (\l\,50), ����� {B} � ����� �� {N} ����� {A}_i, {i}\,=\,1,\,\.,\,{N}. ����� {A}_i\\'+
'����������� �� ����������. ���������� ������� {j} � ������ {A}, � ������� ����\\'+
'�������� ����� {B} � ����������� ��������������� ������. ������������ ��� �����\\'+
'��������� ������� \I��������� ��������� ������\i:\( (1) � ����� {A} ����������� ���\\'+
'\<���������\> ��������: {A}_0, ������� min\{{A}_1,~{B}\} (\<����� �������������\>),\\'+
'� {A}_{N+1}, ������� max\{{A}_N, {B}\} (\<���� �������������\>);\| (2) ���������� {i}\\'+
'���������� ������ 0, ���������� {j} \= ������ {N}\,+\,1;\| (3) ���� �����������\\'+
'����������� {j}\,\-\,{i}\,\n\,1, ��������� ��������� ��������: �������� ����������\\'+
'{k} ������ {i}\,+\,({j}\,\-\,{i})/2 (������ \</\> ���������� �������� ������� ������);\\'+
'���� {A}_k\,\g\,{B}, �� �������� �������� {k} � ���������� {j}, ����� �������� �������� {k}\\'+
'� ���������� {i}.\) ����� ���������� ��������� ��� ��������� ������� {j} �����\\'+
'����������� ������� ����������� (� ������ ������� ��������� ���������):\\'+
'{A}_{j\-1}\,<\,{B}\,\l\,{A}_j; ����� �������, {j} ����� ���������� ��������� ������� �������\\'+
'��������~{B}. ������� ��������� ������� {j} � ���������� ��������� ����� {A}_k � {B},\\'+
'����������� � �����~(3), ������� ������������� ��� �� �����������.\\'+
'\P\S����������\s. �������� ��������� ������ ����� ������� {O}(log~{N}), ��� {N} \= ������\\'+
'��������� ������ �����. ��� ���������� �������� {k} ���������� ������� �������\\'+
'�������������� ��� {i} � {j}, �.\,�. ({i}\,+\,{j})/2 (� ������ �������������� �������),\\'+
'������ �������������� ������� {i}\,+\,({j}\,\-\,{i})/2 �������� ����� ��������, ��� ���\\'+
'������������ ������ �� ������������ ��� ������� ��������� {i} �~{j}.'
);
//  m := Rand(10,20);
  k1 := Rand(5,15);
  k2 := Rand(80,95);
  nn := Rand(10,50);
  for i := 1 to nn do
    seq[i] := Rand(k1,k2);
  for k := 1 to nn-1 do
    for i := 1 to nn -k do
      if seq[i]>seq[i+1] then
        swap(seq[i],seq[i+1]);
  case Random(5) of
  0: b := Rand(1,seq[1]-1);
  1: b := Rand(seq[nn+1],99);
  else
     b := Rand(1,99);
  end;
  cnt := 0;
  seq[0] := -1;
  seq[nn+1] := 100;
  i := 0;
  j := nn+1;
  while j-i<>1 do
  begin
    k := i+(j-i) div 2;
    inc(cnt);
    if seq[k]>=b then
      j := k
    else
      i := k;
  end;
  DataN('N = ', nn, xLeft, 1, 2);
  DataN('B = ', b, 0, 1, 2);
  DataComment('����� A:', xRight,1);
  if nn > 25 then
  begin
  for i := 1 to 25 do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i,25,2,1),2);
    DataN('',seq[i],Center(i,25,2,1),3,2);
  end;
  for i := 26 to nn do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i-25,25,2,1),4);
    DataN('',seq[i],Center(i-25,25,2,1),5,2);
  end;
  end
  else
  for i := 1 to nn do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i,25,2,1),2);
    DataN('',seq[i],Center(i,25,2,1),3,2);
  end;
  ResultN('j = ',j,0,2,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment72;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ����� {N} (\l\,50) � ����� {A} �� {N} �����. ����� ���������� �������� {A},\\'+
'��������� ����������� ������� ���������, ���������� � \2.\\'+
'� \I���������������� ������ ���������\i ����������� ��������� ��������\\'+
'����������������������, �������� � ��������: � ����� ������ ���������� �������\\'+
'��������� ��������� �������� ������������ ���������������������� \I�����������\i\\'+
'\I�� �����������\i. ������� ��� ���������� ��������������������� � ����������\\'+
'�������, ������� ����� ���������� ��������� ������� �� ������ {A}, �����\\'+
'������������ �������� ��������� ������, ��������� � \1. ��� ����������\\'+
'��������� ��������� ������ ����� �������, ��� �������� ��������� �� ������ {A}\\'+
'����� � ��������� �� 0 �� 1000. ������� ������ ����������� ��������\\'+
'� ��� �������� ������ �������� � ���� ���������������������, ���������\\'+
'��������������������� � ������� ����������� �� �������. ������� �����\\'+
'���������� ��������� ����� �� ������ {A}, ������� �������������\\'+
'��� ���������� ����������� ��������.\\'+
'\P\S����������\s. ��������� ������������� ��������� ��������� ������\\'+
'���������������� ������ �������� ���������� ����������� �������� �����\\'+
'������� {O}({N}\*log\,{K}), ��� {K} \= ������ ����������� ��������.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('����� A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('������ ��������: ',mm,xLeft,1,2);
  ResultComment('���������������������, �������� � ��������:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    ResultComment(s00+':',2,y);
    for j := 1 to ind[i] do
      ResultN('',cov[i,j],6+(j-1)*3,y,2);
  end;
  ResultN('���������� ���������: ',cnt,0,y+1,3);
    Cover1;
  Str(cnt,s00);
  ResultComment('����������. ���������� ��������� ��� ��������� ������� ��������� ����� '+s00,3,y+2);

  SetTestCount(5);
end;

procedure Alignment73;
var
  i,j,mind,kk: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ���������� �������� ���������� ������ ����� {A} (��.~\3):\\'+
'������� ����������� ���������� {K} �������� � ���� ��������������\\'+
'���������������������� ({K}\,\l\,15), ����� ��� ������ ���������������������\\'+
'(� ������� ����������� �� �������) ����������� ����� ���������\\'+
'���������������������~{L} (\l\,15) � ���� ��������. ����� ���� �� \I����������\i\\'+
'\I������������ ����������������������\i (����. longest increasing sequence \= LIS)\\'+
'��������� ������ {A}, ��������� ��������� ��������:\( \X �������� LIS ������������\\'+
'� ����� (� ������� �������� �� �������), ����� ��������� ����� {K};\|\\'+
'\X � �������� ����������, {K}-�� �������� LIS ������� ��������� �������\\'+
'���������, {K}-� ���������������������;\| \X ����� ������������ ���������\\'+
'��������������������� (� ������� �������� �� �������), �� ������\\'+
'��������������������� ���������� ������ �� ���������, �������� ������� ������\\'+
'������ ��������, ����� ������������ � LIS, � ���� ������� ����������� � LIS\\'+
'����� ����� ����������� ���������.\) ������� �������� ����������� ����������\\'+
'������������ ���������������������, � ����� ���������� ��������� �����\\'+
'�� ������ {A}, ������� ������������� ��� ���������� LIS.\\'+
'\P\S����������\s. ��������� �������� ���������� LIS �� ����������� �������� �����\\'+
'������� {O}({N}), ��� {N} \= ����� ����� ��������� � �������� ������, ��� ��� � ����\\'+
'����� ��������� ������ ������� ������ ������������� �� ����� ������ ����.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  mind := 0;
  kk := 0;
  for i := 1 to mm do
  begin
    kk := kk + ind[i];
    if ind[i]>mind then
      mind := ind[i];
  end;
  until (mm <=15)and (mind <= 15);
  DataN('K = ', mm, xLeft, 1, 2);
  DataComment('���������������������, �������� � ��������:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    DataN(s00+':       L = ',ind[i],2,y,2);
    for j := 1 to ind[i] do
      DataN('',cov[i,j],26+(j-1)*3,y,2);
  end;
  cnt := 0;
  SubSeq;
  ResultComment('�������� LIS:',0,2);
  for i := 1 to mm do
    ResultN('',seq1[i],Center(i,mm,2,1),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  Str(kk,s00);
  ResultComment('����������. ���������� ��������� � �������� ������ A ����� '+s00,3,5);
  SetTestCount(5);
end;

procedure Alignment74;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ����� {N} (\l\,50) � ����� {A} �� {N} �����. ��������� ����������������\\'+
'������ �������� ���������� ����������� ��������~{A} (��.~\2)\\'+
'� �������� ���������� ���������� ������������ ��������������������� ������ {A}\\'+
'�� ��� ����������� �������� (��.~\1), ����� ���� �� ����������\\'+
'������������ ���������������������� (LIS) ������ {A}. ������� ������ LIS,\\'+
'�� ��������, � ����� ���������� ��������� ����� �� ������ {A}, �������\\'+
'������������� ��� ���������� LIS.\\'+
'\P\S����������\s. ������ �������� ���������� LIS, ���������� ���������������\\'+
'���������� ����������� ��������, ����� ������� {O}({N}\*log\,{K}),\\'+
'��� {N} \= ����� ��������� � �������� ������, � {K} \= ����� LIS\\'+
'(������ ������� ����������� ��������).'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  SubSeq;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('����� A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('������ LIS: ',mm,xLeft,2,2);
  ResultComment('�������� LIS:',xRight,2);
  for i := 1 to mm do
      ResultN('',seq1[i],Center(i,mm,2,1),3,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  SetTestCount(5);
end;

function cton(c:char): integer;
begin
  result := ord(c)-ord('a')+1;
end;

procedure MakeSeq;
var i,j,k: integer;
begin
  for i := 1 to m do
    indl[i] := 0;
  for i := length(s2) downto 1 do
  begin
    k := cton(s2[i]);
    inc(indl[k]);
    ll[k,indl[k]] := i;
  end;
  nl := 0;
  for i := 1 to length(s1) do
  begin
    l[i] := cton(s1[i]);
    nl := nl + indl[l[i]];
  end;
end;

var l1,l2: integer;

procedure InitL;
begin
  l1 := 1;
  l2 := 0;
end;

function NextL: integer;
begin
  inc(l2);
  while l2 > indl[l[l1]] do
  begin
    inc(l1);
    l2 := 1;
  end;
  result := ll[l[l1],l2];
end;

procedure Alignment75;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 (|{S}_2|\,\l\,|{S}_1|\,<\,20) � ����� {m} (<\,10) \= ������ ��������,\\'+
'���������� �� ������ �������� ��������� ����. ��������� �� ������ �������\\'+
'����� �����, ��������� ��������� ��������: \(\X ��� ������� ������� {x},\\'+
'�������������� � {S}_1, ��������� ������ ��� �������, � ������� ������ {x}\\'+
'����������� � {S}_2, ������ ������� � ���� ������ ������������ \I�� ��������\i;\|\\'+
'\X � �������������� ����� ����� ���������� ��������� ������ � �������,\\'+
'��������������� ������� ���������� � ������ {S}_1 ��������� � ����� ��������\\'+
'�������� (���� � ��� �� ������ ����� ���� �������� � ����� ��������� ���,\\'+
'���� ��������������� ����� ������ ������ ��������� ��� ������ � ������ {S}_1).\)\\'+
'� ������� ���������� �������� ������ (��������, ��������������� �����������\\'+
'� ���������� �������) ���������� ���������� ���� ������� ������� �� ����\\'+
'�������� ������ {S}_2. ����� �������� ������������� ������������ ����������\\'+
'�������, ������ ������� �������������� ����� � ���� \I������� ������\i\\'+
'�� ��������� ������. ������� ������ ����������� ������ ����� � ��� ��������.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
//    s1 := 'ababacabacaba';
//    s2 := 'acabacaba';
    until length(s2)<=length(s1);
    MakeSeq;
  until nl in [26..75];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
  DataN('m = ', m, xRight, 3,1);
  ResultN('������ ����������� ������: ', nl,xLeft,2,2);
  ResultComment('�������� ������: ', xRight,2);
  InitL;
  for i := 1 to 25 do
    ResultN('',NextL,Center(i,25,2,1),3,2);
  if nl <= 50 then
    for i := 26 to nl do
      ResultN('',NextL,Center(i-25,25,2,1),4,2)
  else
  begin
    for i := 26 to 50 do
      ResultN('',NextL,Center(i-25,25,2,1),4,2);
    for i := 51 to nl do
      ResultN('',NextL,Center(i-50,25,2,1),5,2);
  end;
  SetTestCount(5);
end;


procedure Cover2a;
var i0,i,j,k,e: integer;
begin
  InitL;
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := NextL;//seq[1];
  cov[0,1] := -1;
  ind[0] := 1;
  cov[2,1] := 1000;
  ind[2] := 1;
  for i0 := 2 to nl do
  begin
    i := 0;
    j := mm+1;
    e := NextL;
    while j-i<>1 do
    begin
      k := i+(j-i) div 2;
      inc(cnt);
      if cov[k,ind[k]]>=e{seq[i0]} then
        j := k
      else
        i := k;
    end;
    if j = mm+1 then
    begin
      inc(mm);
      ind[mm] := 0;
      cov[mm+1,1] := 1000;
      ind[mm+1] := 1;
    end;
    inc(ind[j]);
    cov[j,ind[j]] := e;//seq[i0];
  end;
end;


procedure Alignment76;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2, ����� {N} (\l\,50) � ����� {A} �� {N} �����, �����������\\'+
'�� ������� {S}_1 � {S}_2 � ������������ � ����������, ��������� � \1.\\'+
'������ ����� �������� ��������� ���������: ����� ������������\\'+
'��������������������� ������ {A} ���������� ��������� �����\\'+
'��������������������� ����� {S}_1 � {S}_2 ��� �� �����, ������ ��� ���������\\'+
'����� ��������������������� �������� ���������� ����� ������� ������ {S}_2,\\'+
'������������� � ��������, ������ ��������� ��������� ��������\\'+
'���������������������. ������� ����� ���������� ������������\\'+
'��������������������� (LIS) ������ {A} ���������� ��������� \I���������� �����\i\\'+
'\I���������������������\i (LCS) ����� {S}_1 � {S}_2. ��������� ����������������\\'+
'������ �������� ���������� ����������� �������� ������~{A} (��.~\4)\\'+
'� �������� ���������� ���������� ������������ ��������������������� {A}\\'+
'�� ����������� �������� (��.~\3), ����� ���� �� LIS ������ {A}\\'+
'� ������� ��������������� �� LCS ��� ����� {S}_1 � {S}_2 � ���� ������ ��������.\\'+
'������� ����� ���������� ��������� ����� �� ������ {A},\\'+
'������� ������������� ��� ���������� LIS.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
    until length(s2)<length(s1);
    MakeSeq;
  until nl in [26..50];
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataN('N = ', nl,xRight,2,2);
  DataComment('�������� ������ A: ', xRight,3);
  InitL;
  for i := 1 to 25 do
    DataN('',NextL,Center(i,25,2,1),4,2);
  for i := 26 to nl do
    DataN('',NextL,Center(i-25,25,2,1),5,2);
  Cover2a;
  Subseq;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq1[i]];
  ResultS('LCS: ',s00,32,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment77;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1 � {S}_2 (|{S}_2|\,\l\,|{S}_1|\,<\,20) � ����� {m} (<\,10) \= ������ ��������,\\'+
'���������� �� ������ �������� ��������� ����. ��������� �� ������ �������\\'+
'����� ����� {A}, ��������� � \2, �, ��������� ����������������\\'+
'������ �������� ���������� ����������� �������� {A} (��.~\5)\\'+
'� �������� ���������� ���������� ������������ ��������������������� (LIS)\\'+
'������ {A} �� ����������� �������� (��.~\4), ����� ���� �� LIS\\'+
'������ {A} � ������� ��������������� �� ���������� ����� ���������������������\\'+
'(LCS) ��� ����� {S}_1 � {S}_2 (��.~\1) � ���� ������ ��������. �������\\'+
'����� ���������� ��������� ����� �� ������ {A}, ������� �������������\\'+
'��� ���������� LIS.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
    until length(s2)<=length(s1);
    MakeSeq;
  until nl in [26..50];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
  DataN('m = ', m, xRight, 3,1);
{  DataComment('�������� ������ A: ', xRight,3);
  InitL;
  for i := 1 to 25 do
    DataN('',NextL,Center(i,25,2,1),4,2);
  for i := 26 to nl do
    DataN('',NextL,Center(i-25,25,2,1),5,2);}
  Cover2a;
  Subseq;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq1[i]];
  ResultS('LCS: ',s00,32,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure MakeStrLCS2(a,b,m: integer; var s1,s2,s3: string);
var i,nn,mm,k: integer;
procedure Minmax(var s1,s2: string);
var s0: string;
begin
  if length(s1)>length(s2) then
  begin
    s0 := s1;
    s1 := s2;
    s2 := s0;
  end;
end;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  nn := length(s1);

  s2 := TransformStr(m,s1);
  s3 := TransformStr(m,s1);

  mm := length(s2);
  k := Random(3);
  if k in [0,1] then
  for i := 1 to Rand(5,15) do
    s2 := randc(m) + s2;
  if k in [1,2] then
  for i := 1 to Rand(5,15) do
    s1 := randc(m) + s1;
  if length(s1) > b then
  for i := 1 to length(s1)-b do
    delete(s1,Rand(1,length(s1)),1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  s1 := Copy(s1,1,nn);
  s2 := Copy(s2,1,mm);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

  mm := length(s3);
  k := Random(2);
  if k =0 then
  for i := 1 to Rand(5,15) do
    s3 := randc(m) + s3;
  if length(s3) > b then
  for i := 1 to length(s3)-b do
    delete(s3,Rand(1,length(s3)),1);
  s3 := Copy(s3,1,mm);
  if s3 = '' then
    s3 := randc(m);
  if length(s3) < a then
  for i := 1 to a - length(s3) do
    insert(randc(m),s3, Rand(1,length(s3)));
  Minmax(s3,s2);
  Minmax(s2,s1);
  Minmax(s3,s2);
end;




procedure MakeSeq2;
var i,j,k: integer;
begin
  for i := 1 to m do
  begin
    indl[i] := 0;
    indl2[i] := 0;
  end;
  for i := length(s2) downto 1 do
  begin
    k := cton(s2[i]);
    inc(indl[k]);
    ll[k,indl[k]] := i;
  end;
  for i := length(s3) downto 1 do
  begin
    k := cton(s3[i]);
    inc(indl2[k]);
    ll2[k,indl2[k]] := i;
  end;
  nl := 0;
  for i := 1 to length(s1) do
  begin
    l[i] := cton(s1[i]);
    nl := nl + indl[l[i]]*indl2[l[i]];
  end;
end;

var l12,l22: integer;

procedure InitL2;
begin
  l1 := 1;
  l2 := 1;
  l22 := 0;
end;

function NextL2: Pair;
begin
  inc(l22);
  if indl2[l[l1]] < l22 then
  begin
    inc(l2);
    l22 := 1;
  end;
  while (l2 > indl[l[l1]])or(l22 > indl2[l[l1]]) do
  begin
    inc(l1);
    l2 := 1;
    l22 := 1;
  end;
  result.x2 := ll[l[l1],l2];
  result.x3 := ll2[l[l1],l22];
end;


procedure Alignment78;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 � {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20) � ����� {m} (<\,10) \= ������\\'+
'��������, ���������� �� ������ �������� ��������� ����. ��������� �� ������\\'+
'������� ����� ��� �����, ��������� ��������� ��������: \(\X ��� �������\\'+
'������� {x}, �������������� � {S}_1, ��������� ������ ��� ({i},\,{j}), � �������\\'+
'������� {i} ������������� ������� ��������� ������� {x} � {S}_2, � ������� {j} \=\\'+
'������� ��������� ����� �� ������� � {S}_3; ���� �������� ��� ���������\\'+
'���������� ������� ��������� � ������������� �� \I������������������� ��������\i:\\'+
'({x}_1,\,{x}_2)\,>\,({y}_1,\,{y}_2), ���� ���� {x}_1\,>\,{y}_1, ���� {x}_1\,=\,{y}_1 � {x}_2\,>\,{y}_2;\| \X � �������������� �����\\'+
'��� ����� ���������� ��������� ������ � �������, ��������������� �������\\'+
'���������� � ������ {S}_1 ��������� � ����� �������� �������� (���� � ��� ��\\'+
'������ ����� ���� �������� � ����� ��������� ���, ���� ��������������� �����\\'+
'������ ������ ��������� ��� ������ � ������ {S}_1).\) ��������� ���������������\\'+
'��������� ������ (��������, ��� ��������������� ���������� � ���������\\'+
'�������) ��� �������� �������, ��������� �� �������� {S}_2 � {S}_3 �� �����������,\\'+
'���������� ���������� ���������� ������ �� ���� �������� ����� {S}_2\\'+
'� {S}_3. ������� ������ ����������� ������ � ��� �������� \= ���� �����.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
//    s1 := 'ababacabacaba';
//    s2 := 'acabacaba';
  MakeSeq2;
  until nl in [30..70];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataS('S_3 = ',s3,3,4);
  DataComment(Rule(5,length(s1)),3,5);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
  DataN('m = ', m, xRight, 4,1);
  ResultN('������ ����������� ������: ', nl,xLeft,1,2);
  ResultComment('�������� ������: ', xRight,1);
  InitL2;
  y := 1;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-2)*10:2,s00);
  ResultComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    ResultN('(',e.x2,Center(i,10,7,0)+2,y,2);
    ResultN(',',e.x3,Center(i,10,7,0)+5,y,2);
    ResultComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-1)*10:2,s00);
    ResultComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      ResultN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      ResultN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      ResultComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;
  SetTestCount(5);
end;



procedure SubSeq2;
var i,j,k,max,par,q: integer;
    seq: array [0..2*nmax] of pair;
begin
  InitL2;
  for i := 1 to nl do
    seq[i] := NextL2;
  cnt := 0;
  for i := 1 to nl do
  begin
    max := 0;
    par := 0;
    for j := 1 to i-1 do
    begin
      if p2[j]>max then
      begin
        cnt := cnt + 1;
        if (seq[j].x2 < seq[i].x2) and (seq[j].x3 < seq[i].x3) then
        begin
          max := p2[j];
          par := j;
        end;
      end;
    end;
    p2[i] := max+1;
    b2[i] := par;
  end;
  mm := p2[1];
  k := 1;
  for i := 2 to nl do
    if p2[i]> mm then
    begin
      mm := p2[i];
      k := i;
    end;
  seq2[mm] := seq[k];
  for i := mm-1 downto 1 do
  begin
    k := b2[k];
    seq2[i] := seq[k];
  end;
end;



function GreaterThan(a,b:Pair): boolean;
begin
  result := (a.x2 > b.x2) and (a.x3 > b.x3);
end;

var    cov2: array[0..2*nmax,0..2*nmax] of pair;


procedure Cover2b;
var i,j,k: integer;
    e: pair;
begin
  InitL2;
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov2[1,1] := NextL2;//seq[1];
  for i := 2 to nl do
  begin
    k := 0;
    e := NextL2;
    for j := 1 to mm do
    begin
      inc(cnt);
      if not GreaterThan(e,cov2[j,ind[j]]) then
      begin
        k := j;
        break;
      end;
    end;
    if k = 0 then
    begin
      inc(mm);
      ind[mm] := 0;
      k := mm;
    end;
    inc(ind[k]);
    cov2[k,ind[k]] := e;
  end;
end;

procedure SubSeq2b;
var i,j,k: integer;
begin
  k := mm;
  seq2[k] := cov2[mm,ind[mm]];
  for k := mm-1 downto 1 do
    for i := 1 to ind[k] do
    begin
      inc(cnt);
      if GreaterThan( seq2[k+1],cov2[k,i]) then
      begin
        seq2[k] := cov2[k,i];
        break;
      end;
    end;
end;

procedure Alignment79;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 � {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20), ����� {N} (\l\,70) � ����� {A} �� {N} ���\\'+
'�����, ����������� �� ������� {S}_1, {S}_2 � {S}_3 � ������������ � ����������,\\'+
'��������� � \1. �������� ���� ����� {X}\,=\,({x}_1,\,{x}_2) ���������\\'+
'\I������ �������\i �������� ���� {Y}\,=\,({y}_1,\,{y}_2) (����������� {X}\,<\,{Y}), ���� ������������\\'+
'����������� ��� ������� �����������: {x}_1\,<\,{y}_1 � {x}_2\,<\,{y}_2. \I������������\i\\'+
'\I����������������������\i ������ {A} ��������� ��������������������� ���, � �������\\'+
'����� ������� ��������������������� ������ ������ ������������ ��������.\\'+
'����� {A} �������� ��������� ���������: ����� ��� ������������ (� ���������\\'+
'���� ������) ��������������������� ���������� ��������� �����\\'+
'��������������������� ����� {S}_1, {S}_2 � {S}_3 ��� �� ����� (��� ���������\\'+
'����� ��������������������� �������� ���������� ����� ������� ������ {S}_2,\\'+
'������������� � ��������, ������ ��������� ������ ��������� ���\\'+
'��������������������� ������ {A}). ������� ����� ���������� ������������\\'+
'��������������������� (LIS) ������ {A} ���������� ��������� ���������� �����\\'+
'��������������������� (LCS) ����� {S}_1, {S}_2 � {S}_3. ��� ���������� LIS � ������\\'+
'������ ����� ������������ ��������� ��������:\( \X ������ � ������� {A} ��������\\'+
'��� ������ � ������������ ������ ����� {P} � {B} ���� �� ������� {N};\|\\'+
'\X �������� {P}_1 �������� ������ 1, �������� {B}_1 \= ������ 0;\|\\'+
'\X �������� {P}_i, {i}\,=\,2,\,\.,\,{N}, �������� ������ max\{{P}_j\}\,+\,1,\\'+
'��� � �������� {j} ������� ������ � ��������� �� 1 �� {i}\,\-\,1, ��� �������\\'+
'����������� ����������� {A}_j\,<\,{A}_i, � �������� {B}_i �������� ������ ������������\\'+
'�� ��� ������� {j}, ��� ������� ����������� �������� {P}_j (���� �� ������\\'+
'������ ������ �� �������, �� {P}_i �������� ������ 1, � {B}_i \= ������ 0);\|\\'+
'\X ����� {K} \= ����� LIS, ������ max_{i=1,\.,N}\{{P}_i\};\| \X ��� ���������� �����\\'+
'�� LIS ��������� \I�������� ���\i: � �������� ���������� �������� LIS ����������\\'+
'������ �� ��������� {A}_q, ��� ������� {P}_q\,=\,{K}; ���� ������� LIS � ������� {i}\\'+
'��� ��������� (� ����� �������� {A}_j), �� � �������� ����������� �������� LIS\\'+
'(� ������� {i}\,\-\,1) ������� ������� ������ {A} � ������� {B}_j.\)\\'+
'��������� ������ ��������, ����� ���� �� LIS ������ {A} � �������\\'+
'��������������� �� LCS ��� ����� {S}_1, {S}_2 � {S}_3 � ���� ������ ��������.\\'+
'\P\S����������\s. ��������� � ������� �������� ���������� LIS ����� ������� {O}({N}^2).\\'+
'��������� ����� ������� �������� (������� {O}({N}\*log\,{K})), ����������\\'+
'�� ���������� ������������ �������� � �������� ������ (��.~\6),\\'+
'������ �� ��������������, ��� � ������ ��� {A} ����� ����������� \I�����������\i\\'+
'���� {X} � {Y}, ��� ������� �� ����������� �� ���� �� ����������� {X}\,<\,{Y}, {X}\,=\,{Y}, {Y}\,<\,{X}\\'+
'(��������, (1,\,2) � (2,\,1)).'
);
  m := Rand(4,9);
//  m := 5;
  y := Random(1)+1;
  repeat
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
//    s1 := 'badeaeaeaaaaa';
//    s2 := 'ebecbdedbeec';
//    s3 := 'caebcaeaaee';

  MakeSeq2;
  until nl in [30..70];
  SubSeq2;
  until mm > 3;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataS('S_3 = ',s3,3,3);
  DataComment(Rule(5,length(s1)),3,4);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
//  DataN('m = ', m, xRight, 4,1);
  DataN('N = ', nl,xRight,3,2);
  DataComment('�������� ������ A: ', xRight,4);

//  ResultN('������ ����������� ������: ', nl,xLeft,1,2);
//  ResultComment('�������� ������: ', xRight,1);

  InitL2;
  y := 4;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-5)*10:2,s00);
  DataComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    DataN('(',e.x2,Center(i,10,7,0)+2,y,2);
    DataN(',',e.x3,Center(i,10,7,0)+5,y,2);
    DataComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-4)*10:2,s00);
    DataComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      DataN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      DataN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      DataComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,32,3);
  Str(cnt, s00);
  ResultComment('����������. ���������� ����������� ��������� ��� ����� ����� '+s00,3,5);

//  ResultN('���������� ��������� ��� �����: ',cnt,0,4,4);
{ ������ ������������� ��������� ("������������" �������)
  Cover2b;
  SubSeq2b;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,28,3);
  ResultN('���������� ��������� ��� �����: ',cnt,0,5,4);
}
  SetTestCount(5);
end;

procedure Alignment80;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'���� ������ {S}_1, {S}_2 � {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20) � ����� {m} (<\,10) \= ������\\'+
'��������, ���������� �� ������ �������� ��������� ����. ��������� �� ������\\'+
'������� ����� {A} ��� �����, ��������� � \2, ����� ����, ��������\\'+
'�� �����, ��������� � \1, ����� ���� �� ���������� ������������\\'+
'���������������������� (LIS) ������ {A} � ������� ��������������� ��\\'+
'���������� ����� ��������������������� (LCS) ��� ����� {S}_1, {S}_2 � {S}_3\\'+
'� ���� ������ ��������.'
);
  m := Rand(4,9);
  repeat
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
  MakeSeq2;
  until nl in [30..70];
  SubSeq2;
  until mm > 3;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataS('S_3 = ',s3,3,4);
  DataComment(Rule(5,length(s1)),3,5);
  DataN('m = ', m, xRight,4,1);
//  DataN('N = ', nl,xRight,3,2);
//  DataComment('�������� ������ A: ', xRight,4);
{  InitL2;
  y := 4;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-5)*10:2,s00);
  DataComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    DataN('(',e.x2,Center(i,10,7,0)+2,y,2);
    DataN(',',e.x3,Center(i,10,7,0)+5,y,2);
    DataComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-4)*10:2,s00);
    DataComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      DataN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      DataN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      DataComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;}
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,32,3);
  Str(cnt, s00);
  ResultComment('����������. ���������� ����������� ��������� ��� ����� ����� '+s00,3,5);
  SetTestCount(5);
end;


{
procedure Alignment;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
(*
  TaskTextExt(
);
*)
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  DataS('','',0,3);
  ResultN('',cnt,0,3,2);
  SetTestCount(5);
end;
}


procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Alignment1;
  2: Alignment2;
  3: Alignment3;
  4: Alignment4;
  5: Alignment5;
  6: Alignment6;
  7: Alignment7;
  8: Alignment8;
  9: Alignment9;
  10: Alignment10;
  11: Alignment11;
  12: Alignment12;
  13: Alignment13;
  14: Alignment14;
  15: Alignment15;
  16: Alignment16;
  17: Alignment17;
  18: Alignment18;
  19: Alignment19;
  20: Alignment20;
  21: Alignment21;
  22: Alignment22;
  23: Alignment23;
  24: Alignment24;
  25: Alignment25;
  26: Alignment26;
  27: Alignment27;
  28: Alignment28;
  29: Alignment29;
  30: Alignment30;
  31: Alignment31;
  32: Alignment32;
  33: Alignment33;
  34: Alignment34;
  35: Alignment35;
  36: Alignment36;
  37: Alignment37;
  38: Alignment38;
  39: Alignment39;
  40: Alignment40;
  41: Alignment41;
  42: Alignment42;
  43: Alignment43;
  44: Alignment44;
  45: Alignment45;
  46: Alignment46;
  47: Alignment47;
  48: Alignment48;
  49: Alignment49;
  50: Alignment50;
  51: Alignment51;
  52: Alignment52;
  53: Alignment53;
  54: Alignment54;
  55: Alignment55;
  56: Alignment56;
  57: Alignment57;
  58: Alignment58;
  59: Alignment59;
  60: Alignment60;
  61: Alignment61;
  62: Alignment62;
  63: Alignment63;
  64: Alignment64;
  65: Alignment65;
  66: Alignment66;
  67: Alignment67;
  68: Alignment68;
  69: Alignment69;
  70: Alignment70;
  71: Alignment71;
  72: Alignment72;
  73: Alignment73;
  74: Alignment74;
  75: Alignment75;
  76: Alignment76;
  77: Alignment77;
  78: Alignment78;
  79: Alignment79;
  80: Alignment80;
  end;
end;


procedure inittaskgroup;
begin
  CreateGroup('Align', '�������� ������������� �����',
    '�. �. �������, 2012', 'sdfghssdserddghkhkjkbvcm', 80, InitTask);

  CommentText('\P��� �������� �������� ������ � �������� �������� ������ � ����������������.');
  CommentText('���� �������� ������ ����� ��������� ������� ��������, �� �� ���� ����');
  CommentText('��������� � ������������ �������.');
  CommentText('\P��� �������� ��������� ������ �������� ���������. ������� �������� �');
  CommentText('������� ���������� �� 1. ����� ������ {S} ������������ ����� |{S}|; ����� �������� ����� � �������� �� ����������� 100.');
  CommentText('����� {S}[{i}..{j}] ������������ \I���������\i {S}, ������������ � ������� {i} �');
  CommentText('�������������� � ������� {j} (���� {i}\,>\,{j}, �� {S}[{i}..{j}] ��������� ������ �������).');
  CommentText('����� {S}[{i}], {i}\,=\,1,\,\.,\,|{S}|, ������������ \I������\i ������ {S}, ������������� � ������� {i}.');

  CommentText('\P��� \I���������\i \E ���������� ��������� ��������, � ������� ������');
  CommentText('��� ������� ��������������� �����. ���� ������� \E � ������� �� ����������,');
  CommentText('�� ��������������, ��� ������ ����� ��������� ����� �������, �������� �� �����������.');

  CommentText('\P��������� ������ (����. row) ���������� � ������������� ������� \I���������\i, ����� �������� ��');
  CommentText('�� ��������� ����� (����. string).');

  CommentText('\P�������� ���������� ���������� �� ����� �.~�������� \<������, ������� � ������������������ � ����������:');
  CommentText('����������� � �������������� ��������\> (���.: ���-���������, 2003), �����~III.');


  Subgroup(Subgroup1);
CommentText('\P� ������ ��������� ��������������� ������������ ������ ��������� �������������');
CommentText('����� \= \I������ � ������������ ����������\i.');
CommentText('\I������������ ����������\i (����. edit distance) ���������� ���� �������� �����;');
CommentText('��� ����� ������������ ����� �������� ��������������, ����������� ��� ����������');
CommentText('��������� � ����������� ������������� ���� ������ � ������.');
CommentText('� ������ � ������������ ���������� ��������� �� ������ ���������� ������������');
CommentText('����������, �� � ����� ������������������ �������� ��������������,');
CommentText('��������� � ������ ����������� � ���������� \I����������� ������������ ������������\i.');
CommentText('��������� ���������� ������������� ���������� � ������������ �������������');
CommentText('����������� �������� �� \I������������ ����������������\i.');
  Subgroup(Subgroup2);
CommentText('\P� ������ ��������� ��������������� ��� ����������� ������ � ������������');
CommentText('����������: ������ � ������������ ���������� ��� ������� \I��������\i \= ��������,');
CommentText('���������� ����� ������� ������, � ������ � \I���������� ������������ ����������\i,');
CommentText('� ������� ��������� �������� �������������� ����� ����� ������ ���.');
  Subgroup(Subgroup3);
CommentText('������ ��������� ������� ��������� ������� ��������� ������������� �����,');
CommentText('����������� �� ���������� \I������������\i (����. alignment) ���� ����� �����������');
CommentText('������� � ��� ��������. ��������������� ���������� ������� ����������');
CommentText('������������ ������������, ������������ �� ���������������� ����������');
CommentText('������������ ������������� �����������, � ����� ������������, ������������');
CommentText('\I������� ������\i. �������� ������� ������ ������������');
CommentText('����� ������������� ���� (������) ��������� ��� ��������, ������ ����������� ������� �����');
CommentText('��������������� ���, � ������������� \= �������������. ������ ������������');
CommentText('������������ ��� ����� ������ ��������������� �������� ����������� �����;');
CommentText('������������ �� ����� ������ ���������� \I��������� ��������\i ������ �����,');
CommentText('� ��������� � ��� ������������ \= \I����������� ��������� �������������\i.');
CommentText('��� ���������� �������� ����� � ������������ ���������� ������������');
CommentText('������������ �������� ������������� ����������������.');
  Subgroup(Subgroup4);
CommentText('� ������ ��������� ��������������� ��� ����������� ����������� ����������');
CommentText('������������: ������������ � \I����������� ���������� ���������\i � ������������ � ������ \I���������\i.');
  Subgroup(Subgroup5);
CommentText('������ ��������� �������� ������, ��������� � �������������');
CommentText('��������� ������ �������� �����: ��� ������ ���������� \I������������ ���������\i');
CommentText('����� ������ � ������ � ������ \I���������� ������������\i');
CommentText('(� ��������� � ��� ������ \I���������� ����������� ������������\i), � �������');
CommentText('��������� ����� ��������� �������� ����� � ������������ ��������� ��������.');
CommentText('��� ���� ������������� ����� ����������� ���������, ����������');
CommentText('�� ������������ ����������������. � �������� �������� ������� ����������');
CommentText('��������� ���������� ������������ ��������������� ������ � ���������� \I������������ ����� ���������\i');
CommentText('(������� ��������, ��� ��� ������ � ���������� ����� ���������');
CommentText('���������� ����� ����������� ��������, ���������� \I�������� �� �������\i, ������');
CommentText('���� �������� ������� ���������� ����� ������� �������� ������ \= \I���������� ��������\i,');
CommentText('������� � ������ ������ ������� �� ���������������).');
  Subgroup(Subgroup6);
CommentText('� ������ ��������� ��������������� ��� ��������� ������� ������ �');
CommentText('\I���������� ����� ���������������������\i (����. longest common subsequence \= LCS)');
CommentText('���� �����. ������ �������� ������� �� ���������� �������������� �����');
CommentText('��������� ����������� ������������. ������ ��������, ���������� \I������������� ����������\i');
CommentText('��� LCS, ������ ������ ���������� LCS � ������ ���������� \I���������� ������������ ���������������������\i');
CommentText('(����. longest increasing subsequence \= LIS) ��� ���������� ������ �����.');
CommentText('��� ������ ���������� LIS ��������������� ����������� ��������, ����������');
CommentText('�� ���������� �������� ��������� ������ ����� ��������������� �����������������������.');
CommentText('����������� ����� ��������� �������������� ���������, ����������� ����� LCS ���� (��� �����) �����.');

end;

//exports inittaskgroup, activate;

begin
end.
