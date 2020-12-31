unit ArbolTrinario;
interface

uses
Classes,Sysutils,StrUtils;

  Const

    control = 'controlarboltri.dat';
    indice = 'indicearboltri.dat' ;
    nodito = 'nodosarboltri.dat';
    posnula = -1;
    Clavenula='*';


  Type
  tipoposicion = longint;                          
  tipoclave = string[6];  //significa qe llega hasta el 999_99
  tiporegcontrol = record
                        raiz:tipoposicion;
                        BorradosNtx: tipoposicion;
                        Borradosdat: tipoposicion;
                        UltimoNivel: tipoposicion;
                        PorcentajeNiveles:0..100;
                  end;
  TipoArchControl = file of tiporegcontrol;

  tiporegIndicetri = record
                        IdUsuarioIdJuego:tipoclave;
                        HijoIzq, HijoDer, Padre, HijoMedio :tipoposicion;
                  end;
  TipoArchIndicetri = file of tiporegIndicetri;

  tiporegNodito =  record
                      Cantidaddenodos:longint;
                  end;

  TipoArchNodito = file of tiporegNodito;




  TipoMETrinario = Record
	        	C: TipoArchControl ;
            I: TipoArchIndicetri ;
            N: TipoArchNodito ;

	   End;




  var
   arbol : TipoMETrinario ;
   Procedure creaMearboltri (var arbol:TipoMETrinario;ruta:string);
   Procedure AbrirArchivosarboltri  ( var arbol: TipoMETrinario );
   Procedure CerrarArchivosarboltri  ( var arbol: TipoMETrinario )  ;
   Function obtenerraizarboltri  (var arbol:TipoMETrinario):tipoposicion  ;
   function sinhtri(var arbol:TipoMETrinario;Pos:tipoposicion): boolean;
   Function ramaizqarboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion  ;
   Function ramamedioarboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion  ;
   Function ramadercharboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion ;
   Function obtenerpadrearboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion ;
   Procedure Capturararboltri  ( var arbol:TipoMETrinario;var Reg:tiporegIndicetri;Pos:tipoposicion);
   Procedure Modificararboltri  (var arbol:TipoMETrinario; Reg:tiporegIndicetri;Pos:tipoposicion);
   function arbolvaciotri(arbol:TipoMETrinario):boolean;
   Procedure InsertarEnMedio (var arbol: TipoMETrinario; Posdelcontrol:integer;Pos:tipoposicion);
   function PosicionNulatri (var arbol: TipoMETrinario):integer;

   Procedure Insertararboltri (var arbol: TipoMETrinario; Reg:tiporegIndicetri;posicion:tipoposicion);
   Function Buscararboltri (var arbol:TipoMETrinario;clave:tipoclave;var posicion:tipoposicion):boolean;
   procedure actualizarnivel(var arbol:TipoMETrinario);
   function Cantidaddenodospornivel(var arbol: TipoMETrinario;Reg:tiporegIndicetri;n:integer):integer;
   function Cantidadmaximaniveles(var arbol: TipoMETrinario; Reg:tiporegIndicetri) :integer;



implementation


      procedure actualizarnivel(var arbol:TipoMETrinario);
      var
        RC: tiporegcontrol;
        reg:tiporegIndicetri  ;
        nivel:integer;
        ND:tiporegNodito ;
      begin
            seek(arbol.C,0);
            read(arbol.C,RC);
            seek(arbol.I,RC.raiz);
            read(arbol.I,reg);
            RC.UltimoNivel:=Cantidadmaximaniveles(arbol,reg);
            seek(arbol.C,0);
            write(arbol.C,RC);
            nivel:=0;
            while rc.UltimoNivel <> nivel do
                  begin
                       ND.Cantidaddenodos:=Cantidaddenodospornivel(arbol,reg,nivel);
                       seek(arbol.N,nivel);
                       write(arbol.N,ND);
                       nivel:=nivel+1
                  end;
      end;




    function Cantidaddenodospornivel(var arbol: TipoMETrinario;Reg:tiporegIndicetri;n:integer):integer;
      begin
         if (Reg.HijoIzq <> posnula) or (Reg.HijoDer <> posnula )then
              begin
                   if  n = 0 then
                        begin
                          if reg.HijoIzq <> posnula then
                              begin
                                seek(arbol.I,reg.HijoIzq);
                                read(arbol.I,reg);
                                Cantidaddenodospornivel:=Cantidaddenodospornivel(arbol,reg,n-1)+1;
                              end;
                          if reg.HijoDer <> posnula then
                              begin
                                seek(arbol.I,reg.HijoDer);
                                read(arbol.I,reg);
                                Cantidaddenodospornivel:=Cantidaddenodospornivel(arbol,reg,n-1)+1;
                              end;

                        end
                   else
                        begin
                           if reg.HijoIzq <> posnula then
                              begin
                                seek(arbol.I,reg.HijoIzq);
                                read(arbol.I,reg);
                                Cantidaddenodospornivel:=Cantidaddenodospornivel(arbol,reg,n-1);
                              end;
                          if reg.HijoDer <> posnula then
                              begin
                                seek(arbol.I,reg.HijoDer);
                                read(arbol.I,reg);
                                Cantidaddenodospornivel:=Cantidaddenodospornivel(arbol,reg,n-1);
                              end;
                        end
              end;


               Cantidaddenodospornivel:=1;
    end;

    function Cantidadmaximaniveles(var arbol: TipoMETrinario; Reg:tiporegIndicetri) :integer;
    var
        izq,der:integer;
    begin
        if (Reg.HijoIzq <> posnula) or (Reg.HijoDer <> posnula )then
              begin
                  if (Reg.HijoIzq <> posnula ) then
                     begin
                         seek(arbol.I,reg.HijoIzq);
                         read(arbol.I,reg);
                         izq:=Cantidadmaximaniveles(arbol,reg)+1;
                     end;
                  if (Reg.HijoDer <> posnula ) then
                     begin
                         seek(arbol.I,reg.HijoDer);
                         read(arbol.I,reg);
                         der:=Cantidadmaximaniveles(arbol,reg)+1;
                     end;
                  if  izq > der then
                      Cantidadmaximaniveles:=izq
                  else
                      Cantidadmaximaniveles:=der;
              end;
          Cantidadmaximaniveles:=1;
    end;














    Procedure Insertararboltri (var arbol: TipoMETrinario; reg:tiporegIndicetri;posicion:tipoposicion);
         var
          RC: TipoRegControl;
          RI: TipoRegIndicetri;
          posnueva:integer;
          juego,juegoselecionado,jugador,jugadorselecionado:integer;
      begin
          seek(arbol.C,0);
          read(arbol.C,Rc);
          if RC.BorradosNtx = posnula then
            begin
                posnueva := filesize(Arbol.I);
            end
          else
            begin
                posnueva := RC.BorradosNtx;
                seek(Arbol.I, posnueva);
                read(Arbol.I, RI);
                RC.BorradosNtx := RI.HijoIzq;
            end;


          if (RC.raiz = posnula) then // Arbol vacio
            begin
                Reg.padre := posnula;
                Reg.HijoIzq := posnula;
                Reg.HijoDer := posnula;
                Reg.HijoMedio:=reg.HijoMedio;
                RC.raiz := posnueva;
            end
          else // Hoja
            begin
                seek(Arbol.I, posicion);
                read(Arbol.I, RI);
                reg.padre := posicion;
                reg.HijoDer := posnula;
                reg.HijoIzq := posnula;

                jugadorselecionado:= strtoint(Copy(RI.IdUsuarioIdJuego, 0 , pos('_', RI.IdUsuarioIdJuego)-1));
                juegoselecionado:= strtoint(Copy(RI.IdUsuarioIdJuego, pos('_', RI.IdUsuarioIdJuego) + 1, Length(RI.IdUsuarioIdJuego)));

                jugador:=strtoint(Copy(Reg.IdUsuarioIdJuego, 0 , pos('_', Reg.IdUsuarioIdJuego)-1));
                juego:= strtoint(Copy(Reg.IdUsuarioIdJuego, pos('_', Reg.IdUsuarioIdJuego) + 1, Length(Reg.IdUsuarioIdJuego)));

                 if jugador = jugadorselecionado then
                         begin
                               if juego <= juegoselecionado then
                                     RI.HijoIzq := posnueva
                               else
                                     RI.HijoDer := posnueva;
                         end
                 else
                      begin
                            if jugador < jugadorselecionado then
                                    RI.HijoIzq := posnueva
                            else
                                    RI.HijoDer := posnueva;
                      end;
                 seek(Arbol.I, posicion);
                 write(Arbol.I, RI);
             end;
           seek(Arbol.I, posnueva);
           write(Arbol.I, reg);
           seek(Arbol.C, 0);
           write(Arbol.C, RC);



      end;


   Function Buscararboltri (var arbol:TipoMETrinario;clave:tipoclave;var posicion:tipoposicion):boolean;     //-----------buscar
      var
          RC: TipoRegControl;
          encontre: boolean;
          pospadre:integer;
          reg:tiporegIndicetri;
          juego,juegoselecionado,jugador,jugadorselecionado:integer;

     begin
          jugador:=strtoint( Copy(clave, 0 , pos('_', clave)-1));
          juego :=strtoint( Copy(clave, pos('_', clave) + 1, Length(clave)));


          seek(Arbol.C, 0);
          read(Arbol.C, RC);
          posicion := RC.raiz;
          encontre := false;
          pospadre := posnula;
          while (not encontre) and (posicion <> posnula) do
              begin
                    seek(Arbol.I, posicion);
                    read(Arbol.I, reg);
                    jugadorselecionado:= strtoint(Copy(reg.IdUsuarioIdJuego, 0 , pos('_', reg.IdUsuarioIdJuego) -1));
                    juegoselecionado := strtoint(Copy(reg.IdUsuarioIdJuego, pos('_', reg.IdUsuarioIdJuego) + 1, Length(reg.IdUsuarioIdJuego)));

                    if jugador = jugadorselecionado then
                          begin
                                 if juego = juegoselecionado  then
                                               begin
                                                   encontre:=true;
                                               end
                                         else
                                               begin
                                                    if juego < juegoselecionado  then
                                                            begin
                                                              posPadre := posicion;
                                                              posicion:=reg.HijoIzq;
                                                            end
                                                    else
                                                        begin
                                                              posPadre := posicion;
                                                              posicion:=reg.HijoDer;
                                                        end;
                                               end;
                          end
                    else
                          begin
                               if jugador < jugadorselecionado then
                                    begin
                                            posPadre := posicion;
                                            posicion:=reg.HijoIzq;
                                    end
                               else
                                     begin
                                            posPadre := posicion;
                                            posicion:=reg.HijoDer;
                                     end;
                          end;
              end;
          if (not encontre) then
            begin
                  posicion := posPadre;
            end;
          Buscararboltri:=encontre;
   end;



  function PosicionNulatri (var arbol: TipoMETrinario):integer;
      begin
           PosicionNulatri:= posnula;
      end;





   Procedure creaMearboltri (var arbol:TipoMETrinario;ruta:string);      //-----------crear arbol
      var
        bErrorcontrol,bErrorindice,bErrorNodito:boolean;
        RC: TipoRegControl;
      begin
        {$i-}
        assign(arbol.C,ruta + control);
        assign(arbol.I,ruta + indice);
        assign(arbol.N,ruta + nodito);
        reset(arbol.C);
        berrorcontrol:=(ioresult<>0);
        reset(arbol.I);
        bErrorindice:=(ioresult<>0);
        reset(arbol.N);
        bErrorNodito:=(ioresult<>0);
        if berrorcontrol  or bErrorindice or bErrorNodito then
          begin
            Rewrite(arbol.c);
            Rewrite(arbol.I);
            Rewrite(arbol.N);
            RC.raiz:=posnula;
            RC.BorradosNtx:=posnula;
            RC.Borradosdat:=posnula;
            RC.UltimoNivel:=posnula;
            Rc.PorcentajeNiveles:=0;
            seek(arbol.C,0);
            write(arbol.c,Rc);
          end;
        close(arbol.C);
        close(arbol.I);
        close(arbol.N);
        {$i+}

      end;


   Procedure AbrirArchivosarboltri  ( var arbol: TipoMETrinario );   //-----------abrir
      begin
	      Reset (arbol.C);
        Reset (arbol.I) ;
	      Reset (arbol.N);
      end;
   Procedure CerrarArchivosarboltri  ( var arbol: TipoMETrinario )  ;   //-----------cerrar
      begin
      	Close (arbol.C);
        Reset (arbol.I) ;
	      Reset (arbol.N);
      end;



   function arbolvaciotri(arbol:TipoMETrinario):boolean;
   var
      RC: TipoRegControl;
       begin
              seek(arbol.C,0);
              read(arbol.C,rc);
              if RC.raiz = posnula then
                   arbolvaciotri:=true
              else
                  arbolvaciotri:=false;
       end;




   function sinhtri(var arbol:TipoMETrinario;Pos:tipoposicion): boolean;
     var
      reg: tiporegIndicetri;
    begin
             seek(Arbol.I, pos);
             read(Arbol.I, reg);
             if (reg.HijoIzq = posnula) and (reg.HijoDer = posnula ) then
             sinhtri:=true
             else
             sinhtri:=false ;
    end;

   



   Function obtenerraizarboltri  (var arbol:TipoMETrinario):tipoposicion  ;             //-----------raiz
     var
       RC:tiporegcontrol;
      begin
          seek(arbol.C,0);
          read(arbol.C,RC);
          obtenerraizarboltri:=RC.raiz;
      end ;


   Function ramaizqarboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion  ;      //-----------izq
      var
         reg:tiporegIndicetri  ;
      begin
            seek(Arbol.I, pos);
            read(Arbol.I, Reg);
            ramaizqarboltri:=reg.HijoIzq;
      end;


   Function ramamedioarboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion  ;          //-----------medio
      var
         reg:tiporegIndicetri  ;
      begin
            seek(Arbol.I, pos);
            read(Arbol.I, Reg);
            ramamedioarboltri:=reg.HijoMedio;
      end;


   Function ramadercharboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion ;        //-----------derecha
      var
         reg:tiporegIndicetri  ;
      begin
            seek(Arbol.I, pos);
            read(Arbol.I, Reg);
            ramadercharboltri:=reg.HijoDer;
      end  ;

   Function obtenerpadrearboltri  (var arbol:TipoMETrinario;Pos:tipoposicion):tipoposicion ;        //-----------padre
      var
         reg:tiporegIndicetri  ;
      begin
            seek(Arbol.I, pos);
            read(Arbol.I, Reg);
            obtenerpadrearboltri:=reg.Padre;
      end ;


   Procedure Capturararboltri  ( var arbol:TipoMETrinario;var Reg:tiporegIndicetri;Pos:tipoposicion);      //-----------captura
        begin
            seek(Arbol.I, pos);
            read(Arbol.I, Reg);
      end  ;


   Procedure Modificararboltri  (var arbol:TipoMETrinario;Reg:tiporegIndicetri;Pos:tipoposicion) ;        //-----------modifica
      begin
               seek(Arbol.I, pos);
               write(Arbol.I, Reg);
      end;


   Procedure InsertarEnMedio (var arbol: TipoMETrinario; Posdelcontrol:integer;Pos:tipoposicion);
   var
      reg:tiporegIndicetri;
   begin
                seek(Arbol.I, pos);
                Read(Arbol.I,reg);
                reg.HijoMedio:=Posdelcontrol;
                seek(Arbol.I, pos);
                write(Arbol.I, Reg);
   end;

end.
