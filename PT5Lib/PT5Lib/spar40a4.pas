{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SPar40A4;

{$MODE Delphi}

interface

procedure SPar40An1(Name, Key: string);
procedure SPar40An2(Name, Key: string);
procedure SPar40An3(Name, Key: string);
procedure SPar40An4(Name, Key: string);
procedure SPar40An5(Name, Key: string);
procedure SPar40An6(Name, Key: string);
procedure SPar40An7(Name, Key: string);
procedure SPar40An8(Name, Key: string);
procedure SPar40An9(Name, Key: string);
procedure SPar40An10(Name, Key: string);
procedure SPar40An11(Name, Key: string);
procedure SPar40An12(Name, Key: string);
procedure SPar40An13(Name, Key: string);
procedure SPar40An14(Name, Key: string);
procedure SPar40An15(Name, Key: string);
procedure SPar40An16(Name, Key: string);
procedure SPar40An17(Name, Key: string);
procedure SPar40An18(Name, Key: string);
procedure SPar40An19(Name, Key: string);
procedure SPar40An20(Name, Key: string);
procedure SPar40An21(Name, Key: string);
procedure SPar40An22(Name, Key: string);
procedure SPar40An23(Name, Key: string);
procedure SPar40An24(Name, Key: string);
procedure SPar40An25(Name, Key: string);
procedure SPar40An26(Name, Key: string);
procedure SPar40An27(Name, Key: string);
procedure SPar40An28(Name, Key: string);
procedure SPar40An29(Name, Key: string);
procedure SPar40An30(Name, Key: string);
procedure SPar40An31(Name, Key: string);
procedure SPar40An32(Name, Key: string);
procedure SPar40An33(Name, Key: string);
procedure SPar40An34(Name, Key: string);
procedure SPar40An35(Name, Key: string);
procedure SPar40An36(Name, Key: string);
procedure SPar40An37(Name, Key: string);
procedure SPar40An38(Name, Key: string);
procedure SPar40An39(Name, Key: string);
procedure SPar40An40(Name, Key: string);

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
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
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
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
k := length(c0);
for i:=1 to N do
  s := s + c0[Random(k)+1];
stroka1 := s;
end;
function stroka_(N : integer) : string;
const c : string = '(){}[]0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
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





procedure SPar40An1(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic2,Author,Key,73{level2});(*DEMO*)
getVariant(4,0,0,0,code,code1,code2);
     s0 := '';
taskText('Описать функцию MinElem({A},\;{N}) целого типа, находящую',0,2);
taskText('минимальный элемент целочисленного массива~{A} размера~{N}.',0,3);
taskText('С\ помощью этой функции найти минимальные элементы массивов~{A}, {B},~{C}',  0,4);
taskText('размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
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
procedure SPar40An2(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(5,0,0,0,code,code1,code2);
taskText('Описать функцию MaxNum({A},\;{N}) целого типа, находящую',0,2);
taskText('номер максимального элемента вещественного массива~{A} размера~{N}.',0,3);
taskText('С\ помощью этой функции найти номера максимальных элементов массивов~{A}, {B},~{C}',  0,4);
taskText('размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
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
procedure SPar40An3(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру MinmaxNum({A},\;{N},\;{NMin},\;{NMax}), находящую номера минимального',0,1);
taskText('и\ максимального элемента вещественного массива~{A} размера~{N}. Выходные',0,2);
taskText('параметры целого типа: {NMin} (номер минимального элемента) и~{NMax} (номер',0,3);
taskText('максимального элемента). С\ помощью этой процедуры найти номера минимальных',  0,4);
taskText('и\ максимальных элементов массивов~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
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
procedure SPar40An4(Name, Key: string);
var i,j: integer;
    x : array [1..10] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру Inv({A},\;{N}), меняющую порядок следования',0,1);
taskText('элементов вещественного массива~{A} размера~{N} на\ обратный',0,2);
taskText('(\Iинвертирование\i массива). Массив~{A} является входным и\ выходным параметром.',0,3);
taskText('С\ помощью этой процедуры инвертировать массивы~{A}, {B},~{C}',  0,4);
taskText('размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
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
procedure SPar40An5(Name, Key: string);
var n,k,i,j:integer;
    a,a1 : array[1..10] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(6,2,0,0,code,code1,code2);
dec(Code);
case code of
0: begin
taskText('Описать процедуру Smooth1({A},\;{N}), выполняющую \Iсглаживание\i вещественного', 0,1);
taskText('массива~{A} размера~{N} следующим образом: элемент {A}_{K} заменяется на\ среднее', 0,2);
taskText('арифметическое первых~{K} исходных элементов массива~{A}. Массив~{A} является', 0,3);
taskText('входным и\ выходным параметром. С\ помощью этой процедуры выполнить', 0,4);
taskText('пятикратное сглаживание данного массива~{A} размера~{N}, выводя',  0,5);
taskText('результаты каждого сглаживания.',  0,0);
(*
*)
   end;
1: begin
taskText('Описать процедуру Smooth2({A},\;{N}), выполняющую \Iсглаживание\i вещественного', 0,1);
taskText('массива~{A} размера~{N} следующим образом: элемент~{A}_{1} не\ изменяется,', 0,2);
taskText('элемент~{A}_{K} ({K}~=~2,\;\.,\;{N}) заменяется на\ полусумму исходных', 0,3);
taskText('элементов~{A}_{K\-1} и~{A}_{K}. Массив~{A} является входным и\ выходным параметром.', 0,4);
taskText('С\ помощью этой процедуры выполнить пятикратное сглаживание',  0,5);
taskText('данного массива~{A} размера~{N}, выводя результаты каждого сглаживания.',  0,0);
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
procedure SPar40An6(Name, Key: string);
var a,a1 : array[1..10] of real;
    i,j:integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру Smooth3({A},\;{N}), выполняющую \Iсглаживание\i вещественного', 0,1);
taskText('массива~{A} размера~{N} следующим образом: каждый элемент массива заменяется', 0,2);
taskText('на его среднее арифметическое с соседними элементами (при вычислении среднего', 0,3);
taskText('арифметического используются \Iисходные\i значения соседних элементов). Массив~{A}', 0,4);
taskText('является входным и\ выходным параметром. С\ помощью этой процедуры выполнить', 0,5);
taskText('пятикратное сглаживание данного массива~{A} размера~{N}, выводя',  0,0);
taskText('результаты каждого сглаживания.',  0,0);
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
procedure SPar40An7(Name, Key: string);
var i,j: integer;
    x : array [1..10] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру RemoveX({A},\;{N},\;{X}), удаляющую из\ целочисленного массива~{A}',0,1);
taskText('размера~{N} элементы, равные целому числу~{X}. Массив~{A} и\ число~{N} являются',0,2);
taskText('входными и\ выходными параметрами. С\ помощью этой процедуры удалить',0,3);
taskText('числа~{X}_A, {X}_B,~{X}_C из\ массивов~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно',  0,4);
taskText('и\ вывести размер и\ содержимое полученных массивов.',  0,5);
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

procedure SPar40An8(Name, Key: string);
var i,j: integer;
    x,x1 : array [1..10] of real;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать процедуру RemoveForInc({A},\;{N}), удаляющую из\ вещественного массива~{A}', 0, 1);
  TaskText('размера~{N} \<лишние\> элементы так, чтобы оставшиеся элементы оказались', 0, 2);
  TaskText('упорядоченными по\ возрастанию: первый элемент не\ удаляется, второй элемент', 0, 3);
  TaskText('удаляется, если он\ меньше первого, третий\ \= если он\ меньше предыдущего', 0, 4);
  TaskText('элемента, оставленного в\ массиве, и\ т.\,д. Например, массив~5.5, 2.5, 4.6, 7.2,', 0, 5);
  TaskText('5.8,~9.4 должен быть преобразован к\ виду~5.5, 7.2,~9.4. Массив~{A} и\ число~{N}', 0, 0);
  TaskText('являются входными и\ выходными параметрами. С\ помощью этой процедуры', 0, 0);
  TaskText('преобразовать массивы~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно', 0, 0);
  TaskText('и\ вывести размер и\ содержимое полученных массивов.', 0, 0);
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



procedure SPar40An9(Name, Key: string);
var i,j: integer;
    x : array [1..20] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру DoubleX({A},\;{N},\;{X}), дублирующую в\ целочисленном массиве~{A}',0,1);
taskText('размера~{N} элементы, равные целому числу~{X}. Массив~{A} и\ число~{N} являются',0,2);
taskText('входными и\ выходными параметрами. С\ помощью этой процедуры продублировать',0,3);
taskText('числа~{X}_A, {X}_B,~{X}_C в\ массивах~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно',  0,4);
taskText('и\ вывести размер и\ содержимое полученных массивов.',  0,5);
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




procedure SPar40An10(Name, Key: string);
var i,j,k,n0 : integer;
    x : array [1..10] of real;
    ind: array [1..10] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(6,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Описать процедуру SortArray({A},\;{N}), выполняющую сортировку по\ возрастанию',0,2);
taskText('вещественного массива~{A} размера~{N}. Массив~{A} является входным',0,3);
taskText('и\ выходным параметром. С\ помощью этой процедуры отсортировать',0,4);
taskText('массивы~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно.',  0,5);
(*
*)
  end;
2: begin
taskText('Описать процедуру SortIndex({A},\;{N},\;{I}), формирующую для\ вещественного массива~{A}',0,1);
taskText('размера~{N} \Iиндексный массив\i~{I}\ \= массив целых чисел того\ же размера, содержащий',0,2);
taskText('номера элементов массива~{A} в\ том порядке, который соответствует возрастанию',0,3);
taskText('элементов массива~{A} (сам\ массив~{A} при\ этом не\ изменяется). Индексный массив~{I}',0,4);
taskText('является выходным параметром. С\ помощью этой процедуры создать индексные',0,5);
taskText('массивы для\ массивов~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно.',0,0);
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


procedure SPar40An11(Name, Key: string);
var i,j,n0 : integer;
    x,x1 : array [1..10] of real;
    v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать процедуру Hill({A},\;{N}), меняющую порядок элементов вещественного', 0, 1);
  TaskText('массива~{A} размера~{N} на следующий: наименьший элемент массива располагается', 0, 2);
  TaskText('на\ первом месте, наименьший из\ оставшихся элементов\ \= на\ последнем, следующий', 0, 3);
  TaskText('по\ величине располагается на\ втором месте, следующий\ \= на предпоследнем', 0, 4);
  TaskText('и\ т.\,д. (в\ результате график значений элементов будет напоминать \Iхолм\i).', 0, 5);
  TaskText('Массив~{A} является входным и\ выходным параметром. С\ помощью этой процедуры', 0, 0);
  TaskText('преобразовать массивы~{A}, {B},~{C} размера~{N}_A, {N}_B,~{N}_C соответственно.', 0, 0);
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

procedure SPar40An12(Name, Key: string);
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
  TaskText('Описать процедуру Split1({A},\;{N}_A,\;{B},\;{N}_B,\;{C},\;{N}_C), формирующую по\ вещественному', 0, 1);
  TaskText('массиву~{A} размера~{N}_A два вещественных массива~{B} и~{C} размера~{N}_B и~{N}_C', 0, 2);
  TaskText('соответственно; при\ этом массив~{B} содержит все\ элементы массива~{A}', 0, 3);
  TaskText('с\ нечетными порядковыми номерами (1, 3,~\.), а\ массив~{C}\ \= все\ элементы', 0, 4);
  TaskText('массива~{A} с\ четными номерами (2, 4,~\.). Массивы~{B} и~{C} и\ числа~{N}_B и~{N}_C', 0, 5);
  TaskText('являются выходными параметрами. Применить эту\ процедуру к\ данному массиву~{A}', 0, 0);
  TaskText('размера~{N}_A и\ вывести размер и\ содержимое полученных массивов~{B} и~{C}.', 0, 0);
(*
*)
end;
2:
begin
  TaskText('Описать процедуру Split2({A},\;{N}_A,\;{B},\;{N}_B,\;{C},\;{N}_C), формирующую по\ целочисленному', 0, 1);
  TaskText('массиву~{A} размера~{N}_A два целочисленных массива~{B} и~{C} размера~{N}_B и~{N}_C', 0, 2);
  TaskText('соответственно; при\ этом массив~{B} содержит все\ четные числа из массива~{A},', 0, 3);
  TaskText('а\ массив~{C}\ \= все\ нечетные числа (в том же порядке). Массивы~{B} и~{C} и\ числа\', 0, 4);
  TaskText('{N}_B и~{N}_C являются выходными параметрами. Применить эту\ процедуру к\ данному', 0, 5);
  TaskText('массиву~{A} размера~{N}_A и\ вывести размер и\ содержимое полученных массивов~{B} и~{C}.', 0, 0);
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

procedure SPar40An13(Name, Key: string);
var
  i,j,m,n,k,v1, v2, v3: Byte;
  a : TRealMatr;
  x : array [1..20] of real;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать процедуру ArrayToMatrRow({A},\;{K},\;{M},\;{N},\;{B}), формирующую по\ вещественному', 0, 1);
  TaskText('массиву~{A} размера~{K} матрицу~{B} размера {M}\;\x\;{N} (матрица заполняется элементами', 0, 2);
  TaskText('массива~{A} по\ строкам). \<Лишние\> элементы массива игнорируются; если элементов', 0, 3);
  TaskText('массива недостаточно, то\ оставшиеся элементы матрицы полагаются равными~0.', 0, 4);
  TaskText('Двумерный массив~{B} является выходным параметром. С\ помощью этой процедуры', 0, 5);
  TaskText('на\ основе данного массива~{A} размера~{K} и\ целых чисел~{M} и~{N}', 0, 0);
  TaskText('сформировать матрицу~{B} размера {M}\;\x\;{N}.', 0, 0);
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


procedure SPar40An14(Name, Key: string);
var
  i,j,m,n,k,v1, v2, v3: Byte;
  a : TRealMatr;
  x : array [1..20] of real;
begin
  Start(Name, Topic2, Author, Key, 73{level2});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать процедуру ArrayToMatrCol({A},\;{K},\;{M},\;{N},\;{B}), формирующую по\ вещественному', 0, 1);
  TaskText('массиву~{A} размера~{K} матрицу~{B} размера {M}\;\x\;{N} (матрица заполняется элементами', 0, 2);
  TaskText('массива~{A} по\ столбцам). \<Лишние\> элементы массива игнорируются; если элементов', 0, 3);
  TaskText('массива недостаточно, то\ оставшиеся элементы матрицы полагаются равными~0.', 0, 4);
  TaskText('Двумерный массив~{B} является выходным параметром. С\ помощью этой процедуры', 0, 5);
  TaskText('на\ основе данного массива~{A} размера~{K} и\ целых чисел~{M} и~{N}', 0, 0);
  TaskText('сформировать матрицу~{B} размера {M}\;\x\;{N}.', 0, 0);
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


procedure SPar40An15(Name, Key: string);
var
  m,n,i,j,k,c: integer;
  v1, v2, v3: Byte;
begin
  Start(Name, Topic2, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать процедуру Chessboard({M},\;{N},\;{A}), формирующую по\ целым положительным', 0, 1);
  TaskText('числам~{M} и~{N} матрицу~{A} размера {M}\;\x\;{N}, которая содержит числа~0 и~1,', 0, 2);
  TaskText('расположенные в\ \<шахматном\> порядке, причем {A}_{1,1}~=~0. Двумерный', 0, 3);
  TaskText('целочисленный массив~{A} является выходным параметром. С\ помощью этой процедуры', 0, 4);
  TaskText('по\ данным целым числам~{M} и~{N} сформировать матрицу~{A} размера {M}\;\x\;{N}.', 0, 5);
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



procedure SPar40An16(Name, Key: string);
var i,j,k,k0 : integer;
    a : TRealMatr;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(7,2,0,0,code,code1,code2);
case Code of
1: begin
     s0 := '1';
taskText('Описать функцию Norm1({A},\;{M},\;{N}) вещественного типа, вычисляющую',0,1);
taskText('\Iнорму\i вещественной матрицы~{A} размера {M}\;\x\;{N}:',0,2);
taskText('\[Norm1({A},\;{M},\;{N})~=~max \{|{A}_{1,J}|\;+\;|{A}_{2,J}|\;+\;\.\;+\;|{A}_{M,J}|\},\]',0,3);
taskText('где максимум берется по\ всем~{J} от~1 до~{N}.',0,4);
taskText('Для\ данной матрицы~{A} размера {M}\;\x\;{N} найти Norm1({A},\;{K},\;{N}), {K}~=~1,\,\.,\,{M}.',  0,5);
(*
*)
  end;
2: begin
     s0 := '2';
taskText('Описать функцию Norm2({A},\;{M},\;{N}) вещественного типа, вычисляющую',0,1);
taskText('\Iнорму\i вещественной матрицы~{A} размера {M}\;\x\;{N}:',0,2);
taskText('\[Norm2({A},\;{M},\;{N})~=~max \{|{A}_{I,1}|\;+\;|{A}_{I,2}|\;+\;\.\;+\;|{A}_{I,N}|\},\]',0,3);
taskText('где максимум берется по\ всем~{I} от~1 до~{M}.',0,4);
taskText('Для\ данной матрицы~{A} размера {M}\;\x\;{N} найти Norm2({A},\;{K},\;{N}), {K}~=~1,\,\.,\,{M}.',  0,5);
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
procedure SPar40An17(Name, Key: string);
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
taskText('Описать функцию SumRow({A},\;{M},\;{N},\;{K}) вещественного типа, вычисляющую сумму',0,2);
taskText('элементов вещественной матрицы~{A} размера~{M}\;\x\;{N}, расположенных в~\Um{K}-й\um\ строке',0,3);
taskText('(если {K}~>~{M}, то\ функция возвращает~0). Для\ данной матрицы~{A}',0,4);
taskText('размера~{M}\;\x\;{N} и\ трех данных~{K} найти SumRow({A},\;{M},\;{N},\;{K}).',0,5);
(*
*)
  end;
2: begin
     s0 := 'Col';
     n0 := n;
taskText('Описать функцию SumCol({A},\;{M},\;{N},\;{K}) вещественного типа, вычисляющую сумму',0,2);
taskText('элементов вещественной матрицы~{A} размера~{M}\;\x\;{N}, расположенных в~\Um{K}-м\um\ столбце',0,3);
taskText('(если {K}~>~{N}, то\ функция возвращает~0). Для\ данной матрицы~{A}',0,4);
taskText('размера~{M}\;\x\;{N} и\ трех данных~{K} найти SumCol({A},\;{M},\;{N},\;{K}).',0,5);
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
procedure SPar40An18(Name, Key: string);
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
     s1 := 'строк';
     s3 := 'строки';
     s2 := 'M';}
     n0 := m;
taskText('Описать процедуру SwapRow({A},\;{M},\;{N},\;{K}_1,\;{K}_2), осуществляющую перемену местами',0,1);
taskText('строк вещественной матрицы~{A} размера~{M}\;\x\;{N} с\ номерами~{K}_1 и~{K}_2.',0,2);
taskText('Матрица~{A} является входным и выходным параметром; если~{K}_1 или~{K}_2 больше~{M},',0,3);
taskText('то\ матрица не\ изменяется. Используя эту\ процедуру, поменять для\ данной',0,4);
taskText('матрицы~{A} размера~{M}\;\x\;{N} строки с\ данными номерами~{K}_1 и~{K}_2.',0,5);
(*
*)
  end;
2: begin
{     s0 := 'Col';
     s1 := 'столбцов';
     s3 := 'столбцы';
     s2 := 'N';}
     n0 := n;
taskText('Описать процедуру SwapCol({A},\;{M},\;{N},\;{K}_1,\;{K}_2), осуществляющую перемену местами',0,1);
taskText('столбцов вещественной матрицы~{A} размера~{M}\;\x\;{N} с\ номерами~{K}_1 и~{K}_2.',0,2);
taskText('Матрица~{A} является входным и выходным параметром; если~{K}_1 или~{K}_2 больше~{N},',0,3);
taskText('то\ матрица не\ изменяется. Используя эту\ процедуру, поменять для\ данной',0,4);
taskText('матрицы~{A} размера~{M}\;\x\;{N} столбцы с\ данными номерами~{K}_1 и~{K}_2.',0,5);
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
procedure SPar40An19(Name, Key: string);
var i,j : integer;
    a : array [1..5,1..5] of real;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру Transp({A},\;{M}), выполняющую \Iтранспонирование\i',0,1);
taskText('(т.\,е. зеркальное отражение относительно главной диагонали)',0,2);
taskText('квадратной вещественной матрицы~{A} порядка~{M}.',0,3);
taskText('Матрица~{A} является входным и\ выходным параметром.',0,4);
taskText('Используя эту\ процедуру, транспонировать данную матрицу~{A} порядка~{M}.',0,5);
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
procedure SPar40An20(Name, Key: string);
var a: TRealMatr;{array[1..4,1..10] of real;}
    k,k1,k2,i,i2,j: integer;
    v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,73{level2});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Описать процедуру RemoveRows({A},\;{M},\;{N},\;{K}_1,\;{K}_2), удаляющую из\ вещественной',0,1);
taskText('матрицы~{A} размера {M}\;\x\;{N} строки с\ номерами от~{K}_1 до~{K}_2 включительно',0,2);
taskText('(предполагается, что 1~<~{K}_1~\l~{K}_2). Если {K}_1~>~{M}, то\ матрица не\ изменяется;',0,3);
taskText('если {K}_2~>~{M}, то\ удаляются строки матрицы с\ номерами от~{K}_1 до~{M}. Двумерный',0,4);
taskText('массив~{A} и\ числа~{M}, {N} являются входными и выходными параметрами. Используя',0,5);
taskText('процедуру RemoveRows, удалить из\ данной матрицы~{A} размера~{M}\;\x\;{N} строки',0,0);
taskText('с\ номерами от~{K}_1 до~{K}_2 и\ вывести размер полученной матрицы и\ ее\ элементы.',0,0);
(*
*)
end;
2: begin
taskText('Описать процедуру RemoveCols({A},\;{M},\;{N},\;{K}_1,\;{K}_2), удаляющую из\ вещественной',0,1);
taskText('матрицы~{A} размера {M}\;\x\;{N} столбцы с\ номерами от~{K}_1 до~{K}_2 включительно',0,2);
taskText('(предполагается, что 1~<~{K}_1~\l~{K}_2). Если {K}_1~>~{N}, то\ матрица не\ изменяется;',0,3);
taskText('если {K}_2~>~{N}, то\ удаляются столбцы матрицы с\ номерами от~{K}_1 до~{N}. Двумерный',0,4);
taskText('массив~{A} и\ числа~{M}, {N} являются входными и выходными параметрами. Используя',0,5);
taskText('процедуру RemoveCols, удалить из\ данной матрицы~{A} размера~{M}\;\x\;{N} столбцы',0,0);
taskText('с\ номерами от~{K}_1 до~{K}_2 и\ вывести размер полученной матрицы и\ ее\ элементы.',0,0);
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
procedure SPar40An21(Name, Key: string);
var a: TRealMatr;{array[1..4,1..10] of real;}
    i,j,i0,j0,i1,j1,i2: integer;
begin
start(Name,Topic2,Author,Key,73{level2});
taskText('Описать процедуру RemoveRowCol({A},\;{M},\;{N},\;{K},\;{L}), удаляющую из\ вещественной',0,1);
taskText('матрицы~{A} размера {M}\;\x\;{N} строку и\ столбец, которые содержат элемент~{A}_{K,L}',0,2);
taskText('(предполагается, что {M}~>~1 и {N}~>~1; если {K}~>~{M} или~{L}~>~{N}, то\ матрица',0,3);
taskText('не\ изменяется). Двумерный массив~{A} и\ числа~{M}, {N} являются входными и\ выходными',0,4);
taskText('параметрами. Дана матрица~{A} размера {M}\;\x\;{N} и\ числа~{K}, {L}. Применить к\ матрице~{A}',0,5);
taskText('процедуру RemoveRowCol и\ вывести размер полученной матрицы и\ ее\ элементы.',0,0);
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

procedure SPar40An22(Name, Key: string);
var v1,v2,v3 : byte;
    b: Boolean;
    i,j,i1,j1,i2,a0: integer;
    a: array [1..5,1..8] of integer;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Описать процедуру SortCols({A},\;{M},\;{N}), выполняющую сортировку по\ возрастанию',0,1);
taskText('столбцов целочисленной матрицы~{A} размера {M}\;\x\;{N} (столбцы сравниваются',0,2);
taskText('\Iлексикографически\i: если первые элементы столбцов различны, то\ меньшим',0,3);
taskText('считается столбец, содержащий меньший первый элемент; если первые элементы',0,4);
taskText('столбцов равны, то\ анализируются их\ вторые элементы и\ т.\,д.). Двумерный',0,5);
taskText('массив~{A} является входным и\ выходным параметром. Используя процедуру',0,0);
taskText('SortCols, отсортировать столбцы данной матрицы~{A} размера {M}\;\x\;{N}.',0,0);
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

procedure SPar40An23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;


const c_1: string = '0123456789';
      c_2: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
                    'abcdefghijklmnopqrstuvwxyz';
      c_3: string = '!@#$%^&*()-=+|\?/.,<>`~;:"';
      c_4: string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ';
      c_5: string = 'абвгдежзийклмнопрстуфхцчшщьыъэюя';


procedure SPar40An24(Name, Key: string);
var i,j : integer;
begin
start(Name,Topic3,Author,Key,73{level2});(*DEMO*)
taskText('Описать функцию IsIdent({S}) целого типа, проверяющую, является\ ли строка~{S}',0,1);
taskText('допустимым \Iидентификатором\i, т.\,е. непустой строкой, которая содержит только',0,2);
taskText('латинские буквы, цифры и\ символ подчеркивания~\<\_\> и\ не\ начинается с\ цифры.',0,3);
taskText('Если {S}~является допустимым идентификатором, то функция возвращает~0.',0,4);
taskText('Если {S}~является пустой строкой, то\ возвращается~\-1, если~{S} начинается с\ цифры,',0,5);
taskText('то\ возвращается~\-2. Если {S}~содержит недопустимые символы, то\ возвращается',0,0);
taskText('номер первого недопустимого символа. Проверить с\ помощью',0,0);
taskText('функции IsIdent пять данных строк.',0,0);
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

procedure SPar40An25(Name, Key: string);
const c1 : string = '*<>-=+|^. ';
var i: integer;
    cs,cs1 : char;
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Описать функцию FillStr({S},\;{N}) строкового типа, возвращающую строку длины~{N},',0,1);
taskText('заполненную повторяющимися копиями строки-\Iшаблона\i~{S} (последняя копия',0,2);
taskText('строки-шаблона может входить в\ результирующую строку частично).',0,3);
taskText('Используя эту\ функцию, сформировать по\ данному числу~{N} и\ пяти данным',0,4);
taskText('строкам-шаблонам пять результирующих строк длины~{N}.',0,5);
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

procedure SPar40An26(Name, Key: string);
var i,j,k : integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
taskText('Описать процедуру UpCaseRus({S}), преобразующую все строчные русские буквы',0,2);
taskText('строки~{S} в\ прописные (остальные символы строки~{S} не\ изменяются).',0,3);
taskText('Строка~{S} является входным и\ выходным параметром.',  0,4);
taskText('Используя процедуру UpCaseRus, преобразовать пять данных строк.',  0,5);
(*
*)
  end;
2: begin
taskText('Описать процедуру LowCaseRus({S}), преобразующую все прописные русские буквы',0,2);
taskText('строки~{S} в\ строчные (остальные символы строки~{S} не\ изменяются).',0,3);
taskText('Строка~{S} является входным и\ выходным параметром.',  0,4);
taskText('Используя процедуру LowCaseRus, преобразовать пять данных строк.',  0,5);
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
procedure SPar40An27(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,2,0,0,code,code1,code2);
case code of
1: begin
taskText('Описать процедуру TrimLeftC({S}, {C}), удаляющую в\ строке~{S} начальные символы,',0,2);
taskText('совпадающие с\ символом~{C}. Строка~{S} является входным и\ выходным параметром.',0,3);
taskText('Дан символ~{C} и\ пять строк. Используя процедуру TrimLeftC,',  0,4);
taskText('преобразовать данные строки.',  0,5);
(*
*)
   end;
2: begin
taskText('Описать процедуру TrimRightC({S}, {C}), удаляющую в\ строке~{S} конечные символы,',0,2);
taskText('совпадающие с\ символом~{C}. Строка~{S} является входным и\ выходным параметром.',0,3);
taskText('Дан символ~{C} и\ пять строк. Используя процедуру TrimRightC,',  0,4);
taskText('преобразовать данные строки.',  0,5);
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

procedure SPar40An28(Name, Key: string);
var
  i,k,p: integer;
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию InvStr({S},\;{K},\;{N}) строкового типа, возвращающую', 0, 1);
  TaskText('\Iинвертированную подстроку\i строки~{S}, содержащую в\ обратном порядке {N}~символов', 0, 2);
  TaskText('строки~{S}, начиная с\ ee\ \Um{K}-го\um символа. Если~{K} превосходит длину строки~{S},', 0, 3);
  TaskText('то\ возвращается пустая строка; если длина строки меньше {K}\;+\;{N},', 0, 4);
  TaskText('то\ инвертируются все\ символы строки, начиная с\ ee\ \Um{K}-го\um символа. Вывести', 0, 5);
  TaskText('значения функции InvStr для\ данной строки~{S} и\ каждой из\ трех пар', 0, 0);
  TaskText('положительных целых чисел: ({K}_1,\;{N}_1), ({K}_2,\;{N}_2), ({K}_3,\;{N}_3).', 0, 0);
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

procedure SPar40An29(Name, Key: string);
label 1;
var
  v1, v2, v3: Byte;
  i,k,p,x:integer;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Описать функцию PosSub({S}_0,\;{S},\;{K},\;{N}) целого типа, возвращающую номер позиции,', 0, 1);
  TaskText('начиная с\ которой в\ строке~{S} содержится первое вхождение строки~{S}_0, причем', 0, 2);
  TaskText('анализируются только {N}~символов строки~{S}, начиная с\ ее\ \Um{K}-го\um\ символа (таким', 0, 3);
  TaskText('образом, PosSub обеспечивает \Iпоиск в\ подстроке\i). Если {K}~превосходит длину', 0, 4);
  TaskText('строки~{S}, то\ возвращается~0, если длина строки меньше {K}\;+\;{N}, то\ анализируются', 0, 5);
  TaskText('все\ символы строки, начиная с\ ее\ \Um{K}-го\um символа. Если в\ требуемой подстроке', 0, 0);
  TaskText('строки~{S} вхождения~{S}_0 отсутствуют, то\ функция возвращает~0. Вывести значения', 0, 0);
  TaskText('функции PosSub для\ данных строк~{S}_0, {S} и\ каждой из\ трех пар', 0, 0);
  TaskText('положительных целых чисел: ({K}_1,\;{N}_1), ({K}_2,\;{N}_2), ({K}_3,\;{N}_3).', 0, 0);
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

procedure SPar40An30(Name, Key: string);
label 1;
var i,j,k,k0:integer;

begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Описать функцию PosLast({S}_0,\;{S}) целого типа, возвращающую номер позиции,',0,2);
taskText('начиная с\ которой в\ строке~{S} содержится последнее вхождение подстроки~{S}_0.',  0,3);
taskText('Если в\ строке~{S} отсутствуют подстроки~{S}_0, то\ функция возвращает~0.',  0,4);
taskText('Вывести значения этой функции для\ пяти данных пар строк {S}_0 и~{S}.',  0,5);
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

procedure SPar40An31(Name, Key: string);
label 1;
var i,j,k,k0,p,d:integer;

begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Описать функцию PosK({S}_0, {S}, {K}) целого типа, возвращающую номер позиции,',0,1);
taskText('начиная с\ которой в\ строке~{S} содержится \Um{K}-е\um\ вхождение подстроки~{S}_0 ({K}~>~0).',  0,2);
taskText('Если количество вхождений~{S}_0 в\ строке~{S} меньше~{K}, то\ функция возвращает~0.',  0,3);
taskText('Считать, что перекрывающихся вхождений подстрок~{S}_0 строка~{S} не\ содержит.',  0,4);
taskText('Вывести значения этой функции для\ пяти данных троек:~{S}_0, {S} и~{K}.',  0,5);
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
procedure SPar40An32(Name, Key: string);
var i,k : integer;
    s0 : array [1..10] of string[20];
begin
start(Name,Topic3,Author,Key,73{level2});(*DEMO*)
taskText('Описать функцию WordK({S}, {K}) строкового типа, возвращающую \Um{K}-е\um\ слово',0,1);
taskText('строки~{S} (\Iсловом\i считается набор символов, не\ содержащий пробелов',  0,2);
taskText('и\ ограниченный пробелами или\ началом/концом строки). Если количество',  0,3);
taskText('слов в\ строке меньше~{K}, то\ функция возвращает пустую строку. Используя',  0,4);
taskText('эту\ функцию, выделить из\ данной строки~{S} слова с\ данными номерами~{K}_1, {K}_2,~{K}_3.',  0,5);
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
procedure SPar40An33(Name, Key: string);
var i,k:integer;
    s0 : array [1..10] of string[20];
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Описать процедуру SplitStr({S}, {W}, {N}), которая формирует по\ данной строке~{S}',0,1);
taskText('массив~{W} слов, входящих\ в~{S} (массив~{W} и\ его размер~{N} являются выходными',0,2);
taskText('параметрами). \IСловом\i считается набор символов, не\ содержащий пробелов',0,3);
taskText('и\ ограниченный пробелами или\ началом/концом строки; предполагается, что\',0,4);
taskText('строка~{S} содержит не\ более 10~слов. Используя функцию SplitStr, найти',0,5);
taskText('количество слов~{N}, содержащихся в\ данной строке~{S}, и\ сами эти\ слова.',0,0);
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
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщьыъэюя';
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


procedure SPar40An34(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
taskText('Описать функцию CompressStr({S}) строкового типа, выполняющую \Iсжатие\i строки~{S}',0,1);
taskText('по\ следующему правилу: каждая подстрока строки~{S}, состоящая из\ более чем',0,2);
taskText('четырех одинаковых символов~{C}, заменяется текстом вида \<{С}\{{K}\}\>, где\ {K}\ \=',0,3);
taskText('количество символов~{C} (предполагается, что\ строка~{S} не\ содержит фигурных',0,4);
taskText('скобок~\<\{\> и~\<\}\>). Например, для\ строки {S}~=~\<bbbccccce\> функция вернет',0,5);
taskText('строку \<bbbc\{5\}e\>. С\ помощью функции CompressStr сжать пять данных строк.',0,0);
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

procedure SPar40An35(Name, Key: string);
var v1,v2,v3 : byte;
    i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('Описать функцию DecompressStr({S}) строкового типа, восстанавливающую строку,',0,2);
taskText('сжатую функцией CompressStr (см.\ задание \1). Параметр~{S} содержит',0,3);
taskText('сжатую строку; восстановленная строка является возвращаемым значением функции.',0,4);
taskText('С\ помощью функции DecompressStr восстановить пять данных сжатых строк.',0,5);
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





procedure SPar40An36(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
     s2 := 'Bin';
taskText('Описать функцию DecToBin({N}) строкового типа, возвращающую строковое',0,1);
taskText('представление целого неотрицательного числа~{N} в\ двоичной системе счисления.',0,2);
taskText('Результирующая строка состоит из\ символов \<0\>\:\<1\>',  0,3);
taskText('и\ не\ содержит ведущих нулей (за\ исключением представления числа~0).',  0,4);
taskText('Используя эту\ функцию, получить двоичные представления пяти данных чисел.',  0,5);
(*
*)
  end;
2: begin
     s2 := 'Hex';
taskText('Описать функцию DecToHex({N}) строкового типа, возвращающую строковое',0,1);
taskText('представление целого неотрицательного числа~{N} в\ 16-ричной системе счисления.',0,2);
taskText('Результирующая строка состоит из\ символов \<0\>\:\<9\>, \<A\>\:\<F\>',  0,3);
taskText('и\ не\ содержит ведущих нулей (за\ исключением представления числа~0).',  0,4);
taskText('Используя эту\ функцию, получить 16-ричные представления пяти данных чисел.',  0,5);
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
procedure SPar40An37(Name, Key: string);
var i: integer;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(8,2,0,0,code,code1,code2);
case Code of
1: begin
     s2 := 'Bin';
taskText('Описать функцию BinToDec({S}) целого типа, определяющую целое неотрицательное',0,1);
taskText('число по\ его\ строковому представлению~{S} в\ двоичной системе счисления.',0,2);
taskText('Параметр~{S} имеет строковый тип, состоит из\ символов \<0\>\:\<1\>',  0,3);
taskText('и\ не\ содержит ведущих нулей (за\ исключением значения~\<0\>). Используя эту\',  0,4);
taskText('функцию, вывести пять чисел, для\ которых даны их\ двоичные представления.',  0,5);
(*
*)
  end;
2: begin
     s2 := 'Hex';
taskText('Описать функцию HexToDec({S}) целого типа, определяющую целое неотрицательное',0,1);
taskText('число по\ его\ строковому представлению~{S} в\ 16-ричной системе счисления.',0,2);
taskText('Параметр~{S} имеет строковый тип, состоит из\ символов \<0\>\:\<9\>, \<A\>\:\<F\>',  0,3);
taskText('и\ не\ содержит ведущих нулей (за\ исключением значения~\<0\>). Используя эту\',  0,4);
taskText('функцию, вывести пять чисел, для\ которых даны их\ 16-ричные представления.',  0,5);
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




procedure SPar40An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,73{level2});
getVariant(9,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SPar40An39(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('ФОРМУЛИРОВКА ЗАДАНИЯ', 0, 3);
(*
*)
  DataS('', 'ИСХОДНЫЕ ДАННЫЕ', 0, 3);
  ResultS('', 'РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ', 0, 3);
  SetNumberOfTests(5);
  Pause;
end;

procedure SPar40An40(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 73{level2});
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
Topic2 := 'ПРОЦЕДУРЫ И ФУНКЦИИ: РАБОТА С МАССИВАМИ';
Topic3 := 'ПРОЦЕДУРЫ И ФУНКЦИИ: РАБОТА СО СТРОКАМИ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.

