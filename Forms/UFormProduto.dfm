inherited FormProduto: TFormProduto
  Caption = 'FormProduto'
  ClientHeight = 320
  ExplicitHeight = 320
  TextHeight = 14
  inherited pnlTitulo: TPanel
    Caption = '  -  Produtos'
  end
  inherited Panel1: TPanel
    Top = 279
    ExplicitTop = 279
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 612
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Color = 14474460
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 616
    object cbPesquisa: TComboBox
      Left = 8
      Top = 10
      Width = 137
      Height = 22
      ItemIndex = 0
      TabOrder = 0
      Text = 'Nome'
      Items.Strings = (
        'Nome'
        'C'#243'digo'
        'Cidade')
    end
    object edtPesquisa: TButtonedEdit
      Left = 151
      Top = 10
      Width = 320
      Height = 22
      Images = dm.ImageList1
      RightButton.DisabledImageIndex = 29
      RightButton.HotImageIndex = 28
      RightButton.ImageIndex = 29
      RightButton.Visible = True
      TabOrder = 1
    end
  end
  object Lista: TListBox
    Left = 0
    Top = 81
    Width = 612
    Height = 198
    Style = lbOwnerDrawVariable
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ItemHeight = 24
    TabOrder = 3
  end
end
