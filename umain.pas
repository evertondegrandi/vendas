unit umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, ucadcliente, ucadfornecedor, ucadProduto,
  uvenda,urelClientesMain;

type
  Tfmain = class(TForm)
    MainMenuGeral: TMainMenu;
    Cadastros1: TMenuItem;
    menu_vendas: TMenuItem;
    Relatrios1: TMenuItem;
    menu_relclientes: TMenuItem;
    menu_relVendas: TMenuItem;
    menu_clientes: TMenuItem;
    menu_fornecedores: TMenuItem;
    menu_produtos: TMenuItem;
    panel_background: TPanel;
    procedure menu_clientesClick(Sender: TObject);
    procedure menu_fornecedoresClick(Sender: TObject);
    procedure menu_produtosClick(Sender: TObject);
    procedure menu_vendasClick(Sender: TObject);
    procedure menu_relVendasClick(Sender: TObject);
    procedure menu_relclientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmain: Tfmain;

implementation

{$R *.dfm}

uses urelVendaMain;

procedure Tfmain.menu_clientesClick(Sender: TObject);
var
  formcadclientes : Tfcadcliente;
begin
  formcadclientes := Tfcadcliente.Create(Self);
  try
    formcadclientes.ShowModal;

  finally
    formcadclientes.Free;
  end;

end;

procedure Tfmain.menu_fornecedoresClick(Sender: TObject);
var
  formcadfornecedore : Tfcadfornecedor;
begin
  formcadfornecedore := Tfcadfornecedor.Create(Self);
  try
    formcadfornecedore.ShowModal;

  finally
    formcadfornecedore.Free;
  end;
end;

procedure Tfmain.menu_produtosClick(Sender: TObject);
var
  formcadProduto : Tfcadproduto;
begin
  formcadProduto := Tfcadproduto.Create(Self);
  try
    formcadProduto.ShowModal;

  finally
    formcadProduto.Free;
  end;
end;

procedure Tfmain.menu_relclientesClick(Sender: TObject);
var
  frelClientesRel : TfrelClientesMain;
begin
  frelClientesRel := TfrelClientesMain.Create(Self);
  try
    frelClientesRel.ShowModal;

  finally
    frelClientesRel.Free;
  end;
end;

procedure Tfmain.menu_relVendasClick(Sender: TObject);
var
  frelVenda : TfrelVendaMain;
begin
  frelVenda := TfrelVendaMain.Create(Self);
  try
    frelVenda.ShowModal;

  finally
    frelVenda.Free;
  end;
end;

procedure Tfmain.menu_vendasClick(Sender: TObject);
var
  formvenda : Tfvenda;
begin
  formvenda := Tfvenda.Create(Self);
  try
    formvenda.ShowModal;

  finally
    formvenda.Free;
  end;
end;

end.
