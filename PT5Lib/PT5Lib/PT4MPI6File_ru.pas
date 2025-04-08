{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI6File_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  alphabet = '0123456789abcdefghijklmnopqrstuvwxyz';
  prcname = '������� %d: ';
  title1 = '��������� �������� ����-�����';
  title2 = '������������ �������� ����-�����';
  title3 = '��������� ���� �������� ������';


function RandomName(len: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to len do
    result := result + alphabet[Random(length(alphabet))+1];
end;

function Prc(n: integer): string;
begin
  result := Format(prcname, [n]);
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

var a: array[1..64] of integer;
    b, b1: array[1..64] of real;
    n, m, k: integer;

procedure MPIIO1;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����. � ������'#13#10
+'�� ����������� ��������� ���� ���������� �������� ���������, ���������������'#13#10
+'��� ���������� � ���� ��������, � ���������� ������ ���� ��������� (��������'#13#10
+'���������� ��~1). �������� � ���������� �������� � �������� ����� �����'#13#10
+'�������������. ��������� � ������ �������� ��������� ���������� �������'#13#10
+'��������� ������� MPI\_File\_read\_at, �������� �� ����� ������������ ��������'#13#10
+'� ���������� �������� � ������� �� � ��� �� �������. ��� �������� �������'#13#10
+'�������� � ��������� ���������� ������� ����� ���� ������������ �������'#13#10
+'MPI\_File\_get\_size, ���� ������������� ����������, ������������ � ���������'#13#10
+'���� MPI\_Status ������� MPI\_File\_read\_at.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,30);
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    k := RandomN(4,8);
    x1 := 1 + 40 * ((i+1) mod 2);
    x2 := x1;
    y1 := (i+1) div 2 + 1;
    y2 := (i+1) div 2 + 2;
    DataN(prc(i)+'(', k, x1, y1, 1);
    DataComment(')', x1+13, y1);
    ResultComment(prc(i), x2, y2);
    x1 := x1 + 12;
    x2 := x2 + 8;
    for j := 1 to k do
    begin
      k0 := RandomN(1, m + 5);
      x1 := x1 + 3;
      DataN(k0, x1, y1, 2);
      if k0<=m then
      begin
        x2 := x2 + 3;
        ResultN(a[k0], x2, y2, 2);
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO2;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(3,5);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. � ������ �� ����������� ���������'#13#10
+'���� ���������� ��� ����� ����� � ���� ����, � ������� ������ ���� �����'#13#10
+'����������� ������ ��������� ��������, � ������ \= �������� ����� ���������'#13#10
+'�������� (�������� ���������� ��~1, ��� ������ �������� � ��������� ���'#13#10
+'�������� �� 1 �� ���������� ������ �����). ������� ����� ���� ����� �����'#13#10
+'� ��������� ������ � �������� � ���� ������ ��������, ��������� � ������'#13#10
+'����������� �������� ��������� ���������� �������'#13#10
+'��������� ������� MPI\_File\_write\_at.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[i] := RandomN(4,7);
    m := m + k0[i];
  end;
  for i := 1 to m do
  begin
    a[i] := RandomN(10,99);
    p[i] := i;
  end;
  for i := 1 to 2 * m do
    SwapN(p[RandomN(1, m)], p[RandomN(1, m)]);
  j0 := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i + 1;
    DataN(prc(i)+'(', k0[i], x1, y1, 1);
    DataComment(')', x1 + 13, y1);
    x1 := x1 + 9;
    for j := 1 to k0[i] do
    begin
      x1 := x1 + 7;
      DataN('', p[j0+j], x1, y1, 2);
      x1 := x1 + 2;
      DataN(' - ', a[p[j0+j]], x1, y1, 2);
    end;
    j0 := j0 + k0[i];
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO3;
var
  i, j, j0, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����,'#13#10
+'����������� �������� ������������� ������� ������� {K}~\x~{N}, ��� {K} \= �����'#13#10
+'����������� ���������. � ������ ����������� �������� �������� � �������'#13#10
+'�������� {R}-� ������ �������, ��� {R} \= ���� ������������ �������� (������'#13#10
+'���������� ��~1), ��������� ���� ����� ��������� ������� MPI\_File\_read\_at.'#13#10
+'��� ����������� ������� ����� ������������ ������� MPI\_File\_get\_size.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 3);
  k := RandomN(5,10);
  m := k * (n - 1);
  j0 := 0;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x2 := 5;
    y2 := i;
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 4;
    for j := 1 to k do
    begin
      x2 := x2 + 6;
      ResultR(b[j+j0], x2, y2, 6);
    end;
    j0 := j0 + k;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(k);
  DataFileR(s,4,6);
end;

procedure MPIIO4;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����, � ������ �� ����������� ���������'#13#10
+'���� {R} ������������ �����, ��� {R} \= ���� ��������. ������� ����� ����'#13#10
+'������������ ����� � ��������� ������ � �������� � ���� ������ ��������'#13#10
+'� ������� ����������� ������ ���������� �� ���������. ������������ � ������'#13#10
+'����������� �������� ���� ����� ��������� ������� MPI\_File\_write\_at.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 5;
    for j := 1 to i do
    begin
      x1 := x1 + 5;
      m := m + 1;
      b[m] := RandomR(1,9.99);
      DataR('', b[m], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO5;
var
  i, j, k0, kmax, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����. ���� �����������'#13#10
+'�������� ��� ����� ����� � ��������� �� 1 �� {K}, ��� {K} \= ������������ ����'#13#10
+'��������. � ������ ����������� �������� �������� � ������� ��� ���������'#13#10
+'�������� ������: ������ �������� \I���������\i ����� ��������� �� �������'#13#10
+'��������, ������� ����� �������� (������� ���� �������), ������ ��������'#13#10
+'\I�����������\i ����� �������� ��������� � ����� ��� �� ������, ��� � ������'#13#10
+'��������. �������� � ������ ��������� ��������� � ������� �� ����������'#13#10
+'� �����. ������������ � ������ ����������� �������� ����������� ����������'#13#10
+'������� ��������� ������� MPI\_File\_read (��� ���������� ��������), � �����'#13#10
+'������ ������� MPI\_File\_get\_position ��� ����������� ������� ������� ���������'#13#10
+'� MPI\_File\_seek � ���������� MPI\_SEEK\_END ��� �����������'#13#10
+'� ������ ������� ���������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,20);
  repeat
  for i := 1 to 9 do
    a[i] := i;
  for i := 9 to m do
    a[i] := RandomN(1,9);
  for i := 1 to 2 * m do
    SwapN(a[RandomN(1, m)], a[RandomN(1, m)]);
  kmax := 0;
  for i := 1 to n - 1 do
  begin
    k0 := 0;
    for j := 1 to m do
      if a[j] = i then
      begin
        k0 := j;
        break;
      end;
    if k0 > kmax then
      kmax := k0;
  end;
  until kmax <= 15;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    k := 0;
    x2 := 5;
    y2 := i;
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 8;
    k := 1;
    while a[k] <> i do
    begin
      x2 := x2 + 2;
      ResultN(a[k], x2, y2, 2);
      k := k + 1;
    end;
    x2 := x2 + 2;
    ResultN(a[k], x2, y2, 2);
    x2 := 14 + kmax*2;
    for j := 1 to k do
    begin
      x2 := x2 + 2;
      ResultN(a[m-k+j], x2, y2, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO6;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����, � ������ �� ����������� ��������� ����'#13#10
+'����� �����. ������� ����� ���� ����� ����� � ��������� ������ � ��������'#13#10
+'� ���� {K} ������ ������ ����� ������� �����, ��� {K} ����� ����������'#13#10
+'����������� ���������. ������� ���������� ����� � ����� ������ ���� ��������'#13#10
+'������� ����������� ��������� ({K} ����� ����� �� �������� 1 ������ ����������'#13#10
+'� ����� �����, ����� ���� ������ ������������� {K} ����� ����� �� �������� 2,'#13#10
+'�~�.\,�.). ������������ � ������ ����������� �������� ���� ����� ���������'#13#10
+'������� MPI\_File\_write, � ����� ������� MPI\_File\_seek'#13#10
+'� ���������� MPI\_SEEK\_SET.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[n-i] := RandomN(10,99);
    for j := 1 to n-1 do
    begin
      m := m + 1;
      a[m] := k0[n-i];
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 14 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataN(prc(i), k0[i], x1, y1, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO7;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����. ��������,'#13#10
+'��� ����� �������� ���� �������� ��������� ����������� {K}, ��� {K} \= ����������'#13#10
+'����������� ���������. � ������ ����������� �������� ��������� ���������'#13#10
+'�������� �����, ���� ����� �� �������� �� �������� ���� ��������, ����� ����'#13#10
+'������� ��������� ����� {S} � ���������� {N} ����������� �����. ����� �����'#13#10
+'������������� �������� � ������� �������� {N} \I���������\i �������� ���������'#13#10
+'(� ������� �� ���������� � �����). ������������ � ������ ����������� ��������'#13#10
+'����������� ���������� ������� ��������� ������� MPI\_File\_read (��� ����������'#13#10
+'��������), � ����� ������ ������� MPI\_File\_get\_position ��� ����������� {N}'#13#10
+'� MPI\_File\_seek � ���������� MPI\_SEEK\_END ��� ����������� � ������ ���������'#13#10
+'�� {N} ��������� �������� ���������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15,20);
  repeat
  bmax := 0;
  k := 30;
  for i := 1 to m do
    b[i] := RandomR(0.3, 1.3);
  for i := 1 to m do
  begin
    bmax := bmax + b[i];
    if bmax > n-1 then
    begin
      k := i;
      break;
    end;
  end;
  until k < 10;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    sum := 0;
    x2 := 5;
    y2 := i;
    ResultComment(prc(i), x2, y2);
    k := 1;
    sum := b[1];
    while sum <= i do
    begin
      k := k + 1;
      sum := sum + b[k];
    end;
    x2 := x2 + 12;
    ResultR('S = ', sum, x2, y2, 4);
    x2 := x2 + 10;
    ResultN('N = ', k, x2, y2, 1);
    x2 := x2 + 2;
    for j := 1 to k do
    begin
      x2 := x2 + 5;
      ResultR(b[m-k+j], x2, y2, 4);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO8;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0: array[1..50] of real;
begin
  n := RandomN(5,9);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����, � ������ �� ����������� ��������� ����'#13#10
+'������������ �����. ������� ����� ���� ������������ ����� � ��������� ������'#13#10
+'� �������� � ���� {R} ������ ������ ����� ������� �����, ��� {R} ����� �����'#13#10
+'��������, � ������� ���� ��� �����. ������� ���������� ����� � ����� ������'#13#10
+'���� \I��������\i ������� ����������� ��������� (� ����� ����� ������ ����������'#13#10
+'������������ ����� �� ��������~1, ����� ��� ������ ������������� ��� �����'#13#10
+'����� �� ��������~2, � �.\,�.). ������������ � ������ ����������� ��������'#13#10
+'���� ����� ��������� ������� MPI\_File\_write, � ����� ������� MPI\_File\_seek'#13#10
+'� ���������� MPI\_SEEK\_SET.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 0;
  for i := 1 to n-1 do
  begin
    k0[n-i] := RandomR(10,99.99);
    for j := 1 to n-i do
    begin
      m := m + 1;
      b[m] := k0[n-i];
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 12 + 41 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataR(prc(i), k0[i], x1, y1, 5);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO9;
var
  i, j, k0, kmax, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(5,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����. � ������ ��������'#13#10
+'�������� � ������� {R}~+~1 ������� �����, ������� � �������� � ������� {R}~+~1,'#13#10
+'��� ����� {R} ����� ����� �������� (0, 1,~\.). �������� �������� ����������'#13#10
+'��~1; ����� �������, � �������� ����� 0 ��������� �������� � ������� ������'#13#10
+'��������� �������� �������, � �������� ����� 1 \= ��� ��������� ��������'#13#10
+'��������, � �������� ����� 2 \= ��� ��������, ������� � ��������, �~�.\,�.'#13#10
+'���� ���� �������� ������������� ���������� ���������, �� � ���������'#13#10
+'��������� ����� ���������� ��������� ����� ���� ������ ����������.'#13#10
+'������������ ���� ����� ������������ ������� MPI\_File\_read\_all, � �����'#13#10
+'������� MPI\_File\_seek � ���������� MPI\_SEEK\_SET � ������� MPI\_File\_get\_size'#13#10
+'��� ����������� ������� ��������� �����.'#13#10
+'\P\S����������.\s � ���������� MPICH2 ������~1.3 ������� MPI\_File\_read\_all'#13#10
+'�� ��������� ���������� ���������� ���������� ��������� �������� ���������'#13#10
+'�� ������ ����������, ������������ � ��������� ���� MPI\_Status: � ����'#13#10
+'��������� ���������� ����������� ��������� ������ ����� ����������,'#13#10
+'� ��� ������������� ���������� �������� ��������� � ����������� �����'#13#10
+'��������� ������� ������������ ������� ��������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 3);
  m := RandomN(n, 3*n);
  case CurrentTest of
  3: m := n + RandomN(0,2);
  4: m := 2 * n + RandomN(1, 5);
  end;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x2 := 1 + 40 * (i mod 2);
    y2 := i div 2 + 1;
    ResultComment(prc(i), x2, y2);
    x2 := x2 + 8;
    for j := 1 to i + 1 do
    if i + j <= m then
    begin
      x2 := x2 + 3;
      ResultN(a[i + j], x2, y2, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,4,3);
end;

procedure MPIIO10;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  p,k0: array[1..50] of integer;
begin
  n := RandomN(5,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����, � ������ �� ����������� ��������� ��� �����'#13#10
+'�� {R} ����� �����, ��� {R} \= ���� �������� (1, 2,~\.). ������� ����� ����'#13#10
+'����� ����� � ��������� ������ � �������� � ���� ��� ������ ����� � �������'#13#10
+'�� ���������� (�������� ������������ � ������� ����������� �� ������).'#13#10
+'������������ ���� ����� ������������ ������� MPI\_File\_write\_all (��� ����'#13#10
+'���������, � ��� ����� � ��� �������� �����~0), � ����� ������� MPI\_File\_seek'#13#10
+'� ���������� MPI\_SEEK\_SET.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n * (n - 1) div 2;
  for i := 1 to m do
  begin
    a[i] := RandomN(10,99);
  end;
  k := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 8;
    for j := 1 to i do
    begin
      k := k + 1;
      x1 := x1 + 3;
      DataN(a[k], x1, y1, 2);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO11;
var
  i, j, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����.'#13#10
+'����� ����, � ������ �������� ���� ����� �����, ������ ����~0,'#13#10
+'���� ����������� ������ ������ �� ������������ �������� ���������'#13#10
+'(�������� ���������� ��~1). ��������� ������� MPI\_Comm\_split, �������'#13#10
+'����� ������������, ���������� ������ �� ��������, � ������� ���� �����,'#13#10
+'�������� ��~0, � � ������� ������������ ������� MPI\_File\_read\_at\_all'#13#10
+'�������� � ������� � ������ �������� �� ����� ������������� �������,'#13#10
+'������������� � ������� � ��������� ���������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(1, m);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k := k + 1;
    SetProcess(i-1);
    case k mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (k-1) div 3 + 2;
    ResultR(prc(i-1), b[k0[i]], x1, y1, 5);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO12;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0,k1: array[1..50] of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����.'#13#10
+'����� ����, � ������ �������� ���� ����� �����, ������ ����~0,'#13#10
+'���� ����������� ������ ������ �� ������������ �������� ���������'#13#10
+'(�������� ���������� ��~1). ��������� ������� MPI\_Comm\_split, �������'#13#10
+'����� ������������, ���������� ������ �� ��������, � ������� ���� �����,'#13#10
+'�������� ��~0, � � ������� ������������ ������� MPI\_File\_write\_at\_all'#13#10
+'�������� �������� �������� ��������� �������� � ������� � ���������'#13#10
+'���������� ������� �� �������� ����� �������� � ����� �������������'#13#10
+'(������������ ���� � ������������ �����).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to m do
    k1[i] := 1;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      repeat
        k0[i] := RandomN(1, m);
      until k1[k0[i]] = 1;
      k1[k0[i]] := 0;
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  b1 := b;
  AssignFile(f, s);
  Rewrite(f);
  k := -1;
  for i := 1 to n do
    if k0[i] > 0 then
    begin
      k := k + 1;
      b1[k0[i]] := k;
    end;
  for i := 1 to m do
    write(f, b1[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO13;
var
  i, j, k1, k2, k3, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����. ����� ����,'#13#10
+'� ������ �������� ���� ����� �����, ������ ���� 0, ����~1. ���������'#13#10
+'������� MPI\_Comm\_split, ������� ����� ������������, ���������� ������'#13#10
+'�� ��������, � ������� ���� �����~1, � � ������� ������������ �������'#13#10
+'MPI\_File\_read\_ordered �������� � ������� � ������ �������� �� �����'#13#10
+'������������� {R}~+~1 ������� ��������� �����, ��� {R} \= ���� ��������'#13#10
+'� ����� ������������� (�������� ����������� ���������������: ���� �������'#13#10
+'� ��������~0, ��� ��������� �������� \= � ��������~1, ��� ��������� \='#13#10
+'� ��������~2, � �.\,�.). ���� ���� �������� ������������� ���������� ���������,'#13#10
+'�� � ��������� ��������� ����� ���������� ��������� {N} ����� ���� ������'#13#10
+'���������� ��� ���� ����� ����. � ������ ��������, �������� � �����'#13#10
+'������������, ������������� ������� ���������� {N} ���������� �����������'#13#10
+'��������� � ����� �������� {P} ������������� ��������� ���������.'#13#10
+'��� ����������� ���������� ����������� ��������� {N} ������������ ����������,'#13#10
+'������������ � ��������� ���� MPI\_Status ������� MPI\_File\_read\_ordered,'#13#10
+'��� ���������� �������� {P} ������������ ������� MPI\_File\_get\_position\_shared'#13#10
+'(�� ���� ��������� �������� {P} ������ ���� ����������).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  if RandomN(0,1) = 0 then
  m := RandomN(4,8)
  else
  m := RandomN(15, 20);
  case CurrentTest of
  3: m := RandomN(4,5);
  4: m := RandomN(15,20);
  end;
  for i := 1 to 20 do
    a[i] := 0;
  for i := 1 to m do
    a[i] := RandomN(10, 99);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := 1;
      k := k + 1;
    end;
  until (k > 2) and (k < 6) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k1 := 0;
  k2 := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k1 := k1 + 1;
    SetProcess(i-1);
    x2 := 14;
    y2 := k1;
    ResultComment(prc(i-1), x2, y2);
    x2 := x2 + 8;
    k3 := 0;
    for j := 1 to k1 do
    begin
      x2 := x2 + 3;
      k2 := k2 + 1;
      if a[k2] > 0 then
      begin
      k3 := k3 + 1;
      ResultN(a[k2], x2, y2, 2);
      end;
    end;
    x2 := 42;
    ResultN('N = ', k3, x2, y2, 1);
    x2 := 50;
    ResultN('P = ', k*(k+1) * 2, x2, y2, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO14;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(4,9);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ���� �����'#13#10
+'����� {N}. ������� ����� ���� ����� ����� � ��������� ������. ��������� �������'#13#10
+'MPI\_Comm\_split, ������� ����� ������������, ���������� ������ �� ��������,'#13#10
+'� ������� ����� {N} �� ����� 0, � � ������� ������������ �������'#13#10
+'MPI\_File\_write\_ordered �������� � ���� {K} ������ ������ ����� �������'#13#10
+'�� ����� {N}, ��� {K} ����� ���������� ��������� � \I�����\i �������������, � �����'#13#10
+'������������� � ������� ����������� ������ ���������� �� ���������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  repeat
  k := 0;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(10, 99);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  AssignFile(f, s);
  Rewrite(f);
  j0 := 0;
  for i := 1 to n do
    if k0[i] > 0 then
    for j := 1 to k do
    begin
      j0 := j0 + 1;
      a[j0] := k0[i];
    end;
  for i := 1 to j0 do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO15;
var
  i, j, k1, k2, x1, x2, y1, y2: integer;
  k0: array[1..10] of integer;
  s: string;
  sum, bmax: real;
  f: file of real;
begin
  n := RandomN(6,10);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����, �����������'#13#10
+'�� ����� {K} ���������, ��� {K} \= ���������� ���������. � ������� �������'#13#10
+'MPI\_Comm\_split ������� ����� ������������, ���������� ������ ��������'#13#10
+'� �������� ������ (1, 3,~\.). ��������� �� ������ ������ ������������'#13#10
+'������� MPI\_File\_seek\_shared � MPI\_File\_read\_ordered, �������� � �������'#13#10
+'� ������ �������� �� ������ ������������� �� 2 �������� ��������� �����,'#13#10
+'������ ������������� � ��������� �������� �������� ������ �����������'#13#10
+'� ���������� (� ��������� �������) � �������� � ������ 1 � ��������'#13#10
+'������������� MPI\_COMM\_WORLD, ��������� � ������ � ����� �������� \='#13#10
+'� �������� � ������ 3, � �.\,�.'#13#10
+'\P\S��������.\s ��� ���� ����� ���������� ��������� ������� ���������� ������'#13#10
+'� ������� MPI\_File\_read\_ordered, ���������� �������� � ��������� �������������'#13#10
+'������� ���������� ��������� �� ��������������� (�� ���������'#13#10
+'� �������� �������� � ������������� MPI\_COMM\_WORLD).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(2*n, 2*n + 5);
  for i := 1 to m do
    b[i] := RandomR(10, 99.99);
  repeat
  k := 0;
  for i := 1 to n do
    if Odd(i){RandomN(0,1) = 0} then
      k0[i] := 0
    else
    begin
      k0[i] := 1;
      k := k + 1;
    end;
  until (k > 2) and (k < 6) and (k < n);
  for i := 1 to n do
  begin
//    SetProcess(i-1);
    case i mod 3 of
    0: x1 := xRight;
    1: x1 := xLeft;
    2: x1 := 0;
    end;
    y1 := (i-1) div 3 + 2;
//    DataN(prc(i-1), k0[i], x1, y1, 2);
  end;
  k1 := m + 1;
  k2 := 0;
  for i := 1 to n do
  if k0[i] > 0 then
  begin
    k1 := k1 - 2;
    k2 := k2 + 1;
    SetProcess(i-1);
    y2 := k2;
    ResultR2(prc(i-1), b[k1], b[k1+1], 0, y2, 6);
    x2 := x2 + 8;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO16;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0,k1: array[1..50] of integer;
begin
  n := RandomN(5,8);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ����'#13#10
+'����� ����� {N} (\g\,0) � {N} ������������ �����. ������� ����� ���� ������������'#13#10
+'����� � ��������� ������. ��������� ������� MPI\_Comm\_split, ������� �����'#13#10
+'������������, ���������� ������ �� ��������, � ������� ����� {N} �� �����~0,'#13#10
+'� � ������� ������������� ������ ������������ ������� MPI\_File\_write\_ordered'#13#10
+'�������� � ���� ��� ������������ ����� � �������, \I��������\i �� ����������'#13#10
+'� ������ �������� ������: ������� ������������ (� �������� �������) ��� �����'#13#10
+'�� �������� � ���������� ������ � ������������� MPI\_COMM\_WORLD, �����'#13#10
+'��� ����� �� �������� � ���������� ������, � �.\,�.'#13#10
+'\P\S��������.\s ��� ���� ����� ���������� ��������� ������� ������ ������ � �������'#13#10
+'MPI\_File\_write\_ordered, ���������� �������� � ��������� ������������� �������'#13#10
+'���������� ��������� �� ��������������� (�� ��������� � �������� ��������'#13#10
+'� ������������� MPI\_COMM\_WORLD).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := RandomN(15, 20);
  for i := 1 to m do
    b[i] := RandomR(1, 9.99);
  repeat
  k := 0;
  for i := 1 to m do
    k1[i] := 1;
  for i := 1 to n do
    if RandomN(0,1) = 0 then
      k0[i] := 0
    else
    begin
      k0[i] := RandomN(1, 4);
      k := k + 1;
    end;
  until (k > 2) and (k < n);
  k := 0;
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+ 'N = ', k0[i], x1, y1, 1);
    x1 := x1 + 13;
    for j := 1 to k0[i] do
    begin
      k := k + 1;
      x1 := x1 + 5;
      DataR(b[k], x1, y1, 4);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to k do
    write(f, b[k-i+1]);
  CloseFile(f);
  ResultFileR(s,3,5);
end;

procedure MPIIO17;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(6,10);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����, �����������'#13#10
+'2{K} ���������, ��� {K} \= ���������� ���������. ��������� ������������ �����'#13#10
+'������������ ������� MPI\_File\_read\_all (� �� �������� ������� MPI\_File\_seek),'#13#10
+'�������� � ������� �� 2 �������� � ������ ��������, ��������� ��������'#13#10
+'� ������� �� ���������� � �����. ��� ����� �������������� � ������� �������'#13#10
+'MPI\_File\_set\_view ���������� ����� ��� ������ � ������� ����� MPI\_INT,'#13#10
+'����� �� �������� ����� � ���������� ��������� (����� ��� ������� ��������).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 2*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    ResultN2(prc(i-1), a[2*i-1], a[2*i], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO18;
var
  i, j, j0, i0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����, �����������'#13#10
+'�������� ������������� ������� ������� {K}~\x~5, ��� {K} \= ���������� ���������.'#13#10
+'����� ����, � ������ �������� ���� ����� ����� {N} (1~\l~{N}~\l~5) \= ����������'#13#10
+'����� \I�����������\i �������� � ��������� ������ ������� (�������� � ������'#13#10
+'���������� ��~1), ������ � ��������� ����� 0 ����������� ������ ������'#13#10
+'�������, � ��������� ����� 1 \= ������ ������, � �.\,�. ��������� ������������'#13#10
+'����� ������������ ������� MPI\_File\_write\_at\_all �� ������ ����������,'#13#10
+'������ {N}~\-~1, �������� � ������ ������ �������� ������� ���������� �������,'#13#10
+'������� ��� �������� �� ���� ���������� � ��� �������� (���������� �������'#13#10
+'� ������ ������ ������� �������� �� 0, �� ������ ������ \= �� 1, � �.\,�.).'#13#10
+'��� ����� �������������� � ������� ������� MPI\_File\_set\_view ���������� �����'#13#10
+'��� ������ � ������� ����� MPI\_INT, ����� �� �������� ����� � ����������'#13#10
+'��������� (����� ��� ������� ��������).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 5*n;
  for i := 1 to n do
  begin
    k0[i] := RandomN(1,5);
  end;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
//    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+'N = ', k0[i], x1, y1, 1);
  end;
  AssignFile(f, s);
  Rewrite(f);
  k := 0;
  for i := 1 to n do
    for j := 1 to 5 do
    begin
      k := k + 1;
      i0 := i - 1;
      if j <> k0[i] then
        write(f, a[k])
      else
        write(f, i0);
    end;
  CloseFile(f);
  SetFileRow(5);
  ResultFileN(s,3,3);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,5,3);
end;

procedure MPIIO19;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  k0: array[1..50] of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����,'#13#10
+'����������� �������� ������������� ������� ������� {K}~\x~6, ��� {K} \= ����������'#13#10
+'���������. ����� ����, � ������ �������� ���� ����� ����� {N} (1~\l~{N}~\l~6) \='#13#10
+'���������� ����� \I�����������\i �������� � ��������� ������ ������� (��������'#13#10
+'� ������ ���������� ��~1), ������ � ��������� ����� 0 ����������� ���������'#13#10
+'������ �������, � ��������� ����� 1 \= ������������� ������, �~�.\,�. ���������'#13#10
+'������������ ����� ������������ ������� MPI\_File\_read\_at\_all �� ������'#13#10
+'����������, ������ {N}~\-~1, �������� � ������ ������ �������� ������� ����������'#13#10
+'������� � ������� ��� �������� � ��������������� �������� (���������� �������'#13#10
+'� ������ ������ ������� ������� � ��������� ��������, �� ������ ������ \='#13#10
+'� ������������� ��������, �~�.\,�.). ��� ����� �������������� � ������� �������'#13#10
+'MPI\_File\_set\_view ���������� ����� ��� ������ � ������� ����� MPI\_DOUBLE,'#13#10
+'����� �� �������� ����� � ���������� ��������� (����� ��� ������� ��������).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n * 6;
  for i := 1 to n do
  begin
    k0[i] := RandomN(1,6);
  end;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN(prc(i-1)+'N = ', k0[i], x1, y1, 1);
    ResultR(prc(i-1), b[(n-i)*6+k0[i]], x1, y1, 5);

  end;
  SetFileRow(6);
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,5,6);
end;

procedure MPIIO20;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ��� �����'#13#10
+'�� {R}~+~1 ������������� �����, ��� {R} \= ���� �������� (0, 1,~\.). �������'#13#10
+'����� ���� ������������ ����� � ��������� ������. ��������� ������������ �����'#13#10
+'������������ ������� MPI\_File\_write\_all (� �� �������� ������� MPI\_File\_seek),'#13#10
+'�������� � ���� ��� ������ ����� � �������, �������� �� ���������� � ��������'#13#10
+'������: ������� ������������ (� �������� �������) ��� ����� �� ��������'#13#10
+'� ���������� ������, ����� ��� ����� �� �������� � ���������� ������, � �.\,�.'#13#10
+'��� ����� �������������� � ������� ������� MPI\_File\_set\_view ���������� �����'#13#10
+'��� ������ � ������� ����� MPI\_DOUBLE, ����� �� �������� �����'#13#10
+'� ���������� ��������� (����� ��� ������� ��������).'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := n*(n+1) div 2;
  j0 := m;
  for i := 1 to n do
  begin
    j0 := j0 - i;
    SetProcess(i-1);
    x1 := 1 + 38 * ((i+1) mod 2);
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 5;
    for j := i downto 1 do
    begin
      x1 := x1 + 5;
      b[j0+ j] := RandomR(1,9.99);
      DataR('', b[j0+j], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
      write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO21;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(6,10);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����, �����������'#13#10
+'3{K} ���������, ��� {K} \= ���������� ���������. � ������ �������� ��������'#13#10
+'� ������� ��� �������� {A}, {B}, {C}, ������������� � �������� ����� � ���������'#13#10
+'������� (������ ��������� ���� ��������): {A}_0, {A}_1,~\., {A}_{K-1}, {B}_0, {B}_1,~\.,'#13#10
+'{B}_{K-1}, {C}_0, {C}_1,~\., {C}_{K-1}. ��� ����� ������������ ������������ �����'#13#10
+'������������ ������� MPI\_File\_read\_all, �������������� ��������� �����'#13#10
+'�������� ��� ������ � ������� ����� MPI\_INT, ���������� ���������'#13#10
+'(����� ��� ������� ��������) � ����� �������� �����, ���������'#13#10
+'�� ������ �������������� �������� � ������������ ������� ����������,'#13#10
+'������ �������� ����� ������������� ������ �� {K}~\-~1 ������ �����.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 3*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 0;
    ResultN3(prc(i-1), a[i], a[n + i], a[2*n + i], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  DataFileN(s,3,3);
end;

procedure MPIIO22;
var
  i, j, j0, i0, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  k0: array[1..50] of integer;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ����'#13#10
+'�� 3 ����� �����: {A}, {B}, {C}. ���������� ��������� ����� {K}. ������� ����� ����'#13#10
+'����� ����� � ��������� ������ � �������� � ���� �������� ����� � ���������'#13#10
+'������� (������ ��������� ���� ��������): {A}_{K-1}, {A}_{K-2},~\., {A}_0, {B}_{K-1},'#13#10
+'{B}_{K-2},~\., {B}_0, {C}_{K-1}, {C}_{K-2},~\., {C}_0. ��� ����� ������������ ������������ �����'#13#10
+'������������ ������� MPI\_File\_write\_all, �������������� ��������� �����'#13#10
+'�������� ��� ������ � ������� ����� MPI\_INT, ���������� ���������'#13#10
+'(����� ��� ������� ��������) � ����� �������� �����, ���������'#13#10
+'�� ������ �������������� �������� � ������������ ������� ����������,'#13#10
+'������ �������� ����� ������������� ������ �� {K}~\-~1 ������ �����.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 3*n;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
    if Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataN3(prc(i-1), a[n-i+1], a[2*n - i + 1], a[3*n - i + 1], x1, y1, 3);
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  ResultFileN(s,3,3);
end;

procedure MPIIO23;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����,'#13#10
+'����������� 6{K} ���������, ��� {K} \= ���������� ���������. � ������ ��������'#13#10
+'�������� � ������� ����� ��������� {A}, {B}, {C}, {D}, {E}, {F}, ������������� � ��������'#13#10
+'����� � ��������� ������� (������ ��������� ���� ��������): {A}_0, {B}_0, {C}_0, {A}_1,'#13#10
+'{B}_1, {C}_1,~\., {A}_{K-1}, {B}_{K-1}, {C}_{K-1}, {D}_0, {E}_0, {F}_0, {D}_1, {E}_1, {F}_1,~\., {D}_{K-1}, {E}_{K-1}, {F}_{K-1}.'#13#10
+'��� ����� ������������ ������������ ����� ������������ �������'#13#10
+'MPI\_File\_read\_all, �������������� ��������� ����� �������� ��� ������'#13#10
+'� ������� ����� MPI\_DOUBLE, ���������� ��������� (����� ��� ������� ��������)'#13#10
+'� ����� �������� �����, ��������� �� ���� ������������ ���������'#13#10
+'� ������������ ������� ���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 6*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 17;//1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := i;//(i+1) div 2 + 0;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 - 7;
    for j := 0 to 1 do
    begin
    x1 := x1 + 18;
    ResultR3(b[3*i-2+j*3*n], b[3*i-1+j*3*n], b[3*i+j*3*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  DataFileR(s,3,6);
end;

procedure MPIIO24;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ����'#13#10
+'�� 4 ������������ �����: {A}, {B}, {C}, {D}. ���������� ��������� ����� {K}. �������'#13#10
+'����� ���� ������������ ����� � ��������� ������ � �������� � ���� ��������'#13#10
+'����� � ��������� ������� (������ ��������� ���� ��������): {A}_{K-1}, {B}_{K-1}, {A}_{K-2},'#13#10
+'{B}_{K-2},~\., {A}_0, {B}_0, {C}_{K-1}, {D}_{K-1}, {C}_{K-2}, {D}_{K-2},~\., {C}_0, {D}_0. ��� ����� ������������'#13#10
+'������������ ����� ������������ ������� MPI\_File\_write\_all, ��������������'#13#10
+'��������� ����� �������� ��� ������ � ������� ����� MPI\_DOUBLE, ����������'#13#10
+'��������� (����� ��� ������� ��������) � ����� �������� �����,'#13#10
+'��������� �� ���� ������������ ��������� � ������������ �������'#13#10
+'���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 4*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 - 1;
    for j := 0 to 1 do
    begin
    x1 := x1 + 12;
    DataR2(b[2*(n-i+1)-1+j*2*n], b[2*(n-i+1)+j*2*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  ResultFileR(s,3,6);
end;

procedure MPIIO25;
var
  i, j, j0, j1, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � �������� ����� {R}'#13#10
+'({R}~=~0, 1,~\., {K}~\-~1, ��� {K} \= ���������� ���������) ���� 3\*({R}~+~1) �����'#13#10
+'�����: � �������� 0 ���� 3 ����� {A}, {B}, {C}, � �������� 1 \= 6 ����� {A}, {A}�, {B}, {B}�,'#13#10
+'{C}, {C}�, � �������� 2 \= 9 ����� {A}, {A}�, {A}��, {B}, {B}�, {B}��, {C}, {C}�, {C}��, � �.\,�.'#13#10
+'������� ����� ���� ����� ����� � ��������� ������ � �������� � ���� ��������'#13#10
+'����� � ��������� ������� (������ ��������� ���� ��������): {A}_0, {A}_1, {A}�_1, {A}_2,'#13#10
+'{A}�_2, {A}��_2,~\., {B}_0, {B}_1, {B}�_1, {B}_2, {B}�_2, {B}��_2,~\.~. ��� ����� ������������'#13#10
+'������������ ����� ������������ ������� MPI\_File\_write\_all, ��������������'#13#10
+'��������� ����� �������� ��� ������ � ������� ����� MPI\_INT, ����������'#13#10
+'��������� (����� ��� ������� ��������) � ����� �������� �����'#13#10
+'(����� ��� ������� ��������), ��������� �� {R}~+~1 ������ ��������'#13#10
+'� ������������ ������� ���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 1, 1);
  m := (3*n + 3)*n div 2;
  for i := 1 to m do
    a[i] := RandomN(10,99);
  k := (1 + n)*n div 2;
  for i := 1 to 3 do
  begin
    SetProcess(i-1);
    case i of
    1: x1 := 41;
    2: x1 := 1;
    3: x1 := 41;
    end;
//    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    if i = 1 then y1 := 1
    else
      y1 := 2;//(i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 7;
    j0 := (i-1)*i div 2;
    for j1 := 1 to 3 do
      for j := 1 to i do
      begin
      x1 := x1 + 3;
      DataN(a[j0 + (j1-1)*k + j], x1, y1, 3);
      end;
  end;
  for i := 4 to n do
  begin
    SetProcess(i-1);
    x1 := 1;
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := i-1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 7;
    j0 := (i-1)*i div 2;
    for j1 := 1 to 3 do
      for j := 1 to i do
      begin
      x1 := x1 + 3;
      DataN(a[j0 + (j1-1)*k + j], x1, y1, 3);
      end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, a[i]);
  CloseFile(f);
  SetFileRow(k);
  ResultFileN(s,3,3);
end;

procedure MPIIO26;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := RandomN(4,8);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ����'#13#10
+'�� 4 ������������ �����: {A}, {B}, {C}, {D}. ���������� ��������� ����� {K}. �������'#13#10
+'����� ���� ������������ ����� � ��������� ������ � �������� � ���� ��������'#13#10
+'����� � ��������� ������� (������ ��������� ���� ��������): {A}_0, {A}_1,~\., {A}_{K-1},'#13#10
+'{B}_{K-1},~\., {B}_1, {B}_0, {C}_0, {C}_1,~\., {C}_{K-1}, {D}_{K-1},~\., {D}_0. ��� �����'#13#10
+'������������ ������������ ����� ������������ ������� MPI\_File\_write\_all,'#13#10
+'�������������� ��������� ����� �������� ��� ������ � ������� ����� MPI\_DOUBLE,'#13#10
+'���������� ��������� (����� ��� ������� ��������) � ����� �������� �����,'#13#10
+'��������� �� ���� ������������ ��������� (� �������������� ������ �����������'#13#10
+'����� ����� ����������) � ������������ ������� ���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  m := 4*n;
  for i := 1 to m do
    b[i] := RandomR(10,99.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 - 1;
    for j := 0 to 1 do
    begin
    x1 := x1 + 12;
    DataR2(b[i+j*2*n], b[2*n-i+1+j*2*n], x1, y1, 6);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  ResultFileR(s,3,6);
end;

procedure MPIIO27;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
begin
  n := 2*RandomN(2,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ������������ �����,'#13#10
+'����������� �������� ������������� ������� ������� ({K}/2)~\x~{K},'#13#10
+'��� {K} \= ���������� ��������� (������ �����). � �������� ����� {R},'#13#10
+'{R}~=~0,~\., {K}~\-~1, �������� � ������� �������� ������� �������� �������'#13#10
+'� ������� {R}~+~1 (������� ���������� ��~1). ��� ����� ������������ ������������'#13#10
+'����� ������� MPI\_File\_read\_all, �������������� ��������� ����� �������� ���'#13#10
+'������ � ������� ����� MPI\_DOUBLE, ���������� ��������� (����� ��� �������'#13#10
+'��������) � ����� �������� �����, ��������� �� ������������� ��������'#13#10
+'� ������������ ������� ���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  k := n div 2;
  m := n*k;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    ResultComment(prc(i-1), x1, y1);
    x1 := x1 + 6;
    for j := 1 to k do
    begin
    x1 := x1 + 5;
    ResultR(b[i + (j-1)*n], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  DataFileR(s,3,6);
end;

procedure MPIIO28;
var
  i, j, j0, x1, x2, y1, y2: integer;
  s: string;
  f: file of real;
  p: array[1..50] of integer;
begin
  n := 2*RandomN(2,4);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� �����. ����� ����, � ������ �������� ���� �����'#13#10
+'����� {N} � {K}/2 ������������ �����, ��� {K} \= ���������� ��������� (������ �����).'#13#10
+'����� {N} ��� ���� ��������� �������� � ����� � ��������� �� 1 �� {K}. �������'#13#10
+'����� ���� ������������ ����� � ��������� ������ � �������� � ���� �������'#13#10
+'������� ({K}/2)~\x~{K}, ������ ������ ������� ������ �������� ���� �����'#13#10
+'������������ ����� � ������� ������� � ���������� ������� {N} (�������'#13#10
+'���������� ��~1). ��� ����� ������������ ������������ ����� ������������'#13#10
+'������� MPI\_File\_write\_all, �������������� ��������� ����� �������� ��� ������'#13#10
+'� ������� ����� MPI\_DOUBLE, ���������� ��������� (����� ��� ������� ��������)'#13#10
+'� ����� �������� �����, ��������� �� ������������� ��������'#13#10
+'� ������������ ������� ���������� ����������� �������.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);
  k := n div 2;
  m := n*k;
  for i := 1 to m do
    b[i] := RandomR(1,9.99);
  for i := 1 to n do
    p[i] := i;
  for i := 1 to 2 * n do
    SwapN(p[RandomN(1, n)], p[RandomN(1, n)]);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    x1 := 1 + 40 * ((i+1) mod 2);
//    if Odd(i) then
//      x1 := xLeft
//    else
//      x1 := xRight;
    y1 := (i+1) div 2 + 1;
    DataComment(prc(i-1), x1, y1);
    x1 := x1 + 11;
    DataN('N = ', p[i], x1, y1, 1);
    x1 := x1 + 1;
    for j := 1 to k do
    begin
    x1 := x1 + 5;
    DataR(b[p[i] + (j-1)*n], x1, y1, 5);
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, b[i]);
  CloseFile(f);
  SetFileRow(n);
  ResultFileR(s,3,6);
end;

procedure MPIIO29;
var
  i, j, j0, j1, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  c: array[1..250] of integer;
begin
  n := 3*RandomN(1,3);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ������������� ����� ����� �����, �����������'#13#10
+'�������� ������� ������������� �������. ������ ������� � ������'#13#10
+'����� ({K}/3)~\x~3, ��� {K} \= ���������� ��������� (����� {K} ������~3).'#13#10
+'������ ���� ������������ ����� ���������� ������� ������� {N} (�������� {N}'#13#10
+'����� ������ � ��������� �� 2 �� 5). � ������ �������� ��������� ��������'#13#10
+'� ������� ���� ���� �������� �������, ��������� ����� �� �������. ��� �����'#13#10
+'������������ ������������ ����� ������� MPI\_File\_read\_all, ��������������'#13#10
+'��������� ����� �������� ��� ������ � ������� ����� MPI\_INT, ����������'#13#10
+'��������� (����� ��� ������� ��������) � ����� �������� �����, ���������'#13#10
+'�� {N} ������������� ��������� � ������������ ������� ���������� �����������'#13#10
+'�������. ��� ����������� ����� {N} ������������ ������ ��������� �����,'#13#10
+'������� ��� � ������� ������� MPI\_File\_get\_size.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 0, 1);

  k := RandomN(2,5);
  if n = 9 then
    k := RandomN(2,4);
  m := n*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case (i-1) div 3 of
    0: y1 := 0;
    1: y1 := k+1;
    2: y1 := 2*(k+1);
    end;
    for j := 0 to k do
    begin
      y1 := y1 + 1;
      case i mod 3 of
      1: begin x1 := 1;  j1 := 0; end;
      2: begin x1 := 29; j1 := 1; end;
      0: begin x1 := 57; j1 := 2; end;
      end;
      if j = 0 then
      begin
        ResultComment(prc(i-1), x1, y1);
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        ResultN(c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3], x1, y1, 2);
      end;
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, c[i]);
  CloseFile(f);
  SetFileRow(3*k);
  DataFileN(s,3,3);
end;

procedure MPIIO30;
var
  i, j, j0, j1, j2, x1, x2, y1, y2: integer;
  s: string;
  f: file of integer;
  c: array[1..250] of integer;
  p: array[1..9] of integer;
begin
  n := 3*RandomN(1,3);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
 '� ������� �������� ���� ��� ����� � ����� {N}, ������� ����� ������ � ���������'#13#10
+'�� 2 �� 5. ����� ����, � ������ �������� ���� ��� ����� ����� {I} � {J},'#13#10
+'������������ ������� (����� ������ � �������) ���������� ����������� �����'#13#10
+'������� ������������� ������� ������� ({K}/3)~\x~3 ������, ��� {K} \= ����������'#13#10
+'��������� (����� {K} ������~3). �������� {I} ����� � ��������� �� 1 �� {K}/3,'#13#10
+'�������� {J} ����� � ��������� �� 1 �� 3; ��� �������� �������� ���������'#13#10
+'������� ������. ������ ���� ������������ ����� ���������� ������� ����� �����'#13#10
+'������� {N}. ������� ����� ���� ����� ����� � ��������� ������ � �������� � ����'#13#10
+'������� ������� ������� ({K}/3)~\x~3, ������ ������ ������� ������ ��������'#13#10
+'� ������� ���� � ������� ({I},~{J}), � ��� �������� �����, ����������� ���������'#13#10
+'����� {R} ({R}~=~0, 1,~\., {K}~\-~1), ������ ���� ����� ����� {R}. ��� �����'#13#10
+'������������ ������������ ����� ������� MPI\_File\_write\_all, ��������������'#13#10
+'��������� ����� �������� ��� ������ � ������� ����� MPI\_INT, ����������'#13#10
+'��������� (����� ��� ������� ��������) � ����� �������� �����, ���������'#13#10
+'�� {N} ������������� ��������� � ������������ ������� ���������� �����������'#13#10
+'�������. ��� �������� �������� {N} �� ��� ��������'#13#10
+'������������ ������������ ������� MPI\_Bcast.'
);
  s := RandomName(6)+'.tst';
  DataS(prc(0), s, 25, 1);
  k := RandomN(2,5);
  if n = 9 then
    k := RandomN(2,4);
  SetProcess(0);
  DataN('N = ', k, 50, 1, 1);
  m := n*k*k;
  for i := 1 to m do
    c[i] := RandomN(10,99);
  for i := 1 to n do
    p[i] := i;
  for i := 1 to 2 * n do
    SwapN(p[RandomN(1, n)], p[RandomN(1, n)]);
  for i := 1 to n do
  begin
    SetProcess(i-1);
    case (i-1) div 3 of
    0: y1 := 2;
    1: y1 := 3;
    2: y1 := 4;
    end;
    for j := 0 to k do
    begin
//      y1 := y1 + 2;
      case i mod 3 of
      1: begin x1 := 1;  j1 := 0; end;
      2: begin x1 := 28; j1 := 1; end;
      0: begin x1 := 55; j1 := 2; end;
      end;
      if j = 0 then
      begin
        DataComment(prc(i-1), x1, y1);
//        DataN(' K = ', p[i]-1{k}, x1+2, y1+1, 1);
        DataN('I = ', (p[i]-1) div 3 + 1, x1+12, y1, 1);
        DataN('J = ', (p[i]-1) mod 3 + 1, x1+19, y1, 1);
        for j0 := 1 to n do
          if p[j0] = i then
          begin
            j2 := j0;
            break;
          end;
      end
      else
      begin
      x1 := x1 + 5;
      for j0 := 1 to k do
      begin
        x1 := x1 + 3;
        //ResultN(c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3], x1, y1, 2);
        c[j0 + (j-1)*k*3 + j1 * k + (i-1) div 3 * k * k * 3] := j2 - 1;
      end;
      end;
    end;
  end;
  AssignFile(f, s);
  Rewrite(f);
  for i := 1 to m do
    write(f, c[i]);
  CloseFile(f);
  SetFileRow(3*k);
  ResultFileN(s,3,3);
end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: MPIIO1;
  2: MPIIO2;
  3: MPIIO3;
  4: MPIIO4;
  5: MPIIO5;
  6: MPIIO6;
  7: MPIIO7;
  8: MPIIO8;
  9: MPIIO9;
  10: MPIIO10;
  11: MPIIO11;
  12: MPIIO12;
  13: MPIIO13;
  14: MPIIO14;
  15: MPIIO15;
  16: MPIIO16;
  17: MPIIO17;
  18: MPIIO18;
  19: MPIIO19;
  20: MPIIO20;
  21: MPIIO21;
  22: MPIIO22;
  23: MPIIO23;
  24: MPIIO24;
  25: MPIIO25;
  26: MPIIO26;
  27: MPIIO27;
  28: MPIIO28;
  29: MPIIO29;
  30: MPIIO30;
  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI6File', '������������ ����-����� �������� ������ (MPI-2)',
    '�. �. �������, 2017', 'sddwertfghklbfdgfgd', 30, InitTask);
end;

//  exports inittaskgroup;  //----------------------------

begin
end.
