unit G_EstVen;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos;

	Procedure mejormes (var res: real; var me: word; var ani: word; var arA: ArchivoArt; var arF: ArchivoFac);
	procedure totaldia (var ac:real);
	Procedure princuerpo (var arA: ArchivoArt; var arF: ArchivoFac);

implementation

	Procedure mejormes (var res: real; var me: word; var ani: word; var arA: ArchivoArt; var arF: ArchivoFac);
	var
		I: word;
		aux: tipoFac;
		mes: word;
		cont: real;
		fin: word;
		anio:word;
	begin
		res := 0;
		I:=0;
		leerFac(arF, aux, I);
		mes:= aux.fecha.mes;
		anio:= aux.fecha.anio;
		cont:=aux.total;
		while not eof(arF) do
		begin
			leerFac(arF, aux, I);
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
			leerFac(arF, aux, fin);
			if (a=aux.fecha.anio) and (m=aux.fecha.mes) and (d= aux.fecha.dia) then
				ac:= ac+aux.total;
			fin:= fin-1
		until ((d<>aux.fecha.dia) and (m=aux.fecha.mes))
	end;

	Procedure princuerpo (var arA: ArchivoArt; var arF: ArchivoFac);
	var
		op: word;
		res: real;
		me: word;
		ani: word;
		ac:real;
	begin
		clrscr;
		writeln('               Seleccione la opcion que desee:');
		writeln(' ');
		writeln('               1: Mes en que mas se vendio');
		writeln(' ');
		writeln('               2: Total recaudado en el dia de la fecha');
		read(op);
		case op of
			1: begin
				clrscr;
				mejormes (res, me, ani, arA, arF);
				writeln('El mes ',me,' del año ',ani,'ha recaudado mayor ganancia');
			end;
			2: begin
				clrscr;
				totaldia (ac);
				writeln('El total recaudado en el dia de la fecha es: ',ac);
			end;
		end;
	end;
	
end.
