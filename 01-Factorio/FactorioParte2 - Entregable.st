!classDefinition: #Caja category: 'FactorioParte2'!
DenotativeObject subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Caja class' category: 'FactorioParte2'!
Caja class
	instanceVariableNames: 'contenido'!

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:07:37'!
agregar: unaMena
	contenido add: unaMena.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:43:07'!
agregarMenas: coleccionDeMenas
	^contenido addAll: coleccionDeMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:43:49'!
cantidadDeMenas: tipoDeMena.
	^contenido count: [:elementoABuscar | elementoABuscar =  tipoDeMena].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:53:37'!
cantidadDeMenasTotales
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:55:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:45:13'!
vaciarContenido
	contenido := OrderedCollection new.! !


!classDefinition: #CintaA category: 'FactorioParte2'!
DenotativeObject subclass: #CintaA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaA class' category: 'FactorioParte2'!
CintaA class
	instanceVariableNames: 'destino contenido'!

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:45:48'!
agregarMenas: coleccionDeMenas
	^contenido addAll: coleccionDeMenas.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:47:38'!
contenidoEnCinta
	^contenido size.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:20:06'!
definirDestino: aDestino
	destino _ aDestino.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:55:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := Caja.
	contenido := ((OrderedCollection new)).! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:34:01'!
limpiarCinta
	contenido _ OrderedCollection new.! !

!CintaA class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:41:08'!
transportarMenas
	destino agregarMenas: contenido.
	self limpiarCinta.! !


!classDefinition: #CintaB category: 'FactorioParte2'!
DenotativeObject subclass: #CintaB
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaB class' category: 'FactorioParte2'!
CintaB class
	instanceVariableNames: 'destino contenido'!

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:46:22'!
agregarMenas: coleccionDeMenas
	^contenido addAll: coleccionDeMenas.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
contenidoEnCinta
	^contenido size.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
definirDestino: aDestino
	destino _ aDestino.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:55:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	destino := CintaA.
	contenido := ((OrderedCollection new)).! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
limpiarCinta
	contenido _ OrderedCollection new.! !

!CintaB class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:41:01'!
transportarMenas
	destino agregarMenas: contenido.
	self limpiarCinta.! !


!classDefinition: #ExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeCarbon class' category: 'FactorioParte2'!
ExtractorDeCarbon class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:46:48'!
agregarEnergia: energiaExtra
	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:46:52'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas
	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:47:01'!
energiaActual
	^energiaActual.
! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:29'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:34:57'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:55:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := Caja.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:27'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:36:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:31:57'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #ExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #ExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractorDeHierro class' category: 'FactorioParte2'!
ExtractorDeHierro class
	instanceVariableNames: 'energiaActual destino'!

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:47:45'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas
	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:47:53'!
energiaActual
	^energiaActual.
! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self sacarEnergia: energiaConsumida.
	^destino agregarMenas: (self conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas).! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:55:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaB.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
sacarEnergia: energiaASacar
	energiaActual := energiaActual - energiaASacar! !


!classDefinition: #PruebasDeExtractorDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeCarbon class' category: 'FactorioParte2'!
PruebasDeExtractorDeCarbon class
	instanceVariableNames: ''!

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:37:39'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:41:43'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:46:54'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeCarbon extraer isEmpty.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:47:56'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:49:57'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 7 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 1.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:50:53'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 50 * joule.
	Assert that: ExtractorDeCarbon extraer size isEqualTo: 10.
	Assert that: ExtractorDeCarbon energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeExtractorDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeExtractorDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeExtractorDeHierro class' category: 'FactorioParte2'!
PruebasDeExtractorDeHierro class
	instanceVariableNames: ''!

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:45:13'!
setUp
	ExtractorDeCarbon destino: Caja.
	Caja vaciarContenido.! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:37:05'!
test01UnExtractorSinEnergiaNoExtraeMenas
	"Cuando no cargue energia en el extractor, no saco menas"
	ExtractorDeHierro ponerEnCeroLaEnergia.
	Assert isTrue: ExtractorDeHierro extraer isEmpty.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:37:24'!
test02UnExtractorConInsuficienteEnergiaNoExtraeMenas
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 1 * joule.
	Assert isTrue: ExtractorDeHierro extraer isEmpty.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:37:42'!
test03UnExtractorConSuficienteEnergiaExtrae1Mena
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 1.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:38:01'!
test04UnExtractorConservaLaEnergiaNoUtilizada
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 7 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 1.
	Assert that: ExtractorDeHierro energiaActual isEqualTo: 2 * joule.
! !

!PruebasDeExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:38:17'!
test05UnExtractorPuedeExtraerMultiplesMenasConMuchaEnergia
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 50 * joule.
	Assert that: ExtractorDeHierro extraer size isEqualTo: 10.
	Assert that: ExtractorDeHierro energiaActual isEqualTo: 0 * joule.
! !


!classDefinition: #PruebasDeFactorio category: 'FactorioParte2'!
DenotativeObject subclass: #PruebasDeFactorio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasDeFactorio class' category: 'FactorioParte2'!
PruebasDeFactorio class
	instanceVariableNames: ''!

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:49:30'!
testEscenarioExtractorCaja
	|tipoDeMena|
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciarContenido.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	tipoDeMena _ 'una mena de carbon'.
	Assert that: (Caja cantidadDeMenas: tipoDeMena) isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:45:13'!
testEscenarioExtractorCintaCaja
	|tipoDeMena|
	tipoDeMena _ 'una mena de carbon'.
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	CintaA limpiarCinta.
	CintaA definirDestino: Caja.
	Caja vaciarContenido.
	ExtractorDeCarbon extraer.
	CintaA transportarMenas.
	Assert that: CintaA contenidoEnCinta isEqualTo: 0.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	Assert that: (Caja cantidadDeMenas: tipoDeMena ) isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:45:13'!
testEscenarioExtractorDeHierroYDobleCinta
	|tipoDeMena|
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaA.
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	ExtractorDeHierro destino: CintaB.
	Caja vaciarContenido.
	CintaA definirDestino: Caja.
	CintaB definirDestino: CintaA.
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	CintaB transportarMenas.
	CintaA transportarMenas.
	Assert that: CintaA contenidoEnCinta isEqualTo: 0.
	Assert that: CintaB contenidoEnCinta isEqualTo: 0.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 2.
	tipoDeMena _ 'una mena de carbon'.
	Assert that: (Caja cantidadDeMenas: tipoDeMena) isEqualTo: 1.
	tipoDeMena _ 'una mena de hierro'.
	Assert that: (Caja cantidadDeMenas: tipoDeMena) isEqualTo: 1.
	
	
	
	
	! !

Caja initializeAfterFileIn!
CintaA initializeAfterFileIn!
CintaB initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!