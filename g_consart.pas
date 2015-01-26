unit G_consArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

	Procedure mostrar (aux: tipoArt);
	Procedure consulArt;

implementation

	Procedure mostrar (aux: tipoArt);
	var
		po: real;
	Begin
		textcolor(15);
		writeln('Codigo: ',aux.codigo);
		writeln('Descripcion: ', aux.descripcion);
		writeln('Proveedor: ', aux.proveedor);
		writeln('Stock: ',aux.stock);
		writeln('Precio de venta: ',aux.pVenta);
		writeln('Precio de costo: ',aux.pCosto);
		po:=(aux.pVenta-aux.pCosto)*100;
		po:= po/aux.pCosto;
		writeln('Porcentaje de ganancias: ',po);
	end;

	Procedure consulArt;
	var
		A: arbolArt;
		B: arbolArt;
		cod: word;
		nodo: Art;
		aux: tipoArt;
		arA: ArchivoArt;
		des: string[140];
		fin:word;
		pos: word;
		op: word;
		pro: string[90];
                arF: ArchivoFac;
	begin
		crear (arA, arF);
		writeln('  Consultar Articulos por: ');
		writeln('  ');
		writeln('   1: Codigo');
		writeln(' ');
		writeln('   2: Descripcion');
		writeln(' ');
		writeln('   3: Proveedor');
		read(op);
		case op of
			1: begin
				writeln('Ingrese el codigo del producto: ');
				read(cod);
				buscarCodigo (A, cod, nodo);
				reset(arA);
				seek(arA, nodo.pos);
				read(arA, aux);
				mostrar (aux);
				close(arA);
			end;
			2: Begin
				writeln('Ingrese la descripcion del producto: ');
				read(des);
				buscarDesc (B, des, nodo);
				reset(arA);
				seek(arA, nodo.pos);
				read(arA, aux);
				mostrar (aux);
				close(arA);
			end;
			3: Begin
				writeln('Ingrese el proveedor: ');
				read(pro);
				fin:= filesize(arA)+1;
				pos:= 0;
				Repeat
					reset(arA);
					seek(arA, pos);
					read(arA, aux);
					if aux.proveedor = pro then
						mostrar (aux);
					pos:= pos+1;
				until pos=fin
			end;
		end;
	end;
	
End.
