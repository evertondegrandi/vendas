unit ucadproduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastromodelo, Vcl.DBActns,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, udmconexao;

type
  Tfcadproduto = class(Tfcadastromodelo)
    lblCodigo: TLabel;
    dbeCOdigo: TDBEdit;
    srcconexao: TDataSource;
    lblDesc: TLabel;
    dbeDesc: TDBEdit;
    lblPreco: TLabel;
    dbePreco: TDBEdit;
    lblFornec: TLabel;
    dbeFornec: TDBEdit;
    lblStatus: TLabel;
    Label6: TLabel;
    dbeDescFornec: TDBEdit;
    comboStatus: TDBComboBox;
    procedure botaoPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fcadproduto: Tfcadproduto;

implementation

{$R *.dfm}

procedure Tfcadproduto.botaoPesquisarClick(Sender: TObject);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
  sCodigo : String;
begin
  inherited;

  // instancia a fábrica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  // obtém o produto, baseado no parâmetro informado
  fBusca := FabricaBusca.CriaBusca('Produto');
  sCodigo := fBusca.ConsultaBusca;
end;

end.
