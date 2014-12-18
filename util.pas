program util;
uses crt, tipos, archivos, arboles;

function insertarArticulo(var f:fArticulo; var ff:fFactura; var articulo:tArticulo):integer;
begin
    iniArchivos(f,ff);
    
    readln();
    
    insertarArticulo := escribirDato(f, articulo);
end;


var
    op:char;
    redraw:boolean;
    
    f:fArticulo;
    ff:fFactura;
    
    articulo:tArticulo;
begin
    
    iniArchivos(f,ff);
    
    repeat
        
    clrscr;
    
    writeln('Bienvenido al programa de utilidad del proyecto final de AYED');
    writeln('Por favor seleccione una opción para continuar:');
    writeln('');
    writeln('1: Borrar bases de datos');
    writeln('2: Insertar articulos en la base de datos');
   // writeln('3: Actualizar rutas de las bases de datos');
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
                        rewrite(f);
                        rewrite(ff);
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
                    
                    if insertarArticulo(f, ff, articulo) = -1 then
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
                
    //            '3':
    //            begin
    //            end;
                
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