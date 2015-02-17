unit Punto4;
interface
uses Vistas, Archivo, Arbol, crt, Vector, Tipos;

procedure opcion4 (var arA: ArchivoArt; var A: arbolArtC; var B: arbolArtD);

implementation

procedure opcion4 (var arA: ArchivoArt; var A: arbolArtC; var B: arbolArtD);
var
	fin: word;
	op: byte;
	codigo: word;
	descripcion: string;
	nodoC: ArtC;
	nodoD: ArtD;
	cantidad: word;
	p: string[2];
	h: word;
	cost: real;
	l: string[2];
	aux: tipoArt;
	por: real;
	po: real;
	pos: word;
	precio:word;
	salir: boolean;
Begin
	fin:=1;
	repeat
		presActPre; //menu
		codig; //menu
		readln(op);
		if op=1 then
		begin
			presActPre; //menu
			writeln('                        Ingrese el codigo del producto: ');
			readln(codigo);
			buscarCodigo (A, codigo, nodoC, salir); //arbol
			pos:=nodoC.pos;
		end;
		if op=2 then
		Begin
			presActPre; //menu
			writeln('                      Ingrese la descripcion del producto: ');
			readln(descripcion);
			buscarDesc (B, descripcion, nodoD, salir); //arbol
			pos:=nodoD.pos;
		end;
		if op>=3 then
		begin
		presActPre; //menu
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
		exit
		end;
		if (salir=false) then
		begin
			leerArt(arA, aux, pos); //archivo
			presActPre; //menu
			writeln('              El precio de venta del producto seleccionado es: $',aux.pVenta:5:2);
			writeln('  ');
			writeln('              El precio de costo del producto seleccionado es: $',aux.pCosto:5:2);
			por:= (aux.pVenta - aux.pCosto)*100;
			por:= por/aux.pCosto;
			writeln('  ');
			writeln('              El porcentaje aplicado es: ', por:3:2,'%');
			writeln('  ');
			writeln('                             Desea modificar el precio? (s/n)');
			readln(p);
			if (p= 's') then
			Begin
				presActPre; //menu
				modificarprecio; //menu	
				read(h);
				if h=1 then
				begin
					presActPre; //menu
					writeln('                           Ingrese el precio de costo: ');
					readln(cost);
					aux.pCosto := cost;
					presActPre; //menu
					writeln('                       Ingrese el porcentaje a aplicar');
					gotoxy(24,7);readln(po);
					aux.pVenta := (po*aux.pCosto)/100;
					aux.pVenta := aux.pVenta + aux.pCosto;
					writeln;
					writeln;
					writeln('                       El nuevo precio de venta sera: $');
					textcolor(11);
					gotoxy(57, 10); writeln(aux.pVenta:5:2);
					readkey;
					ReEscArt(arA, aux, pos); //archivo
				end;
				if h=2 then
				Begin
					presActPre; //menu
					writeln('                       Ingrese el porcentaje a aplicar');
					gotoxy(24,7);readln(po);
					aux.pVenta := (po*aux.pCosto)/100;
					aux.pVenta := aux.pVenta + aux.pCosto;
					writeln;
					writeln;
					writeln('                       El nuevo precio de venta sera: $');
					textcolor(11);
					gotoxy(57, 10); writeln(aux.pVenta:5:2);
					readkey;
					ReEscArt(arA, aux, pos); //archivo
				end;
				if h >=3 then
				begin
				presActPre; //menu
				writeln('                       La opcion seleccionada no es correcta ');
				readkey;
				end;
			end;
		end;
	presActPre; //menu
	cierre; //menu
	read(fin);
	until (fin=2)
end;
end.
