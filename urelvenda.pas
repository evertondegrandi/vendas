unit urelvenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uvenda, RLReport, udmconexao;

type
  TfrelVenda = class(TForm)
    RLReportVenda: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabelCodigoVenda: TRLLabel;
    RLLabelCliente: TRLLabel;
    RLLabelStatus: TRLLabel;
    RLLabelDataHora: TRLLabel;
    RLDBTextCodigoVenda: TRLDBText;
    RLDBTextCliente: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBTextdataHora: TRLDBText;
    RLDBTextDescCliente: TRLDBText;
    RLSubDetail1: TRLSubDetail;
    RLBand3: TRLBand;
    RLLabelCodProd: TRLLabel;
    RLLabelFornec: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RllalebTotvenda: TRLLabel;
    RLDBResult1: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frelVenda: TfrelVenda;

implementation

{$R *.dfm}

end.
