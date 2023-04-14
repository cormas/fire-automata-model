Class {
	#name : #FireAutomataCellStateTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyCellState',
		'treeCellState',
		'fireCellState',
		'ashCellState'
	],
	#category : #'FireAutomataModel-Tests'
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

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testEmptyCellStateColor [

	self assert: emptyCellState color equals: Color black.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testFireCellStateColor [

	self assert: fireCellState color equals: Color red.
]

{ #category : #'as yet unclassified' }
FireAutomataCellStateTest >> testTreeCellStateColor [

	self assert: treeCellState color equals: Color green.
]
