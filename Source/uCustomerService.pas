unit uCustomerService;

interface

uses
uCustomerClasses, System.Classes;

Type
   ICustomerService = interface(IInvokable)
      function GetCustomers : TCustomers;
   end;

implementation

end.
