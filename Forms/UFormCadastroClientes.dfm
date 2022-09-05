inherited FormCadastroCliente: TFormCadastroCliente
  ActiveControl = edtPesquisa
  Caption = 'FormCadastroCliente'
  ClientHeight = 405
  ClientWidth = 513
  ExplicitWidth = 513
  ExplicitHeight = 405
  TextHeight = 14
  inherited pnlTitulo: TPanel
    Width = 513
    Caption = '  -  Clientes'
    ExplicitWidth = 513
    DesignSize = (
      513
      33)
    inherited imgFechar: TImage
      Left = 485
      ExplicitLeft = 588
    end
  end
  inherited Panel1: TPanel
    Top = 364
    Width = 513
    BevelOuter = bvNone
    ExplicitTop = 327
    ExplicitWidth = 513
    inherited btnFechar: TButton
      Left = 376
      ExplicitLeft = 376
    end
    inherited btnConfirmar: TButton
      Left = 239
      OnClick = btnConfirmarClick
      ExplicitLeft = 239
    end
    object btnAdicionar: TButton
      Left = 102
      Top = 3
      Width = 131
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
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
      TabOrder = 2
      OnClick = btnAdicionarClick
    end
  end
  object Lista: TListBox
    Left = 0
    Top = 106
    Width = 513
    Height = 201
    Style = lbOwnerDrawVariable
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ItemHeight = 24
    TabOrder = 2
    OnDblClick = ListaDblClick
    OnDrawItem = ListaDrawItem
    OnKeyDown = ListaKeyDown
    OnMouseDown = ListaMouseDown
    OnMouseUp = ListaMouseUp
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 513
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Color = 14474460
    ParentBackground = False
    TabOrder = 3
    object cbPesquisa: TComboBox
      Left = 8
      Top = 10
      Width = 137
      Height = 22
      ItemIndex = 0
      TabOrder = 0
      Text = 'Nome'
      OnSelect = cbPesquisaSelect
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
      OnKeyDown = edtPesquisaKeyDown
      OnRightButtonClick = edtPesquisaRightButtonClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 81
    Width = 513
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 42495
    ParentBackground = False
    TabOrder = 4
    StyleElements = []
    DesignSize = (
      513
      25)
    object lblNome: TLabel
      Left = 11
      Top = 5
      Width = 37
      Height = 16
      Alignment = taCenter
      Anchors = [akLeft, akBottom]
      Caption = 'Nome '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCidade: TLabel
      Left = 225
      Top = 5
      Width = 49
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = '| Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblUF: TLabel
      Left = 429
      Top = 5
      Width = 29
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = '|  UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4998466
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 623
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
  object Panel3: TPanel
    Left = 0
    Top = 307
    Width = 513
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    Color = 14474460
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 256
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 32
      Height = 14
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 279
      Top = 10
      Width = 36
      Height = 14
      Caption = 'Cidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 455
      Top = 10
      Width = 14
      Height = 14
      Caption = 'UF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNome: TEdit
      Left = 8
      Top = 24
      Width = 266
      Height = 22
      TabOrder = 0
    end
    object edtCidade: TEdit
      Left = 279
      Top = 24
      Width = 170
      Height = 22
      TabOrder = 1
    end
    object CbUf: TComboBox
      Left = 453
      Top = 24
      Width = 51
      Height = 22
      Sorted = True
      TabOrder = 2
      Items.Strings = (
        'AC'
        'AL'
        'AM'
        'AP'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MG'
        'MS'
        'MT'
        'PA'
        'PB'
        'PE'
        'PI'
        'PR'
        'RJ'
        'RN'
        'RO'
        'RR'
        'RS'
        'SC'
        'SE'
        'SP'
        'TO')
    end
  end
end
