unit UFormCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormPadrao, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls
  , untClientes;

type
  TFormCadastroCliente = class(TFormPadrao)
    Lista: TListBox;
    Panel2: TPanel;
    cbPesquisa: TComboBox;
    edtPesquisa: TButtonedEdit;
    Panel4: TPanel;
    lblNome: TLabel;
    lblCidade: TLabel;
    lblUF: TLabel;
    Button3: TButton;
    btnAdicionar: TButton;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TEdit;
    edtCidade: TEdit;
    CbUf: TComboBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbPesquisaSelect(Sender: TObject);
    procedure edtPesquisaRightButtonClick(Sender: TObject);
    procedure ListaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ListaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAdicionarClick(Sender: TObject);
    procedure ListaDblClick(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

    { Private declarations }
    procedure SelecionarCliente;
    procedure ExcluirCliente;
  public
    { Public declarations }
    Cliente : TClientes;
    constructor Create(AOwner: TComponent; bPesquisa : Boolean = True); reintroduce; overload;
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation
  uses
     untDm, System.UITypes;

{$R *.dfm}

procedure TFormCadastroCliente.btnConfirmarClick(Sender: TObject);
var
  item : TClientes;
  bInserindo : Boolean;
begin
  inherited;
  if btnAdicionar.Visible then
  begin
    ListaDblClick(Sender);
    Exit;
  end;

  try
    bInserindo := Lista.ItemIndex < 0;

    if (bInserindo) then
      item := TClientes.Create(Self, dm.Conexao)
    else
      item := TClientes(Lista.Items.Objects[Lista.ItemIndex]);

    item.Nome   := Trim(edtNome.Text);
    item.Cidade := Trim(edtCidade.Text);
    item.UF     := Trim(CbUf.Text);

    if Item.idCliente <= 0 then
    begin
      item.InserirCliente;
      Item.ConsultarCliente(Lista.Items);
    end
    else item.AlterarCliente;

    Lista.Repaint;
//    Lista.Items.AddObject(Item.Nome, item);

  except
    on e: exception do
    ShowMessage(E.Message);
  end;

end;

procedure TFormCadastroCliente.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  Lista.ItemIndex := -1;
  edtNome.Clear;
  edtCidade.Clear;
  cbUf.ItemIndex:= -1;
  EdtNome.SetFocus;
end;

procedure TFormCadastroCliente.cbPesquisaSelect(Sender: TObject);
begin
  inherited;
  edtPesquisa.NumbersOnly := cbPesquisa.ItemIndex = 3;
end;

constructor TFormCadastroCliente.Create(AOwner: TComponent; bPesquisa : boolean);
begin
  inherited Create(AOwner);
  Panel3.Visible := not bPesquisa;
  btnAdicionar.Visible := not bPesquisa;
end;

procedure TFormCadastroCliente.edtPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key= VK_RETURN then
    edtPesquisaRightButtonClick(Sender);
end;

procedure TFormCadastroCliente.edtPesquisaRightButtonClick(Sender: TObject);
var
  item : TClientes;
begin
  inherited;
  try
    try
      item := TClientes.Create(Self, dm.conexao);
      item.LimparEstrutura;
      case cbPesquisa.ItemIndex of
        00 : item.nome      := Trim(edtPesquisa.Text);
        01 : item.Cidade    := Trim(edtPesquisa.Text);
        02 : item.idCliente := StrToIntDef(edtPesquisa.Text,0);
      end;
      item.ConsultarCliente(Lista.Items);
      if Lista.Items.Count > 0 then
      begin
        Lista.SetFocus;
        Lista.Selected[0];
      end;
    except
      on e: exception do
        ShowMessage(e.Message);
    end;
  finally
    FreeAndNil(Item);
  end;
end;

procedure TFormCadastroCliente.ExcluirCliente;
var
  Item : TClientes;
begin
  if (Lista.ItemIndex < 0) then Exit;
  if  (MessageDlg('Tem certeza que deseja excluir ? ', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrYes)
  then
  begin
    try
      try
        item := TClientes(Lista.Items.Objects[Lista.ItemIndex]);
        Item.ExcluirCliente;
        Lista.DeleteSelected;
        ShowMessage('Excluido com sucesso');
      except
        on e: exception do
          ShowMessage(e.Message);
      end;
    finally
      FreeAndNil(Item);
    end;
  end;

end;

procedure TFormCadastroCliente.ListaDblClick(Sender: TObject);
begin
  inherited;
  Cliente := TClientes(Lista.Items.Objects[Lista.ItemIndex]);
  if not btnAdicionar.Visible then
    ModalResult := mrOk;
end;

procedure TFormCadastroCliente.ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  r : TRect;
  Item : TClientes;
begin
  inherited;
  DrawPadrao(Control, Index, Rect, State);
  with TListBox(Control).Canvas do
  begin
    item := TClientes(TListBox(Control).Items.Objects[Index]);
    Draw(Rect.Right - 26, Rect.Top + 1, imgLixeira24.Picture.Graphic);
    r := Rect;
    r.top := r.top + 4;

    r.Left  := lblNome.Left;
    r.Right := lblCidade.Left;
    DrawText(Handle, PChar(Item.Nome), -1, r, DT_LEFT);

    r.Left  := lblCidade.Left + 2;
    r.Right := lblUf.Left;
    DrawText(Handle, PChar(Item.Cidade), -1, r, DT_LEFT);

    r.Left  := lblUf.Left + 2;
    r.Right := Rect.Right - 32;
    DrawText(Handle, PChar(Item.UF), -1, r, DT_Center);
  end;
end;

procedure TFormCadastroCliente.ListaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key in [VK_UP, VK_DOWN] then
    SelecionarCliente
  else if Key in [VK_DELETE] then
    ExcluirCliente;
  if (key = VK_RETURN) and (not btnAdicionar.Visible) then
    ListaDblClick(Lista);

end;

procedure TFormCadastroCliente.ListaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbLeft) then
    SelecionarCliente;
end;

procedure TFormCadastroCliente.ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Rect : TRect;
begin
  inherited;
  if Button = mbLeft then
    begin
      Rect := TListBox(Sender).ItemRect(TListBox(Sender).ItemIndex);

      if (X >= (Rect.Right - 20)) and (x <= rect.right) then
        ExcluirCliente;
    end;
end;

procedure TFormCadastroCliente.SelecionarCliente;
var
  Item : TClientes;
begin
  if (Lista.ItemIndex < 0) then Exit;

  item := TClientes(Lista.Items.Objects[Lista.ItemIndex]);

  edtNome.Text   := Item.Nome;
  edtCidade.Text := Item.Cidade;
  cbUf.ItemIndex := cbUf.Items.IndexOf(Item.UF);

end;

end.
