object Form7: TForm7
  Left = 268
  Top = 193
  Width = 778
  Height = 502
  Caption = 'Menu de Juego'
  Color = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 569
    Height = 65
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 576
    Top = 8
    Width = 169
    Height = 25
    Caption = 'Volver a la pantalla anterior'
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid3: TStringGrid
    Left = 8
    Top = 288
    Width = 737
    Height = 161
    ColCount = 20
    DefaultColWidth = 35
    DefaultRowHeight = 35
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    TabOrder = 2
  end
  object Button2: TButton
    Left = 112
    Top = 256
    Width = 113
    Height = 25
    Caption = '[Mezclar Bolillas]'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 256
    Width = 105
    Height = 25
    Caption = '[Sacar una bolilla]'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 608
    Top = 256
    Width = 137
    Height = 25
    Caption = '[Ver Bolillas Restantes]'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 576
    Top = 40
    Width = 169
    Height = 25
    Caption = ' [Ficha de un Jugador]'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 576
    Top = 72
    Width = 169
    Height = 25
    Caption = '[Listado de Jugadores]'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 472
    Top = 256
    Width = 129
    Height = 25
    Caption = '[Ver Bolillas sacardas ]'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 576
    Top = 192
    Width = 169
    Height = 25
    Caption = 'Guardar Resultado'
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 344
    Top = 256
    Width = 121
    Height = 25
    Caption = '[Sacar todas las bolilla]'
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 576
    Top = 160
    Width = 169
    Height = 25
    Caption = 'Jugar el juego'
    TabOrder = 11
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 8
    Top = 256
    Width = 97
    Height = 25
    Caption = '[Meterlas bolillas]'
    TabOrder = 12
    OnClick = Button11Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 72
    Width = 233
    Height = 177
    Caption = 'Lista de jugadores que compraron cartones'
    TabOrder = 13
    object StringGrid1: TStringGrid
      Left = 8
      Top = 16
      Width = 217
      Height = 153
      ColCount = 3
      FixedCols = 0
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 248
    Top = 72
    Width = 321
    Height = 177
    Caption = 'Premio sacados hasta el momento por los jugadores'
    TabOrder = 14
    object StringGrid2: TStringGrid
      Left = 8
      Top = 16
      Width = 305
      Height = 153
      ColCount = 4
      FixedCols = 0
      TabOrder = 0
    end
  end
end
