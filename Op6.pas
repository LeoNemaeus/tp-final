unit Op6;
interface
uses Menu, Archivos, Arbol, crt, Vector, Tipos;

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
		noencon: byte;
	begin
		cargarArbol (A, B, arA);
		presConsArt; //menu
		consulta; //menu
		readln(op);
		case op of
			1: begin
				presConsArt; //menu
				writeln('                        Ingrese el codigo del producto: ');
				readln(cod);
				buscarCodigo (A, cod, nodo, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, aux, nodo.pos); //archivo
					consultaArt (aux);
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
					consultaArt (aux);
				end;
			end;
			3: Begin
				presConsArt; //menu
				writeln('                             Ingrese el proveedor: ');
				readln(pro);
				posicion(arA, pos); //archivo
				noencon:=0;
				I:=0;
				while I< pos do
				begin	
					leerArt(arA, aux, I); //archivo
					if aux.prove = pro then
					begin
						noencon:=1;
						consultaArt (aux);
					end;
					inc(I)
				end;
				if noencon=0 then
				begin
					presConsArt; //menu
					writeln('                          Proveedor no encontrado!');
					readkey;
				end;
			end;
		end;
	end;
	
End.
