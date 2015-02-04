unit G_consArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

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
		salir:boolean;
	begin
		presConsArt; //menu
		consulta; //menu
		read(op);
		case op of
			1: begin
				presConsArt; //menu
				writeln('                        Ingrese el codigo del producto: ');
				readln(cod);
				buscarCodigo (A, cod, nodo, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, aux, nodo.pos); //archivo
					presConsArt; //menu
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
			end;
			2: Begin
				presConsArt; //menu
				writeln('                        Ingrese la descripcion del producto: ');
				readln(des);
				buscarDesc (B, des, nodo, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, aux, nodo.pos); //archivo
					presConsArt; //menu
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
			end;
			3: Begin
				presConsArt; //menu
				writeln('                             Ingrese el proveedor: ');
				readln(pro);
				posicion(arA, pos); //archivo
				I:=0;
				while I< pos do
				begin	
					leerArt(arA, aux, I); //archivo
					if aux.prove = pro then
					begin
						presConsArt; //menu
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
