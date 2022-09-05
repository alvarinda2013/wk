inherited FormBuscaPedidos: TFormBuscaPedidos
  ActiveControl = edtPesquisa
  Caption = 'FormBuscaPedidos'
  ClientHeight = 132
  ClientWidth = 282
  ExplicitWidth = 282
  ExplicitHeight = 132
  TextHeight = 14
  inherited imgLixeira24: TImage
    Left = 8
    Top = 85
    ExplicitLeft = 8
    ExplicitTop = 85
  end
  inherited pnlTitulo: TPanel
    Width = 282
    Caption = '  -  N'#250'mero do pedido'
    inherited imgFechar: TImage
      Left = 254
    end
  end
  inherited Panel1: TPanel
    Top = 91
    Width = 282
    inherited btnFechar: TButton
      Left = 147
      TabOrder = 1
    end
    inherited btnConfirmar: TButton
      Left = 10
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
  end
  object edtPesquisa: TButtonedEdit
    Left = 32
    Top = 52
    Width = 233
    Height = 22
    Images = dm.ImageList1
    NumbersOnly = True
    RightButton.DisabledImageIndex = 29
    RightButton.HotImageIndex = 28
    RightButton.ImageIndex = 29
    RightButton.Visible = True
    TabOrder = 2
  end
end
