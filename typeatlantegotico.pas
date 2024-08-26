unit typeAtlanteGotico;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

const
  loco = 22;
  MaxOcultos=11;


type


  posentrada=1..17;
  tarcano=1..22;
  tarcanokier=0..78;
  tidxalcanzables = 1..44;

  colorGotico = (Verde,Rojo,Azul,Amarillo,Negro);
  // Los arcanos conseguidos
  tcjtokiertrip   = array[1..3] of tarcanokier;
  torreGotica = array [Verde..Negro] of tcjtokiertrip;
  // Los arcanos ocultos conseguidos
  estrellaGotica = array[1..MaxOcultos] of tarcanokier;


  descarcano = record
    // tarcano        0  : Varios caminos .
    // tarcano        22 : Arcano LOCO
    kabala1,kabala2                 : tarcano;
    tarotkabala                     : tarcano;
    kier1,kier2,kier3               : tarcanokier;
  end;

  // Descripciones
  tdescrp = string[50];
  tlarcanos = array [tarcano] {clave} of descarcano;
  lnombresmarsella = array [tarcano] of string;
  lnombreskier = array [tarcanokier] of string;

  tcjtoKier = set of tarcanokier;

  tproc = procedure (valor : descarcano);

implementation

end.

