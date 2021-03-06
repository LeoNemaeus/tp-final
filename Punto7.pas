unit Punto7;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Dos, Tipos;

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
		presEstVentas; //menu
		opcionEst; //menu
		read(op);
		case op of
			1: begin
				clrscr;
				res := 0;
				I:=0;
				leerFac(arF, aux, I); //archivo
				mes:= aux.fecha.mes;
				anio:= aux.fecha.anio;
				me:=mes;
				ani:=anio;
				cont:=aux.total;
				res:=cont;
				posicionf(arF, pos); //archivo
				inc(I);
				while I <= pos do
				begin
					leerFac(arF, aux, I); //archivo
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
						cont:= aux.total;
					end;
					inc(I);
				end;
				presEstVentas; //menu
				writeln('                El mes ',me,' del anio ',ani,' ha recaudado mayor ganancia');
				writeln('                El total recaudado es: $',res:7:2);
				readkey;
			end;
			2: begin
				clrscr;
				GetDate(a, m, d, s); {año, mes, dia del mes, dia de la semana} //Dos
				ac:=0;
				posicionf(arF, pos); //archivo
				repeat
					leerFac(arF, aux, pos); //archivo
					if (a=aux.fecha.anio) and (m=aux.fecha.mes) and (d= aux.fecha.dia) then
						ac:= ac+aux.total;
					pos:= pos-1
				until (pos=0);
				presEstVentas; //menu
				writeln('                   El total recaudado en el dia de la fecha es: $',ac:7:2);
				readkey;
			end;
		end;
	end;

end.