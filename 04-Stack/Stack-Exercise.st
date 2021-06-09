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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 21:32:02'!
test01IfTheWordIsInTheStackItShouldBeFounded
	
	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'palabra'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'pala' inStack: stack. 
	self assert: collectionOfWords size = 1.
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 21:31:51'!
test02IfTheWordIsNotInTheStackItShouldNotBeFounded
	
	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'palabra'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'test' inStack: stack. 
	self assert: collectionOfWords size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 21:32:38'!
test03IfTheWordToFindIsNotAPrefixItShouldNotBeFounded
	
	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'palabra'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'abra' inStack: stack. 
	self assert: collectionOfWords size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 22:01:19'!
test04TheSentenceFinderShouldBeCaseSensitive
	
	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'Palabra'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'pala' inStack: stack. 
	self assert: collectionOfWords size = 0.
	
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'Pala' inStack: stack. 
	self assert: collectionOfWords size = 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 22:26:01'!
test05TheStackRemainsTheSameAfterSearchForAWord
	
	|stack wordFinder|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'Palabra'.
	stack push: 'Test'.
	stack push: 'Otro'.
	wordFinder findSentenceWithPrefix: 'Te' inStack: stack. 
	self assert: stack size = 3.
	self assert: stack pop = 'Otro'.
	self assert: stack pop = 'Test'.
	self assert: stack pop = 'Palabra'.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 22:47:27'!
test06CanNotFindAWordWithAnInvalidStack
	
	|stack wordFinder|
	stack _ nil.
	wordFinder _ SentenceFinderByPrefix new.
	self
		should: [ wordFinder findSentenceWithPrefix: 'ho' inStack: stack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix NullStackError].
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 22:58:17'!
test07ShouldSearchForAllTheMatchingWords

	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'Palabra'.
	stack push: 'Pala'.
	stack push: 'Palo'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: 'Pa' inStack: stack. 
	
	self assert: collectionOfWords size =  3.
	self assert: (collectionOfWords indexOf: 'Palabra') = 3.
	self assert: (collectionOfWords indexOf: 'Pala') = 2.
	self assert: (collectionOfWords indexOf: 'Palo') = 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 23:00:15'!
test08NoMatchesForEmptyWord
	
	|stack wordFinder collectionOfWords|
	stack _ OOStack new.
	wordFinder _ SentenceFinderByPrefix new.
	stack push: 'Palabra'.
	stack push: 'Test'.
	collectionOfWords _ wordFinder findSentenceWithPrefix: '' inStack: stack.
	self assert: collectionOfWords size = 0.
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'objectTope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'SC 6/7/2021 22:58:22'!
initialize
	objectTope _ OOStackObjectEmpty new.
! !


!OOStack methodsFor: 'features' stamp: 'SC 6/7/2021 20:11:40'!
isEmpty
	^ objectTope isEmptyObject.! !

!OOStack methodsFor: 'features' stamp: 'SC 6/8/2021 08:10:45'!
pop
	| aElement |
	aElement    _ objectTope topObject.
	objectTope _ objectTope nextObject.
	^aElement.! !

!OOStack methodsFor: 'features' stamp: 'SC 6/7/2021 22:59:28'!
push: element
	objectTope _ OOStackObjectNotEmpty with: element nextTo: objectTope . 
! !

!OOStack methodsFor: 'features' stamp: 'SC 6/8/2021 08:09:40'!
size
	^objectTope numberOfObjects.! !

!OOStack methodsFor: 'features' stamp: 'SC 6/7/2021 20:36:29'!
top
	^objectTope topObject.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'SC 6/5/2021 18:37:46'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #OOStackObject category: 'Stack-Exercise'!
Object subclass: #OOStackObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObject methodsFor: 'private' stamp: 'SC 6/7/2021 20:06:44'!
isEmptyObject
	^self subclassResponsibility.! !

!OOStackObject methodsFor: 'private' stamp: 'SC 6/8/2021 08:09:40'!
numberOfObjects
	^ self subclassResponsibility.! !

!OOStackObject methodsFor: 'private' stamp: 'SC 6/7/2021 20:18:39'!
topObject
	^self subclassResponsibility.! !


!classDefinition: #OOStackObjectEmpty category: 'Stack-Exercise'!
OOStackObject subclass: #OOStackObjectEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObjectEmpty methodsFor: 'private' stamp: 'SC 6/7/2021 20:05:50'!
isEmptyObject
	^true.! !

!OOStackObjectEmpty methodsFor: 'private' stamp: 'SC 6/8/2021 08:09:40'!
numberOfObjects
	^0.! !

!OOStackObjectEmpty methodsFor: 'private' stamp: 'NA 6/8/2021 19:55:02'!
topObject
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackObjectNotEmpty category: 'Stack-Exercise'!
OOStackObject subclass: #OOStackObjectNotEmpty
	instanceVariableNames: 'value next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'SC 6/7/2021 20:07:18'!
isEmptyObject
	^false.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'SC 6/8/2021 08:10:45'!
nextObject
	^next.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'SC 6/8/2021 08:10:45'!
numberOfObjects
	^ 1 + self nextObject numberOfObjects.! !

!OOStackObjectNotEmpty methodsFor: 'private' stamp: 'SC 6/7/2021 20:30:55'!
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 23:04:16'!
findSentenceWithPrefix: aPrefix inStack: aStack
	
	|auxiliarStack wordToCompare collectionWithFilteredWords|
	aStack ifNil: [^self error: SentenceFinderByPrefix NullStackError].
	auxiliarStack _ OOStack new.
	collectionWithFilteredWords _ OrderedCollection new.
	aPrefix isEmpty ifTrue: [^collectionWithFilteredWords].
	
	(aStack size) timesRepeat: [
		wordToCompare _ aStack pop.
		(wordToCompare beginsWith: aPrefix) ifTrue: [collectionWithFilteredWords add: wordToCompare].
		auxiliarStack push: wordToCompare].
	
	(auxiliarStack size) timesRepeat: [
		aStack push: (auxiliarStack pop)].
	
	^collectionWithFilteredWords.
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'NA 6/8/2021 22:33:56'!
NullStackError
	
	^'El Stack no es valido'! !
