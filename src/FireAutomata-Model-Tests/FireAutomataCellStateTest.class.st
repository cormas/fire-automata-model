Class {
	#name : #FireAutomataCellStateTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyCellState',
		'treeCellState',
		'fireCellState',
		'ashCellState'
	],
	#category : #'FireAutomata-Model-Tests'
}

{ #category : #initialization }
FireAutomataCellStateTest >> setUp [

	super setUp.
	
	emptyCellState := FireAutomataEmptyState new.
	treeCellState := FireAutomataTreeState new.
	fireCellState := FireAutomataFireState new.
	ashCellState := FireAutomataAshState new.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testAshCellStateColor [

	self assert: ashCellState color equals: Color gray.
]

{ #category : #tests }
FireAutomataCellStateTest >> testAshTurnsToEmpty [

	| cellState |
	cellState := ashCellState.
	cellState iterationsToDisappear: 5.
	
	5 timesRepeat: [ 
		self assert: cellState isAsh.
		cellState := cellState newState ].
	
	self assert: cellState isEmpty.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testEmptyCellStateColor [

	self assert: emptyCellState color equals: Color black.
]

{ #category : #tests }
FireAutomataCellStateTest >> testEmptyRemainsEmpty [

	| cellState |
	cellState := emptyCellState.
	
	10 timesRepeat: [ 
		cellState := cellState newState.
		self assert: cellState isEmpty ].
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testFireCellStateColor [

	self assert: fireCellState color equals: Color red.
]

{ #category : #tests }
FireAutomataCellStateTest >> testFireTurnsToAsh [

	| cellState |
	cellState := fireCellState.
	cellState iterationsToBurn: 3.
	
	3 timesRepeat: [ 
		self assert: cellState isFire.
		cellState := cellState newState ].
	
	self assert: cellState isAsh.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testIsAsh [

	self deny: emptyCellState isAsh.
	self deny: treeCellState isAsh.
	self deny: fireCellState isAsh.
	self assert: ashCellState isAsh.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testIsEmpty [

	self assert: emptyCellState isEmpty.
	self deny: treeCellState isEmpty.
	self deny: fireCellState isEmpty.
	self deny: ashCellState isEmpty.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testIsFire [

	self deny: emptyCellState isFire.
	self deny: treeCellState isFire.
	self assert: fireCellState isFire.
	self deny: ashCellState isFire.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testIsTree [

	self deny: emptyCellState isTree.
	self assert: treeCellState isTree.
	self deny: fireCellState isTree.
	self deny: ashCellState isTree.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testTreeCellStateColor [

	self assert: treeCellState color equals: Color green.
]
