object frelVenda: TfrelVenda
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 554
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
  object RLReportVenda: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dmconexao.srcconexao
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
      object RLLabel1: TRLLabel
        Left = 324
        Top = 26
        Width = 70
        Height = 22
        Align = faCenter
        Alignment = taCenter
        Caption = 'Vendas'
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
        Width = 89
        Height = 16
        Caption = 'C'#243'digo Venda:'
      end
      object RLLabelCliente: TRLLabel
        Left = 16
        Top = 48
        Width = 48
        Height = 16
        Caption = 'Cliente:'
      end
      object RLLabelStatus: TRLLabel
        Left = 264
        Top = 16
        Width = 46
        Height = 16
        Caption = 'Status:'
      end
      object RLLabelDataHora: TRLLabel
        Left = 480
        Top = 16
        Width = 77
        Height = 16
        Caption = 'Data e Hora:'
      end
      object RLDBTextCodigoVenda: TRLDBText
        Left = 111
        Top = 16
        Width = 85
        Height = 16
        DataField = 'VENDA_CODIGO'
        DataSource = dmconexao.srcconexao
        Text = ''
      end
      object RLDBTextCliente: TRLDBText
        Left = 70
        Top = 48
        Width = 44
        Height = 16
        DataField = 'VENDA_CODCLIENTE'
        DataSource = dmconexao.srcconexao
        Text = ''
      end
      object RLDBText1: TRLDBText
        Left = 316
        Top = 16
        Width = 42
        Height = 16
        DataField = 'VENDA_SATUS'
        DataSource = dmconexao.srcconexao
        Text = ''
      end
      object RLDBTextdataHora: TRLDBText
        Left = 560
        Top = 16
        Width = 62
        Height = 16
        DataField = 'VENDA_DATAHORA'
        DataSource = dmconexao.srcconexao
        Text = ''
      end
      object RLDBTextDescCliente: TRLDBText
        Left = 135
        Top = 48
        Width = 38
        Height = 16
        DataField = 'CLIENTE_NOME'
        DataSource = dmconexao.srcconexao
        Text = ''
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 193
      Width = 718
      Height = 152
      AllowedBands = [btDetail, btSummary]
      DataSource = dmconexao.srcconexaItens
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 81
        object RLLabelCodProd: TRLLabel
          Left = 16
          Top = 16
          Width = 53
          Height = 16
          Caption = 'Produto:'
        end
        object RLLabelFornec: TRLLabel
          Left = 408
          Top = 16
          Width = 117
          Height = 16
          Caption = 'C'#243'digo Fornecedor:'
        end
        object RLLabel2: TRLLabel
          Left = 16
          Top = 46
          Width = 90
          Height = 16
          Caption = 'Pre'#231'o Unit'#225'rio:'
        end
        object RLLabel3: TRLLabel
          Left = 268
          Top = 46
          Width = 74
          Height = 16
          Caption = 'Quantidade:'
        end
        object RLLabel4: TRLLabel
          Left = 491
          Top = 46
          Width = 70
          Height = 16
          Caption = 'Valor Total:'
        end
        object RLDBText2: TRLDBText
          Left = 75
          Top = 16
          Width = 93
          Height = 16
          DataField = 'VENDAITEM_CODPRODUTO'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 174
          Top = 16
          Width = 204
          Height = 16
          DataField = 'PRODUTO_DESCRICAO'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 531
          Top = 16
          Width = 113
          Height = 16
          DataField = 'PRODUTO_CODFORNECEDOR'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 112
          Top = 46
          Width = 86
          Height = 16
          DataField = 'PRODUTO_PRECOUNITARIO'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 348
          Top = 46
          Width = 70
          Height = 16
          DataField = 'VENDAITEM_QTDVENDIDA'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 567
          Top = 46
          Width = 66
          Height = 16
          DataField = 'VENDAITEM_VALORTOTAL'
          DataSource = dmconexao.srcconexaItens
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 81
        Width = 718
        Height = 48
        BandType = btSummary
        object RllalebTotvenda: TRLLabel
          Left = 16
          Top = 21
          Width = 95
          Height = 16
          Caption = 'Total da Venda:'
        end
        object RLDBResult1: TRLDBResult
          Left = 117
          Top = 21
          Width = 105
          Height = 16
          DataField = 'VENDAITEM_VALORTOTAL'
          DataSource = dmconexao.srcconexaItens
          Info = riSum
          Text = ''
        end
      end
    end
  end
end
