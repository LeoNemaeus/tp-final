unit G_Venta;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos, tipos;

var
	total: real;

Procedure venta (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt; var lim:word; var total:real);
Procedure factura (var arF: ArchivoFac; var total: real; var lim: word);
Procedure opcion1 (var arA: ArchivoArt; var arF:ArchivoFac; var A: arbolArt; var B: arbolArt);

implementation

Procedure venta (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt; var lim:word; var total:real);
var
	R:reg;
	fin: word;
	op: word;
	codi: word;
	nodo:Art;
	datoA:tipoArt;
	cant: word;
	totlinea: real;
	x: tipoReg;
	descripcion_local: string;
begin
	lim:=0;
	total:=0;
	borrarReg (R);
	fin:=1;
	repeat
	clrscr;
	textcolor(2);
	writeln('  ');
	writeln('                              VENTA Y FACTURACION  ');
	textcolor(15);
	writeln('  ');
	writeln('  ');
	writeln('  ');
	writeln('                 Seleccione la opcion de busqueda del producto: ');
	writeln('  ');
	writeln('  ');
	writeln('                       1: Busqueda por Codigo ');
	writeln('  ');
	writeln('                       2: Busqueda por Descripcion ');
	readln(op);
	if op = 1 then
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                         Ingrese el codigo del producto: ');
		readln(codi);
		buscarCodigo (A, codi, nodo);
		leerArt(arA, datoA, nodo.pos);
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                    Ingrese la cantidad de productos a vender: ');
		readln(cant);
		totlinea:=0;
		if cant <= datoA.stock then
		begin
			totlinea:= cant*datoA.pVenta;
			total:= total+totlinea;
			x.codigo:= datoA.codigo;
			x.descri:= datoA.descri;
			x.cantidad:= cant;
			x.pUnitario:= datoA.pVenta;
			x.pFila:= totlinea;
			cargarReg (R, x, lim);
			datoA.stock:= datoA.stock-cant;
			ReEscArt(arA, datoA, nodo.pos);
		end
		else
		begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              VENTA Y FACTURACION  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('  ');
			writeln('                      EL STOCK DEL PRODUCTO NO ES SUFICIENTE! ');
			writeln('  ');
			writeln('                  La venta NO SE HA REALIZADO. Usted solo posee: ', datoA.stock);
			readkey;
		end;
	end;
	if op = 2 then
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		write('                      Ingrese la descripcion del producto: ');
		readln(descripcion_local);
		buscarDesc (B, descripcion_local, nodo);
		leerArt(arA, datoA, nodo.pos);
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                    Ingrese la cantidad de productos a vender: ');
		readln(cant);
		totlinea:=0;
		if cant <= datoA.stock then
		begin
			totlinea:= cant*datoA.pVenta;
			total:= total+totlinea;
			x.codigo:= datoA.codigo;
			x.descri:= datoA.descri;
			x.cantidad:= cant;
			x.pUnitario:= datoA.pVenta;
			x.pFila:= totlinea;
			cargarReg (R, x, lim);
			datoA.stock:= datoA.stock-cant;
			ReEscArt(arA, datoA, nodo.pos);
		end
		else
		begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              VENTA Y FACTURACION  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('  ');
			writeln('                      EL STOCK DEL PRODUCTO NO ES SUFICIENTE! ');
			writeln('  ');
			writeln('                  La venta NO SE HA REALIZADO. Usted solo posee: ', datoA.stock);
			readkey;
		end;
	end
	else
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
	end;
	clrscr;
	textcolor(2);
	writeln('  ');
	writeln('                              VENTA Y FACTURACION  ');
	textcolor(15);
	writeln('  ');
	writeln('  ');
	writeln('  ');
	writeln('                         1 : Continuar');
	writeln('  ');
	writeln('                         2 : Finalizar la venta');
	readln(fin);
	until (fin=2)
end;

Procedure factura (var arF: ArchivoFac; var total: real; var lim: word);
var
	pos: word;
	iv, cv: word;
	a, m, d, o: word;
	no: string;
	y: tipoFac;
	I: word;
begin
	posicionf(arF, pos);
	y.numFac:= pos;
	GetDate(a, m, d, o);
	y.fecha.anio:= a;
	y.fecha.mes:= m;
	y.fecha.dia:= d;
	clrscr;
	textcolor(2);
	writeln('  ');
	writeln('                              VENTA Y FACTURACION  ');
	textcolor(15);
	writeln('  ');
	writeln('  ');
	writeln('  ');
	writeln('                         Ingese el nombre del comprador');
	readln(no);
	y.nombre:=no;
	clrscr;
	textcolor(2);
	writeln('  ');
	writeln('                              VENTA Y FACTURACION  ');
	textcolor(15);
	writeln('  ');
	writeln('  ');
	writeln('  ');
	writeln('                        Ingrese la direccion del comprador: ');
	readln(no);
	y.direccion:=no;
	iva;
	readln(iv);
	if iv=1 then y.iva:= 'Resp. Insc.'
	else
	Begin
		if iv=2 then y.iva:= 'Resp. Monot.'
		else y.iva:='Cons. Final';
	end;
	cond_venta;
	readln(cv);
	if cv=1 then y.condVenta:= 'Credito'
	else y.condVenta:= 'Contado';
	y.total:=total;
	for I:= 1 to lim do
	begin
	   y.venta[I].codigo:= R[I].codigo;
	   y.venta[I].descri:= R[I].descri;
	   y.venta[I].cantidad:= R[I].cantidad;
	   y.venta[I].pUnitario:= R[I].pUnitario;
	   y.venta[I].pFila:= R[I].pFila;
	end;
	escribirFac(arF, y);
end;

Procedure opcion1 (var arA: ArchivoArt; var arF:ArchivoFac; var A: arbolArt; var B: arbolArt);
	var
		total: real;
		lim: word;
	begin
		lim:=0;
		venta(A, B, arA, lim, total);
		factura(arF, total, lim);
	end;

end.
