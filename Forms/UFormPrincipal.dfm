inherited FormPrincipal: TFormPrincipal
  ActiveControl = edtCodigo
  Caption = 'FormPrincipal'
  ClientHeight = 451
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'Segoe UI'
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  ExplicitWidth = 566
  ExplicitHeight = 451
  TextHeight = 15
  inherited imgLixeira24: TImage
    Left = 552
    Top = 39
    ExplicitLeft = 552
    ExplicitTop = 39
  end
  inherited pnlTitulo: TPanel
    Width = 566
    Caption = '  -  Vendas'
    ExplicitWidth = 566
    inherited imgFechar: TImage
      Left = 542
      Top = 7
      ExplicitLeft = 476
      ExplicitTop = 7
    end
  end
  inherited Panel1: TPanel
    Top = 410
    Width = 566
    ExplicitTop = 410
    ExplicitWidth = 566
    inherited btnFechar: TButton
      Left = 471
      Width = 90
      Caption = 'Sair'
      ExplicitLeft = 471
      ExplicitWidth = 90
    end
    inherited btnConfirmar: TButton
      Caption = 'Finalizar Venda'
    end
    object Button1: TButton
      Left = 11
      Top = 3
      Width = 94
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 12
      ImageIndex = 13
      Images = dm.ImageList1
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 223
      Top = 3
      Width = 116
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Pedidos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 33
      ImageIndex = 32
      Images = dm.ImageList1
      ParentFont = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object btnCancelar: TButton
      Left = 106
      Top = 3
      Width = 117
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Canc. Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 33
      ImageIndex = 32
      Images = dm.ImageList1
      ParentFont = False
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 566
    Height = 104
    Align = alTop
    BevelOuter = bvNone
    Color = 14474460
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      566
      104)
    object Label1: TLabel
      Left = 15
      Top = 50
      Width = 73
      Height = 14
      Caption = 'C'#243'd. Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 247
      Top = 50
      Width = 65
      Height = 14
      Caption = 'Val. Unit'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 135
      Top = 50
      Width = 38
      Height = 14
      Caption = 'Quant.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 351
      Top = 50
      Width = 28
      Height = 14
      Caption = 'Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 233
      Top = 71
      Width = 7
      Height = 14
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 340
      Top = 71
      Width = 9
      Height = 14
      Caption = '='
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 41
      Top = 3
      Width = 485
      Height = 27
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Consumidor Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      OnClick = Button1Click
    end
    object Shape1: TShape
      Left = 63
      Top = 43
      Width = 438
      Height = 1
      Anchors = [akLeft, akTop, akRight]
    end
    object lblcidade: TLabel
      Left = 41
      Top = 27
      Width = 485
      Height = 17
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      OnClick = Button1Click
    end
    object edtCodigo: TButtonedEdit
      Left = 15
      Top = 66
      Width = 114
      Height = 23
      Alignment = taCenter
      Images = dm.ImageList1
      RightButton.DisabledImageIndex = 29
      RightButton.HotImageIndex = 28
      RightButton.ImageIndex = 29
      RightButton.Visible = True
      TabOrder = 0
    end
    object edtValorTotal: TEdit
      Left = 351
      Top = 66
      Width = 114
      Height = 23
      Alignment = taRightJustify
      Enabled = False
      TabOrder = 3
    end
    object edtValorUnitario: TEdit
      Left = 247
      Top = 66
      Width = 90
      Height = 23
      Alignment = taCenter
      TabOrder = 2
      Text = '0,00'
      OnChange = edtValorUnitarioChange
      OnEnter = edtQuantidadeEnter
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object edtQuantidade: TEdit
      Left = 135
      Top = 66
      Width = 90
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      Text = '1,00'
      OnChange = edtValorUnitarioChange
      OnEnter = edtQuantidadeEnter
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object btnAdicionarProduto: TButton
      Left = 471
      Top = 51
      Width = 90
      Height = 32
      Cursor = crHandPoint
      Caption = 'Adicionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 2
      ImageIndex = 3
      Images = dm.ImageList1
      ParentFont = False
      TabOrder = 4
      OnClick = btnAdicionarProdutoClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 137
    Width = 566
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 42495
    ParentBackground = False
    TabOrder = 3
    StyleElements = []
    DesignSize = (
      566
      25)
    object lblNome: TLabel
      Left = 11
      Top = 5
      Width = 44
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValUnitario: TLabel
      Left = 225
      Top = 5
      Width = 78
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = '|     Val. Unit.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 386
      Top = 5
      Width = 60
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = '|    Quant.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 320
    end
    object lblTotal: TLabel
      Left = 458
      Top = 4
      Width = 43
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = '|  Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 392
    end
    object Button3: TButton
      Left = -213
      Top = 73
      Width = 28
      Height = 28
      HotImageIndex = 29
      ImageIndex = 28
      ImageMargins.Left = 2
      ImageMargins.Top = 2
      ImageMargins.Right = 2
      ImageMargins.Bottom = 2
      Images = dm.ImageList1
      TabOrder = 0
    end
  end
  object Lista: TListBox
    Left = 0
    Top = 162
    Width = 566
    Height = 190
    Style = lbOwnerDrawVariable
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ItemHeight = 24
    TabOrder = 4
    OnDrawItem = ListaDrawItem
    OnMouseUp = ListaMouseUp
  end
  object Panel3: TPanel
    Left = 0
    Top = 352
    Width = 566
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    Color = 14474460
    ParentBackground = False
    TabOrder = 5
    DesignSize = (
      566
      58)
    object Label10: TLabel
      Left = 350
      Top = 9
      Width = 95
      Height = 14
      Anchors = [akTop, akRight]
      Caption = 'Quant. Produtos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 284
    end
    object Label7: TLabel
      Left = 374
      Top = 34
      Width = 71
      Height = 14
      Anchors = [akTop, akRight]
      Caption = 'Total Venda:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 308
    end
    object edtQuantidadeProdutos: TEdit
      Left = 448
      Top = 6
      Width = 114
      Height = 23
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 0
      Text = '0,00'
    end
    object edtTotalVenda: TEdit
      Left = 448
      Top = 31
      Width = 114
      Height = 23
      Alignment = taCenter
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 1
      Text = '0,00'
    end
  end
end
