inherited fcadcliente: Tfcadcliente
  Caption = 'Cadastro de Ciente'
  ClientHeight = 300
  ClientWidth = 671
  ExplicitWidth = 687
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  object lblCod: TLabel [0]
    Left = 16
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel [1]
    Left = 16
    Top = 74
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblCPF: TLabel [2]
    Left = 312
    Top = 74
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lblDataNasc: TLabel [3]
    Left = 16
    Top = 154
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object lblStatus: TLabel [4]
    Left = 280
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  inherited ToolBar1: TToolBar
    Top = 260
    Width = 671
    ExplicitTop = 260
    inherited botaoPesquisar: TToolButton
      OnClick = botaoPesquisarClick
    end
  end
  object editNome: TDBEdit [6]
    Left = 16
    Top = 91
    Width = 281
    Height = 21
    DataField = 'CLIENTE_NOME'
    DataSource = srcConexao
    TabOrder = 1
  end
  object dbeCPF: TDBEdit [7]
    Left = 312
    Top = 91
    Width = 101
    Height = 21
    DataField = 'CLIENTE_CPF'
    DataSource = srcConexao
    TabOrder = 2
  end
  object dbeData: TDBEdit [8]
    Left = 16
    Top = 170
    Width = 82
    Height = 21
    DataField = 'CLIENTE_DATANASCIMENTO'
    DataSource = srcConexao
    TabOrder = 3
  end
  object comboStatus: TDBComboBox [9]
    Left = 280
    Top = 32
    Width = 129
    Height = 21
    Style = csDropDownList
    DataField = 'CLIENTE_STATUS'
    DataSource = srcConexao
    Items.Strings = (
      'ATIVO'
      'INATIVO')
    TabOrder = 4
  end
  object DBEdit1: TDBEdit [10]
    Left = 16
    Top = 32
    Width = 113
    Height = 21
    DataField = 'CLIENTE_CODIGO'
    DataSource = srcConexao
    Enabled = False
    TabOrder = 5
  end
  object srcConexao: TDataSource
    DataSet = dmconexao.qryCliente
    Left = 496
    Top = 144
  end
end
