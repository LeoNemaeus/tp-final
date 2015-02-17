Unit Punto3;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Tipos;

 Procedure opcion3(var arA:ArchivoArt);
 
 implementation

Procedure opcion3(var arA:ArchivoArt);
	var
		datoA: tipoArt;
		pos: word;
		I: word;
	Begin
		clrscr;
		I:=0;
		posicion(arA, pos);
		repeat
			leerArt(arA, datoA, I); //archivo
			presListPre; //menu
			writeln('                     Codigo:------------- 00',datoA.codigo);
			writeln('                     Descriocion:-------- ', datoA.descri);
			writeln('                     Precio de venta:---- $',datoA.pVenta:5:2);
			writeln;
			I:=I+1;
			if I < pos then
			begin
				leerArt(arA, datoA, I); //archivo
				writeln('                     Codigo:------------- 00',datoA.codigo);
				writeln('                     Descriocion:-------- ', datoA.descri);
				writeln('                     Precio de venta:---- $',datoA.pVenta:5:2);
				writeln;
				I:=I+1;
				if I < pos then
				begin
					leerArt(arA, datoA, I); //archivo
					writeln('                     Codigo:------------- 00',datoA.codigo);
					writeln('                     Descriocion:-------- ', datoA.descri);
					writeln('                     Precio de venta:---- $',datoA.pVenta:5:2);
					writeln;
					I:=I+1;
					if I < pos then
					begin
						leerArt(arA, datoA, I); //archivo
						writeln('                     Codigo:------------- 00',datoA.codigo);
						writeln('                     Descriocion:-------- ', datoA.descri);
						writeln('                     Precio de venta:---- $',datoA.pVenta:5:2);
						I:=I+1;
					end;
				end;
			end;
			readkey;
			clrscr;
		until I=pos;
	end;

end.