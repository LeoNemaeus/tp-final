{
 *Archivo: tp_final.pas
 *Creado: 08/12/2014
 *Editado: 08/12/2014
			11/12/2014 (Giuly)
 *Autor: Sandro Pastorini
 *Comentario: Perdon Sandro! Cambie varias cosas.. Giuly
}
unit arboles;
interface

implementation
uses tipos;


{
** Para hacer el listado de los presios. Asi lo hizo la profe
}
Procedure listado (var raiz: paArticulo);
	begin
		if raiz <> nil then
			begin
				listado(raiz^.izq);
				writeln('Codogo: ', codigo, '  Descripcion: ', descripcion, '  Precio de Venta: ', precio_venta);
				listado(raiz^.der);
			end;
	end;

function arbolvacio(A:paArticulo):boolean;
begin
     arbolvacio:=(A=nil);
end;

{
 *Inserta un articulo por el codigo
 *** aCodigo = Arbol de codigo
}
procedure insertarArbolCodigo(var A:paArticulo; x:tArticulo);
begin
     if A=nil then
     begin
          new(A);
          A^.info:=x;
          A^.izq:=nil;
          A^.der:=nil;
     end
	 else
	 begin
		if A^.info.codigo<=x.codigo then
			insertarArbolCodigo(A^.der,x)
		else if A^.info.codigo>x.codigo then
			insertarArbolCodigo(A^.izq,x)
	end;
	inc(aCodigo^.tam);       ///determinar el nombre para los arboles a trabajar
end;

{
 *Inserta un articulo por la descripcion
 ** aDescripcion = Arbol de descripcion
}
procedure insertarArbolDescripcion(var A:paArticulo; x:tArticulo);
begin
     if A=nil then
     begin
          new(A);
          A^.info:=x;
          A^.izq:=nil;
          A^.der:=nil;
     end
	 else
	 begin
		if A^.info.descripcion<=x.descripcion then
			insertarArbolDescripcion(A^.der,x)
		else if A^.info.descripcion>x.descripcion then
			insertarArbolDescripcion(A^.izq,x)
	end;
	inc(aDescripcion^.tam);				/// determinar el nombre para los arboles a trabajar
end;

{
 *Buscar un artículo por codigo
}
procedure buscarArbolCodigo(A:paArticulo; x:tArticulo; var existe:boolean; var aux:paArticulo);
begin
	if not arbolVacio(A) then
	begin
		aux := A;
		if aux^.info.codigo = x.codigo then existe := true
		else
		begin
			if aux^.info.codigo <= x.codigo then
				buscarArbolCodigo(aux^.der, x, existe, aux);
			else
				buscarArbolCodigo(aux^.izq, x, existe, aux);
		end;
	end;
end;

{
 *Buscar un artículo por descripcion
}
procedure buscarArbolDescripcion(A:paArticulo; x:tArticulo; var existe:boolean; var aux:paArticulo);
begin
	if not arbolVacio(A) then
	begin
		aux := A;
		if aux^.info.descripcion = x.descripcion then existe := true
		else
		begin
			if aux^.info.descripcion <= x.descripcion then
				buscarArbolDescripcion(aux^.der, x, existe, aux);
			else
				buscarArbolDescripcion(aux^.izq, x, existe, aux);
		end;
	end;
end;
	
end.