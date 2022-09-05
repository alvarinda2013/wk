unit untExecutaSQL;


interface
  uses
    FireDAC.Comp.Client, System.Classes, Data.DB;

  type
  TExecutaSQL = class(TFDQuery)
  protected
    procedure GravaLog(sLog: String);
    procedure CopiarParaAreaDeTransferencia;
  private
  public
    conexao    : TFDConnection;
    sSQL : String;
    procedure ExecSQL;overload;
    procedure ExecSQL(const sSQL : String);overload;
    procedure Post; reintroduce;overload;
    procedure Open;overload;
    procedure Open(Const sSQL : String);overload;
    function FindField(const FieldName: string): TField;
    constructor Create(Owner : TComponent; Conexao : TFDConnection);reintroduce; overload;
    procedure LimparQuery;

  end;

implementation
  uses
    System.SysUtils, ClipBrd, FireDAC.Stan.Option;

{ TExecutaSQL }

procedure TExecutaSQL.CopiarParaAreaDeTransferencia;
begin
  Clipboard.AsText := Self.SQL.Text;
end;

constructor TExecutaSQL.Create(Owner: TComponent; Conexao : TFDConnection);
begin
  inherited create(owner);
  conexao  := Conexao;
  Self.Connection := conexao;
  Self.FetchOptions.Items := Self.FetchOptions.Items - [fiMeta];
end;

procedure TExecutaSQL.ExecSQL(const sSQL: String);
begin
  try
    SQL.Text := sSQL;
    ExecSQL;
  except
    raise;
  end;
end;

function TExecutaSQL.FindField(const FieldName: string): TField;
begin
  result := inherited;
end;

procedure TExecutaSQL.GravaLog(sLog: String);
var
  sPath: String;
  sl : TStrings;
begin
  try
    sPath := ExtractFilePath(ParamStr(0)) + 'Log';

    if not DirectoryExists(sPath) then
      ForceDirectories(sPath);

    sPath := sPath + '\LogErro.txt';

    sl := TStringList.Create;

    if FileExists(sPath) then
      sl.LoadFromFile(sPath);

    sl.Append(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now) + ' - ' + sLog);
    sl.SaveToFile(sPath);
  finally
    FreeAndNil(sl);
  end;
end;

procedure TExecutaSQL.ExecSQL;
begin
  try
    try
      inherited;
    except
      on e: exception do
      begin
        if DebugHook <> 0 then       
          CopiarParaAreaDeTransferencia;
        GravaLog('Erro: ' + e.Message);
        raise;
      end;
    end;
  finally
    LimparQuery;
  end;
end;

procedure TExecutaSQL.LimparQuery;
begin
  Self.Close;
  Self.SQL.Clear;
  Self.Params.Clear;
end;

procedure TExecutaSQL.Open;
begin
  try
    Self.Connection.StartTransaction;
    inherited;
    Self.First;
    Self.Connection.Commit;
  except
    on e: exception do
    begin
      Self.Connection.Rollback;
      CopiarParaAreaDeTransferencia;
      GravaLog('Erro: ' + e.Message);
      raise;
    end;
  end;
end;

procedure TExecutaSQL.Open(Const sSQL : String);
begin
  try
    Self.Connection.StartTransaction;
    inherited;
    Self.Connection.Commit;
  except
    on e: exception do
    begin
      Self.Connection.Rollback;
      CopiarParaAreaDeTransferencia;
      GravaLog('Erro: ' + e.Message);
      raise;
    end;
  end;
end;

procedure TExecutaSQL.Post;
begin
  try
    Self.Connection.StartTransaction;
    inherited;
    Self.First;
    Self.Connection.Commit;
  except
    on e: exception do
    begin
      Self.Connection.Rollback;
      CopiarParaAreaDeTransferencia;
      GravaLog('Erro: ' + e.Message);
      raise;
    end;
  end;
end;

end.
