object Form5: TForm5
  Left = 393
  Top = 64
  Width = 663
  Height = 487
  Caption = 'Form5'
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
  object GroupBox3: TGroupBox
    Left = 16
    Top = 112
    Width = 209
    Height = 321
    Caption = 'Listado de juegos'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 0
    object ListBox1: TListBox
      Left = 16
      Top = 24
      Width = 177
      Height = 281
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 232
    Top = 112
    Width = 225
    Height = 321
    Caption = 'Compra de un carton'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 8
      Top = 96
      Width = 209
      Height = 217
      ColCount = 6
      DefaultColWidth = 32
      DefaultRowHeight = 32
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
    object Button1: TButton
      Left = 16
      Top = 24
      Width = 193
      Height = 25
      Caption = 'Generar carton'
      Enabled = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 56
      Width = 193
      Height = 25
      Caption = 'Comprar este carton'
      Enabled = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 16
    Top = 40
    Width = 609
    Height = 65
    TabOrder = 2
  end
  object Button3: TButton
    Left = 464
    Top = 8
    Width = 161
    Height = 25
    Caption = 'Volver a la Ficha'
    TabOrder = 3
    OnClick = Button3Click
  end
  object GroupBox1: TGroupBox
    Left = 464
    Top = 112
    Width = 161
    Height = 105
    Caption = 'Comprar de a varios'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 4
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 137
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object Button4: TButton
      Left = 8
      Top = 64
      Width = 137
      Height = 25
      Caption = 'Comprar multiples cartones'
      Enabled = False
      TabOrder = 1
      OnClick = Button4Click
    end
  end
end
