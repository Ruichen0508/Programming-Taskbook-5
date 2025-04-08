unit USet1000;

{$MODE Delphi}

interface

type TSet1000 = class
     private
     s: array[0..3] of set of byte;
     e: array[0..999] of integer;
     Cnt: integer;
     mx: integer;
     public
     function Elem(i: integer): integer;
     function Count: integer;
     constructor Create;
     procedure Clear;
     function Contains(n: integer): boolean;
     procedure Add(n: integer);
     function Max: integer;
     end;

implementation

constructor TSet1000.Create;
begin
  Clear;
end;

procedure TSet1000.Clear;
var i: integer;
begin
  for i := 0 to 3 do
    s[i] := [];
  cnt := 0;
  mx := -1;
end;

function TSet1000.Contains(n: integer): boolean;
var i: integer;
begin
  result := false;
  if (n < 0) or (n > 999) then
    exit;
  result := (n mod 250) in s[n div 250];
end;

procedure TSet1000.Add(n: integer);
begin
  if (n < 0) or (n > 999) or Contains(n) then
    exit;
  Include(s[n div 250], n mod 250);
  e[cnt] := n;
  inc(cnt);
  if n > mx then
    mx := n;
end;

function TSet1000.Elem(i: integer): integer;
begin
  if (i < 0) or (i >= cnt) then
    result := -1
  else
    result := e[i];
end;

function TSet1000.Count: integer;
begin
  result := cnt;
end;

function TSet1000.Max: integer;
begin
  result := mx;
end;

end.
