program Calculadora;

{$APPTYPE CONSOLE}

uses
  Horse,
  System.SysUtils,
  UICalculadora in 'UICalculadora.pas',
  UCalculadora in 'UCalculadora.pas', IdWinsock2;

begin

   {THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end); }

 //Somar
 THorse.Get('/somar/:valor1/:valor2',
 procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
 var
   xValor1,
   xValor2: Double;
   xCalculadora: ICalculadora;
   xResultado: Double;
 begin
   if Req.Params.Count <> 2 then
   begin
     Res.Send('Parāmetros Incorretos!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
   begin
     Res.Send('Valor 1 Incorreto!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
   begin
     Res.Send('Valor 2 Incorreto!');
     Exit;
   end;

   xCalculadora := TCalculadora.Create;
   xResultado   := xCalculadora.Somar(xValor1, xValor2);

   Res.Send('Soma: ' + xResultado.ToString);
 end);

 //Subtrair
 THorse.Get('/Subtrair/:valor1/:valor2',
 procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
 var
   xValor1,
   xValor2: Double;
   xCalculadora: ICalculadora;
   xResultado: Double;
 begin
   if Req.Params.Count <> 2 then
   begin
     Res.Send('Parāmetros Incorretos!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
   begin
     Res.Send('Valor 1 Incorreto!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
   begin
     Res.Send('Valor 2 Incorreto!');
     Exit;
   end;

   xCalculadora := TCalculadora.Create;
   xResultado   := xCalculadora.Subtrair(xValor1, xValor2);

   Res.Send('Subtrair: ' + xResultado.ToString);
 end);

//Multiplicar
 THorse.Get('/Multiplicar/:valor1/:valor2',
 procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
 var
   xValor1,
   xValor2: Double;
   xCalculadora: ICalculadora;
   xResultado: Double;
 begin
   if Req.Params.Count <> 2 then
   begin
     Res.Send('Parāmetros Incorretos!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
   begin
     Res.Send('Valor 1 Incorreto!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
   begin
     Res.Send('Valor 2 Incorreto!');
     Exit;
   end;

   xCalculadora := TCalculadora.Create;
   xResultado   := xCalculadora.Multiplicar(xValor1, xValor2);

   Res.Send('Multiplicar: ' + xResultado.ToString);
    end);


//Dividir
 THorse.Get('/Dividir/:valor1/:valor2',
 procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
 var
   xValor1,
   xValor2: Double;
   xCalculadora: ICalculadora;
   xResultado: Double;
 begin
   if Req.Params.Count <> 2 then
   begin
     Res.Send('Parāmetros Incorretos!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
   begin
     Res.Send('Valor 1 Incorreto!');
     Exit;
   end;

   if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
   begin
     Res.Send('Valor 2 Incorreto!');
     Exit;
   end;

   xCalculadora := TCalculadora.Create;
   xResultado   := xCalculadora.Dividir(xValor1, xValor2);

   Res.Send('Dividir: ' + xResultado.ToString);
 end);

 THorse.Listen(9090,
 procedure(Horse: THorse)
 begin
   Writeln('Server is runing on port ' + IntToStr(Horse.Port));
 end);
end.