unit Archivo;
interface
uses
  SysUtils;
const
   Datos = 'JUGADORES.dat';
   control = 'JUGADORES.con';
   posnula = -1;
   Clavenula='*';

type

  tiporegdato = record
    Nick: String[20];
    Clave: string[10];
    ApellidoyNombre: string[10];
    FechaAlta: TDateTime;
    IDusuario:string[10];
    Foto: string[100];
    Email: string[20];
    Estado:char;
    FechaHoraUltimaConexion: TDateTime;
  end;

  tiporegcontrol = record
    ultimo: integer;
    ultimoIDinterno: integer;
  end;




  ArcControl = file of tiporegcontrol;
  ArcDatos = file of tiporegdato;


  Mearcjugador = record
    D: ArcDatos;
    C: ArcControl;
  end;

   

var
  tipodatos: Mearcjugador;



Procedure crearmeArc(var tipodatos: Mearcjugador;ruta:string );
Procedure abrirmeArc(var tipodatos: Mearcjugador);
Procedure cerrarmeArc(var tipodatos: Mearcjugador);
Procedure incertarmeArc(Var tipodatos: Mearcjugador; pos: integer;reg: tiporegdato);
Procedure eliminarmeArc(var tipodatos: Mearcjugador; pos: integer);
Procedure modificarmeArc(var tipodatos: Mearcjugador; pos: integer;reg: tiporegdato);
function capturarmeArc(var tipodatos: Mearcjugador; pos: integer):tiporegdato;
Procedure eliminarrepetidomeArc(var tipodatos: Mearcjugador);
Function primeromeArc(var tipodatos: Mearcjugador): integer;
Function ultimomeArc(var tipodatos: Mearcjugador): integer;
Function procimomeArc(var tipodatos: Mearcjugador; pos:integer): integer;
Function anteriormeArc(var tipodatos: Mearcjugador; pos:integer): integer;
Function buscarmeArc(var tipodatos: Mearcjugador;clave:string;var pos: integer): boolean;   //no usarlo
Function vaciomeArc(var tipodatos: Mearcjugador): boolean;
Function capuraUltimoIDArc(var tipodatos: Mearcjugador): integer;


 implementation
 
Procedure crearmeArc(var tipodatos: Mearcjugador;ruta:string );
Var
  RC: tiporegcontrol;
Begin
  assign(tipodatos.D, RUTA + Datos);
  assign(tipodatos.C, RUTA + control);
{$I-}
  reset(tipodatos.D);
  If IoResult <> 0 then
    Rewrite(tipodatos.D);
  reset(tipodatos.C);
  If IoResult <> 0 then
  begin
    Rewrite(tipodatos.C);
    RC.ultimoIDinterno := 0;
    RC.ultimo := posnula;
    seek(tipodatos.C, 0);
    Write(tipodatos.C, RC);
  end;
  Close(tipodatos.C);
  Close(tipodatos.D);
{$I+}
end;

Procedure abrirmeArc(var tipodatos: Mearcjugador);
Begin
  reset(tipodatos.D);
  reset(tipodatos.C);
end;

Procedure cerrarmeArc(var tipodatos: Mearcjugador);
Begin
    Close(tipodatos.D);
    Close(tipodatos.C);
end;

Function primeromeArc(var tipodatos: Mearcjugador): integer;
var
  RC: tiporegcontrol;
begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  If RC.ultimo = posnula then
    primeromeArc := posnula
  else
    primeromeArc := 0;
end;

Function ultimomeArc(Var tipodatos: Mearcjugador): integer;
var
  RC: tiporegcontrol;
Begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  ultimomeArc := RC.ultimo;
end;

Function procimomeArc(var tipodatos: Mearcjugador; pos: integer): integer;
var
  RC: tiporegcontrol;
begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  If pos <> RC.ultimo then
    procimomeArc := pos + 1
  else
    procimomeArc := posnula;
end;

Function anteriormeArc(var tipodatos: Mearcjugador; pos: integer): integer;
var
  RC: tiporegcontrol;
begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  If pos <> 0 then
    anteriormeArc := pos - 1
  else
    anteriormeArc := posnula;
end;

Procedure incertarmeArc(Var tipodatos: Mearcjugador; pos: integer;
  reg: tiporegdato);
Var
  RC: tiporegcontrol;
begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  seek(tipodatos.D, pos);
  write(tipodatos.D, reg);
  RC.ultimo := RC.ultimo + 1;
  RC.ultimoIDinterno := RC.ultimoIDinterno + 1;
  seek(tipodatos.C, 0);
  write(tipodatos.C, RC);
end;


Procedure eliminarmeArc(var tipodatos: Mearcjugador; pos: integer);
var
  RC: tiporegcontrol;
  aux: tiporegdato;
  i: integer;
Begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);

  for i := pos + 1 to RC.ultimo do
  begin
    seek(tipodatos.D, i);
    read(tipodatos.D, aux);
    seek(tipodatos.D, i - 1);
    write(tipodatos.D, aux);
  end;

  RC.ultimo := RC.ultimo - 1;
  seek(tipodatos.C, 0);
  write(tipodatos.C, RC);
end;

Function buscarmeArc(var tipodatos: Mearcjugador; clave: string;var pos: integer): boolean;
Var
  RC: tiporegcontrol;
  rd: tiporegdato;
  encontrado: boolean;
  i, f, m: integer;
Begin
  seek(tipodatos.C, 0);
  Read(tipodatos.C, RC);
  i := 0;
  f := RC.ultimo;
  m := 0 ;
  encontrado := false;

  While (i <= f) and (not encontrado) do
  begin
    m := (i + f) div 2;
    seek(tipodatos.D, m);
    read(tipodatos.D, rd);
    If rd.clave = clave then
      encontrado := false
    else If clave < rd.clave then
      f := m - 1
    else
      i := m + 1;
  end;
  buscarmeArc := encontrado;
  If encontrado then
    pos := m
  else If RC.ultimo = -1 then
    pos := 0
  Else
    pos := RC.ultimo + 1;
end;

Function vaciomeArc(var tipodatos: Mearcjugador): boolean;
Var
  RC: tiporegcontrol;
Begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  vaciomeArc := (RC.ultimo = posnula);
end;



Procedure modificarmeArc(var tipodatos: Mearcjugador; pos: integer;
  reg: tiporegdato);
begin
  seek(tipodatos.D, pos);
  write(tipodatos.D, reg);
end;

function capturarmeArc(var tipodatos: Mearcjugador; pos: integer):tiporegdato;
var
reg:tiporegdato;
begin
  seek(tipodatos.D, pos);
  read(tipodatos.D, reg);
  capturarmeArc:=reg
end;

Procedure eliminarrepetidomeArc(var tipodatos: Mearcjugador);
Var
  RC: tiporegcontrol;
  aux, r1, r2: tiporegdato;
  i, pos1, pos2: integer;
Begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  pos1 := 0;

  While pos1 < RC.ultimo do
  begin
    pos2 := pos1 + 1;
    seek(tipodatos.D, pos1);
    read(tipodatos.D, r1);
    seek(tipodatos.D, pos2);
    read(tipodatos.D, r2);
    if r1.clave = r2.clave then
    begin
      for i := pos2 to RC.ultimo do
      begin
        seek(tipodatos.D, i);
        read(tipodatos.D, aux);
        seek(tipodatos.D, i - 1);
        write(tipodatos.D, aux);
      end;
    end
    else
      pos1 := pos2
  end;
  seek(tipodatos.C, 0);
  write(tipodatos.C, RC);
end;

Function capuraUltimoIDArc(var tipodatos: Mearcjugador): integer;
var
  RC: tiporegcontrol;
begin
  seek(tipodatos.C, 0);
  read(tipodatos.C, RC);
  capuraUltimoIDArc := RC.ultimoIDinterno;
end;
end.
