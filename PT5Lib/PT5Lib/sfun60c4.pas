{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SFun60C4;

{$MODE Delphi}

interface

procedure SFun60Cn1(Name, Key: string);
procedure SFun60Cn2(Name, Key: string);
procedure SFun60Cn3(Name, Key: string);
procedure SFun60Cn4(Name, Key: string);
procedure SFun60Cn5(Name, Key: string);
procedure SFun60Cn6(Name, Key: string);
procedure SFun60Cn7(Name, Key: string);
procedure SFun60Cn8(Name, Key: string);
procedure SFun60Cn9(Name, Key: string);
procedure SFun60Cn10(Name, Key: string);
procedure SFun60Cn11(Name, Key: string);
procedure SFun60Cn12(Name, Key: string);
procedure SFun60Cn13(Name, Key: string);
procedure SFun60Cn14(Name, Key: string);
procedure SFun60Cn15(Name, Key: string);
procedure SFun60Cn16(Name, Key: string);
procedure SFun60Cn17(Name, Key: string);
procedure SFun60Cn18(Name, Key: string);
procedure SFun60Cn19(Name, Key: string);
procedure SFun60Cn20(Name, Key: string);
procedure SFun60Cn21(Name, Key: string);
procedure SFun60Cn22(Name, Key: string);
procedure SFun60Cn23(Name, Key: string);
procedure SFun60Cn24(Name, Key: string);
procedure SFun60Cn25(Name, Key: string);
procedure SFun60Cn26(Name, Key: string);
procedure SFun60Cn27(Name, Key: string);
procedure SFun60Cn28(Name, Key: string);
procedure SFun60Cn29(Name, Key: string);
procedure SFun60Cn30(Name, Key: string);
procedure SFun60Cn31(Name, Key: string);
procedure SFun60Cn32(Name, Key: string);
procedure SFun60Cn33(Name, Key: string);
procedure SFun60Cn34(Name, Key: string);
procedure SFun60Cn35(Name, Key: string);
procedure SFun60Cn36(Name, Key: string);
procedure SFun60Cn37(Name, Key: string);
procedure SFun60Cn38(Name, Key: string);
procedure SFun60Cn39(Name, Key: string);
procedure SFun60Cn40(Name, Key: string);
procedure SFun60Cn41(Name, Key: string);
procedure SFun60Cn42(Name, Key: string);
procedure SFun60Cn43(Name, Key: string);
procedure SFun60Cn44(Name, Key: string);
procedure SFun60Cn45(Name, Key: string);
procedure SFun60Cn46(Name, Key: string);
procedure SFun60Cn47(Name, Key: string);
procedure SFun60Cn48(Name, Key: string);
procedure SFun60Cn49(Name, Key: string);
procedure SFun60Cn50(Name, Key: string);
procedure SFun60Cn51(Name, Key: string);
procedure SFun60Cn52(Name, Key: string);
procedure SFun60Cn53(Name, Key: string);
procedure SFun60Cn54(Name, Key: string);
procedure SFun60Cn55(Name, Key: string);
procedure SFun60Cn56(Name, Key: string);
procedure SFun60Cn57(Name, Key: string);
procedure SFun60Cn58(Name, Key: string);
procedure SFun60Cn59(Name, Key: string);
procedure SFun60Cn60(Name, Key: string);

implementation

uses PT5TaskMaker;

type Mas10 = array [1..30] of integer;
var code,code1,code2,code3 : byte;
    s,s0,s1,s2,s3,s4,s5 : string;
    ar,br,cr,x,x0,x1,x2,x3,x4,x5 : real;
    i,j,k,m,n,n0,n1,n2,n3,n4,n5 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    Topic1,Topic2,Topic3,Author : string;
    a : mas10;

procedure Factors(A : integer; var N : integer; var F : Mas10);
var i : integer;
begin
N := 0;
if A = 1 then begin N := 1; F[1] := 1; exit; end;
while A mod 2 = 0 do
  begin
    inc(N);
    F[N] := 2;
    A := A div 2;
  end;
for i := 1 to A div 2 do
  while A mod (2*i+1) = 0 do
  begin
    inc(N);
    F[N] := 2*i+1;
    A := A div (2*i+1);
  end;
end;

{function otr(x1,y1,x2,y2:real):real;
begin
otr := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;}

function stroka(N : integer) : string;
const c : string = '          (){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
(*
+
'¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ‹€⁄›ﬁﬂ'+
'‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘¸˚˙˝˛ˇ';
*)
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
(*
+
'¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ‹€⁄›ﬁﬂ'+
'‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘¸˚˙˝˛ˇ';
*)
k := length(c0);
for i:=1 to N do
  s := s + c0[Random(k)+1];
stroka1 := s;
end;
function stroka_(N : integer) : string;
const c : string = '(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'¿¡¬√ƒ≈∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ‹€⁄›ﬁﬂ'+
'‡·‚„‰ÂÊÁËÈÍÎÏÌÓÔÒÚÛÙıˆ˜¯˘¸˚˙˝˛ˇ';
var s: string;
    k,i: integer;
begin
s := '';
k := length(c);
for i:=1 to N do
  s := s + c[Random(k)+1];
stroka_ := s;
end;

{function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;}

{procedure Frac(a,b:integer; var p,q : integer);
var n : integer;
begin
n := NOD(a,b);
p := abs(a div n);
q := abs(b div n);
if a*b<0 then p := -p;
end;}

procedure DecToBinHex(nDec : integer; var sBin,sHex : string);
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

procedure SFun60Cn1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ function PowerA3({A}) that returns the third degree',0,2);
taskText('of a\ real number~{A} ({A}~is an input parameter).',0,3);
taskText('Using this function, find the third degree of five given real numbers.',0,4);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  ar := RandomR2(-9.9,9.9); //19.8 * Random - 9.9; //2018
  Str(i,s);
  dataR('A_'+s+' = ',ar,0,i,5);
  resultR('PowerA3(A_'+s+') =',ar*ar*ar,0,i,8);
end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Write a\ function PowerA234({A}) that computes the second, the third,',0,1);
taskText('and the fourth degrees of a\ real number~{A} and returns these degrees',0,2);
taskText('as three real numbers ({A}~is an input parameter).',0,3);
taskText('Using this function, find the second, the third,',0,4);
taskText('and the fourth degrees of five given real numbers.',0,5);

(*
*)
(*==*)
for i := 1 to 5 do
begin
  ar := RandomR2(-9.9,9.9); //19.8 * Random - 9.9; //2018
  Str(i,s);
  dataR('A_'+s+' = ',ar,0,i,5);
  resultR3('PowerA234(A_'+s+'):',ar*ar,ar*ar*ar,ar*ar*ar*ar,0,i,9);

end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn3(Name, Key: string);
var v1,v2,v3 : byte;
    s: array[1..3] of char;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Write a\ function Mean({X},\;{Y}) that computes the \Iarithmetical mean\i ({X}+{Y})/2',0,1);
taskText('and the \Igeometrical mean\i \R{X}\*{Y}\r of two positive real numbers~{X} and~{Y}',0,2);
taskText('and returns the result as two real numbers ({X} and~{Y} are',0,3);
taskText('input parameters). Using this function, find the arithmetical mean',0,4);
taskText('and the geometrical mean of pairs ({A},\;{B}), ({A},\;{C}), ({A},\;{D})',0,5);
taskText('provided that real numbers~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(0.1,9.9); //9.98 * Random; //2018
dataR('A = ',x1,center(1,4,8,6),3,4);
s[1] := 'B';
s[2] := 'C';
s[3] := 'D';
for i := 1 to 3 do
begin
x2 := RandomR2(0.1,9.9); //9.98 * Random;
dataR(s[i]+' = ',x2,center(i+1,4,8,6),3,4);
resultR2('Mean(A, '+s[i]+'):',(x1+x2)/2,Sqrt(x1*x2),0,i+1,6);
end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Write a\ function TrianglePS({a}) that computes the perimeter~{P}~=~3\*{a}',0,1);
taskText('and the area~{S}~=~{a}^2\*\R3\r/4 of an equilateral triangle with the side~{a}',0,2);
taskText('and returns the result as two real numbers ({a}~is an input',0,3);
taskText('real-valued parameter). Using this function, find the perimeters',0,4);
taskText('and the areas of three triangles with the given lengths of the sides.',0,5);

(*
*)
for i := 1 to 3 do
begin
  Str(i,s);
  x := RandomR2(0.1,9.9); //9.98 * Random; //2018
  dataR('a_'+s+' = ',x,0,i+1,4);
  resultR('TrianglePS(a_'+s+'):  P_'+s+' =',3*x,19,i+1,6);
  resultR('S_'+s+' =',x*x*sqrt(3)/4,49,i+1,6);
end;
setNumberOfTests(3);
pause;
end;

function dist(x1,y1,x2,y2:real):real;
begin
dist := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;


procedure SFun60Cn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  y,y1,y2: real;
  i: integer;
  s,s1,s2: string;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Write a function RectPS({x}_1,\;{y}_1,\;{x}_2,\;{y}_2) that computes and returns',0,1);
taskText('the perimeter~{P} and the area~{S} of a rectangle whose opposite vertices',0,2);
taskText('have coordinates ({x}_1,\;{y}_1) and ({x}_2,\;{y}_2) and sides are parallel',0,3);
taskText(' to coordinate axes ({x}_1, {y}_1, {x}_2, {y}_2 are input real-valued parameters).',0,4);
taskText('Using this function, find the perimeters and the areas',0,5);
taskText('of three rectangles with the given opposite vertices.',0,0);

(*
*)
(*==*)
for i := 1 to 3 do
begin
repeat
x1 := (Random(200) - 99.0)/10;
y1 := (Random(200) - 99.0)/10;
x2 := (Random(200) - 99.0)/10;
y2 := (Random(200) - 99.0)/10;
until (x1<>x2) and (y1<>y2);
Str(2*i-1,s1);
Str(2*i,s2);
Str(i,s);
case i of
1: dataComment('First rectangle:',6,i+1);
2: dataComment('Second rectangle:',6,i+1);
3: dataComment('Third rectangle:',6,i+1);
end;
dataR2('x_'+s1+', y_'+s1+':',x1,y1,31,i+1,6);
dataR2('x_'+s2+', y_'+s2+':',x2,y2,55,i+1,6);
x := x1;
y := y2;
ar := dist(x1,y1,x,y);
br := dist(x2,y2,x,y);
resultR('RectPS(x_'+s1+', y_'+s1+', x_'+s2+', y_'+s2+'):   P_'+s+' = ',2*(ar+br),14,i+1,6);
resultR('S_'+s+' = ',ar*br,54,i+1,6);
end;
setNumberOfTests(3);
Pause;
end;


procedure SFun60Cn6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Write a\ function DigitCS({K}) that finds and returns the amount~{C} of digits',0,2);
taskText('in the decimal representation of a\ positive integer~{K} and also the sum~{S}',0,3);
taskText('of its digits ({K}~is an input integer parameter). Using this function,',0,4);
taskText('find the amount and the sum of digits for each of five given integers.',0,5);

(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(10);
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,5);
  resultN('DigitCS(K_'+s+'):   C_'+s+' =',n+1,20,i,2);
  resultN('S_'+s+' =',n1,45,i,3);
end;
setNumberOfTests(3);
Pause;
end;


procedure SFun60Cn7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Write a\ function InvDigits({K}) that inverts the order of digits of a positive',0,2);
taskText('integer~{K} and returns the obtained integer ({K}~is an input parameter).',0,3);
taskText('Using this function, invert the order of digits',0,4);
taskText('for each of five given integers.',0,5);

(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    if j = 4 then
      k := Random(3)
    else
      k := Random(10);
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,5);
  n := 0;
  while m <> 0 do
  begin
  n := n * 10 + m mod 10;
  m := m div 10;
  end;
  resultN('InvDigits(K_'+s+') = ',n,24,i,5);
end;
setNumberOfTests(3);
Pause;
end;


procedure SFun60Cn8(Name, Key: string);
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
s1 := 'Right';
taskText('Write a\ function AddRightDigit({D}, {K}) that adds a digit~{D} to the right side',0,1);
taskText('of the decimal representation of a positive integer~{K} and returns the obtained',0,2);
taskText('number ({D} and {K} are input integer parameters, the value of {D} is in the range~0',0,3);
taskText('to~9). Having input an integer~{K} and two one-digit numbers~{D}_1, {D}_2 and using',0,4);
taskText('two calls of this function, sequentially add the given digits~{D}_1, {D}_2',0,5);
taskText('to the right side of the given K and output the result of each adding.',0,0);

(*
*)
  n := Random(3)+2;
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(9)+1;
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(m,s);
  Val(s[length(s)],n1,k);
  Val(s[length(s)-1],n2,k);
  Val(Copy(s,1,length(s)-1),n4,k);
  Val(Copy(s,1,length(s)-2),n5,k);
  dataN('K = ',n5,0,2,1);
  dataN('D_1 = ',n2,xLeft,4,1);
  dataN('D_2 = ',n1,xRight,4,1);
  resultN('Add'+s1+'Digit(D_1, K) =',n4,25,2,length(s)+1);
  resultN('Add'+s1+'Digit(D_2, K) =',m,25,4,length(s)+1);
setNumberOfTests(5);
pause;
end;

procedure SFun60Cn9(Name, Key: string);
begin
start(Name,Topic1,Author,Key,36{level1});
s1 := 'Left';
taskText('Write a\ function AddLeftDigit({D}, {K}) that adds a digit~{D} to the left side',0,1);
taskText('of the decimal representation of a positive integer~{K} and returns the obtained',0,2);
taskText('number ({D} and {K} are input integer parameters, the value of {D} is in the range~0',0,3);
taskText('to~9). Having input an integer~{K} and two one-digit numbers~{D}_1, {D}_2 and using',0,4);
taskText('two calls of this function, sequentially add the given digits~{D}_1, {D}_2',0,5);
taskText('to the left side of the given K and output the result of each adding.',0,0);

(*
*)
(*==*)
  n := Random(3)+2;
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  n1 := m;
  for j := 1 to n do
  begin
    k := Random(9)+1;
    m := m*10 + k;
    n1 := n1 + k;
  end;
  Str(m,s);
  Val(s[1],n1,k);
  Val(s[2],n2,k);
  Val(Copy(s,2,100),n4,k);
  Val(Copy(s,3,100),n5,k);
  dataN('K = ',n5,0,2,1);
  dataN('D_1 = ',n2,xLeft,4,1);
  dataN('D_2 = ',n1,xRight,4,1);
  resultN('Add'+s1+'Digit(D_1, K) = ',n4,25,2,length(s)+1);
  resultN('Add'+s1+'Digit(D_2, K) = ',m,25,4,length(s)+1);
setNumberOfTests(5);
Pause;
end;



procedure SFun60Cn10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,36{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ function Swap({X}, {I}, {J}) that exchanges the values of items~{X}_I',0,1);
taskText('and~{X}_J of a list~{X} of real numbers ({I} and~{J} are input integer parameters,',0,2);
taskText('the function returns the None value). Having input a list of four',0,3);
taskText('real numbers and using three calls of this function, sequentially',0,4);
taskText('exchange the values of the two first, two last, and two middle items',0,5);
taskText('of the given list. Output the new values of the list.',0,0);

(*
*)
x1 := 9.98 * Random;
x2 := 9.98 * Random;
x3 := 9.98 * Random;
x4 := 9.98 * Random;
dataR('',x1,center(1,4,4,6),3,4);
dataR('',x2,center(2,4,4,6),3,4);
dataR('',x3,center(3,4,4,6),3,4);
dataR('',x4,center(4,4,4,6),3,4);
resultR('',x2,center(1,4,4,6),3,4);
resultR('',x4,center(2,4,4,6),3,4);
resultR('',x1,center(3,4,4,6),3,4);
resultR('',x3,center(4,4,4,6),3,4);
setNumberOfTests(5);
pause;
end;

procedure SFun60Cn11(Name, Key: string);
var v1,v2,v3 : byte;
    min,max : real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Write a\ function Minmax({X},\;{I},\;{J}) that writes the minimal value',0,1);
taskText('of items {X}_I and~{X}_J of a list {X} to the item {X}_I and writes the maximal',0,2);
taskText('value of these items to the item {X}_J ({I} and~{J} are input integer parameters,',0,3);
taskText('the function returns the None value). Using four calls of this function,',0,4);
taskText('find the minimal value and the maximal value among four given real numbers.',0,5);
(*
*)
(*==*)
min := 100; max := -100;
for i := 1 to 4 do
  begin
    x := Random * 19.98 - 9.98;
    if x > max then max := x;
    if x < min then min := x;
    dataR('',x,Center(i,4,4,6),3,4);
  end;
resultR('Min =',min,xLeft,3,6);
resultR('Max =',max,xRight,3,6);
setNumberOfTests(5);
Pause;
end;

procedure swap(var x,y: real);
var z: real;
begin
z := x;
x := y;
y := z;
end;

procedure SFun60Cn12(Name, Key: string);
var v1,v2,v3 : byte;
    i,j,k: integer;
    x: array [1..3] of real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
s1 := 'Inc';
taskText('Write a\ function SortInc3({X}) that sorts the list~{X} of three real-valued',0,2);
taskText('items in ascending order (the function returns the None value).',0,3);
taskText('Using this function, sort each of two given lists {X} and~{Y}.',0,4);

(*
*)
end
else
begin
s1 := 'Dec';
taskText('Write a\ function SortDec3({X}) that sorts the list~{X} of three real-valued',0,2);
taskText('items in descending order (the function returns the None value).',0,3);
taskText('Using this function, sort each of two given lists {X} and~{Y}.',0,4);
(*
*)
end;
(*==*)
for j := 1 to 2 do
begin
  Str(j,s);
  for i := 1 to 3 do
  begin
    x[i] := Random * 19.98 - 9.98;
    dataR(chr(87+j)+'_'+chr(47+i)+' = ',x[i],center(i,3,10,9),2*j,5);
  end;
  for k := 1 to 2 do
    for i := 1 to 3-k do
      if x[i]>x[i+1] then Swap(x[i],x[i+1]);
  if v1 = 2 then Swap(x[1],x[3]);
  resultR('Sort'+s1+'3('+chr(87+j)+'):   '+chr(87+j)+'_0 = ',x[1],14,2*j,5);
  resultR(chr(87+j)+'_1 = ',x[2],43,2*j,5);
  resultR(chr(87+j)+'_2 = ',x[3],56,2*j,5);
end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn13(Name, Key: string);
var v1,v2,v3 : byte;
    i,j,k: integer;
    x: array [1..3] of real;
    a,b,c: real;
begin
start(Name,Topic1,Author,Key,36{level1});
getVariant(5,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
s1 := 'Right';
s2 := '';
taskText('Write a function ShiftRight3({X}) that performs a \Iright cyclic shift\i of a list {X}',0,1);
taskText('of three real-valued items: the value of each item should be assigned',0,2);
taskText('to the next item and the value of the last item should be assigned',0,3);
taskText('to the first item (the function returns the None value). Using this function,',0,4);
taskText('perform the right cyclic shift for each of two given lists {X} and~{Y}.',0,5);

(*
*)
end
else
begin
s1 := 'Left';
s2 := ' ';
taskText('Write a function ShiftLeft3({X}) that performs a \Ileft cyclic shift\i of a list {X}',0,1);
taskText('of three real-valued items: the value of each item should be assigned',0,2);
taskText('to the previous item and the value of the first item should be assigned',0,3);
taskText('to the last item (the function returns the None value). Using this function,',0,4);
taskText('perform the left cyclic shift for each of two given lists {X} and~{Y}.',0,5);
(*
*)
end;
(*==*)
for j := 1 to 2 do
begin
  Str(j,s);
  for i := 1 to 3 do
  begin
    x[i] := Random * 19.98 - 9.98;
    dataR(chr(87+j)+'_'+chr(47+i)+' = ',x[i],center(i,3,10,9),2*j,5);
  end;
  if v1 = 1 then
  begin
    a := x[3]; b := x[1]; c := x[2];
  end
  else
  begin
    a := x[2]; b := x[3]; c := x[1];
  end;
  resultR(s2+'Shift'+s1+'3('+chr(87+j)+'):   '+chr(87+j)+'_0 = ',a,12,2*j,5);
  resultR(chr(87+j)+'_1 = ',b,44,2*j,5);
  resultR(chr(87+j)+'_2 = ',c,57,2*j,5);
end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFun60Cn15(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFun60Cn16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SFun60Cn17(Name, Key: string);
var v1,v2,v3 : byte;
    a: array[1..2] of real;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Write an integer function Sign({X}) that returns the following value:',0,2);
taskText('\[\-1,\q if {X}~<~0;\Q         0,\q if {X}~=~0;\Q         1,\q if {X}~>~0\]',0,3);
taskText('(X is a real-valued parameter). Using this function,',0,4);
taskText('evaluate an expression Sign({A})\;+\;Sign({B}) for given real numbers~{A} and~{B}.',0,5);

(*
*)
(*==*)
n := 0;
for i := 1 to 2 do
  case Random(3) of
  0: begin a[i] := -integer(1+Random(99))/10; n := n - 1; end;
  1: a[i] := 0;
  2: begin a[i] := (1+Random(99))/10; n := n + 1; end;
  end;
dataR('A = ',a[1],xLeft,3,5);
dataR('B = ',a[2],xRight,3,5);
resultN('Sign(A) + Sign(B) = ',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Write an integer function RootCount({A}, {B},~{C}) that returns the amount',0,1);
taskText('of roots of the quadratic equation {A}\*{x}^2\;+\;{B}\*{x}\;+\;{C}~=~0 ({A},~{B}, {C} are real-valued',0,2);
taskText('parameters, {A}~\n~0). Using this function, find the amount of roots for each',0,3);
taskText('of three quadratic equations with given coefficients. Note that the amount',0,4);
taskText('of roots is determined by the value of a \Idiscriminant\i: \[{D}~=~{B}^2\;\-\;4\*{A}\*{C}.\]',0,5);

(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  case Random(3) of
  0: begin
       x1 := Integer(Random(10)) - 5;
       x2 := Integer(Random(10)) - 5;
       while x2 = x1 do
         x2 := Integer(Random(10)) - 5;
       Ar := 1 + Random(5);
       Br := -Ar * (x1+x2);
       Cr := Ar*x1*x2;
       n := 2;
     end;
  1: begin
       x1 := Integer(Random(10)) - 5;
       x2 := x1;
       Ar := 1 + Random(5);
       Br := -Ar * (x1+x2);
       Cr := Ar*x1*x2;
       n := 1;
     end;
  2: begin
       Ar := 1 + Random(5);
       Br := Integer(Random(20)) - 10;
       Cr := Integer(Random(20)) - 10;
       while Br*Br-4*Ar*Cr >= 0 do
       begin
         Br := Integer(Random(20)) - 10;
         Cr := Integer(Random(20)) - 10;
       end;
       n := 0;
     end;
  end;
  dataR('A_'+s+' = ',Ar,center(1,3,12,6),i+1,6);
  dataR('B_'+s+' = ',Br,center(2,3,12,6),i+1,6);
  dataR('C_'+s+' = ',Cr,center(3,3,12,6),i+1,6);
  resultN('RootCount(A_'+s+', B_'+s+', C_'+s+') = ',n,0,i+1,1);
end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ real-valued function CircleS({R}) that returns the area of a circle', 0, 2);
  TaskText('of radius~{R} ({R} is a real number). Using this function, find the areas', 0, 3);
  TaskText('of three circles of given radiuses. Note that the area of a circle', 0, 4);
  TaskText('of radius~{R} can be found by formula {S}~=~\p\*{R}^2. Use~3.14 for a value of~\p.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  ar := RandomR2(0.1,9.9); //Random*9.98; //2018
  dataR('R_'+s+' = ',ar,0,i+1,4);
  resultR('CircleS(R_'+s+') = ',ar*ar*3.14,0,i+1,6);
end;
  SetNumberOfTests(3);
Pause;
end;

procedure SFun60Cn20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ real-valued function RingS({R}_1, {R}_2) that returns the area', 0, 1);
  TaskText('of a\ ring bounded by a\ concentric circles of radiuses~{R}_1 and~{R}_2 ({R}_1 and~{R}_2', 0, 2);
  TaskText('are real numbers, {R}_1~>~{R}_2). Using this function, find the areas of three rings', 0, 3);
  TaskText('with given outer and inner radiuses. Note that the area of a circle', 0, 4);
  TaskText('of radius~{R} can be found by formula {S}~=~\p\*{R}^2. Use~3.14 for a\ value of~\p.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
  Str(i,s);
  Str(2*i-1,s1);
  Str(2*i,s2);
  ar := RandomR2(0.1,9.9); //Random*9.98; //2018
  br := RandomR2(0.1,9.9); //Random*9.98;
  if ar < br then swap(ar,br);
  case i of
  1: datacomment('First ring:',17,i+1);
  2: datacomment('Second ring:',17,i+1);
  3: datacomment('Third ring:',17,i+1);
  end;
  dataR('R_'+s1+' = ',ar,37,i+1,4);
  dataR('R_'+s2+' = ',br,52,i+1,4);
  resultR('RingS(R_'+s1+', R_'+s2+') = ',(ar*ar-br*br)*3.14,0,i+1,6);
end;
  SetNumberOfTests(3);
Pause;
end;

procedure SFun60Cn21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function TriangleP({a},\ {h}) that returns the perimeter',0,1);
taskText('of an isosceles triangle with given base~{a} and altitude~{h} ({a} and~{h} are',0,2);
taskText('real numbers). Using this function, find the perimeters of three triangles',0,3);
taskText('with given bases and altitudes. Note that the leg~{b} of an isosceles triangle',0,4);
taskText('can be found by the \IPythagorean theorem\i:\[  {b}^2~=~({a}/2)^2\;+\;{h}^2.\]',0,5);

(*
*)
for i := 1 to 3 do
begin
  Str(i,s);
  x := 1 + Random(9);
  x1 := 1 + Random(9);
  dataR('a_'+s+' = ',x,xLeft,i+1,4);
  dataR('h_'+s+' = ',x1,xRight,i+1,4);
  resultR('TriangleP(a_'+s+', h_'+s+') =',2*sqrt(x*x/4 + x1*x1) + x,0,i+1,6);
end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn22(Name, Key: string);
var
  v1, v2, v3: Byte;
function sum(a,b: integer): integer;
var i,n: integer;
begin
n := 0;
for i := a to b do
  n := n + i;
sum := n;
end;
begin
  Start(Name, Topic2, Author, Key, 36{level1}); (*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write an integer function SumRange({A}, {B}) that returns a\ sum of all integers', 0, 1);
  TaskText('in the range~{A} to~{B} inclusively ({A} and~{B} are integers).', 0, 2);
  TaskText('In the case of {A}~>~{B} the function returns~0. Using this function,', 0, 3);
  TaskText('find a\ sum of all integers in the range~{A} to~{B} and in the range~{B} to~{C}', 0, 4);
  TaskText('provided that integers~{A}, {B},~{C} are given.', 0, 5);
(*
*)
  n1 := 1 + Random(99);
  n2 := Random(3);
  case curtest of //2012
  2: n2 := 0;
  4: n2 := 1;
  end;
  if n2=0 then
  n2 := n1 + Random(5)
  else
  n2 := 1 + Random(99);
  n3 := 1 + Random(99);
  dataN('A = ',n1,center(1,3,6,10),3,2);
  dataN('B = ',n2,center(2,3,6,10),3,2);
  dataN('C = ',n3,center(3,3,6,10),3,2);
  ResultN('SumRange(A, B) = ', sum(n1,n2), 0, 2, 4);
  ResultN('SumRange(B, C) = ', sum(n2,n3), 0, 4, 4);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFun60Cn23(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ real-valued function Calc({A}, {B}, {Op}) that performs an arithmetic', 0, 1);
  TaskText('operation over nonzero real numbers~{A} and~{B} and returns the result value.', 0, 2);
  TaskText('An arithmetic operation is determined by integer parameter~{Op} as follows:', 0, 3);
  TaskText('1\ \= subtraction, 2\ \= multiplication, 3\ \= division, and addition otherwise.', 0, 4);
  TaskText('Having input real numbers~{A}, {B} and integers~{N}_1, {N}_2,~{N}_3 and using', 0, 5);
  TaskText('this function, perform over given~{A}, {B} three operations determined', 0, 0);
  TaskText('by given~{N}_1, {N}_2,~{N}_3. Output the result value of each operation.', 0, 0);
(*
*)
(*==*)
ar := (Random(200) - 90.0)/10;
br := (Random(200) - 90.0)/10;
if ar = 0 then ar := 0.1;
if br = 0 then br := 0.1;
dataR('A = ',ar,center(1,2,9,10),2,5);
dataR('B = ',br,center(2,2,9,10),2,5);
for i := 1 to 3 do
begin
Str(i,s);
k := Random(5);
case k of
0..3: n := k;
4: n := 4 + Random(6);
end;
dataN('N_'+s+' = ',n,center(i,3,6,13),4,1);
case n of
1: cr := ar-br;
2: cr := ar*br;
3: cr := ar/br;
else cr := ar+br;
end;
resultR('Calc(A, B, N_'+s+') = ',cr,0,i+1,7);
end;
  SetNumberOfTests(7);
Pause;
end;

procedure SFun60Cn24(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write an integer function Quarter({x}, {y}) that returns the number', 0, 1);
  TaskText('of a\ coordinate quarter containing a point with nonzero real-valued', 0, 2);
  TaskText('coordinates ({x},~{y}). Using this function, find the numbers', 0, 3);
  TaskText('of coordinate quarters containing each of three', 0, 4);
  TaskText('points with given nonzero coordinates.', 0, 5);
(*
*)
(*==*)
for i := 1 to 3 do
begin
    Str(i,s);
    ar := Random * 19.98 - 9.98;
    br := Random * 19.98 - 9.98;
    dataR2('x_'+s+', y_'+s+':',ar,br,0,i+1,6);
    if ar > 0 then
      if br > 0 then n := 1
      else n := 4
    else
      if br > 0 then n := 2
      else n := 3;
    resultN('Quarter(x_'+s+', y_'+s+') = ',n,0,i+1,1);
end;
  SetNumberOfTests(5);
Pause;
end;



procedure SFun60Cn25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Write a logical function Even({K}) that returns \t, if an integer',0,2);
taskText('parameter~{K} is an even number, and \f otherwise. Using this function,',0,3);
taskText('find the amount of even numbers in a\ given sequence of 10~integers.',0,4);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  m := Random(99)+1;
  if Random(2) = 0 then m := -m;
  if not Odd(m) then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsSquare({K}) that returns \t, if an positive',0,2);
taskText('integer parameter~{K} is a\ square of some integer, and \f otherwise.',0,3);
taskText('Using this function, find the amount of squares',0,4);
taskText('in a\ given sequence of 10~positive integers.',0,5);
(*
*)
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: m := Random(225)+1;
  1: m := sqr(Random(15)+1);
  end;
  if sqr(int(sqrt(m)))=m then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
pause;
end;

procedure SFun60Cn27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsPower5({K}) that returns \t, if an positive',0,2);
taskText('integer parameter~{K} is equal to~5 raised to some integer power, and \f',0,3);
taskText('otherwise. Using this function, find the amount of powers of base 5',0,4);
taskText('in a\ given sequence of 10~positive integers.',0,5);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: case Random(3) of
     0: m := Random(100)+1;
     1: m := Random(600)+1;
     2: m := Random(3500)+1;
     end;
  1: begin
     m := 1;
     for j := 1 to Random(6) do
       m := m * 5;
     end;
  end;
  n1 := 1;
  while n1 < m do
    n1 := n1 * 5;
  if n1 = m then inc(n);
  dataN('',m,center(i,10,3,4),3,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsPowerN({K}, {N}) that returns \t, if an positive',0,1);
taskText('integer parameter~{K} is equal to~{N} (>\,1) raised to some integer power,',0,2);
taskText('and \f otherwise. Having input an integer~{N} (>\,1) and a\ sequence',0,3);
taskText('of 10~positive integers and using this function,',0,4);
taskText('find the amount of powers of base~{N} in the given sequence.',0,5);
(*
*)
(*==*)
k := Random(5)+2;
dataN('N = ',k,0,2,1);
n := 0;
for i := 1 to 10 do
begin
  case Random(2) of
  0: case Random(3) of
     0: m := Random(100)+1;
     1: m := Random(600)+1;
     2: m := Random(3500)+1;
     end;
  1: begin
     m := 1;
     for j := 1 to Random(6) do
       m := m * k;
     end;
  end;
  n1 := 1;
  while n1 < m do
    n1 := n1 * k;
  if n1 = m then inc(n);
  dataN('',m,center(i,10,3,4),4,3);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SFun60Cn29(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
function Prime(n : integer) : Boolean;
var i : integer;
begin
Prime := True;
for i := 2 to n div 2 do
  if n mod i = 0 then
    begin
      Prime := false;
      exit;
    end;
end;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsPrime({N}) that returns \t, if an integer',0,1);
taskText('parameter~{N} (>\,1) is a\ prime number, and \f otherwise. Using this function,',0,2);
taskText('find the amount of prime numbers in a\ given sequence of 10~integers',0,3);
taskText('greater than~1. Note that an integer (>\,1) is called a\ \Iprime number\i',0,4);
taskText('if it has not positive divisors except~1 and itself.',0,5);
(*
*)
(*==*)
n1 := 0;
for i := 1 to 10 do
begin
  case Random(3) of
  0: n := 2 + Random(15);
  1: n := 2 + Random(100);
  2: n := 2 + Random(999);
  end;
  if Prime(n) then n1 := n1 + 1;
  dataN('',n,center(i,10,3,4),3,3);
end;
resultN('',n1,0,3,2);
setNumberOfTests(7);
Pause;
end;




procedure SFun60Cn30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Write an integer function DigitCount({K}) that returns the amount of digits',0,2);
taskText('in the decimal representation of a\ positive integer~{K}. Using this function,',0,3);
taskText('find the amount of digits for each of five given positive integers.',0,4);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  for j := 1 to n do
    m := m*10 + Random(10);
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,1);
  resultN('DigitCount(K_'+s+') =',n+1,0,i,2);
end;
setNumberOfTests(5);
Pause;
end;


procedure SFun60Cn31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Write an integer function DigitN({K}, {N}) that returns the \Um{N}-th\um digit in',0,1);
taskText('the decimal representation of a positive integer~{K} provided that the digits',0,2);
taskText('are numbered from right to left. If the amount of digits is less than~{N} then',0,3);
taskText('the function returns~\-1. Using this function, output sequentially 1st, 2nd,',0,4);
taskText('3rd, 4th, 5th digit for each of five given positive integers~{K}_1, {K}_2,~\.,\ {K}_5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  n := Random(5);
  if n = 4 then
  m := Random(2)+1
  else
  m := Random(9)+1;
  a[n+1] := m;
  for j := 1 to n do
  begin
    a[n-j+1] := Random(10);
    m := m*10 + a[n-j+1];
  end;
  Str(i,s);
  dataN('K_'+s+' = ',m,0,i,1);
  resultComment('Return values of DigitN for K = K_'+s+', N = 1, \., 5: ',5,i);
  for j := 1 to 5 do
  begin
    if j <= n+1 then k := a[j]
                else k := -1;
    Str(j,s1);
    resultN('',k,center(j+11,16,2,2)+4,i,2);
  end;
end;
setNumberOfTests(5);
Pause;
end;




procedure SFun60Cn32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsPalindrome({K}) that returns \t, if the decimal',0,1);
taskText('representation of a\ positive parameter~{K} is a \Ipalindrome\i (i.~e., it is read',0,2);
taskText('equally both from left to right and from right to left), and \f otherwise.',0,3);
taskText('Using this function, find the amount of palindromes',0,4);
taskText('in a\ given sequence of 10~positive integers.',0,5);
(*
*)
(*==*)
n := 0;
for i := 1 to 10 do
begin
  case Random(5) of
  4:
     begin
       s1 := Chr(Random(2)+49);
       s2 := Chr(Random(10)+48);
       s := s1 + s2 + Chr(Random(10)+48) + s2 + s1;
     end;
  3:
     begin
       s1 := Chr(Random(9)+49);
       s2 := Chr(Random(10)+48);
       s := s1 + s2 + s2 + s1;
     end;
  2:
     begin
       s2 := Chr(Random(9)+49);
       s := s2 + Chr(Random(10)+48) + s2;
     end;
  1:
     begin
       s2 := Chr(Random(9)+49);
       s := s2 + s2;
     end;
  0:
     begin
       s := Chr(Random(9)+49);
     end;
  end;
  if Random(2) = 0 then
    if length(s) > 1 then
      s[Random(length(s)-1)+2] := Chr(Random(10)+48);
  k := 1;
  for j := 1 to length(s) div 2 do
    if s[j]<>s[length(s)-j+1] then
    begin
      k := 0;
      break;
    end;
  n := n + k;
  Val(s,k,j);
  if Odd(i) then j := xLeft
  else
    j := xRight;
  dataN('',k,j,(i-1) div 2 + 1,5);
end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;


procedure SFun60Cn33(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,2,0,0,v1,v2,v3);

if v1 = 1 then
begin
s1 := 'D_';
s2 := 'DegToRad(';
n1 := 6;
n2 := 3;
taskText('Write a\ real-valued function DegToRad({D}) that converts the angle value~{D}',0,2);
taskText('in degrees into the one in radians ({D} is a real number, 0~\l~{D}~<~360).',0,3);
taskText('Note that 180\o~=~\p radians and use~3.14 for a\ value of~\p.',0,4);
taskText('Using this function, convert five given angles from degrees into radians.',0,5);
(*
*)
end
else
begin
s1 := 'R_';
s2 := 'RadToDeg(';
n1 := 3;
n2 := 6;
taskText('Write a\ real-valued function RadToDeg({R}) that converts the angle value~{R}',0,2);
taskText('in radians into the one in degrees ({R} is a real number, 0~\l~{R}~<~2\*\p).',0,3);
taskText('Note that 180\o~=~\p radians and use~3.14 for a\ value of~\p.',0,4);
taskText('Using this function, convert five given angles from radians into degrees.',0,5);
(*
*)
end;
(*==*)
for i := 1 to 5 do
begin
if v1 =1 then
begin
ar := RandomR2(0.1,360); //Random*360; //2018
br := ar/180*3.14;
end
else
begin
ar := RandomR2(0.1,6.28); //Random*2*3.14;
br := ar/3.14*180;
end;
Str(i,s);
dataR(s1+s+ ' = ',ar,0,i,n1);
resultR(s2+s1+s+') = ',br,0,i,n2);
end;
setNumberOfTests(3);
Pause;
end;


procedure SFun60Cn34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Fact({N}) that returns a\ \Ifactorial\i',0,1);
taskText('of a positive integer~{N}: {N}!~=~1\*2\*\.\*{N} (the real return type allows',0,2);
taskText('to avoid the integer overflow during the calculation of the factorials',0,3);
taskText('for large values of the parameter~{N}). Using this function, ',0,4);
taskText('find the factorials of five given integers.',0,5);
(*
*)
(*==*)
setPrecision(0);
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(30)+1;
    x0 := 1;
    for j := 1 to n do
      x0 := x0 * j;
    dataN('N_'+s+' = ',n,0,i,2);
    resultR('Fact(N_'+s+') =',x0,31,i,14);
{    dataN('',n,center(i,5,2,13),3,2);
    resultR('',x0,center(i,5,14,1),3,14);}
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Fact2({N}) that returns a\ \Idouble factorial\i~{N}!!:',0,1);
taskText('\({N}!!~=~1\*3\*5\*\.\*{N},\q if {N} is an odd number;\| {N}!!~=~2\*4\*6\*\.\*{N}\q otherwise\)',0,2);
taskText('({N}~is a\ positive integer; the real return type allows to avoid the integer',0,3);
taskText('overflow during the calculation of the double factorials for large values',0,4);
taskText('of~{N}). Using this function, find the double factorials of five given integers.',0,5);
(*
*)
(*==*)
setPrecision(0);
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(30)+1;
    x0 := n;
    j := n;
    while j>2 do
      begin
        j := j-2;
        x0 := x0*j;
      end;
    dataN('N_'+s+' = ',n,0,i,2);
    resultR('Fact2(N_'+s+') =',x0,30,i,14);

{    dataN('',n,center(i,5,2,13),3,2);
    resultR('',x0,center(i,5,14,1),3,14);}
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Write an integer function Fib({N}) that returns the value of \Um{N}-th\um term',0,1);
taskText('of the sequence of the Fibonacci numbers. The \IFibonacci numbers\i~{F}_{K} are defined',0,2);
taskText('as follows:\[   {F}_{1}~=~1,\Q   {F}_{2}~=~1,\Q   '+
         '{F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('Using this function, find five Fibonacci numbers',0,4);
taskText('with given order numbers~{N}_1, {N}_2,~\.,\ {N}_5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
    Str(i,s);
    n := Random(15)+1;
    n0 := 1; n1 := 1;
    for j := 2 to n do
      begin
        n2 := n1;
        n1 := n0+n1;
        n0 := n2;
      end;
    dataN('N_'+s+' = ',n,0,i,2);
    resultN('Fib(N_'+s+') =',n0,32,i,4);
{    dataN('',n,center(i,10,4,2),3,4);
    resultN('',n0,center(i,10,4,2),3,4);}
  end;
setNumberOfTests(5);
Pause;
end;


procedure SFun60Cn37(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFun60Cn38(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SFun60Cn39(Name, Key: string);
var v1,v2,v3 : byte;
    p,a,b: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(10,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Power1({A}, {B}) that returns the power {A}^B calculated',0,1);
taskText('by the formula {A}^B~=~exp({B}\*ln({A})) ({A} and~{B} are real-valued parameters).',0,2);
taskText('In the case of zero-valued or negative parameter~{A} the function returns~0.',0,3);
taskText('Having input real numbers~{P},~{A}, {B},~{C} and using this function, ',0,4);
taskText('find the powers~{A}^P, {B}^P, {C}^P.',0,5);
(*
*)
(*==*)
p := 0.5 + 5*random;
dataR('P = ',p,Center(2,3,9,10),2,5);
for i := 1 to 3 do
  begin
    case Random(2) of
    0: repeat a := Random * 5; b := exp(p*ln(a)); until (b>0.5) and (b<100);
    1: if Random(3) <> 0 then begin a := -Random * 5; b := 0; end
       else begin a := 0; b := 0; end;
    end;
    dataR(chr(64+i)+' = ',a,Center(i,3,9,10),4,5);
    resultR('Power1('+chr(64+i)+', P) = ',b,0,i+1,5);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn40(Name, Key: string);
var v1,v2,v3 : byte;
    a, b: real;
    m: Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Power2({A}, {N}) that returns the power {A}^N calculated',0,1);
taskText('by the following formulas: \(  {A}^0 = 1;\|   {A}^N = {A}\*{A}\*\.\*{A}\q  ({N}~factors),\q if {N}~>~0;\|',0,2);
taskText('{A}^N = 1/({A}\*{A}\*\.\*{A})\q  (|{N}|~factors),\q if {N}~<~0\) ({A} is a\ real-valued parameter,',0,3);
taskText('{N}~is an integer parameter). Having input a\ real number~{A} and integers~{K}, {L},~{M}',0,4);
taskText('and using this function, find the powers~{A}^K, {A}^L, {A}^M.',0,5);
(*
*)
(*==*)
a := RandomR2(-5,5); //10 * random - 5; //2018
dataR('A = ',a,Center(2,3,10,10),2,5);
for i := 1 to 3 do
  begin
    case Random(3) of
      2:
        begin
          m := 0;
          b := 1;
        end;
      0,1:
         repeat
           repeat
             m := Integer(Random(10))-5;
           until m <> 0;
           b := 1;
           for j := 1 to Abs(m) do
             if m > 0 then b := b * a
             else b := b / a;
         until (abs(b) > 0.5) and (abs(b) < 100);
    end;
    dataN(chr(74+i)+' = ',m,Center(i,3,6,10),4,2);
    resultR('Power2(A, '+chr(74+i)+') = ',b,0,i+1,6);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn41(Name, Key: string);
var v1,v2,v3 : byte;
    p,a,b: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Using the Power1 and Power2 functions (see \2 and \1), write',0,1);
taskText('a\ real-valued function Power3({A}, {B}) that returns the power {A}^B calculated',0,2);
taskText('as follows ({A} and~{B} are real-valued parameters): if~{B} has a zero-valued',0,3);
taskText('fractional part then the function Power2({A}, {N}) is called (an \Iinteger\i',0,4);
taskText('variable~{N} is equal to {B}), otherwise the function Power1({A}, {B}) is called.',0,5);
taskText('Having input real numbers~{P}, {A}, {B},~{C}',0,0);
taskText('and using the Power3 function, find the powers~{A}^P, {B}^P, {C}^P.',0,0);
(*
ƒÎˇ\ ÔÓ‚ÂÍË ÚÓ„Ó, ˜ÚÓ ˜ËÒÎÓ~{B} ËÏÂÂÚ ‰Ó·ÌÛ˛ ˜‡ÒÚ¸, ‚\ ˇÁ˚Í‡ı \UP Ë\ \UV
ÏÓÊÌÓ ËÒÔÓÎ¸ÁÓ‚‡Ú¸ ÛÒÎÓ‚ËÂ {B}~=~Int({B}).
*)
(*==*)
case Random(2) of
  0: p := 0.5 + 5*random;
  1: p := Integer(Random(11)-5);
end;
dataR('P = ',p,Center(2,3,10,10),2,5);
for i := 1 to 3 do
  begin
    if Frac(p) <> 0 then
      case Random(2) of
      0: repeat a := Random * 5; b := exp(p*ln(a)); until (b>0.5) and (b<100);
      1: if Random(3) <> 0 then begin a := -Random * 5; b := 0; end
         else begin a := 0; b := 0; end;
      end
    else
      repeat
        a := 10 * Random - 5;
        m := Round(p);
        b := 1;
        for j := 1 to Abs(m) do
          if m > 0 then b := b * a
          else b := b / a;
      until (Abs(b) > 0.5) and (Abs(b) < 100);
    dataR(chr(64+i)+' = ',a,Center(i,3,10,10),4,5);
    resultR('Power3('+chr(64+i)+', P) = ',b,0,i+1,6);
  end;
setNumberOfTests(5);
Pause;
end;


function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;


procedure SFun60Cn42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Exp1({x}, \e) ({x} and~\e are real numbers, \e~>~0)',0,1);
taskText('that returns an approximate value of the function exp({x}) defined as follows:',0,2);
taskText('\[exp({x}) = 1\;+\;{x}\;+\;{x}^2/(2!)\;+\;{x}^3/(3!)\;+\;\.\;+\;{x}^n/({n}!)\;+\;\.\]',0,3);
taskText('({n}!~=~1\*2\*\.\*{n}). Stop adding new terms to the sum when the value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function exp({x}) at a\ given point~{x} for six given~\e.',0,0);
(*
*)
x := Random * 4;
setPrecision(7);
dataR('x = ',x,0,2,9);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    x0 := 0; x1 := 1;
    j := 0;
    while x1>x2 do
      begin
       x0 := x0+x1;
       inc(j);
       x1 := x1*x/j;
      end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
Str(exp(x):10:7,s3);
resultComment('Remark: exp(x) approximately equals '+s3,0,4);
setNumberOfTests(3);
pause;
end;

procedure SFun60Cn43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(9,2,0,0,v1,v2,v3);
case v1 of
1: begin
     s0 := 'Sin';
     s2 := '';
     s3 := 'ÒËÌÛÒ‡';
     s4 := 'sin';
taskText('Write a\ real-valued function Sin1({x}, \e) ({x} and~\e are real numbers, \e~>~0)',0,1);
taskText('that returns an approximate value of the function sin({x}) defined as follows:',0,2);
taskText('\[sin({x})~=~{x}\;\-\;{x}^3/(3!)\;+\;{x}^5/(5!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/((2\*{n}+1)!)\;+\;\.~.\]',4,3);
taskText('Stop adding new terms to the sum when the absolute value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function sin({x}) at a\ given point~{x} for six given~\e.',0,0);
(*
*)
  end;
2: begin
     s0 := 'Cos';
     s2 := '';
     s3 := 'ÍÓÒËÌÛÒ‡';
     s4 := 'cos';
     i := 0;
taskText('Write a\ real-valued function Cos1({x}, \e) ({x} and~\e are real numbers, \e~>~0)',0,1);
taskText('that returns an approximate value of the function cos({x}) defined as follows:',0,2);
taskText('\[cos({x})~=~1\;\-\;{x}^2/(2!)\;+\;{x}^4/(4!)\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n}/((2\*{n})!)\;+\;\.~.\]',0,3);
taskText('Stop adding new terms to the sum when the absolute value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function cos({x}) at a\ given point~{x} for six given~\e.',0,0);
(*
*)
  end;
end;
(*==*)
x := Random * 8-4;
setPrecision(7);
dataR('x = ',x,0,2,10);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    case v1 of
    1: begin
         x0 := 0; x1 := x;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j)*(2*j+1));
           end;
       end;
    2: begin
         x0 := 0; x1 := 1;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j-1)*(2*j));
           end;
       end;
    end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
case v1 of
1: Str(sin(x):10:7,s3);
2: Str(cos(x):10:7,s3);
end;
resultComment('Remark: '+s4+'(x) approximately equals '+s3,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
     s0 := 'Ln';
     s2 := '';
     s3 := 'ln(1+x)';
taskText('Write a\ real-valued function Ln1({x}, \e) ({x} and~\e are real numbers, |{x}|\,<\,1, \e\,>\,0)',0,1);
taskText('that returns an approximate value of the function ln(1\,+\,{x}) defined as follows:',0,2);
taskText('\[ln(1\,+\,{x})~=~{x}\;\-\;{x}^2/2\;+\;{x}^3/3\;\-\;\.\;+\;(\-1)^n\*{x}^{n+1}/({n}+1)\;+\;\.~.\]',0,3);
taskText('Stop adding new terms to the sum when the absolute value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function ln(1\;+\;{x}) at a\ given point~{x} for six given~\e.',0,0);
(*
*)
  end;
2: begin
     s0 := 'Arctg';
     s2 := '';
     s3 := 'atan(x)';
taskText('Write a\ real-valued function Atan1({x},\,\e) ({x} and~\e are real numbers, |{x}|\,<\,1, \e\,>\,0)',0,1);
taskText('that returns an approximate value of the function atan({x}) defined as follows:',0,2);
taskText('\[atan({x})~=~{x}\;\-\;{x}^3/3\;+\;{x}^5/5\;\-\;\.\;+\;(\-1)^n\*{x}^{2\*n+1}/(2\*{n}+1)\;+\;\.~.\]',0,3);
taskText('Stop adding new terms to the sum when the absolute value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function atan({x}) at a\ given point~{x} for six given~\e.',0,0);
(*
*)
  end;
end;
(*==*)
x := Random * 1.9-1;
setPrecision(7);
dataR('x = ',x,0,2,10);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
         x0 := 0; x1 := x;
         j := 0;
         while abs(x1)>x2 do
           begin
             x0 := x0+x1;
             inc(j);
             x1 := -x1*x*x/((2*j)*(2*j+1));
           end;
    x0 := 0; x1 := x;
    j := 1;
    case v1 of
    1: while abs(x1)/j>x2 do
         begin
           x0 := x0+x1/j;
           x1 := -x1*x;
           inc(j);
         end;
    2: while abs(x1)/(2*j-1)>x2 do
         begin
           x0 := x0+x1/(2*j-1);
           x1 := -x1*x*x;
           inc(j);
         end;
    end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
case v1 of
1: Str(ln(1+x):10:7,s4);
2: Str(arctan(x):10:7,s4);
end;
resultComment('Remark: '+s3+' approximately equals '+s4,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn45(Name, Key: string);
var v1,v2,v3 : byte;
    a: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(1,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Power4({x}, {a}, \e) ({x}, {a},~\e are real numbers, |{x}|\,<\,1,',0,1);
taskText('{a},\,\e\,>\,0) that returns an approximate value of the function (1\,+\,{x})^a defined as:',2,2);
taskText('\[(1\,+\,{x})^a\;=\;1\;+\;{a}\*{x}\;+\;{a}\*({a}\-1)\*{x}^2/(2!)\;'+
         '+\,\.\,+ {a}\*({a}\-1)\*\.\*({a}\-{n}+1)\*{x}^n/({n}!)\;+\,\.~.\]',0,3);
taskText('Stop adding new terms to the sum when the absolute value of',0,4);
taskText('the next term will be less than~\e. Using this function, find the approximate',0,5);
taskText('values of the function (1\,+\,{x})^a at a\ given point~{x}',0,0);
taskText('for a\ given exponent~{a} and six given~\e.',0,0);
(*
*)
(*==*)
x := Random * 1.9-1;
a := Random * 7;
setPrecision(7);
dataR('x = ',x,xLeft,2,10);
dataR('a = ',a,xRight,2,9);
dataComment('\e: ',2,4);
x2 := 0.1+Random*0.9;
for i := 1 to 6 do
  begin
    x0 := 0; x1 := 1;
    j := 0;
    while abs(x1)>x2 do
      begin
       x0 := x0+x1;
       inc(j);
       x1 := x1*x*(a-j+1)/j;
      end;
    dataR('',x2,center(i,6,10,2)+2,4,10);
    resultR('',x0,center(i,6,10,2)+2,2,10);
    x2 := x2/10*(0.5+Random*0.4);
    if x2<0.0000001 then x2 := 0.0000001;
  end;
Str(exp(a*ln(1+x)):10:7,s3);
resultComment('Remark: (1+x)^a approximately equals '+s3,0,4);
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn46(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(4,0,0,0,v1,v2,v3);
taskText('Write an integer function GCD2({A}, {B}) that returns the \Igreatest common divisor\i',0,1);
taskText('(GCD) of two positive integers~{A} and~{B}. Use the \IEuclidean algorithm\i:',0,2);
taskText('\[GCD({A}, {B})~=~GCD({B}, {A}\;mod\;{B}),\q if {B}~\n~0;\Q    GCD({A}, 0)~=~{A},\]',0,3);
taskText('where \<mod\> denotes the operator of taking the remainder after integer',0,4);
taskText('division. Using this function, find the greatest common divisor for each',0,5);
taskText('of pairs ({A},\;{B}), ({A},\;{C}), ({A},\;{D}) provided that integers~{A}, {B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,2);
for i := 1 to 3 do
  begin
    n2 := n[i]*(Random(300)+1);
    dataN(chr(65+i)+' = ',n2,Center(i,3,7,18),4,2);
    resultN('GCD2(A, '+chr(65+i)+') = ',NOD(n1,n2),center(i,3,15,10),3,2);
  end;
setNumberOfTests(5);
Pause;
end;

procedure Frac1(a,b:integer; var p,q : integer);
var n : integer;
begin
n := NOD(a,b);
p := abs(a div n);
q := abs(b div n);
if a*b<0 then p := -p;
end;

procedure SFun60Cn47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Using the GCD2 function from the task \1, write a\ procedure',0,1);
taskText('Frac1({a}, {b}, {p}, {q}), that simplifies a\ fraction~{a}/{b} to the irreducible form~{p}/{q}',0,2);
taskText('({a} and~{b} are input integer parameters, {p} and~{q} are output integer parameters).',0,3);
taskText('The sign of a\ resulting fraction~{p}/{q} is assigned to its numerator, so {q}~>~0.',0,4);
taskText('Using this procedure, find the numerator and the denominator for each',0,5);
taskText('of irreducible fractions {a}/{b}\;+\;{c}/{d}, {a}/{b}\;+\;{e}/{f}, {a}/{b}\;+\;{g}/{h} provided that',0,0);
taskText('integers~{a}, {b}, {c}, {d}, {e}, {f}, {g},~{h} are given.',0,0);
(*
*)
(*==*)
n1 := -50+Random(100);
repeat
n2 := -50+Random(100);
until n2<>0;
dataN('a = ',n1,Center(1,2,7,4),2,3);
dataN('b = ',n2,Center(2,2,7,4),2,3);
for i := 1 to 3 do
  begin
    n3 := -50+Random(100);
    repeat
    n4 := -50+Random(100);
    until n4<>0;
    dataN(chr(97+2*i)+' = ',n3,Center(2*i-1,6,7,4),4,3);
    dataN(chr(98+2*i)+' = ',n4,Center(2*i,6,7,4),4,3);
    Frac1(n1*n4+n2*n3,n2*n4,n3,n4);
    resultComment('a/b + '+chr(97+2*i)+'/'+chr(98+2*i)+':',10,i+1);
    resultN('Numerator = ',n3,27,i+1,5);
    resultN('Denominator = ',n4,50,i+1,4);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn48(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
    r: real;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Taking into account that the \Ileast common multiple\i of two positive integers\',0,1);
taskText('{A} and~{B} equals {A}\*({B}/GCD({A},\;{B})), where GCD({A},\;{B}) is the greatest common',0,2);
taskText('divisor of~{A} and~{B}, and using the GCD2 function from the task \2,',0,3);
taskText('write an integer function LCM2({A}, {B}) that returns the least common multiple',0,4);
taskText('of~{A} and~{B}. Using this function, find the least common multiple for each',0,5);
taskText('of pairs ({A},\;{B}), ({A},\;{C}), ({A},\;{D}) provided that integers~{A}, {B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,2);
for i := 1 to 3 do
  begin
    repeat
    n2 := n[i]*(Random(30)+1);
    r := (n1/NOD(n1,n2))*n2;
    until r<=32000;
    dataN(chr(65+i)+' = ',n2,Center(i,3,7,16),4,2);
    resultN('LCM2(A, '+chr(65+i)+') = ',(n1 div NOD(n1,n2))*n2,center(i,3,18,6),3,5);
  end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn49(Name, Key: string);
var v1,v2,v3 : byte;
    n : array [1..3] of integer;
    a,b,c,d: Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Taking into account the formula GCD({A}, {B}, {C})~=~GCD(GCD({A}, {B}), {C}) and using the',0,1);
taskText('GCD2 function from the task \3, write an integer function GCD3({A},\,{B},\,{C})',0,2);
taskText('that returns the greatest common divisor of three positive integers~{A}, {B},~{C}.',0,3);
taskText('Using this function, find the greatest common divisor for each of triples',0,4);
taskText('({A},\;{B},\;{C}), ({A},\;{C},\;{D}), ({B},\;{C},\;{D}) provided that integers~{A}, {B}, {C},~{D} are given.',0,5);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
a := n[1] * n[2] * (Random(30)+1);
b := n[2] * n[3] * (Random(30)+1);
c := n[1] * n[2] * n[3];
d := n[1] * n[3] * (Random(30)+1);
dataN('A = ',a,0,2,2);
dataN('B = ',b,Center(1,3,7,18),4,2);
dataN('C = ',c,Center(2,3,7,18),4,2);
dataN('D = ',d,Center(3,3,7,18),4,2);
resultN('GCD3(A, B, C) = ',NOD(NOD(a,b),c),center(1,3,19,6),3,2);
resultN('GCD3(A, C, D) = ',NOD(NOD(a,c),d),center(2,3,19,6),3,2);
resultN('GCD3(B, C, D) = ',NOD(NOD(b,c),d),center(3,3,19,6),3,2);
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ function TimeToHMS({T}) that converts a\ time interval~{T}',0,1);
taskText('(in seconds) into the \<hours~{H}, minutes~{M}, seconds~{S}\> format',0,2);
taskText('and returns the values {H}, {M}, {S} ({T},~{H}, {M},~{S} are integers).',0,3);
taskText('Using this function, find the amount of hours, minutes and seconds',0,4);
taskText('for each of five given time intervals~{T}_1, {T}_2,~\.,\ {T}_5.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  Str(i,s);
  if Random(2)= 0 then
  n := 1 + Random(12000)
  else
  n := 1 + Random(200);
  dataN('T_'+s+' = ',n,0,i,5);
  n1 := n div 3600;
  n := n mod 3600;
  n2 := n div 60;
  n3 := n mod 60;
  resultN('TimeToHMS(T_'+s+'):   H_'+s+' =', n1,18,i,2);
  resultN('M_'+s+' =', n2,44,i,3);
  resultN('S_'+s+' =', n3,54,i,3);
end;
setNumberOfTests(5);
Pause;
end;


procedure SFun60Cn51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ function IncTime({H},\;{M},\;{S},\;{T}) that increases a time interval',0,1);
taskText('in hours~{H}, minutes~{M}, seconds~{S} on {T}~seconds and returns new values',0,2);
taskText('of hours, minutes, and seconds (all numbers are positive integers).',0,3);
taskText('Having input hours~{H}, minutes~{M}, seconds~{S} (as integers) and an integer~{T}',0,4);
taskText('and using the IncTime function, increase the given time interval',0,5);
taskText('on {T}~seconds and output new values of~{H}, {M},~{S}.',0,0);
(*
*)
(*==*)
n1 := Random(3);
n2 := Random(60);
n3 := Random(60);
dataN('H = ',n1,center(1,3,6,6),2,1);
dataN('M = ',n2,center(2,3,6,6),2,2);
dataN('S = ',n3,center(3,3,6,6),2,2);
  case Random(3) of
  0: n := 1 + Random(60);
  1: n := 1 + Random(600);
  2: n := 1 + Random(6000);
  end;
  dataN('T = ',n,0,4,2);
  n := n1*3600 + n2*60 + n3 + n;
  n1 := n div 3600;
  n := n mod 3600;
  n2 := n div 60;
  n3 := n mod 60;
resultN3('IncTime(H, M, S, T) =',n1,n2,n3,0,3,4);
setNumberOfTests(5);
Pause;
end;

function IsLeapYear(n: Integer): Boolean;
begin
  IsLeapYear := (n mod 4 = 0) and ((n mod 100 <> 0) or (n mod 400 =0));
end;

procedure SFun60Cn52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Write a\ logical function IsLeapYear({Y}) that returns \t if a\ year~{Y}',0,1);
taskText('(a\ positive integer parameter) is a\ leap year, and \f otherwise.',0,2);
taskText('Output the return values of this function for five given values of',0,3);
taskText('the parameter~{Y}. Note that a\ year is a\ \Ileap year\i if it is divisible by~4',0,4);
taskText('except for years that are divisible by~100 and are not divisible by~400.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
begin
  Str(i,s);
  n := 1 + Random(25);
  n := n*100;
  if Random(3)=0 then n := n+100
  else n := n+Random(99)+1;
  dataN('Y_'+s+' = ',n,0,i,4);
  resultB('IsLeapYear(Y_'+s+') = ',IsLeapYear(n),0,i);
end;
setNumberOfTests(9);
Pause;
end;

procedure SFun60Cn53(Name, Key: string);
var v1,v2,v3 : byte;
    n, k: Integer;
    m: array[1..3] of Integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(3,0,0,0,v1,v2,v3);
taskText('Using the IsLeapYear function from the task \1, write an integer',0,2);
taskText('function MonthDays({M}, {Y}) that returns the amount of days for \Um{M}-th\um month',0,3);
taskText('of year~{Y} ({M} and~{Y} are integers, 1~\l~{M}~\l~12, {Y}~>~0). Output the return value',0,4);
taskText('of this function for a given year~{Y} and each of given months~{M}_1, {M}_2,~{M}_3.',0,5);
(*
*)
(*==*)
n := 1 + Random(25);
n := n*100;
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
dataN('Y = ',n,0,2,4);
m[1] := 20;
m[2] := 30;
m[3] := 40;
for i := 1 to 3 do
begin
  repeat
  case Random(3) of
    0: m[i] := 2;
    1,2 : m[i] := 1 + Random(12);
  end;
  until (m[1]<>m[2]) and (m[2] <> m[3]) and (m[3] <> m[1]);
  case m[i] of
  1, 3, 5, 7, 8, 10, 12: k := 31;
  4, 6, 9, 11: k := 30;
  2: if IsLeapYear(n) then k := 29
     else k := 28;
  end;
  dataN('M_'+chr(ord('0')+i)+' = ',m[i],center(i,3,6,8),4,2);
  resultN('MonthDays(M_'+chr(ord('0')+i)+', Y) = ',k,0,i+1,2);
end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn54(Name, Key: string);
var v1,v2,v3 : byte;
    m1, m2: Integer;
    day : array[0..11] of integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(4,2,0,0,v1,v2,v3);
day[0] := 31; day[1] := 28; day[2] := 31; day[3] := 30;
day[4] := 31; day[5] := 30; day[6] := 31; day[7] := 31;
day[8] := 30; day[9] := 31; day[10] := 30; day[11] := 31;
case v1 of
  1:
    begin
    s1 := 'PrevDate';
taskText('Using the MonthDays function from the task \1, write a function',0,1);
taskText('PrevDate({D}, {M}, {Y}) that changes a correct date, represented at the \<day~{D},',0,2);
taskText('month number~{M}, year~{Y}\> format, to a previous one and returns new values',0,3);
taskText('of day, month, and year (all numbers are integers). Apply this function',0,4);
taskText('to three given dates and output resulting previous ones.',0,5);
(*
*)
    end;
  2:
    begin
    s1 := 'NextDate';
taskText('Using the MonthDays function from the task \2, write a function',0,1);
taskText('NextDate({D}, {M}, {Y}) that changes a correct date, represented at the \<day~{D},',0,2);
taskText('month number~{M}, year~{Y}\> format, to a next one and returns new values',0,3);
taskText('of day, month, and year (all numbers are integers). Apply this function',0,4);
taskText('to three given dates and output resulting next ones.',0,5);
(*
*)
    end;
end;
(*==*)
for i := 1 to 3 do
begin
n := 1 + Random(25);
n := n*100;
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
m2 := n;
if IsLeapYear(n) then day[1] := 29
else day[1] := 28;
case Random(3) of
  0: if v1 = 2 then m := 1
     else m := 2;
  1,2 : m := Random(12);
end;
m1 := m;
k := Random(3);
if v1 = 2 then
case k of
0 :   begin
        n1 := day[m];
        n2 := 1;
        m1 := (m+1)mod 12;
        if m1 < m then inc(m2);
      end;
1,2 : begin
      if (k=2) and (m<>1) then n1 := day[m]-1
             else n1 := 1 + Random(day[m]-1);
      n2 := n1+1;
    end;
end
else
case k of
0 : begin
      n1 := 1;
      m1 := (m+11) mod 12;
      if m1 > m then dec(m2);
      n2 := day[m1];
    end;
1,2 : begin
      n1 := 2 + Random(day[m]-1);
      n2 := n1-1;
    end;
end;
c := Chr(Ord('0')+i);
dataN('D_'+c+' = ',n1,center(1,3,2,10),i+1,2);
dataN('M_'+c+' = ',m+1,center(2,3,2,10),i+1,2);
dataN('Y_'+c+' = ',n,center(3,3,2,10),i+1,4);
resultN3(s1+'(D_'+c+', M_'+c+', Y_'+c+'):',n2,m1+1,m2,0,i+1,6);
end;
setNumberOfTests(5);
Pause;
end;

procedure SFun60Cn55(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 36{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

function otr(x1,y1,x2,y2:real):real;
begin
otr := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;


procedure SFun60Cn56(Name, Key: string);
var v1,v2,v3 : byte;
    y1, y2: Real;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Write a\ real-valued function Leng({x}_A, {y}_A, {x}_B, {y}_B) that returns the length',0,1);
taskText('of a\ segment~{AB} with given coordinates of its endpoints:',0,2);
taskText('\[|{AB}|~=~\R({x}_A\;\-\;{x}_B)^2\;+\;({y}_A\;\-\;{y}_B)^2\r\]  ({x}_A, {y}_A, {x}_B, {y}_B are real-valued',0,3);
taskText(' parameters). Using this function, find the lengths of segments~{AB}, {AC},~{AD}',0,4);
taskText('provided that coordinates of points~{A},~{B}, {C},~{D} are given.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 20-10; //2018
y1 := RandomR2(-9.9,9.9); //Random * 20-10;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 20-10;
    y2 := RandomR2(-9.9,9.9); //Random * 20-10;
    x0 := otr(x1,y1,x2,y2);
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    resultR('|A'+chr(65+i)+'| = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SFun60Cn57(Name, Key: string);
var v1,v2,v3 : byte;
    y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Using the Leng function from the task \1, write a\ real-valued function',0,1);
taskText('Perim({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C) that returns the perimeter of a\ triangle~{ABC}',0,2);
taskText('with given coordinates of its vertices ({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C are real-valued',0,3);
taskText('parameters). Using the Perim function, find the perimeters of triangles~{ABC},',0,4);
taskText('{ABD},~{ACD} provided that coordinates of points~{A},~{B}, {C},~{D} are given.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 20-10;
y1 := RandomR2(-9.9,9.9); //Random * 20-10;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 20-10;
    y2 := RandomR2(-9.9,9.9); //Random * 20-10;
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

procedure SFun60Cn58(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Using the Leng and Perim functions from the tasks \2 and \1,',0,1);
taskText('write a\ real-valued function Area({x}_A, {y}_A, {x}_B, {y}_B, {x}_C, {y}_C) that returns',0,2);
taskText('the area of a\ triangle~{ABC}:\[  {S}_{ABC}~=~\R{p}\*({p}\-|{AB}|)\*({p}\-|{AC}|)\*({p}\-|{BC}|)\r,\]',0,3);
taskText('where {p}~is the \Ihalf-perimeter\i. Using the Area function, find the areas of',0,4);
taskText('triangles~{ABC}, {ABD},~{ACD} provided that coordinates of points {A},\,{B},\,{C},\,{D} are given.',0,5);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 20-10;
y1 := RandomR2(-9.9,9.9); //Random * 20-10;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 20-10;
    y2 := RandomR2(-9.9,9.9); //Random * 20-10;
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

procedure SFun60Cn59(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Using the Leng and Area functions from the tasks \3 and \1,',0,1);
taskText('write a\ real-valued function Dist({x}_P, {y}_P, {x}_A, {y}_A, {x}_B, {y}_B) that returns',0,2);
taskText('the distance {D}({P}, {AB}) between a\ point~{P} and a\ line~{AB}:\[ {D}({P}, {AB})~=~2\*{S}_{PAB}/|{AB}|,\]',0,3);
taskText('where {S}_{PAB} is the area of the triangle~{PAB}. Using this function,',0,4);
taskText('find the distance between a\ point~{P} and each of lines~{AB}, {AC},~{BC}',0,5);
taskText('provided that coordinates of points~{P},~{A}, {B},~{C} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 20-10;
y1 := RandomR2(-9.9,9.9); //Random * 20-10;
dataR2('P: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 20-10;
    y2 := RandomR2(-9.9,9.9); //Random * 20-10;
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

procedure SFun60Cn60(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Using the Dist function from the task \1, write a function',0,1);
taskText('Alts({x}_A,\;{y}_A,\;{x}_B,\;{y}_B,\;{x}_C,\;{y}_C) that evaluates'+
         ' and returns',0,2);
taskText('the altitudes~{h}_A, {h}_B,~{h}_C drawn from the vertices~{A}, {B},~{C} of a\ triangle~{ABC}',0,3);
taskText('(the coordinates of vertices are input real-valued parameters).',0,4);
taskText('Using this function, evaluate the altitudes of each of triangles~{ABC},',0,5);
taskText('{ABD},~{ACD} provided that the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 20-10;
y1 := RandomR2(-9.9,9.9); //Random * 20-10;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 20-10;
    y2 := RandomR2(-9.9,9.9); //Random * 20-10;
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

begin
Topic1 := 'FUNCTIONS WITH NUMERIC PARAMETERS';
Topic2 := 'FUNCTIONS WITH NUMERIC PARAMETERS';
Topic3 := 'FUNCTIONS: ADDITIONAL TASKS';
{Author := 'Ã.~›.~¿·‡ÏˇÌ, 2002';}
end.
