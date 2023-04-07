Class {
	#name : #FireAutomataCell,
	#superclass : #CMSpatialEntityCell,
	#category : #FireAutomataModel
}

{ #category : #accessing }
FireAutomataCell class >> entityName [

	^ 'Cell'
]

{ #category : #initialization }
FireAutomataCell >> initializeWithProbability: aNumber [
	"Probability that a cell is initialized with a tree in it"
	
	Cormas random < aNumber
		ifTrue: [ self state: (FireAutomataTreeState forCell: self) ]
		ifFalse: [ self state: (FireAutomataEmptyState forCell: self) ]
]

{ #category : #testing }
FireAutomataCell >> isAsh [

	^ false
]

{ #category : #testing }
FireAutomataCell >> isEmpty [

	^ false
]

{ #category : #testing }
FireAutomataCell >> isFire [

	^ false
]

{ #category : #testing }
FireAutomataCell >> isTree [

	^ false
]

{ #category : #'instance creation' }
FireAutomataCell >> newState [

	self bufferState: state newState.
]

{ #category : #pov }
FireAutomataCell >> pov [

	^ state color
]

{ #category : #initialization }
FireAutomataCell >> setOnFire [

	self state: (FireAutomataFireState forCell: self)
]
