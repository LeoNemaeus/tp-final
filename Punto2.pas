unit Punto2;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Tipos;

	Procedure opcion2 (var A: arbolArtC; var B: arbolArtD; var arA:ArchivoArt);
	
implementation
	
	Procedure opcion2 (var A: arbolArtC; var B: arbolArtD; var arA:ArchivoArt);
	var
		op: word;
		cod: word;
		buscado: word;
		nodoC:ArtC;
		nodoD:ArtD;
		datoA:tipoArt;
		cond: word;
		cantid: word;
		desc: string;
		valor: real;
		pos: word;
		salir: boolean;
		resp: string[2];
	begin
		reformaArbol (A, B, arA);
		presActSto; //menu
		codig; //menu
		writeln(' ');
		writeln('  ');
		writeln('                       3: Agregar un articulo al stock ');
		writeln;
		writeln('                       4: Remover un articulo del stock ');
		readln(op);
		case op of
			1: begin
				presActSto; //menu
				writeln('                         Ingrese el codigo del producto: ');
				readln(cod);
				buscarCodigo (A, cod, nodoC, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodoC.pos); //archivo
					presActSto; //menu
					cambioStock (datoA.stock); //menu
					read(cond);
					if cond=1 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea agregar al stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodoC.pos);
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodoC.pos); //archivo
							leerArt(arA, datoA, nodoC.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					else
					begin
						if cond=2 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea remover del stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodoC.pos); //archivo
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodoC.pos); //archivo
							leerArt(arA, datoA, nodoC.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					end;
				end;
			end;
			2: begin
				presActSto; //menu
				writeln('                       Ingrese la descripcion del producto: ');
				readln(desc);
				buscarDesc (B, desc, nodoD, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodoD.pos); //archivo
					presActSto; //menu
					cambioStock (datoA.stock); //menu
					read(cond);
					if cond=1 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea agregar al stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodoD.pos); //archivo
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodoD.pos); //archivo
							leerArt(arA, datoA, nodoD.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					else
					begin
						if cond=2 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea remover del stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodoD.pos); //archivo
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodoD.pos); //archivo
							leerArt(arA, datoA, nodoD.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					end;
				end;
			end;
			3: begin
				presActSto; //menu
				writeln('                      Ingrese el codigo del nuevo producto: ');
				readln(cod);
				datoA.codigo:= cod;
				nodoC.codigo:= cod;
				presActSto; //menu
				writeln('                   Ingrese la descripcion del nuevo producto: ');
				readln(desc);
				datoA.descri := desc;
				nodoD.descri:= desc;
				presActSto; //menu
				writeln('               Ingrese el nombre del proveedor del nuevo producto: ');
				readln(desc);
				datoA.prove:=desc;
				presActSto; //menu
				writeln('                      Ingrese el stock del nuevo producto: ');
				readln(cantid);
				datoA.stock := cantid;
				presActSto; //menu
				writeln('                    Ingrese el stock minimo del nuevo producto: ');
				readln(cantid);
				datoA.stockMin := cantid;
				presActSto; //menu
				writeln('                    Ingrese el precio de costo del nuevo producto: ');
				readln(valor);
				datoA.pCosto := valor;
				presActSto; //menu
				writeln('             Ingrese el porcentaje de ganancias para el nuevo producto: ');
				readln(valor);
				valor:= valor*datoA.pCosto;
				valor:= valor/100;
				valor:= valor+datoA.pCosto;
				datoA.pVenta:=valor;
				escribirArt(arA, datoA); //archivo
				posicion(arA, pos); //archivo
				nodoC.pos:= pos;
				nodoD.pos:= pos;
				insertarArbol (A, B, nodoC, nodoD); //arbol	
				presActSto; //menu
				writeln('                  El nuevo producto ha sido ingresado con exito! ');
				readkey;
			end;
			4: begin
				presActSto; //menu
				codig; //menu
				readln(op);
				if op=1 then
				begin
					presActSto; //menu
					writeln('                       Ingrese el codigo del producto a borrar: ');
					readln(cod);
					buscarCodigo (A, cod, nodoC, salir); //arbol
					if (salir=false) then
					begin
						leerArt(arA, datoA, nodoC.pos); //archivo
						presActSto; //menu
						writeln('                       Detalles del articulo a borrar: ');
						writeln;
						writeln('                       Codigo-------------: 00',datoA.codigo);
						writeln('                       Descripcion--------: ',datoA.descri);
						writeln('                       Proveedor----------: ',datoA.prove);
						writeln('                       Stock--------------: ',datoA.stock);
						writeln('                       Precio de costo----: $',datoA.pCosto:5:2);
						readkey;
						presActSto; //menu
						writeln('                       Desea remover el articulo del stock? (s/n)');
						readln(resp);
						if resp='s' then
						begin
							borrar(arA, datoA.codigo);
							reformaArbol (A, B, arA);
							presActSto; //menu
							writeln('                       El articulo ha sido removido exitosamente!');
							readkey;
						end
						else
						begin
							presActSto; //menu
							writeln('                       El articulo no ha sido removido');
							readkey;
						end;
					end;
				end;
				if op=2 then
				begin
					presActSto; //menu
					writeln('                   Ingrese la descripcion del producto a borrar: ');
					readln(desc);
					buscarDesc (B, desc, nodoD, salir); //arbol
					if (salir=false) then
					begin
						leerArt(arA, datoA, nodoD.pos); //archivo
						presActSto; //menu
						writeln('                       Detalles del articulo a borrar: ');
						writeln;
						writeln('                       Codigo-------------: 00',datoA.codigo);
						writeln('                       Descripcion--------: ',datoA.descri);
						writeln('                       Proveedor----------: ',datoA.prove);
						writeln('                       Stock--------------: ',datoA.stock);
						writeln('                       Precio de costo----: $',datoA.pCosto:5:2);
						readkey;
						presActSto; //menu
						writeln('                       Desea remover el articulo del stock? (s/n)');
						readln(resp);
						if resp='s' then
						begin
							borrar(arA, datoA.codigo);
							reformaArbol (A, B, arA);
							presActSto; //menu
							writeln('                       El articulo ha sido removido exitosamente!');
							readkey;
						end
						else
						begin
							presActSto; //menu
							writeln('                       El articulo no ha sido removido');
							readkey;
						end;
					end;
				end;
				if op>2 then
				begin
					presActSto; //menu
					writeln('                         Opcion incorrecta!');
					readkey;
				end;
			end;			
		end;
	end;

end.
