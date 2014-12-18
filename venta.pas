{Creado: 13/12/2014
Autor: Giuliana Miret
Decripcion: Punto uno de venta y facturacion
}

{Variables para el cuerpo principal}
unit venta;

interface

implementation

v: t_vector;
existe: boolena;
A: paArticulo;
aux: paArticulo;
totlinea: real;
total: real;
cant: word;
cod: word;
lim: word;
res: string[1]; //'s', 'n'
I: word;
iv: string;
anio: word;
mes:word;
dia:word;
cv: string;
nfac: word;
fFact: fFactura;


			'1': Begin
					{venta/facturacion}
					{no puede haber objetos con codigo = 0}
						total:= 0;
						lim := 0;
					Repeat
						read(cod);
						buscarArbolCodigo(A, cod, existe, aux);
						totlinea := 0;
						if existe=true then
						begin
							verif_cod (aux);
							read(res);
							if res = 's' then
							Begin
								writeln('Ingrese cantidad de unidades: ');
								read(cant);
								if cant >= aux^.info.stock then
									venta(lim, totlinea, total, cant, aux);
								else
								Begin
									writeln ('El stock no es sufuciente');
									writeln('Usted solo posee ',aux^.info.stock,' unidades.');
								End
							end
						end	
						else writeln('Codigo no encontrado');
						writeln('¿Desea agregar otro producto?: (s/n) ');		
						read(res);
					until res = 'n';
// FACTURACION
					iva_comp (iv);
					GetDate( anio, mes, dia); {para obtener la fecha desde Dos};
					Cventa(cv);
					{Para obtener el numero de factura}
					nfac:=( filepos(fFact)+1); {+1 xq sino todas las facturas van a tener el mismo numero}
					facturas (total, dia, mes, anio, cv, iv, nfac);	
					insertfac (dato, v, nfac, dia, mes, anio, iv, cv, total);
					escribirDato(f, dato);
					
				end; {fin punto 1}


Procedure insertfac (var dato: tFactura, var v: t_vector, nfac: word, dia:word, mes:word, anio:word, iv: string, cv: string, total:real);
Begin
	dato.nFactura := nfac;
	dato.fecha.d := dia;
	dato.fecha.m := mes;
	dato.fecha.a := anio;
	dato.nombre := 'Don Justo S.A.';
	dato.direccion := '12 de Abril 258-Colon-E.R.'
	dato.iva :=iv;
	dato.condicion_venta := cv;
	dato.venta.codigo := v[lim].codigo;
	dato.venta.cantidad := v[lim].cantidad;
	dato.venta.descripcion := v[lim].descripcion;
	dato.venta.precio_unitario := v[lim].precio_unitario;
	dato.venta.precio_fila := v[lim].precio_fila;
	dato.total := total;
End;				

Procedure insertelem (var v: t_vector, x: tVenta, lim: word);
Begin
	v[lim].codigo := x.codigo;
	v[lim].cantidad := x.cantidad;
	v[lim].descripcion := x.descripcion;
	v[lim].precio_unitario := x.precio_unitario;
	v[lim].precio_fila := x.precio_fila;
End;


Procedure dato (var x: tVenta, cod: word, cant: word, totlinea: real, aux: paArticulo);
Begin
	x.codigo := cod;
	x.cantidad := cant;
	x.descripcion := aux^.info.descripcion;
	x.precio_unitario := aux^.info.precio_venta;
	x.precio_fila := totlinea;
End;

Procedure venta (lim: word, var totlinea: real ,var total:real, cant: word, aux: paArticulo);
var
	x:tVenta;
Begin
	totlinea:= cant * aux^.info.precio_venta;
	total := total + totlinea;
	if lim < 15 then
	Begin	
		inc(lim);
		dato(x, cod, cant, totlinea, aux);
		insertelem(v[lim], x);
	end;
end;

Procedure iva_comp (var iv: string);
var iv:byte;
Begin
	repeat
		iva;
		read(ivaa);
	until ivaa in [1..3];
	if ivaa=1 then iv:= 'Resp. Insc.';
	else
	Begin
		if ivaa=2 then iv:= 'Resp. Monot.'
		else iv:='Cons. Final';
	end;
End;

Procedure Cventa (var cv: string);
var ccvv:byte;
Begin
	repeat
		cond_venta;
		read(ccvv);
	until ccvv in [1..2];
	if ccvv=1 then cv:= 'Contado';
	else cv:= 'Credito';
End;

end.