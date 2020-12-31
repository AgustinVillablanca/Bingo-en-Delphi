unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,HashConColisiones,Auxiliar,math,DobleEnlace;

type
  TForm5 = class(TForm)
    GroupBox3: TGroupBox;
    ListBox1: TListBox;
    GroupBox4: TGroupBox;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
 posauxiliarcontrol:integer;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm5.FormActivate(Sender: TObject);
var
 i:integer ;
   listado:array [0..40] of string;
begin

  memo1.Clear;
  edit1.Clear;
  auxiliar.limpiargrilla(StringGrid1);
  ListBox1.Clear;
  if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
      begin
        HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
          i:=1;
             while i <> Length (listado) do
                  begin
                       if listado[i] <> '' then
                            begin
                                  if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = N then
                                      ListBox1.Items.Add(listado[i]);
                            end;

                      i:=i+1;
                  end;
      end;
       Button1.Enabled:=false;
       Button2.Enabled:=false;
       Button4.Enabled:=false;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
x,y,v,b,valor:integer;
 lista:array[0..4] of integer;

begin
   StringGrid1.Cells[0,0]:='B';
   StringGrid1.Cells[1,0]:='I';
   StringGrid1.Cells[2,0]:='N';
   StringGrid1.Cells[3,0]:='G';
   StringGrid1.Cells[4,0]:='O';
   v:=1;
   b:=1;
   Auxiliar.limpiarlista(lista);
   repeat

        for x:=0 to 4  do
              begin
                    for y:=0 to 4 do
                           begin
                                  if x = 0 then
                                      begin
                                         v:=1;
                                         b:=15;
                                      end;
                                      if x = 1 then
                                      begin
                                         v:=16;
                                         b:=30;
                                      end;
                                      if x = 2 then
                                      begin
                                         v:=31;
                                         b:=45;
                                      end;
                                      if x = 3 then
                                      begin
                                         v:=46;
                                         b:=60;
                                      end;
                                      if x = 4 then
                                      begin
                                         v:=61;
                                         b:=75;
                                      end;
                                      repeat
                                          valor := RandomRange(v,b);
                                      until not(Auxiliar.buscarenrepetidos(lista,valor ));




                                     

                                      if (x=2) and (y=2) then
                                      begin
                                          auxiliar.VARtiporegdatosCartones.Grilla[x,y].Numero:=0;
                                          auxiliar.VARtiporegdatosCartones.Grilla[x,y].Tachado:=true;
                                      end
                                      else
                                      begin
                                              Auxiliar.incertarenlista(lista,valor);
                                              if (x<>-1) or (y<>-1) then begin
                                              StringGrid1.Cells[x,y+1]:=inttostr(valor);
                                              auxiliar.VARtiporegdatosCartones.Grilla[x,y].Numero:=valor;
                                              auxiliar.VARtiporegdatosCartones.Grilla[x,y].Tachado:=false;
                                              end;
                                      end;

                            end;
                      Auxiliar.limpiarlista(lista);
              end;

   until DobleEnlace.identicos(auxiliar.VARMECartones,auxiliar.VARtiporegdatosCartones.Grilla,posauxiliarcontrol) ;
  Button2.Enabled:=true;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin

      if ListBox1.ItemIndex <> -1 then
          begin
                  auxiliar.VARtiporegdatosCartones.IdCarton:=DobleEnlace.DevolverUltimoID(auxiliar.VARMECartones,posauxiliarcontrol);
                  auxiliar.VARtiporegdatosCartones.Iddeljugador:=  strtoint(usuario.IDusuario);
                  DobleEnlace.Insertar(auxiliar.VARMECartones,DobleEnlace.Ultimopos(auxiliar.VARMECartones,posauxiliarcontrol),auxiliar.VARtiporegdatosCartones,posauxiliarcontrol);
                  auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos) ;
                  auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos:=auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos+1;

                  HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(auxiliar.VARtiporegdatosJuegos.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARtiporegdatosJuegos,auxiliar.VARMEJuegos);
                  auxiliar.limpiargrilla(StringGrid1);


                 memo1.clear;
                 if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox1.Items[ListBox1.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                    begin
                             memo1.Text:=
                             '       Pozo Acumulado: ' +FloatToStr (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos * HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton) +
                             '       Costo del carton :  '+floattostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton)+ #13 + #10+
                             '       Linea:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Plinea)+
                             '       Diagonal:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pdiagonal)+
                             '       cruz:  '+ inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcruz)+        #13 + #10+
                             '       cuadrado chico:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradochico)+
                             '       cuadrado grande:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradogrande)+#13 + #10+
                             '       Cantidad de cartones vendidos:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos);
                            Button1.Enabled:=true;
                    end;
         end
        else
              begin
                  showmessage('ha habido un error');
              end;


   Button2.Enabled:=false;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
form5.Hide;
form2.show;
end;

procedure TForm5.ListBox1Click(Sender: TObject);
  var
    cantidadexitente,cantidadlibre:integer;
begin
memo1.clear;

if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox1.Items[ListBox1.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
    begin
    memo1.Text:=
               '       Pozo Acumulado: ' +FloatToStr (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos * HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton) +
               '       Costo del carton :  '+floattostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton)+ #13 + #10+
               '       Linea:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Plinea)+
               '       Diagonal:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pdiagonal)+
               '       cruz:  '+ inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcruz)+        #13 + #10+
               '       cuadrado chico:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradochico)+
               '       cuadrado grande:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradogrande)+#13 + #10+
               '       Cantidad de cartones vendidos:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos);
      Button1.Enabled:=true;
    end;




       if ListBox1.ItemIndex <> -1 then
          begin
                if (edit1.Text <> '') and  (edit1.Text <> '0') then
                          begin
                            cantidadexitente:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos;
                            cantidadlibre:=100-cantidadexitente;
                            if strtoint(edit1.Text) <= cantidadlibre then
                                button4.Enabled:=true;
                          end
                      else
                           button4.Enabled:=false;
          end
        else
             button4.Enabled:=false;




end;

procedure TForm5.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    cantidadexitente,cantidadlibre:integer;
begin

   if ListBox1.ItemIndex <> -1 then
          begin
                if (edit1.Text <> '') and  (edit1.Text <> '0') then
                          begin
                            cantidadexitente:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos;
                            cantidadlibre:=100-cantidadexitente;
                            if strtoint(edit1.Text) <= cantidadlibre then
                                button4.Enabled:=true;
                          end
                      else
                           button4.Enabled:=false;
          end
   else
             button4.Enabled:=false;
end;

procedure TForm5.Button4Click(Sender: TObject);
  var
     cantidaddecartones,cantidadexitente,cantidadlibre,v,b,x,y,valor:integer;
     lista:array[0..4] of integer;
     presio,coste:real;

begin
    if ListBox1.ItemIndex <> -1 then
     begin
         cantidaddecartones:= strtoint(edit1.Text);
         cantidadexitente:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos;
         cantidadlibre:=100-cantidadexitente;
         presio:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton;
         coste:= cantidaddecartones*presio;
         if cantidaddecartones <= cantidadlibre then
             begin

               if MessageDlg('¿Esta por comprar  '+inttostr(cantidaddecartones)+' cartones por un presio de '+floattostr(coste)+' desea continuar?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
                begin
                    while cantidaddecartones <> 0 do
                       begin
                           v:=1;
                           b:=1;
                           Auxiliar.limpiarlista(lista);
                           repeat

                                for x:=0 to 4  do
                                    begin
                                            for y:=0 to 4 do
                                                   begin
                                                          if x = 0 then
                                                              begin
                                                                 v:=1;
                                                                 b:=15;
                                                              end;
                                                              if x = 1 then
                                                              begin
                                                                 v:=16;
                                                                 b:=30;
                                                              end;
                                                              if x = 2 then
                                                              begin
                                                                 v:=31;
                                                                 b:=45;
                                                              end;
                                                              if x = 3 then
                                                              begin
                                                                 v:=46;
                                                                 b:=60;
                                                              end;
                                                              if x = 4 then
                                                              begin
                                                                 v:=61;
                                                                 b:=75;
                                                              end;
                                                              repeat
                                                                  valor := RandomRange(v,b);
                                                              until not(Auxiliar.buscarenrepetidos(lista,valor ));

                                                              if (x=2) and (y=2) then
                                                              begin
                                                                  auxiliar.VARtiporegdatosCartones.Grilla[x,y].Numero:=0;
                                                                  auxiliar.VARtiporegdatosCartones.Grilla[x,y].Tachado:=true;
                                                              end
                                                              else
                                                              begin
                                                                       Auxiliar.incertarenlista(lista,valor);
                                                                      if (x<>-1) or (y<>-1) then
                                                                       begin
                                                                           auxiliar.VARtiporegdatosCartones.Grilla[x,y].Numero:=valor;
                                                                           auxiliar.VARtiporegdatosCartones.Grilla[x,y].Tachado:=false;
                                                                      end;
                                                              end;

                                               end;
                                         Auxiliar.limpiarlista(lista);
                                     end;

                             until DobleEnlace.identicos(auxiliar.VARMECartones,auxiliar.VARtiporegdatosCartones.Grilla,posauxiliarcontrol) ;
                              auxiliar.VARtiporegdatosCartones.IdCarton:=DobleEnlace.DevolverUltimoID(auxiliar.VARMECartones,posauxiliarcontrol);
                              auxiliar.VARtiporegdatosCartones.Iddeljugador:=  strtoint(usuario.IDusuario);
                              DobleEnlace.Insertar(auxiliar.VARMECartones,DobleEnlace.Ultimopos(auxiliar.VARMECartones,posauxiliarcontrol),auxiliar.VARtiporegdatosCartones,posauxiliarcontrol);
                              auxiliar.VARtiporegdatosJuegos:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos) ;
                              auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos:=auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos+1;
                              HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(auxiliar.VARtiporegdatosJuegos.Nombredelevento),auxiliar.VARMEJuegos),auxiliar.VARtiporegdatosJuegos,auxiliar.VARMEJuegos);
                              cantidaddecartones:=cantidaddecartones-1;
                    end;

                    memo1.clear;
                   if dobleenlace.buscarcontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listbox1.Items[ListBox1.ItemIndex]),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego,posauxiliarcontrol) then
                    begin
                           memo1.Text:=
                                '       Pozo Acumulado: ' +FloatToStr (HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos * HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton) +
                                '       Costo del carton :  '+floattostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Valordelcarton)+   #13 + #10+
                                '       Linea:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Plinea)+
                                '       Diagonal:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pdiagonal)+
                                '       cruz:  '+ inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcruz)+              #13 + #10+
                                '       cuadrado chico:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradochico)+
                                '       cuadrado grande:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Pcuadradogrande)+#13 + #10+
                                '       Cantidad de cartones vendidos:  '+inttostr(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos);
                            Button1.Enabled:=true;
                    end;

        end
        else
          showmessage('el numero ingresado supera el tope de cartones vendibles');
      end;



   end;
end;

procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9',DecimalSeparator]) then
 key:=#0;
end;



end.
