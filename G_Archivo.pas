Unit G_Archivo;

interface

const 
	rutaA = 'C:/TPArt';
	rutaF = 'C:/TPFac';
Type
	   tipoArt = record
                    codigo:word;
                    descripcion:string[140];
                    proveedor:string[90];
                    stock:word;
                    stockMin:byte;
                    pVenta:real;
                    pCosto:real;
                end;
 
    Venta = array[1..15] of record
                                codigo:word;
                                cantidad:word;	
                                descripcion:string[90];
                                pUnitario:real;
                                pFila:real;
                            end;

    tipoFac = record
                    numFac:word;
                    fecha:tDateTime;			//Tipo de hora y fecha de system
                    nombre:string[50];
                    direccion:string[50];
					iva:string;				
			        condVenta:string[8];		// 1: Contado; 2: Crédito
                    venta:Venta;
                    total:real;
                end;

	ArchivoArt = file of tipoArt;
	
	ArchivoFac = file of tipoFac;
	
	procedure crear (var arA:ArchivoArt; var arF: ArchivoFac);
	Procedure escribirArt(var arA:ArchivoArt; var datoA:tipoArt);
	Procedure escribirFac(var arF:ArchivoFac; var datoF:tipoFac);
	procedure leerArt(var arA:ArchivoArt; var datoA:tipoArt; pos:word);
	procedure leerFac(var arF:ArchivoFac; var datoF:tipoFac; pos:word);


implementation
	
	procedure crear (var arA:ArchivoArt; var arF: ArchivoFac);
	begin
		 assign(arA,rutaA);
		 assign (arF, rutaF);
		 {$I-}
		 reset(arA);
		 reset(arF);
		 {$I+}
		 if Ioresult<>0 then
		 begin
		 rewrite(arA);
		 close(arA);
		 rewrite(arF);
		 close(arF);
		 end;
	end;

	Procedure escribirArt(var arA:ArchivoArt; var datoA:tipoArt);
	var
		pos:word;
	begin
		reset(arA);    
		pos := fileSize(arA);
		seek(arA, pos);
		write(arA, datoA);
		close(arA);
	end;

	Procedure escribirFac(var arF:ArchivoFac; var datoF:tipoFac);
	var
		pos:word;
	begin
		reset(arF);    
		pos := fileSize(arF);
		seek(arF, pos);
		write(arF, datoF);
		close(arF);
	end;

	procedure leerArt(var arA:ArchivoArt; var datoA:tipoArt; pos:word);
	begin
		reset(arA);                        
		seek(arA, pos);                   
		if eof(arA) then
			writeln('Error en la posicion');
		read(arA, datoA);                    
		close(arA);                   
	end;

	procedure leerFac(var arF:ArchivoFac; var datoF:tipoFac; pos:word);
	begin
		reset(arF);                        
		seek(arF, pos);                   
		if eof(arF) then
			writeln('Error en la posicion');
		read(arF, datoF);                    
		close(arF);                   
	end;

End.