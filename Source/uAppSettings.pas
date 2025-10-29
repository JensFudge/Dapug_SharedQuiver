unit uAppSettings;

interface

uses
  System.Classes;

Type
  TAppSettings = class(TObject)
   strict private
    class var FInstance: TAppSettings;
   public
    class destructor Destroy;
    class function Shared : TAppSettings;
    procedure LoadConnectionParams(aParams: TStrings);
    function ConnectionDefName : String;
    function DriverName : string;
  end;

implementation

{ TAppSettings }

function TAppSettings.ConnectionDefName: String;
begin
   Result := 'SharedQuiverDB';
end;

class destructor TAppSettings.Destroy;
begin
  FInstance.Free;
end;

function TAppSettings.DriverName: string;
begin
  Result := 'IB'; //interbase
end;

procedure TAppSettings.LoadConnectionParams(aParams: TStrings);
begin
  //This could be read from an ini file
  //But for now I will just fill in by hardcode
  //[Connection]
  aParams.add('User_Name= SYSDBA');
  aParams.add('Password=masterkey');
  aParams.add('Database=C:\Users\Public\Documents\Embarcadero\Studio\37.0\Samples\Data\dbdemos.gdb');
  aParams.add('Server=Localhost');
  aParams.add('Port=3050');
  aParams.add('Pooling=True');


end;

class function TAppSettings.Shared: TAppSettings;
begin
  if not assigned(FInstance) then
    FInstance := TAppSettings.Create;
  Result := FInstance;
end;

end.
