uses stock, crt;

op: byte;
codigo: word;
opcion: char;
descripcion: string[140];
nodo: aArticulo;
cantidad: word;

Begin
	Repeat
		cod;
		read(op);
		case op of
			1: Begin
				read(codigo);
				buscarArbol(ar; codigo; nodo);
			end;
			2: Begin
				read(descripcion);
				buscarArbol(ar; descripcion; nodo);
			end;
		end;
		consultaStock;
		read(op);
		case op of
			1: Begin
				textcolor(15);
				writeln(' Cuantos elementos desea agregar al stock?');
				read(cantidad);
				agregarstock (ar, nodo^.info.fpos, stock);
			end;
			2: Begin
				textcolor(15);
				writeln(' Cuantos elementos desea remover del stock?');
				read(cantidad);
				removerstock (ar, nodo^.info.fpos, stock);
			end;
		end;
		textcolor(15);
		writeln('   ¿Desea continuar con la actualizacion? (s/n)');
		read(opcion);
	until opcion = 'n';
end;
