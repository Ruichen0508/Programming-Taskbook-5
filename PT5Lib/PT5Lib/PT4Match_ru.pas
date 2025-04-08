{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

// \H53 -> \E

//---------------------------------
unit PT4Match_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;



const
//Введение
  Subgroup1 = 'Поиск подстрок: базовые понятия и наивный алгоритм';
  Subgroup2 = 'Основной препроцессинг: базовые понятия и быстрый алгоритм';
//  Subgroup3 = 'Основной препроцессинг: быстрый алгоритм';
  Subgroup4 = 'Поиск с использованием основного препроцессинга';
//Классические алгоритмы поиска
  Subgroup5 = 'Метод Кнута--Морриса--Пратта';
  Subgroup6 = 'Препроцессинг для метода Кнута--Морриса--Пратта';
  Subgroup7 = 'Метод реального времени';
  Subgroup8 = 'Правила сдвига по плохому символу и по хорошему суффиксу';
//  Subgroup9 = 'Правило сдвига по хорошему суффиксу';
//  Subgroup10 = 'Препроцессинг для сдвига по хорошему суффиксу';
  Subgroup11 = 'Метод Бойера--Мура';
//Получисленные алгоритмы поиска
  Subgroup12 = 'Битовый метод поиска точных и неточных вхождений';
  Subgroup13 = 'Метод дактилограмм Карпа--Рабина';
  Rule_ = '|1  |5  1|0  1|5  2|0  2|5  3|0  3|5  4|0  4|5  5|0  5|5  6|0  6|5  7|0';

var
  cnt: integer = 0;
  s, ss, s1, s2, p, t: string;
  ii, jj, k, m, n, mm, qq: integer;

function rand(a, b: integer): integer;
begin
  result := Random(b-a+1) + a;
end;

function randc(n: integer): char;
begin
  result := chr(Random(n) + 97);
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

function Rule(k,n: integer): string;
var s: string;
    i: integer;
begin
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

function CreateString(m,n: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + chr(97+Random(m));
end;

function Sub(s: string; i,j: integer): string;
begin
  result := '';
  if i > j then exit;
  result := Copy(s, i, j-i+1);
end;

procedure Ins(var s: string; p: string; k: integer);
var i: integer;
begin
  for i := 1 to length(p) do
  begin
    if i+k-1>length(s) then
      break;
    s[i+k-1] := p[i];
  end;
end;

var res,res0: array[1..100] of integer;
    nres, nres0: integer;

procedure Naive(p,t: string);
var n,m,i,j: integer;
    b: boolean;
begin
  n := length(p);
  m := length(t);
  cnt := 0;
  nres := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nres);
      if nres <= 100 then
        res[nres] := i;
    end;
  end;
end;

{
procedure Matching;
var
  i: integer;
begin
  CreateTask(Subgroup1);
  TaskText('', 0, 0);
  DataS('','',0,3);
  ResultN('',cnt,0,3,2);
  SetTestCount(5);
end;
}

procedure Matching1;
var
  i: integer;
begin
  CreateTask(Subgroup1);
  TaskText('Дана строка {S} и целые числа {i}, {j}, не превосходящие длины строки {S}.', 0, 1);
  TaskText('Позиции в строке нумеруются от 1. Через {S}[{i}..{j}] обозначается подстрока {S},', 0, 2);
  TaskText('начинающаяся в позиции {i} и оканчивающаяся в позиции {j}. Если {i}\,>\,{j}, то {S}[{i}..{j}]', 0, 3);
  TaskText('считается пустой строкой (длина пустой строки равна~0). Вывести длину', 0, 4);
  TaskText('подстроки {S}[{i}..{j}] и все ее символы (в порядке слева направо).', 0, 5);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+18) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('Длина подстроки S[i..j]: ',length(ss),0,2,2);
  ResultComment('Символы подстроки S[i..j]:',0,3);
  for i := 1 to length(ss) do
    ResultC('',ss[i],Center(i,length(ss),3,1),4);
  SetTestCount(5);
end;

procedure Matching2;
var
  i,j: integer;
begin
  CreateTask(Subgroup1);
  TaskText('Дана строка {S} и числа {i}, {j}, не превосходящие длины строки {S}. \IПрефиксом\i', 0, 1);
  TaskText('строки {S} называется любая ее подстрока вида {S}[1..{k}], {k}\,\l\,|{S}| (|{S}| обозначает', 0, 2);
  TaskText('длину строки~{S}). Если префикс строки {S} является непустым и не совпадает', 0, 3);
  TaskText('со всей строкой, то он называется \Iсобственным префиксом\i. Вывести количество', 0, 4);
  TaskText('префиксов подстроки {S}[{i}..{j}], а также длину и символы каждого ее префикса,', 0, 5);
  TaskText('перебирая префиксы в порядке возрастания их длин, а символы', 0, 0);
  TaskText('каждого префикса \= в порядке слева направо.', 0, 0);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+6) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('Количество префиксов подстроки S[i..j]: ',length(ss)+1,3,1,2);
  for j := 0 to length(ss) do
  begin
  ResultN('('+chr(48+j)+')  Длина префикса: ',j,3,j+2,2);
  ResultComment('Символы префикса:',30,j+2);
  for i := 1 to j do
    ResultC('',ss[i],45+i*4, j+2);
  end;
  SetTestCount(5);
end;

procedure Matching3;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup1);
  TaskText('Дана строка {S} и числа {i}, {j}, не превосходящие длины строки {S}. \IСуффиксом\i', 0, 1);
  TaskText('строки {S} называется любая ее подстрока вида {S}[{k}..|{S}|], {k}\,\g\,1 (|{S}| обозначает', 0, 2);
  TaskText('длину строки {S}). Если суффикс строки {S} является непустым и не совпадает', 0, 3);
  TaskText('со всей строкой, то он называется \Iсобственным суффиксом\i. Вывести количество', 0, 4);
  TaskText('суффиксов подстроки {S}[{i}..{j}], а также длину и символы каждого ее суффикса,', 0, 5);
  TaskText('перебирая суффиксы в порядке убывания их длин, а символы', 0, 0);
  TaskText('каждого суффикса \= в порядке слева направо.', 0, 0);
  s := CreateString(26, rand(30, 60));
  ii := rand(1, length(s));
  case Random(5) of
  0: jj := ii;
  1..3: repeat jj := rand(ii, ii+6) until jj <= length(s);
  4: jj := rand(1, ii);
  end;
  ss := Sub(s, ii, jj);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ',ii,xLeft,4,1);
  DataN('j = ',jj,xRight,4,1);
  ResultN('Количество суффиксов подстроки S[i..j]: ',length(ss)+1,3,1,2);
  for j := length(ss) downto 0 do
  begin
  k := length(ss)-j;
  ResultN('('+chr(48+k)+')  Длина суффикса: ',j,3,k+2,2);
  ResultComment('Символы суффикса:',30,k+2);
  for i := length(ss)-j+1 to length(ss) do
    ResultC('',ss[i],45+i*4, k+2);
  end;
  SetTestCount(5);
end;

procedure Matching4; {*}
var
  i: integer;
  b: boolean;
begin
  CreateTask(Subgroup1);
  TaskText('Даны строки {P}, {T} и число {k}. Строка {P} считается \Iобразцом\i (англ. pattern),', 0, 1);
  TaskText('строка {T}~\= текстом, в котором ищется образец. Известно, что длина суффикса', 0, 2);
  TaskText('строки {T}, начинающегося в позиции {k}, больше или равна |{P}|. Используя', 0, 3);
  TaskText('посимвольное сравнение, выполняемое слева направо, проверить, входит ли', 0, 4);
  TaskText('образец {P} в текст {T}, начиная с позиции~{k}. Если входит, то вывести \t, иначе', 0, 5);
  TaskText('вывести \f. Вывести также количество потребовавшихся сравнений символов.', 0, 0);
  n := rand(1, 20);
  m := rand(30, 60);
  p := CreateString(10, n);
  k := Rand(1,m-n);
  t := CreateString(10, m-n);
  s := p;
  if Random(3) <> 0 then
    s[Rand(1,length(s))] := randc(10);
  Insert(s,t,k);
  b := true;
  cnt := 0;
  for i := 1 to length(p) do
  begin
    inc(cnt);
    if p[i] <> t[k+i-1] then
    begin
      b := false;
      break;
    end;
  end;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ', k, 3,5,1);
  ResultB('Результат проверки: ',b,0,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching5;
var
  i,j: integer;
  b: boolean;
  c: array[1..100] of char;
begin
  CreateTask(Subgroup1);
  TaskText('Даны строки {P} и {T}. Найти первое вхождение строки {P} в текст {T}, используя', 0, 1);
  TaskText('\Iнаивный алгоритм поиска\i, при котором выполняется посимвольное сравнение {P}', 0, 2);
  TaskText('с каждой из подстрок {T} длины |{P}|. Подстроки {T} перебираются слева направо,', 0, 3);
  TaskText('символы строк также сравниваются слева направо. При каждом сравнении символов', 0, 4);
  TaskText('(независимо от успешности сравнения) выводить сравниваемый символ строки {P}.', 0, 5);
  TaskText('После завершения алгоритма вывести позицию в {T}, с которой начинается первое', 0, 0);
  TaskText('вхождение {P}, или 0, если вхождения отсутствуют.', 0, 0);
  repeat
  mm := Rand(2,5);
  n := rand(5, 10);
  m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 4 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  k := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if cnt < 100 then
        c[cnt] := p[j];
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      k := i;
      break;
    end;
  end;
  until cnt <= 75;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  i := cnt div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('Использованные в сравнениях символы строки P:',0,1);
  for ii := 1 to cnt do
  begin
    if (ii-1) mod 19 = 0 then
      inc(j);
    ResultC('',c[ii],((ii-1) mod 19+1)*4-1,j);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('Позиция первого вхождения: ', k, 0,j,1);
  SetTestCount(5);
end;

procedure Matching6;
var
  i,j: integer;
  b: boolean;
  c: array[1..100] of char;
begin
  CreateTask(Subgroup1);
  TaskText('Даны строки {P} и {T}. Найти первое вхождение строки {P} в текст {T}, используя', 0, 1);
  TaskText('модификацию наивного алгоритм поиска (см.~\1), при которой подстроки {T}', 0, 2);
  TaskText('перебираются слева направо, а посимвольное сравнение строк выполняется', 0, 3);
  TaskText('справа налево. При каждом сравнении символов (независимо от успешности', 0, 4);
  TaskText('сравнения) выводить сравниваемый символ строки {P}. После завершения', 0, 5);
  TaskText('алгоритма вывести позицию в {T}, с которой начинается первое вхождение {P},', 0, 0);
  TaskText('или 0, если вхождения отсутствуют.', 0, 0);
  repeat
  mm := Rand(2,5);
  n := rand(5, 10);
  m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 4 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  k := 0;
  for i := n to m do
  begin
    b := true;
    for j := n downto 1 do
    begin
      inc(cnt);
      if cnt < 100 then
        c[cnt] := p[j];
      if p[j] <> t[i+j-n] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      k := i-n+1;
      break;
    end;
  end;
  until cnt <= 75;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  i := cnt div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('Использованные в сравнениях символы строки P:',0,1);
  for ii := 1 to cnt do
  begin
    if (ii-1) mod 19 = 0 then
      inc(j);
    ResultC('',c[ii],((ii-1) mod 19+1)*4-1,j);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('Позиция первого вхождения: ', k, 0,j,1);
  SetTestCount(5);
end;

procedure Matching7;
var
  i,j: integer;
  b: boolean;
  nk: integer;
  kk: array[1..19] of integer;
begin
  CreateTask(Subgroup1);
  TaskText('Даны строки {P} и {T}. Найти все вхождения строки {P} в текст {T}, используя наивный', 0, 2);
  TaskText('алгоритм поиска (см.~\2). Вывести позиции в {T}, с которых начинаются', 0, 3);
  TaskText('вхождения образца {P}. Вывести также общее количество сравнений символов,', 0, 4);
  TaskText('которое потребовалось для решения задачи.', 0, 5);
  repeat
  mm := Rand(1,5);
  n := rand(5, 10);
  if mm = 1 then
    m := rand(15, 20)
  else
    m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 10 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  nk := 0;
  for i := 1 to m-n+1 do
  begin
    b := true;
    for j := 1 to n do
    begin
      inc(cnt);
      if p[j] <> t[i+j-1] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nk);
      if nk <= 19 then
        kk[nk] := i;
    end;
  end;
  until nk <= 19;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  ResultComment('Вхождения:',0,2);

  for i := 1 to nk do
  ResultN('', kk[i], Center(i,nk,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;


procedure Matching8;
var
  i,j: integer;
  b: boolean;
  nk: integer;
  kk: array[1..19] of integer;
begin
  CreateTask(Subgroup1);
  TaskText('Даны строки {P} и {T}. Найти все вхождения строки {P} в текст {T}, используя', 0, 2);
  TaskText('модификацию наивного алгоритма поиска (см.~\2). Вывести позиции', 0, 3);
  TaskText('в {T}, с которых начинаются вхождения образца {P}. Вывести также общее', 0, 4);
  TaskText('количество сравнений символов, которое потребовалось для решения задачи.', 0, 5);
  repeat
  mm := Rand(1,5);
  n := rand(5, 10);
  if mm = 1 then
    m := rand(15, 20)
  else
    m := rand(30, 40);
  p := CreateString(mm, n);
  t := CreateString(mm, 100);
  for i := 1 to 10 do
  begin
  k := Rand(1,m-n);
  s := p;
  if Random(2) <> 0 then
    s[Rand(1,length(s))] := randc(mm);
  Insert(s,t,k);
  end;
  t := Copy(t,1,m);
  cnt := 0;
  nk := 0;
  for i := n to m do
  begin
    b := true;
    for j := n downto 1 do
    begin
      inc(cnt);
      if p[j] <> t[i+j-n] then
      begin
        b := false;
        break;
      end;
    end;
    if b then
    begin
      inc(nk);
      if nk <= 19 then
        kk[nk] := i-n+1;
    end;
  end;
  until nk <= 19;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  ResultComment('Вхождения:',0,2);

  for i := 1 to nk do
  ResultN('', kk[i], Center(i,nk,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;


var Z_: array[1..200] of integer;
    L0_, R0_: integer;

procedure BaseZ_(s: string);
var i,j: integer;
begin
  j := 0;
  R0_ := 0;
  L0_ := 0;
  Z_[2] := 0;
  for i := 2 to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-1] then
      break;
    inc(j);
  end;
  if j = 0 then exit;
  Z_[2] := j;
  R0_ := j+1;
  L0_ := 2;
end;

procedure Step1Z_(s: string; k: integer);
var i,j: integer;
begin
  j := 0;
  Z_[k] := 0;
  for i := k to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-k+1] then
      break;
    inc(j);
  end;
  if j = 0 then exit;
  Z_[k] := j;
  R0_ := k+j-1;
  L0_ := k;
end;

procedure Step2Z_(s: string; k: integer);
var i,k1,l1,q1,q2: integer;
begin
  k1 := k - L0_+ 1;
  l1 := R0_- k + 1;
  if Z_[k1] < l1 then
  begin
    Z_[k] := Z_[k1];
    exit;
  end;
  Z_[k] := 0;
  q1 := R0_+1;
  q2 := l1;
  for i := R0_+1 to length(s) do
  begin
    inc(cnt);
    inc(q2);
    if s[q1] <> s[q2] then
      break;
    inc(q1);
  end;
  Z_[k] := q1-k;
  R0_ := q1-1;
  L0_ := k;
end;

procedure MainZ_(s: string);
var k: integer;
begin
  cnt := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
end;


procedure Matching9;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S} и число {i} (2\,\l\,{i}\,\l\,|{S}|). Через {Z}_i({S}) обозначается длина наибольшей', 0, 1);
  TaskText('подстроки {S}, которая начинается в позиции {i} и совпадает с префиксом строки {S}.', 0, 2);
  TaskText('Если требуемые подстроки отсутствуют, то {Z}_i({S})\,=\,0. Используя посимвольное', 0, 3);
  TaskText('сравнение строк, найти {Z}_i({S}). Вывести найденное значение, а также', 0, 4);
  TaskText('количество сравнений символов, потребовавшееся для его нахождения.', 0, 5);
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-1);
  Ins(s, Copy(s,1,10), k);
  if Random(3) > 0 then
    k := Rand(2, n);
  cnt := 0;
  j := 0;
  for i := k to length(s) do
  begin
    inc(cnt);
    if s[i] <> s[i-k+1] then
      break;
    inc(j);
  end;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('i = ', k, 0,4,1);
  ResultN('Z_i(S) = ', j, 0,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching10;
var
  i,j,k,k0: integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}. \I{Z}-блоком строки {S} в позиции {i}\i (>\,1) называется непустая', 0, 1);
  TaskText('строка {S}[{i}..{i}\,+\,{Z}_i({S})\,\-\,1], т.\,е. подстрока {S}, начинающаяся в позиции {i}\,>\,1', 0, 2);
  TaskText('и имеющая ненулевую длину {Z}_i({S}) (определение {Z}_i({S}) см. в \1).', 0, 3);
  TaskText('Известно, что в данной строке {S} имеется хотя бы один {Z}-блок длины, большей 2.', 0, 4);
  TaskText('Используя посимвольное сравнение строк и перебирая позиции в порядке', 0, 5);
  TaskText('возрастания, найти первый из {Z}-блоков с указанным свойством. Вывести', 0, 0);
  TaskText('позицию {i} найденного {Z}-блока, его длину {Z}_i({S}), а также количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся для решения задачи.', 0, 0);
  repeat
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 50));
//  if Random(2)=0 then
//    for i := 1 to Random(15) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  k0 := 0;
  for k := 2 to n do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    if j > 2 then
    begin
      k0 := k;
      break;
    end;
  end;
  until k0 > 0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('i = ', k0, xLeft,2,2);
  ResultN('Z_i(S) = ', j, xRight,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
//  MainZ_(s);
//  ResultN('Z_i(S) = ', Z_[k0], 0,5,2);
  SetTestCount(5);
end;

procedure Matching11;
var
  i,j,k,cnt0,k0: integer;

begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}. Используя посимвольное сравнение строк и перебирая позиции', 0, 1);
  TaskText('в порядке возрастания, найти все {Z}-блоки строки {S} (определение {Z}-блока', 0, 2);
  TaskText('см. в \1). Для каждого найденного {Z}-блока вывести его позицию', 0, 3);
  TaskText('и длину. Кроме того, вывести количество сравнений символов,', 0, 4);
  TaskText('потребовавшееся для решения задачи.', 0, 5);
  repeat
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 40));
//  if Random(2)=0 then
//    for i := 1 to Random(15) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  k0 := 0;
  for k := 2 to n do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    if j > 0 then
    begin
      inc(k0);
    end;
  end;
  until k0 < 36;
  cnt0 := cnt;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  MainZ_(s);
  i := k0 div 9;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('Z-блоки (позиция и длина):',0,j);

  k0 := 0;
  for k := 2 to n do
  begin
    if Z_[k] = 0 then
      continue;
    inc(k0);
    if (k0-1) mod 9 = 0 then
      inc(j);
    ResultN2('',k, Z_[k],((k0-1) mod 9+1)*8-3,j,3);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('Количество сравнений: ',cnt0,0,j,3);

  SetTestCount(5);
end;

procedure Matching12;
var
  i,j,cnt0,r0,k0: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S} и число {k} (2\,\l\,{k}\,\l\,|{S}|). Через {r}_i({S}) обозначается крайний правый', 0, 1);
  TaskText('конец {Z}-блоков строки {S} (см.~\2), начинающихся не позднее позиции {i}', 0, 2);
  TaskText('строки {S}, или 0, если требуемые {Z}-блоки отсутствуют. Таким образом, ненулевое', 0, 3);
  TaskText('значение {r}_i({S}) можно найти по формуле {r}_i({S})\,=\,max\{{j}\,+\,{Z}_j({S})\,\-\,1\}, где {j} меняется', 0, 4);
  TaskText('от 2 до {i}, причем {Z}_j({S})\,>\,0. При этом через {l}_i({S}) обозначается то значение {j},', 0, 5);
  TaskText('на котором достигается указанный выше максимум (если таких значений {j}', 0, 0);
  TaskText('несколько, то через {l}_i({S}) обозначается наибольшее из них). Для {r}_i({S})\,=\,0', 0, 0);
  TaskText('значение {l}_i({S}) полагается равным~0. Используя посимвольное сравнение строк', 0, 0);
  TaskText('для вычисления {Z}_i({S}), найти и вывести {r}_i({S}) и {l}_i({S}), {i}\,=\,2,\,\.,\,{k}. Вывести также', 0, 0);
  TaskText('общее количество сравнений символов, потребовавшееся для решения задачи.', 0, 0);
  mm := Rand(1,10);
  s := CreateString(mm, rand(20, 40));
  k0 := Rand(2,9);
  if Random(2)=0 then
    for i := 1 to Random(k0) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  k := Rand(n-9,n-3);
  Ins(s, Copy(s,1,10), k);
  cnt := 0;
  r[1] := 0;
  l[1] := 0;


  for k := 2 to k0 do
  begin
    j := 0;
    for i := k to length(s) do
    begin
      inc(cnt);
      if s[i] <> s[i-k+1] then
        break;
      inc(j);
    end;
    r[k] := r[k-1];
    l[k] := l[k-1];
    r0 := k+j-1;
    if (j>0) and (r0 >= r[k]) then
    begin
      r[k] := r0;
      l[k] := k;
    end;
  end;
  cnt0 := cnt;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ',k0,0,4,1);
  ResultComment('    i:',3,2);
  ResultComment('r_i l_i:',3,3);
  for i := 2 to k0 do
  begin
    ResultComment('     '+chr(48+i),(i-1)*8+3,2);
    ResultN2('',r[i],l[i],(i-1)*8+3,3,3);
  end;
  ResultN('Количество сравнений: ',cnt0,0,4,3);
  SetTestCount(5);
end;


procedure Matching13;
var
  i,j: integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}. Описать числовой массив {Z} для хранения значений {Z}_i({S})', 0, 1);
  TaskText('(см.~\4) и числовые переменные {R} и {L}. Реализовать первый шаг \Iбыстрого\i', 0, 2);
  TaskText('\Iалгоритма основного препроцессинга\i: используя посимвольное сравнение,', 0, 3);
  TaskText('найти {Z}_2 и положить начальные значения для переменных {R} и {L} равными', 0, 4);
  TaskText('соответственно {r}_2({S}) и {l}_2({S}) (см.~\1). Оформить алгоритм в виде', 0, 5);
  TaskText('вспомогательной подпрограммы. Вывести {Z}_2, {R}, {L} и количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся для их нахождения.', 0, 0);
  mm := Rand(1,5);
  n := rand(20, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,100));
  cnt := 0;
  BaseZ_(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('Z_2 = ', Z_[2], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching14;
var
  i,j,k,cntmax,k0: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}, число {k} (2\,<\,{k}\,\l\,|{S}|) и значения {R}\,=\,{r}_{k\-1} и {L}\,=\,{l}_{k\-1}. Известно,', 0, 1);
  TaskText('что {k}\,>\,{R}. Реализовать для данной ситуации {k}-й шаг \Iбыстрого алгоритма\i', 0, 2);
  TaskText('\Iосновного препроцессинга\i. Для этого найти {Z}_k, используя посимвольное', 0, 3);
  TaskText('сравнение, и положить значения {R} и {L} равными соответственно {r}_k и {l}_k', 0, 4);
  TaskText('({R}\,=\,{k}\,+\,{Z}_k\,\-\,1, {L}\,=\,{k}, если {Z}_k\,>\,0; в противном случае {R} и {L} не изменяются).', 0, 5);
  TaskText('Оформить алгоритм в виде вспомогательной подпрограммы. Вывести {Z}_k, {R}, {L}', 0, 0);
  TaskText('и количество сравнений символов, потребовавшееся для их нахождения.', 0, 0);
  repeat
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  r[2] := R0_;
  l[2] := L0_;
  cntmax := 0;
  k0 := 0;
  for k := 3 to n do
  begin
    cnt := 0;
    if k > R0_ then
    begin
      Step1Z_(s,k);
      if cnt >= cntmax then
      begin
        k0 := k;
        cntmax := cnt;
      end;
    end
    else
      Step2Z_(s,k);
    r[k] := R0_;
    l[k] := L0_;
  end;
  until (cntmax > 0) and (k0 > 2);
  k := k0;
  R0_ := r[k-1];
  L0_ := l[k-1];
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ', k, Center(1,3,7,6),4,1);
  DataN('R = ', R0_, Center(2,3,7,6),4,1);
  DataN('L = ', L0_, Center(3,3,7,6),4,1);
  cnt := 0;
  Step1Z_(s,k);
  ResultN('Z_k = ', Z_[k], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching15;
var
  i,j,k,cntmax,k0,b: integer;
  r,l: array[1..100] of integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}, число {k} (2\,<\,{k}\,\l\,|{S}|), значения {R}\,=\,{r}_{k\-1} и {L}\,=\,{l}_{k\-1}, а также', 0, 1);
  TaskText('значения {Z}_i, {i}\,=\,2,\,\.,\,{k}\,\-\,1. Известно, что {k}\,\l\,{R}. Реализовать для данной ситуации', 0, 2);
  TaskText('{k}-й шаг \Iбыстрого алгоритма основного препроцессинга\i. При этом учесть,', 0, 3);
  TaskText('что в силу неравенства {k}\,\l\,{R} подстрока {S''}\,=\,{S}[{k}..{R}] входит в {Z}-блок {S}[{L}..{R}],', 0, 4);
  TaskText('который (по определению {Z}-блока) совпадает с префиксом {S}[1..{Z}_L]. Поэтому', 0, 5);
  TaskText('{S''}\,=\,{S}[{k''}..{Z}_L], где {k''}\,=\,{k}\,\-\,{L}\,+\,1, и, следовательно, подстрока, начинающаяся', 0, 0);
  TaskText('с позиции {k}, должна совпадать, по меньшей мере, с префиксом {S} длины', 0, 0);
  TaskText('min\{{Z}_{k''},\,|{S''}|\} (|{S''}|\,=\,{R}\,\-\,{k}\,+\,1). Если при этом {Z}_{k''}\,<\,|{S''}|, то следует', 0, 0);
  TaskText('положить {Z}_k\,=\,{Z}_{k''}; {R} и {L} при этом не изменяются. Если же {Z}_{k''}\,\g\,|{S''}|,', 0, 0);
  TaskText('то надо выполнить дополнительную проверку, сравнивая до несовпадения', 0, 0);
  TaskText('символы {S}[{p}], начиная с {p}\,=\,|{S''}|\,+\,1, и {S}[{q}], начиная с {q}\,=\,{R}\,+\,1; если {q} достигнет', 0, 0);
  TaskText('значения |{S}|\,+\,1 или в позиции {q}\,\g\,{R}\,+\,1 обнаружится несовпадение, то следует', 0, 0);
  TaskText('положить {Z}_k\,=\,{q}\,\-\,{k}, {R}\,=\,{q}\,\-\,1, {L}\,=\,{k}. В любом случае {R} и {L} окажутся равными {r}_k', 0, 0);
  TaskText('и {l}_k соответственно. Оформить алгоритм в виде вспомогательной подпрограммы.', 0, 0);
  TaskText('Вывести {Z}_k, {R}, {L} и количество сравнений символов, потребовавшееся', 0, 0);
  TaskText('для их нахождения (при {Z}_{k''}\,<\,|{S''}| данное количество будет равно~0).', 0, 0);
  b := Random(3);
  repeat
  mm := Rand(1,5);
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(15) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  r[2] := R0_;
  l[2] := L0_;
  cntmax := 0;
  k0 := 0;
  for k := 3 to n do
  begin
    if k > R0_ then
    begin
      Step1Z_(s,k);
    end
    else
    begin
      cnt := 0;
      Step2Z_(s,k);
      if (b <> 0) and (cnt >= cntmax) and (k < 20) then
      begin
        k0 := k;
        cntmax := cnt;
      end
      else
      if (b = 0) and (cnt = 0) and (k < 20) then
        k0 := k;
    end;
    r[k] := R0_;
    l[k] := L0_;
  end;
  until k0 > 2;
  k := k0;
  R0_ := r[k-1];
  L0_ := l[k-1];
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('k = ', k, Center(1,3,7,6),4,1);
  DataN('R = ', R0_, Center(2,3,7,6),4,1);
  DataN('L = ', L0_, Center(3,3,7,6),4,1);
  for i := 2 to k-1 do
    DataN('',Z_[i],Center(i-1,k-2,2,2),5,2);
  cnt := 0;
  Step2Z_(s,k);
  ResultN('Z_k = ', Z_[k], Center(1,3,7,6),2,2);
  ResultN('R = ', R0_, Center(2,3,7,6),2,2);
  ResultN('L = ', L0_, Center(3,3,7,6),2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching16;
var
  i,j,k: integer;
begin
  CreateTask(Subgroup2);
  TaskText('Дана строка {S}. Найти {Z}_i({S}), {i}\,=\,2,\,\.,\,|{S}|, используя \Iбыстрый\i', 0, 2);
  TaskText('\Iалгоритм препроцессинга\i, описанный в \3\:\1.', 0, 3);
  TaskText('Вывести найденные {Z}_i({S}), а также количество сравнений символов,', 0, 4);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 5);
  i := Random(10);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  s := CreateString(mm, rand(20, 50));
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  BaseZ_(s);
  for k := 3 to n do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
  end;
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  i := (n-1) div 19;
  j := 1;
  if i = 3 then
    j := 0
  else
    ResultComment('{Z}_i({S}), {i}\,=\,2,\,\.,\,|{S}|:',0,j);

  for k := 2 to n do
  begin
    if (k-2) mod 19 = 0 then
      inc(j);
    ResultN('',Z_[k],((k-2) mod 19+1)*4-1,j,2);
  end;
  inc(j);
  if j < 4 then j := 4;
  ResultN('Количество сравнений: ',cnt,0,j,2);
  SetTestCount(5);
end;

procedure Matching17;
var
  i,j,k,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('Даны строки {P} и {T}, не содержащие символ \<$\>. Реализовать быстрый алгоритм', 0, 1);
  TaskText('поиска всех вхождений {P} в {T}, сформировав строку {S}\,=\,{P}\,+\,\<$\>\,+\,{T} и выполнив', 0, 2);
  TaskText('для нее основной препроцессинг (см.~\1). Каждому вхождению {P} в {T}', 0, 3);
  TaskText('соответствует значение {Z}_i({S}), равное |{P}| (очевидно, {i}\,>\,|{P}|\,+\,1); при этом', 0, 4);
  TaskText('данное вхождение начинается в позиции {i}\,\-\,|{P}|\,\-\,1 строки {T}. Вывести начальные', 0, 5);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 0);
  TaskText('количество сравнений символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
    s := CreateString(mm, rand(25, 50))
  else
    s := CreateString(mm, rand(50, 70));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  n := Rand(5,10);
  p := copy(s,1,n);
  t := copy(s,n+1, 100);
  s := p + '$' + t;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (k > n+1) and (Z_[k]=n) then
      inc(k0);
  end;
  until k0 < 20;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := 0;
  ResultComment('Вхождения:',0,2);

  for k := n+2 to length(s) do
  begin
    if Z_[k] = n then
    begin
      inc(j);
      ResultN('',k-n-1,Center(j,k0,2,2),3,2);
    end;
  end;
  ResultN('Количество сравнений: ',cnt,0,4,2);
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

{
function Shift(a,b: string): integer;
var i: integer;
begin
  result := -1;
  for i := 0 to length(a)-1 do
    if copy(a,i+1,100)+copy(a,1,i) = b then
    begin
      result := i;
      exit;
    end;
end;
}


procedure Matching18;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('Даны строки {P} и {T}, не содержащие символ \<$\>. Найти все вхождения {P} в {T},', 0, 1);
  TaskText('рассматривая строку {T} как \Iциклическую\i (после последнего символа строки {T}', 0, 2);
  TaskText('опять берется ее первый символ). Для этого сформировать строку {S}\,=\,{P}\,+\,\<$\>\,+\,{T}\,+\,{T''},', 0, 3);
  TaskText('где {T''}\,=\,{T}[1..|{P}|\,\-\,1], и использовать для нее быстрый алгоритм основного', 0, 4);
  TaskText('препроцессинга (см.~\2). Вывести начальные позиции всех найденных', 0, 5);
  TaskText('вхождений (в порядке возрастания), а также количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
    s := CreateString(mm, rand(15, 25))
  else
    s := CreateString(mm, rand(40, 60));
  if (mm <> 1) and (Random(2)=0) then
    for i := 1 to Random(10) do
      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  n := length(s);
  k := Rand(5,10);
  j := rand(1,k-1);
  p := copy(s,n-j+1,j) + copy(s,1,k-j);
  t := s;
  if mm <> 1 then
  for i := 1 to 10 do
    Ins(t, Copy(p,1,Rand(length(p)-2,length(p))), Rand(5,n-15));
  n := length(p);
  s := p + '$' + t + Copy(t,1,n-1);;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (k > n+1) and (Z_[k]=n) then
      inc(k0);
  end;
  until k0 < 20;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := 0;
  ResultComment('Вхождения:',0,2);

  for k := n+2 to length(s) do
  begin
    if Z_[k] = n then
    begin
      inc(j);
      ResultN('',k-n-1,Center(j,k0,2,2),3,2);
    end;
  end;
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;


{
function Suf(a,b: string): integer;
var i: integer;
begin
  result := 0;
  for i := length(a) downto 1 do
    if copy(a,length(a)-i+1,100) = copy(b,1,i) then
    begin
      result := i;
      exit;
    end;
end;
}

procedure Matching19;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup4);
  TaskText('Даны строки {A} и {B}, не содержащие символ \<$\>. Найти наибольший суффикс', 0, 1);
  TaskText('строки {A}, который одновременно является префиксом строки {B}, и вывести его', 0, 2);
  TaskText('длину (или 0, если требуемый суффикс отсутствует). Для этого сформировать', 0, 3);
  TaskText('строку {S}\,=\,{B}\,+\,\<$\>\,+\,{A} и с помощью быстрого алгоритма основного препроцессинга', 0, 4);
  TaskText('(см.~\3) найти {q}\,=\,max {Z}_i({S}), где {i} пробегает все значения,', 0, 5);
  TaskText('для которых {r}_i({S})\,=\,|{A}|\,+\,|{B}|\,+\,1. Вывести также количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  p := CreateString(mm, rand(25, 68));
  t := CreateString(mm, rand(25, 68));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(p);
  m := length(t);
  if Random(4)>0 then
  begin
    k := Rand(1,min(n,m));
    ins(p, Copy(t,1,k), n-k+1);
  end;
  s := t + '$' + p;
  cnt := 0;
  k0 := 0;
  BaseZ_(s);
  if (R0_ = m+n+1) and (Z_[2]>k0) then
    k0 := Z_[2];
  for k := 3 to length(s) do
  begin
    if k > R0_ then
      Step1Z_(s,k)
    else
      Step2Z_(s,k);
    if (R0_ = m+n+1) and (Z_[k]>k0) then
      k0 := Z_[k];
  end;
  DataS('A = ',p,3,2);
  DataComment(Rule(4,max(n,m)),3,3);
  DataS('B = ',t,3,4);
  ResultN('Длина наибольшего суффикса A, равного префиксу B: ',k0,0,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
//  ResultN('',suf(p,t),0,5,2);
  SetTestCount(5);
end;


procedure Matching20;
var
  i,j,k0,res: integer;
begin
  CreateTask(Subgroup4);
  TaskText('Даны строки {A} и {B} одинаковой длины, не содержащие символ \<$\>. Определить,', 0, 1);
  TaskText('является ли строка {B} \Iциклическим сдвигом\i строки {A}, и при положительном', 0, 2);
  TaskText('ответе вывести минимальную величину соответствующего \Iлевого сдвига\i (при', 0, 3);
  TaskText('отрицательном ответе вывести \-1). Например, для строк {A}\,=\,\<abcd\> и {B}\,=\,\<bcda\>', 0, 4);
  TaskText('надо вывести значение~1, а для строк {A}\,=\,\<aaa\> и {B}\,=\,\<aaa\> \= значение~0. Для', 0, 5);
  TaskText('этого сформировать строку {S}\,=\,{A}\,+\,\<$\>\,+\,{B} и с помощью быстрого алгоритма основного', 0, 0);
  TaskText('препроцессинга (см.~\4) найти {q}\,=\,max~{Z}_i({S}), где {i} пробегает', 0, 0);
  TaskText('все значения, для которых {r}_i({S})\,=\,2|{A}|\,+\,1. Если {q}\,=\,0, то вывести \-1, иначе', 0, 0);
  TaskText('выполнить посимвольное сравнение оставшейся части строк {A} и {B},', 0, 0);
  TaskText('и, в зависимости от результатов этого сравнения, вывести \-1 или величину', 0, 0);
  TaskText('левого сдвига (эта величина будет определяться через {q}). Вывести также', 0, 0);
  TaskText('количество сравнений символов, потребовавшееся при решении задачи.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  s := CreateString(mm, rand(25, 68));
//  if Random(2)=0 then
//    for i := 1 to Random(10) do
//      s := s[1] + s;
  n := length(s);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(5,10)), Rand(11,n-5));
  k0 := Rand(1,n);
  t := Copy(s,k0+1,100)+Copy(s,1,k0);
  p := t;
  case Random(4) of
  0: begin p := s; end;
  1: begin
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
       p[Rand(1,n)] := Randc(rand(1,mm));
     end;
  end;
  t := s + '$' + p;
  cnt := 0;
  k0 := 0;
  BaseZ_(t);
  if (R0_ = 2*n+1) and (Z_[2]>k0) then
    k0 := Z_[2];
  for k := 3 to length(t) do
  begin
    if k > R0_ then
      Step1Z_(t,k)
    else
      Step2Z_(t,k);
    if (R0_ = 2*n+1) and (Z_[k]>k0) then
      k0 := Z_[k];
  end;
  res := -1;
  if k0 > 0 then
  begin
    for i := k0+1 to n do
    begin
      inc(cnt);
      if s[i] <> p[i-k0] then
      begin
        k0 := 0;
        break;
      end;
    end;
    if k0 > 0 then
    if
      k0 = n then res := 0
      else
        res := k0;
  end;
  DataS('A = ',s,3,2);
  DataComment(Rule(4,length(s)),3,3);
  DataS('B = ',p,3,4);
  ResultN(' Величина левого сдвига: ',res,0,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
//  ResultN('',shift(s,p),0,5,2);
  SetTestCount(5);
end;

var sp_, sp1_: array[1..100] of integer;

procedure MainSP1_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    sp1_[i] := 0;
  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    sp1_[i] := Z_[j];
  end;
end;

procedure MainSP_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  MainSP1_(s);
  sp_[n] := sp1_[n];
  for i := n-1 downto 2 do
    sp_[i] := max(sp_[i+1]-1, sp1_[i]);
end;

procedure Matching21;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('Дана строка {P} и число {i} (\l\,|{P}|). Через {sp}_i({P}) обозначается длина наибольшего', 0, 2);
  TaskText('собственного суффикса подстроки {P}[1..{i}], который совпадает с префиксом {P}', 0, 3);
  TaskText('(обозначение образовано начальными буквами слов \<suffix\> и \<prefix\>). Если', 0, 4);
  TaskText('требуемые суффиксы отсутствуют, то {sp}_i({P})\,=\,0. Вывести {sp}_i({P}).', 0, 5);
  k0 := Random(11);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  k := 0;
  for i := 1 to 20 do
  begin
    j := Rand(1,n);
    if sp_[j] = k0 then
    begin
      k := j;
      break;
    end;
  end;
  if k = 0 then
    k := Rand(1,n);
  until k0 = sp_[k];
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('sp_{i}(P) = ',sp_[k],0,3,2);
  SetTestCount(5);
end;

procedure Matching22;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('Дана строка {P} и число {k} (\l\,|{P}|). Через {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1,', 0, 1);
  TaskText('обозначается длина наибольшего собственного суффикса подстроки {P}[1..{i}],', 0, 2);
  TaskText('который совпадает с префиксом {P} и для которого выполняется дополнительное', 0, 3);
  TaskText('условие: символы в позициях {i}\,+\,1 и {sp''}_i({P})\,+\,1 не равны. Таким образом,', 0, 4);
  TaskText('{sp''}_i({P})\,\l\,{sp}_i({P}) (величина {sp}_i({P}) определена в \1). В случае {i}\,=\,|{P}|', 0, 5);
  TaskText('по определению полагается {sp''}_{|P|}({P})\,=\,{sp}_{|P|}({P}). Вывести {sp''}_i({P}) для {i}\,=\,{k},\,\.,\,|{P}|.', 0, 0);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  k := rand(2,19);
  k0 := 0;
  for i := n-k+1 to n do
    if sp_[i] = sp1_[i] then
      inc(k0);
  until k0<k;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', n-k+1, 0, 4, 1);
  ResultComment('Значения sp''_{i}(P), i=k,...,|P|:',0,2);
  for i := n-k+1 to n do
    ResultN('',sp1_[i],Center(i-n+k,k,2,2),3,2);
  ResultComment('Примечание. Для сравнения ниже приведены значения sp_{i}(P), i=k,...,|P|:',0,4);
  for i := n-k+1 to n do
  begin
    str(sp_[i]:2,s);
    ResultComment(s,Center(i-n+k,k,2,2),5);
  end;
  SetTestCount(5);
end;

function f_(i: integer): integer;
begin
  if i = 1 then
    result := 1
  else
    result := sp_[i-1]+1;
end;

function f1_(i: integer): integer;
begin
  if i = 1 then
    result := 1
  else
    result := sp1_[i-1]+1;
end;


procedure Matching23;
var
  i,j,k0: integer;
begin
  CreateTask(Subgroup5);
  TaskText('Дана строка {P} и число {i} (\l\,|{P}|\,+\,1). Через {F}_P({i}) и {F''}_P({i}) обозначаются', 0, 1);
  TaskText('соответственно \Iслабая\i и \Iсильная функции неудачи\i для строки {P}:', 0, 2);
  TaskText('{F}_P({i})\,=\,{sp}_{i\-1}({P})\,+\,1, {F''}_P({i})\,=\,{sp''}_{i\-1}({P})\,+\,1 (значения {sp}_i({P}) определены', 0, 3);
  TaskText('в \2, а значения {sp''}_i({P}) \= в \1). При этом', 0, 4);
  TaskText('дополнительно предполагается, что {sp}_0({P})\,=\,{sp''}_0({P})\,=\,0. Найти {F}_P({i}) и {F''}_P({i}).', 0, 5);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  if k0=0 then
    case Random(3) of
    0: k := 1;
    1: k := n;
    2: k := n+1;
    end
  else
  begin
    k := 0;
    for i := 1 to 10 do
    begin
      j := Rand(2,n+1);
      if (k0=1) and (F_(j) = F1_(j)) or (k0>1) and (F_(j) <> F1_(j)) then
      begin
        k := j;
        break;
      end;
    end;
  end;
  until k>0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('F_P(i) = ',F_(k),xLeft,3,2);
  ResultN('F''_P(i) = ',F1_(k),xRight,3,2);
  SetTestCount(5);
end;

procedure KMPMain(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if p0 = 1 then
      inc(t0);
    p0 := F_(p0);
  end;
end;

procedure KMP1Main(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if p0 = 1 then
      inc(t0);
    p0 := F1_(p0);
  end;
end;


procedure Matching24; {*}
var
  i: integer;
begin
  CreateTask(Subgroup5);
  TaskText('Даны строки {P}, {T} и значения слабой функции неудач для строки {P}: {F}_P({i}),', 0, 1);
  TaskText('{i}\,=\,1,\,\.,\,|{P}|\,+\,1 (см.~\1). Найти все вхождения {P} в {T}, используя \Iметод\i', 0, 2);
  TaskText('\IКнута\:Морриса\:Пратта\i (\Iметод КМП\i). Для этого использовать переменные {p} и {t},', 0, 3);
  TaskText('хранящие текущие позиции строк {P} и {T} соответственно, инициализировав их', 0, 4);
  TaskText('значениями~1. Пока истинно условие |{P}|\,\-\,{p}\,\l\,|{T}|\,\-\,{t}, выполнять следующие', 0, 5);
  TaskText('действия: \(\X пока {p}\,\l\,|{P}| и {P}[{p}]\,=\,{T}[{t}], увеличивать на 1 переменные {p} и {t};\|', 0, 0);
  TaskText('\X равенство {p}\,=\,|{P}|\,+\,1 означает, что обнаружено очередное вхождение {P} в {T}', 0, 0);
  TaskText('(начиная с позиции {t}\,\-\,|{P}|);\| \X если {p}\,=\,1, то увеличить {t} на 1;\| \X положить', 0, 0);
  TaskText('переменную {p} равной значению слабой функции неудач {F}_P({p}).\) Вывести начальные', 0, 0);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 0);
  TaskText('количество сравнений символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Ускорение в методе КМП (по сравнению с наивным алгоритмом поиска)', 0, 0);
  TaskText('достигается за счет того, что изменение значения {p} (интерпретируемое как', 0, 0);
  TaskText('\Iсдвиг образца {P} вправо\i относительно текста {T}) может выполняться на величину,', 0, 0);
  TaskText('большую~1. А именно, если несовпадение символов обнаружилось для {P}[{i}\,+\,1]', 0, 0);
  TaskText('и {T}[{t}], то строка {P} сразу сдвигается вправо на {i}\,\-\,{sp}_i({P}) позиций (так что', 0, 0);
  TaskText('совмещаются символы {P}[{sp}_i({P})\,+\,1] и {T}[{t}]). При этом гарантируется, что {sp}_i({P})', 0, 0);
  TaskText('начальных позиций в {P} совпадут с соответствующими позициями строки {T},', 0, 0);
  TaskText('поэтому очередная проверка выполняется для символов {P}[{sp}_i({P})\,+\,1] и {T}[{t}].', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(10,18);
    m := Rand(n+1,n+18);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  MainSP_(p);
  cnt := 0;
  KMPMain(p,t);
  until nres < 20;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('Значения F_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F_(i),Center(i,n+1,2,2),5,2);
  ResultComment('Вхождения:',0,2);

  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
  ResultN('Количество сравнений: ',cnt,0,4,2);
//  Naive(p,t);
//  Str(cnt,s);
//  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching25;
var
  i: integer;
begin
  CreateTask(Subgroup5);
  TaskText('Даны строки {P}, {T} и значения сильной функции неудач для строки {P}: {F''}_P({i}),', 0, 1);
  TaskText('{i}\,=\,1,\,\.,\,|{P}|\,+\,1 (см.~\2). Найти все вхождения {P} в {T}, используя', 0, 2);
  TaskText('\Iмодифицированный метод Кнута\:Морриса\:Пратта\i, отличающийся от исходного', 0, 3);
  TaskText('метода КМП (см.~\1) тем, что вместо функции {F}_P в нем используется', 0, 4);
  TaskText('сильная функция неудач {F''}_P. Вывести начальные позиции всех найденных', 0, 5);
  TaskText('вхождений {P} в {T} (в порядке возрастания), а также количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Ускорение модифицированного метода КМП по сравнению с исходным', 0, 0);
  TaskText('состоит в том, что при сдвиге строки {P} вправо на {i}\,+\,{sp''}_i({P}) позиций новый', 0, 0);
  TaskText('символ строки {P}, совмещенный с текущей позицией {t} строки {T}, будет заведомо', 0, 0);
  TaskText('\Iотличаться\i от прежнего символа, для которого уже выявлено несовпадение.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(10,18);
    m := Rand(n+1,n+18);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  MainSP_(p);
  cnt := 0;
  KMP1Main(p,t);
  until nres < 20;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('Значения F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('Вхождения:',0,2);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  KMPMain(p,t);
//  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений для исходного метода КМП: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching26;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Дано число {n} и набор значений {Z}_i({P}), {i}\,=\,2,\,\.,\,{n}, для некоторой строки {P}', 0, 1);
  TaskText('длины {n} (см.~\17). Найти значения {sp''}_i({P}) (см.~\4),', 0, 2);
  TaskText('используя соотношение {sp''}_i({P})\,=\,{Z}_j({P}), где {j}\,>\,1 \= наименьший индекс,', 0, 3);
  TaskText('такой что {i}\,=\,{j}\,+\,{Z}_j({P})\,\-\,1 (данное соотношение справедливо для любого {i}\,>\,1),', 0, 4);
  TaskText('а также соотношение {sp''}_1({P})\,=\,0. Перебор {j} организовать в цикле с шагом \-1', 0, 5);
  TaskText('от {n} до 2, условные операторы не использовать. Вывести найденные', 0, 0);
  TaskText('значения {sp''}_i({P}) для {i}\,=\,1,\,\.,\,{n}.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP1_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('Значения Z_i, i=2,...,n:',xRight,1);
  for i := 2 to 20 do
    DataN('',Z_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',Z_[i],Center(i-20,19,2,2),3,2);
  p := 'соответствуют следующей строке:  \<';
  DataComment('Примечание. Исходные данные '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('Значения sp''_i(P), i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',sp1_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',sp1_[i],Center(i-19,19,2,2),4,2);

  SetTestCount(5);
end;

procedure Matching27;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Дано число {n} и набор значений {Z}_i({P}), {i}\,=\,2,\,\.,\,{n}, для некоторой строки {P}', 0, 1);
  TaskText('длины {n}. Найти значения {sp}_i({P}) (см.~\6), используя формулы', 0, 2);
  TaskText('для {sp''}_i({P}), приведенные в \1, а также соотношения {sp}_1({P})\,=\,0,', 0, 3);
  TaskText('{sp}_n({P})\,=\,{sp''}_n({P}), {sp}_i({P})\,=\,max\{{sp}_{i+1}({P})\,\-\,1, {sp''}_i({P})\}, {i}\,=\,2,\,\.,\,{n}\,\-\,1.', 0, 4);
  TaskText('Вывести найденные значения {sp}_i({P}) для {i}\,=\,1,\,\.,\,{n}.', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('Значения Z_i, i=2,...,n:',xRight,1);
  for i := 2 to 20 do
    DataN('',Z_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',Z_[i],Center(i-20,19,2,2),3,2);
  p := 'соответствуют следующей строке:  \<';
  DataComment('Примечание. Исходные данные '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('Значения sp_i(P), i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',sp_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',sp_[i],Center(i-19,19,2,2),4,2);
  SetTestCount(5);
end;

procedure Matching28;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Даны строки {P} и {T}. Используя модифицированный метод КМП (см.~\3),', 0, 1);
  TaskText('найти все вхождения {P} в {T}. Для вычисления сильной функции неудач {F''}_P', 0, 2);
  TaskText('использовать быстрый алгоритм основного препроцессинга (см.~\12)', 0, 3);
  TaskText('и формулы для {sp''}_i, приведенные в \2. Вывести начальные позиции', 0, 4);
  TaskText('всех найденных вхождений {P} в {T} (в порядке возрастания), а также найденные', 0, 5);
  TaskText('в ходе основного препроцессинга значения {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, и количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении основного препроцессинга).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSP_(p);
  KMP1Main(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
{  DataComment('Значения F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);}
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('Значения Z_i(P), i=2,...,|P|:',0,2);
  for i:= 2 to n do
    ResultN('',Z_[i],Center(i-1,n-1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching29;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Даны строки {P} и {T}. Используя метод КМП (см.~\5), найти', 0, 1);
  TaskText('все вхождения {P} в {T}. Для вычисления слабой функции неудач {F}_P использовать', 0, 2);
  TaskText('быстрый алгоритм основного препроцессинга (см.~\13) и формулы', 0, 3);
  TaskText('для {sp}_i, приведенные в \2. Вывести начальные позиции всех', 0, 4);
  TaskText('найденных вхождений {P} в {T} (в порядке возрастания), а также найденные', 0, 5);
  TaskText('в ходе основного препроцессинга значения {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, и количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении основного препроцессинга).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSP_(p);
  KMPMain(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
{  DataComment('Значения F''_P(i), i=1,...,|P|+1:',0,4);
  for i:= 1 to n+1 do
    DataN('',F1_(i),Center(i,n+1,2,2),5,2);}
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('Значения Z_i(P), i=2,...,|P|:',0,2);
  for i:= 2 to n do
    ResultN('',Z_[i],Center(i-1,n-1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

procedure stepSP_(s: string; k: integer);
var x: char;
    v: integer;
begin
  sp_[k+1] := 0;
  x := s[k+1];
  v := sp_[k];
  while (s[v+1]<>x) and (v>0) do
  begin
    inc(cnt);
    v := sp_[v];
  end;
  cnt := cnt + 2;  // поскольку всегда делается проверка символов при выходе из цикла
  // и дополнительно одна проверка делается в условном операторе
  if s[v+1]=x then
    sp_[k+1] := v+1;
end;

procedure KMP_SP_(s: string; kmax: integer);
var k: integer;
begin
  cnt := 0;
  sp_[1] := 0;
  for k := 2 to kmax do
    stepSP_(s,k-1);
end;

// Интересное замечание: количество сравнений символов в точности совпадает
//с количеством сравнений, использованным при применении основного препроцессинга!
// !!!!! После изменения алгоритма это замечание уже не является верным:
//       количество будет на 1 больше, чем для основного препроцессинга !!!!!!

procedure Matching30; {* - тонкость в подсчетом числа сравнений символов!!}
var
  i,k0: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Дана строка {P}, число {k} (<\,|{P}|) и значения {sp}_i({P}), {i}\,=\,1,\,\.,\,{k}. Найти значение', 0, 1);
  TaskText('{sp}_{k+1}({P}), используя следующий алгоритм (\Iпрепроцессинг по методу КМП\i).', 0, 2);
  TaskText('Положить {x}\,=\,{P}[{k}\,+\,1] и {v}\,=\,{sp}_k({P}). Пока символ {P}[{v}\,+\,1] не совпадает с {x} и {v}\,>\,0,', 0, 3);
  TaskText('выполнять переприсваивание {v}\,=\,{sp}_v({P}) (\<\Iрекурсивный спуск\i\>). Если после', 0, 4);
  TaskText('завершения рекурсивного спуска символ {P}[{v}\,+\,1] равен {x}, то значение {sp}_{k+1}({P})', 0, 5);
  TaskText('положить равным {v}\,+\,1, в противном случае {sp}_{k+1}({P})\,=\,0. Вывести значение {sp}_{k+1}({P})', 0, 0);
  TaskText('и количество сравнений символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. В алгоритме фактически требуется найти {P''} \= наибольший', 0, 0);
  TaskText('собственный префикс подстроки {P}[1..{k}], который совпадает с суффиксом {P}[1..{k}]', 0, 0);
  TaskText('и за которым (в позиции |{P''}|+1) следует символ {x}. Первый шаг алгоритма', 0, 0);
  TaskText('почти очевиден: если {x} совпадает с символом {P}[{sp}_k({P})\,+\,1], то {sp}_{k+1}({P})\,\g\,{sp}_k({P})\,+\,1,', 0, 0);
  TaskText('и достаточно доказать, что оценка {sp}_{k+1}({P})\,>\,{sp}_k({P})\,+\,1 никогда не выполняется', 0, 0);
  TaskText('(доказывается от противного). Отсутствие совпадения равносильно оценке', 0, 0);
  TaskText('{sp}_{k+1}({P})\,\l\,{sp}_k({P}). Используя эту оценку, можно доказать, что искомая строка {P''}', 0, 0);
  TaskText('представляет собой наибольший собственный префикс {P''''} подстроки {P}[1..{sp}_k({P})],', 0, 0);
  TaskText('который совпадает с суффиксом {P}[1..{k}] и за которым (в позиции |{P''''}|\,+\,1)', 0, 0);
  TaskText('следует символ {x}. Сравнивая данное утверждение с первым предложением', 0, 0);
  TaskText('настоящего примечания, получаем алгоритм рекурсивного спуска.', 0, 0);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(40, 50);
  k := Rand(20,38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  MainSP_(s);
  cnt := 0;
  stepSP_(s, k);
  until (cnt = k0+2);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataN('k = ', k, xleft, 3, 3);
  DataComment('Значения sp_i(P), i=1,...,k:',xRight,3);
  for i := 1 to 19 do
    DataN('',sp_[i],Center(i,19,2,2),4,2);
  for i := 20 to k do
    DataN('',sp_[i],Center(i-19,19,2,2),5,2);
  ResultN('sp_{k+1}(P) = ',sp_[k+1],0,2,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;


procedure Matching31;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Дана строка {P} и число {k} (\l\,|{P}|). Найти значения {sp}_i({P}), {i}\,=\,1,\,\.,\,{k},', 0, 1);
  TaskText('используя алгоритм препроцессинга по методу КМП, описанный в \1', 0, 2);
  TaskText('(в качестве начального шага алгоритма положить {sp}_1({P})\,=\,0). Вывести', 0, 3);
  TaskText('полученные значения, а также количество сравнений символов,', 0, 4);
  TaskText('потребовавшееся для их нахождения.', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(38, 50);
  k := rand(20, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  KMP_SP_(s,k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ',k,0,4,2);
  ResultComment('Значения {sp}_i({P}), {i}\,=\,1,\,\.,\,{k}:',0,1);

  for i := 1 to 19 do
    ResultN('',sp_[i],Center(i,19,2,2),2,2);
  for i := 20 to k do
    ResultN('',sp_[i],Center(i-19,19,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure KMP_SP1_(s: string);
// Приведенный в книге алгоритм (с.77-78) неправильный!
//  1) вместо sp'_i := sp'_v указано sp'_i := sp_v
//  2) не делается явной проверки на равенство v=0 (в этом случае
//     будет происходить обращение к несуществующему sp[0])!
//  Правда, можно предполагать, что  sp_0 = 0, но при этом увеличится
//  количество сравнений символов!
var i,n,v: integer;
begin
  n := length(s);
  KMP_SP_(s,n);
//  sp1_[1] := sp_[1];
  for i := 1 to n do
    sp1_[i] := sp_[i];
  sp1_[n] := sp_[n];
  for i := 2 to n-1 do
  begin
    v := sp_[i];
    if v > 0 then
    begin
    inc(cnt);
    if s[i+1] <> s[v+1] then
      sp1_[i] := v
    else
      sp1_[i] := sp1_[v]
    end;
  end;
end;


procedure Matching32;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Дана строка {P}. Найти значения {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (см.~\10).', 0, 1);
  TaskText('Для этого предварительно определить значения {sp}_i({P}), используя алгоритм', 0, 2);
  TaskText('препроцессинга по методу КМП (см.~\1). Для нахождения {sp''}_i({P})', 0, 3);
  TaskText('использовать следующий рекурсивный алгоритм (значения {i} перебираются от 1', 0, 4);
  TaskText('до |{P}|): если {sp}_i({P})\,=\,0, или {i}\,=\,|{P}|, или символы в позициях {i}\,+\,1 и {sp}_i({P})\,+\,1', 0, 5);
  TaskText('не равны, то {sp''}_i({P})\,=\,{sp}_i({P}), в противном случае {sp''}_i({P})\,=\,{sp''}_v({P}),', 0, 0);
  TaskText('где {v}\,=\,{sp}_i({P}). Вывести полученные значения {sp''}_i({P}) и количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся для их нахождения.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(20, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  cnt := 0;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  KMP_SP1_(s);
  ResultComment('Значения {sp''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|:',0,1);
  for i := 1 to 19 do
    ResultN('',sp1_[i],Center(i,19,2,2),2,2);
  for i := 20 to n do
    ResultN('',sp1_[i],Center(i-19,19,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;

procedure Matching33;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Даны строки {P} и {T}. Используя метод КМП (см.~\9), найти все', 0, 1);
  TaskText('вхождения {P} в {T}. Для вычисления слабой функции неудач {F}_P использовать', 0, 2);
  TaskText('алгоритм препроцессинга по методу КМП (см.~\2). Вывести начальные', 0, 3);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 4);
  TaskText('значения слабой функции неудач {F}_P({i}), {i}\,=\,1,\,\.,\,|{P}|\,+\,1, и количество', 0, 5);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма', 0, 0);
  TaskText('(в том числе и при проведении препроцессинга).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  KMP_SP_(p,n);
  KMPMain(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
//  DataComment('Значения F''_P(i), i=1,...,|P|+1:',0,4);
//  for i:= 1 to n+1 do
//    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
  for i:= 1 to n+1 do
    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

procedure Matching34;
var
  i: integer;
begin
  CreateTask(Subgroup6);
  TaskText('Даны строки {P} и {T}. Используя модифицированный метод КМП (см.~\9),', 0, 1);
  TaskText('найти все вхождения {P} в {T}. Для вычисления сильной функции неудач {F''}_P', 0, 2);
  TaskText('использовать алгоритм, приведенный в \2. Вывести начальные', 0, 3);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 4);
  TaskText('значения сильной функции неудач {F''}_P({i}), {i}\,=\,1,\,\.,\,|{P}|\,+\,1, и количество', 0, 5);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма', 0, 0);
  TaskText('(в том числе и при проведении препроцессинга).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  KMP_SP1_(p);
  KMP1Main(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
//  DataComment('Значения F''_P(i), i=1,...,|P|+1:',0,4);
//  for i:= 1 to n+1 do
//    DataN('',F1_(i),Center(i,n+1,2,2),5,2);
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('Значения F''_P(i), i=1,...,|P|+1:',0,2);
  for i:= 1 to n+1 do
    ResultN('',F1_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  SetTestCount(5);
end;

var spx_,spx0_: array[1..100,'a'..'g'] of integer;

// Алгоритм для быстрого вычисления sp_{i,x}, приведенный в книге
// (с. 53), является неполным, так как не обрабатывает случаи,
// для которых s[i+1] = x. Для данных ситуаций можно было бы
// использовать соотношение
//     spx_[i,s[i+1]] := max(0, sp_[i+1]-1);
// однако для него дополнительно требуется вычислять sp_i.
// Полный вариант приведен ниже.

// Но и в этом варианте есть недочет (см. замечание об ошибке
// в самом алгоритме реального времени)
(*
procedure MainSPx_(s: string; mm: integer);
var i,j,n: integer;
    x: char;
begin
  n := length(s);
  for i := 1 to n do
  for x := 'a' to chr(96+mm) do
    spx_[i,x] := -1;
  MainSP_(s);
//  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    x := s[Z_[j]+1];
    spx_[i,x] := Z_[j];
//    sp_[i] := Z_[j];
  end;
  if spx_[n,s[1]] = -1 then
    spx_[n,s[1]] := 0;
  for i := n-1 downto 1 do
    spx_[i,s[i+1]] := sp_[i+1]-1;
end;
*)

procedure MainSPx_(s: string; mm: integer);
var i,j,n: integer;
    x: char;
begin
  n := length(s);
  for i := 1 to n do
  begin
  sp_[i] := 0;
  for x := 'a' to chr(96+mm) do
    spx_[i,x] := -1;
  end;
//  MainSP_(s);
  MainZ_(s);
  for j := n downto 2 do
  begin
    i := j + Z_[j] -1;
    x := s[Z_[j]+1];
    spx_[i,x] := Z_[j];
    sp_[i] := Z_[j];
  end;
  if spx_[n,s[1]] = -1 then
    spx_[n,s[1]] := 0;
  spx_[n-1,s[n]] := sp_[n]-1;
  for i := n-1 downto 2 do
    spx_[i-1,s[i]] := max(spx_[i,s[i+1]],sp_[i])-1;
(*  spx_[n-1,s[n]] := sp_[n]-1;
  for i := n-2 downto 1 do
  begin
    sp_[i+1] := max(sp_[i+2]-1,sp_[i+1]);
    spx_[i,s[i+1]] := sp_[i+1]-1;
  end;
*)
(*  for i := n-1 downto 1 do
  begin
    sp_[i] := max(sp_[i+1]-1,sp_[i]);
    spx_[i,s[i+1]] := sp_[i+1]-1;
  end;
*)
end;



// Более простой вариант алгоритма, находящий sp_{i,x}
// по ранее найденным sp_i (например, с помощью
// препроцессинга по методу КМП).

procedure KMP_SPx_(s: string; mm: integer);
var i,v,b: integer;
    x: char;
begin
  n := length(s);
  for x := 'a' to chr(96+mm) do
  begin
    inc(cnt);
    if x = s[1] then b := 0
    else b := -1;
    for i := 1 to n do
      begin
        spx_[i,x] := b;
        if sp_[i] = 0 then continue;
        v := i;
        while (v > 0) and (s[sp_[v]+1] <> x) do
        begin
          v := sp_[v];
          inc(cnt);
        end;
        if v > 0 then
        begin
          spx_[i,x] := sp_[v];
          inc(cnt);
        end;
      end;
  end;
end;

procedure Matching35;
var
  i: integer;
begin
  CreateTask(Subgroup7);
  TaskText('Дана строка {P} и число {k} (\l\,|{P}|). Через {sp}_{i,x}({P}) (1\,\l\,{i}\,\l\,|{P}|, {x} \= некоторый символ)', 0, 1);
  TaskText('обозначается длина наибольшего собственного суффикса подстроки {P}[1..{i}],', 0, 2);
  TaskText('который совпадает с префиксом {P} и для которого выполняется дополнительное', 0, 3);
  TaskText('условие: символ в позиции {sp}_{i,x}({P})\,+\,1 равен {x}. Если требуемые суффиксы', 0, 4);
  TaskText('отсутствуют, то {sp}_{i,x}({P}) полагается равным 0 при {P}[1]\,=\,{x} и \-1', 0, 5);
  TaskText('в противном случае. Найти и вывести {sp}_{i,x}({P}) для {i}\,=\,1,\,\.,\,|{P}|,', 0, 0);
  TaskText('используя в качестве {x} символ {P}[{k}].', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  KMP_SP_(s,n);
  cnt := 0;
  KMP_SPx_(s,mm);
  k := Rand(1,n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', k, 0, 4, 1);
  ResultComment('Значения sp_{i,\<'+s[k]+'\>}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
      ResultN('',spx_[i,s[k]],Center(i,n,2,2),3,2);
  SetTestCount(5);
end;


procedure AutomatSPx_(p,t: string);
var t0,p0,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  t0 := 1;
  p0 := 1;
  while n-p0 <= m-t0 do
  begin
    while (p0<=n) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      inc(p0);
      inc(t0);
    end;
    if p0=n+1 then
    begin
      inc(nres);
      res[nres] := t0-n;
    end
    else
      inc(cnt);
    if (p0 > 1) and (t0 <= m) then
      p0 := spx_[p0-1,t[t0]]+2;
    inc(t0);
  end;
end;

(*
Алгоритм, описанный на с. 52-53, является неправильным!
Если sp_i,x=0 и первый символ P отличен от x, то
при сдвиге на sp_i,x+2 = 2 будет пропущен несовпадающий
символ (так как p[1]<>x), хотя он будет считаться
совпадающим, что в дальнейшем может привести к выявлению
ложных совпадений.
Для правильной реализации следует уточнить понятие
sp_i,x, добавив в случае sp_i,x=0 проверку того,
совпадает P[1] с x или нет. Если нет, то sp_i,x
разумно положить равным -1, а не 0.
*)

procedure Matching36;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Кроме того, для каждой буквы {x} из \E в алфавитном', 0, 2);
  TaskText('порядке (\<a\>, \<b\>, \<c\>,~\.) даны значения {sp}_{i,x}({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 3);
  TaskText('(см.~\1). Найти все вхождения {P} в {T}, используя \Iметод реального\i', 0, 4);
  TaskText('\Iвремени\i, имеющий следующие отличия от метода КМП (см.~\12):', 0, 5);
  TaskText('\(\X дополнительное действие при {p}\,=\,1 не выполняется;\| \X значение {p} заменяется', 0, 0);
  TaskText('не на {F}_P({p}) (равное {sp}_{p\-1}({P})\,+\,1), а на {sp}_{p\-1,x}({P})\,+\,2, где в качестве {x}', 0, 0);
  TaskText('указывается символ {T}[{t}], причем это действие выполняется только при наличии', 0, 0);
  TaskText('двух условий: {p}\,>\,1 и {t}\,\l\,|{T}|;\| \X в конце каждой итерации внешнего цикла', 0, 0);
  TaskText('значение {t} увеличивается на 1.\) Вывести начальные позиции всех найденных', 0, 0);
  TaskText('вхождений {P} в {T} (в порядке возрастания), а также количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Ускорение метода реального времени по сравнению с методом КМП', 0, 0);
  TaskText('состоит в том, что при обнаружении несовпадения символов {P}[{i}\,+\,1] и {T}[{t}]', 0, 0);
  TaskText('выполняется сдвиг строки {P} вправо на {i}\,\-\,{sp}_{i,T[t]}({P})\,\-\,1 позиций; при этом', 0, 0);
  TaskText('не требуется выполнять \Iповторное\i сравнение символа строки {P}, совмещенного', 0, 0);
  TaskText('с прежней текущей позицией {t} строки {T}, и можно сразу переходить', 0, 0);
  TaskText('к сравнению следующей пары символов.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  KMP_SP_(p,n);
  KMP_SPx_(p,mm);
  cnt := 0;
  nres := 0;
  AutomatSPx_(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ',mm,xLeft,4,1);
  DataComment('Значения sp_{i,x}(P), i=1,...,|P|:',xRight,4);
  for j:= 1 to mm do
  begin
    x := chr(96+j);
    DataComment('x=\<'+x+'\>}:',3,4+j);
    for i := 1 to n do
      DataN('',spx_[i,x],Center(i,n,2,1),4+j,2);
  end;
  ResultComment('Вхождения:',0,2);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
  end;
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
//  cnt := 0;
//  Naive(p,t);
//  for i := 1 to nres do
//  begin
//    ResultN('',res[i],Center(i,nres,2,2),5,2);
//  end;
  cnt := 0;
//  Naive(p,t);
//  Str(cnt,s);
//  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
  KMPMain(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений для метода КМП (без препроцессинга): '+s,0,5);

  SetTestCount(5);
end;



procedure Naive_SPx_(s: string; mm: integer);
var x: char;
    i,j,k: integer;
    b: boolean;
begin
  cnt := 0;
  n := length(s);
  for x := 'a' to chr(96+mm) do
  begin
    for i := 1 to n do
    begin
      spx_[i,x] := -1;
      for j := i-1 downto 0 do
      begin
        b := true;
        for k := 1 to j do
        begin
          inc(cnt);
          if s[k] <> s[k-j+i] then
          begin
            b := false;
            break;
          end;
        end;
        if not b then continue;
        inc(cnt);
        if s[j+1]=x then
        begin
          spx_[i,x] := j;
          break;
        end;
      end;
    end;
  end;
end;

(*
procedure myKMP_SPx_(s: string);
var i,v: integer;
    x: char;
begin
  n := length(s);
  KMP_SP_(s,n);
  for x := 'a' to 'g' do
  begin
    for i := 1 to n do
      spx_[i,x] := 0;
    for i := 2 to n do
      begin
        v := i;
        while (v > 0) do
        begin
{        if (v<n) and (s[v+1]=x) then
        begin
          spx_[i,x] := max(0, sp_[v+1]-1);
          break;
        end;}
        if s[sp_[v]+1] = x then
          begin
            spx_[i,x] := sp_[v];
            break;
          end;
        v := sp_[v];
        end;
      end;
  end;
end;
*)
(*
procedure Matching37;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('Дана строка {P} и набор значений {sp}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (см.~\16).', 0, 1);
  TaskText('Кроме того, дано число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 2);
  TaskText('строчных латинских букв. Найти значения {sp}_{i,x}({P}) (см.~\2),', 0, 3);
  TaskText('используя следующий \Iалгоритм рекурсивного спуска\i по значениям {sp}_i .', 0, 4);
  TaskText('Во внешнем цикле перебираются все символы {x} из \E. Для каждого {x} определяется', 0, 5);
  TaskText('вспомогательное значение {b}, равное 0, если {P}[1]\,=\,{x}, и равное \-1 в противном', 0, 0);
  TaskText('случае. Значение {sp}_{1,x}({P}) полагается равным {b}. Каждое последующее значение', 0, 0);
  TaskText('{sp}_{i,x}({P}), {i}\,=\,2,\,\.,\,|{P}|, находится следующим образом. Если {sp}_i({P})\,=\,0,', 0, 0);
  TaskText('то {sp}_{i,x}({P})\,=\,{b}, иначе вводится переменная {v}, которая полагается равной {i}.', 0, 0);
  TaskText('Если символ {P}[{sp}_v({P})+1] совпадает с {x}, то {sp}_{i,x}({P})\,=\,{sp}_v({P}). В противном случае,', 0, 0);
  TaskText('если {v}\,>\,0, то переменная {v} полагается равной {sp}_v({P}) и повторяется проверка,', 0, 0);
  TaskText('описанная в предыдущем предложении. Если {v}\,=\,0, то {sp}_{i,x}({P})\,=\,{b}. Вывести', 0, 0);
  TaskText('найденные значения {sp}_{i,x}({P}), перебирая {x} из \E в алфавитном порядке', 0, 0);
  TaskText('и для каждого {x} изменяя {i} от 1 до |{P}|. Вывести также количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма.', 0, 0);

  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  KMP_SP_(s,n);
  cnt := 0;
  KMP_SPx_(s,mm);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataComment('Значения sp_i(P), i=1,...,|P|:',0,3);
  for i := 1 to n do
    DataN('',sp_[i],Center(i,n,2,1),4,2);
  DataN('m = ', mm, 0, 5, 1);
//  ResultComment('Значения sp_{i,x}(P), i=1,...,|P|:',0,1);
  j := 0;
  case mm of
  1: j := 2;
  2,3: j := 1;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('sp_{i,\<'+x+'\>}:',3,k+j);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+j,2);
  end;
  ResultN('Количество сравнений: ',cnt,0,mm+1+j,3);
  cnt := 0;
//  Naive_SPX_(s,mm);
  spx0_ := spx_;
  MainSPx_(s,mm);
  Str(cnt,s);
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('x = \<'+x+'\>:',3,k+5);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+5,2);
  end;
  ResultComment(''+s,65,mm+1+j);
  cnt := 0;
  for i := 1 to 100 do
    for k := 1 to mm do
      if spx0_[i,chr(96+k)] <> spx_[i,chr(96+k)] then
        inc(cnt);
  if cnt > 0 then
  ResultN('',cnt,90,1,1);


  SetTestCount(5);
end;
*)

procedure Matching37;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('Дана строка {P} и набор значений {Z}_i({P}), {i}\,=\,2,\,\.,\,|{P}| (см.~\28).', 0, 1);
  TaskText('Кроме того, дано число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 2);
  TaskText('строчных латинских букв. Найти значения {sp}_{i,x}({P}) (см.~\2),', 0, 3);
  TaskText('модифицировав быстрый алгоритм нахождения {sp''}_i({P}), описанный в \11:', 0, 4);
  TaskText('\(\X вначале все значения {sp}_{i,x}({P}) полагаются равными \-1, а все значения {sp''}_i({P})', 0, 5);
  TaskText('равными 0;\| \X в цикле по {j} от |{P}| до 2 с шагом \-1 значения {sp}_{i,x}({P}) и {sp''}_i({P})', 0, 0);
  TaskText('полагаются равными {Z}_j({P}), где {i}\,=\,{j}\,+\,{Z}_j({P})\,\-\,1, {x}\,=\,{P}[{Z}_j({P})\,+\,1];\|', 0, 0);
  TaskText('\X если после завершения цикла значение {sp}_{|P|,P[1]}({P}) остается равным \-1,', 0, 0);
  TaskText('то оно заменяется на 0;\| \X значения {sp}_{i,x}({P}) в случае {x}\,=\,{P}[{i}\,+\,1] определяются', 0, 0);
  TaskText('по формулам: {sp}_{n\-1,P[n]}({P})\,=\,{sp''}_n({P})\,\-\,1, где {n}\,=\,|{P}|;', 0, 0);
  TaskText('{sp}_{i\-1,P[i]}({P})\,=\,max\{{sp}_{i,P[i+1]}({P}), {sp''}_i({P})\}\,\-\,1, где {i} изменяется от |{P}|\,\-\,1 до 2', 0, 0);
  TaskText('с шагом \-1.\) Вывести найденные значения {sp}_{i,x}({P}), перебирая {x} из \E', 0, 0);
  TaskText('в алфавитном порядке и для каждого {x} изменяя {i} от 1 до |{P}|.', 0, 0);
  TaskText('\P\SПримечание\s. В первом цикле описанного алгоритма определяются значения {sp}_{i,x}({P})', 0, 0);
  TaskText('в случае {x}\,\n\,{P}[{i}\,+\,1]. Рекуррентные формулы для {sp}_{i,x}({P}) в случае {x}\,=\,{P}[{i}\,+\,1]', 0, 0);
  TaskText('можно получить из соотношения {sp}_{i\-1,P[i]}({P})\,=\,{sp}_i({P})\,\-\,1, {i}\,=\,2,\,\.,\,|{P}|,', 0, 0);
  TaskText('с учетом алгоритма вычисления {sp}_i, приведенного в \10.', 0, 0);



  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  cnt := 0;
  MainSPx_(s,mm);
  DataComment(Rule(4,length(s)),0,1);
  DataS('P = ',s,0,2);
  DataComment('Значения Z_i(P), i=2,...,|P|:',0,3);
  for i := 2 to n do
    DataN('',Z_[i],Center(i-1,n-1,2,1),4,2);
  DataN('m = ', mm, 0, 5, 1);
//  ResultComment('Значения sp_{i,x}(P), i=1,...,|P|:',0,1);
  j := 0;
  case mm of
  1,2: j := 2;
  3,4: j := 1;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('sp_{i,\<'+x+'\>}:',3,k+j);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+j,2);
  end;
(*  ResultN('Количество сравнений: ',cnt,0,mm+1+j,3);
  cnt := 0;
  spx0_ := spx_;
  Naive_SPX_(s,mm);
  Str(cnt,s);
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('x = \<'+x+'\>:',3,k+5);
    for i := 1 to n do
      ResultN('',spx_[i,x],Center(i,n,2,1),k+5,2);
  end;
  ResultComment(''+s,65,mm+1+j);
  cnt := 0;
  for i := 1 to 100 do
    for k := 1 to mm do
      if spx0_[i,chr(96+k)] <> spx_[i,chr(96+k)] then
        inc(cnt);
  if cnt > 0 then
  ResultN('',cnt,90,1,1);
*)

  SetTestCount(5);
end;


procedure Matching38;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup7);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Используя метод реального времени (см.~\2),', 0, 2);
  TaskText('найти все вхождения {P} в {T}. Для вычисления {sp}_{i,x}({P}) использовать быстрый', 0, 3);
  TaskText('алгоритм основного препроцессинга (см.~\22) и алгоритм, описанный', 0, 4);
  TaskText('в \1. Вывести начальные позиции всех найденных вхождений {P} в {T}', 0, 5);
  TaskText('(в порядке возрастания), а также значения {sp}_{i,x}({P}), {i}\,=\,1,\,\.,\,|{P}|, {x}\,=\,\<a\>,', 0, 0);
  TaskText('и количество сравнений символов, потребовавшееся при выполнении алгоритма', 0, 0);
  TaskText('(в том числе и при выполнении основного препроцессинга).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  cnt := 0;
  MainSPx_(p,mm);
  nres := 0;
  AutomatSPx_(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);

  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
  ResultComment('Значения sp_{i,\<a\>}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
    ResultN('',spx_[i,'a'],Center(i,n,2,1),3,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
*)
//  KMPMain(p,t);
//  Str(cnt,s);
//  ResultComment(' Примечание. Количество сравнений для метода КМП (без препроцессинга): '+s,0,5);
  SetTestCount(5);
end;

var R_: array ['a'..'z'] of integer;
    Ri_: array ['a'..'z',1..100] of integer;

procedure CalcR_(s: string; m: integer);
var i: integer;
    x: char;
begin
  for x := 'a' to chr(96+m) do
    R_[x] := 0;
  for i := 1 to length(s) do
    R_[s[i]] := i;
end;

procedure CalcRi_(s: string; m: integer);
var i,j: integer;
    x: char;
begin
  for x := 'a' to chr(96+m) do
    for i := 1 to length(s) do
      Ri_[x,i] := 0;
  for i := 1 to length(s) do
    for j := i+1 to length(s) do
      Ri_[s[i],j] := i;
end;

procedure Matching39;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Через {R}_x({P}) обозначается позиция крайнего правого', 0, 2);
  TaskText('вхождения символа {x} в строку {P} (если {x} не входит в {P}, то {R}_x({P})\,=\,0).', 0, 3);
  TaskText('Выполняя однократный просмотр символов строки {P} и не используя', 0, 4);
  TaskText('условные операторы, найти {R}_x({P}) для {x} из \E и вывести найденные', 0, 5);
  TaskText('значения, перебирая {x} в алфавитном порядке.', 0, 0);
(*  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
*)
  mm := Rand(1,9);
  n := rand(40, 70);
  s := CreateString(mm, n);
  CalcR_(s,mm);
  DataS('P = ',s,0,2);
  DataComment(Rule(4,length(s)),0,3);
  DataN('m = ',mm,0,4,1);
  ResultComment('x:',3,2);
  ResultComment('R_{x}:',3,3);
  for j := 1 to mm do
  begin
    x := chr(96+j);
    ResultComment(x,Center(j,mm,2,1)+1,2);
    ResultN('',R_[x],Center(j,mm,2,1),3,2);
  end;
  SetTestCount(5);
end;

procedure Matching40;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Через {R}_{x,i}({P}), {i}\,=\,1,\,\.,\,|{P}|, обозначается позиция', 0, 2);
  TaskText('ближайшего вхождения символа {x} в строку {P} слева от позиции {i} (или 0, если', 0, 3);
  TaskText('требуемые вхождения отсутствуют). Организовав хранение значений {R}_{x,i}({P})', 0, 4);
  TaskText('в двумерном массиве и не используя условные операторы, найти {R}_{x,i}({P})', 0, 5);
  TaskText('для {x} из \E и вывести найденные значения, перебирая {x} в алфавитном порядке', 0, 0);
  TaskText('и для каждого {x} изменяя {i} от 1 до |{P}|.', 0, 0);
  i := Random(7);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(10, 20);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 2 to Random(5) do
      s[i] := s[1];
  s := Copy(s,1,n);
  for i := 1 to 2 do
    Ins(s, Copy(s,1,Rand(2,5)), Rand(5,10));
  CalcRi_(s,mm);
  DataS('P = ',s,0,2);
  DataComment(Rule(4,length(s)),0,3);
  DataN('m = ',mm,0,4,1);
  j := 0;
  case mm of
  1,2: j := 2;
  3,4: j := 1;
  end;
  if mm < 5 then
  begin
    ResultComment('i:',3,j);
    for i := 1 to n do
    begin
      Str(i:2,p);
      ResultComment(p,Center(i,n,2,1),j);
    end;
  end;
  for k := 1 to mm do
  begin
    x := chr(96+k);
    ResultComment('R_{\<'+x+'\>,i}:',3,k+j);
    for i := 1 to n do
      ResultN('',Ri_[x,i],Center(i,n,2,1),k+j,2);
  end;
  SetTestCount(5);
end;

procedure BadChar(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      inc(k);
    end
    else
    begin
      inc(cnt);
      k := k + max(1, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BadChar1(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      inc(k);
    end
    else
    begin
      inc(cnt);
      k := k + max(1, p0-Ri_[t[t0],p0]);
    end;
  end;
end;


procedure Matching41;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Вычислить значения {R}_x({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\2) и найти все вхождения {P} в {T}, используя посимвольное', 0, 3);
  TaskText('сравнение строк справа налево, а также \Iправило сдвига по плохому символу\i.', 0, 4);
  TaskText('Для этого использовать переменную {k}, инициализировав ее значением |{P}|,', 0, 5);
  TaskText('и переменные {p} и {t}, хранящие текущие позиции строк {P} и {T} соответственно.', 0, 0);
  TaskText('Пока выполняется условие {k}\,\l\,|{T}|, выполнять следующие действия:', 0, 0);
  TaskText('\(\X положить {p} равной |{P}|, а {t} равной {k};\| \X пока {p}\,>\,0 и {P}[{p}]\,=\,{T}[{t}], уменьшать', 0, 0);
  TaskText('на 1 переменные {p} и {t};\| \X равенство {p}\,=\,0 означает, что обнаружено очередное', 0, 0);
  TaskText('вхождение {P} в {T} (начиная с позиции {t}\,+\,1), в этом случае увеличить {k} на 1;', 0, 0);
  TaskText('в противном случае увеличить {k} на max\{1, {p}\,\-\,{R}_x({P})\}, где в качестве {x}', 0, 0);
  TaskText('указывается {T}[{t}].\) Вывести начальные позиции всех найденных вхождений {P} в {T}', 0, 0);
  TaskText('(в порядке возрастания), а также значения {R}_x({P}) для {x} из \E (перебирая {x}', 0, 0);
  TaskText('в алфавитном порядке) и количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Ускорение в методе, использующем правило сдвига по плохому', 0, 0);
  TaskText('символу (по сравнению с наивным алгоритмом поиска) достигается за счет того,', 0, 0);
  TaskText('что изменение значения {k} (интерпретируемое как \Iсдвиг образца {P} вправо\i', 0, 0);
  TaskText('относительно текста {T}) может выполняться на величину, \Iбольшую\i 1. А именно,', 0, 0);
  TaskText('если крайнее правое вхождение в {P} символа {T}[{t}] занимает позицию {j},', 0, 0);
  TaskText('расположенную слева от текущей позиции {P}, то строка {P} сдвигается вправо', 0, 0);
  TaskText('таким образом, чтобы символ {P}[{j}] совместился с {T}[{t}]. Особенно эффективен', 0, 0);
  TaskText('такой сдвиг в случае, если {T}[{t}] не входит в строку-образец {P} (в этом случае', 0, 0);
  TaskText('{j}\,=\,0, и начальная позиция строки {P} сразу совмещается с позицией {t}\,+\,1 строки {T}).', 0, 0);
  i := Random(11);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcR_(p,mm);
  cnt := 0;
  BadChar(p,t);
  until nres < 14;
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  ResultComment('Значения R_x(P), x=\<a\>,\<b\>,...,\<'+chr(96+mm)+'\>:',0,2);
  for i := 1 to mm do
    ResultN('',R_[chr(96+i)],Center(i,mm,2,2),3,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  end;
*)
  SetTestCount(5);
end;

procedure Matching42;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Вычислить значения {R}_{x,i}({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\2) и найти все вхождения {P} в {T}, используя посимвольное', 0, 3);
  TaskText('сравнение строк справа налево и \Iрасширенное правило сдвига по плохому символу\i.', 0, 4);
  TaskText('Данное правило отличается от обычного правила сдвига по плохому символу', 0, 5);
  TaskText('(см.~\1) тем, что при увеличении переменной {k} вместо выражения', 0, 0);
  TaskText('{p}\,\-\,{R}_{T[t]}({P}) используется выражение {p}\,\-\,{R}_{T[t],p}({P}). Вывести начальные', 0, 0);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 0);
  TaskText('значения {R}_{x,i}({P}), {x}\,=\,\<a\>, {i}\,=\,1,\,\.,\,|{P}|, и количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Расширенное правило плохого символа более эффективно', 0, 0);
  TaskText('(по сравнению с обычным правилом) при обработке строк, содержащих большое', 0, 0);
  TaskText('количество \Iповторяющихся\i символов.', 0, 0);
  i := Random(11);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcRi_(p,mm);
  cnt := 0;
  BadChar1(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ',mm,xleft,4,1);
  ResultComment('Вхождения:',4,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
  ResultComment('Значения R_{\<a\>,i}(P), i=1,...,|P|:',0,2);
  for i := 1 to n do
    ResultN('',Ri_['a',i],Center(i,n,2,2),3,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  CalcR_(p,mm);
  cnt := 0;
  BadChar(p,t);
//  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений для обычного правила плохого символа: '+s,0,5);
(*
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),2,2);
  end;
*)
  SetTestCount(5);
end;

var N_,L_,L1_,S_: array [1..100] of integer;

procedure NaiveN_(s: string);
var
    k,i,n: integer;
begin
  n := length(s);
  for i := 1 to n-1 do
  begin
    N_[i] := 0;
    for k := 1 to i do
      if Copy(s, i-k+1,k) = Copy(s,n-k+1,k) then
        N_[i] := k;
  end;
end;


procedure MainN_(s: string);
var s1: string;
    i,n: integer;
begin
  s1 := '';
  n := length(s);
  for i := 1 to n do
    s1 := s[i] + s1;
  MainZ_(s1);
  for i := 1 to n-1 do
    N_[i] := Z_[n-i+1];
end;

procedure NaiveL_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  for i := 1 to n do
  begin
    L_[i] := 0;
    s1 := Copy(s,i,100);
    n1 := length(s1);
    for j := 1 to n-1 do
      if copy(s,j,n1) = s1 then
        if j+n1-1 < n then
          L_[i] := j+n1-1;
  end;
end;

procedure NaiveL1_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  L1_[1] := 0;
  for i := 2 to n do
  begin
    L1_[i] := 0;
    s1 := Copy(s,i,100);
    n1 := length(s1);
    for j := 1 to n-1 do
      if copy(s,j,n1) = s1 then
        if (j+n1-1 < n) and ((j=1) or (s[j-1]<>s[i-1])) then
          L1_[i] := j+n1-1;
  end;
end;


procedure MainL1_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    L1_[i] := 0;
  MainN_(s);
  for j := 1 to n-1 do
  begin
    i := n - N_[j] +1;
    L1_[i] := j;
  end;
end;

procedure MainL_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  MainL1_(s);
  L_[1] := L1_[1];
  L_[2] := L1_[2];
  for i := 3 to n do
    L_[i] := max(L_[i-1], L1_[i]);
end;


procedure NaiveS_(s: string);
var i,j,n,n1: integer;
    s1: string;
begin
  n := length(s);
  for i := 1 to n do
  begin
    S_[i] := 0;
    for j := 1 to n-i+1 do
      if (copy(s,1,j) = copy(s,n-j+1,j)) and (j < n) then
        S_[i] := j;
  end;
end;


procedure MainS_(s: string);
var i,j,n: integer;
begin
  n := length(s);
  for i := 1 to n do
    S_[i] := 0;
  MainN_(s);
  for j := 1 to n-1 do
    if N_[j] = j then
    begin
      i := n - j + 1;
      S_[i] := j;
    end;
  for i := n-1 downto 1 do
    S_[i] := max(S_[i],S_[i+1]);
end;


function InvStr(s: string): string;
var i: integer;
begin
  result := '';
  for i := 1 to length(s) do
    result := s[i] + result;
end;

procedure Matching43;
var
  i,j,k0,sum: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P} и число {i} (\l\,|{P}|). Через {L}_i({P}) обозначается наибольшая позиция', 0, 1);
  TaskText('в {P}, меньшая |{P}| и такая, что подстрока {P}[{i}..|{P}|] совпадает с суффиксом', 0, 2);
  TaskText('строки {P}[1..{L}_i({P})]. Если такой позиции нет, то {L}_i({P})\,=\,0. Иначе говоря,', 0, 3);
  TaskText('{L}_i({P}) определяет позицию правого конца крайней правой копии строки', 0, 4);
  TaskText('{P}[{i}..|{P}|], которая не является суффиксом {P}. Найти и вывести {L}_i({P}).', 0, 5);
  k0 := Random(6);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(5) do
      s := s[1] + s;
  s := Copy(s,1,n);
  sum := 0;
  for i := 1 to n do
    if s[i]=s[1] then
      Inc(sum);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := InvStr(s);
  MainL_(s);
  k := Rand(1,n-1);
  until (k0 = 0) and (sum = n) or (k0=1) and (L_[k]=0) or (k0>1) and (sum <> n) and (L_[k]>0);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ', k, 0, 4, 1);
  ResultN('L_{i}(P) = ',L_[k],0,3,2);
  SetTestCount(5);
end;

procedure Matching44;
var
  i,k0: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P} и число {k} (\l\,|{P}|). Через {L''}_i({P}), {i}\,=\,2,\,\.,\,|{P}|, обозначается', 0, 1);
  TaskText('наибольшая позиция в {P}, меньшая |{P}| и такая, что подстрока {P}[i..|{P}|] совпадает', 0, 2);
  TaskText('с суффиксом строки {P}[1..{L''}_i({P})], причем символ, предшествующий этому суффиксу,', 0, 3);
  TaskText('либо отсутствует, либо не равен {P}[{i}\,\-\,1]. Если такой позиции нет, то {L''}_i({P})\,=\,0.', 0, 4);
  TaskText('В случае {i}\,=\,1 по определению  полагается {L''}_1({P})\,=\,0. Таким образом,', 0, 5);
  TaskText('{L''}_i({P})\,\l\,{L}_i({P}) (см.~\1). Найти и вывести {L''}_i({P}) для {i}\,=\,1,\,\.,\,|{P}|.', 0, 0);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(30, 50);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := InvStr(s);
  MainL_(s);
  k := rand(2,19);
  k0 := 0;
  for i := n-k+1 to n do
    if L_[i] = L1_[i] then
      inc(k0);
  until k0<k;
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', n-k+1, 0, 4, 1);
  ResultComment('Значения L''_{i}(P), i=k,...,|P|:',0,2);
  for i := n-k+1 to n do
    ResultN('',L1_[i],Center(i-n+k,k,2,2),3,2);
  ResultComment('Примечание. Для сравнения ниже приведены значения L_{i}(P), i=k,...,|P|:',0,4);
  for i := n-k+1 to n do
  begin
    str(L_[i]:2,s);
    ResultComment(s,Center(i-n+k,k,2,2),5);
  end;
  SetTestCount(5);
end;

procedure Matching45;
var
  i,sum,sum1,k0: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P}. Через {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, обозначается длина наибольшего', 0, 2);
  TaskText('суффикса подстроки {P}[{i}..|{P}|], который является собственным префиксом {P}.', 0, 3);
  TaskText('Если таких суффиксов не существует, то {s}_i({P})\,=\,0.', 0, 4);
  TaskText('Найти и вывести {s}_i({P}) для {i}\,=\,1,\,\.,\,|{P}|.', 0, 5);
  k0 := Random(5);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  sum := 0;
  for i := 1 to n do
    if s[i]=s[1] then
      inc(sum);
  MainS_(s);
  sum1 := 0;
  for i := 1 to n do
    if s_[i]<=1 then
      inc(sum1);
  until (k0 = 0) and (sum=n) or (k0 = 1) and (sum1=n) or
        (k0>1) and (sum<n) and (sum1<n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  ResultComment('Значения s_i, i=1,...,|P|:',0,2);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),4,2);
(*  NaiveS_(s);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure GoodSuffix(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        inc(k)
      else
        if L_[p0+1] > 0 then
          k := k + n-L_[p0+1]
        else
          k := k + n-S_[p0+1];
    end;
  end;
end;

procedure GoodSuffix1(p,t: string);
var p0,t0,k,n,m: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        inc(k)
      else
        if L1_[p0+1] > 0 then
          k := k + n-L1_[p0+1]
        else
          k := k + n-S_[p0+1];
    end;
  end;
end;




procedure Matching46;
var
  i: integer;

begin
  CreateTask(Subgroup8);
  TaskText('Даны строки {P} и {T}, а также значения {L}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 1);
  TaskText('(см.~\3 и~\1). Найти все вхождения {P} в {T}, используя', 0, 2);
  TaskText('посимвольное сравнение справа налево и \Iслабое правило сдвига по хорошему\i', 0, 3);
  TaskText('\Iсуффиксу\i. Для этого использовать схему алгоритма, реализующего правило сдвига', 0, 4);
  TaskText('по плохому символу (см.~\5), изменив его заключительное действие', 0, 5);
  TaskText('следующим образом: \(\X если {p}\,=\,0, т.\,е. обнаружено очередное вхождение {P} в {T}', 0, 0);
  TaskText('(начиная с позиции {t}\,+\,1), то увеличить {k} на |{P}|\,\-\,{s}_2({P}); в противном случае,', 0, 0);
  TaskText('если {p}\,=\,|{P}|, то увеличить {k} на 1, а если {p}\,<\,|{P}|, то в случае {L}_{p+1}({P})\,>\,0', 0, 0);
  TaskText('увеличить {k} на |{P}|\,\-\,{L}_{p+1}({P}), а в случае {L}_{p+1}({P})\,=\,0 увеличить {k} на', 0, 0);
  TaskText('|{P}|\,\-\,{s}_{p+1}({P}).\) Вывести начальные позиции всех найденных вхождений {P} в {T}', 0, 0);
  TaskText('(в порядке возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Приведем словесное описание слабого правила сдвига по хорошему', 0, 0);
  TaskText('суффиксу: если обнаружена подстрока {T''} из {T}, совпадающая с суффиксом {P}', 0, 0);
  TaskText('и такая, что символы слева от этих подстрок не совпадают, то в {P} ищется', 0, 0);
  TaskText('крайняя правая подстрока {P''}, совпадающая с {T''} и не являющаяся суффиксом {P},', 0, 0);
  TaskText('после чего {P} сдвигается вправо так, чтобы подстрока {P''} строки {P} совместилась', 0, 0);
  TaskText('с подстрокой {T''} строки {T}. Если требуемая подстрока {P''} отсутствует', 0, 0);
  TaskText('(ситуация {L}_{p+1}({P})\,=\,0), то выполняется \Iнаименьший\i сдвиг {P} вправо, при котором', 0, 0);
  TaskText('префикс сдвинутой строки {P} совпадет с некоторым суффиксом подстроки {T''} в {T}', 0, 0);
  TaskText('(если такого сдвига не существует, то {P} сдвигается на |{P}| позиций вправо).', 0, 0);
  TaskText('При обнаружении вхождения {P} выполняется \Iнаименьший\i сдвиг вправо, при котором', 0, 0);
  TaskText('собственный префикс сдвинутой строки {P} совпадет с некоторым суффиксом', 0, 0);
  TaskText('найденного вхождения {P} в {T} (если такого сдвига не существует,', 0, 0);
  TaskText('то {P} сдвигается на |{P}| позиций вправо).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  GoodSuffix(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('L_i(P):',3,4);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),4,2);
  DataComment('s_i(P):',3,5);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),5,2);
  ResultComment('Вхождения:',0,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  res0 := res;
  nres0 := nres;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
*)
  SetTestCount(5);
end;



procedure Matching47;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Даны строки {P} и {T}, а также значения {L''}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 1);
  TaskText('(см.~\3 и~\2). Найти все вхождения {P} в {T}, используя', 0, 2);
  TaskText('посимвольное сравнение справа налево и \Iсильное правило сдвига по хорошему\i', 0, 3);
  TaskText('\Iсуффиксу\i, отличающееся от слабого правила (см.~\1) тем, что', 0, 4);
  TaskText('при увеличении переменной {k} вместо значений {L}_{p+1}({P}) используются значения', 0, 5);
  TaskText('{L''}_{p+1}({P}). Вывести начальные позиции всех найденных вхождений {P} в {T}', 0, 0);
  TaskText('(в порядке возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  TaskText('\P\SПримечание\s. Сильное правило сдвига по хорошему суффиксу отличается', 0, 0);
  TaskText('от слабого тем, что если обнаружена подстрока {T''} из {T}, совпадающая', 0, 0);
  TaskText('с суффиксом {P}, и такая, что символы слева от этих подстрок не совпадают,', 0, 0);
  TaskText('то в {P} ищется крайняя правая подстрока {P''}, не только совпадающая с {T''},', 0, 0);
  TaskText('но и обладающая дополнительным свойством: символ слева от {P''}', 0, 0);
  TaskText('\Iне равен\i символу слева от суффикса строки {P}, равного {T''}.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  GoodSuffix1(p,t);
  until nres < 14;
  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataComment('L''_i(P):',3,4);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),4,2);
  DataComment('s_i(P):',3,5);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),5,2);
  ResultComment('Вхождения:',0,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений для слабого правила хорошего суффикса: '+s,3,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),3,2);
*)


  SetTestCount(5);
end;


procedure Matching48;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P} и число {i} (<\,|{P}|). Через {N}_i({P}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1, обозначается', 0, 2);
  TaskText('длина наибольшего суффикса строки {P}[1..{i}], который также является суффиксом', 0, 3);
  TaskText('полной строки {P}. Если такого суффикса нет, то {N}_i({P})\,=\,0. Найти и вывести {N}_i({P}).', 0, 4);
  k := Random(9);
  repeat
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(40, 70);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 5 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  MainN_(s);
  i := Rand(1,n-1);
  until (k=0) and (N_[i]=0) or (k=1) and (mm=1) or (k>=2) and (mm>1) and (N_[i]>=k-1);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('i = ',i,0,4,1);
  ResultN('N_i(P) = ',N_[i],0,3,2);
  SetTestCount(5);
end;


procedure Matching49;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дана строка {P}. Реализовать следующий алгоритм вычисления значений {N}_i({P})', 0, 1);
  TaskText('(см.~\1): \(\X инвертировать строку {P}, получив в результате строку {P''};\|', 0, 2);
  TaskText('\X используя быстрый алгоритм основного препроцессинга для строки {P''}', 0, 3);
  TaskText('(см.~\33), найти значения {Z}_j({P''}), {j}\,=\,2,\,\.,\,|{P}|;\| \X положить', 0, 4);
  TaskText('значение {N}_i({P}) равным {Z}_{|P|\-i+1}({P''}), {i}\,=\,1,\,\.,\,|{P}|\,\-\,1.\) Вывести найденные', 0, 5);
  TaskText('значения {N}_i({P}) для {i}\,=\,1,\,\.,\,|{P}|\,\-\,1. Вывести также количество сравнений', 0, 0);
  TaskText('символов, потребовавшееся при выполнении основного препроцессинга.', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  cnt := 0;
  MainN_(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  ResultComment('Значения N_i(P), i=1,...,|P|\-1:',0,2);
  for i := 1 to n-1 do
      ResultN('',N_[i],Center(i,n-1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  SetTestCount(5);
end;



procedure Matching50;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дано число {n} и набор значений {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, для некоторой', 0, 1);
  TaskText('строки {P} длины {n} (см.~\2). Найти значения {L''}_i({P}) для {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(см.~\6), используя соотношение {L''}_i({P})\,=\,{j}, где {j}\,<\,{n} \= наибольший', 0, 3);
  TaskText('индекс, такой что {i}\,=\,{n}\,\-\,{N}_j({P})\,+\,1 (если требуемые индексы {j} отсутствуют,', 0, 4);
  TaskText('то {L''}_i({P})\,=\,0). Перебор {j} организовать в цикле от 1 до {n}\,\-\,1 с шагом 1,', 0, 5);
  TaskText('условные операторы не использовать. Вывести найденные значения {L''}_i({P}).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainL1_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('Значения N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := 'соответствуют следующей строке:  \<';
  DataComment('Примечание. Исходные данные '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('Значения L''_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',L1_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',L1_[i],Center(i-19,19,2,2),4,2);
(*
  NaiveL1_(s);
  for i := 1 to 19 do
    ResultN('',L1_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',L1_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure Matching51;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дано число {n} и набор значений {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, для некоторой', 0, 1);
  TaskText('строки {P} длины {n} (см.~\3). Найти значения {L}_i({P}) для {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(см.~\8), используя формулы для {L''}_i({P}), приведенные', 0, 3);
  TaskText('в \1, а также соотношения {L}_1({P})\,=\,0, {L}_i({P})\,=\,max\{{L}_{i\-1}({P}), {L''}_i({P})\},', 0, 4);
  TaskText('{i}\,=\,2,\,\.,\,{n}. Вывести найденные значения {L}_i({P}).', 0, 5);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainL_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('Значения N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := 'соответствуют следующей строке:  \<';
  DataComment('Примечание. Исходные данные '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('Значения L_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',L_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',L_[i],Center(i-19,19,2,2),4,2);
(*  NaiveL_(s);
  for i := 1 to 19 do
    ResultN('',L_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',L_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;

procedure Matching52;
var
  i: integer;
begin
  CreateTask(Subgroup8);
  TaskText('Дано число {n} и набор значений {N}_i({P}), {i}\,=\,1,\,\.,\,{n}\,\-\,1, для некоторой', 0, 1);
  TaskText('строки {P} длины {n} (см.~\4). Найти значения {s}_i({P}) для {i}\,=\,1,\,\.,\,{n}', 0, 2);
  TaskText('(см.~\7), используя соотношение {s}_i({P})\,=\,{j}, где {j}\,\l\,{n}\,\-\,i\,+\,1 \= наибольший', 0, 3);
  TaskText('индекс, такой что {N}_j({P})\,=\,{j} (если требуемые индексы {j} отсутствуют,', 0, 4);
  TaskText('то {s}_i({P})\,=\,0). Алгоритм не должен содержать вложенных циклов', 0, 5);
  TaskText('(ср. с \1). Вывести найденные значения {s}_i({P}).', 0, 0);
  i := Random(6);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(21, 38);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(10) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,10)), Rand(10,n-5));
  s := invStr(s);
  MainS_(s);
  DataN('n = ', n, xleft, 1, 2);
  DataComment('Значения N_i, i=1,...,n\-1:',xRight,1);
  for i := 2 to 20 do
    DataN('',N_[i],Center(i-1,19,2,2),2,2);
  for i := 21 to n do
    DataN('',N_[i],Center(i-20,19,2,2),3,2);
  p := 'соответствуют следующей строке:  \<';
  DataComment('Примечание. Исходные данные '+Rule(5,length(s)),3,4);
  DataComment(p + s+'\>',3,5);
  ResultComment('Значения s_i, i=1,...,n:',0,2);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),3,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),4,2);
(*  NaiveS_(s);
  for i := 1 to 19 do
    ResultN('',S_[i],Center(i,19,2,2),1,2);
  for i := 20 to n do
    ResultN('',S_[i],Center(i-19,19,2,2),2,2);
*)
  SetTestCount(5);
end;


procedure BM_R_L_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L_[p0+1] > 0 then
          s := n-L_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BM_R_L1_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L1_[p0+1] > 0 then
          s := n-L1_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-R_[t[t0]]);
    end;
  end;
end;

procedure BM_Ri_L_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L_[p0+1] > 0 then
          s := n-L_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-Ri_[t[t0],p0]);
    end;
  end;
end;

procedure BM_Ri_L1_(p,t: string);
var p0,t0,k,n,m,s: integer;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  k := n;
  while k <= m do
  begin
    p0 := n;
    t0 := k;
    while (p0 > 0) and (p[p0]=t[t0]) do
    begin
      inc(cnt);
      dec(p0);
      dec(t0);
    end;
    if p0 = 0 then
    begin
      inc(nres);
      res[nres] := t0+1;
      k := k + n-S_[2];
    end
    else
    begin
      inc(cnt);
      if p0 = n then
        s := 1
      else
        if L1_[p0+1] > 0 then
          s := n-L1_[p0+1]
        else
          s := n-S_[p0+1];
      k := k + max(s, p0-Ri_[t[t0],p0]);
    end;
  end;
end;



procedure Matching53;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Также даны значения {R}_x({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\14, символы {x} перебираются в алфавитном порядке)', 0, 3);
  TaskText('и значения {L}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (см.~\10 и \8).', 0, 4);
  TaskText('Найти все вхождения {P} в {T}, используя вариант \Iметода Бойера\:Мура\i, совместно', 0, 5);
  TaskText('применяющий правило сдвига по плохому символу (см.~\12) и слабое', 0, 0);
  TaskText('правило сдвига по хорошему суффиксу (см.~\7). Для этого использовать', 0, 0);
  TaskText('схему алгоритма, применяющего слабое правило сдвига по хорошему суффиксу,', 0, 0);
  TaskText('дополнив его заключительное действие следующим образом: \(\X если {p}\,>\,0,', 0, 0);
  TaskText('т.\,е. вхождение {P} в {T} не обнаружено, то увеличить {k} на max\{{s}, {p}\,\-\,{R}_{T[t]}({P})\},', 0, 0);
  TaskText('где {s} \= величина сдвига, вычисленная по слабому правилу хорошего суффикса.\)', 0, 0);
  TaskText('Вывести начальные позиции всех найденных вхождений {P} в {T} (в порядке', 0, 0);
  TaskText('возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  BM_R_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, xLeft, 4, 1);
  DataComment('R_x(P):',40,4);
  for i := 1 to mm do
    DataN('',R_[chr(96+i)],Center(i,mm,2,1)+20,4,2);
  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);
  ResultComment('Вхождения:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений без применения правила плохого символа: '+s,0,4);
  cnt := 0;
  BadChar(p,t);
  Str(cnt,s);
  ResultComment('   Количество сравнений без применения слабого правила хорошего суффикса: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)

  SetTestCount(5);
end;

procedure Matching54;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Также даны значения {R}_x({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\15, символы {x} перебираются в алфавитном порядке)', 0, 3);
  TaskText('и значения {L''}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}| (см.~\10 и~\9).', 0, 4);
  TaskText('Найти все вхождения {P} в {T}, используя вариант \Iметода Бойера\:Мура\i, совместно', 0, 5);
  TaskText('применяющий правило сдвига по плохому символу (см.~\13) и сильное', 0, 0);
  TaskText('правило сдвига по хорошему суффиксу (см.~\7). Для этого использовать', 0, 0);
  TaskText('схему алгоритма, применяющего сильное правило сдвига по хорошему суффиксу,', 0, 0);
  TaskText('дополнив его заключительное действие следующим образом: \(\X если {p}\,>\,0,', 0, 0);
  TaskText('т.\,е. вхождение {P} в {T} не обнаружено, то увеличить {k} на max\{{s}, {p}\,\-\,{R}_{T[t]}({P})\},', 0, 0);
  TaskText('где {s} \= величина сдвига, вычисленная по сильному правилу хорошего суффикса.\)', 0, 0);
  TaskText('Вывести начальные позиции всех найденных вхождений {P} в {T} (в порядке', 0, 0);
  TaskText('возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  MainL1_(p);
  MainS_(p);
  cnt := 0;
  BM_R_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, xLeft, 4, 1);
  DataComment('R_x(P):',40,4);
  for i := 1 to mm do
    DataN('',R_[chr(96+i)],Center(i,mm,2,1)+20,4,2);
  DataComment('L''_i(P):',3,5);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);
  ResultComment('Вхождения:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix1(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений без применения правила плохого символа: '+s,0,4);
  cnt := 0;
  BadChar(p,t);
  Str(cnt,s);
  ResultComment('  Количество сравнений без применения сильного правила хорошего суффикса: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching55;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Также даны значения {R}_{x,i}({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\15, символы {x} перебираются в алфавитном порядке, для каждого {x}', 0, 3);
  TaskText('значение {i} меняется от 1 до |{P}|) и значения {L}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 4);
  TaskText('(см.~\12 и~\10). Найти все вхождения {P} в {T}, используя', 0, 5);
  TaskText('вариант \Iметода Бойера\:Мура\i, совместно применяющий расширенное правило сдвига', 0, 0);
  TaskText('по плохому символу (см.~\13) и слабое правило сдвига по хорошему', 0, 0);
  TaskText('суффиксу (см.~\9). Для этого использовать схему алгоритма,', 0, 0);
  TaskText('применяющего слабое правило сдвига по хорошему суффиксу, дополнив', 0, 0);
  TaskText('его заключительное действие следующим образом: \(\X если {p}\,>\,0,', 0, 0);
  TaskText('т.\,е. вхождение {P} в {T} не обнаружено, то увеличить {k} на max\{{s}, {p}\,\-\,{R}_{T[t],p}({P})\},', 0, 0);
  TaskText('где {s} \= величина сдвига, вычисленная по слабому правилу хорошего суффикса.\)', 0, 0);
  TaskText('Вывести начальные позиции всех найденных вхождений {P} в {T} (в порядке', 0, 0);
  TaskText('возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  MainL_(p);
  MainS_(p);
  cnt := 0;
  BM_Ri_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, 0, 4, 1);
  j := 4;
  for x := 'a' to chr(96+mm) do
  begin
  inc(j);
  DataComment('R_{\<'+x+'\>,i}(P):',3,j);
  for i := 1 to n do
    DataN('',Ri_[x,i],Center(i,n,2,1),j,2);
  end;
  DataComment('L_i(P):',3,j+1);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),j+1,2);
  DataComment('s_i(P):',3,j+2);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),j+2,2);
  ResultComment('Вхождения:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix(p,t);
  Str(cnt,s);
  ResultComment('Примечание. Количество сравнений без расширенного правила плохого символа: '+s,0,4);
  cnt := 0;
  BadChar1(p,t);
  Str(cnt,s);
  ResultComment('    Количество сравнений без применения слабого правила хорошего суффикса: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching56;
var
  i,j: integer;
  x: char;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Также даны значения {R}_{x,i}({P}) для {x} из \E', 0, 2);
  TaskText('(см.~\16, символы {x} перебираются в алфавитном порядке, для каждого {x}', 0, 3);
  TaskText('значение {i} меняется от 1 до |{P}|) и значения {L''}_i({P}) и {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|', 0, 4);
  TaskText('(см.~\12 и~\11). Найти все вхождения {P} в {T}, используя', 0, 5);
  TaskText('вариант \Iметода Бойера\:Мура\i, совместно применяющий расширенное правило сдвига', 0, 0);
  TaskText('по плохому символу (см.~\14) и сильное правило сдвига по хорошему', 0, 0);
  TaskText('суффиксу (см.~\9). Для этого использовать схему алгоритма,', 0, 0);
  TaskText('применяющего сильное правило сдвига по хорошему суффиксу, дополнив', 0, 0);
  TaskText('его заключительное действие следующим образом: \(\X если {p}\,>\,0,', 0, 0);
  TaskText('т.\,е. вхождение {P} в {T} не обнаружено, то увеличить {k} на max\{{s}, {p}\,\-\,{R}_{T[t],p}({P})\},', 0, 0);
  TaskText('где {s} \= величина сдвига, вычисленная по сильному правилу хорошего суффикса.\)', 0, 0);
  TaskText('Вывести начальные позиции всех найденных вхождений {P} в {T} (в порядке', 0, 0);
  TaskText('возрастания), а также количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  MainL1_(p);
  MainS_(p);
  cnt := 0;
  BM_Ri_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),3,2);
  DataS('T = ',t,3,3);
  DataN('m = ', mm, 0, 4, 1);
  j := 4;
  for x := 'a' to chr(96+mm) do
  begin
  inc(j);
  DataComment('R_{\<'+x+'\>,i}(P):',3,j);
  for i := 1 to n do
    DataN('',Ri_[x,i],Center(i,n,2,1),j,2);
  end;
  DataComment('L''_i(P):',3,j+1);
  for i := 1 to n do
    DataN('',L1_[i],Center(i,n,2,1),j+1,2);
  DataComment('s_i(P):',3,j+2);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),j+2,2);
  ResultComment('Вхождения:',0,1);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,3,2);
  cnt := 0;
//  Naive(p,t);
  GoodSuffix1(p,t);
  Str(cnt,s);
  ResultComment('Примечание. Количество сравнений без расширенного правила плохого символа: '+s,0,4);
  cnt := 0;
  BadChar1(p,t);
  Str(cnt,s);
  ResultComment('   Количество сравнений без применения сильного правила хорошего суффикса: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)


  SetTestCount(5);
end;

procedure Matching57;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Найти все вхождения {P} в {T}, используя вариант метода', 0, 2);
  TaskText('Бойера\:Мура, совместно применяющий правило сдвига по плохому символу', 0, 3);
  TaskText('и слабое правило сдвига по хорошему суффиксу (см.~\4).', 0, 4);
  TaskText('Для вычисления значений {L}_i({P}) и {s}_i({P}) использовать быстрый алгоритм', 0, 5);
  TaskText('препроцессинга, описанный в \8\:\5). Вывести начальные', 0, 0);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 0);
  TaskText('значения {R}_x({P}), перебирая {x} из \E в алфавитном порядке, и количество', 0, 0);
  TaskText('сравнений символов, потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении препроцессинга).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  cnt := 0;
  MainL_(p);
  MainS_(p);
  BM_R_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('Вхождения:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('R_x(P):',4,3);
  for i := 1 to mm do
    ResultN('',R_[chr(96+i)],Center(i,mm,2,2),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;



procedure Matching58;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Найти все вхождения {P} в {T}, используя вариант метода', 0, 2);
  TaskText('Бойера\:Мура, совместно применяющий правило сдвига по плохому символу', 0, 3);
  TaskText('и сильное правило сдвига по хорошему суффиксу (см.~\4).', 0, 4);
  TaskText('Для вычисления значений {L''}_i({P}) и {s}_i({P}) использовать быстрый алгоритм', 0, 5);
  TaskText('препроцессинга, описанный в \9, \8, \6). Вывести', 0, 0);
  TaskText('начальные позиции всех найденных вхождений {P} в {T} (в порядке возрастания),', 0, 0);
  TaskText('а также значения {s}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, и количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении препроцессинга).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcR_(p,mm);
  cnt := 0;
  MainL1_(p);
  MainS_(p);
  BM_R_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('Вхождения:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('s_i(P):',4,3);
  for i := 1 to n do
    ResultN('',S_[i],Center(i,n,2,1),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching59;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Найти все вхождения {P} в {T}, используя вариант метода', 0, 2);
  TaskText('Бойера\:Мура, совместно применяющий расширенное правило сдвига по плохому', 0, 3);
  TaskText('символу и слабое правило сдвига по хорошему суффиксу (см.~\4).', 0, 4);
  TaskText('Для вычисления значений {L}_i({P}) и {s}_i({P}) использовать быстрый алгоритм', 0, 5);
  TaskText('препроцессинга, описанный в \10\:\7). Вывести начальные', 0, 0);
  TaskText('позиции всех найденных вхождений {P} в {T} (в порядке возрастания), а также', 0, 0);
  TaskText('значения {L}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, и количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении препроцессинга).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  cnt := 0;
  MainL_(p);
  MainS_(p);
  BM_Ri_L_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('Вхождения:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('L_i(P):',4,3);
  for i := 1 to n do
    ResultN('',L_[i],Center(i,n,2,1),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

procedure Matching60;
var
  i: integer;
begin
  CreateTask(Subgroup11);
  TaskText('Даны строки {P}, {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Найти все вхождения {P} в {T}, используя вариант метода', 0, 2);
  TaskText('Бойера\:Мура, совместно применяющий расширенное правило сдвига по плохому', 0, 3);
  TaskText('символу и сильное правило сдвига по хорошему суффиксу (см.~\4).', 0, 4);
  TaskText('Для вычисления значений {L''}_i({P}) и {s}_i({P}) использовать быстрый алгоритм', 0, 5);
  TaskText('препроцессинга, описанный в \11, \10, \8). Вывести', 0, 0);
  TaskText('начальные позиции всех найденных вхождений {P} в {T} (в порядке возрастания),', 0, 0);
  TaskText('а также значения {L''}_i({P}), {i}\,=\,1,\,\.,\,|{P}|, и количество сравнений символов,', 0, 0);
  TaskText('потребовавшееся при выполнении алгоритма (в том числе', 0, 0);
  TaskText('и при проведении препроцессинга).', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  repeat
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  p := InvStr(p);
  t := InvStr(t);
  CalcRi_(p,mm);
  cnt := 0;
  MainL1_(p);
  MainS_(p);
  BM_Ri_L1_(p,t);
  until nres < 14;

  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ', mm, 0, 5, 1);
(*  DataComment('L_i(P):',3,5);
  for i := 1 to n do
    DataN('',L_[i],Center(i,n,2,1),5,2);
  DataComment('s_i(P):',3,6);
  for i := 1 to n do
    DataN('',S_[i],Center(i,n,2,1),6,2);*)
  ResultComment('Вхождения:',4,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),2,2);
//  ResultComment('Значения F_P(i), i=1,...,|P|+1:',0,2);
//  for i:= 1 to n+1 do
//    ResultN('',F_(i),Center(i,n+1,2,2),3,2);
  ResultComment('L''_i(P):',4,3);
  for i := 1 to n do
    ResultN('',L1_[i],Center(i,n,2,1),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,2);
  cnt := 0;
  Naive(p,t);
  Str(cnt,s);
  ResultComment(' Примечание. Количество сравнений при использовании наивного алгоритма: '+s,0,5);
(*  n := 0;
  if nres0 <> nres then
    Inc(n);
  for i := 1 to nres do
  begin
    ResultN('',res[i],Center(i,nres,2,2),3,2);
    if res[i] <> res0[i] then
      Inc(n);
  end;
  if n <> 0 then
    ResultN('',n,80,5,2);

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  SetTestCount(5);
end;

var U_: array['a'..'g'] of integer;

procedure CalcU_(s: string; m: integer);
var
  i,k: integer;
  x: char;
begin
  for x := 'a' to chr(96+m) do
    U_[x] := 0;
  k := 1;
  for i := length(s) downto 1 do
  begin
    U_[s[i]] := U_[s[i]]+k;
    k := k * 2;
  end;
end;

function Power(a,b: integer): integer;
var i: integer;
begin
  result := 1;
  for i := 1 to b do
    result := result * a;
end;

function RShift(v,p: integer): integer;
begin
  result := (v div 2) or (p div 2);
end;





procedure Matching61;
var
  i,j,j1,j2,k0,p2,q,k1: integer;
  v: array[1..50] of integer;
begin
  CreateTask(Subgroup12);
  TaskText('Даны строки {P}, {T} (|{P}|\,<\,32) и число {j} (0\,\l\,{j}\,\l\,|{T}|). Через {M}({P},\,{T}) обозначается', 0, 1);
  TaskText('\Iбитовая матрица\i размера |{P}|\,\x\,(|{T}|\,+\,1), элементы которой {M}_{i,j}({P},\,{T}), {i}\,=\,1,\,\.,\,|{P}|,', 0, 2);
  TaskText('{j}\,=\,0,\,\.,\,|{T}|, равны 1, если первые {i} символов {P} совпадают с {i} символами {T},', 0, 3);
  TaskText('кончающимися на позиции {j} (т.\,е. {P}[1..{i}]\,=\,{T}[{j}\-{i}+1..{j}]), и равны 0', 0, 4);
  TaskText('в противном случае. Через {M}_j({P},\,{T}) обозначается {j}-й столбец матрицы {M}({P},\,{T}).', 0, 5);
  TaskText('Для данных {P} и {T} сформировать столбец {M}_j({P},\,{T}) и получить его \Iчисловое\i', 0, 0);
  TaskText('\Iпредставление\i, т.\,е. представление в виде целого числа, двоичная запись', 0, 0);
  TaskText('которого (дополненная слева нулями до |{P}| разрядов) совпадает с элементами', 0, 0);
  TaskText('вектора {M}_j({P},\,{T}), перебираемыми в порядке возрастания индексов (например,', 0, 0);
  TaskText('вектор-столбцу (0,\,1,\,1)^T соответствует числовое представление 3). Вывести', 0, 0);
  TaskText('элементы столбца {M}_j({P},\,{T}) и соответствующее ему числовое представление.', 0, 0);
  TaskText('\P\SПримечание\s. Элементы матрицы {M}({P},\,{T}), равные 1 в строчке {i}, показывают все', 0, 0);
  TaskText('позиции в {T}, где заканчивается копия подстроки {P}[1..{i}], поэтому по \Iпоследней\i', 0, 0);
  TaskText('\Iстрочке\i матрицы {M} можно определить завершающие позиции \Iвсех вхождений\i {P} в {T}.', 0, 0);
  k1 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  k0 := Random(8);
  q := Rand(1,5);
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);
//  until (nres <20) and ((k0 = 0)and(nres=0) or ((k0=1)or(k0=2)) and (mm=1) or (k0 > 2) and (mm > 1) and (nres>=q));
  m := length(t);
  k0 := Rand(0,m);
  if (nres>0) and (k1>5) then
    k0 := res[rand(1,nres)]+n-1;
  CalcU_(p,mm);
  j1 := 0;
  p2 := Power(2,n);
  k := 0;
  for i := 1 to k0 do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    j1 := j2;
  end;
  j := 0;
  for i := 1 to n do
  begin
    v[i] := j1 mod 2;
    if v[i] = 1 then
      inc(j);
    j1 := j1 div 2;
  end;
  until ((k1=0) or (k1 > 0) and (j>0)) and (nres > 0);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('j = ',k0,0,5,1);
  ResultComment('Вектор-столбец M_j(P,T):',0,2);
  for i := 1 to n do
    ResultN('',v[n-i+1],Center(i,n,1,2),3,1);
  ResultN('Числовое представление: ',j2,0,4,6);
  SetTestCount(5);
end;


procedure Matching62;
var
  i,d,j: integer;
begin
  CreateTask(Subgroup12);
  TaskText('Дана строка {P} (|{P}|\,<\,32) и число {k} (\l\,|{P}|). Через {U}({x},\,{P}), где {x} \= некоторый', 0, 1);
  TaskText('символ, обозначается \Iбитовый вектор\i длины |{P}|, для которого {U}_i({x},\,{P})\,=\,1,', 0, 2);
  TaskText('если {P}[{i}]\,=\,{x}, и {U}_i({x},\,{P})\,=\,0 в противном случае. Для данной строки {P} найти', 0, 3);
  TaskText('вектор {U}({P}[{k}],\,{P}) и вывести его элементы, а также соответствующее ему числовое', 0, 4);
  TaskText('представление (определение числового представления дано в \1).', 0, 5);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  CalcU_(s,mm);
  k := Rand(1,n);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('k = ', k, 0, 4, 1);
  ResultComment('Вектор U(\<'+s[k]+'\>,P):',0,2);
  d := 0;
  for i := 1 to n do
  begin
    j := 0;
    if s[i]=s[k] then j := 1;
    d := d*2+j;
    ResultN('',j,Center(i,n,1,2),3,1);
  end;
  ResultN('Числовое представление: ',d,0,4,6);
//  ResultN('',u_[s[k]],0,5,6);
  SetTestCount(5);
end;




procedure Matching63;
var
  i: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('Дана строка {P} (|{P}|\,<\,32) и число {m} (<\,10); алфавит \E представляет собой', 0, 1);
  TaskText('{m} первых строчных латинских букв. Для каждого символа {x} из \E найти числовое', 0, 2);
  TaskText('представление вектора {U}({x},\,{P}) (см.~\1) и вывести эти представления,', 0, 3);
  TaskText('перебирая {x} в алфавитном порядке. Для хранения числовых представлений', 0, 4);
  TaskText('векторов использовать массив. Сформировать все числовые представления', 0, 5);
  TaskText('за однократный просмотр строки, вложенные циклы не использовать.', 0, 0);
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  n := rand(14, 19);
  s := CreateString(mm, n);
  if Random(2)=0 then
    for i := 1 to Random(8) do
      s := s[1] + s;
  s := Copy(s,1,n);
  for i := 1 to 10 do
    Ins(s, Copy(s,1,Rand(2,8)), Rand(9,n-5));
  CalcU_(s,mm);
  DataComment(Rule(4,length(s)),0,2);
  DataS('P = ',s,0,3);
  DataN('m = ', mm, 0, 4, 1);
  ResultComment('Числовые представления векторов U(x,P) для различных x из \E:',0,2);
//  ResultComment('x:',3,3);
//  ResultComment('Представление U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    ResultN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),3,6);
  end;
  SetTestCount(5);
end;


procedure Matching64;
var
  i,v,p2,vv,v1: integer;
begin
  CreateTask(Subgroup12);
  TaskText('Даны числа {v} и {p}; {p}\,=\,2^n для некоторого {n}\,>\,0, {v} является числовым представлением', 0, 1);
  TaskText('некоторого вектора {V} длины {n} (определение числового представления дано', 0, 2);
  TaskText('в \3). Через RShift({V}) обозначается вектор {V''}, полученный', 0, 3);
  TaskText('из вектора {V} сдвигом всех его элементов на 1 позицию в направлении увеличения', 0, 4);
  TaskText('индексов, причем первый элемент вектора {V''} полагается равным 1, а последний', 0, 5);
  TaskText('элемент вектора {V} теряется. Используя арифметические и побитовые операции', 0, 0);
  TaskText('над целыми числами и не применяя циклы, найти числовые представления', 0, 0);
  TaskText('векторов RShift({V}) и RShift(RShift({V})). Оформить вычисление числового', 0, 0);
  TaskText('представления RShift({V}) в виде вспомогательной функции с параметрами {v} и {p}.', 0, 0);
  n := Rand(10, 19);
  p2 := Power(2,n);
  v := Rand(0,p2*2-1);
  DataN('v = ',v,xLeft,3,6);
  DataN('p = ',p2,xRight,3,6);
(*  v1 := v;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1)-2,3,1);
    v1 := v1 div 2;
  end;
*)
  vv := RShift(v,p2);
//  ResultN('n = ',n,xLeft,1,2);
  ResultN('RShift(V) = ',vv,xLeft,3,6);
(*  v1 := vv;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1),4,1);
    v1 := v1 div 2;
  end;
*)
  vv := RShift(vv,p2);
  ResultN('RShift(RShift(V)) = ',vv,xRight,3,6);
(*  v1 := vv;
  for i := 1 to n do
  begin
    ResultN('',v1 mod 2,Center(i,n,1,1)+2,5,1);
    v1 := v1 div 2;
  end;
*)
  SetTestCount(5);
end;

procedure Matching65;
var
  i,j1,j2,j,p2,k0: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('Дана строка {T} и число {m} (<\,10); алфавит \E представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Также даны характеристики некоторой строки {P}:', 0, 2);
  TaskText('ее длина {n} и числовые представления векторов {U}({x},\,{P}) для всех {x} из \E ', 0, 3);
  TaskText('(см.~\3, символы {x} перебираются в алфавитном порядке). Найти', 0, 4);
  TaskText('столбцы матрицы {M}({P},\,{T}) (см.~\4), используя следующий алгоритм:', 0, 5);
  TaskText('\(\X столбец {M}_0 является нулевым;\| \X для любого {j}\,>\,0 столбец {M}_j вычисляется', 0, 0);
  TaskText('по формуле {M}_j\,=\,RShift({M}_{j\-1}) and {U}({T}[{j}],\,{P}) (операция RShift описана', 0, 0);
  TaskText('в~\1).\) Все вычисления проводить над числовыми представлениями', 0, 0);
  TaskText('векторов; при нахождении матрицы {M} хранить только два ее столбца:', 0, 0);
  TaskText('вычисляемый и найденный на предыдущем шаге. В процессе вычисления', 0, 0);
  TaskText('столбцов {M}_j, {j}\,=\,1,\,\.,\,|{T}|, выводить их числовые представления.', 0, 0);
  TaskText('\P\SПримечание\s. Формула отражает тот факт, что {i}-й элемент столбца {M}_j', 0, 0);
  TaskText('будет равен 1 тогда и только тогда, когда подстрока {P}[1..{i}\,\-\,1] совпадет', 0, 0);
  TaskText('с подстрокой {T} той же длины, оканчивающейся в позиции {j}\,\-\,1 (в этом случае', 0, 0);
  TaskText('{i}-й элемент вектора RShift({M}_{j\-1}) будет равен 1), и, кроме того,', 0, 0);
  TaskText('символ {P}[{i}] совпадет с {T}[{j}] (в этом случае {i}-й элемент вектора {U}({T}[{j}],\,{P})', 0, 0);
  TaskText('также будет равен~1).', 0, 0);
  k0 := Random(6);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);

  until (k0=1) and (mm=1) or (k0=0) and (nres=0) or (k0>1) and (mm>1) and (nres>k0-2);
  CalcU_(p,mm);
//  DataS('P = ',p,3,1);
  DataComment(Rule(4,length(t)),0,1);
  DataS('T = ',t,0,2);
  DataN('m = ',mm,10,3,1);
  DataN('n = ',n,23,3,1);
//  DataComment('Числовые представления векторов U(x,P):',39,3);
  DataComment('Числовые представления векторов U(x,P):',xRight,3);
//  ResultComment('x:',3,3);
//  ResultComment('Представление U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    DataN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;

(*
  DataComment('x:',3,3);
  DataComment('U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
    DataComment(x,Center(i,mm,6,1)+5,3);
    DataN('',U_[x],Center(i,mm,6,1),4,6);
  end;
*)
//  p1 := 'соответствуют следующей строке P:     \<';
  DataComment('Примечание. Исходные данные соответствуют строке P = \<'+p+'\>',3,5);
//  DataComment(p1 + p+'\>',3,7);
  m := length(t);
  if m < 41 then
    ResultComment('Числовые представления столбцов M_j(P,T), j=1,...,|T|:',0,1);
  j1 := 0;
  p2 := Power(2,n);
  case m of
  41..50: j := 1;
  21..40: j := 2;
  else j := 3;
  end;
  for i := 1 to m do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    ResultN('',j2,Center((i-1) mod 10 + 1, 10, 6, 1),(i-1) div 10+j,6);
    j1 := j2;
  end;
  SetTestCount(5);
end;

procedure Matching66;
var
  i,j,j1,j2,k0,p2,q: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('Даны строки {P}, {T} (|{P}|\,<\,32) и число {m} (<\,10); алфавит \E представляет собой', 0, 1);
  TaskText('{m} первых строчных латинских букв. Известно, что имеется хотя бы одно', 0, 2);
  TaskText('вхождение образца {P} в текст {T}. Найти все вхождения {P} в {T}, используя', 0, 3);
  TaskText('\Iбитовый метод поиска\i. Для этого сформировать векторы {U}({x},\,{P}) для всех {x} из \E', 0, 4);
  TaskText('(см.~\3), после чего организовать последовательное вычисление', 0, 5);
  TaskText('столбцов матрицы {M}({P},\,{T}) (см.~\1). Вхождения {P} в {T} определять,', 0, 0);
  TaskText('анализируя последние элементы столбцов {M}_j({P},\,{T}) (см. примечание к \5;', 0, 0);
  TaskText('для числовых представлений столбцов достаточно проанализировать их четность).', 0, 0);
  TaskText('Вывести начальные позиции всех найденных вхождений {P} в {T} (в порядке', 0, 0);
  TaskText('возрастания), а также числовые представления {U}({x},\,{P}), перебирая {x} из \E', 0, 0);
  TaskText('в алфавитном порядке, и числовое представление столбцов {M}_j({P},\,{T}),', 0, 0);
  TaskText('соответствующих конечным позициям {j} найденных вхождений (числовые', 0, 0);
  TaskText('представления всех этих столбцов будут одинаковыми).', 0, 0);
  k0 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 1;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  Naive(p,t);
  until (nres <=15) and (nres>0) and (((k0=0)or(k0=1)) and (mm=1) or (k0 > 1) and (mm > 1) and (nres>=q));
  CalcU_(p,mm);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('m = ',mm,0,5,1);
  m := length(t);
  j1 := 0;
  p2 := Power(2,n);
  k := 0;
  k0 := 0;
  q := 1;
  if nres <10 then q := 2;
  ResultComment('Вхождения:',0,1);
  for i := 1 to m do
  begin
    j2 := RShift(j1,p2) and U_[T[i]];
    if Odd(j2) then
    begin
      inc(k);
      k0 := j2;
      ResultN('',i-n+1,Center(k,nres,2,q),2,2);
    end;
    j1 := j2;
  end;
  ResultComment('Числовые представления векторов U(x,P) для различных x из \E:',0,3);
//  ResultComment('x:',3,3);
//  ResultComment('Представление U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    ResultN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;

  ResultN('Числовое представление M_j(P,T) для конечных позиций вхождений P в T: ',k0,0,5,6);
//  for i := 1 to nres do
//    ResultN('',res[i],Center(i,nres,2,2),5,2);

  SetTestCount(5);
end;


var M_: array[0..5,0..100] of integer;

// В книге (с.101) ошибка и недочет:
//ошибка: в последнем операнде не указана операция RShift - без нее все работает неверно!
//недочет: первый операнд не нужен; без него все и так работает (хотя он не мешает)
// Кроме того, в приведенной формуле не учтена особенность вычисления столбцов M^0
//(для которых отсутствуют "предыдущие" показатели степени)


procedure CalcM_(T: string; n,k: integer);
var q,j,m,p2: integer;
begin
  m := length(T);
  p2 := Power(2,n);
  for q := 0 to k do
    M_[q,0] := 0;
  for j := 1 to m do
  begin
    M_[0,j] := RShift(M_[0,j-1],p2) and U_[T[j]];
    for q := 1 to k do
      M_[q,j] := {M_[q-1,j] or} (RShift(M_[q,j-1],p2) and U_[T[j]]) or RShift(M_[q-1,j-1],p2);
  end;
end;

function Bin(k,n: integer): string;
var s: string;
    i: integer;
begin
  s := '';
  for i := 1 to n do
  begin
    s := chr(48+ k mod 2) + s;
    k := k div 2;
  end;
  result := s;
end;

procedure NaiveK(P,T: string; k: integer);
var n,m,i,j,k0: integer;
    s: string;
begin
  nres := 0;
  n := length(p);
  m := length(t);
  for i := 1 to m-n+1 do
  begin
    s := Copy(t,i,n);
    k0 := 0;
    for j := 1 to n do
      if s[j] <> p[j] then
        inc(k0);
    if k0 <= k then
    begin
      inc(nres);
      res[nres] := i;
    end;
  end;
end;



procedure Matching67;
var
  i,j,j1,j2,k0,p2,q,k1: integer;
  v: array[1..50] of integer;
begin
  CreateTask(Subgroup12);
  TaskText('Даны строки {P}, {T} (|{P}|\,<\,32) и числа {k} ({k}\,\l\,5) и {j} (0\,\l\,{j}\,\l\,|{T}|). Через {M}^k({P},\,{T}),', 0, 1);
  TaskText('{k}\,\g\,0, обозначается \Iбитовая матрица\i размера |{P}|\,\x\,(|{T}|+1), элементы которой', 0, 2);
  TaskText('{M}^k_{i,j}({P},\,{T}), {i}\,=\,1,\,\.,\,|{P}|, {j}\,=\,0,\,\.,\,|{T}|, равны 1, если не менее {i}\,\-\,{k} из первых', 0, 3);
  TaskText('{i} символов {P} совпадают с соответствующими символами из {i} символов {T},', 0, 4);
  TaskText('кончающихся на позиции {j} (т.\,е. {P}[1..{i}] отличается от {T}[{j}\,\-\,{i}\,+\,1..{j}] не более', 0, 5);
  TaskText('чем в {k} позициях). В противном случае {M}^k_{i,j}({P},\,{T})\,=\,0. Через {M}^k_j({P},\,{T})', 0, 0);
  TaskText('обозначается {j}-й столбец матрицы {M}^k({P},\,{T}). Для данных {P} и {T} сформировать', 0, 0);
  TaskText('столбец {M}^k_j и получить его числовое представление (определение числового', 0, 0);
  TaskText('представления приведено в \6). Вывести элементы столбца {M}^k_j', 0, 0);
  TaskText('и соответствующее ему числовое представление.', 0, 0);
  TaskText('\P\SПримечание\s. Единичные элементы строки матрицы {M}^k({P},\,{T}) с номером |{P}|', 0, 0);
  TaskText('соответствуют завершающим позициям всех \Iнеточных вхождений\i {P} в {T}', 0, 0);
  TaskText('с не более чем {k} несовпадающими символами (называемых также', 0, 0);
  TaskText('\Iвхождениями с не более чем {k} ошибками\i).', 0, 0);
  k1 := Random(8);
  q := Rand(1,5);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  k0 := Random(8);
  q := Rand(1,5);
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  k := Rand(1,5);
  NaiveK(p,t,k);
  until nres >0;
  m := length(t);
  if (nres>0) and (k1>5) then
    k0 := res[rand(1,nres)]+n-1;
  CalcU_(p,mm);
  CalcM_(t,n,k);
  k0 := Rand(0,m);
  if Random(3)>0 then
  begin
    k0 := res[Random(nres)+1]+n-1;
  end;
  j2 := M_[k,k0];
  j1 := j2;
  j := 0;
  for i := 1 to n do
  begin
    v[i] := j1 mod 2;
    if v[i] = 1 then
      inc(j);
    j1 := j1 div 2;
  end;
//  until ((k1=0) or (k1 > 0) and (j>0)) and (nres > 0);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ',k,xLeft,5,1);
  DataN('j = ',k0,xRight,5,1);
  ResultComment('Вектор-столбец M^k_j(P,T):',0,2);
  for i := 1 to n do
    ResultN('',v[n-i+1],Center(i,n,1,2),3,1);
  ResultN('Числовое представление: ',j2,0,4,6);
  SetTestCount(5);
end;



procedure Matching68;
var
  i,j,p2,k0: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('Дана строка {T} и числа {k} (\l\,5) и {m} (<\,10); алфавит \E представляет собой', 0, 1);
  TaskText('{m} первых строчных латинских букв. Также даны характеристики некоторой', 0, 2);
  TaskText('строки {P}: ее длина {n} и числовые представления векторов {U}({x},\,{P}) для всех {x} из \E', 0, 3);
  TaskText('(см.~\6, символы {x} перебираются в алфавитном порядке). Для данного {k}', 0, 4);
  TaskText('найти столбцы матрицы {M}^k({P},\,{T}) (см.~\1), используя следующий', 0, 5);
  TaskText('алгоритм: \(\X при фиксированном {j}\,=\,0,\,\.,\,|{T}| последовательно вычисляются {M}^q_j', 0, 0);
  TaskText('для {q}\,=\,0,\,\.,\,{k};\| \X для любого {q} столбец {M}^q_0 является нулевым;\| \X столбец {M}^0_j', 0, 0);
  TaskText('вычисляется по формуле {M}^0_j\,=\,RShift({M}^0_{j\-1}) and {U}({T}[{j}],\,{P}) (операция RShift', 0, 0);
  TaskText('описана в~\4);\| \X для {j}\,>\,0 столбец {M}^q_j вычисляется по формуле', 0, 0);
  TaskText('{M}^q_j\,=\,RShift({M}^{q\-1}_{j\-1}) or (RShift({M}^q_{j\-1}) and {U}({T}[{j}],\,{P})).\) Все вычисления', 0, 0);
  TaskText('проводить над числовыми представлениями векторов; при нахождении матриц {M}^q', 0, 0);
  TaskText('хранить только два набора их столбцов: вычисляемый {M}^q_j и найденный', 0, 0);
  TaskText('на предыдущем шаге {M}^q_{j\-1}. В процессе вычисления столбцов {M}^k_j, {j}\,=\,1,\,\.,\,|{T}|,', 0, 0);
  TaskText('выводить их числовые представления.', 0, 0);
  TaskText('\P\SПримечание\s. Формула для вычисления {M}^q_j при положительных {q} и {j} отражает тот', 0, 0);
  TaskText('факт, что {i} первых символов строки {P} и {i} символов строки {T}, оканчивающихся', 0, 0);
  TaskText('в позиции {j}, будут иметь не более {q} несовпадений в том и только том случае,', 0, 0);
  TaskText('если {i}\,\-\,1 первых символов строки {P} и {i}\,\-\,1 символов строки {T}, оканчивающихся', 0, 0);
  TaskText('в позиции {j}\,\-\,1, будут иметь не более {q}\,\-\,1 несовпадений (эту ситуацию проверяет', 0, 0);
  TaskText('операнд RShift({M}^{q\-1}_{j\-1}) либо {i}\,\-\,1 первых символов строки {P} и {i}\,\-\,1 символов', 0, 0);
  TaskText('строки {T}, оканчивающихся в позиции {j}\,\-\,1, будут иметь не более {q} несовпадений', 0, 0);
  TaskText('и при этом пара символов {P}[{i}] и {T}[{j}] будет совпадать (эту ситуацию', 0, 0);
  TaskText('проверяет операнд RShift({M}^q_{j\-1}) and {U}({T}[{j}],\,{P})).', 0, 0);
  k0 := Random(6);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcU_(p,mm);
  k := Rand(1,5);
  NaiveK(p,t,k);


  until (k0=0) and (nres=0) or (k0>0) and (mm>1) and (nres>k0-1);

(*
//  DataS('P = ',p,3,1);
//  DataComment(Rule(4,length(t)),3,1);
  DataS('T = ',t,3,1);
  DataN('k = ',k,xleft,2,1);
  DataN('m = ',mm,0,2,1);
  DataN('n = ',n,xRight,2,1);
//  DataComment('Числовые представления векторов U(x,P):',39,3);
  DataComment('x:',3,3);
  DataComment('U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
    DataComment(x,Center(i,mm,6,1)+5,3);
    DataN('',U_[x],Center(i,mm,6,1),4,6);
  end;
*)
  DataComment(Rule(4,length(t)),0,1);
  DataS('T = ',t,0,2);
  DataN('k = ',k,6,3,1);
  DataN('m = ',mm,17,3,1);
  DataN('n = ',n,28,3,1);
//  DataComment('Числовые представления векторов U(x,P):',39,3);
  DataComment('Числовые представления векторов U(x,P):',xRight,3);
//  ResultComment('x:',3,3);
//  ResultComment('Представление U(x,P):',3,4);
  for i := 1 to mm do
  begin
    x := chr(96+i);
//    ResultComment(x,Center(i,mm,6,1)+5,2);
    DataN('\<'+x+'\>:',U_[x],Center(i,mm,10,1),4,6);
  end;





//  p1 := 'соответствуют следующей строке P:     \<';
  DataComment('Примечание. Исходные данные соответствуют строке P = \<'+p+'\>',3,5);
//  DataComment(p1 + p+'\>',3,7);

  m := length(t);
  if m < 41 then
    ResultComment('Числовые представления столбцов M^k_j(P,T), j=1,...,|T|:',0,1);
  case m of
  41..50: j := 1;
  21..40: j := 2;
  else j := 3;
  end;
  CalcM_(t,n,k);
  for i := 1 to m do
  begin
    ResultN('',M_[k,i],Center((i-1) mod 10 + 1, 10, 6, 1),(i-1) div 10+j,6);
  end;

(*
  CalcM_(t,n,k);
  CalcM1_(t,n,k);
  i := 0;
  for j := 1 to m do
    if M_[k,j] <> M1_[k,j] then
    begin
      i := j;
      break;
    end;
  ResultN('',i,1,1,2);
  p2 := Power(2,n);
  if i > 0 then
  begin
     ResultS('',Bin(M_[k,i],n),xLeft,1);
//     ResultS('',Bin(M_[k-1,i],n),xLeft,2);
     ResultS('',Bin(RShift(M_[k,i-1],p2) and U_[T[i]],n),xLeft,3);
     ResultS('',Bin(M_[k-1,i-1],n),xLeft,4);
     ResultN('',M_[k,i],xLeft,5,6);
//      M1_[q,j] := M1_[q-1,j] or RShift(M1_[q,j-1],p2) and U_[T[j]] or M1_[q-1,j-1];
     ResultS('',Bin(M1_[k,i],n),xRight,1);
     ResultS('',Bin(M1_[k-1,i],n),xRight,2);
     ResultS('',Bin(RShift(M1_[k,i-1],p2) and U_[T[i]],n),xRight,3);
     ResultS('',Bin(M1_[k-1,i-1],n),xRight,4);
     ResultN('',M1_[k,i],xRight,5,6);
  end;
*)
  SetTestCount(5);
end;




procedure Matching69;
var
  i,j,p2,q: integer;
  x: char;
begin
  CreateTask(Subgroup12);
  TaskText('Даны строки {P}, {T} (|{P}|\,<\,32) и числа {k} (\l\,5) и {m} (<\,10); алфавит \E', 0, 1);
  TaskText('представляет собой {m} первых строчных латинских букв. Известно, что имеется', 0, 2);
  TaskText('хотя бы одно вхождение образца {P} в текст {T}, содержащее не более', 0, 3);
  TaskText('{k} несовпадений. Найти все такие вхождения {P} в {T}, используя \Iбитовый метод\i', 0, 4);
  TaskText('\Iнеточного поиска\i. Для этого сформировать векторы {U}({x},\,{P}) для всех {x} из \E', 0, 5);
  TaskText('(см.~\7), после чего организовать последовательное вычисление', 0, 0);
  TaskText('столбцов матрицы {M}^k({P},\,{T}) (см.~\1). Неточные вхождения {P} в {T}', 0, 0);
  TaskText('определять, анализируя последние элементы столбцов {M}^k_j (см. примечание', 0, 0);
  TaskText('к \2; для числовых представлений столбцов достаточно', 0, 0);
  TaskText('проанализировать их четность). Для каждого найденного неточного', 0, 0);
  TaskText('вхождения {P} в {T} выводить его начальную позицию и числовое представление {M}^k_j,', 0, 0);
  TaskText('где {j} \= номер конечной позиции данного вхождения. Вхождения перебирать', 0, 0);
  TaskText('в порядке возрастания их начальных позиций.', 0, 0);
  q := Rand(3,6);
  repeat
  i := Random(9);
  case i of
  0: mm := 2;
  1..2: mm := 2;
  3..4: mm := 3;
  else  mm := i-1;
  end;
(*  if mm = 1 then
  begin
    n := Rand(8,12);
    m := Rand(n+1,n+12);
    p := CreateString(mm, n);
    t := CreateString(mm, m);
  end
  else
*)
  begin
    s := CreateString(mm, rand(50, 59));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  end;
  CalcU_(p,mm);
  k := Rand(1,5);
  NaiveK(p,t,k);
  until (nres <16) and (nres>=q);
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('k = ',k,xleft,5,1);
  DataN(' m = ',mm,xRight,5,1);
  CalcM_(t,n,k);
(*
  ResultN('nres = ',nres,0,1,2);
  for i := 1 to min(nres,19) do
    ResultN('',res[i],Center(i,min(nres,19),2,2),1,2);
*)
  nres0 := 0;
  m := length(t);
  case nres of
  1..6: j := 3;
  7..9: j := 2;
  10..12: j := 2;
  13..15: j := 1;
  end;
  if j > 1 then
    ResultComment('Неточные вхождения (начальная позиция и числовое представление {M}^k_j):',0,1);

  for i := 1 to m do
  begin
    if Odd(M_[k,i]) then
    begin
      inc(nres0);
      ResultN2('',i-n+1,M_[k,i],Center((nres0-1)mod 3 + 1,3,16,4)-4,(nres0-1) div 3 + j,8);
    end;
  end;

(*
  i := 0;
  for j := 1 to m do
    if M_[k,j] <> M1_[k,j] then
    begin
      i := j;
      break;
    end;
  ResultN('',i,1,1,2);
  p2 := Power(2,n);
  if i > 0 then
  begin
     ResultS('',Bin(M_[k,i],n),xLeft,1);
//     ResultS('',Bin(M_[k-1,i],n),xLeft,2);
     ResultS('',Bin(RShift(M_[k,i-1],p2) and U_[T[i]],n),xLeft,3);
     ResultS('',Bin(M_[k-1,i-1],n),xLeft,4);
     ResultN('',M_[k,i],xLeft,5,6);
//      M1_[q,j] := M1_[q-1,j] or RShift(M1_[q,j-1],p2) and U_[T[j]] or M1_[q-1,j-1];
     ResultS('',Bin(M1_[k,i],n),xRight,1);
     ResultS('',Bin(M1_[k-1,i],n),xRight,2);
     ResultS('',Bin(RShift(M1_[k,i-1],p2) and U_[T[i]],n),xRight,3);
     ResultS('',Bin(M1_[k-1,i-1],n),xRight,4);
     ResultN('',M1_[k,i],xRight,5,6);

  end;
*)
  SetTestCount(5);
end;

var v_: array[1..100] of integer;
    c_init_: char;


function CreateStringD(m,n: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + chr(48+Random(m));
end;

function D_(c: char): integer;
begin
  result := ord(c)-ord(c_init_);
end;

function H_(s: string; m,q: integer): integer;
var i: integer;
begin
  result := D_(s[1]);
  for i := 2 to length(s) do
  begin
    v_[i-1] := result;
    if q = 0 then
      result := result*m + D_(s[i])
    else
      result := result*m mod q + D_(s[i])
  end;
  if q <> 0 then
    result := result mod q;
end;

// Замечание. В книге (с. 110) приведена не вполне корректная формула
// для рекуррентного пересчета H. А именно, при вычислениях по данной
// формуле возможно получение отрицательного результата.
// Для исправления достаточно перед последней операцией взятия остатка
// добавить к сумму число (m-1)*q (как в приведенной ниже функции),
// где m - мощность алфавита


function H1_(s: string; m,q,H,n,k,m_n_mod_q: integer): integer;
begin
  result := H*m-D_(S[k-1])*m_n_mod_q+D_(S[k+n-1]);
  if q > 0 then
    result := (result + (m-1)*q)mod q;
end;

function M_N_MOD_Q_(m,n,q: integer): integer;
var
  i: integer;
begin
  if q = 0 then
  begin
  result := m;
  for i := 2 to n do
    result := result * m;
  end
  else
  begin
  result := m mod q;
  for i := 2 to n do
    result := result * m mod q;
  end;
end;

function IsPrime(a: integer): boolean;
var b: integer;
begin
  result := false;
  if a mod 2 = 0 then exit;
  b := Round(sqrt(a));
  if b mod 2 = 0 then b := b - 1;
  while a mod b <> 0 do
    b := b - 2;
  result := b=1;
end;

function GetPrime(min,max: integer): integer;
begin
  repeat
    result := Rand(min,max);
  until isPrime(result);
end;


procedure Matching70;
var
  i: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {S}, состоящая из символов \<0\> и \<1\> (|{S}|\,<\,32). Через {H}({S})', 0, 1);
  TaskText('обозначается число, строковое представление которого в двоичной системе', 0, 2);
  TaskText('счисления совпадает со строкой {S}: {H}({S})\,=\,\E_{i=1}^{|S|}~2^{|S|\-i}\*{d}({S}[{i}]),', 0, 3);
  TaskText('где {d}(\<0\>)\,=\,0, {d}(\<1\>)\,=\,1. Найти {Н}({S}), используя \Iсхему Горнера\i:', 0, 4);
  TaskText('\[{H}({S})\,=\,(\.((({d}({S}[1])\*2\,+\,{d}({S}[2]))\*2\,+\,{d}({S}[3]))\*2\,+\,{d}({S}[4]))\.)\*2\,+\,{d}({S}[|{S}|]).\]', 0, 5);
  c_init_ := '0';
  mm := 2;
  s := CreateStringD(mm, rand(6, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  ResultN('H(S) = ',H_(s,2,0),0,3,10);
  SetTestCount(5);
end;

procedure Matching71;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {T}, состоящая из символов \<0\> и \<1\>, число {n} (<\,min\{|{T}|,\,31\})', 0, 1);
  TaskText('и значение {H}({T}[1..{n}]) (см.~\1). Найти и вывести значения {H}({T}^n_k),', 0, 2);
  TaskText('{k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1, где {T}^n_k\,=\,{T}[{k}..{k}\,+\,{n}\,\-\,1] \= подстрока строки {T}, имеющая длину {n}', 0, 3);
  TaskText('и начинающаяся в позиции {k}. Для вычисления {H}({T}^n_k) использовать', 0, 4);
  TaskText('рекуррентную формулу: {H}({T}^n_k)\,=\,{H}({T}^n_{k\-1})\*2\,\-\,{d}({T}[{k}\,\-\,1])\*2^n\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1]).', 0, 5);
  c_init_ := '0';
  mm := 2;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),2,0);
  DataN('n = ',n,xLeft,4,2);
  DataN('H(T[1..n]) = ',h0,xRight,4,4);
  ResultComment('Значения H(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(2,n,0);
  for i := 1 to 10 do
  begin
    h0 := H1_(s,2,0,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,2,0,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;

(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),2,0),Center(i,10,6,1),5,6);
  end;
*)
  SetTestCount(5);
end;

procedure Matching72;
var
  i,k0,hp,ht,j: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Даны строки {P} и {T}, состоящие из символов \<0\> и \<1\>, |{P}|\,<\,31.', 0, 1);
  TaskText('Найти все вхождения {P} в {T}, сравнивая значения {H}({P}) и {H}({T}^n_k), {k}\,=\,1,\,\.,\,|{T}|\,\-\,{n}\,+\,1,', 0, 2);
  TaskText('где {n}\,=\,|{P}| (определение {H}({S}) дано в \2, обозначение {T}^n_k и быстрый', 0, 3);
  TaskText('алгоритм вычисления {H}({T}^n_k) приведены в \1). Строка {P} входит в {T},', 0, 4);
  TaskText('начиная с позиции {k}, тогда и только тогда, когда {H}({P})\,=\,{H}({T}^n_k).', 0, 5);
  TaskText('Вывести {H}({P}), {H}({T}^n_1) и начальные позиции всех найденных вхождений {P} в {T}', 0, 0);
  TaskText('(в порядке возрастания), после чего дополнительно вывести {H}({T}^n_{|T|\-n+1}).', 0, 0);
  c_init_ := '0';
  mm := 2;
  k0 := Random(4);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
    Naive(p,t);
  until (nres < 16) and ((k0=0) or (k0>0) and (nres > k0-1));
(*
  ResultN('nres = ',nres,0,1,2);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
*)
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  j := M_N_MOD_Q_(2,n,0);
  hp := H_(p,2,0);
  ht := H_(Copy(t,1,n),2,0);
  ResultN('H(P) = ',hp,xLeft,2,6);
  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('Вхождения:',4,3);
  nres := 0;
  if hp=ht then
  begin
    inc(nres);
    res[nres] := 1;
  end;

  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,2,0,ht,n,i,j);
    if hp=ht then
    begin
      inc(nres);
      res[nres] := i;
    end;
  end;
  j := 1;
  if nres <10 then j := 2;

  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,j),3,2);
  ResultN('H(T^n_{|T|\-n+1}) = ',ht,0,4,6);



  SetTestCount(5);
end;



function GetQ_: integer;
begin
case Random(3) of
0: result := GetPrime(11,99);
1: result := GetPrime(101,997);
2: result := GetPrime(1001,9997);
//3: result := GetPrime(10001,99997);
end;
end;



procedure Matching73;
var
  i,j,h,k0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {S}, состоящая из символов \<0\> и \<1\>, и число {q}. Через {H}_q({S})', 0, 1);
  TaskText('обозначается число, равное {Н}({S}) mod {q}, где число {H}({S}) определено', 0, 2);
  TaskText('в \3, а \<mod\> обозначает операцию взятия остатка от деления нацело.', 0, 3);
  TaskText('Значение {H}_q({S}) лежит в диапазоне от 0 до {q}\,\-\,1 и называется \Iдактилограммой\i', 0, 4);
  TaskText('строки {S}. Найти {Н}_q({S}), используя вариант схемы Горнера, в котором', 0, 5);
  TaskText('ни один результат умножения не превосходит 2\*{q}: {H}_q({S})\,=\,((\.((({d}({S}[1])\*2', 0, 0);
  TaskText('mod {q}\,+\,{d}({S}[2]))\*2 mod {q}\,+\,{d}({S}[3]))\*2 mod {q}\,+\,{d}({S}[4]))\.)\*2 mod {q}\,+\,{d}({S}[|{S}|])) mod {q}.', 0, 0);
  TaskText('Вывести промежуточные результаты вычислений, полученные перед каждой', 0, 0);
  TaskText('операцией умножения на 2, а также найденное значение {H}_q({S}).', 0, 0);
  c_init_ := '0';
  mm := 2;
  qq := GetQ_;
  s := CreateStringD(mm, rand(12, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('q = ',qq,0,4,4);
  h := H_(s,2,qq);
  k0 := length(s)-1;
  if k0 > 20 then j := 1
  else
    j := 2;
  ResultComment('Промежуточные результаты вычислений:',0,j);
  k0 := length(s)-1;
  for i := 1 to k0 do
    ResultN('',v_[i],Center((i-1)mod 10 + 1,10,4,1),(i-1) div 10 + j+1,4);
  ResultN('H_q(S) = ',h,0,5,4);
  SetTestCount(5);
end;

procedure Matching74;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {T}, состоящая из символов \<0\> и \<1\>, числа {n} (<\,|{T}|) и {q}, а также', 0, 1);
  TaskText('значение {H}_q({T}[1..{n}]) (см.~\1). Найти и вывести значения {H}_q({T}^n_k),', 0, 2);
  TaskText('{k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1 (обозначение {T}^n_k описано в \3).', 0, 3);
  TaskText('Для вычисления {H}_q({T}^n_k) использовать рекуррентную формулу:', 0, 4);
  TaskText('{H}_q({T}^n_k)\,=\,({H}_q({T}^n_{k\-1})\*2\,\-\,{d}({T}[{k}\,\-\,1])\*(2^n mod {q})\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1])\,+\,{q}) mod {q}.', 0, 5);
  TaskText('Для вычисления 2^n mod {q} использовать схему, в которой промежуточные', 0, 0);
  TaskText('результаты не превосходят 2\*{q}: 2^n mod {q}\,=\,2\*(\.(2\*(2\*2 mod {q}) mod {q})\.) mod {q}.', 0, 0);
  c_init_ := '0';
  mm := 2;
  qq := GetQ_;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),2,qq);
  DataN('n = ',n,xLeft,4,2);
  DataN('q = ',qq,xRight,4,4);
  DataN('H_q(T[1..n]) = ',h0,0,5,4);
  ResultComment('Значения H_q(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(2,n,qq);
  for i := 1 to 10 do
  begin
    h0 := H1_(s,2,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,2,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;

(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),2,qq),Center(i,10,6,1),5,6);
  end;
*)
  SetTestCount(5);
end;

procedure Matching75;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('Даны строки {P} и {T}, состоящие из символов \<0\> и \<1\>, и число {q}. Найти', 0, 1);
  TaskText('все вхождения {P} в {T} используя \Iметод дактилограмм Карпа\:Рабина\i. Для этого', 0, 2);
  TaskText('найти и сравнить значения {H}_q({P}) и {H}_q({T}^n_k), {k}\,=\,1,\,\.,\,|{T}|\,\-\,{n}\,+\,1, где {n}\,=\,|{P}|', 0, 3);
  TaskText('(определение {H}_q({S}) дано в \2, обозначение {T}^n_k \= в \4,', 0, 4);
  TaskText('быстрый алгоритм вычисления {H}_q({T}^n_k) \= в \1). Если {H}_q({P})\,=\,{H}_q({T}^n_k),', 0, 5);
  TaskText('то строка {P}, \Iвозможно\i, входит в {T}, начиная с позиции {k}; в этом случае', 0, 0);
  TaskText('надо провести дополнительное сравнение символов в порядке слева направо', 0, 0);
  TaskText('до первого несовпадения символов (случай \Iложного совпадения\i) или до успешного', 0, 0);
  TaskText('подтверждения обнаруженного вхождения. Вывести начальные позиции всех', 0, 0);
  TaskText('найденных вхождений {P} в {T} (в порядке возрастания), после чего дополнительно', 0, 0);
  TaskText('вывести общее количество выполненных сравнений символов и количество', 0, 0);
  TaskText('выявленных ложных совпадений.', 0, 0);
  c_init_ := '0';
  mm := 2;
  k0 := Random(5);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(2,n,qq);
  hp := H_(p,2,qq);
  ht := H_(Copy(t,1,n),2,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,2,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,0,5,4);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('Вхождения:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  ResultN('Количество ложных совпадений: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)



  SetTestCount(5);
end;

procedure Matching76;
var
  i: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {S} (|{S}|\,<\,10) и число {m} (1\,<\,{m}\,<\,10); алфавит представляет собой', 0, 1);
  TaskText('{m} первых цифр (\<0\>, \<1\>, \<2\>,~\.). Через {H}^m({S}) обозначается число, строковое', 0, 2);
  TaskText('представление которого в {m}-ичной системе счисления совпадает со строкой {S}:', 0, 3);
  TaskText('{H}^m({S})\,=\,\E_{i=1}^{|S|}~{m}^{|S|-i}\*{d}({S}[{i}]), где {d}(\<0\>)\,=\,0, {d}(\<1\>)\,=\,1, {d}(\<2\>)\,=\,2,~\.~.', 0, 4);
  TaskText('Найти {Н}^m({S}), используя схему Горнера:', 0, 5);
  TaskText('\[{H}({S})\,=\,(\.((({d}({S}[1])\*{m}\,+\,{d}({S}[2]))\*{m}\,+\,{d}({S}[3]))\*{m}\,+\,{d}({S}[4]))\.)\*{m}\,+\,{d}({S}[|{S}|]).\]', 0, 0);
  c_init_ := '0';
  mm := Rand(2,9);
  s := CreateStringD(mm, rand(5, 9));
  n := length(s);
  DataComment(Rule(4,length(s)),32,2);
  DataS('S = ',s,32,3);
  DataN('m = ',mm,37,4,1);
  ResultN('H^m(S) = ',H_(s,mm,0),32,3,1);
  SetTestCount(5);
end;

procedure Matching77;
var
  i,j,h,k0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {S} и числа {q} и {m} (1\,<\,{m}\,\l\,10); алфавит представляет собой', 0, 1);
  TaskText('{m} первых цифр. Через {H}^m_q({S}) обозначается число, равное {Н}^m({S}) mod {q},', 0, 2);
  TaskText('где {H}^m({S}) определено в \1, а \<mod\> обозначает операцию взятия', 0, 3);
  TaskText('остатка от деления нацело. Найти {Н}^m_q({S}), используя вариант схемы Горнера,', 0, 4);
  TaskText('в котором ни один результат умножения не превосходит {m}\*({q}\,+\,{m}\,\-\,2):', 0, 5);
  TaskText('{H}^m_q({S})\,=\,((\.((({d}({S}[1])\*{m} mod {q}\,+\,{d}({S}[2]))\*{m} mod {q}\,+\,{d}({S}[3]))\*{m}', 0, 0);
  TaskText('mod {q}\,+\,{d}({S}[4]))\.)\*{m} mod {q}\,+\,{d}({S}[|{S}|])) mod {q}.', 0, 0);
  TaskText('Вывести промежуточные результаты вычислений, полученные перед каждой', 0, 0);
  TaskText('операцией умножения на {m}, а также найденное значение {H}^m_q({S}).', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  qq := GetQ_;
  s := CreateStringD(mm, rand(12, 31));
  n := length(s);
  DataComment(Rule(4,length(s)),0,2);
  DataS('S = ',s,0,3);
  DataN('q = ',qq,xLeft,4,4);
  DataN('m = ',mm,xRight,4,1);
  h := H_(s,mm,qq);
  k0 := length(s)-1;
  if k0 > 20 then j := 1
  else
    j := 2;
  ResultComment('Промежуточные результаты вычислений:',0,j);
  k0 := length(s)-1;
  for i := 1 to k0 do
    ResultN('',v_[i],Center((i-1)mod 10 + 1,10,4,1),(i-1) div 10 + j+1,4);
  ResultN('H^m_q(S) = ',h,0,5,4);
//  if h <> H_(s,mm,0) mod qq then
//  ResultN('',H_(s,mm,0) mod qq,90,1,1);
  SetTestCount(5);
end;

procedure Matching78;
var
  i,j,h0: integer;
begin
  CreateTask(Subgroup13);
  TaskText('Дана строка {T}, числа {n} (<\,|{T}|), {q} и {m} (1\,<\,{m}\,\l\,10); алфавит представляет собой', 0, 1);
  TaskText('{m} первых цифр. Кроме того, дано значение {H}^m_q({T}[1..{n}]) (см.~\1).', 0, 2);
  TaskText('Найти и вывести значения {H}^m_q({T}^n_k), {k}\,=\,2,\,\.,\,|{T}|\,\-\,{n}\,+\,1 (обозначение {T}^n_k определено', 0, 3);
  TaskText('в \7). Для вычисления {H}^m_q({T}^n_k) использовать рекуррентную формулу:', 0, 4);
  TaskText('{H}^m_q({T}^n_k)\,=\,({H}^m_q({T}^n_{k\-1})\*{m}\,\-\,{d}({T}[k\,\-\,1])\*({m}^n mod {q})\,+\,{d}({T}[{k}\,+\,{n}\,\-\,1])\,+\,({m}\,\-\,1)\*{q}) mod {q}.', 0, 5);
  TaskText('Для вычисления {m}^n mod {q} использовать схему, в которой промежуточные результаты', 0, 0);
  TaskText('не превосходят {m}\*{q}: {m}^n mod {q} = {m}\*(\.(({m}\*({m} mod {q}) mod {q}))\.) mod {q}.', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  qq := GetQ_;
  n := Rand(3,19);
  k := Rand(10,20);
  s := CreateStringD(mm, n+k);
  DataComment(Rule(4,length(s)),0,2);
  DataS('T = ',s,0,3);
  h0 := H_(Copy(s,1,n),mm,qq);
  DataN('n = ',n,xLeft,4,2);
  DataN('q = ',qq,xRight,4,4);
  DataN('m = ',m,xLeft,5,1);
  DataN('H^m_q(T[1..n]) = ',h0,xRight,5,4);
  ResultComment('Значения H^m_q(T^n_k), k=2,...,|T|-n+1:',0,2);
  j := M_N_MOD_Q_(mm,n,qq);
//  cnt := 0;
  for i := 1 to 10 do
  begin
    h0 := H1_(s,mm,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i,10,6,1),3,6);
//    if h0 <> H_(Copy(s,i+1,n),mm,qq) then
//      cnt := cnt + 1;
  end;
  for i := 11 to k do
  begin
    h0 := H1_(s,mm,qq,h0,n,i+1,j);
    ResultN('',h0,Center(i-10,10,6,1),4,6);
  end;
(*
  for i := 1 to 10 do
  begin
    ResultN('',H_(Copy(s,i+1,n),mm,qq),Center(i,10,6,1),5,6);
  end;
  if cnt <> 0 then
    ResultN('',1,90,1,1);
*)
  SetTestCount(5);
end;

procedure Matching79;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('Даны строки {P}, {T} и числа {q} и {m} (1\,<\,{m}\,\l\,10); алфавит представляет собой {m} первых', 0, 1);
  TaskText('цифр. Найти все вхождения {P} в {T} используя вариант \Iметода дактилограмм\i', 0, 2);
  TaskText('\IКарпа\:Рабина\i (см.~\4), в котором применяются дактилограммы {H}^m_q({S})', 0, 3);
  TaskText('(см.~\2\:\1). Вывести начальные позиции всех найденных', 0, 4);
  TaskText('вхождений {P} в {T} (в порядке возрастания), после чего дополнительно вывести', 0, 5);
  TaskText('общее количество сравнений символов и количество выявленных ложных совпадений.', 0, 0);
  c_init_ := '0';
  mm := Rand(2,10);
  k0 := Random(5);
  repeat
    s := CreateStringD(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(mm,n,qq);
  hp := H_(p,mm,qq);
  ht := H_(Copy(t,1,n),mm,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,mm,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,xLeft,5,4);
  DataN('m = ',mm,xRight,5,1);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('Вхождения:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  ResultN('Количество ложных совпадений: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)



  SetTestCount(5);
end;

procedure Matching80;
var
  i,j,k0,hp,ht,cnt0: integer;
procedure check(i: integer);
var j: integer;
begin
  for j := 1 to length(p) do
  begin
    inc(cnt);
    if p[j] <> t[i+j-1] then
    begin
      inc(cnt0);
      exit;
    end;
  end;
  inc(nres0);
  res0[nres0] := i;
end;
begin
  CreateTask(Subgroup13);
  TaskText('Даны строки {P}, {T} и числа {q} и {m} (1\,<\,{m}\,\l\,26); алфавит представляет собой {m} первых', 0, 1);
  TaskText('строчных латинских букв. Найти все вхождения {P} в {T} используя вариант', 0, 2);
  TaskText('\Iметода дактилограмм Карпа\:Рабина\i (см.~\5), в котором применяются', 0, 3);
  TaskText('дактилограммы {H}^m_q({S}) (см.~\3\:\2), причем {d}(\<a\>)\,=\,0, {d}(\<b\>)\,=\,1,', 0, 4);
  TaskText('{d}(\<c\>)\,=\,2, \., {d}(\<k\>)\,=\,10, \.~. Вывести начальные позиции всех найденных', 0, 5);
  TaskText('вхождений {P} в {T} (в порядке возрастания), после чего дополнительно вывести', 0, 0);
  TaskText('общее количество сравнений символов и количество выявленных ложных совпадений.', 0, 0);
  c_init_ := 'a';
  mm := Rand(10,26);
  k0 := Random(5);
  repeat
    s := CreateString(mm, rand(70, 79));
    if Random(2)=0 then
      for i := 2 to Random(10) do
        s[i] := s[1];
    n := length(s);
    for i := 1 to 10 do
      Ins(s, Copy(s,1,Rand(5,25)), Rand(11,n-25));
    n := Rand(10,18);
    p := copy(s,1,n);
    t := copy(s,n+1, 100);
    n := length(p);
  qq := GetQ_;
  nres0 := 0;
  j := M_N_MOD_Q_(mm,n,qq);
  hp := H_(p,mm,qq);
  ht := H_(Copy(t,1,n),mm,qq);
  cnt := 0;
  cnt0 := 0;
  if hp=ht then
    check(1);
  for i := 2 to length(t)-n+1 do
  begin
    ht := H1_(t,mm,qq,ht,n,i,j);
    if hp=ht then
      check(i);
  end;
  until (nres0 < 16) and ((k0=0) or (k0=1) and (nres0 > 2) or (k0>=2) and (cnt0>0));
  DataS('P = ',p,3,2);
  DataComment(Rule(4,length(t)),3,3);
  DataS('T = ',t,3,4);
  DataN('q = ',qq,xLeft,5,4);
  DataN('m = ',mm,xRight,5,2);
//  ResultN('H(P) = ',hp,xLeft,2,6);
//  ResultN('H(T^n_1) = ',ht,xRight,2,6);
  ResultComment('Вхождения:',0,2);
  j := 1;
  if nres0 <10 then j := 2;

  for i := 1 to nres0 do
    ResultN('',res0[i],Center(i,nres0,2,j),3,2);
  ResultN('Количество сравнений: ',cnt,0,4,3);
  ResultN('Количество ложных совпадений: ',cnt0,0,5,2);



(*
//  ResultN('nres = ',nres,0,1,2);
  ResultN('',k0,1,1,1);
  Naive(p,t);
  for i := 1 to nres do
    ResultN('',res[i],Center(i,nres,2,2),1,2);
//if nres0 <> nres then
//  ResultN('',1,90,1,1);
*)

  SetTestCount(5);
end;


procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Matching1;
  2: Matching2;
  3: Matching3;
  4: Matching4;
  5: Matching5;
  6: Matching6;
  7: Matching7;
  8: Matching8;
  9: Matching9;
  10: Matching10;
  11: Matching11;
  12: Matching12;
  13: Matching13;
  14: Matching14;
  15: Matching15;
  16: Matching16;
  17: Matching17;
  18: Matching18;
  19: Matching19;
  20: Matching20;
  21: Matching21;
  22: Matching22;
  23: Matching23;
  24: Matching24;
  25: Matching25;
  26: Matching26;
  27: Matching27;
  28: Matching28;
  29: Matching29;
  30: Matching30;
  31: Matching31;
  32: Matching32;
  33: Matching33;
  34: Matching34;
  35: Matching35;
  36: Matching36;
  37: Matching37;
  38: Matching38;
  39: Matching39;
  40: Matching40;
  41: Matching41;
  42: Matching42;
  43: Matching43;
  44: Matching44;
  45: Matching45;
  46: Matching46;
  47: Matching47;
  48: Matching48;
  49: Matching49;
  50: Matching50;
  51: Matching51;
  52: Matching52;
  53: Matching53;
  54: Matching54;
  55: Matching55;
  56: Matching56;
  57: Matching57;
  58: Matching58;
  59: Matching59;
  60: Matching60;
  61: Matching61;
  62: Matching62;
  63: Matching63;
  64: Matching64;
  65: Matching65;
  66: Matching66;
  67: Matching67;
  68: Matching68;
  69: Matching69;
  70: Matching70;
  71: Matching71;
  72: Matching72;
  73: Matching73;
  74: Matching74;
  75: Matching75;
  76: Matching76;
  77: Matching77;
  78: Matching78;
  79: Matching79;
  80: Matching80;

  end;
end;


procedure inittaskgroup;
begin
  CreateGroup('Match', 'Поиск подстрок',
    'М. Э. Абрамян, 2012', 'sdfghsdssfggddhkhhuytgrgfmm', 80, InitTask);
  CommentText('\PВсе исходные числовые данные в заданиях являются целыми и неотрицательными.');
  CommentText('Если числовые данные могут принимать нулевые значения, то об этом явно');
  CommentText('говорится в формулировке задания.');
  CommentText('\PВсе исходные строковые данные являются непустыми. Позиции символов в');
  CommentText('строках нумеруются от 1. Длина строки {S} обозначается через |{S}|; длина исходных строк в заданиях не превосходит 100.');
  CommentText('Через {S}[{i}..{j}] обозначается \Iподстрока\i {S}, начинающаяся в позиции {i} и');
  CommentText('оканчивающаяся в позиции {j} (если {i}\,>\,{j}, то {S}[{i}..{j}] считается пустой строкой).');
  CommentText('Через {S}[{i}], {i}\,=\,1,\,\.,\,|{S}|, обозначается \Iсимвол\i строки {S}, расположенный в позиции {i}.');
  CommentText('\PПри поиске всех вхождений строки-\Iобразца\i {P} (англ. pattern) в текст {T}');
  CommentText('учитываются \Iперекрывающиеся\i вхождения. Например, для образца {P}\,=\,\<aaa\>');
  CommentText('и текста {T}\,=\,\<aaaaaa\> количество различных вхождений равно 4');
  CommentText('(начиная с позиций 1,~2, 3,~4 текста {T}). Всегда предполагается, что длина');
  CommentText('образца {P} не превосходит длины текста {T}.');
  CommentText('\PПод \Iалфавитом\i \E понимается множество символов, в которое входят');
  CommentText('все символы рассматриваемых строк. Если алфавит \E в задании не уточняется,');
  CommentText('то предполагается, что строка может содержать любые символы, отличные от управляющих.');
  CommentText('\PПри подсчете сравнений символов предполагается, что логические операции выполняются');
  CommentText('по \Iсокращенной схеме\i (например, при вычислении выражения ({i}\,<\,|{P}|) and ({P}[{i}]\,=\,{x})');
  CommentText('сравнение символов {P}[{i}] и {x} будет проводиться только в случае, если условие {i}\,<\,|{P}| окажется истинным).');
  CommentText('\PОписания алгоритмов приводятся по книге Д.~Гасфилда \<Строки, деревья и последовательности в алгоритмах:');
  CommentText('Информатика и вычислительная биология\> (СПб.: БХВ-Петербург, 2003), часть~I.');
  Subgroup(Subgroup1);
  CommentText('\PВ данной подгруппе заданий вводятся необходимые понятия, связанные с поиском в строке (\Iподстрока\i, \Iпрефикс\i, \Iсуффикс\i),');
  CommentText('и описываются простейшие алгоритмы поиска (так называемые \Iнаивные алгоритмы\i).');
  Subgroup(Subgroup2);
  CommentText('\PВ данной подгруппе рассматривается один из вариантов предварительной обработки (\Iпрепроцессинга\i) строки.');
  CommentText('Вводятся понятия, связанные с препроцессингом ({Z}-блоки и строковые характеристики {Z}_i, {r}_i, {l}_i),');
  CommentText('и описывается быстрый алгоритм препроцессинга, при котором для обработки строки {S} требуется число сравнений символов, не превосходящее 2|{S}|.');
  CommentText('\PРассмотренный вариант препроцессинга используется при описании многих алгоритмов поиска,');
  CommentText('поэтому он называется \Iосновным препроцессингом\i.');
  Subgroup(Subgroup4);
  CommentText('\PВ подгруппе описываются алгоритмы поиска подстрок, использующие рассмотренный ранее основной препроцессинг.');
  CommentText('Данные алгоритмы позволяют выполнить поиск \Iза линейное время\i.');
  CommentText('Это означает, что для нахождения всех вхождений');
  CommentText('образца {P} длины {n} в текст {T} длины {m} требуется число сравнений символов,');
  CommentText('имеющее порядок {n}\,+\,{m}. Следует заметить, что наивный алгоритм');
  CommentText('не обеспечивает поиск за линейное время, так как при его реализации');
  CommentText('может потребоваться количество сравнений, имеющее порядок {n}\*{m}.');
  CommentText('\PВ заданиях данной подгруппы \Iоперация сцепления строк\i обозначается символом \<+\>.');
  CommentText('При сцеплении строк сохраняется порядок их следования (например, результатом операции \<ab\>\,+\,\<cd\> является строка \<abcd\>).');
  Subgroup(Subgroup5);
  CommentText('\PВ данной подгруппе описывается \Iметод Кнута\:Морриса\:Пратта\i (\Iметод КМП\i) и связанные с ним понятия.');
  CommentText('Метод КМП является одним из наиболее известных быстрых алгоритмов поиска подстрок.');
  Subgroup(Subgroup6);
  CommentText('\PВ данной подгруппе описываются два варианта быстрого препроцессинга образца {P} для метода Кнута\:Морриса\:Пратта (метода КМП).');
  CommentText('Первый вариант использует понятия основного препроцессинга ({Z}-блоки),');
  CommentText('второй является \Iклассическим препроцессингом метода КМП\i, использующим алгоритм \Iрекурсивного спуска\i.');
  Subgroup(Subgroup7);
  CommentText('\PМетод поиска образца {P} в тексте {T} называется \Iметодом реального времени\i, если время');
  CommentText('проверки любой позиции в {T} не зависит от размера и свойств {P}. В частности, метод Кнута\:Морриса\:Пратта');
  CommentText('(как исходный, так и модифицированный) \Iне является\i методом реального времени, так как при несовпадении');
  CommentText('символов {T}[{t}] и {P}[{p}] может потребоваться сравнение того же символа {T}[{t}]');
  CommentText('с несколькими другими символами образца {P}. В данной подгруппе заданий описывается вариант метода реального времени');
  CommentText('(этот метод называется также \Iметодом, основанным на использовании конечного автомата\i), в котором');
  CommentText('для каждой позиции текста {T} выполняется \Iединственная\i проверка.');
//  Subgroup(Subgroup10);
//  CommentText('\PВ данной подгруппе описывается алгоритм быстрого препроцессинга для правила сдвига по хорошему суффиксу,');
//  CommentText('использующий понятия основного препроцессинга ({Z}-блоки).');
  Subgroup(Subgroup11);
  CommentText('\P\IМетод Бойера\:Мура\i представляет собой комбинацию правил сдвига по плохому символу и');
  CommentText('сдвига по хорошему суффиксу и является, наряду с методом Кнута\:Морриса\:Пратта, одним из наиболее известных');
  CommentText('быстрых алгоритмов поиска подстрок. Особенностью данного метода является то, что при его');
  CommentText('применении для поиска вхождений {P} в {T} обычно проверяется менее, чем |{P}|\,+\,|{T}| символов');
  CommentText('(так называемый \Iпоиск за сублинейное время\i).');
  Subgroup(Subgroup12);
  CommentText('\PВ данной подгруппе заданий рассматривается \Iбитовый метод поиска\i (\Iметод Shift-And\i) \= один из \Iполучисленных методов поиска\i,');
  CommentText('основанный не на сравнении символов, а на битовых и арифметических операциях.');
  CommentText('Рассматривается также его модификация, позволяющая выполнять \Iпоиск неточных вхождений\i.');
  Subgroup(Subgroup13);
  CommentText('\PВ данной подгруппе рассматривается еще один из получисленных алгоритмов поиска: \Iметод дактилограмм Карпа\:Рабина\i.');
  CommentText('Хотя данный метод допускает так называемые \Iложные совпадения\i, доказано, что при надлежащем выборе числа {q},');
  CommentText('используемого в методе, вероятность появления ложных совпадений можно сделать достаточно малой.');

end;

//exports inittaskgroup, activate;

begin
end.
