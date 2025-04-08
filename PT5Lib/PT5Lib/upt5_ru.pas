{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5_ru;

{$MODE Delphi}

interface

function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;
procedure Activate_(dllname: string);

implementation

uses SysUtils, PT5TaskMaker, 
     SBeg95A4, SIfc60A4, SFor65A4, SPrc55A4, SFun60A4,
     _SMin60A4z, _SArr65a4z, _SArr45b4z, _smtr45a4z, _smtr10b4z, sstr60a4,
     SFil45A4, SFil25B4, STxt50A4, SPar40A4, SPar30B4, SRec30A4;

function GBeginKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #21;  TopicKey[14] := '7';  TopicKey[9] := 'j';  TopicKey[3] := '5';
  TopicKey[12] := '4';  TopicKey[2] := '4';  TopicKey[21] := 'g';  TopicKey[6] := 'f';
  TopicKey[5] := 'd';  TopicKey[19] := 'e';  TopicKey[1] := '3';  TopicKey[13] := '5';
  TopicKey[7] := 'h';  TopicKey[8] := 'k';  TopicKey[10] := 'h';  TopicKey[15] := 'd';
  TopicKey[17] := 't';  TopicKey[18] := 'f';  TopicKey[16] := 'd';  TopicKey[4] := 's';
  TopicKey[11] := '4';  TopicKey[20] := 'w';
  Result := TopicKey;
end;


function GIntegerKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #18;  TopicKey[6] := '0';  TopicKey[10] := '8';  TopicKey[1] := 'd';
  TopicKey[5] := '4';  TopicKey[15] := 'v';  TopicKey[14] := 'c';  TopicKey[2] := 'k';
  TopicKey[9] := '4';  TopicKey[16] := 'c';  TopicKey[12] := '.';  TopicKey[7] := '3';
  TopicKey[13] := '.';  TopicKey[3] := 'o';  TopicKey[4] := 'w';  TopicKey[18] := 's';
  TopicKey[17] := 'd';  TopicKey[8] := '9';  TopicKey[11] := '.';
  Result := TopicKey;
end;

function GBooleanKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #21;  TopicKey[14] := 'n';  TopicKey[9] := 'h';  TopicKey[3] := '5';
  TopicKey[12] := 'r';  TopicKey[2] := '4';  TopicKey[21] := 'd';  TopicKey[6] := '5';
  TopicKey[5] := '6';  TopicKey[19] := '5';  TopicKey[1] := '3';  TopicKey[13] := 'w';
  TopicKey[7] := '6';  TopicKey[8] := 'g';  TopicKey[10] := 'j';  TopicKey[15] := 'c';
  TopicKey[17] := 'd';  TopicKey[18] := 'j';  TopicKey[16] := 'x';  TopicKey[4] := 's';
  TopicKey[11] := 'g';  TopicKey[20] := '6';
  Result := TopicKey;
end;

function GIfKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #24;  TopicKey[18] := 'j';  TopicKey[9] := 'p';  TopicKey[6] := 'e';
  TopicKey[4] := 'f';  TopicKey[10] := 'l';  TopicKey[1] := '4';  TopicKey[24] := 'd';
  TopicKey[2] := '9';  TopicKey[20] := ',';  TopicKey[12] := 'k';  TopicKey[13] := 'v';
  TopicKey[21] := 's';  TopicKey[16] := '3';  TopicKey[3] := 'k';  TopicKey[7] := 'n';
  TopicKey[11] := 'q';  TopicKey[22] := 'k';  TopicKey[23] := 'j';  TopicKey[15] := '0';
  TopicKey[5] := 'i';  TopicKey[14] := 'd';  TopicKey[17] := 'f';  TopicKey[19] := 'w';
  TopicKey[8] := 'a';
  Result := TopicKey;
end;

function GCaseKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #25;  TopicKey[8] := 'k';  TopicKey[14] := '9';  TopicKey[2] := 'd';
  TopicKey[20] := 'd';  TopicKey[5] := 'w';  TopicKey[19] := 'v';  TopicKey[25] := 'l';
  TopicKey[22] := 'w';  TopicKey[6] := 'l';  TopicKey[16] := '8';  TopicKey[23] := 'e';
  TopicKey[12] := '0';  TopicKey[15] := '3';  TopicKey[17] := '4';  TopicKey[13] := '2';
  TopicKey[4] := 'e';  TopicKey[9] := 's';  TopicKey[10] := 'o';  TopicKey[1] := 'k';
  TopicKey[18] := '7';  TopicKey[3] := 'o';  TopicKey[11] := 'q';  TopicKey[7] := 'm';
  TopicKey[21] := 'n';  TopicKey[24] := 'l';
  Result := TopicKey;
end;

function GForKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #28;  TopicKey[17] := '3';  TopicKey[4] := 'e';  TopicKey[3] := 'i';
  TopicKey[2] := 'r';  TopicKey[22] := '7';  TopicKey[28] := 's';  TopicKey[27] := 'o';
  TopicKey[14] := 'w';  TopicKey[6] := 'w';  TopicKey[16] := '2';  TopicKey[23] := '8';
  TopicKey[21] := '6';  TopicKey[25] := '0';  TopicKey[24] := '4';  TopicKey[1] := 'k';
  TopicKey[5] := 'o';  TopicKey[13] := 'l';  TopicKey[8] := 'v';  TopicKey[10] := 'f';
  TopicKey[20] := '5';  TopicKey[11] := 'k';  TopicKey[12] := 'd';  TopicKey[15] := 'p';
  TopicKey[9] := 'm';  TopicKey[26] := 'd';  TopicKey[18] := '4';  TopicKey[7] := 'p';
  TopicKey[19] := '9';
  Result := TopicKey;
end;

function GWhileKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #26;  TopicKey[16] := '3';  TopicKey[20] := '0';  TopicKey[4] := 'k';
  TopicKey[2] := '9';  TopicKey[3] := 'f';  TopicKey[11] := 'w';  TopicKey[17] := '4';
  TopicKey[26] := ';';  TopicKey[7] := 'e';  TopicKey[15] := 'l';  TopicKey[5] := 'd';
  TopicKey[8] := 'l';  TopicKey[14] := 'k';  TopicKey[19] := '6';  TopicKey[10] := 'p';
  TopicKey[12] := 'm';  TopicKey[9] := 's';  TopicKey[24] := 'd';  TopicKey[22] := 'f';
  TopicKey[1] := '3';  TopicKey[18] := '5';  TopicKey[21] := '1';  TopicKey[23] := 'l';
  TopicKey[6] := 'o';  TopicKey[13] := 'q';  TopicKey[25] := ';';
  Result := TopicKey;
end;

function GSeriesKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #25;  TopicKey[18] := ';';  TopicKey[17] := 'l';  TopicKey[23] := ',';
  TopicKey[24] := '.';  TopicKey[8] := 'k';  TopicKey[9] := 'l';  TopicKey[7] := 'm';
  TopicKey[2] := 'w';  TopicKey[4] := 'd';  TopicKey[12] := 'p';  TopicKey[16] := 'p';
  TopicKey[10] := 'p';  TopicKey[15] := 'l';  TopicKey[13] := 'l';  TopicKey[25] := '.';
  TopicKey[21] := 'a';  TopicKey[3] := 'l';  TopicKey[11] := 'l';  TopicKey[1] := '0';
  TopicKey[5] := 'o';  TopicKey[14] := 'p';  TopicKey[22] := 'q';  TopicKey[19] := ';';
  TopicKey[6] := 'c';  TopicKey[20] := '0';
  Result := TopicKey;
end;

function GProcKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := ';';  TopicKey[22] := 'l';  TopicKey[23] := 'b';
  TopicKey[11] := '3';  TopicKey[16] := 'j';  TopicKey[3] := 'd';  TopicKey[5] := 'l';
  TopicKey[9] := '7';  TopicKey[12] := 'f';  TopicKey[17] := '0';  TopicKey[8] := '8';
  TopicKey[14] := 'l';  TopicKey[13] := 'g';  TopicKey[20] := '5';  TopicKey[15] := 'k';
  TopicKey[4] := 'g';  TopicKey[19] := '6';  TopicKey[2] := 'f';  TopicKey[7] := '9';
  TopicKey[21] := '-';  TopicKey[6] := 'h';  TopicKey[10] := '4';  TopicKey[18] := '7';
  Result := TopicKey;
end;

//2011.08>
function GFuncKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := ';';  TopicKey[22] := 'l';  TopicKey[23] := 'b';
  TopicKey[11] := '3';  TopicKey[16] := 'j';  TopicKey[3] := 'd';  TopicKey[5] := 'l';
  TopicKey[9] := '7';  TopicKey[12] := 'f';  TopicKey[17] := '0';  TopicKey[8] := '8';
  TopicKey[14] := 'l';  TopicKey[13] := 'g';  TopicKey[20] := '5';  TopicKey[15] := 'k';
  TopicKey[4] := 'g';  TopicKey[19] := '6';  TopicKey[2] := 'f';  TopicKey[7] := '9';
  TopicKey[21] := '-';  TopicKey[6] := 'h';  TopicKey[10] := '4';  TopicKey[18] := '7';
  Result := TopicKey;
end;
//2011.08<

function GMinmaxKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #16;  TopicKey[7] := '6';  TopicKey[1] := 's';  TopicKey[4] := 'u';
  TopicKey[2] := 'd';  TopicKey[10] := '3';  TopicKey[3] := 'f';  TopicKey[8] := '5';
  TopicKey[12] := '-';  TopicKey[15] := 'g';  TopicKey[5] := 'y';  TopicKey[9] := '4';
  TopicKey[6] := '7';  TopicKey[16] := 'v';  TopicKey[14] := 'q';  TopicKey[11] := '-';
  TopicKey[13] := 'k';
  Result := TopicKey;
end;

function GArrayKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #21;  TopicKey[5] := 'f';  TopicKey[13] := '3';  TopicKey[16] := 'k';
  TopicKey[3] := 'd';  TopicKey[15] := '5';  TopicKey[1] := 'j';  TopicKey[17] := 'e';
  TopicKey[10] := 'f';  TopicKey[9] := 'd';  TopicKey[7] := 'e';  TopicKey[14] := '4';
  TopicKey[20] := '5';  TopicKey[21] := '6';  TopicKey[4] := 'h';  TopicKey[2] := 'h';
  TopicKey[12] := 'd';  TopicKey[8] := '.';  TopicKey[19] := '4';  TopicKey[11] := 'f';
  TopicKey[6] := 'g';  TopicKey[18] := '-';
  Result := TopicKey;
end;

function GMatrixKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := '3';  TopicKey[22] := 'w';  TopicKey[23] := 'g';
  TopicKey[11] := '5';  TopicKey[16] := '3';  TopicKey[3] := '5';  TopicKey[5] := 'j';
  TopicKey[9] := '6';  TopicKey[12] := '6';  TopicKey[17] := '4';  TopicKey[8] := 'u';
  TopicKey[14] := 'k';  TopicKey[13] := '4';  TopicKey[20] := 'w';  TopicKey[15] := 'b';
  TopicKey[4] := 'k';  TopicKey[19] := 'f';  TopicKey[2] := '4';  TopicKey[7] := 'y';
  TopicKey[21] := 'e';  TopicKey[6] := 't';  TopicKey[10] := '7';  TopicKey[18] := '4';
  Result := TopicKey;
end;

function GStringKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #21;  TopicKey[5] := 'd';  TopicKey[13] := '9';  TopicKey[16] := 'f';
  TopicKey[3] := 'f';  TopicKey[15] := 'd';  TopicKey[1] := ';';  TopicKey[17] := 'n';
  TopicKey[10] := '5';  TopicKey[9] := '6';  TopicKey[7] := 'g';  TopicKey[14] := '7';
  TopicKey[20] := 's';  TopicKey[21] := 'z';  TopicKey[4] := 'g';  TopicKey[2] := 'd';
  TopicKey[12] := '8';  TopicKey[8] := 'h';  TopicKey[19] := 'l';  TopicKey[11] := '-';
  TopicKey[6] := 'f';  TopicKey[18] := 'w';
  Result := TopicKey;
end;

function GFileKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #21;  TopicKey[5] := '4';  TopicKey[13] := 'k';  TopicKey[16] := 'r';
  TopicKey[3] := '2';  TopicKey[15] := 'e';  TopicKey[1] := 's';  TopicKey[17] := '2';
  TopicKey[10] := '5';  TopicKey[9] := '6';  TopicKey[7] := '7';  TopicKey[14] := 'l';
  TopicKey[20] := 'g';  TopicKey[21] := '-';  TopicKey[4] := '3';  TopicKey[2] := 'd';
  TopicKey[12] := 'j';  TopicKey[8] := '8';  TopicKey[19] := 'f';  TopicKey[11] := 'f';
  TopicKey[6] := '6';  TopicKey[18] := '2';
  Result := TopicKey;
end;

function GTextKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := '3';  TopicKey[22] := 'w';  TopicKey[23] := 'e';
  TopicKey[11] := 'a';  TopicKey[16] := '5';  TopicKey[3] := '4';  TopicKey[5] := 'g';
  TopicKey[9] := '6';  TopicKey[12] := 's';  TopicKey[17] := '4';  TopicKey[8] := 'k';
  TopicKey[14] := 'k';  TopicKey[13] := 'l';  TopicKey[20] := 'h';  TopicKey[15] := '8';
  TopicKey[4] := 'f';  TopicKey[19] := 'u';  TopicKey[2] := '2';  TopicKey[7] := 'j';
  TopicKey[21] := 'f';  TopicKey[6] := 'h';  TopicKey[10] := '5';  TopicKey[18] := '3';
  Result := TopicKey;
end;

function GParamKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := ';';  TopicKey[22] := 'l';  TopicKey[23] := 'b';
  TopicKey[11] := 'r';  TopicKey[16] := '2';  TopicKey[3] := 'd';  TopicKey[5] := 'l';
  TopicKey[9] := 'j';  TopicKey[12] := 'e';  TopicKey[17] := '0';  TopicKey[8] := 'd';
  TopicKey[14] := 'w';  TopicKey[13] := 'w';  TopicKey[20] := '5';  TopicKey[15] := '2';
  TopicKey[4] := 'g';  TopicKey[19] := '6';  TopicKey[2] := 'f';  TopicKey[7] := 'g';
  TopicKey[21] := '-';  TopicKey[6] := '4';  TopicKey[10] := 'j';  TopicKey[18] := '7';
  Result := TopicKey;
end;

function GRecurKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := '3';  TopicKey[22] := '-';  TopicKey[23] := '-';
  TopicKey[11] := 'd';  TopicKey[16] := 'k';  TopicKey[3] := '2';  TopicKey[5] := 'o';
  TopicKey[9] := 'o';  TopicKey[12] := 's';  TopicKey[17] := 'a';  TopicKey[8] := 'k';
  TopicKey[14] := 'w';  TopicKey[13] := 'n';  TopicKey[20] := 'q';  TopicKey[15] := 'j';
  TopicKey[4] := 'k';  TopicKey[19] := 'p';  TopicKey[2] := '9';  TopicKey[7] := 'o';
  TopicKey[21] := '-';  TopicKey[6] := 'k';  TopicKey[10] := 'k';  TopicKey[18] := 'l';
  Result := TopicKey;
end;

function GDynamicKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[1] := '3';  TopicKey[22] := '0';  TopicKey[23] := 'w';
  TopicKey[11] := 'g';  TopicKey[16] := '4';  TopicKey[3] := '4';  TopicKey[5] := 'a';
  TopicKey[9] := 'j';  TopicKey[12] := '-';  TopicKey[17] := '3';  TopicKey[8] := 'k';
  TopicKey[14] := 'r';  TopicKey[13] := 'e';  TopicKey[20] := 'g';  TopicKey[15] := '6';
  TopicKey[4] := 'd';  TopicKey[19] := 'f';  TopicKey[2] := '2';  TopicKey[7] := 'f';
  TopicKey[21] := '9';  TopicKey[6] := 's';  TopicKey[10] := 'h';  TopicKey[18] := 'd';
  Result := TopicKey;
end;


function GTreeKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #25;  TopicKey[18] := 'n';  TopicKey[15] := 'r';  TopicKey[25] := 'd';
  TopicKey[20] := 'w';  TopicKey[12] := 's';  TopicKey[14] := 'd';  TopicKey[4] := 'f';
  TopicKey[16] := 'f';  TopicKey[24] := 'j';  TopicKey[17] := 'm';  TopicKey[13] := '4';
  TopicKey[1] := '4';  TopicKey[8] := 'd';  TopicKey[23] := 'k';  TopicKey[10] := '5';
  TopicKey[19] := 'b';  TopicKey[6] := 's';  TopicKey[7] := 'd';  TopicKey[2] := '9';
  TopicKey[22] := 's';  TopicKey[3] := 'k';  TopicKey[9] := '4';  TopicKey[5] := 'i';
  TopicKey[21] := ',';  TopicKey[11] := '5';
  Result := TopicKey;
end;

function GObjDynKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #23;  TopicKey[10] := 'h';  TopicKey[6] := 's';  TopicKey[17] := '3';
  TopicKey[12] := '-';  TopicKey[4] := 'd';  TopicKey[13] := 'e';  TopicKey[23] := 'w';
  TopicKey[7] := 'f';  TopicKey[18] := 'd';  TopicKey[2] := '2';  TopicKey[15] := '6';
  TopicKey[19] := 'f';  TopicKey[22] := '0';  TopicKey[3] := '4';  TopicKey[5] := 'a';
  TopicKey[9] := 'j';  TopicKey[1] := '3';  TopicKey[14] := 'r';  TopicKey[16] := '4';
  TopicKey[11] := 'g';  TopicKey[20] := 'g';  TopicKey[21] := '9';  TopicKey[8] := 'k';
  Result := TopicKey;
end;

function GObjTreeKM: string;
var TopicKey: ShortString;
begin
  TopicKey[0] := #25;  TopicKey[18] := 'n';  TopicKey[15] := 'r';  TopicKey[25] := 'd';
  TopicKey[20] := 'w';  TopicKey[12] := 's';  TopicKey[14] := 'd';  TopicKey[4] := 'f';
  TopicKey[16] := 'f';  TopicKey[24] := 'j';  TopicKey[17] := 'm';  TopicKey[13] := '4';
  TopicKey[1] := '4';  TopicKey[8] := 'd';  TopicKey[23] := 'k';  TopicKey[10] := '5';
  TopicKey[19] := 'b';  TopicKey[6] := 's';  TopicKey[7] := 'd';  TopicKey[2] := '9';
  TopicKey[22] := 's';  TopicKey[3] := 'k';  TopicKey[9] := '4';  TopicKey[5] := 'i';
  TopicKey[21] := ',';  TopicKey[11] := '5';
  Result := TopicKey;
end;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'BEGIN' then
    SetGroupData('Begin', 'Ввод и вывод данных, оператор присваивания', 'М. Э. Абрамян, 2006, 2012', GBeginKM, 40)
  else if name0 = 'INTEGER' then
    SetGroupData('Integer', 'Целые числа', 'М. Э. Абрамян, 2006, 2012', GIntegerKM, 30)
  else if name0 = 'BOOLEAN' then
    SetGroupData('Boolean', 'Логические выражения', 'М. Э. Абрамян, 2006, 2012', GBooleanKM, 40)
  else if name0 = 'IF' then
    SetGroupData('If', 'Условный оператор', 'М. Э. Абрамян, 2006, 2012', GIfKM, 30)
  else if name0 = 'CASE' then
    SetGroupData('Case', 'Оператор выбора', 'М. Э. Абрамян, 2006, 2012', GCaseKM, 20)
  else if name0 = 'FOR' then
    SetGroupData('For', 'Цикл с параметром', 'М. Э. Абрамян, 2006, 2012', GForKM, 40)
  else if name0 = 'WHILE' then
    SetGroupData('While', 'Цикл с условием', 'М. Э. Абрамян, 2006, 2012', GWhileKM, 30)
  else if (name0 = 'PROC') and (lang and (lgPython+lgRuby+lgJulia) = 0) then
    SetGroupData('Proc', 'Процедуры и функции', 'М. Э. Абрамян, 2006, 2012', GProcKM, 60)
  else if (name0 = 'FUNC') and (lang and (lgPython+lgRuby+lgJulia) <> 0) then
    SetGroupData('Func', 'Функции', 'М. Э. Абрамян, 2006, 2012', GFuncKM, 60)
  else if name0 = 'ZSERIES' then
    SetGroupData('ZSeries', 'Последовательности', 'М. Э. Абрамян, 2006, 2012', GSeriesKM, 40)
  else if name0 = 'ZMINMAX' then
    SetGroupData('ZMinmax', 'Минимумы и максимумы', 'М. Э. Абрамян, 2006, 2012', GMinmaxKM, 30)
  else if name0 = 'ZARRAY' then
    SetGroupData('ZArray', 'Одномерные массивы', 'М. Э. Абрамян, 2006, 2012', GArrayKM, 140)
  else if name0 = 'ZMATRIX' then
    SetGroupData('ZMatrix', 'Двумерные массивы (матрицы)', 'М. Э. Абрамян, 2006, 2012', GMatrixKM, 100)
  else if name0 = 'STRING' then
    SetGroupData('String', 'Символы и строки', 'М. Э. Абрамян, 2006, 2012', GStringKM, 70)
  else if name0 = 'FILE' then
    SetGroupData('File', 'Двоичные файлы', 'М. Э. Абрамян, 2006, 2012', GFileKM, 90)
  else if name0 = 'TEXT' then
    SetGroupData('Text', 'Текстовые файлы', 'М. Э. Абрамян, 2006, 2012', GTextKM, 60)
  else if name0 = 'PARAM' then
    SetGroupData('Param', 'Составные типы данных в процедурах и функциях', 'М. Э. Абрамян, 2006, 2012', GParamKM, 70)
  else if name0 = 'RECUR' then
    SetGroupData('Recur', 'Рекурсия', 'М. Э. Абрамян, 2006, 2012', GRecurKM, 30);
  result := GetTaskCount;
  if result > 0 then
  begin
    name := GetTopic;
    code := GetCode;
  end;
end;

function InitTask_(num, test: Integer): integer;
var name: string;
begin
  name := SetTaskData(num, test);
  if name= 'BEGIN' then
  case Num of
     1: SBeg95An1('', 'subtask(1)');
     2: SBeg95An1('', 'subtask(2)');
     3: SBeg95An2('', '');
     4: SBeg95An3('', '');
     5: SBeg95An4('', '');
     6: SBeg95An5('', '');
     7: SBeg95An6('', '');
     8: SBeg95An7('', 'subtask(1)');
     9: SBeg95An7('', 'subtask(2)');
    10: SBeg95An8('', '');
    11: SBeg95An9('', '');
    12: SBeg95An10('', '');
    13: SBeg95An11('', '');
    14: SBeg95An12('', 'subtask(1)');
    15: SBeg95An12('', 'subtask(2)');
    16: SBeg95An13('', '');
    17: SBeg95An14('', '');
    18: SBeg95An15('', '');
    19: SBeg95An16('', '');
    20: SBeg95An17('', '');
    21: SBeg95An18('', '');
    22: SBeg95An19('', '');
    23: SBeg95An20('', 'subtask(1)');
    24: SBeg95An20('', 'subtask(2)');
    25: SBeg95An21('', 'subtask(1)');
    26: SBeg95An21('', 'subtask(2)');
    27: SBeg95An22('', '');
    28: SBeg95An23('', '');
    29: SBeg95An24('', 'subtask(1)');
    30: SBeg95An24('', 'subtask(2)');
    31: SBeg95An25('', 'subtask(1)');
    32: SBeg95An25('', 'subtask(2)');
    33: SBeg95An26('', 'subtask(1)');
    34: SBeg95An26('', 'subtask(2)');
    35: SBeg95An27('', '');
    36: SBeg95An28('', 'subtask(1)');
    37: SBeg95An28('', 'subtask(2)');
    38: SBeg95An29('', '');
    39: SBeg95An30('', '');
    40: SBeg95An31('', '');
  end
  else if name = 'INTEGER' then
    case Num of
     1: SBeg95An37('', 'subtask(1)'+'');
     2: SBeg95An37('', 'subtask(2)'+'');
     3: SBeg95An38('', '');
     4: SBeg95An39('', 'subtask(1)'+'');
     5: SBeg95An39('', 'subtask(2)'+'');
     6: SBeg95An40('', '');
     7: SBeg95An41('', '');
     8: SBeg95An42('', '');
     9: SBeg95An43('', '');
    10: SBeg95An44('', '');
    11: SBeg95An45('', '');
    12: SBeg95An46('', '');
    13: SBeg95An47('', 'subtask(1)'+'');
    14: SBeg95An47('', 'subtask(2)'+'');
    15: SBeg95An48('', 'subtask(1)'+'');
    16: SBeg95An48('', 'subtask(2)'+'');
    17: SBeg95An49('', 'subtask(1)'+'');
    18: SBeg95An49('', 'subtask(2)'+'');
    19: SBeg95An50('', '');
    20: SBeg95An51('', '');
    21: SBeg95An52('', 'subtask(1)'+'');
    22: SBeg95An52('', 'subtask(2)'+'');
    23: SBeg95An52('', 'subtask(3)'+'');
    24: SBeg95An53('', '');
    25: SBeg95An54('', '');
    26: SBeg95An55('', '');
    27: SBeg95An56('', '');
    28: SBeg95An57('', '');
    29: SBeg95An58('', '');
    30: SBeg95An59('', '');
  end
  else if name = 'BOOLEAN' then
    case Num of
       1: SBeg95An61('', '');
       2: SBeg95An62('', 'subtask(1)'+'');
       3: SBeg95An62('', 'subtask(2)'+'');
       4: SBeg95An63('', 'subtask(1)'+'');
       5: SBeg95An63('', 'subtask(2)'+'');
       6: SBeg95An64('', '');
       7: SBeg95An65('', '');
       8: SBeg95An66('', '');
       9: SBeg95An67('', '');
      10: SBeg95An68('', '');
      11: SBeg95An69('', '');
      12: SBeg95An70('', '');
      13: SBeg95An71('', '');
      14: SBeg95An72('', '');
      15: SBeg95An73('', '');
      16: SBeg95An74('', 'subtask(1)'+'');
      17: SBeg95An74('', 'subtask(2)'+'');
      18: SBeg95An75('', 'subtask(1)'+'');
      19: SBeg95An75('', 'subtask(2)'+'');
      20: SBeg95An76('', '');
      21: SBeg95An77('', '');
      22: SBeg95An78('', '');
      23: SBeg95An79('', '');
      24: SBeg95An80('', '');
      25: SBeg95An81('', 'subtask(1)'+'');
      26: SBeg95An81('', 'subtask(2)'+'');
      27: SBeg95An82('', 'subtask(1)'+'');
      28: SBeg95An82('', 'subtask(2)'+'');
      29: SBeg95An83('', '');
      30: SBeg95An84('', '');
      31: SBeg95An85('', '');
      32: SBeg95An86('', '');
      33: SBeg95An87('', '');
      34: SBeg95An88('', '');
      35: SBeg95An89('', '');
      36: SBeg95An90('', '');
      37: SBeg95An91('', '');
      38: SBeg95An92('', '');
      39: SBeg95An93('', '');
      40: SBeg95An94('', '');
    end
  else if name = 'IF' then
  case Num of
     1: SIfc60An1('', '');
     2: SIfc60An2('', '');
     3: SIfc60An3('', '');
     4: SIfc60An4('', '');
     5: SIfc60An5('', '');
     6: SIfc60An6('', '');
     7: SIfc60An7('', '');
     8: SIfc60An8('', '');
     9: SIfc60An9('', '');
    10: SIfc60An10('', '');
    11: SIfc60An11('', '');
    12: SIfc60An12('', '');
    13: SIfc60An13('', '');
    14: SIfc60An14('', '');
    15: SIfc60An15('', '');
    16: SIfc60An16('', '');
    17: SIfc60An17('', '');
    18: SIfc60An18('', '');
    19: SIfc60An19('', '');
    20: SIfc60An20('', '');
    21: SIfc60An21('', '');
    22: SIfc60An22('', '');
    23: SIfc60An23('', '');
    24: SIfc60An24('', '');
    25: SIfc60An25('', '');
    26: SIfc60An26('', '');
    27: SIfc60An27('', '');
    28: SIfc60An28('', '');
    29: SIfc60An29('', '');
    30: SIfc60An30('', '');
  end
  else if name = 'CASE' then
  case Num of
     1: SIfc60An32('', '');
     2: SIfc60An33('', '');
     3: SIfc60An34('', '');
     4: SIfc60An35('', '');
     5: SIfc60An36('', '');
     6: SIfc60An37('', '');
     7: SIfc60An38('', '');
     8: SIfc60An39('', '');
     9: SIfc60An40('', '');
    10: SIfc60An41('', '');
    11: SIfc60An42('', '');
    12: SIfc60An43('', '');
    13: SIfc60An44('', '');
    14: SIfc60An45('', '');
    15: SIfc60An46('', '');
    16: SIfc60An47('', '');
    17: SIfc60An48('', '');
    18: SIfc60An49('', '');
    19: SIfc60An50('', '');
    20: SIfc60An51('', '');
  end
  else if name= 'FOR' then
  case Num of
     1: SFor65An1('', '');
     2: SFor65An2('', '');
     3: SFor65An3('', '');
     4: SFor65An4('', '');
     5: SFor65An5('', '');
     6: SFor65An6('', '');
     7: SFor65An7('', '');
     8: SFor65An8('', '');
     9: SFor65An9('', '');
    10: SFor65An10('', '');
    11: SFor65An11('', '');
    12: SFor65An12('', '');
    13: SFor65An13('', '');
    14: SFor65An14('', '');
    15: SFor65An15('', '');
    16: SFor65An16('', '');
    17: SFor65An17('', '');
    18: SFor65An18('', '');
    19: SFor65An19('', '');
    20: SFor65An20('', '');
    21: SFor65An21('', '');
    22: SFor65An22('', '');
    23: SFor65An23('', 'subtask(1)'+'');
    24: SFor65An23('', 'subtask(2)'+'');
    25: SFor65An24('', 'subtask(1)'+'');
    26: SFor65An24('', 'subtask(2)'+'');
    27: SFor65An25('', 'subtask(1)'+'');
    28: SFor65An25('', 'subtask(2)'+'');
    29: SFor65An26('', '');
    30: SFor65An27('', '');
    31: SFor65An28('', 'subtask(1)'+'');
    32: SFor65An28('', 'subtask(2)'+'');
    33: SFor65An29('', '');
    34: SFor65An30('', '');
    35: SFor65An31('', '');
    36: SFor65An33('', '');
    37: SFor65An34('', 'subtask(1)'+'');
    38: SFor65An34('', 'subtask(2)'+'');
    39: SFor65An35('', '');
    40: SFor65An36('', '');
  end
  else if name = 'WHILE' then
  case Num of
     1: SFor65An38('', 'subtask(1)'+'');
     2: SFor65An38('', 'subtask(2)'+'');
     3: SFor65An39('', '');
     4: SFor65An40('', '');
     5: SFor65An41('', '');
     6: SFor65An42('', '');
     7: SFor65An43('', '');
     8: SFor65An44('', '');
     9: SFor65An45('', '');
    10: SFor65An46('', '');
    11: SFor65An47('', '');
    12: SFor65An48('', '');
    13: SFor65An49('', '');
    14: SFor65An50('', '');
    15: SFor65An51('', '');
    16: SFor65An52('', '');
    17: SFor65An53('', '');
    18: SFor65An54('', '');
    19: SFor65An55('', '');
    20: SFor65An56('', 'subtask(1)'+'');
    21: SFor65An56('', 'subtask(2)'+'');
    22: SFor65An57('', '');
    23: SFor65An58('', '');
    24: SFor65An59('', '');
    25: SFor65An60('', '');
    26: SFor65An61('', '');
    27: SFor65An62('', '');
    28: SFor65An63('', '');
    29: SFor65An64('', '');
    30: SFor65An65('', '');
  end
  else if name = 'PROC' then
  case Num of
     1: SPrc55An1('', '');
     2: SPrc55An2('', '');
     3: SPrc55An3('', '');
     4: SPrc55An4('', '');
     5: SPrc55An5('', '');
     6: SPrc55An6('', '');
     7: SPrc55An7('', '');
     8: SPrc55An8('', '');
     9: SPrc55An9('', '');
    10: SPrc55An10('', '');
    11: SPrc55An11('', '');
    12: SPrc55An12('', 'subtask(1)'+'');
    13: SPrc55An12('', 'subtask(2)'+'');
    14: SPrc55An13('', 'subtask(1)'+'');
    15: SPrc55An13('', 'subtask(2)'+'');
    16: SPrc55An17('', '');
    17: SPrc55An18('', '');
    18: SPrc55An19('', '');
    19: SPrc55An20('', '');
    20: SPrc55An21('', '');
    21: SPrc55An22('', '');
    22: SPrc55An23('', '');
    23: SPrc55An24('', '');
    24: SPrc55An25('', '');
    25: SPrc55An26('', '');
    26: SPrc55An27('', '');
    27: SPrc55An28('', '');
    28: SPrc55An29('', '');
    29: SPrc55An30('', '');
    30: SPrc55An31('', '');
    31: SPrc55An32('', '');
    32: SPrc55An33('', 'subtask(1)'+'');
    33: SPrc55An33('', 'subtask(2)'+'');
    34: SPrc55An34('', '');
    35: SPrc55An35('', '');
    36: SPrc55An36('', '');
    37: SPrc55An39('', '');
    38: SPrc55An40('', '');
    39: SPrc55An41('', '');
    40: SPrc55An42('', '');
    41: SPrc55An43('', 'subtask(1)'+'');
    42: SPrc55An43('', 'subtask(2)'+'');
    43: SPrc55An44('', 'subtask(1)'+'');
    44: SPrc55An44('', 'subtask(2)'+'');
    45: SPrc55An45('', '');
    46: SPrc55An46('', '');
    47: SPrc55An47('', '');
    48: SPrc55An48('', '');
    49: SPrc55An49('', '');
    50: SPrc55An50('', '');
    51: SPrc55An51('', '');
    52: SPrc55An52('', '');
    53: SPrc55An53('', '');
    54: SPrc55An54('', 'subtask(1)'+'');
    55: SPrc55An54('', 'subtask(2)'+'');
    56: SPar30Bn1('', '');
    57: SPar30Bn2('', '');
    58: SPar30Bn3('', '');
    59: SPar30Bn4('', '');
    60: SPar30Bn5('', '');
  end
  else if name = 'FUNC' then
  case Num of
     1: SFun60An17('', '');
     2: SFun60An18('', '');
     3: SFun60An19('', '');
     4: SFun60An20('', '');
     5: SFun60An21('', '');
     6: SFun60An22('', '');
     7: SFun60An23('', '');
     8: SFun60An24('', '');
     9: SFun60An25('', '');
    10: SFun60An26('', '');
    11: SFun60An27('', '');
    12: SFun60An28('', '');
    13: SFun60An29('', '');
    14: SFun60An30('', '');
    15: SFun60An31('', '');
    16: SFun60An32('', '');
    17: SFun60An33('', 'subtask(1)'+'');
    18: SFun60An33('', 'subtask(2)'+'');
    19: SFun60An34('', '');
    20: SFun60An35('', '');
    21: SFun60An36('', '');
    22: SFun60An1('', '');
    23: SFun60An2('', '');
    24: SFun60An3('', '');
    25: SFun60An4('', '');
    26: SFun60An5('', '');
    27: SFun60An6('', '');
    28: SFun60An7('', '');
    29: SFun60An8('', '');
    30: SFun60An9('', '');
    31: SFun60An10('', '');
    32: SFun60An11('', '');
    33: SFun60An12('', 'subtask(1)'+'');
    34: SFun60An12('', 'subtask(2)'+'');
    35: SFun60An13('', 'subtask(1)'+'');
    36: SFun60An13('', 'subtask(2)'+'');
    37: SFun60An39('', '');
    38: SFun60An40('', '');
    39: SFun60An41('', '');
    40: SFun60An42('', '');
    41: SFun60An43('', 'subtask(1)'+'');
    42: SFun60An43('', 'subtask(2)'+'');
    43: SFun60An44('', 'subtask(1)'+'');
    44: SFun60An44('', 'subtask(2)'+'');
    45: SFun60An45('', '');
    46: SFun60An46('', '');
    47: SFun60An47('', '');
    48: SFun60An48('', '');
    49: SFun60An49('', '');
    50: SFun60An50('', '');
    51: SFun60An51('', '');
    52: SFun60An52('', '');
    53: SFun60An53('', '');
    54: SFun60An54('', 'subtask(1)'+'');
    55: SFun60An54('', 'subtask(2)'+'');
    56: SFun60An56('', '');
    57: SFun60An57('', '');
    58: SFun60An58('', '');
    59: SFun60An59('', '');
    60: SFun60An60('', '');
  end
  else if name = 'ZSERIES' then
  case Num of
     1: SMin60An1('', '');
     2: SMin60An2('', 'subtask(1)'+'');
     3: SMin60An2('', 'subtask(2)'+'');
     4: SMin60An3('', '');
     5: SMin60An4('', 'subtask(1)'+'');
     6: SMin60An4('', 'subtask(2)'+'');
     7: SMin60An4('', 'subtask(3)'+'');
     8: SMin60An5('', 'subtask(1)'+'');
     9: SMin60An5('', 'subtask(2)'+'');
    10: SMin60An6('', '');
    11: SMin60An7('', '');
    12: SMin60An8('', '');
    13: SMin60An9('', '');
    14: SMin60An10('', '');
    15: SMin60An11('', '');
    16: SMin60An12('', '');
    17: SMin60An13('', '');
    18: SMin60An14('', '');
    19: SMin60An15('', '');
    20: SMin60An16('', '');
    21: SMin60An17('', '');
    22: SMin60An18('', '');
    23: SMin60An19('', '');
    24: SMin60An20('', '');
    25: SMin60An21('', '');
    26: SMin60An23('', '');
    27: SMin60An24('', '');
    28: SMin60An25('', '');
    29: SMin60An26('', '');
    30: SMin60An27('', '');
    31: SMin60An28('', '');
    32: SMin60An29('', '');
    33: SMin60An30('', '');
    34: SMin60An31('', '');
    35: SMin60An32('', '');
    36: SMin60An33('', 'subtask(1)'+'');
    37: SMin60An33('', 'subtask(2)'+'');
    38: SMin60An34('', '');
    39: SMin60An35('', '');
    40: SMin60An36('', '');
  end
  else if name = 'ZMINMAX' then
  case Num of
     1: SMin60An38('', '');
     2: SMin60An39('', 'subtask(1)'+'');
     3: SMin60An39('', 'subtask(2)'+'');
     4: SMin60An40('', '');
     5: SMin60An41('', '');
     6: SMin60An42('', '');
     7: SMin60An43('', '');
     8: SMin60An44('', 'subtask(1)'+'');
     9: SMin60An44('', 'subtask(2)'+'');
    10: SMin60An45('', 'subtask(1)'+'');
    11: SMin60An45('', 'subtask(2)'+'');
    12: SMin60An46('', '');
    13: SMin60An47('', '');
    14: SMin60An48('', 'subtask(1)'+'');
    15: SMin60An48('', 'subtask(2)'+'');
    16: SMin60An49('', 'subtask(1)'+'');
    17: SMin60An49('', 'subtask(2)'+'');
    18: SMin60An49('', 'subtask(3)'+'');
    19: SMin60An50('', '');
    20: SMin60An51('', '');
    21: SMin60An52('', '');
    22: SMin60An53('', '');
    23: SMin60An54('', '');
    24: SMin60An55('', '');
    25: SMin60An56('', '');
    26: SMin60An57('', '');
    27: SMin60An58('', 'subtask(1)'+'');
    28: SMin60An58('', 'subtask(2)'+'');
    29: SMin60An59('', 'subtask(1)'+'');
    30: SMin60An59('', 'subtask(2)'+'');
  end
  else if name= 'ZARRAY' then
  case Num of
     1: SArr65an1('', '');
     2: SArr65an2('', '');
     3: SArr65an3('', '');
     4: SArr65an4('', '');
     5: SArr65an5('', '');
     6: SArr65an6('', '');
     7: SArr65an9('', '');
     8: SArr65an10('', 'subtask(1)'+'');
     9: SArr65an10('', 'subtask(2)'+'');
    10: SArr65an11('', '');
    11: SArr65an12('', '');
    12: SArr65an13('', 'subtask(1)'+'');
    13: SArr65an13('', 'subtask(2)'+'');
    14: SArr65an14('', 'subtask(1)'+'');
    15: SArr65an14('', 'subtask(2)'+'');
    16: SArr65an15('', '');
    17: SArr65an16('', '');
    18: SArr65an18('', 'subtask(1)'+'');
    19: SArr65an18('', 'subtask(2)'+'');
    20: SArr65an19('', 'subtask(1)'+'');
    21: SArr65an19('', 'subtask(2)'+'');
    22: SArr65an20('', 'subtask(1)'+'');
    23: SArr65an20('', 'subtask(2)'+'');
    24: SArr65an21('', 'subtask(1)'+'');
    25: SArr65an21('', 'subtask(2)'+'');
    26: SArr65an22('', 'subtask(1)'+'');
    27: SArr65an22('', 'subtask(2)'+'');
    28: SArr65an23('', '');
    29: SArr65an24('', '');
    30: SArr65an25('', 'subtask(1)'+'');
    31: SArr65an25('', 'subtask(2)'+'');
    32: SArr65an26('', '');
    33: SArr65an27('', '');
    34: SArr65an28('', 'subtask(1)'+'');
    35: SArr65an28('', 'subtask(2)'+'');
    36: SArr65an29('', '');
    37: SArr65an30('', 'subtask(1)'+'');
    38: SArr65an30('', 'subtask(2)'+'');
    39: SArr65an31('', '');
    40: SArr65an32('', '');
    41: SArr65an33('', '');
    42: SArr65an34('', '');
    43: SArr65an35('', '');
    44: SArr65an36('', '');
    45: SArr65an37('', '');
    46: SArr65an38('', '');
    47: SArr65an39('', '');
    48: SArr65an40('', '');
    49: SArr65an41('', '');
    50: SArr65an42('', '');
    51: SArr45bn16('', '');
    52: SArr45bn17('', '');
    53: SArr45bn18('', '');
    54: SArr45bn19('', '');
    55: SArr45bn20('', 'subtask(1)'+'');
    56: SArr45bn20('', 'subtask(2)'+'');
    57: SArr45bn21('', '');
    58: SArr45bn22('', 'subtask(1)'+'');
    59: SArr45bn22('', 'subtask(2)'+'');
    60: SArr45bn23('', '');
    61: SArr45bn24('', '');
    62: SArr45bn25('', '');
    63: SArr45bn26('', '');
    64: SArr45bn27('', '');
    65: SArr65an44('', '');
    66: SArr65an45('', 'subtask(1)'+'');
    67: SArr65an45('', 'subtask(2)'+'');
    68: SArr65an46('', '');
    69: SArr65an47('', '');
    70: SArr65an48('', '');
    71: SArr65an49('', '');
    72: SArr65an50('', 'subtask(1)'+'');
    73: SArr65an50('', 'subtask(2)'+'');
    74: SArr65an51('', '');
    75: SArr65an52('', '');
    76: SArr65an53('', 'subtask(1)'+'');
    77: SArr65an53('', 'subtask(2)'+'');
    78: SArr65an53('', 'subtask(3)'+'');
    79: SArr65an54('', '');
    80: SArr65an55('', '');
    81: SArr65an56('', 'subtask(1)'+'');
    82: SArr65an56('', 'subtask(2)'+'');
    83: SArr65an57('', 'subtask(1)'+'');
    84: SArr65an57('', 'subtask(2)'+'');
    85: SArr65an58('', 'subtask(1)'+'');
    86: SArr65an58('', 'subtask(2)'+'');
    87: SArr65an59('', 'subtask(1)'+'');
    88: SArr65an59('', 'subtask(2)'+'');
    89: SArr65an60('', '');
    90: SArr65an62('', '');
    91: SArr65an63('', '');
    92: SArr65an64('', '');
    93: SArr65an65('', 'subtask(1)'+'');
    94: SArr65an65('', 'subtask(2)'+'');
    95: SArr45bn1('', '');
    96: SArr45bn2('', 'subtask(1)'+'');
    97: SArr45bn2('', 'subtask(2)'+'');
    98: SArr45bn3('', 'subtask(1)'+'');
    99: SArr45bn3('', 'subtask(2)'+'');
    100: SArr45bn3('', 'subtask(3)'+'');
    101: SArr45bn4('', 'subtask(1)'+'');
    102: SArr45bn4('', 'subtask(2)'+'');
    103: SArr45bn5('', '');
    104: SArr45bn6('', 'subtask(1)'+'');
    105: SArr45bn6('', 'subtask(2)'+'');
    106: SArr45bn7('', 'subtask(1)'+'');
    107: SArr45bn7('', 'subtask(2)'+'');
    108: SArr45bn8('', '');
    109: SArr45bn9('', 'subtask(1)'+'');
    110: SArr45bn9('', 'subtask(2)'+'');
    111: SArr45bn9('', 'subtask(3)'+'');
    112: SArr45bn11('', '');
    113: SArr45bn12('', '');
    114: SArr45bn13('', '');
    115: SArr45bn14('', '');
    116: SArr45bn29('', '');
    117: SArr45bn30('', 'subtask(1)'+'');
    118: SArr45bn30('', 'subtask(2)'+'');
    119: SArr45bn31('', 'subtask(1)'+'');
    120: SArr45bn31('', 'subtask(2)'+'');
    121: SArr45bn32('', '');
    122: SArr45bn33('', '');
    123: SArr45bn34('', 'subtask(1)'+'');
    124: SArr45bn34('', 'subtask(2)'+'');
    125: SArr45bn35('', 'subtask(1)'+'');
    126: SArr45bn35('', 'subtask(2)'+'');
    127: SArr45bn35('', 'subtask(3)'+'');
    128: SArr45bn36('', 'subtask(1)'+'');
    129: SArr45bn36('', 'subtask(2)'+'');
    130: SArr45bn36('', 'subtask(3)'+'');
    131: SArr45bn38('', '');
    132: SArr45bn39('', 'subtask(1)'+'');
    133: SArr45bn39('', 'subtask(2)'+'');
    134: SArr45bn40('', '');
    135: SArr45bn41('', '');
    136: SArr45bn42('', '');
    137: SArr45bn43('', 'subtask(1)'+'');
    138: SArr45bn43('', 'subtask(2)'+'');
    139: SArr45bn44('', 'subtask(1)'+'');
    140: SArr45bn44('', 'subtask(2)'+'');
  end
  else if name = 'ZMATRIX' then
  case Num of
     1: smtr45an1('', 'subtask(1)'+'');
     2: smtr45an1('', 'subtask(2)'+'');
     3: smtr45an2('', 'subtask(1)'+'');
     4: smtr45an2('', 'subtask(2)'+'');
     5: smtr45an2('', 'subtask(3)'+'');
     6: smtr45an2('', 'subtask(4)'+'');
     7: smtr45an3('', '');
     8: smtr45an4('', '');
     9: smtr45an5('', 'subtask(1)'+'');
    10: smtr45an5('', 'subtask(2)'+'');
    11: smtr45an6('', 'subtask(1)'+'');
    12: smtr45an6('', 'subtask(2)'+'');
    13: smtr45an7('', 'subtask(1)'+'');
    14: smtr45an7('', 'subtask(2)'+'');
    15: smtr45an8('', 'subtask(1)'+'');
    16: smtr45an8('', 'subtask(2)'+'');
    17: smtr45an10('', 'subtask(1)'+'');
    18: smtr45an10('', 'subtask(2)'+'');
    19: smtr45an11('', 'subtask(1)'+'');
    20: smtr45an11('', 'subtask(2)'+'');
    21: smtr45an12('', 'subtask(1)'+'');
    22: smtr45an12('', 'subtask(2)'+'');
    23: smtr45an13('', '');
    24: smtr45an14('', '');
    25: smtr45an15('', 'subtask(1)'+'');
    26: smtr45an15('', 'subtask(2)'+'');
    27: smtr45an16('', 'subtask(1)'+'');
    28: smtr45an16('', 'subtask(2)'+'');
    29: smtr45an17('', 'subtask(1)'+'');
    30: smtr45an17('', 'subtask(2)'+'');
    31: smtr45an18('', '');
    32: smtr45an19('', 'subtask(1)'+'');
    33: smtr45an19('', 'subtask(2)'+'');
    34: smtr45an20('', 'subtask(1)'+'');
    35: smtr45an20('', 'subtask(2)'+'');
    36: smtr45an21('', '');
    37: smtr45an22('', 'subtask(1)'+'');
    38: smtr45an22('', 'subtask(2)'+'');
    39: smtr45an22('', 'subtask(3)'+'');
    40: smtr45an23('', 'subtask(1)'+'');
    41: smtr45an23('', 'subtask(2)'+'');
    42: smtr45an24('', 'subtask(1)'+'');
    43: smtr45an24('', 'subtask(2)'+'');
    44: smtr45an25('', 'subtask(1)'+'');
    45: smtr45an25('', 'subtask(2)'+'');
    46: smtr45an26('', '');
    47: smtr45an28('', 'subtask(1)'+'');
    48: smtr45an28('', 'subtask(2)'+'');
    49: smtr45an29('', 'subtask(1)'+'');
    50: smtr45an29('', 'subtask(2)'+'');
    51: smtr45an30('', 'subtask(1)'+'');
    52: smtr45an30('', 'subtask(2)'+'');
    53: smtr45an31('', '');
    54: smtr45an32('', '');
    55: smtr45an33('', 'subtask(1)'+'');
    56: smtr45an33('', 'subtask(2)'+'');
    57: smtr45an34('', 'subtask(1)'+'');
    58: smtr45an34('', 'subtask(2)'+'');
    59: smtr45an35('', 'subtask(1)'+'');
    60: smtr45an35('', 'subtask(2)'+'');
    61: smtr45an36('', 'subtask(1)'+'');
    62: smtr45an36('', 'subtask(2)'+'');
    63: smtr45an37('', 'subtask(1)'+'');
    64: smtr45an37('', 'subtask(2)'+'');
    65: smtr45an38('', 'subtask(1)'+'');
    66: smtr45an38('', 'subtask(2)'+'');
    67: smtr45an38('', 'subtask(3)'+'');
    68: smtr45an39('', 'subtask(1)'+'');
    69: smtr45an39('', 'subtask(2)'+'');
    70: smtr45an40('', 'subtask(1)'+'');
    71: smtr45an40('', 'subtask(2)'+'');
    72: smtr45an41('', 'subtask(1)'+'');
    73: smtr45an41('', 'subtask(2)'+'');
    74: smtr45an42('', '');
    75: smtr45an43('', 'subtask(1)'+'');
    76: smtr45an43('', 'subtask(2)'+'');
    77: smtr45an43('', 'subtask(3)'+'');
    78: smtr45an44('', 'subtask(1)'+'');
    79: smtr45an44('', 'subtask(2)'+'');
    80: smtr10bn1('', 'subtask(1)'+'');
    81: smtr10bn1('', 'subtask(2)'+'');
    82: smtr10bn2('', '');
    83: smtr10bn3('', '');
    84: smtr10bn4('', 'subtask(1)'+'');
    85: smtr10bn4('', 'subtask(2)'+'');
    86: smtr10bn5('', 'subtask(1)'+'');
    87: smtr10bn5('', 'subtask(2)'+'');
    88: smtr10bn6('', '');
    89: smtr10bn7('', 'subtask(1)'+'');
    90: smtr10bn7('', 'subtask(2)'+'');
    91: smtr10bn7('', 'subtask(3)'+'');
    92: smtr10bn8('', 'subtask(1)'+'');
    93: smtr10bn8('', 'subtask(2)'+'');
    94: smtr10bn8('', 'subtask(3)'+'');
    95: smtr10bn8('', 'subtask(4)'+'');
    96: smtr10bn9('', 'subtask(1)'+'');
    97: smtr10bn9('', 'subtask(2)'+'');
    98: smtr10bn9('', 'subtask(3)'+'');
    99: smtr10bn9('', 'subtask(4)'+'');
    100: smtr10bn10('', '');
  end
  else if name = 'STRING' then
  case Num of
     1: sstr60an1('', '');
     2: sstr60an2('', '');
     3: sstr60an3('', '');
     4: sstr60an4('', '');
     5: sstr60an5('', '');
     6: sstr60an6('', '');
     7: sstr60an7('', '');
     8: sstr60an8('', '');
     9: sstr60an9('', '');
    10: sstr60an10('', '');
    11: sstr60an11('', '');
    12: sstr60an12('', '');
    13: sstr60an15('', 'subtask(1)'+'');
    14: sstr60an15('', 'subtask(2)'+'');
    15: sstr60an15('', 'subtask(3)'+'');
    16: sstr60an16('', 'subtask(1)'+'');
    17: sstr60an16('', 'subtask(2)'+'');
    18: sstr60an16('', 'subtask(3)'+'');
    19: sstr60an17('', '');
    20: sstr60an18('', 'subtask(1)'+'');
    21: sstr60an18('', 'subtask(2)'+'');
    22: sstr60an19('', '');
    23: sstr60an20('', '');
    24: sstr60an21('', 'subtask(1)'+'');
    25: sstr60an21('', 'subtask(2)'+'');
    26: sstr60an24('', '');
    27: sstr60an25('', '');
    28: sstr60an26('', '');
    29: sstr60an27('', '');
    30: sstr60an28('', '');
    31: sstr60an29('', '');
    32: sstr60an30('', '');
    33: sstr60an31('', 'subtask(1)'+'');
    34: sstr60an31('', 'subtask(2)'+'');
    35: sstr60an31('', 'subtask(3)'+'');
    36: sstr60an32('', 'subtask(1)'+'');
    37: sstr60an32('', 'subtask(2)'+'');
    38: sstr60an32('', 'subtask(3)'+'');
    39: sstr60an33('', 'subtask(1)'+'');
    40: sstr60an33('', 'subtask(2)'+'');
    41: sstr60an35('', '');
    42: sstr60an36('', 'subtask(1)'+'');
    43: sstr60an36('', 'subtask(2)'+'');
    44: sstr60an37('', '');
    45: sstr60an38('', 'subtask(1)'+'');
    46: sstr60an38('', 'subtask(2)'+'');
    47: sstr60an39('', '');
    48: sstr60an40('', 'subtask(1)'+'');
    49: sstr60an40('', 'subtask(2)'+'');
    50: sstr60an41('', '');
    51: sstr60an42('', '');
    52: sstr60an43('', '');
    53: sstr60an44('', 'subtask(1)'+'');
    54: sstr60an44('', 'subtask(2)'+'');
    55: sstr60an45('', 'subtask(1)'+'');
    56: sstr60an45('', 'subtask(2)'+'');
    57: sstr60an46('', '');
    58: sstr60an48('', 'subtask(1)'+'');
    59: sstr60an48('', 'subtask(2)'+'');
    60: sstr60an49('', 'subtask(1)'+'');
    61: sstr60an49('', 'subtask(2)'+'');
    62: sstr60an50('', '');
    63: sstr60an51('', '');
    64: sstr60an52('', '');
    65: sstr60an53('', '');
    66: sstr60an54('', '');
    67: sstr60an55('', '');
    68: sstr60an56('', '');
    69: sstr60an57('', '');
    70: sstr60an58('', '');
  end
  else if name= 'FILE' then
    case Num of
     1: SFil45An1('', '');
     2: SFil45An2('', '');
     3: SFil45An3('', '');
     4: SFil45An4('', '');
     5: SFil45An5('', '');
     6: SFil45An6('', '');
     7: SFil45An7('', '');
     8: SFil45An8('', 'subtask(1)'+'');
     9: SFil45An8('', 'subtask(2)'+'');
    10: SFil45An9('', '');
    11: SFil45An10('', '');
    12: SFil45An11('', 'subtask(1)'+'');
    13: SFil45An11('', 'subtask(2)'+'');
    14: SFil45An12('', 'subtask(1)'+'');
    15: SFil45An12('', 'subtask(2)'+'');
    16: SFil45An13('', '');
    17: SFil45An14('', '');
    18: SFil45An15('', 'subtask(1)'+'');
    19: SFil45An15('', 'subtask(2)'+'');
    20: SFil45An15('', 'subtask(3)'+'');
    21: SFil45An16('', 'subtask(1)'+'');
    22: SFil45An16('', 'subtask(2)'+'');
    23: SFil45An17('', 'subtask(1)'+'');
    24: SFil45An17('', 'subtask(2)'+'');
    25: SFil45An19('', '');
    26: SFil45An20('', '');
    27: SFil45An21('', '');
    28: SFil45An22('', '');
    29: SFil45An23('', 'subtask(1)'+'');
    30: SFil45An23('', 'subtask(2)'+'');
    31: SFil45An23('', 'subtask(3)'+'');
    32: SFil45An23('', 'subtask(4)'+'');
    33: SFil45An24('', 'subtask(1)'+'');
    34: SFil45An24('', 'subtask(2)'+'');
    35: SFil45An25('', 'subtask(1)'+'');
    36: SFil45An25('', 'subtask(2)'+'');
    37: SFil45An25('', 'subtask(3)'+'');
    38: SFil45An26('', 'subtask(1)'+'');
    39: SFil45An26('', 'subtask(2)'+'');
    40: SFil45An26('', 'subtask(3)'+'');
    41: SFil45An27('', '');
    42: SFil45An29('', '');
    43: SFil45An30('', '');
    44: SFil45An31('', 'subtask(1)'+'');
    45: SFil45An31('', 'subtask(2)'+'');
    46: SFil45An32('', '');
    47: SFil45An33('', '');
    48: SFil45An35('', '');
    49: SFil45An36('', '');
    50: SFil45An37('', '');
    51: SFil45An38('', '');
    52: SFil45An39('', '');
    53: SFil45An40('', '');
    54: SFil45An41('', '');
    55: SFil45An42('', '');
    56: SFil45An43('', '');
    57: SFil45An44('', '');
    58: SFil25Bn1('', 'subtask(1)'+'');
    59: SFil25Bn2('', 'subtask(2)'+'');
    60: SFil25Bn2('', 'subtask(1)'+'');
    61: SFil25Bn1('', 'subtask(2)'+'');
    62: SFil25Bn3('', '');
    63: SFil25Bn4('', '');
    64: SFil25Bn5('', 'subtask(1)'+'');
    65: SFil25Bn5('', 'subtask(2)'+'');
    66: SFil25Bn6('', '');
    67: SFil25Bn7('', '');
    68: SFil25Bn8('', '');
    69: SFil25Bn9('', 'subtask(1)'+'');
    70: SFil25Bn9('', 'subtask(2)'+'');
    71: SFil25Bn10('', 'subtask(1)'+'');
    72: SFil25Bn10('', 'subtask(2)'+'');
    73: SFil25Bn11('', '');
    74: SFil25Bn13('', '');
    75: SFil25Bn14('', '');
    76: SFil25Bn15('', '');
    77: SFil25Bn16('', '');
    78: SFil25Bn17('', '');
    79: SFil25Bn18('', '');
    80: SFil25Bn19('', 'subtask(1)'+'');
    81: SFil25Bn19('', 'subtask(2)'+'');
    82: SFil25Bn19('', 'subtask(3)'+'');
    83: SFil25Bn20('', 'subtask(1)'+'');
    84: SFil25Bn20('', 'subtask(2)'+'');
    85: SFil25Bn20('', 'subtask(3)'+'');
    86: SFil25Bn21('', 'subtask(1)'+'');
    87: SFil25Bn21('', 'subtask(2)'+'');
    88: SFil25Bn21('', 'subtask(3)'+'');
    89: SFil25Bn22('', 'subtask(1)'+'');
    90: SFil25Bn22('', 'subtask(2)'+'');
  end
  else if name= 'TEXT' then
  case Num of
     1: STxt50An1('', '');
     2: STxt50An2('', 'subtask(1)'+'');
     3: STxt50An2('', 'subtask(2)'+'');
     4: STxt50An3('', '');
     5: STxt50An4('', 'subtask(1)'+'');
     6: STxt50An4('', 'subtask(2)'+'');
     7: STxt50An4('', 'subtask(3)'+'');
     8: STxt50An4('', 'subtask(4)'+'');
     9: STxt50An5('', 'subtask(1)'+'');
    10: STxt50An5('', 'subtask(2)'+'');
    11: STxt50An6('', 'subtask(1)'+'');
    12: STxt50An6('', 'subtask(2)'+'');
    13: STxt50An7('', 'subtask(1)'+'');
    14: STxt50An7('', 'subtask(2)'+'');
    15: STxt50An8('', '');
    16: STxt50An9('', '');
    17: STxt50An10('', '');
    18: STxt50An11('', '');
    19: STxt50An12('', 'subtask(1)'+'');
    20: STxt50An12('', 'subtask(2)'+'');
    21: STxt50An13('', '');
    22: STxt50An14('', '');
    23: STxt50An15('', '');
    24: STxt50An17('', '');
    25: STxt50An18('', '');
    26: STxt50An19('', '');
    27: STxt50An20('', '');
    28: STxt50An21('', '');
    29: STxt50An23('', 'subtask(1)'+'');
    30: STxt50An23('', 'subtask(2)'+'');
    31: STxt50An24('', '');
    32: STxt50An25('', 'subtask(1)'+'');
    33: STxt50An25('', 'subtask(2)'+'');
    34: STxt50An27('', '');
    35: STxt50An28('', 'subtask(1)'+'');
    36: STxt50An28('', 'subtask(2)'+'');
    37: STxt50An29('', '');
    38: STxt50An30('', '');
    39: STxt50An31('', '');
    40: STxt50An33('', 'subtask(1)'+'');
    41: STxt50An33('', 'subtask(2)'+'');
    42: STxt50An34('', '');
    43: STxt50An35('', '');
    44: STxt50An36('', '');
    45: STxt50An37('', 'subtask(1)'+'');
    46: STxt50An37('', 'subtask(2)'+'');
    47: STxt50An37('', 'subtask(3)'+'');
    48: STxt50An37('', 'subtask(4)'+'');
    49: STxt50An38('', '');
    50: STxt50An39('', '');
    51: STxt50An40('', '');
    52: STxt50An41('', '');
    53: STxt50An43('', '');
    54: STxt50An44('', 'subtask(1)'+'');
    55: STxt50An44('', 'subtask(2)'+'');
    56: STxt50An44('', 'subtask(3)'+'');
    57: STxt50An45('', '');
    58: STxt50An46('', '');
    59: STxt50An47('', '');
    60: STxt50An48('', '');
  end
  else if name = 'PARAM' then
  case Num of
     1: SPar40An1('', '');
     2: SPar40An2('', '');
     3: SPar40An3('', '');
     4: SPar40An4('', '');
     5: SPar40An5('', 'subtask(1)'+'');
     6: SPar40An5('', 'subtask(2)'+'');
     7: SPar40An6('', '');
     8: SPar40An7('', '');
     9: SPar40An8('', '');
    10: SPar40An9('', '');
    11: SPar40An10('', 'subtask(1)'+'');
    12: SPar40An10('', 'subtask(2)'+'');
    13: SPar40An11('', '');
    14: SPar40An12('', 'subtask(1)'+'');
    15: SPar40An12('', 'subtask(2)'+'');
    16: SPar40An13('', '');
    17: SPar40An14('', '');
    18: SPar40An15('', '');
    19: SPar40An16('', 'subtask(1)'+'');
    20: SPar40An16('', 'subtask(2)'+'');
    21: SPar40An17('', 'subtask(1)'+'');
    22: SPar40An17('', 'subtask(2)'+'');
    23: SPar40An18('', 'subtask(1)'+'');
    24: SPar40An18('', 'subtask(2)'+'');
    25: SPar40An19('', '');
    26: SPar40An20('', 'subtask(1)'+'');
    27: SPar40An20('', 'subtask(2)'+'');
    28: SPar40An21('', '');
    29: SPar40An22('', '');
    30: SPar40An24('', '');
    31: SPar40An25('', '');
    32: SPar40An26('', 'subtask(1)'+'');
    33: SPar40An26('', 'subtask(2)'+'');
    34: SPar40An27('', 'subtask(1)'+'');
    35: SPar40An27('', 'subtask(2)'+'');
    36: SPar40An28('', '');
    37: SPar40An29('', '');
    38: SPar40An30('', '');
    39: SPar40An31('', '');
    40: SPar40An32('', '');
    41: SPar40An33('', '');
    42: SPar40An34('', '');
    43: SPar40An35('', '');
    44: SPar40An36('', 'subtask(1)'+'');
    45: SPar40An36('', 'subtask(2)'+'');
    46: SPar40An37('', 'subtask(1)'+'');
    47: SPar40An37('', 'subtask(2)'+'');
    48: SPar30Bn8('', '');
    49: SPar30Bn9('', '');
    50: SPar30Bn10('', '');
    51: SPar30Bn11('', '');
    52: SPar30Bn12('', '');
    53: SPar30Bn13('', '');
    54: SPar30Bn14('', '');
    55: SPar30Bn15('', 'subtask(1)'+'');
    56: SPar30Bn15('', 'subtask(2)'+'');
    57: SPar30Bn16('', '');
    58: SPar30Bn17('', '');
    59: SPar30Bn20('', '');
    60: SPar30Bn21('', '');
    61: SPar30Bn22('', '');
    62: SPar30Bn23('', 'subtask(1)'+'');
    63: SPar30Bn23('', 'subtask(2)'+'');
    64: SPar30Bn24('', '');
    65: SPar30Bn25('', '');
    66: SPar30Bn26('', '');
    67: SPar30Bn27('', '');
    68: SPar30Bn28('', '');
    69: SPar30Bn29('', 'subtask(1)'+'');
    70: SPar30Bn29('', 'subtask(2)'+'');
  end
  else if name = 'RECUR' then
  case Num of
     1: SRec30An1('', '');
     2: SRec30An2('', '');
     3: SRec30An3('', '');
     4: SRec30An4('', 'subtask(1)'+'');
     5: SRec30An4('', 'subtask(2)'+'');
     6: SRec30An5('', '');
     7: SRec30An6('', '');
     8: SRec30An7('', '');
     9: SRec30An8('', '');
    10: SRec30An9('', '');
    11: SRec30An10('', 'subtask(1)'+'');
    12: SRec30An10('', 'subtask(2)'+'');
    13: SRec30An11('', '');
    14: SRec30An13('', '');
    15: SRec30An14('', '');
    16: SRec30An15('', '');
    17: SRec30An16('', '');
    18: SRec30An17('', '');
    19: SRec30An18('', '');
    20: SRec30An19('', '');
    21: SRec30An20('', '');
    22: SRec30An21('', '');
    23: SRec30An22('', '');
    24: SRec30An23('', '');
    25: SRec30An25('', '');
    26: SRec30An26('', '');
    27: SRec30An27('', '');
    28: SRec30An28('', '');
    29: SRec30An29('', '');
    30: SRec30An30('', '');
  end;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;


begin
end.
