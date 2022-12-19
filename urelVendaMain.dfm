object frelVendaMain: TfrelVendaMain
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Venda por Cliente'
  ClientHeight = 135
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblCliente: TLabel
    Left = 24
    Top = 8
    Width = 78
    Height = 13
    Caption = 'C'#243'dio do Cliente'
  end
  object Button1: TButton
    Left = 192
    Top = 88
    Width = 129
    Height = 25
    Caption = 'Gerar Relat'#243'rio'
    TabOrder = 0
    OnClick = Button1Click
  end
  object EditCliente: TEdit
    Left = 24
    Top = 24
    Width = 97
    Height = 21
    TabOrder = 1
  end
end
