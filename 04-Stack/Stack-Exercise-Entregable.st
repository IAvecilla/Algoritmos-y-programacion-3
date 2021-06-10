!classDefinition: #OOStackLimitedTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackLimitedTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimitedTest methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 22:16:58'!
test01CantPushIfTheLimitIsReached
	
	|limitedStack|
	limitedStack _ OOLimitedStack new.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	self
		should: [ limitedStack push: 'a']
			raise: Error
			withExceptionDo: [ :anError |
				self assert: anError messageText = OOLimitedStack InvalidPush].! !

!OOStackLimitedTest methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 22:26:43'!
test02CanPushIfTheLimitIsReachedButIPopAnElement
	
	|limitedStack|
	limitedStack _ OOLimitedStack new.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack push: 'a'.
	limitedStack pop.
	limitedStack push: 'a'.
	self assert: limitedStack size = 5.! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:29:31'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack _ OOStack new.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:31:27'!
test02PushAddElementsToTheStack

	| stack |
	stack _ OOStack new.
	stack push: 'something'.
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:32:02'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack _ OOStack new.
	stack push: 'something'.
	stack pop.
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:33:35'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack _ OOStack new.
	pushedObject _ 'something'.
	stack push: pushedObject.
	self assert: stack pop = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:34:31'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	stack _ OOStack new.
	firstPushedObject _ 'first'.
	secondPushedObject _ 'second'.
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty.
	! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:35:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack _ OOStack new.
	pushedObject _ 'something'.
	stack push: pushedObject.
	self assert: stack top = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:36:05'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	stack _ OOStack new.
	pushedObject _ 'something'.
	stack push: pushedObject.
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:36:36'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	stack _ OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].
! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:37:13'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	stack _ OOStack new.
	stack push: 'something'.
	stack pop.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].! !

!OOStackTest methodsFor: 'test' stamp: 'SC 6/5/2021 16:40:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	stack _ OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ].
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testAuxiliary' stamp: 'NA 6/9/2021 21:38:01'!
createStackWithSentence: aSentence
	
	|anStack|
	anStack _ OOStack new.
	anStack push: aSentence.
	^anStack.! !

!SentenceFinderByPrefixTest methodsFor: 'testAuxiliary' stamp: 'NA 6/10/2021 00:28:49'!
thePrefix: aPrefix shouldBeOn: aStack times: aNumber
	
	|sentenceFinder timesRepetead|
	sentenceFinder _ SentenceFinderByPrefix with: aStack andAPrefix: aPrefix .
	timesRepetead _ (sentenceFinder find) size. 
	^timesRepetead = aNumber.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 20:54:03'!
test01IfThePrefixIsInTheStackItShouldBeFound
	
	|stack|
	stack _ self createStackWithSentence: 'las palabras mas importantes son las mas dificiles de decir'.
	self assert: (self thePrefix: 'las' shouldBeOn: stack times: 1).
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 21:04:41'!
test02IfThePrefixIsNotInTheStackItShouldNotBeFound
	
	|stack|
	stack _ self createStackWithSentence: 'conocerse a si mismo es estudiarse en accion con otra persona'.
	self assert: (self thePrefix: 'test' shouldBeOn: stack times: 0).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 21:04:45'!
test03IfTheWordToFindIsNotAPrefixItShouldNotBeFound
	
	|stack|
	stack _ self createStackWithSentence: 'el conocimiento te dara poder pero el caracter te dara respeto'.
	self assert: (self thePrefix: 'miento' shouldBeOn: stack times: 0).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 21:05:59'!
test04TheSentenceFinderShouldBeCaseSensitive
	
	|stack|
	stack _ self createStackWithSentence: 'Los programadores son los encargados de crear lo que las personas sueñan'.
	self assert: (self thePrefix: 'los' shouldBeOn: stack times: 0).
	self assert: (self thePrefix: 'Los' shouldBeOn: stack times: 1).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 21:14:18'!
test05TheStackRemainsTheSameAfterSearchForASentence
	
	|stack |
	stack _ self createStackWithSentence: 'El problema real'.
	stack push: 'No es si las maquinas piensan'.
	stack push: 'Si no si lo hacen los hombres'.
	self assert: (self thePrefix: 'No' shouldBeOn: stack times: 1).
	self assert: stack pop = 'Si no si lo hacen los hombres'.
	self assert: stack pop = 'No es si las maquinas piensan'.
	self assert: stack pop = 'El problema real'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/10/2021 00:45:47'!
test06CanNotCreateASentenceFinderWithAnInvalidStack
	
	|stack|
	stack _ nil.
	self
		should: [SentenceFinderByPrefix with: stack andAPrefix: 'a'.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix NullStackError].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/9/2021 22:36:56'!
test07ShouldSearchForAllTheMatchingSentences

	|stack |
	stack _ self createStackWithSentence: 'La tecnologia es un siervo util pero un amo peligroso'.
	stack push: 'La tecnologia se alimenta a si misma'.
	stack push: 'La tecnologia nos esta enseñando a ser humanos de nuevo'.
	self assert: (self thePrefix: 'La' shouldBeOn: stack times: 3). ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/10/2021 00:45:10'!
test08CanNotCreateASentenceFinderWithEmptyPrefix
	
	|stack|
	stack _ self createStackWithSentence: 'enseñar es dejar una huella'.
	stack push: 'en la vida de una persona'.
	self
		should: [SentenceFinderByPrefix with: stack andAPrefix: ''.]
			raise: Error
			withExceptionDo: [ :anError |
				self assert: anError messageText = SentenceFinderByPrefix InvalidPrefixToFind].
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/10/2021 00:44:08'!
test09CanNotCreateASentenceFinderWithPrefixThatOnlyContainsEmptySpaces
	
	|stack|
	stack _ self createStackWithSentence: 'Pablito clavo un clavito'.
	
	self
		should: [SentenceFinderByPrefix with: stack andAPrefix: ' ']
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix InvalidPrefixToFind].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/10/2021 00:43:38'!
test10CanNotCreateASentenceFinderWithPrefixThatStartWithAnEmptySpace
	
	|stack|
	stack _ self createStackWithSentence: 'Que clavito clavo Pablito'.
	self
		should: [SentenceFinderByPrefix with: stack andAPrefix: ' Que'.]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix InvalidPrefixToFind].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'NA 6/10/2021 01:00:56'!
test11NoSentenceIsFoundInAnEmptyStack
	
	|stack|
	stack _ OOStack new.
	self assert: (self thePrefix: 'ol' shouldBeOn: stack times: 0).! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'objectTope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'NA 6/9/2021 21:36:50'!
initialize
	
	objectTope _ OOStackObjectEmpty new.
! !


!OOStack methodsFor: 'features' stamp: 'NA 6/9/2021 21:36:55'!
isEmpty
	
	^ objectTope isEmptyObject.! !

!OOStack methodsFor: 'features' stamp: 'NA 6/9/2021 21:36:58'!
pop
	
	| aElement |
	aElement    _ objectTope topObject.
	objectTope _ objectTope nextObject.
	^aElement.! !

!OOStack methodsFor: 'features' stamp: 'NA 6/9/2021 21:37:01'!
push: element
	
	objectTope _ OOStackObjectNotEmpty with: element nextTo: objectTope . 
! !

!OOStack methodsFor: 'features' stamp: 'NA 6/9/2021 21:37:04'!
size
	
	^objectTope numberOfObjects.! !

!OOStack methodsFor: 'features' stamp: 'NA 6/9/2021 21:37:08'!
top
	
	^objectTope topObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'SC 6/5/2021 18:37:46'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 21:55:04'!
initialize
	
	maxSize _ 5.
	objectTope _ OOStackObjectEmpty new.! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 22:19:50'!
push: element
	
	(maxSize = self size) ifTrue: [^self error: OOLimitedStack InvalidPush].
	objectTope _ OOStackObjectNotEmpty with: element nextTo: objectTope. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 22:15:23'!
InvalidPush
	
	^'Can not push another element'.! !


!classDefinition: #OOStackObject category: 'Stack-Exercise'!
Object subclass: #OOStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObject methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:12'!
isEmptyObject
	
	^self subclassResponsibility.! !

!OOStackObject methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:16'!
numberOfObjects
	
	^ self subclassResponsibility.! !

!OOStackObject methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:19'!
topObject
	
	^self subclassResponsibility.! !


!classDefinition: #OOStackObjectEmpty category: 'Stack-Exercise'!
OOStackObject subclass: #OOStackObjectEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObjectEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:26'!
isEmptyObject
	
	^true.! !

!OOStackObjectEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:28'!
numberOfObjects
	
	^0.! !

!OOStackObjectEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:31'!
topObject
	
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackObjectNotEmpty category: 'Stack-Exercise'!
OOStackObject subclass: #OOStackObjectNotEmpty
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:34'!
isEmptyObject
	
	^false.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:38'!
nextObject
	
	^next.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:40'!
numberOfObjects
	
	^ 1 + self nextObject numberOfObjects.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'NA 6/9/2021 21:37:44'!
topObject
	
	^value! !


!OOStackObjectNotEmpty methodsFor: 'initialization' stamp: 'SC 6/8/2021 08:14:40'!
initializeObjectWith: element AndnNextTo: nextElement
	value _ element.
	next  _ nextElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackObjectNotEmpty class' category: 'Stack-Exercise'!
OOStackObjectNotEmpty class
	instanceVariableNames: ''!

!OOStackObjectNotEmpty class methodsFor: 'as yet unclassified' stamp: 'SC 6/8/2021 08:14:40'!
with: element nextTo: nextElement
	^self new initializeObjectWith: element AndnNextTo: nextElement.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'NA 6/10/2021 01:31:31'!
find
	
	|auxiliarStack wordToCompare collectionWithFilteredWords|
	auxiliarStack _ OOStack new.
	collectionWithFilteredWords _ OrderedCollection new.
	(stack size) timesRepeat: [
		wordToCompare _ stack pop.
		(wordToCompare beginsWith: prefix) ifTrue: [collectionWithFilteredWords add: wordToCompare].
		auxiliarStack push: wordToCompare].
	(auxiliarStack size) timesRepeat: [
		stack push: (auxiliarStack pop)].
	^collectionWithFilteredWords.
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'NA 6/10/2021 00:27:20'!
initializeWith: aStack andPrefix: aPrefix
	
	stack _ aStack.
	prefix _ aPrefix.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 22:28:53'!
InvalidPrefixToFind
	
	^'The Prefix is empty or have white spaces'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/9/2021 20:10:26'!
NullStackError
	
	^'The Stack is not valid'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/10/2021 17:51:21'!
validatePrefix: aPrefix
	"Estos if se podrian quitar con la creacion de subclases que representan al prefijo vacio, con espacios y al prefijo valido
	En este caso particular lo consideramos innecesario para el modelo que queremos representar ya que agregaria complejidad
	innecesaria y no se ajustaria de manera adecuada, parecido a los casos base de fibonacci en el ejercicio anterior"
	
	aPrefix isEmpty ifTrue: [^self error: SentenceFinderByPrefix InvalidPrefixToFind].
	(aPrefix findString: ' ') = 0 ifFalse:[^self error: SentenceFinderByPrefix InvalidPrefixToFind].! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/10/2021 00:33:19'!
validateStack: aStack
	
	aStack ifNil: [^self error: SentenceFinderByPrefix NullStackError].
	
	! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/10/2021 00:32:06'!
with: aStack andAPrefix: aPrefix
	
	self validatePrefix: aPrefix.
	self validateStack: aStack.
	^self new initializeWith: aStack andPrefix: aPrefix.! !
