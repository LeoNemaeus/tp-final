unit G_ConsFac;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

	Procedure busqueda;
	Procedure principal (var arF: ArchivoFac; var arA: ArchivoArt);

implementation

	Procedure busqueda;
	begin
		clrscr;
		writeln ('                  Desea buscar factura por: ');
		writeln(' ');
		writeln('                     1: Numero de Factura');
		writeln('  ');
		writeln('                     2: Fecha de Facturacion');
		writeln('  ');
		writeln('                     3: Listar todas las facturas');
	end;

	Procedure principal (var arF: ArchivoFac; var arA: ArchivoArt);
	var
		mes: word;
		an: word;
		op: word;
		pos: word;
		aux: tipoFac;
		fin: word;
		I: word;

	begin
		busqueda;
		read(op);
		case op of
			1: begin
				clrscr;
				writeln('            Ingrese el numero de factura:');
				read(pos);
				leerFac(arF, aux, pos);
				facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
			end;
			2: begin
				clrscr;
				writeln('      Ingrese el mes: (mm)');
				read(mes);
				writeln('      Ingrese el año: (aaaa)');
				read(an);
				pos:= 0;
				repeat
					leerFac(arF, aux, pos);
					if (aux.fecha.mes=mes) and (aux.fecha.anio=an) then
					facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion)
					else inc(pos)
				until (aux.fecha.mes>mes) or (aux.fecha.anio <> an);
			end;
			3: begin
				I:=0;
				while not eof(arF) do
				begin
					leerFac(arF, aux, I);
					facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
					inc(I);
				end;
			end;
		end;
	end;

End.
