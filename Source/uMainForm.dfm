object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Button1: TButton
    Left = 72
    Top = 64
    Width = 105
    Height = 25
    Caption = 'getCustomers'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 72
    Top = 112
    Width = 281
    Height = 161
    ItemHeight = 15
    TabOrder = 1
  end
  object Button2: TButton
    Left = 400
    Top = 64
    Width = 123
    Height = 25
    Caption = 'getCustomerDict'
    TabOrder = 2
    OnClick = Button2Click
  end
  object SearchBox1: TSearchBox
    Left = 400
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 3
    TextHint = 'Cust No'
    OnInvokeSearch = SearchBox1InvokeSearch
  end
end
