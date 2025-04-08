{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5_en;

{$MODE Delphi}

interface

function InitGroup_(var name, code: string; lang: integer): integer;  // returns the number of tasks
function InitTask_(num, test: Integer): integer;     // returns the number of tests
procedure Activate_(dllname: string);

implementation

uses SysUtils, PT5TaskMaker, 
     SBeg95C4, SIfc60C4, SFor65C4, SPrc55C4, SFun60C4,
     _SMin60C4z, _SArr65c4z, _SArr45d4z, _smtr45c4z, _smtr10d4z, sstr60c4,
     SFil45C4, SFil25D4, STxt50C4, SPar40C4, SPar30D4, SRec30C4;


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
    SetGroupData('Begin', 'Input-output and assignment', 'M. E. Abramyan, 2007, 2012', GBeginKM, 40)
  else if name0 = 'INTEGER' then
    SetGroupData('Integer', 'Integers', 'M. E. Abramyan, 2007, 2012', GIntegerKM, 30)
  else if name0 = 'BOOLEAN' then
    SetGroupData('Boolean', 'Logical expressions', 'M. E. Abramyan, 2007, 2012', GBooleanKM, 40)
  else if name0 = 'IF' then
    SetGroupData('If', 'Conditional statement', 'M. E. Abramyan, 2007, 2012', GIfKM, 30)
  else if name0 = 'CASE' then
    SetGroupData('Case', 'Selection statement', 'M. E. Abramyan, 2007, 2012', GCaseKM, 20)
  else if name0 = 'FOR' then
    SetGroupData('For', 'Loop with the parameter', 'M. E. Abramyan, 2007, 2012', GForKM, 40)
  else if name0 = 'WHILE' then
    SetGroupData('While', 'Loop with the condition', 'M. E. Abramyan, 2007, 2012', GWhileKM, 30)
  else if (name0 = 'PROC') and (lang and (lgPython+lgRuby+lgJulia) = 0) then
    SetGroupData('Proc', 'Procedures and functions', 'M. E. Abramyan, 2007, 2012', GProcKM, 60)
  else if (name0 = 'FUNC') and (lang and (lgPython+lgRuby+lgJulia) <> 0) then
    SetGroupData('Func', 'Functions', 'M. E. Abramyan, 2007, 2012', GFuncKM, 60)
  else if name0 = 'ZSERIES' then
    SetGroupData('ZSeries', 'Numerical sequences', 'M. E. Abramyan, 2007, 2012', GSeriesKM, 40)
  else if name0 = 'ZMINMAX' then
    SetGroupData('ZMinmax', 'Minimums and maximums', 'M. E. Abramyan, 2007, 2012', GMinmaxKM, 30)
  else if name0 = 'ZARRAY' then
    SetGroupData('ZArray', 'One-dimensional arrays', 'M. E. Abramyan, 2007, 2012', GArrayKM, 140)
  else if name0 = 'ZMATRIX' then
    SetGroupData('ZMatrix', 'Two-dimensional arrays (matrices)', 'M. E. Abramyan, 2007, 2012', GMatrixKM, 100)
  else if name0 = 'STRING' then
    SetGroupData('String', 'Characters and strings', 'M. E. Abramyan, 2007, 2012', GStringKM, 70)
  else if name0 = 'FILE' then
    SetGroupData('File', 'Binary files', 'M. E. Abramyan, 2007, 2012', GFileKM, 90)
  else if name0 = 'TEXT' then
    SetGroupData('Text', 'Text files', 'M. E. Abramyan, 2007, 2012', GTextKM, 60)
  else if name0 = 'PARAM' then
    SetGroupData('Param', 'Structured data types in procedures and functions', 'M. E. Abramyan, 2007, 2012', GParamKM, 70)
  else if name0 = 'RECUR' then
    SetGroupData('Recur', 'Recursion', 'M. E. Abramyan, 2007, 2012', GRecurKM, 30);
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
     1: SBeg95Cn1('', 'subtask(1)');
     2: SBeg95Cn1('', 'subtask(2)');
     3: SBeg95Cn2('', '');
     4: SBeg95Cn3('', '');
     5: SBeg95Cn4('', '');
     6: SBeg95Cn5('', '');
     7: SBeg95Cn6('', '');
     8: SBeg95Cn7('', 'subtask(1)');
     9: SBeg95Cn7('', 'subtask(2)');
    10: SBeg95Cn8('', '');
    11: SBeg95Cn9('', '');
    12: SBeg95Cn10('', '');
    13: SBeg95Cn11('', '');
    14: SBeg95Cn12('', 'subtask(1)');
    15: SBeg95Cn12('', 'subtask(2)');
    16: SBeg95Cn13('', '');
    17: SBeg95Cn14('', '');
    18: SBeg95Cn15('', '');
    19: SBeg95Cn16('', '');
    20: SBeg95Cn17('', '');
    21: SBeg95Cn18('', '');
    22: SBeg95Cn19('', '');
    23: SBeg95Cn20('', 'subtask(1)');
    24: SBeg95Cn20('', 'subtask(2)');
    25: SBeg95Cn21('', 'subtask(1)');
    26: SBeg95Cn21('', 'subtask(2)');
    27: SBeg95Cn22('', '');
    28: SBeg95Cn23('', '');
    29: SBeg95Cn24('', 'subtask(1)');
    30: SBeg95Cn24('', 'subtask(2)');
    31: SBeg95Cn25('', 'subtask(1)');
    32: SBeg95Cn25('', 'subtask(2)');
    33: SBeg95Cn26('', 'subtask(1)');
    34: SBeg95Cn26('', 'subtask(2)');
    35: SBeg95Cn27('', '');
    36: SBeg95Cn28('', 'subtask(1)');
    37: SBeg95Cn28('', 'subtask(2)');
    38: SBeg95Cn29('', '');
    39: SBeg95Cn30('', '');
    40: SBeg95Cn31('', '');
  end
  else if name = 'INTEGER' then
    case Num of
     1: SBeg95Cn37('', 'subtask(1)'+'');
     2: SBeg95Cn37('', 'subtask(2)'+'');
     3: SBeg95Cn38('', '');
     4: SBeg95Cn39('', 'subtask(1)'+'');
     5: SBeg95Cn39('', 'subtask(2)'+'');
     6: SBeg95Cn40('', '');
     7: SBeg95Cn41('', '');
     8: SBeg95Cn42('', '');
     9: SBeg95Cn43('', '');
    10: SBeg95Cn44('', '');
    11: SBeg95Cn45('', '');
    12: SBeg95Cn46('', '');
    13: SBeg95Cn47('', 'subtask(1)'+'');
    14: SBeg95Cn47('', 'subtask(2)'+'');
    15: SBeg95Cn48('', 'subtask(1)'+'');
    16: SBeg95Cn48('', 'subtask(2)'+'');
    17: SBeg95Cn49('', 'subtask(1)'+'');
    18: SBeg95Cn49('', 'subtask(2)'+'');
    19: SBeg95Cn50('', '');
    20: SBeg95Cn51('', '');
    21: SBeg95Cn52('', 'subtask(1)'+'');
    22: SBeg95Cn52('', 'subtask(2)'+'');
    23: SBeg95Cn52('', 'subtask(3)'+'');
    24: SBeg95Cn53('', '');
    25: SBeg95Cn54('', '');
    26: SBeg95Cn55('', '');
    27: SBeg95Cn56('', '');
    28: SBeg95Cn57('', '');
    29: SBeg95Cn58('', '');
    30: SBeg95Cn59('', '');
  end
  else if name = 'BOOLEAN' then
    case Num of
       1: SBeg95Cn61('', '');
       2: SBeg95Cn62('', 'subtask(1)'+'');
       3: SBeg95Cn62('', 'subtask(2)'+'');
       4: SBeg95Cn63('', 'subtask(1)'+'');
       5: SBeg95Cn63('', 'subtask(2)'+'');
       6: SBeg95Cn64('', '');
       7: SBeg95Cn65('', '');
       8: SBeg95Cn66('', '');
       9: SBeg95Cn67('', '');
      10: SBeg95Cn68('', '');
      11: SBeg95Cn69('', '');
      12: SBeg95Cn70('', '');
      13: SBeg95Cn71('', '');
      14: SBeg95Cn72('', '');
      15: SBeg95Cn73('', '');
      16: SBeg95Cn74('', 'subtask(1)'+'');
      17: SBeg95Cn74('', 'subtask(2)'+'');
      18: SBeg95Cn75('', 'subtask(1)'+'');
      19: SBeg95Cn75('', 'subtask(2)'+'');
      20: SBeg95Cn76('', '');
      21: SBeg95Cn77('', '');
      22: SBeg95Cn78('', '');
      23: SBeg95Cn79('', '');
      24: SBeg95Cn80('', '');
      25: SBeg95Cn81('', 'subtask(1)'+'');
      26: SBeg95Cn81('', 'subtask(2)'+'');
      27: SBeg95Cn82('', 'subtask(1)'+'');
      28: SBeg95Cn82('', 'subtask(2)'+'');
      29: SBeg95Cn83('', '');
      30: SBeg95Cn84('', '');
      31: SBeg95Cn85('', '');
      32: SBeg95Cn86('', '');
      33: SBeg95Cn87('', '');
      34: SBeg95Cn88('', '');
      35: SBeg95Cn89('', '');
      36: SBeg95Cn90('', '');
      37: SBeg95Cn91('', '');
      38: SBeg95Cn92('', '');
      39: SBeg95Cn93('', '');
      40: SBeg95Cn94('', '');
    end
  else if name = 'IF' then
  case Num of
     1: SIfc60Cn1('', '');
     2: SIfc60Cn2('', '');
     3: SIfc60Cn3('', '');
     4: SIfc60Cn4('', '');
     5: SIfc60Cn5('', '');
     6: SIfc60Cn6('', '');
     7: SIfc60Cn7('', '');
     8: SIfc60Cn8('', '');
     9: SIfc60Cn9('', '');
    10: SIfc60Cn10('', '');
    11: SIfc60Cn11('', '');
    12: SIfc60Cn12('', '');
    13: SIfc60Cn13('', '');
    14: SIfc60Cn14('', '');
    15: SIfc60Cn15('', '');
    16: SIfc60Cn16('', '');
    17: SIfc60Cn17('', '');
    18: SIfc60Cn18('', '');
    19: SIfc60Cn19('', '');
    20: SIfc60Cn20('', '');
    21: SIfc60Cn21('', '');
    22: SIfc60Cn22('', '');
    23: SIfc60Cn23('', '');
    24: SIfc60Cn24('', '');
    25: SIfc60Cn25('', '');
    26: SIfc60Cn26('', '');
    27: SIfc60Cn27('', '');
    28: SIfc60Cn28('', '');
    29: SIfc60Cn29('', '');
    30: SIfc60Cn30('', '');
  end
  else if name = 'CASE' then
  case Num of
     1: SIfc60Cn32('', '');
     2: SIfc60Cn33('', '');
     3: SIfc60Cn34('', '');
     4: SIfc60Cn35('', '');
     5: SIfc60Cn36('', '');
     6: SIfc60Cn37('', '');
     7: SIfc60Cn38('', '');
     8: SIfc60Cn39('', '');
     9: SIfc60Cn40('', '');
    10: SIfc60Cn41('', '');
    11: SIfc60Cn42('', '');
    12: SIfc60Cn43('', '');
    13: SIfc60Cn44('', '');
    14: SIfc60Cn45('', '');
    15: SIfc60Cn46('', '');
    16: SIfc60Cn47('', '');
    17: SIfc60Cn48('', '');
    18: SIfc60Cn49('', '');
    19: SIfc60Cn50('', '');
    20: SIfc60Cn51('', '');
  end
  else if name= 'FOR' then
  case Num of
     1: SFor65Cn1('', '');
     2: SFor65Cn2('', '');
     3: SFor65Cn3('', '');
     4: SFor65Cn4('', '');
     5: SFor65Cn5('', '');
     6: SFor65Cn6('', '');
     7: SFor65Cn7('', '');
     8: SFor65Cn8('', '');
     9: SFor65Cn9('', '');
    10: SFor65Cn10('', '');
    11: SFor65Cn11('', '');
    12: SFor65Cn12('', '');
    13: SFor65Cn13('', '');
    14: SFor65Cn14('', '');
    15: SFor65Cn15('', '');
    16: SFor65Cn16('', '');
    17: SFor65Cn17('', '');
    18: SFor65Cn18('', '');
    19: SFor65Cn19('', '');
    20: SFor65Cn20('', '');
    21: SFor65Cn21('', '');
    22: SFor65Cn22('', '');
    23: SFor65Cn23('', 'subtask(1)'+'');
    24: SFor65Cn23('', 'subtask(2)'+'');
    25: SFor65Cn24('', 'subtask(1)'+'');
    26: SFor65Cn24('', 'subtask(2)'+'');
    27: SFor65Cn25('', 'subtask(1)'+'');
    28: SFor65Cn25('', 'subtask(2)'+'');
    29: SFor65Cn26('', '');
    30: SFor65Cn27('', '');
    31: SFor65Cn28('', 'subtask(1)'+'');
    32: SFor65Cn28('', 'subtask(2)'+'');
    33: SFor65Cn29('', '');
    34: SFor65Cn30('', '');
    35: SFor65Cn31('', '');
    36: SFor65Cn33('', '');
    37: SFor65Cn34('', 'subtask(1)'+'');
    38: SFor65Cn34('', 'subtask(2)'+'');
    39: SFor65Cn35('', '');
    40: SFor65Cn36('', '');
  end
  else if name = 'WHILE' then
  case Num of
     1: SFor65Cn38('', 'subtask(1)'+'');
     2: SFor65Cn38('', 'subtask(2)'+'');
     3: SFor65Cn39('', '');
     4: SFor65Cn40('', '');
     5: SFor65Cn41('', '');
     6: SFor65Cn42('', '');
     7: SFor65Cn43('', '');
     8: SFor65Cn44('', '');
     9: SFor65Cn45('', '');
    10: SFor65Cn46('', '');
    11: SFor65Cn47('', '');
    12: SFor65Cn48('', '');
    13: SFor65Cn49('', '');
    14: SFor65Cn50('', '');
    15: SFor65Cn51('', '');
    16: SFor65Cn52('', '');
    17: SFor65Cn53('', '');
    18: SFor65Cn54('', '');
    19: SFor65Cn55('', '');
    20: SFor65Cn56('', 'subtask(1)'+'');
    21: SFor65Cn56('', 'subtask(2)'+'');
    22: SFor65Cn57('', '');
    23: SFor65Cn58('', '');
    24: SFor65Cn59('', '');
    25: SFor65Cn60('', '');
    26: SFor65Cn61('', '');
    27: SFor65Cn62('', '');
    28: SFor65Cn63('', '');
    29: SFor65Cn64('', '');
    30: SFor65Cn65('', '');
  end
  else if name = 'PROC' then
  case Num of
     1: SPrc55Cn1('', '');
     2: SPrc55Cn2('', '');
     3: SPrc55Cn3('', '');
     4: SPrc55Cn4('', '');
     5: SPrc55Cn5('', '');
     6: SPrc55Cn6('', '');
     7: SPrc55Cn7('', '');
     8: SPrc55Cn8('', '');
     9: SPrc55Cn9('', '');
    10: SPrc55Cn10('', '');
    11: SPrc55Cn11('', '');
    12: SPrc55Cn12('', 'subtask(1)'+'');
    13: SPrc55Cn12('', 'subtask(2)'+'');
    14: SPrc55Cn13('', 'subtask(1)'+'');
    15: SPrc55Cn13('', 'subtask(2)'+'');
    16: SPrc55Cn17('', '');
    17: SPrc55Cn18('', '');
    18: SPrc55Cn19('', '');
    19: SPrc55Cn20('', '');
    20: SPrc55Cn21('', '');
    21: SPrc55Cn22('', '');
    22: SPrc55Cn23('', '');
    23: SPrc55Cn24('', '');
    24: SPrc55Cn25('', '');
    25: SPrc55Cn26('', '');
    26: SPrc55Cn27('', '');
    27: SPrc55Cn28('', '');
    28: SPrc55Cn29('', '');
    29: SPrc55Cn30('', '');
    30: SPrc55Cn31('', '');
    31: SPrc55Cn32('', '');
    32: SPrc55Cn33('', 'subtask(1)'+'');
    33: SPrc55Cn33('', 'subtask(2)'+'');
    34: SPrc55Cn34('', '');
    35: SPrc55Cn35('', '');
    36: SPrc55Cn36('', '');
    37: SPrc55Cn39('', '');
    38: SPrc55Cn40('', '');
    39: SPrc55Cn41('', '');
    40: SPrc55Cn42('', '');
    41: SPrc55Cn43('', 'subtask(1)'+'');
    42: SPrc55Cn43('', 'subtask(2)'+'');
    43: SPrc55Cn44('', 'subtask(1)'+'');
    44: SPrc55Cn44('', 'subtask(2)'+'');
    45: SPrc55Cn45('', '');
    46: SPrc55Cn46('', '');
    47: SPrc55Cn47('', '');
    48: SPrc55Cn48('', '');
    49: SPrc55Cn49('', '');
    50: SPrc55Cn50('', '');
    51: SPrc55Cn51('', '');
    52: SPrc55Cn52('', '');
    53: SPrc55Cn53('', '');
    54: SPrc55Cn54('', 'subtask(1)'+'');
    55: SPrc55Cn54('', 'subtask(2)'+'');
    56: SPar30Dn1('', '');
    57: SPar30Dn2('', '');
    58: SPar30Dn3('', '');
    59: SPar30Dn4('', '');
    60: SPar30Dn5('', '');
  end
  else if name = 'FUNC' then
    case Num of
     1: SFun60Cn17('', '');
     2: SFun60Cn18('', '');
     3: SFun60Cn19('', '');
     4: SFun60Cn20('', '');
     5: SFun60Cn21('', '');
     6: SFun60Cn22('', '');
     7: SFun60Cn23('', '');
     8: SFun60Cn24('', '');
     9: SFun60Cn25('', '');
    10: SFun60Cn26('', '');
    11: SFun60Cn27('', '');
    12: SFun60Cn28('', '');
    13: SFun60Cn29('', '');
    14: SFun60Cn30('', '');
    15: SFun60Cn31('', '');
    16: SFun60Cn32('', '');
    17: SFun60Cn33('', 'subtask(1)'+'');
    18: SFun60Cn33('', 'subtask(2)'+'');
    19: SFun60Cn34('', '');
    20: SFun60Cn35('', '');
    21: SFun60Cn36('', '');
    22: SFun60Cn1('', '');
    23: SFun60Cn2('', '');
    24: SFun60Cn3('', '');
    25: SFun60Cn4('', '');
    26: SFun60Cn5('', '');
    27: SFun60Cn6('', '');
    28: SFun60Cn7('', '');
    29: SFun60Cn8('', '');
    30: SFun60Cn9('', '');
    31: SFun60Cn10('', '');
    32: SFun60Cn11('', '');
    33: SFun60Cn12('', 'subtask(1)'+'');
    34: SFun60Cn12('', 'subtask(2)'+'');
    35: SFun60Cn13('', 'subtask(1)'+'');
    36: SFun60Cn13('', 'subtask(2)'+'');
    37: SFun60Cn39('', '');
    38: SFun60Cn40('', '');
    39: SFun60Cn41('', '');
    40: SFun60Cn42('', '');
    41: SFun60Cn43('', 'subtask(1)'+'');
    42: SFun60Cn43('', 'subtask(2)'+'');
    43: SFun60Cn44('', 'subtask(1)'+'');
    44: SFun60Cn44('', 'subtask(2)'+'');
    45: SFun60Cn45('', '');
    46: SFun60Cn46('', '');
    47: SFun60Cn47('', '');
    48: SFun60Cn48('', '');
    49: SFun60Cn49('', '');
    50: SFun60Cn50('', '');
    51: SFun60Cn51('', '');
    52: SFun60Cn52('', '');
    53: SFun60Cn53('', '');
    54: SFun60Cn54('', 'subtask(1)'+'');
    55: SFun60Cn54('', 'subtask(2)'+'');
    56: SFun60Cn56('', '');
    57: SFun60Cn57('', '');
    58: SFun60Cn58('', '');
    59: SFun60Cn59('', '');
    60: SFun60Cn60('', '');
  end
  else if name = 'ZSERIES' then
  case Num of
     1: SMin60Cn1('', '');
     2: SMin60Cn2('', 'subtask(1)'+'');
     3: SMin60Cn2('', 'subtask(2)'+'');
     4: SMin60Cn3('', '');
     5: SMin60Cn4('', 'subtask(1)'+'');
     6: SMin60Cn4('', 'subtask(2)'+'');
     7: SMin60Cn4('', 'subtask(3)'+'');
     8: SMin60Cn5('', 'subtask(1)'+'');
     9: SMin60Cn5('', 'subtask(2)'+'');
    10: SMin60Cn6('', '');
    11: SMin60Cn7('', '');
    12: SMin60Cn8('', '');
    13: SMin60Cn9('', '');
    14: SMin60Cn10('', '');
    15: SMin60Cn11('', '');
    16: SMin60Cn12('', '');
    17: SMin60Cn13('', '');
    18: SMin60Cn14('', '');
    19: SMin60Cn15('', '');
    20: SMin60Cn16('', '');
    21: SMin60Cn17('', '');
    22: SMin60Cn18('', '');
    23: SMin60Cn19('', '');
    24: SMin60Cn20('', '');
    25: SMin60Cn21('', '');
    26: SMin60Cn23('', '');
    27: SMin60Cn24('', '');
    28: SMin60Cn25('', '');
    29: SMin60Cn26('', '');
    30: SMin60Cn27('', '');
    31: SMin60Cn28('', '');
    32: SMin60Cn29('', '');
    33: SMin60Cn30('', '');
    34: SMin60Cn31('', '');
    35: SMin60Cn32('', '');
    36: SMin60Cn33('', 'subtask(1)'+'');
    37: SMin60Cn33('', 'subtask(2)'+'');
    38: SMin60Cn34('', '');
    39: SMin60Cn35('', '');
    40: SMin60Cn36('', '');
  end
  else if name = 'ZMINMAX' then
  case Num of
     1: SMin60Cn38('', '');
     2: SMin60Cn39('', 'subtask(1)'+'');
     3: SMin60Cn39('', 'subtask(2)'+'');
     4: SMin60Cn40('', '');
     5: SMin60Cn41('', '');
     6: SMin60Cn42('', '');
     7: SMin60Cn43('', '');
     8: SMin60Cn44('', 'subtask(1)'+'');
     9: SMin60Cn44('', 'subtask(2)'+'');
    10: SMin60Cn45('', 'subtask(1)'+'');
    11: SMin60Cn45('', 'subtask(2)'+'');
    12: SMin60Cn46('', '');
    13: SMin60Cn47('', '');
    14: SMin60Cn48('', 'subtask(1)'+'');
    15: SMin60Cn48('', 'subtask(2)'+'');
    16: SMin60Cn49('', 'subtask(1)'+'');
    17: SMin60Cn49('', 'subtask(2)'+'');
    18: SMin60Cn49('', 'subtask(3)'+'');
    19: SMin60Cn50('', '');
    20: SMin60Cn51('', '');
    21: SMin60Cn52('', '');
    22: SMin60Cn53('', '');
    23: SMin60Cn54('', '');
    24: SMin60Cn55('', '');
    25: SMin60Cn56('', '');
    26: SMin60Cn57('', '');
    27: SMin60Cn58('', 'subtask(1)'+'');
    28: SMin60Cn58('', 'subtask(2)'+'');
    29: SMin60Cn59('', 'subtask(1)'+'');
    30: SMin60Cn59('', 'subtask(2)'+'');
  end
  else if name= 'ZARRAY' then
  case Num of
     1: SArr65Cn1('', '');
     2: SArr65Cn2('', '');
     3: SArr65Cn3('', '');
     4: SArr65Cn4('', '');
     5: SArr65Cn5('', '');
     6: SArr65Cn6('', '');
     7: SArr65Cn9('', '');
     8: SArr65Cn10('', 'subtask(1)'+'');
     9: SArr65Cn10('', 'subtask(2)'+'');
    10: SArr65Cn11('', '');
    11: SArr65Cn12('', '');
    12: SArr65Cn13('', 'subtask(1)'+'');
    13: SArr65Cn13('', 'subtask(2)'+'');
    14: SArr65Cn14('', 'subtask(1)'+'');
    15: SArr65Cn14('', 'subtask(2)'+'');
    16: SArr65Cn15('', '');
    17: SArr65Cn16('', '');
    18: SArr65Cn18('', 'subtask(1)'+'');
    19: SArr65Cn18('', 'subtask(2)'+'');
    20: SArr65Cn19('', 'subtask(1)'+'');
    21: SArr65Cn19('', 'subtask(2)'+'');
    22: SArr65Cn20('', 'subtask(1)'+'');
    23: SArr65Cn20('', 'subtask(2)'+'');
    24: SArr65Cn21('', 'subtask(1)'+'');
    25: SArr65Cn21('', 'subtask(2)'+'');
    26: SArr65Cn22('', 'subtask(1)'+'');
    27: SArr65Cn22('', 'subtask(2)'+'');
    28: SArr65Cn23('', '');
    29: SArr65Cn24('', '');
    30: SArr65Cn25('', 'subtask(1)'+'');
    31: SArr65Cn25('', 'subtask(2)'+'');
    32: SArr65Cn26('', '');
    33: SArr65Cn27('', '');
    34: SArr65Cn28('', 'subtask(1)'+'');
    35: SArr65Cn28('', 'subtask(2)'+'');
    36: SArr65Cn29('', '');
    37: SArr65Cn30('', 'subtask(1)'+'');
    38: SArr65Cn30('', 'subtask(2)'+'');
    39: SArr65Cn31('', '');
    40: SArr65Cn32('', '');
    41: SArr65Cn33('', '');
    42: SArr65Cn34('', '');
    43: SArr65Cn35('', '');
    44: SArr65Cn36('', '');
    45: SArr65Cn37('', '');
    46: SArr65Cn38('', '');
    47: SArr65Cn39('', '');
    48: SArr65Cn40('', '');
    49: SArr65Cn41('', '');
    50: SArr65Cn42('', '');
    51: SArr45Dn16('', '');
    52: SArr45Dn17('', '');
    53: SArr45Dn18('', '');
    54: SArr45Dn19('', '');
    55: SArr45Dn20('', 'subtask(1)'+'');
    56: SArr45Dn20('', 'subtask(2)'+'');
    57: SArr45Dn21('', '');
    58: SArr45Dn22('', 'subtask(1)'+'');
    59: SArr45Dn22('', 'subtask(2)'+'');
    60: SArr45Dn23('', '');
    61: SArr45Dn24('', '');
    62: SArr45Dn25('', '');
    63: SArr45Dn26('', '');
    64: SArr45Dn27('', '');
    65: SArr65Cn44('', '');
    66: SArr65Cn45('', 'subtask(1)'+'');
    67: SArr65Cn45('', 'subtask(2)'+'');
    68: SArr65Cn46('', '');
    69: SArr65Cn47('', '');
    70: SArr65Cn48('', '');
    71: SArr65Cn49('', '');
    72: SArr65Cn50('', 'subtask(1)'+'');
    73: SArr65Cn50('', 'subtask(2)'+'');
    74: SArr65Cn51('', '');
    75: SArr65Cn52('', '');
    76: SArr65Cn53('', 'subtask(1)'+'');
    77: SArr65Cn53('', 'subtask(2)'+'');
    78: SArr65Cn53('', 'subtask(3)'+'');
    79: SArr65Cn54('', '');
    80: SArr65Cn55('', '');
    81: SArr65Cn56('', 'subtask(1)'+'');
    82: SArr65Cn56('', 'subtask(2)'+'');
    83: SArr65Cn57('', 'subtask(1)'+'');
    84: SArr65Cn57('', 'subtask(2)'+'');
    85: SArr65Cn58('', 'subtask(1)'+'');
    86: SArr65Cn58('', 'subtask(2)'+'');
    87: SArr65Cn59('', 'subtask(1)'+'');
    88: SArr65Cn59('', 'subtask(2)'+'');
    89: SArr65Cn60('', '');
    90: SArr65Cn62('', '');
    91: SArr65Cn63('', '');
    92: SArr65Cn64('', '');
    93: SArr65Cn65('', 'subtask(1)'+'');
    94: SArr65Cn65('', 'subtask(2)'+'');
    95: SArr45Dn1('', '');
    96: SArr45Dn2('', 'subtask(1)'+'');
    97: SArr45Dn2('', 'subtask(2)'+'');
    98: SArr45Dn3('', 'subtask(1)'+'');
    99: SArr45Dn3('', 'subtask(2)'+'');
    100: SArr45Dn3('', 'subtask(3)'+'');
    101: SArr45Dn4('', 'subtask(1)'+'');
    102: SArr45Dn4('', 'subtask(2)'+'');
    103: SArr45Dn5('', '');
    104: SArr45Dn6('', 'subtask(1)'+'');
    105: SArr45Dn6('', 'subtask(2)'+'');
    106: SArr45Dn7('', 'subtask(1)'+'');
    107: SArr45Dn7('', 'subtask(2)'+'');
    108: SArr45Dn8('', '');
    109: SArr45Dn9('', 'subtask(1)'+'');
    110: SArr45Dn9('', 'subtask(2)'+'');
    111: SArr45Dn9('', 'subtask(3)'+'');
    112: SArr45Dn11('', '');
    113: SArr45Dn12('', '');
    114: SArr45Dn13('', '');
    115: SArr45Dn14('', '');
    116: SArr45Dn29('', '');
    117: SArr45Dn30('', 'subtask(1)'+'');
    118: SArr45Dn30('', 'subtask(2)'+'');
    119: SArr45Dn31('', 'subtask(1)'+'');
    120: SArr45Dn31('', 'subtask(2)'+'');
    121: SArr45Dn32('', '');
    122: SArr45Dn33('', '');
    123: SArr45Dn34('', 'subtask(1)'+'');
    124: SArr45Dn34('', 'subtask(2)'+'');
    125: SArr45Dn35('', 'subtask(1)'+'');
    126: SArr45Dn35('', 'subtask(2)'+'');
    127: SArr45Dn35('', 'subtask(3)'+'');
    128: SArr45Dn36('', 'subtask(1)'+'');
    129: SArr45Dn36('', 'subtask(2)'+'');
    130: SArr45Dn36('', 'subtask(3)'+'');
    131: SArr45Dn38('', '');
    132: SArr45Dn39('', 'subtask(1)'+'');
    133: SArr45Dn39('', 'subtask(2)'+'');
    134: SArr45Dn40('', '');
    135: SArr45Dn41('', '');
    136: SArr45Dn42('', '');
    137: SArr45Dn43('', 'subtask(1)'+'');
    138: SArr45Dn43('', 'subtask(2)'+'');
    139: SArr45Dn44('', 'subtask(1)'+'');
    140: SArr45Dn44('', 'subtask(2)'+'');
  end
  else if name = 'ZMATRIX' then
  case Num of
     1: SMtr45Cn1('', 'subtask(1)'+'');
     2: SMtr45Cn1('', 'subtask(2)'+'');
     3: SMtr45Cn2('', 'subtask(1)'+'');
     4: SMtr45Cn2('', 'subtask(2)'+'');
     5: SMtr45Cn2('', 'subtask(3)'+'');
     6: SMtr45Cn2('', 'subtask(4)'+'');
     7: SMtr45Cn3('', '');
     8: SMtr45Cn4('', '');
     9: SMtr45Cn5('', 'subtask(1)'+'');
    10: SMtr45Cn5('', 'subtask(2)'+'');
    11: SMtr45Cn6('', 'subtask(1)'+'');
    12: SMtr45Cn6('', 'subtask(2)'+'');
    13: SMtr45Cn7('', 'subtask(1)'+'');
    14: SMtr45Cn7('', 'subtask(2)'+'');
    15: SMtr45Cn8('', 'subtask(1)'+'');
    16: SMtr45Cn8('', 'subtask(2)'+'');
    17: SMtr45Cn10('', 'subtask(1)'+'');
    18: SMtr45Cn10('', 'subtask(2)'+'');
    19: SMtr45Cn11('', 'subtask(1)'+'');
    20: SMtr45Cn11('', 'subtask(2)'+'');
    21: SMtr45Cn12('', 'subtask(1)'+'');
    22: SMtr45Cn12('', 'subtask(2)'+'');
    23: SMtr45Cn13('', '');
    24: SMtr45Cn14('', '');
    25: SMtr45Cn15('', 'subtask(1)'+'');
    26: SMtr45Cn15('', 'subtask(2)'+'');
    27: SMtr45Cn16('', 'subtask(1)'+'');
    28: SMtr45Cn16('', 'subtask(2)'+'');
    29: SMtr45Cn17('', 'subtask(1)'+'');
    30: SMtr45Cn17('', 'subtask(2)'+'');
    31: SMtr45Cn18('', '');
    32: SMtr45Cn19('', 'subtask(1)'+'');
    33: SMtr45Cn19('', 'subtask(2)'+'');
    34: SMtr45Cn20('', 'subtask(1)'+'');
    35: SMtr45Cn20('', 'subtask(2)'+'');
    36: SMtr45Cn21('', '');
    37: SMtr45Cn22('', 'subtask(1)'+'');
    38: SMtr45Cn22('', 'subtask(2)'+'');
    39: SMtr45Cn22('', 'subtask(3)'+'');
    40: SMtr45Cn23('', 'subtask(1)'+'');
    41: SMtr45Cn23('', 'subtask(2)'+'');
    42: SMtr45Cn24('', 'subtask(1)'+'');
    43: SMtr45Cn24('', 'subtask(2)'+'');
    44: SMtr45Cn25('', 'subtask(1)'+'');
    45: SMtr45Cn25('', 'subtask(2)'+'');
    46: SMtr45Cn26('', '');
    47: SMtr45Cn28('', 'subtask(1)'+'');
    48: SMtr45Cn28('', 'subtask(2)'+'');
    49: SMtr45Cn29('', 'subtask(1)'+'');
    50: SMtr45Cn29('', 'subtask(2)'+'');
    51: SMtr45Cn30('', 'subtask(1)'+'');
    52: SMtr45Cn30('', 'subtask(2)'+'');
    53: SMtr45Cn31('', '');
    54: SMtr45Cn32('', '');
    55: SMtr45Cn33('', 'subtask(1)'+'');
    56: SMtr45Cn33('', 'subtask(2)'+'');
    57: SMtr45Cn34('', 'subtask(1)'+'');
    58: SMtr45Cn34('', 'subtask(2)'+'');
    59: SMtr45Cn35('', 'subtask(1)'+'');
    60: SMtr45Cn35('', 'subtask(2)'+'');
    61: SMtr45Cn36('', 'subtask(1)'+'');
    62: SMtr45Cn36('', 'subtask(2)'+'');
    63: SMtr45Cn37('', 'subtask(1)'+'');
    64: SMtr45Cn37('', 'subtask(2)'+'');
    65: SMtr45Cn38('', 'subtask(1)'+'');
    66: SMtr45Cn38('', 'subtask(2)'+'');
    67: SMtr45Cn38('', 'subtask(3)'+'');
    68: SMtr45Cn39('', 'subtask(1)'+'');
    69: SMtr45Cn39('', 'subtask(2)'+'');
    70: SMtr45Cn40('', 'subtask(1)'+'');
    71: SMtr45Cn40('', 'subtask(2)'+'');
    72: SMtr45Cn41('', 'subtask(1)'+'');
    73: SMtr45Cn41('', 'subtask(2)'+'');
    74: SMtr45Cn42('', '');
    75: SMtr45Cn43('', 'subtask(1)'+'');
    76: SMtr45Cn43('', 'subtask(2)'+'');
    77: SMtr45Cn43('', 'subtask(3)'+'');
    78: SMtr45Cn44('', 'subtask(1)'+'');
    79: SMtr45Cn44('', 'subtask(2)'+'');
    80: SMtr10Dn1('', 'subtask(1)'+'');
    81: SMtr10Dn1('', 'subtask(2)'+'');
    82: SMtr10Dn2('', '');
    83: SMtr10Dn3('', '');
    84: SMtr10Dn4('', 'subtask(1)'+'');
    85: SMtr10Dn4('', 'subtask(2)'+'');
    86: SMtr10Dn5('', 'subtask(1)'+'');
    87: SMtr10Dn5('', 'subtask(2)'+'');
    88: SMtr10Dn6('', '');
    89: SMtr10Dn7('', 'subtask(1)'+'');
    90: SMtr10Dn7('', 'subtask(2)'+'');
    91: SMtr10Dn7('', 'subtask(3)'+'');
    92: SMtr10Dn8('', 'subtask(1)'+'');
    93: SMtr10Dn8('', 'subtask(2)'+'');
    94: SMtr10Dn8('', 'subtask(3)'+'');
    95: SMtr10Dn8('', 'subtask(4)'+'');
    96: SMtr10Dn9('', 'subtask(1)'+'');
    97: SMtr10Dn9('', 'subtask(2)'+'');
    98: SMtr10Dn9('', 'subtask(3)'+'');
    99: SMtr10Dn9('', 'subtask(4)'+'');
    100: SMtr10Dn10('', '');
  end
  else if name = 'STRING' then
  case Num of
     1: SStr60Cn1('', '');
     2: SStr60Cn2('', '');
     3: SStr60Cn3('', '');
     4: SStr60Cn4('', '');
     5: SStr60Cn5('', '');
     6: SStr60Cn6('', '');
     7: SStr60Cn7('', '');
     8: SStr60Cn8('', '');
     9: SStr60Cn9('', '');
    10: SStr60Cn10('', '');
    11: SStr60Cn11('', '');
    12: SStr60Cn12('', '');
    13: SStr60Cn15('', 'subtask(1)'+'');
    14: SStr60Cn15('', 'subtask(2)'+'');
    15: SStr60Cn15('', 'subtask(3)'+'');
    16: SStr60Cn16('', 'subtask(1)'+'');
    17: SStr60Cn16('', 'subtask(2)'+'');
    18: SStr60Cn16('', 'subtask(3)'+'');
    19: SStr60Cn17('', '');
    20: SStr60Cn18('', 'subtask(1)'+'');
    21: SStr60Cn18('', 'subtask(2)'+'');
    22: SStr60Cn19('', '');
    23: SStr60Cn20('', '');
    24: SStr60Cn21('', 'subtask(1)'+'');
    25: SStr60Cn21('', 'subtask(2)'+'');
    26: SStr60Cn24('', '');
    27: SStr60Cn25('', '');
    28: SStr60Cn26('', '');
    29: SStr60Cn27('', '');
    30: SStr60Cn28('', '');
    31: SStr60Cn29('', '');
    32: SStr60Cn30('', '');
    33: SStr60Cn31('', 'subtask(1)'+'');
    34: SStr60Cn31('', 'subtask(2)'+'');
    35: SStr60Cn31('', 'subtask(3)'+'');
    36: SStr60Cn32('', 'subtask(1)'+'');
    37: SStr60Cn32('', 'subtask(2)'+'');
    38: SStr60Cn32('', 'subtask(3)'+'');
    39: SStr60Cn33('', 'subtask(1)'+'');
    40: SStr60Cn33('', 'subtask(2)'+'');
    41: SStr60Cn35('', '');
    42: SStr60Cn36('', 'subtask(1)'+'');
    43: SStr60Cn36('', 'subtask(2)'+'');
    44: SStr60Cn37('', '');
    45: SStr60Cn38('', 'subtask(1)'+'');
    46: SStr60Cn38('', 'subtask(2)'+'');
    47: SStr60Cn39('', '');
    48: SStr60Cn40('', 'subtask(1)'+'');
    49: SStr60Cn40('', 'subtask(2)'+'');
    50: SStr60Cn41('', '');
    51: SStr60Cn42('', '');
    52: SStr60Cn43('', '');
    53: SStr60Cn44('', 'subtask(1)'+'');
    54: SStr60Cn44('', 'subtask(2)'+'');
    55: SStr60Cn45('', 'subtask(1)'+'');
    56: SStr60Cn45('', 'subtask(2)'+'');
    57: SStr60Cn46('', '');
    58: SStr60Cn48('', 'subtask(1)'+'');
    59: SStr60Cn48('', 'subtask(2)'+'');
    60: SStr60Cn49('', 'subtask(1)'+'');
    61: SStr60Cn49('', 'subtask(2)'+'');
    62: SStr60Cn50('', '');
    63: SStr60Cn51('', '');
    64: SStr60Cn52('', '');
    65: SStr60Cn53('', '');
    66: SStr60Cn54('', '');
    67: SStr60Cn55('', '');
    68: SStr60Cn56('', '');
    69: SStr60Cn57('', '');
    70: SStr60Cn58('', '');
  end
  else if name= 'FILE' then
    case Num of
     1: SFil45Cn1('', '');
     2: SFil45Cn2('', '');
     3: SFil45Cn3('', '');
     4: SFil45Cn4('', '');
     5: SFil45Cn5('', '');
     6: SFil45Cn6('', '');
     7: SFil45Cn7('', '');
     8: SFil45Cn8('', 'subtask(1)'+'');
     9: SFil45Cn8('', 'subtask(2)'+'');
    10: SFil45Cn9('', '');
    11: SFil45Cn10('', '');
    12: SFil45Cn11('', 'subtask(1)'+'');
    13: SFil45Cn11('', 'subtask(2)'+'');
    14: SFil45Cn12('', 'subtask(1)'+'');
    15: SFil45Cn12('', 'subtask(2)'+'');
    16: SFil45Cn13('', '');
    17: SFil45Cn14('', '');
    18: SFil45Cn15('', 'subtask(1)'+'');
    19: SFil45Cn15('', 'subtask(2)'+'');
    20: SFil45Cn15('', 'subtask(3)'+'');
    21: SFil45Cn16('', 'subtask(1)'+'');
    22: SFil45Cn16('', 'subtask(2)'+'');
    23: SFil45Cn17('', 'subtask(1)'+'');
    24: SFil45Cn17('', 'subtask(2)'+'');
    25: SFil45Cn19('', '');
    26: SFil45Cn20('', '');
    27: SFil45Cn21('', '');
    28: SFil45Cn22('', '');
    29: SFil45Cn23('', 'subtask(1)'+'');
    30: SFil45Cn23('', 'subtask(2)'+'');
    31: SFil45Cn23('', 'subtask(3)'+'');
    32: SFil45Cn23('', 'subtask(4)'+'');
    33: SFil45Cn24('', 'subtask(1)'+'');
    34: SFil45Cn24('', 'subtask(2)'+'');
    35: SFil45Cn25('', 'subtask(1)'+'');
    36: SFil45Cn25('', 'subtask(2)'+'');
    37: SFil45Cn25('', 'subtask(3)'+'');
    38: SFil45Cn26('', 'subtask(1)'+'');
    39: SFil45Cn26('', 'subtask(2)'+'');
    40: SFil45Cn26('', 'subtask(3)'+'');
    41: SFil45Cn27('', '');
    42: SFil45Cn29('', '');
    43: SFil45Cn30('', '');
    44: SFil45Cn31('', 'subtask(1)'+'');
    45: SFil45Cn31('', 'subtask(2)'+'');
    46: SFil45Cn32('', '');
    47: SFil45Cn33('', '');
    48: SFil45Cn35('', '');
    49: SFil45Cn36('', '');
    50: SFil45Cn37('', '');
    51: SFil45Cn38('', '');
    52: SFil45Cn39('', '');
    53: SFil45Cn40('', '');
    54: SFil45Cn41('', '');
    55: SFil45Cn42('', '');
    56: SFil45Cn43('', '');
    57: SFil45Cn44('', '');
    58: SFil25Dn1('', 'subtask(1)'+'');
    59: SFil25Dn2('', 'subtask(2)'+'');
    60: SFil25Dn2('', 'subtask(1)'+'');
    61: SFil25Dn1('', 'subtask(2)'+'');
    62: SFil25Dn3('', '');
    63: SFil25Dn4('', '');
    64: SFil25Dn5('', 'subtask(1)'+'');
    65: SFil25Dn5('', 'subtask(2)'+'');
    66: SFil25Dn6('', '');
    67: SFil25Dn7('', '');
    68: SFil25Dn8('', '');
    69: SFil25Dn9('', 'subtask(1)'+'');
    70: SFil25Dn9('', 'subtask(2)'+'');
    71: SFil25Dn10('', 'subtask(1)'+'');
    72: SFil25Dn10('', 'subtask(2)'+'');
    73: SFil25Dn11('', '');
    74: SFil25Dn13('', '');
    75: SFil25Dn14('', '');
    76: SFil25Dn15('', '');
    77: SFil25Dn16('', '');
    78: SFil25Dn17('', '');
    79: SFil25Dn18('', '');
    80: SFil25Dn19('', 'subtask(1)'+'');
    81: SFil25Dn19('', 'subtask(2)'+'');
    82: SFil25Dn19('', 'subtask(3)'+'');
    83: SFil25Dn20('', 'subtask(1)'+'');
    84: SFil25Dn20('', 'subtask(2)'+'');
    85: SFil25Dn20('', 'subtask(3)'+'');
    86: SFil25Dn21('', 'subtask(1)'+'');
    87: SFil25Dn21('', 'subtask(2)'+'');
    88: SFil25Dn21('', 'subtask(3)'+'');
    89: SFil25Dn22('', 'subtask(1)'+'');
    90: SFil25Dn22('', 'subtask(2)'+'');
  end
  else if name= 'TEXT' then
  case Num of
     1: STxt50Cn1('', '');
     2: STxt50Cn2('', 'subtask(1)'+'');
     3: STxt50Cn2('', 'subtask(2)'+'');
     4: STxt50Cn3('', '');
     5: STxt50Cn4('', 'subtask(1)'+'');
     6: STxt50Cn4('', 'subtask(2)'+'');
     7: STxt50Cn4('', 'subtask(3)'+'');
     8: STxt50Cn4('', 'subtask(4)'+'');
     9: STxt50Cn5('', 'subtask(1)'+'');
    10: STxt50Cn5('', 'subtask(2)'+'');
    11: STxt50Cn6('', 'subtask(1)'+'');
    12: STxt50Cn6('', 'subtask(2)'+'');
    13: STxt50Cn7('', 'subtask(1)'+'');
    14: STxt50Cn7('', 'subtask(2)'+'');
    15: STxt50Cn8('', '');
    16: STxt50Cn9('', '');
    17: STxt50Cn10('', '');
    18: STxt50Cn11('', '');
    19: STxt50Cn12('', 'subtask(1)'+'');
    20: STxt50Cn12('', 'subtask(2)'+'');
    21: STxt50Cn13('', '');
    22: STxt50Cn14('', '');
    23: STxt50Cn15('', '');
    24: STxt50Cn17('', '');
    25: STxt50Cn18('', '');
    26: STxt50Cn19('', '');
    27: STxt50Cn20('', '');
    28: STxt50Cn21('', '');
    29: STxt50Cn23('', 'subtask(1)'+'');
    30: STxt50Cn23('', 'subtask(2)'+'');
    31: STxt50Cn24('', '');
    32: STxt50Cn25('', 'subtask(1)'+'');
    33: STxt50Cn25('', 'subtask(2)'+'');
    34: STxt50Cn27('', '');
    35: STxt50Cn28('', 'subtask(1)'+'');
    36: STxt50Cn28('', 'subtask(2)'+'');
    37: STxt50Cn29('', '');
    38: STxt50Cn30('', '');
    39: STxt50Cn31('', '');
    40: STxt50Cn33('', 'subtask(1)'+'');
    41: STxt50Cn33('', 'subtask(2)'+'');
    42: STxt50Cn34('', '');
    43: STxt50Cn35('', '');
    44: STxt50Cn36('', '');
    45: STxt50Cn37('', 'subtask(1)'+'');
    46: STxt50Cn37('', 'subtask(2)'+'');
    47: STxt50Cn37('', 'subtask(3)'+'');
    48: STxt50Cn37('', 'subtask(4)'+'');
    49: STxt50Cn38('', '');
    50: STxt50Cn39('', '');
    51: STxt50Cn40('', '');
    52: STxt50Cn41('', '');
    53: STxt50Cn43('', '');
    54: STxt50Cn44('', 'subtask(1)'+'');
    55: STxt50Cn44('', 'subtask(2)'+'');
    56: STxt50Cn44('', 'subtask(3)'+'');
    57: STxt50Cn45('', '');
    58: STxt50Cn46('', '');
    59: STxt50Cn47('', '');
    60: STxt50Cn48('', '');
  end
  else if name = 'PARAM' then
  case Num of
     1: SPar40Cn1('', '');
     2: SPar40Cn2('', '');
     3: SPar40Cn3('', '');
     4: SPar40Cn4('', '');
     5: SPar40Cn5('', 'subtask(1)'+'');
     6: SPar40Cn5('', 'subtask(2)'+'');
     7: SPar40Cn6('', '');
     8: SPar40Cn7('', '');
     9: SPar40Cn8('', '');
    10: SPar40Cn9('', '');
    11: SPar40Cn10('', 'subtask(1)'+'');
    12: SPar40Cn10('', 'subtask(2)'+'');
    13: SPar40Cn11('', '');
    14: SPar40Cn12('', 'subtask(1)'+'');
    15: SPar40Cn12('', 'subtask(2)'+'');
    16: SPar40Cn13('', '');
    17: SPar40Cn14('', '');
    18: SPar40Cn15('', '');
    19: SPar40Cn16('', 'subtask(1)'+'');
    20: SPar40Cn16('', 'subtask(2)'+'');
    21: SPar40Cn17('', 'subtask(1)'+'');
    22: SPar40Cn17('', 'subtask(2)'+'');
    23: SPar40Cn18('', 'subtask(1)'+'');
    24: SPar40Cn18('', 'subtask(2)'+'');
    25: SPar40Cn19('', '');
    26: SPar40Cn20('', 'subtask(1)'+'');
    27: SPar40Cn20('', 'subtask(2)'+'');
    28: SPar40Cn21('', '');
    29: SPar40Cn22('', '');
    30: SPar40Cn24('', '');
    31: SPar40Cn25('', '');
    32: SPar40Cn26('', 'subtask(1)'+'');
    33: SPar40Cn26('', 'subtask(2)'+'');
    34: SPar40Cn27('', 'subtask(1)'+'');
    35: SPar40Cn27('', 'subtask(2)'+'');
    36: SPar40Cn28('', '');
    37: SPar40Cn29('', '');
    38: SPar40Cn30('', '');
    39: SPar40Cn31('', '');
    40: SPar40Cn32('', '');
    41: SPar40Cn33('', '');
    42: SPar40Cn34('', '');
    43: SPar40Cn35('', '');
    44: SPar40Cn36('', 'subtask(1)'+'');
    45: SPar40Cn36('', 'subtask(2)'+'');
    46: SPar40Cn37('', 'subtask(1)'+'');
    47: SPar40Cn37('', 'subtask(2)'+'');
    48: SPar30Dn8('', '');
    49: SPar30Dn9('', '');
    50: SPar30Dn10('', '');
    51: SPar30Dn11('', '');
    52: SPar30Dn12('', '');
    53: SPar30Dn13('', '');
    54: SPar30Dn14('', '');
    55: SPar30Dn15('', 'subtask(1)'+'');
    56: SPar30Dn15('', 'subtask(2)'+'');
    57: SPar30Dn16('', '');
    58: SPar30Dn17('', '');
    59: SPar30Dn20('', '');
    60: SPar30Dn21('', '');
    61: SPar30Dn22('', '');
    62: SPar30Dn23('', 'subtask(1)'+'');
    63: SPar30Dn23('', 'subtask(2)'+'');
    64: SPar30Dn24('', '');
    65: SPar30Dn25('', '');
    66: SPar30Dn26('', '');
    67: SPar30Dn27('', '');
    68: SPar30Dn28('', '');
    69: SPar30Dn29('', 'subtask(1)'+'');
    70: SPar30Dn29('', 'subtask(2)'+'');
  end
  else if name = 'RECUR' then
  case Num of
     1: SRec30Cn1('', '');
     2: SRec30Cn2('', '');
     3: SRec30Cn3('', '');
     4: SRec30Cn4('', 'subtask(1)'+'');
     5: SRec30Cn4('', 'subtask(2)'+'');
     6: SRec30Cn5('', '');
     7: SRec30Cn6('', '');
     8: SRec30Cn7('', '');
     9: SRec30Cn8('', '');
    10: SRec30Cn9('', '');
    11: SRec30Cn10('', 'subtask(1)'+'');
    12: SRec30Cn10('', 'subtask(2)'+'');
    13: SRec30Cn11('', '');
    14: SRec30Cn13('', '');
    15: SRec30Cn14('', '');
    16: SRec30Cn15('', '');
    17: SRec30Cn16('', '');
    18: SRec30Cn17('', '');
    19: SRec30Cn18('', '');
    20: SRec30Cn19('', '');
    21: SRec30Cn20('', '');
    22: SRec30Cn21('', '');
    23: SRec30Cn22('', '');
    24: SRec30Cn23('', '');
    25: SRec30Cn25('', '');
    26: SRec30Cn26('', '');
    27: SRec30Cn27('', '');
    28: SRec30Cn28('', '');
    29: SRec30Cn29('', '');
    30: SRec30Cn30('', '');
  end;
  result := GetTestCount;
end;


procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;


begin
end.
