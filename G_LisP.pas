Unit G_LisP;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;
var
	A: arbolArt;
	arA:ArchivoArt;
	B: arbolArt;
Procedure precio_inorden(var A: arbolArt; var arA:ArchivoArt);
Procedure opcion3 (var A: arbolArt; var arA: ArchivoArt);


implementation

Procedure precio_inorden(var A: arbolArt; var arA:ArchivoArt);
	var
		datoA: tipoArt;
	Begin
		if not arbolVacio(A) then
		Begin
			precio_inorden(A^.izq, arA);
			leerArt(arA, datoA, A^.info.pos);
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              LISTADO DE PRECIOS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('                     Codigo:-------------',datoA.codigo);
			writeln('                     Descriocion:--------', datoA.descri);
			writeln('                     Precio de venta:----',datoA.pVenta:5:2);
			writeln(' ');
			readkey;
			precio_inorden(A^.der, arA);
		end;
	end;
	
Procedure opcion3 (var A: arbolArt; var arA: ArchivoArt);
Begin
	precio_inorden(A, arA);
end;

end.
