unit G_ActSto;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

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
		salir: boolean;
	begin
		presActSto; //menu
		codig; //menu
		writeln(' ');
		writeln('  ');
		writeln('                       3: Agregar un nuevo producto al stock ');
		readln(op);
		case op of
			1: begin
				cargarArbol (A, B, arA);
				presActSto; //menu
				writeln('                         Ingrese el codigo del producto: ');
				readln(cod);
				buscarCodigo (A, cod, nodo, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodo.pos); //archivo
					presActSto; //menu
					cambioStock (datoA.stock); //menu
					read(cond);
					if cond=1 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea agregar al stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodo.pos);
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodo.pos); //archivo
							leerArt(arA, datoA, nodo.pos); //archivo
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
							leerArt(arA, datoA, nodo.pos); //archivo
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodo.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					end;
				end;
			end;
			2: begin
				cargarArbol (A, B, arA);
				presActSto; //menu
				writeln('                       Ingrese la descripcion del producto: ');
				readln(desc);
				buscarDesc (B, desc, nodo, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, datoA, nodo.pos); //archivo
					presActSto; //menu
					cambioStock (datoA.stock); //menu
					read(cond);
					if cond=1 then
						begin
							presActSto; //menu
							writeln('                    Cuantos producto desea agregar al stock? ');
							readln(cantid);
							leerArt(arA, datoA, nodo.pos); //archivo
							datoA.stock := datoA.stock + cantid;
							ReEscArt(arA, datoA, nodo.pos); //archivo
							leerArt(arA, datoA, nodo.pos); //archivo
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
							leerArt(arA, datoA, nodo.pos); //archivo
							datoA.stock := datoA.stock - cantid;
							ReEscArt(arA, datoA, nodo.pos); //archivo
							presActSto; //menu
							Stock (datoA.stock); //menu
						end
					end;
				end;
			end;
			3: begin
				cargarArbol (A, B, arA);
				presActSto; //menu
				writeln('                      Ingrese el codigo del nuevo producto: ');
				readln(cod);
				datoA.codigo:= cod;
				nodo.codigo:= cod;
				presActSto; //menu
				writeln('                   Ingrese la descripcion del nuevo producto: ');
				readln(desc);
				datoA.descri := desc;
				nodo.descri:= desc;
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
				nodo.pos:= pos;
				insertarArbol (A, nodo, B); //arbol	
				presActSto; //menu
				writeln('                  El nuevo producto ha sido ingresado con exito! ');
				readkey;
				cargarArbol (A, B, arA);
			end;
		end;
	end;

end.
