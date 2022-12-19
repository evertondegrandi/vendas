inherited fcadfornecedor: Tfcadfornecedor
  Caption = 'Cadastro de Fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_codio: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbeCodigo
  end
  object lblnomefantasia: TLabel [1]
    Left = 8
    Top = 100
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
    FocusControl = dbenomefantasia
  end
  object lblRazaosocial: TLabel [2]
    Left = 8
    Top = 144
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
    FocusControl = dberazao
  end
  object lblCNPJ: TLabel [3]
    Left = 8
    Top = 56
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = dbeCNPJ
  end
  object lblstatus: TLabel [4]
    Left = 264
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  inherited ToolBar1: TToolBar
    ButtonWidth = 95
    inherited botaoNovo: TToolButton
      ExplicitWidth = 95
    end
    inherited ToolButton2: TToolButton
      Left = 95
      ExplicitLeft = 95
    end
    inherited botaoPesquisar: TToolButton
      Left = 103
      OnClick = botaoPesquisarClick
      ExplicitLeft = 103
      ExplicitWidth = 95
    end
    inherited ToolButton4: TToolButton
      Left = 198
      ExplicitLeft = 198
    end
    inherited botaoGravar: TToolButton
      Left = 206
      ExplicitLeft = 206
      ExplicitWidth = 95
    end
    inherited ToolButton6: TToolButton
      Left = 301
      ExplicitLeft = 301
    end
    inherited botaoDeletar: TToolButton
      Left = 309
      ExplicitLeft = 309
      ExplicitWidth = 95
    end
    inherited ToolButton1: TToolButton
      Left = 404
      ExplicitLeft = 404
    end
    inherited botaoCancelar: TToolButton
      Left = 412
      ExplicitLeft = 412
      ExplicitWidth = 95
    end
  end
  object dbeCodigo: TDBEdit [6]
    Left = 8
    Top = 24
    Width = 132
    Height = 21
    DataField = 'FORNEC_CODIGO'
    DataSource = srcConexao
    Enabled = False
    TabOrder = 1
  end
  object dbenomefantasia: TDBEdit [7]
    Left = 8
    Top = 116
    Width = 399
    Height = 21
    DataField = 'FORNEC_NOMEFANTASIA'
    DataSource = srcConexao
    TabOrder = 2
  end
  object dberazao: TDBEdit [8]
    Left = 8
    Top = 160
    Width = 399
    Height = 21
    DataField = 'FORNEC_RAZAOSOCIAL'
    DataSource = srcConexao
    TabOrder = 3
  end
  object dbeCNPJ: TDBEdit [9]
    Left = 8
    Top = 72
    Width = 184
    Height = 21
    DataField = 'FORNEC_CNPJ'
    DataSource = srcConexao
    MaxLength = 18
    TabOrder = 4
  end
  object comboStatus: TDBComboBox [10]
    Left = 264
    Top = 24
    Width = 141
    Height = 21
    Style = csDropDownList
    DataField = 'FORNEC_STATUS'
    DataSource = srcConexao
    Items.Strings = (
      'ATIVO'
      'INATIVO')
    TabOrder = 5
  end
  object srcConexao: TDataSource
    DataSet = dmconexao.qryFornecedor
    Left = 496
    Top = 144
  end
end
