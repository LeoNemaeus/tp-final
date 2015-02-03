{
 *Archivo: archivos.pas
 *Creado: 06/12/2014
 *Autor: Sandro Pastorini
 *Comentario:
 **** Se encarga de todo el manejo de archivos.
 **** Define funciones que abstraen las funciones y requerimientos del pascal,
 **** automatizando controles y tareas de mantenimiento sobre los archivos.
}
unit archivos;

interface
uses tipos;

    procedure iniArchivos(var archivoArticulos:fArticulo;
                      var archivoFacturas:fFactura);

    function escribirDato(var f:fFactura; var dato:tFactura):longint;
    function escribirDato(var f:fArticulo; var dato:tArticulo):longint;
    function leerDato(var f:fArticulo; var dato:tArticulo; pos:word):byte;
    function leerDato(var f:fFactura; var dato:tFactura; pos:word):byte;

implementation
{
 *leer la configuracion
 *inicializar archivos
 *escribir dato
 *buscar dato
}

var
    urlArticulos, urlFacturas:string; //direccion a los archivos.


function leerConfig(url:string):boolean;
var
    confArchivo:TextFile;
begin
    {$i-}                            //Desactiva el manejo automático de errores.
    assign(confArchivo, url);
    
    reset(confArchivo);
    if(IOresult <> 0) then exit(false);
    
    readln(confArchivo, urlArticulos);
    readln(confArchivo, urlFacturas);
    if(IOresult <> 0) then exit(false);
    
    close(confArchivo);

    {I+}                            //Reactiva el manejo automático de errores.
    exit(true);
end;

procedure iniArchivos(var archivoArticulos:fArticulo;
                      var archivoFacturas:fFactura);
begin
    //if archivoArticulos then
        assign(archivoArticulos, urlArticulos);
    //if archivoFacturas then
        assign(archivoFacturas, urlFacturas);
end;

{
 *Devuelve la posición del registro.
}
function escribirDato(var f:fArticulo; var dato:tArticulo):longint;
var
    pos:word;
begin
    {$i-}
    reset(f);
    if(IOresult <> 0) then
    begin
        writeln('Error escribiendo dato: ', ioresult);
        exit(-1);
    end;
    
    pos := fileSize(f);
    
    seek(f, pos);
    if(IOresult <> 0) then
    begin
        writeln('Error escribiendo dato: ', ioresult);    //Informacion de debug, debe
        exit(-1);                                //reemplazarse por una f. exit();
    end;

    write(f, dato);
    if(IOresult <> 0) then
    begin
        writeln('Error escribiendo dato: ', ioresult);
        exit(-1);
    end;
    close(f);
    {I+}
end;

function escribirDato(var f:fFactura; var dato:tFactura):longint;
var
    pos:word;
begin
    {$i-}
    reset(f);
    if(IOresult <> 0) then exit(-1);

    pos := fileSize(f);
    
    seek(f, pos);
    if(IOresult <> 0) then exit(-1);

    write(f, dato);
    if(IOresult <> 0) then exit(-1);
    close(f);
    {I+}
end;

{
 *Valores de retorno:
 ** 0: error
 ** 1: exito
 ** 2: EOF (Fin del archivo)
}

function leerDato(var f:fArticulo; var dato:tArticulo; pos:word):byte;
begin
    {i-}
    reset(f);                        //Reset
    if(IOresult <> 0) then exit(0);

    seek(f, pos);                    //Seek
    if(IOresult <> 0) then exit(0);

    read(f, dato);                    //Read
    if(IOresult <> 0) then exit(0);
    if eof(f) then exit(2);

    close(f);                        //Close
    
    exit(1);
    {I+}
end;

function leerDato(var f:fFactura; var dato:tFactura; pos:word):byte;
begin
    {i-}
    reset(f);                        //Reset
    if(IOresult <> 0) then exit(0);

    seek(f, pos);                    //Seek
    if(IOresult <> 0) then exit(0);
    
    if eof(f) then exit(2);

    read(f, dato);                    //Read
    if(IOresult <> 0) then exit(0);

    close(f);                        //Close
    
    exit(1);
    {I+}
end;

{
 *"Cuerpo principal" de la unit. Prepara las direcciones de los archivos.
}
initialization
    leerConfig('config.cfg');
end.
