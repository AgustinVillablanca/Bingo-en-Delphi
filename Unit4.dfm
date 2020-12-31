object Form4: TForm4
  Left = 225
  Top = 196
  Width = 976
  Height = 411
  Caption = 'Menu del Administrador'
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 249
    Height = 337
    Caption = 'Nuevo juego'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 83
      Height = 13
      Caption = 'Nombre del juego'
    end
    object Button5: TButton
      Left = 8
      Top = 304
      Width = 65
      Height = 25
      Caption = 'Crear'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Edit1: TEdit
      Left = 16
      Top = 40
      Width = 209
      Height = 21
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 64
      Width = 233
      Height = 233
      Caption = 'Premios en relacion 1 = 0,01% del total '
      TabOrder = 2
      object Label2: TLabel
        Left = 24
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Linea'
      end
      object Label3: TLabel
        Left = 88
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Diagonal'
      end
      object Label4: TLabel
        Left = 168
        Top = 24
        Width = 21
        Height = 13
        Caption = 'Cruz'
      end
      object Label5: TLabel
        Left = 40
        Top = 72
        Width = 37
        Height = 13
        Caption = 'C.Chico'
      end
      object Label6: TLabel
        Left = 120
        Top = 72
        Width = 45
        Height = 13
        Caption = 'C.Grande'
      end
      object Label8: TLabel
        Left = 64
        Top = 136
        Width = 77
        Height = 13
        Caption = 'Coste del carton'
      end
      object Label9: TLabel
        Left = 64
        Top = 184
        Width = 74
        Height = 13
        Caption = 'Fecha de juego'
      end
      object Edit2: TEdit
        Left = 16
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 88
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit3KeyPress
      end
      object Edit4: TEdit
        Left = 160
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 2
        OnKeyPress = Edit4KeyPress
      end
      object Edit5: TEdit
        Left = 40
        Top = 88
        Width = 41
        Height = 21
        TabOrder = 3
        OnKeyPress = Edit5KeyPress
      end
      object Edit6: TEdit
        Left = 120
        Top = 88
        Width = 41
        Height = 21
        TabOrder = 4
        OnKeyPress = Edit6KeyPress
      end
      object Edit8: TEdit
        Left = 24
        Top = 152
        Width = 169
        Height = 21
        TabOrder = 5
        OnKeyPress = Edit8KeyPress
      end
      object DateTimePicker1: TDateTimePicker
        Left = 8
        Top = 200
        Width = 97
        Height = 21
        Date = 43999.839771967590000000
        Time = 43999.839771967590000000
        TabOrder = 6
      end
      object DateTimePicker2: TDateTimePicker
        Left = 120
        Top = 200
        Width = 89
        Height = 21
        Date = 43999.839860393520000000
        Time = 43999.839860393520000000
        Kind = dtkTime
        TabOrder = 7
      end
    end
    object Button13: TButton
      Left = 160
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 3
      OnClick = Button13Click
    end
    object Button2: TButton
      Left = 80
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Modificar'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 272
    Top = 8
    Width = 241
    Height = 337
    Caption = 'Listado de juegos activos'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 1
    object ListBox1: TListBox
      Left = 16
      Top = 24
      Width = 209
      Height = 257
      ItemHeight = 13
      TabOrder = 0
    end
    object Button3: TButton
      Left = 128
      Top = 304
      Width = 97
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 16
      Top = 304
      Width = 105
      Height = 25
      Caption = 'Recargar Lista'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Button7: TButton
    Left = 776
    Top = 8
    Width = 137
    Height = 25
    Caption = 'Volver al menu'
    TabOrder = 2
    OnClick = Button7Click
  end
  object GroupBox4: TGroupBox
    Left = 520
    Top = 8
    Width = 233
    Height = 337
    Caption = 'Listado de juegos terminados'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 3
    object ListBox2: TListBox
      Left = 8
      Top = 24
      Width = 217
      Height = 257
      ItemHeight = 13
      TabOrder = 0
    end
    object Button4: TButton
      Left = 8
      Top = 304
      Width = 105
      Height = 25
      Caption = 'Recargar Lista'
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 128
      Top = 304
      Width = 97
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = Button6Click
    end
  end
  object Button8: TButton
    Left = 776
    Top = 40
    Width = 137
    Height = 25
    Caption = 'Herramientas de Me'
    TabOrder = 4
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 776
    Top = 72
    Width = 137
    Height = 25
    Caption = 'Listado de jugadores'
    TabOrder = 5
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 776
    Top = 104
    Width = 137
    Height = 25
    Caption = 'Listado General de Juegos'
    TabOrder = 6
    OnClick = Button10Click
  end
  object GroupBox5: TGroupBox
    Left = 768
    Top = 136
    Width = 153
    Height = 169
    Caption = 'Ingrese la cantidad <n>'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 7
    object Label10: TLabel
      Left = 2
      Top = 16
      Width = 3
      Height = 13
    end
    object Button12: TButton
      Left = 8
      Top = 80
      Width = 137
      Height = 41
      Caption = 'Listado de los jugadores con mas Dinero'
      TabOrder = 0
      WordWrap = True
      OnClick = Button12Click
    end
    object Button11: TButton
      Left = 8
      Top = 40
      Width = 137
      Height = 41
      Caption = 'Listado de jugadores con mas compras'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      WordWrap = True
      OnClick = Button11Click
    end
    object Edit9: TEdit
      Left = 8
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '1'
      OnKeyPress = Edit9KeyPress
    end
    object Button15: TButton
      Left = 8
      Top = 120
      Width = 137
      Height = 41
      Caption = 'Jugadores que ganaron un premio determinado'
      TabOrder = 3
      WordWrap = True
      OnClick = Button15Click
    end
  end
  object Button14: TButton
    Left = 776
    Top = 312
    Width = 137
    Height = 33
    Caption = 'Listado Cartones ganadores de Bingo'
    TabOrder = 8
    WordWrap = True
    OnClick = Button14Click
  end
end
