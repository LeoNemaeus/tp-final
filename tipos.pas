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
    tipoArt = record
                    codigo:word;
                    descri:string;
                    prove:string[90];
                    stock:word;
                    stockMin:byte;
                    pVenta:real;
                    pCosto:real;
                end;
 
{
 *Representa el detalle de las ventas de una factura.
}
    Venta = array[1..15] of record
                                codigo:word;
                                cantidad:word;
                                descri:string[90];
                                pUnitario:real;
                                pFila:real;
                            end;

{
 *Representa una factura.
}

tipoFecha = record
          dia: word;
          mes: word;
          anio: word;
end;

{Hay que poner que tipos de iva:
			-Responsable inscripto
			-Responsable monotributo
			-Consumidor final
En la factura C hay que poner el tipo de iva, simpre es 21% pero ya esta
agregado en el total no se discrimina*
*Discriminar: no tenemos que sacar cuentas y sumarselas al total porque ya esta
*incluido}
    tipoFac = record
                    numFac:word;
                    fecha:tipoFecha;			//Tipo de hora y fecha de system
                    nombre:string[50];
                    direccion:string[50];
					iva:string;					// jnvgowrhohgoh
			        condVenta:string;
                    venta:Venta;
                    total:real;
					limite: word;
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
					info:tipoArt;
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
	ArchivoArt = file of tipoArt;
	
	ArchivoFac = file of tipoFac;


{
 *Tipos varios
}
	tClave = (codigo, descripcion, nFactura);

implementation
end.
