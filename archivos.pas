{
 *Archivo: archivos.pas
 *Creado: 06/12/2014
 *Autor: Sandro Pastorini
 *Comentario:
 **** Se encarga de todo el manejo de archivos.
 **** Define funciones que abstraen las funciones y requerimientos del pascal,
 **** automatizando controles y tareas de mantenimiento sobre los archivos.
 *
 *Por hacer:
 **Definir qué procedimientos básicos y de apoyo (extras) a implementar.
 **Definir cuánto automatizar.
 *
 *Implementado:
 **Lectura de configuración:
 **** - El prefijo 'conf' denota sus procedimientos y variables.
 **** - Se leen ruta de la base de datos (archivo).
 **** - El archivo de configuración es de tipo TEXTO.
 *Implementándose:
 ****Lectura/escritura de datos simples, bloques.
}
unit archivos;

interface
uses tipos;

	procedure leerConfig(url:string; var dbUrl:string);
	procedure escribirDato(var f:fArticulo; var dato:tArticulo);
	function leerDato(var f:fArticulo; var dato:tArticulo; pos:word):byte;
	function leerDato(var f:fFactura; var dato:tFactura; pos:word):byte;




implementation
{
 *leer la configuracion
 *leer bloque
 *escribir dato
 *buscar dato
}

procedure leerConfig(url:string; var dbUrl:string);
var
	confArchivo:TextFile;
begin
	{$i-}							//Desactiva el manejo automático de errores.
	assign(confArchivo, url);
	reset(confArchivo);
	if(IOresult = 0) then
	begin
			readln(confArchivo, dbUrl);
			if(IOresult <> 0) then writeln('Error leyendo archivo de config');
			readln(confArchivo, dbUrl);
			if(IOresult <> 0) then writeln('Error leyendo archivo de config');
			close(confArchivo);
	end
	else
	begin
		writeln('Error abriendo archivo de config');
		dbUrl := '';
	end;

	{I+}							//Desactiva el manejo automático de errores.
end;

procedure escribirDato(var f:fArticulo; var dato:tArticulo);
var
	aux:tArticulo;
	pos:word;
	bTemp:byte;	//Variable temporal para guardar el resultado de leerDato()
begin
	{$i-}
	reset(f);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;

	pos := 0;
	repeat
		inc(pos);
		bTemp := leerDato(f, aux, pos);
	until (aux.codigo < dato.codigo) OR (bTemp <> 1);
	
	if(bTemp = 1) then writeln('Error accediendo archivo');
	
	seek(f, pos);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');	//Informacion de debug, debe
		exit;								//reemplazarse por una f. exit();
	end;

	write(f, dato);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;
	close(f);
	{I+}
end;

procedure escribirDato(var f:fFactura; var dato:tFactura);
var
	aux:tFactura;
	pos:word;
	bTemp:byte;	//Variable temporal para guardar el resultado de leerDato()
begin
	{$i-}
	reset(f);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;

	pos := 0;
	repeat
		inc(pos);
		bTemp := leerDato(f, aux, pos);
	until (aux.nFactura < dato.nFactura) OR (bTemp <> 1);
	
	if(bTemp = 1) then
	begin
		writeln('Error accediendo archivo');
		exit();
	end;
	
	seek(f, pos);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');	//Informacion de debug, debe
		exit;								//reemplazarse por una f. exit();
	end;

	write(f, dato);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;
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
	reset(f);						//Reset
	if(IOresult <> 0) then exit(0);

	seek(f, pos);					//Seek
	if(IOresult <> 0) then exit(0);

	read(f, dato);					//Read
	if(IOresult <> 0) then exit(0);
	
	if eof(f) then exit(2);

	close(f);						//Close
	
	exit(1);
	{I+}
end;

function leerDato(var f:fFactura; var dato:tFactura; pos:word):byte;
begin
	{i-}
	reset(f);						//Reset
	if(IOresult <> 0) then exit(0);

	seek(f, pos);					//Seek
	if(IOresult <> 0) then exit(0);

	read(f, dato);					//Read
	if(IOresult <> 0) then exit(0);
	
	if eof(f) then exit(2);

	close(f);						//Close
	
	exit(1);
	{I+}
end;

var
	temp:string;
	{articulos:fArticulo;
	facturas:fFacturas;}

initialization
	leerConfig('config.cfg', temp);
	writeln('URL: ', temp);
//	rewrite(fArticulos);
end.
