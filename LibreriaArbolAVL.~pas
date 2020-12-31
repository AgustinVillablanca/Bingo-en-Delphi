unit LibreriaArbolAVL;

interface
uses
  SysUtils,LibreberiaBasicaArbol;




   procedure InsertarNodoAVL(var Arbol: Mearbol; var nodo: Indice; pos: integer);
   procedure EliminarNodoAVL(var Arbol: MeArbol; pos: integer);
   Procedure derecha(var Arbol: MeArbol; pos: integer);
   Procedure izquierda(var Arbol: MeArbol; pos: integer);
   Procedure izquierdaderecha(var Arbol: MeArbol; pos: integer);
   Procedure derechaiquierda(var Arbol: MeArbol; pos: integer);
   Procedure DisminuirNiveles(var Arbol: MeArbol; pos: integer);
   Procedure AumentarNiveles(var Arbol: MeArbol; pos: integer);
   Procedure ProfundidadArbol(Arbol: MeArbol; pos: integer; var Prof: integer);
   Function ProfundidadNodo(Arbol: MeArbol; pos: integer): integer;
   Procedure CasoDeDesequilibrio(Arbol: MeArbol; pos: integer);
   Function FactorEquilibrio(Arbol: MeArbol; pos: integer): integer;
   Procedure AVL_Indice(Arbol: MeArbol; raiz: integer; var pos: integer; Var Balance: boolean);
   procedure BalancearArbolIndice(var arbol: MeArbol);

implementation

procedure InsertarNodoAVL(var Arbol: Mearbol; var nodo: Indice; pos: integer);   //................
   var
      posnueva: integer;
      reg, rd: Indice;
      RC: control;
    begin
        seek(Arbol.C, 0);
        read(Arbol.C, RC);
        if RC.borrados = posnula then
            begin
                posnueva := filesize(Arbol.D);
            end
        else
            begin
                posnueva := RC.borrados;
                seek(Arbol.D, posnueva);
                read(Arbol.D, rd);
                RC.borrados := rd.hizq;
            end;
        if (RC.raiz = posnula) then // Arbol vacio
            begin
                nodo.padre := posnula;
                nodo.hizq := posnula;
                nodo.hder := posnula;
                nodo.nivel := 1;
                RC.raiz := posnueva;
            end
        else // Hoja
            begin
                seek(Arbol.D, pos);
                read(Arbol.D, reg);
                nodo.padre := pos;
                nodo.hder := posnula;
                nodo.hizq := posnula;
                nodo.nivel := reg.nivel + 1;
                if (nodo.clave <= reg.clave) then
                    begin
                        reg.hizq := posnueva;
                    end
                else
                    begin
                        reg.hder := posnueva;
                    end;
                seek(Arbol.D, pos);
                write(Arbol.D, reg);
             end;
        If nodo.nivel > RC.cant_niveles then
            RC.cant_niveles := nodo.nivel;
        RC.cantidad := RC.cantidad + 1;
        seek(Arbol.D, posnueva);
        write(Arbol.D, nodo); // se escribe el elemento en el archivo
        seek(Arbol.C, 0);
        write(Arbol.C, RC); // se actualiza el registro control

        BalancearArbolIndice(arbol);

    end;


   procedure EliminarNodoAVL(var Arbol: MeArbol; pos: integer);
   var
      posnueva,posaux: integer;
      regaux,rd,RHD,RDP,RHI: Indice;
      RC: control;
    begin
    seek(Arbol.C, 0);
  read(Arbol.C, RC);
  seek(Arbol.D, pos);
  read(Arbol.D, rd);
  if (pos = RC.raiz) and (rd.hizq = posnula) and (rd.hder = posnula)
  then
  begin
    RC.raiz := posnula;
  end
  else
  begin
    if (rd.hizq = posnula) and (rd.hder = posnula) then
    // eliminar de una hoja
    begin
      seek(Arbol.D, rd.padre);
      read(Arbol.D, RDP);
      If RDP.hizq = pos then
        RDP.hizq := posnula
      else
        RDP.hder := posnula;
      seek(Arbol.D, rd.padre);
      write(Arbol.D, RDP);
    end
    else
    begin
      if (rd.hizq <> posnula) and (rd.hder <> posnula) then
      // Caso general
      begin
        If pos <> RC.raiz then
          begin
              seek(Arbol.D, rd.padre);
              read(Arbol.D, RDP);
                    If RDP.hizq = pos then
                       RDP.hizq := rd.hder
                    else
                       RDP.hder := rd.hder;
              seek(Arbol.D, rd.padre);
              Write(Arbol.D, RDP);
          end
        else
          RC.raiz := rd.hder;

        seek(Arbol.D, rd.hder);
        read(Arbol.D, RHD);
        RHD.padre := rd.padre;
        posAux := rd.hder;
        regaux := RHD;
        While regaux.hizq <> posnula do
        begin
          seek(Arbol.D, posAux);
          read(Arbol.D, regaux);
          If regaux.hizq <> posnula then
            posAux := regaux.hizq;
        end;
        seek(Arbol.D, rd.hizq);
        Read(Arbol.D, RHI);
        RHI.padre := posAux;
        regaux.hizq := rd.hizq;
        seek(Arbol.D, rd.hizq);
        Write(Arbol.D, RHI);
        seek(Arbol.D, posAux);
        Write(Arbol.D, regaux);
        If posAux <> rd.hder then
        begin
          seek(Arbol.D, rd.hder);
          Write(Arbol.D, RHD);
        end;
      end
      else
      begin
        If pos <> RC.raiz then
        begin
          seek(Arbol.D, rd.padre);
          Read(Arbol.D, RDP);
          If RDP.hizq = pos then
          begin
            If rd.hizq = posnula then
            begin
              RDP.hizq := rd.hder;
              seek(Arbol.D, rd.hder);
              read(Arbol.D, RHD);
              RHD.padre := rd.padre;
              seek(Arbol.D, rd.hder);
              write(Arbol.D, RHD);
            end
            else
            begin
              RDP.hizq := rd.hizq;
              seek(Arbol.D, rd.hizq);
              read(Arbol.D, RHI);
              RHI.padre := rd.padre;
              seek(Arbol.D, rd.hizq);
              write(Arbol.D, RHI);
            end
          end
          else If rd.hizq = posnula then
          begin
            RDP.hder := rd.hder;
            seek(Arbol.D, rd.hder);
            read(Arbol.D, RHD);
            RHD.padre := rd.padre;
            seek(Arbol.D, rd.hder);
            write(Arbol.D, RHD);
          end
          else
          begin
            RDP.hder := rd.hizq;
            seek(Arbol.D, rd.hizq);
            read(Arbol.D, RHI);
            RHI.padre := rd.padre;
            seek(Arbol.D, rd.hizq);
            write(Arbol.D, RHI);
          end;
          seek(Arbol.D, rd.padre);
          write(Arbol.D, RDP);
        end
        else If rd.hizq = posnula then
          RC.raiz := rd.hder
        else
          RC.raiz := rd.hizq;
      end;
    end;
  end;
  rd.hizq := RC.borrados;
  rd.hder := RC.borrados;
  RC.borrados := pos;
  RC.cantidad := RC.cantidad - 1;
  seek(Arbol.C, 0);
  write(Arbol.C, RC);

  BalancearArbolIndice(arbol);
  end;



    procedure derecha(var Arbol: MeArbol; pos: integer);
Var
  NodoArriba, NodoAbajo, NodoAnterior,Nodoinferior: indice;
  RC: control;
  posAux: integer;
begin

  seek(Arbol.D, pos);
  Read(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.hder);
  Read(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Read(Arbol.C, RC);

  { Cambio enlaces }
  posAux := NodoAbajo.hizq;

   if posAux <> posnula then
  begin
  seek(arbol.d,posAux);
  read(arbol.d,Nodoinferior);
  Nodoinferior.padre:=pos;
  seek(arbol.d,posAux);
  write(arbol.d,Nodoinferior);
  end;

  NodoAbajo.padre := NodoArriba.padre;
  NodoAbajo.hizq := pos;
  NodoArriba.padre := NodoArriba.hder;
  NodoArriba.hder := posAux;

  If NodoAbajo.padre <> posnula then
  begin
    seek(Arbol.D, NodoAbajo.padre);
    Read(Arbol.D, NodoAnterior);
    If NodoAnterior.hder = pos then
      NodoAnterior.hder := NodoArriba.padre
    Else
      NodoAnterior.hizq := NodoArriba.padre;
    seek(Arbol.D, NodoAbajo.padre);
    Write(Arbol.D, NodoAnterior);
  end
  else
  begin
      if  posAux <> posnula then
        begin
          seek(arbol.D,posAux);
          Read(Arbol.D, NodoAnterior);
          NodoAnterior.padre:=pos;
          seek(arbol.D,posAux);
          write(Arbol.D, NodoAnterior);
      end
  end;

  { Cambio el campo nivel }
  NodoAbajo.nivel := NodoAbajo.nivel - 1;
  NodoArriba.nivel := NodoArriba.nivel + 1;

  { Verifico que el del drama no haya sido la raiz }
  If pos = RC.raiz then
    RC.raiz := NodoArriba.padre;

  seek(Arbol.D, pos);
  Write(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.padre);
  Write(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Write(Arbol.C, RC);

  DisminuirNiveles(Arbol, NodoAbajo.hder);
  AumentarNiveles(Arbol, NodoArriba.hizq);

end;



Procedure izquierda(var Arbol: MeArbol; pos: integer);
Var
 NodoArriba, NodoAbajo, NodoAnterior,Nodoinferior: indice;
  RC: control;
  posAux: integer;
begin

  seek(Arbol.D, pos);
  Read(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.hizq);
  Read(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Read(Arbol.C, RC);

  { Cambio enlaces }
  posAux := NodoAbajo.hder;

   if posAux <> posnula then
  begin
  seek(arbol.d,posAux);
  read(arbol.d,Nodoinferior);
  Nodoinferior.padre:=pos;
  seek(arbol.d,posAux);
  write(arbol.d,Nodoinferior);
  end;

  NodoAbajo.padre := NodoArriba.padre;
  NodoAbajo.hder := pos;
  NodoArriba.padre := NodoArriba.hizq;
  NodoArriba.hizq := posAux;

  If NodoAbajo.padre <> posnula then
  begin
    seek(Arbol.D, NodoAbajo.padre);
    Read(Arbol.D, NodoAnterior);
    If NodoAnterior.hder = pos then
      NodoAnterior.hder := NodoArriba.padre
    Else
      NodoAnterior.hizq := NodoArriba.padre;
    seek(Arbol.D, NodoAbajo.padre);
    Write(Arbol.D, NodoAnterior);


  end
  else
  begin
        if  posAux <> posnula then
        begin
          seek(arbol.D,posAux);
          Read(Arbol.D, NodoAnterior);
          NodoAnterior.padre:=pos;
          seek(arbol.D,posAux);
          write(Arbol.D, NodoAnterior);
        end
  end;

  { Cambio el campo nivel }
  NodoAbajo.nivel := NodoAbajo.nivel - 1;
  NodoArriba.nivel := NodoArriba.nivel + 1;

  { Verifico que el del drama no haya sido la raiz }
  If pos = RC.raiz then
    RC.raiz := NodoArriba.padre;

  seek(Arbol.D, pos);
  Write(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.padre);
  Write(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Write(Arbol.C, RC);

  DisminuirNiveles(Arbol, NodoAbajo.hizq);
  AumentarNiveles(Arbol, NodoArriba.hder);
end;



Procedure izquierdaderecha(var Arbol: MeArbol; pos: integer);
Var
  NodoArriba, NodoMedio, NodoAbajo, NodoAnterior: indice;
   RC: control;
  posAux, PosMedio, PosAbajo: integer;
begin

  seek(Arbol.D, pos);
  Read(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.hizq);
  Read(Arbol.D, NodoMedio);
  seek(Arbol.D, NodoMedio.hder);
  Read(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Read(Arbol.C, RC);

  PosMedio := NodoArriba.hizq;
  PosAbajo := NodoMedio.hder;
  posAux := NodoArriba.padre;

  NodoArriba.padre := NodoMedio.hder;
  NodoArriba.hizq := NodoAbajo.hder;

  NodoMedio.padre := NodoMedio.hder;
  NodoMedio.hder := NodoAbajo.hizq;

  NodoAbajo.padre := posAux;
  NodoAbajo.hder := pos;
  NodoAbajo.hizq := PosMedio;

  If NodoAbajo.padre <> posnula then
  begin
    seek(Arbol.D, NodoAbajo.padre);
    Read(Arbol.D, NodoAnterior);
    If NodoAnterior.hder = pos then
      NodoAnterior.hder := PosAbajo
    Else
      NodoAnterior.hizq := PosAbajo;
    seek(Arbol.D, NodoAbajo.padre);
    Write(Arbol.D, NodoAnterior);
  end
  else
  begin
        if  posAux <> posnula then
        begin
          seek(arbol.D,posAux);
          Read(Arbol.D, NodoAnterior);
          NodoAnterior.padre:=pos;
          seek(arbol.D,posAux);
          write(Arbol.D, NodoAnterior);
        end
  end;

  NodoAbajo.nivel := NodoAbajo.nivel - 2;
  NodoArriba.nivel := NodoArriba.nivel + 1;

  If pos = RC.raiz then
    RC.raiz := NodoArriba.padre;

  seek(Arbol.D, pos);
  write(Arbol.D, NodoArriba);
  seek(Arbol.D, PosMedio);
  write(Arbol.D, NodoMedio);
  seek(Arbol.D, PosAbajo);
  write(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Write(Arbol.C, RC);

   DisminuirNiveles(Arbol, NodoArriba.hizq);
  AumentarNiveles(Arbol, NodoArriba.hder);
  DisminuirNiveles(Arbol, NodoMedio.hder);
end;


Procedure derechaiquierda(var Arbol: MeArbol; pos: integer);
Var
  NodoArriba, NodoMedio, NodoAbajo, NodoAnterior: indice;
   RC: control;
  posAux, PosMedio, PosAbajo: integer;
begin

  seek(Arbol.D, pos);
  Read(Arbol.D, NodoArriba);
  seek(Arbol.D, NodoArriba.hder);
  Read(Arbol.D, NodoMedio);
  seek(Arbol.D, NodoMedio.hizq);
  Read(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Read(Arbol.C, RC);

  PosMedio := NodoArriba.hder;
  PosAbajo := NodoMedio.hizq;
  posAux := NodoArriba.padre;

  NodoArriba.padre := NodoMedio.hizq;
  NodoArriba.hder := NodoAbajo.hder;

  NodoMedio.padre := NodoMedio.hizq;
  NodoMedio.hizq := NodoAbajo.hder;

  NodoAbajo.padre := posAux;
  NodoAbajo.hizq := pos;
  NodoAbajo.hder := PosMedio;

  If NodoAbajo.padre <> posnula then
  begin
    seek(Arbol.D, NodoAbajo.padre);
    Read(Arbol.D, NodoAnterior);
    If NodoAnterior.hder = pos then
      NodoAnterior.hder := PosAbajo
    Else
      NodoAnterior.hizq := PosAbajo;
    seek(Arbol.D, NodoAbajo.padre);
    Write(Arbol.D, NodoAnterior);
  end
  else
  begin
        if  posAux <> posnula then
        begin
          seek(arbol.D,posAux);
          Read(Arbol.D, NodoAnterior);
          NodoAnterior.padre:=pos;
          seek(arbol.D,posAux);
          write(Arbol.D, NodoAnterior);
        end
  end;
  NodoAbajo.nivel := NodoAbajo.nivel - 2;
  NodoArriba.nivel := NodoArriba.nivel + 1;

  If pos = RC.raiz then
    RC.raiz := NodoArriba.padre;

  seek(Arbol.D, pos);
  write(Arbol.D, NodoArriba);
  seek(Arbol.D, PosMedio);
  write(Arbol.D, NodoMedio);
  seek(Arbol.D, PosAbajo);
  write(Arbol.D, NodoAbajo);
  seek(Arbol.C, 0);
  Write(Arbol.C, RC);

  DisminuirNiveles(Arbol, NodoArriba.hder);
  AumentarNiveles(Arbol, NodoArriba.hizq);
  DisminuirNiveles(Arbol, NodoMedio.hizq);
end;


Procedure DisminuirNiveles(var Arbol: MeArbol; pos: integer);
var
  N: indice;
begin
  If pos = posnula then
    exit;
  seek(arbol.D,pos);
  read(arbol.D,N);
  DisminuirNiveles(Arbol,n.hizq);
  n.nivel:= n.nivel-1;
  seek(Arbol.D, pos);
  Write(Arbol.D, N);
  DisminuirNiveles(Arbol, n.hder);
end;

Procedure AumentarNiveles(var Arbol: MeArbol; pos: integer);
var
  N: indice;
begin
  If pos = posnula then
    exit;
  seek(arbol.D,pos);
  read(arbol.D,N);
  DisminuirNiveles(Arbol,n.hizq);
  n.nivel:= n.nivel+1;
  seek(Arbol.D, pos);
  Write(Arbol.D, N);
  DisminuirNiveles(Arbol, n.hder);
end;

Procedure ProfundidadArbol(Arbol: MeArbol; pos: integer; var Prof: integer);
  var
    N: indice;
  begin
    If pos = posnula then
      exit;
    seek(arbol.D,pos);
    read(arbol.D,N);
    ProfundidadArbol(Arbol, n.hizq, Prof);
    ProfundidadArbol(Arbol, n.hder, Prof);
    If N.nivel > Prof then
      Prof := N.nivel;
  end;


Function ProfundidadNodo(Arbol: MeArbol; pos: integer): integer;
var
  nodo: indice;
  Profundidad: integer;
Begin
  Profundidad := 0;
  seek(Arbol.D,pos);
  read(Arbol.D,nodo);
  ProfundidadArbol(Arbol, pos, Profundidad);
  ProfundidadNodo := (Profundidad - nodo.nivel) + 1;
End;

Function FactorEquilibrio(Arbol: MeArbol; pos: integer): integer;
var
  N: indice;
  Ti, Td: integer;
begin
  If pos = -1 then
    FactorEquilibrio := 0
  Else
    begin
        seek(Arbol.D,pos);
        read(Arbol.D,N);
        If N.hizq <> posnula then
           Ti := ProfundidadNodo(Arbol, N.hizq)
        Else
           Ti := 0;

        If N.hder <> posnula then
           Td := ProfundidadNodo(Arbol, N.hder)
        Else
          Td := 0;

    FactorEquilibrio := Ti - Td;
  end;
end;



Procedure CasoDeDesequilibrio(Arbol: MeArbol; pos: integer);
var
  N: indice;
begin
  seek(Arbol.D,pos);
  read(Arbol.D,N);
  If FactorEquilibrio(Arbol, pos) >= 0 then
  begin
    If FactorEquilibrio(Arbol, N.hizq) >= 0 then
      izquierda(Arbol, pos)
    Else
      izquierdaderecha(Arbol, pos);
  end
  Else
  begin
    If FactorEquilibrio(Arbol, N.hder) >= 0 then
      derechaiquierda(Arbol, pos)
    Else
      derecha(Arbol, pos);
  end;

end;


Procedure AVL_Indice(Arbol: MeArbol; raiz: integer; var pos: integer; Var Balance: boolean);
var
  Result: integer;
begin
  If (raiz = posnula) then
    exit;
  AVL_Indice(Arbol, ProximoNodohIzq(Arbol, raiz), pos, Balance);
  AVL_Indice(Arbol, ProximoNodohDer(Arbol, raiz), pos, Balance);
  Result := FactorEquilibrio(Arbol, raiz);
  If Result < 0 then
    Result := Result * (-1);
  If (Result > 1) then
    Balance := false;
  If (pos = posnula) and (not Balance) then
    pos := raiz;
end;


procedure BalancearArbolIndice(var arbol: MeArbol);
var
  balanceado: boolean;
  pos: integer;
  N: indice;
begin
  balanceado := true;
  pos := posnula;
  AVL_Indice(arbol, RaizNodo(arbol), pos, balanceado);
  if not balanceado then
      begin
          While (not balanceado) Do
              begin
                   balanceado := true;
                   pos := posnula;
                   AVL_Indice(arbol, RaizNodo(arbol), pos, balanceado);
                   If (not balanceado) then
                          CasoDeDesequilibrio(arbol, pos);
                end;
        end;
end;

end.
 