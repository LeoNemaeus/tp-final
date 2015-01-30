unit G_ActPre;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

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

Begin
	fin:=1;
	repeat
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                            ACTUALIZACION DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
		writeln('                Seleccione la opcion de busqueda del producto: ');
		writeln('  ');
		writeln('  ');
		writeln('                           1: Busqueda por Codigo ');
		writeln('  ');
		writeln('                           2: Busqueda por Descripcion ');
		read(op);
		if op=1 then
		begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                            ACTUALIZACION DE PRECIOS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('  ');
			writeln('                        Ingrese el codigo del producto: ');
			read(codigo);
			buscarCodigo (A, codigo, nodo);
		end;
		if op=2 then
		Begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                            ACTUALIZACION DE PRECIOS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('  ');
			writeln('                      Ingrese la descripcion del producto: ');
			read(descripcion);
			buscarDesc (B, descripcion, nodo);
		end;
		if op>=3 then
		begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                            ACTUALIZACION DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('                       La opcion seleccionada no es correcta ');
		readkey;
		exit
		end;
		leerArt(arA, aux, nodo.pos);
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                            ACTUALIZACION DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('              El precio de venta del producto seleccionado es: ',aux.pVenta:5:2);
		writeln('  ');
		writeln('              El precio de costo del producto seleccionado es: ',aux.pCosto:5:2);
		por:= (aux.pVenta - aux.pCosto)*100;
		por:= por/aux.pCosto;
		writeln('  ');
		writeln('              El porcentaje aplicado es: ', por:3:2);
		writeln('  ');
		writeln('                             Desea modificar el precio? (s/n)');
		read(p);
		if (p= 's') then
		Begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                            ACTUALIZACION DE PRECIOS  ');
			textcolor(15);
			writeln('  ');
			writeln('                              Desea modificar: ');
			writeln(' ');
			writeln('                       1 : Precio de Costo y/o porcentaje');
			writeln(' ');
			writeln('                       2 : Porcentaje de Ganancia');	
			read(h);
			if h=1 then
			begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE PRECIOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                           Ingrese el precio de costo: ');
				read(cost);
				aux.pCosto := cost;
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE PRECIOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                       Ingrese el porcentaje a aplicar');
				read(po);
				aux.pVenta := (po*aux.pCosto)/100;
				aux.pVenta := aux.pVenta + aux.pCosto;
				writeln('  ');
				writeln('                       El precio de venta sera: ',aux.pVenta:5:2);
				ReEscArt(arA, aux, pos);
			end;
			if h=2 then
			Begin
				clrscr;
				textcolor(2);
				writeln('  ');
				writeln('                            ACTUALIZACION DE PRECIOS  ');
				textcolor(15);
				writeln('  ');
				writeln('  ');
				writeln('                       Ingrese el porcentaje a aplicar');
				read(po);
				aux.pVenta := (po*aux.pCosto)/100;
				aux.pVenta := aux.pVenta + aux.pCosto;
				writeln('  ');
				writeln('                       El precio de venta sera: ',aux.pVenta:5:2);
				ReEscArt(arA, aux, pos);
			end;
			if h >=3 then
			begin
			clrscr;
			textcolor(2);
			writeln('  ');
			writeln('                            ACTUALIZACION DE PRECIOS  ');
			textcolor(15);
			writeln('  ');
			writeln('  ');
			writeln('                       La opcion seleccionada no es correcta ');
			readkey;
			end;
		end;
	clrscr;
	textcolor(2);
	writeln('  ');
	writeln('                            ACTUALIZACION DE PRECIOS  ');
	textcolor(15);
	writeln('  ');
	writeln('  ');
	writeln('                         1 : Continuar');
	writeln('  ');
	writeln('                         2 : Finalizar actualizacion');
	read(fin);
	until (fin=2)
end;
end.