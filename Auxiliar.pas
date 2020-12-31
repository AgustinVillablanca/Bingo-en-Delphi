unit Auxiliar;

interface
 uses
 pila,Arboltrinario,Archivo,ColasParciales,DobleEnlace,HashConColisiones,LibreberiaBasicaArbol,LibreriaArbolAVL,
 Windows, Messages,Dialogs,Grids,jpeg,Graphics,ExtCtrls,axCtrls,sysutils,StdCtrls;

 Type
  Carton = DobleEnlace.arreglo;
  objetogrilla = class(Grids.TStringGrid);
 var
      Rutamaestra:string;
      grillaamostrar,formanterior,NCantidades:integer;
      usuario:Archivo.tiporegdato;
      juego: HashConColisiones.tiporegdato;


      VARMECartones : DobleEnlace.TipoME;
      VARMEBolillerostirados: ColasParciales.TipoME ;
      VARMEBolilleros: pila.TipoMePilas ;
      VARMEPremiosGanadores: pila.TipoMePilas ;
      VARMEJugadores : Archivo.Mearcjugador;
      VARMEJugadoresindiceNick: LibreberiaBasicaArbol.Mearbol;
      VARMEJugadoresindiceID: LibreberiaBasicaArbol.Mearbol;
      VARMEGanadores: Arboltrinario.TipoMETrinario ;
      VARMEJuegos : HashConColisiones.TipoMEhash ;

      VARtiporegdatosCartones :DobleEnlace.tiporegdatodoble;
      VARtiporegdatosBolilleros:pila.tiporegdatopila;
      VARtiporegdatosPremiosGanadores:pila.tiporegdatopila;
      VARtiporegdatosBolillerostirados:ColasParciales.tiporegdato;
      VARtiporegdatosJugadores:Archivo.tiporegdato;
      VARtiporegdatosJugadoresindice:LibreberiaBasicaArbol.Indice;
      VARtiporegdatosGanadores:Arboltrinario.tiporegIndicetri;
      VARtiporegdatosJuegos:HashConColisiones.tiporegdato;




  Procedure cantidaddejugadores (tipoindice: Mearbol; pos:integer ;var cant:integer);
  procedure llenargrillaListadodejugador( tipoindice: Mearbol; grilla:TStringGrid; pos:integer ;tipoarchivo:Mearcjugador ;Nombrejuego:String);
  procedure llenargrillaListadodejugadoractivos( tipoindice: Mearbol; grilla:TStringGrid; pos:integer ;tipoarchivo:Mearcjugador ;Nombrejuego:String);
  function  buscarenrepetidos(das:array of integer;num:integer):boolean ;
  procedure incertarenlista( var das:array of integer;num:integer) ;
  procedure eliminarrepetidolista(var das:array of string);
  procedure limpiarlista(var  das:array of integer) ;
  function  identicos(original,copia:array of integer):boolean ;
  procedure pasaralagriila (original:Carton;mostrar:TStringGrid);
  procedure limpiargrilla(mostrar:TStringGrid);
  Function CalcularGanador( ME: DobleEnlace.TipoME;indice:integer;var cant:integer;var nombreganador:array of string ):boolean;
  Procedure GuardarResultados(tipoindice:Mearbol;posinicial:integer;Nombredeljuego:String);
  procedure llenargrilladejugadores(grilla:TStringGrid;tipoindice:Mearbol;posinicial:integer;idjuego,z:integer);

  procedure llenargrillaListadodejugadoraeliminar(Me:Mearbol;var grilla:TStringGrid;pos:integer);

  procedure llenargrilladepremios(grilla:TStringGrid;tipoindice:Mearbol;posinicial:integer;nombrejuego:string;x:integer);
  Procedure Listarjugadores(var das:array of string; tipoindice: Mearbol; pos,indicejuego:integer ;var posarreglo:integer;tipoarchivo:Mearcjugador);
  Procedure ganaciasjugadorjuego(nombrejugador,nombrejuego:string;var total:real);
  procedure Premiodelnobingo(tipoindice:Mearbol;posinicial:integer;Nombredeljuego:string;var resultado,cantidaddebingos:real);
  procedure cantidaddepremiosganados(nombrejugador,nombrejuego:string;var total:integer);
  procedure CalendarioJuegosActivos (grilla:TStringGrid);
  procedure CalendarioJuegoaordenar (grilla:TStringGrid);
  Procedure dispersiondehash (Me:TipoMEhash;var grilla:TStringGrid);
  procedure dispersionarbolbinario(Me:Mearbol;var grilla:TStringGrid;pos:integer; orden:integer);
  procedure dispersionarboltrinario(Me:TipoMETrinario;var grilla:TStringGrid;pos:integer; orden:integer);

  procedure pasaralagriilarepeticion(var das:array of integer;original:Carton;mostrar:TStringGrid);
  procedure contarpremiosguardadosdejugadorjuego(Mearbol:TipoMETrinario;Mepila:TipoMePilas;idjugador,Idjuego:string;var cantidaddepremios:integer; var Totaldelospremios:real);
  procedure contarpremiosguardadosdetodojugador (Mearbol:TipoMETrinario;Mejuegos:TipoMEhash;Mepila:TipoMePilas;idjugador:integer;var Preacumulado:integer; var Pretotal:real);

  procedure OrdenarGrid(StrGrd: TStringGrid; ACol: Integer);
  procedure posicionamientojugadorescompras(Me:Mearbol;pos,posendatosdeljugadorbuscado:integer ; var posicionenelranking:integer);
  procedure jugadorconmascartoneseneljuego(Me:Mearbol;pos:integer;var nombrejugador,nombrejuego:string;var total:integer);
  procedure llenargrillarankingdecompra(Me:Mearbol;pos:integer;var grilla:TStringGrid);
  procedure cantidaddecartonescompradosporunjugador(nombrejugador:string;var cantidadcartones:integer);
  procedure llenargrillajugadoresconmasdinero (Me:Mearbol;pos:integer;var grilla:TStringGrid);
  procedure posicionamientojugadorespremios (Me:Mearbol;pos,IDusuario:integer;var ranking:integer);
  procedure listadojugadoresconundeterminado(Me:Mearbol;pos:integer;var grilla:TStringGrid;tipodepremio :integer);
  procedure cantidaddedeterminadosporjugador(idjugador:integer; tipodepremio:integer;var cantidad:integer);
  procedure listadodecartonesganadores(var grilla:TStringGrid);
  procedure quitareltachado(var original:Carton);
  procedure agregartachado ( das:array of integer;var original:Carton);
implementation

  procedure quitareltachado (var original:Carton);
  var
     x,y:integer;
  begin

       for x:=0 to 4 do
       begin
            for y:=0 to  4do
            begin
                if  original[x,y].Tachado then
                    begin
                          original[x,y].Tachado:=false;
                    end;
            end;
       end;
  end;


    procedure agregartachado ( das:array of integer;var original:Carton);
      var
         x,y,i:integer;
      begin

         for x:=0 to 4 do
            begin
               for y:=0 to  4do
                  begin
                        for i:=0 to 74 do
                            begin
                                if  das[i] =  original[x,y].numero then
                                      begin
                                            original[x,y].Tachado:=true;
                                      end;
                            end;
                  end;
            end;
     end;





    procedure listadodecartonesganadores(var grilla:TStringGrid);
          var
                 i,posarbol,postri,cantidaddecartones,bingo,cuagrande,cuachico,cruz,diagonal,linea,x,w,y,cantboli:integer;
                 listado:array [0..40] of string;
                 boliya:array [0..74] of integer;
                 premio:array [0..1000] of real;
                 tipopremio:array [0..1000] of integer;
                 ganacia:real;
                 claveparaeltri:string;

          begin
                  if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                      begin
                          HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                          i:=1;
                          while i <> Length (listado) do
                                begin
                                     if listado[i] <> '' then
                                          begin
                                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                      begin
                                                          if (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado) = F then
                                                              begin
                                                                      VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                                                                      cantidaddecartones:=DobleEnlace.cantidadcartonesTotales(auxiliar.VARMECartones,VARtiporegdatosJuegos.ElIddelJuego);
                                                                      while cantidaddecartones <> 0 do
                                                                          begin
                                                                                VARtiporegdatosCartones:=cartoneelejidoTotales(auxiliar.VARMECartones,VARtiporegdatosJuegos.ElIddelJuego,cantidaddecartones);
                                                                               DobleEnlace.Premiosganados(VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                                                                                 if bingo = 1  then
                                                                                      begin
                                                                                             LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceID,inttostr(VARtiporegdatosCartones.Iddeljugador),posarbol);
                                                                                             VARtiporegdatosJugadores:=archivo.capturarmeArc(auxiliar.VARMEJugadores,posarbol);
                                                                                             claveparaeltri:=VARtiporegdatosJugadores.IDusuario+'_'+inttostr(VARtiporegdatosJuegos.ElIddelJuego);
                                                                                             ArbolTrinario.Buscararboltri(auxiliar.VARMEGanadores,claveparaeltri,postri);
                                                                                             ArbolTrinario.Capturararboltri(auxiliar.VARMEGanadores,VARtiporegdatosGanadores,postri);
                                                                                             x:= 0;
                                                                                             y:= 0;
                                                                                             ganacia:=0;
                                                                                             limpiarlista(tipopremio);
                                                                                             limpiarlista(boliya);
                                                                                           while  (not(pila.vacio(auxiliar.VARMEPremiosGanadores,VARtiporegdatosGanadores.HijoMedio))) do
                                                                                                begin
                                                                                                    VARtiporegdatosPremiosGanadores:=  pila.Tope(auxiliar.VARMEPremiosGanadores,VARtiporegdatosGanadores.HijoMedio);
                                                                                                    premio[x]:= auxiliar.VARtiporegdatosPremiosGanadores.Importe;
                                                                                                    tipopremio[x]:= auxiliar.VARtiporegdatosPremiosGanadores.Tipodepremio;

                                                                                                    x:=x+1;
                                                                                                     if VARtiporegdatosPremiosGanadores.Tipodepremio = 6 then
                                                                                                         ganacia:=VARtiporegdatosPremiosGanadores.Importe;
                                                                                                     pila.Desapilar(auxiliar.VARMEPremiosGanadores,VARtiporegdatosGanadores.HijoMedio);
                                                                                                end;

                                                                                           while x <> y do
                                                                                           begin
                                                                                               x:=x-1;
                                                                                               if  tipopremio[x]<>0 then
                                                                                                    begin
                                                                                                         auxiliar.VARtiporegdatosPremiosGanadores.Importe:=premio[x];
                                                                                                         auxiliar.VARtiporegdatosPremiosGanadores.Tipodepremio:=tipopremio[x];
                                                                                                         pila.Apilar(auxiliar.VARMEPremiosGanadores,auxiliar.VARtiporegdatosPremiosGanadores,VARtiporegdatosGanadores.HijoMedio);
                                                                                                     end;
                                                                                           end;



                                                                                             w:= 0;
                                                                                             cantboli:= 0;

                                                                                            while (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,VARtiporegdatosJuegos.ElIddelJuego))) do
                                                                                                    begin
                                                                                                          ColasParciales.Frente(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,VARtiporegdatosJuegos.ElIddelJuego);
                                                                                                          boliya[cantboli]:= auxiliar.VARtiporegdatosBolillerostirados.clave;
                                                                                                          ColasParciales.decolar(auxiliar.VARMEBolillerostirados,VARtiporegdatosJuegos.ElIddelJuego);
                                                                                                          cantboli:=cantboli+1;

                                                                                                    end;
                                                                                                while cantboli <> w do
                                                                                                begin

                                                                                                     auxiliar.VARtiporegdatosBolillerostirados.clave:=boliya[w];
                                                                                                     ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,VARtiporegdatosJuegos.ElIddelJuego);
                                                                                                     w:=w+1;
                                                                                                end;

                                                                                                grilla.Cells[0,grilla.RowCount]:=VARtiporegdatosJugadores.Nick;
                                                                                                grilla.Cells[1,grilla.RowCount]:=inttostr(VARtiporegdatosCartones.IdCarton);
                                                                                                grilla.Cells[2,grilla.RowCount]:=floattostr(ganacia);
                                                                                                grilla.Cells[3,grilla.RowCount]:=VARtiporegdatosJuegos.Nombredelevento;
                                                                                                grilla.Cells[4,grilla.RowCount]:=datetimetostr(VARtiporegdatosJuegos.Fechadelevento);
                                                                                                grilla.Cells[5,grilla.RowCount]:=inttostr(cantboli);

                                                                                                grilla.RowCount:=grilla.RowCount+1;

                                                                                      end;
                                                                                 cantidaddecartones :=cantidaddecartones-1;
                                                              end;
                                                          end;

                                                    end;

                                          end;
                                        i:=i+1;
                                end;
                      end;
      end;




    procedure cantidaddedeterminadosporjugador(idjugador:integer; tipodepremio:integer;var cantidad:integer);
     var
          i,cantidadcarton,idjuego,bingo,cuagrande,cuachico,cruz,diagonal,linea:integer;
          listado:array [0..40] of string;
      begin
              if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                      begin
                          HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                          i:=1;
                          while i <> Length (listado) do
                                begin
                                     if listado[i] <> '' then
                                          begin
                                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                      begin
                                                          idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
                                                          cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
                                                          if  cantidadcarton <> 0 then
                                                                  begin
                                                                       while  (cantidadcarton <> 0) do
                                                                            begin
                                                                                  bingo:=0;
                                                                                  cuagrande:=0;
                                                                                  cuachico:=0;
                                                                                  cruz:=0;
                                                                                  diagonal:=0;
                                                                                  linea:=0;
                                                                                  auxiliar.VARtiporegdatosCartones:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,idjuego,idjugador,cantidadcarton);
                                                                                  DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                                                                                  case tipodepremio  of
                                                                                        1:begin
                                                                                           cantidad:=cantidad+linea;
                                                                                        end;
                                                                                        2:begin
                                                                                           cantidad:=cantidad+diagonal;
                                                                                        end;
                                                                                        3:begin
                                                                                           cantidad:=cantidad+cruz;
                                                                                        end;
                                                                                        4:begin
                                                                                            cantidad:=cantidad+cuachico;
                                                                                        end;
                                                                                        5:begin
                                                                                             cantidad:=cantidad+cuagrande;
                                                                                        end;
                                                                                        6:begin
                                                                                            cantidad:=cantidad+bingo ;
                                                                                        end;
                                                                                   end;
                                                                                  cantidadcarton:=cantidadcarton-1;
                                                                             end;
                                                                  end;
                                                    end;

                                          end;
                                        i:=i+1;
                                end;
                      end;
      end;











  procedure listadojugadoresconundeterminado(Me:Mearbol;pos:integer;var grilla:TStringGrid;tipodepremio :integer);
      var
              idjugador,cantidad:integer;
            begin
                     cantidad:=0;
                     if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                     begin
                           idjugador:=strtoint(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario);
                           cantidaddedeterminadosporjugador(idjugador,tipodepremio,cantidad);
                           grilla.Cells[0,grilla.RowCount]:= capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick;
                           grilla.Cells[1,grilla.RowCount]:=inttostr(cantidad);
                           grilla.RowCount:=grilla.RowCount+1;

                     end;

                      if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              listadojugadoresconundeterminado(Me,ProximoNodohIzq(Me,pos),grilla,tipodepremio);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              listadojugadoresconundeterminado(Me,ProximoNodohDer(Me,pos),grilla,tipodepremio);
                          end;
            end;















  procedure llenargrillajugadoresconmasdinero (Me:Mearbol;pos:integer;var grilla:TStringGrid);
    var
          posaxiliarjugador,ranking,Preacumulado:integer;
          montototal:real;
        begin
                if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                  begin
                         ranking:=0;
                         montototal:=0;
                         Preacumulado:=0;
                         posaxiliarjugador:=LibreberiaBasicaArbol.RaizNodo(me);
                         auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario),Preacumulado,montototal);
                         auxiliar.posicionamientojugadorespremios(me,posaxiliarjugador,strtoint(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario),ranking);

                         grilla.Cells[0,grilla.RowCount]:= capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick;
                         grilla.Cells[1,grilla.RowCount]:=inttostr(ranking);
                         grilla.Cells[2,grilla.RowCount]:=inttostr(Preacumulado);
                         grilla.Cells[3,grilla.RowCount]:=floattostr(montototal);
                         grilla.RowCount:=grilla.RowCount+1;
                 end;


           if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              llenargrillajugadoresconmasdinero(Me,ProximoNodohIzq(Me,pos),grilla);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              llenargrillajugadoresconmasdinero(Me,ProximoNodohDer(Me,pos),grilla);
                          end;

        end;


  procedure posicionamientojugadorespremios (Me:Mearbol;pos,IDusuario:integer;var ranking:integer);
         var
            idjugador,Preacumulado:integer;
            montototal,montototalcomparar:real;
          begin
            montototal :=0;
            montototalcomparar:=0;
            if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                  begin
                      idjugador:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario);
                      auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,IDusuario,Preacumulado,montototal);
                      auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,idjugador,Preacumulado,montototalcomparar);
                      if montototalcomparar >= montototal then
                             begin
                                    ranking:=ranking+1;
                             end;
                  end;
                if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              posicionamientojugadorespremios(Me,ProximoNodohIzq(Me,pos),IDusuario,ranking);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              posicionamientojugadorespremios(Me,ProximoNodohDer(Me,pos),IDusuario,ranking);
                          end;
          end;













   procedure llenargrillarankingdecompra(Me:Mearbol;pos:integer;var grilla:TStringGrid);
       var
          posaxiliarjugador,ranking,cantidaddecartones:integer;

        begin
                if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                  begin
                         ranking:=0;
                         cantidaddecartones:=0;
                         posaxiliarjugador:=LibreberiaBasicaArbol.RaizNodo(me);
                         posicionamientojugadorescompras(me,posaxiliarjugador,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos,ranking);
                         cantidaddecartonescompradosporunjugador(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick ,cantidaddecartones);
                         grilla.Cells[0,grilla.RowCount]:= capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick;
                         grilla.Cells[1,grilla.RowCount]:=inttostr(ranking);
                         grilla.Cells[2,grilla.RowCount]:=inttostr(cantidaddecartones);
                         grilla.RowCount:=grilla.RowCount+1;
                 end;


           if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              llenargrillarankingdecompra(Me,ProximoNodohIzq(Me,pos),grilla);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              llenargrillarankingdecompra(Me,ProximoNodohDer(Me,pos),grilla);
                          end;

        end;







  procedure cantidaddecartonescompradosporunjugador(nombrejugador:string;var cantidadcartones:integer);
     var
          i,pos,cantidadcarton,idjugador,idjuego:integer;
          listado:array [0..40] of string;
      begin
              cantidadcartones:=0;
              pos:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
              LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombrejugador,pos);

              if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                      begin
                          HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                          i:=1;
                          while i <> Length (listado) do
                                begin
                                     if listado[i] <> '' then
                                          begin
                                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                      begin
                                                          idjugador:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario);
                                                          idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
                                                          cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
                                                          cantidadcartones:=cantidadcartones+cantidadcarton;
                                                      end;
                                          end;
                                        i:=i+1;
                                end;
                      end;
      end;





  procedure jugadorconmascartoneseneljuego(Me:Mearbol;pos:integer;var nombrejugador,nombrejuego:string;var total:integer);
        var
            idjugador,idjuego,cantidadcarton:integer;
          begin

           idjugador:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario);
           idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
           cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
           if  cantidadcarton > total then
              begin
                    total:= cantidadcarton;
                    nombrejugador:= Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick;
              end;
                if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              jugadorconmascartoneseneljuego(Me,ProximoNodohIzq(Me,pos),nombrejugador,nombrejuego,total);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              jugadorconmascartoneseneljuego(Me,ProximoNodohDer(Me,pos),nombrejugador,nombrejuego,total);
                          end;
          end;


  procedure  posicionamientojugadorescompras(Me:Mearbol;pos,posendatosdeljugadorbuscado:integer ; var posicionenelranking:integer);
   var
         cantidadselecionada,cantidadacomparar:integer;
         nombredejugadorselecionado,nombredejugadoracomparar:string;

        begin
                  cantidadselecionada:=0;
                  cantidadacomparar:=0;
                  if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                  begin
                          nombredejugadoracomparar:= Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick;
                          nombredejugadorselecionado:= Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,posendatosdeljugadorbuscado).posEnDatos).Nick;
                          cantidaddecartonescompradosporunjugador(nombredejugadorselecionado,cantidadselecionada);
                          cantidaddecartonescompradosporunjugador(nombredejugadoracomparar,cantidadacomparar);
                          if  cantidadselecionada <= cantidadacomparar then
                                posicionenelranking:=posicionenelranking+1;
                  end;

                 if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              posicionamientojugadorescompras(Me,ProximoNodohIzq(Me,pos),posendatosdeljugadorbuscado,posicionenelranking);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              posicionamientojugadorescompras(Me,ProximoNodohDer(Me,pos),posendatosdeljugadorbuscado,posicionenelranking);
                          end;
        end;






   procedure OrdenarGrid(StrGrd: TStringGrid; ACol: Integer);
        var
        i,j: Integer;
        Fin: Boolean;
      begin
        with objetogrilla(StrGrd) do
        begin
          i:= FixedRows;
          Fin:= False;
          while not Fin and (i < RowCount -1 ) do
          begin
            Inc(i);
            Fin:= True;
            for j:= FixedRows to RowCount -2 do
            if Cells[ACol,j] > Cells[ACol,j+1] then
            begin
              Fin:= False;
              MoveRow(j, j+1);
            end;
          end;
       end;
    end;

















     procedure CalendarioJuegoaordenar (grilla:TStringGrid);
     var
          i:integer;
          listado:array [0..40] of string;
        begin

                   if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                      begin
                          HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                          i:=1;
                          while i <> Length (listado) do
                                begin
                                     if listado[i] <> '' then
                                          begin
                                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                      begin
                                                              grilla.Cells[0,grilla.RowCount]:= HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Nombredelevento;
                                                              grilla.Cells[1,grilla.RowCount]:= DateTimeToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Fechadelevento);
                                                              grilla.Cells[2,grilla.RowCount]:= floatToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton);
                                                              grilla.Cells[3,grilla.RowCount]:= inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos);
                                                              grilla.RowCount:=grilla.RowCount+1;
                                                      end;
                                          end;
                                        i:=i+1;
                                end;
                      end;
        end;






  procedure eliminarrepetidolista(var das:array of string);
        var
            c,n:integer;
        begin
               for c := 0 to Length (das) do
                    for n := Length (das) downto c + 1 do
                         begin
                              if das[c] = das[n] then
                                   begin
                                      das[n] := '';
                                   end;
                         end;

        end;


    procedure llenargrillaListadodejugadoraeliminar(Me:Mearbol;var grilla:TStringGrid;pos:integer);
       { var
          Picture: TPicture;  }

      begin
                          if capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick <> 'ADMINISTRADOR' then
                                begin
                                      grilla.Cells[0,grilla.RowCount]:=(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Nick);
                                      grilla.Cells[1,grilla.RowCount]:=(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).IDusuario);
                                      grilla.Cells[2,grilla.RowCount]:=(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).ApellidoyNombre);
                                      grilla.Cells[3,grilla.RowCount]:=(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Clave);
                                      grilla.Cells[4,grilla.RowCount]:=(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Email);
                                      {Picture := TPicture.Create;
                                      Picture.LoadFromFile(capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Foto);
                                      grilla.Canvas.StretchDraw(grilla.CellRect(3,grilla.RowCount),Picture.Graphic);  }
                                      case capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos).Estado of
                                          'C':grilla.Cells[5,grilla.RowCount]:='Conectado';
                                          'D':grilla.Cells[5,grilla.RowCount]:='Desconectado';
                                          'B':grilla.Cells[5,grilla.RowCount]:='Borrado';
                                          'X':grilla.Cells[5,grilla.RowCount]:='Bloqueado por el administrador';
                                      end;
                                      grilla.RowCount:=grilla.RowCount+1;
                                end;



                          if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              llenargrillaListadodejugadoraeliminar(Me,grilla,ProximoNodohIzq(Me,pos));
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              llenargrillaListadodejugadoraeliminar(Me,grilla,ProximoNodohDer(Me,pos));
                          end;

    end;




    procedure contarpremiosguardadosdetodojugador (Mearbol:TipoMETrinario;Mejuegos:TipoMEhash;Mepila:TipoMePilas;idjugador:integer;var Preacumulado:integer; var Pretotal:real);
      var
          listado:array [0..40] of string;
          i,posauxiliarcontrol,n:integer ;
    begin

        if not (HashConColisiones.Hash_Vacio(Mejuegos))  then
          begin
            HashConColisiones.Hash_listadodeclavesactivas(Mejuegos,listado);
              i:=1;
                 while i <> Length (listado) do
                      begin
                           if listado[i] <> '' then
                                begin
                                     if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Mejuegos), Mejuegos).borrados) then
                                          begin
                                                dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Mejuegos),Mejuegos).ElIddelJuego,posauxiliarcontrol);
                                                n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,idjugador);
                                                if n <> 0 then
                                                begin
                                                    if (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Mejuegos),Mejuegos).Estado) = F then
                                                        begin
                                                            auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Mejuegos), Mejuegos);
                                                            auxiliar.contarpremiosguardadosdejugadorjuego(Mearbol,Mepila,inttostr(idjugador),inttostr(auxiliar.VARtiporegdatosJuegos.ElIddelJuego),Preacumulado,Pretotal);
                                                        end;
                                                end;
                                          end;
                                end;
                              i:=i+1;
                      end;
          end;
     end;





         procedure contarpremiosguardadosdejugadorjuego(Mearbol:TipoMETrinario;Mepila:TipoMePilas;idjugador,Idjuego:string;var cantidaddepremios:integer; var Totaldelospremios:real);
              var
                  clave:string;
                  pos,canti:integer;
                  guardadoimporte:array [0..10000] of real;
                  guardadotipo:array [0..10000] of integer;


              begin
                    canti:=0;
                    while  canti <> 10000  do
                        begin
                             guardadoimporte[canti]:=0 ;
                             canti:=canti+1;
                        end;
                    canti:=0;
                    while  canti <> 10000  do
                        begin
                             guardadotipo[canti]:=0 ;
                             canti:=canti+1;
                        end;
                    clave:=idjugador+'_'+Idjuego;
                    canti:=0;
                    pos:=Arboltrinario.obtenerraizarboltri(Mearbol);
                    if  Arboltrinario.Buscararboltri(Mearbol,clave,pos) then
                    begin
                        Arboltrinario.Capturararboltri(Mearbol,auxiliar.VARtiporegdatosGanadores,pos);
                        while not (pila.vacio(Mepila,auxiliar.VARtiporegdatosGanadores.HijoMedio)) do
                            begin
                                  auxiliar.VARtiporegdatosPremiosGanadores:=pila.Tope(Mepila,auxiliar.VARtiporegdatosGanadores.HijoMedio);
                                  pila.Desapilar(Mepila,auxiliar.VARtiporegdatosGanadores.HijoMedio);
                                  cantidaddepremios:=cantidaddepremios+1;
                                  Totaldelospremios:=Totaldelospremios+auxiliar.VARtiporegdatosPremiosGanadores.Importe;
                                  guardadoimporte[canti]:=VARtiporegdatosPremiosGanadores.Importe;
                                  guardadotipo[canti]:=VARtiporegdatosPremiosGanadores.Tipodepremio;
                                  canti:=canti+1
                            end;

                        while canti <> 0 do
                        begin
                                    canti:=canti-1;
                                    VARtiporegdatosPremiosGanadores.Tipodepremio:=guardadotipo[canti];
                                    VARtiporegdatosPremiosGanadores.Importe:=guardadoimporte[canti];
                                    pila.Apilar(Mepila,VARtiporegdatosPremiosGanadores,auxiliar.VARtiporegdatosGanadores.HijoMedio);

                        end;
                    end;
              end;





      procedure pasaralagriilarepeticion(var das:array of integer;original:Carton;mostrar:TStringGrid);
          var
              x,y,i:integer;

          begin
                 mostrar.Cells[0,0]:='B';
                 mostrar.Cells[1,0]:='I';
                 mostrar.Cells[2,0]:='N';
                 mostrar.Cells[3,0]:='G';
                 mostrar.Cells[4,0]:='O';

                 for x:=0 to 4 do
                     begin
                        for y:=0 to  4do
                             begin

                                     mostrar.Cells[x,y+1]:=inttostr(original[x,y].numero) ;
                                      for i:=0 to 74 do
                                                begin
                                                     if  das[i] =  original[x,y].numero then
                                                             begin
                                                                  mostrar.Cells[x,y+1]:=inttostr(original[x,y].numero)+'x';
                                                              end;
                                                end;
                            end;
                   end;

            end;








      procedure dispersionarboltrinario(Me:TipoMETrinario;var grilla:TStringGrid;pos:integer; orden:integer);
      var
          reg:tiporegIndicetri;
           begin
              if not ArbolTrinario.arbolvaciotri(auxiliar.VARMEGanadores) then
                begin

                if orden = 1 then
                  begin

                         ArbolTrinario.Capturararboltri(Me,reg,pos);
                         grilla.Cells[0,grilla.RowCount]:= reg.IdUsuarioIdJuego;
                         grilla.Cells[1,grilla.RowCount]:= inttostr(reg.Padre);
                         grilla.Cells[2,grilla.RowCount]:= inttostr(reg.HijoDer);
                         grilla.Cells[3,grilla.RowCount]:= inttostr(reg.HijoIzq);
                         grilla.Cells[4,grilla.RowCount]:= inttostr(reg.HijoMedio);
                         grilla.RowCount:=grilla.RowCount+1;
                         if not (sinhtri(Me,pos))  then
                          begin
                              if ramaizqarboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramaizqarboltri(ME,pos),orden);
                              if ramadercharboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramadercharboltri(ME,pos),orden);
                          end;

                 end;
                 if orden = 2 then
                  begin





                             if not (sinhtri(Me,pos))  then
                                begin
                              if ramaizqarboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramaizqarboltri(ME,pos),orden);
                               end;
                              ArbolTrinario.Capturararboltri(Me,reg,pos);
                              grilla.Cells[0,grilla.RowCount]:= reg.IdUsuarioIdJuego;
                              grilla.Cells[1,grilla.RowCount]:= inttostr(reg.Padre);
                              grilla.Cells[2,grilla.RowCount]:= inttostr(reg.HijoDer);
                              grilla.Cells[3,grilla.RowCount]:= inttostr(reg.HijoIzq);
                              grilla.Cells[4,grilla.RowCount]:= inttostr(reg.HijoMedio);
                              grilla.RowCount:=grilla.RowCount+1;
                              if not (sinhtri(Me,pos))  then
                                  begin
                              if ramadercharboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramadercharboltri(ME,pos),orden);
                                end;
                         


                 end;
                 if orden = 3 then
                  begin

                         if not (sinhtri(Me,pos))  then
                          begin
                              if ramaizqarboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramaizqarboltri(ME,pos),orden);
                              if ramadercharboltri(ME,pos) <> PosicionNulatri(Me) then
                              dispersionarboltrinario(Me,grilla,ramadercharboltri(ME,pos),orden);
                          end;

                         ArbolTrinario.Capturararboltri(Me,reg,pos);
                         grilla.Cells[0,grilla.RowCount]:= reg.IdUsuarioIdJuego;
                         grilla.Cells[1,grilla.RowCount]:= inttostr(reg.Padre);
                         grilla.Cells[2,grilla.RowCount]:= inttostr(reg.HijoDer);
                         grilla.Cells[3,grilla.RowCount]:= inttostr(reg.HijoIzq);
                         grilla.Cells[4,grilla.RowCount]:= inttostr(reg.HijoMedio);
                         grilla.RowCount:=grilla.RowCount+1;
                 end;
              end;

           end;



      procedure dispersionarbolbinario(Me:Mearbol;var grilla:TStringGrid;pos:integer; orden:integer );


          begin

               if orden = 1 then
                  begin
                          grilla.Cells[0,grilla.RowCount]:= LibreberiaBasicaArbol.CapturarNodo(Me,pos).clave;
                          grilla.Cells[1,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos);
                          grilla.Cells[2,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).padre);
                          grilla.Cells[3,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hizq);
                          grilla.Cells[4,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hder);
                          grilla.Cells[5,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).nivel);
                          if  LibreberiaBasicaArbol.CapturarNodo(Me,pos).borrado then
                              grilla.Cells[6,grilla.RowCount]:= 'si'
                          else
                             grilla.Cells[6,grilla.RowCount]:=  'no';

                           grilla.RowCount:=grilla.RowCount+1;


                          if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohIzq(Me,pos),orden);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohDer(Me,pos),orden);
                          end;
                  end;
                  if orden = 2 then
                  begin
                        if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohIzq(Me,pos),orden);
                          end;
                              grilla.Cells[0,grilla.RowCount]:= LibreberiaBasicaArbol.CapturarNodo(Me,pos).clave;
                              grilla.Cells[1,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos);
                              grilla.Cells[2,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).padre);
                              grilla.Cells[3,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hizq);
                              grilla.Cells[4,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hder);
                              grilla.Cells[5,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).nivel);
                              if  LibreberiaBasicaArbol.CapturarNodo(Me,pos).borrado then
                                  grilla.Cells[6,grilla.RowCount]:= 'si'
                              else
                                 grilla.Cells[6,grilla.RowCount]:=  'no';
                               grilla.RowCount:=grilla.RowCount+1;
                          if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohDer(Me,pos),orden);
                          end;
                  end;
                  if orden = 3 then
                  begin
                          if not (sinh(Me,pos))  then
                          begin
                              if ProximoNodohIzq(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohIzq(Me,pos),orden);
                              if ProximoNodohDer(Me,pos) <> PosicionNula(Me) then
                              dispersionarbolbinario(Me,grilla,ProximoNodohDer(Me,pos),orden);
                          end;
                          grilla.Cells[0,grilla.RowCount]:= LibreberiaBasicaArbol.CapturarNodo(Me,pos).clave;
                          grilla.Cells[1,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).posEnDatos);
                          grilla.Cells[2,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).padre);
                          grilla.Cells[3,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hizq);
                          grilla.Cells[4,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).hder);
                          grilla.Cells[5,grilla.RowCount]:= inttostr(LibreberiaBasicaArbol.CapturarNodo(Me,pos).nivel);
                          if  LibreberiaBasicaArbol.CapturarNodo(Me,pos).borrado then
                              grilla.Cells[6,grilla.RowCount]:= 'si'
                          else
                             grilla.Cells[6,grilla.RowCount]:=  'no';

                           grilla.RowCount:=grilla.RowCount+1;



                  end;

          end;






      Procedure dispersiondehash (Me:TipoMEhash;var grilla:TStringGrid);
    var
       i:integer ;
        listado:array [0..40] of string;
      begin
           if not (HashConColisiones.Hash_Vacio(Me))  then
                begin
                     HashConColisiones.Hash_listadodeclavesactivas(Me,listado);
                     i:=1;
                      while i <> Length (listado) do
                           begin
                                if listado[i] <> '' then
                                 begin
                                            grilla.Cells[0,grilla.RowCount]:= inttostr(i-1);
                                            grilla.Cells[1,grilla.RowCount]:= listado[i];
                                            grilla.Cells[2,grilla.RowCount]:= inttostr(HashConColisiones.ConvercionHash(listado[i]));
                                            grilla.Cells[3,grilla.RowCount]:= inttostr (HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Me)) ;
                                            case HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Me), Me).Estado of
                                                    F: grilla.Cells[4,grilla.RowCount]:='finalizado';
                                                    J: grilla.Cells[4,grilla.RowCount]:='jugando';
                                                    N: grilla.Cells[4,grilla.RowCount]:='no activado';
                                            end;
                                             if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),Me), Me).borrados) then
                                                   grilla.Cells[5,grilla.RowCount]:= 'no'
                                             else
                                                   grilla.Cells[5,grilla.RowCount]:= 'si';
                                   end
                                else
                                   begin
                                           grilla.Cells[0,grilla.RowCount]:=inttostr(i-1);
                                           grilla.Cells[1,grilla.RowCount]:='vacio';
                                           grilla.Cells[2,grilla.RowCount]:='vacio';
                                           grilla.Cells[3,grilla.RowCount]:='vacio';
                                           grilla.Cells[4,grilla.RowCount]:='vacio';  
                                           grilla.Cells[5,grilla.RowCount]:='no'
                                   end;
                               i:=i+1;
                              grilla.RowCount:=grilla.RowCount+1;
                           end;
                end;

      end;





   procedure CalendarioJuegosActivos (grilla:TStringGrid);
    var
          i:integer;
          listado:array [0..40] of string;
        begin

                   if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                      begin
                          HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                          i:=1;
                          while i <> Length (listado) do
                                begin
                                     if listado[i] <> '' then
                                          begin
                                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                 if  HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = N then
                                                      begin
                                                              grilla.Cells[0,grilla.RowCount]:= HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Nombredelevento;
                                                              grilla.Cells[1,grilla.RowCount]:= DateTimeToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Fechadelevento);
                                                              grilla.Cells[2,grilla.RowCount]:= floatToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton*HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos );
                                                              grilla.Cells[3,grilla.RowCount]:= inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos);
                                                              grilla.RowCount:=grilla.RowCount+1;
                                                      end;
                                          end;
                                        i:=i+1;
                                end;
                      end;
        end;

   procedure cantidaddepremiosganados(nombrejugador,nombrejuego:string;var total:integer);
   var
        pos,idjugador,idjuego,cantidadcarton,bingo,cuagrande,cuachico ,cruz,diagonal ,linea:integer;
   begin
           LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombrejugador,pos);
           idjugador:=strtoint(capturarmeArc(auxiliar.VARMEJugadores,CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario);
           idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
           auxiliar.VARtiporegdatosJuegos :=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
           cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
           if  cantidadcarton <> 0 then
              begin
                   while  (cantidadcarton <> 0) do
                      begin
                           bingo:=0;
                           cuagrande:=0;
                           cuachico:=0;
                           cruz:=0;
                           diagonal:=0;
                           linea:=0;
                           auxiliar.VARtiporegdatosCartones:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,idjuego,idjugador,cantidadcarton);
                           DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                           total:=total+bingo+cuagrande+cuachico+cruz+diagonal+linea;
                           cantidadcarton:=cantidadcarton-1;
                      end;
                end;
   end;

   procedure Premiodelnobingo(tipoindice:Mearbol;posinicial:integer;Nombredeljuego:string;var resultado,cantidaddebingos:real);
    var
        idjugador,idjuego,cantidadcarton,bingo,cuagrande,cuachico ,cruz,diagonal ,linea:integer;
   begin
              if not (sinh(tipoindice,posinicial))  then
               begin
                   if ProximoNodohIzq(tipoindice,posinicial) <> PosicionNula(tipoindice) then
                   Premiodelnobingo(tipoindice,ProximoNodohIzq(tipoindice,posinicial),Nombredeljuego,resultado,cantidaddebingos);
                   if ProximoNodohDer(tipoindice,posinicial) <> PosicionNula(tipoindice) then
                   Premiodelnobingo(tipoindice,ProximoNodohDer(tipoindice,posinicial),Nombredeljuego,resultado,cantidaddebingos);
               end;

            idjugador:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(tipoindice,posinicial).posEnDatos).IDusuario);
           auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(Nombredeljuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
           idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(Nombredeljuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
           cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
           if  cantidadcarton <> 0 then
              begin
                   while  (cantidadcarton <> 0) do
                      begin
                          bingo:=0;
                          cuagrande:=0;
                          cuachico:=0;
                          cruz:=0;
                          diagonal:=0;
                          linea:=0;
                          auxiliar.VARtiporegdatosCartones:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,idjuego,idjugador,cantidadcarton);
                          DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                          if  bingo = 0 then
                              begin
                                    resultado:=resultado+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Plinea) / (10000))*linea+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pdiagonal)/(10000))*diagonal+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcruz)/(10000))*cruz+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcuadradochico)/(10000))*cuachico+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcuadradogrande)/(10000))*cuagrande;
                              end
                          else
                              cantidaddebingos:=cantidaddebingos+1;

                                    cantidadcarton:=cantidadcarton-1;
                      end;
                end;
   end;






   Procedure ganaciasjugadorjuego(nombrejugador,nombrejuego:string;var total:real);
   var
        pos,idjugador,idjuego,cantidadcarton,bingo,cuagrande,cuachico ,cruz,diagonal ,linea:integer;
        nobingo,cantidaddebingo:real;
   begin
           LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombrejugador,pos);
           idjugador:=strtoint(capturarmeArc(auxiliar.VARMEJugadores,CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario);
           idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
           auxiliar.VARtiporegdatosJuegos :=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
           cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idjugador);
           if  cantidadcarton <> 0 then
              begin
                   while  (cantidadcarton <> 0) do                                           
                      begin
                           bingo:=0;
                           cuagrande:=0;
                           cuachico:=0;
                           cruz:=0;
                           diagonal:=0;
                           linea:=0;
                          auxiliar.VARtiporegdatosCartones:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,idjuego,idjugador,cantidadcarton);
                          DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                          if  bingo = 0 then
                              begin
                                    total:=total+
                                    
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Plinea) / (10000))*linea+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pdiagonal)/(10000))*diagonal+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcruz)/(10000))*cruz+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcuadradochico)/(10000))*cuachico+
                                    ((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton*auxiliar.VARtiporegdatosJuegos.Pcuadradogrande)/(10000))*cuagrande;
                              end
                           else
                               begin
                                    Premiodelnobingo(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),nombrejuego,nobingo,cantidaddebingo);
                                    total:=total+(auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton)-nobingo;
                               end;
                                    cantidadcarton:=cantidadcarton-1;
                      end;
                end;
   end;










   Procedure Listarjugadores(var das:array of string; tipoindice: Mearbol; pos,indicejuego:integer ;var posarreglo:integer;tipoarchivo:Mearcjugador);
   var
    idjugador:string;
    begin
            idjugador:=capturarmeArc(auxiliar.VARMEJugadores,CapturarNodo(tipoindice,pos).posEnDatos).IDusuario;
            if DobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,indicejuego,strtoint(idjugador)) <> 0 then
                begin
                      das[posarreglo]:=capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).Nick;
                      posarreglo:=posarreglo+1;
                end;
            if not (sinh(tipoindice,pos))  then
               begin
                   if ProximoNodohIzq(tipoindice,pos) <> PosicionNula(tipoindice) then
                   Listarjugadores(das,tipoindice,ProximoNodohIzq(tipoindice,pos),indicejuego,posarreglo,tipoarchivo);
                   if ProximoNodohDer(tipoindice,pos) <> PosicionNula(tipoindice) then
                   Listarjugadores(das,tipoindice,ProximoNodohDer(tipoindice,pos),indicejuego,posarreglo,tipoarchivo);
               end;

   end;







  procedure llenargrilladepremios(grilla:TStringGrid;tipoindice:Mearbol;posinicial:integer;nombrejuego:string;x:integer);
  var
         idusuario,cantidadcarton,bingo,cuagrande,cuachico ,cruz,diagonal ,linea:integer;
         nombres:string;

  begin
        idusuario:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(tipoindice,posinicial).posEnDatos).IDusuario);
        auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(nombrejuego),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
        nombres:=Archivo.capturarmeArc(Auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceID,posinicial).posEnDatos).ApellidoyNombre;
        cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, auxiliar.VARtiporegdatosJuegos.ElIddelJuego,idusuario);
        if  cantidadcarton <> 0 then
        begin
            while cantidadcarton <> 0 do
                begin
                    bingo:=0;
                    cuagrande:=0;
                    cuachico:=0;
                    cruz:=0;
                    diagonal:=0;
                    linea:=0;
                    auxiliar.VARtiporegdatosCartones:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,auxiliar.VARtiporegdatosJuegos.ElIddelJuego,idusuario,cantidadcarton);
                    DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                    cantidadcarton:=cantidadcarton-1;
                    if bingo <> 0 then
                        begin
                        x:=x+1;
                        grilla.Cells[0,x]:= nombres;
                        grilla.Cells[1,x]:= 'Bingo';
                        grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                        grilla.Cells[3,x]:='Gran Premio';
                        end
                        else
                            begin
                            if cuagrande <> 0 then
                                begin
                                grilla.RowCount:=grilla.RowCount+1 ;
                                x:=x+1;
                                grilla.Cells[0,x]:= nombres;
                                grilla.Cells[1,x]:= 'Cuagrande';
                                grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                grilla.Cells[3,x]:=floattostr(auxiliar.VARtiporegdatosJuegos.Pcuadradogrande*((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton) / 10000));
                                end;
                            if cuachico <> 0 then
                                begin
                                grilla.RowCount:=grilla.RowCount+1 ;
                                x:=x+1;
                                grilla.Cells[0,x]:= nombres;
                                grilla.Cells[1,x]:= 'Cuachico';
                                grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                grilla.Cells[3,x]:=floattostr(auxiliar.VARtiporegdatosJuegos.Pcuadradochico*((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton) / 10000));
                                end;
                            if cruz <> 0 then
                                begin
                                grilla.RowCount:=grilla.RowCount+1 ;
                                x:=x+1;
                                grilla.Cells[0,x]:= nombres;
                                grilla.Cells[1,x]:= 'Cruz';
                                grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                grilla.Cells[3,x]:=floattostr(auxiliar.VARtiporegdatosJuegos.Pcruz*((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton) / 10000));
                                end;
                            if diagonal <> 0 then
                                begin
                                grilla.RowCount:=grilla.RowCount+1 ;
                                x:=x+1;
                                grilla.Cells[0,x]:= nombres;
                                grilla.Cells[1,x]:= 'Diagonal';
                                grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                grilla.Cells[3,x]:=floattostr(auxiliar.VARtiporegdatosJuegos.Pdiagonal*((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton) / 10000));
                                end;
                            if linea <> 0 then
                                begin
                                grilla.RowCount:=grilla.RowCount+1 ;
                                x:=x+1;
                                grilla.Cells[0,x]:= nombres;
                                grilla.Cells[1,x]:= 'Linea';
                                grilla.Cells[2,x]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                grilla.Cells[3,x]:=floattostr(auxiliar.VARtiporegdatosJuegos.Plinea*((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton) / 10000));
                                end;
                       end;
                end;
        end;


         if (not (LibreberiaBasicaArbol.sinh(tipoindice,posinicial)))  then
               begin
                   if LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   llenargrilladepremios(grilla,tipoindice,LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial),nombrejuego,x);
                   if LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   llenargrilladepremios(grilla,tipoindice,LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial),nombrejuego,x);
               end;
  end;



   procedure llenargrilladejugadores(grilla:TStringGrid;tipoindice:Mearbol;posinicial:integer;idjuego,z:integer);
   var
         idusuario,cantidadcarton:integer;
         nombres:string;
         estado:char;
  begin
        idusuario:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceID,posinicial).posEnDatos).IDusuario);
        estado:=Archivo.capturarmeArc(Auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceID,posinicial).posEnDatos).Estado;
        nombres:=Archivo.capturarmeArc(Auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceID,posinicial).posEnDatos).ApellidoyNombre;
        cantidadcarton:=DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, idjuego,idusuario);
        if  cantidadcarton <> 0 then
        begin
            z:=z+1;
            grilla.RowCount:=grilla.RowCount+1 ;
            grilla.Cells[0,z]:=nombres;
            case estado of
                'C':grilla.Cells[1,z]:='Conectado';
                'D':grilla.Cells[1,z]:='Desconectado';
                'B':grilla.Cells[1,z]:='Borrado';
                'X':grilla.Cells[1,z]:='Bloqueado por el administrador';
            end;
            grilla.Cells[2,z]:=inttostr(cantidadcarton);
        end;

            if (not (LibreberiaBasicaArbol.sinh(tipoindice,posinicial)))  then
               begin
                   if LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   llenargrilladejugadores(grilla,tipoindice,LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial),idjuego,z);
                   if LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   llenargrilladejugadores(grilla,tipoindice,LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial),idjuego,z);
               end;

  end;



      Procedure GuardarResultados(tipoindice:Mearbol;posinicial:integer;Nombredeljuego:String);
          var
                h,idusuario,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,posicionarbol:integer;
                carton:tiporegdatodoble;
                hoja:tiporegIndicetri;
                premio:tiporegdatopila;
                posiciondelapila:integer;
                hashinfo:HashConColisiones.tiporegdato;
                bingototal,bingocantidad:real;
          begin
             hashinfo:=Hash_Obtenerinformacion(Hash_Buscar(  ConvercionHash(Nombredeljuego)  ,auxiliar.VARMEJuegos),auxiliar.VARMEJuegos);
             idusuario:=strtoint(Archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceID,posinicial).posEnDatos).IDusuario);
             h:= DobleEnlace.cantidadcartonesjugador( auxiliar.VARMECartones, hashinfo.ElIddelJuego,idusuario);


             while h<>0 do
                  begin
                        bingo:= 0;
                        cuagrande := 0;
                        cuachico := 0;
                        cruz := 0;
                        diagonal := 0;
                        linea:=0;
                        posiciondelapila:=Pila.posnuevacabecera(auxiliar.VARMEPremiosGanadores);
                        carton:=DobleEnlace.cartoneelejidojugador(auxiliar.VARMECartones,hashinfo.ElIddelJuego,idusuario,h);
                        DobleEnlace.Premiosganados(carton,bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                        hoja.IdUsuarioIdJuego:=inttostr(carton.Iddeljugador)+'_'+inttostr(hashinfo.ElIddelJuego) ;


                       if not (ArbolTrinario.Buscararboltri(auxiliar.VARMEGanadores,hoja.IdUsuarioIdJuego,posicionarbol)) then
                           begin
                                    pila.incertarcabecera(auxiliar.VARMEPremiosGanadores,posiciondelapila);
                                    hoja.HijoMedio :=posiciondelapila;
                                    ArbolTrinario.Insertararboltri(auxiliar.VARMEGanadores,hoja,posicionarbol);

                           end
                       else
                          begin
                                    ArbolTrinario.Capturararboltri(auxiliar.VARMEGanadores,hoja,posicionarbol);
                                    posiciondelapila :=hoja.HijoMedio;
                          end;

                          while linea <> 0 do
                              begin
                                    premio.Tipodepremio:=1;
                                    premio.Importe:=(hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton*hashinfo.Plinea) / 10000;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    linea:=linea-1;
                              end;
                          while diagonal <> 0 do
                              begin
                                    premio.Tipodepremio:=2;
                                    premio.Importe:=(hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton*hashinfo.Pdiagonal) / 10000;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    diagonal:=diagonal-1;
                              end;
                          while cruz <> 0 do
                              begin
                                    premio.Tipodepremio:=3;
                                    premio.Importe:=(hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton*hashinfo.Pcruz) / 10000;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    cruz:=cruz-1;
                              end;
                          while cuachico <> 0 do
                              begin
                                    premio.Tipodepremio:=4;
                                    premio.Importe:=(hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton*hashinfo.Pcuadradochico) / 10000;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    cuachico:=cuachico-1;
                              end;
                          while cuagrande <> 0 do
                              begin
                                    premio.Tipodepremio:=5;
                                    premio.Importe:=(hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton*hashinfo.Pcuadradogrande) / 10000;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    cuagrande:=cuagrande-1;
                              end;

                          while bingo <> 0 do
                              begin
                                    bingototal:=0;
                                    bingocantidad:=0;
                                    auxiliar.Premiodelnobingo(auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),hashinfo.Nombredelevento,bingototal,bingocantidad);
                                    premio.Tipodepremio:=6;
                                    if (hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton) >= bingototal  then
                                          premio.Importe:= ((hashinfo.Totalcartonesvendidos*hashinfo.Valordelcarton)-bingototal)/ bingocantidad
                                    else
                                           premio.Importe:=0;
                                    pila.Apilar(auxiliar.VARMEPremiosGanadores,premio,posiciondelapila);
                                    bingo:=bingo-1;
                              end;
                        h:=h-1;
                  end;

            if not (LibreberiaBasicaArbol.sinh(tipoindice,posinicial))  then
               begin
                   if LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   GuardarResultados(tipoindice,LibreberiaBasicaArbol.ProximoNodohIzq(tipoindice,posinicial),Nombredeljuego);
                   if LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial) <> LibreberiaBasicaArbol.PosicionNula(tipoindice) then
                   GuardarResultados(tipoindice,LibreberiaBasicaArbol.ProximoNodohDer(tipoindice,posinicial),Nombredeljuego);
               end;







     end;








     Function CalcularGanador( ME: DobleEnlace.TipoME;indice:integer;var cant:integer;var nombreganador:array of string ):boolean;
     var
        cantidad,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,posjugador:integer;
         salir:boolean;
     begin
          cantidad:=Dobleenlace.cantidadcartonesTotales(ME,indice);
          salir :=false ;
          while (cantidad <> 0) do
            begin
                bingo:=0;
                cuagrande :=0;
                cuachico :=0;
                cruz:=0;
                diagonal :=0;
                linea:=0;

                Dobleenlace.Premiosganados(Dobleenlace.cartoneelejidoTotales(ME,indice,cantidad),
                bingo,cuagrande,cuachico ,cruz,diagonal ,linea);
                if  bingo = 1 then
                  begin
                    salir:=true;
                    LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceID,inttostr(Dobleenlace.cartoneelejidoTotales(ME,indice,cantidad).Iddeljugador),posjugador);
                    auxiliar.VARtiporegdatosJugadoresindice:= LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posjugador) ;
                    nombreganador[cant]:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos).nick;
                    cant:=cant+1;
                  end;
                cantidad:=cantidad-1;

            end;
          if salir then
              CalcularGanador:=true
          else
              CalcularGanador:=false;
     end;




  procedure limpiargrilla(mostrar:TStringGrid);
  var
      x,y:integer;
  begin
      for x:=0 to mostrar.ColCount do
       begin
            for y:=0 to mostrar.RowCount do
            begin
                mostrar.Cells[x,y]:='' ;
            end;
       end;

  end;



  procedure pasaralagriila (original:Carton;mostrar:TStringGrid);
  var
     x,y:integer;
  begin

        mostrar.Cells[0,0]:='B';
        mostrar.Cells[1,0]:='I';
        mostrar.Cells[2,0]:='N';
        mostrar.Cells[3,0]:='G';
        mostrar.Cells[4,0]:='O';

       for x:=0 to 4 do
       begin
            for y:=0 to  4do
            begin

                mostrar.Cells[x,y+1]:=inttostr(original[x,y].numero) ;

                if  original[x,y].Tachado then
                    begin
                          mostrar.Cells[x,y+1]:=inttostr(original[x,y].numero)+'x';
                    end;
            end;
       end;
  end;








function identicos(original,copia:array of integer):boolean ;
 var
    x,y:integer;
    encontre:boolean;
    begin
          identicos:=true;
          x:=0;
          repeat
             y:=0;
             encontre:=false;
             repeat
                  if original[x] = copia[y] then
                      encontre:=true;
                  y:=y+1;
             until  (y <> Length(copia)) or (encontre <> true);
             x:=x+1;
          until (x <> Length(copia))  or (encontre = true);
          if encontre = false then
             identicos:=false;

    end;

procedure limpiarlista(var  das:array of integer) ;
  var
    x:integer;
    begin
        for x:=0 to Length(das) do
            begin
               das[x]:=0;
            end;
    end;

function buscarenrepetidos(das:array of integer;num:integer):boolean ;
  var
    x:integer;
    begin
        buscarenrepetidos:=false;
        for x:=0 to Length(das) do
            begin
                 if das[x] = num then
                      begin
                           buscarenrepetidos:=true;
                           break;
                      end;
            end;
     end;

procedure incertarenlista(var das:array of integer;num:integer) ;
  var
    x:integer;
    begin
        for x:=0 to Length(das) do
            begin
                 if das[x] = 0 then
                    begin
                        das[x]:= num;
                        break;
                    end;

            end;
     end;




  Procedure cantidaddejugadores (tipoindice: Mearbol; pos:integer ;var cant:integer);
      begin
             cant:=cant+1;
            if not (sinh(tipoindice,pos))  then
               begin
                   if ProximoNodohIzq(tipoindice,pos) <> PosicionNula(tipoindice) then
                   cantidaddejugadores(tipoindice,ProximoNodohIzq(tipoindice,pos),cant);
                   if ProximoNodohDer(tipoindice,pos) <> PosicionNula(tipoindice) then
                   cantidaddejugadores(tipoindice,ProximoNodohDer(tipoindice,pos),cant);
               end;
      end;


   procedure llenargrillaListadodejugador( tipoindice: Mearbol; grilla:TStringGrid; pos:integer ;tipoarchivo:Mearcjugador ;Nombrejuego:String);
   Var
       { Picture: TPicture; }
        cantidadcarton,cantiadadtotal,Preacumulado:integer;
        idusuario,nombreusuario:string;
        Pretotal:real;
        hashinfo:HashConColisiones.tiporegdato;
    begin
         idusuario:=capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).IDusuario;
         nombreusuario:=capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).nick;
         hashinfo:=Hash_Obtenerinformacion(Hash_Buscar(  ConvercionHash(Nombrejuego)  ,auxiliar.VARMEJuegos),auxiliar.VARMEJuegos);

         cantidadcarton:=DobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,hashinfo.ElIddelJuego,strtoint(capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).IDusuario));
         cantiadadtotal:= cantidadcarton;
          if cantidadcarton <> 0 then
              begin

                      Preacumulado:=0;
                      Pretotal:=0;
                      auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(idusuario),Preacumulado,Pretotal);



                    grilla.Cells[0,grilla.RowCount]:=  nombreusuario ;
                    grilla.Cells[1,grilla.RowCount]:=  inttostr(cantiadadtotal);
                    grilla.Cells[2,grilla.RowCount]:=  inttostr(Preacumulado)+'= $'+floattostr(Pretotal);
                   { Picture := TPicture.Create;
                    Picture.LoadFromFile(capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).Foto);
                    grilla.Canvas.StretchDraw(grilla.CellRect(3,grilla.RowCount),Picture.Graphic);     }
                    grilla.RowCount:=grilla.RowCount+1 ;

              end;

            if not (sinh(tipoindice,pos))  then
               begin
                   if ProximoNodohIzq(tipoindice,pos) <> PosicionNula(tipoindice) then
                   llenargrillaListadodejugador(tipoindice,grilla,ProximoNodohIzq(tipoindice,pos),tipoarchivo,Nombrejuego);
                   if ProximoNodohDer(tipoindice,pos) <> PosicionNula(tipoindice) then
                   llenargrillaListadodejugador(tipoindice,grilla,ProximoNodohDer(tipoindice,pos),tipoarchivo,Nombrejuego);
               end;

   end;


   procedure llenargrillaListadodejugadoractivos( tipoindice: Mearbol; grilla:TStringGrid; pos:integer ;tipoarchivo:Mearcjugador ;Nombrejuego:String);
   Var
        {Picture: TPicture; }
        nombreusuario,fechayhora:string;

    begin
                  if  capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).Estado = 'C' then
                      begin
                            nombreusuario:=capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).Nick;
                            fechayhora:=DateTimeToStr(capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).FechaHoraUltimaConexion);
                            grilla.Cells[0,grilla.RowCount]:= nombreusuario;
                            grilla.Cells[1,grilla.RowCount]:= fechayhora;
                            {Picture := TPicture.Create;
                            Picture.LoadFromFile(capturarmeArc(tipoarchivo,CapturarNodo(tipoindice,pos).posEnDatos).Foto);
                            grilla.Canvas.StretchDraw(grilla.CellRect(2,grilla.RowCount),Picture.Graphic); }
                            grilla.RowCount:=grilla.RowCount+1 ;
                      end;


            if not (sinh(tipoindice,pos))  then
               begin
                   if ProximoNodohIzq(tipoindice,pos) <> PosicionNula(tipoindice) then
                   llenargrillaListadodejugadoractivos(tipoindice,grilla,ProximoNodohIzq(tipoindice,pos),tipoarchivo,Nombrejuego);
                   if ProximoNodohDer(tipoindice,pos) <> PosicionNula(tipoindice) then
                   llenargrillaListadodejugadoractivos(tipoindice,grilla,ProximoNodohDer(tipoindice,pos),tipoarchivo,Nombrejuego);
               end;

   end;















end.

