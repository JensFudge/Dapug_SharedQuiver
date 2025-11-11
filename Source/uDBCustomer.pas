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
    function LoadCustomersFromDB(var  aCustomers : TCustomers) : Boolean; overload;
    function LoadCustomersFromDB(var  aCustomers : TCustomerDictionary) : Boolean; overload;
  end;


implementation


{ CREATE TABLE CUSTOMER (
  CUSTNO           INTEGER NOT NULL,
  COMPANY          VARCHAR(25) NOT NULL,
  ADDR1            VARCHAR
  ADDR2            VARCHAR
  CITY             VARCHAR
  STATE            VARCHAR
  ZIP              VARCHAR
  COUNTRY          VARCHAR
  PHONE            VARCHAR
  FAX              VARCHAR
  TAXRATE          DOUBLE
  CONTACT          VARCHAR
  LASTINVOICEDATE  DATE

{ TDBCustomerService }

class destructor TDBCustomerService.Destroy;
begin
  FInstance.Free;
end;

function TDBCustomerService.LoadCustomersFromDB(
 var  aCustomers: TCustomers): Boolean;
begin
    var lQry := TDbController.Shared.GetQuery;
    try
      lQry.SQL.Add('SELECT * FROM CUSTOMER');
      lQry.Open;
      while not lQry.Eof do
      begin
        var lCustomer := TCustomer.Create;
        lCustomer.CustNo          := lQry.FieldByName('CUSTNO').AsInteger;
        lCustomer.Company         := lQry.FieldByName('COMPANY').AsString;
        lCustomer.Addr1           := lQry.FieldByName('ADDR1').AsString;
        lCustomer.Addr2           := lQry.FieldByName('ADDR2').AsString;
        lCustomer.City            := lQry.FieldByName('CITY').AsString;
        lCustomer.State           := lQry.FieldByName('STATE').AsString;
        lCustomer.Zip             := lQry.FieldByName('ZIP').AsString;
        lCustomer.Country         := lQry.FieldByName('COUNTRY').AsString;
        lCustomer.Phone           := lQry.FieldByName('PHONE').AsString;
        lCustomer.Fax             := lQry.FieldByName('FAX').AsString;
        lCustomer.TaxRate         := lQry.FieldByName('TAXRATE').AsFloat;
        lCustomer.Contact         := lQry.FieldByName('CONTACT').AsString;
        lCustomer.LastInvoiceDate := lQry.FieldByName('LASTINVOICEDATE').AsDateTime;
        aCustomers.Add(lCustomer);
        lQry.Next;
      end;
    finally
      TdbController.Shared.ReturnConnectionToPool(lQry);
    end;
end;

function TDBCustomerService.LoadCustomersFromDB(
  var aCustomers: TCustomerDictionary): Boolean;
begin

  var lCustomers := TCustomers.Create(false);
  try
    LoadCustomersFromDB(lCustomers);
    for var lCustomer in lCustomers do
      aCustomers.Add(lCustomer.CustNo, lCustomer);
  finally
    lCustomers.Free;
  end;
end;

class function TDBCustomerService.shared: TDbCustomerService;
begin
  if not Assigned(FInstance) then
    FInstance := TDbCustomerService.Create;
  Result := FInstance;
end;

end.
