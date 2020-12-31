object Form1: TForm1
  Left = 355
  Top = 164
  Width = 667
  Height = 402
  Caption = 'Inicio de sesi'#243'n'
  Color = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 289
    Color = clSkyBlue
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 152
      Width = 193
      Height = 33
      Caption = 'Ingresar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 200
      Width = 193
      Height = 33
      Caption = 'Nuevo Jugador'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 248
      Width = 193
      Height = 33
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 32
      Width = 193
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyUp = LabeledEdit1KeyUp
    end
    object LabeledEdit2: TLabeledEdit
      Left = 16
      Top = 96
      Width = 193
      Height = 33
      EditLabel.Width = 102
      EditLabel.Height = 25
      EditLabel.Caption = 'Contrase'#241'a'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -20
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnKeyUp = LabeledEdit2KeyUp
    end
  end
  object Panel2: TPanel
    Left = 232
    Top = 0
    Width = 417
    Height = 289
    Color = clSkyBlue
    TabOrder = 1
    Visible = False
    object Image2: TImage
      Left = 224
      Top = 136
      Width = 169
      Height = 105
    end
    object LabeledEdit3: TLabeledEdit
      Left = 16
      Top = 32
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyUp = LabeledEdit3KeyUp
    end
    object LabeledEdit4: TLabeledEdit
      Left = 224
      Top = 32
      Width = 169
      Height = 33
      EditLabel.Width = 159
      EditLabel.Height = 25
      EditLabel.Caption = 'Apellido y Nombre'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -20
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyUp = LabeledEdit4KeyUp
    end
    object LabeledEdit6: TLabeledEdit
      Left = 16
      Top = 96
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
      TabOrder = 2
      OnKeyUp = LabeledEdit6KeyUp
    end
    object LabeledEdit7: TLabeledEdit
      Left = 224
      Top = 96
      Width = 169
      Height = 33
      EditLabel.Width = 172
      EditLabel.Height = 25
      EditLabel.BiDiMode = bdLeftToRight
      EditLabel.Caption = 'Ruta de la fotografia'
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
      ReadOnly = True
      TabOrder = 3
      OnKeyUp = LabeledEdit7KeyUp
    end
    object Button7: TButton
      Left = 224
      Top = 248
      Width = 169
      Height = 33
      Caption = 'Selecionar Imagen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button7Click
    end
    object Button9: TButton
      Left = 16
      Top = 248
      Width = 169
      Height = 33
      Caption = 'Volver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Button9Click
    end
    object Button8: TButton
      Left = 16
      Top = 200
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
      TabOrder = 6
      OnClick = Button8Click
    end
    object LabeledEdit5: TLabeledEdit
      Left = 16
      Top = 160
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
      TabOrder = 7
      OnKeyUp = LabeledEdit5KeyUp
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 296
    Width = 417
    Height = 65
    Caption = 'Ruta de la ubicacion '
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 33
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
    object Button5: TButton
      Left = 312
      Top = 24
      Width = 89
      Height = 33
      Caption = 'Asignar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 424
    Top = 320
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 456
    Top = 320
  end
end
