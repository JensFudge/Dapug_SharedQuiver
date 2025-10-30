unit uCustomerServiceImplementation;

interface

uses

System.Classes,
uCustomerService,
uCustomerClasses;

Type
  TCustomerService = class(TInterfacedObject, ICustomerService)
  public
     function GetCustomers: TCustomers;
   end;

implementation

{ TCustomerService }

function TCustomerService.GetCustomers: TCustomers;
begin
  Result := TCustomers.Create;

end;

end.
