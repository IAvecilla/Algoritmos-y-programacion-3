!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:36:26'!
accountWithDeposit: moneyToDeposit
	
	|newAccount|
	
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToDeposit on: newAccount. 
	^newAccount.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:38:35'!
createPorfolioWhitAAccount: newAccount 

	^Portfolio with: newAccount.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:57:46'!
createPorfolioWhitFirstAccount: firstAccount AndSecondAccount: secondAccount 

	^Portfolio with: firstAccount andWith: secondAccount.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:18:16'!
porfolioNew

	^Portfolio new.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:28:22'!
returnAccountBalanceWithinThePorfolio: porfolio
	
	^porfolio allTransactions.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:48:42'!
sumTheFirstAccount: firstAccount andSecondAcountThatHasPortfolio: secondAccount	
	
	^secondAccount balance + firstAccount balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:19:17'!
test01PortfolioWithoutAccountHasABalanceOfZero
	
	self assert: self porfolioNew balance equals: 0.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:41:21'!
test02BalanceOfAPortfolioWithOneAccountIsTheBalanceOfTheAccount
	
	|newAccount|
	newAccount _ self accountWithDeposit: 100*peso.
	self assert: newAccount balance equals: (self createPorfolioWhitAAccount: newAccount) balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:58:55'!
test03BalanceOfAPortfolioWithManyAccountsIsTheSumOfTheBalanceOfTheAccounts
	
	|firstAccount secondAccount newPortfolio|
	firstAccount _ self accountWithDeposit: 100*peso.
	secondAccount _ self accountWithDeposit: 200*peso.
	newPortfolio _ self createPorfolioWhitFirstAccount: firstAccount AndSecondAccount: secondAccount.
	^self assert: newPortfolio balance equals: (self sumTheFirstAccount: firstAccount andSecondAcountThatHasPortfolio: secondAccount). ! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 13:55:28'!
test04ABalanceOfAComposedPortfolioIsBalanceOfAllItsAccounts
	
	|firstAccount secondAccount simplePortfolio composedPortfolio|
	firstAccount _ self accountWithDeposit: 1000 *peso.
	secondAccount _ self accountWithDeposit: 5000* peso.
	simplePortfolio _  self createPorfolioWhitAAccount: firstAccount.
	composedPortfolio _ Portfolio with: secondAccount andWith: simplePortfolio.
	self assert: composedPortfolio balance equals: simplePortfolio balance + secondAccount balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'Stephanie Castillo 7/8/2021 14:01:36'!
test05AnEmptyPortfolioDoesNotHasTransactionsRegistered
	
	self deny: (self porfolioNew hasRegistered: ( Deposit for: 100*peso)).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 20:27:15'!
test06APortfolioWithAnAccountHasATransactionRegistered
	
	|newPortfolio newAccount newTransaction|
	newAccount _ ReceptiveAccount new.
	newTransaction _ Deposit register: 200*peso on: newAccount.
	newPortfolio _ Portfolio with: newAccount.
	
	self assert: (newPortfolio hasRegistered: newTransaction).
	
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 20:27:05'!
test07APortfolioWithManyAccountsHasATransactionRegistered
	
	|firstAccount secondAccount newPortfolio aTransaction|
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	Deposit register: 100*peso on: firstAccount.
	aTransaction _ Deposit register: 50*peso on: secondAccount.
	newPortfolio _ Portfolio with: firstAccount andWith: secondAccount.
	
	self assert: (newPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 20:32:55'!
test08AComposedPortfolioHasARegisteredTransaction
	
	|firstAccount secondAccount simplePortfolio composedPortfolio aTransaction|
	firstAccount _ ReceptiveAccount new.
	Deposit register: 100*peso on: firstAccount.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 100*peso on: secondAccount.
	simplePortfolio _ Portfolio with: firstAccount.
	composedPortfolio _ Portfolio with: simplePortfolio andWith: secondAccount.
	
	self assert: (composedPortfolio hasRegistered: aTransaction).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 21:15:29'!
test09AnEmptyPortfolioDoesNotHaveAnyTransactions
	
	|newPortfolio|
	newPortfolio _ Portfolio new.
	
	self assert: (newPortfolio allTransactions) size equals: 0.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 21:28:49'!
test10APortfolioWithAnAccountHaveAllTheTransactionsOfTheAccount
	
	|newPortfolio anAccount aTransaction anotherTransaction|
	anAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 100*peso on: anAccount. 
	anotherTransaction _ Withdraw register: 50*peso on: anAccount. 
	newPortfolio _ Portfolio with: anAccount.
	
	self assert: (newPortfolio allTransactions) size equals: 2.
	self assert: (newPortfolio allTransactions) includes: anotherTransaction.
	self assert: (newPortfolio allTransactions) includes: aTransaction.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 21:36:38'!
test11APortfolioWithTwoAccountsHaveAllTheTransactionsOfBothAccounts
	
	|newPortfolio firstAccount secondAccount aTransaction anotherTransaction|
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 100*peso on: firstAccount . 
	anotherTransaction _ Withdraw register: 50*peso on: secondAccount . 
	newPortfolio _ Portfolio with: firstAccount andWith: secondAccount.
	
	self assert: (newPortfolio allTransactions) size equals: 2.
	self assert: (newPortfolio allTransactions) includes: anotherTransaction.
	self assert: (newPortfolio allTransactions) includes: aTransaction.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 21:45:20'!
test12AComposedPortfolioHaveAllTheTransactions
	
	|simplePortfolio firstAccount secondAccount aTransaction anotherTransaction composedPortfolio|
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 100*peso on: firstAccount. 
	anotherTransaction _ Withdraw register: 50*peso on: secondAccount.
	
	simplePortfolio _ Portfolio with: firstAccount.
	composedPortfolio _ Portfolio with: secondAccount andWith: simplePortfolio.
	
	self assert: (composedPortfolio allTransactions) size equals: 2.
	self assert: (composedPortfolio allTransactions) includes: anotherTransaction.
	self assert: (composedPortfolio allTransactions) includes: aTransaction.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:13:40'!
test01AnAccountCanTransferToASecondAccount
	
	|firstAccount secondAccount|
	
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: firstAccount.
	Transfer for: 50*peso from: firstAccount to: secondAccount.
	
	self assert: firstAccount balance equals: secondAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:14:29'!
test02ATransferKnowsTheValueOfTheTransaction
	
	|firstAccount secondAccount newTransfer|
		
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	
	Deposit register: 50*peso on: firstAccount.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	
	self assert: newTransfer value equals: 50*peso! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:15:17'!
test03TheWithdrawPartOfTheTransactionKnowsItsCounterpart
	
	|firstAccount secondAccount newTransfer|
	
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	
	Deposit register: 50*peso on: firstAccount.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	
	self assert: newTransfer withdrawPart counterpart equals: newTransfer depositPart.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:16:02'!
test04TheDepositPartOfTheTransactionKnowItsCounterpart
	
	|firstAccount secondAccount newTransfer|
	
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	
	Deposit register: 50*peso on: firstAccount.
	newTransfer _ Transfer for: 50*peso from: firstAccount to: secondAccount.
	
	self assert: newTransfer depositPart counterpart equals: newTransfer withdrawPart.! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:37:56'!
balance
	
	^self subclassResponsibility.! !

!Account methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:38:26'!
hasRegistered
	
	^self subclassResponsibility.! !

!Account methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:39:46'!
sumTransactionsToCollection: aCollection
	
	^self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:22:23'!
addAccount: anAccount
	
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:39:22'!
allTransactions

	accounts do: [:anAccount | anAccount sumTransactionsToCollection: transactions].
	^transactions.
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:26:32'!
balance
	
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [^0*peso].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:48:45'!
hasRegistered: aTransactionToFind

	^accounts anySatisfy:[:anAccount | anAccount hasRegistered: aTransactionToFind].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 21:46:53'!
initialize
	
	accounts _ OrderedCollection new.
	transactions _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:45:14'!
initializeWith: anAccount
	
	self addAccount: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:44:03'!
initializeWith: anAccount andWith: anotherAccount
	
	self addAccount: anAccount.
	self addAccount: anotherAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/8/2021 00:39:22'!
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

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NA 7/5/2021 19:27:51'!
balance

	^transactions 
	inject: 0 * peso
	into: [:currentBalance :aTransaction | aTransaction addToCurrentBalance: currentBalance ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NA 7/4/2021 15:43:47'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NA 7/8/2021 00:39:22'!
sumTransactionsToCollection: aCollectionOfTransactions
	
	^aCollectionOfTransactions addAll: transactions.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'NA 7/5/2021 19:22:33'!
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

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'NA 7/4/2021 15:25:40'!
value

	^ value.! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'NA 7/5/2021 19:22:17'!
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

!Withdraw methodsFor: 'initialization' stamp: 'NA 7/4/2021 14:58:50'!
initializeFor: aValue

	value := aValue! !


!Withdraw methodsFor: 'value' stamp: 'NA 7/4/2021 15:26:07'!
value

	^ value.! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'NA 7/5/2021 19:23:16'!
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

!Transfer methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 00:37:44'!
depositPart
	
	^depositPart.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:45:34'!
initializeWith: aValue from: anAccountToWithdraw to: anAccountToDeposit.
	
	withdrawPart _ TransferWithdraw inTransfer: self on: anAccountToWithdraw.
	depositPart _ TransferDeposit inTransfer: self on: anAccountToDeposit.
	value _ aValue.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:58:35'!
value
	
	^value.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'NA 7/6/2021 00:37:31'!
withdrawPart
	
	^withdrawPart.! !

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

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:41:56'!
counterpart
	
	^self subclassResponsibility.! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:42:11'!
value
	
	^transfer value.! !

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

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:00:15'!
addToCurrentBalance: aCurrentBalance
	
	^aCurrentBalance + transfer value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:41:32'!
counterpart
	
	^transfer withdrawPart.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:40:37'!
initializeWithTransfer: aTransfer
	
	transfer _ aTransfer.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 20:00:33'!
addToCurrentBalance: aCurrentBalance
	
	^aCurrentBalance - transfer value.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:41:43'!
counterpart
	
	^transfer depositPart.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'NA 7/7/2021 19:40:47'!
initializeWithTransfer: aTransfer
	
	transfer _ aTransfer.! !
