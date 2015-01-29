Program TPAlgoritmo;
Uses crt, G_Arbol, G_Archivo, G_Venta, G_Vector, G_Menu, Dos, G_ConsFac, G_PedArt, G_ActPre, G_consArt, G_ActSto, G_EstVen, G_LisP;
const 
	rutaA = 'D:/TPArt';
	rutaF = 'D:/TPFac';
var
	op: word;
	R: reg;
	lim: word;
	arF: ArchivoFac;
	total: real;
	A: arbolArt;
	B: arbolArt;
	arA: ArchivoArt;

Begin {Principal}
	clrscr;
	crear (arA, arF);
	comienzo;
	opciones;
	read(op);
	
	repeat
		case op of
			1: Begin
				lim:=0;
				venta(lim, R, arA, A, B, total);
				facturacion (lim, R, arF, total);
			end;
			2: Begin
					cprin (A, B);
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
