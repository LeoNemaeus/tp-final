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
     seek(arA, pos);
     read(arA, aux);
     aux.stock := aux.stock + stock;
     seek(arA, pos);
     write(arA, aux);
end;

Procedure removerstock (var arA:ArchivoArt; pos:word; stock:word);
var aux: tipoArt;
begin
     seek(arA, pos);
     read(arA, aux);
     aux.stock := aux.stock - stock;
     seek(arA, pos);
     write(arA, aux);
end;

	Procedure codig;
	Begin
		textcolor(15);
		writeln ('   Buscar  por:');
		writeln ('  ');
		writeln ('  ');
		writeln ('      1: Codigo');
		writeln ('  ');
		writeln ('      2: Descripcion');
		writeln('  ');
		writeln('       3: Ingresar nuevo producto');
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
Begin
	Repeat
		codig;
		read(op);
		case op of
			1: Begin
				read(codigo);
				buscarCodigo (A, codigo, nodo);
			end;
			2: Begin
				read(descripcion);
				buscarDesc (B, descripcion, nodo);
			end;
			3: Begin
				writeln('Ingrese el codigo del producto: ');
				read(codi);
				aux.codigo := codi;
				writeln('Ingrese la descripcion del producto: ');
				read(descri);
				aux.descripcion:= descri;
				writeln ('Ingrese el proveedor: ');
				read(provee);
				aux.proveedor:=provee;
				writeln('Ingrese el stock: ');
				read(sto);
				aux.stock:= sto;
				writeln('Ingrese el stock minimo: ');
				read(stomin);
				aux.stockMin := stomin;
				writeln('Ingrese el precio de costo: ');
				read(pcos);
				aux.pCosto:= pcos;
				writeln('Ingrese el porcentaje de ganancias: ');
				read(po);
				po:= (po*aux.pCosto)/100;
				po := po + aux.pCosto;
				aux.pVenta:= po;
				seek(arA, filesize(arA)+1);
				write(arA, aux);
				close(arA)
			end;
		end;
		consultaStock;
		read(op);
		case op of
			1: Begin
				textcolor(15);
				writeln(' Cuantos elementos desea agregar al stock?');
				read(stock);
				agregarstock (arA, nodo.pos, stock);
			end;
			2: Begin
				textcolor(15);
				writeln(' Cuantos elementos desea remover del stock?');
				read(stock);
				removerstock (arA, nodo.pos, stock);
			end;
		end;
		textcolor(15);
		writeln('   ¿Desea continuar con la actualizacion? (s/n)');
		read(opcion);
	until opcion = 'n';
end;

end.
