unit udata;

// **************** Use Lazarus editor with codepage 1251 ******************

{$MODE Delphi}

interface


function LoadData: boolean;
procedure CreateAddFiles;
procedure PrintTaskDemo(addinfo: string; utf8: boolean; studname, varinfo: string; avarinfo: char);
function CheckAllResults: boolean;
procedure SetHeaderInfoBrief(var sb: string);
procedure PrintTask(addinfo: string; utf8: boolean; studname, varinfo: string; avarinfo: char; repinfo: string; areprinfo: char);
procedure DeleteDatFiles;
procedure DeleteAddFilesAndFreeObjects;
function GetProcessCount: integer;
function GetRawTaskText: string;

implementation

uses Classes, SysUtils, UComments, UPrint, UCommon, ansiutf8, pt4html, ULocale; 

var
 AcquaintanceRunMsg0: string = 'Acquaintance running.';
 NoInputMsg0: string = 'Data are not input.';
 NotAllInputMsg0: string = 'Some required data are not input.';
 TooManyInputMsg0: string = 'An attempt to input superfluous data.';
 WrongTypeInputMsg0: string = 'Invalid type is used for an input data item.';
 NoTaskCallMsg0: string = 'The Task function is not called at beginning of the program.';

var
  TaskCount, NumberOfTests, NumberOfUsedData,
  TaskNumber, TestNumber: integer;
  DataHeight, ResultHeight: integer;
  GrTopic, GrDescr, GrAuthor, SubgrDescr: string;
  idata, odata: TDataArray;
  icmt, ocmt, ttext: TCommentArray;
  rawttext: array[0..maxItemSize - 1] of string; 
  nttext, nicmt, nocmt, nidata, nodata, cursize: integer;

type 
  THeaderArray = array[0..MaxProcessCount - 1] of string; 
  TAHeaderArray = array[0..MaxProcessCount - 1] of char; 

var
  rdata: TDataArray;
  nrdata: integer;
  headersize: integer;
  headerinfos: THeaderArray; 
  aheaderinfos: TAHeaderArray;  

  ifdata, ofdata, rfdata: TFileDataArray;
  fdata: TFileArray;
  nifdata, nofdata, nrfdata, nfdata: integer;

  uOptions: string;



function LoadData: boolean;
var f: TextFile;
    ver, s: string;
    i, j: integer;  
begin
  result := false;
  if not FileExists(UTDirName + DatFileName) then 
     exit;
  try
    AssignFile(f, UTDirName + DatFileName); 
    Reset(f);
    readln(f, ver);
    if ver <> PTVer then
    begin
       writelnLoc('������: �������� ������ (' + ver + ') ����� ' + UTDirName + DatFileName + ' (��������� ������ ' + PTVer + ').',
                  'ERROR: wrong version (' + ver + ') for the ' + UTDirName + DatFileName + ' file (should be ' + PTVer + ').'); 
       exit;
    end;
    readln(f, GrTopic);
    readln(f, TaskNumber, TaskCount);
    readln(f, GrDescr);
    readln(f, SubgrDescr);
    readln(f, GrAuthor);
    readln(f, NumberOfTests, TestNumber, NumberOfUsedData, DataHeight, ResultHeight);
    readln(f, nttext, nicmt, nocmt, nidata, nodata, cursize);
    for i := 0 to nttext - 1 do
    begin
      readln(f, ttext[i].x, ttext[i].y);
      readln(f, rawttext[i]);
      ttext[i].s := realComment(rawttext[i], ttext[i].a, GrTopic, TaskNumber);
    end;
    for i := 0 to nicmt - 1 do
    begin
      readln(f, icmt[i].x, icmt[i].y);
      readln(f, s);
      icmt[i].s := realComment(s, icmt[i].a, GrTopic, TaskNumber);
    end;
    for i := 0 to nocmt - 1 do
    begin
      readln(f, ocmt[i].x, ocmt[i].y);
      readln(f, s);
      ocmt[i].s := realComment(s, ocmt[i].a, GrTopic, TaskNumber);
    end;
    for i := 0 to nidata - 1 do
    begin
      readln(f, idata[i].id, idata[i].x, idata[i].y, idata[i].w, idata[i].p, idata[i].r);
      case idata[i].id of
        'b', 'i', 'r': readln(f, idata[i].n);
        'c', 's':      readln(f, idata[i].s);
      end;
    end;
    for i := 0 to nodata - 1 do
    begin
      readln(f, odata[i].id, odata[i].x, odata[i].y, odata[i].w, odata[i].p, odata[i].r);
      case odata[i].id of
        'b', 'i', 'r': readln(f, odata[i].n);
        'c', 's':      readln(f, odata[i].s);
      end;
    end;
    readln(f, nifdata, nofdata, nfdata);
    for i := 0 to nifdata - 1 do
    begin
      readln(f, ifdata[i].s); 
      readln(f, ifdata[i].id, ifdata[i].n, ifdata[i].x, ifdata[i].y, ifdata[i].w, ifdata[i].p, ifdata[i].r);
    end;
    for i := 0 to nofdata - 1 do
    begin
      readln(f, ofdata[i].s); 
      readln(f, ofdata[i].id, ofdata[i].n, ofdata[i].x, ofdata[i].y, ofdata[i].w, ofdata[i].p, ofdata[i].r);
    end;
    for i := 0 to nfdata - 1 do
    begin
      readln(f, fdata[i].name);
      readln(f, fdata[i].id, fdata[i].size);
      for j := 0 to fdata[i].size - 1 do 
        case fdata[i].id of
        'I': readln(f, fdata[i].n[j]);
        'R': readln(f, fdata[i].n[j]);
        'C','S','T': readln(f, fdata[i].s[j]);
        end;
    end;
    CloseFile(f);
    result := true;
  except
    result := false;
  end;

end;

function GetRawTaskText: string;
var i: integer;
begin
  result :=  GrDescr + #13#10 + GrAuthor + #13#10 + SubgrDescr + #13#10 + GrAuthor + #13#10 + GrTopic + IntToStr(TaskNumber) + #13#10;
  for i := 0 to nttext - 1 do
    result := result + rawttext[i] + ' ';
  result := result;
end;


procedure CreateInputFile(ind: integer);
var fi: file of integer;
    fr: file of real;
    fc: file of char;
    fs: file of shortstring;
    ft: text;
    name: string;
    i, j, fileind, size, n: integer;
    c, c0, id: char;
begin
  fileind := Round(ifdata[ind].n);  
  name := fdata[fileind].name;
  size := fdata[fileind].size;
  id := fdata[fileind].id;
  case id of
  'I': begin
         Assign(fi, name);
         Rewrite(fi);
         for i := 0 to size - 1 do
         begin
           n := Round(fdata[fileind].n[i]);
           write(fi, n);
         end;
         Close(fi);
       end;
  'R': begin
         Assign(fr, name);
         Rewrite(fr);
         for i := 0 to size - 1 do
           write(fr, fdata[fileind].n[i]);
         Close(fr);
       end;
  'C': begin
         Assign(fc, name);
         Rewrite(fc);
         for i := 0 to size - 1 do
           write(fc, fdata[fileind].s[i][1]);
         Close(fc);
       end;
  'S': begin
         Assign(fc, name);
         Rewrite(fc);
         c0 := #0;
         for i := 0 to size - 1 do
         begin
           for j := 1 to length(fdata[fileind].s[i]) do
             write(fc, fdata[fileind].s[i][j]);
           for j := length(fdata[fileind].s[i]) + 1 to 80 do
             write(fc, c0);
         end;
         Close(fc);
       end;
  'T': begin
         Assign(ft, name);
         Rewrite(ft);
         for i := 0 to size - 1 do
            writeln(ft, fdata[fileind].s[i]);
         Close(ft);
       end;
  end;
end;


procedure CreateAddFiles;
var f: TextFile;
    i,j: integer;
    isOpen: boolean;
begin
  DeleteFiles('', UTDirName + 'pt5in*.dat');
  DeleteFiles('', UTDirName + 'pt5out*.dat');
  DeleteFiles('', UTDirName + 'pt5err*.dat');
  DeleteFiles('', UTDirName + 'pt5sh*.dat');
  DeleteFiles('', '*.tst');
  for i := 0 to cursize - 1 do
  begin
    AssignFile(f, UTDirName + 'pt5inf'+IntToStr(i)+'.dat');
    Rewrite(f);
    writeln(f, '20');    // Taskbook version  
    writeln(f, cursize); // number of processes
    writeln(f, NumberOfUsedData); // number of used data (in the process 0);
    CloseFile(f);
  end;
  for i := 0 to cursize - 1 do
  begin
    AssignFile(f, UTDirName + 'pt5err'+IntToStr(i)+'.dat');
    Rewrite(f);
    writeln(f, NoTaskCallMsg0);  // �����, ������������, ��� � ������ ��������� (����� ����� ������� ��������� ���������)
                                 // �� ���� ������� ������� Task
    CloseFile(f);
    isOpen := false;
    for j := 0 to nidata - 1 do
    begin
      if idata[j].r = i then
      begin
          if not isOpen then
          begin
              AssignFile(f, UTDirName + 'pt5in'+IntToStr(i)+'.dat');
              Rewrite(f);
              isOpen := true;
          end;
          writeln(f, idata[j].id);
          case idata[j].id of
          'b', 'i': writeln(f, round(idata[j].n));
          'r':      writeln(f, idata[j].n);
          'c','s':  writeln(f, idata[j].s);
          end;
      end;
    end;
    if isOpen then
        CloseFile(f);
  end;
  for i := 0 to nifdata - 1 do
    CreateInputFile(i);
end;


function CompareResult(oitem, ritem: TData): boolean;
var s1, s2: string;
begin
  case oitem.id of
  'b', 'i': result := Round(ritem.n) = Round(oitem.n);
  'r':
    begin
      s1 := RealToStr(ritem.n, ritem.w , ritem.p);
      s2 := RealToStr(oitem.n, oitem.w , oitem.p);
      result := s1 = s2;
    end;
  'c','s':  result := ritem.s = oitem.s;
  end;
end;

function CompareFileResult(i: integer): boolean;
var s1, s2: string;
    j, rind, oind: integer;
begin
  result := false;
  rind := Round(rfdata[i].n);  
  oind := Round(ofdata[i].n);  
  if fdata[rind].size <> fdata[oind].size then
    exit;
  for j := 0 to fdata[oind].size-1 do
  case ofdata[i].id of
  'I': if Round(fdata[rind].n[j]) <> Round(fdata[oind].n[j]) then
         exit;
  'R':
    begin
      s1 := RealToStr(fdata[rind].n[j], ofdata[i].w, ofdata[i].p);
      s2 := RealToStr(fdata[oind].n[j], ofdata[i].w, ofdata[i].p);
      if s1 <> s2 then
        exit;
    end;
  'C','S','T': if fdata[rind].s[j] <> fdata[oind].s[j] then
        exit;
  end;
  result := true;
end;

procedure SetHeaderInfo(s0: string; var s: string);
begin
  s := '';
  if s0 = AcquaintanceRunMsg0 then begin s := AcquaintanceRunMsg; end
  else if s0 = NoInputMsg0 then begin s := NoInputMsg; end
  else if s0 = NotAllInputMsg0 then begin s := NotAllInputMsg; end
  else if s0 = TooManyInputMsg0 then begin s := TooManyInputMsg; end
  else if s0 = WrongTypeInputMsg0 then begin s := WrongTypeInputMsg; end
  else if s0 = NoTaskCallMsg0 then begin s := NoTaskCallMsg; end;
end;

function CheckEmptyOutput: boolean;    // empty output AND empty (or absent) output files!
var r: integer;
    f: TextFile;
begin
  result := true;
  for r := 0 to cursize - 1 do
  begin
    if FileExists(UTDirName + 'pt5out' + IntToStr(r) + '.dat') then
    begin
      AssignFile(f, UTDirName + 'pt5out' + IntToStr(r) + '.dat');
      Reset(f);
      if not EOF(f) then
      begin
        result := false;
        CloseFile(f);
        exit;
      end
      else
        CloseFile(f);
    end;
  end;
end;

function CheckInput: integer; // 0 - no, 1 - all, -1 - some
var r, countall, countno: integer;
    f: TextFile;
    s: string;
begin
  result := -1;
  countall := 0;
  countno := 0;
  for r := 0 to cursize - 1 do
  begin
    if FileExists(UTDirName + 'pt5err' + IntToStr(r) + '.dat') then
    begin
      AssignFile(f, UTDirName + 'pt5err' + IntToStr(r) + '.dat');
      Reset(f);
      readln(f, s); 
      CloseFile(f);
      if (s = NoInputMsg0) or (s = AcquaintanceRunMsg0) then
         Inc(countno)
      else
        exit;
    end
    else 
      Inc(countall);
  end;
  if countno = cursize then
    result := 0
  else if countall = cursize then
    result := 1;
end;

function CheckNoOrEmptyResFiles: boolean;  //true, ���� ��� ����������� ������ (��� ������ ��� �������� ������)
var no_files, empty_files: integer;
    i, fsize: integer;
begin
    no_files := 0;
    empty_files := 0;
    nrfdata := 0;  // always will be equal to nofdata
    for i := 0 to nofdata-1 do
    begin
      AddFileData(rfdata, nrfdata, ofdata[i].id, ofdata[i].s, 
                  ofdata[i].x, ofdata[i].y, ofdata[i].w, ofdata[i].p,
                  fdata, nfdata, fsize, lgCPP);
      if fsize = -1 then
        Inc(no_files)
      else if (fsize = 0) and (fdata[Round(ofdata[i].n)].size > 0) then
        Inc(empty_files);
    end;
    result := no_files + empty_files = nofdata;
end;

procedure CheckResults(rank: integer; empty_output: boolean; var headerinfo: string; var aheaderinfo: char; 
    var nrdata_: integer; var rdata_: TDataArray);
var f: TextFile;
    n: real;
    id: char;
    s: string;
    i: integer;
    headerinfo0: string; 
    srank: string;
    nidata_, nodata_: integer;
    odata_: TDataArray;
    fsize, no_files, empty_files: integer;
    correct_input: boolean; // true - ���� ���� �������� ������, � ��� ��� ��������� �������
    empty_input: boolean;   // true - ���� ��� �������� ������, � ������� ������ ����� �� ����������
begin
  nrdata_ := 0;
  nodata_ := 0;
  nidata_ := 0;
  for i := 0 to nidata - 1 do
      if idata[i].r = rank then
        Inc(nidata_);
  for i := 0 to nodata - 1 do
      if odata[i].r = rank then
      begin
        odata_[nodata_] := odata[i];
        Inc(nodata_);
      end;
// fill rfdata
  no_files := 0;
  empty_files := 0;
  if rank = 0 then
  begin
    nrfdata := 0;  // always will be equal to nofdata
    for i := 0 to nofdata-1 do
    begin
      AddFileData(rfdata, nrfdata, ofdata[i].id, ofdata[i].s, 
                  ofdata[i].x, ofdata[i].y, ofdata[i].w, ofdata[i].p,
                  fdata, nfdata, fsize, lgCPP);
      if fsize = -1 then
        Inc(no_files)
      else if (fsize = 0) and (fdata[Round(ofdata[i].n)].size > 0) then
        Inc(empty_files);
    end;
  end;
  headerinfo := '';
  aheaderinfo := 'H'; // special char, must be replaced!
  srank := IntToStr(rank);
  empty_input := false; 
  correct_input := false; 
  if FileExists(UTDirName + 'pt5err' + srank + '.dat') then
  begin
      AssignFile(f, UTDirName + 'pt5err' + srank + '.dat');
      Reset(f);
      readln(f, headerinfo0); 
      SetHeaderInfo(headerinfo0, headerinfo);
      readln(f, aheaderinfo); 
      if aheaderinfo = 'E' then // ������ ������� ����������! ������ ������ �� ���������, ���� ������� �� ��� �����.
                                // � ��� ����������� ������ �������: '7', ������� �����, ����� �������, ����� ������� �� '2'   
      begin
        headerinfo := headerinfo0;
        aheaderinfo := '7';
      end
      else if headerinfo0 = NoTaskCallMsg0 then
      begin
        aheaderinfo := '2';
        CloseFile(f);
        exit;   // �� ���� ������� ������� Task, ��� �������� �� �����, ������ � ����������� ������ ������������ (������� ������ �� ���������!)
      end
      else if headerinfo0 = NoInputMsg0 then // ������ �� ������� 
      begin
        if nidata_ = 0 then                                  // ������ ������� � �� �����������!
                                                               // (�������� ������ ��� ��������� ������������� ����������)
        begin
          empty_input := true;
          headerinfo := '';
          aheaderinfo := 'H'; // special char, must be replaced!
        end
        else if empty_output then
        begin
          headerinfo := AcquaintanceRunMsg;
          aheaderinfo := '0';       // ��������������� ������, ����� � ���� �������� ��� �� ����� ������� ������,
                                    // ��� ��� �������������� ������ ��� (����� � ����� �������� �� ���������!)
        end;
      end;
      CloseFile(f);
  end
  else
    correct_input := true; // ����� pt5err ���, ��� ��������, ��� �� ���� ��������� �������, headerinfo ��-�������� ������.
{
  ����� ����� ����� �� ��� ���������� ������ ���� 3, 4, 5 (� ������ ��������� � ��� ���� �������� - �� ���� ��� ��������� ������������� ���������),
  ���� ���������� ��������������� ������ (��� ���� ��������� ������������� ���������),
  ���� �������, ��� ������ �� �������, �� ������ ������� � �� ����������� (������ ��� �������� ������������� ����������); ���� ������
     �� �������� �������������, ������� �� ������� �������� "�").
  ����� ����, � ���������� empty_input � correct_input ���������� ���������� � ���������� ������� ������� ������ (���������� ����� ��� �������
  �������� "�� ������� (��� ������ ������� �� �����������), ������ �� ��������).
}
  if FileExists(UTDirName + 'pt5out' + srank + '.dat') then
  begin
      AssignFile(f, UTDirName + 'pt5out' + srank + '.dat');
      Reset(f);
      while not EOF(f) do
      begin
        if nrdata_ = nodata_ then
        begin
          if headerinfo = '' then
          begin
             headerinfo := TooManyOutputMsg;
             aheaderinfo := '4'; 
          end;
          break;
        end;
        readln(f, id);
        if id <> odata_[nrdata_].id then
        begin
          if headerinfo = '' then
          begin
             headerinfo := WrongTypeOutputMsg;
             aheaderinfo := '5'; 
          end;
          break;
        end;
        rdata_[nrdata_] := odata_[nrdata_];
        case id of
        'b', 'i', 'r': readln(f, rdata_[nrdata_].n);
        'c','s':       readln(f, rdata_[nrdata_].s);
        end;
        nrdata_ := nrdata_ + 1;
      end;
      CloseFile(f);
  end;
{
    �� ���� ����� �� ��������� (�� �����������) ��� �������, ��������� � ��������� �������, � ���������� ��� ���� ������ ������: 4 � 5;
    ���� ��� ������ ������, �� ���������� � ��� �������� � headerinfo.
}



{
    ������ �������� ���������� ��������� �� ������������������ ������ �����-������: ����� �� ���� ������
    ��� ������ ������ ���� ����� �� ���������� �������� headerinfo, ������ ���������� ����� ������������ ��������, ����� ������ ������ �� ��������,
    ��������� ��� ����� �������� ���� ������ 3, ���� ��������� �������� 6 "�� ������� (��� ������ ������� �� �����������), ������ �� ��������".
    ����� ��� ���������� ���� empty_output: ������ ���� �� ����������, ����� ����� �������� � ����������� �������� 6 (� ��������� ������
    "���-�� ���-��" ���� ��������, � ������� ���������� ������ � ���� �������� ���� ������������� ��� ������ 3).
}
  
  if (headerinfo = '') and (nrdata_ < nodata_) then
    if nrdata_ > 0 then // ��� ��������� ������: ���-�� �������, �� �� ��
    begin
      headerinfo := NotAllOutputMsg;
      aheaderinfo := '3'; 
    end
    else  // ������ �� ������; ������� ��������������� �������
          // NB: � ������ �������� ��������������� ������ ����������, 
          // ��� ��� ��� �� ���������� ������ (� ��������� headerinfo),
      if empty_output then // ��������� �������� 6: "�� ������� (��� ������ ������� �� �����������), ������ �� ��������"

      begin
        headerinfo := AllInputNoOutputMsg;
        aheaderinfo := '6'; 
      end
      else     // ����� ��� "�������" ������ ������ 3
      begin
        headerinfo := NoOutputMsg;
        aheaderinfo := '3'; 
      end;
//  writeln(rank, ' ', headerinfo, ' - ', aheaderinfo);
{
     ��� �������� 0 �������� ��� ���� ������ ��������: �������� ������ �������, ���������� �� �������� (�� � ����� ��������), 
     ��������� �� �� ����������� ��������, �� ����������� ������� ����� �����, � ��� �� ���� ������� ��� �������� �������. 
     ��� �������� ������ ������������� �������� 6: "�� ������� (��� ������ ������� �� �����������), ������ �� ��������".
     �������, ��� ���� ����������� ������������� ����, �� ������� 6 �������, ��� ��� ���� ����, �� �� �����, ����� ���������
     (��� ������ 2 - "��������� �������").
}

  if (rank = 0) and (headerinfo = '') and empty_output and (nodata_ = 0) and  
    (nrfdata > 0) and (no_files + empty_files = nrfdata) then
  begin
    headerinfo := AllInputNoOutputMsg;
    aheaderinfo := '6'; 
  end;

{
  ���� �� ����� �� ����� ����� � ��-�������� headerinfo �������� ������, �� ��� ��������, ��� ������� ������ �����-������ �� ��������,
  ������ �� �������� �� ���������������, �� ��������� 6, � ������� �������� ��������� ������������ ���������� � ����������� ������.
}
      

  if (headerinfo = '') and (nrdata_ = nodata_) then // ����� ����� ���������, ��� � �������� ������ �� ���������
  for i := 0 to nodata_ - 1 do
      if not CompareResult(odata_[i], rdata_[i]) then
      begin
        headerinfo := WrongSolutionMsg;
        aheaderinfo := '2';
        break;
      end;
// ��� �������� 0 ������������� ��������� ����� (���� ��� "�������" ������ �� ���� �������� ������)
  if (headerinfo = '') and (rank = 0) then
    for i := 0 to nofdata - 1 do
      if not CompareFileResult(i) then
      begin
        headerinfo := WrongSolutionMsg;
        aheaderinfo := '2';
        break;
      end;
{
   �������, ���� �� ����� ���� � ��-�������� headerinfo �������� ������, ������ �������� ������� �������� ����������.
}
  if headerinfo = '' then
  begin
    if TestNumber = NumberOfTests then
    begin
      headerinfo := TaskIsSolvedMsg;
    end
    else
    begin
      headerinfo := RightSolutionMsg;
    end;
    aheaderinfo := '1';
  end;
//  writeln(rank, ' ', headerinfo, ' - ', aheaderinfo);
end;

function getprcinfo(c: char; msg: string; var headerinfos_: THeaderArray; var aheaderinfos_: TAHeaderArray; var len: integer): string; 
// ����������� ������ ��������� ������ � ����������� ����� ���� 3-5,11-13,15,17
var prev, last, i, n: integer;
    a: array[0..MaxProcessCount - 1] of integer;
begin
  result := '';
  len := 0;
  n := 0;
  for i := 0 to cursize - 1 do
    if (aheaderinfos_[i] = c) and (headerinfos_[i] = msg) then
    begin
      a[n] := i;
      Inc(n);
    end;
  if n = 0 then 
    exit;
  prev := -10; last := -10; 
  for i := 0 to n - 2 do
  begin
    if a[i] <> prev + 1 then
    begin
      if prev >= 0 then
      begin
        if prev <> last then
          result := result + '-' + IntToStr(prev);
        result := result + ',';
      end;
      result := result + IntToStr(a[i]);
      last := a[i];
    end;
    prev := a[i];
  end;
  if a[n-1] <> prev + 1 then
  begin
    if prev >= 0 then
    begin
      if prev <> last then
        result := result + '-' + IntToStr(prev);
      result := result + ',';
    end;
    result := result + IntToStr(a[n-1]);
  end
  else
    result := result + '-' + IntToStr(a[n-1]);
  len := length(result);
  result := result + ProcessInfoDelim + msg;
end;

procedure AddHeader(c: char; msg: string; len: integer; var maxlen: integer);
begin
  if msg = '' then exit;
  headerinfos[headersize] := msg;
  aheaderinfos[headersize] := c;
  Inc(headersize);
  if maxlen < len then
    maxlen := len;
//  writeln(msg, ' ', len, ' ', maxlen);
end;


function GetSubstr(var s: string; n: integer): string; // ��������� ������� ����� ����������� �� ��������, 
                                                       // � ���� �� ���, �� �� ����������� ���������� �����.
                                                       // ������ ����� ����������� ���������
var i: integer;
begin
  if length(s) <= n then
  begin
    result := s;
    s := '';
  end
  else
  begin
    for i := n + 1 downto 1 do
      if s[i] = ' ' then
      begin
        result := TrimRight(Copy(s, 1, i - 1));
        s := TrimLeft(Copy(s, i + 1, length(s)));
        exit;
      end;
    result := Copy(s, 1, n);
    s := Copy(s, n + 1, length(s));
  end;
end;

function GetSubstrUTF(var s: string; n: integer): string; // ��������� ������� ����� ����������� �� ��������, 
                                                       // � ���� �� ���, �� �� ����������� ���������� �����.
                                                       // ������ ����� ��������� UTF-8
function uw(c: char): integer;
begin
  if ord(c) < 226 then // < $E2
    result := 1
  else
    result := 2;   // ��������� ����� ������� ������!
end;

function ulength(s: string): integer;
var i: integer;
begin
  result := 0;
  i := 1;
  while i <= length(s) do
  begin
    result := result + uw(s[i]);
    i := i + USize(s[i]);
  end;
end;

function pind(s: string; pos: integer; var uind: integer): integer; // ���������� � �������, ����������� �� ������� pos (� ������ ������ ��������)
var i, i0, p: integer;
begin
  i := 1;    // ������ �������� �������
  p := 1;    // ������� (� ������ ������ ��������)
  uind := 1; // ������ UTF-������� 
  while p < pos do
  begin
    p := p + uw(s[i]);
    i0 := i;
    i := i + USize(s[i]);
    uind := uind + 1;
  end;
  if (p > pos) or ((p = pos) and (uw(s[i]) > 1)) then
  begin
     i := i0;
     uind := uind - 1;
  end;
  result := i;
end;


function uTrimRight(s: string): string;
begin
  while (s <> '') and (s[length(s)] = ' ') do
    delete(s, length(s), 1);
  result := s;
end;

function uTrimLeft(s: string): string;
begin
  while (s <> '') and (s[1] = ' ') do
    delete(s, 1, 1);
  result := s;
end;

var i, uind: integer;
begin
  if ulength(s) <= n then
  begin
    result := s;
    s := '';
  end
  else
  begin
    for i := n + 1 downto 1 do
      if s[pind(s, i, uind)] = ' ' then
      begin
        result := uTrimRight(UTF8Copy(s, 1, uind - 1));
        s := uTrimLeft(UTF8Copy(s, uind + 1, UTF8Length(s)));
        exit;
      end;
    pind(s, n, uind);
    result := UTF8Copy(s, 1, uind);
    s := UTF8Copy(s, uind + 1, UTF8length(s));
  end;
end;


function CheckAllResults: boolean;
var r, i, j: integer;
    headerinfos_: THeaderArray; 
    aheaderinfos_: TAHeaderArray; 
    nrdata_: integer; 
    rdata_: TDataArray;
    c: char;
    attr: array ['0'..'7'] of integer;
    empty_output, file_output: boolean;
    info_input: integer;
    prcinfo, s0: string;
    len, maxlen: integer;
begin
    result := false;
    empty_output := CheckEmptyOutput;
    info_input := CheckInput;
    file_output := CheckNoOrEmptyResFiles;
    nrdata := 0; // total info about results!!!
    for c := '0' to '6' do
      attr[c] := 0;
    for r := 0 to cursize - 1 do
    begin
      CheckResults(r, empty_output, headerinfos_[r], aheaderinfos_[r], nrdata_, rdata_);
      for i := 0 to nrdata_ - 1 do
      begin
        rdata[nrdata] := rdata_[i];
        Inc(nrdata);
      end;  
      Inc(attr[aheaderinfos_[r]]);
    end;
    headersize := 1;
    if cursize = 1 then
    begin
      headerinfos[0] := headerinfos_[0];
      aheaderinfos[0] := aheaderinfos_[0];
      if aheaderinfos[0] = '7' then
        aheaderinfos[0] := '2';
      result := aheaderinfos[0] = '1';
    end
    else
    begin
      result := false;
      if (info_input = 0) and file_output and empty_output then
      begin
        headerinfos[0] := AcquaintanceRunMsg;
        aheaderinfos[0] := '0';
        exit;
      end;
      if (info_input = 1) and file_output and empty_output then
      begin
        headerinfos[0] := AllInputNoOutputMsg;
        aheaderinfos[0] := '6';
        exit;
      end;
      if attr['3'] + attr['4'] + attr['5'] + attr['2'] + attr['7'] > 0 then
      begin
        if attr['0'] > 0 then // ���� ���� �����-�� ������, �� ��������������� ����� ����������: ��� ������ �����!
           for r := 0 to cursize - 1 do
             if aheaderinfos_[r] = '0' then
             begin
               headerinfos_[r] := NoInputMsg;
               aheaderinfos_[r] := '3';
               Inc(attr['3']);
               Dec(attr['0']);
             end;
        if attr['6'] > 0 then // ���� ���� �����-�� ������, �� ����� 6 (��� �������, ������ �� ��������) ����������: ��� ������ ������!
           for r := 0 to cursize - 1 do
             if aheaderinfos_[r] = '6' then
             begin
               headerinfos_[r] := NoOutputMsg;
               aheaderinfos_[r] := '3';
               Inc(attr['3']);
               Dec(attr['6']);
             end;
      end
      else if (attr['0'] > 0) and (attr['6'] > 0) then 
      // ���� ���-�� "��������������� ������", � ���-�� ����� 6, �� ��� ������, ��� � ���, � ��� ������: ��� ���������������� ������� - ������ �����,
      // ��� ����� 6 - ������ ������!
      begin
           for r := 0 to cursize - 1 do
             if aheaderinfos_[r] = '0' then
             begin
               headerinfos_[r] := NoInputMsg;
               aheaderinfos_[r] := '3';
               Inc(attr['3']);
               Dec(attr['0']);
             end;
           for r := 0 to cursize - 1 do
             if aheaderinfos_[r] = '6' then
             begin
               headerinfos_[r] := NoOutputMsg;
               aheaderinfos_[r] := '3';
               Inc(attr['3']);
               Dec(attr['6']);
             end;
      end;
      if attr['3'] + attr['4'] + attr['5'] > 0 then // input-output error
      begin
        headersize := 0;
        maxlen := 1;
        prcinfo := getprcinfo('3', NoInputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('3', prcinfo, len, maxlen);
        prcinfo := getprcinfo('3', NotAllInputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('3', prcinfo, len, maxlen);
        prcinfo := getprcinfo('4', TooManyInputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('4', prcinfo, len, maxlen);
        prcinfo := getprcinfo('5', WrongTypeInputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('5', prcinfo, len, maxlen);
        prcinfo := getprcinfo('3', NoOutputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('3', prcinfo, len, maxlen);
        prcinfo := getprcinfo('3', NotAllOutputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('3', prcinfo, len, maxlen);
        prcinfo := getprcinfo('4', TooManyOutputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('4', prcinfo, len, maxlen);
        prcinfo := getprcinfo('5', WrongTypeOutputMsg, headerinfos_, aheaderinfos_, len);
        AddHeader('5', prcinfo, len, maxlen);
        if attr['7'] > 0 then           // ���� ����� "���������� �������" ���� ��������� �� ������� ������� ���������� (���� "7") 
                                        // (��� ��������� �� �� ����������)
          for r := 0 to cursize - 1 do  
          begin
            if aheaderinfos_[r] = '7' then
            begin
               s0 := IntToStr(r);
               AddHeader('2', s0 + ProcessInfoDelim + headerinfos_[r], length(s0), maxlen);
            end;
          end;
        for i := 0 to headersize - 1 do
        begin
          len := Pos(ProcessInfoDelim, headerinfos[i]) - 1;
          for j := 1 to maxlen - len do
            headerinfos[i] := ' ' + headerinfos[i];
        end;
      end
      else if attr['2'] > 0 then
      begin
        headerinfos[0] := getprcinfo('2', WrongSolutionMsg, headerinfos_, aheaderinfos_, len);
        aheaderinfos[0] := '2';
        maxlen := len;
        if attr['7'] > 0 then           // ���� ����� "���������� �������" ���� ��������� �� ������� ������� ���������� (���� "7") 
                                        // (��� ��������� �� �� ����������)
          for r := 0 to cursize - 1 do  
            if aheaderinfos_[r] = '7' then
            begin
               s0 := IntToStr(r);
               AddHeader('2', s0 + ProcessInfoDelim + headerinfos_[r], length(s0), maxlen);
            end;
        for i := 0 to headersize - 1 do
        begin
          len := Pos(ProcessInfoDelim, headerinfos[i]) - 1;
          for j := 1 to maxlen - len do
            headerinfos[i] := ' ' + headerinfos[i];
        end;
      end
      else if attr['7'] > 0 then // �� ���� ������ ���� ������� ������ ������ ������� ���������� (�� �� ����������)
        for r := 0 to cursize - 1 do  
          begin
            if aheaderinfos_[r] = '7' then
            begin
               s0 := IntToStr(r);
               AddHeader('2', s0 + ProcessInfoDelim + headerinfos_[r], length(s0), maxlen);
            end;
          end
      else
      begin
        result := true;
        if TestNumber = NumberOfTests then
        begin
          headerinfos[0] := TaskIsSolvedMsg;
        end
        else
        begin
          headerinfos[0] := RightSolutionMsg;
        end;
        aheaderinfos[0] := '1';
      end;
    end;
end;


function InitString(c: char): string;
var i: integer;
begin
  result := '';
  for i := 1 to MaxWidth do
      result := result + c;
end;

function SplitString(s: string; n1, n2: integer): TStringList; // ��������� �� ��������, ������ ������ ����� ����� n1,
                                                               // ��������� - ����� n2, ������� ����������� ��������� �� ����� n1
var i, n: integer;
    s1, s0: string;
begin
  s0 := '';
  for i := 1 to n1 - n2 do
    s0 := s0 + ' ';
  result := TStringList.Create;
  n := n1;
  while s <> '' do
  begin
    s1 := GetSubstr(s, n);
    if n = n2 then
      s1 := s0 + s1;
    result.Add(s1);
    n := n2;
  end;
end;

//2024.04>
function ShrinkDescr(s: string): string;
begin
  result := Copy(s, 1, 76);
end;
//2024.04<

procedure PrintTaskInfoLine(var s, sa: string; forHeader: boolean);
var i: integer;
    s0, s3: string;
begin
  s := InitString(HLine1);
  sa := InitString('H');
//2024.04>
  s0 := '';  
  if not forHeader then // ��� ��������� ������������ ��������� ������ �������� ������/���������, 
                        // ��� ����� ������� � ��� ���������� ������,
                        // ����� ����� ���� ������������ ���� ������� ��������!
  begin
//    s0 := s0 + ' [' ;
    s3 := GrDescr;
    if SubgrDescr <> '' then
      s3 := SubgrDescr;
    s3 := ShrinkDescr(NormalText(s3));
    for i := 1 to length(s3) do
      s0 := s0 + s3[i];
//    s0 := s0 + ']';
  end
  else
    s0 := GrTopic + IntToStr(TaskNumber); 
//2024.04>
  PrintCmt(s, s0, 3, sa, 'H');  // !!!!!!! �������� ��������� ���������: ���� ������ ���������� ��� ������ (� ��� ����� �������),
                                // �� ����������� ������� ������ ������������� ����������� � ��������� UTF8 !!!!!!!!!!!!!!!!!!!!!
  if (TestNumber > 0) and forHeader then
    PrintCmt(s, '(' + IntToStr(TestNumber) + '/' + IntToStr(NumberOfTests) + ')', 74, sa, 'H');
end;

procedure PrintHeader(Runsize: integer; RunInfo: THeaderArray; aRunInfo: TAHeaderArray; 
  studname, varinfo: string; avarinfo: char; repinfo: string; arepinfo: char);
var s, s0, s1, s2, s3: string; 
    sa: string; 
    i, j: integer;
    ss: TStringList;
begin
//  writeln(GrDescr);
  PrintTaskInfoLine(s, sa, true);
  writelnToSection(upHeader, s, sa); 

  if studname <> '' then
  begin
    s := InitString(' ');
    sa := InitString('C');
    PrintCmt(s, studname, 3, sa, 'C'); 
    if varinfo <> '' then                 // ���������� � ���, ������ �� ������� � �������
      PrintCmt(s, varinfo, 80 - length(varinfo), sa, avarinfo);
    writelnToSection(upHeader, s, sa); 

    s := InitString(' ');
    sa := InitString('C');
    if repinfo <> '' then  // ��� ������� ���������� � ����������� ��� ����������� � ��������� �� ��������� ������ (����� ������ � ��������)
    begin
      PrintCmt(s, repinfo, 3, sa, arepinfo);
      writelnToSection(upHeader, s, sa); 
    end;
  end;

  for i := 0 to Runsize - 1 do
  begin
    ss := SplitString(RunInfo[i], 77, 70); // 77 - ��������� ���� ������� ������ (��� ������������ �����)
    for j := 0 to ss.Count - 1 do
    begin
      s := InitString(' ');
      sa := InitString(aRunInfo[i]);
      PrintCmt(s, ss[j], 3, sa, aRunInfo[i]);
      writelnToSection(upHeader, s, sa); 
    end;
  end;
end;

procedure PrintTaskText;
var s, sa: array of string;
    s0, sa0: string;
    s1, s2: string;
    i: integer;
    sa1, sa2: string; 
begin
//  writelnToSection(upTaskText, s0, sa0); 
  SetLength(s, nttext + 1);
  SetLength(sa, nttext + 1);
  s1 := InitString(' ');
  s2 := InitString(HLine1);
  sa1 := InitString('C');
  sa2 := InitString('H');
  s[0] := s2;
  for i := 1 to nttext do
  begin
    s[i] := s1;
    sa[i] := sa1;
  end;
  for i := 0 to nttext - 1 do
    PrintCmtAttr(s[ttext[i].y], ttext[i].s, ttext[i].x, sa[ttext[i].y], ttext[i].a);
  PrintTaskInfoLine(s0, sa0, false);
  writelnToSection(upTaskText, s0, sa0); 
  for i := 1 to nttext do
    writelnToSection(upTaskText, s[i], sa[i]); 
// ��� ������� ������������ ������ �� ���������
end;

procedure PrintFileRow(var s: string; id: char; fileind, startind, count, w, p: integer; check: boolean; var sa: string; ca: char);
var i: integer;
    s0: string;
begin
  Str((startind + 1):3, s0);
  PrintCmt(s, s0 + ': ', 2, sa, 'C');
  for i := startind to startind + count - 1 do
  begin
    if i >= fdata[fileind].size then
      exit;
    case id of
    'I': PrintN(s, Round(fdata[fileind].n[i]), 7 + (i - startind) * w, w, check, sa, ca);
    'R': PrintR(s, fdata[fileind].n[i], 7 + (i - startind) * w, w, p, check, sa, ca);
    'C': PrintC(s, fdata[fileind].s[i][1], 7 + (i - startind) * w, sa, ca);
    'S','T': PrintS(s, fdata[fileind].s[i], 7 + (i - startind) * w, w, sa, ca);
    end;
  end;
end;


procedure PrintFileInfo(var f: TFileDataArray; ind: integer; check: boolean; ca: char; var sres, sares: string);
var fi, i: integer;
    s: string;
    sa: string;
begin
  sres := '';
  sares := '';
  s := InitString(' ');
  sa := InitString(ca);
  fi := Round(f[ind].n);
  if fdata[fi].size = -1 then
  begin
    PrintCmt(s, FileNotFoundMsg, 2, sa, 'C');
    sres := s;
    sares := sa;
    exit;
  end;
  if fdata[fi].size = 0 then
  begin
    PrintCmt(s, 'EOF:', 2, sa, 'C');
    sres := s;
    sares := sa;
    exit;
  end;
  for i := 0 to f[ind].r - 1 do
  begin
    PrintFileRow(s, f[ind].id, fi, i * f[ind].x, f[ind].x, f[ind].w, f[ind].p, check, sa, ca);
    sres := sres + s;
    sares := sares + sa;
    s := InitString(' ');
    sa := InitString(ca);
  end;   
end;

procedure PrintData(var a: TDataArray; na: integer; var b: TCommentArray; nb: integer; // add 'var' for efficiency
  size: integer; title: string; check: boolean;
  var f: TFileDataArray; nf: integer; ca, cf: char); 
  var s: array of string;
      sa: array of string; 
      smini, samini: array of string;
      s1, s2: string;
      sa1, sa2: string; 
      i: integer;
      stemp, satemp: array of string; 
      realRowCount, j, k: integer; 
      miniCount: integer;
      s0mini, sa0mini: string;
  begin
    realRowCount := size + 1;  
    SetLength(s, size + 1);
    SetLength(sa, size + 1); 
    s1 := InitString(' ');
    s2 := InitString(HLine1);
    s0mini := InitString(' ');
    sa1 := InitString('C');
    sa2 := InitString('H');
    sa0mini := InitString('C');
    PrintCmt(s0mini, '...', 7, sa0mini, 'C'); 
    s[0] := s2;
    sa[0] := sa2; 
    for i := 1 to size do
    begin
      s[i] := s1;
      sa[i] := sa1; 
    end;
    PrintCmt(s[0], title, 3, sa[0], 'H');  
    for i := 0 to na - 1 do
      case a[i].id of
      'b': PrintB(s[a[i].y], Round(a[i].n), a[i].x, sa[a[i].y], ca);
      'i': PrintN(s[a[i].y], Round(a[i].n), a[i].x, a[i].w, check, sa[a[i].y], ca);
      'r': PrintR(s[a[i].y], a[i].n, a[i].x, a[i].w, a[i].p, check, sa[a[i].y], ca);
      'c': PrintC(s[a[i].y], a[i].s[1], a[i].x, sa[a[i].y], ca);
      's': PrintS(s[a[i].y], a[i].s, a[i].x, a[i].w, sa[a[i].y], ca);
      end;
    for i := 0 to nb - 1 do
      PrintCmtAttr(s[b[i].y], b[i].s, b[i].x, sa[b[i].y], b[i].a); 
    for i := 0 to nf - 1 do
      if f[i].y <> 0 then
      begin
        PrintFileInfo(f, i, check, cf, s[f[i].y], sa[f[i].y]);
        realRowCount := realRowCount + length(s[f[i].y]) div MaxWidth - 1;
      end;
    if realRowCount >  size + 1 then
    begin
      SetLength(stemp, size + 1);
      SetLength(satemp, size + 1);
      for i := 0 to size do
      begin
        stemp[i] := s[i];
        satemp[i] := sa[i];
      end;
      SetLength(s, realRowCount);
      SetLength(sa, realRowCount);
      SetLength(smini, realRowCount);
      SetLength(samini, realRowCount);
      j := 0;
      for i := 0 to size do
        for k := 0 to length(stemp[i]) div MaxWidth - 1 do
        begin
          s[j] := Copy(stemp[i], 1 + k * MaxWidth, MaxWidth);
          sa[j] := Copy(satemp[i], 1 + k * MaxWidth, MaxWidth);
          Inc(j);
        end;

      SetLength(smini, realRowCount);
      SetLength(samini, realRowCount);
      j := 0;
      for i := 0 to size do
        for k := 0 to length(stemp[i]) div MaxWidth - 1 do
        if k < 5 then
        begin
          smini[j] := Copy(stemp[i], 1 + k * MaxWidth, MaxWidth);
          samini[j] := Copy(satemp[i], 1 + k * MaxWidth, MaxWidth);
          Inc(j);
        end
        else
        begin
          smini[j] := s0mini;
          samini[j] := sa0mini;
          Inc(j);
          break;
        end;
      miniCount := j;
    end
    else
      miniCount := size + 1;
//    size := realRowCount - 1;
    writelnToSection(upIOData, s[0], sa[0]); 
    for i := 1 to realRowCount - 1 do
      writelnToSection(upIOData, s[i], sa[i]); 
    if miniCount = size + 1 then
    begin
      writelnToSection(upMiniIOData, s[0], sa[0]); 
      for i := 1 to miniCount - 1 do
        writelnToSection(upMiniIOData, s[i], sa[i]); 
    end
    else
    begin
      writelnToSection(upMiniIOData, smini[0], samini[0]); 
      for i := 1 to miniCount - 1 do
        writelnToSection(upMiniIOData, smini[i], samini[i]); 
    end;
  end;

procedure PrintStartLine;
var s,sa: string;
begin
  s := InitString(HLine2);
  sa := InitString('H');
  PrintCmt(s, SPTHeaderTitle, 3, sa, 'H');
  writelnToSection(upStartLine, s, sa); 
end;

procedure PrintEndLine;
begin
  writelnToSection(upEndLine, InitString(HLine2), InitString('H')); 
end;

procedure PrintShowEndLine;
begin
  writelnToSection(upShowEndLine, InitString(HLine1), InitString('N')); 
end;

procedure PrintShow;  
var f: TextFile;
    s, s1, s0, ssub: string;
    sa: string; 
    i, j, k, x: integer;
    isShow: boolean;
    delim, srank, snum: string;
begin
// ������: ��� �������������� ����������: nnn>ss�����
//         ��� ������������ ����������:   rr|nnn>ss�����
//         rr - ����, nnn - ����� ���������� ������, ss - ��� �������

  isShow := false;
  for i := 0 to curSize - 1 do
    if FileExists(UTDirName + 'pt5sh' + IntToStr(i) + '.dat') then
    begin
      isShow := true;
      break;
    end;
  if not isShow then 
    exit;
  delim := '';
  x := 6;
  s0 := InitString(HLine1);
  s1 := InitString(' ');
  sa := InitString('N'); // � ������ Show �������� �������� �� ������������!
  PrintCmt(s0, DebugInfoMsg, 3, sa, 'N');    
  writelnToSection(upShow, s0, sa); 
  for i := 0 to curSize - 1 do
  begin
    srank := IntToStr(i);
    if FileExists(UTDirName + 'pt5sh' + srank + '.dat') then
    begin
      AssignFile(f, UTDirName + 'pt5sh' + srank + '.dat');
      Reset(f);
      if curSize > 1 then
      begin
        if length(srank) = 1 then
          srank := ' ' + srank;
        delim := srank + '|';
        x := 9;
      end;
      k := 0;
      while not EOF(f) do
      begin
        readln(f, s);
        s := PT4AnsiToUtf8(s);                     // ����� ��������� ������ � ������� UTF-8
        while s <> '' do
        begin
          Inc(k);
          Str(k:3, snum);
          ssub := GetSubstrUTF(s, MaxWidth - x);
          s0 := delim + snum + '>  '  + ssub;      // ������ ���������� � ������ �������, 
          writelnToSection(upShow, s0, 'U');       // ���������� ������ ��������� U (������ ��������� ������� �� ������������� �������!)
        end;
      end;
      CloseFile(f);
    end;
  end;
end;

procedure PrintAddInfo(ss: string; utf8: boolean);
var s, s1, s0, ssub: string;
    sa: string; 
function NextLine: string;
var p: integer;
begin
  p := Pos(#13#10, ss);
  if p > 0 then
  begin
    result := Copy(ss, 1, p - 1);
    if result = '' then
      result := ' ';
    Delete(ss, 1, p + 1);
  end
  else
  begin
    result := ss;
    ss := '';
  end;
end;
begin
  if ss = '' then
    exit;
  s0 := InitString(HLine1);
  s1 := InitString(' ');
  sa := InitString('N'); // � ������ Show � AddInfo �������� �������� �� ������������!
  PrintCmt(s0, AddInfoMsg, 3, sa, 'N');  
  writelnToSection(upAddInfo, s0, sa); 
  writelnToSection(upMiniAddInfo, s0, sa); 
  s0 := s1;
  PrintCmt(s0, '...', 3, sa, 'N');  
  writelnToSection(upMiniAddInfo, s0, sa); 
  if not utf8 then
    while ss <> '' do
    begin
      s := NextLine;
      while s <> '' do
      begin
        ssub := GetSubstr(s, MaxWidth);
        writelnToSection(upAddInfo, PT4AnsiToUtf8(ssub), 'U'); // ���������� ������ ��������� U (������ ��������� ������� �� ������������� �������!)
      end;
  end
  else  // ���������� ������ ��� ����� ��������� UTF-8
    while ss <> '' do
    begin
      s := NextLine;
      while s <> '' do
      begin
        ssub := GetSubstrUTF(s, MaxWidth);
        writelnToSection(upAddInfo, ssub, 'U'); // ���������� ������ ��������� U (������ ��������� ������� �� ������������� �������!)
      end;
    end;
end;


procedure SetHeaderInfoBrief(var sb: string); // ����������� �������� ��������� (��� results.dat) �� ������ ������ ������� ���������
                                              // sb - ������� � �������� ��������!
var i: integer;
    s: string;
begin
  s := headerinfos[0];
  if Pos(AcquaintanceRunMsg, s) > 0 then sb := AcquaintanceRunMsg
  else if Pos(AllInputNoOutputMsg, s) > 0 then sb := AllInputNoOutputMsgBrief
  else if Pos(NoInputMsg, s) > 0 then sb := NotAllInputMsg
  else if Pos(NotAllInputMsg, s) > 0 then sb := NotAllInputMsg
  else if Pos(TooManyInputMsg, s) > 0 then sb := TooManyInputMsg
  else if Pos(WrongTypeInputMsg, s) > 0 then sb := TooManyOutputMsgBrief
  else if Pos(NoTaskCallMsg, s) > 0 then sb := NoTaskCallMsgBrief 
  else if Pos(NoOutputMsg, s) > 0 then sb := NotAllOutputMsgBrief
  else if Pos(NotAllOutputMsg, s) > 0 then sb := NotAllOutputMsgBrief
  else if Pos(TooManyOutputMsg, s) > 0 then sb := TooManyOutputMsgBrief
  else if Pos(WrongTypeOutputMsg, s) > 0 then sb := WrongTypeOutputMsgBrief
  else if Pos(NoTaskCallMsg, s) > 0 then sb := NoTaskCallMsgBrief 
  else if Pos(AcquaintanceRunMsg, s) > 0 then sb := AcquaintanceRunMsg
  else if Pos(WrongSolutionMsg, s) > 0 then sb := WrongSolutionMsg
  else if Pos(TaskIsSolvedMsg, s) > 0 then 
     for i := 1 to Length(TaskIsSolvedMsgBrief) do 
            sb := sb + TaskIsSolvedMsgBrief[i]  // ����� �� ��������� ��������� � ���� ������!
  else if Pos(RightSolutionMsg, s) > 0 then sb := ''
  else sb := 'Run-time error.';
end;

// ������� ������ ������� ��������� ������ ���� ���� �� ������. ����� ��� ������ �����������, �� �� ���������!

procedure PrintTaskDemo(addinfo: string; utf8: boolean; studname, varinfo: string; avarinfo: char);
var RunInfo: THeaderArray;
    aRunInfo: TAHeaderArray;
begin
  RunInfo[0] := DemoRunMsg;
  aRunInfo[0] := '0';
  upInit;
  PrintStartLine;
  PrintHeader(1, RunInfo, aRunInfo, studname, varinfo, avarinfo, '', 'C');
  PrintTaskText;
  PrintData(idata, nidata, icmt, nicmt, DataHeight, InputDataInfoMsg, false, ifdata, nifdata, 'D', 'F');                   
  PrintData(odata, nodata, ocmt, nocmt, ResultHeight, ExampleInfoMsg, false, ofdata, nofdata, 'D', 'F');  
  PrintEndLine;
  PrintAddInfo(addinfo, utf8);
  PrintShowEndLine;
end;

procedure PrintTask(addinfo: string; utf8: boolean; studname, varinfo: string; avarinfo: char; repinfo: string; areprinfo: char);
var i: integer;
begin
  upInit;
  PrintStartLine;
  PrintHeader(headersize, headerinfos, aheaderinfos, studname, varinfo, avarinfo, repinfo, areprinfo);
  PrintTaskText;
  PrintData(idata, nidata, icmt, nicmt, DataHeight, InputDataInfoMsg, false, ifdata, nifdata, 'D', 'F');                    
  if (headerinfos[0] <> AcquaintanceRunMsg) and (headerinfos[0] <> AllInputNoOutputMsg) then
    PrintData(rdata, nrdata, ocmt, nocmt, ResultHeight, OutputDataInfoMsg, true, rfdata, nrfdata, 'D', 'F');                  
  if (headerinfos[0] <> RightSolutionMsg) and (headerinfos[0] <> TaskIsSolvedMsg) then
    PrintData(odata, nodata, ocmt, nocmt, ResultHeight, ExampleInfoMsg, false, ofdata, nofdata, 'G', 'G'); 
  PrintEndLine;
  PrintShow;
  PrintAddInfo(addinfo, utf8);
  PrintShowEndLine;
end;

procedure DeleteDatFiles;
begin
  DeleteFiles('', UTDirName + 'pt5in*.dat');
  DeleteFiles('', UTDirName + 'pt5out*.dat');
  DeleteFiles('', UTDirName + 'pt5err*.dat');
  DeleteFiles('', UTDirName + 'pt5sh*.dat');

end;

procedure DeleteAddFilesAndFreeObjects;
var i: integer;
begin
  upFinalize;
  DeleteFiles('', '*.tst');
  for i := 0 to nfdata - 1 do
    DeleteFile(fdata[i].name);
end;

function GetProcessCount: integer;
begin
  result := cursize;
end;


end.

