{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
unit SStr60A4;

{$MODE Delphi}

interface

procedure SStr60An1(Name, Key: string);
procedure SStr60An2(Name, Key: string);
procedure SStr60An3(Name, Key: string);
procedure SStr60An4(Name, Key: string);
procedure SStr60An5(Name, Key: string);
procedure SStr60An6(Name, Key: string);
procedure SStr60An7(Name, Key: string);
procedure SStr60An8(Name, Key: string);
procedure SStr60An9(Name, Key: string);
procedure SStr60An10(Name, Key: string);
procedure SStr60An11(Name, Key: string);
procedure SStr60An12(Name, Key: string);
procedure SStr60An13(Name, Key: string);
procedure SStr60An14(Name, Key: string);
procedure SStr60An15(Name, Key: string);
procedure SStr60An16(Name, Key: string);
procedure SStr60An17(Name, Key: string);
procedure SStr60An18(Name, Key: string);
procedure SStr60An19(Name, Key: string);
procedure SStr60An20(Name, Key: string);
procedure SStr60An21(Name, Key: string);
procedure SStr60An22(Name, Key: string);
procedure SStr60An23(Name, Key: string);
procedure SStr60An24(Name, Key: string);
procedure SStr60An25(Name, Key: string);
procedure SStr60An26(Name, Key: string);
procedure SStr60An27(Name, Key: string);
procedure SStr60An28(Name, Key: string);
procedure SStr60An29(Name, Key: string);
procedure SStr60An30(Name, Key: string);
procedure SStr60An31(Name, Key: string);
procedure SStr60An32(Name, Key: string);
procedure SStr60An33(Name, Key: string);
procedure SStr60An34(Name, Key: string);
procedure SStr60An35(Name, Key: string);
procedure SStr60An36(Name, Key: string);
procedure SStr60An37(Name, Key: string);
procedure SStr60An38(Name, Key: string);
procedure SStr60An39(Name, Key: string);
procedure SStr60An40(Name, Key: string);
procedure SStr60An41(Name, Key: string);
procedure SStr60An42(Name, Key: string);
procedure SStr60An43(Name, Key: string);
procedure SStr60An44(Name, Key: string);
procedure SStr60An45(Name, Key: string);
procedure SStr60An46(Name, Key: string);
procedure SStr60An47(Name, Key: string);
procedure SStr60An48(Name, Key: string);
procedure SStr60An49(Name, Key: string);
procedure SStr60An50(Name, Key: string);
procedure SStr60An51(Name, Key: string);
procedure SStr60An52(Name, Key: string);
procedure SStr60An53(Name, Key: string);
procedure SStr60An54(Name, Key: string);
procedure SStr60An55(Name, Key: string);
procedure SStr60An56(Name, Key: string);
procedure SStr60An57(Name, Key: string);
procedure SStr60An58(Name, Key: string);
procedure SStr60An59(Name, Key: string);
procedure SStr60An60(Name, Key: string);

implementation

uses PT5TaskMaker;

const NS = 115;
      NP = 61;
      slovo: array [0..NS-1] of string[10] =
('АЗБУКА','АКСАКАЛ','АКТРИСА','АКУЛА','АКУСТИКА','АЛГЕБРА','АЛЫЧА',
'АЛЬМАНАХ','АМПЛИТУДА','АМПУЛА','АОРТА','АРБА','АРКА','АРМАТУРА',
'АССИГНАЦИЯ','АТМОСФЕРА','БАЙДАРКА','БАЛАГАН','БАЛЛАДА','БАРАБАН',
'БАРРИКАДА','БЕЗЗАКОНИЕ','БЕССТРАШИЕ','БЕСЧИНСТВО','ВЗРЫВ','ВОСПАЛЕНИЕ',
'ВЫЗОВ','ГРАНАТА','ГРОГ','ДИАГРАММА','ДИАФРАГМА','ДИЗЕНТЕРИЯ','ДИОД',
'ДИСЦИПЛИНА','ДОХОД','ЗАБАВА','ЗАВАРКА','ЗАГАДКА','ЗАЖИГАЛКА','ЗАКЛАДКА',
'ЗАПЕВАЛА','КАБЛУК','КАМЕНЩИК','КАПИТАЛИЗМ','КАРАВАН','КАРАНДАШ',
'КАРИКАТУРА','КАТАСТРОФА','КАТОЛИК','КАТОРЖНИК','КАУЧУК','КВАДРАТУРА',
'КИВОК','КИПЯТОК','КИШЕЧНИК','КЛИНОК','КОЗЫРЕК','КОЛПАК','КОМБИНАЦИЯ',
'КОМПИЛЯТОР','КОРОБОК','КОТИК','КРАНОВЩИК','КРУЖОК','КУБИК','КУЗНЕЧИК',
'КУЛИК','КУЛЬТУРИСТ','КУРИЛЬЩИК','КУСОК','КУШАК','ЛИБЕРАЛ','ЛИКВИДАЦИЯ',
'МАКСИМУМ','МИНИМУМ','НАРОДНОСТЬ','НАРУКАВНИК','НАСТРОЙЩИК','ОБЛАКО',
'ОДЕЯЛО','ОЗЕРО','ОКО','ОЛОВО','ОПЛОШНОСТЬ','ОСЛОЖНЕНИЕ','ОТСТАЛОСТЬ',
'ПАНОРАМА','ПАРАБОЛА','ПАРАГРАФ','ПАРИКМАХЕР','ПИКАП','ПОДСТУП',
'ПОЛКОВОДЕЦ','ПОЛУСТАНОК','ПРИНЦИП','ПРИСТУП','ПРОПАГАНДА','ПРОТИВОГАЗ',
'РАЗДОР','РАЗЛОЖЕНИЕ','РАСПРАВА','РАСТВОР','РАСТРАТА','РЕЖИССЕР','РУПОР',
'СИЛОС','СКАРЛАТИНА','СПРОС','СУФФИКС','ТАБУРЕТ','ТАРАКАН','ТРАКТ',
'ТРЕПЕТ','ТУРИСТ','ФОРТЕПИАНО');
       predl: array[0..NP-1] of string[80] =
('Всякая работа требует больше времени, чем вы думаете.',
'Из всех неприятностей произойдет именно та, ущерб от которой больше.',
'Любые предложения люди понимают иначе, чем тот кто их вносит.',
'Если работа проваливается, то всякая попытка ее спасти ухудшит дело.',
'Перед тем как улучшиться, ситуация ухудшается.',
'Утерянное всегда находишь в последнем кармане.',
'Кто может - делает, кто не может - учит, кто не может учить - управляет.',
'Любой приказ, который может быть понят неправильно, понимается неправильно.',
'Компьютеры ненадежны, но люди еще ненадежнее.',
'Машина должна работать, человек - думать.',
'Нельзя заранее правильно определить, какую сторону бутерброда мазать маслом.',
'Предмет упадет таким образом, чтобы нанести наибольший ущерб.',
'С пола упасть нельзя.',
'Все можно наладить, если вертеть в руках достаточно долго.',
'Если достаточно долго портить машину, она сломается.',
'Если ничто другое не помогает, прочтите, наконец, инструкцию.',
'Если факты не подтверждают теорию, от них надо избавиться.',
'Работая над решением задачи, всегда полезно знать ответ.',
'Все великие открытия делаются по ошибке.',
'Внутри каждой большой задачи сидит маленькая, пытающаяся пробиться наружу.',
'Никогда не пытайтесь повторить удачный эксперимент.',
'Нет такой плохой ситуации, которая не могла бы стать еще хуже.',
'Когда события принимают крутой оборот, все смываются.',
'Чтобы одно очистить, нужно другое запачкать.',
'То, что ищешь, найдешь только обыскав все.',
'Начинать поиски надо с самого неподходящего места.',
'Находишь всегда то, что не искал.',
'Если вам все равно, где вы находитесь, значит, вы не заблудились.',
'Оптимиста хорошей вестью не удивишь.',
'Стоит вам только вымыть машину, как тут же пойдет дождь.',
'Худшее - враг плохого.',
'Можно сделать защиту от дурака, но только от неизобретательного.',
'То, что вы заметили в витрине, купит зашедший перед вами.',
'Соседняя очередь всегда движется быстрее.',
'Стоит запечатать письмо, как в голову приходят свежие мысли.',
'Хорошие снимки обычно делаются при закрытом объективе.',
'Чем ниже сидишь, тем больнее бьют.',
'Легче получить прощение, чем разрешение.',
'Не давайте понять своему начальнику, что вы умнее.',
'Никогда не знают, кто прав, но всегда известно, кто в ответе.',
'Никогда не спорьте с дураками: люди могут не заметить между вами разницы.',
'Хочешь жить в согласии - соглашайся.',
'Нельзя ничего сказать о глубине лужи, пока не попадешь в нее.',
'Нет невыполнимой работы для человека, который не обязан делать ее сам.',
'Измеряй микрометром; отмечай мелом; отрубай топором.',
'Нельзя починить то, что не сломано.',
'Работа в команде очень важна: она позволяет свалить вину на другого.',
'Простая и приемлемая ложь полезнее сложной и непонятной истины.',
'Усложнять - просто, упрощать - сложно.',
'Не усматривайте злого умысла в том, что вполне объяснимо глупостью.',
'Даже воду пить неприятно, если ее прописал врач.',
'Алкоголик - это тот, кто пьет больше своего врача.',
'На грязный пол ребенок ничего не будет разливать или рассыпать.',
'Небьющаяся игрушка полезна для того, чтобы разбивать ею другие.',
'Общая сумма разума на планете - величина постоянная, а население растет.',
'Пристрастие к холостяцкой жизни не передается по наследству.',
'Друзья приходят и уходят, а враги накапливаются.',
'Продолжительность брака обратно пропорциональна расходам на свадьбу.',
'Тот, кто храпит, засыпает первым.',
'Тот, кто смеется последним, возможно, не понял шутки.',
'Если есть ради чего стараться, то не грех и перестараться.');

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

function russymbs(N : integer) : string;
const c : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'+
                   'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(64)+1];
russymbs := s;
end;

function stroka(N : integer) : string;
const c : string = '0123456789'+
'ABCDEFGHIJKLMNOPQRSTUVWXYZ'+
'abcdefghijklmnopqrstuvwxyz'+
'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'+
'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var s: string;
    i: integer;
begin
s := '';
for i:=1 to N do
  s := s + c[Random(126)+1];
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

procedure SStr60An1(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дан символ~{C}. Вывести его \Iкод\i (т.\,е. номер в\ кодовой таблице).',0,3);
(*
Для определения кодового номера символа следует использовать функцию Ord. 
*)
(*==*)
n := Random(95)+32;
dataC('C = ',chr(n),0,3);
resultN('Код символа C: ',n,0,3,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An2(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дано целое число~{N} (32~\l~{N}~\l~126). Вывести символ с\ кодом, равным~{N}.',0,3);
(*
Для определения символа с\ данным кодовым номером следует использовать функцию Chr. 
*)
(*==*)
n := Random(95)+32;
dataN('N = ',n,0,3,3);
resultC('Символ с кодом N: ',chr(n),0,3);
setNumberOfTests(3);
Pause;
end;

procedure SStr60An3(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дан символ~{C}. Вывести два символа,',0,2);
taskText('первый из\ которых предшествует символу~{C} в\ кодовой таблице,',0,3);
taskText('а\ второй следует за\ символом~{C}.',0,4);
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

procedure SStr60An4(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дано целое число~{N} (1~\l~{N}~\l~26).',0,2);
taskText('Вывести {N}~первых \Iпрописных\i (т.\,е. заглавных) букв латинского алфавита.',0,4);
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

procedure SStr60An5(Name, Key: string);
var
  v1, v2, v3: Byte;
  i: integer;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дано целое число~{N} (1~\l~{N}~\l~26).',0,2);
taskText('Вывести {N}~последних \Iстрочных\i (т.\,е. маленьких) букв латинского алфавита',0,3);
taskText('в\ обратном порядке (начиная с\ буквы \<z\>).',0,4);
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

procedure SStr60An6(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дан символ~{C}, изображающий цифру или\ букву (латинскую или\ русскую).',0,2);
taskText('Если~{C} изображает цифру, то\ вывести строку \<digit\>, если латинскую букву\ \=',0,3);
taskText('вывести строку \<lat\>, если русскую\ \= вывести строку \<rus\>.',0,4);
(*
Чтобы проверить, является\ ли символ~{C} цифрой, можно использовать
операции сравнения ({C}\;\g\;\<0\>) And ({C}\;\l\;\<9\>) или\
(в\ языке \UP) операцию \Iпринадлежности множеству\i: \MC~in~['0'..'9']\m.
Буквы анализируются аналогично.
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
   c := s[1];
   s := 'lat';
   end;
2: begin
   s := rusSymbs(1);
   c := s[1];
   s := 'rus';
   end;
end;
dataC('C = ',c,0,3);
resultS('',s,0,3);
setNumberOfTests(6);
Pause;
end;

procedure SStr60An7(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дана непустая строка. Вывести коды ее\ первого и\ последнего символа.',0,3);
(*
Для доступа к\ {i}-му символу строки~{S} в\ языке \UP достаточно применить
к\ строке операцию индексирования (как к\ обычному массиву): \MS[i]\m.
В\ языке \UV следует использовать функцию Mid.
*)
(*==*)
s := strokaASCII(Random(15)+4);
dataS('',s,0,3);
resultN('Код первого символа:    ',Ord(s[1]),0,2,3);
resultN('Код последнего символа: ',Ord(s[length(s)]),0,4,3);
setNumberOfTests(3);
Pause;
end;


procedure SStr60An8(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано целое число~{N} (>\,0) и\ символ~{C}.',0,2);
taskText('Вывести строку длины~{N}, которая состоит из\ символов~{C}.',0,4);
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





procedure SStr60An9(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
getVariant(2,0,0,0,v1,v2,v3);
taskText('Дано четное число~{N} (>\,0) и\ символы~{C}_1 и~{C}_2. Вывести строку длины~{N},',0,2);
taskText('которая состоит из\ чередующихся символов~{C}_1 и~{C}_2, начиная с~{C}_1.',0,4);
(*
Решение этого задания приводится в п.\,10.3.
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



procedure SStr60An10(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('Дана строка. Вывести строку, содержащую те\ же\ символы,',0,2);
taskText('но\ расположенные в\ обратном порядке.',0,4);
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

procedure SStr60An11(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дана непустая строка~{S}. Вывести строку, содержащую символы строки~{S},',0,2);
taskText('между которыми вставлено по одному пробелу.',0,4);
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

procedure SStr60An12(Name, Key: string);
var i,j: integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дана непустая строка~{S} и\ целое число~{N} (>\,0). Вывести строку, содержащую',0,2);
taskText('символы строки~{S}, между которыми вставлено по\ {N}~символов \<*\> (звездочка).',0,4);
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




procedure SStr60An13(Name, Key: string);
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


procedure SStr60An14(Name, Key: string);
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




procedure SStr60An15(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка. Подсчитать количество содержащихся в ней цифр.',0,3);
(*
*)
   end;
2: begin
taskText('Дана строка. Подсчитать количество',0,2);
taskText('содержащихся в\ ней прописных латинских букв.',0,4);
(*
*)
   end;
3: begin
taskText('Дана строка. Подсчитать общее количество',0,2);
taskText('содержащихся в\ ней строчных латинских и\ русских букв.',0,4);
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
  3 : if s[i] in ['а'..'п','р'..'я','a'..'z'] then inc(n);
  end;
resultN('',n,0,3,2);
setNumberOfTests(5);
Pause;
end;



procedure SStr60An16(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(2, 3, 0, 0, v1, v2, v3);
case v1 of
1: taskText('Дана строка. Преобразовать в\ ней все\ прописные латинские буквы в\ строчные.',0,3);
(*
*)
2: begin
   taskText('Дана строка. Преобразовать в\ ней все\ строчные буквы',0,2);
   taskText('(как\ латинские, так и\ русские) в\ прописные.',0,4);
(*
*)
end;
3: begin
   taskText('Дана строка. Преобразовать в\ ней все\ строчные буквы',0,2);
   taskText('(как\ латинские, так и\ русские) в\ прописные, а\ прописные\ \= в\ строчные.',0,4);
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
  2:  begin
         if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32)
         else
           if Pos(s[i],c2)<>0 then s0[i] := c1[Pos(s[i],c2)];
       end;
  3:  begin
         if s[i] in ['a'..'z'] then s0[i] := Chr(Ord(s[i])-32)
         else
         if s[i] in ['A'..'Z'] then s0[i] := Chr(Ord(s[i])+32)
         else
           if Pos(s[i],c2)<>0 then s0[i] := c1[Pos(s[i],c2)]
         else
           if Pos(s[i],c1)<>0 then s0[i] := c2[Pos(s[i],c1)]
       end;
  end;
resultS('',s0,0,3);
setNumberOfTests(3);
Pause;
end;
procedure SStr60An17(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
taskText('Дана строка. Если она представляет собой запись целого числа,',0,1);
taskText('то\ вывести~1, если вещественного (с\ дробной частью)\ \= вывести~2;',0,2);
taskText('если строку нельзя преобразовать в\ число, то\ вывести~0.',0,3);
taskText('Считать, что\ дробная часть вещественного числа',0,4);
taskText('отделяется от\ его\ целой части десятичной \Iточкой\i~\<.\>.',0,5);
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
procedure SStr60An18(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
     taskText('Дано целое положительное число. Вывести символы,',0,2);
     taskText('изображающие цифры этого числа (в\ порядке слева направо).',0,4);
(*
Используйте процедуру Str. Следует обратить внимание на\ то,
что\ вывести требуется не\ строку, а\ \Iмассив символов\i.
*)
   end;
2: begin
     taskText('Дано целое положительное число. Вывести символы,',0,2);
     taskText('изображающие цифры этого числа (в\ порядке справа налево).',0,4);
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
resultComment('Набор из '+s0+' символов:',0,2);
for i := 1 to Length(s) do
case v1 of
1 : resultC('',s[i],center(i,length(s),3,5),4);
2 : resultC('',s[length(s)-i+1],center(i,length(s),3,5),4);
end;
setNumberOfTests(4);
Pause;
end;

procedure SStr60An19(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дана строка, изображающая целое положительное число.',0,2);
taskText('Вывести сумму цифр этого числа.',0,4);
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



procedure SStr60An20(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic1, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дана строка, изображающая арифметическое выражение вида', 0, 2);
  TaskText('\<<цифра>\+<цифра>\+\.\+<цифра>\>, где на месте знака операции \<\+\>', 0, 3);
  TaskText('находится символ \<+\> или \<\-\> (например, \<4+7\-2\-8\>).', 0, 4);
  TaskText('Вывести значение данного выражения (целое число).', 0, 5);
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




procedure SStr60An21(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, изображающая двоичную запись целого положительного числа.',0,2);
taskText('Вывести строку, изображающую десятичную запись этого\ же числа.',0,4);
(*
*)
end;
2: begin
taskText('Дана строка, изображающая десятичную запись целого положительного числа.',0,2);
taskText('Вывести строку, изображающую двоичную запись этого\ же числа.',0,4);
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


procedure SStr60An22(Name, Key: string);
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


procedure SStr60An23(Name, Key: string);
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




procedure SStr60An24(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дано целое число~{N} (>\,0) и\ строка~{S}. Преобразовать строку~{S} в\ строку длины~{N}',0,2);
taskText('следующим образом: если длина строки~{S} больше~{N},',0,3);
taskText('то\ отбросить первые символы, если длина строки~{S} меньше~{N},',0,4);
taskText('то\ в\ ее\ начало добавить символы~\<.\> (точка).',0,5);
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

procedure SStr60An25(Name, Key: string);
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Даны целые положительные числа~{N}_1 и~{N}_2 и строки~{S}_1 и~{S}_2.',0,2);
taskText('Получить из\ этих строк новую строку, содержащую первые {N}_1~символов',0,3);
taskText('строки~{S}_1 и\ последние {N}_2~символов строки~{S}_2 (в\ указанном порядке).',0,4);
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

procedure SStr60An26(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Дан символ~{C} и\ строка~{S}.',0,2);
taskText('Удвоить каждое вхождение символа~{C} в\ строку~{S}.',0,4);
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


procedure SStr60An27(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});(*DEMO*)
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('Дан символ~{C} и\ строки~{S}, {S}_0.',0,2);
taskText('Перед каждым вхождением символа~{C} в\ строку~{S} вставить строку~{S}_0.',0,4);
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


procedure SStr60An28(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(6, 0, 0, 0, v1, v2, v3);
taskText('Дан символ~{C} и\ строки~{S}, {S}_0.',0,2);
taskText('После каждого вхождения символа~{C} в\ строку~{S} вставить строку~{S}_0.',0,4);
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




procedure SStr60An29(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Даны строки~{S} и~{S}_0. Проверить, содержится\ ли',0,2);
taskText('строка~{S}_0 в\ строке~{S}. Если содержится, то\ вывести \t,',0,3);
taskText('если не\ содержится, то\ вывести \f.',0,4);
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
procedure SStr60An30(Name, Key: string);
var i:integer;
begin
start(Name,Topic1,Author,Key,60{level});
taskText('Даны строки~{S} и~{S}_0.',0,2);
taskText('Найти количество вхождений строки~{S}_0 в\ строку~{S}.',0,4);
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
procedure SStr60An31(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(8, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Даны строки~{S} и~{S}_0.',0,2);
taskText('Удалить из\ строки~{S} первую подстроку, совпадающую с~{S}_0.',0,3);
taskText('Если совпадающих подстрок\ нет, то\ вывести строку~{S} без\ изменений.',0,4);
(*
*)
end;
2: begin
taskText('Даны строки~{S} и~{S}_0.',0,2);
taskText('Удалить из\ строки~{S} последнюю подстроку, совпадающую с~{S}_0.',0,3);
taskText('Если совпадающих подстрок\ нет, то\ вывести строку~{S} без\ изменений.',0,4);
(*
*)
end;
3: begin
taskText('Даны строки~{S} и~{S}_0.',0,2);
taskText('Удалить из\ строки~{S} все\ подстроки, совпадающие с~{S}_0.',0,3);
taskText('Если совпадающих подстрок\ нет, то\ вывести строку~{S} без\ изменений.',0,4);
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
procedure SStr60An32(Name, Key: string);
label 1;
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(1, 3, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Даны строки~{S}, {S}_1 и~{S}_2.',0,2);
taskText('Заменить в\ строке~{S} первое вхождение строки~{S}_1 на\ строку~{S}_2.',0,4);
(*
*)
end;
2: begin
taskText('Даны строки~{S}, {S}_1 и~{S}_2.',0,2);
taskText('Заменить в\ строке~{S} последнее вхождение строки~{S}_1 на\ строку~{S}_2.',0,4);
(*
*)
end;
3: begin
taskText('Даны строки~{S}, {S}_1 и~{S}_2.',0,2);
taskText('Заменить в\ строке~{S} все\ вхождения строки~{S}_1 на\ строку~{S}_2.',0,4);
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
procedure SStr60An33(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic1,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, содержащая по\ крайней мере один символ пробела.',0,2);
taskText('Вывести подстроку, расположенную между первым и\ вторым пробелом',0,3);
taskText('исходной строки. Если строка содержит только один пробел,',0,4);
taskText('то\ вывести пустую строку.',0,5);
(*
*)
end;
2: begin
taskText('Дана строка, содержащая по\ крайней мере один символ пробела.',0,2);
taskText('Вывести подстроку, расположенную между первым и\ последним пробелом',0,3);
taskText('исходной строки. Если строка содержит только один пробел,',0,4);
taskText('то\ вывести пустую строку.',0,5);
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

procedure SStr60An34(Name, Key: string);
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



procedure SStr60An35(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('Дана строка, состоящая из\ русских слов, разделенных пробелами',0,2);
taskText('(одним или\ несколькими). Найти количество слов в\ строке.',0,4);
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
procedure SStr60An36(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(5, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,2);
taskText('и\ разделенных пробелами (одним или\ несколькими). Найти количество слов,',0,3);
taskText('которые начинаются и\ заканчиваются одной и\ той\ же буквой.',0,4);
(*
*)
end;
2: begin
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,2);
taskText('и\ разделенных пробелами (одним или\ несколькими). Найти количество слов,',0,3);
taskText('которые содержат хотя\ бы одну букву~\<А\>.',0,4);
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
    2:    if pos('А',s1)>0 then inc(k1);
    end;
  end;
s1 := slovo[random(NS)];
s := s + s1;
case v1 of
1:    if s1[1] = s1[length(s1)] then inc(k1);
2:    if pos('А',s1)>0 then inc(k1);
end;
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An37(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});(*DEMO*)
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,2);
taskText('и\ разделенных пробелами (одним или\ несколькими). Найти количество слов,',0,3);
taskText('которые содержат ровно три\ буквы~\<А\>.',0,4);
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
      if s1[i] = 'А' then inc(k2);
    if k2=3 then inc(k1);
  end;
s1 := slovo[random(NS)];
s := s + s1;
k2 := 0;
for i := 1 to length(s1) do
  if s1[i] = 'А' then inc(k2);
if k2=3 then inc(k1);
until length(s)<77;
dataS('',s,0,3);
resultN('',k1,0,3,1);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An38(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(7, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('Дана строка, состоящая из\ русских слов, разделенных пробелами',0,2);
taskText('(одним или\ несколькими). Найти длину самого короткого слова.',0,4);
(*
*)
end;
2: begin s0 := '';
taskText('Дана строка, состоящая из\ русских слов, разделенных пробелами',0,2);
taskText('(одним или\ несколькими). Найти длину самого длинного слова.',0,4);
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
procedure SStr60An39(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('Дана строка, состоящая из\ русских слов, разделенных пробелами',0,2);
taskText('(одним или\ несколькими). Вывести строку, содержащую эти\ же слова,',0,3);
taskText('разделенные одним символом \<.\> (точка). В\ конце строки точку не\ ставить.',0,4);
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
procedure SStr60An40(Name, Key: string);
var i,k:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,1);
taskText('и\ разделенных пробелами (одним или\ несколькими). Преобразовать каждое слово',0,2);
taskText('в\ строке, заменив в\ нем все\ последующие вхождения его\ первой буквы',0,3);
taskText('на\ символ \<.\> (точка). Например, слово \<МИНИМУМ\> надо преобразовать',0,4);
taskText('в\ \<МИНИ.У.\>. Количество пробелов между словами не\ изменять.',0,5);
(*
*)
end;
2: begin
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,1);
taskText('и\ разделенных пробелами (одним или\ несколькими). Преобразовать каждое слово',0,2);
taskText('в\ строке, заменив в\ нем все\ предыдущие вхождения его\ последней буквы',0,3);
taskText('на\ символ \<.\> (точка). Например, слово \<МИНИМУМ\> надо преобразовать',0,4);
taskText('в\ \<.ИНИ.УМ\>. Количество пробелов между словами не\ изменять.',0,5);
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

procedure SStr60An41(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('Дана строка, состоящая из\ русских слов, разделенных пробелами',0,2);
taskText('(одним или\ несколькими). Вывести строку, содержащую эти\ же слова,',0,3);
taskText('разделенные одним пробелом и\ расположенные в\ обратном порядке.',0,4);
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


procedure SStr60An42(Name, Key: string);
var i,k:integer;
    s0 : array [1..7] of string[20];
begin
start(Name,Topic2,Author,Key,60{level});
taskText('Дана строка, состоящая из\ русских слов, набранных заглавными буквами',0,2);
taskText('и\ разделенных пробелами (одним или\ несколькими). Вывести строку, содержащую',0,3);
taskText('эти\ же слова, разделенные одним пробелом и\ расположенные в\ алфавитном порядке.',0,4);
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
procedure SStr60An43(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('Дана строка-предложение на\ русском языке. Преобразовать строку так,',0,2);
taskText('чтобы каждое слово начиналось с\ заглавной буквы. \IСловом\i считать',0,3);
taskText('набор символов, не\ содержащий пробелов и\ ограниченный пробелами',0,4);
taskText('или\ началом/концом строки. Слова, не\ начинающиеся с\ буквы, не\ изменять.',0,5);
(*
*)
(*==*)
s := predl[Random(NP)];
s1 := s;
for i:=2 to length(s) do
  if (s[i]<>' ') and (s[i-1]=' ') then
    if Pos(s[i],c2)<>0 then
      s[i] := c1[Pos(s[i],c2)];
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(5);
Pause;
end;
procedure SStr60An44(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка-предложение на\ русском языке. Подсчитать количество',0,2);
taskText('содержащихся в\ строке знаков препинания.',0,4);
(*
*)
end;
2: begin
taskText('Дана строка-предложение на\ русском языке. Подсчитать количество',0,2);
taskText('содержащихся в\ строке гласных букв.',0,4);
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
     if s[i] in ['У','Е','Ы','А','О','Э','Я','И','Ю',
                   'у','е','ы','а','о','э','я','и','ю']
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
procedure SStr60An45(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic2,Author,Key,60{level});
  GetVariant(9, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin s0 := '';
taskText('Дана строка-предложение на\ русском языке.',0,1);
taskText('Вывести самое длинное слово в\ предложении. Если таких слов несколько,',0,2);
taskText('то\ вывести первое из\ них. \IСловом\i считать набор символов,',0,3);
taskText('не\ содержащий пробелов, знаков препинания и\ ограниченный пробелами,',0,4);
taskText('знаками препинания или\ началом/концом строки.',0,5);
(*
*)
end;
2: begin s0 := '';
taskText('Дана строка-предложение на\ русском языке.',0,1);
taskText('Вывести самое короткое слово в\ предложении. Если таких слов несколько,',0,2);
taskText('то\ вывести последнее из\ них. \IСловом\i считать набор символов,',0,3);
taskText('не\ содержащий пробелов, знаков препинания и\ ограниченный пробелами,',0,4);
taskText('знаками препинания или\ началом/концом строки.',0,5);
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
setNumberOfTests(5);
Pause;
end;
procedure SStr60An46(Name, Key: string);
var i,k:integer;
begin
start(Name,Topic2,Author,Key,60{level});
taskText('Дана строка-предложение с\ избыточными пробелами между словами.',0,2);
taskText('Преобразовать ее\ так, чтобы между словами был ровно один пробел.',0,4);
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

procedure SStr60An47(Name, Key: string);
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


procedure SStr60An48(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(3, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, содержащая \Iполное имя файла\i, т.\,е. имя диска,',0,2);
taskText('список каталогов (путь), собственно имя и\ расширение.',0,3);
taskText('Выделить из\ этой строки имя файла (без\ расширения).',0,4);
(*
Имя диска отделяется от\ пути двоеточием, путь отделяется
от\ имени файла косой чертой \<\\\>, имя файла отделяется от\ расширения
точкой. Следует иметь в\ виду, что\ косая черта также разделяет
каталоги, перечисленные в\ пути.
*)
end;
 2: begin
taskText('Дана строка, содержащая \Iполное имя файла\i, т.\,е. имя диска,',0,2);
taskText('список каталогов (путь), собственно имя и\ расширение.',0,3);
taskText('Выделить из\ этой строки расширение файла (без\ предшествующей точки).',0,4);
(*
+
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
procedure SStr60An49(Name, Key: string);
var i:integer;
  v1, v2, v3: Byte;
begin
start(Name,Topic3,Author,Key,60{level});
  GetVariant(4, 2, 0, 0, v1, v2, v3);
case v1 of
1: begin
taskText('Дана строка, содержащая полное имя файла. Выделить из\ этой строки',0,2);
taskText('название первого каталога (без\ символов~\<\\\>). Если\ файл содержится',0,3);
taskText('в\ корневом каталоге, то\ вывести символ~\<\\\>.',0,4);
(*
+
*)
end;
2: begin
taskText('Дана строка, содержащая полное имя файла. Выделить из\ этой строки',0,2);
taskText('название последнего каталога (без\ символов~\<\\\>). Если\ файл содержится',0,3);
taskText('в\ корневом каталоге, то\ вывести символ~\<\\\>.',0,4);
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
procedure SStr60An50(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дана строка-предложение на\ русском языке. Зашифровать\ ее, выполнив циклическую',0,1);
taskText('замену каждой буквы на\ следующую за\ ней в\ алфавите и\ сохранив при\ этом регистр',0,2);
taskText('букв (\<А\> перейдет в~\<Б\>, \<а\>\ \= в~\<б\>, \<Б\>\ \= в~\<В\>, \<я\>\ \= в~\<а\> и\ т.\,д.).',0,3);
taskText('Букву~\<ё\> в\ алфавите не\ учитывать (\<е\> должна переходить в~\<ж\>).',0,4);
taskText('Знаки препинания и\ пробелы не\ изменять.',0,5);
(*
В\ языке \UP используйте функции Ord и\ Chr и\ индексированный доступ
к\ символам строки.
*)
(*==*)
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  case s[i] of
  'А'..'Ю','а'..'о','р'..'ю' : s[i] := chr(ord(s[i])+1);
  'Я' : s[i] := 'А';
  'п' : s[i] := 'р';
  'я' : s[i] := 'а';
  end;
dataS('',s1,0,3);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An51(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});(*DEMO*)
taskText('Дана строка-предложение на\ русском языке и\ число~{K} (0~<~{K}~<~10). Зашифровать',0,1);
taskText('строку, выполнив циклическую замену каждой буквы на\ букву того\ же регистра,',0,2);
taskText('расположенную в\ алфавите на \Um{K}-й\um позиции после шифруемой буквы (например,',0,3);
taskText('для {K}\,=\,2 \<А\> перейдет в~\<В\>, \<а\>\ \= в~\<в\>, \<Б\>\ \= в~\<Г\>, \<я\>\ \= в~\<б\> и\ т.\,д.).',0,4);
taskText('Букву~\<ё\> в\ алфавите не\ учитывать, знаки препинания и\ пробелы не\ изменять.',0,5);
(*
+
*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s1,0,2);
dataN('K = ',k,0,4,1);
resultS('',s,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An52(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дано зашифрованное предложение на\ русском языке',0,2);
taskText('(способ шифрования описан в\ задании \1)',0,3);
taskText('и\ кодовое смещение~{K} (0~<~{K}~<~10). Расшифровать предложение.',0,4);
(*
+
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s,0,2);
dataN('K = ',k,0,4,1);
resultS('',s1,0,3);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An53(Name, Key: string);
const c1 : string = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
      c2 : string = 'абвгдежзийклмнопрстуфхцчшщъыьэюя';
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дано зашифрованное предложение на\ русском языке (способ шифрования',0,2);
taskText('описан в\ задании \2) и\ его\ расшифрованный первый символ~{C}.',0,3);
taskText('Найти кодовое смещение~{K} и\ расшифровать предложение.',0,4);
(*
+
*)
(*==*)
k := random(9)+1;
s1 := predl[Random(NP)];
s := s1;
for i:=1 to length(s) do
  if Pos(s[i],c1)<>0 then s[i] := c1[(Pos(s[i],c1)+k-1) mod 32 + 1]
  else
  if Pos(s[i],c2)<>0 then s[i] := c2[(Pos(s[i],c2)+k-1) mod 32 + 1];
dataS('',s,0,2);
dataC('C = ',s1[1],0,4);
resultN('Кодовое смещение: ',k,0,2,2);
resultComment('Расшифрованное предложение:',0,3);
resultS('',s1,0,4);
setNumberOfTests(4);
Pause;
end;
procedure SStr60An54(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дана строка-предложение. Зашифровать\ ее, поместив вначале',0,1);
taskText('все\ символы, расположенные на\ четных позициях строки,',0,2);
taskText('а\ затем, в\ обратном порядке,',0,3);
taskText('все\ символы, расположенные на\ нечетных позициях',0,4);
taskText('(например, строка \<Программа\> превратится в\ \<ргамамроП\>).',0,5);
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
procedure SStr60An55(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дано предложение, зашифрованное по\ правилу,',0,2);
taskText('описанному в\ задании \1. Расшифровать это\ предложение.',0,4);
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

procedure SStr60An56(Name, Key: string);
var
  v1, v2, v3: Byte;
  i,k: integer;
begin
  Start(Name, Topic3, Author, Key, 60{level});
  GetVariant(9, 0, 0, 0, v1, v2, v3);
  TaskText('Дана строка, содержащая цифры и\ строчные латинские буквы.', 0, 2);
  TaskText('Если буквы в\ строке упорядочены по\ алфавиту, то\ вывести~0;', 0, 3);
  TaskText('в\ противном случае вывести номер первого символа строки,', 0, 4);
  TaskText('нарушающего алфавитный порядок.', 0, 5);
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

procedure SStr60An57(Name, Key: string);
var i:integer;
begin
start(Name,Topic3,Author,Key,60{level});
taskText('Дана строка, содержащая латинские буквы и\ круглые скобки.',0,1);
taskText('Если скобки расставлены правильно (т.\,е. каждой открывающей',0,2);
taskText('соответствует одна закрывающая), то\ вывести число~0. В\ противном случае',0,3);
taskText('вывести или\ номер позиции, в\ которой расположена первая ошибочная',0,4);
taskText('закрывающая скобка, или, если\ закрывающих скобок не\ хватает, число~\-1.',0,5);
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


procedure SStr60An58(Name, Key: string);
var
  v1, v2, v3: Byte;
begin
  Start(Name, Topic3, Author, Key, 60{level});(*DEMO*)
  GetVariant(9, 0, 0, 0, v1, v2, v3);
taskText('Дана строка, содержащая латинские буквы и\ скобки трех видов:~\<()\>, \<[]\>,~\<\{\}\>.',0,1);
taskText('Если скобки расставлены правильно (т.\,е. каждой открывающей соответствует',0,2);
taskText('закрывающая скобка того\ же вида), то\ вывести число~0. В\ противном случае',0,3);
taskText('вывести или\ номер позиции, в\ которой расположена первая ошибочная',0,4);
taskText('скобка, или, если\ закрывающих скобок не\ хватает, число~\-1.',0,5);
(*
В данном случае нельзя обойтись вспомогательными переменными-счетчиками
(как в\ задании \1), поскольку с\ их\ помощью нельзя распознать
ошибочную ситуацию вида \<[(])\>. Можно использовать
вспомогательную \Iстроку\i,
в\ которую записывать все\ открывающие скобки, а\ при\ появлении закрывающей
скобки сравнивать ее\ с\ последней скобкой из\ вспомогательной строки.
Если скобки будут одного типа, то\ удалять из\ вспомогательной строки
последнюю скобку и\ продолжать проверку, если же\ скобки разного типа,
значит, последняя закрывающая скобка является ошибочной.
Требуется также обеспечить контроль за\ ситуацией, когда число
закрывающих скобок не\ равно числу открывающих.
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


procedure SStr60An59(Name, Key: string);
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

procedure SStr60An60(Name, Key: string);
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
Topic := 'СИМВОЛЫ И СТРОКИ';
Topic1 := 'СИМВОЛЫ И СТРОКИ: ОСНОВНЫЕ ОПЕРАЦИИ';
Topic2 := 'АНАЛИЗ И ПРЕОБРАЗОВАНИЕ СЛОВ В СТРОКЕ';
Topic3 := 'СИМВОЛЫ И СТРОКИ: ДОПОЛНИТЕЛЬНЫЕ ЗАДАНИЯ';
{Author := 'М.~Э.~Абрамян, 2002';}
end.

