unit HashConColisiones;
interface

uses
Classes,Sysutils,math ;


  Const

    Datos = 'hashDatos.dat';
    control = 'hashControl.dat';
    tablahashTamano = 40;
    tablahashPosPrimera = 0;
    tablahashPosUltima = tablahashTamano-1;
    tablahashRehashp = 37;

  Type
  tclavetablahash = longint;
  Texto=string;
  tipoclave = longint;
  tindicetablahash  =  tablahashPosPrimera .. tablahashPosUltima;
  tiporegdato = record
                clave:tipoclave;
                vacio:Boolean;
                borrados:Boolean;

                //----lo que me piden
                ElIddelJuego :longint;
                Nombredelevento :String[20];
                Fechadelevento:TDateTime;
                Estado : (N,J,F);
                Valordelcarton :real;
                Totalcartonesvendidos: 0..100;
                Plinea:    integer;
                Pdiagonal:  integer;
                Pcruz:    integer;
                Pcuadradochico:  integer;
                Pcuadradogrande:  integer;



              end;
  TablaHash = array [tindicetablahash]   of tiporegdato;
  TipoArchDatos = file of TablaHash;

  TipoRegControl = record
                Espaciousado:integer;
                UltimoIdinterno : longint ;
              end;
  TipoArchControl = file of tiporegcontrol;

  TipoMEhash = Record
	         	D: TipoArchDatos ;
            C: TipoArchControl;
	   End;
     var
   	hash : TipoMEhash ;

   Procedure Hash_inicializar(var Tabla:TipoMEhash;ruta:string);
   Procedure Hash_AbrirArchivos ( var Tabla: TipoMEhash );
   Procedure Hash_CerrarArchivos ( var Tabla: TipoMEhash )  ;
   function  Hash_Buscar(C:longint; Tabla:TipoMEhash) : tindicetablahash;
   function  Hash_Lleno(Tabla:TipoMEHash):boolean;
   function  Hash_EntradaOcupada(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   function  Hash_EntradaVacia(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   function  Hash_EntradaEliminada(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   function  Hash_ObtenerClave(hash:tindicetablahash ; Tabla:TipoMEHash):tipoclave;



   function  Hash_Obtenerinformacion(hash:tindicetablahash ; Tabla:TipoMEHash):tiporegdato;


   procedure Hash_Insertar(hash:tindicetablahash;registro:tiporegdato; var Tabla:TipoMEHash);
   procedure Hash_Modificar(hash:tindicetablahash;registro:tiporegdato; var Tabla:TipoMEHash);
   procedure Hash_Eliminar(hash:tindicetablahash; var Tabla:TipoMEHash);
   function  Hash_Vacio(Tabla:TipoMEHash):boolean;
   procedure  Hash_listadodeclavesactivas(Tabla:TipoMEHash;var listado:array of string);


   function  Hash_UltimoId(Tabla:TipoMEHash):longint;
   Function ConvercionHash (Clave:Texto):tipoclave;


  implementation




   //--------------------adicionales
   Function ConvercionHash (Clave:Texto):tipoclave;
    var
    i:longint;
    unidad:longint ;
        begin
               unidad:=0;
               for i:=1 to Length(Clave) do
               begin
                      unidad := unidad + Ord(Clave[i]) * Round(Power(10,(i-1)));
               end;
	            ConvercionHash:= unidad ;
        end;
   //--------
   function TablaHash_HashClave(C:tclavetablahash):tindicetablahash;
    begin
        TablaHash_HashClave := (C mod tablahashTamano) ;
    end;
    //---------
    function Tablahash_Segundohashclave(hash:tindicetablahash;i:longint):tindicetablahash;
    begin
         Tablahash_Segundohashclave:= i * (tablahashRehashp - (hash mod tablahashRehashp));
    end;


   //-----principal
   //--------crear
   Procedure Hash_inicializar(var Tabla:TipoMEHash;ruta:string);
   var
        bErrordatos,bErrorcontrol:boolean;
        it:tindicetablahash;
        th:TablaHash ;
        RC: TipoRegControl;
   begin
     {$i-}
        assign(Tabla.C,ruta + control);
        assign(Tabla.D,ruta + datos);
        reset(Tabla.C);
        berrorcontrol:=(ioresult<>0);
        reset(Tabla.D);
        berrordatos:=(ioresult<>0);
        if berrorcontrol OR berrordatos then
          begin
            Rewrite(Tabla.c);
            Rewrite(Tabla.D);
            RC.Espaciousado:=0;
            RC.UltimoIdinterno:=0;
             for it:= tablahashPosPrimera to  tablahashPosUltima do
                begin
                      th[it].vacio:=true;
                      th[it].borrados:=false;
                end;
             seek(tabla.C,0);
             write(tabla.C,RC);
             seek(tabla.D,0);
             write(tabla.D,th);
          end;
        close(Tabla.C);
        close(Tabla.D);
        {$i+}
   end;
    //--------abrir
     Procedure Hash_AbrirArchivos ( var Tabla: TipoMEHash );
      Begin
      	Reset (Tabla.D) ;
	      Reset (Tabla.C);
      End;
    //-------cerrar
    Procedure Hash_CerrarArchivos ( var Tabla: TipoMEHash );
      Begin
      	Close (Tabla.D);
      	Close (Tabla.C);
      End;
   //----buscar
   function  Hash_Buscar(C:longint; Tabla:TipoMEHash) : tindicetablahash;
   var
   hash,hash_actual:tIndiceTablaHash;
   th:TablaHash ;
   i:integer;
   begin
     seek(Tabla.D,0);
     read(tabla.D,th);
     i:=0;
     hash:= TablaHash_HashClave(C);
     hash_actual:=hash;
     while (th[hash_actual].vacio = false ) and (th[hash_actual].clave <> C) do
       begin
        i:=i+1;
        hash_actual:=(((hash+Tablahash_Segundohashclave(hash,i))mod tablahashTamano ));
        end;
     Hash_Buscar:=hash_actual;
   end;
   //-----lleno
   function  Hash_Lleno(Tabla:TipoMEHash):boolean;
   var
    RC: TipoRegControl;
   begin
           seek(Tabla.C,0);
           read(tabla.C,RC);
           Hash_Lleno := RC.Espaciousado <> tablahashTamano;
   end;
   //--------con algo dentro
   function  Hash_EntradaOcupada(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   var
    th:TablaHash ;
   begin
           seek(Tabla.D,0);
           read(tabla.D,th);
           Hash_EntradaOcupada:= (th[hash].vacio = false)and(th[hash].borrados = false);
   end;
   //--------vacia
   function  Hash_EntradaVacia(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   var
    th:TablaHash ;
   begin
          seek(Tabla.D,0);
           read(tabla.D,th);
           Hash_EntradaVacia:= (th[hash].vacio = true)and(th[hash].borrados = false);
   end;
   //--------eliminada
   function  Hash_EntradaEliminada(hash:tindicetablahash ; Tabla:TipoMEHash):boolean;
   var
    th:TablaHash ;
   begin
           seek(Tabla.D,0);
           read(tabla.D,th);
           Hash_EntradaEliminada:= (th[hash].borrados = true);
   end;
   //--------capturar
   function  Hash_ObtenerClave(hash:tindicetablahash ; Tabla:TipoMEHash):tipoclave;
   var
    th:TablaHash ;
   begin
           seek(Tabla.D,0);
           read(tabla.D,th);
           Hash_ObtenerClave:= (th[hash].clave);
   end;

  //--------incertar
  procedure Hash_Insertar(hash:tindicetablahash;registro:tiporegdato; var Tabla:TipoMEHash);
    var
    th:TablaHash ;
    rc: TipoRegControl;
   begin
       seek(Tabla.D,0);
       read(tabla.D,th);
       seek(Tabla.C,0);
       read(tabla.C,rc);
       if rc.Espaciousado <> tablahashTamano then
       begin
          if th[hash].vacio = true then
             begin
                  th[hash]:=registro;
                  th[hash].ElIddelJuego:= rc.UltimoIdinterno;
                  th[hash].vacio := false ;
                  rc.Espaciousado:= rc.Espaciousado+1;
                  rc.UltimoIdinterno:= rc.UltimoIdinterno+1;
              end;
       end;
       seek(Tabla.D,0);
       write(tabla.D,th);
       seek(Tabla.C,0);
       write(tabla.C,rc);
   end;


  //--------eliminar
   procedure Hash_Eliminar(hash:tindicetablahash; var Tabla:TipoMEHash);
    var
    rc: TipoRegControl;
    th:TablaHash ;
   begin
       seek(Tabla.C,0);
       read(tabla.C,rc);
       seek(Tabla.D,0);
       read(tabla.D,th);
       if th[hash].vacio = false then
          begin
             th[hash].borrados := true ;
          end;
       seek(Tabla.D,0);
       write(tabla.D,th);
       seek(Tabla.C,0);
       write(tabla.C,rc);
    end;

   //----------modificar
   procedure Hash_Modificar(hash:tindicetablahash;registro:tiporegdato; var Tabla:TipoMEHash);
    var
    rc: TipoRegControl;
    th:TablaHash ;
   begin
       seek(Tabla.C,0);
       read(tabla.C,rc);
       seek(Tabla.D,0);
       read(tabla.D,th);
       if th[hash].vacio = false then
             th[hash]:= registro;
       seek(Tabla.D,0);
       write(tabla.D,th);
       seek(Tabla.C,0);
       write(tabla.C,rc);
    end;

   function  Hash_UltimoId(Tabla:TipoMEHash):longint;
    var
        th:tiporegcontrol ;
    begin
           seek(Tabla.C,0);
           read(tabla.C,th);
           Hash_UltimoId:= th.UltimoIdinterno ;
    end;


   function  Hash_Obtenerinformacion(hash:tindicetablahash ; Tabla:TipoMEHash):tiporegdato;
    var
    th:TablaHash ;
   begin
           seek(Tabla.D,0);
           read(tabla.D,th);
           Hash_Obtenerinformacion:= th[hash]
   end;

   function  Hash_Vacio(Tabla:TipoMEHash):boolean;
      var
          i:integer;
          th:TablaHash ;
    begin
            seek(Tabla.D,0);
            read(tabla.D,th);
            Hash_Vacio:=true;
            for i:= HashConColisiones.tablahashPosPrimera to HashConColisiones.tablahashPosUltima do
              begin
                     if  (th[i].vacio = false)and(th[i].borrados = false)then
                     begin
                          Hash_Vacio:=false;
                     end ;

              end;

    end;


   procedure  Hash_listadodeclavesactivas(Tabla:TipoMEHash;var listado:array of string);
    var
          i,x:integer;
          th:TablaHash ;
    begin
          seek(Tabla.D,0);
          read(tabla.D,th);
          x:=1;
          for i:= HashConColisiones.tablahashPosPrimera to HashConColisiones.tablahashPosUltima do
              begin
                      if  (th[i].vacio = false)then
                          begin
                              listado[x]:=(th[i].Nombredelevento);
                          end
                      else
                          begin
                              listado[x]:='';
                          end;
                     x:=x+1;
              end;
    end;







  end.




