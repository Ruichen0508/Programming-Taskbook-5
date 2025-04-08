{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5oop_ru;

{$MODE Delphi}

interface

procedure Activate_(dllname: string);
function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;

implementation

uses SysUtils, PT5TaskMaker, PT4OOP0Begin_ru, PT4OOP1Creat_ru, PT4OOP2Struc_ru, PT4OOP3Behav_ru;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'OOP0BEGIN' then
    PT4OOP0Begin_ru.inittaskgroup
  else if name0 = 'OOP1CREAT' then
    PT4OOP1Creat_ru.inittaskgroup
  else if name0 = 'OOP2STRUC' then
    PT4OOP2Struc_ru.inittaskgroup
  else if name0 = 'OOP3BEHAV' then
    PT4OOP3Behav_ru.inittaskgroup;
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
  if name = 'OOP0BEGIN' then
    PT4OOP0Begin_ru.InitTask(num)
  else if name = 'OOP1CREAT' then
    PT4OOP1Creat_ru.InitTask(num)
  else if name = 'OOP2STRUC' then
    PT4OOP2Struc_ru.InitTask(num)
  else if name = 'OOP3BEHAV' then
    PT4OOP3Behav_ru.InitTask(num);
  Pause;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;

begin
end.
