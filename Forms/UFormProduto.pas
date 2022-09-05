unit UFormProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UFormPadrao, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, untProdutos;

type
  TFormProduto = class(TFormPadrao)
    Panel2: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TButtonedEdit;
    Lista: TListBox;
  private
     { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; Item : TProdutos); reintroduce; overload;
  end;

var
  FormProduto: TFormProduto;

implementation

{$R *.dfm}

{ TFormPadrao1 }

constructor TFormProduto.Create(AOwner: TComponent; Item: TProdutos);
begin
  inherited Create(AOwner);
end;

end.
