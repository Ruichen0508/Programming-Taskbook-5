unit PT4Html;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface
var
  _CSSFile_: string = '';
  _SaveFile_: string = '';
  _TextOptions_: integer;
//V5>
  procedure HtmlInit(lang: integer; loc, sys: string);
  function NormalText(s0: string): string;
//V5<

procedure ProcessHtmlText(s: string);
//procedure ProcessHtmlTextEmpty; //2021.07  //V5

implementation
 {$IFDEF MSWINDOWS}
uses SysUtils,
     {LCLIntf, {LCLType, LMessages, Dialogs, PT4Make, Pt4Consts, UPictureForm,} Windows, ansiutf8, PTAnsiUpperCase //2015.03G //2020.06
     //, xPlatform
     , ucommon, upreamble, Process; //2023.03
     {$ENDIF}
{$IFDEF LINUX}
uses SysUtils,
     {LCLIntf, {LCLType, LMessages, Dialogs, PT4Make, Pt4Consts, UPictureForm,} ansiutf8, PTAnsiUpperCase //2015.03G //2020.06
     //, xPlatform
     Unix, BaseUnix, ucommon, upreamble, Process; //2023.03
{$ENDIF}
const maxTasks = 10000; maxSubTask = 10000; maxDeltaRef = 10000;
      offsetforC = 10;
      optPT = 6;
      optNT = 7;
      optNH = 8;
      optP = 1;
      optRquote = 2;
      optRcenter = 3;
      optLquote = 4;
      optLcenter = 5;
      optH = 128;
      optH_ = 190;
      DemoMarkChar = '&#176;';
      FName = 'PT5Tasks';  //V5
      DemoMark = #176;
//2015.03>
//      ExternalDataMark1 = #20; //2021.11 закомментировал - метки берутся из PT4Make
//      ExternalDataMark2 = #21;           
//2015.03<
const
//01.2009>
  GroupCommentMark = '@@@@@@@@@@';
//01.2009<

  optComplete = 0;
  optNoGroupTitle = 1;
  optNoSubgroupTitle = 2;
  optNoTitles = 3;
  optNoAuthor = 4;
  optNoComments = 8;
  optNoFooter = 16;
  optTasktextOnly = 511;

type TData = record
        Group, GAuthor, Topic, TAuthor, TaskName, TaskText: string;
        DeltaRef: integer;
     end;

var
//V5>
    CurrentLanguage: integer = lgCPP;
    CurrentLocale: string = 'en';
    SysDir: string = '';
    SPTAuthor1: string = '';
    SPTAuthor2: string = 'Editor';
    SPTPageGenerationDate: string = 'Page generation date: ';
//V5<

    opt: array[#0..#255] of string;
    ParOffset: integer = 0;
    CurrentNum: integer;
    CurrentDeltaRef: integer = 0;
    GroupName: string;
    d: array[0..1000] of TData;
    n: integer;
{p,i,j,j1,j2,j0,k,n,num,m1 : integer;
    m : longint;
    T,T0,TH : text;
    BMP1,BMP2 : file of char;
    DName,s,s0,s01,s1,s2,s20,s30,sc,s4,sparam,sp1, sadd:string;
    s3 : array[1..10000] of string;
    TaskProc,DemoMark,TaskAddInfo: array[1..maxTasks] of string;
    TaskText,TaskHint: array[1..maxTasks,1..10] of string;
    TaskCount,TaskSub,TaskAddref: array [1..maxTasks] of integer;
    n1,n2,n3,n4 : array[1..maxTasks] of integer;
    n5: array[1..maxTasks] of string;
    c : char;
    ii : array [1..255] of integer;
    CurrentNum,CurrentDeltaref: integer;
    ParOffset: integer;
    ver : integer;
    GroupName,NameTopic: string;
    TMName : string;
    TMHfile : string;
    MakeHint: boolean;
    ListCount: integer;
    ListOfTopics: array[1..3,1..500] of string;
    nopause: Boolean;
    NDemoTasks: integer;
    DemoTasks: array[1..maxTasks] of string;
}
    TableAlignCenter: string = ''; //2012.09
    s_ext: string;  //2015.03
    comment_ext: string = ''; //2015.03

//V5>
  procedure HtmlInit(lang: integer; loc, sys: string);
  begin
    CurrentLanguage := lang;
    CurrentLocale := loc;
    SysDir := sys + PathDelim ;  // с разделителем на конце!!
    if CurrentLocale = 'ru' then
    begin
      SPTAuthor1 := 'Автор: ';
      SPTAuthor2 := 'Составитель: ';
      SPTPageGenerationDate := 'Дата генерации страницы: ';
    end
    else
    begin
      SPTAuthor1 := '';
      SPTAuthor2 := 'Editor: ';
      SPTPageGenerationDate := 'Page generation date: ';
    end;
  end;

  function GetExistingPictureName(picname: string): string;
  var p: integer;
  begin
    p := Pos('\', picname);
    if p > 0 then
      picname[p] := PathDelim;
    result := SysDir + picname;
        
  end;

  function GetHtmlComment(Group, Subgroup: string; level: integer): string;
  begin
    Subgroup := AnsiUppercase(Subgroup);
    result := GetHtmlPreamble(Group, Subgroup);
//    writeln(Group, '----', Subgroup, '===', result);
  end;


//V5<


procedure replace(var s: string; s1,s2: string);
var i: integer;
begin
i:=pos(s1,s);
while i <> 0 do
begin
  delete(s,i,length(s1));
  insert(s2,s,i);
  i:=pos(s1,s);
end;
end;

procedure readlnT(var t, s: string);
var p: integer;
begin
s := '';
p := Pos(#13#10, t);
if p = 0 then exit;
s := Copy(t, 1, p-1);
Delete(t, 1, p+1);
end;


procedure InitTMHData;
var T0: string;
    s,s1,s2: string;
    c: char;
    i: integer;
begin
T0 :=
'% ---------------------------------------------------------------------------'#13#10+
'% Файл настроек для генератора HTML-документов PTHMake (вариант по умолчанию)'#13#10+
'% ---------------------------------------------------------------------------'#13#10+
'? |||'#13#10+
'                          % информация о данном TMH-файле'#13#10+
''#13#10+
'V |5.1||                 % версия задачника PT и режим вывода указаний:'#13#10+
'                          %  <пусто> - указания помещаются в общем тексте'#13#10+
'                          %      (режим по умолчанию),'#13#10+
'                          %  <буква> - указания помещаются в конце документа;'#13#10+
'                          %  данная буква добавляется к имени документа'#13#10+
''#13#10+
'W |Programming Taskbook|Copyright (c) M. Abramyan, 1998-2023|'#13#10+
'                          % имя задачника и копирайт'#13#10+
''#13#10+
'U |</head><body>|</body></html>|'#13#10+
'                          % "имена" файлов с начальным и завершающим текстом'#13#10+
'                          %   (в кавычках) или сам текст (без кавычек)'#13#10+
''#13#10+
'< |&#171;|&#187;|         % открывающие и закрывающие кавычки'#13#10+ //2012.05
''#13#10+
'~ |&nbsp;| |         % обычный неразрывный (~)'#13#10+
'                          %    и HTML-неразрывный (\ ) пробел'#13#10+
''#13#10+
'; |&nbsp;|&nbsp;|         % средний (\;) и малый (\,) неразрывный пробел'#13#10+
''#13#10+
''#13#10+
'* |&#183;||               % символ умножения'#13#10+
'+ |&#177;||               % символ "плюс-минус"'#13#10+
'o |&#176;||               % символ градуса'#13#10+
''#13#10+
''#13#10+
'X |||                     % Символы из шрифта "Symbol":'#13#10+
'x |||                     %  "bullet" (X), косой крест (x),'#13#10+
'a |||                     %  греческие буквы "альфа" (a), "эпсилон" (e),'#13#10+
'e |||                     %  "пи" (p), символы "меньше или равно" (l),'#13#10+
'p |||                     %  "больше или равно" (g), "не равно" (n).'#13#10+
'l |||                     % Если не переопределены, то используются'#13#10+
'g |||                     %  соответствующие символы из шрифта "Symbol"'#13#10+
'n |||                     %  с установками вида'#13#10+
'                          %  <font face="Symbol">символ</font>'#13#10+
''#13#10+
'f |||                     % Символы False и True'#13#10+
't |||'#13#10+
'N |||                     % Символ nil  (для Win32)'#13#10+
'O |||                     % Символ null (для .NET)'#13#10+
''#13#10+
'R |(|)<sup>1/2</sup>|'#13#10+
'                          % символ квадратного корня'#13#10+
''#13#10+
'Q | &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;|'#13#10+
'                          % двойной большой (\Q) и большой (\q) пробел'#13#10+
''#13#10+
''#13#10+
'TT |<span class="ptSpecial">nnnn</span>. |<span class="ptSpecial">nnnn</span>*. |'#13#10+ //03.2009
'                           % установки для имени задания в формулировке'#13#10+
'                           % задания (без ссылки на указание и со ссылкой).'#13#10+
'                           % Вместо nnnn подставляется имя задания'#13#10+
''#13#10+
''#13#10+
'PT |<p class="ptTask">|</p>|  % новый абзац-задание'#13#10+
''#13#10+
'PA |<p class="ptTaskContinue">|</p>|  % новый внутри задания'#13#10+
''#13#10+
'PC |<p class="ptComment">|</p>|  % новый абзац-комментарий'#13#10+
''#13#10+
'[T |<p class="ptTaskCenter">|</p>|'#13#10+
'                          % установки для выделения с центрированием'#13#10+
'                          % в тексте задания/указания'#13#10+
'(T |<p class="ptTaskQuote">|</p>|'#13#10+
'                          % установки для выделения с отступом'#13#10+
'                          % в тексте задания/указания'#13#10+
''#13#10+
']T |<p class="ptTaskContinue">|</p>|'#13#10+
'                          % продолжение абзаца в тексте задания/указания'#13#10+
'                          % после режима выделения с центрированием'#13#10+
''#13#10+
')T |<p class="ptTaskContinue">|</p>|'#13#10+
'                          % продолжение абзаца в тексте задания/указания'#13#10+
'                          % после режима выделения с отступом'#13#10+
''#13#10+
'[C |<p class="ptCommentCenter">|</p>|   % установки для выделения с центрированием'#13#10+
'                          % в комментарии'#13#10+
''#13#10+
'(C |<p class="ptCommentQuote">|</p>|'#13#10+
'                          % установки для выделения с отступом'#13#10+
'                          % в комментарии'#13#10+
''#13#10+
']C |<p class="ptCommentContinue">|</p>|'#13#10+
'                          % продолжение абзаца в комментарии после'#13#10+
'                          % режима выделения с центрированием'#13#10+
''#13#10+
')C |<p class="ptCommentContinue">|</p>|'#13#10+
'                          % продолжение абзаца в комментарии после'#13#10+
'                          % режима выделения с отступом'#13#10+
''#13#10+
//'H1 |<h1>|</h1>|           % заголовок первого уровня (всего документа)'#13#10+
//'H2 |<h2>|</h2>|           % заголовок второго уровня (подразделов документа)'#13#10+
//'H3 |<h3>|</h3>|           % заголовок третьего уровня'#13#10+
//''#13#10+

'B |<b>|</b>|              % установки для полужирного начертания'#13#10+
'I |<i>|</i>|              % установки для курсивного начертания'#13#10+
'M |<tt>|</tt>|            % установки для моноширинного начертания'#13#10+
'{ |<i>|</i>|              % установки для выделения переменной'#13#10+
''#13#10+
'S |<span class="ptSpecial">|</span>|'#13#10+
'                          % установки для специального выделения'#13#10+
''#13#10+
'^ |<sup>|</sup>|'#13#10+
'                          % установки для верхнего индекса'#13#10+
'_ |<sub>|</sub>|'#13#10+
'                          % установки для нижнего индекса'#13#10+
''#13#10+
'J |<table>|</table>|      % установки для режима табуляции'#13#10;

opt['&'] := '&amp;';
opt['-'] := '&#8722;'; //03.2009
opt[':'] := '&#8211;';
opt['='] := '&#8212;';
opt['.'] := '&#8230;';
opt['|'] := '<br>';
while T0 <> '' do
begin
readlnT(T0, s);
s := Trim(s);
if (s='')or(s[1]='%') then continue;
if Pos('%',s)<>0 then
  s := Trim(Copy(s,1,Pos('%',s)-1));
i := 2;
while (length(s)>=i) and (s[i]<>' ') do inc(i);
s1 := Trim(Copy(s,i,200));
if length(s1)<3 then continue;
c := s1[1];
Delete(s1,1,1);
Delete(s1,length(s1),1);
if Pos(c,s1)=0 then continue;
s2 := Copy(s1,Pos(c,s1)+1,200);
s1 := Copy(s1,1,Pos(c,s1)-1);
c := s[1];
case c of
'?','*','+','o','x','a','p','e','l','f','g','n','t','N','O','X': // одиночные символы (переопределение)
  begin
  opt[c] := s1;
  end;
'B','U','I','J','M','Q','R','S','V','W','^','_': // смещение равно 32
  begin
    opt[c] := s1;
    Inc(c,32);
    opt[c] := s2;
  end;
'<','{': // смещение равно 2
  begin
    opt[c] := s1;
    Inc(c,2);
    opt[c] := s2;
  end;
'~':  // особое смещение
  begin
    opt['#'] := s1;
    opt[' '] := s2;
  end;
';':  // особое смещение
  begin
    opt[';'] := s1;
    opt[','] := s2;
  end;
'H':
  case s[2] of
  '0'..'9': begin
              opt[chr(optH+ord(s[2])-ord('0'))] := s1;
              opt[chr(optH_+ord(s[2])-ord('0'))] := s2;
            end;
  'A'..'Z': begin
              opt[chr(optH+10+ord(s[2])-ord('A'))] := s1;
              opt[chr(optH_+10+ord(s[2])-ord('A'))] := s2;
            end;
  'a'..'z': begin
              opt[chr(optH+36+ord(s[2])-ord('a'))] := s1;
              opt[chr(optH_+36+ord(s[2])-ord('a'))] := s2;
            end;
   else continue;
   end;
'P':
  case s[2] of
  'T': begin
         opt[chr(optPT)] := s1;
         opt[chr(optPT+16)] := s2;
       end;
  'A': begin
         opt[chr(optP)] := s1;
         opt[chr(optP+16)] := s2;
       end;
  'C': begin
         opt[chr(optP+offsetForC)] := s1;
         opt[chr(optP+offsetForC+16)] := s2;
       end;
   else continue;
   end;
'T':
  case s[2] of
  'T': begin
         replace(s1,'nnnn','%0:s');
         opt[chr(optNT)] := s1;
         replace(s2,'nnnn','%0:s');
         opt[chr(optNT+16)] := s2;
       end;
  'H': begin
         replace(s1,'nnnn','%0:s');
         opt[chr(optNH)] := s1;
         replace(s2,'nnnn','%0:s');
         opt[chr(optNH+16)] := s2;
       end;
   else continue;
   end;
']':
  case s[2] of
  'T': begin
         opt[chr(optRcenter)] := s1;
         opt[chr(optRcenter+16)] := s2;
       end;
  'C': begin
         opt[chr(optRcenter+offsetForC)] := s1;
         opt[chr(optRcenter+offsetForC+16)] := s2;
       end;
   else continue;
   end;
'[':
  case s[2] of
  'T': begin
         opt[chr(optLcenter)] := s1;
         opt[chr(optLcenter+16)] := s2;
       end;
  'C': begin
         opt[chr(optLcenter+offsetForC)] := s1;
         opt[chr(optLcenter+offsetForC+16)] := s2;
       end;
   else continue;
   end;
')':
  case s[2] of
  'T': begin
         opt[chr(optRquote)] := s1;
         opt[chr(optRquote+16)] := s2;
       end;
  'C': begin
         opt[chr(optRquote+offsetForC)] := s1;
         opt[chr(optRquote+offsetForC+16)] := s2;
       end;
   else continue;
   end;
'(':
  case s[2] of
  'T': begin
         opt[chr(optLquote)] := s1;
         opt[chr(optLquote+16)] := s2;
       end;
  'C': begin
         opt[chr(optLquote+offsetForC)] := s1;
         opt[chr(optLquote+offsetForC+16)] := s2;
       end;
   else continue;
   end;
end;
end;
  if CurrentLocale = 'en' then
  begin
    opt['<'] := '&#34;';
    opt['>'] := '&#34;';
  end;
end;


function parseString(ccomm,start,fin: string): string;
var c,ntask: string;
    i,j,n,nn,jj: integer;
    tabs: array[1..10] of char;
    CurTabs,Ntabs: integer;
    ffIndex: string;
    Parfinal,ss: string;
    picName: string; //2015.03G
begin
c := ccomm;
ccomm := start;
ffIndex := '';
Parfinal := fin;
CurTabs := 0;
NTabs := 0;
i := 1;
while i <= Length(c) do
begin
case c[i] of
'<': begin
     ccomm := ccomm+'&lt;';
     i := i + 1;
     end;
'>': begin
     ccomm := ccomm+'&gt;';
     i := i + 1;
     end;
'\': begin // режим управляющих последовательностей
     if i+1 > Length(c) then i := i + 1 // если достигнут конец строки,
                                        // то пропустить символ
     else
       case c[i+1] of
            // режим управляющих последовательностей
       '\','{','}','~','^','_':
         begin
           ccomm := ccomm + c[i+1]; // добавление в текст указанного символа
           i := i + 2; // пропустить два символа: \ и указанный символ
         end;
       '.','&','=',':','-','<','>','*','+',';',' ','q','Q','o',',','|',
       'B','I','S','M','J','R',
       'b','i','s','m','j','r':
         begin
           ccomm := ccomm + opt[c[i+1]];
           i := i + 2; // пропустить два символа: \ и указанный символ
           case c[i-1] of
           'J':
             // дополнительные действия при входе в режим выравнивания столбцов
             begin
//2012.09>
             Insert(TableAlignCenter, ccomm, Length(ccomm)); 
             // если текущим является режим центрирования, то к тегу TABLE 
             // добавляется атрибут выравнивания (если этого не сделать, 
             // то в Firefox выравнивание таблицы не выполняется)
//2012.09<
             Ntabs := 0;
             CurTabs := 0;
             while (Length(c) >= i) and (c[i] <> '&') do
               begin
               inc(Ntabs);          // запомнить режимы выравнивания
               tabs[Ntabs] := c[i]; // позиций табуляции
               i := i + 1; // пропустить все символы,
                           // управляющие выравниванием столбцов
               end;
             end;
           'q','Q','|':
             begin
               // пропустить все следующие
               // за данным символом пробелы
               while (i<=length(c)) and (c[i]=' ') do i := i + 1;
             end;
           end;
           end;
      '[','(':
           begin
             case c[i+1] of
//2012.09>
             '[': 
                  begin
                    j := optLcenter;
                    TableAlignCenter := ' align="center"';
                  end;
//2012.09<
             '(': j := optLquote;
             end;
             ccomm := ccomm + Parfinal+opt[chr(j+ParOffset)];
             ParFinal := opt[chr(j+ParOffset+16)];
             i := i + 2; // пропустить два символа: \ и указанный символ
               // пропустить все следующие
               // за данным символом обычные пробелы
              while (i<=length(c)) and (c[i]=' ') do i := i + 1;
            end;
      ']',')','P':
           begin
             case c[i+1] of
//2012.09>
             ']': 
                  begin
                    j := optRcenter;
                    TableAlignCenter := '';
                  end;
//2012.09<
             ')': j := optRquote;
             'P': j := optP; //03.2009
             end;
             ccomm := ccomm + Parfinal;
             i := i + 2; // пропустить два символа: \ и указанный символ
             // пропустить все следующие
             // за данным символом обычные пробелы
             while (i<=length(c)) and (c[i]=' ') do i := i + 1;
             if i>=length(c) then begin ParFinal := ''; continue; end;
             ccomm := ccomm + opt[chr(j+ParOffset)];
             ParFinal := opt[chr(j+ParOffset+16)]
             end;
{       'P':
          begin
             ccomm := ccomm + opt[chr(optP+offsetForC+16)] +
                      opt[chr(optP+offsetForC)];
             i := i + 2; // пропустить два символа: \ и указанный символ
             // пропустить все следующие
             // за данным символом обычные пробелы
             while (i<=length(c)) and (c[i]=' ') do i := i + 1;
             if i>=length(c) then begin continue; end;
          end;}
       'U','u':  //03.2009
       begin
         if c[i+1]='U' then j := optH
         else j := optH_;
         i := i + 3;
         case c[i-1] of
           '0'..'9': j := j + ord(c[i-1])-ord('0');
           'A'..'Z': j := j + 10 + ord(c[i-1])-ord('A');
           'a'..'z': j := j + 36 + ord(c[i-1])-ord('a');
           else continue;
         end;
         ccomm := ccomm + opt[chr(j)];
       end;
       'a','e','l','f','g','n','p','t','x','N','O','X','d','E':  //2024.04 - добавил E - Sigma
         begin
           if opt[c[i+1]]<>'' then ccomm := ccomm + opt[c[i+1]]
           else
           case c[i+1] of // добавление в текст специального символа из шрифта "Symbol"
           'a': ccomm := ccomm + '&#945;';
           'e': ccomm := ccomm + '&#949;';
           'E': ccomm := ccomm + '&#931;';  //2024.04
           'f': if CurrentLanguage and (lgCS or lgCPP or lgC) = 0 then
                  ccomm := ccomm + 'False'
                else
                  ccomm := ccomm + 'false';
           'g': ccomm := ccomm + '&#8805;';
           'l': ccomm := ccomm + '&#8804;';
           'n': ccomm := ccomm + '&#8800;';
           'p': ccomm := ccomm + '&#960;';
           't': if CurrentLanguage and (lgCS or lgCPP or lgC) = 0 then //2023
                  ccomm := ccomm + 'True'
                else
                  ccomm := ccomm + 'true';
           'x': ccomm := ccomm + '&#215;';
           'X': ccomm := ccomm + '&#8226;';
           'N': if CurrentLanguage and (lgCPP or lgC) = 0 then //2023
                  ccomm := ccomm + 'nil'
                else
                  ccomm := ccomm + 'NULL';
           'O': if CurrentLanguage and lgCS <> 0 then
                  ccomm := ccomm + 'null'
                else
                if CurrentLanguage and lgVBNET <> 0 then
                  ccomm := ccomm + 'Nothing'
                else
                if CurrentLanguage and lgPython <> 0 then
                  ccomm := ccomm + 'None'
                else
                if CurrentLanguage and lgJava <> 0 then
                  ccomm := ccomm + 'null'
                else
                  ccomm := ccomm + 'nil';
//2012.12a>
           'd': if CurrentLanguage and (lgPython or lgJava) <> 0 then
                  ccomm := ccomm + 'dispose'
                else
                  ccomm := ccomm + 'Dispose';
//2012.12a<
           end;
           i := i + 2; // пропустить два символа: \ и указанный символ
         end;
       '0'..'9': // ссылка на другое задание данной группы
         begin
           nTask := c[i+1];
           i := i + 2; // пропустить два символа: \ и цифру
           while (Length(c) >= i) and (c[i] in ['0'..'9']) do
           begin
             nTask := nTask + c[i];
             i := i + 1; // пропустить все цифры, определяющие смещение номера задания
           end;
           if nTask[1] = '0' then nTask[1] := '-'; // смещение "вперед"
           Val(nTask,n,j);
           if j = 0 then // если смещение является допустимым
           begin
             n := CurrentNum-CurrentDeltaRef-n;
             if (n>0) and (n<1000) then
             nTask := GroupName+IntTOStr(n)
             else
             nTask := '*********';
           end
           else
             nTask := '*********';
           ccomm := ccomm + nTask; // добавление ссылки
         end;
       //03.2009>
       'h','H': // символ из обычного шрифта и шрифта "Symbol" в 16-ричной кодировке
         begin
           ss := Copy(c,i+2,2);
//V5>
(*           nn := HexToDec(ss);
//           if (nn < 32) or (nn > 255) or (nn = 127) or (nn = 173) or
//             (c[i+1]='H') and (nn in [32,33,35,37,38,40..63,91,93,95,96,123..160,240,255]) or
//             (c[i+1]='h') and (nn in [32..129,141,143,144,157,160]) then
//             nn := 63;
           if c[i+1]='h' then
           ccomm := ccomm + '&#'+IntToStr(CheckEuro(nn))+';'
           else
           begin
             nn := CheckSymbol(nn);
             if nn > 0 then
               ccomm := ccomm + '&#'+IntToStr(nn)+';'
             else
               ccomm := ccomm + '<font face="Symbol">&#'+IntToStr(-nn)+';</font>';
           end;*)
//V5<
           ccomm := ccomm + '??';
           i := i + 4;
         end;
       //03.2009<
//2015.03G>
       'G': // picture loading
         begin
           i := i + 2;
           picname := '';
           if (Length(c) >= i) and (c[i] = '<') then
           begin
             i := i + 1;
             while (Length(c) >= i) and (c[i] <> '>') do
             begin
               picname := picname + c[i];
               i := i + 1;
             end;
             i := i + 1;
           end;
           picname := {UPictureForm.}GetExistingPictureName(picname);
           ccomm := ccomm + Parfinal
             + '<p class="ptPicture"><img src="file:///'+picname+'" alt="'+picname+'" border=1></p>';
           if i>=length(c) then begin ParFinal := ''; continue; end;
           ccomm := ccomm + opt[chr(optP+ParOffset)];
           ParFinal := opt[chr(optP+ParOffset+16)]
         end;
//2015.03G<
       else // все прочие управляющие последовательности вида \символ игнорируются
         begin
         i := i + 2;
         end;
       end;
     end;
'~': begin
     ccomm := ccomm + opt['#'];
     i := i + 1;
     end;
'_':
     begin
     if i+1 > Length(c) then i := i + 1 // если достигнут конец строки,
                                        // то пропустить символ
     else
       if ffIndex <> '' then // если уже находимся в каком-либо режиме индексов,
                            // то пропустить один или два символа
         if c[i+1] = '{' then
           i := i + 2
         else
           i := i + 1
       else
       begin
         ccomm := ccomm + opt['_']; ffIndex := opt[#127];
         if c[i+1] = '{' then // начало режима многосимвольного индекса
         begin
           if opt['_'] = '' then
           begin
           ccomm := ccomm + '[';
           ffIndex := ']';
           end;
           i := i + 2; // пропустить два символа: _ (или ^) и скобку,
                       // оставаясь в режиме индексов
         end
         else // режим односимвольного индекса
         begin
           if c[i+1] in ['A'..'Z','a'..'z'] then
             ccomm := ccomm + opt['{']+c[i+1]+opt['}']+ffIndex
           else ccomm := ccomm + c[i+1]+ffIndex;
               // добавление в текст односимвольного индекса,
               // возможно, с его выделением как переменной (если это латинская буква)
           ffIndex := ''; // немедленное отключение режима индекса
           i := i + 2; // пропустить два символа: _ (или ^) и односимвольный индекс
         end;
       end;
     end;
'^':
     begin
     if i+1 > Length(c) then i := i + 1 // если достигнут конец строки,
                                        // то пропустить символ
     else
       if ffIndex <> '' then // если уже находимся в каком-либо режиме индексов,
                            // то пропустить один или два символа
         if c[i+1] = '{' then
           i := i + 2
         else
           i := i + 1
       else
       begin
         ccomm := ccomm + opt['^']; ffIndex := opt[#126];
         if c[i+1] = '{' then // начало режима многосимвольного индекса
         begin
           if opt[#126] = '' then
           begin
           ccomm := ccomm + '{';
           ffIndex := '}';
           end;
           i := i + 2; // пропустить два символа: _ (или ^) и скобку,
                       // оставаясь в режиме индексов
         end
         else // режим односимвольного индекса
         begin
           if c[i+1] in ['A'..'Z','a'..'z'] then
             ccomm := ccomm + opt['{']+c[i+1]+opt['}']+ffIndex
           else ccomm := ccomm + c[i+1]+ffIndex;
               // добавление в текст односимвольного индекса,
               // возможно, с его выделением как переменной (если это латинская буква)
           ffIndex := ''; // немедленное отключение режима индекса
           i := i + 2; // пропустить два символа: _ (или ^) и односимвольный индекс
         end;
       end;
     end;
'}':
     begin
     if ffIndex <> '' then
       // если находимся в режиме многосимвольного индекса, то отключаем этот режим
     begin
       ccomm := ccomm + ffIndex;
       ffIndex := '';
     end
     else
     begin
       // иначе отключаем режим выделения переменной
       ccomm := ccomm + opt['}'];
     end;
     i := i + 1; //пропустить символ
     end;
'{':      // начало режима выделения переменной
     begin
     ccomm := ccomm + opt['{'];
     i := i + 1; //пропустить данный символ
     end;
'&':      // новая позиция табуляции
     begin
     i := i + 1; //пропустить данный символ и все следующие за ним пробелы
     while (i<=length(c)) and (c[i]=' ') do i := i + 1;
     if NTabs=0 then continue; // если не находимся в режиме табуляции,
                               // то игнорируем данный символ
     inc(CurTabs);
     if CurTabs>NTabs then CurTabs := 1;
     if CurTabs=1 then ccomm := ccomm + '<tr>';
     case Tabs[CurTabs] of
     'c': ccomm := ccomm + '<td align=center>';
     'l': ccomm := ccomm + '<td align=left>';
     'r': ccomm := ccomm + '<td align=right>';
     else ccomm := ccomm + '<td>';
     end;
     end;
else
     begin
     if (ffIndex<>'') and (c[i] in ['A'..'Z','a'..'z']) then
     // если находимся в режиме многосимвольного индекса и выводим латинскую букву,
     // то выделяем ее как переменную
       ccomm := ccomm + opt['{']+c[i]+opt['}']
     else
       ccomm := ccomm + c[i];
     i := i + 1;
     end;
end;
end;
Result := ccomm + ParFinal;
//2015.03>
i := Pos(ExternalDataMark1, result);
while i > 0 do
begin
  j := Pos(ExternalDataMark1, s_ext);
  Delete(result,i,length(ExternalDataMark1));
  Insert(Copy(s_ext,1,j-1), result, i+4);
  Delete(s_ext, 1, j+length(ExternalDataMark1)-1);
  i := Pos(ExternalDataMark1, result);
end;
//2015.03<
end;

function NormalText(s0: string): string;
var s,s1: string;
    i: integer;
    up: boolean;
begin
  up := true;
  result := s0;
  for i := 1 to length(s0) do
    if AnsiUppercase(s0[i]) <> s0[i] then
    begin
      up := false;
      break;
    end;
  if not up then exit;
  s := AnsiLowerCase(s0);
  up := true;
  for i := 1 to length(s) do
    case s[i] of
    '.': Up := true;
    ' ': continue;
    else
      if Up then
      begin
        s1 := AnsiUpperCase(s[i]);
        Delete(s,i,1);
        insert(s1,s,i);
        Up := false;
      end;
    end;
  result := s;
end;

function ProcessSpaces(s: string): string;
var i, n: integer;
begin
  n := 0;
  result := '';
  for i := 1 to length(s) do
    if s[i] <> ' ' then
    begin
      n := n + 1;
      result := result + s[i];
    end
    else
      begin
        if n <= 3 then
          result := result + '&nbsp;'
        else
          result := result + ' ';
        n := 0;
      end;
//2012.05> //преобразование -- в среднее тире, а --- в длинное тире
   n := Pos('---',result);
   while n <> 0 do
   begin
     Delete(result,n,3);
     Insert('&#8212;',result,n);
     n := Pos('---',result);
   end; 
   n := Pos('--',result);
   while n <> 0 do
   begin
     Delete(result,n,2);
     Insert('&#8211;',result,n);
     n := Pos('--',result);
   end; 
//2012.05<
end;

procedure SplitTask(t: string; var Topic: string; var Num: integer);
var s: string;
    i,c: integer;
begin
  Num := 0;
  Topic := '';
  s := '';
  if copy(t,length(t),1)=DemoMark then
    Delete(t,length(t),1);

//2016.01>
  if copy(t,length(t),1)=')' then
  begin
    Delete(t, 1, Pos(' (',t)+1);
    Delete(t, length(t), 1);
  end;
//2016.01<

  for i := length(t) downto 1 do
    if t[i] in ['0'..'9'] then
      s := t[i]+s
    else
    begin
      Val(s,Num,c);
      Topic := Copy(t,1,i);
      exit;
    end;
end;

//2016.01>
function GetExtTopic(t: string): string;
var i: integer;
begin
  Result := '';
  if copy(t,length(t),1)=DemoMark then
    Delete(t,length(t),1);

  if copy(t,length(t),1)=')' then
    Delete(t, Pos(' (',t), length(t));

  for i := length(t) downto 1 do
    if not (t[i] in ['0'..'9']) then
    begin
      result := Copy(t,1,i);
      exit;
    end;
end;
//2016.01<



function CompareAuthor(s1,s2: string): boolean;
begin
s1 := Copy(s1,1,Pos(',',s1)-1);
s2 := Copy(s2,1,Pos(',',s2)-1);
result := Uppercase(s1) = Uppercase(s2);
end;

//2014.02>
(*function GroupFromName(s: string): string;
var i: integer;
begin
  result := '';
  for i := 1 to length(s) do
    if s[i] in ['0'..'9'] then break
    else
      result := result + s[i];
end;*)
//2014.02<

procedure InitData(t: string);
var s: string;
    status: string;
    nstatus, p, n0, c: integer;
begin
n := 0;
nstatus := 0;
with d[0] do
begin
  Group := '';
  GAuthor := '';
  Topic := '';
  TAuthor := '';
  TaskName := '';
  TaskText := '';
end;
while t <> '' do
begin
  n := n + 1;
  readlnT(t, s);
  d[n].Group := s;
  if (d[n].Group <> d[n-1].Group) then
  begin
    if nstatus > 0 then
      d[nstatus].GAuthor := status + d[nstatus].GAuthor;
    nstatus := n;
    status := SPTAuthor1;
  end;
  readlnT(t, s);
  d[n].GAuthor := ProcessSpaces(s);
  readlnT(t, s);
//  SHowMessage(PT4AnsiToUTF8(s));
  d[n].Topic := NormalText(s);
//  SHowMessage(PT4AnsiToUTF8(d[n].Topic));
  readlnT(t, s);
  d[n].TAuthor := ProcessSpaces(s);
  if d[n].TAuthor = '' then
      d[n].TAuthor := d[n].GAuthor;
  if not CompareAuthor(d[n].TAuthor, d[n].GAuthor) then
    status := SPTAuthor2;
  d[n].DeltaRef := 0;
  readlnT(t, s);
  p := Pos('#',s);
  if p <> 0 then
  begin
    Val(Copy(s,p+1,255),n0,c);
    if c = 0 then d[n].DeltaRef := n0;
    Delete(s,p,255);
  end;
  d[n].TaskName := s;
  readlnT(t, d[n].TaskText);
end;
    if nstatus > 0 then
      d[nstatus].GAuthor := status + d[nstatus].GAuthor;
end;


procedure AddCSSFile(var T: TextFile; css: string);
var s: string;
    T1: TextFile;
begin
if not FileExists(css) then
  css := ChangeFileExt(css,'.css');
if not FileExists(css) then
  css := FName + '.css';     // 03.2009
if not FileExists(css) then  // 03.2009
//V5>
//  css := GetPABCDir + PT4AddDir + '\'+ FName + '.css'; //!xPlatform!
  css := SysDir + FName + '.css'; 
//V5<
if not FileExists(css) then exit;
AssignFile(T1, css);
{$I-}
Reset(T1);
{$I+}
if IOResult <> 0 then exit;
writeln(T, '<style type="text/css">');
while not EOF(T1) do
begin
  readln(T1,s);
  if IOResult <> 0 then break;
  writeln(T,s);
end;
{$I+}
writeln(T, '</style>');
CloseFile(T1);
end;


function GetAppName(Doc: string): string;
var
  FN, DN, RES: array[0..255] of char;
begin
  StrPCopy(FN, DOC);
  DN[0] := #0;
  RES[0] := #0;
  FindExecutable(FN, DN, RES);
  Result := StrPas(RES);
end;

//2021.11>
procedure WritelnUTF(var T: TextFile; s: string);
begin
  writeln(T, PT4AnsiToUtf8(s));
end;
//2021.11<

procedure ProcessHtmlText(s: string);
var T: Textfile;
    cmt, dir, name: string;
    i: integer;
//2015.03>
    p: integer;
//2015.03<
//2016.01>
    ExtGroupName: string;
//2016.01<
    proc: TProcess; // V5
begin
  InitTMHData;
//2015.03>
  s_ext := '';
  p := Pos(ExternalDataMark2, s);
  if p > 0 then
  begin
    s_ext := Copy(s, p+length(ExternalDataMark2), length(s));
    Delete(s, p, length(s));
  end;
//2015.03<
  InitData(s);
  if _SaveFile_ = '' then
  begin
    dir := GetCurrentDir + '\'; //2021.11
    name := FName + '.html';
  end
  else
  begin
    dir := ExtractFileDir(_SaveFile_);
    name := ChangeFileExt(ExtractFileName(_SaveFile_), '.html');;
  end;
  AssignFile(T, dir + name);
  {$I-}
  Rewrite(T);
  if IOResult <> 0 then
  begin
//V5>
//    MessageDlg(Format(SPTBCannotCreateFile,[dir+name]),mtError,[mbOK],0);
    writeln('HTML ERROR: cannot create file ' + dir + name);
//V5<
    exit;
  end;
  {$I+}
  writeln(T,'<!-- '+opt['W']+' '+opt['V']+' | '+opt['w']+' -->');
  writeln(T,'<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">'); //2021.11 utf-8  (вместо windows-1251)
  write(T,'<title>'+FName {opt['W']+' '+opt['V']}); //2009.01
  writeln(T,'</title>');

//  writeln(T,'<link rel="StyleSheet" href="PT4Tasks.css">');

  AddCSSFile(T, _CSSFile_);

  writeln(T,'</head><body>');
  for i := 1 to n do
    with d[i] do
    begin
      SplitTask(TaskName, GroupName, CurrentNum);
      ExtGroupName := GetExtTopic(TaskName); //2016.01
//      SHowmessage(PT4AnsiToUtf8(group));
      if Group <> d[i-1].Group then
      begin
        if _TextOptions_ and optNoGroupTitle = 0 then
//          writeln(T,parseString('\H1'+ProcessSpaces(Group)+'\h1','',''));
            writelnUTF(T,'<h1>'+{PT4AnsiToUtf8}(ProcessSpaces(Group))+'</h1>'); //03.2009 //2021.11
        if _TextOptions_ and optNoAuthor = 0 then
//          writeln(T,parseString(GAuthor,opt[chr(optP)],opt[chr(optP+16)]));
//2014.10>
            if (GAuthor <> SPTAuthor1) and (GAuthor <> SPTAuthor2) then
//2014.10<
            writelnUTF(T,'<p class="ptAuthor">'+{PT4AnsiToUtf8}(GAuthor)+'</p>'); //03.2009 //2021.11
        if _TextOptions_ and optNoComments = 0 then
        begin
//01.2009>
        cmt := GetHtmlComment(ExtGroupName,GroupCommentMark,0); //вместо ''  //2015.03 добавил ,0 //2016.01 добавил Ext
//01.2009<
        if cmt <> '' then
        begin
        //2015.03>
            p := Pos(ExternalDataMark1, cmt);
            if p > 0 then
            begin
              comment_ext := Copy(cmt, p+length(ExternalDataMark1), length(cmt));
              Delete(cmt,p,length(cmt));
            end;
        //2015.03<
            ParOffset := OffsetForC;
            writelnUTF(T,parseString(cmt,opt[chr(optP+offsetForC)],opt[chr(optP+offsetForC+16)]));  //2021.11 //базовый комментарий
            ParOffset := 0;
        //2015.03>
            if comment_ext <> '' then
            begin
              writelnUTF(T, comment_ext); //2021.11 //дополнительный комментарий для групп
              comment_ext := '';
            end;
        //2015.03<
        end;
        end;
      end;
      if (AnsiUppercase(Topic) <> AnsiUppercase(d[i-1].Topic)) and
         (AnsiUppercase(Topic) <> AnsiUppercase(Group)) then
      begin
        if _TextOptions_ and optNoSubgroupTitle = 0 then
        begin
            writelnUTF(T,'<h2>'+{PT4AnsiToUtf8}(ProcessSpaces(Topic))+'</h2>'); //03.2009 //2021.11
        end;
        if _TextOptions_ and optNoComments = 0 then
        begin
          cmt := GetHtmlComment(ExtGroupName,Topic,0); //2015.03 добавил ,2 //2015.06 заменил 2 на 0 //2016.01 добавил Ext
          if cmt <> '' then
          begin
        //2015.03>
            p := Pos(ExternalDataMark1, cmt);
            if p > 0 then
            begin
              comment_ext := Copy(cmt, p+length(ExternalDataMark1), length(cmt));
              Delete(cmt,p,length(cmt));
            end;
        //2015.03<
              ParOffset := OffsetForC;
              writelnUTF(T,parseString(cmt,opt[chr(optP+offsetForC)],opt[chr(optP+offsetForC+16)])); //2021.11 //дополнительный комментарий для подгрупп
              ParOffset := 0;
        //2015.03>
            if comment_ext <> '' then
            begin
              writelnUTF(T, comment_ext); //2021.11 //дополнительный комментарий для подгрупп
              comment_ext := '';
            end;
        //2015.03<
          end;
        end;
      end;
      CurrentDeltaRef := DeltaRef;
      writelnUTF(T,(parseString(TaskText,
        opt[chr(optPT)]+format(opt[chr(optNT)],[TaskName]),opt[chr(optPT+16)]))); //2021.11 // текст заданий и указаний
    end;
  if _TextOptions_ and optNoFooter = 0 then
  begin
  writeln(T,'<hr noshade>');
  writelnUTF(T,'<p class="ptFooter">'+{PT4AnsiToUtf8}(SPTPageGenerationDate+DateToStr(Date))+'.</p>'); //2021.11
  end;
  writeln(T,'</body></html>');
  Close(T);
//2015.06>
//2021.11>
//  if not HTMLSpecialProcessing then
//    OpenDocument(PChar(dir+name)) //2020.06        //V5
//  else
  proc := TProcess.Create(nil);
  proc.Executable := GetAppName(name);
  proc.Parameters.Add(dir + name);
//  proc.CurrentDirectory := cwd;
  proc.Execute;
  proc.Free;             

//    WinExec(PChar('"' + GetAppName(name)+'" "'+ dir + name+ '"'),SW_SHOWMAXIMIZED); //2021.11
//2021.11<
//2015.06<

end;

//2021.07>
(*
procedure ProcessHtmlTextEmpty;
var dir, name: string;
begin
  if _SaveFile_ = '' then
  begin
    dir := GetCurrentDir + '\'; //2021.11
    name := FName + '.html';
  end
  else
  begin
    dir := ExtractFileDir(_SaveFile_);
    name := ChangeFileExt(ExtractFileName(_SaveFile_), '.html');;
  end;
  if not FileExists(dir + name) then
    exit;
//2021.11>
//  if not HTMLSpecialProcessing then
//    OpenDocument(PChar(dir + name)) //2020.06  //V5
//  else
    WinExec(PChar('"' + GetAppName(name)+'" "'+ dir + name+ '"'),SW_SHOWMAXIMIZED); //2021.11
//2021.11<
//2015.06<
end;
*)
//2021.07<

begin
end.
