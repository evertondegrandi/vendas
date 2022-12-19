unit urelClientesMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,urelClientes;

type
  TfrelClientesMain = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelClientesMain: TfrelClientesMain;

implementation

{$R *.dfm}

uses udmconexao;

procedure TfrelClientesMain.Button1Click(Sender: TObject);
begin
  dmconexao.carregaClientes;
  frelClientes.RLReportCliente.preview;
end;

end.
