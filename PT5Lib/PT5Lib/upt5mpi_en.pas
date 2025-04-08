{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit upt5mpi_en;

{$MODE Delphi}

interface

procedure Activate_(dllname: string);
function InitGroup_(var name, code: string; lang: integer): integer;
function InitTask_(num, test: Integer): integer;

implementation

uses SysUtils, PT5TaskMaker, PT4MPI1Proc_en, PT4MPI2Send_en, PT4MPI3Coll_en, PT4MPI4Type_en, PT4MPI5Comm_en, 
                         PT4MPI6File_en, PT4MPI7Win_en, PT4MPI8Inter_en;

function InitGroup_(var name, code: string; lang: integer): integer;
var name0: string;
begin
  ClearGroupData;
  SetLanguage(lang);
  name0 := Uppercase(name);
  if name0 = 'MPI1PROC' then
    PT4MPI1Proc_en.inittaskgroup
  else if name0 = 'MPI2SEND' then
    PT4MPI2Send_en.inittaskgroup
  else if name0 = 'MPI3COLL' then
    PT4MPI3Coll_en.inittaskgroup
  else if name0 = 'MPI4TYPE' then
    PT4MPI4Type_en.inittaskgroup
  else if name0 = 'MPI5COMM' then
    PT4MPI5Comm_en.inittaskgroup
  else if name0 = 'MPI6FILE' then
    PT4MPI6File_en.inittaskgroup
  else if name0 = 'MPI7WIN' then
    PT4MPI7Win_en.inittaskgroup
  else if name0 = 'MPI8INTER' then
    PT4MPI8Inter_en.inittaskgroup;
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
    PT4MPI1Proc_en.InitTask(num)
  else if name = 'MPI2SEND' then
    PT4MPI2Send_en.InitTask(num)
  else if name = 'MPI3COLL' then
    PT4MPI3Coll_en.InitTask(num)
  else if name = 'MPI4TYPE' then
    PT4MPI4Type_en.InitTask(num)
  else if name = 'MPI5COMM' then
    PT4MPI5Comm_en.InitTask(num)
  else if name = 'MPI6FILE' then
    PT4MPI6File_en.InitTask(num)
  else if name = 'MPI7WIN' then
    PT4MPI7Win_en.InitTask(num)
  else if name = 'MPI8INTER' then
    PT4MPI8Inter_en.InitTask(num);
  Pause;
  result := GetTestCount;
end;

procedure Activate_(dllname: string);
begin
  PT5TaskMaker.Activate(dllname);
end;

begin
end.
