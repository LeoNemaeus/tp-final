unit G_ActPre;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

var
	arA:ArchivoArt;
	arF: ArchivoFac;
	A: arbolArt;
	B: arbolArt;	
	precio:word;

	Procedure consulta (var arA:ArchivoArt; pos:word; var aux: tipoArt);
	procedure modif;
	Procedure modPorc (var arA: ArchivoArt; var aux:tipoArt; pos: word);
	Procedure cuerpo (var A: arbolArt; B: arbolArt; var arA: ArchivoArt);

implementation
	
	Procedure consulta (var arA:ArchivoArt; pos:word; var aux: tipoArt);
var 
	por: real;
begin
	seek(arA, pos);
	read(arA, aux);
	textcolor(15);
	writeln('El precio de venta del articulo seleccionado es: ',aux.pVenta);
	writeln('El precio de costo del articulo seleccionado es: ',aux.pCosto);
	por:= (aux.pVenta - aux.pCosto)*100;
	por:= por/aux.pCosto;
	writeln('El porcentaje aplicado es: ', por);
	writeln ('   Desea modificar el precio? (s/n)');
end;

	procedure modif;
	begin
		textcolor(15);
		writeln('  Desea modificar: ');
		writeln(' ');
		writeln('  1: Precio de Costo y/o porcentaje');
		writeln('  2: Porcentaje de Ganancia');
	end;
	
	Procedure modPorc (var arA: ArchivoArt; var aux:tipoArt; pos: word);
	var
		po: real;
	Begin
		writeln('Ingrese el porcentaje a aplicar');
		read(po);
		aux.pVenta := (po*aux.pCosto)/100;
		aux.pVenta := aux.pVenta + aux.pCosto;
		seek(arA, pos);
		write(arA, aux)
	end;

Procedure cuerpo (var A: arbolArt; B: arbolArt; var arA: ArchivoArt);
var
	op: byte;
	codigo: word;
	descripcion: string;
	nodo: Art;
	cantidad: word;
	p: string[2];
	h: word;
	cost: real;
	l: string[2];
	opcion: string;
	aux: tipoArt;
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
		consulta (arA, nodo.pos, aux);
		read(p);
		if (p= 's') then
		Begin
			modif;	
			read(h);
			case h of
				1: begin
					writeln(' Ingrese el precio de costo: ');
					read(cost);
					aux.pCosto := cost;
					writeln(' Desea modificar el porcentaje de ganancias? ');
					read(l);
					case l of
						's': Begin
							modPorc (arA, aux, nodo.pos);
						end;
						'n': begin
							seek(arA, nodo.pos);
							write(arA, aux)
						end;
					end;
				end;
				2: Begin
					modPorc (arA, aux, nodo.pos);
				end;
			end;
		end;
		textcolor(15);
		writeln('   Desea continuar con la actualizacion? (s/n)');
		read(opcion);
	until opcion = 'n';
end;

end.