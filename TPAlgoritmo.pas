{
 **Creado: 12/12/2014
 **Giuly
 }
Program TPAlgoritmo;
Uses crt, tipos, frontend, archivos, arboles, estructuras_dinamicas, menu, Dos, system;
//La libreria system es para el manejo de archivos y Dos la uso para obtener la hora

var
	op: char;
Begin {Principal}
	comienzo;
	repeat
		repeat
			opciones;
			read(op);
		until op in [0..8]
		case op of
			'1': Begin
					{venta/facturacion}
					/// hecho con el nombre: venta.pas
				end;
			'2': Begin
					{Actualizacion Stock}
				end;
			'3': Begin
					{lista de precios}
					listado (raiz);
					clrscr;
				end;
			'4': Begin
					{Actualizacion de precios}
				end;
			'5': Begin
					{Consulta de facturas}
				end;
			'6': Begin
					{Consulta articulos}
				end;
			'7': Begin
					{Estadisticas de venta}
				end;
			'8': Begin
					{pedido de articulos faltantes por proveedor}
				end;
	until op='0';
	Finalizar;
End.