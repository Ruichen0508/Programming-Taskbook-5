{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit STxt50C4;

{$MODE Delphi}

interface

procedure STxt50Cn1(Name, Key: string);
procedure STxt50Cn2(Name, Key: string);
procedure STxt50Cn3(Name, Key: string);
procedure STxt50Cn4(Name, Key: string);
procedure STxt50Cn5(Name, Key: string);
procedure STxt50Cn6(Name, Key: string);
procedure STxt50Cn7(Name, Key: string);
procedure STxt50Cn8(Name, Key: string);
procedure STxt50Cn9(Name, Key: string);
procedure STxt50Cn10(Name, Key: string);
procedure STxt50Cn11(Name, Key: string);
procedure STxt50Cn12(Name, Key: string);
procedure STxt50Cn13(Name, Key: string);
procedure STxt50Cn14(Name, Key: string);
procedure STxt50Cn15(Name, Key: string);
procedure STxt50Cn16(Name, Key: string);
procedure STxt50Cn17(Name, Key: string);
procedure STxt50Cn18(Name, Key: string);
procedure STxt50Cn19(Name, Key: string);
procedure STxt50Cn20(Name, Key: string);
procedure STxt50Cn21(Name, Key: string);
procedure STxt50Cn22(Name, Key: string);
procedure STxt50Cn23(Name, Key: string);
procedure STxt50Cn24(Name, Key: string);
procedure STxt50Cn25(Name, Key: string);
procedure STxt50Cn26(Name, Key: string);
procedure STxt50Cn27(Name, Key: string);
procedure STxt50Cn28(Name, Key: string);
procedure STxt50Cn29(Name, Key: string);
procedure STxt50Cn30(Name, Key: string);
procedure STxt50Cn31(Name, Key: string);
procedure STxt50Cn32(Name, Key: string);
procedure STxt50Cn33(Name, Key: string);
procedure STxt50Cn34(Name, Key: string);
procedure STxt50Cn35(Name, Key: string);
procedure STxt50Cn36(Name, Key: string);
procedure STxt50Cn37(Name, Key: string);
procedure STxt50Cn38(Name, Key: string);
procedure STxt50Cn39(Name, Key: string);
procedure STxt50Cn40(Name, Key: string);
procedure STxt50Cn41(Name, Key: string);
procedure STxt50Cn42(Name, Key: string);
procedure STxt50Cn43(Name, Key: string);
procedure STxt50Cn44(Name, Key: string);
procedure STxt50Cn45(Name, Key: string);
procedure STxt50Cn46(Name, Key: string);
procedure STxt50Cn47(Name, Key: string);
procedure STxt50Cn48(Name, Key: string);
procedure STxt50Cn49(Name, Key: string);
procedure STxt50Cn50(Name, Key: string);

implementation

uses PT5TaskMaker, PT4Dat_en;



const Prepin = ['.','(',')',',',';',':','?','!','-','"'];
type string80 = string[80];
     pstring80 = ^string80;
     ar80 = array [0..100] of pString80;
var code, code1, code2, code3 : byte;
    s : array[0..31] of pString50;
    s_1,s_2 : ar80;
    len : integer;
    s0,s1,s2,s3,s4,s5,s6 : shortstring;
    Fi,Fi1,Fi2 : file of integer;
    Fr,Fr1,Fr2,Fr3 : file of real;
    Fc : file of char;
    Fs : file of shortstring;
    T,T0,T1,T2,T3 : text;
    x,x0,x1,x2,x3,x4,x5 : real;
    m,k,n,n0,n1,n2,n3,n4,n5,n6 : integer;
    c,c0,c1,c2,c3,c4,c5 : char;
    bln : Boolean;
    Topic,Topic1,Topic2,Topic3,Topic4,Author : string;

function tst: string;
begin
  if CurrentLanguage and lg1C <> 0 then 
    tst := '.txt'
  else
    tst := '.tst';
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
var F: file of string50;
    k,i,j,NS : integer;
    s0,s1 : string50;
    s3,filedat : string;
begin
{  if ptTextCoding = 'ANSI' then filedat := 'gtextw.dat'
                           else filedat := 'gtext.dat';
  s3 := ptFileSearch(filedat);
  if s3 <> '' then
    NS := NS1
  else}
    NS := NS0;
  j := Random(NS)+1;
{  if j > NS0 then
    begin
      Assign(F,s3);
      Reset(F);
      Seek(F,beg_[j]-beg_[NS0+1]);
      read(F,s0);
      Seek(F,beg_[j+1]-1-beg_[NS0+1]);
      read(F,s1);
      k := length(s1);
      if (k>52)or(s0[1]<>'=')or(s1[k]<>'=') then
        begin
          Close(F);
          j := Random(NS0)+1;
        end;
    end;}
  Len := beg_[j+1] - beg_[j];
  k := -1;
{  if  j <= NS0 then}
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
        New(S[k]);
        if s0[length(s0)]='#' then
          begin
            S[k]^ := Copy(s0,1,length(s0)-1);
            Inc(k);
            New(S[k]); S[k]^ := '';
          end
        else S[k]^ := s0;
{      end
  else
    begin
      Seek(F,beg_[j]-beg_[NS0+1]);
      for i := 0 to Len - 1 do
        begin
        read(F,S0);
        Inc(k);
        if i = 0 then s0 := Copy(S0,2,60);
        if i = Len-1 then s0 := Copy(s0,1,length(s0)-1);
        New(S[k]);
        if s0[length(s0)]='#' then
          begin
            S[k]^ := Copy(s0,1,length(s0)-1);
            Inc(k);
            New(S[k]); S[k]^ := '';
          end
        else S[k]^ := s0;
        end;
      Close(F);}
    end;
Len := k+1;
end;





procedure freeText;
var i : integer;
begin
  for i := 0 to len-1 do
    system.dispose(S[i]);
end;

procedure Margin(mar : integer; var s_0 : ar80; var len_0 : integer);
var i,j : integer;
    s0,s1 : string;
begin
len_0 := 0;
s1 := '';
for i := 0 to len-1 do
  begin
    if s[i]^='' then
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
        for  j := 1 to length(s[i]^) do
          begin
            if s[i]^[j]<>' ' then s0 := s0 + s[i]^[j]
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

procedure Margin1(mar : integer; var s_0 : ar80; var len_0 : integer);
var i,j : integer;
    s0,s1 : string;
begin
len_0 := 0;
s1 := '     ';
for i := 0 to len-1 do
  begin
    if s[i]^='' then
      begin
        new(s_0[len_0]);
        s_0[len_0]^ := ''+s1;
        inc(len_0);
        new(s_0[len_0]);
        s_0[len_0]^ := '';
        inc(len_0);
        s1 := '     ';
      end
    else
      begin
        s0 := '';
        for  j := 1 to length(s[i]^) do
          begin
            if s[i]^[j]<>' ' then s0 := s0 + s[i]^[j]
            else
              if s1='     ' then
                begin
                  s1 := '     '+s0;
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

procedure STxt50Cn1(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j : integer;
begin
  Start(Name, Topic1, Author, Key, 66{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Given a\ file name and two positive integers~{N} and~{K},', 0, 2);
  TaskText('create a\ new text file with this name.', 0, 3);
  TaskText('The file must contain {N}~lines, each line consists of {K}~characters~\<*\>.', 0, 4);
(*
*)
S2 := FileName(8) + tst;
N := 1 + Random(26);
K := 1 + Random(10);
dataS('File name: ',S2,0,2);
Assign(T,s2);
rewrite(T);
   for i := 1 to N do
   begin
     for j := 1 to K do write(T,'*');
     writeln(T);
   end;
   dataN('N = ',N,xLeft,4,1);
   dataN('K = ',K,xRight,4,1);
Close(T);
resultComment('File contents:',0,1);
resultFileT(S2,2,5);
SetNumberOfTests(5);
Pause;
end;

procedure STxt50Cn2(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j : integer;
begin
  Start(Name, Topic1, Author, Key, 66{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:begin
  TaskText('Given a\ file name and an integer~{N} (0~<~{N}~<~27),', 0, 1);
  TaskText('create a new text file with this name. The file must contain {N}~lines,', 0, 2);
  TaskText('the first line consisting of one Latin small letter \<a\>, the second one', 0, 3);
  TaskText('consisting of two letters \<ab\>, and so\ on; the last line', 0, 4);
  TaskText('must consist of {N}~initial small letters of the English alphabet.', 0, 5);
(*
*)
  end;
  2:begin
  TaskText('Given a\ file name and an integer~{N} (0~<~{N}~<~27), create a\ new text file', 0, 1);
  TaskText('with this name. The file must contain {N}~lines of length~{N}. The \Um{K}-th\um line', 0, 2);
  TaskText('({K}~=~1,\,\.,\,{N}) must begin with {K}~initial capital letters of the English', 0, 3);
  TaskText('alphabet and must end with the characters \<*\>. For instance, if {N}~equals~4', 0, 4);
  TaskText('then lines of the resulting file must be as follows:', 0, 5);
  TaskText('\<A***\>, \<AB**\>, \<ABC*\>, \<ABCD\>.', 0, 0);
(*
*)
  end;
  end;
(*==*)
S2 := FileName(8) + tst;
N := 1 + Random(26);
K := 1 + Random(10);
dataS('File name: ',S2,0,2);
Assign(T,s2);
rewrite(T);
case v1 of
1: begin
   for i := 1 to N do
   begin
     for j := 1 to i do write(T,chr(Ord('a')+j-1));
     writeln(T);
   end;
   dataN('N = ',N,0,4,1);
   end;
2: begin
   for i := 1 to N do
   begin
     for j := 1 to i do write(T,chr(Ord('A')+j-1));
     for j := i+1 to N do write(T,'*');
     writeln(T);
   end;
   dataN('N = ',N,0,4,1);
   end;
end;
Close(T);
resultComment('File contents:',0,1);
resultFileT(S2,2,5);
SetNumberOfTests(5);
Pause;
end;



procedure STxt50Cn3(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Given a\ text file, output the amount of its characters and lines.',0,2);
taskText('EOLN (\Iend-of-line\i) and EOF (\Iend-of-file\i) markers must not be counted.',0,4);
(*
*)
S1 := FileName(8)+tst;
getText;
Assign(T,S1);
Rewrite(T);
n1 := 0;
n2 := 0;
for j := 0 to Len-1 do
  begin
  n1 := n1 + length(S[j]^);
  inc(n2);
  writeln(T,S[j]^);
  end;
Close(T);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
resultN('Amount of characters: ',n1,0,2,3);
resultN('Amount of strings:    ',n2,28,4,3);
setNumberOfTests(3);
freeText;
pause;
end;

procedure STxt50Cn4(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(1,4,0,0,Code,code1,code2);
case code of
1: begin
taskText('Given a\ string~{S} and a\ text file,',0,2);
taskText('add the string~{S} to the end of the file.',0,4);
(*
*)
end;
2:
begin
taskText('Given two text files,',0,2);
taskText('add the contents of the second file to the end of the first one.',0,4);
(*
*)
end;
3: begin
taskText('Given a string~{S} and a\ text file,',0,2);
taskText('add the string~{S} to the beginning of the file.',0,4);
(*
*)
end;
4:
begin
taskText('Given two text files,',0,2);
taskText('add the contents of the second file to the beginning of the first one.',0,4);
(*
*)
end;
end;
(*==*)
if code in [1,3] then
begin
S1 := FileName(3)+tst;
S2 := '##'+FileName(4)+tst;
getText;
Assign(T,S1);
Rewrite(T);
for j := 0 to Len-1 do
  writeln(T,S[j]^);
Close(T);
case Code of
1 : begin n := Len-1; n1 := 0; n2 := 1; end;
3 : begin n := 0; n1 := 1; n2 := 0; end;
end;
Assign(T0,S2);
Rewrite(T0);
for j := n1 to Len-1-n2 do
  writeln(T0,S[j]^);
Close(T0);
resultFileT(S1,1,5);
Rename(T0,S1);
dataFileT(S1,2,5);
dataS('S = ',S[n]^,2,1);
dataS('File name: ',S1,59,1);
end
else
begin
S1 := '3'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
S3 := '1'+FileName(5)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
Assign(T3,S3);
Rewrite(T3);
for j := 0 to Len-1 do
  begin
    case Code of
    2: writeln(T1,S[j]^);
    4: writeln(T2,S[j]^);
    end;
    writeln(T3,S[j]^);
  end;
freeText;
getText;
for j := 0 to Len-1 do
  begin
    case Code of
    2: writeln(T2,S[j]^);
    4: writeln(T1,S[j]^);
    end;
    writeln(T3,S[j]^);
  end;
Close(T1);
Close(T2);
Close(T3);
resultFileT(S3,2,5);
dataFileT(S2,4,5);
Rename(T1,S3);
dataFileT(S3,2,3);
dataS('Name of the first file: ',S3,xLeft,1);
dataS('Name of the second file: ',S2,xRight,1);
resultComment('New contents of the first file:',0,1);
end;
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50Cn5(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Given an integer~{K} and a\ text file, insert an empty line',0,2);
taskText('before the file line with the order number~{K}. If the file does not contain',0,3);
taskText('a\ line with the required number then do not change it.',0,4);
(*
*)
end;
2: begin
taskText('Given an integer~{K} and a\ text file, insert an empty line',0,2);
taskText('after the file line with the order number~{K}. If the file does not contain',0,3);
taskText('a\ line with the required number then do not change it.',0,4);
(*
*)
end;
end;
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
k := Random(Len+12)+1;
dataN('K = ',k,xLeft,1,2);
if Code=2 then Inc(k);
Assign(T2,S2);
Rewrite(T2);
Assign(T1,S1);
Rewrite(T1);
for j := 0 to Len-1 do
  begin
    writeln(T2,S[j]^);
    if j+1 = k then writeln(T1);
    writeln(T1,S[j]^);
  end;
if (Code=2) and (Len+1 = k) then writeln(T1);
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50Cn6(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Given a\ text file, double occurrences of all empty lines of the file.',0,3);
(*
*)
end;
2:
begin
taskText('Given a\ string~{S} and a\ text file,',0,2);
taskText('replace all empty lines of the file with the contents of the string~{S}.',0,4);
(*
*)
end;
end;
(*==*)
S1 := FileName(5)+tst;
S2 := '##'+FileName(6)+tst;
getText;
case Random(4) of
0 : c := '*';
1 : c := '=';
2 : c := '#';
3 : c := '-';
end;
s0 := '';
for j := 1 to Random(30)+15 do
  s0 := s0 + c;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  if S[j]^ = '' then
  case code of
  1: begin
       writeln(T1);
       writeln(T1);
     end;
  2: writeln(T1,s0);
  end
  else writeln(T1,S[j]^);
  writeln(T2,S[j]^);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
case code of
1: begin
     dataS('File name: ',S1,0,1);
   end;
2: begin
     dataS('S = ',S0,2,1);
     dataS('File name: ',S1,57,1);
   end;
end;
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50Cn7(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(2,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Given a\ nonempty text file, remove its first line.',0,3);
(*
*)
end;
2: begin
taskText('Given a\ nonempty text file, remove its last line.',0,3);
(*
*)
end;
end;
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T,S2);
Rewrite(T);
for j := 0 to Len-1 do
  writeln(T,S[j]^);
Close(T);
case Code of
1 : begin n := 0; n1 := 1; n2 := 0; end;
2 : begin n := Len-1; n1 := 0; n2 := 1; end;
end;
Assign(T0,S1);
Rewrite(T0);
for j := n1 to Len-1-n2 do
  writeln(T0,S[j]^);
Close(T0);
resultFileT(S1,1,5);
Rename(T,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,{57}0,1);
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50Cn8(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Given an integer~{K} and a\ text file, remove the file line',0,2);
taskText('with the order number~{K}. If the file does not contain a\ line',0,3);
taskText('with the required number then do not change it.',0,4);
(*
*)
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
k := Random(Len+12)+1;
Assign(T2,S2);
Rewrite(T2);
Assign(T1,S1);
Rewrite(T1);
for j := 0 to Len-1 do
  begin
    writeln(T2,S[j]^);
    if j+1 <> k then writeln(T1,S[j]^);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataN('K = ',k,xLeft,1,2);
dataS('File name: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50Cn9(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Given\ a text file, remove all empty lines from the file.',0,3);
(*
*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
k := Random(Len+12);
Assign(T2,S2);
Rewrite(T2);
Assign(T1,S1);
Rewrite(T1);
for j := 0 to Len-1 do
  begin
    writeln(T2,S[j]^);
    if S[j]^<>'' then writeln(T1,S[j]^);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50Cn10(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Given two text files, add each line of the second file',0,2);
taskText('to the end of the corresponding line of the first one.',0,3);
taskText('If the second file is shorter (in lines) than the first one',0,4);
taskText('then do not change the remaining lines of the first file.',0,5);
(*
*)
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '3'+FileName(5)+tst;
S3 := '2'+FileName(5)+tst;
getText;
Margin(30,s_1,n1);
freeText;
for i := 0  to n1-1 do
  for j := length(s_1[i]^)+1 to 31 do
    s_1[i]^ := s_1[i]^ + ' ';
getText;
Margin(30,s_2,n2);
freeText;
for i := 0  to n2-1 do
  for j := length(s_2[i]^)+1 to 31 do
    s_2[i]^ := s_2[i]^ + ' ';
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
Assign(T3,S3);
Rewrite(T3);
for j := 0 to n1-1 do
  begin
    writeln(T2,S_1[j]^);
    if j < n2 then
      writeln(T1,S_1[j]^+S_2[j]^)
    else
    writeln(T1,S_1[j]^);
  end;
for j := 0 to n2-1 do
    writeln(T3,S_2[j]^);

Close(T1);
Close(T2);
Close(T3);
freeMargin(s_1,n1);
freeMargin(s_2,n2);
resultComment('New contents of the first file:',0,1);
resultFileT(S1,2,5);
Rename(T2,S1);
dataFileT(S1,2,3);
dataFileT(S3,4,5);
dataS('Name of the first file: ',S1,xLeft,1);
dataS('Name of the second file: ',S3,xRight,1);
setNumberOfTests(5);
Pause;
end;

procedure STxt50Cn11(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Given an integer~{K} and a\ text file, remove {K}~leading characters',0,2);
taskText('from each line of the file. If the length of some line is less than~{K}',0,3);
taskText('then remove all characters from the line.',0,4);
(*
*)
(*==*)
S1 := FileName(6)+tst;
S2 := '#'+FileName(5)+tst;
k := 1 + Random(15);
getText;
Assign(T1,S2);
Rewrite(T1);
Assign(T2,S1);
Rewrite(T2);
for j := 0 to Len-1 do
begin
    writeln(T1,S[j]^);
    writeln(T2,copy(S[j]^,k+1,100));
end;
Close(T1);
Close(T2);
resultFileT(S1,1,5); //2012
Rename(T1,S1);
dataFileT(S1,2,5);
dataN('K = ',k,xLeft,1,1);
dataS('File name: ',S1,xRight,1);
setNumberOfTests(3);
freeText;
Pause;
end;


procedure STxt50Cn12(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j,j0 : integer;
    s3 : array [0..9] of string;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Given a\ text file, replace all its Latin capital letters',0,2);
taskText('with the corresponding small letters,',0,3);
taskText('and all Latin small letters with the capital ones.',0,4);
(*
*)
end;
2:begin
taskText('Given a\ text file, replace its successive blank characters',0,2);
taskText('with the single blank character.',0,4);
(*
*)
end;
end;
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
s3[0] := ''; s3[1] := ''; s3[2] := ' '; s3[3] := ' '; s3[4] := ' ';
s3[5] := '  '; s3[6] := '  '; s3[7] := '   '; s3[8] := '   ';
s3[9] := '    ';
for j := 0 to Len-1 do
  begin
  writeln(T1,S[j]^);
  case code of
  1:
  begin
  s0 := S[j]^;
  for i := 1 to Length(s0) do
     if Pos(s0[i],c2)<>0 then s0[i] := c1[Pos(s0[i],c2)]
     else
        if Pos(s0[i],c1)<>0 then s0[i] := c2[Pos(s0[i],c1)];
  end;
  2:
  repeat
  S0 := '';
  for j0 := 1 to length(S[j]^) do
    begin
      s0 := s0 + s[j]^[j0];
      if s[j]^[j0]=' ' then
        s0 := s0 + s3[Random(10)];
    end;
  until Length(S0)<=70;
  end;
  writeln(T2,s0);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(5);
freeText;
Pause;
end;




procedure STxt50Cn13(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Given a\ text file that contains more than three lines,',0,2);
taskText('remove its last three lines.',0,4);
(*
*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
k := 3;
Assign(T,S2);
Rewrite(T);
for j := 0 to Len-1 do
  writeln(T,S[j]^);
Close(T);
n1 := 0; n2 := k;
Assign(T0,S1);
Rewrite(T0);
for j := n1 to Len-1-n2 do
  writeln(T0,S[j]^);
Close(T0);
resultFileT(S1,1,5);
Rename(T,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50Cn14(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Given an integer~{K} (0~<~{K}~<~10) and a\ text file',0,2);
taskText('that contains more than {K}~lines, remove its last {K}~lines.',0,4);
(*
*)
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
k := Random(9)+1;
Assign(T,S2);
Rewrite(T);
for j := 0 to Len-1 do
  writeln(T,S[j]^);
Close(T);
n1 := 0; n2 := k;
Assign(T0,S1);
Rewrite(T0);
for j := n1 to Len-1-n2 do
  writeln(T0,S[j]^);
Close(T0);
resultFileT(S1,1,5);
Rename(T,S1);
dataFileT(S1,2,5);
     dataN('K = ',k,xLeft,1,1);
     dataS('File name: ',S1,xRight,1);
setNumberOfTests(3);
freeText;
Pause;
end;


procedure STxt50Cn15(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('An integer~{K} (0~<~{K}~<~10) and a\ text file that contains more than {K}~lines',0,2);
taskText('are given. Create a new file that contains {K}~last lines of the given file.',0,4);
(*
*)
(*==*)
S1 := '1'+FileName(4)+tst;
S2 := '2'+FileName(4)+tst;
getText;
k := Random(9)+1;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
    writeln(T1,S[j]^);
for j := Len-k to Len-1 do
    writeln(T2,S[j]^);
Close(T1);
Close(T2);
resultFileT(S2,1,5);
dataFileT(S1,2,5);
dataN('K = ',k,2,1,1);
dataS('Name of the given file: ',S1,9,1);
dataS('Name of the new file: ',S2,45,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50Cn16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50Cn17(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
taskText('A text file is given. Find the amount of paragraphs of the given text',0,2);
taskText('provided that paragraphs are separated by one or more empty lines.',0,4);
(*
*)
S1 := FileName(6)+tst;
getText;
Assign(T,S1);
Rewrite(T);
n1 := 0;
for j := 0 to Len-1 do
  begin
  if (j=0) or (S[j-1]^ ='') then inc(n1);
  writeln(T,S[j]^);
  if S[j]^ = '' then
    for j1:=1 to Random(4) do
      writeln(T);
  end;
Close(T);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
resultN('',n1,0,3,2);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50Cn18(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('An integer~{K} and a\ text file are given. Remove a\ paragraph',0,1);
taskText('with the order number~{K} from the given file provided that paragraphs',0,2);
taskText('are separated by one or more empty lines. Empty lines must not be removed.',0,3);
taskText('If the file does not contain a\ paragraph with the required number',0,4);
taskText('then do not change it.',0,5);
(*
*)
(*==*)
n := Random(9)+1;
n1 := 0;
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  if (j=0) or (S[j-1]^ ='') then
    begin
    inc(n1);
    end;
  writeln(T2,S[j]^);
  if (n1<>n)or(S[j]^='') then writeln(T1,S[j]^);
  if S[j]^ = '' then
    for i:=1 to Random(3) do
      begin
      writeln(T1);
      writeln(T2);
      end;
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataN('K = ',n,xLeft,1,1);
dataS('File name: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50Cn19(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('A text file is given. Find the amount of paragraphs of the given text',0,2);
taskText('provided that the first line of each paragraph is indented',0,3);
taskText('by five blank characters. Empty lines must not be counted.',0,4);
(*
*)
(*==*)
S1 := FileName(6)+tst;
getText;
Assign(T,S1);
Rewrite(T);
n1 := 0;
for j := 0 to Len-1 do
  begin
  if (j=0) or (S[j-1]^ ='') then
    begin
      inc(n1);
      writeln(T,'     '+S[j]^);
    end
  else
    if S[j]^ = '' then
      for j1:=1 to Random(2) do
        writeln(T)
    else writeln(T,S[j]^);
  end;
Close(T);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
resultN('',n1,0,3,2);
setNumberOfTests(5);
freeText;
Pause;
end;


procedure STxt50Cn20(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('An integer~{K} and a\ text file are given. Remove a\ paragraph',0,1);
taskText('with the order number~{K} from the given file provided that the first line',0,2);
taskText('of each paragraph is indented by five blank characters. Empty lines',0,3);
taskText('must not be counted and removed. If the file does not contain a\ paragraph',0,4);
taskText('with the required number then do not change it.',0,5);
(*
*)
(*==*)
n := Random(9)+1;
n1 := 0;
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  if (j=0) or (S[j-1]^ ='') then
    begin
    inc(n1);
    end;
  if S[j]^ <> '' then
    begin
      if (j=0) or (S[j-1]^ ='') then S0 := '     '+S[j]^
      else s0 := S[j]^;
      writeln(T2,S0);
      if n1<>n then writeln(T1,S0);
    end
  else
    for i:=1 to integer(Random(3))-1 do
      begin
      writeln(T1);
      writeln(T2);
      end;
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataN('K = ',n,xLeft,1,1);
dataS('File name: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;


procedure STxt50Cn21(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('A text file is given. The file does not contain empty lines,',0,2);
taskText('the first line of each paragraph is indented by five blank characters.',0,3);
taskText('Insert an empty line between adjacent paragraphs',0,4);
taskText('(do not insert empty lines to the beginning and end of the file).',0,5);
(*
*)
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T,S1);
Rewrite(T);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  if (j=0) or (S[j-1]^ ='') then
    begin
      writeln(T2,'     '+S[j]^);
      writeln(T,'     '+S[j]^);
    end
  else
    if S[j]^ = '' then
      writeln(T)
    else
      begin
        writeln(T,S[j]^);
        writeln(T2,S[j]^);
      end;
  end;
Close(T);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50Cn22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50Cn23(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(7,2,0,0,code,code1,code2);
case Code of
1 :
begin
taskText('A text file is given. Output its first word of the maximal length.',0,2);
taskText('A\ \Iword\i is defined as a\ character sequence that does not contain',0,3);
taskText('blank characters and is bounded by blank characters or the line beginning/end.',0,4);
(*
*)
end;
2 : begin
taskText('A text file is given. Output its last word of the minimal length.',0,2);
taskText('A\ \Iword\i is defined as a\ character sequence that does not contain',0,3);
taskText('blank characters and is bounded by blank characters or the line beginning/end.',0,4);
(*
*)
end;
end;
(*==*)
S1 := '1'+FileName(5)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
case code of
1:
s0 := '';
2:
s0 := '                                  ';
end;

for j := 0 to Len-1 do
  begin
  writeln(T1,S[j]^);
  s3 := '';
  for i := 1 to length(S[j]^) do
    if S[j]^[i]<>' ' then s3 := s3 + S[j]^[i]
    else
      begin
        case code of
        1 : if length(s3)>length(s0) then s0 := s3;
        2 : if (s3 <> '') and (length(s3)<=length(s0)) then s0 := s3;
        end;
        s3 := '';
      end;
  case code of
  1 : if length(s3)>length(s0) then s0 := s3;
  2 : if (s3 <> '') and (length(s3)<=length(s0)) then s0 := s3;
  end;
  end;
Close(T1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
resultS('',s0,0,3);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50Cn24(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('An integer~{K} and a\ text file are given. Create a\ new binary file of strings',0,1);
taskText('that contains all words of length~{K} from the given file. A\ \Iword\i is defined',0,2);
taskText('as a\ character sequence that does not contain blank characters,',0,3);
taskText('punctuation marks and is bounded by blank characters, punctuation marks',0,4);
taskText('or the line beginning/end. If the given file does not contain words',0,5);
taskText('of length~{K} then the resulting file must be empty.',0,0);
(*
*)
(*==*)
S1 := '1'+FileName(4)+tst;
S2 := '2'+FileName(4)+tst;
getText;
n := random(12)+1;
Assign(T1,S1);
Rewrite(T1);
Assign(Fs,S2);
Rewrite(Fs);
s0 := '';
for j := 0 to Len-1 do
  begin
  writeln(T1,S[j]^);
  s3 := '';
  for i := 1 to length(S[j]^) do
    if (S[j]^[i]<>' ') and not (S[j]^[i] in prepin) then s3 := s3 + S[j]^[i]
    else
      begin
        if length(s3)=n then write(Fs,s3);
        s3 := '';
      end;
  if length(s3)=n then write(Fs,s3);
  end;
Close(T1);
Close(Fs);
dataFileT(S1,2,4);
resultFileS(S2,3,n+3);
dataN('K = ',n,xLeft,1,1);
dataS('Name of the given file: ',S1,xRight,1);
dataS('Name of the new file: ',S2,0,5);
resultComment('Contents of the new file:',0,2);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50Cn25(Name, Key: string);
const c3 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j,j0,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1 : begin
    s1 := '';
    s2 := '';
taskText('A char~{C} that is a\ Latin capital letter and a\ text file are given.',0,1);
taskText('Create a\ new binary file of strings that contains words of the given text',0,2);
taskText('with the first character~{C} (of uppercase or lowercase). A\ \Iword\i is defined',0,3);
taskText('as a\ character sequence that does not contain blank characters,',0,4);
taskText('punctuation marks and is bounded by blank characters, punctuation marks',0,5);
taskText('or the line beginning/end. If the given file does not contain',0,0);
taskText('the required words then the resulting file must be empty.',0,0);
(*
*)
    end;
2 : begin
    s1 := ' ';
    s2 := '';
taskText('A char~{C} that is a\ Latin small letter and a\ text file are given.',0,1);
taskText('Create a\ new binary file of strings that contains words of the given text',0,2);
taskText('with at least one character~{C} (of uppercase or lowercase). A\ \Iword\i is defined',0,3);
taskText('as a\ character sequence that does not contain blank characters,',0,4);
taskText('punctuation marks and is bounded by blank characters, punctuation marks',0,5);
taskText('or the line beginning/end. If the given file does not contain',0,0);
taskText('the required words then the resulting file must be empty.',0,0);
(*
*)
    end;
end;
(*==*)
S1 := '1'+FileName(4)+tst;
S2 := '2'+FileName(4)+tst;
j1 := 1;
getText;
n := 1 + random(26); //2022 ËÒÔ‡‚ËÎ Ó¯Ë·ÍÛ ‚ ‡Ì„ÎËÈÒÍÓÏ ‚‡Ë‡ÌÚÂ!!
c := c3[n];
c1 := c2[n];
Assign(T1,S1);
Rewrite(T1);
Assign(Fs,S2);
Rewrite(Fs);
s0 := '';
for j := 0 to Len-1 do
  begin
  writeln(T1,S[j]^);
  s3 := '';
  for i := 1 to length(S[j]^) do
    if (S[j]^[i]<>' ') and not (S[j]^[i] in prepin) then s3 := s3 + S[j]^[i]
    else
      begin
        bln := false;
        if length(s3)>0 then
        case code of
        1: bln := (s3[1]=c)or(s3[1]=c1);
        2: bln := Pos(c,s3)+Pos(c1,s3) <> 0;
        end;
        if bln then
             begin
               write(Fs,s3);
               if j1<length(s3) then j1 := length(s3);
             end;
        s3 := '';
      end;
  bln := false;
  if length(s3)>0 then
  case code of
  1: bln := (s3[1]=c)or(s3[1]=c1);
  2: bln := Pos(c,s3)+Pos(c1,s3) <> 0;
  end;
  if bln then
       begin
         write(Fs,s3);
         if j1<length(s3) then j1 := length(s3);
       end;
  end;
Close(T1);
Close(Fs);
dataFileT(S1,2,4);
resultFileS(S2,3,j1+3);
case code of
1: dataC('C = ',C,xLeft,1);
2: dataC('C = ',C1,xLeft,1);
end;
dataS('Name of the given file: ',S1,xRight,1);
dataS('Name of the new file: ',S2,0,5);
resultComment('Contents of the new file:',0,2);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50Cn26(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50Cn27(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
getVariant(5,0,0,0,Code,code1,code2);
taskText('A text file whose lines are left-aligned is given.',0,2);
taskText('Make the given text right-aligned by means of adding',0,3);
taskText('leading blank characters to all nonempty lines.',0,4);
taskText('The width of text must be equal to 50~characters.',0,5);
(*
*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  S0 := s[j]^;
  writeln(T2,S0);
  if s0<>'' then
  for j0 := length(s0)+1 to 50 do
       s0 := ' '+s0;
  writeln(T1,s0);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(5);
freeText;
pause;
end;


procedure STxt50Cn28(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(5,2,0,0,Code,code1,code2);
case code of
1: begin
taskText('A text file whose lines are left-aligned is given.',0,1);
taskText('Make the given text centered by means of adding leading blank characters',0,2);
taskText('to all nonempty lines. The width of text must be equal to 50~characters.',0,3);
taskText('If the length of line is an odd number then add one blank character',0,4);
taskText('to the beginning of this line before centering.',0,5);
(*
*)
end;
2: begin
taskText('A text file whose lines are right-aligned is given.',0,1);
taskText('Make the given text centered by means of removing a\ half',0,2);
taskText('of leading blank characters from all nonempty lines. If the amount',0,3);
taskText('of leading blank characters of line is an odd number then remove',0,4);
taskText('one blank character from the beginning of this line before centering.',0,5);
(*
*)
end;
end;
(*==*)
S1 := FileName(6)+tst;
S2 := '##'+FileName(6)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
for j := 0 to Len-1 do
  begin
  S0 := s[j]^;
  if code <> 2 then
  writeln(T2,S0)
  else
  begin
  if S0 = '' then
    writeln(T2)
  else
  begin
  if length(S0) = 50 then writeln(T2,S0)
  else
    writeln(T2,' ':50-length(S0),S0);
  end;
  end;
  if s0<>'' then
  case code of
1:  begin
      if Odd(length(s0)) then s0 := ' '+s0;
      for j0 := 1 to (50 - length(s0)) div 2 do
        s0 := ' '+s0;
    end;
2:  begin
      for j0 := 1 to (50 - length(s0)) div 2 do
        s0 := ' '+s0;
    end;
  end;
  writeln(T1,s0);
  end;
Close(T1);
Close(T2);
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
setNumberOfTests(5);
freeText;
Pause;
end;



procedure STxt50Cn29(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('A text file whose lines are left-aligned is given.',0,1);
taskText('Paragraphs of the given text are separated by one empty line.',0,2);
taskText('Make the given text \Ifull-aligned\i (that is, left-aligned',0,3);
taskText('and right-aligned simultaneously) by means of inserting additional',0,4);
taskText('blank characters between words in all nonempty lines except the last line',0,5);
taskText('of each paragraph. Spaces between words in each line must be processed',0,0);
taskText('from right to left; the width of text must be equal to 50~characters.',0,0);
(*
*)
(*==*)
code := 2;
S1 := FileName(6)+tst;
S2 := '##'+FileName(4)+tst;
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
getText;
for i := 0  to len-1 do
 begin
  writeln(T2,s[i]^);
  n := length(s[i]^);
  if not((s[i]^='') or (i=len-1) or (s[i+1]^='') or (n=50)) then
    begin
    n1 := 1;
    case code of
    1: begin
         repeat
         j := 1;
         while j <= length(s[i]^) do
           begin
             if s[i]^[j]=' ' then
               begin
                 Insert(' ',s[i]^,j);
                 inc(j,n1);
                 inc(n);
                 if n=50 then break;
               end;
             inc(j);
           end;
         inc(n1);
         until n=50;
         end;
   2: begin
         repeat
         j := n;
         while j >= 1  do
           begin
             if s[i]^[j]=' ' then
               begin
                 Insert(' ',s[i]^,j);
                 inc(n);
                 j := j-n1+1;
                 if n=50 then break;
               end;
             dec(j);
           end;
         inc(n1);
         until n=50;
         end;
   end;
   end;
  writeln(T1,s[i]^)
 end;
close(T1);
close(T2);
freeText;
resultFileT(S1,1,5);
Rename(T2,S1);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
Pause;
end;

procedure STxt50Cn30(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
getVariant(7,0,0,0,Code,code1,code2);
taskText('An integer~{K} (>\,25) and a\ text file, whose lines are left-aligned, are given.',0,1);
taskText('Paragraphs of the given text are separated by one empty line. Format',0,2);
taskText('the given text so that all its lines consist of no more than {K}~characters.',0,3);
taskText('The resulting text must contain the same paragraphs and be left-aligned.',0,4);
taskText('Blank characters at the end of lines must be removed. Save the formatted text',0,5);
taskText('in a new text file.',0,0);
(*
*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
n := 26 + Random(40);
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
getText;
Margin(n,s_1,n1);
for i := 0  to len-1 do
  writeln(T1,s[i]^);
for i := 0  to n1-1 do
  writeln(T2,s_1[i]^);
close(T1);
close(T2);
freeText;
freeMargin(s_1,n1);
resultFileT(S2,1,5);
dataFileT(S1,2,4);
dataN('K = ',n,xLeft,1,2);
dataS('Name of the given file: ',S1,xRight,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ËÒıÓ‰ÌÓ„Ó Ù‡ÈÎ‡:',50,1);}
dataS('Name of the new file: ',S2,0,5);
{resultComment('—Ó‰ÂÊËÏÓÂ Ù‡ÈÎ‡ ÂÁÛÎ¸Ú‡ÚÓ‚:',0,1);}
Pause;
end;
procedure STxt50Cn31(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(7,0,0,0,Code,code1,code2);
taskText('An integer~{K} (>\,25) and a\ text file, whose lines are left-aligned, are given.',0,1);
taskText('The file does not contain empty lines, the first line of each paragraph',0,2);
taskText('is indented by five blank characters. Format the given text so that',0,3);
taskText('all its lines consist of no more than {K}~characters. The resulting text',0,4);
taskText('must contain the same paragraphs and be left-aligned. Blank characters',0,5);
taskText('at the end of lines must be removed. Save the formatted text',0,0);
taskText('in a new text file.',0,0);
(*
*)
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
n := 26 + Random(40);
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
getText;
for j := 0 to Len-1 do
  begin
  if S[j]^ <> '' then
    begin
      if (j=0) or (S[j-1]^ ='') then S0 := '     '+S[j]^
      else s0 := S[j]^;
      writeln(T1,S0);
    end;
  end;
Margin1(n,s_1,n1);
for i := 0  to n1-1 do
  if s_1[i]^ <> '' then
    writeln(T2,s_1[i]^);
close(T1);
close(T2);
freeText;
freeMargin(s_1,n1);
resultFileT(S2,1,5);
dataFileT(S1,2,4);
dataN('K = ',n,xLeft,1,2);
dataS('Name of the given file: ',S1,xRight,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ËÒıÓ‰ÌÓ„Ó Ù‡ÈÎ‡:',50,1);}
dataS('Name of the new file: ',S2,0,5);
{resultComment('—Ó‰ÂÊËÏÓÂ Ù‡ÈÎ‡ ÂÁÛÎ¸Ú‡ÚÓ‚:',0,1);}
Pause;
end;

procedure STxt50Cn32(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50Cn33(Name, Key: string);
var i,i1,i2,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(2,2,0,0,Code,code1,code2);
case code of
1: begin
taskText('Two files of integers are given; the files contain the equal amount',0,1);
taskText('of components. Create a\ new text file that contains string representations',0,2);
taskText('of components of the given binary files. These representations must',0,3);
taskText('be arranged in two columns, each of 30~characters width (the first and second',0,4);
taskText('columns contain components of the first and second file respectively). Each',0,5);
taskText('line of the resulting text must start and end with \<|\> separator (the numeric',0,0);
taskText('value~124), all string representations of integers are right-aligned',0,0);
taskText('with respect to column boundary.',0,0);
(*
*)
end;
2: begin
taskText('Three files of integers are given; the files contain the equal amount',0,1);
taskText('of components. Create a\ new text file that contains string representations',0,2);
taskText('of components of the given binary files. These representations must',0,3);
taskText('be arranged in three columns, each of 20~characters width (the first, second,',0,4);
taskText('and third columns contain components of the corresponding file). Each line',0,5);
taskText('of the resulting text must start and end with \<|\> separator (the numeric',0,0);
taskText('value~124), all string representations of integers are left-aligned',0,0);
taskText('with respect to column boundary.',0,0);
(*
*)
end;
end;
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
S3 := '3'+FileName(5)+tst;
S0 := '0'+FileName(5)+tst;
Assign(Fi,S1);
Rewrite(Fi);
Assign(Fi1,S2);
Rewrite(Fi1);
if code = 2 then
begin
Assign(Fi2,S3);
Rewrite(Fi2);
end;
Assign(T1,S0);
Rewrite(T1);
n1 := Random(10)+15;
for j := 1 to n1 do
  begin
    i := integer(Random(1000))-500;
    i1 := integer(Random(1000))-500;
    i2 := integer(Random(1000))-500;
    write(Fi,i);
    write(Fi1,i1);
    case code of
    1:writeln(T1,'|',i:30,i1:30,'|');
    2:begin
        write(Fi2,i2);
        str(i,s4);
        str(i1,s5);
        str(i2,s6);
        writeln(T1,'|',i,' ':20-length(s4),i1,' ':20-length(s5),i2,' ':20-length(s6),'|');
      end;
    end;
  end;
Close(T1);
Close(Fi);
Close(Fi1);
if code = 2 then
Close(Fi2);
resultFileT(S0,1,5);
case code of
1:begin
dataFileN(S1,3,5);
dataFileN(S2,4,5);
dataComment('Names of the given files:',16,2);
dataS('',S1,39,2);
{dataComment('—Ó‰ÂÊËÏÓÂ ÔÂ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
dataS('',S2,52,2);
{dataComment('—Ó‰ÂÊËÏÓÂ ‚ÚÓÓ„Ó Ù‡ÈÎ‡:',xRight,3);}
dataS('Name of the new file: ',S0,0,5);
end;
2:begin
dataFileN(S1,2,5);
dataFileN(S2,3,5);
dataFileN(S3,4,5);
dataComment('Names of the given files:',10,1);
dataS('',S1,33,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ÔÂ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
dataS('',S2,46,1);
dataS('',S3,59,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ‚ÚÓÓ„Ó Ù‡ÈÎ‡:',xRight,3);}
dataS('Name of the new file: ',S0,0,5);
end;
end;
Pause;
end;

procedure STxt50Cn34(Name, Key: string);
var i,j,i1 : integer;
    a,b : real;
begin
start(Name,Topic3,Author,Key,66{level});(*DEMO*)
getVariant(3,0,0,0,Code,code1,code2);
taskText('Real numbers~{A}, {B} and an integer~{N} are given. Create a text file',0,1);
taskText('that contains table of values of the function~\R{x}\r at points',0,2);
taskText('of the segment~[{A},\,{B}] with the step {H}~=~({B}\,\-\,{A})/{N} (that is,',0,3);
taskText('at the points~{A}, {A}\,+\,{H}, {A}\,+\,2\*{H},~\., {B}). The table consists of two columns,',0,4);
taskText('the first column contains arguments~{x}, the second one contains the function',0,5);
taskText('values~\R{x}\r. The width of the columns is~10 and~15 characters respectively;',0,0);
taskText('the width of the fractional part of arguments and function values is~4 and~8',0,0);
taskText('respectively; all string representations of numbers are right-aligned',0,0);
taskText('with respect to column boundary.',0,0);
(*
*)

S1 := FileName(6)+tst;
n := 10 + Random(20);
a := random(5);
b := a + random(5)+1;
Assign(T1,S1);
Rewrite(T1);
x0 := (b-a)/n;
for i := 0  to n do
  begin
    x := a + i*x0;
    writeln(T1,x:10:4,sqrt(x):15:8);
  end;
close(T1);
resultFileT(S1,1,5);
{resultComment('—Ó‰ÂÊËÏÓÂ Ù‡ÈÎ‡ ÂÁÛÎ¸Ú‡ÚÓ‚:',0,1);}
dataR('A = ',a,xleft,2,4);
dataR('B = ',b,xright,2,4);
dataN('N = ',n,0,3,2);
dataS('File name: ',S1,0,4);
pause;
end;


procedure STxt50Cn35(Name, Key: string);
var i,j,i1 : integer;
    a,b : real;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(3,0,0,0,Code,code1,code2);
taskText('Real numbers~{A}, {B} and an integer~{N} are given. Create a text file',0,1);
taskText('that contains table of values of the functions~sin({x}) and~cos({x}) at points',0,2);
taskText('of the segment~[{A},\,{B}] with the step {H}~=~({B}\,\-\,{A})/{N} (that is,',0,3);
taskText('at the points~{A}, {A}\,+\,{H}, {A}\,+\,2\*{H},~\., {B}). The table consists of three columns,',0,4);
taskText('the first column contains arguments~{x}, the second and the third one contains',0,5);
taskText('the function values~sin({x}) and~cos({x}) respectively. The width of the first',0,0);
taskText('column is 8~characters, the width of the other columns is 12~characters;',0,0);
taskText('the width of the fractional part of arguments and function values is~4 and~8',0,0);
taskText('respectively; all string representations of numbers are right-aligned',0,0);
taskText('with respect to column boundary.',0,0);
(*
*)
(*==*)
S1 := FileName(6)+tst;
n := 10 + Random(20);
a := random(5);
b := a + random(5)+1;
Assign(T1,S1);
Rewrite(T1);
x0 := (b-a)/n;
for i := 0  to n do
  begin
    x := a + i*x0;
    writeln(T1,x:8:4,sin(x):12:8,cos(x):12:8);
  end;
close(T1);
resultFileT(S1,1,5);
{resultComment('—Ó‰ÂÊËÏÓÂ Ù‡ÈÎ‡ ÂÁÛÎ¸Ú‡ÚÓ‚:',0,1);}
dataR('A = ',a,xleft,2,4);
dataR('B = ',b,xright,2,4);
dataN('N = ',n,0,3,2);
dataS('File name: ',S1,0,4);
Pause;
end;


procedure STxt50Cn36(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});(*DEMO*)
taskText('A text file is given. Each line of the file represents',0,2);
taskText('an integer padded by several leading and trailing blank characters.',0,3);
taskText('Output the amount and sum of these integers.',0,4);
(*
*)
S1 := FileName(8)+tst;
Assign(T,S1);
Rewrite(T);
n1 := 0;
n3 := Random(10)+ 3;
for j := 1 to n3 do
  begin
  n2 := integer(Random(1000))-500;
  n1 := n1 + n2;
  writeln(T,' ':Random(6),n2,' ':Random(6));
  end;
Close(T);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
resultN('Amount of integers:',n3,0,2,3);
resultN('Sum of integers: ',n1,0,4,5);
Pause;
end;

procedure STxt50Cn37(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(9,4,0,0,Code,code1,code2);
case code of
1:
begin
taskText('A text file is given. Each line of the file represents an integer',0,2);
taskText('or real number padded by several leading and trailing blank characters.',0,3);
taskText('All real numbers have nonzero fractional part.',0,4);
taskText('Output the amount and sum of numbers with nonzero fractional part.',0,5);
(*
*)
end;
2: begin
taskText('A text file is given. Each line of the file represents several integers',0,1);
taskText('and real numbers that are separated by one or more blank characters.',0,2);
taskText('All real numbers have nonzero fractional part.',0,3);
taskText('Create a\ binary file of real numbers that contains all given numbers',0,4);
taskText('with nonzero fractional part (in the same order).',0,5);
(*
*)
end;
3: begin
taskText('A text file is given. Each line of the file represents an integer',0,2);
taskText('or real number padded by several leading and trailing blank characters.',0,3);
taskText('All real numbers have nonzero fractional part.',0,4);
taskText('Output the amount and sum of integers.',0,5);
(*
*)
end;
4: begin
taskText('A text file is given. Each line of the file represents several integers',0,1);
taskText('and real numbers that are separated by one or more blank characters.',0,2);
taskText('All real numbers have nonzero fractional part.',0,3);
taskText('Create a\ binary file of integers that contains all integers',0,4);
taskText('(in the same order).',0,5);
(*
*)
end;
end;
(*==*)
case code of
1,3:
begin
S1 := FileName(8)+tst;
Assign(T,S1);
Rewrite(T);
n1 := 0;
n3 := 0;
n4 := 0;
x1 := 0;
for j := 0 to Random(10)+2 do
  begin
  if Random(2)=0 then
    begin
      n2 := integer(Random(1000))-500;
      n1 := n1 + n2;
      inc(n3);
      writeln(T,' ':Random(6),n2,' ':Random(6));
    end
  else
    begin
      repeat
      x2 := Round((Random*1000-500)*100)/100;
      until Frac(x2)<>0;
      x1 := x1 + x2;
      inc(n4);
      writeln(T,' ':Random(6),x2:0:2,' ':Random(6));
    end
  end;
Close(T);
dataFileT(S1,2,5);
dataS('File name: ',S1,0,1);
case code of
1: begin
     resultN('Amount of numbers with nonzero fractional part: ',n4,0,2,5);
     resultR('Sum of numbers with nonzero fractional part: ',x1,0,4,8);
   end;
3: begin
     resultN('Amount of integers:',n3,0,2,3);
     resultN('Sum of integers: ',n1,0,4,5);
   end;
end;
end;
2,4:
begin
S1 := '1'+FileName(7)+tst;
S2 := '2'+FileName(7)+tst;
Assign(T,S1);
Rewrite(T);
case code of
2:begin
Assign(Fr,S2);
Rewrite(Fr);
end;
4:begin
Assign(Fi,S2);
Rewrite(Fi);
end;
end;
for j := 0 to Random(10)+2 do
  begin
  for i := 0 to Random(5) do
    begin
      if i <> 0 then write(T,' ':Random(6));
      if Random(2)=0 then
      begin
      n2 := integer(Random(1000))-500;
      write(T,n2);
      if code = 4 then write(Fi,n2);
      end
      else
      begin
      repeat
      x2 := Round((Random*1000-500)*100)/100;
      until Frac(x2)<>0;
      write(T,x2:0:2);
      if code = 2 then write(Fr,x2);
      end
    end;
  writeln(T);
  end;


Close(T);
case code of
2: begin
Close(Fr);
ResultFileR(S2,3,8);
end;
4: begin
Close(Fi);
ResultFileN(S2,3,6);
end;
end;
dataFileT(S1,2,4);
dataS('Name of the given file: ',S1,0,1);
dataS('Name of the new file: ',S2,0,5);
resultComment('Contents of the new file:',0,2);
end;
end;
Pause;
end;



procedure STxt50Cn38(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
taskText('A text file and a\ binary file of integers are given.',0,1);
taskText('Add a\ string representation of each integer from the binary file',0,2);
taskText('to the end of the corresponding line of the text file. If the amount',0,3);
taskText('of integers is less than the amount of text lines',0,4);
taskText(' then do not change remaining text lines.',0,5);
(*
*)
(*==*)
S1 := '3'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
S3 := '1'+FileName(5)+tst;
getText;
for i := 0  to len-1 do
  begin
  s[i]^ := ' '+s[i]^+' ';
  end;
Assign(T1,S1);
Rewrite(T1);
Assign(Fi,S2);
Rewrite(Fi);
Assign(T3,S3);
Rewrite(T3);
n1 := Random(10)+15;
for j := 0 to len-1 do
  begin
    i := integer(Random(1000))-500;
    writeln(T1,S[j]^);
    if j <n1 then
      begin
        write(Fi,i);
        writeln(T3,S[j]^,i);
      end
    else
      writeln(T3,S[j]^);
  end;
for j := len to n1 do
  begin
    i := integer(Random(1000))-500;
    write(Fi,i);
  end;
Close(T1);
Close(Fi);
Close(T3);
freeText;
resultComment('New contents of the text file:',0,1);
resultFileT(S3,2,5);
Rename(T1,S3);
dataFileT(S3,2,4);
dataFileN(S2,5,5);
dataS('Name of the text file: ',S3,xLeft,1);
dataS('Name of the binary file: ',S2,xRight,1);
Pause;
end;
procedure STxt50Cn39(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('A text file is given. Each line of the text file consists of a\ text string',0,1);
taskText('(of 30~characters length) and a\ representation of a\ real number.',0,2);
taskText('Create two binary files; the first one is a\ file of strings that contains',0,3);
taskText('text parts from the given text file, the second one is a\ file of real numbers',0,4);
taskText('that contains numbers from the given text file (in the same order).',0,5);
(*
*)
(*==*)
S0 := '1'+FileName(5)+tst;
S1 := '2'+FileName(5)+tst;
S2 := '3'+FileName(5)+tst;
Assign(Fs,S1);
Rewrite(Fs);
Assign(Fr,S2);
Rewrite(Fr);
Assign(T1,S0);
Rewrite(T1);
getText;

Margin(29,s_1,n1);
freeText;
for i := 0  to n1-1 do
begin
  for j := length(s_1[i]^)+1 to 29 do
    s_1[i]^ := s_1[i]^ + ' ';
s_1[i]^ := s_1[i]^ + '|';
end;


for i := 0  to n1-1 do
  begin
{  s6 := s[i]^;
  for j := length(s[i]^)+1 to 60 do
    s6 := s6+' ';}
  s6 := s_1[i]^;
  x := Round(Random*100000.0-50000.0)/100;
  write(Fr,x);
  write(Fs,s6);
  writeln(T1,s6,x:0:2);
  end;
Close(T1);
Close(Fr);
Close(Fs);
{freeText;}
resultFileS(S1,2,36);
resultFileR(S2,4,8);
dataFileT(S0,2,4);
dataS('Name of the text file: ',S0,0,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
dataS('Name of the string file: ',S1,xLeft,5);
dataS('Name of the numeric file: ',S2,xRight,5);
resultComment('Contents of the string file:',0,1);
resultComment('Contents of the numeric file:',0,3);
Pause;
end;
procedure STxt50Cn40(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('A text file is given. The file contains a\ table of real numbers;',0,1);
taskText('the table consists of three columns. The width of each column',0,2);
taskText('and the alignment of numbers are arbitrary. Create three binary files',0,3);
taskText('of real numbers; each file must contain numbers from the corresponding',0,4);
taskText('table column (in the same order).',0,5);
(*
*)
(*==*)
S0 := '0'+FileName(5)+tst;
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
S3 := '3'+FileName(5)+tst;
Assign(Fr1,S1);
Rewrite(Fr1);
Assign(Fr2,S2);
Rewrite(Fr2);
Assign(Fr3,S3);
Rewrite(Fr3);
Assign(T1,S0);
Rewrite(T1);
n1 := Random(10)+15;
n2 := 10 + Random(10);
n3 := Random(2);

for j := 1 to n1 do
  begin
    x1 := Round(Random*100000.0-50000.0)/100;
    x2 := Round(Random*100000.0-50000.0)/100;
    x3 := Round(Random*100000.0-50000.0)/100;
    write(Fr1,x1);
    write(Fr2,x2);
    write(Fr3,x3);
    case n3 of
    0:begin
       str(x1:0:2,s4);
       str(x2:0:2,s5);
       str(x3:0:2,s6);
       writeln(T1,s4,' ':n2-length(s4),
               s5,' ':n2-length(s5),s6,' ':n2-length(s6));
      end;
    1:writeln(T1,x1:n2:2,x2:n2:2,x3:n2:2);
    end;
  end;
Close(T1);
Close(Fr1);
Close(Fr2);
Close(Fr3);
resultFileR(S1,2,8);
resultFileR(S2,3,8);
resultFileR(S3,4,8);
dataFileT(S0,2,4);
dataS('Name of the text file: ',S0,0,1);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
dataComment('Names of the numeric files: ',7,5);
dataS('',S1,35,5);
dataS('',S2,48,5);
dataS('',S3,61,5);
resultComment('Contents of the numeric files:',0,1);
Pause;
end;
procedure STxt50Cn41(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('A text file is given. The file contains a\ table of real numbers;',0,1);
taskText('the table consists of three columns. A character-\Iseparator\i is placed',0,2);
taskText('between adjacent columns, before the first column and after the last one.',0,3);
taskText('The width of each column and the alignment of numbers are arbitrary;',0,4);
taskText('a\ character that is used as a\ separator is arbitrary too. Create a\ binary file',0,5);
taskText('of integers that contains the sum of numbers from each row of the table.',0,0);
(*
*)
(*==*)
S0 := '1'+FileName(5)+tst;
S1 := '2'+FileName(5)+tst;
Assign(Fi1,S1);
Rewrite(Fi1);
Assign(T1,S0);
Rewrite(T1);
n1 := Random(10)+15;
n2 := 10 + Random(10);
n3 := Random(2);
case Random(5) of
0 : c := '*';
1 : c := '|';
2 : c := 'I';
3 : c := '#';
4 : c := '!';
end;
for j := 1 to n1 do
  begin
    n4 := integer(Random(100))-50;
    n5 := integer(Random(100))-50;
    n6 := integer(Random(100))-50;
    n := n4+n5+n6;
    write(Fi1,n);
    case n3 of
    0:begin
       str(n4,s4);
       str(n5,s5);
        str(n6,s6);
       writeln(T1,c,' ',s4,' ':n2-length(s4),c,' ',
               s5,' ':n2-length(s5),c,' ',s6,' ':n2-length(s6),c);
      end;
    1:writeln(T1,c,n4:n2,' ',c,n5:n2,' ',c,n6:n2,' ',c);
    end;
  end;
Close(T1);
Close(Fi1);
resultFileN(S1,3,5);
dataFileT(S0,2,4);
dataS('Name of the text file: ',S0,0,1);
dataS('Name of the numeric file: ',S1,0,5);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',0,2);}
resultComment('Contents of the numeric file:',0,2);
Pause;
end;

procedure STxt50Cn42(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50Cn43(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('Given a\ text file, create a\ new binary file of characters',0,2);
taskText('that contains all punctuation marks of the text (in the same order).',0,4);
(*
*)
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
getText;
Assign(T1,S1);
Rewrite(T1);
Assign(Fc,S2);
Rewrite(Fc);
for j := 0 to Len-1 do
  begin
  writeln(T1,S[j]^);
  S0 := s[j]^;
  for j0 := 1 to length(s0) do
    if s0[j0] in Prepin then write(Fc,s0[j0]);
  end;
Close(T1);
Close(Fc);
resultFileC(S2,3,4);
dataFileT(S1,2,4);
dataS('Name of the given file: ',S1,0,1);
dataS('Name of the new file: ',S2,0,5);
resultComment('Contents of the new file:',0,2);
setNumberOfTests(9);
freeText;
Pause;
end;





procedure STxt50Cn44(Name, Key: string);
var i,j : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});
getVariant(4,3,0,0,Code,code1,code2);
case code of
1: begin
taskText('A text file is given. Create a\ new binary file of characters',0,2);
taskText('that contains all characters of the given text (without repetitions)',0,3);
taskText('including blank character and punctuation marks. The order of characters',0,4);
taskText('is determined by their first occurrence in the text.',0,5);
(*
*)
end;
2: begin
taskText('A text file is given. Create a\ new binary file of characters',0,2);
taskText('that contains all characters of the given text (without repetitions)',0,3);
taskText('including blank character and punctuation marks. The characters must be',0,4);
taskText('in ascending order of their numeric values in the character set.',0,5);
(*
*)
end;
3: begin
taskText('A text file is given. Create a\ new binary file of characters',0,2);
taskText('that contains all characters of the given text (without repetitions)',0,3);
taskText('including blank character and punctuation marks. The characters must be',0,4);
taskText('in descending order of their numeric values in the character set.',0,5);
(*
*)
end;
end;
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
for i := 1 to 255 do
  c[i] := 0;
Assign(T1,S1);
Rewrite(T1);
Assign(Fc,S2);
Rewrite(Fc);
getText;
for i := 0  to len-1 do
  begin
  writeln(T1,s[i]^);
  for j := 1 to length(s[i]^) do
    begin
      case code of
      1 : if c[ord(s[i]^[j])]=0 then
            begin
              c[ord(s[i]^[j])] := 1;
              write(Fc,s[i]^[j]);
            end;
      2,3 : c[ord(s[i]^[j])] := 1;
      end;
    end;
  end;
close(T1);
freeText;
case code of
2: for i := 1 to 255 do
     if c[i]=1 then
       begin
         c1 := chr(i);
         write(Fc,c1);
       end;
3: for i := 255 downto 1 do
     if c[i]=1 then
       begin
         c1 := chr(i);
         write(Fc,c1);
       end;
end;
Close(Fc);
resultFileC(S2,3,4);
dataFileT(S1,2,4);
dataS('Name of the given file: ',S1,0,1);
dataS('Name of the new file: ',S2,0,5);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
resultComment('Contents of the new file:',0,2);
Pause;
end;

procedure STxt50Cn45(Name, Key: string);
var i,j,i1 : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});(*DEMO*)
getVariant(5,0,0,0,Code,code1,code2);
s1 := '';
taskText('A text file is given. Find the amount of occurrences of each Latin small',0,1);
taskText('letter and create a\ new binary file of strings whose components have',0,2);
taskText('the following format: \<<a letter>\:<amount of its occurrences>\> (for example,',0,3);
taskText('\<a\:25\>). Letters that are absent in the text should not be included',0,4);
taskText('in the new file. Strings of the resulting file must be in alphabetic order.',0,5);
(*
*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
for i := 1 to 255 do
  c[i] := 0;
Assign(T1,S1);
Rewrite(T1);
Assign(Fs,S2);
Rewrite(Fs);
getText;
for i := 0  to len-1 do
  begin
  writeln(T1,s[i]^);
  for j := 1 to length(s[i]^) do
    Inc(c[ord(s[i]^[j])]);
  end;
close(T1);
freeText;
 for i := Ord('a') to Ord('z') do
     if c[i]<>0 then
       begin
         Str(c[i],s6);
         s6 := Chr(i)+'-'+s6;
         write(Fs,s6);
       end;
Close(Fs);
resultFileS(S2,3,7);
dataFileT(S1,2,4);
dataS('Name of the given file: ',S1,0,1);
dataS('Name of the new file: ',S2,0,5);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
resultComment('Contents of the new file:',0,2);
pause;
end;




procedure STxt50Cn46(Name, Key: string);
var i,j,i1 : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});
getVariant(5,0,0,0,Code,code1,code2);
s1 := '';
taskText('A text file is given. Find the amount of occurrences of each Latin small',0,1);
taskText('letter and create a\ new binary file of strings whose components have',0,2);
taskText('the following format: \<<a letter>\:<amount of its occurrences>\> (for example,',0,3);
taskText('\<a\:25\>). Letters that are absent in the text should not be included',0,4);
taskText('in the new file. Strings of the new file must be in descending order',0,5);
taskText('of the amount of letter occurrences; if some letters have the equal amount',0,0);
taskText('of occurrences then the corresponding strings must be in alphabetic order.',0,0);
(*
*)
(*==*)
S1 := '1'+FileName(5)+tst;
S2 := '2'+FileName(5)+tst;
for i := 1 to 255 do
  c[i] := 0;
Assign(T1,S1);
Rewrite(T1);
Assign(Fs,S2);
Rewrite(Fs);
getText;
for i := 0  to len-1 do
  begin
  writeln(T1,s[i]^);
  for j := 1 to length(s[i]^) do
    Inc(c[ord(s[i]^[j])]);
  end;
close(T1);
freeText;
 for j := Ord('a') to Ord('z') do
     begin
       n1 := 0; i1 := 0;
       for i := Ord('a') to Ord('z') do
         if c[i]>n1 then
           begin
             n1 := c[i]; i1 := i;
           end;
       if n1 = 0 then break
       else
         begin
           Str(c[i1],s6);
           s6 := Chr(i1)+'-'+s6;
           write(Fs,s6);
           c[i1] := 0;
         end;
     end;
Close(Fs);
resultFileS(S2,3,7);
dataFileT(S1,2,4);
dataS('Name of the given file: ',S1,0,1);
dataS('Name of the new file:',S2,0,5);
{dataComment('—Ó‰ÂÊËÏÓÂ ÚÂÍÒÚÓ‚Ó„Ó Ù‡ÈÎ‡:',xRight,1);}
resultComment('Contents of the new file:',0,2);
Pause;
end;



procedure STxt50Cn47(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j,i1 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('A string~{S} that consists of 10~digits and a\ text file that contains',0,1);
taskText('an English text are given. Encrypt the file using the right cyclic shift',0,2);
taskText('of any letter by S_{K~mod~10~+~1} positions of the English alphabet, where~{K}',0,3);
taskText('is the line position of the letter, characters~{S}_{N} of the given string~{S}',0,4);
taskText('are numbered beginning with~1, and \<mod\> denotes the operator of taking',0,5);
taskText('the remainder after integer division. For instance, letters that are placed',0,0);
taskText('in the line positions~1, 11, 21,~\. are shifted by~{S}_{1} positions of alphabet,',0,0);
taskText('letters that are placed in the line positions~2, 12, 22,~\. are shifted',0,0);
taskText('by~{S}_{2} positions of alphabet, and so\ on). Do not change',0,0);
taskText('blank characters and punctuation marks.',0,0);
(*
*)
(*==*)
S2 := FileName(6)+tst;
S1 := FileName(5)+tst;
s0 := '';
for i := 1 to 10 do
  s0 := s0 + chr(random(9)+49);
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
getText;
for i := 0  to len-1 do
  begin
  writeln(T1,s[i]^);
  for j := 1 to length(s[i]^) do
  begin
    n0 :=Ord(s0[(j-1) mod 10 + 1])-48;
    if Pos(s[i]^[j],c1)<>0 then
      s[i]^[j] := c1[(Pos(s[i]^[j],c1)+n0-1) mod 26 + 1]
    else
      if Pos(s[i]^[j],c2)<>0 then
        s[i]^[j] := c2[(Pos(s[i]^[j],c2)+n0-1) mod 26 + 1];
  end;
  writeln(T2,s[i]^);
  end;
close(T1);
close(T2);
freeText;
resultFileT(S2,1,5);
Rename(T1,S2);
dataFileT(S2,2,5);
dataS('S = ',S0,xLeft,1);
dataS('File name: ',S2,xRight,1);
{dataComment('—Ó‰ÂÊËÏÓÂ Ù‡ÈÎ‡:',56,1);}
{resultComment('ÕÓ‚ÓÂ ÒÓ‰ÂÊËÏÓÂ Ù‡ÈÎ‡:',0,1);}
Pause;
end;
procedure STxt50Cn48(Name, Key: string);
const c1 : string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      c2 : string = 'abcdefghijklmnopqrstuvwxyz';
var i,j,i1 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('A string and a\ text file are given. The file contains an encrypted',0,1);
taskText('English text (the method of encryption is described in \1),',0,2);
taskText('the string is the first decrypted line of the given text. Decrypt the file;',0,3);
taskText('if the given information is insufficient for decryption',0,4);
taskText('then do not change the given file.',0,5);
(*





*)
(*==*)
S2 := FileName(3)+tst;
S1 := FileName(4)+tst;
s0 := '';
for i := 1 to 10 do
  s0 := s0 + chr(random(9)+49);
Assign(T1,S1);
Rewrite(T1);
Assign(T2,S2);
Rewrite(T2);
getText;
s3 := s[0]^;
s6 := '          ';
for i := 1 to length(s3) do
  if s3[i] in ['A'..'Z','a'..'z'] then s6[(i-1)mod 10 + 1]:= '*';
bln := Pos(' ',s6)=0;
for i := 0  to len-1 do
  begin
  s4 := s[i]^;
    for j := 1 to length(s[i]^) do
    begin
      n0 :=Ord(s0[(j-1) mod 10 + 1])-48;
      if Pos(s[i]^[j],c1)<>0 then
        s[i]^[j] := c1[(Pos(s[i]^[j],c1)+n0-1) mod 26 + 1]
      else
        if Pos(s[i]^[j],c2)<>0 then
          s[i]^[j] := c2[(Pos(s[i]^[j],c2)+n0-1) mod 26 + 1];
    end;
  if bln then
    writeln(T2,s4)
  else
    writeln(T2,s[i]^);
  writeln(T1,s[i]^);
  end;
close(T1);
close(T2);
freeText;
resultFileT(S2,1,5);
Rename(T1,S2);
dataFileT(S2,2,5);
dataS('',S3,6,1);
dataS('File name: ',S2,59,1);
Pause;
end;


procedure STxt50Cn49(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('‘Œ–Ã”À»–Œ¬ ¿ «¿ƒ¿Õ»ﬂ', 0, 3);
(*
*)
  DataS('', '»—’ŒƒÕ€≈ ƒ¿ÕÕ€≈', 0, 3);
  ResultS('', '–≈«”À‹“»–”ﬁŸ»≈ ƒ¿ÕÕ€≈', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure STxt50Cn50(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 66{level});
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
Topic := 'TEXT FILES';
Topic1 := 'TEXT FILES: BASIC OPERATIONS';
Topic2 := 'TEXT ANALYSIS AND FORMATTING';
Topic3 := 'TEXT FILES WITH NUMERIC DATA';
Topic4 := 'TEXT FILES: ADDITIONAL TASKS';
{Author := 'M.~E.~Abramyan, 2002';}
end.
