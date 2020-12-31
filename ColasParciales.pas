unit ColasParciales;

interface
 uses
Classes,Sysutils;

  Const

    Datos = 'Datoscola.dat';
    control = 'controlcola.dat';
    posnula = -1;
  
  Type
  Tipopocision = longint;
  tipoclave = integer;
  tiporegdato = record
                clave:tipoclave;
                enlase:Tipopocision;
              end;
  TipoArchDatos = file of tiporegdato;
  tiporegcontrol = record
                primero:Tipopocision;
                ultimo:Tipopocision;
                baja:Tipopocision;
              end;
  TipoArchControl = file of tiporegcontrol;
  TipoME = Record
	         	D: TipoArchDatos ;
	        	C: TipoArchControl ;
	   End;
var
   	Cola : TipoME ;
procedure crearcola(var cola:tipoMe;ruta:string);
procedure abrircola(var cola:tipoMe);
procedure Cerrarcola(var cola:tipoMe);
procedure encolar(var cola:tipoMe;reg:tiporegdato;controldecabezera : Tipopocision );
procedure decolar(var cola:tipoMe;controldecabezera : Tipopocision );
Procedure Frente (var cola:tipoMe;var reg:tiporegdato;controldecabezera : Tipopocision);
Function colavacia (var cola:tipoMe;controldecabezera : Tipopocision):boolean;
Procedure destruircola (var cola:tipome;ruta:string);
Function buscar (var cola:tipome;clave:tipoclave;controldecabezera : Tipopocision):boolean;

//----para las cabezeras
  Function posnuevacabecera (var cola:tipome):integer;
  Procedure incertarcabecera(var cola:tipome;pos:integer);
  Function cabeceralibre (var cola:tipome;pos:integer):boolean;


implementation
 procedure crearcola(var cola:tipoMe;ruta:string);
	var
		berrordatos,berrorcontrol:boolean;
		Rc:tiporegcontrol;
begin
     {$i-}
	assign(cola.C,ruta+Control);
	assign(cola.D,ruta+Datos);
	reset(cola.c);
	berrorcontrol:=(ioresult<>0);
	reset(cola.d);
	berrordatos:=(ioresult<>0);
	if berrordatos and berrorcontrol then
  begin
		rewrite(cola.c);
		rewrite(cola.d);
		Rc.primero:=posnula;
		Rc.ultimo:=posnula;
		Rc.baja:=posnula;
		write(cola.c,Rc);
  end ;
    close(cola.c);
		close(cola.d);
      {$i+}
end;
//----------------------------------------------------
procedure abrircola(var cola:tipoMe);
begin
  reset(cola.c);
	reset(cola.d);
end;
//----------------------------------------------------
procedure Cerrarcola(var cola:tipoMe);
begin
  close(cola.c);
	close(cola.d);
end;
//----------------------------------------------------
procedure encolar(var cola:tipoMe;reg:tiporegdato;controldecabezera : Tipopocision );
var
	Rc:tiporegcontrol;
	Raux:tiporegdato;
  posnueva: tipopocision;
begin
	   	posnueva:=filesize(cola.d);
      Seek(cola.C,controldecabezera);
      Read(cola.C,RC);
		      if rc.primero = posnula then
		             begin
		                	rc.primero := posnueva ;
		                	rc.ultimo:=posnueva ;
	                		reg.enlase:=posnula ;
		              end
	      	else
		                begin
		                  	seek(cola.d,Rc.ultimo);
		                   	read(cola.d,Raux);
                        Raux.enlase:=posnueva;
		                   	seek(cola.d,rc.ultimo);
		                  	write(cola.d,raux);
		                  	reg.enlase:=posnula;
		                   	Rc.ultimo:=posnueva;
		                end;
   Seek(cola.C,controldecabezera);
	 write(cola.c,Rc);
	 seek(cola.D,posnueva);
	 write(cola.D,reg);
end;
//----------------------------------------------------
procedure decolar(var cola:tipome;controldecabezera : Tipopocision);
var
	Rc:tiporegcontrol;
	Raux:tiporegdato;
  posborrado:Tipopocision;
begin
	seek(cola.c,controldecabezera);
	read(cola.c,Rc);
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
			          seek(cola.d,posborrado);
		          	read(cola.d,Raux);
		          	rc.primero:=Raux.enlase ;
		        end ;
	      seek(cola.d,posborrado);
	      read(cola.d,Raux);
      	Raux.enlase:=Rc.baja;
	      Rc.baja:=Posborrado;
	      seek(cola.d,posborrado);
	      write(cola.d,raux);
	      seek(cola.c,controldecabezera);
	      write(cola.c,rc);
  end;
end;
//----------------------------------------------------
Procedure Frente (var cola:tipome;var reg:tiporegdato;controldecabezera : Tipopocision );
var
	Rc:tiporegcontrol;

begin
	seek(cola.c,controldecabezera);
	read(cola.c,Rc);
  If rc.primero <> posnula THEN
    Begin
      	seek(cola.D,Rc.primero);
	      Read(cola.d,reg);
    end;
end;
//----------------------------------------------------
Function colavacia (var cola:tipoMe;controldecabezera : Tipopocision):boolean;
var
	Rc:tiporegcontrol ;
begin
	seek(cola.c,controldecabezera);
	read(cola.c,Rc);
	colavacia:=(rc.primero = posnula)
end;
 //----------------------------------------------------
Procedure destruircola (var cola:tipome;ruta:string);
begin
deletefile(ruta+control);
deletefile(ruta+datos);
end;
//----------------------------------------------------
Function buscar (var cola:tipome;clave:tipoclave;controldecabezera : Tipopocision):boolean;
var
	encontre:boolean;
  Rc:tiporegcontrol ;
  pos:Tipopocision ;
  Raux:tiporegdato;
begin
     seek(cola.C,controldecabezera);
     read(cola.c,rc);
     pos:=rc.primero;
     if rc.primero <> posnula then
          begin
                encontre:=false;
                while (pos <> posnula)  and (encontre<>true) do
                begin
                    seek(cola.D,pos);
                    read(cola.D,Raux);
                    if Raux.clave = clave then
                         encontre:=true
                    else
                        pos:= Raux.enlase;
                end;
               buscar:=encontre;
          end
     else
         buscar:=false;
end ;  
//----------------------------------------------------

  Function posnuevacabecera (var cola:tipome):integer;
     begin
          posnuevacabecera:=filesize(cola.C);
     end;

   Function cabeceralibre (var cola:tipome;pos:integer):boolean;
   var
	    Rc:tiporegcontrol ;
       begin
            seek(cola.C,pos);
            read(cola.C,rc);
            {$i+}
            If ioresult = 0 then
              begin
                    if   (rc.primero = posnula) and (rc.ultimo = posnula) and (rc.baja = posnula)  then
                           cabeceralibre:=false
                      else
                          cabeceralibre:=true ;
                end
            else
               cabeceralibre:=false;


       end;



  Procedure incertarcabecera(var cola:tipome;pos:integer);
  var
	    Rc:tiporegcontrol ;
  begin

        Rc.primero:=posnula;
	    	Rc.ultimo:=posnula;
		    Rc.baja:=posnula;
        seek(cola.C,pos);
		    write(cola.c,Rc);
  end;


END.
