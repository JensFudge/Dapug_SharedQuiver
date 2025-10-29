program SharedQuiver;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {Form1},
  uAppSettings in 'uAppSettings.pas',
  uDBController in 'uDBController.pas' {dbController: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
