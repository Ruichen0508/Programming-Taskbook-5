{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SStr60C4;

{$MODE Delphi}

interface

procedure SStr60Cn1(Name, Key: string);
procedure SStr60Cn2(Name, Key: string);
procedure SStr60Cn3(Name, Key: string);
procedure SStr60Cn4(Name, Key: string);
procedure SStr60Cn5(Name, Key: string);
procedure SStr60Cn6(Name, Key: string);
procedure SStr60Cn7(Name, Key: string);
procedure SStr60Cn8(Name, Key: string);
procedure SStr60Cn9(Name, Key: string);
procedure SStr60Cn10(Name, Key: string);
procedure SStr60Cn11(Name, Key: string);
procedure SStr60Cn12(Name, Key: string);
procedure SStr60Cn13(Name, Key: string);
procedure SStr60Cn14(Name, Key: string);
procedure SStr60Cn15(Name, Key: string);
procedure SStr60Cn16(Name, Key: string);
procedure SStr60Cn17(Name, Key: string);
procedure SStr60Cn18(Name, Key: string);
procedure SStr60Cn19(Name, Key: string);
procedure SStr60Cn20(Name, Key: string);
procedure SStr60Cn21(Name, Key: string);
procedure SStr60Cn22(Name, Key: string);
procedure SStr60Cn23(Name, Key: string);
procedure SStr60Cn24(Name, Key: string);
procedure SStr60Cn25(Name, Key: string);
procedure SStr60Cn26(Name, Key: string);
procedure SStr60Cn27(Name, Key: string);
procedure SStr60Cn28(Name, Key: string);
procedure SStr60Cn29(Name, Key: string);
procedure SStr60Cn30(Name, Key: string);
procedure SStr60Cn31(Name, Key: string);
procedure SStr60Cn32(Name, Key: string);
procedure SStr60Cn33(Name, Key: string);
procedure SStr60Cn34(Name, Key: string);
procedure SStr60Cn35(Name, Key: string);
procedure SStr60Cn36(Name, Key: string);
procedure SStr60Cn37(Name, Key: string);
procedure SStr60Cn38(Name, Key: string);
procedure SStr60Cn39(Name, Key: string);
procedure SStr60Cn40(Name, Key: string);
procedure SStr60Cn41(Name, Key: string);
procedure SStr60Cn42(Name, Key: string);
procedure SStr60Cn43(Name, Key: string);
procedure SStr60Cn44(Name, Key: string);
procedure SStr60Cn45(Name, Key: string);
procedure SStr60Cn46(Name, Key: string);
procedure SStr60Cn47(Name, Key: string);
procedure SStr60Cn48(Name, Key: string);
procedure SStr60Cn49(Name, Key: string);
procedure SStr60Cn50(Name, Key: string);
procedure SStr60Cn51(Name, Key: string);
procedure SStr60Cn52(Name, Key: string);
procedure SStr60Cn53(Name, Key: string);
procedure SStr60Cn54(Name, Key: string);
procedure SStr60Cn55(Name, Key: string);
procedure SStr60Cn56(Name, Key: string);
procedure SStr60Cn57(Name, Key: string);
procedure SStr60Cn58(Name, Key: string);
procedure SStr60Cn59(Name, Key: string);
procedure SStr60Cn60(Name, Key: string);

implementation

uses PT5TaskMaker;

//3 буквы E!
const NS = 115;
      NP = 61;
      slovo: array [0..NS-1] of string[14] =
('ABSTRACT','ACKNOWLEDGE','ADVANTAGE','AGAIN','ALREADY','ALTERATION',
'ALTHOUGH','ANYWAY','APERTURE','APPLICATION','BEFORE','CACHE','CHARACTER',
'CIRCUMSTANCE','CLASS','COALESCE','COMMUNICATION','CONCEPT','CONFIGURATION',
'CONSEQUENCE','CURSOR','CYCLE','DECREASE','DEDICATION','DEFENSE',
'DEFINITION','DEGREE','DEMAND','DERIVE','DESCENDANCE','EFFICIENCY',
'EITHER','ELSEWHERE','ENCLOSE','ENDFILE','ENDPAGE','ENVIRONMENT',
'ESCAPE','ESTIMATE','EVIDENCE','EXCHANGE','EXERCISE','EXPERIENCE',
'EXPOSE','EXPRESSION','GENERALIZATION','GIVING','HANDSHAKING','HOUSEKEEPING',
'IDENTIFICATION','IMPERFECTION','IMPLEMENTATION','INADEQUATE','INCEPTION',
'INCIDENCE','INCOMPLETE','INCONSISTENT','INCREASE','INDEED','INFLECTION',
'INNOVATION','INQUIRY','INSTALLATION','INTERACTION','INTERFACE','INTERVENTION',
'INVOCATION','LABEL','MAGNIFICATION','MALFUNCTION','MANAGEMENT','MANUFACTURER',
'MEMBER','NOTATION','OMISSION','PIECE','POLYGONAL','PURPOSE','QUANTIZATION',
'QUIESCENCE','RECOGNITION','RELEASE','REPRODUCER','RESIDUE','RESOURCES',
'RESPONSE','RETRY','RETURN','REUSE','SCHEDULE','SENSE','SENTENCE',
'SEQUENCE','SERIALIZE','SERIES','SEVERE','SHELL','SINGING','SLEEVE',
'STRESS','SUBSET','SUBSTITUTE','SYSTEM','TARGET','TELEPROCESSING',
'THEMSELVES','THICKNESS','TITLE','TOGETHER','TOLERANCE','TRANSFER',
'TRANSIT','UNEXPECTEDLY','UNLESS','WINDOW');
       predl: array[0..NP-1] of string[80] =
('Nothing is as easy as it looks.',
'Anything that can go wrong will go wrong.',
'Left to themselves, things tend to go from bad to worse.',
'It is impossible to make anything foolproof because fools are so ingenious.',
'Every solution breeds new problems.',
'All great discoveries are made by mistake.',
'Computers are unreliable, but humans are even more unreliable.',
'If an experiment works, something has gone wrong.',
'When all else fails, read the instructions.',
'Any instrument when dropped will roll into the least accessible corner.',
'Any simple theory will be worded in the most complicated way.',
'Build a system that even a fool can use and only a fool will want to use it.',
'If you do not like the answer, you should not have asked the question.',
'A memorandum is written not to inform the reader but to protect the writer.',
'Any order that can be misunderstood has been misunderstood.',
'Most general statements are false, including this one.',
'Live within your income, even if you have to borrow to do so.',
'If you are feeling good, do not worry: you will get over it.',
'You always find something the last place you look.',
'Anything is possible, but nothing is easy.',
'Anytime things appear to be going better, you have overlooked something.',
'If you explain so clearly that nobody can misunderstand, somebody will.',
'No action is without side effects.',
'Any program will expand to fill available memory.',
'Any nontrivial program contains at least one bug.',
'Paper is always strongest at the perforations.',
'Never argue with a fool: people might not know the difference.',
'Food that tastes the best has the highest number of calories.',
'Opportunity always knocks at the least opportune moment.',
'Of two possible events, only the undesired one will occur.',
'The faster the plane, the narrower the seats.',
'What men learn from history is that men do not learn from history.',
'Nothing is so good as it seems beforehand.',
'The other line moves faster.',
'Never replicate a successful experiment.',
'Teamwork is essential; it allows you to blame someone else.',
'Blessed is he who expects nothing, for he shall not be disappointed.',
'Nothing is so simple it cannot be misunderstood.',
'The new hardware will break down as soon as the old is disconnected and out.',
'Complex problems have simple, easy to understand wrong answers.',
'A computer makes as many mistakes in two seconds as 20 men working 20 years.',
'Machines should work; people should think.',
'Friends may come and go, but enemies accumulate.',
'Any wire cut to length will be too short.',
'A failsafe circuit will destroy others.',
'A failure will not appear until a unit has passed final inspection.',
'Climate is what we expect; weather is what we get.',
'No good deed goes unpunished.',
'The most important leg of a three legged stool is the one that is missing.',
'If the facts do not conform to the theory, they must be disposed of.',
'The easiest way of making money is to stop losing it.',
'It is better to have a horrible ending than to have horrors without end.',
'The longer the title, the less important the job.',
'There are no winners in life; only survivors.',
'You cannot tell how deep a puddle is until you step into it.',
'There is a solution to every problem; the only difficulty is finding it.',
'A good plan today is better than a perfect plan tomorrow.',
'Laziness is the mother of nine inventions out of ten.',
'An object will fall so as to do the most damage.',
'It is easier to get forgiveness than permission.',
'Whenever you set out to do something, something else must be done first.');

function LowCase(c: char): char;
begin
  if c in ['A'..'Z'] then
    inc(c,32);
  LowCase := c;
end;

function digits(N : integer) : string;
const c : string = '0123456789';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(10)+1];
digits := s;
end;

function latsymbs(N : integer) : string;
const c : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
                   'abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(52)+1];
latsymbs := s;
end;

function stroka(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'()[]{}!?$%';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(72)+1];
stroka := s;
end;
function strokaASCII(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(62)+1];
strokaASCII := s;
end;
procedure FileName(var full, disk, dir, name, ext:string);
const c : string = '0123456789abcdefghijklmnopqrstuvwxyz';
var s: string;
    k,i: integer;
begin
disk := chr(random(10)+97)+':';
dir := '\';
for i:=1 to random(5) do
  begin
   s := '';
   for k:=1 to random(8)+1 do
      s := s + c[Random(36)+1];
// 01.2007
   if (length(s)>3) and (random(3)=0) then
     insert('.',s,length(s)-Random(3));
// =======
   dir := dir + s + '\';
  end;
name := '';
for i:=1 to random(8)+1 do
   name := name + c[Random(36)+1];
ext := '';
if Random(3) <> 0 then
begin
for i:=1 to random(4) do
   ext := ext + c[Random(36)+1];

full := disk + dir + name + '.' + ext;
end
else
full := disk + dir + name;
end;

var s,s0,s1,s2,s3,s4: string;
    k,n,m,n1,n2,k1,k2: integer;
    c,c1,c2: char;
    Topic, Topic1, Topic2, Topic3, Author : string;
    var count: integer;

procedure SStr60Cn1(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Given a\ character~{C}, output its numeric value in the character set.',0,3);
(*
Для определения кодового номера символа следует использовать функцию Ord.
*)
(*==*)
n := Random(95)+32;
dataC('C = ',chr(n),0,3);
resultN('Numeric value of C: ',n,0,3,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn2(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Given an integer~{N} (32~\l~{N}~\l~126),',0,2);
taskText('output a\ character with the numeric value~{N} in the character set.',0,4);
(*
Для определения символа с\ данным кодовым номером следует использовать функцию Chr.
*)
(*==*)
n := Random(95)+32;
dataN('N = ',n,0,3,3);
resultC('Character with the numeric value N: ',chr(n),0,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn3(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Given a character~{C}, output two characters:',0,2);
taskText('the first character precedes~{C} in the character set,',0,3);
taskText('the second one follows~{C} in the character set.',0,4);
(*
*)
(*==*)
n := Random(93)+33;
dataC('C = ',chr(n),0,3);
resultC('',chr(n-1),xLeft,3);
resultC('',chr(n+1),xRight,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn4(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Given an integer~{N} (1~\l~{N}~\l~26),',0,2);
taskText('output {N}~first \Icapital\i (that is, uppercase) letters',0,3);
taskText('of the English alphabet (\<A\>, \<B\>, \<C\>, and so\ on).',0,4);
(*
*)
(*==*)
n := Random(18)+1;
dataN('N = ',n,0,3,2);
for i := 1 to n do
  resultC('',chr(ord('A')-1+i),center(i,n,3,1),3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Given an integer~{N} (1~\l~{N}~\l~26),',0,2);
taskText('output {N}~last \Ismall\i (that is, lowercase) letters',0,3);
taskText('of the English alphabet in inverse order (\<z\>, \<y\>, \<x\>, and so\ on).',0,4);
(*
*)
(*==*)
n := Random(18)+1;
dataN('N = ',n,0,3,2);
for i := 1 to n do
  resultC('',chr(ord('z')+1-i),center(i,n,3,1),3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('A character~{C} representing a\ digit or a\ letter of the Latin alphabet is given.',0,2);
taskText('If {C}~is a\ digit then output the string \<digit\>, if {C}~is a\ capital letter',0,3);
taskText('then output the string \<capital\>, otherwise output the string \<small\>.',0,4);
(*
*)
(*==*)
n := Random(3);
case curtest of //2012
2: n := 1;
4: n := 2;
5: n := 0;
end;
case n of
0: begin
   s := digits(1);
   c := s[1];
   s := 'digit';
   end;
1: begin
   s := latSymbs(1);
   c := UpCase(s[1]);
   s := 'capital';
   end;
2: begin
   s := latSymbs(1);
   c := LowCase(s[1]);
   s := 'small';
   end;
end;
dataC('C = ',c,0,3);
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60Cn7(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Given a nonempty string, output numeric values',0,2);
taskText('of its first and last character in the character set.',0,4);
(*
Для доступа к\ {i}-му символу строки~{S} в\ языке \UP достаточно применить
к\ строке операцию индексирования (как к\ обычному массиву): \MS[i]\m.
В\ языке \UV следует использовать функцию Mid.
*)
(*==*)
s := strokaASCII(Random(15)+4);
dataS('',s,0,3);
resultN('Numeric value of the first character: ',Ord(s[1]),0,2,3);
resultN('Numeric value of the last character:  ',Ord(s[length(s)]),0,4,3);
setNumberOfTests(3);
Pause;
end;


procedure SStr60Cn8(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an integer~{N} (>\,0) and a\ character~{C},',0,2);
taskText('output a\ string that is of length~{N} and contains characters~{C}.',0,4);
(*
*)
(*==*)
   n := Random(14)+1;
   s := latsymbs(1);
   c := s[1];
   for i := 1 to n-1 do s := s + c;
   dataN('N = ',n,0,2,2);
   dataC('C = ',c,0,4);
   resultS('',s,0,3);
setNumberOfTests(5);
Pause;
end;

procedure SStr60Cn9(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Given an even integer~{N} (>\,0) and two characters~{C}_1, {C}_2,',0,2);
taskText('output a string that is of length~{N}, begins with~{C}_1,',0,3);
taskText('and contains alternating characters~{C}_1 and~{C}_2.',0,4);
(*
*)
   n := (Random(10)+1)*2;
s := latsymbs(1);
c1 := s[1];
s := digits(1);
c2 := s[1];
s := '';
for i:=1 to n div 2 do
  s := s + c1 + c2;
dataN('N = ',n,0,2,2);
dataC('C_1 = ',c1,xLeft,4);
dataC('C_2 = ',c2,xRight,4);
resultS('',s,0,3);
setNumberOfTests(5);
pause;
end;



procedure SStr60Cn10(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('Given a\ string, output a\ new string that contains',0,2);
taskText(' the given string characters in inverse order.',0,4);
(*
Решение этого задания приводится в п.\,10.3.
*)
s := stroka(Random(15)+4);
dataS('',s,0,3);
s0 := s;
n := Length(s);
for i := 1 to n do
  s0[i] := s[n-i+1];
resultS('',s0,0,3);
setNumberOfTests(3);
pause;
end;

procedure SStr60Cn11(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Given a\ nonempty string, output a\ new string that contains',0,2);
taskText('the given string characters separated by a\ blank character.',0,4);
(*
*)
(*==*)
s := stroka(Random(15)+4);
dataS('S = ',s,0,3);
s0 := s[1];
n := Length(s);
for i := 2 to n do
  s0 := s0 + ' '+s[i];
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60Cn12(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Given a\ nonempty string and an integer~{N} (>\,0), output a\ new string',0,2);
taskText('that contains the given string characters separated by {N}~characters \<*\>.',0,4);
(*
*)
(*==*)
repeat
s := stroka(Random(15)+4);
n := Random(5)+1;
s0 := s[1];
for i := 2 to Length(s) do
begin
  for j := 1 to n do
    s0 := s0 + '*';
  s0 := s0 + s[i];
end;
until length(s0)<75;
dataS('S = ',s,0,2);
dataN('N = ',n,0,4,1);
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;




procedure SStr60Cn13(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60Cn14(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SStr60Cn15(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Given a\ string, find the amount of digits in the string.',0,3);
(*
*)
   end;
2: begin
taskText('Given a\ string, find the amount of Latin capital letters in the string.',0,3);
(*
*)
   end;
3: begin
taskText('Given a\ string, find the amount of Latin letters in the string.',0,3);
(*
*)
   end;
end;
(*==*)
s := stroka(Random(20)+10);
dataS('',s,0,3);
n := 0;
for i := 1 to length(s) do
  case v1 of
  1 : if s[i] in ['0'..'9'] then inc(n);
  2 : if s[i] in ['A'..'Z'] then inc(n);
  3 : if s[i] in ['A'..'Z','a'..'z'] then inc(n);
  end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;



procedure SStr60Cn16(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(2, 3, 0, 0, v1, v2, v3);
case v1 of
1: taskText('Given a\ string, convert all Latin capital letters of the string to lowercase.',0,3);
(*
*)
2: begin
   taskText('Given a\ string, convert all Latin small letters of the string to uppercase.',0,3);
(*
*)
end;
3: begin
   taskText('Given a\ string, convert all Latin capital letters of the string to lowercase',0,2);
   taskText(' and all Latin small letters of the string to uppercase.',0,4);
(*
*)
end;
end;
(*==*)
s := stroka(Random(15)+10);
dataS('',s,0,3);
s0 := s;
for i := 1 to length(s) do
  case v1 of
  1:  if s[i] in ['A'..'Z'] then s0[i] := Chr(Ord(s[i])+32);
  2:  if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32);
  3:  begin
         if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32)
         else
         if s[i] in ['A'..'Z'] then s0[i] := Chr(Ord(s[i])+32);
       end;
  end;
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;
procedure SStr60Cn17(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('A string is given. If the string represents an integer then output~1,',0,2);
taskText('if the string represents a\ real number (with nonzero fractional part)',0,3);
taskText('then output~2, otherwise output~0. A fractional part of a real number',0,4);
taskText('is preceded by the \Idecimal point\i \<.\>.',0,5);
(*
В языке \UP используйте процедуру Val.
*)
n := Random(3);
case curtest of //2012
3: n := 2;
5,6: n := 0;
7: n := 1;
end;
case n of
0 : case Random(3) of
    0 : s := stroka(random(7)+5)+chr(random(60)+65);
    1 : begin
          Str(random*10000-5000:0:random(5)+2,s);
          Insert('-',s,Random(length(s))+ 2);
        end;
    2 : begin
          Str(random*10000-5000:0:random(5)+2,s);
          Insert('.',s,Random(length(s))+1);
        end;
    end;
1 : Str(integer(random(20000))-10000,s);
2 : Str(random*10000-5000:0:random(5)+2,s);
end;
dataS('',s,0,3);
n := n;
resultN('',n,0,3,1);
setNumberOfTests(9);
pause;
end;
procedure SStr60Cn18(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
     taskText('Given a\ positive integer, output all digit characters',0,2);
     taskText('in the decimal representation of the integer (from left to right).',0,4);
(*
Используйте процедуру Str. Следует обратить внимание на\ то,
что\ вывести требуется не\ строку, а\ \Iмассив символов\i.
*)
   end;
2: begin
     taskText('Given a\ positive integer, output all digit characters',0,2);
     taskText('in the decimal representation of the integer (from right to left).',0,4);
(*
+
*)
   end;
end;
(*==*)
n := Random(32100)+ 10;
dataN('',n,0,3,5);
Str(n,s);
Str(length(s),s0);
resultComment('Set of '+s0+' digit characters:',0,2);
for i := 1 to Length(s) do
case v1 of
1 : resultC('',s[i],center(i,length(s),3,5),4);
2 : resultC('',s[length(s)-i+1],center(i,length(s),3,5),4);
end;
setNumberOfTests(4);
Pause;
end;

procedure SStr60Cn19(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Given a string that represents a\ positive integer,',0,2);
taskText('output the sum of digits of this integer.',0,4);
(*
Для того чтобы по\ символу~{c}, изображающему цифру, определить
соответствующее число, можно воспользоваться следующим выражением:
Ord({c})\,\-\,Ord(\<0\>).
*)
(*==*)
k := 1+random(32000);
Str(k,s);
dataS('',s,0,3);
m := 0;
for i := 1 to length(s) do
  begin
  s0 := s[i];
  val(s0,k1,k);
  m := m + k1;
  end;
resultN('',m,0,3,3);
setNumberOfTests(4);
Pause;
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



procedure SStr60Cn20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Given a string that represents an arithmetic expression of the form', 0, 2);
  TaskText('\<<digit>\+< digit>\+\.\+<digit>\> with operators \<+\> and \<\-\> only', 0, 3);
  TaskText('(for example, \<4+7\-2\-8\>), output the value of given expression as an integer.', 0, 4);
(*
*)
(*==*)
repeat
count := 0;
s := Vir2;
n := Calc2(s);
until (n>-10) and (n<99);
dataS('',s,0,3);
resultN('',n,0,3,3);
setNumberOfTests(9);
Pause;
end;




procedure SStr60Cn21(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Given a\ string with the binary representation of a\ positive integer,',0,2);
taskText('output a\ new string with the decimal representation of this integer.',0,4);
(*
*)
end;
2: begin
taskText('Given a\ string with the decimal representation of a\ positive integer,',0,2);
taskText('output a\ new string with the binary representation of this integer.',0,4);
(*
*)
end;
end;
(*==*)
case v1 of
1 : begin
      n := 3+Random(8);
      k := 0;
      m := 1;
      s := '';
      for i := 1 to n-1 do
        if Random(2)=0 then
          begin
            s := '0'+s;
            m := m * 2;
          end
        else
          begin
            s := '1'+s;
            k := k + m;
            m := 2*m;
          end;
      s := '1'+s;
      k := k + m;
      m := 2*m;
      Str(k,s0);
   end;
2 : begin
      n := 1+Random(1000);
      Str(n,s);
      m := 512;
      k := 0;
      s0 := '';
      for i := 1 to 10 do
        begin
          if n div m = 1 then s0 := s0+'1'
          else s0 := s0+'0';
          n := n mod m;
          m := m div 2;
        end;
      m := 0;
      for i := 1 to length(s0) do
        if s0[i]='1' then break
        else Inc(m);
      s0 := Copy(s0,m+1,length(s0));
   end;
end;
dataS('',s,0,3);
resultS('',s0,0,3);
setNumberOfTests(4);
Pause;
end;


procedure SStr60Cn22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60Cn23(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;




procedure SStr60Cn24(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('An integer~{N} (>\,0) and a\ string~{S} are given. Transform the string~{S}',0,2);
taskText('to a\ new string of length~{N} as follows: if the length of~{S} is greater than~{N}',0,3);
taskText('then remove its first characters, if the length of~{S} is less than~{N}',0,4);
taskText('then add characters \<.\> to the beginning of~{S}.',0,5);
(*
*)
(*==*)
s := strokaASCII(2 + Random(13));
n := 2 + Random(13);
case curtest of //2012
3: while length(s) >= n do n := 10 + Random(8);
4: while length(s) <= n do n := 1 + Random(6);
end;
dataN('N = ',n,0,2,1);
dataS('S = ',s,0,4);
if length(s) > n then s := copy(s,length(s)-n+1,n)
else
  for i:=length(s)+1 to n do
     s := '.'+s;
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60Cn25(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Two positive integers~{N}_1, {N}_2 and two strings~{S}_1, {S}_2 are given.',0,2);
taskText('Output new string that contains {N}_1~first characters of the string~{S}_1',0,3);
taskText('and {N}_2~last characters of the string~{S}_2 (in that order).',0,4);
(*
*)
(*==*)
s1 := strokaASCII(10 + Random(13));
s2 := strokaASCII(10 + Random(13));
k1 := random(length(s1)-1)+2;
k2 := random(length(s2)-1)+2;
dataN('N_1 = ',k1,xLeft,2,1);
dataN('N_2 = ',k2,xRight,2,1);
dataS('S_1 = ',s1,xLeft,4);
dataS('S_2 = ',s2,xRight,4);
s := copy(s1,1,k1) + copy(s2,length(s2)-k2+1,k2);
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60Cn26(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Given a\ character~{C} and a\ string~{S},',0,2);
taskText('double each occurrence of the character~{C} in the string~{S}.',0,4);
(*
Просмотр символов следует проводить с\ конца строки
*)
(*==*)
s1 := strokaASCII(Random(10)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s2 := '';
for i := 1 to k do
  begin
  s2 := s2 + s1[i];
  if s1[i]=c1 then s2 := s2 + c1;
  end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,0,4);
resultS('',s2,0,3);
setNumberOfTests(6);
Pause;
end;


procedure SStr60Cn27(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('Given a character~{C} and two strings~{S}, {S}_0,',0,2);
taskText('insert the string~{S}_0 into the string~{S}',0,3);
taskText('before each occurrence of the character~{C}.',0,4);
(*
*)
s1 := strokaASCII(Random(8)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
s2 := strokaASCII(2+Random(3));
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s3 := '';
for i := 1 to k do
    begin
       if s1[i]=c1 then s3 := s3 + s2;
       s3 := s3 + s1[i];
      end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,xLeft,4);
dataS('S_0 = ',s2,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
pause;
end;


procedure SStr60Cn28(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('Given a character~{C} and two strings~{S}, {S}_0,',0,2);
taskText('insert the string~{S}_0 into the string~{S}',0,3);
taskText('after each occurrence of the character~{C}.',0,4);
(*
*)
(*==*)
s1 := strokaASCII(Random(8)+8);
s2 := strokaASCII(1);
k := length(s1);
c1 := s2[1];
s2 := strokaASCII(2+Random(3));
for i := 1 to Random(5)+2 do
  s1[Random(k)+1] := c1;
s3 := '';
for i := 1 to k do
    begin
       s3 := s3 + s1[i];
       if s1[i]=c1 then s3 := s3 + s2;
      end;
dataC('C = ',c1,0,2);
dataS('S = ',s1,xLeft,4);
dataS('S_0 = ',s2,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;




procedure SStr60Cn29(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Two strings~{S}, {S}_0 are given. If the string~{S}_0',0,2);
taskText('is a\ substring of~{S} then output \t, otherwise output \f.',0,4);
(*
*)
(*==*)
s1 := strokaASCII(Random(5)+20);
n:=random(3);
case curtest of //2012
3: n := 0;
5: n := 1;
end;
s2 := strokaASCII(Random(4)+3);
if n=0 then
    k := pos(s2,s1)
else
  begin
    if pos(s2,s1) <> 0 then k := pos(s2,s1)
    else
      begin
        k := Random(length(s1)-length(s2))+1;
        for i := 1 to length(s2) do
          s1[k+i-1] := s2[i];
      end;
  end;
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultB('',k<>0,0,3);
setNumberOfTests(9);
Pause;
end;
procedure SStr60Cn30(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Two strings~{S}, {S}_0 are given.',0,2);
taskText('Find the amount of occurrences of~{S}_0 in the string~{S}.',0,4);
(*
*)
(*==*)
n:=random(7);
if n>5 then n:=0;
case curtest of //2012
2: n := 1+random(5);
4: n := 0;
end;
s2 := strokaASCII(Random(4)+3);
s1 := strokaASCII(Random(5));
for i := 1 to n do
  s1 := s1 + s2 + strokaASCII(Random(5));
s1 := s1 +strokaASCII(Random(5));
if length(s1)<25 then
  s1 := strokaASCII(5) + s1 + strokaASCII(20-length(s1));
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultN('',n,0,3,1);
setNumberOfTests(6);
Pause;
end;
procedure SStr60Cn31(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Two strings~{S}, {S}_0 are given.',0,2);
taskText('Remove the first occurrence of~{S}_0 from the string~{S}.',0,3);
taskText('If the string~{S} does not contain required substrings then do not change it.',0,4);
(*
*)
end;
2: begin
taskText('Two strings~{S}, {S}_0 are given.',0,2);
taskText('Remove the last occurrence of~{S}_0 from the string~{S}.',0,3);
taskText('If the string~{S} does not contain required substrings then do not change it.',0,4);
(*
*)
end;
3: begin
taskText('Two strings~{S}, {S}_0 are given.',0,2);
taskText('Remove all occurrences of~{S}_0 from the string~{S}.',0,3);
taskText('If the string~{S} does not contain required substrings then do not change it.',0,4);
(*
*)
end;
end;
(*==*)
n:=random(7);
if n>5 then n:=0;
case curtest of //2012
3: n := 1+random(5);
5: n := 0;
end;
s2 := strokaASCII(Random(3)+3);
s1 := strokaASCII(Random(5));
s3 := s1;
for i := 1 to n do
  case v1 of
1:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=1 then s3 := s3+s
  else
    s3 := s3+s2+s;
  end;
2:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=n then s3 := s3+s
  else
    s3 := s3+s2+s;
  end;
3:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  s3 := s3 + s;
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
s3 := s3 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  s3 := s + s3 + s4;
  end;
dataS('S = ',s1,0,2);
dataS('S_0 = ',s2,0,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;
procedure SStr60Cn32(Name, Key: string);
label 1;
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Three strings~{S}, {S}_1, {S}_2 are given.',0,2);
taskText('Replace the first occurrence of~{S}_1 in the string~{S} by the string~{S}_2.',0,4);
(*
*)
end;
2: begin
taskText('Three strings~{S}, {S}_1, {S}_2 are given.',0,2);
taskText('Replace the last occurrence of~{S}_1 in the string~{S} by the string~{S}_2.',0,4);
(*
*)
end;
3: begin
taskText('Three strings~{S}, {S}_1, {S}_2 are given.',0,2);
taskText('Replace all occurrences of~{S}_1 in the string~{S} by the string~{S}_2.',0,4);
(*
*)
end;
end;
(*==*)
n:=1 + random(5);
1 : s2 := strokaASCII(Random(3)+3);
    s0 := strokaASCII(Random(3)+3);
if length(s2) = length(s0) then goto 1;
s1 := strokaASCII(Random(5));
s3 := s1;
for i := 1 to n do
  case v1 of
1:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=1 then s3 := s3+s0 + s
  else
    s3 := s3+s2+s;
  end;
2:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  if i=n then s3 := s3+s0+s
  else
    s3 := s3+s2+s;
  end;
3:  begin
  s := strokaASCII(Random(5));
  s1 := s1 + s2 + s;
  s3 := s3 + s0 + s;
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
s3 := s3 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  s3 := s + s3 + s4;
  end;
dataS('S = ',s1,0,2);
dataS('S_1 = ',s2,xLeft,4);
dataS('S_2 = ',s0,xRight,4);
resultS('',s3,0,3);
setNumberOfTests(6);
Pause;
end;
procedure SStr60Cn33(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string with at least one blank character is given.',0,2);
taskText('Output the substring of~{S} that contains all characters',0,3);
taskText('between the first and the second blank character. If the string~{S}',0,4);
taskText('contains only one blank character then output an empty string.',0,5);
(*
*)
end;
2: begin
taskText('A string with at least one blank character is given.',0,2);
taskText('Output the substring of~{S} that contains all characters',0,3);
taskText('between the first and the last blank character. If the string~{S}',0,4);
taskText('contains only one blank character then output an empty string.',0,5);
(*
*)
end;
end;
(*==*)
n:=random(11)+1;
if n>8 then n:=1;
case curtest of //2012
2: n := 1;
5: n := 1+random(8);
end;
s1 := strokaASCII(Random(5));
s3 := '';
for i := 1 to n do
  begin
  s := strokaASCII(Random(5)+3);
  s1 := s1 + ' ' + s;
  case v1 of
  1:  if i=1 then s3 := s;
  2:  if i=1 then s3 := s
      else
        if i < n then
          s3 := s3 + ' ' + s
  end;
  end;
s := strokaASCII(Random(5));
s1 := s1 + s;
if length(s1)<25 then
  begin
  s := strokaASCII(5);
  s4 := strokaASCII(20-length(s1));
  s1 := s + s1 + s4;
  end;
if n<2 then s3 := '';
dataS('',s1,0,3);
resultS('',s3,0,3);
setNumberOfTests(8);
Pause;
end;

procedure SStr60Cn34(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure SStr60Cn35(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. Find the amount of words in the string.',0,4);
(*
Решение этого задания приводится в\ п.\,10.3.
*)
repeat
s := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s := s + slovo[random(NS)];
    for i := 1 to random(5)+1 do
      s := s + ' ';
  end;
s := s + slovo[random(NS)];
until length(s)<77;
dataS('',s,0,3);
resultN('',n,0,3,1);
setNumberOfTests(5);
pause;
end;
procedure SStr60Cn36(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. All string letters are in uppercase.',0,3);
taskText('Find the amount of words whose first letter is coincides with the last one.',0,4);
(*
*)
end;
2: begin
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. All string letters are in uppercase.',0,3);
taskText('Find the amount of words containing at least one letter \<E\>.',0,4);
(*
*)
end;
end;
(*==*)
repeat
s := '';
n := random(6)+2;
k1 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    case v1 of
    1:    if s1[1] = s1[length(s1)] then inc(k1);
    2:    if pos('E',s1)>0 then inc(k1);
    end;
  end;
s1 := slovo[random(NS)];
s := s + s1;
case v1 of
1:    if s1[1] = s1[length(s1)] then inc(k1);
2:    if pos('E',s1)>0 then inc(k1);
end;
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60Cn37(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. All string letters are in uppercase.',0,3);
taskText('Find the amount of words containing exactly three letters \<E\>.',0,4);
(*
*)
repeat
s := '';
n := random(6)+2;
k1 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    k2 := 0;
    for i := 1 to length(s1) do
      if s1[i] = 'E' then inc(k2);
    if k2=3 then inc(k1);
  end;
s1 := slovo[random(NS)];
s := s + s1;
k2 := 0;
for i := 1 to length(s1) do
  if s1[i] = 'E' then inc(k2);
if k2=3 then inc(k1);
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60Cn38(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. Find the length of the shortest word.',0,4);
(*
*)
end;
2: begin s0 := '';
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. Find the length of the longest word.',0,4);
(*
*)
end;
end;
(*==*)
repeat
s := '';
n := random(6)+2;
k1 := 20; k2 := 0;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    if length(s1)<k1 then k1 := length(s1);
    if length(s1)>k2 then k2 := length(s1);
  end;
s1 := slovo[random(NS)];
s := s + s1;
if length(s1)<k1 then k1 := length(s1);
if length(s1)>k2 then k2 := length(s1);
until length(s)<77;
dataS('',s,0,3);
case v1 of
1:   resultN('',k1,0,3,2);
2:   resultN('',k2,0,3,2);
end;
setNumberOfTests(5);
Pause;
end;
procedure SStr60Cn39(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. Output a\ new string that contains',0,3);
taskText('the given words (in the same order) separated by one character \<.\>.',0,4);
(*
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s2 := s2 + s1 + '.';
  end;
s1 := slovo[random(NS)];
s := s + s1;
s2 := s2 + s1;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;
procedure SStr60Cn40(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string that contains English words separated by one',0,1);
taskText('or more blank characters is given. All string letters are in uppercase.',0,2);
taskText('Process each word as follows: replace all next occurrences of its first',0,3);
taskText('letter by the character \<.\> (for example, the word \<MINIMUM\> must be',0,4);
taskText('transformed into \<MINI.U.\>). Do not change blank characters in the string.',0,5);
(*
*)
end;
2: begin
taskText('A string that contains English words separated by one',0,1);
taskText('or more blank characters is given. All string letters are in uppercase.',0,2);
taskText('Process each word as follows: replace all previous occurrences of its last',0,3);
taskText('letter by the character \<.\> (for example, the word \<MINIMUM\> must be',0,4);
taskText('transformed into \<.INI.UM\>). Do not change blank characters in the string.',0,5);
(*
*)
end;
end;
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    case v1 of
    1 : c1 := s1[1];
    2 : c1 := s1[length(s1)];
    end;
    s3 := '';
    for i := 1 to length(s1) do
      case v1 of
      1 : if (s1[i] <> c1) or (i = 1) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
      2 : if (s1[i] <> c1) or (i = length(s1)) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
      end;
    s2 := s2 + s3;
    for i := 1 to random(5)+1 do
      begin
      s := s + ' ';
      s2 := s2 + ' ';
      end;
  end;
s1 := slovo[random(NS)];
case v1 of
1 : c1 := s1[1];
2 : c1 := s1[length(s1)];
end;
s3 := '';
for i := 1 to length(s1) do
 case v1 of
 1 : if (s1[i] <> c1) or (i = 1) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
 2 : if (s1[i] <> c1) or (i = length(s1)) then s3 := s3 + s1[i]
          else s3 := s3 + '.';
 end;
s := s + s1;
s2 := s2 + s3;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;

procedure SStr60Cn41(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. Output a\ new string that contains',0,3);
taskText('the given words in inverse order. The words must be separated',0,4);
taskText('by one blank character.',0,5);
(*
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s2 :=  ' ' + s1 +s2;
  end;
s1 := slovo[random(NS)];
s := s + s1;
s2 := s1 + s2;
until length(s)<77;
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(5);
Pause;
end;


procedure SStr60Cn42(Name, Key: string);
var i,k:integer;
    s0 : array [1..7] of string[20];
begin
start(Name,Topic2,Author,Key,60{level});
taskText('A string that contains English words separated by one',0,2);
taskText('or more blank characters is given. All string letters are in uppercase.',0,3);
taskText('Output a\ new string that contains the given words in alphabetic order.',0,4);
taskText('The words must be separated by one blank character.',0,5);
(*
Достаточно сформировать массив слов,
отсортировать его по\ возрастанию и\ объединить элементы
массива в\ одну строку.
*)
(*==*)
repeat
s := '';
s2 := '';
n := random(6)+2;
for k := 1 to n-1 do
  begin
    s1 := slovo[random(NS)];
    s := s + s1;
    for i := 1 to random(5)+1 do
      s := s + ' ';
    s0[k] := s1;
  end;
s1 := slovo[random(NS)];
s := s + s1;
s0[n] := s1;
until length(s)<77;
for k := 1 to n-1 do
  for i := 1 to n-k do
    if s0[i]>s0[i+1] then
      begin
      s1 := s0[i];
      s0[i] := s0[i+1];
      s0[i+1] := s1;
      end;
s2 := s0[1];
for i := 2 to n do
s2 := s2 + ' ' + s0[i];
dataS('',s,0,3);
resultS('',s2,0,3);
setNumberOfTests(9);
Pause;
end;
procedure SStr60Cn43(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('A string with an English sentence is given. Convert the first letter',0,1);
taskText('of each word to uppercase. A\ \Iword\i is defined as a\ character sequence',0,2);
taskText('that does not contain blank characters and is bounded by blank characters',0,3);
taskText('or the string beginning/end. If the first word character is not a\ letter',0,4);
taskText('then do not change this word.',0,5);
(*
*)
(*==*)
s := predl[Random(NP)];
s1 := s;
for i:=2 to length(s) do
  if (s[i]<>' ') and (s[i-1]=' ') then
    s[i] := UpCase(s[i]);
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(5);
Pause;
end;
procedure SStr60Cn44(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string with an English sentence is given.',0,2);
taskText('Find the amount of punctuation marks in the string.',0,4);
(*
*)
end;
2: begin
taskText('A string with an English sentence is given.',0,2);
taskText('Find the amount of vowels (\<a\>, \<i\>, \<e\>, \<o\>, \<u\>) in the string.',0,4);
(*
*)
end;
end;
(*==*)
s := predl[Random(NP)];
k1 := 0;
k2 := 0;
for i:=1 to length(s) do
  begin
     if s[i] in [',','.',':',';','-','"'] then inc(k1);
     if s[i] in ['A','E','I','O','U',
                   'a','e','i','o','u']
         then inc(k2);
  end;
dataS('',s,0,3);
case v1 of
1:  resultN('',k1,0,3,2);
2:  resultN('',k2,0,3,2);
end;
setNumberOfTests(8);
Pause;
end;
procedure SStr60Cn45(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('A string with an English sentence is given. Output the longest word',0,1);
taskText('in the string. If there are several words of the maximal length then',0,2);
taskText('output the first one. A \Iword\i is defined as a\ character sequence that',0,3);
taskText('does not contain blank characters, punctuation marks and is bounded',0,4);
taskText('by blank characters, punctuation marks or the string beginning/end.',0,5);
(*
*)
end;
2: begin s0 := '';
taskText('A string with an English sentence is given. Output the shortest word',0,1);
taskText('in the string. If there are several words of the maximal length then',0,2);
taskText('output the last one. A \Iword\i is defined as a\ character sequence that',0,3);
taskText('does not contain blank characters, punctuation marks and is bounded',0,4);
taskText('by blank characters, punctuation marks or the string beginning/end.',0,5);
(*
*)
end;
end;
(*==*)
s1 := predl[Random(NP)];
s := s1;
s2 := '';
s3 := '                                        ';
for i:=2 to length(s) do
  if s[i] in [',','.',':',';','-','"'] then s[i] := ' ';
k1 := 1;
for i := 2 to length(s) do
    if (s[i] = ' ') and (s[i-1]<>' ') then
      begin
        s4 := Copy(s,k1,i-k1);
             if length(s4)>length(s2) then s2 := s4;
             if length(s4)<=length(s3) then s3 := s4;
      end
    else
      if (s[i] <> ' ') and (s[i-1] = ' ') then
        k1 := i;
dataS('',s1,0,3);
case v1 of
1: resultS('',s2,0,3);
2: resultS('',s3,0,3);
end;
setNumberOfTests(8);
Pause;
end;
procedure SStr60Cn46(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('A string with an English sentence is given.',0,2);
taskText('Remove all superfluous blank characters in the string,',0,3);
taskText('so that its words were separated by exactly one blank character.',0,4);
(*
*)
(*==*)
repeat
s1 := predl[Random(NP)];
s := s1;
for i:=length(s) downto 2 do
    if (s[i] = ' ') and (s[i-1]<>' ') then
      for k := 1 to Random(4) do
        insert(' ',s,i);
until length(s)<77;
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(5);
Pause;
end;

procedure SStr60Cn47(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;


procedure SStr60Cn48(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string that contains a\ \Ifully qualified path name\i (that is,',0,2);
taskText('the drive and directory parts, the file name and extension) is given.',0,3);
taskText('Extract the file name (without the path and extension) from the string.',0,4);
(*
Имя диска отделяется от\ пути двоеточием, путь отделяется
от\ имени файла косой чертой \<\\\>, имя файла отделяется от\ расширения
точкой. Следует иметь в\ виду, что\ косая черта также разделяет
каталоги, перечисленные в\ пути.
*)
end;
 2: begin
taskText('A string that contains a\ \Ifully qualified path name\i (that is,',0,2);
taskText('the drive and directory parts, the file name and extension) is given.',0,3);
taskText('Extract the extension (without the preceding dot character) from the string.',0,4);
(*
*)
end;
end;
(*==*)
FileName(s,s1,s2,s3,s4);
dataS('',s,0,3);
case v1 of
1: resultS('',s3,0,3);
2: resultS('',s4,0,3);
end;
setNumberOfTests(4);
Pause;
end;
procedure SStr60Cn49(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('A string that contains a\ \Ifully qualified path name\i (that is,',0,1);
taskText('the drive and directory parts, the file name and extension) is given.',0,2);
taskText('Extract the first directory name (without backslashes \<\\\>) from the string.',0,3);
taskText('If the file with the given name is located in the root directory',0,4);
taskText('then output a\ backslash.',0,5);
(*
*)
end;
2: begin
taskText('A string that contains a\ \Ifully qualified path name\i (that is,',0,1);
taskText('the drive and directory parts, the file name and extension) is given.',0,2);
taskText('Extract the last directory name (without backslashes \<\\\>) from the string.',0,3);
taskText('If the file with the given name is located in the root directory',0,4);
taskText('then output a\ backslash.',0,5);
(*
+
*)
end;
end;
(*==*)

FileName(s,s1,s2,s3,s4);
if s2 = '\' then s1 := s2
else
    case v1 of
    1:begin
      delete(s2,1,1);
      for i:= 1 to length(s2) do
        begin
          k := i;
          if s2[i]='\' then break;
        end;
        s1 := copy(s2,1,k-1);
      end;
    2:begin
       delete(s2,length(s2),1);
        for i:= length(s2) downto 2 do
        begin
          k := i;
          if s2[i-1]='\' then break;
        end;
        s1 := copy(s2,k,length(s2)-k+1);
      end;
  end;
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(7);
Pause;
end;
procedure SStr60Cn50(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string with an English sentence is given. Encrypt the string',0,1);
taskText('using the right cyclic shift of any letter by one position of the English',0,2);
taskText('alphabet (for instance, the letter \<A\> is encoded by the letter \<B\>,',0,3);
taskText('\<a\> is encoded by \<b\>, \<B\> is encoded by \<C\>, \<z\> is encoded by \<a\>,',0,4);
taskText('and so on). Do not change blank characters and punctuation marks.',0,5);
(*
В\ языке \UP используйте функции Ord и\ Chr и\ индексированный доступ
к\ символам строки.
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  case s[i] of
  'A'..'Y','a'..'y' : s[i] := chr(ord(s[i])+1);
  'Z' : s[i] := 'A';
  'z' : s[i] := 'a';
  end;
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60Cn51(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});(*DEMO*)
taskText('A string with an English sentence and an integer~{K} (0~<~{K}~<~10) are given.',0,1);
taskText('Encrypt the string using the right cyclic shift of any letter by {K}~positions',0,2);
taskText('of the English alphabet (for instance, if K~=~2 then the letter \<A\>',0,3);
taskText('is encoded by the letter \<C\>, \<a\> is encoded by \<c\>, \<B\> is encoded by \<D\>,',0,4);
taskText('\<z\> is encoded by \<b\>, and so on). Do not change',0,5);
taskText('blank characters and punctuation marks.',0,0);
(*
*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 26 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 26 + 1];
dataS('',s1,0,2);
dataN('K = ',k,0,4,1);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60Cn52(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string with an encrypted English sentence and an integer~{K} (0~<~{K}~<~10)',0,2);
taskText('are given. The string is encrypted by means of the right cyclic shift',0,3);
taskText('of any letter by {K}~positions of the English alphabet (see \1).',0,4);
taskText('Decrypt the given string.',0,5);
(*
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 26 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 26 + 1];
dataS('',s,0,2);
dataN('K = ',k,0,4,1);
resultS('',s1,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60Cn53(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string with an encrypted English sentence and its decrypted first',0,1);
taskText('character~{C} are given (the character~{C} is always an English letter).',0,2);
taskText('The string is encrypted by means of the right cyclic shift',0,3);
taskText('of any letter by {K}~positions of the English alphabet (see \2).',0,4);
taskText('Find the number~{K} and decrypt the given string.',0,5);
(*
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 26 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 26 + 1];
dataS('',s,0,2);
dataC('C = ',s1[1],0,4);
resultN('K = ',k,0,2,2);
resultComment('Decrypted string:',0,3);
resultS('',s1,0,4);
setNumberOfTests(4);
Pause;
end;
procedure SStr60Cn54(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string with an English sentence is given. Encrypt the string by moving',0,1);
taskText('all characters that are at the string positions with even numbers (2, 4,~\.)',0,2);
taskText('to the beginning of the string (in the same order) and moving all characters',0,3);
taskText('that are at the string positions with odd numbers (1, 3,~\.) to the end',0,4);
taskText('of the string (in inverse order). For instance, the string \<Program\>',0,5);
taskText('must be encrypted to \<rgamroP\>.',0,0);
(*
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) div 2 do
  s[i] := s1[2*i];
for i:=1 to length(s) div 2 do
  s[length(s)-i+1] := s1[2*i-1];
if length(s) mod 2 <> 0 then
  s[length(s) div 2 + 1] := s1[length(s)];
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(7);
Pause;
end;
procedure SStr60Cn55(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string with an encrypted English sentence is given',0,2);
taskText('(the method of encryption is described in \1). Decrypt the string.',0,4);
(*
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) div 2 do
  s[i] := s1[2*i];
for i:=1 to length(s) div 2 do
  s[length(s)-i+1] := s1[2*i-1];
if length(s) mod 2 <> 0 then
  s[length(s) div 2 + 1] := s1[length(s)];
dataS('',s,0,3);
resultS('',s1,0,3);
setNumberOfTests(7);
Pause;
end;

procedure SStr60Cn56(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,k: integer;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('A string that contains digits and Latin small letters is given.', 0, 2);
  TaskText('If letters of the string are in alphabetic order then output~0,', 0, 3);
  TaskText('otherwise output the order number of the first string character', 0, 4);
  TaskText('that is a\ letter and breaks the required order.', 0, 5);
(*
*)
(*==*)
  n := random(15)+15;
  s := '';
  for i := 1 to n do
    s := s + chr(ord('a')+Random(26));
  if Random(3)<>0 then
  for k := 1 to n-1 do
    for i := 1 to n - k do
    if s[i]>s[i+1] then
    begin
    c := s[i];
    s[i] := s[i+1];
    s[i+1] := c;
    end;
  for i := 1 to Random(10)+4 do
  begin
  k := Random(length(s)-1)+1;
  insert(digits(Random(3)+1),s,k);
  end;
  if Random(2)=0 then s := digits(Random(3)+1)+s;

  if Random(2)=0 then
  for i := 1 to Random(4)+2 do
  begin
  k := Random(length(s)-1)+1;
  insert(chr(ord('a')+Random(26)),s,k);
  end;
  c1 := #0;
  k := 0;
  for i := 1 to length(s) do
  if s[i] in ['a'..'z'] then
    if s[i] < c1 then
      begin
        k := i;
        break;
      end
    else c1 := s[i];
  DataS('', s, 0, 3);
  ResultN('', k, 0, 3,2);
  SetNumberOfTests(9);
Pause;
end;

procedure SStr60Cn57(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('A string that contains Latin letters and parentheses \<(\>, \<)\> is given.',0,1);
taskText('If parentheses are in correct order (that is, each closing parenthesis~\<)\>',0,2);
taskText('corresponds to an opening one \<(\>) then output~0. If the string contains',0,3);
taskText('illegal parentheses \<)\> then output the order number of the first string',0,4);
taskText('character that is an illegal \<)\>. If the amount of closing parentheses',0,5);
taskText('is less than the amount of opening ones then output~\-1.',0,0);
(*
Просматривайте строку, увеличивая на\ единицу специальную
переменную-счетчик при\ появлении в\ строке открывающей скобки
и\ уменьшая ее\ на\ единицу при\ появлении скобки закрывающей.
*)
(*==*)
n := random(15)+15;
s := '';
for i := 1 to n do
  s := s + chr(ord('a')+Random(26));
k := random(7)+2;
k1 := random(3);
case curtest of //2012
3: k1 := 0;
4: k1 := 1;
end;
if k1 = 0 then
for i := 1 to k div 2 + 1 do
  begin
    n1 := random(n) + 1;
    n2 := n1 + random(6)+2;
    if n2 > n then n2 := n;
    insert('(',s,n1);
    insert(')',s,n2);
  end
else
for i := 1 to k do
  begin
    case random(2) of
    0: insert('(',s,random(n)+1);
    1: insert(')',s,random(n)+1);
    end;
  end;
k := 0;
for i := 1 to length(s) do
  case s[i] of
  '(' : k := k+1;
  ')' : begin
          k := k-1;
          if k<0 then
            begin
              k := -i;
              break
            end;
        end;
  end;
if k > 0 then k := -1
else k := -k;
dataS('',s,0,3);
resultN('',k,0,3,2);
setNumberOfTests(9);
Pause;
end;

function Vir8 : string;
var s:string; i,j : integer;
begin
inc(count);
s := '';
for j := 1 to 3 do
if (count>5) then
  for i := 1 to Random(2)+1 do
  s := s + chr(97+Random(26))
else
  case Random(5) of
  0: s := s+'('+Vir8+')';
  1: s := s+'['+Vir8+']';
  2: s := s+'{'+Vir8+'}';
  3,4:for i := 1 to Random(2)+1 do
      s := s + chr(97+Random(26))
  end;
Vir8 := s;
end;



function Check2a(s:string) : integer;
var count:integer;z : char;
function Check20a(z1:char):Boolean;
begin
check20a := False;
while count<=length(s) do
  begin
    z := s[count];
    inc(count);
    if z=z1 then begin check20a := true; exit; end;
    case z of
    'a'..'z': ;
    '(':if not Check20a(')') then exit;
    '[':if not Check20a(']') then exit;
    '{':if not Check20a('}') then exit;
    else exit;
    end;
  end;
inc(count);
exit;
end;
begin
count := 1;
check2a := -1;
while (count<=length(s)) do
  begin
    z := s[count];
    inc(count);
    case z of
    'a'..'z': ;
    '(':if not Check20a(')') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    '[':if not Check20a(']') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    '{':if not Check20a('}') then
          begin if count <= length(s)+1 then check2a := count-1; exit; end;
    else begin check2a := count-1;exit;end;
    end;
  end;
check2a := 0;
end;


procedure SStr60Cn58(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('A string that contains Latin letters and brackets of three types',0,1);
taskText('(parentheses~\<()\>, square brackets~\<[]\>, braces \<\{\}\>) is given.',0,2);
taskText('If brackets are in correct order (that is, each closing bracket corresponds',0,3);
taskText('to an opening one of the same type) then output~0. If the string contains',0,4);
taskText('illegal closing brackets then output the order number of the first string',0,5);
taskText('character that is an illegal closing bracket. If the amount of closing',0,0);
taskText('brackets is less than the amount of opening ones then output~\-1.',0,0);
(*
*)
repeat
count := 0;
s := Vir8;
until length(s)<30;
s1 := '()[]{}';
if Random(2)=0 then
  case Random(4) of
  0: delete(s,length(s) div 2+2,40);
  1: insert(s1[Random(6)+1],s,random(length(s))+1);
  2,3: if Length(s)>=5 then insert(s1[2*(Random(3)+1)],s,Random(5)+1);
  end;
dataS('S = ',s,0,3);
resultN('',Check2a(s),0,3,2);
setNumberOfTests(9);
  Pause;
end;


procedure SStr60Cn59(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SStr60Cn60(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

begin
Topic := 'CHARACTERS AND STRINGS';
Topic1 := 'CHARACTERS AND STRINGS: BASIC OPERATIONS';
Topic2 := 'CHARACTERS AND STRINGS: WORD PROCESSING';
Topic3 := 'CHARACTERS AND STRINGS: ADDITIONAL TASKS';
{Author := 'M.~E.~Abramyan, 2006';}
end.

