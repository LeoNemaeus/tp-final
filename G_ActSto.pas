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
	textcolor(15);
	writeln ('   Que desea realizar?');
	writeln ('  ');
	writeln ('  ');
	writeln ('      1: Agregar Stock');
	writeln ('  ');
	writeln ('      2: Remover Stock');
	end;
	
	Procedure agregarstock (var arA:ArchivoArt; pos:word; stock:word);
var aux: tipoArt;

begin
     reset(arA);
	 seek(arA, pos);
     read(arA, aux);
     aux.stock := aux.stock + stock;
     seek(arA, pos);
     write(arA, aux);
end;

Procedure removerstock (var arA:ArchivoArt; pos:word; stock:word);
var aux: tipoArt;
begin
     reset(arA);
	 seek(arA, pos);
     read(arA, aux);
     aux.stock := aux.stock - stock;
     seek(arA, pos);
     write(arA, aux);
end;

	Procedure codig;
	Begin
		clrscr;
		textcolor(15);
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
	descri: string[140];
	provee:string[90];
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
				case op of
					1: Begin
						clrscr;
						textcolor(15);
						writeln('              Cuantos elementos desea agregar al stock?');
						read(stock);
						agregarstock (arA, nodo.pos, stock);
					end;
					2: Begin
						clrscr;
						textcolor(15);
						writeln('              Cuantos elementos desea remover del stock?');
						read(stock);
						removerstock (arA, nodo.pos, stock);
					end;
				end;
			end;
			2: Begin
				clrscr;
				writeln('              Ingrese la descripcion del articulo: ');
				read(descripcion);
				buscarDesc (B, descripcion, nodo);
				consultaStock;
				read(op);
				case op of
					1: Begin
						clrscr;
						textcolor(15);
						writeln('              Cuantos elementos desea agregar al stock?');
						read(stock);
						agregarstock (arA, nodo.pos, stock);
					end;
					2: Begin
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
				writeln('              Ingrese el codigo del producto: ');
				read(codi);
				clrscr;
				aux.codigo := codi;
				writeln('              Ingrese la descripcion del producto: ');
				read(descri);
				clrscr;
				aux.descripcion:= descri;
				writeln ('              Ingrese el proveedor: ');
				read(provee);
				aux.proveedor:=provee;
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
				crear (arA, arF);
				reset(arA);
				aux.pVenta:= po;
				posic:=filesize(arA)+1;
				seek(arA, posic);
				write(arA, aux);
				close(arA);
				nodo.codigo:=codi;
				nodo.descripcion:=descri;
				nodo.pos:=posic;
				insertarArbol (A, nodo);
			end;
		end;
		clrscr;
		textcolor(15);
		writeln('              ¿Desea continuar con la actualizacion? (s/n)');
		read(opcion);
	until opcion = 'n';
end;

end.
