unit G_ActPre;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector, tipos;

procedure opcion4 (var arA: ArchivoArt; var A: arbolArt; var B: arbolArt);

implementation

procedure opcion4 (var arA: ArchivoArt; var A: arbolArt; var B: arbolArt);
var
	fin: word;
	op: byte;
	codigo: word;
	descripcion: string;
	nodo: Art;
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
			cargarArbol (A, B, arA);
			presActPre; //menu
			writeln('                        Ingrese el codigo del producto: ');
			readln(codigo);
			buscarCodigo (A, codigo, nodo, salir); //arbol
		end;
		if op=2 then
		Begin
			cargarArbol (A, B, arA);
			presActPre; //menu
			writeln('                      Ingrese la descripcion del producto: ');
			readln(descripcion);
			buscarDesc (B, descripcion, nodo, salir); //arbol
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
			leerArt(arA, aux, nodo.pos); //archivo
			presActPre; //menu
			writeln('              El precio de venta del producto seleccionado es: ',aux.pVenta:5:2);
			writeln('  ');
			writeln('              El precio de costo del producto seleccionado es: ',aux.pCosto:5:2);
			por:= (aux.pVenta - aux.pCosto)*100;
			por:= por/aux.pCosto;
			writeln('  ');
			writeln('              El porcentaje aplicado es: ', por:3:2);
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
					readln(po);
					aux.pVenta := (po*aux.pCosto)/100;
					aux.pVenta := aux.pVenta + aux.pCosto;
					writeln('  ');
					writeln('                       El precio de venta sera: ',aux.pVenta:5:2);
					ReEscArt(arA, aux, pos); //archivo
				end;
				if h=2 then
				Begin
					presActPre; //menu
					writeln('                       Ingrese el porcentaje a aplicar');
					readln(po);
					aux.pVenta := (po*aux.pCosto)/100;
					aux.pVenta := aux.pVenta + aux.pCosto;
					writeln('  ');
					writeln('                       El precio de venta sera: ',aux.pVenta:5:2);
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
	cargarArbol (A, B, arA);
	read(fin);
	until (fin=2)
end;
end.
