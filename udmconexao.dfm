object dmconexao: Tdmconexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 342
  Width = 475
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=DBMONTREAL'
      'Server=DESKTOP-3BU80HC\SQLEXPRESS'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    Left = 48
    Top = 48
  end
  object qryCliente: TFDQuery
    BeforePost = qryClienteBeforePost
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_CODIGO = :CODIGO')
    Left = 48
    Top = 104
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object qryClienteCLIENTE_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIENTE_CODIGO'
      Origin = 'CLIENTE_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteCLIENTE_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Required = True
      Size = 100
    end
    object qryClienteCLIENTE_CPF: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CLIENTE_CPF'
      Origin = 'CLIENTE_CPF'
      Required = True
      EditMask = '999 999 999\-99;0;_'
      Size = 11
    end
    object qryClienteCLIENTE_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CLIENTE_STATUS'
      Origin = 'CLIENTE_STATUS'
      Required = True
      OnGetText = qryClienteCLIENTE_STATUSGetText
      FixedChar = True
      Size = 1
    end
    object qryClienteCLIENTE_DATANASCIMENTO: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'CLIENTE_DATANASCIMENTO'
      Origin = 'CLIENTE_DATANASCIMENTO'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
  end
  object FDSchemaAdapter: TFDSchemaAdapter
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    AfterApplyUpdate = FDSchemaAdapterAfterApplyUpdate
    Left = 384
    Top = 176
  end
  object qryValida: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_CODIGO = :CODIGO')
    Left = 128
    Top = 128
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryFornecedor: TFDQuery
    BeforePost = qryFornecedorBeforePost
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES'
      'WHERE'
      'FORNEC_CODIGO = :CODIGO')
    Left = 48
    Top = 160
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object qryFornecedorFORNEC_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'FORNEC_CODIGO'
      Origin = 'FORNEC_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryFornecedorFORNEC_NOMEFANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'FORNEC_NOMEFANTASIA'
      Origin = 'FORNEC_NOMEFANTASIA'
      Required = True
      Size = 100
    end
    object qryFornecedorFORNEC_RAZAOSOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'FORNEC_RAZAOSOCIAL'
      Origin = 'FORNEC_RAZAOSOCIAL'
      Required = True
      Size = 100
    end
    object qryFornecedorFORNEC_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'FORNEC_CNPJ'
      Origin = 'FORNEC_CNPJ'
      Required = True
      EditMask = '00\.000\.000\/0000\-00;0;'
      Size = 14
    end
    object qryFornecedorFORNEC_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'FORNEC_STATUS'
      Origin = 'FORNEC_STATUS'
      Required = True
      OnGetText = qryFornecedorFORNEC_STATUSGetText
      FixedChar = True
      Size = 1
    end
  end
  object qryProduto: TFDQuery
    BeforePost = qryProdutoBeforePost
    Connection = FDConnection
    SQL.Strings = (
      'SELECT PRD.*,FORNEC_NOMEFANTASIA FROM PRODUTOS PRD'
      
        'LEFT JOIN FORNECEDORES ON FORNEC_CODIGO = PRD.PRODUTO_CODFORNECE' +
        'DOR'
      'WHERE'
      'PRD.PRODUTO_CODIGO= :CODIGO')
    Left = 48
    Top = 216
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object qryProdutoPRODUTO_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRODUTO_CODIGO'
      ReadOnly = True
    end
    object qryProdutoPRODUTO_DESCRICAO: TStringField
      DisplayLabel = 'Desccri'#231#227'o'
      FieldName = 'PRODUTO_DESCRICAO'
      Required = True
      Size = 100
    end
    object qryProdutoPRODUTO_PRECOUNITARIO: TCurrencyField
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      FieldName = 'PRODUTO_PRECOUNITARIO'
      Origin = 'PRODUTO_PRECOUNITARIO'
      Required = True
    end
    object qryProdutoPRODUTO_CODFORNECEDOR: TIntegerField
      DisplayLabel = 'Codigo Fornecedor'
      FieldName = 'PRODUTO_CODFORNECEDOR'
      Required = True
      OnValidate = qryProdutoPRODUTO_CODFORNECEDORValidate
    end
    object qryProdutoFORNEC_NOMEFANTASIA: TStringField
      DisplayLabel = 'Nome Fornecedor'
      FieldName = 'FORNEC_NOMEFANTASIA'
      Origin = 'FORNEC_NOMEFANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qryProdutoPRODUTO_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'PRODUTO_STATUS'
      Required = True
      OnGetText = qryProdutoPRODUTO_STATUSGetText
      FixedChar = True
      Size = 1
    end
  end
  object qryVenda: TFDQuery
    BeforePost = qryVendaBeforePost
    OnNewRecord = qryVendaNewRecord
    CachedUpdates = True
    IndexFieldNames = 'VENDA_CODIGO'
    Connection = FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    SQL.Strings = (
      'SELECT VD.*, CLIENTE_NOME FROM VENDAS VD'
      'LEFT JOIN CLIENTES ON CLIENTE_CODIGO = VD.VENDA_CODCLIENTE'
      'WHERE'
      'VD.VENDA_CODIGO = :CODIGO')
    Left = 192
    Top = 216
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object qryVendaVENDA_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo Venda'
      FieldName = 'VENDA_CODIGO'
      Origin = 'VENDA_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendaVENDA_CODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'VENDA_CODCLIENTE'
      Origin = 'VENDA_CODCLIENTE'
      Required = True
      OnValidate = qryVendaVENDA_CODCLIENTEValidate
    end
    object qryVendaCLIENTE_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      ProviderFlags = []
      Size = 100
    end
    object qryVendaVENDA_DATAHORA: TSQLTimeStampField
      DisplayLabel = 'Data Hora'
      FieldName = 'VENDA_DATAHORA'
      Origin = 'VENDA_DATAHORA'
      Required = True
      EditMask = '!99/99/9999 99:99:99;1;_'
    end
    object qryVendaVENDA_SATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'VENDA_SATUS'
      Origin = 'VENDA_SATUS'
      OnGetText = qryVendaVENDA_SATUSGetText
      FixedChar = True
      Size = 1
    end
  end
  object qryVendaItens: TFDQuery
    OnNewRecord = qryVendaItensNewRecord
    CachedUpdates = True
    AggregatesActive = True
    MasterSource = srcconexao
    MasterFields = 'VENDA_CODIGO'
    Connection = FDConnection
    SchemaAdapter = FDSchemaAdapter
    FetchOptions.AssignedValues = [evCache, evDetailCascade]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT VI.*, PRODUTO_DESCRICAO,PRODUTO_PRECOUNITARIO,PRODUTO_COD' +
        'FORNECEDOR FROM VENDAS_ITENS VI'
      'LEFT JOIN PRODUTOS ON PRODUTO_CODIGO = VI.VENDAITEM_CODPRODUTO'
      'WHERE'
      'VI.VENDAITEM_CODVENDA = :VENDA_CODIGO')
    Left = 264
    Top = 216
    ParamData = <
      item
        Name = 'VENDA_CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVendaItensVENDAITEM_CODITEM: TFDAutoIncField
      DisplayLabel = 'C'#243'digo Item'
      FieldName = 'VENDAITEM_CODITEM'
      Origin = 'VENDAITEM_CODITEM'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object qryVendaItensVENDAITEM_CODVENDA: TIntegerField
      DisplayLabel = 'C'#243'digo Venda'
      FieldName = 'VENDAITEM_CODVENDA'
      Origin = 'VENDAITEM_CODVENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryVendaItensVENDAITEM_CODPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      DisplayWidth = 12
      FieldName = 'VENDAITEM_CODPRODUTO'
      Origin = 'VENDAITEM_CODPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = qryVendaItensVENDAITEM_CODPRODUTOValidate
    end
    object qryVendaItensPRODUTO_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Produto'
      DisplayWidth = 75
      FieldName = 'PRODUTO_DESCRICAO'
      Origin = 'PRODUTO_DESCRICAO'
      ProviderFlags = []
      Size = 100
    end
    object qryVendaItensPRODUTO_CODFORNECEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo Fornecedor'
      DisplayWidth = 15
      FieldName = 'PRODUTO_CODFORNECEDOR'
      Origin = 'PRODUTO_CODFORNECEDOR'
      ProviderFlags = []
    end
    object qryVendaItensPRODUTO_PRECOUNITARIO: TCurrencyField
      DisplayLabel = 'Pre'#231'o Unit'#225'rio'
      DisplayWidth = 11
      FieldName = 'PRODUTO_PRECOUNITARIO'
      Origin = 'PRODUTO_PRECOUNITARIO'
      ProviderFlags = []
    end
    object qryVendaItensVENDAITEM_QTDVENDIDA: TSingleField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'VENDAITEM_QTDVENDIDA'
      Origin = 'VENDAITEM_QTDVENDIDA'
      Required = True
      OnValidate = qryVendaItensVENDAITEM_QTDVENDIDAValidate
    end
    object qryVendaItensVENDAITEM_VALORTOTAL: TSingleField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VENDAITEM_VALORTOTAL'
      Origin = 'VENDAITEM_VALORTOTAL'
      Required = True
    end
    object qryVendaItensTOTAL_VENDA: TAggregateField
      FieldName = 'TOTAL_VENDA'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VENDAITEM_VALORTOTAL)'
    end
  end
  object srcconexao: TDataSource
    DataSet = qryVenda
    Left = 195
    Top = 272
  end
  object srcconexaItens: TDataSource
    DataSet = qryVendaItens
    Left = 267
    Top = 272
  end
  object qryClientesRel: TFDQuery
    BeforePost = qryClienteBeforePost
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES'
      'WHERE'
      'CLIENTE_CODIGO = :CODIGO')
    Left = 128
    Top = 216
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftSmallint
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CLIENTE_CODIGO'
      Origin = 'CLIENTE_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CLIENTE_NOME'
      Origin = 'CLIENTE_NOME'
      Required = True
      Size = 100
    end
    object StringField2: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CLIENTE_CPF'
      Origin = 'CLIENTE_CPF'
      Required = True
      EditMask = '999 999 999\-99;0;_'
      Size = 11
    end
    object StringField3: TStringField
      DisplayLabel = 'Status'
      FieldName = 'CLIENTE_STATUS'
      Origin = 'CLIENTE_STATUS'
      Required = True
      OnGetText = qryClienteCLIENTE_STATUSGetText
      FixedChar = True
      Size = 1
    end
    object DateField1: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'CLIENTE_DATANASCIMENTO'
      Origin = 'CLIENTE_DATANASCIMENTO'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
  end
  object srcCLientesRel: TDataSource
    DataSet = qryClientesRel
    Left = 131
    Top = 272
  end
end
