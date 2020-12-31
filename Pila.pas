unit Pila;

interface
uses
Classes,Sysutils;
Const
    posnula = -1;
    Clavenula='*';
  Type
  Tipopocision = longint;
  tipoclave = integer;
  tiporegdatopila = record
                clave:tipoclave;
                Tipodepremio:1..6;
                Importe: real;
                Enlace:Tipopocision;
              end;
  TipoArchDatos = file of tiporegdatopila;
  tiporegcontrolpila = record
                primero:Tipopocision;
                ultimo:Tipopocision;
                borrado:Tipopocision;
              end;
  TipoArchControl = file of tiporegcontrolpila;
  TipoMePilas = Record
	         	D: TipoArchDatos ;
	        	C: TipoArchControl ;
	   End;

Var
 	Pilas : TipoMePilas ;

  Procedure crearpila(var pilas:TipoMePilas;nombre,ruta,extdatos,extcontrol:string);
  Procedure Abrirpila (var pilas:TipoMePilas);
  Procedure Cerrarpila (var pilas:TipoMePilas);
  Function Primeropila (var Pilas:TipoMePilas;controldecabezera : Tipopocision ):Tipopocision;
  Function Tope (var Pilas:TipoMePilas;controldecabezera : Tipopocision  ):tiporegdatopila;
  Procedure Apilar (var Pilas:TipoMePilas; reg:tiporegdatopila;controldecabezera : Tipopocision   );
  Procedure Desapilar (var Pilas:TipoMePilas ;controldecabezera : Tipopocision );
  Procedure Eliminar(var pilas:TipoMePilas;nombre,ruta,extdatos,extcontrol:string) ;
  function vacio(var pilas:TipoMePilas;controldecabezera : Tipopocision  ):boolean ;
  //----para las cabezeras
  Function posnuevacabecera (var pilas:TipoMePilas):integer;
  Procedure incertarcabecera(var pilas:TipoMePilas;pos:integer);



implementation
 procedure crearpila(var pilas:TipoMePilas;nombre,ruta,extdatos,extcontrol:string);
 var
      Lerrorc,Lerrord:boolean;
      Rc: tiporegcontrolpila;
 begin
  assign(pilas.D,ruta+nombre+extdatos);
  assign(pilas.C,ruta+nombre+extcontrol);
  {$I-}
  Reset(pilas.c);
  Lerrorc:=IOResult<>0;
  reset(pilas.d);
  Lerrord:=IOResult<>0;
  if Lerrorc and Lerrord then
    begin
    rewrite(pilas.c);
    rewrite(pilas.d);
    Rc.primero:=posnula;
    Rc.ultimo:=posnula;
    Rc.borrado:=Posnula;
    seek(pilas.C,0) ;
    write(Pilas.C,rc);
    end;
    close(pilas.c);
    close(pilas.d);
    {$I+}
 end;

   Procedure Abrirpila (var pilas:TipoMePilas);
  begin

    Reset(Pilas.C);
    Reset(Pilas.D);
  end;

  Procedure Cerrarpila (var pilas:TipoMePilas);
  begin
    Close(Pilas.c);
    Close(Pilas.d);
  end;

   Function Primeropila (var Pilas:TipoMePilas;controldecabezera : Tipopocision ):Tipopocision;
  var
    rc:tiporegcontrolpila;
  begin
    Seek(Pilas.C,controldecabezera);
    read(Pilas.C,rc);
    Primeropila:=rc.primero;
  end;

  Function Tope (var Pilas:TipoMePilas;controldecabezera : Tipopocision ):tiporegdatopila;
  var
    rc:tiporegcontrolpila;
    REG:tiporegdatopila;
  begin
    Seek(Pilas.C,controldecabezera);
    read(Pilas.C,rc);
    seek(Pilas.D,Rc.primero);
    Read(Pilas.d,reg);
    Tope:=reg;
  end;

  

 Procedure Apilar (var Pilas:TipoMePilas; reg:tiporegdatopila ;controldecabezera : Tipopocision );
	var
	    Rc: tiporegcontrolpila;
      posnueva: tipopocision;
  begin
		posnueva:=filesize(Pilas.d);
    seek(Pilas.C,controldecabezera);
    Read(Pilas.C,RC);
    If Rc.borrado = Posnula then
    begin
		      if rc.primero = posnula then
                  begin
		                	rc.primero := posnueva ;
		                	rc.ultimo:=posnueva ;
	                		reg.Enlace:=posnula ;
		              end
	      	else
                 begin
                          Reg.Enlace:=Rc.primero ;
                          Rc.primero:=posnueva;
                end;
    end
    Else
      Begin
       Reg.Enlace:=Rc.primero;
       Rc.borrado:=Posnula;
       Rc.primero:=Posnueva;
      end;
     Seek(Pilas.C,controldecabezera);
     write(Pilas.c,Rc);
     seek(Pilas.D,posnueva);
     write(Pilas.D,reg);
  end;

   Procedure Eliminar(var pilas:TipoMePilas;nombre,ruta,extdatos,extcontrol:string) ;
   begin
   deletefile(ruta+nombre+extdatos);
   deletefile(ruta+nombre+extcontrol);
   end;

 Procedure Desapilar (var Pilas:TipoMePilas;controldecabezera : Tipopocision );
   var
       rc:tiporegcontrolpila;
       Raux:tiporegdatopila;
       posborrado:Tipopocision;
 begin
	      seek(Pilas.c,controldecabezera);
	      read(Pilas.c,Rc);
        If rc.primero <> Posnula then
              begin
	                if rc.primero = rc.ultimo then
	        	            begin
		                          	posborrado:=rc.primero;
		        	                	rc.primero:=posnula;
		        	                	rc.ultimo:=posnula;
		                    end
      	           else
	                     	begin
                                posborrado:=rc.primero;
			                          seek(Pilas.d,posborrado);
		          	                read(Pilas.d,Raux);
		          	                rc.primero:=Raux.Enlace ;
                        end ;
                  seek(Pilas.d,posborrado);
	                read(Pilas.d,Raux);
      	          Raux.Enlace:=Rc.borrado;
	                Rc.borrado:=Posborrado;
	                seek(Pilas.d,posborrado);
	                write(Pilas.d,raux);
	                seek(Pilas.c,controldecabezera);
	                write(Pilas.c,rc);
              end;
 end;


  function vacio(var pilas:TipoMePilas;controldecabezera : Tipopocision ):boolean ;
      var
          rc:tiporegcontrolpila;
      begin
          Seek(Pilas.C,controldecabezera);
          read(Pilas.C,rc);
          if rc.primero = posnula then
                vacio:=true
          else
                vacio:=false
      end;


  Function posnuevacabecera (var pilas:TipoMePilas):integer;
    begin
        posnuevacabecera:=filesize(Pilas.C);
    end;


  Procedure incertarcabecera(var pilas:TipoMePilas;pos:integer);
    var
        Rc:tiporegcontrolpila;
   begin
        Reset(pilas.c);
        Rc.primero:=posnula;
        Rc.ultimo:=posnula;
        Rc.borrado:=Posnula;
        seek(pilas.C,pos) ;
        write(Pilas.C,rc);
   end;



end.
