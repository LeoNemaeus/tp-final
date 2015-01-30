unit G_ConsFac;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

procedure opcion5 (var arF: ArchivoFac; var arA: ArchivoArt);

implementation

procedure opcion5 (var arF: ArchivoFac; var arA: ArchivoArt);
	var
		mes: word;
		an: word;
		op: word;
		pos: word;
		aux: tipoFac;
		fin: word;
		I: word;

	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              CONSULTA DE FACTURAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln ('                          Desea buscar factura por: ');
		writeln('  ');
		writeln(' ');
		writeln('                          1 : Numero de Factura');
		writeln('  ');
		writeln('                          2 : Fecha de Facturacion');
		writeln('  ');
		writeln('                          3 : Listar todas las facturas');
		read(op);
		if op=1 then
		begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              CONSULTA DE FACTURAS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('                         Ingrese el numero de factura:');
			read(pos);
			leerFac(arF, aux, pos);
			facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
		end;
		if op=2 then
		begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              CONSULTA DE FACTURAS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('                              Ingrese el mes: (mm)');
			read(mes);
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                              CONSULTA DE FACTURAS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('                              Ingrese el año: (aaaa)');
			read(an);
			posicionf(arF, pos);
			pos:= pos-1;
			repeat
				leerFac(arF, aux, pos);
				if (aux.fecha.mes=mes) and (aux.fecha.anio=an) then
				begin
					facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
					dec(pos);
				end
				else dec(pos)
			until (pos=0);
		end;
		if op=3 then
		begin
			posicionf(arF, pos);
			I:=0;
			while I< pos do
			begin
				leerFac(arF, aux, I);
				facturas (aux.total, aux.fecha.dia, aux.fecha.mes, aux.fecha.anio, aux.condVenta, aux.iva, aux.numFac, aux.nombre, aux.direccion);
				inc(I);
			end;
		end;
		if op>=4 then
		begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              CONSULTA DE FACTURAS   ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
		end;		
	end;
End.
