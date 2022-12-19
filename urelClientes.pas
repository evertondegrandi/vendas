unit urelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, udmconexao;

type
  TfrelClientes = class(TForm)
    RLReportCliente: TRLReport;
    RLBand1: TRLBand;
    RLLabelClientes: TRLLabel;
    RLBand2: TRLBand;
    RLLabelCodigoVenda: TRLLabel;
    RLLabelCliente: TRLLabel;
    RLLabelStatus: TRLLabel;
    RLLabelDataHora: TRLLabel;
    RLDBTextCodigoVenda: TRLDBText;
    RLDBTextCliente: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBTextdataHora: TRLDBText;
    RLDBText2: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelClientes: TfrelClientes;

implementation

{$R *.dfm}


end.
