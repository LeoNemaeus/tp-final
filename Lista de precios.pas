Unit listar_precios;
interface
uses tipos, arboles, archivos, crt, menu;

Procedure precio_inorden(var arbol: aArticulo, var ar: fArticulo);
	var aux: fArticulo;
	Begin
		if arbol <> nil then
		Begin
			precio_inorden(arbol^.izq, ar);
			seek (ar, arbol^.info.fpos);
			read (ar, aux);
			writeln(aux^.codigo);
			writeln(aux^.descripcion);
			writeln(aux^.precio_venta);
			precio_inorden(arbol^.der, ar);
		end;
	end;
	
////////////////////
Begin
	cod2;
	read(op);
	case op of
		{1:precio_inorden(arbol codigo, ar);
		2: precio_inorden(arbol descripcion, ar);}
end;