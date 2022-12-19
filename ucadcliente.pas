unit ucadcliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ucadastromodelo, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.DBActns, System.Actions, Vcl.ActnList, udmconexao;

type
  Tfcadcliente = class(Tfcadastromodelo{,ITipoBusca})
    editNome: TDBEdit;
    lblCod: TLabel;
    lblNome: TLabel;
    dbeCPF: TDBEdit;
    dbeData: TDBEdit;
    lblCPF: TLabel;
    lblDataNasc: TLabel;
    comboStatus: TDBComboBox;
    lblStatus: TLabel;
    DBEdit1: TDBEdit;
    srcConexao: TDataSource;
    procedure botaoPesquisarClick(Sender: TObject);
  private
    { Private declarations }
//    function PreparaBusca : IQuery;
  public
    { Public declarations }
  end;

var
  fcadcliente: Tfcadcliente;

implementation

{$R *.dfm}

procedure Tfcadcliente.botaoPesquisarClick(Sender: TObject);
var
  FabricaBusca: IFactoryMethod;
  fBusca : ITipoBusca;
  sCodigo : String;
begin
  inherited;

  // instancia a f�brica (Factory Method)
  FabricaBusca := TFabricaBuscas.Create;
  // obt�m o produto, baseado no par�metro informado
  fBusca := FabricaBusca.CriaBusca('Cliente');
  sCodigo := fBusca.ConsultaBusca;
  srcConexao.DataSet.Refresh;
end;

end.
