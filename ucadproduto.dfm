inherited fcadproduto: Tfcadproduto
  Caption = 'Cadastro de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  object lblCodigo: TLabel [0]
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = dbeCOdigo
  end
  object lblDesc: TLabel [1]
    Left = 8
    Top = 48
    Width = 51
    Height = 13
    Caption = 'Desccri'#231#227'o'
    FocusControl = dbeDesc
  end
  object lblPreco: TLabel [2]
    Left = 8
    Top = 86
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
    FocusControl = dbePreco
  end
  object lblFornec: TLabel [3]
    Left = 8
    Top = 128
    Width = 91
    Height = 13
    Caption = 'Codigo Fornecedor'
    FocusControl = dbeFornec
  end
  object lblStatus: TLabel [4]
    Left = 320
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object Label6: TLabel [5]
    Left = 128
    Top = 232
    Width = 85
    Height = 13
    Caption = 'Nome Fornecedor'
    FocusControl = dbeDescFornec
  end
  inherited ToolBar1: TToolBar
    inherited botaoPesquisar: TToolButton
      OnClick = botaoPesquisarClick
    end
  end
  object dbeCOdigo: TDBEdit [7]
    Left = 8
    Top = 24
    Width = 134
    Height = 21
    DataField = 'PRODUTO_CODIGO'
    DataSource = srcconexao
    Enabled = False
    TabOrder = 1
  end
  object dbeDesc: TDBEdit [8]
    Left = 8
    Top = 61
    Width = 457
    Height = 21
    DataField = 'PRODUTO_DESCRICAO'
    DataSource = srcconexao
    TabOrder = 2
  end
  object dbePreco: TDBEdit [9]
    Left = 8
    Top = 102
    Width = 134
    Height = 21
    DataField = 'PRODUTO_PRECOUNITARIO'
    DataSource = srcconexao
    TabOrder = 3
  end
  object dbeFornec: TDBEdit [10]
    Left = 8
    Top = 144
    Width = 134
    Height = 21
    DataField = 'PRODUTO_CODFORNECEDOR'
    DataSource = srcconexao
    TabOrder = 4
  end
  object dbeDescFornec: TDBEdit [11]
    Left = 148
    Top = 144
    Width = 317
    Height = 21
    DataField = 'FORNEC_NOMEFANTASIA'
    DataSource = srcconexao
    Enabled = False
    TabOrder = 5
  end
  object comboStatus: TDBComboBox [12]
    Left = 320
    Top = 24
    Width = 143
    Height = 21
    Style = csDropDownList
    DataField = 'PRODUTO_STATUS'
    DataSource = srcconexao
    Items.Strings = (
      'ATIVO'
      'INATIVO')
    TabOrder = 6
  end
  object srcconexao: TDataSource
    DataSet = dmconexao.qryProduto
    Left = 568
    Top = 80
  end
end
