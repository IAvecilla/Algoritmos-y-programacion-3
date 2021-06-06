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


!classDefinition: #ContentWithinTheStack category: 'Stack-Exercise'!
Object subclass: #ContentWithinTheStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ContentWithinTheStack methodsFor: 'private' stamp: 'SC 6/5/2021 19:59:43'!
myContentIsEmpty

	self subclassResponsibility.! !

!ContentWithinTheStack methodsFor: 'private' stamp: 'SC 6/5/2021 20:09:16'!
pop
	^ self subclassResponsibility.! !

!ContentWithinTheStack methodsFor: 'private' stamp: 'SC 6/5/2021 20:44:16'!
size
	^ self subclassResponsibility.! !

!ContentWithinTheStack methodsFor: 'private' stamp: 'SC 6/5/2021 19:35:02'!
top
	^self subclassResponsibility.! !


!classDefinition: #ContentWithinTheStackIsEmpty category: 'Stack-Exercise'!
ContentWithinTheStack subclass: #ContentWithinTheStackIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!



!classDefinition: #ContentWithinTheStackIsNotEmpty category: 'Stack-Exercise'!
ContentWithinTheStack subclass: #ContentWithinTheStackIsNotEmpty
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ContentWithinTheStackIsNotEmpty class' category: 'Stack-Exercise'!
ContentWithinTheStackIsNotEmpty class
	instanceVariableNames: ''!

!ContentWithinTheStackIsNotEmpty class methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 20:18:23'!
with: content
	^self new initalizeWith: content.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content collection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 21:36:58'!
initialize
	collection _ OrderedCollection new.
! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 21:25:44'!
isEmpty
	^ collection isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 17:01:38'!
pop

	collection isEmpty ifTrue: [
		self error: OOStack stackEmptyErrorDescription ].
	^collection removeLast.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 21:40:07'!
push: pushContent
	collection addLast: pushContent.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 21:45:23'!
size
	^ collection size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SC 6/5/2021 17:03:01'!
top
	
	collection isEmpty ifTrue: [
		self error: OOStack stackEmptyErrorDescription ].
	^collection last.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'SC 6/5/2021 18:37:46'!
stackEmptyErrorDescription

	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
