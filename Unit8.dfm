object Form8: TForm8
  Left = 280
  Top = 131
  Width = 1031
  Height = 528
  Caption = 'Repeticion'
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
    Left = 864
    Top = 160
    Width = 135
    Height = 13
    Caption = 'Ritmo de tirada en segundos'
  end
  object Label2: TLabel
    Left = 864
    Top = 16
    Width = 128
    Height = 20
    Caption = 'Nombre del juego:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 864
    Top = 40
    Width = 48
    Height = 20
    Caption = 'Label3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 864
    Top = 64
    Width = 129
    Height = 25
    Caption = 'Volver'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 864
    Top = 96
    Width = 129
    Height = 25
    Caption = 'Reproduccion Manual'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 864
    Top = 128
    Width = 129
    Height = 25
    Caption = 'Reproduccion Automatica'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 864
    Top = 208
    Width = 129
    Height = 25
    Caption = '[CONTINUAR]'
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 864
    Top = 240
    Width = 129
    Height = 25
    Caption = '[PARAR] '
    TabOrder = 4
    Visible = False
    OnClick = Button5Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 849
    Height = 489
    Caption = 'Sin selecionar metodo de reproducion'
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 5
    object Button8: TButton
      Left = 8
      Top = 456
      Width = 137
      Height = 25
      Caption = '[Ver Bolillas Restantes]'
      Enabled = False
      TabOrder = 0
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 280
      Top = 456
      Width = 129
      Height = 25
      Caption = '[Ver Bolillas sacardas ]'
      Enabled = False
      TabOrder = 1
      OnClick = Button9Click
    end
    object StringGrid3: TStringGrid
      Left = 8
      Top = 288
      Width = 825
      Height = 161
      ColCount = 20
      DefaultColWidth = 35
      DefaultRowHeight = 35
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      TabOrder = 2
    end
    object GroupBox2: TGroupBox
      Left = 608
      Top = 24
      Width = 225
      Height = 257
      Caption = 'Vista del carton apuntado'
      TabOrder = 3
      object StringGrid4: TStringGrid
        Left = 8
        Top = 16
        Width = 209
        Height = 233
        DefaultColWidth = 40
        DefaultRowHeight = 35
        FixedColor = clSkyBlue
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
    object Button6: TButton
      Left = 160
      Top = 456
      Width = 105
      Height = 25
      Caption = 'Sacar bolilla'
      Enabled = False
      TabOrder = 4
      OnClick = Button6Click
    end
    object GroupBox3: TGroupBox
      Left = 304
      Top = 24
      Width = 297
      Height = 257
      Caption = 'Listado de cartones'
      TabOrder = 5
      object StringGrid2: TStringGrid
        Left = 8
        Top = 16
        Width = 273
        Height = 225
        ColCount = 4
        DefaultColWidth = 65
        FixedCols = 0
        RowCount = 2
        TabOrder = 0
        OnSelectCell = StringGrid2SelectCell
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 24
      Width = 289
      Height = 257
      Caption = 'Listado de jugadores'
      TabOrder = 6
      object StringGrid1: TStringGrid
        Left = 8
        Top = 16
        Width = 273
        Height = 225
        ColCount = 4
        FixedCols = 0
        TabOrder = 0
        OnSelectCell = StringGrid1SelectCell
      end
    end
  end
  object Edit1: TEdit
    Left = 864
    Top = 176
    Width = 129
    Height = 21
    TabOrder = 6
    Text = '1'
    OnKeyPress = Edit1KeyPress
  end
  object Button7: TButton
    Left = 864
    Top = 376
    Width = 129
    Height = 25
    Caption = 'Ficha del  jugador'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button10: TButton
    Left = 864
    Top = 440
    Width = 129
    Height = 25
    Caption = 'Detalle de juego'
    TabOrder = 8
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 864
    Top = 408
    Width = 129
    Height = 25
    Caption = 'Listado de juego'
    TabOrder = 9
    OnClick = Button11Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 864
    Top = 336
  end
end
