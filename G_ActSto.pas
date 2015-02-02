unit G_ActSto;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

	Procedure opcion2 (var A: arbolArt; var B: arbolArt; var arA:ArchivoArt);
	
implementation
	
	Procedure opcion2 (var A: arbolArt; var B: arbolArt; var arA:ArchivoArt);
	var
		op: word;
		cod: word;
		buscado: word;
		nodo:Art;
		datoA:tipoArt;
		cond: word;
		cantid: word;
		desc: string;
		valor: real;
		pos: word;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                            ACTUALIZACION DE STOCK  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('             Seleccione la opcion de busqueda del producto: ');
		writeln('  ');
		writeln('  ');
		writeln('                      1: Busqueda por Codigo ');
		writeln('  ');
		writeln('                      2: Busqueda por Descripcion ');
		writeln(' ');
		writeln('  ');
		writeln('                      3: Agregar un nuevo producto al stock ');
		read(op);
		case op of
			1: begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                         Ingrese el codigo del producto: ');
				read(cod);
				buscarCodigo (A, buscado, nodo);
				leerArt(arA, datoA, nodo.pos);
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                    El stock del producto buscado es: ', datoA.stock);
				writeln('  ');
				writeln('                                 Usted desea: ');
				writeln('  ');
				writeln('  ');
				writeln('                    1 :    Agregar stock');
				writeln('  ');
				writeln('                    2 :    Remover stock');
				read(cond);
				if cond=1 then
					begin
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                    Cuantos producto desea agregar al stock? ');
						read(cantid);
						leerArt(arA, datoA, nodo.pos);
						datoA.stock := datoA.stock + cantid;
						ReEscArt(arA, datoA, nodo.pos);
						leerArt(arA, datoA, nodo.pos);
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                       El stock actual es: ',datoA.stock);
						writeln('  ');
						writeln('                       Actualizacion fializada con exito!');
						readkey;
					end
				else
				begin
					if cond=2 then
					begin
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                    Cuantos producto desea remover del stock? ');
						read(cantid);
						leerArt(arA, datoA, nodo.pos);
						datoA.stock := datoA.stock - cantid;
						ReEscArt(arA, datoA, nodo.pos);
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                       El stock actual es: ',datoA.stock);
						writeln('  ');
						writeln('                       Actualizacion fializada con exito!');
						readkey;
					end
				end;
			end;
			2: begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                       Ingrese la descripcion del producto: ');
				read(desc);
				buscarDesc (B, desc, nodo);
				leerArt(arA, datoA, nodo.pos);
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                    El stock del producto buscado es: ', datoA.stock);
				writeln('  ');
				writeln('                                 Usted desea: ');
				writeln('  ');
				writeln('  ');
				writeln('                    1 :    Agregar stock');
				writeln('  ');
				writeln('                    2 :    Remover stock');
				read(cond);
				if cond=1 then
					begin
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                    Cuantos producto desea agregar al stock? ');
						read(cantid);
						leerArt(arA, datoA, nodo.pos);
						datoA.stock := datoA.stock + cantid;
						ReEscArt(arA, datoA, nodo.pos);
						leerArt(arA, datoA, nodo.pos);
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                       El stock actual es: ',datoA.stock);
						writeln('  ');
						writeln('                       Actualizacion fializada con exito!');
						readkey;
					end
				else
				begin
					if cond=2 then
					begin
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                    Cuantos producto desea remover del stock? ');
						read(cantid);
						leerArt(arA, datoA, nodo.pos);
						datoA.stock := datoA.stock - cantid;
						ReEscArt(arA, datoA, nodo.pos);
						clrscr;
						textcolor(2);
						writeln('  ');
						writeln('                            ACTUALIZACION DE STOCK  ');
						textcolor(15);
						writeln('  ');
						writeln('  ');
						writeln('                       El stock actual es: ',datoA.stock);
						writeln('  ');
						writeln('                       Actualizacion fializada con exito!');
						readkey;
					end
				end;
				
				
				
			end;
			3: begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                      Ingrese el codigo del nuevo producto: ');
				read(cod);
				datoA.codigo:= cod;
				nodo.codigo:= cod;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                   Ingrese la descripcion del nuevo producto: ');
				read(desc);
				datoA.descri := desc;
				nodo.descri:= desc;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('               Ingrese el nombre del proveedor del nuevo producto: ');
				read(desc);
				datoA.prove:=desc;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                      Ingrese el stock del nuevo producto: ');
				read(cantid);
				datoA.stock := cantid;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                    Ingrese el stock minimo del nuevo producto: ');
				read(cantid);
				datoA.stockMin := cantid;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                    Ingrese el precio de costo del nuevo producto: ');
				read(valor);
				datoA.pCosto := valor;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('             Ingrese el porcentaje de ganancias para el nuevo producto: ');
				read(valor);
				valor:= valor*datoA.pCosto;
				valor:= valor/100;
				valor:= valor+datoA.pCosto;
				datoA.pVenta:=valor;
				escribirArt(arA, datoA);
				posicion(arA, pos);
				nodo.pos:= pos;
				insertarArbol (A, nodo, B);			
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE STOCK  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('  ');
				writeln('                  El nuevo producto ha sido ingresado con exito! ');
				readkey;
			end;
			end;
	end;

end.
