{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4MPI3Coll_en;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  Topic3 = 'Collective data transfer';
  Topic4 = 'Global reduction operations';

procedure MpiC1;
var i,n,y,k: integer;
begin
  n := Random(3)+4;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'An integer is given in the master process. Send the given integer'#13+
'to all slave processes using the MPI\_Bcast function.'#13+
'Output the received integer in all slave processes.'
  );
(*
  TaskText('� ������� �������� ���� ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Bcast, ��������� ��� �����',0,3);
  TaskText('�� ��� ����������� �������� � ������� � ��� ���������� �����.',0,4);
*)
  k := Random(90) + 10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataN('Process 0: ', k, 0, 3, 2);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultN('Process '+Chr(i+48)+': ', k, 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiC2;
var i,n,y,j: integer;
  r: array[1..5] of real;
begin
  n := Random(3)+4;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 5 real numbers is given in the master process.'#13+
'Send the given sequence to all slave processes using the MPI\_Bcast function.'#13+
'Output received data in all slave processes.'
  );

(*
  TaskText('� ������� �������� ��� ����� �� 5 �����.',0,2);
  TaskText('��������� ������� MPI\_Bcast, ��������� ���� ����� �� ��� �����������',0,3);
  TaskText('�������� � ������� � ��� ���������� ����� � ��� �� �������.',0,4);
*)
  for i := 1 to 5 do
    r[i] := Random*89.99+10;
  y := 1;
  if n = 6 then y := 0;
  SetProcess(0);
  DataComment('Process 0:',13,3);
  for i := 1 to 5 do
  DataR('', r[i], Center(i,5,5,2), 3, 5);
  for i := 1 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Send the given numbers to master'#13+
'process using the MPI\_Gather function. Output received numbers'#13+
'in the master process in ascending order of ranks of sending processes'#13+
'(starting with the number that is given in the master process).'
  );
(*
  TaskText('� ������ �������� ���� ������������ �����.',0,2);
  TaskText('��������� ������� MPI\_Gather, ��������� ��� ����� � ������� �������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������ ������� �����, ������ � ������� ��������).',0,5);
*)
  for i := 1 to n do
    r[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Process 0:',0,2);
  for i := 1 to n do
  ResultR('', r[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', r[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC4;
var i,n,y,j: integer;
  a: array[1..5,1..5] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 5 integers is given in each process. Send the given sequences'#13+
'to master process using the MPI\_Gather function. Output received data'#13+
'in the master process in ascending order of ranks of sending processes'#13+
'(starting with the sequence that is given in the master process).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� 5 ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Gather, ��������� ��� ������ � ������� �������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������ ������� ����� �����, ������ � ������� ��������).',0,5);
*)
  for i := 1 to 5 do
    for j := 1 to 5 do
    a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  ResultComment('Process 0:',0,2);
  for i := 1 to n do
    for j := 1 to 5 do
  ResultN('', a[i,j], Center((i-1)*5+j,5*n,2,1), 3, 2);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',22,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {R}\,+\,2 integers is given in each process; the integer {R} is'#13+
'equal to rank of the process (there are given 2~integers in the process~0,'#13+
'3~integers in the process~1, and so~on). Send the given sequences to master'#13+
'process using the MPI\_Gatherv function. Output received data in the master'#13+
'process in ascending order of ranks of sending processes (starting with'#13+
'the sequence that is given in the master process).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {R}\,+\,2 ����� �����, ��� �����~{R} ����� �����',0,1);
  TaskText('�������� (� ��������~0 ���� 2~�����, � ��������~1 ���� 3~�����, � �.\,�.).',0,2);
  TaskText('��������� ������� MPI\_Gatherv, ��������� ��� ������ � ������� �������',0,3);
  TaskText('� ������� ���������� ������ � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������ ������� �����, ������ � ������� ��������).',0,5);
*)
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
  ResultComment('Process 0:',0,2);
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
    DataComment('Process '+Chr(i+48)+': ',20,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~real numbers is given in the master process; {K} is'#13+
'the number of processes. Send one element of given sequence to each process'#13+
'(including the master process) using the MPI\_Scatter function.'#13+
'Output the received number in each process.'
  );
(*
  TaskText('� ������� �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Scatter, ��������� �� ������ ����� � ������',0,3);
  TaskText('������� (������� �������) � ������� � ������ �������� ���������� �����.',0,4);
*)
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
      DataR('', a[i], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC7;
var i,n,y,j: integer;
  a: array[1..5,1..3] of real;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 3{K} real numbers is given in the master process, {K} is the number'#13+
'of processes. Send three elements of given sequence to each process'#13+
'(including the master process) using the MPI\_Scatter function.'#13+
'Output received numbers in each process.'
  );

(*
  TaskText('� ������� �������� ��� ����� �� 3{K} �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Scatter, ��������� �� 3~����� � ������ �������',0,3);
  TaskText('(������� �������) � ������� � ������ �������� ���������� �����.',0,4);
*)
  for i := 1 to n do
    for j := 1 to 3 do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
    for j := 1 to 3 do
      DataR('', a[i,j], Center((i-1)*3+j,3*n,4,1), 3, 4);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',21,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~real numbers is given in the master process; {K} is the number'#13+
'of processes. Using the MPI\_Scatterv function, send elements of given'#13+
'sequence to all processes as follows: the first element should be sent'#13+
'to the process~{K}\,\-\,1, the second element should be sent'#13+
'to the process~{K}\,\-\,2, \., the last element should be sent to the process~0).'#13+
'Output the received number in each process.'
  );
(*
  TaskText('� ������� �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('�� ����� ������� ������������ ����� � �������� ������ � ��������� �������',0,2);
  TaskText('MPI\_Scatterv, ��������� �� ������ ����� � ������ �������; ��� ���� ������',0,3);
  TaskText('����� ���� ��������� � �������~{K}\,\-\,1, ������ �����~\= � �������~{K}\,\-\,2, \.,',0,4);
  TaskText('��������� �����~\= � �������~0. ������� � ������ �������� ���������� �����.',0,5);
*)  
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n do
      DataR('', a[n-i+1], Center(i,n,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiC9;
var i,n,y,j,c,c0: integer;
  a: array[1..5,1..6] of integer;
begin
  n := Random(3)+3;
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,3)/2 integers is given in the master process;'#13+
'{K} is the number of processes. Using the MPI\_Scatterv function,'#13+
'send {R}\,+\,2 elements of given sequence to the process of rank {R},'#13+
'where {R}~=~0,~\., {K}\,\-\,1: the first two elements should be sent'#13+
'to the process~0, the next three elements should be sent to the process~1,'#13+
'and so~on. Output received numbers in each process.'
  );
(*
  TaskText('� ������� �������� ��� ����� �� {K}({K}\,+\,3)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Scatterv, ��������� � ������ �������',0,2);
  TaskText('����� ����� �� ������� ������; ��� ���� � ������� �����~{R} ���� ���������',0,3);
  TaskText('{R}\,+\,2~��������� ����� (� �������~0~\= ������ ��� �����, � �������~1~\=',0,4);
  TaskText('��������� ��� �����, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
*)
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
  DataComment('Process 0:',0,2);
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
    ResultComment('Process '+Chr(i+48)+': ',20,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,2 real numbers is given in the master process;'#13+
'{K} is the number of processes. Using the MPI\_Scatterv function, send'#13+
'three elements of given sequence to each process as follows: elements'#13+
'with order numbers in the range~{R}\,+\,1 to~{R}\,+\,3 should be sent'#13+
'to the process of rank~{R}, where {R}~=~0,~\., {K}\,\-\,1 (the initial three'#13+
'elements should be sent to the process~0; the second, the third,'#13+
'and the fourth element should be sent to the process~1, and so~on).'#13+
'Output received numbers in each process.'
  );
(*
  TaskText('� ������� �������� ��� ����� �� {K}\,+\,2 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scatterv, ��������� � ������ ������� ��� �����',0,2);
  TaskText('�� ������� ������; ��� ���� � ������� �����~{R} ������ ���� ��������� �����',0,3);
  TaskText('� �������� �� {R}\,+\,1 �� {R}\,+\,3 (� �������~0~\= ������ ��� �����, � �������~1~\= �����',0,4);
  TaskText('�� ������� �� ���������, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
*)
  for i := 1 to n+2 do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  SetProcess(0);
  DataComment('Process 0:',0,2);
  for i := 1 to n+2 do
      DataR('', a[i], Center(i,n+2,5,2), 3, 5);
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',20,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A real number is given in each process. Send given numbers to all process'#13+
'using the MPI\_Allgather function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the number received from itself).'
  );
(*
  TaskText('� ������ �������� ���� ������������ �����.',0,2);
  TaskText('��������� ������� MPI\_Allgather, ��������� ��� ����� �� ��� ��������',0,3);
  TaskText('� ������� �� � ������ �������� � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
*)
  for i := 1 to n do
      a[i] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataR('Process '+Chr(i+48)+': ', a[i+1], 0, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'Four integers are given in each process. Send given integers to all processes'#13+
'using the MPI\_Allgather function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ���� ������ ����� �����.',0,2);
  TaskText('��������� ������� MPI\_Allgather, ��������� ��� ����� �� ��� ��������',0,3);
  TaskText('� ������� �� � ������ �������� � ������� ����������� ������ �����������',0,4);
  TaskText('�� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
*)
  for i := 1 to n do
    for j := 1 to 4 do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
    for j := 1 to 4 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {R}\,+\,2 integers is given in each process; {R} is the rank'#13+
'of process (that is, two integers are given in the process~0, three integers'#13+
'are given in the process~1, and so~on). Send given integers to all processes'#13+
'using the MPI\_Allgatherv function. Output received data in each process'#13+
'in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {R}\,+\,2 ����� �����, ��� �����~{R} ����� �����',0,1);
  TaskText('�������� (� ��������~0 ���� 2~�����, � ��������~1 ����~3 �����, � �.\,�.).',0,2);
  TaskText('��������� ������� MPI\_Allgatherv, ��������� ��� ������ �� ��� ��������',0,3);
  TaskText('� ������� �� � ������� ����������� ������ ����������� �� ���������',0,4);
  TaskText('(������� �����, ���������� �� ����� �� ��������).',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
    for j := 1 to i+2 do
      DataN('', a[i+1,j], Center(j,4,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K} real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Alltoall function, send one element of each'#13+
'given sequence to each process as follows: first element of each sequence'#13+
'should be sent to the process~0, second element of each sequence'#13+
'should be sent to the process~1, and so~on. Output received numbers'#13+
'in each process in ascending order of ranks of sending processes'#13+
'(including the number received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoall, ��������� � ������ ������� �� ������ �����',0,2);
  TaskText('�� ���� �������: � �������~0~\= ������ ����� �� �������, � �������~1~\= ������',0,3);
  TaskText('�����, � �.\,�. � ������ �������� ������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
*)  
  for i := 1 to n do
    for j := 1 to n do
      a[i,j] := Random*89.99+10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',13,y+i);
    for j := 1 to n do
      DataR('', a[i+1,j], Center(j,n,5,2), y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',13,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 3{K} integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Alltoall function, send three elements of each'#13+
'given sequence to each process as follows: the initial three elements'#13+
'of each sequence should be sent to the process~0, the next three elements'#13+
'of each sequence should be sent to the process~1, and so~on. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� 3{K} ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoall, ��������� � ������ ������� ��� ��������� �����',0,2);
  TaskText('�� ������� ������ (� �������~0~\= ������ ��� �����, � �������~1~\= ��������� ���',0,3);
  TaskText('�����, � �.\,�.). � ������ �������� ������� ����� � ������� ����������� ������',0,4);
  TaskText('����������� �� ��������� (������� �����, ���������� �� ����� �� ��������).',0,5);
*)
  for i := 1 to n do
    for j := 1 to 3*n do
      a[i,j] := Random(90) + 10;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',7,y+i);
    for j := 1 to 3*n do
      DataN('', a[i+1,j], Center(j,3*n,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',7,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,1)/2 integers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send some'#13+
'elements of each given sequence to each process as follows: the first element'#13+
'of each sequence should be sent to the process~0, the next two elements'#13+
'of each sequence should be sent to the process~1, the next three elements'#13+
'of each sequence should be sent to the process~2, and so~on. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}({K}\,+\,1)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Alltoallv, ��������� � ������ �������',0,2);
  TaskText('����� ����� �� ������� ������; ��� ���� � �������~{R} ������ ���� ���������',0,3);
  TaskText('{R}\,+\,1~��������� ����� (� �������~0~\= ������ ����� ������� ������, � �������~1~\=',0,4);
  TaskText('��������� ��� �����, � �.\,�.). � ������ �������� ������� ���������� �����.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,1,1), y+i, 1);
  end;
  c1 := 0;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',15,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,1 real numbers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send two elements'#13+
'of each given sequence to each process as follows: the initial two elements'#13+
'of each sequence should be sent to the process~0, the second and the third'#13+
'element of each sequence should be sent to the process~1, \., the last two'#13+
'elements of each sequence should be sent to the last process. Output received'#13+
'numbers in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,1 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoallv, ��������� � ������ ������� ��� ����� ��',0,2);
  TaskText('������� ������; ��� ���� � �������~0 ���� ��������� ������ ��� �����,',0,3);
  TaskText('� �������~1~\= ������ � ������ �����, \., � ��������� �������~\= ���������',0,4);
  TaskText('��� ����� ������� ������. � ������ �������� ������� ���������� �����.',0,5);
*)
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
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
  CreateTask(Topic3, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,1 real numbers is given in each process; {K} is'#13+
'the number of processes. Using the MPI\_Alltoallv function, send two elements'#13+
'of each given sequence to each process as follows: the last two elements'#13+
'of each sequence (with the order numbers {K}\,+\,1 and~{K}) should be sent'#13+
'to the process~0, the elements of each sequence with the order numbers {K}\,\-\,1'#13+
'and~{K} should be sent to the process~1, \., the initial two elements'#13+
'of each sequence should be sent to the last process. Output received numbers'#13+
'in each process in ascending order of ranks of sending processes'#13+
'(including the numbers received from itself).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,1 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Alltoallv, ��������� � ������ ������� ��� ����� ��',0,2);
  TaskText('������� ������; ��� ���� � �������~0 ���� ��������� ��������� ��� �����, �',0,3);
  TaskText('�������~1~\= ��� �����, �������������� ����������, \., � ��������� �������~\=',0,4);
  TaskText('������ ��� ����� ������� ������. � ������ �������� ������� ���������� �����.',0,5);
*)
  c := n + 1;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*9.98;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Find sums of elements of all given sequences'#13+
'with the same order number using the MPI\_Reduce function'#13+
'with the MPI\_SUM operation. Output received sums in the master process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ����������',0,2);
  TaskText('���������. ��������� ������� MPI\_Reduce ��� �������� MPI\_SUM, ��������������',0,3);
  TaskText('�������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� ����� � ������� ��������.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
    for j := 1 to c do
      ResultN('', a[1,j], Center(j,c,2,1), 3, 2);
  SetTestCount(5);
end;

procedure MpiD2;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Find the minimal value among the elements of all given'#13+
'sequences with the same order number using the MPI\_Reduce function'#13+
'with the MPI\_MIN operation. Output received minimal values'#13+
'in the master process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Reduce ��� �������� MPI\_MIN, ����� �����������',0,3);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� �������� � ������� ��������.',0,5);
*)
  c := n + 5;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,4,1), y+i, 4);
  end;
  for i := 2 to n do
    for j := 1 to c do
      if a[i,j] < a[1,j] then
        a[1,j] := a[i,j];
    SetProcess(0);
    ResultComment('Process '+Chr(0+48)+':',0,2);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce function with the MPI\_MAXLOC'#13+
'operation, find the maximal value among the elements of all given sequences'#13+
'with the same order number and also the rank of process that contains this'#13+
'maximal value. Output received maximal values and ranks in the master process'#13+
'(first, output all maximal values, then output all corresponding ranks).'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce ��� �������� MPI\_MAXLOC, ����� ������������',0,2);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('� ���� ��������, ����������� ��� ������������ ��������. ������� � �������',0,4);
  TaskText('�������� ������� ��� ���������, � �����~\= ����� ���������� �� ���������.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
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
    ResultComment('Process '+Chr(0+48)+':',0,2);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Find products of elements of all given sequences with the same'#13+
'order number using the MPI\_Allreduce function with the MPI\_PROD operation.'#13+
'Output received products in each process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,2);
  TaskText('��������� ������� MPI\_Allreduce ��� �������� MPI\_PROD, �����������',0,3);
  TaskText('�������� ������ ������� � ����� � ��� �� ���������� �������',0,4);
  TaskText('� ������� ���������� ������������ �� ���� ���������.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] * a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',6,y+i);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Allreduce function with the MPI\_MINLOC'#13+
'operation, find the minimal value among the elements of all given sequences'#13+
'with the same order number and also the rank of process that contains'#13+
'this minimal value. Output received minimal values in the master process'#13+
'and output corresponding ranks in each slave process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Allreduce ��� �������� MPI\_MINLOC, ����� �����������',0,2);
  TaskText('�������� ����� ��������� ������ ������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('� ���� ��������, ����������� ����������� ��������. ������� � ������� ��������',0,4);
  TaskText('��������, � � ��������� ���������~\= ����� ���������, ���������� ��� ��������.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
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
    ResultComment('Process '+Chr(i+48)+': ',5,y+i);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}~integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find sums of elements'#13+
'of all given sequences with the same order number and send one sum'#13+
'to each process as follows: the first sum should be sent to the process~0,'#13+
'the second sum should be sent to the process~1, and so~on.'#13+
'Output the received sum in each process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}~����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce\_scatter, �������������� �������� ������',0,2);
  TaskText('������� � ����� � ��� �� ���������� �������, ��������� �� �����',0,3);
  TaskText('�� ���������� ���� � ������ ������� (������ �����~\= � �������~0, ������~\=',0,4);
  TaskText('� �������~1, � �.\,�.) � ������� � ������ �������� ���������� �����.',0,5);
*)
  c := n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random(15) + 5;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',22,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 2 to n do
    for j := 1 to c do
      a[1,j] := a[1,j] + a[i,j];
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+':',22,y+i);
    ResultN('', a[1,i+1], 0, y+i, 2);
  end;
  SetTestCount(5);
end;

procedure MpiD7;
var i,n,y,j,c: integer;
  a: array[1..5,1..10] of real;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of 2{K}~real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find maximal'#13+
'values among elements of all given sequences with the same order number'#13+
'and send two maximal values to each process as follows: the initial'#13+
'two maximums should be sent to the process~0, the next two maximums should be'#13+
'sent to the process~1, and so~on. Output received data in each process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� 2{K}~�����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Reduce\_scatter, ����� ��������� ����� ��������� ����',0,2);
  TaskText('������� � ����� � ��� �� ���������� �������, ��������� �� ��� ���������',0,3);
  TaskText('��������� � ������ ������� (������ ��� ���������~\= � �������~0, ���������',0,4);
  TaskText('���~\= � �������~1, � �.\,�.) � ������� � ������ �������� ���������� ������.',0,5);
*)
  c := 2*n;
  for i := 1 to n do
    for j := 1 to c do
      a[i,j] := Random*8.99+1;
  y := 2;
  if n = 5 then y := 1;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    DataComment('Process '+Chr(i+48)+': ',5,y+i);
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
    ResultComment('Process '+Chr(i+48)+':',25,y+i);
    ResultR2('', a[1,2*i+1], a[1,2*i+2], 0, y+i, 5);
  end;
  SetTestCount(5);
end;

procedure MpiD8;
var i,n,y,j,k,c,k1: integer;
  a: array[1..5,1..20] of integer;
begin
  n := Random(3)+3;
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}({K}\,+\,3)/2 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Reduce\_scatter function, find minimal'#13+
'values among elements of all given sequences with the same order number'#13+
'and send some minimal values to each process as follows: the initial'#13+
'two minimums should be sent to the process~0, the next three minimums'#13+
'should be sent to the process~1, \., the last {K}\,+\,1 minimums should be'#13+
'sent to the process~{K}\,\-\,1. Output received data in each process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}({K}\,+\,3)/2 ����� �����, ��� {K}~\= ����������',0,1);
  TaskText('���������. ��������� ������� MPI\_Reduce\_scatter, ����� ����������� ��������',0,2);
  TaskText('����� ��������� ���� ������� � ����� � ��� �� ���������� ������� � ���������',0,3);
  TaskText('������ ��� �������� � �������~0, ��������� ���~\= � �������~1, \., ���������',0,4);
  TaskText('{K}\,+\,1~���������~\= � �������~{K}\,\-\,1. ������� � ������ �������� ���������� ������.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
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
    ResultComment('Process '+Chr(i+48)+':',6,y+i);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 real numbers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Scan function, find products of elements'#13+
'of given sequences with the same order number as follows:'#13+
'the products of elements of sequences given in the processes'#13+
'of rank~0,~\., {R} should be found in the process~{R} ({R}~=~0, 1,~\., {K}\,\-\,1).'#13+
'Output received data in each process; in particular, products of elements'#13+
'of all given sequences should be output in the process~{K}\,\-\,1.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scan, ����� � �������� �����~{R} ({R}~=~0, 1,~\., {K}\,\-\,1)',0,2);
  TaskText('������������ ��������� � ����� � ��� �� ���������� ������� ��� �������, ������',0,3);
  TaskText('� ��������� � ������� ��~0 ��~{R}, � ������� ��������� ������������ (��� ����',0,4);
  TaskText('� �������� {K}\,\-\,1 ����� �������� ������������ ��������� �� ���� �������).',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',6,y+i);
    for j := 1 to c do
      DataR('', a[i+1,j], Center(j,c,5,1)+k1, y+i, 5);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',6,y+i);
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
  CreateTask(topic4, n);
  if n = 0 then exit;
  TaskText(
'A sequence of {K}\,+\,5 integers is given in each process; {K} is the number'#13+
'of processes. Using the MPI\_Scan function, find maximal values'#13+
'among elements of given sequences with the same order number as follows:'#13+
'the maximal values of elements of sequences given in the processes'#13+
'of rank~0,~\., {R} should be found in the process~{R} ({R}~=~0, 1,~\., {K}\,\-\,1).'#13+
'Output received data in each process.'
  );
(*
  TaskText('� ������ �������� ��� ����� �� {K}\,+\,5 ����� �����, ��� {K}~\= ���������� ���������.',0,1);
  TaskText('��������� ������� MPI\_Scan, ����� � �������� �����~{R} ({R}~=~0, \.,~{K}\,\-\,1)',0,2);
  TaskText('������������ �������� ����� ��������� � ����� � ��� �� ���������� �������',0,3);
  TaskText('��� �������, ������ � ��������� � ������� ��~0 ��~{R},',0,4);
  TaskText('� ������� � ������ �������� ��������� ���������.',0,5);
*)
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
    DataComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
      DataN('', a[i+1,j], Center(j,c,2,1), y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',15,y+i);
    for j := 1 to c do
    begin
      if a[i+1,j] > b[j] then
        b[j] := a[i+1,j];
      ResultN('', b[j], Center(j,c,2,1), y+i, 2);
    end;
  end;
  SetTestCount(5);
end;
(*
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
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
      ResultN3('', a[j], b[j], c[j], 3+j*10, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
      ResultN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    DataComment('Process '+Chr(i+48)+': ',3,y+i);
      DataN3('', a[i], b[i], c[i], 13, y+i, 3);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
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
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    ResultComment('Process '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
      DataN('', a[i], 35+6, y+i, 2);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
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
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataR('', b[i], 35+3, y+i, 5);
      DataN('', c[i], 35+9, y+i, 2);
  end;
  for i := 0 to n - 1 do
  begin
    SetProcess(i);
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
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
    DataComment('Process '+Chr(i+48)+': ',3,y+i);
    x := 13;
    for j := 1 to i do
    begin
      DataN2('', a[i,j], c[i,j], x, y+i, 3);
      DataR('', b[i,j], x+7, y+i, 5);
      x := x + 13;
    end;
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,y+1);
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
    ResultComment('Process '+Chr(i+48)+': ',9,y+i);
    for j := 1 to n do
      ResultN('', a[j], Center(j,n,2,1)-12, y+i, 2);
    for j := 1 to n do
      ResultR('', b[j], Center(j,n,5,1)+16, y+i, 5);
  end;
  SetProcess(0);
    DataComment('Process 0:',9,3);
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
    ResultComment('Process '+Chr(i+48)+': ',24,y+i);
      ResultN('', a[i], 35, y+i, 2);
      ResultR('', b[i], 35+3, y+i, 5);
      ResultN('', c[i], 35+9, y+i, 2);
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    ResultComment('Process '+Chr(i+48)+': ',3,y+i);
    for j := 1 to n-1 do
    begin
      ResultN('', a[j], 1+j*13, y+i, 2);
      ResultN('', c[j], 1+j*13+3, y+i, 2);
      ResultR('', b[j], 1+j*13+6, y+i, 5);
    end;
  end;
  SetProcess(0);
    DataComment('Process 0:',3,3);
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
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataN('', a[i], 35, y+i, 2);
      DataN('', c[i], 35+3, y+i, 2);
      DataR('', b[i], 35+6, y+i, 5);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
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
    DataComment('Process '+Chr(i+48)+': ',24,y+i);
      DataR('', b[i], 35, y+i, 5);
    for j := 1 to i do
      DataN('', a[i,j], 38+j*3, y+i, 2);
  end;
  SetProcess(0);
    ResultComment('Process 0:',3,3);
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
    DataComment('Process 0:',0,2);
    for j := 1 to n1 do
      DataN('', a[j], Center(j,n1,2,1), 3, 2);
  for i := 1 to n1 do
  begin
    k := 2*i-2;
    SetProcess(k);
    ResultN('Process '+Chr(k+48)+': ', a[i], 0, y+i, 2);
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
    DataR2('Process '+Chr(k+48)+':', a[k], a[k+1], 0, y+i, 6);
  end;
  for i := 1 to n1 do
  begin
    k := 2*i-1;
    SetProcess(k);
    ResultComment('Process '+Chr(k+48)+':',5,y+i);
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
    DataN3('Process '+s+':', a[k+1], a[k+2], a[k+3], 0, y+i, 3);
  end;
    SetProcess(0);
    ResultComment('Process 0:',0,2);
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
    DataR3('Process '+Chr(k+48)+':', a[i,1], a[i,2], a[i,3], 0, y+i, 6);
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
    DataR('Process '+Chr(2*i+48)+': ', r, xLeft, y+i, 5);
    if r > max then
      max := r;
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    r := 89.98*Random+10;
    DataR('Process '+Chr(2*i-1+48)+': ', r, xRight, y+i-1, 5);
    if r < min then
      min := r;
  end;
    SetProcess(0);
    ResultR('Process 0: ', max, xLeft, 3, 5);
    SetProcess(1);
    ResultR('Process 1: ', min, xRight, 3, 5);
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
  TaskText('Process � {N}~=~1 � ������� � ���� ����������� ��������� ���������� �����.',0,0);
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
    DataN('Process 0: K = ', k, xLeft, 1, 1);
    for j := 1 to k do
      DataR('',r[j],25+j*7,1,5);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], xLeft, y+i-1, 1);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], xRight, y+i-1, 1)
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
      ResultR('Process '+Chr(i+48)+': ', r[j], 0, y+j, 5);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Process '+Chr(m+48)+':', 5, 3);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5);
  end;
    SetProcess(m);
    ResultComment('Process '+Chr(m+48)+':', 5, 3);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
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
      ResultComment('Process '+Chr(m+48)+':', 5, y+j);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataN('A = ', r1[2*i], 23, y+i, 2)
    else
      DataN('A = ', r2[2*i], 23, y+i, 2)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataN('A = ', r1[2*i-1], 63, y+i-1, 2)
    else
      DataN('A = ', r2[2*i-1], 63, y+i-1, 2)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 5, y+i);
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
    ResultComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
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
      ResultR('Process '+Chr(m+48)+': ', sum, 5, y+j, 6);
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
    DataN('Process '+Chr(2*i+48)+': N = ', b[2*i], 5, y+i, 1);
    if b[2*i]=1 then
      DataR('A = ', r1[2*i], 23, y+i, 5)
    else
      DataR('A = ', r2[2*i], 23, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': N = ', b[2*i-1], 45, y+i-1, 1);
    if b[2*i-1]=1 then
      DataR('A = ', r1[2*i-1], 63, y+i-1, 5)
    else
      DataR('A = ', r2[2*i-1], 63, y+i-1, 5)
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 5, y+i);
    if b[2*i]=1 then
      ResultR('', min, 16, y+i, 5)
    else
      ResultR('', max, 16, y+i, 5)
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
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
  DataN('Process 0: N = ',k,0,3,1);
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
      ResultN2('Process ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
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
  DataN('Process 0: N = ',k,0,3,1);
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
      ResultN2('Process ' + Chr(m+48)+':', i-1,j-1,Center(j,n div k,14,d),y+i,2);
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
    DataR('Process '+Chr((i-1)*(n div k)+48)+': A = ',r[i],0,2*i,3);
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
      ResultR('Process ' + Chr(m+48)+': ', r[i],Center(j,n div k,14,d),y+i,3);
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
    DataR('Process '+Chr(i-1+48)+': A = ',r[i],0,2*i,3);
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
      ResultR('Process ' + Chr(m+48)+': ', r[j],Center(j,k,14,d),y+i,3);
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
    DataComment('Process '+Chr((i-1)*n+48)+':',22,i+1);
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
      ResultN('Process ' + s+': ', r[i,j],Center(j,n,13,d),y+i,2);
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
    DataComment('Process '+Chr(i-1+48)+':',22,i+1);
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
      ResultN('Process ' + s+': ', r[j,i],Center(j,k,13,d),y+i,2);
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
        DataN('Process '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  m := 0;
  y := 1;
  for l := 1 to 2 do
  for i := 1 to 2 do
  begin
    SetProcess(m);
    y := y + 1;
    str(m,s);
    ResultComment('Process ' + s+':', 20, y);
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
        DataN('Process '+s+': ',r[i,l,j],Center(j,k,14,4),i+(l-1)*3,2);
      end;
  y := 1;
  if k = 2 then y := 2;
  for j := 1 to k do
  begin
    SetProcess(j-1);
    str(j-1,s);
    ResultComment('Process ' + s+':', 20, y+j);
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
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,4),i+(l-1)*3,4);
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
      ResultR('Process ' + s+': ', r1[i,j],Center(j,k,17,4),y+2*i,5);
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
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
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
        ResultR('Process '+s+': ',r1[j],Center(j,k,17,5),i+(l-1)*3,5);
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
    DataComment('Process '+Chr(2*i+48)+': ', 5, y+i);
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
    DataComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Process '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],1,0), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Process '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],1,0), 45, y+i-1, 2);
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
    DataComment('Process '+Chr(2*i+48)+': ', 5, y+i);
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
    DataComment('Process '+Chr(2*i-1+48)+':', 45, y+i-1);
    x := 56;
    DataN('X =', a[2*i-1], x, y+i-1, 2);
    DataN('Y =', b[2*i-1], x+7, y+i-1, 2);
  end;
  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultN('Process '+Chr(2*i+48)+': ', GetRank(m,k,a[2*i],b[2*i],0,1), 5, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultN('Process '+Chr(2*i-1+48)+': ', GetRank(m,k,a[2*i-1],b[2*i-1],0,1), 45, y+i-1, 2);
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
    DataR('Process '+Chr(i+48)+': ', a[i], 0, y+i, 5);
  end;
  for i := 1 to n - 1 do
  begin
    SetProcess(i-1);
    ResultR('Process '+Chr(i-1+48)+': ', a[i], 0, y+i, 5);
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
      ResultR('Process ' + Chr(m+48)+': ', r[i,j-1],Center(j,n div k,14,d),y+i,3);
    end;
  m := -1;
  for i := 1 to k do
    for j := 1 to n div k do
    begin
      m := m + 1;
      SetProcess(m);
      DataR('Process ' + Chr(m+48)+': ', r[i,j mod (n div k)],Center(j,n div k,14,d),y+i,3);
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
        DataR('Process '+s+': ',r[i,l,j],Center(j,k,17,5),i+(l-1)*3,5);
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
        ResultR('Process '+s+': ',r[i,l,j1],Center(j,k,17,5),i+(l-1)*3,5);
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
    DataN('Process 0: A = ', a[0], xLeft, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': A = ', a[2*i-1], xLeft, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    DataN('Process '+Chr(2*i+48)+': A = ', a[2*i], xRight, y+i, 2)
  end;
    SetProcess(0);
    ResultComment('Process 0:',12,y);
    for i := 1 to k do
      ResultN('', a[2*i-1], 20+i*3, y, 2);
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    ResultComment('Process '+Chr(2*i-1+48)+':',12,y+i);
    ResultN('', a[0], 23, y+i, 2);
    ResultN('', a[2*i], 26, y+i, 2);
  end;
  for i := 1 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':',51,y+i);
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
  TaskText('Process ��������� �����~{R} (1, 3,~\., 2{N}\,\-\,1) ������ � ��������� �����~{R}\,\-\,1',0,5);
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
    DataN('Process '+Chr(2*i+48)+': A = ', a[2*i], xLeft, y+i, 2);
  end;
  for i := 1 to n div 2 do
  begin
    SetProcess(2*i-1);
    DataN('Process '+Chr(2*i-1+48)+': A = ', a[2*i-1], xRight, y+i-1, 2);
  end;

  for i := 0 to (n+1) div 2 - 1 do
  begin
    SetProcess(2*i);
    ResultComment('Process '+Chr(2*i+48)+':', 12, y+i);
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
    ResultN('Process '+Chr(2*i-1+48)+': ', a[2*i-2], 51, y+i-1, 2);
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
    DataN('Process  0: A = ', a[0], 0, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    DataN('Process '+s+': A = ', a[m], Center(j,3,18,6), y+i, 2);
  end;
  SetProcess(0);
  ResultComment('Process  0:', 31, y);
  for i := 1 to k do
    ResultN('', a[3*i], 40+i*3, y, 2);
  for i := 1 to k do
  for j := 1 to 3 do
  begin
    m := 3*(i-1)+j;
    SetProcess(m);
    Str(m:2,s);
    ResultComment('Process '+s+':', -17+j*24, y+i);
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
    DataR('Process '+s+': ', d, 0, i+1, 6);
    ResultR('Process '+s+': ', -d, 0, i+1, 6);
  end;
  SetTestCount(5);
end;
*)


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
  6: MpiA9;
  7: MpiB1;
  8: MpiB2;
  9: MpiB3;
 10: MpiB4;
 11: MpiB5;
 12: MpiB6;
 13: MpiB7;
 14: MpiB8;
 15: MpiB9;
 16: MpiB10;
 17: MpiB11;
 18: MpiB12;
 19: MpiB13;
 20: MpiB14;
 21: MpiB15;
 22: MpiB16;
 23: MpiB17;
 24: MpiB18;
 25: MpiB19;
 26: MpiB20;
 27: MpiB21;
 28: MpiB22;
 29: MpiB23;}
 1: MpiC1;
 2: MpiC2;
 3: MpiC3;
 4: MpiC4;
 5: MpiC5;
 6: MpiC6;
 7: MpiC7;
 8: MpiC8;
 9: MpiC9;
 10: MpiC10;
 11: MpiC11;
 12: MpiC12;
 13: MpiC13;
 14: MpiC14;
 15: MpiC15;
 16: MpiC16;
 17: MpiC17;
 18: MpiC18;
 19: MpiD1;
 20: MpiD2;
 21: MpiD3;
 22: MpiD4;
 23: MpiD5;
 24: MpiD6;
 25: MpiD7;
 26: MpiD8;
 27: MpiD9;
 28: MpiD10;
{ 58: MpiE1;
 59: MpiE2;
 60: MpiE3;
 61: MpiE4;
 62: MpiE5;
 63: MpiE6;
 64: MpiE7;
 65: MpiE8;
 66: MpiF1;
 67: MpiF2;
 68: MpiF3;
 69: MpiF4;
 70: MpiF5;
 71: MpiG1;
 72: MpiG2;
 73: MpiG3;
 74: MpiG4;
 75: MpiG5;
 76: MpiG6;
 77: MpiG7;
 78: MpiG8;
 79: MpiG9;
 80: MpiG10;
 81: MpiG11;
 82: MpiG12;
 83: MpiH1;
 84: MpiH2;
 85: MpiH3;
 86: MpiH4;
 87: MpiH5;
 88: MpiH6;
 89: MpiH7;
 90: MpiH8;
 91: MpiH9;
 92: MpiH10;
 93: MpiH11;
 94: MpiH12;
 95: MpiH13;
 96: MpiH14;
 97: MpiH15;
 98: MpiH16;
 99: MpiH17;
100: MpiH18;
}
  end;
end;


procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('MPI3Coll', 'Collective communications', 'M. E. Abramyan, 2014,2017',
  'sddfgfsjnbvvdfsd78fgfgd', 28, InitTask);
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
