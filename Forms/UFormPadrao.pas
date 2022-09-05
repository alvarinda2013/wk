unit UFormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TFormPadrao = class(TForm)
    pnlTitulo: TPanel;
    imgFechar: TImage;
    Panel1: TPanel;
    btnFechar: TButton;
    btnConfirmar: TButton;
    imgLixeira24: TImage;
    procedure imgFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FTitulo: string;
    procedure SetFTitulo(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property titulo : string read FTitulo write SetFTitulo;
    procedure DrawPadrao(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure VerificaKeyNumero(Edit: TEdit; var Key: Char; PermiteVirgula: Boolean = True); overload;
  end;

var
  FormPadrao: TFormPadrao;

implementation
  uses untDM;

{$R *.dfm}

procedure TFormPadrao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPadrao.DrawPadrao(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TListBox(Control).Canvas do
  begin
    FillRect(Rect);
    Font.Style := [];
    Font.Color := clBlack;
    if odSelected in State then
    begin
      Brush.Color :=  $00FFD2A6;
      RoundRect(Rect.Left, Rect.Top, Rect.Right - 1, Rect.Bottom, 1, 1);
    end
    else if Odd(Index) then //se é um item ímpar
    begin
      Brush.Color := $00F8F8F8;
      FillRect(Rect);
      Brush.Style := bsClear;
    end else Brush.Color := clWhite;
  end;
end;

procedure TFormPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (KEY = VK_ESCAPE) then Close
  else if (key = VK_RETURN) then SelectNext(Screen.ActiveControl, True, True);
end;

procedure TFormPadrao.FormShow(Sender: TObject);
begin
  Left := Trunc((Screen.Width Div 2) - (Self.Width div 2));
  Top := Trunc((Screen.Height Div 2) - (Self.Height div 2));
end;

procedure TFormPadrao.imgFecharClick(Sender: TObject);
begin
Close;
end;

procedure TFormPadrao.SetFTitulo(const Value: string);
begin
  FTitulo := Value;
  pnlTitulo.Caption := '   - ' + Ftitulo;
end;

procedure TFormPadrao.VerificaKeyNumero(Edit: TEdit; var Key: Char; PermiteVirgula: Boolean);
begin
  if (Key = #44) and not PermiteVirgula then
    Key := #0;

  if (Key = #44) and ((Pos(#44, Edit.Text) > 0) or (Edit.SelStart < 1)) then
    Key := #0;

  if (Key = #45) and ((Pos(#45, Edit.Text) > 0) or (Edit.SelStart > 0)) then
    Key := #0;

  if not CharInSet(key,['0'..'9', #8, #9, #13, #27, #35, #36, #44, #45, #46]) then
    Key := #0;
end;

end.
