{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit PT4ZFunc_ru;

{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker;

//-----------------------------------


procedure InitTask(num: integer); stdcall;
begin
  if (CurrentLanguage and (lgPython + lgRuby + lgJulia)) <> 0 then
    UseTask('Func', num)
  else
    case num of
     1..21: UseTask('Proc', num + 15);
    22..36: UseTask('Proc', num - 21);
    else    UseTask('Proc', num);
    end;
end;

procedure inittaskgroup;
begin
  CreateGroup('ZFunc', 'Функции',
    'М. Э. Абрамян, 2022', 'qwqfwwwwwsdf13dfttd', 60, InitTask);
{
CommentText('Дополнительная группа ZFunc, в отличие от стандартных групп Proc и Func, доступна для всех языков, поддерживаемых задачником.');
CommentText('Если для языка доступна группа Func, то группа ZFunc совпадает с группой Func, если для языка доступна группа Proc,');
CommentText('то группа ZFunc содержит задания группы Proc в измененном порядке: вначале Proc16\:36, затем Proc1\:15, затем оставшиеся задания.');
CommentText('Таким образом, каждое задание группы ZFunc для любого языка связано с разработкой \Iодной и той же функции\i');
CommentText('(при этом формулировка задания учитывает особенности испольуемого языка).');
}
end;

//exports inittaskgroup, activate;

begin
end.
