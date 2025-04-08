{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}

unit PT4ZFunc_en;

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
  CreateGroup('ZFunc', 'Functions',
    'M. E. Abramyan, 2022', 'qwqfwwwwwsdf13dfttd', 60, InitTask);
{
CommentText('The additional ZFunc group, unlike the standard Proc and Func groups, is available for all languages supported by the taskbook.');
CommentText('If the Func group is available for a language, the ZFunc group coincides with the Func group for this language;');
CommentText('if the Proc group is available for a language, the ZFunc group contains the Proc group tasks in modified order:');
CommentText('first Proc16\:36, then Proc1\:15, then the remaining tasks. Thus, each ZFunc task for any language is related to the development');
CommentText('of the \Isame\i function (although the formulation of the task for different languages may be different).');
}
end;

//exports inittaskgroup, activate;

begin
end.
