unit uDBController;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.DApt,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet;


type

  //Make sure the TdbController is not autocreated
  TdbController = class(TDataModule)
    Manager: TFDManager;
    procedure DataModuleCreate(Sender: TObject);
  strict private
   class var FInstance : TdbController;

  private
    { Private declarations }
    function IsConnectionDefined: Boolean;
    function GetConnectionDefName: String;
    function GetDriverName: String;



  public
    { Public declarations }
    function GetConnection: TFDConnection;
    function GetQuery: TFDQuery;
    procedure ReturnConnectionToPool(aQuery: TFDQuery); overload;
    procedure ReturnConnectionToPool(aConnection: TFDCustomConnection); overload;

    class destructor Destroy;
    class function Shared : TdbController;
  end;

var
  dbController: TdbController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uAppSettings;

{ TdbController }

function TdbController.GetConnection: TFDConnection;
begin
  //if the definition is not defined, create it in the manager
  if not IsConnectionDefined then
  begin
    var lParams := TStringList.Create;
    TAppSettings.Shared.LoadConnectionParams(lParams);
    try
      Manager.AddConnectionDef(
        self.GetConnectionDefName,
        self.GetDriverName,
        lParams,
        False); //False is not persisting the definition, it lives only in the application

    finally
      lParams.Free;
    end;
  end;

  Result := TFDConnection.Create(nil);
  Result.LoginPrompt := False;
  Result.ConnectionDefName := self.GetConnectionDefName;

end;

function TDbController.GetQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := self.GetConnection;
end;

procedure TDbController.ReturnConnectionToPool(aQuery: TFDQuery);
begin
   var lConnection := aQuery.Connection;
   aQuery.Free;
   ReturnConnectionToPool(lConnection);
end;

procedure TDbController.ReturnConnectionToPool(aConnection: TFDCustomConnection);
begin
   aConnection.Free;
end;



procedure TdbController.DataModuleCreate(Sender: TObject);
begin
  Manager.Active := True;
end;

class destructor TdbController.Destroy;
begin
  FInstance.Free;
end;

function TdbController.GetConnectionDefName: String;
begin
   Result := TAppSettings.Shared.ConnectionDefName;
end;

function TdbController.GetDriverName: String;
begin
  Result := TAppSettings.Shared.DriverName;
end;

function TdbController.IsConnectionDefined: Boolean;
begin
  Result := Manager.ConnectionDefs.FindConnectionDef(self.GetConnectionDefName) <> nil;
end;

class function TdbController.Shared: TdbController;
begin
  if not assigned(FInstance) then
    FInstance := TdbController.Create(nil);
  Result := FInstance;
end;

end.
