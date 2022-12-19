object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 330
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_texto: TLabel
    Left = 168
    Top = 16
    Width = 86
    Height = 13
    Caption = 'Texto a Pesquisar'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 715
    Height = 250
    Align = alBottom
    DataSource = dsSQL
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtBusca: TEdit
    Left = 168
    Top = 37
    Width = 329
    Height = 21
    TabOrder = 1
  end
  object btnPesquisa: TButton
    Left = 511
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Pesquisa'
    TabOrder = 2
    OnClick = btnPesquisaClick
  end
  object rdg_filtro: TRadioGroup
    Left = 8
    Top = 8
    Width = 142
    Height = 66
    Caption = 'Filtro'
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 3
  end
  object botaoselecionar: TButton
    Left = 592
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 4
    OnClick = botaoselecionarClick
  end
  object dsSQL: TDataSource
    Left = 416
    Top = 72
  end
end
