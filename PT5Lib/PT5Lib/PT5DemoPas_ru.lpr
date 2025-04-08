{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

{$mode delphi}{$H+,R+}
library PT5DemoPas_ru;

uses strings, upt5demopas_ru;

procedure activate(dllname: PChar); cdecl;
begin
  Activate_(dllname);
end;

function initgroup(name, code: PChar; lang: integer): integer; cdecl;
var sname, scode: string;
begin
  sname := name;
  result := InitGroup_(sname, scode, lang);
  if result > 0 then
  begin
     StrCopy(name, PChar(sname));
     StrCopy(code, PChar(scode));
  end;
end;

function inittask(num, test: integer): integer; cdecl;
begin
  result := InitTask_(num, test);
end;

exports activate, initgroup, inittask;

begin
end.
