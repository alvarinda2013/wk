object FormPadrao: TFormPadrao
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 463
  ClientWidth = 612
  Color = 15921906
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 14
  object imgLixeira24: TImage
    Left = 10
    Top = 38
    Width = 24
    Height = 24
    AutoSize = True
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
      00180806000000E0773DF8000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000002
      684944415478DAB5964F4814511CC79DD93918118824DB61DD9D15F4909A4110
      7850846E1A4A17958440A253795132052190C03F9DCC4424F0626A6142A16025
      2184752C08EA60E5EECC762A05BDA4E9CE4C9F07B330D9E8BCB57CF0F8BDF7DB
      DFEFFBF9BDF79B1956C939E2A1C806EABA5EAD284A2DCB6DC7716692C9E4C7FF
      0640BC1BF15E96CBCC13CC3220CD409EFE3320168B15AAAAFA15C1AB084E4422
      1145D3B4BB009BD2E9B49E4AA52C2900555662CEF9C49C46EC1A804ED6BBAEAF
      105F27BE1ED69B3E392F28E6F35EC01D925A5986992BB2BDF10C8D59CC5C057C
      1BC0C3BFAE08481D90279665E599A6F92B1B75722BC87D6FDB76D4308C6FBE3D
      20A89CA00F5410A302334B403DB98F00E401D8F105D0D07C1AFA1D400D80658F
      5FC538243A993D420E0D763C801B00DA1389449157F30F40341A5543A1D00F00
      6D00A63CC92324FF24F9A6D8C7E3F197C4CC12339689C13788394F4CCDBE0037
      505CD124C9031EDF638C00B4BAFB779819F67D9E9869CC2EBE2B418079000680
      EB5902DE6096F0F5040146C43513785116404F147A6752582F853D3810C07DDF
      E2BE5B483E9305E018800D000D009E07012E0318E65D28E05DB025013A800480
      52009F8200550096780C4FF2586EC800FC72F60578AA29CB7C9225002D008638
      7598535B41805CF73E2F01587005C4876E8BFDB0BBBF8F5964FFCC0576639A00
      9EDDABE7FBB926C100D08FC0688EC4205EBC70A70034C8025E63DE92D0250910
      27FD427C9B2CE01EE6024DABC3AE05E89770A5AF387107271E9702D0873049A2
      AA0AA61D0050119FA398461ABC230510830F9F06A494E5F183D4115F67AE20EE
      F8FD2EFDAFE2B0E3374A948728BEB906D50000000049454E44AE426082}
    Visible = False
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 33
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  -  Titulo'
    Color = 42495
    Font.Charset = ANSI_CHARSET
    Font.Color = 4210752
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Padding.Bottom = 2
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    StyleElements = []
    DesignSize = (
      612
      33)
    object imgFechar: TImage
      Left = 584
      Top = 6
      Width = 20
      Height = 20
      Cursor = crHandPoint
      Hint = 'Fechar janela de cadastro de produtos.'
      Anchors = [akRight, akBottom]
      AutoSize = True
      Center = True
      ParentShowHint = False
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
        001408060000008D891D0D000000E14944415478DAEDD23F0E014114C7F119A2
        F4E700DC024B252AD12B140A9546244E22516DA35188C205FC69442488C20D38
        837000BF97CCC6E4D9D917A1E325DF6232C927D979ABD59747FF411A0F0DD105
        75D08DDD67D00865510F1D25706F509A1DAA5928612B9437E70DAA48E01435AD
        7380C6194633466D094CA2052A3334C1B02DAAA3BB04BA502561516014EAC424
        902F20988379D3EB3B60DA6005C7BD13D50E6C898AEC3369299E84868133D408
        79B39879D3927537412D09B47F6CBE80149AABE7A2D6A82A81F46E0374465DF5
        BA4DDABE8F72A88F4E12F8D1FC20F800490F3015542150BF0000000049454E44
        AE426082}
      ShowHint = True
      OnClick = imgFecharClick
      ExplicitLeft = 936
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 612
    Height = 41
    Align = alBottom
    Color = 14474460
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      612
      41)
    object btnFechar: TButton
      Left = 477
      Top = 3
      Width = 131
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 10
      ImageIndex = 11
      Images = dm.ImageList1
      ModalResult = 8
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnConfirmar: TButton
      Left = 340
      Top = 3
      Width = 131
      Height = 32
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 12
      ImageIndex = 13
      Images = dm.ImageList1
      ParentFont = False
      TabOrder = 1
    end
  end
end
