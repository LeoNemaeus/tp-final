{
 *Archivo: tipos.pas
}
unit Tipos;
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


    tipoFac = record
                    numFac:word;
                    fecha:tipoFecha;
                    nombre:string[50];
                    direccion:string[50];
					iva:string;					
			        condVenta:string;
                    venta:Venta;
                    total:real;
					limite: word;
                end;

{
 *Tipos referentes a arboles binarios AVL
 **C : codigo
 **D : descripcion
}
		ArtC = Record
		codigo: word;
		pos:word;
		end;
	arbolArtC= ^hojaC;
	hojaC = Record
		info: ArtC;
		izq: arbolArtC;
		der: arbolArtC;
		bal: Shortint;
		end;	
		
	ArtD = Record
		descri: string;
		pos:word;
		end;
	arbolArtD= ^hojaD;
	hojaD = Record
		info: ArtD;
		izq: arbolArtD;
		der: arbolArtD;
		bal: Shortint;
		end;

{
 *Tipos pertinentes a los archivos.
 *Nomeclatura:
}
	ArchivoArt = file of tipoArt;
	
	ArchivoFac = file of tipoFac;

implementation
end.
