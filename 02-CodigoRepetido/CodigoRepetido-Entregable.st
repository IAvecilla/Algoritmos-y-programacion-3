!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 18:58:20'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook addAction customerName |
	customerBook _ CustomerBook new.
	customerName _ 'Jhon Lennon'.
	addAction _ [customerBook addCustomerNamed: customerName].
	self assert: (self timeRequiredToDo: addAction shouldBeLessThan: 50 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 18:59:31'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook removeAction customerName|
	customerName _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: customerName .
	removeAction _ [self removeCustomerFromCustomerBook: customerBook customerName: customerName].
	self assert: (self timeRequiredToDo: removeAction shouldBeLessThan: 100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:13:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook addEmptyCustomer generalError customerBookError|	
	customerBook _ CustomerBook new.
	addEmptyCustomer _ [customerBook addCustomerNamed: ''].
	customerBookError _ CustomerBook customerCanNotBeEmptyErrorMessage.
	generalError _ Error.
	self tryAction: addEmptyCustomer catchError: generalError withMessage: customerBookError 
	andTest: [customerBook  isEmpty].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:19:33'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook customerName actionRemoveCustomer notFoundError|
	customerName _ 'Jhon Lennon'.
	customerBook _ self createACustomerBookWithACustomerName: customerName.
	actionRemoveCustomer _ [customerBook removeCustomerNamed: 'Paul McCartney'].
	notFoundError _ NotFound.
	
	self tryAction: actionRemoveCustomer catchError: notFoundError assertThatNumberOfCostumersIs: 1 andIncludesCustomerNamed: customerName 
	inCustomerBook: customerBook.
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:28:28'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook customerName|
	customerName _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: customerName.
	customerBook suspendCustomerNamed: customerName.
	self checkThatValueOfActiveCustomersIsEqualTo: 0 andValueOfSuspendedCustomersIsEqualTo: 1 
	andValueOfTotalCustomersIsEqualTo: 	1 inCustomerBook: customerBook.
	self assert: (customerBook includesCustomerNamed: customerName).
	
	
	
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:51:42'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook customerName|
	
	customerName _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: customerName.
	customerBook suspendCustomerNamed: customerName.

	self removeCustomerFromCustomerBook:  customerBook customerName: customerName.
	self checkThatValueOfActiveCustomersIsEqualTo: 0 andValueOfSuspendedCustomersIsEqualTo: 0        
	andValueOfTotalCustomersIsEqualTo: 	0 inCustomerBook: customerBook.
	self deny: (customerBook includesCustomerNamed: customerName).

	


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:53:58'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook customerName actionSuspendCustomer cantSuspendError|
			
	customerName _ 'John Lennon'.
	customerBook _ self createACustomerBookWithACustomerName: customerName.
	actionSuspendCustomer _ [customerBook suspendCustomerNamed: 'Ringo Starr'].
	cantSuspendError _ CantSuspend.
	
	self tryAction: actionSuspendCustomer catchError: cantSuspendError assertThatNumberOfCostumersIs: 1 andIncludesCustomerNamed: customerName 
	inCustomerBook: customerBook.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/19/2021 19:55:46'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook customerName actionSuspendCustomer cantSuspendError|
			
	customerName _ 'John Lennon'.
	customerBook _ self createACustomerBookWithACustomerName: customerName .
	customerBook suspendCustomerNamed: customerName .
	actionSuspendCustomer _ [customerBook suspendCustomerNamed: customerName ].
	cantSuspendError _ CantSuspend.
	
	self tryAction: actionSuspendCustomer catchError: cantSuspendError assertThatNumberOfCostumersIs: 1 andIncludesCustomerNamed: customerName 
	inCustomerBook: customerBook.
	
	
! !


!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/19/2021 18:47:54'!
checkThatValueOfActiveCustomersIsEqualTo: activeQuantity andValueOfSuspendedCustomersIsEqualTo: suspendedQuantity andValueOfTotalCustomersIsEqualTo: totalQuantity inCustomerBook: aCustomerBook.
	
	self assert: activeQuantity equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedQuantity equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalQuantity equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/19/2021 19:59:22'!
createACustomerBookWithACustomerName: customerName
	
	| customerBook |
	customerBook _ CustomerBook new.
	^ customerBook addCustomerNamed: customerName.
	! !

!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/19/2021 19:58:45'!
removeCustomerFromCustomerBook: aCustomerBook customerName: customerName.
 	
	^aCustomerBook removeCustomerNamed: customerName.! !

!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/19/2021 18:56:50'!
timeRequiredToDo: anAction shouldBeLessThan: timeAmount
	
	|timeSpended|
	timeSpended _ anAction timeToRun.
	^ (timeSpended) < (timeAmount).! !

!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/18/2021 21:48:38'!
tryAction: anAction catchError: anErrorToCatch assertThatNumberOfCostumersIs: aNumberOfCustomers andIncludesCustomerNamed: aCustomerName inCustomerBook: aCustomerBook

	[anAction value.
	self fail ]
		on: anErrorToCatch 
		do: [	self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aCustomerName)].! !

!CustomerBookTest methodsFor: 'resourcesForTests' stamp: 'NA 5/19/2021 19:56:58'!
tryAction: anAction catchError: generalError withMessage: messageClassError andTest: anActionToTest

	[anAction value.
	self fail ]
		on: generalError 
		do: [:anError |
			self assert: anError messageText = messageClassError.
			self assert: anActionToTest value].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'NA 5/19/2021 20:04:37'!
initialize

	active _ OrderedCollection new.
	suspended _ OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NA 5/19/2021 20:26:43'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [self signalCustomerNameCannotBeEmpty].
	(self includesCustomerNamed: aName) ifTrue: [self signalCustomerAlreadyExists].
	active add: aName.
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'NA 5/17/2021 20:10:05'!
removeCustomerNamed: aName 
 	
	active remove: aName ifAbsent:[suspended remove: aName ifAbsent: [^NotFound signal]].
	^aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NA 5/19/2021 20:30:29'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	suspended add: aName.
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NA 5/19/2021 20:05:14'!
numberOfActiveCustomers
	
	^active size.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NA 5/19/2021 20:05:28'!
numberOfCustomers
	
	^active size + suspended size.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NA 5/19/2021 20:05:35'!
numberOfSuspendedCustomers
	
	^suspended size.! !


!CustomerBook methodsFor: 'testing' stamp: 'NA 5/19/2021 20:04:59'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ].! !

!CustomerBook methodsFor: 'testing' stamp: 'NA 5/19/2021 20:05:06'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ].! !


!CustomerBook methodsFor: 'signal errors' stamp: 'NA 5/19/2021 20:05:46'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage.! !

!CustomerBook methodsFor: 'signal errors' stamp: 'NA 5/19/2021 20:05:54'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
