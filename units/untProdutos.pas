//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 01', 11.58, 52 );
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 02', 10.50, 53);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 03', 3.75,  12);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 04', 5.00,  52);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 05', 12.00, 35);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 06', 13.50, 62);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 07', 5.75,  48);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 08', 8.00,  95);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 09', 10.0,  58);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 10', 0.50,  545);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 11', 5.00,  45);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 12', 1.00,  3);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 13', 5.00,  5);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 14', 3.00,  58);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 15', 4.73,  50);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 16', 3.37,  152);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 17', 2.00,  1);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 18', 3.52,  30);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 19', 4.53,  52);
//INSERT INTO Produtos(Descricao, ValorUnitario, Estoque) values ('Produto 20', 5.00,  155);


unit untProdutos;

interface
  uses
    untPadrao;
  type
    TProdutos = class(TPadrao)
    public
      idProduto : Integer;
      Descricao : String;
      ValorUnitario : Currency;
      Estoque : Double;
      procedure InserirProdutos;
      procedure AlterarProdutos;
      procedure ExcluirProdutos;
      procedure ConsultarProdutos;

    end;

implementation
  uses
    System.SysUtils, fIREDAC.Stan.pARAM, Data.DB;

{ TProdutos }

procedure TProdutos.AlterarProdutos;
const
  SQL = ' UPDATE produtos                     '#13 +
        ' SET Descricao     = :Descricao,     '#13 +
        '     ValorUnitario = :ValorUnitario, '#13 +
        '     Estoque       = :Estoque        '#13 +
        ' WHERE ID = :ID                      ';
begin
  try
    qry.ExecSQL(SQL, [Descricao, ValorUnitario, Estoque, idProduto]);
  except
    raise;
  end;
end;

procedure TProdutos.ConsultarProdutos;
const
  SQL = ' SELECT * FROM  PRODUTOS PD         '#13 +
        ' WHERE (PD.ID = :ID OR :ID = 0) ' ;
begin
  try
    qry.SQL.Text := SQL;
    qry.ParamByName('ID').AsInteger := idProduto;

    qry.Open;

    if qry.IsEmpty then
      raise Exception.Create('Nenhum produto foi localizado');

    Descricao     := qry.FindField('DESCRICAO').AsString;
    ValorUnitario := qry.FindField('ValorUnitario').AsCurrency;
    Estoque       := qry.FindField('Estoque').AsFloat;

  except
    raise;
  end;
end;

procedure TProdutos.ExcluirProdutos;
const
  SQL = 'DELETE FROM PRODUTOS WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [idProduto]);
  except
    raise;
  end;
end;

procedure TProdutos.InserirProdutos;
const
  SQL = ' INSERT INTO PRODUTOS (Descricao,   ValorUnitario,  Estoque) '#13+
        '               VALUES (:Descricao, :ValorUnitario, :Estoque) ';
begin
  try
    qry.ExecSQL(SQL, [Descricao,   ValorUnitario,  Estoque]);
  except
    raise;
  end;
end;

end.
