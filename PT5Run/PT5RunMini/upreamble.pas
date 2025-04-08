unit upreamble;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface

const
  _PreambleStart = #29;
  _PreambleEnd = #30;
procedure InitHtmlPreambles;
function GetHtmlPreamble(GroupName, SubGroupMark: string): string;
procedure SetHtmlPreamble(GroupName, s: string);

implementation

const
  GroupCommentMark = '@@@@@@@@@@';
  ExternalDataMark1 = '[[!EXTMARK1!]]';


var Names: array[0..300] of string;
    Values: array[0..300] of string;
    n: integer;

procedure InitHtmlPreambles;
begin
  n := 0;
end;

procedure SetHtmlPreamble(GroupName, s: string);
var p, p2: integer;
    SubGroupMark: string;
begin
//  writeln('Orig: ', s);
  p := Pos(_PreambleStart, s);
  while p > 0 do
  begin
    p2 := Pos(_PreambleEnd, s);
    SubGroupMark := Copy(s, p + 1, p2 - p - 1);
    if SubGroupMark = '' then
	SubGroupMark  := GroupCommentMark;
    Names[n] := GroupName + '----' + SubGroupMark;
    Delete(s, 1, p2);	
    p := Pos(_PreambleStart, s);
    if p > 0 then
      Values[n] := Copy(s, 1, p - 1)
    else
      Values[n] := s;
    n := n + 1;
  end;
end;

function GetHtmlPreamble(GroupName, SubGroupMark: string): string;
var s: string;
    i: integer;
begin
  result := '';
  s := GroupName + '----' + SubGroupMark;
  for i := 0 to n - 1 do
    if Names[i] = s then
    begin
      result := ExternalDataMark1 + Values[i];
      exit;
    end;
end;

end.