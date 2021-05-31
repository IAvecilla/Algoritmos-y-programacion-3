!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 5/7/2020 17:46:14'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NA 5/30/2021 19:03:36'!
setUp

	zero _ Entero with: 0.
	one _ Entero with: 1.
	two _ Entero with: 2.
	three _ Entero with: 3.
	four _ Entero with: 4.
	five _ Entero with: 5.
	eight _ Entero with: 8.
	negativeOne _ Entero with: -1.
	negativeTwo _ Entero with: -2.
	
	oneHalf _ one / two.
	oneFifth _ one / five.
	twoFifth _ two / five.
	twoTwentyfifth _ two / (Entero with: 25).
	fiveHalfs _ five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:37:01'!
* aMultiplier

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:37:04'!
+ anAdder

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:37:07'!
- aSubtrahend

	^self subclassResponsibility! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:37:10'!
/ aDivisor

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:34:46'!
negated
	
	^self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'NA 5/30/2021 21:36:52'!
isNegative

	^self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'NA 5/30/2021 21:36:46'!
isOne

	^self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'NA 5/30/2021 21:36:49'!
isZero

	^self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 16:21:34'!
beAddedToAFraccion: aFraccionAugend
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/30/2021 21:37:19'!
beAddedToEntero: anEnteroAugend
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 18:30:39'!
beMultipliedByAFraccion: aFraccionMultiplier
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 18:20:50'!
beMultipliedByAnEntero: anEnteroMultiplier
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 22:32:40'!
beSubstractedFromAFraccion: aFraccionMinuend

	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 22:09:18'!
beSubstractedFromAnEntero: anEnteroMinuend
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/30/2021 19:05:26'!
divideAFraccion: aFraccionDividend
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/29/2021 20:35:10'!
divideAnEntero: anEnteroDividend
	
	^self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'NA 5/30/2021 21:37:27'!
invalidNumberType

	^self error: self class invalidNumberTypeErrorDescription! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/29/2021 18:21:51'!
* aMultiplicand
	
	^aMultiplicand beMultipliedByAnEntero: self.
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/27/2021 21:06:16'!
+ anAdder 
	
	^anAdder beAddedToEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/29/2021 22:07:50'!
- aSubtrahend 
	
	^ aSubtrahend beSubstractedFromAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/29/2021 20:17:13'!
/ aDivisor 
	
	^aDivisor divideAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:32:55'!
fibonacci

	^self subclassResponsibility.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:35:44'!
negated
	
	^self * (Entero with: -1)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'NA 5/30/2021 21:29:18'!
initializeWith: aValue 
	
	value _ aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 16:19:48'!
beAddedToAFraccion: aFraccionAugend
	
	|newNumerator|
	newNumerator _ (self * aFraccionAugend denominator) + aFraccionAugend numerator.
	^newNumerator / aFraccionAugend denominator.! !

!Entero methodsFor: 'private' stamp: 'NA 5/27/2021 21:02:53'!
beAddedToEntero: anEnteroAugend
	
	^self class with: anEnteroAugend integerValue + self integerValue.
! !

!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 18:41:18'!
beMultipliedByAFraccion: aFraccionMultiplier
	
	^(aFraccionMultiplier numerator * self) / aFraccionMultiplier denominator.! !

!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 18:42:54'!
beMultipliedByAnEntero: anEnteroMultiplier
	
	^self class with: anEnteroMultiplier integerValue * self integerValue.! !

!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 22:26:56'!
beSubstractedFromAFraccion: aFraccionMinuend
	
	^  (aFraccionMinuend numerator - (aFraccionMinuend denominator * self)) / aFraccionMinuend denominator.! !

!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 22:07:11'!
beSubstractedFromAnEntero: anEnteroMinuend
	
	^self class with: anEnteroMinuend integerValue - value.! !

!Entero methodsFor: 'private' stamp: 'NA 5/30/2021 19:05:41'!
divideAFraccion: aFractionDividend
	
	^aFractionDividend numerator / (self * aFractionDividend denominator).! !

!Entero methodsFor: 'private' stamp: 'NA 5/29/2021 20:11:41'!
divideAnEntero: anEnteroDividend
	
	^Fraccion with: anEnteroDividend over: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'NA 5/31/2021 15:01:05'!
with: aValue

	|class|
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	class _ Entero subclasses detect: [:subclassOfEntero | subclassOfEntero correctValueForInitialization: aValue] ifNone: ['No encontre la subclase'].
	^class new initializeWith: aValue.
	! !


!Entero class methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 22:08:39'!
correctValueForInitialization: aValue
	
	^self subclassResponsibility.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 21:33:32'!
fibonacci
	
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 21:58:07'!
correctValueForInitialization: aValue
	
	^aValue = 0.! !


!classDefinition: #EnteroMayorAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroMayorAUno methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 20:36:10'!
fibonacci
	
	|one two|
	
	one _ Entero with:1.
	two _ Entero with: 2.
	
	^(Entero with: (self integerValue - one integerValue )) fibonacci + (Entero with: (self integerValue - two integerValue)) fibonacci.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroMayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroMayorAUno class
	instanceVariableNames: ''!

!EnteroMayorAUno class methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 21:59:56'!
correctValueForInitialization: aValue
	
	^aValue > 1.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 20:37:50'!
fibonacci
	
	^self error: Entero negativeFibonacciErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 22:50:27'!
correctValueForInitialization: aValue
	
	^aValue < 0.! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 21:33:40'!
fibonacci
	
	^self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'as yet unclassified' stamp: 'NA 5/30/2021 22:00:15'!
correctValueForInitialization: aValue
	
	^aValue = 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NA 5/29/2021 18:30:18'!
* aMultiplicand 
	
	^aMultiplicand beMultipliedByAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NA 5/29/2021 16:21:57'!
+ anAdder 

	^anAdder beAddedToAFraccion: self

	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 19:21:36'!
- aSubtrahend 
	
	^aSubtrahend beSubstractedFromAFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 19:06:13'!
/ aDivisor 
	
	^aDivisor divideAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'NA 5/30/2021 21:35:28'!
negated
	
	^self * (Entero with: -1)! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 16:17:27'!
beAddedToAFraccion: aFraccionAugend
	
	|newNumerator newDenominator|
	
	newNumerator _ (aFraccionAugend numerator * self denominator) + (aFraccionAugend denominator * self numerator).
	newDenominator _ aFraccionAugend denominator * self denominator.
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/27/2021 21:03:13'!
beAddedToEntero: anEnteroAugend
	
	^(anEnteroAugend * self denominator + self numerator) / self denominator.! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 18:28:19'!
beMultipliedByAFraccion: aFractionMultiplier
	
	^(self numerator * aFractionMultiplier numerator) / (self denominator * aFractionMultiplier denominator).! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 18:47:55'!
beMultipliedByAnEntero: anEnteroMultiplier
	
	^(self numerator * anEnteroMultiplier)  / self denominator	.! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 22:21:45'!
beSubstractedFromAFraccion: aFraccionMinuend
	
	|newNumerator newDenominator|
	newNumerator _ (aFraccionMinuend numerator * denominator) - (aFraccionMinuend denominator * numerator).
	newDenominator _ aFraccionMinuend denominator * denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 22:31:38'!
beSubstractedFromAnEntero: anEnteroMinuend
	
	|newNumerator newDenominator|
	
	newNumerator _ (anEnteroMinuend * denominator) - numerator.
	newDenominator _ denominator.
	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/30/2021 19:05:50'!
divideAFraccion: aFraccionDividend
	
	^(aFraccionDividend numerator * self denominator) / (aFraccionDividend denominator * self numerator).! !

!Fraccion methodsFor: 'private' stamp: 'NA 5/29/2021 20:14:51'!
divideAnEntero: anEnteroDividend
	
	^(self denominator * anEnteroDividend) / self numerator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
