{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

library libpt5mpi_ru;

{$MODE Delphi}{$H+}

uses strings, upt5mpi_ru;

procedure activate(dllname: PChar); stdcall;
begin
  Activate_(dllname);
end;

function initgroup(name, code: PChar; lang: integer): integer; stdcall;
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

function inittask(num, test: integer): integer; stdcall;
begin
  result := InitTask_(num, test);
end;

exports activate, initgroup, inittask;

begin
end.
