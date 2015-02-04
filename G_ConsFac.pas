unit G_ConsFac;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

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
		control: word;

	begin
		presConsFac;
		buscarFac;
		read(op);
		if op=1 then
		begin
			presConsFac;
			writeln('                         Ingrese el numero de factura:');
			read(pos);
			leerFac(arF, aux, pos);
			facturas (aux);
		end;
		if op=2 then
		begin
			presConsFac;
			writeln('                              Ingrese el mes: (mm)');
			read(mes);
			presConsFac;
			writeln('                              Ingrese el año: (aaaa)');
			read(an);
			posicionf(arF, pos);
			control:=0;
			pos:= pos-1;
			repeat
				leerFac(arF, aux, pos);
				if (aux.fecha.mes=mes) and (aux.fecha.anio=an) then
				begin
					facturas (aux);
					dec(pos);
					inc(control);
				end
				else dec(pos)
			until (pos=0);
			if control=0 then
			begin
				presConsFac;
				writeln('                        No hay facturas en el mes ingresado');
				readkey;
			end;
		end;
		if op=3 then
		begin
			posicionf(arF, pos);
			I:=0;
			while I< pos do
			begin
				leerFac(arF, aux, I);
				facturas (aux);
				inc(I);
			end;
		end;
		if op>=4 then
		begin
		presConsFac;
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
		end;		
	end;
End.
