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
  TestHeader = '\P\S������������ ������������� ������� �������\s.'#13;
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
'\G<Graph\OOPBuilder.png>\BBuilder\b (\B���������\b)~\= ����������� �������.'#13+
'\P\S������� �������������\s: ���� �������.'#13+
'\P\S����������\s: �������� ��������������� �������� ������� �� ��� �������������,'#13+
'��� ��� � ���������� ������ � ���� �� �������� ��������������� �����'#13+
'���������� ������ �������������.'#13+
'\P\S���������\s: \P\X~\IBuilder\i (\I���������\i)~\= ������ ����������� ���������'#13+
'��� �������� ������ ������� Product; \P\X~\IConcreteBuilder\i (\I����������\i'#13+
'\I���������\i)~\= ������������ � �������� ������ ����� �������� �����������'#13+
'���������� ���������� Builder, ������������� ��������� ��� ������� � ��������;'#13+
'\P\X~\IDirector\i (\I�������������\i)~\= ������������ ������ Product,'#13+
'��������� ����������� Builder; \P\X~\IProduct\i (\I�������\i)~\= ������������'#13+
'������� �������������� ������.'#13+
'\P\S������� 1\s. ����������� �������� �������-����������, ��������������'#13+
'��������-������. �������� �������� ����������� ����� \MBuilder\m, �������'#13+
'������������� ��������� ��� ������������� �������� (\MBuildStart\m) � ��������'#13+
'���� ��� ���������� (\MBuildPartA\m, \MBuildPartB\m, \MBuildPartC\m), � ���������� ������'#13+
'\MConcreteBuilder1\m � \MConcreteBuilder2\m, ������� ���������� ���������� �������'#13+
'���������������. ������ \MBuildStart\m, \MBuildPartA\m, \MBuildPartB\m, \MBuildPartC\m'#13+
'�� ����� ���������� � �� ���������� ��������. � ����������� ������ \MBuilder\m'#13+
'�������� ������ ������ �� ��������� ������� ��������, ���� � �� ��������'#13+
'������������; ��� ��������� ����������� ������-��������� �� ��������������'#13+
'��������� �� ���, ���� ��� ���������� ��������� �� ���������. ����� ����,'#13+
'� ������ \MBuilder\m ��������� ����������� ����� \MGetResult\m ��� ����������,'#13+
'������������ ������-�������.'#13+
'\P���������� ������ \MConcreteBuilder1\m � \MConcreteBuilder2\m �������� ��������� ����'#13+
'\Mproduct\m; �� ����� \MGetResult\m ���������� ������� �������� ���� \Mproduct\m.'#13+
'� ������������ ���� ������� ���� \Mproduct\m ���������������� ������ �������,'#13+
'��� �� �������� ��������� � ����� \MBuildStart\m. ������ �� ������� \MBuildPartA\m,'#13+
'\MBuildPartB\m, \MBuildPartC\m ��������� � ������ \Mproduct\m ����� ��������� ��������;'#13+
'��� ������ \MConcreteBuilder1\m ��������� A, B, C ������������ ����� ������'#13+
'\<-1-\>, \<-2-\> � \<-3-\>, � ��� ������ \MConcreteBuilder2\m~\='#13+
'������ \<=*=\>, \<=**=\> � \<=***=\>.'#13+
'\P����� ���������� ����� \MDirector\m, ���������� ���� \Mb\m~\= ������ �� ������ ����'#13+
'\MBuilder\m (���� \Mb\m ���������������� � ������������ � ��������������'#13+
'������������ ���������) � ��� ������: \MConstruct(templat)\m � \MGetResult\m.'#13+
'����� \MGetResult\m �� ����� ���������� � ���������� �������� ������ \MGetResult\m'#13+
'�������~\Mb\m, �.\,�. ����������� �������. ����� \MConstruct\m ������������ ����������'#13+
'��������; ��� ��������� �������� \Mtemplat\m ���������� ���� �������������.'#13+
'� ������ ������ ���� ������������ ������������������� �������� \<A\>, \<B\>, \<C\>,'#13+
'������ �� ������� ������������� ��������� A, B, C, ������������'#13+
'� �������������� ������ � ��������� �������. ������ \Mtemplat\m ����� ���������'#13+
'�������, �������� �� \<A\>, \<B\>, \<C\>; �������� ������� ������������.'#13+
'� ������ ����� ������ ����� \MConstruct\m ������ ������� ����� \MBuildStart\m.'#13+
TestHeader+
'���� ���� �����, ������ �� ������� �������� ���� �������������. ������� ���'#13+
'���������� \Md1\m � \Md2\m ������ \MDirector\m, ������� ������� ���������� ������ ����'#13+
'\MConcreteBuilder1\m, � �������~\= ������ ���� \MConcreteBuilder2\m. ������� �����'#13+
'\MConstruct\m �������� \Md1\m � \Md2\m ��� ������ �� �������� ����� � ������� ����������'#13+
'����������, ��������� ����� \MGetResult\m (������� ��������� ���������� ��� ������'#13+
'�������� ������, ����� ��� ������ � �.\,�.).'
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
'\BBuilder\b (\B���������\b)~\= ����������� �������.'#13+
'\P\S������� 2\s. ����������� ������� �������, ����������� �� ��������� ���������'#13+
'������������ ��������������, ������� ������������� ����������� ���������'#13+
'������ ����������������. ������ ��������� �������� ������������ ����� ����'#13+
'��� ����� ����, ����������� ����� ��� ����������� ���������; ���������'#13+
'� �������� ������� �����������, ������� ���� �������� ������������.'#13+
'\P����������� ����� \MBuilder\m �������� ������ ��� ��������������� ������� �������'#13+
'�������������� (\MBuildStart\m), ������� ������� ������� ������������ �����'#13+
'(\MBuildFirstChar\m), ����������� �������� ���� (\MBuildNextChar\m)'#13+
'� ��������-������������ ����� ������� (\MBuildDelim\m). ������ \MBuildStart\m,'#13+
'\MBuildFirstChar\m � \MBuildNextChar\m ����� ���������� ��������, ������������'#13+
'��� ��������������� (��������, ����� ��������� ��� ��������); �����'#13+
'\MBuildDelim\m �� ����� ����������. ��� ��� ������ �� ���������� ��������;'#13+
'� ������ \MBuilder\m ��� �� ��������� ������� ��������. ����� ����, ����� \MBuilder\m'#13+
'�������� ����������� ����� \MGetResult\m ��� ����������,'#13+
'������������ ��������� ��������.'#13+
'\P���������� ������ \MBuilderPascal\m, \MBuilderPython\m, \MBuilderC\m �������� ���������'#13+
'���� \Mproduct\m, ������� ���������������� ������ ������� � ������������,'#13+
'����������� � ������ \MBuildStart\m � ����������� � ������� \MBuildFirstChar\m,'#13+
'\MBuildNextChar\m �, ��������, � ������ \MBuildDelim\m. ����� \MGetResult\m'#13+
'���������� �������� ���� \Mproduct\m. ��� ����������� ��������� �������'#13+
'���������� ���������� ������� ��������� ������� ������������'#13+
'��������������� ��� ���������� ������ ����������������: \P\X~��� ����� Pascal'#13+
'������������� ������ ���������� �� �������� (���������) �����, �����������'#13+
'�����~\= � ��������� �����, ��� ������ ����� �������� ���������,'#13+
'�������-����������� �� ������������; \P\X~��� ����� Python ��� ����� ��������'#13+
'���������, � ����� ������� ����������� ������ �������������; \P\X~��� ����� �'#13+
'��� ����� �������� ���������, �������-����������� �� ������������.'#13+
'\P�� ������������� ������ �������, � ���������, ��� ��� ������� \MBuilderPascal\m'#13+
'� \MBuilderC\m �� ��������� �������������� ����� BuildDelim.'#13+
'\P����� ���������� ����� \MDirector\m, ���������� ��������� ���� \Mb\m ���� \MBuilder\m'#13+
'(���� \Mb\m ���������������� � ������������ � �������������� ������������'#13+
'���������), � ��� ������: \MConstruct(templat)\m � \MGetResult\m.'#13+
'����� \MGetResult\m �� ����� ���������� � ���������� �������� ������ \MGetResult\m'#13+
'������� \Mb\m. ����� \MConstruct\m ������������ ���������� ��������; ��� ���������'#13+
'�������� \Mtemplat\m �������� ��������� ��������, �� ��������� �������� ������'#13+
'���������������� ������������� �� ��������, ������������� � ��������� \Mb\m.'#13+
'� ������ ������ ����� \MConstruct\m ������ ������� ����� \MBuildStart\m � ����������~\='#13+
'������ �������� ������ \Mtemplat\m. ��� ������� ������ \Mtemplat\m ����������'#13+
'��������� ������ ������ � ������������������ �������� (��� ��������'#13+
'���� �������� ����� \MBuildDelim\m) � ����������� �������'#13+
'(������� ������ ��������������).'#13+
TestHeader+
'���� ���� �����, ���������� ��������� ��������, ������� �������������'#13+
'��������, ������������� � ������ ������������ �������. �������'#13+
'��� �������-������������� \MDirector\m, ��������� �� ����������� \MBuilderPascal\m,'#13+
'\MBuilderPython\m, \MBuilderC\m, �������� �� � ������� ��� ������ ��������� ������.'#13+
'��������� ������ \MConstruct\m � \MGetResult\m ������� �� ��������� ��������������,'#13+
'�������� �� ������ �� �������� ����� �������������� �� ����� Pascal, Python'#13+
'� C � ������� �� � ��������� ������� (������� ��������� ��������������,'#13+
'���������� �� ������ ������ ������, ����� �� ������ ������ � �.\,�.).'
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
'\G<Graph\OOPFactoryMethod.png>\BFactory Method\b (\B��������� �����\b)~\= ����������� �������.'#13+
'\P�������� ����� ��� ������ \BVirtual Constructor\b (\B����������� �����������\b).'#13+
'\P\S������� �������������\s: �������.'#13+
'\P\S����������\s: ���������� ��������� ��� �������� �������, �� ��������� ����������'#13+
'������� � ���, ����� ����� ��������������. ��������� ����� ��������� ������'#13+
'������������ ��������������� ����������.'#13+
'\P\S���������\s: \P\X~\IProduct\i (\I�������\i)~\= ���������� ��������� ��������, �����������'#13+
'��������� �������; \P\X~\IConcreteProduct\i (\I���������� �������\i)~\= ���������'#13+
'��������� Product; \P\X~\ICreator\i (\I���������\i)~\= ��������� ��������� �����,'#13+
'������������ ������ ���� Product; ����� ����� ���������� ���������� ����������'#13+
'������ �� ���������, ������������ ��������� ���������� �������; ���������'#13+
'������, � ������� ������������ ������ Product, ��������� ��������� �������;'#13+
'\P\X~\IConcreteCreator\i (\I���������� ���������\i)~\= �������� ��������� �����'#13+
'��� �������� ����������� ��������.'#13+
'\P\S������� 1\s. ����������� ��� �������� �������, � ���� �� �������'#13+
'������ ����������� ��������� \MCreator\m � ��� ���������� ���������'#13+
'\MConcreteCreator1\m � \MConcreteCreator2\m, � � ������~\= ����������� �������'#13+
'\MProduct\m � ��� ���������� �������� \MConcreteProduct1\m � \MConcreteProduct2\m.'#13+
'\P����������� ����� \MProduct\m �������� ��� ����������� ������, ���������'#13+
'� ���������� � ��������������� ������: ����� \MGetInfo\m ��� ����������,'#13+
'������������ ������, � ����� \MTransform\m ��� ����������, ������� ������'#13+
'�� ����������. ������ \MConcreteProduct1\m � \MConcreteProduct2\m �������� ���������'#13+
'���� \Minfo\m, ������� ���������������� � ������������ � ������� ������������'#13+
'���������, ����� ���� � ������������ ������ \MConcreteProduct1\m ���� \Minfo\m'#13+
'������������� � ������� ��������, � � ������������ ������ \MConcreteProduct2\m~\='#13+
'� ��������. ����� \MGetInfo\m � ������ ��������� ���������� ������� ��������'#13+
'���� \Minfo\m, � ����� \MTransform\m ����������� ��� ���� ��������� �������:'#13+
'��� \MConcreteProduct1\m �� ��������� �������������� ������ ����� �������'#13+
'������������� ������� ���� \Minfo\m (����� ��� ���������� �������),'#13+
'� ��� \MConcreteProduct2\m �� ��������� ��� �������������� ������� * (���������)'#13+
'����� ������� �������, ��������� �� ��������� (����� ���������� �������).'#13+
'\P����������� ����� \MCreator\m �������� ����������� ��������� �����'#13+
'\MFactoryMethod(info)\m �� ��������� ���������� \Minfo\m, ������������ ������'#13+
'�� ������ \MProduct\m. ���� ����� ������������ � ������� \MConcreteCreator1\m'#13+
'� \MConcreteCreator2\m, ������ ��������� ����� ������ \MConcreteCreator1\m �������'#13+
'������ ���� \MConcreteProduct1\m, � ��������� ����� ������ \MConcreteCreator2\m'#13+
'������� ������ ���� \MConcreteProduct2\m; � ����� ������ ������������ ������������'#13+
'������� ���������� �������� \Minfo\m ���������� ������.'#13+
'\P� ����������� ������ \MCreator\m ������������� ���������� �����'#13+
'\MAnOperation(info)\m, ������� ������� ������� � ������� ���������� ������,'#13+
'��������� ��� �������� \Minfo\m, ������ �������� ����� \MTransform\m ����������'#13+
'�������� � � ������� ��� ������ \MGetInfo\m ���������� ���������� ���������.'#13+
'������������� ���������� ������ � ������ \MAnOperation\m �������� � ����,'#13+
'��� ���������� ������ \MAnOperation\m � ���������� ������ \MCreator\m ����'#13+
'��������� ����������, ��������� �� ������� ����������� ���������, ������'#13+
'����� ��������� ����������� \I��� ��������� ����\i ������ \MAnOperation\m.'#13+
TestHeader+
'���� ���� �����. ��������� ���������� ���������� 1 � 2, ��������� � ������'#13+
'�� ������ ����� ����� \MAnOperation\m � ������� ������������ ���������'#13+
'����� ������ (������� ��������� ���������� ��� ������ ������,'#13+
'����� ��� ������ � �.\,�.).'
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
'\BFactory Method\b (\B��������� �����\b)~\= ����������� �������.'#13+
'\P\S������� 2\s. ������ ������� ���������� ����������� (��. \1),'#13+
'������ � ��� �� ������������ ����������� ������. �������� �������-\I���������\i'#13+
'������������ ���������� ����� \MConcreteProduct1\m � ��� ������� \MConcreteProduct2\m,'#13+
'�������� �������-\I����������\i ������������ ���������� ����� \MConcreteCreator1\m'#13+
'� ��� ������� \MConcreteCreator2\m. ��� � � ���������� �������, ������-��������'#13+
'������������ �������� � ��������� ������ (���� \Minfo\m � ����� \MGetInfo\m, �������'#13+
'���������� �������� ���� \Minfo\m), � ����� �� �������������� (����� \MTransform\m).'#13+
'���� \Minfo\m ���������������� � ������������ � ������� ������������ ���������,'#13+
'����� ���� ����������� ������ \MConcreteProduct1\m ����������� ���� \Minfo\m � �������'#13+
'��������, � ����������� ������ \MConcreteProduct2\m ��������� �� �� ��������,'#13+
'�� ������������� ����������� ������ ������ ������ � �������� ��������. �����'#13+
'\MTransform\m ��� ����������� ��������~1 ��������� �������������� ������~*'#13+
'(���������) ����� ������� ������� �������� ������ \Minfo\m, ��������� �� ���������'#13+
'(����� ���������� ������� ������). ����� \MTransform\m ��� ����������� ��������~2'#13+
'��������� �� �� �������� � ������������� ��������� �� ��� �������~='#13+
'(���� ���������) � ������ � ����� ������.'#13+
'\P� ������� \MConcreteProduct1\m � \MConcreteProduct2\m ���������� ��������� �����'#13+
'\MFactoryMethod(info)\m �� ��������� ����������, ������������ ������ �� ������'#13+
'\MConcreteProduct1\m. ��������� ����� ������ \MConcreteCreator1\m �������'#13+
'������ ���� \MConcreteProduct1\m, � ��������� ����� ������ \MConcreteCreator2\m'#13+
'������� ������ ���� \MConcreteProduct2\m; � ����� ������ ������������'#13+
'������������ ������� ���������� �������� \Minfo\m ���������� ������. � ������'#13+
'\MConcreteCreator1\m ����� ���������� ����� \MAnOperation(info)\m, �������'#13+
'������� ������� � ������� ���������� ������, ��������� ��� �������� \Minfo\m,'#13+
'������ �������� ����� \MTransform\m ���������� �������� � � ������� ��� ������'#13+
'\MGetInfo\m ���������� ���������� ���������.'#13+
TestHeader+
'���� ���� �����. ��������� ���������� ���������� 1 � 2, ��������� � ������'#13+
'�� ������ ����� ����� \MAnOperation\m � ������� ������������ ���������'#13+
'����� ������ (������� ��������� ���������� ��� ������ ������,'#13+
'����� ��� ������ � �.\,�.).'
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
'\BFactory Method\b (\B��������� �����\b)~\= ����������� �������.'#13+
'\P\S������� 3\s. ����������� �������� �������-�������� � ����������� ������� \MAnimal\m,'#13+
'���������� ����� \MGetInfo\m, ������� ���������� ��������� ��������, � ������'#13+
'����������� ���������: \MLion\m, \MTiger\m, \MLeopard\m (�������, cats), \MGorilla\m,'#13+
'\MOrangutan\m, \MChimpanzee\m (���������������� ��������, apes). ������ ����������'#13+
'����� �������� ��������� ���� \Mname\m (��� ���������), ������� ������������'#13+
'� ��� ������������ � ������� ������������ ���������. ����� \MGetInfo\m ����������'#13+
'��� ������ � ��� ���������, ����������� ��������, ��������, \<Lion Tom\>.'#13+
'\P����������� �������� �������-���������� � ����������� �������'#13+
'\MAnimalCreator\m � ����������� ��������� \MCatCreator\m � \MApeCreator\m. ���������'#13+
'����� \MCreateAnimal(ind, name)\m ���� ������� ��������� �������� ������ ���� \Mind\m'#13+
'� ��������� �������� \Mname\m � ���������� ������ ���� \MAnimal\m.'#13+
'��� ���������� ������� \MCatCreator\m � \MApeCreator\m �������� \Mind\m ������'#13+
'\MCreateAnimal\m ���������� ��� ������������ ��������� �� ��� ������� (0,~1'#13+
'���~2) � ������ �������� ��� �������, � �������� \Mname\m~\= ��� ���������.'#13+
'\P� ������ \MAnimalCreator\m ����� ���������� ����� \MGetZoo\m � �����'#13+
'�����������-��������� \Minds\m � \Mnames\m ����������� �������; ������ \Minds\m ��������'#13+
'����� �����, ������ \Mnames\m~\= ������ (��������������, ��� �������� ������� \Minds\m'#13+
'������ ����� �������� � ��������� ��~0 ��~2). ����� \MGetZoo\m ���������� ������'#13+
'�������� \MAnimal\m ���� �� �������, ��� � ������� \Minds\m � \Mnames\m; ������ �������'#13+
'����������� ������� ������������ � ������� ���������� ������ � �����������,'#13+
'������� ��������� ��������������� ��������� �������� \Minds\m � \Mnames\m.'#13+
TestHeader+
'��� ����� �� 4 ��� ({ind}, {name}), ��� {ind} \= ����� ����� � ��������� ��~0 ��~2,'#13+
'� {name} \= ������. ������������ ������� \Minds\m � \Mnames\m ������� 4, ����������'#13+
'����� � ������ �� ��������� ������, � ������������ �� � ������ \MGetZoo\m'#13+
'��� ���������� \MCatCreator\m � \MApeCreator\m, ������� � ���������� ������'#13+
'�������� � ������� ������� 4. � ������� ������ \MGetInfo\m'#13+
'������� ���������� � �������� �� ������� ������.'
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
'\G<Graph\OOPAbstractFactory.png>\BAbstract Factory\b (\B����������� �������\b)~\= ����������� �������.'#13+
'\P�������� ����� ��� ������ \BKit\b (\B��������������\b).'#13+
'\P\S������� �������������\s: �������.'#13+
'\P\S����������\s: ������������� ��������� ��� �������� �������� ���������������'#13+
'��� ��������������� ��������, �� ������������ ���������� ������ ���� ��������.'#13+
'������ ����������� ������� ������ ����������� ��� \I��������� ������\i'#13+
'(��.~\3).'#13+
'\P\S���������\s: \P\X~\IAbstractFactory\i (\I����������� �������\i)~\= ��������� ���������'#13+
'��� ��������, ��������� ����������� �������-��������; \P\X~\IConcreteFactory\i'#13+
'(\I���������� �������\i)~\= ��������� ��������, ��������� ����������'#13+
'�������-��������; \P\X~\IAbstractProduct\i (\I����������� �������\i)~\= ���������'#13+
'��������� ��� ���� �������-��������; \P\X~\IConcreteProduct\i (\I���������� �������\i)~\='#13+
'���������� ������-�������, ����������� ��������������� ���������� ��������;'#13+
'��������� ��������� AbstractProduct; \P\X~\IClient\i (\I������\i) ~\= ����������'#13+
'������������� ������������, ������� ��������� � ������� AbstractFactory'#13+
'� AbstractProduct.'#13+
'\P\S������� 1\s. ����������� ��� �������� �������, � ���� �� �������'#13+
'������ ����������� ������� \MAbstractFactory\m � ��� ���������� �������'#13+
'\MConcreteFactory1\m � \MConcreteFactory2\m, � ������~\= ����������� ������� (���� A)'#13+
'\MAbstractProductA\m � ��� ��� ������� \MProductA1\m � \MProductA2\m, � � ������~\='#13+
'����������� ������� (���� B) \MAbstractProductB\m � ��� ��� ������� \MProductB1\m'#13+
'� \MProductB2\m. ��� ������� �������� ������ \MCreateProductA\m � \MCreateProductB\m,'#13+
'���������� �������~1 �~2 ���������� ���������� �������� � ���������������'#13+
'������� (�������~1 ���������� �������� \MProductA1\m � \MProductB1\m, �������~2~\='#13+
'�������� \MProductA2\m � \MProductB2\m).'#13+
'\P��� ������-�������� ����� ����� \MGetInfo\m, ������������ ��������� ��������.'#13+
'����� ����, � �������� ������� ���� ��������� �����~\MA\m ��� ����������,'#13+
'� � �������� ������� ����~\= �����~\M�\m � ���������� ���� \MAbstractProductA\m'#13+
'(������ �� ���������� ��������). ���������� �������� �������� ���������'#13+
'���� \Minfo\m, ������� ���������������� � ������������ � ������� ��� ���������'#13+
'\I������ ����\i (� ���� \Minfo\m ������������ ��������� �������������'#13+
'�������������� ��������� ������������). ����� \MGetInfo\m ����������'#13+
'�������-��������� ���������� ������� �������� ���� \Minfo\m.'#13+
'\P��� ������-�������� \MProductA1\m �����~\MA\m ��������� ���� \Minfo\m � �����'#13+
'�����, ��������� ��� � ��������� ��������� ������������� ���������� � ����'#13+
'\Minfo\m; ��� ������-�������� \MProductA2\m �����~\MA\m ������ ��������� ������ \Minfo\m'#13+
'(��������, ������ \<123\> ������������� � ������ \<123123\>).'#13+
'\P��� ������-�������� \MProductB1\m ����� \MobjB.B(objA)\m ����������� ���� \MobjB.info\m'#13+
'� \MobjA.info\m � ����� �����, ���������� �� � ��������� ��������� �������������'#13+
'���������� � ���� \MobjB.info\m; ��� ������-�������� \MProductB2\m ����� \MobjB.B(objA)\m'#13+
'��������� � ����� ������ \MobjB.info\m ������ \MobjA.info\m'#13+
'� ��������� ��������� � ���� \MobjB.info\m.'#13+
TestHeader+
'���� ����� ����� {Nf}, ������� ����� ���� �����~1 ���~2, ����� �����~{Na} �~{Nb}'#13+
'� ������~{S}, ���������� �������~\<A\> �~\<B\>. ������� ��������� ����������~\Mf\m'#13+
'���� \MAbstractFactory\m, \Mpa\m ���� \MAbstractProductA\m � \Mpb\m ���� \MAbstractProductB\m.'#13+
'���� ����� {Nf} ����� 1, �� �������~\Mf\m � ���������� ��������~1, ���� {Nf} �����~2,'#13+
'�� �������~\Mf\m � ���������� ��������~2. ��������� ��������� ������ ���������'#13+
'�������, ������� ���������� �������� ����~A �~B, ��������������� �� �������'#13+
'������� {Na} � {Nb} ��������������, � ������� �� � ����������� \Mpa\m � \Mpb\m. �����'#13+
'��� ��������� ��������� \Mpa\m � \Mpb\m ��������� ������~\MA\m �~\MB\m � �������,'#13+
'��������� � �������� ������~{S}. ��� ���� �����~\MA\m ������ ����������'#13+
'��� �������� \Mpa\m, � �����~\MB\m~\= ��� �������� \Mpb\m, ������ ����������'#13+
'������~\MB\m ������ ���� ������� \Mpa\m. ��������� ������ \MGetInfo\m, �������'#13+
'�������� �������� ��������-��������� \Mpa\m � \Mpb\m (� ��������� �������).'#13+
'\P\S����������\s. ��� ���������� ������� ������������ ������ ������'#13+
'�� ����������� ������, � ����� ������ ������, ������������ � �����������'#13+
'������� (�� ����������� ������������ ����������� ���������� �������),'#13+
'��� � ���������� ���� �������� \<����������� �������\>.'
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
  DataS('����� ������� S: ', s, 50, 1);
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
'\BAbstract Factory\b (\B����������� �������\b)~\= ����������� �������.'#13+
'\P\S������� 2\s. ����������� �������� �������, ������������ ��� ���� ���������'#13+
'���������� (controls): ������ (buttons) � ����� (labels). ����������� ������'#13+
'\MAbstractButton\m � \MAbstractLabel\m �������� ����� \MGetControl\m, ������������'#13+
'��������� ������������� ���������������� �������� ����������. ����������'#13+
'������ \MButton1\m, \MButton2\m, \MLabel1\m, \MLabel2\m �������� ����������� �� ���������'#13+
'���������� \Mtext\m, ������� ���������� �����, ������������ �� �������� ����������'#13+
'(����� �������� � ���� \Mtext\m). ���������� ������ ���������� ����� ����������'#13+
'�������������. ��� \MButton1\m � \MLabel1\m (������ ������� �������������) �����'#13+
'������������ ���������� �������, ������ ����������� ����������� ��������'#13+
'(��������, [CAPTION]), ����� ����������� ��������� \<=\> (��������, =MESSAGE=).'#13+
'��� \MButton2\m � \MLabel2\m (������ ������� �������������) ����� ������������'#13+
'��������� �������, ������ ����������� �������� �������� (��������, <caption>),'#13+
'����� ����������� �������� ��������� (��������, "message").'#13+
'\P����������� �������� ������� \MControlFactory\m (����������� �������), \MFactory1\m'#13+
'� \MFactory2\m (���������� �������). ������ ����� �������� ��� ������:'#13+
'\MCreateButton(text)\m � \MCreateLabel(text)\m. ��� \MControlFactory\m ��� ������ ��������'#13+
'������������, ��� ���������� ������ ��� ���������� ������ � �����'#13+
'���������������� ���� (������� ��� �������).'#13+
'\P����� ����������� ����� \MClient\m, ��������������� ��� ������������ ������'#13+
'��������� ����������. ����������� ������� ������ ��������� �������� \Mf\m ����'#13+
'\MControlFactory\m, ������� � ���������� ������������ ��� ��������� ���������'#13+
'���������� ���������� ����. ����� \MClient\m �������� ����� \MAddButton(text)\m'#13+
'��� ���������� � ����� ����� ������, ����� \MAddLabel(text)\m ��� ����������'#13+
'� ����� ����� ����� � ����� \MGetControls\m, ������������ ��������� �������������'#13+
'����������� ������ ��������� ����������. � ��������� ������������� ������'#13+
'����������� ������� ���������� �� ����������� ����� ��������.'#13+
TestHeader+
'���� ����� ����� {N} (\l\,6) � ����� �� {N} �����. ������ ������ ���������� ����'#13+
'� ������� \<B\> (������� ������), ���� � ������� \<L\> (������� �����). ����� ����'#13+
'������ � ����� ���������������� �������� ����������. ��������� ��� ����������'#13+
'������ \MClient\m, ������������ � ������� ��� �������� ���������� �������������'#13+
'���������� ������ ��������� ����������. ������� ���������'#13+
'������ ������� �������������, ����� ������.'
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
'\G<Graph\OOPPrototype.png>\BPrototype\b (\B��������\b)~\= ����������� �������.'#13+
'\P\S������� �������������\s: �������.'#13+
'\P\S����������\s: ������ ���� ����������� �������� � ������� ����������-���������'#13+
'� ������� ����� ������� ����� ����������� (\<������������\>) ����� ���������.'#13+
'\P\S���������\s: \P\X~\IPrototype\i (\I��������\i)~\= ��������� ��������� ��� ������������'#13+
'������ ����; \P\X~\IConcretePrototype\i (\I���������� ��������\i)~\= ���������'#13+
'�������� ������������ ����; \P\X~\IClient\i (\I������\i)~\= ������� ����� ������,'#13+
'��������� � ��������� � �������� ����������� ����.'#13+
'\P\S������� 1\s. ����������� �������� �������, ������� �������� �����������'#13+
'�������� \MPrototype\m � ��� ���������� ��������� \MConcretePrototype1\m'#13+
'� \MConcretePrototype2\m. ��� ������ �������� ����� \MClone\m ��� ����������,'#13+
'������������ ����� �������, ���������� ������ �����, � ����� ������ \MGetInfo\m'#13+
'� \MChangeId\m. ����� \MGetInfo\m ��� ���������� ���������� ������, ����� \MChangeId\m'#13+
'����� ������������� �������� \Mid\m � ������ �� ����������. � ������ \MPrototype\m'#13+
'������ \MClone\m, \MGetInfo\m � \MChangeId\m �������� ������������. ���������� ���������'#13+
'�������� ��������� ���� \Mdata\m � ������������� ���� \Mid\m, ������� ����������������'#13+
'������������ ����������� ������������. ����� \MGetInfo\m ��� ����������'#13+
'���������� ���������� ������, ���������� ������� ��� ���� (\<CP1\> ��� ����'#13+
'\MConcretePrototype1\m � \<CP2\> ��� ���� \MConcretePrototype2\m) � �������� �����'#13+
'\Mdata\m � \Mid\m (����� �������� ����������� �������� \<=\>, ��������, \<CP1=TEXT=34\>).'#13+
'����� \MChangeId\m �������� �������� ���� \Mid\m. ��� ���������� ������ \MClone\m �����'#13+
'������������ ����������� �������� ����������� ����������'#13+
'��� ������� ����� ������������.'#13+
'\P����� ����������� ����� \MClient\m, ��������������� ��� ������ � ������� ��������'#13+
'���� \MConcretePrototype1\m ��� \MConcretePrototype2\m. ����������� ������ \MClient\m'#13+
'����� ��������-������ ���� \MPrototype\m, ������������ �������� ��������,'#13+
'���������� � ������ (�������� � ������ �� ������ � ����������� � �����������'#13+
'���� \Mprot\m; ��� �������� ������ �������� ������ ������������ ������������'#13+
'���������). ����� \MClient\m ����� �������� ������ \MOperation(id)\m � \MGetObjects\m.'#13+
'����� \MOperation\m ��������� � ����� ����� ������, ���������� ����� ������������'#13+
'��������� � ������������ ��������� ���� \Mid\m ����������� ������� � ������������'#13+
'�� ��������� ��������� ������ \MOperation\m. ����� \MGetObjects\m ��� ����������'#13+
'���������� ������ � ��������� ���� �������� ������ (�������� �����������'#13+
'��������). ��� ������� ����������� ������ ����� ���� � �� �� ���� \Mdata\m'#13+
'� ��������� ���� \Mid\m (���������� � ������ \MOperation\m).'#13+
TestHeader+
'���� ������ {S}, ����� ����� {N} (\l\,10) � ����� �� {N} ����� �����.'#13+
'������� ����� \MOperation\m ��� ���� �������� ������ \MClient\m, ������������ ���'#13+
'������ �� {N} ��������. ������ ����� �������� ������� ���� \MConcretePrototype1\m'#13+
'(� ��������� ������ �������� \MClient\m), ������ ����� �������� ������� ����'#13+
'\MConcretePrototype2\m (� ��������� ������ �������� \MClient\m). ��� ��������� �������'#13+
'������ ����� ���������� ���� \Mdata\m, ������ ������ {S}, � �������� ����� \Mid\m,'#13+
'������ �� ��������� ������ ����� �����. ��������� ����� \MGetObjects\m, �������'#13+
'��������� �������� ������� �� ���������� ������� ��������.'#13+
'\P\S����������\s. � �������� �������� ������, ���������� �� �������� \<��������\>'#13+
'����� �����������, ���� ����� �������� �� �������� �������� �������'#13+
'����������� ����� �������� �� ��� ������������'#13+
'� ����������� ��������� ��������� �������.'


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
'\BPrototype\b (\B��������\b)~\= ����������� �������.'#13+
'\P\S������� 2\s. ����������� �������� �������, ��������� � ������������ �����������:'#13+
'\MAbstractGraphic\m (����������� ������), \MEllip\m, \MLine\m � \MRect\m (����������'#13+
'���������). ������ �������� ����� \MClone\m ��� ����������, ������������ �����'#13+
'�������, ���������� ������ �����, � ����� ����� \MChangeLocation(x1, y1, x2, y2)\m'#13+
'� �������������� ����������� \Mx1\m, \My1\m, \Mx2\m, \My2\m, �� ������������ ��������,'#13+
'� ����� \MDraw\m ��� ����������, ������������ ������. � ������ \MAbstractGraphic\m'#13+
'������ \MClone\m, \MChangeLocation\m � \MDraw\m �������� ������������. ������ ����������'#13+
'���������� �������� ������������� ���� \Mx1\m, \My1\m, \Mx2\m, \My2\m; �� ��������� ���'#13+
'���������������� ������. ����� \MChangeLocation\m �������� ��� ����, � ����� \MDraw\m'#13+
'���������� ������, ���������� ��� ������ � ������� �������� ����� ��� ��������'#13+
'(��������, \<Line(1,3,-1,5)\>). ��� ���������� ������ \MClone\m ����� ������������'#13+
'����������� �������� ����������� ���������� ��� ������� ����� ������������.'#13+
'\P����� ����������� ����� \MGraphEditor\m, ��������������� ��� ������ � ������������'#13+
'���������. � ����������� ������ \MGraphEditor\m ���������� ��� ���������'#13+
'��������� \Mp0\m, \Mp1\m ���� AbstractGraphic, ������������ ��������� �����������'#13+
'��������-����������. ��� �������� ���������� ������������ ������ �� ����'#13+
'���������, ��� �������� ���������� ������ ����������� ���������� ������'#13+
'������������ ������������ ���������. ����� \MGraphEditor\m �������� ��� ������.'#13+
'����� \MAddGraphic(ind, x1, y1, x2, y2)\m ��������� � ����� ����������� ����������'#13+
'������, ��������� �� ������ ��������� � �������� \Mind\m (0 ���~1) � �������������'#13+
'��� ���� ��������� ����������. ����� \MDrawAll\m ��� ���������� ����������'#13+
'��������� �������� ���� ����������� ����������� ��������, ���������'#13+
'�� ����� \MDraw\m (�������� �������� ����������� ��������).'#13+
TestHeader+
'���� �������������� ������ {P}, ���������� ��� ��������� ����� �� ������'#13+
'\<E\>, \<L\>,~\<R\>. ����� ���� ����� ����� {N} (\l\,5) � ����� �� {N} ������� �����'#13+
'����� ���� ({ind}, {x}_1, {y}_1, {x}_2, {y}_2), ��� {ind} ��������� �������� 0 ��� 1,'#13+
'� ��������� ����� �������� �������������. ������� ������ \MGraphEditor\m,'#13+
'��������������� ��� ����� �����������, ������� ������������� ��������'#13+
'������ {P} (\<E\>~\= \MEllip\m, \<L\>~\= \MLine\m, \<R\>~\= \MRect\m); ������� ����������'#13+
'������������ �������� �������� � ������ {P}. �������� � ����� �����������'#13+
'���������� N ��������, ��������� ������ ������ AddGraphic � �����������,'#13+
'������������� ��������� ������ �����, � �������'#13+
'���������� ����� ���������� ������� \MDrawAll\m.'
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
'\G<Graph\OOPSingleton.png>\BSingleton\b (\B��������\b)~\= ����������� �������.'#13+
'\P\S������� �������������\s: ���� �������.'#13+
'\P\S����������\s: �����������, ��� � ������ ���� ������ ���� ���������,'#13+
'� ������������� � ���� ���������� ����� �������.'#13+
'\P\S���������\s: \P\X~\ISingleton\i (\I��������\i)~\= ���������� �������� Instance, �������'#13+
'��������� �������� �������� ������ � ������������� ���������� (��������'#13+
'Instance ������ ����������� � ���� \I������������\i, �.\,�. ����������, ������);'#13+
'����� ������������ \I���������� �������������\i ������� ����������.'#13+
'\P����� ����������������� ����������� �������� Singleton, � ������� ������������'#13+
'����������� �� ������ ��� ����������� �������, �� � ���������� �� ��� �� ����'#13+
'��������, ����������� ������������� \I������������� ����������\i �����������.'#13+
'\P\S������� 1\s. ����������� �������� �������, ���������� ����������� ������� �����'#13+
'\MBaseClass\m � ������-������� \MSingleton\m, \MDoubleton\m � \MTenton\m, ��������������'#13+
'�������� ������������� ���������� ����� �����������.'#13+
'\P����� \MBaseClass\m �������� ������������� ���� \Mdata\m � ��� ��������� � ��� ������:'#13+
'����� \MIncData(increment)\m ����������� �������� \Mdata\m �� �������� ��������������'#13+
'��������� \Mincrement\m, ����� \MGetData\m ��� ���������� ���������� ������� ��������'#13+
'���� \Mdata\m. ���� \Mdata\m ���������������� ������� ���������.'#13+
'\P����� \MSingleton\m ��������� ����������� ������� \<��������\>. �� ��������'#13+
'����������� ���� \MuniqueInstance\m~\= ������ �� ��� \MSingleton\m (����������������'#13+
'������� �������), �������� �����������, �� ����������� ��������������'#13+
'��������, � ����������� ����� \MInstance\m ��� ����������, ������� ����������'#13+
'������ �� ������ ���� \MSingleton\m). ����� \MInstance\m ��������� ���������'#13+
'��������: ���� ���� \MuniqueInstance\m �������� ������� �������, �� ����� �������'#13+
'������ \MSingleton\m, �������� ������ �� ���� � ���� \MuniqueInstance\m � ����������'#13+
'��� ������ ��� ��������� ����� ������; ���� ���� \MuniqueInstance\m ��� ��������'#13+
'������ �� ������ \MSingleton\m, �� ����� \MInstance\m ������ ���������� ��� ������.'#13+
'������������� ����������� ����������� ����� \MInstanceCount\m (��� ����������),'#13+
'������� ����������~0, ���� ���� \MuniqueInstance\m �������� ������� ������,'#13+
'�~1 � ��������� ������.'#13+
'\P������ \MDoubleton\m � \MTenton\m ��������� ������� ��������, �����������'#13+
'������������� \I�� ����� ����\i � \I�� ����� ������\i ����������� ��������������.'#13+
'\P����� \MDoubleton\m �������� ����������� ������ \Minstances\m �� ���� ���������-������'#13+
'���� \MDoubleton\m (�������� ���������������� �������� ����������), ��������'#13+
'����������� � ����������� ������ \MInstance1\m � \MInstance2\m, ������� ���������'#13+
'��������, ����������� ��������� ������ \MInstance\m ������ \MSingleton\m,'#13+
'�� ���������� �������������� � ��������� ������� \Minstances\m � ���������~0 �~1.'#13+
'\P����� \MTenton\m ���������� �� ������ \MDoubleton\m ���, ��� ��� ����������� ������'#13+
'\Minstances\m �������� 10~���������-������ ���� \MTenton\m, � ������ ���� �������'#13+
'\MInstance1\m � \MInstance2\m �� �������� ����������� ����� \MInstance(index)\m'#13+
'� ������������� ����������, ������������ ������ �������� ������� \Minstances\m,'#13+
'� �������� ���������� ������ �����. ���� �������� ��������� ��� ��������� 0\:9,'#13+
'�� ����� \MInstance\m ����� ���������� ������� ������ ��� ���������� ����������'#13+
'(��� ���������� ������� ����� �������� �� ����� ���������).'#13+
'\P� ������� \MDoubleton\m � \MTenton\m ������������� ����������� ����������� �����'#13+
'\MInstanceCount\m (��� ����������), ������� ���������� ���������� ���������'#13+
'������� \Minstances\m, �� ���������� �������� ��������.'#13+
TestHeader+
'���� ����� ����� {N} (\l\,10) � ����� �� {N} �����, ������� ����� ��������� ��������'#13+
'\<S\>, \<D1\>, \<D2\>, \<T0\>, \<T1\>, \., \<T9\>. ������� ������~\Mb\m �� {N}~���������~\='#13+
'������ �� \MBaseClass\m � ���������������� ��� �������� ������������ �������'#13+
'\MSingleton\m, \MDoubleton\m, \MTenton\m, ��������� ��������� �������� ����������� �������'#13+
'� ����������� �� �������� ��������������� ������ �� ��������� ������:'#13+
'��� ������ \<S\> ������������ ����� \MInstance\m ������ \MSingleton\m;'#13+
'��� ����� \<D1\>, \<D2\>~\= �������������� ������ \MInstance1\m � \MInstance2\m ������'#13+
'\MDoubleton\m; ��� ����� \<T0\>, \<T1\>,~\., \<T9\>~\= ����� \MInstance(index)\m ������'#13+
'\MTenton\m � ���������� \Mindex\m, ��������������� �����, ��������� � ������.'#13+
'\P����� �������� ���� ��������� ������� \Mb\m ������� �������� ������ \MInstanceCount\m'#13+
'��� ������� \MSingleton\m, \MDoubleton\m, \MTenton\m � ��������� �������.'#13+
'\P����� ���� ����� ����� {K} (\l\,20) � ����� �� {K} ��� ����� ����� ({index},'#13+
'{increment}), � ������� ����� {index} ��������� � ��������� ��~0 �� {N}\,\-\,1'#13+
'� ���������� ������ �������� � �������~\Mb\m, � ����� {increment} ����������'#13+
'�������� ������ \MIncData\m, ������� ���� ������� ��� �������� �������~\Mb\m'#13+
'� �������� {index}. ����� ������ ���� ��������� ������� \MIncData\m ������� ��������'#13+
'�������� ���� \Mdata\m ��� ���� �������� �������~\Mb\m, ��������� ����� \MGetData\m.'
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
  // ��������� inittaskgroup ������ ���� ��������� ��� ��������������
  // ��������� ������ ����������; � ��� ����������� ����� ���������
  // ��������� CreateGroup � ����� ���������� ���������, ���������
  // � ����������� ������������ (��������) ��� ������ � �� ��������
  if CurrentLanguage = lgC then
    exit;
  CreateGroup('OOP1Creat', '����������� ��������',
    '�. �. �������, 2022', 'qw��6#EnTopic<Creational patterns>#433333���dfttd', 10, InitTask);
end;

//exports inittaskgroup, activate;

begin
end.
