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
                arF: ArchivoFac;
	begin
		crear (arA, arF);
		fin:= filesize(arA)+1;
		pos:= 0;
		Repeat
			reset(arA);
			seek(arA, pos);
			read(arA, aux);
			if aux.stockMin <= aux.stock then
			begin
				textcolor(15);
				writeln('El articulo: ', aux.codigo,' : ',aux.descripcion);
				writeln('necesita reposicion. Comunicarse con el proveedor: ');
				writeln('      ',aux.proveedor);
				writeln('  ');
			end;
			pos:= pos+1;
		until pos=fin
	end;

End.
