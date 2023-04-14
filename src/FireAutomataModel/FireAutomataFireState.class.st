Class {
	#name : #FireAutomataFireState,
	#superclass : #FireAutomataCellState,
	#instVars : [
		'iterationsToBurn'
	],
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataFireState >> color [

	^ Color red
]

{ #category : #initialization }
FireAutomataFireState >> initialize [

	super initialize.
	iterationsToBurn := 3.
]

{ #category : #testing }
FireAutomataFireState >> isFire [

	^ true
]

{ #category : #'instance creation' }
FireAutomataFireState >> newState [

	iterationsToBurn := iterationsToBurn - 1.

	^ iterationsToBurn = 0
		ifTrue: [ FireAutomataAshState forCell: cell ]
		ifFalse: [ self ]
]
