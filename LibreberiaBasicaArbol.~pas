unit LibreberiaBasicaArbol;

interface

uses
  SysUtils;
const
  posnula = -1;
  ubicacionDatos = 'Datosarbolavl.dat';
  ubicacioncontrol = 'controlarbolavl.dat';

type
  Indice = record
    clave : string[20];
    posEnDatos:integer;
    padre,hizq,hder: integer;
    borrado:boolean;
    nivel:integer;
  end;

  Control = record
    raiz: integer;
    borrados: integer;
    cantidad: integer;
    cant_niveles: integer;
  end;

  Archivoindicearbol = file of Indice;
  Archivocontrolarbol = file of Control;

  Mearbol = record
    D: Archivoindicearbol;
    C: Archivocontrolarbol;
  end;

var
   Menick:Mearbol;
   procedure Crearmearbol(var Arbol: Mearbol;nombre,ruta:string);
   procedure Abrirmearbol(var Arbol: Mearbol);
   procedure Cerrarmearbol(var Arbol: Mearbol);
   procedure ModificarNodo(var Arbol: MeArbol; pos: integer;nodo: Indice);
   function CapturarNodo(var Arbol: MeArbol; pos: integer): Indice;
   function CantidadNodo(var Arbol: MeArbol): integer;
   function BuscarNodo(var Arbol: MeArbol; clave: string ;var pos: integer): boolean;
   function ArbolVacio(Arbol: MeArbol): boolean;
   function PosicionNula(Arbol: MeArbol): integer;
   function RaizNodo(var Arbol: MeArbol): integer;
   function PadreNodo(var Arbol: MeArbol; pos: integer): integer;
   function ProximoNodohIzq(var Arbol: MeArbol; pos: integer): integer;
   function ProximoNodohDer(var Arbol: MeArbol; pos: integer): integer;
   function sinh(var Arbol: MeArbol; pos: integer): boolean;




implementation

   procedure Crearmearbol(var Arbol: Mearbol;nombre,ruta:string);
   var
      RC:Control;
     Lerrorc,Lerrord:integer;

   begin
      assign(Arbol.D,ruta+nombre + ubicacionDatos);
      assign(Arbol.C,ruta+nombre + ubicacioncontrol);
      {$I-}
      reset(Arbol.D);
      Lerrord := IoResult;
      reset(Arbol.C);
      Lerrorc := IoResult;
      if (Lerrord <> 0) or (Lerrorc <> 0) then
        begin
           Rewrite(Arbol.D);
           Rewrite(Arbol.C);
           RC.raiz := posnula;
           RC.cantidad := 0;
           RC.cant_niveles := 0;
           RC.borrados := posnula;
           Write(Arbol.C, RC);
        end;
      Close(Arbol.D);
      Close(Arbol.C);
      {$I+}
    end;


   procedure Abrirmearbol(var Arbol: Mearbol);
   begin
     reset(Arbol.C);
     reset(Arbol.D);
   end;
   procedure Cerrarmearbol(var Arbol: Mearbol);
   begin
    Close(Arbol.C);
    Close(Arbol.D);
    end;





   procedure ModificarNodo(var Arbol: MeArbol; pos: integer;nodo: Indice);
   begin
      seek(Arbol.D, pos);
      write(Arbol.D, nodo);
   end;


   function CapturarNodo(var Arbol: MeArbol; pos: integer): Indice;
   var
    nodo:Indice;
   begin
     seek(Arbol.D, pos);
     read(Arbol.D, nodo);
     CapturarNodo := nodo;
   end;

   function CantidadNodo(var Arbol: MeArbol): integer;
   var
       RC: control;
   begin
     seek(Arbol.C, 0);
     read(Arbol.C, RC);
     CantidadNodo := RC.cantidad;
   end;




   function BuscarNodo(var Arbol: MeArbol; clave: string ;var pos: integer): boolean;
   var
      RC: control;
      encontre: boolean;
      pospadre:integer;
      reg:indice;
   begin
     seek(Arbol.C, 0);
     read(Arbol.C, RC);
     pos := RC.raiz;
     encontre := false;
     pospadre := posnula;
     while (not encontre) and (pos <> posnula) do
     begin
       seek(Arbol.D, pos);
       read(Arbol.D, reg);
       if (clave = reg.clave) then
       begin
         encontre := true;
       end
       else
       begin
         if (reg.clave > clave) then
         begin
           posPadre := pos;
           pos := reg.hizq;
         end
         else
         begin
           posPadre := pos;
           pos := reg.hder;
         end;
       end;
     end;
     if (not encontre) then
     begin
       pos := posPadre;
     end;
     BuscarNodo := encontre;
   end;



   function ArbolVacio(Arbol: MeArbol): boolean;
   var
      RC:control;
      begin
        seek(Arbol.C, 0);
        read(Arbol.C, RC);
        if rc.cantidad = 0 then
            ArbolVacio:=true
        else
            ArbolVacio:=false;
      end;


   function PosicionNula(Arbol: MeArbol): integer;
      begin
           PosicionNula:= posnula;
      end;

   function RaizNodo(var Arbol: MeArbol): integer;
   var
      RC:control;
      begin
        seek(Arbol.C, 0);
        read(Arbol.C, RC);
        RaizNodo:=rc.raiz;
      end  ;

   function PadreNodo(var Arbol: MeArbol; pos: integer): integer;
    var
      reg: Indice;
      begin
             seek(Arbol.D, pos);
             read(Arbol.D, reg);
             PadreNodo:=reg.padre;
      end;

   function ProximoNodohIzq(var Arbol: MeArbol; pos: integer): integer;
    var
      reg: Indice;
      begin
             seek(Arbol.D, pos);
             read(Arbol.D, reg);
             ProximoNodohIzq:= reg.hizq;
      end;
   function ProximoNodohDer(var Arbol: MeArbol; pos: integer): integer;
    var
      reg: Indice;
      begin
             seek(Arbol.D, pos);
             read(Arbol.D, reg);
             ProximoNodohDer:=reg.hder;
      end;
   function sinh(var Arbol: MeArbol; pos: integer): boolean;
   var
      reg: Indice;
    begin
             seek(Arbol.D, pos);
             read(Arbol.D, reg);
             if (reg.hizq = -1) and (reg.hder = -1 ) then
             sinh:=true
             else
             sinh:=false ;
    end;

end.


