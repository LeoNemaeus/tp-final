Unit G_Archivo;

interface

const 
	rutaA = 'D:/TPArt';
	rutaF = 'D:/TPFac';
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
			        condVenta:string[8];		// 1: Contado; 2: Crédito
                    venta:Venta;
                    total:real;
                end;
	
	ArchivoArt = file of tipoArt;
	
	ArchivoFac = file of tipoFac;
	
	procedure crear (var arA:ArchivoArt; var arF: ArchivoFac);
	Procedure escribirArt(var arA:ArchivoArt; var datoA:tipoArt);
	Procedure escribirFac(var arF:ArchivoFac; var datoF:tipoFac);
	procedure leerArt(var arA:ArchivoArt; var datoA:tipoArt; var pos:word);
	procedure leerFac(var arF:ArchivoFac; var datoF:tipoFac; var pos:word);
	Procedure ReEscArt(var arA:ArchivoArt; var datoA:tipoArt; pos: word);


implementation
	
	procedure crear (var arA:ArchivoArt; var arF: ArchivoFac);
	begin
		 assign(arA,rutaA);
		 {$I-}
		 reset(arA);
		 {$I+}
		 if Ioresult<>0 then
		 begin
			 rewrite(arA);
			 reset(arA);
			 close(arA);
		 end;
		 assign(arF, rutaF);
		 {$I-}
		 reset(arF);
		 {$I+}
		 if Ioresult <>0 then
		 begin
			rewrite(arF);
			reset(arF);
			close(arF);
		 end;
	end;

	Procedure escribirArt(var arA:ArchivoArt; var datoA:tipoArt);
	begin	
		assign(arA, rutaA);
		{$I-}
		reset(arA);
		{$I+}
		if ioResult = 0 then
		begin
			Seek (arA, FileSize(arA));
			write(arA, datoA);
		end;
		close(arA);
	end;
	
	Procedure ReEscArt(var arA:ArchivoArt; var datoA:tipoArt; pos: word);
	begin	
		assign(arA, rutaA);
		{$I-}
		reset(arA);
		{$I+}
		if ioResult = 0 then
		begin
			Seek (arA, pos);
			write(arA, datoA);
		end;
		close(arA);
	end;

	Procedure escribirFac(var arF:ArchivoFac; var datoF:tipoFac);
	begin
		assign(arF, rutaF);
		{$I-}
		reset(arF);
		{$I+}
		if ioResult = 0 then
		begin
			Seek (arF, FileSize(arF));
			write(arF, datoF);
		end;
		close(arF);
	end;


	
	procedure leerArt(var arA:ArchivoArt; var datoA:tipoArt; var pos:word);
	begin
		assign(arA, rutaA);
		{$I-}
		reset(arA); 
		{$I+}
		if ioResult = 0 then
		begin
			seek(arA, pos);                   
			if not eof(arA) then
			begin
				read(arA, datoA);
			end;
		end;
		close(arA);                   
	end;
	

	procedure leerFac(var arF:ArchivoFac; var datoF:tipoFac; var pos:word);
	begin
		assign(arF, rutaF);
		{$I-}
		reset(arF); 
		{$I+}
		if ioResult = 0 then
		begin
			seek(arF, pos);                   
			if not eof(arF) then
			begin
				read(arF, datoF);
			end;
		end;
		close(arF);                   
	end;
End.