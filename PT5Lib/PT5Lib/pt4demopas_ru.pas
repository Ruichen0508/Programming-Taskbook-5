unit PT4DemoPas_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker;

//-----------------------------------

procedure MakerDemo3;
var
  a, b: real;
begin
  CreateTask('Ввод и вывод данных, оператор присваивания');
  TaskText('Даны стороны прямоугольника~{a} и~{b}.', 0, 2);
  TaskText('Найти его площадь {S}~=~{a}\*{b} и периметр {P}~=~2\*({a}\;+\;{b}).', 0, 4);
  a := RandomN(1, 99) / 10;
  b := RandomN(1, 99) / 10;
  DataR('a = ', a, xLeft, 3, 4);
  DataR('b = ', b, xRight, 3, 4);
  ResultR('S = ', a * b, 0, 2, 4);
  ResultR('P = ', 2 * (a + b), 0, 4, 4);
  SetTestCount(3);
end;

procedure MakerDemo4;
var
  m, n, i, j, k: integer;
  a: array [1..5, 1..8] of real;
begin
  CreateTask('Двумерные массивы (матрицы): вывод элементов');
  TaskText('Дана матрица размера~{M}\;\x\;{N} и целое число~{K} (1~\l~{K}~\l~{M}).', 0, 2);
  TaskText('Вывести элементы {K}-й строки данной матрицы.', 0, 4);
  m := RandomN(2, 5);
  n := RandomN(4, 8);
  k := 1;
  if m = 5 then k := 0;
  DataN('M = ', m, 3, 1, 1);
  DataN('N = ', n, 10, 1, 1);
  for i := 1 to m do
    for j := 1 to n do
    begin
      a[i, j] := RandomR(-9.99, 9.99);
      DataR(a[i,j], Center(j, n, 5, 1), i + k, 5);
    end;
  k := RandomN(1, m);
  DataN('K = ', k, 68, 5, 1);
  for j := 1 to n do
    ResultR(a[k, j], Center(j, n, 5, 1), 3, 5);
  SetTestCount(5);
end;

procedure MakerDemo5;
var
  s: string;
begin
  CreateTask('Символы и строки: основные операции');
  TaskText('Дана непустая строка~{S}.', 0, 2);
  TaskText('Вывести ее первый и последний символ.', 0, 4);
  s := EnWordSample(RandomN(0, EnWordCount-1));
  if CurrentTest = 3 then
    while s[1] = s[Length(s)] do
      s := EnWordSample(RandomN(0, EnWordCount-1));
  DataS('S = ', s, 0, 3);
  ResultC('Первый символ: ', s[1], xLeft, 3);
  ResultC('Последний символ: ', s[Length(s)], xRight, 3);
  SetTestCount(4);
end;

function FileName(Len: integer): string;
const
  c = '0123456789abcdefghijklmnopqrstuvwxyz';
var
  i: integer;
begin
  result := '';
  for i := 1 to Len do
    result := result + c[RandomN(1, Length(c))];
end;

procedure MakerDemo6;
var
  k, i, j, jmax: integer;
  s1, s2, s3: string;
  fs1: file of ShortString;
  fs2: file of ShortString;
  fc3: file of char;
  s: ShortString;
  c: char;
begin
  CreateTask('Символьные и строковые файлы');
  TaskText(
  'Дано целое число~{K} (>\,0) и строковый файл.'#13 +
  'Создать два новых файла: строковый, содержащий первые {K}~символов'#13 +
  'каждой строки исходного файла, и символьный, содержащий {K}-й символ'#13 +
  'каждой строки (если длина строки меньше~{K}, то в строковый файл'#13 + 
  'записывается вся строка, а в символьный файл записывается пробел).'
  );
  s1 := '1' + FileName(5) + '.tst';
  s2 := '2' + FileName(5) + '.tst';
  s3 := '3' + FileName(5) + '.tst';
  Assign(fs1, s1);
  Rewrite(fs1);
  Assign(fs2, s2);
  Rewrite(fs2);
  Assign(fc3, s3);
  Rewrite(fc3);
  k := RandomN(2, 11);
  jmax := 0;
  for i := 1 to RandomN(10, 20) do
  begin
    j := RandomN(2, 16);
    if jmax < j then
      jmax := j;
    s := FileName(j);
    write(fs1, s);
    if j >= k then
      c := s[k]
    else
      c := ' ';
    write(fc3, c);
    s := copy(s, 1, k);
    write(fs2,s);
  end;
  Close(fs1);
  Close(fs2);
  Close(fc3);
  DataN('K = ', k, 0, 1, 1);
  DataS('Имя исходного файла: ', s1, 3, 2);
  DataS('Имя результирующего строкового файла:  ', s2, 3, 4);
  DataS('Имя результирующего символьного файла: ', s3, 3, 5);
  DataComment('Содержимое исходного файла:', xRight, 2);
  DataFileS(s1, 3, jmax + 3);
  ResultComment('Содержимое результирующего строкового файла:', 0, 2);
  ResultComment('Содержимое результирующего символьного файла:', 0, 4);
  ResultFileS(s2, 3, k + 3);
  ResultFileC(s3, 5, 4);
end;

procedure MakerDemo7;
var
  p: integer;
  s, s1, s2, s0: string;
  t1, t2: text;
begin
  CreateTask('Текстовые файлы: основные операции');
  TaskText('Дан текстовый файл.', 0, 2);
  TaskText('Удалить из него все пустые строки.', 0, 4);
  s1 := FileName(6) + '.tst';
  s2 := '#' + FileName(6) + '.tst';
  s := EnTextSample(RandomN(0, EnTextCount-1));
  Assign(t2, s2);
  Rewrite(t2);
  Assign(t1, s1);
  Rewrite(t1);
  writeln(t2, s);
  Close(t2);
  s0 := #13#10#13#10;
  p := Pos(s0, s);
  while p <> 0 do
  begin
    Delete(s, p, 2);
    p := Pos(s0, s);
  end;
  writeln(t1, s);
  Close(t1);
  ResultFileT(s1, 1, 5);
  Rename(t2, s1);
  DataFileT(s1, 2, 5);
  DataS('Имя файла: ', s1, 0, 1);
  SetTestCount(3);
end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1..2: UseTask('Begin', num);
  3: MakerDemo3;
  4: MakerDemo4;
  5: MakerDemo5;
  6: MakerDemo6;
  7: MakerDemo7;
  end;
end;

procedure inittaskgroup;
var
  n: integer;
begin
  n := 7;
  CreateGroup('DemoPas', 'Примеры различных задач (конструктор для языка Pascal)',
    'М. Э. Абрамян, 2014', 'qwqfsdf13dfttd', n, InitTask);
end;


begin
end.
