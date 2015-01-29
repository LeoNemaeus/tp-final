Unit G_Arbol;

interface
uses Crt;
type
	Art = Record
		codigo: word;
		descripcion: string;
		pos:word;
		end;
	arbolArt= ^hojaA;
	hojaA = Record
		info: Art;
		izq: arbolArt;
		der: arbolArt;
		altura: word;
		end;
		
	procedure crearArbol (var A:arbolArt; var B:arbolArt);
	function arbolVacio (A:arbolArt): boolean;
	procedure insertarArbol (var A:arbolArt; nodo: Art; var B: arbolArt);
	procedure insertar (var A: arbolArt; nodo: Art; var dir: arbolArt);
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art);
	procedure buscarDesc (B: arbolArt; bus: string; var nodo: Art);
	
implementation
var
	A: arbolArt;
	B: arbolArt;
	nodo: Art;
	buscado: word;
	bus: string;
	
	procedure crearArbol (var A:arbolArt; var B:arbolArt);
	Begin
		A:= nil;
		B:= nil;
	end;
	
	function arbolVacio (A:arbolArt):boolean;
	Begin
		arbolVacio := (A=nil);
	end;
	
	procedure insertarArbol (var A:arbolArt; nodo: Art; var B: arbolArt);
	var
		dir: arbolArt;
	Begin
		dir^.info:= nodo;
		dir^.izq:= nil;
		dir^.der:= nil;
		insertar (A, nodo, dir);
		insertar (B, nodo, dir);
	end;
	
	procedure insertar (var A: arbolArt; nodo: Art; var dir: arbolArt);
	begin
		if (A=nil) then
			begin
				A:= dir;
			end
		else
		Begin
			if A^.info.codigo > dir^.info.codigo then
				insertar (A, nodo, dir)
			else
				insertar (A, nodo, dir);
		end;
	end;
	
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art);
	var
		j: string;
	Begin
		if not arbolVacio(A) then
		Begin
			if A^.info.codigo = buscado then
				begin
				nodo:= A^.info
				end
			else
			Begin
				if A^.info.codigo > buscado then
					buscarCodigo(A^.izq, buscado, nodo)
				else
					buscarCodigo(A^.der, buscado, nodo);
			end;
		end
		else
		Begin
			clrscr;
			writeln('                Codigo no encontrado!');
			writeln('           Desea buscar nuevamente? (s/n)');
			read(j);
			clrscr;
			if (j='s') then
			begin
				clrscr;
				writeln('         Escriba el codigo: ');
				read(buscado);
				buscarCodigo(A, buscado, nodo)
			end;
		end
	end;
	
	procedure buscarDesc (B: arbolArt; bus: string; var nodo: Art);
	var
		j:string;
	Begin
		if not arbolVacio(B) then
		Begin
			if B^.info.descripcion = bus then
				nodo:= B^.info
			else
			Begin
				if B^.info.descripcion > bus then
					buscarDesc(B^.izq, bus, nodo)
				else
					buscarDesc(B^.der, bus, nodo);
			end;
		end
		else
		begin
			clrscr;
			writeln('               Descripcion no encontrada!');
			writeln('              Desea buscar nuevamente? (s/n)');
			read(j);
			clrscr;
			if (j='s') then
			begin
				clrscr;
				writeln('               Por favor escriba la descripcion nuevamente');
				read(bus);
				buscarDesc(B, bus, nodo)
			end;
		end
	end;
	
End.
