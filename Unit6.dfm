object Form6: TForm6
  Left = 339
  Top = 142
  Width = 835
  Height = 500
  Caption = 'Detalle del jugador'
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
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 194
    Height = 25
    Caption = 'Seleccion de jugador :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 56
    Width = 793
    Height = 137
    Caption = 'Ficha del jugador'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 0
    object Image1: TImage
      Left = 672
      Top = 16
      Width = 105
      Height = 105
    end
    object Memo1: TMemo
      Left = 16
      Top = 16
      Width = 649
      Height = 105
      TabOrder = 0
    end
  end
  object ComboBox1: TComboBox
    Left = 224
    Top = 24
    Width = 297
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
    OnSelect = ComboBox1Select
  end
  object Button3: TButton
    Left = 632
    Top = 24
    Width = 161
    Height = 25
    Caption = 'Volver a la pantalla anterior'
    TabOrder = 2
    OnClick = Button3Click
  end
  object GroupBox6: TGroupBox
    Left = 8
    Top = 192
    Width = 305
    Height = 257
    Caption = 'Listado de Cartones'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 3
    object StringGrid2: TStringGrid
      Left = 8
      Top = 16
      Width = 281
      Height = 233
      ColCount = 4
      DefaultColWidth = 65
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      OnSelectCell = StringGrid2SelectCell
    end
  end
  object GroupBox2: TGroupBox
    Left = 336
    Top = 192
    Width = 225
    Height = 257
    Caption = 'Vista del carton apuntado'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 4
    object StringGrid1: TStringGrid
      Left = 8
      Top = 16
      Width = 209
      Height = 233
      DefaultColWidth = 40
      DefaultRowHeight = 35
      FixedColor = clRed
      FixedCols = 0
      RowCount = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLineWidth = 0
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 576
    Top = 192
    Width = 225
    Height = 257
    Caption = 'Detalle de los premios'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 5
    object StringGrid3: TStringGrid
      Left = 8
      Top = 16
      Width = 209
      Height = 233
      ColCount = 2
      DefaultColWidth = 100
      FixedCols = 0
      FixedRows = 0
      TabOrder = 0
    end
  end
end
