unit Punto6;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Tipos;

procedure opcion6 (var arA: ArchivoArt; var A: arbolArtC; var B: arbolArtD);

implementation

procedure opcion6 (var arA: ArchivoArt; var A: arbolArtC; var B: arbolArtD);
	var
		po: real;
		cod: word;
		nodoC: ArtC;
		nodoD: ArtD;
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
		reformaArbol (A, B, arA);
		presConsArt; //menu
		consulta; //menu
		readln(op);
		case op of
			1: begin
				presConsArt; //menu
				writeln('                        Ingrese el codigo del producto: ');
				readln(cod);
				buscarCodigo (A, cod, nodoC, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, aux, nodoC.pos); //archivo
					consultaArt (aux);
				end;
			end;
			2: Begin
				presConsArt; //menu
				writeln('                        Ingrese la descripcion del producto: ');
				readln(des);
				buscarDesc (B, des, nodoD, salir); //arbol
				if (salir=false) then
				begin
					leerArt(arA, aux, nodoD.pos); //archivo
					consultaArt (aux);
				end;
			end;
		end;
	end;
	
End.
