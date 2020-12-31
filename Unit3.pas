unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,Auxiliar,LibreberiaBasicaArbol,Archivo, ExtCtrls,DobleEnlace,HashConColisiones;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    Button3: TButton;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Image1: TImage;
    ScrollBar1: TScrollBar;
    StringGrid2: TStringGrid;
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
   


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  nombredelusuario:string;

implementation

uses Unit4, Unit7, Unit2, Unit8;

{$R *.dfm}

procedure TForm3.Button3Click(Sender: TObject);
begin
  form3.Hide;
 if auxiliar.formanterior = 8then
    form8.Show;
 if auxiliar.formanterior = 2then
    form2.Show;
 if auxiliar.formanterior = 3then
    form2.Show;
 if auxiliar.formanterior = 4then
    form4.Show;

end;

procedure TForm3.FormActivate(Sender: TObject);
begin
   GroupBox2.Visible:=false;
   StringGrid2.Visible:=false;
   image1.Picture:=nil;
   if  grillaamostrar = 1 then
   begin
        GroupBox1.Caption:='Listado de jugadores de'+juego.Nombredelevento;
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=3;
        StringGrid1.Cells[0,0]:='Nick(Apodo)';
        StringGrid1.Cells[1,0]:='Cartones';
        StringGrid1.Cells[2,0]:='Premios';
        auxiliar.llenargrillaListadodejugador(auxiliar.VARMEJugadoresindiceNick,stringgrid1,LibreberiaBasicaArbol.RaizNodo(Auxiliar.VARMEJugadoresindiceNick),Auxiliar.VARMEJugadores,juego.Nombredelevento);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=3;
   end;
   if  grillaamostrar = 2 then
   begin
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=2;
        StringGrid1.Cells[0,0]:='Nick(Apodo)';
        StringGrid1.Cells[1,0]:='fecha - hora';
        auxiliar.llenargrillaListadodejugadoractivos(auxiliar.VARMEJugadoresindiceNick,stringgrid1,LibreberiaBasicaArbol.RaizNodo(Auxiliar.VARMEJugadoresindiceNick),Auxiliar.VARMEJugadores,juego.Nombredelevento);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=2;
   end;
   if  grillaamostrar = 3 then
   begin
        GroupBox1.Caption:='Calendario de juego activos';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=4;
        StringGrid1.Cells[0,0]:='Nombre';
        StringGrid1.Cells[1,0]:='Fecha  ';
        StringGrid1.Cells[2,0]:='Pozo acumulado ';
        StringGrid1.Cells[3,0]:='Cantidad de cartones vendidos';
        auxiliar.CalendarioJuegosActivos(StringGrid1);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=4;
   end;
    if  grillaamostrar = 4 then
   begin
        GroupBox1.Caption:='Listado de jugadores';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=6;
        StringGrid1.Cells[0,0]:='Nick';
        StringGrid1.Cells[1,0]:= 'ID de usuario';
        StringGrid1.Cells[2,0]:='Apellido y Nombre';
        StringGrid1.Cells[3,0]:='Contraseña';
        StringGrid1.Cells[4,0]:='Email';
        StringGrid1.Cells[5,0]:='Estado';
        llenargrillaListadodejugadoraeliminar(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick));
        GroupBox2.Visible:=true;
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=6;
   end;

   if  grillaamostrar = 5 then
   begin
        GroupBox1.Caption:='Calendario de juego activos';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=4;
        StringGrid1.Cells[0,0]:='Nombre';
        StringGrid1.Cells[1,0]:='Fecha  ';
        StringGrid1.Cells[2,0]:='Coste del carton';
        StringGrid1.Cells[3,0]:='Cantidad de cartones vendidos';

        auxiliar.CalendarioJuegoaordenar(StringGrid1);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=4;


   end;
    if  grillaamostrar = 6 then
   begin
        GroupBox1.Caption:='listado jugadores con mas compras';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=3;
        StringGrid1.Cells[0,0]:='Jugador ';
        StringGrid1.Cells[1,0]:='Posicion  ';
        StringGrid1.Cells[2,0]:='Cartones Comprados';

        auxiliar.llenargrillarankingdecompra(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),StringGrid1);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=3;
        auxiliar.OrdenarGrid(StringGrid1,1);
        StringGrid1.RowCount:=auxiliar.NCantidades+1;

   end;

   if  grillaamostrar = 7 then
   begin
        GroupBox1.Caption:='listado jugadores con mas dinero';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=4;
        StringGrid1.Cells[0,0]:='Jugador ';
        StringGrid1.Cells[1,0]:='Posicion  ';
        StringGrid1.Cells[2,0]:='Cantidad de premios';
        StringGrid1.Cells[3,0]:='Valor de los premios';
        auxiliar.llenargrillajugadoresconmasdinero(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),StringGrid1);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=4;
        auxiliar.OrdenarGrid(StringGrid1,1);
        StringGrid1.RowCount:=auxiliar.NCantidades+1;

   end;

   if  grillaamostrar = 8 then
   begin
        GroupBox1.Caption:='listado premios totales para ';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=2;
        StringGrid1.Cells[0,0]:='Jugador ';
        StringGrid1.Cells[1,0]:='Cantidad  ganado';

        auxiliar.listadojugadoresconundeterminado(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),StringGrid1,auxiliar.NCantidades);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=2;
        auxiliar.OrdenarGrid(StringGrid1,0);
        

   end;

   if  grillaamostrar = 9 then
   begin
        GroupBox1.Caption:='listado jugadores con mas compras';
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=6;
        StringGrid1.Cells[0,0]:='Nombre del Jugador ';
        StringGrid1.Cells[1,0]:='N° de carton  ';
        StringGrid1.Cells[2,0]:='Ganacia del carton';
        StringGrid1.Cells[3,0]:='Nombre del juego';
        StringGrid1.Cells[4,0]:='Fecha y hora jugado';
        StringGrid1.Cells[5,0]:='bolillas tiradas';
        auxiliar.listadodecartonesganadores(StringGrid1);
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=6;
   end;



end;






procedure TForm3.Button1Click(Sender: TObject);
var
      posicion:integer;
begin


         if MessageDlg('¿Esta seguro de querer bloquearlo?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
          begin
             posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
               if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredelusuario,posicion) then
                     begin
                            auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
                            auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
                            auxiliar.VARtiporegdatosJugadores.Estado:= 'X' ;
                            Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
                            showmessage(' bloqueo exitosa') ;
                      end;
          end;
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=6;
        StringGrid1.Cells[0,0]:='Nick';
        StringGrid1.Cells[1,0]:= 'ID de usuario';
        StringGrid1.Cells[2,0]:='Apellido y Nombre';
        StringGrid1.Cells[3,0]:='Contraseña';
        StringGrid1.Cells[4,0]:='Email';
        StringGrid1.Cells[5,0]:='Estado';
        llenargrillaListadodejugadoraeliminar(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick));
        GroupBox2.Visible:=true;
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=6;


end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
  pos,idjuego:integer;

begin
IF StringGrid1.FixedRows <> 0 THEN
    BEGIN
         if  (grillaamostrar = 9)  then
           begin
               if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,StringGrid1.Cells[0,ARow],pos) then
                  begin
                     Image1.Picture.LoadFromFile(Archivo.capturarmeArc(auxiliar.VARMEJugadores,CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).Foto)  ;
                     Image1.Stretch:=true;
          
                  end;

                idjuego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(StringGrid1.Cells[3,ARow]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
                DobleEnlace.buscar(auxiliar.VARMECartones,strtoint(StringGrid1.Cells[1,ARow]),pos,idjuego) ;
                auxiliar.VARtiporegdatosCartones:=DobleEnlace.Recuperar(auxiliar.VARMECartones,pos,idjuego);
                auxiliar.pasaralagriila(auxiliar.VARtiporegdatosCartones.Grilla,StringGrid2);
                StringGrid2.Visible:=true;
           end;



         if  (grillaamostrar = 4) or  (grillaamostrar = 2) or (grillaamostrar = 1) or (grillaamostrar = 6) or  (grillaamostrar = 7) or  (grillaamostrar = 8)  then
           if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,StringGrid1.Cells[0,ARow],pos) then
            begin
                   Image1.Picture.LoadFromFile(Archivo.capturarmeArc(auxiliar.VARMEJugadores,CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).Foto)  ;
                   Image1.Stretch:=true;
            end;
      END;


      nombredelusuario :=StringGrid1.Cells[0,ARow];
end;

procedure TForm3.Button2Click(Sender: TObject);
var
posicion:integer;
begin

         if MessageDlg('¿Esta seguro de querer desconectarlo', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
          begin
             posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
               if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredelusuario,posicion) then
                     begin
                            auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
                            auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
                            auxiliar.VARtiporegdatosJugadores.Estado:= 'D' ;
                            Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
                            showmessage(' desbloque exitoso') ;
                      end;   
          end;
         auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=6;
        StringGrid1.Cells[0,0]:='Nick';
        StringGrid1.Cells[1,0]:= 'ID de usuario';
        StringGrid1.Cells[2,0]:='Apellido y Nombre';
        StringGrid1.Cells[3,0]:='Contraseña';
        StringGrid1.Cells[4,0]:='Email';
        StringGrid1.Cells[5,0]:='Estado';
        llenargrillaListadodejugadoraeliminar(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick));
        GroupBox2.Visible:=true;
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=6;

end;

procedure TForm3.Button4Click(Sender: TObject);
var
    posicion:integer;
begin

         if MessageDlg('¿Esta seguro de querer conectarlo?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
          begin
             posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
               if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredelusuario,posicion) then
                     begin
                            auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
                            auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
                            auxiliar.VARtiporegdatosJugadores.Estado:= 'C' ;
                            Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
                            showmessage(' conecion exitosa') ;
                      end;   
          end;
        auxiliar.limpiargrilla(StringGrid1);
        StringGrid1.RowCount:=1;
        StringGrid1.ColCount:=6;
        StringGrid1.Cells[0,0]:='Nick';
        StringGrid1.Cells[1,0]:= 'ID de usuario';
        StringGrid1.Cells[2,0]:='Apellido y Nombre';
        StringGrid1.Cells[3,0]:='Contraseña';
        StringGrid1.Cells[4,0]:='Email';
        StringGrid1.Cells[5,0]:='Estado';
        llenargrillaListadodejugadoraeliminar(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick));
        GroupBox2.Visible:=true;
        if StringGrid1.RowCount <> 1 then
        StringGrid1.FixedRows:=1;
        ScrollBar1.Max:=6;

end;




procedure TForm3.ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
 if  ScrollPos <= StringGrid1.ColCount then
     auxiliar.OrdenarGrid(StringGrid1,ScrollPos);
end;

end.


