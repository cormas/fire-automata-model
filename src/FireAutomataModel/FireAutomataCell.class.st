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
FireAutomataCell >> generateTreeWithProbability: aNumber [
	"Probability that a cell is initialized with a tree in it"
	
	Cormas random < aNumber
		ifTrue: [ self state: (FireAutomataTreeState forCell: self) ]
]

{ #category : #initialization }
FireAutomataCell >> initialize [ 

	super initialize.
	self state: (FireAutomataEmptyState forCell: self).
]

{ #category : #testing }
FireAutomataCell >> isAsh [

	^ state isAsh
]

{ #category : #testing }
FireAutomataCell >> isEmpty [

	^ state isEmpty
]

{ #category : #testing }
FireAutomataCell >> isFire [

	^ state isFire
]

{ #category : #testing }
FireAutomataCell >> isTree [

	^ state isTree
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
