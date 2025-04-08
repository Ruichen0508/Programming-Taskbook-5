{$A+,B-,C-,D-,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R+,S-,T-,U-,V+,W-,X+,Y-,Z1}

{$MODE Delphi}

unit UVariantDat;

interface

procedure CheckVariantDat(StudName, TaskName: string; var VInfo: string; var aVInfo: char);

implementation

uses SysUtils, ULocale;

type
//  string80 = string[78];
  string0 = ShortString;
  string70 = string[72];


var Vres,Vnvar,Vball : integer;
    Vsubgroup : char;
    VTask,Vtit,codecheck : string;


function DecodeVar(var s : string70) : Boolean;
var n,n1,i,j,istud,iRND,pos1,pos2,con1,con2,cnt,con10,con20,num : integer;
    long : longint;
    s1 : string70;
    s2 : string0;
begin
  if (length(s)<34)or(length(s)>72) then
    begin
      DecodeVar := False;
      Exit;
    end;
      num := 2;
      istud := 4539;
      iRND := 34;
      pos1 := 3;
      pos2 := 29;
  n := length(s);
  long := abs(longint(longint(istud * 4423082) + longint(num * 42736) + longint(iRnd*34964)));
  n1 := Long mod 25 + 4;
  for j := 1 to n1 do
  begin
    s1 := s;
    for i:=1 to n div 2 do
     begin
      s1[2*i-1]:= s[n-i+1];
      s1[2*i]:=s[i];
     end;
    if n mod 2 <> 0 then
    s1[n] := s[n div 2 + 1];
    s := s1;
  end;
  long :=abs(longint(longint(istud * 436829322) + longint(num * 225786533) + longint(iRnd*376434694)));
  Str(long,s2);
  for i := 1 to 10 - length(s2) do s2 := chr(i+48)+s2 ;
  s2 := Copy(s2,length(s2)-9,10);
  for i := 1 to n do
    begin
      n1 := ord(s[i]);
      j := ord(s2[(i mod 10)+1])-46;
      if n1 in [32..252] then s[i]:= chr(n1-j);
    end;
  con10 := ord(s[pos1]);
  delete(s,pos1,1);
  con20 := ord(s[pos2]);
  delete(s,pos2,1);
  cnt := 0;
  for i := 1 to length(s) do
    cnt := cnt + ord(s[i]);
  long :=abs(longint(longint(istud * 7653386) + longint(num * 4684364) + longint(iRnd*9867327) + longint(cnt * 2367564)));
  con1 := long mod 200 + 32;
  long :=abs(longint(longint(istud * 543286) + longint(num * 46234444) + longint(iRnd*46577237) + longint(cnt * 654384)));
  con2 := long mod 200 + 32;
  if (con1 <> con10) or (con2 <> con20) then DecodeVar := False
  else DecodeVar := True;
end;


procedure dataFromVarFile(Task : string;
  var res : integer;
  var nvar : integer;
  var subgroup : char;
  var ball : integer; var tit : string);
  var ver, ii1, ii2: integer; //vardat2009
{res =  0, if all is OK,
       -1, if file VARIANT.DAT is not found,
       -2, if the task is not included in the variant,
       -3, if the file VARIANT.DAT is corrupted,
       -4, if the file has wrong format;
 other parameters are defined only for res>=0:
 nvar - variant number from the file variant.dat,
 subgroup = ' ','1'..'9','A'..'Z' - subgroup number; if is absent
       then equals ' ';
 ball = 0..100 - the amount of balls; if not defined then equals 0;
 tit - subgroup comment; if is absent then equals ''}
var F:File of string70;
    Top : string0;
    s,s1,s2,s10,s20,svar : string0;
    s6,s60 : string70;
    i,j,k,k0,n,l,nTask,stItem,j0 : integer;
begin
if Task=VTask then
  begin
    res := Vres;
    nvar := Vnvar;
    subgroup := Vsubgroup;
    ball := Vball;
    tit := Vtit;
    exit;
  end;
VTask := Task;
res :=  -3;
Vres := -3;
Assign(F,'Variant.dat');
{$I-}
FileMode := 0;
Reset(F);
FileMode := 2;
{$I+}
if IOResult <> 0 then begin res := -1; Vres := -1; exit; end;
if FileSize(F)<3 then
  begin
    Close(F);
    exit;
  end;
n := length(task);
for i := length(task) downto 1 do
  if task[i] in [' ','-','0'..'9'] then dec(n)
  else  break;
top := Copy(task,1,n);
s20 := Copy(task,n+1,20);
if Pos(' ',s20)<>0 then Delete(s20,Pos(' ',s20),20);
s10 := s20;
if Pos('-',s10)<>0 then delete(s10,Pos('-',s10),50);
Seek(F,0);
{$I-}
read(F,s60);
{$I+}
if IOResult <> 0 then
  begin
    Close(F);
    exit;
  end;
Seek(F,1);
{$I-}
read(F,s6);
{$I+}
if (IOResult <> 0) or (not DecodeVar(s6)) then
  begin
    Close(F);
    exit;
  end;
while s6[length(s6)]=' ' do s6[0] := Chr(Ord(s6[0])-1);
//vardat2009>
if (s6<>'##VARIANT.DAT, ver.1##') and (s6<>'##VARIANT.DAT, ver.2##') then
  begin
    res := -4;
    Vres := -4;
    Close(F);
    exit;
  end;
case s6[20] of
'1': begin
       ver := 1;
       ii1 := 7;
       ii2 := 10;
     end;
'2': begin
       ver := 2;
       ii1 := 5;
       ii2 := 12;
     end;
end;
//vardat2009<
{$I-}
read(F,s6);
{$I+}
if (IOResult <> 0) or (not DecodeVar(s6)) then
  begin
    Close(F);
    exit;
  end;
for i := 1 to 70 do
  if s6[i]=' ' then
    begin
      n := i;
      break;
    end;
s1 := Copy(S6,1,n-1);
if Pos('-',s1)=0 then
  begin
    res := -4;
    Vres := -4;
    Close(F);
    exit;
  end;
val(Copy(s1,1,Pos('-',s1)-1),l,j);
val(Copy(s1,Pos('-',s1)+1,30),k,i);
if i+j<>0 then
  begin
    res := -4;
    Vres := -4;
    Close(F);
    exit;
  end;
nTask := 0;
for i := 1 to l do
  begin
    {$I-}
    read(F,s6);
    {$I+}
    if (IOResult <> 0) or (not DecodeVar(s6)) then
      begin
        Close(F);
        exit;
      end;
    for j := 1 to ii1 do //vardat2009
      begin
      s1 := Copy(s6,1+(j-1)*ii2,ii2); //vardat2009
      s2 := Copy(s1,4,50);
      while (s2<>'')and(s2[length(s2)]=' ') do delete(s2,length(s2),1);
      if (uppercase(s2)=uppercase(Top))
        and (Trim(s2) <> '')  //2016.02
        then
        begin
          nTask:=Ord(s1[3]);
          stItem := Ord(s1[2]);
          break;
        end;
      end;
    if nTask>0 then break;
  end;
if nTask=0 then
  begin
    res := -2;
    Vres := -2;
    Close(F);
    exit;
  end;
for i := 0 to ntask-1 do
  begin
    Seek(F,stItem+i);
    {$I-}
    read(F,s6);
    {$I+}
    if (IOResult <> 0) or (not DecodeVar(s6)) then
       begin
         Close(F);
         exit;
       end;
    for j := 0 to 6 do
      begin
        s1 := Copy(s6,j*10+1,10);
        s2 := Copy(s1,5,30);
        while (s2<>'')and(s2[length(s2)]=' ') do delete(s2,length(s2),1);
        if (s2=s10) or (s2=s20) then
          begin
            k0 := ord(S1[4]);
            if k0=0 then s := ''
            else
              begin
                Seek(F,k+k0-1);
                {$I-}
                read(F,s6);
                {$I+}
                if (IOResult <> 0) or (not DecodeVar(s6)) then
                  begin
                    Close(F);
                    exit;
                  end;
                s := s6;
                while (s<>'')and(s[length(s)]=' ') do delete(s,length(s),1);
              end;
            Close(F);
            res := 0;
            Vres := 0;
            tit := s;
            Vtit := tit;
            subgroup := s1[2];
            Vsubgroup := subgroup;
            ball := Ord(s1[3])-32;
            Vball := ball;
            nvar := 0;
            Vnvar := 0;
            if s60[2]='V' then
              begin
                svar := Copy(s60,4,Pos('*',s60)-5);
                Val(svar,nvar,j0);
                Vnvar := nvar;
              end;
            Exit;
          end;
      end;
  end;
Close(F);
res := -2;
Vres := -2;
end;

procedure CheckVariantDat(StudName, TaskName: string; var VInfo: string; var aVInfo: char);
begin
      VInfo := '';
      aVInfo := 'E'; // цвет ошибки
      if StudName = '' then
        exit;
      dataFromVarFile(TaskName,
             Vres,Vnvar,Vsubgroup,Vball,Vtit);
      case Vres of
      0 :begin
           VInfo := TaskIncludedInVariantMsg+IntToStr(Vnvar)+'. ';
// Brief output of the variant info:
// only variant number
// and the amount of balls (if defined) are shown.
         if Vball<>0 then VInfo := VInfo + BallsMsg + IntToStr(Vball) + '.';
         end;
      -1:; {File VARIANT.DAT is not found}
      -2: VInfo := TaskNotIncludedInVariantMsg;
      -3: VInfo := VariantDatIsCorruptedMsg;
      -4: VInfo := VariantDatHasWrongFormatMsg;
      end;
      if Vres = 0 then
        aVInfo := 'C';
end;

end.
