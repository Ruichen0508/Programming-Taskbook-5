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

const TestHeader = '\P\S������������ ������������� ������� �������\s.'#13;
  Subgroup1 = '������� �������� ���';
  Subgroup2 = '�������������� ������ ���';

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
'\B���� � ������ ������. ������������\b. \P����������� ����� \MStack\m, ������������'#13+
'���� ����� �����. ������ ����� �������� � ���� ����������� ������� �����,'#13+
'������� ��� ����: \Mdata\m (�������� ����� �����~\= �������� �������� �����) � \Mnext\m'#13+
'(�������� ������ �� ��������� ������� �����). ���� ����������� � ����'#13+
'���������������� ������ \MStackNode\m � ��������� ������ \Mdata\m � \Mnext\m.'#13+
'���� ������ ������������������ � ������������ � ������� ��� �����������'#13+
'����������. ����� \MStack\m �������� �������� ���� \Mtop\m ���� \MStackNode\m,'#13+
'���������� ������ �� ������� ����� (��� ������ ������, ���� ���� ����),'#13+
'����������� ��� ����������, ��������� ������ ����, � ����� �������� �������:'#13+
'\P\X~\MEmpty\m (��� ����������)~\= ���������� \M\t\m, ���� ���� ����, �~\M\f\m'#13+
'� ��������� ������; \P\X~\MPush(data)\m~\= ��������� � ���� ������� �� ���������'#13+
'\Mdata\m (������������� ��������), ������ �� ����������; \P\X~\MPop\m (��� ����������)~\='#13+
'��������� �� ����� ������� ������� � ���������� ��� �������� (���� ���� ����,'#13+
'�� ���������� �����~0); \P\X~\MPeek\m (��� ����������)~\= ���������� ��������'#13+
'�������� ��������, �� ������ ��� �� ����� (���� ���� ����, �� ����������'#13+
'�����~0); \P\X~\MClear\m (��� ����������)~\= ������� �� ����� ��� ��������,'#13+
'������ �� ����������; \P\X~\MToStr\m (��� ����������)~\= ���������� ���������'#13+
'������������� ����������� ����� � ������� \<v1-v2-\.-vN-end\>, ��� v1, v2,~\.,'#13+
'vN~\= �������� ��������� �����, ������� � ��� ������� (��������, \<12�34�end\>);'#13+
'��� ������� ����� ������� ������ ���������� ������ ����� \<end\>.'#13+
'\P������ ������� ��������� ����� ������������ ������ ������ ������, �������'#13+
'����������� \I���������\i (public), � �� ����� ��� ��� ���� �������� \I���������\i'#13+
'(private). ��� �����������, ��� ������� ��������� �� ������ �������� ����'#13+
'������������ ������� � ��� ����� �������� ���������� ������ �������.'#13+
'����� ����, ������� ����� ���� ����������� � ���������� �������� \I����������\i'#13+
'������ (������������ ��� ������), �� ������� ��� \I���������\i (������������'#13+
'�������� � ������������ �������� �����������). ��� ��������������'#13+
'������ ������� ���: \I������� ������������\i (�������� ������).'#13+
TestHeader+
'���� ������ {Name} (��� �����), ����� ����� {N} � ����� �� {N} ��������� ������,'#13+
'������ �� ������� ���������� ���� �� ������ �����. ��� ������ \MEmpty\m, \MPop\m,'#13+
'\MPeek\m, \MClear\m ������� ������ ������������ ����� ������, ����������� � ������'#13+
'�������; ��� ������� \MPush\m ������� ������ �������� ������ \<Push\> � ����� �����,'#13+
'������� ��������� �������� � ����; ������� \MToStr\m � ����� �� ������.'#13+
'\P������� ������ \Ms\m ���� \MStack\m � ��������� ��� ���� ��� ������� �� ���������'#13+
'������, ��������� ���������� � ���������� ������ � ��������� ����'#13+
'� ������ {Name}. ��� ������� ��� ����� ������ ���������� �� ���������������'#13+
'������� \MStackTest\m � ����������-������� ���� \MStack\m.'#13+
'\P���������� � ������ ������� �������� ���� ������ �����. ������� ���������'#13+
'��� �������, ��������� � ������. �����, ���� ������� ���������� �������������'#13+
'��������, �� ��������� ��� ��������, � ���� ������� ���������� ����������'#13+
'��������, �� ��������� ������ \<True\> � ������ �������� \M\t\m � ������ \<False\>'#13+
'� ������ �������� \M\f\m. ����� ����, ��� ������ ������� ��������� ���������'#13+
'������������� �����; ��� ����� ����� ������ ������ ������� �������������'#13+
'���������� ����� \MToStr\m ��� ������� \Ms\m, � ��� ������������ �������� ������������'#13+
'� ���� �� ��� �� ������, ��� � ���������� ������ ������� �������,'#13+
'��������� �� ��� ����� ��������.'
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
'\B������������\b. \P\I������� ������������\i �������� ������ ��������� ���;'#13+
'�� ��������� ��������� �������� ����������� �������. �����, �� ��������'#13+
'����������� (�����������) ����� �����, ���������� \I�������-�������\i,'#13+
'��� \I������� �������\i, ��� \I������������\i. ����������� ����� ����������'#13+
'\I�������-��������\i, ��� \I����������� �������\i, ��� \I����������\i.'#13+
'\P����������� ����� \MStackC\m, ������� �������� �������� ������ \MStack\m'#13+
'(�������������� � ������� \1) � ������������ ��������������'#13+
'�����������: ����������� �������� ���������� ��������� � �����. ��� �����'#13+
'�������� � ����� \MStackC\m ����� �������� ���� \Mcnt\m ������ ����, �������� �����'#13+
'\MCount\m ��� ����������, ������������ �������� ���� \Mcnt\m, � �������������� ������'#13+
'\MPush\m, \MPop\m � \MClear\m ����� �������, ����� ���, ������ ��������, ���������������'#13+
'� ������-������ \MStack\m, ��������������� ������� �������������� ��������'#13+
'���� \Mcnt\m. ���������� �����������, � ������� �������� ��������� ��������'#13+
'���� \Mcnt\m, ������~0. ����� ����, �������������� ����� \MToStr\m, ������� � ������,'#13+
'������������ ������� \MToStr\m ������, �������� ���� \Mcnt\m � ���������� �������,'#13+
'��������, \<12�34�end[2]\>. ��� ������� ����� ����� \MToStr\m'#13+
'������ ���������� ������ \<end[0]\>.'#13+
TestHeader+
'���� ������ {Name} (��� �����), ����� ����� {N} � ����� �� {N} ��������� ������,'#13+
'������ �� ������� ���������� ���� �� ������ ����� �� ��� �� ��������,'#13+
'��� � � ������� \1. ������� \MToStr\m � \MCount\m � ����� �� ������.'#13+
'\P������� ������ \Ms\m ���� \MStackC\m � ��������� ��� ���� ��� ������� �� ���������'#13+
'������, ��������� ���������� � ���������� ������ � ��������� ����'#13+
'� ������ {Name} �� ��� �� ��������, ��� � � \1. ��� � � �������'#13+
'\1, ������� ��� ����� ������ ���������� �� ���������������'#13+
'������� \MStackTest\m, ������� ������ ����� ��������-������ ���� \MStackC\m.'#13+
'�� ����������� ���� ������ ��������� ������� \MStackTest\m �� ������'#13+
'���������� �� ��������, �������������� � ������� \1.'
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
'\B�����������\b. \P� ������� ��������������, ��� ��� ����������� ������ \MStack\m'#13+
'� \MStackC\m, ��������� � �������� \2 � \1. ��������,'#13+
'��� �������������, ���������� ������� \MPush\m, \MPop\m, \MClear\m � \MToStr\m ���� �������'#13+
'����� �������, ����� ��� ������ �� ������� ����������� \I������� ����������\i,'#13+
'(\I���������� �� ����� ����������\i), ��������� �������� ����� ��������'#13+
'����������� ������ ������������ ����������� ����� ������� (���������'#13+
'��� ��� ��������), � �� ������� �����, �������������� ��� ��� ��������.'#13+
'��� ����� �������������� \I������� ������������\i~\= ������ ������� ���,'#13+
'����������� ��������� ������� ������������ ������� ������ �����,'#13+
'������� ��� ��� ������ � ����������� �������. ��� ������ � ������������'#13+
'���������� ������� ������������ �������������� ������������� ��� ���� �������;'#13+
'��� ������ �� ����������� ���������� ����� ������������� ��������������'#13+
'�������� ��� ����������� ��� �������, ��� ������� ��������� �����������'#13+
'������� ���������� (����� ������ ���������� \I������������\i).'#13+
TestHeader+
'���� ������ {Class} (��� ������������ �������), ������ {Name} (��� �����),'#13+
'����� ����� {N} � ����� �� {N} ��������� ������, ������ �� ������� ����������'#13+
'���� �� ������ ����� �� ��� �� ��������, ��� � � ������� \2.'#13+
'������� \MToStr\m � \MCount\m � ����� �� ������. ������ {Class} ����� ��������� ����'#13+
'�� ���� ��������: \<Stack\> ��� \<StackC\>.'#13+
'\P������� ������ \Ms\m ����, ���������� � ������ {Class}, � ��������� ��� ����'#13+
'��� ������� �� ��������� ������, ��������� ���������� � ���������� ������'#13+
'� ��������� ���� � ������ {Name} �� ��� �� ��������, ��� � � \2.'#13+
'\P��� ���������� ���� ������ ������������ ���� ����� ������� \MStackTest\m'#13+
'� ���������� ���������� ����; ��� ������� �� ������ ���������� �� ��������,'#13+
'�������������� � ������� \2 (� ���������, �� ���������� ��������'#13+
'������ ���� ������� �� ��� \MStack\m).'
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
'\B��������� ���������� � ���� ������� ����������\b. \P���� � ���������'#13+
'��������� ������� �����, ������������� � ������� ������, �� ���������'#13+
'� �����-���� ����������� ������, �� �������� �������� ���������� ����������,'#13+
'� ���������� ����� ������� ������������� \I���������� � ���� �������\i'#13+
'\I����������\i ������� (RTTI~\= Run-Time Type Information).'#13+
'\P� ������ ������� ��������������, ��� ��� ����������� ������ \MStack\m'#13+
'� \MStackC\m, ��������� � �������� \3\:\1.'#13+
'\P���� ������ {Class} (��� ������������ �������), ������ {Name} (��� �����),'#13+
'����� ����� {N} � ����� �� {N} ��������� ������, ������ �� ������� ����������'#13+
'���� �� ������ ����� �� ��� �� ��������, ��� � � ������� \3.'#13+
'������� {ToStr} � ����� �� ������, ������ ������� {Count} ����� �������.'#13+
'������ {Class} ����� ��������� ���� �� ���� ��������: \<Stack\> ��� \<StackC\>.'#13+
'\P������� ������ \Ms\m ����, ���������� � ������ {Class}, � ��������� ��� ����'#13+
'��� ������� �� ��������� ������, ��������� ���������� � ���������� ������'#13+
'� ��������� ���� � ������ {Name} �� ��� �� ��������, ��� � � \3.'#13+
'\P������� \MCount\m �������������� �� ��������� �������������� ��������: ����'#13+
'������ ����� ��� ������� ���������� \MStack\m, �� � ������ ����� ������������'#13+
'����� \<Count: Method not available\>, ���� ������ ����� ��� �������'#13+
'���������� \MStackC\m, �� ������ ����� ������ ��������� ��� \<Count\>, ���������,'#13+
'������ � ��������, ������� ������ ����� \MCount\m (��������, \<Count: 5\>;'#13+
'�������� ����� \MToStr\m � �������� ��� ��������� � ������ ������ �� ���������).'#13+
'\P��� ���������� ���� ������ ������������ ���� ����� ������� \MStackTest\m'#13+
'� ���������� ���������� ����; ��� ������� �� ������ ���������� �� ��������,'#13+
'�������������� � ������� \1, �� ����������� ���������,'#13+
'��������������� ������� \MCount\m.'
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
'\B��������� � ��������� ����������\b. \P\I����������\i (exceptions) ��������'#13+
'������������� ����������, ������� ���� ����������� �������� �����������'#13+
'������� ��������� ������� ��������� �� ������ ���������, �����������'#13+
'��� ���������� �� �������, � ������� ���������~\= ����� �����������'#13+
'�� ��������� ������ ��������. ��� �������, ���������� ����������'#13+
'����������� � ���� �������� ����������� �������, ������� ����� ���������,'#13+
'�������� ����� ������ ���������� �� ������������.'#13+
'\P�������� ������ \MPop\m � \MPeek\m ������� \MStack\m � \MStackC\m, ��������� � ��������'#13+
'\4\:\2, ����� �������, ����� ��� ������� �� ������ ���'#13+
'������� ����� ������������ ���������� \MStackException\m � ��������� ����������'#13+
'\<Empty stack in Pop\> ��� ������ \MPop\m � \<Empty stack in Peek\> ��� ������ \MPeek\m.'#13+
TestHeader+
'���� ������ {Class} (��� ������������ �������), ������ {Name} (��� �����),'#13+
'����� ����� {N} � ����� �� {N} ��������� ������, ������ �� ������� ����������'#13+
'���� �� ������ ����� �� ��� �� ��������, ��� � � ������� \4.'#13+
'������� \MToStr\m � \MCount\m � ����� �� ������. ������ {Class} ����� ���������'#13+
'���� �� ���� ��������: \<Stack\> ��� \<StackC\>.'#13+
'\P������� ������ \Ms\m ����, ���������� � ������ {Class}, � ��������� ��� ����'#13+
'������� �� ��������� ������, ��������� ���������� � ���������� ������'#13+
'� ��������� ���� � ������ {Name} �� ��� �� ��������, ��� � � \4.'#13+
'\P���� � ���������� ���������� ������� \MPop\m ��� \MPeek\m ����� ����������'#13+
'����������, �� �������� � ��������� ������ ����� ����� ��������� ����'#13+
'\<Pop: Empty stack in Pop\> ��� \<Peek: Empty stack in Peek\>, ������� ����'#13+
'� �������� ��������� ������.'#13+
'\P��� ���������� ���� ������ ������������ ���� ����� ������� \MStackTest\m'#13+
'(� ���������� ���������� ����), ������������� �� �������,'#13+
'������������� � ������� \2 ��� \1.'
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
'\B������� ������� � ������� �������\b. \P\I���������\i, ��� \I����������\i ������'#13+
'(templates, generics) ������� � ������ �� ����������� ����������; ���,'#13+
'� ���������, �������� ���������� ���������, ����������� ������� ��������'#13+
'������������� ���� (���� ��� ��� �������� ������ �������� � ����'#13+
'\I����������� ���������\i T). ������ � ���������� �������� � ����� ������'#13+
'����� ������������ \I��������� �������\i. � ������ � ������������ ����������'#13+
'��������� ������ � ������� �����������.'#13+
'\P������������ ��� ������������� ������ \MStackNode\m, \MStack\m � \MStackC\m'#13+
'� ��������� ������ (����� \MStackNode\m ������ � ������� \5,'#13+
'������ \MStack\m � \MStackC\m �������, � ����� ��������������, � ��������'#13+
'\5\:\1), ���������� ����������� ������ �� ������, ����������'#13+
'�������������, ���������� ��� ��������� ������ (��������������,'#13+
'��� ��� �������� ����� ����� ���������� ���).'#13+
TestHeader+
'���� ������ {Class} (��� ������������ �������), ������ {Type} (��� ���������'#13+
'�����), ������ {Name} (��� �����), ����� ����� {N} � ����� �� {N} ��������� ������,'#13+
'������ �� ������� ���������� ���� �� ������ ����� �� ��� �� ��������,'#13+
'��� � � ������� \5, �� ����������� ����, ��� ����� ������ \<Push\>'#13+
'����������� ������� ������ ����, ������������� �������� {Type}:'#13+
'\P\X~\<I\>~\= ������������� ���, \P\X~\<C\>~\= ���������� ���, \P\X~\<S\>~\= ��������� ���.'#13+
'\P������� \MToStr\m � \MCount\m � ����� �� ������; ����� ������ ����� �� ��������'#13+
'������ \MPop\m � \MPeek\m, ���������� ��� ������� �����. ������ {Class} ����� ���������'#13+
'���� �� ���� ��������: \<Stack\> ��� \<StackC\>.'#13+
'\P������� ������ \Ms\m ����, ���������� � ������ {Class}, � ���������� ����,'#13+
'������������� �������� {Type}, � ��������� ��� ���� ������� �� ��������� ������,'#13+
'��������� ���������� � ���������� ������ � ��������� ���� � ������ {Name}'#13+
'�� ��� �� ��������, ��� � � \5.'#13+
'\P��� ���������� ���� ������ ������������ ���� ����� ������� \MStackTest\m'#13+
'(� ���������� ���������� ����), ������������ ��� ������������� �� �������,'#13+
'������������� � ����� �� ���������� �������, � ��������� �������.'
);
// � ������ �������� �� ������������ ���� � ������������� ����������
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
  ResultComment('���������� ��������������� �����:', 0, 1);
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
  // ��������� inittaskgroup ������ ���� ��������� ��� ��������������
  // ��������� ������ ����������; � ��� ����������� ����� ���������
  // ��������� CreateGroup � ����� ���������� ���������, ���������
  // � ����������� ������������ (��������) ��� ������ � �� ��������
  if CurrentLanguage = lgC then
    exit;
  CreateGroup('OOP0Begin', '�������� � ���',
    '�. �. �������, 2022', 'qw���6#EnTopic<Introduction to OOP>#433365411111��dfttd', 6, InitTask);
end;

//exports inittaskgroup, activate;

begin
end.
