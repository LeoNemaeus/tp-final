Unit G_LisP;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;
var
	A: arbolArt;
	arA:ArchivoArt;
	B: arbolArt;
Procedure precio_inorden(var A: arbolArt; var arA:ArchivoArt);
Procedure cprinn (A: arbolArt; B: arbolArt; var arA: ArchivoArt);


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
			writeln('     Codigo: ',datoA.codigo);
			writeln('     Descriocion: ', datoA.descripcion);
			writeln('     Precio de venta: ',datoA.pVenta);
			precio_inorden(A^.der, arA);
		end;
	end;
	
Procedure cprinn (A: arbolArt; B: arbolArt; var arA: ArchivoArt);
var
	op: word;
Begin
	cod2;
	read(op);
	case op of
		1: precio_inorden(A, arA);
		2: precio_inorden(B, arA);
	end;
end;

end.
