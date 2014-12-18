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
uses tipos, archivos, arboles;
var
    op:char;
begin
    repeat
        read(op);
        
        case op of
            '1':begin
            end;
            
            '2': begin
            end;
        end;
    until op = '0';
end.
