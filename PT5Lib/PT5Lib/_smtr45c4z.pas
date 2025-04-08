{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _smtr45c4z;

interface

procedure SMtr45Cn1(Name, Key: string);
procedure SMtr45Cn2(Name, Key: string);
procedure SMtr45Cn3(Name, Key: string);
procedure SMtr45Cn4(Name, Key: string);
procedure SMtr45Cn5(Name, Key: string);
procedure SMtr45Cn6(Name, Key: string);
procedure SMtr45Cn7(Name, Key: string);
procedure SMtr45Cn8(Name, Key: string);
procedure SMtr45Cn9(Name, Key: string);
procedure SMtr45Cn10(Name, Key: string);
procedure SMtr45Cn11(Name, Key: string);
procedure SMtr45Cn12(Name, Key: string);
procedure SMtr45Cn13(Name, Key: string);
procedure SMtr45Cn14(Name, Key: string);
procedure SMtr45Cn15(Name, Key: string);
procedure SMtr45Cn16(Name, Key: string);
procedure SMtr45Cn17(Name, Key: string);
procedure SMtr45Cn18(Name, Key: string);
procedure SMtr45Cn19(Name, Key: string);
procedure SMtr45Cn20(Name, Key: string);
procedure SMtr45Cn21(Name, Key: string);
procedure SMtr45Cn22(Name, Key: string);
procedure SMtr45Cn23(Name, Key: string);
procedure SMtr45Cn24(Name, Key: string);
procedure SMtr45Cn25(Name, Key: string);
procedure SMtr45Cn26(Name, Key: string);
procedure SMtr45Cn27(Name, Key: string);
procedure SMtr45Cn28(Name, Key: string);
procedure SMtr45Cn29(Name, Key: string);
procedure SMtr45Cn30(Name, Key: string);
procedure SMtr45Cn31(Name, Key: string);
procedure SMtr45Cn32(Name, Key: string);
procedure SMtr45Cn33(Name, Key: string);
procedure SMtr45Cn34(Name, Key: string);
procedure SMtr45Cn35(Name, Key: string);
procedure SMtr45Cn36(Name, Key: string);
procedure SMtr45Cn37(Name, Key: string);
procedure SMtr45Cn38(Name, Key: string);
procedure SMtr45Cn39(Name, Key: string);
procedure SMtr45Cn40(Name, Key: string);
procedure SMtr45Cn41(Name, Key: string);
procedure SMtr45Cn42(Name, Key: string);
procedure SMtr45Cn43(Name, Key: string);
procedure SMtr45Cn44(Name, Key: string);
procedure SMtr45Cn45(Name, Key: string);

implementation

uses PT5TaskMaker;

var a,a0 : array [0..10,0..10] of real;
    b,b0 : array [1..10,1..10] of integer;
    a1: array [1..15] of real;
    b1,b2: array [0..20] of integer;
    m,n,k,k1,k2,k3: integer;
    amax,amin,r,r1,r2 : real;
    Topic, Topic1, Topic2, Topic3, Topic4, Topic5, Author : string;

procedure inita(M,N : integer);
var i,j:integer;
  begin
  for i:=1 to M do
  for j:=1 to N do
    a[i,j] := RandomR2(0.1,9.9); //9.98 * Random; //2018
  end;

procedure ina(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,N,4,2),i+k,4);
  end;
end;


procedure ina3(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := RandomR2(-9.9,9.9); //19.98*Random-10; //2018
    dataR('',a[i,j],center(j,N,5,1),i+k,5);
  end;
end;


procedure ina1(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
    dataR('',a[i,j],center(j,N,4,2),i+k,4);
end;

procedure ina2(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
    dataR('',a[i,j],center(j,N,5,1),i+k,5);
end;

procedure inb(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    dataN('',b[i,j],center(j,N,2,4),i+k,2);
  end;
end;

procedure inaM(M: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,12,1,1);
for i := 1 to M do
  for j := 1 to M do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,M,4,2),i+k,4);
  end;
end;

procedure inaM1(M: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
dataN('M = ',m,12,1,1);
for i := 1 to M do
  for j := 1 to M do
  begin
    a[i,j] := RandomR2(0.1,9.9); //9.98*Random; //2018
    dataR('',a[i,j],center(j,M,5,1),i+k,5);
  end;
end;

procedure outa0(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,4,2),i+k,4);
end;

procedure outa03(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,5,1),i+k,5);
end;



procedure outa01(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultR('',a0[i,j],center(j,N,5,1),i+k,5);
end;

procedure outb0(M,N: integer);
var i,j,k:integer;
begin
k := 0;//1;
//if M = 5 then k := 0;
for i := 1 to M do
  for j := 1 to N do
    resultN('',b0[i,j],center(j,N,2,3),i+k,2);
end;


procedure SMtr45Cn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic1, Author, Key, 57{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('Given two positive integers~{M} and~{N},', 0, 2);
  TaskText('create and output an {M}\;\x\;{N} matrix of integers such that', 0, 3);
  TaskText('all its elements of the \Um{I}-th\um~row are equal to~10\*({I}~+~1) ({I}~=~0,\,\.,\,{M}\-1).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Given two positive integers~{M} and~{N},', 0, 2);
  TaskText('create and output an {M}\;\x\;{N} matrix of integers such that', 0, 3);
  TaskText('all its elements of the \Um{J}-th\um~column are equal to~5\*({J}~+~1) ({J}~=~0,\,\.,\,{N}\-1).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(7); //2 + Random(4);
  n := 3 + Random(7);
  dataN('M = ',m,xleft,3,1);
  dataN('N = ',n,xright,3,1);
  for i := 1 to m do
    for j := 1 to n do
      case v1 of
      1: b0[i,j] := 10*i;
      2: b0[i,j] := 5*j;
      end;
  outb0(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn2(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic1, Author, Key, 57{level});
  GetVariant(1, 4, 0, 0, v1, v2, v3);
case v1 of
  1: begin
  TaskText('Two positive integers~{M}, {N} and a\ sequence of {M}~real numbers are given.', 0, 2);
  TaskText('Create and output an {M}\;\x\;{N} matrix of real numbers such that each of', 0, 3);
  TaskText('its columns contains all numbers from the given sequence (in the same order).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('Two positive integers~{M}, {N} and a\ sequence of {M}~real numbers are given.', 0, 2);
  TaskText('Create and output an {M}\;\x\;{N} matrix of real numbers such that each of its rows', 0, 3);
  TaskText('contains all numbers from the given sequence (in the same order).', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('Two positive integers~{M} and {N}, a real number~{D}, and a\ sequence of {M}~real', 0, 1);
  TaskText('numbers are given. Create and output an {M}\;\x\;{N} matrix of real numbers', 0, 2);
  TaskText('such that its first column contains all numbers from the given sequence', 0, 3);
  TaskText('(in the same order), and elements of each next column are equal to the sum', 0, 4);
  TaskText('of the corresponding element of the previous column and the number~{D}', 0, 5);
  TaskText('(so each row of the matrix will be an \Iarithmetic sequence\i', 0, 0);
  TaskText('with the common difference~{D}).', 0, 0);
(*
*)
  end;
  4: begin
  TaskText('Two positive integers~{M} and {N}, a real number~{R}, and a\ sequence of {M}~real', 0, 1);
  TaskText('numbers are given. Create and output an {M}\;\x\;{N} matrix of real numbers', 0, 2);
  TaskText('such that its first row contains all numbers from the given sequence', 0, 3);
  TaskText('(in the same order), and elements of each next row are equal to the product', 0, 4);
  TaskText('of the corresponding element of the previous row and the number~{R}', 0, 5);
  TaskText('(so each column of the matrix will be a\ \Igeometric sequence\i', 0, 0);
  TaskText('with the common ratio~{R}).', 0, 0);
(*
*)
  end;
  end;
(*==*)
while true do
begin
  m := 3 + Random(7); //2 + Random(4);
  n := 3 + Random(7);
  for i := 1 to 10 do
    a1[i] := RandomR2(0.1,9.9); //9.98 * Random; //2018
  if v1 in [2,4] then k := n else k := m;
  case v1 of
  3: begin
    r := RandomR2(2,6); //2 + 4*Random;
  end;
  4: begin
    r := RandomR2(0.5,2); //0.5 + 1.5*Random;
  end;
  end;
  k1 := 0;
  for i := 1 to m do
    for j := 1 to n do
      begin
      case v1 of
      1: a0[i,j] := a1[i];
      2: a0[i,j] := a1[j];
      3: a0[i,j] := a1[i] + (j-1)*r;
      4: if i = 1 then a0[i,j] := a1[j]
                  else a0[i,j] := a0[i-1,j]*r;
      end;
      if (a0[i,j]<0.1) or (a0[i,j]>99) then
          k1 := 1;
      end;
  if k1 = 0 then break;
  end;
  dataN('M = ',m,xleft,2,1);
  dataN('N = ',n,xright,2,1);
  case v1 of
  3: begin
    dataR('D = ',r,0,3,4);
  end;
  4: begin
    dataR('R = ',r,0,3,4);
  end;
  end;
  for i := 1 to k do
    dataR('',a1[i],center(i,k,5,1),4,5);
  outa01(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn3(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});(*DEMO*)
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Output elements of the matrix row with the index~{K}.', 0, 4);
(*
*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
    k := 1+Random(m);
  dataN('K = ',k-1,68,m,1);
   for j := 1 to n do
     resultR('',a[k,j],center(j,n,4,2),3,4);
  SetNumberOfTests(5);
  Pause;
end;

procedure SMtr45Cn4(Name, Key: string);
var
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Output elements of the matrix column with the index~{K}.', 0, 4);
(*
*)
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
    k := 1+Random(n);
  dataN('K = ',k-1,68,m,1);
    for i := 1 to m do
       resultR('',a[i,k],center(i,m,4,2),3,4);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Output elements of its rows', 0, 2);
  TaskText('with odd indices (1, 3,~\.). An output of matrix elements', 0, 3);
  TaskText('must be performed in the order of rows. Do not use conditional statements.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Output elements of its columns', 0, 2);
  TaskText('with even indices (0, 2,~\.). An output of matrix elements', 0, 3);
  TaskText('must be performed in the order of columns. Do not use conditional statements.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
  case v1 of
  1: begin
     if m < 4 then k := 2 else k := 1;
     for i := 1 to m div 2 do
       for j := 1 to n do
         resultR('',a[2*i,j], center(j,n,4,2),i+k,4);
     end;
  2: for j := 1 to (n+1) div 2 do
       for i := 1 to m do
         resultR('',a[i,2*j-1], center(i,m,4,2),j+1,4);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn6(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Output elements of the matrix', 0, 2);
  TaskText('in the following order: the first row from left to right,', 0, 3);
  TaskText('the second row from right to left, the third row from left to right,', 0, 4);
  TaskText('the fourth row from right to left, and so on.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Output elements of the matrix', 0, 2);
  TaskText('in the following order: the first column from up to down,', 0, 3);
  TaskText('the second column from down to up, the third column from up to down,', 0, 4);
  TaskText('the fourth column from down to up, and so on.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 4 + Random(5); //2 + Random(4);
  n := 4 + Random(5);
  ina(M,N);
  case v1 of
  1: begin
     for i := 1 to m do
     begin
       if Odd(i) then
       for j := 1 to n do
         resultR('',a[i,j], center(j,n,4,2),i,4)
       else
       for j := 1 to n do
         resultR('',a[i,n-j+1], center(j,n,4,2),i,4);
     end;
     end;
  2: begin
     for j := 1 to n do
     begin
       if Odd(j) then
       for i := 1 to m do
         resultR('',a[i,j], center(i,m,4,2),j,4)
       else
       for i := 1 to m do
         resultR('',a[m-i+1,j], center(i,m,4,2),j,4);
     end;
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn7(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('A real-valued square matrix~{A} of order~{M} is given. Starting with the element', 0, 1);
  TaskText('{A}_{0,0}, output its elements as follows: all elements of the first row,', 0, 2);
  TaskText('all elements of the column {M}\-1 except the element {A}_{0,M\-1}', 0, 3);
  TaskText('(which is already output), all remaining elements of the second row,', 0, 4);
  TaskText('all remaining elements of the column {M}\-2, and so on; the element', 0, 5);
  TaskText('{A}_{M\-1,0} must be output in the end. All rows must be output from left to right,', 0, 0);
  TaskText('all columns must be output from up to down.', 0, 0);
(*
*)
  end;
  2: begin
  TaskText('A real-valued square matrix~{A} of order~{M} is given. Starting with the element', 0, 1);
  TaskText('{A}_{0,0}, output its elements as follows: all elements of the first column,', 0, 2);
  TaskText('all elements of the row {M}\-1 except the element {A}_{M\-1,0}', 0, 3);
  TaskText('(which is already output), all remaining elements of the second column,', 0, 4);
  TaskText('all remaining elements of the row {M}\-2, and so on; the element', 0, 5);
  TaskText('{A}_{0,M\-1} must be output in the end. All rows must be output from left to right,', 0, 0);
  TaskText('all columns must be output from up to down.', 0, 0);
(*
*)
  end;
  end;
(*==*)
  m := 3+Random(5);
  inaM(m);
//  if m = 5 then k := 0 else k := 1;
  k := 0;
  case v1 of
  1: for k1 := 1 to m do
     begin
       for j := 1 to m-k1+1 do
         resultR('',a[k1,j], center(j,2*m,4,1),k1+k,4);
       for i := k1+1 to m do
         resultR('',a[i,m-k1+1], center(i+m,2*m,4,1),k1+k,4);
     end;
  2: for k1 := 1 to m do
     begin
       for i := 1 to m-k1+1 do
         resultR('',a[i,k1], center(i,2*m,4,1),k1+k,4);
       for j := k1+1 to m do
         resultR('',a[m-k1+1,j], center(j+m,2*m,4,1),k1+k,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn8(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1: integer;
begin
  Start(Name, Topic2, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('A real-valued square matrix~{A} of order~{M} is given ({M}~is an odd number).', 0, 1);
  TaskText('Starting with the element {A}_{0,0} and moving clockwise, output', 0, 2);
  TaskText('all matrix elements \Iin the spiral order\i: the first row from left to right,', 0, 3);
  TaskText('the last column from up to down, the last row from right to left,', 0, 4);
  TaskText('the first column from down to up, all remaining elements of the second row', 0, 5);
  TaskText('(from left to right), and so on; the central element of the matrix', 0, 0);
  TaskText('must be output in the end.', 0, 0);
(*
*)
  end;
  2: begin
  TaskText('A real-valued square matrix~{A} of order~{M} is given ({M}~is an odd number).', 0, 1);
  TaskText('Starting with the element {A}_{1,1} and moving counter-clockwise, output', 0, 2);
  TaskText('all matrix elements \Iin the spiral order\i: the first column from up to down,', 0, 3);
  TaskText('the last row from left to right, the last column from down to up,', 0, 4);
  TaskText('the first row from right to left, all remaining elements of the second column', 0, 5);
  TaskText('(from up to down), and so on; the central element of the matrix', 0, 0);
  TaskText('must be output in the end.', 0, 0);
(*
*)
  end;
  end;
(*==*)
  m := 2*(Random(3)+1)+1;
  inaM(m);
//  if m = 5 then k := 0 else k := 1;
  k := 0;
  case v1 of
  1: begin
     for k1 := 1 to (m-1) div 2 do
     begin
       for j := k1 to m-k1+1 do
         resultR('',a[k1,j], center(j,2*m,4,1),2*k1-1+k,4);
       for i := k1+1 to m-k1+1 do
         resultR('',a[i,m-k1+1], center(i+m,2*m,4,1),2*k1-1+k,4);
       for j := k1+1 to m-k1+1 do
         resultR('',a[m-k1+1,m-j+1], center(j,2*m,4,1),2*k1+k,4);
       for i := k1+1 to m-k1 do
         resultR('',a[m-i+1,k1], center(i+m,2*m,4,1),2*k1+k,4);
     end;
     k1 := (m+1) div 2;
     resultR('',a[k1,k1], center(k1,2*m,4,1),2*k1-1+k,4);
     end;
  2: begin
     for k1 := 1 to (m-1) div 2 do
     begin
       for i := k1 to m-k1+1 do
         resultR('',a[i,k1], center(i,2*m,4,1),2*k1-1+k,4);
       for j := k1+1 to m-k1+1 do
         resultR('',a[m-k1+1,j], center(j+m,2*m,4,1),2*k1-1+k,4);
       for i := k1+1 to m-k1+1 do
         resultR('',a[m-i+1,m-k1+1], center(i,2*m,4,1),2*k1+k,4);
       for j := k1+1 to m-k1 do
         resultR('',a[k1,m-j+1], center(j+m,2*m,4,1),2*k1+k,4);
     end;
     k1 := (m+1) div 2;
     resultR('',a[k1,k1], center(k1,2*m,4,1),2*k1-1+k,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SMtr45Cn10(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Find the sum and the product of elements of the matrix row', 0, 3);
  TaskText('with the index~{K}.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Find the sum and the product of elements of the matrix column', 0, 3);
  TaskText('with the index~{K}.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  r1 := 0;
  r2 := 1;
  case v1 of
  1: for j := 1 to n do
     begin
       r1 := r1 + a[k,j];
       r2 := r2 * a[k,j];
     end;
  2: for i := 1 to m do
     begin
       r1 := r1 + a[i,k];
       r2 := r2 * a[i,k];
     end;
  end;
  resultR('Sum: ',r1,xLeft,3,5);
  resultR('Product: ',r2,xRight,3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn11(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the sum of elements for each matrix row.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the product of elements for each matrix column.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(4); //2 + Random(4);
  n := 3 + Random(5);
  ina(M,N);
  case v1 of
  1: for i := 1 to m do
     begin
     r1 := 0;
     for j := 1 to n do
       r1 := r1 + a[i,j];
     resultR('',r1,center(i,m,5,2),3,5);
     end;
  2: for j := 1 to n do
     begin
     r2 := 1;
     for i := 1 to m do
       r2 := r2 * a[i,j];
     resultR('',r2,center(j,n,10,1),3,10);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn12(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the average of elements for each matrix row', 0, 3);
  TaskText('with the even index (0, 2,~\.). Do not use conditional statements.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the sum of elements for each matrix column', 0, 3);
  TaskText('with the odd index (1, 3,~\.). Do not use conditional statements.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: for i := 1 to (m+1) div 2 do
     begin
     r1 := 0;
     for j := 1 to n do
       r1 := r1 + a[2*i-1,j];
     resultR('',r1/n,center(i,(m+1) div 2,4,2),3,4);
     end;
  2: for j := 1 to n div 2 do
     begin
     r2 := 0;
     for i := 1 to m do
       r2 := r2 + a[i,2*j];
     resultR('',r2,center(j,n div 2,5,2),3,5);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn13(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the minimal element for each matrix row.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
   for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       if a[i,j] < r1 then r1 := a[i,j];
     resultR('',r1,center(i,m,4,2),3,4);
     end;
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45Cn14(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the maximal element for each matrix column.', 0, 4);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
   for j := 1 to n do
     begin
     r2 := a[1,j];
     for i := 2 to m do
       if a[i,j] > r2 then r2 := a[i,j];
     resultR('',r2,center(j,n,4,2),3,4);
     end;
  SetNumberOfTests(5);
  Pause;
end;



procedure SMtr45Cn15(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Find the index', 0, 2);
  TaskText('of the matrix row with the maximal sum of elements.', 0, 3);
  TaskText('Output this index and the maximal sum value.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Find the index', 0, 2);
  TaskText('of the matrix column with the minimal product of elements.', 0, 3);
  TaskText('Output this index and the minimal product value.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     r2 := -10000;
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       r1 := r1 + a[i,j];
     if r1 > r2 then
       begin
         r2 := r1;
         k := i;
       end;
     end;
     resultN('Row index: ',k-1,xLeft,3,1);
     resultR('Maximal sum: ',r2,xRight,3,4);
     end;
  2: begin
     r2 := 10000000000.0;
     for j := 1 to n do
     begin
     r1 := a[1,j];
     for i := 2 to m do
       r1 := r1 * a[i,j];
     if r1 < r2 then
       begin
         r2 := r1;
         k := j;
       end;
     end;
     resultN('Column index: ',k-1,xLeft,3,1);
     resultR('Minimal product: ',r2,xRight,3,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn16(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the maximal value among the minimal elements of matrix rows.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the minimal value among the maximal elements of matrix columns.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     amax := -1000;
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       if a[i,j] < r1 then r1 := a[i,j];
     if r1 > amax then amax := r1;
     end;
     resultR('',amax,0,3,4);
     end;
  2: begin
     amin := 1000;
     for j := 1 to n do
     begin
     r2 := a[1,j];
     for i := 2 to m do
       if a[i,j] > r2 then r2 := a[i,j];
     if r2 < amin then amin := r2;
     end;
     resultR('',amin,0,3,4);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn17(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('For each matrix row find the amount of elements', 0, 3);
  TaskText('that are smaller than the average of all elements of this row.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('For each matrix column find the amount of elements', 0, 3);
  TaskText('that are greater than the average of all elements of this column.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     for i := 1 to m do
     begin
     r1 := a[i,1];
     for j := 2 to n do
       r1 := r1 + a[i,j];
     r1 := r1/n;
     k := 0;
     for j := 1 to n do
       if a[i,j] < r1  then inc(k);
     resultN('',k,center(i,m,1,5),3,1);
     end;
     end;
  2: begin
     for j := 1 to n do
     begin
     r1 := a[1,j];
     for i := 2 to m do
       r1 := r1 + a[i,j];
     r1 := r1/m;
     k := 0;
     for i := 1 to m do
       if a[i,j] > r1  then inc(k);
     resultN('',k,center(j,n,1,5),3,1);
     end;
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr45Cn18(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find indices of row and column for an element', 0, 3);
  TaskText('whose value is the closest to the average of all matrix elements.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  r := 0;
  for i := 1 to m do
    for j := 1 to n do
      r := r + a[i,j];
  r := r / (m*n);
  amin := 1000;
  for i := 1 to m do
    for j := 1 to n do
      if abs(a[i,j]-r) < amin then
        begin
          amin := abs(a[i,j]-r);
          k1 := i;
          k2 := j;
        end;
  resultN('Row index: ',k1-1,xLeft,3,1);
  resultN('Column index: ',k2-1,xRight,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn19(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the index of the first matrix row that contains the equal amount', 0, 3);
  TaskText('of positive and negative elements (zero elements are not considered).', 0, 4);
  TaskText('If the matrix does not contain the required rows, then output~\-1.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the index of the last matrix column that contains the equal amount', 0, 3);
  TaskText('of positive and negative elements (zero elements are not considered).', 0, 4);
  TaskText('If the matrix does not contain the required columns, then output~\-1.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  case Random(5) of
  0: for i:=1 to m do
       for j:=1 to n do
         case Random(3) of
         0..1: b[i,j] := Random(10);
         2: b[i,j] := 0;
         end;
  1..4:
     for i:=1 to m do
       for j:=1 to n do
         case Random(3) of
         0..1: b[i,j] := 9 - integer(Random(19));
         2: b[i,j] := 0;
         end;
   end;
  inb(m,n);
  k := 0;
   case v1 of
   1:
   begin
     for i := 1 to m do
     begin
       k1 := 0;
       for j := 1 to n do
         if b[i,j]>0 then inc(k1)
         else if b[i,j]<0 then dec(k1);
       if k1 = 0 then
       begin
         k := i;
         break;
       end;
     end;
   end;
   2:
   begin
     for j := n downto 1 do
     begin
       k1 := 0;
       for i := 1 to m do
         if b[i,j]>0 then inc(k1)
         else if b[i,j]<0 then dec(k1);
       if k1 = 0 then
       begin
         k := j;
         break;
       end;
     end;
   end;
  end;
  resultN('',k-1,0,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn20(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given. Find the index', 0, 2);
  TaskText('of the last matrix row that contains even numbers only.', 0, 3);
  TaskText('If the matrix does not contain the required rows, then output~\-1.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given. Find the index', 0, 2);
  TaskText('of the first matrix column that contains odd numbers only.', 0, 3);
  TaskText('If the matrix does not contain the required columns, then output~\-1.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  case Random(5) of
  0: for i:=1 to m do
       for j:=1 to n do
         b[i,j] := 10 + Random(90);
  1..4:
     case v1 of
     1: for i:=1 to m do
       case Random(2) of
       0: for j:=1 to n do
               b[i,j] := 10 + Random(90);
       1: for j:=1 to n do
               b[i,j] := 10 + 2*Random(45);
       end;
     2: for j:=1 to n do
       case Random(2) of
       0: for i:=1 to m do
               b[i,j] := 10 + Random(90);
       1: for i:=1 to m do
               b[i,j] := 11 + 2*Random(45);
       end;
     end;
   end;
  inb(m,n);
  k := 0;
   case v1 of
   1:
   begin
     for i := m downto 1 do
     begin
       k1 := 0;
       for j := 1 to n do
         if not Odd(b[i,j]) then inc(k1);
       if k1 = n then
       begin
         k := i;
         break;
       end;
     end;
   end;
   2:
   begin
     for j := 1 to n do
     begin
       k1 := 0;
       for i := 1 to m do
         if Odd(b[i,j]) then inc(k1);
       if k1 = m then
       begin
         k := j;
         break;
       end;
     end;
   end;
  end;
  resultN('',k-1,0,3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn21(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  set1,set2: set of 0..10;
begin
  Start(Name, Topic3, Author, Key, 57{level});(*DEMO*)
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of integers is given, values of its elements are', 0, 1);
  TaskText('in the range~0 to~100. A matrix row is called the \Isimilar\i', 0, 2);
  TaskText('with the other row if these rows contain the same set of numbers.', 0, 3);
  TaskText('For example, rows (1,~3, 3,~2) and (2,~2, 1,~3) contain the same set', 0, 4);
  TaskText('\{1, 2,~3\} and therefore they are the similar rows. Find the amount', 0, 5);
  TaskText('of matrix rows that are the similar with the first row.', 0, 0);
(*
*)
      m := 3 + Random(6); //2 + Random(4);
      n := 2 + Random(3);
  k := Random(6);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(3);
  inb(m,n);
  k := 0;
     set1 := [b[1,1]];
     for j := 2 to n do
       set1 := set1 + [b[1,j]];
     for i := 2 to m do
     begin
       set2 := [b[i,1]];
       for j := 2 to n do
         set2 := set2 + [b[i,j]];
       if set1 = set2 then inc(k);
     end;
  resultN('',k,0,3,1);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45Cn22(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  set1,set2: set of 0..10;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given, values of its elements are', 0, 1);
  TaskText('in the range~0 to~100. A matrix column is called the \Isimilar\i', 0, 2);
  TaskText('with the other column if these columns contain the same set of numbers.', 0, 3);
  TaskText('For example, columns (1,~3, 3,~2) and (2,~2, 1,~3) contain the same set', 0, 4);
  TaskText('\{1, 2,~3\} and therefore they are the similar columns. Find the amount', 0, 5);
  TaskText('of matrix columns that are the similar with the last column.', 0, 0);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the amount of its rows that contain no elements with equal values.', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the amount of its columns that contain no elements with equal values.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin
      m := 2 + Random(3);
      n := 5 + Random(4);
  k := Random(6);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(3);
  inb(m,n);
  k := 0;
     set1 := [b[1,n]];
     for i := 2 to m do
       set1 := set1 + [b[i,n]];
     for j := 1 to n-1 do
     begin
       set2 := [b[1,j]];
       for i := 2 to m do
         set2 := set2 + [b[i,j]];
       if set1 = set2 then inc(k);
     end;
  resultN('',k,0,3,1);

end;
2,3: begin
  case v1 of
  2: begin
      m := 5 + Random(4); //2 + Random(4);
      n := 2 + Random(3);
     end;
  3: begin
      m := 2 + Random(3);
      n := 5 + Random(4);
     end;
  end;
  k := Random(3);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(6);
  inb(m,n);
  k := 0;
   case v1 of
   2:
     for i := 1 to m do
     begin
     k1 := 1;
     set1 := [b[i,1]];
     for j := 2 to n do
       if b[i,j] in set1 then k1 := 0
       else set1 := set1 + [b[i,j]];
     k := k + k1;
     end;
   3:
     for j := 1 to n do
     begin
     k1 := 1;
     set1 := [b[1,j]];
     for i := 2 to m do
       if b[i,j] in set1 then k1 := 0
       else set1 := set1 + [b[i,j]];
     k := k + k1;
     end;
  end;
  resultN('',k,0,3,1);
end;
end;
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45Cn23(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the index of the last row that contains', 0, 3);
  TaskText('the maximal amount of elements with equal values.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of integers is given.', 0, 2);
  TaskText('Find the index of the first column that contains', 0, 3);
  TaskText('the maximal amount of elements with equal values.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  case v1 of
  1: begin
      m := 5 + Random(4);
      n := 2 + Random(6);
     end;
  2: begin
      m := 2 + Random(6); //2 + Random(4);
      n := 5 + Random(4);
     end;
  end;
  k := Random(5);
  for i:=1 to m do
    for j:=1 to n do
      b[i,j] := k + Random(4);
  inb(m,n);
   case v1 of
  1:
    begin
      for i:=1 to m do
      begin
        for j := 0 to 10 do
          b1[j] := 0;
        for j := 1 to n do
          Inc(b1[b[i,j]]);
        b2[i] := 0;
        for j := 0 to 10 do
          if b2[i]<b1[j] then b2[i] := b1[j];
      end;
      k := b2[1];
      k1 := 1;
      for i := 2 to m do
        if k <= b2[i] then
          begin k := b2[i]; k1 := i; end;
    end;
  2:
    begin
      for j:=1 to n do
      begin
        for i := 0 to 10 do
          b1[i] := 0;
        for i := 1 to m do
          Inc(b1[b[i,j]]);
        b2[j] := 0;
        for i := 0 to 10 do
          if b2[j]<b1[i] then b2[j] := b1[i];
      end;
      k := b2[1];
      k1 := 1;
      for j := 2 to n do
        if k < b2[j] then
          begin k := b2[j]; k1 := j; end;
    end;
  end;
  resultN('',k1-1,0,3,1);
  SetNumberOfTests(9);
Pause;
end;

procedure sorta(m,n,v1,nom,d: integer);
var i,j,k: integer;
    x: real;
begin
case v1 of
1: for k := 1 to n-1 do
    for j := 1 to n-k do
      if a[nom,j]*d < a[nom,j+1]*d then
        begin
        x := a[nom,j];
        a[nom,j] := a[nom,j+1];
        a[nom,j+1] := x;
        end;
2: for k := 1 to m-1 do
    for i := 1 to m-k do
      if a[i,nom]*d < a[i+1,nom]*d then
        begin
        x := a[i,nom];
        a[i,nom] := a[i+1,nom];
        a[i+1,nom] := x;
        end;
end;
end;

procedure SMtr45Cn24(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the amount of its rows whose values of elements', 0, 3);
  TaskText('are sorted in ascending order.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Find the amount of its columns whose values of elements', 0, 3);
  TaskText('are sorted in descending order.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  inita(M,N);
  case v1 of
  1: for i := 1 to m do
       case Random(3) of
       0: sorta(m,n,v1,i,1);
       1: sorta(m,n,v1,i,-1);
       end;
  2: for j := 1 to n do
       case Random(3) of
       0: sorta(m,n,v1,j,1);
       1: sorta(m,n,v1,j,-1);
       end;
  end;
  ina1(m,n);
  k := 0;
  case v1 of
  1: for i := 1 to m do
     begin
     k1 := 1;
     for j := 2 to n do
       if a[i,j-1] >= a[i,j] then k1 := 0;
     k := k + k1;
     end;
  2: for j := 1 to n do
     begin
     k1 := 1;
     for i := 2 to m do
       if a[i-1,j] <= a[i,j] then k1 := 0;
     k := k + k1;
     end;
  end;
  resultN('',k,0,3,1);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45Cn25(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  r := 1000;
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Find minimal element', 0, 2);
  TaskText('among elements of all matrix rows whose values of elements are sorted', 0, 3);
  TaskText('in ascending or descending order. If the matrix does not contain', 0, 4);
  TaskText('the required rows, then output~0 (as a\ real number).', 0, 5);
(*
*)
  end;
  2: begin
  r := -1000;
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6); //2 + Random(4);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Find maximal element', 0, 2);
  TaskText('among elements of all matrix columns whose values of elements are sorted', 0, 3);
  TaskText('in ascending or descending order. If the matrix does not contain', 0, 4);
  TaskText('the required columns, then output~0 (as a\ real number).', 0, 5);
(*
*)
  end;
  end;
(*==*)
  inita(M,N);
  case v1 of
  1: for i := 1 to m do
       case Random(6) of
       0: sorta(m,n,v1,i,1);
       1: sorta(m,n,v1,i,-1);
       end;
  2: for j := 1 to n do
       case Random(6) of
       0: sorta(m,n,v1,j,1);
       1: sorta(m,n,v1,j,-1);
       end;
  end;
  ina1(m,n);
  case v1 of
  1: for i := 1 to m do
     begin
       k1 := 1;
       for j := 2 to n-1 do
         if (a[i,j]-a[i,j-1])*(a[i,j]-a[i,j+1]) >= 0 then k1 := 0;
       if k1 = 1 then
       begin
         r1 := a[i,1];
         if a[i,n] < r1 then r1 := a[i,n];
         if r > r1 then begin r := r1; k := i; end;
       end;
     end;
  2: for j := 1 to n do
     begin
       k1 := 1;
       for i := 2 to m-1 do
         if (a[i,j]-a[i-1,j])*(a[i,j]-a[i+1,j]) >= 0 then k1 := 0;
       if k1 = 1 then
       begin
         r1 := a[1,j];
         if a[m,j] > r1 then r1 := a[m,j];
         if r < r1 then begin r := r1; k := j; end;
       end;
     end;
  end;
  if abs(r) = 1000  then begin r := 0; k := 0; end;
  resultR('',r,0,3,4);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45Cn26(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k: integer;
begin
  Start(Name, Topic3, Author, Key, 57{level});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of integers is given. Find the matrix element', 0, 2);
  TaskText('that is the maximum in its row and the minimum in its column.', 0, 3);
  TaskText('If the matrix does not contain such an element, then output~0.', 0, 4);
(*
ƒÎˇ Í‡Ê‰ÓÈ ÒÚÓÍË Ì‡ıÓ‰ËÚÂ Ï‡ÍÒËÏ‡Î¸Ì˚Â ˝ÎÂÏÂÌÚ˚ Ë\ ÌÓÏÂ‡ Ëı\ ÒÚÓÎ·ˆÓ‚,
ÔÓÒÎÂ ˜Â„Ó ÔÓ‚ÂˇÈÚÂ ˝ÚË\ ˝ÎÂÏÂÌÚ˚ Ì‡\ ÏËÌËÏ‡Î¸ÌÓÒÚ¸ ‚\ ‰‡ÌÌ˚ı ÒÚÓÎ·ˆ‡ı.
«‡ÏÂÚËÏ, ˜ÚÓ\ Á‡‰‡ÌËÂ ÒÙÓÏÛÎËÓ‚‡ÌÓ ÍÓÂÍÚÌÓ ‰‡ÊÂ ‚\ ÚÓÏ\ ÒÎÛ˜‡Â,
ÍÓ„‰‡ Ï‡ÚËˆ‡ ÒÓ‰ÂÊËÚ ÌÂÒÍÓÎ¸ÍÓ ˝ÎÂÏÂÌÚÓ‚, Û‰Ó‚ÎÂÚ‚Óˇ˛˘Ëı ÛÍ‡Á‡ÌÌ˚Ï
ÛÒÎÓ‚ËˇÏ, ÔÓÒÍÓÎ¸ÍÛ ÌÂÚÛ‰ÌÓ ‰ÓÍ‡Á‡Ú¸, ˜ÚÓ ‚\ ˝ÚÓÏ ÒÎÛ˜‡Â ‚ÒÂ\ ÓÌË \I‡‚Ì˚
ÏÂÊ‰Û ÒÓ·ÓÈ\i.
*)
(*==*)
  m := 2 + Random(3);
  n := 2 + Random(3);
  for i:=1 to M do
  for j:=1 to N do
    b[i,j] := Random(9)+1;
  inb(m,n);
  for i:=1 to m do
    begin
      b1[i] := b[i,1];
      for j:=2 to n do
        if b1[i]<b[i,j] then
          b1[i] := b[i,j];
    end;
  k2 := 0;
  for k:=1 to m do
    begin
      if k2 <> 0 then break;
      for j := 1 to n do
        if b[k,j]=b1[k] then
        begin
          k1 := 0;
          for i := 1 to m do
            begin
              if b[i,j]<b1[k] then break;
              inc(k1);
            end;
          if k1=m then
            begin
              k2 := b1[k];
              break;
            end;
        end;
    end;
  resultN('',k2,0,3,2);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45Cn27(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SMtr45Cn28(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and two integers~{K}_1, {K}_2 are given', 0, 2);
  TaskText('(0~\l~{K}_1~<~{K}_2~\l~{M}\-1). Swap matrix rows with the indices~{K}_1 and~{K}_2.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and two integers~{K}_1, {K}_2 are given', 0, 2);
  TaskText('(0~\l~{K}_1~<~{K}_2~\l~{N}\-1). Swap matrix columns with the indices~{K}_1 and~{K}_2.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6);
  n := 3 + Random(6);
  repeat
  case v1 of
  1: begin k1 := 1 + Random(m); k2 := 1 + Random(m); end;
  2: begin k1 := 1 + Random(n); k2 := 1 + Random(n); end;
  end
  until k1 < k2;
  ina(M,N);
  dataN('K_1 = ',k1-1,65,m,1);
  dataN('K_2 = ',k2-1,72,m,1);
  a0 := a;
  case v1 of
  1: for j := 1 to n do
     begin
     r := a0[k1,j];
     a0[k1,j] := a0[k2,j];
     a0[k2,j] := r;
     end;
  2: for i := 1 to m do
     begin
     r := a0[i,k1];
     a0[i,k1] := a0[i,k2];
     a0[i,k2] := r;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;



procedure SMtr45Cn29(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('For each matrix row, swap its minimal and maximal element.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('For each matrix column, swap its minimal and maximal element.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m do
     begin
     amin := 1000; amax := -1000;
     for j := 1 to n do
     begin
       if a0[i,j] < amin then begin amin := a0[i,j]; k1 := j; end;
       if a0[i,j] > amax then begin amax := a0[i,j]; k2 := j; end;
     end;
     a0[i,k1] := amax;
     a0[i,k2] := amin;
     end;
  2: for j := 1 to n do
     begin
     amin := 1000; amax := -1000;
     for i := 1 to m do
     begin
       if a0[i,j] < amin then begin amin := a0[i,j]; k1 := i; end;
       if a0[i,j] > amax then begin amax := a0[i,j]; k2 := i; end;
     end;
     a0[k1,j] := amax;
     a0[k2,j] := amin;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45Cn30(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
  imin, imax, jmin, jmax: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Swap matrix rows', 0, 2);
  TaskText('containing the minimal and the maximal element of the matrix.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Swap matrix columns', 0, 2);
  TaskText('containing the minimal and the maximal element of the matrix.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  amin := 1000;
  amax := -1000;
  for i := 1 to m do
    for j := 1 to n do
    begin
      if a[i,j] < amin then
        begin
          amin := a[i,j]; imin := i; jmin := j;
        end;
      if a[i,j] > amax then
        begin
          amax := a[i,j]; imax := i; jmax := j;
        end;
    end;
  a0 := a;
  case v1 of
  1: for j := 1 to n do
     begin
     r := a0[imin,j];
     a0[imin,j] := a0[imax,j];
     a0[imax,j] := r;
     end;
  2: for i := 1 to m do
     begin
     r := a0[i,jmin];
     a0[i,jmin] := a0[i,jmax];
     a0[i,jmax] := r;
     end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45Cn31(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Swap the column with', 0, 2);
  TaskText('the index~0 and the last column that contains positive numbers only.', 0, 3);
  TaskText('If the matrix does not contain the required columns, then do not change it.', 0, 4);
(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
  for j := n downto 1 do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
if k1<>0 then
for i:=1 to m do
  begin
    r1 := a0[i,k1];
    a0[i,k1] := a0[i,1];
    a0[i,1] := r1;
  end;
  ina2(m,n);
  outa01(m,n);
  SetNumberOfTests(8);
  Pause;
end;




procedure SMtr45Cn32(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Swap the column with', 0, 2);
  TaskText('the index~{N}\-1 and the first column that contains negative numbers only.', 0, 3);
  TaskText('If the matrix does not contain the required columns, then do not change it.', 0, 4);
(*
*)
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
for j := 1 to n do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
  for i := 1 to m do
    for j := 1 to n do
      begin
        a[i,j] := -a[i,j];
        a0[i,j] := -a0[i,j];
      end;
if k1<>0 then
for i:=1 to m do
  begin
    r1 := a0[i,k1];
    a0[i,k1] := a0[i,n];
    a0[i,n] := r1;
  end;
  ina2(m,n);
  outa01(m,n);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45Cn33(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 2 + 2*Random(4);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given ({M}~is an even number).', 0, 2);
  TaskText('Swap the upper and lower half of the matrix.', 0, 4);
(*
*)
  end;
  2: begin
  m := 2 + Random(4);
  n := 4 + 2*Random(3);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given ({N}~is an even number).', 0, 2);
  TaskText('Swap the left and right half of the matrix.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i+m div 2,j];
           a0[i+m div 2,j] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i,j+n div 2];
           a0[i,j+n div 2] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45Cn34(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given ({M} and~{N} are even numbers).', 0, 2);
  TaskText('Swap the upper left and lower right quarter of the matrix.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given ({M} and~{N} are even numbers).', 0, 2);
  TaskText('Swap the upper right and lower left quarter of the matrix.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 2 + 2*Random(4);
  n := 2 + 2*Random(4);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n div 2 do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i+m div 2,j+n div 2];
           a0[i+m div 2,j+n div 2] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m div 2 do
         begin
           r1 := a0[i+m div 2,j];
           a0[i+m div 2,j] := a0[i,j+n div 2];
           a0[i,j+n div 2] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;




procedure SMtr45Cn35(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Reflect its elements', 0, 2);
  TaskText('about the horizontal axis of symmetry of the matrix (that is, swap', 0, 3);
  TaskText('matrix rows with the indices~{0} and~{M}\-1, 1 and~{M}\-2, and so\ on).', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Reflect its elements', 0, 2);
  TaskText('about the vertical axis of symmetry of the matrix (that is, swap', 0, 3);
  TaskText('matrix columns with the indices~{0} and~{N}\-1, 1 and~{N}\-2, and so\ on).', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m div 2 do
       for j := 1 to n do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[m-i+1,j];
           a0[m-i+1,j] := r1;
         end;
  2: for j := 1 to n div 2 do
       for i := 1 to m do
         begin
           r1 := a0[i,j];
           a0[i,j] := a0[i,n-j+1];
           a0[i,n-j+1] := r1;
         end;
  end;
  outa0(m,n);
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn36(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Remove the matrix row with the index~{K}.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Remove the matrix column with the index~{K}.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  a0 := a;
  case v1 of
  1: begin
     for i := k+1 to m do
       for j := 1 to n do
          a0[i-1,j] := a0[i,j];
     outa0(m-1,n);
     end;
  2: begin
     for j := k+1 to n do
       for i := 1 to m do
           a0[i,j-1] := a0[i,j];
     outa0(m,n-1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn37(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(8, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Remove the matrix row that contains the minimal matrix element.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Remove the matrix column that contains the maximal matrix element.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  case v1 of
  1: begin
     amin := 1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] < amin then
           begin
             amin := a[i,j];
             k := i;
           end;
     end;
  2: begin
     amax := -1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] > amax then
           begin
             amax := a[i,j];
             k := j;
           end;
     end;
  end;
  a0 := a;
  case v1 of
  1: begin
     for i := k+1 to m do
       for j := 1 to n do
          a0[i-1,j] := a0[i,j];
     outa0(m-1,n);
     end;
  2: begin
     for j := k+1 to n do
       for i := 1 to m do
           a0[i,j-1] := a0[i,j];
     outa0(m,n-1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn38(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k: integer;
  k3: array [1..10] of integer;
  n3: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(9, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Remove its first column', 0, 2);
  TaskText('that contains positive numbers only. If the matrix does not contain', 0, 3);
  TaskText('the required columns, then do not change it.', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Remove its last column', 0, 2);
  TaskText('that contains negative numbers only. If the matrix does not contain', 0, 3);
  TaskText('the required columns, then do not change it.', 0, 4);
(*
*)
  end;
  3: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. The matrix contains', 0, 2);
  TaskText('both positive and negative numbers. Remove all matrix columns', 0, 3);
  TaskText('that contain positive numbers only. If the matrix does not contain', 0, 4);
  TaskText('the required columns, then do not change it.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  repeat
  k := 0;
  for i:=1 to m do
    for j:=1 to n do
    begin
      a[i,j] := (10 * Random)-2;
      if a[i,j]<0 then inc(k);
    end;
  until (k>0)and(k<m*n);
  a0 := a;
  n3 := 0;
  for j := 1 to n do
  begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
    begin
      inc(n3);
      k3[n3] := j;
    end;
  end;
k2 := n;
if v1 = 2 then
   for i := 1 to m do
     for j := 1 to n do
       begin
         a[i,j] := -a[i,j];
         a0[i,j] := -a0[i,j];
       end;
if n3<>0 then
case v1 of
1: begin
   for j := k3[1]+1 to n do
     for i := 1 to m do
        a0[i,j-1] := a0[i,j];
   k2 := n-1;
   end;
2: begin
   for j := k3[n3]+1 to n do
     for i := 1 to m do
        a0[i,j-1] := a0[i,j];
   k2 := n-1;
   end;
3: begin
   for k := n3 downto 1 do
     for j := k3[k]+1 to n do
       for i := 1 to m do
         a0[i,j-1] := a0[i,j];
   k2 := n-n3;
   end;
end;
  ina2(m,n);
  outa01(m,k2);
  SetNumberOfTests(8);
Pause;
end;

procedure SMtr45Cn39(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 3 + Random(6);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{M}\-1).', 0, 2);
  TaskText('Insert a new row of elements with zero value', 0, 3);
  TaskText('before the matrix row with the index~{K}.', 0, 4);
(*
*)
  end;
  2: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers and an integer~{K} are given (0~\l~{K}~\l~{N}\-1).', 0, 2);
  TaskText('Insert a new column of elements with the value~1', 0, 3);
  TaskText('after the matrix column with the index~{K}.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  case v1 of
  1: k := 1+Random(m);
  2: k := 1+Random(n);
  end;
  dataN('K = ',k-1,68,m,1);
  a0 := a;
  case v1 of
  1: begin
     for i := m downto k do
       for j := 1 to n do
          a0[i+1,j] := a0[i,j];
     for j := 1 to n do
       a0[k,j] := 0;
     outa0(m+1,n);
     end;
  2: begin
     for j := n downto k+1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
         a0[i,k+1] := 1;
     outa0(m,n+1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn40(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  m := 3 + Random(6);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Double the occurrence', 0, 2);
  TaskText('of the matrix row that contains the maximal matrix element.', 0, 4);
(*
*)
  end;
  2: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Double the occurrence', 0, 2);
  TaskText('of the matrix column that contains the minimal matrix element.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  ina(M,N);
  case v1 of
  1: begin
     amax := -1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] > amax then
           begin
             amax := a[i,j];
             k := i;
           end;
     end;
  2: begin
     amin := 1000;
     for i := 1 to m do
       for j := 1 to n do
         if a[i,j] < amin then
           begin
             amin := a[i,j];
             k := j;
           end;
     end;
  end;
  a0 := a;
  case v1 of
  1: begin
     for i := m downto k do
       for j := 1 to n do
          a0[i+1,j] := a0[i,j];
     outa0(m+1,n);
     end;
  2: begin
     for j := n downto k do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     outa0(m,n+1);
     end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn41(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Insert a new column of elements', 0, 2);
  TaskText('with the value 1 before the first matrix column that contains positive', 0, 3);
  TaskText('numbers only. If the matrix does not contain the required columns,', 0, 4);
  TaskText('then do not change it.', 0, 5);
(*
*)
  end;
  2: begin
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. Insert a new column of elements', 0, 2);
  TaskText('with zero value after the last matrix column that contains negative', 0, 3);
  TaskText('numbers only. If the matrix does not contain the required columns,', 0, 4);
  TaskText('then do not change it.', 0, 5);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  for i:=1 to m do
    for j:=1 to n do
      a[i,j] := (10 * Random)-2;
  a0 := a;
  k1 := 0;
case v1 of
1:for j := 1 to n do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
2:for j := n downto 1 do
    begin
    k := 0;
    for i := 1 to m do
      if a[i,j]<=0 then break
      else k := i;
    if k = m then
      begin k1 := j;
            break;
      end;
    end;
end;
if v1 = 2 then
  for i := 1 to m do
    for j := 1 to n do
      begin
        a[i,j] := -a[i,j];
        a0[i,j] := -a0[i,j];
      end;
k2 := n;
if k1<>0 then
case v1 of
  1: begin
     k2 := n+1;
     for j := n downto k1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
       a0[i,k1] := 1;
     end;
  2: begin
     k2 := n+1;
     for j := n downto k1+1 do
       for i := 1 to m do
           a0[i,j+1] := a0[i,j];
     for i := 1 to m do
       a0[i,k1+1] := 0;
     end;
  end;
  ina2(m,n);
  outa01(m,k2);
  SetNumberOfTests(9);
Pause;
end;

procedure SMtr45Cn42(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j,k1,k2: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});(*DEMO*)
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  k3 := -1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. A matrix element is called', 0, 2);
  TaskText('the \Ilocal minimum\i if it is smaller than all its neighbors (including', 0, 3);
  TaskText('diagonal ones). Replace all local minimums of the matrix by zero values.', 0, 4);
  TaskText('An additional matrix may be used for performing the required replacement.', 0, 5);

(*
*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina3(M,N);

  for i:=0 to m+1 do
    for j:=0 to n+1 do
      a0[i,j]:=-k3*1000;
  for i:=1 to m do
    for j:=1 to n do
      a0[i,j]:=a[i,j];
for i:=1 to m do
  for j:=1 to n do
    begin
    k:=0;
    for k1:=-1 to 1 do
      for k2:=-1 to 1 do
        begin
          if k3*a0[i,j] < k3*a0[i+k1,j+k2] then break;
          inc(k);
        end;
    if k<>9 then a[i,j] := a0[i,j]
    else
      a[i,j] := 0;
    end;
  a0 := a;
  outa03(M,N);
  SetNumberOfTests(5);
Pause;
end;


procedure sorta0(m,n,v1,d: integer);
var i,j,k: integer;
    x: real;
begin
case v1 of
1: for k := 1 to m-1 do
    for i := 1 to m-k do
      if a1[i]*d > a1[i+1]*d then
      begin
        x := a1[i];
        a1[i] := a1[i+1];
        a1[i+1] := x;
        for j := 1 to n do
        begin
          x := a0[i,j];
          a0[i,j] := a0[i+1,j];
          a0[i+1,j] := x;
        end;
      end;
2: for k := 1 to n-1 do
    for j := 1 to n-k do
      if a1[j]*d > a1[j+1]*d then
      begin
        x := a1[j];
        a1[j] := a1[j+1];
        a1[j+1] := x;
        for i := 1 to m do
        begin
          x := a0[i,j];
          a0[i,j] := a0[i,j+1];
          a0[i,j+1] := x;
        end;
      end;
end;
end;


procedure SMtr45Cn43(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(5, 3, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  k3 := 1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given. A matrix element is called', 0, 1);
  TaskText('the \Ilocal maximum\i if it is greater than all its neighbors (including', 0, 2);
  TaskText('diagonal ones). Replace values of all local maximums of the matrix', 0, 3);
  TaskText('by opposite values. An additional matrix may be used', 0, 4);
  TaskText('for performing the required replacement.', 0, 5);
(*
*)
  end;
  2: begin
  k1 := 1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Rearrange the matrix rows so that values of their first elements', 0, 3);
  TaskText('were in ascending order.', 0, 4);
(*
*)
  end;
  3: begin
  k1 := -1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Rearrange the matrix columns so that values of their last elements', 0, 3);
  TaskText('were in descending order.', 0, 4);
(*
*)
  end;
  end;
(*==*)
case v1 of
1: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
       inita(m,n);
       ina2(M,N);
  for i:=0 to m+1 do
    for j:=0 to n+1 do
      a0[i,j]:=-k3*1000;
  for i:=1 to m do
    for j:=1 to n do
      a0[i,j]:=a[i,j];
for i:=1 to m do
  for j:=1 to n do
    begin
    k:=0;
    for k1:=-1 to 1 do
      for k2:=-1 to 1 do
        begin
          if k3*a0[i,j] < k3*a0[i+k1,j+k2] then break;
          inc(k);
        end;
    if k<>9 then a[i,j] := a0[i,j]
    else
       a[i,j] := -a0[i,j];
    end;
  a0 := a;
  outa01(M,N);
end;
2,3: begin
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  2: for i := 1 to m do
       a1[i] := a0[i,1];
  3: for j := 1 to n do
       a1[j] := a0[m,j];
  end;
  sorta0(m,n,v1-1,k1);
  outa0(M,N);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SMtr45Cn44(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j: integer;
begin
  Start(Name, Topic4, Author, Key, 57{level});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  k1 := -1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Rearrange the matrix rows so that minimal values of their elements', 0, 3);
  TaskText('were in descending order.', 0, 4);
(*
*)
  end;
  2: begin
  k1 := 1;
  TaskText('An {M}\;\x\;{N} matrix of real numbers is given.', 0, 2);
  TaskText('Rearrange the matrix columns so that maximal values of their elements', 0, 3);
  TaskText('were in ascending order.', 0, 4);
(*
*)
  end;
  end;
(*==*)
  m := 3 + Random(6); //2 + Random(4);
  n := 3 + Random(6);
  ina(M,N);
  a0 := a;
  case v1 of
  1: for i := 1 to m do
     begin
       a1[i] := a0[i,1];
       for j := 2 to n do
         if a0[i,j] < a1[i] then a1[i] := a0[i,j];
     end;
  2: for j := 1 to n do
     begin
       a1[j] := a0[1,j];
       for i := 2 to m do
         if a0[i,j] > a1[j] then a1[j] := a0[i,j];
     end;
  end;
  sorta0(m,n,v1,k1);
  outa0(M,N);
  SetNumberOfTests(5);
Pause;
end;


procedure SMtr45Cn45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 57{level});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  2: begin
  TaskText('', 0, 2);
  TaskText('', 0, 3);
  TaskText('', 0, 4);
(*
*)
  end;
  end;
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



begin
Topic := 'TWO-DIMENSIONAL ARRAYS (MATRICES)';
Topic1 := 'TWO-DIMENSIONAL ARRAYS (MATRICES): CREATION';
Topic2 := 'TWO-DIMENSIONAL ARRAYS (MATRICES): OUTPUT';
Topic3 := 'TWO-DIMENSIONAL ARRAYS (MATRICES): ANALYSIS';
Topic4 := 'TWO-DIMENSIONAL ARRAYS (MATRICES): CHANGING';
Topic5 := 'TWO-DIMENSIONAL ARRAYS (MATRICES): DIAGONALS';
{Author := 'M.~E.~Abramyan, 2006';}
end.










