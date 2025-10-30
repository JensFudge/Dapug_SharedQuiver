program SharedQuiver;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {Form1},
  uAppSettings in 'uAppSettings.pas',
  uDBController in 'uDBController.pas' {dbController: TDataModule},
  uCustomerClasses in 'uCustomerClasses.pas',
  uCustomerService in 'uCustomerService.pas',
  uCustomerServiceImplementation in 'uCustomerServiceImplementation.pas',
  uDBCustomer in 'uDBCustomer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
