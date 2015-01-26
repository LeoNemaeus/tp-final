unit G_ConsFac;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;
Procedure busqueda;
Procedure principal (var arF: ArchivoFac);

implementation

	Procedure busqueda;
	begin
		clrscr;
		textcolor(15);
		writeln (' Desea buscar factura por: ');
		writeln(' ');
		writeln('  1: Numero de Factura');
		writeln('  ');
		writeln('  2: Fecha de Facturacion');
		writeln('  ');
		writeln('  3: Listar todas las facturas');
	end;

	Procedure principal (var arF: ArchivoFac);
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
				writeln('Ingrese el numero de factura:');
				read(pos);
				seek(arF, pos);
				read(arF, aux);
				facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
				close(arF);
			end;
			2: begin
				writeln('Ingrese el mes: (mm)');
				read(mes);
				writeln('Ingrese el año: (aaaa)');
				read(an);
				pos:= 0;
				repeat
					seek(arF, pos);
					read(arF, aux);
					if (aux.fecha.mes=mes) and (aux.fecha.anio=an) then
					facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion)
					else inc(pos)
				until (aux.fecha.mes>mes) or (aux.fecha.anio <> an);
				close(arF)
			end;
			3: begin
				fin:= filesize(arF)+1;
				I:=0;
				repeat
					seek(arF, I);
					read(arF, aux);
					facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
					inc(I);
				until I=fin;
				close(arF);
			end;
		end;
	end;

End.