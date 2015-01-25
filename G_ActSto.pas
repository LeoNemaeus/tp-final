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

Procedure cprin (var A: arbolArt; B: arbolArt);
var
	op: byte;
	codigo: word;
	opcion: char;
	descripcion: string;
	nodo: Art;
	cantidad: word;
	stock: word;
Begin
	Repeat
		cod;
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
