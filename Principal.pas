unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Auxiliar, ExtCtrls, StdCtrls, jpeg, ExtDlgs,HashConColisiones,
  LibreberiaBasicaArbol,Archivo,LibreriaArbolAVL,Unit2,DobleEnlace,pila,ColasParciales,ArbolTrinario;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Panel2: TPanel;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button5: TButton;
    Image2: TImage;
    SaveDialog1: TSaveDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Button7: TButton;
    Button9: TButton;
    Button8: TButton;
    LabeledEdit5: TLabeledEdit;
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure LabeledEdit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3, Unit4;



{$R *.dfm}

procedure TForm1.Button5Click(Sender: TObject);
var
  ultimapos:integer;
begin
//Asignar carpeta
    if savedialog1.Execute then
      begin
            edit1.Text:=ExtractFilePath(savedialog1.FileName);
            Rutamaestra:=edit1.Text;
            if not DirectoryExists(Rutamaestra+'imagenes') then
              CreateDir(Rutamaestra+'imagenes');
            HashConColisiones.Hash_inicializar(auxiliar.VARMEJuegos,Rutamaestra);
            HashConColisiones.Hash_AbrirArchivos(auxiliar.VARMEJuegos);
            Archivo.crearmeArc(auxiliar.VARMEJugadores,Rutamaestra);
            Archivo.abrirmeArc(auxiliar.VARMEJugadores);
            pila.crearpila(auxiliar.VARMEBolilleros,'BOLILLERO',auxiliar.Rutamaestra,'.dat','.con');
            pila.Abrirpila(auxiliar.VARMEBolilleros);
            pila.crearpila(auxiliar.VARMEPremiosGanadores,'GANADORES',auxiliar.Rutamaestra,'.dat','.con');
            pila.Abrirpila(auxiliar.VARMEPremiosGanadores);
            DobleEnlace.creaMe(auxiliar.VARMECartones,Rutamaestra);
            DobleEnlace.AbrirArchivos(auxiliar.VARMECartones);
            ColasParciales.crearcola(auxiliar.VARMEBolillerostirados,Rutamaestra);
            ColasParciales.abrircola(auxiliar.VARMEBolillerostirados);
            LibreberiaBasicaArbol.Crearmearbol(Auxiliar.VARMEJugadoresindiceNick,'Nick',Rutamaestra);
            LibreberiaBasicaArbol.Abrirmearbol(Auxiliar.VARMEJugadoresindiceNick);
            LibreberiaBasicaArbol.Crearmearbol(Auxiliar.VARMEJugadoresindiceID,'ID',Rutamaestra);
            LibreberiaBasicaArbol.Abrirmearbol(Auxiliar.VARMEJugadoresindiceID);
            ArbolTrinario.creaMearboltri(auxiliar.VARMEGanadores,Rutamaestra);
            ArbolTrinario.AbrirArchivosarboltri(auxiliar.VARMEGanadores);
            if ArbolVacio(Auxiliar.VARMEJugadoresindiceNick) and ArbolVacio(Auxiliar.VARMEJugadoresindiceID)  then
                      begin
                                  //archivo
                                  auxiliar.VARtiporegdatosJugadores.Nick:='ADMINISTRADOR';
                                  auxiliar.VARtiporegdatosJugadores.IDusuario:= inttostr(archivo.capuraUltimoIDArc(auxiliar.VARMEJugadores)+1);
                                  auxiliar.VARtiporegdatosJugadores.ApellidoyNombre:='';
                                  auxiliar.VARtiporegdatosJugadores.FechaAlta:=now();
                                  auxiliar.VARtiporegdatosJugadores.Email:='';
                                  auxiliar.VARtiporegdatosJugadores.Clave:='MANDRAKE';
                                  auxiliar.VARtiporegdatosJugadores.Foto:='';
                                  ultimapos:= Archivo.ultimomeArc(Auxiliar.VARMEJugadores)+1;
                                  Archivo.incertarmeArc(Auxiliar.VARMEJugadores,ultimapos,Auxiliar.VARtiporegdatosJugadores);
                                  //arbol
                                  auxiliar.VARtiporegdatosJugadoresindice.clave:=  'ADMINISTRADOR';
                                  auxiliar.VARtiporegdatosJugadoresindice.posEnDatos:= ultimapos;
                                  LibreriaArbolAVL.InsertarNodoAVL(auxiliar.VARMEJugadoresindiceNick,auxiliar.VARtiporegdatosJugadoresindice,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick));
                                  auxiliar.VARtiporegdatosJugadoresindice.clave:= inttostr(Archivo.capuraUltimoIDArc(Auxiliar.VARMEJugadores));
                                  LibreriaArbolAVL.InsertarNodoAVL(auxiliar.VARMEJugadoresindiceID,auxiliar.VARtiporegdatosJugadoresindice,LibreberiaBasicaArbol.RaizNodo(Auxiliar.VARMEJugadoresindiceID));
                      end;
      end;
      button2.Enabled:=true;
          if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (Edit1.Text <> '') then
              begin
                   Button1.Enabled:=true;
              end
          else
             begin
                  Button1.Enabled:=false;
             end;
 end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if  OpenPictureDialog1.Execute  then
    begin
          Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName)  ;
          Image2.Stretch:=true;
          LabeledEdit7.Text:= OpenPictureDialog1.FileName;
    end;
     if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
panel2.Visible:=true;
panel1.Visible:=false;
end;


procedure TForm1.Button9Click(Sender: TObject);
begin
 panel1.Visible:=true;
panel2.Visible:=false;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
panel2.Visible:=true;
panel1.Visible:=false;
end;

procedure TForm1.LabeledEdit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.LabeledEdit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.LabeledEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.LabeledEdit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.LabeledEdit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (LabeledEdit3.Text <> '') and (LabeledEdit4.Text <> '') and (LabeledEdit5.Text <> '') and (LabeledEdit6.Text <> '') and (LabeledEdit7.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
close;
exit;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  ultimapos,posincionauxiliarcito,posicion:integer;
  origen,destino:string;
begin

    posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
    if not(LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,AnsiUpperCase(LabeledEdit3.Text),posicion)) then
     begin

          //crear jugador
         //archivo
         origen:=LabeledEdit7.Text;
         Destino:=Rutamaestra+'imagenes\'+LabeledEdit3.Text+'.jpg';
         CopyFile(PChar(Origen), PChar(Destino), false);
         auxiliar.VARtiporegdatosJugadores.Nick:=AnsiUpperCase(LabeledEdit3.Text);
         auxiliar.VARtiporegdatosJugadores.IDusuario:= inttostr(Archivo.capuraUltimoIDArc(auxiliar.VARMEJugadores)+1);
         auxiliar.VARtiporegdatosJugadores.ApellidoyNombre:=AnsiUpperCase(LabeledEdit4.Text);
         auxiliar.VARtiporegdatosJugadores.FechaAlta:=now();
         auxiliar.VARtiporegdatosJugadores.Clave:=AnsiUpperCase(LabeledEdit5.Text);
         auxiliar.VARtiporegdatosJugadores.Email:=AnsiUpperCase(LabeledEdit6.Text);
         auxiliar.VARtiporegdatosJugadores.Foto:= Destino;
         auxiliar.VARtiporegdatosJugadores.Estado:='D';
         ultimapos:= Archivo.ultimomeArc(Auxiliar.VARMEJugadores)+1;
         Archivo.incertarmeArc(Auxiliar.VARMEJugadores,ultimapos,Auxiliar.VARtiporegdatosJugadores);

          //arbol
            auxiliar.VARtiporegdatosJugadoresindice.posEnDatos:= ultimapos;
             //id
            posincionauxiliarcito:= RaizNodo(auxiliar.VARMEJugadoresindiceID) ;
            auxiliar.VARtiporegdatosJugadoresindice.clave:= inttostr(Archivo.capuraUltimoIDArc(auxiliar.VARMEJugadores));
            if not (LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceID,auxiliar.VARtiporegdatosJugadoresindice.clave,posincionauxiliarcito)) then
                begin
                    InsertarNodoAVL(auxiliar.VARMEJugadoresindiceID,auxiliar.VARtiporegdatosJugadoresindice,posincionauxiliarcito);
                end;


             //nick
            posincionauxiliarcito:= RaizNodo(auxiliar.VARMEJugadoresindiceNick) ;
            auxiliar.VARtiporegdatosJugadoresindice.clave:=  AnsiUpperCase(LabeledEdit3.Text);
             if not (LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,auxiliar.VARtiporegdatosJugadoresindice.clave,posincionauxiliarcito)) then
                begin
                  InsertarNodoAVL(auxiliar.VARMEJugadoresindiceNick,auxiliar.VARtiporegdatosJugadoresindice,posincionauxiliarcito);
                end;
             showmessage('Usuario registrado con exito');
            panel1.Visible:=true;
            panel2.Visible:=false;

     end
     else
         showmessage('Ya existe un usuario con ese nick');




end;

procedure TForm1.Button1Click(Sender: TObject);
var
   posicion:integer;
begin

    //ingresar
    if (LabeledEdit1.Text <> '') and  (LabeledEdit2.Text <> '')then
      begin
         posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
         if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,AnsiUpperCase(LabeledEdit1.Text),posicion) then
          begin
              auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
              auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
              if  (VARtiporegdatosJugadores.Clave  = AnsiUpperCase(LabeledEdit2.Text)) and (VARtiporegdatosJugadores.Nick  = AnsiUpperCase(LabeledEdit1.Text)) then
                      begin
                          if (auxiliar.VARtiporegdatosJugadores.Estado = 'X') or (auxiliar.VARtiporegdatosJugadores.Estado = 'B') then
                             begin
                                  if (auxiliar.VARtiporegdatosJugadores.Estado = 'X') then
                                        showmessage('Usted a sido bloqueado');
                                   if (auxiliar.VARtiporegdatosJugadores.Estado = 'B') then
                                        showmessage('Su cuenta a sido dada de baja');
                             end
                          else
                              begin
                                usuario:=auxiliar.VARtiporegdatosJugadores;
                                form1.Hide;
                                If VARtiporegdatosJugadores.Nick = 'ADMINISTRADOR' THEN
                                       form4.Show
                                else
                                      begin
                                      auxiliar.VARtiporegdatosJugadores.Estado:= 'C';
                                      auxiliar.VARtiporegdatosJugadores.FechaHoraUltimaConexion:= now();
                                      usuario.Estado:='C';
                                      Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
                                      form2.Show;
                                      end;
                              end;
                      end
                else
                       begin
                          showmessage('Contraseña Incorrecta');
                       end;
          end
          else
          begin
                  showmessage('Nick de usuario no registrado');
          end;
      end;
end;

procedure TForm1.LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (Edit1.Text <> '') then
    begin
         Button1.Enabled:=true;


    end
 else
    begin
         Button1.Enabled:=false;

    end;
end;

procedure TForm1.LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (Edit1.Text <> '') then
    begin
         Button1.Enabled:=true;
    end
 else
    begin
         Button1.Enabled:=false;
    end;
end;

end.
