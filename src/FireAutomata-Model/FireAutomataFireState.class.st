Class {
	#name : #FireAutomataFireState,
	#superclass : #FireAutomataCellState,
	#instVars : [
		'iterationsToBurn'
	],
	#category : #'FireAutomata-Model'
}

{ #category : #'default values' }
FireAutomataFireState class >> defaultIterationsToBurn [

	^ 3
]

{ #category : #accessing }
FireAutomataFireState >> color [

	^ Color red
]

{ #category : #initialization }
FireAutomataFireState >> initialize [

	super initialize.
	iterationsToBurn := self class defaultIterationsToBurn.
]

{ #category : #testing }
FireAutomataFireState >> isFire [

	^ true
]

{ #category : #accessing }
FireAutomataFireState >> iterationsToBurn: aNumber [
	"Set the number of iterations during which the fire should be burning. After those iterations, the fire will stop and the state will be changed"
	iterationsToBurn := aNumber
]

{ #category : #'instance creation' }
FireAutomataFireState >> newState [

	iterationsToBurn := iterationsToBurn - 1.

	^ iterationsToBurn = 0
		ifTrue: [ FireAutomataAshState forCell: cell ]
		ifFalse: [ self ]
]
