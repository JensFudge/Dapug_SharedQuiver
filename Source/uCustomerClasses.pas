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
    FPostalCode: string;
    FAddressLine2: string;
    FCustomer: string;
    FAddressLine1: string;
    FCountry: string;
    FStateProvince: string;
    FContactFirst: string;
    FPhoneNo: string;
    FCity: string;
    FContactLast: string;
    FOnHold: string;
  public
    constructor Create; virtual;
    procedure Clear; virtual;


    // Properties
    property CustNo: Integer read FCustNo write FCustNo;
    property Customer: string read FCustomer write FCustomer;

    property ContactFirst: string read FContactFirst write FContactFirst;
    property ContactLast : string read FContactLast  write FContactLast;
    property PhoneNo     : string read FPhoneNo      write FPhoneNo;
    property AddressLine1: string read FAddressLine1 write FAddressLine1;
    property AddressLine2: string read FAddressLine2 write FAddressLine2;
    property City        : string read FCity         write FCity;
    property StateProvince: string read FStateProvince write FStateProvince;
    property Country     : string read FCountry      write FCountry;
    property PostalCode  : string read FPostalCode   write FPostalCode;
    property OnHold      : string read FOnHold       write FOnHold;
    function ToDebugString: string;


  end;


  TCustomers = class(TObjectList<TCustomer>)
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

procedure TCustomer.Clear;
begin
  FCustNo        := 0;
  FCustomer      := '';
  FContactFirst  := '';
  FContactLast   := '';
  FPhoneNo       := '';
  FAddressLine1  := '';
  FAddressLine2  := '';
  FCity          := '';
  FStateProvince := '';
  FCountry       := '';
  FPostalCode    := '';
  FOnHold        := 'N';
end;

constructor TCustomer.Create;
begin
  inherited Create;
  Clear;
end;

function TCustomer.ToDebugString: string;
begin
     Result := Format('CustNo=%d, Customer="%s"',
                   [FCustNo, FCustomer]);
end;

end.
