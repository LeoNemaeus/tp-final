Unit G_Arbol;

interface
uses Crt, g_menu, tipos, g_archivo;
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
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art; var salir: boolean);
	procedure buscarDesc (B: arbolArt; bus:string; var nodo: Art; var salir: boolean);
	procedure cargarArbol (var A:arbolArt; var B:arbolArt; var arA: ArchivoArt);

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
	
		procedure cargarArbol (var A:arbolArt; var B:arbolArt; var arA: ArchivoArt);
	var
		I: word;
		pos: word;
		nodo: Art;
		datoA: tipoArt;
	begin
		crearArbol (A, B);
		posicion(arA, pos); //archivo
		I:=0;
		repeat
			leerArt(arA, datoA, I); //archivo
			nodo.codigo:= datoA.codigo;
			nodo.descri:= datoA.descri;
			nodo.pos:= I;
			insertarArbol (A, nodo, B);
			inc(I);
		until (I=pos);
	end;

	
	procedure buscarCodigo (A: arbolArt; buscado: word; var nodo: Art; var salir: boolean);
	var
		j:word;
		aux:arbolArt;
	Begin
		salir:=false;
		if not arbolVacio(A) then
		Begin
			aux:=A;
			if aux^.info.codigo = buscado then
				begin
				nodo:= aux^.info
				end
			else
			Begin
				if aux^.info.codigo > buscado then
					buscarCodigo(aux^.izq, buscado, nodo, salir)
				else
					buscarCodigo(aux^.der, buscado, nodo, salir);
			end;
		end
		else
		Begin
			errorcod; //menu
			read(j);
			clrscr;
			if (j=1) then
			begin
				repetir; //menu
				read(buscado);
				buscarCodigo(A, buscado, nodo, salir)
			end
			else salir:=true;
		end
	end;
	
	procedure buscarDesc (B: arbolArt; bus:string; var nodo: Art; var salir: boolean);
	var
		j:word;
		aux:arbolArt;
	Begin
		salir:=false;
		if not arbolVacio(B) then
		Begin
			aux:=B;
			if B^.info.descri = bus then
				nodo:= aux^.info
			else
			Begin
				if aux^.info.descri > bus then
					buscarDesc(aux^.izq, bus, nodo, salir)
				else
					buscarDesc(aux^.der, bus, nodo, salir);
			end;
		end
		else
		begin
			errordes; //menu
			readln(j);
			clrscr;
			if (j=1) then
			begin
				repetir; //menu
				readln(bus);
				buscarDesc(B, bus, nodo, salir)
			end
			else salir:=true;
		end
	end;
	
End.
