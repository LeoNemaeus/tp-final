Unit Punto8;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Tipos;

	procedure opcion8 (var arA:ArchivoArt);

implementation

	procedure opcion8 (var arA:ArchivoArt);
	var
		fin: word;
		pos: word;
		aux: tipoArt;
		I: word;
		J: word;
	begin
		posicion(arA, pos); //archivo
		I:=0;
		J:=0;
		repeat
			leerArt(arA, aux, I); //archivo
			if aux.stockMin >= aux.stock then
			begin
				presPedArt; //menu
				writeln('                   El articulo: 00', aux.codigo,' : ',aux.descri);
				writeln('               necesita reposicion. Comunicarse con el proveedor: ');
				writeln('                    ',aux.prove);
				writeln;
				inc(J);
				readkey;
			end;
			inc(I);
		until I=pos;
		if J=0 then
		begin
			presPedArt; //menu
			writeln('                              No hay articulos faltantes');
			readkey;
		end;
	end;

End.
