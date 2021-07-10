!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 13:08:19'!
test01PortfolioWithoutAccountHasABalanceOfZero

	self assert: self porfolioNew balance equals: 0.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 17:54:11'!
test02BalanceOfAPortfolioWithOneAccountIsTheBalanceOfTheAccount

	|newAccount|
	newAccount _ self accountWithDeposit: 100*peso.
	self assert: newAccount balance equals: (Portfolio with: newAccount) balance.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 18:05:42'!
test03BalanceOfAPortfolioWithManyAccountsIsTheSumOfTheBalanceOfTheAccounts
	|firstAccount secondAccount newPortfolio|
	firstAccount _ self accountWithDeposit: 100*peso.
	secondAccount _ self accountWithDeposit: 200*peso.
	newPortfolio 	_ Portfolio with: firstAccount andWith: secondAccount.
	^self assert: newPortfolio balance equals: secondAccount balance + firstAccount balance.
! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 19:17:46'!
test04ABalanceOfAComposedPortfolioIsBalanceOfAllItsAccounts

	|firstAccount secondAccount simplePortfolio composedPortfolio|
	firstAccount _ self accountWithDeposit: 1000 *peso.
	secondAccount _ self accountWithDeposit: 5000* peso.
	simplePortfolio _  Portfolio with: firstAccount.
	composedPortfolio _ Portfolio with: secondAccount andWith: simplePortfolio.
	self assert: composedPortfolio balance equals: simplePortfolio balance + secondAccount balance.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 13:09:20'!
test05AnEmptyPortfolioDoesNotHasTransactionsRegistered

	self deny: (self porfolioNew hasRegistered: ( Deposit for: 100*peso)).! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 19:07:26'!
test06APortfolioWithAnAccountHasATransactionRegistered

	|newPortfolio newAccount newTransaction|
	newAccount _ self accountWithDeposit: 200*peso.
	newTransaction _ self transactionAAccount: newAccount WithDeposit:200*peso.
	newPortfolio _ Portfolio with: newAccount.
	self assert: (newPortfolio hasRegistered: newTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 14:24:50'!
test07APortfolioWithManyAccountsHasATransactionRegistered

	|firstAccount secondAccount newPortfolio aTransaction|
	secondAccount _ ReceptiveAccount new.
	firstAccount _ self accountWithDeposit: 1000*peso.
	aTransaction _ self transactionAAccount: secondAccount WithDeposit:200*peso.
	newPortfolio _ Portfolio with: firstAccount andWith: secondAccount.
	self assert: (newPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 19:18:09'!
test08AComposedPortfolioHasARegisteredTransaction

	|firstAccount secondAccount simplePortfolio composedPortfolio aTransaction|
	firstAccount _ self accountWithDeposit: 100*peso.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ self transactionAAccount:firstAccount WithDeposit:100*peso.
	simplePortfolio _ Portfolio with: firstAccount.
	composedPortfolio _ Portfolio with: simplePortfolio andWith: secondAccount.
	self assert: (composedPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 15:32:36'!
test09AnEmptyPortfolioDoesNotHaveAnyTransactions

	self assert: ((self porfolioNew ) allTransactions) size equals: 0.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 19:08:12'!
test10APortfolioWithAnAccountHaveAllTheTransactionsOfTheAccount

	|newPortfolio anAccount aTransaction anotherTransaction|
	anAccount _ ReceptiveAccount new.
	aTransaction _ self transactionAAccount:anAccount  WithDeposit:100*peso.
	anotherTransaction _ self transactionAnAccount: anAccount WithWithdraw:  50*peso.
	newPortfolio _ Portfolio with: anAccount.
	self assert: (newPortfolio allTransactions) size equals: 2.
	self assert: (newPortfolio allTransactions) includes: anotherTransaction.
	self assert: (newPortfolio allTransactions) includes: aTransaction.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 17:44:57'!
test11APortfolioWithTwoAccountsHaveAllTheTransactionsOfBothAccounts

	|newPortfolio firstAccount secondAccount aTransaction anotherTransaction|
	firstAccount  _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ self transactionAAccount: firstAccount WithDeposit: 100*peso.
	anotherTransaction _ self transactionAnAccount: secondAccount WithWithdraw: 50*peso . 
	newPortfolio _ Portfolio with: firstAccount andWith: secondAccount.
	self assert: (newPortfolio allTransactions) size equals: 2.
	self assert: (newPortfolio allTransactions) includes: anotherTransaction.
	self assert: (newPortfolio allTransactions) includes: aTransaction.! !

!PortfolioTest methodsFor: 'test' stamp: 'SC 7/9/2021 17:51:21'!
test12AComposedPortfolioHaveAllTheTransactions

	|simplePortfolio firstAccount secondAccount aTransaction anotherTransaction composedPortfolio|
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ self transactionAAccount: firstAccount WithDeposit:100*peso.
	anotherTransaction _ self transactionAnAccount: secondAccount WithWithdraw: 67*peso.
	simplePortfolio _ Portfolio with: firstAccount.
	composedPortfolio _ Portfolio with: secondAccount andWith: simplePortfolio.
	self assert: (composedPortfolio allTransactions) size equals: 2.
	self assert: (composedPortfolio allTransactions) includes: anotherTransaction.
	self assert: (composedPortfolio allTransactions) includes: aTransaction.! !


!PortfolioTest methodsFor: 'resourcesTest' stamp: 'SC 7/9/2021 13:07:35'!
accountWithDeposit: moneyToDeposit

	|newAccount|
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToDeposit on: newAccount. 
	^newAccount.! !

!PortfolioTest methodsFor: 'resourcesTest' stamp: 'SC 7/9/2021 13:07:56'!
porfolioNew

	^Portfolio new.! !

!PortfolioTest methodsFor: 'resourcesTest' stamp: 'SC 7/9/2021 17:35:13'!
transactionAAccount: aAccount WithDeposit: moneyToDeposit

	|newTransaction|
	^newTransaction _ Deposit register: moneyToDeposit on: aAccount .
! !

!PortfolioTest methodsFor: 'resourcesTest' stamp: 'SC 7/9/2021 17:34:55'!
transactionAnAccount: anAccount WithWithdraw: moneyToDeposit

	|newTransaction|
	^newTransaction _ Withdraw register: moneyToDeposit on: anAccount .
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:59:31'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.
	self assert: 0 equals: account balance! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:59:11'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
	self assert: 100 * peso equals: account balance! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:57:39'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:57:24'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:56:56'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:56:33'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/10/2021 11:56:06'!
test07AccountKnowsItsTransactions 

	| account deposit |
	account := ReceptiveAccount new.
	deposit := Deposit register: 50 * peso on: account.
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'resourcesTest' stamp: 'SC 7/10/2021 11:40:55'!
accountWithDeposit: moneyToDeposit

	|newAccount|
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToDeposit on: newAccount. 
	^newAccount.! !


!TransferTest methodsFor: 'test' stamp: 'SC 7/10/2021 11:42:01'!
test01AnAccountCanTransferToASecondAccount

	|firstAccount secondAccount|
	firstAccount _ self accountWithDeposit: 100*peso.
	secondAccount _ ReceptiveAccount new.
	Transfer for: 50*peso from: firstAccount to: secondAccount.
	self assert: firstAccount balance equals: secondAccount balance.! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/10/2021 11:43:19'!
test02ATransferKnowsTheValueOfTheTransaction

	|firstAccount secondAccount newTransfer|
	firstAccount _ self accountWithDeposit: 50*peso.
	secondAccount _ ReceptiveAccount new.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	self assert: newTransfer value equals: 50*peso.! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/10/2021 11:44:59'!
test03TheWithdrawPartOfTheTransactionKnowsItsCounterpart

	|firstAccount secondAccount newTransfer|
	firstAccount _ self accountWithDeposit: 50*peso.
	secondAccount _ ReceptiveAccount new.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	self assert: newTransfer withdrawPart counterpart equals: newTransfer depositPart.! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/10/2021 11:46:49'!
test04TheDepositPartOfTheTransactionKnowItsCounterpart

	|firstAccount secondAccount newTransfer|
	firstAccount _ self accountWithDeposit: 50*peso.
	secondAccount _ ReceptiveAccount new.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	self assert: newTransfer depositPart counterpart equals: newTransfer withdrawPart.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:55:42'!
balance

	^self subclassResponsibility.! !

!Account methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:55:48'!
hasRegistered

	^self subclassResponsibility.! !

!Account methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:55:55'!
sumTransactionsToCollection: aCollection

	^self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:58:40'!
addAccount: anAccount

	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:57:19'!
allTransactions

	accounts do: [:anAccount | anAccount sumTransactionsToCollection: transactions].
	^transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:57:04'!
balance

	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0*peso].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:56:56'!
hasRegistered: aTransactionToFind

	^accounts anySatisfy:[:anAccount | anAccount hasRegistered: aTransactionToFind].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:56:46'!
initialize

	accounts _ OrderedCollection new.
	transactions _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:56:37'!
initializeWith: anAccount

	self addAccount: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:56:31'!
initializeWith: anAccount andWith: anotherAccount

	self addAccount: anAccount.
	self addAccount: anotherAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SC 7/9/2021 12:56:23'!
sumTransactionsToCollection: aCollectionOfTransactions

	self allTransactions.
	aCollectionOfTransactions addAll: transactions.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 18:31:35'!
with: anAccount
	
	^self new initializeWith: anAccount.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 19:01:13'!
with: anAccount andWith: anotherAccount
	
	^self new initializeWith: anAccount andWith: anotherAccount.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'SC 7/9/2021 12:59:59'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SC 7/9/2021 12:59:12'!
balance

	^transactions 
	inject: 0 * peso
	into: [:currentBalance :aTransaction | aTransaction addToCurrentBalance: currentBalance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SC 7/9/2021 12:59:23'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SC 7/9/2021 12:59:33'!
register: aTransaction

	transactions add: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SC 7/9/2021 12:59:40'!
sumTransactionsToCollection: aCollectionOfTransactions

	^aCollectionOfTransactions addAll: transactions.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SC 7/9/2021 12:59:47'!
transactions 

	^ transactions copy.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'SC 7/9/2021 13:00:33'!
value 

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'private' stamp: 'SC 7/9/2021 13:00:20'!
addToCurrentBalance: aCurrentBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NA 7/7/2021 19:53:30'!
register: aValue on: account

	| transaction |
	transaction := self for: aValue.
	account register: transaction.
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'SC 7/9/2021 13:01:05'!
initializeFor: aValue

	value := aValue.! !


!Deposit methodsFor: 'value' stamp: 'SC 7/9/2021 13:01:15'!
value

	^ value.! !


!Deposit methodsFor: 'private' stamp: 'SC 7/9/2021 13:00:56'!
addToCurrentBalance: aCurrentBalance

	^aCurrentBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'SC 7/9/2021 13:06:59'!
initializeFor: aValue

	value := aValue! !


!Withdraw methodsFor: 'value' stamp: 'NA 7/4/2021 15:26:07'!
value

	^ value.! !


!Withdraw methodsFor: 'private' stamp: 'SC 7/9/2021 13:07:07'!
addToCurrentBalance: aCurrentBalance

	^aCurrentBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'withdrawPart depositPart value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'resources' stamp: 'SC 7/10/2021 12:04:41'!
depositPart

	^depositPart.! !

!Transfer methodsFor: 'resources' stamp: 'SC 7/10/2021 12:04:34'!
value

	^value.! !

!Transfer methodsFor: 'resources' stamp: 'SC 7/10/2021 12:04:27'!
withdrawPart

	^withdrawPart.! !


!Transfer methodsFor: 'initialization' stamp: 'NA 7/7/2021 19:45:34'!
initializeWith: aValue from: anAccountToWithdraw to: anAccountToDeposit.
	
	withdrawPart _ TransferWithdraw inTransfer: self on: anAccountToWithdraw.
	depositPart _ TransferDeposit inTransfer: self on: anAccountToDeposit.
	value _ aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'NA 7/4/2021 18:59:14'!
for: aValue from: anAccountToWithdraw to: anAccountToDeposit
	
	^self new initializeWith: aValue from: anAccountToWithdraw to: anAccountToDeposit.
	! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'functionality' stamp: 'SC 7/9/2021 19:21:15'!
value

	^transfer value.! !


!TransferTransaction methodsFor: 'private' stamp: 'SC 7/9/2021 19:21:07'!
counterpart

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:38:49'!
inTransfer: aTransfer
	
	^self new initializeWithTransfer: aTransfer.! !

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:38:37'!
inTransfer: aTransfer on: anAccount
	
	|aTransaction|
	aTransaction _ self inTransfer: aTransfer.
	anAccount register: aTransaction.
	^aTransaction.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'functionality' stamp: 'NA 7/7/2021 20:00:15'!
addToCurrentBalance: aCurrentBalance
	
	^aCurrentBalance + transfer value.! !

!TransferDeposit methodsFor: 'functionality' stamp: 'NA 7/7/2021 19:40:37'!
initializeWithTransfer: aTransfer
	
	transfer _ aTransfer.! !


!TransferDeposit methodsFor: 'private' stamp: 'NA 7/7/2021 19:41:32'!
counterpart
	
	^transfer withdrawPart.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'functionality' stamp: 'SC 7/9/2021 19:19:09'!
addToCurrentBalance: aCurrentBalance

	^aCurrentBalance - transfer value.! !

!TransferWithdraw methodsFor: 'functionality' stamp: 'SC 7/9/2021 19:18:52'!
initializeWithTransfer: aTransfer

	transfer _ aTransfer.! !


!TransferWithdraw methodsFor: 'private' stamp: 'SC 7/9/2021 19:19:00'!
counterpart

	^transfer depositPart.! !
