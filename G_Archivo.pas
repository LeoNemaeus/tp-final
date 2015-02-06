Unit G_Archivo;

interface
uses tipos;
const
	rutaA = 'C:\Users\Giuliana\Documents\tp-final\db\articulos2.dat';
	rutaF = 'C:\Users\Giuliana\Documents\tp-final\db\facturas2.dat';

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
		 assign(arF, rutaF);
	end;

	Procedure escribirArt(var arA:ArchivoArt; var datoA:tipoArt);
	begin	
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
		{$I-}
		Reset(arF);
		{$I+}
		if IOResult=0 then
		begin
			Seek(arF,FileSize(arF));
			write(arF, datoF);
		end;
		close(arF);
	end;


	
	procedure leerArt(var arA:ArchivoArt; var datoA:tipoArt; var pos:word);
	begin
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
