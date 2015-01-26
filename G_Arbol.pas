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
		
	procedure crearArbol (A:arbolArt);
	function arbolVacio (A:arbolArt): boolean;
	procedure insertarArbol (var A:arbolArt; nodo: Art);
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art);
	procedure buscarDesc (B: arbolArt; bus: string; var nodo: Art);
	
implementation
var
	A: arbolArt;
	B: arbolArt;
	nodo: Art;
	buscado: word;
	bus: string;
	
	procedure crearArbol (A:arbolArt);
	Begin
		A:= nil;
	end;
	
	function arbolVacio (A:arbolArt):boolean;
	Begin
		arbolVacio := (A=nil);
	end;
	
	procedure insertarArbol (var A:arbolArt; nodo: Art);
	var
		dir: arbolArt;
	Begin
		dir^.info:= nodo;
		dir^.izq:= nil;
		dir^.der:= nil;
		if (A=nil) then
			begin
				A:= dir;
				B:= dir;
			end
		else
		Begin
			if A^.info.codigo > dir^.info.codigo then
				insertarArbol(A^.izq, nodo)
			else
				insertarArbol(A^.der, nodo);
			if B^.info.descripcion > dir^.info.descripcion then
				insertarArbol (B^.izq, nodo)
			else
				insertarArbol(B^.der, nodo)
		end;
	end;
	
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art);
	var
		j: string;
	Begin
		if not arbolVacio(A) then
		Begin
			if A^.info.codigo = buscado then
				nodo:= A^.info
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
			writeln('Codigo no encontrado!');
			writeln('Desea buscar nuevamente? (s/n)');
			read(j);
			clrscr;
			if (j='s') then
			begin
				writeln('Escriba el codigo: ');
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
			writeln('Descripcion no encontrada!');
			writeln('Desea buscar nuevamente? (s/n)');
			read(j);
			clrscr;
			if (j='s') then
			begin
				writeln('Por favor escriba la descripcion nuevamente');
				read(bus);
				buscarDesc(B, bus, nodo)
			end;
		end
	end;
	
End.
