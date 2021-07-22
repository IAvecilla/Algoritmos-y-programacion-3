!classDefinition: #MarsRoverLogTest category: 'MarsRover-Solucion'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:12:09'!
test01aLoggerWithRoverWithNoCommandsHasAnEmptyLog
	
	|marsRover marsRoverLogger|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addAPositionObserver: marsRoverLogger.
	
	self assert: #() asOrderedCollection equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:12:46'!
test02aLoggerHaveOnePositionChangeOfTheRover
	
	|marsRover marsRoverLogger expectedLog|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addPositionLogger: marsRoverLogger.
	marsRover processCommands: 'f'.
	expectedLog := OrderedCollection with: 0@1.
	
	self assert: expectedLog equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:13:12'!
test03ALoggerHaveManyPositionChangesOfTheRover
	
	|marsRover marsRoverLogger expectedLog|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addPositionLogger: marsRoverLogger.
	marsRover processCommands: 'flb'.
	expectedLog := OrderedCollection with: 0@1 with: 1@1.
	
	self assert: expectedLog equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:13:35'!
test04ALoggerHaveOneHeadingChangeOfTheRover
	
	|marsRover marsRoverLogger expectedLog|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addHeadingLogger: marsRoverLogger.
	marsRover processCommands: 'l'.
	expectedLog := OrderedCollection with: 'Facing West'.
	
	self assert: expectedLog equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:13:54'!
test05ALoggerHaveManyHeadingChangesOfTheRover
	
	|marsRover marsRoverLogger expectedLog|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addHeadingLogger: marsRoverLogger.
	marsRover processCommands: 'll'.
	expectedLog := OrderedCollection with: 'Facing West' with: 'Facing South'.
	
	self assert: expectedLog equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:14:25'!
test06ALoggerHaveHeadingAndPositionsChangesInItsLog
	
	|marsRover marsRoverLogger expectedLog|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverLogger := MarsRoverLogger new.
	marsRover addHeadingLogger: marsRoverLogger.
	marsRover addPositionLogger: marsRoverLogger.
	marsRover processCommands: 'flfr'.
	expectedLog := OrderedCollection with: 0@1 with: 'Facing West' with: -1@1 with: 'Facing North'.
	
	self assert: expectedLog equals: marsRoverLogger log.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:14:51'!
test07AWindowWithNoCommandsHasEmptyStatus
	
	|marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addHeadingLogger: marsRoverWindow.
	
	self assert: '' equals: marsRoverWindow viewPositionStatus.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:15:10'!
test08AWindowHasTheStatusOfActualPosition
	
	|marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addPositionLogger: marsRoverWindow.
	marsRover processCommands: 'f'.
	
	
	self assert: 0@1 equals: marsRoverWindow viewPositionStatus.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:15:29'!
test09AWindowHaveTheLastPositionStatus
	
	|marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addPositionLogger: marsRoverWindow.
	marsRover processCommands: 'fff'.
	
	
	self assert: 0@3 equals: marsRoverWindow viewPositionStatus.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:15:44'!
test10AWindowHasTheStatusOfTheActualHeading
	
	|marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addHeadingLogger: marsRoverWindow.
	marsRover processCommands: 'l'.
	
	
	self assert: 'Facing West' equals: marsRoverWindow viewHeadingStatus.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:16:05'!
test11AWindowHasTheStatusOfTheActualHeadingAndActualPosition
	
	|marsRover marsRoverWindow|
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	marsRoverWindow := MarsRoverWindow new.
	marsRover addPositionLogger: marsRoverWindow.
	marsRover addHeadingLogger: marsRoverWindow.
	marsRover processCommands: 'ffrb'.
	
	self assert: 'Facing East' equals: marsRoverWindow viewHeadingStatus.
	self assert: -1@2 equals: marsRoverWindow viewPositionStatus.! !


!classDefinition: #TestMarsRover category: 'MarsRover-Solucion'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:42:57'!
test01MarsRoverDoestNotMoveWhenNoCommandsAreSent

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: '' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:05'!
test02RoverFacingNorthCanMoveForward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'f' endsAt: 0@1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:13'!
test03RoverFacingNorthCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'b' endsAt: 0@-1 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:24'!
test04RoverFacingNorthHeadsEastAfterTurningRight

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'r' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:43:55'!
test05RoverFacingNorthHeadsWestAfterTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'l' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:26'!
test06RoverFacingEastHeadsSouthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'r' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:44:43'!
test07RoverFacingSouthHeadsWestWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'r' endsAt: 0@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:00'!
test08RoverFacingWestHeadsNorthWhenTurningRight
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'r' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:20'!
test09RoverFacingEastHeadsNorthWhenTurningLeft
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'l' endsAt: 0@0 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:45:52'!
test10RoverFacingSouthHeadsEastWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'l' endsAt: 0@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:46:17'!
test11RoverFacingWestHeadsSouthWhenTurningLeft

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'l' endsAt: 0@0 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:36'!
test12RoverFacingEastCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'f' endsAt: 1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:47:55'!
test13RoverFacingEastCanMoveBackwards

	self assertRoverStartingAt: 0@0 heading: #East afterProcessing: 'b' endsAt: -1@0 heading: #East! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:20'!
test14RoverFacingSouthCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'f' endsAt: 0@-1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:48:38'!
test15RoverFacingSouthCanMoveBackward
	
	self assertRoverStartingAt: 0@0 heading: #South afterProcessing: 'b' endsAt: 0@1 heading: #South! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:10'!
test16RoverFacingWestCanMoveForward
	
	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'f' endsAt: -1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:49:46'!
test17RoverFacingWestCanMoveBackward

	self assertRoverStartingAt: 0@0 heading: #West afterProcessing: 'b' endsAt: 1@0 heading: #West! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 7/1/2021 00:50:56'!
test18RoverCanProcessMultipleCommands

	self assertRoverStartingAt: 0@0 heading: #North afterProcessing: 'ff' endsAt: 0@2 heading: #North! !

!TestMarsRover methodsFor: 'tdd tests' stamp: 'LL 6/30/2021 16:05:43'!
test19RoverStopsWhenProcessingAnInvalidCommand

	| marsRover |
	marsRover := MarsRover startingAt: 0@0 heading: #North.
	
	self should: [ marsRover processCommands: 'fxf' ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: marsRover invalidCommandErrorMessage.
			self assert: (marsRover isAt: 0@1 heading: #North).
		].
	
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LL 7/1/2021 00:42:36'!
assertRoverStartingAt: aPosition heading: aCardinalPoint afterProcessing: aStringOfCommands endsAt: aFinalPosition heading: aFinalCardinalPoint

	| marsRover |
	marsRover := MarsRover startingAt: aPosition heading: aCardinalPoint.
	
	marsRover processCommands: aStringOfCommands.
	
	self assert: (marsRover isAt: aFinalPosition heading: aFinalCardinalPoint)! !


!classDefinition: #MarsRover category: 'MarsRover-Solucion'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRover methodsFor: 'initialization' stamp: 'NA 7/22/2021 02:06:15'!
initializeStartingAt: aPosition heading: aCardinalPoint 
	
	position := ObserverProxy initializeProxeeWith: aPosition andSelectorForUpdate: #updatePositionLog:.
	head := ObserverProxy initializeProxeeWith: (MarsRoverHead of: self facing: aCardinalPoint) andSelectorForUpdate: #updateHeadingLog:.

	! !


!MarsRover methodsFor: 'process commands' stamp: 'LL 6/30/2021 15:54:14'!
processCommands: aStringWithCommands

	aStringWithCommands do: [ :aCommand | 
		self assertCommandIsValid: aCommand.
		self processCommand: aCommand.
	].
	
! !


!MarsRover methodsFor: 'testing' stamp: 'NA 7/22/2021 01:55:29'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ head isHeading: aCardinalPoint]! !


!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:54:11'!
assertCommandIsValid: aCommand

	^ (self isInvalidCommand: aCommand) ifTrue: [ self error: self invalidCommandErrorMessage ]! !

!MarsRover methodsFor: 'private - process commands' stamp: 'LL 6/30/2021 15:48:06'!
invalidCommandErrorMessage

	^'Invalid command'! !

!MarsRover methodsFor: 'private - process commands' stamp: 'NA 7/22/2021 01:52:04'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ head movingForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ head movingBackwards ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ head rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ head rotateLeft ].
! !


!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:42'!
isBackwardCommand: command

	^ command = $b! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:26:27'!
isForwardCommand: command

	^ command = $f! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:51:21'!
isInvalidCommand: aCommand
	^(self isForwardCommand: aCommand) not and: 
		[ (self isBackwardCommand: aCommand) not and: 
			[ (self isRotateRightCommand: aCommand) not and: 
				[ (self isRotateLeftCommand: aCommand) not ] ] ]! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:50:53'!
isRotateLeftCommand: command

	^ command = $l! !

!MarsRover methodsFor: 'private - commands' stamp: 'LL 6/30/2021 15:27:33'!
isRotateRightCommand: command

	^ command = $r! !


!MarsRover methodsFor: 'dd - moving' stamp: 'NA 7/21/2021 00:00:19'!
moveDown
	
	self step: (0@-1).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'NA 7/21/2021 00:00:30'!
moveLeft

	self step: (-1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'NA 7/21/2021 00:00:39'!
moveRight

	self step: (1@0).! !

!MarsRover methodsFor: 'dd - moving' stamp: 'NA 7/21/2021 00:00:48'!
moveUp

	self step: (0@1).! !


!MarsRover methodsFor: 'dd - heading' stamp: 'NA 7/21/2021 00:01:56'!
headEast

	self headingTo: (MarsRoverHeadFacingEast of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'NA 7/21/2021 00:02:15'!
headNorth

	self headingTo: (MarsRoverHeadFacingNorth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'NA 7/21/2021 00:02:26'!
headSouth

	self headingTo: (MarsRoverHeadFacingSouth of: self).! !

!MarsRover methodsFor: 'dd - heading' stamp: 'NA 7/21/2021 00:02:36'!
headWest

	self headingTo: (MarsRoverHeadFacingWest of: self).! !


!MarsRover methodsFor: 'logging' stamp: 'NA 7/20/2021 15:03:33'!
addHeadingLogger: aHeadingLogger
	
	self addAHeadingObserver: aHeadingLogger.! !

!MarsRover methodsFor: 'logging' stamp: 'NA 7/20/2021 18:27:09'!
addPositionLogger: aPositionLogger
	
	self addAPositionObserver: aPositionLogger.! !


!MarsRover methodsFor: 'private - Observers' stamp: 'NA 7/21/2021 00:56:16'!
addAHeadingObserver: aHeadingObserver
	
	head addNewObserver: aHeadingObserver.! !

!MarsRover methodsFor: 'private - Observers' stamp: 'NA 7/21/2021 00:55:49'!
addAPositionObserver: aPositionObserver
	
	position addNewObserver: aPositionObserver.! !


!MarsRover methodsFor: 'moving private' stamp: 'NA 7/22/2021 01:52:08'!
step: aCoordinate
	
	position updateWith: (position + aCoordinate).! !


!MarsRover methodsFor: 'heading private' stamp: 'NA 7/21/2021 00:55:56'!
headingTo: aNewOrientation
	
	head updateWith: aNewOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Solucion'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 13:30:13'!
startingAt: aPoint heading: aCardinalPoint 
	
	^self new initializeStartingAt: aPoint heading: aCardinalPoint ! !


!classDefinition: #MarsRoverHead category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverHead
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:17:57'!
initializeOf: aMarsRover

	marsRover := aMarsRover! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
isHeading: aCardinalPoint

	^self class whenFacing: aCardinalPoint

	! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:01:49'!
logOrientationTo: aLogger
	
	self subclassResponsibility.! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:46'!
rotateLeft

	self subclassResponsibility! !

!MarsRoverHead methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 16:36:43'!
rotateRight

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHead class' category: 'MarsRover-Solucion'!
MarsRoverHead class
	instanceVariableNames: ''!

!MarsRoverHead class methodsFor: 'testing' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	self subclassResponsibility.! !


!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 16:16:27'!
of: aMarsRover

	^self new initializeOf: aMarsRover! !

!MarsRoverHead class methodsFor: 'instance creation' stamp: 'LL 6/30/2021 19:46:37'!
of: aMarsRover facing: aCardinalPoint
	
	| headingSubclass |
	headingSubclass := self subclasses detect: [ :aHeadingSubclass | aHeadingSubclass whenFacing: aCardinalPoint ].
	
	^headingSubclass of: aMarsRover.! !


!classDefinition: #MarsRoverHeadFacingEast category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
logOrientationTo: aLogger
	
	aLogger updateLogWithNewHeading: 'Facing East'.! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveLeft.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveRight.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:22'!
rotateLeft

	^marsRover headNorth.

	! !

!MarsRoverHeadFacingEast methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:14'!
rotateRight

	^marsRover headSouth.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingEast class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingEast class
	instanceVariableNames: ''!

!MarsRoverHeadFacingEast class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #East! !


!classDefinition: #MarsRoverHeadFacingNorth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
logOrientationTo: aLogger
	
	aLogger updateLogWithNewHeading: 'Facing North'.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveDown.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveUp.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:33'!
rotateLeft

	^marsRover headWest.! !

!MarsRoverHeadFacingNorth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:10:58'!
rotateRight

	^marsRover headEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingNorth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingNorth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #North! !


!classDefinition: #MarsRoverHeadFacingSouth category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
logOrientationTo: aLogger
	
	aLogger updateLogWithNewHeading: 'Facing South'.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveUp.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveDown! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:43'!
rotateLeft

	^marsRover headEast.! !

!MarsRoverHeadFacingSouth methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:30'!
rotateRight

	^marsRover headWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingSouth class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadFacingSouth class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #South! !


!classDefinition: #MarsRoverHeadFacingWest category: 'MarsRover-Solucion'!
MarsRoverHead subclass: #MarsRoverHeadFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
logOrientationTo: aLogger
	
	aLogger updateLogWithNewHeading: 'Facing West'.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:36'!
movingBackwards

	^marsRover moveRight.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:48:47'!
movingForward

	^marsRover moveLeft.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:06:52'!
rotateLeft

	^marsRover headSouth.! !

!MarsRoverHeadFacingWest methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 17:12:44'!
rotateRight

	^marsRover headNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadFacingWest class' category: 'MarsRover-Solucion'!
MarsRoverHeadFacingWest class
	instanceVariableNames: ''!

!MarsRoverHeadFacingWest class methodsFor: 'as yet unclassified' stamp: 'LL 6/30/2021 19:46:16'!
whenFacing: aCardinalPoint

	^aCardinalPoint = #West! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverLogger
	instanceVariableNames: 'logFile'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:19:11'!
initialize
	
	logFile := OrderedCollection new.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:08:19'!
log
	
	^logFile.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:02:53'!
updateHeadingLog: aHeading
	
	aHeading logOrientationTo: self.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
updateLogWithNewHeading: aHeadingOrientation
	
	logFile add: aHeadingOrientation.! !

!MarsRoverLogger methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:18:25'!
updatePositionLog: aPosition
	
	logFile add: aPosition.! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-Solucion'!
Object subclass: #MarsRoverWindow
	instanceVariableNames: 'heading position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:19:24'!
initialize
	
	heading := ''.
	position := ''.
	! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:13'!
updateHeadingLog: aHeading
	
	aHeading logOrientationTo: self.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 23:03:41'!
updateLogWithNewHeading: aHeadingOrientation
	
	heading := aHeadingOrientation.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/19/2021 22:27:05'!
updatePositionLog: aPosition
	
	position := aPosition.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:17:03'!
viewHeadingStatus
	
	^heading.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 15:17:16'!
viewPositionStatus
	
	^position.! !


!classDefinition: #ObserverProxy category: 'MarsRover-Solucion'!
ProtoObject subclass: #ObserverProxy
	instanceVariableNames: 'proxee selectorForUpdate observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Solucion'!

!ObserverProxy methodsFor: 'as yet unclassified' stamp: 'NA 7/20/2021 23:50:35'!
addNewObserver: anObserver
	
	observers add: anObserver.! !

!ObserverProxy methodsFor: 'as yet unclassified' stamp: 'NA 7/22/2021 01:52:35'!
doesNotUnderstand: aMessage
	
	^aMessage sendTo: proxee.! !

!ObserverProxy methodsFor: 'as yet unclassified' stamp: 'NA 7/22/2021 02:05:23'!
initializeProxeeWith: aProxeeInitialization andSelectorForUpdate: anUpdateClosure.
	
	proxee := aProxeeInitialization.
	selectorForUpdate := anUpdateClosure.
	observers := OrderedCollection new.! !

!ObserverProxy methodsFor: 'as yet unclassified' stamp: 'NA 7/22/2021 02:04:00'!
notifyChange
	
	observers do: [:anObserver | selectorForUpdate sendTo: anObserver with: proxee].! !

!ObserverProxy methodsFor: 'as yet unclassified' stamp: 'NA 7/21/2021 00:09:28'!
updateWith: aNewProxee
	
	proxee := aNewProxee.
	self notifyChange.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObserverProxy class' category: 'MarsRover-Solucion'!
ObserverProxy class
	instanceVariableNames: ''!

!ObserverProxy class methodsFor: 'as yet unclassified' stamp: 'NA 7/22/2021 02:05:23'!
initializeProxeeWith: aProxeeInitialization andSelectorForUpdate: anUpdateClosure
	
	^self new initializeProxeeWith: aProxeeInitialization andSelectorForUpdate: anUpdateClosure.! !
