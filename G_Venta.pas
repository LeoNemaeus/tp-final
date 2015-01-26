unit G_Venta;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos;

	Procedure venta(var lim: word; var R: reg);
	Procedure iva_comp (var iv: string);
	Procedure Cventa (var cv: string);
	Procedure facturacion (var lim:word; var R: reg; var arF: ArchivoFac; total: real);


implementation

	Procedure venta(var lim: word; var R: reg);
	var
		total: real;
		arA: ArchivoArt;
		aux:tipoArt;
		des: string[140];
		op:word;
		x: tipoReg;
		cod: word;
		re: string[3];
                arF: ArchivoFac;
		A: arbolArt;
		B: arbolArt;
		nodo: Art;
		cant: word;
		totlinea: real;
	Begin
		crear (arA, arF);
		total:=0;
		lim:= 0;
		borrarReg (R);
		Repeat
			textcolor(15);
			writeln ('   Buscar  por:');
			writeln ('  ');
			writeln ('  ');
			writeln ('      1: Codigo');
			writeln ('  ');
			writeln ('      2: Descripcion');
			read(op);
			case op of
				1: Begin
					totlinea:=0;
					writeln(' Ingrese el codigo del producto: ');
					read(cod);
					buscarCodigo (A, cod, nodo);
					reset(arA);
					seek(arA, nodo.pos);
					read(arA, aux);
					writeln('Ingrese la cantidad de producto a vender: ');
					read(cant);
					if cant <= aux.stock then
					Begin
						totlinea:= cant*aux.pVenta;
						total:= total+totlinea;
						x.codigo:= aux.codigo;
						x.descripcion:= aux.descripcion;
						x.cantidad:= cant;
						x.pUnitario:= aux.pVenta;
						x.pFila:= totlinea;
						cargarReg (R, x, lim);
						aux.stock:= aux.stock-cant;
						reset(arA);
						seek(arA, nodo.pos);
						write(arA, aux);
					end
					else
					begin
						writeln(' El stock no es suficiente');
						writeln(' Usted solo posee: ', aux.stock);
					end;
				end;
				2: Begin
					totlinea:=0;
					writeln(' Ingrese la descripcion: ');
					read(des);
					buscarDesc (B, des, nodo);
					reset(arA);
					seek(arA, nodo.pos);
					read(arA, aux);
					writeln('Ingrese la cantidad de producto a vender: ');
					read(cant);
					if cant <= aux.stock then
					Begin
						totlinea:= cant*aux.pVenta;
						total:= total+totlinea;
						x.codigo:= aux.codigo;
						x.descripcion:= aux.descripcion;
						x.cantidad:= cant;
						x.pUnitario:= aux.pVenta;
						x.pFila:= totlinea;
						cargarReg (R, x, lim);
						aux.stock:= aux.stock-cant;
						reset(arA);
						seek(arA, nodo.pos);
						write(arA, aux);
					end
					else
					begin
						writeln(' El stock no es suficiente');
						writeln(' Usted solo posee: ', aux.stock);
					end;
				end;			
			end;
			writeln('Finalizar venta? (s/n)');
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
                arA: ArchivoArt;
	begin
		crear (arA, arF);
		pos:= filesize(arF)+1;
		y.numFac:= pos;
		GetDate(a, m, d, o);
		y.fecha.anio:= a;
		y.fecha.mes:=m;
		y.fecha.dia:=d;
		writeln('Ingrese el nombre del comprador: ');
		read(no);
		y.nombre:=no;
		writeln('Ingrese la direccion del comprador: ');
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
		reset(arF);
		seek(arF, pos);
		write(arF, y);
		close(arF)
	end;
	
end.
