unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,auxiliar,HashConColisiones, Grids,LibreberiaBasicaArbol,
  Pila,dobleenlace,ColasParciales;

type
  TForm7 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    StringGrid3: TStringGrid;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    GroupBox2: TGroupBox;
    StringGrid2: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  ultimagrillausada:string;
implementation

uses Unit4, Unit3, Unit6;

{$R *.dfm}

procedure TForm7.FormActivate(Sender: TObject);

begin

  memo1.Text:=
  'Nombre del juego :'+HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Nombredelevento+
  '       fecha: '+ DateToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Fechadelevento)+
  '       Horaactual: '+TimeToStr(now())+#10+ #13+
  '       Pozo Acumulado: '+ FloatToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos *HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton) +
  '       Linea:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Plinea) +
  '       Diagonal:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pdiagonal) +
  '       cruz:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcruz) +
  '       cuadrado chico:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradochico) +
  '       cuadrado grande:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradogrande) ;
   auxiliar.limpiargrilla(StringGrid1);
  StringGrid1.RowCount:=2;
  StringGrid1.ColCount:=3;
  StringGrid1.FixedRows:=1;
  StringGrid1.Cells[0,0]:='Jugadores';
  StringGrid1.Cells[1,0]:='Estado';
  StringGrid1.Cells[2,0]:='Cartones';
  auxiliar.llenargrilladejugadores(StringGrid1,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.ElIddelJuego,0);
  auxiliar.limpiargrilla(StringGrid2);
  StringGrid2.RowCount:=2;
  StringGrid2.ColCount:=4;
  StringGrid2.FixedRows:=1;
  StringGrid2.Cells[0,0]:='Ganador';
  StringGrid2.Cells[1,0]:='Premio';
  StringGrid2.Cells[2,0]:='Carton';
  StringGrid2.Cells[3,0]:='$';
  auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);
  if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = J then
      begin
           Button10.Enabled:=false;
      end
  else
      begin
           Button10.Enabled:=true;
           Button11.Enabled:=false;
           Button2.Enabled:=false;
           Button3.Enabled:=false;
           Button9.Enabled:=false;
           Button7.Enabled:=false;
           Button4.Enabled:=false;
      end;



end;

procedure TForm7.Button1Click(Sender: TObject);
begin
form7.Hide;
form4.show;
end;

procedure TForm7.Button3Click(Sender: TObject);
var
 posauxiliarcontrol,x,y,z,w:integer;
 nombredelosganadores:string;
 nombreganador:array [0..10] of string;
 boliya:array [0..74] of integer;
 cant:integer;
begin
    if juego.Totalcartonesvendidos <> 0 then
      begin
        dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) ;
        if (not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego))) then
                  begin
                       auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                       auxiliar.VARtiporegdatosBolillerostirados.clave:=auxiliar.VARtiporegdatosBolilleros.clave;
                       ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                       Dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) ;
                       DobleEnlace.tachar(auxiliar.VARMECartones,posauxiliarcontrol,auxiliar.VARtiporegdatosBolilleros.clave);
                       cant:=0;
                       if  auxiliar.CalcularGanador(auxiliar.VARMECartones,posauxiliarcontrol,cant,nombreganador) then
                              begin
                                    if cant=1 then
                                        showmessage('hay un ganador y este es "'+nombreganador[cant]+'"')
                                    else
                                        begin
                                             while cant <> 0 do
                                                begin
                                                   nombredelosganadores:=nombredelosganadores+' '+nombreganador[cant];
                                                end;
                                             showmessage('hay varios ganador y estos son "'+nombredelosganadores+'"')
                                        end;
                              end;

                       pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego)
                  end;
      end
      else
          showmessage('No hay cartones vendidos');

     if ultimagrillausada = '1' then
          begin
                ultimagrillausada:='1';
                limpiarlista(boliya);
                limpiargrilla(StringGrid3);
                w:= 0;
                x:= 0;
                y:= 0;
                z:= 0;
                while (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego))) do
                    begin
                          ColasParciales.Frente(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                          boliya[z]:= auxiliar.VARtiporegdatosBolillerostirados.clave;
                          StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolillerostirados.clave);
                          ColasParciales.decolar(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego);
                          x:= x+1;
                          z:= z+1;
                          if (x = StringGrid3.ColCount) then
                          begin
                              x:=0;
                              y:=y+1;
                          end;
                    end;
                while z <> w do
                begin
                     auxiliar.VARtiporegdatosBolillerostirados.clave:=boliya[w];
                     ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                     w:=w+1;
                end;


                auxiliar.limpiargrilla(StringGrid2);
              StringGrid2.RowCount:=2;
              StringGrid2.ColCount:=4;
              StringGrid2.FixedRows:=1;
              StringGrid2.Cells[0,0]:='Ganador';
              StringGrid2.Cells[1,0]:='Premio';
              StringGrid2.Cells[2,0]:='Carton';
              StringGrid2.Cells[3,0]:='$';
              auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);
          end;
     if ultimagrillausada = '2' then
          begin
                  ultimagrillausada:='2';
                  limpiarlista(boliya);
                  limpiargrilla(StringGrid3);
                  w:= 0;
                  x:= 0;
                  y:= 0;
                  z:= 0;
                  while not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
                      begin
                            auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                            boliya[z]:= auxiliar.VARtiporegdatosBolilleros.clave;
                            StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolilleros.clave);
                            pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                            x:= x+1;
                            z:= z+1;
                            if (x = StringGrid3.ColCount) then
                            begin
                                x:=0;
                                y:=y+1;
                            end;
                      end;

                  while z <> w do
                  begin
                      z:=z-1;
                      if  boliya[z]<>0 then
                           begin
                                auxiliar.VARtiporegdatosBolilleros.clave:=boliya[z];
                                 pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);
                            end;
                  end;

                  auxiliar.limpiargrilla(StringGrid2);
                StringGrid2.RowCount:=2;
                StringGrid2.ColCount:=4;
                StringGrid2.FixedRows:=1;
                StringGrid2.Cells[0,0]:='Ganador';
                StringGrid2.Cells[1,0]:='Premio';
                StringGrid2.Cells[2,0]:='Carton';
                StringGrid2.Cells[3,0]:='$';
                auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);

          end;




end;

procedure TForm7.Button7Click(Sender: TObject);
var
      x,y,z,w:integer;
      boliya:array [0..74] of integer;
begin

    ultimagrillausada:='1';
    limpiarlista(boliya);
    limpiargrilla(StringGrid3);
    w:= 0;
    x:= 0;
    y:= 0;
    z:= 0;
    while (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego))) do
        begin
              ColasParciales.Frente(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
              boliya[z]:= auxiliar.VARtiporegdatosBolillerostirados.clave;
              StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolillerostirados.clave);
              ColasParciales.decolar(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego);
              x:= x+1;
              z:= z+1;
              if (x = StringGrid3.ColCount) then
              begin
                  x:=0;
                  y:=y+1;
              end;
        end;
    while z <> w do
    begin

         auxiliar.VARtiporegdatosBolillerostirados.clave:=boliya[w];
         ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
         w:=w+1;
    end;


    auxiliar.limpiargrilla(StringGrid2);
  StringGrid2.RowCount:=2;
  StringGrid2.ColCount:=4;
  StringGrid2.FixedRows:=1;
  StringGrid2.Cells[0,0]:='Ganador';
  StringGrid2.Cells[1,0]:='Premio';
  StringGrid2.Cells[2,0]:='Carton';
  StringGrid2.Cells[3,0]:='$';
  auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);




end;

procedure TForm7.Button8Click(Sender: TObject);
var
  p,cant,posauxiliarcontrol:integer;
  nombreganador:array [0..10] of string;
begin
        cant:=0;
        dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) ;
        if  auxiliar.CalcularGanador(auxiliar.VARMECartones,posauxiliarcontrol,cant,nombreganador) then
        begin
                p:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID);
                auxiliar.GuardarResultados(auxiliar.VARMEJugadoresindiceID,p,juego.Nombredelevento);
                juego.Estado:=F;
                HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),juego,auxiliar.VARMEJuegos);
                form7.Hide;
                form4.show;
        end
        else
        begin
                if MessageDlg('Estas por finalizar el juego sin tener un ganador , desea continuar?    ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                    begin
                            p:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID);
                            auxiliar.GuardarResultados(auxiliar.VARMEJugadoresindiceID,p,juego.Nombredelevento);
                            juego.Estado:=F;
                            HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),juego,auxiliar.VARMEJuegos);
                            form7.Hide;
                            form4.show;
                    end;

        end;
end;

procedure TForm7.Button9Click(Sender: TObject);
var
    posauxiliarcontrol,cant,p,x,y,z,w: integer;
    salir:boolean;
    nombredelosganadores:string;
    nombreganador:array [0..100] of string;
    boliya:array [0..74] of integer;

begin

  if juego.Totalcartonesvendidos <> 0 then
  begin
      salir:=false;
      while  (not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego))) and (salir=false)  do
          begin
                    auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                    auxiliar.VARtiporegdatosBolillerostirados.clave:=auxiliar.VARtiporegdatosBolilleros.clave;
                    ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                    dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) ;
                    DobleEnlace.tachar(auxiliar.VARMECartones,posauxiliarcontrol,auxiliar.VARtiporegdatosBolilleros.clave);
                    cant:=0;
                    if  auxiliar.CalcularGanador(auxiliar.VARMECartones,posauxiliarcontrol,cant,nombreganador) then
                         begin
                                  salir:=true;
                                    if cant=1 then
                                        showmessage('hay un ganador y este es "'+nombreganador[cant-1]+'"')
                                    else
                                        begin
                                            auxiliar.eliminarrepetidolista(nombreganador);
                                             while cant <> 0 do
                                                begin
                                                   if nombreganador[cant-1] <> '' then
                                                   nombredelosganadores:=nombredelosganadores+' '+nombreganador[cant-1];
                                                   cant:=cant-1;
                                                end;

                                             showmessage('hay varios cartones ganador y estos pertenesen a "'+nombredelosganadores+'"')
                                        end;
                                        auxiliar.limpiargrilla(StringGrid2);
                                        StringGrid2.RowCount:=2;
                                        StringGrid2.ColCount:=4;
                                        StringGrid2.FixedRows:=1;
                                        StringGrid2.Cells[0,0]:='Ganador';
                                        StringGrid2.Cells[1,0]:='Premio';
                                        StringGrid2.Cells[2,0]:='Carton';
                                        StringGrid2.Cells[3,0]:='$';
                                        auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);

                                        if MessageDlg('¿desea guardar el resultado y salir? ', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                                         begin
                                                 p:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID);
                                                 auxiliar.GuardarResultados(auxiliar.VARMEJugadoresindiceID,p,juego.Nombredelevento);
                                                 juego.Estado:=F;
                                                 HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),juego,auxiliar.VARMEJuegos);
                                                 form7.Hide;
                                                 form4.show;
                                         end;


                         end;
                    if  not (pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) then
                            pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);

        end;
  end
    else
       showmessage('No hay cartones vendidos');



     if ultimagrillausada = '1' then
          begin
                ultimagrillausada:='1';
                limpiarlista(boliya);
                limpiargrilla(StringGrid3);
                w:= 0;
                x:= 0;
                y:= 0;
                z:= 0;
                while (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego))) do
                    begin
                          ColasParciales.Frente(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                          boliya[z]:= auxiliar.VARtiporegdatosBolillerostirados.clave;
                          StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolillerostirados.clave);
                          ColasParciales.decolar(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego);
                          x:= x+1;
                          z:= z+1;
                          if (x = StringGrid3.ColCount) then
                          begin
                              x:=0;
                              y:=y+1;
                          end;
                    end;
                while z <> w do
                begin
                     auxiliar.VARtiporegdatosBolillerostirados.clave:=boliya[w];
                     ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                     w:=w+1;
                end;


                auxiliar.limpiargrilla(StringGrid2);
              StringGrid2.RowCount:=2;
              StringGrid2.ColCount:=4;
              StringGrid2.FixedRows:=1;
              StringGrid2.Cells[0,0]:='Ganador';
              StringGrid2.Cells[1,0]:='Premio';
              StringGrid2.Cells[2,0]:='Carton';
              StringGrid2.Cells[3,0]:='$';
              auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);
          end;
     if ultimagrillausada = '2' then
          begin
                  ultimagrillausada:='2';
                  limpiarlista(boliya);
                  limpiargrilla(StringGrid3);
                  w:= 0;
                  x:= 0;
                  y:= 0;
                  z:= 0;
                  while not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
                      begin
                            auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                            boliya[z]:= auxiliar.VARtiporegdatosBolilleros.clave;
                            StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolilleros.clave);
                            pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                            x:= x+1;
                            z:= z+1;
                            if (x = StringGrid3.ColCount) then
                            begin
                                x:=0;
                                y:=y+1;
                            end;
                      end;

                  while z <> w do
                  begin
                      z:=z-1;
                      if  boliya[z]<>0 then
                           begin
                                auxiliar.VARtiporegdatosBolilleros.clave:=boliya[z];
                                 pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);
                            end;
                  end;

                  auxiliar.limpiargrilla(StringGrid2);
                StringGrid2.RowCount:=2;
                StringGrid2.ColCount:=4;
                StringGrid2.FixedRows:=1;
                StringGrid2.Cells[0,0]:='Ganador';
                StringGrid2.Cells[1,0]:='Premio';
                StringGrid2.Cells[2,0]:='Carton';
                StringGrid2.Cells[3,0]:='$';
                auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);

          end;










end;


procedure TForm7.Button5Click(Sender: TObject);
begin
    auxiliar.formanterior :=7;
    form7.Hide;
    form6.show;
end;

procedure TForm7.Button6Click(Sender: TObject);
begin
    auxiliar.formanterior:=7;
    auxiliar.grillaamostrar:=1;
    form7.Hide;
    form3.show;
end;

procedure TForm7.Button10Click(Sender: TObject);
begin
      if juego.Totalcartonesvendidos <> 0 then
          begin
                    juego.Estado:=J;
                    HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),juego,auxiliar.VARMEJuegos);
                    if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = J then
                        begin
                                     Button2.Enabled:=true;
                                     Button3.Enabled:=true;
                                     Button9.Enabled:=true;
                                     Button7.Enabled:=true;
                                     Button4.Enabled:=true;
                                     if pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego) then
                                            Button11.Enabled:=true
                                     else
                                            Button11.Enabled:=false;
                       end;
           end
          else
            showmessage('No hay cartones vendidos');

end;

procedure TForm7.Button11Click(Sender: TObject);
var
x:integer;
begin
      if pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego) then
            begin
                    x:=1;
                    while x <> 76 do
                       begin
                           auxiliar.VARtiporegdatosBolilleros.clave:=x;
                           pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);
                           x:=x+1;
                       end;
                  Button11.Enabled:=false;
            end
      else
          showmessage('ya hay bolillas para jugar');
end;

procedure TForm7.Button2Click(Sender: TObject);
var
   boliya,boliya2:array [0..74] of integer;
   x,y,w,z,aleatorio:integer;
begin
      limpiarlista(boliya);
      limpiarlista(boliya2);
      x:=0;
      if not (pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) then
         begin
              while  not (pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
               begin
                    auxiliar.VARtiporegdatosBolilleros:= pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                    boliya[x]:=auxiliar.VARtiporegdatosBolilleros.clave;
                    x:=x+1;
                    pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
               end;
         end;
      y:=0;

      while x <> y  do
          begin
                aleatorio:=Random(x);
                if  boliya[aleatorio] <> 0 then
                     begin
                      boliya2[y]:= boliya[aleatorio];
                      boliya[aleatorio]:=0;
                      y:=y+1;
                     end;

          end;
      while y <> 0 do
          begin
                y:=y-1;
               auxiliar.VARtiporegdatosBolilleros.clave:=boliya2[y];
               pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);

          end;






    
    limpiarlista(boliya);
    limpiargrilla(StringGrid3);
    w:= 0;
    x:= 0;
    y:= 0;
    z:= 0;
    while not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
        begin
              auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
              boliya[z]:= auxiliar.VARtiporegdatosBolilleros.clave;
              StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolilleros.clave);
              pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
              x:= x+1;
              z:= z+1;
              if (x = StringGrid3.ColCount) then
              begin
                  x:=0;
                  y:=y+1;
              end;
        end;

    while z <> w do
    begin
        z:=z-1;
        if  boliya[z]<>0 then
             begin
                  auxiliar.VARtiporegdatosBolilleros.clave:=boliya[z];
                   pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);
              end;
    end;

    auxiliar.limpiargrilla(StringGrid2);
  StringGrid2.RowCount:=2;
  StringGrid2.ColCount:=4;
  StringGrid2.FixedRows:=1;
  StringGrid2.Cells[0,0]:='Ganador';
  StringGrid2.Cells[1,0]:='Premio';
  StringGrid2.Cells[2,0]:='Carton';
  StringGrid2.Cells[3,0]:='$';
  auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);


















end;

procedure TForm7.Button4Click(Sender: TObject);
var
      x,y,z,w:integer;
      boliya:array [0..74] of integer;
begin


    ultimagrillausada:='2';
    limpiarlista(boliya);
    limpiargrilla(StringGrid3);
    w:= 0;
    x:= 0;
    y:= 0;
    z:= 0;
    while not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
        begin
              auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
              boliya[z]:= auxiliar.VARtiporegdatosBolilleros.clave;
              StringGrid3.Cells[x,y]:=inttostr(auxiliar.VARtiporegdatosBolilleros.clave);
              pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
              x:= x+1;
              z:= z+1;
              if (x = StringGrid3.ColCount) then
              begin
                  x:=0;
                  y:=y+1;
              end;
        end;

    while z <> w do
    begin
        z:=z-1;
        if  boliya[z]<>0 then
             begin
                  auxiliar.VARtiporegdatosBolilleros.clave:=boliya[z];
                   pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);
              end;
    end;

    auxiliar.limpiargrilla(StringGrid2);
  StringGrid2.RowCount:=2;
  StringGrid2.ColCount:=4;
  StringGrid2.FixedRows:=1;
  StringGrid2.Cells[0,0]:='Ganador';
  StringGrid2.Cells[1,0]:='Premio';
  StringGrid2.Cells[2,0]:='Carton';
  StringGrid2.Cells[3,0]:='$';
  auxiliar.llenargrilladepremios(StringGrid2,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.Nombredelevento,0);

end;
end.
