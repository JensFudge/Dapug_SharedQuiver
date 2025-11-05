unit uCustomerService;

interface

uses
uCustomerClasses, System.Classes;

Type
   ICustomerService = interface
      function GetCustomers : TCustomers; overload;
      procedure GetCustomers (aCustomers : TCustomers); overload;
   end;

implementation

end.
