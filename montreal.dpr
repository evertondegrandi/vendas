program montreal;

uses
  Vcl.Forms,
  umain in 'umain.pas' {fumain},
  udmconexao in 'udmconexao.pas' {dmconexao: TDataModule},
  ucadastromodelo in 'ucadastromodelo.pas' {fcadastromodelo},
  ucadcliente in 'ucadcliente.pas' {fcadcliente},
  upesquisa in 'upesquisa.pas' {frmpesquisa},
  ucadfornecedor in 'ucadfornecedor.pas' {fcadfornecedor},
  ucadproduto in 'ucadproduto.pas' {fcadproduto},
  uvenda in 'uvenda.pas' {fvenda},
  urelvenda in 'urelvenda.pas' {frelVenda},
  urelVendaMain in 'urelVendaMain.pas' {frelVendaMain},
  urelClientes in 'urelClientes.pas' {frelClientes},
  urelClientesMain in 'urelClientesMain.pas' {frelClientesMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmain, fmain);
  Application.CreateForm(Tfcadcliente, fcadcliente);
  Application.CreateForm(Tdmconexao, dmconexao);
  Application.CreateForm(Tfcadastromodelo, fcadastromodelo);
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  Application.CreateForm(Tfcadfornecedor, fcadfornecedor);
  Application.CreateForm(Tfcadproduto, fcadproduto);
  Application.CreateForm(Tfvenda, fvenda);
  Application.CreateForm(TfrelVenda, frelVenda);
  Application.CreateForm(TfrelVendaMain, frelVendaMain);
  Application.CreateForm(TfrelClientes, frelClientes);
  Application.CreateForm(TfrelClientesMain, frelClientesMain);
  Application.Run;
end.
