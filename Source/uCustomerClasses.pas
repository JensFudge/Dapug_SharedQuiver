unit uCustomerClasses;

interface

uses
  Generics.Collections;

Type

  // The DDL for CUSTOMER is defined as

  {
  CREATE TABLE CUSTOMER (
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
  ON_HOLD           CHAR(1) DEFAULT 'N' NOT NULL
);

ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY (CUST_NO);
}



  TCustomer = class(TObject)
  private
    FCustNo: Integer;
    FCompany: string;
    FAddr1: string;
    FAddr2: string;
    FCity: string;
    FState: string;
    FZip: string;
    FCountry: string;
    FPhone: string;
    FFax: string;
    FTaxRate: Double;
    FContact: string;
    FLastInvoiceDate: TDateTime;
  public
    constructor Create; virtual;
    procedure Clear; virtual;


    // Properties
     property CustNo: Integer read FCustNo write FCustNo;
    property Company: string read FCompany write FCompany;
    property Addr1: string read FAddr1 write FAddr1;
    property Addr2: string read FAddr2 write FAddr2;
    property City: string read FCity write FCity;
    property State: string read FState write FState;
    property Zip: string read FZip write FZip;
    property Country: string read FCountry write FCountry;
    property Phone: string read FPhone write FPhone;
    property Fax: string read FFax write FFax;
    property TaxRate: Double read FTaxRate write FTaxRate;
    property Contact: string read FContact write FContact;
    property LastInvoiceDate: TDateTime read FLastInvoiceDate write FLastInvoiceDate;
    function ToDebugString: string;


  end;


  TCustomers = class(TObjectList<TCustomer>)

  end;

  TCustomerDictionary = class(TObjectDictionary<integer, TCustomer>)

  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

procedure TCustomer.Clear;
begin
  FCustNo := 0;
  FCompany := '';
  FAddr1 := '';
  FAddr2 := '';
  FCity := '';
  FState := '';
  FZip := '';
  FCountry := '';
  FPhone := '';
  FFax := '';
  FTaxRate := 0.0;
  FContact := '';
  FLastInvoiceDate := 0; // 0 = not set
end;

constructor TCustomer.Create;
begin
  inherited Create;
  Clear;
end;

function TCustomer.ToDebugString: string;
begin
     Result := Format('CustNo=%d, Company="%s"',
                   [FCustNo, FCompany]);
end;

{ TCustomers }


end.
