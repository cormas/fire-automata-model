Class {
	#name : #FireAutomataTreeState,
	#superclass : #FireAutomataCellState,
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataTreeState >> color [

	^ Color green
]

{ #category : #testing }
FireAutomataTreeState >> isTree [

	^ true
]

{ #category : #'instance creation' }
FireAutomataTreeState >> newState [

	(cell neighbourhood anySatisfy: [ :neighbourCell | neighbourCell state isFire ])
		ifFalse: [ ^ self ].
		
	^ Cormas random < 0.5
		ifTrue: [ FireAutomataFireState forCell: cell ]
		ifFalse: [ self ]
]
