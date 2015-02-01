Unit G_Archivo;

interface

const
	rutaA = 'D:\Art.dat';
	rutaF = 'D:\Fac.dat';
Type
	   tipoArt = record
                    codigo:word;
                    descri:word;	{string[40];}
                    prove:word;	{string[20];}
                    stock:word;
                    stockMin:byte;
                    pVenta:real;
                    pCosto:real;
                end;

    Venta = array[1..15] of record
                                codigo:word;
                                cantidad:word;	
                                descri:word;	{string[40];}
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
	Procedure posicion(var arA:ArchivoArt; var pos: word);
	Procedure posicionf(var arF:ArchivoFac; var pos: word);
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
		 if Ioresult=0 then
		 begin
			 rewrite(arA);
			 reset(arA);
			 close(arA);
		 end;
		 assign(arF, rutaF);
		 {$I-}
		 reset(arF);
		 {$I+}
		 if Ioresult =0 then
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
	
	Procedure posicion(var arA:ArchivoArt; var pos: word);
	begin	
		assign(arA, rutaA);
		{$I-}
		reset(arA);
		{$I+}
		if ioResult = 0 then
		begin
			pos:= FileSize(arA);
		end;
		close(arA);
	end;

	Procedure posicionf(var arF:ArchivoFac; var pos: word);
	begin	
		assign(arF, rutaF);
		{$I-}
		reset(arF);
		{$I+}
		if ioResult = 0 then
		begin
			pos:= FileSize(arF);
		end;
		close(arF);
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
		Reset(arF);
		{$I+}
		if IOResult=0 then
		begin
			Seek(arF,FileSize(arF));
			datoF.numFac:=filesize(arF);
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
