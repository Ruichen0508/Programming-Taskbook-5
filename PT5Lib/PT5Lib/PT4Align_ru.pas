{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4Align_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;



const
  Subgroup1 = 'Редакционное расстояние и оптимальное редакционное предписание';
  Subgroup2 = 'Модификации редакционного расстояния';
// Строки с джокерами
// Редакционно-взвешенное расстояние
  Subgroup3 = 'Глобальное выравнивание строк';
// Выравнивание на основе редакционного предписания
// Выравнивание на основе матрицы оценок
  Subgroup4 = 'Модификации глобального выравнивания';
// Выравнивание с бесплатными граничными пробелами
// Учет пропусков
  Subgroup5 = 'Приближенные вхождения строк и локальное выравнивание';
// Нахождение приближенных вхождений строк
// Локальное выравнивание строк
  Subgroup6 = 'Нахождение наибольшей общей подпоследовательности';
// Метод динамического программирования
// Комбинаторный алгоритм
  Rule_ = '|1  |5  1|0  1|5  2|0  2|5  3|0  3|5  4|0  4|5  5|0  5|5  6|0  6|5  7|0';

const
  fleft = 1;
  fup = 2;
  fdiag = 4;

var DType: integer = 0;
// 0 - обычное
// 1 - с джокером
// 2 - с бесплатными граничными пробелами
// 3 - для поиска приближенных вхождений
// 4 - для локального выравнивания
    WR: integer = 1;
    WD: integer = 1;

const nmax = 51;

type matr = array[0..nmax,0..nmax] of integer;

type Pair = record
       x2,x3: integer;
     end;

var dd, dk, df, da, dv, we, wf: matr;
    tt,t01,t02: array [1..nmax] of string;
    ind,indl,indl2: array [0..nmax] of integer;
    seq,seq1,l: array [0..nmax] of integer;
    cov,ll,ll2: matr;
    seq2: array [0..2*nmax] of pair;
    b2,p2: array [0..2*nmax] of integer;

var s1,s2,s3,s0,t,s,s01,s02,s00,info,p0,t0: string;
    m,i1,i2,ff,aa,cc,k,k1,k2,mm,nn,cnt,y,d,nl: integer;
    c1,c2: char;

function Rule(k,n: integer): string;
var s: string;
    i: integer;
begin
  result := '';
  if n <2 then
    exit;
  s := Copy(Rule_,1,n+1);
  if (s[length(s)] = '|') or
     (s[length(s)] <> ' ') and (s[length(s)-1] = ' ') then
    s[length(s)] := ' ';
  if (s[length(s)-1] <> ' ') and (s[length(s)-2] = ' ') then
    s[length(s)-1] := ' ';
  result := '';
  for i := 1 to k do
    result := result + ' ';
  result := result + ' '+s;
end;

function CPos(s: string; c: integer): integer;
begin
  result := Center(1,1,length(s)+c,0)-1;
end;

function RPos(w: integer): integer;
begin
  result := (41 - w) div 2 + 41;
end;


function rand(a, b: integer): integer;
begin
  if a >= b then
    result := a
  else
    result := Random(b-a+1) + a;
end;

function randc(n: integer): char;
begin
  result := chr(Random(n) + 97);
  if (DType = 1) and (Random(5) = 0) then
    result := '?';
end;

procedure swap(var i,j: integer);
var k: integer;
begin
  k := i;
  i := j;
  j := k;
end;

function min(a,b: integer): integer;
begin
  if a < b then result := a
  else result := b;
end;

function max(a,b: integer): integer;
begin
  if a > b then result := a
  else result := b;
end;

function min3(left, up, diag: integer; var first, all, cnt: integer): integer;
begin
  result := left;
  first := fleft;
  all := fleft;
  cnt := 1;
  if up = result then
  begin
    all := all + fup;
    cnt := cnt + 1;
  end
  else
    if up < result then
    begin
      result := up;
      first := fup;
      all := fup;
      cnt := 1;
    end;
  if diag = result then
  begin
    all := all + fdiag;
    cnt := cnt + 1;
  end
  else
    if diag < result then
    begin
      result := diag;
      first := fdiag;
      all := fdiag;
      cnt := 1;
    end;
end;

function max3(left, up, diag: integer; var first, all, cnt: integer): integer;
begin
  result := left;
  first := fleft;
  all := fleft;
  cnt := 1;
  if up = result then
  begin
    all := all + fup;
    cnt := cnt + 1;
  end
  else
    if up > result then
    begin
      result := up;
      first := fup;
      all := fup;
      cnt := 1;
    end;
  if diag = result then
  begin
    all := all + fdiag;
    cnt := cnt + 1;
  end
  else
    if diag > result then
    begin
      result := diag;
      first := fdiag;
      all := fdiag;
      cnt := 1;
    end;
end;


function TransformStr(m: integer; s: string): string;
var i,j: integer;
    c: char;
begin
  for i := 1 to Rand(6,12) do
    case Rand(1,3) of
    1: Delete(s,Rand(1,length(s)), 1);
    2: insert(randc(m), s, Rand(1,length(s)));
    3: if s = '' then
         s := randc(m)
       else
       begin
         repeat
         c := randc(m);
         j := rand(1,length(s))
         until c <> s[j];
         s[j] := c;
       end;
    end;
  result := s;
end;

procedure MakeStr(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

end;

procedure MakeStrJ(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 1;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
end;

procedure MakeStrW(a,b,m: integer; var s1,s2: string);
var i: integer;
begin
  DType := 0;
  repeat
  WD := rand(2,30);
  WR := rand(1,2*WD-1);
  until WD <> WR;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
end;


procedure MakeStrLCS(a,b,m: integer; var s1,s2: string);
var i,nn,mm,k: integer;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  nn := length(s1);
  s2 := TransformStr(m,s1);
  mm := length(s2);
  k := Random(3);
  if k in [0,1] then
  for i := 1 to Rand(5,15) do
    s2 := randc(m) + s2;
  if k in [1,2] then
  for i := 1 to Rand(5,15) do
    s1 := randc(m) + s1;
  if length(s1) > b then
  for i := 1 to length(s1)-b do
    delete(s1,Rand(1,length(s1)),1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  s1 := Copy(s1,1,nn);
  s2 := Copy(s2,1,mm);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

end;



//----------------------------------------------------------------------

function CompareD(c1,c2:char): boolean;
begin
  result := (c1 = c2) or (c1 = '?')or(c2 = '?');
end;

function tt0(i,j: integer): integer;
begin
  case DType of
  0: begin
       if s1[i] = s2[j] then
         result := 0
       else
         result := WR;
     end;
  1: begin
       if CompareD(s1[i], s2[j]) then
         result := 0
       else
         result := 1;
     end;
  end;
end;


procedure CalcD;
var i,j: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dd[i,0] := i*WD;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dd[0,j] := j*WD;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      dd[i,j] := min3(dd[i,j-1]+WD, dd[i-1,j]+WD, dd[i-1,j-1]+tt0(i,j), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
end;

function BackD: string;
var s: string;
    i,j,ii: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  i := nn;
  j := mm;
  s := '';
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      j := j-1;
      s := 'I' + s;
    end
    else
    if df[i,j] = fup then
    begin
      i := i-1;
      s := 'D' + s;
    end
    else
    begin
      if CompareD(s1[i],s2[j]) then
        s := 'M' + s
      else
        s := 'R' + s;
      i := i-1;
      j := j-1;
    end
  end;
  result := s;
end;

procedure BackD2(i,j: integer; s: string);
begin
  if i+j = 0 then
  begin
    cnt := cnt + 1;
    tt[cnt] := s;
  end
  else
  begin
    if da[i,j] and fleft = fleft then
      BackD2(i,j-1,'I' + s);
    if da[i,j] and fup = fup then
      BackD2(i-1,j,'D' + s);
    if da[i,j] and fdiag = fdiag then
    begin
      if CompareD(s1[i],s2[j]) then
        s := 'M' + s
      else
        s := 'R' + s;
      BackD2(i-1,j-1,s);
    end
  end;
end;

procedure ShowMatr(Cmt: string; dm: matr; y,typ: integer);
//  typ = 0 - без подписей,
//        1 - только подписи к строкам,
//        2 - только подписи к столбцам,
//        3 - подписи к строкам и столбцам
//        4 - без нулевых строк/столбцов
var i,j,nn,mm,startind: integer;
    s0,s00: string;
begin
  DataComment(Cmt,0,y);
  nn := Length(s1);
  mm := Length(s2);
  if typ and 4 = 4 then
    startind := 1
  else
    startind := 0;
  if typ and 2 = 2 then
  begin
    s0 := '';
    for j := startind to mm do
    begin
      str(j:4,s00);
      s0 := s0 + s00;
    end;
    if Odd(length(s0)) then
      s0 := s0+ ' ';
    DataComment(s0,0,y+1);
  end
  else
    y := y - 1;
  for i := startind to nn do
  begin
    if typ and 1 = 1 then
    begin
      Str(i:2,s00);
      DataComment(s00+':',Center(1, mm+1-startind, 3, 1)-4,i+y+2-startind);
    end;
    for j := startind to mm do
      DataN('',dm[i,j],Center(j+1-startind, mm+1-startind, 3, 1), i+y+2-startind, 3);
  end;
end;

function Trim(s: string): string;
begin
  while (s <> '') and (s[1] = ' ') do
    delete(s,1,1);
  while (s <> '') and (s[length(s)] = ' ') do
    delete(s,length(s),1);
  result := s;
end;

procedure TaskTextExt(s: string);
var i,p: integer;
begin
i := 1;
if s[length(s)] <> '\' then
  s := s + '\\';
while s <> '' do
begin
  p := pos('\\',s);
  TaskText(Copy(s,1,p-1),0,i);
  Delete(s,1,p+1);
  if i in [1..4] then
    inc(i)
  else
    i := 0;
end;
end;


procedure Alignment1;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Определены следующие операции редактирования для строк {S}_1 и {S}_2: I \= вставка\\'+
'перед текущим символом {S}_1 текущего символа из {S}_2 и переход к следующему\\'+
'символу {S}_2 (текущий символ {S}_1 не изменяется); D \= удаление текущего символа {S}_1\\'+
'и переход к следующему символу {S}_1 (текущий символ {S}_2 не изменяется),\\'+
'R \= замена текущего символа {S}_1 на текущий символ {S}_2, M \= \<пустая операция\>,\\'+
'при которой текущие символы {S}_1 и {S}_2 не изменяются (после выполнения операций\\'+
'R и M происходит переход к следующему символу в каждой строке). В начальный\\'+
'момент текущими символами считаются первые символы строк. Строка над алфавитом\\'+
'\{I, D, R, M\}, обеспечивающая преобразование строки {S}_1 в строку {S}_2, называется\\'+
'\Iредакционным предписанием\i (или просто \Iпредписанием\i) для данных строк.\\'+
'Дана строка {S}_1, предписание {T} и два символа: {C}_1 и {C}_2. Получить строку {S}_2,\\'+
'если известно, что при выполнении операции I текущим символом строки {S}_2\\'+
'всегда оказывается символ {C}_1, а при выполнении операции R \= символ {C}_2.'
);
  m := Rand(10,20);
  repeat
  c1 := Randc(m);
  c2 := Randc(m);
  until c1 <> c2;
  repeat
  MakeStr(30,40,m,s1,s2);
  s2 := '';
  t := '';
  i1 := 1;
  while i1 <= length(s1) do
  begin
    case Rand(1,10) of
    1: begin
         t := t + 'I';
         s2 := s2 + c1;
       end;
    2: begin
         t := t + 'D';
         i1 := i1 + 1;
       end;
    3: begin
         t := t + 'R';
         s2 := s2 + c2;
         i1 := i1 + 1;
       end;
    else begin
         t := t + 'M';
         s2 := s2 + s1[i1];
         i1 := i1 + 1;
       end;
    end;
  end;
  until length(t) < 70;
  DataS('S_1 = ',s1,17,2);
  DataComment(Rule(5,length(s1)),17,3);
  DataS('T  = ',t,17,4);
  DataC('C_1 = ',c1,xLeft,5);
  DataC('C_2 = ',c2,xRight,5);
  ResultS('S_2 = ',s2,17,3);
  ResultComment(Rule(5,length(s2)),17,4);
  SetTestCount(5);
end;

procedure Alignment2;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 и {T}. Строка {T} содержит только символы I, D, R, M.\\'+
'Проверить, является ли строка {T} предписанием для строк {S}_1 и {S}_2 (определение\\'+
'предписания приведено в~\1); для этого выполнить операции\\'+
'редактирования из {T} для строки {S}_1, получив строку {S''}_1. Если {T} является\\'+
'предписанием, т.\,е. {S''}_1\,=\,{S}_2, то вывести 0, если не является, то вывести\\'+
'номер первого символа {S''}_1, отличающегося от символа {S}_2 с тем же номером\\'+
'(символы нумеруются от 1), или \-1, если символы {S''}_1 и {S}_2 с одинаковыми\\'+
'номерами совпадают, но длины строк {S''}_1 и {S}_2 различны. Проверку выполнять\\'+
'в процессе построения строки {S''}_1.'
);
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  s2 := '';
  t := '';
  i1 := 1;
  while i1 <= length(s1) do
  begin
    case Rand(1,10) of
    1: begin
         t := t + 'I';
         s2 := s2 + randc(m);
       end;
    2: begin
         t := t + 'D';
         i1 := i1 + 1;
       end;
    3: begin
         t := t + 'R';
         repeat
         c1 := randc(m);
         until c1 <> s1[i1];
         s2 := s2 + c1;
         i1 := i1 + 1;
       end;
    else begin
         t := t + 'M';
         s2 := s2 + s1[i1];
         i1 := i1 + 1;
       end;
    end;
  end;
  case Random(6) of
  0: i := 0;
  1: i := Rand(1,5);
  2: i := Rand(1,length(s2));
  3: i := Rand(length(s2)-5, length(s2));
  4,5: i := -1;
  end;
  if i > 0 then
  begin
    repeat
      c1 := randc(m);
    until c1 <> s2[i];
    s2[i] := c1;
  end;
  if i = -1 then
  case Random(2) of
  0: Delete(s2,length(s2)-Rand(1,5),100);
  1: for j := 1 to Rand(1,5) do
       s2 := s2 + Randc(m);
  end;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
  DataS('T  = ',t,3,5);
  ResultN('Результат проверки: ',i,0,3,2);
  SetTestCount(5);
end;

procedure Alignment3;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'\IОптимальным предписанием\i {T} для строк {S}_1 и {S}_2 называется предписание\\'+
'(см.~\2), содержащее минимальное количество операций I, D, R\\'+
'(операции M не учитываются). Количество операций I, D, R, входящих\\'+
'в оптимальное предписание, называется \Iредакционным расстоянием\i между {S}_1 и {S}_2.\\'+
'Даны строки {S}_1, {S}_2 и четыре строки, содержащие только символы I, D, R, M.\\'+
'Известно, что одна из этих четырех строк является оптимальным предписанием\\'+
'для {S}_1 и {S}_2. Вывести редакционное расстояние между {S}_1 и {S}_2 и порядковый\\'+
'номер той строки, которая является оптимальным предписанием.'
);
  m := Rand(10,20);
  repeat
  MakeStr(18,25,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 3) and (dk[nn,mm] <= 10);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  for i := 2 to 4 do
  case Random(4) of
  0: Delete(tt[i],Rand(1,length(tt[i])),1);
  1: begin
     case Random(4) of
     0: c1 := 'I';
     1: c1 := 'D';
     2: c1 := 'M';
     3: c1 := 'R';
     end;
     Insert(c1, tt[i], Rand(1,length(tt[i])));
     end;
  2: begin
       for j := 1 to 20 do
       begin
         k := Rand(1,length(tt[i]));
         if tt[i][j]='R' then
           break;
       end;
       Delete(tt[i],k,1);
       case Random(2) of
       0: Insert('DI',tt[i],k);
       1: Insert('ID',tt[i],k);
       end;
     end;
  3: begin
     repeat
     case Random(4) of
     0: c1 := 'I';
     1: c1 := 'D';
     2: c1 := 'M';
     3: c1 := 'R';
     end;
     k := Rand(1,length(tt[i]));
     until tt[i][k] <> c1;
     tt[i][k] := c1;
     end;
  end;
  j := 0;
  for i := 1 to 4 do
  begin
    ind[i] := i;
    if length(tt[i])>j then
      j := length(tt[i]);
  end;
  for i := 1 to 10 do
    swap(ind[Rand(1,4)],ind[Rand(1,4)]);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataComment(Rule(0,j),43,1);
  for i := 1 to 4 do
  begin
  Str(i,s0);
  DataComment(s0+':',40,i+1);
  DataS('',tt[ind[i]],43,i+1);
  if ind[i]=1 then y := i;
  end;
  ResultN('Редакционное расстояние: ',dd[nn,mm],0,2,2);
  ResultN('Номер строки \= оптимального предписания: ',y,0,4,2);
  SetTestCount(5);
end;

procedure Alignment4;
var
  i,j,cnt: integer;
function D(i,j: integer): integer;
begin
  inc(cnt);
  if i = 0 then
    result := j
  else
    if j = 0 then
      result := i
    else
      result := min3(D(i,j-1)+1, D(i-1,j)+1, D(i-1,j-1)+tt0(i,j), ff,aa,cc);
end;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 и числа {k}_1, {k}_2 (0\,\l\,{k}_1\,\l\,|{S}_1|, 0\,\l\,{k}_2\,\l\,|{S}_2|).\\'+
'Через {D}({i},\,{j}), обозначается редакционное расстояние между строками {S}_1[1..{i}]\\'+
'и {S}_2[1..{j}] (см.~\1). Справедливы следующие соотношения:\\'+
'\(\X для любого {i} {D}({i},\,0)\,=\,{i};\| \X для любого {j} {D}(0,\,{j})\,=\,{j};\| \X если {i}\,>\,0 и {j}\,>\,0,\\'+
'то {D}({i},\,{j})\,=\,min\{{D}({i}\,\-\,1,\,{j})\,+\,1, {D}({i},\,{j}\,\-\,1)\,+\,1, {D}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,t({i},\,{j})\},\\'+
'где {t}({i},\,{j})\,=\,1, если {S}_1[{i}]\,\n\,{S}_2[{j}], и {t}({i},\,{j})\,=\,0, если {S}_1[{i}]\,=\,{S}_2[{j}].\)\\'+
'Найти {D}({k}_1,\,{k}_2), используя рекурсивную функцию, выполняющую вычисления\\'+
'по приведенным формулам (так называемая \Iнисходящая рекурсия\i). Вывести\\'+
'значение {D}({k}_1,\,{k}_2) и количество рекурсивных вызовов функции, которое\\'+
'потребовалось для его вычисления.\\'+
'\P\SПримечание\s. Алгоритм решения задачи оптимизации\\'+
'(в нашем случае вычисления редакционного расстояния {D}({k}_1,\,{k}_2))\\'+
'путем сведения этой задачи к аналогичной задаче (или набору задач)\\'+
'\<меньшего\> размера называется \Iалгоритмом динамического программирования\i.'
);
(*
*)
  m := Rand(10,20);
  MakeStr(30,40,m,s1,s2);
  cnt := 0;
  k1 := Rand(0,8);//length(s1));
  k2 := Rand(0,8);//length(s2));
  DataS('S_1 = ',S1,18,2);
  DataS('S_2 = ',S2,18,3);
  DataComment(Rule(5,max(length(s1),length(s2))),18,4);
  DataN('k_1 = ',k1,xleft,5,1);
  DataN('k_2 = ',k2,xright,5,1);
  ResultN('D(k_1,k_2) = ',D(k1,k2),0,2,1);
  ResultN('Количество рекурсивных вызовов: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment5;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
TaskTextExt(
'Даны строки {S}_1 и {S}_2. Для эффективного вычисления редакционного расстояния\\'+
'{D}(|{S}_1|,\,|{S}_2|) между данными строками по формулам из \1 можно\\'+
'использовать следующий \Iметод восходящей рекурсии\i. Вводится в рассмотрение\\'+
'матрица {D} размера (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1), строчки и столбцы которой нумеруются\\'+
'от~0. Вначале заполняются элементы нулевой строчки и нулевого столбца:\\'+
'{D}_{0,j}\,=\,{j}, {D}_{i,0}\,=\,{i}. Затем выполняется последовательное заполнение\\'+
'по строчкам остальных элементов матрицы; при этом для вычисления очередного\\'+
'элемента {D}_{i,j} используются уже найденные элементы, расположенные левее\\'+
'(элемент {D}_{i,j\-1}), выше (элемент {D}_{i\-1,j}) и левее и выше (элемент {D}_{i\-1,j\-1})\\'+
'вычисляемого элемента. Элемент, расположенный в последней строчке\\'+
'и последнем столбце, равен редакционному расстоянию. Используя метод\\'+
'восходящей рекурсии, найти матрицу {D} и вывести элементы ее двух последних\\'+
'строчек: {D}_{n\-1,j}, {j}\,=\,0,\.,\,|{S}_2|, {D}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, где {n}\,=\,|{S}_1|.'
);
  m := Rand(10,20);
  MakeStr(20,24,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);

  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:3,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 2, 1), 3, 2);
  ResultComment('D_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 2, 1), 5, 2);
  SetTestCount(5);
end;


procedure Alignment6;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Дополнить метод восходящей рекурсии (см.~\1)\\'+
'так, чтобы он позволял найти не только редакционное расстояние,\\'+
'но и количество различных оптимальных предписаний. Для этого дополнительно\\'+
'ввести в рассмотрение матрицу {K} того же размера, что и матрица {D}, и заполнять\\'+
'эту матрицу синхронно с {D} по следующим правилам: {K}_{0,j}\,=\,1, {K}_{i,0}\,=\,1,\\'+
'значение {K}_{i,j} при {i}\,>\,0 и {j}\,>\,0 равно сумме значений тех элементов {K}_{i,j\-1},\\'+
'{K}_{i\-1,j}, {K}_{i\-1,j\-1}, которые соответствуют элементам матрицы {D}, дающим\\'+
'минимум в формуле для {D}({i},\,{j}). Элемент, расположенный в последней строчке\\'+
'и последнем столбце матрицы {K}, равен количеству возможных оптимальных\\'+
'предписаний. Вывести последние строчки матриц {D} и {K}.'
);
  m := Rand(10,20);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  ResultComment(s0,0,1);
  ResultComment('D_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;

procedure Alignment7;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и матрица {D}, полученная методом восходящей рекурсии\\'+
'(см.~\2). Известно, что имеется единственное оптимальное предписание\\'+
'для {S}_1 и {S}_2. Найти это предписание, выполняя \Iобратный проход\i по матрице {D},\\'+
'начиная с ее правого нижнего элемента и заканчивая левым верхним элементом;\\'+
'при этом для каждого элемента {D}_{i,j} при {i}\,>\,0 и {j}\,>\,0 перемещение выполняется\\'+
'в тот из элементов {D}_{i,j\-1}, {D}_{i\-1,j}, {D}_{i\-1,j\-1}, на котором достигается\\'+
'минимум в формуле для {D}({i},\,{j}) (см.~\3), для элементов {D}_{0,j}\\'+
'перемещение всегда выполняется влево, а для элементов {D}_{i,0} \= вверх.\\'+
'Перемещение влево соответствует операции I, перемещение вверх \= операции D,\\'+
'а перемещение по диагонали влево и вверх \= операции R, если {S}_1[{i}]\,\n\,{S}_2[{j}],\\'+
'и операции M, если {S}_1[{i}]\,=\,{S}_2[{j}] (операции добавляются в предписание\\'+
'справа налево). Вывести найденное оптимальное предписание.'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] = 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('Элементы матрицы D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;

procedure Alignment8;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и матрица {D}, полученная методом восходящей рекурсии\\'+
'(см.~\3). Найти один из вариантов оптимального предписания\\'+
'для {S}_1 и {S}_2, выполняя обратный проход по матрице {D} (см.~\1).\\'+
'Если для некоторого элемента {D}_{i,j} возможны перемещения более чем в один\\'+
'из его соседних элементов {D}_{i,j\-1}, {D}_{i\-1,j}, {D}_{i\-1,j\-1}, то предпочтение\\'+
'отдается перемещению влево (соответствующему операции I), а при его\\'+
'невозможности \= перемещению вверх (соответствующему операции D). Вывести\\'+
'найденное оптимальное предписание.'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('Элементы матрицы D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;

procedure Alignment9;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и матрица {D}, полученная методом восходящей рекурсии\\'+
'(см.~\4). Найти все оптимальные предписания для {S}_1 и {S}_2, выполняя\\'+
'обратный проход по матрице~{D} (см.~\2). Если для некоторого\\'+
'элемента {D}_{i,j} возможны перемещения более чем в один из его соседних\\'+
'элементов {D}_{i,j\-1}, {D}_{i-1,j}, {D}_{i-1,j-1}, то использовать следующий\\'+
'порядок перебора допустимых в данной позиции операций: I (перемещение влево),\\'+
'D (перемещение вверх), R или M (перемещение по диагонали). Реализовать один\\'+
'шаг обратного хода в виде рекурсивной функции, количество собственных вызовов\\'+
'которой зависит от числа возможных перемещений в соседние элементы. Вывести\\'+
'все найденные оптимальные предписания (порядок вывода предписаний\\'+
'должен соответствовать порядку их нахождения).'
);
  m := Rand(10,20);
  repeat
  MakeStr(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('Элементы матрицы D:',dd,3,0);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);

  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment10;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);

  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти редакционное расстояние и один из вариантов\\'+
'оптимального предписания для {S}_1 и {S}_2, используя метод восходящей рекурсии\\'+
'для построения матрицы~{D} (см.~\5) и выполняя обратный проход\\'+
'по матрице~{D} (см.~\3). Выбор варианта оптимального предписания\\'+
'выполнять в соответствии с указаниями \2.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultN('Редакционное расстояние: ',dd[nn,mm],0,2,2);
  ResultComment('Вариант оптимального предписания:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;

procedure Alignment11;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskTextExt(
'\\Даны строки {S}_1 и {S}_2. Найти редакционное расстояние и все варианты\\'+
'оптимального предписания для {S}_1 и {S}_2, используя метод восходящей рекурсии\\'+
'для построения матрицы~{D} (см.~\6) и выполняя обратный\\'+
'проход по матрице~{D} (см.~\4 и~\2).'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('Редакционное расстояние: ',dd[nn,mm],xLeft,1,2);
  ResultComment('Оптимальные предписания:',xRight,1);

  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//---------------------------------------------------------------

procedure Alignment12;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Строки могут содержать особый символ-\Iджокер\i \<?\>,\\'+
'который считается совпадающим с любым символом. При построении редакционного\\'+
'предписания для строк с джокерами \<пустая\> операция M может применяться\\'+
'не только при совпадении текущих символов строк, но и в случае, когда один\\'+
'или оба текущих символа являются джокерами. Модифицировать формулы для {D}({i},\,{j}),\\'+
'приведенные в~\8, с учетом дополнительного правила для джокеров\\'+
'и найти редакционное расстояние для {S}_1 и {S}_2, используя метод восходящей\\'+
'рекурсии, описанный в~\7. Вывести элементы двух последних\\'+
'строчек матрицы~{D}: {D}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {D}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|,\\'+
'где {n}\,=\,|{S}_1| (последний элемент будет равен редакционному расстоянию).'
);
  m := Rand(10,20);
  MakeStrJ(20,24,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);

  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:3,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 2, 1), 3, 2);
  ResultComment('D_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 2, 1), 5, 2);
  SetTestCount(5);
end;


procedure Alignment13;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\1). Дополнить метод восходящей рекурсии (см.~\8) так,\\'+
'чтобы он позволял найти не только редакционное расстояние (с учетом наличия\\'+
'джокеров), но и количество различных оптимальных предписаний. Для этого\\'+
'дополнительно ввести в рассмотрение матрицу {K} того же размера,\\'+
'что и матрица {D}, и заполнять эту матрицу синхронно с {D}\\'+
'по правилам, аналогичным приведенным в~\7. Вывести\\'+
'последние строчки матриц {D} и~{K}.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  ResultComment(s0,0,1);
  ResultComment('D_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment14;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\2), и матрица~{D}, построенная методом восходящей рекурсии\\'+
'(см.~\9) с учетом джокеров. Найти один из вариантов оптимального\\'+
'предписания для {S}_1 и {S}_2, модифицировав алгоритм обратного прохода\\'+
'по матрице~{D} (см.~\7) с учетом наличия джокеров. Выбор варианта\\'+
'оптимального предписания выполнять в соответствии с указаниями \6.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('Элементы матрицы D:',dd,3,0);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;



procedure Alignment15;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\3), и матрица~{D}, построенная методом восходящей рекурсии\\'+
'(см.~\10) с учетом джокеров. Найти все оптимальные предписания\\'+
'для {S}_1 и {S}_2, модифицировав алгоритм обратного прохода, описанный\\'+
'в~\8 и~\6, с учетом наличия джокеров.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  ShowMatr('Элементы матрицы D:',dd,3,0);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);

  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment16;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);

  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\4). Найти редакционное расстояние и один из вариантов\\'+
'оптимального предписания для {S}_1 и {S}_2, используя модифицированный метод\\'+
'восходящей рекурсии для построения матрицы~{D} (см.~\11) с учетом\\'+
'наличия джокеров и выполняя обратный проход по матрице~{D}\\'+
'(см.~\9). Выбор варианта оптимального предписания\\'+
'выполнять в соответствии с указаниями \8.'
);

  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultN('Редакционное расстояние: ',dd[nn,mm],0,2,2);
  ResultComment('Вариант оптимального предписания:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;



procedure Alignment17;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\5). Найти редакционное расстояние и все варианты оптимального\\'+
'предписания для {S}_1 и {S}_2, используя модифицированный метод восходящей\\'+
'рекурсии для построения матрицы~{D} (см.~\12) с учетом наличия джокеров\\'+
'и выполняя обратный проход по матрице~{D} (см.~\10 и~\8).'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('Редакционное расстояние: ',dd[nn,mm],xLeft,1,2);
  ResultComment('Оптимальные предписания:',xRight,1);
  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//----------------------------------------------------------------------

procedure Alignment18;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и положительные числа {d} и {r}. Число {d} определяет \Iвес\i\\'+
'(\<стоимость\>) операций вставки и удаления (I и D), число {r} \= вес операции\\'+
'замены R (вес \<пустой\> операции M считается равным 0). \IОптимальным взвешенным\i\\'+
'\Iпредписанием\i {T} для строк {S}_1 и {S}_2 называется предписание, суммарный вес\\'+
'операций в котором является минимальным. Суммарный вес операций, входящих\\'+
'в оптимальное взвешенное предписание, называется \Iредакционно-взвешенным\i\\'+
'\Iрасстоянием\i между {S}_1 и {S}_2. Через {D''}({i},\,{j}) обозначается редакционно-взвешенное\\'+
'расстояние между строками {S}_1[1..{i}] и {S}_2[1..{j}]. Получить рекуррентные формулы\\'+
'для {D''}({i},\,{j}), модифицировав формулы для {D}({i},\,{j}), приведенные в \14,\\'+
'и найти редакционно-взвешенное расстояние для {S}_1 и {S}_2, применив к матрице {D}''\\'+
'метод восходящей рекурсии (ср. с~\13). Вывести элементы двух последних\\'+
'строчек матрицы {D''}: {D''}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {D''}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, где {n}\,=\,|{S}_1|\\'+
'(последний элемент будет равен редакционно-взвешенному расстоянию).\\'+
'\P\SПримечание\s. Поскольку операция замены R может быть сведена к последовательному\\'+
'выполнению операций вставки I и удаления D, вес {r} должен быть \Iменьше\i\\'+
'удвоенного веса {d}; в противном случае либо все оптимальные взвешенные\\'+
'предписания не будут содержать операцию R (при {r}\,>\,2{d}), либо любое\\'+
'оптимальное взвешенное предписание можно будет преобразовать к виду,\\'+
'не содержащему R (при {r}\,=\,2{d}).'
);
  m := Rand(10,20);
  MakeStrW(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);

  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  CalcD;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('D''_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn-1,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('D''_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment19;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и положительные числа {d} и {r}. Дополнить метод восходящей\\'+
'рекурсии (см.~\1) так, чтобы он позволял найти не только\\'+
'редакционно-взвешенное расстояние, но и количество различных оптимальных\\'+
'взвешенных предписаний. Для этого дополнительно ввести в рассмотрение\\'+
'матрицу {K''} того же размера, что и матрица {D''}, и заполнять эту матрицу\\'+
'синхронно с {D''} по правилам, аналогичным приведенным\\'+
'в~\13. Вывести последние строчки матриц {D''} и~{K''}.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);


  CalcD;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until k1 = 0;
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(i,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  ResultComment(s0,0,1);
  ResultComment('D''_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dd[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K''_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment20;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, положительные числа {d}, {r} и матрица {D''}, построенная\\'+
'методом восходящей рекурсии (см.~\2). Найти одно из оптимальных\\'+
'взвешенных предписаний для {S}_1 и {S}_2, используя алгоритм обратного прохода\\'+
'по матрице {D''} (ср. с~\13). Выбор варианта оптимального предписания\\'+
'выполнять в соответствии с указаниями \12.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('d = ',WD,52,2,1);
  DataN('r = ',WR,62,2,1);
  ShowMatr('Элементы матрицы D'':',dd,3,1);
  ResultS('',BackD,0,3);
  SetTestCount(5);
end;



procedure Alignment21;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'\\Даны строки {S}_1 и {S}_2, положительные числа {d}, {r} и матрица {D''}, построенная\\'+
'методом восходящей рекурсии (см.~\3). Найти все оптимальные\\'+
'взвешенные предписания для {S}_1 и {S}_2, применив к матрице {D''} алгоритм\\'+
'обратного прохода, описанный в~\14 и~\12.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(9,13,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('d = ',WD,52,2,1);
  DataN('r = ',WR,62,2,1);
  ShowMatr('Элементы матрицы D'':',dd,3,1);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..4: y := 2;
  5..8: y := 1;
  9..10: y := 0;
  end;
  for i := 1 to cnt div 2 do
  begin
    ResultS('',tt[2*i-1],xLeft,i + y);
    ResultS('',tt[2*i],xRight,i + y);
  end;
  if Odd(cnt) then
    ResultS('',tt[cnt],xLeft,cnt div 2 + 1 + y);
  SetTestCount(5);
end;

procedure Alignment22;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и положительные числа {d} и {r}. Найти редакционно-взвешенное\\'+
'расстояние и один из вариантов оптимального взвешенного предписания для {S}_1\\'+
'и {S}_2, используя модифицированный метод восходящей рекурсии для построения\\'+
'матрицы {D''} (см.~\4) и выполняя обратный проход по матрице {D''}\\'+
'(см.~\15). Выбор варианта оптимального взвешенного предписания\\'+
'выполнять в соответствии с указаниями \14.'
);
  m := Rand(10,20);
  repeat
  MakeStrW(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  ResultN('Редакционно-взвешенное расстояние: ',dd[nn,mm],0,2,2);
  ResultComment('Вариант оптимального взвешенного предписания:',0,3);
  ResultS('',BackD,0,4);
  SetTestCount(5);
end;

procedure Alignment23;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и положительные числа {d} и {r}. Найти редакционно-взвешенное\\'+
'расстояние и все варианты оптимального взвешенного предписания для {S}_1 и {S}_2,\\'+
'используя модифицированный метод восходящей рекурсии для построения\\'+
'матрицы {D''} (см.~\5) и выполняя обратный проход\\'+
'по матрице {D''} (см.~\16 и~\14).'
);
  m := Rand(10,20);
  repeat
  MakeStrW(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 10);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataN('d = ',WD,52,3,1);
  DataN('r = ',WR,62,3,1);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('Редакционно-взвешенное расстояние: ',dd[nn,mm],xLeft,1,2);
  ResultComment('Оптимальные взвешенные предписания:',xRight,1);
  for i := 1 to cnt do
  begin
    ResultS('',tt[i],0,1+i+y);
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------
procedure AlignD(s1,s2,T: string; var s01,s02: string);
var i,n1,n2: integer;
begin
  s01 := '';
  s02 := '';
  n1 := 1;
  n2 := 1;
  for i := 1 to length(T) do
    case T[i] of
    'I': begin
           s01 := s01 + ' ';
           s02 := s02 + s2[n2];
           n2 := n2 + 1;
         end;
    'D': begin
           s01 := s01 + s1[n1];
           s02 := s02 + ' ';
           n1 := n1 + 1;
         end;
    'R','M':
         begin
           s01 := s01 + s1[n1];
           s02 := s02 + s2[n2];
           n1 := n1 + 1;
           n2 := n2 + 1;
         end;
    end;
end;

procedure Alignment24;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'\IГлобальным выравниванием\i двух строк называется результат их преобразования,\\'+
'которое заключается во вставке в них пробелов (возможно, и на концах)\\'+
'и размещении получившихся строк друг над другом таким образом, чтобы каждый\\'+
'символ или пробел одной строки располагался напротив символа или пробела\\'+
'другой строки. Выравнивание, содержащее минимальное число пар несовпадающих\\'+
'символов (в том числе пар \<символ\:пробел\>), называется \Iоптимальным\i\\'+
'\Iредакционным выравниванием\i. Даны строки {S}_1, {S}_2 и строка {T} \= один\\'+
'из вариантов оптимального предписания (см.~\21). Построить\\'+
'строки {A}_1 и {A}_2, реализующие оптимальное редакционное выравнивание\\'+
'строк {S}_1 и {S}_2 на основе предписания {T}, выполняя следующие преобразования:\\'+
'если очередной операцией предписания {T} является вставка (I), то к {A}_1\\'+
'добавляется пробел, а к {A}_2 \= текущий символ {S}_2; если очередной операцией\\'+
'является удаление (D), то пробел добавляется к {A}_2, а к {A}_1 \= текущий\\'+
'символ S_1; в случае операции замены (R) и \<пустой\> операции (M) к {A}_1 и {A}_2\\'+
'добавляются текущие символы {S}_1 и {S}_2 соответственно (таким образом, операция\\'+
'замены соответствует размещению на одном уровне различных символов строк {S}_1\\'+
'и {S}_2, а \<пустая\> операция \= размещению на одном уровне одинаковых символов).\\'+
'После вставки текущего символа какой-либо строки текущим становится\\'+
'следующий символ этой строки. Вывести полученные строки {A}_1 и {A}_2.'
);
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  DataS('T  = ',t,3,5);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(5,length(t)),3,4);
  SetTestCount(5);
end;

procedure Alignment25;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти один из вариантов оптимального предписания\\'+
'для данных строк, используя метод восходящей рекурсии для построения\\'+
'матрицы~{D} (см.~\20) и выполняя обратный проход по матрице~{D}\\'+
'(см.~\18). Выбор варианта оптимального предписания выполнять\\'+
'в соответствии с указаниями \17. Построить на основе найденного\\'+
'предписания оптимальное редакционное выравнивание ({A}_1,~{A}_2)\\'+
'(см.~\1) и вывести найденное выравнивание.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(t)),4,4);
  SetTestCount(5);
end;

procedure Alignment26;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти все варианты оптимального предписания для данных\\'+
'строк, используя метод восходящей рекурсии для построения матрицы~{D}\\'+
'(см.~\21) и выполняя обратный проход по матрице~{D}\\'+
'(см.~\19 и~\17). Построить на основе каждого найденного\\'+
'предписания оптимальное редакционное выравнивание ({A}_1,~{A}_2)\\'+
'(см.~\2). Вывести все найденные выравнивания ({A}_1,~{A}_2)\\'+
'в порядке, соответствующем порядку нахождения оптимальных предписаний.'
);
  m := Rand(10,20);
  repeat
  MakeStr(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 2) and (dk[nn,mm] < 8);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  AlignD(s1,s2,tt[i],s01,s02);
  ResultS('A_1 = ',s01,14,y);
  y := y + 1;
  ResultS('A_2 = ',s02,14,y);
  y := y + 1;
  ResultComment(Rule(5,length(tt[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment27;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\15). Найти один из вариантов оптимального предписания\\'+
'для данных строк, используя модифицированный метод восходящей рекурсии\\'+
'для построения матрицы~{D} (см.~\22) с учетом наличия джокеров\\'+
'и выполняя обратный проход по матрице~{D} (см.~\20). Выбор варианта\\'+
'оптимального предписания выполнять в соответствии с указаниями \19.\\'+
'Построить на основе найденного предписания оптимальное редакционное\\'+
'выравнивание ({A}_1,~{A}_2) (см.~\3) и вывести найденное выравнивание.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until dk[nn,mm] > 1;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(t)),4,4);
  SetTestCount(5);
end;

procedure Alignment28;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, которые могут содержать символ-джокер \<?\>\\'+
'(см.~\16). Найти все варианты оптимального предписания\\'+
'для данных строк, используя метод восходящей рекурсии для построения\\'+
'матрицы~{D} (см.~\23) с учетом наличия джокеров и выполняя обратный\\'+
'проход по матрице~{D} (см.~\21 и~\19). Построить на основе\\'+
'каждого найденного предписания оптимальное редакционное выравнивание\\'+
'({A}_1,~{A}_2) (см.~\4). Вывести все найденные выравнивания ({A}_1,~{A}_2)\\'+
'в порядке, соответствующем порядку нахождения оптимальных предписаний.'
);
  m := Rand(10,20);
  repeat
  MakeStrJ(25,35,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  until (dk[nn,mm] > 2) and (dk[nn,mm] <= 8);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  cnt := 0;
  BackD2(nn,mm,s0);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  AlignD(s1,s2,tt[i],s01,s02);
  ResultS('A_1 = ',s01,14,y);
  y := y + 1;
  ResultS('A_2 = ',s02,14,y);
  y := y + 1;
  ResultComment(Rule(5,length(tt[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------------

var ss: array [1..nmax, 1..nmax] of integer;
    jmax, imax: array [1..nmax] of integer;
    njmax,nimax,dvsmax: integer;


procedure CalcSS(smin,smax: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := Rand(0,smax);
  ss[m+1,m+1] := 0;
  for i := 1 to m do
  begin
    ss[i,m+1] := Rand(smin,-1);
    ss[m+1,i] := ss[i,m+1];
  end;
  for i := 1 to m-1 do
    for j := i+1 to m do
    begin
    ss[i,j] := Rand(max(smin, ss[i,m+1]+ss[j,m+1]),-1);
    ss[j,i] := ss[i,j];
    end;
end;

function ShowSS(y: integer): integer;
// возвращает следующую позицию Y раздела исходных данных
var i,j: integer;
begin
  for i := 1 to m do
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m-1+i,19,4,0),y);
  DataComment(' \< \>',Center(19,19,4,0),y);
  DataComment('Верхняя треугольная часть', 7, y+1);
  DataComment('симметричной матрицы оценок:', 6, y+2);
  for i := 1 to m do
  begin
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m-1,19,4,0),y+i);
    for j := i to m+1 do
      DataN('',ss[i,j],Center(19-m-1+j,19,3,1)-1,y+i,3);
  end;
  DataComment(' \< \>',Center(19-m-1,19,4,0),y+m+1);
  DataN('',ss[m+1,m+1],Center(19,19,3,1)-1,y+m+1,3);
  result := y+m+2;
end;

function ss0(c1,c2: char): integer;
var n1,n2: integer;
begin
  if c1 = ' ' then
    n1 := m+1
  else
    n1 := ord(c1)-97+1;
  if c2 = ' ' then
    n2 := m+1
  else
    n2 := ord(c2)-97+1;
  result := ss[n1,n2];
end;

function FreeSpaces: integer;
var max,i,j,nn,mm: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  max := -MaxInt;
  for j := 0 to mm do
    if dv[nn,j]>max then
      max := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm]>max then
      max := dv[i,mm];
  result := max;
  dvsmax := max;
  njmax := 0;
  for j := 0 to mm-1 do
    if dv[nn,j]=max then
    begin
      njmax := njmax + 1;
      jmax[njmax] := j;
    end;
  nimax := 0;
  for i := 0 to nn-1 do
    if dv[i,mm]=max then
    begin
      nimax := nimax + 1;
      imax[nimax] := i;
    end;

end;

function CalcV: integer;
var i,j,k,k1,k2: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    if DType in [0,3] then
      for k := 1 to i do
        dv[i,0] := dv[i,0] + ss0(s1[k],' ');
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    if DType = 0 then
      for k := 1 to j do
        dv[0,j] := dv[0,j] + ss0(' ',s2[k]);
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      dv[i,j] := max3(dv[i,j-1]+ss0(' ',s2[j]), dv[i-1,j]+ss0(s1[i],' '), dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      if (DType = 4) and (dv[i,j] < 0) then
        dv[i,j] := 0;
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;

procedure BackV(var s01, s02: string);
var s: string;
    i,j,ii,jj: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  s01 := '';
  s02 := '';
  i := nn;
  j := mm;
  if DType = 2 then
    if njmax > 0 then
    begin
      j := jmax[1];
      for jj := mm downto j+1 do
      begin
        s01 := ' '+s01;
        s02 := s2[jj] + s02;
      end;
    end
    else
    if nimax > 0 then
    begin
      i := imax[1];
      for ii := nn downto i+1 do
      begin
        s01 := s1[ii]+s01;
        s02 := ' ' + s02;
      end;
    end;
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
    end
    else
    if df[i,j] = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
  end;
end;

procedure BackV2(i,j: integer; s01, s02: string);
var mm,nn,ii,jj: integer;
begin
  if i+j = 0 then
  begin
    cnt := cnt + 1;
    if cnt <= nmax then
    begin
      t01[cnt] := s01;
      t02[cnt] := s02;
    end;
  end
  else
  begin
    if (DType = 2) and (i = length(s1)) and (j = length(s2)) then
    begin
      nn := Length(s1);
      mm := Length(s2);
      i := nn;
      for k := 1 to njmax do
      begin
        j := jmax[k];
        s01 := '';
        s02 := '';
        for jj := mm downto j+1 do
        begin
          s01 := ' '+s01;
          s02 := s2[jj] + s02;
        end;
        BackV2(i,j,s01,s02);
      end;
      j := mm;
      for k := 1 to nimax do
      begin
        i := imax[k];
        s01 := '';
        s02 := '';
        for ii := nn downto i+1 do
        begin
          s01 := s1[ii]+s01;
          s02 := ' ' + s02;
        end;
        BackV2(i,j,s01,s02);
      end;
      s01 := '';
      s02 := '';
      i := nn;
      j := mm;
      if dvsmax <> dv[nn,mm] then
        exit;
    end;
    if da[i,j] and fleft = fleft then
      BackV2(i,j-1, ' ' + s01, s2[j] + s02);
    if da[i,j] and fup = fup then
      BackV2(i-1,j, s1[i] + s01, ' ' + s02);
    if da[i,j] and fdiag = fdiag then
      BackV2(i-1,j-1, s1[i] + s01, s2[j] + s02);
  end;
end;

procedure Alignment29;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Пусть \E \= алфавит, используемый для строк {S}_1 и {S}_2, \E{''} \= алфавит \E,\\'+
'дополненный пробелом. Для {x}, {y} из \E{''} через {s}({x},\,{y}) (=\,{s}({y},\,{x})) обозначается\\'+
'\Iоценка\i {x} и {y} \= целочисленный вес пары символов {x} и {y} при их выравнивании\\'+
'друг напротив друга. Симметричная матрица, элементами которой являются\\'+
'значения {s}({x},\,{y}), называется \Iматрицей оценок\i. Если ({A}_1,~{A}_2) \= некоторое\\'+
'выравнивание строк {S}_1 и {S}_2 (см.~\5), то \Iполная оценка выравнивания\i\\'+
'определяется как сумма всех оценок {s}({A}_1[{i}],\,{A}_2[{i}]), {i}\,=\,1,\,\.,\,|{A}_1|.\\'+
'Дано выравнивание ({A}_1,~{A}_2) и число {m} (<\,10); алфавит представляет собой\\'+
'{m} первых строчных латинских букв. Также дана матрица оценок (порядка {m}\,+\,1),\\'+
'в которой строчки и столбцы соответствуют латинским буквам, расположенным\\'+
'в алфавитном порядке, а пробел соответствует последней строчке и столбцу\\'+
'(в силу симметричности матрицы оценок приводится только ее \Iверхняя\i\\'+
'\Iтреугольная часть\i, т.\,е. элементы, лежащие на главной диагонали\\'+
'и выше нее). Найти полную оценку данного выравнивания.\\'+
'\P\SПримечание\s. В матрице оценок элементы, лежащие на главной диагонали,\\'+
'как правило, неотрицательны, а остальные элементы отрицательны; таким\\'+
'образом, наличие пробелов или несовпадающих символов в выравнивании приводит\\'+
'к уменьшению полной оценки выравнивания за счет \<штрафов\>, связанных\\'+
'с пробелами и несовпадениями. При этом оценка для непробельных символов {x}, {y}\\'+
'обычно больше суммарной оценки за два пробела, расположенных напротив этих\\'+
'символов: {s}({x},\,{y})\,>\,{s}({x},\,\_)\,+\,{s}(\_,\,{y}) (символ \<\_\> обозначает пробел);\\'+
'иными словами, штраф за выравнивание различных символов меньше штрафа\\'+
'за добавление пробелов напротив этих символов).'
);
  m := Rand(4,8);
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcD;
  t := BackD;
  AlignD(s1,s2,t,s01,s02);
  until max(length(s01),length(s02)) < 30;
  CalcSS(-9,9);
  DataS('A_1 = ',s01,3,1);
  DataS('A_2 = ',s02,3,2);
  DataComment(Rule(4,length(t)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  k := 0;
  for i := 1 to length(s01) do
    k := k + ss0(s01[i],s02[i]);
  ResultN('',k,0,3,2);
  SetTestCount(5);
end;


procedure Alignment30;
var
  i,j: integer;
function V(i,j: integer): integer;
var k: integer;
begin
  inc(cnt);
  result := 0;
  if i = 0 then
    for k := 1 to j do
      result := result + ss0(' ',s2[k])
  else
    if j = 0 then
    for k := 1 to i do
      result := result + ss0(s1[k],' ')
    else
      result := max3(V(i,j-1)+ss0(' ',s2[j]), V(i-1,j)+ss0(s1[i],' '), V(i-1,j-1)+ss0(s1[i],s2[j]), ff,aa,cc);

end;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'\IОптимальным оценочным выравниванием\i строк {S}_1 и {S}_2 (или просто \Iоптимальным\i\\'+
'\Iвыравниванием\i) называется любое выравнивание, имеющее максимальную полную\\'+
'оценку (определение оценки приведено в \1). При этом сама\\'+
'максимальная полная оценка называется \Iсходством строк\i {S}_1 и {S}_2.\\'+
'Даны строки {S}_1, {S}_2 и числа {k}_1, {k}_2 (0\,\l\,{k}_1\,\l\,|{S}_1|, 0\,\l\,{k}_2\,\l\,|{S}_2|). Кроме того, дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских\\'+
'букв, и матрица оценок (структура матрицы описана в \1).\\'+
'Через {V}({i},\,{j}) обозначается сходство строк {S}_1[1..{i}] и {S}_2[1..{j}]. Справедливы\\'+
'следующие соотношения (символ подчеркивания \<\_\> обозначает пробел):\\'+
'\(\X для любого {i} {V}({i},\,0)\,=\,\E_{k=1,\.,i}{s}({S}_1[{k}],\,\_);\|\\'+
'\X для любого {j} {V}(0,\,{j})\,=\,\E_{k=1,\.,j}{s}(\_,\,{S}_2[{k}]);\|\\'+
'\X если {i}\,>\,0 и {j}\,>\,0, то {V}({i},\,{j})\,=\,max\{{V}({i}\,\-\,1,\,{j})\,+\,{s}({S}_1[{i}],\,\_), {V}({i},\,{j}\,\-\,1)\,+\,{s}(\_,\,{S}_2[{j}]),\\'+
'{V}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\}.\) Найти {V}({k}_1,\,{k}_2), используя рекурсивную\\'+
'функцию, выполняющую вычисления по приведенным формулам (так называемая\\'+
'\Iнисходящая рекурсия\i). Вывести значение {V}({k}_1,\,{k}_2) и количество рекурсивных\\'+
'вызовов функции, которое потребовалось для его вычисления.\\'+
'\P\SПримечание\s. Редакционное расстояние для двух строк (см.~\27) служит\\'+
'\Iмерой различия\i этих строк (более \<близкие\> строки имеют меньшее редакционное\\'+
'расстояние). В противоположность этой характеристике, значение сходства\\'+
'строк будет тем больше, чем более \<близкими\> будут строки. В ряде алгоритмов\\'+
'(в частности, при \Iлокальном выравнивании\i строк) оказывается более удобным\\'+
'использовать меру сходства, чем меру различия. Приведенный алгоритм, как\\'+
'и алгоритм нахождения редакционного расстояния (см.~\26), является\\'+
'алгоритмом \Iдинамического программирования\i.'
);
  m := Rand(4,9);
  repeat
  MakeStr(20,29,m,s1,s2);
  until (m<9) or (max(length(s1),length(s2))<25);
  cnt := 0;
  k1 := Rand(0,8);//length(s1));
  k2 := Rand(0,8);//length(s2));
  DataS('S_1 = ',S1,3,1);
  DataS('S_2 = ',S2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataN('k_1 = ',k1,50,2,1);
  DataN('k_2 = ',k2,60,2,1);
  DataN('m = ', m, 70, 2,1);
  CalcSS(-9,9);
  ShowSS(3);

  ResultN('V(k_1,k_2) = ',V(k1,k2),0,2,2);
  ResultN('Количество рекурсивных вызовов: ',cnt,0,4,3);
  SetTestCount(5);
end;


procedure Alignment31;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
TaskTextExt(
'Даны строки {S}_1 и {S}_2. Кроме того, дано число {m} (<\,10) \= размер алфавита,\\'+
'состоящего из первых строчных латинских букв, и матрица оценок (структура\\'+
'матрицы описана в \2). Для эффективного вычисления сходства\\'+
'строк {V}(|{S}_1|,\,|{S}_2|) по формулам из \1 можно использовать \Iметод\i\\'+
'\Iвосходящей рекурсии\i, основанный на последовательном вычислении элементов\\'+
'вспомогательной матрицы {V} размера (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1) (действия при заполнении\\'+
'матрицы {V} аналогичны действиям при заполнении матрицы {D}, описанным\\'+
'в \26). Элемент, расположенный в последней строчке и последнем\\'+
'столбце матрицы {V}, определяет значение сходства данных строк. Используя\\'+
'метод восходящей рекурсии, найти матрицу {V} и вывести элементы ее двух\\'+
'последних строчек: {V}_{n\-1,\,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {V}_{n,\,j}, {j}\,=\,0,\,\.,\,|{S}_2|, где {n}\,=\,|{S}_1|.'
);
  m := Rand(4,9);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for j := 0 to i do
  begin
    y := min(dv[nn-1,j],dv[nn,j]);
    if y < k then
      k := y;
  end;
  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(i,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('V_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dv[nn-1,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('V_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dv[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment32;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Кроме того, дано число {m} (<\,10) \= размер алфавита,\\'+
'состоящего из первых строчных латинских букв, и матрица оценок (структура\\'+
'матрицы описана в \3). Дополнить метод восходящей рекурсии\\'+
'(см.~\1) так, чтобы он позволял найти не только значение\\'+
'сходства строк, но и количество различных вариантов оптимального\\'+
'выравнивания. Для этого дополнительно ввести в рассмотрение матрицу {K}\\'+
'того же размера, что и матрица {V}, и заполнять эту матрицу синхронно с {V}\\'+
'по следующим правилам: {K}_{0,j}\,=\,1, {K}_{i,0}\,=\,1, значение {K}_{i,j} при {i}\,>\,0 и {j}\,>\,0\\'+
'равно сумме значений тех элементов {K}_{i,j\-1}, {K}_{i\-1,j}, {K}_{i\-1,j\-1}, которые\\'+
'соответствуют элементам матрицы {V}, дающим максимум в формуле для {V}({i},\,{j}).\\'+
'Элемент, расположенный в последней строчке и последнем столбце матрицы {K},\\'+
'равен количеству вариантов оптимального выравнивания. Вывести\\'+
'последние строчки матриц {V} и~{K}.'
);
  m := Rand(4,9);
  repeat
  MakeStr(14,18,m,s1,s2);
  i := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for j := 0 to i do
  begin
    y := min(dv[nn-1,j],dv[nn,j]);
    if y < k then
      k := y;
  end;
  k1 := 0;
  for j := 0 to i do
    if dk[nn,j] > 999 then
    begin
      k1 := 1;
      break;
    end;
  until (k1 = 0) and (k >= -99);
  s0 := '';
  for j := 0 to i do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(i,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  ResultComment(s0,0,1);
  ResultComment('V_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,2);
  for j := 0 to i do
    ResultN('',dv[nn,j],Center(j+1, i+1, 3, 1), 3, 3);
  ResultComment('K_{n,j}, n = |S_1|, j = 0,\.,|S_2|:',0,4);
  for j := 0 to i do
    ResultN('',dk[nn,j],Center(j+1, i+1, 3, 1), 5, 3);
  SetTestCount(5);
end;

procedure Alignment33;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \4). Кроме того, дана матрица {V}, полученная методом восходящей\\'+
'рекурсии (см.~\2). Известно, что имеется единственный вариант\\'+
'оптимального выравнивания для {S}_1 и {S}_2. Найти это выравнивание ({A}_1,~{A}_2),\\'+
'выполняя \Iобратный проход\i по матрице {V}, начиная с ее правого нижнего\\'+
'элемента и заканчивая левым верхним элементом; при этом для каждого\\'+
'элемента {V}_{i,j} при {i}\,>\,0 и {j}\,>\,0 перемещение выполняется в тот из элементов\\'+
'{V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, на котором достигается максимум в формуле для {V}({i},\,{j})\\'+
'(см.~\3); для элементов {V}_{0,j} перемещение всегда выполняется влево,\\'+
'а для элементов {V}_{i,0} \= вверх. Перемещение влево соответствует вставке\\'+
'пробела в строку {A}_1 и текущего элемента {S}_2 в строку {A}_2, перемещение\\'+
'вверх \= вставке пробела в строку {A}_2 и текущего элемента {S}_1 в строку {A}_1,\\'+
'перемещение по диагонали влево и вверх соответствует вставке в {A}_1 и {A}_2\\'+
'текущих элементов {S}_1 и {S}_2 соответственно (символы в строках {S}_1 и {S}_2\\'+
'перебираются с конца, строки {A}_1 и {A}_2 заполняются от конца к началу). Вывести\\'+
'найденные строки {A}_1 и {A}_2.'
);
  repeat
  repeat
  m := Rand(4,9);
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] = 1) and (k >=-99);
  BackV(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);

  SetTestCount(5);
end;

procedure Alignment34;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \5). Кроме того, дана матрица {V}, полученная методом восходящей\\'+
'рекурсии (см.~\3). Найти один из вариантов оптимального выравнивания\\'+
'для {S}_1 и {S}_2, выполняя обратный проход по матрице {V} (см.~\1). Если\\'+
'для некоторого элемента {V}_{i,j} возможны перемещения более чем в один из его\\'+
'соседних элементов {V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, то предпочтение отдается\\'+
'перемещению влево (соответствующему вставке пробела в первую строку),\\'+
'а при его невозможности \= перемещению вверх (соответствующему вставке\\'+
'пробела во вторую строку). Вывести найденное выравнивание ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] > 1) and (k >=-99);
  BackV(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  SetTestCount(5);
end;

procedure Alignment35;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \6). Кроме того, дана матрица {V}, полученная методом восходящей\\'+
'рекурсии (см.~\4). Найти все варианты оптимального выравнивания\\'+
'для {S}_1 и {S}_2, выполняя обратный проход по матрице {V} (см.~\2). Если\\'+
'для некоторого элемента {V}_{i,j} возможны перемещения более чем в один\\'+
'из его соседних элементов {V}_{i,j\-1}, {V}_{i\-1,j}, {V}_{i\-1,j\-1}, то использовать\\'+
'следующий порядок перебора допустимых в данной позиции действий:\\'+
'вставка пробела в первую строку и текущего символа во вторую строку\\'+
'(перемещение влево), вставка пробела во вторую строку и текущего символа\\'+
'в первую строку (перемещение вверх), вставка текущих символов в обе строки\\'+
'(перемещение по диагонали). Реализовать один шаг обратного хода в виде\\'+
'рекурсивной функции, количество собственных вызовов которой зависит\\'+
'от числа возможных перемещений в соседние элементы. Вывести\\'+
'все найденные оптимальные выравнивания (порядок вывода\\'+
'выравниваний должен соответствовать порядку их нахождения).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 8) and (k >=-99);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,y,3);
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);

  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment36;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \7). Найти значение сходства и один из вариантов оптимального\\'+
'выравнивания для {S}_1 и {S}_2, используя метод восходящей рекурсии для построения\\'+
'матрицы~{V} (см.~\5) и выполняя обратный проход по матрице~{V}\\'+
'(см.~\3). Выбор варианта оптимального выравнивания\\'+
'выполнять в соответствии с указаниями \2.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  CalcV;
  until dk[nn,mm] > 1;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  BackV(s01,s02);
  ResultN('Значение сходства: ',dv[nn,mm],0,2,2);
  ResultS('A_1 = ',s01,3,3);
  ResultS('A_2 = ',s02,3,4);
  ResultComment(Rule(4,length(s01)),4,5);
  SetTestCount(5);
end;

procedure Alignment37;
var
  i,j: integer;
begin
  CreateTask(Subgroup3);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \8). Найти значение сходства и все варианты оптимального\\'+
'выравнивания для {S}_1 и {S}_2, используя метод восходящей рекурсии для построения\\'+
'матрицы~{V} (см.~\6) и выполняя обратный проход по матрице~{V}\\'+
'(см.~\4). Перебор вариантов оптимального выравнивания выполнять\\'+
'в соответствии с указаниями \2.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStr(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  CalcV;
  until (dk[nn,mm] > 1) and (dk[nn,mm] <= 8);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  case cnt of
  2..3: y := 1;
  else  y := 0;
  end;
  ResultN('Значение сходства: ',dv[nn,mm],0,1,2);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//---------------------------------------------------------------------------


procedure MakeStrS(a,b,m: integer; var s1,s2: string);
// с бесплатными граничными пробелами
var i,k1,k2: integer;
begin
  DType := 2;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
  k1 := Rand(length(s1) div 3, length(s1) div 2);
  k2 := Rand(length(s2) div 3, length(s2) div 2);
  case Random(8) of
  0: Delete(s1,1, k1);
  1: Delete(s1,k1,length(s1));
  2: Delete(s2,1, k2);
  3: Delete(s2,k2,length(s2));
  4: begin
       Delete(s1,1, k1);
       Delete(s2,k2,length(s2));
     end;
  5: begin
       Delete(s1,k1,length(s1));
       Delete(s2,1, k2);
     end;
  end;
end;


procedure Alignment38;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \9). Найти значение сходства для строк {S}_1 и {S}_2\\'+
'(см.~\8) при дополнительном предположении, что все граничные\\'+
'пробелы являются \I\<бесплатными\>\i, т.\,е. имеют нулевую оценку (под граничными\\'+
'пробелами понимаются пробелы, появившиеся в начале и конце любой из строк\\'+
'в результате их выравнивания). Если через {V''}({i},\,{j}) обозначить сходство\\'+
'строк {S}_1[1..{i}] и {S}_2[1..{j}]  при условии бесплатных \Iначальных\i пробелов,\\'+
'то рекуррентные формулы для {V''}({i},\,{j}) будут аналогичны формулам для {V}({i},\,{j}),\\'+
'приведенным в \8; необходимо лишь изменить базовые условия,\\'+
'положив для любого {i} {V''}({i},\,0)\,=\,0 и для любого {j} {V''}(0,\,{j})\,=\,0.\\'+
'Для эффективного нахождения значений {V''}({i},\,{j}) следует использовать \Iметод\i\\'+
'\Iвосходящей рекурсии\i, основанный на последовательном вычислении элементов\\'+
'вспомогательной матрицы {V''} размера (|{S}_1|\,+\,1)\,\x\,(|{S}_2|\,+\,1) (действия при заполнении\\'+
'матрицы {V''} аналогичны действиям при заполнении матрицы {D}, описанным\\'+
'в \33). Чтобы учесть условие бесплатности \Iконечных\i пробелов,\\'+
'в качестве значения сходства для строк {S}_1 и {S}_2 следует выбрать наибольшее\\'+
'значение среди элементов матрицы {V''}, расположенных в ее последней строчке\\'+
'или последнем столбце. Вывести найденное значение сходства для {S}_1 и {S}_2,\\'+
'а также элементы последней строчки и последнего столбца матрицы {V''}:\\'+
'{V''}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {V''}_{i,p}, {i}\,=\,0,\,\.,\,{n}, где {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.\\'+
'\P\SПримечание\s. Бесплатность граничных пробелов приводит к тому,\\'+
'что при оптимальном оценочном выравнивании одна строка будет иметь\\'+
'тенденцию выравниваться по внутренней части другой или суффикс одной\\'+
'строки \= по префиксу другой. Таким образом, указанное дополнительное\\'+
'условие следует применять, если требуется распознать ситуацию, при которой\\'+
'одна строка содержит подстроку, \<близкую\> другой строке, или суффикс\\'+
'одной строки \<близок\> префиксу другой.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for j := 0 to mm do
    if dv[nn,j] < k then
      k := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm] < k then
      k := dv[i,mm];
  until (k >= -99) and (njmax + nimax > 0) and (res>0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('Значение сходства: ', res,0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
//  ResultComment('V''_{n,j}, j = 0,\.,m:',0,2);
  ResultComment('V''_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
//  ResultComment('V''_{i,m}, i = 0,\.,n:',0,4);
  ResultComment('V''_{i,p}:',2,4);
  for i := 0 to nn do
    ResultN('',dv[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
  DType := 0;
  Str(CalcV:3,s00);
  ResultComment('Примечание. Значение сходства с учетом граничных пробелов: '+s00,2,5);
  SetTestCount(5);
end;

procedure Alignment39;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \10). Кроме того, дана матрица {V''}, полученная методом восходящей\\'+
'рекурсии (см.~\1). Найти один из вариантов оптимального выравнивания\\'+
'для {S}_1 и {S}_2 при условии бесплатных граничных пробелов, модифицировав\\'+
'требуемым образом алгоритм обратного прохода по матрице {V''}\\'+
'(см.~\6). Если в последней строчке или последнем столбце матрицы {V''}\\'+
'имеется несколько элементов с максимальным значением, то использовать вариант\\'+
'оптимального выравнивания ({A}_1,~{A}_2), в котором строка {A}_1 содержит наибольшее\\'+
'число конечных пробелов, а при отсутствии вариантов с конечными пробелами\\'+
'для {A}_1 \= вариант, в котором наибольшее число конечных пробелов содержит\\'+
'строка {A}_2. На следующих этапах построения оптимального выравнивания выбор\\'+
'варианта выполнять в соответствии с указаниями \5. Вывести\\'+
'найденное выравнивание ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackV(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)));
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V'':',dv,y,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  CalcV;
  BackV(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('Примечание. Справа приведен вариант выравнивания с учетом граничных пробелов.',2,5);
  SetTestCount(5);
end;

procedure Alignment40;
var
  i,j: integer;
  b,b1: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \11). Кроме того, дана матрица {V''}, полученная методом восходящей\\'+
'рекурсии (см.~\2). Найти все варианты оптимального выравнивания\\'+
'для {S}_1 и {S}_2 при условии бесплатных граничных пробелов, модифицировав\\'+
'требуемым образом алгоритм обратного прохода по матрице {V''} (см.~\7).\\'+
'Варианты оптимального выравнивания ({A}_1,~{A}_2) перебирать следующим образом:\\'+
'при наличии вариантов с конечными пробелами в строке {A}_1 перебирать их\\'+
'в порядке убывания количества этих пробелов; затем, при наличии вариантов\\'+
'с конечными пробелами в строке {A}_2, перебирать их в порядке убывания этих\\'+
'пробелов; затем, при наличии варианта выравнивания с отсутствующими конечными\\'+
'пробелами, обрабатывать этот вариант. Перебор вариантов с совпадающим числом\\'+
'конечных пробелов выполнять в соответствии с указаниями \5. Вывести\\'+
'все найденные оптимальные выравнивания.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200);
  CalcSS(-9,9);
  CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V'':',dv,y,3);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;

  SetTestCount(5);
end;

procedure Alignment41;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \12). Найти значение сходства и один из вариантов оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при условии бесплатных граничных пробелов, используя\\'+
'метод восходящей рекурсии для построения матрицы~{V''} (см.~\3)\\'+
'и выполняя обратный проход по матрице~{V''} (см.~\2). Выбор варианта\\'+
'оптимального выравнивания выполнять в соответствии с указаниями \2.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and (m<9) or (max(mm,nn)<25);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackV(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)))
        and (length(s01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ResultN('Значение сходства: ',res,3,1,2);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  res := CalcV;
  BackV(s01,s02);
  Str(res:3,s00);
  ResultComment('Значение сходства: '+s00,43,1);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('Примечание. Справа приведен вариант выравнивания с учетом граничных пробелов.',2,5);

  SetTestCount(5);
end;

procedure Alignment42;
var
  i,j,b,b1,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \13). Найти значение сходства и все варианты оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при условии бесплатных граничных пробелов,\\'+
'используя метод восходящей рекурсии для построения матрицы~{V''}\\'+
'(см.~\4) и выполняя обратный проход по матрице~{V''}\\'+
'(см.~\3). Перебор вариантов оптимального выравнивания выполнять\\'+
'в соответствии с указаниями \2.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2);
  CalcSS(-9,9);
  res := CalcV;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackV2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ResultN('Значение сходства: ',res,0,1,2);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//-------------------------------------------------------------------------
var ws, wg: integer;

procedure CalcSSW(smin,smax: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := Rand(0,smax);
  ws := Rand(0,3);
  wg := Rand(6,15);
  for i := 1 to m-1 do
    for j := i+1 to m do
    begin
    ss[i,j] := Rand(-3,-1);
    ss[j,i] := ss[i,j];
    end;
  for i := 1 to m do
  begin
    ss[i,m+1] := ws;
    ss[m+1,i] := ws;
  end;
end;

function ShowSSW(y: integer): integer;
// возвращает следующую позицию Y раздела исходных данных
var i,j: integer;
begin
  for i := 1 to m do
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m+i,19,4,0),y);
  DataComment('Верхняя треугольная часть', 7, y+1);
  DataComment('симметричной матрицы оценок:', 6, y+2);
  for i := 1 to m do
  begin
    DataComment(' \<' + chr(96+i) + '\>',Center(19-m,19,4,0),y+i);
    for j := i to m do
      DataN('',ss[i,j],Center(19-m+j,19,3,1)-1,y+i,3);
  end;
  result := y+m+1;
end;

function CalcWOrig: integer;
var i,j,k,k1,k2,xx,kk: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    we[i,0] := -2*wg-i*ws;
    wf[i,0] := 0;//dv[i,0];//!!!!!!!!!!!!!!
    if DType = 0 then
      dv[i,0] := -wg-i*ws;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    we[0,j] := 0;//dv[0,j];//!!!!!!!!!
    wf[0,j] := -2*wg-j*ws;
    if DType = 0 then
      dv[0,j] := -wg-j*ws;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  dv[0,0] := 0;
  we[0,0] := 0;
  wf[0,0] := 0;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
      xx := -maxint;
      for kk := 0 to j-1 do
        if dv[i,kk]-wg-(j-kk)*ws > xx then
          xx := dv[i,kk]-wg-(j-kk)*ws;
      we[i,j] := xx;
      xx := -maxint;
      for kk := 0 to i-1 do
        if dv[kk,j]-wg-(i-kk)*ws > xx then
          xx := dv[kk,j]-wg -(i-kk)*ws;
      wf[i,j] := xx;
{      if j = 1 then
        we[i,j] := dv[i,0]-wg-ws
        else
      we[i,j] := max(we[i,j-1],dv[i,j-1]-wg)-ws;
      if i = 1 then
        wf[i,j] := dv[0,j]-wg-ws
        else
      wf[i,j] := max(wf[i-1,j],dv[i-1,j]-wg)-ws;}
      dv[i,j] := max3(we[i,j], wf[i,j], dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;

function CalcW: integer;
var i,j,k,k1,k2,xx,kk: integer;
begin
  k1 := length(s1);
  k2 := length(s2);
  for i := 0 to k1 do
  begin
    dv[i,0] := 0;
    we[i,0] := -2*wg-i*ws;
    wf[i,0] := 0;//dv[i,0];//!!!!!!!!!!!!!!
    if DType = 0 then
      dv[i,0] := -wg-i*ws;
    dk[i,0] := 1;
    df[i,0] := fup;
    da[i,0] := fup;
  end;
  for j := 0 to k2 do
  begin
    dv[0,j] := 0;
    we[0,j] := 0;//dv[0,j];//!!!!!!!!!
    wf[0,j] := -2*wg-j*ws;
    if DType = 0 then
      dv[0,j] := -wg-j*ws;
    dk[0,j] := 1;
    df[0,j] := fleft;
    da[0,j] := fleft;
  end;
  dv[0,0] := 0;
  we[0,0] := 0;
  wf[0,0] := 0;
  for i := 1 to k1 do
    for j := 1 to k2 do
    begin
{      xx := -maxint;
      for kk := 0 to j-1 do
        if dv[i,kk]-wg-(j-kk)*ws > xx then
          xx := dv[i,kk]-wg-(j-kk)*ws;
      we[i,j] := xx;
      xx := -maxint;
      for kk := 0 to i-1 do
        if dv[kk,j]-wg-(i-kk)*ws > xx then
          xx := dv[kk,j]-wg -(i-kk)*ws;
      wf[i,j] := xx;}

(* ВАЖНО! В книге (с.302) в формулах содержится ошибка, не позволяющая
правильно вычислять значения E(i,1) и F(1,j). Для того чтобы эти значения
вычислялись правильно (т.е. в соответствии с более общими формулами,
приведенными на с.301), необходимо изменить формулы для E(i,0) и F(0,j):
вместо
E(i,0)=-W_g-i*W_s и F(0,j)=-W_g-j*W_s
необходимо положить
E(i,0)=-2W_g-i*W_s и F(0,j)=-2W_g-j*W_s
Указанное изменение не повлияет на остальные формулы, так как значения
E(i,0) и F(0,j) требуются в методе восходящей рекурсии
только для рекуррентного вычисления E(i,1) и F(1,j), а при обратном ходе
вообще не используются.
*)

//      if j = 1 then
//        we[i,j] := dv[i,0]-wg-ws
//        else
      we[i,j] := max(we[i,j-1],dv[i,j-1]-wg)-ws;
//      if i = 1 then
//        wf[i,j] := dv[0,j]-wg-ws
//        else
      wf[i,j] := max(wf[i-1,j],dv[i-1,j]-wg)-ws;
      dv[i,j] := max3(we[i,j], wf[i,j], dv[i-1,j-1]+ss0(s1[i],s2[j]), ff,aa,cc);
      dk[i,j] := 0;
      if aa and fleft = fleft then dk[i,j] := dk[i,j] + dk[i,j-1];
      if aa and fup = fup then dk[i,j] := dk[i,j] + dk[i-1,j];
      if aa and fdiag = fdiag then dk[i,j] := dk[i,j] + dk[i-1,j-1];
      df[i,j] := ff;
      da[i,j] := aa;
    end;
  result := dv[k1,k2];
  if DType = 2 then
    result := FreeSpaces;
end;


procedure BackW(var s01, s02: string);
var s: string;
    i,j,ii,jj: integer;
begin
  nn := Length(s1);
  mm := Length(s2);
  s01 := '';
  s02 := '';
  i := nn;
  j := mm;
  if DType = 2 then
    if njmax > 0 then
    begin
      j := jmax[1];
      for jj := mm downto j+1 do
      begin
        s01 := ' '+s01;
        s02 := s2[jj] + s02;
      end;
    end
    else
    if nimax > 0 then
    begin
      i := imax[1];
      for ii := nn downto i+1 do
      begin
        s01 := s1[ii]+s01;
        s02 := ' ' + s02;
      end;
    end;
  while i+j <> 0 do
  begin
    if i = 0 then //left
    begin
      s01 := ' ' + s01;
      s02 := s2[j] + s02;
      j := j-1;
    end
    else
    if j = 0 then //
    begin
      s01 := s1[i] + s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    if df[i,j] = fleft then
    begin
      jj := j;
      repeat
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
      until dv[i,j]=dv[i,jj]+wg+(jj-j)*ws
    end
    else
    if df[i,j] = fup then
    begin
      ii := i;
      repeat
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
      until dv[i,j]=dv[ii,j]+wg+(ii-i)*ws
    end
    else
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
  end;
end;


function toStr(i,j: integer):string;
var s: string;
begin
  Str(i,s);
  result := '('+s + ',';
  Str(j,s);
  result := result + s + ')';
end;

procedure BackW2(i,j: integer; s01, s02: string);
var mm,nn,ii,jj,i0,j0: integer;
    s001,s002: string;
begin

  if i+j = 0 then
  begin
    cnt := cnt + 1;
    if cnt <= nmax then
    begin
      t01[cnt] := s01;
      t02[cnt] := s02;
    end;
  end
  else
  begin
    if (DType = 2) and (i = length(s1)) and (j = length(s2)) then
    begin
      nn := Length(s1);
      mm := Length(s2);
      i := nn;
      for k := 1 to njmax do
      begin
        j := jmax[k];
        s01 := '';
        s02 := '';
        for jj := mm downto j+1 do
        begin
          s01 := ' '+s01;
          s02 := s2[jj] + s02;
        end;
        BackW2(i,j,s01,s02);
      end;
      j := mm;
      for k := 1 to nimax do
      begin
        i := imax[k];
        s01 := '';
        s02 := '';
        for ii := nn downto i+1 do
        begin
          s01 := s1[ii]+s01;
          s02 := ' ' + s02;
        end;
        BackW2(i,j,s01,s02);
      end;
      s01 := '';
      s02 := '';
      i := nn;
      j := mm;
      if dvsmax <> dv[nn,mm] then
        exit;
    end;
    if i*j=0 then
    begin
      if i = 0 then //left
            BackW2(i,j-1, ' ' + s01, s2[j] + s02)
      else
      if j = 0 then //up
            BackW2(i-1,j, s1[i] + s01, ' ' + s02);
    end
    else
    begin
    i0 := i;
    j0 := j;
    s001 := s01;
    s002 := s02;
    if da[i,j] and fleft = fleft then
    begin
      jj := j;
      repeat
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
      until dv[i,j]=dv[i,jj]+wg+(jj-j)*ws;
      BackW2(i,j, s01, s02);
    end;
    i := i0;
    j := j0;
    s01 := s001;
    s02 := s002;
    if da[i,j] and fup = fup then
    begin
      ii := i;
      repeat
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
      until dv[i,j]=dv[ii,j]+wg+(ii-i)*ws;
      BackW2(i,j, s01, s02);
    end;
    i := i0;
    j := j0;
    s01 := s001;
    s02 := s002;
    if da[i,j] and fdiag = fdiag then
    begin
      BackW2(i-1,j-1, s1[i] + s01, s2[j] + s02);
    end;
    end;
  end;
end;

var dv0, we0, wf0: matr;

procedure Alignment43;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'\IПропуском\i (англ. gap) называется любой последовательный ряд пробелов в строке\\'+
'выравнивания, ограниченный непробельными символами или началом/концом строки.\\'+
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок, аналогичная матрице, описанной\\'+
'в \14, но содержащая только {m} строчек и {m} столбцов (в матрице\\'+
'отсутствуют строчка и столбец, соответствующие символу пробела, поскольку\\'+
'все оценки, связанные с пробелами считаются одинаковыми и равными \-{w}_s).\\'+
'Найти значение сходства для строк {S}_1 и {S}_2 (см.~\13)\\'+
'при дополнительном предположении, что каждый пропуск вносит в это значение\\'+
'\<штраф\>, равный \-{w}_g (наряду со штрафами \-{w}_s, вносимыми каждым пробелом,\\'+
'входящим в пропуск). Если через {W}({i},\,{j}) обозначить сходство строк {S}_1[1..{i}]\\'+
'и {S}_2[1..{j}] при учете пропусков, то рекуррентные формулы для {W}({i},\,{j}) примут\\'+
'следующий вид (в данных формулах используются вспомогательные функции {E}({i},\,{j})\\'+
'и {F}({i},\,{j})): \(\X {W}(0,\,0)\,=\,0;\| \X для любого {i}\,>\,0 {W}({i},\,0)\,=\,\-{w}_g\,\-\,{i}\*{w}_s, {E}({i},\,0)\,=\,\-2\*{w}_g\,\-\,{i}\*{w}_s;\|\\'+
'\X для любого {j}\,>\,0 {W}(0,\,{j})\,=\,\-{w}_g\,\-\,{j}\*{w}_s, {F}(0,\,{j})\,=\,\-2\*{w}_g\,\-\,{j}\*{w}_s;\| \X для {i}\,>\,0 и {j}\,>\,0\\'+
'{W}({i},\,{j})\,=\,max\{{E}({i},\,{j}), {F}({i},\,{j}), {W}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\},\\'+
'где {E}({i},\,{j})\,=\,max\{{E}({i},\,{j}\,\-\,1), {W}({i},\,{j}\,\-\,1)\,\-\,{w}_g\}\,\-\,{w}_s, {F}({i},\,{j})\,=\,max\{{F}({i}\,\-\,1,\,{j}),\\'+
'{W}({i}\,\-\,1,\,{j})\,\-\,{w}_g\}\,\-\,{w}_s.\) Для эффективного нахождения значений {W}({i},\,{j})\\'+
'использовать метод восходящей рекурсии, основанный на последовательном\\'+
'вычислении элементов вспомогательных матриц {E}, {F} и {W} (действия\\'+
'при заполнении матриц аналогичны действиям при заполнении матрицы {D},\\'+
'описанным в \38). Значение сходства строк {S}_1 и {S}_2 при учете пропусков\\'+
'будет равно {W}(|{S}_1|,\,|{S}_2|). Вывести найденное значение сходства для {S}_1 и {S}_2,\\'+
'а также элементы последней строчки матрицы {E} и последнего столбца матрицы {F}:\\'+
'{E}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {F}_{i,p}, {i}\,=\,0,\,\.,\,{n}, где {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.\\'+
'\P\SПримечание\s. Учет пропусков часто позволяет создавать выравнивания, которые\\'+
'лучше согласуются с анализируемыми (в частности, биологическими) моделями.\\'+
'Большее значение {w}_g будет приводить к тому, что число пропусков\\'+
'в выравнивании уменьшится, и полученные в результате выравнивания строки\\'+
'распадутся на несколько \<крупных\> подстрок. Меньшие значения {w}_g будут\\'+
'приводить к более фрагментированным выравниваниям. Вес отдельного пробела {w}_s\\'+
'может полагаться равным~0, в этом случае при выравнивании будет учитываться\\'+
'только количество пропусков, но не их размер. Рассмотренный в задании\\'+
'вариант моделирования пропусков называется \Iмоделью с аффинным весом\i,\\'+
'так как вес одного пропуска длины {q} определяется аффинной функцией {w}_g\,+\,{q}\*{w}_s.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for j := 0 to mm do
    if we[nn,j] < k then
      k := we[nn,j];
  for i := 0 to nn do
    if wf[i,mm] < k then
      k := wf[i,mm];
  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  ShowSSW(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';

  ResultN('Значение сходства: ', dv[nn,mm],0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
  ResultComment('E_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',we[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
  ResultComment('F_{i,m}:',2,4);
  for i := 0 to nn do
    ResultN('',wf[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
//  DType := 0;
//  Str(CalcV:3,s00);
//  ResultComment('Примечание. Значение сходства с учетом граничных пробелов: '+s00,2,5);
(*  dv0 := dv;
  we0 := we;
  wf0 := wf;
  CalcWOrig;
  k := 0;
  for i := 0 to nn do
    for j := 0 to nn do
      if (dv0[i,j]<>dv[i,j])or({(i>0)and (j>0) and} ((we0[i,j] <> we[i,j]) or (wf0[i,j] <> wf[i,j]))) then
      begin
        k := 1;
        break;
      end;
  if k=1{dv0[nn,mm]<>dv[nn,mm]} then
  ResultComment('!!!!',90,5);*)
  SetTestCount(5);
end;

procedure Alignment44;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \1). Кроме того, дана матрица {W}, полученная методом восходящей\\'+
'рекурсии (см.~\1), и вспомогательные матрицы {E} и {F} (для матриц {E} и {F}\\'+
'элементы нулевых строк и столбцов не приводятся). Найти один из вариантов\\'+
'оптимального выравнивания для {S}_1 и {S}_2 при учете пропусков, используя\\'+
'следующий алгоритм обратного прохода по матрице {W} (ср. с~\11).\\'+
'Обратный проход по матрице {W} начинается с ее правого нижнего элемента\\'+
'и заканчивается левым верхним элементом. Для элементов {W}_{0,j} перемещение\\'+
'всегда выполняется влево, для элементов {W}_{i,0} \= вверх. При {i}\,>\,0 и {j}\,>\,0\\'+
'перемещение выполняется влево в случае {W}_{i,j}\,=\,{E}_{i,j}, вверх в случае {W}_{i,j}\,=\,{F}_{i,j}\\'+
'и по диагонали (влево и вверх) в случае {W}_{i,j}\,=\,{W}_{i\-1,j\-1}\,+\,{s}({S}_1[{i}],\,{S}_2[{j}]),\\'+
'причем перемещение по диагонали выполняется на одну позицию, перемещение\\'+
'влево \= до элемента {W}_{i,k} ({k}\,<\,{j}), для которого выполняется соотношение\\'+
'{W}_{i,k}\,=\,{W}_{i,j}\,+\,{w}_g\,+\,({j}\,\-\,{k})\*{w}_s, а перемещение вверх \= до элемента {W}_{k,j} ({k}\,<\,{i}),\\'+
'для которого выполняется соотношение {W}_{k,j}\,=\,{W}_{i,j}\,+\,{w}_g\,+\,({i}\,\-\,{k})\*{w}_s. Каждое\\'+
'перемещение влево на одну позицию соответствует вставке пробела в строку {A}_1\\'+
'и текущего элемента {S}_2 в строку {A}_2, каждое перемещение вправо на одну\\'+
'позицию \= вставке пробела в строку {A}_2 и текущего элемента {S}_1 в строку {A}_1.\\'+
'Перемещение по диагонали соответствует вставке в {A}_1 и {A}_2 текущих\\'+
'элементов {S}_1 и {S}_2 соответственно (символы в строках {S}_1 и {S}_2 перебираются\\'+
'с конца, строки {A}_1 и {A}_2 заполняются от конца к началу). При наличии нескольких\\'+
'вариантов оптимального выравнивания выбор варианта выполнять в соответствии\\'+
'с указаниями \10. Вывести найденное выравнивание ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  until k >=-99;
  BackW(s01,s02);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('Элементы матрицы W:',dv,y,3);
  ShowMatr('Элементы матрицы E:',we,y+nn+3,3+4);
  ShowMatr('Элементы матрицы F:',wf,y+2*(nn+3)-1,3+4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);

  DType := 0;
  CalcV;
  BackV(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('Примечание. Справа приведен вариант выравнивания без учета пропусков.',2,5);
  SetTestCount(5);
end;

procedure Alignment45;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в~\2). Кроме того, дана матрица {W}, полученная методом восходящей\\'+
'рекурсии (см.~\2), и вспомогательные матрицы {E} и {F} (для матриц {E} и {F}\\'+
'элементы нулевых строк и столбцов не приводятся). Найти все варианты\\'+
'оптимального выравнивания для {S}_1 и {S}_2 при учете пропусков, модифицировав\\'+
'требуемым образом алгоритм обратного прохода по матрице~{W} (см.~\1).\\'+
'Перебор вариантов оптимального выравнивания выполнять в соответствии\\'+
'с указаниями \10. Вывести все найденные оптимальные выравнивания.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k <-99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  until (cnt > 2) and (cnt <= 8) and (k >=-99);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('Элементы матрицы W:',dv,y,3);
  ShowMatr('Элементы матрицы E:',we,y+nn+3,3+4);
  ShowMatr('Элементы матрицы F:',wf,y+2*(nn+3)-1,3+4);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

procedure Alignment46;
var
  i,j: integer;
  ss01,ss02,ss03: string;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \3). Найти значение сходства и один из вариантов оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при учете пропусков, используя метод восходящей\\'+
'рекурсии для построения матриц {W}, {E} и {F} (см.~\3) и выполняя\\'+
'обратный проход по матрице~{W} (см.~\2). Выбор варианта оптимального\\'+
'выравнивания выполнять в соответствии с указаниями \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and ((m<9) or (max(mm,nn)<25));
  CalcSSW(-9,9);
  CalcV;
  BackV(ss01,ss02);
  Str(dv[nn,mm]:3,ss03);
  CalcW;
  BackW(s01,s02);
  until (length(s01)<=32) and (length(ss01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('Значение сходства: ',dv[nn,mm],3,1,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  ResultComment('Значение сходства: '+ss03,43,1);
  ResultComment('\<'+ss01+'\>',43,2);
  ResultComment('\<'+ss02+'\>',43,3);
  ResultComment(Rule(0,length(ss01)),43,4);
  ResultComment('Примечание. Справа приведен вариант выравнивания без учета пропусков.',2,5);
  SetTestCount(5);
end;

procedure Alignment47;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \4). Найти значение сходства и все варианты оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при учете пропусков, используя метод восходящей\\'+
'рекурсии для построения матриц {W}, {E} и {F} (см.~\4) и выполняя\\'+
'обратный проход по матрице~{W} (см.~\3). Перебор вариантов\\'+
'оптимального выравнивания выполнять в соответствии с указаниями \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 0;
  mm := length(s2);
  nn := length(s1);
  until s1 <> s2;
  CalcSSW(-9,9);
  CalcW;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  until (cnt > 2) and (cnt <= 8);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('Значение сходства: ',dv[nn,mm],0,1,2);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//-----------------------------------------------------------------------

procedure Alignment48;
var
  i,j,res: integer;
begin
  CreateTask(Subgroup4);
TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \5). Найти значение сходства для строк {S}_1 и {S}_2 при учете пропусков\\'+
'(см.~\5) и дополнительном предположении, что все граничные пробелы\\'+
'(и связанные с ними пропуски) являются \<бесплатными\>, т.\,е. имеют нулевой вес\\'+
'(см.~\10). Если через {W''}({i},\,{j}) обозначить сходство строк {S}_1[1..{i}]\\'+
'и {S}_2[1..{j}] в случае учета пропусков и бесплатных начальных пробелов,\\'+
'то рекуррентные формулы для {W''}({i},\,{j}) будут аналогичны формулам для {W}({i},\,{j}),\\'+
'приведенным в \5; необходимо лишь изменить базовые условия, положив\\'+
'для любого {i} {W''}({i},\,0)\,=\,0 и для любого {j} {W''}(0,\,{j})\,=\,0 (базовые условия\\'+
'для функций {E} и {F} не изменятся, в рекуррентных формулах для вычисления\\'+
'значений {E} и {F} необходимо использовать значения {W''} вместо {W}). Для эффективного\\'+
'нахождения значений {W''}({i},\,{j}) следует использовать метод восходящей рекурсии,\\'+
'основанный на последовательном вычислении элементов вспомогательных\\'+
'матриц {W''}, {E} и {F} (действия при заполнении матриц аналогичны действиям\\'+
'при заполнении матрицы {D}, описанным в \43). Чтобы учесть условие\\'+
'бесплатности конечных пробелов, в качестве значения сходства\\'+
'для строк {S}_1 и {S}_2 следует выбрать наибольшее значение среди элементов\\'+
'матрицы {W''}, расположенных в ее последней строчке или последнем\\'+
'столбце. Вывести найденное значение сходства для {S}_1 и {S}_2, а также\\'+
'элементы последней строчки и последнего столбца матрицы {W''}:\\'+
'{W''}_{n,j}, {j}\,=\,0,\,\.,\,{p}, {W''}_{i,p}, {i}\,=\,0,\,\.,\,{n}, где {n}\,=\,|{S}_1|, {p}\,=\,|{S}_2|.'
);
  m := Rand(4,9);
  repeat
  MakeStrS(14,17,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSSW(-9,9);
  res := CalcW;
  k := 0;
  for j := 0 to mm do
    if dv[nn,j] < k then
      k := dv[nn,j];
  for i := 0 to nn do
    if dv[i,mm] < k then
      k := dv[i,mm];
  until (k >= -99) and (njmax + nimax > 0) and (res>0);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  ShowSSW(3);
  s0 := '';
  k := max(nn,mm);
  for j := 0 to k do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('Значение сходства: ', res,0,1,2);
  ResultComment(s0,Center(1, k+1, 3, 1)+2,2);
//  ResultComment('V''_{n,j}, j = 0,\.,m:',0,2);
  ResultComment('W''_{n,j}:',2,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, k+1, 3, 1)+3, 3, 3);
//  ResultComment('V''_{i,m}, i = 0,\.,n:',0,4);
  ResultComment('W''_{i,p}:',2,4);
  for i := 0 to nn do
    ResultN('',dv[i,mm],Center(i+1, k+1, 3, 1)+3, 4, 3);
  DType := 0;
  Str(CalcW:3,s00);
  ResultComment('Примечание. Значение сходства с учетом пропусков и граничных пробелов: '+s00,2,5);
  SetTestCount(5);
end;

procedure Alignment49;
var
  i,j: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \6). Кроме того, дана матрица {W''}, полученная методом восходящей\\'+
'рекурсии (см.~\1), и вспомогательные матрицы {E} и {F} (для матриц {E} и {F}\\'+
'элементы нулевых строк и столбцов не приводятся). Найти один из вариантов\\'+
'оптимального выравнивания для {S}_1 и {S}_2 при бесплатных граничных пробелах\\'+
'и учете пропусков, модифицировав соответствующим образом алгоритм обратного\\'+
'прохода по матрице~{W''} (см.~\5 и~\10). Выбор варианта\\'+
'оптимального выравнивания выполнять в соответствии с указаниями \10.\\'+
'Вывести найденное выравнивание ({A}_1,~{A}_2).'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1) + 2*nn*mm + (m+1)*(m+2) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  BackW(s01,s02);
  until (k >=-99) and (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)));
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('Элементы матрицы W'':',dv,y,3);
  ShowMatr('Элементы матрицы E:',we,y+nn+3,3+4);
  ShowMatr('Элементы матрицы F:',wf,y+2*(nn+3)-1,3+4);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  DType := 0;
  CalcW;
  BackW(s01,s02);
  ResultComment('\<'+s01+'\>',43,2);
  ResultComment('\<'+s02+'\>',43,3);
  ResultComment(Rule(0,length(s01)),43,4);
  ResultComment('Примечание. Справа приведен вариант с учетом пропусков и граничных пробелов.',2,5);
  SetTestCount(5);
end;

procedure Alignment50;
var
  i,j: integer;
  b,b1: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \7). Кроме того, дана матрица {W''}, полученная методом восходящей\\'+
'рекурсии (см.~\2), и вспомогательные матрицы {E} и {F} (для матриц {E} и {F}\\'+
'элементы нулевых строк и столбцов не приводятся). Найти все варианты\\'+
'оптимального выравнивания для {S}_1 и {S}_2 при бесплатных граничных пробелах\\'+
'и учете пропусков, модифицировав соответствующим образом алгоритм обратного\\'+
'прохода по матрице~{W''} (см.~\6 и~\11).\\'+
'Перебор вариантов оптимального выравнивания выполнять в соответствии\\'+
'с указаниями \10. Вывести все найденные оптимальные выравнивания.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2) and ((nn+1)*(mm+1) + 2*nn*mm + m*(m+1) div 2 + 5 <=200);
  CalcSSW(-9,9);
  CalcW;
  k := 0;
  for i := 0 to nn do
    for j := 0 to mm do
      if dv[i,j]<k then k := dv[i,j];
  if k < -99 then continue;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (k >=-99) and (b = 0);

  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ShowMatr('Элементы матрицы W'':',dv,y,3);
  ShowMatr('Элементы матрицы E:',we,y+nn+3,3+4);
  ShowMatr('Элементы матрицы F:',wf,y+2*(nn+3)-1,3+4);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,1);
  y := 2;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;

  SetTestCount(5);
end;

procedure Alignment51;
var
  i,j,res: integer;
  ss01,ss02,ss03: string;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \8). Найти значение сходства и один из вариантов оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при бесплатных граничных пробелах и учете пропусков,\\'+
'используя метод восходящей рекурсии для построения матриц {W''}, {E} и {F}\\'+
'(см.~\3) и выполняя обратный проход по матрице~{W''}\\'+
'(см.~\7 и~\12). Выбор варианта оптимального выравнивания\\'+
'выполнять в соответствии с указаниями \12.'
);

  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1 <> s2) and (m<9) or (max(mm,nn)<25);
  CalcSSW(-9,9);
  DType := 0;
  res := CalcW;
  BackW(ss01,ss02);
  Str(res:3,ss03);
  DType := 2;
  res := CalcW;
  BackW(s01,s02);
  until (njmax + nimax > 1) and (length(Trim(s02+s01))<>length(Trim(s02))+length(Trim(s01)))
        and (length(s01)<=32) and (length(ss01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('Значение сходства: ',res,3,1,3);
  ResultS('A_1 = ',s01,3,2);
  ResultS('A_2 = ',s02,3,3);
  ResultComment(Rule(4,length(s01)),4,4);
  ResultComment('Значение сходства: '+ss03,43,1);
  ResultComment('\<'+ss01+'\>',43,2);
  ResultComment('\<'+ss02+'\>',43,3);
  ResultComment(Rule(0,length(ss01)),43,4);
  ResultComment('Примечание. Справа приведен вариант с учетом пропусков и граничных пробелов.',2,5);
  SetTestCount(5);
end;

procedure Alignment52;
var
  i,j,b,b1,res: integer;
begin
  CreateTask(Subgroup4);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {m} (<\,10) \= размер алфавита, состоящего из первых\\'+
'строчных латинских букв, числа {w}_s (\g\,0) и {w}_g (>\,0) \= вес пробела и пропуска\\'+
'соответственно, а также матрица оценок (структура матрицы описана\\'+
'в \9). Найти значение сходства и все варианты оптимального\\'+
'выравнивания для {S}_1 и {S}_2 при бесплатных граничных пробелах и учете пропусков,\\'+
'используя метод восходящей рекурсии для построения матриц {W''}, {E} и {F}\\'+
'(см.~\4) и выполняя обратный проход по матрице~{W''}\\'+
'(см.~\8 и~\13). Перебор вариантов оптимального выравнивания\\'+
'выполнять в соответствии с указаниями \12.'
);
  m := Rand(4,9);
  repeat
  repeat
  MakeStrS(20,29,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  until (s1<>s2);
  CalcSSW(-9,9);
  res := CalcW;
  s01 := '';
  s02 := '';
  cnt := 0;
  BackW2(nn,mm,s01,s02);
  if (cnt <3) or (cnt > 8) then
    continue;
  b := 0;
  for i := 1 to cnt do
  begin
    b1 := length(Trim(t02[i]))+length(Trim(t01[i]));
    if (length(Trim(t02[i]+t01[i]))=b1) or
       (length(Trim(t01[i]+t02[i]))=b1) then
    begin
      b := 1;
      break;
    end;
  end;
  until (cnt > 2) and (cnt <= 8) and (b = 0);

  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, 47, 2,1);
  DataN('w_s = ',ws, 57, 2,1);
  DataN('w_g = ',wg, 67, 2,1);
  y := ShowSSW(3);
  ResultN('Значение сходства: ',res,0,1,2);
  Str(cnt,s00);
  ResultComment('Примечание. Количество различных вариантов оптимального выравнивания равно ' + s00,2,2);
  y := 3;
  for i := 1 to cnt do
  begin
  Str(i,s00);
  ResultComment('Вариант '+s00+':',2,y);
  ResultS('A_1 = ',t01[i],14,y);
  y := y + 1;
  ResultS('A_2 = ',t02[i],14,y);
  y := y + 1;
  ResultComment(Rule(5,length(t01[i])),14,y);
  y := y + 1;
  end;
  SetTestCount(5);
end;

//--------------------------------------------------------------------------

procedure MakeStrP(a,b,m: integer; var s1,s2: string);
// для поиска приближенных вхождений
var i: integer;
    s0: string;
begin
  DType := 3;
  WD := 0;
  WR := 0;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  s2 := TransformStr(m,s1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));
  i := length(s2);
  repeat
    s0 := Copy(s2, Rand(2,i), Rand(1,i-1));
  until (length(s0)>=3) and (length(s0)<=i div 2);
  s2 := s1;
  s1 := s0;
end;

var p1: array[1..nmax] of string;
    jjj: integer;

(*
ВАЖНО! В книге - нечеткая формулировка теоремы 11.6.2 (с.286).
Начальный индекс k для определяется не тем, в какой клетке
нулевой строки оканчивается путь из обратных ссылок,
а какой последний непробельный символ был добавлен слева в
выравнивание, соответствующее T'.
*)

function endj(starti, startj: integer; var s01,s02: string): integer;
var i,j: integer;
begin
  i := starti;
  j := startj;
  s01 := '';
  s02 := '';
  while i > 0 do
  begin
    if da[i,j] and fup = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i := i-1;
    end
    else
    if da[i,j] and fdiag = fdiag then
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i := i-1;
      j := j-1;
    end
    else
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j := j-1;
    end;
  end;
  result := j+1;
end;

procedure Alignment53;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также\\'+
'дано число {m} (<\,10) \= размер алфавита, состоящего из первых строчных\\'+
'латинских букв, и матрица оценок (структура матрицы описана в \24).\\'+
'Подстрока {T''} строки {T} называется \Iприближенным вхождением\i {P} в {T}\\'+
'(с точностью {d}), если значение сходства {P} и {T''} (см.~\23) больше\\'+
'или равно {d}. Используя метод восходящей рекурсии (см.~\22),\\'+
'найти все подстроки строки {T}, которые имеют длину |{P}| и являются\\'+
'приближенными вхождениями {P} в {T} с точностью {d}. Вывести найденные\\'+
'приближенные вхождения; после каждого найденного вхождения выводить значение\\'+
'его сходства с {P} (вхождения перебирать по возрастанию позиции их начального\\'+
'символа). Вывести также количество найденных приближенных вхождений.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
  MakeStrP(20,29,m,p0,t0);
  DType := 0;
  mm := length(p0);
  nn := length(p0);
  CalcSS(-9,9);
  s1 := p0;
  cnt := 0;
  for i := 1 to length(t0)-mm+1 do
  begin
    s2 := Copy(t0,i,mm);
    res := CalcV;
    if res >= d then
    begin
      cnt := cnt + 1;
      p1[cnt] := s2;
      ind[cnt] := res;
    end;
  end;
  until (cnt >0)and (cnt <9);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,length(t0))),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  ShowSS(3);
  case cnt of
  0,1: y := 3;
  2,3: y := 2;
  else y := 1;
  end;
  for i := 1 to cnt do
  begin
    Str(i,s00);
    ResultS('T''_'+s00+' = ',p1[i],3,y+i-1);
    ResultN('Значение сходства T''_'+s00+' с P: ',ind[i],40,y+i-1,2);
  end;
  ResultN('Количество найденных приближенных вхождений: ',cnt,0,y+cnt,2);
  SetTestCount(5);
end;

procedure Alignment54;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных\\'+
'латинских букв, и матрица оценок (структура матрицы описана в \25).\\'+
'Эффективный алгоритм нахождения конечных позиций всех приближенных\\'+
'вхождений {P} в {T} состоит в следующем (определение приближенного вхождения\\'+
'приведено в \1): \(\X с помощью метода восходящей рекурсии построить\\'+
'вспомогательную матрицу {V} (см.~\23) для строк {P} и {T}, изменив базовые\\'+
'условия: для любого {j} {V}_{0,j}\,=\,0 (условия для {V}_{i,0} остаются прежними);\| \X позиция {k}\\'+
'строки {T} соответствует конечной позиции некоторого приближенного вхождения {P}\\'+
'в {T} с точностью {d}, если {V}_{n,k}\,\g\,{d} ({n} обозначает длину строки |{P}|).\) Используя\\'+
'описанный алгоритм, определить количество позиций строки {T}, соответствующих\\'+
'конечным позициям всех приближенных вхождений {P} в {T}, и вывести это количество,\\'+
'а также последнюю строчку матрицы~{V}: {V}_{n,j}, {j}\,=\,0,\,\.,\,|{T}|.'
);
  m := Rand(4,9);
//  repeat
  d := Rand(1,20);
  MakeStrP(14,18,m,p0,t0);
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  nn := length(p0);
  mm := length(t0);
  CalcV;
  cnt := 0;
  for j := 1 to length(s2) do
    if dv[nn,j]>=d then
      cnt := cnt + 1;
//  until (cnt >0)and (cnt <9);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  ShowSS(3);

  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  ResultN('Количество конечных позиций T, соответствующих приближенным вхождениям: ', cnt,0,1,2);
  ResultComment('V_{n,j}, j = 0,\.,|T|:',0,2);
  ResultComment(s0,Center(1, mm+1, 3, 1)-1,3);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 4, 3);
  SetTestCount(5);
end;


procedure Alignment55;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских букв,\\'+
'матрица оценок (структура матрицы описана в \26) и матрица {V},\\'+
'полученная методом восходящей рекурсии (см.~\1). Для нахождения\\'+
'подстроки матрицы {T}, являющейся приближенным вхождением {P} с точностью {d},\\'+
'достаточно выполнить обратный проход по матрице {V} по правилам, приведенным\\'+
'в \22 (получаемые при этом вспомогательные строки {A}_1 и {A}_2 будут\\'+
'содержать соответствующее оптимальное выравнивание). Обратный проход\\'+
'начинается с какого-либо элемента последней строчки, значение которого больше\\'+
'или равно~{d}: {V}_{n,k}\,\g\,{d}, где {n}\,=\,|{P}|. Заканчивается обратный проход на элементе\\'+
'расположенном в нулевой строчке {V}. Индекс {j} символа строки {T}, добавленного\\'+
'последним в выравнивание {A}_2 при обратном проходе, определяет начальную\\'+
'позицию приближенного вхождения; таким образом, искомое приближенное\\'+
'вхождение равно подстроке {T}[{j}..{k}]. Используя описанный алгоритм, найти\\'+
'приближенное вхождение {P} в {T} с минимальной конечной позицией {k}\\'+
'(предполагается, что хотя бы одно приближенное вхождение существует). Если\\'+
'на некотором шаге обратного хода имеется несколько вариантов выбора очередного\\'+
'элемента, то предпочтительным является перемещение вверх, а при его\\'+
'невозможности \= перемещение по диагонали. Вывести найденное приближенное\\'+
'вхождение {T''}, его начальную позицию в строке {T}, а также значение сходства\\'+
'для строк {P} и {T''} и оптимальное выравнивание ({A}_1,~{A}_2) для этих строк.\\'+
'\P\SПримечание\s. Приведенное условие выбора варианта очередного элемента\\'+
'матрицы {V} в алгоритме обратного хода обеспечивает построение одного\\'+
'из \Iкратчайших\i приближенных вхождений {P} в {T}, заканчивающихся в позиции {k}.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
  repeat
  MakeStrP(9,12,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := -1;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      k2 := j;
      break;
    end;
  until (k>=-99) and (k2 <> -1);
  k1 := endj(nn,k2,s01,s02);
  s00 := Copy(t0,k1,k2-k1+1);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,y,3);
  ResultS('T'' = ', s00,3,1);
  ResultN('Начальная позиция T'' в T: ', k1,3,2,2);
  ResultN('Значение сходства P и T'': ', dv[nn,k2],3,3,2);
  ResultComment('Оптимальное выравнивание P и T'':',40,2);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment56;
var
  i,j,res,cnt,k1,k2: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских букв,\\'+
'матрица оценок (структура матрицы описана в \27) и матрица {V},\\'+
'полученная методом восходящей рекурсии (см.~\2). Для каждой\\'+
'позиции {k} строки {T}, в которой оканчивается приближенное вхождение {P} в {T},\\'+
'найти одно из таких вхождений, выполняя обратный проход по матрице {V}\\'+
'(см.~\1). Если в позиции {k} оканчиваются несколько вариантов\\'+
'приближенных вхождений, то выбор варианта выполнять в соответствии\\'+
'с указаниями \1. Для каждого найденного вхождения {T''}\,=\,{T}[{j}..{k}]\\'+
'вывести позиции {j} и {k} его начального и конечного символа в строке {T},\\'+
'значение сходства для строк {P} и {T''} и оптимальное выравнивание ({A}_1,~{A}_2)\\'+
'для этих строк. Вхождения перебирать по возрастанию позиции {k} их конечного\\'+
'символа. Вывести также количество найденных приближенных вхождений.'
);
  m := Rand(4,9);
  k1 := Random(5);
  repeat
  d := Rand(1,20);
  repeat
  MakeStrP(9,12,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := 0;
  for j := 0 to mm do
    if dv[nn,j]>=d then
      inc(k2);
  until (k>=-99) and  ((k1 = 0)and(k2 = 0) or (k1 in [1..4])
    and (k2 in [1..4]) or (k1 in [3..4]) and (k2 in [4..8]));
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,y,3);
  cnt := 0;
  for j := 0 to mm do
  if dv[nn,j] >= d then
  begin
  cnt := cnt + 1;
  k2 := j;
  k1 := endj(nn,k2,s01,s02);
//  s00 := Copy(t0,k1,k2-k1+1);
  Str(cnt,s00);
  y := 2*cnt-1;
  ResultComment('T''_'+s00+': ',3,y);
  ResultN('j = ', k1,10,y,2);
  ResultN('k = ', k2,20,y,2);
  ResultN('Значение сходства: ', dv[nn,k2],30,y,2);
  ResultS('A_1 = ', s01,55,y);
  ResultS('A_2 = ', s02,55,y+1);
//  ResultComment(Rule(5,length(s01)),60,3*cnt);
  end;
  if cnt = 0 then
    y := 3
  else
    y := 2*cnt+1;
  ResultN('Количество найденных приближенных вхождений: ', cnt, 0, y, 2);
  SetTestCount(5);
end;

procedure Alignment57;
var
  i,j,res,cnt: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских букв,\\'+
'и матрица оценок (структура матрицы описана в \28). Найти\\'+
'приближенное вхождение {P} в {T} с минимальной конечной позицией {k}, используя\\'+
'алгоритм восходящей рекурсии для построения матрицы~{V} (см.~\3)\\'+
'и выполняя обратный проход по матрице~{V} (см.~\2); предполагается,\\'+
'что хотя бы одно приближенное вхождение существует. Если в позиции {k}\\'+
'заканчиваются несколько вариантов приближенных вхождений, то выбор варианта\\'+
'выполнять в соответствии с указаниями \2. Вывести найденное\\'+
'приближенное вхождение {T''}, его начальную позицию в строке {T}, а также значение\\'+
'сходства для строк {P} и {T''} и оптимальное выравнивание ({A}_1,~{A}_2) для этих строк.'
);
  m := Rand(4,9);
  repeat
  d := Rand(1,20);
//  repeat
  MakeStrP(20,29,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := -1;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      k2 := j;
      break;
    end;
  until (k>=-99) and (k2 <> -1);
  k1 := endj(nn,k2,s01,s02);
  s00 := Copy(t0,k1,k2-k1+1);
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
//  ShowMatr('Элементы матрицы V:',dv,y,3);
  ResultS('T'' = ', s00,3,1);
  ResultN('Начальная позиция T'' в T: ', k1,3,2,2);
  ResultN('Значение сходства P и T'': ', dv[nn,k2],3,3,2);
  ResultComment('Оптимальное выравнивание P и T'':',40,2);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment58;
var
  i,j,res,cnt,k1,k2,b: integer;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {P}, {T} (|{P}|\,<\,|{T}|) и число {d} (>\,0) \= точность приближения. Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских букв,\\'+
'и матрица оценок (структура матрицы описана в \29). Для каждой\\'+
'позиции {k} строки {T}, в которой заканчивается приближенное вхождение {P} в {T},\\'+
'найти одно из таких вхождений, используя алгоритм восходящей рекурсии\\'+
'для построения матрицы~{V} (см.~\4) и выполняя обратный проход\\'+
'по матрице~{V} (см.~\3). Если в позиции {k} заканчиваются несколько\\'+
'вариантов приближенных вхождений, то выбор варианта выполнять в соответствии\\'+
'с указаниями \3. Для каждого найденного вхождения {T''}\,=\,{T}[{j}..{k}]\\'+
'вывести позиции {j} и {k} его начального и конечного символа в строке {T},\\'+
'значение сходства для строк {P} и {T''} и оптимальное выравнивание ({A}_1,~{A}_2)\\'+
'для этих строк. Вхождения перебирать по возрастанию позиции {k} их конечного\\'+
'символа. Вывести также количество найденных приближенных вхождений.'
);
  m := Rand(4,9);
  k1 := Random(5);
  repeat
  d := Rand(1,20);
//  repeat
  MakeStrP(20,29,m,p0,t0);
  nn := length(p0);
  mm := length(t0);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 2 <=200;
  CalcSS(-9,9);
  s1 := p0;
  s2 := t0;
  CalcV;
  k := MaxInt;
  for i := 0 to nn do
  for j := 0 to mm do
    if dv[i,j]<k then
      k := dv[i,j];
  k2 := 0;
  b := 0;
  for j := 0 to mm do
    if dv[nn,j]>=d then
    begin
      inc(k2);
      endj(nn,k2,s01,s02);
      if length(s01)>24 then
      begin
        b := 1;
        break;
      end;
    end;
  until (b=0) and (k>=-99) and  ((k1 = 0)and(k2 = 0) or (k1 in [1..4])
    and (k2 in [1..4]) or (k1 in [3..4]) and (k2 in [4..8]));
  DataS('P = ',p0,3,1);
  DataS('T = ',t0,3,2);
  DataComment(Rule(4,max(mm,nn)),3,3);
  DataN('d = ', d, 50, 2,1);
  DataN('m = ', m, 64, 2,1);
  y := ShowSS(3);
//  ShowMatr('Элементы матрицы V:',dv,y,3);
  cnt := 0;
  for j := 0 to mm do
  if dv[nn,j] >= d then
  begin
  cnt := cnt + 1;
  k2 := j;
  k1 := endj(nn,k2,s01,s02);
//  s00 := Copy(t0,k1,k2-k1+1);
  Str(cnt,s00);
  y := 2*cnt-1;
  ResultComment('T''_'+s00+': ',3,y);
  ResultN('j = ', k1,9,y,2);
  ResultN('k = ', k2,17,y,2);
  ResultN('Значение сходства: ', dv[nn,k2],25,y,2);
  ResultS('A_1 = ', s01,48,y);
  ResultS('A_2 = ', s02,48,y+1);
//  ResultComment(Rule(5,length(s01)),60,3*cnt);
  end;
  if cnt = 0 then
    y := 3
  else
    y := 2*cnt+1;
  ResultN('Количество найденных приближенных вхождений: ', cnt, 0, y, 2);
  SetTestCount(5);
end;


procedure Alignment59;
var
  i,j: integer;
begin
  CreateTask(Subgroup5);
TaskTextExt(
'Даны строки {S}_1 и {S}_2. Также дано число {m} (<\,10) \= размер алфавита, состоящего\\'+
'из первых строчных латинских букв, и матрица оценок (структура матрицы\\'+
'описана в \30). Задача \Iлокального суффиксного выравнивания\i {S}_1 и {S}_2\\'+
'для пары позиций ({i},\,{j}) состоит в нахождении (возможно, пустых)\\'+
'суффиксов {s}_1 и {s}_2 строк {S}_1[1..{i}] и {S}_2[1..{j}] соответственно с максимальным\\'+
'значением сходства {v}({i},\,{j}) (максимум ищется по всем парам возможных суффиксов\\'+
'строк {S}_1[1..{i}] и {S}_2[1..{j}]). Дополнительно предполагается, что две пустые\\'+
'строки имеют сходство 0. Для нахождения {v}({i},\,{j}) можно использовать следующие\\'+
'соотношения:\( \X для любого {i} {v}({i},\,0)\,=\,0;\| \X для любого {j} {v}(0,\,{j})\,=\,0;\|\\'+
'\X если {i}\,>\,0 и {j}\,>\,0, то {v}({i},\,{j})\,=\,max\{0,~{v}({i}\,\-\,1,\,{j})\,+\,{s}({S}_1[{i}],\,\_), {v}({i},\,{j}\,\-\,1)\,+\,{s}(\_,\,{S}_2[{j}]),\\'+
'{v}({i}\,\-\,1,\,{j}\,\-\,1)\,+\,{s}({S}_1[{i}],\,{S}_2[{j}])\}\) (символ \<\_\> в формуле обозначает пробел;\\'+
'следует обратить внимание на то, что максимум всегда будет неотрицательным).\\'+
'Эффективное нахождение значений {v}({i},\,{j}) выполняется методом восходящей\\'+
'рекурсии, основанным на последовательном вычислении элементов вспомогательной\\'+
'матрицы {v} (действия при заполнении матрицы {v} аналогичны действиям\\'+
'при заполнении матрицы {D}, описанным в \54). Используя метод\\'+
'восходящей рекурсии, найти матрицу {v} и вывести элементы ее двух последних\\'+
'строчек: {v}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {v}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, где {n}\,=\,|{S}_1|.'
);
  m := Rand(4,9);
//  repeat
  MakeStr(14,18,m,s1,s2);
  DType := 4;
  mm := length(s2);
  nn := length(s1);
  CalcSS(-9,9);
  CalcV;
//  until k >= -99;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(4,max(mm,nn)),4,3);
  DataN('m = ', m, xRight, 2,1);
  ShowSS(3);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('v_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to mm do
    ResultN('',dv[nn-1,j],Center(j+1, mm+1, 3, 1), 3, 3);
  ResultComment('v_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


(*
ВАЖНО! В книге - нечеткое описание подстрок, обеспечивающих оптимальное
локальное выравнивание (с. 291): начальные индексы этих подстрок i' и j'
определяются не тем, в какой клетке будет достигнуто нулевое значение
(это значение вообще может не соответствовать какому-либо индексу, так как
может достигаться в нулевой строке или столбце_, а позицией последних
непробельных символов, которые были добавлены слева в выравнивания A_1 и A_2
соответственно.
*)

procedure endij(starti, startj: integer; var i1,j1: integer;
  var s01,s02: string);
var i,j: integer;
begin
  i := starti;
  j := startj;
  s01 := '';
  s02 := '';
  i1 := 0;
  j1 := 0;

  while dv[i,j] > 0 do
  begin
    if da[i,j] and fup = fup then
    begin
      s01 := s1[i]+s01;
      s02 := ' ' + s02;
      i1 := i;
      i := i-1;
    end
    else
    if da[i,j] and fdiag = fdiag then
    begin
      s01 := s1[i] + s01;
      s02 := s2[j] + s02;
      i1 := i;
      j1 := j;
      i := i-1;
      j := j-1;
    end
    else
    begin
      s01 := ' '+s01;
      s02 := s2[j] + s02;
      j1 := j;
      j := j-1;
    end;
  end;

end;



procedure Alignment60;
var
  i,j,res,cnt,i1,i2,j1,j2: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 и числа {i} (\l\,|{S}_1|) и {j} (\l\,|{S}_2|). Также дано\\'+
'число {m} (<\,10) \= размер алфавита, состоящего из первых строчных латинских\\'+
'букв, матрица оценок (структура матрицы описана в \31)\\'+
'и матрица {v}, полученная методом восходящей рекурсии (см.~\1).\\'+
'Решить задачу локального суффиксного выравнивания для данной пары\\'+
'позиций ({i},\,{j}); для этого выполнить обратный проход по матрице {v}\\'+
'(по правилам, аналогичным приведенным в \27), начиная с элемента {v}_{i,j}\\'+
'и заканчивая элементом, равным 0 (получаемые при этом вспомогательные\\'+
'строки {A}_1 и {A}_2 будут содержать соответствующее оптимальное суффиксное\\'+
'выравнивание). Индекс {i''} символа строки {S}_1, добавленного последним\\'+
'в выравнивание {A}_1 при обратном проходе, и индекс {j''} символа строки {S}_2,\\'+
'добавленного последним в выравнивание {A}_2, будут определять начальные позиции\\'+
'суффиксов {s}_1 и {s}_2, обеспечивающих оптимальное суффиксное выравнивание:\\'+
'{s}_1\,=\,{S}_1[{i''}..{i}], {s}_2\,=\,{S}_2[{j''}..{j}] (при этом значение сходства будет равно\\'+
'{v}_{i,j}). Если при обратном проходе в выравнивание {A}_1 и/или {A}_2 не будет\\'+
'добавлено ни одного символа, то соответствующий суффикс полагается равным\\'+
'пустой строке, а значение {i''} и/или {j''} \= равным 0. Если на некотором шаге\\'+
'обратного хода имеется несколько вариантов выбора очередного элемента,\\'+
'то предпочтительным является перемещение вверх, а при его невозможности \=\\'+
'перемещение по диагонали. Вывести найденные суффиксы {s}_1 и {s}_2, их начальные\\'+
'позиции {i''} и {j''} в строках {S}_1 и {S}_2 соответственно, а также значение\\'+
'сходства для строк {s}_1 и {s}_2 и оптимальное выравнивание ({A}_1,~{A}_2)\\'+
'для этих строк. Некоторые из строк {s}_1, {s}_2, {A}_1, {A}_2 (а возможно,\\'+
'и все эти строки) могут быть пустыми.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 5 <=200;
  CalcSS(-9,9);
  CalcV;
    i2 := Rand(1,nn);
    j2 := Rand(1,mm);
    endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (s01 = '') or (y=1) and (length(s01)=1) or (y>1)and(length(s01)>=y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('i = ',i2, 47, 2,1);
  DataN('j = ',j2, 57, 2,1);
  DataN('m = ', m, 67, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultS('s_1 = ', ss01,3,1);
  ResultS('s_2 = ', ss02,25,1);
  ResultN('i'' = ', i1,3,2,2);
  ResultN('j'' = ', j1,25,2,2);
  ResultN('Значение сходства s_1 и s_2: ', dv[i2,j2],40,2,2);
  ResultComment('Оптимальное выравнивание s_1 и s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;

procedure Alignment61;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Также дано число {m} (<\,10) \= размер алфавита, состоящего\\'+
'из первых строчных латинских букв, матрица оценок (структура матрицы описана\\'+
'в \32) и матрица {v}, полученная методом восходящей рекурсии\\'+
'(см.~\2). Задача \Iлокального выравнивания\i для строк {S}_1 и {S}_2\\'+
'состоит в нахождении подстрок {s}_1 и {s}_2 строк S_1 и S_2 соответственно\\'+
'с максимальным значением сходства {v}^* (максимум ищется по всем парам\\'+
'различных подстрок строк {S}_1 и {S}_2). Данная задача связана с задачей\\'+
'локального суффиксного выравнивания (см.~\2) следующим образом:\\'+
'{v}^*\,=\,max\{{v}({i},\,{j})\}, {i}\,\l\,|{S}_1|, {j}\,\l\,|{S}_2|, причем если максимум {v}({i},\,{j})\\'+
'достигается на паре позиций ({i}^*,\,{j}^*), то пара подстрок, решающая задачу\\'+
'локального суффиксного выравнивания для ({i}^*,\,{j}^*), одновременно решает задачу\\'+
'локального выравнивания строк {S}_1 и {S}_2. Используя алгоритм обратного прохода\\'+
'для решения задачи суффиксного выравнивания (см.~\1), найти\\'+
'подстроки {s}_1 и {s}_2, решающие задачу локального выравнивания. Если имеется\\'+
'несколько пар позиций, на которых достигается максимум функции {v}, то выбрать\\'+
'пару с минимальным значением {i}^*, а для пар с одинаковым минимальным\\'+
'значением {i}^* \= с минимальным значением {j}^*. Если при выполнении обратного\\'+
'прохода из позиции ({i}^*,\,{j}^*) можно получить несколько вариантов подстрок {s}_1\\'+
'и {s}_2, то выбор варианта выполнять в соответствии с указаниями \1.\\'+
'Вывести значения {v}^*, {i}^*, {j}^*, подстроки {s}_1 и {s}_2, а также оптимальное\\'+
'выравнивание ({A}_1,~{A}_2) для этих подстрок.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
  repeat
  MakeStrS(9,12,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
  ShowMatr('Элементы матрицы v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultN('v^* = ', dv[i2,j2],3,1,2);
  ResultN('i^* = ', i1,22,1,2);
  ResultN('j^* = ', j1,50,1,2);
  ResultS('s_1 = ', ss01,22,2);
  ResultS('s_2 = ', ss02,50,2);
  ResultComment('Оптимальное выравнивание s_1 и s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure Alignment62;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Также дано число {m} (<\,10) \= размер алфавита, состоящего\\'+
'из первых строчных латинских букв, и матрица оценок (структура матрицы описана\\'+
'в \33). Найти одну из пар подстрок ({s}_1,~{s}_2), решающих задачу\\'+
'локального выравнивания, используя алгоритм восходящей рекурсии\\'+
'для построения матрицы {v} (см.~\3), учитывая связь матрицы {v}\\'+
'с задачей локального выравнивания (см.~\1) и выполняя обратный\\'+
'проход по матрице~{v} (см.~\2). Если имеется несколько пар подстрок,\\'+
'решающих задачу локального выравнивания, то выбор пары выполнять\\'+
'в соответствии с указаниями \1. Вывести максимальное значение\\'+
'сходства {v}^*, позиции {i}^*, {j}^* начала подстрок {s}_1 и {s}_2, сами подстроки {s}_1 и {s}_2,\\'+
'а также оптимальное выравнивание ({A}_1,~{A}_2) для этих подстрок.'
);
  m := Rand(4,9);
  y := Random(7);
  repeat
//  repeat
  MakeStrS(20,29,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSS(-9,9);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y)and(length(s01)<=32);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
  DataN('m = ', m, xRight, 2,1);
  y := ShowSS(3);
//  ShowMatr('Элементы матрицы v:',dv,y,3);
  ss01 := '';
  if i1 > 0 then
    ss01 := Copy(s1,i1,i2-i1+1);
  ss02 := '';
  if j1 > 0 then
    ss02 := Copy(s2,j1,j2-j1+1);
  ResultN('v^* = ', dv[i2,j2],3,1,2);
  ResultN('i^* = ', i1,22,1,2);
  ResultN('j^* = ', j1,50,1,2);
  ResultS('s_1 = ', ss01,3,2);
  ResultS('s_2 = ', ss02,40,2);
  ResultComment('Оптимальное выравнивание s_1 и s_2:',3,3);
  ResultS('A_1 = ', s01,40,3);
  ResultS('A_2 = ', s02,40,4);
  ResultComment(Rule(5,length(s01)),40,5);
  SetTestCount(5);
end;


procedure CalcSSSpec(eq,neq: integer);
var i,j: integer;
begin
  for i := 1 to m+1 do
    ss[i,i] := eq;
  ss[m+1,m+1] := 0;
  for i := 1 to m do
    for j := i+1 to m+1 do
    begin
    ss[i,j] := neq;
    ss[j,i] := neq;
    end;
end;


procedure Alignment63;
var
  i,j,max0: integer;
begin
  CreateTask(Subgroup5);
TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти длину \Iнаибольшей общей подстроки\i строк {S}_1 и {S}_2,\\'+
'сведя эту задачу к определению характеристики {v}^* задачи локального\\'+
'выравнивания (см.~\2). Для этого значения матрицы оценок {s}\\'+
'определить следующим образом: {s}({x},\,{y})\,=\,1 при {x}\,=\,{y} и {s}({x},\,{y})\,=\,\-100 при {x}\,\n\,{y}\\'+
'({x}, {y} \= символы, входящие в строки {S}_1 и {S}_2, а также символ пробела).\\'+
'Для нахождения характеристики {v}^* построить матрицу {v}, используя алгоритм\\'+
'восходящей рекурсии (см.~\4). Вывести найденное значение {v}^*,\\'+
'номер {k} первой из строчек матрицы {v}, в которой содержится значение {v}^*,\\'+
'и элементы строчки {k} матрицы {v}: {v}_{k,j}, {j}\,=\,0,\,\.,\,|{S}_2|.'
);
  m := Rand(10,20);
//  repeat
  MakeStr(14,18,m,s1,s2);
  DType := 4;
  mm := length(s2);
  nn := length(s1);
  CalcSSSpec(1,-100);
  CalcV;
//  until k >= -99;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
//  DataN('m = ', m, xRight, 2,1);
//  ShowSS(3);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  max0 := -1;
  k := 0;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        k := i;
      end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultN('v^* = ',max0,xleft,1,2);
  ResultN('k = ',k,xright,1,2);
  ResultComment('v_{k,j}, j = 0,\.,|S_2|:',0,2);
  ResultComment(s0,0,3);
  for j := 0 to mm do
    ResultN('',dv[k,j],Center(j+1, mm+1, 3, 1), 4, 3);
  SetTestCount(5);
end;

procedure Alignment64;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, а также матрица {v}, полученная методом восходящей\\'+
'рекурсии (см.~\5) при использовании матрицы оценок {s} специального\\'+
'вида, описанной в \1. Найти одну из общих подстрок строк {S}_1 и {S}_2\\'+
'наибольшей длины, сведя эту задачу к определению пары подстрок ({s}_1,~{s}_2),\\'+
'решающих задачу локального выравнивания (см.~\3). Для нахождения\\'+
'подстрок {s}_1, {s}_2 учесть связь матрицы {v} с задачей локального выравнивания\\'+
'(см.~\3) и выполнить обратный проход по матрице~{v}\\'+
'(см.~\4). Если имеется несколько пар подстрок, решающих задачу\\'+
'локального выравнивания, то выбор пары выполнять в соответствии с указаниями\\'+
'\3. Вывести подстроку {s}_1 \= общую подстроку строк {S}_1 и {S}_2\\'+
'наибольшей длины (благодаря специальному выбору матрицы оценок эта подстрока\\'+
'будет совпадать с подстрокой {s}_2), а также позиции {i}^* и {j}^*, начиная\\'+
'с которых подстрока {s}_1 входит в строки {S}_1 и {S}_2 соответственно.'
);
  m := Rand(10,20);
  y := Random(7);
//  repeat
  repeat
  MakeStr(9,13,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
  until (nn+1)*(mm+1)+ 2 <=200;
  CalcSSSpec(1,-100);
  CalcV;
  max0 := -1;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        i2 := i;
        j2 := j;
      end;
  endij(i2,j2,i1,j1,s01,s02);
//  until (y=0) and (length(s01)=1) or (y>0)and(length(s01)>y);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
  ShowMatr('Элементы матрицы v:',dv,3,3);
  ResultS('s_1 = ', s01,0,2);
  ResultN('i^* = ', i1,xleft,4,2);
  ResultN('j^* = ', j1,xright,4,2);
  SetTestCount(5);
end;


procedure Alignment65;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup5);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти все общие подстроки строк {S}_1 и {S}_2 наибольшей\\'+
'длины, сведя эту задачу к определению пар подстрок ({s}_1,~{s}_2), решающих задачу\\'+
'локального выравнивания при использовании матрицы оценок специального вида,\\'+
'описанной в \2. Для нахождения подстрок {s}_1 и {s}_2 построить матрицу {v},\\'+
'используя алгоритм восходящей рекурсии (см.~\6), учесть связь\\'+
'матрицы {v} с задачей локального выравнивания (см.~\4) и выполнить\\'+
'обратный проход по матрице~{v} (см.~\5) для каждого элемента\\'+
'матрицы {v} с максимальным значением. Элементы {v}_{i,j} с максимальным значением\\'+
'перебирать по возрастанию индекса {i}, а для равных индексов {i} \= по возрастанию\\'+
'индекса {j}. Вывести каждую найденную общую подстроку наибольшей длины\\'+
'и позиции {i}^* и {j}^*, начиная с которых эта подстрока входит в строки {S}_1 и {S}_2\\'+
'соответственно. Вывести также количество найденных общих подстрок.'
);
  m := Rand(10,20);
  y := Rand(2,6);
  repeat
//  repeat
  MakeStrS(25,45,m,s1,s2);
  DType := 4;
  nn := length(s1);
  mm := length(s2);
//  until (nn+1)*(mm+1)+(m+1)*(m+2) div 2 + 3 <=200;
  CalcSSSpec(1,-100);
  CalcV;
  max0 := -1;
  k := 0;
  for i := 1 to nn do
    for j := 1 to mm do
      if dv[i,j]>max0 then
      begin
        max0 := dv[i,j];
        k := 1;
        i2 := i;
        j2 := j;
      end
      else
      if dv[i,j]=max0 then
        k := k + 1;
      endij(i2,j2,i1,j1,s01,s02);
  until (k >=y) and (k<=8) and (length(s01)>7-y) and (length(s01)<15);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(mm,nn)),3,4);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
//  ShowMatr('Элементы матрицы v:',dv,y,3);
  cnt := 0;
  y := 0;
  case k of
  1..4: y := 2;
  5..6: y := 1;
  end;
  for i2 := 1 to nn do
    for j2 := 1 to mm do
    if dv[i2,j2]=max0 then
    begin
      cnt := cnt + 1;
      if odd(cnt) then
      begin
        k := 3;
        y := y + 1;
      end
      else
        k := 41;
      Str(cnt,s00);
      endij(i2,j2,i1,j1,s01,s02);
      ResultS(s00+': ', s01,k,y);
      ResultN('i^* = ', i1,k+20,y,2);
      ResultN('j^* = ', j1,k+29,y,2);
    end;
  ResultN('Количество общих подстрок: ',cnt,0,5,2);
  SetTestCount(5);
end;

procedure BackLCS(var ss: string; var i1,j1: integer);
var i,j,ii,jj: integer;
begin
  ss := '';
  i1 := 0;
  j1 := 0;
  i := Length(s1);
  j := Length(s2);
  while i+j <> 0 do
  begin
    if df[i,j] = fleft then
    begin
      j := j-1;
    end
    else
    if df[i,j] = fup then
    begin
      i := i-1;
    end
    else
    begin
      ss := s1[i] + ss;
      i1 := i;
      j1 := j;
      i := i-1;
      j := j-1;
    end
  end;
end;


procedure Alignment66;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  b,b1: boolean;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {P} и {T} (|{P}|\,<\,|{T}|). \IПодпоследовательностью\i строки {T} называется\\'+
'строка, составленная из символов строки {T}, взятых в том порядке, в котором\\'+
'они входят в эту строку (символы, входящие в подпоследовательность, в отличие\\'+
'от символов \Iподстрок\i, не обязаны располагаться подряд в исходной строке).\\'+
'Просматривая символы строк {P} и {T} не более одного раза, проверить, входит ли\\'+
'строка {P} в качестве подпоследовательности в строку {T}, и вывести \t,\\'+
'если входит, и \f в противном случае. Вывести также количество сравнений\\'+
'символов, которое потребовалось для решения задачи. В алгоритме учесть,\\'+
'что если еще не просмотренная часть строки {T} имеет размер, меньший\\'+
'еще не просмотренной части строки {P}, то строка {P}\\'+
'не может быть подпоследовательностью строки {T}.'
);
  m := Rand(10,20);
//  y := Random(1)+1;
  repeat
  repeat
  MakeStrLCS(25,45,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1)and(abs(i1-j1)>6)and(i1 > 1) and(j1>1);
  mm := length(s00);
  res := Random(2);
  if res = 0 then
    s00[Rand(1,mm)] := Randc(m);
  DataS('P = ',s00,3,2);
  DataS('T = ',s1,3,3);
  DataComment(Rule(4,length(s1)),3,4);
  cnt := 0;
  i1 := 1;
  i2 := 1;
  while (nn-i1 >= mm-i2) and (i2 <= mm) do
  begin
    inc(cnt);
    if s1[i1] = s00[i2] then
      i2 := i2 + 1;
    i1 := i1 + 1;
  end;
  b := i2 > mm;
  ResultB('Результат проверки: ', b,0,2);
  ResultN('Количество сравнений: ', cnt,0,4,2);
  SetTestCount(5);
end;


procedure Alignment67;
var
  i,j: integer;
begin
  CreateTask(Subgroup6);
TaskTextExt(
'Даны строки {S}_1 и {S}_2. \IОбщей подпоследовательностью\i строк {S}_1 и {S}_2\\'+
'называется подпоследовательность, которая входит одновременно в {S}_1 и {S}_2.\\'+
'Задача о \Iнаибольшей общей подпоследовательности\i заключается в поиске самой\\'+
'длинной общей подпоследовательности (англ. longest common subsequence \= LCS)\\'+
'строк {S}_1 и {S}_2. Длина LCS для двух строк совпадает со значением сходства\\'+
'этих строк (см.~\37), если матрица оценок определяется следующим\\'+
'образом: {s}({x},\,{y})\,=\,1 при {x}\,=\,{y} и {s}({x},\,{y})\,=\,0 при {x}\,\n\,{y} ({x}, {y} \= символы, входящие\\'+
'в строки {S}_1 и {S}_2, а также символ пробела). Найти длину LCS для данных\\'+
'строк {S}_1 и {S}_2, используя алгоритм восходящей рекурсии для построения\\'+
'матрицы~{V} (см.~\36). Вывести элементы двух последних строчек\\'+
'матрицы~{V}: {V}_{n\-1,j}, {j}\,=\,0,\,\.,\,|{S}_2|, {V}_{n,j}, {j}\,=\,0,\,\.,\,|{S}_2|, где {n}\,=\,|{S}_1|\\'+
'(искомая длина LCS будет равна последнему элементу матрицы~{V}).'
);
  m := Rand(10,20);
  repeat
  MakeStr(14,18,m,s1,s2);
  mm := length(s2);
  nn := length(s1);
  CalcSSSpec(1,0);
  CalcV;
  until dv[nn,mm]>3;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(4,max(mm,nn)),4,4);
  s0 := '';
  for j := 0 to mm do
  begin
    str(j:4,s00);
    s0 := s0 + s00;
  end;
  if Odd(length(s0)) then
    s0 := s0+ ' ';
  ResultComment(s0,0,1);
  ResultComment('V_{n\-1,j}, j = 0,\.,|S_2|:',0,2);
  for j := 0 to mm do
    ResultN('',dv[nn-1,j],Center(j+1, mm+1, 3, 1), 3, 3);
  ResultComment('V_{n,j}, j = 0,\.,|S_2|:',0,4);
  for j := 0 to mm do
    ResultN('',dv[nn,j],Center(j+1, mm+1, 3, 1), 5, 3);
  SetTestCount(5);
end;


procedure Alignment68;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, а также матрица {V}, полученная методом восходящей\\'+
'рекурсии (см.~\37) при использовании матрицы оценок специального\\'+
'вида, описанной в \1. Найти одну из наибольших общих\\'+
'подпоследовательностей (LCS) строк {S}_1 и {S}_2, выполняя обратный проход\\'+
'по матрице {V} по правилам, приведенным в \35. Строка,\\'+
'соответствующая LCS, заполняется справа налево; очередной символ добавляется\\'+
'к ней в случае, когда переход от элемента {V}_{i,j} выполняется по диагонали\\'+
'(к элементу {V}_{i\-1,j\-1}, имеющему значение, на 1 меньшее значения {V}_{i,j});\\'+
'при этом к строке LCS добавляется символ {S}_1[{i}] (равный символу {S}_2[{j}]). Если\\'+
'на некотором шаге обратного хода имеется несколько вариантов выбора очередного\\'+
'элемента, то выбор предпочтительного варианта выполнять в соответствии\\'+
'с указаниями \34. Вывести строку, соответствующую найденной LCS,\\'+
'и позиции {i} и {j}, с которых начинается найденная LCS в строках {S}_1 и {S}_2.\\'+
''
);
//влево, затем вверх, затем по диагонали//
  m := Rand(10,20);
  y := Random(7);
  repeat
  repeat
  MakeStr(9,13,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]) and ((nn+1)*(mm+1)+ 2 <=200);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1);
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(mm,nn)),3,3);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
  ShowMatr('Элементы матрицы V:',dv,3,3);
  ResultS('LCS: ', s00,0,2);
  ResultN('i = ', i1,xleft,4,2);
  ResultN('j = ', j1,xright,4,2);
  SetTestCount(5);
end;

procedure Alignment69;
var
  i,j,res,cnt,i1,i2,j1,j2,max0: integer;
  ss01,ss02: string;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2. Найти одну из наибольших общих подпоследовательностей\\'+
'(LCS) строк {S}_1 и {S}_2, используя алгоритм восходящей рекурсии для построения\\'+
'матрицы~{V} (см.~\38) и выполняя обратный проход по матрице~{V}\\'+
'(см.~\1). Если на некотором шаге обратного хода имеется несколько\\'+
'вариантов выбора очередного элемента, то выбор предпочтительного варианта\\'+
'выполнять в соответствии с указаниями \35. Вывести строку,\\'+
'соответствующую найденной LCS, и позиции {i} и {j}, с которых начинается\\'+
'найденная LCS в строках {S}_1 и {S}_2.'
);
//влево, затем вверх, затем по диагонали//
  m := Rand(10,20);
//  y := Random(1)+1;
  repeat
  repeat
  MakeStrLCS(25,45,m,s1,s2);
  nn := length(s1);
  mm := length(s2);
  until (s1[1]<>s2[1]);
  CalcSSSpec(1,0);
  CalcV;
  BackLCS(s00,i1,j1);
  until (length(s00) > 4)and(dk[nn,mm]>1)and(abs(i1-j1)>6)and(i1 > 1) and(j1>1);
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(mm,nn)),3,4);
//  DataN('m = ', m, xRight, 2,1);
//  y := ShowSS(3);
//  ShowMatr('Элементы матрицы V:',dv,3,3);
  ResultS('LCS: ', s00,0,2);
  ResultN('i = ', i1,xleft,4,2);
  ResultN('j = ', j1,xright,4,2);
  SetTestCount(5);
end;


procedure Cover1;
var i,j,k: integer;
begin
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := seq[1];
  for i := 2 to nn do
  begin
    k := 0;
    for j := 1 to mm do
    begin
      inc(cnt);
      if seq[i]<=cov[j,ind[j]] then
      begin
        k := j;
        break;
      end;
    end;
    if k = 0 then
    begin
      inc(mm);
      ind[mm] := 0;
      k := mm;
    end;
    inc(ind[k]);
    cov[k,ind[k]] := seq[i];
  end;
end;

procedure Cover2;
var i0,i,j,k: integer;
begin
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := seq[1];
  cov[0,1] := -1;
  ind[0] := 1;
  cov[2,1] := 1000;
  ind[2] := 1;
  for i0 := 2 to nn do
  begin
    i := 0;
    j := mm+1;
    while j-i<>1 do
    begin
      k := i+(j-i) div 2;
      inc(cnt);
      if cov[k,ind[k]]>=seq[i0] then
        j := k
      else
        i := k;
    end;
    if j = mm+1 then
    begin
      inc(mm);
      ind[mm] := 0;
      cov[mm+1,1] := 1000;
      ind[mm+1] := 1;
    end;
    inc(ind[j]);
    cov[j,ind[j]] := seq[i0];
  end;
end;

procedure SubSeq;
var i,j,k: integer;
begin
  k := mm;
  seq1[k] := cov[mm,ind[mm]];
  for k := mm-1 downto 1 do
    for i := 1 to ind[k] do
    begin
      inc(cnt);
      if cov[k,i] < seq1[k+1] then
      begin
        seq1[k] := cov[k,i];
        break;
      end;
    end;
end;

procedure Alignment70;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Дано число {N} (\l\,50) и набор {A} из {N} чисел. \IПодпоследовательностью\i набора {A}\\'+
'называется набор элементов из {А}, расположенных в том же порядке, в котором\\'+
'они входят в исходный набор~{A}. \IПокрытием\i набора {A} называется совокупность\\'+
'\Iневозрастающих\i подпоследовательностей {A}; при этом каждый элемент набора {A}\\'+
'входит в покрытие ровно один раз. \IРазмером покрытия\i называется число\\'+
'входящих в него подпоследовательностей. \IНаименьшим покрытием\i называется\\'+
'покрытие наименьшего размера. Найти наименьшее покрытие {A}, используя\\'+
'следующий \Iжадный алгоритм\i: \(\X элементы {A} перебираются, начиная с первого,\\'+
'и каждый элемент помещается в конец первой невозрастающей\\'+
'подпоследовательности, которую он может продолжить (существующие\\'+
'подпоследовательности перебираются в порядке возрастания их номеров);\|\\'+
'\X если ни одну существующую подпоследовательность очередной элемент\\'+
'из {A} продолжить не может, то он начинает подпоследовательность с новым\\'+
'порядковым номером.\) Вывести размер полученного покрытия и все элементы\\'+
'каждой входящей в него подпоследовательности, перебирая подпоследовательности\\'+
'в порядке возрастания их номеров. Вывести также количество сравнений чисел\\'+
'из набора {A}, которое потребовалось для нахождения наименьшего покрытия.\\'+
'\P\SПримечание\s. Описанный алгоритм построения наименьшего покрытия\\'+
'имеет порядок {O}({N}\*{K}), где {N} \= размер исходного набора,\\'+
'а {K} \= размер наименьшего покрытия.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover1;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('Набор A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('Размер покрытия: ',mm,xLeft,1,2);
  ResultComment('Подпоследовательности, входящие в покрытие:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    ResultComment(s00+':',2,y);
    for j := 1 to ind[i] do
      ResultN('',cov[i,j],6+(j-1)*3,y,2);
  end;
  ResultN('Количество сравнений: ',cnt,0,y+1,3);
  SetTestCount(5);
end;


procedure Alignment71;
var
  i,j,k,mind,k1,k2,b: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Дано число {N} (\l\,50), число {B} и набор из {N} чисел {A}_i, {i}\,=\,1,\,\.,\,{N}. Числа {A}_i\\'+
'упорядочены по неубыванию. Определить позицию {j} в наборе {A}, в которую надо\\'+
'вставить число {B} с сохранением упорядоченности набора. Использовать для этого\\'+
'следующий вариант \Iалгоритма бинарного поиска\i:\( (1) в набор {A} добавляются два\\'+
'\<барьерных\> элемента: {A}_0, меньший min\{{A}_1,~{B}\} (\<минус бесконечность\>),\\'+
'и {A}_{N+1}, больший max\{{A}_N, {B}\} (\<плюс бесконечность\>);\| (2) переменная {i}\\'+
'полагается равной 0, переменная {j} \= равной {N}\,+\,1;\| (3) пока справедливо\\'+
'неравенство {j}\,\-\,{i}\,\n\,1, выполнять следующие действия: положить переменную\\'+
'{k} равной {i}\,+\,({j}\,\-\,{i})/2 (символ \</\> обозначает операцию деления нацело);\\'+
'если {A}_k\,\g\,{B}, то записать значение {k} в переменную {j}, иначе записать значение {k}\\'+
'в переменную {i}.\) После завершения алгоритма для найденной позиции {j} будет\\'+
'выполняться двойное неравенство (с учетом наличия барьерных элементов):\\'+
'{A}_{j\-1}\,<\,{B}\,\l\,{A}_j; таким образом, {j} будет определять требуемую позицию вставки\\'+
'элемента~{B}. Вывести найденную позицию {j} и количество сравнений чисел {A}_k и {B},\\'+
'выполненных в цикле~(3), которое потребовалось для ее определения.\\'+
'\P\SПримечание\s. Алгоритм бинарного поиска имеет порядок {O}(log~{N}), где {N} \= размер\\'+
'исходного набора чисел. При вычислении значения {k} фактически берется среднее\\'+
'арифметическое для {i} и {j}, т.\,е. ({i}\,+\,{j})/2 (с учетом целочисленного деления),\\'+
'однако использованная формула {i}\,+\,({j}\,\-\,{i})/2 является более надежной, так как\\'+
'обеспечивает защиту от переполнения при больших значениях {i} и~{j}.'
);
//  m := Rand(10,20);
  k1 := Rand(5,15);
  k2 := Rand(80,95);
  nn := Rand(10,50);
  for i := 1 to nn do
    seq[i] := Rand(k1,k2);
  for k := 1 to nn-1 do
    for i := 1 to nn -k do
      if seq[i]>seq[i+1] then
        swap(seq[i],seq[i+1]);
  case Random(5) of
  0: b := Rand(1,seq[1]-1);
  1: b := Rand(seq[nn+1],99);
  else
     b := Rand(1,99);
  end;
  cnt := 0;
  seq[0] := -1;
  seq[nn+1] := 100;
  i := 0;
  j := nn+1;
  while j-i<>1 do
  begin
    k := i+(j-i) div 2;
    inc(cnt);
    if seq[k]>=b then
      j := k
    else
      i := k;
  end;
  DataN('N = ', nn, xLeft, 1, 2);
  DataN('B = ', b, 0, 1, 2);
  DataComment('Набор A:', xRight,1);
  if nn > 25 then
  begin
  for i := 1 to 25 do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i,25,2,1),2);
    DataN('',seq[i],Center(i,25,2,1),3,2);
  end;
  for i := 26 to nn do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i-25,25,2,1),4);
    DataN('',seq[i],Center(i-25,25,2,1),5,2);
  end;
  end
  else
  for i := 1 to nn do
  begin
    Str(i:2,s00);
    DataComment(s00,Center(i,25,2,1),2);
    DataN('',seq[i],Center(i,25,2,1),3,2);
  end;
  ResultN('j = ',j,0,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment72;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Дано число {N} (\l\,50) и набор {A} из {N} чисел. Найти наименьшее покрытие {A},\\'+
'используя модификацию жадного алгоритма, описанного в \2.\\'+
'В \Iмодифицированном жадном алгоритме\i учитывается следующее свойство\\'+
'подпоследовательностей, входящих в покрытие: в любой момент выполнения жадного\\'+
'алгоритма последние элементы существующих подпоследовательностей \Iупорядочены\i\\'+
'\Iпо возрастанию\i. Поэтому для нахождения подпоследовательности с наименьшим\\'+
'номером, которую может продолжить очередной элемент из набора {A}, можно\\'+
'использовать алгоритм бинарного поиска, описанный в \1. При реализации\\'+
'алгоритма бинарного поиска можно считать, что значения элементов из набора {A}\\'+
'лежат в диапазоне от 0 до 1000. Вывести размер полученного покрытия\\'+
'и все элементы каждой входящей в него подпоследовательности, перебирая\\'+
'подпоследовательности в порядке возрастания их номеров. Вывести также\\'+
'количество сравнений чисел из набора {A}, которое потребовалось\\'+
'для нахождения наименьшего покрытия.\\'+
'\P\SПримечание\s. Благодаря использованию алгоритма бинарного поиска\\'+
'модифицированный жадный алгоритм построения наименьшего покрытия имеет\\'+
'порядок {O}({N}\*log\,{K}), где {K} \= размер наименьшего покрытия.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('Набор A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('Размер покрытия: ',mm,xLeft,1,2);
  ResultComment('Подпоследовательности, входящие в покрытие:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    ResultComment(s00+':',2,y);
    for j := 1 to ind[i] do
      ResultN('',cov[i,j],6+(j-1)*3,y,2);
  end;
  ResultN('Количество сравнений: ',cnt,0,y+1,3);
    Cover1;
  Str(cnt,s00);
  ResultComment('Примечание. Количество сравнений для исходного жадного алгоритма равно '+s00,3,y+2);

  SetTestCount(5);
end;

procedure Alignment73;
var
  i,j,mind,kk: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Дано наименьшее покрытие некоторого набора чисел {A} (см.~\3):\\'+
'вначале указывается количество {K} входящих в него невозрастающих\\'+
'подпоследовательностей ({K}\,\l\,15), затем для каждой подпоследовательности\\'+
'(в порядке возрастания их номеров) указывается число элементов\\'+
'подпоследовательности~{L} (\l\,15) и сами элементы. Найти одну из \Iнаибольших\i\\'+
'\Iвозрастающих подпоследовательностей\i (англ. longest increasing sequence \= LIS)\\'+
'исходного набора {A}, используя следующий алгоритм:\( \X элементы LIS определяются\\'+
'с конца (в порядке убывания их номеров), число элементов равно {K};\|\\'+
'\X в качестве последнего, {K}-го элемента LIS берется последний элемент\\'+
'последней, {K}-й подпоследовательности;\| \X затем перебираются остальные\\'+
'подпоследовательности (в порядке убывания их номеров), из каждой\\'+
'подпоследовательности выбирается первый из элементов, значение которых строго\\'+
'меньше элемента, ранее добавленного в LIS, и этот элемент добавляется к LIS\\'+
'перед ранее добавленным элементом.\) Вывести элементы построенной наибольшей\\'+
'возрастающей подпоследовательности, а также количество сравнений чисел\\'+
'из набора {A}, которое потребовалось для нахождения LIS.\\'+
'\P\SПримечание\s. Описанный алгоритм построения LIS по наименьшему покрытию имеет\\'+
'порядок {O}({N}), где {N} \= общее число элементов в исходном наборе, так как в ходе\\'+
'этого алгоритма каждый элемент набора анализируется не более одного раза.'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  mind := 0;
  kk := 0;
  for i := 1 to mm do
  begin
    kk := kk + ind[i];
    if ind[i]>mind then
      mind := ind[i];
  end;
  until (mm <=15)and (mind <= 15);
  DataN('K = ', mm, xLeft, 1, 2);
  DataComment('Подпоследовательности, входящие в покрытие:',35,1);
  y := 1;
  for i := 1 to mm do
  begin
    y := y + 1;
    Str(i:2,s00);
    DataN(s00+':       L = ',ind[i],2,y,2);
    for j := 1 to ind[i] do
      DataN('',cov[i,j],26+(j-1)*3,y,2);
  end;
  cnt := 0;
  SubSeq;
  ResultComment('Элементы LIS:',0,2);
  for i := 1 to mm do
    ResultN('',seq1[i],Center(i,mm,2,1),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  Str(kk,s00);
  ResultComment('Примечание. Количество элементов в исходном наборе A равно '+s00,3,5);
  SetTestCount(5);
end;

procedure Alignment74;
var
  i,j,mind: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Дано число {N} (\l\,50) и набор {A} из {N} чисел. Используя модифицированный\\'+
'жадный алгоритм построения наименьшего покрытия~{A} (см.~\2)\\'+
'и алгоритм нахождения наибольшей возрастающей подпоследовательности набора {A}\\'+
'по его наименьшему покрытию (см.~\1), найти одну из наибольших\\'+
'возрастающих подпоследовательностей (LIS) набора {A}. Вывести размер LIS,\\'+
'ее элементы, а также количество сравнений чисел из набора {A}, которое\\'+
'потребовалось для нахождения LIS.\\'+
'\P\SПримечание\s. Полный алгоритм построения LIS, включающий предварительное\\'+
'построение наименьшего покрытия, имеет порядок {O}({N}\*log\,{K}),\\'+
'где {N} \= число элементов в исходном наборе, а {K} \= длина LIS\\'+
'(равная размеру наименьшего покрытия).'
);
//  m := Rand(10,20);
  repeat
  nn := Rand(26,50);
  for i := 1 to nn do
    seq[i] := Rand(1,99);
  Cover2;
  SubSeq;
  mind := 0;
  for i := 1 to mm do
    if ind[i]>mind then
      mind := ind[i];
  until mind <= 24;
  DataN('N = ', nn, xLeft, 2, 2);
  DataComment('Набор A:', xRight,2);
  for i := 1 to 25 do
    DataN('',seq[i],Center(i,25,2,1),3,2);
  for i := 26 to nn do
    DataN('',seq[i],Center(i-25,25,2,1),4,2);
  ResultN('Размер LIS: ',mm,xLeft,2,2);
  ResultComment('Элементы LIS:',xRight,2);
  for i := 1 to mm do
      ResultN('',seq1[i],Center(i,mm,2,1),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  SetTestCount(5);
end;

function cton(c:char): integer;
begin
  result := ord(c)-ord('a')+1;
end;

procedure MakeSeq;
var i,j,k: integer;
begin
  for i := 1 to m do
    indl[i] := 0;
  for i := length(s2) downto 1 do
  begin
    k := cton(s2[i]);
    inc(indl[k]);
    ll[k,indl[k]] := i;
  end;
  nl := 0;
  for i := 1 to length(s1) do
  begin
    l[i] := cton(s1[i]);
    nl := nl + indl[l[i]];
  end;
end;

var l1,l2: integer;

procedure InitL;
begin
  l1 := 1;
  l2 := 0;
end;

function NextL: integer;
begin
  inc(l2);
  while l2 > indl[l[l1]] do
  begin
    inc(l1);
    l2 := 1;
  end;
  result := ll[l[l1],l2];
end;

procedure Alignment75;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 (|{S}_2|\,\l\,|{S}_1|\,<\,20) и число {m} (<\,10) \= размер алфавита,\\'+
'состоящего из первых строчных латинских букв. Построить по данным строкам\\'+
'набор чисел, используя следующий алгоритм: \(\X для каждого символа {x},\\'+
'встречающегося в {S}_1, создается список тех позиций, в которых символ {x}\\'+
'встречается в {S}_2, причем позиции в этом списке перебираются \Iпо убыванию\i;\|\\'+
'\X в результирующий набор чисел помещаются созданные списки в порядке,\\'+
'соответствующем порядку следования в строке {S}_1 связанных с этими списками\\'+
'символов (один и тот же список может быть добавлен в набор несколько раз,\\'+
'если соответствующий этому списку символ несколько раз входит в строку {S}_1).\)\\'+
'С помощью подходящих структур данных (например, вспомогательных одномерного\\'+
'и двумерного массива) обеспечить построение всех списков позиций за один\\'+
'просмотр строки {S}_2. Чтобы избежать многократного дублирования полученных\\'+
'списков, удобно хранить результирующий набор в виде \Iмассива ссылок\i\\'+
'на созданные списки. Вывести размер полученного набора чисел и его элементы.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
//    s1 := 'ababacabacaba';
//    s2 := 'acabacaba';
    until length(s2)<=length(s1);
    MakeSeq;
  until nl in [26..75];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
  DataN('m = ', m, xRight, 3,1);
  ResultN('Размер полученного набора: ', nl,xLeft,2,2);
  ResultComment('Элементы набора: ', xRight,2);
  InitL;
  for i := 1 to 25 do
    ResultN('',NextL,Center(i,25,2,1),3,2);
  if nl <= 50 then
    for i := 26 to nl do
      ResultN('',NextL,Center(i-25,25,2,1),4,2)
  else
  begin
    for i := 26 to 50 do
      ResultN('',NextL,Center(i-25,25,2,1),4,2);
    for i := 51 to nl do
      ResultN('',NextL,Center(i-50,25,2,1),5,2);
  end;
  SetTestCount(5);
end;


procedure Cover2a;
var i0,i,j,k,e: integer;
begin
  InitL;
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov[1,1] := NextL;//seq[1];
  cov[0,1] := -1;
  ind[0] := 1;
  cov[2,1] := 1000;
  ind[2] := 1;
  for i0 := 2 to nl do
  begin
    i := 0;
    j := mm+1;
    e := NextL;
    while j-i<>1 do
    begin
      k := i+(j-i) div 2;
      inc(cnt);
      if cov[k,ind[k]]>=e{seq[i0]} then
        j := k
      else
        i := k;
    end;
    if j = mm+1 then
    begin
      inc(mm);
      ind[mm] := 0;
      cov[mm+1,1] := 1000;
      ind[mm+1] := 1;
    end;
    inc(ind[j]);
    cov[j,ind[j]] := e;//seq[i0];
  end;
end;


procedure Alignment76;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2, число {N} (\l\,50) и набор {A} из {N} чисел, построенный\\'+
'по строкам {S}_1 и {S}_2 в соответствии с алгоритмом, описанным в \1.\\'+
'Данный набор обладает следующим свойством: любая возрастающая\\'+
'подпоследовательность набора {A} определяет некоторую общую\\'+
'подпоследовательность строк {S}_1 и {S}_2 той же длины, причем для получения\\'+
'общей подпоследовательности символов достаточно взять символы строки {S}_2,\\'+
'расположенные в позициях, равных значениям элементов числовой\\'+
'подпоследовательности. Поэтому любая наибольшая возрастающая\\'+
'подпоследовательность (LIS) набора {A} определяет некоторую \Iнаибольшую общую\i\\'+
'\Iподпоследовательность\i (LCS) строк {S}_1 и {S}_2. Используя модифицированный\\'+
'жадный алгоритм построения наименьшего покрытия набора~{A} (см.~\4)\\'+
'и алгоритм нахождения наибольшей возрастающей подпоследовательности {A}\\'+
'по наименьшему покрытию (см.~\3), найти одну из LIS набора {A}\\'+
'и вывести соответствующую ей LCS для строк {S}_1 и {S}_2 в виде строки символов.\\'+
'Вывести также количество сравнений чисел из набора {A},\\'+
'которое потребовалось для нахождения LIS.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
    until length(s2)<length(s1);
    MakeSeq;
  until nl in [26..50];
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataComment(Rule(5,max(length(s1),length(s2))),3,3);
  DataN('N = ', nl,xRight,2,2);
  DataComment('Элементы набора A: ', xRight,3);
  InitL;
  for i := 1 to 25 do
    DataN('',NextL,Center(i,25,2,1),4,2);
  for i := 26 to nl do
    DataN('',NextL,Center(i-25,25,2,1),5,2);
  Cover2a;
  Subseq;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq1[i]];
  ResultS('LCS: ',s00,32,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure Alignment77;
var
  i,j,l1,l2: integer;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1 и {S}_2 (|{S}_2|\,\l\,|{S}_1|\,<\,20) и число {m} (<\,10) \= размер алфавита,\\'+
'состоящего из первых строчных латинских букв. Построить по данным строкам\\'+
'набор чисел {A}, описанный в \2, и, используя модифицированный\\'+
'жадный алгоритм построения наименьшего покрытия {A} (см.~\5)\\'+
'и алгоритм нахождения наибольшей возрастающей подпоследовательности (LIS)\\'+
'набора {A} по наименьшему покрытию (см.~\4), найти одну из LIS\\'+
'набора {A} и вывести соответствующую ей наибольшую общую подпоследовательность\\'+
'(LCS) для строк {S}_1 и {S}_2 (см.~\1) в виде строки символов. Вывести\\'+
'также количество сравнений чисел из набора {A}, которое потребовалось\\'+
'для нахождения LIS.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    repeat
    MakeStrLCS(14,18,m,s1,s2);
    until length(s2)<=length(s1);
    MakeSeq;
  until nl in [26..50];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataComment(Rule(5,max(length(s1),length(s2))),3,4);
  DataN('m = ', m, xRight, 3,1);
{  DataComment('Элементы набора A: ', xRight,3);
  InitL;
  for i := 1 to 25 do
    DataN('',NextL,Center(i,25,2,1),4,2);
  for i := 26 to nl do
    DataN('',NextL,Center(i-25,25,2,1),5,2);}
  Cover2a;
  Subseq;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq1[i]];
  ResultS('LCS: ',s00,32,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  SetTestCount(5);
end;

procedure MakeStrLCS2(a,b,m: integer; var s1,s2,s3: string);
var i,nn,mm,k: integer;
procedure Minmax(var s1,s2: string);
var s0: string;
begin
  if length(s1)>length(s2) then
  begin
    s0 := s1;
    s1 := s2;
    s2 := s0;
  end;
end;
begin
  DType := 0;
  WD := 1;
  WR := 1;
  s1 := '';
  for i := 1 to Rand(a,b) do
    s1 := s1 + randc(m);
  nn := length(s1);

  s2 := TransformStr(m,s1);
  s3 := TransformStr(m,s1);

  mm := length(s2);
  k := Random(3);
  if k in [0,1] then
  for i := 1 to Rand(5,15) do
    s2 := randc(m) + s2;
  if k in [1,2] then
  for i := 1 to Rand(5,15) do
    s1 := randc(m) + s1;
  if length(s1) > b then
  for i := 1 to length(s1)-b do
    delete(s1,Rand(1,length(s1)),1);
  if length(s2) > b then
  for i := 1 to length(s2)-b do
    delete(s2,Rand(1,length(s2)),1);
  s1 := Copy(s1,1,nn);
  s2 := Copy(s2,1,mm);
  if s2 = '' then
    s2 := randc(m);
  if length(s2) < a then
  for i := 1 to a - length(s2) do
    insert(randc(m),s2, Rand(1,length(s2)));

  mm := length(s3);
  k := Random(2);
  if k =0 then
  for i := 1 to Rand(5,15) do
    s3 := randc(m) + s3;
  if length(s3) > b then
  for i := 1 to length(s3)-b do
    delete(s3,Rand(1,length(s3)),1);
  s3 := Copy(s3,1,mm);
  if s3 = '' then
    s3 := randc(m);
  if length(s3) < a then
  for i := 1 to a - length(s3) do
    insert(randc(m),s3, Rand(1,length(s3)));
  Minmax(s3,s2);
  Minmax(s2,s1);
  Minmax(s3,s2);
end;




procedure MakeSeq2;
var i,j,k: integer;
begin
  for i := 1 to m do
  begin
    indl[i] := 0;
    indl2[i] := 0;
  end;
  for i := length(s2) downto 1 do
  begin
    k := cton(s2[i]);
    inc(indl[k]);
    ll[k,indl[k]] := i;
  end;
  for i := length(s3) downto 1 do
  begin
    k := cton(s3[i]);
    inc(indl2[k]);
    ll2[k,indl2[k]] := i;
  end;
  nl := 0;
  for i := 1 to length(s1) do
  begin
    l[i] := cton(s1[i]);
    nl := nl + indl[l[i]]*indl2[l[i]];
  end;
end;

var l12,l22: integer;

procedure InitL2;
begin
  l1 := 1;
  l2 := 1;
  l22 := 0;
end;

function NextL2: Pair;
begin
  inc(l22);
  if indl2[l[l1]] < l22 then
  begin
    inc(l2);
    l22 := 1;
  end;
  while (l2 > indl[l[l1]])or(l22 > indl2[l[l1]]) do
  begin
    inc(l1);
    l2 := 1;
    l22 := 1;
  end;
  result.x2 := ll[l[l1],l2];
  result.x3 := ll2[l[l1],l22];
end;


procedure Alignment78;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 и {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20) и число {m} (<\,10) \= размер\\'+
'алфавита, состоящего из первых строчных латинских букв. Построить по данным\\'+
'строкам набор пар чисел, используя следующий алгоритм: \(\X для каждого\\'+
'символа {x}, встречающегося в {S}_1, создается список пар ({i},\,{j}), в которых\\'+
'элемент {i} соответствует позиции вхождения символа {x} в {S}_2, а элемент {j} \=\\'+
'позиции вхождения этого же символа в {S}_3; пары содержат все возможные\\'+
'комбинации позиций вхождения и располагаются по \Iлексикографическому убыванию\i:\\'+
'({x}_1,\,{x}_2)\,>\,({y}_1,\,{y}_2), если либо {x}_1\,>\,{y}_1, либо {x}_1\,=\,{y}_1 и {x}_2\,>\,{y}_2;\| \X в результирующий набор\\'+
'пар чисел помещаются созданные списки в порядке, соответствующем порядку\\'+
'следования в строке {S}_1 связанных с этими списками символов (один и тот же\\'+
'список может быть добавлен в набор несколько раз, если соответствующий этому\\'+
'списку символ несколько раз входит в строку {S}_1).\) Используя вспомогательные\\'+
'структуры данных (например, два вспомогательных одномерных и двумерных\\'+
'массива) для хранения позиций, связанных со строками {S}_2 и {S}_3 по отдельности,\\'+
'обеспечить построение требуемого набора за один просмотр строк {S}_2\\'+
'и {S}_3. Вывести размер полученного набора и его элементы \= пары чисел.'
);
  m := Rand(4,9);
//  m := 3;
//  y := Random(1)+1;
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
//    s1 := 'ababacabacaba';
//    s2 := 'acabacaba';
  MakeSeq2;
  until nl in [30..70];
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataS('S_3 = ',s3,3,4);
  DataComment(Rule(5,length(s1)),3,5);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
  DataN('m = ', m, xRight, 4,1);
  ResultN('Размер полученного набора: ', nl,xLeft,1,2);
  ResultComment('Элементы набора: ', xRight,1);
  InitL2;
  y := 1;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-2)*10:2,s00);
  ResultComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    ResultN('(',e.x2,Center(i,10,7,0)+2,y,2);
    ResultN(',',e.x3,Center(i,10,7,0)+5,y,2);
    ResultComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-1)*10:2,s00);
    ResultComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      ResultN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      ResultN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      ResultComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;
  SetTestCount(5);
end;



procedure SubSeq2;
var i,j,k,max,par,q: integer;
    seq: array [0..2*nmax] of pair;
begin
  InitL2;
  for i := 1 to nl do
    seq[i] := NextL2;
  cnt := 0;
  for i := 1 to nl do
  begin
    max := 0;
    par := 0;
    for j := 1 to i-1 do
    begin
      if p2[j]>max then
      begin
        cnt := cnt + 1;
        if (seq[j].x2 < seq[i].x2) and (seq[j].x3 < seq[i].x3) then
        begin
          max := p2[j];
          par := j;
        end;
      end;
    end;
    p2[i] := max+1;
    b2[i] := par;
  end;
  mm := p2[1];
  k := 1;
  for i := 2 to nl do
    if p2[i]> mm then
    begin
      mm := p2[i];
      k := i;
    end;
  seq2[mm] := seq[k];
  for i := mm-1 downto 1 do
  begin
    k := b2[k];
    seq2[i] := seq[k];
  end;
end;



function GreaterThan(a,b:Pair): boolean;
begin
  result := (a.x2 > b.x2) and (a.x3 > b.x3);
end;

var    cov2: array[0..2*nmax,0..2*nmax] of pair;


procedure Cover2b;
var i,j,k: integer;
    e: pair;
begin
  InitL2;
  cnt := 0;
  mm := 1;
  ind[1] := 1;
  cov2[1,1] := NextL2;//seq[1];
  for i := 2 to nl do
  begin
    k := 0;
    e := NextL2;
    for j := 1 to mm do
    begin
      inc(cnt);
      if not GreaterThan(e,cov2[j,ind[j]]) then
      begin
        k := j;
        break;
      end;
    end;
    if k = 0 then
    begin
      inc(mm);
      ind[mm] := 0;
      k := mm;
    end;
    inc(ind[k]);
    cov2[k,ind[k]] := e;
  end;
end;

procedure SubSeq2b;
var i,j,k: integer;
begin
  k := mm;
  seq2[k] := cov2[mm,ind[mm]];
  for k := mm-1 downto 1 do
    for i := 1 to ind[k] do
    begin
      inc(cnt);
      if GreaterThan( seq2[k+1],cov2[k,i]) then
      begin
        seq2[k] := cov2[k,i];
        break;
      end;
    end;
end;

procedure Alignment79;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 и {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20), число {N} (\l\,70) и набор {A} из {N} пар\\'+
'чисел, построенный по строкам {S}_1, {S}_2 и {S}_3 в соответствии с алгоритмом,\\'+
'описанным в \1. Значение пары чисел {X}\,=\,({x}_1,\,{x}_2) считается\\'+
'\Iстрого меньшим\i значения пары {Y}\,=\,({y}_1,\,{y}_2) (обозначение {X}\,<\,{Y}), если одновременно\\'+
'выполняются два строгих неравенства: {x}_1\,<\,{y}_1 и {x}_2\,<\,{y}_2. \IВозрастающей\i\\'+
'\Iподпоследовательностью\i набора {A} считается подпоследовательность пар, в которой\\'+
'любой элемент подпоследовательности строго меньше последующего элемента.\\'+
'Набор {A} обладает следующим свойством: любая его возрастающая (в указанном\\'+
'выше смысле) подпоследовательность определяет некоторую общую\\'+
'подпоследовательность строк {S}_1, {S}_2 и {S}_3 той же длины (для получения\\'+
'общей подпоследовательности символов достаточно взять символы строки {S}_2,\\'+
'расположенные в позициях, равных значениям первых элементов пар\\'+
'подпоследовательности набора {A}). Поэтому любая наибольшая возрастающая\\'+
'подпоследовательность (LIS) набора {A} определяет некоторую наибольшую общую\\'+
'подпоследовательность (LCS) строк {S}_1, {S}_2 и {S}_3. Для нахождения LIS в данном\\'+
'случае можно использовать следующий алгоритм:\( \X наряду с набором {A} числовых\\'+
'пар ввести в рассмотрение наборы чисел {P} и {B} того же размера {N};\|\\'+
'\X значение {P}_1 положить равным 1, значение {B}_1 \= равным 0;\|\\'+
'\X значение {P}_i, {i}\,=\,2,\,\.,\,{N}, положить равным max\{{P}_j\}\,+\,1,\\'+
'где в качестве {j} берутся номера в диапазоне от 1 до {i}\,\-\,1, для которых\\'+
'выполняется неравенство {A}_j\,<\,{A}_i, а значение {B}_i положить равным минимальному\\'+
'из тех номеров {j}, для которых достигается максимум {P}_j (если ни одного\\'+
'такого номера не найдено, то {P}_i положить равным 1, а {B}_i \= равным 0);\|\\'+
'\X найти {K} \= длину LIS, равную max_{i=1,\.,N}\{{P}_i\};\| \X для нахождения одной\\'+
'из LIS применить \Iобратный ход\i: в качестве последнего элемента LIS выбирается\\'+
'первый из элементов {A}_q, для которых {P}_q\,=\,{K}; если элемент LIS с номером {i}\\'+
'уже определен (и равен элементу {A}_j), то в качестве предыдущего элемента LIS\\'+
'(с номером {i}\,\-\,1) берется элемент набора {A} с номером {B}_j.\)\\'+
'Используя данный алгоритм, найти одну из LIS набора {A} и вывести\\'+
'соответствующую ей LCS для строк {S}_1, {S}_2 и {S}_3 в виде строки символов.\\'+
'\P\SПримечание\s. Описанный в задании алгоритм нахождения LIS имеет порядок {O}({N}^2).\\'+
'Применить более быстрый алгоритм (порядка {O}({N}\*log\,{K})), основанный\\'+
'на построении минимального покрытия и бинарном поиске (см.~\6),\\'+
'мешает то обстоятельство, что в наборе пар {A} могут содержаться \Iнесравнимые\i\\'+
'пары {X} и {Y}, для которых не выполняется ни одно из соотношений {X}\,<\,{Y}, {X}\,=\,{Y}, {Y}\,<\,{X}\\'+
'(например, (1,\,2) и (2,\,1)).'
);
  m := Rand(4,9);
//  m := 5;
  y := Random(1)+1;
  repeat
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
//    s1 := 'badeaeaeaaaaa';
//    s2 := 'ebecbdedbeec';
//    s3 := 'caebcaeaaee';

  MakeSeq2;
  until nl in [30..70];
  SubSeq2;
  until mm > 3;
  DataS('S_1 = ',s1,3,1);
  DataS('S_2 = ',s2,3,2);
  DataS('S_3 = ',s3,3,3);
  DataComment(Rule(5,length(s1)),3,4);
//  DataN('d = ', d, 50, 2,1);
//  DataN('m = ', m, 64, 2,1);
//  DataN('m = ', m, xRight, 4,1);
  DataN('N = ', nl,xRight,3,2);
  DataComment('Элементы набора A: ', xRight,4);

//  ResultN('Размер полученного набора: ', nl,xLeft,1,2);
//  ResultComment('Элементы набора: ', xRight,1);

  InitL2;
  y := 4;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-5)*10:2,s00);
  DataComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    DataN('(',e.x2,Center(i,10,7,0)+2,y,2);
    DataN(',',e.x3,Center(i,10,7,0)+5,y,2);
    DataComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-4)*10:2,s00);
    DataComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      DataN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      DataN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      DataComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,32,3);
  Str(cnt, s00);
  ResultComment('Примечание. Количество выполненных сравнений пар чисел равно '+s00,3,5);

//  ResultN('Количество сравнений пар чисел: ',cnt,0,4,4);
{ пример неправильного алгоритма ("аналогичного" жадному)
  Cover2b;
  SubSeq2b;
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,28,3);
  ResultN('Количество сравнений пар чисел: ',cnt,0,5,4);
}
  SetTestCount(5);
end;

procedure Alignment80;
var
  i,j,l1,l2,y: integer;
  e: pair;
begin
  CreateTask(Subgroup6);
  TaskTextExt(
'Даны строки {S}_1, {S}_2 и {S}_3 (|{S}_3|\,\l\,|{S}_2|\,\l\,|{S}_1|\,<\,20) и число {m} (<\,10) \= размер\\'+
'алфавита, состоящего из первых строчных латинских букв. Построить по данным\\'+
'строкам набор {A} пар чисел, описанный в \2, после чего, действуя\\'+
'по схеме, описанной в \1, найти одну из наибольших возрастающих\\'+
'подпоследовательностей (LIS) набора {A} и вывести соответствующую ей\\'+
'наибольшую общую подпоследовательность (LCS) для строк {S}_1, {S}_2 и {S}_3\\'+
'в виде строки символов.'
);
  m := Rand(4,9);
  repeat
  repeat
    MakeStrLCS2(10,18,m,s1,s2,s3);
  MakeSeq2;
  until nl in [30..70];
  SubSeq2;
  until mm > 3;
  DataS('S_1 = ',s1,3,2);
  DataS('S_2 = ',s2,3,3);
  DataS('S_3 = ',s3,3,4);
  DataComment(Rule(5,length(s1)),3,5);
  DataN('m = ', m, xRight,4,1);
//  DataN('N = ', nl,xRight,3,2);
//  DataComment('Элементы набора A: ', xRight,4);
{  InitL2;
  y := 4;
  for j := 1 to nl div 10 do
  begin
  y := y + 1;
  Str(1+(y-5)*10:2,s00);
  DataComment(s00+':',3,y);
  for i := 1 to 10 do
  begin
    e := NextL2;
    DataN('(',e.x2,Center(i,10,7,0)+2,y,2);
    DataN(',',e.x3,Center(i,10,7,0)+5,y,2);
    DataComment(')',Center(i,10,7,0)+8,y);
  end;
  end;
  if nl mod 10 > 0 then
  begin
    Str(1+(y-4)*10:2,s00);
    DataComment(s00+':',3,y+1);
    for i := 1 to nl mod 10 do
    begin
      e := NextL2;
      DataN('(',e.x2,Center(i,10,7,0)+2,y+1,2);
      DataN(',',e.x3,Center(i,10,7,0)+5,y+1,2);
      DataComment(')',Center(i,10,7,0)+8,y+1);
    end;
  end;}
  s00 := '';
  for i := 1 to mm do
    s00 := s00 + s2[seq2[i].x2];
  ResultS('LCS: ',s00,32,3);
  Str(cnt, s00);
  ResultComment('Примечание. Количество выполненных сравнений пар чисел равно '+s00,3,5);
  SetTestCount(5);
end;


{
procedure Alignment;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
(*
  TaskTextExt(
);
*)
  m := Rand(10,20);
  MakeStr(25,35,m,s1,s2);
  DataS('','',0,3);
  ResultN('',cnt,0,3,2);
  SetTestCount(5);
end;
}


procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Alignment1;
  2: Alignment2;
  3: Alignment3;
  4: Alignment4;
  5: Alignment5;
  6: Alignment6;
  7: Alignment7;
  8: Alignment8;
  9: Alignment9;
  10: Alignment10;
  11: Alignment11;
  12: Alignment12;
  13: Alignment13;
  14: Alignment14;
  15: Alignment15;
  16: Alignment16;
  17: Alignment17;
  18: Alignment18;
  19: Alignment19;
  20: Alignment20;
  21: Alignment21;
  22: Alignment22;
  23: Alignment23;
  24: Alignment24;
  25: Alignment25;
  26: Alignment26;
  27: Alignment27;
  28: Alignment28;
  29: Alignment29;
  30: Alignment30;
  31: Alignment31;
  32: Alignment32;
  33: Alignment33;
  34: Alignment34;
  35: Alignment35;
  36: Alignment36;
  37: Alignment37;
  38: Alignment38;
  39: Alignment39;
  40: Alignment40;
  41: Alignment41;
  42: Alignment42;
  43: Alignment43;
  44: Alignment44;
  45: Alignment45;
  46: Alignment46;
  47: Alignment47;
  48: Alignment48;
  49: Alignment49;
  50: Alignment50;
  51: Alignment51;
  52: Alignment52;
  53: Alignment53;
  54: Alignment54;
  55: Alignment55;
  56: Alignment56;
  57: Alignment57;
  58: Alignment58;
  59: Alignment59;
  60: Alignment60;
  61: Alignment61;
  62: Alignment62;
  63: Alignment63;
  64: Alignment64;
  65: Alignment65;
  66: Alignment66;
  67: Alignment67;
  68: Alignment68;
  69: Alignment69;
  70: Alignment70;
  71: Alignment71;
  72: Alignment72;
  73: Alignment73;
  74: Alignment74;
  75: Alignment75;
  76: Alignment76;
  77: Alignment77;
  78: Alignment78;
  79: Alignment79;
  80: Alignment80;
  end;
end;


procedure inittaskgroup;
begin
  CreateGroup('Align', 'Неточное сопоставление строк',
    'М. Э. Абрамян, 2012', 'sdfghssdserddghkhkjkbvcm', 80, InitTask);

  CommentText('\PВсе исходные числовые данные в заданиях являются целыми и неотрицательными.');
  CommentText('Если числовые данные могут принимать нулевые значения, то об этом явно');
  CommentText('говорится в формулировке задания.');
  CommentText('\PВсе исходные строковые данные являются непустыми. Позиции символов в');
  CommentText('строках нумеруются от 1. Длина строки {S} обозначается через |{S}|; длина исходных строк в заданиях не превосходит 100.');
  CommentText('Через {S}[{i}..{j}] обозначается \Iподстрока\i {S}, начинающаяся в позиции {i} и');
  CommentText('оканчивающаяся в позиции {j} (если {i}\,>\,{j}, то {S}[{i}..{j}] считается пустой строкой).');
  CommentText('Через {S}[{i}], {i}\,=\,1,\,\.,\,|{S}|, обозначается \Iсимвол\i строки {S}, расположенный в позиции {i}.');

  CommentText('\PПод \Iалфавитом\i \E понимается множество символов, в которое входят');
  CommentText('все символы рассматриваемых строк. Если алфавит \E в задании не уточняется,');
  CommentText('то предполагается, что строка может содержать любые символы, отличные от управляющих.');

  CommentText('\PМатричные строки (англ. row) называются в формулировках заданий \Iстрочками\i, чтобы отличать их');
  CommentText('от текстовых строк (англ. string).');

  CommentText('\PОписания алгоритмов приводятся по книге Д.~Гасфилда \<Строки, деревья и последовательности в алгоритмах:');
  CommentText('Информатика и вычислительная биология\> (СПб.: БХВ-Петербург, 2003), часть~III.');


  Subgroup(Subgroup1);
CommentText('\PВ данной подгруппе рассматривается классическая задача неточного сопоставления');
CommentText('строк \= \Iзадача о редакционном расстоянии\i.');
CommentText('\IРедакционное расстояние\i (англ. edit distance) определяет меру различия строк;');
CommentText('оно равно минимальному числу операций редактирования, выполняемых над отдельными');
CommentText('символами и позволяющих преобразовать одну строку в другую.');
CommentText('В задаче о редакционном расстоянии требуется не только определить редакционное');
CommentText('расстояние, но и найти последовательность операций редактирования,');
CommentText('связанную с данным расстоянием и называемую \Iоптимальным редакционным предписанием\i.');
CommentText('Алгоритмы нахождения редакционного расстояния и оптимального редакционного');
CommentText('предписания основаны на \Iдинамическом программировании\i.');
  Subgroup(Subgroup2);
CommentText('\PВ данной подгруппе рассматриваются две модификации задачи о редакционном');
CommentText('расстоянии: задача о редакционном расстоянии при наличии \Iджокеров\i \= символов,');
CommentText('заменяющих любые символы строки, и задача о \Iвзвешенном редакционном расстоянии\i,');
CommentText('в которой различные операции редактирования могут иметь разный вес.');
  Subgroup(Subgroup3);
CommentText('Данная подгруппа заданий посвящена способу неточного сопоставления строк,');
CommentText('основанному на глобальном \Iвыравнивании\i (англ. alignment) этих строк посредством');
CommentText('вставки в них пробелов. Рассматривается простейший вариант нахождения');
CommentText('оптимального выравнивания, базирующийся на непосредственном применении');
CommentText('оптимального редакционного предписания, а также выравнивание, использующее');
CommentText('\Iматрицу оценок\i. Элементы матрицы оценок представляют');
CommentText('собой целочисленные веса (оценки) различных пар символов, причем совпадающие символы имеют');
CommentText('неотрицательный вес, а несовпадающие \= отрицательный. Оценка выравнивания');
CommentText('определяется как сумма оценок соответствующих символов выровненных строк;');
CommentText('максимальная из таких оценок называется \Iзначением сходства\i данных строк,');
CommentText('а связанное в ней выравнивание \= \Iоптимальным оценочным выравниванием\i.');
CommentText('Для нахождения сходства строк и оптимального оценочного выравнивания');
CommentText('используется алгоритм динамического программирования.');
  Subgroup(Subgroup4);
CommentText('В данной подгруппе рассматриваются две модификации глобального оценочного');
CommentText('выравнивания: выравнивание с \Iбесплатными граничными пробелами\i и выравнивание с учетом \Iпропусков\i.');
  Subgroup(Subgroup5);
CommentText('Данная подгруппа содержит задачи, связанные с выравниванием');
CommentText('отдельных частей исходных строк: это задача нахождения \Iприближенных вхождений\i');
CommentText('одной строки в другую и задача \Iлокального выравнивания\i');
CommentText('(и связанная с ней задача \Iлокального суффиксного выравнивания\i), в которой');
CommentText('требуется найти подстроки исходных строк с максимальным значением сходства.');
CommentText('Для всех перечисленных задач описываются алгоритмы, основанные');
CommentText('на динамическом программировании. В качестве простого примера применения');
CommentText('алгоритма локального выравнивания рассматривается задача о нахождении \Iмаксимальной общей подстроки\i');
CommentText('(следует заметить, что для задачи о наибольшей общей подстроке');
CommentText('существует более эффективный алгоритм, являющийся \Iлинейным по времени\i, однако');
CommentText('этот алгоритм требует применения более сложных структур данных \= \Iсуффиксных деревьев\i,');
CommentText('которые в данной группе заданий не рассматриваются).');
  Subgroup(Subgroup6);
CommentText('В данной подгруппе рассматриваются два алгоритма решения задачи о');
CommentText('\Iнаибольшей общей подпоследовательности\i (англ. longest common subsequence \= LCS)');
CommentText('двух строк. Первый алгоритм основан на применении рассмотренного ранее');
CommentText('алгоритма глобального выравнивания. Второй алгоритм, называемый \Iкомбинаторным алгоритмом\i');
CommentText('для LCS, сводит задачу нахождения LCS к задаче нахождения \Iнаибольшей возрастающей подпоследовательности\i');
CommentText('(англ. longest increasing subsequence \= LIS) для некоторого набора чисел.');
CommentText('Для задачи нахождения LIS рассматривается эффективный алгоритм, основанный');
CommentText('на построения покрытия исходного набора чисел невозрастающими подпоследовательностями.');
CommentText('Описывается также обобщение комбинаторного алгоритма, позволяющее найти LCS трех (или более) строк.');

end;

//exports inittaskgroup, activate;

begin
end.
