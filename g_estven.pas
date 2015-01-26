unit G_EstVen;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos;

	Procedure mejormes (var res: real; var me: word; var ani: word);
	procedure totaldia (var ac:real);
	Procedure princuerpo;

implementation

	Procedure mejormes (var res: real; var me: word; var ani: word);
	var
		I: word;
		aux: tipoFac;
		mes: word;
		cont: real;
		fin: word;
		arF: ArchivoFac;
		anio:word;
	begin
		res := 0;
		I:=0;
		reset(arF);
		seek(arF, I);
		read(arF, aux);
		mes:= aux.fecha.mes;
		anio:= aux.fecha.anio;
		cont:=aux.total;
		fin:= filesize(arF);
		For I:= 1 to fin do
			begin
				reset(arF);
				seek(arF, I);
				read(arF, aux);
				if (aux.fecha.mes = mes) then
					cont:= cont+aux.total
				else
				begin
					if cont > res then
					begin
						me:=mes;
						ani:=anio;
						res:= cont;
					end;
					mes:=aux.fecha.mes;
					cont:= aux.total
				end;
			end;
		close(arF)
	end;
	
	procedure totaldia (var ac:real);
	var
		a:word;
		m:word;
		d:word;
		fin:word;
		aux:tipoFac;
		arF: ArchivoFac;
		s: word;
	begin
		GetDate(a, m, d, s); {año, mes, dia del mes, dia de la semana}
		ac:=0;
		fin:=filesize(arF);
		repeat
			reset(arF);
			seek(arF,fin);
			read(arF, aux);
			if (a=aux.fecha.anio) and (m=aux.fecha.mes) and (d= aux.fecha.dia) then
				ac:= ac+aux.total;
			fin:= fin-1
		until ((d<>aux.fecha.dia) and (m=aux.fecha.mes))
	end;

	Procedure princuerpo;
	var
		op: word;
		res: real;
		me: word;
		ani: word;
		ac:real;
	begin
		writeln('Seleccione la opcion que desee:');
		writeln(' ');
		writeln('   1: Mes en que mas se vendio');
		writeln(' ');
		writeln('   2: Total recaudado en el dia de la fecha');
		read(op);
		case op of
			1: begin
				mejormes (res, me, ani);
				writeln('El mes ',me,' del año ',ani,'ha recaudado mayor ganancia');
			end;
			2: begin
				totaldia (ac);
				writeln('El total recaudado en el dia de la fecha es: ',ac);
			end;
		end;
	end;
	
end.
