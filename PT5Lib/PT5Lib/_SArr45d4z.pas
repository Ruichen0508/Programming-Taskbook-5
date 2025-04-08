{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit _SArr45d4z;

interface

procedure SArr45Dn1(Name, Key: string);
procedure SArr45Dn2(Name, Key: string);
procedure SArr45Dn3(Name, Key: string);
procedure SArr45Dn4(Name, Key: string);
procedure SArr45Dn5(Name, Key: string);
procedure SArr45Dn6(Name, Key: string);
procedure SArr45Dn7(Name, Key: string);
procedure SArr45Dn8(Name, Key: string);
procedure SArr45Dn9(Name, Key: string);
procedure SArr45Dn10(Name, Key: string);
procedure SArr45Dn11(Name, Key: string);
procedure SArr45Dn12(Name, Key: string);
procedure SArr45Dn13(Name, Key: string);
procedure SArr45Dn14(Name, Key: string);
procedure SArr45Dn15(Name, Key: string);
procedure SArr45Dn16(Name, Key: string);
procedure SArr45Dn17(Name, Key: string);
procedure SArr45Dn18(Name, Key: string);
procedure SArr45Dn19(Name, Key: string);
procedure SArr45Dn20(Name, Key: string);
procedure SArr45Dn21(Name, Key: string);
procedure SArr45Dn22(Name, Key: string);
procedure SArr45Dn23(Name, Key: string);
procedure SArr45Dn24(Name, Key: string);
procedure SArr45Dn25(Name, Key: string);
procedure SArr45Dn26(Name, Key: string);
procedure SArr45Dn27(Name, Key: string);
procedure SArr45Dn28(Name, Key: string);
procedure SArr45Dn29(Name, Key: string);
procedure SArr45Dn30(Name, Key: string);
procedure SArr45Dn31(Name, Key: string);
procedure SArr45Dn32(Name, Key: string);
procedure SArr45Dn33(Name, Key: string);
procedure SArr45Dn34(Name, Key: string);
procedure SArr45Dn35(Name, Key: string);
procedure SArr45Dn36(Name, Key: string);
procedure SArr45Dn37(Name, Key: string);
procedure SArr45Dn38(Name, Key: string);
procedure SArr45Dn39(Name, Key: string);
procedure SArr45Dn40(Name, Key: string);
procedure SArr45Dn41(Name, Key: string);
procedure SArr45Dn42(Name, Key: string);
procedure SArr45Dn43(Name, Key: string);
procedure SArr45Dn44(Name, Key: string);
procedure SArr45Dn45(Name, Key: string);

implementation

uses PT5TaskMaker;



















































var
  Topic, Topic4, Topic5, Topic6, Topic7, Topic8, Author: string;
  a : array [0..20] of real;
  a1: array [0..20] of real;
  a2: array [0..20] of real;
  b : array [0..20] of integer;
  b1 : array [0..20] of integer;
  b2,b3 : array [1..20] of integer;
  a0,b0,c0 : real;
  x,y,x1,y1: array[0..8] of real;
  x2,y2: array[0..8] of integer;
  x0,y0,r,r0 : real;
  amin,amax : real;
  bmin,bmax : integer;
  i,j,k,m,n1,n2,n0,n,nmin,nmax : integer;
  s,s1,s2,s3,s4 : string;




procedure SArr45Dn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Given an array of {N}~integers, remove all successive equal elements', 0, 2);
  TaskText('(except for their first occurrence) from the array.', 0, 4);

(*
*)
(*==*)
  a0:=1 + Random(5); b0:=1+Random(3);
  n := 5 + Random(6);
  k := 1;
  b[1] := Random(b0)+a0;
  for i:=2 to n do
  begin
    b[i] := Random(b0)+a0;
    if b[i]<>b[i-1] then inc(k);
  end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('',b[1],center(1,k,1,6),3,1);
j := 1;
for i := 2 to n do
  if b[i]<>b[i-1] then
  begin
    inc(j);
    resultN('',b[i],center(j,k,1,6),3,1);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn2(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
  if v1=1 then
  begin
  TaskText('Given an array of {N}~integers, remove all equal elements', 0, 2);
  TaskText('(except for their first occurrence) from the array.', 0, 4);

(*
*)
  end
  else
  begin
  TaskText('Given an array of {N}~integers, remove all equal elements', 0, 2);
  TaskText('(except for their last occurrence) from the array.', 0, 4);

(*
*)
  end;
(*==*)
a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
  b[i] := Random(b0)+a0;
k := 0;
if v1 = 1 then
begin
  for i:=1 to n do
  begin
    l := 0;
    for j := 1 to i-1 do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
  end;
end
else
begin
  for i:=n downto 1 do
  begin
    l := 0;
    for j := i+1 to n do
      if b[j]=b[i] then
      begin
        l := 1;
        break;
      end;
    if l = 0 then
    begin
      inc(k);
      b1[k]:=b[i];
    end;
   end;
   for i := 1 to k div 2 do
   begin
     l := b1[i];
     b1[i] := b1[k-i+1];
     b1[k-i+1] := l;
   end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
for i := 1 to k do
  resultN('',b1[i],center(i,k,1,6),3,1);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn3(Name, Key: string);
label 0;
var
  v1, v2, v3: Byte;
  k,n,i,j:integer;
  a0, b0, c0: word;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Given an array of {N}~integers, remove all elements',0,2);
taskText('whose values appear less than three times in the array.',0,3);
taskText('Output the size of the changed array and all its elements.',0,4);
(*
*)
end;
2:
begin
taskText('Given an array of {N}~integers, remove all elements',0,2);
taskText('whose values appear more than twice in the array.',0,3);
taskText('Output the size of the changed array and all its elements.',0,4);
(*
*)
end;
3:
begin
taskText('Given an array of {N}~integers, remove all elements',0,2);
taskText('whose values appear exactly twice in the array.',0,3);
taskText('Output the size of the changed array and all its elements.',0,4);
(*
*)
end;
end;
(*==*)
0:  a0:=1 + Random(5); b0:=3+Random(3);
n := 7 + Random(4);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
for i:=1 to n do
  begin
    b1[i] := 0;
    for j:=1 to n do
      if b[j]=b[i] then inc(b1[i]);
  end;
k := 0;
for i := 1 to n do
  case v1 of
  1 : if b1[i]>=3 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  2 : if b1[i]<=2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  3 : if b1[i]<>2 then
        begin
          Inc(k);
          b2[k] := b[i];
        end;
  end;
if (k = 0)or(k = n) then goto 0;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,1,6),4,1);
resultN('New size of array: ',k,0,2,1);
for i := 1 to k do
  resultN('',b2[i],center(i,k,1,6),4,1);
  SetNumberOfTests(5);
Pause;
end;







procedure SArr45Dn4(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('An array of {N}~real numbers and an integer~{K} (0~\l~{K}~\l~{N}\-1) are given.', 0, 2);
  TaskText('Insert a new element with zero value', 0, 3);
  TaskText('before an element with the index~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('An array of {N}~real numbers and an integer~{K} (0~\l~{K}~\l~{N}\-1) are given.', 0, 2);
  TaskText('Insert a new element with zero value', 0, 3);
  TaskText('after an element with the index~{K}.', 0, 4);
(*
*)
  end;
(*==*)
  n := 5 + Random(5);
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,0,4,1);
  for i := n downto k do
    a[i+1] := a[i];
  if v1 = 1 then a[k] := 0
  else a[k+1] := 0;
  for i := 1 to n+1 do
    resultR('',a[i],center(i,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  max, min: real;
  nmin, nmax: integer;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('An array of {N}~real numbers is given. Insert new elements with zero value', 0, 2);
  TaskText('before an element with the minimal value', 0, 3);
  TaskText('and after an element with the maximal value.', 0, 4);
(*
*)
(*==*)
n := 3 + Random(6);
for i:=1 to n do
begin
  a[i] := 19.98*Random-9.99;
  a1[i] := a[i];
end;
min := a[1];
nmin := 1;
max := a[1];
nmax := 1;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 2 to n do
  if a[i]<min then
  begin
    min := a[i];
    nmin := i;
  end
  else
  if a[i]>max then
  begin
    max := a[i];
    nmax := i;
  end;
j := 0;
for i := 1 to n do
begin
  if i=nmin then
  begin
    resultR('',0,center(i+j,n+2,5,2),3,5);
    inc(j);
  end;
  resultR('',a[i],center(i+j,n+2,5,2),3,5);
  if i=nmax then
  begin
    inc(j);
    resultR('',0,center(i+j,n+2,5,2),3,5);
  end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('An array of {N}~real numbers and two integers~{K} and~{M} are given', 0, 2);
  TaskText('(0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10). Insert {M}~new elements with zero value', 0, 3);
  TaskText('before an element with the index~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('An array of {N}~real numbers and two integers~{K} and~{M} are given', 0, 2);
  TaskText('(0~\l~{K}~\l~{N}\-1, 1~\l~{M}~\l~10). Insert {M}~new elements with zero value', 0, 3);
  TaskText('after an element with the index~{K}.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 2 + Random(9);
  m := 1 + Random(7);
  until n + m <= 10;
  k := 1 + Random(n);
  for i:=1 to n do
    a[i] := 19.98*Random-9.99;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),3,5);
  dataN('K = ',k-1,xLeft,4,1);
  dataN('M = ',m,xRight,4,1);
  for i := n downto k do
    a[i+m] := a[i];
  for i := k+1 to k+m-1 do
    a[i] := 0;
  if v1 = 1 then a[k] := 0
  else a[k+m] := 0;
  for i := 1 to n+m do
    resultR('',a[i],center(i,n+m,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn7(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('Given an array of {N}~real numbers,', 0, 2);
  TaskText('double occurrences of elements with odd indices (1,~3,~\.).', 0, 3);
  TaskText('Do not use conditional statements in loops.', 0, 4);
(*
+
*)
  end
  else
  begin
  TaskText('Given an array of {N}~real numbers,', 0, 2);
  TaskText('triple occurrences of elements with even indices (0,~2,~\.).', 0, 3);
  TaskText('Do not use conditional statements in loops.', 0, 4);
(*
*)
  end;
(*==*)
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    a[i] := 9.88*Random;
    case v1 of
    1: if not Odd(i) then inc(k);
    2: if Odd(i) then k := k + 2;
    end;
  end;
  until n+k<=19;
setprecision(1);
dataN('N = ',n,0,2,1);
for i := 1 to n do
    dataR('',a[i],center(i,n,3,2),4,3);
j := 0;
case v1 of
1:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,2),3,3);
    if not Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,2),3,3);
    end;
  end;
2:
  for i := 1 to n do
  begin
    resultR('',a[i],center(i+j,n+k,3,1),3,3);
    if Odd(i) then
    begin
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultR('',a[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Dn8(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('Given an array of {N}~real numbers,', 0, 2);
  TaskText('insert an element with zero value', 0, 3);
  TaskText('before each element with positive value.', 0, 4);
(*
*)
n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
 if a[i]>0 then
     begin
            a1[k+1] := 0;
            a1[k+2] := a[i];
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn9(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(3, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
  TaskText('Given an array of {N}~real numbers,', 0, 2);
  TaskText('insert an element with zero value', 0, 3);
  TaskText('after each element with negative value.', 0, 4);
(*
*)
end;
2: begin
  TaskText('Given an array of {N}~integers,', 0, 2);
  TaskText('double occurrences of all elements whose values are even numbers.', 0, 4);
(*
*)
  end;
3: begin
  TaskText('Given an array of {N}~integers,', 0, 2);
  TaskText('triple occurrences of all elements whose values are odd numbers.', 0, 4);
(*
*)
  end;
end;
(*==*)
case v1 of
1: begin

n := 3 + Random(3);
for i:=1 to n do
  a[i] := 19.98*Random-9.99;
k := 0;
for i := 1 to n do
 if a[i]<0 then
          begin
            a1[k+1] := a[i];
            a1[k+2] := 0;
            k := k+2;
          end
    else
      begin
        Inc(k);
        a1[k] := a[i];
      end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataR('',a[i],center(i,n,5,2),4,5);
for i := 1 to k do
  resultR('',a1[i],center(i,k,5,2),3,5);

end;
2,3: begin
  repeat
  n := 3 + Random(8);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    case v1 of
    2: if not Odd(b[i]) then inc(k);
    3: if Odd(b[i]) then k := k + 2;
    end;
  end;
  until n+k<=18;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,3,4),4,3);
j := 0;
case v1 of
2:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if not Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
3:
  for i := 1 to n do
  begin
    resultN('',b[i],center(i+j,n+k,3,1),3,3);
    if Odd(b[i]) then
    begin
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
      inc(j);
      resultN('',b[i],center(i+j,n+k,3,1),3,3);
    end;
  end;
end;
end;
end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn10(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;





procedure SArr45Dn11(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});(*DEMO*)
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of~{N} (\l\,6) real numbers is given. Sort the array in ascending order', 0, 1);
  TaskText('by using the \Iexchange sort method\i (the \Ibubble sorting\i): compare each pair', 0, 2);
  TaskText('of two adjacent elements ({A}_{0} and~{A}_{1}, {A}_{1} and~{A}_{2}, and so\ on) and exchange', 0, 3);
  TaskText('their values in case the left element is greater than the right one; repeat', 0, 4);
  TaskText('{N}\,\-\,1 times such array pass. Output all array elements after each pass', 0, 5);
  TaskText('for checking results. Note that the amount of analyzed pairs', 0, 0);
  TaskText('of the array elements can be reduced by~1 after each pass.', 0, 0);
(*
*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    if (i = n) and (Random(3)=0) then a[i] := 2*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[i]>a[i+1] then
      begin
        a0 := a[i];
        a[i] := a[i+1];
        a[i+1] := a0;
      end;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Dn12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of~{N} (\l\,6) real numbers is given. Sort the array in ascending order', 0, 1);
  TaskText('by using the \Iselection sort method\i: find the greatest element in the array', 0, 2);
  TaskText('and exchange the values of the greatest element and the last element (with', 0, 3);
  TaskText('the index~{N}\,\-\,1); repeat {N}\,\-\,1 times this process, reducing the amount', 0, 4);
  TaskText('of analyzed elements by 1 after each array pass. Output all array elements', 0, 5);
  TaskText('after each pass for checking results.', 0, 0);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 1 to n-1 do
  begin
    a0 := a[1];
    n1 := 1;
    for i := 2 to n-k+1 do
      if a[i]>a0 then
      begin
        a0 := a[i];
        n1 := i;
      end;
    a[n1] := a[n-k+1];
    a[n-k+1] := a0;
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of~{N} (\l\,6) real numbers is given. Sort the array in ascending order', 0, 1);
  TaskText('by using the \Iinsertion sort method\i: compare an element~{A}_{1} with the first', 0, 2);
  TaskText('element~{A}_{0} and exchange their values, if necessary, so that these elements', 0, 3);
  TaskText('were in ascending order; then move an element~{A}_{2} to the left (sorted) part', 0, 4);
  TaskText('of the array, so that three elements were in ascending order; repeat this', 0, 5);
  TaskText('process for other array elements. Output all array elements after processing', 0, 0);
  TaskText('of each element (from~{A}_{1} to~{A}_{N\-1}).', 0, 0);
(*
*)
(*==*)
  n := 3 + Random(4);
  case n of
  3:   j := 2;
  4,5: j := 1;
  6:   j := 0;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
  end;
  for k := 2 to n do
  begin
    a[0] := a[k];
    i := k;
    while a[i-1]>a[0] do
    begin
      a[i] := a[i-1];
      dec(i);
    end;
    a[i] := a[0];
    for i := 1 to n do
      resultR('',a[i],center(i,n,5,2),j+k-1,5);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 46{level1});
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~real numbers is given. Without changing the array~{A},', 0, 1);
  TaskText('output indices that correspond to array elements in ascending order', 0, 2);
  TaskText('of their values. For solving the task create an additional \Iindex array\i~{I},', 0, 3);
  TaskText('which contains indices in the range~0 to~{N}\-1, and use the bubble sorting', 0, 4);
  TaskText('(see \3) as follows: compare elements of array A (with indices', 0, 5);
  TaskText('{I}_{0} and~{I}_{1}, {I}_{1} and~{I}_{2}, and so\ on) and exchange, if necessary, values', 0, 0);
  TaskText('of corresponding elements of index array~{I}. After repeating {N}\,\-\,1~times', 0, 0);
  TaskText('of such array pass, the required sequence of indices', 0, 0);
  TaskText('will be contained in the array~{I}.', 0, 0);
(*
*)
(*==*)
  n := 5 + Random(6);
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    dataR('',a[i],center(i,n,5,2),4,5);
    b[i] := i;
  end;
  for k := 1 to n-1 do
  begin
    for i := 1 to n-k do
      if a[b[i]]>a[b[i+1]] then
      begin
        j := b[i];
        b[i] := b[i+1];
        b[i+1] := j;
      end;
  end;
  for i := 1 to n do
    resultN('',b[i]-1,center(i,n,3,4)-1,3,3);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Dn15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(8, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SArr45Dn16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(7, 0, 0, 0, v1, v2, v3);
  TaskText('Two arrays~{A} and~{B} of {N}~real numbers are given. Exchange the contents', 0, 2);
  TaskText('of the given arrays and output elements of the changed array~{A}', 0, 3);
  TaskText('and then output elements of the changed array~{B}.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := 19.98*Random - 9.99;
    a1[i] := 19.98*Random - 9.99;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),4,5);
  resultComment('A:',center(1,n+1,5,2),3);
  resultComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    resultR('',a1[i],center(i+1,n+1,5,2),3,5);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),4,5);
  SetNumberOfTests(5);
Pause;
end;




procedure SArr45Dn17(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Given an array~{A} of {N}~real numbers, create a\ new array~{B}', 0, 2);
  TaskText('of the same size with elements defined as:', 0, 3);
  TaskText('\[\Jrcrl&{B}_{K}&~=~&2\*{A}_{K},& if {A}_{K}~<~5,   ', 0, 4);
  TaskText('&\,&\,& {A}_{K}/2&  otherwise.\j\]', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a[i] := RandomR1(0.1, 9.9); //9.97*Random + 0.01; //2018
    if a[i] < 5 then a1[i] := a[i]*2
    else a1[i] := a[i]/2;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,5,2),4,5);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('Two arrays~{A} and~{B} of {N}~real numbers are given.', 0, 2);
  TaskText('Create a\ new array~{C} of the same size; each element~{C}_{K}', 0, 3);
  TaskText('must be equal to the largest of elements of~{A} and~{B} with the same index~{K}.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
  for i:=1 to n do
  begin
    a1[i] := 19.98*Random - 9.99;
    a2[i] := 19.98*Random - 9.99;
    if a1[i]>a2[i] then a[i] := a1[i]
    else a[i] := a2[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),3);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),3,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+1,5,2),3);
  for i := 1 to n do
    resultR('',a[i],center(i+1,n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Dn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(10, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~integers is given. Write elements of~{A}', 0, 2);
  TaskText('whose values are even numbers to a\ new array~{B} (in the same order)', 0, 3);
  TaskText('and output the size of array~{B} and all its elements.', 0, 4);
(*
*)
  n := 2 + Random(9);
  k := 0;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
    if not Odd(b[i]) then inc(k);
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,4),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,4),4,3);
  resultN('Size of array B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,4),4);
  j := 0;
  for i := 1 to n do
  if not Odd(b[i]) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,4),4,3);
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(1, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('An array~{A} of~{N} (\l\,15) integers is given.', 0, 2);
  TaskText('Write elements of~{A} with even indices (0, 2,~\.)', 0, 3);
  TaskText('to a\ new array~{B} and output the size of array~{B} and all its elements.', 0, 4);
  TaskText('Do not use conditional statements.', 0, 5);
(*
*)
  end
  else
  begin
  TaskText('An array~{A} of~{N} (\l\,15) integers is given.', 0, 2);
  TaskText('Write elements of~{A} with indices that are multiples of~3 (0, 3, 6,~\.)', 0, 3);
  TaskText('to a\ new array~{B} and output the size of array~{B} and all its elements.', 0, 4);
  TaskText('Do not use conditional statements.', 0, 5);
(*
*)
  end;
(*==*)
  n := 2 + Random(14);
  case curtest of //2012
  2: n := (Random(7)+1)*2;
  4: n := (Random(7)+1)*2+1;
  end;
  if v1 = 1 then k := (n+1) div 2
  else k := (n-1) div 3 + 1;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,1),4);
  for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,3,1),4,3);
  resultN('Size of array B: ',k,0,2,2);
  if k > 0 then
  resultComment('B:',center(1,k+1,3,3),4);
  j := 0;
  for i := 1 to n do
  case v1 of
  1:
  if Odd(i) then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  2:
  if (i-1) mod 3 = 0 then
  begin
    inc(j);
    resultN('',b[i],center(j+1,k+1,3,3),4,3);
  end;
  end;
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn21(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~integers is given. Write elements of~{A} with odd indices', 0, 1);
  TaskText('to a\ new array~{B} and then write elements of~{A} with even indices', 0, 2);
  TaskText('to the same array~{B}, so the array~{B} will contain the following elements:', 0, 3);
  TaskText('\[{A}_{1},\q {A}_{3},\q {A}_{5},\q \.,\q {A}_{0},\q {A}_{2},\q {A}_{4},\q \.~.\]', 0, 4);
  TaskText('Do not use conditional statements.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  case curtest of //2012
  3: n := (Random(5)+1)*2;
  4: n := (Random(4)+1)*2+1;
  end;
  for i:=1 to n do
  begin
    b[i] := Random(100);
    if Random(2)=0 then b[i] := -b[i];
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,3,3),4);
  for i := 1 to n do
    dataN('',b[i],center(i+1,n+1,3,3),4,3);
  resultComment('B:',center(1,n+1,3,3),3);
  for i := 1 to n div 2 do
    resultN('',b[2*i],center(i+1,n+1,3,3),3,3);
  for i := 1 to (n+1) div 2 do
    resultN('',b[2*i-1],center(n div 2 +i+1,n+1,3,3),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
  if v1 = 1 then
  begin
  TaskText('An array~{A} of {N}~real numbers is given.', 0, 2);
  TaskText('Create a new array~{B} of the same size; each array element~{B}_{K} must be equal', 0, 3);
  TaskText('to the sum of elements of~{A} with indices in the range~0 to~{K}.', 0, 4);
(*
*)
  end
  else
  begin
  TaskText('An array~{A} of {N}~real numbers is given.', 0, 2);
  TaskText('Create a new array~{B} of the same size; each array element~{B}_{K} must be equal', 0, 3);
  TaskText('to the average of elements of~{A} with indices in the range~0 to~{K}.', 0, 4);

(*
*)
  end;
(*==*)
  n := 2 + Random(9);
  if v1 = 1 then
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i-1]+a[i];
    end;
  end
  else
  begin
    a[1] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[1] := a[1];
    for i:=2 to n do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((i-1)*a1[i-1]+a[i])/i;
    end;
  end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~real numbers is given.', 0, 2);
  TaskText('Create a new array~{B} of the same size; each array element~{B}_{K} must be equal', 0, 3);
  TaskText('to the sum of elements of~{A} with indices in the range~{K} to~{N}\-1.', 0, 4);
(*
*)
(*==*)
  n := 2 + Random(9);
    a[N] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[N] := a[N];
    for i:=N-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := a1[i+1]+a[i];
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~real numbers is given.', 0, 2);
  TaskText('Create a new array~{B} of the same size; each array element~{B}_{K} must be equal', 0, 3);
  TaskText('to the average of elements of~{A} with indices in the range~{K} to~{N}\-1.', 0, 4);

(*
*)
(*==*)
  n := 2 + Random(9);
    a[n] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
    a1[n] := a[n];
    for i := n-1 downto 1 do
    begin
      a[i] := RandomR2(-9.9, 9.9); //19.98*Random-9.99; //2018
      a1[i] := ((n-i)*a1[i+1]+a[i])/(n-i+1);
    end;
  dataN('N = ',n,0,2,1);
  for i := 1 to n do
    dataR('',a[i],center(i,n,6,1),4,6);
  for i := 1 to n do
    resultR('',a1[i],center(i,n,6,1),3,6);
  SetNumberOfTests(5);
Pause;
end;



procedure SArr45Dn25(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('Given an array~{A} of {N}~real numbers, create two new arrays~{B} and~{C}', 0, 1);
  TaskText('and write all positive elements of~{A} to the array~{B}', 0, 2);
  TaskText('and all negative elements of~{A} to the array~{C} (in the same order).', 0, 3);
  TaskText('Output the size of the array~{B} and all its elements', 0, 4);
  TaskText('and then output the size of the array~{C} and all its elements.', 0, 5);
(*
*)
(*==*)
  n := 2 + Random(9);
  n1 := 0;
  n2 := 0;
  for i:=1 to n do
  begin
    a[i] := 19.98*Random-9.99;
    if a[i]>0 then
    begin
      inc(n1);
      a1[n1] := a[i];
    end
    else
    if a[i] < 0 then
    begin
      inc(n2);
      a2[n2] := a[i];
    end;
  end;
  dataN('N = ',n,0,2,1);
  dataComment('A:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a[i],center(i+1,n+1,5,2),4,5);
  if n1 > n2 then k := n1
  else k := n2;
  resultN('Size of array B: ',n1,0,2,2);
  if n1 > 0 then
    resultComment('B:',center(1,k+1,5,2),3);
  for i := 1 to n1 do
    resultR('',a1[i],center(i+1,k+1,5,2),3,5);
  resultN('Size of array C: ',n2,0,4,2);
  if n2 > 0 then
    resultComment('C:',center(1,k+1,5,2),5);
  for i := 1 to n2 do
    resultR('',a2[i],center(i+1,k+1,5,2),5,5);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Dn26(Name, Key: string);
var
  v1, v2, v3: Byte;
  k1, k2: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});(*DEMO*)
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('Two arrays~{A} and~{B} of 5~real numbers are given.', 0, 2);
  TaskText('Values of elements of each array are in ascending order.', 0, 3);
  TaskText('Write all elements of~{A} and~{B} to a\ new array~{C} (of size~10)', 0, 4);
  TaskText('so that values of all elements of~{C} were in ascending order.', 0, 5);
(*
Используйте для\ каждого массива вспомогательную переменную,
\<указывающую\> на\ первый из\ элементов, еще не\ помещенных
в\ результирующий массив. В\ каждый момент времени в\ результирующий
массив будет помещаться один из\ элементов, на\ которые указывают
вспомогательные переменные. Особая проблема возникает в\ ситуации,
когда исчерпываются элементы одного из\ массивов. Для ее\ решения
удобно использовать прием \Iбарьера\i, добавив в\ конец каждого
массива еще\ один элемент, заведомо больший (меньший) всех предыдущих.
*)
  n := 5;
  for i := 1 to n do
  begin
    a1[i] := 19.98*Random-9.99;
    a2[i] := 19.98*Random-9.99;
  end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a1[i]>a1[i+1] then
      begin
        a0 := a1[i];
        a1[i] := a1[i+1];
        a1[i+1] := a0;
      end;
  for k := 1 to n-1 do
    for i := 1 to n-k do
      if a2[i]>a2[i+1] then
      begin
        a0 := a2[i];
        a2[i] := a2[i+1];
        a2[i+1] := a0;
      end;
  a1[n+1] := 1000;
  a2[n+1] := 1000;
  k1 := 1;
  k2 := 1;
  k := 0;
  for i := 1 to n+n do
    if a1[k1]<a2[k2] then
    begin
      inc(k);
      a[k] := a1[k1];
      inc(k1);
    end
    else
    begin
      inc(k);
      a[k] := a2[k2];
      inc(k2);
    end;
  dataComment('A:',center(1,n+1,5,2),2);
  for i := 1 to n do
    dataR('',a1[i],center(i+1,n+1,5,2),2,5);
  dataComment('B:',center(1,n+1,5,2),4);
  for i := 1 to n do
    dataR('',a2[i],center(i+1,n+1,5,2),4,5);
  resultComment('C:',center(1,n+n+1,5,2),3);
  for i := 1 to n+n do
    resultR('',a[i],center(i+1,n+n+1,5,2),3,5);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn27(Name, Key: string);
function maxInd(n1,n2,n3: integer): integer;
begin
if (n1>n2)and(n1>n3) then maxInd := 1
else
  if n2>n3 then maxInd := 2
  else maxInd := 3;
end;
var
  v1, v2, v3: Byte;
  n1,n2,n3,k1,k2,k3: integer;
begin
  Start(Name, Topic5, Author, Key, 46{level1});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('Three arrays~{A}, {B},~{C} of~{N}_A, {N}_B,~{N}_C integers are given.', 0, 2);
  TaskText('Values of elements of each array are in descending order.', 0, 3);
  TaskText('Write all elements of~{A}, {B},~{C} to a\ new array~{D} (of size {N}_A\;+\;{N}_B\;+\;{N}_C)', 0, 4);
  TaskText('so that values of all elements of~{D} were in descending order.', 0, 5);
(*
+
*)
(*==*)
  repeat
  n1 := 3 + Random(8);
  n2 := 3 + Random(8);
  n3 := 3 + Random(8);
  n := n1 + n2 + n3;
  until n <=18;
  for i := 1 to n1 do
    b1[i] := Random(199)-99;
  for i := 1 to n2 do
    b2[i] := Random(199)-99;
  for i := 1 to n3 do
    b3[i] := Random(199)-99;
  for k := 1 to n1-1 do
    for i := 1 to n1-k do
      if b1[i]<b1[i+1] then
      begin
        j := b1[i];
        b1[i] := b1[i+1];
        b1[i+1] := j;
      end;
  for k := 1 to n2-1 do
    for i := 1 to n2-k do
      if b2[i]<b2[i+1] then
      begin
        j := b2[i];
        b2[i] := b2[i+1];
        b2[i+1] := j;
      end;
  for k := 1 to n3-1 do
    for i := 1 to n3-k do
      if b3[i]<b3[i+1] then
      begin
        j := b3[i];
        b3[i] := b3[i+1];
        b3[i+1] := j;
      end;
  b1[n1+1] := -1000;
  b2[n2+1] := -1000;
  b3[n3+1] := -1000;
  k1 := 1;
  k2 := 1;
  k3 := 1;
  k := 0;
  for i := 1 to n1+n2+n3 do
    case MaxInd(b1[k1],b2[k2],b3[k3]) of
    1:
      begin
        inc(k);
        b[k] := b1[k1];
        inc(k1);
      end;
    2:
      begin
        inc(k);
        b[k] := b2[k2];
        inc(k2);
      end;
    3:
      begin
        inc(k);
        b[k] := b3[k3];
        inc(k3);
      end;
     end;
  dataN('N_A = ',n1,5,2,1);
  dataComment('A:',15,2);
  for i := 1 to n1 do
    dataN('',b1[i],15+i*4,2,3);
  dataN('N_B = ',n2,5,3,1);
  dataComment('B:',15,3);
  for i := 1 to n2 do
    dataN('',b2[i],15+i*4,3,3);
  dataN('N_C = ',n3,5,4,1);
  dataComment('C:',15,4);
  for i := 1 to n3 do
    dataN('',b3[i],15+i*4,4,3);
  resultComment('D:',center(1,n+1,3,1),3);
  for i := 1 to n do
    resultN('',b[i],center(i+1,n+1,3,1),3,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn28(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Dn29(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
  TaskText('An array~{A} of {N}~integers is given. A\ group of successive array elements with', 0, 1);
  TaskText('equal values is called a \Iseries of equal numbers\i, the amount of its elements', 0, 2);
  TaskText('is called a\ \Ilength of series\i (a\ length of series may be equal to~1),', 0, 3);
  TaskText('the value of its elements is called a\ \Ivalue of series\i. Create and output', 0, 4);
  TaskText('two new integer-valued arrays~{B} and~{C} containing respectively lengths', 0, 5);
  TaskText('and values of all series of equal numbers of the array~{A}.', 0, 0);
(*
Решение этого задания приводится в\ п.\,10.1.
*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
dataN('N = ',n,0,2,1);
dataComment('A:',center(1,n+1,1,6),4);
for i := 1 to n do
  dataN('',b[i],center(i+1,n+1,2,5),4,2);
resultComment('B:',center(1,m+1,1,6),2);
for i := 1 to m do
  resultN('',b1[i],center(i+1,m+1,2,5),2,2);
resultComment('C:',center(1,m+1,1,6),4);
for i := 1 to m do
  resultN('',b2[i],center(i+1,m+1,2,5),4,2);
  SetNumberOfTests(5);
  Pause;
end;

procedure SArr45Dn30(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(2, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
s := '';
taskText('Given an array of {N}~integers, insert an element with zero value',0,2);
taskText('before each series of equal numbers of the array',0,3);
taskText('(see the \Iseries\i definition in \1).',0,4);
(*
*)
end;
2:
begin
s := '';
taskText('Given an array of {N}~integers, insert an element with zero value',0,2);
taskText('after each series of equal numbers of the array',0,3);
taskText('(see the \Iseries\i definition in \2).',0,4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
if v1=1 then
  begin
    m := 1;
    b1[m] := 0;
  end;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := 0;
        m := m+2;
      end;
Inc(m);
b1[m] := b[n];
if v1=2 then
    begin
      Inc(m);
      b1[m] := 0;
    end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn31(Name, Key: string);
label 2;
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Given an array of {N}~integers,',0,2);
taskText('increase each series of equal numbers of the array by one element',0,3);
taskText('(see the \Iseries\i definition in \3).',0,4);
(*
*)
end;
2:
begin
taskText('An array of {N}~integers is given. The array contains',0,2);
taskText('at least one series of two or more equal numbers.',0,3);
taskText('Decrease each series of equal numbers of the array by one element',0,4);
taskText('(see the \Iseries\i definition in \4).',0,5);
(*
*)
end;
end;
(*==*)
2:
a0:=1 + Random(5); b0:=1+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then
    begin
      Inc(m);
      b1[m] := b[i-1]
    end
  else
    if v1=1 then
      begin
        b1[m+1] := b[i-1];
        b1[m+2] := b[i-1];
        m := m+2;
      end;
if v1=1 then
    begin
      b1[m+1] := b[n];
      b1[m+2] := b[n];
      m := m+2;
    end;
if m = 0 then goto 2;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn32(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(4, 0, 0, 0, v1, v2, v3);
  TaskText('An integer~{K} (\g\,0) and an array of {N}~integers are given.', 0, 2);
  TaskText('Double the length of the \Um{K}-th\um series of equal numbers of the array', 0, 3);
  TaskText('(see the \Iseries\i definition in \5, series are numbered from~0).',0,4);
  TaskText('If the array contains less than {K}\,+\,1 series, then do not change it.', 0, 5);
(*
*)
(*==*)
  k := 1 + Random(4);
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
   b1[k] := 2*b1[k];
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
if j <= 10 then l := 5
else l := 2;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,l),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Dn33(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l,f: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(5, 0, 0, 0, v1, v2, v3);
  TaskText('An integer~{K} (\g\,1) and an array of {N}~integers are given.', 0, 2);
  TaskText('Remove the \Um{K}-th\um series of equal numbers from the array', 0, 3);
  TaskText('(see the \Iseries\i definition in \6, series are numbered from~0).',0,4);
  TaskText('If the array contains less than {K}\,+\,1 series, then do not change it.', 0, 5);
(*
*)
(*==*)
  k := 2 + Random(4);
  f := Random(5);
repeat
for i := 1 to 20 do b1[i] := 0;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
until b1[k]=f;
if k <=m then
   b1[k] := 0;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to j do
  resultN('',b[i],center(i,j,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Dn34(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(6, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  TaskText('An integer~{K} (\g\,1) and an array of {N}~integers are given.', 0, 2);
  TaskText('Exchange the first and the \Um{K}-th\um series of equal numbers of the array', 0, 3);
  TaskText('(see the \Iseries\i definition in \7, series are numbered from~0).',0,4);
  TaskText('If the array contains less than {K}\,+\,1 series, then do not change it.', 0, 5);
(*
*)
end;
2:
begin
  TaskText('An integer~{K} (\g\,1) and an array of {N}~integers are given.', 0, 2);
  TaskText('Exchange the last and the \Um{K}-th\um series of equal numbers of the array', 0, 3);
  TaskText('(see the \Iseries\i definition in \8, series are numbered from~0).',0,4);
  TaskText('If the array contains less than {K}\,+\,1 series, then do not change it.', 0, 5);
(*
*)
end;
end;
(*==*)
case v1 of
1: k := 2 + Random(4);
2: k := 1 + Random(4);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
if k <=m then
case v1 of
1: begin
     j := b1[1];
     b1[1] := b1[k];
     b1[k] := j;
     j := b2[1];
     b2[1] := b2[k];
     b2[k] := j;
   end;
2: begin
     j := b1[m];
     b1[m] := b1[k];
     b1[k] := j;
     j := b2[m];
     b2[m] := b2[k];
     b2[k] := j;
   end;
end;
dataN('K = ',k-1,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
j := 0;
for i := 1 to m do
  for k := 1 to b1[i] do
    begin
      inc(j);
      b[j] := b2[i];
    end;
for i := 1 to n do
  resultN('',b[i],center(i,n,2,5),3,2);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Dn35(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(7, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('An integer~{L} (>\,1) and an array of {N}~integers are given.',0,2);
taskText('Replace each series, whose length is less than~{L}, by one element',0,3);
TaskText('with zero value (see the \Iseries\i definition in \9).', 0, 4);
(*
*)
end;
2:
begin
taskText('An integer~{L} (>\,0) and an array of {N}~integers are given.',0,2);
taskText('Replace each series, whose length is equal to~{L}, by one element',0,3);
TaskText('with zero value (see the \Iseries\i definition in \10).', 0, 4);
(*
*)
end;
3:
begin
taskText('An integer~{L} (>\,0) and an array of {N}~integers are given.',0,2);
taskText('Replace each series, whose length is greater than~{L}, by one element',0,3);
TaskText('with zero value (see the \Iseries\i definition in \11).', 0, 4);
(*
*)
end;
end;
(*==*)
case v1 of
2: k := 1 + Random(4);
3: k := 1 + Random(3);
1: k := 2 + Random(3);
end;
a0:=1 + Random(5); b0:=2+Random(3);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      Inc(m);
      b1[m] := l;
      b2[m] := b[i-1];
      l := 1;
    end;
Inc(m);
b1[m] := l;
b2[m] := b[n];
j := 0;
for i := 1 to m do
  case v1 of
  1: if b1[i]>=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  2: if b1[i]<>k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  3: if b1[i]<=k then
       for l := 1 to b1[i] do
         begin
           inc(j);
           b3[j] := b2[i];
         end
    else
      begin
        Inc(j);
        b3[j]:=0;
      end;
  end;
dataN('L = ',k,xLeft,2,1);
dataN('N = ',n,xRight,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
for i := 1 to j do
  resultN('',b3[i],center(i,j,2,5),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Dn36(Name, Key: string);
var
  v1, v2, v3: Byte;
  a0, b0, c0: word;
  l: integer;
begin
  Start(Name, Topic7, Author, Key, 46{level2});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('Given an array of {N}~integers,',0,2);
taskText('increase its first series of the maximal length by one element',0,3);
TaskText('(see the \Iseries\i definition in \12).', 0, 4);
(*
*)
end;
2:
begin
taskText('Given an array of {N}~integers,',0,2);
taskText('increase its last series of the maximal length by one element',0,3);
TaskText('(see the \Iseries\i definition in \13).', 0, 4);
(*
*)
end;
3:
begin
taskText('Given an array of {N}~integers,',0,2);
taskText('increase all its series of the maximal length by one element',0,3);
TaskText('(see the \Iseries\i definition in \14).', 0, 4);
(*
*)
end;
end;
(*==*)
a0:=1 + Random(5); b0:=1+Random(5);
n := 5 + Random(6);
for i:=1 to n do
 begin
  b[i] := Random(b0)+a0;
 end;
m := 0;
l := 1;
bmax := -1;
for i:=2 to n do
  if b[i] =b[i-1] then Inc(l)
  else
    begin
      if l >= bmax then
        begin
          bmax := l;
          j := i-1;
        end;
      l := 1;
    end;
if l >= bmax then
 begin
  bmax := l;
  j:=n;
 end;
m := 0;
l := 1;
case v1 of
3:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if l = bmax then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if l = bmax then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
1:
begin
j := 0;
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];

  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=0) then
        begin
          j := 1;
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=0) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
2:
begin
for i:=2 to n do
  begin
  Inc(m);
  b1[m] := b[i-1];
  if b[i] =b[i-1] then
      Inc(l)
  else
    begin
      if (l = bmax)and (j=i-1) then
        begin
          inc(m);
          b1[m] := b[i-1];
        end;
      l := 1;
    end;
  end;
Inc(m);
b1[m] := b[n];
if (l = bmax)and(j=n) then
  begin
    Inc(m);
    b1[m] := b[n];
  end;
  end;
end;
dataN('N = ',n,0,2,1);
for i := 1 to n do
  dataN('',b[i],center(i,n,2,5),4,2);
if m <= 10 then l := 5
else l := 2;
for i := 1 to m do
  resultN('',b1[i],center(i,m,2,l),3,2);
setNumberOfTests(8);
Pause;
end;

procedure SArr45Dn37(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SArr45Dn38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('A set~{A} of {N}~points in the coordinate plane and a\ point~{B} are given',0,1);
taskText('(all points are determined by their coordinates~{x},\;{y}).',0,2);
taskText('Find the point of~{A} that is the nearest to the point~{B}.',0,3);
taskText('The \Idistance\i~{R} between two points with the coordinates ({x}_1,\;{y}_1) and~({x}_2,\;{y}_2)',0,4);
taskText('may be found by formula:\[      {R}~=~\R({x}_2\,\-\,{x}_1)^2\;+\;({y}_2\,\-\,{y}_1)^2\r.\]',0,5);
(*
При выполнении данного и подобных ему заданий можно обойтись
без\ извлечения квадратных корней, сравнивая \Iквадраты\i расстояний.
*)
(*==*)
n := 4 + Random(5);
for i:=0 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[1]-x[0])+sqr(y[1]-y[0]);
amax := amin;
nmin := 1;
nmax := 1;
for i := 2 to n do
  begin
    r0 := sqr(x[i]-x[0])+sqr(y[i]-y[0]);
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end
    else
      if amax < r0 then
        begin
          amax := r0;
          nmax := i;
        end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6);
dataR2(' B:  ',x[0],y[0],0,5,6);
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(10, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
taskText('(points are determined by their coordinates~{x},\;{y}).',0,2);
taskText('Find the point of~{A} that lies in the second coordinate quarter',0,3);
taskText('and is the farthest from the origin. If the set~{A} does not contain',0,4);
taskText('such points, then output the origin~(0,\;0).',0,5);
(*
*)
end;
2:
begin
taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
taskText('(points are determined by their coordinates~{x},\;{y}).',0,2);
taskText('Find the point of~{A} that lies in the first or the third coordinate quarter',0,3);
taskText('and is the nearest to the origin. If the set~{A} does not contain',0,4);
taskText('such points, then output the origin~(0,\;0).',0,5);
(*
*)
end;
end;
(*==*)
n := 3 + Random(6);
x[0] := 0; y[0] := 0;
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
case v1 of
2: begin amin := 1000; k := 1; end;
1: begin amin := 0; k := -1; end;
end;
nmin := 0;
for i := 1 to n do
  begin
    r0 := sqr(x[i])+sqr(y[i]);
    case v1 of
    2 : if (x[i]*y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    1 : if (x[i]<0)and(y[i]>0)and(k*amin > k*r0) then
          begin
            amin := r0;
            nmin := i;
          end;
    end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6);
resultR2('',x[nmin],y[nmin],0,3,6);
  SetNumberOfTests(8);
Pause;
end;

procedure SArr45Dn40(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});(*DEMO*)
  GetVariant(1, 0, 0, 0, v1, v2, v3);
taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
taskText('(points are determined by their coordinates~{x},\;{y}).',0,2);
taskText('Find two points of~{A} with the maximal distance between them and output',0,3);
taskText('these points (in ascending order of their indices in the set~{A})',0,4);
taskText('and the value of the distance.',0,5);
(*
*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := sqr(x[2]-x[1])+sqr(y[2]-y[1]);
bmin := 1;
nmin := 2;
for i := 1 to n-1 do
  for j := i+1 to n do
  begin
    r0 := sqr(x[i]-x[j])+sqr(y[i]-y[j]);
    if amin < r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6);
resultR2('First point:',x[bmin],y[bmin],xLeft,2,6);
resultR2('Second point:',x[nmin],y[nmin],xRight,2,6);
resultR('Distance: ',sqrt(amin),0,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Dn41(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(3, 0, 0, 0, v1, v2, v3);
  TaskText('Two sets~{A} and~{B} of~{N}_1 and~{N}_2 points respectively are given', 0, 1);
  taskText('(points are determined by their coordinates~{x},\;{y}).',0,2);
  TaskText('Find the point of~{A} and the point of~{B} with the minimal distance', 0, 3);
  TaskText('between them. Output the value of the distance', 0, 4);
  TaskText('and then the point of~{A} and the point of~{B}.', 0, 5);
//
(*
*)
(*==*)
n := 4 + Random(5);
n1 := 4 + Random(5);
{//n := 8;}
{//n1 := 8;}
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i:=1 to n1 do
  begin
  x1[i] := 19.98*Random-9.99;
  y1[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  for j := 1 to n1 do
  begin
    r0 := sqrt(sqr(x[i]-x1[j])+sqr(y[i]-y1[j]));
    if amin > r0 then
      begin
        amin := r0;
        bmin := i;
        nmin := j;
      end;
  end;
dataN('N_1 = ',n,3,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i,n0,14,3)+3,2,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+':',x[i],y[i],center(i-n0,n0,14,3)+3,3,6);
dataN('N_2 = ',n1,3,4,1);
n0 := (n1 +1) div 2;
j := n1 mod 2;
for i := 1 to n0 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i,n0,14,3)+3,4,6);
for i := n0+1 to n1 do
  dataR2('B_'+chr(47+i)+':',x1[i],y1[i],center(i-n0,n0,14,3)+3,5,6);
resultR('Distance:',amin,0,2,5);
resultR2('Point of A:',x[bmin],y[bmin],xLeft,4,6);
resultR2('Point of B:',x1[nmin],y1[nmin],xRight,4,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn42(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(2, 0, 0, 0, v1, v2, v3);
taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
taskText('({N}~>~2, points are determined by their coordinates~{x},\;{y}).',0,2);
taskText('Find the point of~{A} such that the sum of distances between this point and',0,3);
taskText('other points of~{A} is minimal and output this point and the corresponding sum.',0,4);
(*
*)
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
amin := 10000;
for i := 1 to n do
  begin
  r0 := 0;
  for j := 1 to n do
    r0 := r0 + sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
    if amin > r0 then
      begin
        amin := r0;
        nmin := i;
      end;
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6);
resultR2('Point coordinates:',x[nmin],y[nmin],25,2,6);
 resultR('Sum of distances: ',amin,25,4,6);
  SetNumberOfTests(5);
Pause;
end;


procedure SArr45Dn43(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
  case v1 of
  1: begin
  n0 := -1;
  amin := -10000;
  taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
  taskText('({N}~>~2, points are determined by their coordinates~{x},\;{y}).',0,2);
  TaskText('Find the maximal perimeter of a\ triangle with vertices belonging to~{A}.', 0, 3);
  TaskText('Output this perimeter and the corresponding vertices (in ascending order', 0, 4);
  TaskText('of their indices in the set~{A}).', 0, 5);
(*
*)
  end;
  2: begin
  n0 := 1;
  amin := 10000;
  taskText('A set~{A} of {N}~points in the coordinate plane is given',0,1);
  taskText('({N}~>~2, points are determined by their coordinates~{x},\;{y}).',0,2);
  TaskText('Find the minimal perimeter of a\ triangle with vertices belonging to~{A}.', 0, 3);
  TaskText('Output this perimeter and the corresponding vertices (in ascending order', 0, 4);
  TaskText('of their indices in the set~{A}).', 0, 5);
(*
*)
  end;
  end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x[i] := 19.98*Random-9.99;
  y[i] := 19.98*Random-9.99;
  end;
for i := 1 to n-2 do
  for j := i + 1 to n-1 do
    for k := j + 1 to n do
      begin
        r0 := sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j])) +
              sqrt(sqr(x[i]-x[k])+sqr(y[i]-y[k])) +
              sqrt(sqr(x[k]-x[j])+sqr(y[k]-y[j]));
       if n0*amin > n0*r0 then
         begin
           amin := r0;
           b[1] := i;
           b[2] := j;
           b[3] := k;
        end;
      end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i,n0,15,4),3,6);
for i := n0+1 to n do
  dataR2('A_'+chr(47+i)+': ',x[i],y[i],center(i-n0,n0,15,4),4,6);
resultR('Perimeter of the triangle:',amin,0,2,6);
resultComment('Coordinates of the triangle vertices:',0,3);
for i := 1 to 3 do
  resultR2(' '+chr(47+i)+': ',x[b[i]],y[b[i]],center(i,3,15,4),4,6);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn44(Name, Key: string);
var
  v1, v2, v3: Byte;
  bln: Boolean;
begin
  Start(Name, Topic8, Author, Key, 46{level2});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  taskText('A set~{A} of {N}~points with integer-valued coordinates~{x},\;{y} is given.',0,2);
  TaskText('The \Iorder in the plane\i is defined as follows:', 0, 3);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q if either {x}_1~<~{x}_2 or {x}_1~=~{x}_2 and {y}_1~<~{y}_2.\]', 0, 4);
  TaskText('Using this order definition, rearrange points of~{A} in ascending order.', 0, 5);

(*
*)
end;
2:
begin
  taskText('A set~{A} of {N}~points with integer-valued coordinates~{x},\;{y} is given.',0,2);
  TaskText('The \Iorder in the plane\i is defined as follows:', 0, 3);
  TaskText('\[({x}_1,\;{y}_1)~<~({x}_2,\;{y}_2),\q if either {x}_1\,+\,{y}_1~<~{x}_2\,+\,{y}_2 '+
         'or {x}_1\,+\,{y}_1~=~{x}_2\,+\,{y}_2 and\ {x}_1~<~{x}_2.\]', 0, 4);
  TaskText('Using this order definition, rearrange points of~{A} in descending order.', 0, 5);

(*
*)
end;
end;
(*==*)
n := 4 + Random(5);
for i:=1 to n do
  begin
  x2[i] := integer(Random(19))-9;
  y2[i] := integer(Random(19))-9;
  end;
for i := 1 to 3 do
  case v1 of
  1:
  x2[Random(n)+1] := x2[Random(n)+1];
  2:
  y2[Random(n)+1] := y2[Random(n)+1];
  end;
dataN('N = ',n,0,2,1);
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i,n0,9,7),3,3);
for i := n0+1 to n do
  dataN2('A_'+chr(47+i)+':',x2[i],y2[i],center(i-n0,n0,9,7),4,3);
for k := 1 to n-1 do
  for i := 1 to n-k do
   begin
     case v1 of
     1: bln := (x2[i]>x2[i+1])or((x2[i]=x2[i+1])and(y2[i]>y2[i+1]));
     2: bln := (x2[i]+y2[i]<x2[i+1]+y2[i+1])or((x2[i]+y2[i]=x2[i+1]+y2[i+1])and(x2[i]<x2[i+1]));
     end;
     if bln then
        begin
          n1 := x2[i];
          x2[i] := x2[i+1];
          x2[i+1] := n1;
          n1 := y2[i];
          y2[i] := y2[i+1];
          y2[i+1] := n1;
        end;
   end;
n0 := (n +1) div 2;
j := n mod 2;
for i := 1 to n0 do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i,n0,9,7),3,3);
for i := n0+1 to n do
  resultN2(chr(47+i)+': ',x2[i],y2[i],center(i-n0,n0,9,7),4,3);
  SetNumberOfTests(5);
Pause;
end;

procedure SArr45Dn45(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 46{level2});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




begin
Topic := 'ONE-DIMENSIONAL ARRAYS';
Topic4 := 'ONE-DIMENSIONAL ARRAYS: CHANGING';
Topic5 := 'WORK WITH SEVERAL ONE-DIMENSIONAL ARRAYS';
Topic6 := 'ONE-DIMENSIONAL ARRAYS: SORTING';
Topic7 := 'ONE-DIMENSIONAL ARRAYS: SERIES OF EQUAL NUMBERS';
Topic8 := 'ONE-DIMENSIONAL ARRAYS: SETS OF POINTS';
{Author := 'M.~E.~Abramyan, 2002';}
end.
