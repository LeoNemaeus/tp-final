Unit stock;
interface
uses crt, menu, tipos, arboles;

Procedure agregarstock (var ar:aArticulo; pos:word; stock:word);
Procedure removerstock (var ar:aArticulo; pos:word; stock:word);

implementation

Procedure agregarstock (var ar:aArticulo; pos:word; stock:word);
var aux: tArticulos;

begin
     seek(ar, pos);
     read(ar, aux);
     aux.stock := aux.stock + stock;
     seek(ar, pos);
     write(ar, aux)
end;

Procedure removerstock (var ar:aArticulo; pos:word; stock:word);
var aux: tArticulos;
begin
     seek(ar, pos);
     read(ar, aux);
     aux.stock := aux.stock - stock;
     seek(ar, pos);
     write(ar, aux);
end;

End.
