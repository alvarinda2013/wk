unit UntPedidosDadosGerais;

interface
  uses
    untClientes, System.Classes;
  type
    TPedidosDadosGerais = class(TClientes)
      public
        idVenda : Integer;
        Data    : TDateTime;
        ValorTotal : Currency;
      procedure InserirPedido;
      procedure AlterarPedido;
      procedure ExcluirPedido;
      procedure ConsultarPedido;overload;
      procedure ConsultarPedido(lista : TStrings);overload;
      procedure limparEstrutura;
    end;

implementation
  uses
    System.SysUtils, untPedidosProdutos, FireDac.Stan.Param, Data.DB;

{ TPedidosDadosGerais }

procedure TPedidosDadosGerais.AlterarPedido;
const
  SQL = 'UPDATE PEDIDOSDADOSGERAIS SET IDCLIENTE = :IDCLIENTE, VALORTOTAL = :VALORTOTAL WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [idCliente, ValorTotal]);
  except
    raise;
  end;
end;

procedure TPedidosDadosGerais.ConsultarPedido;
const
  SQL = ' SELECT PG.ID IDPEDIDO, PG.DATA, PG.IDCLIENTE, PG.VALORTOTAL,           '#13+
        ' PP.ID IDPEDIDOPRODUTO, PP.QUANTIDADE, PP.VALORUNITARIO, PP.VALORTOTAL, '#13+
        ' CL.NOME, CL.CIDADE, CL.UF, PT.ID IDPRODUTO, PT.DESCRICAO               '#13+
        ' FROM vendas.PEDIDOSDADOSGERAIS PG                                      '#13+
        ' JOIN CLIENTES CL ON  PG.IDCLIENTE = CL.ID                              '#13+
        ' JOIN PEDIDOSPRODUTOS PP ON PG.ID = PP.IDPEDIDO                         '#13+
        ' JOIN PRODUTOS PT ON PP.IDPRODUTO = PT.ID                               '#13+
        ' WHERE (PG.ID = :ID OR :ID =0)                                          ' ;
begin
  try
    qry.SQL.Text := SQL;

    qry.ParamByName('ID').AsInteger := idVenda;

    if (Data > 0 ) then
    begin
      qry.SQL.Add(' AND Cast(PD.DATA AS DATE) = :DATA');
      qry.ParamByName('DATA').AsDate := Data;
    end
    else if not Trim(Nome).isEmpty then
      qry.SQL.Add(' AND lower(CL.NOME) LIKE ''%' + LowerCase(Nome) + '%''');

    qry.Open;

    if (qry.IsEmpty) then
    begin
      limparEstrutura;
      raise Exception.Create('Nenhum pedido foi localizado.');
    end;
  except
    raise;
  end;
end;

procedure TPedidosDadosGerais.ConsultarPedido(lista: TStrings);
const
  SQL = 'SELECT CL.* FROM CLIENTES CL WHERE (CL.ID = :ID OR :ID = 0)';
var
  item : TPedidosProdutos;
begin
  try
    Lista.Clear;
    ValorTotal := 0;
    ConsultarPedido;
    Nome   := qry.FindField('Nome').AsString;
    Cidade := qry.FindField('Cidade').AsString;
    UF     := qry.FindField('UF').AsString;

    while not(qry.Eof) do
    begin
      item               := TPedidosProdutos.Create(Owner, conexao);
      item.idVenda       := qry.FindField('IdPedido').AsInteger;
      item.IdProduto     := qry.FindField('IdProduto').AsInteger;
      item.Quantidade    := qry.FindField('Quantidade').AsFloat;
      item.ValorTotal    := qry.FindField('ValorTotal').AsCurrency;
      item.Descricao     := qry.FindField('Descricao').AsString;
      item.ValorUnitario := qry.FindField('ValorUnitario').AsCurrency;
      ValorTotal         := ValorTotal + item.ValorTotal;
      Lista.AddObject(Item.Descricao, item);
      qry.Next;
    end;

  except
    raise;
  end;

end;

procedure TPedidosDadosGerais.ExcluirPedido;
const
  SQL = 'DELETE FROM PEDIDOSDADOSGERAIS WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [idVenda]);
  except
    raise;
  end;
end;

procedure TPedidosDadosGerais.InserirPedido;
const
  SQL = 'INSERT INTO PEDIDOSDADOSGERAIS (IDCLIENTE, VALORTOTAL) VALUES (:IDCLIENTE, :VALORTOTAL)';
begin
  try
    qry.ExecSQL(SQL, [idCliente, ValorTotal]);
    qry.Open('SELECT LAST_INSERT_ID();');
    idVenda := qry.Fields[0].AsInteger;
  except
    raise;
  end;
end;

procedure TPedidosDadosGerais.limparEstrutura;
begin
  ValorTotal := 0;
  Data := 0;
  idVenda := 0;
  idCliente := 0;
  Nome := '';
end;

end.
