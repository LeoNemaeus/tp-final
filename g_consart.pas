unit G_consArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

procedure opcion6 (var arA: ArchivoArt; var A: arbolArt; var B: arbolArt);

implementation

procedure opcion6 (var arA: ArchivoArt; var A: arbolArt; var B: arbolArt);
	var
		po: real;
		cod: word;
		nodo: Art;
		aux: tipoArt;
		des: string;
		fin:word;
		pos: word;
		op: word;
		pro:string;
		I: word;
		
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                             CONSULTA DE ARTICULOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                            Consultar Articulos por: ');
		writeln('  ');
		writeln('                                   1: Codigo');
		writeln(' ');
		writeln('                                   2: Descripcion');
		writeln(' ');
		writeln('                                   3: Proveedor');
		read(op);
		case op of
			1: begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                             CONSULTA DE ARTICULOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                        Ingrese el codigo del producto: ');
				read(cod);
				buscarCodigo (A, cod, nodo);
				leerArt(arA, aux, nodo.pos);
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                             CONSULTA DE ARTICULOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                         Codigo:----------------:',aux.codigo);
				writeln('                         Descripcion:-----------:',aux.descri);
				writeln('                         Proveedor:-------------:',aux.prove);
				writeln('                         Stock:-----------------:',aux.stock);
				writeln('                         Precio de venta:-------:',aux.pVenta:5:2);
				writeln('                         Precio de costo:-------:',aux.pCosto:5:2);
				po:=(aux.pVenta-aux.pCosto)*100;
				po:= po/aux.pCosto;
				writeln('                         Porcentaje de ganancias:-:',po:3:2);
				readkey;
			end;
			2: Begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                             CONSULTA DE ARTICULOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                        Ingrese la descripcion del producto: ');
				read(des);
				buscarDesc (B, des, nodo);
				leerArt(arA, aux, nodo.pos);
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                             CONSULTA DE ARTICULOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                         Codigo:----------------:',aux.codigo);
				writeln('                         Descripcion:-----------:', aux.descri);
				writeln('                         Proveedor:-------------:',aux.prove);
				writeln('                         Stock:-----------------:',aux.stock);
				writeln('                         Precio de venta:-------:',aux.pVenta:5:2);
				writeln('                         Precio de costo:-------:',aux.pCosto:5:2);
				po:=(aux.pVenta-aux.pCosto)*100;
				po:= po/aux.pCosto;
				writeln('                         Porcentaje de ganancias:-:',po:3:2);
				readkey;
			end;
			3: Begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                             CONSULTA DE ARTICULOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                             Ingrese el proveedor: ');
				read(pro);
				posicion(arA, pos);
				I:=0;
				while I< pos do
				begin	
					leerArt(arA, aux, I);
					if aux.prove = pro then
					begin
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                             CONSULTA DE ARTICULOS  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                         Codigo:----------------:',aux.codigo);
						writeln('                         Descripcion:-----------:', aux.descri);
						writeln('                         Proveedor:-------------:',aux.prove);
						writeln('                         Stock:-----------------:',aux.stock);
						writeln('                         Precio de venta:-------:',aux.pVenta:5:2);
						writeln('                         Precio de costo:-------:',aux.pCosto:5:2);
						po:=(aux.pVenta-aux.pCosto)*100;
						po:= po/aux.pCosto;
						writeln('                         Porcentaje de ganancias:-:',po:3:2);
						readkey;
					end;
					inc(I)
				end;
			end;
		end;
	end;
	
End.
