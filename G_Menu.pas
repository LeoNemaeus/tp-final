Unit G_Menu;
interface
uses crt, G_Vector, tipos;

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
	{Procedure ventas (var vtas: Venta);}
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
		writeln('          3     Lista de Precios         4  Actualizacion Precios         ');
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
		textcolor(red);
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
		textcolor(red);
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
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presActSto;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                             ACTUALIZACION DE STOCK  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presListPre;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                               LISTADO DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presActPre;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                            ACTUALIZACION DE PRECIOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;

	procedure presConsFac;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              CONSULTA DE FACTURAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presConsArt;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              CONSULTA DE ARTICULOS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presEstVentas;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                              ESTADISTICAS DE VENTAS  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	procedure presPedArt;
	begin
		clrscr;
		textcolor(2);
		writeln('  ');
		writeln('                       PEDIDO DE ARTICULOS FALTANTES  ');
		textcolor(15);
		writeln('  ');
		writeln('  ');
	end;
	
	Procedure iva;
	Begin
		presVenFac;
		writeln('               SELECCIONE LA CONDICION DEL COMPRADOR FRENTE AL IVA: ');
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
	Begin
		clrscr;
		textcolor(15);
		writeln('                    DON JUSTO S.A.   Cuit: 30-515447847-9');
		writeln('                 12 de Abril 258-Colon-E.R. Tel 03447-422672');
		writeln(' ');
		writeln('                 Factura C - N.Fac: 0000-00', aux.numFac);
		writeln('                 Fecha: ', aux.fecha.dia,'/',aux.fecha.mes,'/',aux.fecha.anio);
		writeln('                 Nombre: ',aux.nombre,' - Domicilio: ',aux.direccion);
		writeln('                 De IVA Resp. Monot. a ', aux.iva);
		writeln('                 Condicion venta: ', aux.condVenta);
		writeln('  ');
		ult:= aux.limite;
		for I := 1 to ult do
		Begin
			if aux.venta[I].cantidad <> 0 then
			begin
				writeln('                 ',aux.venta[I].cantidad,'x',aux.venta[I].pUnitario:5:2,'    ',aux.venta[I].pFila:5:2);
				writeln('                 ',aux.venta[I].codigo,'  ',aux.venta[I].descri);
				writeln(' ');
			end;
		end;
		writeln('                                    ');
		writeln('                 Total:          $', aux.total:5:2);
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
		textcolor(2);
		writeln('  ');
		writeln('                              VENTA Y FACTURACION  ');
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
		writeln('                      EL STOCK DEL PRODUCTO NO ES SUFICIENTE! ');
		writeln('  ');
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
