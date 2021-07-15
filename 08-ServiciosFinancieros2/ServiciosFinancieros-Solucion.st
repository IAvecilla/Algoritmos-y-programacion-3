!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummaryTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:08:04'!
test01AReportOfEmptyAccountShouldContainsOnlyTheBalance
	
	|newAccount reporter|
	newAccount _ ReceptiveAccount new.
	reporter _ AccountSummary ofAccount: newAccount.
	
	self assert: (reporter report) includes: 'Balance = 0 pesos'.! !

!AccountSummaryTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:48:41'!
test02AReportOfAnAccountContainsADepositTransaction
	
	|newAccount reporter expectedReport|
	newAccount _ self accountWithDeposit:10 * peso.
	reporter _ AccountSummary ofAccount: newAccount.
	expectedReport _ OrderedCollection with: 'Deposito por 10 pesos' with: 'Balance = 10 pesos'.
	
	self assert: (reporter report) equals: expectedReport.! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NA 7/15/2021 18:01:54'!
test03AReportOfAnAccountContainsAWithdrawTransaction
	
	|newAccount reporter expectedReport|
	newAccount _ ReceptiveAccount new.
	Withdraw register: 10*peso on: newAccount.
	reporter _ AccountSummary ofAccount: newAccount.
	expectedReport _ OrderedCollection with: 'Extraccion por 10 pesos' with: 'Balance = -10 pesos'.
	
	self assert: (reporter report) equals: expectedReport.! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:08:47'!
test04AReportOfAnAccountContainsTheWithdrawLegOfATransfer
	
	|newAccount otherAccount accountReporting expectedReport|
	newAccount _ ReceptiveAccount new.
	otherAccount _ ReceptiveAccount new.
	Transfer amount: 40 * peso from: newAccount  to: otherAccount.
	accountReporting _ AccountSummary ofAccount: newAccount.
	expectedReport _ OrderedCollection with: 'Salida por transferencia de 40 pesos' with: 'Balance = -40 pesos'.
	
	self assert:  expectedReport equals: (accountReporting report).! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:02:28'!
test05AReportOfAnAccountContainsTheDepositLegOfATransfer
	
	|newAccount otherAccount accountReporting expectedReport|
	newAccount _ ReceptiveAccount new.
	otherAccount _ ReceptiveAccount new.
	Transfer amount: 40 * peso from: otherAccount  to: newAccount.
	accountReporting _ AccountSummary ofAccount: newAccount.
	expectedReport _ OrderedCollection with: 'Entrada por transferencia de 40 pesos' with: 'Balance = 40 pesos'.
	
	self assert:  expectedReport equals: (accountReporting report).! !

!AccountSummaryTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:02:34'!
test06AReportOfAComposedPortfolioHaveAllItsTransactions

	| account anotherAccount portfolio composedPortfolio accountReporting expectedReport |
	account _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	portfolio _ Portfolio ofAccount: anotherAccount.
	Transfer amount: 20 * peso from: account to: anotherAccount.
	Transfer amount: 30 * peso from: anotherAccount to: account .
	composedPortfolio _ Portfolio with: account with: portfolio.
	accountReporting _ AccountSummary ofAccount: composedPortfolio.
	expectedReport _ OrderedCollection with: 'Salida por transferencia de 20 pesos' with: 'Entrada por transferencia de 30 pesos' with: 'Entrada por transferencia de 20 pesos' with: 'Salida por transferencia de 30 pesos' with:'Balance = 0 pesos'.
	self assert: expectedReport equals: (accountReporting report).	! !


!AccountSummaryTest methodsFor: 'resourcesTest' stamp: 'SC 7/14/2021 20:46:24'!
accountWithDeposit: moneyToAccount
	
	|newAccount|
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToAccount on: newAccount.
	^newAccount .! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio ofAccount: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio ofAccount: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio ofAccount: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio ofAccount: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio ofAccount: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'NA 7/13/2021 18:37:01'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio ofAccount: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/14/2021 20:55:08'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account _ self accountWithDeposit: 100 * peso.
		
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/14/2021 21:01:01'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SC 7/14/2021 21:02:49'!
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


!ReceptiveAccountTest methodsFor: 'resourcesTest' stamp: 'SC 7/14/2021 20:52:57'!
accountWithDeposit: moneyToAccount
	
	|newAccount|
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToAccount on: newAccount.
	^newAccount .! !

!ReceptiveAccountTest methodsFor: 'resourcesTest' stamp: 'SC 7/14/2021 20:59:11'!
accountWithWithdraw: moneyToAccount
	
	|newAccount|
	newAccount _ ReceptiveAccount new.
	Withdraw register: moneyToAccount on: newAccount.
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNetTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:18:03'!
test01ATransferNetOfAnAccountWithoutTransactionsIsZero
	
	|newAccount reporter|
	
	newAccount  _ ReceptiveAccount new.
	reporter _ TransferNet ofAccount: newAccount.
	self assert: 0 equals: (reporter report).! !

!TransferNetTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:26:08'!
test02ATransferNetOfAnAccountWithATransferDepositItsTheValueOfTheTransfer
	
	|newAccount anotherAccount reporter|
	
	newAccount  _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 20*peso from: anotherAccount to: newAccount.
	reporter _ TransferNet ofAccount: newAccount.
	self assert: 20 * peso equals: (reporter report).! !

!TransferNetTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:28:33'!
test03ATransferNetOfAnAccountWithATransferWithdrawItsTheValueOfTheTransfer
	
	|newAccount anotherAccount reporter|
	
	newAccount  _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 20*peso from: newAccount to: anotherAccount.
	reporter _ TransferNet ofAccount: newAccount.
	self assert: -20 * peso equals: (reporter report).! !

!TransferNetTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:44:20'!
test04ATransferNetOfAnAccountIsTheSumOfTheValuesOfItsTransfers
	
	|newAccount anotherAccount reporter|
	
	newAccount  _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	Transfer amount: 20*peso from: newAccount to: anotherAccount.
	Transfer amount: 40*peso from: anotherAccount to: newAccount.
	reporter _ TransferNet ofAccount: newAccount.
	self assert: 20 * peso equals: (reporter report).! !

!TransferNetTest methodsFor: 'test' stamp: 'NA 7/13/2021 19:53:58'!
test05ATransferNetOfAPortfolioIsTheSumOfTheTransferValuesOfItsAccounts
	
	|newAccount anotherAccount reporter simplePortfolio|
	
	newAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	simplePortfolio  _ Portfolio with: newAccount with: anotherAccount.
	Transfer amount: 20*peso from: newAccount to: anotherAccount.
	Transfer amount: 40*peso from: anotherAccount to: newAccount.
	reporter _ TransferNet ofAccount: simplePortfolio.
	self assert: 0 equals: (reporter report).! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'resourcesTest' stamp: 'SC 7/14/2021 20:15:23'!
accountWithDeposit: moneyToAccount
	
	|newAccount|
	newAccount _ ReceptiveAccount new.
	Deposit register: moneyToAccount on: newAccount.
	^newAccount .! !


!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:18:09'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount _ self accountWithDeposit: 10 * peso.
	destinationAccount _ self accountWithDeposit: 10 * peso.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:19:08'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount _ self accountWithDeposit:10 * peso.
	destinationAccount _ self accountWithDeposit:10 * peso.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:20:05'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount _ self accountWithDeposit:10 * peso.
	destinationAccount _ self accountWithDeposit:10 * peso.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:20:31'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount _ self accountWithDeposit:10 * peso.
	destinationAccount _ self accountWithDeposit:10 * peso.
	
	transfer _ Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:20:52'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount _ self accountWithDeposit:10 * peso.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]! !

!TransferTest methodsFor: 'test' stamp: 'SC 7/14/2021 20:21:22'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount _ self accountWithDeposit:10 * peso.
	destinationAccount _ self accountWithDeposit:10 * peso.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'LL 7/1/2021 03:21:03'!
initialize

	accounts := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'LL 7/1/2021 03:21:12'!
add: accountToAdd
	
	accounts add: accountToAdd.
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:36:23'!
visitTransactionsWithVisitor: aTransactionsVisitor
	
	accounts do: [:anAccount | anAccount visitTransactionsWithVisitor: aTransactionsVisitor].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:37:01'!
ofAccount: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NA 7/13/2021 19:07:14'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:33:35'!
visitTransactionsWithVisitor: aTransactionsVisitor
	
	transactions do:[:aTransaction| aTransaction accept: aTransactionsVisitor].! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'NA 7/12/2021 20:25:36'!
reportIn: anAccountReporter
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:34:20'!
accept: aTransactionVisitor
	
	aTransactionVisitor visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:34:41'!
accept: aTransactionVisitor
	
	aTransactionVisitor visitTransferDeposit: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:34:51'!
accept: aTransactionVisitor
	
	aTransactionVisitor visitTransferWithdraw: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:35:03'!
accept: aTransactionVisitor
	
	aTransactionVisitor visitWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransactionVisitors category: 'ServiciosFinancieros-Solucion'!
Object subclass: #TransactionVisitors
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransactionVisitors methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:49:51'!
visitDeposit: aDeposit
	
	self subclassResponsibility.! !

!TransactionVisitors methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:50:19'!
visitTransferDeposit: aTransferDeposit
	
	self subclassResponsibility.! !

!TransactionVisitors methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:50:34'!
visitTransferWithdraw: aTransferWithdraw
	
	self subclassResponsibility.! !

!TransactionVisitors methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:50:04'!
visitWithdraw: aWithdraw
	
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
TransactionVisitors subclass: #AccountSummary
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/12/2021 20:39:38'!
initializeWith: anAccount
	
	account _ anAccount.
	report _ OrderedCollection new.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 19:06:31'!
report
	
	account visitTransactionsWithVisitor: self.
	report add: 'Balance = ', account balance asString.
	^report.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:29:43'!
visitDeposit: aDeposit
	
	report add: 'Deposito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:30:04'!
visitTransferDeposit: aTransferDeposit
	
	report add: 'Entrada por transferencia de ', aTransferDeposit value asString.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:30:28'!
visitTransferWithdraw: aTransferWithdraw
	
	report add: 'Salida por transferencia de ', aTransferWithdraw value asString.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:30:16'!
visitWithdraw: aWithdraw
	
	report add: 'Extraccion por ', aWithdraw value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:37:01'!
ofAccount: anAccount
	
	^self new initializeWith: anAccount.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
TransactionVisitors subclass: #TransferNet
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:44:20'!
initializeWith: anAccount
	
	account _ anAccount.
	report _ 0! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:46:48'!
report
	
	account visitTransactionsWithVisitor: self.
	^report.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:47:24'!
visitTransferDeposit: aTransferDeposit
	
	report _ report + aTransferDeposit value.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 19:29:01'!
visitTransferWithdraw: aTransferWithdraw
	
	report _ report - aTransferWithdraw value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'as yet unclassified' stamp: 'NA 7/13/2021 18:42:50'!
ofAccount: anAccount
	
	^self new initializeWith: anAccount.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
