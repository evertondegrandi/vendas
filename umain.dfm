object fmain: Tfmain
  Left = 0
  Top = 0
  Caption = 'Montreal  teste'
  ClientHeight = 488
  ClientWidth = 1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuGeral
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panel_background: TPanel
    Left = 0
    Top = 0
    Width = 1054
    Height = 488
    Align = alClient
    BevelOuter = bvNone
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 733
    ExplicitHeight = 478
  end
  object MainMenuGeral: TMainMenu
    Left = 248
    Top = 144
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object menu_clientes: TMenuItem
        Caption = 'Clientes'
        OnClick = menu_clientesClick
      end
      object menu_fornecedores: TMenuItem
        Caption = 'Fornecedores'
        OnClick = menu_fornecedoresClick
      end
      object menu_produtos: TMenuItem
        Caption = 'Produtos'
        OnClick = menu_produtosClick
      end
    end
    object menu_vendas: TMenuItem
      Caption = 'Vendas'
      OnClick = menu_vendasClick
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object menu_relclientes: TMenuItem
        Caption = 'Clientes'
        OnClick = menu_relclientesClick
      end
      object menu_relVendas: TMenuItem
        Caption = 'Vendas por Clientes'
        OnClick = menu_relVendasClick
      end
    end
  end
end
