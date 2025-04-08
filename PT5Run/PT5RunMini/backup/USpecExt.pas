unit USpecExt;

// **************** Use Lazarus editor with codepage 1251 ******************

{$A+,B-,C-,D-,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R+,S-,T-,U-,V+,W-,X+,Y-,Z1}
{$MODE Delphi}

interface

//2015.11>
// 1) добавлена дополнительная возможность: если pt4dir = '<filename>',
// то в workdir указывается полное имя файла. Если такой файл существует,
// то он обрабатывается обычным образом;
// дополнительный поиск файлов не производится.

// 2) еще одна новая возможность: использование уточняющих имен языков
{
   Имя может содержать дополнительный уточняющий суффикс (один или
   несколько). Каждый уточняющий суффикс начинается с символа "дефис" (-).
   Например, [=PYTHON-3] или [=CPP-11-VS].
   Считается, что имени с уточняющим суффиксом соответствуют все имена,
   полученные из данного имени удалением любого числа уточняющих суффиксов
   с конца. Например, имени [=CPP-11-VS] соответствуют имена
   [=CPP-11-VS], [=CPP-11] и [=CPP].
   В именах файлов дополнений допускается использовать как "основные"
   имена языков, так и имена с уточняющим суффиксом.
   Такой подход, с одной стороны, обеспечивет обратную совместимость
   (например, даже если в новой версии будут использоваться языки PYTHON-2
   и PYTHON-3, для них останутся доступными файлы дополнений для языка
   PYTHON) и, с другой стороны, позволяет учитывать особенности различных
   версий (или даже сред разработки) для одного и того же языка.
   
   Подчеркнем, что обеспечивается именно обратная совместимость:
   если в файле дополнений используется новые имена языков с уточняющими
   суффиксами, то в предыдущих версиях эти имена не будут распознаваться.
   Это не является недостатком, поскольку явное применение суффиксов
   означает, что в файле дополнений используются специальные средства,
   присущие только некоторым версиям данного языка.
   Если имеется возможность избежать применения этих специальных средств,
   то можно создать несколько специализаций файла дополнений, например,
   PT4Demo[Python].txt, PT4Demo[Python-2].txt и PT4Demo[Python-3].txt;
   в этом случае первый файл будет использоваться в старых версиях,
   которые не учитывали суффиксы, а два других - в новых версиях,
   которые эти суффиксы учитывают.
   
}
// 3) переключатель [*] - переход к следующему номеру
// 4) переключатель [task: <группа>#<номер> <номер> ...]
//    или [task: <группа><номер> ...]
//    Текст на месте ... может содержать квадратные скобки (как в случае
//    переключателя [~]).
//2015.11<

//2015.12>
// Добавлены переключатели [BeginComment] и [EndComment]
//2015.12<
//2016.01>
// Переключатели [BeginComment] и [EndComment] заменены на [<] и [>]
// Переключатель [task:] заменен на [#<имя задания>]
// При наличии переключателя # можно использовать частичные заготовки
//2016.01<
//2017.08>
// (1) Добавлены управляющие последовательности %{ref}, %{refnum}, %{refcnt},
// позволяющие указывать имя внешней группы, номер внешнего задания и общее количество заданий.
// Две первые последовательности совпадают соответственно с %{group} и %{number},
//   ЕСЛИ задание не связывается с задачником.
// Также добавлены последовательности с параметром: %{ref-число}, %{ref+число},
// %{refnum-число}, %{refnum+число}, %{refcnt-число}, где в качестве числа можно
// указывать числа от 0 до 999. Первые две последовательности возвращают полное имя
// задания с указанным номером, т.е. они эквивалентны %{ref}%{refnum-число} и %{ref}%{refnum+число}.
// Все последовательности можно указывать также в преамбуле. Если число меньше 1, то вместо него выводится текст ***.
//
// (2) Добавлены средства для определения мультикомментариев [**] и [*число],
//     где число может лежать в диапазоне от 1 до 999.
//2017.08<
//2017.09>
// Внесены модификации, ускоряющие работу.
//2017.09<
//2018.07>
// Добавлен фрагмент, позволяющий распознавать язык не только в квадратных скобках,
// но и обрамленный символами подчеркивания
//2018.07<
//2018.08>
// Добавлена поддержка языка FS
//2018.08<
//2021.11>
// Добавлена поддержка юникода: опция [UTF-8]
//2021.11<
function FindExtFile(pt4dir, workdir, topic, locale, lang: string): string;
function GetPlainText(pt4dir, workdir, topic, locale, lang: string; num, count: integer;
  var utf8: boolean): string; //2021.11
function GetHtmlText(pt4dir, workdir, topic, locale, lang: string; num, count: integer;
  var utf8: boolean): string; //2021.11
function GetLoadText(pt4dir, workdir, topic, locale, lang: string; num: integer;
  var utf8: boolean): string; //2021.11
function GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang: string; var comment, author, {loadinfo,} taskinfo: string): integer;

//2016.01>
function StartsFromStdTemplMark(s: string): boolean;
function RemoveStdTemplMark(s: string): string;
//2016.01<

implementation
uses SysUtils, USet1000, AnsiUTF8,
     StrUtils, //2017.08
//     PT4LoadDat, //2017.11b
     PTAnsiUppercase; //2020.06

const //nlangs = 10;
      ncmds = 19;//18;  //2017.08
      _UseStdTempl = #18; //2016.01
      _NotUsed = #19;
      _Next = #20;
      _Task = #21;
      _Symb = #22;
      _Text = #23;
      _Html = #24;
      _Load = #25;
      _Ansi = #26;
      _Group = #27;
      _Number = #28;
      _PreambleStart = #29;
      _PreambleEnd = #30;
      _PreambleGroup = #31;
      nxcmds = 5;  //2017.08

var
//  langs: array[1..nlangs] of string =
//    ('[=PASCAL]', '[=PASCALABC]', '[=CPP]', '[=VB]', '[=VB.NET]', '[=CS]', '[=PYTHON]', '[=JAVA]', '[=1C]', '[=RUBY]');
  cmds: array[1..ncmds] of string =
    ('{task}', '{group}', '{number}', '{mark}',   '{B}', '{b}',  '{I}', '{i}',  '{M}',    '{m}',     '{S}',  '{s}',
     '{br}',   '~',      '<<',      '>>',    '---',     '--', '{ref}'); //2017.08
  load: array[1..ncmds] of string =
    ('',       '',        '',          '*',        '',    '',     '',    '',     '',       '',        '',      '',
     '',       '',       '"',       '"',     '-',       '-',      '');           //2017.08
  plain: array[1..ncmds] of string =
    ('',       '',        '',          #149,        '',    '',     '',    '',     '',       '',        '',      '',
   #13#10#13#10, #160,      #171,     #187,    #151,      #150,   '');        //2017.08
  html: array[1..ncmds] of string =
    ('',       '',        '',         '&#8226;',   '<b>', '</b>', '<i>', '</i>', '<code>', '</code>', '<span class="ptSpecial">', '</span>',
     '<br>',   '&nbsp;', '&#171;', '&#187;', '&#8212;', '&#8211;', '');     //2017.08
  curTopic: string = '';
  curLocale: string = '';
  curLang: string = '';
  curCount: integer = 0;
  htmlpar: string;
  rawData: array[0..1000] of string;
  globalLang: string = '';
//2015.11>
  _GlobalTopic1, _GlobalTopic2, _GlobalAuthor, _GlobalTaskInfo: string;
  _GlobalMaxNum: integer;
  _IsExternalFile, _ExtFileWithSubgroup: boolean; //2015.12
//2015.11<
//2016.01>
  macbegin, macend: integer;
  macros: array[1..1000] of string;
//2016.01<
//2017.08>
  xcmds:  array[1..nxcmds] of string = ('{ref-', '{ref+','{refnum-', '{refnum+', '{refcnt-');
  xnum:   string = '';
  xgroup: string = '';
  multicomm: integer; // режим мультикомментария (если > 0),
                      // равен начальному номеру задания, который снабжается
                      // указанным комментарием
//2017.08<
//2021.11>
  utf8mode: boolean = false;
//2021.11<


//2021.11>
(*
function ToUTF8(s: string): string;
var i: integer;
    isAnsi: boolean;
begin
  result := '';
  isAnsi := true;
  for i := 1 to length(s) do
  begin
    if s[i] = _Ansi then
      isAnsi := not isAnsi
    else
      if not isAnsi then
        result := result + AnsiToUtf8(s[i])
      else
        result := result + s[i];
  end;
end;

function FreeUTF8(s: string): string;
var p: integer;
begin
  p := Pos(_Ansi, s);
  while p > 0 do
  begin
    Delete(s, p, 1);
    p := PosEx(_Ansi, s, p); //2017.09
  end;
  result := s;
end;
*)
//2021.11<


function IsPreambleSwitcher(s: string): boolean;
begin
  result := (length(s) > 2) and (Copy(s,1,2) = '[~') and (s[length(s)] = ']');
end;

//2015.11>
function IsTaskInfoSwitcher(s: string): boolean;
begin
  result := (length(s) > 2) and (Uppercase(Copy(s,1,2)) = '[#') and (s[length(s)] = ']');
end;

function TaskInfoSwitcher(s: string; ss: TSet1000; var task: string): boolean;
function check1(s: string; var s1, s3: string): boolean;
var i,c: integer;
begin
  result := false;
  s1 := ''; s3 := '';
  c := length(s);
  for i := c downto 1 do
    if s[i] in ['0'..'9'] then
    begin
      s3 := s[i] + s3;
      c := c - 1;
    end
    else
    break;
  if (s3 = '') or (c = 0) then exit;
{  if s[c] = '#' then
  begin
    s2 := '#';
    c := c - 1;
  end;}
  for i := 1 to c do
    if not (s[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
      exit
    else
      s1 := s1 + s[i];
  if (s1 = '') or (s3 = '') then
    exit;
  result := true;
end;
var p, code: integer;
    snum, s0, s1, s3, s4: string;
begin
  result := false;
  if (ss.Count = 0) or (ss.Count > 1) or (ss.Elem(0) < 1)
     or not _IsExternalFile //2015.12
  then exit;
  Str(ss.Elem(0), snum);
  delete(s, 1, 2);
  delete(s, length(s), 1);
{  s := Trim(s) + ' ';
  p := Pos(' ', s);
  s0 := Trim(Copy(s, 1, p-1));
  delete(s,1,p);}
  if s = '' then
  begin
    task := task + '|' + snum + '  '; // два пробела!
    exit;
  end;
  if not check1(s, s1, s3) then exit;
{  if s2 = '#' then
  begin
    if s = '' then exit;
    p := Pos(' ', s);
    s4 := Trim(Copy(s, 1, p-1));
    delete(s, 1, p);
    val(s4, p, code);
    if code > 0 then exit;
    s1 := s1 + s2 + s3;
    s3 := s4;
  end;}
  task := task + '|' + snum + ' ' + s1 + ' ' + s3;
  result := true;
end;


function TaskInfoFromLine(s: string; ss: TSet1000; pref: char; var task: string): boolean;
  // pref определяет префикс для команды {task};
  // если найдена команда {task}, то функция возвращает true, но строка task не меняется
function RemoveS(var s: string; c1, c2: char): boolean;
begin
  s := trim(s);
  result := s = '';
  if result then exit;
  if (s[1] = c1) and (s[length(s)] = c2) then
    s := copy(s, 2, length(s) - 2);
end;
var p, i, c: integer;
    snum, s1, s2: string;
begin
  result := false;
  if (ss.Count = 0) or (ss.Count > 1) or (ss.Elem(0) < 1)
    or not _IsExternalFile //2015.12
  then exit;
  Str(ss.Elem(0), snum);
  s := trim(s);
  p := Pos('PT.TASK', AnsiUppercase(s));
  if p > 0 then      // особенность варианта для F#
  begin
     delete(s,1,p+6);
     p := 1;
  end
  else
  begin
     p := Pos('TASK', AnsiUppercase(s));
     if p = 1 then
        delete(s,1,4)
  end;
  if p <> 1 then exit;
  
  s := trim(s);
  if s = '' then exit;
  if s[length(s)] = ';' then
    delete(s,length(s), 1);
  if RemoveS(s, '(', ')') then exit;
  if RemoveS(s, '''', '''') then exit;
  if RemoveS(s, '"', '"') then exit;
  s := trim(s);
  if s = pref + cmds[1] then
  begin
    result := true;
    exit;
  end;
  while (s <> '') and not (s[length(s)] in ['0'..'9']) do
    delete(s, length(s), 1);
  if (s = '') then exit;
  s1 := '';
  s2 := '';
  c := length(s);
  for i := length(s) downto 1 do
    if s[i] in ['0'..'9'] then
    begin
      s2 := s[i] + s2;
      c := c - 1;
    end
    else
      break;
  if (s2 = '') or (c = 0) then exit;
  for i := 1 to c do
    if s[i] in ['A'..'Z','a'..'z','0'..'9'] then
      s1 := s1 + s[i]
    else
      exit;
  if (s1 = '') or (s2 = '') then exit;
  task := task + '|' + snum + ' ' + s1 + ' ' + s2;
  result := true;
end;
//2015.11<


function GetSubgroupName(s: string): string;
begin
  if length(s)=3 then
    result := _PreambleGroup
  else
  begin
    result := Copy(s, 3, length(s) - 3);
//2021.11>
    if utf8mode then
      result := PT4Utf8toAnsi(result);
//2021.11<
  end;
end;

function IsSwitcher(s: string; var correct: boolean): boolean;
var i: integer;
begin
  correct := true;
  result := (s <> '') and (s[1] = '[') and (s[length(s)] = ']');
  for i := length(s)-1 downto 2 do
    if s[i] = ' ' then delete(s,i,1);
  for i := 2 to length(s)-1 do
    if (s[i]='[') and (s[i-1] <> ']')
      or (s[i]=']') and (s[i+1] <> '[') then
    begin
      correct := false;
      exit;
    end;
end;

//2015.11>
procedure NextLang(var lang: string); //  с квадратными скобками
var i: integer;
begin
  for i := length(lang) downto 1 do
    if lang[i] = '-' then
    begin
      delete(lang, i, length(lang)-i);
      exit;
    end;
  lang := '';
end;
//2015.11<

function IsLangSwitcher(lang, s: string): boolean;
begin
//2015.11>
  result := true;
  while lang <> '' do
  begin
    if Pos(lang, s) > 0 then
      exit;
    NextLang(lang);
  end;
  result := Pos('[=]', s) > 0;
//2015.11<
end;

function IsLangsSwitcher(s: string): boolean;
var i: integer;
begin
  result := (length(s) > 2) and (s[1]='[') and (Pos('[=',s) > 0) and (s[length(s)] = ']');
{  result := false;
  for i := 1 to nlangs do
    if Pos(langs[i], s) > 0 then
    begin
      result := true;
      exit;
    end;}
end;

//2015.11>
function IsNextNumSwitcher(s: string): boolean;
begin
  result := TrimRight(s) = '[*]';
end;
//2015.11<

//2017.08multi>
function IsMulticommSwitcher(s: string; var cnt: integer): boolean;
var code: integer;
begin
//  result := false;

  s := TrimRight(s);
  if s = '[**]' then
  begin
    result := true;
    cnt := _GlobalMaxNum;//999;
    exit;
  end;
  result := (Length(s) >= 4) and (Length(s) <= 6) and (Copy(s, 1, 2) = '[*') and (s[Length(s)] = ']');
  if not result then exit;
  s := Copy(s, 3, length(s) - 3);
  Val(s, cnt, code);
  result := (code = 0) and (cnt > 0) and (cnt < 1000);
  if cnt > _GlobalMaxNum then
    cnt := _GlobalMaxNum;
end;
//2017.08multi<


function CheckNum(s: string; num: integer; var inRange: boolean; var n1, n2: integer): boolean;
var p, code1, code2: integer;
begin
  p := Pos('-',s);
  if p = 0 then
  begin
    Val(s, n1, code1);
    result := (code1 = 0) and (n1 >= 0) and (n1 <= 1000);
    inRange := n1 = num;
    n2 := n1;
  end
  else
  begin
    Val(Copy(s,1,p-1), n1, code1);
    Val(Copy(s,p+1,length(s)), n2, code2);
    result := (code1 = 0) and (code2 = 0) and (n1 >= 0) and (n2 >= n1) and (n2 <= 1000);
    inRange := (n1 <= num) and (num <= n2);
  end;
end;


//2016.01>
function IsNextNumMacroSwitcher(s: string): boolean;
var a: array[1..1000] of integer;
    n,p,i,c: integer;
    gr,s0: string;
function checknum0(s: string): boolean;
var b: boolean;
    i, n1, n2: integer;
begin
  result := true;
  if s = '' then
    exit;
  result := CheckNum(s, 0, b, n1, n2) and (n1 > 0) and (n2 < 1000);
  if result then
    for i := n1 to n2 do
    begin
      inc(n);
      if n <= 1000 then
        a[n] := i;
    end;
end;
begin
  result := false;
  n := 0;
  s := TrimRight(s);
  if (s = '') or (Pos('[*',s) <> 1) or (s[length(s)] <> ']') then exit;
  delete(s,1,2);
  s[length(s)] := ' ';
  p := pos(' ',s);
  gr := Copy(s,1,p-1);
  if gr = '' then exit;
  delete(s, 1, p);
  s := trimLeft(s);
  s0 := '';
  for i := length(gr) downto 1 do
    if gr[i] in ['0'..'9','-'] then
    begin
      s0 := gr[i] + s0;
      delete(gr, i, 1);
    end
    else
      break;
  if gr = '' then exit; //2017.08 исправил ошибку! иначе была допустима ПУСТАЯ группа!
  for i := 1 to length(gr) do
    if not (gr[i] in ['A'..'Z','a'..'z','0'..'9']) then exit;
  // имя группы правильное
  if not checknum0(s0) then exit;
  while s <> '' do
  begin
    p := Pos(' ',s);
    if not checknum0(copy(s, 1, p-1)) then exit;
    delete(s, 1, p);
    s := TrimLeft(s);
  end;
  if n = 0 then exit;
  // набор чисел правильный
  result := true;
  macbegin := 1;
  macend := 0;
  // разворачивание макропереключателя в набор переключателей
  for i := 1 to n do
  begin
    inc(macend);
    macros[macend] := '[*]';
    inc(macend);
    macros[macend] := '[#'+gr+IntToStr(a[i])+']';
  end;
end;
//2016.01<


//2015.12>
function IsBeginCommSwitcher(s: string): boolean;
begin
  result := TrimRight(s) = '[<]';
end;
function IsEndCommSwitcher(s: string): boolean;
begin
  result := TrimRight(s) = '[>]';
end;
//2015.12<

function IsSSwitcher(s: string): boolean;
begin
  result := (length(s) = 9) and (Copy(s,2,6) = 'ESCAPE')
    and not (s[8] in [' ','A'..'Z','a'..'z','0'..'9','А'..'Я','а'..'я','Ё','ё']);
end;

function IsPreSwitcher(s: string): boolean;
begin
  result := s = '[CODE]';
end;

function IsPSwitcher(s: string): boolean;
begin
  result := s = '[TEXT]';
end;

type set_of_char = set of char;

function SwitcherSet(pm: char; s: string): set_of_char;
var i: integer;
begin
  result := [];
  if s = '[' + pm + ']' then
    s := '[' + pm + 'WHL]';
  if (length(s) < 4) or (Copy(s,1,2) <> '[' + pm) or
    (Copy(s,length(s),1) <> ']') then
    exit;
  for i := 3 to length(s)-1 do
    if s[i] in ['W', 'H', 'L'] then
      result := result + [s[i]]
    else
    if not (s[i] in ['A'..'Z']) then
    begin
      result := [];
      exit;
    end;
end;

function IsPTextSwitcher(s: string): boolean;
begin
  result := 'W' in SwitcherSet('+', s); //s = '[+SHOW]';
end;

function IsMTextSwitcher(s: string): boolean;
begin
  result := 'W' in SwitcherSet('-', s); //s = '[-SHOW]';
end;

function IsPHtmlSwitcher(s: string): boolean;
begin
  result := 'H' in SwitcherSet('+', s); //s = '[+HTML]';
end;

function IsMHtmlSwitcher(s: string): boolean;
begin
  result := 'H' in SwitcherSet('-', s); //s = '[-HTML]';
end;

function IsPLoadSwitcher(s: string): boolean;
begin
  result := 'L' in SwitcherSet('+', s); //s = '[+LOAD]';
end;

function IsMLoadSwitcher(s: string): boolean;
begin
  result := 'L' in SwitcherSet('-', s); //s = '[-LOAD]';
end;

//2021.11>
(*
function IsAnsiSwitcher(s: string): boolean;
begin
  result := false; //s = '[ANSI]';  //2016.01utf
end;
*)

function IsUTF8Switcher(s: string): boolean;
begin
  result := s = '[UTF-8]';  //2016.01utf //2021.11 - восстановил!
end;
//2021.11<

function IsNumsSwitcher(s: string): boolean;
var cur: string;
    b1: boolean;
    n1, n2, i: integer;
begin
  result := false;
  cur := '';
  for i := 2 to length(s) do
    if s[i] = ']' then
    begin
      if CheckNum(cur, 0, b1, n1, n2) then
      begin
        result := true;
        exit;
      end;
      cur := ''
    end
    else
    if s[i] <> '[' then
      cur := cur + s[i];
end;

(* не используется!
function IsNumSwitcher(num: integer; s: string): boolean;
var cur: string;
    b1: boolean;
    n1, n2, i: integer;
begin
  result := false;
  cur := '';
  for i := 2 to length(s) do
    if s[i] = ']' then
    begin
      if CheckNum(cur, num, b1, n1, n2) and b1 then
      begin
        result := true;
        exit;
      end;
      cur := ''
    end
    else
    if s[i] <> '[' then
      cur := cur + s[i];
end;
*)

procedure AllNumsSwitcher(s: string; ss: TSet1000);
var cur: string;
    b1: boolean;
    n1, n2, i, j: integer;
begin
  ss.Clear;
  cur := '';
  for i := 2 to length(s) do
    if s[i] = ']' then
    begin
      if CheckNum(cur, -1, b1, n1, n2) then
        for j := n1 to n2 do
          if j < 1000 then
            ss.Add(j);
      cur := ''
    end
    else
    if s[i] <> '[' then
      cur := cur + s[i];
end;

//2015.11>
procedure NextNumSwitcher(ss: TSet1000);
var n: integer;
begin
//2017.08multi>
  if multicomm > 0 then
  begin
    n := multicomm;
    multicomm := 0;
  end
  else
//2017.08multi<
  if ss.Max < 1 then
    n := 1
  else
  if ss.Max < 999 then
    n := ss.Max + 1
  else
    n := 1000;
  ss.Clear;
  ss.Add(n);
end;
//2015.11<

//2017.08multi>
procedure MulticommSwitcher(ss: TSet1000; cnt: integer);
var code: integer;
    n, k: integer;
begin
  if multicomm = 0 then
    if ss.Max < 1 then
      multicomm := 1
    else
    if ss.Max < 999 then
      multicomm := ss.Max + 1
    else
      multicomm := 1000;
  if cnt = 1 then
    AllNumsSwitcher('['+IntToStr(multicomm)+']', ss)
  else
  begin
    k := multicomm+cnt-1;
    if k > 1000 then k := 1000;
    AllNumsSwitcher('['+IntToStr(multicomm)+'-'+IntToStr(k)+']', ss);
  end;
end;
//2017.08multi<



function SectionExists(s, lang: string): boolean;
var f:textfile;
    b: boolean;
begin
  result := false;
  Assign(f, s);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then exit;
  lang := Uppercase('[='+lang+']');
  while not EOF(f) do
  begin
    readln(f, s);
    s := TrimRight(s);
    if not IsSwitcher(s,b) or not b then
      continue;
    s := Uppercase(s);
    if IsLangSwitcher(lang, s) then
    begin
      result := true;
      break;
    end;
  end;
  Close(f);
end;

function AddSlash(s: string): string;
begin
  result := s;
  if (s <> '') and (s[length(s)] <> '/') then
    result := s + '/';
end;

procedure Formatting(var data : string; FromS, ToS : string);
var n : integer;
begin
  n := Pos(FromS,data);
  while n <> 0 do
  begin
    delete(data,n,length(FromS));
    insert(ToS,data,n);
    n := PosEx(FromS,data,n); //2017.09
  end;
end;

//2017.08>
function PureGroup(s: string): string;
var p: integer;
begin
  p := Pos('-',s);
  while p > 0 do
  begin
    Delete(s, p, 1);
    p := PosEx('-',s,p); //2017.09
  end;
  result := s;
end;


procedure XRawFormatting(var data : string; FromS, ToS : string);
var n, k, p, x, code : integer;
    s, xdata: string;
begin
  n := Pos(FromS,data);
  while n <> 0 do
  begin
    s := Copy(data, n+length(FromS), 4);
    p := Pos('}', s);
    if p > 1 then
    begin
      xdata := Copy(s, 1, p-1);
      Val(xdata, x, code);
      if (code = 0) and (trim(xdata)=xdata) then
      begin
        k := length(xdata);
        while length(xdata) < 3 do
          xdata := '0' + xdata;
        delete(data,n,length(FromS)+k+1);
        insert(ToS+xdata,data,n);
      end;
    end;
    n := PosEx(FromS, data, n+1);
  end;
end;

procedure XFormatting(var data: string);
procedure Process(FromS, group: string; val, op: integer);
var n : integer;
    ToS: string;
begin
  n := Pos(FromS,data);
  while n <> 0 do
  begin
    delete(data,n,length(FromS));
    ToS := IntToStr(val + op * StrToInt(data[n]+data[n+1]+data[n+2]));
    if (ToS[1] = '-') or (ToS[1] = '0') then
      ToS := '***';
    Delete(data, n, 3);
    insert(group+ToS,data,n);
    n := PosEx(FromS,data,n); //2017.09
  end;
end;
begin
//  Showmessage(snum + '=' +sextnum);
  Process(_Symb+xcmds[1], xgroup, StrToInt(xnum), -1);
  Process(_Symb+xcmds[2], xgroup, StrToInt(xnum), 1);
  Process(_Symb+xcmds[3], '', StrToInt(xnum), -1);
  Process(_Symb+xcmds[4], '', StrToInt(xnum), 1);
  Process(_Symb+xcmds[5], '', _GlobalMaxNum, -1);
end;
//2017.08<

function RawTransform(s: string; symb: char): string;
var i: integer;
    b: boolean;
begin
  if (Copy(s,1,2)=symb + '[') and IsSwitcher(Copy(s,2,length(s)), b) then
    s := Copy(s,2,length(s));
  for i := 1 to ncmds do
    Formatting(s, symb+cmds[i], _Symb+cmds[i]);
//2017.08>
  for i := 1 to nxcmds do
    XRawFormatting(s, symb+xcmds[i], _Symb+xcmds[i]);
  Formatting(s, symb+'{refnum}', _Symb+'{refnum-000');
  Formatting(s, symb+'{refcnt}', _Symb+'{refcnt-000');
//2017.08<
  result := s;
end;

function NextPart(var s: string; substr: string): string;
var p: integer;
begin
  p := Pos(substr, s);
  if p = 0 then
  begin
    result := s;
    s := '';
  end
  else
  begin
    result := Copy(s,1,p-1);
    Delete(s,1,p+ length(substr)-1);
  end;
end;

function ParTransform(s, tp: string): string;
var ss: string;
begin
  result := '';
  while Copy(s,1,2) = #13#10 do
    delete(s,1,2);
  while Copy(s,length(s)-1,2) = #13#10 do
    delete(s,length(s)-1,2);
  Formatting(s, #13#10#13#10#13#10, #13#10#13#10);
  while s <> '' do
  begin
    ss := NextPart(s, #13#10#13#10);
    Formatting(ss, #13#10, ' ');
    if tp = 'plain' then
      result := result + ss + #13#10
    else
    if tp = 'html' then
      result := result + htmlpar + ss + '</p>'#13#10
  end;
end;

function RemoveHiddenParts(s: string; c,c1,c2: char): string;
var i: integer;
    b: boolean;
begin
  result := '';
  b := true;
  for i := 1 to length(s) do
  begin
    if s[i] = c then
      b := not b
    else
      if (s[i] <> c1) and (s[i] <> c2) and (b or (s[i] = _Next)) then
        result := result + s[i];
  end;
end;

function PlainTransform(s: string): string;
var i: integer;
    isP: boolean;
    wasP, wasC: string;
    s0: string;
begin
  s := RemoveHiddenParts(s, _Text, _Html, _Load);
//  s := FreeUTF8(s); //2021.11
  for i := 1 to ncmds do
    Formatting(s, _Symb+cmds[i], plain[i]);
  XFormatting(s); //2017.08
  result := '';
  isP := false;
  wasP := '';
  wasC := '';
  while s <> '' do
  begin
    if isP then
    begin
      s0 := ParTransform(NextPart(s,_Next),'plain');
      if s0 <> '' then
      begin
        result := result + wasC + s0;
        wasP := #13#10;
        wasC := '';
      end;
    end
    else
    begin
      s0 := NextPart(s,_Next);
      if s0 <> '' then
      begin
        result := result + wasP + TrimRight(s0) + #13#10;
        wasP := '';
        wasC := #13#10;
      end;
    end;
    isP := not isP;
  end;
//2016.01>
  if result = #13#10 then
    result := '';
//2016.01<
end;

function SpecHtmlTransform(s: string): string;
var i: integer;
begin
  for i := length(s) downto 1 do
  case s[i] of
  '&': Insert('amp;',s,i+1);
  '<': begin
         if (i>1) and (Copy(s,i-1,3) = _Symb+'<<') or
            (i>2) and (Copy(s,i-2,3) = _Symb+'<<') then
            continue;
         s[i] := '&';
         Insert('lt;',s,i+1);
       end;
  '>': begin
         if (i>1) and (Copy(s,i-1,3) = _Symb+'>>') or
            (i>2) and (Copy(s,i-2,3) = _Symb+'>>') then
            continue;
         s[i] := '&';
         Insert('gt;',s,i+1);
       end;
  '"': begin
         s[i] := '&';
         Insert('quot;',s,i+1);
       end;
  end;
  Result := s;
end;

function RemoveAllRegimeMarks(s: string; c1, c2, c3: char): string;
var i: integer;
begin
  result := '';
  for i := 1 to length(s) do
    if not (s[i] in [c1,c2,c3]) then
      result := result + s[i];
end;

var _Preambles: array[1..100] of string;
    _PreamblesNames: array[0..100] of string;
    _PreamblesCount: integer;

procedure ExtractPreambles(s: string);
var
    name: string;
    isP, isPreamble, isPreambleName: boolean;
    i, icurrent, j: integer;
begin
  _PreamblesCount := 1;
  _PreamblesNames[1] := _PreambleGroup;
  for j := 1 to 100 do
    _Preambles[j] := '';
  isP := false;
  isPreamble := false;
  isPreambleName := false;
  icurrent := 1;
  for i := 1 to length(s) do
  begin
    if s[i] = _Next then
    begin
      isP := not isP;
      for j := 1 to 100 do
        _Preambles[j] := _Preambles[j] + _Next;
    end
    else
      if s[i] = _PreambleStart then
        isPreambleName := true
      else
        if s[i] = _PreambleEnd then
        begin
          isPreambleName := false;
          name := '';
          for j := i-1 downto 1 do
            if s[j] <> _PreambleStart then
              name := s[j] + name
            else
              break;
          isPreamble := name <> '';
          if name = '' then
            name := _PreambleGroup
          else
            name := AnsiUppercase(name);
          icurrent := 0;
          for j := 1 to _PreamblesCount do
            if _PreamblesNames[j] = name then
            begin
              icurrent := j;
              break;
            end;
          if icurrent = 0 then
          begin
            _PreamblesCount := _PreamblesCount + 1;
            _PreamblesNames[_PreamblesCount] := name;
            icurrent := _PreamblesCount;
          end;
        end
        else
          if not isPreambleName and (isPreamble or isP) then
            _Preambles[icurrent] := _Preambles[icurrent] + s[i];
  end;
end;



function HtmlTransform(s: string; num: integer): string;
var i,k: integer;
    isP: boolean;
    s0, res: string;
begin
  if num <> 0 then
    s := RemoveHiddenParts(s, _Html, _Text, _Load)
  else
    s := RemoveAllRegimeMarks(s, _Html, _Text, _Load);
//  s := FreeUTF8(s);  //2021.11
  if num = 0 then
    ExtractPreambles(s)
  else
  begin
    _PreamblesCount := 1;
    _PreamblesNames[1] := _PreambleGroup;
    _Preambles[1] := s;
  end;
  for k := 1 to _PreamblesCount do
  begin
    s := _Preambles[k];
    s := SpecHtmlTransform(s);
    for i := 1 to ncmds do
    begin
      Formatting(s, _Symb+cmds[i], html[i]);
    end;
    XFormatting(s); //2017.08
    res := '';
    isP := false;
    while s <> '' do
    begin
      if isP then
        res := res + ParTransform(NextPart(s,_Next),'html')
      else
      begin
        s0 := NextPart(s,_Next);
        if s0 <> '' then
        res := res + '<pre class="pt">' + TrimRight(s0) + '</pre>'#13#10;
      end;
      isP := not isP;
    end;
    _Preambles[k] := TrimRight(res);
  end;
  result := _Preambles[1];
  for i := 2 to _PreamblesCount do
    result := result + _PreambleStart + _PreamblesNames[i] + _PreambleEnd + _Preambles[i];
//2016.01>
  if result = '<pre class="pt"></pre>' then
    result := '';
//2016.01<
end;

function ExtractCodeFromPreambles(s: string): string;
var isP, isPreamble, isPreambleName: boolean;
    i: integer;
begin
  result := '';
  isP := false;
  isPreamble := false;
  isPreambleName := false;
  for i := 1 to length(s) do
  begin
    if s[i] = _Next then isP := not isP
    else
      if s[i] = _PreambleStart then
        isPreambleName := true
      else
        if s[i] = _PreambleEnd then
        begin
          isPreambleName := false;
          isPreamble := s[i-1] <> _PreambleStart;
        end
        else
          if not isP and not isPreamble and not isPreambleName then
            result := result + s[i];
  end;
end;


function LoadTransform(s: string; num: integer): string;
var i: integer;
    isP: boolean;
    s0: string;
begin
  if num <> 0 then
    s := RemoveHiddenParts(s, _Load, _Text, _Html)
  else
  begin
    s := RemoveAllRegimeMarks(s, _Html, _Text, _Load);
    s := ExtractCodeFromPreambles(s);
  end;
  for i := 1 to ncmds do
  begin
    Formatting(s, _Symb+cmds[i], load[i]);
  end;
//  Showmessage(snum+ '='+ sextnum);
  XFormatting(s); //2017.08
//  s := ToUTF8(s); //2021.11
    result := '';
    isP := false;
    while s <> '' do
    begin
      if isP then
        NextPart(s,_Next)
      else
      begin
        s0 := NextPart(s,_Next);
        if s0 <> '' then
          result := result + s0;
      end;
      isP := not isP;
    end;
  Formatting(result, '%', _NotUsed);
  Formatting(result, '|', '%v');
  Formatting(result, #13#10, '%#');
  Formatting(result, _NotUsed, '%p');
  Formatting(result, _Task, '%f');
  Formatting(result, _Group, '%g%t');  //2015.11
  Formatting(result, _Number, '%n');
//  Formatting(result, _ExtTask, '%a');    //2017.08
//  Formatting(result, _ExtGroup, '%A');   //2017.08
//  Formatting(result, _ExtNumber, '%N');  //2017.08
  result := TrimRight(result);// + #13#10;
end;

//2015.11>
function ExtractLang(s: string): string;
var p: integer;
begin
  result := '';
  s := ExtractFileName(s);
  p := Pos('[', s);
  if p > 0 then
  begin
    delete(s,1,p);
    p := Pos(']', s);
    if p > 0 then
      result := Uppercase(copy(s, 1, p-1));
  end;
//2018.07> Извлечение языка из имени файла, в котором вместо квадратных скобок
//         используются символы подчеркивания!
  if result = '' then
  begin
    p := Pos('_', s);
    if p > 0 then
    begin
      delete(s,1,p);
      p := Pos('_', s);
      if p > 0 then
        result := Uppercase(copy(s, 1, p-1));
    end;
  end;
//2018.07<
end;
//2015.11<

function FindExtFile(pt4dir, workdir, topic, locale, lang: string): string;
var path: array[1..3] of string; //2017.11b  //заменил 2 на 3
    loc: array[1..2] of string;
    lan: array[1..10] of string;
    npath: integer; //2017.11b
    i,j,k,nlan: integer;
    s, lang0: string;
    b: boolean;
function CheckSubGroup(s: string): boolean;
begin
  delete(s, 1, 4);
  if Pos('[', s) > 0 then
    delete(s,Pos('[', s),length(s));
  result := Pos('-',s)>0;
end;
//2018.07>
function LangNew(langold: string): string; // изменяет квадратные скобки на подчеркивание
begin
  result := langold;
  if langold = '' then exit;
  result[1] := '_';
  result[length(result)] := '_';
end;
//2018.07<
begin
//  ShowMessage(pt4dir+#13#10+ workdir+#13#10+  topic+#13#10+  locale+#13#10+  lang);
  result := '';
//  _IsExternalFile := true; //2015.12
  _IsExternalFile := false; //2015.12
  _ExtFileWithSubgroup := false;
//2015.11>
  if (pt4dir = '<filename>') and FileExists(workdir) then
  begin
    s := ExtractLang(workdir);
    b := (Pos(s, Uppercase(lang)) = 1) or (s = '') and SectionExists(workdir, lang); //2015.11a (вместо  s = Uppercase(lang))
    if b then
    begin
      result := workdir;
      if s <> '' then
        globalLang := '[='+s+']'
      else
        globalLang := '';
      _IsExternalFile := Pos('PT4-', Uppercase(ExtractFileName(result)))=1; //2015.12
      _ExtFileWithSubgroup := CheckSubGroup(ExtractFileName(result));
    end;
    exit;
  end;
//2015.11<
  path[1] := AddSlash(workdir);
  path[2] := AddSlash(pt4dir) + 'lib/';
//2017.11b>
  npath := 2;
//UT2>
(*  GetMoveDir(workdir, pt4dir);   
  if movedir <> '' then
  begin
    path[3] := path[2];
    path[2] := AddSlash(movedir);
    npath := 3;
  end;*)
//UT2<
//2017.11b<
  loc[1] := '_'+locale;
  loc[2] := '';
//2015.11>
  nlan := 0;
  lang := Uppercase(lang);
  lang0 := '['+lang+']';
  while lang0 <> '' do
  begin
    nlan := nlan + 1;
    lan[nlan] := lang0;
    NextLang(lang0);
  end;
  nlan := nlan + 1;
  lan[nlan] := '';
//2015.11<
  for i := 1 to npath{2} do  //2017.11b
    for k := 1 to nlan do  //2015.11
      for j := 1 to 2 do
      begin
//2018.07> прежде всего проверяется вариант с подчеркиванием (вместо квадратных скобок!)
        s := path[i]+'PT4'+topic+langnew(lan[k])+loc[j]+'.txt';
        if not FileExists(s) then
//2018.07<
        s := path[i]+'PT4'+topic+lan[k]+loc[j]+'.txt';
        if FileExists(s) then
        begin
          b := (lan[k] <> '') or SectionExists(s, lang);
          if b then
          begin
            result := s;
            if lan[k] <> '' then
              globalLang := Uppercase('[='+lang+']')
            else
              globalLang := '';
            _IsExternalFile := Pos('PT4-', Uppercase(ExtractFileName(result)))=1; //2015.12
            _ExtFileWithSubgroup := CheckSubGroup(ExtractFileName(result));
            exit;
          end;
        end;
      end;
end;

function RemoveSpecSymb(s: string): string;
var i: integer;
begin
  result := '';
  for i := 1 to length(s) do
    if not (Ord(s[i]) in [0..31]) then
      result := result + s[i]
    else
      result := result + '?';
end;

//2016.01text>
function GetCommPrefix(lang: string): string;
begin
  lang := UpperCase(lang);
  delete(lang,length(lang),1);
  if Pos('-', lang) > 0 then
    delete(lang, Pos('-', lang), length(lang));
  if (lang = '[=PASCAL') or (lang = '[=PASCALABC') or (lang = '[=CPP') 
      or (lang = '[=C') //2022.08
      or (lang = '[=CS') or (lang = '[=JAVA') or (lang = '[=FS') then
      result := '// '
  else
    if (lang = '[=PYTHON') or (lang = '[=RUBY') or (lang = '[=JULIA') then
      result := '# '
  else
    if (lang = '[=VB') or (lang = '[=VB.NET') then
      result := ''' '
  else
    result := '';
end;
//2016.01text<


function GetRawText(pt4dir, workdir, topic, locale, lang: string;
  num: integer): string;
var f: text;
    path: string;
    s: string;
    symb: char;
    islang, isnum, ispre, istext, ishtml, isload, isansi, b: boolean;
    numset: TSet1000; //2015.11c
    comm: boolean; //2015.12
//2016.01>
    s0: string;
    numset0: TSet1000;
//2016.01text>
    commprefix: string;    // префикс комментария, добавляется в начало каждой
    frompreamble: boolean; // строки в режиме text, кроме случая, когда установлен номер 0
    s1: string; //2017.08
//2016.01text<
//2016.01<
    commcnt: integer; //2017.08multi
begin
  result := '';
  path := FindExtFile(pt4dir, workdir, topic, locale, lang);
  if path = '' then exit;
  Assign(f, path);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then exit;
  lang := Uppercase('[='+lang+']');
  symb := '%';
  islang := globalLang = lang;
  isnum := false;
  ispre := true;
  istext := true;
  ishtml := true;
  isload := true;
  isansi := true;
  numset := TSet1000.Create; //2015.11c
  comm := false; //2015.12
  utf8mode := false; //2021.11
//2016.01>
  s0 := '';
  numset0 := TSet1000.Create;
  numset0.Add(num);
  macbegin := 0;
  macend := 0;
  commprefix := ''; //2016.01text
  multicomm := 0; //2017.08multi
//2016.01<
//            showmessage('start');


  while (not EOF(f))
    or (macend > 0) //2016.01
  do
  begin
//2016.01>
    if macend > 0 then
    begin
      s := macros[macbegin];
      inc(macbegin);
      if macbegin > macend then macend := 0;
    end
    else
//2016.01<
    readln(f, s);
    s := RemoveSpecSymb(TrimRight(s));
//2015.12>
    if comm then
    begin
      if IsEndCommSwitcher(s) then
        comm := false;
      continue;
    end;
    if IsBeginCommSwitcher(s) then
    begin
      comm := true;
      continue;
    end;
//2015.12<
    if IsPreambleSwitcher(s) then
    begin
      if isLang and isNum and (num = 0) then
      begin
        result := result + _PreambleStart + GetSubgroupName(s) + _PreambleEnd;
      end;
    end
//2016.01>
        else
        if IsNextNumMacroSwitcher(s) then
        begin
          continue;
        end
//2016.01<
//2016.01>
    else
    if IsTaskInfoSwitcher(s) and isLang then
    begin
      if TaskInfoSwitcher(s, numset, s0{_GlobalTaskInfo})
        and (numset.Elem(0) = num)  and (num > 0) then
          if Pos(_UseStdTempl, result) <> 1 then
            result := _UseStdTempl + result;
    end
//2016.01<
    else
    if IsSwitcher(s, b) then
    begin
      s := Uppercase(s);
      if IsSSwitcher(s) then
        symb := s[8]
      else
      begin
        if IsPTextSwitcher(s) then
        begin
          if not istext then
          begin
            istext := true;
            result := result + _Text;
          end;
        end;
        if IsMTextSwitcher(s) then
        begin
          if istext then
          begin
            istext := false;
            result := result + _Text;
          end;
        end;
        if IsPHtmlSwitcher(s) then
        begin
          if not ishtml then
          begin
            ishtml := true;
            result := result + _Html;
          end;
        end;
        if IsMHtmlSwitcher(s) then
        begin
          if ishtml then
          begin
            ishtml := false;
            result := result + _Html;
          end;
        end;
        if IsPLoadSwitcher(s) then
        begin
          if not isload then
          begin
            isload := true;
            result := result + _Load;
          end;
        end;
        if IsMLoadSwitcher(s) then
        begin
          if isload then
          begin
            isload := false;
            result := result + _Load;
          end;
        end;
        if IsPreSwitcher(s) then
        begin
          commprefix := ''; //2016.01text
          if not ispre then
          begin
            ispre := true;
            result := result + _Next;
          end;
        end
        else
        if IsPSwitcher(s) then
        begin
//2016.01text>
          if _IsExternalFile and
            not ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            commprefix := GetCommPrefix(lang);
          end
          else
//2016.01text<
          if ispre then
          begin
            ispre := false;
            result := result + _Next;
          end;
        end
        else
//2021.11>
(*        if IsAnsiSwitcher(s) then
        begin
          if not isansi then
          begin
            isansi := true;
            result := result + _Ansi;
          end;
        end*)
        if IsUTF8Switcher(s) then
        begin
          utf8mode := true;
        end
(*        begin
          if isansi then
          begin
            isansi := false;
            result := result + _Ansi;
          end;
        end
*)
//2021.11<
//2015.11>
        else
        if IsNextNumSwitcher(s) then
        begin
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
          NextNumSwitcher(numset);
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble then
          begin
            if not ispre then
            begin
              ispre := true;
              result := result + _Next;
              commprefix := GetCommPrefix(lang);
            end;
          end;
//2016.01text<
          isnum := numset.Contains(num);
        end
//2015.11<
//2017.08multi>
        else
        if IsMulticommSwitcher(s, commcnt) then
        begin
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
          MulticommSwitcher(numset, commcnt);
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble then
          begin
            if not ispre then
            begin
              ispre := true;
              result := result + _Next;
              commprefix := GetCommPrefix(lang);
            end;
          end;
//2016.01text<
          isnum := numset.Contains(num);
        end
//2017.08multi<
        else
        begin
          if b then
          begin
            if IsLangsSwitcher(s) then
              islang := IsLangSwitcher(lang, s);
            if IsNumsSwitcher(s) then
            begin
              multicomm := 0; //2017.08multi !!!!! сбрасывается режим мультикомментария
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
              AllNumsSwitcher(s, numset); //2015.11c
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble and
            not ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            if not ispre then
            begin
              ispre := true;
              result := result + _Next;
              commprefix := GetCommPrefix(lang);
            end;
          end
          else
// если происходит переход от задания к преамбуле в режиме text
          if _IsExternalFile and not frompreamble and
            ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            if (commprefix <> '') and ispre then
            begin
              ispre := false;
              result := result + _Next;
            end;
            commprefix := '';
          end;
//2016.01text<
              isnum := numset.Contains(num); //(IsNumSwitcher(num, s);  //2015.11c
              if islang and isnum and (num = 0) then
                result := result + _PreambleStart + _PreambleEnd;
            end;
          end;
        end;
      end;
    end
    else
    if isLang and isnum then
    begin
//2016.01>  // Если найден явный вызов task, то другие заготовки не подключаются.
      if TaskInfoFromLine(s, numset0, symb, s0{_GlobalTaskInfo}) then
      begin
//        showmessage(s);
        result := RemoveStdTemplMark(result);
      end;
//2016.01<
      s1 := RawTransform(s, symb); //2017.08
      if (num > 0)
        and (trim(s1) <> '')       //2017.08
      then
      result := result +
        commprefix +  //2016.01text
        s1{RawTransform(s, symb)} + #13#10  //2017.08
      else
      result := result +
//        commprefix +  //2016.01text
        s1{RawTransform(s, symb)} + #13#10; //2017.08
    end;
  end;
  Close(f);
  if num <> 0 then // завершающие пробелы не убираются для заготовки преамбулы [0]
    while Copy(result, length(result)-3, 4) = #13#10#13#10 do
      Delete(result, length(result)-1, 2);
//  showmessage('createdSingle:' + result);
end;


function GetAllRawText(pt4dir, workdir, topic, locale, lang: string;
  num,count: integer): string;
var f: text;
    path: string;
    s: string;
    symb: char;
    islang, isnum, ispre, istext, ishtml, isload, isansi, b: boolean;
    i,k: integer;
    numset: TSet1000;
    comm, fromline: boolean; //2015.12
//2016.01text>
    commprefix: string;    // префикс комментария, добавляется в начало каждой
    frompreamble: boolean; // строки в режиме text, кроме случая, когда установлен номер 0
    s1: string; //2017.08
//2016.01text<
    commcnt: integer; //2017.08multi
begin
  result := '';
(*  //2017.09 перенесено в GetAllRawTextFast
  if (Uppercase(topic) = curTopic) and (Uppercase(locale) = curLocale)
    and (Uppercase(lang) = curLang) then
    begin
      if (num >=0) and (num <= curCount) then
        result := rawData[num];
//      showmessage('found:' + result);

      exit;
    end;
*)
//  showmessage('creating...');
  curTopic := Uppercase(topic);
  curLocale := Uppercase(locale);
  curLang := Uppercase(lang);
  curCount := count;
//2015.11>
(* //2017.08 - закомментировал
   // (перенес в функцию определения количества задач GetMaxTaskNumber)
  _GlobalTopic1 := '';
  _GlobalTopic2 := '';
  _GlobalAuthor := '';
  _GlobalMaxNum := 0;
  _GlobalTaskInfo := '';
*)
//2015.11<
  for i := 0 to curCount do
    rawData[i] := '';
  path := FindExtFile(pt4dir, workdir, topic, locale, lang);
  if path = '' then exit;
  Assign(f, path);
  {$I-}
  Reset(f);
  {$I+}
  if IOResult <> 0 then exit;
  lang := Uppercase('[='+lang+']');
  symb := '%';
  islang := globalLang = lang;
  isnum := false;
  ispre := true;
  istext := true;
  ishtml := true;
  isload := true;
  numset := TSet1000.Create;
  comm := false; //2015.12
//2016.01>
  macbegin := 0;
  macend := 0;
  commprefix := ''; //2016.01text
  multicomm := 0; //2017.08multi
  utf8mode := false; //2021.11

//2016.01<
//          if (topic = 'ExtGroupDemo') then
//            showmessage('startAll');

  while (not EOF(f))
    or (macend > 0) //2016.01
  do
  begin
//2016.01>
    if macend > 0 then
    begin
      s := macros[macbegin];
      inc(macbegin);
      if macbegin > macend then macend := 0;
    end
    else
//2016.01<
    readln(f, s);
    s := RemoveSpecSymb(TrimRight(s));
//2015.12>
    if comm then
    begin
      if IsEndCommSwitcher(s) then
        comm := false;
      continue;
    end;
    if IsBeginCommSwitcher(s) then
    begin
      comm := true;
      continue;
    end;
//2015.12<
    if IsPreambleSwitcher(s) then
    begin
      if isLang and numset.Contains(0) then
        rawData[0] := rawData[0] + _PreambleStart + GetSubgroupName(s) + _PreambleEnd;
    end
//2016.01>
        else
        if IsNextNumMacroSwitcher(s) then
        begin
          continue;
        end
//2016.01<
  //2015.11>
    else
    if IsTaskInfoSwitcher(s) and isLang then
    begin
      TaskInfoSwitcher(s, numset, _GlobalTaskInfo);
    end
  //2015.11<
    else
    if IsSwitcher(s, b) then
    begin
      s := Uppercase(s);

      if IsSSwitcher(s) then
        symb := s[8]
      else
      begin
        if IsPTextSwitcher(s) then
        begin
          if not istext then
          begin
            istext := true;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Text;
          end;
        end;
        if IsMTextSwitcher(s) then
        begin
          if istext then
          begin
            istext := false;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Text;
          end;
        end;
        if IsPHtmlSwitcher(s) then
        begin
          if not ishtml then
          begin
            ishtml := true;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Html;
          end;
        end;
        if IsMHtmlSwitcher(s) then
        begin
          if ishtml then
          begin
            ishtml := false;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Html;
          end;
        end;
        if IsPLoadSwitcher(s) then
        begin
          if not isload then
          begin
            isload := true;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Load;
          end;
        end;
        if IsMLoadSwitcher(s) then
        begin
          if isload then
          begin
            isload := false;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Load;
          end;
        end;
        if IsPreSwitcher(s) then
        begin
          commprefix := ''; //2016.01text
          if not ispre then
          begin
            ispre := true;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Next;
          end;
        end
        else
        if IsPSwitcher(s) then
        begin
//2016.01text>
          if _IsExternalFile and
            not ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            commprefix := GetCommPrefix(lang);
//            showmessage(s + #13#10+rawdata[1]+#13#10+ commprefix);

          end
          else
//2016.01text<
         if ispre then
          begin
            ispre := false;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Next;
          end;
        end
        else
//2021.11>
(*        if IsAnsiSwitcher(s) then
        begin
         if not isansi then
          begin
            isansi := true;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Ansi;
          end;
        end
        else*)
        if IsUTF8Switcher(s) then
          utf8mode := true
(*        begin
         if isansi then
          begin
            isansi := false;
            for i := 0 to curCount do
              rawData[i] := rawData[i] + _Ansi;
          end;
        end*)
//2021.11<
//2015.11>
        else
        if IsNextNumSwitcher(s) then
        begin
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
          NextNumSwitcher(numset);
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble then
          begin
            if not ispre then
            begin
              ispre := true;
              for i := 0 to curCount do
                rawData[i] := rawData[i] + _Next;
              commprefix := GetCommPrefix(lang);
//              showmessage(rawdata[1]+#13#10+ commprefix);
            end;
          end;
//2016.01text<
          if numset.Max > _GlobalMaxNum then
            _GlobalMaxNum := numset.Max;
        end
//2015.11<
//2017.08multi>
        else
        if IsMulticommSwitcher(s, commcnt) then
        begin
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
          MulticommSwitcher(numset, commcnt);
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble then
          begin
            if not ispre then
            begin
              ispre := true;
              result := result + _Next;
              commprefix := GetCommPrefix(lang);
            end;
          end;
//2016.01text<
          isnum := numset.Contains(num);
        end
//2017.08multi<
        else
        begin
          if b then
          begin
            if IsLangsSwitcher(s) then
              islang := IsLangSwitcher(lang, s);
            if IsNumsSwitcher(s) then
            begin
              multicomm := 0; //2017.08 !!!!! сбрасывается режим мультикомментария
//2016.01text>
          if _IsExternalFile then
          begin
            frompreamble := (numset.Count = 1) and (numset.Contains(0));
          end;
//2016.01text<
              AllNumsSwitcher(s, numset);
//2016.01text>  если происходит переход от преамбулы к заданию в режиме text
          if _IsExternalFile and frompreamble and
            not ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            if not ispre then
            begin
              ispre := true;
              for i := 0 to curCount do
                rawData[i] := rawData[i] + _Next;
              commprefix := GetCommPrefix(lang);
            end;
          end
          else
// если происходит переход от задания к преамбуле в режиме text
          if _IsExternalFile and not frompreamble and
            ((numset.Count = 1) and (numset.Contains(0))) then
          begin
            if (commprefix <> '') and ispre then
            begin
              ispre := false;
              for i := 0 to curCount do
                rawData[i] := rawData[i] + _Next;
            end;
            commprefix := '';
          end;
//2016.01text<
//2015.11>
              if numset.Max > _GlobalMaxNum then
                _GlobalMaxNum := numset.Max;
//2015.11<
              if isLang and numset.Contains(0) then
                rawData[0] := rawData[0] + _PreambleStart + _PreambleEnd;
            end;
          end;
        end;
      end;
    end
    else
    begin
//2015.11>
    if numset.Count = 0 then
    begin
      if (_GlobalTopic1 = '') and (Uppercase(copy(s,1,7)) = 'TOPIC1=') then
        _GlobalTopic1 := Trim(Copy(s, 8, length(s)))
      else
      if (_GlobalTopic2 = '') and (Uppercase(copy(s,1,7)) = 'TOPIC2=') then
        _GlobalTopic2 := Trim(Copy(s, 8, length(s)))
      else
      if (_GlobalAuthor = '') and (Uppercase(copy(s,1,7)) = 'AUTHOR=') then
        _GlobalAuthor := Trim(Copy(s, 8, length(s)))
    end
    else
//2015.11<
    if isLang then
    begin
      fromline := TaskInfoFromLine(s, numset, #18, _GlobalTaskInfo); //2015.11 // выделение процедуры task из заготовки
      // указание "фиктивного" префикса #18 предотвращает обработку случая когда процедура task содержит параметр %{task}
      for i := 0 to numset.Count-1 do
      begin
        k := numset.Elem(i);
        s1 := RawTransform(s, symb); //2017.08
        if (k > 0)
          and (trim(s1) <> '')        //2017.08
        then
        RawData[k] := RawData[k] +
          commprefix +  //2016.01text
          s1{RawTransform(s, symb)} + #13#10  //2017.08
        else
        RawData[k] := RawData[k] +
//          commprefix +  //2016.01text
          s1{RawTransform(s, symb)} + #13#10; //2017.08
      end;
    end;
    end;
  end;
  Close(f);
  for k := 0 to curCount do
  begin
    while Copy(RawData[k], length(RawData[k])-3, 4) = #13#10#13#10 do
      Delete(RawData[k], length(RawData[k])-1, 2);
//    if (k > 0) and (RawData[k] = #13#10) then
//      RawData[k] := '';
  end;
  if (num >=0) and (num <= curCount) then
    result := rawData[num];
//2015.11>
  if _GlobalTaskInfo <> '' then
    _GlobalTaskInfo := _GlobalTaskInfo + '|';
//  if _GlobalTaskInfo <> '' then
//    showmessage(topic + ': '+_GlobalTaskInfo);
//2015.11<
//    showmessage(commprefix + #13#10 + RawData[1]+ #13#10+RawData[2]+ #13#10+RawData[3]+ #13#10+RawData[4]+ #13#10);
end;



//2017.09>
function GetAllRawTextFast(pt4dir, workdir, topic, locale, lang: string;
  num,count: integer): string;
begin
  result := '';
  if (Uppercase(topic) = curTopic) and (Uppercase(locale) = curLocale)
    and (Uppercase(lang) = curLang) then
    begin
      if (num >=0) and (num <= curCount) then
        result := rawData[num];
      exit;
    end;
end;
//2017.09<




//2015.11>
function FromGlobalTaskInfo(num: integer; var topic, snum: string): boolean;
var p: integer;
    s0, s: string;
begin
  result := false;
  if _GlobalTaskInfo = '' then exit;
  Str(num, s0);
  p := Pos('|'+s0+' ', _GlobalTaskInfo);
  if p = 0 then exit;
  s := Copy(_GlobalTaskInfo, p + length(s0)+2, length(_GlobalTaskInfo));
  p := Pos(' ',s);
  topic := Copy(s,1,p-1);
  if topic = '' then exit;
  delete(s, 1, p);
  p := Pos('|',s);
  snum := Copy(s,1,p-1);
  p := Pos('#', topic);
  if p > 0 then
    delete(topic, p, length(topic));
  result := true;
end;
//2015.11<

//2016.01>
function StartsFromStdTemplMark(s: string): boolean;
begin
  result := Pos(_UseStdTempl, s) = 1;
end;

function RemoveStdTemplMark(s: string): string;
begin
  if StartsFromStdTemplMark(s) then
    delete(s,1,length(_UseStdTempl));
  result := s;
end;
//2016.01<


function GetPlainText(pt4dir, workdir, topic, locale, lang: string; num, count: integer;
  var utf8: boolean): string; //2021.11
var s: string;
//2015.11>
    s1,s2,s3: string;
//2015.11<
begin
//2017.09>
  if count = -1 then
  begin
    GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang, s1, s2, s3);
    s := GetRawText(pt4dir, workdir, topic, locale, lang, num);
  end
  else
  begin
    s := GetAllRawTextFast(pt4dir, workdir, topic, locale, lang, num, count);
    if s = '' then
    begin
      GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang, s1, s2, s3);
      s := GetAllRawText(pt4dir, workdir, topic, locale, lang, num, count);
    end;
  end;
//2017.09<
  xgroup := PureGroup(topic);    //2017.08
  plain[19] := xgroup;           //2017.08
  xnum := IntToStr(num);         //2017.08
//2015.11>
  if FromGlobalTaskInfo(num, s1, s2) then
  begin
  plain[1] := s1+s2;
  plain[2] := s1;
  plain[3] := s2;
  end
  else
  begin
//2015.11<
  plain[1] := topic + IntToStr(num);
  plain[2] := topic;
  plain[3] := IntToStr(num);
  end; //2015.11
//2021.11>
  if not utf8mode then
  begin
  plain[4] := #149; //mark
  plain[14] := #160; //~
  plain[15] := #171; //<<
  plain[16] := #187; //>>
  plain[17] := #151; //---
  plain[18] := #150; //--
  end
  else
  begin
  plain[4] := chr($E2)+chr($80)+chr($A2); //mark
  plain[14] := chr($C2)+chr($A0); //~
  plain[15] := chr($C2)+chr($AB); //<<
  plain[16] := chr($C2)+chr($BB); //>>
  plain[17] := chr($E2)+chr($80)+chr($94); //---
  plain[18] := chr($E2)+chr($80)+chr($93); //--
  end;
//2021.11<
  result := {RemoveStdTemplMark}(PlainTransform(s)); //2016.01
  utf8 := utf8mode; //2021.11
//  if result <>'' then
end;

function GetHtmlText(pt4dir, workdir, topic, locale, lang: string; num, count: integer;
  var utf8: boolean): string; //2021.11
var s: string;
//2015.11>
    s1,s2,s3: string;
//2015.11<
begin
//2017.09>
    s := GetAllRawTextFast(pt4dir, workdir, topic, locale, lang, num, count);
    if s = '' then
    begin
      GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang, s1, s2, s3);
      s := GetAllRawText(pt4dir, workdir, topic, locale, lang, num, count);
    end;
//2017.09<
  xgroup := PureGroup(topic);    //2017.08
  html[19] := xgroup;             //2017.08
  xnum := IntToStr(num);         //2017.08
//2015.11>
  if FromGlobalTaskInfo(num, s1, s2) then
  begin
  html[1] := s1+s2;
  html[2] := s1;
  html[3] := s2;
  end
  else
  begin
//2015.11<
  html[1] := topic + IntToStr(num);
  html[2] := topic;
  html[3] := IntToStr(num);
  end;
  if num > 0 then
    htmlpar := '<p class="ptTaskContinue">'
  else
    htmlpar := '<p class="ptComment">';
  result := {RemoveStdTemplMark}(HtmlTransform(s, num)); //2016.01
  utf8 := utf8mode; //2021.11
//  if (result <>'') and (num = 0) then
//    showmessage(result);
end;

function GetLoadText(pt4dir, workdir, topic, locale, lang: string; num: integer;
  var utf8: boolean): string; //2021.11
var s, s1, s2, s3: string;
begin
//2017.09>
  GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang, s1, s2, s3);
//2017.09<
  s := GetRawText(pt4dir, workdir, topic, locale, lang, num);
  xgroup := PureGroup(topic);    //2017.08
  load[19] := xgroup;            //2017.08
  xnum := IntToStr(num);         //2017.08
  load[1] := _Task;
  load[2] := _Group;
  load[3] := _Number;
  result := LoadTransform(s, num);
  utf8 := utf8mode; //2021.11
//  showmessage('Raw:'+result);
//  if StartsFromStdTemplMark(result) then
//    showmessage('USpecExt: Templ');
//  showmessage('"'+result + '"');
end;

{
function ProcessTaskInfo(s: string): string;
function NextTask: string;
var p: integer;
begin
  p := Pos('|', s);
  if p = 0 then
  begin
    result := Trim(s);
    s := '';
  end
  else
  begin
    result := Trim(Copy(s,1,p-1));
    delete(s, 1, p);
  end;
end;
function ProcessTask(s: string): string;
var p, k, c: integer;
    s0, s1, s2: string;
begin
  result := '';
  s0 := '';
  while (s <> '') and (s[1] in ['0'..'9']) do
  begin
    s0 := s0 + s[1];
    delete(s,1,1);
  end;
  if s0 = '' then exit;
  s2 := '';
  while (s <> '') and (s[length(s)] in ['0'..'9']) do
  begin
    s2 := s[length(s)] + s2;
    delete(s,length(s),1);
  end;
  if s2 = '' then exit;
  s1 := trim(s);
  if s1 = '' then exit;
  result := s0 + ' ' + s1 + ' ' + s2 + '|';
end;
begin
  result := '|';
  while s <> '' do
    result := result + ProcessTask(NextTask);
end;
}

function GetMaxTaskNumber(pt4dir, workdir, topic, locale, lang: string;
  var comment, author, {loadinfo,} taskinfo: string): integer;
var i: integer;
    s, s0, t1, t2: string;
function ProtectVert(s: string): string;
begin
  while (s <> '') and (s[length(s)] = '.') do
  begin
    delete(s, length(s), 1);
    s := trim(s);
  end;
  Formatting(s, '%', _NotUsed);
  Formatting(s, '|', '%v');
  Formatting(s, _NotUsed, '%p');
  result := s;
end;
function DeleteDot(s: string): string;
begin
  while (s <> '') and (s[length(s)] = '.') do
  begin
    delete(s, length(s), 1);
    s := trim(s);
  end;
  result := s;
end;
begin
//2017.08>
  _GlobalTopic1 := '';
  _GlobalTopic2 := '';
  _GlobalAuthor := '';
  _GlobalMaxNum := 0;
  _GlobalTaskInfo := '';
//2017.08<
  s := GetAllRawText(pt4dir, workdir, topic, locale, lang, 0, 999);
//  result := 0;
  s0 := '|';
  t1 := ProtectVert(_GlobalTopic1);
  t2 := ProtectVert(_GlobalTopic2);
  if not _ExtFileWithSubgroup and (t1 <> '') and (t2 <> '') then s0 := '.|';
  comment := t1 + s0 + t2;
  author := DeleteDot(_GlobalAuthor);
//  loadinfo := _GlobalLoadInfo;
  taskinfo := '';
  if _GlobalTaskInfo <> '' then
    taskinfo := _GlobalTaskInfo;
  result := _GlobalMaxNum;
//  SHowmessage('Glob='+IntTOStr(result));
{
  for i := 999 downto 1 do
    if rawData[i] <> '' then
    begin
      result := i;
      exit;
    end;
}
end;

end.
