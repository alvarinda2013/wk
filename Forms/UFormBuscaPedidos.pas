unit UFormBuscaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormPadrao, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TFormBuscaPedidos = class(TFormPadrao)
    edtPesquisa: TButtonedEdit;
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    iNumeroPedido : Integer;
    { Public declarations }
  end;

var
  FormBuscaPedidos: TFormBuscaPedidos;

implementation

{$R *.dfm}

procedure TFormBuscaPedidos.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  if StrToIntdef(edtPesquisa.Text,0)<=0 then
  begin
    ShowMessage('Informe um pedido');
    Exit;
  end;

  iNumeroPedido := StrToIntdef(edtPesquisa.Text,0);
  ModalResult := mrOk;
end;


end.
