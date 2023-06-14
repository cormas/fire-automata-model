Class {
	#name : #FireAutomataCellState,
	#superclass : #Object,
	#instVars : [
		'cell'
	],
	#category : #'FireAutomata-Model'
}

{ #category : #'as yet unclassified' }
FireAutomataCellState class >> forCell: aCell [

	^ self new
		cell: aCell;
		yourself
]

{ #category : #accessing }
FireAutomataCellState >> cell: aCell [

	cell := aCell
]

{ #category : #accessing }
FireAutomataCellState >> color [

	self subclassResponsibility
]

{ #category : #testing }
FireAutomataCellState >> isAsh [

	^ false
]

{ #category : #testing }
FireAutomataCellState >> isEmpty [

	^ false
]

{ #category : #testing }
FireAutomataCellState >> isFire [

	^ false
]

{ #category : #testing }
FireAutomataCellState >> isTree [

	^ false
]

{ #category : #'instance creation' }
FireAutomataCellState >> newState [

	self subclassResponsibility
]
