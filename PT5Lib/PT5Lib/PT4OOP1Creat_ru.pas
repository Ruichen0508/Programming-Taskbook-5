{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

//---------------------------------
unit PT4OOP1Creat_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  TestHeader = '\P\SТестирование разработанной системы классов\s.'#13;
  Subgroup1 = 'Factory Method, Abstract Factory';
  Subgroup2 = 'Singleton, Prototype, Builder';

type
  Builder = class
    procedure BuildStart; virtual;
    procedure BuildPartA; virtual;
    procedure BuildPartB; virtual;
    procedure BuildPartC; virtual;
    function GetResult: string; virtual; abstract;
  end;
  ConcreteBuilder1 = class(Builder)
  private
    product: string;
  public
    procedure BuildStart; override;
    procedure BuildPartA; override;
    procedure BuildPartB; override;
    procedure BuildPartC; override;
    function GetResult: string; override;
  end;
  ConcreteBuilder2 = class(Builder)
  private
    product: string;
  public
    procedure BuildStart; override;
    procedure BuildPartA; override;
    procedure BuildPartB; override;
    procedure BuildPartC; override;
    function GetResult: string; override;
  end;
  Director = class
  private
    b: Builder;
  public
    constructor Create(b: Builder);
    procedure Construct(templat: string);
    function GetResult: string;
  end;


  Builder1 = class
    procedure BuildStart(c: char); virtual;
    procedure BuildFirstChar(c: char); virtual;
    procedure BuildNextChar(c: char); virtual;
    procedure BuildFirstSpace; virtual;
    procedure BuildNextSpace; virtual;
    function GetResult: string; virtual; abstract;
  end;
  BuilderPascal = class(Builder1)
  private
    product: string;
  public
    procedure BuildStart(c: char); override;
    procedure BuildFirstChar(c: char); override;
    procedure BuildNextChar(c: char); override;
    function GetResult: string; override;
  end;

  BuilderPython = class(Builder1)
  private
    product: string;
  public
    procedure BuildStart(c: char); override;
    procedure BuildFirstChar(c: char); override;
    procedure BuildNextChar(c: char); override;
    procedure BuildFirstSpace; override;
    function GetResult: string; override;
  end;

  BuilderC = class(Builder1)
  private
    product: string;
  public
    procedure BuildStart(c: char); override;
    procedure BuildFirstChar(c: char); override;
    procedure BuildNextChar(c: char); override;
    function GetResult: string; override;
  end;



  Director1 = class
  private
    b: Builder1;
  public
    constructor Create(b: Builder1);
    procedure Construct(s: string);
    function GetResult: string;
  end;

    constructor Director.Create(b: Builder);
    begin
      self.b := b;
    end;

    constructor Director1.Create(b: Builder1);
    begin
      self.b := b;
    end;

    procedure Director.Construct(templat: string);
    var i: integer;
    begin
      b.BuildStart;
      for i := 1 to Length(templat) do
      case templat[i] of
      'A': b.BuildPartA;
      'B': b.BuildPartB;
      'C': b.BuildPartC;
      end;
    end;


    procedure Director1.Construct(s: string);
    var i: integer;
        prevSpace: boolean;
    begin
      prevSpace := false;
      b.BuildStart(s[1]);
      for i := 2 to Length(s) do
      case s[i] of
      ' ': if prevSpace then
             b.BuildNextSpace
           else
           begin
             b.BuildFirstSpace;
             prevSpace := true;
           end;
      else if prevSpace then
           begin
             b.BuildFirstChar(s[i]);
             prevSpace := false;
           end
           else
             b.BuildNextChar(s[i]);
      end;
    end;

    function Director.GetResult: string;
    begin
      result := b.GetResult;
    end;

    function Director1.GetResult: string;
    begin
      result := b.GetResult;
    end;


    procedure Builder.BuildStart; begin end;
    procedure Builder.BuildPartA; begin end;
    procedure Builder.BuildPartB; begin end;
    procedure Builder.BuildPartC; begin end;

    procedure ConcreteBuilder1.BuildStart; begin product := ''; end;
    procedure ConcreteBuilder1.BuildPartA; begin product := product + '-1-'; end;
    procedure ConcreteBuilder1.BuildPartB; begin product := product + '-2-'; end;
    procedure ConcreteBuilder1.BuildPartC; begin product := product + '-3-'; end;
    function ConcreteBuilder1.GetResult: string; begin result := product; end;

    procedure ConcreteBuilder2.BuildStart; begin product := ''; end;
    procedure ConcreteBuilder2.BuildPartA; begin product := product + '=*='; end;
    procedure ConcreteBuilder2.BuildPartB; begin product := product + '=**='; end;
    procedure ConcreteBuilder2.BuildPartC; begin product := product + '=***='; end;
    function ConcreteBuilder2.GetResult: string; begin result := product; end;



  procedure Builder1.BuildStart(c: char); begin end;
  procedure Builder1.BuildFirstChar(c: char); begin end;
  procedure Builder1.BuildNextChar(c: char); begin end;
  procedure Builder1.BuildFirstSpace; begin end;
  procedure Builder1.BuildNextSpace; begin end;

  procedure BuilderPascal.BuildStart(c: char); begin product := LowerCase(c); end;
  procedure BuilderPascal.BuildFirstChar(c: char); begin product := product + UpperCase(c); end;
  procedure BuilderPascal.BuildNextChar(c: char); begin product := product + LowerCase(c); end;
  function BuilderPascal.GetResult: string; begin result := product; end;

  procedure BuilderPython.BuildStart(c: char); begin product := LowerCase(c); end;
  procedure BuilderPython.BuildFirstChar(c: char); begin product := product + LowerCase(c); end;
  procedure BuilderPython.BuildNextChar(c: char); begin product := product + LowerCase(c); end;
  procedure BuilderPython.BuildFirstSpace; begin product := product + '_'; end;
  function BuilderPython.GetResult: string; begin result := product; end;

  procedure BuilderC.BuildStart(c: char); begin product := LowerCase(c); end;
  procedure BuilderC.BuildFirstChar(c: char); begin product := product + LowerCase(c); end;
  procedure BuilderC.BuildNextChar(c: char); begin product := product + LowerCase(c); end;
  function BuilderC.GetResult: string; begin result := product; end;






procedure Pat1;
var b1, b2: Builder;
    d1, d2: Director;
    s: string;
    i, j: integer;
begin
  CreateTask(Subgroup2);

TaskText(
'\G<Graph\OOPBuilder.png>\BBuilder\b (\BСтроитель\b)~\= порождающий паттерн.'#13+
'\P\SЧастота использования\s: ниже средней.'#13+
'\P\SНазначение\s: отделяет конструирование сложного объекта от его представления,'#13+
'так что в результате одного и того же процесса конструирования могут'#13+
'получаться разные представления.'#13+
'\P\SУчастники\s: \P\X~\IBuilder\i (\IСтроитель\i)~\= задает абстрактный интерфейс'#13+
'для создания частей объекта Product; \P\X~\IConcreteBuilder\i (\IКонкретный\i'#13+
'\Iстроитель\i)~\= конструирует и собирает вместе части продукта посредством'#13+
'реализации интерфейса Builder, предоставляет интерфейс для доступа к продукту;'#13+
'\P\X~\IDirector\i (\IРаспорядитель\i)~\= конструирует объект Product,'#13+
'пользуясь интерфейсом Builder; \P\X~\IProduct\i (\IПродукт\i)~\= представляет'#13+
'сложный конструируемый объект.'#13+
'\P\SЗадание 1\s. Реализовать иерархию классов-строителей, конструирующих'#13+
'продукты-строки. Иерархия включает абстрактный класс \MBuilder\m, который'#13+
'предоставляет интерфейс для инициализации продукта (\MBuildStart\m) и создания'#13+
'трех его фрагментов (\MBuildPartA\m, \MBuildPartB\m, \MBuildPartC\m), и конкретные классы'#13+
'\MConcreteBuilder1\m и \MConcreteBuilder2\m, которые определяют конкретные способы'#13+
'конструирования. Методы \MBuildStart\m, \MBuildPartA\m, \MBuildPartB\m, \MBuildPartC\m'#13+
'не имеют параметров и не возвращают значений. В абстрактном классе \MBuilder\m'#13+
'подобные методы обычно не выполняют никаких действий, хотя и не являются'#13+
'абстрактными; это позволяет конкретному классу-строителю не переопределять'#13+
'некоторые из них, если его устраивает поведение по умолчанию. Кроме того,'#13+
'в классе \MBuilder\m определен абстрактный метод \MGetResult\m без параметров,'#13+
'возвращающий строку-продукт.'#13+
'\PКонкретные классы \MConcreteBuilder1\m и \MConcreteBuilder2\m содержат строковое поле'#13+
'\Mproduct\m; их метод \MGetResult\m возвращает текущее значение поля \Mproduct\m.'#13+
'В конструкторе этих классов поле \Mproduct\m инициализируется пустой строкой,'#13+
'это же действие выполняет и метод \MBuildStart\m. Каждый из методов \MBuildPartA\m,'#13+
'\MBuildPartB\m, \MBuildPartC\m добавляет к строке \Mproduct\m новый текстовый фрагмент;'#13+
'для класса \MConcreteBuilder1\m фрагменты A, B, C представляют собой строки'#13+
'\<-1-\>, \<-2-\> и \<-3-\>, а для класса \MConcreteBuilder2\m~\='#13+
'строки \<=*=\>, \<=**=\> и \<=***=\>.'#13+
'\PТакже определить класс \MDirector\m, содержащий поле \Mb\m~\= ссылку на объект типа'#13+
'\MBuilder\m (поле \Mb\m инициализируется в конструкторе с использованием'#13+
'одноименного параметра) и два метода: \MConstruct(templat)\m и \MGetResult\m.'#13+
'Метод \MGetResult\m не имеет параметров и возвращает значение метода \MGetResult\m'#13+
'объекта~\Mb\m, т.\,е. построенный продукт. Метод \MConstruct\m обеспечивает построение'#13+
'продукта; его строковый параметр \Mtemplat\m определяет план строительства.'#13+
'В данном случае план определяется последовательностью символов \<A\>, \<B\>, \<C\>,'#13+
'каждый из которых соответствует фрагменту A, B, C, добавляемому'#13+
'к конструируемой строке в указанном порядке. Строка \Mtemplat\m может содержать'#13+
'символы, отличные от \<A\>, \<B\>, \<C\>; подобные символы игнорируются.'#13+
'В начале своей работы метод \MConstruct\m должен вызвать метод \MBuildStart\m.'#13+
TestHeader+
'Даны пять строк, каждая из которых содержит план строительства. Создать два'#13+
'экземпляра \Md1\m и \Md2\m класса \MDirector\m, передав первому экземпляру объект типа'#13+
'\MConcreteBuilder1\m, а второму~\= объект типа \MConcreteBuilder2\m. Вызвать метод'#13+
'\MConstruct\m объектов \Md1\m и \Md2\m для каждой из исходных строк и вывести полученные'#13+
'результаты, используя метод \MGetResult\m (вначале выводятся результаты для первой'#13+
'исходной строки, затем для второй и т.\,д.).'
);

  b1 := ConcreteBuilder1.Create;
  b2 := ConcreteBuilder2.Create;
  d1 := Director.Create(b1);
  d2 := Director.Create(b2);
  for i := 1 to 5 do
  begin
    while true do
    begin
      s := '';
      for j := 1 to Random(5)+5 do
      case Random(4) of
      0: s := s + ' ';
      1: s := s + 'A';
      2: s := s + 'B';
      3: s := s + 'C';
      end;
      d1.Construct(s);
      d2.Construct(s);
      if length(d2.GetResult) <= 36 then
      begin
        DataS('',s,0,i);
        ResultS('',d1.GetResult,xLeft,i);
        ResultS('',d2.GetResult,xRight,i);
        break;
      end;
    end;
  end;
end;


function v(s: string): string;
var i: integer;
    s1: string;
begin
  result := s;
  case Random(3) of
  0: begin
       for i := 1 to length(s) do
       begin
          s1 := LowerCase(result[i]);
          result[i] := s1[1];
       end;
       s1 := UpperCase(result[1]);
       result[1] := s1[1];
     end;
  1: for i := 1 to length(s) do
     begin
       s1 := LowerCase(result[i]);
       result[i] := s1[1];
     end;
  2: for i := 1 to length(s) do
     begin
       s1 := UpperCase(result[i]);
       result[i] := s1[1];
     end;
  end;
end;


procedure Pat2;
var b1, b2, b3: Builder1;
    d1, d2, d3: Director1;
    s: string;
    i: integer;
    a, a2: array[1..4]of string;
    a3: array[1..6]of string;
function sp(n: integer): string;
var i: integer;
begin
  result := ' ';
  for i := 1 to n do
    result := result + ' ';
end;
begin
  CreateTask(Subgroup2);

TaskText(
'\BBuilder\b (\BСтроитель\b)~\= порождающий паттерн.'#13+
'\P\SЗадание 2\s. Реализовать систему классов, позволяющую по строковым описаниям'#13+
'генерировать идентификаторы, которые удовлетворяют соглашениям различных'#13+
'языков программирования. Каждое строковое описание представляет собой одно'#13+
'или более слов, разделенных одним или несколькими пробелами; начальные'#13+
'и конечные пробелы отсутствуют, регистр букв является произвольным.'#13+
'\PАбстрактный класс \MBuilder\m содержит методы для конструирования первого символа'#13+
'идентификатора (\MBuildStart\m), первого символа каждого последующего слова'#13+
'(\MBuildFirstChar\m), последующих символов слов (\MBuildNextChar\m)'#13+
'и символов-разделителей между словами (\MBuildDelim\m). Методы \MBuildStart\m,'#13+
'\MBuildFirstChar\m и \MBuildNextChar\m имеют символьный параметр, используемый'#13+
'при конструировании (возможно, после изменения его регистра); метод'#13+
'\MBuildDelim\m не имеет параметров. Все эти методы не возвращают значений;'#13+
'в классе \MBuilder\m они не выполняют никаких действий. Кроме того, класс \MBuilder\m'#13+
'содержит абстрактный метод \MGetResult\m без параметров,'#13+
'возвращающий строковое значение.'#13+
'\PКонкретные классы \MBuilderPascal\m, \MBuilderPython\m, \MBuilderC\m содержат строковое'#13+
'поле \Mproduct\m, которое инициализируется пустой строкой в конструкторе,'#13+
'обновляется в методе \MBuildStart\m и дополняется в методах \MBuildFirstChar\m,'#13+
'\MBuildNextChar\m и, возможно, в методе \MBuildDelim\m. Метод \MGetResult\m'#13+
'возвращает значение поля \Mproduct\m. При определении остальных методов'#13+
'конкретных строителей следует учитывать правила формирования'#13+
'идентификаторов для конкретных языков программирования: \P\X~для языка Pascal'#13+
'идентификатор должен начинаться со строчной (маленькой) буквы, последующие'#13+
'слова~\= с заглавной буквы, все прочие буквы являются строчными,'#13+
'символы-разделители не используются; \P\X~для языка Python все буквы являются'#13+
'строчными, а между словами добавляется символ подчеркивания; \P\X~для языка С'#13+
'все буквы являются строчными, символы-разделители не используются.'#13+
'\PИз перечисленных правил следует, в частности, что для классов \MBuilderPascal\m'#13+
'и \MBuilderC\m не требуется переопределять метод BuildDelim.'#13+
'\PТакже определить класс \MDirector\m, содержащий ссылочное поле \Mb\m типа \MBuilder\m'#13+
'(поле \Mb\m инициализируется в конструкторе с использованием одноименного'#13+
'параметра), и два метода: \MConstruct(templat)\m и \MGetResult\m.'#13+
'Метод \MGetResult\m не имеет параметров и возвращает значение метода \MGetResult\m'#13+
'объекта \Mb\m. Метод \MConstruct\m обеспечивает построение продукта; его строковый'#13+
'параметр \Mtemplat\m содержит строковое описание, на основании которого должен'#13+
'конструироваться идентификатор по правилам, реализованным в строителе \Mb\m.'#13+
'В начале работы метод \MConstruct\m должен вызвать метод \MBuildStart\m с параметром~\='#13+
'первым символом строки \Mtemplat\m. При анализе строки \Mtemplat\m необходимо'#13+
'различать первый пробел в последовательности пробелов (для которого'#13+
'надо вызывать метод \MBuildDelim\m) и последующие пробелы'#13+
'(которые должны игнорироваться).'#13+
TestHeader+
'Даны пять строк, содержащих строковые описания, которые удовлетворяют'#13+
'условиям, перечисленным в начале формулировки задания. Создать'#13+
'три объекта-распорядителя \MDirector\m, связанных со строителями \MBuilderPascal\m,'#13+
'\MBuilderPython\m, \MBuilderC\m, сохранив их в массиве или другой структуре данных.'#13+
'Используя методы \MConstruct\m и \MGetResult\m каждого из созданных распорядителей,'#13+
'получить по каждой из исходных строк идентификаторы на языке Pascal, Python'#13+
'и C и вывести их в указанном порядке (вначале выводятся идентификаторы,'#13+
'полученные на основе первой строки, затем на основе второй и т.\,д.).'
);
  a[1] := 'First';
  a[2] := 'Second';
  a[3] := 'Next';
  a[4] := 'Last';
  a2[1] := 'Positive';
  a2[2] := 'Negative';
  a2[3] := 'Odd';
  a2[4] := 'Even';
  a3[1] := 'Sum';
  a3[2] := 'Product';
  a3[3] := 'Minimum';
  a3[4] := 'Maximum';
  a3[5] := 'Value';
  a3[6] := 'Term';
  b1 := BuilderPascal.Create;
  b2 := BuilderPython.Create;
  b3 := BuilderC.Create;
  d1 := Director1.Create(b1);
  d2 := Director1.Create(b2);
  d3 := Director1.Create(b3);
  for i := 1 to 5 do
  begin
      s := '';
      if Random(2) = 0 then
        s := v(a[Random(4)+1]) + sp(Random(3)+1);
      if Random(2) = 0 then
        s := v(s + a2[Random(4)+1]) + sp(Random(3)+1);
      s := s + v(a3[Random(6)+1]);
      d1.Construct(s);
      d2.Construct(s);
      d3.Construct(s);
      DataS('',s,0,i);
      ResultS('',d1.GetResult,(25 - length(d1.GetResult)) div 2,i);
      ResultS('',d2.GetResult,0,i);
      ResultS('',d3.GetResult,53 + (25 - length(d3.GetResult)) div 2,i);
  end;
end;

procedure Transform1(var s: string);
var i: integer;
begin
  for i := Length(s)-1 downto 1 do
    if s[i] <> ' ' then
      Insert(' ', s, i+1);
end;

procedure Transform2(var s: string);
var i: integer;
begin
  for i := Length(s)-1 downto 1 do
    if s[i] <> '*' then
      Insert('**', s, i+1);
end;

procedure Transform3(var s: string);
var i: integer;
    isLast: boolean;
begin
//  isLast := true;
  for i := Length(s)-1 downto 1 do
    if (s[i] <> '*') then
//      if not IsLast then
        Insert('*', s, i+1);
//      else
//        IsLast := false;
end;

procedure Transform4(var s: string);
begin
  Transform3(s);
  s := '==' + s + '==';
end;

function centers(s: string; start, width: integer): integer;
begin
  result := start + (width - Length(s)) div 2;
end;

procedure Pat3;
var s, s1: string;
    i: integer;
begin
  CreateTask(Subgroup1);

TaskText(
'\G<Graph\OOPFactoryMethod.png>\BFactory Method\b (\BФабричный метод\b)~\= порождающий паттерн.'#13+
'\PИзвестен также под именем \BVirtual Constructor\b (\BВиртуальный конструктор\b).'#13+
'\P\SЧастота использования\s: высокая.'#13+
'\P\SНазначение\s: определяет интерфейс для создания объекта, но оставляет подклассам'#13+
'решение о том, какой класс инстанцировать. Фабричный метод позволяет классу'#13+
'делегировать инстанцирование подклассам.'#13+
'\P\SУчастники\s: \P\X~\IProduct\i (\IПродукт\i)~\= определяет интерфейс объектов, создаваемых'#13+
'фабричным методом; \P\X~\IConcreteProduct\i (\IКонкретный продукт\i)~\= реализует'#13+
'интерфейс Product; \P\X~\ICreator\i (\IСоздатель\i)~\= объявляет фабричный метод,'#13+
'возвращающий объект типа Product; может также определять реализацию фабричного'#13+
'метода по умолчанию, возвращающую некоторый конкретный продукт; реализует'#13+
'методы, в которых используется объект Product, созданный фабричным методом;'#13+
'\P\X~\IConcreteCreator\i (\IКонкретный создатель\i)~\= замещает фабричный метод'#13+
'для создания конкретного продукта.'#13+
'\P\SЗадание 1\s. Реализовать две иерархии классов, в одну из которых'#13+
'входят абстрактный создатель \MCreator\m и два конкретных создателя'#13+
'\MConcreteCreator1\m и \MConcreteCreator2\m, а в другую~\= абстрактный продукт'#13+
'\MProduct\m и два конкретных продукта \MConcreteProduct1\m и \MConcreteProduct2\m.'#13+
'\PАбстрактный класс \MProduct\m содержит два абстрактных метода, связанных'#13+
'с получением и преобразованием строки: метод \MGetInfo\m без параметров,'#13+
'возвращающий строку, и метод \MTransform\m без параметров, который ничего'#13+
'не возвращает. Классы \MConcreteProduct1\m и \MConcreteProduct2\m содержат строковое'#13+
'поле \Minfo\m, которое инициализируется в конструкторе с помощью одноименного'#13+
'параметра, после чего в конструкторе класса \MConcreteProduct1\m поле \Minfo\m'#13+
'преобразуется к нижнему регистру, а в конструкторе класса \MConcreteProduct2\m~\='#13+
'к верхнему. Метод \MGetInfo\m в каждом подклассе возвращает текущее значение'#13+
'поля \Minfo\m, а метод \MTransform\m преобразует это поле следующим образом:'#13+
'для \MConcreteProduct1\m он добавляет дополнительный пробел после каждого'#13+
'непробельного символа поля \Minfo\m (кроме его последнего символа),'#13+
'а для \MConcreteProduct2\m он добавляет два дополнительных символа * (звездочка)'#13+
'после каждого символа, отличного от звездочки (кроме последнего символа).'#13+
'\PАбстрактный класс \MCreator\m содержит абстрактный фабричный метод'#13+
'\MFactoryMethod(info)\m со строковым параметром \Minfo\m, возвращающий ссылку'#13+
'на объект \MProduct\m. Этот метод определяется в классах \MConcreteCreator1\m'#13+
'и \MConcreteCreator2\m, причем фабричный метод класса \MConcreteCreator1\m создает'#13+
'объект типа \MConcreteProduct1\m, а фабричный метод класса \MConcreteCreator2\m'#13+
'создает объект типа \MConcreteProduct2\m; в любом случае конструктору создаваемого'#13+
'объекта передается параметр \Minfo\m фабричного метода.'#13+
'\PВ абстрактном классе \MCreator\m дополнительно определить метод'#13+
'\MAnOperation(info)\m, который создает продукт с помощью фабричного метода,'#13+
'передавая ему параметр \Minfo\m, дважды вызывает метод \MTransform\m созданного'#13+
'продукта и с помощью его метода \MGetInfo\m возвращает полученный результат.'#13+
'Использование фабричного метода в методе \MAnOperation\m приводит к тому,'#13+
'что выполнение метода \MAnOperation\m в подклассах класса \MCreator\m дает'#13+
'различные результаты, зависящие от свойств создаваемых продуктов, причем'#13+
'такое поведение реализуется \Iбез изменения кода\i метода \MAnOperation\m.'#13+
TestHeader+
'Даны пять строк. Используя конкретных создателей 1 и 2, применить к каждой'#13+
'из данных строк метод \MAnOperation\m и вывести возвращаемый результат'#13+
'этого метода (вначале выводятся результаты для первой строки,'#13+
'затем для второй и т.\,д.).'
);
  for i := 1 to 5 do
  begin
    repeat
      s := v(EnWordSample(Random(EnWordCount)));
    until Length(s) <= 8;
      DataS('',s,Center(i, 5, 8, 5),1);
      s1 := LowerCase(s);
      Transform1(s1);
      Transform1(s1);
      ResultS('',s1,centers(s1, 1, 30),i);
      s1 := UpperCase(s);
      Transform2(s1);
      Transform2(s1);
      ResultS('',s1,centers(s1, 31, 47),i);
  end;
end;


procedure Pat4;
var s, s1: string;
    i: integer;
begin
  CreateTask(Subgroup1);

TaskText(
'\BFactory Method\b (\BФабричный метод\b)~\= порождающий паттерн.'#13+
'\P\SЗадание 2\s. Данное задание аналогично предыдущему (см. \1),'#13+
'однако в нем не используются абстрактные классы. Иерархию классов-\Iпродуктов\i'#13+
'представляет конкретный класс \MConcreteProduct1\m и его потомок \MConcreteProduct2\m,'#13+
'иерархию классов-\Iсоздателей\i представляет конкретный класс \MConcreteCreator1\m'#13+
'и его потомок \MConcreteCreator2\m. Как и в предыдущем задании, классы-продукты'#13+
'обеспечивают хранение и получение строки (поле \Minfo\m и метод \MGetInfo\m, который'#13+
'возвращает значение поля \Minfo\m), а также ее преобразование (метод \MTransform\m).'#13+
'Поле \Minfo\m инициализируется в конструкторе с помощью одноименного параметра,'#13+
'после чего конструктор класса \MConcreteProduct1\m преобразует поле \Minfo\m к нижнему'#13+
'регистру, а конструктор класса \MConcreteProduct2\m выполняет то же действие,'#13+
'но дополнительно преобразует первый символ строки к верхнему регистру. Метод'#13+
'\MTransform\m для конкретного продукта~1 добавляет дополнительный символ~*'#13+
'(звездочка) после каждого символа исходной строки \Minfo\m, отличного от звездочки'#13+
'(кроме последнего символа строки). Метод \MTransform\m для конкретного продукта~2'#13+
'выполняет те же действия и дополнительно добавляет по два символа~='#13+
'(знак равенства) в начало и конец строки.'#13+
'\PВ классах \MConcreteProduct1\m и \MConcreteProduct2\m определить фабричный метод'#13+
'\MFactoryMethod(info)\m со строковым параметром, возвращающий ссылку на объект'#13+
'\MConcreteProduct1\m. Фабричный метод класса \MConcreteCreator1\m создает'#13+
'объект типа \MConcreteProduct1\m, а фабричный метод класса \MConcreteCreator2\m'#13+
'создает объект типа \MConcreteProduct2\m; в любом случае конструктору'#13+
'создаваемого объекта передается параметр \Minfo\m фабричного метода. В классе'#13+
'\MConcreteCreator1\m также определить метод \MAnOperation(info)\m, который'#13+
'создает продукт с помощью фабричного метода, передавая ему параметр \Minfo\m,'#13+
'дважды вызывает метод \MTransform\m созданного продукта и с помощью его метода'#13+
'\MGetInfo\m возвращает полученный результат.'#13+
TestHeader+
'Даны пять строк. Используя конкретных создателей 1 и 2, применить к каждой'#13+
'из данных строк метод \MAnOperation\m и вывести возвращаемый результат'#13+
'этого метода (вначале выводятся результаты для первой строки,'#13+
'затем для второй и т.\,д.).'
);
  for i := 1 to 5 do
  begin
    repeat
      s := v(EnWordSample(Random(EnWordCount)));
    until Length(s) <= 9;
      DataS('',s,Center(i, 5, 9, 5),1);
      s1 := LowerCase(s);
      Transform3(s1);
      Transform3(s1);
      ResultS('',s1,centers(s1, 1, 30),i);
      s1 := LowerCase(s);
      s1[1] := UpCase(s[1]);
      Transform4(s1);
      Transform4(s1);
      ResultS('',s1,centers(s1, 31, 47),i);
  end;
end;

procedure Swap(var s1, s2: string);
var s: string;
begin
  s := s1;
  s1 := s2;
  s2 := s;
end;

procedure Pat5;
var i,c: integer;
    name: string;
    an: array [1..6] of string;
    names: array [1..8] of string;
    a1, a2: array [1..5] of string;

begin
  CreateTask(Subgroup1);

TaskText(
'\BFactory Method\b (\BФабричный метод\b)~\= порождающий паттерн.'#13+
'\P\SЗадание 3\s. Реализовать иерархию классов-животных с абстрактным предком \MAnimal\m,'#13+
'содержащим метод \MGetInfo\m, который возвращает строковое значение, и шестью'#13+
'конкретными потомками: \MLion\m, \MTiger\m, \MLeopard\m (кошачьи, cats), \MGorilla\m,'#13+
'\MOrangutan\m, \MChimpanzee\m (человекообразные обезьяны, apes). Каждый конкретный'#13+
'класс содержит строковое поле \Mname\m (имя животного), которое определяется'#13+
'в его конструкторе с помощью одноименного параметра. Метод \MGetInfo\m возвращает'#13+
'имя класса и имя животного, разделенные пробелом, например, \<Lion Tom\>.'#13+
'\PРеализовать иерархию классов-создателей с абстрактным предком'#13+
'\MAnimalCreator\m и конкретными потомками \MCatCreator\m и \MApeCreator\m. Фабричный'#13+
'метод \MCreateAnimal(ind, name)\m этих классов принимает параметр целого типа \Mind\m'#13+
'и строковый параметр \Mname\m и возвращает объект типа \MAnimal\m.'#13+
'Для конкретных классов \MCatCreator\m и \MApeCreator\m параметр \Mind\m метода'#13+
'\MCreateAnimal\m определяет тип создаваемого животного по его индексу (0,~1'#13+
'или~2) в группе кошачьих или обезьян, а параметр \Mname\m~\= имя животного.'#13+
'\PВ классе \MAnimalCreator\m также определить метод \MGetZoo\m с двумя'#13+
'параметрами-массивами \Minds\m и \Mnames\m одинакового размера; массив \Minds\m содержит'#13+
'целые числа, массив \Mnames\m~\= строки (предполагается, что элементы массива \Minds\m'#13+
'всегда имеют значения в диапазоне от~0 до~2). Метод \MGetZoo\m возвращает массив'#13+
'объектов \MAnimal\m того же размера, что и массивы \Minds\m и \Mnames\m; каждый элемент'#13+
'полученного массива определяется с помощью фабричного метода с параметрами,'#13+
'равными значениям соответствующих элементов массивов \Minds\m и \Mnames\m.'#13+
TestHeader+
'Дан набор из 4 пар ({ind}, {name}), где {ind} \= целое число в диапазоне от~0 до~2,'#13+
'а {name} \= строка. Сформировать массивы \Minds\m и \Mnames\m размера 4, содержащие'#13+
'числа и строки из исходного набора, и использовать их в методе \MGetZoo\m'#13+
'для создателей \MCatCreator\m и \MApeCreator\m, получив в результате наборы'#13+
'кошачьих и обезьян размера 4. С помощью метода \MGetInfo\m'#13+
'вывести информацию о животных из каждого набора.'
);
  an[1] := 'Lion';
  an[2] := 'Tiger';
  an[3]:= 'Leopard';
  an[4]:= 'Gorilla';
  an[5] := 'Orangutan';
  an[6] := 'Chimpanzee';
  names[1] := 'Tom';
  names[2] := 'Phil';
  names[3] := 'Bill';
  names[4] := 'Ann';
  names[5] := 'Suzi';
  names[6] := 'Nick';
  names[7] := 'Joe';
  names[8] := 'Mary';
  for i := 1 to 10 do
    Swap(names[Random(8)+1],names[Random(8)+1]);
  for i := 1 to 4 do
  begin
      c := Random(3) + 1;
      name := names[i];
      DataN('',c-1,Center(i, 4, 8, 5),1,1);
      DataS('',name,Center(i, 4, 8, 5)+2,1);
      a1[i] := an[c] + ' ' + name;
      a2[i] := an[c+3] + ' ' + name;
  end;
  for i := 1 to 4 do
    ResultS('', a1[i], Center(i, 4, 17, 3), 1);
  for i := 1 to 4 do
    ResultS('', a2[i], Center(i, 4, 17, 3), 2);
end;


procedure Pat6;
var s: string;
    i, a, b, f: integer;
    sa1, sb1, sa2, sb2: string;
procedure a1(var d: string);
begin
  d := IntToStr((StrToInt(d)*2));
end;

procedure b1(var db: string; da: string);
begin
  db := IntToStr((StrToInt(db)+StrToInt(da)));
end;

procedure a2(var d: string);
begin
  d := d + d;
end;

procedure b2(var db: string; da: string);
begin
  db := db + da;
end;

begin
  CreateTask(Subgroup1);

TaskText(
'\G<Graph\OOPAbstractFactory.png>\BAbstract Factory\b (\BАбстрактная фабрика\b)~\= порождающий паттерн.'#13+
'\PИзвестен также под именем \BKit\b (\BИнструментарий\b).'#13+
'\P\SЧастота использования\s: высокая.'#13+
'\P\SНазначение\s: предоставляет интерфейс для создания семейств взаимосвязанных'#13+
'или взаимозависимых объектов, не специфицируя конкретные классы этих объектов.'#13+
'Методы абстрактной фабрики обычно реализуются как \Iфабричные методы\i'#13+
'(см.~\3).'#13+
'\P\SУчастники\s: \P\X~\IAbstractFactory\i (\IАбстрактная фабрика\i)~\= объявляет интерфейс'#13+
'для операций, создающих абстрактные объекты-продукты; \P\X~\IConcreteFactory\i'#13+
'(\IКонкретная фабрика\i)~\= реализует операции, создающие конкретные'#13+
'объекты-продукты; \P\X~\IAbstractProduct\i (\IАбстрактный продукт\i)~\= объявляет'#13+
'интерфейс для типа объекта-продукта; \P\X~\IConcreteProduct\i (\IКонкретный продукт\i)~\='#13+
'определяет объект-продукт, создаваемый соответствующей конкретной фабрикой;'#13+
'реализует интерфейс AbstractProduct; \P\X~\IClient\i (\IКлиент\i) ~\= пользуется'#13+
'исключительно интерфейсами, которые объявлены в классах AbstractFactory'#13+
'и AbstractProduct.'#13+
'\P\SЗадание 1\s. Реализовать три иерархии классов, в одну из которых'#13+
'входят абстрактная фабрика \MAbstractFactory\m и две конкретные фабрики'#13+
'\MConcreteFactory1\m и \MConcreteFactory2\m, в другую~\= абстрактный продукт (типа A)'#13+
'\MAbstractProductA\m и два его потомка \MProductA1\m и \MProductA2\m, а в третью~\='#13+
'абстрактный продукт (типа B) \MAbstractProductB\m и два его потомка \MProductB1\m'#13+
'и \MProductB2\m. Все фабрики включают методы \MCreateProductA\m и \MCreateProductB\m,'#13+
'конкретные фабрики~1 и~2 возвращают конкретные продукты с соответствующим'#13+
'номером (фабрика~1 возвращает продукты \MProductA1\m и \MProductB1\m, фабрика~2~\='#13+
'продукты \MProductA2\m и \MProductB2\m).'#13+
'\PВсе классы-продукты имеют метод \MGetInfo\m, возвращающий строковое значение.'#13+
'Кроме того, в продукте первого типа определен метод~\MA\m без параметров,'#13+
'а в продукте второго типа~\= метод~\MВ\m с параметром типа \MAbstractProductA\m'#13+
'(методы не возвращают значений). Конкретные продукты содержат строковое'#13+
'поле \Minfo\m, которое инициализируется в конструкторе с помощью его параметра'#13+
'\Iцелого типа\i (в поле \Minfo\m записывается строковое представление'#13+
'целочисленного параметра конструктора). Метод \MGetInfo\m конкретных'#13+
'классов-продуктов возвращает текущее значение поля \Minfo\m.'#13+
'\PДля класса-продукта \MProductA1\m метод~\MA\m переводит поле \Minfo\m в целое'#13+
'число, удваивает его и сохраняет строковое представление результата в поле'#13+
'\Minfo\m; для класса-продукта \MProductA2\m метод~\MA\m просто удваивает строку \Minfo\m'#13+
'(например, строка \<123\> преобразуется в строку \<123123\>).'#13+
'\PДля класса-продукта \MProductB1\m вызов \MobjB.B(objA)\m преобразует поля \MobjB.info\m'#13+
'и \MobjA.info\m в целые числа, складывает их и сохраняет строковое представление'#13+
'результата в поле \MobjB.info\m; для класса-продукта \MProductB2\m вызов \MobjB.B(objA)\m'#13+
'добавляет в конец строки \MobjB.info\m строку \MobjA.info\m'#13+
'и сохраняет результат в поле \MobjB.info\m.'#13+
TestHeader+
'Дано целое число {Nf}, которое может быть равно~1 или~2, целые числа~{Na} и~{Nb}'#13+
'и строка~{S}, содержащая символы~\<A\> и~\<B\>. Описать ссылочные переменные~\Mf\m'#13+
'типа \MAbstractFactory\m, \Mpa\m типа \MAbstractProductA\m и \Mpb\m типа \MAbstractProductB\m.'#13+
'Если число {Nf} равно 1, то связать~\Mf\m с конкретной фабрикой~1, если {Nf} равно~2,'#13+
'то связать~\Mf\m с конкретной фабрикой~2. Используя фабричные методы созданной'#13+
'фабрики, создать конкретные продукты типа~A и~B, инициализировав их данными'#13+
'числами {Na} и {Nb} соответственно, и связать их с переменными \Mpa\m и \Mpb\m. Затем'#13+
'для созданных продуктов \Mpa\m и \Mpb\m выполнить методы~\MA\m и~\MB\m в порядке,'#13+
'указанном в исходной строке~{S}. При этом метод~\MA\m должен вызываться'#13+
'для продукта \Mpa\m, а метод~\MB\m~\= для продукта \Mpb\m, причем параметром'#13+
'метода~\MB\m должен быть продукт \Mpa\m. Используя методы \MGetInfo\m, вывести'#13+
'итоговые значения объектов-продуктов \Mpa\m и \Mpb\m (в указанном порядке).'#13+
'\P\SПримечание\s. При выполнении задания используются только ссылки'#13+
'на абстрактные классы, а также только методы, определенные в абстрактных'#13+
'классах (за исключением конструктора создаваемой конкретной фабрики),'#13+
'что и составляет суть паттерна \<Абстрактная фабрика\>.'
);
repeat
  a := Random(20)+1;
  repeat
    b := Random(20)+1;
  until b <> a;
  s := '';
  for i := 1 to Random(4) + 4 do
    if Random(2) = 0 then
      s := s + 'A'
    else
      s := s + 'B';
  sa1 := IntToStr(a);
  sa2 := IntToStr(a);
  sb1 := IntToStr(b);
  sb2 := IntToStr(b);
  for i := 1 to Length(s) do
  begin
      if s[i] = 'A' then
      begin
        a1(sa1);
        a2(sa2);
      end
      else
      begin
        b1(sb1, sa1);
        b2(sb2, sa2);
      end;
  end;
until (Length(sa2) < 26) and (Length(sb2) < 26);

f := Random(2)+1;
DataN('Nf = ', f, 10, 1, 1);
  DataN('Na = ', a, 20, 1, 1);
  DataN('Nb = ', b, 30, 1, 1);
  DataS('Набор методов S: ', s, 50, 1);
if f = 1 then
begin
  ResultS('ProductA1: ', sa1, xLeft, 1);
  ResultS('ProductB1: ', sb1, xRight, 1);
end
else
begin
  ResultS('ProductA2: ', sa2, xLeft, 1);
  ResultS('ProductB2: ', sb2, xRight, 1);
end;

end;


procedure Pat7;
var s: array [1..10] of string;
    i, n, n1, n2: integer;
    s1, s2: string;

function but1(d: string): string;
begin
  result := '['+Uppercase(d)+']';
end;

function but2(d: string): string;
begin
  result := '<'+Lowercase(d)+'>';
end;

function lab1(d: string): string;
begin
  result := '='+Uppercase(d)+'=';
end;

function lab2(d: string): string;
begin
  result := '"'+Lowercase(d)+'"';
end;

begin
  CreateTask(Subgroup1);

TaskText(
'\BAbstract Factory\b (\BАбстрактная фабрика\b)~\= порождающий паттерн.'#13+
'\P\SЗадание 2\s. Реализовать иерархию классов, определяющих два вида элементов'#13+
'управления (controls): кнопки (buttons) и метки (labels). Абстрактные классы'#13+
'\MAbstractButton\m и \MAbstractLabel\m содержат метод \MGetControl\m, возвращающий'#13+
'строковое представление соответствующего элемента управления. Конкретные'#13+
'классы \MButton1\m, \MButton2\m, \MLabel1\m, \MLabel2\m включают конструктор со строковым'#13+
'параметром \Mtext\m, который определяет текст, отображаемый на элементе управления'#13+
'(текст хранится в поле \Mtext\m). Конкретные классы отличаются видом строкового'#13+
'представления. Для \MButton1\m и \MLabel1\m (первый вариант представления) текст'#13+
'отображается заглавными буквами, кнопки обрамляются квадратными скобками'#13+
'(например, [CAPTION]), метки обрамляются символами \<=\> (например, =MESSAGE=).'#13+
'Для \MButton2\m и \MLabel2\m (второй вариант представления) текст отображается'#13+
'строчными буквами, кнопки обрамляются угловыми скобками (например, <caption>),'#13+
'метки обрамляются двойными кавычками (например, "message").'#13+
'\PРеализовать иерархию классов \MControlFactory\m (абстрактная фабрика), \MFactory1\m'#13+
'и \MFactory2\m (конкретные фабрики). Каждый класс содержит два метода:'#13+
'\MCreateButton(text)\m и \MCreateLabel(text)\m. Для \MControlFactory\m эти методы являются'#13+
'абстрактными, для конкретных фабрик они возвращают кнопку и метку'#13+
'соответствующего вида (первого или второго).'#13+
'\PТакже реализовать класс \MClient\m, предназначенный для формирования набора'#13+
'элементов управления. Конструктор данного класса принимает параметр \Mf\m типа'#13+
'\MControlFactory\m, который в дальнейшем используется для генерации элементов'#13+
'управления требуемого типа. Класс \MClient\m включает метод \MAddButton(text)\m'#13+
'для добавления в набор новой кнопки, метод \MAddLabel(text)\m для добавления'#13+
'в набор новой метки и метод \MGetControls\m, возвращающий текстовое представление'#13+
'полученного набора элементов управления. В текстовом представлении каждый'#13+
'последующий элемент отделяется от предыдущего одним пробелом.'#13+
TestHeader+
'Дано целое число {N} (\l\,6) и набор из {N} строк. Каждая строка начинается либо'#13+
'с символа \<B\> (признак кнопки), либо с символа \<L\> (признак метки). Затем идет'#13+
'пробел и текст соответствующего элемента управления. Используя два экземпляра'#13+
'класса \MClient\m, сформировать и вывести два варианта текстового представления'#13+
'указанного набора элементов управления. Вначале выводится'#13+
'первый вариант представления, затем второй.'
);

  n := Random(4) + 3;
  s1 := '';
  s2 := '';
  n1 := 0;
  n2 := 0;
  for i := 1 to n do
  case Random(2) of
  0: begin
       n1 := n1 + 1;
       s[i] := 'Caption'+IntToStr(n1);
       s1 := s1 + ' ' + but1(s[i]);
       s2 := s2 + ' ' + but2(s[i]);
       s[i] := 'B ' + s[i];
     end;
  1: begin
       n2 := n2 + 1;
       s[i] := 'Message'+IntToStr(n2);
       s1 := s1 + ' ' + lab1(s[i]);
       s2 := s2 + ' ' + lab2(s[i]);
       s[i] := 'L ' + s[i];
     end;
  end;
DataN('N = ', n, 0, 1, 1);
for i := 1 to n do
  DataS('', s[i], Center(i, n, 12, 1), 2);
ResultS('', Trim(s1), 0, 1);
ResultS('', Trim(s2), 0, 2);

end;

procedure Pat8;
var
    i, n: integer;
    s,s1,s2: string;
    k: array[1..10] of integer;
begin
  CreateTask(Subgroup2);

TaskText(
'\G<Graph\OOPPrototype.png>\BPrototype\b (\BПрототип\b)~\= порождающий паттерн.'#13+
'\P\SЧастота использования\s: средняя.'#13+
'\P\SНазначение\s: задает виды создаваемых объектов с помощью экземпляра-прототипа'#13+
'и создает новые объекты путем копирования (\<клонирования\>) этого прототипа.'#13+
'\P\SУчастники\s: \P\X~\IPrototype\i (\IПрототип\i)~\= объявляет интерфейс для клонирования'#13+
'самого себя; \P\X~\IConcretePrototype\i (\IКонкретный прототип\i)~\= реализует'#13+
'операцию клонирования себя; \P\X~\IClient\i (\IКлиент\i)~\= создает новый объект,'#13+
'обращаясь к прототипу с запросом клонировать себя.'#13+
'\P\SЗадание 1\s. Реализовать иерархию классов, которая содержит абстрактный'#13+
'прототип \MPrototype\m и два конкретных прототипа \MConcretePrototype1\m'#13+
'и \MConcretePrototype2\m. Все классы включают метод \MClone\m без параметров,'#13+
'возвращающий копию объекта, вызвавшего данный метод, а также методы \MGetInfo\m'#13+
'и \MChangeId\m. Метод \MGetInfo\m без параметров возвращает строку, метод \MChangeId\m'#13+
'имеет целочисленный параметр \Mid\m и ничего не возвращает. В классе \MPrototype\m'#13+
'методы \MClone\m, \MGetInfo\m и \MChangeId\m являются абстрактными. Конкретные прототипы'#13+
'содержат строковое поле \Mdata\m и целочисленное поле \Mid\m, которые инициализируются'#13+
'одноименными параметрами конструктора. Метод \MGetInfo\m для конкретных'#13+
'прототипов возвращает строку, содержащую краткое имя типа (\<CP1\> для типа'#13+
'\MConcretePrototype1\m и \<CP2\> для типа \MConcretePrototype2\m) и значения полей'#13+
'\Mdata\m и \Mid\m (части описания разделяются символом \<=\>, например, \<CP1=TEXT=34\>).'#13+
'Метод \MChangeId\m изменяет значение поля \Mid\m. При реализации метода \MClone\m можно'#13+
'использовать специальные средства стандартной библиотеки'#13+
'или обычный вызов конструктора.'#13+
'\PТакже реализовать класс \MClient\m, предназначенный для работы с группой объектов'#13+
'типа \MConcretePrototype1\m или \MConcretePrototype2\m. Конструктор класса \MClient\m'#13+
'имеет параметр-ссылку типа \MPrototype\m, определяющий прототип объектов,'#13+
'включаемых в группу (прототип в группу не входит и сохраняется в специальном'#13+
'поле \Mprot\m; для хранения группы объектов удобно использовать динамическую'#13+
'структуру). Класс \MClient\m также содержит методы \MOperation(id)\m и \MGetObjects\m.'#13+
'Метод \MOperation\m добавляет в набор новый объект, получаемый путем клонирования'#13+
'прототипа и последующего изменения поля \Mid\m полученного объекта в соответствии'#13+
'со значением параметра метода \MOperation\m. Метод \MGetObjects\m без параметров'#13+
'возвращает строку с описанием всех объектов группы (описания разделяются'#13+
'пробелом). Все объекты создаваемой группы имеют одно и то же поле \Mdata\m'#13+
'и различные поля \Mid\m (задаваемые в методе \MOperation\m).'#13+
TestHeader+
'Дана строка {S}, целое число {N} (\l\,10) и набор из {N} целых чисел.'#13+
'Вызывая метод \MOperation\m для двух объектов класса \MClient\m, сформировать два'#13+
'набора из {N} объектов. Первый набор содержит объекты типа \MConcretePrototype1\m'#13+
'(и создается первым объектом \MClient\m), второй набор содержит объекты типа'#13+
'\MConcretePrototype2\m (и создается вторым объектом \MClient\m). Все созданные объекты'#13+
'должны иметь одинаковые поля \Mdata\m, равные строке {S}, и значения полей \Mid\m,'#13+
'взятые из исходного набора целых чисел. Используя метод \MGetObjects\m, вывести'#13+
'строковые описания каждого из полученных наборов объектов.'#13+
'\P\SПримечание\s. В реальной ситуации подход, основанный на паттерне \<Прототип\>'#13+
'будет эффективным, если объем действий по обычному созданию объекта'#13+
'превосходит объем действий по его клонированию'#13+
'и последующей настройке некоторых свойств.'


);

repeat
  s :=  EnWordSample(Random(EnWordCount));
  n := Random(4) + 3;
  s1 := '';
  s2 := '';
  for i := 1 to n do
  begin
    k[i] := Random(90)+10;
    s1 := s1 + ' CP1=' + s + '=' + IntToStr(k[i]);
    s2 := s2 + ' CP2=' + s + '=' + IntToStr(k[i]);
  end;
until Length(s1) < 74;
  DataS('S = ', s, xLeft, 1);
  DataN('N = ', n, xRight, 1, 1);
  for i := 1 to n do
    DataN('', k[i], Center(i, n, 2, 4), 2, 2);
  ResultS('', Trim(s1), 0, 1);
  ResultS('', Trim(s2), 0, 2);

end;

procedure Pat9;
var
    i, n: integer;
    s,s1,s2, s0: string;
    pn, x1, y1, x2, y2: array[1..10] of integer;
    p: array [1..10] of char;

function v(c: char): string;
begin
  case c of
  'L': result := 'Line';
  'E': result := 'Ellip';
  'R': result := 'Rect';
  end;
end;
begin
  CreateTask(Subgroup2);

TaskText(
'\BPrototype\b (\BПрототип\b)~\= порождающий паттерн.'#13+
'\P\SЗадание 2\s. Реализовать иерархию классов, связанных с графическими примитивами:'#13+
'\MAbstractGraphic\m (абстрактный предок), \MEllip\m, \MLine\m и \MRect\m (конкретные'#13+
'примитивы). Классы содержат метод \MClone\m без параметров, возвращающий копию'#13+
'объекта, вызвавшего данный метод, а также метод \MChangeLocation(x1, y1, x2, y2)\m'#13+
'с целочисленными параметрами \Mx1\m, \My1\m, \Mx2\m, \My2\m, не возвращающий значений,'#13+
'и метод \MDraw\m без параметров, возвращающий строку. В классе \MAbstractGraphic\m'#13+
'методы \MClone\m, \MChangeLocation\m и \MDraw\m являются абстрактными. Классы конкретных'#13+
'примитивов содержат целочисленные поля \Mx1\m, \My1\m, \Mx2\m, \My2\m; по умолчанию они'#13+
'инициализируются нулями. Метод \MChangeLocation\m изменяет эти поля, а метод \MDraw\m'#13+
'возвращает строку, содержащую имя класса и текущие значения полей без пробелов'#13+
'(например, \<Line(1,3,-1,5)\>). При реализации метода \MClone\m можно использовать'#13+
'специальные средства стандартной библиотеки или обычный вызов конструктора.'#13+
'\PТакже реализовать класс \MGraphEditor\m, предназначенный для работы с графическими'#13+
'объектами. В конструктор класса \MGraphEditor\m передаются два ссылочных'#13+
'параметра \Mp0\m, \Mp1\m типа AbstractGraphic, определяющих прототипы создаваемых'#13+
'объектов-примитивов. Для хранения прототипов используется массив из двух'#13+
'элементов, для хранения созданного набора графических примитивов удобно'#13+
'использовать динамическую структуру. Класс \MGraphEditor\m включает два метода.'#13+
'Метод \MAddGraphic(ind, x1, y1, x2, y2)\m добавляет в набор графических примитивов'#13+
'объект, созданный на основе прототипа с индексом \Mind\m (0 или~1) и устанавливает'#13+
'для него указанные координаты. Метод \MDrawAll\m без параметров возвращает'#13+
'строковое описание всех добавленных графических объектов, используя'#13+
'их метод \MDraw\m (описания объектов разделяются пробелом).'#13+
TestHeader+
'Дана двухсимвольная строка {P}, содержащая две различные буквы из набора'#13+
'\<E\>, \<L\>,~\<R\>. Также дано целое число {N} (\l\,5) и набор из {N} пятерок целых'#13+
'чисел вида ({ind}, {x}_1, {y}_1, {x}_2, {y}_2), где {ind} принимает значение 0 или 1,'#13+
'а остальные числа являются произвольными. Создать объект \MGraphEditor\m,'#13+
'инициализировав его двумя прототипами, которые соответствуют символам'#13+
'строки {P} (\<E\>~\= \MEllip\m, \<L\>~\= \MLine\m, \<R\>~\= \MRect\m); порядок прототипов'#13+
'определяется порядком символов в строке {P}. Добавить в набор графических'#13+
'примитивов N объектов, используя вызовы метода AddGraphic с параметрами,'#13+
'определяемыми пятерками данных чисел, и вывести'#13+
'полученный набор примитивов методом \MDrawAll\m.'
);

p[1] := 'L';
p[2] := 'E';
p[3] := 'R';
n := Random(3) + 3;

repeat
  s := p[Random(3)+1];
  repeat
    s1 := p[Random(3)+1];
  until s1 <> s;
  s := s + s1;
  s1 := '';
  s2 := '';
  for i := 1 to n do
  begin
    x1[i] := Random(10)-5;
    x2[i] := Random(10)-5;
    y1[i] := Random(10)-5;
    y2[i] := Random(10)-5;
    pn[i] := Random(2) + 1;
    s0 := '(' + IntToStr(x1[i]) + ',' + IntToStr(y1[i]) + ','
              + IntToStr(x2[i]) + ',' + IntToStr(y2[i]) + ')';
    s1 := s1 + ' ' + v(s[pn[i]]) + s0;
  end;
until Length(s1) < 74;
  DataS('P: ', s, xLeft, 1);
  DataN('N = ', n, xRight, 1, 1);
  for i := 1 to n do
  begin
    DataN('np = ', pn[i]-1, Center(1, 5, 7, 4), 1+i, 1);
    DataN('x1 = ', x1[i], Center(2, 5, 7, 4), 1+i, 2);
    DataN('y1 = ', y1[i], Center(3, 5, 7, 4), 1+i, 2);
    DataN('x2 = ', x2[i], Center(4, 5, 7, 4), 1+i, 2);
    DataN('y2 = ', y2[i], Center(5, 5, 7, 4), 1+i, 2);
  end;
  ResultS('', Trim(s1), 0, 1);
  SetTestCount(9);
end;


procedure Pat10;
var
    i, k, n, j, ns, n0: integer;
    s: array[1..13] of string;
    s1: array[1..10] of string;
    d: array[1..10] of integer;
    ind, d0: array[1..20] of integer;
    cs, cd, ct: integer;
    s0: string;
begin
  CreateTask(Subgroup2);
TaskText(
'\G<Graph\OOPSingleton.png>\BSingleton\b (\BОдиночка\b)~\= порождающий паттерн.'#13+
'\P\SЧастота использования\s: выше средней.'#13+
'\P\SНазначение\s: гарантирует, что у класса есть только один экземпляр,'#13+
'и предоставляет к нему глобальную точку доступа.'#13+
'\P\SУчастники\s: \P\X~\ISingleton\i (\IОдиночка\i)~\= определяет операцию Instance, которая'#13+
'позволяет клиентам получать доступ к единственному экземпляру (операция'#13+
'Instance обычно оформляется в виде \Iстатического\i, т.\,е. классового, метода);'#13+
'может обеспечивать \Iотложенную инициализацию\i данного экземпляра.'#13+
'\PЧтобы проиллюстрировать особенности паттерна Singleton, в задании предлагается'#13+
'реализовать не только его стандартный вариант, но и основанные на той же идее'#13+
'варианты, допускающие использование \Iограниченного количества\i экземпляров.'#13+
'\P\SЗадание 1\s. Реализовать иерархию классов, включающую абстрактный базовый класс'#13+
'\MBaseClass\m и классы-потомки \MSingleton\m, \MDoubleton\m и \MTenton\m, обеспечивающие'#13+
'создание ограниченного количества своих экземпляров.'#13+
'\PКласс \MBaseClass\m включает целочисленное поле \Mdata\m и два связанных с ним метода:'#13+
'метод \MIncData(increment)\m увеличивает значение \Mdata\m на величину целочисленного'#13+
'параметра \Mincrement\m, метод \MGetData\m без параметров возвращает текущее значение'#13+
'поля \Mdata\m. Поле \Mdata\m инициализируется нулевым значением.'#13+
'\PКласс \MSingleton\m реализует стандартный паттерн \<Одиночка\>. Он включает'#13+
'статическое поле \MuniqueInstance\m~\= ссылку на тип \MSingleton\m (инициализируется'#13+
'нулевой ссылкой), закрытый конструктор, не выполняющий дополнительных'#13+
'действий, и статический метод \MInstance\m без параметров, который возвращает'#13+
'ссылку на объект типа \MSingleton\m). Метод \MInstance\m выполняет следующие'#13+
'действия: если поле \MuniqueInstance\m является нулевой ссылкой, то метод создает'#13+
'объект \MSingleton\m, помещает ссылку на него в поле \MuniqueInstance\m и возвращает'#13+
'эту ссылку как результат своей работы; если поле \MuniqueInstance\m уже содержит'#13+
'ссылку на объект \MSingleton\m, то метод \MInstance\m просто возвращает эту ссылку.'#13+
'Дополнительно реализовать статический метод \MInstanceCount\m (без параметров),'#13+
'который возвращает~0, если поле \MuniqueInstance\m содержит нулевую ссылку,'#13+
'и~1 в противном случае.'#13+
'\PКлассы \MDoubleton\m и \MTenton\m реализуют вариант паттерна, допускающий'#13+
'использование \Iне более двух\i и \Iне более десяти\i экземпляров соответственно.'#13+
'\PКласс \MDoubleton\m включает статический массив \Minstances\m из двух элементов-ссылок'#13+
'типа \MDoubleton\m (элементы инициализируются нулевыми значениями), закрытый'#13+
'конструктор и статические методы \MInstance1\m и \MInstance2\m, которые выполняют'#13+
'действия, аналогичные действиям метода \MInstance\m класса \MSingleton\m,'#13+
'но обращаются соответственно к элементам массива \Minstances\m с индексами~0 и~1.'#13+
'\PКласс \MTenton\m отличается от класса \MDoubleton\m тем, что его статический массив'#13+
'\Minstances\m содержит 10~элементов-ссылок типа \MTenton\m, а вместо двух методов'#13+
'\MInstance1\m и \MInstance2\m он включает статический метод \MInstance(index)\m'#13+
'с целочисленным параметром, определяющим индекс элемента массива \Minstances\m,'#13+
'к которому обращается данный метод. Если параметр находится вне диапазона 0\:9,'#13+
'то метод \MInstance\m может возвращать нулевую ссылку или возбуждать исключение'#13+
'(при выполнении задания такая ситуация не будет возникать).'#13+
'\PВ классах \MDoubleton\m и \MTenton\m дополнительно реализовать статический метод'#13+
'\MInstanceCount\m (без параметров), который возвращает количество элементов'#13+
'массива \Minstances\m, не являющихся нулевыми ссылками.'#13+
TestHeader+
'Дано целое число {N} (\l\,10) и набор из {N} строк, которые могут принимать значения'#13+
'\<S\>, \<D1\>, \<D2\>, \<T0\>, \<T1\>, \., \<T9\>. Создать массив~\Mb\m из {N}~элементов~\='#13+
'ссылок на \MBaseClass\m и инициализировать его элементы экземплярами классов'#13+
'\MSingleton\m, \MDoubleton\m, \MTenton\m, используя следующие варианты статических методов'#13+
'в зависимости от значения соответствующей строки из исходного набора:'#13+
'для строки \<S\> используется метод \MInstance\m класса \MSingleton\m;'#13+
'для строк \<D1\>, \<D2\>~\= соответственно методы \MInstance1\m и \MInstance2\m класса'#13+
'\MDoubleton\m; для строк \<T0\>, \<T1\>,~\., \<T9\>~\= метод \MInstance(index)\m класса'#13+
'\MTenton\m с параметром \Mindex\m, соответствующим цифре, указанной в строке.'#13+
'\PПосле создания всех элементов массива \Mb\m вывести значения метода \MInstanceCount\m'#13+
'для классов \MSingleton\m, \MDoubleton\m, \MTenton\m в указанном порядке.'#13+
'\PТакже дано целое число {K} (\l\,20) и набор из {K} пар целых чисел ({index},'#13+
'{increment}), в котором число {index} находится в диапазоне от~0 до {N}\,\-\,1'#13+
'и определяет индекс элемента в массиве~\Mb\m, а число {increment} определяет'#13+
'параметр метода \MIncData\m, который надо вызвать для элемента массива~\Mb\m'#13+
'с индексом {index}. После вызова всех требуемых методов \MIncData\m вывести итоговые'#13+
'значения поля \Mdata\m для всех объектов массива~\Mb\m, используя метод \MGetData\m.'
);
n := Random(4) + 7;
for i := 1 to 13 do
  s[i] := '';
if Random(2) = 0 then
  s[13] := 'S';
case Random(4) of
1: s[11] := 'D1';
2: s[12] := 'D2';
3: begin
    s[11] := 'D1';
    s[12] := 'D2';
   end;
end;
for i := 1 to 4 do
begin
  k := Random(10);
  s[k+1] := 'T' + IntToStr(k);
end;
ns := 0;
cs := 0; cd := 0; ct := 0;

for i := 1 to 13 do
begin
  if s[i] <> '' then
  begin
    case s[i][1] of
    'S': cs := 1;
    'D': inc(cd);
    'T': inc(ct);
    end;
    inc(ns);
    s1[ns] := s[i];
  end;
end;
for i := 1 to 5 do
  Swap(s1[Random(ns)+1], s1[Random(ns)+1]); 
for i := ns + 1 to n do
  s1[i] := s1[Random(ns)+1];
DataN('N = ', n, 0, 1, 2);
for i := 1 to n do
begin
  DataS('', s1[i], Center(i, n, 4, 3), 2);
end;
repeat
k := Random(6)+15;
for i := 1 to n do
  d[i] := 0;
for i := 1 to k do
begin
  ind[i] := Random(n)+1;
  d0[i] := 10 + Random(31);
end;
for i := 1 to k do
begin
  s0 := s1[ind[i]];
  for j := 1 to n do
    if s1[j] = s0 then
      d[j] := d[j] + d0[i];
end;
n0 := 0;
for i := 1 to n do
  if d[i] = 0 then
    Inc(n0);
until n0 > 0;

DataN('K = ', k, 0, 3, 2);

for i := 1 to 10 do
begin
  DataN('', ind[i]-1, Center(i, 10, 4, 3), 4, 1);
  DataN('', d0[i], Center(i, 10, 4, 3)+ 2, 4, 2);
end;
for i := 11 to k do
begin
  DataN('', ind[i]-1, Center(i-10, 10, 4, 3), 5, 1);
  DataN('', d0[i], Center(i-10, 10, 4, 3)+ 2, 5, 2);
end;

ResultN('', cs, 29, 1, 1);
ResultN('', cd, 39, 1, 1);
ResultN('', ct, 49, 1, 1);

for i := 1 to n do
  ResultN('', d[i], Center(i, n, 3, 4)-1, 2, 3);

SetTestCount(9);
end;

procedure InitTask(num: integer); stdcall;
begin
  case num of
  1: Pat3;
  2: Pat4;
  3: Pat5;
  4: Pat6;
  5: Pat7;
  6: Pat10;
  7: Pat8;
  8: Pat9;
  9: Pat1;
  10: Pat2;
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
  CreateGroup('OOP1Creat', 'Порождающие паттерны',
    'М. Э. Абрамян, 2022', 'qwке6#EnTopic<Creational patterns>#433333тоьdfttd', 10, InitTask);
end;

//exports inittaskgroup, activate;

begin
end.
