unit upesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TfrmPesquisa = class(TForm)
    dsSQL: TDataSource;
    DBGrid1: TDBGrid;
    edtBusca: TEdit;
    btnPesquisa: TButton;
    lbl_texto: TLabel;
    rdg_filtro: TRadioGroup;
    botaoselecionar: TButton;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure botaoselecionarClick(Sender: TObject);
  private
    { Private declarations }
    FQuery : TFDQuery;
    FSQLCodigo   : String;
    FSQLDesc     : String;
    FCodigoRetorno : String;
    NameFieldRetorno : String;
    FNameFieldRetorno: String;
    procedure SetQuery(const Value: TFDQuery);
    procedure SetSQLCodigo(const Value: String);
    procedure SetFSQLDesc(const Value: String);
    procedure SetFCodigoRetorno(const Value: String);
    procedure setFNameFieldRetorno(const Value: String);
  public
    property Query : TFDQuery read FQuery write SetQuery;
    property SQLCodigo   : String read FSQLCodigo  write SetSQLCodigo;
    property SQLDesc   : String read FSQLDesc  write SetFSQLDesc;
    property CodigoRetorno : String read FCodigoRetorno  write SetFCodigoRetorno;
    property NomeFieldRetorno : String read FNameFieldRetorno write setFNameFieldRetorno;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

{ TfrmPesquisa }

procedure TfrmPesquisa.botaoselecionarClick(Sender: TObject);
begin
  FCodigoRetorno := Query.FieldByName(FNameFieldRetorno).AsString;
  Close;
end;

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
begin
  FQuery.Close;
  if (rdg_filtro.ItemIndex = 0) then
  begin
    FQuery.SQL.Text := FSQLCodigo;
    FQuery.Params[0].AsInteger := StrToIntDef(edtBusca.Text,0);
    FQuery.Params[0].DataType := ftInteger;
  end
  else
  begin
    FQuery.SQL.Text := FSQLDesc;
    FQuery.Params[0].AsString := '%' + edtBusca.Text + '%';
    FQuery.Params[0].DataType := ftString;
  end;
  FQuery.Open;
end;

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmPesquisa.SetFCodigoRetorno(const Value: String);
begin
  FCodigoRetorno := Value;
end;

procedure TfrmPesquisa.setFNameFieldRetorno(const Value: String);
begin
  FNameFieldRetorno := Value;
end;

procedure TfrmPesquisa.SetFSQLDesc(const Value: String);
begin
  FSQLDesc := Value;
end;

procedure TfrmPesquisa.SetQuery(const Value: TFDQuery);
begin
  if FQuery <> Value then
  begin
    FQuery := Value;
    dsSQL.DataSet := FQuery;
  end;
end;


procedure TfrmPesquisa.SetSQLCodigo(const Value: String);
begin
  FSQLCodigo := Value;
end;

end.