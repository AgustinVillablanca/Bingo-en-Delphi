unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,auxiliar,HashConColisiones,DobleEnlace,Math,
  ColasParciales,ArbolTrinario,LibreberiaBasicaArbol,pila,archivo, ExtCtrls;

type
  TForm8 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Button8: TButton;
    Button9: TButton;
    StringGrid3: TStringGrid;
    GroupBox2: TGroupBox;
    StringGrid4: TStringGrid;
    Timer1: TTimer;
    Button6: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button7: TButton;
    Button10: TButton;
    Button11: TButton;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    StringGrid2: TStringGrid;
    GroupBox4: TGroupBox;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  boliya3,boliya4:array [0..74] of integer;
  posbolillarestantes,posauxiliarcontrol:integer;
  nombredeljugador,numerodecarton,tipodegrilla:string;
implementation

uses Unit3, Unit4, Unit7, Unit6;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
      timer1.Enabled:=false;
      form8.Hide;
      form4.show;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  GroupBox1.Caption:='Automatica';
  auxiliar.llenargrilladejugadores(StringGrid1,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.ElIddelJuego,0);
  Button4.Visible:=true;
  Button5.Visible:=true;
  Button8.Enabled:=true;
  Button6.Enabled:=false;
  Button9.Enabled:=true;
  edit1.Visible:=true;
  label1.Visible:=true;
  StringGrid1.RowCount:=2;
  StringGrid1.ColCount:=4;
  StringGrid1.FixedRows:=1;
  StringGrid1.Cells[0,0]:='Nick';
  StringGrid1.Cells[1,0]:='Estado';
  StringGrid1.Cells[2,0]:='N� de cartones';
  StringGrid1.Cells[3,0]:= 'selecionar' ;


end;




procedure TForm8.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
       posauxiliarcontrol,n,pos,filas,bingo,cuagrande,cuachico,cruz,diagonal,linea,sumadepremioscantidad,numerodecartonelejido:integer;
       idusu:string;
       sumadepremiosvalor,nobingo,cantidaddebingo,valorbingo:real;
begin
   nombredeljugador:= StringGrid1.Cells[0,ARow] ;
   if  nombredeljugador  <> '' then
   begin

      filas:=1;
      while filas <>StringGrid1.RowCount do
      begin
           StringGrid1.Cells[3,filas]:= '' ;
           filas:=filas+1;
      end;
      StringGrid1.Cells[3,ARow]:= '<--';


      auxiliar.limpiargrilla(StringGrid2);
      auxiliar.limpiargrilla(StringGrid4);

      dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol);
      LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredeljugador,pos);
      idusu:=archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario;
      n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu));
      StringGrid2.RowCount:=2;
      StringGrid2.ColCount:=4;
      StringGrid2.FixedRows:=1;
      StringGrid2.Cells[0,0]:='Carton';
      StringGrid2.Cells[1,0]:='Premios';
      StringGrid2.Cells[2,0]:='$';
      StringGrid2.Cells[3,0]:= 'selecionar' ;

      StringGrid2.Cells[0,1]:='';
                         while n<>0 do
                            begin
                            bingo:=0;
                            cuagrande:=0;
                            cuachico:=0;
                            cruz:=0;
                            diagonal:=0;
                            linea:=0;
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu),n);
                            numerodecartonelejido:=auxiliar.VARtiporegdatosCartones.IdCarton;
                            quitareltachado (auxiliar.VARtiporegdatosCartones.Grilla);
                            agregartachado(boliya4,auxiliar.VARtiporegdatosCartones.Grilla);
                            Premiosganados(auxiliar.VARtiporegdatosCartones,bingo ,cuagrande,cuachico,cruz,diagonal,linea);
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
                                 end
                              else
                                valorbingo:=0;


                            sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                            (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                            (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                            (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                            (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                            StringGrid2.Cells[0,n]:=inttostr(numerodecartonelejido);
                            StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                            StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor) ;
                            StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                            n:=n-1;
                            end;
   end;
end;

procedure TForm8.FormActivate(Sender: TObject);
var
    z,w,v,b,x:integer;
    boliya:array [0..74] of integer;
    boliya2:array [0..74] of integer;
begin
    if formanterior = 4 then
      begin
          label3.Caption:=juego.Nombredelevento;
          Button8.Enabled:=true;
          Button9.Enabled:=false;
          Button6.Enabled:=false;
          edit1.Visible:=false;
          label1.Visible:=false;
          posauxiliarcontrol:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).ElIddelJuego;
          auxiliar.limpiargrilla(StringGrid1);
          auxiliar.limpiargrilla(StringGrid2);
          auxiliar.limpiargrilla(StringGrid3);
          auxiliar.limpiargrilla(StringGrid4);
          auxiliar.limpiarlista(boliya);
          auxiliar.limpiarlista(boliya2);
          auxiliar.limpiarlista(boliya3);
          z:=0;
          while (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego))) do
              begin
                    ColasParciales.Frente(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                    boliya[z]:= auxiliar.VARtiporegdatosBolillerostirados.clave;
                    ColasParciales.decolar(auxiliar.VARMEBolillerostirados,juego.ElIddelJuego);
                    z:=z+1;
              end;
          w:=0;
          while z <> w do
                begin
                     auxiliar.VARtiporegdatosBolillerostirados.clave:=boliya[w];
                     ColasParciales.encolar(auxiliar.VARMEBolillerostirados,auxiliar.VARtiporegdatosBolillerostirados,juego.ElIddelJuego);
                     w:=w+1;
                end;

          v:= 0;
          while not(pila.vacio(auxiliar.VARMEBolilleros,juego.ElIddelJuego)) do
              begin
                    auxiliar.VARtiporegdatosBolilleros:=pila.Tope(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                    boliya2[v]:= auxiliar.VARtiporegdatosBolilleros.clave;
                    pila.Desapilar(auxiliar.VARMEBolilleros,juego.ElIddelJuego);
                    v:=v+1;
              end;
         b:=v;
          while v <> 0 do
          begin
                        v:=v-1;
                        auxiliar.VARtiporegdatosBolilleros.clave:=boliya2[v];
                         pila.Apilar(auxiliar.VARMEBolilleros,auxiliar.VARtiporegdatosBolilleros,juego.ElIddelJuego);

          end;

         posbolillarestantes:=b-1;

          x:=0;

          while b <> 0 do
                begin
                   b:=b-1;
                   boliya3[x]:=boliya2[b];
                   x:=x+1;
                end;

          while  w <> 0 do
                begin
                    w:=w-1;
                    boliya3[x]:=boliya[w];
                    x:=x+1;
                end;
      end;
end;
procedure TForm8.Button8Click(Sender: TObject);
  var
     z,y,x,numero:integer;
begin
  tipodegrilla:='1';
  auxiliar.limpiargrilla(StringGrid3);
    y:= 0;
    z:= 0;
    x:=74;
    while x <> -1  do
        begin
              numero:=boliya3[x];
              if numero <> 0 then
              begin
                    StringGrid3.Cells[y,z]:=  inttostr(numero);
                    y:= y+1;
              end;
              x:=x-1;
              if (y = StringGrid3.ColCount) then
              begin
                  y:=0;
                  z:=z+1;
              end;
        end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
      GroupBox1.Caption:='Manual' ;
      Button8.Enabled:=true;
      Button6.Enabled:=true;
      Button9.Enabled:=true;
      Button4.Visible:=False;
      Button5.Visible:=False;
      timer1.Enabled:=false;
      edit1.Visible:=false;
      label1.Visible:=false;
      StringGrid1.RowCount:=2;
      StringGrid1.ColCount:=4;
      StringGrid1.FixedRows:=1;
      StringGrid1.Cells[0,0]:='Nick';
      StringGrid1.Cells[1,0]:='Estado';
      StringGrid1.Cells[2,0]:='N� de cartones';
      StringGrid1.Cells[3,0]:= 'selecionar' ;
      auxiliar.llenargrilladejugadores(StringGrid1,auxiliar.VARMEJugadoresindiceID,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),juego.ElIddelJuego,0);
end;

procedure TForm8.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
posauxiliar,filas:integer;
begin

    if  StringGrid2.Cells[0,Arow] <> '' then
      begin
           numerodecarton:= StringGrid2.Cells[0,Arow];
           filas:=1;
           while filas <>StringGrid2.RowCount do
               begin
                    StringGrid2.Cells[3,filas]:= '' ;
                     filas:=filas+1;
               end;
            StringGrid2.Cells[3,ARow]:= '<--';


         if dobleEnlace.buscar(auxiliar.VARMECartones,strtoint(numerodecarton),posauxiliar,posauxiliarcontrol) then
             begin

                  auxiliar.VARtiporegdatosCartones:= dobleEnlace.Recuperar(auxiliar.VARMECartones,posauxiliar,posauxiliarcontrol);
                  auxiliar.pasaralagriilarepeticion(boliya4,auxiliar.VARtiporegdatosCartones.Grilla,StringGrid4);
             end;
      end;
end;

procedure TForm8.Button9Click(Sender: TObject);
var
     z,y,x,numero:integer;
begin
 tipodegrilla:='2';
  auxiliar.limpiargrilla(StringGrid3);
    y:= 0;
    z:= 0;
    x:=74;
    while x <> -1  do
        begin
              numero:=boliya4[x];
              if numero <> 0 then
              begin
                    StringGrid3.Cells[y,z]:=  inttostr(numero);
                    y:= y+1;
              end;
              x:=x-1;
              if (y = StringGrid3.ColCount) then
              begin
                  y:=0;
                  z:=z+1;
              end;
        end;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
timer1.Enabled:=false;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
if (edit1.Text <>  '0')  and (edit1.Text <>  '')then
    begin
         timer1.Interval:= strtoint(edit1.Text)*1000;
         timer1.Enabled:=true;
    end
else
    begin
         showmessage('La cantidad de segundos no es valida'); 
    end;

end;

procedure TForm8.Button6Click(Sender: TObject);
var
    salir:boolean;
    boli,x,y,z,numero,posauxiliar,posauxiliarcontrol,n,pos,bingo,cuagrande,cuachico,cruz,diagonal,linea,sumadepremioscantidad,numerodecartonelejido:integer;
    idusu:string;
    sumadepremiosvalor,nobingo,cantidaddebingo,valorbingo:real;

begin
               boli:=74;
                salir:=false;
                while (boli <> posbolillarestantes)  and (salir <> true) do
                  begin

                        if boliya3[boli] <> 0 then
                             begin
                                boliya4[boli]:=boliya3[boli];
                                salir:=true
                             end ;
                               boliya3[boli]:=0;
                               boli:=boli-1;
                        if boli = posbolillarestantes then
                        showmessage('El juego a finalizado no puede sacar mas bolillas');

                  end;


                   auxiliar.limpiargrilla(StringGrid3);
                   y:= 0;
                   z:= 0;
                   x:=74;
                   while x <> -1  do
                       begin
                              numero:=0;
                                if  tipodegrilla = '1' then
                                    numero:=boliya3[x];
                                if  tipodegrilla = '2' then
                                    numero:=boliya4[x];
                             if numero <> 0 then
                             begin

                                   StringGrid3.Cells[y,z]:=  inttostr(numero);
                                   y:= y+1;
                             end;
                             x:=x-1;
                             if (y = StringGrid3.ColCount) then
                             begin
                                 y:=0;
                                 z:=z+1;
                             end;
                       end;

          if  nombredeljugador <> '' then
                begin
                         ////

                         auxiliar.limpiargrilla(StringGrid2);
                         auxiliar.limpiargrilla(StringGrid4);

                         dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol);
                         LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredeljugador,pos);
                         idusu:=archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario;
                         n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu));
                         StringGrid2.RowCount:=2;
                         StringGrid2.ColCount:=4;
                         StringGrid2.FixedRows:=1;
                         StringGrid2.Cells[0,0]:='Carton';
                         StringGrid2.Cells[1,0]:='Premios';
                         StringGrid2.Cells[2,0]:='$';
                         StringGrid2.Cells[3,0]:= 'selecionar' ;

                         StringGrid2.Cells[0,1]:='';
                         while n<>0 do
                            begin
                            bingo:=0;
                            cuagrande:=0;
                            cuachico:=0;
                            cruz:=0;
                            diagonal:=0;
                            linea:=0;
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu),n);
                            numerodecartonelejido:=auxiliar.VARtiporegdatosCartones.IdCarton;
                            quitareltachado (auxiliar.VARtiporegdatosCartones.Grilla);
                            agregartachado(boliya4,auxiliar.VARtiporegdatosCartones.Grilla);
                            Premiosganados(auxiliar.VARtiporegdatosCartones,bingo ,cuagrande,cuachico,cruz,diagonal,linea);
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
                                 end
                              else
                                valorbingo:=0;


                            sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                            (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                            (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                            (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                            (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                            StringGrid2.Cells[0,n]:=inttostr(numerodecartonelejido);
                            StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                            StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor) ;
                            StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                            n:=n-1;
                            end;
               //////
                    if  numerodecarton <> '' then
                        begin
                            if dobleEnlace.buscar(auxiliar.VARMECartones,strtoint(numerodecarton),posauxiliar,posauxiliarcontrol) then
                               begin
                                    auxiliar.VARtiporegdatosCartones:= dobleEnlace.Recuperar(auxiliar.VARMECartones,posauxiliar,posauxiliarcontrol);
                                    auxiliar.pasaralagriilarepeticion(boliya4,auxiliar.VARtiporegdatosCartones.Grilla,StringGrid4);
                               end;
                        end;
                end;



end;

procedure TForm8.Timer1Timer(Sender: TObject);
var
posauxiliar,boli,x,y,z,numero,posauxiliarcontrol,n,pos,bingo,cuagrande,cuachico,cruz,diagonal,linea,sumadepremioscantidad,numerodecartonelejido:integer;
salir:boolean;
idusu:string;
sumadepremiosvalor,nobingo,cantidaddebingo,valorbingo:real;
begin
                  boli:=74;
                salir:=false;
                while (boli <> posbolillarestantes)  and (salir <> true) do
                  begin

                        if boliya3[boli] <> 0 then
                             begin
                                boliya4[boli]:=boliya3[boli];
                                salir:=true
                             end ;
                               boliya3[boli]:=0;
                               boli:=boli-1;
                        if boli = posbolillarestantes then
                             begin
                               timer1.Enabled:=false;
                             end;

                  end;
                  if boli = posbolillarestantes then
                               showmessage('El juego a finalizado no puede sacar mas bolillas');


                   auxiliar.limpiargrilla(StringGrid3);
                   y:= 0;
                   z:= 0;
                   x:=74;
                   while x <> -1  do
                       begin
                              numero:=0;
                                if  tipodegrilla = '1' then
                                    numero:=boliya3[x];
                                if  tipodegrilla = '2' then
                                    numero:=boliya4[x];
                             if numero <> 0 then
                             begin

                                   StringGrid3.Cells[y,z]:=  inttostr(numero);
                                   y:= y+1;
                             end;
                             x:=x-1;
                             if (y = StringGrid3.ColCount) then
                             begin
                                 y:=0;
                                 z:=z+1;
                             end;
                       end;

  if  nombredeljugador <> '' then
    begin
             ////

             auxiliar.limpiargrilla(StringGrid2);
             auxiliar.limpiargrilla(StringGrid4);

             dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol);
             LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,nombredeljugador,pos);
             idusu:=archivo.capturarmeArc(auxiliar.VARMEJugadores,LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,pos).posEnDatos).IDusuario;
             n:=dobleEnlace.cantidadcartonesjugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu));
             StringGrid2.RowCount:=2;
             StringGrid2.ColCount:=4;
             StringGrid2.FixedRows:=1;
             StringGrid2.Cells[0,0]:='Carton';
             StringGrid2.Cells[1,0]:='Premios';
             StringGrid2.Cells[2,0]:='$';
             StringGrid2.Cells[3,0]:= 'selecionar' ;

             StringGrid2.Cells[0,1]:='';
                         while n<>0 do
                            begin
                            bingo:=0;
                            cuagrande:=0;
                            cuachico:=0;
                            cruz:=0;
                            diagonal:=0;
                            linea:=0;
                            auxiliar.VARtiporegdatosCartones:=dobleenlace.cartoneelejidojugador(auxiliar.VARMECartones,posauxiliarcontrol,strtoint(idusu),n);
                            numerodecartonelejido:=auxiliar.VARtiporegdatosCartones.IdCarton;
                            quitareltachado (auxiliar.VARtiporegdatosCartones.Grilla);
                            agregartachado(boliya4,auxiliar.VARtiporegdatosCartones.Grilla);
                            Premiosganados(auxiliar.VARtiporegdatosCartones,bingo ,cuagrande,cuachico,cruz,diagonal,linea);
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
                                 end
                              else
                                valorbingo:=0;


                            sumadepremiosvalor:= valorbingo +(cuagrande*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradogrande) / 10000))+
                            (cuachico*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcuadradochico) / 10000))+
                            (cruz*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pcruz) / 10000))+
                            (diagonal*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Pdiagonal) / 10000))+
                            (linea*((juego.Totalcartonesvendidos*juego.Valordelcarton*juego.Plinea) / 10000));
                            StringGrid2.Cells[0,n]:=inttostr(numerodecartonelejido);
                            StringGrid2.Cells[1,n]:=inttostr(sumadepremioscantidad);
                            StringGrid2.Cells[2,n]:=floattostr(sumadepremiosvalor) ;
                            StringGrid2.RowCount:=StringGrid2.RowCount+1 ;
                            n:=n-1;
                            end;



          //////
          if  numerodecarton <> '' then
              begin
                   if dobleEnlace.buscar(auxiliar.VARMECartones,strtoint(numerodecarton),posauxiliar,posauxiliarcontrol) then
                         begin

                           auxiliar.VARtiporegdatosCartones:= dobleEnlace.Recuperar(auxiliar.VARMECartones,posauxiliar,posauxiliarcontrol);
                           auxiliar.pasaralagriilarepeticion(boliya4,auxiliar.VARtiporegdatosCartones.Grilla,StringGrid4);
                         end;
             end;
    end;

end;

procedure TForm8.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm8.Button7Click(Sender: TObject);
begin
    timer1.Enabled:=false;
    auxiliar.formanterior:=8;
    form8.Hide;
    form6.show;
end;

procedure TForm8.Button10Click(Sender: TObject);
begin

showmessage(  'Nombre del juego :'+HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Nombredelevento+
  '       fecha: '+ DateToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Fechadelevento)+
  '       Horaactual: '+TimeToStr(now())+
  '       Pozo Acumulado: '+ FloatToStr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos *HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton) +#10+ #13+
  '       Linea:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Plinea) +
  '       Diagonal:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pdiagonal) +
  '       cruz:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcruz) +
  '       cuadrado chico:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradochico) +
  '       cuadrado grande:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(juego.Nombredelevento),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradogrande) );
end;

procedure TForm8.Button11Click(Sender: TObject);
begin
    timer1.Enabled:=false;
    auxiliar.grillaamostrar:=1;
    auxiliar.formanterior:=8;
    form8.Hide;
    form3.show;
end;

end.
