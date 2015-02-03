Unit G_Vector;
interface
uses crt;
type
	tipoReg = Record
				codigo:word;
				cantidad:word;	
				descri: string[40]; {string[40];}
				pUnitario:real;
				pFila:real;
			end;
	
	reg = Array [1..15] of tipoReg;
	
var
	R: reg;
	x: tipoReg;
	lim: word;

	Procedure borrarReg (var R: reg);
	Procedure cargarReg (var R: reg; x: tipoReg; lim: word);
	
implementation

	Procedure borrarReg ( var R: reg);
	var
		I: word;
	begin
		lim:= 0;
		for I := 1 to 15 do
		Begin
			R[I].codigo:= 0;
			R[I].cantidad:= 0;
			R[I].descri := '';
			R[I].pUnitario := 0;
			R[I].pFila:= 0;
		end;
	end;
	
	Procedure cargarReg (var R: reg; x: tipoReg; lim: word);
	begin
		inc(lim);
		if lim < 15 then
		Begin
			R[lim].codigo:= x.codigo;
			R[lim].descri:= x.descri;
			R[lim].cantidad:= x.cantidad;
			R[lim].pUnitario := x.pUnitario;
			R[lim].pFila:=x.pFila;
		end
		else
		Begin
			textcolor(15);
			writeln ('La factura no admite mas productos');
			readkey;
			clrscr
		end
	end;
end.
