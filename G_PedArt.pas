Unit G_PedArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

	procedure opcion8 (var arA:ArchivoArt);

implementation

	procedure opcion8 (var arA:ArchivoArt);
	var
		fin: word;
		pos: word;
		aux: tipoArt;
		I: word;

	begin
		posicion(arA, pos); //archivo
		I:=0;
		repeat
			leerArt(arA, aux, I); //archivo
			if aux.stockMin <= aux.stock then
			begin
				presPedArt; //menu
				writeln('                   El articulo: ', aux.codigo,' : ',aux.descri);
				writeln('               necesita reposicion. Comunicarse con el proveedor: ');
				writeln('                    ',aux.prove);
				writeln('  ');
				readkey;
			end;
			inc(I);
		until I=pos
	end;

End.
