{
 *Archivo: tp_final.pas
 *Creado: 06/12/2014
 *Autor: Sandro Pastorini
 *Comentario:
 ****Cuerpo principal del proyecto final de Algoritmos y Estructuras de Datos.
 ****Se realizan:
 ********Venta-Facturación
 ********Actualización de Stock
 ********Lista de precios
 ********Consulta de facturas
 ********Consulta de artículos
 ********Estadísticas de ventas
 ********Pedido de artículos faltantes por proveedor.
 *
 *Por hacer:
 **Implementar Venta-Facturación
 **Implementar Actualización de Stock
 **Implementar Lista de precios
 **Implementar Consulta de facturas
 **Implementar Consulta de artículos
 **Implementar Estadísticas de ventas
 **Implementar Pedido de artículos faltantes por proveedor.
}
program tp_final;
//uses crt, tipos, frontend, archivos, arboles, estructuras_dinamicas;
uses crt, tipos, archivos, arboles, ventas, menu;
var
    op:char;
    
    i:word;
    resultadoLeer:word;
    
    archivoArticulo:fArticulo;
    archivoFactura:fFactura;
    
    arbolArticulo_codigo:aArticulo;
    arbolArticulo_descripcion:aArticulo;
    arbolFactura:aFactura;
    
    articulo:tArticulo;
    factura:tFactura;
    
    busquedaArticulo:taArticulo;
    busquedaFactura:taFactura;
begin
    iniArchivos(archivoArticulo, archivoFactura);
    
    crearArbol(arbolArticulo_codigo);
    crearArbol(arbolArticulo_descripcion);
    crearArbol(arbolFactura);
    
    i := 0;
    
    repeat
        resultadoLeer := leerDato(archivoArticulo, articulo, i);
        
        busquedaArticulo.codigo := articulo.codigo;
        busquedaArticulo.descripcion := articulo.descripcion;
        busquedaArticulo.fpos := i;
        if(resultadoLeer = 1) then
        begin
            insertarArbol(arbolArticulo_codigo, busquedaArticulo, 'codigo');
            insertarArbol(arbolArticulo_descripcion, busquedaArticulo, 'descripcion');
        end;
        
        i := i + 1;
    until resultadoLeer <> 1;
    
    if resultadoLeer = 0 then
    begin
        writeln('Se produjo un error al leer el archivo de articulos');
        exit;
    end;
    
    i := 0;
    
    repeat
        resultadoLeer := leerDato(archivoFactura, factura, i);
        
        busquedaFactura.nFactura := factura.nFactura;
        busquedaFactura.fpos := i;
        if(resultadoLeer = 1) then
        begin
            insertarArbol(arbolFactura, busquedaFactura, codigo);
        end;
        
        i := i + 1;
    until resultadoLeer <> 1;
    
    if resultadoLeer = 0 then
    begin
        writeln('Se produjo un error al leer el archivo de facturas: ', resultadoLeer);
        exit;
    end;
    
    clrscr;
    comienzo;
    readkey;
    
    repeat
        opciones;
        readln(op);
        clrscr;
        
        case op of
            '1':begin
                venta(archivoArticulo, archivoFactura, arbolArticulo_codigo, arbolArticulo_descripcion, arbolFactura);
            end;
            
            '2': begin
            end;
            
            '3':
            begin
                listarArbol(arbolArticulo_codigo);
                listarArbol(arbolFactura);
            end;
        end;
    until op = '0';
end.
