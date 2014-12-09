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
procedure leerConfig(url:string; var dbUrl:string);
procedure escribirDato();
procedure leerDato();
procedure leerBloque();




implementation
uses tipos;
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

procedure escribirDato();
var
	fArticulos:file of tArticulo;
	dato:tArticulo;
	pos:word;
begin
	{$i-}
	reset(fArticulos);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;

	seek(fArticulos, pos);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;

	write(fArticulos, dato);
	if(IOresult <> 0) then
	begin
		writeln('Error escribiendo dato');
		exit;
	end;
	close(fArticulos);
	{I+}
end;

procedure leerDato();
var
	fArticulos:file of tArticulo;
	dato:tArticulo;
	pos:word;
begin
	{i-}
	reset(fArticulos);						//Reset
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

	seek(fArticulos, pos);					//Seek
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

	read(fArticulos, dato);					//Read
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

	close(fArticulos);						//Close
	{I+}
end;

procedure leerBloque();
var
	fArticulos:file of tArticulo;
	buffer:array[1..256] of tArticulo;
	pos:word;		//posicion donde comienza el bloque de datos.
					//tamaño constante.
	result:integer;
begin
	{i-}
	reset(fArticulos);
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

	seek(fArticulos, pos);
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

	blockRead(fArticulos, buffer, 65535, result);
	if(IOresult <> 0) then
	begin
		writeln('Error leyendo dato');
		exit;
	end;

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
