unit untPadrao;

interface
  uses
    FireDAC.Comp.Client, System.Classes, untExecutaSQL;
  type

  TPadrao = class(TComponent)
  public
    Id : Integer;
    conexao    : TFDConnection;
    qry        : TExecutaSQL;
    constructor Create(Owner : TComponent; pConexao : TFDConnection);reintroduce; overload;
  end;
implementation
  uses
    FireDAC.Stan.Option, ClipBrd;

{ TPadrao }

constructor TPadrao.Create(Owner: TComponent; pConexao : TFDConnection);
begin
  inherited create(owner);
  conexao  := pConexao;
  qry      := TExecutaSQL.Create(Self, pConexao);
  qry.Connection := conexao;
  qry.FetchOptions.Items := qry.FetchOptions.Items - [fiMeta];
end;

end.
