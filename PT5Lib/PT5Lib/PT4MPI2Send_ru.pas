{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI2Send_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

const
  prcname = '������� %d: ';
  DebugSec = '������ ������, ���������� � ������� �������:';

function Prc(n: integer): string;
begin
  result := Format(prcname, [n]);
end;



(*
procedure MpiA1;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+3;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �� ���������, �������� � ������������ MPI\_COMM\_WORLD,',0,2);
  TaskText('�������� ���� ������������ ����� � ������� ��� ��������������� ��������.',0,4);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random*199.99-100;
    DataR('������� '+Chr(i+48)+': ', d, 0, y+i, 6);
    ResultR('������� '+Chr(i+48)+': ', -d, 0, y+i, 6);
  end;
  SetTestCount(5);
end;

procedure MpiA2;
var i,n,y: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �� ���������, �������� � ������������ MPI\_COMM\_WORLD,',0,2);
  TaskText('�������� ���� ����� ����� � ������� ��� ��������� ��������.',0,3);
  TaskText('����� ����, ��� \I�������� ��������\i (�������� �����~0)',0,4);
  TaskText('������� ���������� ���������, �������� � ������������ MPI\_COMM\_WORLD.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random(40)+10;
    DataN('������� '+Chr(i+48)+': ', d, 0, y+i, 2);
    if i > 0 then
    ResultN('������� '+Chr(i+48)+': ', 2*d, 0, y+i, 2)
    else
    ResultN2('������� '+Chr(i+48)+': ', 2*d, n, 34, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiA3;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+3;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������� �������� �������� ������������ ����� � �������',0,2);
  TaskText('��� ��������������� ��������, � ������ �� ��������� ���������',0,3);
  TaskText('(\I����������� ���������\i, ���� ������� ������~0) ������� ��� ����.',0,4);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    if i > 0 then
    ResultN('������� '+Chr(i+48)+': ', i, 0, y+i, 6)
    else
    begin
      d := Random*199.99-100;
      DataR('������� '+Chr(i+48)+': ', d, 0, 3, 6);
      ResultR('������� '+Chr(i+48)+': ', -d, 0, y+i, 6);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiA4;
var i,n,y: integer;
    d: integer;
begin
  n := Random(6)+5;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ��������� ������� ����� (������� �������) ������ ����� �����',0,2);
  TaskText('� ������� ��� ��������� ��������. � ��������� ��������� �����',0,3);
  TaskText('�� ��������� ������� ��������.',0,4);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    DataN('������� '+Chr(2*i+48)+': ', d, 0, y+i, 2);
    ResultN('������� '+Chr(2*i+48)+': ', 2*d, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiA5;
var i,n,y: integer;
    d: integer;
    r: real;
begin
  n := Random(6)+5;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ��������� ������� ����� (������� �������) ������ ����� �����,',0,2);
  TaskText('� ��������� ��������� ����� ������ ������������ �����.',0,3);
  TaskText('� ������ �������� ������� ��������� �������� ���������� �����.',0,4);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    DataN('������� '+Chr(2*i+48)+': ', d, xLeft, y+i, 2);
    ResultN('������� '+Chr(2*i+48)+': ', 2*d, xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 39.98*Random+10;
    DataR('������� '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    ResultR('������� '+Chr(2*i-1+48)+': ', 2*r, xRight, y+i-1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA6;
var i,n,y,y1: integer;
    d: integer;
    r: real;
begin
  n := Random(5)+6;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ����������� ��������� ������� ����� ������ ����� �����,',0,2);
  TaskText('� ��������� ��������� ����� ������ ������������ �����.',0,3);
  TaskText('� ������ ����������� �������� ������� ��������� �������� ���������� �����.',0,4);
  TaskText('� ������� �������� �� ��������� ������� ��������.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    d := Random(40)+10;
    y1 := y+i;
    if (n-1) mod 4 <> 0 then
      y1 := y1 - 1;
    DataN('������� '+Chr(2*i+48)+': ', d, xRight, y1, 2);
    ResultN('������� '+Chr(2*i+48)+': ', 2*d, xRight, y1, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 39.98*Random+10;
    y1 := y+i;
    if (n-1) mod 4 <> 0 then
      y1 := y1 - 1;
    DataR('������� '+Chr(2*i-1+48)+': ', r, xLeft, y1, 5);
    ResultR('������� '+Chr(2*i-1+48)+': ', 2*r, xLeft, y1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA7;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ������� ����� (������� �������)',0,2);
  TaskText('���� ����� �����~{N} (>\,0) � ����� �� {N}~�����.',0,3);
  TaskText('������� � ������ �� ���� ��������� ����� ����� �� ������� ������.',0,4);
  TaskText('� ��������� ��������� ����� �� ��������� ������� ��������.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    s := 0;
    DataN('������� '+Chr(2*i+48)+': N = ', k, 21, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 28+5*(j+1), y+i, 5);
    end;
    ResultR('������� '+Chr(2*i+48)+': ', s, 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiA8;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N} (>\,0) � ����� �� {N}~�����.',0,2);
  TaskText('� ��������� ������� ����� (������� �������) ������� ����� �����',0,3);
  TaskText('�� ������� ������, � ��������� ��������� ����� �������',0,4);
  TaskText('������� �������������� ����� �� ������� ������.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    s := 0;
    DataN('������� '+Chr(2*i+48)+': N = ', k, 3, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 10+5*(j+1), y+i, 5);
    end;
    ResultR('������� '+Chr(2*i+48)+': ', s, 14, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    k := 1 + Random(4);
    s := 0;
    DataN('������� '+Chr(2*i-1+48)+': N = ', k, 41, y+i-1, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 48+5*(j+1), y+i-1, 5);
    end;
    ResultR('������� '+Chr(2*i-1+48)+': ', s/k, 52, y+i-1, 1);
  end;
  SetTestCount(5);
end;

procedure MpiA9;
var i,n,y,k,j: integer;
    r,s: real;
begin
  n := Random(6)+5;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N} (>\,0) � ����� �� {N}~�����.',0,1);
  TaskText('� ����������� ��������� ������� ����� ������� ����� �����',0,2);
  TaskText('�� ������� ������, � ��������� ��������� ����� �������',0,3);
  TaskText('������� �������������� ����� �� ������� ������,',0,4);
  TaskText('� ������� �������� ������� ������������ ����� �� ������� ������.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    k := 1 + Random(4);
    if i = 0 then
      s := 1
    else
      s := 0;
    DataN('������� '+Chr(2*i+48)+': N = ', k, 3, y+i, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    if i = 0 then
      s := s * r
    else
      s := s + r;
    DataR('', r, 9+5*(j+1), y+i, 5);
    end;
    ResultR('������� '+Chr(2*i+48)+': ', s, 14, y+i, 7);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    k := 1 + Random(4);
    s := 0;
    DataN('������� '+Chr(2*i-1+48)+': N = ', k, 41, y+i-1, 1);
    for j := 1 to k do
    begin
    r := Random*9.95;
    s := s + r;
    DataR('', r, 48+5*(j+1), y+i-1, 5);
    end;
    ResultR('������� '+Chr(2*i-1+48)+': ', s/k, 52, y+i-1, 1);
  end;
  SetTestCount(5);
end;
*)
procedure MpiB1;
var i,n,y: integer;
    d: integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����. ��������� ��� �����',0,1);
  TaskText('� ������� �������, ��������� ������� MPI\_Send � MPI\_Recv',0,2);
  TaskText('(����������� ����������� ������� ��� �������� � ������ ���������),',0,3);
  TaskText('� ������� �� � ������� ��������. ���������� ����� ��������',0,4);
  TaskText('� ������� ����������� ������ ����������� �� ���������.',0,5);
  y := 1;
  if n = 6 then y := 0;
  ResultComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random(90)+10;
    DataN('������� '+Chr(i+48)+': ', d, 0, y+i, 2);
    SetProcess(0);
    ResultN('', d, Center(i,n-1,2,2), 3, 2)
  end;
  SetTestCount(5);
end;

procedure MpiB2;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ������������ �����. ��������� ��� �����',0,1);
  TaskText('� ������� �������, ��������� ������� MPI\_Bsend (������� ���������',0,2);
  TaskText('� ������������) � MPI\_Recv, � ������� �� � ������� ��������. ����������',0,3);
  TaskText('����� �������� � ������� �������� ������ ����������� �� ���������.',0,4);
  TaskText('��� ������� ������ ������������ ������� MPI\_Buffer\_attach.',0,5);
  y := 1;
  if n = 6 then y := 0;
  ResultComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    DataR('������� '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
    SetProcess(0);
    ResultR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB3;
var i,j,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ������ ����� �����. ��������� ��� �����',0,1);
  TaskText('� ������� �������, ��������� �� ������ ������ ������� MPI\_Send',0,2);
  TaskText('��� ������� ����������� ��������, � ������� �� � ������� ��������.',0,3);
  TaskText('���������� ����� �������� � ������� �����������',0,4);
  TaskText('������ ����������� �� ���������.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    DataComment('������� '+Chr(i+48)+': ',30,y+i);
    for j := 1 to 4 do
    begin
      inc(c);
      d := Random(90)+10;
      SetProcess(i);
      DataN('', d, Center(4+j,8,2,1), y+i, 1);
      SetProcess(0);
      ResultN('', d, Center(c,4*(n-1),2,1), 3, 2)
     end;
  end;
  SetTestCount(5);
end;

procedure MpiB4;
var i,j,n,k0,y,c: integer;
    d: integer;
    k: array[1..5] of integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����~{N} (0~<~{N}~<~5) � ����� ��',0,1);
  TaskText('{N}~����� �����. ��������� ������ ������ � ������� �������, ��������� �� ������',0,2);
  TaskText('������ ������� MPI\_Bsend ��� ������� ����������� ��������, � ������� ������',0,3);
  TaskText('� ������� �������� � ������� ����������� ������ ����������� �� ���������. ���',0,4);
  TaskText('����������� ������� ������������ ������ ������������ ������� MPI\_Get\_count.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := 0;
  ResultComment('������� 0: ',0,2);
  k0 := 0;
  for i := 1 to n-1 do
  begin
    k[i] := Random(4)+1;
    k0 := k0 + k[i]
  end;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': N = ',k[i], 23, y+i, 1);
    for j := 1 to k[i] do
    begin
      inc(c);
      d := Random(90)+10;
      SetProcess(i);
      DataN('', d, Center(4+j,8,2,1), y+i, 1);
      SetProcess(0);
      ResultN('', d, Center(c,k0,2,1), 3, 2)
     end;
  end;
  SetTestCount(5);
end;

procedure MpiB5;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� ������������ �����; ���������� �����',0,1);
  TaskText('����� ���������� ����������� ���������. � ������� ������� MPI\_Send',0,2);
  TaskText('��������� �� ������ ����� � ������ �� ����������� ���������',0,3);
  TaskText('(������ ����� � �������~1, ������~\= � �������~2, � �.\,�.)',0,4);
  TaskText('� ������� � ����������� ��������� ���������� �����.',0,5);
  y := 1;
  if n = 6 then y := 0;
  DataComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('������� '+Chr(i+48)+': ', d, 0, y+i, 5);
    SetProcess(0);
    DataR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB6;
var i,n,y: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� ������������ �����; ���������� ����� �����',0,1);
  TaskText('���������� ����������� ���������. � ������� ������� MPI\_Bsend ���������',0,2);
  TaskText('�� ������ ����� � ������ �� ����������� ���������, ��������� �������� �',0,3);
  TaskText('�������� ������� (������ ����� � ��������� �������, ������~\= � �������������',0,4);
  TaskText('�������, � �.\,�.), � ������� � ����������� ��������� ���������� �����.',0,5);
  y := 1;
  if n = 6 then y := 0;
  DataComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(n-i);
    d := Random*89.99+10;
    ResultR('������� '+Chr(n-i+48)+': ', d, 0, y+n-i, 5);
    SetProcess(0);
    DataR('', d, Center(i,n-1,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB7;
var i,n,y,c: integer;
    d: real;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� ����� �����~{N} � ����� �� {N}~�����; {K}\,\-\,1~\l~{N}~<~10,',0,1);
  TaskText('��� {K}~\= ���������� ���������. � ������� ������� MPI\_Send ���������',0,2);
  TaskText('�� ������ ����� �� ������� ������ � ��������~1, 2,~\., {K}\,\-\,2, � ����������',0,3);
  TaskText('�����~\= � �������~{K}\,\-\,1, � ������� ���������� �����. � ��������~{K}\,\-\,1 ���',0,4);
  TaskText('����������� ���������� ���������� ����� ������������ ������� MPI\_Get\_count.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := Random(5) + n - 1;
  DataN('������� 0: N = ',c,0,2,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    d := Random*89.99+10;
    ResultR('������� '+Chr(i+48)+': ', d, 0, y+i, 5);
    SetProcess(0);
    DataR('', d, Center(i,c,5,2), 3, 5)
  end;
  for i := n to c do
  begin
    SetProcess(n-1);
    d := Random*89.99+10;
    ResultR('', d, 50+(i-n)*7, y+n-1, 5);
    SetProcess(0);
    DataR('', d, Center(i,c,5,2), 3, 5)
  end;
  SetTestCount(5);
end;

procedure MpiB8;
var i,n,y,c: integer;
    d,d1: integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����, ������ ������ ��� ������',0,1);
  TaskText('�������� ��� ����� ������� �� ����. ��������� ��������� ����� � �������',0,2);
  TaskText('������� � ������� � ������� �������� ���������� ����� � ���� ��������,',0,3);
  TaskText('������������ ��� �����. ��� ������ ��������� � ������� ��������',0,4);
  TaskText('������������ ������� MPI\_Recv � ���������� MPI\_ANY\_SOURCE.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := Random(n-1)+1;
  d := Random(90)+10;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    if i = c then
      d1 := d
    else
      d1 := 0;
    DataN('������� '+Chr(i+48)+': ', d1, 0, y+i, 2)
  end;
  SetProcess(0);
  ResultN2('������� 0: ', d, c, 34, 3, 2);
  SetTestCount(5);
end;

procedure MpiB9;
var i,n,y,j,c: integer;
    d,d1: integer;
    r: real;
    s: string;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����~{N}, ������ ��� ������ ��������',0,1);
  TaskText('��� ����� ������ ����, � ��� ��������� ����� ����. � �������� � ���������~{N}',0,2);
  TaskText('��� ����� ����� �� {N}~�����. ��������� ������ ����� ����� � ������� �������',0,3);
  TaskText('� ������� � ������� �������� ���������� ����� � ���� ��������, ������������',0,4);
  TaskText('���� �����. ��� ������ ��������� ������������ �������� MPI\_ANY\_SOURCE.',0,5);
  y := 1;
  if n = 6 then y := 0;
  c := Random(n-1)+1;
  d := Random(9)+1;
  ResultComment('������� 0: ',0,2);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    if i = c then
      d1 := d
    else
      d1 := 0;
    DataN('������� '+Chr(i+48)+': N = ', d1, 2, y+i, 1);
    if i = c then
    for j := 1 to d do
    begin
      r := Random*89.99+10;
      SetProcess(i);
      DataR('', r, 14+j*6, y+i, 5);
      SetProcess(0);
      ResultR('', r, Center(j,d,5,2), 3, 5);
    end;
  end;
  SetProcess(0);
  ResultN('', c, 0, 4, 1);
  SetTestCount(5);
end;

procedure MpiB10;
var i,n,y,k,s: integer;
    a: array[1..5] of integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����~{N}, � ������� �������� ����',0,1);
  TaskText('����� �����~{K} (>\,0), ������ ���������� ��� ����������� ���������, � �������',0,2);
  TaskText('���� ������������� �����~{N}. ��������� ��� ������������� �����~{N} � �������',0,3);
  TaskText('������� � ������� � ��� ����� ���������� �����. ��� ������ ���������',0,4);
  TaskText('� ������� �������� ������������ ������� MPI\_Recv � ���������� MPI\_ANY\_SOURCE.',0,5);
  y := 1;
  if n = 6 then y := 0;
  repeat
  k := 0;
  s := 0;
  for i := 1 to n-1 do
    case Random(3) of
    0: a[i] := 0;
    1: a[i] := Random(9)-9;
    2: begin
         a[i] := Random(9)+1;
         s := s + a[i];
         inc(k);
       end;
    end;
  until k>0;
  SetProcess(0);
  ResultN('������� 0: ',s,0,3,2);
  DataN('������� 0: K = ',k,xLeft,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': N = ', a[i], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB11;
var i,n,y: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������������ �����. ��������� ����� �� ��������',0,1);
  TaskText('�������� �� ��� ����������� ��������, � ��� ����� �� ����������� ���������~\=',0,2);
  TaskText('� �������, � ������� � ������ �������� ���������� ����� (� ������� ��������',0,3);
  TaskText('����� �������� � ������� ����������� ������ ����������� �� ���������).',0,4);
  TaskText('��� �������� ��������� ������������ ������� MPI\_Ssend.',0,5);
  TaskText('\P\S��������.\s ������� MPI\_Ssend ������������ \I���������� �����\i ��������� ������,',0,0);
  TaskText('��� ������� �������� �������� ��������� ����� ��������� ������ ����� ������',0,0);
  TaskText('������ ����� ��������� ���������-�����������. � ������ ��������� ������',0,0);
  TaskText('� ���������� ������ ��������� ��������� \I�������� ����������\i (deadlocks)',0,0);
  TaskText('��-�� ������������� ������� ������ ������� �������� � ��������� ���������.',0,0);
  y := 1;
  if n = 6 then y := 0;
  for i := 0 to n-1 do
    a[i] := Random*9.98;
  SetProcess(0);
  DataR('������� 0: ',a[0],12,3,3);
  ResultComment('������� 0: ',12,3);
  for i := 1 to n-1 do
    ResultR('',a[i],18+5*i,3,1);
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': ', a[i], xRight, y+i, 2);
    ResultR('������� '+Chr(i+48)+': ', a[0], xRight, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB12;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����. � ������� ������� MPI\_Ssend � MPI\_Recv',0,1);
  TaskText('����������� ��� ���� ��������� ����������� ����� ������ � �����~1,',0,2);
  TaskText('�������� ����� �� ��������~0 � �������~1, �� ��������~1 � �������~2, \.,',0,3);
  TaskText('�� ���������� �������� � �������~0. � ������ �������� ������� ����������',0,4);
  TaskText('�����. \P\S��������.\s ��. �������� � ������ \1.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+1) mod n;
    SetProcess(c);
    ResultN('������� '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB13;
var i,n,y,c: integer;
    d: integer;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����. � ������� ������� MPI\_Ssend � MPI\_Recv',0,1);
  TaskText('����������� ��� ���� ��������� ����������� ����� ������ � �����~\-1,',0,2);
  TaskText('�������� ����� �� ��������~1 � �������~0, �� ��������~2 � �������~1, \.,',0,3);
  TaskText('�� ��������~0 � ��������� �������. � ������ �������� ������� ����������',0,4);
  TaskText('�����. \P\S��������.\s ��. �������� � ������ \2.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    d := Random(90)+10;
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': ', d, 0, y+i, 2);
    c := (i+n-1) mod n;
    SetProcess(c);
    ResultN('������� '+Chr(c+48)+': ', d, 0, y+c, 2);
  end;
  SetTestCount(5);
end;

procedure MpiB14;
var i,n,y: integer;
    a,b: array[0..5] of integer;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ��� ����� �����. � ������� ������� MPI\_Ssend � MPI\_Recv',0,1);
  TaskText('��������� ������ ����� � ���������� �������, � ������~\= � ����������� �������',0,2);
  TaskText('(��� ��������~0 ������� ���������� ��������� �������, � ��� ����������',0,3);
  TaskText('�������� ������� ����������� �������~0). � ������ �������� ������� �����,',0,4);
  TaskText('���������� �� ����������� � ������������ �������� (� ��������� �������).',0,5);
  TaskText('\P\S��������.\s ��. �������� � ������ \3.',0,0);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    a[i] := Random(90)+10;
    b[i] := Random(90)+10;
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    DataN2('������� '+Chr(i+48)+':', a[i], b[i], 0, y+i, 3);
    ResultN2('������� '+Chr(i+48)+':', b[(i+n-1) mod n], a[(i+1) mod n], 0, y+i, 3);
  end;
  SetTestCount(5);
end;

procedure Swap(var a, b: integer);
var v: integer;
begin
  v := a;
  a := b;
  b := v;
end;

procedure MpiB15;
var i,n,y: integer;
    b: array[0..4] of integer;
    r: real;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ��� �����: ������������~{A} � �����~{N}, ������ �����',0,1);
  TaskText('�����~{N} �������� ��� �������� ��~0 ��~{K}\;\-\;1, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Send � MPI\_Recv (� ���������� MPI\_ANY\_SOURCE),',0,3);
  TaskText('��������� � ������ �������� ��������� �����~{A} � �������~{N} � �������',0,4);
  TaskText('���������� �����, � ����� ���� ��������, �� �������� ����� ���� ��������.',0,5);
  TaskText('\P\S��������.\s ���� �������� {N} ��������� � ������ ��������, � ������� ��� ����,',0,0);
  TaskText('�� ��������� ���������� ����� �������, �� ������� ������� ���������� MPI.',0,0);
  TaskText('����� ������ ���� ����������� ��������� ��� ������������� MPICH2 ������ 1.3',0,0);
  TaskText('��� ��� � ���� ������ ����� ������� MPI\_Send �������� � ���������',0,0);
  TaskText('��������-�����������, ���� ��� ���� ��������� � ������ ��������-����������.',0,0);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
    b[i] := i;
  for i := 0 to n-1 do
    Swap(b[i], b[Random(n)]);
  for i := 0 to n-1 do
  begin
    r := Random*89.99+10;
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': A = ', r, 26, y+i, 5);
    DataN('N = ',b[i],48,y+i, 1);
    SetProcess(b[i]);
    ResultR('������� '+Chr(b[i]+48)+': ', r, 30, y+b[i], 5);
    ResultN('',i,48,y+b[i], 1);
  end;
  SetTestCount(5);
end;

procedure MpiB16;
var i,n,y,c,k,j: integer;
    a: array[0..5] of real;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������ ��� ������ �������� ��������~{N}',0,1);
  TaskText('�����~1, � ��� ��������� �����~0. � �������� � {N}~=~1 ��� ����� ����� �� {K}\,\-\,1',0,2);
  TaskText('�����, ��� {K}~\= ���������� ���������. ��������� �� ����� �������� �� ������',0,3);
  TaskText('�� ����� ������� ������ � ��������� ��������, ��������� ����� �����������',0,4);
  TaskText('� ������������ �������, � ������� � ������ �� ��� ���������� �����.',0,5);
  y := 2;
  if n = 5 then y := 1;
  c := Random(n);
  for i := 0 to n-2 do
    a[i] := Random*89.99+10;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    if i <> c then
      k := 0
    else
      k := 1;
    DataN('������� '+Chr(i+48)+': N = ', k, 0, y+i, 1);
    if i = c then
      for j := 0 to n-2 do
        DataR('', a[j], 49+j*6, y+i, 5);
  end;
  j := 0;
  y := 2;
  if n = 3 then y := 3;
  for i := 0 to n-1 do
  begin
    if i = c then
    begin
      j := 1;
      continue;
    end;
    SetProcess(i);
    ResultR('������� '+Chr(i+48)+': ', a[i-j], 0, y+i-j, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB17;
var i,n,y,k,j: integer;
    a: array[0..4,0..4] of integer;
begin
  n := Random(3)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,\-\,1 ������ �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��� ������� �������� ��������� �� ������ �� ������ � ���',0,2);
  TaskText('����� � ��������� ��������, ��������� ����� ���������-�����������',0,3);
  TaskText('� ������������ �������, � ������� ���������� ����� � �������',0,4);
  TaskText('����������� ������ ����������� �� ���������.',0,5);
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n-1 do
    for j := 0 to n-1 do
    a[i,j] := Random(90)+10;
  for i := 0 to n-1 do
    a[i,i] := 0;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+':', 30, y+i);
    k := -1;
    for j := 0 to n-2 do
    begin
      k := k + 1;
      if i = j then
        k := k + 1;
      DataN('',a[i,k], 41+j*3,y+i,2);
    end;

    ResultComment('������� '+Chr(i+48)+':', 30, y+i);
    k := -1;
    for j := 0 to n-2 do
    begin
      k := k + 1;
      if i = j then
        k := k + 1;
      ResultN('',a[k,i], 41+j*3,y+i,2);
    end;

  end;
  SetTestCount(5);
end;

procedure MpiB18;
var i,n,y,j: integer;
    a: array[0..9,1..4] of real;
    k: array[0..9] of integer;
begin
  n := 2*(Random(4)+2);
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('���������� ���������~\= ������ �����. � ������ �������� ���� ����� �����~{N}',0,2);
  TaskText('(0~<~{N}~<~5) � ����� �� {N}~�����. � ������� ������� MPI\_Sendrecv ���������',0,3);
  TaskText('����� ��������� �������� ����� ������ ���������~0 �~1, 2 �~3, � �.\,�.',0,4);
  TaskText('� ������ �������� ������� ���������� ����� �����.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to n-1 do
  begin
    k[i] := 1 + Random(4);
    for j := 1 to k[i] do
      a[i,j] := Random*9.99;
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', k[2*i], 3, y+i, 1);
    for j := 1 to k[2*i] do
      DataR('',a[2*i,j],16+j*5,y+i,4);
    ResultComment('������� '+Chr(2*i+48)+': ', 3, y+i);
    for j := 1 to k[2*i+1] do
      ResultR('',a[2*i+1,j],9+j*5,y+i,4);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', k[2*i-1], 41, y+i-1, 1);
    for j := 1 to k[2*i-1] do
      DataR('',a[2*i-1,j],54+j*5,y+i-1,4);
    ResultComment('������� '+Chr(2*i-1+48)+': ', 41, y+i-1);
    for j := 1 to k[2*i-2] do
      ResultR('',a[2*i-2,j],47+j*5,y+i-1,4);
  end;
  SetTestCount(5);
end;

procedure MpiB19;
var i,n,y: integer;
    a: array[0..9] of real;
begin
  n := Random(6)+5;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������������ �����. � ������� �������',0,1);
  TaskText('MPI\_Sendrecv\_replace �������� ������� �������� ����� �� �������� (����� ��',0,2);
  TaskText('��������~0 ������ ���� �������� � ��������� �������, ����� �� ��������~1~\=',0,3);
  TaskText('� ������������� �������, \., ����� �� ���������� ��������~\= � �������~0).',0,4);
  TaskText('� ������ �������� ������� ���������� �����.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to n-1 do
    a[i] := Random*89.99+10;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataR('������� '+Chr(2*i+48)+': ', a[2*i], xLeft, y+i, 5);
    ResultR('������� '+Chr(2*i+48)+': ', a[n-1-2*i], xLeft, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataR('������� '+Chr(2*i-1+48)+': ', a[2*i-1], xRight, y+i-1, 5);
    ResultR('������� '+Chr(2*i-1+48)+': ', a[n-2*i], xRight, y+i-1, 5);
  end;
  SetTestCount(5);
end;

procedure MpiB20;
var i,n,y: integer;
    d,d1: array [1..5] of real;
    k: array [1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ������������ �����~{A} � ��� ����������',0,1);
  TaskText('�����~{N} (����� �����); ����� ���� �������~{N} �������� ��� ����� ����� ��~1',0,2);
  TaskText('��~{K}\,\-\,1, ��� {K}~\= ���������� ���������. ��������� �����~{A} � ������� �������',0,3);
  TaskText('� ������� �� � �������, ��������������� ����������� �� �������~{N}.',0,4);
  TaskText('������� �� ������������; ��� �������� ������~{N} ��������� ���',0,5);
  TaskText('� �������� ��������� msgtag ������� MPI\_Send.',0,0);
  for i := 1 to n-1 do
  begin
    d[i] := Random*89.98+10;
    k[i] := i;
  end;
  for i := 1 to n-1 do
    Swap(k[i], k[random(n-1)+1]);
  for i := 1 to n-1 do
    d1[k[i]] := d[i];
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': A = ', d[i], 27, y+i, 5);
    DataN('N = ', k[i], 49, y+i, 1);
  end;
  ResultComment('������� 0: ',0,2);
  SetProcess(0);
  for i := 1 to n-1 do
    ResultR('', d1[i], Center(i,n-1,5,2), 3, 5);
  SetTestCount(5);
end;

procedure MpiB21;
var i,n,y,j,m: integer;
    d,d1: array [1..12] of real;
    k,l: array [1..12] of integer;
begin
  n := Random(3)+4;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ����� �����~{L} (\g\,0) � ����� �� {L}~��� �����',0,1);
  TaskText('({A},~{N}), ��� {A}~\= ������������ �����, � {N}~\= ��� ���������� �����. ��� �����~{L}',0,2);
  TaskText('� ����� ����� 2{K}, ��� {K}~\= ���������� ���������; ����� �������~{N}, ������',0,3);
  TaskText('�� ���� ���������, �������� ��� ����� ����� ��~1 ��~2{K}. ��������� �����~{A}',0,4);
  TaskText('� ������� ������� � ������� �� � �������, ��������������� �����������',0,5);
  TaskText('�� �������~{N}. ������� �� ������������; ��� �������� ������~{N}',0,0);
  TaskText('��������� ��� � �������� ��������� msgtag ������� MPI\_Send.',0,0);
  for i := 1 to 2*n do
  begin
    d[i] := Random*8.98+1;
    k[i] := i;
  end;
  for i := 1 to 2*n do
    Swap(k[i], k[random(2*n)+1]);
  for i := 1 to 2*n do
    d1[k[i]] := d[i];
  repeat
    l[n-1] := 2*n;
    for i := 1 to n-2 do
    begin
      l[i] := Random(4);
      l[n-1] := l[n-1]-l[i];
    end;
  until (l[n-1] >= 0) and (l[n-1]<6);;
  y := 1;
  if n = 6 then y := 0;
  m := 0;
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': L = ', l[i], 3, y+i, 1);
    for j := 1 to l[i] do
    begin
    m := m + 1;
    DataR('', d[m], 12+j*11, y+i, 4);
    DataN('', k[m], 17+j*11, y+i, 2);
    end;
  end;
  ResultComment('������� 0: ',0,2);
  SetProcess(0);
  for i := 1 to 2*n do
    ResultR('', d1[i], Center(i,2*n,4,2), 3, 4);
  SetTestCount(5);
end;

procedure MpiB22;
var i,n,y: integer;
  a: array[1..5] of real;
  t,b: array[1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� ��� ����� ({T}, {A}); ���������� ��� ����� �����',0,1);
  TaskText('����������� ���������. �����~{T}~\= �����, ������~0 ���~1. �����~{A}~\= �����, ����',0,2);
  TaskText('{T}~=~0, � ������������, ���� {T}~=~1. ��������� �� ������ �����~{A} � ������ ��',0,3);
  TaskText('����������� ��������� (������ ����� � �������~1, ������~\= � �������~2, � �.\,�.)',0,4);
  TaskText('� ������� ���������� �����. ��� �������� ���������� � ���� ������������ �����',0,5);
  TaskText('��������� �����~{T} � �������� ��������� msgtag ������� MPI\_Send, ��� ���������',0,0);
  TaskText('���� ���������� ������������ ������� MPI\_Probe � ���������� MPI\_ANY\_TAG.',0,0);

  TaskText('\P\S��������.\s ����� �������� ������������ ����, ����������� ���������������',0,0);
  TaskText('\I��������� �������\i \Mtemplate<typename T> void send(int t, int dest,\m',0,0);
  TaskText('\MMPI\_Datatype d)\m (��� �������� ������) � \Mtemplate<typename T> void\m',0,0);
  TaskText('\Mrecv(MPI\_Datatype d)\m (��� ��������� ������). � �������� ��������� t',0,0);
  TaskText('���������� �����, ������ 0 ��� 1, � �������� ��������� dest \=',0,0);
  TaskText('���� ��������-����������.',0,0);


  for i := 1 to 5 do
  begin
    a[i] := 89.98*Random+10;
    b[i] := Random(90)+10;
    t[i] := Random(2);
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  DataComment('������� 0:',xleft, y+1);
  SetProcess(0);
  for i := 1 to n - 1 do
  begin
    DataN('T = ',t[i], 32, y+i, 1);
    case t[i] of
    0: DataN('A = ', b[i], 39, y+i, 2);
    1: DataR('A = ', a[i], 39, y+i, 5);
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    case t[i] of
    0: ResultN('������� '+Chr(i+48)+': ', b[i], 32, y+i, 2);
    1: ResultR('������� '+Chr(i+48)+': ', a[i], 0, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiB23;
var i,n,y,j: integer;
  a: array[1..5,1..8] of real;
  b: array[1..5,1..8] of integer;
  t,k: array[1..5] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ��� ����� �����~{T}, {N} � ����� ��~{N} �����.',0,1);
  TaskText('�����~{T} �����~0 ���~1. ����� �������� ����� �����, ���� {T}~=~0, � ������������',0,2);
  TaskText('�����, ���� {T}~=~1. ��������� �������� ������ � ������� ������� � �������',0,3);
  TaskText('���������� ����� � ������� ����������� ������ ����������� �� ���������.',0,4);
  TaskText('��� �������� ���������� � ���� ����������� ����� ��������� �����~{T}',0,5);
  TaskText('� �������� ��������� msgtag ������� MPI\_Send, ��� ��������� ����',0,0);
  TaskText('���������� ������������ ������� MPI\_Probe � ���������� MPI\_ANY\_TAG.',0,0);

  TaskText('\P\S��������.\s ����� �������� ������������ ����, ����������� ���������������',0,0);
  TaskText('\I��������� �������\i \Mtemplate<typename T> void send(int t, MPI\_Datatype d)\m',0,0);
  TaskText('(��� �������� ������) � \Mtemplate<typename T> void recv(MPI\_Datatype d,\m',0,0);
  TaskText('\MMPI\_Status s)\m (��� ��������� ������). � �������� ��������� t',0,0);
  TaskText('���������� �����, ������ 0 ��� 1, � �������� ��������� s \=',0,0);
  TaskText('���������, ������������ �������� MPI\_Probe.',0,0);





  for i := 1 to 5 do
  begin
    t[i] := Random(2);
    k[i] := Random(6)+2;
    for j := 1 to k[i] do
    begin
    a[i,j] := 89.98*Random+10;
    b[i,j] := Random(90)+10;
    end;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  ResultComment('������� 0:',11, y+1);
  SetProcess(0);
  for i := 1 to n - 1 do
  begin
    for j := 1 to k[i] do
    case t[i] of
    0: ResultN('', b[i,j], 25+4*j, y+i, 2);
    1: ResultR('', a[i,j], 22+7*j, y+i, 5);
    end;
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataN('������� '+Chr(i+48)+': T = ', t[i], 3, y+i, 1);
    DataN('N = ', k[i], 21, y+i, 1);
    for j := 1 to k[i] do
    case t[i] of
    0: DataN('', b[i,j], 25+4*j, y+i, 2);
    1: DataR('', a[i,j], 22+7*j, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;
(*
procedure MpiC1;
var i,n,y,k: integer;
begin
  n := Random(3)+4;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Bcast, ��������� ��� �����',0,3);
  TaskText('�� ��� ����������� �������� � ������� � ��� ���������� �����.',0,4);
  k := Random(90) + 10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataN('������� 0: ', k, 0, 3, 2);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultN('������� '+Chr(i+48)+': ', k, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC2;
var i,n,y,j: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+4;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� 5 �����.',0,2);
  TaskText('��������� ������� MPI\_Bcast, ��������� ���� ����� �� ��� �����������',0,3);
  TaskText('�������� � ������� � ��� ���������� ����� � ��� �� �������.',0,4);
  for i := 1 to 5 do
    r[i] := Random*89.99+10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataComment('������� 0:',13,3);
  for i := 1 to 5 do
  DataR('', r[i], Center(i,5,5,2), 3, 5);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',13,y+i);
    for j := 1 to 5 do
    ResultR('', r[j], Center(j,5,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC3;
var i,n,y: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������������ �����.',0,2);
  TaskText('��������� ������� MPI\_Gather, ��������� ��� ����� � ������� �������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������ ������� �����, ������ � ������� ��������).',0,5);
  for i := 1 to n do
    r[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('������� 0:',0,2);
  for i := 1 to n do
  ResultR('', r[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': ', r[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC4;
var i,n,y,j: integer;
  a: array[1..5,1..5] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� 5 ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Gather, ��������� ��� ������ � ������� �������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������ ������� ����� �����, ������ � ������� ��������).',0,5);
  for i := 1 to 5 do
    for j := 1 to 5 do
    a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('������� 0:',0,2);
  for i := 1 to n do
    for j := 1 to 5 do
  ResultN('', a[i,j], Center((i-1)*5+j,5*n,2,1), 3, 2);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',22,y+i);
    for j := 1 to 5 do
      DataN('', a[i+1,j], Center(j,5,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC5;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {R}\,+\,2 ����� �����, ��� �����~{R} ����� �����',0,1);
  TaskText('�������� (� ��������~0 ���� 2~�����, � ��������~1 ���� 3~�����, � �.\,�.).',0,2);
  TaskText('��������� ������� MPI\_Gatherv, ��������� ��� ������ � ������� �������',0,3);
  TaskText('� ������� ���������� ������ � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������ ������� �����, ������ � ������� ��������).',0,5);
  c := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
      c := c + 1;
    end;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('������� 0:',0,2);
  c0 := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      c0 := c0 + 1;
      ResultN('', a[i,j], Center(c0,c,2,1), 3, 2);
    end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',20,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,n+1,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC6;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Scatter, ��������� �� ������ ����� � ������',0,3);
  TaskText('������� (������� �������) � ������� � ������ �������� ���������� �����.',0,4);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('������� 0:',0,2);
  for i := 1 to n do
      DataR('', a[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('������� '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC7;
var i,n,y,j: integer;
  a: array[1..5,1..3] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� 3{K} �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Scatter, ��������� �� 3~����� � ������ �������',0,3);
  TaskText('(������� �������) � ������� � ������ �������� ���������� �����.',0,4);
  for i := 1 to n do
    for j := 1 to 3 do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('������� 0:',0,2);
  for i := 1 to n do
    for j := 1 to 3 do
      DataR('', a[i,j], Center((i-1)*3+j,3*n,4,1), 3, 4);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',21,y+i);
    for j := 1 to 3 do
      ResultR('', a[i+1,j], Center(j,3,4,2), y+i, 4);
  end;
  SetTestCount(5);
end;

procedure MpiC8;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('�� ����� ������� ������������ ����� � �������� ������ � ��������� �������',0,2);
  TaskText('MPI\_Scatterv, ��������� �� ������ ����� � ������ �������; ��� ���� ������',0,3);
  TaskText('����� ���� ��������� � �������~{K}\,\-\,1, ������ �����~\= � �������~{K}\,\-\,2, \.,',0,4);
  TaskText('��������� �����~\= � �������~0. ������� � ������ �������� ���������� �����.',0,5);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('������� 0:',0,2);
  for i := 1 to n do
      DataR('', a[n-i+1], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('������� '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC9;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� {K}({K}\,+\,3)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Scatterv, ��������� � ������ �������',0,2);
  TaskText('����� ����� �� ������� ������; ��� ���� � ������� �����~{R} ���� ���������',0,3);
  TaskText('{R}\,+\,2~��������� ����� (� �������~0~\= ������ ��� �����, � �������~1~\=',0,4);
  TaskText('��������� ��� �����, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
  c := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
      c := c + 1;
    end;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('������� 0:',0,2);
  c0 := 0;
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      c0 := c0 + 1;
      DataN('', a[i,j], Center(c0,c,2,1), 3, 2);
    end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',20,y+i);
    for j := 1 to i+2 do
      ResultN('', a[i+1,j], Center(j,n+1,2,1), y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC10;
var i,n,y,j: integer;
  a: array[1..7] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� {K}\,+\,2 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scatterv, ��������� � ������ ������� ��� �����',0,2);
  TaskText('�� ������� ������; ��� ���� � ������� �����~{R} ������ ���� ��������� �����',0,3);
  TaskText('� �������� �� {R}\,+\,1 �� {R}\,+\,3 (� �������~0~\= ������ ��� �����, � �������~1~\= �����',0,4);
  TaskText('�� ������� �� ���������, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
  for i := 1 to n+2 do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('������� 0:',0,2);
  for i := 1 to n+2 do
      DataR('', a[i], Center(i,n+2,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',20,y+i);
    for j := i+1 to i+3 do
      ResultR('', a[j], Center(j-i,3,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC11;
var i,n,y,j: integer;
  a: array[1..5] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������������ �����.',0,2);
  TaskText('��������� ������� MPI\_Allgather, ��������� ��� ����� �� ��� ��������',0,3);
  TaskText('� ������� �� � ������ �������� � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      ResultR('', a[j], Center(j,n,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC12;
var i,n,y,j,k: integer;
  a: array[1..5,1..4] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������ ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Allgather, ��������� ��� ����� �� ��� ��������',0,3);
  TaskText('� ������� �� � ������ �������� � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 1 to n do
    for j := 1 to 4 do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
    for j := 1 to 4 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',5,y+i);
    for k := 1 to n do
      for j := 1 to 4 do
        ResultN('', a[k,j], ((k-1)*4+j)*3+13, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC13;
var i,n,y,j,k,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {R}\,+\,2 ����� �����, ��� �����~{R} ����� �����',0,1);
  TaskText('�������� (� ��������~0 ���� 2~�����, � ��������~1 ����~3 �����, � �.\,�.).',0,2);
  TaskText('��������� ������� MPI\_Allgatherv, ��������� ��� ������ �� ��� ��������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 1 to n do
    for j := 1 to i+1 do
    begin
      a[i,j] := Random(90) + 10;
    end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for k := 1 to n do
      for j := 1 to k+1 do
      begin
        c0 := c0 + 1;
        ResultN('', a[k,j], c0*3+13, y+i, 2);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC14;
var i,n,y,j: integer;
  a: array[1..5,1..5] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoall, ��������� � ������ ������� �� ������ �����',0,2);
  TaskText('�� ���� �������: � �������~0~\= ������ ����� �� �������, � �������~1~\= ������',0,3);
  TaskText('�����, � �.\,�. � ������ �������� ������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 1 to n do
    for j := 1 to n do
      a[i,j] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      DataR('', a[i+1,j], Center(j,n,5,2), y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      ResultR('', a[j,i+1], Center(j,n,5,2), y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC15;
var i,n,y,j,k,c0: integer;
  a: array[1..5,1..15] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� 3{K} ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoall, ��������� � ������ ������� ��� ��������� �����',0,2);
  TaskText('�� ������� ������ (� �������~0~\= ������ ��� �����, � �������~1~\= ��������� ���',0,3);
  TaskText('�����, � �.\,�.). � ������ �������� ������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 1 to n do
    for j := 1 to 3*n do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',7,y+i);
    for j := 1 to 3*n do
      DataN('', a[i+1,j], Center(j,3*n,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',7,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 3 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,i*3+k], Center(c0,3*n,2,1), y+i, 2);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC16;
var i,n,y,j,k,c0,c1,c,k1: integer;
  a: array[1..5,1..15] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}({K}\,+\,1)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Alltoallv, ��������� � ������ �������',0,2);
  TaskText('����� ����� �� ������� ������; ��� ���� � �������~{R} ������ ���� ���������',0,3);
  TaskText('{R}\,+\,1~��������� ����� (� �������~0~\= ������ ����� ������� ������, � �������~1~\=',0,4);
  TaskText('��������� ��� �����, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
  c := n*(n+1) div 2;
  k1 := 19;
  case n of
  4: k1 := 15;
  5: k1 := 10;
  end;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(9) + 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,1,1), y+i, 1);
  end;
  c1 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',15,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to i+1 do
      begin
        c0 := c0 + 1;
        ResultN('', a[j,c1+k], Center(c0,25,1,1)+k1, y+i, 1);
      end;
    c1 := c1 + (i+1);
  end;
  SetTestCount(5);
end;

procedure MpiC17;
var i,n,y,j,k,c0,c: integer;
  a: array[1..5,1..15] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,1 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoallv, ��������� � ������ ������� ��� ����� ��',0,2);
  TaskText('������� ������; ��� ���� � �������~0 ���� ��������� ������ ��� �����,',0,3);
  TaskText('� �������~1~\= ������ � ������ �����, \., � ��������� �������~\= ���������',0,4);
  TaskText('��� ����� ������� ������. � ������ �������� ������� ���������� �����.',0,5);
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 2 do
      begin
        c0 := c0 + 1;
        ResultR('', a[j,i+k], Center(c0,2*n,4,1), y+i, 4);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiC18;
var i,n,y,j,k,c0,c: integer;
  a: array[1..5,1..15] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ ��������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,1 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoallv, ��������� � ������ ������� ��� ����� ��',0,2);
  TaskText('������� ������; ��� ���� � �������~0 ���� ��������� ��������� ��� �����, �',0,3);
  TaskText('�������~1~\= ��� �����, �������������� ����������, \., � ��������� �������~\=',0,4);
  TaskText('������ ��� ����� ������� ������. � ������ �������� ������� ���������� �����.',0,5);
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',5,y+i);
    c0 := 0;
    for j := 1 to n do
      for k := 1 to 2 do
      begin
        c0 := c0 + 1;
        ResultR('', a[j,n-i-1+k], Center(c0,2*n,4,1), y+i, 4);
      end;
  end;
  SetTestCount(5);
end;

procedure MpiD1;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ����������',0,2);
  TaskText('���������. ��������� ������� MPI\_Reduce ��� �������� MPI\_SUM, ��������������',0,3);
  TaskText('�������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� ����� � ������� ��������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
    SetProcess(0);
    ResultComment('������� '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiD2;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Reduce ��� �������� MPI\_MIN, ����� �����������',0,3);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� �������� � ������� ��������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
    SetProcess(0);
    ResultComment('������� '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,4,1), 3, 4);
  SetTestCount(5);
end;

procedure MpiD3;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce ��� �������� MPI\_MAXLOC, ����� ������������',0,2);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('� ���� ��������, ����������� ��� ������������ ��������. ������� � �������',0,4);
  TaskText('�������� ������� ��� ���������, � �����~\= ����� ���������� �� ���������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90)+10;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] > a[1,j] then
      begin
        a[1,j] := a[i,j];
        b[j] := i;
      end;
    SetProcess(0);
    ResultComment('������� '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
    for j := 1 to c do
      ResultN('', b[j]-1, Center(j,c,2,1), 4, 2);
  SetTestCount(5);
end;

procedure MpiD4;
var i,n,y,j,c,k1: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Allreduce ��� �������� MPI\_PROD, �����������',0,3);
  TaskText('�������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� ������������ �� ���� ���������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*1.5+1;
  y := 2;
  if n = 5 then y := 1;
  k1 := 0;
  case n of
  4: k1 := 3;
  5: k1 := 6;
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] * a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD5;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Allreduce ��� �������� MPI\_MINLOC, ����� �����������',0,2);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('� ���� ��������, ����������� ����������� ��������. ������� � ������� ��������',0,4);
  TaskText('��������, � � ��������� ���������~\= ����� ���������, ���������� ��� ��������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
      begin
        a[1,j] := a[i,j];
        b[j] := i;
      end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',5,y+i);
    if i = 0 then
    for j := 1 to c do
      ResultR('', a[1,j], Center(j,c,4,1), y+i, 4)
    else
    for j := 1 to c do
      ResultN('', b[j]-1, Center(j,c,4,1), y+i, 4);
  end;
  SetTestCount(5);
end;

procedure MpiD6;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}~����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce\_scatter, �������������� �������� ������',0,2);
  TaskText('������� � ����� � ��� �� ���������� �������, ��������� �� �����',0,3);
  TaskText('�� ���������� ���� � ������ ������� (������ �����~\= � �������~0, ������~\=',0,4);
  TaskText('� �������~1, � �.\,�.) � ������� � ������ �������� ���������� �����.',0,5);
  c := n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',22,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+':',22,y+i);
    ResultN('', a[1,i+1], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiD7;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� 2{K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce\_scatter, ����� ��������� ����� ��������� ����',0,2);
  TaskText('������� � ����� � ��� �� ���������� �������, ��������� �� ��� ���������',0,3);
  TaskText('��������� � ������ ������� (������ ��� ���������~\= � �������~0, ���������',0,4);
  TaskText('���~\= � �������~1, � �.\,�.) � ������� � ������ �������� ���������� ������.',0,5);
  c := 2*n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] > a[1,j] then
        a[1,j] := a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+':',25,y+i);
    ResultR2('', a[1,2*i+1], a[1,2*i+2], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD8;
var i,n,y,j,k,c,k1: integer;
  a: array[1..5,1..20] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}({K}\,+\,3)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Reduce\_scatter, ����� ����������� ��������',0,2);
  TaskText('����� ��������� ���� ������� � ����� � ��� �� ���������� ������� � ���������',0,3);
  TaskText('������ ��� �������� � �������~0, ��������� ���~\= � �������~1, \., ���������',0,4);
  TaskText('{K}\,+\,1~���������~\= � �������~{K}\,\-\,1. ������� � ������ �������� ���������� ������.',0,5);
  c := n*(n+3) div 2;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  k1 := 0;
  case n of
  5: k1 := 6;
  end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1)+k1, y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
  k := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+':',6,y+i);
    for j := 1 to i+2 do
    begin
      k := k + 1;
      ResultN('', a[1,k], Center(j,c,2,1)+k1, y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiD9;
var i,n,y,j,c,k1: integer;
  a: array[1..5,1..10] of real;
  b: array[1..10] of real;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scan, ����� � �������� �����~{R} ({R}~=~0, 1,~\., {K}\,\-\,1)',0,2);
  TaskText('������������ ��������� � ����� � ��� �� ���������� ������� ��� �������, ������',0,3);
  TaskText('� ��������� � ������� ��~0 ��~{R}, � ������� ��������� ������������ (��� ����',0,4);
  TaskText('� �������� {K}\,\-\,1 ����� �������� ������������ ��������� �� ���� �������).',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*1.5+1;
  for j := 1 to c do
    b[j] := 1;
  y := 2;
  if n = 5 then y := 1;
  k1 := 0;
  case n of
  4: k1 := 3;
  5: k1 := 6;
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
    begin
      b[j] := b[j]*a[i+1,j];
      ResultR('', b[j], Center(j,c,5,1)+k1, y+i, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiD10;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of integer;
  b: array[1..10] of integer;
begin
  n := Random(3)+3;
  CreateTask('������������ �������� ��������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scan, ����� � �������� �����~{R} ({R}~=~0, \.,~{K}\,\-\,1)',0,2);
  TaskText('������������ �������� ����� ��������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('��� �������, ������ � ��������� � ������� ��~0 ��~{R},',0,4);
  TaskText('� ������� � ������ �������� ��������� ���������.',0,5);
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(90) + 10;
  for j := 1 to c do
    b[j] := 0;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
    begin
      if a[i+1,j] > b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiE1;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1~������ ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ����������� ���, ���������� ��� ����� �����,',0,2);
  TaskText('� ���� ������������ �������� ��������� ������, ���������',0,3);
  TaskText('��� ������ �� �������� �������� � �����������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, y+i, 3);
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
      DataN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE2;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1~������ ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ����������� ���, ���������� ��� ����� �����,',0,2);
  TaskText('� ���� ������������ �������� ��������� ������, ���������',0,3);
  TaskText('�� ����� ������ ����� � ������ �� ����������� ���������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',3,y+i);
      ResultN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
      DataN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE3;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of integer;
  c: array[1..6] of integer;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ������ ����� �����.',0,1);
  TaskText('��������� ����������� ���, ���������� ��� ����� �����, ',0,2);
  TaskText('� ���� ������������ �������� ��������� ������, ���������',0,3);
  TaskText('����� �� ����������� ��������� � ������� � �������',0,4);
  TaskText('���������� ����� � ������� ����������� ������ ����������� �� ���������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      b[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',3,y+i);
      DataN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    ResultComment('������� 0:',3,3);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, 3, 3);
  SetTestCount(5);
end;

procedure MpiE4;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1~������ �����, ��� {K}~\= ���������� ���������,',0,1);
  TaskText('������ ������ ��� ����� ������ ������ �������� ������, � ������ �����~\=',0,2);
  TaskText('������������. ��������� ����������� ���, ���������� ��� ����� (��� �����',0,3);
  TaskText('� ���� ������������), ��������� ����� �� �������� �������� � �����������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataN('', c[j], 1+j*13+3, 3, 2);
      DataR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiE5;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1}~������ �����, ��� {K}~\= ���������� ���������,',0,1);
  TaskText('������ ������ � ������ ����� ������ ������ �������� ������, � ������ �����~\=',0,2);
  TaskText('������������. ��������� ����������� ���, ���������� ��� ����� (��� �����',0,3);
  TaskText('� ���� ������������), ��������� �� ����� ������ ����� � ������ ��',0,4);
  TaskText('����������� ��������� � ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataR('', b[j], 1+j*13+3, 3, 5);
      DataN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiE6;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ��� �����: ���� ������������',0,1);
  TaskText('� ��� �����. ��������� ����������� ���, ���������� ��� ����� (��� �����',0,2);
  TaskText('� ���� ������������), ��������� ����� �� �����������',0,3);
  TaskText('��������� � ������� � ������� ���������� �����',0,4);
  TaskText('� ������� ����������� ������ ����������� �� ���������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
      DataN('', a[i], 35+6, y+i, 2);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      ResultR('', b[j], 1+j*13, 3, 5);
      ResultN('', a[j], 1+j*13+6, 3, 2);
      ResultN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiE7;
var i,n,y,j: integer;
  a: array[0..6] of integer;
  c: array[0..6] of integer;
  b: array[0..6] of real;
begin
  n := Random(3)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ��� �����: ������ � ������ �������� ������, � ������ \=',0,1);
  TaskText('������������. ��������� ����������� ���, ���������� ��� ����� (��� �����',0,2);
  TaskText('� ���� ������������), ��������� ������ �� ������� �������� �� ��� ��������',0,3);
  TaskText('� ������� � ������ �������� ���������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
  for i := 0 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataR('', b[i], 35+3, y+i, 5);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',3,y+i);
    for j := 0 to n-1 do
    begin
      ResultN('', a[j], 14+j*13, y+i, 2);
      ResultR('', b[j], 14+j*13+3, y+i, 5);
      ResultN('', c[j], 14+j*13+9, y+i, 2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiE8;
var i,n,y,j,x: integer;
  a: array[1..6,1..5] of integer;
  c: array[1..6,1..5] of integer;
  b: array[1..6,1..5] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� {R}~����� �����, ��� {R}~\= ���� ��������.',0,1);
  TaskText('��� ������ ����� � ������ ������ �������� ������, � ���������~\= ������������.',0,2);
  TaskText('��������� ����������� ���, ���������� ��� ����� (��� ����� � ����',0,3);
  TaskText('������������), ��������� ����� �� ����������� ��������� � ������� � �������',0,4);
  TaskText('���������� ����� � ������� ����������� ������ ����������� �� ���������.',0,5);
  for i := 1 to n-1 do
  for j := 1 to i do
  begin
      a[i,j] := Random(90) + 10;
      c[i,j] := Random(90) + 10;
      b[i,j] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',3,y+i);
    x := 13;
    for j := 1 to i do
    begin
      DataN2('', a[i,j], c[i,j], x, y+i, 3);
      DataR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetProcess(0);
    ResultComment('������� 0:',3,y+1);
  for i := 1 to n - 1 do
  begin
    x := 13;
    for j := 1 to i do
    begin
      ResultN2('', a[i,j], c[i,j], x, y+i, 3);
      ResultR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetTestCount(5);
end;

procedure MpiF1;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� ��� ������: ������ �������� {K}~�����, � ������',0,1);
  TaskText('{K}~������������ �����, ��� {K}~\= ���������� ���������. ��������� �������',0,2);
  TaskText('�������� MPI\_Pack � MPI\_Unpack � ���� ������������ �������� ��������� ������,',0,3);
  TaskText('��������� ��� ������ �� �������� �������� � �����������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n do
  begin
      a[i] := Random(90) + 10;
      b[i] := 10 + Random*89.98;
  end;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',9,y+i);
    for j := 1 to n do
      ResultN('', a[j], Center(j,n,2,1)-12, y+i, 2);
    for j := 1 to n do
      ResultR('', b[j], Center(j,n,5,1)+16, y+i, 5);
  end;
  SetProcess(0);
    DataComment('������� 0:',9,3);
    for j := 1 to n do
      DataN('', a[j], Center(j,n,2,1)-12, 3, 2);
    for j := 1 to n do
      DataR('', b[j], Center(j,n,5,1)+16, 3, 5);
  SetTestCount(5);
end;

procedure MpiF2;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1~������ �����, ��� {K}~\= ���������� ���������,',0,1);
  TaskText('������ ������ � ������ ����� ������ ������ �������� �����, � ������ �����~\=',0,2);
  TaskText('������������. ��������� ������� �������� � ���� ������������ ��������',0,3);
  TaskText('��������� ������, ��������� �� ����� ������ ����� � ����������� ��������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataR('', b[j], 1+j*13+3, 3, 5);
      DataN('', c[j], 1+j*13+9, 3, 2);
    end;
  SetTestCount(5);
end;

procedure MpiF3;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� {K}\,\-\,1~������ �����, ��� {K}~\= ���������� ���������,',0,1);
  TaskText('������ ������ ��� ����� ������ ������ �������� ������, � ������ �����~\=',0,2);
  TaskText('������������. ��������� ������� �������� � ���� ������������ ��������',0,3);
  TaskText('��������� ������, ��������� ��� ������ �� �������� �������� � �����������',0,4);
  TaskText('� ������� �� � ����������� ��������� � ��� �� �������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('������� '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      DataN('', a[j], 1+j*13, 3, 2);
      DataN('', c[j], 1+j*13+3, 3, 2);
      DataR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiF4;
var i,n,y,j: integer;
  a: array[1..6] of integer;
  c: array[1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ��� �����: ��� ����� � ����',0,1);
  TaskText('������������. ��������� ������� �������� � ���� ������������ ��������',0,2);
  TaskText('��������� ������, ��������� ����� �� ����������� ��������� � �������',0,3);
  TaskText('� ������� ���������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ���������.',0,5);
  for i := 1 to n-1 do
  begin
      a[i] := Random(90) + 10;
      c[i] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataN('', c[i], 35+3, y+i, 2);
      DataR('', b[i], 35+6, y+i, 5);
  end;
  SetProcess(0);
    ResultComment('������� 0:',3,3);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, 3, 2);
      ResultN('', c[j], 1+j*13+3, 3, 2);
      ResultR('', b[j], 1+j*13+6, 3, 5);
    end;
  SetTestCount(5);
end;

procedure MpiF5;
var i,n,y,j: integer;
  a: array[1..6,1..6] of integer;
  b: array[1..6] of real;
begin
  n := Random(3)+3;
  CreateTask('����������� ���� � �������� ������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ��� ����� �� ������ ������������� � {R}~�����',0,1);
  TaskText('�����, ��� ��������~{R} ����� ����� �������� (� �������� 1 ���� ���� �����',0,2);
  TaskText('�����, � �������� 2~\= ��� ����� �����, � �.\,�.). ��������� ������� ��������',0,3);
  TaskText('� ���� ������� �������� � ������, ��������� ��� ������ � ������� �������',0,4);
  TaskText('� ������� ��� ������ � ������� ����������� ������ ����������� �� ���������.',0,5);
  for i := 1 to n-1 do
  begin
    for j := 1 to i do
      a[i,j] := Random(90) + 10;
      b[i] := 10+Random*89.98;
  end;
  y := 1;
  if n = 3 then y := 2;
  if n = 6 then y := 0;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataComment('������� '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
    for j := 1 to i do
      DataN('', a[i,j], 38+j*3, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('������� 0:',3,3);
    y := 13;
    for i := 1 to n-1 do
    begin
      y := y + 1;
      ResultR('', b[i], y, 3, 5);
      y := y + 6;
      for j := 1 to i do
      begin
        ResultN('', a[i,j], y, 3, 2);
        y := y + 3;
      end;
    end;
  SetTestCount(5);
end;

procedure MpiG1;
var i,n,n1,k,y,j: integer;
  a: array[1..5] of integer;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ��� ����� �� {K}~����� �����, ��� {K}~\= ���������� ���������',0,1);
  TaskText('������� ����� (0,~2,~\.). � ������� ������� MPI\_Comm\_group, MPI\_Group\_incl',0,2);
  TaskText('� MPI\_Comm\_create ������� ����� ������������, ���������� �������� �������',0,3);
  TaskText('�����. ��������� ���� ������������ �������� ��������� ������ ��� ����������',0,4);
  TaskText('�������������, ��������� �� ������ ��������� ����� � ������ ������� �������',0,5);
  TaskText('����� (������� �������) � ������� ���������� �����.',0,0);
  for i := 1 to 5 do
      a[i] := Random(90) + 10;
  n1 := (n+1) div 2;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  SetProcess(0);
    DataComment('������� 0:',0,2);
    for j := 1 to n1 do
      DataN('', a[j], Center(j,n1,2,1), 3, 2);
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    ResultN('������� '+Chr(k+48)+': ', a[i], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiG2;
var i,n,n1,k,y,j: integer;
  a: array[1..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ��������� ����� (1,~3,~\.) ���� ��� ������������ �����.',0,1);
  TaskText('� ������� ������� MPI\_Comm\_group, MPI\_Group\_excl � MPI\_Comm\_create �������',0,2);
  TaskText('����� ������������, ���������� �������� ��������� �����. ��������� ����',0,3);
  TaskText('������������ �������� ��������� ������ ��� ���������� �������������, ���������',0,4);
  TaskText('�������� ����� �� ��� �������� ��������� ����� � ������� ��� ����� � �������',0,5);
  TaskText('����������� ������ ����������� �� ��������� (������� �����,',0,0);
  TaskText('���������� �� ����� �� ��������).',0,0);
  for i := 1 to 10 do
      a[i] := 10+Random*89.98;
  n1 := n div 2;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    DataR2('������� '+Chr(k+48)+':', a[k], a[k+1], 0, y+i, 6);
  end;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    ResultComment('������� '+Chr(k+48)+':',5,y+i);
    for j := 1 to 2*n1 do
      ResultR('', a[j], 10+j*6, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiG3;
var i,n,n1,k,y,j: integer;
  a: array[1..15] of integer;
  s: string;
begin
  n := Random(9)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ ��������, ���� �������� ������� ��~3 (������� ������� �������), ����',0,1);
  TaskText('��� ����� �����. � ������� ������� MPI\_Comm\_split ������� ����� ������������,',0,2);
  TaskText('���������� ��������, ���� ������� ������� �� 3. ��������� ���� ������������',0,3);
  TaskText('�������� ��������� ������ ��� ���������� �������������, ��������� ��������',0,4);
  TaskText('����� � ������� ������� � ������� ��� ����� � ������� ����������� ������',0,5);
  TaskText('����������� �� ��������� (������� �����, ���������� �� �������� ��������).',0,0);
  for i := 1 to 15 do
      a[i] := Random(90) + 10;
  n1 := (n+2) div 3;
  y := 1;
  j := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then
  begin
    y := 0;
    j := 2;
  end;
  for i := 1 to n1 do
  begin
    k := 3*i-3;
    SetProcess(k);
    Str(k:j,s);
    DataN3('������� '+s+':', a[k+1], a[k+2], a[k+3], 0, y+i, 3);
  end;
    SetProcess(0);
    ResultComment('������� 0:',0,2);
    for j := 1 to 3*n1 do
      ResultN('', a[j], Center(j,3*n1,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiG4;
var i,n,n1,k,y,j: integer;
  a: array[1..5,1..3] of real;
  min: array[1..3] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ������� ����� (������� ������� �������) ��� �����',0,1);
  TaskText('�� ���� ���������~\= ������������ �����. ��������� ����� ������������',0,2);
  TaskText('� ���� ������������ �������� ��������, ����� ����������� �������� �����',0,3);
  TaskText('��������� �������� ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ��������� �������� � ������� ��������.',0,5);
  n1 := (n+1) div 2;
  for j := 1 to 3 do
  begin
    min[j] := 1000;
    for i := 1 to n1 do
    begin
      a[i,j] := 10+Random*89.98;
      if a[i,j]< min[j] then
        min[j] := a[i,j];
    end;
  end;
  y := 1;
  if n1 = 2 then y := 2;
  if n1 = 5 then y := 0;
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    DataR3('������� '+Chr(k+48)+':', a[i,1], a[i,2], a[i,3], 0, y+i, 6);
  end;
    SetProcess(0);
    ResultComment(' ������� 0:',0,2);
    for j := 1 to 3 do
      ResultR('', min[j], Center(j,3,5,1), 3, 5);
  SetTestCount(5);
end;

procedure MpiG5;
var i,n,y: integer;
    r,min,max: real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ������������ �����. ��������� ������� MPI\_Comm\_split',0,1);
  TaskText('� ���� ������������ �������� ��������, ����� ������������ �� �����, ������',0,2);
  TaskText('� ��������� � ������ ������ (������� ������� �������), � �����������',0,3);
  TaskText('�� �����, ������ � ��������� � �������� ������. ��������� ��������',0,4);
  TaskText('������� � ��������~0, � ��������� �������~\= � ��������~1.',0,5);
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  min := 1000;
  max := -1000;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    r := 89.98*Random+10;
    DataR('������� '+Chr(2*i+48)+': ', r, xLeft, y+i, 5);
    if r > max then
      max := r;
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 89.98*Random+10;
    DataR('������� '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    if r < min then
      min := r;
  end;
    SetProcess(0);
    ResultR('������� 0: ', max, xLeft, 3, 5);
    SetProcess(1);
    ResultR('������� 1: ', min, xRight, 3, 5);
  SetTestCount(5);
end;

procedure MpiG6;
var i,n,y,k,j: integer;
    a,b: array [1..10] of integer;
    r: array [1..10] of real;
begin
  n := Random(4)+6;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������� �������� ���� ����� �����~{K} � ����� �� {K}~������������ �����,',0,1);
  TaskText('� ������ ����������� �������� ���� ����� �����~{N}, ������� ����� ��������� ���',0,2);
  TaskText('��������:~0 �~1 (���������� ����������� ��������� � {N}~=~1 �����~{K}). ���������',0,3);
  TaskText('������� MPI\_Comm\_split � ���� ������������ �������� ���������, ���������',0,4);
  TaskText('�� ������ ������������� ����� �� �������� �������� � ������ �����������',0,5);
  TaskText('������� � {N}~=~1 � ������� � ���� ����������� ��������� ���������� �����.',0,0);
  k := Random(4)+2;
  for i := 1 to n-1 do
    a[i] := i;
  for i := 1 to n-1 do
    swap(a[i], a[Random(n-1)+1]);
  for i := 1 to k do
    b[a[i]] := 1;
  for i := k+1 to n-1 do
    b[a[i]] := 0;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  y := 2;
//  if (n+1) div 2 = 5 then y := 1;
    SetProcess(0);
    DataN('������� 0: K = ', k, xLeft, 1, 1);
    for j := 1 to k do
      DataR('',r[j],25+j*7,1,5);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], xLeft, y+i-1, 1);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], xRight, y+i-1, 1)
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for i := 1 to n-1 do
  begin
    if b[i]=1 then
    begin
      j := j + 1;
      SetProcess(i);
      ResultR('������� '+Chr(i+48)+': ', r[j], 0, y+j, 5);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiG7;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ���',0,1);
  TaskText('��������:~0 �~1 (������� ���� �� ���� ������� � {N}~=~1). ����� ����, � ������',0,2);
  TaskText('�������� � {N}~=~1 ���� ������������ �����~{A}. ��������� ������� MPI\_Comm\_split',0,3);
  TaskText('� ���� ������������ �������� ��������� ������, ��������� �����~{A} � ������',0,4);
  TaskText('�� ��������� � {N}~=~1 � ������� �� � ������� ����������� ������ �����������',0,5);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  m := -1;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      if m = -1 then
        m := i;
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('������� '+Chr(m+48)+':', 5, 3);
    for i := 1 to k do
      ResultR('', r[i], 9+i*7, 3, 5);
  SetTestCount(5);
end;

procedure MpiG8;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ���',0,1);
  TaskText('��������:~0 �~1 (������� ���� �� ���� ������� � {N}~=~1). ����� ����, � ������',0,2);
  TaskText('�������� � {N}~=~1 ���� ������������ �����~{A}. ��������� ������� MPI\_Comm\_split',0,3);
  TaskText('� ���� ������������ �������� ��������� ������, ��������� �����~{A} � ���������',0,4);
  TaskText('�� ��������� � {N}~=~1 � ������� �� � ������� ����������� ������ �����������',0,5);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  m := -1;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      m := i;
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('������� '+Chr(m+48)+':', 5, 3);
    for i := 1 to k do
      ResultR('', r[i], 9+i*7, 3, 5);
  SetTestCount(5);
end;

procedure MpiG9;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ���',0,1);
  TaskText('��������:~0 �~1 (������� ���� �� ���� ������� � {N}~=~1). ����� ����, � ������',0,2);
  TaskText('�������� � {N}~=~1 ���� ������������ �����~{A}. ��������� ������� MPI\_Comm\_split',0,3);
  TaskText('� ���� ������������ �������� ��������� ������, ��������� �����~{A} �� ���',0,4);
  TaskText('�������� � {N}~=~1 � ������� �� � ������� ����������� ������ �����������',0,5);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,0);
  k := Random(4)+2;
  for i := 1 to k do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for m := 0 to n-1 do
    if b[m]=1 then
    begin
      j := j + 1;
      SetProcess(m);
      ResultComment('������� '+Chr(m+48)+':', 5, y+j);
      for i := 1 to k do
        ResultR('', r[i], 9+i*7, y+j, 5);
    end;
  SetTestCount(5);
end;

procedure MpiG10;
var i,n,y,k,j,m: integer;
    a,b: array [0..10] of integer;
    r,r1,r2: array [0..10] of integer;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ��� ��������:',0,1);
  TaskText('1 �~2 (������� ���� �� ���� ������� � ������ �� ��������� ��������).',0,2);
  TaskText('����� ����, � ������ �������� ���� ����� �����~{A}. ��������� �������',0,3);
  TaskText('MPI\_Comm\_split � ���� ������������ �������� ��������� ������, ���������',0,4);
  TaskText('�����~{A}, ������ � ��������� � {N}~=~1, �� ��� �������� � {N}~=~1, � �����~{A},',0,5);
  TaskText('������ � ��������� � {N}~=~2, �� ��� �������� � {N}~=~2. �� ���� ���������',0,0);
  TaskText('������� ���������� ����� � ������� ����������� ������ �����������',0,0);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,0);
  repeat
  k := Random(4)+2;
  until (n-k>0) and (n-k<7);
  for i := 1 to n do
    r[i] := Random(90) + 10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 2;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  j := k;
  for i := 0 to n-1 do
    if b[i]=2 then
    begin
      j := j + 1;
      r2[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataN('A = ', r1[2*i], 23, y+i, 2)
    else
      DataN('A = ', r2[2*i], 23, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataN('A = ', r1[2*i-1], 63, y+i-1, 2)
    else
      DataN('A = ', r2[2*i-1], 63, y+i-1, 2)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('������� '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      for m := 1 to k do
        ResultN('', r[m], 13 + m*3, y+i, 2)
    else
      for m := 1 to n-k do
        ResultN('', r[k+m], 13+m*3, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('������� '+Chr(2*i-1+48)+':', 45, y+i-1);
    if b[2*i-1]=1 then
      for m := 1 to k do
        ResultN('', r[m], 53+m*3, y+i-1, 2)
    else
      for m := 1 to n-k do
        ResultN('', r[k+m], 53+m*3, y+i-1, 2)
  end;
  SetTestCount(5);
end;

procedure MpiG11;
var i,n,y,k,j,m: integer;
    sum: real;
    a,b: array [0..10] of integer;
    r,r1: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ���',0,1);
  TaskText('��������:~0 �~1 (������� ���� �� ���� ������� � {N}~=~1). ����� ����, � ������',0,2);
  TaskText('�������� � {N}~=~1 ���� ������������ �����~{A}. ��������� ������� MPI\_Comm\_split',0,3);
  TaskText('� ���� ������������ �������� ��������, ����� ����� ���� �������� �����~{A}',0,4);
  TaskText('� ������� �� �� ���� ��������� � {N}~=~1.',0,5);
  k := Random(4)+2;
  sum := 0;
  for i := 1 to k do
  begin
    r[i] := 89.98*Random+10;
    sum := sum + r[i];
  end;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 0;
  j := 0;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
  y := 1;
  if k = 2 then y := 2;
  if k = 5 then y := 0;
  j := 0;
  for m := 0 to n-1 do
    if b[m]=1 then
    begin
      j := j + 1;
      SetProcess(m);
      ResultR('������� '+Chr(m+48)+': ', sum, 5, y+j, 6);
    end;
  SetTestCount(5);
end;

procedure MpiG12;
var i,n,y,k,j: integer;
    min, max: real;
    a,b: array [0..10] of integer;
    r,r1,r2: array [0..10] of real;
begin
  n := Random(6)+5;
  CreateTask('������ ��������� � �������������', n);
  if n = 0 then exit;
  TaskText('� ������ �������� ���� ����� �����~{N}, ������� ����� ��������� ��� ��������:',0,1);
  TaskText('1 �~2 (������� ���� �� ���� ������� � ������ �� ��������� ��������).',0,2);
  TaskText('����� ����, � ������ �������� ���� ������������ �����~{A}. ��������� �������',0,3);
  TaskText('MPI\_Comm\_split � ���� ������������ �������� ��������, ����� �����������',0,4);
  TaskText('�������� ����� �����~{A}, ������� ���� � ��������� � {N}~=~1, � ������������',0,5);
  TaskText('�������� ����� �����~{A}, ������� ���� � ��������� � {N}~=~2. ��������� �������',0,0);
  TaskText('������� � ��������� � {N}~=~1, � ��������� ��������~\= � ��������� � {N}~=~2.',0,0);
  repeat
  k := Random(4)+2;
  until (n-k>0) and (n-k<7);
  for i := 1 to n do
    r[i] := 89.98*Random+10;
  for i := 0 to n-1 do
    a[i] := i;
  for i := 0 to n-1 do
    swap(a[i], a[Random(n)]);
  for i := 0 to k-1 do
    b[a[i]] := 1;
  for i := k to n-1 do
    b[a[i]] := 2;
  j := 0;
  min := 1000;
  for i := 0 to n-1 do
    if b[i]=1 then
    begin
      j := j + 1;
      r1[i] := r[j];
      if min > r[j] then
        min := r[j];
    end;
  j := k;
  max := -1000;
  for i := 0 to n-1 do
    if b[i]=2 then
    begin
      j := j + 1;
      r2[i] := r[j];
      if max < r[j] then
        max := r[j];
    end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5)
    else
      DataR('A = ', r2[2*i], 23, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5)
    else
      DataR('A = ', r2[2*i-1], 63, y+i-1, 5)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('������� '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      ResultR('', min, 16, y+i, 5)
    else
      ResultR('', max, 16, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('������� '+Chr(2*i-1+48)+':', 45, y+i-1);
    if b[2*i-1]=1 then
        ResultR('', min, 56, y+i-1, 5)
    else
        ResultR('', max, 56, y+i-1, 5)
  end;
  SetTestCount(5);
end;

procedure MpiH1;
var i,n,k,y,j,m,d: integer;
begin
  case 2 + Random(4) of
  2: n := 2*(2 + Random(4));
  3: n := 3*(2 + Random(2));
  4: n := 8;
  else n := 10;
  end;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  repeat
    k := 2 + Random(4);
  until n mod k = 0;
  TaskText('� ������� �������� ���� ����� �����~{N} (>\,1), ������ ��������, ��� ����������',0,1);
  TaskText('���������~{K} ������� ��~{N}. ��������� �����~{N} �� ��� ��������, ����� ����,',0,2);
  TaskText('��������� ������� MPI\_Cart\_create, ���������� ��� ���� ��������� ���������',0,3);
  TaskText('��������� � ���� ��������� �������~\= ������� ������� {N}\;\x\;{K}/{N} (�������',0,4);
  TaskText('��������� ��������� �������� �������). ��������� ������� MPI\_Cart\_coords,',0,5);
  TaskText('������� ��� ������� �������� ��� ���������� � ��������� ���������.',0,0);
  SetProcess(0);
  DataN('������� 0: N = ',k,0,3,1);
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultN2('������� ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH2;
var i,n,k,y,j,m,d: integer;
    s: string;
begin
  k := 2 + Random(4);
  n := k + 1 + Random(10-k);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 2 + Random(n-1);
  TaskText('� ������� �������� ���� ����� �����~{N} (>\,1), �� ������������� ����������',0,1);
  TaskText('���������~{K}. ��������� �����~{N} �� ��� ��������, ����� ���� ����������',0,2);
  TaskText('��������� ��������� ��� ��������� ����� ��������� � ���� ��������� �������~\=',0,3);
  TaskText('������� ������� {N}\;\x\;{K}/{N} (������ \</\> ���������� �������� ������� ������,',0,4);
  TaskText('������� ��������� ��������� ������� �������� �������). ��� ������� ��������,',0,5);
  TaskText('����������� � ��������� ���������, ������� ��� ���������� � ���� ���������.',0,0);
  SetProcess(0);
  DataN('������� 0: N = ',k,0,3,1);
  Str(n, s);
  DataComment('����������: ���������� ��������� K ����� '+s+'.',0,5);
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultN2('������� ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH3;
var i,n,k,y,j,m,d: integer;
    r: array[1..2] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 2;
  TaskText('����� ���������~{�} �������� ������: {K}~=~2{N}, {N}~>~1. � ���������~0 �~{N} ����',0,1);
  TaskText('�� ������ ������������� �����~{A}. ���������� ��� ���� ��������� ���������',0,2);
  TaskText('��������� � ���� ������� ������� 2\;\x\;{N}, ����� ����, ��������� �������',0,3);
  TaskText('MPI\_Cart\_sub, ��������� ������� ��������� �� ��� ���������� ������ (��� ����',0,4);
  TaskText('��������~0 �~{N} ����� �������� ���������� � ���������� �������). ���������',0,5);
  TaskText('���� ������������ �������� ��������� ������, ��������� �����~{A} �� ��������',0,0);
  TaskText('�������� ������ ������ �� ��� �������� ���� �� ������ � ������� ����������',0,0);
  TaskText('����� � ������ �������� (������� ��������~0 �~{N}).',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  begin
    SetProcess((i-1)*(n div k));
    r[i] := 8.98*Random+1;
    DataR('������� '+Chr((i-1)*(n div k)+48)+': A = ',r[i],0,2*i,3);
  end;
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('������� ' + Chr(m+48)+': ', r[i],Center(j,n div k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH4;
var i,n,k,y,j,m,d: integer;
    r: array[1..2] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 2;
  TaskText('����� ���������~{�} �������� ������: {K}~=~2{N}, {N}~>~1. � ���������~0 �~1 ����',0,1);
  TaskText('�� ������ ������������� �����~{A}. ���������� ��� ���� ��������� ���������',0,2);
  TaskText('��������� � ���� ������� ������� {N}\;\x\;2, ����� ����, ��������� �������',0,3);
  TaskText('MPI\_Cart\_sub, ��������� ������� ��������� �� ��� ���������� ������� (��� ����',0,4);
  TaskText('��������~0 �~1 ����� �������� ���������� � ���������� ��������). ���������',0,5);
  TaskText('���� ������������ �������� ��������� ������, ��������� �����~{A} �� ��������',0,0);
  TaskText('�������� ������� ������� �� ��� �������� ����� �� ������� � ������� ����������',0,0);
  TaskText('����� � ������ �������� (������� ��������~0 �~1).',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  begin
    SetProcess(i-1);
    r[i] := 8.98*Random+1;
    DataR('������� '+Chr(i-1+48)+': A = ',r[i],0,2*i,3);
  end;
  y := 1;
  if n div k = 5 then y := 0;
  if n div k = 2 then y := 2;
  d := 4;
  m := -1;
  for i := 1 to n div k do
    for j := 1 to k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('������� ' + Chr(m+48)+': ', r[j],Center(j,k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH5;
var i,n,k,y,j,m,d: integer;
    r: array[1..3,1..4] of integer;
    s: string;
begin
  n := 3*(2+Random(3));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText('����� ���������~{�} ������ ����: {K}~=~3{N}, {N}~>~1. � ���������~0,~{N} �~2{N} ����',0,1);
  TaskText('�� {N}~����� �����. ���������� ��� ���� ��������� ��������� ��������� � ����',0,2);
  TaskText('������� ������� 3\;\x\;{N}, ����� ����, ��������� ������� MPI\_Cart\_sub, ���������',0,3);
  TaskText('������� ��������� �� ��� ���������� ������ (��� ���� ��������~0,~{N} �~2{N}',0,4);
  TaskText('����� �������� ���������� � ���������� �������). ��������� ���� ������������',0,5);
  TaskText('�������� ��������� ������, ��������� �� ������ ��������� ����� �� ��������',0,0);
  TaskText('�������� ������ ������ �� ��� �������� ���� �� ������ � ������� ����������',0,0);
  TaskText('����� � ������ �������� (������� ��������~0,~{N} �~2{N}).',0,0);
  for i := 1 to k do
    for j := 1 to n do
  begin
    SetProcess((i-1)*n);
    DataComment('������� '+Chr((i-1)*n+48)+':',22,i+1);
    r[i,j] := Random(90) + 10;
    DataN('',r[i,j],Center(j,n,2,2),i+1,2);
  end;
  y := 1;
  d := 4;
  m := -1;
  for i := 1 to k do
    for j := 1 to n do
    begin
      m := m + 1;
      SetProcess(m);
      str(m:2,s);
      ResultN('������� ' + s+': ', r[i,j],Center(j,n,13,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH6;
var i,n,k,y,j,m,d: integer;
    r: array[1..3,1..4] of integer;
    s: string;
begin
  n := 3*(2+Random(3));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 3;
  n := n div k;
  TaskText('����� ���������~{�} ������ ����: {K}~=~3{N}, {N}~>~1. � ���������~0,~1 �~2 ����',0,1);
  TaskText('�� {N}~����� �����. ���������� ��� ���� ��������� ��������� ��������� � ����',0,2);
  TaskText('������� ������� {N}\;\x\;3, ����� ����, ��������� ������� MPI\_Cart\_sub, ���������',0,3);
  TaskText('������� ��������� �� ��� ���������� ������� (��� ���� ��������~0,~1 �~2',0,4);
  TaskText('����� �������� ���������� � ���������� ��������). ��������� ���� ������������',0,5);
  TaskText('�������� ��������� ������, ��������� �� ������ ��������� ����� �� ��������',0,0);
  TaskText('�������� ������� ������� �� ��� �������� ����� �� ������� � ������� ����������',0,0);
  TaskText('����� � ������ �������� (������� ��������~0,~1 �~2).',0,0);
  for i := 1 to k do
    for j := 1 to n do
  begin
    SetProcess(i-1);
    DataComment('������� '+Chr(i-1+48)+':',22,i+1);
    r[i,j] := Random(90) + 10;
    DataN('',r[i,j],Center(j,n,2,2),i+1,2);
  end;
  y := 1;
  if n = 2 then y := 2;
  d := 4;
  m := -1;
  for i := 1 to n do
    for j := 1 to k do
    begin
      m := m + 1;
      SetProcess(m);
      str(m:2,s);
      ResultN('������� ' + s+': ', r[j,i],Center(j,k,13,d),y+i,2);
    end;
  SetTestCount(5);
end;

procedure MpiH7;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of integer;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('���������� ���������~{K} �����~8 ��� 12, � ������ �������� ���� ����� �����.',0,1);
  TaskText('���������� ��� ���� ��������� ��������� ��������� � ���� ���������� �������',0,2);
  TaskText('������� 2\;\x\;2\;\x\;{K}/4 (������� ��������� ��������� �������� �������).',0,3);
  TaskText('������������� ��� ������� ��� ��� ������� ������� 2\;\x\;{K}/4 (� ���� �������',0,4);
  TaskText('������ �������� � ���������� ������ �����������), ��������� ������ �������',0,5);
  TaskText('��������� �� ��� ���������� ������. ��������� ���� ������������ ��������',0,0);
  TaskText('��������� ������, ��������� � ������� ������� ������ ������ �������� ����� ��',0,0);
  TaskText('��������� ���� �� ������ � ������� ���������� ������ ����� (������� �����,',0,0);
  TaskText('���������� �� ������� ��������� �����).',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := Random(90) + 10;
        DataN('������� '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  m := 0;
  y := 1;
  for l := 1 to 2 do
  for i := 1 to 2 do
  begin
    SetProcess(m);
    y := y + 1;
    str(m,s);
    ResultComment('������� ' + s+':', 20, y);
    for j := 1 to k do
      ResultN('', r[i,l,j],Center(j,k,2,2),y,2);
    m := m + k;
  end;
  SetTestCount(5);
end;

procedure MpiH8;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of integer;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('���������� ���������~{K} �����~8 ��� 12, � ������ �������� ���� ����� �����.',0,1);
  TaskText('���������� ��� ���� ��������� ��������� ��������� � ���� ���������� �������',0,2);
  TaskText('������� 2\;\x\;2\;\x\;{K}/4 (������� ��������� ��������� �������� �������).',0,3);
  TaskText('������������� ���������� ������� ��� {K}/4 ������ ������� 2\;\x\;2 (� ���� �������',0,4);
  TaskText('������ �������� � ���������� ������� �����������), ��������� ��� �������',0,5);
  TaskText('�� {K}/4 ��������� ������. ��������� ���� ������������ �������� ���������',0,0);
  TaskText('������, ��������� � ������� ������� ������ �� ���������� ������ ��������',0,0);
  TaskText('����� �� ��������� ���� �� ������� � ������� ���������� ������ ����� (�������',0,0);
  TaskText('�����, ���������� �� ������� ��������� ������).',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := Random(90) + 10;
        DataN('������� '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  y := 1;
  if k = 2 then y := 2;
  for j := 1 to k do
  begin
    SetProcess(j-1);
    str(j-1,s);
    ResultComment('������� ' + s+':', 20, y+j);
    m := 0;
    for l := 1 to 2 do
    for i := 1 to 2 do
    begin
      m := m + 1;
      ResultN('', r[i,l,j],Center(m,4,2,2),y+j,2);
    end;
  end;
  SetTestCount(5);
end;

procedure MpiH9;
var i,n,k,y,j,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    r1: array[1..2,1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('���������� ���������~{K} �����~8 ��� 12, � ������ �������� ���� ������������',0,1);
  TaskText('�����. ���������� ��� ���� ��������� ��������� ��������� � ���� ����������',0,2);
  TaskText('������� ������� 2\;\x\;2\;\x\;{K}/4 (������� ��������� ��������� �������� �������).',0,3);
  TaskText('������������� ��� ������� ��� ��� ������� ������� 2\;\x\;{K}/4 (� ���� �������',0,4);
  TaskText('������ �������� � ���������� ������ �����������), ��������� ������ �������',0,5);
  TaskText('��������� �� {K}/4 ���������� ��������. ��������� ���� ������������ ��������',0,0);
  TaskText('��������, ��� ������� ������� ��������� ����� ������������ ��������',0,0);
  TaskText('����� � ������� ��������� ������������ � ������� ��������� ������� �������.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('������� '+s+': ',r[i,l,j],Center(j,k,17,4),i+(l-1)*3,4);
      end;
  for i := 1 to 2 do
  for j := 1 to k do
    r1[i,j] := r[1,i,j]*r[2,i,j];

  y := 0;
  for i := 1 to 2 do
  begin
    m := (i-1)*k*2;
    for j := 1 to k do
    begin
      SetProcess(m);
      str(m,s);
      ResultR('������� ' + s+': ', r1[i,j],Center(j,k,17,4),y+2*i,5);
      m := m + 1;
    end;
  end;
  SetTestCount(5);
end;

procedure MpiH10;
var i,n,k,j,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    r1: array[1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('���������� ���������~{K} �����~8 ��� 12, � ������ �������� ���� ������������',0,1);
  TaskText('�����. ���������� ��� ���� ��������� ��������� ��������� � ���� ����������',0,2);
  TaskText('������� ������� 2\;\x\;2\;\x\;{K}/4 (������� ��������� ��������� �������� �������).',0,3);
  TaskText('������������� ���������� ������� ��� {K}/4 ������ ������� 2\;\x\;2 (� ���� �������',0,4);
  TaskText('������ �������� � ���������� ������� �����������), ��������� ��� �������',0,5);
  TaskText('�� {K}/4 ��������� ������. ��������� ���� ������������ �������� ��������,',0,0);
  TaskText('��� ������ �� ���������� ������ ����� ����� �������� ����� � �������',0,0);
  TaskText('��������� ����� � ������ �������� ��������������� �������.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('������� '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  for j := 1 to k do
  begin
    r1[j] := 0;
    for i := 1 to 2 do
    for l := 1 to 2 do
      r1[j] := r1[j]+r[i,l,j];
  end;
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        ResultR('������� '+s+': ',r1[j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  SetTestCount(5);
end;

function GetRank(m,n,x,y,p1,p2: integer): integer;
begin
  result := -1;
  if ((x < 0) or (x >= m))and(p1=0) then exit;
  if ((y < 0) or (y >= n))and(p2=0) then exit;
  x := (x+10*m) mod m;
  y := (y+10*n) mod n;
  result := x * n + y;
end;

procedure MpiH11;
var i,n,y,x,m,k: integer;
    a,b: array [0..9] of integer;
begin
  m := Random(4)+2;
  n := 2*m + Random(10-2*m+1);
  k := n div m;
  n := m*k+1;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText('� ������� �������� ���� ������������� ����� �����~{M} �~{N}, ������������ �������',0,1);
  TaskText('�� ����������� ���������� ���������; ����� ����, � ��������� � ������� ��~0',0,2);
  TaskText('��~{M}\*{N}\,\-\,1 ���� ����� �����~{X} �~{Y}. ��������� �����~{M} �~{N} �� ��� ��������,',0,3);
  TaskText('����� ���� ���������� ��� ��������� {M}\*{N}~��������� ��������� ��������� � ����',0,4);
  TaskText('��������� ������� ������� {M}\;\x\;{N}, ���������� ������������� �� �������',0,5);
  TaskText('��������� (������� ��������� ��������� �������� �������). � ������ ��������,',0,0);
  TaskText('�������� � ��������� ���������, ������� ���� �������� � ������������',0,0);
  TaskText('{X},~{Y} (� ������ �������������), ��������� ��� ����� �������',0,0);
  TaskText('MPI\_Cart\_rank. � ������ ������������ ��������� �������~\-1.',0,0);
  n := m*k;
  for i := 0 to n-1 do
  begin
    a[i] := Random(m+4)-2;
    b[i] := Random(k+4)-2;
  end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  if (n+1) div 2 = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    x := 16;
    DataComment('������� '+Chr(2*i+48)+': ', 5, y+i);
    if i=0 then
    begin
    DataN('M =', m, x, y+i, 2);
    DataN('N =', k, x+7, y+i, 2);
    x := x + 14;
    end;
    DataN('X =', a[2*i], x, y+i, 2);
    DataN('Y =', b[2*i], x+7, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataComment('������� '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('������� '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],1,0), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('������� '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],1,0), 45, y+i-1, 2);
  end;
  SetTestCount(5);
end;

procedure MpiH12;
var i,n,y,x,m,k: integer;
    a,b: array [0..9] of integer;
begin
  m := Random(4)+2;
  n := 2*m + Random(10-2*m+1);
  k := n div m;
  n := m*k+1;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  repeat
    m := Random(4)+2;
    k := n div m;
  until k > 1;
  TaskText('� ������� �������� ���� ������������� ����� �����~{M} �~{N}, ������������ �������',0,1);
  TaskText('�� ����������� ���������� ���������; ����� ����, � ��������� � ������� ��~0',0,2);
  TaskText('��~{M}\*{N}\,\-\,1 ���� ����� �����~{X} �~{Y}. ��������� �����~{M} �~{N} �� ��� ��������,',0,3);
  TaskText('����� ���� ���������� ��� ��������� {M}\*{N}~��������� ��������� ��������� � ����',0,4);
  TaskText('��������� ������� ������� {M}\;\x\;{N}, ���������� ������������� �� �������',0,5);
  TaskText('��������� (������� ��������� ��������� �������� �������). � ������ ��������,',0,0);
  TaskText('�������� � ��������� ���������, ������� ���� �������� � ������������',0,0);
  TaskText('{X},~{Y} (� ������ �������������), ��������� ��� ����� �������',0,0);
  TaskText('MPI\_Cart\_rank. � ������ ������������ ��������� �������~\-1.',0,0);
  n := m*k;
  for i := 0 to n-1 do
  begin
    a[i] := Random(m+4)-2;
    b[i] := Random(k+4)-2;
  end;
  y := 2;
  if (n+1) div 2 = 5 then y := 1;
  if (n+1) div 2 = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    x := 16;
    DataComment('������� '+Chr(2*i+48)+': ', 5, y+i);
    if i=0 then
    begin
    DataN('M =', m, x, y+i, 2);
    DataN('N =', k, x+7, y+i, 2);
    x := x + 14;
    end;
    DataN('X =', a[2*i], x, y+i, 2);
    DataN('Y =', b[2*i], x+7, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataComment('������� '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('������� '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],0,1), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('������� '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],0,1), 45, y+i-1, 2);
  end;
  SetTestCount(5);
end;

procedure MpiH13;
var i,n,y: integer;
  a: array[1..5] of real;
begin
  n := Random(4)+3;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  TaskText('� ������ ����������� �������� ���� ������������ �����. ���������� ���',0,1);
  TaskText('���� ��������� ��������� ��������� � ���� ���������� ������� � �����������',0,2);
  TaskText('������� ����� �������� ������ � �����~\-1 (����� �� ������� ������������',0,3);
  TaskText('�������� ������������ � ���������� �������). ��� ����������� ������ ����������',0,4);
  TaskText('� ����������� ��������� ������������ ������� MPI\_Cart\_shift, ���������',0,5);
  TaskText('��������� � ������� ������� MPI\_Send � MPI\_Recv. �� ���� ���������,',0,0);
  TaskText('���������� ������, ������� ��� ������.',0,0);
  for i := 1 to 5 do
    a[i] := 89.98*Random+10;
  y := 1;
  if n = 6 then y := 0;
  if n = 3 then y := 2;
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    DataR('������� '+Chr(i+48)+': ', a[i], 0, y+i, 5);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i-1);
    ResultR('������� '+Chr(i-1+48)+': ', a[i], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiH14;
var i,n,k,y,j,m,d: integer;
    r: array[1..2,0..10] of real;
begin
  n := 2*(2+Random(4));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := 2;
  TaskText('����� ���������~{�} �������� ������: {K}~=~2{N}, {N}~>~1; � ������ ��������',0,1);
  TaskText('���� ������������ �����~{A}. ���������� ��� ���� ��������� ���������',0,2);
  TaskText('��������� � ���� ������� ������� 2\;\x\;{N} (������� ��������� ��������� ��������',0,3);
  TaskText('�������) � ��� ������ ������ ������� ����������� ����������� ����� ��������',0,4);
  TaskText('������ � �����~1 (�����~{A} �� ������� ��������, ����� ���������� � ������,',0,5);
  TaskText('������������ � ��������� ������� ���� �� ������, � �� ���������� ��������~\= �',0,0);
  TaskText('������� ������� ���� ������). ��� ����������� ������ ���������� � �����������',0,0);
  TaskText('��������� ������������ ������� MPI\_Cart\_shift, ��������� ��������� � �������',0,0);
  TaskText('������� MPI\_Sendrecv. �� ���� ��������� ������� ���������� ������.',0,0);
  SetPrecision(1);
  for i := 1 to 2 do
  for j := 0 to n do
    r[i,j] := 8.98*Random+1;
  y := 1;
  if k = 5 then y := 0;
  if k = 2 then y := 2;
  d := 4;
  if n div k = 5 then d := 1;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      ResultR('������� ' + Chr(m+48)+': ', r[i,j-1],Center(j,n div k,14,d),y+i,3);
    end;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      DataR('������� ' + Chr(m+48)+': ', r[i,j mod (n div k)],Center(j,n div k,14,d),y+i,3);
    end;
  SetTestCount(5);
end;

procedure MpiH15;
var i,n,k,j,j1,m,l: integer;
    r: array[1..2,1..2,1..3] of real;
    s: string;
begin
  n := 4*(Random(2)+2);
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 4;
  n := 4;
  TaskText('���������� ���������~{K} �����~8 ��� 12, � ������ �������� ���� ������������',0,1);
  TaskText('�����. ���������� ��� ���� ��������� ��������� ��������� � ���� ����������',0,2);
  TaskText('������� ������� 2\;\x\;2\;\x\;{K}/4 (������� ��������� ��������� �������� �������).',0,3);
  TaskText('������������� ���������� ������� ��� {K}/4 ������ ������� 2\;\x\;2 (� ���� �������',0,4);
  TaskText('������ �������� � ���������� ������� �����������, ������� �����������',0,5);
  TaskText('�� ����������� ������� ����������), ����������� ����������� ����� ��������',0,0);
  TaskText('������ �� ��������� ������ ������� � ��������������� �������� ���������',0,0);
  TaskText('������� (�� ��������� ��������� ������� ������ ������������ � ������',0,0);
  TaskText('�������). ��� ����������� ������ ���������� � ����������� ���������',0,0);
  TaskText('������������ ������� MPI\_Cart\_shift, ��������� ��������� � ������� �������',0,0);
  TaskText('MPI\_Sendrecv\_replace. �� ���� ��������� ������� ���������� ������.',0,0);
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        r[i,l,j] := 8.98*Random+1;
        DataR('������� '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  m := -1;
  for l := 1 to 2 do
  for i := 1 to 2 do
    for j := 1 to k do
      begin
        m := m + 1;
        SetProcess(m);
        str(m:2,s);
        j1 := j - 1;
        if j1 = 0 then j1 := k;
        ResultR('������� '+s+': ',r[i,l,j1],Center(j,k,17,5),i+(l-1)*3,5);
      end;
  SetTestCount(5);
end;

procedure MpiH16;
var i,n,y,k: integer;
    a: array [0..10] of integer;
begin
  n := 2*(2+Random(3))+1;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 2;
  TaskText('����� ���������~{K} �������� ��������: {K}~=~2{N}\,+\,1 (1~<~{N}~<~5); � ������ ��������',0,1);
  TaskText('���� ����� �����~{A}. ��������� ������� MPI\_Graph\_create, ���������� ��� ����',0,2);
  TaskText('��������� ��������� �����, � ������� ������� ������� ������ ������� �� �����',0,3);
  TaskText('���������� ��������� ����� (1,~3,~\., 2{N}\,\-\,1), � ������ ������� �������',0,4);
  TaskText('�������������� �����~{R} (2, 4,~\., 2{N}) ������ ������ � ��������� �����~{R}\,\-\,1',0,5);
  TaskText('(� ���������� ���������� {N}-������� ������, ������� ������� �������� �������',0,0);
  TaskText('�������, � ������ ��� ������� �� ���� ����������� ���������~{R} �~{R}\,+\,1, ������',0,0);
  TaskText('��������� � ������ �������� ������� ��������� �����~{R}). ��������� �����~{A} ��',0,0);
  TaskText('������� �������� ���� ���������, ��������� � ��� ������� (\I���������-�������\i).',0,0);
  TaskText('��� ����������� ���������� ���������-������� � �� ������ ������������ �������',0,0);
  TaskText('MPI\_Graph\_neighbors\_count � MPI\_Graph\_neighbors, ��������� ���������',0,0);
  TaskText('� ������� ������� MPI\_Send � MPI\_Recv. �� ���� ��������� ������� ����������',0,0);
  TaskText('����� � ������� ����������� ������ ����������� �� ���������.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 4 then y := 1;
    SetProcess(0);
    DataN('������� 0: A = ', a[0], xLeft, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': A = ', a[2*i-1], xLeft, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': A = ', a[2*i], xRight, y+i, 2)
  end;
    SetProcess(0);
    ResultComment('������� 0:',12,y);
    for i := 1 to k do
      ResultN('', a[2*i-1], 20+i*3, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('������� '+Chr(2*i-1+48)+':',12,y+i);
    ResultN('', a[0], 23, y+i, 2);
    ResultN('', a[2*i], 26, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('������� '+Chr(2*i+48)+':',51,y+i);
    ResultN('', a[2*i-1], 62, y+i, 2)
  end;
  SetTestCount(5);
end;

procedure MpiH17;
var i,n,y,k,j: integer;
    a: array [0..10] of integer;
begin
  n := 2*(2+Random(4));
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 2;
  TaskText('����� ���������~{K} �������� ������: {K}~=~2{N} (1~<~{N}~<~6); � ������ ��������',0,1);
  TaskText('���� ����� �����~{A}. ��������� ������� MPI\_Graph\_create, ���������� ��� ����',0,2);
  TaskText('��������� ��������� �����, � ������� ��� �������� ������� ����� (�������',0,3);
  TaskText('������� �������) ������� � �������: 0 \= 2 \= 4 \= 6 \= \. \= (2{N}\,\-\,2), � ������',0,4);
  TaskText('������� ��������� �����~{R} (1, 3,~\., 2{N}\,\-\,1) ������ � ��������� �����~{R}\,\-\,1',0,5);
  TaskText('(� ���������� ������ ������� ��������� ����� ����� ����� ������������� ������,',0,0);
  TaskText('������ � ��������� �������� ������� ����� ����� ����� �� ��� ������,',0,0);
  TaskText('� ���������~\= \<����������\>~\= �������� ������� ����� ����� ����� �� ���',0,0);
  TaskText('������). ��������� �����~{A} �� ������� �������� ���� ���������-�������. ���',0,0);
  TaskText('����������� ���������� ���������-������� � �� ������ ������������ �������',0,0);
  TaskText('MPI\_Graph\_neighbors\_count � MPI\_Graph\_neighbors, ��������� ���������',0,0);
  TaskText('� ������� ������� MPI\_Sendrecv. �� ���� ��������� ������� ����������',0,0);
  TaskText('����� � ������� ����������� ������ ����������� �� ���������.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 5 then y := 1;
  if k = 2 then y := 3;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('������� '+Chr(2*i+48)+': A = ', a[2*i], xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('������� '+Chr(2*i-1+48)+': A = ', a[2*i-1], xRight, y+i-1, 2);
  end;

  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('������� '+Chr(2*i+48)+':', 12, y+i);
    j := 23;
    if 2*i-2 >=0 then
    begin
      ResultN('', a[2*i-2], j, y+i, 2);
      j := j + 3;
    end;
    ResultN('', a[2*i+1], j, y+i, 2);
    j := j + 3;
    if 2*i+2 <n then
      ResultN('', a[2*i+2], j, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('������� '+Chr(2*i-1+48)+': ', a[2*i-2], 51, y+i-1, 2);
  end;
  SetTestCount(5);
end;                                 

procedure MpiH18;
var i,n,y,k,j,m: integer;
    a: array [0..12] of integer;
    s: string;
begin
  n := 3*(2+Random(3))+1;
  CreateTask('����������� ���������', n);
  if n = 0 then exit;
  k := n div 3;
  TaskText('���������� ���������~{K} �����~3{N}\,+\,1 (1~<~{N}~<~5); � ������ �������� ���� �����',0,1);
  TaskText('�����~{A}. ��������� ������� MPI\_Graph\_create, ���������� ��� ���� ���������',0,2);
  TaskText('��������� �����, � ������� ��������~{R}, {R}\,+\,1, {R}\,+\,2, ��� {R}~=~1,~4, 7,~\., �������',0,3);
  TaskText('����� ����� �������, �, ����� ����, ������ ������� �������������� �����,',0,4);
  TaskText('�������� ���� (3, 6,~\.), ������ ������ � ������� ��������� (� ����������',0,5);
  TaskText('���������� {N}-������� ������, ������� ������� �������� ������� �������,',0,0);
  TaskText('� ������ ��� ������� �� ���� ��������� ����� ����� ���������, ������ � �������',0,0);
  TaskText('������ ������� �����, �������� ����). ��������� �����~{A} �� ������� ��������',0,0);
  TaskText('���� ���������-�������. ��� ����������� ���������� ���������-������� � ��',0,0);
  TaskText('������ ������������ ������� MPI\_Graph\_neighbors\_count � MPI\_Graph\_neighbors,',0,0);
  TaskText('��������� ��������� � ������� ������� MPI\_Sendrecv. �� ���� ��������� �������',0,0);
  TaskText('���������� ����� � ������� ����������� ������ ����������� �� ���������.',0,0);
  for i := 0 to n-1 do
    a[i] := Random(90) + 10;
  y := 2;
  if k = 4 then y := 1;
  SetProcess(0);
    DataN('�������  0: A = ', a[0], 0, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    DataN('������� '+s+': A = ', a[m], Center(j,3,18,6), y+i, 2);
  end;
  SetProcess(0);
  ResultComment('�������  0:', 31, y);
  for i := 1 to k do
    ResultN('', a[3*i], 40+i*3, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    ResultComment('������� '+s+':', -17+j*24, y+i);
    case j of
    1: begin
         ResultN('', a[m+1], -5+j*24, y+i, 2);
         ResultN('', a[m+2], -2+j*24, y+i, 2);
       end;
    2: begin
         ResultN('', a[m-1], -5+j*24, y+i, 2);
         ResultN('', a[m+1], -2+j*24, y+i, 2);
       end;
    3: begin
         ResultN('', a[0], -5+j*24, y+i, 2);
         ResultN('', a[m-2], -2+j*24, y+i, 2);
         ResultN('', a[m-1], 1+j*24, y+i, 2);
       end;
    end;
  end;
  SetTestCount(5);
end;

(*procedure MpiA0;
var i,n: integer;
    d: real;
    s: string;
begin
  n := 36;//Random(3)+31;
  CreateTask('�������� � �� �����', n);
  if n = 0 then exit;
  TaskText('� ������ �� ���������, �������� � ������������ MPI\_COMM\_WORLD,',0,2);
  TaskText('�������� ���� ������������ ����� � ������� ��� ��������������� ��������.',0,4);
  SetProcess(0);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    d := Random*199.99-100;
    Str(i:2, s);
    DataR('������� '+s+': ', d, 0, i+1, 6);
    ResultR('������� '+s+': ', -d, 0, i+1, 6);
  end;
  SetTestCount(5);
end;
*)


procedure MpiB24b;
var i,j,n,k,k0,x1,y1: integer;
    a: array[0..4,1..5] of integer;
    b: array[0..4,1..5] of real;

begin
  n := 2*RandomN(3, 5);
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '���������� ��������� {K} �������� ������: {K}~=~2{N}. � ��������� ������� �����'#13#10
+'(0, 2,~\., {K}\,\-\,2) ��� ����� �� {N} ������������ �����, � ��������� ���������'#13#10
+'����� (1, 3,~\., {K}\,\-\,1) \= ����� �� {N} ����� �����. ��������� �������'#13#10
+'MPI\_Sendrecv\_replace, ��������� ����������� ����� ���� ������� ������������'#13#10
+'����� � ����������� ���������� ������ ��������� � ����������� ����� ����'#13#10
+'������� ����� ����� � ����������� ���������� ������ (����� �������,'#13#10
+'������������ ������ ���� ��������� �� �������� 0 � ������� 2, �� �������� 2 \='#13#10
+'� ������� 4,~\., �� �������� {K}\,\-\,2 \= � ������� 0; ������������� ������ ����'#13#10
+'��������� �� �������� {K}\,\-\,1 � ������� {K}\,\-\,3, �� �������� {K}\,\-\,3 � ������� {K}\,\-\,5,~\.,'#13#10
+'�� �������� 1 � ������� {K}\,\-\,1). ������� � ������ �������� ���������� �����.'#13#10
+'��� ����������� ������ ���������-����������� ������������ ���������,'#13#10
+'���������� �������� % ���������� ������� �� �������, � �������� �����'#13#10
+'��������-����������� ���������� ��������� ��������� MPI\_ANY\_SOURCE.'#13#10
+'\P\S��������.\s ����� �������� ������������ ����, ����������� ���������������'#13#10
+'\I��������� �������\i \Mtemplate<typename T> void sendrecv(int rank, int size,\m'#13#10
+'\MMPI\_Datatype d, int step)\m, ��� �������� step ��������� �������� ������,'#13#10
+'������ 2 ��� ������� ������������ ����� � \-2 ��� ������������� �������.'
);

  k := n div 2;
  for i := 0 to k-1 do
    for j := 1 to k do
    begin
      a[i,j] := RandomN(10,99);
      b[i,j] := RandomR(1.0,9.9);
    end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataComment(prc(i), x1, y1);
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k do
    if Odd(i) then
    begin
      DataN(a[y1-1, j], x1, y1, 2);
      ResultN(a[(y1)mod k, j], x1, y1, 2);
      x1 := x1 + 3;
    end
    else
    begin
      DataR(b[y1-1, j], x1, y1, 4);
      ResultR(b[(y1+k-2)mod k, j], x1, y1, 4);
      x1 := x1 + 5;
    end;
  end;

  SetTestCount(5);
end;

procedure MpiB25b;
var i,j,n,k,k0,x0,x1,y1: integer;
    a: array[0..4,1..5] of integer;
    b: array[0..4,1..5] of real;

begin
  n := 2*RandomN(3, 5);
  CreateTask('����������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '���������� ��������� {K} �������� ������: {K}~=~2{N}. � ������ �������� ���������'#13#10
+'��� ����� ����� ����� ������� {R}\,+\,1, ��� {R} \= ���� �������� ({R}~=~0, 1,~\., {N}\,\-\,1),'#13#10
+'�� ������ �������� ��������� ��� ����� ������������ ����� ������� 2{N}\,\-\,{R},'#13#10
+'��� {R} \= ���� �������� ({R}~=~{N}, {N}\,+\,1,~\., 2{N}\,\-\,1). ��������� ������� MPI\_Sendrecv,'#13#10
+'��������� �������� ������ �� ������ �������� ��������� � ���������������'#13#10
+'������� ������ �������� (� ���������, ����� �� �������� 0 ���� ���������'#13#10
+'� ������� {N}, �� �������� 1 \= � ������� {N}\,+\,1, �� �������� {N} \= � ������� 0,'#13#10
+'�� �������� 2{N}\,\-\,1 \= � ������� {N}\,\-\,1). ������� � ������ �������� ���������� �����.'#13#10
+'\P\S��������.\s ����� �������� ������������ ����, ����������� ���������������'#13#10
+'\I��������� �������\i \Mtemplate<typename T1, typename T2> void\m'#13#10
+'\Msendrecv(MPI\_Datatype d1, int cnt1, int rank2, MPI\_Datatype d2, int cnt2)\m,'#13#10
+'��� ��������� d1 � cnt1 ���������� �������������� ��������, ���������� �������'#13#10
+'(��� ��������� � ������ � �� ����������), � ��������� rank2, d2, cnt2 \= ����'#13#10
+'� ����������� �������������� ��������, � ������� ����������� ����� �������.'
);

  k := n div 2;
  for i := 0 to k-1 do
    for j := 1 to k do
    begin
      a[i,j] := RandomN(10,99);
      b[i,j] := RandomR(1.0,9.9);
    end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    k0 := i+1;
    x0 := 3;
    if i >= k then
    begin
      x1 := 41;
      y1 := y1 - k;
      k0 := n-i;
      x0 := 5;
    end;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k0 do
    begin
      if i< k then
        DataN(a[y1-1, j], x1, y1, 2)
      else
        DataR(b[y1-1, j], x1, y1, 4);
      x1 := x1 + x0;
    end;  
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    k0 := k-i;
    x0 := 5;
    if i >= k then
    begin
      x1 := 41;
      y1 := y1 - k;
      k0 := i+1-k;
      x0 := 3;
    end;
    ResultComment(prc(i), x1, y1);
    x1 := x1 + 12;
    for j := 1 to k0 do
    begin
      if i< k then
        ResultR(b[y1-1, j], x1, y1, 4)
      else
        ResultN(a[y1-1, j], x1, y1, 2);
      x1 := x1 + x0;
    end;
  end;

  SetTestCount(5);
end;


procedure MpiB24a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of integer;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; �� ���� ���������, ����� ������,'#13#10
+'�������� {N} �����~0, � ��������� ���������� �������� �������� {N} �����~1.'#13#10
+'� ���������� �������� ����� ��� ����� ����� ����� {A} ������� {K}~\-~1,'#13#10
+'��� {K} \= ���������� ���������. �� �������� ����� {A} � �������, ���������'#13#10
+'�� ������ �������� ����� ������ �� ����������� �������� �� ��� ���������'#13#10
+'��������, ��������� �� � ������� ����������� ������, � ������� � ������'#13#10
+'�������� ���������� �����. ��� ��������� ������ ������������ ���������'#13#10
+'���������� ������� ������� MPI\_Issend (������� ��������� � ����������'#13#10
+'������������� ������) � MPI\_Wait � ���������� �������� � ������� MPI\_Recv'#13#10
+'� ��������� ���������. ������������� ���������� � ������� �������'#13#10
+'�����������������  ������� ������ ������� MPI\_Wait � �������������;'#13#10
+'��� ����� ������� ������� MPI\_Wtime �� � ����� MPI\_Wait � � ������� �������'#13#10
+'Show ������� �������� ������������ �������� MPI\_Wtime ��������, ����������'#13#10
+'�� 1000. ���������, ��� ��������� ���������� ����������, ���� ������'#13#10
+'������� MPI\_Issend ������������ ������� MPI\_Isend (������� ���������'#13#10
+'� ����������� ������������� ������).'
);

  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomN(10,99);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := 1
    else
      k0 := 0;
    DataN(prc(i)+ 'N=', k0, x1, y1, 1);
    if i = k then
    begin
    x1 := x1 + 15;
    DataComment('A: ', x1, y1);
    for j := 1 to n-1 do
    begin
      x1 := x1+3;
      DataN(a[j], x1, y1, 2);
    end;
    end
    else
    begin
      j := i+1;
      if i > k then
        j := j-1;
      ResultN(prc(i)+'A=', a[j], x1, y1, 2);
    end;
  end;
  s[1] := '1.89';
  s[2] := '0.00';
  s[3] := '0.01';
  s[4] := '0.30';
  s[5] := '0.19';
  s[6] := '0.28';
  s[7] := '0.02';
  DataComment(DebugSec, 1, (n-1) div 2 +2);
  DataComment(' '+IntToStr(k)+'|  1>  '+s[1], 1, (n-1) div 2 +3);
  for i := 2 to n-1 do
    DataComment(s[i], 5+i*5, (n-1) div 2 +3);

  SetTestCount(5);
end;

procedure MpiB25a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of real;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; � ��������� ���������� ��������'#13#10
+'�������� {N} ����� \-1, � � ��������� ��������� {N} �������� ���������� � �����'#13#10
+'����� {R} ����������� ��������. �� ���� ���������, ����� �����������, ����� ����'#13#10
+'������������ ����� {A}. ��������� ������ ����� {A} � ���������� ������� � �������'#13#10
+'�� � ������� ����������� ������ ���������-������������. ��� ��������� ������'#13#10
+'������������ ��������� ���������� ������� ������� MPI\_Recv � ����������'#13#10
+'�������� � ������� MPI\_Issend � MPI\_Test � ��������� ���������. ����� �������'#13#10
+'MPI\_Test ��������� � ����� �� ��� ���, ���� ��� �� ������ ��������� ����,'#13#10
+'� ���������� � ������� ������� ��������������� ���������� �������� �����'#13#10
+'�����, ��������� ������� Show. ���������, ��� ��������� ���������� ����������,'#13#10
+'���� ������ ������� MPI\_Issend ������������ ������� MPI\_Isend.'
);

  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomR(1.0,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
      if i > k then
        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
    end
    else
    begin
    ResultComment(prc(i)+'A: ', 1, 1);
    x1 := 10;
    for j := 1 to n-1 do
    begin
      x1 := x1+5;
      ResultR(a[j], x1, 1, 4);
    end;
    end;
  end;
  s[1] := '30379';
  s[2] := '99750';
  s[3] := '32805';
  s[4] := '63904';
  s[5] := '32022';
  s[6] := '98283';
  s[7] := '35860';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to n-1 do
  begin
      j := i-1;
      if i > k then
        j := j+1;
    DataComment(' '+IntToStr(j)+'|  1>  '+s[i], 1, (n-1) div 2 + 2 + i);
  end;

  SetTestCount(5);
end;

procedure MpiB26a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of string;
    a: array[1..10] of real;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; � ��������� ���������� ��������'#13#10
+'�������� {N} ����� \-1, � � ��������� ��������� {N} �������� ���������� � �����'#13#10
+'����� {R} ����������� ��������. �� ���� ���������, ����� �����������, ����� ����'#13#10
+'������������ ����� {A}. ��������� ������ ����� {A} � ���������� ������� � �������'#13#10
+'�� � ������� �������� ������ ���������-������������. ��� ��������� ������'#13#10
+'������������ ��������� ���������� ������� ������� MPI\_Irecv (����� ���������'#13#10
+'� ������������� ������) � MPI\_Test � ���������� �������� � ������� MPI\_Ssend'#13#10
+'� ��������� ���������. ����� ������� ������ ������� MPI\_Irecv ������������'#13#10
+'����, � ������� �������� ������� MPI\_Test, ���� ��� �� ������ ��������� ����,'#13#10
+'� ���������� � ������� ������� ��������������� ���������� �������� �����'#13#10
+'�����, ��������� ������� Show. ���������, ��� ��������� ���������� ����������,'#13#10
+'���� ������ ������� MPI\_Ssend ������������ ������� MPI\_Send!.'
);

  k := RandomN(0,n-1);
  for i := 1 to n do
    a[i] := RandomR(1.0,9.9);
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
      if i > k then
        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
    end
    else
    begin
    ResultComment(prc(i)+'A: ', 1, 1);
    x1 := 10;
    for j := n-1 downto 1 do
    begin
      x1 := x1+5;
      ResultR(a[j], x1, 1, 4);
    end;
    end;
  end;
  s[1] := '3319';
  s[2] := '1';
  s[3] := '1';
  s[4] := '1';
  s[5] := '1';
  s[6] := '1';
  s[7] := '1';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  DataComment(' '+IntToStr(k)+'|  1>  '+s[1], 1, (n-1) div 2 + 3);
  for i := 2 to n-1 do
    DataComment(s[i], 11+i*2, (n-1) div 2 + 3);


{  ResultComment('������ ������, ���������� � ������� �������:', 1, (n+1) div 2 +1);
  for i := 1 to n-1 do
  begin
      j := i-1;
      if i > k then
        j := j+1;
    ResultComment(' '+IntToStr(j)+'|  1>  '+s[i], 1, (n+1) div 2 +1+i);
  end;}

  SetTestCount(5);
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure MpiB27a;
var i,j,n,k,k0,x1,y1: integer;
    s: array [1..10] of integer;
    sum: real;
    a: array[1..10] of real;
    s0: string;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; � ��������� ���������� ��������'#13#10
+'�������� {N} ����� \-1, � � ��������� ��������� {N} �������� ���������� � �����'#13#10
+'����� {R} ����������� ��������. �� ���� ���������, ����� �����������, ����� ����'#13#10
+'������������ ����� {A}. ��������� ������ ����� {A} � ���������� ������� � �������'#13#10
+'�� ����� {S}. ��� ��������� ������ ������������ ��������� ���������� �������'#13#10
+'������� MPI\_Irecv � MPI\_Waitany � ���������� �������� � ������� MPI\_Ssend'#13#10
+'� ��������� ���������. � ���������� �������� ������� ������ {Q} ���� MPI\_Request'#13#10
+'� ������������ ����� ������� MPI\_Irecv � ��������� �����, �������� ��� �������'#13#10
+'������ ���� ������� ������� {Q}. ����� ������ �� ����� ����� ������������ ������'#13#10
+'����, � ������� �������� ������� MPI\_Waitany � ����������� ����� {S}.'#13#10
+'������������� �� ������ �������� ������� ����� ���������� � ������� �������'#13#10
+'��������� ������ (��������� �� ������ ������ ������� Show � ShowLine):'#13#10
+'�������� {A}, ����������� � ����� �� ������ �������� �����,'#13#10
+'� ���� ��������, ������������ ��� ��������.'
);

  k := RandomN(0,n-1);
  sum := 0;
  for i := 1 to n do
  begin
    a[i] := RandomR(1.0,9.9);
  end;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k then
      k0 := -1
    else
      k0 := k;
    DataN(prc(i)+ 'N=', k0, x1, y1, 2);
    if i <> k then
    begin
      j := i+1;
//      if i > k then
//        j := j-1;
      x1 := x1 + 17;
      DataR('A=', a[j], x1, y1, 4);
      sum := sum + a[j];
    end;
  end;
    SetProcess(k);
    ResultR(prc(k)+'Sum=', sum, 1, 1, 5);
    for i := 1 to n do
      s[i] := i-1;
    for i := 1 to 2 * n do
      SwapN(s[RandomN(1, n)], s[RandomN(1, n)]);

  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  k0 := 0;
  for i := 1 to n do
  begin
      j := s[i];
      if j = k then continue;
      k0 := k0 + 1;
      Str(a[j+1]:0:2,s0);
    DataComment(' '+IntToStr(k)+'|  '+IntToStr(k0)+'>  '+s0 + ' '+IntToStr(j), 1, (n-1) div 2 + 2+i);
  end;

  SetTestCount(5);
end;

procedure MpiB28a;
var i,j,n,k1, k2,k0,x1,y1: integer;
    s: array [1..10] of integer;
    sum: real;
    a: array[1..10] of integer;
    s0: string;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; �� ���� ���������, �� ����������� ����,'#13#10
+'�������� {N} �����~0; � ����� �� ���������� ��������� (\I��������-�����������\i)'#13#10
+'�������� {N} �����~1, � ������ (\I��������-����������\i) �������� {N} �����~2.'#13#10
+'� ��������-����������� ����� ���� ����� ����� {R} \= ���� �������� ����������'#13#10
+'� ����� {A} ����� ����� ������� {K}, ��� {K} \= ���������� ���������. �� ��������'#13#10
+'����� {A} � �������, ��������� ��� ��� �������� ��������-���������� � ������� ��'#13#10
+'� ��� �� �������. ��� ��������� ������ ������������ ������������ ����� �������'#13#10
+'MPI\_Ssend\_init � ��������� ���������� ������� ������� MPI\_Start � MPI\_Wait'#13#10
+'� ��������-����������� � ������������ ����� ������� MPI\_Recv\_init � ���������'#13#10
+'���������� ������� ������� MPI\_Start � MPI\_Wait � ��������-����������.'#13#10
+'������������� ���������� � ������� ������� ����������������� ������� ������'#13#10
+'������� MPI\_Wait � ������������� (��� ��� ��������-�����������, ��� � ���'#13#10
+'��������-����������); ��� ����� ������� ������� MPI\_Wtime �� � ����� MPI\_Wait'#13#10
+'� � ������� ������� Show ������� �������� ������������ �������� MPI\_Wtime'#13#10
+'��������, ���������� �� 1000. ���������, ��� ��������� ���������� ����������,'#13#10
+'���� ������ ������� MPI\_Ssend\_init ������������ ������� MPI\_Send\_init.'
);

  k1 := RandomN(0,n-1);
  k2 := RandomN(0,n-1);
  while k2 = k1 do
    k2 := RandomN(0,n-1);

  for i := 1 to n do
  begin
    a[i] := RandomN(1,9);
  end;

  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    if i = k1 then
      k0 := 1
    else
    if i = k2 then
      k0 := 2
    else
      k0 := 0;
    DataN(prc(i)+ 'N=', k0, x1, y1, 1);
    if i = k1 then
    begin
      x1 := x1 + 15;
      DataN('R=', k2, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('A: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to n do
      begin
        x1 := x1 + 2;
        DataN(a[j], x1, y1, 1);
      end;
    end;
  end;
    SetProcess(k2);
    ResultComment(prc(k2)+'A: ', 1, 1);
    x1 := 13;
    for j := 1 to n do
    begin
      x1 := x1 + 2;
      ResultN(a[j], x1, 1, 1);
    end;

  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  DataComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, (n-1) div 2 + 3);
  DataComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, (n-1) div 2 + 4);
  SetTestCount(5);
end;

procedure MpiB29a;
var i,j,n,k1,k2,j0,k0,x1,y1: integer;
    k: array [1..10] of integer;
    sum: real;
    a: array[1..10,1..10] of integer;
    s,c: array[1..10] of integer;
    s0: array [1..10] of string;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; � ����� �� ���������'#13#10
+'(\I��������-����������\i) �������� {N} �����~2, � ��������� ���������'#13#10
+'(\I���������-������������\i) �������� {N} �����~1, � ��������� ���������'#13#10
+'�������� {N} �����~0. � ������ �� ���������-������������ ����� ���� �����'#13#10
+'����� {R} \= ���� ��������-���������� � ����� {A} ����� ����� ������� {K},'#13#10
+'��� {K} \= ���������� ���������. � ��������-���������� ���� ����� ����� {C} \='#13#10
+'���������� ���������-������������. ��������� ��� ������ {A} ��������-����������'#13#10
+'� ������� ����� {S} ��������� �������� ��������� ���� ������� {A} � �����������'#13#10
+'��������� (� ������� ����������� ��������). ��� ��������� ������ ������������'#13#10
+'������������ ����� ������� MPI\_Ssend � ���������-������������.'#13#10
+'� ��������-���������� ������� ������ {Q} ���� MPI\_Request � ������������ �����'#13#10
+'������� MPI\_Recv\_init � ��������� �����, �������� ��� ������� ������ ����'#13#10
+'������� ������� {Q}. ����� ������ �� ����� ����� ��������� ������������ �����'#13#10
+'������� MPI\_Startall � ������������ ������ ����, � ������� �������� �������'#13#10
+'MPI\_Waitany � ����������� ��������� �������� � ������� {S}. �������������'#13#10
+'�� ������ �������� ������� ����� ���������� � ������� ������� ��������� ������'#13#10
+'(��������� ��� ������ ������� Show � ���� ����� ShowLine): �����������������'#13#10
+'������� ������ ������� MPI\_Waitany � �������������, �������� ��������'#13#10
+'��������� index, ������������ �������� MPI\_Waitany, � ����'#13#10
+'��������-�����������, ��������������� ��������� index. ��� ����������'#13#10
+'����������������� ������� ������� MPI\_Wtime �� � ����� MPI\_Waitany � ���������'#13#10
+'�������� ������������ �������� MPI\_Wtime ��������, ������� �� �� 1000.'#13#10
+'��� ���������� ����� ��������-����������� ���������������� �������� ����������'#13#10
+'��������� (���� MPI\_Status), ������������� �������� MPI\_Waitany.'
);
  k0 := RandomN(2, n-2);
  for i := 1 to n do
    s[i] := 0;
  for i := 1 to k0 do
  begin
    k[i] := 1;
    for j := 1 to n do
    begin
      a[i, j] := RandomN(1, 9);
      s[j] := s[j] + a[i,j];
    end;
  end;
  k[k0+1] := 2;
  for i := k0+2 to n do
    k[i] := 0;
  for i := 1 to 2 * n do
    SwapN(k[RandomN(1, n)], k[RandomN(1, n)]);
  j := 0;
  for i := 1 to n do
  begin
    if k[i] = 2 then
      k2 := i-1;
    if k[i] = 1 then
    begin
      j := j + 1;
      c[j] := i-1;
    end;
  end;
  for i := 1 to 2 * n do
    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);
  j0 := 0;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataN(prc(i)+ 'N=', k[i+1], x1, y1, 1);
    if k[i+1] = 1 then
    begin
      j0 := j0 + 1;
      x1 := x1 + 15;
      DataN('R=', k2, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('A: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to n do
      begin
        x1 := x1 + 2;
        DataN(a[j0,j], x1, y1, 1);
      end;
    end
    else
    if k[i+1] = 2 then
    begin
      x1 := x1 + 15;
      DataN('C=', k0, x1, y1, 1);
    end;
  end;
    SetProcess(k2);
    ResultComment(prc(k2)+'A: ', 1, 1);
    x1 := 12;
    for j := 1 to n do
    begin
      x1 := x1 + 3;
      ResultN(s[j], x1, 1, 2);
    end;
  s0[1] := '1>  3.02 0 ';
  s0[2] := '2>  0.01 1 ';
  s0[3] := '3>  0.69 2 ';
  s0[4] := '4>  0.95 3 ';
  s0[5] := '5>  1.12 4 ';
  s0[6] := '6>  0.14 5 ';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to k0 do
    DataComment(' '+IntToStr(k2)+'|  '+s0[i]+IntToStr(c[i]), 1, (n-1) div 2 + 2+i);
{
   3|  1>  1.76 0 5
 3|  2>  2.30 1 4


  1|  1>  0.94 0 4
 1|  2>  1.53 1 0
 1|  3>  0.00 2 3


 1|  2>  0.01 1 6
 1|  3>  0.00 2 2

 2|  s[1] := '1>  3.02 0' 3
 2|  2>  0.01 1 6
 2|  3>  0.69 2 4
 2|  4>  0.95 3 0
 1|  5>  1.12 3 3
 1|  1>  0.14 0 5
}

//  ResultComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
//    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, 3);
//  ResultComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
//    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, 4);
  SetTestCount(5);
end;

procedure MpiB30a;
var i,j,n,k1,k2,j0,k0,x1,y1: integer;
    k: array [1..10] of integer;
    d: real;
    a: array[1..10,1..10] of integer;
    s,c: array[1..10] of integer;
    s0: array [1..10] of string;

begin
  n := RandomN(5, 8);
  CreateTask('������������� ��������� ������', n);
  if n = 0 then exit;
TaskText(
 '� ������ �������� ���� ����� ����� {N}; � ����� �� ���������'#13#10
+'(\I��������-�����������\i) �������� {N} �����~1, � ��������� ���������'#13#10
+'(\I���������-�����������\i) �������� {N} �����~2, � ��������� ���������'#13#10
+'�������� {N} �����~0. � ��������-����������� ����� ���� ������������ ����� {A},'#13#10
+'����� ����� {C} \= ���������� ���������-����������� � ����� ����� ����� {R}'#13#10
+'������� {C}, ���������� ����� ���������-�����������. ��������� ����� {A} ����'#13#10
+'���������-����������� � ������� ��� � ������ �� ���� ���������. ��� ���������'#13#10
+'������ ������������ ������� MPI\_Recv � ���������-�����������.'#13#10
+'� ��������-����������� ������� ������ {Q} ���� MPI\_Request � ������������ �����'#13#10
+'������� MPI\_Ssend\_init � ��������� �����, �������� ��� ������� ������ ����'#13#10
+'������� ������� {Q}. ����� ������ �� ����� ����� ��������� ������������ �����'#13#10
+'������� MPI\_Startall � ������������ ������ ����, � ������� �������� �������'#13#10
+'MPI\_Testany �� ��������� �����, ���� ��� �� ������ ��������� ����.'#13#10
+'������������� �� ������ �������� ������� ����� ���������� � ������� �������'#13#10
+'��������� ������ (��������� �� ������ ������ ������� Show � ShowLine):'#13#10
+'�������� �������� ��������� index, ������������ �������� MPI\_Testany'#13#10
+'(� ��������, ����� ��� ������� ��������� ����), � ���������� �������������'#13#10
+'������� ������� MPI\_Testany (�.\,�. ���������� �������� ���������� �����).'#13#10
+'���������, ��� ��������� ���������� ����������, ���� ������'#13#10
+'������� MPI\_Ssend\_init ������������ ������� MPI\_Send\_init.'
);
  k0 := RandomN(2, n-2);
  if k0 = 6 then
    k0 := 5;
  for i := 1 to n do
    s[i] := 0;
  for i := 1 to k0 do
  begin
    k[i] := 2;
    for j := 1 to n do
    begin
      a[i, j] := RandomN(1, 9);
      s[j] := s[j] + a[i,j];
    end;
  end;
  k[k0+1] := 1;
  for i := k0+2 to n do
    k[i] := 0;
  for i := 1 to 2 * n do
    SwapN(k[RandomN(1, n)], k[RandomN(1, n)]);
  j := 0;
  for i := 1 to n do
  begin
    if k[i] = 1 then
      k2 := i-1;
    if k[i] = 2 then
    begin
      j := j + 1;
      c[j] := i-1;
    end;
  end;
//  for i := 1 to 2 * n do
//    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);
  d := RandomR(1, 9.9);
  j0 := 0;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataN(prc(i)+ 'N=', k[i+1], x1, y1, 1);
    if k[i+1] = 1 then
    begin
      j0 := j0 + 1;
      x1 := x1 + 15;
      DataR('A=', d, x1, y1, 4);
      x1 := x1 + 7;
      DataN('C=', k0, x1, y1, 1);
      x1 := x1 + 4;
      DataComment('R: ', x1, y1);
      x1 := x1 + 1;
      for j := 1 to k0 do
      begin
        x1 := x1 + 2;
        DataN(c[j], x1, y1, 1);
      end;
    end
{    else
    if k[i+1] = 2 then
    begin
      x1 := x1 + 15;
      DataN('A=', d, x1, y1, 4);
    end;}
  end;
  for i := 0 to k0-1 do
  begin
    SetProcess(c[i+1]);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    ResultR(prc(c[i+1])+ 'A=', d, x1, y1, 4);
  end;

  for i := 1 to n do
    c[i] := i - 1;

  for i := 1 to 2 * n do
    SwapN(c[RandomN(1, k0)], c[RandomN(1, k0)]);

  s0[1] := ' 3';
  s0[2] := ' 36994';
  s0[3] := ' 2339';
  s0[4] := ' 2';
  s0[5] := ' 34889';
  DataComment(DebugSec, 1, (n-1) div 2 + 2);
  for i := 1 to k0 do
    DataComment(' '+IntToStr(k2)+'|  '+IntToStr(i) + '>  ' +IntToStr(c[i])+s0[i], 1, (n-1) div 2 + 2 + i);
{

 4|  2>  2 3
 4|  3>  1 36994
 6|  1>  0 2339
 6|  2>  2 2
 6|  3>  1 34889



   3|  1>  1.76 0 5
 3|  2>  2.30 1 4


  1|  1>  0.94 0 4
 1|  2>  1.53 1 0
 1|  3>  0.00 2 3


 1|  2>  0.01 1 6
 1|  3>  0.00 2 2

 2|  s[1] := '1>  3.02 0' 3
 2|  2>  0.01 1 6
 2|  3>  0.69 2 4
 2|  4>  0.95 3 0
 1|  5>  1.12 3 3
 1|  1>  0.14 0 5
}

//  ResultComment(' '+IntToStr(k1)+'|  '+IntToStr(1)+'> '+
//    Copy(' 1.47 0.01 0.00 0.33 0.31 0.45 0.31 0.31', 1, n*5), 1, 3);
//  ResultComment(' '+IntToStr(k2)+'|  '+IntToStr(1)+'> '+
//    Copy(' 0.67 0.37 0.46 0.32 0.43 0.31 0.31 1.57', 1, n*5), 1, 4);
  SetTestCount(5);
end;


procedure InitTask(num: integer); stdcall;
begin
  case num of
{//  1: MpiA1;
  1: MpiA2;
  2: MpiA3;
//  4: MpiA4;
  3: MpiA5;
  4: MpiA6;
//  7: MpiA7;
  5: MpiA8;
  6: MpiA9;}
  1: MpiB1;
  2: MpiB2;
  3: MpiB3;
 4: MpiB4;
 5: MpiB5;
 6: MpiB6;
 7: MpiB7;
 8: MpiB8;
 9: MpiB9;
 10: MpiB10;
 11: MpiB11;
 12: MpiB12;
 13: MpiB13;
 14: MpiB14;
 15: MpiB15;
 16: MpiB16;
 17: MpiB17;
 18: MpiB18;
 19: MpiB19;
 20: MpiB20;
 21: MpiB21;
 22: MpiB22;
 23: MpiB23;
 24: MpiB24b;
 25: MpiB25b;
 26: MpiB24a;
 27: MpiB25a;
 28: MpiB26a;
 29: MpiB27a;
 30: MpiB28a;
 31: MpiB29a;
 32: MpiB30a;

  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI2Send', '����� ����������� ����� ���������� ����������', '�. �. �������, 2010,2017',
  'sddfgfsjnbvvdfsd78fgfgd', 32, InitTask);
//  CommentText('���� ���������� ��������� � ������� �� ����������, �� ����� �������, ��� ��� ���������� �� �����������~12.');
//  CommentText('��� \I������� ���������\i ����� � ������������� ������� ����������');
//  CommentText('������� �����~0 ��� ������������� MPI\_COMM\_WORLD. ��� ���� ��������� ���������� ����� � �������� ������������');
//  CommentText('����� ������������ \I����������� ���������\i.');
//  CommentText('\P���� � ������� �� ������ ��� �������������� �����, �� ����� ��������� �������������.');
//  CommentText('���� � ������� �� ������������ ������������ ������ ������ �����, �� ��� ������� ������� ������~10.');
end;

//exports inittaskgroup;

begin
end.
