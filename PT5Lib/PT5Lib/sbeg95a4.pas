{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SBeg95A4;

{$MODE Delphi}

interface

procedure SBeg95An1(Name, Key: string);
procedure SBeg95An2(Name, Key: string);
procedure SBeg95An3(Name, Key: string);
procedure SBeg95An4(Name, Key: string);
procedure SBeg95An5(Name, Key: string);
procedure SBeg95An6(Name, Key: string);
procedure SBeg95An7(Name, Key: string);
procedure SBeg95An8(Name, Key: string);
procedure SBeg95An9(Name, Key: string);
procedure SBeg95An10(Name, Key: string);
procedure SBeg95An11(Name, Key: string);
procedure SBeg95An12(Name, Key: string);
procedure SBeg95An13(Name, Key: string);
procedure SBeg95An14(Name, Key: string);
procedure SBeg95An15(Name, Key: string);
procedure SBeg95An16(Name, Key: string);
procedure SBeg95An17(Name, Key: string);
procedure SBeg95An18(Name, Key: string);
procedure SBeg95An19(Name, Key: string);
procedure SBeg95An20(Name, Key: string);
procedure SBeg95An21(Name, Key: string);
procedure SBeg95An22(Name, Key: string);
procedure SBeg95An23(Name, Key: string);
procedure SBeg95An24(Name, Key: string);
procedure SBeg95An25(Name, Key: string);
procedure SBeg95An26(Name, Key: string);
procedure SBeg95An27(Name, Key: string);
procedure SBeg95An28(Name, Key: string);
procedure SBeg95An29(Name, Key: string);
procedure SBeg95An30(Name, Key: string);
procedure SBeg95An31(Name, Key: string);
procedure SBeg95An32(Name, Key: string);
procedure SBeg95An33(Name, Key: string);
procedure SBeg95An34(Name, Key: string);
procedure SBeg95An35(Name, Key: string);
procedure SBeg95An36(Name, Key: string);
procedure SBeg95An37(Name, Key: string);
procedure SBeg95An38(Name, Key: string);
procedure SBeg95An39(Name, Key: string);
procedure SBeg95An40(Name, Key: string);
procedure SBeg95An41(Name, Key: string);
procedure SBeg95An42(Name, Key: string);
procedure SBeg95An43(Name, Key: string);
procedure SBeg95An44(Name, Key: string);
procedure SBeg95An45(Name, Key: string);
procedure SBeg95An46(Name, Key: string);
procedure SBeg95An47(Name, Key: string);
procedure SBeg95An48(Name, Key: string);
procedure SBeg95An49(Name, Key: string);
procedure SBeg95An50(Name, Key: string);
procedure SBeg95An51(Name, Key: string);
procedure SBeg95An52(Name, Key: string);
procedure SBeg95An53(Name, Key: string);
procedure SBeg95An54(Name, Key: string);
procedure SBeg95An55(Name, Key: string);
procedure SBeg95An56(Name, Key: string);
procedure SBeg95An57(Name, Key: string);
procedure SBeg95An58(Name, Key: string);
procedure SBeg95An59(Name, Key: string);
procedure SBeg95An60(Name, Key: string);
procedure SBeg95An61(Name, Key: string);
procedure SBeg95An62(Name, Key: string);
procedure SBeg95An63(Name, Key: string);
procedure SBeg95An64(Name, Key: string);
procedure SBeg95An65(Name, Key: string);
procedure SBeg95An66(Name, Key: string);
procedure SBeg95An67(Name, Key: string);
procedure SBeg95An68(Name, Key: string);
procedure SBeg95An69(Name, Key: string);
procedure SBeg95An70(Name, Key: string);
procedure SBeg95An71(Name, Key: string);
procedure SBeg95An72(Name, Key: string);
procedure SBeg95An73(Name, Key: string);
procedure SBeg95An74(Name, Key: string);
procedure SBeg95An75(Name, Key: string);
procedure SBeg95An76(Name, Key: string);
procedure SBeg95An77(Name, Key: string);
procedure SBeg95An78(Name, Key: string);
procedure SBeg95An79(Name, Key: string);
procedure SBeg95An80(Name, Key: string);
procedure SBeg95An81(Name, Key: string);
procedure SBeg95An82(Name, Key: string);
procedure SBeg95An83(Name, Key: string);
procedure SBeg95An84(Name, Key: string);
procedure SBeg95An85(Name, Key: string);
procedure SBeg95An86(Name, Key: string);
procedure SBeg95An87(Name, Key: string);
procedure SBeg95An88(Name, Key: string);
procedure SBeg95An89(Name, Key: string);
procedure SBeg95An90(Name, Key: string);
procedure SBeg95An91(Name, Key: string);
procedure SBeg95An92(Name, Key: string);
procedure SBeg95An93(Name, Key: string);
procedure SBeg95An94(Name, Key: string);
procedure SBeg95An95(Name, Key: string);

implementation

uses PT5TaskMaker;

const Pi = 3.14;

var Topic1,Topic2,Topic3,Author : string;
    a,b,c,a1,b1,c1,a2,b2,c2,d,x,y,x1,y1,x2,y2,z : real;
    i,j,k,m,m1,m2,n,n1,n2,n3,n4 : integer;
    s,s1,s2,s3 : string;
    bln : Boolean;
    cur: integer; //2012

procedure Swap(var a,b: integer); //2012
var c: integer;
begin
  c := a;
  a := b;
  b := c;
end;

procedure SBeg95An1(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(2,2,0,0,v1,v2,v3);
x := (1+Random(100))/10;
if v1 = 1 then
  begin
taskText('Дана сторона квадрата~{a}. Найти его периметр~{P}~=~4\*{a}.',0,3);
(*
*)
  s1 := 'P = ';
  y := 4*x;
  end
else
  begin
taskText('Дана сторона квадрата~{a}. Найти его площадь~{S}~=~{a}^2.',0,3);
(*
*)
  s1 := 'S = ';
  y := x*x;
  end;
dataR('a = ',x,0,3,4);
resultR(s1,y,0,3,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An2(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны стороны прямоугольника~{a} и~{b}. ',0,2);
taskText('Найти его площадь~{S}~=~{a}\*{b} и\ периметр~{P}~=~2\*({a}\;+\;{b}).',0,4);
(*
*)
a := (1+Random(100))/10;
b := (1+Random(100))/10;
dataR('a = ',a,xLeft,3,4);
dataR('b = ',b,xRight,3,4);
resultR('S = ',a*b,0,2,5);
resultR('P = ',2*(a+b),0,4,5);
setNumberOfTests(3);
pause;
end;



procedure SBeg95An3(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Дан диаметр окружности~{d}. Найти ее длину~{L}~=~\p\*{d}.',0,2);
taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
x := 1+Random(10);
dataR('d = ',x,0,3,4);
resultR('L = ',Pi*x,0,3,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An4(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дана длина ребра куба~{a}.',0,2);
taskText('Найти объем куба~{V}~=~{a}^3 и\ площадь его поверхности~{S}~=~6\*{a}^2.',0,4);
(*
*)
x := 1+Random(9);
if Random(2)=0 then x := x + 0.5;
dataR('a = ',x,0,3,4);
setprecision(3);
resultR('V = ',x*x*x,xLeft,3,7);
resultR('S = ',6*x*x,xRight,3,7);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An5(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Даны длины ребер~{a}, {b}, {c} прямоугольного параллелепипеда.',0,2);
taskText('Найти его объем~{V}~=~{a\*b\*c} и\ площадь поверхности~{S}~=~2\*({a\*b}\;+\;{b\*c}\;+\;{a\*c}).',0,4);
(*
*)
a := (1+Random(99))/10;
b := (1+Random(99))/10;
c := (1+Random(99))/10;
dataR('a = ',a,0,2,4);
dataR('b = ',b,0,3,4);
dataR('c = ',c,0,4,4);
setprecision(3);
resultR('V = ',a*b*c,xLeft,3,7);
resultR('S = ',2*(a*b+b*c+a*c),xRight,3,7);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An6(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Найти длину окружности~{L} и\ площадь круга~{S} заданного радиуса~{R}:',0,2);
taskText('\[{L}~=~2\*\p\*{R},\Q    {S}~=~\p\*{R}^2.\]',0,3);
taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
x := 1+Random(9);
if Random(2)=0 then x := x + 0.5;
dataR('R = ',x,0,3,4);
setprecision(3);
resultR('L = ',2*Pi*x,xLeft,3,7);
resultR('S = ',Pi*x*x,xRight,3,7);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An7(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(6,2,0,0,v1,v2,v3);
if v1 = 1 then
  begin
  a := RandomR1(-9.9,9.9); //Random(20)-9.0; //2018
  b := RandomR1(-9.9,9.9); //Random(20)-9.0;
  taskText('Даны два числа~{a} и~{b}.',0,2);
  taskText('Найти их \Iсреднее арифметическое\i: ({a}\;+\;{b})/2.',0,4);
(*
*)
  c := (a+b)/2;
  end
else
  begin
  a := RandomR1(1,19.9); //1+Random(20);
  b := RandomR1(1,19.9); //1+Random(20);
  taskText('Даны два неотрицательных числа~{a} и~{b}. Найти их \Iсреднее геометрическое\i,',0,2);
  taskText('т.\,е. квадратный корень из\ их\ произведения: \R{a}\*{b}\r.',0,4);
(*
Для\ вычисления \Iквадратного корня\i \R{x}\r
в\ языке \UP используйте функцию Sqrt({x}),
а\ в\ языке \UV\ \= функцию Sqr({x}).
*)
  c := sqrt(a*b);
  end;
dataR('a = ',a,xLeft,3,5);
dataR('b = ',b,xRight,3,5);
resultR('',c,0,3,6);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An8(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны два ненулевых числа.',0,2);
taskText('Найти сумму, разность, произведение и\ частное их\ квадратов.',0,4);
(*
Для хранения квадратов исходных чисел
использовать вспомогательные переменные.
*)
a := (Random(200) - 90.0)/10;
b := (Random(200) - 90.0)/10;
if a = 0 then a := 0.1;
if b = 0 then b := 0.1;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,xRight,3,5);
resultR('A^2 + B^2 = ',a*a+b*b,xLeft,2,7);
resultR('A^2 - B^2 = ',a*a-b*b,xRight,2,7);
resultR('A^2 \* B^2 = ',a*a*b*b,xLeft,4,7);
resultR('A^2 / B^2 = ',a*a/b/b,xRight,4,7);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An9(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны два ненулевых числа.',0,2);
taskText('Найти сумму, разность, произведение и\ частное их\ модулей.',0,4);
(*
Для хранения модулей исходных чисел
использовать вспомогательные переменные.
*)
a := (Random(200) - 90.0)/10;
b := (Random(200) - 90.0)/10;
if a = 0 then a := 0.1;
if b = 0 then b := 0.1;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,xRight,3,5);
a := abs(a);
b := abs(b);
resultR('|A| + |B| = ',a+b,xLeft,2,6);
resultR('|A| - |B| = ',a-b,xRight,2,6);
resultR('|A| \* |B| = ',a*b,xLeft,4,6);
resultR('|A| / |B| = ',a/b,xRight,4,6);
setNumberOfTests(3);
pause;
end;



procedure SBeg95An10(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны катеты прямоугольного треугольника~{a} и~{b}.',0,2);
taskText('Найти его гипотенузу~{c} и периметр~{P}:',0,3);
taskText('\[{c}~=~\R{a}^2\;+\;{b}^2\r,\Q    {P}~=~{a}\;+\;{b}\;+\;{c}.\]',0,4);
(*
Для хранения гипотенузы использовать вспомогательную переменную.
*)
a := (1+Random(99))/10;
b := (1+Random(99))/10;
dataR('a = ',a,xLeft,3,4);
dataR('b = ',b,xRight,3,4);
resultR('c = ',sqrt(a*a+b*b),0,2,5);
resultR('P = ',a+b+sqrt(a*a+b*b),0,4,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An11(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны два круга с\ общим центром и\ радиусами~{R}_1 и~{R}_2 ({R}_1~>~{R}_2).',0,1);
taskText('Найти площади этих кругов~{S}_1 и~{S}_2, а\ также площадь~{S}_3 кольца,',0,2);
taskText('внешний радиус которого равен~{R}_1, а\ внутренний радиус равен~{R}_2:',0,3);
taskText('\[{S}_1~=~\p\*({R}_1)^2,\Q     {S}_2~=~\p\*({R}_2)^2,\Q     {S}_3~=~{S}_1~\-~{S}_2.\]',0,4);
taskText('В\ качестве значения~\p использовать~3.14.',0,5);
(*
*)
a := 1+Random(5);
b := a + Random(5) + 1;
dataR('R_1 = ',b,15,3,5);
dataR('R_2 = ',a,xRight,3,5);
resultR('S_1 = ',Pi*b*b,center(1,3,10,10),3,6);
resultR('S_2 = ',Pi*a*a,center(2,3,10,10),3,6);
resultR('S_3 = ',Pi*(b*b-a*a),center(3,3,10,10),3,6);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An12(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1 : begin
      taskText('Дана длина~{L} окружности. Найти ее радиус~{R} и\ площадь~{S} круга,',0,2);
      taskText('ограниченного этой окружностью, учитывая, что {L}~=~2\*\p\*{R},\q  {S}~=~\p\*{R}^2.',0,3);
      taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
    end;
2 : begin
      taskText('Дана площадь~{S} круга. Найти его диаметр~{D} и\ длину~{L} окружности,',0,2);
      taskText('ограничивающей этот круг, учитывая, что {L}~=~\p\*{D},\q  {S}~=~\p\*{D}^2/4.',0,3);
      taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
    end;
end;
a := 5 + Random(1500)/100; //5 + Random*15; //2016.03
case v1 of
1: begin
      dataR('L = ',a,0,3,5);
      resultR('R = ',a/(2*Pi),0,2,5);
      resultR('S = ',a*a/(4*Pi),0,4,5);
   end;
2: begin
      dataR('S = ',a,0,3,5);
      resultR('D = ',2*sqrt(a/Pi),0,2,5);
      resultR('L = ',2*sqrt(Pi*a),0,4,5);
   end;
end;
setNumberOfTests(3);
pause;
end;



procedure SBeg95An13(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Найти расстояние между двумя точками',0,2);
taskText('с\ заданными координатами~{x}_1 и~{x}_2 на\ числовой оси: |{x}_2\;\-\;{x}_1|.',0,4);
(*
Для\ вычисления \Iмодуля\i |{x}| и\ в\ языке \UP, и\ в\ языке \UV используйте функцию Abs({x}).
*)
a := (Random(200) - 90.0)/10;
b := (Random(200) - 90.0)/10;
dataR('x_1 = ',a,xLeft,3,5);
dataR('x_2 = ',b,xRight,3,5);
resultR('',abs(a-b),0,3,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An14(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны три точки~{A}, {B},~{C} на\ числовой оси.',0,2);
taskText('Найти длины отрезков~{AC} и~{BC} и\ их\ сумму.',0,4);
(*
*)
repeat
a := (Random(200) - 99.0)/10;
b := (Random(200) - 99.0)/10;
c := (Random(200) - 99.0)/10;
until (c-a)*(c-b)<0;
dataR('A = ',a,center(1,3,9,15),3,5);
dataR('B = ',b,center(2,3,9,15),3,5);
dataR('C = ',c,center(3,3,9,15),3,5);
resultR('AC = ',abs(a-c),xLeft,2,5);
resultR('BC = ',abs(b-c),xRight,2,5);
resultR('AC + BC = ',abs(a-c)+abs(b-c),0,4,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An15(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны три точки~{A}, {B},~{C} на\ числовой оси.',0,2);
taskText('Точка~{C} расположена между точками~{A} и~{B}.',0,3);
taskText('Найти произведение длин отрезков~{AC} и~{BC}.',0,4);
(*
Длины отрезков вычисляются с\ помощью \Iмодуля\i (функция Abs),
однако правильный ответ можно получить и\ без использования этой функции.
*)
repeat
a := (Random(200) - 99.0)/10;
b := (Random(200) - 99.0)/10;
c := (Random(200) - 99.0)/10;
until (c-a)*(c-b)<0;
dataR('A = ',a,center(1,3,9,15),3,5);
dataR('B = ',b,center(2,3,9,15),3,5);
dataR('C = ',c,center(3,3,9,15),3,5);
resultR('',abs((a-c)*(b-c)),0,3,5);
setNumberOfTests(3);
pause;
end;

function dist(x1,y1,x2,y2:real):real;
begin
dist := sqrt(sqr(x1-x2)+sqr(y1-y2));
end;


procedure SBeg95An16(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны координаты двух противоположных вершин',0,2);
taskText('прямоугольника: ({x}_1,~{y}_1), ({x}_2,~{y}_2).',0,3);
taskText('Стороны прямоугольника параллельны осям координат.',0,4);
taskText('Найти периметр и\ площадь данного прямоугольника.',0,5);
(*
*)
repeat
x1 := (Random(200) - 99.0)/10;
y1 := (Random(200) - 99.0)/10;
x2 := (Random(200) - 99.0)/10;
y2 := (Random(200) - 99.0)/10;
until (x1<>x2) and (y1<>y2);
dataR2('x_1, y_1:',x1,y1,0,2,7);
dataR2('x_2, y_2:',x2,y2,0,4,7);
x := x1;
y := y2;
a := dist(x1,y1,x,y);
b := dist(x2,y2,x,y);
resultR('Периметр: ',2*(a+b),0,2,6);
resultR('Площадь:  ',a*b,0,4,6);
setNumberOfTests(3);
pause;
end;





procedure SBeg95An17(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Найти расстояние между двумя точками',0,2);
taskText('с\ заданными координатами ({x}_1,~{y}_1) и~({x}_2,~{y}_2) на\ плоскости.',0,3);
taskText('Расстояние вычисляется по\ формуле \[\R({x}_2\;\-\;{x}_1)^2\;+\;({y}_2\;\-\;{y}_1)^2\r.\]',0,4);
(*
*)
x1 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
y1 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
x2 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
y2 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
dataR2('x_1, y_1:',x1,y1,xLeft,3,6);
dataR2('x_2, y_2:',x2,y2,xRight,3,6);
resultR('',dist(x1,y1,x2,y2),0,3,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An18(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны координаты трех вершин треугольника: ({x}_1,~{y}_1), ({x}_2,~{y}_2), ({x}_3,~{y}_3).',0,1);
taskText('Найти его периметр и\ площадь, используя формулу для расстояния между двумя',0,2);
taskText('точками на плоскости (см.\ задание \1). Для нахождения площади',0,3);
taskText('треугольника со\ сторонами~{a}, {b}, {c} использовать \Iформулу Герона\i:',0,4);
taskText('\[{S}~=~\R{p}\*({p}\;\-\;{a})\*({p}\;\-\;{b})\*({p}\;\-\;{c})\r,\]'+
         ' где {p}~=~({a}\;+\;{b}\;+\;{c})/2 \= \Iполупериметр\i.',0,5);
(*
*)
x := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
y := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
x1 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
y1 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
x2 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
y2 := (Random(200) - 99.0)/10; //Random*19.9-9.9; //2016.03
dataR2('x_1, y_1:',x,y,0,2,6);
dataR2('x_2, y_2:',x1,y1,0,3,6);
dataR2('x_3, y_3:',x2,y2,0,4,6);
a := dist(x1,y1,x2,y2);
b := dist(x1,y1,x,y);
c := dist(x2,y2,x,y);
d := (a+b+c)/2;
resultR('Периметр: ',a+b+c,0,2,6);
resultR('Площадь:  ',sqrt(d*(d-a)*(d-b)*(d-c)),0,4,6);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An19(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Поменять местами содержимое переменных~{A} и~{B}',0,2);
taskText('и\ вывести новые значения~{A} и~{B}.',0,4);
(*
*)
a := RandomR2(0.1,9.9); //9.99*Random; //2018
b := RandomR2(0.1,9.9); //9.99*Random;
dataR('A = ',a,xLeft,3,4);
dataR('B = ',b,xRight,3,4);
resultComment(' Новые значения переменных:',0,2);
resultR('A = ',b,xLeft,3,4);
resultR('B = ',a,xRight,3,4);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An20(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(9,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Даны переменные~{A}, {B},~{C}. Изменить их\ значения,',0,2);
taskText('переместив содержимое~{A} в~{B}, {B}\ \= в~{C}, {C}\ \= в~{A},',0,3);
taskText('и\ вывести новые значения переменных~{A}, {B},~{C}.',0,4);
(*
*)
end
else
begin
taskText('Даны переменные~{A}, {B},~{C}. Изменить их\ значения,',0,2);
taskText('переместив содержимое~{A} в~{C}, {C}\ \= в~{B}, {B}\ \= в~{A},',0,3);
taskText('и\ вывести новые значения переменных~{A}, {B},~{C}.',0,4);
(*
*)
end;
a := RandomR2(0.1,9.9); //9.99*Random; //2018
b := RandomR2(0.1,9.9); //9.99*Random;
c := RandomR2(0.1,9.9); //9.99*Random;
dataR('A = ',a,center(1,3,8,15),3,4);
dataR('B = ',b,center(2,3,8,15),3,4);
dataR('C = ',c,center(3,3,8,15),3,4);
resultComment(' Новые значения переменных:',0,2);
if v1 = 1 then
  begin
    resultR('A = ',c,center(1,3,8,15),3,4);
    resultR('B = ',a,center(2,3,8,15),3,4);
    resultR('C = ',b,center(3,3,8,15),3,4);
  end
else
  begin
    resultR('A = ',b,center(1,3,8,15),3,4);
    resultR('B = ',c,center(2,3,8,15),3,4);
    resultR('C = ',a,center(3,3,8,15),3,4);
  end;
setNumberOfTests(3);
pause;
end;

procedure SBeg95An21(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(1,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
  taskText('Найти значение функции {y}~=~3{x}^6\;\-\;6{x}^2\;\-\;7',0,2);
  taskText('при данном значении~{x}.',0,4);
(*
*)
  x := 1 + Random(300)/100; //1+3*Random; //2016.03
  y := 3*x*x*x*x*x*x-6*x*x-7;
end
else
begin
  taskText('Найти значение функции {y}~=~4({x}\-3)^6\;\-\;7({x}\-3)^3\;+\;2',0,2);
  taskText('при данном значении~{x}.',0,4);
(*
*)
  x := 1 + Random(600)/100; //1+6*Random; //2016.03
  y := 4*(x-3)*(x-3)*(x-3)*(x-3)*(x-3)*(x-3) - 7*(x-3)*(x-3)*(x-3)+2;
end;
(*
*)
dataR('x = ',x,0,3,4);
resultR('y = ',y,0,3,6);
setNumberOfTests(3);
pause;
end;



procedure SBeg95An22(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Дано число~{A}. Вычислить~{A}^8, используя вспомогательную переменную',0,2);
taskText('и\ три операции умножения. Для этого последовательно находить {A}^2, {A}^4, {A}^8.',0,3);
taskText('Вывести все найденные степени числа~{A}.',0,4);
(*
*)
a := 1 + Random(300)/100; //1+3*Random; //2016.03
dataR('A = ',a,0,3,4);
b := a*a;
c := b*b;
resultR('A^2 = ',b,center(1,3,10,8),3,4);
resultR('A^4 = ',c,center(2,3,10,8),3,4);
resultR('A^8 = ',c*c,center(3,3,10,8),3,4);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An23(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано число~{A}. Вычислить {A}^{15}, используя две вспомогательные переменные',0,2);
taskText('и\ пять операций умножения. Для этого последовательно находить {A}^2, {A}^3,',0,3);
taskText('{A}^5, {A}^{10}, {A}^{15}. Вывести все найденные степени числа~{A}.',0,4);
(*
*)
a := 1 + Random(300)/100; //1+3*Random; //2016.03
dataR('A = ',a,0,3,4);
b := a*a;
c := a*b;
resultR('A^2 = ',b,center(1,3,10,8),2,4);
resultR('A^3 = ',c,center(2,3,10,8),2,4);
resultR('A^5 = ',b*c,center(3,3,10,8),2,4);
resultR('A^{10} = ',b*b*c*c,center(1,2,10,14),4,4);
resultR('A^{15} = ',b*b*c*c*b*c,center(2,2,10,14),4,4);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An24(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(4,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Дано значение угла~\a в\ градусах (0~\l~\a~<~360). Определить значение',0,2);
taskText('этого\ же угла в\ радианах, учитывая, что 180\o = \p радианов.',0,3);
taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
s1 := 'градус';
s2 := 'радиан';
a := Random(36000)/100; //Random*360; //2016.03
b := a/180*Pi;
end
else
begin
taskText('Дано значение угла~\a в\ радианах (0~\l~\a~<~2\*\p). Определить значение',0,2);
taskText('этого\ же угла в\ градусах, учитывая, что 180\o = \p радианов.',0,3);
taskText('В\ качестве значения~\p использовать~3.14.',0,4);
(*
*)
s1 := 'радиан';
s2 := 'градус';
a := Random(2*314)/100; //Random*2*Pi; //2016.03
b := a/Pi*180;
end;
dataR('Угол \a ('+s1+'ы): ',a,0,3,6);
resultR('Угол \a ('+s2+'ы): ',b,0,3,6);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An25(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(5,2,0,0,v1,v2,v3);
a := Random(12000)/100; //120*Random; //2016.03
if v1 = 1 then
begin
taskText('Дано значение температуры~{T} в\ градусах Фаренгейта.',0,2);
taskText('Определить значение этой\ же температуры в\ градусах Цельсия.',0,3);
taskText('Температура по Цельсию~{T}_C и\ температура по Фаренгейту~{T}_F',0,4);
taskText('связаны следующим соотношением:\[ {T}_C = ({T}_F \- 32)\*5/9.\]',0,5);
(*
*)
s3 := '(по Фаренгейту): ';
s :=  '(по Цельсию):    ';
a := Random(12000)/100; //120*Random; //2016.03
b := (a-32)*5/9;
end
else
begin
taskText('Дано значение температуры {T} в градусах Цельсия.',0,2);
taskText('Определить значение этой же температуры в градусах Фаренгейта.',0,3);
taskText('Температура по Цельсию~{T}_C и\ температура по Фаренгейту~{T}_F',0,4);
taskText('связаны следующим соотношением:\[ {T}_C = ({T}_F \- 32)\*5/9.\]',0,5);
(*
*)
s :=  '(по Фаренгейту): ';
s3 := '(по Цельсию):    ';
a := Random(7000)/100-20; //70*Random-20; //2016.03
b := a*9/5+32;
end;
dataR('T '+s3,a,0,3,6);
resultR('T '+s,b,0,3,6);
setNumberOfTests(3);
pause;
end;


procedure SBeg95An26(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Известно, что {X}~кг конфет стоит {A}~рублей.',0,2);
taskText('Определить, сколько стоит 1~кг и\ {Y}~кг этих\ же конфет.',0,4);
(*
*)
x1 := (5.0+Random(46))/10;
y := (150.0+Random(850))/10;
y1 := x1 * y;
repeat
x2 := (5.0+Random(46))/10;
until x2 <> x1;
setprecision(3);
dataR('X = ',x1,xleft,2,5);
setprecision(2);
dataR('A = ',y1,xright,2,6);
setprecision(3);
dataR('Y = ',x2,0,4,5);
setprecision(2);
resultR('Стоимость 1 кг конфет: ',y,0,2,6);
resultR('Стоимость Y кг конфет: ',x2*y,0,4,6);
end;
2:
begin
taskText('Известно, что {X}~кг шоколадных конфет стоит {A}~рублей,',0,2);
taskText('а\ {Y}~кг ирисок стоит {B}~рублей. ',0,3);
taskText('Определить, сколько стоит 1~кг шоколадных конфет, 1~кг ирисок,',0,4);
taskText('а\ также во\ сколько раз шоколадные конфеты дороже ирисок.',0,5);
(*
*)
x1 := (5.0+Random(46))/10;
x2 := (5.0+Random(46))/10;
repeat
y := (100.0+Random(350))/10;
a := (20.0+Random(40))/10;
until a*y<100;
y1 := x1 * y;
y2 := x2 * y * a;
setprecision(3);
dataR('X = ',x1,xleft,2,5);
setprecision(2);
dataR('A = ',a*x1*y,xright,2,6);
setprecision(3);
dataR('Y = ',x2,xleft,4,5);
setprecision(2);
dataR('B = ',x2*y,xright,4,6);
setprecision(2);
resultR('Стоимость 1 кг шоколадных конфет: ',a*y,0,2,6);
resultR('Стоимость 1 кг ирисок:            ',y,0,3,6);
resultR('Во сколько раз шоколадные конфеты дороже ирисок: ',a,0,4,3);

end;
end;
setNumberOfTests(3);
pause;
end;



procedure SBeg95An27(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Скорость лодки в\ стоячей воде {V}~км/ч, скорость течения реки {U}~км/ч ({U}~<~{V}).',0,1);
taskText('Время движения лодки по озеру {T}_1~ч, а\ по\ реке (против течения)\ \= {T}_2~ч.',0,2);
taskText('Определить путь {S}, пройденный лодкой (путь = время \* скорость).',0,3);
taskText('Учесть, что при движении против течения',0,4);
taskText('скорость лодки уменьшается на\ величину скорости течения.',0,5);
(*
*)
a := 5+Random(5);
b := 1+Random(3);
x1 := Random(4)+1;
x2 := Random(4)+1;
dataR('V  = ',a,xLeft,2,4);
dataR('U  = ',b,xRight,2,4);
dataR('T_1 = ',x1,xLeft,4,4);
dataR('T_2 = ',x2,xRight,4,4);
resultR('S = ',x1*a+x2*(a-b),0,3,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An28(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Скорость первого автомобиля {V}_1~км/ч, второго\ \= {V}_2~км/ч, расстояние',0,1);
taskText('между ними {S}~км. Определить расстояние между ними через {T}~часов, если',0,2);
taskText('автомобили удаляются друг от\ друга, двигаясь в противоположных направлениях.',0,3);
taskText('Данное расстояние равно сумме начального расстояния и\ общего пути,',0,4);
taskText('проделанного автомобилями; общий путь = время \* суммарная скорость.',0,5);
(*
*)
end;
2:
begin
taskText('Скорость первого автомобиля {V}_1~км/ч, второго\ \= {V}_2~км/ч, расстояние',0,1);
taskText('между ними {S}~км. Определить расстояние между ними через {T}~часов,',0,2);
taskText('если автомобили первоначально движутся навстречу друг другу.',0,3);
taskText('Данное расстояние равно модулю разности начального расстояния и\ общего',0,4);
taskText('пути, проделанного автомобилями; общий путь = время \* суммарная скорость.',0,5);
(*
*)
end;
end;
a := 50+Random(4)*10;
b := 50+Random(4)*10;
c := 20+Random(20)*10;
d := Random(4)+1;
dataR('V_1 = ',a,xLeft,2,4);
dataR('V_2 = ',b,xRight,2,4);
dataR('S  = ',c,xLeft,4,6);
dataR('T  = ',d,xRight,4,4);
case v1 of
1: x := c + (a+b)*d;
2: x := abs(c-(a+b)*d);
end;
resultR('',x,0,3,6);
setNumberOfTests(3);
pause;
end;


procedure SBeg95An29(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Решить линейное уравнение {A}\*{x}\;+\;{B}~=~0, заданное своими',0,2);
taskText('коэффициентами~{A} и~{B} (коэффициент~{A} не~равен~0).',0,4);
(*
*)
a := Random(20)-10.0;
if a = 0 then a := 2.0;
x := Random(20)-10.0;
dataR('A = ',a,xLeft,3,6);
dataR('B = ',-a*x,xRight,3,6);
resultR('x = ',x,0,3,6);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An30(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Найти корни \Iквадратного уравнения\i {A}\*{x}^2\;+\;{B}\*{x}\;+\;{C}~=~0, заданного',0,1);
taskText('своими коэффициентами {A}, {B}, {C} ({A}~>~0), если известно,',0,2);
taskText('что дискриминант уравнения положителен. Вывести вначале меньший, а\ затем',0,3);
taskText('больший из\ найденных корней. Корни квадратного уравнения находятся по\ формуле',0,4);
taskText('\[{x}_{1,\,2} = (\-{B}\;\+\;\R{D}\r)/(2\*{A}),\] где {D}\ \= \Iдискриминант\i, равный {B}^2\;\-\;4\*{A}\*{C}.',0,5);
(*
*)
a := Random(5)+1;
x1 := random(11)-5.0;
x2 := x1 + random(5)+1;
b := -a*(x1+x2);
c := a*x1*x2;
dataR('A = ',a,center(1,3,8,15),3,6);
dataR('B = ',b,center(2,3,8,15),3,6);
dataR('C = ',c,center(3,3,8,15),3,6);
resultR('Меньший корень: ',x1,0,2,5);
resultR('Больший корень: ',x2,0,4,5);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An31(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Найти решение \Iсистемы линейных уравнений\i вида',0,1);
taskText('\[{A}_1\*{x}\;+\;{B}_1\*{y} = {C}_1,\|   {A}_2\*{x}\;+\;{B}_2\*{y} = {C}_2,\]',0,2);
taskText('заданной своими коэффициентами {A}_1, {B}_1, {C}_1, {A}_2, {B}_2, {C}_2, если известно,',0,3);
taskText('что\ данная система имеет единственное решение. Воспользоваться формулами',0,4);
taskText('\[{x} = ({C}_1\*{B}_2\;\-\;{C}_2\*{B}_1)/{D},\Q    {y} = ({A}_1\*{C}_2\;\-\;{A}_2\*{C}_1)/{D},'+
         '\|  где {D} = {A}_1\*{B}_2\;\-\;{A}_2\*{B}_1.\]',0,5);
(*
*)
repeat
a1 := integer(Random(10))-5;
b1 := integer(Random(10))-5;
a2 := integer(Random(10))-5;
b2 := integer(Random(10))-5;
until a1*b2-a2*b1 <> 0;
x := integer(Random(10))-5;;
y := integer(Random(10))-5;;
c1 := a1*x+b1*y;
c2 := a2*x+b2*y;
dataR('A_1 = ',a1,center(1,3,11,10),2,6);
dataR('B_1 = ',b1,center(2,3,11,10),2,6);
dataR('C_1 = ',c1,center(3,3,11,10),2,6);
dataR('A_2 = ',a2,center(1,3,11,10),4,6);
dataR('B_2 = ',b2,center(2,3,11,10),4,6);
dataR('C_2 = ',c2,center(3,3,11,10),4,6);
resultR(' x = ',x,0,2,6);
resultR(' y = ',y,0,4,6);
setNumberOfTests(3);
pause;
end;


procedure SBeg95An32(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An33(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;


procedure SBeg95An34(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An35(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An36(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic1,Author,Key,3{level1});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An37(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(1,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Дано расстояние~{L} в\ сантиметрах. Используя операцию деления нацело,',0,2);
taskText('найти количество полных метров в\ нем (1~метр~=~100~см).',0,4);
(*
*)
n := 50 + Random(9950);
  dataN('L (сантиметров):   ',n,0,3,4);
resultN('L (полных метров): ',n div 100,0,3,4);
end
else
begin
taskText('Дана масса~{M} в\ килограммах. Используя операцию деления нацело,',0,2);
taskText('найти количество полных тонн в\ ней (1~тонна~=~1000~кг).',0,4);
(*
*)
n := 200 + Random(9800);
  dataN('M (килограммов): ',n,0,3,4);
resultN('M (полных тонн): ',n div 1000,0,3,4);
end;
setNumberOfTests(3);
pause;
end;

procedure SBeg95An38(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);

taskText('Дан размер файла в байтах. Используя операцию деления нацело,',0,2);
taskText('найти количество полных килобайтов, которые занимает данный файл',0,3);
taskText('(1~килобайт~=~1024~байта).',0,4);
(*
*)
n := 1024*(Random(30)+1);
if Random(2)=0 then n := n - Random(100)
else n := n + Random(1000);
  dataN('Размер в байтах: ',n,0,3,5);
resultN('Полных килобайтов: ',n div 1024,0,3,3);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An39(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level1});(*DEMO*)
getVariant(9,2,0,0,v1,v2,v3);
if v1 = 1 then
begin
taskText('Даны целые положительные числа~{A} и~{B} ({A}~>~{B}).',0,1);
taskText('На\ отрезке длины~{A} размещено максимально возможное',0,2);
taskText('количество отрезков длины~{B} (без\ наложений).',0,3);
taskText('Используя операцию деления нацело,',0,4);
taskText('найти количество отрезков~{B}, размещенных на\ отрезке~{A}.',0,5);
(*
*)
end
else
begin
taskText('Даны целые положительные числа~{A} и~{B} ({A}~>~{B}).',0,1);
taskText('На\ отрезке длины~{A} размещено максимально возможное',0,2);
taskText('количество отрезков длины~{B} (без\ наложений).',0,3);
taskText('Используя операцию взятия остатка от\ деления нацело,',0,4);
taskText('найти длину незанятой части отрезка~{A}.',0,5);
(*
*)
end;
n1 := 20 + Random(51);
n2 := 2 + Random(18);
dataN('A = ',n1,xleft,3,2);
dataN('B = ',n2,xright,3,2);
if v1 = 1 then
resultN('Количество отрезков: ',n1 div n2,0,3,2)
else
resultN('Длина незанятой части: ',n1 mod n2,0,3,2);
setNumberOfTests(3);
pause;
end;




procedure SBeg95An40(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Дано двузначное число. Вывести вначале его левую цифру (десятки),',0,2);
taskText('а\ затем\ \= его правую цифру (единицы).',0,3);
taskText('Для\ нахождения десятков использовать операцию деления нацело,',0,4);
taskText('для\ нахождения единиц\ \= операцию взятия остатка от\ деления.',0,5);
(*
*)
n := 10 + Random(90);
dataN('',n,0,3,2);
resultN('Десятки: ',n div 10,xLeft,3,1);
resultN('Единицы: ',n mod 10,xRight,3,1);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An41(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Дано двузначное число.',0,2);
taskText('Найти сумму и\ произведение его цифр.',0,4);
(*
*)
k := 1+ Random(9);
n := Random(10);
dataN('',k*10+n,0,3,2);
resultN('Сумма: ',k+n,xLeft,3,2);
resultN('Произведение: ',k*n,xRight,3,2);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An42(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано двузначное число.',0,2);
taskText('Вывести число, полученное при перестановке цифр исходного числа.',0,4);
(*
*)
k := 1+ Random(9);
n := Random(10);
dataN('',k*10+n,0,3,2);
resultN('',n*10+k,0,3,2);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An43(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число. Используя одну операцию деления нацело,',0,2);
taskText('вывести первую цифру данного числа (сотни).',0,4);
(*
*)
n := 100+Random(900);
dataN('',n,0,3,3);
resultN('',n div 100,0,3,1);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An44(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число. Вывести вначале его последнюю цифру (единицы),',0,2);
taskText('а\ затем\ \= его среднюю цифру (десятки).',0,4);
(*
После нахождения последней цифры (операцией взятия остатка от деления на 10) удалить
эту цифру из\ исходного числа (операцией деления нацело на 10) и\ для полученного
(двузначного) числа снова воспользоваться операцией взятия остатка.
*)
k := 1+ Random(9);
m := Random(10);
n := Random(10);
dataN('',k*100+m*10+n,0,3,3);
resultN('Единицы: ',n,xLeft,3,1);
resultN('Десятки: ',m,xRight,3,1);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An45(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число.',0,2);
taskText('Найти сумму и\ произведение его цифр.',0,4);
(*
Воспользоваться приемом, описанным в\ указании к\ заданию \1.
*)
k := 1+ Random(9);
m := Random(10);
n := Random(10);
dataN('',k*100+m*10+n,0,3,3);
resultN('Сумма: ',k+m+n,xLeft,3,2);
resultN('Произведение: ',k*m*n,xRight,3,3);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An46(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число.',0,2);
taskText('Вывести число, полученное при прочтении исходного числа справа налево.',0,4);
(*
*)
k := 1+ Random(9);
m := Random(10);
n := Random(10);
dataN('',k*100+m*10+n,0,3,3);
resultN('',k+m*10+n*100,0,3,3);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An47(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(6,2,0,0,v1,v2,v3);
k := 1+ Random(9);
m := Random(10);
n := Random(10);
if v1 = 1 then
  begin
taskText('Дано трехзначное число.',0,2);
taskText('В\ нем зачеркнули первую слева цифру и\ приписали ее справа.',0,3);
taskText('Вывести полученное число.',0,4);
(*
*)
    n1 := m*100+n*10+k;
  end
else
  begin
taskText('Дано трехзначное число.',0,2);
taskText('В\ нем зачеркнули первую справа цифру и\ приписали ее слева.',0,3);
taskText('Вывести полученное число.',0,4);
(*
*)
    n1 := n*100+k*10+m;
  end;
dataN('',k*100+m*10+n,0,3,3);
resultN('',n1,0,3,3);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An48(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(7,2,0,0,v1,v2,v3);
k := 1+ Random(9);
m := Random(10);
n := Random(10);
if v1 = 1 then
  begin
taskText('Дано трехзначное число. Вывести число, полученное при перестановке цифр',0,2);
taskText('сотен и\ десятков исходного числа (например, 123 перейдет в\ 213).',0,4);
(*
*)
    n1 := m*100+k*10+n;
  end
else
  begin
taskText('Дано трехзначное число. Вывести число, полученное при перестановке цифр',0,2);
taskText('десятков и\ единиц исходного числа (например, 123 перейдет в\ 132).',0,4);
(*
*)
    n1 := k*100+n*10+m;
  end;
dataN('',k*100+m*10+n,0,3,3);
resultN('',n1,0,3,3);
setNumberOfTests(3);
pause;
end;

procedure SBeg95An49(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(8,2,0,0,v1,v2,v3);
n := 1000 + Random(31000);
if v1 = 1 then
  begin
taskText('Дано целое число, большее 999. Используя одну операцию',0,2);
taskText('деления нацело и\ одну операцию взятия остатка от деления,',0,3);
taskText('найти цифру, соответствующую разряду сотен в\ записи этого числа.',0,4);
(*
*)
    n1 := (n div 100) mod 10;
  end
else
  begin
taskText('Дано целое число, большее 999. Используя одну операцию',0,2);
taskText('деления нацело и\ одну операцию взятия остатка от деления,',0,3);
taskText('найти цифру, соответствующую разряду тысяч в\ записи этого числа.',0,4);
(*
*)
    n1 := (n div 1000) mod 10;
  end;
dataN('',n,0,3,6);
resultN('',n1,0,3,1);
setNumberOfTests(3);
pause;
end;




procedure SBeg95An50(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
case Random(4) of
0..2: n := 1 + Random(8*60*60);
3: n := 1 + Random(700);
end;
taskText('С\ начала суток прошло {N}~секунд ({N}\ \= целое).',0,2);
taskText('Найти количество полных минут, прошедших с\ начала суток.',0,4);
(*
*)
   n1 :=n div 60;
dataN('N = ',n,0,3,5);
resultN('',n1,0,3,2);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An51(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
case Random(4) of
0..2: n := 1 + Random(8*60*60);
3: n := 1 + Random(700);
end;
taskText('С\ начала суток прошло {N}~секунд ({N}\ \= целое).',0,2);
taskText('Найти количество полных часов, прошедших с\ начала суток.',0,4);
(*
*)
   n1 :=n div 3600;
dataN('N = ',n,0,3,5);
resultN('',n1,0,3,2);
setNumberOfTests(5);
pause;
end;





procedure SBeg95An52(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(9,3,0,0,v1,v2,v3);
case Random(4) of
0..2: n := 1 + Random(8*60*60);
3: n := 1 + Random(700);
end;
case v1 of
1: begin
taskText('С\ начала суток прошло {N}~секунд ({N}\ \= целое).',0,2);
taskText('Найти количество секунд, прошедших с\ начала последней минуты.',0,4);
(*
*)
   n1 :=n mod 60;
   end;
2: begin
taskText('С\ начала суток прошло {N}~секунд ({N}\ \= целое).',0,2);
taskText('Найти количество секунд, прошедших с\ начала последнего часа.',0,4);
(*
*)
   n1 :=n mod 3600;
   end;
3: begin
taskText('С\ начала суток прошло {N}~секунд ({N}\ \= целое).',0,2);
taskText('Найти количество полных минут, прошедших с\ начала последнего часа.',0,4);
(*
*)
   n1 :=(n mod 3600) div 60;
   end;
end;
dataN('N = ',n,0,3,5);
resultN('',n1,0,3,2);
setNumberOfTests(5);
pause;
end;









procedure SBeg95An53(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дни недели пронумерованы следующим образом: 0\ \= воскресенье, 1\ \= понедельник,',0,2);
taskText('2\ \= вторник,~\., 6\ \= суббота. Дано целое число~{K}, лежащее в\ диапазоне 1\:365.',0,3);
taskText('Определить номер дня недели для {K}-го дня года, если известно,',0,4);
taskText('что в\ этом году 1~января было понедельником.',0,5);
(*
Использовать операцию взятия остатка от деления нацело на 7.
*)
if Random(3)<>0 then k := Random(7)+1
else k := Random(365)+1;
dataN('K = ',k,0,3,1);
resultN('Номер дня недели:',k mod 7,0,3,2);
setNumberOfTests(6);
pause;
end;

procedure SBeg95An54(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Дни недели пронумерованы следующим образом: 0\ \= воскресенье, 1\ \= понедельник,',0,2);
taskText('2\ \= вторник,~\., 6\ \= суббота. Дано целое число~{K}, лежащее в\ диапазоне 1\:365.',0,3);
taskText('Определить номер дня недели для {K}-го дня года, если известно,',0,4);
taskText('что в\ этом году 1~января было четвергом.',0,5);
(*
*)
if Random(3)<>0 then k := Random(7)+1
else k := Random(365)+1;
dataN('K = ',k,0,3,1);
resultN('Номер дня недели:',(k+3) mod 7,0,3,2);
setNumberOfTests(6);
pause;
end;

procedure SBeg95An55(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дни недели пронумерованы следующим образом: 1\ \= понедельник, 2\ \= вторник,~\.,',0,2);
taskText('6\ \= суббота, 7\ \= воскресенье. Дано целое число~{K}, лежащее в\ диапазоне 1\:365.',0,3);
taskText('Определить номер дня недели для {K}-го дня года, если известно,',0,4);
taskText('что в\ этом году 1~января было вторником.',0,5);
(*
Использовать операцию взятия остатка от деления нацело с\ дополнительным смещением:
{k}~mod~7\;+\;1 (в \UP), {k}~\\~7\;+\;1 ( в \UV).
*)
if Random(3)<>0 then k := Random(7)+1
else k := Random(365)+1;
dataN('K = ',k,0,3,1);
resultN('Номер дня недели:',k mod 7 + 1,0,3,2);
setNumberOfTests(6);
pause;
end;

procedure SBeg95An56(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дни недели пронумерованы следующим образом: 1\ \= понедельник, 2\ \= вторник,~\.,',0,2);
taskText('6\ \= суббота, 7\ \= воскресенье. Дано целое число~{K}, лежащее в\ диапазоне 1\:365.',0,3);
taskText('Определить номер дня недели для {K}-го дня года, если известно,',0,4);
taskText('что в\ этом году 1~января было субботой.',0,5);
(*
*)
if Random(3)<>0 then k := Random(7)+1
else k := Random(365)+1;
dataN('K = ',k,0,3,1);
resultN('Номер дня недели:',(k+4) mod 7 + 1,0,3,2);
setNumberOfTests(6);
pause;
end;

procedure SBeg95An57(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Дни недели пронумерованы следующим образом:',0,1);
taskText('1\ \= понедельник, 2\ \= вторник,~\., 6\ \= суббота, 7\ \= воскресенье.',0,2);
taskText('Дано целое число~{K}, лежащее в\ диапазоне 1\:365, и\ целое число~{N},',0,3);
taskText('лежащее в\ диапазоне 1\:7. Определить номер дня недели для {K}-го дня года,',0,4);
taskText('если известно, что в\ этом году 1~января было днем недели с\ номером~{N}.',0,5);
(*
*)
if Random(3)<>0 then k := Random(7)+1
else k := Random(365)+1;
n := 1 + Random(7);
dataN('K = ',k,xLeft,3,1);
dataN('N = ',n,xRight,3,1);
resultN('Номер дня недели:',(k+n-2) mod 7 + 1,0,3,2);
setNumberOfTests(6);
pause;
end;


procedure SBeg95An58(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны целые положительные числа~{A}, {B},~{C}.',0,1);
taskText('На\ прямоугольнике размера~{A}\;\x\;{B} размещено максимально возможное',0,2);
taskText('количество квадратов со\ стороной~{C} (без\ наложений).',0,3);
taskText('Найти количество квадратов, размещенных на\ прямоугольнике,',0,4);
taskText('а\ также площадь незанятой части прямоугольника.',0,5);
(*
*)
k := 10 + Random(50);
m := 10 + Random(50);
n := 2 + Random(10);
n1 := (k div n)*(m div n);
dataN('A = ',k,xleft,3,2);
dataN('B = ',m,0,3,2);
dataN('C = ',n,xright,3,2);
resultN('Количество квадратов:    ',n1,0,2,3);
resultN('Площадь незанятой части: ',k*m-n1*n*n,0,4,3);
setNumberOfTests(3);
pause;
end;



procedure SBeg95An59(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic2,Author,Key,6{level2});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Дан номер некоторого года (целое положительное число).',0,2);
taskText('Определить соответствующий ему номер столетия,',0,3);
taskText('учитывая, что, к\ примеру, началом 20~столетия был 1901\ год.',0,4);
(*
*)
n := Random(25);
m := n+1;
n := n*100;

case curtest of //2012
2: n := n+100;
4: n := n+Random(99)+1;
else
if Random(3)=0 then n := n+100
else n := n+Random(99)+1;
end;
dataN('',n,0,3,4);
resultN('',m,0,3,2);
setNumberOfTests(6);
pause;
end;

procedure SBeg95An60(Name, Key: string);
var v1,v2,v3 : byte;
begin
 start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;

procedure SBeg95An61(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Дано целое число~{A}. Проверить истинность высказывания:',0,2);
taskText('\<Число~{A} является положительным\>.',0,4);
(*
*)
case curtest of //2012
3: n := 0;
6: n := -Random(100);
8: n := Random(100);
else
if Random(3)=0 then n := 0
else
  n := Integer(Random(200)) - 99;
end;
dataN('A = ',n,0,3,3);
resultB('',n>0,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An62(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(2,2,0,0,v1,v2,v3);
case curtest of //2012
2: n := Random(100);
6: n := -Random(100);
else
n := Integer(Random(200)) - 99;
end;
//if n = 0 then n := 1; //2012
if v1 = 1 then
begin
s := 'не';
bln := Odd(n);
taskText('Дано целое число~{A}. Проверить истинность высказывания:',0,2);
taskText('\<Число~{A} является нечетным\>.',0,4);
(*
Нечетное число {A} дает ненулевой остаток при делении
нацело на~2: {A}~mod~2~\n~0; для проверки четности {A} используется
противоположное условие: {A}~mod~2~=~0. В \UP можно также воспользоваться функцией Odd({A}),
которая возвращает \t, если число~{A} нечетное, и\ \f, если~{A} четное.
*)
end
else
begin
s := '';
bln := not Odd(n);
taskText('Дано целое число~{A}. Проверить истинность высказывания:',0,2);
taskText('\<Число~{A} является четным\>.',0,4);
(*
+
*)
end;
dataN('A = ',n,0,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An63(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(3,2,0,0,v1,v2,v3);
j := 2; //2019
if v1 = 1 then
begin
m := integer(Random(7))-1;
n := integer(Random(7));
bln := (m>2) and (n<=3);
if m <= 2 then //2019
  j := 1;      //2019
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Справедливы неравенства {A}~>~2 и~{B}~\l~3\>.',0,4);
(*
Использовать операцию\ and (\Iлогическое И\i):
({A}~>~2) and ({B}~<=~3)
(в \UP скобки являются обязательными).
*)
end
else
begin
m := integer(Random(7))-3;
n := integer(Random(7))-5;
bln := (m>=0) or (n<-2);
if m >= 0 then //2019
  j := 1;      //2019
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Справедливы неравенства {A}~\g~0 или\ {B}~<~\-2\>.',0,4);
(*
Использовать операцию\ or (\Iлогическое ИЛИ\i):
({A}~>=~0) or ({B}~<~\-2)
(в \UP скобки являются обязательными).
*)
end;
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,xRight,3,2);
resultB('',bln,0,3);
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An64(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Справедливо двойное неравенство {A}~<~{B}~<~{C}\>.',0,4);
(*
*)
m := Random(100);
n := Random(100);
k := Random(100);
if (curtest = 4) or (Random(3)=0) then //2012
  while not ((m<n)and(n<k)) do
    begin
      m := Random(100);
      n := Random(100);
      k := Random(100);
    end;
dataN('A = ',m,xleft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xright,3,2);
resultB('',(m<n)and(n<k),0,3);
j := 3; 
if m >= n then 
  j := 2;      
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An65(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);

taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Число~{B} находится между числами~{A} и~{C}\>.',0,4);
(*
*)
m := Random(100);
n := Random(100);
k := Random(100);
cur := curtest; //2012
if (cur in [2,7]) or (Random(3)=0) then
begin
  while (m-n)*(n-k)<=0 do
    begin
      m := Random(100);
      n := Random(100);
      k := Random(100);
    end;
  case cur of
  2: if m < k then swap(m,k);
  7: if m > k then swap(m,k);
  end;
end;
dataN('A = ',m,xleft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xright,3,2);
resultB('',(m-n)*(n-k)>0,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An66(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Каждое из\ чисел~{A} и~{B} нечетное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
//if m = 0 then m := 1; //2012
n := integer(Random(19))-9;
//if n = 0 then n := 2; //2012
bln := Odd(m) and Odd(n);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,xRight,3,2);
resultB('',bln,0,3);
j := 2;
if not Odd(m) then j := 1;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An67(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Хотя\ бы одно из\ чисел~{A} и~{B} нечетное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
//if m = 0 then m := 1; //2012
n := integer(Random(19))-9;
//if n = 0 then n := 2; //2012
bln := Odd(m) or Odd(n);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,xRight,3,2);
resultB('',bln,0,3);
j := 2;
if Odd(m) then j := 1;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An68(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Ровно одно из\ чисел~{A} и~{B} нечетное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
//if m = 0 then m := 1; //2012
n := integer(Random(19))-9;
//if n = 0 then n := 2; //2012
bln := Odd(m+n);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,xRight,3,2);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;


procedure SBeg95An69(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны два целых числа: {A},~{B}. Проверить истинность высказывания:',0,2);
taskText('\<Числа~{A} и~{B} имеют одинаковую четность\>.',0,4);
(*
*)
m := integer(Random(19))-9;
//if m = 0 then m := 1; //2012
n := integer(Random(19))-9;
//if n = 0 then n := 2; //2012
bln := not Odd(m+n);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,xRight,3,2);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;



procedure SBeg95An70(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Каждое из\ чисел~{A}, {B},~{C} положительное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
n := integer(Random(19))-9;
k := integer(Random(19))-9;
if (curtest=7) or (Random(3)=0) then //2012
  while not ((m>0)and(n>0)and(k>0)) do
    begin
      m := integer(Random(19))-9;
      n := integer(Random(19))-9;
      k := integer(Random(19))-9;
    end;
bln := (m>0)and(n>0)and(k>0);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xRight,3,2);
resultB('',bln,0,3);
j := 3;
if m<=0 then j := 1
else
  if n<=0 then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An71(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Хотя\ бы одно из\ чисел~{A}, {B},~{C} положительное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
n := integer(Random(19))-9;
k := integer(Random(19))-9;
if (curtest=4) or (Random(3)=0) then //2012
  while not ((m<=0)and(n<=0)and(k<=0)) do
    begin
      m := integer(Random(19))-9;
      n := integer(Random(19))-9;
      k := integer(Random(19))-9;
    end;
bln := (m>0)or(n>0)or(k>0);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xRight,3,2);
resultB('',bln,0,3);
j := 3;
if m>0 then j := 1
else
  if n>0 then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An72(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Ровно одно из\ чисел~{A}, {B},~{C} положительное\>.',0,4);
(*
*)
m := integer(Random(19))-9;
n := integer(Random(19))-9;
k := integer(Random(19))-9;
if (curtest=6) or (Random(3)=0) then //2012
  while not ((m>0)and(n<=0)and(k<=0)or(m<=0)and(n>0)and(k<=0)or
             (m<=0)and(n<=0)and(k>0)) do
    begin
      m := integer(Random(19))-9;
      n := integer(Random(19))-9;
      k := integer(Random(19))-9;
    end;
bln := (m>0)and(n<=0)and(k<=0)or(m<=0)and(n>0)and(k<=0)or
             (m<=0)and(n<=0)and(k>0);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xRight,3,2);
resultB('',bln,0,3);
j := 3;
if (m>0) and (n>0) then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An73(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны три целых числа: {A}, {B},~{C}. Проверить истинность высказывания:',0,2);
taskText('\<Ровно два из\ чисел~{A}, {B},~{C} являются положительными\>.',0,4);
(*
*)
m := integer(Random(19))-9;
n := integer(Random(19))-9;
k := integer(Random(19))-9;
if (curtest=2) or (Random(3)=0) then //2012
  while not ((m>0)and(n>0)and(k<=0)or(m<=0)and(n>0)and(k>0)or
             (m>0)and(n<=0)and(k>0)) do
    begin
      m := integer(Random(19))-9;
      n := integer(Random(19))-9;
      k := integer(Random(19))-9;
    end;
bln := (m>0)and(n>0)and(k<=0)or(m<=0)and(n>0)and(k>0)or
             (m>0)and(n<=0)and(k>0);
dataN('A = ',m,xLeft,3,2);
dataN('B = ',n,0,3,2);
dataN('C = ',k,xRight,3,2);
resultB('',bln,0,3);
j := 3;
if (m<=0) and (n<=0) then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An74(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(2,2,0,0,v1,v2,v3);
case v1 of
1: begin s1 := ''; s2 := 'дву'; n1 := 2;
taskText('Дано целое положительное число. Проверить истинность высказывания:',0,2);
taskText('\<Данное число является четным двузначным\>.',0,4);
(*
*)
   end;
2: begin s1 := 'не'; s2 := 'трех'; n1 := 3;
taskText('Дано целое положительное число. Проверить истинность высказывания:',0,2);
taskText('\<Данное число является нечетным трехзначным\>.',0,4);
(*
*)
   end;
end;
//n := Random(2); //2012
//while True do
//  begin
    case Random(4) of
    0: k :=1+Random(9);
    1: k :=10+Random(90);
    2: k :=100+Random(900);
    3: k :=1000+Random(9000);
    end;
    case curtest of //2012
    4: k :=1000+Random(9000);
    5: repeat k :=100+Random(900) until odd(k);
    7: k :=1+Random(9);
    8: repeat k :=10+Random(90) until not odd(k);
    end;
    if v1=1 then bln := not Odd(k)
    else bln := Odd(k);
    if v1=1 then bln := bln and (10<=k) and (k<=99)
    else bln := bln and (100<=k) and (k<=999);
//    case n of
//    0 : if bln then break;
//    1 : if not bln then break;
//    end;
//  end;
dataN('',k,0,3,4);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An75(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(3,2,0,0,v1,v2,v3);
case v1 of
1:
begin
taskText('Проверить истинность высказывания:',0,2);
taskText('\<Среди трех данных целых чисел есть',0,3);
taskText('хотя\ бы одна пара совпадающих\>.',0,4);
(*
*)
end;
2:
begin
taskText('Проверить истинность высказывания:',0,2);
taskText('\<Среди трех данных целых чисел есть',0,3);
taskText('хотя\ бы одна пара взаимно противоположных\>.',0,4);
(*
*)
end;
end;
n := Random(2);
while True do
  begin
    n1 := integer(Random(20))-9;
    n2 := integer(Random(20))-9;
    n3 := integer(Random(20))-9;
    if v1 = 1 then bln := (n1=n2)or(n1=n3)or(n2=n3)
    else bln := (n1=-n2)or(n1=-n3)or(n2=-n3);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN('',n1,center(1,3,2,15),3,2);
dataN('',n2,center(2,3,2,15),3,2);
dataN('',n3,center(3,3,2,15),3,2);
resultB('',bln,0,3);
j := 3;
if (v1=1) and (n1=n2) or (v1=2) and (n1=-n2) then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An76(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число. Проверить истинность высказывания:',0,2);
taskText('\<Все цифры данного числа различны\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    n1 := 100+Random(900);
    n2 := n1 div 100;
    n3 := (n1 mod 100) div 10;
    n4 := (n1 mod 100) mod 10;
    bln := (n2 <> n3)and(n2<>n4)and(n3<>n4);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN('',n1,0,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An77(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число. Проверить истинность высказывания:',0,2);
taskText('\<Цифры данного числа образуют возрастающую последовательность\>.',0,4);
taskText('',0,5);
(*
*)
n := Random(2);
while True do
  begin
    n1 := 100+Random(900);
    n2 := n1 div 100;
    n3 := (n1 mod 100) div 10;
    n4 := (n1 mod 100) mod 10;
    bln := (n2 < n3)and(n3 < n4);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN('',n1,0,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An78(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Дано трехзначное число. Проверить истинность высказывания:',0,2);
taskText('\<Цифры данного числа образуют возрастающую или убывающую последовательность\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    n1 := 100+Random(900);
    n2 := n1 div 100;
    n3 := (n1 mod 100) div 10;
    n4 := (n1 mod 100) mod 10;
    bln := (n2 < n3)and(n3<n4) or (n2 > n3)and(n3>n4);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN('',n1,0,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An79(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Дано четырехзначное число. Проверить истинность высказывания:',0,2);
taskText('\<Данное число читается одинаково слева направо и\ справа налево\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    n1 := 1000+Random(9000);
    n2 := n1 div 100;
    n3 := n1 mod 100;
    bln := (n2 div 10=n3 mod 10)and(n2 mod 10=n3 div 10);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN('',n1,0,3,4);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An80(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны числа~{A}, {B},~{C} (число~{A} не\ равно~0). ',0,2);
taskText('Рассмотрев \Iдискриминант\i {D}~=~{B}^2\;\-\;4\*{A}\*{C}, проверить истинность высказывания:',0,3);
taskText('\<Квадратное уравнение {A}\*{x}^2\;+\;{B}\*{x}\;+\;{C}~=~0 имеет вещественные корни\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    a :=10-Random*19.99;
    b :=10-Random*19.99;
    c :=10-Random*19.99;
    case n of
    0 : if b*b-4*a*c>=0 then break;
    1 : if b*b-4*a*c<0 then break;
    end;
  end;
dataR('A = ',a,xLeft,3,5);
dataR('B = ',b,0,3,5);
dataR('C = ',c,xRight,3,5);
resultB('',b*b-4*a*c>=0,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An81(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(9,2,0,0,v1,v2,v3);
case v1 of
1:
begin
n1 := -1; n2 := 1;
taskText('Даны ненулевые числа~{x}, {y}. Проверить истинность высказывания:',0,2);
taskText('\<Точка с координатами ({x},\;{y}) лежит во\ второй координатной четверти\>.',0,4);
(*
*)
end;
2: begin
n1 := 1; n2 := -1;
taskText('Даны ненулевые числа~{x}, {y}. Проверить истинность высказывания:',0,2);
taskText('\<Точка с координатами ({x},\;{y}) лежит в\ четвертой координатной четверти\>.',0,4);
(*
*)
end;
end;
n := Random(2);
while True do
  begin
    x :=10-Random*19.99;
    y :=10-Random*19.99;
    case n of
    0 : if (x*n1>0.1)and(y*n2>0.1) then break;
    1 : if (x*n1<-0.1)or(y*n2<-0.1) then break;
    end
  end;
dataR('x = ',x,xLeft,3,5);
dataR('y = ',y,xRight,3,5);
resultB('',(x*n1>0)and(y*n2>0),0,3);
j := 2;
if x*n1<0 then j := 1;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An82(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(10,2,0,0,v1,v2,v3);
case v1 of
1: begin
taskText('Даны ненулевые числа~{x}, {y}. Проверить истинность высказывания:',0,2);
taskText('\<Точка с координатами ({x},\;{y}) лежит во\ второй',0,3);
taskText('или\ третьей координатной четверти\>.',0,4);
(*
*)
end;
2: begin
taskText('Даны ненулевые числа~{x}, {y}. Проверить истинность высказывания:',0,2);
taskText('\<Точка с координатами ({x},\;{y}) лежит в\ первой',0,3);
taskText('или\ третьей координатной четверти\>.',0,4);
(*
*)
end;
end;
n := Random(2);
while True do
  begin
    x :=RandomR2(-9.9,9.9); //10-Random*19.99; //2018
    y :=RandomR2(-9.9,9.9); //10-Random*19.99;
    while abs(y) <= 0.1 do
      y :=RandomR2(-9.9,9.9); //10-Random*19.99;
    case n of
    0 : case v1 of
        1: if x<-0.1 then break;
        2: if x*y>0.1 then break;
        end;
    1 : case v1 of
        1: if x>0.1 then break;
        2: if x*y<-0.1 then break;
        end;
    end;
  end;
dataR('x = ',x,xLeft,3,5);
dataR('y = ',y,xRight,3,5);
resultB('',n=0,0,3);
j := 2;
if v1=1 then j := 1;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An83(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Даны числа~{x}, {y}, {x}_1,~{y}_1, {x}_2,~{y}_2. Проверить истинность высказывания:',0,2);
taskText('\<Точка с\ координатами ({x},\;{y}) лежит внутри прямоугольника, левая верхняя',0,3);
taskText('вершина которого имеет координаты ({x}_1,\;{y}_1), правая нижняя\ \= ({x}_2,\;{y}_2),',0,4);
taskText('а\ стороны параллельны координатным осям\>.',0,5);
(*
*)
n := Random(2);
x1 := integer(Random(21))-10;
y1 := integer(Random(21))-10;
x2 := x1 + 2 + integer(Random(10));
y2 := y1 - 2 - integer(Random(10));
while True do
  begin
    x :=integer(Random(30))-15;
    y :=integer(Random(30))-15;
    bln := (x1<x)and(x<x2)and(y2<y)and(y<y1);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataR2('x, y: ',x,y,0,2,7);
dataR2('x_1, y_1: ',x1,y1,xLeft,4,7);
dataR2('x_2, y_2: ',x2,y2,xRight,4,7);
resultB('',bln,0,3);
j := 6; 
if x<x1 then j := 3
else if y>y1 then j := 4
else if x>x2 then j := 5;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure Treug(var a,b,c : integer);
begin
while True do
  begin
  a := 1 + Random(30);
  b := 1 + Random(30);
  c := 1 + Random(30);
  if (a+b>c)and(a+c>b)and(b+c>a) then exit;
  end;
end;

procedure noTreug(var a,b,c : integer);
begin
while True do
  begin
  a := 1 + Random(30);
  b := 1 + Random(30);
  c := 1 + Random(30);
  if (a+b<=c)or(a+c<=b)or(b+c<=a) then exit;
  end;
end;


procedure Pifagor(var a1,b1,c1 : integer);
var a,b,c : integer;
begin
case Random(11) of
0: begin a := 3; b := 4; c := 5; end;
1: begin a := 5; b :=12; c :=13; end;
2: begin a := 6; b := 8; c :=10; end;
3: begin a := 7; b :=24; c :=25; end;
4: begin a := 8; b :=15; c :=17; end;
5: begin a := 9; b :=12; c :=15; end;
6: begin a :=10; b :=24; c :=26; end;
7: begin a :=12; b :=16; c :=20; end;
8: begin a :=15; b :=20; c :=25; end;
9: begin a :=18; b :=24; c :=30; end;
10: begin a :=20; b :=21; c :=29; end;
end;
case Random(6) of
0: begin a1 := a; b1 := b; c1 := c; end;
1: begin a1 := b; b1 := c; c1 := a; end;
2: begin a1 := c; b1 := a; c1 := b; end;
3: begin a1 := b; b1 := a; c1 := c; end;
4: begin a1 := a; b1 := c; c1 := b; end;
5: begin a1 := c; b1 := b; c1 := a; end;
end;
end;

procedure SBeg95An84(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Даны целые числа {a}, {b},\ {c}, являющиеся сторонами некоторого треугольника.',0,2);
taskText('Проверить истинность высказывания:',0,3);
taskText('\<Треугольник со\ сторонами {a}, {b},\ {c} является равносторонним\>.',0,4);
(*
*)
if Random(3)=0 then
  begin
    m := 1 + Random(30);
    n := m;
    k := m;
  end
else
  Treug(m,n,k);
dataN('a = ',m,center(1,3,6,8),3,2);
dataN('b = ',n,center(2,3,6,8),3,2);
dataN('c = ',k,center(3,3,6,8),3,2);
resultB('',(m=k) and (k=n),0,3);
j := 3; 
if m<>n then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An85(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(3,0,0,0,v1,v2,v3);
taskText('Даны целые числа {a}, {b},\ {c}, являющиеся сторонами некоторого треугольника.',0,2);
taskText('Проверить истинность высказывания:',0,3);
taskText('\<Треугольник со\ сторонами {a}, {b},\ {c} является равнобедренным\>.',0,4);
(*
*)
n1 := Random(2);
while True do
  begin
  Treug(m,n,k);
  case n1 of
  0: if (m=n)or(n=k)or(k=m) then break;
  1: if not ((m=n)or(n=k)or(k=m)) then break;
  end;
  end;
dataN('a = ',m,center(1,3,6,8),3,2);
dataN('b = ',n,center(2,3,6,8),3,2);
dataN('c = ',k,center(3,3,6,8),3,2);
resultB('',n1=0,0,3);
j := 3; 
if m=n then j := 2;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An86(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(4,0,0,0,v1,v2,v3);
taskText('Даны целые числа {a}, {b},\ {c}, являющиеся сторонами некоторого треугольника.',0,2);
taskText('Проверить истинность высказывания:',0,3);
taskText('\<Треугольник со\ сторонами {a}, {b},\ {c} является прямоугольным\>.',0,4);
(*
*)
n1 := Random(2);
while True do
  begin
  case n1 of
  0: begin
       Pifagor(m,n,k);
       break;
     end;
  1: begin
       Treug(m,n,k);
       if (m*m<>n*n+k*k)and(n*n<>m*m+k*k)and
          (k*k<>n*n+m*m) then break;
     end;
  end;
  end;
dataN('a = ',m,center(1,3,6,8),3,2);
dataN('b = ',n,center(2,3,6,8),3,2);
dataN('c = ',k,center(3,3,6,8),3,2);
resultB('',n1=0,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An87(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('Даны целые числа {a}, {b},\ {c}.',0,2);
taskText('Проверить истинность высказывания:',0,3);
taskText('\<Существует треугольник со\ сторонами {a}, {b},\ {c}\>.',0,4);
(*
*)
n1 := Random(2);
if n1 = 0 then Treug(m,n,k)
else
  case Random(2) of
  0: noTreug(m,n,k);
  1: repeat
       m := 1+Random(30);
       case Random(5) of
       0: m := 0;
       1: begin m := -m; if m < -9 then m := m div 10;
          end;
       end;
       n := 1+Random(30);
       case Random(5) of
       0: n := 0;
       1: begin n := -n; if n < -9 then n := n div 10;
          end;
       end;
       k := 1+Random(30);
       case Random(5) of
       0: k := 0;
       1: begin k := -k; if k < -9 then k := k div 10;
          end;
       end;
     until (m<=0)or(n<=0)or(k<=0);
  end;
dataN('a = ',m,center(1,3,6,8),3,2);
dataN('b = ',n,center(2,3,6,8),3,2);
dataN('c = ',k,center(3,3,6,8),3,2);
resultB('',n1=0,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An88(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(1,0,0,0,v1,v2,v3);
taskText('Даны координаты поля шахматной доски~{x}, {y} (целые числа, лежащие',0,2);
taskText('в\ диапазоне~1\:8). Учитывая, что левое нижнее поле доски (1,\,1) является',0,3);
taskText('черным, проверить истинность высказывания: \<Данное поле является белым\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    m1 := 1+Random(8);
    n1 := 1+Random(8);
    bln := Odd(m1+n1);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x, y:',m1,n1,0,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure Fields(var m1,n1,m2,n2:integer);
begin
repeat
    m1 := 1+Random(8);
    n1 := 1+Random(8);
    m2 := 1+Random(8);
    n2 := 1+Random(8);
until (m1<>m2)or(n1<>n2);
end;

procedure SBeg95An89(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Данные поля имеют одинаковый цвет\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := not Odd(m1+n1+m2+n2);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An90(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(6,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Ладья за\ один ход может перейти с\ одного поля на\ другое\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := (m1=m2)or(n1=n2);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
j := 4; 
if m1=m2 then j := 3;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An91(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(7,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Король\ за один ход может перейти с\ одного поля на\ другое\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := (abs(m1-m2)<=1)and(abs(n1-n2)<=1);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
j := 4; 
if abs(m1-m2)>1 then j := 3;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An92(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(8,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Слон за\ один ход может перейти с\ одного поля на\ другое\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := abs(m1-m2)=abs(n1-n2);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An93(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(9,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Ферзь за\ один ход может перейти с\ одного поля на\ другое\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := (abs(m1-m2)=abs(n1-n2))or(m1=m2)or(n1=n2);
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
j := 4; 
if m1=m2 then j := 3;
setNumberOfUsedData(j); //2019
setNumberOfTests(9);
pause;
end;

procedure SBeg95An94(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(10,0,0,0,v1,v2,v3);
taskText('Даны координаты двух различных полей шахматной доски~{x}_1, {y}_1, {x}_2,~{y}_2',0,2);
taskText('(целые числа, лежащие в\ диапазоне~1\:8). Проверить истинность высказывания:',0,3);
taskText('\<Конь за\ один ход может перейти с\ одного поля на\ другое\>.',0,4);
(*
*)
n := Random(2);
while True do
  begin
    Fields(m1,n1,m2,n2);
    bln := abs(m1-m2)*abs(n1-n2)=2;
    case n of
    0 : if bln then break;
    1 : if not bln then break;
    end;
  end;
dataN2('x_1, y_1:',m1,n1,xLeft,3,3);
dataN2('x_2, y_2:',m2,n2,xRight,3,3);
resultB('',bln,0,3);
setNumberOfTests(9);
pause;
end;

procedure SBeg95An95(Name, Key: string);
var v1,v2,v3 : byte;
begin
start(Name,Topic3,Author,Key,9{level3});(*DEMO*)
getVariant(5,0,0,0,v1,v2,v3);
taskText('ФОРМУЛИРОВКА ЗАДАНИЯ',0,3);
(*
*)
dataS('','ИСХОДНЫЕ ДАННЫЕ',0,3);
resultS('','РЕЗУЛЬТИРУЮЩИЕ ДАННЫЕ',0,3);
setNumberOfTests(5);
pause;
end;


begin
Topic1 := 'ВВОД И ВЫВОД ДАННЫХ, ОПЕРАТОР ПРИСВАИВАНИЯ';
Topic2 := 'ЦЕЛЫЕ ЧИСЛА';
Topic3 := 'ЛОГИЧЕСКИЕ ВЫРАЖЕНИЯ';
{Author := 'М.~Э.~Абрамян, 2002';}

end.
