unit PTAnsiUppercase;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface

function AnsiUppercase(s: string): string;
// � ��������, ��� ���������, ����������� ������� AnsiUppercase
// �� ������������ ������� �����!
function AnsiLowercase(s: string): string;

implementation

uses SysUtils;

function AnsiUppercase(s: string): string;
var i: integer;
begin
//  s := SysUtils.AnsiUppercase(s);
  for i := 1 to Length(s) do
    case s[i] of
    'a'..'z': Dec(s[i], 32);
    '�'..'�': Dec(s[i], 32);
    '�': s[i] := '�';
    end;
  result := s;
end;

function AnsiLowercase(s: string): string;
var i: integer;
begin
//  s := SysUtils.AnsiLowercase(s); // ��� ���������, �������� ����������� !
// ������� ����� �� ������������, �� ����� A (���� ��� ��������� ����� ����� �) ��������� � � !
  for i := 1 to Length(s) do
    case s[i] of
    'A'..'Z': Inc(s[i], 32);
    '�'..'�': Inc(s[i], 32);
    '�': s[i] := '�';
    end;
  result := s;
end;

end.
