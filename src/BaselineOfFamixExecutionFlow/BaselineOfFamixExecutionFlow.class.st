Class {
	#name : #BaselineOfFamixExecutionFlow,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamixExecutionFlow
}

{ #category : #baselines }
BaselineOfFamixExecutionFlow >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec ]
]

{ #category : #baselines }
BaselineOfFamixExecutionFlow >> dependencies: spec [

	spec
		baseline: 'FamixValue'
		with: [
		spec repository: 'github://moosetechnology/Famix-Value:main/src' ]
]

{ #category : #baselines }
BaselineOfFamixExecutionFlow >> packages: spec [

	spec
		package: 'Famix-ExecutionFlow-Entities'
		with: [ spec requires: 'FamixValue' ];
		package: 'Famix-ExecutionFlow-Entities-Extensions'
		with: [ spec requires: 'Famix-ExecutionFlow-Entities' ];
		package: 'Famix-ExecutionFlow-Generator'
		with: [ spec requires: 'FamixValue' ];
		package: 'Famix-ExecutionFlow-Tests'
		with: [ spec requires: 'Famix-ExecutionFlow-Entities-Extensions' ]
]
