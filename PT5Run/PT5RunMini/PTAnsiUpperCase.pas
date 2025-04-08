unit PTAnsiUppercase;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface

function AnsiUppercase(s: string): string;
// В Лазарусе, как оказалось, стандартная функция AnsiUppercase
// не обрабатывает русские буквы!
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
    'а'..'я': Dec(s[i], 32);
    'ё': s[i] := 'Ё';
    end;
  result := s;
end;

function AnsiLowercase(s: string): string;
var i: integer;
begin
//  s := SysUtils.AnsiLowercase(s); // как оказалось, работает неправильно !
// русские буквы не обрабатывает, но букву A (ЕСЛИ ОНА НАХОДИТСЯ ПОСЛЕ буквы Ф) переводит в Б !
  for i := 1 to Length(s) do
    case s[i] of
    'A'..'Z': Inc(s[i], 32);
    'А'..'Я': Inc(s[i], 32);
    'Ё': s[i] := 'ё';
    end;
  result := s;
end;

end.
