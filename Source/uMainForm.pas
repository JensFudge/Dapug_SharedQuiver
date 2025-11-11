unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  uCustomerClasses, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    SearchBox1: TSearchBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
  private
    { Private declarations }
    fCustomerDict : TCustomerDictionary;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  uCustomerService, uCustomerServiceImplementation,

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




procedure TForm1.Button2Click(Sender: TObject);
begin
  var lService : ICustomerService;
  lService := TCustomerService.Create;

  fCustomerDict.Free;
  fCustomerDict :=   lService.GetCustomerDict;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fCustomerDict := TCustomerDictionary.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  fCustomerDict.Free;
end;

procedure TForm1.SearchBox1InvokeSearch(Sender: TObject);
begin
  var lCustNo : integer := StrToIntDef(SearchBox1.Text, 0);
  var lCustomer : TCustomer;
  if fCustomerDict.TryGetValue(lCustNo, lCustomer) then
    ShowMessage(lCustomer.ToDebugString);


  try
    lCustomer := fCustomerDict[lCustNo];
    ShowMessage(lCustomer.ToDebugString);
  except on EListError do
    ShowMessage('Customer not found');

  end;

end;

end.
