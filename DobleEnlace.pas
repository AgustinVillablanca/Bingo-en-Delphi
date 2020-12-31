unit DobleEnlace;
// DOBLE ENLACE
interface
uses
Classes,Sysutils;

  Const
    Datos = 'Datosdobleenlace.dat';
    control = 'controldobleenlace.dat';
    indice = 'indicedobleenlace.dat';
    posnula = -1;
    Clavenula='*';

  Type
   matriz = record
        Numero : 0..75;
        Tachado :boolean;
   end;
   arreglo=array[0..4,0..4]of matriz;


   tipoclave = integer;
  Tipopocision = longint;
  tiporegdatodoble = record
                IdCarton :tipoclave;
                Iddeljugador :tipoclave;
                Grilla : arreglo;
                enlaseprox:Tipopocision;
                enlaseanterior:Tipopocision;
              end;

  TipoArchDatos = file of tiporegdatodoble;
  tiporegcontroldoble = record
                IddeJuego:tipoclave;
                primero:Tipopocision;
                ultimo:Tipopocision;
                bajas:Tipopocision;
                UltimoIdinterno :integer;
              end;
  TipoArchControl = file of tiporegcontroldoble;

  tiporegIndice = record
                ultimaposcontrol:integer;
              end;
  TipoArchIndice = file of tiporegIndice;

  TipoME = Record
	         	D: TipoArchDatos ;
	        	C: TipoArchControl ;
            I: TipoArchIndice;
	   End;

Var
	ME : TipoME ;
 Procedure creaMe (var Me:TipoME;ruta:string);
 Function Listavacia(var Me:TipoME; indice:Tipopocision):boolean;
 Procedure AbrirArchivos ( var Me:TipoME );
 Procedure CerrarArchivos ( var Me:TipoME )  ;
 Procedure destruirlista (var Me:TipoME;ruta:string );
 Function Primeropos (var Me:TipoME; indice:Tipopocision):Tipopocision;
 Procedure Insertar(var ME: TipoME; pos: Tipopocision; Reg: tiporegdatodoble; indice:Tipopocision);
 Function Ultimopos (var Me:TipoME; indice:Tipopocision):Tipopocision;
 function buscar (Var Me:Tipome;clave:tipoclave;var pos:Tipopocision; indice:Tipopocision):boolean;

  function identicos(Var Me:Tipome;copia:arreglo; indice:Tipopocision):boolean ;
 function Recuperar(var me:Tipome;pos:Tipopocision; indice:Tipopocision):tiporegdatodoble;
 Function Proximo(Var me:Tipome;pos:Tipopocision; indice:Tipopocision):Tipopocision;
 Function anterior(Var me:Tipome;pos:Tipopocision; indice:Tipopocision):Tipopocision ;
 Procedure Eliminar(var me:Tipome;pos:Tipopocision; indice:Tipopocision);
 Procedure Modificar(Var Me:Tipome;reg: tiporegdatodoble; pos:Tipopocision; indice:Tipopocision);
 Function DevolverUltimoID(Var Me:Tipome; indice:Tipopocision):integer;
 Procedure intercambiar_casogeneral_de_2_celulas_contuguas (var Me:Tipome;Pos1,Pos2:Tipopocision);
 Procedure intercambiar_casogeneral_de_2_celulas_separadas (var Me:Tipome;Pos1,Pos2:Tipopocision);

 procedure nuevocontrol(var Me:TipoME;numerojuego:integer);
 procedure eliminarcontrol(var Me:TipoME;pos:Tipopocision);
 function buscarcontrol( var Me:TipoME;clave:integer; var pos:Tipopocision):boolean;

 function cantidadcartonesTotales( var Me:TipoME; indice:Tipopocision):integer;
 function cartoneelejidoTotales( var Me:TipoME; indice:Tipopocision;numero:integer):tiporegdatodoble;
 function cantidadcartonesjugador(var Me:TipoME; indice:Tipopocision;idjugador:tipoclave):integer;
 function cartoneelejidojugador(var Me:TipoME; indice:Tipopocision; idjugador:tipoclave; numero:integer):tiporegdatodoble;
  procedure tachar (var Me:TipoME; indice:Tipopocision; Numeroelegido:integer);

  Procedure Premiosganados (matriz:tiporegdatodoble; var bingo,cuadradorgrande,cuadradorchico,cruz,diagonal,linea:integer );



  //---------------------------------------------------
implementation
//--------------------------------------------------CREAR LISTA
   Procedure creaMe (var Me:TipoME;ruta:string);
   var
   bErrordatos,bErrorcontrol,bErrorindice:boolean;
    RI: tiporegIndice;
   begin
        {$i-}
        assign(me.C,ruta+control);
        assign(me.D,ruta+datos);
        assign(me.I,ruta+indice);
        reset(me.C);
        berrorcontrol:=(ioresult<>0);
        reset(me.D);
        berrordatos:=(ioresult<>0);
        reset(me.I);
        bErrorindice:=(ioresult<>0);
        if berrorcontrol OR berrordatos or bErrorindice then
          begin
            Rewrite(me.c);
            Rewrite(me.D);
            Rewrite(me.I);
            ri.ultimaposcontrol:=posnula;
            seek(me.i,0);
            write(me.i,RI);
          end;
        close(me.I);
        close(me.C);
        close(me.D);
        {$i+}
end;
//----------------------------------------------------------La lista esta vasia?
Function Listavacia(var Me:TipoME; indice:Tipopocision):boolean;
var
RC: TipoRegControldoble;
begin
  seek(me.C,indice);
  Read(me.c,rc);
  If Rc.primero = posnula  then
    Listavacia:= true
  else
   Listavacia:= false ;
end;
//----------------------------------------- abrir lista
Procedure AbrirArchivos ( var Me: TipoMe );
Begin
  Reset (Me.I) ;
	Reset (Me.D) ;
	Reset (Me.C);
End;
//----------------------------------------- cerrar lista
Procedure CerrarArchivos ( var Me: TipoMe )  ;
Begin
  Close (Me.I) ;
	Close (Me.D);
	Close (Me.C);
End;
//---------------------------------------------------  Eliminar lista
Procedure destruirlista (var Me:TipoME;ruta:string);
   begin
     deletefile(ruta + indice);
     deletefile(ruta + control);
     deletefile(ruta + datos);
   end;
//-----------------------------------------   Primer posicion  de la lista
 Function Primeropos (var me:Tipome; indice:Tipopocision):Tipopocision;
 var
  RC: TipoRegControldoble;
 Begin
   Seek(ME.C,indice);
    Read(Me.c,rc);
  Primeropos :=Rc.Primero;
 End;
 //---------------------------------------------------  insertar un elemento
Procedure Insertar(var ME: TipoME; pos: Tipopocision; Reg: tiporegdatodoble; indice:Tipopocision);
var
rc: TipoRegControldoble;
raux, RSig,RAnt: tiporegdatodoble;
 posnueva:Tipopocision;
  RI: tiporegIndice;
begin
Seek(ME.C,indice);
Read(ME.C,RC);
Seek(ME.I,0);
Read(ME.I,RI);



PosNueva:=filesize(ME.D);
If RC.Primero = PosNula then
 begin {Inserto en lista vacia}
  RC.Primero:=PosNueva;
  RC.Ultimo:=PosNueva;
  Reg.enlaseprox:=PosNula;
  Reg.enlaseanterior:=PosNula;
 end
  else
  begin
      If RC.Primero=pos then
           begin  {Inserto al principio}
                 reg.enlaseprox:= posnula;
                 reg.enlaseanterior:= rc.primero;
                 seek(me.D, RC.Primero);
                 read(me.D, RAux);
                 RAux.enlaseprox:= PosNueva;
                 Seek(ME.D,RC.Primero);
                 Write(ME.D,RAux);
                 RC.Ultimo:=PosNueva;
            end
      else
            begin
                  If pos=RC.Ultimo then
                          begin  {Inserta al final}
                                    Reg.enlaseprox:=posnula;
                                    Reg.enlaseanterior:=rc.Ultimo;
                                    seek(me.D,rc.Ultimo);
                                    read(me.D,RAux);
                                    RAux.enlaseprox:=PosNueva;
                                    Seek(ME.D,RC.Ultimo);
                                    Write(ME.D,RAux);
                                    RC.Ultimo:=PosNueva;
                          end
                    else
                          begin  {Inserta al medio}
                                  Seek(ME.D,Pos);
                                  Read(ME.D,RSig);
                                  Seek(ME.D,RSig.enlaseanterior);
                                  Read(ME.d, RAnt);
                                  Reg.enlaseprox:=Pos;
                                  Reg.enlaseanterior:=RSig.enlaseanterior;
                                  rsig.enlaseanterior:=posnueva;
                                  rant.enlaseprox:=posnueva;
                                  Seek(me.D,pos);
                                  write(me.D,rsig);
                                  seek(me.D,reg.enlaseanterior);
                                  write(me.D,rant);
                          end;
            end;
  end;
  RC.UltimoIdinterno:=RC.UltimoIdinterno+1;
  Seek(ME.C,indice);
  Write(ME.C,RC);
  Seek(ME.D,PosNueva);
  Write(ME.D,Reg);
  Seek(ME.I,0);
  Write(ME.I,RI);


end;
//----------------------------------------   Ultima posicion de la lista
 Function Ultimopos (var me:Tipome; indice:Tipopocision):Tipopocision;
   var
   RC: TipoRegControldoble;

   Begin
          Seek(me.C,indice);
          Read(me.C,RC);
            If Rc.primero = posnula then
                Ultimopos := posnula
            else
                begin
                   Ultimopos:=Rc.ultimo;
                End;
   end;


//-----------------------------------------------------------------------------
function buscar (Var Me:Tipome;clave:tipoclave;var pos:Tipopocision; indice:Tipopocision):boolean;
var
  encontre,corte:boolean;
  rc:Tiporegcontroldoble;
 Reg:tiporegdatodoble;
BEGIN
	    seek(me.c,indice);
   	 read(me.c,Rc);
 	   encontre:=false;
   	 corte:=false ;
 	 pos:=Rc.Primero;
	While not(encontre)and not(corte)and (pos<>Posnula) do
		begin
			Seek(Me.D,pos);
			Read(Me.D,reg);
			If Reg.IdCarton=Clave then
				encontre:=true
			else
			begin
				If Reg.IdCarton>Clave	then
					Corte:=true
				else
					Pos:=Reg.enlaseprox
			end;
    end;
	Buscar:=encontre;
end;
//-----------------------------------------------------------
 function Recuperar(var me:Tipome;pos:Tipopocision; indice:Tipopocision):tiporegdatodoble;
 var
  Rc:Tiporegcontroldoble;
  RD:tiporegdatodoble;
 Begin
    Seek(me.C,indice);
    Read(me.C,RC);
    If Rc.PRIMERO<>posnula then
	    begin
	      Seek(Me.D,pos);
      	Read(Me.D,Rd);
	      Recuperar:=Rd;
      end;
 end;
 //-----------------------------------------------------
 Function Proximo(Var me:Tipome;pos:Tipopocision; indice:Tipopocision):Tipopocision;
    var
       RD:tiporegdatodoble;
        Rc:Tiporegcontroldoble;
 Begin
    Seek(me.C,indice);
    Read(me.c,rC);
    If rc.primero = posnula then
      begin
         Proximo:= posnula
      end
    else
      begin
      	  Seek(Me.D,pos);
          Read(Me.D,Rd);
          Proximo:=Rd.enlaseprox
      end;
 end;
 //------------------------------------------------------
 Function anterior(Var me:Tipome;pos:Tipopocision; indice:Tipopocision):Tipopocision ;
 var
  Rc:Tiporegcontroldoble;
  RD:tiporegdatodoble;

 begin
    Seek(me.C,indice);
    Read(me.C,RC);
    If Rc.primero = posnula then
       Anterior := posnula
    else
       begin
		Seek(ME.d,pos);
		read(Me.d,RD);
		Anterior:=Rd.Enlaseprox;
        end    
 END;
 //------------------------------------------------------
  Procedure Eliminar(var me:Tipome;pos:Tipopocision; indice:Tipopocision);
  var
   Rc:Tiporegcontroldoble;
  RD,Rd2,Rd3:tiporegdatodoble;


  Begin
    Seek(me.C,indice);
    Read(me.C,RC);
    IF Rc.primero = Rc.ULTIMO then
         begin
	            Rc.Primero:=posnula;
	            Rc.ultimo:=posnula;
         end
	  ELSE
	        begin
	              Seek(me.D,pos);
                Read(me.D,rd);
                If pos = rc.primero then
                    begin
                         Rc.primero:=Rd.Enlaseprox ;
                       	Seek(Me.d,Rd.Enlaseprox);
	                      Read(Me.d,Rd2) ;
                      	RD2.enlaseanterior:=posnula;
	                      Seek(Me.d,Rc.Primero);
	                      Write(ME.D,RD2)
                    end
                else
                    begin
                        If pos = Rc.Ultimo then
                              Begin
	                              	Rc.ultimo:=Rd.enlaseanterior;
	                              	Seek(Me.d,Rd.enlaseanterior);
	                               	Read(Me.d,Rd2);
	                              	RD2.enlaseprox:=posnula;
		                              Seek(Me.d,Rd.enlaseanterior);
		                              Write(ME.D,RD2);
	                            end
                      	else
		                        begin
			                              Seek(Me.d,Rd.enlaseanterior);
			                              Read(Me.d,Rd2);
			                              Rd2.enlaseprox:=Rd.enlaseprox;
			                              Seek(Me.d,Rd.enlaseprox);
			                              Read(Me.d,Rd3);
			                              Rd3.enlaseanterior:=Rd.enlaseanterior;
			                              Seek(Me.d,Rd.enlaseanterior);
			                              Write(Me.D,rd2);
			                              Seek(Me.d,Rd.enlaseprox);
			                              Write(Me.D,rd3);
                            end
                    end;
            end;
    Seek(me.C,indice);
    write(me.C,RC);
 end;
//--------------------------------------------------------
 Procedure Modificar(Var Me:Tipome;reg: tiporegdatodoble; pos:Tipopocision; indice:Tipopocision);
 var
  Rc:Tiporegcontroldoble;
  RD:tiporegdatodoble;
 begin
   Seek(me.C,indice);
    Read(me.C,RC);
    IF Rc.primero <> Posnula then
      Begin
        Seek(me.D,pos);
        Read(me.D,Rd);
        Rd:=Reg;
        Seek(me.D,pos);
        Write(me.D,Rd);
      end;
 end;
 //--------------------------------------------------------------
Procedure intercambiar_casogeneral_de_2_celulas_contuguas (var Me:Tipome;Pos1,Pos2:Tipopocision);
var
	RegA,RegB,Rant,Rsig,RegAsig:tiporegdatodoble;
  Pos1ant,Pos2sig :Tipopocision;
begin
seek(Me.D,pos1);
Read(Me.D,RegA);
Pos1ant:=regA.enlaseanterior;
seek(Me.D,pos2);
Read(Me.D,RegB);
Pos2sig:=regB.enlaseprox;
Seek(Me.D,pos1ant);
Read(Me.D,Rant);
Seek(Me.D,pos2sig);
Read(Me.D,Rsig);
RanT.enlaseprox:=Pos2 ;
Rsig.enlaseanterior:=Pos1;
RegAsig.enlaseprox:=pos2sig;
RegAsig.enlaseanterior:=pos2;
RegAsig.enlaseprox:=pos1ant;
RegAsig.enlaseanterior:=pos1;
Seek(Me.D,Pos1ant);
Write(Me.D,Rant);
Seek(Me.D,Pos1);
Write(Me.D,RegA);
Seek(Me.D,Pos2);
Write(Me.D,RegB);
Seek(Me.D,Pos2Sig);
Write(Me.D,Rsig);
end;
  //----------------------------------------------------
Procedure intercambiar_casogeneral_de_2_celulas_separadas (var Me:Tipome;Pos1,Pos2:Tipopocision);
var
		RegA,RegB,RantA,RsigA,RsigB,RantB:tiporegdatodoble;
  Pos1ant,Pos2ant,Pos1Sig,Pos2sig :Tipopocision;
begin

seek(Me.D,pos1);
Read(Me.D,RegA);
Pos1ant:=regA.enlaseanterior;
Pos1Sig:=regA.enlaseprox;
seek(Me.D,pos1ant);
Read(Me.D,RAntA);
seek(Me.D,pos1sig);
Read(Me.D,RSigA);
seek(Me.D,pos2);
Read(Me.D,Regb);
Pos2sig:=regB.enlaseprox;
Pos2ant:=regB.enlaseanterior;


Seek(Me.D,pos2sig);
Read(Me.D,RsigB);
Seek(Me.D,pos2ant);
Read(Me.D,RantB);

RantA.enlaseprox:=Pos2 ;
RegA.enlaseanterior:=Pos2ant;
RegA.enlaseprox:=Pos2sig;
RsigA.enlaseanterior:=Pos2 ;

RantB.enlaseprox:=Pos1;
RegB.enlaseanterior:=Pos1Ant;
RegB.enlaseprox:=Pos1sig;
RsigB.enlaseanterior:=Pos1;


seek(Me.D,pos1);
Write(Me.D,RegA);
seek(Me.D,pos1ant);
Write(Me.D,RAntA);
seek(Me.D,pos1sig);
Write(Me.D,RSigA);
seek(Me.D,pos2);
Write(Me.D,Regb);

end;

Function DevolverUltimoID(Var Me:Tipome; indice:Tipopocision):integer;
   var
        RC: TipoRegControldoble;
   Begin
        Seek(me.C,indice);
        Read(me.C,RC);
        DevolverUltimoID := Rc.UltimoIdinterno;

   end;






  function identicos(Var Me:Tipome;copia:arreglo; indice:Tipopocision):boolean ;
 var
    x,y:integer;
    pos:Tipopocision;
    rc:Tiporegcontroldoble;
    Reg:tiporegdatodoble;
    corte,distinto:boolean;
    begin

            seek(me.c,indice);
   	        read(me.c,Rc);
 	          pos:=Rc.Primero;
            corte:=false;
          	While (corte = false) and (pos<>Posnula) do
		              begin
                      Seek(Me.D,pos);
                      Read(Me.D,reg);
                      distinto:=false;
                       x:=0;
                       y:=0;
                      while (x <> 4) and (distinto = false) do
                          begin
                             while (y <> 4) and (distinto = false) do
                                  begin
                                     if reg.Grilla[x,y].Numero <> copia[x,y].Numero then
                                         distinto:= true;
                                      y:=y+1  ;
                                  end;
                                  x:=x+1
                          end;
                       if  distinto = false then
                           corte:=true;
                       pos:=reg.enlaseprox;
                  end;
            if corte = true then
               identicos:=false
            else
                identicos:=true;
    end;

 procedure nuevocontrol(var Me:TipoME;numerojuego:integer);
 var
    RC: TipoRegControldoble;
    RI: tiporegIndice;
 begin
            Seek(me.I,0);
            Read(me.I,RI);
            RI.ultimaposcontrol:=RI.ultimaposcontrol+1;
            rc.IddeJuego:=numerojuego;
            RC.primero:=Posnula;
            Rc.ultimo:=Posnula;
            Rc.bajas:=Posnula;
            rc.UltimoIdinterno:=0;
            seek(me.C,RI.ultimaposcontrol);
            write(me.C,rc);
            Seek(me.I,0);
            write(me.I,RI);

 end;

 procedure eliminarcontrol(var Me:TipoME;pos:Tipopocision);
 var
      RC: TipoRegControldoble;
      RI: tiporegIndice;
      i:integer;
 begin
        seek(Me.I, 0);
        read(Me.I, RI);

        for i := pos + 1 to Ri.ultimaposcontrol do
            begin
              seek(Me.C, i);
              read(Me.C, RC);
              seek(Me.C, i - 1);
              write(Me.C, RC);
            end;

            Ri.ultimaposcontrol := Ri.ultimaposcontrol - 1;
            seek(Me.I, 0);
            write(Me.I, RI);
 end;

  function buscarcontrol( var Me:TipoME;clave:integer; var pos:Tipopocision):boolean;

  var

  encontrado:boolean;
  RC: TipoRegControldoble;
  RI: tiporegIndice;

  begin
     seek(me.I,0);
     read(me.I, RI);
     pos:=0;
     encontrado := false;
     while (pos <> Ri.ultimaposcontrol+1) and (encontrado = false) do
          begin
              seek(Me.C, pos);
              read(Me.C, RC);
              if rc.IddeJuego = clave then
                 encontrado:=true
              else
                  pos:=pos+1;

          end;
      buscarcontrol:=encontrado;

  end;

  function cantidadcartonesTotales( var Me:TipoME; indice:Tipopocision):integer;

  var
    cant:integer;
    RC: TipoRegControldoble;
    Reg:tiporegdatodoble;
    pos:Tipopocision;
   begin
          seek(me.c,indice);
   	      read(me.c,Rc);
 	        pos:=Rc.Primero;
          cant:=0;
	        While (pos<>Posnula) do
		              begin
			                Seek(Me.D,pos);
			                Read(Me.D,reg);
                      cant:=cant+1;
                      pos:=reg.enlaseprox;
                  end;
          cantidadcartonesTotales:=cant;
  end;

   function cartoneelejidoTotales( var Me:TipoME; indice:Tipopocision;numero:integer):tiporegdatodoble;
       var
    cant:integer;
    RC: TipoRegControldoble;
    Reg:tiporegdatodoble;
    pos:Tipopocision;
        begin
          seek(me.c,indice);
   	      read(me.c,Rc);
 	        pos:=Rc.Primero;
          cant:=0;
	        While cant<>numero do
		              begin
			                Seek(Me.D,pos);
			                Read(Me.D,reg);
                      cant:=cant+1;
                      pos:=reg.enlaseprox;
                  end;
          cartoneelejidoTotales:=reg;
        end;



   function cantidadcartonesjugador(var Me:TipoME; indice:Tipopocision;idjugador:tipoclave):integer;
   var
    cant:integer;
    RC: TipoRegControldoble;
    Reg:tiporegdatodoble;
    pos:Tipopocision;
   begin
          seek(me.c,indice);
   	      read(me.c,Rc);
 	        pos:=Rc.Primero;
          cant:=0;
	        While (pos<>Posnula) do
		              begin
			                Seek(Me.D,pos);
			                Read(Me.D,reg);
                      if reg.Iddeljugador = idjugador then
                         cant:=cant+1;
                      pos:=reg.enlaseprox;
                  end;
          cantidadcartonesjugador:=cant;

   end;


 function cartoneelejidojugador(var Me:TipoME; indice:Tipopocision; idjugador:tipoclave; numero:integer):tiporegdatodoble;
  var
    cant:integer;
    RC: TipoRegControldoble;
    Reg:tiporegdatodoble;
    pos:Tipopocision;
  begin
          seek(me.c,indice);
   	      read(me.c,Rc);
 	        pos:=Rc.Primero;
          cant:=0;
	        While cant<>numero do
		              begin
			                Seek(Me.D,pos);
			                Read(Me.D,reg);
                      if reg.Iddeljugador = idjugador then
                         cant:=cant+1;
                      pos:=reg.enlaseprox;
                  end;
          cartoneelejidojugador:=reg;
  end;

  procedure tachar (var Me:TipoME; indice:Tipopocision; Numeroelegido:integer);
   var
    RC: TipoRegControldoble;
    Reg:tiporegdatodoble;
    pos:Tipopocision;
    x,y:integer ;
  begin
          seek(me.c,indice);
   	      read(me.c,Rc);
 	        pos:=Rc.Primero;
	        While (pos<>Posnula) do
            begin
			                Seek(Me.D,pos);
			                Read(Me.D,reg);
                       x:=0;
                       y:=0;
                      while (x <> 5) do
                          begin
                             while (y <> 5) do
                                  begin
                                     if reg.Grilla[x,y].Numero = Numeroelegido then
                                         reg.Grilla[x,y].Tachado:=true;
                                      y:=y+1  ;
                                  end;
                                  y:=0;
                                  x:=x+1
                          end;
                          Seek(Me.D,pos);
			                    write(Me.D,reg);
                  pos:=reg.enlaseprox;
              end;
  end;

    Procedure Premiosganados (matriz:tiporegdatodoble; var bingo,cuadradorgrande,cuadradorchico,cruz,diagonal,linea:integer );
    var
        x,y:integer;
        encontre:boolean;
     begin
            bingo:=0;
            cuadradorgrande:=0;
            cuadradorchico:=0;
            cruz:=0;
            diagonal:=0;
            linea:=0;
            x:=0;
            y:=0;
            encontre:=true;                         //bingo
            while (x <> 5) and (encontre=true) do
              begin
                while (y <> 5)  and (encontre=true) do
                  begin
                    if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                    else
                        encontre:=false
                  end;
                  y:=0;
                  x:=x+1
              end;
            if (encontre = true) then
                 bingo:=1
            else
                begin
                   x:=0;
                   y:=0;
                   bingo:=0;
                   encontre:=true;             //cuadrado grande
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;
                   while (x <> 0) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x-1
                        else
                        encontre:=false
                   end;
                   while (y <> 0) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y-1
                        else
                        encontre:=false
                   end;
                   if (encontre = true) then
                      cuadradorgrande:=1
                   else
                      cuadradorgrande:=0;
                   x:=1;
                   y:=1;
                   encontre:=true;                           //cuadrado chico
                   while (x <> 3) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;
                   while (y <> 3) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;
                   while (x <> 0) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x-1
                        else
                        encontre:=false
                   end;
                   while (y <> 0) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y-1
                        else
                        encontre:=false
                   end;
                   if (encontre = true) then
                      cuadradorchico:=1
                   else
                      cuadradorchico:=0;

                   x:=0;
                   y:=2;
                   encontre:=true;             //cruz
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;
                   y:=0;
                   x:=2;
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      Cruz:=1
                   else
                      Cruz:=0;


                   x:=0;
                   y:=0;
                   encontre:=true;             //diagonales 1

                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                              begin
                                  x:=x+1;
                                  y:=y+1;
                              end
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      diagonal:=diagonal+1
                   else
                      diagonal:=diagonal;




                   x:=5;
                   y:=0;
                   encontre:=true;              //diagonales 2
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                              begin
                                  x:=x-1;
                                  y:=y+1;
                              end
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      diagonal:=diagonal+1
                   else
                      diagonal:=diagonal;


                   x:=0;
                   y:=0;
                  encontre:=true;              //horizontal 1
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1-cuadradorgrande
                   else
                      linea:=linea;

                   x:=0;
                   y:=1;
                  encontre:=true;              //horizontal 2
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1
                   else
                      linea:=linea;

                   x:=0;
                   y:=2;
                  encontre:=true;              //horizontal 3
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1-cruz
                   else
                      linea:=linea;

                   x:=0;
                   y:=3;
                  encontre:=true;              //horizontal 4
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1
                   else
                      linea:=linea;

                   x:=0;
                   y:=4;
                  encontre:=true;              //horizontal 5
                   while (x <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          x:=x+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1-cuadradorgrande
                   else
                      linea:=linea;


                   x:=0;
                   y:=0;
                  encontre:=true;              //vertical 1
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1-cuadradorgrande
                   else
                      linea:=linea;

                   x:=1;
                   y:=0;
                  encontre:=true;              //vertical 2
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;

                   if (encontre = true) then
                      linea:=linea+1
                   else
                      linea:=linea;

                   x:=2;
                   y:=0;
                  encontre:=true;              //vertical 3
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;

                   if encontre then
                      linea:=linea+1-cruz
                   else
                      linea:=linea;

                   x:=3;
                   y:=0;
                  encontre:=true;              //vertical 4
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false;
                   end;

                   if encontre then
                              linea:=linea+1
                   else
                              linea:=linea;

                   x:=4;
                   y:=0;
                  encontre:=true;              //vertical 5
                   while (y <> 5) and (encontre=true)  do
                   begin
                        if matriz.Grilla[x,y].tachado = true then
                          y:=y+1
                        else
                        encontre:=false
                   end;

                   if encontre then
                      linea:=linea+1-cuadradorgrande
                   else
                      linea:=linea;

            end;
    end;




end.
