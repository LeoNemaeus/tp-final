Unit Arbol;

interface
uses Crt, Vistas, Tipos, Archivo;
		
	procedure crearArbol (var A:arbolArtC; var B: arbolArtD);
	function arbolVacioA (A:arbolArtC): boolean;
	function arbolVacioB (B: arbolArtD): boolean;
	procedure insertarArbol (var A: arbolArtC; var B: arbolArtD; nodoC: ArtC; nodoD: ArtD);
	procedure buscarCodigo (A: arbolArtC; buscado: word; var nodoC: ArtC; var salir: boolean);
	procedure cargarArbol (var A:arbolArtC; var B: arbolArtD; var arA: ArchivoArt);
	procedure buscarDesc (B: arbolArtD; bus:string; var nodoD: ArtD; var salir: boolean);
	procedure reformaArbol (var A: arbolArtC; var B: arbolArtD; var arA: ArchivoArt);
	
	implementation

	
	procedure crearArbol (var A:arbolArtC; var B: arbolArtD);
	Begin
		A:= nil;
		B:= nil;
	end;
	
	function arbolVacioA (A:arbolArtC):boolean;
	Begin
		arbolVacioA := (A=nil);
	end;
	
	function arbolVacioB (B: arbolArtD):boolean;
	Begin
		arbolVacioB := (B=nil);
	end;
	
function max (uno: Shortint; dos: Shortint): Shortint;
begin
	if (uno > dos) then
		max:= uno
	else max:= dos;
end;

function mini (uno: Shortint; dos: Shortint; tres: Shortint): Shortint;
begin
	if (uno = dos) then
		if (uno < tres) then
			mini:= uno
		else mini:= tres
	else
		if (uno = tres) then
			if (uno < dos) then
				mini:= uno
			else mini:= dos
		else
			if (dos = tres) then
				if (dos < uno) then
					mini:= dos
				else mini:= uno
			else
				if (uno < dos) and (uno < tres) then
					mini:= uno
				else
					if (dos < uno) and (dos < tres) then
						mini:= dos
					else mini:= tres;		
end;

	procedure rotIzq(var A: arbolArtC);
	var
		aux: arbolArtC;
		cont: Shortint;
	begin
		aux := A;
		A:= A^.der;
		aux^.der := A^.izq;
		A^.izq:= aux;
		cont:= aux^.bal;
		aux^.bal := cont - 1 - max( A^.bal, 0 );
		A^.bal := mini( cont-2, cont+A^.bal-2, A^.bal-1);
	end;
	
	procedure rotDer(var A: arbolArtC);
	var
		aux: arbolArtC;
		cont: Shortint;
	begin
		aux := A;
		A:= A^.izq;
		aux^.izq:= A^.der;
		A^.der:= aux;
		cont:= aux^.bal;
		aux^.bal := cont + 1 + max( -A^.bal, 0 );
		A^.bal := -mini( -cont-2, -cont-A^.bal-2, -A^.bal-1);
	end;
	
	function insertarA (var A: arbolArtC; nodoC: ArtC): Shortint;
	var
		aux: Shortint;
	begin
		insertarA:=0;
		if (A=nil) then
			begin
				new(A);
				A^.info:= nodoC;
				A^.der:=nil;
				A^.izq:=nil;
				A^.bal:=0;
				insertarA:=1;
			end
		else
		Begin
			if (A^.info.codigo < nodoC.codigo) then
				aux:=insertarA (A^.der, nodoC)
			else	aux:= -insertarA (A^.izq, nodoC);
			A^.bal:= A^.bal+aux;
			if (aux<>0) and (A^.bal <> 0) then
				if (A^.bal < -1) then
					if A^.izq^.bal < 0 then
						rotDer(A)
					else
					begin
						rotIzq(A^.izq);
						rotDer(A)
					end
				else
					if (A^.bal > 1) then
						if (A^.der^.bal > 0) then
							rotIzq(A)
						else
						begin
							rotDer(A^.der);
							rotIzq(A)
						end
				else
					insertarA := 1;
		end;
	end;
	
		procedure rotIzq(var B: arbolArtD);
	var
		aux: arbolArtD;
		cont: Shortint;
	begin
		aux := B;
		B:= B^.der;
		aux^.der := B^.izq;
		B^.izq:= aux;
		cont:= aux^.bal;
		aux^.bal := cont - 1 - max( B^.bal, 0 );
		B^.bal := mini( cont-2, cont+B^.bal-2, B^.bal-1);
	end;
	
	procedure rotDer(var B: arbolArtD);
	var
		aux: arbolArtD;
		cont: Shortint;
	begin
		aux := B;
		B:= B^.izq;
		aux^.izq:= B^.der;
		B^.der:= aux;
		cont:= aux^.bal;
		aux^.bal := cont + 1 + max( -B^.bal, 0 );
		B^.bal := -mini( -cont-2, -cont-B^.bal-2, -B^.bal-1);
	end;
	
	function insertarB (var B: arbolArtD; nodoD: ArtD): Shortint;
	var
		aux: Shortint;
	begin
		insertarB:=0;
		if (B=nil) then
			begin
				new(B);
				B^.info:= nodoD;
				B^.der:=nil;
				B^.izq:=nil;
				B^.bal:=0;
				insertarB:=1;
			end
		else
		Begin
			if (B^.info.descri < nodoD.descri) then
				aux:=insertarB (B^.der, nodoD)
			else	aux:= -insertarB (B^.izq, nodoD);
			B^.bal:= B^.bal+aux;
			if (aux<>0) and (B^.bal <> 0) then
				if (B^.bal < -1) then
					if B^.izq^.bal < 0 then
						rotDer(B)
					else
					begin
						rotIzq(B^.izq);
						rotDer(B)
					end
				else
					if (B^.bal > 1) then
						if (B^.der^.bal > 0) then
							rotIzq(B)
						else
						begin
							rotDer(B^.der);
							rotIzq(B)
						end
				else
					insertarB := 1;
		end;
	end;
	
	procedure insertarArbol (var A: arbolArtC; var B: arbolArtD; nodoC: ArtC; nodoD: ArtD);
	var ok:Shortint;
	begin
		ok := insertarB (B, nodoD);
		ok := insertarA (A, nodoC);
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

	
		procedure cargarArbol (var A:arbolArtC; var B: arbolArtD; var arA: ArchivoArt);
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
			nodoC.pos:= I;
			nodoD.descri:= datoA.descri;
			nodoD.pos:=I;
			insertarArbol (A, B, nodoC, nodoD);
			inc(I);
		until (I=pos);
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

Procedure postordenA (var A : arbolArtC);
var
	aux: arbolArtC;
begin
	aux:=A;
	if (aux <> nil) then
	begin
		postordenA(aux^.Izq);
		postordenA(aux^.Der);
		dispose(aux);
	end
end;

Procedure postordenB (var B : arbolArtD);
var
	aux: arbolArtD;
begin
	aux:=B;
	if (aux <> nil) then
	begin
		postordenB(aux^.Izq);
		postordenB(aux^.Der);
		dispose(aux);
	end
end;

procedure reformaArbol (var A: arbolArtC; var B: arbolArtD; var arA: ArchivoArt);
begin
	postordenA(A);
	postordenB(B);
	cargarArbol (A, B, arA);
end;

	
End.
