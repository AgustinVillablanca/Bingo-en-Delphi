object Form10: TForm10
  Left = 343
  Top = 134
  Width = 432
  Height = 476
  Caption = 'Herrarmienta del Metodo'
  Color = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 40
    Width = 401
    Height = 385
    ColCount = 6
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Volver'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 8
    Width = 321
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnSelect = ComboBox1Select
    Items.Strings = (
      'Dispersi'#243'n en hash'
      'Arbol Binario Indice Nick Preorder'
      'Arbol Binario Indice Nick Postorden'
      'Arbol Binario Indice Nick Inorden'
      'Arbol Binario Indice ID Preorder'
      'Arbol Binario Indice ID Postorden'
      'Arbol Binario Indice ID Inorden'
      'Arbol Trinario Preorder'
      'Arbol Trinario Postorden'
      'Arbol Trinario Inorden'
      '')
  end
end
