Unit Arbol;
		
interface
uses Crt, Menu, Tipos, Archivo, ProArbol;
		
	procedure crearArbol (var A:arbolArtC; var B:arbolArtD);
	function arbolVacioA (A:arbolArtC): boolean;
	function arbolVacioB (B:arbolArtD):boolean;
	procedure cargarArbol (var A:arbolArtC; var B:arbolArtD; var arA: ArchivoArt);
	Procedure insertarArbol(Var A:arbolArtC ;var B:arbolArtD ; nodoC: ArtC; nodoD:ArtD);
	procedure buscarCodigo (A: arbolArtC; buscado: word; var nodoC: ArtC; var salir: boolean);
	procedure buscarDesc (B: arbolArtD; bus:string; var nodoD: ArtD; var salir: boolean);
	Procedure Borrar (var A: arbolArtC; var B:arbolArtD; nodoC: ArtC; nodoD: ArtD);

implementation

	
	procedure crearArbol (var A:arbolArtC; var B:arbolArtD);
	Begin
		A:= nil;
		B:= nil;
	end;
	
	function arbolVacioA (A:arbolArtC):boolean;
	Begin
		arbolVacioA := (A=nil);
	end;
	
	function arbolVacioB (B:arbolArtD):boolean;
	Begin
		arbolVacioB := (B=nil);
	end;
	
	procedure cargarArbol (var A:arbolArtC; var B:arbolArtD; var arA: ArchivoArt);
	var
		I: word;
		pos: word;
		nodoC: ArtC;
		nodoD: ArtD;
		datoA: tipoArt;
	begin
		crearArbol (A, B);
		posicion(arA, pos); //archivo
		I:=0;
		repeat
			leerArt(arA, datoA, I); //archivo
			nodoC.codigo:= datoA.codigo;
			nodoD.descri:= datoA.descri;
			nodoC.pos:= I;
			nodoD.pos:= I;
			insertarArbol(A, B, nodoC, nodoD);
			inc(I);
		until (I=pos);
	end;
	
	Procedure insertarArbol(Var A:arbolArtC ;var B:arbolArtD ; nodoC: ArtC; nodoD:ArtD);
	Var
		ok :Boolean;
	begin
		ok:= false;
		insertarA(A, nodoC, ok);
		insertarB(B, nodoD, ok);
	end;
	
	procedure buscarCodigo (A: arbolArtC; buscado: word; var nodoC: ArtC; var salir: boolean);
	var
		j:word;
		aux:arbolArtC;
	Begin
		salir:=false;
		if not arbolVacioA(A) then
		Begin
			aux:=A;
			if aux^.info.codigo = buscado then
				begin
				nodoC:= aux^.info
				end
			else
			Begin
				if aux^.info.codigo > buscado then
					buscarCodigo(aux^.izq, buscado, nodoC, salir)
				else
					buscarCodigo(aux^.der, buscado, nodoC, salir);
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
				buscarCodigo(A, buscado, nodoC, salir)
			end
			else salir:=true;
		end
	end;
	
	procedure buscarDesc (B: arbolArtD; bus:string; var nodoD: ArtD; var salir: boolean);
	var
		j:word;
		aux:arbolArtD;
	Begin
		salir:=false;
		if not arbolVacioB(B) then
		Begin
			aux:=B;
			if B^.info.descri = bus then
				nodoD:= aux^.info
			else
			Begin
				if aux^.info.descri > bus then
					buscarDesc(aux^.izq, bus, nodoD, salir)
				else
					buscarDesc(aux^.der, bus, nodoD, salir);
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
				buscarDesc(B, bus, nodoD, salir)
			end
			else salir:=true;
		end
	end;

	Procedure Borrar (var A: arbolArtC; var B:arbolArtD; nodoC: ArtC; nodoD: ArtD);
        var ok: boolean;
        Begin
		ok := False;
		BorrarArbolA(A, nodoC, ok);
		BorrarArbolD (B, nodoD, ok);
	End;
	
End.
