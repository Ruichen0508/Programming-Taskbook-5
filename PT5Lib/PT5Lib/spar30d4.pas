{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SPar30D4;

{$MODE Delphi}

interface

procedure SPar30Dn1(Name, Key: string);
procedure SPar30Dn2(Name, Key: string);
procedure SPar30Dn3(Name, Key: string);
procedure SPar30Dn4(Name, Key: string);
procedure SPar30Dn5(Name, Key: string);
procedure SPar30Dn6(Name, Key: string);
procedure SPar30Dn7(Name, Key: string);
procedure SPar30Dn8(Name, Key: string);
procedure SPar30Dn9(Name, Key: string);
procedure SPar30Dn10(Name, Key: string);
procedure SPar30Dn11(Name, Key: string);
procedure SPar30Dn12(Name, Key: string);
procedure SPar30Dn13(Name, Key: string);
procedure SPar30Dn14(Name, Key: string);
procedure SPar30Dn15(Name, Key: string);
procedure SPar30Dn16(Name, Key: string);
procedure SPar30Dn17(Name, Key: string);
procedure SPar30Dn18(Name, Key: string);
procedure SPar30Dn19(Name, Key: string);
procedure SPar30Dn20(Name, Key: string);
procedure SPar30Dn21(Name, Key: string);
procedure SPar30Dn22(Name, Key: string);
procedure SPar30Dn23(Name, Key: string);
procedure SPar30Dn24(Name, Key: string);
procedure SPar30Dn25(Name, Key: string);
procedure SPar30Dn26(Name, Key: string);
procedure SPar30Dn27(Name, Key: string);
procedure SPar30Dn28(Name, Key: string);
procedure SPar30Dn29(Name, Key: string);
procedure SPar30Dn30(Name, Key: string);

implementation

uses PT5TaskMaker,PT4Dat_en;

type string80 = string[80];
     pstring80 = ^string80;
     ar80 = array [0..100] of pString80;

var
    x0,x1,x2: real;
    k,m,n,n1: integer;
    c1: char;
    Topic3, Topic4,Topic5,Author : string;

    s__ : array[0..40] of pString50;
    len : integer;
    s0,s1,s2: shortstring;



function otr(x1,y1,x2,y2:real):real;
begin
otr := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

procedure SPar30Dn1(Name, Key: string);
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
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    x0 := otr(x1,y1,x2,y2);
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    resultR('|A'+chr(65+i)+'| = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Dn2(Name, Key: string);
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
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn3(Name, Key: string);
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
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn4(Name, Key: string);
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
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('P: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn5(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
    i: integer;
begin
start(Name,Topic3,Author,Key,36{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Using the Dist function from the task \1, write a procedure',0,1);
taskText('Alts({x}_A,\,{y}_A,\,{x}_B,\,{y}_B,\,{x}_C,\,{y}_C,\,{h}_A,\,{h}_B,\,{h}_C) '+
         'that evaluates the altitudes~{h}_A, {h}_B,~{h}_C',0,2);
taskText('drawn from the vertices~{A}, {B},~{C} of a\ triangle~{ABC} (the coordinates of vertices',0,3);
taskText('are input parameters, the values of altitudes are output parameters).',0,4);
taskText('Using this procedure, evaluate the altitudes of each of triangles~{ABC},',0,5);
taskText('{ABD},~{ACD} provided that the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn6(Name, Key: string);
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

procedure SPar30Dn7(Name, Key: string);
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




function stroka(N : integer) : string;
const c : string = '          (){}[]0123456789'+
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

procedure getText;
var k,i,j,NS : integer;
    s0 : string50;
begin
  NS := NS0;
  j := Random(NS)+1;
  Len := beg_[j+1] - beg_[j];
  k := -1;
    for i := 0 to Len - 1 do
      begin
        Inc(k);
        if i = 0 then s0 := Copy(S_[beg_[j]+i],2,60)
        else
          begin
            s0 := S_[beg_[j]+i];
            if i = Len-1 then
              s0 := Copy(s0,1,length(s0)-1);
          end;
        New(S__[k]);
        if s0[length(s0)]='#' then
          begin
            S__[k]^ := Copy(s0,1,length(s0)-1);
            Inc(k);
            New(S__[k]); S__[k]^ := '';
          end
        else S__[k]^ := s0;
    end;
Len := k+1;
end;
procedure freeText;
var i : integer;
begin
  for i := 0 to len-1 do
    system.dispose(S__[i]);
end;

procedure Margin(mar : integer; var s_0 : ar80; var len_0 : integer);
var i,j : integer;
    s0,s1 : string;
begin
len_0 := 0;
s1 := '';
for i := 0 to len-1 do
  begin
    if s__[i]^='' then
      begin
        new(s_0[len_0]);
        s_0[len_0]^ := s1;
        inc(len_0);
        new(s_0[len_0]);
        s_0[len_0]^ := '';
        inc(len_0);
        s1 := '';
      end
    else
      begin
        s0 := '';
        for  j := 1 to length(s__[i]^) do
          begin
            if s__[i]^[j]<>' ' then s0 := s0 + s__[i]^[j]
            else
              if s1='' then
                begin
                  s1 := s0;
                  s0 := '';
                end
              else
              begin
                if length(s1)+length(s0)+1<=mar then
                  s1 := s1 + ' '+s0
                else
                  begin
                    new(s_0[len_0]);
                    s_0[len_0]^ := s1;
                    inc(len_0);
                    s1 := s0;
                  end;
                s0 := '';
              end;
            end;
          if length(s1)+length(s0)+1<=mar then
            s1 := s1 + ' '+s0
          else
            begin
              new(s_0[len_0]);
              s_0[len_0]^ := s1;
              inc(len_0);
              s1 := s0;
            end;
      end;
  end;
if s1 <> '' then
  begin
    new(s_0[len_0]);
    s_0[len_0]^ := s1;
    inc(len_0);
  end;
end;
procedure freeMargin(s_0 : ar80; len_0 : integer);
var i : integer;
begin
  for i := 0 to len_0-1 do
    system.dispose(S_0[i]);
end;

















procedure SPar30Dn8(Name, Key: string);
var F : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('Write an integer function IntFileSize({S}) that returns the amount',0,2);
taskText('of components in a\ binary file of integers called~{S}. If the required file',0,3);
taskText('does not exist then the function returns~\-1. Using this function, output',0,4);
taskText('the amount of components for three binary files of integers with given names.',0,5);
(*
*)
(*==*)
dataComment('Files contents:',0,2);
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if Random(3)=0 then
    begin
      dataComment('File does not exist.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then n := 0
    else n := 6 + Random(15);
    Rewrite(F);
    for j := 1 to n do
      begin
        m := 1 + Random(30);
        write(F,m);
      end;
    Close(F);
    dataFileN(s0,i+2,5);
    end;
    resultN('IntFileSize(S_'+chr(48+i)+') = ',n,0,i+1,2);
  end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Dn9(Name, Key: string);
var F : text;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});(*DEMO*)
taskText('Write an integer function LineCount({S}) that returns the amount of lines',0,2);
taskText('in a\ text file called~{S}. If the required file does not exist',0,3);
taskText('then the function returns~\-1. Using this function,',0,4);
taskText('output the amount of lines for three text files with given names.',0,5);
(*
*)
dataComment('Files contents:',0,2);
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if Random(3)=0 then
    begin
      dataComment('File does not exist.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then Len := 0
                   else getText;
    Rewrite(F);
    for j := 0 to Len-1 do
        writeln(F,S__[j]^);
    Close(F);
    if Len <> 0 then FreeText;
    dataFileT(s0,i+2,i+2);
    n := Len;
    end;
  resultN('LineCount(S_'+chr(48+i)+') = ',n,0,i+1,2);
  end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Dn10(Name, Key: string);
var F,F1 : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('Write a\ procedure InvIntFile({S}) that changes the order of components',0,2);
taskText('of a\ binary file of integers called~{S} to inverse one. If the required file',0,3);
taskText('does not exist then the procedure performs no actions. Using this procedure,',0,4);
taskText('process three binary files of integers with given names.',0,5);
(*
*)
(*==*)
dataComment('Contents of the given files:',0,2);
resultComment('New contents of the files:',0,2);
k := 0;
for i := 1 to 3 do
  begin
  s0 := chr(48+i)+FileName(7)+'.tst';
  dataS('S_'+chr(48+i)+' = ',s0,center(i,3,19,6),1);
  if (Random(3)=0) and ((i<>3)or(k<>0)) then
    begin
      dataComment('File does not exist.',6,i+2);
      resultComment('File does not exist.',6,i+2);
      n := -1;
    end
  else
    begin
    Assign(F,s0);
    if Random(3)=0 then n := 1 //2015.10
    else n := 6 + Random(15);
    Rewrite(F);
    for j := 1 to n do
      begin
        m := 1 + Random(30);
        write(F,m);
      end;
    Assign(F1,'#'+FileName(7)+'.tst');
    Rewrite(F1);
    for j := 1 to n do
      begin
        Seek(F,n-j);
        read(F,m);
        write(F1,m);
      end;
    Close(F);
    Close(F1);
    resultFileN(s0,i+2,5);
    Rename(F1,s0);
    dataFileN(s0,i+2,5);
    end;
    k := k + n + 1;
  end;
setNumberOfTests(5);
Pause;
end;

procedure SPar30Dn11(Name, Key: string);
var F,F1 : text;
    j,n,k,l,p : integer;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure AddLineNumbers({S},\;{N},\;{K},\;{L}) that adds the number of each line', 0, 1);
  TaskText('of a\ text file called~{S} to the beginning of this line; the first line receives', 0, 2);
  TaskText('the number~{N}, the second line receives the number~{N}\,+\,1, and so\ on. Any number', 0, 3);
  TaskText('is right-aligned within~{K} first character positions of a\ line and is separated', 0, 4);
  TaskText('from the following text by {L}~blank characters ({K}\;>\;0, {L}\;>\;0). If a\ line', 0, 5);
  TaskText('is empty then its number should not contain trailing blank characters. Apply', 0, 0);
  TaskText('this procedure to a given text file using given values of parameters~{N}, {K},~{L}.', 0, 0);
(*
*)
(*==*)
s0 := FileName(8)+'.tst';
dataS('File name: ',s0,xLeft,1);
dataComment('File contents:',xRight,1);
n := 0; k := 0;
case Random(4) of
0: begin
     n := Random(10)+1;
     k := 2 + Random(3);
   end;
1: begin
     n := Random(100)+100;
     k := 3 + Random(4);
   end;
2: begin
     n := Random(300)+1000;
     k := 4 + Random(5);
   end;
3: begin
     n := Random(5000)+10000;
     k := 5 + Random(6);
   end;
end;
p := Random(3);
l := Random(6)+1;
dataN('N = ',n,center(1,3,6,15),5,1);
dataN('K = ',k,center(2,3,6,15),5,1);
dataN('L = ',l,center(3,3,6,15),5,1);
    Assign(F,s0);
    Assign(F1,'#'+FileName(7)+'.tst');
    getText;
    Rewrite(F);
    Rewrite(F1);
    for j := 0 to Len-1 do
    begin
        writeln(F1,S__[j]^);
        write(F,n+j:k);
        if S__[j]^ <> '' then write(F,' ':l,S__[j]^);
        writeln(F);
    end;
    Close(F);
    Close(F1);
    if Len <> 0 then FreeText;
  resultComment('New contents of the file:',0,1);
  resultFileT(s0,2,5);
  rename(F1,s0);
  dataFileT(s0,2,4);
  SetNumberOfTests(7);
Pause;
end;



procedure SPar30Dn12(Name, Key: string);
var F,F1 : text;
    j,n,k,l,p : integer;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Write a\ procedure RemoveLineNumbers({S}) that removes order numbers', 0, 1);
  TaskText('(with leading and trailing blank characters) from the beginning', 0, 2);
  TaskText('of each line of a\ text file called~{S} (the format of order numbers', 0, 3);
  TaskText('is described in \1). If file lines do not contain order numbers then', 0, 4);
  TaskText('the procedure performs no actions. Apply this procedure to a\ given text file.', 0, 5);
(*
*)
(*==*)
s0 := FileName(8)+'.tst';
dataS('File name: ',s0,xLeft,1);
dataComment('File contents:',xRight,1);
n := 0; k := 0;
case Random(4) of
0: begin
     n := Random(10)+1;
     k := 2 + Random(3);
   end;
1: begin
     n := Random(100)+100;
     k := 3 + Random(4);
   end;
2: begin
     n := Random(300)+1000;
     k := 4 + Random(5);
   end;
3: begin
     n := Random(5000)+10000;
     k := 5 + Random(6);
   end;
end;
p := Random(3);
l := Random(6)+1;
    Assign(F,s0);
    Assign(F1,'#'+FileName(7)+'.tst');
    getText;
    Rewrite(F);
    Rewrite(F1);
    for j := 0 to Len-1 do
    begin
        writeln(F,S__[j]^);
        if p = 0 then         writeln(F1,S__[j]^)
        else
        begin
        write(F1,n+j:k);
        if S__[j]^ <> '' then write(F1,' ':l,S__[j]^);
        writeln(F1);
        end;
    end;
    Close(F);
    Close(F1);
    if Len <> 0 then FreeText;
  resultComment('New contents of the file:',0,1);
  resultFileT(s0,2,5);
  rename(F1,s0);
  dataFileT(s0,2,5);
  SetNumberOfTests(7);
Pause;
end;



procedure SPar30Dn13(Name, Key: string);
var F0,F1,F2 : file of integer;
    i,j : integer;
begin
start(Name,Topic4,Author,Key,73{level2});(*DEMO*)
taskText('Write a\ procedure SplitIntFile({S}_0,\;{K},\;{S}_1,\;{S}_2) that copies first~{K} (\g\,0)',0,1);
taskText('components of an existing file called~{S}_0 to a\ new file called~{S}_1 and other',0,2);
taskText('components of this file to a\ new file called~{S}_2. All files are assumed to be',0,3);
taskText('binary files of integers; one of the resulting files may be empty. Apply',0,4);
taskText('this procedure to a given file called~{S}_0 using given values of~{K}, {S}_1,~{S}_2.',0,5);
(*
*)
s0 := '0'+FileName(7)+'.tst';
s1 := '1'+FileName(7)+'.tst';
s2 := '2'+FileName(7)+'.tst';
dataS('S_0 = ',s0,xLeft,2);
dataComment('Contents of the given file:',xRight,2);
resultComment('Contents of the new files:',0,2);
m := 6 + Random(15);
case Random(4) of
0: n := 0;
1: n := m + Random(5);
2,3: n := 1 + Random(m);
end;
case curtest of //2012
2: n := m + Random(5);
3: n := 1 + Random(m);
5: n := 0;
end;
dataN('K = ',n,0,4,1);
dataS('S_1 = ',s1,xLeft,5);
dataS('S_2 = ',s2,xRight,5);
Assign(F0,s0);
Rewrite(F0);
Assign(F1,s1);
Rewrite(F1);
Assign(F2,s2);
Rewrite(F2);
if n>m then n := m;
for i := 1 to n do
  begin
    j := 1 + Random(30);
    write(F0,j);
    write(F1,j);
  end;
for i := n+1 to m do
  begin
    j := 1 + Random(30);
    write(F0,j);
    write(F2,j);
  end;
Close(F0);
Close(F1);
Close(F2);
dataFileN(s0,3,5);
resultFileN(s1,3,5);
resultFileN(s2,4,5);
setNumberOfTests(7);
Pause;
end;
procedure SPar30Dn14(Name, Key: string);
var F0,F1,F2 : text;
    i : integer;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('Write a\ procedure SplitText({S}_0,\;{K},\;{S}_1,\;{S}_2) that copies first~{K} (\g\,0) lines',0,1);
taskText('of an existing text file called~{S}_0 to a\ new text file called~{S}_1 and other',0,2);
taskText('lines of this file to a\ new text file called~{S}_2 (one of the resulting files',0,3);
taskText('may be empty). Apply this procedure to a\ given file called~{S}_0',0,4);
taskText('using given values of~{K}, {S}_1~{S}_2.',0,5);
(*
*)
(*==*)
s0 := '0'+FileName(7)+'.tst';
s1 := '1'+FileName(7)+'.tst';
s2 := '2'+FileName(7)+'.tst';
dataS('S_0 = ',s0,xLeft,1);
dataComment('Contents of the given file:',xRight,1);
resultComment('Contents of the new files:',0,1);
getText;
case Random(4) of
0: n := 0;
1: n := Len + Random(5);
2,3: n := 1 + Random(Len);
end;
case curtest of //2012
3: n := 1 + Random(Len);
4: n := 0;
6: n := Len + Random(5);
end;
dataN('K = ',n,0,4,1);
dataS('S_1 = ',s1,xLeft,5);
dataS('S_2 = ',s2,xRight,5);
Assign(F0,s0);
Rewrite(F0);
Assign(F1,s1);
Rewrite(F1);
Assign(F2,s2);
Rewrite(F2);
if n>Len then n := Len;
for i := 0 to n-1 do
  begin
    writeln(F0,S__[i]^);
    writeln(F1,S__[i]^);
  end;
for i := n to Len-1 do
  begin
    writeln(F0,S__[i]^);
    writeln(F2,S__[i]^);
  end;
freeText;
Close(F0);
Close(F1);
Close(F2);
dataFileT(s0,2,3);
resultFileT(s1,2,3);
resultFileT(s2,4,5);
setNumberOfTests(7);
Pause;
end;

procedure SPar30Dn15(Name, Key: string);
var v1,v2,v3 : byte;
    i,j: integer;
    F: file of shortString;
    T: text;
    k: array[1..2] of integer;
begin
start(Name,Topic4,Author,Key,73{level2});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
1: begin
k[1] := xLeft;
k[2] := xRight;
taskText('Write a\ procedure StringFileToText({S}) that converts a\ binary file of strings',0,2);
taskText('called~{S} to a\ new text file with the same name. Using this procedure,',0,3);
taskText('convert two given files of strings with the names~{S}_1, {S}_2 to text files.',0,4);
(*
*)
   end;
2: begin
k[1] := 3;
k[2] := 24;
taskText('Write a\ procedure TextToStringFile({S}) that converts a text file called~{S}',0,2);
taskText('to a\ new binary file of strings with the same name. Using this procedure,',0,3);
taskText('convert two given text files with the names~{S}_1, {S}_2 to binary files of strings.',0,4);
(*
*)
   end;
end;
(*==*)
for i := 1 to 2 do
begin
s1 := chr(48+i)+FileName(7)+'.tst';
dataS('S_'+chr(48+i)+' = ',s1,k[i],1);
Assign(F,'a'+FileName(7)+'.tst');
Rewrite(F);
Assign(T,'b'+FileName(7)+'.tst');
Rewrite(T);
for j := 1 to 6+Random(15) do
  begin
    s0 := FileName(Random(9));
    write(F,s0);
    writeln(T,s0);
  end;
Close(F);
Close(T);
case v1 of
1: begin
     dataComment('Contents of the given binary files:',0,2);
     resultComment('Contents of the new text files:',0,1);
     Rename(T,s1);
     resultFileT(s1,2*i,2*i+1);
     Rename(F,s1);
     dataFileS(s1,i+2,12);
   end;
2: begin
     dataComment('Contents of the given text files:',45,1);
     resultComment('Contents of the new binary files:',0,2);
     Rename(F,s1);
     resultFileS(s1,i+2,12);
     Rename(T,s1);
     dataFileT(s1,2*i,2*i+1);
   end;
end;
end;
setNumberOfTests(5);
Pause;
end;
procedure SPar30Dn16(Name, Key: string);

const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j:integer;
    T1,T2 : text;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('Write a\ procedure EncodeText({S},\;{K}) that encrypts the contents of a\ text file',0,1);
taskText('called~{S} using the right cyclic shift of any Latin letter by~{K} positions of',0,2);
taskText('the English alphabet (0~<~{K}~<~10). For instance, if {K}~=~3 then the letter \<A\>',0,3);
taskText('is encoded by the letter \<D\>, \<a\> is encoded by \<d\>, \<B\> is encoded by \<E\>,',0,4);
taskText('\<z\> is encoded by \<c\>, and so\ on. Blank characters and punctuation marks',0,5);
taskText('should not be changed. Having input an integer~{K} and using this procedure,',0,0);
taskText('encrypt a\ text file with the given name.',0,0);
(*
*)
(*==*)
s1 := FileName(8) + '.tst';
Assign(T1,'{'+FileName(7)+'.tst');
Rewrite(T1);
Assign(T2,'}'+FileName(7)+'.tst');
Rewrite(T2);
n := 1+Random(9);
dataN('K = ',n,xLeft,1,1);
dataS('File name: ',s1,xRight,1);
resultComment('Contents of the encrypted file:',0,1);
getText;
for j := 0 to Len-1 do
  begin
    s0 := S__[j]^;
    writeln(T1,s0);
    for i:=1 to length(s0) do
      if Pos(s0[i],c1)<>0 then s0[i] := c1[(Pos(s0[i],c1)+n-1) mod 26 + 1]
      else
      if Pos(s0[i],c2)<>0 then s0[i] := c2[(Pos(s0[i],c2)+n-1) mod 26 + 1];
    writeln(T2,s0);
  end;
freeText;
Close(T1);
Close(T2);
     Rename(T2,s1);
     resultFileT(s1,2,5);
     Rename(T1,s1);
     dataFileT(s1,2,5);
setNumberOfTests(5);
Pause;
end;

procedure SPar30Dn17(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j:integer;
    T1,T2 : text;
begin
start(Name,Topic4,Author,Key,73{level2});
taskText('Write a\ procedure DecodeText({S},\;{K}) that decrypts the contents of a\ text file',0,2);
taskText('called~{S} provided that this file was encrypted by the method described',0,3);
taskText('in \1 with using an integer parameter~{K}. Having input an integer~{K}',0,4);
taskText('and using this procedure, decrypt a\ text file with the given name.',0,5);
(*
*)
(*==*)
s1 := FileName(8) + '.tst';
Assign(T1,'{'+FileName(7)+'.tst');
Rewrite(T1);
Assign(T2,'}'+FileName(7)+'.tst');
Rewrite(T2);
n := 1+Random(10);
dataN('K = ',n,xLeft,1,1);
dataS('File name: ',s1,xRight,1);
resultComment('Contents of the decrypted file:',0,1);
getText;
for j := 0 to Len-1 do
  begin
    s0 := S__[j]^;
    writeln(T1,s0);
    for i:=1 to length(s0) do
      if Pos(s0[i],c1)<>0 then s0[i] := c1[(Pos(s0[i],c1)+n-1) mod 26 + 1]
      else
      if Pos(s0[i],c2)<>0 then s0[i] := c2[(Pos(s0[i],c2)+n-1) mod 26 + 1];
    writeln(T2,s0);
  end;
freeText;
Close(T1);
Close(T2);
     Rename(T1,s1);
     resultFileT(s1,2,5);
     Rename(T2,s1);
     dataFileT(s1,2,5);
setNumberOfTests(5);
Pause;
end;


procedure SPar30Dn18(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPar30Dn19(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

function IsLeapYear(n: Integer): Boolean;
begin
  IsLeapYear := (n mod 4 = 0) and ((n mod 100 <> 0) or (n mod 400 =0));
end;

function getYear: integer;
var n : integer;
begin
  n := 1 + Random(25);
  n := n*100;
  if Random(3)=0 then n := n+100
  else n := n+Random(99)+1;
  getYear := n;
end;

function daysinmonth(m,y: integer): integer;
var k: integer;
begin
  k := 0;
  case m of
  1, 3, 5, 7, 8, 10, 12: k := 31;
  4, 6, 9, 11: k := 30;
  2: if IsLeapYear(y) then k := 29
     else k := 28;
  end;
  daysinmonth := k;
end;

function dateiscorrect(d,m,y: integer): integer;
var n: integer;
begin
n := 0;
if (m<1) or (m>12) then n := 1
else
  if (d<1) or (d>daysinmonth(m,y)) then n := 2;
dateiscorrect := n;

end;

procedure SPar30Dn20(Name, Key: string);
var v1,v2,v3 : byte;
    i,y,m,d: integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Define a\ new type called TDate that is a\ record with three integer fields:',0,1);
taskText('{Day} (a\ day number), {Month} (a\ month number), {Year} (a\ year number). Also write',0,2);
taskText('a\ logical function LeapYear({D}) with a\ parameter~{D} of TDate type. The function',0,3);
taskText('returns \t if a\ year of date~{D} is a\ leap year, and \f otherwise. Output',0,4);
taskText('the return values of this function for five given dates (all dates are assumed',0,5);
taskText('to be correct). Note that a\ year is a \Ileap year\i if it is divisible by~4',0,0);
taskText('except for years that are divisible by~100 and are not divisible by~400.',0,0);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  m := Random(12)+1;
  d := Random(30)+1;
  if m = 2 then d := Random(28)+1;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultB('LeapYear(D_'+chr(i+48)+') = ',IsLeapYear(y),0,i);
end;
setNumberOfTests(9);
pause;
end;

procedure SPar30Dn21(Name, Key: string);
var v1,v2,v3 : byte;
    y,m,d,i: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Using the TDate type and the LeapYear function (see \1),',0,1);
taskText('write an integer function DaysInMonth({D}) with a\ parameter~{D} of TDate type.',0,2);
taskText('The function returns the amount of days for the month of date~{D}.',0,3);
taskText('Output the return values of this function for five given dates',0,4);
taskText('(all dates are assumed to be correct).',0,5);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  case Random(3) of
    0: m := 2;
    else m := 1 + Random(12);
  end;
  d := Random(30)+1;
  if m = 2 then d := Random(28)+1;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN('DaysInMonth(D_'+chr(i+48)+') = ',daysinmonth(m,y),0,i,2);
end;
setNumberOfTests(5);
Pause;
end;

procedure SPar30Dn22(Name, Key: string);
var v1,v2,v3 : byte;
    y,m,d,i: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Using the TDate type and the DaysInMonth function (see \2\',0,1);
taskText('and \1), write an integer function CheckDate({D}) with a\ parameter~{D}',0,2);
taskText('of TDate type. If the date~{D} is a\ correct date then the function returns~0;',0,3);
taskText('if the date~{D} contains an invalid month number or invalid day number',0,4);
taskText('for the correct month then the function returns~1 or~2 respectively. Output',0,5);
taskText('the return values of this function for five given dates.',0,0);
(*
*)
for i := 1 to 5 do
begin
  y := getYear;
  case Random(6) of
    0: m := 2;
    1,2,3 : m := 1 + Random(12);
    4: m := 13+ Random(8);
    else m := -integer(Random(13));
  end;
  case Random(8) of
  0,1: d := Random(31)+1;
  2,3: begin d := 29; m := 2; end;
  4,5: d := 31;
  6: d := 30 + Random(11);
  else d := -integer(Random(31));
  end;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN('CheckDate(D_'+chr(i+48)+') = ',dateiscorrect(d,m,y),0,i,2);
end;
setNumberOfTests(5);
Pause;
end;


procedure SPar30Dn23(Name, Key: string);
var v1,v2,v3 : byte;
    i,d,m,y,ms,d2,m2,y2: Integer;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
  1:
    begin
taskText('Using the TDate type and the DaysInMonth and CheckDate functions',0,1);
taskText('(see \3\-\1), write a\ procedure PrevDate({D}) that changes',0,2);
taskText('a\ correct date~{D} (of TDate type) to the previous one; if~{D} contains',0,3);
taskText('an invalid date then it remains unchanged. The parameter~{D} is an input',0,4);
taskText('and output parameter. Apply this procedure to five given dates.',0,5);
(*
*)
    end;
  2:
    begin
taskText('Using the TDate type and the DaysInMonth and CheckDate functions',0,1);
taskText('(see \4\-\2), write a\ procedure NextDate({D}) that changes',0,2);
taskText('a\ correct date~{D} (of TDate type) to the next one; if~{D} contains',0,3);
taskText('an invalid date then it remains unchanged. The parameter~{D} is an input',0,4);
taskText('and output parameter. Apply this procedure to five given dates.',0,5);
(*
*)
    end;
end;
(*==*)
d := 0; d2 := 0;
for i := 1 to 5 do
begin
y := getYear;
y2 := y;
m := 0;
case Random(3) of
  0: if v1 = 2 then m := 2
     else m := 3;
  1,2 : m := Random(12) + 1;
end;
m2 := m;
ms := DaysinMonth(m,y);
k := Random(3);
if v1 = 1 then
case k of
0,1 : begin
      d := 1;
      m2 := m-1;
      if m2 = 0 then
      begin
        m2 := 12;
        dec(y2);
      end;
      d2 := DaysinMonth(m2,y2);
    end;
2 : begin
      d := 2 + Random(ms-1);
      d2 := d-1;
    end;
end
else
case k of
0,1 :   begin
        d := ms;
        d2 := 1;
        m2 := m+1;
        if m2 = 13 then
        begin
         m2 := 1;
         inc(y2);
        end;
        end;
2 : begin
      if (k=2) and (m<>2) then d := ms-1
             else d := 1 + Random(ms-1);
      d2 := d+1;
    end;
end;
if Random(5) = 0 then
repeat
m := 1 + random(12);
d := 30+ random(2);
m2 := m;
d2 := d;
y2 := y;
until dateiscorrect(d,m,y) = 2;
  dataN2('D_'+chr(i+48)+':',d,m,32,i,4);
  dataN('',y,43,i,6);
  resultN2('D_'+chr(i+48)+':',d2,m2,32,i,4);
  resultN('',y2,43,i,6);
end;
resultComment('Changed dates:',9,1);
setNumberOfTests(5);
Pause;
end;

procedure SPar30Dn24(Name, Key: string);
var v1,v2,v3 : byte;
    y1, y2: Real;
    i: integer;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(5,0,0,0,v1,v2,v3);
taskText('Define a\ new type called TPoint that is a\ record with two real-valued fields:',0,1);
taskText('{X} (an {x}-coordinate), {Y} (an {y}-coordinate). Also write a\ real-valued',0,2);
taskText('function Leng({A},\;{B}) that returns the length of a\ segment {AB} ({A} and~{B} are',0,3);
taskText('input parameters of TPoint type): \[|{AB}|~=~\R({A}.{X}\;\-\;{B}.{X})^2\;+\;({A}.{Y}\;\-\;{B}.{Y})^2\r.\]',0,4);
taskText('Using this function, output lengths of segments~{AB}, {AC},\ {AD} provided that',0,5);
taskText('the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99; //2018
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    x0 := otr(x1,y1,x2,y2);
    dataR2(chr(65+i)+': ',x2,y2,Center(i,3,15,7),4,6);
    resultR('|A'+chr(65+i)+'| = ',x0,center(i,3,15,7),3,5);
  end;
setNumberOfTests(3);
Pause;
end;

procedure SPar30Dn25(Name, Key: string);
var v1,v2,v3 : byte;
    y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(6,0,0,0,v1,v2,v3);
taskText('Using the TPoint type and the Leng function (see \1), define a\ new',0,1);
taskText('type called TTriangle that is a\ record with three fields~{A}, {B},~{C} (triangle',0,2);
taskText('vertices) of TPoint type, and write a\ real-valued function Perim({T})',0,3);
taskText('that returns the perimeter of a\ triangle~{T} ({T} is an input parameter',0,4);
taskText('of TTriangle type). Using this function, find perimeters of triangles~{ABC},',0,5);
taskText('{ABD}, {ACD} provided that the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn26(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(7,0,0,0,v1,v2,v3);
taskText('Using the TPoint and TTriangle types and the Leng and Perim functions (see',0,1);
taskText('\2 and \1), write a\ real-valued function Area(T) that returns',0,2);
taskText('the area of a\ triangle~{T} ({T} is an input parameter of TTriangle type):',0,3);
taskText('\[{S}_{ABC}~=~\R{p}\*({p}\;\-\;|{AB}|)\*({p}\;\-\;|{AC}|)\*({p}\;\-\;|{BC}|)\r,\] where {p} is',0,4);
taskText('the \Ihalf-perimeter\i. Using this function, find the areas of triangles~{ABC},',0,5);
taskText('{ABD}, {ACD} provided that the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn27(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(8,0,0,0,v1,v2,v3);
taskText('Using the TPoint and TTriangle types and the Leng and Area functions (see',0,1);
taskText('\3\:\1), write a\ real-valued function Dist({P},\;{A},\;{B}) that',0,2);
taskText('returns the distance {D}({P},\;{AB}) between a\ point~{P} and a\ line~{AB}:',0,3);
taskText('\[{D}({P},\,{AB})~=~2\*{S}_{PAB}/|{AB}|,\] where {S}_{PAB} is the area of the triangle~{PAB}',0,4);
taskText('(parameters~{P}, {A},~{B} are input parameters of TPoint type). Using this',0,5);
taskText('function, find the distance between a point P and each of lines~{AB}, {AC},~{BC}',0,0);
taskText('provided that the coordinates of points~{P},~{A}, {B},~{C} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('P: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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

procedure SPar30Dn28(Name, Key: string);
var v1,v2,v3 : byte;
    a,b,c,p,y1,y2 : real;
    i: integer;
    x,y : array [1..3,1..2] of real;
    s : array [1..3] of string;
begin
start(Name,Topic5,Author,Key,32{level1});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Using the TPoint and TTriangle types and the Dist function (see \4,',0,1);
taskText('\3, \1), write a\ procedure Alts({T},\;{h}_1,\;{h}_2,\;{h}_3) that',0,2);
taskText('evaluates the altitudes~{h}_1, {h}_2,~{h}_3 drawn from the vertices~{T}.{A}, {T}.{B}, {T}.{C}',0,3);
taskText('of a\ triangle~{T} ({T} is an input parameter of TTriangle type, {h}_1, {h}_2, {h}_3',0,4);
taskText('are output real-valued parameters). Using this procedure, evaluate',0,5);
taskText('the altitudes of each of triangles~{ABC}, {ABD}, {ACD} provided that',0,0);
taskText('the coordinates of points~{A},~{B}, {C},~{D} are given.',0,0);
(*
*)
(*==*)
x1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
y1 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
dataR2('A: ',x1,y1,0,2,6);
for i := 1 to 3 do
  begin
    x2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
    y2 := RandomR2(-9.9,9.9); //Random * 19.98-9.99;
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
    resultR('h_1 = ',a,22,i+1,5);
    resultR('h_2 = ',b,41,i+1,5);
    resultR('h_3 = ',c,60,i+1,5);
  end;
setNumberOfTests(3);
Pause;
end;

function area(x1,y1,x2,y2,x3,y3: real): real;
var a12,a13,a23,p: real;
begin
a12 := otr(x1,y1,x2,y2);
a23 := otr(x2,y2,x3,y3);
a13 := otr(x1,y1,x3,y3);
p := (a12+a23+a13)/2;
area := sqrt(p*(p-a12)*(p-a13)*(p-a23));
end;

procedure SPar30Dn29(Name, Key: string);
var i,j,k : integer;
    t,r: real;
    x,y : array [1..9] of real;
    n : array [1..3] of integer;
    v1,v2,v3 : byte;
begin
start(Name,Topic5,Author,Key,73{level2});
getVariant(4,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Using the TPoint type and the Leng function (see \5), write',0,1);
taskText('a\ real-valued function PerimN({P},\;{N}) that returns the perimeter of a\ polygon',0,2);
taskText('with~{N} (>\,2) vertices. The polygon vertices have the TPoint type; an array~{P}',0,3);
taskText('contains all vertices in order of walk. Using this function, find',0,4);
taskText('the perimeters of three polygons provided that the amount',0,5);
taskText('of vertices and the coordinates of all vertices are given for each polygon.',0,0);
(*
*)
end;
2:
begin
taskText('Using the TPoint and TTriangle types and the Area function (see',0,1);
taskText('\6\:\4), write a\ real-valued function AreaN({P},\;{N}) that returns',0,2);
taskText('the area of a\ convex polygon with~{N} (>\,2) vertices. The polygon vertices',0,3);
taskText('have the TPoint type; an array~{P} contains all vertices in order of walk. Using',0,4);
taskText('this function, find the areas of three polygons provided that the amount',0,5);
taskText('of vertices and the coordinates of all vertices are given for each polygon.',0,0);
(*
*)
end;
end;
(*==*)
repeat
  for i := 1 to 3 do n[i] := Random(7)+3;
until (n[1]<6)or(n[2]<6)or(n[3]<6);
k := 0;
if (n[1]<6)and(n[2]<6)and(n[3]<6) then k := 1;
for i := 1 to 3 do
  begin
    inc(k);
    c1 := chr(64+i);
    dataN('N_'+c1+'=',n[i],3,k,1);
    repeat
    t := 0;
    r := RandomR2(3,7); //4*random+3; //2018
    for j := 1 to n[i] do
      begin
        t := t + 6.28*(0.5+Random)/n[i];
        x[j] := r*cos(t);
        y[j] := r*sin(t);
      end;
    until t < 6.28;
    n1 := 0;
    for j := 1 to n[i] do
      begin
        if j=6 then begin inc(k); n1 := 5; end;
        dataR2(c1+'_'+chr(j+48)+':',x[j],y[j],Center(j+1-n1,5,13,1)-11,k,5);
      end;
    case v1 of
    1: begin
    x0 := otr(x[n[i]],y[n[i]],x[1],y[1]);
    for j := 1 to n[i]-1 do
      x0 := x0 + otr(x[j],y[j],x[j+1],y[j+1]);
    resultR('Perimeter of the polygon '+c1+' = ',x0,0,1+i,6);
    end;
    2: begin
    x0 := area(x[1],y[1],x[2],y[2],x[3],y[3]);
    for j := 3 to n[i]-1 do
      x0 := x0 + area(x[1],y[1],x[j],y[j],x[j+1],y[j+1]);
    resultR('Area of the polygon '+c1+' = ',x0,0,1+i,6);
    end;
    end;
  end;
setNumberOfTests(3);
Pause;
end;


procedure SPar30Dn30(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  start(Name,Topic5,Author,Key,73{level2});
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
Topic3 := 'PROCEDURES AND FUNCTIONS: ADDITIONAL TASKS';
Topic4 := 'PROCEDURES AND FUNCTIONS: FILES PROCESSING';
Topic5 := 'PROCEDURES AND FUNCTIONS: RECORDS PROCESSING';
{Author := 'M.~E.~Abramyan, 2002';}
end.

