unit UTaxService;

interface

type
  ITaxService = interface
     //CTRL+SHIFT+G  - GUIID
    ['{7D3A31F7-DC1E-4D65-9127-28C1764BE503}']

    function Tax(const aAmount: Double): Double;
  end;

implementation

end.
