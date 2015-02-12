Unit ProArbol;
		
interface
uses Crt, Menu, Tipos, Archivo;
		
	Procedure rotarDerechaA(Var A:arbolArtC);
	Procedure rotarIzquierdaA (Var A:arbolArtC);
	Procedure insertarA (Var A:arbolArtC; nodoC:ArtC; Var ok:Boolean);
	Procedure rotarDerechaB(Var B:arbolArtD);
	Procedure rotarIzquierdaB (Var B:arbolArtD);
	Procedure insertarB (Var B:arbolArtD; nodoD:ArtD; Var ok:Boolean);
	Procedure borraRaizA(Var A:arbolArtC; var aux:arbolArtC; Var ok:Boolean);
	Procedure balance_DerA(Var A: arbolArtC; var ok: Boolean);
	Procedure balance_IzqA(Var A: arbolArtC; var ok: Boolean);
    Procedure BorrarArbolA(Var A: arbolArtC; nodoC: ArtC; Var ok: Boolean);
	Procedure borraRaizD(Var B:arbolArtD; var aux:arbolArtD; Var ok:Boolean);
	Procedure balance_DerD(Var B: arbolArtD; var ok: Boolean);
	Procedure balance_IzqD(Var B: arbolArtD; var ok: Boolean);
    Procedure BorrarArbolD(Var B: arbolArtD; nodoD: ArtD; Var ok: Boolean);

implementation

	Procedure rotarDerechaA(Var A:arbolArtC);
	Var
		aux1: arbolArtC;
		aux2: arbolArtC;
	Begin
		aux1:= A^.der;
		If aux1^.balance = incDer then
		Begin
			A^.der:= aux1^.der;
			aux1^.der:= A;
			A^.balance := neutro;
			A:= aux1;
		End
		Else
		Begin
			aux2:= aux1^.izq;
			aux1^.izq:= aux2^.der;
			aux2^.der:= aux1;
			A^.der:= aux2^.izq;
			aux2^.izq:= A;
			If aux2^.balance =incIzq then
				aux1^.balance := incDer
			Else
				aux1^.balance := neutro;
			If aux2^.balance = incDer then
				A^.balance := incIzq
			Else
				A^.balance := neutro;
			A := aux2;
		End ;
	A^.balance := neutro;
	End;

	
	Procedure rotarIzquierdaA (Var A:arbolArtC);
	Var
		aux1: arbolArtC;
		aux2: arbolArtC;
	Begin
		aux1:= A^.izq;
		If aux1^.balance = incIzq then
		Begin
			A^.izq:= aux1^.der;
			aux1^.der:= A;
			A^.balance := neutro;
			A:= aux1;
		End
		Else
		Begin
			aux2:= aux1^.der;
			aux1^.der:= aux2^.izq;
			aux2^.izq:= aux1;
			A^.izq:= aux2^.der;
			aux2^.der := A;
			If aux2^.balance = incDer then
				aux1^.balance := incIzq
			Else
				aux1^.balance := neutro ;
			If aux2^.balance = incIzq then
				A^.balance := incDer
			Else
				A^.balance := neutro ;
			A := aux2 ;
		End ;
	A^.balance := neutro ;
	End ;


	Procedure insertarA (Var A:arbolArtC; nodoC:ArtC; Var ok:Boolean);
	Begin
		If A = Nil then
		Begin
			New(A) ;
            A^.info:= nodoC;
			A^.der:=nil;
			A^.izq:=nil;
			A^.balance:=neutro;
			ok := True;
		end
		Else
			If nodoC.codigo = A^.info.codigo then
            Begin
				ok:=False ;
				Exit ;
			End
			Else
				If nodoC.codigo <= A^.info.codigo then
				Begin
					insertarA(A^.izq, nodoC, ok);
					If ok then
					Case A^.balance of
						incIzq: Begin
									rotarIzquierdaA(A);
									ok:= False;
								End;
						neutro: A^.balance := incIzq;
						incDer: Begin
									A^.balance := neutro;
									ok:= False;
								End;
					End;
				End
			Else
			Begin
				insertarA(A^.der, nodoC, ok);
					If ok then
					Case A^.balance of
						incIzq: Begin
									A^.balance := neutro;
									ok:= False;
								End;
						neutro: A^.balance:= incDer;
						incDer: Begin
									rotarDerechaA(A) ;
									ok:= False;
                                 End;
					End;
			End ;
	End;

	
	Procedure rotarDerechaB(Var B:arbolArtD);
	Var
		aux1: arbolArtD;
		aux2: arbolArtD;
	Begin
		aux1:= B^.der;
		If aux1^.balance = incDer then
		Begin
			B^.der:= aux1^.der;
			aux1^.der:= B;
			B^.balance := neutro;
			B:= aux1;
		End
		Else
		Begin
			aux2:= aux1^.izq;
			aux1^.izq:= aux2^.der;
			aux2^.der:= aux1;
			B^.der:= aux2^.izq;
			aux2^.izq:= B;
			If aux2^.balance =incIzq then
				aux1^.balance := incDer
			Else
				aux1^.balance := neutro;
			If aux2^.balance = incDer then
				B^.balance := incIzq
			Else
				B^.balance := neutro;
			B := aux2;
		End ;
	B^.balance := neutro;
	End;

	
	Procedure rotarIzquierdaB (Var B:arbolArtD);
	Var
		aux1: arbolArtD;
		aux2: arbolArtD;
	Begin
		aux1:= B^.izq;
		If aux1^.balance = incIzq then
		Begin
			B^.izq:= aux1^.der;
			aux1^.der:= B;
			B^.balance := neutro;
			B:= aux1;
		End
		Else
		Begin
			aux2:= aux1^.der;
			aux1^.der:= aux2^.izq;
			aux2^.izq:= aux1;
			B^.izq:= aux2^.der;
			aux2^.der := B;
			If aux2^.balance = incDer then
				aux1^.balance := incIzq
			Else
				aux1^.balance := neutro ;
			If aux2^.balance = incIzq then
				B^.balance := incDer
			Else
				B^.balance := neutro ;
			B := aux2 ;
		End ;
	B^.balance := neutro ;
	End ;


	Procedure insertarB (Var B:arbolArtD; nodoD:ArtD; Var ok:Boolean);
	Begin
		If B = Nil then
		Begin
			New(B) ;
            B^.info:= nodoD;
			B^.der:=nil;
			B^.izq:=nil;
			B^.balance:=neutro;
			ok := True;
		end
		Else
			If nodoD.descri = B^.info.descri then
            Begin
				ok:=False ;
				Exit ;
			End
			Else
				If nodoD.descri <= B^.info.descri then
				Begin
					insertarB(B^.izq, nodoD, ok);
					If ok then
					Case B^.balance of
						incIzq: Begin
									rotarIzquierdaB(B);
									ok:= False;
								End;
						neutro: B^.balance := incIzq;
						incDer: Begin
									B^.balance := neutro;
									ok:= False;
								End;
					End;
				End
			Else
			Begin
				insertarB(B^.der, nodoD, ok);
					If ok then
					Case B^.balance of
						incIzq: Begin
									B^.balance := neutro;
									ok:= False;
								End;
						neutro: B^.balance:= incDer;
						incDer: Begin
									rotarDerechaB(B) ;
									ok:= False;
                                 End;
					End;
			End ;
	End;
	
	Procedure borraRaizA(Var A:arbolArtC; var aux:arbolArtC; Var ok:Boolean);
	Begin
		If aux^.der = Nil then
		Begin
			A^.info:= aux^.info;
			aux:= aux^.izq;
			ok:= True;
		End
		Else
		Begin
			borraRaizA(A,aux^.der,ok);
			If ok then
				balance_izqA(aux,ok);
		End ;
	End ;

	Procedure balance_DerA(Var A: arbolArtC; var ok: Boolean);
	Var
		aux1: arbolArtC;
		aux2: arbolArtC;
		balance1: balanceDat;
		balance2: balanceDat;
	Begin
		Case A^.balance of
			incIzq:	A^.balance := neutro;
			neutro:Begin
						A^.balance := incDer;
						ok := False;
					End;
			incDer : Begin
						aux1 := A^.der;
						balance1 := aux1^.balance;
						If not (balance1 = incIzq) then
						Begin
							A^.der := aux1^.izq;
							aux1^.izq := A;
							If balance1 = neutro then
							Begin
								A^.balance:= incDer;
								aux1^.balance := incIzq;
								ok := False;
							End
							Else
							Begin
								A^.balance := neutro;
								aux1^.balance := neutro;
							End ;
							A:= aux1;
						End
						Else
						Begin
							aux2:= aux1^.izq;
							balance2:= aux2^.balance;
							aux1^.izq:= aux2^.der;
							aux2^.der:= aux1;
							A^.der:= aux2^.izq;
							aux2^.izq:= A;
							If balance2 = incIzq then
								aux1^.balance := incDer
							Else
								aux1^.balance := neutro;
							If balance2 = incDer then
								A^.balance := incIzq
							Else
								A^.balance := neutro;
							A := aux2;
							aux2^.balance := neutro;
						End;
					End;
		End;
	End;

	Procedure balance_IzqA(Var A: arbolArtC; var ok: Boolean);
	Var
		aux1: arbolArtC;
		aux2: arbolArtC;
		balance1: balanceDat;
		balance2: balanceDat;
	Begin
		Case A^.balance of
			incIzq:	A^.balance:= neutro;
			neutro: Begin
						A^.balance:= incIzq;
						ok:= False;
					End ;
			incDer: Begin
						aux1 := A^.izq;
						balance1 := aux1^.balance;
						If not (balance1 = incDer) then
						Begin
							A^.izq:= aux1^.der;
							aux1^.der:= A;
							If balance1 = neutro then
							Begin
								A^.balance:= incIzq;
								aux1^.balance:= incDer;
								ok:= False;
							End
							Else
							Begin
								A^.balance := neutro;
								aux1^.balance := neutro;
							End;
							A := aux1;
						End
						Else
						Begin
							aux2:= aux1^.der;
							balance2:= aux2^.balance;
							aux1^.der:= aux2^.izq;
							aux2^.izq:= aux1;
							A^.izq:= aux2^.der;
							aux2^.der:= A;
							If balance2 = incDer then
								aux1^.balance := incIzq
							Else
								aux1^.balance := neutro;
							If balance2 = incIzq then
								A^.balance := incDer
							Else
								A^.balance := neutro;
							A := aux2;
							aux2^.balance := neutro;
						End ;
					End;
		End;
	end;

    Procedure BorrarArbolA(Var A: arbolArtC; nodoC: ArtC; Var ok: Boolean);
	Var
	aux:arbolArtC;
	Begin
		If A = Nil then
			ok := False
		Else
			If nodoC.codigo < A^.info.codigo then
			Begin
				BorrarArbolA(A^.izq , nodoC , ok);
				If ok then
					balance_DerA(A , ok);
			End
			Else
			If nodoC.codigo > A^.info.codigo then
			Begin
				BorrarArbolA(A^.der , nodoC , ok);
				If ok then
					balance_IzqA(A , ok);
			End
			Else
			Begin
				aux := A;
				If A^.der = Nil then
				Begin
					A := A^.izq;
					ok := True;
				End
				Else
				Begin
					borraRaizA(A, A^.izq, ok);
					If ok then
						balance_DerA(A , ok);
				End ;
			End ;
			Dispose(aux);
	End;
	
	Procedure borraRaizD(Var B:arbolArtD; var aux:arbolArtD; Var ok:Boolean);
	Begin
		If aux^.der = Nil then
		Begin
			B^.info:= aux^.info;
			aux:= aux^.izq;
			ok:= True;
		End
		Else
		Begin
			borraRaizD(B,aux^.der,ok);
			If ok then
				balance_izqD(aux,ok);
		End ;
	End ;

	Procedure balance_DerD(Var B: arbolArtD; var ok: Boolean);
	Var
		aux1: arbolArtD;
		aux2: arbolArtD;
		balance1: balanceDat;
		balance2: balanceDat;
	Begin
		Case B^.balance of
			incIzq:	B^.balance := neutro;
			neutro:Begin
						B^.balance := incDer;
						ok := False;
					End;
			incDer : Begin
						aux1 := B^.der;
						balance1 := aux1^.balance;
						If not (balance1 = incIzq) then
						Begin
							B^.der := aux1^.izq;
							aux1^.izq := B;
							If balance1 = neutro then
							Begin
								B^.balance:= incDer;
								aux1^.balance := incIzq;
								ok := False;
							End
							Else
							Begin
								B^.balance := neutro;
								aux1^.balance := neutro;
							End ;
							B:= aux1;
						End
						Else
						Begin
							aux2:= aux1^.izq;
							balance2:= aux2^.balance;
							aux1^.izq:= aux2^.der;
							aux2^.der:= aux1;
							B^.der:= aux2^.izq;
							aux2^.izq:= B;
							If balance2 = incIzq then
								aux1^.balance := incDer
							Else
								aux1^.balance := neutro;
							If balance2 = incDer then
								B^.balance := incIzq
							Else
								B^.balance := neutro;
							B := aux2;
							aux2^.balance := neutro;
						End;
					End;
		End;
	End;

	Procedure balance_IzqD(Var B: arbolArtD; var ok: Boolean);
	Var
		aux1: arbolArtD;
		aux2: arbolArtD;
		balance1: balanceDat;
		balance2: balanceDat;
	Begin
		Case B^.balance of
			incIzq:	B^.balance:= neutro;
			neutro: Begin
						B^.balance:= incIzq;
						ok:= False;
					End ;
			incDer: Begin
						aux1 := B^.izq;
						balance1 := aux1^.balance;
						If not (balance1 = incDer) then
						Begin
							B^.izq:= aux1^.der;
							aux1^.der:= B;
							If balance1 = neutro then
							Begin
								B^.balance:= incIzq;
								aux1^.balance:= incDer;
								ok:= False;
							End
							Else
							Begin
								B^.balance := neutro;
								aux1^.balance := neutro;
							End;
							B := aux1;
						End
						Else
						Begin
							aux2:= aux1^.der;
							balance2:= aux2^.balance;
							aux1^.der:= aux2^.izq;
							aux2^.izq:= aux1;
							B^.izq:= aux2^.der;
							aux2^.der:= B;
							If balance2 = incDer then
								aux1^.balance := incIzq
							Else
								aux1^.balance := neutro;
							If balance2 = incIzq then
								B^.balance := incDer
							Else
								B^.balance := neutro;
							B := aux2;
							aux2^.balance := neutro;
						End ;
					End;
		End;
	end;

    Procedure BorrarArbolD(Var B: arbolArtD; nodoD: ArtD; Var ok: Boolean);
	Var
	aux:arbolArtD;
	Begin
		If B = Nil then
			ok := False
		Else
			If nodoD.descri < B^.info.descri then
			Begin
				BorrarArbolD(B^.izq , nodoD , ok);
				If ok then
					balance_DerD(B , ok);
			End
			Else
			If nodoD.descri > B^.info.descri then
			Begin
				BorrarArbolD(B^.der , nodoD , ok);
				If ok then
					balance_IzqD(B , ok);
			End
			Else
			Begin
				aux := B;
				If B^.der = Nil then
				Begin
					B := B^.izq;
					ok := True;
				End
				Else
				Begin
					borraRaizD(B, B^.izq, ok);
					If ok then
						balance_DerD(B , ok);
				End;
			End;
			Dispose(aux);
	End;
	
End.
