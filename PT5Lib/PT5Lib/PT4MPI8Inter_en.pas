{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI8Inter_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  alphabet = '0123456789abcdefghijklmnopqrstuvwxyz';
  prcname = 'Process %d: ';
  title1 = 'Inter-communicator creation';
  title2 = 'Collective communications for inter-communicators';
  title3 = 'Process creation';

  DebugSec = 'The content of the debug section should be as follows:';
  DebugSec1 = 'The possible content of the debug section in case of the correct solution:';

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

function PrcLong(n, nmax: integer): string;
begin
  result := Format(prcname, [n]);
  if (nmax > 10) and (n < 10) then
    result := result + ' ';
end;

procedure SwapN(var a,b: integer);
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure SwapR(var a,b: real);
var c: real;
begin
  c := a;
  a := b;
  b := c;
end;

var a: array[0..64] of integer;
    b, b1: array[0..64] of real;
    n, m, k: integer;

procedure MPIInter1;
var
  i, j, k0, x1, x2, y1, y2, l: integer;
begin
  n := 2*RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {X} is given in each'#13+
'process. Using the MPI\_Comm\_group, MPI\_Group\_range\_incl, and MPI\_Comm\_create'#13+
'functions, create two communicators: the first one contains the even-rank'#13+
'processes in the same order (0, 2,~\., {K}/2~\-~2), the second one contains'#13+
'the odd-rank processes in the same order (1, 3,~\., {K}/2~\-~1). Output'#13+
'the ranks {R} of the processes included in these communicators. Then combine'#13+
'these communicators into an inter-communicator using the MPI\_Intercomm\_create'#13+
'function. Using the MPI\_Send and MPI\_Recv functions for this'#13+
'inter-communicator, send the integer {X} from each process to the process'#13+
'with the same rank from the other group of the inter-communicator'#13+
'and output the received integers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� �����~{X}.'#13#10
+'��������� ������� MPI\_Comm\_group, MPI\_Group\_range\_incl � MPI\_Comm\_create,'#13#10
+'������� �������������, ������ �� ������� �������� �������� ������� �����'#13#10
+'� ��� �� ������� (0, 2,~\., {K}/2~\-~2), � ������ \= �������� ��������� �����'#13#10
+'� ��� �� ������� (1, 3,~\., {K}/2~\-~1). ������� ����� ��������� {R} � ���������'#13#10
+'��������������. ����� ���������� ��������� ������������� � �����������������'#13#10
+'� ������� ������� MPI\_Intercomm\_create. ��������� ������� MPI\_Send � MPI\_Recv'#13#10
+'��� ���������� ������������������, �������� ��� ������� �������� ����� {X}'#13#10
+'�� �������� ���� �� �����, ��������� � ������ ������ ����� ��'#13#10
+'������������������, � ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    a[i] := RandomN(10,99);
    x1 := 1 + 40 * ((i) mod 2);
{    if not Odd(i) then
    begin
      x1 := 1;
    end
    else
    begin
      x1 := 40;
    end;}
    y1 := (i) div 2 + 1;
    DataN(prclong(i,n)+ 'X = ', a[i], x1, y1, 2);
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    if not Odd(i) then
    begin
//      x1 := 1;
      k0 := a[i+1];
    end
    else
    begin
//      x1 := 40;
      k0 := a[i-1];
    end;
//    x1 := x1 + l;
    y1 := (i) div 2 + 1;
    ResultN(prclong(i,n) + 'R = ', y1-1, x1, y1, 1);
    x1 := x1 + l + 7;
    ResultN('X = ', k0, x1, y1, 2);
  end;
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;

procedure MPIInter2;
var
  i, j, x1, x2, y1, y2, l: integer;
  c: array[0..50] of integer;
  k0, k1: integer;
begin
  n := 2*RandomN(3,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} and a real number {X}'#13+
'are given in each process. The numbers {C} are equal to 0 or 1, the amount'#13+
'of integers 1 is equal to the amount of integers 0. The integer {C} is equal'#13+
'to 0 in the process of rank 0 and is equal to 1 in the process of rank {K}~\-~1.'#13+
'Using one call of the MPI\_Comm\_split function, create two communicators:'#13+
'the first one contains processes with {C}~=~0 (in the same order) and'#13+
'the second one contains processes with {C}~=~1 (in the inverse order).'#13+
'Output the ranks {R} of the processes included in these communicators'#13+
'(note that the first and the last processes of the MPI\_COMM\_WORLD'#13+
'communicator will receive the value {R}~=~0). Then combine these communicators'#13+
'into an inter-communicator using the MPI\_Intercomm\_create function.'#13+
'Using the MPI\_Send and MPI\_Recv functions for this inter-communicator, send'#13+
'the real number {X} from each process to the process with the same rank from'#13+
'the other group of the inter-communicator and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C}'#13#10
+'� ������������ ����� {X}. ����� {C} ����� ���� 0, ���� 1, ���������� �������� 1'#13#10
+'����� ���������� �������� 0, ������ � �������� ����� 0 ���� {C}, ������ 0,'#13#10
+'� � �������� ����� {K}~\-~1 ���� {C}, ������ 1. ��������� ���� ����� �������'#13#10
+'MPI\_Comm\_split, ������� �������������, ������ �� ������� �������� ��������'#13#10
+'�� ���������� {C}~=~0 � ��� �� �������, � ������ \= �������� �� ���������� {C}~=~1'#13#10
+'� �������� �������. ������� ����� ��������� {R} � ��������� ��������������'#13#10
+'(��� ���� �������� {R}~=~0 ������� ������ � ��������� �������� ���������'#13#10
+'������������� MPI\_COMM\_WORLD). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create. ��������� �������'#13#10
+'MPI\_Send � MPI\_Recv ��� ���������� ������������������, �������� ��� �������'#13#10
+'�������� ����� {X} �� �������� ���� �� �����, ��������� � ������ ������ �����'#13#10
+'������������������, � ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  for i := 1 to n - 2 do
    a[i] := i;
  for i := 1 to 2 * n do
    SwapN(a[RandomN(1, n-2)], a[RandomN(1, n-2)]);
  c[0] := 0;
  c[n-1] := 1;
  for i := 1 to n  div 2 - 1 do
    c[a[i]] := 0;
  for i := n div 2 to n-2 do
    c[a[i]] := 1;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    b[i] := RandomR(1.0,9.9);
    x1 := 1 + 40 * ((i) mod 2);
{    if not Odd(i) then
    begin
      x1 := 1;
    end
    else
    begin
      x1 := 40;
    end;}
    y1 := (i) div 2 + 1;
    DataN(prclong(i,n)+'C = ', c[i], x1, y1, 1);
    x1 := x1 + l + 7;
    DataR('X = ', b[i], x1, y1, 4);
  end;

  k0 := 0;
  k1 := n-1;
  for i := 1 to n div 2 do
  begin
    while c[k0] = 1 do
      k0 := k0 + 1;
    while c[k1] = 0 do
      k1 := k1 - 1;
    a[k0] := i-1;
    a[k1] := i-1;
    SwapR(b[k0], b[k1]);
    k0 := k0 + 1;
    k1 := k1 - 1;
  end;


  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := (i) div 2 + 1;
    ResultN(prclong(i,n)+'R = ', a[i], x1, y1, 1);
    x1 := x1 + l + 7;
    ResultR('X = ', b[i], x1, y1, 4);
  end;
//  DataComment(prc(0)+'--', xLeft, 10);
//  DataComment(prc(1)+'--', xRight, 10);

end;

procedure MPIInter3;
var
  i, j, x1, x2, y1, y2, l: integer;
  c: array[0..30] of real;
  k: array[0..2] of integer;
begin
  n := 3*RandomN(2,4);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 3. A real number {X} is given in'#13+
'the processes of rank 3{N} ({N}~=~0,~\., 3{K}~\-~3), real numbers {X} and {Y} are given'#13+
'in the processes of rank 3{N}~+~1, a real number {Y} is given in the processes'#13+
'of rank 3{N}~+~2. Using the MPI\_Comm\_group, MPI\_Group\_range\_incl,'#13+
'and MPI\_Comm\_create functions, create three communicators: the first one'#13+
'contains processes of rank 3{N} in the same order (0, 3,~\., {K}~\-~3),'#13+
'the second one contains processes of rank 3{N}~+~1 in the inverse order'#13+
'({K}~\-~2, {K}~\-~5,~\., 1), the third one contains processes of rank 3{N}~+~2'#13+
'in the same order (2, 5,~\., {K}~\-~1). Output the ranks {R} of the processes'#13+
'included in these communicators. Then combine these communicators into'#13+
'two inter-communicators using the MPI\_Intercomm\_create function. The first'#13+
'inter-communicator contains the first and second group of processes,'#13+
'the second one contains the second and third group of processes.'#13+
'Using the MPI\_Send and MPI\_Recv functions for these inter-communicators,'#13+
'exchange the numbers {X} in the processes with the same rank in the first'#13+
'and second group and the numbers {Y} in the processes with the same rank'#13+
'in the second and third group. Output the received number in each process.'#13+
'\P\SNote.\s The MPI\_Intercomm\_create function should be called once for processes'#13+
'of the first and third groups, and twice for processes of the second group,'#13+
'and this number of calls should be performed'#13+
'for the MPI\_Send and MPI\_Recv functions.');
(*
TaskText(
 '���������� ��������� {K} ������ 3. � ��������� ����� 3{N} ({N}~=~0,~\., 3{K}~\-~3)'#13#10
+'���� ������������ ����� {X}, � ��������� ����� 3{N}~+~1 ���� ������������ ����� {X}'#13#10
+'� {Y}, � ��������� ����� 3{N}~+~2 ���� ������������ ����� {Y}. ��������� �������'#13#10
+'MPI\_Comm\_group, MPI\_Group\_range\_incl � MPI\_Comm\_create, ������� �������������,'#13#10
+'������ �� ������� �������� ������ ��������� ����� 3{N} � ��� �� �������'#13#10
+'(0, 3,~\., {K}~\-~3), ������ \= ������ ��������� ����� 3{N}~+~1 � �������� �������'#13#10
+'({K}~\-~2, {K}~\-~5,~\., 1), � ������ \= ������ ��������� ����� 3{N}~+~2 � ��� ��'#13#10
+'������� (2, 5,~\., {K}~\-~1). ������� ����� ��������� {R} � ���������'#13#10
+'��������������. �����, ��������� ������� MPI\_Intercomm\_create, ����������'#13#10
+'��������� ������������� � ��� ������������������: ������ ������ ���������'#13#10
+'������ � ������ ������ ���������, � ������ \= ������ � ������ ������. ���������'#13#10
+'������� MPI\_Send � MPI\_Recv ��� ��������� �������������������, ��������'#13#10
+'����� {X} ��� ��������� ����������� �����, �������� � ������ � ������ ������,'#13#10
+'� ����� {Y} ��� ��������� ����������� �����, �������� �� ������ � ������ ������.'#13#10
+'������� � ������ �������� ���������� �����.'#13#10
+'\P\S��������.\s ������� �������� �������� �� ��, ��� ������� MPI\_Intercomm\_create'#13#10
+'������ ���������� ���� ��� ��� ���������, �������� � ������ � ������ ������,'#13#10
+'� ��� ���� ��� ���������, �������� �� ������ ������, � ����� �� ����������'#13#10
+'������� ������ ���� ��� ������� MPI\_Send � MPI\_Recv.'
);*)
  l := length(prclong(1,n));
  for i := 0 to n - 1 do
  begin
    b[i] := RandomR(1.0,9.9);
    c[i] := RandomR(1.,9.9);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    j := i div 3;
    y1 := (i) div 3 + 1;
    case i mod 3 of
    0: begin
         x1 := 1;
         DataR(prc(i)+ 'X = ', b[3*j], x1, y1, 4);
       end;
    1: begin
         x1 := 25;
         DataR(prclong(i,n)+ 'X = ', b[n-3*j-2], x1, y1, 4);
         x1 := x1 + l + 9;
         DataR('Y = ', c[n-3*j-2], x1, y1, 4);
       end;
    2: begin
         x1 := 57;
         DataR(prclong(i,n)+ 'Y = ', c[3*j+2], x1, y1, 4);
       end;
    end;
{    if not Odd(i) then
    begin
      x1 := 1;
    end
    else
    begin
      x1 := 40;
    end;}
  end;
  k[0] := 0;
  k[1] := n div 3 - 1;
  k[2] := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    j := i div 3;
    y1 := (i) div 3 + 1;
    case i mod 3 of
    0: begin
         x1 := 1;
         ResultN(prc(i) + 'R=', k[0], x1, y1, 1);
         k[0] := k[0] + 1;
         x1 := x1 + 10 + 5;
         ResultR('X=', b[3*j+1], x1, y1, 4);
       end;
    1: begin
         x1 := 25;
         ResultN(prclong(i,n) + 'R=', k[1], x1, y1, 1);
         k[1] := k[1] - 1;
         x1 := x1 + l + 4;
         ResultR('X=', b[n-3*j-3], x1, y1, 4);
         x1 := x1 + 7;
         ResultR('Y=', c[n-3*j-1], x1, y1, 4);
       end;
    2: begin
         x1 := 57;
         ResultN(prclong(i,n) + 'R=', k[2], x1, y1, 1);
         k[2] := k[2] + 1;
         x1 := x1 + l + 4;
         ResultR('Y=', c[3*j+1], x1, y1, 4);
       end;
    end;
  end;
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;

procedure MPIInter4;
var
  i, j, jj, x1, x2, y1, y2, l: integer;
  col: array[0..30] of integer;
  a, b: array[0..30,0..2] of integer;
  k: array[0..2] of integer;
  a0, b0: integer;
  tita, titb: string;

begin
  n := 3*RandomN(2,4);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 3. Three integers are given'#13+
'in each process. The first integer (named {C}) is in the range 0 to 2,'#13+
'the amount of each value 0, 1, 2 is equal to {K}/3, processes 0, 1, 2 contain {C}'#13+
'with the value 0, 1, 2 respectively. Using one call of the MPI\_Comm\_split'#13+
'function, create three communicators: the first one contains processes'#13+
'with {C}~=~0 (in the same order), the second one contains processes with {C}~=~1'#13+
'(in the same order), the third one contains processes with {C}~=~2 (in the same'#13+
'order). Output the ranks {R} of the processes included in these communicators'#13+
'(note that the processes 0, 1, 2 of the MPI\_COMM\_WORLD communicator will'#13+
'receive the value {R}~=~0). Then combine these communicators into three'#13+
'inter-communicators using two calls of the MPI\_Intercomm\_create function'#13+
'in each process. The first inter-communicator contains groups of processes'#13+
'with {C} equal to 0 and 1, the second one contains groups of processes'#13+
'with {C} equal to 1 and 2, the third one contains groups of processes'#13+
'with {C} equal to 0 and 2 (thus, the created inter-communicators will form'#13+
'a \Iring\i connecting all three previously created groups). Denoting two next'#13+
'given integers in the first group as {X} and {Y}, in the second group as {Y} and {Z},'#13+
'and in the third group as {Z} and {X} (in this order) and using two calls'#13+
'of the MPI\_Send and MPI\_Recv functions for these inter-communicators, exchange'#13+
'the numbers {X} in the processes with the same rank in the first and second'#13+
'group, the numbers {Y} in the processes with the same rank in the second'#13+
'and third group, and the numbers {Z} in the processes with the same rank'#13+
'in the first and third group. Output the received numbers in each process.');
(*
TaskText(
 '���������� ��������� {K} ������ 3. � ������ �������� ���� ��� ����� �����.'#13#10
+'������ ����� (������������ ������ {C}) ����� � ��������� �� 0 �� 2, ������'#13#10
+'������ �� �������� 0, 1, 2 ����������� ���������� ����� ��� (������ {K}/3)'#13#10
+'� ��� ���� � ��������� ����� 0, 1, 2 �������� {C} ��������� � ������� ����'#13#10
+'���������. ��������� ���� ����� ������� MPI\_Comm\_split, ������� �������������,'#13#10
+'������ �� ������� �������� �������� �� ���������� {C}~=~0 � ��� �� �������,'#13#10
+'������ \= �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (��� ���� �������� {R}~=~0 ������� ������ ��� �������� ���������'#13#10
+'������������� MPI\_COMM\_WORLD). �����, ��������� �� ��� ������ �������'#13#10
+'MPI\_Intercomm\_create � ������ ��������, ���������� ��������� �������������'#13#10
+'� ��� ������������������: ������ ������ ��������� ������ ���������'#13#10
+'�� ���������� {C}, ������� 0 � 1, ������ \= ������ �� ���������� 1 � 2,'#13#10
+'������ \= ������ �� ���������� 0 � 2 (����� �������, ���������'#13#10
+'������������������ ����� ������������ \I������\i, ����������� ��� ��� �����'#13#10
+'��������� ������). ������, ��� � ������ ������ ��������� ��� ���������'#13#10
+'�������� ����� ������������ ������� {X} � {Y}, �� ������ ������ \= {Y} � {Z},'#13#10
+'� � ������� \= {Z} � {X} (� ��������� �������) � ��������� � ������ ��������'#13#10
+'�� ��� ������ ������� MPI\_Send � MPI\_Recv ��� ��������� �������������������,'#13#10
+'�������� ����� {X} ��� ��������� ����������� �����, �������� � ������ � ������'#13#10
+'������, ����� {Y} \= ��� ��������� ����������� �����, �������� �� ������'#13#10
+'� ������ ������, � ����� {Z} \= ��� ��������� ����������� �����, ��������'#13#10
+'� ������ � ������ ������. ������� � ������ �������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  for i := 0 to n - 1 do
  for j := 0 to 2 do
  begin
    a[i,j] := RandomN(10,99);
    b[i,j] := RandomN(10,99);
  end;
  col[0] := 0;
  col[1] := 1;
  col[2] := 2;
  for i := 1 to n div 3 - 1 do
  begin
    col[3*i] := 0;
    col[3*i+1] := 1;
    col[3*i+2] := 2;
  end;
  for i := 1 to 2 * n do
    SwapN(col[RandomN(3, n-1)], col[RandomN(3, n-1)]);
  for i := 0 to 2 do
    k[i] := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    a0 := a[k[col[i]], col[i]];
    b0 := b[k[col[i]], col[i]];
    k[col[i]] := k[col[i]] + 1;
    j := i div 3;
    y1 := (i) div 3 + 1;
    case col[i] of
    0: begin
         tita := 'X=';
         titb := 'Y=';
       end;
    1: begin
         tita := 'Y=';
         titb := 'Z=';
       end;
    2: begin
         tita := 'Z=';
         titb := 'X=';
       end;
    end;
    case i mod 3 of
    0: begin
         x1 := 1;
         DataN(prc(i) + 'C=', col[i], x1, y1, 1);
         x1 := x1 + 11 + 4;
         DataN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         DataN(titb, b0, x1, y1, 2);
       end;
    1: begin
         x1 := 27;
         DataN(prclong(i,n) + 'C=', col[i], x1, y1, 1);
         x1 := x1 + l + 4;
         DataN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         DataN(titb, b0, x1, y1, 2);
       end;
    2: begin
         x1 := 54;
         DataN(prclong(i,n) + 'C=', col[i], x1, y1, 1);
         x1 := x1 + l + 4;
         DataN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         DataN(titb, b0, x1, y1, 2);
       end;
    end;
{    if not Odd(i) then
    begin
      x1 := 1;
    end
    else
    begin
      x1 := 40;
    end;}
  end;
  for i := 0 to n div 3 - 1 do
  begin
    swapN(b[i,0], a[i, 1]);
    swapN(a[i,0], b[i, 2]);
    swapN(b[i,1], a[i, 2]);
  end;
  for i := 0 to 2 do
    k[i] := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);

    a0 := a[k[col[i]], col[i]];
    b0 := b[k[col[i]], col[i]];
    j := i div 3;
    y1 := (i) div 3 + 1;
    case col[i] of
    0: begin
         tita := 'X=';
         titb := 'Y=';
       end;
    1: begin
         tita := 'Y=';
         titb := 'Z=';
       end;
    2: begin
         tita := 'Z=';
         titb := 'X=';
       end;
    end;
    case i mod 3 of
    0: begin
         x1 := 1;
         ResultN(prc(i) + 'R=', k[col[i]], x1, y1, 1);
         x1 := x1 + 11 + 4;
         ResultN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         ResultN(titb, b0, x1, y1, 2);
       end;
    1: begin
         x1 := 27;
         ResultN(prclong(i,n) + 'R=', k[col[i]], x1, y1, 1);
         x1 := x1 + l + 4;
         ResultN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         ResultN(titb, b0, x1, y1, 2);
       end;
    2: begin
         x1 := 54;
         ResultN(prclong(i,n) + 'R=', k[col[i]], x1, y1, 1);
         x1 := x1 + l + 4;
         ResultN(tita, a0, x1, y1, 2);
         x1 := x1 + 5;
         ResultN(titb, b0, x1, y1, 2);
       end;
    end;
    k[col[i]] := k[col[i]] + 1;
  end;
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;

procedure MPIInter5;
var
  i, j, k0, k1, x1, x2, y1, y2, l: integer;
  a,b: array[0..20] of integer;
begin
  n := 4*RandomN(2,4);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 4. An integer {X} is given in each'#13+
'process. Using the MPI\_Comm\_group, MPI\_Group\_range\_incl and MPI\_Comm\_create'#13+
'function, create two communicators: the first one contains the first half'#13+
'of the processes (of rank 0, 1,~\., {K}/2~\-~1 in this order), the second one'#13+
'contains the second half of the processes (of rank {K}/2, {K}/2~+~1,~\., {K}~\-~1'#13+
'in this order). Output the ranks {R}_1 of the processes included in these'#13+
'communicators. Then combine these communicators into an inter-communicator'#13+
'using the MPI\_Intercomm\_create function. Using the MPI\_Comm\_create function'#13+
'for this inter-communicator, create a new inter-communicator whose the first'#13+
'group contains the even-rank processes of the first group of the initial'#13+
'inter-communicator (in the same order) and the second group contains'#13+
'the odd-rank processes of the second group of the initial inter-communicator'#13+
'(in the inverse order). Thus, the first and second groups of the new'#13+
'inter-communicator will include the processes of the MPI\_COMM\_WORLD'#13+
'communicator with ranks 0, 2,~\., {K}/2~\-~2 and {K}~\-~1, {K}~\-~3,~\., {K}/2~+~1'#13+
'respectively. Output the ranks {R}_2 of the processes included in the new'#13+
'inter-communicator. Using the MPI\_Send and MPI\_Recv functions for the new'#13+
'inter-communicator, send the integer {X} from each process to the process'#13+
'with the same rank from the other group of the inter-communicator'#13+
'and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} ������ 4. � ������ �������� ���� ����� ����� {X}.'#13#10
+'��������� ������� MPI\_Comm\_group, MPI\_Group\_range\_incl � MPI\_Comm\_create,'#13#10
+'������� �������������, ������ �� ������� �������� ������ �������� ���������'#13#10
+'(� ������� 0, 1,~\., {K}/2~\-~1 � ��������� �������), � ������ \= ������ ��������'#13#10
+'(� ������� {K}/2, {K}/2~+~1,~\., {K}~\-~1 � ��������� �������). ������� �����'#13#10
+'��������� {R}_1 � ��������� ��������������. ����� ���������� ���������'#13#10
+'������������� � ����������������� � ������� ������� MPI\_Intercomm\_create.'#13#10
+'����� �����, ��������� ������� MPI\_Comm\_create ��� ����������'#13#10
+'������������������, �������� ����� �����������������, ������ ������ ��������'#13#10
+'�������� �������� �� ������ ������ ��������� ������������������ � �������'#13#10
+'������� (� ��� �� �������), � ������ ������ \= �������� �� ������ ������'#13#10
+'��������� ������������������ � ��������� ������� � �������� ������� (�����'#13#10
+'�������, � ������ ������ ������ ������������������ ����� ������� ��������'#13#10
+'��������� ������������� MPI\_COMM\_WORLD � ������� 0, 2,~\., {K}/2~\-~2,'#13#10
+'� �� ������ \= � ������� {K}~\-~1, {K}~\-~3,~\., {K}/2~+~1). ������� �����'#13#10
+'��������� {R}_2, �������� � ����� �����������������. ��������� ������� '#13#10
+'MPI\_Send � MPI\_Recv ��� ������ ������������������, �������� ��� �������'#13#10
+'�������� ����� {X} �� �������� ���� �� �����, ��������� � ������'#13#10
+'������ ����� ������������������, � ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  for i := 0 to n div 2 - 1 do
  begin
    a[i] := RandomN(10,99);
    b[i] := RandomN(10,99);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if not Odd(i) and (i < n div 2) then
    begin
      x1 := 1;
      y1 := (i {div 2}) + 1;
      k0 := a[i div 2];
    end
    else
    if Odd(i) and (i > n div 2) then
    begin
      x1 := 40;
      y1 := (i-n div 2) {div 2 } + 1;
      k0 := b[(n - i-1) div 2];
    end
    else
    begin
        k0 := 0;
        if i < n div 2 then
        begin
          x1 := 1;
          y1 := (i {div 2}) + 1;
        end
        else
        begin
          x1 := 40;
          y1 := (i-n div 2) {div 2 } + 1;
        end;  
    end;
//      continue;
//    y1 := (i) div 2 + 1;
    DataN(prclong(i,n)+ 'X = ', k0, x1, y1, 2);
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    if i < n div 2 then
    begin
      x1 := 1;
      y1 := i + 1;
    end
    else
    begin
      x1 := 40;
      y1 := i-n div 2 + 1;
    end;
//    x1 := x1 + l;
    ResultN(prclong(i,n) + 'R_1 = ', y1-1, x1, y1, 1);
    x1 := x1 + l + 8;
    if not Odd(i) and (i < n div 2) then
    begin
      k0 := i div 2;
      k1 := b[k0];
    end
    else
    if Odd(i) and (i > n div 2) then
    begin
      k0 := (n-i-1) div 2;
      k1 := a[k0];
    end
    else
      continue;
    ResultN('R_2 = ', k0, x1, y1, 1);
    x1 := x1 + 8;
    ResultN('X = ', k1, x1, y1, 2);
  end;

//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;


procedure MPIInter6;
var
  i, j, k0, x1, x2, y1, y2, l: integer;
  k1: real;
  a,b: array[0..20] of real;
begin
  n := 4*RandomN(2,4);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is a multiple of 4. A real number {X} is given in each'#13+
'process. Using the MPI\_Comm\_group, MPI\_Group\_range\_incl and MPI\_Comm\_create'#13+
'function, create two communicators: the first one contains the first half'#13+
'of the processes (of rank 0, 1,~\., {K}/2~\-~1 in this order), the second one'#13+
'contains the second half of the processes (of rank {K}/2, {K}/2~+~1,~\., {K}~\-~1'#13+
'in this order). Output the ranks {R}_1 of the processes included in these'#13+
'communicators. Then combine these communicators into an inter-communicator'#13+
'using the MPI\_Intercomm\_create function. Using one call of the MPI\_Comm\_split'#13+
'function for this inter-communicator, create two new inter-communicators:'#13+
'the first one contains the even-rank processes of the initial'#13+
'inter-communicator, the second one contains the odd-rank processes'#13+
'of the initial intercommunicator; the processes of the second group of each'#13+
'new inter-communicator should be in the inverse order. Thus, the first new'#13+
'communicator will include groups of the processes of the MPI\_COMM\_WORLD'#13+
'communicator with ranks 0, 2,~\., {K}/2~\-~2 and {K}~\-~2, {K}~\-~4,~\., {K}/2,'#13+
'the first new communicator will include groups of the processes'#13+
'of the MPI\_COMM\_WORLD communicator with ranks 1, 3,~\., {K}/2~\-~1'#13+
'and {K}~\-~1, {K}~\-~3,~\., {K}/2~+~1. Output the ranks {R}_2 of the processes included'#13+
'in the new inter-communicators. Using the MPI\_Send and MPI\_Recv functions'#13+
'for the new inter-communicators, send the integer {X} from each process'#13+
'to the process with the same rank from the other group of this'#13+
'inter-communicator and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} ������ 4. � ������ �������� ���� ������������ ����� {X}.'#13#10
+'��������� ������� MPI\_Comm\_group, MPI\_Group\_range\_incl � MPI\_Comm\_create,'#13#10
+'������� �������������, ������ �� ������� �������� ������ �������� ���������'#13#10
+'(� ������� 0, 1,~\., {K}/2~\-~1 � ��������� �������), � ������ \= ������ ��������'#13#10
+'(� ������� {K}/2, {K}/2~+~1,~\., {K}~\-~1 � ��������� �������). ������� �����'#13#10
+'��������� {R}_1 � ��������� ��������������. ����� ���������� ���������'#13#10
+'������������� � ����������������� � ������� ������� MPI\_Intercomm\_create.'#13#10
+'����� �����, ��������� ���� ����� ������� MPI\_Comm\_split ��� ����������'#13#10
+'������������������, �������� ��� ����� ������������������. ������ �� �����'#13#10
+'������������������� �������� �������� ��������� ������������������ � �������'#13#10
+'�������, � ������ \= � ���������, ������ �������� �� ������ ������ ������� ��'#13#10
+'����� ������������������� ������ ������������� � �������� ������� (�����'#13#10
+'�������, ���� ������������ ����� ��������� ��� ��������� �������������'#13#10
+'MPI\_COMM\_WORLD, �� ������ ����������������� �������� ������ ���������'#13#10
+'����� 0, 2,~\., {K}/2~\-~2 � {K}~\-~2, {K}~\-~4,~\., {K}/2, � ������ \= ������'#13#10
+'��������� ����� 1, 3,~\., {K}/2~\-~1 � {K}~\-~1, {K}~\-~3,~\., {K}/2~+~1). �������'#13#10
+'����� ��������� {R}_2, �������� � ����� ������������������. ��������� �������'#13#10
+'MPI\_Send � MPI\_Recv ��� ����� �������������������, �������� ��� �������'#13#10
+'�������� ����� {X} �� �������� ���� �� �����, ��������� � ������ ������ �����'#13#10
+'������������������, � ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  for i := 0 to n div 2 - 1 do
  begin
    a[i] := RandomR(1.0,9.9);
    b[i] := RandomR(1.0,9.9);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      k1 := a[i];
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      k1 := b[i-n div 2];
    end;;
//    else
//      continue;
//    y1 := (i) div 2 + 1;
    DataR(prclong(i,n)+ 'X = ', k1, x1, y1, 4);
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    if i < n div 2 then
    begin
      x1 := 1;
      y1 := i + 1;
    end
    else
    begin
      x1 := 40;
      y1 := i-n div 2 + 1;
    end;
//    x1 := x1 + l;
    ResultN(prclong(i,n) + 'R_1 = ', y1-1, x1, y1, 1);
    x1 := x1 + l + 8;
    if (i < n div 2) then
    begin
      k0 := i div 2;
      if i mod 2 = 0 then
        k1 := b[n div 2 -i  - 2]
      else
        k1 := b[n div 2 - i]
    end
    else
    begin
      k0 := (n-i-1) div 2;
      if i mod 2 = 0 then
        k1 := a[n -i  - 2]
      else
        k1 := a[n - i]
    end;
    ResultN('R_2 = ', k0, x1, y1, 1);
    x1 := x1 + 8;
    ResultR('X = ', k1, x1, y1, 4);
  end;

//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;



// ���������� ������ - �������� ������ � MPICH
procedure MPIInter7;
var
  i, j, k0, k00, k01, k02, k1, k2, x1, x2, y1, y2, l, c1, c2, l0: integer;
  a,b: array[0..20] of integer;
  a1,b1: array[0..20] of integer;
  tit: string;
begin
  n := 2*RandomN(5,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given'#13+
'in each process. The numbers {C} are equal to 0 or 1. A single value of {C}~=~1'#13+
'is given in the first half of the processes, the number of values of {C}~=~1'#13+
'is greater than one in the second half of the processes and, in addition,'#13+
'there is at least one value {C}~=~0 in the second half of the processes.'#13+
'Using the MPI\_Comm\_split function, create two communicators: the first one'#13+
'contains the first half of the processes (of rank 0, 1,~\., {K}/2~\-~1'#13+
'in this order), the second one contains the second half of the processes'#13+
'(of rank {K}/2, {K}/2~+~1,~\., {K}~\-~1 in this order). Output the ranks {R}_1'#13+
'of the processes included in these communicators. Then combine these'#13+
'communicators into an inter-communicator using the MPI\_Intercomm\_create'#13+
'function. Using the MPI\_Comm\_split function for this inter-communicator,'#13+
'create a new inter-communicator with groups which contain processes from'#13+
'the corresponding groups of the initial inter-communicator with the values'#13+
'{C}~=~1 (in the inverse order). Thus, the first group of the new'#13+
'inter-communicator will include a single process, and the number of processes'#13+
'in the second group will be in the range 2 to {K}/2~\-~1. Output the ranks {R}_2'#13+
'of the processes that are included in the second group of the new'#13+
'inter-communicator (this group contains more than one process).'#13+
'Input an array {Y} of {K}_2 integers in the single process of the first group'#13+
'of the new inter-communicator, where {K}_2 is the number of the processes'#13+
'in the second group. Input an integer {X} in each process of the second group'#13+
'of the new inter-communicator. Using the required number of calls'#13+
'of the MPI\_Send and MPI\_Recv functions for all the processes of the new'#13+
'inter-communicator, send all the integers {X} to the single process of the first'#13+
'group and send the element of the array {Y} with the index {R}_2 to the process {R}_2'#13+
'of the second group ({R}_2~=~0, 1,~\., {K}_2~\-~1). Output all received numbers'#13+
'(the integers {X} should be output in ascending order of ranks of sending'#13+
'processes). \P\SNote.\s In the MPI�H 2 version 1.3, the MPI\_Comm\_split function call'#13+
'for some inter-communicator is erroneous if some of the values of its color'#13+
'parameter are equal to MPI\_UNDEFINED. Thus, you should use only \Inon-negative\i'#13+
'values of color in this situation. In addition, the program can behave'#13+
'incorrectly if the MPI\_Comm\_split function create \Iempty groups\i for some'#13+
'inter-communicators (this is possible if some color values are specified'#13+
'for some processes of one of the groups of the initial inter-communicator'#13+
'and these color values are different from color values'#13+
'of all processes of the other group).');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������ ���� 0, ���� 1, ������ ��������, ��� � ������ �������� ��������� ����'#13#10
+'������������ �������� {C}~=~1, � �� ������ �������� ���������� �������� {C}~=~1'#13#10
+'������ ������ �, ����� ����, ������� ���� �� ���� �������� {C}~=~0. ���������'#13#10
+'������� MPI\_Comm\_split, ������� �������������, ������ �� ������� ��������'#13#10
+'������ �������� ��������� (� ������� 0, 1,~\., {K}/2~\-~1 � ��������� �������),'#13#10
+'� ������ \= ������ �������� (� ������� {K}/2, {K}/2~+~1,~\., {K}~\-~1 � ���������'#13#10
+'�������). ������� ����� ��������� {R}_1 � ��������� ��������������. �����'#13#10
+'���������� ��������� ������������� � ����������������� � ������� �������'#13#10
+'MPI\_Intercomm\_create. ����� �����, ��������� ������� MPI\_Comm\_split'#13#10
+'��� ���������� ������������������, �������� ����� �����������������, ������'#13#10
+'�������� �������� �������� �� ��������������� ����� ���������'#13#10
+'������������������ �� ���������� {C}~=~1, ������ � �������� ������� (�����'#13#10
+'�������, � ������ ������ ������ ������������������ ����� ������� ������������'#13#10
+'�������, � ���������� ��������� �� ������ ������ ����� ������ � ���������'#13#10
+'�� 2 �� {K}/2~\-~1). ������� ����� ��������� {R}_2, �������� � �� ������ ������'#13#10
+'������������������, ������� �������� ����� ������ ��������. � ������������'#13#10
+'�������� ������ ������ ������ ������������������ ������ ������ {Y} �� {K}_2 �����'#13#10
+'�����, ��� {K}_2 \= ���������� ��������� �� ������ ������; � ������ ��������'#13#10
+'������ ������ ����� �� ������������������ ������ �� ������ ������ ����� {X}.'#13#10
+'��������� ��������� ���������� ������� ������� MPI\_Send � MPI\_Recv ��� ����'#13#10
+'��������� ������ ������������������, �������� � �������� ������ ������ ���'#13#10
+'����� {X} �� ��������� ������ ������ (� ������� ����������� ������ ����'#13#10
+'���������), � � ������ �������� ������ ������ ����� {R}_2 (0, 1,~\., {K}_2~\-~1) \='#13#10
+'������� � �������� {R}_2 �� ������� {Y}, ������� � �������� ������ ������.'#13#10
+'������� ���������� �����.'#13#10
+'\P\S����������.\s � ���������� MPI�H 2 ������ 1.3, ������������ � ���������, �������'#13#10
+'MPI\_Comm\_split �������� � ��������� ���������, ���� ��� �����������'#13#10
+'� ������������������ � ��� ���� �����-���� �� �������� �� ��������� color'#13#10
+'����� MPI\_UNDEFINED. ����� �������, ��� ���������� ������ �������� ����������'#13#10
+'������������ ������ \I���������������\i �������� color. ����� ����, ���������'#13#10
+'� ���������� ����� ����� ���� �����������, ���� � ���������� ����������'#13#10
+'������� MPI\_Comm\_split � ������������������ ��������� \I������ ������\i'#13#10
+'(��� ��������, ���� ��� ���� ��������� ����� �� ����� ���������'#13#10
+'������������������ ����������� ���������� �������� color, ��������'#13#10
+'�� ��������� �������� color ��� ��������� ������ ������).'
);*)
  l := length(prclong(1,n));

  k00 := RandomN(2, n div 2 - 2);
  // ���� �������� k00 := n div 2 - 1, �� � ������� MPI_Comm_split ��� ������������������� ������
  // ������ �� �������! (�� ��������� ���������� �����������, ��� ��� � ����� ������ �� ����� ���������
  // � c=0).
  k1 := 1;
  k2 := k00;
  k0 := RandomN(0,1);
  if k0 = 1 then
    SwapN(k1, k2);
  for i := 0 to n div 2 - 1 do
  begin
    a[i] := 0;
    b[i] := 0;
  end;
  a[0] := 1;
  b[0] := 1;
  for i := 0 to k00 do
  begin
    if k0 = 0 then
      b[i] := 1
    else
      a[i] := 1;
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  for i := 1 to 2 * n do
  begin
    SwapN(a[RandomN(0, n div 2-1)], a[RandomN(0, n div 2-1)]);
    SwapN(b[RandomN(0, n div 2-1)], b[RandomN(0, n div 2-1)]);
  end;

  k01 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a[i];
      k02 := k1;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b[i-n div 2];
      k02 := k2;
    end;;
//    else
//      continue;
//    y1 := (i) div 2 + 1;
    DataN(prclong(i,n)+ 'C=', c1, x1, y1, 1);
    if c1 = 1 then
      if k02 = 1 then
      begin
        x1 := x1 + l + 6;
        DataComment('Y: ', x1, y1);
        for j := 0 to k00 do
        begin
           x1 := x1 + 3;
           DataN(b1[k00-j], x1, y1, 2);
        end;
      end
      else
      begin
        x1 := x1 + l + 6;
        DataN('X=', a1[k00-k01], x1, y1, 2);
        k01 := k01 + 1;
      end;
//    DataR(prclong(i,n)+ 'X=', k1, x1, y1, 4);
  end;


  k01 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a[i];
      k02 := k1;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b[i-n div 2];
      k02 := k2;
    end;;
//    else
//      continue;
//    y1 := (i) div 2 + 1;
//    DataN(prclong(i,n)+ 'C=', c1, x1, y1, 1);
    ResultN(prclong(i,n) + 'R_1=', y1-1, x1, y1, 1);

    if c1 = 1 then
      if k02 = 1 then
      begin
        x1 := x1 + l + 6;
//        ResultN('R_2=', 0, x1, y1,1);
//        x1 := x1 + 5;
        ResultComment('X: ', x1, y1);
        for j := 0 to k00 do
        begin
           x1 := x1 + 3;
           ResultN(a1[j], x1, y1, 2);
        end;
      end
      else
      begin
        x1 := x1 + l + 6;
        ResultN('R_2=', k00-k01, x1, y1, 1);
        x1 := x1 + 6;
        ResultN('Y=', b1[k01], x1, y1, 2);
        k01 := k01 + 1;
      end;
//    DataR(prclong(i,n)+ 'X=', k1, x1, y1, 4);
  end;

  {
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    if i < n div 2 then
    begin
      x1 := 1;
      y1 := i + 1;
    end
    else
    begin
      x1 := 40;
      y1 := i-n div 2 + 1;
    end;
//    x1 := x1 + l;
    ResultN(prclong(i,n) + 'R_1 = ', y1-1, x1, y1, 1);
    x1 := x1 + l + 8;
    if (i < n div 2) then
    begin
      k0 := i div 2;
      if i mod 2 = 0 then
        k1 := b[n div 2 -i  - 2]
      else
        k1 := b[n div 2 - i]
    end
    else
    begin
      k0 := (n-i-1) div 2;
      if i mod 2 = 0 then
        k1 := a[n -i  - 2]
      else
        k1 := a[n - i]
    end;
    ResultN('R_2 = ', k0, x1, y1, 1);
    x1 := x1 + 8;
    ResultR('X = ', k1, x1, y1, 4);
  end;
}
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;

// ���������� ������ - �������� ������ � MPICH
procedure MPIInter8;
var
  i, j, k0, k00, k01, k02, k1, k2, x1, x2, y1, y2, l, c1, c2, l0: integer;
  a,b,c: array[0..20] of integer;
  a1,b1,cc: array[0..20] of integer;
  ka, kb: array[0..2] of integer;
  tit: string;
  f: boolean;
begin
  n := 2*RandomN(5,7);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'An integer {C} is given in each process. The integer {C} is in the range 0 to 2,'#13+
'all the values of {C} (0, 1, 2) are given for the even-rank processes'#13+
'and for the odd-rank processes. Using one call of the MPI\_Comm\_split function,'#13+
'create two communicators: the first one contains the even-rank processes'#13+
'(in ascending order of ranks), the second one contains the odd-rank processes'#13+
'(in ascending order of ranks). Output the ranks {R}_1 of the processes included'#13+
'in these communicators. Then combine these communicators'#13+
'into an inter-communicator using the MPI\_Intercomm\_create function.'#13+
'Using one call of the MPI\_Comm\_split function for this inter-communicator,'#13+
'create three new inter-communicators with groups which contain processes'#13+
'from the corresponding groups of the initial inter-communicator with the same'#13+
'values of {C} (in the same order). Thus, for instance, the first group'#13+
'of the first new inter-communicator will include the even-rank processes'#13+
'with {C}~=~0 and the second group of the third new inter-communicator will'#13+
'include the odd-rank processes with {C}~=~2. Output the ranks {R}_2'#13+
'of the processes included in the new inter-communicators. Input an integer {X}'#13+
'in the processes of the first group of each new inter-communicator,'#13+
'input an integer {Y} in the processes of the second group of each new'#13+
'inter-communicator. Using the required number of calls of the MPI\_Send'#13+
'and MPI\_Recv functions for all the processes of all the new'#13+
'inter-communicators, send all the integers {X} to each process of the second'#13+
'group of the same inter-communicator and send all the integers {Y}'#13+
'to each process of the first group of the same inter-communicator. Output'#13+
'all received numbers in ascending order of ranks of sending processes.');
(*
TaskText(
 '� ������ �������� ���� ����� ����� {C}, ������� � ��������� �� 0 �� 2, ������'#13#10
+'��������, ��� � � ��������� ������� �����, � � ��������� ��������� �����'#13#10
+'������� ���� �� �� ������ �� �������� 0, 1, 2. ��������� ���� ����� �������'#13#10
+'MPI\_Comm\_split, ������� �������������, ������ �� ������� �������� ��������'#13#10
+'� ������� ������� (� ������� ����������� ������), � ������ \= ��������'#13#10
+'� ��������� ������� (����� � ������� ����������� ������). ������� �����'#13#10
+'��������� {R}_1 � ��������� ��������������. ����� ���������� ���������'#13#10
+'������������� � ����������������� � ������� ������� MPI\_Intercomm\_create.'#13#10
+'����� �����, ��������� ���� ����� ������� MPI\_Comm\_split ��� ����������'#13#10
+'������������������, �������� ��� ����� ������������������, ������ �������'#13#10
+'�������� �������� �� ��������������� ����� ��������� ������������������'#13#10
+'� ����������� ���������� {C}, ������ � ��� �� ������� (����� �������, � ������'#13#10
+'������ ������� ������������������ ����� ������� �������� ������� �����'#13#10
+'�� ���������� {C}~=~0, �, ��������, �� ������ ������ �������� ������������������'#13#10
+'����� ������� �������� ��������� ����� �� ���������� {C}~=~2). ������� �����'#13#10
+'��������� {R}_2 � ����� �������������������. � ��������� �� ������ �����'#13#10
+'��������� ������������������� ������ �� ������ ������ ����� {X}, � � ���������'#13#10
+'�� ������ ����� \= �� ������ ������ ����� {Y}. ��������� ��������� ����������'#13#10
+'������� ������� MPI\_Send � MPI\_Recv ��� ���� ��������� �����'#13#10
+'�������������������, ��������� ��� ����� {X} ������� �� ��������� ������ ������'#13#10
+'����� �� �������������, � ��� ����� {Y} \= ������� �� ��������� ������ ������'#13#10
+'� ������� ���������� ����� � ������� ����������� ������'#13#10
+'����������� �� ���������.'
);*)
  l := length(prclong(1,n));

//  k00 := RandomN(2, n div 2 - 2);
  // ���� �������� k00 := n div 2 - 1, �� � ������� MPI_Comm_split ��� ������������������� ������
  // ������ �� �������! (�� ��������� ���������� �����������, ��� ��� � ����� ������ �� ����� ���������
  // � c=0).
//  k1 := 1;
//  k2 := k00;
//  k0 := RandomN(0,1);
//  if k0 = 1 then
//    SwapN(k1, k2);
  for i := 0 to n div 2 - 1 do
  begin
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  a[0] := 0;
  a[1] := 1;
  a[2] := 2;
  b[0] := 0;
  b[1] := 1;
  b[2] := 2;
  repeat
  f := true;
  for i := 0 to 2 do
  begin
    ka[i] := 1;
    kb[i] := 1;
  end;

  for i := 3 to n div 2 - 1 do
  begin
    a[i] := RandomN(0,2);
    Inc(ka[a[i]]);
    b[i] := RandomN(0,2);
    Inc(kb[b[i]]);
    if (ka[a[i]] > 4) or (kb[b[i]] > 4) then
    begin
      f := false;
      break;
    end;
  end;
  until f;
  for i := 1 to 2 * n do
  begin
    SwapN(a[RandomN(0, n div 2-1)], a[RandomN(0, n div 2-1)]);
    SwapN(b[RandomN(0, n div 2-1)], b[RandomN(0, n div 2-1)]);
  end;

  k01 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if not Odd(i) then
    begin
      x1 := 1;
      y1 := i div 2 + 1;
      c1 := a[i div 2];
      c2 := a1[i div 2];
      tit := 'X=';
    end
    else
    begin
      x1 := 40;
      y1 := (i div 2) + 1;
      c1 := b[i div 2];
      c2 := b1[i div 2];
      tit := 'Y=';
    end;;
//    else
//      continue;
//    y1 := (i) div 2 + 1;
    DataN(prclong(i,n)+ 'C=', c1, x1, y1, 1);
     x1 := x1 + l + 6;
     DataN(tit, c2, x1, y1, 2);
//    DataR(prclong(i,n)+ 'X=', k1, x1, y1, 4);
  end;


  for i := 0 to 2 do
  begin
    ka[i] := 0;
    kb[i] := 0;
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if not Odd(i) then
    begin
      x1 := 1;
      y1 := i div 2 + 1;
      c1 := a[i div 2];
      k0 := ka[c1];
      Inc(ka[c1]);
      tit := 'Y: ';
      c := b;
      cc := b1;
    end
    else
    begin
      x1 := 40;
      y1 := (i div 2) + 1;
      c1 := b[i div 2];
      k0 := kb[c1];
      Inc(kb[c1]);
      tit := 'X: ';
      c := a;
      cc := a1;
    end;;
//    else
//      continue;
//    y1 := (i) div 2 + 1;
//    DataN(prclong(i,n)+ 'C=', c1, x1, y1, 1);
    ResultN(prclong(i,n) + 'R_1=', y1-1, x1, y1, 1);

       x1 := x1 + l + 6;
        ResultN('R_2=', k0, x1, y1, 1);
        x1 := x1 + 6;
        ResultComment(tit, x1, y1);
//        x1 := x1 + 1;
        for j := 0 to n div 2 - 1 do
          if c[j] = c1 then
          begin
          x1 := x1 + 3;
          ResultN(cc[j], x1, y1, 2);
          end;
//        k01 := k01 + 1;
//    DataR(prclong(i,n)+ 'X=', k1, x1, y1, 4);
  end;

  {
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    if i < n div 2 then
    begin
      x1 := 1;
      y1 := i + 1;
    end
    else
    begin
      x1 := 40;
      y1 := i-n div 2 + 1;
    end;
//    x1 := x1 + l;
    ResultN(prclong(i,n) + 'R_1 = ', y1-1, x1, y1, 1);
    x1 := x1 + l + 8;
    if (i < n div 2) then
    begin
      k0 := i div 2;
      if i mod 2 = 0 then
        k1 := b[n div 2 -i  - 2]
      else
        k1 := b[n div 2 - i]
    end
    else
    begin
      k0 := (n-i-1) div 2;
      if i mod 2 = 0 then
        k1 := a[n -i  - 2]
      else
        k1 := a[n - i]
    end;
    ResultN('R_2 = ', k0, x1, y1, 1);
    x1 := x1 + 8;
    ResultR('X = ', k1, x1, y1, 4);
  end;
}
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;


procedure MPIInter9;
var
  i, j, k0, k00, k01, k02, k1, k2, x1, x2, y1, y2, l, c1, n0, l0: integer;
  a: array[1..20] of integer;
  a1,b1, a2, b2, c2: array[1..20] of integer;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title1, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}/2. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the same order). Output the ranks {R} of the processes included'#13+
'in these communicators (output the integer \-1 if the process is not included'#13+
'into the created communicators). Then combine these communicators into'#13+
'an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. Input an integer {X} in the processes'#13+
'of the first group, input an integer {Y} in the processes of the second group.'#13+
'Using the required number of calls of the MPI\_Send and MPI\_Recv functions'#13+
'for all the processes of the inter-communicator, send all the integers {X}'#13+
'to each process of the second group and send all the integers {Y} to each'#13+
'process of the first group. Output all received numbers in ascending order'#13+
'of ranks of sending processes.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}/2.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create. ����� ����� ������'#13#10
+'� ��������� ������ ������ ���������� ������������������ (���������������'#13#10
+'��������� {C}~=~1) �� ������ ������ ����� {X}, � � ��������� ������ ������ \='#13#10
+'�� ������ ������ ����� {Y}. ��������� ��������� ���������� ������� �������'#13#10
+'MPI\_Send � MPI\_Recv ��� ���� ��������� ���������� ������������������,'#13#10
+'��������� ��� ����� {X} ������� �� ��������� ������ ������ ����� �������������,'#13#10
+'� ��� ����� {Y} \= ������� �� ��������� ������ ������ � ������� ���������� �����'#13#10
+'� ������� ����������� ������ ����������� �� ���������.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  a[1] := 1;
  a[n0+1] := 2;
  k01 := 1;
  k02 := 1;
  for i := 2 to n0 do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  for i := n0 + 2 to n do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  k1 := 1;
  k2 := 1;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      a2[k1] := a1[i];
      k1 := k1 + 1;
    end
    else
    if a[i] = 2 then
    begin
      b2[k2] := b1[i];
      k2 := k2 + 1;
    end
  end;



  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a1[i+1];
      tit := 'X=';
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b1[i+1];
      tit := 'Y=';
    end;
    DataN(prclong(i,n)+ 'C=', a[i+1], x1, y1, 1);
    x1 := x1 + l + 6;
    if a[i+1] <> 0 then
      DataN(tit, c1, x1, y1, 2);
  end;
  k1 := 0;
  k2 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
      end;
      tit := 'Y: ';
      k0 := k02;
      c2 := b2;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 + 1;
      end;
      tit := 'X: ';
      k0 := k01;
      c2 := a2;
    end;
    ResultN(prclong(i,n)+ 'R=', c1, x1, y1, 2);
    x1 := x1 + l + 6;
    if c1 <> -1 then
    begin
    ResultComment(tit, x1, y1);
    x1 := x1 + 3;
    for j := 1 to k0 do
    begin
      ResultN(c2[j], x1, y1, 2);
      x1 := x1 + 3;
    end;
    end;
  end;
end;


procedure MPIInter10;
var
  i, j, k0, k00, k01, k02, k11, k12, k1, k2, x1, x2, y1, y2, l, c1, c3, n0, l0, root1, root2, root0, root0a: integer;
  a: array[1..20] of integer;
  a1,b1, a2, b2, c2: array[1..20] of integer;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}/2. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the same order). Output the ranks {R} of the processes included'#13+
'in these communicators (output the integer \-1 if the process is not included'#13+
'into the created communicators). Then combine these communicators into'#13+
'an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. Input integers {R}_1 and {R}_2 in each process'#13+
'of the inter-communicator. The values of the numbers {R}_1 coincide in all'#13+
'processes and indicate the rank of the selected process of the first group;'#13+
'the values of the numbers {R}_2 also coincide in all processes and indicate'#13+
'the rank of the selected process of the second group. A sequence of three'#13+
'integers {X} is given in the selected process of the first group, a sequence'#13+
'of three integers {Y} is given in the selected process of the second group.'#13+
'Using two calls of the MPI\_Bcast collective function in each process'#13+
'of the inter-communicator, send the numbers {X} to all the processes'#13+
'of the second group, send the numbers {Y} to all the processes of the first'#13+
'group, and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}/2.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create (������, ����������'#13#10
+'�������� �� ���������� {C}~=~1, ��������� ������ ������� ����������'#13#10
+'������������������, � ������ ��������� �� ���������� {C}~=~2 \= ������).'#13#10
+'����� ����� ������ � ��������� ����� ����� ���������� ������������������ �����'#13#10
+'����� {R}_1 � {R}_2. �������� ����� {R}_1 �� ���� ��������� ��������� � ��������� ����'#13#10
+'����������� �������� ������ ������; �������� ����� {R}_2 �� ���� ��������� �����'#13#10
+'��������� � ��������� ���� ����������� �������� ������ ������. � ����������'#13#10
+'�������� ������ ������ ��� ����� �� ���� ����� ����� {X}, � ���������� ��������'#13#10
+'������ ������ \= ����� �� ���� ����� ����� {Y}. ��������� �� ��� ������'#13#10
+'������������ ������� MPI\_Bcast � ������ �������� ����������'#13#10
+'������������������, ��������� ����� ����� {X} �� ��� �������� ������ ������,'#13#10
+'� ����� ����� {Y} �� ��� �������� ������ ������,'#13#10
+'����� ���� ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  a[1] := 1;
  a[n0+1] := 2;
  k01 := 1;
  k02 := 1;
  for i := 2 to n0 do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  for i := n0 + 2 to n do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  k1 := 1;
  k2 := 1;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      a2[k1] := a1[i];
      k1 := k1 + 1;
    end
    else
    if a[i] = 2 then
    begin
      b2[k2] := b1[i];
      k2 := k2 + 1;
    end
  end;
  root1 := RandomN(1, k01);
  root2 := RandomN(1, k02);

  k11 := 0;
  k12 := 0;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a1[i+1];
      c3 := a[i+1];
      tit := 'X: ';
      root0 := root2 - 1;
      root0a := root1 - 1;
      k0 := 0;
      if a[i+1] = 1 then k11 := k11 + 1;
      if k11 = root1 then
      begin
        k0 := 1;
        c2 := a1;
//        c3 := -c3;

      end;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b1[i+1];
      c3 := a[i+1];
      tit := 'Y: ';
      root0 := root1 - 1;
      root0a := root2 - 1;
      k0 := 0;
      if a[i+1] = 2 then k12 := k12 + 1;
      if k12 = root2 then
      begin
        k0 := 1;
        c2 := b1;
//        c3 := -c3;

      end;
    end;
    DataN(prclong(i,n)+ 'C=', c3, x1, y1, 1);
    x1 := x1 + l + 4;
    if a[i+1] <> 0 then
    begin
      DataN('R_1=', root1-1, x1, y1, 1);
      x1 := x1 + 5;
      DataN('R_2=', root2-1, x1, y1, 1);
      if k0 = 1 then
      begin
        x1 := x1 + 6;
        DataComment(tit, x1, y1);
        x1 := x1 + 3;
        for j := 1 to 3 do
        begin
           DataN(c2[j], x1, y1, 2);
           x1 := x1 + 3;
        end;
      end;
    end;
  end;
  k1 := 0;
  k2 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
      end;
      tit := 'Y: ';
      c2 := b1;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 + 1;
      end;
      tit := 'X: ';
      c2 := a1;
    end;
    ResultN(prclong(i,n)+ 'R=', c1, x1, y1, 2);
    x1 := x1 + l + 6;
    if c1 <> -1 then
    begin
    ResultComment(tit, x1, y1);
    x1 := x1 + 3;
    for j := 1 to 3 do
    begin
      ResultN(c2[j], x1, y1, 2);
      x1 := x1 + 3;
    end;
    end;
  end;
end;

procedure MPIInter11;
var
  i, j, k0, k00, k01, k02, k11, k12, k1, k2, x1, x2, y1, y2, l, c1, c3, n0, l0, root1, root2, root0, root0a: integer;
  a: array[1..20] of integer;
  a1,b1, a2, b2, c2: array[1..20] of integer;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}/2. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the same order). Output the ranks {R} of the processes included'#13+
'in these communicators (output the integer \-1 if the process is not included'#13+
'into the created communicators). Then combine these communicators into'#13+
'an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. Input an integer {R}_1 in each process'#13+
'of the inter-communicator. The values of the number {R}_1 coincide'#13+
'in all processes and indicate the rank of the selected process of the first'#13+
'group. An array {X} of {K}_2 integers is given in the selected process'#13+
'of the first group, where {K}_2 is the number of processes in the second group.'#13+
'Using one call of the MPI\_Scatter collective function in each process'#13+
'of the inter-communicator, send the element {X}[{R}_2] to the process {R}_2'#13+
'of the second group ({R}_2~=~0,~\., {K}_2~\-~1) and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}/2.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create (������, ����������'#13#10
+'�������� �� ���������� {C}~=~1, ��������� ������ ������� ����������'#13#10
+'������������������, � ������ ��������� �� ���������� {C}~=~2 \= ������).'#13#10
+'����� ����� ������ � ��������� ����� ����� ���������� ������������������ �����'#13#10
+'����� {R}_1, ������� ��������� �� ���� ��������� � ��������� ���� �����������'#13#10
+'�������� ������ ������. � ���������� �������� ������ ������ ��� �����'#13#10
+'�� {K}_2 ����� ����� {X}, ��� {K}_2 \= ���������� ��������� �� ������ ������. ���������'#13#10
+'���� ����� ������������ ������� MPI\_Scatter � ������ �������� ����������'#13#10
+'������������������, ��������� �� ������ ����� �� ������ {X} �� ��� ��������'#13#10
+'������ ������ (� ������� ����������� ������ ���������),'#13#10
+'����� ���� ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  a[1] := 1;
  a[n0+1] := 2;
  k01 := 1;
  for i := 2 to n0 do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  repeat
  k02 := 1;
  for i := n0 + 2 to n do
  begin
    a[i] := 0;
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  end;
  until k02 < 6;
  k1 := 1;
  k2 := 1;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      a2[k1] := a1[i];
      k1 := k1 + 1;
    end
    else
    if a[i] = 2 then
    begin
      b2[k2] := b1[i];
      k2 := k2 + 1;
    end
  end;
  root1 := RandomN(1, k01);
  root2 := RandomN(1, k02);

  k11 := 0;
  k12 := 0;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
      tit := 'X: ';
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a1[i+1];
      c3 := a[i+1];
      tit := 'X: ';
      k0 := 0;
      if a[i+1] = 1 then k11 := k11 + 1;
      if k11 = root1 then
      begin
        k0 := 1;
        c2 := a1;
//        c3 := -c3;

      end;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b1[i+1];
      c3 := a[i+1];
//      tit := 'Y: ';
      k0 := 2;
      if a[i+1] = 2 then k12 := k12 + 1;

//      if k12 = root2 then
//      begin
//        k0 := 1;
//        c2 := b1;
//        c3 := -c3;
//      end;
    end;
    DataN(prclong(i,n)+ 'C=', c3, x1, y1, 1);
    x1 := x1 + l + 4;
    if a[i+1] <> 0 then
    begin
      DataN('R_1=', root1-1, x1, y1, 1);
      if k0 = 1 then
      begin
        x1 := x1 + 5;
        DataComment(tit, x1, y1);
        x1 := x1 + 3;
        for j := 1 to k02 do
        begin
           DataN(a1[j], x1, y1, 2);
           x1 := x1 + 3;
        end;
      end;
    end;
  end;

  k1 := 0;
  k2 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
      end;
      tit := 'Y: ';
      c2 := b1;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 + 1;
      end;
      tit := 'X: ';
      c2 := a1;
    end;
    ResultN(prclong(i,n)+ 'R=', c1, x1, y1, 2);
    x1 := x1 + l + 6;
    if a[i+1] = 2 then
    begin
//        x1 := x1 + 6;
        ResultN('X=', a1[c1+1], x1, y1, 2);
    end;
  end;
end;

procedure MPIInter12;
var
  i, j, k0, k00, k01, k02, k11, k12, k1, k2, x1, x2, y1, y2, l, c1, c3, n0, l0, root1, root2, root0, root0a: integer;
  a: array[1..20] of integer;
  a1,b1, a2, b2, c2: array[1..20] of integer;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}/2. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the same order). Output the ranks {R} of the processes included'#13+
'in these communicators (output the integer \-1 if the process is not included'#13+
'into the created communicators). Then combine these communicators into'#13+
'an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. Input an integer {R}_2 in each process'#13+
'of the inter-communicator. The values of the number {R}_2 coincide'#13+
'in all processes and indicate the rank of the selected process of the second'#13+
'group. An integer {X} is given in all the processes of the first group.'#13+
'Using one call of the MPI\_Gather collective function in each process'#13+
'of the inter-communicator, send all the integers {X} to the selected process'#13+
'of the second group. Output the received numbers in this process in ascending'#13+
'order of ranks of sending processes.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}/2.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create (������, ����������'#13#10
+'�������� �� ���������� {C}~=~1, ��������� ������ ������� ����������'#13#10
+'������������������, � ������ ��������� �� ���������� {C}~=~2 \= ������).'#13#10
+'����� ����� ������ � ��������� ����� ����� ���������� ������������������ �����'#13#10
+'����� {R}_2, ������� ��������� �� ���� ��������� � ��������� ���� �����������'#13#10
+'�������� ������ ������. � ������ �������� ������ ������ ���� �� ������ ������'#13#10
+'����� {X}. ��������� ���� ����� ������������ ������� MPI\_Gather � ������'#13#10
+'�������� ���������� ������������������, ��������� �������� ����� {X}'#13#10
+'(� ������� ����������� ������ ���������� �� ���������) � ���������� �������'#13#10
+'������ ������, ����� ���� ������� � ���� �������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    a1[i] := RandomN(10,99);
    b1[i] := RandomN(10,99);
  end;
  a[1] := 1;
  a[n0+1] := 2;
  repeat
  k01 := 1;
  for i := 2 to n0 do
  begin
    a[i] := 0;
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  end;
  until k01 < 6;
  k02 := 1;
  for i := n0 + 2 to n do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  k1 := 1;
  k2 := 1;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      a2[k1] := a1[i];
      k1 := k1 + 1;
    end
    else
    if a[i] = 2 then
    begin
      b2[k2] := b1[i];
      k2 := k2 + 1;
    end
  end;
  root1 := RandomN(1, k01);
  root2 := RandomN(1, k02);

  k11 := 0;
  k12 := 0;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
      tit := 'X: ';
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c1 := a1[i+1];
      c3 := a[i+1];
      tit := 'X: ';
      k0 := 0;
      if a[i+1] = 1 then
      begin
        k11 := k11 + 1;
        k0 := 1;
      end;
{      if k11 = root1 then
      begin
        k0 := 1;
        c2 := a1;
//        c3 := -c3;

      end;}
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c1 := b1[i+1];
      c3 := a[i+1];
//      tit := 'Y: ';
      k0 := 2;
      if a[i+1] = 2 then k12 := k12 + 1;

//      if k12 = root2 then
//      begin
//        k0 := 1;
//        c2 := b1;
//        c3 := -c3;
//      end;
    end;
    DataN(prclong(i,n)+ 'C=', c3, x1, y1, 1);
    x1 := x1 + l + 4;
    if a[i+1] <> 0 then
    begin
      DataN('R_2=', root2-1, x1, y1, 1);
      if a[i+1] = 1 then
      begin
        x1 := x1 + 5;
        DataN('X=', a1[k11], x1, y1, 2);
      end;
    end;
  end;

  k1 := 0;
  k2 := 0;
  for i := 0 to n - 1 do
  begin
    k0 := 0;
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
      end;
      tit := 'Y: ';
      c2 := b1;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 + 1;
      end;
      if c1 = root2-1 then
        k0 := 1;
      tit := 'X: ';
      c2 := a1;
    end;
    ResultN(prclong(i,n)+ 'R=', c1, x1, y1, 2);
    x1 := x1 + l + 6;
    if k0 = 1 then
    begin
//        x1 := x1 + 5;
        ResultComment('X: ', x1, y1);
        x1 := x1 + 3;
        for j := 1 to k01 do
        begin
           ResultN(a1[j], x1, y1, 2);
           x1 := x1 + 3;
        end;
    end;
  end;
end;

procedure MPIInter13;
var
  i, j, k0, k00, k01, k02, k11, k12, k1, k2, x1, x2, y1, y2, l, c1, c3, n0, l0, root1, root2, root0, root0a: integer;
  a: array[1..20] of integer;
  a1,b1,a2, b2, c2: array[1..20] of real;
  c4, min, max: real;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}/2. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the same order). Output the ranks {R} of the processes included'#13+
'in these communicators (output the integer \-1 if the process is not included'#13+
'into the created communicators). Then combine these communicators into'#13+
'an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. An integer {X} is given in each process'#13+
'of the first group, an integer {Y} is given in each process of the second group.'#13+
'Using one call of the MPI\_Allreduce collective function in each process'#13+
'of the inter-communicator, receive the number {Y}_{min} in each process'#13+
'of the first group and the number {X}_{max} in each process of the second group,'#13+
'where the number {Y}_{min} is the minimal value of the given integers {Y}'#13+
'and the number {X}_{max} is the maximal value of the given integers {X}.'#13+
'Output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}/2.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � ��� �� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create (������, ����������'#13#10
+'�������� �� ���������� {C}~=~1, ��������� ������ ������� ����������'#13#10
+'������������������, � ������ ��������� �� ���������� {C}~=~2 \= ������).'#13#10
+'� ������ �������� ������ ������ ���� �� ������ ������ ����� {X}, � ������'#13#10
+'�������� ������ ������ ���� �� ������ ������ ����� {Y}. ��������� ���� �����'#13#10
+'������������ ������� MPI\_Allreduce � ������ �������� ����������'#13#10
+'������������������, �������� � ������ �������� ������ ������ ����� {Y}_{min} \='#13#10
+'����������� �� �������� ����� {Y}, � � ������ �������� ������ ������'#13#10
+'����� {X}_{max} \= ������������ �� �������� ����� {X},'#13#10
+'����� ���� ������� ���������� �����.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    a1[i] := RandomR(1.0,9.9);
    b1[i] := RandomR(1.0,9.9);
  end;
  a[1] := 1;
  a[n0+1] := 2;
  k01 := 1;
  for i := 2 to n0 do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  k02 := 1;
  for i := n0 + 2 to n do
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  k1 := 1;
  k2 := 1;
  min := 1000;
  max := -1000;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      a2[k1] := a1[i];
      k1 := k1 + 1;
      if a1[i] > max then
        max := a1[i];
    end
    else
    if a[i] = 2 then
    begin
      b2[k2] := b1[i];
      k2 := k2 + 1;
      if b1[i] < min then
        min := b1[i];
    end
  end;
  root1 := RandomN(1, k01);
  root2 := RandomN(1, k02);

  k11 := 0;
  k12 := 0;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
      tit := 'X: ';
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      c3 := a[i+1];
      tit := 'X = ';
      if a[i+1] = 1 then
      begin
        k11 := k11 + 1;
      end;
      k0 := k11;
      c2 := a2;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      c3 := a[i+1];
      tit := 'Y = ';
      if a[i+1] = 2 then k12 := k12 + 1;
      k0 := k12;
      c2 := b2;
    end;
    DataN(prclong(i,n)+ 'C = ', c3, x1, y1, 1);
    x1 := x1 + l + 8;
    if a[i+1] <> 0 then
    begin
        DataR(tit, c2[k0], x1, y1, 4);
    end;
  end;

  k1 := 0;
  k2 := 0;
  for i := 0 to n - 1 do
  begin
    k0 := 0;
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
        c4 := min;
      end;
      tit := 'Y_{min} = ';
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 + 1;
        c4 := max;
      end;
      tit := 'X_{max} = ';
    end;
    ResultN(prclong(i,n)+ 'R = ', c1, x1, y1, 2);
    x1 := x1 + l + 8;
    if a[i+1] <> 0 then
    begin
//        x1 := x1 + 5;
        ResultR(tit, c4, x1, y1, 4);
    end;
  end;
end;

procedure MPIInter14;
var
  i, j, k0, k00, k01, k02, k11, k12, k1, k2, x1, x2, y1, y2, l, c1, c3, n0, l0, root1, root2, root0, root0a: integer;
  a: array[1..20] of integer;
  a1,b1, a2, b2, c2: array[1..20,1..20] of integer;
  tit: string;
begin
  n := 2*RandomN(4,6);
  CreateTask(title2, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. An integer {C} is given in each'#13+
'process. The integer {C} is in the range 0 to 2, the first value {C}~=~1 is given'#13+
'in the process 0, the first value {C}~=~2 is given in the process {K}~\-~1. Using'#13+
'the MPI\_Comm\_split function, create two communicators: the first one contains'#13+
'processes with {C}~=~1 (in the same order), the second one contains processes'#13+
'with {C}~=~2 (in the inverse order). Output the ranks {R} of the processes'#13+
'included in these communicators (output the integer \-1 if the process is not'#13+
'included into the created communicators). Then combine these communicators'#13+
'into an inter-communicator using the MPI\_Intercomm\_create function. A group'#13+
'containing processes with {C}~=~1 is considered to be the first group'#13+
'of the created inter-communicator and the group of processes with {C}~=~2'#13+
'is considered to be its second group. An array {X} of {K}_2 integers is given'#13+
'in each process of the first group, where {K}_2 is the number of processes'#13+
'in the second group; an array {Y} of {K}_1 integers is given in each process'#13+
'of the second group, where {K}_1 is the number of processes in the first group.'#13+
'Using one call of the MPI\_Alltoall collective function in each process'#13+
'of the inter-communicator, send the element {Y}[{R}_1] of each array {Y}'#13+
'to the process {R}_1 of the first group ({R}_1~=~0,~\., {K}_1~\-~1) and send'#13+
'the element {X}[{R}_2] of each array {X} to the process {R}_2 of the second group'#13+
'({R}_2~=~0,~\., {K}_2~\-~1). Output the received numbers'#13+
'in ascending order of ranks of sending processes.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ���� ����� ����� {C},'#13#10
+'������� � ��������� �� 0 �� 2, ������ ��������, ��� � �������� ����� 0 ����'#13#10
+'����� {C}~=~1, � ������ �� �������� {C}~=~2 ������� � �������� ����� {K}~\-~1.'#13#10
+'��������� ������� MPI\_Comm\_split, ������� �������������, ������ �� �������'#13#10
+'�������� �������� �� ���������� {C}~=~1 � ��� �� �������, � ������ \= ��������'#13#10
+'�� ���������� {C}~=~2 � �������� �������. ������� ����� ��������� {R} � ���������'#13#10
+'�������������� (���� ������� �� ������ �� � ���� �� ��������� ��������������,'#13#10
+'�� ������� ��� ���� �����~\-1). ����� ���������� ��������� �������������'#13#10
+'� ����������������� � ������� ������� MPI\_Intercomm\_create (������, ����������'#13#10
+'�������� �� ���������� {C}~=~1, ��������� ������ ������� ����������'#13#10
+'������������������, � ������ ��������� �� ���������� {C}~=~2 \= ������).'#13#10
+'� ������ �������� ������ ������ ��� ������ ����� ����� {X} ������� {K}_2, ��� {K}_2 \='#13#10
+'���������� ��������� �� ������ ������, � ������ �������� ������ ������ ���'#13#10
+'������ ����� ����� {Y} ������� {K}_1, ��� {K}_1 \= ���������� ��������� � ������'#13#10
+'������. ��������� ���� ����� ������������ ������� MPI\_Alltoall � ������'#13#10
+'�������� ���������� ������������������, ��������� � ������� ����� {R}_1 ������'#13#10
+'������ ({R}_1~=~0,~\., {K}_1~\-~1) �������� � �������� {R}_1 �� ���� �������� {Y},'#13#10
+'� � ������� ����� {R}_2 ������ ������ ({R}_2~=~0,~\., {K}_2~\-~1) ��������'#13#10
+'� �������� {R}_2 �� ���� �������� {X}. ������� ���������� �����'#13#10
+'� ������� ����������� ������ ����������� �� ���������.'
);*)
  l := length(prclong(1,n));
  n0 := n div 2;
  for i := 1 to n do
  begin
    a[i] := 0;
    for j := 1 to n do
    begin
      a1[i,j] := RandomN(10,99);
      b1[i,j] := RandomN(10,99);
    end;
  end;
  a[1] := 1;
  a[n] := 2;
  repeat
  k01 := 1;
  for i := 2 to n0 do
  begin
    a[i] := 0;
    if RandomN(0,1) = 0 then
    begin
      a[i] := 1;
      k01 := k01 + 1;
    end;
  end;
  until k01 < 6;
  repeat
  k02 := 1;
  for i := n0 + 1 to n-1 do
  begin
    a[i] := 0;
    if RandomN(0,1) = 0 then
    begin
      a[i] := 2;
      k02 := k02 + 1;
    end;
  end;
  until k02 < 6;

  k1 := 1;
  k2 := 1;
  for i := 1 to n do
  begin
    if a[i] = 1 then
    begin
      for j := 1 to n do
        a2[k1,j] := a1[i,j];
      k1 := k1 + 1;
    end
    else
    if a[i] = 2 then
    begin
      for j := 1 to n do
        b2[k2,j] := b1[i,j];
      k2 := k2 + 1;
    end
  end;
//  root1 := RandomN(1, k01);
//  root2 := RandomN(1, k02);

  k11 := 0;
  k12 := 0;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
//      tit := 'X: ';
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
//      c1 := a1[i+1];
      c3 := a[i+1];
      tit := 'X: ';
      k0 := k02;
      if a[i+1] = 1 then
      begin
        k11 := k11 + 1;
        k00 := k11;
        c2 := a2;
      end;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
//      c1 := b1[i+1];
      c3 := a[i+1];
      tit := 'Y: ';
      k0 := k01;
      if a[i+1] = 2 then
      begin
        k12 := k12 + 1;
        k00 := k12;
        c2 := b2;
      end;

//      if k12 = root2 then
//      begin
//        k0 := 1;
//        c2 := b1;
//        c3 := -c3;
//      end;
    end;
    DataN(prclong(i,n)+ 'C=', c3, x1, y1, 1);
    x1 := x1 + l + 4;
    if c3 <> 0 then
    begin
        x1 := x1 + 2;
        DataComment(tit, x1, y1);
        x1 := x1 + 3;
        for j := 1 to k0 do
        begin
         DataN(c2[k00,j], x1, y1, 2);
          x1 := x1 + 3;
        end;
    end;
  end;

  for i := 1 to k02 div 2 do
    for j := 1 to k01 do
      SwapN(b2[i,j], b2[k02-i+1, j]);

  k1 := 0;
  k2 := k02 - 1;
  for i := 0 to n - 1 do
  begin
    k0 := 0;
    SetProcess(i);
//    x1 := 1 + 40 * ((i) mod 2);
    c1 := -1;
    if (i < n div 2) then
    begin
      x1 := 1;
      y1 := i + 1;
      if a[i+1] = 1 then
      begin
        c1 := k1;
        k1 := k1 + 1;
      end;
      k00 := k02;
      tit := 'Y: ';
      c2 := b2;
    end
    else
    begin
      x1 := 40;
      y1 := (i-n div 2) + 1;
      if a[i+1] = 2 then
      begin
        c1 := k2;
        k2 := k2 - 1;
      end;
      k00 := k01;
      tit := 'X: ';
      c2 := a2;
    end;

    ResultN(prclong(i,n)+ 'R=', c1, x1, y1, 2);
    x1 := x1 + l + 6;
    if c1 <> -1 then
    begin
//        x1 := x1 + 5;
        ResultComment(tit, x1, y1);
        x1 := x1 + 3;
        for j := 1 to k00 do
        begin
           ResultN(c2[j,c1+1], x1, y1, 2);
           x1 := x1 + 3;
        end;
    end;
  end;


end;


procedure MPIInter15;
var
  i, j, k0, x1, x2, y1, y2, l: integer;
  a, sum: real;
  s: string;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'A real number is given in each process. Using the MPI\_Comm\_spawn function'#13+
'with the first parameter "ptprj.exe", create one new process. Using'#13+
'the MPI\_Reduce collective function, send the sum of the given numbers'#13+
'to the new process. Output the received sum in the debug section using'#13+
'the Show function in the new process. Then, using the MPI\_Bcast collective'#13+
'function, send this sum to the initial processes'#13+
'and output it in each process.');
(*
TaskText(
 '� ������ �������� ���� ������������ �����. ��������� ������� MPI\_Comm\_spawn'#13#10
+'� ������ ���������� \<ptprj.exe\>, ������� ���� ����� �������. � �������'#13#10
+'������������ ������� MPI\_Reduce ��������� � ��������� ������� ����� ��������'#13#10
+'����� � ���������� �� � ������� �������, ��������� � ���� �������� �������'#13#10
+'Show. ����� � ������� ������������ ������� MPI\_Bcast ��������� ��������� �����'#13#10
+'� �������� �������� � ������� ��� ����� � ������ ��������.'
);*)
  sum := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    a := RandomR(10,20.9);
    sum := sum + a;
    y1 := i+1;
    DataR(prc(i), a, 0, y1, 4);
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    y1 := i + 1;
    ResultR(prc(i), sum, 0, y1, 4);
  end;
    Str(sum:5:2,s);
    DataComment(DebugSec, 1, n+1);
    DataComment('a0|  1>  '+s, 1, n+2);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;

procedure MPIInter16;
var
  i, j, k0, x1, x2, y1, y2, l: integer;
  c: array[1..10,1..10] of real;
  s, s1, s2: string;
  s0: array[1..10] of string;
begin
  n := RandomN(3,6);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'An array {A} of {K} real numbers is given in each process, where {K} is the number'#13+
'of processes. Using one call of the MPI\_Comm\_spawn function with'#13+
'the first parameter "ptprj.exe", create {K} new processes. Using'#13+
'the MPI\_Reduce\_scatter\_block collective function, send the maximal value'#13+
'of the elements {A}[{R}] of the given arrays to the new process of rank {R}'#13+
'({R}~=~0,~\., {K}~\-~1). Output the received maximal value in the debug section'#13+
'using the Show function in each new process. Then, using the MPI\_Send'#13+
'and MPI\_Recv functions, send the maximal value from the new process of rank {R}'#13+
'({R}~=~0,~\., {K}~\-~1) to the initial process of the same rank and output'#13+
'the received numbers in the initial processes.');
(*
TaskText(
 '� ������ �������� ��� ������ �� {K} ������������ �����, ��� {K} \= ����������'#13#10
+'���������. ��������� ���� ����� ������� MPI\_Comm\_spawn � ������ ����������'#13#10
+'\<ptprj.exe\>, ������� {K} ����� ���������. � ������� ������������ �������'#13#10
+'MPI\_Reduce\_scatter\_block ��������� � ��������� ������� ����� {R} ({R}~=~0,~\.,'#13#10
+'{K}~\-~1) ������������ �� ��������� �������� �������� � �������� {R} � ����������'#13#10
+'���������� ������������ �������� � ������� �������, ��������� � ������ �����'#13#10
+'�������� ������� Show. ����� � ������� ������� MPI\_Send � MPI\_Recv ���������'#13#10
+'��������� ������������ ������� �� ������ �������� ����� {R} ({R}~=~0,~\., {K}~\-~1)'#13#10
+'� �������� ������� ���� �� ����� � �������'#13#10
+'���������� �������� � �������� ���������.'
);*)
  for i := 1 to n do
    b[i] := 0;
  for i := 1 to n do
  for j := 1 to n do
  begin
    c[i,j] := RandomR(1,9.9);
    if c[i,j] > b[j] then
      b[j] := c[i,j];
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 10;
    for j := 0 to n - 1 do
    begin
      x1 := x1 + 5;
      DataR(c[i+1,j+1], x1, y1, 4);
    end;
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    y1 := i + 1;
{    if not Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;}
    x1 := 0;
    ResultR(prc(i), b[i+1], x1, y1, 4);
  end;
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
    DataComment(DebugSec, 1, n +1);
  for i := 1 to n do
    DataComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;


procedure MPIInter17;
var
  i, j, k0, x1, x2, y1, y2, l: integer;
  s, s1, s2: string;
begin
  n := 2*RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. Arrays of {K}/2 real numbers are'#13+
'given in the processes of rank 0 and 1. Using one call of the MPI\_Comm\_spawn'#13+
'function with the first parameter "ptprj.exe", create two new processes.'#13+
'Using one call of the MPI\_Comm\_split function for the inter-communicator'#13+
'connected with the new processes, create two new inter-communicators:'#13+
'the first one contains the group of even-rank initial processes'#13+
'(0,~\., {K}~\-~2) and the new process of rank 0 as the second group, the second'#13+
'one contains the group of odd-rank initial processes (1,~\., {K}~\-~1)'#13+
'and the new process of rank 1 as the second group. Using the MPI\_Send function'#13+
'in the initial processes and the MPI\_Recv function in the new processes,'#13+
'send all the given numbers from the first process of the first group of each'#13+
'inter-communicator to the single process of its second group. Output'#13+
'the received numbers in the debug section using the Show function in the new'#13+
'processes. Then, using the MPI\_Scatter collective function'#13+
'for inter-communicators, send one number from the new process to each process'#13+
'of the first group of the corresponding inter-communicator (in ascending order'#13+
'of ranks of receiving processes) and output the received numbers.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ��������� ����� 0 � 1 ���� �������'#13#10
+'������������ ����� ������� {K}/2. ��������� ���� ����� ������� MPI\_Comm\_spawn'#13#10
+'� ������ ���������� \<ptprj.exe\>, ������� ��� ����� ��������. ���������'#13#10
+'���� ����� ������� MPI\_Comm\_split ��� ������������������, ����������'#13#10
+'� ���������� ����������, ������� ��� ����� ������������������: ������ ��������'#13#10
+'������ �������� ��������� ������� ����� (0,~\., {K}~\-~2), � �����, � ��������'#13#10
+'������ ������, ������ �� ����� ��������� (����� 0), ������ �������� ������'#13#10
+'�������� ��������� ��������� ����� (1,~\., {K}~\-~1), � �����, � �������� ������'#13#10
+'������, ������ �� ����� ��������� (����� 1). ��������� ������� MPI\_Send'#13#10
+'� �������� ��������� � ������� MPI\_Recv � ����� ���������, ��������� ���'#13#10
+'�������� ����� �� ������� �������� ������ ������ ������� ������������������'#13#10
+'� ������������ �������, �������� � ��� ������ ������. ���������� ����������'#13#10
+'����� � ������� �������, ��������� � ����� ��������� ������� Show. �����'#13#10
+'� ������� ������������ ������� MPI\_Scatter ��� ������������������� ���������'#13#10
+'�� ������ ����� �� ����� ��������� �� ��� �������� ������ ������'#13#10
+'���������������� ������������������ (� ������� ����������� ������ ���������)'#13#10
+'� ������� ���������� �����.'
);*)
  for i := 0 to n do
    b[i] := RandomR(1,9.9);
  for i := 0 to 1 do
  begin
    SetProcess(i);
    x1 := 1;
    y1 := i+1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 10;
    for j := 0 to n div 2 - 1 do
    begin
      x1 := x1 + 5;
      DataR(b[i+2*j], x1, y1, 4);
    end;
  end;

  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    y1 := i div 2 + 1;
    if not Odd(i) then
      x1 := xLeft
    else
      x1 := xRight;
    ResultR(prc(i), b[i], x1, y1, 4);
  end;
  s1 := 'a0|  1> ';
  s2 := 'a1|  1> ';
  for i := 0 to n div 2 - 1do
  begin
    Str(b[2*i]:5:2,s);
    s1 := s1 + s;
    Str(b[2*i+1]:5:2,s);
    s2 := s2 + s;
  end;
    DataComment(DebugSec, 1, 2 +1);
    DataComment(s1, 1, 2 +2);
    DataComment(s2, 1, 2 +3);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);

end;



procedure MPIInter18;
var
  i, j, k0, x1, x2, y1, y2, l, amax, amin: integer;
  c1, c2: array[1..10,1..10] of integer;
  a1, a2: array[1..10] of integer;
  s, s1, s2: string;
  s0: array[1..10] of string;
begin
  n := 2*RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is an even number. Arrays {A} of {K}/2 real numbers'#13+
'are given in each process. Using one call of the MPI\_Comm\_spawn function'#13+
'with the first parameter "ptprj.exe", create {K} new processes. Using one call'#13+
'of the MPI\_Comm\_split function for the inter-communicator connected'#13+
'with the new processes, create two new inter-communicators: the first one'#13+
'contains the group of even-rank initial processes (0,~\., {K}~\-~2)'#13+
'and the even-rank new processes as the second group, the second one contains'#13+
'the group of odd-rank initial processes (1,~\., {K}~\-~1) and the odd-rank new'#13+
'processes as the second group. Perform the following actions for each created'#13+
'inter-communicator: (1)~find the minimal value (for the first'#13+
'inter-communicator) or the maximal value (for the second one)'#13+
'of the elements {A}[{R}] ({R}~=~0,~\., {K}/2~\-~1) of all the arrays {A} given'#13+
'in the first group of this inter-communicator; (2)~send the found value'#13+
'to the new process of rank {R} in the second group of the corresponding'#13+
'inter-communicator. For instance, the minimal of the first elements'#13+
'of the arrays given in the even-rank initial processes should be sent'#13+
'to the first of the new processes, the maximal of the first elements'#13+
'of the arrays given in the odd-rank initial processes should be sent'#13+
'to the second of the new processes (since this process has rank 0'#13+
'in the corresponding inter-communicator). To do this, use'#13+
'the MPI\_Reduce\_scatter\_block collective function. Output the received values'#13+
'in the debug section using the Show function in each new process. Then, using'#13+
'the MPI\_Reduce collective function, find the minimum of the values received'#13+
'in the second group of the first inter-communicator, send the found minimum'#13+
'to the first process of the first group of this inter-communicator (that is,'#13+
'to the process 0 in the MPI\_COMM\_WORLD communicator), and output the received'#13+
'minimum. Also, find the maximum of the values received in the second group'#13+
'of the second inter-communicator, send the found maximum to the first process'#13+
'of the first group of this inter-communicator (that is, to the process 1'#13+
'in the MPI\_COMM\_WORLD communicator), and output the received maximum.');
(*
TaskText(
 '���������� ��������� {K} \= ������ �����. � ������ �������� ��� ������'#13#10
+'������������ ����� ������� {K}/2. ��������� ���� ����� ������� MPI\_Comm\_spawn'#13#10
+'� ������ ���������� \<ptprj.exe\>, ������� {K} ����� ���������. ���������'#13#10
+'���� ����� ������� MPI\_Comm\_split ��� ������������������, ����������'#13#10
+'� ���������� ����������, ������� ��� ����� ������������������: ������ ��������'#13#10
+'������ �������� ��������� ������� ����� (0,~\., {K}~\-~2), � �����, � ��������'#13#10
+'������ ������, ��������� �������� ������� �����, ������ �������� ������'#13#10
+'�������� ��������� ��������� ����� (1,~\., {K}~\-~1), � �����, � �������� ������'#13#10
+'������, ��������� �������� ��������� �����. ��� ������� �� ���������'#13#10
+'������������������� ��������� ��������� ��������: ����� ��������� ��������'#13#10
+'�������� � �������� {R} ({R}~=~0,~\., {K}/2~\-~1), �������� � ������ ������ �������'#13#10
+'������������������, ����� ����������� (��� ������� ������������������)'#13#10
+'��� ������������ (��� �������) � ��������� ���� ������������� ������� � ���'#13#10
+'�� ����� ���������, ������� ����� ���� {R} �� ������ ������ ����������������'#13#10
+'������������������ (��������, ����������� �� ������ ��������� ��������,'#13#10
+'������� ���� � �������� ��������� ������� �����, ������� ��������� � ������'#13#10
+'�� ��������� ���������, � ������������ �� ������ ��������� ��������, �������'#13#10
+'���� � �������� ��������� ��������� �����, ������� ��������� �� ������'#13#10
+'�� ��������� ���������, ��������� ���� ������� ����� ���� 0 � ���������������'#13#10
+'������������������). ��� ���������� ���� �������� ������������ ������������'#13#10
+'������� MPI\_Reduce\_scatter\_block. ���������� ������������� �������� ����������'#13#10
+'� ������� �������, ��������� � ������ ����� �������� ������� Show. �����'#13#10
+'� ������� ������������ ������� MPI\_Reduce ����� ����������� �������'#13#10
+'�� ��� ���������, ������� ���� �������� �� ������ ������ �������'#13#10
+'������������������, ��������� � ������� ��� � ������ �������� ������ ������'#13#10
+'����� ������������������ (�.\,�. � �������� ����� 0 � �������� �������������'#13#10
+'MPI\_COMM\_WORLD), � ����� ����� ������������ ������� �� ��� ����������, �������'#13#10
+'���� �������� �� ������ ������ ������� ������������������, ���������'#13#10
+'� ������� ��� � ������ �������� ������ ������ ����� ������������������'#13#10
+'(�.\,�. � �������� ����� 1 � �������� ������������� MPI\_COMM\_WORLD).'
);*)
  for i := 1 to n do
  begin
    a1[i] := 1000;
    a2[i] := 0;
  end;
  for i := 1 to n div 2 do
  for j := 1 to n div 2 do
  begin
    c1[i,j] := RandomN(10,99);
    if c1[i,j] < a1[j] then
      a1[j] := c1[i,j];
  end;
  for i := 1 to n div 2 do
  for j := 1 to n div 2 do
  begin
    c2[i,j] := RandomN(10,99);
    if c2[i,j] > a2[j] then
      a2[j] := c2[i,j];
  end;
  amin := 1000;
  amax := 0;
  for i := 1 to n div 2 do
  begin
    if amin > a1[i] then
      amin:= a1[i];
    if amax < a2[i] then
      amax:= a2[i];
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataComment(prc(i), x1, y1);
    x1 := x1 + 8;
    for j := 1 to n div 2 do
    begin
      x1 := x1 + 3;
      if not Odd(i) then
      DataN(c1[i div 2+1,j], x1, y1, 2)
      else
      DataN(c2[i div 2+1,j], x1, y1, 2);
    end;
  end;
(*
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a1[j],x1, 20, 2);
  end;
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a2[j],x1, 21, 2);
  end;
*)
    SetProcess(0);
    ResultN(prc(0), amin, 1, 1, 2);
    SetProcess(1);
    ResultN(prc(1), amax, 41, 1, 2);
    DataComment(DebugSec, 1, (n-1) div 2 + 2);
    j := 0;
    for i := 1 to n div 2 do
    begin
    DataComment('a'+IntToStr(j)+'|  1>  '+IntToStr(a1[i]), 1, (n-1) div 2 + 3+j);
    inc(j);
    DataComment('a'+IntToStr(j)+'|  1>  '+IntToStr(a2[i]), 1, (n-1) div 2 + 3+j);
    inc(j);
    end;

(*
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
  for i := 1 to n do
    ResultComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);
*)
end;

procedure MPIInter19;
var
  i, j, k0, x1, x2, y1, y2, sum: integer;
  s,s1: string;
begin
  n := RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'An array {A} of 2{K} integers is given in the master process, where {K}'#13+
'is the number of processes. Using one call of the MPI\_Comm\_spawn function'#13+
'with the first parameter "ptprj.exe", create {K} new processes. Using'#13+
'the MPI\_Intercomm\_merge function for the inter-communicator connected'#13+
'with the new processes, create a new intra-communicator which include both'#13+
'the initial and the new processes. The order of the processes in the new'#13+
'intra-communicator should be as follows: the initial processes, then the new'#13+
'ones (to specify this order, use the appropriate value of the parameter high'#13+
'of the MPI\_Intercomm\_merge function). Using the MPI\_Scatter collective'#13+
'function for the new intra-communicator, send the element {A}[{R}] of the array {A}'#13+
'to the process of rank {R} in this intra-communicator ({R}~=~0,~\., 2{K}~\-~1).'#13+
'Output the numbers received in the initial processes in the section'#13+
'of results, output the numbers received in the new processes in the debug'#13+
'section using the Show function. Then, using the MPI\_Reduce collective'#13+
'function in this intra-communicator, find and output the sum of all numbers'#13+
'in the process of rank 1 in this intra-communicator.');
(*
TaskText(
 '� ������� �������� ��� ������ {A} �� 2{K} ����� �����, ��� {K} \= ����������'#13#10
+'���������. ��������� ���� ����� ������� MPI\_Comm\_spawn � ������ ����������'#13#10
+'\<ptprj.exe\>, ������� {K} ����� ���������. ��������� �������'#13#10
+'MPI\_Intercomm\_merge ��� ������������������, ���������� � ����������'#13#10
+'����������, ������� ����� �����������������, ���������� ��� ��������,'#13#10
+'��� � ����� �������� (�������� high ������� MPI\_Intercomm\_merge ����������'#13#10
+'������ ����� �������, ����� � ��������� ������������������ �������'#13#10
+'������������� ��������, � ����� ��������� ��������). ��������� ������������'#13#10
+'������� MPI\_Scatter ��� ������ ������������������, ��������� �� ������'#13#10
+'�������� ������� {A} �� �������� �������� �� ��� �������� ����������'#13#10
+'(��� ��������, ��� � ���������) � ������� ����������� �� ������ � �����'#13#10
+'������������������. � �������� ��������� ������� ���������� �����, � �����'#13#10
+'��������� ���������� ���������� ����� � ������� �������, ��������� � ����'#13#10
+'��������� ������� Show. �����, ��������� ������������ ������� MPI\_Reduce'#13#10
+'� ���� �� ������������������, ��������� � �������� ������� ����� 1'#13#10
+'����� ���� ����� � ������� �� � ���� ��������.'
);*)
  SetProcess(0);
  DataComment(prc(0),1,1);
  x1 := 9;
  sum := 0;
  for i := 1 to 2*n do
  begin
    a[i] := RandomN(10,99);
    sum := sum + a[i];
    x1 := x1 + 3;
    DataN(a[i], x1, 1, 2);
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    ResultN(prc(i), a[i+1],1, i+1,2);
    if i = 1 then
    begin
      ResultN(sum, 15, 2, 3);
    end;
  end;
(*
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a1[j],x1, 20, 2);
  end;
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a2[j],x1, 21, 2);
  end;
*)
    DataComment(DebugSec, 1, 2);
    j := 0;
    for i := n+1 to 2*n do
    begin
    DataComment('a'+IntToStr(j)+'|  1>  '+IntToStr(a[i]), 1, 3+j);
    inc(j);
    end;


(*
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
  for i := 1 to n do
    ResultComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);
*)
end;


procedure MPIInter20;
var
  i, j, k0, x1, x2, y1, y2, sum: integer;
  a: array[1..10, 1..4] of integer;
  s,s1: string;
begin
  repeat
  n := RandomN(5,15);
  until n mod 4 <> 0;
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'The number of processes {K} is \Inot\i a multiple of 4. An integer {A} is given'#13+
'in each process. Using one call of the MPI\_Comm\_spawn function with the first'#13+
'parameter "ptprj.exe", create such a number of new processes (1, 2 or 3) that'#13+
'the total number of processes {K}_0 in the application would be a multiple of 4.'#13+
'Define an integer {A} equal to \-{R}\,\-\,1 in each new process, where {R} is the process'#13+
'rank. Using the MPI\_Intercomm\_merge function for the inter-communicator'#13+
'connected with the new processes, create a new intra-communicator which'#13+
'include both initial and new processes. The order of the processes in the new'#13+
'intra-communicator should be as follows: the initial processes, then the new'#13+
'ones (to specify this order, use the appropriate value of the parameter high'#13+
'of the MPI\_Intercomm\_merge function). Using the MPI\_Cart\_create function'#13+
'for the new intra-communicator, define a Cartesian topology for all processes'#13+
'as a two-dimensional ({K}_0/4~\x~4) grid, which is periodic in the second'#13+
'dimension (ranks of processes should not be reordered). Find the process'#13+
'coordinates in the created topology using the MPI\_Cart\_coords function. Output'#13+
'the coordinates found in the initial processes in the section of results,'#13+
'output the coordinates found in the new processes in the debug section'#13+
'with the "X~=~" and "Y~=~" comments using the Show function. Using'#13+
'the MPI\_Cart\_shift and MPI\_Sendrecv\_replace functions, perform a cyclic shift'#13+
'of the integers {A} given in all processes of each column of the grid by step \-1'#13+
'(that is, the number {A} should be sent from each process in the column,'#13+
'with the exception of the first process, to the previous process in the same'#13+
'column and from the first process in the column to the last process'#13+
'in the same column). Output the integers {A} received in the initial processes'#13+
'in the section of results, output the integers {A} received in the new processes'#13+
'in the debug section with the "A~=~" comment using the Show function.');
(*
TaskText(
 '���������� ��������� {K} �� ������� �� 4. � ������ �������� ���� ����� ����� {A}.'#13#10
+'��������� ���� ����� ������� MPI\_Comm\_spawn � ������ ���������� \<ptprj.exe\>,'#13#10
+'������� ����� ���������� ����� ��������� (1, 2 ��� 3), ����� ����� �����'#13#10
+'��������� {K}_0 � ���������� ����� ������� 4. � ������ �� ��������� ���������'#13#10
+'������ �������� ����� {A}, ������ \-{R}~\-~1, ��� {R} \= ���� ���������� ��������.'#13#10
+'��������� ������� MPI\_Intercomm\_merge ��� ������������������, ����������'#13#10
+'� ���������� ����������, ������� ����� �����������������, ����������'#13#10
+'��� ��������, ��� � ����� �������� (�������� high ������� MPI\_Intercomm\_merge'#13#10
+'���������� ������ ����� �������, ����� � ��������� ������������������ �������'#13#10
+'������������� ��������, � ����� ����� ��������). ��������� �������'#13#10
+'MPI\_Cart\_create ��� ���������� ������������������, ���������� ��� ����'#13#10
+'��������� ��������� ��������� � ���� ��������� ������� ������� ({K}_0/4)~\x~4,'#13#10
+'���������� ������������� �� ������� ��������� (������� ��������� ���������'#13#10
+'�������� �������). ��������� ������� MPI\_Cart\_coords, ���������� ����������'#13#10
+'{X}, {Y} ������� �������� � ������ �������; � �������� ��������� �������'#13#10
+'��� ����������, � ����� ��������� ���������� ���������� � ������� �������'#13#10
+'� ������� ������� Show, ������� �� ������������� \<X~=~\> � \<Y~=~\>. ���������'#13#10
+'����������� ����� �������� {A} � ������ ������� ��������� ������� � ����� \-1'#13#10
+'(�.\,�. � ����������� �������� ������ ���������), ��������� ��� ����� �������'#13#10
+'MPI\_Cart\_shift � MPI\_Sendrecv\_replace. � �������� ��������� �������'#13#10
+'���������� �������� {A}, � ����� ��������� ���������� �� � ������� �������'#13#10
+'� ������� ������� Show, ������� ������������ \<A~=~\>.'
);*)
  for i := 1 to n div 4 + 1 do
    for j := 1 to 4 do
      a[i,j] := RandomN(10,99);
  k := 0;
  for j := n mod 4+1 to 4 do
  begin
    k := k - 1;
    a[n div 4 + 1, j] := k;
  end;
  k := -1;
  for i := 1 to n div 4 + 1 do
  begin

    for j := 1 to 4 do
    begin
    k := k + 1;
    if k >= n then break;
    SetProcess(k);
    x1 := 1 + (j-1) * 20;
    DataN(prclong(k,20) + 'A = ', a[i,j], x1, i,2);
    ResultComment(prclong(k,20), x1, 2*i-1);
    ResultN('X = ', i-1, x1, 2*i,1);
    x1 := x1 + 6;
    ResultN('Y = ', j-1, x1, 2*i,1);
    x1 := x1 + 6;
    ResultN('A = ', a[(i) mod (n div 4 + 1) + 1,j], x1, 2*i,2);
    end;

  end;
//  ResultN(n,1,1,1);
(*
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a1[j],x1, 20, 2);
  end;
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a2[j],x1, 21, 2);
  end;
*)
    DataComment(DebugSec, 1, n div 4 + 2);
    j := 0;
    for i := n mod 4+1 to 4 do
    begin
      DataComment('a'+IntToStr(j)+'|  1>  X = '+IntToStr(n div 4) +
        ' Y = ' + IntToStr(i-1) + ' A = ' + IntToStr(a[1, i]), 1, n div 4 + 3 + j);
    inc(j);
    end;


(*
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
  for i := 1 to n do
    ResultComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);
*)
end;



procedure MPIInter21;
var
  i, j, k0, x1, x2, y1, y2: integer;
  s,s1: string;
  s0: array[1..2,1..10] of string;
begin
  n := RandomN(3,5);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'A real number is given in each process; this number is denoted by the letter {A}'#13+
'in the master process and by the letter {B} in the slave processes. Using two'#13+
'calls of the MPI\_Comm\_spawn function with the first parameter "ptprj.exe",'#13+
'create two groups of new processes as follows: the first group (named'#13+
'the \Iserver\i group) should include one process, the second group (named'#13+
'the \Iclient\i group) should include {K}~\-~1 processes, where {K} is the number'#13+
'of initial processes. Send the number {A} from the master process to the single'#13+
'new process of the server group, send the number {B} from each slave process'#13+
'to the corresponding new process of the client group (in ascending order'#13+
'of the process ranks). Output the number received in each new process'#13+
'in the debug section using the Show function. Using the MPI\_Open\_port,'#13+
'MPI\_Publish\_name, and MPI\_Comm\_accept functions on the server side'#13+
'and the MPI\_Lookup\_name and MPI\_Comm\_connect functions in the client side,'#13+
'establish a connection between two new groups of processes by means of a new'#13+
'inter-communicator. Using the MPI\_Send and MPI\_Recv functions for this'#13+
'inter-communicator, receive the number {A} in each process of the client group'#13+
'from the process of the server group. Found the sum of the received number {A}'#13+
'and the number {B}, which is received earlier from the initial slave process,'#13+
'and output the sum {A}~+~{B} in the debug section using the Show function in each'#13+
'process of the client group. Send this sum to the corresponding initial slave'#13+
'process and output the received sum in this process (the sum found'#13+
'in the process of rank {R} of the client group should be sent to the initial'#13+
'process of rank {R}~+~1). \P\SNote.\s The MPI\_Lookup\_name function call in the client'#13+
'processes should be performed \Iafter\i the function MPI\_Publish\_name call'#13+
'in the server process. You can, for example, use the MPI\_Barrier function'#13+
'for the initial processes and the server process: in the server process,'#13+
'the MPI\_Barrier function should be called after the call'#13+
'of the MPI\_Publish\_name function, whereas in the initial processes,'#13+
'the MPI\_Barrier function should be called before the call'#13+
'of the MPI\_Comm\_spawn function which create the client group.');
(*
TaskText(
 '� ������ �������� ���� ������������ �����: � ������� �������� ��� �����'#13#10
+'������������ ������ {A}, � ����������� ��������� \= ������ {B}. ��������� ���'#13#10
+'������ ������� MPI\_Comm\_spawn � ������ ���������� \<ptprj.exe\>, �������'#13#10
+'��� ������ ����� ���������: ������ ������ (������-\I������\i) ������ ���������'#13#10
+'���� �������, ������ ������ (������-\I������\i) ������ ��������� {K}~\-~1 �������,'#13#10
+'��� {K} \= ���������� �������� ���������. ��������� � ������� ������-�������'#13#10
+'����� {A} �� �������� ��������, � � �������� ������-������� \= ����� {B}'#13#10
+'�� ����������� ��������� (� ������� ����������� ������ ���������) � ����������'#13#10
+'���������� ����� � ������� �������, ��������� � ������ ����� �������� �������'#13#10
+'Show. � ������� ������� MPI\_Open\_port, MPI\_Publish\_name � MPI\_Comm\_accept'#13#10
+'�� ������� ������� � ������� MPI\_Lookup\_name � MPI\_Comm\_connect �� �������'#13#10
+'������� ���������� ����� ����� ����� ������ �������� ���������, ������ ��� ���'#13#10
+'����� �����������������. ��������� ������� MPI\_Send � MPI\_Recv ��� �����'#13#10
+'������������������, �������� � ������ �������� ������-������� ����� {A}'#13#10
+'�� �������� ������-������� � ����� ����� ����� ����� � ����� {B}, �����������'#13#10
+'����� �� �������� ����������� ���������. ���������� ��������� ����� {A}~+~{B}'#13#10
+'� ������� �������, ��������� � ������ �������� ������-������� ������� Show,'#13#10
+'� ����� ��������� ��� ����� � ��������������� �������� ����������� �������'#13#10
+'� ������� ���������� ����� � ���� �������� (�����, ��������� � ��������'#13#10
+'����� {R} ������-�������, ������ ���� ��������� � �������� ������� ����� {R}~+~1).'#13#10
+'\P\S����������.\s � ��������� ���������� ���������� ����� ������������������'#13#10
+'��������, ����� ����� ������� MPI\_Lookup\_name � ��������� �������'#13#10
+'�������������� ���������� \I�����\i ������ ������� MPI\_Publish\_name � ��������'#13#10
+'�������. �����, ��������, ������������ ������� MPI\_Barrier ��� ��������'#13#10
+'��������� � �������� �������, ������ �� � �������� ������� ������ �����'#13#10
+'���������� ������ ������� MPI\_Publish\_name, � ������� ������� MPI\_Comm\_spawn'#13#10
+'��� �������� ������-������� ��� ����� ������ �� ������� MPI\_Barrier'#13#10
+'� �������� ���������.'
);*)
  for i := 1 to n do
  begin
    b[i] := RandomR(1,4.9);
  end;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    s := 'A = ';
    if i > 0 then
      s := 'B = ';
    DataR(prc(i)+ '     ' + s, b[i+1],0, i+1,4);
  end;
  s := 'A + B = ';
  for i := 1 to n-1 do
  begin
    SetProcess(i);
    ResultR(prc(i)+ ' '+ s, b[1]+b[i+1],0, i,4);
  end;
(*
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a1[j],x1, 20, 2);
  end;
  x1 := 1;
  for j := 1 to n div 2 do
  begin
  x1 := x1 + 6;
  ResultN(a2[j],x1, 21, 2);
  end;
*)

    DataComment(DebugSec1, 1, n+1);
    Str(b[1]:0:2, s);
    s0[1,1] := 'a0|  1>  '+s;
    s0[2,n] := 'b0|  1>  '+s;
//    ResultComment('a0|  1>  '+s, 1, n+1);
    for i := 1 to n-1 do
    begin
    Str(b[i+1]:0:2, s);
    Str(b[1]+b[i+1]:0:2, s1);
    s0[1, i+1] := 'b'+IntToStr(i-1)+'|  1>  '+s + ' ' + s1;
    s0[2, i] := 'a'+IntToStr(i-1)+'|  1>  '+s + ' ' + s1;
    end;
    for i := 1 to n do
    begin
    DataComment(s0[1,i], 1, n+ 1 + i);

    DataComment(s0[2,i], 41, n+ 1 + i);
    end;

(*
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
  for i := 1 to n do
    ResultComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);
*)
end;

procedure MPIInter22;
var
  i, j, k0, k1, x1, x2, y1, y2: integer;
  s,s1: string;
  b0: boolean;
  s0: array[1..4,1..10] of string;
  a: array[0..20,1..20] of integer;
  b,k2: array[0..10] of integer;
  c: array[1..20] of integer;
begin
  n := RandomN(6,10);
  CreateTask(title3, n);
  if n = 0 then exit;
TaskText(
'An integer {N} is given in each process. The integer {N} can take three values:'#13+
'0, 1 and {K} ({K}~>~1). There is exactly one process with the value {N}~=~1'#13+
'and exactly {K} processes with the value {N}~=~{K}. In addition, an integer {A} is'#13+
'given in the processes with the non-zero integer {N}. Using the MPI\_Comm\_split'#13+
'finction, split the initial communicator MPI\_COMM\_WORLD into two ones:'#13+
'the first new communicator should include the process with {N}~=~1,'#13+
'the second one should include the processes with {N}~=~{K}. Using one call'#13+
'of the MPI\_Comm\_spawn function with the first parameter "ptprj.exe" for each'#13+
'new communicator, create two groups of new processes. The number of processes'#13+
'in each new group must coincide with the number of processes'#13+
'in the corresponding communicator (that is, the first group, named the \Iserver\i'#13+
'\Igroup\i, should include one process and the second one, named the \Iclient group\i,'#13+
'should include {K} processes). Send the integer {A} from each initial process'#13+
'to the new process; the rank of the receiving process should coincide'#13+
'with the rank of the sending process in the new communicator.'#13+
'Output the received integers in the debug section using the Show function.'#13+
'Using the MPI\_Open\_port, MPI\_Publish\_name, and MPI\_Comm\_accept functions'#13+
'on the server side and the MPI\_Lookup\_name and MPI\_Comm\_connect functions'#13+
'in the client side, establish a connection between two new groups of processes'#13+
'by means of a new inter-communicator. Using the MPI\_Gather collective function'#13+
'for this inter-communicator, send all the integers {A} from the processes'#13+
'of the client group to the single process of the server group and output'#13+
'the received numbers in the debug section using several calls of the Show'#13+
'function in the process of the server group. Then, using the MPI\_Send'#13+
'and MPI\_Recv functions, send all these numbers from the process of the server'#13+
'group to the initial process that has created the server group. Output'#13+
'the received numbers in this initial process. \P\SNote.\s The MPI\_Lookup\_name'#13+
'function call in the client processes should be performed \Iafter\i'#13+
'the MPI\_Publish\_name function call in the server process. You can,'#13+
'for example, send the number {A} to the process of the server group using'#13+
'the MPI\_Ssend function and call the MPI\_Barrier function for'#13+
'the MPI\_COMM\_WORLD communicator after the call of the MPI\_Ssend function'#13+
'(on the side of the receiving process, you should receive the number {A} only'#13+
'after the call of the MPI\_Publish\_name function). In the other processes'#13+
'of the MPI\_COMM\_WORLD communicator, you should call the MPI\_Barrier function'#13+
'and then send the numbers {A} to the processes of the client group. Thus,'#13+
'any of the processes of the client group will receive the number {A}'#13+
'only when the process of the server group has already'#13+
'called the MPI\_Publish\_name function.');
(*
TaskText(
 '� ������ �������� ���� ����� ����� {N}, ������� ����� ��������� ��� ��������:'#13#10
+'0, 1 � {K} ({K}~>~1). ��������, ��� ������� ����� ���� ������� �� ��������� {N}~=~1'#13#10
+'� ����� {K} ��������� �� ��������� {N}~=~{K}. � ��� ���������, � ������� ����� {N}'#13#10
+'�� ����� 0, ����� ���� ����� ����� {A}. ��������� ������� MPI\_Comm\_split,'#13#10
+'������� �������� ������������ MPI\_COMM\_WORLD �� ���, � ������ �� �������'#13#10
+'������ �������� � ���������� ��������� ��������� {N}. ��������� ���� �����'#13#10
+'������� MPI\_Comm\_spawn ��� ������� �� ��������� ��������������, ������� ���'#13#10
+'������ ����� ���������; ����� ����� ��������� ������ ��������� � �����������'#13#10
+'��������� � ��������������� ������������� (����� �������, � ����� ����� ������'#13#10
+'����� ����������� 1 �������, � ������ \= {K} ���������). ��������� � ������ ��'#13#10
+'����� ��������� ����� {A} �� ���� ��������� ��������, ���� �������� � ���������'#13#10
+'������������� ��������� � ������ ������ ��������. ���������� ���������� �����'#13#10
+'� ������� �������, ��������� � ������ ����� �������� ������� Show. ������'#13#10
+'����� ������, ��������� �� ������ ��������, \I�������-��������\i, � ����� ������'#13#10
+'�� {K} ��������� \= \I�������-��������\i, ���������� ����� ���� ����� � �������'#13#10
+'������� MPI\_Open\_port, MPI\_Publish\_name � MPI\_Comm\_accept �� ������� �������'#13#10
+'� MPI\_Lookup\_name � MPI\_Comm\_connect �� ������� �������. ���������'#13#10
+'������������ ������� MPI\_Gather ��� ������������������, ������������'#13#10
+'������-������ � ������-������, ��������� ��� ����� {A} �� ���������'#13#10
+'������-������� � ������� ������-������� � ���������� ���������� �����'#13#10
+'� ������� �������, ��������� ��������� ������� ������� Show � ��������'#13#10
+'������-�������. ����� ����, ��������� ��� ����� � ������� ������� MPI\_Send'#13#10
+'� MPI\_Recv �� �������� ������-������� � ��� �������� �������, ������� ������'#13#10
+'������-������, � ������� ���������� ����� � ���� �������� ��������.'#13#10
+'\P\S����������.\s � ��������� ���������� ���������� ����� ������������������'#13#10
+'��������, ����� ����� ������� MPI\_Lookup\_name � ��������� �������'#13#10
+'�������������� ���������� \I�����\i ������ ������� MPI\_Publish\_name � ��������'#13#10
+'�������. �����, ��������, ��������� ��������� �������. ��� ��������� ����� {A}'#13#10
+'� ������� ������-������� ��������� ������� MPI\_Ssend, ������ ����� ��� �������'#13#10
+'MPI\_Barrier ��� ��������� ������������� MPI\_COMM\_WORLD � ����������� �����'#13#10
+'����� ����� � �������� ������-������� ������ ����� ���������� �������'#13#10
+'MPI\_Publish\_name. � ��������� ��������� ��������� ������������� MPI\_COMM\_WORLD'#13#10
+'������� ������� ������� ������� MPI\_Barrier, � ����� ������������ ���������'#13#10
+'����� {A} � ��������� �������� ������-�������. ����� �������, �����'#13#10
+'�� ��������� ������-������� ������� ����� {A} ������ �����, ����� �������'#13#10
+'������-������� ��� �������� ����� ������� MPI\_Publish\_name.'
);*)
  b[1] := 1;
  b[2] := RandomN(2, n-2);
  for i := 1 to n do
    c[i] := 0;
  c[1] := 1;
  for i := 2 to b[2]+1 do
    c[i] := b[2];
  for i := 1 to 30 do
    SwapN(c[RandomN(1,n)], c[RandomN(1,n)]);
  for i := 1 to 2 do
    for j := 1 to b[i] do
      a[b[i],j] := RandomN(10,99);
  k2[0] := 0;
  k2[1] := 0;
  k2[b[2]] := 0;
  for i := 0 to n-1 do
  begin
    SetProcess(i);
    x1 := 1 + 40 * ((i) mod 2);
    y1 := i div 2 +1;
    DataN(prc(i)+' N = ', c[i+1], x1, y1, 1);
    x1 := x1 + 20;
    Inc(k2[c[i+1]]);
    if c[i+1] <> 0 then
      DataN(' A = ', a[c[i+1], k2[c[i+1]]], x1, y1, 2);
    if c[i+1] = 1 then
      k0 := i;
  end;
  y1 := 1;
  SetProcess(k0);
  ResultComment(prc(k0), 1, y1);
    x1 := 14;
    for j := 1 to b[2] do
    begin
      ResultN(a[b[2], j], x1, y1, 2);
      x1 := x1 + 4;
    end;
    y1 := y1 + 1;

    DataComment(DebugSec1, 1, (n-1) div 2 +2);
    s0[1,1] := 'a0|  1>  '+IntToStr(a[1,1]);
    s0[1,2] := 'a0|  2>  ';
    for j := 1 to b[2] do
      s0[1,2] := s0[1,2] + IntToStr(a[b[2], j])+ ' ';

    for j := 3 to b[2]+2 do
        s0[1, j] := 'b' + IntToStr(j-3) + '|  1>  '+IntTOStr(a[b[2], j-2]);

    for j := 1 to b[2] do
        s0[2, j] := 'a' + IntToStr(j-1) + '|  1>  '+IntTOStr(a[b[2], j]);


    s0[2,b[2]+1] := 'b0|  1>  '+IntToStr(a[1,1]);
    s0[2,b[2]+2] := 'b0|  2>  ';
    for j := 1 to b[2] do
      s0[2,b[2]+2] := s0[2,b[2]+2] + IntToStr(a[b[2], j])+ ' ';

    y2 := (n-1) div 2 +2;
    x1 := 1;
    for i := 1 to 2 do
    begin
      y1 := y2;
      for j := 1 to b[2]+2 do
      begin
        y1 := y1 + 1;
        DataComment(s0[i,j], x1, y1);
      end;
      x1 := x1 + 40;
    end;


(*
  for i := 1 to n do
  s0[i] := 'a'+IntToStr(i-1)+'|  1> ';
  for i := 1 to n do
  begin
    Str(b[i]:5:2,s);
    s0[i] := s0[i] + s;
  end;
  for i := 1 to n do
    ResultComment(s0[i], 1, n+ 1+i);
//  DataComment(prc(0)+'------', xLeft, 10);
//  DataComment(prc(1)+'------', xRight, 10);
*)
end;



procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: MPIInter1;
  2: MPIInter2;
  3: MPIInter3;
  4: MPIInter4;
  5: MPIInter5;
  6: MPIInter6;
  7: MPIInter7;
  8: MPIInter8;
  9: MPIInter9;
  10: MPIInter10;
  11: MPIInter11;
  12: MPIInter12;
  13: MPIInter13;
  14: MPIInter14;
  15: MPIInter15;
  16: MPIInter16;
  17: MPIInter17;
  18: MPIInter18;
  19: MPIInter19;
  20: MPIInter20;
  21: MPIInter21;
  22: MPIInter22;
  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI8Inter', 'Inter-communicators and process creation',
    'M. E. Abramyan, 2017', 'sddwertfghklbfdgfgd', 22, InitTask);
end;

// exports inittaskgroup;  //-------------------------------------

begin
end.
