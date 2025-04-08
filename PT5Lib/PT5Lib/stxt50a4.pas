{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit STxt50A4;

{$MODE Delphi}

interface

procedure STxt50An1(Name, Key: string);
procedure STxt50An2(Name, Key: string);
procedure STxt50An3(Name, Key: string);
procedure STxt50An4(Name, Key: string);
procedure STxt50An5(Name, Key: string);
procedure STxt50An6(Name, Key: string);
procedure STxt50An7(Name, Key: string);
procedure STxt50An8(Name, Key: string);
procedure STxt50An9(Name, Key: string);
procedure STxt50An10(Name, Key: string);
procedure STxt50An11(Name, Key: string);
procedure STxt50An12(Name, Key: string);
procedure STxt50An13(Name, Key: string);
procedure STxt50An14(Name, Key: string);
procedure STxt50An15(Name, Key: string);
procedure STxt50An16(Name, Key: string);
procedure STxt50An17(Name, Key: string);
procedure STxt50An18(Name, Key: string);
procedure STxt50An19(Name, Key: string);
procedure STxt50An20(Name, Key: string);
procedure STxt50An21(Name, Key: string);
procedure STxt50An22(Name, Key: string);
procedure STxt50An23(Name, Key: string);
procedure STxt50An24(Name, Key: string);
procedure STxt50An25(Name, Key: string);
procedure STxt50An26(Name, Key: string);
procedure STxt50An27(Name, Key: string);
procedure STxt50An28(Name, Key: string);
procedure STxt50An29(Name, Key: string);
procedure STxt50An30(Name, Key: string);
procedure STxt50An31(Name, Key: string);
procedure STxt50An32(Name, Key: string);
procedure STxt50An33(Name, Key: string);
procedure STxt50An34(Name, Key: string);
procedure STxt50An35(Name, Key: string);
procedure STxt50An36(Name, Key: string);
procedure STxt50An37(Name, Key: string);
procedure STxt50An38(Name, Key: string);
procedure STxt50An39(Name, Key: string);
procedure STxt50An40(Name, Key: string);
procedure STxt50An41(Name, Key: string);
procedure STxt50An42(Name, Key: string);
procedure STxt50An43(Name, Key: string);
procedure STxt50An44(Name, Key: string);
procedure STxt50An45(Name, Key: string);
procedure STxt50An46(Name, Key: string);
procedure STxt50An47(Name, Key: string);
procedure STxt50An48(Name, Key: string);
procedure STxt50An49(Name, Key: string);
procedure STxt50An50(Name, Key: string);

implementation

uses PT5TaskMaker, PT4Dat_ru;



const Prepin = ['.','(',')',',',';',':','?','!','-','"'];
type string80 = string[80];
     pstring80 = ^string80;
     ar80 = array [0..100] of pString80;
var code, code1, code2, code3 : byte;
    s : array[0..29] of pString50;
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

procedure STxt50An1(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j : integer;
begin
  Start(Name, Topic1, Author, Key, 66{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дано имя файла и\ целые положительные числа~{N} и~{K}.', 0, 2);
  TaskText('Создать текстовый файл с\ указанным именем и\ записать в\ него {N}~строк,', 0, 3);
  TaskText('каждая из\ которых состоит из\ {K}~символов~\<*\> (звездочка).', 0, 4);
(*
*)
S2 := FileName(8) + tst;
N := 1 + Random(26);
K := 1 + Random(10);
dataS('Имя файла: ',S2,0,2);
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
resultComment('Содержимое файла:',0,1);
resultFileT(S2,2,5);
SetNumberOfTests(5);
Pause;
end;

procedure STxt50An2(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,j : integer;
begin
  Start(Name, Topic1, Author, Key, 66{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
  case v1 of
  1:begin
  TaskText('Дано имя файла и\ целое число~{N} (0~<~{N}~<~27). Создать текстовый файл', 0, 1);
  TaskText('с\ указанным именем и\ записать в\ него {N}~строк: первая строка', 0, 2);
  TaskText('должна содержать \Iстрочную\i (т.\,е. маленькую) латинскую букву~\<a\>,', 0, 3);
  TaskText('вторая\ \= буквы~\<ab\>, третья\ \= буквы \<abc\> и\ т.\,д.; последняя строка', 0, 4);
  TaskText('должна содержать {N}~начальных строчных латинских букв в\ алфавитном порядке.', 0, 5);
(*
*)
  end;
  2:begin
  TaskText('Дано имя файла и\ целое число~{N} (0~<~{N}~<~27). Создать текстовый файл', 0, 1);
  TaskText('с\ указанным именем и\ записать в\ него {N}~строк длины~{N}; строка с\ номером~{K}', 0, 2);
  TaskText('({K}~=~1,\,\.,\,{N}) должна содержать {K}~начальных \Iпрописных\i (т.\,е. заглавных)', 0, 3);
  TaskText('латинских букв, дополненных справа символами~\<*\> (звездочка). Например,', 0, 4);
  TaskText('для\ {N}~=~4 файл должен содержать строки~\<A***\>, \<AB**\>, \<ABC*\>,~\<ABCD\>.', 0, 5);
(*
*)
  end;
  end;
(*==*)
S2 := FileName(8) + tst;
N := 1 + Random(26);
K := 1 + Random(10);
dataS('Имя файла: ',S2,0,2);
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
resultComment('Содержимое файла:',0,1);
resultFileT(S2,2,5);
SetNumberOfTests(5);
Pause;
end;



procedure STxt50An3(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Дан текстовый файл. Вывести количество содержащихся в\ нем символов и\ строк',0,2);
taskText('(маркеры концов строк~EOLN и\ конца файла~EOF',0,3);
taskText('при\ подсчете количества символов не\ учитывать).',0,4);
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
dataS('Имя файла: ',S1,0,1);
resultN('Количество символов: ',n1,0,2,3);
resultN('Количество строк:    ',n2,28,4,3);
setNumberOfTests(3);
freeText;
pause;
end;

procedure STxt50An4(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(1,4,0,0,Code,code1,code2);
case code of
1: begin
taskText('Дана строка~{S} и\ текстовый файл.',0,2);
taskText('Добавить строку~{S} в\ конец файла.',0,4);
(*
*)
end;
2:
begin
taskText('Даны два текстовых файла.',0,2);
taskText('Добавить в\ конец первого файла содержимое второго файла.',0,4);
(*
*)
end;
3: begin
taskText('Дана строка~{S} и\ текстовый файл.',0,2);
taskText('Добавить строку~{S} в\ начало файла.',0,4);
(*
*)
end;
4:
begin
taskText('Даны два текстовых файла.',0,2);
taskText('Добавить в\ начало первого файла содержимое второго файла.',0,4);
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
dataS('Имя файла: ',S1,59,1);
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
dataS('Имя первого файла: ',S3,xLeft,1);
dataS('Имя второго файла: ',S2,xRight,1);
resultComment('Новое содержимое первого файла:',0,1);
end;
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50An5(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Дано целое число~{K} и\ текстовый файл.',0,2);
taskText('Вставить пустую строку перед строкой файла с\ номером~{K}.',0,3);
taskText('Если строки с\ таким номером нет, то\ оставить файл без\ изменений.',0,4);
(*
*)
end;
2: begin
taskText('Дано целое число~{K} и\ текстовый файл.',0,2);
taskText('Вставить пустую строку после строки файла с\ номером~{K}.',0,3);
taskText('Если строки с\ таким номером нет, то\ оставить файл без\ изменений.',0,4);
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
dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50An6(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Дан текстовый файл. Продублировать в\ нем все\ пустые строки.',0,3);
(*
*)
end;
2:
begin
taskText('Дана строка~{S} и\ текстовый файл.',0,2);
taskText('Заменить в\ файле все пустые строки на\ строку~{S}.',0,4);
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
     dataS('Имя файла: ',S1,0,1);
   end;
2: begin
     dataS('S = ',S0,2,1);
     dataS('Имя файла: ',S1,57,1);
   end;
end;
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50An7(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(2,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Дан непустой текстовый файл.',0,2);
taskText('Удалить из\ него первую строку.',0,4);
(*
*)
end;
2: begin
taskText('Дан непустой текстовый файл.',0,2);
taskText('Удалить из\ него последнюю строку.',0,4);
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
dataS('Имя файла: ',S1,{57}0,1);
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50An8(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Дано целое число~{K} и\ текстовый файл.',0,2);
taskText('Удалить из\ файла строку с\ номером~{K}.',0,3);
taskText('Если строки с\ таким номером нет, то\ оставить файл без\ изменений.',0,4);
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
dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50An9(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Дан текстовый файл.',0,2);
taskText('Удалить из\ него все пустые строки.',0,4);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;



procedure STxt50An10(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Даны два текстовых файла.',0,1);
taskText('Добавить в\ конец каждой строки первого файла',0,2);
taskText('соответствующую строку второго файла.',0,3);
taskText('Если второй файл короче первого,',0,4);
taskText('то\ оставшиеся строки первого файла не\ изменять.',0,5);
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
resultComment('Новое содержимое первого файла:',0,1);
resultFileT(S1,2,5);
Rename(T2,S1);
dataFileT(S1,2,3);
dataFileT(S3,4,5);
dataS('Имя первого файла: ',S1,xLeft,1);
dataS('Имя второго файла: ',S3,xRight,1);
setNumberOfTests(5);
Pause;
end;

procedure STxt50An11(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Дано целое число~{K} и\ текстовый файл.',0,2);
taskText('Удалить из\ каждой строки файла первые {K}~символов',0,3);
taskText('(если\ длина строки меньше~{K}, то\ удалить из\ нее все\ символы).',0,4);
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
dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(3);
freeText;
Pause;
end;


procedure STxt50An12(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i,j,j0 : integer;
    s3 : array [0..9] of string;
begin
start(Name,Topic1,Author,Key,66{level});
getVariant(4,2,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Дан текстовый файл. Заменить в\ нем все прописные русские буквы',0,2);
taskText('на\ строчные, а\ все строчные\ \= на\ прописные.',0,4);
(*
*)
end;
2:begin
taskText('Дан текстовый файл.',0,2);
taskText('Заменить в\ нем все подряд идущие пробелы на\ один пробел.',0,4);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(5);
freeText;
Pause;
end;




procedure STxt50An13(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});(*DEMO*)
taskText('Дан текстовый файл, содержащий более трех строк.',0,2);
taskText('Удалить из\ него последние три\ строки.',0,4);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50An14(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Дано целое число~{K} (0~<~{K}~<~10)',0,2);
taskText('и\ текстовый файл, содержащий более\ {K}~строк.',0,3);
taskText('Удалить из\ файла последние {K}~строк.',0,4);
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
     dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(3);
freeText;
Pause;
end;


procedure STxt50An15(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic1,Author,Key,66{level});
taskText('Дано целое число~{K} (0~<~{K}~<~10)',0,2);
taskText('и\ текстовый файл, содержащий более\ {K}~строк. Создать новый текстовый файл,',0,3);
taskText('содержащий {K}~последних строк исходного файла.',0,4);
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
dataS('Имя исходного файла: ',S1,10,1);
dataS('Имя файла результатов: ',S2,45,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50An16(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50An17(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
taskText('Дан текстовый файл.',0,2);
taskText('Найти количество абзацев в\ тексте, если абзацы отделяются',0,3);
taskText('друг от\ друга одной или\ несколькими пустыми строками.',0,4);
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
dataS('Имя файла: ',S1,0,1);
resultN('',n1,0,3,2);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50An18(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дано целое число~{K} и\ текстовый файл. Удалить из\ файла абзац с\ номером~{K}',0,2);
taskText('(абзацы отделяются друг от\ друга одной или\ несколькими пустыми строками).',0,3);
taskText('Пустые строки, предшествующие и\ следующие за\ удаляемым абзацем, не\ удалять.',0,4);
taskText('Если абзац с\ данным номером отсутствует, то\ оставить файл без\ изменений.',0,5);
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
dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50An19(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дан текстовый файл. Найти количество абзацев в\ тексте,',0,2);
taskText('если первая строка каждого абзаца начинается с\ 5~пробелов (\<\Iкрасная строка\i\>).',0,3);
taskText('Пустые строки между абзацами не\ учитывать.',0,4);
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
dataS('Имя файла: ',S1,0,1);
resultN('',n1,0,3,2);
setNumberOfTests(5);
freeText;
Pause;
end;


procedure STxt50An20(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дано целое число~{K} и\ текстовый файл. Удалить из\ файла абзац с\ номером~{K}',0,2);
taskText('(абзацы выделяются с\ помощью \Iкрасной строки\i\ \= см.\ задание \1).',0,3);
taskText('Пустые строки между абзацами не\ учитывать и\ не\ удалять.',0,4);
taskText('Если абзац с\ данным номером отсутствует, то\ оставить файл без\ изменений.',0,5);
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
dataS('Имя файла: ',S1,xRight,1);
setNumberOfTests(5);
freeText;
Pause;
end;


procedure STxt50An21(Name, Key: string);
var i,j,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дан текстовый файл. Абзацы выделяются в\ нем',0,2);
taskText('с\ помощью \Iкрасной строки\i (см.\ задание \2), а\ пустых строк нет.',0,3);
taskText('Вставить между соседними абзацами по\ одной пустой строке',0,4);
taskText('(в\ начало и\ конец файла пустые строки не\ добавлять).',0,5);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(3);
freeText;
Pause;
end;

procedure STxt50An22(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50An23(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(7,2,0,0,code,code1,code2);
case Code of
1 :
begin
taskText('Дан текстовый файл. Вывести первое слово текста наибольшей длины.',0,2);
taskText('\IСловом\i считать набор символов, не\ содержащий пробелов',0,3);
taskText('и\ ограниченный пробелами или\ началом/концом строки.',0,4);
(*
*)
end;
2 : begin
taskText('Дан текстовый файл. Вывести последнее слово текста наименьшей длины.',0,2);
taskText('\IСловом\i считать набор символов, не\ содержащий пробелов',0,3);
taskText('и\ ограниченный пробелами или\ началом/концом строки.',0,4);
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
dataS('Имя файла: ',S1,0,1);
resultS('',s0,0,3);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50An24(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дано целое число~{K} и\ текстовый файл. Создать строковый файл и\ записать в\ него',0,1);
taskText('все\ слова длины~{K} из\ исходного файла. \IСловом\i считать набор символов,',0,2);
taskText('не\ содержащий пробелов, знаков препинания и\ ограниченный пробелами,',0,3);
taskText('знаками препинания или\ началом/концом строки. Если исходный файл',0,4);
taskText('не\ содержит слов длины~{K}, то\ оставить результирующий файл пустым.',0,5);
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
dataS('Имя текстового файла: ',S1,xRight,1);
dataS('Имя строкового файла: ',S2,0,5);
resultComment('Содержимое строкового файла:',0,2);
setNumberOfTests(5);
freeText;
Pause;
end;
procedure STxt50An25(Name, Key: string);
const c3 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i,j,j0,j1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1 : begin
    s1 := '';
    s2 := '';
taskText('Дан символ~{C}\ \= \Iпрописная\i (заглавная) русская буква и\ текстовый файл. Создать',0,1);
taskText('строковый файл и\ записать в\ него все\ слова из\ исходного файла, начинающиеся',0,2);
taskText('на\ эту букву (прописную или\ строчную). \IСловом\i считать набор символов,',0,3);
taskText('не\ содержащий пробелов, знаков препинания и\ ограниченный пробелами,',0,4);
taskText('знаками препинания или\ началом/концом строки. Если исходный файл',0,5);
taskText('не\ содержит подходящих слов, то\ оставить результирующий файл пустым.',0,0);
(*
*)
    end;
2 : begin
    s1 := ' ';
    s2 := '';
taskText('Дан символ~{C}\ \= \Iстрочная\i (маленькая) русская буква и\ текстовый файл. Создать',0,1);
taskText('строковый файл и записать в него все\ слова из\ исходного файла, содержащие',0,2);
taskText('хотя\ бы одну букву~{C} (прописную или\ строчную). \IСловом\i считать набор символов,',0,3);
taskText('не\ содержащий пробелов, знаков препинания и\ ограниченный пробелами,',0,4);
taskText('знаками препинания или\ началом/концом строки. Если исходный файл',0,5);
taskText('не\ содержит подходящих слов, то\ оставить результирующий файл пустым.',0,0);
(*
*)
    end;
end;
(*==*)
S1 := '1'+FileName(4)+tst;
S2 := '2'+FileName(4)+tst;
j1 := 1;
getText;
n := 1 + random(32);
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
dataS('Имя текстового файла: ',S1,xRight,1);
dataS('Имя строкового файла: ',S2,0,5);
resultComment('Содержимое строкового файла:',0,2);
setNumberOfTests(5);
freeText;
Pause;
end;

procedure STxt50An26(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50An27(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
getVariant(5,0,0,0,Code,code1,code2);
taskText('Дан текстовый файл, содержащий текст, выровненный по\ левому краю.',0,2);
taskText('Выровнять текст по\ правому краю, добавив в\ начало каждой непустой строки',0,3);
taskText('нужное количество пробелов (ширину текста считать равной~50).',0,4);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(5);
freeText;
pause;
end;


procedure STxt50An28(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(5,2,0,0,Code,code1,code2);
case code of
1: begin
taskText('Дан текстовый файл, содержащий текст, выровненный по\ левому краю.',0,2);
taskText('Выровнять текст по\ центру, добавив в\ начало каждой непустой строки',0,3);
taskText('нужное количество пробелов (ширину текста считать равной~50).',0,4);
taskText('Строки нечетной длины перед центрированием дополнять слева пробелом.',0,5);
(*
*)
end;
2: begin
taskText('Дан текстовый файл, содержащий текст, выровненный по\ правому краю.',0,2);
taskText('Выровнять текст по\ центру, удалив из\ каждой непустой строки',0,3);
taskText('половину начальных пробелов. В\ строках с\ нечетным количеством начальных',0,4);
taskText('пробелов перед центрированием удалять первый начальный пробел.',0,5);
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
dataS('Имя файла: ',S1,0,1);
setNumberOfTests(5);
freeText;
Pause;
end;



procedure STxt50An29(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
taskText('Дан текстовый файл, содержащий текст, выровненный по\ левому краю.',0,1);
taskText('Абзацы текста разделяются одной пустой строкой. Выровнять текст \Iпо\ ширине\i',0,2);
taskText('(т.\,е. и\ по\ левому, и\ по\ правому краю), увеличив в\ каждой непустой строке',0,3);
taskText('(кроме последних строк абзацев) количество пробелов между словами,',0,4);
taskText('начиная с\ последнего пробела в\ строке (ширину текста считать равной~50).',0,5);
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
dataS('Имя файла: ',S1,0,1);
Pause;
end;

procedure STxt50An30(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});(*DEMO*)
getVariant(7,0,0,0,Code,code1,code2);
taskText('Дано целое число~{K} (>\,25) и\ текстовый файл, содержащий текст, выровненный',0,1);
taskText('по\ левому краю. Абзацы текста отделяются друг от\ друга одной пустой строкой.',0,2);
taskText('Отформатировать текст так, чтобы его\ ширина не\ превосходила {K}~позиций,',0,3);
taskText('и\ выровнять текст по\ левому краю, сохранив деление на\ абзацы. Пробелы в\ конце',0,4);
taskText('строк удалить. Сохранить отформатированный текст в\ новом текстовом файле.',0,5);
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
dataS('Имя исходного файла: ',S1,xRight,1);
{dataComment('Содержимое исходного файла:',50,1);}
dataS('Имя файла результатов: ',S2,0,5);
{resultComment('Содержимое файла результатов:',0,1);}
Pause;
end;
procedure STxt50An31(Name, Key: string);
var i,j,i1 : integer;
begin
start(Name,Topic2,Author,Key,66{level});
getVariant(7,0,0,0,Code,code1,code2);
taskText('Дано целое число~{K} (>\,25) и\ текстовый файл, содержащий текст, выровненный',0,1);
taskText('по\ левому краю. Абзацы выделяются в\ нем с\ помощью \Iкрасной строки\i',0,2);
taskText('(5~начальных пробелов), а\ пустых строк нет. Отформатировать текст так, чтобы',0,3);
taskText('его\ ширина не\ превосходила {K}~позиций, и\ выровнять текст по\ левому краю,',0,4);
taskText('сохранив деление на\ абзацы. Пробелы в\ конце строк удалить. Сохранить',0,5);
taskText('отформатированный текст в\ новом текстовом файле.',0,0);
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
dataS('Имя исходного файла: ',S1,xRight,1);
{dataComment('Содержимое исходного файла:',50,1);}
dataS('Имя файла результатов: ',S2,0,5);
{resultComment('Содержимое файла результатов:',0,1);}
Pause;
end;

procedure STxt50An32(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50An33(Name, Key: string);
var i,i1,i2,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(2,2,0,0,Code,code1,code2);
case code of
1: begin
taskText('Даны два файла целых чисел одинакового размера. Создать текстовый файл,',0,1);
taskText('содержащий эти\ числа, расположенные в\ два столбца шириной по\ 30~символов',0,2);
taskText('(в\ первом столбце содержатся числа из\ первого исходного файла, во\ втором\ \=',0,3);
taskText('из\ второго файла). В\ начало и\ конец каждой строки текстового файла добавить',0,4);
taskText('разделитель~\<|\> (код~124). Числа выравниваются по\ правому краю столбца.',0,5);
(*
*)
end;
2: begin
taskText('Даны три файла целых чисел одинакового размера. Создать текстовый файл,',0,1);
taskText('содержащий эти\ числа, расположенные в\ три столбца шириной по\ 20~символов',0,2);
taskText('(в каждом столбце содержатся числа из соответствующего исходного файла).',0,3);
taskText('В\ начало и\ конец каждой строки текстового файла добавить разделитель~\<|\>',0,4);
taskText('(код~124). Числа выравниваются по\ левому краю столбца.',0,5);
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
dataComment('Имена исходных файлов:',16,2);
dataS('',S1,39,2);
{dataComment('Содержимое первого файла:',xRight,1);}
dataS('',S2,52,2);
{dataComment('Содержимое второго файла:',xRight,3);}
dataS('Имя файла результатов: ',S0,0,5);
end;
2:begin
dataFileN(S1,2,5);
dataFileN(S2,3,5);
dataFileN(S3,4,5);
dataComment('Имена исходных файлов:',10,1);
dataS('',S1,33,1);
{dataComment('Содержимое первого файла:',xRight,1);}
dataS('',S2,46,1);
dataS('',S3,59,1);
{dataComment('Содержимое второго файла:',xRight,3);}
dataS('Имя файла результатов: ',S0,0,5);
end;
end;
Pause;
end;

procedure STxt50An34(Name, Key: string);
var i,j,i1 : integer;
    a,b : real;
begin
start(Name,Topic3,Author,Key,66{level});(*DEMO*)
getVariant(3,0,0,0,Code,code1,code2);
taskText('Даны вещественные числа~{A}, {B} и\ целое число~{N}. Создать текстовый файл,',0,1);
taskText('содержащий таблицу значений функции~\R{x}\r на\ промежутке~[{A},\,{B}]',0,2);
taskText('с\ шагом ({B}\,\-\,{A})/{N}. Таблица состоит из\ двух столбцов: с\ аргументами~{x}',0,3);
taskText('(10~позиций, из\ них\ 4\ под\ дробную часть) и\ со\ значениями~\R{x}\r (15~позиций,',0,4);
taskText('из\ них\ 8\ под\ дробную часть). Столбцы выравниваются по\ правому краю.',0,5);
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
{resultComment('Содержимое файла результатов:',0,1);}
dataR('A = ',a,xleft,2,4);
dataR('B = ',b,xright,2,4);
dataN('N = ',n,0,3,2);
dataS('Имя файла результатов: ',S1,0,4);
pause;
end;


procedure STxt50An35(Name, Key: string);
var i,j,i1 : integer;
    a,b : real;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(3,0,0,0,Code,code1,code2);
taskText('Даны вещественные числа~{A}, {B} и\ целое число~{N}. Создать текстовый файл,',0,1);
taskText('содержащий таблицу значений функций~sin({x}) и~cos({x}) на\ промежутке~[{A},\,{B}]',0,2);
taskText('с\ шагом ({B}\,\-\,{A})/{N}. Таблица состоит из\ трех столбцов: с\ аргументами~{x} (8~позиций,',0,3);
taskText('из\ них\ 4\ под\ дробную часть) и\ со\ значениями sin({x}) и~cos({x}) (по 12~позиций,',0,4);
taskText('из\ них\ 8\ под\ дробную часть). Столбцы выравниваются по\ правому краю.',0,5);
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
{resultComment('Содержимое файла результатов:',0,1);}
dataR('A = ',a,xleft,2,4);
dataR('B = ',b,xright,2,4);
dataN('N = ',n,0,3,2);
dataS('Имя файла результатов: ',S1,0,4);
Pause;
end;


procedure STxt50An36(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});(*DEMO*)
taskText('Дан текстовый файл, каждая строка которого изображает',0,2);
taskText('целое число, дополненное слева и\ справа несколькими пробелами.',0,3);
taskText('Вывести количество этих чисел и\ их\ сумму.',0,4);
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
dataS('Имя файла: ',S1,0,1);
resultN('Количество чисел:',n3,0,2,5);
resultN('Сумма чисел:     ',n1,0,4,5);
Pause;
end;

procedure STxt50An37(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
getVariant(9,4,0,0,Code,code1,code2);
case code of
1:
begin
taskText('Дан текстовый файл, каждая строка которого изображает целое',0,2);
taskText('или\ вещественное число, дополненное слева и\ справа несколькими пробелами',0,3);
taskText('(вещественные числа имеют ненулевую дробную часть).',0,4);
taskText('Вывести количество чисел с\ ненулевой дробной частью и\ их\ сумму.',0,5);
(*
*)
end;
2: begin
taskText('Дан текстовый файл, каждая строка которого содержит изображения',0,1);
taskText('нескольких чисел, разделенные пробелами (вещественные числа имеют',0,2);
taskText('ненулевую дробную часть). Создать файл вещественных чисел, содержащий',0,3);
taskText('(в том же порядке) все\ числа из\ исходного файла,',0,4);
taskText('имеющие ненулевую дробную часть.',0,5);
(*
*)
end;
3: begin
taskText('Дан текстовый файл, каждая строка которого изображает целое',0,2);
taskText('или\ вещественное число, дополненное слева и\ справа несколькими пробелами',0,3);
taskText('(вещественные числа имеют ненулевую дробную часть).',0,4);
taskText('Вывести количество целых чисел и\ их\ сумму.',0,5);
(*
*)
end;
4: begin
taskText('Дан текстовый файл, каждая строка которого содержит изображения',0,2);
taskText('нескольких чисел, разделенные пробелами (вещественные числа имеют',0,3);
taskText('ненулевую дробную часть). Создать файл целых чисел, содержащий',0,4);
taskText('все\ целые числа из\ исходного файла (в том же порядке).',0,5);
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
dataS('Имя файла: ',S1,0,1);
case code of
1: begin
     resultN('Количество чисел с ненулевой дробной частью: ',n4,0,2,5);
     resultR('Сумма чисел с ненулевой дробной частью: ',x1,0,4,10);
   end;
3: begin
     resultN('Количество целых чисел: ',n3,0,2,5);
     resultN('Сумма целых чисел:      ',n1,0,4,5);
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
dataS('Имя текстового файла: ',S1,0,1);
dataS('Имя числового файла: ',S2,0,5);
resultComment('Содержимое числового файла:',0,2);
end;
end;
Pause;
end;



procedure STxt50An38(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,66{level});
taskText('Дан текстовый файл и\ файл целых чисел.',0,1);
taskText('Добавить в\ конец каждой строки текстового файла',0,2);
taskText('изображение соответствующего числа из\ файла целых чисел.',0,3);
taskText('Если файл целых чисел короче текстового файла,',0,4);
taskText('то\ оставшиеся строки текстового файла не\ изменять.',0,5);
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
resultComment('Новое содержимое текстового файла:',0,1);
resultFileT(S3,2,5);
Rename(T1,S3);
dataFileT(S3,2,4);
dataFileN(S2,5,5);
dataS('Имя текстового файла: ',S3,xLeft,1);
dataS('Имя числового файла: ',S2,xRight,1);
Pause;
end;
procedure STxt50An39(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('Дан текстовый файл. В\ каждой его\ строке первые 30~позиций',0,1);
taskText('отводятся под\ текст, а\ оставшаяся часть\ \= под\ вещественное число.',0,2);
taskText('Создать два\ файла: строковый файл, содержащий текстовую',0,3);
taskText('часть исходного файла, и\ файл вещественных чисел,',0,4);
taskText('содержащий числа из\ исходного файла (в\ том\ же порядке).',0,5);
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
dataS('Имя текстового файла: ',S0,0,1);
{dataComment('Содержимое текстового файла:',xRight,1);}
dataS('Имя строкового файла: ',S1,xLeft,5);
dataS('Имя числового файла: ',S2,xRight,5);
resultComment('Содержимое строкового файла:',0,1);
resultComment('Содержимое числового файла:',0,3);
Pause;
end;
procedure STxt50An40(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('Дан текстовый файл, содержащий таблицу из трех столбцов вещественных чисел.',0,1);
taskText('Ширина столбцов таблицы и способ их выравнивания являются произвольными,',0,2);
taskText('специальных символов-разделителей таблица не содержит.',0,3);
taskText('Создать три файла вещественных чисел, каждый из которых',0,4);
taskText('содержит числа из соответствующего столбца таблицы (в\ том\ же порядке).',0,5);
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
dataS('Имя текстового файла: ',S0,0,1);
{dataComment('Содержимое текстового файла:',xRight,1);}
dataComment('Имена числовых файлов: ',9,5);
dataS('',S1,32,5);
dataS('',S2,45,5);
dataS('',S3,58,5);
resultComment('Содержимое числовых файлов:',0,1);
Pause;
end;
procedure STxt50An41(Name, Key: string);
var i,j : integer;

begin
start(Name,Topic3,Author,Key,66{level});
taskText('Дан текстовый файл, содержащий таблицу из трех столбцов целых чисел.',0,1);
taskText('В\ начале и\ в\ конце каждой строки таблицы, а\ также между ее\ столбцами',0,2);
taskText('располагается \Iсимвол-разделитель\i. Ширина столбцов таблицы, способ',0,3);
taskText('их\ выравнивания и\ вид символа-разделителя являются произвольными. Создать',0,4);
taskText('файл целых чисел, содержащий сумму чисел из\ каждой строки исходной таблицы.',0,5);
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
dataS('Имя текстового файла: ',S0,0,1);
dataS('Имя числового файла: ',S1,0,5);
{dataComment('Содержимое текстового файла:',0,2);}
resultComment('Содержимое числового файла:',0,2);
Pause;
end;

procedure STxt50An42(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure STxt50An43(Name, Key: string);
var i,j,j0 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('Дан текстовый файл.',0,2);
taskText('Создать символьный файл, содержащий все знаки препинания,',0,3);
taskText('встретившиеся в\ текстовом файле (в\ том\ же порядке).',0,4);
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
dataS('Имя текстового файла: ',S1,0,1);
dataS('Имя символьного файла: ',S2,0,5);
resultComment('Содержимое символьного файла:',0,2);
setNumberOfTests(9);
freeText;
Pause;
end;





procedure STxt50An44(Name, Key: string);
var i,j : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});
getVariant(4,3,0,0,Code,code1,code2);
case code of
1: begin
taskText('Дан текстовый файл. Создать символьный файл, содержащий все\ символы,',0,2);
taskText('встретившиеся в\ тексте, включая пробел и\ знаки препинания (без\ повторений).',0,3);
taskText('Символы располагать в\ порядке их\ первого появления в\ тексте.',0,4);
(*
*)
end;
2: begin
taskText('Дан текстовый файл. Создать символьный файл, содержащий все\ символы,',0,2);
taskText('встретившиеся в\ тексте, включая пробел и\ знаки препинания (без\ повторений).',0,3);
taskText('Символы располагать в\ порядке возрастания их\ кодов.',0,4);
(*
*)
end;
3: begin
taskText('Дан текстовый файл. Создать символьный файл, содержащий все\ символы,',0,2);
taskText('встретившиеся в\ тексте, включая пробел и\ знаки препинания (без\ повторений).',0,3);
taskText('Символы располагать в\ порядке убывания их\ кодов.',0,4);
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
dataS('Имя текстового файла: ',S1,0,1);
dataS('Имя символьного файла: ',S2,0,5);
{dataComment('Содержимое текстового файла:',xRight,1);}
resultComment('Содержимое символьного файла:',0,2);
Pause;
end;

procedure STxt50An45(Name, Key: string);
var i,j,i1 : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});(*DEMO*)
getVariant(5,0,0,0,Code,code1,code2);
s1 := '';
taskText('Дан текстовый файл. Подсчитать число появлений в\ нем каждой \Iстрочной\i',0,1);
taskText('(т.\,е. маленькой) русской буквы и\ создать строковый файл, элементы',0,2);
taskText('которого имеют вид \<<буква>\:<число ее\ появлений>\> (например, \<а\:25\>).',0,3);
taskText('Буквы, отсутствующие в\ тексте, в\ файл не\ включать.',0,4);
taskText('Строки упорядочить по возрастанию кодов букв.',0,5);
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
 for i := Ord('а') to Ord('я') do
     if c[i]<>0 then
       begin
         Str(c[i],s6);
         s6 := Chr(i)+'-'+s6;
         write(Fs,s6);
       end;
Close(Fs);
resultFileS(S2,3,7);
dataFileT(S1,2,4);
dataS('Имя текстового файла: ',S1,0,1);
dataS('Имя строкового файла: ',S2,0,5);
{dataComment('Содержимое текстового файла:',xRight,1);}
resultComment('Содержимое строкового файла:',0,2);
pause;
end;




procedure STxt50An46(Name, Key: string);
var i,j,i1 : integer;
    c : array [1..255] of integer;
begin
start(Name,Topic4,Author,Key,66{level});
getVariant(5,0,0,0,Code,code1,code2);
s1 := '';
taskText('Дан текстовый файл. Подсчитать число появлений в\ нем каждой \Iстрочной\i (т.\,е.',0,1);
taskText('маленькой) русской буквы и\ создать строковый файл, элементы которого имеют',0,2);
taskText('вид \<<буква>\:<число ее\ появлений>\> (например, \<а\:25\>). Буквы, отсутствующие',0,3);
taskText('в\ тексте, в\ файл не\ включать. Строки упорядочить по\ убыванию числа',0,4);
taskText('появлений букв, а\ при\ равном числе появлений\ \= по\ возрастанию кодов букв.',0,5);
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
 for j := Ord('а') to Ord('я') do
     begin
       n1 := 0; i1 := 0;
       for i := Ord('а') to Ord('я') do
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
dataS('Имя текстового файла: ',S1,0,1);
dataS('Имя строкового файла:',S2,0,5);
{dataComment('Содержимое текстового файла:',xRight,1);}
resultComment('Содержимое строкового файла:',0,2);
Pause;
end;



procedure STxt50An47(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i,j,i1 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('Дана строка~{S}, состоящая из\ 10~цифр, и\ файл с\ русским текстом. Зашифровать',0,1);
taskText('файл, выполнив циклическую замену каждой русской буквы, стоящей на\ \Um{K}-й\um\ позиции',0,2);
taskText('строки, на\ букву того\ же регистра, расположенную в\ алфавите на\ \Um{S}_{K}-м\um\ месте',0,3);
taskText('после шифруемой буквы (для\ {K}~=~11 снова используется смещение~{S}_{1} и\ т.\,д.).',0,4);
taskText('Букву~\<ё\> в\ алфавите не\ учитывать, знаки препинания и\ пробелы не\ изменять.',0,5);
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
      s[i]^[j] := c1[(Pos(s[i]^[j],c1)+n0-1) mod 32 + 1]
    else
      if Pos(s[i]^[j],c2)<>0 then
        s[i]^[j] := c2[(Pos(s[i]^[j],c2)+n0-1) mod 32 + 1];
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
dataS('Имя файла: ',S2,xRight,1);
{dataComment('Содержимое файла:',56,1);}
{resultComment('Новое содержимое файла:',0,1);}
Pause;
end;
procedure STxt50An48(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i,j,i1 : integer;
begin
start(Name,Topic4,Author,Key,66{level});
taskText('Дана строка и\ файл с\ русским текстом, зашифрованным по\ правилу,',0,1);
taskText('описанному в\ задании \1. Данная строка представляет собой первую',0,2);
taskText('расшифрованную строку текста. Расшифровать остальные строки',0,3);
taskText('и\ заменить в\ файле зашифрованный текст на\ расшифрованный.',0,4);
taskText('Если информации для\ расшифровки недостаточно, то\ исходный файл не\ изменять.',0,5);
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
  if ord(s3[i]) in [129..255] then s6[(i-1)mod 10 + 1]:= '*';
bln := Pos(' ',s6)=0;
for i := 0  to len-1 do
  begin
  s4 := s[i]^;
    for j := 1 to length(s[i]^) do
    begin
      n0 :=Ord(s0[(j-1) mod 10 + 1])-48;
      if Pos(s[i]^[j],c1)<>0 then
        s[i]^[j] := c1[(Pos(s[i]^[j],c1)+n0-1) mod 32 + 1]
      else
        if Pos(s[i]^[j],c2)<>0 then
          s[i]^[j] := c2[(Pos(s[i]^[j],c2)+n0-1) mod 32 + 1];
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
dataS('Имя файла: ',S2,59,1);
Pause;
end;


procedure STxt50An49(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 66{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;



procedure STxt50An50(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic4, Author, Key, 66{level});
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
Topic := 'ТЕКСТОВЫЕ ФАЙЛЫ';
Topic1 := 'ТЕКСТОВЫЕ ФАЙЛЫ: ОСНОВНЫЕ ОПЕРАЦИИ';
Topic2 := 'АНАЛИЗ И ФОРМАТИРОВАНИЕ ТЕКСТА';
Topic3 := 'ТЕКСТОВЫЕ ФАЙЛЫ С ЧИСЛОВОЙ ИНФОРМАЦИЕЙ';
Topic4 := 'ТЕКСТОВЫЕ ФАЙЛЫ: ДОПОЛНИТЕЛЬНЫЕ ЗАДАНИЯ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.
