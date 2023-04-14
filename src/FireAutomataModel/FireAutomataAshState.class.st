Class {
	#name : #FireAutomataAshState,
	#superclass : #FireAutomataCellState,
	#instVars : [
		'iterationsToDisappear'
	],
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataAshState >> color [

	^ Color gray
]

{ #category : #initialization }
FireAutomataAshState >> initialize [ 

	super initialize.
	iterationsToDisappear := 2.
]

{ #category : #testing }
FireAutomataAshState >> isAsh [

	^ true
]

{ #category : #'instance creation' }
FireAutomataAshState >> newState [ 

	iterationsToDisappear := iterationsToDisappear - 1.

	^ iterationsToDisappear = 0
		ifTrue: [ FireAutomataEmptyState forCell: cell ]
		ifFalse: [ self ]
]
