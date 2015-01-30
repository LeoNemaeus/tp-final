Program TPAlgoritmo;
Uses crt, G_Arbol, G_Archivo, G_Venta, G_Vector, G_Menu, Dos, G_ConsFac, G_PedArt, G_ActPre, G_consArt, G_ActSto, G_EstVen, G_LisP;

var
	op: word;

	arF: ArchivoFac;
	A: arbolArt;
	B: arbolArt;
	arA: ArchivoArt;

Begin {Principal}
	clrscr;
	crear (arA, arF);
	crearArbol(A, B);
	comienzo;
	opciones;
	read(op);
	repeat
		case op of
			1: Begin
				opcion1 (arA, arF, A, B);
			end;
			2: Begin
				opcion2 (A, B, arA);
			end;
			3: Begin
					cprinn (A, B, arA);
					clrscr;
			end;
			4: Begin
					cuerpo (A, B, arA);
			end;
			5: Begin
					principal (arF, arA);
			end;
			6: Begin
					consulArt (A, B, arA);
			end;
			7: Begin
					princuerpo (arA, arF);
			end;
			8: Begin
					cupri (arA);
			end;
		end;
		clrscr;
		opciones;
		read(op);
	until op=0;
	Finalizar;
End.
