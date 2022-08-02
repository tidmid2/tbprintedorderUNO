object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 117
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 48
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'alter table tbprinted_order drop constraint fk_tbprinted_order_1' +
        ';')
    Left = 72
    Top = 24
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    Left = 136
    Top = 24
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'ALTER TABLE TBPRINTED_ORDER'
      'ADD CONSTRAINT FK_TBPRINTED_ORDER_1'
      'FOREIGN KEY (IDPRODUCT)'
      'REFERENCES TBMENU(ID)'
      'ON DELETE SET NULL'
      'USING INDEX FK_TBPRINTED_ORDER_1;')
    Left = 136
    Top = 88
  end
end
