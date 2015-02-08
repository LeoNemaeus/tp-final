Unit Menu;
interface
uses crt, Vector, Tipos;

	Procedure comienzo;
	Procedure opciones;
	Procedure errorcod;
	procedure errordes;
	procedure repetir;
	procedure presVenFac;
	procedure presActSto;
	procedure presListPre;
	procedure presActPre;
	procedure presConsFac;
	procedure presConsArt;
	procedure presEstVentas;
	procedure modificarprecio;
	procedure opcionEst;
	procedure presPedArt;
	Procedure iva;
	procedure consultaArt (var aux:tipoArt);
	Procedure facturas (var aux: tipoFac);
	procedure buscarFac;
	Procedure cond_venta;
	procedure cambioStock (stock: word);
	Procedure codig;
	procedure noSuf (stock: word);
	procedure Stock (stock:word);
	procedure cierre;
	Procedure Finalizar;
	procedure consulta;

implementation

	Procedure comienzo;
	Begin
		clrscr;
		textcolor(3);
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('   |~|                                                                 |~|');
		textcolor(9);
		writeln('               _|\___________________,,__                                 ');
		writeln('              / `--|||||||||||----------------_]                          ');
		writeln('             /_==o ___________________|                                   ');
		writeln('              ),---.(_(__) /                                              ');
		writeln('             // (\) ),------                                              ');
		writeln('            //___//                                                       ');
		writeln('           /`---´/                                                        ');
		writeln('          /____ /                                                         ');
		textcolor(7);
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
		textcolor(3);
		writeln('   |~|                                                                 |~|');
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   ');
		readkey;
	End;

	Procedure opciones;
	begin
		clrscr;
		textcolor(3);
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('   |~|                                                                 |~|');
		textcolor(11);
		writeln('           SELECCIONE EL NUMERO DE LA OPCION QUE DESEE REALIZAR:          ');
		textcolor(3);
		writeln('   |~|                                                                 |~|');
		writeln('   |~|  ***************************    ***************************     |~|');
		textcolor(15);
		writeln('          1    Venta/Facturacion         2   Actualizacion Stock          ');
		textcolor(3);
		writeln('   |~|  ***************************    ***************************     |~|');
		writeln('   |~|                                                                 |~|');
		writeln('   |~|  ***************************    ***************************     |~|');
		textcolor(15);
		writeln('          3     Lista de Precios         4  Actualizacion Precios         ');
		textcolor(3);
		writeln('   |~|  ***************************    ***************************     |~|');
		writeln('   |~|                                                                 |~|');
		writeln('   |~|  ***************************    ***************************     |~|');
		textcolor(15);
		writeln('          5    Consulta Facturas         6   Consulta articulos           ');
		textcolor(3);
		writeln('   |~|  ***************************    ***************************     |~|');
		writeln('   |~|                                                                 |~|');
		writeln('   |~|  ***************************    ***************************     |~|');
		textcolor(15);
		writeln('          7    Estadisticas Venta        8   Pedido Art Faltantes         ');
		textcolor(3);
		writeln('   |~|  ***************************    ***************************     |~|');
		writeln('   |~|                                                                 |~|');
		textcolor(15);
		writeln('                              0    Finalizar                              ');
		textcolor(3);
		writeln('   |~|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|~|');
		writeln('      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   ');
	End;

	procedure consulta;
	begin
		writeln('                            Consultar Articulos por: ');
		writeln('  ');
		writeln('                                   1: Codigo');
		writeln(' ');
		writeln('                                   2: Descripcion');
		writeln(' ');
		writeln('                                   3: Proveedor');
	end;
	
	Procedure errorcod;
	begin
		clrscr;
		textcolor(12);
		writeln(' ');
		writeln('                                   ERROR');
		writeln(' ');
		writeln(' ');
		writeln('                            Codigo no encontrado!');
		textcolor(15);
		writeln(' ');
		writeln('                     Si desea buscar nuevamente precione: 1');
		writeln('                            ');
		writeln('                     De lo contrario precione: 2');
	end;
	
	procedure errordes;
	begin
		clrscr;
		textcolor(12);
		writeln(' ');
		writeln('                                   ERROR');
		writeln(' ');
		writeln(' ');
		writeln('                        Descripcion no encontrada!');
		textcolor(15);
		writeln(' ');
		writeln('                     Si desea buscar nuevamente precione: 1');
		writeln('                            ');
		writeln('                     De lo contrario precione: 2');
	end;
	
	procedure repetir;
	begin
		clrscr;
		textcolor(15);
		writeln(' ');
		writeln(' ');
		writeln('                         Por favor escriba nuevamente');
	end;
	
	procedure presVenFac;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presActSto;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('ACTUALIZACION DE STOCK  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presListPre;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('LISTADO DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presActPre;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('ACTUALIZACION DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presConsFac;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('CONSULTA DE FACTURAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presConsArt;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('CONSULTA DE ARTICULOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presEstVentas;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('ESTADISTICAS DE VENTAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presPedArt;
	begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('PEDIDO DE ARTICULOS FALTANTES  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	Procedure iva;
	Begin
		presVenFac;
		writeln('               Seleccione la condicion del comprador frente al IVA:');
		writeln(' ');
		writeln('                           1 : Responsable Inscripto');
		writeln(' ');
		writeln('                           2 : Responsable Monotributo');
		writeln(' ');
		writeln('                           3 : Consumidor Final');
	end;


	Procedure facturas (var aux: tipoFac);
	var
		I: word;
		ult: word;
		J: word;
	Begin
		clrscr;
		textcolor(7);
		writeln('                    DON JUSTO S.A.   Cuit: 30-515447847-9');
		writeln('                 12 de Abril 258-Colon-E.R. Tel 03447-422672');
		writeln(' ');
		writeln('                 Factura C - N.Fac: 0000-00', aux.numFac);
		writeln('                 Fecha: ', aux.fecha.dia,'/',aux.fecha.mes,'/',aux.fecha.anio);
		writeln('                 Nombre: ',aux.nombre,' - Domicilio: ',aux.direccion);
		writeln('                 De IVA Resp. Monot. a ', aux.iva);
		writeln('                 Condicion venta: ', aux.condVenta);
		writeln('  ');
		textcolor(15);
		J:=10;
		ult:= aux.limite;
		for I := 1 to ult do
		Begin
			if aux.venta[I].cantidad <> 0 then
			begin
				writeln('                 ',aux.venta[I].cantidad,'x',aux.venta[I].pUnitario:5:2);
				gotoxy(40,J); writeln('$',aux.venta[I].pFila:5:2);
				writeln('                 ',aux.venta[I].codigo,' - ',aux.venta[I].descri);
				writeln(' ');
				J:=J+3;
			end;
		end;
		writeln('                                    ');
		gotoxy(30,J);writeln('Total:');
		gotoxy(40,J); writeln('$', aux.total:5:2);
		textcolor(7);
		writeln('                       Gracias por su compra!');
		readkey;
	End;
	
	procedure buscarFac;
	begin
		writeln ('                          Desea buscar factura por: ');
		writeln('  ');
		writeln(' ');
		writeln('                          1 : Numero de Factura');
		writeln('  ');
		writeln('                          2 : Fecha de Facturacion');
		writeln('  ');
		writeln('                          3 : Listar todas las facturas');
	end;

	Procedure cond_venta;
	Begin
		clrscr;
		textcolor(11);
		gotoxy(30,2);
		writeln('VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('                       De que forma se abonara la compra: ');
		writeln(' ');
		writeln(' ');
		writeln('                                 1 : Credito');
		writeln(' ');
		writeln('                                 2 : Contado');
	end;

	procedure cambioStock (stock: word);
	begin
		writeln('                    El stock del producto buscado es: ', stock);
		writeln('  ');
		writeln('                                 Usted desea: ');
		writeln('  ');
		writeln('  ');
		writeln('                    1 :    Agregar stock');
		writeln('  ');
		writeln('                    2 :    Remover stock');
	end;
	
	Procedure codig;
	Begin
		writeln('                 Seleccione la opcion de busqueda del articulo: ');
		writeln('  ');
		writeln('  ');
		writeln('                       1: Busqueda por Codigo ');
		writeln('  ');
		writeln('                       2: Busqueda por Descripcion ');
	end;
	
	procedure noSuf (stock: word);
	begin
		textcolor(12);
		writeln('                      EL STOCK DEL PRODUCTO NO ES SUFICIENTE! ');
		writeln('  ');
		textcolor(15);
		writeln('                  La venta NO SE HA REALIZADO. Usted solo posee: ', stock);
		readkey;
	end;

	procedure modificarprecio;
	begin
		writeln('                              Desea modificar: ');
		writeln(' ');
		writeln('                       1 : Precio de Costo y/o porcentaje');
		writeln(' ');
		writeln('                       2 : Porcentaje de Ganancia');
	end;
	
	procedure opcionEst;
	begin
		writeln('                         Seleccione la opcion que desee:');
		writeln(' ');
		writeln('                       1 : Mes en que mas se vendio');
		writeln(' ');
		writeln('                       2 : Total recaudado en el dia de la fecha');
	end;
	
	procedure Stock (stock:word);
	begin
		writeln('                       El stock actual es: ',stock);
		writeln('  ');
		writeln('                       Actualizacion fializada con exito!');
		readkey;
	end;
	
	procedure cierre;
	begin
		writeln('                         1 : Continuar');
		writeln('  ');
		writeln('                         2 : Finalizar');
	end;
	
	procedure consultaArt (var aux:tipoArt);
	var
		po: real;
	begin
		presConsArt; //menu
		writeln('                         Codigo:----------------:',aux.codigo);
		writeln('                         Descripcion:-----------:', aux.descri);
		writeln('                         Proveedor:-------------:',aux.prove);
		writeln('                         Stock:-----------------:',aux.stock);
		writeln('                         Precio de venta:-------:',aux.pVenta:5:2);
		writeln('                         Precio de costo:-------:',aux.pCosto:5:2);
		po:=(aux.pVenta-aux.pCosto)*100;
		po:= po/aux.pCosto;
		writeln('                         Porcentaje de ganancias:',po:3:2);
		readkey;
	end;
	
	Procedure Finalizar;
	var
	I: word;
	Begin
		textbackground(0);
		I:=170;
		repeat
		clrscr;
		{ writeln('       '); }
		textcolor(15);
		textbackground(3);
		gotoxy(12,2); writeln('***'); //A
		gotoxy(19,2); writeln('****'); //R
		gotoxy(27,2); writeln('*'); //M
		gotoxy(31,2); writeln('*'); //M
		gotoxy(35,2); writeln('*****'); //E
		gotoxy(43,2); writeln('****'); //R
		gotoxy(51,2); writeln('*****'); //I
		gotoxy(60,2); writeln('***'); //A
		{ 2da fila }
		gotoxy(11,3); writeln('*'); //A
		gotoxy(15,3); writeln('*'); //A
		gotoxy(19,3); writeln('*'); //R
		gotoxy(23,3); writeln('*'); //R
		gotoxy(27,3); writeln('**'); //M
		gotoxy(30,3); writeln('**'); //M
		gotoxy(35,3); writeln('*'); //E
		gotoxy(43,3); writeln('*'); //R
		gotoxy(47,3); writeln('*'); //R
	    gotoxy(53,3); writeln('*'); //I
		gotoxy(59,3); writeln('*'); //A
		gotoxy(63,3); writeln('*'); //A
		{ 3ra fila }
		gotoxy(11,4);writeln('*****'); //A
		gotoxy(19,4); writeln('****'); //R
		gotoxy(27,4); writeln('*'); //M
		gotoxy(29,4); writeln('*'); //M
		gotoxy(31,4); writeln('*'); //M
		gotoxy(35,4); writeln('***'); //E
		gotoxy(43,4); writeln('****'); //R
		gotoxy(53,4); writeln('*'); //I
		gotoxy(59,4); writeln('*****'); //A
		{ 4ta fila }
		gotoxy(11,5); writeln('*'); //A
		gotoxy(15,5); writeln('*'); //A
		gotoxy(19,5); writeln('*');//R
		gotoxy(22,5); writeln('*'); //R
		gotoxy(27,5); writeln('*'); //M
		gotoxy(31,5); writeln('*'); //M
		gotoxy(35,5); writeln('*');//E
		gotoxy(43,5); writeln('*');//R
		gotoxy(46,5); writeln('*');//R
		gotoxy(53,5); writeln('*'); //I
		gotoxy(59,5); writeln('*'); //A
		gotoxy(63,5); writeln('*'); //A
		{ 5ta fila }
		gotoxy(11,6); writeln('*'); //A
		gotoxy(15,6); writeln('*'); //A
		gotoxy(19,6); writeln('*'); //R
		gotoxy(23,6); writeln('*'); //R
		gotoxy(27,6); writeln('*'); //M
		gotoxy(31,6); writeln('*'); //M
		gotoxy(35,6); writeln('*****');//E
		gotoxy(43,6); writeln('*');//R
		gotoxy(47,6); writeln('*');//R
		gotoxy(51,6); writeln('*****'); //I
		gotoxy(59,6); writeln('*'); //A
		gotoxy(63,6); writeln('*'); //A
		textbackground(0);
		writeln('       ');
		writeln('       ');
		writeln(' ');
		textcolor(15);
		writeln('                          ',chr(i),chr(i),chr(i),chr(i),chr(i),'     ',chr(i),chr(i),chr(i),'    ',chr(i),'   ',chr(i));
		writeln('                           ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),chr(i),'  ',chr(i));
		writeln('                           ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),' ',chr(i),' ',chr(i));
		writeln('                           ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),'  ',chr(i),chr(i));
		writeln('                          ',chr(I),chr(i),chr(i),chr(i),chr(i),'     ',chr(i),chr(i),chr(i),'    ',chr(i),'   ',chr(i));
		writeln('       ');
		writeln('       ');
		writeln('                   ',chr(i),chr(i),chr(i),chr(i),chr(i),'   ',chr(i),'   ',chr(i),'   ',chr(i),chr(i),chr(i),chr(i),chr(i),'   ',chr(i),chr(i),chr(i),chr(i),chr(i),'    ',chr(i),chr(i),chr(i));
		writeln('                     ',chr(i),'     ',chr(i),'   ',chr(i),'   ',chr(i),'         ',chr(i),'     ',chr(i),'   ',chr(i));
		writeln('                     ',chr(i),'     ',chr(i),'   ',chr(i),'   ',chr(i),chr(i),chr(i),chr(i),chr(i),'     ',chr(i),'     ',chr(i),'   ',chr(i));
		writeln('                     ',chr(i),'     ',chr(i),'   ',chr(i),'       ',chr(i),'     ',chr(i),'     ',chr(i),'   ',chr(i));
		writeln('                   ',chr(i),chr(i),chr(i),'     ',chr(i),chr(i),chr(i),chr(i),chr(i),'   ',chr(i),chr(i),chr(i),chr(i),chr(i),'     ',chr(i),'      ',chr(i),chr(i),chr(i));
		inc(I);
		delay(300);
		until I=180;
	end;

End.