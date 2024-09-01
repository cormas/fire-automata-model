Class {
	#name : 'FireAutomataEmptyState',
	#superclass : 'FireAutomataCellState',
	#category : 'FireAutomata-Model',
	#package : 'FireAutomata-Model'
}

{ #category : 'accessing' }
FireAutomataEmptyState >> color [

	^ Color black
]

{ #category : 'testing' }
FireAutomataEmptyState >> isEmpty [

	^ true
]

{ #category : 'instance creation' }
FireAutomataEmptyState >> newState [

	^ self
]
