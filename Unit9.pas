unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs,Auxiliar,LibreberiaBasicaArbol,Archivo;

type
  TForm9 = class(TForm)
    LabeledEdit3: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Button8: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LabeledEdit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit2, Principal;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
form9.Hide;
form2.show;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
 if  OpenPictureDialog1.Execute  then
    begin
          Image2.Picture.LoadFromFile(OpenPictureDialog1.FileName)  ;
          Image2.Stretch:=true;
          LabeledEdit4.Text:= OpenPictureDialog1.FileName;
    end;
     if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (LabeledEdit3.Text <> '') and (LabeledEdit5.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm9.LabeledEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (LabeledEdit3.Text <> '') and  (LabeledEdit5.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm9.LabeledEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (LabeledEdit3.Text <> '')  and (LabeledEdit5.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm9.LabeledEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (LabeledEdit1.Text <> '') and (LabeledEdit2.Text <> '') and (LabeledEdit3.Text <> '')  and (LabeledEdit5.Text <> '') then
    begin
         Button8.Enabled:=true;

    end
 else
    begin
         Button8.Enabled:=false;
    end;
end;

procedure TForm9.Button3Click(Sender: TObject);
var
posicion:integer;
begin



     if MessageDlg('�Esta seguro de darse de baja?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
          posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
         if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,LabeledEdit3.Text,posicion) then
          begin
              auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
              auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
              auxiliar.VARtiporegdatosJugadores.Estado:= 'B' ;
              Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
              showmessage('usted a sido eliminado') ;
              form9.Hide;
              form1.Show;
          end;
      end;




end;

procedure TForm9.FormActivate(Sender: TObject);
begin
     LabeledEdit1.Text := usuario.Email;
     LabeledEdit2.Text := usuario.ApellidoyNombre;
     LabeledEdit3.Text := usuario.Nick;
     LabeledEdit4.Text := usuario.Foto;
     Image2.Picture.LoadFromFile(usuario.Foto);
     Image2.Stretch:=true;
     LabeledEdit5.Text := usuario.Clave;
     
end;

procedure TForm9.Button8Click(Sender: TObject);
var
    posicion:integer;
    origen,Destino:string;
begin
   if MessageDlg('�Esta por modificar su informacion , confirma?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
          posicion:=LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick);
          if LibreberiaBasicaArbol.BuscarNodo(auxiliar.VARMEJugadoresindiceNick,LabeledEdit3.Text,posicion) then
          begin
              auxiliar.VARtiporegdatosJugadoresindice:=  LibreberiaBasicaArbol.CapturarNodo(auxiliar.VARMEJugadoresindiceNick,posicion);
              auxiliar.VARtiporegdatosJugadores:=capturarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos);
              origen:=LabeledEdit4.Text;
              Destino:=Rutamaestra+'imagenes\'+LabeledEdit3.Text+'.jpg';
              if VARtiporegdatosJugadores.Foto <> Destino then
              deletefile(Destino);
              CopyFile(PChar(Origen), PChar(Destino), false);



              auxiliar.VARtiporegdatosJugadores.Clave:=AnsiUpperCase(LabeledEdit5.Text);
              auxiliar.VARtiporegdatosJugadores.ApellidoyNombre:=AnsiUpperCase(LabeledEdit2.Text);
              auxiliar.VARtiporegdatosJugadores.Foto:=Destino;
              auxiliar.VARtiporegdatosJugadores.Email:=AnsiUpperCase(LabeledEdit1.Text);
              Archivo.modificarmeArc(auxiliar.VARMEJugadores,auxiliar.VARtiporegdatosJugadoresindice.posEnDatos,auxiliar.VARtiporegdatosJugadores);
              showmessage('su cuenta se modifico') ;
              form9.Hide;
              form2.show;

          end;
      end;
end;

end.
