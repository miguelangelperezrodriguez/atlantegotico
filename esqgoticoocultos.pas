unit esqgoticoocultos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,esqAtlante,esqgotico,typeAtlanteGotico;

var
  idxlista : integer;

procedure EstrellaGoticaOculta (torre : torreGotica;var estrella : EstrellaGotica;latlante:tlarcanos);

implementation

procedure EstrellaGoticaOculta (torre : torreGotica;var estrella : EstrellaGotica;latlante:tlarcanos);
var
  auxkab1,auxkab2,auxkab3 :integer;
  auxkier1,auxkier2,auxkier3 : integer;
  auxverde,auxrojo,auxazul,auxamarillo,auxnegro : integer;
begin
  // Iniciamos el indice
  idxlista:=1;

  auxkab1:=0;
  // Nro talento

  // Recorremos KABALA
  auxkab1:=latlante[nrotalento].kabala1+latlante[nropotencial].kabala1+
    latlante[nrodestino].kabala1+latlante[nropersonalidad].kabala1+
    latlante[nroalma].kabala1;
  auxkab2:=0;
  auxkab2:=latlante[nrotalento].kabala2+latlante[nropotencial].kabala2+
    latlante[nrodestino].kabala2+latlante[nropersonalidad].kabala2+
    latlante[nroalma].kabala2;
  auxkab3:=0;
  auxkab3:=latlante[nrotalento].tarotkabala+latlante[nropotencial].tarotkabala+
    latlante[nrodestino].tarotkabala+latlante[nropersonalidad].tarotkabala+
    latlante[nroalma].tarotkabala;
  if not (auxkab1 mod 11=0) then
     auxkab1:=((auxkab1-1) mod 78) + 1;
  if not (auxkab2 mod 11=0) then
     auxkab2:=((auxkab2-1) mod 78) + 1;
  if not (auxkab3 mod 11=0) then
     auxkab3:=((auxkab3-1) mod 78) + 1;

  if auxkab1 in tarcanoskiernoalcanzables then
  begin
    estrella[idxlista]:=auxkab1;
    idxlista:=idxlista+1;
  end;
  if auxkab2 in tarcanoskiernoalcanzables then
  begin
    estrella[idxlista]:=auxkab2;
    idxlista:=idxlista+1;
  end;
  if auxkab3 in tarcanoskiernoalcanzables then
  begin
    estrella[idxlista]:=auxkab3;
    idxlista:=idxlista+1;
  end;


    // Recorremos KIER
    auxkier1:=0;
    // Nro talento
    auxkier1:=latlante[nrotalento].kier1+latlante[nropotencial].kier1+
      latlante[nrodestino].kier1+latlante[nropersonalidad].kier1+
      latlante[nroalma].kier1;
    auxkier2:=0;
    auxkier2:=latlante[nrotalento].kier2+latlante[nropotencial].kier2+
      latlante[nrodestino].kier2+latlante[nropersonalidad].kier2+
      latlante[nroalma].kier2;
    auxkier3:=0;
    auxkier3:=latlante[nrotalento].kier3+latlante[nropotencial].kier3+
      latlante[nrodestino].kier3+latlante[nropersonalidad].kier3+
      latlante[nroalma].kier3;
    if not (auxkier1 mod 11=0) then
       auxkier1:=((auxkier1-1) mod 78) + 1;
    if not (auxkier2 mod 11=0) then
       auxkier2:=((auxkier2-1) mod 78) + 1;
    if not (auxkier3 mod 11=0) then
       auxkier3:=((auxkier3-1) mod 78) + 1;

    if auxkier1 in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxkier1;
      idxlista:=idxlista+1;
    end;
    if auxkier2 in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxkier2;
      idxlista:=idxlista+1;
    end;
    if auxkier3 in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxkier3;
      idxlista:=idxlista+1;
    end;

   // Recorremos las torres
   // Verde
   auxverde:=0;
   auxverde:=torre[Verde,1]+torre[Verde,2]+torre[Verde,3];
   auxrojo:=torre[Rojo,1]+torre[Rojo,2]+torre[Rojo,3];
   auxazul:=torre[Azul,1]+torre[Azul,2]+torre[Azul,3];
   auxamarillo:=torre[Amarillo,1]+torre[Amarillo,2]+torre[Amarillo,3];
   auxNegro:=torre[Negro,1]+torre[Negro,2]+torre[Negro,3];

    if not (auxverde mod 11=0) then
        auxverde:=((auxverde-1) mod 78) + 1;
    if not (auxrojo mod 11=0) then
        auxrojo:=((auxrojo-1) mod 78) + 1;
    if not (auxazul mod 11=0) then
        auxazul:=((auxazul-1) mod 78) + 1;
    if not (auxamarillo mod 11=0) then
        auxamarillo:=((auxamarillo-1) mod 78) + 1;
    if not (auxnegro mod 11=0) then
        auxnegro:=((auxnegro-1) mod 78) + 1;

    if auxverde in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxverde;
      idxlista:=idxlista+1;
    end;
    if auxrojo in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxrojo;
      idxlista:=idxlista+1;
    end;
    if auxazul in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxazul;
      idxlista:=idxlista+1;
    end;
    if auxamarillo in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxamarillo;
      idxlista:=idxlista+1;
    end;
    if auxnegro in tarcanoskiernoalcanzables then
    begin
      estrella[idxlista]:=auxnegro;
      idxlista:=idxlista+1;
    end;

end;

end.

