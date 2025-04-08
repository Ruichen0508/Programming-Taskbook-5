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
  CreateGroup('ZFunc', '�������',
    '�. �. �������, 2022', 'qwqfwwwwwsdf13dfttd', 60, InitTask);
{
CommentText('�������������� ������ ZFunc, � ������� �� ����������� ����� Proc � Func, �������� ��� ���� ������, �������������� ����������.');
CommentText('���� ��� ����� �������� ������ Func, �� ������ ZFunc ��������� � ������� Func, ���� ��� ����� �������� ������ Proc,');
CommentText('�� ������ ZFunc �������� ������� ������ Proc � ���������� �������: ������� Proc16\:36, ����� Proc1\:15, ����� ���������� �������.');
CommentText('����� �������, ������ ������� ������ ZFunc ��� ������ ����� ������� � ����������� \I����� � ��� �� �������\i');
CommentText('(��� ���� ������������ ������� ��������� ����������� ������������ �����).');
}
end;

//exports inittaskgroup, activate;

begin
end.
