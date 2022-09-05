//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 01', 'Brasilia 01', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 02', 'Brasilia 02', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 03', 'Brasilia 03', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 04', 'Brasilia 04', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 05', 'Brasilia 05', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 06', 'Brasilia 06', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 07', 'Brasilia 07', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 08', 'Brasilia 08', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 09', 'Brasilia 09', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 10', 'Brasilia 10', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 11', 'Brasilia 11', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 12', 'Brasilia 12', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 13', 'Brasilia 13', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 14', 'Brasilia 14', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 15', 'Brasilia 15', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 16', 'Brasilia 16', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 17', 'Brasilia 17', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 18', 'Brasilia 18', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 19', 'Brasilia 19', 'DF');
//INSERT INTO clientes(Nome, Cidade, Uf) values ('Jonas 20', 'Brasilia 20', 'DF');

unit untClientes;
interface
  uses
    untPadrao, System.Classes;

  type
    TClientes = class(TPadrao)
    private
    public
      idCliente : Integer;
      Nome      : String;
      Cidade    : String;
      UF        : String;
      procedure InserirCliente;
      procedure AlterarCliente;
      procedure ExcluirCliente;
      procedure ConsultarCliente(Lista : TStrings);
      procedure LimparEstrutura;
    end;

implementation
  uses
    System.SysUtils, FireDAC.DApt, FireDAC.Stan.Param, Forms;

{ TPessoa }

procedure TClientes.AlterarCliente;
const
  SQL = 'UPDATE CLIENTES SET NOME = :NOME, CIDADE = :CIDADE, UF = :UF WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [NOME, CIDADE, UF, idCliente]);
  except
    raise;
  end;
end;

procedure TClientes.ConsultarCliente(Lista : TStrings);
const
  SQL = 'SELECT CL.* FROM CLIENTES CL WHERE (CL.ID = :ID OR :ID = 0)';
var
  item : TClientes;
begin
  try
    qry.LimparQuery;
    qry.SQL.Text := SQL;
    qry.ParamByName('ID').AsInteger := idCliente;

    if Not(Nome.IsEmpty) then
      qry.SQL.Add(' AND Upper(CL.NOME) LIKE ''%' + UpperCase(NOME) + '%''');

    if Not(Cidade.IsEmpty) then
      qry.SQL.Add(' AND Upper(CL.CIDADE) LIKE ''%' + UpperCase(CIDADE) + '%''');

    qry.Open;

    while not(qry.Eof) do
    begin
      item           := TClientes.Create(Owner, conexao);
      item.idCliente := qry.FindField('Id').AsInteger;
      item.Nome      := qry.FindField('Nome').AsString;
      item.Cidade    := qry.FindField('Cidade').AsString;
      item.UF        := qry.FindField('UF').AsString;
      Lista.AddObject(Item.Nome, item);
      qry.Next;
    end;

  except
    raise;
  end;
end;

procedure TClientes.ExcluirCliente;
const
  SQL = 'DELETE FROM CLIENTES WHERE ID = :ID';
begin
  try
    qry.ExecSQL(SQL, [idCliente]);
  except
    raise;
  end;
end;

procedure TClientes.InserirCliente;
const
  SQL = 'INSERT INTO CLIENTES(NOME, CIDADE, UF) VALUES (:NOME, :CIDADE, :UF)';
begin
  try
    qry.ExecSQL(SQL, [NOME, CIDADE, UF]);
  except
    raise;
  end;
end;

procedure TClientes.LimparEstrutura;
begin
  Nome      := '';
  Cidade    := '';
  UF        := '';
  idCliente := 0;
end;

end.
