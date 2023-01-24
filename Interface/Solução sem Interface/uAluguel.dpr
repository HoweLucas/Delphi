program uAluguel;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uCarRental in 'Model\uCarRental.pas',
  UVehicle in 'Model\UVehicle.pas',
  UInvoice in 'Model\UInvoice.pas',
  URentalService in 'Services\URentalService.pas',
  UBrazilTaxService in 'Services\UBrazilTaxService.pas';

var
  xCarModel: String;
  xStrStart, xStrFinish: String;
  xStart, xFinish: TDateTime;
  xCarRental: TCarRental;
  xStrPricePerhour, xStrPricePerDay: String;
  xPricePerHour, xPricePerDay: Double;
  xRentalService: TRentalService;

begin
  try
    Writeln('Entre com os dados do aluguel:');
    Writeln('Modelo do Carro:');
    Readln(xCarModel);

    Writeln('Retirada (dd/mm/yyyy hh:mm):');
    Readln(xStrStart);
    xStart := StrToDateTime(xStrStart);

    Writeln('Retorno (dd/mm/yyyy hh:mm):');
    Readln(xStrFinish);
    xFinish := StrToDateTime(xStrFinish);

    xCarRental := TCarRental.Create(xStart, xFinish, TVehicle.Create(xCarModel));

    Writeln('Entre com o pre�o por hora:');
    Readln(xStrPricePerHour);
    xPricePerHour := StrToFloatDef(xStrPricePerHour,0);

    Writeln('Entre com o pre�o por dia:');
    Readln(xStrPricePerDay);
    xPricePerDay := StrToFloatDef(xStrPricePerDay,0);

    xRentalService := TRentalService.Create(xPricePerDay, xPricePerHour,
      TBrazilTaxService.Create);
    xRentalService.ProcessInvoice(xCarRental);

    Writeln('FATURA:');
    Writeln('Pagamento b�sico...:', xCarRental.Invoice.BasicPayment.ToString);
    Writeln('Imposto............:', xCarRental.Invoice.Tax.ToString);
    Writeln('Total..............:', xCarRental.Invoice.TotalPayment.ToString);

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
