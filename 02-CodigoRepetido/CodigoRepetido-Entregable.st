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

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 23:03:01'!
CheckThatValueOfActiveCustomersIsEqualTo: activeQuantity andValueOfSuspendedCustomersIsEqualTo: suspendedQuantity andValueOfSuspendedCustomersIsEqualTo: totalQuantity inCustomerBook: aCustomerBook.
	
	self assert: activeQuantity equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedQuantity equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: totalQuantity equals: aCustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 19:42:39'!
createACustomerBookWithACustomerName: aCustomer
	
	| customerBook |
	customerBook _ CustomerBook new.
	^ customerBook addCustomerNamed: aCustomer.
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 22:31:55'!
removeCustomerFromCustomerBook: aCustomerBook customerName: aCustomer.
 	^aCustomerBook removeCustomerNamed: aCustomer.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 22:33:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	|customerBook actionToTest customerName|
	customerBook _ CustomerBook new.
	customerName _ 'Jhon Lennon'.
	actionToTest _ [customerBook addCustomerNamed: customerName].
	self assert: (self timeRequiredToDo: actionToTest inTime: 50 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 22:39:44'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook actionToTest customerName|
	customerName _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: customerName .
	actionToTest _ [self removeCustomerFromCustomerBook: customerBook customerName: customerName].
	self assert: (self timeRequiredToDo: actionToTest inTime: 100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 23:15:59'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 22:38:40'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook customerName|
	
	customerName _ 'Jhon Lennon'.
	customerBook _ self createACustomerBookWithACustomerName: customerName.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customerName)].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 23:13:03'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook aCustomer|
	
	aCustomer _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	self CheckThatValueOfActiveCustomersIsEqualTo: 0 andValueOfSuspendedCustomersIsEqualTo: 1 
	andValueOfSuspendedCustomersIsEqualTo: 	1 inCustomerBook: customerBook.
	
	self assert: (customerBook includesCustomerNamed: aCustomer).
	
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 23:21:11'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook aCustomer|
	
	aCustomer _ 'Paul McCartney'.
	customerBook _ self createACustomerBookWithACustomerName: aCustomer.
	customerBook suspendCustomerNamed: aCustomer.
	self removeCustomerFromCustomerBook:  customerBook customerName: aCustomer.
	self CheckThatValueOfActiveCustomersIsEqualTo: 0 andValueOfSuspendedCustomersIsEqualTo: 0        
	andValueOfSuspendedCustomersIsEqualTo: 	0 inCustomerBook: customerBook.
	self deny: (customerBook includesCustomerNamed: aCustomer).

	


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 4/30/2020 09:08:46'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NR 9/19/2018 17:57:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'NA 5/17/2021 19:45:58'!
timeRequiredToDo: anAction inTime: timeAmount
	
	|timeSpended|
	timeSpended _ anAction timeToRun.
	^ (timeSpended) < (timeAmount).
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NA 5/17/2021 20:10:05'!
removeCustomerNamed: aName 
 	
	active remove: aName ifAbsent:[suspended remove: aName ifAbsent: [^NotFound signal]].
	^aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

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
