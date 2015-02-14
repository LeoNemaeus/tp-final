unit Punto5;
interface
uses Menu, Archivo, Arbol, crt, Vector, Tipos;

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
		presConsFac; //menu
		buscarFac; //menu
		read(op);
		if op=1 then
		begin
			presConsFac; //menu
			writeln('                         Ingrese el numero de factura:');
			readln(pos);
			leerFac(arF, aux, pos); //archivo
			facturas (aux); //menu
		end;
		if op=2 then
		begin
			presConsFac; //menu
			writeln('                              Ingrese el mes: (mm)');
			readln(mes);
			presConsFac; //menu
			writeln('                              Ingrese el año: (aaaa)');
			readln(an);
			posicionf(arF, pos); //archivo
			control:=0;
			pos:= pos-1;
			repeat
				leerFac(arF, aux, pos); //archivo
				if (aux.fecha.mes=mes) and (aux.fecha.anio=an) then
				begin
					facturas (aux); //menu
					dec(pos);
					inc(control);
				end
				else dec(pos)
			until (pos=0);
			if control=0 then
			begin
				presConsFac; //menu
				writeln('                        No hay facturas en el mes ingresado');
				readkey;
			end;
		end;
		if op=3 then
		begin
			posicionf(arF, pos); //archivo
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
		presConsFac; //menu
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
		end;		
	end;
End.
