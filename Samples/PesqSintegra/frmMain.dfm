object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 197
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 22
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object Edit1: TEdit
    Left = 35
    Top = 41
    Width = 259
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 129
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object cbEscolha: TRzComboBox
    Left = 35
    Top = 88
    Width = 259
    Height = 21
    TabOrder = 2
    Text = 'Amap'#225
    Items.Strings = (
      'Amap'#225
      'Tocantins'
      'Maranh'#227'o'
      'Piau'#237
      'S'#227'o Paulo'
      'Rio Grande do Norte'
      'Para'#237'ba'
      'Pernambuco'
      'Alagoas'
      'Sergipe'
      'Minas Gerais'
      'Goi'#225's'
      'Rond'#244'nia'
      'Acre'
      'Amazonas'
      'Roraima'
      'Par'#225
      'Cear'#225
      'Bahia'
      'Esp'#237'rito Santo'
      'Rio de Janeiro'
      'Paran'#225
      'Santa Catarina'
      'Rio Grande do Sul'
      'Mato Grosso do Sul'
      'Mato Grosso'
      'Distrito Federal'
      'Receita Federal')
    ItemIndex = 0
    Values.Strings = (
      'AP'
      'TO'
      'MA'
      'PI'
      'SP'
      'RN'
      'PB'
      'PE'
      'AL'
      'SE'
      'MG'
      'GO'
      'RO'
      'AC'
      'AM'
      'RR'
      'PA'
      'CE'
      'BA'
      'ES'
      'RJ'
      'PR'
      'SC'
      'RS'
      'MS'
      'MT'
      'DF'
      'RECEITA')
  end
end
