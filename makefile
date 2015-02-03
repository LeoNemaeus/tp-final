CCFLAGS=-g

all: tp-final

util: util.ppu

util.ppu:
	fpc $(CFLAGS) util.pas

tp-final: tipos.ppu archivos.ppu arboles.ppu ventas.ppu menu.ppu g_actsto.ppu g_actpre.ppu g_vector.ppu g_pedart.ppu g_consfac.ppu g_lisp.ppu
	fpc $(CFLAGS) G_TPFinal.pas

tipos.ppu:
	fpc $(CFLAGS) tipos.pas

archivos.ppu:
	fpc $(CFLAGS) G_Archivo.pas


arboles.ppu:
	fpc $(CFLAGS) G_Arbol.pas

ventas.ppu:
	fpc $(CFLAGS) G_Venta.pas

menu.ppu:
	fpc $(CFLAGS) G_Menu.pas

g_actsto.ppu:
	fpc $(CFLAGS) G_ActSto.pas

g_actpre.ppu:
	fpc $(CFLAGS) G_ActPre.pas

g_vector.ppu:
	fpc $(CFLAGS) G_Vector.pas

g_pedart.ppu:
	fpc $(CFLAGS) G_PedArt.pas
g_consfac.ppu:
	fpc $(CFLAGS) G_ConsFac.pas

g_lisp.ppu:
	fpc $(CFLAGS) G_LisP.pas

clean:
	rm -rf *ppu *o tp-final
