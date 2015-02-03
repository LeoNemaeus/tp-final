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
		posicion(arA, pos);
		I:=0;
		while I < pos do
		Begin
			leerArt(arA, aux, I);
			if aux.stockMin <= aux.stock then
			begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                       PEDIDO DE ARTICULOS FALTANTES  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                   El articulo: ', aux.codigo,' : ',aux.descri);
				writeln('               necesita reposicion. Comunicarse con el proveedor: ');
				writeln('                    ',aux.prove);
				writeln('  ');
				readkey;
			end;
			inc(I);
		end;
	end;

End.
