{
 *Archivo: tipos.pas
 *Creado: 06/12/2014
 *Autor: Sandro Pastorini
 *
 *Editado:	11/12/2014 (Giuly)
 *
 *Comentario:
 ****Se pueden alojar una cantidad máxima de 65536 productos distintos (un word).
 ****Por cada producto, el stock máximo es de 65536 elementos (un word).
 ****Stock mínimo: 1..256 (un byte).
 *
 *Por Hacer:
 **Agregar procedimientos de ayuda al tipo tFecha.
 **Revisar que las variables en los registros sean acordes a la consigna.
 **Completar con tipos faltantes (memoria dinámica, árboles, archivos, etc.)
 *
 *Discusión:
 **Se debería dividir la definición de tipos para cada una de las Units
 **específicas??? Por ej: que todos los tipos de archivos esten en la Unit de
 **arhivos.
}
unit tipos;
interface
type

{
 *tFecha representa una fecha. Se deben implementar procedimientos para su
 *modificación y acceso.
 **Procedimientos:
 **			Cadena a tFecha
}
    {tFecha = record
                d:0..31;    // Días
                m:0..12;    // Meses
                a:word;     // Años
            end;}
	tFecha = string[8];

{
 *Representa un artículo.
}
    tArticulo = record
                    codigo:word;
                    descripcion:string[140];
                    proveedor:string[90];
                    stock:word;
                    stock_minimo:byte;
                    precio_venta:real;
                    precio_costo:real;
                end;
 
{
 *Representa el detalle de las ventas de una factura.
}
    tVenta = array[1..15] of record
                                codigo:word;
                                cantidad:word;	// Discusión: La cantidad de
												// producto comprado deberia ser
												// un byte?
                                descripcion:string[90];
                                precio_unitario:real;
                                precio_fila:real;
                            end;

{
 *Representa una factura.
}
    tFactura = record
                    nFactura:word;
                    fecha:tFecha;
                    nombre:string[50];
                    direccion:string[50];
					iva:string;					// jnvgowrhohgoh
												{Hay que poner que tipos de iva:
															-Responsable inscripto
															-Responsable monotributo
															-Consumidor final
												En la factura C hay que poner el tipo de iva, simpre es 21% pero ya esta agregado en el total
												no se discrimina*
												*Discriminar: no tenemos que sacar cuentas y sumarselas al total porque ya esta incluido}
                    condicion_venta:1..2;		// 1: Contado; 2: Crédito
                    venta:tVenta;
                    total:real;
                end;

{
 *Tipos pertinentes a la memoria dinámica
 *Nomeclatura:
 ** nXxxxx: nodo
 ** pXxxxx: puntero
 ** lXxxxx: lista
}
	pArticulo = ^nArticulo;
	nArticulo = record
					info:tArticulo;
					sig:pArticulo;
				end;
	lArticulo = record
					cab:pArticulo;
					tam:word;
				end;

	pVenta = record
				
			end;

{
 *Tipos referentes a arboles binarios
 ****aXxxxx: arbol
 ****hXxxxx: hoja
 ****paXxxxx: puntero
}
	paArticulo = ^hArticulo;
	hArticulo = record
					info:tArticulo;
					izq:aArticulo;
					der:aArticulo;
				end;
	aArticulo = Record
					raiz: paArticulo;
					tam: word;
				end;
{
 *Tipos pertinentes a los archivos.
 *Nomeclatura:
 **fXxxxxx: archivo (file)
}
	

	fArticulo = file of tArticulo;
	
	fFactura = file of tFactura;

{
 *Procedimientos
}
{
procedure wordAtFecha(arg:word; var r:tFecha);
procedure stringAtFecha(arg:string; var r:tFecha);
}
implementation
	procedure wordAtFecha(arg:word; var r:tFecha);
	begin
		
	end;
	
{
 *Convierte una fecha en formato cadena de la forma 'dd/mm/aaaa' al tipo tFecha.
 *Si encuentra un error en la copia se devuelve como resultado (r) 00/00/0000
 *Por hacer:
 **Comprobar que las fechas ingresadas sean correctas antes de hacer la copia
 **para evitar una excepción.
}{
	procedure stringAtFecha(arg:string; var r:tFecha);
	var
		cod:integer; exito:boolean;
	begin
		exito := true;
		val(copy(arg, 1, 2), r.d, cod);
			if(cod <> 0) then exito := false;
		val(copy(arg, 4, 2), r.m, cod);
			if(cod <> 0) then exito := false;
		val(copy(arg, 7, 4), r.a, cod);
			if(cod <> 0) then exito := false;
		
		if not(exito) then
		begin
			r.d := 00;
			r.m := 00;
			r.a := 0000;
		end;
	end;}
end.