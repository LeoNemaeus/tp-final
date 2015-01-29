unit G_ActSto;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

var
	arA:ArchivoArt;
	arF: ArchivoFac;
	A: arbolArt;
	B: arbolArt;	
	stock:word;

	Procedure consultaStock;
	Procedure agregarstock (var arA:ArchivoArt; pos:word; stock:word);
	Procedure removerstock (var arA:ArchivoArt; pos:word; stock:word);
	Procedure cprin (var A: arbolArt; B: arbolArt);

implementation

Procedure consultaStock;
	Begin
	clrscr;
	writeln ('   Que desea realizar?');
	writeln ('  ');
	writeln ('  ');
	writeln ('      1: Agregar Stock');
	writeln ('  ');
	writeln ('      2: Remover Stock');
	end;
	
	Procedure agregarstock (var arA:ArchivoArt; pos:word; stock:word);
	var
		datoA: tipoArt;
	begin
		leerArt(arA, datoA, pos);
		datoA.stock := datoA.stock + stock;
		escribirArt(arA, datoA);
	end;

Procedure removerstock (var arA:ArchivoArt; pos:word; stock:word);
var datoA: tipoArt;
begin
    leerArt(arA, datoA, pos);
	datoA.stock := datoA.stock - stock;
	escribirArt(arA, datoA);
end;

	Procedure codig;
	Begin
		clrscr;
		writeln ('                Buscar  por:');
		writeln ('  ');
		writeln ('  ');
		writeln ('              1: Codigo');
		writeln ('  ');
		writeln ('              2: Descripcion');
		writeln('  ');
		writeln ('              3: Ingresar nuevo producto');
	end;

Procedure cprin (var A: arbolArt; B: arbolArt);
var
	op: byte;
	codigo: word;
	opcion: char;
	descripcion: string;
	nodo: Art;
	cantidad: word;
	stock: word;
	aux:tipoArt;
	codi: word;
	pr:string[90];
	sto: word;
	stomin:byte;
	pcos: real;
	po: real;
	posic:word;

Begin
	Repeat
		codig;
		read(op);
		case op of
			1: Begin
				clrscr;
				writeln('              Ingrese el codigo del articulo ');
				read(codigo);
				buscarCodigo (A, codigo, nodo);
				consultaStock;
				read(op);
				if op=1 then
				begin
					clrscr;
					writeln('              Cuantos elementos desea agregar al stock?');
					read(stock);
					agregarstock (arA, nodo.pos, stock);
				end
				else
				begin
					if op=2 then
					begin
						clrscr;
						writeln('              Cuantos elementos desea remover del stock?');
						read(stock);
						removerstock (arA, nodo.pos, stock);
					end;
				end;
			end;
			2: Begin
				clrscr;
				write('              Ingrese la descripcion del articulo ');
				read(descripcion);
				clrscr;
				buscarDesc (B, descripcion, nodo);
				consultaStock;
				read(op);
				if op=1 then
				begin
					clrscr;
					textcolor(15);
					writeln('              Cuantos elementos desea agregar al stock?');
					read(stock);
					agregarstock (arA, nodo.pos, stock);
				end
				else
				begin
					if op=2 then
					begin
						clrscr;
						textcolor(15);
						writeln('              Cuantos elementos desea remover del stock?');
						read(stock);
						removerstock (arA, nodo.pos, stock);
					end;
				end;
			end;
			3: Begin
				clrscr;
				textcolor(15);
				writeln('              Ingrese la descripcion del producto: ');
				read(descripcion);
				aux.descripcion:= descripcion;
				clrscr;
				writeln ('              Ingrese el proveedor: ');
				readln(pr);
				aux.proveedor:=pr;
				clrscr;
				writeln('              Ingrese el codigo del producto: ');
				read(codi);
				aux.codigo := codi;
				clrscr;
				writeln('              Ingrese el stock: ');
				read(sto);
				aux.stock:= sto;
				clrscr;
				writeln('              Ingrese el stock minimo: ');
				read(stomin);
				aux.stockMin := stomin;
				clrscr;
				writeln('              Ingrese el precio de costo: ');
				read(pcos);
				aux.pCosto:= pcos;
				clrscr;
				writeln('              Ingrese el porcentaje de ganancias: ');
				read(po);
				po:= (po*aux.pCosto)/100;
				po := po + aux.pCosto;
				aux.pVenta:= po;
				escribirArt(arA, aux);
				assign(arA, rutaA);
				reset(arA); 
				posic:=filesize(arA);
				nodo.codigo:=codi;
				nodo.descripcion:=descripcion;
				nodo.pos:=posic;
				insertarArbol (A, nodo, B);
			end;
		end;
		clrscr;
		writeln(' ');
		writeln('              ¿Desea continuar con la actualizacion? (s/n)');
		read(opcion);
		clrscr;
	until (opcion = 'n');
end;

end.
