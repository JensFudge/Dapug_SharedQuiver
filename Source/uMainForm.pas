unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uCustomerService, uCustomerServiceImplementation,
  uCustomerClasses,
  FireDAC.Comp.Client;

procedure TForm1.Button1Click(Sender: TObject);
begin
  var lService : ICustomerService;
  lService := TCustomerService.Create;

  //var lCustomers := TCustomers.Create;
  //lService.GetCustomers(lCustomers) ;

  var lCustomers := lService.GetCustomers;

  try
    for var lCustomer in lCustomers do
    begin
      ListBox1.Items.Add(lCustomer.ToDebugString);

    end;
  finally

    lCustomers.Clear;
    lCustomers.Free;

  end;
end;




end.
