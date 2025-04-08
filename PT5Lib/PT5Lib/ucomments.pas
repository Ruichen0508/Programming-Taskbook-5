{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit UComments;

{$MODE Delphi}

interface

//function realComment(c: string; var a: string; topic: string; tasknumber: integer): string; // a - attributes
function realCommentLength(c: string; topic: string; tasknumber: integer): integer; 

(*
A - spec style (\S-\s)
B - bold (\B-\b)
C - ordinal comment
D - NOT USED (data attr)
E - error (red)
F - NOT USED (file data)
G - NOT USED (gray data/file data)
H - NOT USED (section headers)
I - indices (for upper index we use ^)
J - spec symbol (pi, alpha, +-, etc. and also non-recognized symbol ?)
K - ordinal italic (\I-\i)
L - special italic ({-})
M - mono style (\M-\m)
*)

implementation

uses SysUtils;//, PT43Make;

var
  FSqrtMark: string = 'sqrt(';
  FTrueMark: string = 'true';
  FFalseMark: string = 'false';
  FDisposeMark: string = 'Dispose';
  FNilMark: string = 'NULL';
  FStringQMark: char = '"';
  FCharQMark: char = '''';


function refName(n : integer; GrTopic: string; TaskNumber: integer) : string;
var k : integer;
    num: integer;
    topic: string;
    ptTopicLength, deltaRef: integer;
begin
//2008.09.01>
ptTopicLength := 9;
deltaref := 0;
topic := GrTopic;
num := TaskNumber;
result := '';
for k := 1 to ptTopicLength do
  result := result + '*';
k := num - n - deltaRef;
if (k < 1)or(k > 999) then exit;
if Length(topic)>ptTopicLength then
  result := Copy(topic,1,ptTopicLength-1)
    +'*'+intToStr(k)
else
  result := topic + intToStr(k);
end;
(*
function realComment(c: string; var a: string; topic: string; tasknumber: integer): string; // a - attributes
var i,j,n: integer;
    nTask: string;
    ss: string; //2009.03G
    ca: char; // current attr

function cattr(n: integer): string;
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + ca;
end;

begin
Result := '';
a := '';
ca := 'C';
i := 1;
while i <= Length(c) do
begin
case c[i] of
'\': begin // control sequences mode
     if i+1 > Length(c) then
     begin
       i := i + 1;   // if end of line
                     // then skip symbol
     end
     else
       case c[i+1] of
            // control sequences mode
       '.':
         begin
           Result := Result + '...';
           a := a + cattr(3);
           i := i + 2; // skip two symbols: \ and .
         end;
{2003.02.24----->}
       'R':
         begin
           Result := Result + FSqrtMark;  // add sqrt start mark
           a := a + cattr(length(FSqrtMark));
           i := i + 2; // skip two symbols: \ and R
         end;
       't':
         begin
           Result := Result + FTrueMark;
           a := a + cattr(length(FTrueMark));
           i := i + 2; // skip two symbols: \ and t
         end;
       'f':
         begin
           Result := Result + FFalseMark;
           a := a + cattr(length(FFalseMark));
           i := i + 2; // skip two symbols: \ and f
         end;
//2012.12a>
       'd':
         begin
           Result := Result + FDisposeMark;
           a := a + cattr(length(FDisposeMark));
           i := i + 2; // skip two symbols: \ and d
         end;
//2012.12a<
       'N','O':
         begin
           Result := Result + FNilMark;
           a := a + cattr(length(FNilMark));
           i := i + 2; // skip two symbols: \ and N (or O)
         end;
{<----2003.02.24}

       //2009.03>
       'H','h':
         begin
           Result := Result + '?';  // !!!!!!!!!!!!!!!
           a := a + 'E';
           ss := Copy(c,i+2,2);
           i := i + 2 + Length(ss); // skip four symbols: \ and # and 2 hex digits
         end;
       //2009.03<

       '\','&','{','}','~','^','_','=',':','-','<','>','*','+','x',';',' ','l','g','n','o','p','a','e','r','X':
         begin
           case c[i+1] of
           '\': begin Result := Result + '\'; a := a + ca; end;
           '&': begin Result := Result + '&'; a := a + ca; end;
           '{': begin Result := Result + '{'; a := a + ca; end;
           '}': begin Result := Result + '}'; a := a + ca; end;
           '~': begin Result := Result + '~'; a := a + ca; end;
           '^': begin Result := Result + '^'; a := a + ca; end;
           '_': begin Result := Result + '_'; a := a + ca; end;
           '=': begin Result := Result + '-'; a := a + ca; end;
           ':': begin Result := Result + '-'; a := a + ca; end;
           '-': begin Result := Result + '-'; a := a + ca; end;
           '<': begin Result := Result + '"'; a := a + ca; end;
           '>': begin Result := Result + '"'; a := a + ca; end;
           '*': begin Result := Result + '*'; a := a + ca; end;
           '+': begin Result := Result + '+-'; a := a + 'JJ'; end;
           'x': begin Result := Result + 'x'; a := a + ca; end;
           ';': begin Result := Result + ' '; a := a + ca; end;
           ' ': begin Result := Result + ' '; a := a + ca; end;
           'l': begin Result := Result + '<='; a := a + ca + ca; end;
           'g': begin Result := Result + '>='; a := a + ca + ca; end;
           'n': begin Result := Result + '<>'; a := a + ca + ca; end;
           'o': begin Result := Result + '^o'; a := a + ca + 'I'; end;
           'p': begin Result := Result + 'pi'; a := a + ca + ca; end;
           'a': begin Result := Result + 'alpha'; a := a + cattr(5); end;
           'e': begin Result := Result + 'e'; a := a + ca + ca; end;  // epsilon
           'r': begin Result := Result + ')'; a := a + ca; end;
           'X': begin Result := Result + '*'; a := a + 'J'; end;
           end;
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'Q','q': // the big space marks
         begin
           ca := 'C';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'b': // the style mark  // embedded style marks are NOT allowed!
         begin
           if ca = 'B' then
             ca := 'C';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'i': // the style mark  // embedded style marks are NOT allowed!
         begin
           if ca = 'K' then
             ca := 'C';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       's': // the style mark  // embedded style marks are NOT allowed!
         begin
           if ca = 'A' then
             ca := 'C';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'm': // the style mark  // embedded style marks are NOT allowed!
         begin
           if ca = 'M' then
             ca := 'C';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'B': // the style mark
         begin
           if ca = 'C' then
             ca := 'B';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'I': // the style mark
         begin
           if ca = 'C' then
             ca := 'K';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'S': // the style mark
         begin
           if ca = 'C' then
             ca := 'A';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'M': // the style mark
         begin
           if ca = 'C' then
             ca := 'M';
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
//2009.03>
       'U','u': // the user commands
         begin
           i := i + 3; // skip three symbols: \, U/u and the next symbol
         end;
//2009.03<
       'J': // start of the tab mode
         begin
           i := i + 2; // skip two symbols: \ and T
           while (Length(c) >= i) and (c[i] <> '&') do
           begin
             i := i + 1; // skip all symbols concerning with justifying of columns
           end;
         end;
       '0'..'9': // reference to other task of the group
         begin
           nTask := c[i+1];
           i := i + 2; // skip two symbols: \ and a digit
           while (Length(c) >= i) and (c[i] in ['0'..'9']) do
           begin
             nTask := nTask + c[i];
             i := i + 1; // skip all digits that defines the task number offset
           end;
           if nTask[1] = '0' then nTask[1] := '-'; // "forward" offset
           Val(nTask,n,j);
           if j = 0 then // if the offset is admissible
           begin
             nTask := RefName(n, topic, tasknumber); //UT2
             a := a + cattr(length(nTask));
           end
           else
           begin
             nTask := '*********';
             a := a + 'EEEEEEEEE';
           end;
           Result := Result + nTask;
         end;
//2015.03G>
       'G': // picture loading
         begin
           i := i + 2;
           if (Length(c) >= i) and (c[i] = '<') then
           begin
             i := i + 1;
             while (Length(c) >= i) and (c[i] <> '>') do
             begin
               i := i + 1;
             end;
             i := i + 1;
           end;
         end;
//2015.03G<
       else // all other control sequences of form \symbol are ignored
         begin
           i := i + 2;
         end;
       end;
     end;
'~': begin
     // non-breakable space is replaced by the ordinary space
     i := i + 1;
     Result := Result + ' ';
     a := a + ca;
     end;
'_','^':
     if i+1 > Length(c) then
     begin
       i := i + 1; // if end of line
                   // then skip symbol
     end
     else
     begin
       if c[i] = '^' then
       begin
         Result := Result + '^';
         a := a + ca;
       end;
       if ca <> 'C' then // if in some mode
                            // then skip one or two symbols
         if c[i+1] = '{' then
           i := i + 2
         else
           i := i + 1
       else
       begin
         ca := 'I';
         if c[i+1] = '{' then // start of multisymbol index mode
         begin
           i := i + 2; // skip two symbols: _ (or ^) and bracket {
         end
         else // one-symbol index mode
         begin
           Result := Result + c[i+1]; // add one-symbol index
           a := a + ca;
           ca := 'C'; // instant end of index mode
           i := i + 2; // skip two symbols: _ (or ^) and one-symbol index
         end;
       end;
     end;
'}':
     begin
     if ca = 'I' then
       // if in multiindex mode then end of this mode
       ca := 'C';
     i := i + 1; //skip the symbol
     end;

'{','&':
     begin
       i := i + 1; //skip one symbol
     end;
else
     begin
       Result := Result + c[i];
       a := a + ca;
       i := i + 1;
     end;
end;
end;

end;
*)

function realCommentLength(c: string; topic: string; tasknumber: integer): integer; 
var i,j,n: integer;
    nTask: string;
    ss: string; //2009.03G
    ca: char; // current attr


begin
Result := 0;
i := 1;
while i <= Length(c) do
begin
case c[i] of
'\': begin // control sequences mode
     if i+1 > Length(c) then
     begin
       i := i + 1;   // if end of line
                     // then skip symbol
     end
     else
       case c[i+1] of
            // control sequences mode
       '.':
         begin
           Result := Result + 3;
           i := i + 2; // skip two symbols: \ and .
         end;
{2003.02.24----->}
       'R':
         begin
           Result := Result + length(FSqrtMark);  // add sqrt start mark
           i := i + 2; // skip two symbols: \ and R
         end;
       't':
         begin
           Result := Result + length(FTrueMark);
           i := i + 2; // skip two symbols: \ and t
         end;
       'f':
         begin
           Result := Result + length(FFalseMark);
           i := i + 2; // skip two symbols: \ and f
         end;
//2012.12a>
       'd':
         begin
           Result := Result + length(FDisposeMark);
           i := i + 2; // skip two symbols: \ and d
         end;
//2012.12a<
       'N','O':
         begin
           Result := Result + length(FNilMark);
           i := i + 2; // skip two symbols: \ and N (or O)
         end;
{<----2003.02.24}

       //2009.03>
       'H','h':
         begin
           Result := Result + 1;  // !!!!!!!!!!!!!!!
           ss := Copy(c,i+2,2);
           i := i + 2 + Length(ss); // skip four symbols: \ and # and 2 hex digits
         end;
       //2009.03<

       '\','&','{','}','~','^','_','=',':','-','<','>','*','+','x',';',' ','l','g','n','o','p','a','e','r','X','E':
         begin
           case c[i+1] of
           'l', 'g', 'n', 'o', 'p': begin Result := Result + 1; end;  // <=, >=, <>, ^o, pi  //2024.04 - все символы имеют длину 1!!
           'a': begin Result := Result + 1; end;  // alpha 
           else begin Result := Result + 1; end;
           end;
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'Q','q': // the big space marks
         begin
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
       'b', 'i', 's', 'm', 'B', 'I', 'S', 'M': // the style mark  // embedded style marks are NOT allowed!
         begin
           i := i + 2; // skip two symbols: \ and the given symbol
         end;
//2009.03>
       'U','u': // the user commands
         begin
           i := i + 3; // skip three symbols: \, U/u and the next symbol
         end;
//2009.03<
       'J': // start of the tab mode
         begin
           i := i + 2; // skip two symbols: \ and T
           while (Length(c) >= i) and (c[i] <> '&') do
           begin
             i := i + 1; // skip all symbols concerning with justifying of columns
           end;
         end;
       '0'..'9': // reference to other task of the group
         begin
           nTask := c[i+1];
           i := i + 2; // skip two symbols: \ and a digit
           while (Length(c) >= i) and (c[i] in ['0'..'9']) do
           begin
             nTask := nTask + c[i];
             i := i + 1; // skip all digits that defines the task number offset
           end;
           if nTask[1] = '0' then nTask[1] := '-'; // "forward" offset
           Val(nTask,n,j);
           if j = 0 then // if the offset is admissible
           begin
             nTask := RefName(n, topic, tasknumber);
           end
           else
           begin
             nTask := '*********';
           end;
           Result := Result + length(nTask);
         end;
//2015.03G>
       'G': // picture loading
         begin
           i := i + 2;
           if (Length(c) >= i) and (c[i] = '<') then
           begin
             i := i + 1;
             while (Length(c) >= i) and (c[i] <> '>') do
             begin
               i := i + 1;
             end;
             i := i + 1;
           end;
         end;
//2015.03G<
       else // all other control sequences of form \symbol are ignored
         begin
           i := i + 2;
         end;
       end;
     end;
'~': begin
     // non-breakable space is replaced by the ordinary space
     i := i + 1;
     Result := Result + 1;
     end;
'_','^':
     if i+1 > Length(c) then
     begin
       i := i + 1; // if end of line
                   // then skip symbol
     end
     else
     begin
       if c[i] = '^' then
       begin
         Result := Result + 1;
       end;
         if c[i+1] = '{' then // skip one or two symbols
           i := i + 2
         else
           i := i + 1;
     end;
'}':
     begin
       i := i + 1; //skip the symbol
     end;

'{','&':
     begin
       i := i + 1; //skip one symbol
     end;
else
     begin
       Result := Result + 1;
       i := i + 1;
     end;
end;
end;

end;


end.
