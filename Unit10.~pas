unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls,auxiliar,LibreberiaBasicaArbol,ArbolTrinario,
  Buttons;

type
  TForm10 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit4;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  form10.Hide;
  form4.show;
end;

procedure TForm10.ComboBox1Select(Sender: TObject);
begin
    auxiliar.limpiargrilla(StringGrid1);
      case  ComboBox1.ItemIndex of
      0:begin  StringGrid1.RowCount:=1;
               StringGrid1.ColCount:=6;
               StringGrid1.Cells[0,0]:='Pos fisica';
               StringGrid1.Cells[1,0]:='Llaves';
               StringGrid1.Cells[2,0]:='Clave hash';
               StringGrid1.Cells[3,0]:='Indice';
               StringGrid1.Cells[4,0]:='Estado';
               StringGrid1.Cells[5,0]:='Borrado';
               auxiliar.dispersiondehash(auxiliar.VARMEJuegos,StringGrid1);
        end;
      1:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';

                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),1);
        end;
      2:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';
                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),2);
        end;
      3:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';
                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceNick,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceNick),3);
        end;
      4:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';

                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceID,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),1);
        end;
      5:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';
                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceID,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),2);
        end;
      6:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=6;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Pos en datos';
                StringGrid1.Cells[2,0]:='Padre';
                StringGrid1.Cells[3,0]:='Izquierda';
                StringGrid1.Cells[4,0]:='Derecha';
                StringGrid1.Cells[5,0]:='Nivel';
                auxiliar.dispersionarbolbinario(auxiliar.VARMEJugadoresindiceID,StringGrid1,LibreberiaBasicaArbol.RaizNodo(auxiliar.VARMEJugadoresindiceID),3);
        end;
      7:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=5;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Padre';
                StringGrid1.Cells[2,0]:='Izquierda';
                StringGrid1.Cells[3,0]:='Derecha';
                StringGrid1.Cells[4,0]:='Medio';
                auxiliar.dispersionarboltrinario(auxiliar.VARMEGanadores,StringGrid1,ArbolTrinario.obtenerraizarboltri(auxiliar.VARMEGanadores),1);
        end;
      8:begin
                 StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=5;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Padre';
                StringGrid1.Cells[2,0]:='Izquierda';
                StringGrid1.Cells[3,0]:='Derecha';
                StringGrid1.Cells[4,0]:='Medio';
                auxiliar.dispersionarboltrinario(auxiliar.VARMEGanadores,StringGrid1,ArbolTrinario.obtenerraizarboltri(auxiliar.VARMEGanadores),2);
        end;
      9:begin
                StringGrid1.RowCount:=1;
                StringGrid1.ColCount:=5;
                StringGrid1.Cells[0,0]:='Clave';
                StringGrid1.Cells[1,0]:='Padre';
                StringGrid1.Cells[2,0]:='Izquierda';
                StringGrid1.Cells[3,0]:='Derecha';
                StringGrid1.Cells[4,0]:='Medio';
                auxiliar.dispersionarboltrinario(auxiliar.VARMEGanadores,StringGrid1,ArbolTrinario.obtenerraizarboltri(auxiliar.VARMEGanadores),3);
        end;
      end;


end;

end.
