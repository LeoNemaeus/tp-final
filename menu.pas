Unit menu;
interface

	Procedure comienzo;
	Procedure opciones;
	Procedure iva;
	Procedure Finalizar;
	//Procedure verif_cod (aux: paArticulo);
	//Procedure ventas (lim: word, var v:t_vector);
	//Procedure facturas (total: real, dia:word, mes: word, anio:word, cv: string, iv:string, nfac:word);
	Procedure cond_venta;

implementation
uses crt;

Procedure comienzo;
	Begin
	clrscr;
	textcolor(2);
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('   |~|                                                                 |~|');
	textcolor(14);
	writeln('               _|\___________________,,__                                 ');
	writeln('              / `--|||||||||||----------------_]                          ');
	writeln('             /_==o ___________________|                                   ');
	writeln('              ),---.(_(__) /                                              ');
	writeln('             // (\) ),------                                              ');
	writeln('            //___//                                                       ');
	writeln('           /`---´/                                                        ');
	writeln('          /____ /                                                         ');
	textcolor(10);
	writeln('                                    Armeria                               ');
	writeln('                                DON JUSTO S.A.                            ');
	writeln('                                                                          ');
	writeln('                     12 de Abril 258 - Colon - Entre Rios                 ');
	writeln('                                                                          ');
	writeln('                                Tel: 03447-422672                         ');
	writeln('                                                                          ');
	writeln('                           www.armeriadonjusto.com.ar                     ');
	writeln('                        www.facebook.com/armeriadonjusto                  ');
	writeln('                                                                          ');
	textcolor(2);
	writeln('   |~|                                                                 |~|');
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   ');
	readkey;
End;

Procedure opciones;
begin
	clrscr;
	textcolor(2);
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('   |~|                                                                 |~|');
	textcolor(10);
	writeln('           SELECCIONE EL NUMERO DE LA OPCION QUE DESEE REALIZAR:          ');
	textcolor(2);
	writeln('   |~|                                                                 |~|');
	writeln('   |~|  ***************************    ***************************     |~|');
	textcolor(14);
	writeln('          1    Venta/Facturacion         2   Actualizacion Stock          ');
	textcolor(2);
	writeln('   |~|  ***************************    ***************************     |~|');
	writeln('   |~|                                                                 |~|');
	writeln('   |~|  ***************************    ***************************     |~|');
	textcolor(14);
	writeln('         3     Lista de Precios         4  Actualizacion Precios         ');
	textcolor(2);
	writeln('   |~|  ***************************    ***************************     |~|');
	writeln('   |~|                                                                 |~|');
	writeln('   |~|  ***************************    ***************************     |~|');
	textcolor(14);
	writeln('          5    Consulta Facturas         6   Consulta articulos           ');
	textcolor(2);
	writeln('   |~|  ***************************    ***************************     |~|');
	writeln('   |~|                                                                 |~|');
	writeln('   |~|  ***************************    ***************************     |~|');
	textcolor(14);
	writeln('          7    Estadisticas Venta        8   Pedido Art Faltantes         ');
	textcolor(2);
	writeln('   |~|  ***************************    ***************************     |~|');
	writeln('   |~|                                                                 |~|');
	textcolor(14);
	writeln('                              0    Finalizar                              ');
	textcolor(2);
	writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
	writeln('      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   ');
End;

Procedure iva;
	Begin
		clrscr;
		textcolor(15);
		writeln(' ');
		writeln('          SELECCIONE LA CONDICION DEL COMPRADOR FRENTE AL IVA: ');
		writeln(' ');
		writeln(' ');
		writeln(' ');
		writeln('                       1  Responsable Inscripto');
		writeln(' ');
		writeln(' ');
		writeln('                       2  Responsable Monotributo');
		writeln(' ');
		writeln(' ');
		writeln('                       3  Consumidor Final');
	end;

Procedure cond_venta;
	Begin
		clrscr;
		textcolor(15);
		writeln(' ');
		writeln('             SELECCIONE LA CONDICION DE COMPRA: ');
		writeln(' ');
		writeln(' ');
		writeln(' ');
		writeln('                       1  Contado');
		writeln(' ');
		writeln(' ');
		writeln('                       2  Credito');
	end;
	
Procedure Finalizar;
	Begin
		clrscr;
		writeln('       ');
		textcolor(15);
		writeln('           ***    ****    *   *   *****   ****    *****    ***');
		writeln('          *   *   *   *   ** **   *       *   *     *     *   *');
		writeln('          *****   ****    * * *   ***     ****      *     *****');
		writeln('          *   *   *  *    *   *   *       *  *      *     *   *');
		writeln('          *   *   *   *   *   *   *****   *   *   *****   *   *');
		writeln('       ');
		writeln('       ');
		writeln('       ');
		textcolor(14);
		writeln('                          +++++     +++    +   +');
		writeln('                           +   +   +   +   ++  +');
		writeln('                           +   +   +   +   + + +');
		writeln('                           +   +   +   +   +  ++');
		writeln('                          +++++     +++    +   +');
		writeln('       ');
		writeln('       ');
		writeln('                   +++++   +   +   +++++   +++++    +++');
		writeln('                     +     +   +   +         +     +   +');
		writeln('                     +     +   +   +++++     +     +   +');
		writeln('                     +     +   +       +     +     +   +');
		writeln('                   +++     +++++   +++++     +      +++');
		readkey;
	end;

{
Procedure verif_cod (aux: paArticulo);
Begin
	writeln('El codigo ingresado corresponde a: ');
	witeln('                 ', aux^.info.descripcion);
	writeln('¿Es correcto?: (s/n)');
End;
}
{
Procedure facturas (total: real; dia:word, mes: word, anio:word, cv: string, iv:string, nfac:word);
Begin
	clrscr;
	textcolor(8);
	writeln('   ');
	writeln('                                  DON JUSTO S.A. ');
	writeln('                               Cuit: 30-515447847-9');
	writeln('                       12 de Abril 258 - Colon - Entre Rios             ');
	writeln('                                 Tel: 03447-422672    ');
	writeln('             ');
	writeln('                       Factura C                 ');
	writeln('                       N.Fac: ', nfac);
	writeln('                       Fecha: ', dia,'/',mes,'/',anio);
	writeln('                                                                   ');
	writeln('                       De IVA Resp. Monot. a ', iv);
	writeln('                       Condicion venta: ', cv);
	writeln('                                                            ');
	ventas(lim, v);					{procedimiento}
	writeln('                                    ');
	writeln('                       Total:          $', total);
	writeln('                                                         ');
	writeln('                                 Gracias por su compra!');
	readkey;
End;
}
{
Procedure ventas (lim: word, var v:t_vector);
var
	I: word;
Begin
	for I := 1 to lim do
	Begin
		wirteln('       ',v[I].cantidad,'x',v[I].precio_unitario,'          ',v[I].precio_fila);
		writeln('       ',v[I].codigo,'  ',v[I].descripcion);
	end;
End;
}



	
End.
