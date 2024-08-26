unit NumerologiaEstrella;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;


// VOCALES
procedure NumeroAlma (nombre : string ;var clave : Word);
// CONSONANTES
procedure NumeroPersonalidad (nombre : string;var clave : Word);
// TODAS LAS LETRAS
procedure NumeroDestino (nombre : string ;var clave : Word);
// SUMA FECHA
procedure NumeroTalento (dia,mes,anyo : Word;var clave : Word);
// FECHA Y LETRAS
procedure NumeroPotencial (dia,mes,anyo : Word;nombre : string ;
                                        var clave : Word);

implementation

  function EsVocal (c : char) : boolean;
  var
    bvocal : boolean;
  begin

        case c of
          'A' : bvocal:=true;
          'E' : bvocal:=true;
          'I' : bvocal:=true;
          'O' : bvocal:=true;
          'U' : bvocal:=true;
          else
            bvocal:=false;
        end;
        EsVocal:=bvocal;
  end;

  function EsConsonante (c : char) : boolean;
  var
    bconsonante : boolean;
  begin

        case c of
          'B' : bconsonante:=true;
          'C' : bconsonante:=true;
          'D' : bconsonante:=true;
          'F' : bconsonante:=true;
          'G' : bconsonante:=true;
          'H' : bconsonante:=true;
          'J' : bconsonante:=true;
          'K' : bconsonante:=true;
          'L' : bconsonante:=true;
          'M' : bconsonante:=true;
          'N' : bconsonante:=true;
          'P' : bconsonante:=true;
          'Q' : bconsonante:=true;
          'R' : bconsonante:=true;
          'S' : bconsonante:=true;
          'T' : bconsonante:=true;
          'V' : bconsonante:=true;
          'W' : bconsonante:=true;
          'X' : bconsonante:=true;
          'Y' : bconsonante:=true;
          'Z' : bconsonante:=true;
          else
            bconsonante:=false;
        end;
        EsConsonante:=bconsonante;
  end;

  function ValorLetra (c : char) : integer;
  var
    valor : integer;
  begin

    case c of
      'A' : valor:=1;
      'B' : valor:=2;
      'C' : valor:=3;
      'D' : valor:=4;
      'E' : valor:=5;
      'F' : valor:=6;
      'G' : valor:=7;
      'H' : valor:=8;
      'I' : valor:=9;
      'J' : valor:=1;
      'K' : valor:=2;
      'L' : valor:=3;
      'M' : valor:=4;
      'N' : valor:=5;
      'O' : valor:=6;
      'P' : valor:=7;
      'Q' : valor:=8;
      'R' : valor:=9;
      'S' : valor:=1;
      'T' : valor:=2;
      'U' : valor:=3;
      'V' : valor:=4;
      'W' : valor:=5;
      'X' : valor:=6;
      'Y' : valor:=7;
      'Z' : valor:=8;
      else
        valor:=0;
    end;
    if (c='Ñ') or (c='ñ') then
      valor:=5;

    ValorLetra:=valor;
  end;

  // FECHA
  procedure NumeroTalento (dia,mes,anyo : Word;var clave : Word);
  var
    sumadia,sumames,sumaanyo : Word;
    sumafecha : Word;
  begin
    if dia>=10 then
      sumadia:=dia div 10 + (dia mod 10)
    else
      sumadia:=dia;
    if mes>=10 then
      sumames:=mes div 10 + (mes mod 10)
    else
      sumames:=mes;
    sumaanyo:=0;
    sumaanyo := sumaanyo + anyo div 1000;
    anyo:=anyo-((anyo div 1000) * 1000);
    sumaanyo := sumaanyo + anyo div 100;
    anyo:=anyo-((anyo div 100) * 100);
    sumaanyo := sumaanyo + anyo div 10;
    anyo:=anyo-((anyo div 10)*10);
    sumaanyo := sumaanyo + anyo mod 10;

    sumafecha:=sumadia+sumames+sumaanyo;

    if not (sumafecha mod 11=0) then
      sumafecha:=((sumafecha-1) mod 17) + 1;


    clave:=sumafecha;
  end;

  // VOCALES
  procedure NumeroAlma (nombre : string ;var clave : Word);
  var nommay : string;
      i : integer;
      letra: char;
      suma : integer;
  begin
    nommay:=UpperCase(nombre);
    suma:=0;

    for i:=1 to Length(nombre) do
      begin
        letra:=nommay[i];
        if EsVocal(letra) then
          suma:=suma+ValorLetra(letra);
      end;

     if not (suma mod 11=0) then
      suma:=((suma-1) mod 17) + 1;

    clave:=suma;
  end;

  // CONSONANTES
  procedure NumeroPersonalidad (nombre : string ;var clave : Word);
  var nommay : string;
      i : integer;
      letra : char;
      suma : integer;
  begin
    nommay:=UpperCase(nombre);
    suma:=0;
    for i:=1 to Length(nombre) do
      begin
        letra:=nommay[i];
        if EsConsonante(letra) then
          suma:=suma+ValorLetra(letra);
      end;

    if not (suma mod 11=0) then
      suma:=((suma-1) mod 17) + 1;

    clave:=suma;
  end;

  // TODAS LAS LETRAS
  procedure NumeroDestino (nombre : string ;var clave : Word);
  var nommay : string;
      i : integer;
      letra : char;
      suma : integer;
  begin
    nommay:=UpperCase(nombre);
    suma:=0;
    for i:=1 to Length(nombre) do
      begin
        letra:=nommay[i];
        suma:=suma+ValorLetra(letra);
      end;

     if not (suma mod 11=0) then
      suma:=((suma-1) mod 17) + 1;

    clave:=suma;
  end;

  // FECHA Y NOMBRE
  procedure NumeroPotencial (dia,mes,anyo : Word;nombre : string ;var clave : Word);
  var nommay : string;
      sumadia,sumames,sumaanyo : Word;
      sumafecha : Word;
      suma : integer;
      i : integer;
      letra : char;
  begin
    nommay:=UpperCase(nombre);
    suma:=0;

    if dia>=10 then
      sumadia:=dia div 10 + (dia mod 10)
    else
      sumadia:=dia;
    if mes>=10 then
      sumames:=mes div 10 + (mes mod 10)
    else
      sumames:=mes;
    sumaanyo:=0;
    sumaanyo := sumaanyo + anyo div 1000;
    anyo:=anyo-((anyo div 1000) * 1000);
    sumaanyo := sumaanyo + anyo div 100;
    anyo:=anyo-((anyo div 100) * 100);
    sumaanyo := sumaanyo + anyo div 10;
    anyo:=anyo-((anyo div 10)*10);
    sumaanyo := sumaanyo + anyo mod 10;

    sumafecha:=sumadia+sumames+sumaanyo;

    for i:=1 to Length(nombre) do
      begin
        letra:=nommay[i];
        suma:=suma+ValorLetra(letra);
      end;

    suma:=suma+sumafecha;

    if not (suma mod 11=0) then
      suma:=((suma-1) mod 17) + 1;

    clave:=suma;

  end;



begin
end.

