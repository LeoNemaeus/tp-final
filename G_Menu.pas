Unit G_Menu;
interface
uses crt, G_Vector;

	Procedure comienzo;
	Procedure opciones;
	Procedure iva;
	Procedure ventas (lim: word; var R: reg);
	Procedure facturas (total: real; dia:word; mes: word; anio:word; cv: string; iv:string; nfac:word; nom: string; dir: string);
	Procedure cond_venta;
	Procedure cod;
	Procedure cod2;
	Procedure Finalizar;

implementation

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

	Procedure ventas (lim: word; var R: reg);
	var
		I: word;
	Begin
		for I := 1 to lim do
		Begin
			writeln('       ',R[I].cantidad,'x',R[I].pUnitario,'          ',R[I].pFila);
			writeln('       ',R[I].codigo,'  ',R[I].descripcion);
		end;
	End;

	Procedure facturas (total: real; dia:word; mes: word; anio:word; cv: string; iv:string; nfac:word; nom: string; dir: string);
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
		writeln('                       Nombre: ',nom);
		writeln('                       Domicilio: ',dir);
		writeln('                    ');
		writeln('                       De IVA Resp. Monot. a ', iv);
		writeln('                       Condicion venta: ', cv);
		writeln('                                                            ');
		ventas(lim, R);					{procedimiento}
		writeln('                                    ');
		writeln('                       Total:          $', total);
		writeln('                                                         ');
		writeln('                                 Gracias por su compra!');
		readkey;
	End;

	Procedure cond_venta;
	Begin
		clrscr;
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

	Procedure cod;
	Begin
		clrscr;
		writeln ('                         Buscar  por:');
		writeln ('  ');
		writeln ('  ');
		writeln ('                         1: Codigo');
		writeln ('  ');
		writeln ('                         2: Descripcion');
	end;
	
	Procedure cod2;
	Begin
		clrscr;
		writeln ('                         Listar por');
		writeln ('  ');
		writeln ('  ');
		writeln ('                          1: Codigo');
		writeln ('  ');
		writeln ('                         2: Descripcion');
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

End.