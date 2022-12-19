unit udmconexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLiteVDataSet, uPesquisa, Vcl.Dialogs;

type
  Tdmconexao = class(TDataModule)
    FDConnection: TFDConnection;
    qryCliente: TFDQuery;
    FDSchemaAdapter: TFDSchemaAdapter;
    qryClienteCLIENTE_NOME: TStringField;
    qryClienteCLIENTE_CPF: TStringField;
    qryClienteCLIENTE_STATUS: TStringField;
    qryClienteCLIENTE_DATANASCIMENTO: TDateField;
    qryClienteCLIENTE_CODIGO: TFDAutoIncField;
    qryValida: TFDQuery;
    qryFornecedor: TFDQuery;
    qryFornecedorFORNEC_CODIGO: TFDAutoIncField;
    qryFornecedorFORNEC_NOMEFANTASIA: TStringField;
    qryFornecedorFORNEC_RAZAOSOCIAL: TStringField;
    qryFornecedorFORNEC_CNPJ: TStringField;
    qryFornecedorFORNEC_STATUS: TStringField;
    qryProduto: TFDQuery;
    qryProdutoPRODUTO_CODIGO: TFDAutoIncField;
    qryProdutoPRODUTO_DESCRICAO: TStringField;
    qryProdutoPRODUTO_CODFORNECEDOR: TIntegerField;
    qryProdutoPRODUTO_STATUS: TStringField;
    qryProdutoFORNEC_NOMEFANTASIA: TStringField;
    qryProdutoPRODUTO_PRECOUNITARIO: TCurrencyField;
    qryVenda: TFDQuery;
    qryVendaVENDA_CODCLIENTE: TIntegerField;
    qryVendaVENDA_DATAHORA: TSQLTimeStampField;
    qryVendaVENDA_SATUS: TStringField;
    qryVendaCLIENTE_NOME: TStringField;
    qryVendaItens: TFDQuery;
    qryVendaItensVENDAITEM_CODVENDA: TIntegerField;
    qryVendaItensVENDAITEM_CODPRODUTO: TIntegerField;
    qryVendaItensVENDAITEM_QTDVENDIDA: TSingleField;
    qryVendaItensVENDAITEM_VALORTOTAL: TSingleField;
    qryVendaItensPRODUTO_DESCRICAO: TStringField;
    srcconexao: TDataSource;
    srcconexaItens: TDataSource;
    qryVendaItensPRODUTO_PRECOUNITARIO: TCurrencyField;
    qryVendaItensPRODUTO_CODFORNECEDOR: TIntegerField;
    qryVendaItensVENDAITEM_CODITEM: TFDAutoIncField;
    qryVendaVENDA_CODIGO: TIntegerField;
    qryClientesRel: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateField1: TDateField;
    srcCLientesRel: TDataSource;
    qryVendaItensTOTAL_VENDA: TAggregateField;
    procedure qryClienteCLIENTE_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryClienteBeforePost(DataSet: TDataSet);
    procedure qryFornecedorBeforePost(DataSet: TDataSet);
    procedure qryFornecedorFORNEC_STATUSGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryProdutoBeforePost(DataSet: TDataSet);
    procedure qryProdutoPRODUTO_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryProdutoPRODUTO_CODFORNECEDORValidate(Sender: TField);
    procedure qryVendaVENDA_SATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryVendaVENDA_CODCLIENTEValidate(Sender: TField);
    procedure qryVendaBeforePost(DataSet: TDataSet);
    procedure qryVendaItensVENDAITEM_CODPRODUTOValidate(Sender: TField);
    procedure qryVendaItensNewRecord(DataSet: TDataSet);
    procedure qryVendaItensVENDAITEM_QTDVENDIDAValidate(Sender: TField);
    procedure qryVendaNewRecord(DataSet: TDataSet);
    procedure FDSchemaAdapterAfterApplyUpdate(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure commit;
    procedure carregaVendas(iCodCliente : Integer);
    procedure carregaClientes;
    { Public declarations }
  end;

var
  dmconexao: Tdmconexao;


type
  ITipoBusca = interface
    function ConsultaBusca: string;
    procedure Pesquisa(iCodigo : integer);
  end;

  IFactoryMethod = interface
    function CriaBusca(const TipoBusca: string): ITipoBusca;
  end;
type
  TFabricaBuscas = class(TInterfacedObject, IFactoryMethod)
    function CriaBusca(const TipoBusca: string): ITipoBusca;
  end;

type
  TBuscaCliente = class(TInterfacedObject, ITipoBusca)
    function ConsultaBusca: string;
    procedure Pesquisa(iCodigo : integer);
  end;

type
  TBuscaFornecedor = class(TInterfacedObject, ITipoBusca)
    function ConsultaBusca: string;
    procedure Pesquisa(iCodigo : integer);
  end;

type
  TBuscaProduto = class(TInterfacedObject, ITipoBusca)
    function ConsultaBusca: string;
    procedure Pesquisa(iCodigo : integer);
  end;

type
  TBuscaVenda = class(TInterfacedObject, ITipoBusca)
    function ConsultaBusca: string;
    procedure Pesquisa(iCodigo : integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ucadcliente;

{$R *.dfm}

procedure Tdmconexao.commit;
var
  slAuxDuplica : TStringList;
begin
  if qryVendaItens.IsEmpty then
  begin
    ShowMessage('Venda deve possuir Itens.');
    abort;
  end;

//  qryVendaItens.DisableControls;
  slAuxDuplica := TStringList.Create;
  try
    while not(qryVendaItens.Eof) do
    begin
      if (slAuxDuplica.IndexOf(qryVendaItensVENDAITEM_CODPRODUTO.AsString) < 0) then
        slAuxDuplica.Add(qryVendaItensVENDAITEM_CODPRODUTO.AsString);
      qryVendaItens.Next;
    end;
    if (qryVendaItens.RecordCount <> slAuxDuplica.Count) then
    begin
      ShowMessage('Não é permitido replicar o mesmo item na venda.');
      abort;
    end;

  finally
    slAuxDuplica.Free;
//    qryVendaItens.First;
//    qryVendaItens.EnableControls;
  end;

  FDSchemaAdapter.ApplyUpdates(0);
end;

procedure Tdmconexao.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := True;
  qryCliente.Active := True;
  qryFornecedor.Active := True;
  qryProduto.Active := True;
  qryClientesRel.Active := True;
  qryVenda.Active := True;
  qryVendaItens.Active := True;
end;

procedure Tdmconexao.FDSchemaAdapterAfterApplyUpdate(Sender: TObject);
begin
  qryVenda.CommitUpdates;
  qryVendaItens.CommitUpdates;
end;

function TFabricaBuscas.CriaBusca(const TipoBusca: string): ITipoBusca;
var
  fBuscaCLiente : TBuscaCliente;
  fBuscaFornec  : TBuscaFornecedor;
  fBuscaProduto : TBuscaProduto;
  fBuscaVenda   : TBuscaVenda;
begin
  //
  if (TipoBusca = 'Cliente') then
  begin
    fBuscaCLiente := TBuscaCliente.Create;
    Result := fBuscaCLiente;
  end
  else if (TipoBusca = 'Fornecedor') then
  begin
    fBuscaFornec := TBuscaFornecedor.Create;
    Result := fBuscaFornec;
  end
  else if (TipoBusca = 'Produto') then
  begin
    fBuscaProduto := TBuscaProduto.Create;
    Result := fBuscaProduto;
  end
  else if (TipoBusca = 'Venda') then
  begin
    fBuscaVenda := TBuscaVenda.Create;
    Result := fBuscaVenda;
  end;
end;

{ TBuscaCliente }
////////////////////////////////////////////////////////////////////////////////
procedure TBuscaCliente.Pesquisa(iCodigo : integer);
begin
  dmconexao.qryCliente.Close;
  dmconexao.qryCliente.SQL.Text := 'SELECT CLIENTE_CODIGO, CLIENTE_NOME, CLIENTE_CPF, CLIENTE_DATANASCIMENTO, CLIENTE_STATUS FROM CLIENTES WHERE UPPER(CLIENTE_CODIGO) = UPPER(:CODIGO)';
  dmconexao.qryCliente.Params[0].AsInteger := iCodigo;
  dmconexao.qryCliente.Params[0].DataType := ftInteger;
  dmconexao.qryCliente.Open;
end;

function TBuscaCliente.ConsultaBusca: string;
var
  fPesquisa : Tfrmpesquisa;
begin
  Result := '';
  fPesquisa := Tfrmpesquisa.Create(fcadcliente);
  try
    fPesquisa.SQLCodigo := 'SELECT CLIENTE_CODIGO, CLIENTE_NOME, CLIENTE_CPF, CLIENTE_DATANASCIMENTO, CLIENTE_STATUS FROM CLIENTES WHERE UPPER(CLIENTE_CODIGO) = UPPER(:CODIGO)';
    fPesquisa.SQLDesc  := 'SELECT CLIENTE_CODIGO, CLIENTE_NOME, CLIENTE_CPF, CLIENTE_DATANASCIMENTO, CLIENTE_STATUS FROM CLIENTES WHERE UPPER(CLIENTE_NOME) LIKE UPPER(:NOME)';
    fPesquisa.NomeFieldRetorno := 'CLIENTE_CODIGO';
    fPesquisa.Query := dmconexao.qryCliente;
    fPesquisa.ShowModal;
    Result := fPesquisa.CodigoRetorno;

    if (Result <> '') then
      Pesquisa(StrToIntDef(Result,0));
  finally
    fPesquisa.Free;
  end;
end;
////////////////////////////////////////////////////////////////////////////////

{ TBuscaVenda }
////////////////////////////////////////////////////////////////////////////////
procedure TBuscaVenda.Pesquisa(iCodigo : integer);
begin
  dmconexao.qryVenda.Close;
  dmconexao.qryVenda.SQL.Text := ' SELECT VD.*, CLIENTE_NOME FROM VENDAS VD '+
                                   ' LEFT JOIN CLIENTES ON CLIENTE_CODIGO = VD.VENDA_CODCLIENTE '+
                                   ' WHERE '+
                                   ' UPPER(VD.VENDA_CODIGO) = UPPER(:CODIGO)';
  dmconexao.qryVenda.Params[0].AsInteger := iCodigo;
  dmconexao.qryVenda.Params[0].DataType := ftInteger;
  dmconexao.qryVenda.Open;
end;

function TBuscaVenda.ConsultaBusca: string;
var
  fPesquisa : Tfrmpesquisa;
begin
  Result := '';
  fPesquisa := Tfrmpesquisa.Create(fcadcliente);
  try
    fPesquisa.SQLCodigo := ' SELECT VD.*, CLIENTE_NOME FROM VENDAS VD '+
                           ' LEFT JOIN CLIENTES ON CLIENTE_CODIGO = VD.VENDA_CODCLIENTE '+
                           ' WHERE '+
                           ' UPPER(VD.VENDA_CODIGO) = UPPER(:CODIGO)';

    fPesquisa.SQLDesc  :=  ' SELECT VD.*, CLIENTE_NOME FROM VENDAS VD '+
                           ' LEFT JOIN CLIENTES ON CLIENTE_CODIGO = VD.VENDA_CODCLIENTE '+
                           ' WHERE '+
                           ' UPPER(VD.VENDA_CODCLIENTE) = UPPER(:NOME)';
    fPesquisa.NomeFieldRetorno := 'VENDA_CODIGO';
    fPesquisa.Query := dmconexao.qryVenda;
    fPesquisa.ShowModal;
    Result := fPesquisa.CodigoRetorno;

    if (Result <> '') then
      Pesquisa(StrToIntDef(Result,0));
  finally
    fPesquisa.Free;
  end;
end;
////////////////////////////////////////////////////////////////////////////////


{ TBuscaProduto }
////////////////////////////////////////////////////////////////////////////////
procedure TBuscaProduto.Pesquisa(iCodigo : integer);
begin
  dmconexao.qryProduto.Close;
  dmconexao.qryProduto.SQL.Text := ' SELECT PRODUTO_CODIGO, PRODUTO_DESCRICAO, PRODUTO_PRECOUNITARIO, PRODUTO_CODFORNECEDOR, PRODUTO_STATUS,FORNEC_NOMEFANTASIA '+
                                   ' FROM PRODUTOS '+
                                   ' LEFT JOIN FORNECEDORES ON FORNEC_CODIGO = PRODUTO_CODFORNECEDOR '+
                                   ' WHERE UPPER(PRODUTO_CODIGO) = UPPER(:CODIGO)';
  dmconexao.qryProduto.Params[0].AsInteger := iCodigo;
  dmconexao.qryProduto.Params[0].DataType := ftInteger;
  dmconexao.qryProduto.Open;
end;

function TBuscaProduto.ConsultaBusca: string;
var
  fPesquisa : Tfrmpesquisa;
begin
  Result := '';
  fPesquisa := Tfrmpesquisa.Create(fcadcliente);
  try
    fPesquisa.SQLCodigo := ' SELECT PRODUTO_CODIGO, PRODUTO_DESCRICAO, PRODUTO_PRECOUNITARIO, PRODUTO_CODFORNECEDOR, PRODUTO_STATUS,FORNEC_NOMEFANTASIA '+
                           ' FROM PRODUTOS '+
                           ' LEFT JOIN FORNECEDORES ON FORNEC_CODIGO = PRODUTO_CODFORNECEDOR '+
                           ' WHERE UPPER(PRODUTO_CODIGO) = UPPER(:CODIGO)';
    fPesquisa.SQLDesc  := ' SELECT PRODUTO_CODIGO, PRODUTO_DESCRICAO, PRODUTO_PRECOUNITARIO, PRODUTO_CODFORNECEDOR, PRODUTO_STATUS,FORNEC_NOMEFANTASIA '+
                           ' FROM PRODUTOS '+
                           ' LEFT JOIN FORNECEDORES ON FORNEC_CODIGO = PRODUTO_CODFORNECEDOR '+
                           ' WHERE UPPER(PRODUTO_DESCRICAO) LIKE UPPER(:NOME)';
    fPesquisa.NomeFieldRetorno := 'PRODUTO_CODIGO';
    fPesquisa.Query := dmconexao.qryProduto;
    fPesquisa.ShowModal;
    Result := fPesquisa.CodigoRetorno;

    if (Result <> '') then
      Pesquisa(StrToIntDef(Result,0));
  finally
    fPesquisa.Free;
  end;
end;
////////////////////////////////////////////////////////////////////////////////

{ TBuscaFornecedor }
////////////////////////////////////////////////////////////////////////////////
procedure TBuscaFornecedor.Pesquisa(iCodigo : integer);
begin
  dmconexao.qryFornecedor.Close;
  dmconexao.qryFornecedor.SQL.Text := 'SELECT FORNEC_CODIGO, FORNEC_NOMEFANTASIA, FORNEC_RAZAOSOCIAL, FORNEC_CNPJ, FORNEC_STATUS FROM FORNECEDORES WHERE UPPER(FORNEC_CODIGO) = UPPER(:CODIGO)';
  dmconexao.qryFornecedor.Params[0].AsInteger := iCodigo;
  dmconexao.qryFornecedor.Params[0].DataType := ftInteger;
  dmconexao.qryFornecedor.Open;
end;

function TBuscaFornecedor.ConsultaBusca: string;
var
  fPesquisa : Tfrmpesquisa;
begin
  Result := '';
  fPesquisa := Tfrmpesquisa.Create(fcadcliente);
  try
    fPesquisa.SQLCodigo := 'SELECT FORNEC_CODIGO, FORNEC_NOMEFANTASIA, FORNEC_RAZAOSOCIAL, FORNEC_CNPJ, FORNEC_STATUS FROM FORNECEDORES WHERE UPPER(FORNEC_CODIGO) = UPPER(:CODIGO)';
    fPesquisa.SQLDesc  := 'SELECT FORNEC_CODIGO, FORNEC_NOMEFANTASIA, FORNEC_RAZAOSOCIAL, FORNEC_CNPJ, FORNEC_STATUS FROM FORNECEDORES WHERE UPPER(FORNEC_NOMEFANTASIA) LIKE UPPER(:NOME)';
    fPesquisa.NomeFieldRetorno := 'FORNEC_CODIGO';
    fPesquisa.Query := dmconexao.qryFornecedor;
    fPesquisa.ShowModal;
    Result := fPesquisa.CodigoRetorno;
    if (Result <> '') then
      Pesquisa(StrToIntDef(Result,0));

  finally
    fPesquisa.Free;
  end;
end;
////////////////////////////////////////////////////////////////////////////////

procedure Tdmconexao.qryClienteBeforePost(DataSet: TDataSet);
begin
  if (Length(qryCliente.FieldByName('CLIENTE_CPF').AsString) < 11) then
  begin
    ShowMessage('CPF dever ter 11 digitos');
    abort;
  end;

  if (trim(qryCliente.FieldByName('CLIENTE_NOME').AsString) = '') then
  begin
    ShowMessage('Cliente deve possuir um nome');
    abort;
  end;

  if (trim(qryCliente.FieldByName('CLIENTE_DATANASCIMENTO').AsString) = '') then
  begin
    ShowMessage('Cliente deve ter uma data de nascimento');
    abort;
  end;

  if (trim(qryCliente.FieldByName('CLIENTE_STATUS').AsString) = '') then
  begin
    ShowMessage('Cliente deve ter um Status');
    abort;
  end;

  qryValida.Close;
  qryValida.SQL.Text := ' SELECT * FROM CLIENTES '+
                           ' WHERE '+
                           ' CLIENTE_CPF LIKE  '+'''%' + qryCliente.FieldByName('CLIENTE_CPF').AsString + '%''';
  qryValida.Open;
  if not(qryValida.IsEmpty) then
  begin
    ShowMessage('CPF já cadastrado');
    abort;
  end;
end;

procedure Tdmconexao.qryClienteCLIENTE_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 'A' then
    Text := 'Ativo'
  else if Sender.Value = 'I' then
    Text := 'Inativo';
end;

procedure Tdmconexao.qryFornecedorBeforePost(DataSet: TDataSet);
begin
  if (Length(qryFornecedor.FieldByName('FORNEC_CNPJ').AsString) < 14) then
  begin
    ShowMessage('CPF dever ter 14 digitos');
    abort;
  end;

  if (trim(qryFornecedor.FieldByName('FORNEC_NOMEFANTASIA').AsString) = '') then
  begin
    ShowMessage('Fornecedor deve possuir um nome fantasia');
    abort;
  end;

  if (trim(qryFornecedor.FieldByName('FORNEC_RAZAOSOCIAL').AsString) = '') then
  begin
    ShowMessage('Fornecedor deve possuir uma razão social');
    abort;
  end;

  if (trim(qryFornecedor.FieldByName('FORNEC_STATUS').AsString) = '') then
  begin
    ShowMessage('Fornecedor deve ter um Status');
    abort;
  end;

  qryValida.Close;
  qryValida.SQL.Text := ' SELECT * FROM FORNECEDORES '+
                           ' WHERE '+
                           ' FORNEC_CNPJ LIKE  '+'''%' + stringreplace(stringreplace(qryFornecedor.FieldByName('FORNEC_CNPJ').AsString,'.','',[rfReplaceAll]),'.','',[rfReplaceAll]) + '%''';
  qryValida.Open;
  if not(qryValida.IsEmpty) then
  begin
    ShowMessage('CNPJ já cadastrado');
    abort;
  end;
end;

procedure Tdmconexao.qryFornecedorFORNEC_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 'A' then
    Text := 'Ativo'
  else if Sender.Value = 'I' then
    Text := 'Inativo';
end;

procedure Tdmconexao.qryProdutoBeforePost(DataSet: TDataSet);
begin
  if (trim(qryProduto.FieldByName('PRODUTO_DESCRICAO').AsString)  = '') then
  begin
    ShowMessage('Produto deve ter uma descrição.');
    abort;
  end;

  if (trim(qryProduto.FieldByName('PRODUTO_PRECOUNITARIO').AsString)  = '') then
  begin
    ShowMessage('Produto deve ter um preço unitário.');
    abort;
  end;

  if (trim(qryProduto.FieldByName('PRODUTO_CODFORNECEDOR').AsString)  = '') then
  begin
    ShowMessage('Produto deve ter um Fornecedor.');
    abort;
  end;

  if (trim(qryProduto.FieldByName('PRODUTO_STATUS').AsString)  = '') then
  begin
    ShowMessage('Produto deve ter um Status.');
    abort;
  end;
end;

procedure Tdmconexao.qryProdutoPRODUTO_CODFORNECEDORValidate(Sender: TField);
begin
  if (trim(Sender.AsString) <> '') then
  begin
    qryValida.Close;
    qryValida.SQL.Text := ' SELECT * FROM FORNECEDORES '+
                             ' WHERE '+
                             ' FORNEC_CODIGO =  '+Sender.AsString +
                             ' AND FORNEC_STATUS = ''A'' ';
    qryValida.Open;
    if not(qryValida.IsEmpty) then
    begin
      qryProdutoFORNEC_NOMEFANTASIA.AsString := qryValida.FieldByName('FORNEC_NOMEFANTASIA').AsString;
    end
    else
    begin
      qryProdutoFORNEC_NOMEFANTASIA.Clear;
      ShowMessage('Fornecedor não cadastrado ou inativo');
      abort;
    end;
  end;
end;

procedure Tdmconexao.qryProdutoPRODUTO_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 'A' then
    Text := 'Ativo'
  else if Sender.Value = 'I' then
    Text := 'Inativo';
end;

procedure Tdmconexao.qryVendaBeforePost(DataSet: TDataSet);
begin
  if (trim(qryVenda.FieldByName('VENDA_CODCLIENTE').AsString)  = '') then
  begin
    ShowMessage('Venda deve ter um cliente.');
    abort;
  end;

  if (trim(qryVenda.FieldByName('VENDA_DATAHORA').AsString)  = '') then
  begin
    ShowMessage('Venda deve possuir data e hora.');
    abort;
  end;

  if (trim(qryVenda.FieldByName('VENDA_SATUS').AsString)  = '') then
  begin
    ShowMessage('Venda deve ter um Status.');
    abort;
  end;

end;

procedure Tdmconexao.carregaClientes;
begin
  qryClientesRel.Close;
  qryClientesRel.SQL.Text := ' SELECT * FROM CLIENTES ';
  qryClientesRel.Open;
end;

procedure Tdmconexao.carregaVendas(iCodCliente : Integer);
begin
  qryVenda.Close;
  qryVenda.SQL.Text := ' SELECT VD.*, CLIENTE_NOME FROM VENDAS VD '+
                       ' LEFT JOIN CLIENTES ON CLIENTE_CODIGO = VD.VENDA_CODCLIENTE '+
                       ' WHERE '+
                       ' VD.VENDA_CODCLIENTE = :CODIGO';
  qryVenda.Params[0].AsInteger := iCodCliente;
  qryVenda.Open;
end;

procedure Tdmconexao.qryVendaItensNewRecord(DataSet: TDataSet);
begin
  qryVendaItensVENDAITEM_CODVENDA.AsInteger := qryVendaVENDA_CODIGO.AsInteger;
end;

procedure Tdmconexao.qryVendaItensVENDAITEM_CODPRODUTOValidate(Sender: TField);
begin
  if (trim(Sender.AsString) <> '') then
  begin
    qryValida.Close;
    qryValida.SQL.Text := ' SELECT * FROM PRODUTOS '+
                          ' WHERE '+
                          ' PRODUTO_CODIGO =  '+Sender.AsString +
                          ' AND PRODUTO_STATUS = ''A'' ';
    qryValida.Open;
    if not(qryValida.IsEmpty) then
    begin
      qryVendaItensPRODUTO_DESCRICAO.AsString     := qryValida.FieldByName('PRODUTO_DESCRICAO').AsString;
      qryVendaItensPRODUTO_PRECOUNITARIO.AsString := qryValida.FieldByName('PRODUTO_PRECOUNITARIO').AsString;
      qryVendaItensPRODUTO_CODFORNECEDOR.AsString := qryValida.FieldByName('PRODUTO_CODFORNECEDOR').AsString;
    end
    else
    begin
      qryVendaItensPRODUTO_DESCRICAO.Clear;
      qryVendaItensPRODUTO_PRECOUNITARIO.Clear;
      qryVendaItensPRODUTO_CODFORNECEDOR.Clear;
      ShowMessage('Produto não cadastrado ou inativo');
      abort;
    end;
  end;
end;

procedure Tdmconexao.qryVendaItensVENDAITEM_QTDVENDIDAValidate(Sender: TField);
begin
  if (Sender.AsInteger > 0) and (qryVendaItensPRODUTO_PRECOUNITARIO.AsFloat > 0) then
  begin
    qryVendaItensVENDAITEM_VALORTOTAL.AsFloat := Sender.AsFloat * qryVendaItensPRODUTO_PRECOUNITARIO.AsFloat;
  end
  else
    qryVendaItensVENDAITEM_VALORTOTAL.Clear;

end;

procedure Tdmconexao.qryVendaNewRecord(DataSet: TDataSet);
begin
  qryValida.Close;
  qryValida.SQL.Text := ' SELECT MAX(VENDA_CODIGO) as CODIGO FROM VENDAS ';
  qryValida.Open;
  if not(qryValida.IsEmpty) then
    qryVendaVENDA_CODIGO.AsInteger := qryValida.FieldByName('CODIGO').AsInteger + 1
  else
    qryVendaVENDA_CODIGO.AsInteger := 1;

  qryVendaVENDA_DATAHORA.AsString := FormatDateTime('dd/mm/yyyy hh:MM:ss', Now);
end;

procedure Tdmconexao.qryVendaVENDA_CODCLIENTEValidate(Sender: TField);
begin
  if (trim(Sender.AsString) <> '') then
  begin
    qryValida.Close;
    qryValida.SQL.Text := ' SELECT * FROM CLIENTES '+
                          ' WHERE '+
                          ' CLIENTE_CODIGO =  '+Sender.AsString +
                          ' AND CLIENTE_STATUS = ''A'' ';
    qryValida.Open;
    if not(qryValida.IsEmpty) then
    begin
      qryVendaCLIENTE_NOME.AsString := qryValida.FieldByName('CLIENTE_NOME').AsString;
    end
    else
    begin
      qryVendaCLIENTE_NOME.Clear;
      ShowMessage('Cliente não cadastrado ou inativo');
      abort;
    end;
  end;
end;

procedure Tdmconexao.qryVendaVENDA_SATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 'P' then
    Text := 'Pendente'
  else if Sender.Value = 'E' then
    Text := 'Efetivada';
end;

end.
