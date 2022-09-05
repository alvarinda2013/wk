program Vendas;

uses
  Vcl.Forms,
  UFormPadrao in 'Forms\UFormPadrao.pas' {FormPadrao},
  untClientes in 'units\untClientes.pas',
  untPadrao in 'units\untPadrao.pas',
  untExecutaSQL in 'units\untExecutaSQL.pas',
  UntPedidosDadosGerais in 'units\UntPedidosDadosGerais.pas',
  untPedidosProdutos in 'units\untPedidosProdutos.pas',
  untProdutos in 'units\untProdutos.pas',
  UFormCadastroClientes in 'Forms\UFormCadastroClientes.pas' {FormCadastroCliente},
  untDM in 'untDM.pas' {dm: TDataModule},
  UFormPrincipal in 'Forms\UFormPrincipal.pas' {FormPrincipal},
  UFormProduto in 'Forms\UFormProduto.pas' {FormProduto},
  UFormBuscaPedidos in 'Forms\UFormBuscaPedidos.pas' {FormBuscaPedidos};

{$R *.res}

begin
//  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
