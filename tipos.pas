{
 *Archivo: tipos.pas
 *Creado: 06/12/2014
 *Autor: Sandro Pastorini
 *
 *Editado:	11/12/2014 (Giuly), 14/12/2014 (Sandro)
 *
 *Comentario:
 ****Se pueden alojar una cantidad máxima de 65536 productos distintos (un word)
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

uses sysutils;

type

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

{Hay que poner que tipos de iva:
			-Responsable inscripto
			-Responsable monotributo
			-Consumidor final
En la factura C hay que poner el tipo de iva, simpre es 21% pero ya esta
agregado en el total no se discrimina*
*Discriminar: no tenemos que sacar cuentas y sumarselas al total porque ya esta
*incluido}
    tFactura = record
                    nFactura:word;
                    fecha:tDateTime;			//Tipo de hora y fecha de system
                    nombre:string[50];
                    direccion:string[50];
					iva:string;					// jnvgowrhohgoh
			        condicion_venta:(contado, credito);		// 1: Contado; 2: Crédito
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
 ****taXxxxx: tipo para el campo info
}
	taArticulo = record
		codigo:word;
		descripcion:string;
		fpos:longint;
	end;
	taFactura = record
		nFactura:word;
		fpos:word;
	end;

	aArticulo = ^hArticulo;
	hArticulo = record
		info:taArticulo;
		altura:word;
		izq:aArticulo;
		der:aArticulo;
	end;

	aFactura = ^hFactura;
	hFactura = record
		info:taFactura;
		altura:word;
		izq:aFactura;
		der:aFactura;
	end;

{
 *Pila para almacenar un recorrido de un árbol.
 **sXxxxxx: pila (stack)
 **stXxxxx: tipo de pila
 **spXxxxx: puntero de pila
}
	spArticulo = ^stArticulo;
	spFactura = ^stFactura;

	stArticulo = record
		raiz:aArticulo;
		sig:spArticulo;
	end;
	stFactura = record
		raiz:aFactura;
		sig:spArticulo;
	end;

{
 *Tipos pertinentes a los archivos.
 *Nomeclatura:
 **fXxxxxx: archivo (file)
}
	fArticulo = file of tArticulo;
	
	fFactura = file of tFactura;


{
 *Tipos varios
}
	tClave = (codigo, descripcion, nFactura);

implementation
end.