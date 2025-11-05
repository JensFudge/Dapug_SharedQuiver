unit uCustomerServiceImplementation;

interface

uses

System.Classes,
uCustomerService,
uCustomerClasses;

Type
  TCustomerService = class(TInterfacedObject, ICustomerService)
  public
     function GetCustomers: TCustomers; overload;
     procedure GetCustomers (aCustomers : TCustomers); overload;
   end;

implementation

{ TCustomerService }
uses
  uDBCustomer;

function TCustomerService.GetCustomers: TCustomers;
begin
  Result := TCustomers.Create;
  TDBCustomerService.shared.LoadCustomersFromDB(Result);

  assert(Result.OwnsObjects);
end;

procedure TCustomerService.GetCustomers(aCustomers: TCustomers);
begin
  TDBCustomerService.shared.LoadCustomersFromDB(aCustomers);
end;

end.
