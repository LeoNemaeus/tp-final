unit G_Venta;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos;

var
	total: real;

	Procedure venta(var lim: word; var R: reg; var arA: ArchivoArt; var A: arbolArt; var B: arbolArt; var total: real);
	Procedure iva_comp (var iv: string);
	Procedure Cventa (var cv: string);
	Procedure facturacion (var lim:word; var R: reg; var arF: ArchivoFac; total: real);


implementation

	Procedure venta(var lim: word; var R: reg; var arA: ArchivoArt; var A: arbolArt; var B: arbolArt; var total: real);
	var
		datoA:tipoArt;
		des: string[140];
		op:word;
		x: tipoReg;
		cod: word;
		re: string[3];
		nodo: Art;
		cant: word;
		totlinea: real;
	Begin
		total:=0;
		lim:= 0;
		borrarReg (R);
		Repeat
			clrscr;
			textcolor(15);
			writeln ('                            Buscar  por:');
			writeln ('  ');
			writeln ('  ');
			writeln ('                   1: Codigo');
			writeln ('  ');
			writeln ('                   2: Descripcion');
			read(op);
			case op of
				1: Begin
					clrscr;
					totlinea:=0;
					writeln('                            Ingrese el codigo del producto: ');
					read(cod);
					buscarCodigo (A, cod, nodo);
					leerArt(arA, datoA, nodo.pos);
					clrscr;
					writeln('                            Ingrese la cantidad de producto a vender: ');
					read(cant);
					if cant <= datoA.stock then
					Begin
						totlinea:= cant*datoA.pVenta;
						total:= total+totlinea;
						x.codigo:= datoA.codigo;
						x.descripcion:= datoA.descripcion;
						x.cantidad:= cant;
						x.pUnitario:= datoA.pVenta;
						x.pFila:= totlinea;
						cargarReg (R, x, lim);
						datoA.stock:= datoA.stock-cant;
						escribirArt(arA, datoA);
					end
					else
					begin
						clrscr;
						writeln('                             El stock no es suficiente');
						writeln('                            Usted solo posee: ', datoA.stock);
					end;
				end;
				2: Begin
					totlinea:=0;
					clrscr;
					writeln('                             Ingrese la descripcion: ');
					read(des);
					buscarDesc (B, des, nodo);
					leerArt(arA, datoA, nodo.pos);
					clrscr;
					writeln('                             Ingrese la cantidad de producto a vender: ');
					read(cant);
					if cant <= datoA.stock then
					Begin
						totlinea:= cant*datoA.pVenta;
						total:= total+totlinea;
						x.codigo:= datoA.codigo;
						x.descripcion:= datoA.descripcion;
						x.cantidad:= cant;
						x.pUnitario:= datoA.pVenta;
						x.pFila:= totlinea;
						cargarReg (R, x, lim);
						datoA.stock:= datoA.stock-cant;
						escribirArt(arA, datoA);
					end
					else
					begin
						clrscr;
						writeln('                   El stock no es suficiente');
						writeln('                  Usted solo posee: ', datoA.stock);
					end;
				end;			
			end;
			clrscr;
			writeln('          Finalizar venta? (s/n)');
			read(re)
		until (re='s')
	end;

	Procedure iva_comp (var iv: string);
	var ivaa:byte;
	Begin
		repeat
			iva;
			read(ivaa);
		until ivaa in [1..3];
		if ivaa=1 then iv:= 'Resp. Insc.'
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
		if ccvv=1 then cv:= 'Contado'
		else cv:= 'Credito'
	End;
	
	Procedure facturacion (var lim:word; var R: reg; var arF: ArchivoFac; total: real);
	var
		pos: word;
		no: string;
		y:tipoFac;
		a, m, d, o: word;
		iv: string;
		cv: string[8];
		I:word;
        
	begin
		pos:= filesize(arF);
		y.numFac:= pos;
		GetDate(a, m, d, o);
		y.fecha.anio:= a;
		y.fecha.mes:=m;
		y.fecha.dia:=d;
		clrscr;
		writeln('            Ingrese el nombre del comprador: ');
		read(no);
		y.nombre:=no;
		clrscr;
		writeln('             Ingrese la direccion del comprador: ');
		read(no);
		y.direccion:=no;
		iva_comp (iv);
		y.iva:=iv;
		Cventa (cv);
		y.condVenta:=cv;
		y.total:=total;
		for I:= 1 to lim do
		begin
			   y.venta[I].codigo:= R[I].codigo;
			   y.venta[I].descripcion:= R[I].descripcion;
			   y.venta[I].cantidad:= R[I].cantidad;
			   y.venta[I].pUnitario:= R[I].pUnitario;
			   y.venta[I].pFila:= R[I].pFila;
		end;
		escribirFac(arF, y);
	end;
	
end.
