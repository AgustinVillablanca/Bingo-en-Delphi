unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Grids,auxiliar,HashConColisiones,DobleEnlace,Math,ColasParciales,
  ComCtrls,pila;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Button5: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Button13: TButton;
    GroupBox3: TGroupBox;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    Button7: TButton;
    GroupBox4: TGroupBox;
    ListBox2: TListBox;
    Button1: TButton;
    Button4: TButton;
    Button6: TButton;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    GroupBox5: TGroupBox;
    Button12: TButton;
    Button11: TButton;
    Edit9: TEdit;
    Label10: TLabel;
    Button14: TButton;
    Button15: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Button16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit3, Principal, Unit6, Unit7, Unit8, Unit10;

{$R *.dfm}


procedure TForm4.Button5Click(Sender: TObject);
var
 i:integer ;
   listado:array [0..40] of string;
begin
     if  (edit1.Text <> '') and (StrLen(PChar(Edit1.Text))<=20) then
          begin
                if  (edit2.Text <> '') and (StrLen(PChar(Edit2.Text))<=3) then
                      begin
                            if  (edit3.Text <> '') and (StrLen(PChar(Edit3.Text))<=3) then
                                   begin
                                        if  (edit4.Text <> '') and (StrLen(PChar(Edit4.Text))<=3) then
                                              begin
                                                    if  (edit5.Text <> '') and (StrLen(PChar(Edit5.Text))<=3) then
                                                          begin
                                                                if  (edit6.Text <> '') and (StrLen(PChar(Edit6.Text))<=3) then
                                                                        begin
                                                                                          if  (edit8.Text <> '') and (StrLen(PChar(Edit8.Text))<=7)then
                                                                                               begin
                                                                                                     auxiliar.VARtiporegdatosJuegos.clave:= HashConColisiones.ConvercionHash(edit1.Text);
                                                                                                     auxiliar.VARtiporegdatosJuegos.Nombredelevento:=edit1.Text;
                                                                                                     auxiliar.VARtiporegdatosJuegos.Fechadelevento:= strtodatetime(DateToStr(DateTimePicker1.DateTime)+TimeToStr(DateTimePicker2.DateTime));
                                                                                                    auxiliar.VARtiporegdatosJuegos.Estado:=N;
                                                                                                    auxiliar.VARtiporegdatosJuegos.Valordelcarton:= strtoint(edit8.text);
                                                                                                    auxiliar.VARtiporegdatosJuegos.Totalcartonesvendidos:=0;
                                                                                                    auxiliar.VARtiporegdatosJuegos.Plinea:=strtoint(edit2.text);
                                                                                                    auxiliar.VARtiporegdatosJuegos.Pdiagonal:= strtoint(edit3.text);
                                                                                                    auxiliar.VARtiporegdatosJuegos.Pcruz:=  strtoint(edit4.text);
                                                                                                    auxiliar.VARtiporegdatosJuegos.Pcuadradochico:=  strtoint(edit5.text);
                                                                                                    auxiliar.VARtiporegdatosJuegos.Pcuadradogrande:= strtoint(edit6.text);

                                                                                                    if not (HashConColisiones.Hash_EntradaOcupada(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos)) then
                                                                                                         begin
                                                                                                                  if not (HashConColisiones.Hash_EntradaOcupada(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos)) then
                                                                                                                      begin

                                                                                                                         HashConColisiones.Hash_Insertar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.text),auxiliar.VARMEJuegos),auxiliar.VARtiporegdatosJuegos,auxiliar.VARMEJuegos);
                                                                                                                         DobleEnlace.nuevocontrol(auxiliar.VARMECartones,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego);
                                                                                                                         ColasParciales.incertarcabecera(auxiliar.VARMEBolillerostirados,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego);
                                                                                                                         pila.incertarcabecera(auxiliar.VARMEBolilleros,HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos).ElIddelJuego);
                                                                                                                         showmessage('El juego se creo con exito');

                                                                                                                          listbox1.Clear;
                                                                                                                          if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
                                                                                                                              begin
                                                                                                                                HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
                                                                                                                                  i:=1;
                                                                                                                                     while i <> Length (listado) do
                                                                                                                                          begin
                                                                                                                                               if listado[i] <> '' then
                                                                                                                                                 begin
                                                                                                                                                        if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                                                                                                                                                           if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado <> F then
                                                                                                                                                                     ListBox1.Items.Add(listado[i]);
                                                                                                                                                end;
                                                                                                                                              i:=i+1;
                                                                                                                                          end;
                                                                                                                              end;
                                                                                                                      end
                                                                                                                      else
                                                                                                                      showmessage('hay un bingo con este nombre que  fue eliminado ');
                                                                                                         end
                                                                                                    else
                                                                                                        showmessage('hay un bingo con este nombre ,por fabor cambie el nombre');
                                                                                          end
                                                                                          else
                                                                                              begin
                                                                                                   showmessage('Falta el costo del carton o este representa a mas de 999999');
                                                                                              end ;


                                                                        end
                                                                 else
                                                                        begin
                                                                              showmessage('Falta el porsentaje para Cuadroda grande o este es superior al 999');
                                                                        end ;
                                                          end
                                                    else
                                                          begin
                                                                showmessage('Falta el porsentaje para Cuadrado chico o este es superior al 999');
                                                          end ;
                                              end
                                        else
                                              begin
                                                    showmessage('Falta el porsentaje para cruz o este es superior al 999');
                                              end ;
                                    end
                            else
                                   begin
                                        showmessage('Falta el porsentaje para diagonal o este es superior al 999');
                                    end ;
                      end
                else
                      begin
                          showmessage('Falta el porsentaje para linea o este es superior al 999');
                      end ;
          end
      else
          begin
              showmessage('Falta el nombre del juego o este tiene mas de 20 caracteres');
          end ;

end;

procedure TForm4.Button4Click(Sender: TObject);
var
 i:integer ;
   listado:array [0..40] of string;
begin
  listbox2.Clear;
  if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
      begin
        HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
          i:=1;
             while i <> Length (listado) do
                  begin
                       if listado[i] <> '' then
                         begin
                              if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                              if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = F  then
                                ListBox2.Items.Add(listado[i]);
                         end;
                      i:=i+1;
                  end;
      end;
end;

procedure TForm4.Button3Click(Sender: TObject);

begin
      if ListBox1.ItemIndex <> -1 then
          begin
                juego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox1.Items.Strings[ListBox1.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                form7.show;
                form4.hide;
          end
      else
          begin
              showmessage('ha habido un error');
          end;



end;

procedure TForm4.Button7Click(Sender: TObject);
begin
    form4.Hide;
      form1.Show;
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  form4.Hide;
  form10.show;
end;


procedure TForm4.Button1Click(Sender: TObject);
var
 i:integer ;
   listado:array [0..40] of string;
begin
listbox1.Clear;
  if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
      begin
        HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
          i:=1;
             while i <> Length (listado) do
                  begin
                       if listado[i] <> '' then
                         begin
                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                              if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado <> F then
                                ListBox1.Items.Add(listado[i]);
                         end;


                      i:=i+1;
                  end;
      end;




end;


procedure TForm4.Button6Click(Sender: TObject);
begin
 if ListBox2.ItemIndex <> -1 then
          begin
                juego:=HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(ListBox2.Items.Strings[ListBox2.ItemIndex]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                formanterior:=4;
                form4.hide;
                form8.show;
          end
      else
          begin
              showmessage('ha habido un error');
          end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
      if  (edit1.Text <> '') and (StrLen(PChar(Edit1.Text))<=20) then
          begin
                if  (edit2.Text <> '') and (StrLen(PChar(Edit2.Text))<=3) then
                      begin
                            if  (edit3.Text <> '') and (StrLen(PChar(Edit3.Text))<=3) then
                                   begin
                                        if  (edit4.Text <> '') and (StrLen(PChar(Edit4.Text))<=3) then
                                              begin
                                                    if  (edit5.Text <> '') and (StrLen(PChar(Edit5.Text))<=3) then
                                                          begin
                                                                if  (edit6.Text <> '') and (StrLen(PChar(Edit6.Text))<=3) then
                                                                        begin
                                                                                          if  (edit8.Text <> '') and (StrLen(PChar(Edit8.Text))<=7)then
                                                                                               begin
                                                                                                       if HashConColisiones.Hash_EntradaOcupada(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos) then
                                                                                                       begin

                                                                                                                  auxiliar.VARtiporegdatosJuegos:= HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Fechadelevento:= strtodatetime(DateToStr(DateTimePicker1.DateTime)+TimeToStr(DateTimePicker2.DateTime));
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Valordelcarton:= strtoint(edit8.text);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Plinea:=strtoint(edit2.text);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Pdiagonal:= strtoint(edit3.text);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Pcruz:=  strtoint(edit4.text);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Pcuadradochico:=  strtoint(edit5.text);
                                                                                                                  auxiliar.VARtiporegdatosJuegos.Pcuadradogrande:= strtoint(edit6.text);
                                                                                                                  HashConColisiones.Hash_Modificar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARtiporegdatosJuegos,auxiliar.VARMEJuegos);
                                                                                                                  showmessage('El juego se creo con exito');
                                                                                                       end
                                                                                                       else
                                                                                                            showmessage('Nombre de ese juego no pertenece a ninguno existente');
                                                                                                   end
                                                                                          else
                                                                                              begin
                                                                                                   showmessage('Falta el costo del carton o este representa a mas de 999999');
                                                                                              end ;


                                                                        end
                                                                 else
                                                                        begin
                                                                              showmessage('Falta el porsentaje para Cuadroda grande o este es superior al 999');
                                                                        end ;
                                                          end
                                                    else
                                                          begin
                                                                showmessage('Falta el porsentaje para Cuadrado chico o este es superior al 999');
                                                          end ;
                                              end
                                        else
                                              begin
                                                    showmessage('Falta el porsentaje para cruz o este es superior al 999');
                                              end ;
                                    end
                            else
                                   begin
                                        showmessage('Falta el porsentaje para diagonal o este es superior al 999');
                                    end ;
                      end
                else
                      begin
                          showmessage('Falta el porsentaje para linea o este es superior al 999');
                      end ;
          end
      else
          begin
              showmessage('Falta el nombre del juego o este tiene mas de 20 caracteres');
          end ;

end;
procedure TForm4.Button13Click(Sender: TObject);

begin






 if HashConColisiones.Hash_EntradaOcupada(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos) then
    begin
          if  HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Totalcartonesvendidos = 0 then
          begin
                 if   HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = N then
                 begin
                        HashConColisiones.Hash_Eliminar(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(edit1.Text),auxiliar.VARMEJuegos),auxiliar.VARMEJuegos);
                        showmessage('El juego se elimino');
                        listbox1.Clear;
                        listbox2.Clear;
                 end
                 else
                    showmessage('este juego no se puede eliminar ,porque a pasado la face de compra de cartones');
          end
          else
              showmessage('este juego no se puede eliminar porque tiene cartones asignados')
    end
     else
         showmessage('Nombre de ese juego no pertenece a ninguno existente');








end;

procedure TForm4.FormActivate(Sender: TObject);
var
   i:integer ;
 listado:array [0..40] of string;
begin
     listbox1.Clear;
     listbox2.Clear;
     edit1.Clear;
     edit2.Clear;
     edit3.Clear;
     edit4.Clear;
     edit5.Clear;
     edit6.Clear;
     edit8.Clear;


     listbox1.Clear;
     listbox2.Clear;
  if not (HashConColisiones.Hash_Vacio(auxiliar.VARMEJuegos))  then
      begin
        HashConColisiones.Hash_listadodeclavesactivas(auxiliar.VARMEJuegos,listado);
          i:=1;
             while i <> Length (listado) do
                  begin
                       if listado[i] <> '' then
                         begin
                                if not(HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).borrados) then
                              if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado <> F then
                                ListBox1.Items.Add(listado[i]);
                              if HashConColisiones.Hash_Obtenerinformacion(HashConColisiones.Hash_Buscar(HashConColisiones.ConvercionHash(listado[i]),auxiliar.VARMEJuegos), auxiliar.VARMEJuegos).Estado = F  then
                                ListBox2.Items.Add(listado[i]);
                         end;


                      i:=i+1;
                  end;
      end;








end;

procedure TForm4.Edit2KeyPress(Sender: TObject; var Key: Char);
        begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9']) then
 key:=#0;
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
auxiliar.formanterior:=4;
auxiliar.grillaamostrar:=4;
form4.Hide;
form3.Show;
end;

procedure TForm4.Button10Click(Sender: TObject);
begin
auxiliar.formanterior:=4;
auxiliar.grillaamostrar:=5;
form4.Hide;
form3.Show;
end;

procedure TForm4.Button11Click(Sender: TObject);
begin
auxiliar.formanterior:=4;
auxiliar.grillaamostrar:=6;
auxiliar.NCantidades:=strtoint(edit9.Text);
form4.Hide;
form3.Show;
end;

procedure TForm4.Button12Click(Sender: TObject);
begin
auxiliar.formanterior:=4;
auxiliar.grillaamostrar:=7;
auxiliar.NCantidades:=strtoint(edit9.Text);
form4.Hide;
form3.Show;
end;

procedure TForm4.Button15Click(Sender: TObject);
begin

      if (edit9.Text = '1') or (edit9.Text = '2') or (edit9.Text = '3') or (edit9.Text = '4') or (edit9.Text = '5') or (edit9.Text = '6') then
           begin
              auxiliar.formanterior:=4;
              auxiliar.grillaamostrar:=8;
              auxiliar.NCantidades:=strtoint(edit9.Text);
                form4.Hide;
                form3.Show;
              end
        else
              begin
              showmessage('los valores validos son del "1-6"');
              end;
end;
procedure TForm4.Button14Click(Sender: TObject);
begin
auxiliar.formanterior:=4;
auxiliar.grillaamostrar:=9;
form4.Hide;
form3.Show;
end;

procedure TForm4.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#8,'0'..'9']) then
      key:=#0;
end;

procedure TForm4.Button16Click(Sender: TObject);
begin
  if (not(ColasParciales.colavacia(auxiliar.VARMEBolillerostirados,strtoint(edit9.Text)))) then
      begin
      end
end;

end.
