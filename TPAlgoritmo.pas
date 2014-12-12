{
 **Creado: 12/12/2014
 **Giuly
 }
Program TPAlgoritmo;
Uses crt, tipos, frontend, archivos, arboles, estructuras_dinamicas, menu;

var
	op: char;
Begin {Principal}
	comienzo;
	repeat
		opciones;
		read(op);
		case op of
			'1': Begin
					{venta/facturacion}
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
