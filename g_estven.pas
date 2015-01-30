unit G_EstVen;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, Dos;

procedure opcion7 (var arF: ArchivoFac);

implementation

procedure opcion7 (var arF: ArchivoFac);
	var
		op: word;
		res: real;
		me: word;
		ani: word;
		ac:real;
		a:word;
		m:word;
		d:word;
		fin:word;
		aux:tipoFac;
		s: word;
		I: word;
		mes: word;
		cont: real;
		pos: word;
		anio:word;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              ESTADISTICAS DE VENTAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('                         Seleccione la opcion que desee:');
		writeln(' ');
		writeln('                       1 : Mes en que mas se vendio');
		writeln(' ');
		writeln('                       2 : Total recaudado en el dia de la fecha');
		read(op);
		case op of
			1: begin
				clrscr;
				res := 0;
				I:=0;
				leerFac(arF, aux, I);
				mes:= aux.fecha.mes;
				anio:= aux.fecha.anio;
				cont:=aux.total;
				posicionf(arF, pos);
				while I <= pos do
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
					inc(I);
				end;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                              ESTADISTICAS DE VENTAS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                El mes ',me,' del anio ',ani,' ha recaudado mayor ganancia');
				readkey;
			end;
			2: begin
				clrscr;
				GetDate(a, m, d, s); {año, mes, dia del mes, dia de la semana}
				ac:=0;
				posicionf(arF, pos);
				repeat
					leerFac(arF, aux, pos);
					if (a=aux.fecha.anio) and (m=aux.fecha.mes) and (d= aux.fecha.dia) then
						ac:= ac+aux.total;
					pos:= pos-1
				until (pos=0);
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                              ESTADISTICAS DE VENTAS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                   El total recaudado en el dia de la fecha es: ',ac);
				readkey;
			end;
		end;
	end;

end.