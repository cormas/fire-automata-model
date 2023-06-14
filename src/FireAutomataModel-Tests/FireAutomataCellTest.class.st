Class {
	#name : #FireAutomataCellTest,
	#superclass : #TestCase,
	#instVars : [
		'cell'
	],
	#category : #'FireAutomataModel-Tests'
}

{ #category : #initialization }
FireAutomataCellTest >> setUp [ 

	super setUp.
	cell := FireAutomataCell new.
]

{ #category : #tests }
FireAutomataCellTest >> testEntityName [ 

	self assert: cell class entityName equals: 'Cell'
]

{ #category : #tests }
FireAutomataCellTest >> testInitializedEmpty [

	self assert: cell isEmpty
]
