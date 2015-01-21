unit ventas;
interface
uses crt, tipos, arboles, archivos, sysutils;

    procedure venta(var archivoArticulo:fArticulo;
                    var archivoFactura:fFactura;
                    var arbolArticulos_a:aArticulo;
                    var arbolArticulos_b:aArticulo;
                    var arbolFacturas:aFactura);


implementation

    procedure venta(var archivoArticulo:fArticulo;
                    var archivoFactura:fFactura;
                    var arbolArticulos_a:aArticulo;
                    var arbolArticulos_b:aArticulo;
                    var arbolFacturas:aFactura);
    var
        factura:tFactura;
        articulo:tArticulo;
        resultado:integer;
        op1:word;
        op2:string;
        nodo:aArticulo;
        ciclo:char;
        opcion, buffer:string;
        i, j:1..15;
        articuloNodo:taArticulo;
        facturaNodo:taFactura;
    begin
    
        i := 1;
        repeat
            nodo := nil;
            buffer := '';
            with factura.venta[i] do
            begin
                writeln('Elija el campo por el cual buscar:');
                writeln('1: codigo');
                writeln('2: descripcion');
                readln(opcion);
                
                if opcion = '1' then
                begin
                    write('Ingrese el codigo del articulo: ');
                    readln(op1);
                    buscarArbol(arbolArticulos_a, op1, nodo);
                end
                else if opcion = '2' then
                begin
                    write('Ingrese la descripcion del articulo: ');
                    readln(op2);
                    buscarArbol(arbolArticulos_b, op2, nodo);
                end;
                
                if (nodo <> nil) then
                begin
                    if leerDato(archivoArticulo, articulo, nodo^.info.fpos) = 1 then
                    begin
                       codigo := articulo.codigo;
                       descripcion := articulo.descripcion;
                       precio_unitario := articulo.precio_venta;
                        
                       write('Cantidad: ');
                       readln(cantidad);
                       
                       precio_fila := precio_unitario * cantidad;
                    end
                    else writeln('Error fatal.');
                    
                    writeln('Articulo: ', descripcion);
                    writeln('Codigo: ', codigo);
                    writeln('Cantidad:', cantidad);
                    writeln('Precio unitario: ', precio_unitario:3:2);
                    writeln('Precio de fila: ', precio_fila:3:2);
                    
                    writeln('Es correcto? (s/n)');
                    readln(opcion);
                    
                    if (upcase(opcion) = 'SI') or (upcase(opcion) = 'S') then
                    begin
                        i := i + 1;
                        factura.total := factura.total + precio_fila;
                    end
                    else writeln('Cancelar.');
                    
                    writeln('Desea agregar un articulo? (s/n)');
                    readln(opcion);
                    if (upcase(opcion) = 'NO') or (upcase(opcion) = 'N') then
                        ciclo := #27;
                end
                else
                begin
                    writeln('Articulo no encontrado. Vuelva a intentarlo (Esc)');
                    ciclo := readkey;
                end;
            end;
        until (ciclo = #27) OR (i = 15);
        
        if i  > 1 then
        begin
            with factura do
                begin
                writeln('Datos para facturacion.');
                
                write('Nombre: ');
                readln(nombre);
                
                write('Direccion: ');
                readln(direccion);
                
                write('IVA: ');
                readln(iva);
                
                repeat
                    writeln('Condicion de venta: (contado/credito)');
                    readln(opcion);
                    val(opcion, condicion_venta, resultado);
                    
                    if resultado <> 0 then writeln('Opcion incorrecta');
                until resultado = 0;
                    
                fecha := now();
                
                writeln('Datos de factura:');
                writeln('Nombre: ', nombre);
                writeln('Fecha: ', dateTimeToStr(fecha));
                writeln('Direccion: ', direccion);
                writeln('IVA: ', iva);
                writeln('Condicion de venta: ', condicion_venta);
                
                writeln('Articulos:');
                for j := 1 to i do
                begin
                    writeln(factura.venta[j].descripcion, '......$', factura.venta[j].precio_fila:3:2);
                end;
                
                writeln('Total: $', factura.total:3:2);
                
                writeln('Desea emitir esta factura? (s/n)');
                readln(opcion);
                    if (upcase(opcion) = 'SI') or (upcase(opcion) = 'S') then
                    begin
                        resultado := escribirDato(archivoFactura, factura);
                        if resultado = -1 then
                            writeln('Ocurrió un error')
                        else
                        begin
                            facturaNodo.nFactura := factura.nFactura;
                            facturaNodo.fpos := resultado;
                            insertarArbol(arbolFacturas, facturaNodo, codigo);
                        end;
                    end
                    else writeln('Cancelar.');
            end;
        end;
    end;

end.