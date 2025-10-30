unit uDBCustomer;

interface

uses
  uDBController,
  uCustomerClasses;

Type
  TDBCustomerService = class(TObject)
  strict private
    Class var FInstance : TDbCustomerService;
    Class destructor Destroy;
  public
    Class function shared : TDbCustomerService;
    function LoadCustomersFromDB(aCustomers : TCustomers) : Boolean;
  end;


implementation


{ CREATE TABLE CUSTOMER (
  CUST_NO           INTEGER NOT NULL,
  CUSTOMER          VARCHAR(25) NOT NULL,
  CONTACT_FIRST     VARCHAR(15),
  CONTACT_LAST      VARCHAR(20),
  PHONE_NO          VARCHAR(20),
  ADDRESS_LINE1     VARCHAR(30),
  ADDRESS_LINE2     VARCHAR(30),
  CITY              VARCHAR(25),
  STATE_PROVINCE    VARCHAR(15),
  COUNTRY           VARCHAR(15),
  POSTAL_CODE       VARCHAR(12),
  ON_HOLD           CHAR(1) DEFAULT 'N' NOT NULL}


{ TDBCustomerService }

class destructor TDBCustomerService.Destroy;
begin
  FInstance.Free;
end;

function TDBCustomerService.LoadCustomersFromDB(
  aCustomers: TCustomers): Boolean;
begin
    var lQry := TDbController.Shared.GetQuery;
    try
      lQry.SQL.Add('SELECT * FROM CUSTOMER');
      while not lQry.Eof do
      begin
        var lCustomer := TCustomer.Create;
        lCustomer.CustNo := lQry.FieldByName('CUST_NO').AsInteger;
        lCustomer.Customer := lQry.FieldByName('CUSTOMER').AsString;
        finish this

      end;
    finally
      TdbController.Shared.ReturnConnectionToPool(lQry);
    end;
end;

class function TDBCustomerService.shared: TDbCustomerService;
begin
  if not Assigned(FInstance) then
    FInstance := TDbCustomerService.Create;
  Result := FInstance;
end;

end.
