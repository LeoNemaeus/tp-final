program util;
uses crt, tipos, archivos, arboles;

function insertarArticulo(var f:fArticulo; var articulo:tArticulo):integer;
begin
    
    readln();
    
    insertarArticulo := escribirDato(f, articulo);
end;

function insertarFactura(var f:fFactura; var factura:tFactura):integer;
begin
    
    insertarFactura := escribirDato(f, factura);
end;

var
    op:char;
    redraw:boolean;
    salir:boolean;
    i:1..15;
    j:word;
    
    f:fArticulo;
    ff:fFactura;
    
    articulo:tArticulo;
    factura:tFactura;
begin
    
    iniArchivos(f,ff);
    
    repeat
        
    clrscr;
    
    writeln('Bienvenido al programa de utilidad del proyecto final de AYED');
    writeln('Por favor seleccione una opción para continuar:');
    writeln('');
    writeln('1: Borrar bases de datos');
    writeln('2: Insertar articulo en la base de datos');
    writeln('3: Insertar factura en la base de datos');
    writeln('4: Listar articulos');
    writeln('5:Listar facturas');
    writeln('0: Salir');
    
    redraw := false;
    
        repeat
            
            readln(op);
            
            case op of
                '1':
                begin
                    writeln('Esta por borrar los archivos de base de datos. ¿Esta seguro? (s/N)');
                    if readkey = 's' then
                    begin
                        writeln('Borrando archivos...');
                        erase(f);
                        rewrite(f);
                        erase(ff);
                        rewrite(ff);
                        write('Exito!');
                    end
                    else
                    begin
                        writeln('(si/No)');
                        readkey;
                        redraw := true;
                    end;
                end;
                
                '2':
                begin
                    clrscr;
                    
                    with articulo do
                    begin
                        write('Codigo: ');
                        readln(codigo);
                        
                        write('Descripcion: ');
                        readln(descripcion);
                        
                        write('Proveedor: ');
                        readln(proveedor);
                        
                        write('Stock: ');
                        readln(stock);
                        
                        write('Stock minimo: ');
                        readln(stock_minimo);
                        
                        write('Precio de venta: ');
                        readln(precio_venta);
                        
                        write('Costo: ');
                        readln(precio_costo);
                    end;
                    
                    if insertarArticulo(f, articulo) = -1 then
                    begin
                        writeln('Error escribiendo articulo al archivo.');
                        redraw := true;
                        op := '0';
                    end
                    else
                    begin
                        writeln('Operacion exitosa. Presione una tecla para volver.');
                        readkey;
                        redraw := true;
                    end;
                end;
                
                '3':
                begin
                    i := 1;
                    salir :=  false;
                    while (salir = false) and (i <= 15) do
                    begin
                        writeln('Articulo a facturar: ');
                        with factura.venta[i] do
                        begin
                            write('Codigo: ');
                            readln(codigo);
                            
                            write('Descripcion: ');
                            readln(descripcion);
                            
                            write('Precio unitario: ');
                            readln(precio_unitario);
                            
                            write('Precio de fila: ');
                            readln(precio_fila);
                            
                            write('Continuar? (s/n)');
                            if readkey = 'n' then
                                salir := true;
                        end;
                    end;
                    
                    with factura do
                    begin
                        write('Nombre: ');
                        readln(nombre);
                        
                        write('Direccion: ');
                        readln(direccion);
                        
                        write('IVA: ');
                        readln(iva);
                        
                        write('Total: ');
                        readln(total);
                    end;
                    
                    if insertarFactura(ff, factura) = -1 then
                        writeln('Error escribiendo factura');
                end;
                
                '4':
                begin
                    j := 0;
                    salir := false;
                    while salir = false do
                    begin
                        if leerDato(f, articulo, j) in [0, 2] then
                            salir := true
                        else
                        begin
                            writeln('Codigo: ', articulo.codigo);
                            writeln('Descripcion: ', articulo.descripcion);
                            writeln('Precio de venta: ', articulo.precio_venta:3:2);
                            writeln('-------------------------------------------');
                            j := j + 1;
                        end;
                    end;
                end;
                
                '5':
                begin
                    j := 0;
                    salir := false;
                    while salir = false do
                    begin
                        if leerDato(ff, factura, j) in [0, 2] then
                            salir := true
                        else
                        begin
                            writeln('nFactura: ', factura.nFactura);
                            writeln('Nombre: ', factura.nombre);
                            writeln('Direccion: ', factura.direccion);
                            i := 1;
                            while (factura.venta[i].codigo <> 0) and (i <= 15) do
                            begin
                                if i > 1 then writeln('');
                                writeln('   Codigo de articulo: ', factura.venta[i].codigo);
                                writeln('   Descripcion de articulo: ', factura.venta[i].descripcion);
                                writeln('   Precio de articulo: ', factura.venta[i].precio_fila:3:2);
                                i := i + 1;
                            end;
                            writeln('Total: ', factura.total:3:2);
                            writeln('-------------------------------------------');
                            j := j + 1;
                        end;
                    end;
                end;
                
                '0':
                begin
                    redraw := true;
                end;
                
                else
                begin
                    writeln('Opcion incorrecta. Vuelva a intentar');
                end;
            end;
        until redraw;
    until op = '0';
    
end.