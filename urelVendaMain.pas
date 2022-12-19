unit urelVendaMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrelVendaMain = class(TForm)
    Button1: TButton;
    EditCliente: TEdit;
    lblCliente: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelVendaMain: TfrelVendaMain;

implementation

{$R *.dfm}

uses udmconexao, urelvenda;

procedure TfrelVendaMain.Button1Click(Sender: TObject);
begin
  dmconexao.carregaVendas(strtointdef(EditCliente.Text,0));
  frelVenda.RLReportVenda.preview;
end;

end.
