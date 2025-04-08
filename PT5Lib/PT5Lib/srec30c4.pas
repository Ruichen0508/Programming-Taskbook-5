{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$MODE Delphi}

unit SRec30C4;

interface

procedure SRec30Cn1(Name, Key: string);
procedure SRec30Cn2(Name, Key: string);
procedure SRec30Cn3(Name, Key: string);
procedure SRec30Cn4(Name, Key: string);
procedure SRec30Cn5(Name, Key: string);
procedure SRec30Cn6(Name, Key: string);
procedure SRec30Cn7(Name, Key: string);
procedure SRec30Cn8(Name, Key: string);
procedure SRec30Cn9(Name, Key: string);
procedure SRec30Cn10(Name, Key: string);
procedure SRec30Cn11(Name, Key: string);
procedure SRec30Cn12(Name, Key: string);
procedure SRec30Cn13(Name, Key: string);
procedure SRec30Cn14(Name, Key: string);
procedure SRec30Cn15(Name, Key: string);
procedure SRec30Cn16(Name, Key: string);
procedure SRec30Cn17(Name, Key: string);
procedure SRec30Cn18(Name, Key: string);
procedure SRec30Cn19(Name, Key: string);
procedure SRec30Cn20(Name, Key: string);
procedure SRec30Cn21(Name, Key: string);
procedure SRec30Cn22(Name, Key: string);
procedure SRec30Cn23(Name, Key: string);
procedure SRec30Cn24(Name, Key: string);
procedure SRec30Cn25(Name, Key: string);
procedure SRec30Cn26(Name, Key: string);
procedure SRec30Cn27(Name, Key: string);
procedure SRec30Cn28(Name, Key: string);
procedure SRec30Cn29(Name, Key: string);
procedure SRec30Cn30(Name, Key: string);

implementation

uses PT5TaskMaker;

var code,code1,code2,code3 : byte;
    s : string;
    x,x0,x1,x2,x3,x4,x5 : real;
    m,n,n0,n1,n2,n3,n4,n5 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    b : Boolean;
    count : integer;
    Topic,Topic1,Topic2,Topic3,Author : string;
    s0,s1,s2,s3,s4,s5,s6 : shortstring;
    k : integer;

function tst: string;
begin
  if CurrentLanguage and lg1C <> 0 then 
    tst := '.txt'
  else
    tst := '.tst';
end;

function NOD(x,y : integer) : integer;
var z : integer;
begin
if x=0 then NOD:=y
else NOD := NOD(y mod x,x);
end;

function stroka(N : integer) : string;
const c : string = '0123456789'+
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



function SqrtK(x:real; k,n:integer):real;
var y,yk : real;
    i : integer;
begin
if n=0 then SqrtK := 1
else
  begin
    y := SqrtK(x,k,n-1);
    yk := y;
    for i := 2 to k-1 do yk := yk*y;
    SqrtK := y+(x/yk-y)/k;
  end;
end;

function FileName(len : integer) : string;
const c : string = '0123456789abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to len do
   s := s + c[Random(36)+1];
FileName := s;
end;




procedure SRec30Cn1(Name, Key: string);
var i,j,k: integer;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
taskText('Write a\ recursive real-valued function Fact({N}) that returns',0,2);
taskText('the value of \IN-factorial\i:\[  {N}!~=~1\*2\*\.\*{N},\]',0,3);
taskText('where~{N} (>\,0) is an integer parameter. Using this function,',0,4);
taskText('output factorials of five given integers.',0,5);
(*
*)
setPrecision(1);
for i := 1 to 5 do
  begin
    c := chr(96+i);
    n := Random(18)+1;
    x0 := 1;
    for j := 1 to n do
      x0 := x0 * j;
    dataN(c+' = ',n,0,i,2);
    resultR('Fact('+c+') = ',x0,28,i,18);
  end;
setNumberOfTests(3);
pause;
end;

procedure SRec30Cn2(Name, Key: string);
var i,j,k: integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive real-valued function Fact2({N}) that returns',0,1);
taskText('the value of \Idouble factorial\i of~{N}:\[  {N}!!~=~{N}\*({N}\-2)\*({N}\-4)\*\.,\]',0,2);
taskText('where~{N} (>\,0) is an integer parameter; the last factor of the product',0,3);
taskText('equals~2 if~{N} is an even number, and~1 otherwise. Using this function,',0,4);
taskText('output double factorials of five given integers.',0,5);
(*
*)
(*==*)
setPrecision(1);
for i := 1 to 5 do
  begin
    c := chr(96+i);
    n := Random(18)+1;
    x1 := n;
    j := n;
    while j>2 do
      begin
        j := j-2;
        x1 := x1*j;
      end;
    dataN(c+' = ',n,0,i,2);
    resultR('Fact2('+c+') = ',x1,27,i,11);
  end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30Cn3(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive real-valued function PowerN({X},\;{N}) that returns the power {X}^N',0,1);
taskText('({X}~\n~0 is a\ real number, {N}~is an integer) calculated as follows:',0,2);
taskText('\[{X}^{\,0}~=~1,\|  {X}^{\,N}~=~({X}^{\,N div 2})^{2} if {N} is a\ positive even number,\|',0,3);
taskText('{X}^{\,N}~=~{X}\*{X}^{\,N\-1} if {N} is a\ positive odd number,\|  {X}^{\,N}~=~1/{X}^{\,\-N} if {N}~<~0,\]',0,4);
taskText('where \<div\> denotes the operator of \Iinteger division\i. Using this function,',0,5);
taskText('output powers {X}^N for a\ given real number~{X} and five given integers~{N}.',0,0);
(*
*)
(*==*)
x := RandomR2(-25,25); //Random * 50-25; //2018
dataR('X = ',x,38,2,6);
setPrecision(0);
n := -6;

for i := 1 to 5 do
  begin
    n :=n + Random(4)+1;
    x0 := 1;
    for j := 1 to abs(n) do
      x0 := x0*x;
    if n<0 then x0 := 1/x0;
    dataN('N_'+chr(i+48)+' = ',n,center(i,5,7,5),4,2);
    resultR('PowerN(X, N_'+chr(i+48)+') =',x0,0,i,15);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SRec30Cn4(Name, Key: string);
var cnt,i:integer;
    n: array [1..5] of integer;
    v1, v2, v3: Byte;
function  Fib(n:integer):integer;
begin
inc(cnt);
if n in [1,2] then Fib := 1
else
  Fib := Fib(n-2)+Fib(n-1);
end;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Write a\ recursive integer function Fib1({N}) that returns the Fibonacci',0,1);
taskText('number~{F}_{N} ({N}~is a\ positive integer). The \IFibonacci numbers\i~{F}_{K} are defined as:',0,2);
taskText('\[ {F}_{1}~=~{F}_{2}~=~1,\Q   {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('Using the function Fib1, find the Fibonacci numbers~{F}_{N} for five given',0,4);
taskText('integers~{N}; output the value of each Fibonacci number and also the amount',0,5);
taskText('of the recursive function calls, which are required for its calculation.',0,0);
(*
*)
end;
2: begin
taskText('Write a\ recursive integer function Fib2({N}) that returns the Fibonacci',0,1);
taskText('number~{F}_{N} ({N}~is a\ positive integer). The \IFibonacci numbers\i~{F}_{K} are defined as:',0,2);
taskText('\[ {F}_{1}~=~{F}_{2}~=~1,\Q   {F}_{K}~=~{F}_{K\-2}\;+\;{F}_{K\-1},\q  {K}~=~3,\;4,\;\.~.\]',0,3);
taskText('The integer~{N} is assumed to be not greater than~20. Decrease the amount',0,4);
taskText('of recursive calls of the function Fib2 (in comparison with the Fib1 function',0,5);
taskText('from the task \1) by means of using an additional array of integers',0,0);
taskText('that should store the Fibonacci numbers \Ihaving been calculated\i. Using',0,0);
taskText('the Fib2 function, output the Fibonacci numbers~{F}_{N} for five given integers~{N}.',0,0);
(*
*)
end;
end;
repeat
n[1] := 1+Random(5);
for i := 2 to 5 do
  n[i] := n[i-1]+1+Random(5);
until n[5]<=16;
for i := 1 to 5 do
begin
  cnt := 0;
  dataN('N_'+chr(I+48)+' = ',n[i],center(i,5,7,6),3,1);
  str(n[i]:2,s);
  case v1 of
  1: begin
       resultN('Fib1(N_'+chr(I+48)+') = ',Fib(n[i]),xLeft,i,3);
       resultN('Amount of calls: ',cnt,xRight,i,4);
     end;
  2: begin
       resultN('Fib2(N_'+chr(I+48)+') = ',Fib(n[i]),0,i,3);
     end;
  end;
end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30Cn5(Name, Key: string);
var i,j,k : integer;
    m: array [1..5] of integer;
    cnt:integer;
function C_(m,n:integer):integer;
begin
cnt:= cnt+1;
if (m=0)or(m=n) then C_ := 1
else C_ := C_(m,n-1)+C_(m-1,n-1);
end;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive integer function Combin1({N},\;{K}) that returns~{C}({N},\,{K})',0,1);
taskText('(the \Inumber of combinations\i of~{N} objects taken~{K} at a\ time) using',0,2);
taskText('the following recursive relations ({N} and~{K} are integers, {N}~>~0, 0~\l~{K}~\l~{N}):',0,3);
taskText('\[{C}({N},\,0)~=~C({N},\,{N})~=~1,\|   {C}({N},\,{K})~=~{C}({N}\,\-\,1,\,{K})\;+\;'+
         '{C}({N}\,\-\,1,\,{K}\,\-\,1)\q  if 0~<~{K}~<~{N}.\]',0,4);
taskText('Using the function Combin1, find the numbers~{C}({N},\,{K}) for a\ given integer~{N}',0,5);
taskText('and five given integers~{K}; output the value of each number and also the amount',0,0);
taskText('of the recursive function calls, which are required for its calculation.',0,0);
(*
*)
(*==*)
n := Random(11)+4;
dataN('N = ',n,0,2,1);
str(n,s1);
if n=4 then
  for i := 1 to 5 do m[i] := i-1
else
repeat
m[1] := Random(5);
for i := 2 to 5 do
  m[i] := m[i-1]+1+Random(5);
until m[5]<=n;
for i := 1 to 5 do
  begin
    cnt := 0;
    dataN('K_'+chr(I+48)+' = ',m[i],center(i,5,7,6),4,1);
    str(m[i]:length(s1),s2);
    resultN('Combin1(N, K_'+chr(I+48)+') = ',C_(m[i],n),xLeft,i,4);
    resultN('Amount of calls: ',cnt,xRight,i,4);
  end;
setNumberOfTests(3);
Pause;
end;



procedure SRec30Cn6(Name, Key: string);
var i,j,k : integer;
    m: array [1..5] of integer;
    cnt:integer;
function C_(m,n:integer):integer;
begin
cnt:= cnt+1;
if (m=0) then C_ := 1
else C_ := C_(m-1,n)*(n-m+1) div m;
end;

begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive integer function Combin2({N},\;{K}) that returns~{C}({N},\,{K})',0,1);
taskText('(the \Inumber of combinations\i of~{N} objects taken~{K} at a\ time) using',0,2);
taskText('the following recursive relations ({N} and~{K} are integers, {N}~>~0, 0~\l~{K}~\l~{N}):',0,3);
taskText('\[{C}({N},\,0)~=~C({N},\,{N})~=~1,\|   {C}({N},\,{K})~=~{C}({N}\,\-\,1,\,{K})\;+\;'+
         '{C}({N}\,\-\,1,\,{K}\,\-\,1)\q  if 0~<~{K}~<~{N}.\]',0,4);
taskText('The integer~{N} is assumed to be not greater than~20. Decrease the amount',0,5);
taskText('of recursive calls of the function Combin2 (in comparison with the Combin1',0,0);
taskText('function from the task \1) by means of using an additional',0,0);
taskText('two-dimensional array of integers that should store the numbers~{C}({N},\,{K})',0,0);
taskText('\Ihaving been calculated\i. Using the Combin2 function, output',0,0);
taskText('the numbers~{C}({N},\,{K}) for a\ given integer~{N} and five given integers~{K}.',0,0);
(*
*)
(*==*)
n := Random(11)+4;
dataN('N = ',n,0,2,1);
str(n,s1);
if n=4 then
  for i := 1 to 5 do m[i] := i-1
else
repeat
m[1] := Random(5);
for i := 2 to 5 do
  m[i] := m[i-1]+1+Random(5);
until m[5]<=n;
for i := 1 to 5 do
  begin
    cnt := 0;
    dataN('K_'+chr(I+48)+' = ',m[i],center(i,5,7,6),4,1);
    str(m[i]:length(s1),s2);
    resultN('Combin2(N, K_'+chr(I+48)+') = ',C_(m[i],n),0,i,4);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SRec30Cn7(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive real-valued function RootK({X},\;{K},\;{N}) that returns',0,1);
taskText('an approximate value of a\ \Um{K}-th\um root of~{X} using the following formulas:',0,2);
taskText('\[{Y}_{0}~=~1,\Q  {Y}_{N+1}~=~{Y}_{N}\;\-\;({Y}_{N}\;\-\;{X}/({Y}_{N})^{K\-1})/{K},\]',0,3);
taskText('where~{X} (>\,0) is a\ real number, {K} (>\,1), {N} (>\,0) are integers, {Y}_{N} denotes',0,4);
taskText('RootK({X},\;{K},\;{N}) for a\ fixed values of~{X} and~{K}. Using this function, output',0,5);
taskText('approximate values of a\ \Um{K}-th\um root of~{X} for a\ given~{X}, {K} and six integers~{N}.',0,0);
(*




*)
(*==*)
x := RandomR2(0.1,50); //Random * 50; //2018
k := Random(6)+2;
dataR('X = ',x,xLeft,2,5);
dataN('K = ',k,xRight,2,1);
setPrecision(8);
n := 0;

for i := 1 to 6 do
  begin
    n :=n + Random(3)+1;
    x0 := sqrtK(x,k,n);
    dataN('N_'+chr(i+48)+' = ',n,center(i,6,7,6),4,1);
    resultR('',x0,center(i,6,11,2),2,11);
  end;
Str(exp(ln(x)/k):10:8,s0);
Str(k,s1);
Str(x:0:2,s2);
case k of
2: s1 := 'square';
3: s1 := 'cube';
else s1 := s1 + '-th';
end;
resultComment('Remark: a '+s1+' root of '+s2+' equals '+s0,0,4);
setNumberOfTests(3);
Pause;
end;


procedure SRec30Cn8(Name, Key: string);
var i,j,k : integer;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive integer function GCD({A},\;{B}) that returns the \Igreatest\i',0,1);
taskText('\Icommon divisor\i of two positive integers~{A} and~{B}. Use the \IEuclidean algorithm\i:',0,2);
taskText('\[GCD({A},\;{B})~=~GCD({B}, {A}\;mod\;{B}),\q if {B}~\n~0;\Q  GCD({A},\;0)~=~{A},\]  where \<mod\> denotes',0,3);
taskText('the operator of taking the remainder after integer division. Using',0,4);
taskText('this function, find the greatest common divisor for each of pairs ({A},\;{B}),',0,5);
taskText('({A},\;{C}), ({A},\;{D}) provided that integers~{A}, {B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
for i := 1 to 3 do
  n[i] := Random(30)+1;
n1 := n[1]*n[2]*n[3];
dataN('A = ',n1,0,2,4);
for i := 1 to 3 do
  begin
    n2 := n[i]*(Random(300)+1);
    dataN(chr(65+i)+' = ',n2,Center(i,3,8,16),4,4);
    resultN('GCD(A, '+chr(65+i)+') = ',NOD(n1,n2),center(i,3,18,6),3,3);
  end;
setNumberOfTests(3);
Pause;
end;


procedure SRec30Cn9(Name, Key: string);
var i,j,k : integer;
function dsum(k: integer):integer;
begin
if k < 0 then dsum := dsum(-k)
else
  if (k>=0) and (k<=9) then dsum := k
  else
    dsum := k mod 10 + dsum(k div 10);
end;
begin
start(Name,Topic1,Author,Key,83{level1});(*DEMO*)
getVariant(4,0,0,0,code,code1,code2);
taskText('Write a\ recursive integer function DigitSum({K}) that returns',0,2);
taskText('the sum of digits of an integer~{K} (the loop statements should not be used).',0,3);
taskText('Using this function, output the sum of digits for each of five given integers.',  0,4);
(*
*)
for i := 1 to 5 do
  begin
    c := chr(48+i);
    n := Random(30000)+1;
    if Random(2) = 0 then n := -n;
    dataN('K_'+c+' = ',n,0,i,6);
    resultN('DigitSum(K_'+c+') = ',dsum(n),0,i,2);
  end;
setNumberOfTests(3);
pause;
end;

function Digits(s : string) : integer;
function Digits0(i: integer):integer;
var
  j: integer;
begin
if i > length(s) then Digits0 := 0
else
  begin
  if s[i] in ['0'..'9'] then j := 1
  else j := 0;
  Digits0 := j + Digits0(i+1);
  end;
end;
begin
  Digits := Digits0(1);
end;
procedure SRec30Cn10(Name, Key: string);
var i,j,k,n : integer;
begin
start(Name,Topic1,Author,Key,83{level1});
getVariant(4,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Write a\ recursive integer function MaxElem({A},\;{N}) that returns the maximal',0,2);
taskText('element of an array~{A} of {N}~integers (1~\l~{N}~\l~10; the loop statements',0,3);
taskText('should not be used). Using this function, output the maximal elements',  0,4);
taskText('of three given arrays~{A}, {B},~{C} whose sizes are~{N}_A, {N}_B,~{N}_C respectively.',  0,5);
(*
*)
  end;
2: begin
taskText('Write a\ recursive integer function DigitCount({S}) that returns the amount',0,2);
taskText('of digit characters in a\ string~{S} (the loop statements should not be used).',0,3);
taskText('Using this function, output the amount of digit characters',0,4);
taskText('for each of five given strings.',0,5);
(*
*)
end;
end;
(*==*)
case Code of
1:
begin
for i := 1 to 3 do
  begin
    c := chr(64+i);
    n := Random(10)+1;
    dataN('N_'+c+' = ',n,3,1+i,1);
    dataComment(c+': ',13,1+i);
    k := -100;
    for j := 1 to n do
      begin
        m := 10 + Random(90);
        dataN('',m,Center(j+2,12,2,4),1+i,2);
        if k<m then k := m;
      end;
    resultN('MaxElem('+c+', N_'+c+') = ',k,0,1+i,3);
   end;
end;
2:
begin
for i := 1 to 5 do
  begin
  c := chr(48+i);
  s := Stroka(Random(20)+10);
  dataS('S_'+c+' = ',s,27,i);
  resultN('DigitCount(S_'+c+') = ',Digits(s),0,i,1);
  end;
end;
end;
setNumberOfTests(3);
Pause;
end;
procedure SRec30Cn11(Name, Key: string);
var i,j,k : integer;
    n : array [1..3] of integer;
begin
start(Name,Topic1,Author,Key,83{level1});
taskText('Write a\ recursive logical function Palindrome({S}) that returns \t',0,1);
taskText('if a\ string~{S} is a\ \Ipalindrome\i (i.~e., it is read equally both from left',0,2);
taskText('to right and from right to left), and \f otherwise; the loop statements',0,3);
taskText('should not be used. Output return values of this function',0,4);
taskText('for five given string parameters.',0,5);
(*
*)
(*==*)
for i := 1 to 5 do
  begin
  c := chr(48+i);
      s := Stroka(Random(10)+5);
      for j := length(s)-Random(2) downto 1 do
        s := s + s[j];
      b:= true;
      if Random(2)=0 then
        begin
          inc(s[random(length(s) div 2)+1]);
          b := false;
        end;
  dataS('S_'+c+' = ',s,27,i);
  resultB('Palindrome(S_'+c+') = ',b,0,i);
  end;
setNumberOfTests(9);
Pause;
end;


procedure SRec30Cn12(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 83{level1});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


    



function Vir1 : string;
var z:char;
begin
inc(count);
if (count>5)or(Random(4)<1) then Vir1 := chr(48+Random(10))
else
  begin
  case Random(3) of
  0: z := '+';
  1: z := '-';
  2: z := '*';
  end;
  Vir1 := '('+Vir1+z+Vir1+')';
  end;
end;
function Calc1 : integer;
var z,z1:char; i1,i2 : integer;
begin
if s[count] in ['0'..'9'] then begin Calc1 := ord(s[count])-48; inc(count);end
else
  begin
    inc(count);
    i1 := Calc1;
    z := s[count]; inc(count);
    i2 := Calc1;
    inc(count);
    case z of
    '+' : Calc1 := i1+i2;
    '-' : Calc1 := i1-i2;
    '*' : Calc1 := i1*i2;
    end;
  end;
end;
function Vir9 : string;
var z:char;
begin
inc(count);
if (count>6)or(Random(4)<2) then Vir9 := chr(48+Random(10))
else
  begin
  case Random(2) of
  0: z := 'M';
  1: z := 'm';
  end;
  Vir9 := z+'('+Vir9+','+Vir9+')';
  end;
end;
function Calc9 : integer;
var z,z1:char; i1,i2 : integer;
begin
if s[count] in ['0'..'9'] then begin Calc9 := ord(s[count])-48; inc(count);end
else
  begin
    z := s[count];
    inc(count);
    inc(count);
    i1 := Calc9;
    inc(count);
    i2 := Calc9;
    inc(count);
    case z of
    'M' : if i1 > i2 then Calc9 := i1 else Calc9 := i2;
    'm' : if i1 < i2 then Calc9 := i1 else Calc9 := i2;
    end;
  end;
end;



function Check1 : Boolean;
var z,z1:char; i1,i2 : integer;
begin
if count>length(s) then begin Check1 := false; exit; end;
if s[count] in ['0'..'9'] then begin Check1 := true; inc(count);end
else
  begin
    if s[count] <> '(' then begin Check1 := False; exit; end;
    inc(count);
    if not Check1 then begin Check1 := False; exit; end;
    if (count>length(s)) or (not (s[count] in ['+','-','*'])) then begin Check1 := False; exit; end;
    inc(count);
    if not Check1 then begin Check1 := False; exit; end;
    if (count>length(s)) or (s[count] <> ')') then begin Check1 := False; exit; end;
    inc(count);
    Check1 := true;
  end;
end;
function Check1a : integer;
var z,z1:char; i : integer;
begin
if count>length(s) then begin Check1a := count; exit; end;
if s[count] in ['0'..'9'] then begin Check1a := 0; inc(count);end
else
  begin
    if s[count] <> '(' then begin Check1a := count; exit; end;
    inc(count);
    i := Check1a;
    if i<>0 then begin Check1a := i; exit; end;
    if (count>length(s)) or (not (s[count] in ['+','-','*'])) then begin Check1a := count; exit; end;
    inc(count);
    i := Check1a;
    if i<>0 then begin Check1a := i; exit; end;
    if (count>length(s)) or (s[count] <> ')') then begin Check1a := count; exit; end;
    inc(count);
    Check1a := 0;
  end;
end;
function Vir2 : string;
var i : integer; s : string;
begin
s := chr(48+Random(10));
for i := 1 to Random(7) do
  begin
  case Random(2) of
  0: s := s + '+';
  1: s := s + '-';
  end;
  s := s + chr(48+Random(10));
  end;
Vir2 := s;
end;
function Vir3 : string;
var i,c : integer; s : string;
begin
s := chr(48+Random(10));
c := 0;
for i := 1 to Random(7) do
  begin
  if c = 4 then
  case Random(2) of
  0: begin s := s + '+'; c := 0; end;
  1: begin s := s + '-'; c := 0; end;
  end
  else
  case Random(4) of
  0,1: begin s := s + '*'; c := c + 1; end;
  2: begin s := s + '+'; c := 0; end;
  3: begin s := s + '-'; c := 0; end;
  end;
  s := s + chr(48+Random(10));
  end;
Vir3 := s;
end;
var Vir4K: Integer;
function Vir4 : string;
var i,c : integer; s : string[80];
begin
  Vir4K := Vir4K + 1;
  if (Random(3)=0) and (Vir4K <= 6) then
  s := '('+vir4+')'
  else
  s := chr(48+Random(10));
  c := 0;
for i := 1 to Random(3)+1 do
  begin
  if c = 4 then
  case Random(2) of
  0: begin s := s + '+'; c := 0; end;
  1: begin s := s + '-'; c := 0; end;
  end
  else
  case Random(4) of
  0,1: begin s := s + '*'; c := c + 1; end;
  2: begin s := s + '+'; c := 0; end;
  3: begin s := s + '-'; c := 0; end;
  end;
  if (Random(3)=0) and (Vir4K <= 6) then
  s := s + '('+vir4+')'
  else
  s := s + chr(48+Random(10));
  end;
Vir4 := s;
end;
function Calc2(s : string) : integer;
var count : integer;
function vir : integer;
var i : integer; z : char;
begin
i :=ord(s[count])-48;  dec(count);
if (count>0) and (s[count]in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir + i;
    '-': i := vir - i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc2 := vir;
end;
function Calc3(s : string) : integer;
var count : integer;
function chlen : integer;
var i : integer;
begin
i :=ord(s[count])-48;  dec(count);
if (count>0) and (s[count]='*') then
  begin
    dec(count);
    i := chlen * i;
  end;
chlen := i;
end;
function vir : integer;
var i : integer; z : char;
begin
i := chlen;
if (count>0) and (s[count] in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir+i;
    '-': i := vir-i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc3 := vir;
end;
function Calc4(s : string) : real;
var count : integer;
function vir:real; forward;
function elem : real;
var i : integer;
begin
if (count>0) and (s[count]=')') then
  begin
    dec(count);
    elem := vir;
  end
else
    elem :=ord(s[count])-48;
dec(count);
end;
function chlen : real;
var i : real;
begin
i :=elem;
if (count>0) and (s[count]='*') then
  begin
    dec(count);
    i := chlen * i;
  end;
chlen := i;
end;
function vir : real;
var i : real; z : char;
begin
i := chlen;
if (count>0) and (s[count] in ['+','-']) then
  begin
    z := s[count];
    dec(count);
    case z of
    '+': i := vir+i;
    '-': i := vir-i;
    end;
  end;
vir := i;
end;
begin
count := length(s);
Calc4 := vir;
end;
function lCon(i:integer):char;
begin
if i=0 then lCon := 'F'
else lCon := 'T';
end;
function Vir5 : string;
var s:string;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(3) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
      s := s+Vir5+','+Vir5+')';
  end;
Vir5 := s;
end;
function Vir6 : string;
var s:string; i : integer;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(3) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
    begin
      for i:=1 to Random(4) do
        s := s+Vir6+',';
      s := s + Vir6+')';
    end;
  end;
Vir6 := s;
end;
function Vir7 : string;
var s,z:string; i : integer;
begin
inc(count);
if (count>6) then s := lCon(Random(2))
else
  begin
  case Random(5) of
  0: s := 'And(';
  1: s := 'Or(';
  2: s := 'Not('+Vir7+')';
  3,4: s := lCon(Random(2));
  end;
  if s[1]in ['A','O'] then
    begin
      for i:=1 to Random(4) do
        s := s+Vir7+',';
      s := s + Vir7+')';
    end;
  end;
Vir7 := s;
end;
function Vir8 : string;
var s,z:string; i : integer;
begin
inc(count);
if (count>6) then s := chr(48+Random(10))
else
  begin
  case Random(4) of
  0: s := 'M(';
  1: s := 'm(';
  2,3: s := chr(48+Random(10));
  end;
  if s[1]in ['M','m'] then
    begin
      for i:=1 to 2 + Random(3) do
        s := s+Vir8+',';
      s := s + Vir8+')';
    end;
  end;
Vir8 := s;
end;


function Calc5(s : string) : Boolean;
var count : integer;
function vir : Boolean;
var b: boolean;i : integer; z : char;
begin
if s[count] in ['T','F'] then
  begin
  case s[count] of
  'T' : vir := true;
  'F' : vir := false;
  end;
  inc(count);
  end
else
 begin
 if s[count]='O' then
   begin
     count := count + 3;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir or b;    {‚ ˝ÚÓÏ ÔÓˇ‰ÍÂ!}
       end;
   end
 else
   begin
     count := count + 4;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir and b;
       end;
   end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc5 := vir;
end;
function Calc7(s : string) : Boolean;
var count : integer;
function vir : Boolean;
var b: boolean;i : integer; z : char;
begin
if s[count] in ['T','F'] then
  begin
  case s[count] of
  'T' : vir := true;
  'F' : vir := false;
  end;
  inc(count);
  end
else
 begin
 case s[count] of
 'O':
   begin
     count := count + 3;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir or b;    {‚ ˝ÚÓÏ ÔÓˇ‰ÍÂ!}
       end;
   end;
 'A':
   begin
     count := count + 4;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := vir and b;
       end;
   end;
 'N':
   begin
     count := count + 4;
     b := not vir;
   end;
 end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc7 := vir;
end;
function Calc8(s : string) : integer;
var count : integer;
function min(a,b: integer): integer;
begin
if a < b then min := a
else min := b;
end;
function max(a,b: integer): integer;
begin
if a > b then max := a
else max := b;
end;
function vir : integer;
var b: integer;i : integer; z : char;
begin
if s[count] in ['0'..'9'] then
  begin
  vir := ord(s[count])-ord('0');
  inc(count);
  end
else
 begin
 case s[count] of
 'M':
   begin
     count := count + 2;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := max(vir,b);    {‚ ˝ÚÓÏ ÔÓˇ‰ÍÂ!}
       end;
   end;
 'm':
   begin
     count := count + 2;
     b := vir;
     while s[count]=',' do
       begin
         inc(count);
         b := min(vir,b);
       end;
   end;
 end;
 Vir := b;
 inc(count);
 end;
end;
begin
count := 1;
Calc8 := vir;
end;
procedure SRec30Cn13(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,2);
taskText('output the value of this expression. The expression is defined as follows:',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & <digit> | <expression>\,+\,<digit> |&\,&\,& <expression>\,\-\,<digit>\j\]',0,4);
(*
*)
count := 0;
s := Vir2;
dataS('S = ',s,0,3);
resultN('',Calc2(s),0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30Cn14(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,2);
taskText('output the value of this expression. The expression is defined as follows:',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & <term> | <expression>\,+\,<term> |&\,&\,& <expression>\,\-\,<term>&',7,4);
taskText('<term>       & \M::=\m & <digit> | <term>\,*\,<digit>\j\]',7,5);
(*
*)
count := 0;
s := Vir3;
dataS('S = ',s,0,3);
resultN('',Calc3(s),0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30Cn15(Name, Key: string);
var i,j,k : integer;
    r: real;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,1);
taskText('output the value of this expression. The expression is defined as follows:',0,2);
taskText('\[\Jlcl&<expression> & \M::=\m & <term> | <expression>\,+\,<term> |&\,&\,& <expression>\,\-\,<term>&',7,3);
taskText('<term>       & \M::=\m & <element> | <term>\,*\,<element>&',7,4);
taskText('<element>    & \M::=\m & <digit> | (<expression>)\j\]',7,5);
(*
*)

count := 0;
while true do
begin
Vir4K := 0;
s := Vir4;
if length(s)<30 then
  begin
    r := Calc4(s);
    if abs(r)<32000 then break;
  end;
end;
dataS('S = ',s,0,3);
resultN('',Round(r),0,3,2);
setNumberOfTests(9);
pause;
end;

procedure SRec30Cn16(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,2);
taskText('output the value of this expression. The expression is defined as follows:',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & <digit> |&\,&\,& (<expression><operator><expression>)&',10,4);
taskText('<operator>   & \M::=\m & + | \- | *\j\]',10,5);
(*
*)

count := 0;
s := Vir1;
dataS('S = ',s,0,3);
count := 1;
resultN('',Calc1,0,3,2);
setNumberOfTests(9);
pause;
end;
procedure SRec30Cn17(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('A nonempty string~{S} that represents an expression of integer type is given',0,2);
taskText('(see the expression definition in \1). Output \t if the given',0,3);
taskText('expression is a\ correct one, otherwise output \f.',0,4);
(*
*)
count := 0;
s := Vir1;
if Random(2)=0 then
  for i := 1 to {Random(3) +} 1 do
  case Random(13) of
  0 : insert(chr(48+Random(10)),s,random(length(s)+1));
  1 : insert('(',s,random(length(s)+1));
  2 : insert(')',s,random(length(s)+1));
  3 : insert('*',s,random(length(s)+1));
  4 : insert('+',s,random(length(s)+1));
  5 : insert(chr(65+Random(23)),s,random(length(s)+1));
  6 : insert(chr(48+Random(10)),s,1);
  7..8: s := s + chr(48+Random(10));
  9..12: if length(s)>2 then delete(s,2+Random(length(s)-2),200);
  end;
dataS('S = ',s,0,3);
count := 1;
resultB('',Check1 and (count=length(s)+1),0,3);
setNumberOfTests(9);
pause;
end;
procedure SRec30Cn18(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('A nonempty string~{S} that represents an expression of integer type is given',0,2);
taskText('(see the expression definition in \2). Output~0 if the given',0,3);
taskText('expression is a\ correct one, otherwise output the order number',0,4);
taskText('of its first character that is invalid, superfluous or missing.',0,5);
(*
*)
(*==*)
count := 0;
s := Vir1;
if Random(2)=0 then
  for i := 1 to {Random(3) +} 1 do
  case Random(13) of
  0 : insert(chr(48+Random(10)),s,random(length(s)+1));
  1 : insert('(',s,random(length(s)+1));
  2 : insert(')',s,random(length(s)+1));
  3 : insert('*',s,random(length(s)+1));
  4 : insert('+',s,random(length(s)+1));
  5 : insert(chr(65+Random(23)),s,random(length(s)+1));
  6 : insert(chr(48+Random(10)),s,1);
  7..8: s := s + chr(48+Random(10));
  9..12: if length(s)>2 then delete(s,2+Random(length(s)-2),200);
  end;
dataS('S = ',s,0,3);
count := 1;
i := check1a;
if count <> length(s)+1 then i := count;
resultN('',i,0,3,2);
setNumberOfTests(9);
Pause;
end;


procedure SRec30Cn19(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,1);
taskText('output the value of this expression. The expression is defined as follows',0,2);
taskText('(functions~M and~m return their maximal and minimal argument respectively):',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & <digit> | M(<expression>\,,\,<expression>) |',10,4);
taskText('&\,&\,&                   m(<expression>\,,\,<expression>)\j\]',10,5);
(*
*)
(*==*)
count := 0;
s := Vir9;
dataS('S = ',s,0,3);
count := 1;
resultN('',Calc9,0,3,2);
setNumberOfTests(9);
Pause;
end;



procedure SRec30Cn20(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});(*DEMO*)
taskText('Given a\ string~{S} that represents a\ correct expression of logical type,',0,1);
taskText('output the value of this expression. The expression is defined as follows',0,2);
taskText('(\<T\> means \t, \<F\> means \f):',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & T | F | And(<expression>\,,\,<expression>) |',10,4);
taskText('&\,&\,&                   Or(<expression>\,,\,<expression>)\j\]',10,5);
(*
*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir5;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',calc5(s),0,3);
setNumberOfTests(9);
pause;
end;

procedure SRec30Cn21(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Given a\ string~{S} that represents a\ correct expression of integer type,',0,1);
taskText('output the value of this expression. The expression is defined as follows',0,2);
taskText('(functions~M and~m return their maximal and minimal argument respectively):',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & <digit> | M(<arguments>) | m(<arguments>)&',10,4);
taskText('<arguments>  & \M::=\m & <expression> | <expression>\,,\,<arguments>\j\]',10,5);
(*
*)
(*==*)
if Random(8)=0 then s := chr(48+Random(10))
else
repeat
count := 0;
s := Vir8;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultN('',calc8(s),0,3,2);
setNumberOfTests(9);
Pause;
end;


procedure SRec30Cn22(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Given a\ string~{S} that represents a\ correct expression of logical type,',0,1);
taskText('output the value of this expression. The expression is defined as follows',0,2);
taskText('(\<T\> means \t, \<F\> means \f):',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & T | F | And(<arguments>) | Or(<arguments>)&',10,4);
taskText('<arguments>  & \M::=\m & <expression> | <expression>\,,\,<arguments>\j\]',10,5);
(*
*)
(*==*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir6;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',calc5(s),0,3);
setNumberOfTests(9);
Pause;
end;
procedure SRec30Cn23(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic2,Author,Key,83{level2});
taskText('Given a\ string~{S} that represents a\ correct expression of logical type,',0,1);
taskText('output the value of this expression. The expression is defined as follows',0,2);
taskText('(\<T\> means \t, \<F\> means \f):',0,3);
taskText('\[\Jlcl&<expression> & \M::=\m & T | F | And(<arguments>) |',10,4);
taskText('&\,&\,&                   Or(<arguments>) | Not(<expression>)&',10,5);
taskText('<arguments>  & \M::=\m & <expression> | <expression>\,,\,<arguments>\j\]',10,0);
(*
*)
(*==*)
if Random(8)=0 then s := lCon(Random(2))
else
repeat
count := 0;
s := Vir7;
until (length(s)<30) and (length(s)>1);
dataS('S = ',s,0,3);
resultB('',Calc7(s),0,3);
setNumberOfTests(9);
Pause;
end;


procedure SRec30Cn24(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic, Author, Key, 83{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;








procedure SRec30Cn25(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..10] of integer;
procedure step(n0,k0 : integer);
var i : integer;
begin
  s[n0] := k0;
  if n0=n then
    begin
      s1 := '';     
      for i := 1 to n do
        s1 := s1 + char(48+s[i]);
      writeln(T,s1);
    end
  else
    for i := 1 to k do
      step(n0+1,i);
end;
begin
start(Name,Topic3,Author,Key,83{level3});(*DEMO*)
taskText('A tree of depth~{N} is given. Each internal node of the tree has~{K} (<\,10)',0,1);
taskText('children that are numbered from~1 (the most left child) to~{K} (the most right',0,2);
taskText('child). The number of the tree root is~0. Create a\ text file (with a\ given',0,3);
taskText('name) whose lines contain paths from the root to all tree leaves. Paths must',0,4);
taskText('be ordered from the \Imost left path\i (\<011...1\>) to the \Imost right path\i (for',0,5);
taskText('instance, \<033...3\> provided that K~=~3); the last nodes of path',0,0);
taskText('must be changed faster than the first ones.',0,0);
(*
*)
repeat
n := Random(10)+2;
k := 2 + Random(6);
x := exp((n-1)*ln(k));
until x<500;
s0 := FileName(8)+tst;
dataN('N = ',n-1,xLeft,2,1);
dataN('K = ',k,xRight,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to k do
  step(2,i);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(5);
pause;
end;
procedure SRec30Cn26(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..10] of integer;
procedure step(n0,k0 : integer);
var i : integer;
begin
  s[n0] := k0;
  if n0=n then
    begin
      s1 := '';
      for i := 1 to n do
        s1 := s1 + char(48+s[i]);
      writeln(T,s1);
    end
  else
    for i := 1 to k do
      if i <> k0 then
      step(n0+1,i);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
taskText('A tree of depth~{N} is given. Each internal node of the tree has~{K} (<\,10)',0,1);
taskText('children that are numbered from~1 (the most left child) to~{K} (the most right',0,2);
taskText('child). The number of the tree root is~0. Create a\ text file (with a\ given',0,3);
taskText('name) whose lines contain paths from the root to all tree leaves; each path',0,4);
taskText('must satisfy the following additional condition: adjacent nodes of the path',0,5);
taskText('have different numbers. The order of paths must be the same as in \1.',0,0);
(*
*)
(*==*)
repeat
n := Random(10)+2;
k := 2 + Random(6);
x := exp((n-1)*ln(k));
until x<500;
s0 := FileName(8)+tst;
dataN('N = ',n-1,xLeft,2,1);
dataN('K = ',k,xRight,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to k do
  step(2,i);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(5);
Pause;
end;
procedure SRec30Cn27(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..2] of char;
    w : array [0..2] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if n0=n then
    begin
    if sum = 0 then
    begin
      s1 := '';
      for i := 1 to n do
        s1 := s1 + c[s[i]];
      writeln(T,s1);
    end;
    end
  else
    if abs(sum)<=n-n0 then
      {œÓ‚˚¯‡ÂÚ ˝ÙÙÂÍÚË‚ÌÓÒÚ¸, ÛÏÂÌ¸¯‡ˇ ˜ËÒÎÓ ÂÍÛÒË‚Ì˚ı ‚˚ÁÓ‚Ó‚ k:
      n               3    5    7    9    11    13
      k ·ÂÁ ÔÓ‚ÂÍË  6    30   126  510  2046  8190
      k Ò ÔÓ‚ÂÍÓÈ   6    26   98   362  1342  5014
      ÓÚÌÓ¯ÂÌËÂ       1    0.87 0.78 0.71 0.66  0.61
      }
      for i := 1 to 2 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});(*DEMO*)
taskText('A tree of depth~{N} is given ({N}~is an even number). Each internal node',0,1);
taskText('of the tree has two children; the left child \<A\> with the weight~1 and',0,2);
taskText('the right child \<B\> with the weight~\-1. The tree root \<C\> has the weight~0.',0,3);
taskText('Create a\ text file (with a\ given name) whose lines contain paths from the root',0,4);
taskText('to all tree leaves; each path must satisfy the following additional',0,5);
taskText('condition: the total weight of all path nodes is equal to~0. The order',0,0);
taskText('of paths must be the same as in \2.',0,0);
(*
*)
c[0] := 'C';
c[1] := 'A';
c[2] := 'B';
w[0] := 0;
w[1] := 1;
w[2] := -1;
n := 2*(Random(5)+1)+1;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 2 do
  step(2,i,0);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

pause;
end;
procedure SRec30Cn28(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..2] of char;
    w : array [0..2] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if k*sum>=0 then
    if n0=n then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
    else
      for i := 1 to 2 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
k := 1;
taskText('A tree of depth~{N} is given; see the description of tree nodes in \1.',0,1);
taskText('Create a\ text file (with a\ given name) whose lines contain paths from the root',0,2);
taskText('to all tree leaves; each path must satisfy the following additional condition:',0,3);
taskText('the total weight of any initial part of the path nodes is nonnegative.',0,4);
taskText('The order of paths must be the same as in \3.',0,5);
(*
*)
(*==*)
c[0] := 'C';
c[1] := 'A';
c[2] := 'B';
w[0] := 0;
w[1] := 1;
w[2] := -1;
n := Random(11)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 2 do
  step(2,i,0);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;

procedure SRec30Cn29(Name, Key: string);
var i,j,k : integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..3] of char;
    w : array [0..3] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
  if k*sum>=0 then
    if n0=n then
     begin
      if sum = 0 then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
     end
    else
    if abs(sum)<=n-n0 then
      for i := 1 to 3 do
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
     k := -1;
taskText('A tree of depth~{N} is given. Each internal node of the tree has three children;',0,1);
taskText('the left child~\<A\> with the weight~1, the middle child~\<B\> with the weight~0,',0,2);
taskText('the right child~\<C\> with the weight~\-1. The tree root~\<D\> has the weight~0.',0,3);
taskText('Create a\ text file (with a\ given name) whose lines contain paths from the root',0,4);
taskText('to all tree leaves; each path must satisfy two additional conditions:',0,5);
taskText('the total weight of any initial part of the path nodes is nonnegative,',0,0);
taskText('and the total weight of all path nodes equals~0. The order of paths',0,0);
taskText('must be the same as in \4.',0,0);
(*
*)
(*==*)
c[0] := 'D';
c[1] := 'A';
c[2] := 'B';
c[3] := 'C';
w[0] := 0;
w[1] := 1;
w[2] := 0;
w[3] := -1;
n := Random(8)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 3 do
  step(2,i,0);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;


procedure SRec30Cn30(Name, Key: string);
var i,j: integer;
    T : text;
    s : array [1..15] of integer;
    c : array [0..3] of char;
    w : array [0..3] of integer;
procedure step(n0,k0,sum : integer);
var i : integer;
begin
  s[n0] := k0;
  sum := sum +w[k0];
    if n0=n then
     begin
      if sum = 0 then
      begin
        s1 := '';
        for i := 1 to n do
          s1 := s1 + c[s[i]];
        writeln(T,s1);
      end
     end
    else
      for i := 1 to 3 do
      if i <> s[n0] then
        step(n0+1,i,sum);
end;
begin
start(Name,Topic3,Author,Key,83{level3});
taskText('A tree of depth~{N} is given; see the description of tree nodes in \1.',0,1);
taskText('Create a\ text file (with a\ given name) whose lines contain paths from the root',0,2);
taskText('to all tree leaves; each path must satisfy two additional conditions:',0,3);
taskText('adjacent nodes of the path have different letters, and the total weight of all',0,4);
taskText('path nodes equals~0. The order of paths must be the same as in \5.',0,5);
(*
*)
(*==*)
c[0] := 'D';
c[1] := 'A';
c[2] := 'B';
c[3] := 'C';
w[0] := 0;
w[1] := 1;
w[2] := 0;
w[3] := -1;
n := Random(9)+2;
s0 := FileName(8)+tst;
dataN('N = ',n-1,0,2,1);
dataS('File name: ',s0,0,4);
Assign(T,s0);
Rewrite(T);
s[1] := 0;
for i := 1 to 3 do
  step(2,i,0);
Close(T);
resultComment('File contents:',0,1);
resultFileT(s0,2,5);
setNumberOfTests(7);

Pause;
end;

begin
Topic1 := 'RECURSION: SIMPLE ALGORITHMS';
Topic2 := 'RECURSION: PARSING OF EXPRESSIONS';
Topic3 := 'RECURSION: BACKTRACKING';
{Author := 'M.~E.~Abramyan, 2002';}
end.
