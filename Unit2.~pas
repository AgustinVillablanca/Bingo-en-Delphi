unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Auxiliar,LibreberiaBasicaArbol, Grids, ExtCtrls,HashConColisiones,DobleEnlace,
  ColorGrd,Archivo,math;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    GroupBox3: TGroupBox;
    StringGrid3: TStringGrid;
    GroupBox4: TGroupBox;
    ListBox1: TListBox;
    GroupBox5: TGroupBox;
    ListBox2: TListBox;
    GroupBox6: TGroupBox;
    StringGrid2: TStringGrid;
    Button7: TButton;
    Button6: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    Button5: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Principal, Unit5, Unit9, Unit10, Unit3;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
var
posicion:integer;
begin
       posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
       LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,usuario.Nick,posicion);
       auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
       auxiliar.VARtiporegdatosJugadores:=Archivo.capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
       if usuario.Estado = 'C' then
        begin
          auxiliar.VARtiporegdatosJugadores.Estado:='D';
        end;
          Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
         usuario:=auxiliar.VARtiporegdatosJugadores;
      form2.Hide;
      form1.Show;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
   i,posicion,posauxiliarcontrol,n,Preacumulado:integer ;
   listado:array [0..40] of string;
   Pretotal:real;

begin

    if  usuario.Estado = 'C' then
      begin
       Button4.Caption:='Desconectar';
      end;
  if  usuario.Estado = 'D' then
      begin
       Button4.Caption:='Conectar';
      end;

  posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
  LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,usuario.Nick,posicion);
  auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
  auxiliar.VARtiporegdatosJugadores:=Archivo.capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
  auxiliar.VARtiporegdatosJugadores.FechaHoraUltimaConexion:=now();
  Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
  usuario:=auxiliar.VARtiporegdatosJugadores;







   Image1.Picture.LoadFromFile(auxiliar.VARtiporegdatosJugadores.Foto);
   Image1.Stretch:=true;
   auxiliar.limpiargrilla(StringGrid1);
   auxiliar.limpiargrilla(StringGrid2);
   auxiliar.limpiargrilla(StringGrid3);

    //llenar lista
   ListBox1.Clear;
   ListBox2.Clear;

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
                                            dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol);
                                            n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario));
                                            if n <> 0 then
                                            begin

                                                if (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado ) <> F then
                                                    ListBox1.Items.Add(listado[i]);
                                                if (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado) = F then
                                                    ListBox2.Items.Add(listado[i]);
                                            end;
                                      end;

                            end;
                          i:=i+1;
                  end;
      end;
     Preacumulado:=0;
     Pretotal:=0;
     auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(usuario.IDusuario),Preacumulado,Pretotal);
     memo1.Text:= 'Jugador: '+usuario.ApellidoyNombre+ #13 + #10+
               'Fecha de ingreso: '   +DateTimeToStr(usuario.FechaAlta)+ #13 + #10+
               'Premios acumulados como jugador: '+inttostr(Preacumulado)+' por $'+Format('%.2f', [Pretotal])+ #13 + #10;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
form2.Hide;
form5.show;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  posauxiliarcontrol,n,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,sumadepremioscantidad,cantidadganado,Preacumulado:integer;
  sumadepremiosvalor,valorganado,nobingo,valorbingo,cantidaddebingo,Pretotal:real;
begin
   ListBox2.ItemIndex :=-1;
   auxiliar.limpiargrilla(StringGrid1);
   auxiliar.limpiargrilla(StringGrid2);
   auxiliar.limpiargrilla(StringGrid3);
   if  ListBox1.ItemIndex <> -1 then
   begin
          if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox1.Items[ListBox1.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                begin
                       juego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                       memo1.Clear;
                       valorganado:=0;
                       cantidadganado:=0;
                       auxiliar.ganaciasjugadorjuego(usuario.Nick,juego.Nombredelevento,valorganado);
                       auxiliar.cantidaddepremiosganados(usuario.Nick,juego.Nombredelevento,cantidadganado);
                       Preacumulado:=0;
                       Pretotal:=0;
                       auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(usuario.IDusuario),Preacumulado,Pretotal);
                       memo1.Text:= 'Jugador: '+usuario.ApellidoyNombre+ #13 + #10+
                      'Fecha de ingreso: '   +DateTimeToStr(usuario.FechaAlta)+ #13 + #10+
                      'Premios acumulados como jugador: '+inttostr(Preacumulado)+' por $'+Format('%.2f', [Pretotal])+ #13 + #10+
                      'Partida Actual ( '+juego.Nombredelevento+')'+ #13 + #10+
                      'Cartones adquiridos: '+inttostr(dobleenlace.cantidadcartonesjugador(auxiliar.VARMECartones,juego.ElIddelJuego,strtoint(usuario.IDusuario)))+ #13 + #10+
                      'Premios ganados: '+inttostr(cantidadganado) +'  por '+floattostr(valorganado) ;


                      n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario));
                      auxiliar.limpiargrilla(StringGrid2);
                      StringGrid2.RowCount:=2;
                      StringGrid2.ColCount:=4;
                      StringGrid2.FixedRows:=1;
                      StringGrid2.Cells[0,0]:='Carton';
                      StringGrid2.Cells[1,0]:='Premios';
                      StringGrid2.Cells[2,0]:='$';
                      StringGrid2.Cells[3,0]:='selecionado';
                      StringGrid2.Cells[0,1]:='';

                      while n<>0 do
                            begin
                            bingo:=0;
                            cuagrande:=0;
                            cuachico:=0;
                            cruz:=0;
                            diagonal:=0;
                            linea:=0;
                            valorbingo:=0;
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                            DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                            sumadepremioscantidad:=bingo+cuagrande+cuachico+cruz+diagonal+linea;
                            if bingo = 1 then
                                 begin
                                        cantidaddebingo:=0;
                                        nobingo:=0;
                                        auxiliar.Premiodelnobingo(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),listbox1.Items[ListBox1.ItemIndex],nobingo,cantidaddebingo);
                                        if  auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton > nobingo then
                                        valorbingo:=((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton)-nobingo)/cantidaddebingo
                                        else
                                        valorbingo:=0;
                                 end;
                             auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                             sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                            (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                            (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                            (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                            (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                            StringGrid2.Cells[0,n]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                            StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                            StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor);
                            StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                            n:=n-1;
                            end;
                    end;

   end;

end;

procedure TForm2.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
posauxiliar,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,x,y,filas:integer;

begin

if (ListBox1.ItemIndex <> -1) or (ListBox2.ItemIndex <> -1)  then
begin
   if (ListBox1.ItemIndex <> -1)then
        posauxiliarcontrol:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
   if (ListBox2.ItemIndex <> -1)then
         posauxiliarcontrol:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox2.Items.Strings[ListBox2.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
    if  StringGrid2.Cells[0,ARow]<> '' then
      begin
          filas:=1;
           while filas <>StringGrid2.RowCount do
                begin
                StringGrid2.Cells[3,filas]:= '' ;
                filas:=filas+1;
                end;
              StringGrid2.Cells[3,ARow]:= '<--';

         if dobleEnlace.buscar(auxiliar.VARMECartones,strtoint(StringGrid2.Cells[0,ARow]),posauxiliar,posauxiliarcontrol) then
             begin

                  auxiliar.VARtiporegdatosCartones:= dobleEnlace.Recuperar(auxiliar.VARMECartones,posauxiliar,posauxiliarcontrol);
                  auxiliar.pasaralagriila(auxiliar.VARtiporegdatosCartones.Grilla,StringGrid1);

                  bingo:= 0;
                  cuagrande := 0;
                  cuachico := 0;
                  cruz := 0;
                  diagonal := 0;
                  linea:=0;
                  DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                   x:=0;
                   y:=0;
                  auxiliar.limpiargrilla(StringGrid3);
                  if bingo = 1 then
                      begin
                        StringGrid3.Cells[x,y]:='Bingo';
                        StringGrid3.Cells[x+1,y]:=inttostr(Bingo);
                      end
                  else
                      begin
                            if  cuagrande = 1 then
                                begin
                                  StringGrid3.Cells[x,y]:='CuadradoGrande';
                                  StringGrid3.Cells[x+1,y]:=inttostr(cuagrande);
                                  y:=y+1;

                                end;
                            if  cuachico = 1 then
                                begin
                                  StringGrid3.Cells[x,y]:='Cuadradochico';
                                  StringGrid3.Cells[x+1,y]:=inttostr(cuachico);
                                  y:=y+1;
                                end ;
                            if  cruz = 1 then
                                begin
                                  StringGrid3.Cells[x,y]:='Cruz';
                                  StringGrid3.Cells[x+1,y]:=inttostr(Cruz);
                                  y:=y+1;

                                end ;
                            if  diagonal <> 0 then
                                begin
                                  StringGrid3.Cells[x,y]:='Diagonal';
                                  StringGrid3.Cells[x+1,y]:=inttostr(Diagonal);
                                  y:=y+1;

                                end ;
                            if  linea <> 0 then
                                begin
                                  StringGrid3.Cells[x,y]:='linea';
                                  StringGrid3.Cells[x+1,y]:=inttostr(linea);

                                end;
                            

                      end;

            end;
        end;
end;
end;

procedure TForm2.Button4Click(Sender: TObject);
var
posicion:integer;
begin
  posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
  LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,usuario.Nick,posicion);
  auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
  auxiliar.VARtiporegdatosJugadores:=Archivo.capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
   if usuario.Estado = 'C' then
        begin
          auxiliar.VARtiporegdatosJugadores.Estado:='D';
        end;
   if usuario.Estado = 'D' then
        begin

          auxiliar.VARtiporegdatosJugadores.Estado:='C';
        end;
  Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
  usuario:=auxiliar.VARtiporegdatosJugadores;
      if  usuario.Estado = 'C' then
      begin
       Button4.Caption:='Desconectar';
      end;
  if  usuario.Estado = 'D' then
      begin
       Button4.Caption:='Conectar';
      end;




  


end;

procedure TForm2.Button1Click(Sender: TObject);
begin
form2.Hide;
form9.show;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
      auxiliar.formanterior := 2;
      auxiliar.grillaamostrar:=2;
      form2.Hide;
      form3.show;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
auxiliar.formanterior := 3;
grillaamostrar:=3;
form2.Hide;
form3.Show;
end;

procedure TForm2.Button7Click(Sender: TObject);
var
    numerodecarton,posiciondelcarton,posauxiliarcontrol,n,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,sumadepremioscantidad,cantidadganado:integer;
    sumadepremiosvalor,valorganado,nobingo,cantidaddebingo,valorbingo:real;
begin
   if  ListBox1.ItemIndex <> -1 then
      begin
             if  (StringGrid2.Row <> 0) and (StringGrid2.Row <> StringGrid2.RowCount) and (StringGrid2.Cells[0,StringGrid2.Row] <> '')  then
                  begin

                        numerodecarton:=strtoint(StringGrid2.Cells[0,StringGrid2.Row]);
                        DobleEnlace.buscar(auxiliar.VARMECartones,numerodecarton,posiciondelcarton,juego.ElIddelJuego);
                        DobleEnlace.Eliminar(auxiliar.VARMECartones,posiciondelcarton,juego.ElIddelJuego);
                        auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos) ;
                        auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos:=auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos-1;
                        HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(auxiliar.VARtiporegdatosJuegos.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARtiporegdatosJuegos,auxiliar.VARMEJuegos);
                        auxiliar.limpiargrilla(StringGrid1);
                        auxiliar.limpiargrilla(StringGrid2);
                        auxiliar.limpiargrilla(StringGrid3);
                        if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox1.Items[ListBox1.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                                     begin
                                            juego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                                            memo1.Clear;
                                            valorganado:=0;
                                            cantidadganado:=0;
                                            ganaciasjugadorjuego(usuario.Nick,juego.Nombredelevento,valorganado);
                                            cantidaddepremiosganados(usuario.Nick,juego.Nombredelevento,cantidadganado);
                                            memo1.Text:= 'Jugador: '+usuario.ApellidoyNombre+ #13 + #10+
                                           'Fecha de ingreso: '   +DateTimeToStr(usuario.FechaAlta)+ #13 + #10+
                                           'Premios acumulados como jugador: '+' por $'+ #13 + #10+
                                           'Partida Actual ( '+juego.Nombredelevento+')'+ #13 + #10+
                                           'Cartones adquiridos: '+inttostr(dobleenlace.cantidadcartonesjugador(auxiliar.VARMECartones,juego.ElIddelJuego,strtoint(usuario.IDusuario)))+ #13 + #10+
                                           'Premios ganados: '+inttostr(cantidadganado) +'  por '+floattostr(valorganado) ;


                                           n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario));
                                           auxiliar.limpiargrilla(StringGrid2);
                                           StringGrid2.RowCount:=2;
                                           StringGrid2.ColCount:=4;
                                           StringGrid2.FixedRows:=1;
                                           StringGrid2.Cells[0,0]:='Carton';
                                           StringGrid2.Cells[1,0]:='Premios';
                                           StringGrid2.Cells[2,0]:='$';
                                           StringGrid2.Cells[3,0]:='selecionado';
                                           StringGrid2.Cells[0,1]:='';

                                           while n<>0 do
                                                 begin
                                                 bingo:=0;
                                                 cuagrande:=0;
                                                 cuachico:=0;
                                                 cruz:=0;
                                                 diagonal:=0;
                                                 linea:=0;
                                                 valorbingo:=0;
                                                 auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                                                 DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                                                 sumadepremioscantidad:=bingo+cuagrande+cuachico+cruz+diagonal+linea;
                                                 if bingo = 1 then
                                                      begin
                                                             cantidaddebingo:=0;
                                                             nobingo:=0;
                                                             auxiliar.Premiodelnobingo(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),listbox1.Items[ListBox1.ItemIndex],nobingo,cantidaddebingo);
                                                             if  auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton > nobingo then
                                                                valorbingo:=((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton)-nobingo)/cantidaddebingo
                                                             else
                                                                valorbingo:=0;
                                                      end;
                                                  auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                                                  sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                                                 (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                                                 (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                                                 (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                                                 (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                                                 StringGrid2.Cells[0,n]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                                                 StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                                                 StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor);
                                                 StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                                                 n:=n-1;
                                                 end;
                                    end;

                      end;

          end;

end;

procedure TForm2.ListBox2Click(Sender: TObject);
var
  posauxiliarcontrol,n,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,sumadepremioscantidad,cantidadganado,Preacumulado:integer;
  sumadepremiosvalor,valorganado,nobingo,valorbingo,cantidaddebingo,Pretotal:real;
begin
  ListBox1.ItemIndex :=-1;
   auxiliar.limpiargrilla(StringGrid1);
   auxiliar.limpiargrilla(StringGrid2);
   auxiliar.limpiargrilla(StringGrid3);
   if  ListBox2.ItemIndex <> -1 then
   begin
          if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox2.Items[ListBox2.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                begin
                       juego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox2.Items.Strings[ListBox2.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                       memo1.Clear;
                       valorganado:=0;
                       cantidadganado:=0;
                       auxiliar.ganaciasjugadorjuego(usuario.Nick,juego.Nombredelevento,valorganado);
                       auxiliar.cantidaddepremiosganados(usuario.Nick,juego.Nombredelevento,cantidadganado);
                       Preacumulado:=0;
                       Pretotal:=0;
                       auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(usuario.IDusuario),Preacumulado,Pretotal);
                       memo1.Text:= 'Jugador: '+usuario.ApellidoyNombre+ #13 + #10+
                      'Fecha de ingreso: '   +DateTimeToStr(usuario.FechaAlta)+ #13 + #10+
                      'Premios acumulados como jugador: '+inttostr(Preacumulado)+' por $'+Format('%.2f', [Pretotal])+ #13 + #10+
                      'Partida Actual ( '+juego.Nombredelevento+')'+ #13 + #10+
                      'Cartones adquiridos: '+inttostr(dobleenlace.cantidadcartonesjugador(auxiliar.VARMECartones,juego.ElIddelJuego,strtoint(usuario.IDusuario)))+ #13 + #10+
                      'Premios ganados: '+inttostr(cantidadganado) +'  por '+floattostr(valorganado) ;


                      n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario));
                      auxiliar.limpiargrilla(StringGrid2);
                      StringGrid2.RowCount:=2;
                      StringGrid2.ColCount:=4;
                      StringGrid2.FixedRows:=1;
                      StringGrid2.Cells[0,0]:='Carton';
                      StringGrid2.Cells[1,0]:='Premios';
                      StringGrid2.Cells[2,0]:='$';
                      StringGrid2.Cells[3,0]:='selecionado';
                      StringGrid2.Cells[0,1]:='';

                      while n<>0 do
                            begin
                            bingo:=0;
                            cuagrande:=0;
                            cuachico:=0;
                            cruz:=0;
                            diagonal:=0;
                            linea:=0;
                            valorbingo:=0;
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                            DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                            sumadepremioscantidad:=bingo+cuagrande+cuachico+cruz+diagonal+linea;
                            if bingo = 1 then
                                 begin
                                        cantidaddebingo:=0;
                                        nobingo:=0;
                                        auxiliar.Premiodelnobingo(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),listbox2.Items[ListBox2.ItemIndex],nobingo,cantidaddebingo);
                                        if  auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton > nobingo then
                                        valorbingo:=((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton)-nobingo)/cantidaddebingo
                                        else
                                        valorbingo:=0;
                                 end;
                             auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usuario.IDusuario),n);
                             sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                            (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                            (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                            (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                            (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                            StringGrid2.Cells[0,n]:=inttostr(auxiliar.VARtiporegdatosCartones.IdCarton);
                            StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                            StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor);
                            StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                            n:=n-1;
                            end;
                    end;

   end;

end;



end.
