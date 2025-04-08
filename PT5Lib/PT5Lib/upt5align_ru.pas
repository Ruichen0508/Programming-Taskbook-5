{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5align_ru;

{$MODE Delphi}

interface

procedure Activate_(dllname: string);
function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;

implementation

uses SysUtils, PT5TaskMaker, PT4Align_ru;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'ALIGN' then
    PT4Align_ru.inittaskgroup;
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
  if name = 'ALIGN' then
    PT4Align_ru.InitTask(num);
  Pause;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;

begin
end.
