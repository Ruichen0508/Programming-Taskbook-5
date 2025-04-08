{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5zfunc_en;

{$MODE Delphi}

interface

procedure Activate_(dllname: string);
function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;

implementation

uses SysUtils, PT5TaskMaker, PT4ZFunc_en;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'ZFUNC' then
    PT4ZFunc_en.inittaskgroup;
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
  if name = 'ZFUNC' then
    PT4ZFunc_en.InitTask(num);
  Pause;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;

begin
end.
