unit G_consArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

	Procedure mostrar (aux: tipoArt);
	Procedure consulArt (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt);

implementation

	Procedure mostrar (aux: tipoArt);
	var
		po: real;
	Begin
		clrscr;
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

	Procedure consulArt (var A: arbolArt; var B: arbolArt; var arA: ArchivoArt);
	var
		cod: word;
		nodo: Art;
		aux: tipoArt;
		des: string[140];
		fin:word;
		pos: word;
		op: word;
		pro: string[90];
	begin
		clrscr;
		writeln('            Consultar Articulos por: ');
		writeln('  ');
		writeln('                 1: Codigo');
		writeln(' ');
		writeln('                 2: Descripcion');
		writeln(' ');
		writeln('                 3: Proveedor');
		read(op);
		case op of
			1: begin
				clrscr;
				writeln('             Ingrese el codigo del producto: ');
				read(cod);
				buscarCodigo (A, cod, nodo);
				leerArt(arA, aux, nodo.pos);
				mostrar (aux);
			end;
			2: Begin
				clrscr;
				writeln('             Ingrese la descripcion del producto: ');
				read(des);
				buscarDesc (B, des, nodo);
				leerArt(arA, aux, nodo.pos);
				mostrar (aux);
			end;
			3: Begin
				clrscr;
				writeln('              Ingrese el proveedor: ');
				read(pro);
				pos:= 0;
				while not eof(arA) do
				begin	
					leerArt(arA, aux, pos);
					if aux.proveedor = pro then
						mostrar (aux);
					inc(pos)
				end;
			end;
		end;
	end;
	
End.
