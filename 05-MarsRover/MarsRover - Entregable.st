!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'marsRoverOrientadoAlNorte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'Auxiliares' stamp: 'NA 6/29/2021 21:15:56'!
chequearQueLaPosicionFinalSea: unaPosicion yLaOrientacionFinal: unaOrientacion
	
	self assert: unaPosicion equals: marsRoverOrientadoAlNorte posicionActual.
	self assert: (marsRoverOrientadoAlNorte orientacionActual esIgualA: unaOrientacion).! !


!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:09:42'!
setUp
	
	marsRoverOrientadoAlNorte _ MarsRover enPosicion: (0@0) orientadoHacia: MarsRoverOrientacionNorte new.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:16:19'!
test01NoHaceNadaConComandoVacio

	marsRoverOrientadoAlNorte ejecutarComandos: ''.
	self chequearQueLaPosicionFinalSea: 0@0 yLaOrientacionFinal: MarsRoverOrientacionNorte.
! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:16:42'!
test02AvanzaUnaPosicionHaciaAdelanteApuntandoAlNorte
	
	marsRoverOrientadoAlNorte ejecutarComandos: 'f'.
	self chequearQueLaPosicionFinalSea: 0@1 yLaOrientacionFinal: MarsRoverOrientacionNorte.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:16:57'!
test03SeRetrasaUnaPosicionHaciaAtrasApuntandoAlNorte
	
	marsRoverOrientadoAlNorte ejecutarComandos: 'b'.
	self chequearQueLaPosicionFinalSea: 0@-1 yLaOrientacionFinal: MarsRoverOrientacionNorte.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:17:12'!
test04GiraALaDerechaApuntandoAlNorte
	
	marsRoverOrientadoAlNorte ejecutarComandos: 'r'.
	self chequearQueLaPosicionFinalSea: 0@0 yLaOrientacionFinal: MarsRoverOrientacionEste.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:17:27'!
test05GiraALaIzquierdaApuntandoAlNorte
	
	marsRoverOrientadoAlNorte ejecutarComandos: 'l'.
	self chequearQueLaPosicionFinalSea: 0@0 yLaOrientacionFinal: MarsRoverOrientacionOeste.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:17:37'!
test06EjecutaComandosSucesivos
	
	marsRoverOrientadoAlNorte ejecutarComandos: 'fllrb'.
	self chequearQueLaPosicionFinalSea: 1@1 yLaOrientacionFinal: MarsRoverOrientacionOeste.! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:11:57'!
test07ErrorAnteUnComandoInvalido

	self should: [ marsRoverOrientadoAlNorte ejecutarComandos: 's'.]
        	raise: Error 
        		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover ErrorComandoInvalido].! !

!MarsRoverTests methodsFor: 'tests' stamp: 'NA 6/29/2021 21:17:54'!
test08CortaLaEjecucionDeComandosAnteUnComandoInvalido
	
	self should: [ marsRoverOrientadoAlNorte ejecutarComandos: 'fflsbb'.]
        	raise: Error 
        		withExceptionDo: [ :anError | self assert: anError messageText = MarsRover ErrorComandoInvalido].
	self chequearQueLaPosicionFinalSea: 0@2 yLaOrientacionFinal: MarsRoverOrientacionOeste.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'orientacion posicion comandos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'Inicializacion' stamp: 'NA 6/29/2021 21:02:00'!
inicializarConPosicion: unaPosicion yConOrientacion: unaOrientacion.
	
	orientacion _ unaOrientacion.
	posicion _ unaPosicion.
	comandos _ Dictionary newFromPairs: {
		$f. #moverAdelante. 
		$b. #moverAtras. 
		$l. #rotarIzquierda. 
		$r. #rotarDerecha.
	}.
	! !


!MarsRover methodsFor: 'Movimiento' stamp: 'NA 6/29/2021 21:05:25'!
moverAdelante
	
	^posicion _ posicion + orientacion coordenadaMoverseHaciaAdelante.! !

!MarsRover methodsFor: 'Movimiento' stamp: 'NA 6/29/2021 19:19:18'!
moverAtras
	
	^posicion _ posicion + orientacion coordenadaMoverseHaciaAtras.! !

!MarsRover methodsFor: 'Movimiento' stamp: 'NA 6/29/2021 19:20:31'!
rotarDerecha
	
	^orientacion _ orientacion rotarALaDerecha.! !

!MarsRover methodsFor: 'Movimiento' stamp: 'NA 6/29/2021 19:20:20'!
rotarIzquierda
	
	^orientacion _ orientacion rotarALaIzquierda.! !


!MarsRover methodsFor: 'Funcionalidad' stamp: 'NA 6/29/2021 21:41:29'!
ejecutarComandos: serieDeComandos

	|comandoAUsar|
	serieDeComandos do: [:comando | 
		comandoAUsar _ comandos at: comando ifAbsent:[
		^self error: self class ErrorComandoInvalido].
		comandoAUsar sendTo: self.
	].
	! !

!MarsRover methodsFor: 'Funcionalidad' stamp: 'NA 6/27/2021 21:29:37'!
orientacionActual
	
	^orientacion.! !

!MarsRover methodsFor: 'Funcionalidad' stamp: 'NA 6/27/2021 21:29:26'!
posicionActual
	
	^posicion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 19:47:17'!
ErrorComandoInvalido
	
	^'El comando no es valido'.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'NA 6/27/2021 21:27:18'!
enPosicion: unaPosicion orientadoHacia: unaOrientacion
	
	^self new inicializarConPosicion: unaPosicion yConOrientacion: unaOrientacion.! !


!classDefinition: #MarsRoverOrientacion category: 'MarsRover'!
Object subclass: #MarsRoverOrientacion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientacion methodsFor: 'Private' stamp: 'NA 6/29/2021 21:06:09'!
coordenadaMoverseHaciaAdelante

	^self subclassResponsibility.! !

!MarsRoverOrientacion methodsFor: 'Private' stamp: 'NA 6/29/2021 21:06:26'!
coordenadaMoverseHaciaAtras
	
	^self subclassResponsibility.! !

!MarsRoverOrientacion methodsFor: 'Private' stamp: 'NA 6/29/2021 19:40:48'!
esIgualA: unaOrientacion
	
	^unaOrientacion = self class.! !

!MarsRoverOrientacion methodsFor: 'Private' stamp: 'NA 6/29/2021 21:06:42'!
rotarALaDerecha
	
	^self subclassResponsibility.! !

!MarsRoverOrientacion methodsFor: 'Private' stamp: 'NA 6/29/2021 21:06:57'!
rotarALaIzquierda
	
	^self subclassResponsibility.! !


!classDefinition: #MarsRoverOrientacionEste category: 'MarsRover'!
MarsRoverOrientacion subclass: #MarsRoverOrientacionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientacionEste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 21:05:25'!
coordenadaMoverseHaciaAdelante

	^(1@0).! !

!MarsRoverOrientacionEste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:14:46'!
coordenadaMoverseHaciaAtras
	
	^(-1@0).! !

!MarsRoverOrientacionEste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:15:26'!
rotarALaDerecha
	
	^MarsRoverOrientacionSur new.! !

!MarsRoverOrientacionEste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:15:39'!
rotarALaIzquierda
	
	^MarsRoverOrientacionNorte new.! !


!classDefinition: #MarsRoverOrientacionNorte category: 'MarsRover'!
MarsRoverOrientacion subclass: #MarsRoverOrientacionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientacionNorte methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 21:05:25'!
coordenadaMoverseHaciaAdelante

	^(0@1).! !

!MarsRoverOrientacionNorte methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:15:55'!
coordenadaMoverseHaciaAtras
	
	^(0@-1).! !

!MarsRoverOrientacionNorte methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:16:14'!
rotarALaDerecha
	
	^MarsRoverOrientacionEste new.! !

!MarsRoverOrientacionNorte methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:16:23'!
rotarALaIzquierda
	
	^MarsRoverOrientacionOeste new.! !


!classDefinition: #MarsRoverOrientacionOeste category: 'MarsRover'!
MarsRoverOrientacion subclass: #MarsRoverOrientacionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientacionOeste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 21:05:25'!
coordenadaMoverseHaciaAdelante

	^(-1@0).! !

!MarsRoverOrientacionOeste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:16:43'!
coordenadaMoverseHaciaAtras
	
	^(1@0).! !

!MarsRoverOrientacionOeste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:17:00'!
rotarALaDerecha
	
	^MarsRoverOrientacionNorte new.! !

!MarsRoverOrientacionOeste methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:17:09'!
rotarALaIzquierda
	
	^MarsRoverOrientacionSur new.! !


!classDefinition: #MarsRoverOrientacionSur category: 'MarsRover'!
MarsRoverOrientacion subclass: #MarsRoverOrientacionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientacionSur methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 21:05:25'!
coordenadaMoverseHaciaAdelante

	^(0@-1).! !

!MarsRoverOrientacionSur methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:17:28'!
coordenadaMoverseHaciaAtras
	
	^(0@1).! !

!MarsRoverOrientacionSur methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:17:38'!
rotarALaDerecha
	
	^MarsRoverOrientacionOeste new.! !

!MarsRoverOrientacionSur methodsFor: 'as yet unclassified' stamp: 'NA 6/29/2021 20:17:46'!
rotarALaIzquierda
	
	^MarsRoverOrientacionEste new.! !
