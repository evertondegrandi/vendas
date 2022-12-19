inherited fvenda: Tfvenda
  Caption = 'Cadastro de Vendas'
  ClientHeight = 470
  ClientWidth = 980
  OnShow = FormShow
  ExplicitWidth = 996
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigo: TLabel [0]
    Left = 10
    Top = 6
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbeCodigo
  end
  object lblCliente: TLabel [1]
    Left = 10
    Top = 49
    Width = 33
    Height = 13
    Caption = 'Cliente'
    FocusControl = dbeCliente
  end
  object Label3: TLabel [2]
    Left = 175
    Top = 49
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = dbeNome
  end
  object lblDataHora: TLabel [3]
    Left = 10
    Top = 94
    Width = 49
    Height = 13
    Caption = 'Data Hora'
    FocusControl = dbeDataHora
  end
  object Label5: TLabel [4]
    Left = 332
    Top = 6
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  inherited ToolBar1: TToolBar
    Top = 430
    Width = 980
    ButtonWidth = 93
    ExplicitTop = 408
    ExplicitWidth = 521
    inherited botaoNovo: TToolButton
      ExplicitWidth = 93
    end
    inherited ToolButton2: TToolButton
      Left = 93
      ExplicitLeft = 93
    end
    inherited botaoPesquisar: TToolButton
      Left = 101
      OnClick = botaoPesquisarClick
      ExplicitLeft = 101
      ExplicitWidth = 93
    end
    inherited ToolButton4: TToolButton
      Left = 194
      ExplicitLeft = 194
    end
    inherited botaoGravar: TToolButton
      Left = 202
      OnClick = botaoGravarClick
      ExplicitLeft = 202
      ExplicitWidth = 93
    end
    inherited ToolButton6: TToolButton
      Left = 295
      ExplicitLeft = 295
    end
    inherited botaoDeletar: TToolButton
      Left = 303
      OnClick = botaoDeletarClick
      ExplicitLeft = 303
      ExplicitWidth = 93
    end
    inherited ToolButton1: TToolButton
      Left = 396
      ExplicitLeft = 396
    end
    inherited botaoCancelar: TToolButton
      Left = 404
      ExplicitLeft = 404
      ExplicitWidth = 93
    end
  end
  object dbgItens: TDBGrid [6]
    Left = 8
    Top = 160
    Width = 964
    Height = 217
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    DataSource = dmconexao.srcconexaItens
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dbeCodigo: TDBEdit [7]
    Left = 10
    Top = 22
    Width = 134
    Height = 21
    DataField = 'VENDA_CODIGO'
    DataSource = dmconexao.srcconexao
    Enabled = False
    TabOrder = 2
  end
  object dbeCliente: TDBEdit [8]
    Left = 10
    Top = 65
    Width = 130
    Height = 21
    DataField = 'VENDA_CODCLIENTE'
    DataSource = dmconexao.srcconexao
    TabOrder = 3
  end
  object dbeNome: TDBEdit [9]
    Left = 175
    Top = 65
    Width = 296
    Height = 21
    DataField = 'CLIENTE_NOME'
    DataSource = dmconexao.srcconexao
    Enabled = False
    TabOrder = 4
  end
  object dbeDataHora: TDBEdit [10]
    Left = 10
    Top = 110
    Width = 130
    Height = 21
    DataField = 'VENDA_DATAHORA'
    DataSource = dmconexao.srcconexao
    MaxLength = 20
    TabOrder = 5
  end
  object comboStatus: TDBComboBox [11]
    Left = 332
    Top = 24
    Width = 131
    Height = 21
    Style = csDropDownList
    DataField = 'VENDA_SATUS'
    DataSource = dmconexao.srcconexao
    Items.Strings = (
      'PENDENTE'
      'EFETIVADA')
    TabOrder = 6
    OnChange = comboStatusChange
  end
  object dbeTotalVenda: TDBEdit [12]
    Left = 846
    Top = 390
    Width = 126
    Height = 21
    DataField = 'TOTAL_VENDA'
    DataSource = dmconexao.srcconexaItens
    Enabled = False
    TabOrder = 7
  end
  object Button1: TButton [13]
    Left = 616
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    OnClick = Button1Click
  end
  inherited imglistmodelo: TImageList
    Top = 0
  end
  inherited actionlistModelo: TActionList
    Top = 56
  end
end
