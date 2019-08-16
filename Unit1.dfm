object Form1: TForm1
  Left = 702
  Top = 302
  Width = 538
  Height = 593
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 553
    TabOrder = 2
    object Button2: TButton
      Left = 56
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 0
    end
    object HeaderControl1: THeaderControl
      Left = 1
      Top = 1
      Width = 519
      Height = 40
      Sections = <>
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 24
      Width = 489
      Height = 113
      Caption = #22522#30784#20449#24687
      TabOrder = 2
      object Label1: TLabel
        Left = 32
        Top = 32
        Width = 36
        Height = 13
        Caption = #22995#21517#65306
      end
      object Label2: TLabel
        Left = 32
        Top = 72
        Width = 60
        Height = 13
        Caption = #24320#22987#26102#38388#65306
      end
      object Label3: TLabel
        Left = 272
        Top = 72
        Width = 60
        Height = 13
        Caption = #32467#26463#26102#38388#65306
      end
      object Edit1: TEdit
        Left = 96
        Top = 32
        Width = 121
        Height = 21
        Hint = #35831#22635#20889#24744#30340#29233#31216#65281
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 24
      Top = 184
      Width = 481
      Height = 361
      Caption = #32479#35745#32467#26524
      TabOrder = 3
      object PageControl1: TPageControl
        Left = 16
        Top = 24
        Width = 449
        Height = 329
        ActivePage = TabSheet4
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = #25152#26377#20107#20214#26126#32454
        end
        object TabSheet2: TTabSheet
          Caption = #32771#21220#25968#25454
          ImageIndex = 1
        end
        object TabSheet3: TTabSheet
          Caption = #39184#34917#25968#25454
          ImageIndex = 2
        end
        object TabSheet4: TTabSheet
          Caption = #35843#20241#25968#25454
          ImageIndex = 3
        end
      end
    end
  end
  object Memo1: TMemo
    Left = 40
    Top = 232
    Width = 449
    Height = 305
    Color = clWhite
    Lines.Strings = (
      #20107#20214'ID           '#20107#20214#26085#26399)
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 431
    Top = 152
    Width = 75
    Height = 25
    Caption = #32479#35745
    TabOrder = 1
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 112
    Top = 96
    Width = 121
    Height = 21
    Date = 43671.742420370370000000
    Time = 43671.742420370370000000
    TabOrder = 3
  end
  object DateTimePicker2: TDateTimePicker
    Left = 360
    Top = 96
    Width = 97
    Height = 21
    Date = 43671.742530104170000000
    Time = 43671.742530104170000000
    TabOrder = 4
  end
end
