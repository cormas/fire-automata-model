Class {
	#name : 'FireAutomataAshState',
	#superclass : 'FireAutomataCellState',
	#instVars : [
		'iterationsToDisappear'
	],
	#category : 'FireAutomata-Model',
	#package : 'FireAutomata-Model'
}

{ #category : 'default values' }
FireAutomataAshState class >> defaultIterationsToDisappear [

	^ 2
]

{ #category : 'accessing' }
FireAutomataAshState >> color [

	^ Color gray
]

{ #category : 'initialization' }
FireAutomataAshState >> initialize [ 

	super initialize.
	iterationsToDisappear := self class defaultIterationsToDisappear.
]

{ #category : 'testing' }
FireAutomataAshState >> isAsh [

	^ true
]

{ #category : 'accessing' }
FireAutomataAshState >> iterationsToDisappear: aNumber [
	"Set the number of iterations during which the cell should remain in the state of ash. After those iterations, the ash will disappear and the state will be changed"
	iterationsToDisappear := aNumber
]

{ #category : 'instance creation' }
FireAutomataAshState >> newState [ 

	iterationsToDisappear := iterationsToDisappear - 1.

	^ iterationsToDisappear = 0
		ifTrue: [ FireAutomataEmptyState forCell: cell ]
		ifFalse: [ self ]
]
