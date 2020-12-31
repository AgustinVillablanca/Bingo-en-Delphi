unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Pila,HashConColisiones,auxiliar,ColasParciales, Grids,
  DobleEnlace,LibreberiaBasicaArbol,LibreriaArbolAVL,Archivo,ArbolTrinario,
  ExtCtrls;

type
  TForm6 = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button3: TButton;
    GroupBox6: TGroupBox;
    StringGrid2: TStringGrid;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    GroupBox3: TGroupBox;
    StringGrid3: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBox1Select(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit4, Unit7, Unit8;

{$R *.dfm}


procedure TForm6.FormActivate(Sender: TObject);
var
    listadejugador:array [1..100]of string;
    i,o:integer;
begin
      i:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
      o:=0;
      auxiliar.Listarjugadores(listadejugador,auxiliar.VARMEJugadoresindiceNick,i,juego.ElIddelJuego,o,auxiliar.VARMEJugadores);
      ComboBox1.Items.Clear;
      while  o <> 0 do
      begin

            ComboBox1.Items.Add(listadejugador[o]);
            o:=o-1;
      end;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
form6.Hide;
 if auxiliar.formanterior = 8 then
    form8.Show;
 if auxiliar.formanterior = 7 then
    form7.Show;

end;

procedure TForm6.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
posauxiliar,bingo,cuagrande,cuachico ,cruz,diagonal ,filas,linea,x,y:integer;

begin
     if  StringGrid2.Cells[0,ARow]<> '' then
      begin
          filas:=1;
           while filas <>StringGrid2.RowCount do
                begin
                StringGrid2.Cells[3,filas]:= '' ;
                filas:=filas+1;
                end;
              StringGrid2.Cells[3,ARow]:= '<--';
         if dobleEnlace.buscar(auxiliar.VARMECartones,strtoint(StringGrid2.Cells[0,ARow]),posauxiliar,juego.ElIddelJuego) then
             begin

                  auxiliar.VARtiporegdatosCartones:= dobleEnlace.Recuperar(auxiliar.VARMECartones,posauxiliar,juego.ElIddelJuego);
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


procedure TForm6.ComboBox1Select(Sender: TObject);
var
  posicion,posauxiliarcontrol,n,bingo,cuagrande,cuachico ,cruz,diagonal ,linea,sumadepremioscantidad,cantidadganado,Preacumulado:integer;
  sumadepremiosvalor,valorganado,nobingo,valorbingo,cantidaddebingo,Pretotal:real;
  usu:Archivo.tiporegdato;
begin

  posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
  LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,ComboBox1.Items[ComboBox1.ItemIndex],posicion);
  auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
  auxiliar.VARtiporegdatosJugadores:=Archivo.capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
  usu:=auxiliar.VARtiporegdatosJugadores;
  Image1.Picture.LoadFromFile(usu.Foto)  ;
  Image1.Stretch:=true;




   auxiliar.limpiargrilla(StringGrid1);
   auxiliar.limpiargrilla(StringGrid2);
   auxiliar.limpiargrilla(StringGrid3);
          if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                begin
                       memo1.Clear;
                       valorganado:=0;
                       cantidadganado:=0;
                       auxiliar.ganaciasjugadorjuego(usu.Nick,juego.Nombredelevento,valorganado);
                       auxiliar.cantidaddepremiosganados(usu.Nick,juego.Nombredelevento,cantidadganado);
                       Preacumulado:=0;
                       Pretotal:=0;
                       auxiliar.contarpremiosguardadosdetodojugador(auxiliar.VARMEGanadores,auxiliar.VARMEJuegos,auxiliar.VARMEPremiosGanadores,strtoint(usu.IDusuario),Preacumulado,Pretotal);
                       memo1.Text:= 'Jugador: '+usu.ApellidoyNombre+ #13 + #10+
                      'Fecha de ingreso: '   +DateTimeToStr(usu.FechaAlta)+ #13 + #10+
                      'Premios acumulados como jugador: '+inttostr(Preacumulado)+' por $'+Format('%.2f', [Pretotal])+ #13 + #10+
                      'Partida Actual ( '+juego.Nombredelevento+')'+ #13 + #10+
                      'Cartones adquiridos: '+inttostr(dobleenlace.cantidadcartonesjugador(auxiliar.VARMECartones,juego.ElIddelJuego,strtoint(usu.IDusuario)))+ #13 + #10+
                      'Premios ganados: '+inttostr(cantidadganado) +'  por '+floattostr(valorganado) ;


                      n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usu.IDusuario));
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
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usu.IDusuario),n);
                            DobleEnlace.Premiosganados(auxiliar.VARtiporegdatosCartones,bingo,cuagrande,cuachico,cruz,diagonal,linea);
                            sumadepremioscantidad:=bingo+cuagrande+cuachico+cruz+diagonal+linea;
                            if bingo = 1 then
                                 begin
                                        cantidaddebingo:=0;
                                        nobingo:=0;
                                        auxiliar.Premiodelnobingo(auxiliar.VARMEJugadoresindiceNick,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),juego.Nombredelevento,nobingo,cantidaddebingo);
                                        if  auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton > nobingo then
                                        valorbingo:=((auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos*auxiliar.VARtiporegdatosJuegos.Valordelcarton)-nobingo)/cantidaddebingo
                                        else
                                        valorbingo:=0;
                                 end;
                             auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(usu.IDusuario),n);
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



end.
