object Form9: TForm9
  Left = 455
  Top = 201
  Width = 456
  Height = 433
  Caption = 'Modificar Jugador'
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
  object Image2: TImage
    Left = 232
    Top = 152
    Width = 169
    Height = 105
  end
  object LabeledEdit3: TLabeledEdit
    Left = 32
    Top = 48
    Width = 169
    Height = 33
    EditLabel.Width = 38
    EditLabel.Height = 25
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Nick'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -20
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object LabeledEdit1: TLabeledEdit
    Left = 32
    Top = 112
    Width = 169
    Height = 33
    EditLabel.Width = 48
    EditLabel.Height = 25
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Email'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -20
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyUp = LabeledEdit1KeyUp
  end
  object LabeledEdit2: TLabeledEdit
    Left = 232
    Top = 48
    Width = 169
    Height = 33
    EditLabel.Width = 159
    EditLabel.Height = 25
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Apellido y Nombre'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -20
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyUp = LabeledEdit2KeyUp
  end
  object LabeledEdit4: TLabeledEdit
    Left = 232
    Top = 112
    Width = 169
    Height = 33
    EditLabel.Width = 179
    EditLabel.Height = 25
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Ruta de la Fotografia'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -20
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object LabeledEdit5: TLabeledEdit
    Left = 32
    Top = 176
    Width = 169
    Height = 33
    EditLabel.Width = 102
    EditLabel.Height = 25
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Contrase'#241'a'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -20
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentBiDiMode = False
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyUp = LabeledEdit5KeyUp
  end
  object Button8: TButton
    Left = 32
    Top = 224
    Width = 169
    Height = 33
    Caption = 'Guardar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button8Click
  end
  object Button1: TButton
    Left = 32
    Top = 280
    Width = 169
    Height = 33
    Caption = 'Volver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 232
    Top = 280
    Width = 169
    Height = 33
    Caption = 'Selecionar Imagen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 336
    Width = 169
    Height = 33
    Caption = 'Borrar del sistema'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button3Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
  end
end
