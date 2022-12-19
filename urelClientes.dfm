object frelClientes: TfrelClientes
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 595
  ClientWidth = 807
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportCliente: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dmconexao.srcCLientesRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabelClientes: TRLLabel
        Left = 322
        Top = 26
        Width = 74
        Height = 22
        Align = faCenter
        Alignment = taCenter
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 80
      object RLLabelCodigoVenda: TRLLabel
        Left = 16
        Top = 16
        Width = 48
        Height = 16
        Caption = 'Cliente:'
      end
      object RLLabelCliente: TRLLabel
        Left = 16
        Top = 48
        Width = 108
        Height = 16
        Caption = 'Data Nascimento:'
      end
      object RLLabelStatus: TRLLabel
        Left = 408
        Top = 46
        Width = 46
        Height = 16
        Caption = 'Status:'
      end
      object RLLabelDataHora: TRLLabel
        Left = 408
        Top = 16
        Width = 34
        Height = 16
        Caption = 'CPF:'
      end
      object RLDBTextCodigoVenda: TRLDBText
        Left = 71
        Top = 16
        Width = 115
        Height = 16
        DataField = 'CLIENTE_CODIGO'
        DataSource = dmconexao.srcCLientesRel
        Text = ''
      end
      object RLDBTextCliente: TRLDBText
        Left = 134
        Top = 48
        Width = 104
        Height = 16
        DataField = 'CLIENTE_DATANASCIMENTO'
        DataSource = dmconexao.srcCLientesRel
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 460
        Top = 46
        Width = 42
        Height = 16
        DataField = 'CLIENTE_STATUS'
        DataSource = dmconexao.srcCLientesRel
        Text = ''
      end
      object RLDBTextdataHora: TRLDBText
        Left = 448
        Top = 16
        Width = 30
        Height = 16
        DataField = 'CLIENTE_CPF'
        DataSource = dmconexao.srcCLientesRel
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 199
        Top = 16
        Width = 38
        Height = 16
        DataField = 'CLIENTE_NOME'
        DataSource = dmconexao.srcCLientesRel
        Text = ''
      end
    end
  end
end
