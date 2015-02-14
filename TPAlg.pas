Program TPAlg;
Uses crt, Arbol, Archivo, Vector, Menu, Dos, Tipos, Punto1, Punto2, Punto3, Punto4, Punto5, Punto6, Punto7, Punto8;

var
	op: word;
	arF: ArchivoFac;
	A: arbolArtC;
	B: arbolArtD;
	arA: ArchivoArt;

Begin {Principal}
	clrscr;
	crear (arA, arF); //archivo
	cargarArbol (A, B, arA); //arbol
	comienzo; //menu
	opciones; //menu
	read(op);
	repeat
		case op of
			1: Begin
				opcion1 (arA, arF, A, B); //venta
			end;
			2: Begin
				opcion2 (A, B, arA); //ActSto
			end;
			3: Begin
				opcion3 (A, arA); //LisP
			end;
			4: Begin
				opcion4 (arA, A, B); //ActPre
			end;
			5: Begin
				opcion5 (arF, arA); //ConsFac
			end;
			6: Begin
				opcion6 (arA, A, B); //ConsArt
			end;
			7: Begin
				opcion7 (arF); //EstVen
			end;
			8: Begin
				opcion8 (arA); //PedArt
			end;
		end;
		clrscr;
		opciones;
		read(op);
	until op=0;
	Finalizar;
End.