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

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:42:38'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:06:56'!
cantidadDeMenas: tipoDeMena.
	^contenido count: [ :cadaElemento | cadaElemento =  tipoDeMena].! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:53:37'!
cantidadDeMenasTotales
	^contenido size.! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:14:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	contenido := ((OrderedCollection new) add: 'una mena de carbon'; yourself).! !

!Caja class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:09:06'!
vaciar
	contenido := OrderedCollection new.! !


!classDefinition: #CintaTransportadoraDeCarbon category: 'FactorioParte2'!
DenotativeObject subclass: #CintaTransportadoraDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaTransportadoraDeCarbon class' category: 'FactorioParte2'!
CintaTransportadoraDeCarbon class
	instanceVariableNames: 'origen destino contenido'!

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:41:34'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:47:38'!
contenidoEnCinta
	^contenido size.! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:20:06'!
definirDestino: aDestino
	destino _ aDestino.! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:19:29'!
definirOrigen: deOrigen
	origen _ deOrigen.! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:14:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	origen := ExtractorDeCarbon.
	destino := Caja.
	contenido := ((OrderedCollection new)).! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'IA 5/3/2021 21:34:01'!
limpiarCinta
	contenido _ OrderedCollection new.! !

!CintaTransportadoraDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:36:44'!
transportarMenas

	destino agregarMenas: contenido.
	self limpiarCinta.! !


!classDefinition: #CintaTransportadoraDeHierro category: 'FactorioParte2'!
DenotativeObject subclass: #CintaTransportadoraDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FactorioParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaTransportadoraDeHierro class' category: 'FactorioParte2'!
CintaTransportadoraDeHierro class
	instanceVariableNames: 'origen destino contenido'!

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
agregarMenas: aCollectionOfMenas
	^contenido addAll: aCollectionOfMenas.! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
contenidoEnCinta
	^contenido size.! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
definirDestino: aDestino
	destino _ aDestino.! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
definirOrigen: deOrigen
	origen _ deOrigen.! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:14:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	origen := ExtractorDeHierro.
	destino := CintaTransportadoraDeCarbon.
	contenido := ((OrderedCollection new)).! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:26:06'!
limpiarCinta
	contenido _ OrderedCollection new.! !

!CintaTransportadoraDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:36:44'!
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

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:23:04'!
agregarEnergia: energiaExtra

	energiaActual := energiaActual +	energiaExtra.
	^energiaExtra.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 5/2/2021 19:44:58'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de carbon'! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:30:49'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/20/2021 18:29:41'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'SF 4/15/2021 21:21:02'!
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

!ExtractorDeCarbon class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:14:32'!
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

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:25'!
conjuntoDeMenasDeCarbonCantidad: cantidadDeMenas

	^ Array new: cantidadDeMenas withAll: 'una mena de hierro'! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
costoDeExtraccionPorMena
	^5 * joule.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
destino: aContenedor 
	destino := aContenedor.! !

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 14:22:12'!
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

!ExtractorDeHierro class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:14:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	energiaActual := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'joule'; instVarAt: 2 put: 'joules'; instVarAt: 3 put: 'j'; yourself); yourself).
	destino := CintaTransportadoraDeHierro.! !

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

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:09:11'!
testEscenarioExtractorCaja
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: Caja.
	Caja vaciar.
	ExtractorDeCarbon extraer.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	Assert that: (Caja cantidadDeMenas: 'una mena de carbon') isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:07:54'!
testEscenarioExtractorCintaCaja
	|mensajeMena|
	mensajeMena _ 'una mena de carbon'.
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaTransportadoraDeCarbon.
	
	CintaTransportadoraDeCarbon limpiarCinta.
	CintaTransportadoraDeCarbon definirOrigen: ExtractorDeCarbon.
	CintaTransportadoraDeCarbon definirDestino: Caja.
	Caja vaciar.
	
	ExtractorDeCarbon extraer.
	
	CintaTransportadoraDeCarbon transportarMenas.
	Assert that: CintaTransportadoraDeCarbon contenidoEnCinta isEqualTo: 0.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 1.
	Assert that: (Caja cantidadDeMenas: mensajeMena) isEqualTo: 1.! !

!PruebasDeFactorio class methodsFor: 'as yet unclassified' stamp: 'NA 5/8/2021 15:12:20'!
testEscenarioExtractorDeHierroYDobleCinta
	ExtractorDeCarbon ponerEnCeroLaEnergia.
	ExtractorDeCarbon agregarEnergia: 5 * joule.
	ExtractorDeCarbon destino: CintaTransportadoraDeCarbon.
	
	ExtractorDeHierro ponerEnCeroLaEnergia.
	ExtractorDeHierro agregarEnergia: 5 * joule.
	ExtractorDeHierro destino: CintaTransportadoraDeHierro.
	Caja vaciar.
	
	CintaTransportadoraDeCarbon definirDestino: Caja.
	CintaTransportadoraDeHierro definirDestino: CintaTransportadoraDeCarbon.
	CintaTransportadoraDeCarbon definirOrigen: ExtractorDeCarbon.
	CintaTransportadoraDeHierro definirOrigen: ExtractorDeHierro.
	
	ExtractorDeCarbon extraer.
	ExtractorDeHierro extraer.
	
	CintaTransportadoraDeHierro transportarMenas.
	CintaTransportadoraDeCarbon transportarMenas.
	
	Assert that: CintaTransportadoraDeCarbon contenidoEnCinta isEqualTo: 0.
	Assert that: CintaTransportadoraDeHierro contenidoEnCinta isEqualTo: 0.
	Assert that: Caja cantidadDeMenasTotales isEqualTo: 2.
	Assert that: (Caja cantidadDeMenas: 'una mena de carbon') isEqualTo: 1.
	Assert that: (Caja cantidadDeMenas: 'una mena de hierro') isEqualTo: 1.
	
	
	
	
	! !

Caja initializeAfterFileIn!
CintaTransportadoraDeCarbon initializeAfterFileIn!
CintaTransportadoraDeHierro initializeAfterFileIn!
ExtractorDeCarbon initializeAfterFileIn!
ExtractorDeHierro initializeAfterFileIn!