{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5mpi_ru;

{$MODE Delphi}

interface

procedure Activate_(dllname: string);
function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;

implementation

uses SysUtils, PT5TaskMaker, PT4MPI1Proc_ru, PT4MPI2Send_ru, PT4MPI3Coll_ru, PT4MPI4Type_ru, PT4MPI5Comm_ru,
                         PT4MPI6File_ru, PT4MPI7Win_ru, PT4MPI8Inter_ru;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'MPI1PROC' then
    PT4MPI1Proc_ru.inittaskgroup
  else if name0 = 'MPI2SEND' then
    PT4MPI2Send_ru.inittaskgroup
  else if name0 = 'MPI3COLL' then
    PT4MPI3Coll_ru.inittaskgroup
  else if name0 = 'MPI4TYPE' then
    PT4MPI4Type_ru.inittaskgroup
  else if name0 = 'MPI5COMM' then
    PT4MPI5Comm_ru.inittaskgroup
  else if name0 = 'MPI6FILE' then
    PT4MPI6File_ru.inittaskgroup
  else if name0 = 'MPI7WIN' then
    PT4MPI7Win_ru.inittaskgroup
  else if name0 = 'MPI8INTER' then
    PT4MPI8Inter_ru.inittaskgroup;
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
  if name = 'MPI1PROC' then
    PT4MPI1Proc_ru.InitTask(num)
  else if name = 'MPI2SEND' then
    PT4MPI2Send_ru.InitTask(num)
  else if name = 'MPI3COLL' then
    PT4MPI3Coll_ru.InitTask(num)
  else if name = 'MPI4TYPE' then
    PT4MPI4Type_ru.InitTask(num)
  else if name = 'MPI5COMM' then
    PT4MPI5Comm_ru.InitTask(num)
  else if name = 'MPI6FILE' then
    PT4MPI6File_ru.InitTask(num)
  else if name = 'MPI7WIN' then
    PT4MPI7Win_ru.InitTask(num)
  else if name = 'MPI8INTER' then
    PT4MPI8Inter_ru.InitTask(num);
  Pause;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;

begin
end.
