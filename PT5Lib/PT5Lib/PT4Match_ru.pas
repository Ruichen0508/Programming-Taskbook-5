{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

// \H53 -> \E

//---------------------------------
unit PT4Match_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;



const
//��������
  Subgroup1 = '����� ��������: ������� ������� � ������� ��������';
  Subgroup2 = '�������� �������������: ������� ������� � ������� ��������';
//  Subgroup3 = '�������� �������������: ������� ��������';
  Subgroup4 = '����� � �������������� ��������� ��������������';
//������������ ��������� ������
  Subgroup5 = '����� �����--�������--������';
  Subgroup6 = '������������� ��� ������ �����--�������--������';
  Subgroup7 = '����� ��������� �������';
  Subgroup8 = '������� ������ �� ������� ������� � �� �������� ��������';
//  Subgroup9 = '������� ������ �� �������� ��������';
//  Subgroup10 = '������������� ��� ������ �� �������� ��������';
  Subgroup11 = '����� ������--����';
//������������� ��������� ������
  Subgroup12 = '������� ����� ������ ������ � �������� ���������';
  Subgroup13 = '����� ������������ �����--������';
  Rule_ = '|1  |5  1|0  1|5  2|0  2|5  3|0  3|5  4|0  4|5  5|0  5|5  6|0  6|5  7|0';

var
  cnt: integer = 0;
  s, ss, s1, s2, p, t: string;
  ii, jj, k, m, n, mm, qq: integer;

function rand(a, b: integer): integer;
begin
  result := Random(b-a+1) + a;
end;

function randc(n: integer): char;
begin
  result := chr(Random(n) + 97);
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

function Rule(k,n: integer): string;
var s: string;
    i: integer;
begin
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

function CreateString(m,n: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + chr(97+Random(m));
end;

function Sub(s: string; i,j: integer): string;
begin
  result := '';
  if i > j then exit;
  result := Copy(s, i, j-i+1);
end;

procedure Ins(var s: string; p: string; k: integer);
var i: integer;
begin
  for i := 1 to length(p) do
  begin
    if i+k-1>length(s) then
      break;
    s[i+k-1] := p[i];
  end;
end;

var res,res0: array[1..100] of integer;
    nres, nres0: integer;

procedure Naive(p,t: string);
var n,m,i,j: integer;
    b: boolean;
begin
  n := length(p);
  m := length(t);
  cnt := 0;
  nres := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nres);
      if nres <= 100 then
        res[nres] := i;
    end;
  end;
end;

{
procedure Matching;
var
  i: integer;
begin
  CreateTask(Subgroup1);
  TaskText('', 0, 0);
  DataS('','',0,3);
  ResultN('',cnt,0,3,2);
  SetTestCount(5);
end;
}

procedure Matching1;
var
  i: integer;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {S} � ����� ����� {i}, {j}, �� ������������� ����� ������ {S}.', 0, 1);
  TaskText('������� � ������ ���������� �� 1. ����� {S}[{i}..{j}] ������������ ��������� {S},', 0, 2);
  TaskText('������������ � ������� {i} � �������������� � ������� {j}. ���� {i}\,>\,{j}, �� {S}[{i}..{j}]', 0, 3);
  TaskText('��������� ������ ������� (����� ������ ������ �����~0). ������� �����', 0, 4);
  TaskText('��������� {S}[{i}..{j}] � ��� �� ������� (� ������� ����� �������).', 0, 5);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+18) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('����� ��������� S[i..j]: ',length(ss),0,2,2);
  ResultComment('������� ��������� S[i..j]:',0,3);
  for i := 1 to length(ss) do
    ResultC('',ss[i],Center(i,length(ss),3,1),4);
  SetTestCount(5);
end;

procedure Matching2;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {S} � ����� {i}, {j}, �� ������������� ����� ������ {S}. \I���������\i', 0, 1);
  TaskText('������ {S} ���������� ����� �� ��������� ���� {S}[1..{k}], {k}\,\l\,|{S}| (|{S}| ����������', 0, 2);
  TaskText('����� ������~{S}). ���� ������� ������ {S} �������� �������� � �� ���������', 0, 3);
  TaskText('�� ���� �������, �� �� ���������� \I����������� ���������\i. ������� ����������', 0, 4);
  TaskText('��������� ��������� {S}[{i}..{j}], � ����� ����� � ������� ������� �� ��������,', 0, 5);
  TaskText('��������� �������� � ������� ����������� �� ����, � �������', 0, 0);
  TaskText('������� �������� \= � ������� ����� �������.', 0, 0);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+6) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('���������� ��������� ��������� S[i..j]: ',length(ss)+1,3,1,2);
  for j := 0 to length(ss) do
  begin
  ResultN('('+chr(48+j)+')  ����� ��������: ',j,3,j+2,2);
  ResultComment('������� ��������:',30,j+2);
  for i := 1 to j do
    ResultC('',ss[i],45+i*4, j+2);
  end;
  SetTestCount(5);
end;

procedure Matching3;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {S} � ����� {i}, {j}, �� ������������� ����� ������ {S}. \I���������\i', 0, 1);
  TaskText('������ {S} ���������� ����� �� ��������� ���� {S}[{k}..|{S}|], {k}\,\g\,1 (|{S}| ����������', 0, 2);
  TaskText('����� ������ {S}). ���� ������� ������ {S} �������� �������� � �� ���������', 0, 3);
  TaskText('�� ���� �������, �� �� ���������� \I����������� ���������\i. ������� ����������', 0, 4);
  TaskText('��������� ��������� {S}[{i}..{j}], � ����� ����� � ������� ������� �� ��������,', 0, 5);
  TaskText('��������� �������� � ������� �������� �� ����, � �������', 0, 0);
  TaskText('������� �������� \= � ������� ����� �������.', 0, 0);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+6) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('���������� ��������� ��������� S[i..j]: ',length(ss)+1,3,1,2);
  for j := length(ss) downto 0 do
  begin
  k := length(ss)-j;
  ResultN('('+chr(48+k)+')  ����� ��������: ',j,3,k+2,2);
  ResultComment('������� ��������:',30,k+2);
  for i := length(ss)-j+1 to length(ss) do
    ResultC('',ss[i],45+i*4, k+2);
  end;
  SetTestCount(5);
end;

procedure Matching4; {*}
var
  i: integer;
  b: boolean;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {P}, {T} � ����� {k}. ������ {P} ��������� \I��������\i (����. pattern),', 0, 1);
  TaskText('������ {T}~\= �������, � ������� ������ �������. ��������, ��� ����� ��������', 0, 2);
  TaskText('������ {T}, ������������� � ������� {k}, ������ ��� ����� |{P}|. ���������', 0, 3);
  TaskText('������������ ���������, ����������� ����� �������, ���������, ������ ��', 0, 4);
  TaskText('������� {P} � ����� {T}, ������� � �������~{k}. ���� ������, �� ������� \t, �����', 0, 5);
  TaskText('������� \f. ������� ����� ���������� ��������������� ��������� ��������.', 0, 0);
  n := rand(1, 20);
  m := rand(30, 60);
  p := CreateString(10, n);
  k := Rand(1,m-n);
  t := CreateString(10, m-n);
  s := p;
  if Random(3) <> 0 then
    s[Rand(1,length(s))] := randc(10);
  Insert(s,t,k);
  b := true;
  cnt := 0;
  for i := 1 to length(p) do
  begin
    inc(cnt);
    if p[i] <> t[k+i-1] then
    begin
      b := false;
      break;
    end;
  end;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ', k, 3,5,1);
  ResultB('��������� ��������: ',b,0,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching5;
var
  i,j: integer;
  b: boolean;
  c: array[1..100] of char;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {P} � {T}. ����� ������ ��������� ������ {P} � ����� {T}, ���������', 0, 1);
  TaskText('\I������� �������� ������\i, ��� ������� ����������� ������������ ��������� {P}', 0, 2);
  TaskText('� ������ �� �������� {T} ����� |{P}|. ��������� {T} ������������ ����� �������,', 0, 3);
  TaskText('������� ����� ����� ������������ ����� �������. ��� ������ ��������� ��������', 0, 4);
  TaskText('(���������� �� ���������� ���������) �������� ������������ ������ ������ {P}.', 0, 5);
  TaskText('����� ���������� ��������� ������� ������� � {T}, � ������� ���������� ������', 0, 0);
  TaskText('��������� {P}, ��� 0, ���� ��������� �����������.', 0, 0);
  repeat
  mm := Rand(2,5);
  n := rand(5, 10);
  m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 4 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  k := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if cnt < 100 then
        c[cnt] := p[j];
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      k := i;
      break;
    end;
  end;
  until cnt <= 75;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  i := cnt div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('�������������� � ���������� ������� ������ P:',0,1);
  for ii := 1 to cnt do
  begin
    if (ii-1) mod 19 = 0 then
      inc(j);
    ResultC('',c[ii],((ii-1) mod 19+1)*4-1,j);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('������� ������� ���������: ', k, 0,j,1);
  SetTestCount(5);
end;

procedure Matching6;
var
  i,j: integer;
  b: boolean;
  c: array[1..100] of char;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {P} � {T}. ����� ������ ��������� ������ {P} � ����� {T}, ���������', 0, 1);
  TaskText('����������� �������� �������� ������ (��.~\1), ��� ������� ��������� {T}', 0, 2);
  TaskText('������������ ����� �������, � ������������ ��������� ����� �����������', 0, 3);
  TaskText('������ ������. ��� ������ ��������� �������� (���������� �� ����������', 0, 4);
  TaskText('���������) �������� ������������ ������ ������ {P}. ����� ����������', 0, 5);
  TaskText('��������� ������� ������� � {T}, � ������� ���������� ������ ��������� {P},', 0, 0);
  TaskText('��� 0, ���� ��������� �����������.', 0, 0);
  repeat
  mm := Rand(2,5);
  n := rand(5, 10);
  m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 4 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  k := 0;
  for i := n to m do
  begin
    b := true;
    for j := n downto 1 do
    begin
      inc(cnt);
      if cnt < 100 then
        c[cnt] := p[j];
      if p[j] <> t[i+j-n] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      k := i-n+1;
      break;
    end;
  end;
  until cnt <= 75;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  i := cnt div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('�������������� � ���������� ������� ������ P:',0,1);
  for ii := 1 to cnt do
  begin
    if (ii-1) mod 19 = 0 then
      inc(j);
    ResultC('',c[ii],((ii-1) mod 19+1)*4-1,j);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('������� ������� ���������: ', k, 0,j,1);
  SetTestCount(5);
end;

procedure Matching7;
var
  i,j: integer;
  b: boolean;
  nk: integer;
  kk: array[1..19] of integer;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {P} � {T}. ����� ��� ��������� ������ {P} � ����� {T}, ��������� �������', 0, 2);
  TaskText('�������� ������ (��.~\2). ������� ������� � {T}, � ������� ����������', 0, 3);
  TaskText('��������� ������� {P}. ������� ����� ����� ���������� ��������� ��������,', 0, 4);
  TaskText('������� ������������� ��� ������� ������.', 0, 5);
  repeat
  mm := Rand(1,5);
  n := rand(5, 10);
  if mm = 1 then
    m := rand(15, 20)
  else
    m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 10 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  nk := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nk);
      if nk <= 19 then
        kk[nk] := i;
    end;
  end;
  until nk <= 19;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  ResultComment('���������:',0,2);

  for i := 1 to nk do
  ResultN('', kk[i], Center(i,nk,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;


procedure Matching8;
var
  i,j: integer;
  b: boolean;
  nk: integer;
  kk: array[1..19] of integer;
begin
  CreateTask(Subgroup1);
  TaskText('���� ������ {P} � {T}. ����� ��� ��������� ������ {P} � ����� {T}, ���������', 0, 2);
  TaskText('����������� �������� ��������� ������ (��.~\2). ������� �������', 0, 3);
  TaskText('� {T}, � ������� ���������� ��������� ������� {P}. ������� ����� �����', 0, 4);
  TaskText('���������� ��������� ��������, ������� ������������� ��� ������� ������.', 0, 5);
  repeat
  mm := Rand(1,5);
  n := rand(5, 10);
  if mm = 1 then
    m := rand(15, 20)
  else
    m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 10 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  nk := 0;
  for i := n to m do
  begin
    b := true;
    for j := n downto 1 do
    begin
      inc(cnt);
      if p[j] <> t[i+j-n] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nk);
      if nk <= 19 then
        kk[nk] := i-n+1;
    end;
  end;
  until nk <= 19;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  ResultComment('���������:',0,2);

  for i := 1 to nk do
  ResultN('', kk[i], Center(i,nk,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;


var Z_: array[1..200] of integer;
    L0_, R0_: integer;

procedure BaseZ_(s: string);
var i,j: integer;
begin
  j := 0;
  R0_ := 0;
  L0_ := 0;
  Z_[2] := 0;
  for i := 2 to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-1] then
      break;
    inc(j);
  end;
  if j = 0 then exit;
  Z_[2] := j;
  R0_ := j+1;
  L0_ := 2;
end;

procedure Step1Z_(s: string; k: integer);
var i,j: integer;
begin
  j := 0;
  Z_[k] := 0;
  for i := k to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-k+1] then
      break;
    inc(j);
  end;
  if j = 0 then exit;
  Z_[k] := j;
  R0_ := k+j-1;
  L0_ := k;
end;

procedure Step2Z_(s: string; k: integer);
var i,k1,l1,q1,q2: integer;
begin
  k1 := k - L0_+ 1;
  l1 := R0_- k + 1;
  if Z_[k1] < l1 then
  begin
    Z_[k] := Z_[k1];
    exit;
  end;
  Z_[k] := 0;
  q1 := R0_+1;
  q2 := l1;
  for i := R0_+1 to length(s) do
  begin
    inc(cnt);
    inc(q2);
    if s[q1] <> s[q2] then
      break;
    inc(q1);
  end;
  Z_[k] := q1-k;
  R0_ := q1-1;
  L0_ := k;
end;

procedure MainZ_(s: string);
var k: integer;
begin
  cnt := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
end;


procedure Matching9;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S} � ����� {i} (2\,\l\,{i}\,\l\,|{S}|). ����� {Z}_i({S}) ������������ ����� ����������', 0, 1);
  TaskText('��������� {S}, ������� ���������� � ������� {i} � ��������� � ��������� ������ {S}.', 0, 2);
  TaskText('���� ��������� ��������� �����������, �� {Z}_i({S})\,=\,0. ��������� ������������', 0, 3);
  TaskText('��������� �����, ����� {Z}_i({S}). ������� ��������� ��������, � �����', 0, 4);
  TaskText('���������� ��������� ��������, ��������������� ��� ��� ����������.', 0, 5);
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-1);
  Ins(s, Copy(s,1,10), k);
  if Random(3) > 0 then
    k := Rand(2, n);
  cnt := 0;
  j := 0;
  for i := k to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-k+1] then
      break;
    inc(j);
  end;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ', k, 0,4,1);
  ResultN('Z_i(S) = ', j, 0,2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching10;
var
  i,j,k,k0: integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}. \I{Z}-������ ������ {S} � ������� {i}\i (>\,1) ���������� ��������', 0, 1);
  TaskText('������ {S}[{i}..{i}\,+\,{Z}_i({S})\,\-\,1], �.\,�. ��������� {S}, ������������ � ������� {i}\,>\,1', 0, 2);
  TaskText('� ������� ��������� ����� {Z}_i({S}) (����������� {Z}_i({S}) ��. � \1).', 0, 3);
  TaskText('��������, ��� � ������ ������ {S} ������� ���� �� ���� {Z}-���� �����, ������� 2.', 0, 4);
  TaskText('��������� ������������ ��������� ����� � ��������� ������� � �������', 0, 5);
  TaskText('�����������, ����� ������ �� {Z}-������ � ��������� ���������. �������', 0, 0);
  TaskText('������� {i} ���������� {Z}-�����, ��� ����� {Z}_i({S}), � ����� ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� ������� ������.', 0, 0);
  repeat
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 50));
//  if Random(2)=0 then
//    for i := 1 to Random(15) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  k0 := 0;
  for k := 2 to n do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    if j > 2 then
    begin
      k0 := k;
      break;
    end;
  end;
  until k0 > 0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('i = ', k0, xLeft,2,2);
  ResultN('Z_i(S) = ', j, xRight,2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
//  MainZ_(s);
//  ResultN('Z_i(S) = ', Z_[k0], 0,5,2);
  SetTestCount(5);
end;

procedure Matching11;
var
  i,j,k,cnt0,k0: integer;

begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}. ��������� ������������ ��������� ����� � ��������� �������', 0, 1);
  TaskText('� ������� �����������, ����� ��� {Z}-����� ������ {S} (����������� {Z}-�����', 0, 2);
  TaskText('��. � \1). ��� ������� ���������� {Z}-����� ������� ��� �������', 0, 3);
  TaskText('� �����. ����� ����, ������� ���������� ��������� ��������,', 0, 4);
  TaskText('��������������� ��� ������� ������.', 0, 5);
  repeat
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 40));
//  if Random(2)=0 then
//    for i := 1 to Random(15) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  k0 := 0;
  for k := 2 to n do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    if j > 0 then
    begin
      inc(k0);
    end;
  end;
  until k0 < 36;
  cnt0 := cnt;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  MainZ_(s);
  i := k0 div 9;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('Z-����� (������� � �����):',0,j);

  k0 := 0;
  for k := 2 to n do
  begin
    if Z_[k] = 0 then
      continue;
    inc(k0);
    if (k0-1) mod 9 = 0 then
      inc(j);
    ResultN2('',k, Z_[k],((k0-1) mod 9+1)*8-3,j,3);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('���������� ���������: ',cnt0,0,j,3);

  SetTestCount(5);
end;

procedure Matching12;
var
  i,j,cnt0,r0,k0: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S} � ����� {k} (2\,\l\,{k}\,\l\,|{S}|). ����� {r}_i({S}) ������������ ������� ������', 0, 1);
  TaskText('����� {Z}-������ ������ {S} (��.~\2), ������������ �� ������� ������� {i}', 0, 2);
  TaskText('������ {S}, ��� 0, ���� ��������� {Z}-����� �����������. ����� �������, ���������', 0, 3);
  TaskText('�������� {r}_i({S}) ����� ����� �� ������� {r}_i({S})\,=\,max\{{j}\,+\,{Z}_j({S})\,\-\,1\}, ��� {j} ��������', 0, 4);
  TaskText('�� 2 �� {i}, ������ {Z}_j({S})\,>\,0. ��� ���� ����� {l}_i({S}) ������������ �� �������� {j},', 0, 5);
  TaskText('�� ������� ����������� ��������� ���� �������� (���� ����� �������� {j}', 0, 0);
  TaskText('���������, �� ����� {l}_i({S}) ������������ ���������� �� ���). ��� {r}_i({S})\,=\,0', 0, 0);
  TaskText('�������� {l}_i({S}) ���������� ������~0. ��������� ������������ ��������� �����', 0, 0);
  TaskText('��� ���������� {Z}_i({S}), ����� � ������� {r}_i({S}) � {l}_i({S}), {i}\,=\,2,\,\.,\,{k}. ������� �����', 0, 0);
  TaskText('����� ���������� ��������� ��������, ��������������� ��� ������� ������.', 0, 0);
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 40));
  k0 := Rand(2,9);
  if Random(2)=0 then
    for i := 1 to Random(k0) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  r[1] := 0;
  l[1] := 0;


  for k := 2 to k0 do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    r[k] := r[k-1];
    l[k] := l[k-1];
    r0 := k+j-1;
    if (j>0) and (r0 >= r[k]) then
    begin
      r[k] := r0;
      l[k] := k;
    end;
  end;
  cnt0 := cnt;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ',k0,0,4,1);
  ResultComment('    i:',3,2);
  ResultComment('r_i l_i:',3,3);
  for i := 2 to k0 do
  begin
    ResultComment('     '+chr(48+i),(i-1)*8+3,2);
    ResultN2('',r[i],l[i],(i-1)*8+3,3,3);
  end;
  ResultN('���������� ���������: ',cnt0,0,4,3);
  SetTestCount(5);
end;


procedure Matching13;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}. ������� �������� ������ {Z} ��� �������� �������� {Z}_i({S})', 0, 1);
  TaskText('(��.~\4) � �������� ���������� {R} � {L}. ����������� ������ ��� \I��������\i', 0, 2);
  TaskText('\I��������� ��������� ��������������\i: ��������� ������������ ���������,', 0, 3);
  TaskText('����� {Z}_2 � �������� ��������� �������� ��� ���������� {R} � {L} �������', 0, 4);
  TaskText('�������������� {r}_2({S}) � {l}_2({S}) (��.~\1). �������� �������� � ����', 0, 5);
  TaskText('��������������� ������������. ������� {Z}_2, {R}, {L} � ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� �� ����������.', 0, 0);
  mm := Rand(1,5);
  n := rand(20, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,100));
  cnt := 0;
  BaseZ_(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('Z_2 = ', Z_[2], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching14;
var
  i,j,k,cntmax,k0: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}, ����� {k} (2\,<\,{k}\,\l\,|{S}|) � �������� {R}\,=\,{r}_{k\-1} � {L}\,=\,{l}_{k\-1}. ��������,', 0, 1);
  TaskText('��� {k}\,>\,{R}. ����������� ��� ������ �������� {k}-� ��� \I�������� ���������\i', 0, 2);
  TaskText('\I��������� ��������������\i. ��� ����� ����� {Z}_k, ��������� ������������', 0, 3);
  TaskText('���������, � �������� �������� {R} � {L} ������� �������������� {r}_k � {l}_k', 0, 4);
  TaskText('({R}\,=\,{k}\,+\,{Z}_k\,\-\,1, {L}\,=\,{k}, ���� {Z}_k\,>\,0; � ��������� ������ {R} � {L} �� ����������).', 0, 5);
  TaskText('�������� �������� � ���� ��������������� ������������. ������� {Z}_k, {R}, {L}', 0, 0);
  TaskText('� ���������� ��������� ��������, ��������������� ��� �� ����������.', 0, 0);
  repeat
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  r[2] := R0_;
  l[2] := L0_;
  cntmax := 0;
  k0 := 0;
  for k := 3 to n do
  begin
    cnt := 0;
    if k > R0_ then
    begin
      Step1Z_(s,k);
      if cnt >= cntmax then
      begin
        k0 := k;
        cntmax := cnt;
      end;
    end
    else
      Step2Z_(s,k);
    r[k] := R0_;
    l[k] := L0_;
  end;
  until (cntmax > 0) and (k0 > 2);
  k := k0;
  R0_ := r[k-1];
  L0_ := l[k-1];
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ', k, Center(1,3,7,6),4,1);
  DataN('R = ', R0_, Center(2,3,7,6),4,1);
  DataN('L = ', L0_, Center(3,3,7,6),4,1);
  cnt := 0;
  Step1Z_(s,k);
  ResultN('Z_k = ', Z_[k], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching15;
var
  i,j,k,cntmax,k0,b: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}, ����� {k} (2\,<\,{k}\,\l\,|{S}|), �������� {R}\,=\,{r}_{k\-1} � {L}\,=\,{l}_{k\-1}, � �����', 0, 1);
  TaskText('�������� {Z}_i, {i}\,=\,2,\,\.,\,{k}\,\-\,1. ��������, ��� {k}\,\l\,{R}. ����������� ��� ������ ��������', 0, 2);
  TaskText('{k}-� ��� \I�������� ��������� ��������� ��������������\i. ��� ���� ������,', 0, 3);
  TaskText('��� � ���� ����������� {k}\,\l\,{R} ��������� {S''}\,=\,{S}[{k}..{R}] ������ � {Z}-���� {S}[{L}..{R}],', 0, 4);
  TaskText('������� (�� ����������� {Z}-�����) ��������� � ��������� {S}[1..{Z}_L]. �������', 0, 5);
  TaskText('{S''}\,=\,{S}[{k''}..{Z}_L], ��� {k''}\,=\,{k}\,\-\,{L}\,+\,1, �, �������������, ���������, ������������', 0, 0);
  TaskText('� ������� {k}, ������ ���������, �� ������� ����, � ��������� {S} �����', 0, 0);
  TaskText('min\{{Z}_{k''},\,|{S''}|\} (|{S''}|\,=\,{R}\,\-\,{k}\,+\,1). ���� ��� ���� {Z}_{k''}\,<\,|{S''}|, �� �������', 0, 0);
  TaskText('�������� {Z}_k\,=\,{Z}_{k''}; {R} � {L} ��� ���� �� ����������. ���� �� {Z}_{k''}\,\g\,|{S''}|,', 0, 0);
  TaskText('�� ���� ��������� �������������� ��������, ��������� �� ������������', 0, 0);
  TaskText('������� {S}[{p}], ������� � {p}\,=\,|{S''}|\,+\,1, � {S}[{q}], ������� � {q}\,=\,{R}\,+\,1; ���� {q} ���������', 0, 0);
  TaskText('�������� |{S}|\,+\,1 ��� � ������� {q}\,\g\,{R}\,+\,1 ����������� ������������, �� �������', 0, 0);
  TaskText('�������� {Z}_k\,=\,{q}\,\-\,{k}, {R}\,=\,{q}\,\-\,1, {L}\,=\,{k}. � ����� ������ {R} � {L} �������� ������� {r}_k', 0, 0);
  TaskText('� {l}_k ��������������. �������� �������� � ���� ��������������� ������������.', 0, 0);
  TaskText('������� {Z}_k, {R}, {L} � ���������� ��������� ��������, ���������������', 0, 0);
  TaskText('��� �� ���������� (��� {Z}_{k''}\,<\,|{S''}| ������ ���������� ����� �����~0).', 0, 0);
  b := Random(3);
  repeat
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  r[2] := R0_;
  l[2] := L0_;
  cntmax := 0;
  k0 := 0;
  for k := 3 to n do
  begin
    if k > R0_ then
    begin
      Step1Z_(s,k);
    end
    else
    begin
      cnt := 0;
      Step2Z_(s,k);
      if (b <> 0) and (cnt >= cntmax) and (k < 20) then
      begin
        k0 := k;
        cntmax := cnt;
      end
      else
      if (b = 0) and (cnt = 0) and (k < 20) then
        k0 := k;
    end;
    r[k] := R0_;
    l[k] := L0_;
  end;
  until k0 > 2;
  k := k0;
  R0_ := r[k-1];
  L0_ := l[k-1];
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ', k, Center(1,3,7,6),4,1);
  DataN('R = ', R0_, Center(2,3,7,6),4,1);
  DataN('L = ', L0_, Center(3,3,7,6),4,1);
  for i := 2 to k-1 do
    DataN('',Z_[i],Center(i-1,k-2,2,2),5,2);
  cnt := 0;
  Step2Z_(s,k);
  ResultN('Z_k = ', Z_[k], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching16;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup2);
  TaskText('���� ������ {S}. ����� {Z}_i({S}), {i}\,=\,2,\,\.,\,|{S}|, ��������� \I�������\i', 0, 2);
  TaskText('\I�������� ��������������\i, ��������� � \3\:\1.', 0, 3);
  TaskText('������� ��������� {Z}_i({S}), � ����� ���������� ��������� ��������,', 0, 4);
  TaskText('��������������� ��� ���������� ���������.', 0, 5);
  i := Random(10);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  for k := 3 to n do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
  end;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  i := (n-1) div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('{Z}_i({S}), {i}\,=\,2,\,\.,\,|{S}|:',0,j);

  for k := 2 to n do
  begin
    if (k-2) mod 19 = 0 then
      inc(j);
    ResultN('',Z_[k],((k-2) mod 19+1)*4-1,j,2);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('���������� ���������: ',cnt,0,j,2);
  SetTestCount(5);
end;

procedure Matching17;
var
  i,j,k,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('���� ������ {P} � {T}, �� ���������� ������ \<$\>. ����������� ������� ��������', 0, 1);
  TaskText('������ ���� ��������� {P} � {T}, ����������� ������ {S}\,=\,{P}\,+\,\<$\>\,+\,{T} � ��������', 0, 2);
  TaskText('��� ��� �������� ������������� (��.~\1). ������� ��������� {P} � {T}', 0, 3);
  TaskText('������������� �������� {Z}_i({S}), ������ |{P}| (��������, {i}\,>\,|{P}|\,+\,1); ��� ����', 0, 4);
  TaskText('������ ��������� ���������� � ������� {i}\,\-\,|{P}|\,\-\,1 ������ {T}. ������� ���������', 0, 5);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 0);
  TaskText('���������� ��������� ��������, ��������������� ��� ���������� ���������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
    s := CreateString(mm, rand(25, 50))
  else
    s := CreateString(mm, rand(50, 70));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  n := Rand(5,10);
  p := copy(s,1,n);
  t := copy(s,n+1, 100);
  s := p + '$' + t;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (k > n+1) and (Z_[k]=n) then
      inc(k0);
  end;
  until k0 < 20;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := 0;
  ResultComment('���������:',0,2);

  for k := n+2 to length(s) do
  begin
    if Z_[k] = n then
    begin
      inc(j);
      ResultN('',k-n-1,Center(j,k0,2,2),3,2);
    end;
  end;
  ResultN('���������� ���������: ',cnt,0,4,2);
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

{
function Shift(a,b: string): integer;
var i: integer;
begin
  result := -1;
  for i := 0 to length(a)-1 do
    if copy(a,i+1,100)+copy(a,1,i) = b then
    begin
      result := i;
      exit;
    end;
end;
}


procedure Matching18;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('���� ������ {P} � {T}, �� ���������� ������ \<$\>. ����� ��� ��������� {P} � {T},', 0, 1);
  TaskText('������������ ������ {T} ��� \I�����������\i (����� ���������� ������� ������ {T}', 0, 2);
  TaskText('����� ������� �� ������ ������). ��� ����� ������������ ������ {S}\,=\,{P}\,+\,\<$\>\,+\,{T}\,+\,{T''},', 0, 3);
  TaskText('��� {T''}\,=\,{T}[1..|{P}|\,\-\,1], � ������������ ��� ��� ������� �������� ���������', 0, 4);
  TaskText('�������������� (��.~\2). ������� ��������� ������� ���� ���������', 0, 5);
  TaskText('��������� (� ������� �����������), � ����� ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� ���������� ���������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
    s := CreateString(mm, rand(15, 25))
  else
    s := CreateString(mm, rand(40, 60));
  if (mm <> 1) and (Random(2)=0) then
    for i := 1 to Random(10) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  n := length(s);
  k := Rand(5,10);
  j := rand(1,k-1);
  p := copy(s,n-j+1,j) + copy(s,1,k-j);
  t := s;
  if mm <> 1 then
  for i := 1 to 10 do
    Ins(t, Copy(p,1,Rand(length(p)-2,length(p))), Rand(5,n-15));
  n := length(p);
  s := p + '$' + t + Copy(t,1,n-1);;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (k > n+1) and (Z_[k]=n) then
      inc(k0);
  end;
  until k0 < 20;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := 0;
  ResultComment('���������:',0,2);

  for k := n+2 to length(s) do
  begin
    if Z_[k] = n then
    begin
      inc(j);
      ResultN('',k-n-1,Center(j,k0,2,2),3,2);
    end;
  end;
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;


{
function Suf(a,b: string): integer;
var i: integer;
begin
  result := 0;
  for i := length(a) downto 1 do
    if copy(a,length(a)-i+1,100) = copy(b,1,i) then
    begin
      result := i;
      exit;
    end;
end;
}

procedure Matching19;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('���� ������ {A} � {B}, �� ���������� ������ \<$\>. ����� ���������� �������', 0, 1);
  TaskText('������ {A}, ������� ������������ �������� ��������� ������ {B}, � ������� ���', 0, 2);
  TaskText('����� (��� 0, ���� ��������� ������� �����������). ��� ����� ������������', 0, 3);
  TaskText('������ {S}\,=\,{B}\,+\,\<$\>\,+\,{A} � � ������� �������� ��������� ��������� ��������������', 0, 4);
  TaskText('(��.~\3) ����� {q}\,=\,max {Z}_i({S}), ��� {i} ��������� ��� ��������,', 0, 5);
  TaskText('��� ������� {r}_i({S})\,=\,|{A}|\,+\,|{B}|\,+\,1. ������� ����� ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� ���������� ���������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  p := CreateString(mm, rand(25, 68));
  t := CreateString(mm, rand(25, 68));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(p);
  m := length(t);
  if Random(4)>0 then
  begin
    k := Rand(1,min(n,m));
    ins(p, Copy(t,1,k), n-k+1);
  end;
  s := t + '$' + p;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  if (R0_ = m+n+1) and (Z_[2]>k0) then
    k0 := Z_[2];
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (R0_ = m+n+1) and (Z_[k]>k0) then
      k0 := Z_[k];
  end;
  DataS('A = ',p,3,2);
  DataComment(Rule(4,max(n,m)),3,3);
  DataS('B = ',t,3,4);
  ResultN('����� ����������� �������� A, ������� �������� B: ',k0,0,2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
//  ResultN('',suf(p,t),0,5,2);
  SetTestCount(5);
end;


procedure Matching20;
var
  i,j,k0,res: integer;
begin
  CreateTask(Subgroup4);
  TaskText('���� ������ {A} � {B} ���������� �����, �� ���������� ������ \<$\>. ����������,', 0, 1);
  TaskText('�������� �� ������ {B} \I����������� �������\i ������ {A}, � ��� �������������', 0, 2);
  TaskText('������ ������� ����������� �������� ���������������� \I������ ������\i (���', 0, 3);
  TaskText('������������� ������ ������� \-1). ��������, ��� ����� {A}\,=\,\<abcd\> � {B}\,=\,\<bcda\>', 0, 4);
  TaskText('���� ������� ��������~1, � ��� ����� {A}\,=\,\<aaa\> � {B}\,=\,\<aaa\> \= ��������~0. ���', 0, 5);
  TaskText('����� ������������ ������ {S}\,=\,{A}\,+\,\<$\>\,+\,{B} � � ������� �������� ��������� ���������', 0, 0);
  TaskText('�������������� (��.~\4) ����� {q}\,=\,max~{Z}_i({S}), ��� {i} ���������', 0, 0);
  TaskText('��� ��������, ��� ������� {r}_i({S})\,=\,2|{A}|\,+\,1. ���� {q}\,=\,0, �� ������� \-1, �����', 0, 0);
  TaskText('��������� ������������ ��������� ���������� ����� ����� {A} � {B},', 0, 0);
  TaskText('�, � ����������� �� ����������� ����� ���������, ������� \-1 ��� ��������', 0, 0);
  TaskText('������ ������ (��� �������� ����� ������������ ����� {q}). ������� �����', 0, 0);
  TaskText('���������� ��������� ��������, ��������������� ��� ������� ������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  s := CreateString(mm, rand(25, 68));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  k0 := Rand(1,n);
  t := Copy(s,k0+1,100)+Copy(s,1,k0);
  p := t;
  case Random(4) of
  0: begin p := s; end;
  1: begin
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
     end;
  end;
  t := s + '$' + p;
  cnt := 0;
  k0 := 0;
  BaseZ_(t);
  if (R0_ = 2*n+1) and (Z_[2]>k0) then
    k0 := Z_[2];
  for k := 3 to length(t) do
  begin
    if k > R0_ then
      Step1Z_(t,k)
    else
      Step2Z_(t,k);
    if (R0_ = 2*n+1) and (Z_[k]>k0) then
      k0 := Z_[k];
  end;
  res := -1;
  if k0 > 0 then
  begin
    for i := k0+1 to n do
    begin
      inc(cnt);
      if s[i] <> p[i-k0] then
      begin
        k0 := 0;
        break;
      end;
    end;
    if k0 > 0 then
    if
      k0 = n then res := 0
      else
        res := k0;
  end;
  DataS('A = ',s,3,2);
  DataComment(Rule(4,length(s)),3,3);
  DataS('B = ',p,3,4);
  ResultN(' �������� ������ ������: ',res,0,2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
//  ResultN('',shift(s,p),0,5,2);
  SetTestCount(5);
end;

var sp_, sp1_: array[1..100] of integer;

procedure MainSP1_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    sp1_[i] := 0;
  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    sp1_[i] := Z_[j];
  end;
end;

procedure MainSP_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  MainSP1_(s);
  sp_[n] := sp1_[n];
  for i := n-1 downto 2 do
    sp_[i] := max(sp_[i+1]-1, sp1_[i]);
end;

procedure Matching21;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('���� ������ {P} � ����� {i} (\l\,|{P}|). ����� {sp}_i({P}) ������������ ����� �����������', 0, 2);
  TaskText('������������ �������� ��������� {P}[1..{i}], ������� ��������� � ��������� {P}', 0, 3);
  TaskText('(����������� ���������� ���������� ������� ���� \<suffix\> � \<prefix\>). ����', 0, 4);
  TaskText('��������� �������� �����������, �� {sp}_i({P})\,=\,0. ������� {sp}_i({P}).', 0, 5);
  k0 := Random(11);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  k := 0;
  for i := 1 to 20 do
  begin
    j := Rand(1,n);
    if sp_[j] = k0 then
    begin
      k := j;
      break;
    end;
  end;
  if k = 0 then
    k := Rand(1,n);
  until k0 = sp_[k];
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('sp_{i}(P) = ',sp_[k],0,3,2);
  SetTestCount(5);
end;

procedure Matching22;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('���� ������ {P} � ����� {k} (\l\,|{P}|). ����� {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1,', 0, 1);
  TaskText('������������ ����� ����������� ������������ �������� ��������� {P}[1..{i}],', 0, 2);
  TaskText('������� ��������� � ��������� {P} � ��� �������� ����������� ��������������', 0, 3);
  TaskText('�������: ������� � �������� {i}\,+\,1 � {sp''}_i({P})\,+\,1 �� �����. ����� �������,', 0, 4);
  TaskText('{sp''}_i({P})\,\l\,{sp}_i({P}) (�������� {sp}_i({P}) ���������� � \1). � ������ {i}\,=\,|{P}|', 0, 5);
  TaskText('�� ����������� ���������� {sp''}_{|P|}({P})\,=\,{sp}_{|P|}({P}). ������� {sp''}_i({P}) ��� {i}\,=\,{k},\,\.,\,|{P}|.', 0, 0);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  k := rand(2,19);
  k0 := 0;
  for i := n-k+1 to n do
    if sp_[i] = sp1_[i] then
      inc(k0);
  until k0<k;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', n-k+1, 0, 4, 1);
  ResultComment('�������� sp''_{i}(P), i=k,...,|P|:',0,2);
  for i := n-k+1 to n do
    ResultN('',sp1_[i],Center(i-n+k,k,2,2),3,2);
  ResultComment('����������. ��� ��������� ���� ��������� �������� sp_{i}(P), i=k,...,|P|:',0,4);
  for i := n-k+1 to n do
  begin
    str(sp_[i]:2,s);
    ResultComment(s,Center(i-n+k,k,2,2),5);
  end;
  SetTestCount(5);
end;

function f_(i: integer): integer;
begin
  if i = 1 then
    result := 1
  else
    result := sp_[i-1]+1;
end;

function f1_(i: integer): integer;
begin
  if i = 1 then
    result := 1
  else
    result := sp1_[i-1]+1;
end;


procedure Matching23;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('���� ������ {P} � ����� {i} (\l\,|{P}|\,+\,1). ����� {F}_P({i}) � {F''}_P({i}) ������������', 0, 1);
  TaskText('�������������� \I������\i � \I������� ������� �������\i ��� ������ {P}:', 0, 2);
  TaskText('{F}_P({i})\,=\,{sp}_{i\-1}({P})\,+\,1, {F''}_P({i})\,=\,{sp''}_{i\-1}({P})\,+\,1 (�������� {sp}_i({P}) ����������', 0, 3);
  TaskText('� \2, � �������� {sp''}_i({P}) \= � \1). ��� ����', 0, 4);
  TaskText('������������� ��������������, ��� {sp}_0({P})\,=\,{sp''}_0({P})\,=\,0. ����� {F}_P({i}) � {F''}_P({i}).', 0, 5);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  if k0=0 then
    case Random(3) of
    0: k := 1;
    1: k := n;
    2: k := n+1;
    end
  else
  begin
    k := 0;
    for i := 1 to 10 do
    begin
      j := Rand(2,n+1);
      if (k0=1) and (F_(j) = F1_(j)) or (k0>1) and (F_(j) <> F1_(j)) then
      begin
        k := j;
        break;
      end;
    end;
  end;
  until k>0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('F_P(i) = ',F_(k),xLeft,3,2);
  ResultN('F''_P(i) = ',F1_(k),xRight,3,2);
  SetTestCount(5);
end;

procedure KMPMain(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if p0 = 1 then
      inc(t0);
    p0 := F_(p0);
  end;
end;

procedure KMP1Main(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if p0 = 1 then
      inc(t0);
    p0 := F1_(p0);
  end;
end;


procedure Matching24; {*}
var
  i: integer;
begin
  CreateTask(Subgroup5);
  TaskText('���� ������ {P}, {T} � �������� ������ ������� ������ ��� ������ {P}: {F}_P({i}),', 0, 1);
  TaskText('{i}\,=\,1,\,\.,\,|{P}|\,+\,1 (��.~\1). ����� ��� ��������� {P} � {T}, ��������� \I�����\i', 0, 2);
  TaskText('\I�����\:�������\:������\i (\I����� ���\i). ��� ����� ������������ ���������� {p} � {t},', 0, 3);
  TaskText('�������� ������� ������� ����� {P} � {T} ��������������, ��������������� ��', 0, 4);
  TaskText('����������~1. ���� ������� ������� |{P}|\,\-\,{p}\,\l\,|{T}|\,\-\,{t}, ��������� ���������', 0, 5);
  TaskText('��������: \(\X ���� {p}\,\l\,|{P}| � {P}[{p}]\,=\,{T}[{t}], ����������� �� 1 ���������� {p} � {t};\|', 0, 0);
  TaskText('\X ��������� {p}\,=\,|{P}|\,+\,1 ��������, ��� ���������� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(������� � ������� {t}\,\-\,|{P}|);\| \X ���� {p}\,=\,1, �� ��������� {t} �� 1;\| \X ��������', 0, 0);
  TaskText('���������� {p} ������ �������� ������ ������� ������ {F}_P({p}).\) ������� ���������', 0, 0);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 0);
  TaskText('���������� ��������� ��������, ��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ��������� � ������ ��� (�� ��������� � ������� ���������� ������)', 0, 0);
  TaskText('����������� �� ���� ����, ��� ��������� �������� {p} (���������������� ���', 0, 0);
  TaskText('\I����� ������� {P} ������\i ������������ ������ {T}) ����� ����������� �� ��������,', 0, 0);
  TaskText('�������~1. � ������, ���� ������������ �������� ������������ ��� {P}[{i}\,+\,1]', 0, 0);
  TaskText('� {T}[{t}], �� ������ {P} ����� ���������� ������ �� {i}\,\-\,{sp}_i({P}) ������� (��� ���', 0, 0);
  TaskText('����������� ������� {P}[{sp}_i({P})\,+\,1] � {T}[{t}]). ��� ���� �������������, ��� {sp}_i({P})', 0, 0);
  TaskText('��������� ������� � {P} �������� � ���������������� ��������� ������ {T},', 0, 0);
  TaskText('������� ��������� �������� ����������� ��� �������� {P}[{sp}_i({P})\,+\,1] � {T}[{t}].', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(10,18);
    m := Rand(n+1,n+18);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  MainSP_(p);
  cnt := 0;
  KMPMain(p,t);
  until nres < 20;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('�������� F_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F_(i),Center(i,n+1,2,2),5,2);
  ResultComment('���������:',0,2);

  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
  ResultN('���������� ���������: ',cnt,0,4,2);
//  Naive(p,t);
//  Str(cnt,s);
//  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching25;
var
  i: integer;
begin
  CreateTask(Subgroup5);
  TaskText('���� ������ {P}, {T} � �������� ������� ������� ������ ��� ������ {P}: {F''}_P({i}),', 0, 1);
  TaskText('{i}\,=\,1,\,\.,\,|{P}|\,+\,1 (��.~\2). ����� ��� ��������� {P} � {T}, ���������', 0, 2);
  TaskText('\I���������������� ����� �����\:�������\:������\i, ������������ �� ���������', 0, 3);
  TaskText('������ ��� (��.~\1) ���, ��� ������ ������� {F}_P � ��� ������������', 0, 4);
  TaskText('������� ������� ������ {F''}_P. ������� ��������� ������� ���� ���������', 0, 5);
  TaskText('��������� {P} � {T} (� ������� �����������), � ����� ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ��������� ����������������� ������ ��� �� ��������� � ��������', 0, 0);
  TaskText('������� � ���, ��� ��� ������ ������ {P} ������ �� {i}\,+\,{sp''}_i({P}) ������� �����', 0, 0);
  TaskText('������ ������ {P}, ����������� � ������� �������� {t} ������ {T}, ����� ��������', 0, 0);
  TaskText('\I����������\i �� �������� �������, ��� �������� ��� �������� ������������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(10,18);
    m := Rand(n+1,n+18);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  MainSP_(p);
  cnt := 0;
  KMP1Main(p,t);
  until nres < 20;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('�������� F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('���������:',0,2);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  KMPMain(p,t);
//  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ��������� ������ ���: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching26;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ����� {n} � ����� �������� {Z}_i({P}), {i}\,=\,2,\,\.,\,{n}, ��� ��������� ������ {P}', 0, 1);
  TaskText('����� {n} (��.~\17). ����� �������� {sp''}_i({P}) (��.~\4),', 0, 2);
  TaskText('��������� ����������� {sp''}_i({P})\,=\,{Z}_j({P}), ��� {j}\,>\,1 \= ���������� ������,', 0, 3);
  TaskText('����� ��� {i}\,=\,{j}\,+\,{Z}_j({P})\,\-\,1 (������ ����������� ����������� ��� ������ {i}\,>\,1),', 0, 4);
  TaskText('� ����� ����������� {sp''}_1({P})\,=\,0. ������� {j} ������������ � ����� � ����� \-1', 0, 5);
  TaskText('�� {n} �� 2, �������� ��������� �� ������������. ������� ���������', 0, 0);
  TaskText('�������� {sp''}_i({P}) ��� {i}\,=\,1,\,\.,\,{n}.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP1_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('�������� Z_i, i=2,...,n:',xRight,1);
  for i := 2 to 20 do
    DataN('',Z_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',Z_[i],Center(i-20,19,2,2),3,2);
  p := '������������� ��������� ������:  \<';
  DataComment('����������. �������� ������ '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('�������� sp''_i(P), i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',sp1_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',sp1_[i],Center(i-19,19,2,2),4,2);

  SetTestCount(5);
end;

procedure Matching27;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ����� {n} � ����� �������� {Z}_i({P}), {i}\,=\,2,\,\.,\,{n}, ��� ��������� ������ {P}', 0, 1);
  TaskText('����� {n}. ����� �������� {sp}_i({P}) (��.~\6), ��������� �������', 0, 2);
  TaskText('��� {sp''}_i({P}), ����������� � \1, � ����� ����������� {sp}_1({P})\,=\,0,', 0, 3);
  TaskText('{sp}_n({P})\,=\,{sp''}_n({P}), {sp}_i({P})\,=\,max\{{sp}_{i+1}({P})\,\-\,1, {sp''}_i({P})\}, {i}\,=\,2,\,\.,\,{n}\,\-\,1.', 0, 4);
  TaskText('������� ��������� �������� {sp}_i({P}) ��� {i}\,=\,1,\,\.,\,{n}.', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('�������� Z_i, i=2,...,n:',xRight,1);
  for i := 2 to 20 do
    DataN('',Z_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',Z_[i],Center(i-20,19,2,2),3,2);
  p := '������������� ��������� ������:  \<';
  DataComment('����������. �������� ������ '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('�������� sp_i(P), i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',sp_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',sp_[i],Center(i-19,19,2,2),4,2);
  SetTestCount(5);
end;

procedure Matching28;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P} � {T}. ��������� ���������������� ����� ��� (��.~\3),', 0, 1);
  TaskText('����� ��� ��������� {P} � {T}. ��� ���������� ������� ������� ������ {F''}_P', 0, 2);
  TaskText('������������ ������� �������� ��������� �������������� (��.~\12)', 0, 3);
  TaskText('� ������� ��� {sp''}_i, ����������� � \2. ������� ��������� �������', 0, 4);
  TaskText('���� ��������� ��������� {P} � {T} (� ������� �����������), � ����� ���������', 0, 5);
  TaskText('� ���� ��������� �������������� �������� {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, � ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������� ��������������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSP_(p);
  KMP1Main(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
{  DataComment('�������� F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);}
  ResultComment('���������:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('�������� Z_i(P), i=2,...,|P|:',0,2);
  for i:= 2 to n do
    ResultN('',Z_[i],Center(i-1,n-1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching29;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P} � {T}. ��������� ����� ��� (��.~\5), �����', 0, 1);
  TaskText('��� ��������� {P} � {T}. ��� ���������� ������ ������� ������ {F}_P ������������', 0, 2);
  TaskText('������� �������� ��������� �������������� (��.~\13) � �������', 0, 3);
  TaskText('��� {sp}_i, ����������� � \2. ������� ��������� ������� ����', 0, 4);
  TaskText('��������� ��������� {P} � {T} (� ������� �����������), � ����� ���������', 0, 5);
  TaskText('� ���� ��������� �������������� �������� {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, � ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������� ��������������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSP_(p);
  KMPMain(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
{  DataComment('�������� F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);}
  ResultComment('���������:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('�������� Z_i(P), i=2,...,|P|:',0,2);
  for i:= 2 to n do
    ResultN('',Z_[i],Center(i-1,n-1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

procedure stepSP_(s: string; k: integer);
var x: char;
    v: integer;
begin
  sp_[k+1] := 0;
  x := s[k+1];
  v := sp_[k];
  while (s[v+1]<>x) and (v>0) do
  begin
    inc(cnt);
    v := sp_[v];
  end;
  cnt := cnt + 2;  // ��������� ������ �������� �������� �������� ��� ������ �� �����
  // � ������������� ���� �������� �������� � �������� ���������
  if s[v+1]=x then
    sp_[k+1] := v+1;
end;

procedure KMP_SP_(s: string; kmax: integer);
var k: integer;
begin
  cnt := 0;
  sp_[1] := 0;
  for k := 2 to kmax do
    stepSP_(s,k-1);
end;

// ���������� ���������: ���������� ��������� �������� � �������� ���������
//� ����������� ���������, �������������� ��� ���������� ��������� ��������������!
// !!!!! ����� ��������� ��������� ��� ��������� ��� �� �������� ������:
//       ���������� ����� �� 1 ������, ��� ��� ��������� �������������� !!!!!!

procedure Matching30; {* - �������� � ��������� ����� ��������� ��������!!}
var
  i,k0: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P}, ����� {k} (<\,|{P}|) � �������� {sp}_i({P}), {i}\,=\,1,\,\.,\,{k}. ����� ��������', 0, 1);
  TaskText('{sp}_{k+1}({P}), ��������� ��������� �������� (\I������������� �� ������ ���\i).', 0, 2);
  TaskText('�������� {x}\,=\,{P}[{k}\,+\,1] � {v}\,=\,{sp}_k({P}). ���� ������ {P}[{v}\,+\,1] �� ��������� � {x} � {v}\,>\,0,', 0, 3);
  TaskText('��������� ���������������� {v}\,=\,{sp}_v({P}) (\<\I����������� �����\i\>). ���� �����', 0, 4);
  TaskText('���������� ������������ ������ ������ {P}[{v}\,+\,1] ����� {x}, �� �������� {sp}_{k+1}({P})', 0, 5);
  TaskText('�������� ������ {v}\,+\,1, � ��������� ������ {sp}_{k+1}({P})\,=\,0. ������� �������� {sp}_{k+1}({P})', 0, 0);
  TaskText('� ���������� ��������� ��������, ��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. � ��������� ���������� ��������� ����� {P''} \= ����������', 0, 0);
  TaskText('����������� ������� ��������� {P}[1..{k}], ������� ��������� � ��������� {P}[1..{k}]', 0, 0);
  TaskText('� �� ������� (� ������� |{P''}|+1) ������� ������ {x}. ������ ��� ���������', 0, 0);
  TaskText('����� ��������: ���� {x} ��������� � �������� {P}[{sp}_k({P})\,+\,1], �� {sp}_{k+1}({P})\,\g\,{sp}_k({P})\,+\,1,', 0, 0);
  TaskText('� ���������� ��������, ��� ������ {sp}_{k+1}({P})\,>\,{sp}_k({P})\,+\,1 ������� �� �����������', 0, 0);
  TaskText('(������������ �� ����������). ���������� ���������� ����������� ������', 0, 0);
  TaskText('{sp}_{k+1}({P})\,\l\,{sp}_k({P}). ��������� ��� ������, ����� ��������, ��� ������� ������ {P''}', 0, 0);
  TaskText('������������ ����� ���������� ����������� ������� {P''''} ��������� {P}[1..{sp}_k({P})],', 0, 0);
  TaskText('������� ��������� � ��������� {P}[1..{k}] � �� ������� (� ������� |{P''''}|\,+\,1)', 0, 0);
  TaskText('������� ������ {x}. ��������� ������ ����������� � ������ ������������', 0, 0);
  TaskText('���������� ����������, �������� �������� ������������ ������.', 0, 0);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(40, 50);
  k := Rand(20,38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  cnt := 0;
  stepSP_(s, k);
  until (cnt = k0+2);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataN('k = ', k, xleft, 3, 3);
  DataComment('�������� sp_i(P), i=1,...,k:',xRight,3);
  for i := 1 to 19 do
    DataN('',sp_[i],Center(i,19,2,2),4,2);
  for i := 20 to k do
    DataN('',sp_[i],Center(i-19,19,2,2),5,2);
  ResultN('sp_{k+1}(P) = ',sp_[k+1],0,2,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;


procedure Matching31;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P} � ����� {k} (\l\,|{P}|). ����� �������� {sp}_i({P}), {i}\,=\,1,\,\.,\,{k},', 0, 1);
  TaskText('��������� �������� �������������� �� ������ ���, ��������� � \1', 0, 2);
  TaskText('(� �������� ���������� ���� ��������� �������� {sp}_1({P})\,=\,0). �������', 0, 3);
  TaskText('���������� ��������, � ����� ���������� ��������� ��������,', 0, 4);
  TaskText('��������������� ��� �� ����������.', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(38, 50);
  k := rand(20, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  KMP_SP_(s,k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ',k,0,4,2);
  ResultComment('�������� {sp}_i({P}), {i}\,=\,1,\,\.,\,{k}:',0,1);

  for i := 1 to 19 do
    ResultN('',sp_[i],Center(i,19,2,2),2,2);
  for i := 20 to k do
    ResultN('',sp_[i],Center(i-19,19,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure KMP_SP1_(s: string);
// ����������� � ����� �������� (�.77-78) ������������!
//  1) ������ sp'_i := sp'_v ������� sp'_i := sp_v
//  2) �� �������� ����� �������� �� ��������� v=0 (� ���� ������
//     ����� ����������� ��������� � ��������������� sp[0])!
//  ������, ����� ������������, ���  sp_0 = 0, �� ��� ���� ����������
//  ���������� ��������� ��������!
var i,n,v: integer;
begin
  n := length(s);
  KMP_SP_(s,n);
//  sp1_[1] := sp_[1];
  for i := 1 to n do
    sp1_[i] := sp_[i];
  sp1_[n] := sp_[n];
  for i := 2 to n-1 do
  begin
    v := sp_[i];
    if v > 0 then
    begin
    inc(cnt);
    if s[i+1] <> s[v+1] then
      sp1_[i] := v
    else
      sp1_[i] := sp1_[v]
    end;
  end;
end;


procedure Matching32;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P}. ����� �������� {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (��.~\10).', 0, 1);
  TaskText('��� ����� �������������� ���������� �������� {sp}_i({P}), ��������� ��������', 0, 2);
  TaskText('�������������� �� ������ ��� (��.~\1). ��� ���������� {sp''}_i({P})', 0, 3);
  TaskText('������������ ��������� ����������� �������� (�������� {i} ������������ �� 1', 0, 4);
  TaskText('�� |{P}|): ���� {sp}_i({P})\,=\,0, ��� {i}\,=\,|{P}|, ��� ������� � �������� {i}\,+\,1 � {sp}_i({P})\,+\,1', 0, 5);
  TaskText('�� �����, �� {sp''}_i({P})\,=\,{sp}_i({P}), � ��������� ������ {sp''}_i({P})\,=\,{sp''}_v({P}),', 0, 0);
  TaskText('��� {v}\,=\,{sp}_i({P}). ������� ���������� �������� {sp''}_i({P}) � ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� �� ����������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(20, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  KMP_SP1_(s);
  ResultComment('�������� {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|:',0,1);
  for i := 1 to 19 do
    ResultN('',sp1_[i],Center(i,19,2,2),2,2);
  for i := 20 to n do
    ResultN('',sp1_[i],Center(i-19,19,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching33;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P} � {T}. ��������� ����� ��� (��.~\9), ����� ���', 0, 1);
  TaskText('��������� {P} � {T}. ��� ���������� ������ ������� ������ {F}_P ������������', 0, 2);
  TaskText('�������� �������������� �� ������ ��� (��.~\2). ������� ���������', 0, 3);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 4);
  TaskText('�������� ������ ������� ������ {F}_P({i}), {i}\,=\,1,\,\.,\,|{P}|\,+\,1, � ����������', 0, 5);
  TaskText('��������� ��������, ��������������� ��� ���������� ���������', 0, 0);
  TaskText('(� ��� ����� � ��� ���������� ��������������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  KMP_SP_(p,n);
  KMPMain(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
//  DataComment('�������� F''_P(i), i=1,...,|P|+1:',0,4);
//  for i:= 1 to n+1 do
//    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('���������:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
  for i:= 1 to n+1 do
    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching34;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('���� ������ {P} � {T}. ��������� ���������������� ����� ��� (��.~\9),', 0, 1);
  TaskText('����� ��� ��������� {P} � {T}. ��� ���������� ������� ������� ������ {F''}_P', 0, 2);
  TaskText('������������ ��������, ����������� � \2. ������� ���������', 0, 3);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 4);
  TaskText('�������� ������� ������� ������ {F''}_P({i}), {i}\,=\,1,\,\.,\,|{P}|\,+\,1, � ����������', 0, 5);
  TaskText('��������� ��������, ��������������� ��� ���������� ���������', 0, 0);
  TaskText('(� ��� ����� � ��� ���������� ��������������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  KMP_SP1_(p);
  KMP1Main(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
//  DataComment('�������� F''_P(i), i=1,...,|P|+1:',0,4);
//  for i:= 1 to n+1 do
//    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('���������:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('�������� F''_P(i), i=1,...,|P|+1:',0,2);
  for i:= 1 to n+1 do
    ResultN('',F1_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  SetTestCount(5);
end;

var spx_,spx0_: array[1..100,'a'..'g'] of integer;

// �������� ��� �������� ���������� sp_{i,x}, ����������� � �����
// (�. 53), �������� ��������, ��� ��� �� ������������ ������,
// ��� ������� s[i+1] = x. ��� ������ �������� ����� ���� ��
// ������������ �����������
//     spx_[i,s[i+1]] := max(0, sp_[i+1]-1);
// ������ ��� ���� ������������� ��������� ��������� sp_i.
// ������ ������� �������� ����.

// �� � � ���� �������� ���� ������� (��. ��������� �� ������
// � ����� ��������� ��������� �������)
(*
procedure MainSPx_(s: string; mm: integer);
var i,j,n: integer;
    x: char;
begin
  n := length(s);
  for i := 1 to n do
  for x := 'a' to chr(96+mm) do
    spx_[i,x] := -1;
  MainSP_(s);
//  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    x := s[Z_[j]+1];
    spx_[i,x] := Z_[j];
//    sp_[i] := Z_[j];
  end;
  if spx_[n,s[1]] = -1 then
    spx_[n,s[1]] := 0;
  for i := n-1 downto 1 do
    spx_[i,s[i+1]] := sp_[i+1]-1;
end;
*)

procedure MainSPx_(s: string; mm: integer);
var i,j,n: integer;
    x: char;
begin
  n := length(s);
  for i := 1 to n do
  begin
  sp_[i] := 0;
  for x := 'a' to chr(96+mm) do
    spx_[i,x] := -1;
  end;
//  MainSP_(s);
  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    x := s[Z_[j]+1];
    spx_[i,x] := Z_[j];
    sp_[i] := Z_[j];
  end;
  if spx_[n,s[1]] = -1 then
    spx_[n,s[1]] := 0;
  spx_[n-1,s[n]] := sp_[n]-1;
  for i := n-1 downto 2 do
    spx_[i-1,s[i]] := max(spx_[i,s[i+1]],sp_[i])-1;
(*  spx_[n-1,s[n]] := sp_[n]-1;
  for i := n-2 downto 1 do
  begin
    sp_[i+1] := max(sp_[i+2]-1,sp_[i+1]);
    spx_[i,s[i+1]] := sp_[i+1]-1;
  end;
*)
(*  for i := n-1 downto 1 do
  begin
    sp_[i] := max(sp_[i+1]-1,sp_[i]);
    spx_[i,s[i+1]] := sp_[i+1]-1;
  end;
*)
end;



// ����� ������� ������� ���������, ��������� sp_{i,x}
// �� ����� ��������� sp_i (��������, � �������
// �������������� �� ������ ���).

procedure KMP_SPx_(s: string; mm: integer);
var i,v,b: integer;
    x: char;
begin
  n := length(s);
  for x := 'a' to chr(96+mm) do
  begin
    inc(cnt);
    if x = s[1] then b := 0
    else b := -1;
    for i := 1 to n do
      begin
        spx_[i,x] := b;
        if sp_[i] = 0 then continue;
        v := i;
        while (v > 0) and (s[sp_[v]+1] <> x) do
        begin
          v := sp_[v];
          inc(cnt);
        end;
        if v > 0 then
        begin
          spx_[i,x] := sp_[v];
          inc(cnt);
        end;
      end;
  end;
end;

procedure Matching35;
var
  i: integer;
begin
  CreateTask(Subgroup7);
  TaskText('���� ������ {P} � ����� {k} (\l\,|{P}|). ����� {sp}_{i,x}({P}) (1\,\l\,{i}\,\l\,|{P}|, {x} \= ��������� ������)', 0, 1);
  TaskText('������������ ����� ����������� ������������ �������� ��������� {P}[1..{i}],', 0, 2);
  TaskText('������� ��������� � ��������� {P} � ��� �������� ����������� ��������������', 0, 3);
  TaskText('�������: ������ � ������� {sp}_{i,x}({P})\,+\,1 ����� {x}. ���� ��������� ��������', 0, 4);
  TaskText('�����������, �� {sp}_{i,x}({P}) ���������� ������ 0 ��� {P}[1]\,=\,{x} � \-1', 0, 5);
  TaskText('� ��������� ������. ����� � ������� {sp}_{i,x}({P}) ��� {i}\,=\,1,\,\.,\,|{P}|,', 0, 0);
  TaskText('��������� � �������� {x} ������ {P}[{k}].', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  KMP_SP_(s,n);
  cnt := 0;
  KMP_SPx_(s,mm);
  k := Rand(1,n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', k, 0, 4, 1);
  ResultComment('�������� sp_{i,\<'+s[k]+'\>}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
      ResultN('',spx_[i,s[k]],Center(i,n,2,2),3,2);
  SetTestCount(5);
end;


procedure AutomatSPx_(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if (p0 > 1) and (t0 <= m) then
      p0 := spx_[p0-1,t[t0]]+2;
    inc(t0);
  end;
end;

(*
��������, ��������� �� �. 52-53, �������� ������������!
���� sp_i,x=0 � ������ ������ P ������� �� x, ��
��� ������ �� sp_i,x+2 = 2 ����� �������� �������������
������ (��� ��� p[1]<>x), ���� �� ����� ���������
�����������, ��� � ���������� ����� �������� � ���������
������ ����������.
��� ���������� ���������� ������� �������� �������
sp_i,x, ������� � ������ sp_i,x=0 �������� ����,
��������� P[1] � x ��� ���. ���� ���, �� sp_i,x
������� �������� ������ -1, � �� 0.
*)

procedure Matching36;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ����, ��� ������ ����� {x} �� \E � ����������', 0, 2);
  TaskText('������� (\<a\>, \<b\>, \<c\>,~\.) ���� �������� {sp}_{i,x}({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 3);
  TaskText('(��.~\1). ����� ��� ��������� {P} � {T}, ��������� \I����� ���������\i', 0, 4);
  TaskText('\I�������\i, ������� ��������� ������� �� ������ ��� (��.~\12):', 0, 5);
  TaskText('\(\X �������������� �������� ��� {p}\,=\,1 �� �����������;\| \X �������� {p} ����������', 0, 0);
  TaskText('�� �� {F}_P({p}) (������ {sp}_{p\-1}({P})\,+\,1), � �� {sp}_{p\-1,x}({P})\,+\,2, ��� � �������� {x}', 0, 0);
  TaskText('����������� ������ {T}[{t}], ������ ��� �������� ����������� ������ ��� �������', 0, 0);
  TaskText('���� �������: {p}\,>\,1 � {t}\,\l\,|{T}|;\| \X � ����� ������ �������� �������� �����', 0, 0);
  TaskText('�������� {t} ������������� �� 1.\) ������� ��������� ������� ���� ���������', 0, 0);
  TaskText('��������� {P} � {T} (� ������� �����������), � ����� ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ��������� ������ ��������� ������� �� ��������� � ������� ���', 0, 0);
  TaskText('������� � ���, ��� ��� ����������� ������������ �������� {P}[{i}\,+\,1] � {T}[{t}]', 0, 0);
  TaskText('����������� ����� ������ {P} ������ �� {i}\,\-\,{sp}_{i,T[t]}({P})\,\-\,1 �������; ��� ����', 0, 0);
  TaskText('�� ��������� ��������� \I���������\i ��������� ������� ������ {P}, ������������', 0, 0);
  TaskText('� ������� ������� �������� {t} ������ {T}, � ����� ����� ����������', 0, 0);
  TaskText('� ��������� ��������� ���� ��������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  KMP_SP_(p,n);
  KMP_SPx_(p,mm);
  cnt := 0;
  nres := 0;
  AutomatSPx_(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ',mm,xLeft,4,1);
  DataComment('�������� sp_{i,x}(P), i=1,...,|P|:',xRight,4);
  for j:= 1 to mm do
  begin
    x := chr(96+j);
    DataComment('x=\<'+x+'\>}:',3,4+j);
    for i := 1 to n do
      DataN('',spx_[i,x],Center(i,n,2,1),4+j,2);
  end;
  ResultComment('���������:',0,2);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
//  cnt := 0;
//  Naive(p,t);
//  for i := 1 to nres do
//  begin
//    ResultN('',res[i],Center(i,nres,2,2),5,2);
//  end;
  cnt := 0;
//  Naive(p,t);
//  Str(cnt,s);
//  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
  KMPMain(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������ ��� (��� ��������������): '+s,0,5);

  SetTestCount(5);
end;



procedure Naive_SPx_(s: string; mm: integer);
var x: char;
    i,j,k: integer;
    b: boolean;
begin
  cnt := 0;
  n := length(s);
  for x := 'a' to chr(96+mm) do
  begin
    for i := 1 to n do
    begin
      spx_[i,x] := -1;
      for j := i-1 downto 0 do
      begin
        b := true;
        for k := 1 to j do
        begin
          inc(cnt);
          if s[k] <> s[k-j+i] then
          begin
            b := false;
            break;
          end;
        end;
        if not b then continue;
        inc(cnt);
        if s[j+1]=x then
        begin
          spx_[i,x] := j;
          break;
        end;
      end;
    end;
  end;
end;

(*
procedure myKMP_SPx_(s: string);
var i,v: integer;
    x: char;
begin
  n := length(s);
  KMP_SP_(s,n);
  for x := 'a' to 'g' do
  begin
    for i := 1 to n do
      spx_[i,x] := 0;
    for i := 2 to n do
      begin
        v := i;
        while (v > 0) do
        begin
{        if (v<n) and (s[v+1]=x) then
        begin
          spx_[i,x] := max(0, sp_[v+1]-1);
          break;
        end;}
        if s[sp_[v]+1] = x then
          begin
            spx_[i,x] := sp_[v];
            break;
          end;
        v := sp_[v];
        end;
      end;
  end;
end;
*)
(*
procedure Matching37;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('���� ������ {P} � ����� �������� {sp}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (��.~\16).', 0, 1);
  TaskText('����� ����, ���� ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 2);
  TaskText('�������� ��������� ����. ����� �������� {sp}_{i,x}({P}) (��.~\2),', 0, 3);
  TaskText('��������� ��������� \I�������� ������������ ������\i �� ��������� {sp}_i .', 0, 4);
  TaskText('�� ������� ����� ������������ ��� ������� {x} �� \E. ��� ������� {x} ������������', 0, 5);
  TaskText('��������������� �������� {b}, ������ 0, ���� {P}[1]\,=\,{x}, � ������ \-1 � ���������', 0, 0);
  TaskText('������. �������� {sp}_{1,x}({P}) ���������� ������ {b}. ������ ����������� ��������', 0, 0);
  TaskText('{sp}_{i,x}({P}), {i}\,=\,2,\,\.,\,|{P}|, ��������� ��������� �������. ���� {sp}_i({P})\,=\,0,', 0, 0);
  TaskText('�� {sp}_{i,x}({P})\,=\,{b}, ����� �������� ���������� {v}, ������� ���������� ������ {i}.', 0, 0);
  TaskText('���� ������ {P}[{sp}_v({P})+1] ��������� � {x}, �� {sp}_{i,x}({P})\,=\,{sp}_v({P}). � ��������� ������,', 0, 0);
  TaskText('���� {v}\,>\,0, �� ���������� {v} ���������� ������ {sp}_v({P}) � ����������� ��������,', 0, 0);
  TaskText('��������� � ���������� �����������. ���� {v}\,=\,0, �� {sp}_{i,x}({P})\,=\,{b}. �������', 0, 0);
  TaskText('��������� �������� {sp}_{i,x}({P}), ��������� {x} �� \E � ���������� �������', 0, 0);
  TaskText('� ��� ������� {x} ������� {i} �� 1 �� |{P}|. ������� ����� ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� ���������� ���������.', 0, 0);

  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  KMP_SP_(s,n);
  cnt := 0;
  KMP_SPx_(s,mm);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataComment('�������� sp_i(P), i=1,...,|P|:',0,3);
  for i := 1 to n do
    DataN('',sp_[i],Center(i,n,2,1),4,2);
  DataN('m = ', mm, 0, 5, 1);
//  ResultComment('�������� sp_{i,x}(P), i=1,...,|P|:',0,1);
  j := 0;
  case mm of
  1: j := 2;
  2,3: j := 1;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('sp_{i,\<'+x+'\>}:',3,k+j);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+j,2);
  end;
  ResultN('���������� ���������: ',cnt,0,mm+1+j,3);
  cnt := 0;
//  Naive_SPX_(s,mm);
  spx0_ := spx_;
  MainSPx_(s,mm);
  Str(cnt,s);
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('x = \<'+x+'\>:',3,k+5);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+5,2);
  end;
  ResultComment(''+s,65,mm+1+j);
  cnt := 0;
  for i := 1 to 100 do
    for k := 1 to mm do
      if spx0_[i,chr(96+k)] <> spx_[i,chr(96+k)] then
        inc(cnt);
  if cnt > 0 then
  ResultN('',cnt,90,1,1);


  SetTestCount(5);
end;
*)

procedure Matching37;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('���� ������ {P} � ����� �������� {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}| (��.~\28).', 0, 1);
  TaskText('����� ����, ���� ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 2);
  TaskText('�������� ��������� ����. ����� �������� {sp}_{i,x}({P}) (��.~\2),', 0, 3);
  TaskText('������������� ������� �������� ���������� {sp''}_i({P}), ��������� � \11:', 0, 4);
  TaskText('\(\X ������� ��� �������� {sp}_{i,x}({P}) ���������� ������� \-1, � ��� �������� {sp''}_i({P})', 0, 5);
  TaskText('������� 0;\| \X � ����� �� {j} �� |{P}| �� 2 � ����� \-1 �������� {sp}_{i,x}({P}) � {sp''}_i({P})', 0, 0);
  TaskText('���������� ������� {Z}_j({P}), ��� {i}\,=\,{j}\,+\,{Z}_j({P})\,\-\,1, {x}\,=\,{P}[{Z}_j({P})\,+\,1];\|', 0, 0);
  TaskText('\X ���� ����� ���������� ����� �������� {sp}_{|P|,P[1]}({P}) �������� ������ \-1,', 0, 0);
  TaskText('�� ��� ���������� �� 0;\| \X �������� {sp}_{i,x}({P}) � ������ {x}\,=\,{P}[{i}\,+\,1] ������������', 0, 0);
  TaskText('�� ��������: {sp}_{n\-1,P[n]}({P})\,=\,{sp''}_n({P})\,\-\,1, ��� {n}\,=\,|{P}|;', 0, 0);
  TaskText('{sp}_{i\-1,P[i]}({P})\,=\,max\{{sp}_{i,P[i+1]}({P}), {sp''}_i({P})\}\,\-\,1, ��� {i} ���������� �� |{P}|\,\-\,1 �� 2', 0, 0);
  TaskText('� ����� \-1.\) ������� ��������� �������� {sp}_{i,x}({P}), ��������� {x} �� \E', 0, 0);
  TaskText('� ���������� ������� � ��� ������� {x} ������� {i} �� 1 �� |{P}|.', 0, 0);
  TaskText('\P\S����������\s. � ������ ����� ���������� ��������� ������������ �������� {sp}_{i,x}({P})', 0, 0);
  TaskText('� ������ {x}\,\n\,{P}[{i}\,+\,1]. ������������ ������� ��� {sp}_{i,x}({P}) � ������ {x}\,=\,{P}[{i}\,+\,1]', 0, 0);
  TaskText('����� �������� �� ����������� {sp}_{i\-1,P[i]}({P})\,=\,{sp}_i({P})\,\-\,1, {i}\,=\,2,\,\.,\,|{P}|,', 0, 0);
  TaskText('� ������ ��������� ���������� {sp}_i, ������������ � \10.', 0, 0);



  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  cnt := 0;
  MainSPx_(s,mm);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataComment('�������� Z_i(P), i=2,...,|P|:',0,3);
  for i := 2 to n do
    DataN('',Z_[i],Center(i-1,n-1,2,1),4,2);
  DataN('m = ', mm, 0, 5, 1);
//  ResultComment('�������� sp_{i,x}(P), i=1,...,|P|:',0,1);
  j := 0;
  case mm of
  1,2: j := 2;
  3,4: j := 1;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('sp_{i,\<'+x+'\>}:',3,k+j);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+j,2);
  end;
(*  ResultN('���������� ���������: ',cnt,0,mm+1+j,3);
  cnt := 0;
  spx0_ := spx_;
  Naive_SPX_(s,mm);
  Str(cnt,s);
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('x = \<'+x+'\>:',3,k+5);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+5,2);
  end;
  ResultComment(''+s,65,mm+1+j);
  cnt := 0;
  for i := 1 to 100 do
    for k := 1 to mm do
      if spx0_[i,chr(96+k)] <> spx_[i,chr(96+k)] then
        inc(cnt);
  if cnt > 0 then
  ResultN('',cnt,90,1,1);
*)

  SetTestCount(5);
end;


procedure Matching38;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ��������� ����� ��������� ������� (��.~\2),', 0, 2);
  TaskText('����� ��� ��������� {P} � {T}. ��� ���������� {sp}_{i,x}({P}) ������������ �������', 0, 3);
  TaskText('�������� ��������� �������������� (��.~\22) � ��������, ���������', 0, 4);
  TaskText('� \1. ������� ��������� ������� ���� ��������� ��������� {P} � {T}', 0, 5);
  TaskText('(� ������� �����������), � ����� �������� {sp}_{i,x}({P}), {i}\,=\,1,\,\.,\,|{P}|, {x}\,=\,\<a\>,', 0, 0);
  TaskText('� ���������� ��������� ��������, ��������������� ��� ���������� ���������', 0, 0);
  TaskText('(� ��� ����� � ��� ���������� ��������� ��������������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSPx_(p,mm);
  nres := 0;
  AutomatSPx_(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);

  ResultComment('���������:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('�������� sp_{i,\<a\>}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
    ResultN('',spx_[i,'a'],Center(i,n,2,1),3,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
*)
//  KMPMain(p,t);
//  Str(cnt,s);
//  ResultComment(' ����������. ���������� ��������� ��� ������ ��� (��� ��������������): '+s,0,5);
  SetTestCount(5);
end;

var R_: array ['a'..'z'] of integer;
    Ri_: array ['a'..'z',1..100] of integer;

procedure CalcR_(s: string; m: integer);
var i: integer;
    x: char;
begin
  for x := 'a' to chr(96+m) do
    R_[x] := 0;
  for i := 1 to length(s) do
    R_[s[i]] := i;
end;

procedure CalcRi_(s: string; m: integer);
var i,j: integer;
    x: char;
begin
  for x := 'a' to chr(96+m) do
    for i := 1 to length(s) do
      Ri_[x,i] := 0;
  for i := 1 to length(s) do
    for j := i+1 to length(s) do
      Ri_[s[i],j] := i;
end;

procedure Matching39;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� {R}_x({P}) ������������ ������� �������� �������', 0, 2);
  TaskText('��������� ������� {x} � ������ {P} (���� {x} �� ������ � {P}, �� {R}_x({P})\,=\,0).', 0, 3);
  TaskText('�������� ����������� �������� �������� ������ {P} � �� ���������', 0, 4);
  TaskText('�������� ���������, ����� {R}_x({P}) ��� {x} �� \E � ������� ���������', 0, 5);
  TaskText('��������, ��������� {x} � ���������� �������.', 0, 0);
(*  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
*)
  mm := Rand(1,9);
  n := rand(40, 70);
  s := CreateString(mm, n);
  CalcR_(s,mm);
  DataS('P = ',s,0,2);
  DataComment(Rule(4,length(s)),0,3);
  DataN('m = ',mm,0,4,1);
  ResultComment('x:',3,2);
  ResultComment('R_{x}:',3,3);
  for j := 1 to mm do
  begin
    x := chr(96+j);
    ResultComment(x,Center(j,mm,2,1)+1,2);
    ResultN('',R_[x],Center(j,mm,2,1),3,2);
  end;
  SetTestCount(5);
end;

procedure Matching40;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� {R}_{x,i}({P}), {i}\,=\,1,\,\.,\,|{P}|, ������������ �������', 0, 2);
  TaskText('���������� ��������� ������� {x} � ������ {P} ����� �� ������� {i} (��� 0, ����', 0, 3);
  TaskText('��������� ��������� �����������). ����������� �������� �������� {R}_{x,i}({P})', 0, 4);
  TaskText('� ��������� ������� � �� ��������� �������� ���������, ����� {R}_{x,i}({P})', 0, 5);
  TaskText('��� {x} �� \E � ������� ��������� ��������, ��������� {x} � ���������� �������', 0, 0);
  TaskText('� ��� ������� {x} ������� {i} �� 1 �� |{P}|.', 0, 0);
  i := Random(7);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(10, 20);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 2 to Random(5) do
      s[i] := s[1];
  s := Copy(s,1,n);
  for i := 1 to 2 do
    Ins(s, Copy(s,1,Rand(2,5)), Rand(5,10));
  CalcRi_(s,mm);
  DataS('P = ',s,0,2);
  DataComment(Rule(4,length(s)),0,3);
  DataN('m = ',mm,0,4,1);
  j := 0;
  case mm of
  1,2: j := 2;
  3,4: j := 1;
  end;
  if mm < 5 then
  begin
    ResultComment('i:',3,j);
    for i := 1 to n do
    begin
      Str(i:2,p);
      ResultComment(p,Center(i,n,2,1),j);
    end;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('R_{\<'+x+'\>,i}:',3,k+j);
    for i := 1 to n do
      ResultN('',Ri_[x,i],Center(i,n,2,1),k+j,2);
  end;
  SetTestCount(5);
end;

procedure BadChar(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      inc(k);
    end
    else
    begin
      inc(cnt);
      k := k + max(1, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BadChar1(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      inc(k);
    end
    else
    begin
      inc(cnt);
      k := k + max(1, p0-Ri_[t[t0],p0]);
    end;
  end;
end;


procedure Matching41;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ��������� �������� {R}_x({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\2) � ����� ��� ��������� {P} � {T}, ��������� ������������', 0, 3);
  TaskText('��������� ����� ������ ������, � ����� \I������� ������ �� ������� �������\i.', 0, 4);
  TaskText('��� ����� ������������ ���������� {k}, ��������������� �� ��������� |{P}|,', 0, 5);
  TaskText('� ���������� {p} � {t}, �������� ������� ������� ����� {P} � {T} ��������������.', 0, 0);
  TaskText('���� ����������� ������� {k}\,\l\,|{T}|, ��������� ��������� ��������:', 0, 0);
  TaskText('\(\X �������� {p} ������ |{P}|, � {t} ������ {k};\| \X ���� {p}\,>\,0 � {P}[{p}]\,=\,{T}[{t}], ���������', 0, 0);
  TaskText('�� 1 ���������� {p} � {t};\| \X ��������� {p}\,=\,0 ��������, ��� ���������� ���������', 0, 0);
  TaskText('��������� {P} � {T} (������� � ������� {t}\,+\,1), � ���� ������ ��������� {k} �� 1;', 0, 0);
  TaskText('� ��������� ������ ��������� {k} �� max\{1, {p}\,\-\,{R}_x({P})\}, ��� � �������� {x}', 0, 0);
  TaskText('����������� {T}[{t}].\) ������� ��������� ������� ���� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(� ������� �����������), � ����� �������� {R}_x({P}) ��� {x} �� \E (��������� {x}', 0, 0);
  TaskText('� ���������� �������) � ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ��������� � ������, ������������ ������� ������ �� �������', 0, 0);
  TaskText('������� (�� ��������� � ������� ���������� ������) ����������� �� ���� ����,', 0, 0);
  TaskText('��� ��������� �������� {k} (���������������� ��� \I����� ������� {P} ������\i', 0, 0);
  TaskText('������������ ������ {T}) ����� ����������� �� ��������, \I�������\i 1. � ������,', 0, 0);
  TaskText('���� ������� ������ ��������� � {P} ������� {T}[{t}] �������� ������� {j},', 0, 0);
  TaskText('������������� ����� �� ������� ������� {P}, �� ������ {P} ���������� ������', 0, 0);
  TaskText('����� �������, ����� ������ {P}[{j}] ����������� � {T}[{t}]. �������� ����������', 0, 0);
  TaskText('����� ����� � ������, ���� {T}[{t}] �� ������ � ������-������� {P} (� ���� ������', 0, 0);
  TaskText('{j}\,=\,0, � ��������� ������� ������ {P} ����� ����������� � �������� {t}\,+\,1 ������ {T}).', 0, 0);
  i := Random(11);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcR_(p,mm);
  cnt := 0;
  BadChar(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);
  ResultComment('���������:',4,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  ResultComment('�������� R_x(P), x=\<a\>,\<b\>,...,\<'+chr(96+mm)+'\>:',0,2);
  for i := 1 to mm do
    ResultN('',R_[chr(96+i)],Center(i,mm,2,2),3,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
*)
  SetTestCount(5);
end;

procedure Matching42;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ��������� �������� {R}_{x,i}({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\2) � ����� ��� ��������� {P} � {T}, ��������� ������������', 0, 3);
  TaskText('��������� ����� ������ ������ � \I����������� ������� ������ �� ������� �������\i.', 0, 4);
  TaskText('������ ������� ���������� �� �������� ������� ������ �� ������� �������', 0, 5);
  TaskText('(��.~\1) ���, ��� ��� ���������� ���������� {k} ������ ���������', 0, 0);
  TaskText('{p}\,\-\,{R}_{T[t]}({P}) ������������ ��������� {p}\,\-\,{R}_{T[t],p}({P}). ������� ���������', 0, 0);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 0);
  TaskText('�������� {R}_{x,i}({P}), {x}\,=\,\<a\>, {i}\,=\,1,\,\.,\,|{P}|, � ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ����������� ������� ������� ������� ����� ����������', 0, 0);
  TaskText('(�� ��������� � ������� ��������) ��� ��������� �����, ���������� �������', 0, 0);
  TaskText('���������� \I�������������\i ��������.', 0, 0);
  i := Random(11);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcRi_(p,mm);
  cnt := 0;
  BadChar1(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ',mm,xleft,4,1);
  ResultComment('���������:',4,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  ResultComment('�������� R_{\<a\>,i}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
    ResultN('',Ri_['a',i],Center(i,n,2,2),3,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  CalcR_(p,mm);
  cnt := 0;
  BadChar(p,t);
//  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� �������� ������� ������� �������: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),2,2);
  end;
*)
  SetTestCount(5);
end;

var N_,L_,L1_,S_: array [1..100] of integer;

procedure NaiveN_(s: string);
var
    k,i,n: integer;
begin
  n := length(s);
  for i := 1 to n-1 do
  begin
    N_[i] := 0;
    for k := 1 to i do
      if Copy(s, i-k+1,k) = Copy(s,n-k+1,k) then
        N_[i] := k;
  end;
end;


procedure MainN_(s: string);
var s1: string;
    i,n: integer;
begin
  s1 := '';
  n := length(s);
  for i := 1 to n do
    s1 := s[i] + s1;
  MainZ_(s1);
  for i := 1 to n-1 do
    N_[i] := Z_[n-i+1];
end;

procedure NaiveL_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  for i := 1 to n do
  begin
    L_[i] := 0;
    s1 := Copy(s,i,100);
    n1 := length(s1);
    for j := 1 to n-1 do
      if copy(s,j,n1) = s1 then
        if j+n1-1 < n then
          L_[i] := j+n1-1;
  end;
end;

procedure NaiveL1_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  L1_[1] := 0;
  for i := 2 to n do
  begin
    L1_[i] := 0;
    s1 := Copy(s,i,100);
    n1 := length(s1);
    for j := 1 to n-1 do
      if copy(s,j,n1) = s1 then
        if (j+n1-1 < n) and ((j=1) or (s[j-1]<>s[i-1])) then
          L1_[i] := j+n1-1;
  end;
end;


procedure MainL1_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    L1_[i] := 0;
  MainN_(s);
  for j := 1 to n-1 do
  begin
    i := n - N_[j] +1;
    L1_[i] := j;
  end;
end;

procedure MainL_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  MainL1_(s);
  L_[1] := L1_[1];
  L_[2] := L1_[2];
  for i := 3 to n do
    L_[i] := max(L_[i-1], L1_[i]);
end;


procedure NaiveS_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  for i := 1 to n do
  begin
    S_[i] := 0;
    for j := 1 to n-i+1 do
      if (copy(s,1,j) = copy(s,n-j+1,j)) and (j < n) then
        S_[i] := j;
  end;
end;


procedure MainS_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    S_[i] := 0;
  MainN_(s);
  for j := 1 to n-1 do
    if N_[j] = j then
    begin
      i := n - j + 1;
      S_[i] := j;
    end;
  for i := n-1 downto 1 do
    S_[i] := max(S_[i],S_[i+1]);
end;


function InvStr(s: string): string;
var i: integer;
begin
  result := '';
  for i := 1 to length(s) do
    result := s[i] + result;
end;

procedure Matching43;
var
  i,j,k0,sum: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � ����� {i} (\l\,|{P}|). ����� {L}_i({P}) ������������ ���������� �������', 0, 1);
  TaskText('� {P}, ������� |{P}| � �����, ��� ��������� {P}[{i}..|{P}|] ��������� � ���������', 0, 2);
  TaskText('������ {P}[1..{L}_i({P})]. ���� ����� ������� ���, �� {L}_i({P})\,=\,0. ����� ������,', 0, 3);
  TaskText('{L}_i({P}) ���������� ������� ������� ����� ������� ������ ����� ������', 0, 4);
  TaskText('{P}[{i}..|{P}|], ������� �� �������� ��������� {P}. ����� � ������� {L}_i({P}).', 0, 5);
  k0 := Random(6);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(5) do
      s := s[1] + s;
  s := Copy(s,1,n);
  sum := 0;
  for i := 1 to n do
    if s[i]=s[1] then
      Inc(sum);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := InvStr(s);
  MainL_(s);
  k := Rand(1,n-1);
  until (k0 = 0) and (sum = n) or (k0=1) and (L_[k]=0) or (k0>1) and (sum <> n) and (L_[k]>0);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('L_{i}(P) = ',L_[k],0,3,2);
  SetTestCount(5);
end;

procedure Matching44;
var
  i,k0: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � ����� {k} (\l\,|{P}|). ����� {L''}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, ������������', 0, 1);
  TaskText('���������� ������� � {P}, ������� |{P}| � �����, ��� ��������� {P}[i..|{P}|] ���������', 0, 2);
  TaskText('� ��������� ������ {P}[1..{L''}_i({P})], ������ ������, �������������� ����� ��������,', 0, 3);
  TaskText('���� �����������, ���� �� ����� {P}[{i}\,\-\,1]. ���� ����� ������� ���, �� {L''}_i({P})\,=\,0.', 0, 4);
  TaskText('� ������ {i}\,=\,1 �� �����������  ���������� {L''}_1({P})\,=\,0. ����� �������,', 0, 5);
  TaskText('{L''}_i({P})\,\l\,{L}_i({P}) (��.~\1). ����� � ������� {L''}_i({P}) ��� {i}\,=\,1,\,\.,\,|{P}|.', 0, 0);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := InvStr(s);
  MainL_(s);
  k := rand(2,19);
  k0 := 0;
  for i := n-k+1 to n do
    if L_[i] = L1_[i] then
      inc(k0);
  until k0<k;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', n-k+1, 0, 4, 1);
  ResultComment('�������� L''_{i}(P), i=k,...,|P|:',0,2);
  for i := n-k+1 to n do
    ResultN('',L1_[i],Center(i-n+k,k,2,2),3,2);
  ResultComment('����������. ��� ��������� ���� ��������� �������� L_{i}(P), i=k,...,|P|:',0,4);
  for i := n-k+1 to n do
  begin
    str(L_[i]:2,s);
    ResultComment(s,Center(i-n+k,k,2,2),5);
  end;
  SetTestCount(5);
end;

procedure Matching45;
var
  i,sum,sum1,k0: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P}. ����� {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, ������������ ����� �����������', 0, 2);
  TaskText('�������� ��������� {P}[{i}..|{P}|], ������� �������� ����������� ��������� {P}.', 0, 3);
  TaskText('���� ����� ��������� �� ����������, �� {s}_i({P})\,=\,0.', 0, 4);
  TaskText('����� � ������� {s}_i({P}) ��� {i}\,=\,1,\,\.,\,|{P}|.', 0, 5);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  sum := 0;
  for i := 1 to n do
    if s[i]=s[1] then
      inc(sum);
  MainS_(s);
  sum1 := 0;
  for i := 1 to n do
    if s_[i]<=1 then
      inc(sum1);
  until (k0 = 0) and (sum=n) or (k0 = 1) and (sum1=n) or
        (k0>1) and (sum<n) and (sum1<n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  ResultComment('�������� s_i, i=1,...,|P|:',0,2);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),4,2);
(*  NaiveS_(s);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure GoodSuffix(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        inc(k)
      else
        if L_[p0+1] > 0 then
          k := k + n-L_[p0+1]
        else
          k := k + n-S_[p0+1];
    end;
  end;
end;

procedure GoodSuffix1(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        inc(k)
      else
        if L1_[p0+1] > 0 then
          k := k + n-L1_[p0+1]
        else
          k := k + n-S_[p0+1];
    end;
  end;
end;




procedure Matching46;
var
  i: integer;

begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � {T}, � ����� �������� {L}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 1);
  TaskText('(��.~\3 �~\1). ����� ��� ��������� {P} � {T}, ���������', 0, 2);
  TaskText('������������ ��������� ������ ������ � \I������ ������� ������ �� ��������\i', 0, 3);
  TaskText('\I��������\i. ��� ����� ������������ ����� ���������, ������������ ������� ������', 0, 4);
  TaskText('�� ������� ������� (��.~\5), ������� ��� �������������� ��������', 0, 5);
  TaskText('��������� �������: \(\X ���� {p}\,=\,0, �.\,�. ���������� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(������� � ������� {t}\,+\,1), �� ��������� {k} �� |{P}|\,\-\,{s}_2({P}); � ��������� ������,', 0, 0);
  TaskText('���� {p}\,=\,|{P}|, �� ��������� {k} �� 1, � ���� {p}\,<\,|{P}|, �� � ������ {L}_{p+1}({P})\,>\,0', 0, 0);
  TaskText('��������� {k} �� |{P}|\,\-\,{L}_{p+1}({P}), � � ������ {L}_{p+1}({P})\,=\,0 ��������� {k} ��', 0, 0);
  TaskText('|{P}|\,\-\,{s}_{p+1}({P}).\) ������� ��������� ������� ���� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(� ������� �����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. �������� ��������� �������� ������� ������� ������ �� ��������', 0, 0);
  TaskText('��������: ���� ���������� ��������� {T''} �� {T}, ����������� � ��������� {P}', 0, 0);
  TaskText('� �����, ��� ������� ����� �� ���� �������� �� ���������, �� � {P} ������', 0, 0);
  TaskText('������� ������ ��������� {P''}, ����������� � {T''} � �� ���������� ��������� {P},', 0, 0);
  TaskText('����� ���� {P} ���������� ������ ���, ����� ��������� {P''} ������ {P} ������������', 0, 0);
  TaskText('� ���������� {T''} ������ {T}. ���� ��������� ��������� {P''} �����������', 0, 0);
  TaskText('(�������� {L}_{p+1}({P})\,=\,0), �� ����������� \I����������\i ����� {P} ������, ��� �������', 0, 0);
  TaskText('������� ��������� ������ {P} �������� � ��������� ��������� ��������� {T''} � {T}', 0, 0);
  TaskText('(���� ������ ������ �� ����������, �� {P} ���������� �� |{P}| ������� ������).', 0, 0);
  TaskText('��� ����������� ��������� {P} ����������� \I����������\i ����� ������, ��� �������', 0, 0);
  TaskText('����������� ������� ��������� ������ {P} �������� � ��������� ���������', 0, 0);
  TaskText('���������� ��������� {P} � {T} (���� ������ ������ �� ����������,', 0, 0);
  TaskText('�� {P} ���������� �� |{P}| ������� ������).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  GoodSuffix(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('L_i(P):',3,4);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),4,2);
  DataComment('s_i(P):',3,5);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),5,2);
  ResultComment('���������:',0,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  res0 := res;
  nres0 := nres;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
*)
  SetTestCount(5);
end;



procedure Matching47;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � {T}, � ����� �������� {L''}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 1);
  TaskText('(��.~\3 �~\2). ����� ��� ��������� {P} � {T}, ���������', 0, 2);
  TaskText('������������ ��������� ������ ������ � \I������� ������� ������ �� ��������\i', 0, 3);
  TaskText('\I��������\i, ������������ �� ������� ������� (��.~\1) ���, ���', 0, 4);
  TaskText('��� ���������� ���������� {k} ������ �������� {L}_{p+1}({P}) ������������ ��������', 0, 5);
  TaskText('{L''}_{p+1}({P}). ������� ��������� ������� ���� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(� ������� �����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  TaskText('\P\S����������\s. ������� ������� ������ �� �������� �������� ����������', 0, 0);
  TaskText('�� ������� ���, ��� ���� ���������� ��������� {T''} �� {T}, �����������', 0, 0);
  TaskText('� ��������� {P}, � �����, ��� ������� ����� �� ���� �������� �� ���������,', 0, 0);
  TaskText('�� � {P} ������ ������� ������ ��������� {P''}, �� ������ ����������� � {T''},', 0, 0);
  TaskText('�� � ���������� �������������� ���������: ������ ����� �� {P''}', 0, 0);
  TaskText('\I�� �����\i ������� ����� �� �������� ������ {P}, ������� {T''}.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  GoodSuffix1(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('L''_i(P):',3,4);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),4,2);
  DataComment('s_i(P):',3,5);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),5,2);
  ResultComment('���������:',0,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������� ������� �������� ��������: '+s,3,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
*)


  SetTestCount(5);
end;


procedure Matching48;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P} � ����� {i} (<\,|{P}|). ����� {N}_i({P}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1, ������������', 0, 2);
  TaskText('����� ����������� �������� ������ {P}[1..{i}], ������� ����� �������� ���������', 0, 3);
  TaskText('������ ������ {P}. ���� ������ �������� ���, �� {N}_i({P})\,=\,0. ����� � ������� {N}_i({P}).', 0, 4);
  k := Random(9);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(40, 70);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 5 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  MainN_(s);
  i := Rand(1,n-1);
  until (k=0) and (N_[i]=0) or (k=1) and (mm=1) or (k>=2) and (mm>1) and (N_[i]>=k-1);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ',i,0,4,1);
  ResultN('N_i(P) = ',N_[i],0,3,2);
  SetTestCount(5);
end;


procedure Matching49;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ������ {P}. ����������� ��������� �������� ���������� �������� {N}_i({P})', 0, 1);
  TaskText('(��.~\1): \(\X ������������� ������ {P}, ������� � ���������� ������ {P''};\|', 0, 2);
  TaskText('\X ��������� ������� �������� ��������� �������������� ��� ������ {P''}', 0, 3);
  TaskText('(��.~\33), ����� �������� {Z}_j({P''}), {j}\,=\,2,\,\.,\,|{P}|;\| \X ��������', 0, 4);
  TaskText('�������� {N}_i({P}) ������ {Z}_{|P|\-i+1}({P''}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1.\) ������� ���������', 0, 5);
  TaskText('�������� {N}_i({P}) ��� {i}\,=\,1,\,\.,\,|{P}|\,\-\,1. ������� ����� ���������� ���������', 0, 0);
  TaskText('��������, ��������������� ��� ���������� ��������� ��������������.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  cnt := 0;
  MainN_(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  ResultComment('�������� N_i(P), i=1,...,|P|\-1:',0,2);
  for i := 1 to n-1 do
      ResultN('',N_[i],Center(i,n-1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  SetTestCount(5);
end;



procedure Matching50;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ����� {n} � ����� �������� {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, ��� ���������', 0, 1);
  TaskText('������ {P} ����� {n} (��.~\2). ����� �������� {L''}_i({P}) ��� {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(��.~\6), ��������� ����������� {L''}_i({P})\,=\,{j}, ��� {j}\,<\,{n} \= ����������', 0, 3);
  TaskText('������, ����� ��� {i}\,=\,{n}\,\-\,{N}_j({P})\,+\,1 (���� ��������� ������� {j} �����������,', 0, 4);
  TaskText('�� {L''}_i({P})\,=\,0). ������� {j} ������������ � ����� �� 1 �� {n}\,\-\,1 � ����� 1,', 0, 5);
  TaskText('�������� ��������� �� ������������. ������� ��������� �������� {L''}_i({P}).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainL1_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('�������� N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := '������������� ��������� ������:  \<';
  DataComment('����������. �������� ������ '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('�������� L''_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',L1_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',L1_[i],Center(i-19,19,2,2),4,2);
(*
  NaiveL1_(s);
  for i := 1 to 19 do
    ResultN('',L1_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',L1_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure Matching51;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ����� {n} � ����� �������� {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, ��� ���������', 0, 1);
  TaskText('������ {P} ����� {n} (��.~\3). ����� �������� {L}_i({P}) ��� {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(��.~\8), ��������� ������� ��� {L''}_i({P}), �����������', 0, 3);
  TaskText('� \1, � ����� ����������� {L}_1({P})\,=\,0, {L}_i({P})\,=\,max\{{L}_{i\-1}({P}), {L''}_i({P})\},', 0, 4);
  TaskText('{i}\,=\,2,\,\.,\,{n}. ������� ��������� �������� {L}_i({P}).', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainL_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('�������� N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := '������������� ��������� ������:  \<';
  DataComment('����������. �������� ������ '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('�������� L_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',L_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',L_[i],Center(i-19,19,2,2),4,2);
(*  NaiveL_(s);
  for i := 1 to 19 do
    ResultN('',L_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',L_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure Matching52;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('���� ����� {n} � ����� �������� {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, ��� ���������', 0, 1);
  TaskText('������ {P} ����� {n} (��.~\4). ����� �������� {s}_i({P}) ��� {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(��.~\7), ��������� ����������� {s}_i({P})\,=\,{j}, ��� {j}\,\l\,{n}\,\-\,i\,+\,1 \= ����������', 0, 3);
  TaskText('������, ����� ��� {N}_j({P})\,=\,{j} (���� ��������� ������� {j} �����������,', 0, 4);
  TaskText('�� {s}_i({P})\,=\,0). �������� �� ������ ��������� ��������� ������', 0, 5);
  TaskText('(��. � \1). ������� ��������� �������� {s}_i({P}).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainS_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('�������� N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := '������������� ��������� ������:  \<';
  DataComment('����������. �������� ������ '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('�������� s_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),4,2);
(*  NaiveS_(s);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;


procedure BM_R_L_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L_[p0+1] > 0 then
          s := n-L_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BM_R_L1_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L1_[p0+1] > 0 then
          s := n-L1_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BM_Ri_L_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L_[p0+1] > 0 then
          s := n-L_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-Ri_[t[t0],p0]);
    end;
  end;
end;

procedure BM_Ri_L1_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L1_[p0+1] > 0 then
          s := n-L1_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-Ri_[t[t0],p0]);
    end;
  end;
end;



procedure Matching53;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ���� �������� {R}_x({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\14, ������� {x} ������������ � ���������� �������)', 0, 3);
  TaskText('� �������� {L}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (��.~\10 � \8).', 0, 4);
  TaskText('����� ��� ��������� {P} � {T}, ��������� ������� \I������ ������\:����\i, ���������', 0, 5);
  TaskText('����������� ������� ������ �� ������� ������� (��.~\12) � ������', 0, 0);
  TaskText('������� ������ �� �������� �������� (��.~\7). ��� ����� ������������', 0, 0);
  TaskText('����� ���������, ������������ ������ ������� ������ �� �������� ��������,', 0, 0);
  TaskText('�������� ��� �������������� �������� ��������� �������: \(\X ���� {p}\,>\,0,', 0, 0);
  TaskText('�.\,�. ��������� {P} � {T} �� ����������, �� ��������� {k} �� max\{{s}, {p}\,\-\,{R}_{T[t]}({P})\},', 0, 0);
  TaskText('��� {s} \= �������� ������, ����������� �� ������� ������� �������� ��������.\)', 0, 0);
  TaskText('������� ��������� ������� ���� ��������� ��������� {P} � {T} (� �������', 0, 0);
  TaskText('�����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  BM_R_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, xLeft, 4, 1);
  DataComment('R_x(P):',40,4);
  for i := 1 to mm do
    DataN('',R_[chr(96+i)],Center(i,mm,2,1)+20,4,2);
  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);
  ResultComment('���������:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ���������� ������� ������� �������: '+s,0,4);
  cnt := 0;
  BadChar(p,t);
  Str(cnt,s);
  ResultComment('   ���������� ��������� ��� ���������� ������� ������� �������� ��������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)

  SetTestCount(5);
end;

procedure Matching54;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ���� �������� {R}_x({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\15, ������� {x} ������������ � ���������� �������)', 0, 3);
  TaskText('� �������� {L''}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (��.~\10 �~\9).', 0, 4);
  TaskText('����� ��� ��������� {P} � {T}, ��������� ������� \I������ ������\:����\i, ���������', 0, 5);
  TaskText('����������� ������� ������ �� ������� ������� (��.~\13) � �������', 0, 0);
  TaskText('������� ������ �� �������� �������� (��.~\7). ��� ����� ������������', 0, 0);
  TaskText('����� ���������, ������������ ������� ������� ������ �� �������� ��������,', 0, 0);
  TaskText('�������� ��� �������������� �������� ��������� �������: \(\X ���� {p}\,>\,0,', 0, 0);
  TaskText('�.\,�. ��������� {P} � {T} �� ����������, �� ��������� {k} �� max\{{s}, {p}\,\-\,{R}_{T[t]}({P})\},', 0, 0);
  TaskText('��� {s} \= �������� ������, ����������� �� �������� ������� �������� ��������.\)', 0, 0);
  TaskText('������� ��������� ������� ���� ��������� ��������� {P} � {T} (� �������', 0, 0);
  TaskText('�����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  MainL1_(p);
  MainS_(p);
  cnt := 0;
  BM_R_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, xLeft, 4, 1);
  DataComment('R_x(P):',40,4);
  for i := 1 to mm do
    DataN('',R_[chr(96+i)],Center(i,mm,2,1)+20,4,2);
  DataComment('L''_i(P):',3,5);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);
  ResultComment('���������:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix1(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ���������� ������� ������� �������: '+s,0,4);
  cnt := 0;
  BadChar(p,t);
  Str(cnt,s);
  ResultComment('  ���������� ��������� ��� ���������� �������� ������� �������� ��������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching55;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ���� �������� {R}_{x,i}({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\15, ������� {x} ������������ � ���������� �������, ��� ������� {x}', 0, 3);
  TaskText('�������� {i} �������� �� 1 �� |{P}|) � �������� {L}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 4);
  TaskText('(��.~\12 �~\10). ����� ��� ��������� {P} � {T}, ���������', 0, 5);
  TaskText('������� \I������ ������\:����\i, ��������� ����������� ����������� ������� ������', 0, 0);
  TaskText('�� ������� ������� (��.~\13) � ������ ������� ������ �� ��������', 0, 0);
  TaskText('�������� (��.~\9). ��� ����� ������������ ����� ���������,', 0, 0);
  TaskText('������������ ������ ������� ������ �� �������� ��������, ��������', 0, 0);
  TaskText('��� �������������� �������� ��������� �������: \(\X ���� {p}\,>\,0,', 0, 0);
  TaskText('�.\,�. ��������� {P} � {T} �� ����������, �� ��������� {k} �� max\{{s}, {p}\,\-\,{R}_{T[t],p}({P})\},', 0, 0);
  TaskText('��� {s} \= �������� ������, ����������� �� ������� ������� �������� ��������.\)', 0, 0);
  TaskText('������� ��������� ������� ���� ��������� ��������� {P} � {T} (� �������', 0, 0);
  TaskText('�����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  BM_Ri_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, 0, 4, 1);
  j := 4;
  for x := 'a' to chr(96+mm) do
  begin
  inc(j);
  DataComment('R_{\<'+x+'\>,i}(P):',3,j);
  for i := 1 to n do
    DataN('',Ri_[x,i],Center(i,n,2,1),j,2);
  end;
  DataComment('L_i(P):',3,j+1);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),j+1,2);
  DataComment('s_i(P):',3,j+2);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),j+2,2);
  ResultComment('���������:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment('����������. ���������� ��������� ��� ������������ ������� ������� �������: '+s,0,4);
  cnt := 0;
  BadChar1(p,t);
  Str(cnt,s);
  ResultComment('    ���������� ��������� ��� ���������� ������� ������� �������� ��������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching56;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ���� �������� {R}_{x,i}({P}) ��� {x} �� \E', 0, 2);
  TaskText('(��.~\16, ������� {x} ������������ � ���������� �������, ��� ������� {x}', 0, 3);
  TaskText('�������� {i} �������� �� 1 �� |{P}|) � �������� {L''}_i({P}) � {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 4);
  TaskText('(��.~\12 �~\11). ����� ��� ��������� {P} � {T}, ���������', 0, 5);
  TaskText('������� \I������ ������\:����\i, ��������� ����������� ����������� ������� ������', 0, 0);
  TaskText('�� ������� ������� (��.~\14) � ������� ������� ������ �� ��������', 0, 0);
  TaskText('�������� (��.~\9). ��� ����� ������������ ����� ���������,', 0, 0);
  TaskText('������������ ������� ������� ������ �� �������� ��������, ��������', 0, 0);
  TaskText('��� �������������� �������� ��������� �������: \(\X ���� {p}\,>\,0,', 0, 0);
  TaskText('�.\,�. ��������� {P} � {T} �� ����������, �� ��������� {k} �� max\{{s}, {p}\,\-\,{R}_{T[t],p}({P})\},', 0, 0);
  TaskText('��� {s} \= �������� ������, ����������� �� �������� ������� �������� ��������.\)', 0, 0);
  TaskText('������� ��������� ������� ���� ��������� ��������� {P} � {T} (� �������', 0, 0);
  TaskText('�����������), � ����� ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ���������.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  MainL1_(p);
  MainS_(p);
  cnt := 0;
  BM_Ri_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, 0, 4, 1);
  j := 4;
  for x := 'a' to chr(96+mm) do
  begin
  inc(j);
  DataComment('R_{\<'+x+'\>,i}(P):',3,j);
  for i := 1 to n do
    DataN('',Ri_[x,i],Center(i,n,2,1),j,2);
  end;
  DataComment('L''_i(P):',3,j+1);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),j+1,2);
  DataComment('s_i(P):',3,j+2);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),j+2,2);
  ResultComment('���������:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix1(p,t);
  Str(cnt,s);
  ResultComment('����������. ���������� ��������� ��� ������������ ������� ������� �������: '+s,0,4);
  cnt := 0;
  BadChar1(p,t);
  Str(cnt,s);
  ResultComment('   ���������� ��������� ��� ���������� �������� ������� �������� ��������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)


  SetTestCount(5);
end;

procedure Matching57;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ��� ��������� {P} � {T}, ��������� ������� ������', 0, 2);
  TaskText('������\:����, ��������� ����������� ������� ������ �� ������� �������', 0, 3);
  TaskText('� ������ ������� ������ �� �������� �������� (��.~\4).', 0, 4);
  TaskText('��� ���������� �������� {L}_i({P}) � {s}_i({P}) ������������ ������� ��������', 0, 5);
  TaskText('��������������, ��������� � \8\:\5). ������� ���������', 0, 0);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 0);
  TaskText('�������� {R}_x({P}), ��������� {x} �� \E � ���������� �������, � ����������', 0, 0);
  TaskText('��������� ��������, ��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������������).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  cnt := 0;
  MainL_(p);
  MainS_(p);
  BM_R_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('���������:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('R_x(P):',4,3);
  for i := 1 to mm do
    ResultN('',R_[chr(96+i)],Center(i,mm,2,2),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;



procedure Matching58;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ��� ��������� {P} � {T}, ��������� ������� ������', 0, 2);
  TaskText('������\:����, ��������� ����������� ������� ������ �� ������� �������', 0, 3);
  TaskText('� ������� ������� ������ �� �������� �������� (��.~\4).', 0, 4);
  TaskText('��� ���������� �������� {L''}_i({P}) � {s}_i({P}) ������������ ������� ��������', 0, 5);
  TaskText('��������������, ��������� � \9, \8, \6). �������', 0, 0);
  TaskText('��������� ������� ���� ��������� ��������� {P} � {T} (� ������� �����������),', 0, 0);
  TaskText('� ����� �������� {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, � ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������������).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  cnt := 0;
  MainL1_(p);
  MainS_(p);
  BM_R_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('���������:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('s_i(P):',4,3);
  for i := 1 to n do
    ResultN('',S_[i],Center(i,n,2,1),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching59;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ��� ��������� {P} � {T}, ��������� ������� ������', 0, 2);
  TaskText('������\:����, ��������� ����������� ����������� ������� ������ �� �������', 0, 3);
  TaskText('������� � ������ ������� ������ �� �������� �������� (��.~\4).', 0, 4);
  TaskText('��� ���������� �������� {L}_i({P}) � {s}_i({P}) ������������ ������� ��������', 0, 5);
  TaskText('��������������, ��������� � \10\:\7). ������� ���������', 0, 0);
  TaskText('������� ���� ��������� ��������� {P} � {T} (� ������� �����������), � �����', 0, 0);
  TaskText('�������� {L}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, � ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������������).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  cnt := 0;
  MainL_(p);
  MainS_(p);
  BM_Ri_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('���������:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('L_i(P):',4,3);
  for i := 1 to n do
    ResultN('',L_[i],Center(i,n,2,1),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching60;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('���� ������ {P}, {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ��� ��������� {P} � {T}, ��������� ������� ������', 0, 2);
  TaskText('������\:����, ��������� ����������� ����������� ������� ������ �� �������', 0, 3);
  TaskText('������� � ������� ������� ������ �� �������� �������� (��.~\4).', 0, 4);
  TaskText('��� ���������� �������� {L''}_i({P}) � {s}_i({P}) ������������ ������� ��������', 0, 5);
  TaskText('��������������, ��������� � \11, \10, \8). �������', 0, 0);
  TaskText('��������� ������� ���� ��������� ��������� {P} � {T} (� ������� �����������),', 0, 0);
  TaskText('� ����� �������� {L''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, � ���������� ��������� ��������,', 0, 0);
  TaskText('��������������� ��� ���������� ��������� (� ��� �����', 0, 0);
  TaskText('� ��� ���������� ��������������).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  cnt := 0;
  MainL1_(p);
  MainS_(p);
  BM_Ri_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('���������:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('�������� F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('L''_i(P):',4,3);
  for i := 1 to n do
    ResultN('',L1_[i],Center(i,n,2,1),3,2);
  ResultN('���������� ���������: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' ����������. ���������� ��������� ��� ������������� �������� ���������: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

var U_: array['a'..'g'] of integer;

procedure CalcU_(s: string; m: integer);
var
  i,k: integer;
  x: char;
begin
  for x := 'a' to chr(96+m) do
    U_[x] := 0;
  k := 1;
  for i := length(s) downto 1 do
  begin
    U_[s[i]] := U_[s[i]]+k;
    k := k * 2;
  end;
end;

function Power(a,b: integer): integer;
var i: integer;
begin
  result := 1;
  for i := 1 to b do
    result := result * a;
end;

function RShift(v,p: integer): integer;
begin
  result := (v div 2) or (p div 2);
end;





procedure Matching61;
var
  i,j,j1,j2,k0,p2,q,k1: integer;
  v: array[1..50] of integer;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P}, {T} (|{P}|\,<\,32) � ����� {j} (0\,\l\,{j}\,\l\,|{T}|). ����� {M}({P},\,{T}) ������������', 0, 1);
  TaskText('\I������� �������\i ������� |{P}|\,\x\,(|{T}|\,+\,1), �������� ������� {M}_{i,j}({P},\,{T}), {i}\,=\,1,\,\.,\,|{P}|,', 0, 2);
  TaskText('{j}\,=\,0,\,\.,\,|{T}|, ����� 1, ���� ������ {i} �������� {P} ��������� � {i} ��������� {T},', 0, 3);
  TaskText('������������ �� ������� {j} (�.\,�. {P}[1..{i}]\,=\,{T}[{j}\-{i}+1..{j}]), � ����� 0', 0, 4);
  TaskText('� ��������� ������. ����� {M}_j({P},\,{T}) ������������ {j}-� ������� ������� {M}({P},\,{T}).', 0, 5);
  TaskText('��� ������ {P} � {T} ������������ ������� {M}_j({P},\,{T}) � �������� ��� \I��������\i', 0, 0);
  TaskText('\I�������������\i, �.\,�. ������������� � ���� ������ �����, �������� ������', 0, 0);
  TaskText('�������� (����������� ����� ������ �� |{P}| ��������) ��������� � ����������', 0, 0);
  TaskText('������� {M}_j({P},\,{T}), ������������� � ������� ����������� �������� (��������,', 0, 0);
  TaskText('������-������� (0,\,1,\,1)^T ������������� �������� ������������� 3). �������', 0, 0);
  TaskText('�������� ������� {M}_j({P},\,{T}) � ��������������� ��� �������� �������������.', 0, 0);
  TaskText('\P\S����������\s. �������� ������� {M}({P},\,{T}), ������ 1 � ������� {i}, ���������� ���', 0, 0);
  TaskText('������� � {T}, ��� ������������� ����� ��������� {P}[1..{i}], ������� �� \I���������\i', 0, 0);
  TaskText('\I�������\i ������� {M} ����� ���������� ����������� ������� \I���� ���������\i {P} � {T}.', 0, 0);
  k1 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  k0 := Random(8);
  q := Rand(1,5);
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);
//  until (nres <20) and ((k0 = 0)and(nres=0) or ((k0=1)or(k0=2)) and (mm=1) or (k0 > 2) and (mm > 1) and (nres>=q));
  m := length(t);
  k0 := Rand(0,m);
  if (nres>0) and (k1>5) then
    k0 := res[rand(1,nres)]+n-1;
  CalcU_(p,mm);
  j1 := 0;
  p2 := Power(2,n);
  k := 0;
  for i := 1 to k0 do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    j1 := j2;
  end;
  j := 0;
  for i := 1 to n do
  begin
    v[i] := j1 mod 2;
    if v[i] = 1 then
      inc(j);
    j1 := j1 div 2;
  end;
  until ((k1=0) or (k1 > 0) and (j>0)) and (nres > 0);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('j = ',k0,0,5,1);
  ResultComment('������-������� M_j(P,T):',0,2);
  for i := 1 to n do
    ResultN('',v[n-i+1],Center(i,n,1,2),3,1);
  ResultN('�������� �������������: ',j2,0,4,6);
  SetTestCount(5);
end;


procedure Matching62;
var
  i,d,j: integer;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P} (|{P}|\,<\,32) � ����� {k} (\l\,|{P}|). ����� {U}({x},\,{P}), ��� {x} \= ���������', 0, 1);
  TaskText('������, ������������ \I������� ������\i ����� |{P}|, ��� �������� {U}_i({x},\,{P})\,=\,1,', 0, 2);
  TaskText('���� {P}[{i}]\,=\,{x}, � {U}_i({x},\,{P})\,=\,0 � ��������� ������. ��� ������ ������ {P} �����', 0, 3);
  TaskText('������ {U}({P}[{k}],\,{P}) � ������� ��� ��������, � ����� ��������������� ��� ��������', 0, 4);
  TaskText('������������� (����������� ��������� ������������� ���� � \1).', 0, 5);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  CalcU_(s,mm);
  k := Rand(1,n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', k, 0, 4, 1);
  ResultComment('������ U(\<'+s[k]+'\>,P):',0,2);
  d := 0;
  for i := 1 to n do
  begin
    j := 0;
    if s[i]=s[k] then j := 1;
    d := d*2+j;
    ResultN('',j,Center(i,n,1,2),3,1);
  end;
  ResultN('�������� �������������: ',d,0,4,6);
//  ResultN('',u_[s[k]],0,5,6);
  SetTestCount(5);
end;




procedure Matching63;
var
  i: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P} (|{P}|\,<\,32) � ����� {m} (<\,10); ������� \E ������������ �����', 0, 1);
  TaskText('{m} ������ �������� ��������� ����. ��� ������� ������� {x} �� \E ����� ��������', 0, 2);
  TaskText('������������� ������� {U}({x},\,{P}) (��.~\1) � ������� ��� �������������,', 0, 3);
  TaskText('��������� {x} � ���������� �������. ��� �������� �������� �������������', 0, 4);
  TaskText('�������� ������������ ������. ������������ ��� �������� �������������', 0, 5);
  TaskText('�� ����������� �������� ������, ��������� ����� �� ������������.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  CalcU_(s,mm);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('m = ', mm, 0, 4, 1);
  ResultComment('�������� ������������� �������� U(x,P) ��� ��������� x �� \E:',0,2);
//  ResultComment('x:',3,3);
//  ResultComment('������������� U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    ResultN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),3,6);
  end;
  SetTestCount(5);
end;


procedure Matching64;
var
  i,v,p2,vv,v1: integer;
begin
  CreateTask(Subgroup12);
  TaskText('���� ����� {v} � {p}; {p}\,=\,2^n ��� ���������� {n}\,>\,0, {v} �������� �������� ��������������', 0, 1);
  TaskText('���������� ������� {V} ����� {n} (����������� ��������� ������������� ����', 0, 2);
  TaskText('� \3). ����� RShift({V}) ������������ ������ {V''}, ����������', 0, 3);
  TaskText('�� ������� {V} ������� ���� ��� ��������� �� 1 ������� � ����������� ����������', 0, 4);
  TaskText('��������, ������ ������ ������� ������� {V''} ���������� ������ 1, � ���������', 0, 5);
  TaskText('������� ������� {V} ��������. ��������� �������������� � ��������� ��������', 0, 0);
  TaskText('��� ������ ������� � �� �������� �����, ����� �������� �������������', 0, 0);
  TaskText('�������� RShift({V}) � RShift(RShift({V})). �������� ���������� ���������', 0, 0);
  TaskText('������������� RShift({V}) � ���� ��������������� ������� � ����������� {v} � {p}.', 0, 0);
  n := Rand(10, 19);
  p2 := Power(2,n);
  v := Rand(0,p2*2-1);
  DataN('v = ',v,xLeft,3,6);
  DataN('p = ',p2,xRight,3,6);
(*  v1 := v;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1)-2,3,1);
    v1 := v1 div 2;
  end;
*)
  vv := RShift(v,p2);
//  ResultN('n = ',n,xLeft,1,2);
  ResultN('RShift(V) = ',vv,xLeft,3,6);
(*  v1 := vv;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1),4,1);
    v1 := v1 div 2;
  end;
*)
  vv := RShift(vv,p2);
  ResultN('RShift(RShift(V)) = ',vv,xRight,3,6);
(*  v1 := vv;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1)+2,5,1);
    v1 := v1 div 2;
  end;
*)
  SetTestCount(5);
end;

procedure Matching65;
var
  i,j1,j2,j,p2,k0: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {T} � ����� {m} (<\,10); ������� \E ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ���� �������������� ��������� ������ {P}:', 0, 2);
  TaskText('�� ����� {n} � �������� ������������� �������� {U}({x},\,{P}) ��� ���� {x} �� \E ', 0, 3);
  TaskText('(��.~\3, ������� {x} ������������ � ���������� �������). �����', 0, 4);
  TaskText('������� ������� {M}({P},\,{T}) (��.~\4), ��������� ��������� ��������:', 0, 5);
  TaskText('\(\X ������� {M}_0 �������� �������;\| \X ��� ������ {j}\,>\,0 ������� {M}_j �����������', 0, 0);
  TaskText('�� ������� {M}_j\,=\,RShift({M}_{j\-1}) and {U}({T}[{j}],\,{P}) (�������� RShift �������', 0, 0);
  TaskText('�~\1).\) ��� ���������� ��������� ��� ��������� ���������������', 0, 0);
  TaskText('��������; ��� ���������� ������� {M} ������� ������ ��� �� �������:', 0, 0);
  TaskText('����������� � ��������� �� ���������� ����. � �������� ����������', 0, 0);
  TaskText('�������� {M}_j, {j}\,=\,1,\,\.,\,|{T}|, �������� �� �������� �������������.', 0, 0);
  TaskText('\P\S����������\s. ������� �������� ��� ����, ��� {i}-� ������� ������� {M}_j', 0, 0);
  TaskText('����� ����� 1 ����� � ������ �����, ����� ��������� {P}[1..{i}\,\-\,1] ��������', 0, 0);
  TaskText('� ���������� {T} ��� �� �����, �������������� � ������� {j}\,\-\,1 (� ���� ������', 0, 0);
  TaskText('{i}-� ������� ������� RShift({M}_{j\-1}) ����� ����� 1), �, ����� ����,', 0, 0);
  TaskText('������ {P}[{i}] �������� � {T}[{j}] (� ���� ������ {i}-� ������� ������� {U}({T}[{j}],\,{P})', 0, 0);
  TaskText('����� ����� �����~1).', 0, 0);
  k0 := Random(6);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);

  until (k0=1) and (mm=1) or (k0=0) and (nres=0) or (k0>1) and (mm>1) and (nres>k0-2);
  CalcU_(p,mm);
//  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),0,1);
  DataS('T = ',t,0,2);
  DataN('m = ',mm,10,3,1);
  DataN('n = ',n,23,3,1);
//  DataComment('�������� ������������� �������� U(x,P):',39,3);
  DataComment('�������� ������������� �������� U(x,P):',xRight,3);
//  ResultComment('x:',3,3);
//  ResultComment('������������� U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    DataN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;

(*
  DataComment('x:',3,3);
  DataComment('U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
    DataComment(x,Center(i,mm,6,1)+5,3);
    DataN('',U_[x],Center(i,mm,6,1),4,6);
  end;
*)
//  p1 := '������������� ��������� ������ P:     \<';
  DataComment('����������. �������� ������ ������������� ������ P = \<'+p+'\>',3,5);
//  DataComment(p1 + p+'\>',3,7);
  m := length(t);
  if m < 41 then
    ResultComment('�������� ������������� �������� M_j(P,T), j=1,...,|T|:',0,1);
  j1 := 0;
  p2 := Power(2,n);
  case m of
  41..50: j := 1;
  21..40: j := 2;
  else j := 3;
  end;
  for i := 1 to m do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    ResultN('',j2,Center((i-1) mod 10 + 1, 10, 6, 1),(i-1) div 10+j,6);
    j1 := j2;
  end;
  SetTestCount(5);
end;

procedure Matching66;
var
  i,j,j1,j2,k0,p2,q: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P}, {T} (|{P}|\,<\,32) � ����� {m} (<\,10); ������� \E ������������ �����', 0, 1);
  TaskText('{m} ������ �������� ��������� ����. ��������, ��� ������� ���� �� ����', 0, 2);
  TaskText('��������� ������� {P} � ����� {T}. ����� ��� ��������� {P} � {T}, ���������', 0, 3);
  TaskText('\I������� ����� ������\i. ��� ����� ������������ ������� {U}({x},\,{P}) ��� ���� {x} �� \E', 0, 4);
  TaskText('(��.~\3), ����� ���� ������������ ���������������� ����������', 0, 5);
  TaskText('�������� ������� {M}({P},\,{T}) (��.~\1). ��������� {P} � {T} ����������,', 0, 0);
  TaskText('���������� ��������� �������� �������� {M}_j({P},\,{T}) (��. ���������� � \5;', 0, 0);
  TaskText('��� �������� ������������� �������� ���������� ���������������� �� ��������).', 0, 0);
  TaskText('������� ��������� ������� ���� ��������� ��������� {P} � {T} (� �������', 0, 0);
  TaskText('�����������), � ����� �������� ������������� {U}({x},\,{P}), ��������� {x} �� \E', 0, 0);
  TaskText('� ���������� �������, � �������� ������������� �������� {M}_j({P},\,{T}),', 0, 0);
  TaskText('��������������� �������� �������� {j} ��������� ��������� (��������', 0, 0);
  TaskText('������������� ���� ���� �������� ����� �����������).', 0, 0);
  k0 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);
  until (nres <=15) and (nres>0) and (((k0=0)or(k0=1)) and (mm=1) or (k0 > 1) and (mm > 1) and (nres>=q));
  CalcU_(p,mm);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);
  m := length(t);
  j1 := 0;
  p2 := Power(2,n);
  k := 0;
  k0 := 0;
  q := 1;
  if nres <10 then q := 2;
  ResultComment('���������:',0,1);
  for i := 1 to m do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    if Odd(j2) then
    begin
      inc(k);
      k0 := j2;
      ResultN('',i-n+1,Center(k,nres,2,q),2,2);
    end;
    j1 := j2;
  end;
  ResultComment('�������� ������������� �������� U(x,P) ��� ��������� x �� \E:',0,3);
//  ResultComment('x:',3,3);
//  ResultComment('������������� U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    ResultN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;

  ResultN('�������� ������������� M_j(P,T) ��� �������� ������� ��������� P � T: ',k0,0,5,6);
//  for i := 1 to nres do
//    ResultN('',res[i],Center(i,nres,2,2),5,2);

  SetTestCount(5);
end;


var M_: array[0..5,0..100] of integer;

// � ����� (�.101) ������ � �������:
//������: � ��������� �������� �� ������� �������� RShift - ��� ��� ��� �������� �������!
//�������: ������ ������� �� �����; ��� ���� ��� � ��� �������� (���� �� �� ������)
// ����� ����, � ����������� ������� �� ������ ����������� ���������� �������� M^0
//(��� ������� ����������� "����������" ���������� �������)


procedure CalcM_(T: string; n,k: integer);
var q,j,m,p2: integer;
begin
  m := length(T);
  p2 := Power(2,n);
  for q := 0 to k do
    M_[q,0] := 0;
  for j := 1 to m do
  begin
    M_[0,j] := RShift(M_[0,j-1],p2) and U_[T[j]];
    for q := 1 to k do
      M_[q,j] := {M_[q-1,j] or} (RShift(M_[q,j-1],p2) and U_[T[j]]) or RShift(M_[q-1,j-1],p2);
  end;
end;

function Bin(k,n: integer): string;
var s: string;
    i: integer;
begin
  s := '';
  for i := 1 to n do
  begin
    s := chr(48+ k mod 2) + s;
    k := k div 2;
  end;
  result := s;
end;

procedure NaiveK(P,T: string; k: integer);
var n,m,i,j,k0: integer;
    s: string;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  for i := 1 to m-n+1 do
  begin
    s := Copy(t,i,n);
    k0 := 0;
    for j := 1 to n do
      if s[j] <> p[j] then
        inc(k0);
    if k0 <= k then
    begin
      inc(nres);
      res[nres] := i;
    end;
  end;
end;



procedure Matching67;
var
  i,j,j1,j2,k0,p2,q,k1: integer;
  v: array[1..50] of integer;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P}, {T} (|{P}|\,<\,32) � ����� {k} ({k}\,\l\,5) � {j} (0\,\l\,{j}\,\l\,|{T}|). ����� {M}^k({P},\,{T}),', 0, 1);
  TaskText('{k}\,\g\,0, ������������ \I������� �������\i ������� |{P}|\,\x\,(|{T}|+1), �������� �������', 0, 2);
  TaskText('{M}^k_{i,j}({P},\,{T}), {i}\,=\,1,\,\.,\,|{P}|, {j}\,=\,0,\,\.,\,|{T}|, ����� 1, ���� �� ����� {i}\,\-\,{k} �� ������', 0, 3);
  TaskText('{i} �������� {P} ��������� � ���������������� ��������� �� {i} �������� {T},', 0, 4);
  TaskText('����������� �� ������� {j} (�.\,�. {P}[1..{i}] ���������� �� {T}[{j}\,\-\,{i}\,+\,1..{j}] �� �����', 0, 5);
  TaskText('��� � {k} ��������). � ��������� ������ {M}^k_{i,j}({P},\,{T})\,=\,0. ����� {M}^k_j({P},\,{T})', 0, 0);
  TaskText('������������ {j}-� ������� ������� {M}^k({P},\,{T}). ��� ������ {P} � {T} ������������', 0, 0);
  TaskText('������� {M}^k_j � �������� ��� �������� ������������� (����������� ���������', 0, 0);
  TaskText('������������� ��������� � \6). ������� �������� ������� {M}^k_j', 0, 0);
  TaskText('� ��������������� ��� �������� �������������.', 0, 0);
  TaskText('\P\S����������\s. ��������� �������� ������ ������� {M}^k({P},\,{T}) � ������� |{P}|', 0, 0);
  TaskText('������������� ����������� �������� ���� \I�������� ���������\i {P} � {T}', 0, 0);
  TaskText('� �� ����� ��� {k} �������������� ��������� (���������� �����', 0, 0);
  TaskText('\I����������� � �� ����� ��� {k} ��������\i).', 0, 0);
  k1 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  k0 := Random(8);
  q := Rand(1,5);
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  k := Rand(1,5);
  NaiveK(p,t,k);
  until nres >0;
  m := length(t);
  if (nres>0) and (k1>5) then
    k0 := res[rand(1,nres)]+n-1;
  CalcU_(p,mm);
  CalcM_(t,n,k);
  k0 := Rand(0,m);
  if Random(3)>0 then
  begin
    k0 := res[Random(nres)+1]+n-1;
  end;
  j2 := M_[k,k0];
  j1 := j2;
  j := 0;
  for i := 1 to n do
  begin
    v[i] := j1 mod 2;
    if v[i] = 1 then
      inc(j);
    j1 := j1 div 2;
  end;
//  until ((k1=0) or (k1 > 0) and (j>0)) and (nres > 0);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ',k,xLeft,5,1);
  DataN('j = ',k0,xRight,5,1);
  ResultComment('������-������� M^k_j(P,T):',0,2);
  for i := 1 to n do
    ResultN('',v[n-i+1],Center(i,n,1,2),3,1);
  ResultN('�������� �������������: ',j2,0,4,6);
  SetTestCount(5);
end;



procedure Matching68;
var
  i,j,p2,k0: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {T} � ����� {k} (\l\,5) � {m} (<\,10); ������� \E ������������ �����', 0, 1);
  TaskText('{m} ������ �������� ��������� ����. ����� ���� �������������� ���������', 0, 2);
  TaskText('������ {P}: �� ����� {n} � �������� ������������� �������� {U}({x},\,{P}) ��� ���� {x} �� \E', 0, 3);
  TaskText('(��.~\6, ������� {x} ������������ � ���������� �������). ��� ������� {k}', 0, 4);
  TaskText('����� ������� ������� {M}^k({P},\,{T}) (��.~\1), ��������� ���������', 0, 5);
  TaskText('��������: \(\X ��� ������������� {j}\,=\,0,\,\.,\,|{T}| ��������������� ����������� {M}^q_j', 0, 0);
  TaskText('��� {q}\,=\,0,\,\.,\,{k};\| \X ��� ������ {q} ������� {M}^q_0 �������� �������;\| \X ������� {M}^0_j', 0, 0);
  TaskText('����������� �� ������� {M}^0_j\,=\,RShift({M}^0_{j\-1}) and {U}({T}[{j}],\,{P}) (�������� RShift', 0, 0);
  TaskText('������� �~\4);\| \X ��� {j}\,>\,0 ������� {M}^q_j ����������� �� �������', 0, 0);
  TaskText('{M}^q_j\,=\,RShift({M}^{q\-1}_{j\-1}) or (RShift({M}^q_{j\-1}) and {U}({T}[{j}],\,{P})).\) ��� ����������', 0, 0);
  TaskText('��������� ��� ��������� ��������������� ��������; ��� ���������� ������ {M}^q', 0, 0);
  TaskText('������� ������ ��� ������ �� ��������: ����������� {M}^q_j � ���������', 0, 0);
  TaskText('�� ���������� ���� {M}^q_{j\-1}. � �������� ���������� �������� {M}^k_j, {j}\,=\,1,\,\.,\,|{T}|,', 0, 0);
  TaskText('�������� �� �������� �������������.', 0, 0);
  TaskText('\P\S����������\s. ������� ��� ���������� {M}^q_j ��� ������������� {q} � {j} �������� ���', 0, 0);
  TaskText('����, ��� {i} ������ �������� ������ {P} � {i} �������� ������ {T}, ��������������', 0, 0);
  TaskText('� ������� {j}, ����� ����� �� ����� {q} ������������ � ��� � ������ ��� ������,', 0, 0);
  TaskText('���� {i}\,\-\,1 ������ �������� ������ {P} � {i}\,\-\,1 �������� ������ {T}, ��������������', 0, 0);
  TaskText('� ������� {j}\,\-\,1, ����� ����� �� ����� {q}\,\-\,1 ������������ (��� �������� ���������', 0, 0);
  TaskText('������� RShift({M}^{q\-1}_{j\-1}) ���� {i}\,\-\,1 ������ �������� ������ {P} � {i}\,\-\,1 ��������', 0, 0);
  TaskText('������ {T}, �������������� � ������� {j}\,\-\,1, ����� ����� �� ����� {q} ������������', 0, 0);
  TaskText('� ��� ���� ���� �������� {P}[{i}] � {T}[{j}] ����� ��������� (��� ��������', 0, 0);
  TaskText('��������� ������� RShift({M}^q_{j\-1}) and {U}({T}[{j}],\,{P})).', 0, 0);
  k0 := Random(6);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcU_(p,mm);
  k := Rand(1,5);
  NaiveK(p,t,k);


  until (k0=0) and (nres=0) or (k0>0) and (mm>1) and (nres>k0-1);

(*
//  DataS('P = ',p,3,1);
//  DataComment(Rule(4,length(t)),3,1);
  DataS('T = ',t,3,1);
  DataN('k = ',k,xleft,2,1);
  DataN('m = ',mm,0,2,1);
  DataN('n = ',n,xRight,2,1);
//  DataComment('�������� ������������� �������� U(x,P):',39,3);
  DataComment('x:',3,3);
  DataComment('U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
    DataComment(x,Center(i,mm,6,1)+5,3);
    DataN('',U_[x],Center(i,mm,6,1),4,6);
  end;
*)
  DataComment(Rule(4,length(t)),0,1);
  DataS('T = ',t,0,2);
  DataN('k = ',k,6,3,1);
  DataN('m = ',mm,17,3,1);
  DataN('n = ',n,28,3,1);
//  DataComment('�������� ������������� �������� U(x,P):',39,3);
  DataComment('�������� ������������� �������� U(x,P):',xRight,3);
//  ResultComment('x:',3,3);
//  ResultComment('������������� U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    DataN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;





//  p1 := '������������� ��������� ������ P:     \<';
  DataComment('����������. �������� ������ ������������� ������ P = \<'+p+'\>',3,5);
//  DataComment(p1 + p+'\>',3,7);

  m := length(t);
  if m < 41 then
    ResultComment('�������� ������������� �������� M^k_j(P,T), j=1,...,|T|:',0,1);
  case m of
  41..50: j := 1;
  21..40: j := 2;
  else j := 3;
  end;
  CalcM_(t,n,k);
  for i := 1 to m do
  begin
    ResultN('',M_[k,i],Center((i-1) mod 10 + 1, 10, 6, 1),(i-1) div 10+j,6);
  end;

(*
  CalcM_(t,n,k);
  CalcM1_(t,n,k);
  i := 0;
  for j := 1 to m do
    if M_[k,j] <> M1_[k,j] then
    begin
      i := j;
      break;
    end;
  ResultN('',i,1,1,2);
  p2 := Power(2,n);
  if i > 0 then
  begin
     ResultS('',Bin(M_[k,i],n),xLeft,1);
//     ResultS('',Bin(M_[k-1,i],n),xLeft,2);
     ResultS('',Bin(RShift(M_[k,i-1],p2) and U_[T[i]],n),xLeft,3);
     ResultS('',Bin(M_[k-1,i-1],n),xLeft,4);
     ResultN('',M_[k,i],xLeft,5,6);
//      M1_[q,j] := M1_[q-1,j] or RShift(M1_[q,j-1],p2) and U_[T[j]] or M1_[q-1,j-1];
     ResultS('',Bin(M1_[k,i],n),xRight,1);
     ResultS('',Bin(M1_[k-1,i],n),xRight,2);
     ResultS('',Bin(RShift(M1_[k,i-1],p2) and U_[T[i]],n),xRight,3);
     ResultS('',Bin(M1_[k-1,i-1],n),xRight,4);
     ResultN('',M1_[k,i],xRight,5,6);
  end;
*)
  SetTestCount(5);
end;




procedure Matching69;
var
  i,j,p2,q: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('���� ������ {P}, {T} (|{P}|\,<\,32) � ����� {k} (\l\,5) � {m} (<\,10); ������� \E', 0, 1);
  TaskText('������������ ����� {m} ������ �������� ��������� ����. ��������, ��� �������', 0, 2);
  TaskText('���� �� ���� ��������� ������� {P} � ����� {T}, ���������� �� �����', 0, 3);
  TaskText('{k} ������������. ����� ��� ����� ��������� {P} � {T}, ��������� \I������� �����\i', 0, 4);
  TaskText('\I��������� ������\i. ��� ����� ������������ ������� {U}({x},\,{P}) ��� ���� {x} �� \E', 0, 5);
  TaskText('(��.~\7), ����� ���� ������������ ���������������� ����������', 0, 0);
  TaskText('�������� ������� {M}^k({P},\,{T}) (��.~\1). �������� ��������� {P} � {T}', 0, 0);
  TaskText('����������, ���������� ��������� �������� �������� {M}^k_j (��. ����������', 0, 0);
  TaskText('� \2; ��� �������� ������������� �������� ����������', 0, 0);
  TaskText('���������������� �� ��������). ��� ������� ���������� ���������', 0, 0);
  TaskText('��������� {P} � {T} �������� ��� ��������� ������� � �������� ������������� {M}^k_j,', 0, 0);
  TaskText('��� {j} \= ����� �������� ������� ������� ���������. ��������� ����������', 0, 0);
  TaskText('� ������� ����������� �� ��������� �������.', 0, 0);
  q := Rand(3,6);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
(*  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
*)
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcU_(p,mm);
  k := Rand(1,5);
  NaiveK(p,t,k);
  until (nres <16) and (nres>=q);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ',k,xleft,5,1);
  DataN(' m = ',mm,xRight,5,1);
  CalcM_(t,n,k);
(*
  ResultN('nres = ',nres,0,1,2);
  for i := 1 to min(nres,19) do
    ResultN('',res[i],Center(i,min(nres,19),2,2),1,2);
*)
  nres0 := 0;
  m := length(t);
  case nres of
  1..6: j := 3;
  7..9: j := 2;
  10..12: j := 2;
  13..15: j := 1;
  end;
  if j > 1 then
    ResultComment('�������� ��������� (��������� ������� � �������� ������������� {M}^k_j):',0,1);

  for i := 1 to m do
  begin
    if Odd(M_[k,i]) then
    begin
      inc(nres0);
      ResultN2('',i-n+1,M_[k,i],Center((nres0-1)mod 3 + 1,3,16,4)-4,(nres0-1) div 3 + j,8);
    end;
  end;

(*
  i := 0;
  for j := 1 to m do
    if M_[k,j] <> M1_[k,j] then
    begin
      i := j;
      break;
    end;
  ResultN('',i,1,1,2);
  p2 := Power(2,n);
  if i > 0 then
  begin
     ResultS('',Bin(M_[k,i],n),xLeft,1);
//     ResultS('',Bin(M_[k-1,i],n),xLeft,2);
     ResultS('',Bin(RShift(M_[k,i-1],p2) and U_[T[i]],n),xLeft,3);
     ResultS('',Bin(M_[k-1,i-1],n),xLeft,4);
     ResultN('',M_[k,i],xLeft,5,6);
//      M1_[q,j] := M1_[q-1,j] or RShift(M1_[q,j-1],p2) and U_[T[j]] or M1_[q-1,j-1];
     ResultS('',Bin(M1_[k,i],n),xRight,1);
     ResultS('',Bin(M1_[k-1,i],n),xRight,2);
     ResultS('',Bin(RShift(M1_[k,i-1],p2) and U_[T[i]],n),xRight,3);
     ResultS('',Bin(M1_[k-1,i-1],n),xRight,4);
     ResultN('',M1_[k,i],xRight,5,6);

  end;
*)
  SetTestCount(5);
end;

var v_: array[1..100] of integer;
    c_init_: char;


function CreateStringD(m,n: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + chr(48+Random(m));
end;

function D_(c: char): integer;
begin
  result := ord(c)-ord(c_init_);
end;

function H_(s: string; m,q: integer): integer;
var i: integer;
begin
  result := D_(s[1]);
  for i := 2 to length(s) do
  begin
    v_[i-1] := result;
    if q = 0 then
      result := result*m + D_(s[i])
    else
      result := result*m mod q + D_(s[i])
  end;
  if q <> 0 then
    result := result mod q;
end;

// ���������. � ����� (�. 110) ��������� �� ������ ���������� �������
// ��� ������������� ��������� H. � ������, ��� ����������� �� ������
// ������� �������� ��������� �������������� ����������.
// ��� ����������� ���������� ����� ��������� ��������� ������ �������
// �������� � ����� ����� (m-1)*q (��� � ����������� ���� �������),
// ��� m - �������� ��������


function H1_(s: string; m,q,H,n,k,m_n_mod_q: integer): integer;
begin
  result := H*m-D_(S[k-1])*m_n_mod_q+D_(S[k+n-1]);
  if q > 0 then
    result := (result + (m-1)*q)mod q;
end;

function M_N_MOD_Q_(m,n,q: integer): integer;
var
  i: integer;
begin
  if q = 0 then
  begin
  result := m;
  for i := 2 to n do
    result := result * m;
  end
  else
  begin
  result := m mod q;
  for i := 2 to n do
    result := result * m mod q;
  end;
end;

function IsPrime(a: integer): boolean;
var b: integer;
begin
  result := false;
  if a mod 2 = 0 then exit;
  b := Round(sqrt(a));
  if b mod 2 = 0 then b := b - 1;
  while a mod b <> 0 do
    b := b - 2;
  result := b=1;
end;

function GetPrime(min,max: integer): integer;
begin
  repeat
    result := Rand(min,max);
  until isPrime(result);
end;


procedure Matching70;
var
  i: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {S}, ��������� �� �������� \<0\> � \<1\> (|{S}|\,<\,32). ����� {H}({S})', 0, 1);
  TaskText('������������ �����, ��������� ������������� �������� � �������� �������', 0, 2);
  TaskText('��������� ��������� �� ������� {S}: {H}({S})\,=\,\E_{i=1}^{|S|}~2^{|S|\-i}\*{d}({S}[{i}]),', 0, 3);
  TaskText('��� {d}(\<0\>)\,=\,0, {d}(\<1\>)\,=\,1. ����� {�}({S}), ��������� \I����� �������\i:', 0, 4);
  TaskText('\[{H}({S})\,=\,(\.((({d}({S}[1])\*2\,+\,{d}({S}[2]))\*2\,+\,{d}({S}[3]))\*2\,+\,{d}({S}[4]))\.)\*2\,+\,{d}({S}[|{S}|]).\]', 0, 5);
  c_init_ := '0';
  mm := 2;
  s := CreateStringD(mm, rand(6, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('H(S) = ',H_(s,2,0),0,3,10);
  SetTestCount(5);
end;

procedure Matching71;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {T}, ��������� �� �������� \<0\> � \<1\>, ����� {n} (<\,min\{|{T}|,\,31\})', 0, 1);
  TaskText('� �������� {H}({T}[1..{n}]) (��.~\1). ����� � ������� �������� {H}({T}^n_k),', 0, 2);
  TaskText('{k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1, ��� {T}^n_k\,=\,{T}[{k}..{k}\,+\,{n}\,\-\,1] \= ��������� ������ {T}, ������� ����� {n}', 0, 3);
  TaskText('� ������������ � ������� {k}. ��� ���������� {H}({T}^n_k) ������������', 0, 4);
  TaskText('������������ �������: {H}({T}^n_k)\,=\,{H}({T}^n_{k\-1})\*2\,\-\,{d}({T}[{k}\,\-\,1])\*2^n\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1]).', 0, 5);
  c_init_ := '0';
  mm := 2;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),2,0);
  DataN('n = ',n,xLeft,4,2);
  DataN('H(T[1..n]) = ',h0,xRight,4,4);
  ResultComment('�������� H(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(2,n,0);
  for i := 1 to 10 do
  begin
    h0 := H1_(s,2,0,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,2,0,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;

(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),2,0),Center(i,10,6,1),5,6);
  end;
*)
  SetTestCount(5);
end;

procedure Matching72;
var
  i,k0,hp,ht,j: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {P} � {T}, ��������� �� �������� \<0\> � \<1\>, |{P}|\,<\,31.', 0, 1);
  TaskText('����� ��� ��������� {P} � {T}, ��������� �������� {H}({P}) � {H}({T}^n_k), {k}\,=\,1,\,\.,\,|{T}|\,\-\,{n}\,+\,1,', 0, 2);
  TaskText('��� {n}\,=\,|{P}| (����������� {H}({S}) ���� � \2, ����������� {T}^n_k � �������', 0, 3);
  TaskText('�������� ���������� {H}({T}^n_k) ��������� � \1). ������ {P} ������ � {T},', 0, 4);
  TaskText('������� � ������� {k}, ����� � ������ �����, ����� {H}({P})\,=\,{H}({T}^n_k).', 0, 5);
  TaskText('������� {H}({P}), {H}({T}^n_1) � ��������� ������� ���� ��������� ��������� {P} � {T}', 0, 0);
  TaskText('(� ������� �����������), ����� ���� ������������� ������� {H}({T}^n_{|T|\-n+1}).', 0, 0);
  c_init_ := '0';
  mm := 2;
  k0 := Random(4);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
    Naive(p,t);
  until (nres < 16) and ((k0=0) or (k0>0) and (nres > k0-1));
(*
  ResultN('nres = ',nres,0,1,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := M_N_MOD_Q_(2,n,0);
  hp := H_(p,2,0);
  ht := H_(Copy(t,1,n),2,0);
  ResultN('H(P) = ',hp,xLeft,2,6);
  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('���������:',4,3);
  nres := 0;
  if hp=ht then
  begin
    inc(nres);
    res[nres] := 1;
  end;

  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,2,0,ht,n,i,j);
    if hp=ht then
    begin
      inc(nres);
      res[nres] := i;
    end;
  end;
  j := 1;
  if nres <10 then j := 2;

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,j),3,2);
  ResultN('H(T^n_{|T|\-n+1}) = ',ht,0,4,6);



  SetTestCount(5);
end;



function GetQ_: integer;
begin
case Random(3) of
0: result := GetPrime(11,99);
1: result := GetPrime(101,997);
2: result := GetPrime(1001,9997);
//3: result := GetPrime(10001,99997);
end;
end;



procedure Matching73;
var
  i,j,h,k0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {S}, ��������� �� �������� \<0\> � \<1\>, � ����� {q}. ����� {H}_q({S})', 0, 1);
  TaskText('������������ �����, ������ {�}({S}) mod {q}, ��� ����� {H}({S}) ����������', 0, 2);
  TaskText('� \3, � \<mod\> ���������� �������� ������ ������� �� ������� ������.', 0, 3);
  TaskText('�������� {H}_q({S}) ����� � ��������� �� 0 �� {q}\,\-\,1 � ���������� \I��������������\i', 0, 4);
  TaskText('������ {S}. ����� {�}_q({S}), ��������� ������� ����� �������, � �������', 0, 5);
  TaskText('�� ���� ��������� ��������� �� ����������� 2\*{q}: {H}_q({S})\,=\,((\.((({d}({S}[1])\*2', 0, 0);
  TaskText('mod {q}\,+\,{d}({S}[2]))\*2 mod {q}\,+\,{d}({S}[3]))\*2 mod {q}\,+\,{d}({S}[4]))\.)\*2 mod {q}\,+\,{d}({S}[|{S}|])) mod {q}.', 0, 0);
  TaskText('������� ������������� ���������� ����������, ���������� ����� ������', 0, 0);
  TaskText('��������� ��������� �� 2, � ����� ��������� �������� {H}_q({S}).', 0, 0);
  c_init_ := '0';
  mm := 2;
  qq := GetQ_;
  s := CreateStringD(mm, rand(12, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('q = ',qq,0,4,4);
  h := H_(s,2,qq);
  k0 := length(s)-1;
  if k0 > 20 then j := 1
  else
    j := 2;
  ResultComment('������������� ���������� ����������:',0,j);
  k0 := length(s)-1;
  for i := 1 to k0 do
    ResultN('',v_[i],Center((i-1)mod 10 + 1,10,4,1),(i-1) div 10 + j+1,4);
  ResultN('H_q(S) = ',h,0,5,4);
  SetTestCount(5);
end;

procedure Matching74;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {T}, ��������� �� �������� \<0\> � \<1\>, ����� {n} (<\,|{T}|) � {q}, � �����', 0, 1);
  TaskText('�������� {H}_q({T}[1..{n}]) (��.~\1). ����� � ������� �������� {H}_q({T}^n_k),', 0, 2);
  TaskText('{k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1 (����������� {T}^n_k ������� � \3).', 0, 3);
  TaskText('��� ���������� {H}_q({T}^n_k) ������������ ������������ �������:', 0, 4);
  TaskText('{H}_q({T}^n_k)\,=\,({H}_q({T}^n_{k\-1})\*2\,\-\,{d}({T}[{k}\,\-\,1])\*(2^n mod {q})\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1])\,+\,{q}) mod {q}.', 0, 5);
  TaskText('��� ���������� 2^n mod {q} ������������ �����, � ������� �������������', 0, 0);
  TaskText('���������� �� ����������� 2\*{q}: 2^n mod {q}\,=\,2\*(\.(2\*(2\*2 mod {q}) mod {q})\.) mod {q}.', 0, 0);
  c_init_ := '0';
  mm := 2;
  qq := GetQ_;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),2,qq);
  DataN('n = ',n,xLeft,4,2);
  DataN('q = ',qq,xRight,4,4);
  DataN('H_q(T[1..n]) = ',h0,0,5,4);
  ResultComment('�������� H_q(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(2,n,qq);
  for i := 1 to 10 do
  begin
    h0 := H1_(s,2,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,2,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;

(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),2,qq),Center(i,10,6,1),5,6);
  end;
*)
  SetTestCount(5);
end;

procedure Matching75;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {P} � {T}, ��������� �� �������� \<0\> � \<1\>, � ����� {q}. �����', 0, 1);
  TaskText('��� ��������� {P} � {T} ��������� \I����� ������������ �����\:������\i. ��� �����', 0, 2);
  TaskText('����� � �������� �������� {H}_q({P}) � {H}_q({T}^n_k), {k}\,=\,1,\,\.,\,|{T}|\,\-\,{n}\,+\,1, ��� {n}\,=\,|{P}|', 0, 3);
  TaskText('(����������� {H}_q({S}) ���� � \2, ����������� {T}^n_k \= � \4,', 0, 4);
  TaskText('������� �������� ���������� {H}_q({T}^n_k) \= � \1). ���� {H}_q({P})\,=\,{H}_q({T}^n_k),', 0, 5);
  TaskText('�� ������ {P}, \I��������\i, ������ � {T}, ������� � ������� {k}; � ���� ������', 0, 0);
  TaskText('���� �������� �������������� ��������� �������� � ������� ����� �������', 0, 0);
  TaskText('�� ������� ������������ �������� (������ \I������� ����������\i) ��� �� ���������', 0, 0);
  TaskText('������������� ������������� ���������. ������� ��������� ������� ����', 0, 0);
  TaskText('��������� ��������� {P} � {T} (� ������� �����������), ����� ���� �������������', 0, 0);
  TaskText('������� ����� ���������� ����������� ��������� �������� � ����������', 0, 0);
  TaskText('���������� ������ ����������.', 0, 0);
  c_init_ := '0';
  mm := 2;
  k0 := Random(5);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(2,n,qq);
  hp := H_(p,2,qq);
  ht := H_(Copy(t,1,n),2,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,2,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,0,5,4);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('���������:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  ResultN('���������� ������ ����������: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)



  SetTestCount(5);
end;

procedure Matching76;
var
  i: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {S} (|{S}|\,<\,10) � ����� {m} (1\,<\,{m}\,<\,10); ������� ������������ �����', 0, 1);
  TaskText('{m} ������ ���� (\<0\>, \<1\>, \<2\>,~\.). ����� {H}^m({S}) ������������ �����, ���������', 0, 2);
  TaskText('������������� �������� � {m}-����� ������� ��������� ��������� �� ������� {S}:', 0, 3);
  TaskText('{H}^m({S})\,=\,\E_{i=1}^{|S|}~{m}^{|S|-i}\*{d}({S}[{i}]), ��� {d}(\<0\>)\,=\,0, {d}(\<1\>)\,=\,1, {d}(\<2\>)\,=\,2,~\.~.', 0, 4);
  TaskText('����� {�}^m({S}), ��������� ����� �������:', 0, 5);
  TaskText('\[{H}({S})\,=\,(\.((({d}({S}[1])\*{m}\,+\,{d}({S}[2]))\*{m}\,+\,{d}({S}[3]))\*{m}\,+\,{d}({S}[4]))\.)\*{m}\,+\,{d}({S}[|{S}|]).\]', 0, 0);
  c_init_ := '0';
  mm := Rand(2,9);
  s := CreateStringD(mm, rand(5, 9));
  n := length(s);
  DataComment(Rule(4,length(s)),32,2);
  DataS('S = ',s,32,3);
  DataN('m = ',mm,37,4,1);
  ResultN('H^m(S) = ',H_(s,mm,0),32,3,1);
  SetTestCount(5);
end;

procedure Matching77;
var
  i,j,h,k0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {S} � ����� {q} � {m} (1\,<\,{m}\,\l\,10); ������� ������������ �����', 0, 1);
  TaskText('{m} ������ ����. ����� {H}^m_q({S}) ������������ �����, ������ {�}^m({S}) mod {q},', 0, 2);
  TaskText('��� {H}^m({S}) ���������� � \1, � \<mod\> ���������� �������� ������', 0, 3);
  TaskText('������� �� ������� ������. ����� {�}^m_q({S}), ��������� ������� ����� �������,', 0, 4);
  TaskText('� ������� �� ���� ��������� ��������� �� ����������� {m}\*({q}\,+\,{m}\,\-\,2):', 0, 5);
  TaskText('{H}^m_q({S})\,=\,((\.((({d}({S}[1])\*{m} mod {q}\,+\,{d}({S}[2]))\*{m} mod {q}\,+\,{d}({S}[3]))\*{m}', 0, 0);
  TaskText('mod {q}\,+\,{d}({S}[4]))\.)\*{m} mod {q}\,+\,{d}({S}[|{S}|])) mod {q}.', 0, 0);
  TaskText('������� ������������� ���������� ����������, ���������� ����� ������', 0, 0);
  TaskText('��������� ��������� �� {m}, � ����� ��������� �������� {H}^m_q({S}).', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  qq := GetQ_;
  s := CreateStringD(mm, rand(12, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('q = ',qq,xLeft,4,4);
  DataN('m = ',mm,xRight,4,1);
  h := H_(s,mm,qq);
  k0 := length(s)-1;
  if k0 > 20 then j := 1
  else
    j := 2;
  ResultComment('������������� ���������� ����������:',0,j);
  k0 := length(s)-1;
  for i := 1 to k0 do
    ResultN('',v_[i],Center((i-1)mod 10 + 1,10,4,1),(i-1) div 10 + j+1,4);
  ResultN('H^m_q(S) = ',h,0,5,4);
//  if h <> H_(s,mm,0) mod qq then
//  ResultN('',H_(s,mm,0) mod qq,90,1,1);
  SetTestCount(5);
end;

procedure Matching78;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {T}, ����� {n} (<\,|{T}|), {q} � {m} (1\,<\,{m}\,\l\,10); ������� ������������ �����', 0, 1);
  TaskText('{m} ������ ����. ����� ����, ���� �������� {H}^m_q({T}[1..{n}]) (��.~\1).', 0, 2);
  TaskText('����� � ������� �������� {H}^m_q({T}^n_k), {k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1 (����������� {T}^n_k ����������', 0, 3);
  TaskText('� \7). ��� ���������� {H}^m_q({T}^n_k) ������������ ������������ �������:', 0, 4);
  TaskText('{H}^m_q({T}^n_k)\,=\,({H}^m_q({T}^n_{k\-1})\*{m}\,\-\,{d}({T}[k\,\-\,1])\*({m}^n mod {q})\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1])\,+\,({m}\,\-\,1)\*{q}) mod {q}.', 0, 5);
  TaskText('��� ���������� {m}^n mod {q} ������������ �����, � ������� ������������� ����������', 0, 0);
  TaskText('�� ����������� {m}\*{q}: {m}^n mod {q} = {m}\*(\.(({m}\*({m} mod {q}) mod {q}))\.) mod {q}.', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  qq := GetQ_;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),mm,qq);
  DataN('n = ',n,xLeft,4,2);
  DataN('q = ',qq,xRight,4,4);
  DataN('m = ',m,xLeft,5,1);
  DataN('H^m_q(T[1..n]) = ',h0,xRight,5,4);
  ResultComment('�������� H^m_q(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(mm,n,qq);
//  cnt := 0;
  for i := 1 to 10 do
  begin
    h0 := H1_(s,mm,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
//    if h0 <> H_(Copy(s,i+1,n),mm,qq) then
//      cnt := cnt + 1;
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,mm,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;
(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),mm,qq),Center(i,10,6,1),5,6);
  end;
  if cnt <> 0 then
    ResultN('',1,90,1,1);
*)
  SetTestCount(5);
end;

procedure Matching79;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {P}, {T} � ����� {q} � {m} (1\,<\,{m}\,\l\,10); ������� ������������ ����� {m} ������', 0, 1);
  TaskText('����. ����� ��� ��������� {P} � {T} ��������� ������� \I������ ������������\i', 0, 2);
  TaskText('\I�����\:������\i (��.~\4), � ������� ����������� ������������� {H}^m_q({S})', 0, 3);
  TaskText('(��.~\2\:\1). ������� ��������� ������� ���� ���������', 0, 4);
  TaskText('��������� {P} � {T} (� ������� �����������), ����� ���� ������������� �������', 0, 5);
  TaskText('����� ���������� ��������� �������� � ���������� ���������� ������ ����������.', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  k0 := Random(5);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(mm,n,qq);
  hp := H_(p,mm,qq);
  ht := H_(Copy(t,1,n),mm,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,mm,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,xLeft,5,4);
  DataN('m = ',mm,xRight,5,1);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('���������:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  ResultN('���������� ������ ����������: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)



  SetTestCount(5);
end;

procedure Matching80;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('���� ������ {P}, {T} � ����� {q} � {m} (1\,<\,{m}\,\l\,26); ������� ������������ ����� {m} ������', 0, 1);
  TaskText('�������� ��������� ����. ����� ��� ��������� {P} � {T} ��������� �������', 0, 2);
  TaskText('\I������ ������������ �����\:������\i (��.~\5), � ������� �����������', 0, 3);
  TaskText('������������� {H}^m_q({S}) (��.~\3\:\2), ������ {d}(\<a\>)\,=\,0, {d}(\<b\>)\,=\,1,', 0, 4);
  TaskText('{d}(\<c\>)\,=\,2, \., {d}(\<k\>)\,=\,10, \.~. ������� ��������� ������� ���� ���������', 0, 5);
  TaskText('��������� {P} � {T} (� ������� �����������), ����� ���� ������������� �������', 0, 0);
  TaskText('����� ���������� ��������� �������� � ���������� ���������� ������ ����������.', 0, 0);
  c_init_ := 'a';
  mm := Rand(10,26);
  k0 := Random(5);
  repeat
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(mm,n,qq);
  hp := H_(p,mm,qq);
  ht := H_(Copy(t,1,n),mm,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,mm,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,xLeft,5,4);
  DataN('m = ',mm,xRight,5,2);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('���������:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('���������� ���������: ',cnt,0,4,3);
  ResultN('���������� ������ ����������: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)

  SetTestCount(5);
end;


procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Matching1;
  2: Matching2;
  3: Matching3;
  4: Matching4;
  5: Matching5;
  6: Matching6;
  7: Matching7;
  8: Matching8;
  9: Matching9;
  10: Matching10;
  11: Matching11;
  12: Matching12;
  13: Matching13;
  14: Matching14;
  15: Matching15;
  16: Matching16;
  17: Matching17;
  18: Matching18;
  19: Matching19;
  20: Matching20;
  21: Matching21;
  22: Matching22;
  23: Matching23;
  24: Matching24;
  25: Matching25;
  26: Matching26;
  27: Matching27;
  28: Matching28;
  29: Matching29;
  30: Matching30;
  31: Matching31;
  32: Matching32;
  33: Matching33;
  34: Matching34;
  35: Matching35;
  36: Matching36;
  37: Matching37;
  38: Matching38;
  39: Matching39;
  40: Matching40;
  41: Matching41;
  42: Matching42;
  43: Matching43;
  44: Matching44;
  45: Matching45;
  46: Matching46;
  47: Matching47;
  48: Matching48;
  49: Matching49;
  50: Matching50;
  51: Matching51;
  52: Matching52;
  53: Matching53;
  54: Matching54;
  55: Matching55;
  56: Matching56;
  57: Matching57;
  58: Matching58;
  59: Matching59;
  60: Matching60;
  61: Matching61;
  62: Matching62;
  63: Matching63;
  64: Matching64;
  65: Matching65;
  66: Matching66;
  67: Matching67;
  68: Matching68;
  69: Matching69;
  70: Matching70;
  71: Matching71;
  72: Matching72;
  73: Matching73;
  74: Matching74;
  75: Matching75;
  76: Matching76;
  77: Matching77;
  78: Matching78;
  79: Matching79;
  80: Matching80;

  end;
end;


procedure inittaskgroup;
begin
  CreateGroup('Match', '����� ��������',
    '�. �. �������, 2012', 'sdfghsdssfggddhkhhuytgrgfmm', 80, InitTask);
  CommentText('\P��� �������� �������� ������ � �������� �������� ������ � ����������������.');
  CommentText('���� �������� ������ ����� ��������� ������� ��������, �� �� ���� ����');
  CommentText('��������� � ������������ �������.');
  CommentText('\P��� �������� ��������� ������ �������� ���������. ������� �������� �');
  CommentText('������� ���������� �� 1. ����� ������ {S} ������������ ����� |{S}|; ����� �������� ����� � �������� �� ����������� 100.');
  CommentText('����� {S}[{i}..{j}] ������������ \I���������\i {S}, ������������ � ������� {i} �');
  CommentText('�������������� � ������� {j} (���� {i}\,>\,{j}, �� {S}[{i}..{j}] ��������� ������ �������).');
  CommentText('����� {S}[{i}], {i}\,=\,1,\,\.,\,|{S}|, ������������ \I������\i ������ {S}, ������������� � ������� {i}.');
  CommentText('\P��� ������ ���� ��������� ������-\I�������\i {P} (����. pattern) � ����� {T}');
  CommentText('����������� \I���������������\i ���������. ��������, ��� ������� {P}\,=\,\<aaa\>');
  CommentText('� ������ {T}\,=\,\<aaaaaa\> ���������� ��������� ��������� ����� 4');
  CommentText('(������� � ������� 1,~2, 3,~4 ������ {T}). ������ ��������������, ��� �����');
  CommentText('������� {P} �� ����������� ����� ������ {T}.');
  CommentText('\P��� \I���������\i \E ���������� ��������� ��������, � ������� ������');
  CommentText('��� ������� ��������������� �����. ���� ������� \E � ������� �� ����������,');
  CommentText('�� ��������������, ��� ������ ����� ��������� ����� �������, �������� �� �����������.');
  CommentText('\P��� �������� ��������� �������� ��������������, ��� ���������� �������� �����������');
  CommentText('�� \I����������� �����\i (��������, ��� ���������� ��������� ({i}\,<\,|{P}|) and ({P}[{i}]\,=\,{x})');
  CommentText('��������� �������� {P}[{i}] � {x} ����� ����������� ������ � ������, ���� ������� {i}\,<\,|{P}| �������� ��������).');
  CommentText('\P�������� ���������� ���������� �� ����� �.~�������� \<������, ������� � ������������������ � ����������:');
  CommentText('����������� � �������������� ��������\> (���.: ���-���������, 2003), �����~I.');
  Subgroup(Subgroup1);
  CommentText('\P� ������ ��������� ������� �������� ����������� �������, ��������� � ������� � ������ (\I���������\i, \I�������\i, \I�������\i),');
  CommentText('� ����������� ���������� ��������� ������ (��� ���������� \I������� ���������\i).');
  Subgroup(Subgroup2);
  CommentText('\P� ������ ��������� ��������������� ���� �� ��������� ��������������� ��������� (\I��������������\i) ������.');
  CommentText('�������� �������, ��������� � ��������������� ({Z}-����� � ��������� �������������� {Z}_i, {r}_i, {l}_i),');
  CommentText('� ����������� ������� �������� ��������������, ��� ������� ��� ��������� ������ {S} ��������� ����� ��������� ��������, �� ������������� 2|{S}|.');
  CommentText('\P������������� ������� �������������� ������������ ��� �������� ������ ���������� ������,');
  CommentText('������� �� ���������� \I�������� ���������������\i.');
  Subgroup(Subgroup4);
  CommentText('\P� ��������� ����������� ��������� ������ ��������, ������������ ������������� ����� �������� �������������.');
  CommentText('������ ��������� ��������� ��������� ����� \I�� �������� �����\i.');
  CommentText('��� ��������, ��� ��� ���������� ���� ���������');
  CommentText('������� {P} ����� {n} � ����� {T} ����� {m} ��������� ����� ��������� ��������,');
  CommentText('������� ������� {n}\,+\,{m}. ������� ��������, ��� ������� ��������');
  CommentText('�� ������������ ����� �� �������� �����, ��� ��� ��� ��� ����������');
  CommentText('����� ������������� ���������� ���������, ������� ������� {n}\*{m}.');
  CommentText('\P� �������� ������ ��������� \I�������� ��������� �����\i ������������ �������� \<+\>.');
  CommentText('��� ��������� ����� ����������� ������� �� ���������� (��������, ����������� �������� \<ab\>\,+\,\<cd\> �������� ������ \<abcd\>).');
  Subgroup(Subgroup5);
  CommentText('\P� ������ ��������� ����������� \I����� �����\:�������\:������\i (\I����� ���\i) � ��������� � ��� �������.');
  CommentText('����� ��� �������� ����� �� �������� ��������� ������� ���������� ������ ��������.');
  Subgroup(Subgroup6);
  CommentText('\P� ������ ��������� ����������� ��� �������� �������� �������������� ������� {P} ��� ������ �����\:�������\:������ (������ ���).');
  CommentText('������ ������� ���������� ������� ��������� �������������� ({Z}-�����),');
  CommentText('������ �������� \I������������ ��������������� ������ ���\i, ������������ �������� \I������������ ������\i.');
  Subgroup(Subgroup7);
  CommentText('\P����� ������ ������� {P} � ������ {T} ���������� \I������� ��������� �������\i, ���� �����');
  CommentText('�������� ����� ������� � {T} �� ������� �� ������� � ������� {P}. � ���������, ����� �����\:�������\:������');
  CommentText('(��� ��������, ��� � ����������������) \I�� ��������\i ������� ��������� �������, ��� ��� ��� ������������');
  CommentText('�������� {T}[{t}] � {P}[{p}] ����� ������������� ��������� ���� �� ������� {T}[{t}]');
  CommentText('� ����������� ������� ��������� ������� {P}. � ������ ��������� ������� ����������� ������� ������ ��������� �������');
  CommentText('(���� ����� ���������� ����� \I�������, ���������� �� ������������� ��������� ��������\i), � �������');
  CommentText('��� ������ ������� ������ {T} ����������� \I������������\i ��������.');
//  Subgroup(Subgroup10);
//  CommentText('\P� ������ ��������� ����������� �������� �������� �������������� ��� ������� ������ �� �������� ��������,');
//  CommentText('������������ ������� ��������� �������������� ({Z}-�����).');
  Subgroup(Subgroup11);
  CommentText('\P\I����� ������\:����\i ������������ ����� ���������� ������ ������ �� ������� ������� �');
  CommentText('������ �� �������� �������� � ��������, ������ � ������� �����\:�������\:������, ����� �� �������� ���������');
  CommentText('������� ���������� ������ ��������. ������������ ������� ������ �������� ��, ��� ��� ���');
  CommentText('���������� ��� ������ ��������� {P} � {T} ������ ����������� �����, ��� |{P}|\,+\,|{T}| ��������');
  CommentText('(��� ���������� \I����� �� ����������� �����\i).');
  Subgroup(Subgroup12);
  CommentText('\P� ������ ��������� ������� ��������������� \I������� ����� ������\i (\I����� Shift-And\i) \= ���� �� \I������������� ������� ������\i,');
  CommentText('���������� �� �� ��������� ��������, � �� ������� � �������������� ���������.');
  CommentText('��������������� ����� ��� �����������, ����������� ��������� \I����� �������� ���������\i.');
  Subgroup(Subgroup13);
  CommentText('\P� ������ ��������� ��������������� ��� ���� �� ������������� ���������� ������: \I����� ������������ �����\:������\i.');
  CommentText('���� ������ ����� ��������� ��� ���������� \I������ ����������\i, ��������, ��� ��� ���������� ������ ����� {q},');
  CommentText('������������� � ������, ����������� ��������� ������ ���������� ����� ������� ���������� �����.');

end;

//exports inittaskgroup, activate;

begin
end.
