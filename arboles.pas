unit arboles;
interface
	uses tipos;

	procedure crearArbol(arbol:aArticulo);
	procedure crearArbol(arbol:aFactura);

	procedure insertarArbol(var arbol:aArticulo; dato:taArticulo; clave:string);
	procedure insertarArbol(var arbol:aFactura; dato:taFactura; clave:tClave);
	
	procedure buscarArbol(arbol:aArticulo; buscado:word; var nodo:aArticulo);
	procedure buscarArbol(arbol:aArticulo; var buscado:string; var nodo:aArticulo);
	procedure buscarArbol(arbol:aFactura; buscado:word; var nodo:aFactura);
	
	procedure listarArbol(arbol:aArticulo);
	procedure listarArbol(arbol:aFactura);

implementation

	{
	 ***************************************************************************
	 *Procedimientos de utilidad.***********************************************
	 ***************************************************************************
	}
	function arbolVacio(arbol:aArticulo):boolean;
	begin
		arbolVacio := (arbol = nil);
	end;
	
	function arbolVacio(arbol:aFactura):boolean;
	begin
		arbolVacio := (arbol = nil);
	end;
	
	{
	 ***************************************************************************
	 *Procedimientos principales.***********************************************
	 ***************************************************************************
	}
	procedure crearArbol(arbol:aArticulo);
	begin
		arbol := nil;
	end;
	procedure crearArbol(arbol:aFactura);
	begin
		arbol := nil;
	end;

	procedure insertarArbol(var arbol:aArticulo; dato:taArticulo; clave:string);
	begin
		if arbol = nil then
		begin
			new(arbol);
			arbol^.info := dato;
			arbol^.izq := nil;
			arbol^.der := nil;
		end
		else
		begin
			case clave of
				'codigo':
				begin
					if arbol^.info.codigo <= dato.codigo then
						insertarArbol(arbol^.der, dato, clave)
					else
						insertarArbol(arbol^.izq, dato, clave)
				end;
				
				'descripcion':
				begin
					if arbol^.info.descripcion <= dato.descripcion then
						insertarArbol(arbol^.der, dato, clave)
					else
						insertarArbol(arbol^.izq, dato, clave)
				end;
			
			end;
		end;
	end;
	
	procedure insertarArbol(var arbol:aFactura; dato:taFactura; clave:tClave);
	begin
		if arbol = nil then
		begin
			new(arbol);
			arbol^.info := dato;
			arbol^.izq := nil;
			arbol^.der := nil;
		end
		else
		begin
			if arbol^.info.nFactura <= dato.nFactura then
				insertarArbol(arbol^.der, dato, clave)
			else
				insertarArbol(arbol^.izq, dato, clave)
		end;
	end;
	
	
	procedure buscarArbol(arbol:aArticulo; buscado:word; var nodo:aArticulo);
	var
		aux:aArticulo;
	begin
		if not arbolVacio(arbol) then
		begin
			aux := arbol;
			if aux^.info.codigo = buscado then
				nodo := aux
			else
			begin
				if aux^.info.codigo < buscado then
					buscarArbol(arbol^.der, buscado, nodo)
				else
					buscarArbol(arbol^.izq, buscado, nodo)
			end;
		end;
	end;
	
	procedure buscarArbol(arbol:aArticulo; var buscado:string; var nodo:aArticulo);
	var
		aux:aArticulo;
	begin
		if not arbolVacio(arbol) then
		begin
			if aux^.info.descripcion = buscado then
				nodo := aux
			else
			begin
				if aux^.info.descripcion < buscado then
					buscarArbol(arbol^.der, buscado, nodo)
				else
					buscarArbol(arbol^.izq, buscado, nodo)
			end;
		end;
	end;
	
	procedure buscarArbol(arbol:aFactura; buscado:word; var nodo:aFactura);
	var
		aux:aFactura;
	begin
		if not arbolVacio(arbol) then
		begin
			if aux^.info.nFactura = buscado then
				nodo := aux
			else
			begin
				if aux^.info.nFactura < buscado then
					buscarArbol(arbol^.der, buscado, nodo)
				else
					buscarArbol(arbol^.izq, buscado, nodo)
			end;
		end;
	end;
	
	
	procedure listarArbol(arbol:aArticulo);
	begin
		if (arbol <> nil) then
		begin
			listarArbol(arbol^.izq);
			with arbol^.info do
			begin
				writeln('Código de articulo: ', codigo);
				writeln('descripcion: ', descripcion);
			end;
			listarArbol(arbol^.der);
		end;
	end;
	procedure listarArbol(arbol:aFactura);
	begin
		if (arbol <> nil) then
		begin
			listarArbol(arbol^.izq);
			with arbol^.info do
			begin
				writeln('Numero de Factura: ', nFactura);
			end;
			listarArbol(arbol^.der);
		end;
	end;

end.