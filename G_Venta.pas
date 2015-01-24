unit G_Venta;
interface
uses G_Menu, G_Archivo, G_Arbol, crt, G_Vector;

var
	arA:ArchivoArt;
	arF: ArchivoFac;
	
	Procedure datosFac (var datoF: tipoFac; nfac: word; lim: word; R: reg; nom: string; dir: string; iv: string; cv:string; total: real);	Procedure venta (var totlinea: real; var total:real; cant: word; aux: tipoArt);
	Procedure iva_comp (var iv: string);
	Procedure Cventa (var cv: string);
	Procedure Cantidades (var cant: word; var arA: ArchivoArt; nodo: Art; var aux:tipoArt);
	Procedure Nosuf (aux: tipoArt);
	Procedure VerifCod (nodo: Art);
	Procedure VerifDes (nodo: Art);
	Procedure Facturacion (iv: string; nom: string; dir: string; cv: string; var arF:ArchivoFac);
	Procedure VentaCod (A: arbolArt; nodo: Art; aux:tipoArt; var cant: word; var totlinea: real; var total: real);
	Procedure VentaDes (B: arbolArt; nodo: Art; var cant: word;  var totlinea: real; var total: real; aux: tipoArt);


implementation			

	Procedure datosFac (var datoF: tipoFac; nfac: word; lim: word; R: reg; nom: string; dir: string; iv: string; cv:string; total: real);
	var
		I: word;
	Begin
		datoF.numFac:= nfac;
		{datoF.fecha:= GetDate(anio, mes, dia);}
		datoF.nombre:= nom;
		datoF.direccion:= dir;
		datoF.iva:= iv;
		datoF.condVenta:= cv;
		datoF.total:= total;
		for I:= 1 to lim do
		begin
			   datoF.venta[I].codigo:= R[I].codigo;
			   datoF.venta[I].descripcion:= R[I].descripcion;
			   datoF.venta[I].cantidad:= R[I].cantidad;
			   datoF.venta[I].pUnitario:= R[I].pUnitario;
			   datoF.venta[I].pFila:= R[I].pFila;
		end;
	End;
		
	Procedure venta (var totlinea: real; var total:real; cant: word; aux: tipoArt);
	var
		x:tipoReg;
	Begin
		totlinea:= cant * aux.pVenta;
		total := total + totlinea;
		x.codigo:= aux.codigo;
		x.cantidad:= cant;
		x.descripcion := aux.descripcion;
		x.pUnitario := aux.pVenta;
		x.pFila:= totlinea;
		cargarReg (R, x, lim);
	end;

	Procedure iva_comp (var iv: string);
	var ivaa:byte;
	Begin
		repeat
			iva;
			read(ivaa);
		until ivaa in [1..3];
		if ivaa=1 then iv:= 'Resp. Insc.'
		else
		Begin
			if ivaa=2 then iv:= 'Resp. Monot.'
			else iv:='Cons. Final';
		end;
	End;

	Procedure Cventa (var cv: string);
	var ccvv:byte;
	Begin
		repeat
			cond_venta;
			read(ccvv);
		until ccvv in [1..2];
		if ccvv=1 then cv:= 'Contado'
		else cv:= 'Credito'
	End;

	Procedure VentaCod (A: arbolArt; nodo: Art; aux:tipoArt; var cant: word; var totlinea: real; var total: real);
	var
		res: string[3];
		cod: word;
	Begin
		Writeln('Ingrese el codigo');
		read(cod);
		buscarCodigo (A, cod, nodo);
		totlinea := 0;
		VerifCod (nodo);
		read(res);
		if (res = 's') or (res= 'si') then
		Begin
			Cantidades (cant, arA, nodo, aux);		
			if cant >= aux.stock then
			begin
				venta (totlinea, total, cant, aux);
				aux.stock:= aux.stock - cant;
				seek(arA, nodo.pos);
				write(arA, aux);
				close(arA)
			end
			else
			Begin
				Nosuf (aux);	
				close(arA);
			End
		end					
	end;
	
	Procedure VerifCod (nodo: Art);
	Begin
		textcolor(15);
		writeln('El codigo ingresado corresponde a: ');
		writeln('                 ', nodo.descripcion);
		writeln('¿Es correcto?: (s/n)');
	end;
	
	Procedure Cantidades (var cant: word; var arA: ArchivoArt; nodo: Art; var aux:tipoArt);
	Begin
		textcolor(15);
		writeln('Ingrese cantidad de unidades: ');
		read(cant);
		clrscr;
		reset(arA);
		seek (arA, nodo.pos);
		read(arA, aux);
	End;
	
	Procedure Nosuf (aux: tipoArt);
	Begin
		textcolor(15);
		writeln ('El stock no es sufuciente');
		writeln('Usted solo posee ',aux.stock,' unidades.');
		readkey;
		clrscr;
	end;
	
	Procedure VerifDes (nodo: Art);
	Begin
		textcolor(15);
		writeln('La descripcion ingresada corresponde a: ');
		writeln('                 ', nodo.codigo);
		writeln('¿Es correcto?: (s/n)');
	end;	
	
	Procedure VentaDes (B: arbolArt; nodo: Art; var cant: word;  var totlinea: real; var total: real; aux: tipoArt);
	var
		res: string[3];
		des: string;
	Begin
		read(des);
		buscarDesc (B, des, nodo);
		totlinea := 0;
		VerifDes (nodo);
		read(res);
		clrscr;
		if (res = 's') or (res= 'si') then
		Begin			
			Cantidades (cant, arA, nodo, aux);
			if cant >= aux.stock then
			begin
				venta (totlinea, total, cant, aux);
				aux.stock:= aux.stock - cant;
				seek(arA, nodo.pos);
				write(arA, aux);
				close(arA)
			end
			else
			Begin
				Nosuf (aux);	
				close(arA);
			End
		end					
	end;

	Procedure Facturacion (iv: string; nom: string; dir: string; cv: string; var arF:ArchivoFac);
	Begin
		iva_comp (iv);
		textcolor(15);
		writeln ('Ingrese nombre del comprador');
		read(nom);
		clrscr;
		textcolor(15);
		writeln ('Ingrese direccion del comprador');
		read(dir);
		clrscr;
		{GetDate(anio, mes, dia); {para obtener la fecha desde Dos}
		Cventa(cv);
		reset(arF);
		nfac:= (filepos(arF)+1);
		close(arF);

	end;

	///// Esto de abajo va en el cuerpo principal
				{Begin
					total:= 0;
					lim := 0;
					borrarReg (R);
					Repeat
						cod;  
						read(op);					
						case op of
							1: VentaCod (A, nodo, aux, cant, totlinea, total);
							2: VentaDes (B, nodo, cant, totlinea, total, aux);
						writeln('¿Desea agregar otro producto?: (s/n) ');		
						read(res);
						clrscr;
					until (res = 'n') or (res= 'no');
							
					Facturacion (iv; nom; dir; cv; arF);		
					facturas (total, dia, mes, anio, cv, iv, nfac, nom, dir);	
					datosFac (datoF, nfac, lim, R, nom, dir, iv, cv, total);
					escribirFac(arF, datoF);
		end.}
	
end.