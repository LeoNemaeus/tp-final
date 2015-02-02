Unit G_Arbol;

interface
uses Crt;
type
	Art = Record
		codigo: word;
		descri: string;
		pos:word;
		end;
	arbolArt= ^hojaA;
	hojaA = Record
		info: Art;
		izq: arbolArt;
		der: arbolArt;
		end;
		
	procedure crearArbol (var A:arbolArt; var B:arbolArt);
	function arbolVacio (A:arbolArt): boolean;
	procedure insertarArbol (var A:arbolArt; nodo: Art; var B: arbolArt);
	procedure insertarA (var A: arbolArt; nodo: Art);
	procedure insertarB (var B: arbolArt; nodo: Art);
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art);
	procedure buscarDesc (B: arbolArt; bus:word{ string}; var nodo: Art);
	
implementation
var
	A: arbolArt;
	B: arbolArt;
	nodo: Art;
	buscado: word;
	bus: word; {string;}
	
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
	Begin
		insertarA (A, nodo);
		insertarB (B, nodo);
	end;
	
	procedure insertarA (var A: arbolArt; nodo: Art);
	begin
		if (A=nil) then
			begin
				new(A);
				A^.info:= nodo;
				A^.der:=nil;
				A^.izq:=nil;
				exit;
			end
		else
		Begin
			if A^.info.codigo > nodo.codigo then
				insertarA (A^.izq, nodo)
			else
				insertarA (A^.der, nodo);
		end;
	end;
	
	procedure insertarB (var B: arbolArt; nodo: Art);
	begin
		if (B=nil) then
			begin
				new(B);
				B^.info:= nodo;
				B^.der:=nil;
				B^.izq:=nil;
				exit;
			end
		else
		Begin
			if B^.info.descri > nodo.descri then
				insertarB (B^.izq, nodo)
			else
				insertarB (B^.der, nodo);
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
	
	procedure buscarDesc (B: arbolArt; bus: word {string}; var nodo: Art);
	var
		j:string;
	Begin
		if not arbolVacio(B) then
		Begin
			if B^.info.descri = bus then
				nodo:= B^.info
			else
			Begin
				if B^.info.descri > bus then
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
