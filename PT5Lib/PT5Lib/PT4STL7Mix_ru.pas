//---------------------------------
unit PT4STL7Mix_ru;

{$A+,B-,D-,E+,F-,G-,I+,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y-}
{$MODE Delphi}

interface


procedure InitTask(num: integer); stdcall;
procedure inittaskgroup;


implementation


uses PT5TaskMaker, SysUtils;

//-----------------------------------

const
  famcount = 40;
  firmcount = 12;
  streetcount = 30;
  countrycount = 12;
  shopcount = 12;
  categorycount = 12;
  inpref = '';
  outpref = '';
var fam: array[1..famcount] of string =
  ('Ivanov','Petrov','Sidorov','Kuznetsov','Filippov',
   'Sergyev','Aleksandrov','Petukhov','Ponomarev','Yashin',
   'Grekov','Ivanova','Kuznetsova','Alekseeva','Zaitsev',
   'Volkova','Frolov','Yuriev','Bondarev','Semenov',
   'Semenova','Fedchenko','Marchenko','Borisova','Petrovsky',
   'Belyaeva','Belkin','Lysenko','Sorokina','Pastukhov',
   'Yurieva','Kondratyev','Timofeev','Stepanova','Yakimov',
   'Yusov','Stepanov','Rudenko','Demidov','Leonidov');
(*  ('������','������','�������','��������','��������',
   '�������','�����������','�������','���������','����',
   '������','�������','���������','���������','������',
   '�������','������','�����','��������','�������',
   '��������','��������','��������','��������','����������',
   '�������','������','�������','��������','��������',
   '������','����������','��������','���������','������',
   '����','��������','�������','�������','��������');*)
   subj: array[1..3] of string =
   ('Algebra', 'Geometry', 'Physics');
//  ('�������', '���������', '������');
     firm: array[1..firmcount] of string =
   ('Alpha-neft', 'Avangard', 'Leader', 'Lux-oil', 'Oil-brand', 'Oil-plus',
    'Oil-super', 'Oil-west', 'Optima', 'Premier-oil', 'Standard-oil', 'Yug-neft');
//   ('��������','�����-�����','�����','����-���','�����-����',
//    '�����-�����','���-�����','���-����','������','�������-�����','��������-���','��-�����');
     street: array[1..streetcount] of string =
   ('Aivazovsky_St.', 'Aviators_St.', 'Beryozovaya_St.', 'Bryullov_St.', 'Central_St.', 'Chekhov_St.', 'Dostoevsky_St.', 'Fabrichnaya_St.',
    'Gagarinskaya_St.', 'Gogol_St.', 'Kosmonavtov_St.', 'Krepostnaya_St.', 'Lermontovskaya_St.', 'Lesnaya_St.',
    'Mayakovsky_St.', 'Mussorgsky_St.', 'Pervomaiskaya_St.', 'Petrovskaya_St.',
    'Planernaya_St.', 'Pochtovaya_St.', 'Pushkinskaya_St.', 'Repin_St.', 'Sadovaya_St.', 'Shkolnaya_St.', 'Stroiteley_St.', 'Tchaikovsky_St.',
    'Universitetskaya_St.', 'Victory_St.', 'Yesenin_St.', 'Yuzhnaya_St.');
(*   ('��.���������','��.������������','��.���������','��.��������','��.�����������','��.������','��.������������','��.�������',
   '��.�����������','��.����������','��.�������������','��.������','��.�����������','��.�����������','��.������������','��.����������',
   '��.���������','��.������','��.��������','��.����������','��.������','��.�������','��.����������','��.���������������','��.���������',
   '��.�����������','��.�����������','��.������','��.��������','��.�����');*)
   mark: array[1..3] of integer = (92, 95, 98);
   country: array[1..countrycount] of string =
   ('Russia', 'China', 'Hungary', 'Germany', 'Turkey', 'France', 'USA', 'Malaysia', 'Poland', 'Belarus', 'Spain', 'Italy');
//   ('������','�����','�������','��������','������','�������','���','��������','������','��������','�������','������');
   shop: array[1..shopcount] of string =
      ('Polyot', 'Ducato', 'Guinea', 'Dream', 'Spring', 'Titul', 'Leader', 'Avangard', 'Lux', 'Premier', 'Super', 'Alpha');
//   ('�����','�����','�����','�����','�����','�����','�����','��������','����','�������','�����','�����');
   category: array[1..categorycount] of string =
   ('Home_Appliances', 'Computers', 'Construction-Repair', 'Phones', 'Auto',
   'Souvenirs', 'Toys', 'Clothes-Shoes', 'Video-Audio', 'Photos', 'Sports', 'Furniture');
//   ('���.�������','����������','�������������-������','��������','����',
//   '��������','�������','������-�����','�����-�����','����','�����','������');
   category1: array[1..categorycount] of string =
   ('LS','NC','XH','IP','MR',
   'DF','TG','BQ','VA','ZO','EK','UJ');


var io : string = 'ABVGDEIKLMNOPRSTF';
                //'������������������';

type
  Pupil = record
    fam: string;
    data: integer;
    data1: integer;
    d: array[1..3] of integer;
    c: array[1..3] of integer;
  end;

  School = record
    num: integer;
    data1: real;
    num1: integer;
    num2: integer;
    data2: integer;
    data3: integer;
    data4: string;
  end;

  Flat = record
    fam: string;
    nf: integer;
    cost: real;
  end;

  YMRec = record
    y,m,id: integer;
  end;

  AutoRec = record
    f,s: integer;
    m,p: integer;
    d1,d2: integer;
  end;

(*  CustRec = record
    id: string;
    fam: string;
    year: integer;
    street: string;
  end;

  ProdRec = record
    id: string;
    category: string;
    country: string;
  end;

  CustShopRec = record
    id, shop: string;
    discount: integer;
  end;

  CustProd = record
    id, name, shop: string;
  end;

  ProdShop = record
    name, shop: string;
    price: integer;
  end;
*)
  DB1 = record
    code,year: integer;
    street: string;
    data1: integer;
    data2: integer;
  end;

  DB2 = record
    code,discount: integer;
    shop: string;
  end;

  DB3 = record
    prod, cat, country: string;
    data1: integer;
    data2: integer;
  end;

  DB4 = record
    prod, shop: string;
    price: integer;
  end;

  DB5 = record
    code: integer;
    shop, prod: string;
  end;

  DB6 = record
    data1, data2: integer;
    sdata1: string;
  end;

var
  na, nb, nc, nd, ne: integer;
  nyear, nstreet, nshop, ncountry, ncat: integer;
  da: array[1..100] of DB1;
  db: array[1..100] of DB3;
  dc, dc0: array[1..160] of DB2;
  dd, dd0: array[1..160] of DB4;
  de: array[1..1000] of DB5;
  year1: array[1..8] of integer;
  ind, codediscount: array[1..200] of integer;
  cat1,cat2,country1,shop1,street1: array[1..8] of string;
  cat3: array[1..categorycount] of integer; //2015.08 ����������� ������!
  iyear1, icat1, icountry1, ishop1, istreet1: array[1..8] of integer;
  icode, iprod: array[1..100] of integer;
  inda,indb: array[1..200] of integer;
  data: array[1..8] of DB6;

function indcode(code: integer): integer;
begin
  result := inda[code-100];
end;

function indprod(prod: string): integer;
begin
  result := indb[StrToInt(Copy(prod,3,3))];
end;

procedure SwapN(var a,b: integer);
var x: integer;
begin
  x := a;
  a := b;
  b := x;
end;

procedure SwapS(var a,b: string);
var x: string;
begin
  x := a;
  a := b;
  b := x;
end;

function Rand(a,b: integer): integer;
begin
  result := Random(b-a+1) + a;
end;

function IntToStr0(a,k: integer): string;
var i: integer;
begin
  Str(a,result);
  for i := length(result)+1 to k do
    result := '0'+result;
end;

procedure MakeInd(n: integer);
var i: integer;
begin
  for i := 1 to n do
    ind[i] := i;
  for i := 1 to n do
    SwapN(ind[Random(n)+1],ind[Random(n)+1]);
end;

function InitD15(ncode,nprod,ndiscount,nprice,nbuy,
   nnyear, nnstreet, nncountry, nncat, nnshop: integer): boolean;
var i,j,a: integer;
    s: string;
begin
//2015.08>
  for i := 1 to categorycount do
    cat3[i] := 0;
//2015.08<
  result := false;
  nyear := nnyear;
  nstreet := nnstreet;
  nshop := nnshop;
  ncountry := nncountry;
  ncat := nncat;
  if (ncode <20) or (ncode > 100) or
     (nprod <20) or (nprod > 100) or
     (ndiscount <=5) or (ndiscount > ncode*nshop) or
     (nprice <=5) or (nprice > nprod*nshop) or
     (nbuy <=5) or (nbuy > 100) or
     (nyear <=3) or (nyear > 8) or
     (nstreet <=3) or (nstreet > 8) or
     (ncountry <=3) or (ncountry > 8) or
     (ncat <=3) or (ncat > 8) or
     (nshop <=3) or (nshop > 8) then
    exit;
  result := true;
  MakeInd(41);
  for i := 1 to nyear do
    year1[i] := 1949 + Ind[i];
  for i := 1 to nyear do
    iyear1[i] := i;
  for j := 1 to nyear-1 do
    for i := 1 to nyear-j do
      if year1[iyear1[i]] > year1[iyear1[i+1]] then
        SwapN(iyear1[i],iyear1[i+1]);
  MakeInd(streetcount);
  for i := 1 to nstreet do
    street1[i] := street[Ind[i]];
  for i := 1 to nstreet do
    istreet1[i] := i;
  for j := 1 to nstreet-1 do
    for i := 1 to nstreet-j do
      if street1[istreet1[i]] > street1[istreet1[i+1]] then
        SwapN(istreet1[i],istreet1[i+1]);
  MakeInd(shopcount);
  for i := 1 to nshop do
    shop1[i] := shop[Ind[i]];
  for i := 1 to nshop do
    ishop1[i] := i;
  for j := 1 to nshop-1 do
    for i := 1 to nshop-j do
      if shop1[ishop1[i]] > shop1[ishop1[i+1]] then
        SwapN(ishop1[i],ishop1[i+1]);
  MakeInd(countrycount);
  for i := 1 to ncountry do
    country1[i] := country[Ind[i]];
  for i := 1 to ncountry do
    icountry1[i] := i;
  for j := 1 to ncountry-1 do
    for i := 1 to ncountry-j do
      if country1[icountry1[i]] > country1[icountry1[i+1]] then
        SwapN(icountry1[i],icountry1[i+1]);
  MakeInd(categorycount);
  for i := 1 to ncat do
  begin
    cat1[i] := category[Ind[i]];
    cat2[i] := category1[Ind[i]];
    icat1[i] := i;
  end;
  for j := 1 to ncat-1 do
    for i := 1 to ncat-j do
      if cat1[icat1[i]] > cat1[icat1[i+1]] then
        SwapN(icat1[i],icat1[i+1]);
  MakeInd(200);
  na := ncode;
  for i := 1 to na do
  with da[i] do
  begin
    Code := 100+Ind[i];
    Year := Year1[Rand(1,nyear)];
    Street := Street1[Rand(1,nstreet)];
    inda[Ind[i]] := i;
  end;
  for i := 1 to na do
    icode[i] := i;
  for j := 1 to na-1 do
    for i := 1 to na-j do
      if da[icode[i]].code > da[icode[i+1]].code then
        SwapN(icode[i],icode[i+1]);
  MakeInd(200);
  nb := nprod;
  for i := 1 to nb do
  with db[i] do
  begin
    a := Rand(1,ncat);
    Cat := Cat1[a];
    Inc(Cat3[a]);  //2015.08 ����������� ������!!
    case Random(3) of
    0: j := Random(81)+20;
    1: j := Random(481)+100;
    2: j := Random(1501)+500;
    end;
    Prod := Cat2[a][Random(2)+1] + chr(65+Random(26)) + IntToStr0(Ind[i],3)
      + '-' + IntToStr0(j,4);
    Country := Country1[Rand(1,ncountry)];
    indb[Ind[i]] := i;
  end;
  for i := 1 to nb do
    iprod[i] := i;
  for j := 1 to nb-1 do
    for i := 1 to nb-j do
      if db[iprod[i]].prod > db[iprod[i+1]].prod then
        SwapN(iprod[i],iprod[i+1]);
  nc := 0;
  MakeInd(na);
  codediscount := Ind;
  for i := 1 to nshop do
    for j := 1 to 20 do
    begin
    inc(nc);
    with dc0[nc] do
    begin
      code := da[Ind[j]].Code;
      shop := shop1[i];
      discount := 5 * Rand(1,10);
    end;
    end;
  MakeInd(20*nshop);
  nc := ndiscount;
  for i := 1 to nc do
    dc[i] := dc0[Ind[i]];

  nd := 0;
  MakeInd(nb);
  for i := 1 to nshop do
    for j := 1 to 20 do
    begin
    inc(nd);
    with dd0[nd] do
    begin
      prod := db[Ind[j]].prod;
      shop := shop1[i];
      a := StrToInt(Copy(prod,Pos('-',prod)+1,100));
      price := a * 10 * (80 + Random(41)) div 1000 * 10;
    end;
    end;
  MakeInd(20*nshop);
  nd := nprice;
  for i := 1 to nd do
    dd[i] := dd0[Ind[i]];
  ne := nbuy;
  for i := 1 to ne do
  with de[i] do
  begin
    a := Random(nd)+1;
    shop := dd[a].shop;
    prod := dd[a].prod;
    if Random(3) = 0 then
      code := da[Random(na)+1].code
    else
      code := da[CodeDiscount[Random(20)+1]].Code;
  end;
{
//2015.08>
  for i := 1 to ncat do
    if Cat3[i] = 0 then
      ShowMessage(Cat1[i]);
//2015.08<
}
end;

procedure testInitd15(ncode,ndiscount,nprod,nprice,nbuy,
   nnyear, nnstreet, nnshop, nncountry, nncat: integer);
var f: text;
    i: integer;
begin
  Assign(f,'D15.txt');
  Rewrite(f);
  if not
  InitD15(ncode,ndiscount,nprod,nprice,nbuy,
   nnyear, nnstreet, nnshop, nncountry, nncat) then
   writeln(f,'ERROR!')
  else
  begin
  writeln(f);
  writeln(f,'== A: code, year, street ==');
  for i := 1 to na do
  with da[i] do
    writeln(f,i:2,' ',code,' ', year,' ', street);
  writeln(f);
  writeln(f,'==B: prod, cat, country ==');
  for i := 1 to nb do
  with db[i] do
    writeln(f,i:2,': ',prod,' ', cat,' ', country);
  writeln(f);
  writeln(f,'== C: code, shop, discount ==');
  for i := 1 to nc do
  with dc[i] do
    writeln(f,i:2,': ',code,' ', shop,' ', discount);
  writeln(f);
  writeln(f,'==D: prod, shop, price ==');
  for i := 1 to nd do
  with dd[i] do
    writeln(f,i:2,': ',prod,' ', shop,' ', price);
  writeln(f);
  writeln(f,'==E: code, shop, prod ==');
  for i := 1 to ne do
  with de[i] do
    writeln(f,i:2,': ',code,' ', shop,' ', prod);

  writeln(f,'year');
  for i := 1 to nyear do
    writeln(f,i:2,': ',year1[iyear1[i]]);
  writeln(f,'street');
  for i := 1 to nstreet do
    writeln(f,i:2,': ',street1[istreet1[i]]);
  writeln(f,'shop');
  for i := 1 to nshop do
    writeln(f,i:2,': ',shop1[ishop1[i]]);
  writeln(f,'country');
  for i := 1 to ncountry do
    writeln(f,i:2,': ',country1[icountry1[i]]);
  writeln(f,'cat');
  for i := 1 to ncat do
    writeln(f,i:2,': ',cat1[icat1[i]]);

  end;
  Close(f);
end;


const
  Topic  = '��������� ��������� �������������������';
  Topic1  = '��������� ���������� ��������������� �������������������';

function RandomFam: string;
begin
  result := fam[Random(famcount)+1] + ' ' +
    io[Random(length(io))+1]+'.'+io[Random(length(io))+1]+'.';
end;

function RandomFam1: string;
begin
  result := fam[Random(famcount)+1];
end;

function RandomFileName(n: integer): string;
const ss = '0123456789abcdefghijklmnopqrstuvwxyz';
var i: integer;
begin
  result := '';
  for i := 1 to n do
    result := result + ss[Random(length(ss))+1]

end;


var sres: string;
    sinit: array[1..4] of string;
    ninit: integer;

function DefDataStart(var f1,f2: text): string;
begin
  while true do
  begin
    repeat
    result := RandomFileName(5)+'.tst';
    sres := RandomFileName(5)+'.tst';
    until result <> sres;
    if FileExists(inpref+result) or FileExists(outpref+sres) then continue;
    try
      Assign(f1,inpref+result);
      Rewrite(f1);
      Assign(f2,outpref+sres);
      Rewrite(f2);
      exit;
    except
      if FileExists(inpref+result) then DeleteFile(inpref+result);
      if FileExists(outpref+sres) then DeleteFile(outpref+sres);
    end;
  end;
end;

procedure DefDataEnd(s: string);
var y: integer;
begin
//  y := 2;
//  if (CurrentLanguage and lgPascal) <> 0 then
    y := 2;
  DataS('�������� ����: ',inpref+s,xLeft,1);
  DataS('���� �����������: ',outpref+sres,xRight,1);
  DataFileT(inpref + s, y, 5);
  ResultFileT(outpref + sres, 1, 5);
end;

procedure DefDataEndSpec(s: string);
var y: integer;
begin
//  y := 2;
//  if (CurrentLanguage and lgPascal) <> 0 then
    y := 2;
  DataS('�������� ����: ',inpref+s,14,1);
  DataS('���� �����������: ',outpref+sres,xRight,1);
  DataFileT(inpref + s, y, 5);
  ResultFileT(outpref + sres, 1, 5);
end;


procedure DefDataEndSpec1(s: string);
var y: integer;
begin
//  y := 2;
//  if (CurrentLanguage and lgPascal) <> 0 then
    y := 2;
  DataS('�������� ����: ',inpref+s,21,1);
  DataS('���� �����������: ',outpref+sres,50,1);
  DataFileT(inpref + s, y, 5);
  ResultFileT(outpref + sres, 1, 5);
end;


function AllDifferent(n: integer): boolean;
var i,j: integer;
begin
  result := true;
  for i := 1 to n-1 do
  begin
    for j := i+ 1 to n do
      if sinit[i] = sinit[j] then
      begin
       result := false;
       exit;
      end;
    if sinit[i] = sres then
      begin
       result := false;
       exit;
      end;
  end;
end;

procedure DefDataStart2(n: integer; var f0,f1,f2,f3,f4: text);
var i: integer;
begin
    ninit := n;
    repeat
    sres := RandomFileName(6-n)+'.tst';
    for i := 1 to n do
      sinit[i] := RandomFileName(6-n)+'.tst';
    until AllDifferent(n);
    Assign(f0,sres);
    Rewrite(f0);
    Assign(f1,sinit[1]);
    Rewrite(f1);
    Assign(f2,sinit[2]);
    Rewrite(f2);
    if n > 2 then
    begin
      Assign(f3,sinit[3]);
      Rewrite(f3);
      if n > 3 then
      begin
        Assign(f4,sinit[4]);
        Rewrite(f4);
      end;
    end;
end;

procedure DefDataEnd2;
var i,x1,x2,x3: integer;
begin
  case ninit of
  2: begin
       x1 := 11;
       x2 := 45;
       x3 := 3;
     end;
  3: begin
       x1 := 10;
       x2 := 50;
       x3 := 3;
     end;
  4: begin
       x1 := 9;
       x2 := 53;
       x3 := 1;
     end;
  end;
  DataComment('�������� �����:',x3,1);
  for i := 1 to ninit do
  DataS('',sinit[i],16+x3 + x1*(i-1),1);
  DataS('���� �����������: ',sres,x2,1);
  case ninit of
  2: begin
       DataFileT(sinit[1], 2, 3);
       DataFileT(sinit[2], 4, 5);
     end;
  3: begin
       DataFileT(sinit[1], 2, 2);
       DataFileT(sinit[2], 3, 3);
       DataFileT(sinit[3], 4, 4);
     end;
  4: begin
       DataFileT(sinit[1], 2, 2);
       DataFileT(sinit[2], 3, 3);
       DataFileT(sinit[3], 4, 4);
       DataFileT(sinit[4], 5, 5);
     end;
  end;
  ResultFileT(sres, 1, 5);
end;

const ymcount = 132;
var ym: array[1..ymcount] of YMRec;

procedure MakeYM(n: integer);
var i,j: integer;
    b: boolean;
begin
for i := 1 to n do
  while true do
  begin
    ym[i].y := Random(11)+2000;
    ym[i].m := Random(12)+1;
    ym[i].id := Random(90)+10;
    b := true;
    for j := 1 to i-1 do
      if (ym[j].y = ym[i].y) and (ym[j].m = ym[i].m)
         and (ym[j].id = ym[i].id) then
      begin
        b := false;
        break;
      end;
    if b then break;
  end;
end;

procedure MakeYM1(n: integer);
var i,j,k,k0: integer;
    b: boolean;
    y,m: array[0..10] of integer;
begin
k := Random(11);
for i := 0 to k do
begin
  y[i] := Random(11)+2000;
  m[i] := Random(12)+1;
end;
for i := 1 to n do
  while true do
  begin
    if k > 3 then
    begin
    k0 := Random(k);
    ym[i].y := y[k0];
    ym[i].m := m[k0];
    end
    else
    begin
    ym[i].y := Random(11)+2000;
    ym[i].m := Random(12)+1;
    end;
    ym[i].id := Random(90)+10;
    b := true;
    for j := 1 to i-1 do
      if (ym[j].y = ym[i].y) and (ym[j].m = ym[i].m)
         and (ym[j].id = ym[i].id) then
      begin
        b := false;
        break;
      end;
    if b then break;
  end;
end;



procedure ExamC1a(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,minmax,y0,m0,k0: integer;
    b: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
//  TaskText('�� ���� �������� �������� � �������� ������-������. � ������ ������',0,1);
//  TaskText('����������� ����� �����~{N}, � ������ �� ����������� {N}~����� ����� ������',0,2);
  case nn of
  1:TaskText('\(\M<��� �������> <���> <����� ������> <����������������� ������� (� �����)>\m\)',0,3);
  4:TaskText('\(\M<����� ������> <���> <��� �������> <����������������� ������� (� �����)>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);
  case nn of
  1:begin
  TaskText('����� ������� ������������������ � ����������� ������������������ �������.',0,4);
  TaskText('������� ��� �����������������, � ����� ��������������� �� ��� � ����� ������',0,5);
  TaskText('(� ��������� ������� �� ��� �� ������). ���� ������� ��������� ���������',0,0);
  TaskText('� ����������� ������������������, �� ������� ������ ���� �� ���,',0,0);
  TaskText('������� �������� ��������� � �������� ������������������.',0,0);
  end;
  4:begin
  TaskText('����� ������� ������������������ � ������������ ������������������ �������.',0,4);
  TaskText('������� ��� �����������������, � ����� ��������������� �� ��� � ����� ������',0,5);
  TaskText('(� ��������� ������� �� ��� �� ������). ���� ������� ��������� ���������',0,0);
  TaskText('� ������������ ������������������, �� ������� ������,',0,0);
  TaskText('��������������� ����� ������� ����.',0,0);
  end;
  end;
  s := DefDataStart(f1,f2);
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: n := 3 + Random(5);
  end;
//  writeln(f1,n);
  MakeYM(n);
  k0 := Random(15)+1;
  y0 := 1900;
  m0 := 0;
  if nn in [1,3] then   minmax := 31
  else minmax := 0;
  for i := 1 to n do
  begin
    k := Random(31-k0)+k0;
    case nn of
    1: writeln(f1,ym[i].id,' ',ym[i].y,' ',ym[i].m,' ',k);
    2: writeln(f1,ym[i].y,' ',ym[i].m,' ',k, ' ',ym[i].id);
    3: writeln(f1,k,' ',ym[i].id,' ',ym[i].y,' ',ym[i].m);
    4: writeln(f1,ym[i].m,' ',ym[i].y,' ',ym[i].id,' ',k);
    end;
    case nn of
    1: b := k <= minmax;
    2: b := k > minmax;
    3: b := (k < minmax) or (k = minmax) and ((ym[i].y<y0) or (ym[i].y=y0)and (ym[i].m<m0));
    4: b := (k > minmax) or (k = minmax) and ((ym[i].y>y0) or (ym[i].y=y0)and (ym[i].m>m0));
    end;
    if b then
    begin
      minmax := k;
      y0 := ym[i].y;
      m0 := ym[i].m;
    end;
  end;
  Close(f1);
  writeln(f2,minmax,' ',y0,' ',m0);
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);
end;


procedure ExamC1b(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,minmax,y0,m0,k0: integer;
    b: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  2:TaskText('\(\M<���> <����� ������> <����������������� ������� (� �����)> <��� �������>\m\)',0,3);
  3:TaskText('\(\M<����������������� ������� (� �����)> <��� �������> <���> <����� ������>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);
  case nn of
  2:begin
  TaskText('����� ������� ������������������ � ������������ ������������������ �������.',0,4);
  TaskText('������� ��� �����������������, � ����� ��������������� �� ��� � ����� ������',0,5);
  TaskText('(� ��������� �������). ���� ������� ��������� ��������� � ������������',0,0);
  TaskText('������������������, �� ������� ������ ���� �� ���,',0,0);
  TaskText('������� �������� ������ � �������� ������������������.',0,0);
  end;
  3:begin
  TaskText('����� ������� ������������������ � ����������� ������������������ �������.',0,4);
  TaskText('������� ��� �����������������, � ����� ��������������� �� ��� � ����� ������',0,5);
  TaskText('(� ��������� �������). ���� ������� ��������� ��������� � �����������',0,0);
  TaskText('������������������, �� ������� ������, ��������������� ����� ������ ����.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: n := 3 + Random(5);
  end;
//  writeln(f1,n);
  MakeYM(n);
  k0 := Random(15)+1;
  y0 := 1900;
  m0 := 0;
  if nn in [1,3] then   minmax := 31
  else minmax := 0;
  for i := 1 to n do
  begin
    k := Random(31-k0)+k0;
    case nn of
    1: writeln(f1,ym[i].id,' ',ym[i].y,' ',ym[i].m,' ',k);
    2: writeln(f1,ym[i].y,' ',ym[i].m,' ',k, ' ',ym[i].id);
    3: writeln(f1,k,' ',ym[i].id,' ',ym[i].y,' ',ym[i].m);
    4: writeln(f1,ym[i].m,' ',ym[i].y,' ',ym[i].id,' ',k);
    end;
    case nn of
    1: b := k <= minmax;
    2: b := k > minmax;
    3: b := (k < minmax) or (k = minmax) and ((ym[i].y<y0) or (ym[i].y=y0)and (ym[i].m<m0));
    4: b := (k > minmax) or (k = minmax) and ((ym[i].y>y0) or (ym[i].y=y0)and (ym[i].m>m0));
    end;
    if b then
    begin
      minmax := k;
      y0 := ym[i].y;
      m0 := ym[i].m;
    end;
  end;
  Close(f1);
  writeln(f2,minmax,' ',y0,' ',m0);
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);
end;



procedure ExamC2(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,minmax,y0,m0,k0: integer;
    a: array[2000..2010] of integer;
    b: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  1: TaskText('\(\M<���> <����� ������> <����������������� ������� (� �����)> <��� �������>\m\)',0,3);
  2: TaskText('\(\M<����������������� ������� (� �����)> <���> <����� ������> <��� �������>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);
  case nn of
  1: begin
  TaskText('���������� ���, � ������� ��������� ����������������� ������� ���� ��������',0,4);
  TaskText('���� ����������, � ������� ���� ��� � ���������� ��������� �����������������.',0,5);
  TaskText('���� ����� ����� ���� ���������, �� ������� ���������� �� ���.',0,0);
  end;
  2: begin
  TaskText('���������� ���, � ������� ��������� ����������������� ������� ���� ��������',0,4);
  TaskText('���� ���������� (���� � ������� ������������������ �� ���������), � �������',0,5);
  TaskText('���� ��� � ���������� ��������� �����������������. ���� ����� �����',0,0);
  TaskText('���� ���������, �� ������� ���������� �� ���.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  k0 := 0;
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: begin
       n := 3 + Random(5);
       k0 := Random(16)+15;
     end;
  end;
//  writeln(f1,n);
  MakeYM(n);
  for i := 2000 to 2010 do
    a[i] := 0;
  for i := 1 to n do
  begin
    if k0 = 0 then
      k := Random(30)+1
    else
      k := k0;
    case nn of
    1: writeln(f1,ym[i].y,' ',ym[i].m,' ',k,' ',ym[i].id);
    2: writeln(f1,k,' ',ym[i].y,' ',ym[i].m,' ',ym[i].id);
    end;
    a[ym[i].y] := a[ym[i].y] + k;
  end;
  Close(f1);
  case nn of
  1:minmax := 0;
  2:minmax := 100000;
  end;
  y0 := 0;
  for i := 2000 to 2010 do
  begin
    case nn of
    1: b := a[i]>minmax;
    2: b := (a[i]<=minmax) and (a[i] <> 0);
    end;
    if b then
    begin
      minmax := a[i];
      y0 := i;
    end;
  end;
  writeln(f2,y0,' ',minmax);
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);
end;

procedure ExamC3(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,min,y0,m0,k0,mm: integer;
    a: array[10..99] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  1:TaskText('\(\M<����������������� ������� (� �����)> <��� �������> <���> <����� ������>\m\)',0,3);
  2:TaskText('\(\M<��� �������> <���> <����� ������> <����������������� ������� (� �����)>\m\)',0,3);
  3:TaskText('\(\M<���> <����� ������> <����������������� ������� (� �����)> <��� �������>\m\)',0,3);
  4:TaskText('\(\M<��� �������> <����������������� ������� (� �����)> <���> <����� ������>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);

  case nn of
  1: begin
  TaskText('��� ������� �������, ��������������� � �������� ������, ���������� ���������',0,4);
  TaskText('����������������� ������� � ������� ���� ��� (������� �������� ��� �������,',0,5);
  TaskText('����� ��������� �����������������). �������� � ������ ������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ����������� ���� �������.',0,0);
  end;
  2: begin
  TaskText('��� ������� �������, ��������������� � �������� ������, ���������� �����',0,4);
  TaskText('���������� �������, � ������� ������� �� ������� ������� (������� �������� ���',0,5);
  TaskText('�������, ����� ���������� �������). �������� � ������ ������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ����������� ���� �������.',0,0);
  end;
  3: begin
  TaskText('��� ������� �������, ��������������� � �������� ������, ���������� ���������',0,4);
  TaskText('����������������� ������� � ������� ���� ��� (������� �������� ���������',0,5);
  TaskText('�����������������, ����� ��� �������). �������� � ������ ������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� �������� ��������� �����������������,',0,0);
  TaskText('� ��� �� ��������� \= �� ����������� ���� �������.',0,0);
  end;
  4: begin
  TaskText('��� ������� �������, ��������������� � �������� ������, ���������� �����',0,4);
  TaskText('���������� �������, � ������� ������� �� ������� ������� (������� ��������',0,5);
  TaskText('���������� �������, ����� ��� �������). �������� � ������ ������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ����������� ���������� �������,',0,0);
  TaskText('� ��� �� ��������� \= �� ����������� ���� �������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(3) of
  0,2: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
//  writeln(f1,n);
  MakeYM(n);
  for i := 10 to 99 do
    a[i] := 0;
  for i := 1 to n do
  begin
    k := Random(30)+1;
    case nn of
    1: writeln(f1,k,' ',ym[i].id,' ',ym[i].y,' ',ym[i].m);
    2: writeln(f1,ym[i].id,' ',ym[i].y,' ',ym[i].m,' ',k);
    3: writeln(f1,ym[i].y,' ',ym[i].m,' ',k,' ',ym[i].id);
    4: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    end;
    case nn of
    1,3:a[ym[i].id] := a[ym[i].id] + k;
    2,4:a[ym[i].id] := a[ym[i].id] + 1;
    end;
  end;
  Close(f1);
  case nn of
  1,2:for i := 10 to 99 do
    if a[i] > 0 then
      writeln(f2,i,' ',a[i]);
  3:while true do
      begin
        mm := 0;
        for i := 10 to 99 do
          if (mm < a[i]) then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 0 then
        begin
          writeln(f2,mm,' ',k0);
          a[k0] := 0;
        end
        else
          break;
     end;
  4:while true do
      begin
        mm := 30000;
        for i := 10 to 99 do
          if (mm > a[i]) and (a[i]>0) then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 30000 then
        begin
          writeln(f2,mm,' ',k0);
          a[k0] := 30000;
        end
        else
          break;
     end;
   end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC4(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,min,y0,m0,k0: integer;
    a: array[1..12] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  1:TaskText('\(\M<���> <����� ������> <��� �������> <����������������� ������� (� �����)>\m\)',0,3);
  2:TaskText('\(\M<��� �������> <����������������� ������� (� �����)> <���> <����� ������>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);


  case nn of
  1: begin
  TaskText('��� ������� ������ ���������� ��������� ����������������� ������� ����',0,4);
  TaskText('�������� �� ��� ���� (������� �������� ����� ������, ����� ���������',0,5);
  TaskText('�����������������). ���� ������ � ��������� ������ �����������,',0,0);
  TaskText('�� ��� ����� ������ ������� 0. �������� � ������ ������ ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ����������� ������ ������.',0,0);
  end;
  2: begin
  TaskText('��� ������� ������ ���������� ��������� ����������������� ������� ����',0,4);
  TaskText('�������� �� ��� ���� (������� �������� ��������� �����������������, �����',0,5);
  TaskText('����� ������). ���� ������ � ��������� ������ �����������, �� ��� ����� ������',0,0);
  TaskText('������� 0. �������� � ������ ������ �������� �� ����� ������ � �������������',0,0);
  TaskText('�� �������� ��������� �����������������, � ��� ������ ����������������� \=',0,0);
  TaskText('�� ����������� ������ ������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  k0 := 0;
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: begin
       n := 3 + Random(5);
       k0 := Random(16)+15;
     end;
  end;
//  writeln(f1,n);
  MakeYM(n);
  for i := 1 to 12 do
    a[i] := 0;
  for i := 1 to n do
  begin
    if k0 = 0 then
      k := Random(30)+1
    else
      k := k0;
    case nn of
    1: writeln(f1,ym[i].y,' ',ym[i].m,' ',ym[i].id,' ',k);
    2: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    end;
    a[ym[i].m] := a[ym[i].m] + k;
  end;
  Close(f1);
  case nn of
  1: for i := 1 to 12 do
       writeln(f2,i,' ', a[i]);

  2:
  for i := 1 to 12 do
  begin
    k := -1;
    m0 := 0;
    for j := 1 to 12 do
      if a[j] > k then
      begin
        k := a[j];
        m0 := j;
      end;
    writeln(f2,k,' ', m0);
    a[m0] := -1;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC5a(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,min,y0,m0,k0,id0,mm: integer;
    a,b: array[2000..2010] of integer;
    f,bb: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('���� ����� ����� {K} \= ��� ������ �� �������� ������-������. �������� ',0,1);
  TaskText('������������������ �������� �������� � �������� ����� ������-������.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,3); //2013.05
  case nn of
  1: TaskText('\(\M<����������������� ������� (� �����)> <���> <����� ������> <��� �������>\m\)',0,4);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,5);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,0);

  case nn of
  1: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����,',0,5);
  TaskText('� ������� ����������������� ������� ������� ������� ���� ���������� ���',0,0);
  TaskText('������� ���� (���� ����� ������� ���������, �� �������� ����� � ����������',0,0);
  TaskText('�������). �������� � ������ ���� �������� �� ����� ������ � ���������',0,0);
  TaskText('�������: ���, ����� ������, ����������������� ������� � ���� ������.',0,0);
  TaskText('������������� �������� �� �������� ������ ����. ���� ������ � �������',0,0);
  TaskText('� �����~{K} �����������, �� �������� � �������������� ���� ������ \<No data\>.',0,0);
  end;
  end;
  s := DefDataStart(f1,f2);
  id0 := Random(90)+10;
  k0 := 0;
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: begin
       n := 3 + Random(5);
       k0 := Random(16)+15;
     end;
  end;
  if Random(2)=0 then
    k0 := -(Random(10)+ 5);
//  writeln(f1,id0); //2013
//  writeln(f1,n);
  MakeYM(n);
  if Random(3) <> 0 then
    for i := 1 to n do
      if Random(2)=0 then
      begin
        f := true;
        for j := 1 to n do
          if (i<>j) and (ym[i].y=ym[j].y)and(ym[i].m=ym[j].m)and(ym[j].id=id0) then
          begin
            f := false;
            break;
          end;
        if f then
          ym[i].id := id0;
     end;
  for i := 2000 to 2010 do
  case nn of
  1,3:begin
        a[i] := 0;
        b[i] := 13;
      end;
  2,4:begin
        a[i] := 10000;
        b[i] := 0;
      end;
   end;
  f := false;
  for i := 1 to n do
  begin
    if k0 = 0 then
      k := Random(30)+1
    else
    if k0 < 0 then
      k := Random(3)+abs(k0)
    else
      k := k0;

    case nn of
    1: writeln(f1,k,' ',ym[i].y,' ',ym[i].m,' ',ym[i].id);
    2: writeln(f1,ym[i].y,' ',ym[i].m,' ',ym[i].id,' ',k);
    3: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    4: writeln(f1,k,' ',ym[i].id,' ',ym[i].y,' ',ym[i].m);
    end;
    case nn of
    1,3: bb := (id0 = ym[i].id) and ((k > a[ym[i].y]) or (k = a[ym[i].y]) and (ym[i].m < b[ym[i].y]));
    2,4: bb := (id0 = ym[i].id) and ((k < a[ym[i].y]) or (k = a[ym[i].y]) and (ym[i].m > b[ym[i].y]));
    end;
    if bb then
    begin
      a[ym[i].y] := k;
      b[ym[i].y] := ym[i].m;
      f := true;
    end;
  end;
  Close(f1);
  if not f then
    writeln(f2,'No data')
  else
  case nn of
  1: for i := 2010 downto 2000 do
      if a[i] > 0 then
        writeln(f2, i,' ', b[i], ' ',a[i]);
  2: for i := 2000 to 2010 do
      if a[i] < 10000 then
        writeln(f2, i,' ', b[i], ' ',a[i]);
  3:while true do
      begin
        mm := 0;
        for i := 2000 to 2010 do
          if mm < a[i] then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 0 then
        begin
          writeln(f2,mm,' ',k0,' ',b[k0]);
          a[k0] := 0;
        end
        else
          break;
     end;
  4:while true do
      begin
        mm := 10000;
        for i := 2000 to 2010 do
          if mm > a[i] then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 10000 then
        begin
          writeln(f2,mm,' ',k0,' ',b[k0]);
          a[k0] := 10000;
        end
        else
          break;
     end;
   end;
  Close(f2);
  DataN('K = ', id0, 3, 1, 2);
  DefDataEndSpec(s);
  SetTestCount(9);

end;


procedure ExamC5b(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,min,y0,m0,k0,id0,mm: integer;
    a,b: array[2000..2010] of integer;
    f,bb: boolean;
begin
  CreateTask(Topic);
  TaskText('���� ����� ����� {K} \= ��� ������ �� �������� ������-������. �������� ',0,1);
  TaskText('������������������ �������� �������� � �������� ����� ������-������.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,3); //2013.05
  case nn of
  2: TaskText('\(\M<���> <����� ������> <��� �������> <����������������� ������� (� �����)>\m\)',0,4);
  3: TaskText('\(\M<��� �������> <����������������� ������� (� �����)> <���> <����� ������>\m\)',0,4);
  4: TaskText('\(\M<����������������� ������� (� �����)> <��� �������> <���> <����� ������>\m\)',0,4);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,5);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,0);

  case nn of
  2: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����,',0,5);
  TaskText('� ������� ����������������� ������� ������� ������� ���� ���������� ���',0,0);
  TaskText('������� ���� (���� ����� ������� ���������, �� �������� ����� � ����������',0,0);
  TaskText('�������; ������ � ������� ������������������ ������� �� ���������).',0,0);
  TaskText('�������� � ������ ���� �������� �� ����� ������ � ���������',0,0);
  TaskText('�������: ���, ����� ������, ����������������� ������� � ���� ������.',0,0);
  TaskText('������������� �������� �� ����������� ������ ����. ���� ������ � �������',0,0);
  TaskText('� �����~{K} �����������, �� �������� � �������������� ���� ������ \<No data\>.',0,0);
  end;
  3: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����,',0,5);
  TaskText('� ������� ����������������� ������� ������� ������� ���� ���������� ���',0,0);
  TaskText('������� ���� (���� ����� ������� ���������, �� �������� ����� � ����������',0,0);
  TaskText('�������). �������� � ������ ���� �������� �� ����� ������ � ���������',0,0);
  TaskText('�������: ���������� ����������������� ������� � ����, ���, ����� ������.',0,0);
  TaskText('������������� �������� �� �������� ����������������� �������, � ��� ������',0,0);
  TaskText('����������������� \= �� ����������� ������ ����. ���� ������ � �������',0,0);
  TaskText('� �����~{K} �����������, �� �������� � �������������� ���� ������ \<No data\>.',0,0);
  end;
  4: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����,',0,5);
  TaskText('� ������� ����������������� ������� ������� ������� ���� ���������� ���',0,0);
  TaskText('������� ���� (���� ����� ������� ���������, �� �������� ������ �� ���� �������',0,0);
  TaskText('� �������� ������; ������ � ������� ������������������ ������� �� ���������).',0,0);
  TaskText('�������� � ������ ���� �������� �� ����� ������ � ���������',0,0);
  TaskText('�������: ���������� ����������������� �������, ���, ����� ������.',0,0);
  TaskText('������������� �������� �� ����������� ����������������� �������, � ��� ������',0,0);
  TaskText('����������������� \= �� ����������� ������ ����. ���� ������ � �������',0,0);
  TaskText('� �����~{K} �����������, �� �������� � �������������� ���� ������ \<No data\>.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  id0 := Random(90)+10;
  k0 := 0;
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: begin
       n := 3 + Random(5);
       k0 := Random(16)+15;
     end;
  end;
  if Random(2)=0 then
    k0 := -(Random(10)+ 5);
//  writeln(f1,id0);  //2013
//  writeln(f1,n);
  MakeYM(n);
  if Random(3) <> 0 then
    for i := 1 to n do
      if Random(2)=0 then
      begin
        f := true;
        for j := 1 to n do
          if (i<>j) and (ym[i].y=ym[j].y)and(ym[i].m=ym[j].m)and(ym[j].id=id0) then
          begin
            f := false;
            break;
          end;
        if f then
          ym[i].id := id0;
     end;
  for i := 2000 to 2010 do
  case nn of
  1,3:begin
        a[i] := 0;
        b[i] := 13;
      end;
  2,4:begin
        a[i] := 10000;
        b[i] := 0;
      end;
   end;
  f := false;
  for i := 1 to n do
  begin
    if k0 = 0 then
      k := Random(30)+1
    else
    if k0 < 0 then
      k := Random(3)+abs(k0)
    else
      k := k0;

    case nn of
    1: writeln(f1,k,' ',ym[i].y,' ',ym[i].m,' ',ym[i].id);
    2: writeln(f1,ym[i].y,' ',ym[i].m,' ',ym[i].id,' ',k);
    3: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    4: writeln(f1,k,' ',ym[i].id,' ',ym[i].y,' ',ym[i].m);
    end;
    case nn of
    1,3: bb := (id0 = ym[i].id) and ((k > a[ym[i].y]) or (k = a[ym[i].y]) and (ym[i].m < b[ym[i].y]));
    2: bb := (id0 = ym[i].id) and ((k < a[ym[i].y]) or (k = a[ym[i].y]) and (ym[i].m > b[ym[i].y]));
    4: bb := (id0 = ym[i].id) and (k < a[ym[i].y]);
    end;
    if bb then
    begin
      a[ym[i].y] := k;
      b[ym[i].y] := ym[i].m;
      f := true;
    end;
  end;
  Close(f1);
  if not f then
    writeln(f2,'No data')
  else
  case nn of
  1: for i := 2010 downto 2000 do
      if a[i] > 0 then
        writeln(f2, i,' ', b[i], ' ',a[i]);
  2: for i := 2000 to 2010 do
      if a[i] < 10000 then
        writeln(f2, i,' ', b[i], ' ',a[i]);
  3:while true do
      begin
        mm := 0;
        for i := 2000 to 2010 do
          if mm < a[i] then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 0 then
        begin
          writeln(f2,mm,' ',k0,' ',b[k0]);
          a[k0] := 0;
        end
        else
          break;
     end;
  4:while true do
      begin
        mm := 10000;
        for i := 2000 to 2010 do
          if mm > a[i] then
          begin
            mm := a[i];
            k0 := i;
          end;
        if mm <> 10000 then
        begin
          writeln(f2,mm,' ',k0,' ',b[k0]);
          a[k0] := 10000;
        end
        else
          break;
     end;
   end;
  Close(f2);
  DataN('K = ', id0, 3, 1, 2);
  DefDataEndSpec(s);
  SetTestCount(9);

end;


procedure ExamC6(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0,id0: integer;
    a,b: array[2000..2010] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('���� ����� ����� {K} \= ��� ������ �� �������� ������-������. �������� ',0,1);
  TaskText('������������������ �������� �������� � �������� ����� ������-������.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,3); //2013.05
  case nn of
  1:TaskText('\(\M<����� ������> <���> <��� �������> <����������������� ������� (� �����)>\m\)',0,4);
  2:TaskText('\(\M<��� �������> <����������������� ������� (� �����)> <����� ������> <���>\m\)',0,4);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,5);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,0);

  case nn of
  1: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����',0,5);
  TaskText('�������, ��� ������� ����������������� ������� ������� ������� ������������',0,0);
  TaskText('15 ����� (������� �������� ���, ����� ����� �������). ���� ��� ���������� ����',0,0);
  TaskText('��������� ������ �����������, �� ������� ��� ����~0. �������� � ������ ����',0,0);
  TaskText('�������� �� ����� ������; ������ ������������� �� ����������� ������ ����.',0,0);
  TaskText('���� ������ �� ��������� ������� �����������, �� ��������',0,0);
  TaskText('� �������������� ���� ������ \<No data\>.',0,0);
  end;
  2: begin
  TaskText('��� ������� ����, � ������� ������ � �����~{K} ������� �����, ���������� �����',0,5);
  TaskText('�������, ��� ������� ����������������� ������� ������� ������� ������������',0,0);
  TaskText('15 ����� (������� �������� ����� �������, ����� ���). ���� ��� ���������� ����',0,0);
  TaskText('��������� ������ �����������, �� ������� ��� ����~0. �������� � ������ ����',0,0);
  TaskText('�������� �� ����� ������; ������ ������������� �� �������� ����� �������,',0,0);
  TaskText('� ��� ������ ����� ������� \= �� ����������� ������ ����. ���� ������',0,0);
  TaskText('�� ��������� ������� �����������, �� ��������',0,0);
  TaskText('� �������������� ���� ������ \<No data\>.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  id0 := Random(90)+10;
  k0 := 0;
  case Random(3) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  2: begin
       n := 3 + Random(5);
       k0 := Random(3)+14;
     end;
  end;
  if Random(2)=0 then
    k0 := -(Random(3)+ 13);
//  writeln(f1,id0);  //2013
//  writeln(f1,n);
  MakeYM(n);
  if Random(3) <> 0 then
    for i := 1 to n do
      if Random(2)=0 then
      begin
        f := true;
        for j := 1 to n do
          if (i<>j) and (ym[i].y=ym[j].y)and(ym[i].m=ym[j].m)and(ym[j].id=id0) then
          begin
            f := false;
            break;
          end;
        if f then
          ym[i].id := id0;
      end;
  for i := 2000 to 2010 do
  begin
    a[i] := 0;
    b[i] := 0;
  end;
  f := false;
  for i := 1 to n do
  begin
    if k0 = 0 then
      k := Random(30)+1
    else
    if k0 < 0 then
      k := Random(3)+abs(k0)
    else
      k := k0;

    case nn of
    1: writeln(f1,ym[i].m,' ',ym[i].y,' ',ym[i].id,' ',k);
    2: writeln(f1,ym[i].id,' ',k,' ',ym[i].m,' ',ym[i].y);
    end;
    if ym[i].id = id0 then
    begin
      f := true;
      b[ym[i].y] := 1;
      if k > 15 then
        a[ym[i].y] := a[ym[i].y]+1;
    end;
  end;
  Close(f1);
  if not f then
    writeln(f2,'No data')
  else
  case nn of
  1:
      for i := 2000 to 2010 do
      if b[i] = 1 then
        writeln(f2,i,' ',a[i]);

  2:
  begin
    for i := 2000 to 2010 do
      if b[i] = 0 then
        a[i] := -1;
    while true do
    begin
      max := -1;
      k := 0;
      for i := 2000 to 2010 do
        if a[i]>max then
        begin
          max := a[i];
          k := i;
        end;
      if max = -1 then break;
      writeln(f2,max,' ',k);
      a[k] := -1;
    end;
  end;
  end;
  Close(f2);
  DataN('K = ', id0, 3, 1, 2);
  DefDataEndSpec(s);
  SetTestCount(9);

end;

procedure ExamC7a(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0,mm,i0,j0: integer;
    a,b: array[2000..2010,1..12] of integer;
    id0: array[1..10] of integer;
    f: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  1:TaskText('\(\M<���> <����� ������> <��� �������> <����������������� ������� (� �����)>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);

  case nn of
  1: begin
  TaskText('��� ������ ���� \<���\:�����\>, �������������� � �������� ������, ����������',0,4);
  TaskText('���������� ��������, ������� �������� ����� � ��������� ����� (�������',0,5);
  TaskText('��������� ���, ����� �����, ����� ���������� ��������). �������� � ������',0,0);
  TaskText('���� \<���\:�����\> �������� �� ����� ������ � ������������� �� ��������',0,0);
  TaskText('������ ����, � ��� ����������� ������ ���� \= �� ����������� ������ ������.',0,0);
  end;
  end;

  s := DefDataStart(f1,f2);
  case Random(3) of
  0,2: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
//  writeln(f1,n);
  for i := 1 to 10 do
    id0[i] := Random(90)+10;
  MakeYM1(n);
  for i := 2000 to 2010 do
    for j := 1 to 12 do
  begin
    a[i,j] := 0;
    b[i,j] := -1;
  end;
  for i := 1 to n do
  begin
    k := Random(30)+1;

    case nn of
    1: writeln(f1,ym[i].y,' ',ym[i].m,' ',ym[i].id,' ',k);
    2: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    3: writeln(f1,k,' ',ym[i].y,' ',ym[i].m,' ',ym[i].id);
    4: writeln(f1,ym[i].id,' ', ym[i].y,' ',ym[i].m,' ',k);
    end;
    b[ym[i].y,ym[i].m] := 0;
    case nn of
    1,3: a[ym[i].y,ym[i].m] := a[ym[i].y,ym[i].m]+1;
    2,4: a[ym[i].y,ym[i].m] := a[ym[i].y,ym[i].m]+k;
    end;
  end;
  Close(f1);
  case nn of
  1:for i := 2010 downto 2000 do
    for j := 1 to 12 do
      if b[i,j] = 0 then
        writeln(f2,i,' ',j,' ',a[i,j]);
  2:for i := 2000 to 2010 do
    for j := 1 to 12 do
      if b[i,j] = 0 then
        writeln(f2,i,' ',j,' ',a[i,j]);
  3:while true do
  begin
    mm := 0;
    for i := 2000 to 2010 do
    for j := 1 to 12 do
      if a[i,j]>mm then
      begin
        mm := a[i,j];
        i0 := i;
        j0 := j;
      end;
    if mm > 0 then
    begin
      writeln(f2,mm,' ',i0,' ',j0);
      a[i0,j0] := 0;
    end
    else
      break;
  end;
  4:while true do
  begin
    mm := 10000;
    for i := 2010 downto 2000 do
    for j := 1 to 12 do
      if a[i,j]<mm then
      begin
        mm := a[i,j];
        i0 := i;
        j0 := j;
      end;
    if mm < 10000 then
    begin
      if b[i0,j0] = 0 then
        writeln(f2,mm,' ',i0,' ',j0);
      a[i0,j0] := 10000;
    end
    else
      break;
  end;

  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC7b(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0,mm,i0,j0: integer;
    a,b: array[2000..2010,1..12] of integer;
    id0: array[1..10] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �������� ������-������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ������������� ����:',0,2); //2013.05
  case nn of
  2:TaskText('\(\M<��� �������> <����������������� ������� (� �����)> <���> <����� ������>\m\)',0,3);
  3:TaskText('\(\M<����������������� ������� (� �����)> <���> <����� ������> <��� �������>\m\)',0,3);
  4:TaskText('\(\M<��� �������> <���> <����� ������> <����������������� ������� (� �����)>\m\)',0,3);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);

  case nn of
  2: begin
  TaskText('��� ������ ���� \<���\:�����\>, �������������� � �������� ������, ����������',0,4);
  TaskText('����� ����������������� ������� ���� �������� � ��������� ����� (�������',0,5);
  TaskText('��������� ���, ����� �����, ����� ����� �����������������). �������� � ������',0,0);
  TaskText('���� \<���\:�����\> �������� �� ����� ������ � ������������� �� �����������',0,0);
  TaskText('������ ����, � ��� ����������� ������ ���� \= �� ����������� ������ ������.',0,0);
  end;
  3: begin
  TaskText('��� ������ ���� \<���\:�����\>, �������������� � �������� ������, ����������',0,4);
  TaskText('���������� ��������, ������� �������� ����� � ��������� ����� (�������',0,5);
  TaskText('��������� ���������� ��������, ����� ���, ����� �����). �������� � ������',0,0);
  TaskText('���� \<���\:�����\> �������� �� ����� ������ � ������������� �� ��������',0,0);
  TaskText('���������� ��������, ��� ����������� ���������� �������� \= �� �����������',0,0);
  TaskText('������ ����, � ��� ����������� ������ ���� \= �� ����������� ������ ������.',0,0);
  end;
  4: begin
  TaskText('��� ������ ���� \<���\:�����\>, �������������� � �������� ������, ����������',0,4);
  TaskText('����� ����������������� ������� ���� �������� � ��������� ����� (�������',0,5);
  TaskText('��������� ����� �����������������, ����� ���, ����� �����). �������� � ������',0,0);
  TaskText('���� \<���\:�����\> �������� �� ����� ������ � ������������� �� �����������',0,0);
  TaskText('����� ����������������� �������, ��� ���������� ����������������� \=',0,0);
  TaskText('�� �������� ������ ����, � ��� ����������� ������ ���� \=',0,0);
  TaskText('�� ����������� ������ ������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(3) of
  0,2: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
//  writeln(f1,n);
  for i := 1 to 10 do
    id0[i] := Random(90)+10;
  MakeYM1(n);
  for i := 2000 to 2010 do
    for j := 1 to 12 do
  begin
    a[i,j] := 0;
    b[i,j] := -1;
  end;
  for i := 1 to n do
  begin
    k := Random(30)+1;

    case nn of
    1: writeln(f1,ym[i].y,' ',ym[i].m,' ',ym[i].id,' ',k);
    2: writeln(f1,ym[i].id,' ',k,' ',ym[i].y,' ',ym[i].m);
    3: writeln(f1,k,' ',ym[i].y,' ',ym[i].m,' ',ym[i].id);
    4: writeln(f1,ym[i].id,' ', ym[i].y,' ',ym[i].m,' ',k);
    end;
    b[ym[i].y,ym[i].m] := 0;
    case nn of
    1,3: a[ym[i].y,ym[i].m] := a[ym[i].y,ym[i].m]+1;
    2,4: a[ym[i].y,ym[i].m] := a[ym[i].y,ym[i].m]+k;
    end;
  end;
  Close(f1);
  case nn of
  1:for i := 2010 downto 2000 do
    for j := 1 to 12 do
      if b[i,j] = 0 then
        writeln(f2,i,' ',j,' ',a[i,j]);
  2:for i := 2000 to 2010 do
    for j := 1 to 12 do
      if b[i,j] = 0 then
        writeln(f2,i,' ',j,' ',a[i,j]);
  3:while true do
  begin
    mm := 0;
    for i := 2000 to 2010 do
    for j := 1 to 12 do
      if a[i,j]>mm then
      begin
        mm := a[i,j];
        i0 := i;
        j0 := j;
      end;
    if mm > 0 then
    begin
      writeln(f2,mm,' ',i0,' ',j0);
      a[i0,j0] := 0;
    end
    else
      break;
  end;
  4:while true do
  begin
    mm := 10000;
    for i := 2010 downto 2000 do
    for j := 1 to 12 do
      if a[i,j]<mm then
      begin
        mm := a[i,j];
        i0 := i;
        j0 := j;
      end;
    if mm < 10000 then
    begin
      if b[i0,j0] = 0 then
        writeln(f2,mm,' ',i0,' ',j0);
      a[i0,j0] := 10000;
    end
    else
      break;
  end;

  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC8(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0,mm,p: integer;
    a: array[2000..2010,0..12] of integer;
    id0: array[1..10] of integer;
    b: array[2000..2010] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('���� ����� ����� {P} (10~<~{P}~<~50). �������� ������������������ ��������',0,1);
  TaskText('�������� � �������� ������-������. ������ ������� ������������������',0,2);
  TaskText('�������� ��������� ������������� ����:',0,3); //2013.05
  case nn of
  1: TaskText('\(\M<����� ������> <���> <����������������� ������� (� �����)> <��� �������>\m\)',0,4);
  2: TaskText('\(\M<����������������� ������� (� �����)> <��� �������> <����� ������> <���>\m\)',0,4);
  end;
//2013.05  TaskText('��� ������ �������������. �������� ���� ����� � ��������� �� 2000 �� 2010,',0,4);
//2013.05  TaskText('��� ������� \= � ��������� 10\-99, ����������������� ������� \= � ��������� 1\-30.',0,5);

  case nn of
  1: begin
  TaskText('��� ������� ����, ��������������� � �������� ������, ���������� ������,',0,5);
  TaskText('� ������� ��������� ������������ ������� ���� �������� ���������� ����� 25~%',0,0);
  TaskText('�� ��������� ������������ �� ���� ��� (������� �������� ���, ����� ������',0,0);
  TaskText('�� ����������� �� �������). ���� � ��������� ���� �� ��� ������ ������',0,0);
  TaskText('�� ����������� ��������� �������, �� ����� ������ ���� �������� ����� \<No\>.',0,0);
  TaskText('�������� � ������ ���� �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ����������� ������ ����.',0,0);
  end;
  2: begin
  TaskText('��� ������� ����, ��������������� � �������� ������, ���������� ����������',0,5);
  TaskText('�������, � ������� ��������� ������������ ������� ���� �������� ����������',0,0);
  TaskText('����� {P} ��������� �� ��������� ������������ �� ���� ��� (������� ��������',0,0);
  TaskText('���������� �������, ����� ���). ���� � ��������� ���� �� ��� ������ ������',0,0);
  TaskText('�� ����������� ��������� �������, �� ������� ��� ���� 0. �������� � ������',0,0);
  TaskText('���� �������� �� ����� ������ � ������������� �� �������� ����������',0,0);
  TaskText('�������, � ��� ����������� ���������� \= �� ����������� ������ ����.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(3) of
  0,2: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
  p := Random(41) + 10;
//  writeln(f1,n);
  for i := 1 to 10 do
    id0[i] := Random(90)+10;
  MakeYM(n);
  for i := 2000 to 2010 do
  begin
    b[i] := -1;
    for j := 0 to 12 do
      a[i,j] := 0;
  end;
  for i := 1 to n do
  begin
    k := Random(30)+1;

    case nn of
    1: writeln(f1,ym[i].m,' ',ym[i].y,' ',k,' ',ym[i].id);
    2: writeln(f1,k,' ',ym[i].id,' ',ym[i].m,' ',ym[i].y);
    end;
    b[ym[i].y] := 0;
    a[ym[i].y,0] := a[ym[i].y,0]+k;
    a[ym[i].y,ym[i].m] := a[ym[i].y,ym[i].m]+k;

  end;
  Close(f1);
  case nn of
  1:
  for i := 2000 to 2010 do
  begin
    if b[i] = -1 then continue;
    write(f2, i);
    for j := 1 to 12 do
      if a[i,j] > a[i,0]*p/100 then
      begin
        b[i] := b[i] + 1;
        write(f2,' ',j);
      end;
    if b[i] = 0 then
      writeln(f2,' No')
    else
      writeln(f2);
  end;
  2:begin
    for i := 2000 to 2010 do
    begin
      if b[i] = -1 then continue;
      for j := 1 to 12 do
      if a[i,j] > a[i,0]*p/100 then
        b[i] := b[i] + 1;
    end;
    while true do
    begin
      mm := -1;
      for i := 2000 to 2010 do
        if mm < b[i] then
        begin
          mm := b[i];
          k0 := i;
        end;
      if mm > -1 then
      begin
        writeln(f2,mm,' ', k0);
        b[k0] := -1;
      end
      else
        break;
    end;
  end;
  end;
  Close(f2);
  DataN('P = ', p, 3, 1, 2);
  DefDataEndSpec(s);
  SetTestCount(9);

end;


procedure ExamC9;
var f1,f2: text;
    s: string;
    i,n,k,y0,ks,ny: integer;
    a: array[1..21] of integer;
    year: array[1..10] of integer;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<����� �����> <��� �����������> <�������>\m\)',0,3);
//2013.05  TaskText('����� ����� � ��� ����������� �������� ������ �������.',0,4);

  TaskText('��� ������� ����, ��������������� � �������� ������, ����� ����� � ����������',0,4);
  TaskText('������� ����� ����, ������� �������� �����������, ����������� � ���� ����,',0,5);
  TaskText('� ������� ��� � ��������� ����� �����. �������� � ������ ���� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ����������� ������ ����.',0,0);
  s := DefDataStart(f1,f2);
  for i := 1 to 21 do
    a[i] := 0;
  if Random(2)=0 then
  begin
    n := 50 + Random(50);
    ny := 6 + Random(5);
  end
  else
  begin
    n := 10 + Random(10);
    ny := 3 + Random(3);
  end;
//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to 10 do
    year[i] := Random(21)+1;
  for i := 1 to n do
  begin
    k := year[Random(ny)+1];
    ks := Random(99)+1;
    writeln(f1,ks,' ',k+y0,' ',RandomFam1);
    if ks > a[k] then
      a[k] := ks;
  end;
  Close(f1);
  for i := 1 to 21 do
    if a[i] <> 0 then
      writeln(f2,i+y0,' ',a[i]);
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC10(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,max,y0: integer;
    a: array[1..21] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<��� �����������> <����� �����> <�������>\m\)',0,3);
  2: TaskText('\(\M<����� �����> <��� �����������> <�������>\m\)',0,3);
  end;
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);
  case nn of
  1: begin
  TaskText('����������, � ����� ���� ����� ����� ������������ ��� ���� ����',0,4);
  TaskText('���� ����������, � ������� ��� �����, � ����� ���������� ����� ���.',0,5);
  TaskText('������ ����� �������� �� ����� ������.',0,0);
  end;
  2: begin
  TaskText('����������, � ����� ���� ����� ����� ������������ ��� ���� ����',0,4);
  TaskText('���� ����������, � ������� ��� �����, � ����� ����, � ������� ��� ����',0,5);
  TaskText('���������� (���� ������������� �� �����������, ������ �����',0,0);
  TaskText('�������� �� ����� ������).',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  for i := 1 to 21 do
    a[i] := 0;
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to n do
  begin
    k := Random(21)+1;
    case nn of
    1: writeln(f1,k+y0,' ',Random(99)+1,' ',RandomFam1);
    2: writeln(f1,Random(99)+1,' ',k+y0,' ',RandomFam1);
    end;
    a[k] := a[k]+1;
  end;
  Close(f1);
  max := a[1];
  for i := 1 to 21 do
    if a[i]>max then
      max := a[i];
  writeln(f2,max);
  case nn of
  1: begin
  k := 0;
  for i := 1 to 21 do
    if a[i]=max then
      k := k + 1;
  writeln(f2,k);

  end;
  2:
  begin
  for i := 1 to 21 do
    if a[i] = max then
      writeln(f2,i+y0);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;




procedure ExamC11;
var f1,f2: text;
    s: string;
    i,n,k,v,y0: integer;
    a,b: array[1..21] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<��� �����������> <����� �����> <�������>\m\)',0,3);
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);
  TaskText('��� ������� ����, ��������������� � �������� ������, ������� �����',0,4);
  TaskText('����� ������������, ����������� � ���� ���� (������� ��������� �����',0,5);
  TaskText('������������, ����� ���). �������� � ������ ���� �������� �� �����',0,0);
  TaskText('������ � ������������� �� �������� ����� �����������, � ��� �����������',0,0);
  TaskText('����� \= �� ����������� ������ ����.',0,0);
(*==*)
  for i := 1 to 21 do
    a[i] := 0;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to n do
  begin
    k := Random(21)+1;
    writeln(f1,k+y0,' ',Random(99)+1,' ',RandomFam1);
    a[k] := a[k]+1;
  end;
  Close(f1);
  for i := 1 to 21 do
    b[i] := i;
  for k := 1 to 21 do
    for i := 1 to 21-k do
      if a[i]<a[i+1] then
      begin
        v := a[i];
        a[i] := a[i+1];
        a[i+1] := v;
        v := b[i];
        b[i] := b[i+1];
        b[i+1] := v;
      end;
  for i := 1 to 21 do
  begin
    if a[i] = 0 then break;
    writeln(f2,a[i],' ',b[i]+y0);
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC11a(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,v,y0,a0,mm,kk,ks,j: integer;
    a: array[1990..2010] of integer;
    b: array[1990..2010,1..99] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<����� �����> <��� �����������> <�������>\m\)',0,3);
  2: TaskText('\(\M<��� �����������> <����� �����> <�������>\m\)',0,3);
  end;
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);
  case nn of
  1: begin
  TaskText('��� ������� ����, ��������������� � �������� ������, ������� ����� ���������',0,4);
  TaskText('����, ������� �������� �����������, ����������� � ���� ���� (������� ���������',0,5);
  TaskText('����� ����, ����� ���). �������� � ������ ���� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ����������� ����� ����, � ��� ����������� ����� \=',0,0);
  TaskText('�� ����������� ������ ����.',0,0);
  end;
  2: begin
  TaskText('����� ����, ��� ������� ����� ������������ ���� �� ������ ��������',0,4);
  TaskText('�������� �� ���� ����� (������� ��������� ����� ������������ ��� �������',0,5); //2013.04.30
  TaskText('����, ����� ���). �������� � ������ ���� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� �������� ����� ������������, � ��� �����������',0,0);
  TaskText('����� \= �� ����������� ������ ����.',0,0);
  end;
  end;
(*==*)
  for i := 1990 to 2010 do
  begin
    a[i] := 0;
    for j := 1 to 99 do
      b[i,j] := 0;
  end;
  a0 := 0;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to n do
  begin
    k := Random(21)+1+y0;
    ks := Random(99)+1;
    case nn of
    1: writeln(f1,ks,' ',k,' ',RandomFam1);
    2: writeln(f1,k,' ',ks,' ',RandomFam1);
    end;
    a[k] := a[k]+1;
    b[k, ks] := 1;
    a0 := a0 + 1;
  end;
  Close(f1);
  k := 0;
  for i := 1990 to 2010 do
    if a[i] > 0 then
      k := k + 1;
  for i := 1990 to 2010 do
    if a[i] < a0/k then
      a[i] := 0;
  case nn of
  1:
  begin
  for i := 1990 to 2010 do
  begin
    a[i] := 0;
    for j := 1 to 99 do
      a[i] := a[i] + b[i,j];
  end;

  while true do
  begin
    mm := 1000;
    for i := 1990 to 2010 do
      if (a[i]<mm) and (a[i] <> 0) then
      begin
        mm := a[i];
        kk := i;
      end;
      if mm = 1000 then break;
      writeln(f2,mm,' ',kk);
      a[kk] := 0;
  end;


  end;
  2:
  begin
  for i := 1990 to 2010 do
    if a[i] > 0 then
      k := k + 1;
  for i := 1990 to 2010 do
    if a[i] < a0/k then
      a[i] := 0;

  while true do
  begin
    mm := 0;
    for i := 1990 to 2010 do
      if a[i]>mm then
      begin
        mm := a[i];
        kk := i;
      end;
      if mm = 0 then break;
      writeln(f2,mm,' ',kk);
      a[kk] := 0;
  end;

  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC12;
var f1,f2: text;
    s,ss: string;
    i,n,k,y0: integer;
    a: array[1..99] of integer;
    b: array[1..99] of string;
    school: array[1..10] of integer;
    ns: integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<�������> <��� �����������> <����� �����>\m\)',0,3);
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);
  TaskText('��� ������ ����� ������� ����� ����� ������������ �� ��� ���� � �������',0,4);
  TaskText('������� �� ������������ ���� �����, ������������ � �������� ������ ������',0,5);
  TaskText('(������� ��������� ����� �����, ����� ����� ������������, ����� �������).',0,0);
  TaskText('�������� � ������ ����� �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ����������� ������� ����.',0,0);

(*==*)
  for i := 1 to 99 do
  begin
    a[i] := 0;
    b[i] := '';
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then
  begin
    n := 50 + Random(50);
    ns := 5 + Random(5);
  end
  else
  begin
    n := 10 + Random(10);
    ns := 3 + Random(3);
  end;
  for i := 1 to ns div 2 do
    school[i] := Random(9)+1;
  for i := ns div 2 + 1 to ns do
    school[i] := Random(90)+10;

//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to n do
  begin
    ss := RandomFam1;
    k := school[Random(ns)+1];
    writeln(f1,ss,' ',Random(21)+1+y0,' ',k);
    a[k] := a[k]+1;
    if b[k] = '' then
      b[k] := ss;
  end;
  Close(f1);
  for i := 1 to 99 do
    if a[i] <> 0 then
      writeln(f2,i,' ',a[i],' ',b[i]);
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC13(nn: integer);
var f1,f2: text;
    s,ss,mm: string;
    i,n,k,max,y0,j,kk: integer;
    a: array[1..99] of integer;
    b: array[1..99,0..100] of string;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<�������> <����� �����> <��� �����������>\m\)',0,3);
  2: TaskText('\(\M<�������> <��� �����������> <����� �����>\m\)',0,3);
  end;
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);
  case nn of
  1: begin
  TaskText('����������, ��� ����� ���� ����� ����� ������������ �� ��� ���� ����',0,4);
  TaskText('����������, � ������� ������ �� ������������ �� ���� ���� (������� ���������',0,5);
  TaskText('����� �����, ����� ������� �����������). �������� � ������ �����������',0,0);
  TaskText('�������� �� ����� ������ � ������������� �� ����������� ������� ����,',0,0);
  TaskText('� ��� ���������� ������� \= � ������� ���������� ������������',0,0);
  TaskText('� �������� ������ ������.',0,0);
  end;
  2: begin
  TaskText('����������, ��� ����� ���� ����� ����� ������������ �� ��� ���� ����',0,4);
  TaskText('����������, � ������� ��� ������ �� ���� ���� ������ � ������ �����������',0,5);
  TaskText('� ���������� ������� (������� ��������� ������� �����������, ����� �����',0,0);
  TaskText('�����). �������� � ������ ����������� �������� �� ����� ������ � �������������',0,0);
  TaskText('� ���������� �������, � ��� ���������� ������� \= �� ����������� ������� ����.',0,0);
  end;
  end;
(*==*)
  for i := 1 to 99 do
  begin
    a[i] := 0;
    b[i,0] := '���';
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  y0 := 1989;
  for i := 1 to n do
  begin
    k := Random(99)+1;
    ss := RandomFam1;
    case nn of
    1: writeln(f1,ss,' ',k,' ',Random(21)+1+y0);
    2: writeln(f1,ss,' ',Random(21)+1+y0,' ',k);
    end;
    a[k] := a[k]+1;
    b[k, a[k]] := ss;
    if ss < b[k, 0] then
      b[k, 0] := ss;
  end;
  Close(f1);
  max := a[1];
  for i := 1 to 99 do
  begin
    if a[i]>max then
      max := a[i];
  end;
  case nn of
  1: begin
    for i := 1 to 99 do
     if a[i] = max then
       for j := 1 to a[i] do
         writeln(f2,i,' ',b[i,j]);
   end;
  2:
  begin
    for i := 1 to 99 do
     if a[i] <> max then
       b[i,0] := '���';
  while true do
  begin
    mm := '���';
    for i := 1 to 99 do
      if b[i,0]<mm then
      begin
        mm := b[i,0];
        kk := i;
      end;
      if mm = '���' then break;
      writeln(f2,mm,' ',kk);
      b[kk,0] := '���';
  end;


  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC14;
var f1,f2: text;
    s: string;
    i,n,k,v,y0,j,ky,k0: integer;
    a: array[1..99] of integer;
    b: array[1..99,1990..2010] of integer;
    school: array[1..20] of integer;
    year: array[1..12] of integer;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<�������> <����� �����> <��� �����������>\m\)',0,3);
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);

  TaskText('��� ������ ����� ����� ���� ����������� ������������ �� ���� �����',0,4);
  TaskText('� ������� ����� ����� � ��������� ��� ��� ���� (���� �������������',0,5);
  TaskText('�� ��� �� ������, ��� � ����� �����, � ��������������� �� �����������).',0,0);
  TaskText('�������� � ������ ����� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ����������� ������� ����.',0,0);
  for i := 1 to 99 do
    for j := 1990 to 2010 do
      b[i,j] := 0;
  for i := 1 to 5 do
    school[i] := Random(9)+1;
  for i := 6 to 20 do
    school[i] := Random(90)+10;
  y0 := 1989;
  for i := 1 to 10 do
    year[i] := Random(21)+1+y0;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);


  for i := 1 to n do
  begin
    k := school[Random(20)+1];
    ky := year[Random(10)+1];
    writeln(f1,RandomFam1,' ',k,' ',ky);
    b[k,ky] := b[k,ky]+1;
  end;
  Close(f1);
  for i := 1 to 99 do
  begin
    k0 := 0;
    a[i] := 0;
    for j := 1990 to 2010 do
      if b[i,j] > 0 then
        a[i] := 1;
  end;
  for i := 1 to 99 do
  begin
    if a[i] = 0 then continue;
    write(f2,i);
    for j := 1990 to 2010 do
      if b[i,j] > 0 then
      write(f2,' ',j);
    writeln(f2);
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC14a(nn: integer);
var f1,f2: text;
    s,s0: string;
    i,n,k,v,y0,a0,mm,kk,nss,nyy,j: integer;
    a: array[1..99,1990..2010] of integer;
    yy: array[1..10] of integer;
    ss: array[1..10] of integer;
    fam: array[1..99,1990..2010,1..3] of string;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������������.',0,1);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<�������> <��� �����������> <����� �����>\m\)',0,3);
  2: TaskText('\(\M<�������> <����� �����> <��� �����������>\m\)',0,3);
  end;
//2013.05  TaskText('����� ����� �������� �� ����� ���� ����, ���� ����� � ��������� �� 1990',0,4);

  case nn of
  1: begin
  TaskText('��� ������ ���� \<���\:�����\>, �������������� � �������� ������, ����� �����',0,4);
  TaskText('������������, ����������� � ����� ���� � �����, � ������� ���, ����� �����',0,5);
  TaskText('� ��������� ����� ������������. �������� � ������ ���� \<���\:�����\> ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� �������� ����, � ��� ����������� ����� \=',0,0);
  TaskText('�� ����������� ������ �����.',0,0);
  end;
  2: begin
  TaskText('��� ������ ���� \<�����\:���\>, �������������� � �������� ������, ����� ����',0,4);
  TaskText('������ ������������, ����������� � ���� ����� � ����, � ������� ����� �����,',0,5);
  TaskText('��� � ��������� ������� (� ������� �� ���������� � �������� ������ ������).',0,0);
  TaskText('���� ��� ��������� ���� \<�����\:���\> ������� ����� ���� ������������,',0,0);
  TaskText('�� ������� ���������� ��� ���� ������������, ����������� � ���� ����.',0,0);
  TaskText('�������� � ������ ���� \<�����\:���\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ����������� ������ �����, � ��� ����������� ������� \= �� �������� ����.',0,0);
  end;
  end;
(*==*)
  for i := 1 to 99 do
    for j := 1990 to 2010 do
    a[i,j] := 0;
  y0 := 1989;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then
  begin
    n := 50 + Random(50);
    nss := 5+Random(4);
    nyy := 5+Random(4);
  end
  else
  begin
    n := 10 + Random(10);
    nss := 2+Random(3);
    nyy := 2+Random(3);
  end;
  for i := 1 to nss div 2 do
    ss[i] := Random(9)+1;
  for i := nss div 2 + 1 to nss do
    ss[i] := Random(90)+10;
  for i := 1 to nyy do
    yy[i] := Random(21)+1+y0;

//  writeln(f1,n);

  for i := 1 to n do
  begin
    k := ss[Random(nss)+1];
    kk := yy[Random(nyy)+1];
    s0 := RandomFam1;
    case nn of
    1: writeln(f1,s0,' ',kk,' ',k);
    2: writeln(f1,s0,' ',k,' ',kk);
    end;
    a[k,kk] := a[k,kk]+1;
    if a[k,kk] <= 3 then
      fam[k,kk,a[k,kk]] := s0;
  end;

  Close(f1);
  case nn of
  1:
  begin
  for j := 2010 downto 1990 do
    for i := 1 to 99 do
      if a[i,j] > 0 then
      begin
        writeln(f2,j,' ',i,' ',a[i,j]);
      end;
  end;
  2:
  for i := 1 to 99 do
    for j := 2010 downto 1990 do
      if a[i,j] > 0 then
      begin
        write(f2,i,' ',j);
        kk := a[i,j];
        if kk > 3 then
          kk := 3;
        for k := 1 to kk do
          write(f2,' ',fam[i,j,k]);
        writeln(f2);
      end;
  end;

  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;




procedure ExamC15a(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,mm: integer;
    b: array[1..100] of Flat;
    a: array[0..3] of School;
    bool: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<����� ��������> <�������> <�������������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);
TaskText('�� 4~��������. ��� ������� �� 4~��������� ���� ������� �������� � �����������,',0,0);
case nn of
1: begin
TaskText('������� � ���� ��������: ����� ��������, ����� �����������, �������',0,0);
TaskText('������������� ��� ������� ����� �������� (��������� � ����� �������� �������).',0,0);
TaskText('������, �� ������� �����, ��� ���������� ������� ������������� �� �����������.',0,0);
TaskText('�������� � ������ �������� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� ����������� ������ ��������. ���� � �����-���� �������� ����������',0,0);
TaskText('�����������, �� ������ �� ���� �������� �� ��������.',0,0);
end;
end;
  for i := 0 to 3 do
  begin
    a[i].num := 0;
    a[i].data1 := 0;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    cost := (Random(50)*2+10)*10;
    case nn of
    1: writeln(f1,nf,' ',fam,' ',cost:0:2);
    2: writeln(f1,fam,' ',cost:0:2,' ',nf);
    end;
    k := (nf-1) div 36;
    with a[k] do
    begin
      Inc(num);
      data1 := data1 + cost;
    end;
  end;
  Close(f1);
  case nn of
  1:
  for i := 0 to 3 do
  with a[i] do
  if num > 0  then
    writeln(f2,i+1,' ',num, ' ',data1/num:0:2);
  2:while true do
  begin
    mm := 0;
    for i := 0 to 3 do
    with a[i] do
      if num > mm then
      begin
        mm := num;
        k := i;
      end;
    if mm = 0 then break;
    writeln(f2,mm,' ',k+1, ' ',a[k].data1/mm:0:2);
    a[k].num := 0;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC15b(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,mm: integer;
    b: array[1..100] of Flat;
    a: array[0..3] of School;
    bool: boolean;
    rr: real;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�������> <�������������> <����� ��������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);
TaskText('�� 4~��������. ����� ����� ��������, ������ �������� ����� ����������',0,0);


case nn of
2: begin
TaskText('��������� �������������, � ������� ���� ����� ������ � �������� ���������',0,0);
TaskText('������������� (��������� � ����� �������� �������). �������, ���',0,0);
TaskText('��������� ������������� ��� ���� ��������� ����� ��������� ��������.',0,0);
end;
end;
(*==*)
  for i := 0 to 3 do
  begin
    a[i].num := 0;
    a[i].data1 := 0;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    cost := (Random(100000)+10000)/100;
    case nn of
    1: writeln(f1,nf,' ',fam,' ',cost:0:2);
    2: writeln(f1,fam,' ',cost:0:2,' ',nf);
    end;
    k := (nf-1) div 36;
    with a[k] do
    begin
      Inc(num);
      data1 := data1 + cost;
    end;
  end;
  Close(f1);
  case nn of
  1:
  for i := 0 to 3 do
  with a[i] do
  if num > 0  then
    writeln(f2,i+1,' ',num, ' ',data1/num:0:2);
  2:
  begin
  rr := 0;
  for i := 0 to 3 do
    if a[i].data1 > rr then
    begin
      rr := a[i].data1;
      k := i+1;
    end;
    writeln(f2,k, ' ',rr:0:2);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC16(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k: integer;
    b: array[1..100] of Flat;
    a: array[0..8] of School;
    bool: boolean;
    x: School;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�������������> <�������> <����� ��������>\m\)',0,4);
2:TaskText('\(\M<�������> <����� ��������> <�������������>\m\)',0,4);
end;

TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);
TaskText('�� 4~��������. ��� ������� �� 9~������ ���� ������� �������� � �����������,',0,0);

case nn of
1: begin
TaskText('������� �� ���� �����: ����� �����, ��������� ������������� ��� �������',0,0);
TaskText('����� ����� (��������� � ����� �������� �������), ����� �����������.',0,0);
TaskText('�������� � ������ ����� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� �������� ������ �����. ���� �� �����-���� ����� ����������',0,0);
TaskText('�����������, �� ������� ��� ����� ����� ������� ������.',0,0);
end;
2: begin
TaskText('������� �� ���� �����: ����� �����������, ����� �����, ���������',0,0);
TaskText('������������� ��� ������� ����� ����� (��������� � ����� �������� �������).',0,0);
TaskText('�������� � ������ ����� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� ����������� ����� �����������, � ��� ����������� ����� \=',0,0);
TaskText('�� ����������� �����. ���� �� �����-���� ����� ���������� �����������,',0,0);
TaskText('�� ������ �� ���� ����� �� ��������.',0,0);
end;
end;
(*==*)
  for i := 0 to 8 do
  begin
    a[i].num := 0;
    a[i].data1 := 0;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    cost := (Random(50)*2+10)*10;
    case nn of
    1:writeln(f1,cost:0:2,' ',fam,' ',nf);
    2:writeln(f1,fam,' ',nf,' ',cost:0:2);
    end;
    k := ((nf-1) mod 36) div 4;
    with a[k] do
    begin
      Inc(num);
      data1 := data1 + cost;
      data2 := k+1;
    end;
  end;
  Close(f1);
  case nn of
  1:
  for i := 8 downto 0 do
  with a[i] do
    if num > 0 then
      writeln(f2,data2, ' ',data1:0:2,' ',num)
    else
      writeln(f2,i+1, ' ',0.0:0:2,' ',0);
  2:
  begin
  for k := 0 to 7 do
    for i := 0 to 7-k do
      if (a[i].num > a[i+1].num) or
         (a[i].num = a[i+1].num)and (a[i].data2>a[i+1].data2) then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 0 to 8 do
  with a[i] do
  if num > 0  then
    writeln(f2,num, ' ',data2,' ',data1:0:2);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC17(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,kk,ll: integer;
    mm: real;
    b: array[1..100] of Flat;
    a: array[0..3] of School;
    a1,a2: array[0..3] of School;
    bool: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<����� ��������> <�������> <�������������>\m\)',0,4);
2:TaskText('\(\M<�������������> <�������> <����� ��������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);

case nn of
1: begin
TaskText('�� 4~��������. ��� ������� �� 4~��������� ���� ����� ������ � ����������',0,0);
TaskText('�������������� � ������� �������� � ���: ����� ��������, ����� ��������,',0,0);
TaskText('������� ������, ������������� (��������� � ����� �������� �������).',0,0);
TaskText('�������, ��� � ������ �������� ������ ��� ������������� ����� ���������',0,0);
TaskText('��������. �������� � ������ ���������� �������� �� ��������� ������',0,0);
TaskText('� ������������� �� ����������� ������ ��������. ���� � �����-����',0,0);
TaskText('�������� ���������� �����������, �� ������ �� ���� �������� �� ��������.',0,0);
end;
2: begin
TaskText('�� 4~��������. ��� ������� �� 4 ��������� ���� ����� ���� ������� � ����������',0,0);
TaskText('�������������� � ������� �������� � ���: ������������� (��������� � �����',0,0);
TaskText('�������� �������), ����� ��������, ����� ��������, ������� ������. �������,',0,0);
TaskText('��� � ������ �������� ������ ��� ������������� ����� ��������� ��������.',0,0);
TaskText('�������� � ������ ���������� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� �������� ������� ������������� (����� �������� ��� ����������',0,0);
TaskText('�� ���������). ���� � �����-���� �������� ����� ����������� ������ ����,',0,0);
TaskText('�� �������� � ���������� ����� ���� ����������� ����� ��������.',0,0);
end;
end;
(*==*)
  for i := 0 to 3 do
  begin
    a[i].num := 0;
    a[i].data1 := 0;
    a1[i].num := 0;
    a1[i].data1 := 0;
    a2[i].num := 0;
    a2[i].data1 := 0;
  end;
  s := DefDataStart(f1,f2);
  kk := 0;
  if Random(2)=0 then n := 50 + Random(50)
  else
  begin
    n := 10 + Random(10);
    if Random(2)=0 then
      kk := Random(4)+1;
  end;
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if (nf = b[k].nf) or (kk <> 0) and ((nf-1) div 36+1=kk) then
        begin
          bool := false;
          break;
        end;
    until bool;
    repeat
      cost := (Random(100000)+10000)/100;
      bool := true;
      for k := 1 to i-1 do
        if cost = b[k].cost then
        begin
          bool := false;
          break;
        end;
    until bool;

    case nn of
    1: writeln(f1,nf,' ',fam,' ',cost:0:2);
    2: writeln(f1,cost:0:2,' ',fam,' ',nf);
    end;
    k := (nf-1) div 36;
    with a[k] do
      if data1 < cost then
      begin
        a2[k] := a1[k];
        a1[k] := a[k];
        data1 := cost;
        num := nf;
        data4 := fam;
      end
      else
      if a1[k].data1 < cost then
      begin
        a2[k] := a1[k];
        a1[k].data1 := cost;
        a1[k].num := nf;
        a1[k].data4 := fam;
      end
      else
      if a2[k].data1 < cost then
      begin
        a2[k].data1 := cost;
        a2[k].num := nf;
        a2[k].data4 := fam;
      end;
  end;
  Close(f1);
  case nn of
  1:
  for i := 0 to 3 do
  with a[i] do
    if num > 0 then
      writeln(f2,(num-1) div 36+1,' ',num,' ',data4,' ',data1:0:2);
  2: while true do
  begin
    mm := 0;
    for i := 0 to 3 do
    begin
    with a[i] do
      if data1>mm then
      begin
        mm := data1;
        k := i;
        ll := 0;
      end;
    with a1[i] do
      if data1>mm then
      begin
        mm := data1;
        k := i;
        ll := 1;
      end;
    with a2[i] do
      if data1>mm then
      begin
        mm := data1;
        k := i;
        ll := 2;
      end;
    end;
    if mm = 0 then break;
    case ll of
    0: begin
        with a[k] do
          writeln(f2,mm:0:2,' ',(num-1) div 36+1,' ',num,' ',data4);
        a[k].data1 := 0;
       end;
    1: begin
        with a1[k] do
          writeln(f2,mm:0:2,' ',(num-1) div 36+1,' ',num,' ',data4);
        a1[k].data1 := 0;
       end;
    2: begin
        with a2[k] do
          writeln(f2,mm:0:2,' ',(num-1) div 36+1,' ',num,' ',data4);
        a2[k].data1 := 0;
       end;
     end;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC18a(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k: integer;
    b: array[1..100] of Flat;
    a: array[0..8] of School;
    bool: boolean;
    x: School;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�������> <�������������> <����� ��������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);
TaskText('�� 4~��������. ��� ������� �� 9~������ ���� ����� ������ � ����������',0,0);

case nn of
1: begin
TaskText('�������������� � ������� �������� � ���: ����� ��������, ����� �����,',0,0);
TaskText('������� ������, ������������� (��������� � ����� �������� �������).',0,0);
TaskText('�������, ��� � ������ �������� ������ ��� ������������� ����� ���������',0,0);
TaskText('��������. �������� � ������ ���������� �������� �� ��������� ������',0,0);
TaskText('� ������������� �� ����������� ������ ��������. ���� �� �����-����',0,0);
TaskText('����� ���������� �����������, �� ������ �� ���� ����� �� ��������.',0,0);
end;
end;
(*==*)
  for i := 0 to 8 do
  begin
    a[i].num := 0;
    a[i].data1 := 1000000;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    repeat
      cost := (Random(100000)+10000)/100;
      bool := true;
      for k := 1 to i-1 do
        if cost = b[k].cost then
        begin
          bool := false;
          break;
        end;
    until bool;
    case nn of
    1: writeln(f1,fam,' ',cost:0:2,' ',nf);
    2: writeln(f1,fam,' ',nf,' ',cost:0:2);
    end;
    k := ((nf-1) mod 36) div 4;
    with a[k] do
      if data1 > cost then
      begin
        data1 := cost;
        num := nf;
        data4 := fam;
      end;
  end;
  Close(f1);
  case nn of
  1: begin
  for k := 0 to 7 do
    for i := 0 to 7-k do
      if (a[i].num > a[i+1].num) then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 0 to 8 do
  with a[i] do
    if data1 < 1000000 then
      writeln(f2,num, ' ',((num-1) mod 36) div 4+1,' ',data4,' ',data1:0:2);
  end;
  2: begin
  for k := 0 to 7 do
    for i := 0 to 7-k do
      if (a[i].data1 < a[i+1].data1) then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 0 to 8 do
  with a[i] do
    if data1 < 1000000 then
      writeln(f2,data1:0:2,' ',((num-1) mod 36) div 4+1,' ',num,' ',data4);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC18b(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k: integer;
    b: array[1..100] of Flat;
    a: array[0..8] of School;
    bool: boolean;
    x: School;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�������> <����� ��������> <�������������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);

case nn of
2: begin

TaskText('�� 4 ��������. ��� ������� �� 9 ������ ���� ����� ������ � ����������',0,0);
TaskText('�������������� � ������� �������� � ���: ����� ����� � �������������',0,0);
TaskText('(��������� � ����� �������� �������). �������, ��� � ������ �������� ������',0,0);
TaskText('��� ������������� ����� ��������� ��������. �������� � ������ ����� ��������',0,0);
TaskText('�� ��������� ������ � ������������� �� ����������� ������ �����.',0,0);
TaskText('���� �� �����-���� ����� ���������� �����������,',0,0);
TaskText('�� ��� ����� ����� ������� �������������, ������ 0.00.',0,0);
end;
end;
  for i := 0 to 8 do
  begin
    a[i].num := 0;
    a[i].data1 := 1000000;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);

  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    repeat
      cost := (Random(100000)+10000)/100;
      bool := true;
      for k := 1 to i-1 do
        if cost = b[k].cost then
        begin
          bool := false;
          break;
        end;
    until bool;
    case nn of
    1: writeln(f1,fam,' ',cost:0:2,' ',nf);
    2: writeln(f1,fam,' ',nf,' ',cost:0:2);
    end;
    k := ((nf-1) mod 36) div 4;
    with a[k] do
      if data1 > cost then
      begin
        data1 := cost;
        num := nf;
        data4 := fam;
      end;
  end;
  Close(f1);
  case nn of
  1: begin
  for k := 0 to 7 do
    for i := 0 to 7-k do
      if (a[i].num > a[i+1].num) then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 0 to 8 do
  with a[i] do
    if data1 < 1000000 then
      writeln(f2,num, ' ',((num-1) mod 36) div 4+1,' ',data4,' ',data1:0:2);
  end;
  2: begin
  for i := 0 to 8 do
  with a[i] do
    if data1 < 1000000 then
      writeln(f2,i+1,' ',data1:0:2)
    else
      writeln(f2,i+1,' ',0.0:0:2)
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC19(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,m: integer;
    b: array[1..100] of Flat;
    a: array[1..100] of School;
    bool,bool2: boolean;
    x: School;
    r: real;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1: TaskText('\(\M<����� ��������> <�������������> <�������>\m\)',0,4);
2: TaskText('\(\M<�������������> <����� ��������> <�������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);

case nn of
1: begin
TaskText('�� 4~��������. ����� �������, ���� ������� �� ������ �������� �������',0,0);
TaskText('������������� �� ����, � ������� �������� � ���: ����� ��������,',0,0);
TaskText('�������, ������������� (��������� � ����� �������� �������). ������,',0,0);
TaskText('�� ������� �����, ��� ���������� ������� ������������� �� �����������.',0,0);
TaskText('�������� � ������ ���������� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� ����������� ������� �������.',0,0);
end;
2: begin
TaskText('�� 4~��������. ����� �������, ���� ������� �� ������ �������� �������',0,0);
TaskText('������������� �� ����, � ������� �������� � ���: ����� �����, ����� ��������,',0,0);
TaskText('�������, ������������� (��������� � ����� �������� �������). ������,',0,0);
TaskText('�� ������� �����, ��� ���������� ������� ������������� �� �����������.',0,0);
TaskText('�������� � ������ ���������� �������� �� ��������� ������ � �������������',0,0);
TaskText('�� �������� ������� ������, � ��� ���������� ������ \=',0,0);
TaskText('�� ����������� ������� �������.',0,0);
end;
end;
(*==*)
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  r := 0;
  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      bool := true;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    cost := (Random(100000)+10000)/100;
    r := r + cost;
    case nn of
    1: writeln(f1,nf,' ',cost:0:2,' ',fam);
    2: writeln(f1,cost:0:2,' ',nf,' ',fam);
    end;
  end;
  Close(f1);
  r := r/n;
  m := 0;
  for i := 1 to n do
    with b[i] do
    begin
      case nn of
      1: bool2 := cost>=r;
      2: bool2 := cost<=r;
      end;
      if bool2 then
      begin
        m := m + 1;
        with a[m] do
        begin
          num := nf;
          data2 := ((nf-1) mod 36) div 4;
          data1 := cost;
          data4 := fam;
        end;
      end;
    end;
  case nn of
  1:
  begin
  for k := 1 to m-1 do
    for i := 1 to m-k do
      if a[i].num > a[i+1].num then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 1 to m do
  with a[i] do
      writeln(f2,num, ' ', data4, ' ',data1:0:2);
  end;
  2:
  begin
  for k := 1 to m-1 do
    for i := 1 to m-k do
      if (a[i].data2 < a[i+1].data2)or
         (a[i].data2 = a[i+1].data2)and(a[i].num > a[i+1].num) then
      begin
        x := a[i];
        a[i] := a[i+1];
        a[i+1] := x;
      end;
  for i := 1 to m do
  with a[i] do
      writeln(f2,data2+1, ' ', num, ' ', data4, ' ',data1:0:2);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC20(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k,m,kk: integer;
    b: array[1..100] of Flat;
    a: array[0..8,1..100] of School;
    bool: boolean;
    x: School;
    r: array[0..8] of real;
    rn: array[0..8] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � �����������',0,1);
  TaskText('�� ������ ������������ �����, ������� � 144-���������� 9-������� ����.',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�������������> <�������> <����� ��������>\m\)',0,4);
2:TaskText('\(\M<����� ��������> <�������> <�������������>\m\)',0,4);
end;
TaskText('������������� ����������� � ���� �������� ����� (����� ����� \= �����,',0,5);
TaskText('������� ����� \= �������). � ������ �������� �� ������ ����� �������������',0,0);

case nn of
1: begin
TaskText('�� 4~��������. ��� ������� �� 4~��������� ���� ����� �����������, ���� �������',0,0);
TaskText('�� ������ �������� ������� ������������� �� ������� ��������, � �������',0,0);
TaskText('�������� � ���: ����� ��������, ������������� (��������� � ����� ��������',0,0);
TaskText('�������), �������, ����� ��������. ������, �� ������� �����, ��� ����������',0,0);
TaskText('������� ������������� �� �����������. �������� � ������ ���������� ��������',0,0);
TaskText('�� ��������� ������ � ������������� �� ����������� ������� ���������, �',0,0);
TaskText('��� ���������� ��������� \= �� �������� ������� �������������. �������,',0,0);
TaskText('��� � ������ �������� ������ ��� ������������� ����� ��������� ��������.',0,0);
end;
2: begin
TaskText('�� 4~��������. ��� ������� �� 9~������ ���� ����� �����������, ���� �������',0,0);
TaskText('�� ������ �������� ������� ������������� �� ������� �����, � �������',0,0);
TaskText('�������� � ���: ����� �����, ������������� (��������� � ����� ��������',0,0);
TaskText('�������), �������, ����� ��������. ������, �� ������� �����, ��� ����������',0,0);
TaskText('������� ������������� �� �����������. �������� � ������ ���������� ��������',0,0);
TaskText('�� ��������� ������ � ������������� �� ����������� ������� ������,',0,0);
TaskText('� ��� ���������� ������ \= �� ����������� ������� �������������. �������,',0,0);
TaskText('��� � ������ �������� ������ ��� ������������� ����� ��������� ��������.',0,0);
end;
end;
(*==*)
  s := DefDataStart(f1,f2);
  kk := 0;
  for i := 0 to 8 do
  begin
    r[i] := 0;
    rn[i] := 0;
  end;
  if Random(2)=0 then n := 50 + Random(50)
  else
  begin
    n := 10 + Random(10);
    kk := Random(5*nn);
  end;
//  writeln(f1,n);
  for i := 1 to n do
  with b[i] do
  begin
    fam := RandomFam1;
    repeat
      nf := Random(144)+1;
      case nn of
      1: bool := (kk=0) or ((nf -1)div 36+1<>kk);
      2: bool := (kk=0) or (((nf-1) mod 36) div 4+1<>kk);
      end;
      if not bool then continue;
      for k := 1 to i-1 do
        if nf = b[k].nf then
        begin
          bool := false;
          break;
        end;
    until bool;
    repeat
      cost := (Random(100000)+10000)/100;
      bool := true;
      for k := 1 to i-1 do
        if cost = b[k].cost then
        begin
          bool := false;
          break;
        end;
    until bool;
    case nn of
    1:k := (nf - 1) div 36;
    2:k := ((nf-1) mod 36) div 4;
    end;
    r[k] := r[k] + cost;
    rn[k] := rn[k] + 1;

    case nn of
    1: writeln(f1,cost:0:2,' ',fam,' ',nf);
    2: writeln(f1,nf,' ',fam,' ',cost:0:2);
    end;
  end;
  Close(f1);
  for i := 0 to 8 do
  begin
    if rn[i]>0 then
      r[i] := r[i]/rn[i];
    rn[i] := 0;
  end;
  for i := 1 to n do
    with b[i] do
    begin
      case nn of
      1:begin k := (nf - 1) div 36; bool := cost>=r[k]; end;
      2:begin k := ((nf-1) mod 36) div 4; bool := cost<=r[k]; end;
      end;
      if bool then
      begin
        rn[k] := rn[k] + 1;
        with a[k,rn[k]] do
        begin
          num := nf;
          data2 := k;
          data1 := cost;
          data4 := fam;
        end;
      end;
    end;
  case nn of
  1: begin
  for m := 0 to 3 do
  for k := 1 to rn[m]-1 do
    for i := 1 to rn[m]-k do
      if (a[m,i].data1 < a[m,i+1].data1) then
      begin
        x := a[m,i];
        a[m,i] := a[m,i+1];
        a[m,i+1] := x;
      end;
  for m := 0 to 3 do
    for i := 1 to rn[m] do
      with a[m,i] do
        writeln(f2,m+1,' ',data1:0:2,' ',data4, ' ', num);
  end;
  2: begin
  for m := 0 to 8 do
  for k := 1 to rn[m]-1 do
    for i := 1 to rn[m]-k do
      if (a[m,i].data1 > a[m,i+1].data1) then
      begin
        x := a[m,i];
        a[m,i] := a[m,i+1];
        a[m,i+1] := x;
      end;
  for m := 0 to 8 do
    for i := 1 to rn[m] do
      with a[m,i] do
        writeln(f2,m+1,' ',data1:0:2,' ',data4, ' ', num);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;




const autocount = 100;
var au: array[1..autocount] of AutoRec;

procedure MakeAuto(n,k: integer);
var i,j: integer;
    b: boolean;
    s: array[1..20] of integer;
begin
for i := 1 to k do
  s[i] := Random(StreetCount)+1;
for i := 1 to n do
  while true do
  begin
    au[i].f := Random(FirmCount)+1;
    au[i].s := s[Random(k)+1];
    au[i].m := Mark[Random(3)+1];
    case au[i].m of
    92: au[i].p := (Random(31)+200)*10;
    95: au[i].p := (Random(31)+230)*10;
    98: au[i].p := (Random(41)+260)*10;
    end;
    au[i].d1 := 0;
    au[i].d2 := 0;
    b := true;
    for j := 1 to i-1 do
      if (au[j].f = au[i].f) and (au[j].s = au[i].s)
         and (au[j].m = au[i].m) then
      begin
        b := false;
        break;
      end;
    if b then break;
  end;
end;

procedure MakeAuto1(var n: integer; k: integer);
var i,j,n0,k0,f,st: integer;
    b: boolean;
    s: array[1..20] of integer;
    m: array[1..3] of integer;
    au0: autoRec;
begin
for i := 1 to k do
  s[i] := Random(StreetCount)+1;
n0 := 0;
while n0 < n do
  while true do
  begin
    f := Random(FirmCount)+1;
    st := s[Random(k)+1];
    b := true;
    for j := 1 to n0 do
      if (au[j].f = f) and (au[j].s = st) then
      begin
        b := false;
        break;
      end;
    if b then
    begin
      case Random(7) of
      0: begin k0 := 1; m[1] := 92; end;
      1: begin k0 := 1; m[1] := 95; end;
      2: begin k0 := 1; m[1] := 98; end;
      3: begin k0 := 2; m[1] := 92; m[2] := 95; end;
      4: begin k0 := 2; m[1] := 92; m[2] := 98; end;
      5: begin k0 := 2; m[1] := 95; m[2] := 98; end;
      6: begin k0 := 3; m[1] := 92; m[2] := 95; m[3] := 98; end;
      end;
      for i := 1 to k0 do
      begin
        n0 := n0 + 1;
        au[n0].f := f;
        au[n0].s := st;
        au[n0].m := m[i];
        case au[n0].m of
        92: au[n0].p := (Random(31)+200)*10;
        95: au[n0].p := (Random(31)+230)*10;
        98: au[n0].p := (Random(41)+260)*10;
        end;
      end;
      break;
    end;
  end;
n := n0;
for i := 1 to n div 2 do
begin
  k0 := Random(n)+1;
  n0 := Random(n)+1;
  au0 := au[k0];
  au[k0] := au[n0];
  au[n0] := au0;
end;
end;


procedure MakeAuto2(n,k,m0: integer);
var i,j,r: integer;
    b: boolean;
    s: array[1..20] of integer;
begin
for i := 1 to k do
  s[i] := Random(StreetCount)+1;
r := Random(6);
for i := 1 to n do
  while true do
  begin
    au[i].f := Random(FirmCount)+1;
    au[i].s := s[Random(k)+1];
    if r = 0 then
    repeat
    au[i].m := Mark[Random(3)+1];
    until au[i].m <> m0
    else
    au[i].m := Mark[Random(3)+1];
    case au[i].m of
    92: au[i].p := (3*Random(11)+200)*10;
    95: au[i].p := (3*Random(11)+230)*10;
    98: au[i].p := (3*Random(11)+260)*10;
    end;
    au[i].d1 := 0;
    au[i].d2 := 0;
    b := true;
    for j := 1 to i-1 do
      if (au[j].f = au[i].f) and (au[j].s = au[i].s)
         and (au[j].m = au[i].m) then
      begin
        b := false;
        break;
      end;
    if b then break;
  end;
end;



procedure ExamC21a(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,mm,y0,m0,k0: integer;
    a,b,c: array[92..98] of integer;
    f: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<��������> <����� �������> <���� 1 ����� (� ��������)> <�����>\m\)',0,3);
  end;
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  TaskText('��� ������ ����� �������, �������������� � �������� ������, ����������',0,0);
  case nn of
  1: begin
  TaskText('����������� � ������������ ���� ����� ������� ���� ����� (������� ��������',0,0);
  TaskText('�����, ����� ���� � ��������� �������). �������� � ������ ����� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� �������� �������� �����.',0,0);
  end;
  end;
  s := DefDataStart(f1,f2);
  case Random(3) of
  0: n := 50 + Random(50);
  1..2: n := 2 + Random(3);
  end;
//  writeln(f1,n);
  MakeAuto(n,Random(11)+10);
  for j := 92 to 98 do
    begin
      a[j] := 0;
      b[j] := 4000;
      c[j] := 0;
    end;
  for i := 1 to n do
  begin
    case nn of
    1: writeln(f1,Firm[au[i].f],' ',au[i].m,' ',au[i].p,' ',Street[au[i].s]);
    2: writeln(f1,au[i].p,' ',au[i].m,' ',Firm[au[i].f],' ',Street[au[i].s]);
    end;
    a[au[i].m] := a[au[i].m]+1;
    if b[au[i].m] > au[i].p then
       b[au[i].m] := au[i].p;
    if c[au[i].m] < au[i].p then
       c[au[i].m] := au[i].p;
  end;
  Close(f1);
    for j := 92 to 98 do
      if a[j] = 0 then a[j] := 1000;
  case nn of
  1: for i := 2 downto 0 do
      if c[92+i*3] > 0 then
       writeln(f2,92+i*3,' ',b[92+i*3],' ',c[92+i*3]);
  2: for j := 0 to 2 do
     begin
       mm := 1000;
       for i := 0 to 2 do
         if a[92+i*3]<mm then
         begin
           mm := a[92+i*3];
           k0 := 92+i*3;
         end;
       if mm < 1000 then
         writeln(f2,mm,' ',k0);
       a[k0] := 1000;
      end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC21b(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,mm,y0,m0,k0: integer;
    a,b,c: array[92..98] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  2: TaskText('\(\M<���� 1 ����� (� ��������)> <����� �������> <��������> <�����>\m\)',0,3);
  end;
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  TaskText('��� ������ ����� �������, �������������� � �������� ������, ����������',0,0);
  case nn of
  2: begin
  TaskText('���������� �������, ������������ ��� ����� (������� �������� ����������',0,0);
  TaskText('�������, ����� ����� �����). �������� � ������ ����� �������� �� �����',0,0);
  TaskText('������ � ������������� �� ����������� ���������� �������,',0,0);
  TaskText('� ��� ����������� ���������� \= �� ����������� �������� �����.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(3) of
  0: n := 50 + Random(50);
  1..2: n := 2 + Random(3);
  end;
//  writeln(f1,n);
  MakeAuto(n,Random(11)+10);
  for j := 92 to 98 do
    begin
      a[j] := 0;
      b[j] := 4000;
      c[j] := 0;
    end;
  for i := 1 to n do
  begin
    case nn of
    1: writeln(f1,Firm[au[i].f],' ',au[i].m,' ',au[i].p,' ',Street[au[i].s]);
    2: writeln(f1,au[i].p,' ',au[i].m,' ',Firm[au[i].f],' ',Street[au[i].s]);
    end;
    a[au[i].m] := a[au[i].m]+1;
    if b[au[i].m] > au[i].p then
       b[au[i].m] := au[i].p;
    if c[au[i].m] < au[i].p then
       c[au[i].m] := au[i].p;
  end;
  Close(f1);
    for j := 92 to 98 do
      if a[j] = 0 then a[j] := 1000;
  case nn of
  1: for i := 2 downto 0 do
      if c[92+i*3] > 0 then
       writeln(f2,92+i*3,' ',b[92+i*3],' ',c[92+i*3]);
  2: for j := 0 to 2 do
     begin
       mm := 1000;
       for i := 0 to 2 do
         if a[92+i*3]<mm then
         begin
           mm := a[92+i*3];
           k0 := 92+i*3;
         end;
       if mm < 1000 then
         writeln(f2,mm,' ',k0);
       a[k0] := 1000;
      end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC22(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,mm,y0,m0,k0: integer;
    a: array[1..30,92..98] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  case nn of
  1: begin
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<��������> <�����> <����� �������> <���� 1 ����� (� ��������)>\m\)',0,3);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  end;
  2: begin
  TaskText('���� ����� ����� {M} \= �������� ����� �� ����� �������.',0,1);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,2);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,3);
  TaskText('\(\M<�����> <��������> <����� �������> <���� 1 ����� (� ��������)>\m\)',0,4);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,5);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,0);
  end;
  end;
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  case nn of
  1: begin
  TaskText('��� ������ ����� ���������� ���������� ���, ������������ ������������ �����',0,0);
  TaskText('������� (������� �������� �������� �����, ����� ��� ����� \= ���������� ���',0,0);
  TaskText('��� ������� ����� 92, 95 � 98; ��������� �� ���� ����� ����� ���� �����~0).',0,0);
  TaskText('�������� � ������ ����� �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ���� � ���������� �������.',0,0);
  end;
  2: begin
  TaskText('��� ������ ����� ���������� ���������� ���, ������������ ����� �������~{M}',0,0);
  TaskText('(������� �������� ���������� ��� �� ������ �����, ����� �������� �����;',0,0);
  TaskText('���������� ��� ����� ���� ����� 0). �������� � ������ ����� �������� �� �����',0,0);
  TaskText('������ � ������������� �� ����������� ���������� ���, � ��� �����������',0,0);
  TaskText('���������� \= �� ��������� ���� � ���������� �������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(2) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
  m0 := 92 + Random(3)*3;
//  if nn = 2 then //2013
//    writeln(f1,m0); //2013
//  writeln(f1,n);
  MakeAuto(n,Random(11)+10);
  for i := 1 to 30 do
    for j := 92 to 98 do
      a[i,j] := 0;
  for i := 1 to n do
  begin
    case nn of
    1: writeln(f1,Firm[au[i].f],' ',Street[au[i].s],' ',au[i].m,' ',au[i].p);
    2: writeln(f1,Street[au[i].s],' ',Firm[au[i].f],' ',au[i].m,' ',au[i].p);
    end;
    a[au[i].s,au[i].m] := a[au[i].s,au[i].m]+1;
  end;
  Close(f1);
  case nn of
  1:
  for i := 1 to 30 do
    if a[i,92]+a[i,95]+a[i,98]>0 then
      writeln(f2,street[i],' ',a[i,92],' ',a[i,95],' ',a[i,98]);
  2: begin
     for i := 1 to 30 do
       if a[i,92]+a[i,95]+a[i,98]=0 then
         a[i,m0] := 10000;
     while true do
     begin
       mm := 10000;
       for i := 1 to 30 do
         if a[i,m0] < mm then
         begin
           mm := a[i,m0];
           k0 := i;
         end;
       if mm = 10000 then break;
       writeln(f2, mm, ' ',Street[k0]);
       a[k0,m0] := 10000;
     end;
  end;
  end;
  Close(f2);
  if nn = 2 then
  begin
    DataN('M = ', m0, 3, 1, 2);
    DefDataEndSpec(s);
  end
  else
    DefDataEnd(s);
  SetTestCount(9);

end;




procedure ExamC23a(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,mm,y0,m0,k0: integer;
    a: array[1..30,92..98] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  case nn of
  1: begin
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<����� �������> <��������> <�����> <���� 1 ����� (� ��������)>\m\)',0,3);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  end;
  end;
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  case nn of
  1: begin
  TaskText('��� ������ ����� ���������� ����������� ���� ������� ������ �����',0,0);
  TaskText('(������� �������� �������� �����, ����� ��� ����� \= ����������� ����',0,0);
  TaskText('��� ������� ����� 92, 95 � 98). ��� ���������� ������� ������ ����� ��������',0,0);
  TaskText('�����~0. �������� � ������ ����� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� ���� � ���������� �������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  case Random(2) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
  m0 := 92 + Random(3)*3;
//  if nn = 2 then    //2013
//    writeln(f1,m0); //2013
//  writeln(f1,n);
  MakeAuto(n,Random(11)+10);
  for i := 1 to 30 do
    for j := 92 to 98 do
      case nn of
      1: a[i,j] := 5000;
      2: a[i,j] := 0;
      end;
  for i := 1 to n do
  begin
    case nn of
    1:writeln(f1,au[i].m,' ',Firm[au[i].f],' ',Street[au[i].s],' ',au[i].p);
    2:writeln(f1,au[i].m,' ',Street[au[i].s],' ',Firm[au[i].f],' ',au[i].p);
    end;
    case nn of
    1: if a[au[i].s,au[i].m] > au[i].p then
       a[au[i].s,au[i].m] := au[i].p;
    2: if a[au[i].s,au[i].m] < au[i].p then
       a[au[i].s,au[i].m] := au[i].p;
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 1 to 30 do
    for j := 92 to 98 do
      if a[i,j] = 5000 then a[i,j] := 0;
  for i := 1 to 30 do
    if a[i,92]+a[i,95]+a[i,98]>0 then
      writeln(f2,street[i],' ',a[i,92],' ',a[i,95],' ',a[i,98]);
  end;
  2: begin
  for i := 1 to 30 do
      if a[i,92]+a[i,95]+a[i,98] = 0 then a[i,m0] := 5000;
  while true do
  begin
    mm := 5000;
    for i := 1 to 30 do
      if a[i,m0]<mm then
      begin
        mm := a[i,m0];
        k0 := i;
      end;
    if mm = 5000 then break;
    writeln(f2,mm,' ',street[k0]);
    a[k0,m0] := 5000;
  end;
  end;
  end;
  Close(f2);
  if nn = 2 then
  begin
    DataN('M = ', m0, 3, 1, 2);
    DefDataEndSpec(s);
  end
  else
    DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC23b(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,mm,y0,m0,k0: integer;
    a: array[1..30,92..98] of integer;
    f: boolean;
begin
  CreateTask(Topic);(*DEMO*)
  case nn of
  2: begin
  TaskText('���� ����� ����� {M} \= �������� ����� �� ����� �������.',0,1);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,2);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,3);
  TaskText('\(\M<����� �������> <�����> <��������> <���� 1 ����� (� ��������)>\m\)',0,4);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  end;
  end;
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  case nn of
  2: begin
  TaskText('��� ������ �����, �� ������� ������� ��� � �������� �����~{M}, ����������',0,0);
  TaskText('������������ ���� ������� ���� ����� (������� �������� ������������ ����,',0,0);
  TaskText('����� �������� �����). �������� � ������ ����� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ����������� ������������ ����, � ��� ���������� ����',0,0);
  TaskText('\= �� ��������� ���� � ���������� �������. ���� �� ����� ��� � ��������',0,0);
  TaskText('�����~{M} �� �������, �� �������� � �������������� ���� ������ \<No\>.',0,0);
  end;
  end;
  s := DefDataStart(f1,f2);
  case Random(2) of
  0: n := 50 + Random(50);
  1: n := 10 + Random(10);
  end;
  m0 := 92 + Random(3)*3;
//  if nn = 2 then    //2013
//    writeln(f1,m0); //2013
//  writeln(f1,n);
  MakeAuto2(n,Random(11)+10,m0);
  for i := 1 to 30 do
    for j := 92 to 98 do
      case nn of
      1: a[i,j] := 5000;
      2: a[i,j] := 0;
      end;
  for i := 1 to n do
  begin
    case nn of
    1:writeln(f1,au[i].m,' ',Firm[au[i].f],' ',Street[au[i].s],' ',au[i].p);
    2:writeln(f1,au[i].m,' ',Street[au[i].s],' ',Firm[au[i].f],' ',au[i].p);
    end;
    case nn of
    1: if a[au[i].s,au[i].m] > au[i].p then
       a[au[i].s,au[i].m] := au[i].p;
    2: if a[au[i].s,au[i].m] < au[i].p then
       a[au[i].s,au[i].m] := au[i].p;
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 1 to 30 do
    for j := 92 to 98 do
      if a[i,j] = 5000 then a[i,j] := 0;
  for i := 1 to 30 do
    if a[i,92]+a[i,95]+a[i,98]>0 then
      writeln(f2,street[i],' ',a[i,92],' ',a[i,95],' ',a[i,98]);
  end;
  2: begin
  for i := 1 to 30 do
      if a[i,92]+a[i,95]+a[i,98] = 0 then a[i,m0] := 5000;
  j := 0;
  while true do
  begin
    mm := 5000;
    for i := 1 to 30 do
      if a[i,m0]<mm then
      begin
        mm := a[i,m0];
        k0 := i;
      end;
    if mm = 5000 then break;
    if mm > 0 then
    begin
      writeln(f2,mm,' ',street[k0]);
      j := 1;
    end;
    a[k0,m0] := 5000;
  end;
  if j = 0 then
    writeln(f2,'No');
  end;
  end;
  Close(f2);
  if nn = 2 then
  begin
    DataN('M = ', m0, 3, 1, 2);
    DefDataEndSpec(s);
  end
  else
    DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC24(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0: integer;
    a,b: array[1..firmcount,0..2] of integer;
    c: array[1..firmcount] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  case nn of
  1: begin
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  TaskText('\(\M<����� �������> <���� 1 ����� (� ��������)> <��������> <�����>\m\)',0,3);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  end;
  2: begin
  TaskText('���� ����� ����� {M} \= �������� ����� �� ����� �������.',0,1);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,2);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,3);
  TaskText('\(\M<���� 1 ����� (� ��������)> <����� �������> <�����> <��������>\m\)',0,4);
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,5);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,0);
  end;
  end;
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  case nn of
  1: begin
  TaskText('��� ������ �������� ���������� ������� ��� ��� ���� ����� �������',0,0);
  TaskText('(������� �������� �������� ��������, ����� ��� ����� \= ������� ���',0,0);
  TaskText('��� ������� ����� 92, 95 � 98). ��� ���������� ������� ������ �����',0,0);
  TaskText('�������� ����� \-1. �������� � ������ �������� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� �������� � ���������� �������.',0,0);
  end;
  2: begin
  TaskText('��� ������ �������� ���������� ������� ��� �� ������ ��������� �����~{M}',0,0);
  TaskText('(������� �������� �������� ������������ � ����������� ���� ������� �����~{M}',0,0);
  TaskText('��� ��� ������ ��������, ����� \= �������� ��������). ���� ������ �����~{M}',0,0);
  TaskText('�� ����������� ������ ���������, �� ������� �������� ������ \-1. ��������',0,0);
  TaskText('� ������ �������� �������� �� ����� ������, ������ ������������� �� ��������',0,0);
  TaskText('�������� ��������, � ��� ������ �������� �������� \= �� ��������� ��������',0,0);
  TaskText('� ���������� �������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  if nn = 2 then
  begin
  case Random(3) of
  0: m0 := 92;
  1: m0 := 95;
  2: m0 := 98;
  end;
//  writeln(f1,m0);  //2013
  end;
  case Random(2) of
  0: n := 50 + Random(50);
  1: n := 5 + Random(5);
  end;
//  writeln(f1,n);
  MakeAuto(n,Random(11)+10);
  for i := 1 to firmcount do
  for j := 0 to 2 do
  begin
    a[i,j] := 5000;
    b[i,j] := 0;
    c[i] := 0;
  end;
  for i := 1 to n do
  begin
    case nn of
    1: writeln(f1,au[i].m,' ',au[i].p,' ',Firm[au[i].f],' ',Street[au[i].s]);
    2: writeln(f1,au[i].p,' ',au[i].m,' ',Street[au[i].s],' ',Firm[au[i].f]);
    end;
    c[au[i].f] := 1;
    if a[au[i].f,(au[i].m-92) div 3] > au[i].p then
       a[au[i].f,(au[i].m-92) div 3] := au[i].p;
    if b[au[i].f,(au[i].m-92) div 3] < au[i].p then
       b[au[i].f,(au[i].m-92) div 3] := au[i].p;
  end;
  Close(f1);
  for i := 1 to firmcount do
    for j := 0 to 2 do
      if c[i] = 0 then a[i,j] := -2
      else
      if b[i,j] = 0 then a[i,j] := -1
      else
        a[i,j] := b[i,j] - a[i,j];


  case nn of
  1:
  for i := 1 to firmcount do
    if c[i] <> 0 then
      writeln(f2, firm[i],' ',a[i,0],' ',a[i,1],' ',a[i,2]);
  2:
  while true do
  begin
    max := -2;
    for i := 1 to firmcount do
      if a[i,(m0-92) div 3]>max then
      begin
        max := a[i,(m0-92) div 3];
        k0 := i;
      end;
    if max = -2 then break;
    writeln(f2, max,' ',firm[k0]);
    a[k0,(m0-92) div 3] := -2;
  end;
  end;
  Close(f2);
  if nn = 2 then
  begin
    DataN('M = ', m0, 3, 1, 2);
    DefDataEndSpec(s);
  end
  else
    DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC25(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0: integer;
    a: array[0..firmcount,0..streetcount] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1:TaskText('\(\M<��������> <���� 1 ����� (� ��������)> <����� �������> <�����>\m\)',0,3);
  2:TaskText('\(\M<�����> <����� �������> <���� 1 ����� (� ��������)> <��������>\m\)',0,3);
  end;
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);

  case nn of
  1: begin
  TaskText('��� ������ ����� ���������� ���������� ��� (������� �������� ��������',0,0);
  TaskText('�����, ����� ���������� ���). �������� � ������ ����� �������� �� �����',0,0);
  TaskText('������ � ������������� �� ��������� ���� � ���������� �������.',0,0);
  end;
  2: begin
  TaskText('��� ������ �������� ���������� ���������� ���, ������������ ��� ��� �����',0,0);
  TaskText('������� (������� �������� ���������� ���, ����� \= �������� ��������;',0,0);
  TaskText('���������� ����� ���� ����� 0). �������� � ������ �������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� �������� ���������� ���, � ��� ������',0,0);
  TaskText('����������� \= �� ��������� �������� � ���������� �������.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  k := Random(11)+10;
  case Random(2) of
  0: n := 40 + Random(50);
  1: begin n := 5 + Random(15);
     end;
  end;
  MakeAuto1(n,k);
//  writeln(f1,n);
  for i := 0 to firmcount do
    for j := 0 to streetcount do
      a[i,j] := 0;
  for i := 1 to n do
  begin
    case nn of
    1:writeln(f1,Firm[au[i].f],' ',au[i].p, ' ',au[i].m,' ',Street[au[i].s]);
    2:writeln(f1,Street[au[i].s],' ',au[i].m,' ',au[i].p, ' ',Firm[au[i].f]);
    end;
    case nn of
    1:if a[au[i].f,au[i].s] = 0 then
       a[au[i].f,au[i].s] := 1;
    2: a[au[i].f,au[i].s] := a[au[i].f,au[i].s] + 1;
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 1 to firmcount do
    for j := 1 to streetcount do
      a[0,j] := a[0,j] + a[i,j];
  for j := 1 to streetcount do
    if a[0,j] > 0 then
      writeln(f2,street[j],' ',a[0,j]);
  end;
  2: begin
  for i := 1 to firmcount do
     a[i,0] := -1;
  for i := 1 to firmcount do
    for j := 1 to streetcount do
    begin
      if a[i,j] > 0 then
        a[i,0] := 0;
    end;
  for i := 1 to firmcount do
    for j := 1 to streetcount do
    begin
      if a[i,j] = 3 then
        a[i,0] := a[i,0] + 1;
    end;
  while true do
  begin
    max := -1;
    for i := 1 to firmcount do
      if a[i,0]>max then
      begin
        max := a[i,0];
        k0 := i;
      end;
    if max = -1 then break;
    writeln(f2, max,' ',firm[k0]);
    a[k0,0] := -1;
  end;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC26(nn: integer);
var f1,f2: text;
    s: string;
    i,j,n,k,max,y0,m0,k0: integer;
    a: array[1..streetcount,1..firmcount] of integer;
    ss: array[1..streetcount] of integer;
    ff: array[1..firmcount] of integer;
    f: boolean;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ��������������� ��������',0,1);
  TaskText('(���). ������ ������� ������������������ �������� ��������� ����:',0,2);
  case nn of
  1: TaskText('\(\M<���� 1 ����� (� ��������)> <�����> <����� �������> <��������>\m\)',0,3);
  2: TaskText('\(\M<���� 1 ����� (� ��������)> <��������> <�����> <����� �������>\m\)',0,3);
  end;
//2013.05  TaskText('������� �� ����� 20 ��������� �������� � �� ����� 30 ��������� ����;',0,4);
  TaskText('�������� �������� � ���� �� �������� ��������. � �������� ����� �������',0,4);
  TaskText('����������� ����� 92, 95 ��� 98. ������ �������� ����� �� ����� ����� ���',0,5);
  TaskText('�� ������ �����; ���� �� ������ ��� ����� � ��� �� �������� ����� �����������.',0,0);
  case nn of
  1: begin
  TaskText('��������� ��� ��������� ���������� ���� � ��������, ������������ � ��������',0,0);
  TaskText('������ ������, � ��� ������ ���� \<�����\:��������\> ������� �������� �����,',0,0);
  TaskText('�������� �������� � ���������� ����� �������, ������� ���������� ��� ������',0,0);
  TaskText('��������, ������������� �� ������ ����� (���� ��� �����������, �� ����������',0,0);
  TaskText('���������� ������ 0). �������� � ������ ���� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� ���� � ���������� �������, � ��� ����������',0,0);
  TaskText('�������� ���� \= �� ��������� �������� (����� � ���������� �������).',0,0);
  end;
  2: begin
  TaskText('������� ������ ��� ���� ���, ������������ �� ����� ���� ����� �������',0,0);
  TaskText('(������� ��������� �������� ��������, ����� �������� �����, ����� ����������',0,0);
  TaskText('�������������� ����� �������). �������� � ������ ��� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� �������� � ���������� �������, � ��� ����������',0,0);
  TaskText('�������� \= �� ��������� ���� (����� � ���������� �������). ���� �� �����',0,0);
  TaskText('��������� ��� �� �������, �� �������� � �������������� ���� ������ \<No\>.',0,0);
  end;
  end;
(*==*)
  s := DefDataStart(f1,f2);
  k := Random(11)+10;
  case Random(3) of
  0: n := 40 + Random(50);
  1: n := 10 + Random(10);
  2: n := 5 + Random(5);
  end;
  MakeAuto1(n,k);
//  writeln(f1,n);
  for i := 1 to streetcount do
    for j := 1 to firmcount do
      a[i,j] := 0;
  for i := 1 to streetcount do
      ss[i] := 0;
  for j := 1 to firmcount do
      ff[j] := 0;
  for i := 1 to n do
  begin
    case nn of
    1: writeln(f1,au[i].p, ' ',Street[au[i].s],' ',au[i].m,' ',Firm[au[i].f]);
    2: writeln(f1,au[i].p, ' ',Firm[au[i].f],' ',Street[au[i].s],' ',au[i].m);
    end;
    a[au[i].s,au[i].f] := a[au[i].s,au[i].f] + 1;
    ss[au[i].s] := 1;
    ff[au[i].f] := 1;
  end;
  Close(f1);
  k0 := 0;
  case nn of
  1:
  begin
  k0 := 1;
  for i := 1 to streetcount do
     for j := 1 to firmcount do
     if (ss[i]=1) and (ff[j]=1) then
        writeln(f2, Street[i],' ',Firm[j],' ',a[i,j])
  end;
  2: for j := 1 to firmcount do
     for i := 1 to streetcount do
      if a[i,j]>=2 then
      begin
        k0 := 1;
        writeln(f2, Firm[j],' ',Street[i],' ',a[i,j]);
      end;
  end;
  if k0 = 0 then
    writeln(f2,'No');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC27a(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k1,k2,k3,k,max,max1,min: integer;
    a: array[1..15] of integer;
    b: array[1..100] of pupil;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);

case nn of
1:TaskText('\(\M<�������> <��������> <����� �����> <�����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
case nn of
1: begin
TaskText('������� ���������� ���� �� ����� ����� ��������. ���������� ����������',0,0);
TaskText('��������� ���� � ������� ���. ������� ����� �������� ��� ���� ��������,',0,0);
TaskText('���������� ���������� ��������� ���� (��� ������� ��������� ���������',0,0);
TaskText('�������, �������� � ����� �����). �������� � ������ �������� ��������',0,0);
TaskText('�� ��������� ������ � ����������� � ������� �� ���������� � �������� ������.',0,0);
end;
end;
(*==*)
  for i := 1 to 15 do
    a[i] := Random(271)+20;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  max := -1;
  max1 := -1;
  min := 1000;
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    if (i = n) and (max1 = -1) then
      repeat
        k := a[Random(15)+1];
      until k <> max;
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    b[i].fam := RandomFam;
    b[i].data := k;
    b[i].data1 := Random(99)+1;
    case nn of
    1:writeln(f1,b[i].fam,' ',b[i].data1,' ',k1,' ',k2,' ',k3);
    2:writeln(f1,b[i].fam,' ',k1,' ',k2,' ',k3,' ',b[i].data1);
    end;
    if k>max then
    begin
      max1 := max;
      max := k;
    end
    else
      if (k > max1) and (k < max) then
        max1 := k;
    if k < min then
      min := k;
  end;
  Close(f1);
  case nn of
  1: begin
  writeln(f2,min);
  for i := 1 to n do
    if (b[i].data = min) then
      writeln(f2,b[i].fam,' ',b[i].data1);
  end;
  2: begin
  writeln(f2,max,' ',max1);
  for i := 1 to n do
    if (b[i].data = max)or(b[i].data = max1) then
      writeln(f2,b[i].fam,' ',b[i].data);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC27b(nn: integer);
var f1,f2: text;
    s: string;
    i,n,k1,k2,k3,k,max,max1,min: integer;
    a: array[1..15] of integer;
    b: array[1..100] of pupil;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�������> <��������> <�����> <����� �����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);

case nn of
2: begin
TaskText('������� ���������� ���� �� ����� ����� ��������. ���������� ��� ����������',0,0);
TaskText('��������� ����� � ������� ��� ����� �� ����� ������ � ������� ��������',0,0);
TaskText('(�������, ��� � �������� ������ ������ ������������ �������� � ����������',0,0);
TaskText('���������� �������). ����� ������� �������� ��� ���� ��������, ����������',0,0);
TaskText('���� �� ���� ���������� ��������� ������ (��� ������� ��������� ���������',0,0);
TaskText('�������, �������� � ��������� ����). �������� � ������ �������� ��������',0,0);
TaskText('�� ��������� ������ � ����������� � ������� �� ���������� � �������� ������.',0,0);
end;
end;
  for i := 1 to 15 do
    a[i] := Random(271)+20;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  max := -1;
  max1 := -1;
  min := 1000;
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    if (i = n) and (max1 = -1) then
      repeat
        k := a[Random(15)+1];
      until k <> max;
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    b[i].fam := RandomFam;
    b[i].data := k;
    b[i].data1 := Random(99)+1;
    case nn of
    1:writeln(f1,b[i].fam,' ',b[i].data1,' ',k1,' ',k2,' ',k3);
    2:writeln(f1,b[i].fam,' ',k1,' ',k2,' ',k3,' ',b[i].data1);
    end;
    if k>max then
    begin
      max1 := max;
      max := k;
    end
    else
      if (k > max1) and (k < max) then
        max1 := k;
    if k < min then
      min := k;
  end;
  Close(f1);
  case nn of
  1: begin
  writeln(f2,min);
  for i := 1 to n do
    if (b[i].data = min) then
      writeln(f2,b[i].fam,' ',b[i].data1);
  end;
  2: begin
  writeln(f2,max,' ',max1);
  for i := 1 to n do
    if (b[i].data = max)or(b[i].data = max1) then
      writeln(f2,b[i].fam,' ',b[i].data);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC28(nn: integer);
var f1,f2: text;
    s,pup: string;
    b1,b2,i,n,k1,k2,k3,k,m: integer;
    a,a1,a2: array[1..15] of integer;
    b: array[1..100] of pupil;
    mm: array[1..99] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�����> <�������> <��������> <����� �����>\m\)',0,4);
2:TaskText('\(\M<����� �����> <�������> <��������> <�����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ �����',0,0);

case nn of
1: begin
TaskText('������� �������� �� ��������, ��������� ���������� ���� �� �����������',0,0);
TaskText('����� �������� ���� �����. ���� ����� �������� ���������, �� ������� ��������',0,0);
TaskText('� ������ �������� � ������� �� ���������� � �������� ������. ��������',0,0);
TaskText('� ������ �������� �������� �� ��������� ������, �������� ����� �����, �������',0,0);
TaskText('���������, ��� �������� � ���� �� �����������.',0,0);
TaskText('������ ������������� �� ����������� ������ �����.',0,0);
end;
2: begin

TaskText('������� �������� �� ��������, ��������� ���������� ��������� ���� �����',0,0);
TaskText('�������� ���� �����. ���� ����� �������� ���������, �� ������� ��������',0,0);
TaskText('� ������ �������� � ���������� ������� �� ������� � ���������. ��������',0,0);
TaskText('� ������ �������� �������� �� ��������� ������, �������� ����� �����,',0,0);
TaskText('��������� ����, ������� ��������� � ��� ��������.',0,0);
TaskText('������ ������������� �� �������� ������ �����.',0,0);

end;
end;
(*==*)
  case nn of
  1:
  for i := 1 to 99 do
    mm[i] := -1;
  2:
  for i := 1 to 99 do
    mm[i] := 1000;
  end;
  b1 := 2+Random(15);
  b2 := 84+Random(15);
  for i := 1 to 15 do
  begin
    a2[i] := Random(b2-b1+1)+b1;
    a[i] := 20+a2[i]+Random(161 - a2[i]);
    a1[i] := Random(99)+1;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    m := Random(15)+1;
    k := a[m];
    k3 := a2[m];
    repeat
    k1 := Random(101);
    k2 := k - k1 - k3;
    until (k2 >= 0) and (k2 <= 100);
    pup := RandomFam;
    m := a1[Random(15)+1];
    case nn of
    1:writeln(f1,k1,' ',k2,' ',k3,' ',pup,' ',m);
    2:writeln(f1,m,' ',pup,' ',k1,' ',k2,' ',k3);
    end;
    case nn of
    1:
    if k3>mm[m] then
    begin
      mm[m] := k3;
      b[m].fam := pup;
      b[m].data := k3;
    end;
    2:
    if k<mm[m] then
    begin
      mm[m] := k;
      b[m].fam := pup;
      b[m].data := k;
    end
    else
    if (k=mm[m]) and (pup < b[m].fam) then
    begin
      mm[m] := k;
      b[m].fam := pup;
      b[m].data := k;
    end
    end;
  end;
  Close(f1);
    case nn of
    1: for i := 1 to 99 do
         if mm[i]>-1 then
           writeln(f2,i,' ',b[i].fam,' ',b[i].data);
    2: for i := 99 downto 1 do
         if mm[i]<1000 then
           writeln(f2,i,' ',b[i].data,' ',b[i].fam);
    end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC29(nn: integer);
var f1,f2: text;
    s,pup: string;
    i,n,k1,k2,k3,k,m,mm: integer;
    a,a1: array[1..15] of integer;
    b: array[1..100] of school;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<����� �����> <�����> <�������> <��������>\m\)',0,4);
2:TaskText('\(\M<�������> <��������> <����� �����> <�����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ �����',0,0);

case nn of
1: begin

TaskText('� ������� �������� ���������� ���������� ��������, ��������� �� �����',0,0);
TaskText('50 ������ �� ����� �������� (������� ��������� ����� �����, ����� ��� ����� \=',0,0);
TaskText('���������� �������� ���� �����, ��������� ��������� ����� ������',0,0);
TaskText('�� ����������, �������� ����� � �����������; ��������� �� ����� ����� ����',0,0);
TaskText('����� 0). �������� � ������ ����� �������� �� ����� ������',0,0);
TaskText('� ������������� �� ����������� ������ �����.',0,0);

end;
2: begin

TaskText('���������� ���������� ��������, ��������� ���� ������� ��������� 150 ������',0,0);
TaskText('(������� ��������� ���������� ��������, ��������� � ����� ����� 150 ������,',0,0);
TaskText('����� ����� �����; ���������� �������� ����� ���� ����� 0). �������� � ������',0,0);
TaskText('����� �������� �� ����� ������ � ������������� �� �������� ����������',0,0);
TaskText('��������, � ��� ����������� ���������� \= �� ����������� ������ �����.',0,0);


end;
end;
(*==*)
  for i := 1 to 99 do
  begin
    b[i].num := 0;
    b[i].data1 := 0;
    b[i].data2 := 0;
    b[i].data3 := 0;
  end;
  for i := 1 to 15 do
  begin
    a[i] := Random(271)+20;
    a1[i] := Random(99)+1;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    pup := RandomFam;
    m := a1[Random(15)+1];

    case nn of
    1:writeln(f1,m,' ',k1,' ',k2,' ',k3, ' ',pup);
    2:writeln(f1,pup,' ',m,' ',k1,' ',k2,' ',k3);
    end;
    b[m].data1 := 1;
    case nn of
    1:
    if k1 >= 50 then
    Inc(b[m].num);
    2:
    if k1+k2+k3 > 150 then
    Inc(b[m].num);
    end;
    if k2 >= 50 then
    Inc(b[m].data2);
    if k3 >= 50 then
    Inc(b[m].data3);
  end;
  Close(f1);
  case nn of
  1:
  for i := 1 to 99 do
    if b[i].data1 = 1 then
      writeln(f2,i,' ',b[i].num,' ',Round(b[i].data2),' ',b[i].data3);
  2:
  begin
    for i := 1 to 99 do
      if b[i].data1 <> 1 then
        b[i].num := -1;
     while true do
     begin
       mm := -1;
       for i := 1 to 99 do
         if b[i].num > mm then
         begin
           mm := b[i].num;
           k := i;
         end;
       if mm = -1 then break;
       writeln(f2,mm,' ',k);
       b[k].num := -1;
     end;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC30a(nn: integer);
var f1,f2: text;
    s,pup: string;
    sc: school;
    i,n,k1,k2,k3,k,m: integer;
    a,a1: array[1..15] of integer;
    b: array[1..100] of school;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�������> <��������> <�����> <����� �����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ �����',0,0);

case nn of
1: begin
TaskText('� ������� �������� ����� ������� �������� �����, ���������� ���������',0,0);
TaskText('���� ����� (������� �������� �������� ����� ������ \= �����������',0,0);
TaskText('\I������� ������\i ����� ������ ���� �������� �� ���������� ��������).',0,0);
TaskText('�������� � ������ ����� �������� �� ��������� ������, �������� ����� �����',0,0);
TaskText('� ������� ����� �� ����������, �������� ����� � �����������.',0,0);
TaskText('������ ������������� �� �������� ������ �����.',0,0);
end;
end;
(*==*)
  for i := 1 to 99 do
  begin
    b[i].num := 0;
    b[i].num1 := 0;
    b[i].num2 := 0;
    b[i].data1 := 0;
    b[i].data2 := 0;
    b[i].data3 := 0;
  end;
  for i := 1 to 15 do
  begin
    a[i] := Random(271)+20;
    a1[i] := Random(99)+1;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    pup := RandomFam;
    m := a1[Random(15)+1];
    case nn of
    1:writeln(f1,pup,' ',k1,' ',k2,' ',k3,' ',m);
    2:writeln(f1,k1,' ',k2,' ',k3,' ',m,' ',pup);
    end;
    b[m].num := m;
    b[m].num1 := b[m].num1+k;
    b[m].data1 := b[m].data1+k1;
    b[m].num2 := b[m].num2+k2;
    b[m].data3 := b[m].data3+k3;
    Inc(b[m].data2);
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 99 downto 1 do
    if b[i].data2 <> 0 then
      writeln(f2,i,' ',Round(b[i].data1) div b[i].data2,' ',
      b[i].num2 div b[i].data2,' ',
      b[i].data3 div b[i].data2);
  end;
  2: begin
  for i := 1 to 99 do
    if b[i].data2 <> 0 then
      b[i].num1 := b[i].num1 div b[i].data2;
  for k := 1 to 98 do
    for i := 1 to 99-k do
      if b[i].num1 < b[i+1].num1 then
      begin
        sc := b[i];
        b[i] := b[i+1];
        b[i+1] := sc;
      end;
  for i := 1 to 99 do
    if b[i].data2 > 0 then
      writeln(f2,b[i].num1,' ',b[i].num);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC30b(nn: integer);
var f1,f2: text;
    s,pup: string;
    sc: school;
    i,n,k1,k2,k3,k,m: integer;
    a,a1: array[1..15] of integer;
    b: array[1..100] of school;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�����> <����� �����> <�������> <��������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ �����',0,0);

case nn of
2: begin

TaskText('����� ������� �������� ���������� �����, ���������� ��������� ���� �����',0,0);
TaskText('(������� �������� �������� ����� ������ \= ����������� \I������� ������\i �����',0,0);
TaskText('������ ���� �������� �� ���������� ��������). �������� � ������ ����� ��������',0,0);
TaskText('�� ��������� ������, �������� ������� ��������� ���� � ����� �����. ������',0,0);
TaskText('������������� �� �������� �������� �����, � ��� ������ ���������',0,0);
TaskText('�������� ����� \= �� ����������� ������ �����.',0,0);

end;
end;
  for i := 1 to 99 do
  begin
    b[i].num := 0;
    b[i].num1 := 0;
    b[i].num2 := 0;
    b[i].data1 := 0;
    b[i].data2 := 0;
    b[i].data3 := 0;
  end;
  for i := 1 to 15 do
  begin
    a[i] := Random(271)+20;
    a1[i] := Random(99)+1;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 10 + Random(10);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    pup := RandomFam;
    m := a1[Random(15)+1];
    case nn of
    1:writeln(f1,pup,' ',k1,' ',k2,' ',k3,' ',m);
    2:writeln(f1,k1,' ',k2,' ',k3,' ',m,' ',pup);
    end;
    b[m].num := m;
    b[m].num1 := b[m].num1+k;
    b[m].data1 := b[m].data1+k1;
    b[m].num2 := b[m].num2+k2;
    b[m].data3 := b[m].data3+k3;
    Inc(b[m].data2);
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 99 downto 1 do
    if b[i].data2 <> 0 then
      writeln(f2,i,' ',Round(b[i].data1) div b[i].data2,' ',
      b[i].num2 div b[i].data2,' ',
      b[i].data3 div b[i].data2);
  end;
  2: begin
  for i := 1 to 99 do
    if b[i].data2 <> 0 then
      b[i].num1 := b[i].num1 div b[i].data2;
  for k := 1 to 98 do
    for i := 1 to 99-k do
      if b[i].num1 < b[i+1].num1 then
      begin
        sc := b[i];
        b[i] := b[i+1];
        b[i+1] := sc;
      end;
  for i := 1 to 99 do
    if b[i].data2 > 0 then
      writeln(f2,b[i].num1,' ',b[i].num);
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC31(nn: integer);
var f1,f2: text;
    s,pup: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k3,k,sc,nss: integer;
    a: array[1..15] of integer;
    a1: array[1..50] of string;
    b: array[1..100] of pupil;
    ss: array[1..10] of integer;
    sch, sch1, sch2: array[1..100] of string;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<����� �����> <�������> <��������> <�����>\m\)',0,4);
2:TaskText('\(\M<�����> <�������> <��������> <����� �����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
case nn of
1: begin

TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ ����� �������',0,0);
TaskText('������� � �������� ���� ������ �������� (� ���������� �������), ���������',0,0);
TaskText('����� 50 ������ �� ������� �������� (������� ��������� ����� �����, �����',0,0);
TaskText('������� � ��������). �������� � ������ �������� �������� �� ��������� ������',0,0);
TaskText('� ������������� �� ����������� ������ �����, � ��� ����������� ������� \=',0,0);
TaskText('� ���������� ������� ������� � ���������. ���� ��� ��������� ����� �������',0,0);
TaskText('����� ���� ��������, ��������������� ��������� ��������, �� ������� ��������',0,0);
TaskText('��� ���� ����� ��������. ���� � �������� ������ ��� �� ������ ���������,',0,0);
TaskText('���������������� ��������� ��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);

end;
2: begin
TaskText('������� ���������� ���� �� ����� ����� ��������. ������� �������� �� ��������,',0,0);
TaskText('��������� �� ����� 50~������ �� ������� �������� (������� ��������� �������',0,0);
TaskText('� ��������, ����� ����� ����� � ��������� ���� �� ���� ���������).',0,0);
TaskText('�������� � ������ �������� �������� �� ��������� ������ � ���������� �������',0,0);
TaskText('������� � ���������, � ��� �� ���������� \= � ������� ���������� ��������',0,0);
TaskText('� ������ �������� ������. ���� �� ���� �� �������� �� �������������',0,0);
TaskText('��������� ��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);
end;
end;
(*==*)
  for i := 1 to 100 do
  begin
    b[i].data := 0;
    b[i].data1 := 0;
    sch[i] := '���';
    sch1[i] := '���';
    sch2[i] := '���';
  end;
  for i := 1 to 15 do
  begin
    a[i] := Random(271)+20;
  end;
  for i := 1 to 50 do
  begin
    a1[i] := RandomFam;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then
  begin
    n := 50 + Random(50);
    nss := 5 + Random(6);
  end
  else
  begin
    n := 5 + Random(5);
    nss := 2 + Random(2);
  end;
//  writeln(f1,n);
  for i := 1 to nss div 2 do
    ss[i] := Random(9)+1;
  for i := nss div 2 + 1 to nss do
    ss[i] := Random(90)+10;
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100);
    case nn of
    1:
    begin
    sc := ss[Random(nss)+1];
    pup := RandomFam;
    end;
    2:
    begin
    sc := Random(99)+1;
    pup := a1[Random(50)+1];
    end;
    end;
    case nn of
    1:writeln(f1,sc,' ',pup,' ',k1,' ',k2,' ',k3);
    2:writeln(f1,k1,' ',k2,' ',k3, ' ',pup,' ',sc);
    end;
    case nn of
    1: bool := (k1<50)and(k2<50)and(k3<50);
    2: bool := (k1>=50)and(k2>=50)and(k3>=50);
    end;
    if bool then
    case nn of
    1:
    begin
      if pup <= sch[sc] then
      begin
        sch2[sc] := sch1[sc];
        sch1[sc] := sch[sc];
        sch[sc] := pup;
      end
      else
      if pup <= sch1[sc] then
      begin
        sch2[sc] := sch1[sc];
        sch1[sc] := pup;
      end
      else
      if pup <= sch2[sc] then
      begin
        sch2[sc] := pup;
      end;
    end;
    2: begin
    b[i].fam := pup;
    b[i].data := k;
    b[i].data1 := sc;
    end;
  end;
  end;
  Close(f1);
  bool := true;
  case nn of
  1:
     for k := 1 to 99 do
     begin
       if sch[k] < '���' then
       begin
         bool := false;
         writeln(f2,k,' ',sch[k]);
       end;
       if sch1[k] < '���' then
       begin
         bool := false;
         writeln(f2,k,' ',sch1[k]);
       end;
       if sch2[k] < '���' then
       begin
         bool := false;
         writeln(f2,k,' ',sch2[k]);
       end;
     end;
  2: begin
  for k := 1 to 99 do
    for i := 1 to 100-k do
      if b[i].fam > b[i+1].fam then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to 100 do
    if b[i].fam <> '' then
    begin
      bool := false;
      writeln(f2,b[i].fam,' ',b[i].data1,' ',b[i].data);
    end;
  end;
  end;
  if bool then
      writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC32(nn: integer);
var f1,f2: text;
    s,pup: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k3,k,sc,r: integer;
    a: array[1..15] of integer;
    a1: array[1..25] of integer;
    a2: array[1..25] of string;
    b: array[1..100] of pupil;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�������> <��������> <����� �����> <�����>\m\)',0,4);
2:TaskText('\(\M<�������> <��������> <�����> <����� �����>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100. ����� ����� �������� �� ����� ����',0,5);
TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
case nn of
1: begin
TaskText('������� ���������� ���� �� ����� ����� ��������. ������� �������� �� ��������,',0,0);
TaskText('��������� ����� 10~������ ���� �� �� ������ �� ��������� (������� ���������',0,0);
TaskText('����� �����, ����� ������� � ��������). �������� � ������ �������� ��������',0,0);
TaskText('�� ��������� ������ � ����������� �� �������� ������ �����, � ��� �����������',0,0);
TaskText('������� \= � ���������� ������� ������� � ���������. ���� �� ���� �� ��������',0,0);
TaskText('�� ������������� ��������� ��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);
end;
2: begin
TaskText('������� ���������� ���� �� ����� ����� ��������. ������� �������� �� ��������,',0,0);
TaskText('��������� ����� 90~������ ���� �� �� ������ �� ��������� (������� ���������',0,0);
TaskText('������� � ��������, ����� ����� �����). �������� � ������ �������� ��������',0,0);
TaskText('�� ��������� ������ � ����������� � ���������� ������� ������� � ���������,',0,0);
TaskText('� ��� �� ���������� \= �� ����������� ������ �����. ���� �� ���� �� ��������',0,0);
TaskText('�� ������������� ��������� ��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);
end;
end;
(*==*)
  for i := 1 to 100 do
    b[i].data := 0;
  for i := 1 to 15 do
  begin
    a[i] := Random(201)+60;
  end;
  for i := 1 to 25 do
  begin
    a1[i] := Random(99)+1;
    a2[i] := RandomFam;
  end;

  s := DefDataStart(f1,f2);
  if Random(2)=0 then n := 50 + Random(50)
  else
    n := 5 + Random(5);
//  writeln(f1,n);
  r := Random(6);
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100) and ((r <> 5) or (nn=1) and (k1>=10) and (k2>=10) and (k3>=10)
       or (nn=2) and (k1<=90) and (k2<=90) and (k3<=90));
    pup := a2[Random(25)+1] ;
    sc := a1[Random(25)+1];

    case nn of
    1:writeln(f1,pup,' ',sc,' ',k1,' ',k2,' ',k3);
    2:writeln(f1,pup,' ',k1,' ',k2,' ',k3,' ',sc);
    end;
    case nn of
    1: bool := (k1<10)or(k2<10)or(k3<10);
    2: bool := (k1>90)or(k2>90)or(k3>90);
    end;
    if bool then
    begin
    b[i].fam := pup;
    b[i].data1 := sc;
    end;
  end;
  Close(f1);
  bool := true;
  case nn of
  1: begin
  for k := 1 to 99 do
    for i := 1 to 100-k do
      if (b[i].data1 < b[i+1].data1) or
         (b[i].data1 = b[i+1].data1)and(b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to 100 do
    if b[i].fam <> '' then
    begin
      bool := false;
      writeln(f2,b[i].data1,' ',b[i].fam);
    end;
  end;
  2: begin
  for k := 1 to 99 do
    for i := 1 to 100-k do
      if (b[i].fam > b[i+1].fam) or
         (b[i].fam = b[i+1].fam)and(b[i].data1 > b[i+1].data1) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to 100 do
    if b[i].fam <> '' then
    begin
      bool := false;
      writeln(f2,b[i].fam,' ',b[i].data1);
    end;
  end;
  end;
  if bool then
      writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;



procedure ExamC32a;

var f1,f2: text;
    s,pup: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k3,k,sc,nss,kk,r: integer;
    a: array[1..15] of integer;
    a1: array[1..70] of string;
    b: array[1..100] of pupil;
    ss: array[1..10] of integer;
    sch, sch1, sch2: array[1..100] of string;

begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� � ����������� ����� ���������',0,1);
  TaskText('��������� �� ����������, �������� ����� � ����������� (� ��������� �������).',0,2);
  TaskText('������ ������� ������������������ �������� ��������� ����:',0,3);
  TaskText('\(\M<�������> <��������> <����� �����> <�����>\m\)',0,4);
  TaskText('����� ������������ ����� ��� ����� ����� � ��������� ��~0 ��~100,',0,5);
TaskText('������� ���������� ���� �� ����� ����� ��������. ��� ������ ����� ����� ����',0,0);
TaskText('������ �������� (� ���������� �������), ��������� ����� 50 ������ ���� ��',0,0);
TaskText('�� ������ �� ���������, � ������� �� �������, �������� � ����� �����. ��������',0,0);
TaskText('� ������ �������� �������� �� ��������� ������ � ������������� � ����������',0,0);
TaskText('������� ������� � ���������, � ��� �� ���������� \= �� ����������� ������',0,0);
TaskText('�����. ���� ��� ��������� ����� ������� ����� ���� ��������, ���������������',0,0);
TaskText('��������� ��������, �� ������� �������� ��� ���� ����� ��������. ����',0,0);
TaskText('� �������� ������ ��� �� ������ ���������, ���������������� ���������',0,0);
TaskText('��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);

(*==*)
  for i := 1 to 100 do
  begin
    b[i].data := 0;
    b[i].data1 := 0;
    sch[i] := '���';
    sch1[i] := '���';
    sch2[i] := '���';
  end;
  r := Random(6);
  for i := 1 to 15 do
  begin
    if r <> 5 then
    a[i] := Random(271)+20
    else
    a[i] := Random(80)+200;
  end;
  for i := 1 to 70 do
  begin
    a1[i] := RandomFam;
  end;
  s := DefDataStart(f1,f2);
  if Random(2)=0 then
  begin
    n := 50 + Random(50);
    nss := 5 + Random(6);
  end
  else
  begin
    n := 5 + Random(5);
    nss := 2 + Random(2);
  end;
//  writeln(f1,n);
  for i := 1 to nss div 2 do
    ss[i] := Random(9)+1;
  for i := nss div 2 + 1 to nss do
    ss[i] := Random(90)+10;
  for i := 1 to n do
  begin
    k := a[Random(15)+1];
    repeat
    k1 := Random(101);
    k2 := Random(101);
    k3 := k - k1 - k2;
    until (k3 >= 0) and (k3 <= 100) and ((r <> 5) or (k1>=50) and (k2>=50) and (k3>=50));


    sc := ss[Random(nss)+1];
    pup := a1[Random(70)+1];

    writeln(f1,pup,' ',sc,' ',k1,' ',k2,' ',k3);

    bool := (k1<50)or(k2<50)or(k3<50);
    if bool then

      if pup <= sch[sc] then
      begin
        sch2[sc] := sch1[sc];
        sch1[sc] := sch[sc];
        sch[sc] := pup;
      end
      else
      if pup <= sch1[sc] then
      begin
        sch2[sc] := sch1[sc];
        sch1[sc] := pup;
      end
      else
      if pup <= sch2[sc] then
      begin
        sch2[sc] := pup;
      end;
  end;
  Close(f1);
  bool := true;
  kk := 0;


     for k := 1 to 99 do
     begin
       if sch[k] < '���' then
       begin
         kk := kk + 1;
         b[kk].fam := sch[k];
         b[kk].data := k;
       end;
       if sch1[k] < '���' then
       begin
         kk := kk + 1;
         b[kk].fam := sch1[k];
         b[kk].data := k;
       end;
       if sch2[k] < '���' then
       begin
         kk := kk + 1;
         b[kk].fam := sch2[k];
         b[kk].data := k;
       end;
     end;
  if kk=0 then
      writeln(f2,'Students not found')
  else
  begin
    for k := 1 to kk -1 do
      for i := 1 to kk - k do
        if (b[i].fam > b[i+1].fam) or
          (b[i].fam = b[i+1].fam) and (b[i].data > b[i+1].data) then
        begin
          pp := b[i];
          b[i] := b[i+1];
          b[i+1] := pp;
        end;
    for i := 1 to kk do
      writeln(f2,b[i].fam,' ',b[i].data);

  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;




procedure ExamC33a(nn: integer);  //1
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m: integer;
    b: array[1..30] of pupil;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);

case nn of
1:TaskText('\(\M<�������> <��������> <�����> <�������� ��������> <������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
TaskText('�������� ����������� � ��������� �����. ��� ������� ��������� ����������',0,0);

case nn of
1: begin
TaskText('������� ������ �� ������� �������� � ������� �� � ����� �������� ������� (����',0,0);
TaskText('�� ������-���� �������� �������� �� ������� �� ����� ������, �� ������� ���',0,0);
TaskText('����� �������� 0.00). �������� � ������ �������� �������� �� ���������',0,0);
TaskText('������, �������� �������, �������� � ������� ������ �� �������, ���������',0,0);
TaskText('� ������. ������ ����������� � ���������� ������� ������� � ���������.',0,0);
end;
end;
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    data1 := 0;
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(14) of
    0..1: k1 := 2;
    2..6: k1 := 3;
    7..10: k1 := 4;
    else k1 := 5;
    end;
    case nn of
    1:writeln(f1,pp.fam,' ',pp.data,' ',subj[k],' ',k1);
    2:writeln(f1,pp.data,' ',pp.fam,' ',k1,' ',subj[k]);
    end;
    with b[k2] do
    begin
      d[k] := d[k]+k1;
      inc(c[k]);
      data1 := 1;
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if b[i].fam > b[i+1].fam then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
  if data1 = 1 then
  begin
    write(f2,fam);
    for k := 1 to 3 do
      if c[k] <> 0 then
      write(f2,' ',d[k]/c[k]:0:2)
    else
      write(f2,' ',0.0:0:2);
    writeln(f2);
  end;
  end;
  2: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data > b[i+1].data) or (b[i].data = b[i+1].data)and(b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
  if data1 = 1 then
  begin
    write(f2,data,' ',fam);
    for k := 1 to 3 do
      write(f2,' ',c[k]);
    writeln(f2);
  end;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC33b(nn: integer);  //1
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m: integer;
    b: array[1..30] of pupil;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�����> <�������> <��������> <������> <�������� ��������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
TaskText('�������� ����������� � ��������� �����. ��� ������� ��������� ����������',0,0);

case nn of
2: begin
TaskText('���������� ������ �� ������� �������� (���� �� ������-���� �������� ��������',0,0);
TaskText('�� ������� �� ����� ������, �� ������� ��� ����� �������� ����� 0). ',0,0);
TaskText('�������� � ������ �������� �������� �� ��������� ������, �������� �����,',0,0);
TaskText('�������, �������� � ���������� ������ �� �������, ��������� � ������.',0,0);
TaskText('������ ����������� � ������� ����������� ������ ������, � ��� ����������',0,0);
TaskText('������� \= � ���������� ������� ������� � ���������.',0,0);
end;
end;
(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    data1 := 0;
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(14) of
    0..1: k1 := 2;
    2..6: k1 := 3;
    7..10: k1 := 4;
    else k1 := 5;
    end;
    case nn of
    1:writeln(f1,pp.fam,' ',pp.data,' ',subj[k],' ',k1);
    2:writeln(f1,pp.data,' ',pp.fam,' ',k1,' ',subj[k]);
    end;
    with b[k2] do
    begin
      d[k] := d[k]+k1;
      inc(c[k]);
      data1 := 1;
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if b[i].fam > b[i+1].fam then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
  if data1 = 1 then
  begin
    write(f2,fam);
    for k := 1 to 3 do
      if c[k] <> 0 then
      write(f2,' ',d[k]/c[k]:0:2)
    else
      write(f2,' ',0.0:0:2);
    writeln(f2);
  end;
  end;
  2: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data > b[i+1].data) or (b[i].data = b[i+1].data)and(b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
  if data1 = 1 then
  begin
    write(f2,data,' ',fam);
    for k := 1 to 3 do
      write(f2,' ',c[k]);
    writeln(f2);
  end;
  end;
  end;
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC34;              //2
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m: integer;
    b: array[1..30] of pupil;
    a,max: array[7..11] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
TaskText('\(\M<�������� ��������> <�������> <��������> <�����> <������>\m\)',0,4);
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
TaskText('�������� ����������� � ��������� �����. ������� �������� �� ��������, �������',0,0);
TaskText('�� ������� ������� ������ �� ����� 4: �������, ��������, ����� ������',0,0);

TaskText('� ������� ������ �� ������� (��������� � ����� �������� �������).',0,0);
TaskText('��� ��������, �� ������� �� ����� ������ �� �������, ������� ������� ������',0,0);
TaskText('������ 0.00. �������� � ������ �������� �������� �� ��������� ������',0,0);
TaskText('� ����������� � ���������� ������� �� ������� � ���������. ���� �� ����',0,0);
TaskText('�� �������� �� ������������� ��������� ��������, �� ��������',0,0);
TaskText('� �������������� ���� ����� \<Students not found\>.',0,0);

(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
    begin
      a[i] := 0;
      max[i] := 0;
    end;
  s := DefDataStart(f1,f2);
  m := Random(16)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(14) of
    0..1: k1 := 2;
    2..6,11: k1 := 3;
    7..10: k1 := 4;
    else k1 := 5;
    end;
    writeln(f1,subj[k],' ',pp.fam,' ',pp.data,' ',k1);
    with b[k2] do
    begin
      d[k] := d[k]+k1;
      inc(c[k]);
    end;
  end;
  Close(f1);
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].fam > b[i+1].fam )then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  bool := true;
  for i := 1 to m do
  with b[i] do
  if (c[1]=0) and (c[2]+c[3]>0) then   //���������� ������ (26.08.2014) (��������� ������ �������)
  begin
    bool := false;
    writeln(f2,fam,' ',data, ' ',0.0:0:2);
  end
  else
  if (c[1]>0) and (d[1]/c[1]<=4.0) then   //���������� ������ (26.08.2014) (��������� ������ �������)
  begin
    bool := false;
    writeln(f2,fam,' ',data, ' ',d[1]/c[1]:0:2);
  end;
  if bool then
    writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;




procedure ExamC35;     //3
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m,kk: integer;
    b: array[1..30] of pupil;
    a,max: array[7..11] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
TaskText('\(\M<�����> <�������> <��������> <�������� ��������> <������>\m\)',0,4);
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
TaskText('�������� ����������� � ��������� �����. ������� �������� �� ��������, �������',0,0);
TaskText('�� ������ ������� ������ �� ����� 4: ����� ������, �������, ��������',0,0);
TaskText('� ������� ������ �� ������ (��������� � ����� �������� �������). ��������',0,0);
TaskText('� ������ �������� �������� �� ��������� ������ � ����������� � �������',0,0);
TaskText('����������� �������, � ��� ���������� ������� \= � ���������� ������� �������',0,0);
TaskText('� ���������. ���� �� ���� �� �������� �� ������������� ��������� ��������,',0,0);
TaskText('�� �������� � �������������� ���� ����� \<Students not found\>.',0,0);
(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
    begin
      a[i] := 0;
      max[i] := 0;
    end;
  s := DefDataStart(f1,f2);
  m := Random(16)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
  kk := Random(4);
//  writeln(f1,n);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(14) of
    0..1: k1 := 2;
    2..6,11: k1 := 3;
    7..10: begin if kk = 0 then k1 := 3
               else k1 := 4;
           end;
    else begin if kk = 0 then k1 := 3
               else k1 := 5;
         end;
    end;

    writeln(f1,pp.data,' ',pp.fam,' ',subj[k],' ',k1);
    with b[k2] do
    begin
      d[k] := d[k]+k1;
      inc(c[k]);
    end;
  end;
  Close(f1);
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data > b[i+1].data) or
        (b[i].data = b[i+1].data) and (b[i].fam > b[i+1].fam )then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  bool := true;
  for i := 1 to m do
  with b[i] do
  if (c[3]>0) and (d[3]/c[3]>=4) then
  begin
    bool := false;
    writeln(f2,data, ' ',fam,' ',d[3]/c[3]:0:2);
  end;
  if bool then
    writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

procedure ExamC36(nn: integer);        //4
var f1,f2: text;
    s,ss: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m,kk,kk1,mm: integer;
    b: array[1..30] of pupil;
    a: array[7..11] of integer;
    a1: array[7..11] of boolean;
begin
  CreateTask(Topic);
  TaskText('���� ������ {S} \= �������� ������ �� ���� ���������: �������, ���������',0,1);
  TaskText('��� ������. �������� ������������������ �������� �������� �� �������',0,2);
  TaskText('�������� �� ���� ���� ���������. ������ ������� ������������������',0,3);
  TaskText('�������� ������ �� ����� ������ � �������� ��������� ����:',0,4);

case nn of
1:TaskText('\(\M<�������> <��������> <�������� ��������> <������> <�����>\m\)',0,5);
2:TaskText('\(\M<�������� ��������> <�������> <��������> <������> <�����>\m\)',0,5);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,0);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
TaskText('�������� ����������� � ��������� �����. ��� ������� ������, ���������������',0,0);
TaskText('� ������ �������� ������, ���������� ����� ��������, ������� �� ��������~{S}',0,0);
case nn of
1: begin
TaskText('������� ������ �� ����� 3.5 ��� �� ������� �� ����� ������ �� ����� ��������.',0,0);
TaskText('�������� � ������ ������ �������� �� ��������� ������, �������� �����',0,0);
TaskText('��������� �������� (����� ����� ���� ����� 0) � ����� ������.',0,0);
TaskText('������ ������������� �� ����������� ����� ��������, � ��� �����������',0,0);
TaskText('����� \= �� �������� ������ ������.',0,0);
end;
2: begin
TaskText('������� ������ �� ����� 3.5 � ��� ���� �� ���������� �� ����� ������ �� �����',0,0);
TaskText('��������. �������� � ������ ������ �������� �� ��������� ������, ��������',0,0);
TaskText('����� ������ � ����� ��������� �������� (����� ����� ���� ����� 0). ������',0,0);
TaskText('������������� �� ����������� ������ ������.',0,0);
end;
end;
(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    data1 := 0;
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
  begin
      a[i] := 0;
      a1[i] := false;
  end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  kk1 := 6;
  if Random(2)=0 then
  begin
    n := m*2+Random(20);
    kk1 := Random(6)+6;
  end
  else
    n := m*6+Random(50);
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    repeat
      data := Random(5)+7;
    until kk1 <> data;
  end;
  kk := Random(3)+1;
  ss := Subj[kk];                  //2013
//  writeln(f1,Subj[kk]{,' ',n});  //2013
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(14) of
    0..1: k1 := 2;
    2..6: k1 := 3;
    7..10,11: k1 := 4;
    else k1 := 5;
    end;
    case nn of
    1:writeln(f1,pp.fam,' ',subj[k],' ',k1,' ',pp.data);
    2:writeln(f1,subj[k],' ',pp.fam,' ',k1,' ',pp.data);
    end;
    with b[k2] do
    begin
      d[k] := d[k]+k1;
      inc(c[k]);
      case nn of
      1: data1 := 1;
      2: if (k = kk) and (k1=2) then
           data1 := 1;
      end;
      a1[data] := true; //��������� 2013.04.30 (���������� ������)
    end;
  end;
  Close(f1);
  case nn of
  1: begin
  for i := 1 to m do
  with b[i] do
  begin
//    a1[data] := true; //���������������� 2013.04.30 (���������� ������)
    if (data1 = 1) and ((c[kk]=0) or (d[kk]/c[kk]<=3.5)) then
    begin
      a[data] := a[data]+ 1;
    end;
  end;
  for i := 7 to 11 do
    if not a1[i] then
      a[i] := 1000;
  while true do
  begin
    mm := 1000;
    for i := 11 downto 7 do
      if a[i] < mm then
      begin
        mm := a[i];
        kk := i;
      end;
    if mm = 1000 then break;
    writeln(f2,mm,' ',kk);
    a[kk] := 1000;
  end;
  end;
  2: begin
  for i := 1 to m do
  with b[i] do
  begin
//    a1[data] := true; //���������������� 2013.04.30 (���������� ������)
    if (c[kk]>0) and (d[kk]/c[kk]>=3.5) and (data1 = 0) then
      a[data] := a[data]+ 1;
  end;
  for i := 7 to 11 do
    if a1[i] then
      writeln(f2,i, ' ',a[i]);
  end;
  end;
  Close(f2);
  DataS('S = ', ss, 2, 1);
  DefDataEndSpec1(s);
  SetTestCount(9);

end;


procedure ExamC37a(nn: integer);  //5
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m,k3: integer;
    b: array[1..30] of pupil;
    a,max: array[7..11] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�����> <�������� ��������> <�������> <��������> <������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
case nn of
1: begin
TaskText('�������� ����������� � ��������� �����. ����� ���� \I����������\i \= ��������,',0,0);
TaskText('���������� ���� �� ���� ������ �� ������-���� ��������. ������� ��������',0,0);
TaskText('� ������ �� ����������: ����� ������, �������, �������� � ���������� �����',0,0);
TaskText('�����. �������� � ������ ��������� �������� �� ��������� ������ � �����������',0,0);
TaskText('�� �������� �������, � ��� ���������� ������� \= � ���������� ������� �������',0,0);
TaskText('� ���������. ���� � ������ �������� ������ ��� �� ����� ������,',0,0);
TaskText('�� �������� � �������������� ���� ����� \<Students not found\>.',0,0);
end;
end;
(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
    begin
      a[i] := 0;
      max[i] := 0;
    end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  k3 := Random(5);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(18) of
    0..1,15..17: k1 := 2;
    2..6: k1 := 3;
    7..10: k1 := 4;
    else k1 := 5;
    end;
    if k3 = 0 then
      if k1 = 2 then k1 := Random(3)+3;
    case nn of
    1: writeln(f1,pp.data,' ',subj[k],' ',pp.fam,' ',k1);
    2: writeln(f1,pp.data,' ',pp.fam,' ',subj[k],' ',k1);
    end;
    if k1 = 2 then
    with b[k2] do
    begin
      d[1] := d[1]+1;
      if d[1]>max[data] then
        max[data] := d[1];
    end;
  end;
  Close(f1);
  k1 := 0;
  case nn of
  1: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data < b[i+1].data)
      or (b[i].data = b[i+1].data) and (b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if d[1] > 0 then
    begin
      writeln(f2,data,' ',fam,' ',d[1]);
      k1 := k1 + 1;
    end;
  end;
  2: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if b[i].fam > b[i+1].fam then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if (d[1] = max[data]) and (d[1] > 0) then
    begin
      writeln(f2,fam,' ',data,' ',max[data]);
      k1 := k1 + 1;
    end;
  end;
  end;
  if k1 = 0 then
    writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC37b(nn: integer);  //5
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m,k3: integer;
    b: array[1..30] of pupil;
    a,max: array[7..11] of integer;
begin
  CreateTask(Topic);(*DEMO*)
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
case nn of
2:TaskText('\(\M<�����> <�������> <��������> <�������� ��������> <������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);
case nn of
2: begin
TaskText('�������� ����������� � ��������� �����. ��� ������� ������ ����� \I��������\i',0,0);
TaskText('\I����������\i \= ��������, ���������� � ������ ������ ������������ ���������',0,0);
TaskText('����� ����� �� ���� ��������� (����� �� ������ ���� �������). ������� ��������',0,0);
TaskText('� ������ �� �������� ����������: �������, ��������, ����� ������ � ����������',0,0);
TaskText('����� �����. �������� � ������ ��������� �������� �� ��������� ������',0,0);
TaskText('� ����������� � ���������� ������� �� ������� � ��������� (����������',0,0);
TaskText('�� ������� �� ���������). ���� � ������ �������� ������ ��� �� ����� ������,',0,0);
TaskText('�� �������� � �������������� ���� ����� \<Students not found\>.',0,0);
end;
end;
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
    begin
      a[i] := 0;
      max[i] := 0;
    end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  k3 := Random(5);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(18) of
    0..1,15..17: k1 := 2;
    2..6: k1 := 3;
    7..10: k1 := 4;
    else k1 := 5;
    end;
    if k3 = 0 then
      if k1 = 2 then k1 := Random(3)+3;
    case nn of
    1: writeln(f1,pp.data,' ',subj[k],' ',pp.fam,' ',k1);
    2: writeln(f1,pp.data,' ',pp.fam,' ',subj[k],' ',k1);
    end;
    if k1 = 2 then
    with b[k2] do
    begin
      d[1] := d[1]+1;
      if d[1]>max[data] then
        max[data] := d[1];
    end;
  end;
  Close(f1);
  k1 := 0;
  case nn of
  1: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data < b[i+1].data)
      or (b[i].data = b[i+1].data) and (b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if d[1] > 0 then
    begin
      writeln(f2,data,' ',fam,' ',d[1]);
      k1 := k1 + 1;
    end;
  end;
  2: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if b[i].fam > b[i+1].fam then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if (d[1] = max[data]) and (d[1] > 0) then
    begin
      writeln(f2,fam,' ',data,' ',max[data]);
      k1 := k1 + 1;
    end;
  end;
  end;
  if k1 = 0 then
    writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;


procedure ExamC38(nn: integer);           //6
var f1,f2: text;
    s: string;
    pp: pupil;
    bool: boolean;
    i,n,k1,k2,k,m,k3: integer;
    b: array[1..30] of pupil;
    a,max: array[7..11] of integer;
begin
  CreateTask(Topic);
  TaskText('�������� ������������������ �������� �������� �� ������� ��������',0,1);
  TaskText('�� ���� ���������: �������, ��������� � ������. ������ �������',0,2);
  TaskText('������������������ �������� ������ �� ����� ������ � �������� ��������� ����:',0,3);
case nn of
1:TaskText('\(\M<�����> <������> <�������> <��������> <�������� ��������>\m\)',0,4);
2:TaskText('\(\M<������> <�����> <�������> <��������> <�������� ��������>\m\)',0,4);
end;
//2013.05 TaskText('���������� �������� �� �����������~100, ������ ������������� (� �����������',0,5);
//2013.05 TaskText('�������� � ����������) ����� �������� ���. ����� ����������� ����� ������',0,0);
//2013.05 TaskText('� ��������� ��~7 ��~11, ������ \= ����� ������ � ��������� ��~2 ��~5. ��������',0,0);
TaskText('������ ������������� (� ����������� �������� � ����������) ����� �������� ���.',0,5);
TaskText('����� �������� ����� ������, ������ \= ����� ����� � ��������� 2\:5. ��������',0,0);

case nn of
1: begin
TaskText('�������� ����������� � ��������� �����. ����� ���� \I����������\i \= ��������,',0,0);
TaskText('�� ���������� �� ����� ������ � ������, �� ������� ���� �� ���� ��������',0,0);
TaskText('�� ������-���� ��������. ������� �������� � ������ ���������: ����������',0,0);
TaskText('����� ��������, �������, �������� � ����� ������. �������� � ������',0,0);
TaskText('�������� �������� �� ��������� ������ � ����������� �� ����������� ����������',0,0);
TaskText('��������, � ��� �� ��������� \= � ���������� ������� ������� � ���������. ����',0,0);
TaskText('� ������ �������� ������ ��� �� ������ ���������, ���������������� ���������',0,0);
TaskText('��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);
end;

2: begin
TaskText('�������� ����������� � ��������� �����. ��� ������� ������ ����� \I������\i',0,0);
TaskText('\I��������\i \= ��������, ���������� � ������ ������ ������������ ���������',0,0);
TaskText('����� ������� �� ���� ��������� (����� �� ������ ���� �������). ��� ������',0,0);
TaskText('������ �������� (� ���������, ��� ����������� ������������� ���������� �����',0,0);
TaskText('�������) �� ������� ��������� ��������, ���������� ���� �� ���� ������',0,0);
TaskText('��� ������. ������� �������� � ������ �� ������ ��������: ����� ������,',0,0);
TaskText('�������, �������� � ���������� ����� �������. �������� � ������ ��������',0,0);
TaskText('�������� �� ��������� ������ � ����������� �� ����������� �������,',0,0);
TaskText('� ��� ���������� ������� \= � ���������� ������� ������� � ���������. ����',0,0);
TaskText('� ������ �������� ������  ��� �� ������ ���������, ����������������',0,0);
TaskText('��������� ��������, �� �������� � �������������� ����',0,0);
TaskText('����� \<Students not found\>.',0,0);
end;
end;
(*==*)
  for i := 1 to 30 do
  with b[i] do
  begin
    fam := '';
    for k := 1 to 3 do
    begin
      d[k] := 0;
      c[k] := 0;
    end;
  end;
  for i := 7 to 11 do
    begin
      a[i] := 0;
      max[i] := 0;
    end;
  s := DefDataStart(f1,f2);
  m := Random(26)+5;
  for i := 1 to m do
  with b[i] do
  begin
    repeat
      fam := RandomFam;
      bool := true;
      for k := 1 to i-1 do
        if fam = b[k].fam then
        begin
          bool := false;
          break;
        end;
    until bool;
    data := Random(5)+7;
  end;
  if Random(2)=0 then n := m*2+Random(20)
  else
    n := m*6+Random(50);
//  writeln(f1,n);
  k3 := Random(5);
  for i := 1 to n do
  begin
    k2 := Random(m)+1;
    pp := b[k2];
    k := Random(3)+1;
    case Random(18) of
    0..1,14..17: k1 := 5;
    2..4: k1 := 3;
    5..10: k1 := 4;
    else k1 := 2;
    end;
    if k3 = 0 then
    case nn of
     1: if k1 = 4 then while k1 = 4 do k1 := Random(4)+2;
     2: if k1 = 5 then while k1 = 5 do k1 := Random(4)+2;
    end;

    case nn of
    1:writeln(f1,pp.data,' ',k1,' ',pp.fam,' ',subj[k]);
    2:writeln(f1,k1,' ',pp.data,' ',pp.fam,' ',subj[k]);
    end;

    case nn of
    1: with b[k2] do
      case k1 of
      4: d[1] := d[1]+1;
      2..3: d[2] := d[2]+1;
      end;
    2: with b[k2] do
      case k1 of
      5: d[1] := d[1]+1;
      2..3: d[2] := d[2]+1;
      end;
    end;
  end;
  Close(f1);
  k1 := 0;
  case nn of
  1: begin
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].d[1] > b[i+1].d[1]) or (b[i].d[1] = b[i+1].d[1])and(b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if (d[1] > 0)and(d[2]=0) then
    begin
      writeln(f2,d[1],' ',fam,' ',data);
      k1 := k1 + 1;
    end;
  end;
  2: begin
  for k := 1 to m do
    with b[k] do
       if (d[1]>max[data]) and (d[2]=0) then
         max[data] := d[1];
  for k := 1 to m do
    for i := 1 to m-k do
      if (b[i].data > b[i+1].data) or (b[i].data = b[i+1].data)and(b[i].fam > b[i+1].fam) then
      begin
        pp := b[i];
        b[i] := b[i+1];
        b[i+1] := pp;
      end;
  for i := 1 to m do
  with b[i] do
    if (d[1] = max[data]) and (d[1] > 0) and (d[2] = 0) then
    begin
      writeln(f2,data,' ',fam,' ',max[data]);
      k1 := k1 + 1;
    end;
  end;
  end;
  if k1 = 0 then
    writeln(f2,'Students not found');
  Close(f2);
  DefDataEnd(s);
  SetTestCount(9);

end;

var f0,f1,f2,f3,f4: text;
    nmax,nmin,imax,imin: integer;
    smax,smin: string;
    code_,discount_,year_,price_: integer;
    shop_,cat_,street_,prod_,country_: string;
    k1,k2,k3,k4,k5,k6: integer;

procedure LinqObj71;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A} � {C}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <��� ��������> <����� ����������>\m\|',9,2);
  TaskText('{C}:\q \M<��� �����������> <������ (� ���������)> <�������� ��������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �������� ���������� ������������, ������� ������������ ������',0,5);
  TaskText('� ���� �������� (������� ��������� �������� ��������, ����� ��� �����������,',0,0);
  TaskText('��� ��� �������� � �������� ������������ ������). ���� ��� ����������',0,0);
  TaskText('�������� ������� ��������� ������������ � ������������ �������, �� �������',0,0);
  TaskText('������ � ����������� � ����������� �����. �������� � ������ �������� ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ��������� ��������� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',year,' ',street);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,code,' ',discount,' ',shop);
  for i := 1 to nshop do
  begin
    nmax := 0;
    k2 := 0;
    shop_ := shop1[ishop1[i]];
    for j := 1 to na do
    begin
      code_ := da[icode[j]].code;
      for k := 1 to nc do
        with dc[k] do
          if (code = code_) and (shop = shop_) then
          begin
          if  nmax < discount then
          begin
            nmax := discount;
            k1 := icode[j];
            k2 := 1;
          end
          else
           if nmax = discount then
             k2 := code;
          end;
    end;
    if nmax > 0 then
      with da[k1] do
        writeln(f0,shop_,' ',code,' ',year,' ',nmax{,' ',k2})
//    else
//        writeln(f0,shop_,' ',code,' ',year,' ',nmax,' ',k2)
  end;


  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj72;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A} � {C}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <����� ����������> <��� ��������>\m\|',9,2);
  TaskText('{C}:\q \M<������ (� ���������)> <��� �����������> <�������� ��������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �����������, ���������� � {A}, ���������� ���������� ���������,',0,5);
  TaskText('� ������� ��� ��������������� ������ (������� ��������� ���������� ���������,',0,0);
  TaskText('����� ��� �����������, ����� ��� ����� ����������). ���� � ����������',0,0);
  TaskText('����������� ��� ������ �� � ����� ��������, �� ��� ���� ��������� ����������',0,0);
  TaskText('���������, ������ 0. �������� � ������ ����������� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ����������� ���������� ���������, � ��� ������',0,0);
  TaskText('���������� \= �� ����������� ����� ������������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',street,' ',year);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,discount,' ',code,' ',shop);
  for i := 1 to na do
  begin
    code_ := da[icode[i]].code;
    da[icode[i]].data1 := 0;
    for j := 1 to nc do
      with dc[j] do
        if code = code_ then
          inc(da[icode[i]].data1);
  end;
  for k := 1 to na do
  begin
    nmin := 1000;
    k1 := 0;
    for i := 1 to na do
      if da[icode[i]].data1 < nmin then
      begin
        nmin := da[icode[i]].data1;
        k1 := icode[i];
      end;
    with da[k1] do
    begin
      writeln(f0,nmin,' ',code,' ',street);
      data1 := 1000;
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj73;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A} � {C}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� ��������> <��� �����������> <����� ����������>\m\|',9,2);
  TaskText('{C}:\q \M<��� �����������> <�������� ��������> <������ (� ���������)>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �������� � ������ ����� ���������� ���������� ������������,',0,5);
  TaskText('������� �� ���� ����� � ������� ������ � ���� �������� (������� ���������',0,0);
  TaskText('�������� ��������, ����� �������� �����, ����� ���������� ������������',0,0);
  TaskText('�� �������). ���� ��� ��������� ���� \<�������\:�����\> ����������� �� �������',0,0);
  TaskText('�� �������, �� ������ �� ���� ���� �� ���������. �������� � ������ ����',0,0);
  TaskText('\<�������\:�����\> �������� �� ����� ������ � ������������� �� ���������',0,0);
  TaskText('��������� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ��������� ���� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,year,' ',code,' ',street);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,code,' ',shop,' ',discount);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    for j := 1 to nstreet do
    begin
      street_ := street1[istreet1[j]];
      k1 := 0;
      for k := 1 to nc do
      with dc[k] do
        if (shop = shop_) and (da[indcode(code)].street = street_) then
          inc(k1);
      if k1 > 0 then
        writeln(f0,shop_,' ',street_,' ',k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj74;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A} � {C}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� �����������> <��� ��������>\m\|',9,2);
  TaskText('{C}:\q \M<�������� ��������> <������ (� ���������)> <��� �����������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �������� � ������� ���� �������� �� {A} ���������� ������� ������',0,5);
  TaskText('� ������ �������� (� ���������) ��� ������������ � ���� ����� ��������',0,0);
  TaskText('(������� ��������� �������� ��������, ����� ��� ��������, ����� ��������',0,0);
  TaskText('������� ������ � ���������). ������� ����� ���������� �������� ��������',0,0);
  TaskText('�������������, ������ ��������� ��� ����� �����. ��� ���������� �������',0,0);
  TaskText('������ ����������� ������ ����������� ������� ���� ��������, ������� ������',0,0);
  TaskText('� ������ ��������. ���� ����� ������������ ��� ������� �������� ���, �� ���',0,0);
  TaskText('���� ���� \<�������\:���\> � �������� ������� ������ ��������� 0. ��������',0,0);
  TaskText('� ������ ���� \<�������\:���\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ����������� ������� ����.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',code,' ',year);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,shop,' ',discount,' ',code);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    k1 := 0;
    for k := 1 to nc do
    with dc[k] do
        if shop = shop_ then
        begin
          k1 := 1;
          break;
        end;
    if k1 = 0 then
      continue;
    for j := 1 to nyear do
    begin
      year_ := year1[iyear1[j]];

      k1 := 0;
      for k := 1 to na do
      with da[k] do
        if year_  = year then
        begin
          k1 := 1;
          break;
        end;
      if k1 = 0 then
        continue;
      k1 := 0;
      k2 := 0;
      for k := 1 to nc do
      with dc[k] do
        if (shop = shop_) and (da[indcode(code)].year = year_) then
        begin
          k1 := k1 + discount;
          inc(k2);
        end;
      k4 := k1;
      k3 := k2;
      if k2 <> 0 then
        k2 := k1 div k2;
      writeln(f0,shop_,' ',year_,' ',k2{,' ',k4,' ',k3});
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj75;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B} � {D}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<������� ������> <���������> <������-�������������>\m\|',12,2);
  TaskText('{D}:\q \M<�������� ��������> <������� ������> <���� (� ������)>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �������� � ������ ��������� ������� ���������� ����������',0,5);
  TaskText('��������� ��������� ������� ������ ���������, ��������� � ������ ��������',0,0);
  TaskText('(������� ��������� �������� ��������, ����� ���������, ����� ����������',0,0);
  TaskText('��������� ��������� �������). ���� ��� ���������� �������� ������ ������',0,0);
  TaskText('��������� �����������, �� ���������� � ��������������� ����',0,0);
  TaskText('\<�������\:���������\> �� ���������. �������� � ������ ����',0,0);
  TaskText('\<�������\:���������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ��������� ��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,prod,' ',cat,' ',country);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,shop,' ',prod,' ',price);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    for j := 1 to ncat do
    begin
      cat_ := cat1[icat1[j]];
      k1 := 0;
      for k := 1 to nd do
      with dd[k] do
        if (shop = shop_) and (db[indprod(prod)].cat = cat_) then
          inc(k1);
      if k1 > 0 then
        writeln(f0, shop_,' ',cat_,' ',k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj76;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B} � {D}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<������-�������������> <���������> <������� ������>\m\|',12,2);
  TaskText('{D}:\q \M<������� ������> <�������� ��������> <���� (� ������)>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������ ������-������������� ���������� ���������� ���������, ������������',0,5);
  TaskText('������, ������������� � ���� ������, � ����� ����������� ���� ��� �������',0,0);
  TaskText('�� ������ ������ �� ���� ��������� (������� ��������� ���������� ���������,',0,0);
  TaskText('����� ������, ����� ����������� ����). ���� ��� ��������� ������ �� �������',0,0);
  TaskText('�� ������ ������, ��������������� � �����-���� ��������, �� ����������',0,0);
  TaskText('��������� � ����������� ���� ���������� ������� 0. �������� � ������ ������',0,0);
  TaskText('�������� �� ����� ������ � ������������� �� ����������� ���������� ���������,',0,0);
  TaskText('� � ������ ����������� ���������� \= �� ��������� ����� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,country,' ',cat,' ',prod);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',shop,' ',price);
  for i := 1 to ncountry do
  begin
    country_ := country1[i];
    k1 := 0;
    for k := 1 to nd do
    with dd[k] do
      if db[indprod(prod)].country = country_ then
      begin
        k1 := 1;
        break;
      end;
    if k1 = 0 then
      continue;
    nmin := 100000;
    k1 := 0;
    for j := 1 to nshop do
    begin
      shop_ := shop1[j];
      k2 := 0;
      for k := 1 to nd do
      with dd[k] do
      if (shop = shop_) and (db[indprod(prod)].country = country_) then
      begin
        k2 := 1;
        if nmin > price then
          nmin := price;
      end;
      k1 := k1 + k2;
    end;
    if k1 = 0 then
      nmin := 0;
    with data[i] do
    begin
      data1 := k1;
      data2 := nmin;
    end;
  end;
  for i := 1 to ncountry do
  begin
    nmin := 100;
    for j := 1 to ncountry do
      if data[icountry1[j]].data1 < nmin then
      begin
        k1 := icountry1[j];
        nmin := data[icountry1[j]].data1;
      end;
    writeln(f0,nmin,' ', country1[k1],' ', data[k1].data2);
    data[k1].data1 := 100;
  end;

  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj77;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B} � {D}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<���������> <������� ������> <������-�������������>\m\|',12,2);
  TaskText('{D}:\q \M<������� ������> <���� (� ������)> <�������� ��������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������ ��������� ������� ���������� ���������� ���������, ������������',0,5);
  TaskText('������ ������ ���������, � ����� ���������� �����, � ������� �����������',0,0);
  TaskText('������ ������ ���������, �������������� � ��������� (������� ���������',0,0);
  TaskText('���������� ���������, ����� �������� ���������, ����� ���������� �����). ����',0,0);
  TaskText('��� ��������� ��������� �� ������� �� ������ ������, ���������������',0,0);
  TaskText('� �����-���� ��������, �� ���������� � ������ ��������� �� ���������. ��������',0,0);
  TaskText('� ������ ��������� �������� �� ����� ������ � ������������� �� ��������',0,0);
  TaskText('���������� ���������, � � ������ ����������� ���������� \= �� ���������',0,0);
  TaskText('��������� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,cat,' ',prod,' ',country);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',price,' ',shop);
  for i := 1 to ncat do
  begin
    cat_ := cat1[i];
    k1 := 0;
    k3 := 0;
    for j := 1 to nshop do
    begin
      shop_ := shop1[j];
      k2 := 0;
      for k := 1 to nd do
      with dd[k] do
      if (shop = shop_) and (db[indprod(prod)].cat = cat_) then
      begin
        k2 := 1;
      end;
      k1 := k1 + k2;
    end;
    if k1 > 0 then
    for j := 1 to ncountry do
    begin
      country_ := country1[j];
      k2 := 0;
      for k := 1 to nd do
      with dd[k] do
      if (db[indprod(prod)].country = country_) and (db[indprod(prod)].cat = cat_) then
      begin
        k2 := 1;
      end;
      k3 := k3 + k2;
    end;
    with data[i] do
    begin
      data1 := k1;
      data2 := k3;
    end;
  end;
  for i := 1 to ncat do
  begin
    nmax := -1;
    for j := 1 to ncat do
      if data[icat1[j]].data1 > nmax then
      begin
        k1 := icat1[j];
        nmax := data[icat1[j]].data1;
      end;
    if nmax > 0 then
    writeln(f0,nmax,' ', cat1[k1],' ', data[k1].data2);
    data[k1].data1 := -1;
  end;


  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj78;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({D}:\q \M<���� (� ������)> <������� ������> <�������� ��������>\m\|',0,2);
  TaskText('{E}:\q \M<��� �����������> <�������� ��������> <������� ������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� ������ ���������� ���������� ������� ������� ������',0,5);
  TaskText('� ������������ ���� ������� (������� ��������� ���������� �������, �����',0,0);
  TaskText('������� ������, ����� ������������ ���� �������). ���� ��������� �����',0,0);
  TaskText('�� ���� �� ��� ������, �� ���������� �� ���� ������ �� ���������. ��������',0,0);
  TaskText('� ������ ������ �������� �� ����� ������ � ������������� �� �����������',0,0);
  TaskText('���������� �������, � � ������ ����������� ���������� \= �� ���������',0,0);
  TaskText('������� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nd do
    with dd[i] do
      writeln(f1,price,' ',prod,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f2,code,' ',shop,' ',prod);
  for i := 1 to nb do
  begin
    prod_ := db[i].prod;
    k1 := 0;
    nmax := 0;
    for j := 1 to ne do
    with de[j] do
    begin
      if (prod = prod_) then
      begin
        k1 := k1 + 1;
        shop_ := shop;
        for k := 1 to nd do
          if (dd[k].prod = prod_) and (dd[k].shop = shop_) then
          begin
            k2 := dd[k].price;
            break;
          end;
        if nmax < k2 then
          nmax := k2;
      end;
    end;
    with db[i] do
    begin
      data1 := k1;
      data2 := nmax;
    end;
  end;
  for i := 1 to nb do
  begin
    nmin := 1000;
    k1 := 0;
    for j := 1 to nb do
      if (db[iprod[j]].data1 < nmin) and (db[iprod[j]].data1 > 0) then
      begin
        nmin := db[iprod[j]].data1;
        k1 := iprod[j];
      end;
    if k1 <> 0 then
    begin
      writeln(f0, nmin, ' ', db[k1].prod,' ', db[k1].data2);
      db[k1].data1 := 0;
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj79;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({D}:\q \M<�������� ��������> <���� (� ������)> <������� ������>\m\|',0,2);
  TaskText('{E}:\q \M<��� �����������> <������� ������> <�������� ��������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������� �������� � ������� ����������� ���������� ��������� ���������',0,5);
  TaskText('�������, ��������� ���� ������������ � ������ �������� (������� ���������',0,0);
  TaskText('�������� ��������, ����� ��� �����������, ����� ��������� ��������� �������).',0,0);
  TaskText('���� ����������� �� �������� �� ������ ������ � ��������� ��������,',0,0);
  TaskText('�� ���������� � ��������������� ���� \<�������\:�����������\> �� ���������.',0,0);
  TaskText('�������� � ������ ���� \<�������\:�����������\> �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� ��������� � ���������� �������, � � ������',0,0);
  TaskText('���������� �������� \= �� ����������� ����� ������������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nd do
    with dd[i] do
      writeln(f1,shop,' ',price,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f2,code,' ',prod,' ',shop);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    for j := 1 to na do
    begin
      code_ := da[icode[j]].code;
      k1 := 0;
      k3 := 0;
      for k := 1 to ne do
      with de[k] do
        if (code = code_) and (shop = shop_) then
          for k2 := 1 to nd do
            if (dd[k2].shop = shop_) and (dd[k2].prod = prod) then
            begin
              k1 := k1 + dd[k2].price;
              k3 := k3 + 1;
              break;
            end;
      if k1 > 0 then
        writeln(f0,shop_,' ',code_,' ',k1{,' ',k3});
     end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj80;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({D}:\q \M<���� (� ������)> <�������� ��������> <������� ������>\m\|',0,2);
  TaskText('{E}:\q \M<������� ������> <�������� ��������> <��� �����������>\m\)',0,3);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,4);
  TaskText('��� ������ ���� \<�������\:�����\>, ��������� � {D}, ���������� ���������',0,5);
  TaskText('��������� ������ ����� ������ � ������ �������� (������� ��������� ��������',0,0);
  TaskText('��������, ����� ������� ������, ����� ��������� ��������� ��� ������).',0,0);
  TaskText('���� ����� �� ���� �� ��� ������ � ��������� ��������, �� ��� ���������������',0,0);
  TaskText('���� \<�������\:�����\> � �������� ��������� ��������� ��������� 0. ��������',0,0);
  TaskText('� ������ ���� \<�������\:�����\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � � ������ ����������',0,0);
  TaskText('�������� \= �� ��������� ������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(2,f0,f1,f2,f3,f4);
  for i:=1 to nd do
    with dd[i] do
      writeln(f1,price,' ',shop,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f2,prod,' ',shop,' ',code);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    k4 := -1;
    for j := 1 to nd do
      if dd[j].shop = shop_ then
      begin
        k4 := 0;
        break;
      end;
    if k4 = -1 then continue;
    for j := 1 to nb do
    begin
      prod_ := db[iprod[j]].prod;
      k4 := -1;
      for k := 1 to nd do
        if (dd[k].prod = prod_) and (dd[k].shop = shop_) then
        begin
          k4 := 0;
          break;
        end;
      if k4 = -1 then continue;
      k1 := 0;
      k3 := 0;
      for k := 1 to ne do
      with de[k] do
      if (shop = shop_) and (prod = prod_) then
      for k2 := 1 to nd do
        if (dd[k2].shop = shop_) and (dd[k2].prod = prod) then
            begin
              k1 := k1 + dd[k2].price;
              k3 := k3 + 1;
              break;
            end;
//      if k1 > 0 then
        writeln(f0,shop_,' ',prod_,' ',k1{,' ',k3});
     end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj81;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<������� ������> <������-�������������> <���������>\m\|',12,2);
  TaskText('{D}:\q \M<�������� ��������> <������� ������> <���� (� ������)>\m\|',0,3);
  TaskText('{E}:\q \M<�������� ��������> <��� �����������> <������� ������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ������-������������� ���������� ���������� ������������� �������',0,0);
  TaskText('�� ������ ������ � ��������� ��������� ������������� ������� (�������',0,0);
  TaskText('��������� �������� ������, ����� ���������� �������, ����� ���������',0,0);
  TaskText('���������). ���� �������� � ��������� ������� ��� ���������',0,0);
  TaskText('������-������������� �����������, �� ���������� �� ���� ������ �� ���������.',0,0);
  TaskText('�������� � ������ ������ �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ����� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,prod,' ',country,' ',cat);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,shop,' ',prod,' ',price);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,shop,' ',code,' ',prod);
  k3 := 0;
  for i := 1 to ncountry do
  begin
    country_ := country1[icountry1[i]];
    k1 := 0;
    k2 := 0;
    for j := 1 to ne do
    begin
      prod_ := de[j].prod;
      if db[indprod(prod_)].country = country_ then
      begin
        inc(k1);
        shop_ := de[j].shop;
        for k := 1 to nd do
        with dd[k] do
          if (shop = shop_) and (prod = prod_) then
          begin
            k2 := k2 + price;
            break;
          end;
      end;
    end;
    k3 := k3 + k1;
    if k1 > 0 then
      writeln(f0, country_,' ', k1, ' ', k2{,' ',k3});
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj82;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<���������> <������-�������������> <������� ������>\m\|',12,2);
  TaskText('{D}:\q \M<���� (� ������)> <������� ������> <�������� ��������>\m\|',0,3);
  TaskText('{E}:\q \M<������� ������> <��� �����������> <�������� ��������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� ����������� ���������� ���������� ��������� �������������',0,0);
  TaskText('�� ������� � ������������ ���� ����� ��� ������� (������� ���������',0,0);
  TaskText('���������� ��������� �������, ����� ��� �����������, ����� ������������',0,0);
  TaskText('���� �������). �������� � ������ ����������� �������� �� ����� ������',0,0);
  TaskText('� ������������� �� �������� ���������� ���������, � ��� ����������',0,0);
  TaskText('���������� ��������� \= �� ����������� ����� ������������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,cat,' ',country,' ',prod);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,price,' ',prod,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,prod,' ',code,' ',shop);
  k3 := 0;
  for i := 1 to na do
  begin
    code_ := da[i].code;
    da[i].data1 := 0;
    k1 := 0;
    nmax := 0;
    for j := 1 to ncat do
      for k := 1 to ne do
        if (de[k].code = code_) and (db[indprod(de[k].prod)].cat = cat1[j]) then
        begin
          k1 := k1 + 1;
          break;
        end;
    if k1 = 0 then continue;
    da[i].data1 := k1;
    k3 := k3 + k1;
    for j := 1 to ne do
        if de[j].code = code_ then
        begin
          prod_ := de[j].prod;
          shop_ := de[j].shop;
          for k := 1 to nd do
          with dd[k] do
            if (shop = shop_) and (prod = prod_) then
            begin
              if price > nmax then
                nmax := price;
              break;
            end;
        end;
    da[i].data2 := nmax;
  end;
  for i := 1 to na do
  begin
    nmax := 0;
    for j := 1 to na do
      if da[icode[j]].data1 > nmax then
      begin
        nmax := da[icode[j]].data1;
        k1 := icode[j];
      end;
    if nmax = 0 then break;
    writeln(f0,nmax,' ', da[k1].code,' ',da[k1].data2{,' ',k3});
    da[k1].data1 := 0;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj83;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<������-�������������> <������� ������> <���������>\m\|',12,2);
  TaskText('{D}:\q \M<���� (� ������)> <�������� ��������> <������� ������>\m\|',0,3);
  TaskText('{E}:\q \M<�������� ��������> <������� ������> <��� �����������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� ��������, ���������� � {E}, � ������ ������-������������� ����������',0,0);
  TaskText('��������� ��������� ������� �� ������ ������, ��������� � ������ ��������',0,0);
  TaskText('(������� ��������� �������� ��������, ����� �������� ������, ����� ���������',0,0);
  TaskText('���������). ���� ��� ��������� ���� \<�������\:������\> ����������� ����������',0,0);
  TaskText('� ��������� �������, �� � �������� ��������� ��������� ��������� 0. ��������',0,0);
  TaskText('� ������ ���� \<�������\:������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ��������� ����� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,country,' ',prod,' ',cat);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,price,' ',shop,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,shop,' ',prod,' ',code);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    k1 := 0;
    for j := 1 to ne do
    with de[j] do
      if shop = shop_ then
      begin
        k1 := 1;
        break;
      end;
    if k1 = 0 then
    begin
//      writeln(f0,shop_, ' ', '', ' ', k1);
      continue;
    end;
    for j := 1 to ncountry do
    begin
      country_ := country1[icountry1[j]];
      k1 := 0;
      for k := 1 to nb do
      with db[k] do
      if country = country_ then
      begin
        k1 := 1;
        break;
      end;
      if k1 = 0 then
        continue;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (db[indprod(prod)].country = country_) then
          for k2 := 1 to nd do
            if (dd[k2].shop = shop_) and (dd[k2].prod = prod) then
            begin
              k1 := k1 + dd[k2].price;
              break;
            end;
      writeln(f0,shop_, ' ', country_, ' ', k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj84;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({C}:\q \M<������ (� ���������)> <�������� ��������> <��� �����������>\m\|',0,2);
  TaskText('{D}:\q \M<������� ������> <�������� ��������> <���� (� ������)>\m\|',9,3);
  TaskText('{E}:\q \M<������� ������> <�������� ��������> <��� �����������>\m\)',9,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� �������� � ������� ������ ���������� ���������� ������� �����',0,0);
  TaskText('������ �� ������� � ������ �������� � ��������� ��������� ���� �������',0,0);
  TaskText('� ������ ������ (������� ��������� �������� ��������, ����� ������� ������,',0,0);
  TaskText('����� ���������� ������� �� ������� � �� ��������� ���������). ��� ����������',0,0);
  TaskText('������� ������ �� ����� ������� �������������. ���� ��� ��������� ����',0,0);
  TaskText('\<�������\:�����\> �� ������� �� ����� ������� �� �������, �� ����������',0,0);
  TaskText('� ������ ���� �� ���������. ���� �� ������� �� ����� ���������� ����',0,0);
  TaskText('\<�������\:�����\>, �� �������� � �������������� ���� ����� \<Data not found\>.',0,0);
  TaskText('�������� � ������ ���� \<�������\:�����\> �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� ��������� � ���������� �������, � ��� ����������',0,0);
  TaskText('�������� \= �� ��������� ������� (����� � ���������� �������).',0,0);
  DefDataStart2(3,f0,f1,f2,f3,f4);
  k6:=Random(3);
  repeat
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  Close(f0);
  Rewrite(f0);
  Close(f1);
  Rewrite(f1);
  Close(f2);
  Rewrite(f2);
  Close(f3);
  Rewrite(f3);
  for i:=1 to nc do
    with dc[i] do
      writeln(f1,discount,' ',shop,' ',code);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',shop,' ',price);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,prod,' ',shop,' ',code);
  k5 := 0;
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    for j := 1 to nb do
    begin
      prod_ := db[iprod[j]].prod;
      k1 := 0;
      k2 := 0;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (prod = prod_) then
        begin
          k4 := 0;
          for k3 := 1 to nc do
            if (dc[k3].code = code) and (dc[k3].shop = shop_) then
            begin
              k4 := dc[k3].discount;
              break;
            end;
          if k4 = 0 then continue;
          inc(k1);
          for k3 := 1 to nd do
            if (dd[k3].prod = prod_) and (dd[k3].shop = shop_) then
            begin
              k2 := k2 + dd[k3].price - dd[k3].price * k4 div 100;
              break;
            end;
         end;
      if k1 = 0 then continue;
      inc(k5);
      writeln(f0,shop_,' ', prod_,' ', k1,' ',k2);
    end;
  end;
  if k5 = 0 then
    writeln(f0,'Data not found');
  until (k6<>0)and(k5<>0) or (k6=0)and(k5=0);
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj85;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({C}:\q \M<�������� ��������> <��� �����������> <������ (� ���������)>\m\|',0,2);
  TaskText('{D}:\q \M<������� ������> <���� (� ������)> <�������� ��������>\m\|',9,3);
  TaskText('{E}:\q \M<������� ������> <��� �����������> <�������� ��������>\m\)',9,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ���� \<�����������\:�������\>, ��������� � {E}, ���������� ���������',0,0);
  TaskText('������ ������ �� ��� ������, ������������� ���� ������������ � ������',0,0);
  TaskText('�������� (������� ��������� ��� �����������, ����� �������� ��������,',0,0);
  TaskText('����� ��������� ������ ������). ��� ���������� ������� ������ �� ������',0,0);
  TaskText('������������� ����� ������� �������������. ���� ����������� ����������',0,0);
  TaskText('������ � ��������� �������� ��� ������, �� ���������� � ��������������� ����',0,0);
  TaskText('\<�����������\:�������\> �� ���������. ���� �� ������� �� ����� ����������',0,0);
  TaskText('���� \<�����������\:�������\>, �� �������� � �������������� ���� �����',0,0);
  TaskText('\<Data not found\>. �������� � ������ ���� \<�����������\:�������\>',0,0);
  TaskText('�������� �� ����� ������ � ������������� �� ����������� ����� ������������,',0,0);
  TaskText('� ��� ���������� ����� \= �� ��������� ��������� � ���������� �������.',0,0);
  DefDataStart2(3,f0,f1,f2,f3,f4);
  k6:=Random(3);
  repeat
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  Close(f0);
  Rewrite(f0);
  Close(f1);
  Rewrite(f1);
  Close(f2);
  Rewrite(f2);
  Close(f3);
  Rewrite(f3);
  for i:=1 to nc do
    with dc[i] do
      writeln(f1,shop,' ',code,' ',discount);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',price,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,prod,' ',code,' ',shop);
  k5 := 0;
  for i := 1 to na do
  begin
    code_ := da[icode[i]].code;
    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (code = code_) then
        begin
          k4 := 0;
          for k3 := 1 to nc do
            if (dc[k3].code = code_) and (dc[k3].shop = shop_) then
            begin
              k4 := dc[k3].discount;
              break;
            end;
          if k4 = 0 then continue;
          for k3 := 1 to nd do
            if (dd[k3].prod = prod) and (dd[k3].shop = shop_) then
            begin
              k1 := k1 + dd[k3].price * k4 div 100;
              break;
            end;
         end;
      if k1 = 0 then continue;
      inc(k5);
      writeln(f0,code_,' ', shop_,' ', k1);
    end;
  end;
  if k5 = 0 then
    writeln(f0,'Data not found');
  until (k6<>0)and(k5<>0) or (k6=0)and(k5=0);
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj86;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({C}:\q \M<������ (� ���������)> <��� �����������> <�������� ��������>\m\|',0,2);
  TaskText('{D}:\q \M<�������� ��������> <���� (� ������)> <������� ������>\m\|',9,3);
  TaskText('{E}:\q \M<��� �����������> <�������� ��������> <������� ������>\m\)',9,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ���� \<�����\:�������\>, ��������� � {E}, ���������� ������������',0,0);
  TaskText('������ ������ �� ���� ����� ��� ��� ������������ � ������ ��������',0,0);
  TaskText('(������� ��������� ������� ������, ����� �������� ��������, �����',0,0);
  TaskText('������������ ������ ������). ��� ���������� ������� ������ �� ����� �������',0,0);
  TaskText('�������������. ���� ��� ������� ������ � ��������� �������� ����������� ���',0,0);
  TaskText('������, �� � �������� ������������� ������� ������ ��� ������ ����',0,0);
  TaskText('��������� 0. �������� � ������ ���� \<�����\:�������\> �������� �� �����',0,0);
  TaskText('������ � ������������� �� ��������� ������� � ���������� �������, � ���',0,0);
  TaskText('���������� ��������� \= �� ��������� ��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to nc do
    with dc[i] do
      writeln(f1,discount,' ',code,' ',shop);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,shop,' ',price,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,code,' ',shop,' ',prod);
  for i := 1 to nb do
  begin
    prod_ := db[iprod[i]].prod;
    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      nmax := -1;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (prod = prod_) then
        begin
          k2 := 0;
          for k1 := 1 to nc do
            if (dc[k1].shop = shop_) and (dc[k1].code = code) then
            begin
              k2 := dc[k1].discount;
              break;
            end;
          if k2 <> 0 then
          begin
            k3 := 0;
            for k1 := 1 to nd do
              if (dd[k1].shop = shop_) and (dd[k1].prod = prod) then
              begin
                k3 := dd[k1].price;
                break;
              end;
            k2 := k3 * k2 div 100;
          end;
          if nmax < k2 then
            nmax := k2;
        end;
      if nmax > -1 then
        writeln(f0,prod_,' ', shop_,' ',nmax);
    end;
  end;

  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj87;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� ��������> <����� ����������> <��� �����������>\m\|',12,2);
  TaskText('{D}:\q \M<������� ������> <�������� ��������> <���� (� ������)>\m\|',0,3);
  TaskText('{E}:\q \M<�������� ��������> <��� �����������> <������� ������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ����� ���������� � ������� ��������, ���������� � {E}, ����������',0,0);
  TaskText('��������� ��������� ������� � ������ ��������, ��������� ����� �������������,',0,0);
  TaskText('�������� �� ������ ����� (������� ��������� �������� �����, ����� ��������',0,0);
  TaskText('��������, ����� ��������� ��������� �������). ���� ��� ��������� ����',0,0);
  TaskText('\<�����\:�������\> ����������� ���������� � ��������� �������, �� � ��������',0,0);
  TaskText('��������� ��������� ��������� 0. �������� � ������ ���� \<�����\:�������\>',0,0);
  TaskText('�������� �� ����� ������ � ������������� �� ��������� ���� � ����������',0,0);
  TaskText('�������, � ��� ���������� �������� ���� \= �� ���������',0,0);
  TaskText('��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,year,' ',street,' ',code);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',shop,' ',price);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,shop,' ',code,' ',prod);
  for i := 1 to nstreet do
  begin
    street_ := street1[istreet1[i]];
      k1 := 0;
      for k := 1 to na do
        with da[k] do
          if street = street_ then
          begin
            k1 := 1;
            break;
          end;
      if k1 = 0 then
        continue;

    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      k1 := 0;
      for k := 1 to ne do
        with de[k] do
          if shop = shop_ then
          begin
            k1 := 1;
            break;
          end;
      k3 := 0;
      if k1 = 0 then
        continue;
      k1 := 0;
      for k := 1 to ne do
        with de[k] do
          if (shop=shop_) and (da[indcode(code)].street = street_) then
          begin
            for k2 := 1 to nd do
              if (dd[k2].shop = shop_) and (dd[k2].prod = prod) then
              begin
                k1 := k1 + dd[k2].price;
                inc(k3);
                break;
              end;
          end;
       writeln(f0,street_,' ', shop_,' ', k1{,' ',k3});
    end;
  end;



  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj88;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� ��������> <��� �����������>\m\|',12,2);
  TaskText('{D}:\q \M<������� ������> <���� (� ������)> <�������� ��������>\m\|',0,3);
  TaskText('{E}:\q \M<�������� ��������> <������� ������> <��� �����������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� ���� ��������, ���������� � {A}, � ������� ������, ���������� � {E},',0,0);
  TaskText('���������� ��������� ��������� ������� ������� ������, ��������� �����',0,0);
  TaskText('������������� � ������ ����� �������� (������� ��������� ��� ��������, �����',0,0);
  TaskText('������� ������, ����� ��������� ��������� �������). ���� ��� ��������� ����',0,0);
  TaskText('\<���\:�����\> ����������� �������� � ��������� �������, �� ���������� �� ����',0,0);
  TaskText('���� �� ���������. �������� � ������ ���� \<���\:�����\> �������� �� �����',0,0);
  TaskText('������ � ������������� �� �������� ������� ����, � ��� ����������',0,0);
  TaskText('������� \= �� ��������� ������� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',year,' ',code);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,prod,' ',price,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,shop,' ',prod,' ',code);
  for i := nyear downto 1 do
  begin
    year_ := year1[iyear1[i]];
    for j := 1 to nb do
    begin
      prod_ :=  db[iprod[j]].prod;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
       if (prod=prod_) and (da[indcode(code)].year = year_) then
         for k2 := 1 to nd do
           if (dd[k2].shop = shop) and (dd[k2].prod = prod_) then
           begin
             k1 := k1 + dd[k2].price;
             break;
           end;
      if k1 > 0 then
        writeln(f0,year_,' ',prod_,' ',k1);
     end;
  end;


  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj89;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <��� ��������> <����� ����������>\m\|',12,2);
  TaskText('{D}:\q \M<�������� ��������> <���� (� ������)> <������� ������>\m\|',0,3);
  TaskText('{E}:\q \M<��� �����������> <������� ������> <�������� ��������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� ��������, ���������� � {E}, ���������� ����������� � ����������',0,0);
  TaskText('����� ��������, ��������� ���� ��� ����� ������� � ������ ��������',0,0);
  TaskText('(������� ��������� �������� ��������, ����� ��� �����������, ��� ��� ��������',0,0);
  TaskText('� ��������� ��������� �������, ������������� ������������ � ������ ��������).',0,0);
  TaskText('���� ��� ���������� �������� ������� ��������� ����������� � ���������� �����',0,0);
  TaskText('��������, �� ��������� ������ ��� ���� ����� �����������. �������� � ������',0,0);
  TaskText('���� \<�������\:�����������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � ��� ����������',0,0);
  TaskText('�������� ��������� \= �� ����������� ����� ������������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',year,' ',street);
  for i:=1 to nd do
    with dd[i] do
      writeln(f2,shop,' ',price,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,code,' ',prod,' ',shop);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    k1 := 0;
    for j := 1 to ne do
      if de[j].shop = shop_ then
      begin
        k1 := 1;
        break;
      end;
    if k1 = 0 then continue;
    nmin := 3000;
    for j := 1 to ne do
    with de[j] do
      if (shop = shop_) and (da[indcode(code)].year < nmin) then
        nmin := da[indcode(code)].year;
    for j := 1 to na do
    begin
      if da[icode[j]].year > nmin then continue;
      code_ := da[icode[j]].code;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (code = code_) then
        for k2 := 1 to nd do
          if (dd[k2].shop = shop_) and (dd[k2].prod = prod) then
          begin
            k1 := k1 + dd[k2].price;
            break;
           end;
      if k1 > 0 then
        writeln(f0,shop_,' ',code_, ' ',nmin, ' ',k1);
    end;
  end;


  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj90;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� �����������> <��� ��������>\m\|',12,2);
  TaskText('{B}:\q \M<������-�������������> <���������> <������� ������>\m\|',12,3);
  TaskText('{E}:\q \M<������� ������> <��� �����������> <�������� ��������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������� ���� �������� �� {A} ���������� ������, � ������� ���� �����������',0,0);
  TaskText('������������ ���������� �������, ������������� ������������� ����� ����',0,0);
  TaskText('�������� (������� ��������� ���, ����� �������� ������, ����� ������������',0,0);
  TaskText('���������� �������). ���� ��� ��������� ���� \<���\:������\> �����������',0,0);
  TaskText('���������� � ��������� �������, �� ��� ���� �� �������������� (� ���������,',0,0);
  TaskText('���� ����������� ���������� ���� �������� �� ������� �� ����� �������,',0,0);
  TaskText('�� ���������� �� ���� ���� �� ���������). ���� ��� ������-���� ���� ��������',0,0);
  TaskText('������� ��������� ����� � ���������� ������ ������������� �������,',0,0);
  TaskText('�� ��������� ������ � ������ �� ����� ����� (� ���������� �������). ��������',0,0);
  TaskText('� ������ ���� �������� �� ����� ������ � �������������',0,0);
  TaskText('�� �������� ������ ����.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',code,' ',year);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,country,' ',cat,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,prod,' ',code,' ',shop);
  for i := nyear downto 1 do
  begin
    year_ := year1[iyear1[i]];
    nmax := 0;
    smax := '';
    for j := 1 to ncountry do
    begin
      country_ := country1[icountry1[j]];
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (da[indcode(code)].year = year_) and (db[indprod(prod)].country = country_) then
          inc(k1);
      if k1 > nmax then
      begin
        nmax := k1;
        smax := country_;
      end;
    end;
    if nmax > 0 then
      writeln(f0,year_, ' ', smax,' ',nmax);
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj91;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� ��������> <��� �����������>\m\|',12,2);
  TaskText('{B}:\q \M<������� ������> <������-�������������> <���������>\m\|',12,3);
  TaskText('{E}:\q \M<�������� ��������> <������� ������> <��� �����������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ����� � ������ ��������� ������� ���������� ���������� �����,',0,0);
  TaskText('� ������� ���� ����������� ������ ������ ���������, ��������� �������������,',0,0);
  TaskText('�������� �� ���� ����� (������� ��������� �������� �����, ����� ��������',0,0);
  TaskText('���������, ����� ���������� �����). ���� ��� �����-���� ��������� �����������',0,0);
  TaskText('���������� � �������, ��������� ������� ��������� �����, �� ����������',0,0);
  TaskText('� ��������������� ���� \<�����\:���������\> �� ���������. �������� � ������',0,0);
  TaskText('���� \<�����\:���������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ���� � ���������� �������, � ��� ����������',0,0);
  TaskText('���� \= �� ��������� ��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',year,' ',code);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,prod,' ',country,' ',cat);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,shop,' ',prod,' ',code);
  for i := 1 to nstreet do
  begin
    street_ := street1[istreet1[i]];
    for j := 1 to ncat do
    begin
      cat_ := cat1[icat1[j]];
      k1 := 0;
      for k := 1 to ncountry do
      begin
        country_ := country1[k];
        for k2 := 1 to ne do
        with de[k2] do
          if (da[indcode(code)].street = street_) and (db[indprod(prod)].cat = cat_)
              and (db[indprod(prod)].country = country_) then
          begin
            inc(k1);
            break;
          end;
      end;
      if k1 > 0 then
        writeln(f0,street_,' ',cat_,' ',k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj92;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� ��������> <����� ����������> <��� �����������>\m\|',12,2);
  TaskText('{B}:\q \M<������-�������������> <������� ������> <���������>\m\|',12,3);
  TaskText('{E}:\q \M<������� ������> <�������� ��������> <��� �����������>\m\)',0,4);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,5);
  TaskText('��� ������ ��������� ������� ���������� ����� � ������������ ���������',0,0);
  TaskText('����������� ������� ������ ���������, ������������� �������� ���� �����',0,0);
  TaskText('(������� ��������� �������� ���������, ����� �������� �����, �����',0,0);
  TaskText('������������ ��������� ���������� �������). ���� ��� �����-���� ���������',0,0);
  TaskText('����������� ���������� � �������, ��������� ������� ��������� �����,',0,0);
  TaskText('�� ��������� ���������� ������� ��� ��������������� ���� \<���������\:�����\>',0,0);
  TaskText('��������� ������ 0 (��� ���� �������� ��������, ����� ���������� ����������',0,0);
  TaskText('������� ��� �����-���� ��������� ����� 0). ���� ��� ��������� ���������',0,0);
  TaskText('������� ��������� ���� � ���������� ����������� �������, �� ��������� ������',0,0);
  TaskText('��� ���� ����� ������. �������� � ������ ���� \<���������\:�����\> ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ��������� ��������� � ���������� �������,',0,0);
  TaskText('� ��� ���������� ��������� \= �� ��������� ���� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(3,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,year,' ',street,' ',code);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,country,' ',prod,' ',cat);
  for i:=1 to ne do
    with de[i] do
      writeln(f3,prod,' ',shop,' ',code);
 for i := 1 to ncat do
  begin
    cat_ := cat1[icat1[i]];
    k1 := 0;
    for k := 1 to nb do
    with db[k] do
      if cat = cat_ then
      begin
        k1 := 1;
        break;
      end;
    if k1 = 0 then
      continue;
    nmax := 0;
    smax := '';
    for j := 1 to nstreet do
    begin
      street_ := street1[j];
      k1 := 0;
      for k := 1 to na do
      with da[k] do
        if street = street_ then
        begin
          k1 := 1;
          break;
        end;
      if k1 = 0 then
        continue;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (da[indcode(code)].street = street_) and (db[indprod(prod)].cat = cat_) then
          inc(k1);
      if k1 > nmax then
        nmax := k1;
    end;
    for j := 1 to nstreet do
    begin
      street_ := street1[istreet1[j]];
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (da[indcode(code)].street = street_) and (db[indprod(prod)].cat = cat_) then
          inc(k1);
      if k1 = nmax then
        writeln(f0,cat_, ' ', street_,' ',nmax);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  DefDataEnd2;
  SetTestCount(9);
end;


procedure LinqObj93;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B}, {C} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <����� ����������> <��� ��������>\m\|',9,2);
  TaskText('{B}:\q \M<���������> <������-�������������> <������� ������>\m\|',9,3);
  TaskText('{C}:\q \M<�������� ��������> <��� �����������> <������ (� ���������)>\m\|',0,4);
  TaskText('{E}:\q \M<��� �����������> <������� ������> <�������� ��������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������ ������-������������� � ����� ���������� ���������� ������������',0,0);
  TaskText('������ ������ (� ���������) ��� �������, ������������� � ������ ������',0,0);
  TaskText('� ������������� �������������, �������� �� ������ ����� (������� ���������',0,0);
  TaskText('�������� ������, ����� �������� �����, ����� ������������ ������ ������). ����',0,0);
  TaskText('��� ��������� ���� \<������\:�����\> ��� ������ ���� ����������� ��� ������,',0,0);
  TaskText('�� � �������� ������������� ������� ������ ��������� 0. ���� ��� ���������',0,0);
  TaskText('���� \<������\:�����\> ����������� ���������� � ������������� �������,',0,0);
  TaskText('�� ���������� � ������ ���� �� ���������. �������� � ������ ����',0,0);
  TaskText('\<������\:�����\> �������� �� ����� ������ � ������������� �� ���������',0,0);
  TaskText('����� � ���������� �������, � ��� ���������� �������� \= �� ���������',0,0);
  TaskText('���� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(4,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',street,' ',year);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,cat,' ',country,' ',prod);
  for i:=1 to nc do
    with dc[i] do
      writeln(f3,shop,' ',code,' ',discount);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,code,' ',prod,' ',shop);
  for i := 1 to ncountry do
  begin
    country_ := country1[icountry1[i]];
    for j := 1 to nstreet do
    begin
      street_ := street1[istreet1[j]];
      nmax := -1;
      for k := 1 to ne do
      with de[k] do
        if (da[indcode(code)].street = street_) and (db[indprod(prod)].country = country_) then
        begin
          k1 := 0;
          for k2 := 1 to nc do
            if (dc[k2].code = code) and (dc[k2].shop = shop) then
            begin
              k1 := dc[k2].discount;
              break;
            end;
          if nmax < k1 then
            nmax := k1;
      end;
      if nmax > -1 then
        writeln(f0, country_,' ', street_,' ', nmax);
     end;
  end;

  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj94;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B}, {C} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� ��������> <��� �����������> <����� ����������>\m\|',9,2);
  TaskText('{B}:\q \M<������� ������> <���������> <������-�������������>\m\|',9,3);
  TaskText('{C}:\q \M<��� �����������> <�������� ��������> <������ (� ���������)>\m\|',0,4);
  TaskText('{E}:\q \M<�������� ��������> <��� �����������> <������� ������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������� ��������, ���������� � {E}, � ������ ��������� ������� ����������',0,0);
  TaskText('����������� �������� ���� �������� ����� ��� ������������, ������� ���������',0,0);
  TaskText('� ������ �������� ���� ��� ����� ������� ������ ���������, � ����������',0,0);
  TaskText('������� ������ ���������, ������������� �� ������� � ������ ��������',0,0);
  TaskText('������������� ����� ���� �������� (������� ��������� �������� ��������,',0,0);
  TaskText('����� �������� ���������, ����� ����� ������������ ���� �������� � ����������',0,0);
  TaskText('�������, ������������� �� �������). ���� ��� ��������� ����',0,0);
  TaskText('\<�������\:���������\> ���������� � ��������� ������� �����������, �� ������',0,0);
  TaskText('�� ���� ���� �� ���������. ���� ��� ��������� ���� \<�������\:���������\>',0,0);
  TaskText('���������� � ����������� ����� �������� ��������� ��� ������ ��� ������,',0,0);
  TaskText('�� � �������� �������� ���������� �������, ������������� �� �������,',0,0);
  TaskText('��������� 0. �������� � ������ ���� \<�������\:���������\> ��������',0,0);
  TaskText('�� ����� ������ � ������������� �� ��������� ��������� � ���������� �������,',0,0);
  TaskText('� ��� ���������� �������� ��������� \= �� ���������',0,0);
  TaskText('��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(4,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,year,' ',code,' ',street);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,prod,' ',cat,' ',country);
  for i:=1 to nc do
    with dc[i] do
      writeln(f3,code,' ',shop,' ',discount);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,shop,' ',code,' ',prod);
  for i := 1 to nshop do
  begin
    shop_ := shop1[ishop1[i]];
    for j := 1 to ncat do
    begin
      cat_ := cat1[icat1[j]];
      nmin := 3000;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (db[indprod(prod)].cat = cat_) and
           (nmin > da[indcode(code)].year) then
           nmin := da[indcode(code)].year;
      if nmin = 3000 then
        continue;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (shop = shop_) and (db[indprod(prod)].cat = cat_) and
           (nmin = da[indcode(code)].year) then
           for k2 := 1 to nc do
             if (dc[k2].code = code) and (dc[k2].shop = shop_) then
             begin
               inc(k1);
               break;
             end;
       writeln(f0, shop_,' ',cat_,' ',nmin,' ',k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj95;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <����� ����������> <��� ��������>\m\|',9,2);
  TaskText('{C}:\q \M<�������� ��������> <������ (� ���������)> <��� �����������>\m\|',0,3);
  TaskText('{D}:\q \M<�������� ��������> <������� ������> <���� (� ������)>\m\|',9,4);
  TaskText('{E}:\q \M<��� �����������> <�������� ��������> <������� ������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������� �������� ������, ���������� � {E}, � ������ ����� ����������',0,0);
  TaskText('���������� ��������� ������ ������ �� ������� ������� ��������, �������������',0,0);
  TaskText('�������������, �������� �� ������ ����� (������� ��������� ������� ������,',0,0);
  TaskText('����� �������� �����, ����� ��������� ������ ������). ��� ���������� �������',0,0);
  TaskText('������ �� ����� ������� �������������. ���� �� ��������� ����� ������',0,0);
  TaskText('�����������, �� �� ������ ���������� ������ 0. ���� ��� ��������� ����',0,0);
  TaskText('\<�����\:�����\> ����������� ���������� � ������������� �������, �� ������',0,0);
  TaskText('�� ���� ���� �� ���������. ���� ��� ��������� ���� \<�����\:�����\> ��� �������',0,0);
  TaskText('���� ����������� ��� ������, �� � �������� ��������� ������ ��� ���� ����',0,0);
  TaskText('��������� 0. �������� � ������ ���� \<�����\:�����\> �������� �� ����� ������',0,0);
  TaskText('� ������������� �� ��������� ������� � ���������� �������, � ��� ����������',0,0);
  TaskText('��������� \= �� ��������� ���� (����� � ���������� �������).',0,0);
  DefDataStart2(4,f0,f1,f2,f3,f4);
  repeat
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  Close(f0);
  Rewrite(f0);
  Close(f1);
  Rewrite(f1);
  Close(f2);
  Rewrite(f2);
  Close(f3);
  Rewrite(f3);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',street,' ',year);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,shop,' ',discount,' ',code);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,shop,' ',prod,' ',price);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,code,' ',shop,' ',prod);
  nmax := 0;
  for i := 1 to nb do
  begin
    prod_ := db[iprod[i]].prod;
    for j := 1 to nstreet do
    begin
      street_ := street1[istreet1[j]];
      k1 := 0;
      k5 := 0;
      k6 := 0;
      for k := 1 to ne do
        with de[k] do
          if (prod = prod_) and (da[indcode(code)].street = street_) then
          begin
            k3 := 0;
            inc(k5);
            for k2 := 1 to nc do
              if (dc[k2].code = code) and (dc[k2].shop = shop) then
              begin
                k3 := dc[k2].discount;
                break;
              end;
            if k3 > 0 then
            for k2 := 1 to nd do
              if (dd[k2].prod=prod_)and (dd[k2].shop = shop) then
              begin
                k3 := dd[k2].price * k3 div 100;
                inc(k6);
                if k6 > nmax then nmax := k6;
                break;
              end;
            k1 := k1 + k3;
           end;
        if k5 > 0 then
          writeln(f0,prod_,' ',street_,' ', k1{, ' ',k5,' ',k6});
      end;
   end;
  until nmax >= 2;

  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj96;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� ��������> <��� �����������>\m\|',9,2);
  TaskText('{C}:\q \M<��� �����������> <������ (� ���������)> <�������� ��������>\m\|',0,3);
  TaskText('{D}:\q \M<���� (� ������)> <������� ������> <�������� ��������>\m\|',9,4);
  TaskText('{E}:\q \M<�������� ��������> <������� ������> <��� �����������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������� ���� ��������, ���������� � {A}, � ������� ��������, ����������',0,0);
  TaskText('� {E}, ���������� ��������� ��������� ���� ������� (� ������ ������), ���������',0,0);
  TaskText('� ������ �������� ������������ ������� ���� �������� (������� ���������',0,0);
  TaskText('����� ����, ����� �������� ��������, ����� ��������� ��������� ���������',0,0);
  TaskText('������� � ������ ������). ��� ���������� ������� ������ �� ����� �������',0,0);
  TaskText('�������������. ���� �� ��������� ����� ������ �����������, �� �� ������',0,0);
  TaskText('���������� ������ 0. ���� ��� ��������� ���� \<���\:�������\> �����������',0,0);
  TaskText('���������� � ��������� �������, �� ������ �� ���� ���� �� ���������. ��������',0,0);
  TaskText('� ������ ���� \<���\:�������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ����������� ������� ����, � ��� ���������� ������� \= �� ���������',0,0);
  TaskText('��������� � ���������� �������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(4,f0,f1,f2,f3,f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',year,' ',code);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,code,' ',discount,' ',shop);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,price,' ',prod,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,shop,' ',prod,' ',code);
  for i := 1 to nyear do
  begin
    year_ := year1[iyear1[i]];
    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      k1 := 0;
      for k := 1 to ne do
        with de[k] do
          if (shop = shop_) and (da[indcode(code)].year = year_) then
          begin
            k3 := 0;
            for k2 := 1 to nd do
              if (dd[k2].prod = prod) and (dd[k2].shop = shop_) then
              begin
                k3 := dd[k2].price;
                break;
              end;
            for k2 := 1 to nc do
              if (dc[k2].code = code) and (dc[k2].shop = shop_) then
              begin
                k3 := k3 - k3 * dc[k2].discount div 100;
                break;
              end;
            k1 := k1 + k3;
          end;
      if k1 > 0 then
        writeln(f0, year_, ' ', shop_,' ', k1);
    end;
  end;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj97;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B}, {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<���������> <������� ������> <������-�������������>\m\|',9,2);
  TaskText('{C}:\q \M<������ (� ���������)> <�������� ��������> <��� �����������>\m\|',0,3);
  TaskText('{D}:\q \M<���� (� ������)> <�������� ��������> <������� ������>\m\|',9,4);
  TaskText('{E}:\q \M<�������� ��������> <��� �����������> <������� ������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������ ������-������������� � ������� ����������� ���������� ���������',0,0);
  TaskText('��������� (� ������ ������) ���� �������, ������������� � ������ ������',0,0);
  TaskText('� ������������� ���� ������������ (������� ��������� �������� ������,',0,0);
  TaskText('����� ��� �����������, ����� ��������� ��������� � ������ ������).',0,0);
  TaskText('��� ���������� ������� ������ �� ����� ������� �������������. ����',0,0);
  TaskText('�� ��������� ����� ������ �����������, �� �� ������ ���������� ������ 0. ����',0,0);
  TaskText('��� ��������� ���� \<������\:�����������\> ������ � �������� �����������,',0,0);
  TaskText('�� ���������� �� ���� ���� �� ���������. �������� � ������ ����',0,0);
  TaskText('\<������\:�����������\> �������� �� ����� ������ � ������������� �� ���������',0,0);
  TaskText('����� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('����� \= �� ����������� ����� ������������.',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(4,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,cat,' ',prod,' ',country);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,discount,' ',shop,' ',code);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,price,' ',shop,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,shop,' ',code,' ',prod);
  for i := 1 to ncountry do
  begin
    country_ := country1[icountry1[i]];
    for j := 1 to na do
    begin
      code_ := da[icode[j]].code;
      k1 := 0;
      for k := 1 to ne do
      with de[k] do
        if (code = code_) and (db[indprod(prod)].country = country_) then
        begin
          k3 := 0;
          for k2 := 1 to nd do
            if (dd[k2].prod = prod) and (dd[k2].shop = shop) then
            begin
              k3 := dd[k2].price;
              break;
            end;
          for k2 := 1 to nc do
            if (dc[k2].code = code_) and (dc[k2].shop = shop) then
            begin
              k3 := k3 - k3 * dc[k2].discount div 100;
              break;
            end;
          k1 := k1 + k3;
        end;
      if k1 > 0 then
        writeln(f0, country_,' ', code_,' ', k1);
    end;
  end;

  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj98;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {B}, {C}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({B}:\q \M<������-�������������> <������� ������> <���������>\m\|',9,2);
  TaskText('{C}:\q \M<������ (� ���������)> <��� �����������> <�������� ��������>\m\|',0,3);
  TaskText('{D}:\q \M<������� ������> <���� (� ������)> <�������� ��������>\m\|',9,4);
  TaskText('{E}:\q \M<��� �����������> <������� ������> <�������� ��������>\m\)',9,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������ ��������� ������� � ������� ��������, ���������� � {E}, ����������',0,0);
  TaskText('��������� ������ ������ �� ��� ������ ������ ���������, ��������� � ������',0,0);
  TaskText('�������� (������� ��������� �������� ���������, ����� �������� ��������,',0,0);
  TaskText('����� ��������� ������). ��� ���������� ������� ������ �� ����� �������',0,0);
  TaskText('�������������. ���� �� ��������� ����� ������ �����������, �� �� ������',0,0);
  TaskText('���������� ������ 0. ���� ��� ��������� ��������� ������� � �����-����',0,0);
  TaskText('�������� �� ���� ������, �� ��������� ������ ��� ���� ����',0,0);
  TaskText('\<���������\:�������\> ���������� ������ \-1. �������� � ������ ����',0,0);
  TaskText('\<���������\:�������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, � ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ��������� ��������� (����� � ���������� �������).',0,0);
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  DefDataStart2(4,f0,f1,f2,f3,f4);
  for i:=1 to nb do
    with db[i] do
      writeln(f1,country,' ',prod,' ',cat);
  for i:=1 to nc do
    with dc[i] do
      writeln(f2,discount,' ',code,' ',shop);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,prod,' ',price,' ',shop);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,code,' ',prod,' ',shop);
  for i := 1 to ncat do
  begin
    cat_ := cat1[icat1[i]];
//2015.08>
    if Cat3[icat1[i]] = 0 then //  ����������� ������!!
      continue;
//2015.08<
    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      k1 := 0;
      k5 := 0;
      for k := 1 to ne do
        with de[k] do
          if shop = shop_ then
          begin
            k5 := 1;
            break;
          end;
      if k5 = 0 then
      begin
//        writeln(f0, cat_, ' ', shop_, ' ', -100);
        continue;
      end;
      k5 := 0;
      for k := 1 to ne do
        with de[k] do
          if (shop = shop_) and (db[indprod(prod)].cat = cat_) then
          begin
            inc(k5);
            k3 := 0;
            for k2 := 1 to nc do
              if (dc[k2].code = code) and (dc[k2].shop = shop_) then
              begin
                k3 := dc[k2].discount;
                break;
              end;
            if k3 > 0 then
              for k2 := 1 to nd do
                if (dd[k2].prod = prod) and (dd[k2].shop = shop_) then
                begin
                  k3 := dd[k2].price * k3 div 100;
                  break;
                end;
            k1 := k1 + k3;
          end;
      if k5 = 0 then
        k1 := -1;
      writeln(f0, cat_, ' ', shop_, ' ', k1);
    end;
  end;



  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj99;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<��� �����������> <����� ����������> <��� ��������>\m\|',12,2);
  TaskText('{B}:\q \M<���������> <������-�������������> <������� ������>\m\|',12,3);
  TaskText('{D}:\q \M<������� ������> <�������� ��������> <���� (� ������)>\m\|',0,4);
  TaskText('{E}:\q \M<������� ������> <�������� ��������> <��� �����������>\m\)',0,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������ ��������� ������� � ������ ����� ���������� ���������� �������,',0,0);
  TaskText('��������� ����� ������ ��������� �� ����������� ���� �����������, ��������',0,0);
  TaskText('�� ������ ����� (������� ��������� �������� ���������, ����� �������� �����,',0,0);
  TaskText('����� �������� �������� � ����������� ���� ������). ���� ��� ��������� ����',0,0);
  TaskText('\<���������\:�����\> ����������� ���������� � ��������� �������, �� ������',0,0);
  TaskText('�� ���� ���� �� ���������. ���� ��� ��������� ���� \<���������\:�����\>',0,0);
  TaskText('������� ��������� ���������, ��������� ����� �� ����������� ����, �� ���������',0,0);
  TaskText('������ ��� ���� ����� ���������. �������� � ������ ������',0,0);
  TaskText('\<���������\:�����\:�������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ��������� � ���������� �������, ��� ���������� ��������',0,0);
  TaskText('��������� \= �� ��������� ����, � ��� ���������� ��������',0,0);
  TaskText('���� \= �� ��������� ��������� (����� � ���������� �������).',0,0);
  DefDataStart2(4,f0,f1,f2,f3,f4);
  repeat
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  Close(f0);
  Rewrite(f0);
  Close(f1);
  Rewrite(f1);
  Close(f2);
  Rewrite(f2);
  Close(f3);
  Rewrite(f3);
  Close(f4);
  Rewrite(f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,code,' ',street,' ',year);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,cat,' ',country,' ',prod);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,prod,' ',shop,' ',price);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,prod,' ',shop,' ',code);
  nmax := 0;
  for i := 1 to ncat do
  begin
    cat_ := cat1[icat1[i]];
    for j := 1 to nstreet do
    begin
      street_ := street1[istreet1[j]];
      nmin := 1000000;
      for k := 1 to ne do
      with de[k] do
        if (db[indprod(prod)].cat = cat_) and (da[indcode(code)].street = street_) then
          for k2 := 1 to nd do
            if (dd[k2].prod = prod) and (dd[k2].shop = shop) then
            begin
              if dd[k2].price < nmin then
                nmin := dd[k2].price;
              break;
            end;
      if nmin = 1000000 then
        continue;
      k6 := 0;
      for k := 1 to nshop do
      begin
        shop_ := shop1[ishop1[k]];
        k5 := 0;
        for k2 := 1 to ne do
        begin
          with de[k2] do
          if (db[indprod(prod)].cat = cat_) and (da[indcode(code)].street = street_)
            and (shop = shop_) then
          for k3 := 1 to nd do
            if (dd[k3].prod = prod) and (dd[k3].shop = shop_)
              and (dd[k3].price = nmin) then
              begin
                writeln(f0, cat_, ' ', street_,' ', shop_, ' ', nmin);
                k5 := 1;
                k6 := k6 + 1;
                if k6 > nmax then
                  nmax := k6;
                break;
              end;
           if k5 = 1 then break;
         end;
      end;
    end;
  end;
  until nmax>1;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;

procedure LinqObj100;
var
  i,j,k: integer;
begin
  CreateTask(Topic1);
  TaskText('���� ������������������ {A}, {B}, {D} � {E}, ���������� ��������� ����:',0,1);
  TaskText('\({A}:\q \M<����� ����������> <��� �����������> <��� ��������>\m\|',12,2);
  TaskText('{B}:\q \M<������� ������> <������-�������������> <���������>\m\|',12,3);
  TaskText('{D}:\q \M<�������� ��������> <���� (� ������)> <������� ������>\m\|',0,4);
  TaskText('{E}:\q \M<������� ������> <��� �����������> <�������� ��������>\m\)',0,5);
  TaskText('�������� ������������������� ������� � ��������� � ������ ��������� �������.',0,0);
  TaskText('��� ������ ������-������������� � ������� �������� ���������� �����������',0,0);
  TaskText('� ���������� ����� ��������, ��������� � ������ �������� ���� ��� �����',0,0);
  TaskText('�������, ������������� � ������ ������ (������� ��������� �������� ������,',0,0);
  TaskText('����� �������� ��������, ����� ��� �������� �����������, ��� ���, � �����',0,0);
  TaskText('��������� ��������� ������� �� ������ ������, ��������� � ������ ��������).',0,0);
  TaskText('���� ��� ��������� ���� \<������\:�������\> ����������� ���������� � ���������',0,0);
  TaskText('�������, �� ������ �� ���� ���� �� ���������. ���� ��� ��������� ����',0,0);
  TaskText('\<������\:�������\> ������� ��������� ������������ � ���������� ����� ��������,',0,0);
  TaskText('�� ��������� ������ ��� ���� ����� ������������. �������� � ������ ������',0,0);
  TaskText('\<������\:�������\:�����������\> �������� �� ����� ������ � �������������',0,0);
  TaskText('�� ��������� ����� � ���������� �������, ��� ���������� ��������',0,0);
  TaskText('����� \= �� ��������� ��������� (����� � ���������� �������),',0,0);
  TaskText('� ��� ���������� ��������� \= �� ����������� ����� ������������.',0,0);
  DefDataStart2(4,f0,f1,f2,f3,f4);
  repeat
  if not InitD15(Rand(20,100),Rand(20,100),Rand(6,50),Rand(6,50),Rand(6,100),
    Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8),Rand(4,8)) then exit;
  Close(f0);
  Rewrite(f0);
  Close(f1);
  Rewrite(f1);
  Close(f2);
  Rewrite(f2);
  Close(f3);
  Rewrite(f3);
  Close(f4);
  Rewrite(f4);
  for i:=1 to na do
    with da[i] do
      writeln(f1,street,' ',code,' ',year);
  for i:=1 to nb do
    with db[i] do
      writeln(f2,prod,' ',country,' ',cat);
  for i:=1 to nd do
    with dd[i] do
      writeln(f3,shop,' ',price,' ',prod);
  for i:=1 to ne do
    with de[i] do
      writeln(f4,prod,' ',code,' ',shop);
  nmax := 0;
  for i := 1 to ncountry do
  begin
    country_ := country1[icountry1[i]];
    for j := 1 to nshop do
    begin
      shop_ := shop1[ishop1[j]];
      year_ := 0;
      for k := 1 to ne do
      with de[k] do
        if (db[indprod(prod)].country = country_) and (shop = shop_) and
          (da[indcode(code)].year > year_) then
            year_ := da[indcode(code)].year;
      if year_ = 0 then
        continue;
      k6 := 0;
      for k := 1 to na do
      begin
        code_ := da[icode[k]].code;
        k5 := 0;
        k4 := 0;
        for k2 := 1 to ne do
        begin
          with de[k2] do
          if (db[indprod(prod)].country = country_) and (shop = shop_)
            and (da[indcode(code)].year = year_) and (code = code_) then
            for k3 := 1 to nd do
              if (dd[k3].prod = prod) and (dd[k3].shop = shop_) then
              begin
                k5 := k5 + dd[k3].price;
                k4 := k4 + 1;
                break;
              end;
         end;
         if k5 > 0 then
         begin
           writeln(f0,country_, ' ', shop_, ' ', year_, ' ', code_,' ',k5{,' ',k4});
           k6 := k6 + 1;
           if nmax < k6 then
             nmax := k6;
         end;
      end;
    end;
  end;
  until nmax>2;
  Close(f0);
  Close(f1);
  Close(f2);
  Close(f3);
  Close(f4);
  DefDataEnd2;
  SetTestCount(9);
end;






procedure InitTask(num: integer); stdcall;
begin
  case num of

  1:      ExamC1a(1);  //demo
  2:      ExamC1a(4);  //demo
  3:      ExamC2(1);
  4:      ExamC3(3);
  5:      ExamC3(4);
  6:      ExamC4(2);
  7:      ExamC5a(1); //demo
  8:      ExamC5b(4);
  9:      ExamC6(2);
  10:     ExamC7a(1); //demo
  11:     ExamC7b(4);
  12:     ExamC8(2);
//�������� = -12
  13:     ExamC9;  //demo
  14:     ExamC10(1);
  15:     ExamC10(2);
  16:     ExamC11;
  17:     ExamC11a(1);
  18:     ExamC11a(2);
  19:     ExamC12;
  20:     ExamC13(1);
  21:     ExamC13(2);
  22:     ExamC14; //demo
  23:     ExamC14a(1);
  24:     ExamC14a(2);
  25:     ExamC15b(2);              //26
  26:     ExamC15a(1); //demo       //25
  27:     ExamC16(2);               //28
  28:     ExamC16(1);               //27
  29:     ExamC17(1);
  30:     ExamC18a(1);              //31
  31:     ExamC17(2);               //30
  32:     ExamC18b(2); //demo
  33:     ExamC19(1);
  34:     ExamC19(2);
  35:     ExamC20(1);
  36:     ExamC20(2);
  37:     ExamC21a(1);  //demo
  38:     ExamC21b(2);
  39:     ExamC22(2);
  40:     ExamC22(1);
  41:     ExamC23b(2); //demo
  42:     ExamC23a(1);
  43:     ExamC24(2);
  44:     ExamC24(1);
  45:     ExamC25(1);
  46:     ExamC25(2);
  47:     ExamC26(2);                  //48
  48:     ExamC26(1);                  //47
  49:     ExamC27a(1);
  50:     ExamC27b(2);  //demo
  51:     ExamC28(1);
  52:     ExamC28(2);
  53:     ExamC29(2);                  //54
  54:     ExamC30b(2); //demo          //56
  55:     ExamC31(2);                  //58
  56:     ExamC32(2);                  //60
  57:     ExamC31(1);
  58:     ExamC32a;                    //59    //new
  59:     ExamC29(1);                  //53
  60:     ExamC30a(1);                 //55

  61:     ExamC33a(1);  //demo
  62:     ExamC33b(2);
  63:     ExamC34;
  64:     ExamC35;
  65:     ExamC36(1);
  66:     ExamC36(2);
  67:     ExamC37a(1);
  68:     ExamC38(1);                  
  69:     ExamC37b(2); //demo
  70:     ExamC38(2);
  71:     LinqObj71;
  72:     LinqObj72;
  73:     LinqObj73;
  74:     LinqObj74;
  75:     LinqObj75;
  76:     LinqObj76;
  77:     LinqObj77;
  78:     LinqObj78;
  79:     LinqObj79;
  80:     LinqObj80;
  81:     LinqObj81;
  82:     LinqObj82;
  83:     LinqObj83;
  84:     LinqObj84;
  85:     LinqObj85;
  86:     LinqObj86;
  87:     LinqObj87;
  88:     LinqObj88;
  89:     LinqObj89;
  90:     LinqObj90;
  91:     LinqObj91;
  92:     LinqObj92;
  93:     LinqObj93;
  94:     LinqObj94;
  95:     LinqObj95;
  96:     LinqObj96;
  97:     LinqObj97;
  98:     LinqObj98;
  99:     LinqObj99;
 100:     LinqObj100;
(*
  84:     ExamC40;
  85:     ExamC41;
  86:     ExamC42a(num-85); //demo
  87:     ExamC42b(num-85);
  88:     ExamC43; //demo
  89..90: ExamC44(num-88);
  91:     ExamC45;
  92:     ExamC46; //demo
  93:     ExamC47;
  94:     ExamC48;
  95:     ExamC48a;
  96:     ExamC48b;
  97:     ExamC49a(num-96); //demo
  98:     ExamC49b(num-96);
  99:     ExamC49c;
  100:    ExamC50;   //demo
*)







(*
  1,4:    ExamC1a(num);  //demo
  2,3:    ExamC1b(num);
  5..6:   ExamC2(num-4);
  7..10:  ExamC3(num-6);
  11..12: ExamC4(num-10);
  13:     ExamC5a(num-12); //demo
  14..16: ExamC5b(num-12);
  17..18: ExamC6(num-16);
  19:     ExamC7a(num-18); //demo
  20..22: ExamC7b(num-18);
  23..24: ExamC8(num-22);

  25:     ExamC9;  //demo
  26..27: ExamC10(num-25);
  28:     ExamC11;
  29..30: ExamC11a(num-28);
  31:     ExamC12;
  32..33: ExamC13(num-31);
  34:     ExamC14; //demo
  35..36: ExamC14a(num-34);
  37:     ExamC15a(num-36); //demo
  38:     ExamC15b(num-36);
  39..40: ExamC16(num-38);
  41..42: ExamC17(num-40);
  43:     ExamC18a(num-42);
  44:     ExamC18b(num-42); //demo
  45..46: ExamC19(num-44);
  47..48: ExamC20(num-46);
  49:     ExamC21a(num-48);  //demo
  50:     ExamC21b(num-48);
  51:     ExamC22(2);
  52:     ExamC22(1);
  53:     ExamC23b(2); //demo
  54:     ExamC23a(1);
  55:     ExamC24(2);
  56:     ExamC24(1);
  57..58: ExamC25(num-56);
  59..60: ExamC26(num-58);
  61:     ExamC27a(num-60);
  62:     ExamC27b(num-60);  //demo
  63..64: ExamC28(num-62);
  65..66: ExamC29(num-64);
  67:     ExamC30a(num-66);
  68:     ExamC30b(num-66); //demo
  69..70: ExamC31(num-68);
  71..72: ExamC32(num-70);
  73:     ExamC33a(num-72);  //demo
  74:     ExamC33b(num-72);
  75:     ExamC34;
  76:     ExamC35;
  77..78: ExamC36(num-76);
  79:     ExamC37a(1);
  80:     ExamC38(1);
  81:     ExamC37b(2); //demo
  82:     ExamC38(2);
  83:     LinqObj1; //demo
(*
  84:     ExamC40;
  85:     ExamC41;
  86:     ExamC42a(num-85); //demo
  87:     ExamC42b(num-85);
  88:     ExamC43; //demo
  89..90: ExamC44(num-88);
  91:     ExamC45;
  92:     ExamC46; //demo
  93:     ExamC47;
  94:     ExamC48;
  95:     ExamC48a;
  96:     ExamC48b;
  97:     ExamC49a(num-96); //demo
  98:     ExamC49b(num-96);
  99:     ExamC49c;
  100:    ExamC50;   //demo
*)
  end;
end;

procedure inittaskgroup;
begin
  if CurrentLanguage and lgCPP = 0 then exit;
  CreateGroup('STL7Mix', '���������� ��������� ������� ����������� ���������� C++',
    '�. �. �������, 2016, 2022', 'sdfghfdess#EnTopic<Using the C++ Standard Template Library>#fhubwxxcddgrgsweeebnssgg', 100, InitTask);
  CommentText('\P� ������ ������� ������ ����� ������ ��� ���������� ��������� ������, ����������');
  CommentText('�������� ������������������, � ����� ��� ���������� �����, � ������� ��������� ��������');
  CommentText('���������� ��������� �������� ������������������� (��� ��������������� ����� ����������� ���������).');
  CommentText('������ �������� ������������������ ���������� � ��������� �����.');
  CommentText('��� �������� ����� �������� ����� � ����������� ��������� ASCII; ��� �� ��������� ������ �������������� ��� ������');
  CommentText('���������� ������ � �������������� ����.');
  CommentText('\P������ ������� ������������������ ����������� � ��������� ������ �����,');
  CommentText('� ������ � ����� ������ ������� �����������, ���� �������� �� �������� �������� � ����������� ����� ����� ��������.');
  CommentText('��� �������� �������� ������ �������� ��������������. � �������� ����������� ����������� ������������ \I�����\i.');
  CommentText('\P���� � ������� ������ �������������� �������� ��� ��������� �������� ������, �� ��� ����������� � ������');
  CommentText('������ �������� ������ (����� ������� ������).');
//2013.05  CommentText('\P��� ����������� ��������� �����-������ ������ ������������ ������ \MReadAllLines\m � \MWriteAllLines\m');
//2013.05  CommentText('������ \MFile\m, ������������� � ������������ ���� \MSystem.IO\m.');

  Subgroup(Topic1);
  CommentText('\P� ������ ������� ������ ��������� ��������� ���������� ��������� (�� ���� �� �������)');
  CommentText('������������������� �� ���������� ������:');
  CommentText('\({A}:\q �������� � ������������, ���������� ����');
  CommentText('\<��� �����������\>, \<��� ��������\>, \<����� ����������\>;\|');
  CommentText('{B}:\q �������� � �������, ���������� ����');
  CommentText('\<������� ������\>, \<���������\>, \<������-�������������\>;\|');
  CommentText('{C}:\q ������ ��� ������������ � ��������� ���������, ���������� ����');
  CommentText('\<��� �����������\>, \<�������� ��������\>, \<������ (� ���������)\>;\|');
  CommentText('{D}:\q ���� ������� � ��������� ���������, ���������� ����');
  CommentText('\<������� ������\>, \<�������� ��������\>, \<���� (� ������)\>;\|');
  CommentText('{E}:\q �������� � �������� ������������ � ��������� ���������, ���������� ����');
  CommentText('\<��� �����������\>, \<������� ������\>, \<�������� ��������\>.\)');
  CommentText('\P������� ���������� ����� ��� ��������� ������ ������������������ ������������ � ������������ �������.');
  CommentText('\P� ������������������ {A} ��� �������� ����� ��������� �������� ���� \<��� �����������\>.');
  CommentText('� ������������������ {B} ��� �������� ����� ��������� �������� ���� \<������� ������\>.');
  CommentText('� ������������������ {C} ��� �������� ����� ��������� ���������� ����� \<��� �����������\>');
  CommentText('� \<�������� ��������\>. � ������������������ {D} ��� �������� ����� ��������� ����������');
  CommentText('����� \<������� ������\> � \<�������� ��������\>. ������������������ {E} ����� ���������');
  CommentText('���������� �������� (��� ������������� ��������, ��� ������� ���� � ��� �� �����������');
  CommentText('�������� � ����� � ��� �� �������� ��������� ���������� �������).');
  CommentText('\P��� �������� ����� ������������ � ��������� �������, ��������������');
  CommentText('� ������������������� {C}, {D} � {E}, ����������� ���������� � ������������������� {A} � {B}.');
  CommentText('��������� �������� ����� ������������ � ��������� �������, ��������������');
  CommentText('� ������������������� {A} � {B}, ����� ������������� � ��������� �������������������.');
  CommentText('����� ���������� \<�������\:�����\>, �������������� � ������������������ {E},');
  CommentText('����������� ������������ � � ������������������ {D}.');
  CommentText('���������� \<�����������\:�������\>, �������������� � ������������������ {E},');
  CommentText('����� ������������� � ������������������ {C}; ��� ��������, ��� ��� �������');
  CommentText('���������� ������ � ������ �������� ����������� �� ���� ������ (�.~�. ������ ���� ����� 0).');
  CommentText('\P���� ������������, ���� ��������, ������ � ���� �������� ������ �������;');
  CommentText('�������� ������ ����� � ��������� �� 5 �� 50. ������ ���� �������� ����������');
  CommentText('� �� �������� ��������. �������� ������� ����� ������ \<AAddd-dddd\>, ���');
  CommentText('�� ��������, ���������� �������� \<A\>, ������������� �����-���� ���������');
  CommentText('��������� �����, � �� ��������, ���������� �������� \<d\>, \= �����-���� �����.');
  CommentText('\P���� ����������� �������� �����, ������� ���� {p}, �� ������� {d} ���������, �� ������ ������ �� ������ �����');
  CommentText('������ ����������� �� ������� {p}~\*~{d}~/~100, ��� ������ \</\> ���������� �������� �������������� �������');
  CommentText('(����� �������, ��� ���������� ������� ������ ������� �������������).');

//  testInitd15(50,50,50,50,50,6,7,6,7,6);
end;

exports inittaskgroup;

begin
end.

