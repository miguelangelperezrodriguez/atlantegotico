// NICEA                       XVI

unit frmPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  esqAtlante, esqgotico,typeKier;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MostrarTorre;
    procedure MostrarEstrella;
    procedure MostrarGematria;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses typeAtlanteGotico;

procedure dummy(arc:descarcano);
begin
end;

procedure mostrar (arc : descarcano);
begin
  WriteLn(arc.tarotkabala);
  WriteLn(arc.kier1,' ',arc.kier2,' ',arc.kier3);
end;

var
  l1  : tlarcanos;
  arc : descarcano;
  larc : array [posentrada] of descarcano;

  nombreentrada : string;
  fecha1 : TDate;

  torreGotica1 : torreGotica;
  estrellaGotica1 : estrellaGotica;
  nrosgematriaAtl : tnrosgematria;

{ TForm1 }

procedure CargarArcanos();
var
  i : posentrada;
begin
  for i:=1 to 17 do
  begin
    buscarArcanoKier(l1,i,arc,@dummy);
    larc[i].kabala1:=arc.kabala1;
    larc[i].kabala2:=arc.kabala2;
    larc[i].tarotkabala:=arc.tarotkabala;
    larc[i].kier1:=arc.kier1;
    larc[i].kier2:=arc.kier2;
    larc[i].kier3:=arc.kier3;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : posentrada;
  descrip : string;
begin

// Para mostrar datos en un Memo
  inicializarlista(l1);
  CargarArcanos();

  for i:=1 to 17 do
  begin
    // Mostramos en memo
    Memo1.Lines.Add (IntToStr(i));
    buscarArcanoKier(l1,i,arc,@dummy);
    descrip:=IntToStr(arc.kabala1) + ',' + IntToStr(arc.kabala2) + ',' +
      IntToStr(arc.tarotkabala) + ',' + IntToStr(arc.kier1) + ',' +
      IntToStr(arc.kier2) + ',' + IntToStr(arc.kier3);
    Memo1.Lines.Add(descrip);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var auxfecha : string;
    partesfecha : TStringArray;
    sdia,smes,sanyo : string;
    idia,imes,ianyo : integer;

begin
  nombreentrada:=Edit1.Text;
  //nombreentrada:='Maria del Carmen Rodriguez Rodriguez';
  auxfecha:=MaskEdit1.texT;
  try
    partesfecha:=auxfecha.Split('-');
    sdia:=Trim(partesfecha[0]);
    smes:=Trim(partesfecha[1]);
    sanyo:=Trim(partesfecha[2]);
    idia:=StrToInt(sdia);
    imes:=StrToInt(smes);
    ianyo:=StrToInt(sanyo);
    fecha1:=EncodeDate(ianyo,imes,idia);
  except
        ShowMessage('Fecha no valida');
  end;

  TorreGoticaFechaNacimientoEstrella(fecha1,nombreentrada,torreGotica1,latlante);
  EstrellaGoticadeTorre(torreGotica1,estrellaGotica1,latlante);
  // Recogemos finalmente los nros. de gematria
  ObtenerGematria (nrosgematriaAtl);

  MostrarGematria;
  Memo2.Lines.Add('');
  MostrarTorre;
  Memo2.Lines.Add('');
  MostrarEstrella;
  Memo2.Lines.Add('');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo2.Lines.Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    Memo2.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Memo2.Lines.LoadFromFile(OpenDialog1.Filename);
end;

procedure TForm1.Edit2Change(Sender: TObject);
var
  bok : boolean;
  nrokier : integer;
  descripcion : string;
begin
  bok:=TryStrToInt(Edit2.Text,nrokier);
  if bok and (nrokier>0) and (nrokier<=78) then
  begin
    descripcion:=descarcanoKier[nrokier];
    Label4.Caption:=descripcion;
  end;
end;

procedure TForm1.MostrarTorre;
var
  descripcion : string;
begin
  // Mostramos los datos
  descripcion:='Verde-Talento : ' + IntToStr(torreGotica1[Verde,1]) + ';' +
    IntToStr(torreGotica1[Verde,2]) + ';' + IntToStr(torreGotica1[Verde,3]);
  Memo2.Lines.Add(descripcion);

  descripcion:='Rojo-Alma : ' + IntToStr(torreGotica1[Rojo,1]) + ';' +
    IntToStr(torreGotica1[Rojo,2]) + ';' + IntToStr(torreGotica1[Rojo,3]);
  Memo2.Lines.Add(descripcion);

  descripcion:='Azul-Personalidad : ' + IntToStr(torreGotica1[Azul,1]) + ';' +
    IntToStr(torreGotica1[Azul,2]) + ';' + IntToStr(torreGotica1[Azul,3]);
  Memo2.Lines.Add(descripcion);

  descripcion:='Amarillo-Destino : ' + IntToStr(torreGotica1[Amarillo,1]) + ';' +
    IntToStr(torreGotica1[Amarillo,2]) + ';' + IntToStr(torreGotica1[Amarillo,3]);
  Memo2.Lines.Add(descripcion);

  descripcion:='Negro-Potencial : ' + IntToStr(torreGotica1[Negro,1]) + ';' +
    IntToStr(torreGotica1[Negro,2]) + ';' + IntToStr(torreGotica1[Negro,3]);
  Memo2.Lines.Add (descripcion);

end;

procedure TForm1.MostrarEstrella;
var
  i : integer;
  snrosocultos : string;
begin
  snrosocultos:='';
  for i:=1 to MaxOcultos do
     if (estrellaGotica1[i]<>0) then
       snrosocultos:=snrosocultos+ IntToStr(estrellaGotica1[i]) + ';';
   if  snrosocultos<>'' then
   begin
     Memo2.Lines.Add ('Nros Estrella : ');
     Memo2.Lines.Add (snrosocultos);
   end;
end;

procedure TForm1.MostrarGematria;
begin
  Memo2.Lines.Add('Talento : ' + IntToStr(nrosgematriaAtl[Verde]));
  Memo2.Lines.Add('Alma : '    + IntToStr(nrosgematriaAtl[Rojo]));
  Memo2.Lines.Add('Personalidad : ' + IntToStr(nrosgematriaAtl[Azul]));
  Memo2.Lines.Add('Destino : ' + IntToStr(nrosgematriaAtl[Amarillo]));
  Memo2.Lines.Add('Potenicial : ' + IntToStr(nrosgematriaAtl[Negro]));
end;

end.

