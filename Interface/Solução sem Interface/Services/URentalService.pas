unit URentalService;


interface

uses
  UCarRental, UBrazilTaxService;

type
 TRentalService = class
   private
     FPricePerDay  : Double;
     FPricePerHour : Double;

     FTaxService: TBrazilTaxService;
   public
     Constructor Create(const aPricePerDay, aPricePerHour: Double;
       aTaxService: TBrazilTaxService);
     destructor Destroy; override;

     procedure ProcessInvoice(aCarRental: TCarRental);

 end;

implementation

uses
  System.SysUtils, math, DateUtils, UInvoice;





{ TRentalService }

constructor TRentalService.Create(const aPricePerDay, aPricePerHour: Double;
  aTaxService: TBrazilTaxService);
begin
  FPricePerDay  := aPricePerDay;
  FPricePerHour := aPricePerHour;
  FTaxService   := aTaxService;
end;

destructor TRentalService.Destroy;
begin
  FreeAndNil(FTaxService);
  inherited;
end;

procedure TRentalService.ProcessInvoice(aCarRental: TCarRental);
var
  xHours : Double;
  xBasicsPayment: Double;
  xTax: Double;
begin
  xHours := DateUtils.MilliSecondsBetween(aCarRental.Finish, aCarRental.Start)
    / 1000 / 60 / 60;

    if xHours <= 12 then
      xBasicsPayment := FPricePerHour * Math.ceil(xHours)
    else
      xBasicsPayment := FPricePerDay * Math.ceil(xHours / 24);

    xTax := FTaxService.Tax(xBasicsPayment);

    aCarRental.Invoice := TInvoice.create(xBasicsPayment, xTax);
end;

end.
