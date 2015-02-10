unit Op1;
interface
uses Menu, Archivos, Arbol, crt, Vector, Dos, Tipos;

Procedure venta (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt; var lim:word; var total:real; var R:reg);
Procedure factura (var arF: ArchivoFac; var total: real; var lim: word; var R: reg);
Procedure opcion1 (var arA: ArchivoArt; var arF:ArchivoFac; var A: arbolArt; var B: arbolArt);

implementation

Procedure venta (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt; var lim:word; var total:real; var R: reg);
var
	fin: word;
	op: word;
	codi: word;
	nodo:Art;
	datoA:tipoArt;
	cant: word;
	totlinea: real;
	x: tipoReg;
	desc: string;
	salir: boolean;
begin
	total:=0;
	borrarReg (R, lim); //vector
	fin:=1;
	repeat
		presVenFac; //menu
		codig; //menu
		cargarArbol (A, B, arA);
		readln(op);
		if op = 1 then
		begin
			presVenFac; //menu
			writeln('                         Ingrese el codigo del producto: ');
			readln(codi);
			buscarCodigo (A, codi, nodo, salir); //arbol
			if (salir=false) then
			begin
				leerArt(arA, datoA, nodo.pos); //archivo
				presVenFac; //menu
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
					cargarReg (R, x, lim); //vector
					datoA.stock:= datoA.stock-cant;
					ReEscArt(arA, datoA, nodo.pos); //archivo
				end
				else
				begin
					presVenFac; //menu
					noSuf (datoA.stock); //menu
				end
			end
		end
		else
		if op = 2 then
		begin
			presVenFac; //menu
			writeln('                      Ingrese la descripcion del producto: ');
			readln(desc);
			buscarDesc (B, desc, nodo, salir); //arbol
			if (salir=false) then
			begin
				leerArt(arA, datoA, nodo.pos); //archivo
				presVenFac; //menu
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
					ReEscArt(arA, datoA, nodo.pos); //archivo
				end
				else
				begin
					presVenFac; //menu
					noSuf (datoA.stock); //menu
				end;
			end
		end;
		if op >= 3 then
		begin
			presVenFac; //menu
			writeln('                       La opcion seleccionada no es correcta ');
			readkey;
		end;
		presVenFac; //menu
		cierre; //menu
		readln(fin);
	until (fin=2)
end;

Procedure factura (var arF: ArchivoFac; var total: real; var lim: word; var R: reg);
var
	pos: word;
	iv: word;
	cv: word;
	a, m, d, o: word;
	no: string;
	nom: string;
	y: tipoFac;
	I: word;
	salir: boolean;
begin
	posicionf(arF, pos); //archivo
	y.numFac:= pos;
	GetDate(a, m, d, o); //Dos
	y.fecha.anio:= a;
	y.fecha.mes:=m;
	y.fecha.dia:=d;
	presVenFac; //menu
	writeln('                         Ingese el nombre del comprador');
	readln(nom);
	y.nombre:=nom;
	presVenFac; //menu
	writeln('                        Ingrese la direccion del comprador: ');
	readln(no);
	y.direccion:=no;
	iva; //menu
	readln(iv);
	if iv=1 then y.iva:= 'Resp. Insc.'
	else
	Begin
		if iv=2 then y.iva:= 'Resp. Monot.'
		else y.iva:='Cons. Final';
	end;
	cond_venta; //menu
	readln(cv);
	if cv=1 then y.condVenta:= 'Credito'
	else y.condVenta:= 'Contado';
	y.total:=total;
	y.limite:=lim;
	for I:= 1 to lim do
	begin
	   y.venta[I].codigo:= R[I].codigo;
	   y.venta[I].descri:= R[I].descri;
	   y.venta[I].cantidad:= R[I].cantidad;
	   y.venta[I].pUnitario:= R[I].pUnitario;
	   y.venta[I].pFila:= R[I].pFila;
	end;
	escribirFac(arF, y); //archivo
end;

Procedure opcion1 (var arA: ArchivoArt; var arF:ArchivoFac; var A: arbolArt; var B: arbolArt);
	var
		total: real;
		R: reg;
		lim: word;
		re: string;
		pos: word;
		aux: tipoFac;
	begin
		lim:=0;
		venta(A, B, arA, lim, total, R);
		if lim <> 0 then
		begin
			factura(arF, total, lim, R);
			posicionf(arF, pos);
			dec(pos);
			leerFac(arF, aux, pos); //archivo
			facturas (aux);
		end;
	end;

end.
