// LISTAS SALTANTES.
// Son listas de arcanos KIER y situados en cuatro lineas temporales
// que estan conectadas a veces entre si.

// Este esquema lleva ATLANTE -> GOTICO

unit esqgotico;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,NumerologiaEstrella,typeAtlanteGotico;

  type
    tnrosgematria = array[colorGotico] of integer;

  procedure TorreGoticaFechaNacimientoEstrella (fecha : TDate;nombre:string;
            var torre : torreGotica; latlante : tlarcanos);
  procedure EstrellaGoticadeTorre (torre : torreGotica;var estrella : estrellaGotica;
                                  latlante : tlarcanos);
  procedure ObtenerGematria (var nros: tnrosgematria);

  var
    nrotalento,nroalma,nropersonalidad,nrodestino,nropotencial : integer;
    nrosgematria : tnrosgematria;

implementation

  uses esqgoticoocultos;

  procedure TorreGoticaFechaNacimientoEstrella (fecha : TDate;nombre:string;
             var torre : torreGotica;latlante:tlarcanos);
    var
      dia,mes,anyo : Word;
      // Numeros de la persona
      nclave : Word;

  begin
    nclave:=0;

    DecodeDate(fecha,anyo,mes,dia);

    NumeroTalento(dia,mes,anyo,nclave);
    nrotalento:=nclave;

    torre[Verde,1]:=latlante[nclave].kier1;
    torre[Verde,2]:=latlante[nclave].kier2;
    torre[Verde,3]:=latlante[nclave].kier3;

    NumeroAlma(nombre,nclave);
    nroalma:=nclave;

    torre[Rojo,1]:=latlante[nclave].kier1;
    torre[Rojo,2]:=latlante[nclave].kier2;
    torre[Rojo,3]:=latlante[nclave].kier3;

    NumeroPersonalidad (nombre,nclave);
    nropersonalidad:=nclave;

    torre[Azul,1]:=latlante[nclave].kier1;
    torre[Azul,2]:=latlante[nclave].kier2;
    torre[Azul,3]:=latlante[nclave].kier3;

    NumeroDestino (nombre,nclave);
    nrodestino:=nclave;

    torre[Amarillo,1]:=latlante[nclave].kier1;
    torre[Amarillo,2]:=latlante[nclave].kier2;
    torre[Amarillo,3]:=latlante[nclave].kier3;

    NumeroPotencial (dia,mes,anyo,nombre,nclave);
    nropotencial:=nclave;

    torre[Negro,1]:=latlante[nclave].kier1;
    torre[Negro,2]:=latlante[nclave].kier2;
    torre[Negro,3]:=latlante[nclave].kier3;

  end;

  procedure EstrellaGoticadeTorre (torre : torreGotica;var estrella : EstrellaGotica;
             latlante:tlarcanos);
  begin
    EstrellaGoticaOculta (torre,estrella,latlante);
  end;

  procedure ObtenerGematria (var nros: tnrosgematria);
  begin
    nros[Verde]:=nrotalento;
    nros[Rojo]:=nroalma;
    nros[Azul]:=nropersonalidad;
    nros[Amarillo]:=nrodestino;
    nros[Negro]:=nropotencial;
  end;

end.

