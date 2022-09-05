unit untPedidosProdutos;

interface
  uses
    untProdutos;
  type
    TPedidosProdutos = class(TProdutos)
    public
      idVenda           : Integer;
//      idPedidosProdutos : Integer;
      Quantidade        : Double;
      ValorTotal        : Currency;

      procedure InserirPedidosProdutos;
      procedure AlterarPedidosProdutos;
      procedure ExcluirPedidosProdutos;
      procedure ConsultarPedidosProdutos;
    end;

implementation
  uses
    System.SysUtils;

{ TPedidosProdutos }

procedure TPedidosProdutos.AlterarPedidosProdutos;
const
  SQL = ' UPDATE PEDIDOSPRODUTOS              '#13 +
        ' SET IDPEDIDO      = :IDPEDIDO,      '#13 +
        '     QUANTIDADE    = :QUANTIDADE,    '#13 +
        '     VALORUNITARIO = :VALORUNITARIO, '#13 +
        '     VALORTOTAL    = :VALORTOTAL     '#13 +
        ' WHERE ID = :ID                      ';
begin
  try
    qry.ExecSQL(SQL, [idVenda, QUANTIDADE,VALORUNITARIO,VALORTOTAL, idProduto]);
  except
    raise;
  end;
end;

procedure TPedidosProdutos.ConsultarPedidosProdutos;
const
  SQL = ' SELECT * FROM  PEDIDOSDADOSGERAIS PD     '#13 +
        ' JOIN CLIENTES CL ON CL.ID = PD.IDCLIENTE '#13 +
        ' WHERE (PD.ID = :ID OR :ID IS NULL)       ' ;
begin
  try
    qry.SQL.Text := SQL;

//    if (Data > 0 ) then
//    begin
//      qry.SQL.Add(' AND Cast(PD.DATA AS DATE) = :DATA');
//      qry.ParamByName('DATA').AsDate := Data;
//    end
//    else if not Trim(Descricao).isEmpty then
//      qry.SQL.Add(' AND lower(CL.NOME) LIKE ''%' + LowerCase(Descricao) + '%''');
  except
    raise;
  end;
end;

procedure TPedidosProdutos.ExcluirPedidosProdutos;
const
  SQL = 'DELETE FROM PEDIDOSPRODUTOS WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [Id]);
  except
    raise;
  end;
end;

procedure TPedidosProdutos.InserirPedidosProdutos;
const
  SQL = ' INSERT INTO PEDIDOSPRODUTOS (IDPEDIDO, IDPRODUTO, QUANTIDADE, VALORUNITARIO, VALORTOTAL) '#13+
        '                      VALUES (:IDPEDIDO, :IDPRODUTO, :QUANTIDADE, :VALORUNITARIO, :VALORTOTAL)';
begin
  try
    qry.ExecSQL(SQL, [idVenda, idProduto, QUANTIDADE, VALORUNITARIO, VALORTOTAL]);
    qry.Open('SELECT LAST_INSERT_ID();');
    idProduto := qry.Fields[0].AsInteger;
  except
    raise;
  end;
end;
end.
