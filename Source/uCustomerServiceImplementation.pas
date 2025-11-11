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
     function GetCustomerDict : TCustomerDictionary;
   end;

implementation

{ TCustomerService }
uses
  uDBCustomer, System.Generics.Collections;

function TCustomerService.GetCustomers: TCustomers;
begin
  Result := TCustomers.Create;
  TDBCustomerService.shared.LoadCustomersFromDB(Result);

  assert(Result.OwnsObjects);
end;

function TCustomerService.GetCustomerDict: TCustomerDictionary;
begin
  Result := TCustomerDictionary.Create([doOwnsValues]);
  TDBCustomerService.shared.LoadCustomersFromDB(Result);
end;

procedure TCustomerService.GetCustomers(aCustomers: TCustomers);
begin
  TDBCustomerService.shared.LoadCustomersFromDB(aCustomers);
end;

end.
