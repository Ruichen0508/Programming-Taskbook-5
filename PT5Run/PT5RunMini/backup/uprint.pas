unit UPrint;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface

const
 upHeader = 0;
 upTaskText = 1;
 upMiniTaskText = 2;
 upIOData = 3;
 upMiniIOData = 4;
 upShow = 5;
 upEndLine = 6;
 upShowRank = 7;
 upShowEndLine = 8;
 upAddInfo = 9;
 upMiniAddInfo = 10;
 upStartLine = 11;
 upMaxInd = 11;

procedure UTF8ConsoleInit;

procedure PrintCmt(var s: string; s0: string; x: integer; var sa: string; ca: char);
procedure PrintCmtAttr(var s: string; s0: string; x: integer; var sa: string; a0: string); // a0 - complete attrubute string
procedure PrintN(var s: string; n: integer; x, w: integer; check: boolean; var sa: string; ca: char);
procedure PrintR(var s: string; r: real; x, w, p: integer; check: boolean; var sa: string; ca: char);
procedure PrintB(var s: string; b: integer; x: integer; var sa: string; ca: char);
procedure PrintC(var s: string; c: char; x: integer; var sa: string; ca: char);
procedure PrintS(var s: string; s1: string; x, w: integer; var sa: string; ca: char);
procedure writelnToSection(ind: integer; s, sa: string);
procedure upInit;
procedure upFinalize;
procedure upSetColorMode(colorMode: integer);
procedure upPrintSection(ind: integer);
function upEmptySection(ind: integer): boolean;
function testShowRank(rank: integer): boolean;  // rank = -1 - all items
procedure makeShowRank(rank: integer);
procedure upSetBorder(newValue: boolean);
procedure upStartPrint;

implementation
 uses Classes, SysUtils,
 {$IFDEF WINDOWS}
 Windows,
 {$ENDIF}
  UCommon, ansiutf8;//, UComments;

(*
A - spec style (\S - \s)
B - bold (\B - \b)
C - usual comment and task text
D - data attr
E - error and non-recognized symbol "?" (red)
F - filedata
G - gray data/filedata)
H - section headers
I - indices (for upper index we use ^)
J - spec symbol 
K - ordinal italic (\I - \i)
L - special italic ({ - })
M - mono style (\M - \m)
N - no arrtibute (reset)

0 - Demo
1 - Solved
2 - Wrong
3 - Not enough
4 - Too many
5 - Wrong type
6 - All are input, no output
7 - Not enough (reverted - for section header)
8 - Too many (reverted - for section header)
9 - Wrong type (reverted - for section header)

U - ќ—ќЅџ… ј“–»Ѕ”“, который означает, что текст ”∆≈ переведен в кодировку UTF-8
      и при его выводе не требуетс€ устанавливать дополнительные атрибуты
      (используетс€ дл€ вывода отладочной и дополнительной информации);
      строка с этим атрибутом состоит из ≈ƒ»Ќ—“¬≈ЌЌќ√ќ символа.
      Ётот атрибут анализируетс€ только в функции upPrintSection
*)

const
  ttRESET = #27+'[0m';
  ttBLINK = #27+'[5m';
  ttREVERSE = #27+'[7m';
  ttHIDDEN = #27+'[8m';

  ttBOLD = #27+'[1m';
  ttBOLDoff = #27+'[22m';
  ttITALIC = #27+'[3m';
  ttITALICoff = #27+'[23m';
  ttUNDER = #27+'[4m';
  ttUNDERoff = #27+'[24m';


// Text colors
 ttBLACK = #27+'[38;2;0;0;0m';
 ttGRAY = #27+'[38;2;128;128;128m';
 ttRED = #27+'[31m';
 ttGREEN = #27+'[32m';
 ttYELLOW = #27+'[38;2;255;255;0m';
 ttBLUE = #27+'[38;2;0;15;248m';
 ttMAGENTA = #27+'[35m';
 ttCYAN = #27+'[36m';
 ttWHITE = #27+'[38;2;255;255;255m';
 ttBRIGHT_RED = #27+'[91m';
 ttBRIGHT_GREEN = #27+'[92m';
 ttBRIGHT_YELLOW = #27+'[93m';
 ttBRIGHT_BLUE = #27+'[94m';
 ttBRIGHT_MAGENTA = #27+'[95m';
 ttBRIGHT_CYAN = #27+'[96m';
 ttBRIGHT_WHITE = #27+'[97m';
 ttBRIGHT_GRAY = #27+'[38;2;128;128;128m';

// Background colors
 ttBG_BLACK = #27+'[48;2;0;0;0m';
 ttBG_RED = #27+'[48;2;255;0;0m';
 ttBG_GREEN = #27+'[48;2;0;128;0m';
 ttBG_YELLOW = #27+'[48;2;255;112;0m';
 ttBG_BLUE = #27+'[48;2;0;0;128m';
 ttBG_MAGENTA = #27+'[45m';
 ttBG_CYAN = #27+'[46m';
 ttBG_WHITE = #27+'[47m';
 ttBG_GRAY = #27+'[100m';
 ttBG_BRIGHT_RED = #27+'[48;2;255;64;128m';
 ttBG_BRIGHT_GREEN = #27+'[102m';
 ttBG_BRIGHT_YELLOW = #27+'[103m';
 ttBG_BRIGHT_BLUE = #27+'[104m';
 ttBG_BRIGHT_MAGENTA = #27+'[48;2;255;0;255m';
 ttBG_BRIGHT_CYAN = #27+'[106m';
 ttBG_BRIGHT_WHITE = #27+'[48;2;255;255;255m';
  


var
  FTrueMark: string = 'true ';
  FFalseMark: string = 'false';
  FStringQMark: char = '"';
  FCharQMark: char = '''';

  satt: array ['0'..'N'] of string;
  upBorder: boolean = false;
  upBorderLevel: integer = 0;   // определ€ет вид "уголков": 0 - верхние, 1- средние, 2 - нижние
  cmode: integer = 0;
  upData: array[0..upMaxInd] of TStringList;
  upAData: array[0..upMaxInd] of TStringList;

procedure upSetBorder(newValue: boolean);
begin
  upBorder := newValue;
end;

procedure upStartPrint;
begin
  upBorderLevel := 0;
end;

procedure upSetColorMode(colorMode: integer);  // 0 - nocolors, 1 - white, 2 - black, -1 - no output
var c: char;
    i: integer;
    bold: string;
begin
  cmode := 0;  // no colors
  if colorMode = 1 then  // white
  begin
    cmode := 1;
    satt['N'] := ttRESET;
    for c := '0' to 'M' do
      satt[c] := ttBlack + ttbg_White;
//    satt['B'] := '';
    bold := ttBlack + #27+'[48;2;190;190;190m';
    satt['0'] := ttWhite + #27+'[48;2;0;0;255m';  //Navy
    satt['1'] := ttWhite + #27+'[48;2;0;128;0m';   //Green
    satt['2'] := ttWhite + #27+'[48;2;255;0;0m';    //Red
    satt['3'] := ttWhite + #27+'[48;2;255;112;0m';  //Orange
    satt['4'] := ttWhite + #27+'[48;2;255;64;128m'; //Purple
    satt['5'] := ttWhite + #27+'[48;2;255;0;255m';  //Fuchcia
    satt['6'] := ttWhite + #27+'[48;2;0;153;255m';  //LightNavy
    satt['7'] := #27+'[38;2;255;112;0m' + ttbg_White;
    satt['8'] := #27+'[38;2;255;64;128m' + ttbg_White;
    satt['9'] := #27+'[38;2;255;0;255m' + ttbg_White;
    satt['C'] := #27+'[38;2;70;70;70m' + ttbg_White;
    satt['A'] := bold;
    satt['B'] := bold;
    satt['I'] := #27+'[38;2;70;70;70m' + #27+'[48;2;160;160;160m';
    satt['J'] := satt['C'];
    satt['K'] := bold;
    satt['L'] := satt['C'];
    satt['M'] := bold;
    satt['D'] := #27+'[38;2;0;0;255m' + ttbg_White; // $ff0000;  !!
    satt['E'] := ttRed + ttbg_White;
    satt['F'] := #27+'[38;2;0;102;102m' + ttbg_White; // $666600;  !!
    satt['G'] := #27+'[38;2;140;140;140m' + ttbg_White;   // $606060;
    satt['H'] := ttBlack + ttbg_White;
  end
  else if colorMode = 2 then  // black
  begin
    cmode := 2;
    satt['N'] := ttRESET;
    for c := '0' to 'M' do
      satt[c] := ttWhite + ttbg_Black;
//    satt['B'] := '';
    bold := ttWhite + ttbg_Black;
    satt['0'] := ttWhite + #27+'[48;2;0;0;255m';  //Navy
    satt['1'] := ttWhite + #27+'[48;2;0;128;0m';   //Green
    satt['2'] := ttWhite + #27+'[48;2;255;0;0m';    //Red
    satt['3'] := ttWhite + #27+'[48;2;255;112;0m';  //Orange
    satt['4'] := ttWhite + #27+'[48;2;255;64;128m'; //Purple
    satt['5'] := ttWhite + #27+'[48;2;255;0;255m';  //Fuchcia
    satt['6'] := ttWhite + #27+'[48;2;0;153;255m';  //LightNavy
    satt['7'] := #27+'[38;2;255;112;0m' + ttbg_Black;
    satt['8'] := #27+'[38;2;255;64;128m' + ttbg_Black;
    satt['9'] := #27+'[38;2;255;0;255m' + ttbg_Black;
    satt['C'] := #27+'[38;2;192;192;192m' + ttbg_Black;  //$C0C0C0;  !!
    satt['A'] := bold;
    satt['B'] := bold;
    satt['I'] := #27+'[38;2;192;192;192m' + #27+'[48;2;100;100;100m';
    satt['J'] := satt['C'];
    satt['K'] := bold;
    satt['L'] := satt['C'];
    satt['M'] := bold;
    satt['D'] := #27+'[38;2;255;255;0m' + ttbg_Black;  //$00ffff; yellow  !!
    satt['E'] := ttRed + ttbg_Black;
    satt['F'] := #27+'[38;2;0;255;255m' + ttbg_Black;  //$ffff00;  !!
    satt['G'] := #27+'[38;2;144;144;144m' + ttbg_Black;  //$909090;
    satt['H'] := ttWhite + ttbg_Black;
  end
  else if colorMode = -1 then  // no output
    cmode := -1;
end;


{procedure UTF8ConsoleInit;
begin
  SetConsoleOutputCP(CP_UTF8);
  SetTextCodePage(Output, CP_UTF8);
  SetMultiByteConversionCodePage(CP_UTF8);
end;    }

procedure upInit;
var i: integer;
begin
  for i := 0 to upMaxInd do
    upData[i] := TStringList.Create;
  for i := 0 to upMaxInd do
    upAData[i] := TStringList.Create;
end;

procedure upFinalize;
var i: integer;
begin
  for i := 0 to upMaxInd do
    upData[i].Free;
  for i := 0 to upMaxInd do
    upAData[i].Free;
end;

procedure PrintCmt(var s: string; s0: string; x: integer; var sa: string; ca: char);
var i: integer;
begin
  for i := 1 to Length(s0) do
  begin
    s[x + i - 1] := s0[i];
    sa[x + i - 1] := ca;
  end;
end;

procedure PrintCmtAttr(var s: string; s0: string; x: integer; var sa: string; a0: string); // a0 - complete attrubute string
var i: integer;
begin
  for i := 1 to Length(s0) do
  begin
    s[x + i - 1] := s0[i];
    sa[x + i - 1] := a0[i];
  end;
end;

procedure PrintN(var s: string; n: integer; x, w: integer; check: boolean; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  Str(n:w, s0);
  for i := 1 to w do
    sa[x + i - 1] := ca;
  if length(s0) > w then
    if check then
    begin
      delete(s0, w+1, length(s0));
      s0[w] := '*';
      sa[x + w - 1] := 'E';
    end
    else
      for i := w + 1 to length(s0) do
        sa[x + i - 1] := ca;
  for i := 1 to Length(s0) do
    s[x + i - 1] := s0[i];
end;

procedure PrintR(var s: string; r: real; x, w, p: integer; check: boolean; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  s0 := RealToStr(r, w, p);
  for i := 1 to w do
    sa[x + i - 1] := ca;
  if length(s0) > w then
    if check then
    begin
      delete(s0, w+1, length(s0));
      if (p > 0) or (w = 1) then
      begin
        s0[w] := '*';
        sa[x + w - 1] := 'E';
      end
      else
      begin
        s0[w-1] := '*';  // for exponential format we show **
        s0[w] := '*';
        sa[x + w - 2] := 'E';
        sa[x + w - 1] := 'E';
      end;
    end
    else
      for i := w + 1 to length(s0) do
        sa[x + i - 1] := ca;
  for i := 1 to Length(s0) do
    s[x + i - 1] := s0[i];
end;

procedure PrintB(var s: string; b: integer; x: integer; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  if b = 1 then
    s0 := FTrueMark
  else
    s0 := FFalseMark;
  for i := 1 to Length(s0) do
  begin
    s[x + i - 1] := s0[i];
    sa[x + i - 1] := ca;
  end;
end;

procedure PrintC(var s: string; c: char; x: integer; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  s0 := FCharQMark + c + FCharQMark;
  sa[x] := 'C';
  sa[x + 1] := ca;
  sa[x + 2] := 'C';
  for i := 1 to Length(s0) do
    s[x + i - 1] := s0[i];
end;

procedure PrintS(var s: string; s1: string; x, w: integer; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  s0 := FStringQMark + s1 + FStringQMark;
  sa[x] := 'C';
  sa[x + w - 1] := 'C';
  for i := 2 to w - 1 do
    sa[x + i - 1] := ca;
  if length(s0) > w then
  begin
    delete(s0, w + 1, length(s0));
    s0[w] := '*';
    sa[x + w - 1] := 'E';
  end;
  if length(s0) < w then
    for i := length(s0) to w do
      sa[x + i - 1] := 'C';
  for i := 1 to Length(s0) do
    s[x + i - 1] := s0[i];
end;

procedure writelnToSection(ind: integer; s, sa: string);
begin
  if (ind < 0) or (ind > upMaxInd) then
  begin
    writeln('ERROR: writelnToSection: index out of range');
    exit;
  end;
  upData[ind].Add(s);
  upAData[ind].Add(sa);
end;

function testShowRank(rank: integer): boolean;  // rank = -1 - all items
var i, res: integer;
    s: string;
begin
  res := 0;
  if rank = -1 then
    res := upData[upShow].Count
  else
  begin
    s := IntToStr(rank) + '|';
    if rank < 10 then 
      s := ' ' + s;
    for i := 1 to upData[upShow].Count - 1 do
      if Pos(s, upData[upShow][i]) = 1 then
        Inc(res);
  end;
  result := res > 0;
end;


procedure makeShowRank(rank: integer);
var i: integer;
    s: string;
begin
  upData[upShowRank].Clear;
  upAData[upShowRank].Clear;
  if rank = -1 then
    for i := 0 to upData[upShow].Count - 1 do
    begin
     upData[upShowRank].Add(upData[upShow][i]);
     upAData[upShowRank].Add(upAData[upShow][i]);
    end
  else
  begin
    s := IntToStr(rank) + '|';
    if rank < 10 then 
      s := ' ' + s;
    upData[upShowRank].Add(upData[upShow][0]);
    upAData[upShowRank].Add(upAData[upShow][0]);
    for i := 1 to upData[upShow].Count - 1 do
    begin
      if Pos(s, upData[upShow][i]) = 1 then
      begin
        upData[upShowRank].Add(upData[upShow][i]);
        upAData[upShowRank].Add(upAData[upShow][i]);
      end;
    end;
  end;
end;


procedure upPrintHeader(s: string; ca: char);
var i: integer;
    s0: string;
    inBrackets: boolean;
begin
  if cmode > 0 then
    write(satt[ca]);
  s0 := '';
  inBrackets := false;
  if upBorder then
  begin
    s := Copy(s, 2, length(s) - 2);
    if s[1] = HLine1 then
      write(PT4OEMToUtf8(#199))
    else
      case upBorderLevel of
      0: write(PT4OEMToUtf8(#201));
      1: write(PT4OEMToUtf8(#204));
      2: write(PT4OEMToUtf8(#200));
      end;
  end;
  for i := 1 to length(s) do
  begin
    if s[i] = '[' then  // текст в квадратных скобках в заголовке Ќ≈ »Ќ“≈–ѕ–≈“»–”≈“—я как символы псевдографики!
      inBrackets := true
    else if s[i] = ']' then
      inBrackets := false;
    if ((s[i] = HLine1) or (s[i] = HLine2)) and not inBrackets 
      and not ((i = 3) and (s[i+1] <> HLine1) and (s[i+1] <> HLine2)) then // обработка первой (заглавной) буквы заголовка
    begin
      write(PT4AnsiToUtf8(s0));
      s0 := '';
      write(PT4OEMToUtf8(s[i]));
    end
    else
      s0 := s0 + s[i];
  end;
  write(PT4AnsiToUtf8(s0));
  if upBorder then
  begin
    if s[1] = HLine1 then
      write(PT4OEMToUtf8(#182))
    else
      case upBorderLevel of
      0: begin 
           write(PT4OEMToUtf8(#187));
           upBorderLevel := 1;
         end;
      1: write(PT4OEMToUtf8(#185));
      2: write(PT4OEMToUtf8(#188));
      end;
  end;
  if cmode > 0 then
    writeln(ttReset)
  else
    writeln;
end;

procedure upPrintSection(ind: integer);
var k, i: integer;
    s, sa, sres, textattr: string;
begin
  if (ind < 0) or (ind > upMaxInd) then
  begin
    writeln('ERROR: upPrintSection: index out of range');
    exit;
  end;
  if ind = upEndLine then
    upBorderLevel := 2;
  if cmode = 0 then
    for k := 0 to upData[ind].Count - 1 do
    begin
      if upAData[ind][k][1] = 'U' then // ќ—ќЅјя ситуаци€, возможна€ только дл€ основного содержимого разделов с отладочной 
                                       // или дополнительной информацией: перекодировка и установка атрибутов Ќ≈ “–≈Ѕ”≈“—я!
        writeln(upData[ind][k])
      else if (k = 0) or (upAData[ind][k][1] = 'H') then // вывод заголовка
        upPrintHeader(upData[ind][k], 'H')
      else
      begin
        if not upBorder then
          writeln(PT4AnsiToUtf8(upData[ind][k]))
        else
          writeln(PT4OEMToUtf8(#186), 
            PT4AnsiToUtf8(Copy(upData[ind][k], 2, length(upData[ind][k]) -2)), PT4OEMToUtf8(#186));
      end;
    end
  else if cmode > 0 then
    for k := 0 to upData[ind].Count - 1 do
    begin
      if upAData[ind][k][1] = 'U' then // ќ—ќЅјя ситуаци€, возможна€ только дл€ основного содержимого разделов с отладочной 
                                       // или дополнительной информацией: перекодировка и установка атрибутов Ќ≈ “–≈Ѕ”≈“—я!
        writeln(upData[ind][k])
      else if (k = 0) or (upAData[ind][k][1] = 'H') then      // вывод заголовка
        upPrintHeader(upData[ind][k], upAData[ind][k][1])
      else
      begin
        s := upData[ind][k];
        sa := upAData[ind][k];
        if upBorder then
        begin
          s := Copy(s, 2, length(s) - 2);
          sa := Copy(sa, 2, length(sa) - 2);
          write(satt['H'], PT4OEMToUtf8(#186));
        end;
        sres := '';
        textattr := '';
        for i := 1 to length(s) do
        begin
          if satt[sa[i]] <> TextAttr then
          begin
            TextAttr := satt[sa[i]];
            sres := sres + TextAttr;
          end;
          sres := sres + s[i];
        end;
        write(PT4AnsiToUtf8(sres));
        if upBorder then
          write(satt['H'], PT4OEMToUtf8(#186));
        writeln(ttReset);
      end;
    end;
end;

function upEmptySection(ind: integer): boolean;
begin
  result := (ind < 0) or (ind > upMaxInd) or (upData[ind].Count = 0);
end;


end.

