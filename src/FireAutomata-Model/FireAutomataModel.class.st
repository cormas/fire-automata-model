Class {
	#name : 'FireAutomataModel',
	#superclass : 'CMAbstractModel',
	#instVars : [
		'theCells'
	],
	#classInstVars : [
		'defaultNumberOfColumns',
		'defaultNumberOfRows'
	],
	#category : 'FireAutomata-Model',
	#package : 'FireAutomata-Model'
}

{ #category : 'accessing' }
FireAutomataModel class >> aboutThisModel [

	^ 'This is a simple cellular automata (CA) that simulate the diffusion of fire in a forest.
A cell can take one of the 3 following states: forest, fire or empty.
In one step, the CA uses 2 loops in order to 

1) calculate the next state of each cell (stored in the bufferState attribute), 

then 2) to update the state of all the cells.

For more information, see: http://cormas.cirad.fr/fr/applica/fireautomata.htm 
'
]

{ #category : 'default' }
FireAutomataModel class >> defaultNumberOfColumns [

	^ defaultNumberOfColumns
]

{ #category : 'default' }
FireAutomataModel class >> defaultNumberOfColumns: aNumber [

	defaultNumberOfColumns := aNumber
]

{ #category : 'default' }
FireAutomataModel class >> defaultNumberOfRows [

	^ defaultNumberOfRows 
]

{ #category : 'default' }
FireAutomataModel class >> defaultNumberOfRows: aNumber [

	defaultNumberOfRows := aNumber
]

{ #category : 'initialization' }
FireAutomataModel class >> initializeParameters [

	super initializeParameters.
	defaultNumberOfColumns := 100.
	defaultNumberOfRows := 100
]

{ #category : 'init' }
FireAutomataModel >> init53 [
	<init>

	self initCommon.
	theCells do: [ :cell | cell generateTreeWithProbability: 0.53 ].
]

{ #category : 'init' }
FireAutomataModel >> init53WithFire [
	<init>

	self init53.
	self pickRandomCell setOnFire
]

{ #category : 'init' }
FireAutomataModel >> init58 [
	<init>

	self initCommon.
	theCells do: [ :cell | cell generateTreeWithProbability: 0.58 ].
]

{ #category : 'init' }
FireAutomataModel >> init58WithColumnOfFire [
	<init>
	
	self init58.
	self setFirstColumnOnFire.
]

{ #category : 'init' }
FireAutomataModel >> init58WithFire [
	<init>

	self init58.
	self pickRandomCell setOnFire.
]

{ #category : 'init' }
FireAutomataModel >> init58WithMultipleFires [
	<init>

	| numberOfFires |
	numberOfFires := 3.

	self init58.
	
	numberOfFires timesRepeat: [ self pickRandomCell setOnFire ]
]

{ #category : 'initialization' }
FireAutomataModel >> initCommon [

	self
		createGridNumberOfRows: self class defaultNumberOfRows
		numberOfColumns: self class defaultNumberOfColumns
		neighbourhood: 4
		closed: true 
]

{ #category : 'initialization' }
FireAutomataModel >> initialize [

	super initialize.
	theCells := OrderedCollection new.
]

{ #category : 'probes' }
FireAutomataModel >> numberOfAshCells [

	<probeNamed: 'Number of ash cells' color: '808080'>
	^ theCells count: [ :cell | cell isAshCell ]
]

{ #category : 'probes' }
FireAutomataModel >> numberOfEmptyCells [

	<probeNamed: 'Number of empty cells' color: '000000'>
	^ theCells count: [ :cell | cell isEmptyCell ]
]

{ #category : 'probes' }
FireAutomataModel >> numberOfFireCells [

	<probeNamed: 'Number of fire cells' color: 'FF0000'>
	^ theCells count: [ :cell | cell isFireCell ]
]

{ #category : 'probes' }
FireAutomataModel >> numberOfTreeCells [

	<probeNamed: 'Number of tree cells' color: '00b44c'>
	^ theCells count: [ :cell | cell isTreeCell ]
]

{ #category : 'initialization' }
FireAutomataModel >> setFirstColumnOnFire [

	| numberOfRows numberOfColumns firstCellInRow |
	
	numberOfRows := self spaceModel numberOfRows.
	numberOfColumns := self spaceModel numberOfColumns.
	
	1 to: numberOfRows do: [ :rowIndex |
		firstCellInRow := self theCells at: (rowIndex - 1) * numberOfColumns + 1.
		firstCellInRow setOnFire ].
]

{ #category : 'control' }
FireAutomataModel >> step: anObject [
	<control>
	self stepSynchronously: anObject
]

{ #category : 'accessing' }
FireAutomataModel >> theCells [
	
	<getterFor: #FireAutomataCell>
	^ theCells
]
