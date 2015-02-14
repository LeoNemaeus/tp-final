Unit Punto3;
interface
uses Menu, Archivo, Arbol, crt, Vector, Tipos;

Procedure precio_inorden(var A: arbolArtC; var arA:ArchivoArt);
Procedure opcion3 (var A: arbolArtC; var arA: ArchivoArt);


implementation

Procedure precio_inorden(var A: arbolArtC; var arA:ArchivoArt);
	var
		datoA: tipoArt;
	Begin
		if not arbolVacioA(A) then
		Begin
			precio_inorden(A^.izq, arA);
			leerArt(arA, datoA, A^.info.pos); //archivo
			presListPre; //menu
			writeln('                     Codigo:-------------',datoA.codigo);
			writeln('                     Descriocion:--------', datoA.descri);
			writeln('                     Precio de venta:----',datoA.pVenta:5:2);
			writeln(' ');
			readkey;
			precio_inorden(A^.der, arA);
		end;
	end;
	
Procedure opcion3 (var A: arbolArtC; var arA: ArchivoArt);
Begin
	precio_inorden(A, arA);
end;

end.
