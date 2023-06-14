Class {
	#name : #BaselineOfFireAutomataModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfFireAutomataModel
}

{ #category : #baselines }
BaselineOfFireAutomataModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		self loadCormas: spec.

		"Packages"
		spec
			package: 'FireAutomata-Model' with: [ spec requires: #(Cormas) ];
			package: 'FireAutomata-Model-Tests' with: [ spec requires: #( 'FireAutomata-Model' ) ] ]
]

{ #category : #dependencies }
BaselineOfFireAutomataModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas' ]
]
