all: tp-final

tp-final: tipos.ppu archivos.ppu arboles.ppu
	fpc tp-final.pas

tipos.ppu:
	fpc tipos.pas

archivos.ppu:
	fpc archivos.pas

arboles.ppu:
	fpc arboles.pas

clean:
	rm -rf *ppu *o tp-final
