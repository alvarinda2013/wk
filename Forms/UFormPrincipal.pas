unit UFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UFormPadrao, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  untProdutos, untPedidosProdutos, untPedidosDadosGerais;

type
  TFormPrincipal = class(TFormPadrao)
    Panel2: TPanel;
    Label1: TLabel;
    edtCodigo: TButtonedEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtValorTotal: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    lblNome: TLabel;
    lblValUnitario: TLabel;
    lblQuantidade: TLabel;
    Button3: TButton;
    Lista: TListBox;
    lblTotal: TLabel;
    Panel3: TPanel;
    Label10: TLabel;
    edtQuantidadeProdutos: TEdit;
    Label7: TLabel;
    edtTotalVenda: TEdit;
    Button1: TButton;
    lblCliente: TLabel;
    Shape1: TShape;
    edtValorUnitario: TEdit;
    edtQuantidade: TEdit;
    btnAdicionarProduto: TButton;
    Button2: TButton;
    lblcidade: TLabel;
    btnCancelar: TButton;
    procedure edtCodigoRightButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    itemVenda : TPedidosProdutos;
    Venda : TPedidosDadosGerais;
    procedure LimparEdits;
    procedure InserirItemVenda;
    procedure ExcluirItem;
    procedure PreencherLabelCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation
uses
  UFormCadastroClientes, untDm, UFormProduto, untClientes, System.UITypes, System.Types, UFormBuscaPedidos;

{$R *.dfm}

procedure TFormPrincipal.btnAdicionarProdutoClick(Sender: TObject);
begin
  inherited;
  InserirItemVenda;
end;

procedure TFormPrincipal.Button1Click(Sender: TObject);
var
  Form : TFormCadastroCliente;
begin
  try
    Form := TFormCadastroCliente.Create(Self, True);
    if (Form.ShowModal = mrOk) then
    begin
      TClientes(Venda).idCliente := Form.Cliente.idCliente;
      TClientes(Venda).Nome      := Form.Cliente.Nome;
      TClientes(Venda).Cidade      := Form.Cliente.Cidade;
      TClientes(Venda).UF      := Form.Cliente.UF;

      PreencherLabelCliente;

      if (Venda.IdVenda = 0) then
        Venda.InserirPedido;
    end;

  finally
    FreeAndNil(Form);
  end;
end;

procedure TFormPrincipal.Button2Click(Sender: TObject);
var
  Form : TFormBuscaPedidos;
begin
  inherited;
  try
    Form := TFormBuscaPedidos.Create(Self);

    if Form.ShowModal = mrOk then
    begin
      Venda.limparEstrutura;
      Venda.idVenda := Form.iNumeroPedido;

      if Sender = btnCancelar then
      begin
        if (MessageDlg('Tem certeza que deseja excluir ? ', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) <> mrYes) then Exit;
        Venda.ExcluirPedido;
        ShowMessage('Pedido excluido com sucesso');
      end
      else
      begin
        Venda.ConsultarPedido(Lista.Items);
        edtQuantidadeProdutos.Text := FormatFloat('0.00', Lista.Items.Count);
        edtTotalVenda.Text := FormatFloat('0.00', Venda.ValorTotal);
      end;
    end;
  finally
    PreencherLabelCliente;
  end;

end;

procedure TFormPrincipal.edtCodigoRightButtonClick(Sender: TObject);
var
  Form : TFormProduto;
  item : TPedidosProdutos;
begin
  inherited;
  try
    try
      item := TPedidosProdutos.Create(Self, dm.conexao);
      Form := TFormProduto.Create(Self, Item);

      if Form.ShowModal = MrOk then
        Lista.Items.AddObject(item.Descricao, item);

    except
      on e: exception do
        ShowMessage(e.Message);
    end;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TFormPrincipal.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  TEdit(Sender).SelectAll;
end;

procedure TFormPrincipal.edtValorUnitarioChange(Sender: TObject);
begin
  inherited;
  if (StrToFloatDef(edtQuantidade.Text,0) > 0) then
    edtValorTotal.Text := FormatFloat('0.00', (StrToFloatDef(edtValorUnitario.Text,0)) * (StrToFloatDef(edtQuantidade.Text,0)))
  else edtValorTotal.Text := '0,00';
end;

procedure TFormPrincipal.edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  VerificaKeyNumero(TEdit(Sender), Key);
end;

procedure TFormPrincipal.ExcluirItem;
begin
  if (MessageDlg('Tem certeza que deseja excluir ? ', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) <> mrYes) then Exit;

  itemVenda := TPedidosProdutos(Lista.Items.Objects[Lista.ItemIndex]);
  itemVenda.ExcluirPedidosProdutos;
  Venda.ValorTotal :=  Venda.ValorTotal- itemVenda.ValorTotal;
  edtQuantidadeProdutos.Text := FormatFloat('0.00', Lista.Items.Count);
  edtTotalVenda.Text := FormatFloat('0.00', Venda.ValorTotal);
  Lista.DeleteSelected;
  FreeAndNil(itemVenda);
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Venda := TPedidosDadosGerais.Create(Self, dm.conexao);
  Venda.limparEstrutura;
end;

procedure TFormPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    try
      if (ActiveControl = edtCodigo) then
      begin
        if Trim(edtCodigo.Text) = '' then
          Exit;
        
        itemVenda           := TPedidosProdutos.Create(Self, dm.conexao);
        itemVenda.idProduto        := StrToIntDef(edtCodigo.Text,0);
        itemVenda.ConsultarProdutos;
        edtQuantidade.Text    := FormatFloat('0.00', 1);
        edtValorUnitario.Text := FormatFloat('0.00', itemVenda.ValorUnitario);
      end else
      if (ActiveControl = edtValorUnitario) then
      begin
        InserirItemVenda;

      end else
      if (ActiveControl = Lista) then
      begin
        itemVenda := TPedidosProdutos(Lista.Items.Objects[Lista.ItemIndex]);
        edtCodigo.Enabled := False;
        edtQuantidade.Text := FormatFloat('0.00', itemVenda.Quantidade);
        edtValorUnitario.Text := FormatFloat('0.00', itemVenda.ValorUnitario);
        edtValorTotal.Text := FormatFloat('0.00', itemVenda.ValorTotal);
        edtQuantidade.SetFocus;
        Exit;
      end;
      
    except
      on e: exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  end else
  if ((key in [VK_UP, VK_DOWN]) and (Lista.Items.Count > 0)) then
  begin
    Lista.SetFocus;
    Lista.Selected[0];
  end;
  if (ActiveControl = Lista) then
  begin
    if (Key =  VK_ESCAPE) then
      edtCodigo.SetFocus;
    if (KEY = VK_DELETE) then
      excluirItem;
    begin


    end;
  end;

  if ((ActiveControl = edtCodigo) and (Trim(edtCodigo.Text) <> ''))
  or (ActiveControl <> edtCodigo)
  then inherited;

end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  Button1.Visible := Venda.idCliente = 0;
end;

procedure TFormPrincipal.InserirItemVenda;
begin
  try
    if (Venda.idVenda = 0) then
    begin
      if (Venda.idCliente = 0) then
      begin
        ShowMessage('Selecione um cliente');
        Button1Click(Button1);
      end;
    end;

    if (itemVenda.idProduto <= 0) then
    begin
      ShowMessage('Nenhum produto foi selecionado');
      Exit;
    end;

    itemVenda.Quantidade    := StrToFloatDef(edtQuantidade.Text,1);
    itemVenda.ValorUnitario := StrToFloatDef(edtValorUnitario.Text,0);
    itemVenda.ValorTotal    := itemVenda.Quantidade * itemVenda.ValorUnitario;
    ItemVenda.idVenda       := Venda.idVenda;
    Venda.ValorTotal        := Venda.ValorTotal + itemVenda.ValorTotal;
    if edtCodigo.Enabled then
    begin
      ItemVenda.InserirPedidosProdutos;
      Lista.Items.AddObject(itemVenda.Descricao, itemVenda)
    end
    else ItemVenda.AlterarPedidosProdutos;

  finally
    edtQuantidadeProdutos.Text := FormatFloat('0.00', Lista.Items.Count);
    edtTotalVenda.Text := FormatFloat('0.00', Venda.ValorTotal);

    Lista.Repaint;
    LimparEdits;
    Button1.Visible := Venda.idCliente = 0;
  end;
end;

procedure TFormPrincipal.LimparEdits;
begin
  edtCodigo.Enabled := True;
  edtCodigo.SetFocus;
  edtCodigo.Clear;
  edtQuantidade.Text    := '1,00';
  edtValorUnitario.Text := '0,00';
  edtValorTotal.Text    := '0,00';
end;

procedure TFormPrincipal.ListaDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  r : TRect;
  Item : TPedidosProdutos;
begin
  inherited;
  DrawPadrao(Control, Index, Rect, State);
  with TListBox(Control).Canvas do
  begin
    item := TPedidosProdutos(TListBox(Control).Items.Objects[Index]);
    Draw(Rect.Right - 26, Rect.Top + 1, imgLixeira24.Picture.Graphic);
    r := Rect;
    r.top := r.top + 4;

    r.Left  := lblNome.Left;
    r.Right := lblValUnitario.Left;
    DrawText(Handle, PChar(Item.Descricao), -1, r, DT_LEFT);

    r.Left  := lblValUnitario.Left + 2;
    r.Right := lblQuantidade.Left;
    DrawText(Handle, FormatFloat('0.00', Item.ValorUnitario), -1, r, DT_RIGHT);

    r.Left  := lblQuantidade.Left + 2;
    r.Right := lblTotal.Left;
    DrawText(Handle, FormatFloat('0.00', Item.Quantidade), -1, r, DT_CENTER);
    
    r.Left  := lblTotal.Left + 2;
    r.Right := Rect.Right - 32;
    DrawText(Handle, FormatFloat('0.00', Item.ValorTotal), -1, r, DT_RIGHT);
  end;
end;

procedure TFormPrincipal.ListaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Rect : TRect;
begin
  inherited;
  if Button = mbLeft then
    begin
      Rect := TListBox(Sender).ItemRect(TListBox(Sender).ItemIndex);

      if (X >= (Rect.Right - 20)) and (x <= rect.right) then
        ExcluirItem;

    end;
end;

procedure TFormPrincipal.PreencherLabelCliente;
begin
  if Trim(TClientes(Venda).Nome).IsEmpty then
  begin
    lblCliente.Caption := 'Consumidor Final';
    lblCidade.Caption := '...';
    exit;
  end;
  lblCliente.Caption := TClientes(Venda).Nome;
  lblCidade.Caption := TClientes(Venda).Cidade + ' ' + TClientes(Venda).UF;
end;

end.
