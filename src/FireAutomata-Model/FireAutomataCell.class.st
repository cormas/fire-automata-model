Class {
	#name : #FireAutomataCell,
	#superclass : #CMSpatialEntityCell,
	#category : #'FireAutomata-Model'
}

{ #category : #accessing }
FireAutomataCell class >> entityName [

	^ 'Cell'
]

{ #category : #initialization }
FireAutomataCell >> generateTree [

	self state: (FireAutomataTreeState forCell: self)
]

{ #category : #initialization }
FireAutomataCell >> generateTreeWithProbability: aNumber [
	"Probability that a cell is initialized with a tree in it"
	
	Cormas random < aNumber
		ifTrue: [ self generateTree ]
]

{ #category : #initialization }
FireAutomataCell >> initialize [ 

	super initialize.
	self state: (FireAutomataEmptyState forCell: self).
]

{ #category : #testing }
FireAutomataCell >> isAshCell [

	^ state isAsh
]

{ #category : #testing }
FireAutomataCell >> isEmptyCell [

	^ state isEmpty
]

{ #category : #testing }
FireAutomataCell >> isFireCell [

	^ state isFire
]

{ #category : #testing }
FireAutomataCell >> isTreeCell [

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
