{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SPar40C4;

{$MODE Delphi}

interface

procedure SPar40Cn1(Name, Key: string);
procedure SPar40Cn2(Name, Key: string);
procedure SPar40Cn3(Name, Key: string);
procedure SPar40Cn4(Name, Key: string);
procedure SPar40Cn5(Name, Key: string);
procedure SPar40Cn6(Name, Key: string);
procedure SPar40Cn7(Name, Key: string);
procedure SPar40Cn8(Name, Key: string);
procedure SPar40Cn9(Name, Key: string);
procedure SPar40Cn10(Name, Key: string);
procedure SPar40Cn11(Name, Key: string);
procedure SPar40Cn12(Name, Key: string);
procedure SPar40Cn13(Name, Key: string);
procedure SPar40Cn14(Name, Key: string);
procedure SPar40Cn15(Name, Key: string);
procedure SPar40Cn16(Name, Key: string);
procedure SPar40Cn17(Name, Key: string);
procedure SPar40Cn18(Name, Key: string);
procedure SPar40Cn19(Name, Key: string);
procedure SPar40Cn20(Name, Key: string);
procedure SPar40Cn21(Name, Key: string);
procedure SPar40Cn22(Name, Key: string);
procedure SPar40Cn23(Name, Key: string);
procedure SPar40Cn24(Name, Key: string);
procedure SPar40Cn25(Name, Key: string);
procedure SPar40Cn26(Name, Key: string);
procedure SPar40Cn27(Name, Key: string);
procedure SPar40Cn28(Name, Key: string);
procedure SPar40Cn29(Name, Key: string);
procedure SPar40Cn30(Name, Key: string);
procedure SPar40Cn31(Name, Key: string);
procedure SPar40Cn32(Name, Key: string);
procedure SPar40Cn33(Name, Key: string);
procedure SPar40Cn34(Name, Key: string);
procedure SPar40Cn35(Name, Key: string);
procedure SPar40Cn36(Name, Key: string);
procedure SPar40Cn37(Name, Key: string);
procedure SPar40Cn38(Name, Key: string);
procedure SPar40Cn39(Name, Key: string);
procedure SPar40Cn40(Name, Key: string);

implementation

uses PT5TaskMaker;

const Prepin = ['.','(',')',',',';',':','?','!','-','"'];

var code,code1,code2: byte;
    s : string;
    x0,x1,x2: real;
    k,m,n,n0,n1,n4,n5: integer;
    c,c1,c2,c3: char;
    Topic2,Topic3,Author : string;
    s0,s1,s2: shortstring;

function stroka(N : integer) : string;
const c : string = '          (){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
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
'abcdefghijklmnopqrstuvwxyz';
k := length(c0);
for i:=1 to N do
  s := s + c0[Random(k)+1];
stroka1 := s;
end;
function stroka_(N : integer) : string;
const c : string = '(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
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





procedure SPar40Cn1(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic2,Author,Key,73{level2});(*DEMO*)
getVariant(4,0,0,0,code,code1,code2);
     s0 := '';
taskText('Write an integer function MinElem({A},\;{N}) that returns',0,2);
taskText('the value of the minimal element of an array~{A} of {N}~integers.',0,3);
taskText('Using this function, find the minimal elements of three given arrays~{A}, {B},~{C}',  0,4);
taskText('whose sizes are~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    k := 200;
    for j := 1 to n do
      begin
        m := 10 + Random(90);
        dataN('',m,Center(j+2,12,2,4),1+i,2);
        if m<k then k := m;
      end;
    resultN('MinElem('+c+', N_'+c+') = ',k,0,1+i,3);
  end;
setNumberOfTests(3);
pause;
end;
procedure SPar40Cn2(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(5,0,0,0,code,code1,code2);
taskText('Write an integer function MaxNum({A},\;{N}) that returns',0,2);
taskText('the order number of the maximal element of an array~{A} of {N}~real numbers.',0,3);
taskText('Using this function, find the order numbers of the maximal elements',  0,4);
taskText('of three given arrays~{A}, {B},~{C} whose sizes are~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    x0 := -100;
    for j := 1 to n do
      begin
        x2 := Random * 9.9;
        dataR('',x2,Center(j+2,12,4,2),1+i,4);
        if x0<x2 then begin x0 := x2; n0 := j; end;
      end;
    resultN('MaxNum('+c+', N_'+c+') = ',n0,0,1+i,2);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn3(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure MinmaxNum({A},\;{N},\;{NMin},\;{NMax}) that finds the order numbers',0,1);
taskText('{NMin} and~{NMax} of the minimal and the maximal element of an array~{A} of {N}~real',0,2);
taskText('numbers (integers~{NMin} and~{NMax} are output parameters). Using this procedure,',0,3);
taskText('find the order numbers of the minimal and the maximal elements of three',  0,4);
taskText('given arrays~{A}, {B},~{C} whose sizes are~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    x0 := 100; x1 := -100;
    for j := 1 to n do
      begin
        x2 := Random * 9.9;
        dataR('',x2,Center(j+2,12,4,2),1+i,4);
        if x0>x2 then begin x0 := x2; n0 := j; end;
        if x1<x2 then begin x1 := x2; n1 := j; end;
      end;
    resultComment(c+':',25,1+i);
    resultN('NMin = ',n0,Center(1,2,9,3),1+i,2);
    resultN('NMax = ',n1,Center(2,2,9,3),1+i,2);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn4(Name, Key: string);
var i,j: integer;
    x : array [1..10] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure Inv({A},\;{N}) that changes the order of elements',0,2);
taskText('of an array~{A} of {N}~real numbers to inverse one (the array~{A} is an input',0,3);
taskText('and output parameter). Using this procedure, change order of elements',0,4);
taskText('of arrays~{A}, {B},~{C} whose sizes are~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    for j := 1 to n do
      begin
        x[j] := Random * 9.9;
        dataR('',x[j],Center(j+2,12,4,2),1+i,4);
      end;
    resultComment(c+':',13,1+i);
    for j := 1 to n do
        resultR('',x[n-j+1],Center(j+2,12,4,2),1+i,4);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn5(Name, Key: string);
var n,k,i,j:integer;
    a,a1 : array[1..10] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(6,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('Write a\ procedure Smooth1({A},\;{N}) that performs \Ismoothing\i an array~{A}', 0,1);
taskText('of {N}~real numbers as follows: each element~{A}_{K} is replaced with', 0,2);
taskText('the average of initial values of {K}~first elements of the given array~{A}.', 0,3);
taskText('The array~{A} is an input and output parameter. Using five calls', 0,4);
taskText('of this procedure, perform smoothing a\ given array~{A} of {N}~real numbers',  0,5);
taskText('five times successively; output array elements after each smoothing.',  0,0);
(*
*)
   end;
1: begin
taskText('Write a\ procedure Smooth2({A},\;{N}) that performs \Ismoothing\i an array~{A}', 0,1);
taskText('of {N}~real numbers as follows: an element {A}_{1} remains unchanged;', 0,2);
taskText('elements {A}_{K} ({K}~=~2,\;\.,\;{N}) is replaced with the average', 0,3);
taskText('of initial values of elements~{A}_{K\-1} and~{A}_{K}. The array~{A} is', 0,4);
taskText('an input and output parameter. Using five calls of this procedure,',  0,5);
taskText('perform smoothing a\ given array~{A} of {N}~real numbers five times',  0,0);
taskText('successively; output array elements after each smoothing.',  0,0);
(*
*)
   end;
end;
(*==*)
n := 0;
case Random(5) of
0: n := 1;
1: n := 2;
2..4: n := 3 + Random(8);
end;
case curtest of //2012
2: n := 2;
4: n := 3 + Random(8);
5: n := 1;
end;
dataN('N = ',n,0,2,1);
dataComment('  A:',Center(1,n+1,4,2),4);
for j := 1 to n do
  begin
    a[j] := RandomR2(0.1,9.9); //Random * 9.9; //2018
    dataR('',a[j],Center(j+1,n+1,4,2),4,4);
  end;
for i := 1 to 5 do
  begin
  for j := 1 to n do
    a1[j] := a[j];
  case code of
  0:
  for j := 1 to n do
  begin
    for k := 1 to j -1 do
      a[j] := a[j] + a1[k];
    a[j] := a[j]/j
  end;
  1:
      for j := 2 to n do
        a[j] := (a1[j-1]+a1[j])/2;
  end;
  str(i,s);
  resultComment('('+s+'):',Center(1,n+1,4,2),i);
  for j := 1 to n do
    resultR('',a[j],Center(j+1,n+1,4,2),i,4);
  end;
setNumberOfTests(7);
Pause;
end;
procedure SPar40Cn6(Name, Key: string);
var a,a1 : array[1..10] of real;
    i,j:integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure Smooth3({A},\;{N}) that performs \Ismoothing\i an array~{A}', 0,1);
taskText('of {N}~real numbers as follows: each array element is replaced with', 0,2);
taskText('the average of initial values of this element and its neighbors.', 0,3);
taskText('The array~{A} is an input and output parameter. Using five calls', 0,4);
taskText('of this procedure, perform smoothing a\ given array~{A} of {N}~real numbers', 0,5);
taskText('five times successively; output array elements after each smoothing.',  0,0);
(*
*)
(*==*)
case Random(5) of
0: n := 1;
1: n := 2;
2..4: n := 3 + Random(8);
end;
case curtest of //2012
2: n := 1;
3: n := 3 + Random(8);
6: n := 2;
end;
dataN('N = ',n,0,2,1);
dataComment('  A:',Center(1,n+1,4,2),4);
for j := 1 to n do
  begin
    a[j] := RandomR2(0.1,9.9); //Random * 9.9; //2018
    dataR('',a[j],Center(j+1,n+1,4,2),4,4);
  end;
for i := 1 to 5 do
  begin
  for j := 1 to n do
    a1[j] := a[j];
  if n>1 then
    begin
      a[1]:= (a1[1]+a1[2])/2;
      a[n]:= (a1[n-1]+a1[n])/2;
      for j := 2 to n-1 do
        a[j] := (a1[j-1]+a1[j]+a1[j+1])/3;
    end;
  str(i,s);
  resultComment('('+s+'):',Center(1,n+1,4,2),i);
  for j := 1 to n do
    resultR('',a[j],Center(j+1,n+1,4,2),i,4);
  end;
setNumberOfTests(7);
Pause;
end;
procedure SPar40Cn7(Name, Key: string);
var i,j: integer;
    x : array [1..10] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure RemoveX({A},\;{N},\;{X}) that removes all elements',0,1);
taskText('equal an integer~{X} from an array~{A} of {N}~integers. The array~{A}',0,2);
taskText('and its size~{N} are input and output parameters. Using this procedure,',0,3);
taskText('remove elements with given values~{X}_A, {X}_B,~{X}_C from three',  0,4);
taskText('given arrays~{A}, {B},~{C} of size~{N}_A, {N}_B,~{N}_C respectively and output',  0,5);
taskText('the new size and elements of each changed array.',  0,0);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n0 := Random(10);
    dataN('X_'+c+' = ',n0,3,1+i,1);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,14,1+i,2);
    dataComment(c+': ',26,1+i);
    n1 := n;
    for j := 1 to n do
      begin
        x[j] := Random(10);
        if Random(5)=0 then x[j] := n0;
        dataN('',x[j],Center(j+5,15,1,4)+1,1+i,1);
        if x[j]=n0 then dec(n1);
      end;
    resultN('N_'+c+' = ',n1,14,1+i,2);
    resultComment(c+': ',26,1+i);
    n5 := 0;
    for j := 1 to n do
      if x[j]<>n0 then
        begin
          inc(n5);
          resultN('',x[j],Center(n5+5,15,2,3)+1,1+i,2);
        end;
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar40Cn8(Name, Key: string);
var i,j: integer;
    x,x1 : array [1..10] of real;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure RemoveForInc({A},\;{N}) that removes some elements', 0, 1);
  TaskText('from an array~{A} of {N}~real numbers so that the values of elements', 0, 2);
  TaskText('being remained were in ascending order: the first element remains unchanged,', 0, 3);
  TaskText('the second element must be removed if its value is less than the value', 0, 4);
  TaskText('of the first one, the third element must be removed if its value is less', 0, 5);
  TaskText('than the value of the previous element being remained, and so\ on.', 0, 0);
  TaskText('For instance, the array of elements~5.5, 2.5, 4.6, 7.2, 5.8,~9.4 must', 0, 0);
  TaskText('be changed to~5.5, 7.2,~9.4. All procedure parameters are input and output', 0, 0);
  TaskText('ones. Using this procedure, change three given arrays~{A}, {B},~{C}', 0, 0);
  TaskText('whose sizes are~{N}_A, {N}_B,~{N}_C respectively and output', 0, 0);
  TaskText('the new size and elements of each changed array.', 0, 0);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(6)+5;
    dataN('N_'+c+' = ',n,3,1+i,2);
    dataComment(c+': ',15,1+i);
    n1 := 1;
    x[1] := Random * 9.9;
    x1[1] := x[1];
    dataR('',x[1],Center(3,12,4,2)+2,1+i,4);
    for j := 2 to n do
      begin
        x[j] := Random * 9.9;
        if x[j]>x1[n1] then
        begin
          inc(n1);
          x1[n1] := x[j];
        end;
        dataR('',x[j],Center(j+2,12,4,2)+2,1+i,4);
      end;
    resultN('N_'+c+' = ',n1,3,1+i,2);
    resultComment(c+': ',15,1+i);
    for j := 1 to n1 do
        resultR('',x1[j],Center(j+2,12,4,2)+2,1+i,4);
  end;
setNumberOfTests(3);
Pause;
end;



procedure SPar40Cn9(Name, Key: string);
var i,j: integer;
    x : array [1..20] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure DoubleX({A},\;{N},\;{X}) that doubles occurrences',0,1);
taskText('of all elements equal an integer~{X} for an array~{A} of {N}~integers.',0,2);
taskText('The array~{A} and its size~{N} are input and output parameters.',0,3);
taskText('Using this procedure, double occurrences of elements with given',  0,4);
taskText('values~{X}_A, {X}_B,~{X}_C for three given arrays~{A}, {B},~{C} of size~{N}_A, {N}_B,~{N}_C',  0,5);
taskText('respectively and output the new size and elements of each changed array.',  0,0);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n0 := Random(10);
    dataN('X_'+c+' = ',n0,3,1+i,1);
    repeat
    n := Random(10)+1;
    n1 := n;
    for j := 1 to n do
      begin
        x[j] := Random(10);
        if Random(5)=0 then x[j] := n0;
        if x[j]=n0 then inc(n1);
      end;
    until n1 <= 16;
    dataN('N_'+c+' = ',n,14,1+i,2);
    dataComment(c+': ',26,1+i);
    for j := 1 to n do
        dataN('',x[j],Center(j+5,15,1,4)+1,1+i,1);
    resultN('N_'+c+' = ',n1,14,1+i,2);
    resultComment(c+': ',26,1+i);
    n5 := 0;
    n4 := 5;
    if n1>9 then n4 := 3;
    for j := 1 to n do
        begin
          inc(n5);
          resultN('',x[j],30+(n5-1)*n4,1+i,2);
          if x[j]=n0 then
            begin
              inc(n5);
              resultN('',x[j],30+(n5-1)*n4,1+i,2);
            end;
        end;
  end;
setNumberOfTests(3);
Pause;
end;




procedure SPar40Cn10(Name, Key: string);
var i,j,k,n0 : integer;
    x : array [1..10] of real;
    ind: array [1..10] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(6,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Write a\ procedure SortArray({A},\;{N}) that sorts an array~{A}',0,2);
taskText('of {N}~real numbers in ascending order. The array~{A} is an input',0,3);
taskText('and output parameter. Using this procedure, sort three given arrays~{A}, {B},~{C}',0,4);
taskText('of size~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
  end;
2: begin
taskText('Write a\ procedure SortIndex({A},\;{N},\;{I}) that creates an \Iindex array\i~{I}',0,1);
taskText('for an array~{A} of {N}~real numbers. The index array contains order numbers',0,2);
taskText('of elements of array~{A} so that they correspond to array elements',0,3);
taskText('in ascending order of their values (the array~{A} remains unchanged).',0,4);
taskText('The index array~{I} is an output parameter. Using this procedure, create',0,5);
taskText('index arrays for three given arrays~{A}, {B},~{C} of size~{N}_A, {N}_B,~{N}_C respectively.',0,0);
(*
*)
  end;
end;
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,2);
    dataComment(c+': ',15,1+i);
    for j := 1 to n do
      begin
        x[j] := Random * 9.9;
        ind[j] := j;
        dataR('',x[j],Center(j+2,12,4,2)+2,1+i,4);
      end;
    case code of
    1:
    begin
    for n0 := 1 to n-1 do
      for j := 1 to n-n0 do
        if x[j]>x[j+1] then
          begin x0 := x[j]; x[j] := x[j+1]; x[j+1] := x0; end;
    resultComment(c+':',15,1+i);
    for j := 1 to n do
        resultR('',x[j],Center(j+2,12,4,2)+2,1+i,4);
    end;
    2:
    begin
    for n0 := 1 to n-1 do
      for j := 1 to n-n0 do
        if x[Ind[j]]>x[Ind[j+1]] then
          begin k := Ind[j]; Ind[j] := Ind[j+1]; Ind[j+1] := k; end;
    resultComment('I_'+c+':',15,1+i);
    for j := 1 to n do
        resultN('',Ind[j],Center(j+2,12,2,4)+2,1+i,2);
    end;
    end;
  end;
setNumberOfTests(3);
Pause;
end;


procedure SPar40Cn11(Name, Key: string);
var i,j,n0 : integer;
    x,x1 : array [1..10] of real;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure Hill({A},\;{N}) that changes order of elements', 0, 1);
  TaskText('of an array~{A} of {N}~real numbers as follows: the minimal element', 0, 2);
  TaskText('of the array must be the first one, an element, whose value is the next', 0, 3);
  TaskText('to minimal value, must be the last one, an element with the next value', 0, 4);
  TaskText('must be the second one, and so\ on (as a\ result, the diagram of values', 0, 5);
  TaskText('of the array elements will be similar to a\ \Ihill\i). The array~{A} is', 0, 0);
  TaskText('an input and output parameter. Using this procedure, change three', 0, 0);
  TaskText('given arrays~{A}, {B},~{C} of size~{N}_A, {N}_B,~{N}_C respectively.', 0, 0);
(*
*)
(*==*)
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,2);
    dataComment(c+': ',15,1+i);
    for j := 1 to n do
      begin
        x[j] := Random * 9.9;
        dataR('',x[j],Center(j+2,12,4,2)+2,1+i,4);
      end;
    for n0 := 1 to n-1 do
      for j := 1 to n-n0 do
        if x[j]>x[j+1] then
          begin x0 := x[j]; x[j] := x[j+1]; x[j+1] := x0; end;
    for j := 1 to n div 2 do
    begin
    x1[j] := x[2*j-1];
    x1[n-j+1] := x[2*j];
    end;
    if Odd(n) then x1[n div 2 + 1] := x[n];
    resultComment(c+':',15,1+i);
    for j := 1 to n do
        resultR('',x1[j],Center(j+2,12,4,2)+2,1+i,4);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar40Cn12(Name, Key: string);
var
  j,k,na,nb: integer;
  x : array [1..10] of real;
  y : array [1..10] of integer;
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1:
begin
  TaskText('Write a\ procedure Split1({A},\;{N}_A,\;{B},\;{N}_B,\;{C},\;{N}_C) that copies elements', 0, 1);
  TaskText('of an array~{A} of {N}_A real numbers to arrays~{B} and~{C} so that the array~{B}', 0, 2);
  TaskText('contains all elements of the array~{A} with odd order numbers (1, 3,~\.)', 0, 3);
  TaskText('and the array~{C} contains all elements of the array~{A} with even order numbers', 0, 4);
  TaskText('(2, 4,~\.). The arrays~{B}, {C} and their sizes~{N}_B, {N}_C are output parameters.', 0, 5);
  TaskText('Apply this procedure to a\ given array~{A} of size~{N}_A and output', 0, 0);
  TaskText('the size and the elements for each of the resulting arrays~{B} and~{C}.', 0, 0);
(*
*)
end;
2:
begin
  TaskText('Write a\ procedure Split2({A},\;{N}_A,\;{B},\;{N}_B,\;{C},\;{N}_C) that copies elements', 0, 1);
  TaskText('of an array~{A} of {N}_A integers to arrays~{B} and~{C} so that the array~{B} contains', 0, 2);
  TaskText('all elements whose values are even numbers and the array~{C} contains', 0, 3);
  TaskText('all elements whose values are odd numbers (in the same order).', 0, 4);
  TaskText('The arrays~{B}, {C} and their sizes~{N}_B, {N}_C are output parameters.', 0, 5);
  TaskText('Apply this procedure to a\ given array~{A} of size~{N}_A and output', 0, 0);
  TaskText('the size and the elements for each of the resulting arrays~{B} and~{C}.', 0, 0);
(*
*)
end;
end;
(*==*)
na := 0;
nb := 0;
n := Random(10)+1;
case v1 of
1: begin
    dataN('N_A = ',n,3,3,2);
    dataComment('A: ',15,3);
    for j := 1 to n do
      begin
        x[j] := Random * 9.9;
        if Odd(j) then inc(na)
        else inc(nb);
        dataR('',x[j],Center(j+2,12,4,2)+2,3,4);
      end;
    resultN('N_B = ',na,3,2,2);
    resultComment('B: ',15,2);
    k := 0;
    for j := 1 to n do
      if Odd(j) then
      begin
        inc(k);
        resultR('',x[j],Center(k+2,12,4,2)+2,2,4);
      end;
    resultN('N_C = ',nb,3,4,2);
    resultComment('C: ',15,4);
    k := 0;
    for j := 1 to n do
      if not Odd(j) then
      begin
        inc(k);
        resultR('',x[j],Center(k+2,12,4,2)+2,4,4);
      end;

  end;
2: begin

    dataN('N_A = ',n,3,3,2);
    dataComment('A: ',15,3);
    for j := 1 to n do
      begin
        y[j] := Random(199)-99;
        if not Odd(y[j]) then inc(na)
        else inc(nb);
        dataN('',y[j],Center(j+2,12,3,3)+2,3,3);
      end;
    resultN('N_B = ',na,3,2,2);
    resultComment('B: ',15,2);
    k := 0;
    for j := 1 to n do
      if not Odd(y[j]) then
      begin
        inc(k);
        resultN('',y[j],Center(k+2,12,3,3)+2,2,3);
      end;
    resultN('N_C = ',nb,3,4,2);
    resultComment('C: ',15,4);
    k := 0;
    for j := 1 to n do
      if Odd(y[j]) then
      begin
        inc(k);
        resultN('',y[j],Center(k+2,12,3,3)+2,4,3);
      end;
  end;
  end;
  setNumberOfTests(5);
Pause;
end;


type TRealMatr = array [1..5,1..10] of real;

procedure ina(var a: TRealMatr; M,N: integer);
var i,j,k:integer;
begin
k := 1;
if M = 5 then k := 0;
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := RandomR2(0.2,9.7); //0.2+Random*9.5; //2018
    dataR('',a[i,j],center(j,N,4,2),i+k,4);
  end;
end;

procedure SPar40Cn13(Name, Key: string);
var
  i,j,m,n,k,v1, v2, v3: Byte;
  a : TRealMatr;
  x : array [1..20] of real;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure ArrayToMatrRow({A},\;{K},\;{M},\;{N},\;{B}) that copies elements', 0, 1);
  TaskText('of an array~{A} of {K}~real numbers to an {M}\;\x\;{N} matrix~{B} (by rows).', 0, 2);
  TaskText('\<Superfluous\> array elements must be ignored; if the size of the array', 0, 3);
  TaskText('is less than the amount of matrix elements then zero value', 0, 4);
  TaskText('must be assigned to remaining matrix elements. Two-dimensional array~{B}', 0, 5);
  TaskText('is an output parameter. Having input an array~{A} of size~{K}, integers~{M}, {N}', 0, 0);
  TaskText('and using this procedure, create a\ matrix~{B} and output its elements.', 0, 0);
(*
*)
(*==*)
m := 2 + Random(3);
n := 2 + Random(4);
k := 5 + Random(6);
for j := 1 to 20 do x[j] := 0;
dataN('K = ',k,3,2,2);
dataComment('A: ',15,2);
for j := 1 to k do
  begin
    x[j] := Random * 9.9;
    dataR('',x[j],Center(j+2,12,4,2)+2,2,4);
  end;
dataN('M = ',m,xLeft,4,1);
dataN('N = ',n,xRight,4,1);
k := 0;
 for i := 1 to m do
     for j := 1 to n do
       begin
       inc(k);
       a[i,j] := x[k];
       end;
for i:=1 to m do
  for j:=1 to n do
    resultR('',a[i,j],center(j,n,4,2),i+1,4);
SetNumberOfTests(8);
Pause;
end;


procedure SPar40Cn14(Name, Key: string);
var
  i,j,m,n,k,v1, v2, v3: Byte;
  a : TRealMatr;
  x : array [1..20] of real;
begin
  Start(Name, Topic2, Author, Key, 73{level2});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure ArrayToMatrCol({A},\;{K},\;{M},\;{N},\;{B}) that copies elements', 0, 1);
  TaskText('of an array~{A} of {K}~real numbers to an {M}\;\x\;{N} matrix~{B} (by columns).', 0, 2);
  TaskText('\<Superfluous\> array elements must be ignored; if the size of the array', 0, 3);
  TaskText('is less than the amount of matrix elements then zero value', 0, 4);
  TaskText('must be assigned to remaining matrix elements. Two-dimensional array~{B}', 0, 5);
  TaskText('is an output parameter. Having input an array~{A} of size~{K}, integers~{M}, {N}', 0, 0);
  TaskText('and using this procedure, create a\ matrix~{B} and output its elements.', 0, 0);
(*
*)
m := 2 + Random(3);
n := 2 + Random(4);
k := 5 + Random(6);
for j := 1 to 20 do x[j] := 0;
dataN('K = ',k,3,2,2);
dataComment('A: ',15,2);
for j := 1 to k do
  begin
    x[j] := Random * 9.9;
    dataR('',x[j],Center(j+2,12,4,2)+2,2,4);
  end;
dataN('M = ',m,xLeft,4,1);
dataN('N = ',n,xRight,4,1);
k := 0;
 for j := 1 to n do
     for i := 1 to m do
       begin
       inc(k);
       a[i,j] := x[k];
       end;
for i:=1 to m do
  for j:=1 to n do
    resultR('',a[i,j],center(j,n,4,2),i+1,4);
SetNumberOfTests(8);
  Pause;
end;


procedure SPar40Cn15(Name, Key: string);
var
  m,n,i,j,k,c: integer;
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure Chessboard({M},\;{N},\;{A}) that creates an {M}\;\x\;{N} matrix~{A}', 0, 2);
  TaskText('whose elements are integers~0 and~1, which are arranged in \<chessboard\> order,', 0, 3);
  TaskText('and {A}_{1,1}~=~0. Two-dimensional array~{A} is an output parameter. Having', 0, 4);
  TaskText('input integers~{M}, {N} and using this procedure, create an {M}\;\x\;{N} matrix~{A}.', 0, 5);
(*
*)
(*==*)
  m := 1 + Random(5);
  n := 1 + Random(8);
dataN('M = ',m,xLeft,3,1);
dataN('N = ',n,xRight,3,1);
k := 1;
if M = 5 then k := 0;
if M = 1 then k := 2;

for i := 1 to M do
begin
  if odd(i) then c := 1
  else c := 0;
  for j := 1 to N do
  begin
    if c = 0 then c := 1
    else c := 0;
    resultN('',c,center(j,N,2,3),i+k,2);
  end;
end;
  SetNumberOfTests(7);
Pause;
end;



procedure SPar40Cn16(Name, Key: string);
var i,j,k,k0 : integer;
    a : TRealMatr;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(7,2,0,0,code,code1,code2);
case Code of
1: begin
     s0 := '1';
taskText('Write a\ real-valued function Norm1({A},\;{M},\;{N}) that computes',0,1);
taskText('the \Inorm\i of an {M}\;\x\;{N} matrix~{A} of real numbers using the formula',0,2);
taskText('\[Norm1({A},\;{M},\;{N})~=~max \{|{A}_{1,J}|\;+\;|{A}_{2,J}|\;+\;\.\;+\;|{A}_{M,J}|\},\]',0,3);
taskText('where the maximum is being found over {J}~=~1,\,\.,\,{N}.',0,4);
taskText('Having input an {M}\;\x\;{N} matrix~{A}, output Norm1({A},\;{K},\;{N}), {K}~=~1,\,\.,\,{M}.',  0,5);
(*
*)
  end;
2: begin
     s0 := '2';
taskText('Write a\ real-valued function Norm2({A},\;{M},\;{N}) that computes',0,1);
taskText('the \Inorm\i of an {M}\;\x\;{N} matrix~{A} of real numbers using the formula',0,2);
taskText('\[Norm2({A},\;{M},\;{N})~=~max \{|{A}_{I,1}|\;+\;|{A}_{I,2}|\;+\;\.\;+\;|{A}_{I,N}|\},\]',0,3);
taskText('where the maximum is being found over {I}~=~1,\,\.,\,{M}.',0,4);
taskText('Having input an {M}\;\x\;{N} matrix~{A}, output Norm2({A},\;{K},\;{N}), {K}~=~1,\,\.,\,{M}.',  0,5);
(*
*)
  end;
end;
(*==*)
m := 2 + Random(4);
n := 2 + Random(7);
ina(a,M,N);
{  for i:=1 to M do
  for j:=1 to N do
    a[i,j] := 10 * Random;
dataN('M = ',m,xLeft,1,1);
dataN('N = ',n,xRight,1,1);

for i:=1 to m do
  for j:=1 to n do
    dataR('',a[i,j],center(j,n,4,3),i+1,4);}
k0 := 1;
if M = 5 then k0 := 0;

for k:=1 to m do
  begin
    x0 := 0;
    case Code of
    1:for j := 1 to n do
        begin
          x1 := 0;
          for i := 1 to k do
            x1 := x1 + abs(a[i,j]);
          if x1>x0 then x0 := x1;
        end;
    2:for i := 1 to k do
        begin
          x1 := 0;
          for j := 1 to n do
            x1 := x1 + abs(a[i,j]);
          if x1>x0 then x0 := x1;
        end;
    end;
    resultR('Norm'+s0+'(A, '+chr(48+k)+', '+chr(48+n)+') = ',x0,0,k+k0,5);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn17(Name, Key: string);
var i,j,l : integer;
    k : array [1..3] of integer;
    a : TRealMatr;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
m := 2 + Random(4);
n := 2 + Random(6);
case Code of
1: begin
     s0 := 'Row';
     n0 := m;
taskText('Write a\ real-valued function SumRow({A},\;{M},\;{N},\;{K}) that returns',0,1);
taskText('the sum of elements in \Um{K}-th\um row of an {M}\;\x\;{N} matrix~{A} of real numbers',0,2);
taskText('(if~{K} is out of the range~1 to~{M} then the function returns~0).',0,3);
taskText('Output the return value of SumRow({A},\;{M},\;{N},\;{K})',0,4);
taskText('for a\ given {M}\;\x\;{N} matrix~{A} and three given integers~{K}.',0,5);
(*
*)
  end;
2: begin
     s0 := 'Col';
     n0 := n;
taskText('Write a\ real-valued function SumCol({A},\;{M},\;{N},\;{K}) that returns',0,1);
taskText('the sum of elements in \Um{K}-th\um column of an {M}\;\x\;{N} matrix~{A} of real numbers',0,2);
taskText('(if~{K} is out of the range~1 to~{N} then the function returns~0).',0,3);
taskText('Output the return value of SumCol({A},\;{M},\;{N},\;{K})',0,4);
taskText('for a\ given {M}\;\x\;{N} matrix~{A} and three given integers~{K}.',0,5);
(*
*)
  end;
end;
(*==*)
ina(a,M,N);
dataComment('K:',64,5);
for i := 1 to 3 do
  begin
  k[i] := random(n0+3)+1;
  dataN('',k[i],63+4*i,5,2);
  end;
{dataN('M = ',m,center(1,5,6,6),1,1);
dataN('N = ',n,center(2,5,6,6),1,1);
for i:=1 to M do
  for j:=1 to N do
    a[i,j] := 10 * Random;

for i:=1 to m do
  for j:=1 to n do
    dataR('',a[i,j],center(j,n,4,3),i+1,4);}

for l:=1 to 3 do
  begin
    x0 := 0;
    if k[l]<=n0 then
    case Code of
    1:for j := 1 to n do
          x0 := x0 + a[k[l],j];
    2:for i := 1 to m do
          x0 := x0 + a[i,k[l]];
    end;
    resultR('Sum'+s0+'(A, M, N, K_'+chr(48+l)+') = ',x0,0,l+1,5);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn18(Name, Key: string);
var i,j,k0 : integer;
    k : array [1..2] of integer;
    a : TRealMatr;{array [1..4,1..10] of real;}
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
  m := 2 + Random(4);
  n := 2 + Random(6);
case Code of
1: begin
{     s0 := 'Row';
     s1 := 'ÒÚÓÍ';
     s3 := 'ÒÚÓÍË';
     s2 := 'M';}
     n0 := m;
taskText('Write a\ procedure SwapRow({A},\;{M},\;{N},\;{K}_1,\;{K}_2) that exchanges',0,1);
taskText('\Um{K}_1-th\um and~\Um{K}_2-th\um row of an {M}\;\x\;{N} matrix~{A} of real numbers. The matrix~{A}',0,2);
taskText('is an input and output parameter; if~{K}_1 or~{K}_2 are out of the range~1 to~{M}',0,3);
taskText('then the matrix remains unchanged. Having input an {M}\;\x\;{N} matrix~{A}',0,4);
taskText('and two integers~{K}_1, {K}_2 and using this procedure, exchange',0,5);
taskText('\Um{K}_1-th\um and~\Um{K}_2-th\um row of the matrix~{A}.',0,0);
(*
*)
  end;
2: begin
{     s0 := 'Col';
     s1 := 'ÒÚÓÎ·ˆÓ‚';
     s3 := 'ÒÚÓÎ·ˆ˚';
     s2 := 'N';}
     n0 := n;
taskText('Write a\ procedure SwapCol({A},\;{M},\;{N},\;{K}_1,\;{K}_2) that exchanges',0,1);
taskText('\Um{K}_1-th\um and~\Um{K}_2-th\um column of an {M}\;\x\;{N} matrix~{A} of real numbers. The matrix~{A}',0,2);
taskText('is an input and output parameter; if~{K}_1 or~{K}_2 are out of the range~1 to~{N}',0,3);
taskText('then the matrix remains unchanged. Having input an {M}\;\x\;{N} matrix~{A}',0,4);
taskText('and two integers~{K}_1, {K}_2 and using this procedure, exchange',0,5);
taskText('\Um{K}_1-th\um and~\Um{K}_2-th\um column of the matrix~{A}.',0,0);
(*
*)
  end;
end;
(*==*)
  ina(a,M,N);
  k[1] := random(n0+1)+1;
  dataN('K_1 = ',k[1],63,5,1);
  repeat
  k[2] := random(n0+1)+1;
  until k[2]<>k[1];
  dataN('K_2 = ',k[2],71,5,1);
  if (k[1]<=n0)and(k[2]<=n0) then
    case Code of
    1:for j := 1 to n do
        begin
          x0 := a[k[1],j];
          a[k[1],j]:=a[k[2],j];
          a[k[2],j]:=x0;
        end;
    2:for i := 1 to m do
        begin
          x0 := a[i,k[1]];
          a[i,k[1]]:=a[i,k[2]];
          a[i,k[2]]:=x0;
        end;
    end;
k0 := 1;
if M = 5 then k0 := 0;
for i:=1 to m do
  for j:=1 to n do
    resultR('',a[i,j],center(j,n,4,2),i+k0,4);
setNumberOfTests(5);
Pause;
end;
procedure SPar40Cn19(Name, Key: string);
var i,j : integer;
    a : array [1..5,1..5] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure Transp({A},\;{M}) that \Itransposes\i a\ real-valued',0,2);
taskText('square matrix~{A} of order~{M} (that is, reflects its elements about',0,3);
taskText('the main diagonal). The matrix~{A} is an input and output parameter.',0,4);
taskText('Using this procedure, transpose the given matrix~{A} of order~{M}.',0,5);
(*
*)
(*==*)
m := 2 + Random(4);
dataN('M = ',m,10,1,1);
for i:=1 to m do
  for j:=1 to m do
    a[i,j] := 0.2+Random*9.5;
for i:=1 to m do
  for j:=1 to m do
    dataR('',a[i,j],center(j,m,4,2),i+1-m div 5,4);
for i:=1 to m do
  for j:=1 to m do
    resultR('',a[j,i],center(j,m,4,2),i+1-m div 5,4);
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn20(Name, Key: string);
var a: TRealMatr;{array[1..4,1..10] of real;}
    k,k1,k2,i,i2,j: integer;
    v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,73{level2});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Write a\ procedure RemoveRows({A},\;{M},\;{N},\;{K}_1,\;{K}_2) that removes rows',0,1);
taskText('with the order numbers in the range~{K}_1 to~{K}_2 from an {M}\;\x\;{N} matrix~{A}',0,2);
taskText('of real numbers (integers~{K}_1 and~{K}_2 are assumed to satisfy the double',0,3);
taskText('inequality 1~<~{K}_1~\l~{K}_2). If {K}_1~>~{M} then the matrix remains unchanged,',0,4);
taskText('if {K}_2~>~{M} then rows with numbers from~{K}_1 to~{M} must be removed. Two-dimensional',0,5);
taskText('array~{A} and integers~{M}, {N} are input and output parameters. Having input',0,0);
taskText('an {M}\;\x\;{N} matrix~{A} and two integers~{K}_1, {K}_2 and using this procedure,',0,0);
taskText('remove rows with the order numbers in the range~{K}_1 to~{K}_2 from the given',0,0);
taskText('matrix and output a new order and elements of the resulting matrix.',0,0);
(*
*)
end;
2: begin
taskText('Write a\ procedure RemoveCols({A},\;{M},\;{N},\;{K}_1,\;{K}_2) that removes columns',0,1);
taskText('with the order numbers in the range~{K}_1 to~{K}_2 from an {M}\;\x\;{N} matrix~{A}',0,2);
taskText('of real numbers (integers~{K}_1 and~{K}_2 are assumed to satisfy the double',0,3);
taskText('inequality 1~<~{K}_1~\l~{K}_2). If {K}_1~>~{N} then the matrix remains unchanged,',0,4);
taskText('if {K}_2~>~{N} then rows with numbers from~{K}_1 to~{N} must be removed. Two-dimensional',0,5);
taskText('array~{A} and integers~{M}, {N} are input and output parameters. Having input',0,0);
taskText('an {M}\;\x\;{N} matrix~{A} and two integers~{K}_1, {K}_2 and using this procedure,',0,0);
taskText('remove columns with the order numbers in the range~{K}_1 to~{K}_2 from the given',0,0);
taskText('matrix and output a new order and elements of the resulting matrix.',0,0);
(*
*)
end;
end;
(*==*)
m := 2 + Random(4);
n := 3 + Random(5);
ina(a,M,N);
k1 := 0; k2 := 0;
case v1 of
1: k1 := 2 + Random(m);
2: k1 := 2 + Random(n);
end;
case Random(3) of
0: k2 := k1;
1: k2 := k1 + 1;
2: k2 := k1 + Random(4);
end;
case curtest of //2012
3: k2 := k1 + 1;
5: k2 := k1;
6: k2 := k1 + Random(4);
end;
dataN('K_1 = ',k1,63,5,1);
dataN('K_2 = ',k2,71,5,1);
case v1 of
1: begin
k := m;
if k1 <= m then
begin
k := k1 - 1;
for i := k2+1 to m do
  begin
  inc(k);
  for j := 1 to n do
    a[k,j] := a[i,j];
  end;
end;
m := k;
end;
2: begin
k := n;
if k1 <= n then
begin
k := k1 - 1;
for j := k2+1 to n do
  begin
  inc(k);
  for i := 1 to m do
    a[i,k] := a[i,j];
  end;
end;
n := k;
end;
end;
i2 := 1;
if m=5 then i2 := 0;
if m=1 then i2 := 2;
resultN('M =',m,3,1,2);
resultN('N =',n,10,1,2);
for i := 1 to m do
  for j := 1 to n do
    resultR('',a[i,j],center(j,n,4,2),i+i2,4);
setNumberOfTests(7);
Pause;
end;
procedure SPar40Cn21(Name, Key: string);
var a: TRealMatr;{array[1..4,1..10] of real;}
    i,j,i0,j0,i1,j1,i2: integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Write a\ procedure RemoveRowCol({A},\;{M},\;{N},\;{K},\;{L}) that removes \Um{K}-th\um row',0,1);
taskText('and \Um{L}-th\um column simultaneously from an {M}\;\x\;{N} matrix~{A} of real numbers',0,2);
taskText('(integers~{K} and~{L} are assumed to satisfy the inequalities {M}~>~1, {N}~>~1).',0,3);
taskText('If {K}~>~{M} or~{L}~>~{N} then the matrix remains unchanged. Two-dimensional',0,4);
taskText('array~{A} and integers~{M}, {N} are input and output parameters. Having input',0,5);
taskText('an {M}\;\x\;{N} matrix~{A} and two integers~{K}, {L}, apply this procedure to the given',0,0);
taskText('matrix and output a\ new order and elements of the resulting matrix.',0,0);
(*
*)
(*==*)
m := 2 + Random(4);
n := 2 + Random(6);
ina(a,M,N);
i0 := 0; j0 := 0;
case Random(4) of
0,1 : begin i0 := 1+Random(m); j0 := 1+Random(n); end;
2   : begin i0 := 1+Random(m); j0 := 1+n+Random(3); end;
3   : begin i0 := 1+m+Random(3); j0 := 1+Random(n); end;
end;
case curtest of //2012
2   : begin i0 := 1+Random(m); j0 := 1+n+Random(3); end;
3   : begin i0 := 1+Random(m); j0 := 1+Random(n); end;
5   : begin i0 := 1+m+Random(3); j0 := 1+Random(n); end;
end;
dataN('K = ',i0,65,5,1);
dataN('L = ',j0,72,5,1);
{dataN('M = ',m,center(1,4,5,4)-10,1,1);
dataN('N = ',n,center(2,4,5,4)-10,1,1);
for i := 1 to m do
  for j := 1 to n do
    begin
      a[i,j] := Random*9.9;
      dataR('',a[i,j],center(j,n,4,3),i+i2,4);
    end;}
i1 := 0;
i2 := 1;
if m=5 then i2 := 0;
if (i0<=m)and(j0<=n) then
begin
resultN('M =',m-1,3,1,2);
resultN('N =',n-1,10,1,2);
  for i := 1 to m do
    begin
    if m=2 then i2 := 2
    else i2 := 1;
    j1 := 0;
    if i0=i then i1 := 1
    else
    for j := 1 to n do
      begin
      if j0=j then j1 := 1
      else resultR('',a[i,j],center(j-j1,n-1,4,2),i+i2-i1,4);
      end;
    end;
end
else
begin
resultN('M =',m,3,1,2);
resultN('N =',n,10,1,2);
for i := 1 to m do
  for j := 1 to n do
      resultR('',a[i,j],center(j,n,4,2),i+i2,4);
end;
setNumberOfTests(7);
Pause;
end;

procedure SPar40Cn22(Name, Key: string);
var v1,v2,v3 : byte;
    b: Boolean;
    i,j,i1,j1,i2,a0: integer;
    a: array [1..5,1..8] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Write a\ procedure SortCols({A},\;{M},\;{N}) that rearrange columns of an {M}\;\x\;{N}',0,1);
taskText('matrix~{A} of integers in ascending \Ilexicographic order\i (that is, for comparison',0,2);
taskText('of two columns their first distinct elements with the equal order numbers',0,3);
taskText('must be compared). Two-dimensional array~{A} is an input and output',0,4);
taskText('parameter. Using this procedure, sort columns of a\ given {M}\;\x\;{N} matrix~{A}.',0,5);
(*
*)
(*==*)
  m := 2 + Random(4);
  n := 2 + Random(7);
dataN('M = ',m,3,1,1);
dataN('N = ',n,10,1,1);
k := 1;
if M = 5 then k := 0;
if M = 1 then k := 2;

for i := 1 to M do
  for j := 1 to N do
  begin
    a[i,j] := 1 + Random(5);
    dataN('',a[i,j],center(j,N,2,3),i+k,2);
  end;
for i1 := 1 to n-1 do
  for j1 := 1 to n - i1 do
  begin
    b := false;
    for i2 := 1 to m do
    if a[i2,j1]<a[i2,j1+1] then break
    else
      if a[i2,j1]>a[i2,j1+1] then
      begin
      b := true;
      break
      end;
    if b then
      for i2 := 1 to m do
      begin
        a0 := a[i2,j1];
        a[i2,j1] := a[i2,j1+1];
        a[i2,j1+1] := a0;
      end;
   end;
for i := 1 to M do
  for j := 1 to N do
    resultN('',a[i,j],center(j,N,2,3),i+k,2);
setNumberOfTests(8);
Pause;
end;

procedure SPar40Cn23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ',0,3);
(*
*)
dataS('','»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈',0,3);
resultS('','–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈',0,3);
setNumberOfTests(5);
pause;
end;


const c_1: string = '0123456789';
      c_2: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
                    'abcdefghijklmnopqrstuvwxyz';
      c_3: string = '!@#$%^&*()-=+|\?/.,<>`~;:"';
      c_4: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c_5: string = 'abcdefghijklmnopqrstuvwxyz';


procedure SPar40Cn24(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,73{level2});(*DEMO*)
taskText('Write an integer function IsIdent({S}) that indicates whether a\ string~{S}',0,1);
taskText('is a\ valid \Iidentifier\i, that is, a\ nonempty string that does not begin',0,2);
taskText('with a\ digit and contains Latin letters, digits, and a character \<\_\> only.',0,3);
taskText('If~{S} is a\ valid identifier then the function returns~0. If~{S} is an empty',0,4);
taskText('string or begins with a\ digit then the function returns~\-1 or~\-2 respectively.',0,5);
taskText('If~{S} contains invalid characters then the function returns the order number',0,0);
taskText('of the first invalid character. Using this function, check five given strings.',0,0);
(*
*)
for i := 1 to 5 do
  begin
    s := '';
    for j := 1 to Random(10)+1 do
      case Random(3) of
      0: s := s + c_1[1+Random(length(c_1))];
      1: s := s + c_2[1+Random(length(c_2))];
      2: s := s + '_';
      end;
    if Random(2)=0 then
      case Random(4) of
      0: s := '';
      1: s[1] := c_1[1+Random(length(c_1))];
      2,3: for j := 1 to 1+Random(3) do
{           case Random(2) of
           0:} s[1+Random(length(s))] := c_3[1+Random(length(c_3))];
{           1: s[1+Random(length(s))] := c4[1+Random(length(c_4))];
           end;}
      end;
    n := 0;
    if s='' then n := -1
    else
    if s[1] in ['0'..'9'] then n := -2
    else
      for j:=1 to length(s) do
        if not (s[j] in ['0'..'9','A'..'Z','a'..'z','_']) then
          begin
            n := j;
            break;
          end;
    dataS('',s,14*i-6,3);
    resultN('',n,14*i-5,3,2);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPar40Cn25(Name, Key: string);
const c1 : string = '*<>-=+|^. ';
var i: integer;
    cs,cs1 : char;
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Write a\ string function FillStr({S},\;{N}) that returns a\ string of length~{N}',0,1);
taskText('containing repeating copies of the \Itemplate string\i~{S} (the last copy',0,2);
taskText('of~{S} may be contained partially in the resulting string). Having input',0,3);
taskText('an integer~{N} and five template strings and using this function,',0,4);
taskText('create five resulting strings of length~{N}.',0,5);
(*
*)
(*==*)
n := 40 + Random(31);
dataN('N = ',n,0,2,2);
for i := 1 to 5 do
  begin
    m := Random(5);
    cs := c1[1+Random(10)];
    cs1 := c1[1+Random(10)];
    case m of
    0: s := cs;
    1: s := cs + cs1;
    2: s := cs + cs1 + cs;
    3: s := cs + cs1 + cs1 + cs;
    4: s := cs + cs1 + c1[1+Random(10)] + cs1 + cs;
    end;
    Str(i,s1);
    dataS('S_'+s1+' = ',s,center(i,5,10,5),4);
    s1 := '';
    repeat
    s1 := s1 + s
    until length(s1)>n;
    resultS('',Copy(s1,1,n),0,i);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar40Cn26(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Write a\ procedure UpCaseLat({S}) that converts all Latin small letters',0,2);
taskText('of a\ string~{S} to uppercase (others characters of~{S} must remain unchanged).',0,3);
taskText('A\ string~{S} is an input and output parameter.',  0,4);
taskText('Using this procedure, process five given strings.',  0,5);
(*
*)
  end;
2: begin
taskText('Write a\ procedure LowCaseLat({S}) that converts all Latin capital letters',0,2);
taskText('of a\ string~{S} to lowercase (others characters of~{S} must remain unchanged).',0,3);
taskText('A\ string~{S} is an input and output parameter.',  0,4);
taskText('Using this procedure, process five given strings.',  0,5);
(*
*)
  end;
end;
(*==*)
for i := 1 to 5 do
  begin
  s := stroka(Random(40)+10);
  dataS('',s,0,i);
  for j := 1 to length(s) do
    if Code = 1 then
    begin
    k := Pos(s[j],c_5);
    if k <> 0 then s[j] := c_4[k];
    end
    else
    begin
    k := Pos(s[j],c_4);
    if k <> 0 then s[j] := c_5[k];
    end;
  resultS('',s,0,i);
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn27(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,2,0,0,code,code1,code2);
case code of
1: begin
taskText('Write a\ procedure TrimLeftC({S},\;{C}) that removes all leading characters',0,2);
taskText('equal a\ character~{C} from a\ string~{S}. A\ string~{S} is an input',0,3);
taskText('and output parameter. Having input a\ character~{C} and five strings',  0,4);
taskText('and using this procedure, process the given strings.',  0,5);
(*
*)
   end;
2: begin
taskText('Write a\ procedure TrimRightC({S},\;{C}) that removes all trailing characters',0,2);
taskText('equal a\ character~{C} from a\ string~{S}. A\ string~{S} is an input',0,3);
taskText('and output parameter. Having input a\ character~{C} and five strings',  0,4);
taskText('and using this procedure, process the given strings.',  0,5);
(*
*)
   end;
end;
(*==*)
c := c_3[1+Random(Length(c_3))];
dataC('C = ',c,3,1);
for i := 1 to 5 do
  begin
  s := stroka1(Random(30)+10,c);
  if Random(4)=0 then s := c+c+c+c+c+c+c+c+c+c+c;
  for j := 1 to Random(6) do
    s :=  c+s;
  for j := 1 to Random(6) do
    s :=  s+ c;
  dataS('',s,0,i);
  case code of
  1:
  while (length(s)>0)and(s[1]=c) do delete(s,1,1);
  2:
  while (length(s)>0)and(s[length(s)]=c) do delete(s,length(s),1);
  end;
  resultS('',s,0,i);
  end;
setNumberOfTests(3);
Pause;
end;


function inv(s: string): string;
var i: integer;
    s0: string;
begin
s0 := '';
for i := 1 to length(s) do
  s0 := s[i] + s0;
inv := s0;
end;

procedure SPar40Cn28(Name, Key: string);
var
  i,k,p: integer;
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ string function InvStr({S},\;{K},\;{N}) that returns an inverted', 0, 1);
  TaskText('substring of a\ string~{S}. The substring contains {N}~characters of~{S}', 0, 2);
  TaskText('(starting at a\ character with the order number~{K}) in inverse order. If~{K}', 0, 3);
  TaskText('is greater than the length of~{S} then the function returns an empty string;', 0, 4);
  TaskText('if the length of~{S} is less than {K}\,+\,{N} then all characters of~{S} starting', 0, 5);
  TaskText('at its \Um{K}-th\um character must be inverted. Output return values of this', 0, 0);
  TaskText('function for a given string~{S} and each of three pairs', 0, 0);
  TaskText('of positive integers ({K}_1,\;{N}_1), ({K}_2,\;{N}_2), ({K}_3,\;{N}_3).', 0, 0);
(*
*)
(*==*)
n := Random(40)+10;
s := stroka(n);
dataS('S: ',s,0,2);
for i := 1 to 3 do
  begin
    k := random(n+2)+1;
    p := 1 + random(15);
    dataN2('K_'+chr(48+i)+', N_'+chr(48+i)+':',k,p,center(i,3,13,10),4,3);
    resultS('InvStr(S, K_'+chr(48+i)+', N_'+chr(48+i)+') = ',inv(copy(s,k,p)),25,i+1);
  end;
  SetNumberOfTests(6);
Pause;
end;

procedure SPar40Cn29(Name, Key: string);
label 1;
var
  v1, v2, v3: Byte;
  i,k,p,x:integer;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write an integer function PosSub({S}_0,\;{S},\;{K},\;{N}) that searches for the first', 0, 1);
  TaskText('occurrence of a\ string~{S}_0 within a\ substring of a\ string~{S} (the substring', 0, 2);
  TaskText('contains {N}~characters of~{S} starting at a\ character with the order number~{K}).', 0, 3);
  TaskText('The function returns the order number of the first character of this', 0, 4);
  TaskText('occurrence within~{S}. If~{K} is greater than the length of~{S} then the function', 0, 5);
  TaskText('returns~0; if the length of~{S} is less than {K}\,+\,{N} then all characters', 0, 0);
  TaskText('of~{S} starting at its \Um{K}-th\um character must be analyzed. If the required', 0, 0);
  TaskText('substring of~{S} does not contain occurrences of~{S}_0 then the function returns~0.', 0, 0);
  TaskText('Output return values of this function for given strings~{S}_0, {S} and each', 0, 0);
  TaskText('of three pairs of positive integers ({K}_1,\;{N}_1), ({K}_2,\;{N}_2), ({K}_3,\;{N}_3).', 0, 0);
(*
*)
(*==*)
1:n:=random(7);
if n>5 then n:=0;
s2 := stroka(Random(4)+3);
s1 := stroka(Random(5));
for i := 1 to n do
  begin
  s1 := s1 + s2 + stroka(Random(5));
  end;
s1 := s1 +stroka(Random(5));
if length(s1)<25 then
  begin
  s1 := stroka(5) + s1 + stroka(20-length(s1));
  end;
if length(s1)>49 then goto 1;
dataS('S_0: ',s2,5,2);
dataS('S: ',s1,23,2);
for i := 1 to 3 do
  begin
    k := 0;
    case Random(3) of
    0: k := random(length(s1) div 2)+1;
    1: k := random(length(s1))+1;
    2: k := Random(10)+ length(s1)-5;
    end;
    p := 6 + random(15);
    x := Pos(s2,copy(s1,k,p));
    if x <> 0 then x := x + k - 1;
    dataN2('K_'+chr(48+i)+', N_'+chr(48+i)+':',k,p,center(i,3,13,10),4,3);
    resultN('PosSub(S_0, S, K_'+chr(i+48)+', N_'+chr(i+48)+') = ',x,0,i+1,2);
  end;
setNumberOfTests(6);
Pause;
end;


function str2(n: integer; s2: string): string;
var s: string;
begin
s := s2;
if n > 1 then
  if n <= Length(s2) then
  begin
    Insert(s2,s,n);
    while pos(s2,s) <> n do
      s := stroka(n-1) + s2;
  end
  else
    while pos(s2,s) <> n do
      s := stroka(n-1) + s2;
str2 := s;
end;

procedure SPar40Cn30(Name, Key: string);
label 1;
var i,j,k,k0:integer;

begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Write an integer function PosLast({S}_0,\;{S}) that searches for the last',0,1);
taskText('occurrence of a\ string~{S}_0 within a\ string~{S} and returns the order number',  0,2);
taskText('of the first character of this occurrence. If the string~{S} does not contain',  0,3);
taskText('occurrences of~{S}_0 then the function returns~0. Output return values',  0,4);
taskText('of this function for five given pairs of strings ({S}_0, {S}).',  0,5);
(*
*)
(*==*)
for j := 1 to 5 do
  begin
1:n:=random(7);
k := 0;
if n>5 then n:=0;
s2 := stroka(Random(4)+4);
s1 := stroka(Random(5));
for i := 1 to n do
  begin
  k0 := 0;
  if Random(3) = 0 then k0 := 1 + Random(5);
  s1 := s1 + str2(k0+1, s2) + stroka(Random(5));
  end;
s1 := s1 +stroka(Random(5));
if length(s1)<25 then
  begin
  s1 := stroka(5) + s1 + stroka(20-length(s1));
  end;
if length(s1)>49 then goto 1;
k := 0;
for i := length(s1) downto 1 do
  if copy(s1,i,length(s2)) = s2 then
    begin
      k := i;
      Break;
    end;
dataS('S_0_'+chr(j+48)+': ',s2,5,j);
dataS('S_'+chr(j+48)+': ',s1,23,j);
resultN('PosLast(S_0_'+chr(j+48)+', S_'+chr(j+48)+') = ',k,0,j,2);
  end;
setNumberOfTests(7);
Pause;
end;

procedure SPar40Cn31(Name, Key: string);
label 1;
var i,j,k,k0,p,d:integer;

begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Write an integer function PosK({S}_0,\;{S},\;{K}) that searches for \Um{K}-th\um occurrence',0,1);
taskText('({K}~>~0) of a\ string~{S}_0 within a\ string~{S} and returns the order number',  0,2);
taskText('of the first character of this occurrence. The string~{S} is assumed to contain',  0,3);
taskText('no overlapping occurrences of the substring~{S}_0. If the string~{S} does not',  0,4);
taskText('contain occurrences of~{S}_0 then the function returns~0. Output return values',  0,5);
taskText('of this function for five given triples ({S}_0, {S},~{K}).',  0,0);
(*
*)
(*==*)
for j := 1 to 5 do
  begin
1:n:=random(7);
if n>5 then n:=0;

n0 := random(5)+1;
s2 := stroka(Random(4)+4);
s1 := stroka(Random(5));
for i := 1 to n do
  begin
  k0 := 1;
  if Random(3) = 0 then k0 := 2 + Random(5);
  s1 := s1 + str2(k0,s2) + stroka(Random(5));
  end;
s1 := s1 +stroka(Random(5));
if length(s1)<25 then
  begin
  s1 := stroka(5) + s1 + stroka(20-length(s1));
  end;
if length(s1)>42 then goto 1;


c := chr(j+48);
dataS('S_0_'+c+': ',s2,5,j);
dataS('S_'+c+': ',s1,21,j);
dataN('K_'+c+' = ',n0,70,j,1);

k := 0;
k0 := 0;
d := Pos(s2,s1);
p := 0;
while d <> 0 do
begin
  inc(k0);
  if n0 = k0 then
    begin
      k := d + p;
      break;
    end;
  p := p + d + length(s2) - 1;
  delete(s1,1,d+length(s2)-1);
  d := Pos(s2,s1);
end;

resultN('PosK(S_0_'+c+', S_'+c+', K_'+c+') = ',k,0,j,2);
  end;
setNumberOfTests(7);
Pause;
end;
procedure SPar40Cn32(Name, Key: string);
var i,k : integer;
    s0 : array [1..10] of string[20];
begin
start(Name,Topic3,Author,Key,73{level2});(*DEMO*)
taskText('Write a\ string function WordK({S},\;{K}) that returns \Um{K}-th\um word of a\ string~{S}',0,1);
taskText('(a\ \Iword\i is defined as a\ character sequence that does not contain blank',  0,2);
taskText('characters and is bounded by blank characters or the string beginning/end).',  0,3);
taskText('If the amount of words in the string~{S} is less than~{K}',  0,4);
taskText('then the function returns an empty string. Having input a\ string~{S}',  0,5);
taskText('and three positive integers {K}_1, {K}_2,~{K}_3 and using this function,',  0,0);
taskText('extract words with the given order numbers from the given string.',  0,0);
(*
*)
repeat
s := '';
for i := 1 to 10 do
  s0[i] := '';
for i := 1 to random(5) do
  s := s + ' ';
n := random(7)+2;
for k := 1 to n-1 do
  begin
    s0[k] := stroka_(random(8)+1);
    s := s + s0[k];
    for i := 1 to random(5)+1 do
      s := s + ' ';
  end;
s0[n] := stroka_(random(8)+1);
s := s + s0[n];
for i := 1 to random(5) do
  s := s + ' ';
until length(s)<=70;
dataS('S: ',s,0,2);
for i := 1 to 3 do
  begin
    k := random(n+2)+1;
    dataN('K_'+chr(48+i)+' = ',k,center(i,3,6,5),4,1);
    resultS('WordK(S, K_'+chr(48+i)+') = ',s0[k],30,i+1);
  end;

setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn33(Name, Key: string);
var i,k:integer;
    s0 : array [1..10] of string[20];
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Write a\ procedure SplitStr({S},\;{W},\;{N}) that creates an array~{W} of all words',0,1);
taskText('being contained in a\ string~{S}. The array~{W} of strings and its size~{N}',0,2);
taskText('are output parameters. A\ \Iword\i is defined as a\ character sequence that',0,3);
taskText('does not contain blank characters and is bounded by blank characters',0,4);
taskText('or the string beginning/end; the string~{S} is assumed to contain no more',0,5);
taskText('than 10~words. Using this function, output the amount~{N} of words',0,0);
taskText('in the given string~{S} and also all these words.',0,0);
(*
*)
(*==*)
repeat
s := '';
for i := 1 to 10 do
  s0[i] := '';
for i := 1 to random(5) do
  s := s + ' ';

n := random(8)+1;
if Random(3)=0 then n := 0;
case curtest of //2012
3: n := 0;
4: n := random(8)+1;
end;
for k := 1 to n-1 do
  begin
    s0[k] := stroka_(random(6)+1);
    s := s + s0[k];
    for i := 1 to random(5)+1 do
      s := s + ' ';
  end;
if n<>0 then
  begin
    s0[n] := stroka_(random(6)+1);
    s := s + s0[n];
  end;
for i := 1 to random(5) do
  s := s + ' ';
until length(s)<=70;
dataS('S = ',s,0,3);
resultN('N = ',n,0,2,1);
for i := 1 to n do
  resultS('',s0[i],center(i,n,8,1),4);
setNumberOfTests(5);
Pause;
end;

function stroka2(N : integer) : string;
const c : string = '    ()[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
var s: string;
    c0: char;
    k,i,i0,k0: integer;
begin
s := '';
k := length(c);
for i:=1 to N do
begin
  c0 := c[Random(k)+1];
  k0 := 0;
  case Random(3) of
  0: k0 := 1;
  1: k0 := 1 + Random(4);
  2: k0 := 5 + Random(16);
  end;
  for i0 := 1 to k0 do
    s := s + c0;
end;
stroka2 := Copy(s,1,N);
end;

function compr(s: string): string;
var s0,s2 : string;
    n,i,j: integer;
begin
s := s + '}';
s0 := '';
n := 1;
for i := 1 to length(s)-1 do
if s[i] = s[i+1] then inc(n)
else
  begin
    if n <= 4 then
      for j := 1 to n do s0 := s0 + s[i]
    else
    begin
      str(n,s2);
      s0 := s0 + s[i]+ '{' + s2 + '}';
    end;
    n := 1;
  end;
compr := s0;
end;


procedure SPar40Cn34(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Write a\ string function CompressStr({S}) that \Icompresses\i a\ string~{S}',0,1);
taskText('and returns the compressed string. The string compression must be carried out',0,2);
taskText('as follows: each substring consisting of~4 or more equal characters~{C}',0,3);
taskText('is replaced by the string \<C\{{K}\}\>, where~{K} is the amount of characters~{C}',0,4);
taskText('(the string being compressed is assumed to contain no braces \<\{\}\>).',0,5);
taskText('For example, the string \<bbbccccce\> must be compressed to \<bbbc\{5\}e\>.',0,0);
taskText('Using this function, compress five given strings.',0,0);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
  s := stroka2(Random(40)+10);
  dataS('',s,0,i);
  resultS('',compr(s),0,i);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar40Cn35(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Write a\ string function DecompressStr({S}) that restores a\ string,',0,1);
taskText('which was compressed by a\ function CompressStr (see \1).',0,2);
taskText('An input parameter~{S} is a\ compressed string; the function returns',0,3);
taskText('the decompressed value of the string~{S}. Using this function,',0,4);
taskText('restore five given compressed strings.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
  s := stroka2(Random(40)+10);
  dataS('',compr(s),0,i);
  resultS('',s,0,i);
  end;
setNumberOfTests(3);
Pause;
end;





procedure SPar40Cn36(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
     s2 := 'Bin';
taskText('Write a\ string function DecToBin({N}) that returns a\ string containing',0,1);
taskText('the \Ibinary representation\i of a\ nonnegative integer~{N}. The string',0,2);
taskText('consists of characters \<0\>, \<1\> and does not contain leading zeros',  0,3);
taskText('(except for the representation of zero number). Using this function,',  0,4);
taskText('output binary representations of five given integers.',  0,5);
(*
*)
  end;
2: begin
     s2 := 'Hex';
taskText('Write a\ string function DecToHex({N}) that returns a\ string containing',0,1);
taskText('the \Ihexadecimal representation\i of a\ nonnegative integer~{N}. The string',0,2);
taskText('consists of characters \<0\>\:\<9\>, \<A\>\:\<F\> and does not contain leading zeros',  0,3);
taskText('(except for the representation of zero number). Using this function,',  0,4);
taskText('output hexadecimal representations of five given integers.',  0,5);
(*
*)
  end;
end;
(*==*)
for i := 1 to 5 do
  begin
  c := chr(96+i);
  case Random(5) of
  0: n := 0;
  1..2: n := Random(36);
  3..4: n := Random(32000);
  end;
  DecToBinHex(n,s1,s0);
  dataN(c+' = ',n,38,i,1);
  case Code of
  1: resultS('DecTo'+s2+'('+c+') = ',s1,28,i);
  2: resultS('DecTo'+s2+'('+c+') = ',s0,28,i);
  end;
  end;
setNumberOfTests(3);
Pause;
end;
procedure SPar40Cn37(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
     s2 := 'Bin';
taskText('Write an integer function BinToDec({S}) that returns a\ nonnegative integer',0,1);
taskText('whose binary representation is contained in a\ string parameter~{S}.',0,2);
taskText('The parameter~{S} consists of characters  \<0\>, \<1\> and does not contain',  0,3);
taskText('leading zeros (except for the representation of zero number). Using',  0,4);
taskText('this function, output five integers whose binary representations are given.',  0,5);
(*
*)
  end;
2: begin
     s2 := 'Hex';
taskText('Write an integer function HexToDec({S}) that returns a\ nonnegative integer',0,1);
taskText('whose hexadecimal representation is contained in a\ string parameter~{S}.',0,2);
taskText('The parameter~{S} consists of characters \<0\>\:\<9\>, \<A\>\:\<F\>  and does not contain',  0,3);
taskText('leading zeros (except for the representation of zero number). Using this',  0,4);
taskText('function, output five integers whose hexadecimal representations are given.',  0,5);
(*
*)
  end;
end;
(*==*)
for i := 1 to 5 do
  begin
  c := chr(96+i);
  case Random(5) of
  0: n := 0;
  1..2: n := Random(36);
  3..4: n := Random(32000);
  end;
  DecToBinHex(n,s1,s0);
  case Code of
  1: begin
     dataS(c+' = ',s1,38,i);
     resultN(s2+'ToDec('+c+') = ',n,28,i,1);
     end;
  2: begin
     dataS(c+' = ',s0,38,i);
     resultN(s2+'ToDec('+c+') = ',n,28,i,1);
     end;
  end;
  end;
setNumberOfTests(3);
Pause;
end;




procedure SPar40Cn38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ',0,3);
(*
*)
dataS('','»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈',0,3);
resultS('','–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈',0,3);
setNumberOfTests(5);
pause;
end;

procedure SPar40Cn39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPar40Cn40(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

begin
Topic2 := 'PROCEDURES AND FUNCTIONS: ARRAYS PROCESSING';
Topic3 := 'PROCEDURES AND FUNCTIONS: STRINGS PROCESSING';
{Author := 'M.~E.~Abramyan, 2002';}
end.

