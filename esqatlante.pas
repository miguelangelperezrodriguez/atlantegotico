
// ESTRUCTURAS . PROCEDIMIENTOS.
//
// Diseño en espiral
//
// Planificacion
//
// ESTRUCTURA DE ARCANOS ESCALONADOS. GUARDAR SI NO ESTA GENERADO.
// PROCEDIMIENTOS :
//   ELEGIR UN ARCANO ATLANTE Y OBTENER SEGÚN CÁBALA ARCANO MARSELLA Y
//   KIER. TAMBIEN SE GENERA SI NO LO ESTA.
//
//
//  Análisis de riesgos.
//
//  Estructura de Kabala. P. ej. 4.6.      IX. Puede no tener , habria que
//  reducir el numero.
//  Calculo del KIER . Con Arcanos del I al XVII el mayor KIER es 70
//  Lista de los arcanos KIER. Array.
//
//  Ingenieria
//  "divide y venceras"
//  * Generar 1,2,4,6,8,10,12,14,16 (Pares + 1)
//  * Generar Impares sin el 1. 3,5,7,9,11,13,15,17
//  Evaluación.

unit esqAtlante;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,esqgotico,typeAtlanteGotico;



var
  tarcanoskiernoalcanzables : tcjtoKier;
  tlarcanosalcanzables : array [tidxalcanzables] of tarcanokier;



  latlante : tlarcanos;

  procedure inicializarlista (var l: tlarcanos);
  procedure buscarArcanoKier (l : tlarcanos; nro : integer; var arcano:descarcano;
                              p : tproc);


implementation

uses esqgoticoocultos;



procedure inicializarlista (var l : tlarcanos);
var
  i : tarcano;
  j : tarcanokier;
  idx : integer;

begin
  {clave}
  for i:=1 to 17 do
    // Ponemos la clave
    with l[i] do
      begin
        case i of
             1 :
               begin
                 kabala1:=1;kabala2:=2;
                 tarotkabala:=loco;
                 kier1:=3;kier2:=4;
                 {kier1+kier2+kabala1}
                 kier3:=8;
               end;
             2 :
               begin
                 kabala1:=3;kabala2:=4;
                 tarotkabala:=loco;
                 kier1:=7;kier2:=9;kier3:=19;
               end;
             4 :
               begin
                 kabala1:=5;kabala2:=6;
                 tarotkabala:=8;
                 kier1:=11;kier2:=15;kier3:=31;
               end;
             6 :
               begin
                 kabala1:=7;kabala2:=8;
                 tarotkabala:=16;
                 kier1:=15;kier2:=21;kier3:=43;
               end;
             8 :
               begin
                 kabala1:=9;kabala2:=10;
                 tarotkabala:=21;
                 kier1:=19;kier2:=27;kier3:=55;
               end;
             10 :
               begin
                 kabala1:=2;kabala2:=3;
                 tarotkabala:=3;
                 kier1:=23;kier2:=33;kier3:=58;
               end;
             12 :
               begin
                 kabala1:=4;kabala2:=5;
                 tarotkabala:=11;
                 kier1:=27;kier2:=39;kier3:=70;
               end;
             14 :
               begin
                 kabala1:=6;kabala2:=7;
                 tarotkabala:=13;
                 kier1:=31;kier2:=45;kier3:=76;
               end;
             16 :
               begin
                 kabala1:=8;kabala2:=9;
                 tarotkabala:=19;
                 kier1:=35;kier2:=51;kier3:=59;
               end;
             3 :
               begin
                 kabala1:=1;kabala2:=2;
                 tarotkabala:=loco;
                 kier1:=10;
                 {kier1+kier1 del arcano 1 que solapa}
                 {kieranterior + kier1 del arcano 2 que solapa}
                 kier2:=13;
                 kier3:=20;
               end;
             5 :
               begin
                 kabala1:=2;kabala2:=4;
                 tarotkabala:=5;
                 kier1:=18;
                 kier2:=25;
                 kier3:=36;
               end;
             7 :
               begin
                 kabala1:=4;kabala2:=6;
                 tarotkabala:=9;
                 kier1:=26;
                 kier2:=37;
                 kier3:=52;
               end;
             9 :
               begin
                 kabala1:=6;kabala2:=8;
                 tarotkabala:=15;
                 kier1:=34;
                 kier2:=49;
                 kier3:=68;
               end;
             11 :
               begin
                 kabala1:=8;kabala2:=10;
                 tarotkabala:=20;
                 kier1:=42;
                 kier2:=61;
                 kier3:=12;
               end;
             13 :
               begin
                 kabala1:=10;kabala2:=3;
                 tarotkabala:=loco;
                 kier1:=50;
                 kier2:=73;
                 kier3:=5;
               end;
             15 :
               begin
                 kabala1:=3;kabala2:=5;
                 tarotkabala:=7;
                 kier1:=58;
                 kier2:=68;
                 kier3:=8;
               end;
             17 :
               begin
                 kabala1:=5;kabala2:=7;
                 tarotkabala:=loco;
                 kier1:=66;
                 kier2:=6;
                 kier3:=32;
               end;
        end;
      end;

  for j:=1 to 78 do
   tarcanoskiernoalcanzables:=tarcanoskiernoalcanzables + [j];

  idx:=1;
  for i:=1 to 17 do
  begin
    if (l[i].kier1 in tarcanoskiernoalcanzables) then
    begin
      tarcanoskiernoalcanzables:=tarcanoskiernoalcanzables-[l[i].kier1];
      tlarcanosalcanzables[idx]:=l[i].kier1;
      idx:=idx+1;
    end;
    if (l[i].kier2 in tarcanoskiernoalcanzables) then
    begin
      tarcanoskiernoalcanzables:=tarcanoskiernoalcanzables-[l[i].kier2];
      tlarcanosalcanzables[idx]:=l[i].kier2;
      idx:=idx+1;
    end;
    if (l[i].kier3 in tarcanoskiernoalcanzables) then
    begin
      tarcanoskiernoalcanzables:=tarcanoskiernoalcanzables-[l[i].kier3];
      tlarcanosalcanzables[idx]:=l[i].kier3;
      idx:=idx+1;
    end;
  end;

end;

{ ARCANOS KIER DEL 1 AL 18 }
procedure buscarArcanoKier (l : tlarcanos; nro : integer; var arcano:descarcano;
                            p : tproc);
begin
  if (nro>=Low(posentrada)) and (nro<=High(posentrada)) then
  begin
     arcano:=l[nro];
     p(arcano);
  end;
end;

procedure recorrerymodificar (l : tlarcanos;p : tproc);
var
  i : posentrada;
begin
  for i:=Low(posentrada) to High(posentrada) do
    begin
      p(l[i]);
    end;
end;

var
  nombreentrada : string;
  fecha1 : TDateTime;
begin
  // EJEMPLO
  inicializarlista(latlante);

end.

