{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4OOP0Begin_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const TestHeader = '\P\SТестирование разработанной системы классов\s.'#13;
  Subgroup1 = 'Базовые принципы ООП';
  Subgroup2 = 'Дополнительные приемы ООП';

type
  Command = record
      cmd, par: string;
  end;

  Node = class
      Data: string;
      Next: Node;
    private
      constructor Create(aData: string;
        aNext: Node);
  end;

  Stack = class
     protected
       top: Node;
     public
       procedure Push(d: string); virtual;
       function Pop: string; virtual;
       function Peek: string;
       function Empty: integer;
       function ToStr: string; virtual;
       procedure Clear; virtual;
       destructor Destroy; override;
   end;

  StackC = class(Stack)
     protected
       cnt: integer;
     public
       procedure Push(d: string); override;
       function Pop: string; override;
       function ToStr: string; override;
       procedure Clear; override;
       function Count: integer;
   end;

      constructor Node.Create(aData: string;
        aNext: Node);
      begin
        Data := aData;
        Next := aNext;
      end;

       procedure Stack.Push(d: string);
       begin
         top := Node.Create(d, top);
       end;
       function Stack.Pop: string;
       var p: Node;
       begin
         result := '0';
         if Empty = 1 then
           exit;
         result := top.Data;
         p := top;
         top := top.Next;
         p.Free;
       end;
       function Stack.Peek: string;
       begin
         result := '0';
         if Empty = 1 then
           exit;
         result := top.Data;
       end;
       function Stack.Empty: integer;
       begin
         if top = nil then
           result := 1
         else
           result := 0;
       end;
       function Stack.ToStr: string;
       var p: Node;
       begin
         result := '';
         p := top;
         while p <> nil do
         begin
           result := result + p.Data + '-';
           p := p.Next;
         end;
         result := result + 'end';
       end;
       procedure Stack.Clear;
       begin
         while Empty = 0 do
           Pop;
       end;
       destructor Stack.Destroy;
       begin
         Clear;
       end;
       procedure StackC.Push(d: string);
       begin
         inherited Push(d);
         cnt := cnt + 1;
       end;
       function StackC.Pop: string;
       var p: Node;
       begin
         if Empty = 0 then
           cnt := cnt - 1;
         result := inherited Pop;
       end;
       procedure StackC.Clear;
       begin
         inherited Clear;
         cnt := 0;
       end;
       function StackC.ToStr: string;
       begin
         result := inherited ToStr + '[' + IntToStr(cnt) + ']';
       end;
       function StackC.Count: integer;
       begin
         result := cnt;
       end;

var a: array [1..24] of Command;
    useCount: boolean = false;
    noPop0: boolean = false;
    noPeek0: boolean = false;
    type1: char = 'I';
    Excep: boolean = false;

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

function NodeValue: string;
var r: real;
begin
  case type1 of
  'I': if Random(2) = 1 then
         result := IntToStr(Random(900) + 100)
       else
         result := IntToStr(Random(90) + 10);
  'R': begin
         r := 1 + Random*8.98;
         Str(r:0:2, result);
       end;
  'C': result := chr(Random(26) + Ord('a'));
  'S': result := FileName(Random(2)+2);
  end;
end;

function CreateCommands(n: integer): integer;
var push0, push1, pop1: integer;
    peek0, peek1, pop0, empty0, empty1, clear1: boolean;
    k, i, cnt, clearcnt, countcnt: integer;
begin
  result := 0;
  for k := 1 to 1000 do
  begin
    push0 := Random(4)+3;
    push1 := 0;
    pop0 := noPop0;
    pop1 := 0;
    peek0 := noPeek0;
    peek1 := false;
    empty0 := false;
    empty1 := false;
    clear1 := false;
    clearcnt := 0;
    countcnt := 0;
    cnt := push0;
    for i := 1 to push0 do
    begin
      a[i].cmd := 'Push';
      a[i].par := NodeValue;
    end;
    i := push0;
    while true do
    begin
      case Random(6) of
      0: if cnt < 9 then
         begin
           i := i + 1;
           push1 := push1 + 1;
           cnt := cnt + 1;
           a[i].cmd := 'Push';
           a[i].par := NodeValue;
         end;
      1: begin
           if noPop0 and (cnt = 0) then
             continue;
           i := i + 1;
           a[i].cmd := 'Pop';
           if cnt > 0 then
           begin
             cnt := cnt - 1;
             pop1 := pop1 + 1;
           end
           else
             pop0 := true;
         end;
      2: if not peek1 or not peek0 then
         begin
           if noPeek0 and (cnt = 0) then
             continue;
           i := i + 1;
           a[i].cmd := 'Peek';
           if cnt > 0 then
           begin
             if not peek1 then
               peek1 := true
           end
           else if not peek0 then
             peek0 := true;
         end;
      3: if not empty1 or not empty0 then
         begin
           i := i + 1;
           a[i].cmd := 'Empty';
           if cnt > 0 then
           begin
             if not empty1 then
               empty1 := true
           end
           else if not empty0 then
             empty0 := true;
         end;
      4: if (cnt > 0) and (clearcnt < 4) then
         begin
           i := i + 1;
           a[i].cmd := 'Clear';
           cnt := 0;
           clearcnt := clearcnt + 1;
           if not clear1 then
               clear1 := true;
         end;
      5: if useCount and (countcnt < 3) then
         begin
           i := i + 1;
           a[i].cmd := 'Count';
           countcnt := countcnt + 1;
         end;
      end;
      if i = n then break;
    end;
    if (push1 > 2) and pop0 and (pop1 > 3) and peek0
      and peek1 and empty0 and empty1 and clear1 and (not useCount or (countcnt > 0))then
    begin
      result := k;
      break;
    end;
  end;
end;

function WriteRes(name: string; n: integer; s: Stack): integer;
var f: TextFile;
    i: integer;
begin
  result := 0;
  AssignFile(f, name);
  Rewrite(f);
  for i := 1 to n do
  begin
    write(f, a[i].cmd, ': ');
    result := result + 1;
    if a[i].cmd = 'Push' then
    begin
      s.Push(a[i].par);
      result := result + 1;
    end
    else if a[i].cmd = 'Pop' then
    begin
      if (s.Empty = 1) and Excep then
      begin
        writeln(f, 'Empty stack in Pop');
        break;
      end;
      write(f, s.Pop, ' ');
    end
    else if a[i].cmd = 'Peek' then
    begin
      if (s.Empty = 1) and Excep then
      begin
        writeln(f, 'Empty stack in Peek');
        break;
      end;
      write(f, s.Peek, ' ');
    end
    else if a[i].cmd = 'Empty' then
    begin
      if s.Empty = 1 then
        write(f, 'True ')
      else
        write(f, 'False ')
    end
    else if a[i].cmd = 'Clear' then
      s.Clear
    else if a[i].cmd = 'Count' then
    begin
      if s is StackC then
        writeln(f, (s as StackC).Count)
      else
        writeln(f, 'Method not available');
      continue;
    end;
    writeln(f, s.ToStr);
  end;
  Close(f);
end;


procedure Pat1;
var name: string;
    n, i, k: integer;
    s: Stack;
begin
  CreateTask(Subgroup1);

TaskText(
'\BПоля и методы класса. Инкапсуляция\b. \PРеализовать класс \MStack\m, моделирующий'#13+
'стек целых чисел. Данные стека хранятся в виде односвязной цепочки узлов,'#13+
'имеющих два поля: \Mdata\m (содержит целое число~\= значение элемента стека) и \Mnext\m'#13+
'(содержит ссылку на следующий элемент стека). Узел реализовать в виде'#13+
'вспомогательного класса \MStackNode\m с открытыми полями \Mdata\m и \Mnext\m.'#13+
'Поля должны инициализироваться в конструкторе с помощью его одноименных'#13+
'параметров. Класс \MStack\m включает закрытое поле \Mtop\m типа \MStackNode\m,'#13+
'содержащее ссылку на вершину стека (или пустую ссылку, если стек пуст),'#13+
'конструктор без параметров, создающий пустой стек, и набор открытых методов:'#13+
'\P\X~\MEmpty\m (без параметров)~\= возвращает \M\t\m, если стек пуст, и~\M\f\m'#13+
'в противном случае; \P\X~\MPush(data)\m~\= добавляет в стек элемент со значением'#13+
'\Mdata\m (целочисленный параметр), ничего не возвращает; \P\X~\MPop\m (без параметров)~\='#13+
'извлекает из стека верхний элемент и возвращает его значение (если стек пуст,'#13+
'то возвращает число~0); \P\X~\MPeek\m (без параметров)~\= возвращает значение'#13+
'верхнего элемента, не удаляя его из стека (если стек пуст, то возвращает'#13+
'число~0); \P\X~\MClear\m (без параметров)~\= удаляет из стека все элементы,'#13+
'ничего не возвращает; \P\X~\MToStr\m (без параметров)~\= возвращает строковое'#13+
'представление содержимого стека в формате \<v1-v2-\.-vN-end\>, где v1, v2,~\.,'#13+
'vN~\= значения элементов стека, начиная с его вершины (например, \<12–34–end\>);'#13+
'для пустого стека функция должна возвращать только слово \<end\>.'#13+
'\PОбычно внешняя программа может использовать только методы класса, которые'#13+
'объявляются \Iоткрытыми\i (public), в то время как его поля делаются \Iзакрытыми\i'#13+
'(private). Это гарантирует, что внешняя программа не сможет изменить поля'#13+
'неправильным образом и тем самым нарушить нормальную работу объекта.'#13+
'Кроме того, скрытие полей дает возможность в дальнейшем изменить \Iреализацию\i'#13+
'класса (определяемую его полями), не изменяя его \Iинтерфейс\i (определяемый'#13+
'методами и используемый внешними программами). Так обеспечивается'#13+
'первый принцип ООП: \Iпринцип инкапсуляции\i (сокрытия данных).'#13+
TestHeader+
'Дана строка {Name} (имя файла), целое число {N} и набор из {N} элементов данных,'#13+
'каждый из которых определяет одну из команд стека. Для команд \MEmpty\m, \MPop\m,'#13+
'\MPeek\m, \MClear\m элемент данных представляет собой строку, совпадающую с именем'#13+
'команды; для команды \MPush\m элемент данных включает строку \<Push\> и целое число,'#13+
'которое требуется добавить в стек; команда \MToStr\m в набор не входит.'#13+
'\PСоздать объект \Ms\m типа \MStack\m и выполнить для него все команды из исходного'#13+
'набора, записывая информацию о выполнении команд в текстовый файл'#13+
'с именем {Name}. Все команды для стека должны вызываться во вспомогательной'#13+
'функции \MStackTest\m с параметром-ссылкой типа \MStack\m.'#13+
'\PИнформация о каждой команде занимает одну строку файла. Вначале выводится'#13+
'имя команды, двоеточие и пробел. Затем, если команда возвращает целочисленное'#13+
'значение, то выводится это значение, а если команда возвращает логическое'#13+
'значение, то выводится строка \<True\> в случае значения \M\t\m и строка \<False\>'#13+
'в случае значения \M\f\m. Кроме того, для каждой команды выводится строковое'#13+
'представление стека; для этого после вызова каждой команды дополнительно'#13+
'вызывается метод \MToStr\m для объекта \Ms\m, и его возвращаемое значение записывается'#13+
'в файл на той же строке, что и предыдущие данные текущей команды,'#13+
'отделяясь от них одним пробелом.'
);
  type1 := 'I';
  useCount := false;
  noPop0 := false;
  noPeek0 := false;
  Excep := false;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Name = ', name, xLeft, 1);
  DataN('N = ', n, xRight, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
      DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  s := Stack.Create;
  WriteRes(name, n, s);
  ResultFileT(name, 2, 5);               
end;

procedure Pat2;
var name: string;
    n, i, k: integer;
    s: Stack;
begin
  CreateTask(Subgroup1);

TaskText(
'\BНаследование\b. \P\IПринцип наследования\i является вторым принципом ООП;'#13+
'он позволяет создавать иерархии родственных классов. Класс, от которого'#13+
'порождается (наследуется) новый класс, называется \Iклассом-предком\i,'#13+
'или \Iбазовым классом\i, или \Iсуперклассом\i. Порожденный класс называется'#13+
'\Iклассом-потомком\i, или \Iпроизводным классом\i, или \Iсубклассом\i.'#13+
'\PРеализовать класс \MStackC\m, который является потомком класса \MStack\m'#13+
'(реализованного в задании \1) и обеспечивает дополнительную'#13+
'возможность: определение текущего количества элементов в стеке. Для этого'#13+
'добавить в класс \MStackC\m новое закрытое поле \Mcnt\m целого типа, открытый метод'#13+
'\MCount\m без параметров, возвращающий значение поля \Mcnt\m, и переопределить методы'#13+
'\MPush\m, \MPop\m и \MClear\m таким образом, чтобы они, помимо действий, предусмотренных'#13+
'в классе-предке \MStack\m, соответствующим образом корректировали значение'#13+
'поля \Mcnt\m. Определить конструктор, в котором задается начальное значение'#13+
'поля \Mcnt\m, равное~0. Кроме того, переопределить метод \MToStr\m, добавив к строке,'#13+
'возвращаемой методом \MToStr\m предка, значение поля \Mcnt\m в квадратных скобках,'#13+
'например, \<12–34–end[2]\>. Для пустого стека метод \MToStr\m'#13+
'должен возвращать строку \<end[0]\>.'#13+
TestHeader+
'Дана строка {Name} (имя файла), целое число {N} и набор из {N} элементов данных,'#13+
'каждый из которых определяет одну из команд стека по тем же правилам,'#13+
'что и в задании \1. Команды \MToStr\m и \MCount\m в набор не входят.'#13+
'\PСоздать объект \Ms\m типа \MStackC\m и выполнить для него все команды из исходного'#13+
'набора, записывая информацию о выполнении команд в текстовый файл'#13+
'с именем {Name} по тем же правилам, что и в \1. Как и в задании'#13+
'\1, команды для стека должны вызываться во вспомогательной'#13+
'функции \MStackTest\m, которая должна иметь параметр-ссылку типа \MStackC\m.'#13+
'За исключением типа своего параметра функция \MStackTest\m не должна'#13+
'отличаться от варианта, реализованного в задании \1.'
);
  type1 := 'I';
  useCount := false;
  noPop0 := false;
  noPeek0 := false;
  Excep := false;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Name = ', name, xLeft, 1);
  DataN('N = ', n, xRight, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
      DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  s := StackC.Create;
  WriteRes(name, n, s);
  ResultFileT(name, 2, 5);
end;

procedure Pat3;
var name, class1: string;
    n, i, k: integer;
    s: Stack;
begin
  CreateTask(Subgroup1);

TaskText(
'\BПолиморфизм\b. \PВ задании предполагается, что уже реализованы классы \MStack\m'#13+
'и \MStackC\m, описанные в заданиях \2 и \1. Изменить,'#13+
'при необходимости, реализацию методов \MPush\m, \MPop\m, \MClear\m и \MToStr\m этих классов'#13+
'таким образом, чтобы при вызове их методов выполнялось \Iпозднее связывание\i,'#13+
'(\Iсвязывание на этапе выполнения\i), благодаря которому выбор варианта'#13+
'вызываемого метода определяется фактическим типом объекта (указанным'#13+
'при его создании), а не базовым типом, использованным при его описании.'#13+
'Тем самым обеспечивается \Iпринцип полиморфизма\i~\= третий принцип ООП,'#13+
'позволяющий различным образом обрабатывать объекты разных типов,'#13+
'вызывая для них методы с одинаковыми именами. Для языков с динамической'#13+
'типизацией принцип полиморфизма обеспечивается автоматически для всех классов;'#13+
'для языков со статической типизацией могут потребоваться дополнительные'#13+
'действия при определении тех методов, для которых требуется реализовать'#13+
'позднее связывание (такие методы называются \Iвиртуальными\i).'#13+
TestHeader+
'Дана строка {Class} (тип создаваемого объекта), строка {Name} (имя файла),'#13+
'целое число {N} и набор из {N} элементов данных, каждый из которых определяет'#13+
'одну из команд стека по тем же правилам, что и в задании \2.'#13+
'Команды \MToStr\m и \MCount\m в набор не входят. Строка {Class} может принимать одно'#13+
'из двух значений: \<Stack\> или \<StackC\>.'#13+
'\PСоздать объект \Ms\m типа, указанного в строке {Class}, и выполнить для него'#13+
'все команды из исходного набора, записывая информацию о выполнении команд'#13+
'в текстовый файл с именем {Name} по тем же правилам, что и в \2.'#13+
'\PДля выполнения всех команд использовать один вызов функции \MStackTest\m'#13+
'с параметром требуемого типа; эта функция не должна отличаться от варианта,'#13+
'реализованного в задании \2 (в частности, ее формальный параметр'#13+
'должен быть ссылкой на тип \MStack\m).'
);
  type1 := 'I';
  useCount := false;
  noPop0 := false;
  noPeek0 := false;
  Excep := false;
  if Random(2) = 0 then
    class1 := 'Stack'
  else
    class1 := 'StackC';
  case CurrentTest of
  2: class1 := 'Stack';
  4: class1 := 'StackC';
  end;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Class = ', class1, 12, 1);
  DataS('Name = ', name, 33, 1);
  DataN('N = ', n, xRight, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
      DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  if class1 = 'Stack' then
    s := Stack.Create
  else
    s := StackC.Create;
  WriteRes(name, n, s);
  ResultFileT(name, 2, 5);
end;

procedure Pat4;
var name, class1: string;
    n, i, k: integer;
    s: Stack;
begin
  CreateTask(Subgroup2);

TaskText(
'\BПолучение информации о типе времени выполнения\b. \PЕсли в программе'#13+
'требуется вызвать метод, отсутствующий в базовом классе, но имеющийся'#13+
'в каком-либо производном классе, то механизм позднего связывания неприменим,'#13+
'и необходимо явным образом анализировать \Iинформацию о типе времени\i'#13+
'\Iвыполнения\i объекта (RTTI~\= Run-Time Type Information).'#13+
'\PВ данном задании предполагается, что уже реализованы классы \MStack\m'#13+
'и \MStackC\m, описанные в заданиях \3\:\1.'#13+
'\PДана строка {Class} (тип создаваемого объекта), строка {Name} (имя файла),'#13+
'целое число {N} и набор из {N} элементов данных, каждый из которых определяет'#13+
'одну из команд стека по тем же правилам, что и в задании \3.'#13+
'Команда {ToStr} в набор не входит, однако команда {Count} может входить.'#13+
'Строка {Class} может принимать одно из двух значений: \<Stack\> или \<StackC\>.'#13+
'\PСоздать объект \Ms\m типа, указанного в строке {Class}, и выполнить для него'#13+
'все команды из исходного набора, записывая информацию о выполнении команд'#13+
'в текстовый файл с именем {Name} по тем же правилам, что и в \3.'#13+
'\PКоманда \MCount\m обрабатывается по следующим дополнительным правилам: если'#13+
'объект имеет тип времени выполнения \MStack\m, то в строку файла записывается'#13+
'текст \<Count: Method not available\>, если объект имеет тип времени'#13+
'выполнения \MStackC\m, то строка файла должна содержать имя \<Count\>, двоеточие,'#13+
'пробел и значение, которое вернул метод \MCount\m (например, \<Count: 5\>;'#13+
'вызывать метод \MToStr\m и выводить его результат в данном случае не требуется).'#13+
'\PДля выполнения всех команд использовать один вызов функции \MStackTest\m'#13+
'с параметром требуемого типа; эта функция не должна отличаться от варианта,'#13+
'реализованного в задании \1, за исключением фрагмента,'#13+
'обрабатывающего команду \MCount\m.'
);
  type1 := 'I';
  useCount := true;
  noPop0 := false;
  noPeek0 := false;
  Excep := false;
  if Random(2) = 0 then
    class1 := 'Stack'
  else
    class1 := 'StackC';
  case CurrentTest of
  2: class1 := 'Stack';
  4: class1 := 'StackC';
  end;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Class = ', class1, 12, 1);
  DataS('Name = ', name, 33, 1);
  DataN('N = ', n, xRight, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
      DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  if class1 = 'Stack' then
    s := Stack.Create
  else
    s := StackC.Create;
  WriteRes(name, n, s);
  ResultFileT(name, 2, 5);
end;

procedure Pat5;
var name, class1: string;
    n, i, k: integer;
    s: Stack;
begin
  CreateTask(Subgroup2);

TaskText(
'\BГенерация и обработка исключений\b. \P\IИсключения\i (exceptions) являются'#13+
'универсальным механизмом, который дает возможность объектам стандартным'#13+
'образом оповещать внешнюю программу об особых ситуациях, возникающих'#13+
'при выполнении их методов, а внешней программе~\= гибко реагировать'#13+
'на возникшие особые ситуации. Как правило, конкретные исключения'#13+
'реализуются в виде иерархии специальных классов, которую можно расширять,'#13+
'наследуя новые классы исключений от существующих.'#13+
'\PИзменить методы \MPop\m и \MPeek\m классов \MStack\m и \MStackC\m, описанных в заданиях'#13+
'\4\:\2, таким образом, чтобы при попытке их вызова для'#13+
'пустого стека возбуждалось исключение \MStackException\m с текстовым сообщением'#13+
'\<Empty stack in Pop\> для метода \MPop\m и \<Empty stack in Peek\> для метода \MPeek\m.'#13+
TestHeader+
'Дана строка {Class} (тип создаваемого объекта), строка {Name} (имя файла),'#13+
'целое число {N} и набор из {N} элементов данных, каждый из которых определяет'#13+
'одну из команд стека по тем же правилам, что и в задании \4.'#13+
'Команды \MToStr\m и \MCount\m в набор не входят. Строка {Class} может принимать'#13+
'одно из двух значений: \<Stack\> или \<StackC\>.'#13+
'\PСоздать объект \Ms\m типа, указанного в строке {Class}, и выполнить для него'#13+
'команды из исходного набора, записывая информацию о выполнении команд'#13+
'в текстовый файл с именем {Name} по тем же правилам, что и в \4.'#13+
'\PЕсли в результате выполнения команды \MPop\m или \MPeek\m будет возбуждено'#13+
'исключение, то записать в очередную строку файла текст сообщения вида'#13+
'\<Pop: Empty stack in Pop\> или \<Peek: Empty stack in Peek\>, закрыть файл'#13+
'и прервать обработку команд.'#13+
'\PДля выполнения всех команд использовать один вызов функции \MStackTest\m'#13+
'(с параметром требуемого типа), модифицировав ее вариант,'#13+
'реализованный в задании \2 или \1.'
);
  type1 := 'I';
  useCount := false;
  Excep := true;
  if Random(2) = 0 then
  begin
    noPop0 := true;
    noPeek0 := false;
  end
  else
  begin
    noPop0 := false;
    noPeek0 := true
  end;
  if Random(2) = 0 then
    class1 := 'Stack'
  else
    class1 := 'StackC';
  case CurrentTest of
  2: begin
         class1 := 'Stack';
         noPop0 := true;
         noPeek0 := false;
     end;
  4: begin
         class1 := 'StackC';
         noPop0 := false;
         noPeek0 := true;
     end;
  5: begin
         class1 := 'Stack';
         noPop0 := false;
         noPeek0 := true;
     end;
  6: begin
         class1 := 'StackC';
         noPop0 := true;
         noPeek0 := false;
     end;
  end;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Class = ', class1, 12, 1);
  DataS('Name = ', name, 33, 1);
  DataN('N = ', n, xRight, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
      DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  if class1 = 'Stack' then
    s := Stack.Create
  else
    s := StackC.Create;
  k := WriteRes(name, n, s);
  ResultFileT(name, 2, 5);
  SetTestCount(7);
  SetRequiredDataCount(k + 3);
end;

procedure Pat6;
var name, class1: string;
    n, i, k, err: integer;
    r: real;
    s: Stack;
begin
  CreateTask(Subgroup2);

TaskText(
'\BШаблоны функций и шаблоны классов\b. \P\IШаблонные\i, или \Iобобщенные\i классы'#13+
'(templates, generics) имеются в языках со статической типизацией; они,'#13+
'в частности, упрощают реализацию коллекций, позволяющих хранить элементы'#13+
'определенного типа (этот тип при описании класса задается в виде'#13+
'\Iобобщенного параметра\i T). Наряду с шаблонными классами в таких языках'#13+
'можно использовать \Iшаблонные функции\i. В языках с динамической типизацией'#13+
'шаблонные классы и функции отсутствуют.'#13+
'\PПреобразовав при необходимости классы \MStackNode\m, \MStack\m и \MStackC\m'#13+
'в шаблонные классы (класс \MStackNode\m описан в задании \5,'#13+
'классы \MStack\m и \MStackC\m описаны, а затем модифицированы, в заданиях'#13+
'\5\:\1), обеспечить возможность работы со стеком, содержащим'#13+
'целочисленные, символьные или строковые данные (предполагается,'#13+
'что все элементы стека имеют одинаковый тип).'#13+
TestHeader+
'Дана строка {Class} (тип создаваемого объекта), символ {Type} (тип элементов'#13+
'стека), строка {Name} (имя файла), целое число {N} и набор из {N} элементов данных,'#13+
'каждый из которых определяет одну из команд стека по тем же правилам,'#13+
'что и в задании \5, за исключением того, что после строки \<Push\>'#13+
'указывается элемент данных типа, определяемого символом {Type}:'#13+
'\P\X~\<I\>~\= целочисленный тип, \P\X~\<C\>~\= символьный тип, \P\X~\<S\>~\= строковый тип.'#13+
'\PКоманды \MToStr\m и \MCount\m в набор не входят; набор команд также не содержит'#13+
'команд \MPop\m и \MPeek\m, вызываемых для пустого стека. Строка {Class} может принимать'#13+
'одно из двух значений: \<Stack\> или \<StackC\>.'#13+
'\PСоздать объект \Ms\m типа, указанного в строке {Class}, с элементами типа,'#13+
'определяемого символом {Type}, и выполнить для него команды из исходного набора,'#13+
'записывая информацию о выполнении команд в текстовый файл с именем {Name}'#13+
'по тем же правилам, что и в \5.'#13+
'\PДля выполнения всех команд использовать один вызов функции \MStackTest\m'#13+
'(с параметром требуемого типа), преобразовав при необходимости ее вариант,'#13+
'реализованный в одном из предыдущих заданий, в шаблонную функцию.'
);
// В данном варианте не используется стек с вещественными элементами
  useCount := false;
  noPop0 := true;
  noPeek0 := true;
  Excep := false;
  case Random(3) of
  0: type1 := 'I';
  1: type1 := 'C';
  2: type1 := 'S';
//  3: type1 := 'R';
  end;
  if Random(2) = 0 then
    class1 := 'Stack'
  else
    class1 := 'StackC';
  case CurrentTest of
  2: begin
         class1 := 'Stack';
         type1 := 'I';
     end;
  3: begin
         class1 := 'StackC';
         type1 := 'S';
     end;
  5: begin
         class1 := 'StackC';
         type1 := 'C';
     end;
  6: begin
         class1 := 'Stack';
         type1 := 'S';
     end;
  8: begin
         class1 := 'Stack';
         type1 := 'C';
     end;
  9: begin
         class1 := 'StackC';
         type1 := 'I';
     end;
  end;
  name := FileName(4) + '.tst';
  n := Random(6) + 19;
  DataS('Class = ', class1, 12, 1);
  DataC('Type = ', type1, 31, 1);
  DataS('Name = ', name, 44, 1);
  DataN('N = ', n, 64, 1, 2);
  k := CreateCommands(n);
  for k := 0 to 2 do
    for i := 1 to 6 do
    begin
      DataS('', a[i + 6*k].cmd, Center(i, 6, 12, 1), k + 2);
      if a[i + 6*k].cmd = 'Push' then
        case type1 of
        'I': DataN('', StrToInt(a[i + 6*k].par), Center(i, 6, 12, 1) + 7, k + 2, 2);
        'R': begin
               Val(a[i + 6*k].par, r, err);
               DataR('', r, Center(i, 6, 12, 1) + 7, k + 2, 4);
             end;
        'C': DataC('', a[i + 6*k].par[1], Center(i, 6, 12, 1) + 7, k + 2);
        'S': DataS('', a[i + 6*k].par, Center(i, 6, 12, 1) + 7, k + 2);
        end;
    end;
  for i := 1 to n - 18 do
  begin
    DataS('', a[i + 18].cmd, Center(i, 6, 12, 1), 5);
    if a[i + 18].cmd = 'Push' then
        case type1 of
        'I': DataN('', StrToInt(a[i + 18].par), Center(i, 6, 12, 1) + 7, 5, 2);
        'R': begin
               Val(a[i + 18].par, r, err);
               DataR('', r, Center(i, 6, 12, 1) + 7, 5, 4);
             end;
        'C': DataC('', a[i + 18].par[1], Center(i, 6, 12, 1) + 7, 5);
        'S': DataS('', a[i + 18].par, Center(i, 6, 12, 1) + 7, 5);
        end;
  end;
  ResultComment('Содержимое результирующего файла:', 0, 1);
  if class1 = 'Stack' then
    s := Stack.Create
  else
    s := StackC.Create;
  k := WriteRes(name, n, s);
  ResultFileT(name, 2, 5);
  SetTestCount(9);
end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Pat1;
  2: Pat2;
  3: Pat3;
  4: Pat4;
  5: Pat5;
  6: Pat6;
  end;
end;

procedure inittaskgroup;
begin
  // процедура inittaskgroup должна быть оформлена как экспортируемая
  // процедура данной библиотеки; в ней выполняется вызов стартовой
  // процедуры CreateGroup и могут вызываться процедуры, связанные
  // с добавлением комментариев (преамбул) для группы и ее подгрупп
  if CurrentLanguage = lgC then
    exit;
  CreateGroup('OOP0Begin', 'Введение в ООП',
    'М. Э. Абрамян, 2022', 'qwкее6#EnTopic<Introduction to OOP>#433365411111оьdfttd', 6, InitTask);
end;

//exports inittaskgroup, activate;

begin
end.
