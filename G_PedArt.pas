Unit G_PedArt;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

	procedure cupri (var arA:ArchivoArt);

implementation

	procedure cupri (var arA:ArchivoArt);
	var
		fin: word;
		pos: word;
		aux: tipoArt;

	begin
		pos:= 0;
		while not eof(arA) do
		Begin
			leerArt(arA, aux, pos);
			if aux.stockMin <= aux.stock then
			begin
				clrscr;
				writeln('              El articulo: ', aux.codigo,' : ',aux.descripcion);
				writeln('              necesita reposicion. Comunicarse con el proveedor: ');
				writeln('                 ',aux.proveedor);
				writeln('  ');
			end;
			inc(pos);
		end;
	end;

End.
