unit uvenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastromodelo, Vcl.DBActns,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, udmconexao;

type
  Tfvenda = class(Tfcadastromodelo)
    dbgItens: TDBGrid;
    lblCodigo: TLabel;
    dbeCodigo: TDBEdit;
    lblCliente: TLabel;
    dbeCliente: TDBEdit;
    Label3: TLabel;
    dbeNome: TDBEdit;
    lblDataHora: TLabel;
    dbeDataHora: TDBEdit;
    Label5: TLabel;
    comboStatus: TDBComboBox;
    dbeTotalVenda: TDBEdit;
    procedure botaoPesquisarClick(Sender: TObject);
    procedure botaoGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure botaoDeletarClick(Sender: TObject);
    procedure comboStatusChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Verificavisibilidade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fvenda: Tfvenda;

implementation

{$R *.dfm}

uses urelvenda;

procedure Tfvenda.botaoDeletarClick(Sender: TObject);
begin
  inherited;
  if not(dbeCliente.Enabled) then
  begin
    ShowMessage('Não é possivel excluir venda efetivada.');
    abort;
  end;
end;

procedure Tfvenda.botaoGravarClick(Sender: TObject);
begin
  inherited;
  dmConexao.commit;
  Verificavisibilidade;
end;

procedure Tfvenda.botaoPesquisarClick(Sender: TObject);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
  sCodigo : String;
begin
  inherited;

  // instancia a fábrica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  // obtém o produto, baseado no parâmetro informado
  fBusca := FabricaBusca.CriaBusca('Venda');
  sCodigo := fBusca.ConsultaBusca;
  Verificavisibilidade;
end;

procedure Tfvenda.Button1Click(Sender: TObject);
begin
  inherited;
  dmconexao.commit;
end;

procedure Tfvenda.comboStatusChange(Sender: TObject);
begin
  inherited;
  Verificavisibilidade;
end;

procedure Tfvenda.FormShow(Sender: TObject);
begin
  inherited;
  Verificavisibilidade;
end;

procedure Tfvenda.Verificavisibilidade;
begin
  if (comboStatus.ItemIndex = 1) then
  begin
    dbeCliente.Enabled  := False;
    dbeNome.Enabled     := False;
    dbeDataHora.Enabled := False;
    dbgItens.Enabled    := False;
  end
  else
  begin
    dbeCliente.Enabled  := True;
    dbeNome.Enabled     := True;
    dbeDataHora.Enabled := True;
    dbgItens.Enabled    := True;
  end;
end;
end.
