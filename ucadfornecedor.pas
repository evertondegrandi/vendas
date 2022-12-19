unit ucadfornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastromodelo, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, udmconexao;

type
  Tfcadfornecedor = class(Tfcadastromodelo)
    lbl_codio: TLabel;
    dbeCodigo: TDBEdit;
    lblnomefantasia: TLabel;
    dbenomefantasia: TDBEdit;
    lblRazaosocial: TLabel;
    dberazao: TDBEdit;
    lblCNPJ: TLabel;
    dbeCNPJ: TDBEdit;
    lblstatus: TLabel;
    comboStatus: TDBComboBox;
    srcConexao: TDataSource;
    procedure botaoPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadfornecedor: Tfcadfornecedor;

implementation

{$R *.dfm}

procedure Tfcadfornecedor.botaoPesquisarClick(Sender: TObject);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
  sCodigo : String;
begin
  inherited;

  // instancia a fábrica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  // obtém o produto, baseado no parâmetro informado
  fBusca := FabricaBusca.CriaBusca('Fornecedor');
  sCodigo := fBusca.ConsultaBusca;
end;

end.
