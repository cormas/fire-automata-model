Class {
	#name : #FireAutomataFireState,
	#superclass : #FireAutomataCellState,
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataFireState >> color [

	^ Color red
]

{ #category : #testing }
FireAutomataFireState >> isFire [

	^ true
]

{ #category : #'instance creation' }
FireAutomataFireState >> newState [

	^ Cormas random < 0.05
		ifTrue: [ FireAutomataAshState forCell: cell ]
		ifFalse: [ self ]
]
