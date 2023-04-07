Class {
	#name : #FireAutomataAshState,
	#superclass : #FireAutomataCellState,
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataAshState >> color [

	^ Color gray
]

{ #category : #testing }
FireAutomataAshState >> isAsh [

	^ true
]

{ #category : #'instance creation' }
FireAutomataAshState >> newState [ 

	^ Cormas random < 0.2
		ifTrue: [ FireAutomataEmptyState forCell: cell ]
		ifFalse: [ self ]
]
