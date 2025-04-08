unit ansiutf8;

// **************** Use Lazarus editor with codepage 1251 ******************
// 2024.04 Изменена обработка некоторых начальных символов второй половины кодовой таблицы ASCII,
// чтобы на их месте можно было указывать основные управляющие команды задачника, генерирующие
// специальные символы (греческие буквы, знаки неравенств и т.п.)
// #140-#143 (\a, \e, \E, \p), #156-#159 (\x, \n, \l, \g) 

{$MODE Delphi}

interface

const
  UTFTextMark = '[[!UTF8MARK!]]'; //2021.11


function PT4AnsiToUtf8(s: string): string;
function PT4Utf8ToAnsi(s: string): string;
function PT4OEMToUtf8(c: char): string;

//2021.11>
//function checkSymbol(n: integer): integer;
//function checkEuro(n: integer): integer;

//function PT4EuroToUtf8(s: string): string; //2021.11
//function PT4SymbolToUtf8(s: string): string; //2021.11
//2021.11<

//function PT4UnicodeToAnsi(s: string): string; //2021.12


//function PT4LowerCase(s: string): string;
//function PT4UpperCase(s: string): string;

function USize(p: Char): integer;
function UTF8CodepointSize(p: PChar): integer; 
function UTF8Length(const s: string): PtrInt; overload;
function UTF8Length(p: PChar; ByteCount: PtrInt): PtrInt; overload;
function UTF8Copy(const s: string; StartCharIndex, CharCount: PtrInt): string;
procedure UTF8Delete(var s: String; StartCharIndex, CharCount: PtrInt);
procedure UTF8Insert(const source: String; var s: String; StartCharIndex: PtrInt);

implementation

//uses lazutf8; //2021.11

const
  s_ansi =
#128#32#129#32#130#32#32#131#32#132#32#32#133#32#32#134#32#32#135#32#32#136+
#32#32#137#32#32#138#32#139#32#32#140#32#141#32#142#32#143#32#144#32#145#32+
#32#146#32#32#147#32#32#148#32#32#149#32#32#150#32#32#151#32#32#152#32#153+
#32#32#154#32#155#32#32#156#32#157#32#158#32#159#32#160#32#161#32#162#32#163+
#32#164#32#165#32#166#32#167#32#168#32#169#32#170#32#171#32#172#32#173#32#174+
#32#175#32#176#32#177#32#178#32#179#32#180#32#181#32#182#32#183#32#184#32#185+
#32#32#186#32#187#32#188#32#189#32#190#32#191#32#192#32#193#32#194#32#195#32+
#196#32#197#32#198#32#199#32#200#32#201#32#202#32#203#32#204#32#205#32#206#32+
#207#32#208#32#209#32#210#32#211#32#212#32#213#32#214#32#215#32#216#32#217#32+
#218#32#219#32#220#32#221#32#222#32#223#32#224#32#225#32#226#32#227#32#228#32+
#229#32#230#32#231#32#232#32#233#32#234#32#235#32#236#32#237#32#238#32#239#32+
#240#32#241#32#242#32#243#32#244#32#245#32#246#32#247#32#248#32#249#32#250#32+
#251#32#252#32#253#32#254#32#255#32#33;
  s_utf8 =
#208#130#208#131#226#128#154#209#147#226#128#158#226#128#166#226#128#160#226+
#128#161#226#130#172#226#128#176#208#137#226#128#185#208#138#208#140#208#139+
#208#143#209#146#226#128#152#226#128#153#226#128#156#226#128#157#226#128#162+
#226#128#147#226#128#148#194#152#226#132#162#209#153#226#128#186#209#154#209+
#156#209#155#209#159#194#160#208#142#209#158#208#136#194#164#210#144#194#166+
#194#167#208#129#194#169#208#132#194#171#194#172#194#173#194#174#208#135#194+
#176#194#177#208#134#209#150#210#145#194#181#194#182#194#183#209#145#226#132+
#150#209#148#194#187#209#152#208#133#209#149#209#151#208#144#208#145#208#146+
#208#147#208#148#208#149#208#150#208#151#208#152#208#153#208#154#208#155#208+
#156#208#157#208#158#208#159#208#160#208#161#208#162#208#163#208#164#208#165+
#208#166#208#167#208#168#208#169#208#170#208#171#208#172#208#173#208#174#208+
#175#208#176#208#177#208#178#208#179#208#180#208#181#208#182#208#183#208#184+
#208#185#208#186#208#187#208#188#208#189#208#190#208#191#209#128#209#129#209+
#130#209#131#209#132#209#133#209#134#209#135#209#136#209#137#209#138#209#139+
#209#140#209#141#209#142#209#143;
var
  a_utf8: array[#128..#255] of string[3] = (

#208#130, #208#131,   #226#128#154,#209#147,#226#128#158,#226#128#166,#226#128#160,#226#128#161,#226#130#172,#226#128#176,#208#137,#226#128#185,

//2024.04>
//\a - #140  \e - #141  \E - #142  \p - #143
  #206#177,  #206#181,  #206#163,  #207#128, 
//#208#138,#208#140,#208#139,#208#143,

#209#146,#226#128#152,#226#128#153,#226#128#156,#226#128#157,#226#128#162,#226#128#147,#226#128#148,#194#152,#226#132#162,#209#153,#226#128#186,

//\x - #156   \n - #157      \l - #158     \g - #159
  #195#151,   #226#137#160,  #226#137#164, #226#137#165,
//#209#154,#209#156,#209#155,#209#159,
//2024.04<

#194#160,#208#142,#209#158,
#208#136,#194#164,#210#144,#194#166,#194#167,#208#129,#194#169,#208#132,
#194#171,#194#172,#194#173,#194#174,#208#135,#194#176,#194#177,#208#134,
#209#150,#210#145,#194#181,#194#182,#194#183,#209#145,#226#132#150,#209#148,
#194#187,#209#152,#208#133,#209#149,#209#151,

#208#144,#208#145,#208#146,#208#147,#208#148,#208#149,#208#150,#208#151,
#208#152,#208#153,#208#154,#208#155,#208#156,#208#157,#208#158,#208#159,
#208#160,#208#161,#208#162,#208#163,#208#164,#208#165,#208#166,#208#167,
#208#168,#208#169,#208#170,#208#171,#208#172,#208#173,#208#174,#208#175,

#208#176,#208#177,#208#178,#208#179,#208#180,#208#181,#208#182,#208#183,
#208#184,#208#185,#208#186,#208#187,#208#188,#208#189,#208#190,#208#191,
#209#128,#209#129,#209#130,#209#131,#209#132,#209#133,#209#134,#209#135,
#209#136,#209#137,#209#138,#209#139,#209#140,#209#141,#209#142,#209#143
);
   b: array[#208..#209,#128..#191] of char;

//2021.11>
function checkSymbol(n: integer): integer;
var r: integer;
begin
  case n of
  $22: r := 8704;
  $24: r := 8707;
  $27: r := 8715;
  $2d: r := 8722;
  $40: r := 8773;
  $41: r := 913;
  $42: r := 914;
  $43: r := 935;
  $44: r := 916;
  $45: r := 917;
  $46: r := 934;
  $47: r := 915;
  $48: r := 919;
  $49: r := 921;
  $4a: r := 977;
  $4b: r := 922;
  $4c: r := 923;
  $4d: r := 924;
  $4e: r := 925;
  $4f: r := 927;
  $50: r := 928;
  $51: r := 920;
  $52: r := 929;
  $53: r := 931;
  $54: r := 932;
  $55: r := 933;
  $56: r := 962;
  $57: r := 937;
  $58: r := 926;
  $59: r := 936;
  $5a: r := 918;
  $5c: r := 8756;
  $5e: r := 8869;//10178;
  $61: r := 945; //a
  $62: r := 946;
  $63: r := 967;
  $64: r := 948;
  $65: r := 949; //e
  $66: r := 981;
  $67: r := 947;
  $68: r := 951;
  $69: r := 953;
  $6a: r := 966;
  $6b: r := 954;
  $6c: r := 955;
  $6d: r := 956;
  $6e: r := 957;
  $6f: r := 959;
  $70: r := 960; //p
  $71: r := 952;
  $72: r := 961;
  $73: r := 963;
  $74: r := 964;
  $75: r := 965;
  $76: r := 982;
  $77: r := 969;
  $78: r := 958;
  $79: r := 968;
  $7a: r := 950;
  $a1: r := 978;
  $a2: r := 8242;
  $a3: r := 8804; //l
  $a5: r := 8734;
  $a7: r := 9827;
  $a8: r := 9830;
  $a9: r := 9829;
  $aa: r := 9824;
  $ab: r := 8596;
  $ac: r := 8592;
  $ad: r := 8593;
  $ae: r := 8594;
  $af: r := 8595;
  $b2: r := 8243;
  $b3: r := 8805; //g
  $b4: r := 215; //x//2010.03W
  $b5: r := 8733;
  $b6: r := 8706;
  $b7: r := 8226; //2010.03W
  $b9: r := 8800; //n
  $ba: r := 8801;
  $bb: r := 8776;
  $bd: r := 9474;
  $be: r := 9472;
  $bf: r := 11168;
  $c0: r := 8501;//1488;
  $c1: r := 8465;
  $c2: r := 8476;
  $c3: r := 8472;
  $c4: r := 8855;
  $c5: r := 8853;
  $c6: r := 8709; //-$c6; //216; - пустое множество
  $c7: r := 8745; //-$c7; //8745; для единообразия с объединением
  $c8: r := 8746;
  $c9: r := 8835;
  $ca: r := 8839;
  $cb: r := 8836;
  $cc: r := 8834;
  $cd: r := 8838;
  $ce: r := 8712;
  $cf: r := 8713;
  $d0: r := 8736;
  $d1: r := 8711;
  $d5: r := 8719;
  $d6: r := 8730;
  $d9: r := 8743;
  $da: r := 8744;
  $db: r := 8660;
  $dc: r := 8656;
  $dd: r := 8657;
  $de: r := 8658;
  $df: r := 8659;
  $e0: r := 9674;
  $e1: r := 9001;//10216;//8249;
  $e5: r := 8721;
  $f1: r := 9002;//10217;//8250;
  $f2: r := 8747;

  else r := 63;
  end;
  result := r;
end;

function checkEuro(n: integer): integer;
var r: integer;
begin
  case n of
  $80: r := 8364;
  $82: r := 8218;
  $83: r := 402;
  $84: r := 8222;
  $85: r := 8230;
  $86: r := 8224;
  $87: r := 8225;
  $88: r := 710;
  $89: r := 8240;
  $8a: r := 352;
  $8b: r := 8249;
  $8c: r := 338;
  $8e: r := 381;
  $91: r := 8216;
  $92: r := 8217;
  $93: r := 8220;
  $94: r := 8221;
  $95: r := 8226;
  $96: r := 8211;
  $97: r := 8212;
  $98: r := 732;
  $99: r := 8482;
  $9a: r := 353;
  $9b: r := 8250;
  $9c: r := 339;
  $9e: r := 382;
  $9f: r := 376;
  $a1..$ac,$ae..$ff: r := n;
  else r := 63;
  end;
  result := r;
end;

//2021.11<

function PT4Utf8ToAnsi(s: string): string;
var s0: string;
    i,p: integer;
begin
  s0 := '';
  i := 1;
  while i<=length(s) do
  begin
    if s[i] in [#0..#127] then
    begin
      s0 := s0 + s[i];
      i := i + 1;
    end
    else
    if s[i] in [#208..#209] then
    begin
      s0 := s0 + b[s[i],s[i+1]];
      i := i + 2;
    end
    else
    if s[i] in [#128..#224] then
    begin
      p := pos(copy(s,i,2),s_utf8);
      if p <> 0 then
        s0 := s0 + Copy(s_ansi,p,1)
      else
        s0 := s0 + '?';
      i := i + 2;
    end
    else
    begin
      p := pos(copy(s,i,3),s_utf8);
      if p <> 0 then
        s0 := s0 + Copy(s_ansi,p,1)
      else
        s0 := s0 + '?';
      i := i + 3;
    end
  end;
  result := s0;
end;

function PT4AnsiToUtf8_base(s: string): string; //2021.11
var s0: string;
    p,i: integer;
begin
  s0 := '';
  for i := 1 to length(s) do
    if s[i] in [#0..#127] then
      s0 := s0 + s[i]
    else
      s0 := s0 + a_utf8[s[i]];
  result := s0;
end;

(* uses Lazutf8
//2021.11>
function PT4EuroToUtf8(s: string): string; //2021.11
var s0: string;
    p,i: integer;
begin
  s0 := '';
  for i := 1 to length(s) do
    s0 := s0 + UnicodeToUTF8(checkEuro(ord(s[i])));
  result := s0;
end;

function PT4SymbolToUtf8(s: string): string; //2021.11
var s0: string;
    p,i: integer;
begin
  s0 := '';
  for i := 1 to length(s) do
    s0 := s0 + UnicodeToUTF8(checkSymbol(ord(s[i])));
  result := s0;
end;
*)

//В новой модификации не перекодируются те фрагменты,
//которые ограничены метками UTFTextMark
function PT4AnsiToUtf8(s: string): string;
var s0: string;
    p,i: integer;
begin
  result := '';
  p := Pos(UTFTextMark, s);
  while p > 0 do
  begin
    result := result + PT4AnsiToUtf8_base(Copy(s, 1, p-1));
    delete(s, 1, p + length(UTFTextMark) - 1);
    p := Pos(UTFTextMark, s);
    result := result + Copy(s, 1, p-1);
    delete(s, 1, p + length(UTFTextMark) - 1);
    p := Pos(UTFTextMark, s);
  end;
  result := result + PT4AnsiToUtf8_base(s);
end;
//2021.11<

function PT4OEMToUtf8(c: char): string;
begin
  result := '?';
  case c of
    #196: result := chr($E2)+chr($94)+chr($80);
    #218: result := chr($E2)+chr($94)+chr($8C);
    #191: result := chr($E2)+chr($94)+chr($90);
    #205: result := chr($E2)+chr($95)+chr($90);
    #213: result := chr($E2)+chr($95)+chr($92);
    #184: result := chr($E2)+chr($95)+chr($95);
    #186: result := chr($E2)+chr($95)+chr($91);
    #201: result := chr($E2)+chr($95)+chr($94);  
    #187: result := chr($E2)+chr($95)+chr($97);  
    #199: result := chr($E2)+chr($95)+chr($9F);  
    #182: result := chr($E2)+chr($95)+chr($A2);  
    #200: result := chr($E2)+chr($95)+chr($9A);  
    #188: result := chr($E2)+chr($95)+chr($9D);  
  end;
end;

//2021.21>
(* uses Lazutf8
function PT4UnicodeToAnsi(s: string): string;
var s0: string;
begin

  s0 := Utf16ToUTF8(s);
  result := PT4Utf8ToAnsi(s0);
end;
//2021.21<
*)

(*
function PT4LowerCase(s: string): string;
var i: integer;
begin
  result := s;
  for i := 1 to length(s) do
    case s[i] of
    'A'..'Z': Inc(result[i],32);
    'А'..'Я': Inc(result[i],32);
    'Ё': result[i] := 'ё';
    end;
end;


function PT4UpperCase(s: string): string;
var i: integer;
begin
  result := s;
  for i := 1 to length(s) do
    case s[i] of
    'a'..'z': Dec(result[i],32);
    'а'..'я': Dec(result[i],32);
    'ё': result[i] := 'Ё';
    end;
end;
*)

function UTF8CodepointSize(p: PChar): integer;
begin
  case p^ of
    #0..#191   : Result := 1;
    #192..#223 : Result := 2;
    #224..#239 : Result := 3;
    #240..#247 : Result := 4;
    //#248..#255 : Result := 1;
    // Theoretically UTF-8 supports length 1-7, but since 2003, RFC 3629 limits
    // it to 1-4 bytes.
    // This is an inline function, so keep the function short.
    //#248..#251   : Result := 5;
    //#252, #253   : Result := 6;
    //#254         : Result := 7;

    else Result := 1; // An optimization + prevents compiler warning about uninitialized Result.
  end;
end;

function USize(p: Char): integer;
begin
  case p of
    #0..#191   : Result := 1;
    #192..#223 : Result := 2;
    #224..#239 : Result := 3;
    #240..#247 : Result := 4;
    else Result := 1; // An optimization + prevents compiler warning about uninitialized Result.
  end;
end;


function UTF8Length(const s: string): PtrInt;
begin
  Result:=UTF8Length(PChar(s),length(s));
end;

function UTF8Length(p: PChar; ByteCount: PtrInt): PtrInt;
var
  CharLen: LongInt;
begin
  Result:=0;
  while (ByteCount>0) do begin
    inc(Result);
    CharLen:=UTF8CodepointSize(p);
    inc(p,CharLen);
    dec(ByteCount,CharLen);
  end;
end;

function UTF8CodepointStart(UTF8Str: PChar; Len, CodepointIndex: PtrInt): PChar;
var
  CharLen: LongInt;
begin
  Result:=UTF8Str;
  if Result<>nil then begin
    while (CodepointIndex>0) and (Len>0) do begin
      CharLen:=UTF8CodepointSize(Result);
      dec(Len,CharLen);
      dec(CodepointIndex);
      inc(Result,CharLen);
    end;
    if (CodepointIndex<>0) or (Len<0) then
      Result:=nil;
  end;
end;

function UTF8Copy(const s: string; StartCharIndex, CharCount: PtrInt): string;
// returns substring
var
  StartBytePos: PChar;
  EndBytePos: PChar;
  MaxBytes: PtrInt;
begin
  StartBytePos:=UTF8CodepointStart(PChar(s),length(s),StartCharIndex-1);
  if StartBytePos=nil then
    Result:=''
  else begin
    MaxBytes:=PtrInt(PChar(s)+length(s)-StartBytePos);
    EndBytePos:=UTF8CodepointStart(StartBytePos,MaxBytes,CharCount);
    if EndBytePos=nil then
      Result:=copy(s,StartBytePos-PChar(s)+1,MaxBytes)
    else
      Result:=copy(s,StartBytePos-PChar(s)+1,EndBytePos-StartBytePos);
  end;
end;

procedure UTF8Delete(var s: String; StartCharIndex, CharCount: PtrInt);
var
  StartBytePos: PChar;
  EndBytePos: PChar;
  MaxBytes: PtrInt;
begin
  StartBytePos:=UTF8CodepointStart(PChar(s),length(s),StartCharIndex-1);
  if StartBytePos <> nil then
  begin
    MaxBytes:=PtrInt(PChar(s)+length(s)-StartBytePos);
    EndBytePos:=UTF8CodepointStart(StartBytePos,MaxBytes,CharCount);
    if EndBytePos=nil then
      Delete(s,StartBytePos-PChar(s)+1,MaxBytes)
    else
      Delete(s,StartBytePos-PChar(s)+1,EndBytePos-StartBytePos);
  end;
end;

procedure UTF8Insert(const source: String; var s: String; StartCharIndex: PtrInt);
var
  StartBytePos: PChar;
begin
  StartBytePos:=UTF8CodepointStart(PChar(s),length(s),StartCharIndex-1);
  if StartBytePos <> nil then
    Insert(source, s, StartBytePos-PChar(s)+1);
end;


begin
b[#208,#128] := #63;
b[#208,#129] := #168;
b[#208,#130] := #128;
b[#208,#131] := #129;
b[#208,#132] := #170;
b[#208,#133] := #189;
b[#208,#134] := #178;
b[#208,#135] := #175;
b[#208,#136] := #163;
b[#208,#137] := #138;
b[#208,#138] := #140;
b[#208,#139] := #142;
b[#208,#140] := #141;
b[#208,#141] := #63;
b[#208,#142] := #161;
b[#208,#143] := #143;
b[#208,#144] := #192;
b[#208,#145] := #193;
b[#208,#146] := #194;
b[#208,#147] := #195;
b[#208,#148] := #196;
b[#208,#149] := #197;
b[#208,#150] := #198;
b[#208,#151] := #199;
b[#208,#152] := #200;
b[#208,#153] := #201;
b[#208,#154] := #202;
b[#208,#155] := #203;
b[#208,#156] := #204;
b[#208,#157] := #205;
b[#208,#158] := #206;
b[#208,#159] := #207;
b[#208,#160] := #208;
b[#208,#161] := #209;
b[#208,#162] := #210;
b[#208,#163] := #211;
b[#208,#164] := #212;
b[#208,#165] := #213;
b[#208,#166] := #214;
b[#208,#167] := #215;
b[#208,#168] := #216;
b[#208,#169] := #217;
b[#208,#170] := #218;
b[#208,#171] := #219;
b[#208,#172] := #220;
b[#208,#173] := #221;
b[#208,#174] := #222;
b[#208,#175] := #223;
b[#208,#176] := #224;
b[#208,#177] := #225;
b[#208,#178] := #226;
b[#208,#179] := #227;
b[#208,#180] := #228;
b[#208,#181] := #229;
b[#208,#182] := #230;
b[#208,#183] := #231;
b[#208,#184] := #232;
b[#208,#185] := #233;
b[#208,#186] := #234;
b[#208,#187] := #235;
b[#208,#188] := #236;
b[#208,#189] := #237;
b[#208,#190] := #238;
b[#208,#191] := #239;
b[#209,#128] := #240;
b[#209,#129] := #241;
b[#209,#130] := #242;
b[#209,#131] := #243;
b[#209,#132] := #244;
b[#209,#133] := #245;
b[#209,#134] := #246;
b[#209,#135] := #247;
b[#209,#136] := #248;
b[#209,#137] := #249;
b[#209,#138] := #250;
b[#209,#139] := #251;
b[#209,#140] := #252;
b[#209,#141] := #253;
b[#209,#142] := #254;
b[#209,#143] := #255;
b[#209,#144] := #63;
b[#209,#145] := #184;
b[#209,#146] := #144;
b[#209,#147] := #131;
b[#209,#148] := #186;
b[#209,#149] := #190;
b[#209,#150] := #179;
b[#209,#151] := #191;
b[#209,#152] := #188;
b[#209,#153] := #154;
b[#209,#154] := #156;
b[#209,#155] := #158;
b[#209,#156] := #157;
b[#209,#157] := #63;
b[#209,#158] := #162;
b[#209,#159] := #159;
b[#209,#160] := #63;
b[#209,#161] := #63;
b[#209,#162] := #63;
b[#209,#163] := #63;
b[#209,#164] := #63;
b[#209,#165] := #63;
b[#209,#166] := #63;
b[#209,#167] := #63;
b[#209,#168] := #63;
b[#209,#169] := #63;
b[#209,#170] := #63;
b[#209,#171] := #63;
b[#209,#172] := #63;
b[#209,#173] := #63;
b[#209,#174] := #63;
b[#209,#175] := #63;
b[#209,#176] := #63;
b[#209,#177] := #63;
b[#209,#178] := #63;
b[#209,#179] := #63;
b[#209,#180] := #63;
b[#209,#181] := #63;
b[#209,#182] := #63;
b[#209,#183] := #63;
b[#209,#184] := #63;
b[#209,#185] := #63;
b[#209,#186] := #63;
b[#209,#187] := #63;
b[#209,#188] := #63;
b[#209,#189] := #63;
b[#209,#190] := #63;
b[#209,#191] := #63;
end.
