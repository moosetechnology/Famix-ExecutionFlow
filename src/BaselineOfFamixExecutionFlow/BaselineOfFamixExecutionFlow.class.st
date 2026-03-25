Class {
	#name : 'BaselineOfFamixExecutionFlow',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixExecutionFlow',
	#package : 'BaselineOfFamixExecutionFlow'
}

{ #category : 'baselines' }
BaselineOfFamixExecutionFlow >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self dependencies: spec.
		self packages: spec.
		self groups: spec ]
]

{ #category : 'baselines' }
BaselineOfFamixExecutionFlow >> dependencies: spec [

	spec
		baseline: 'FamixValue'
		with: [
		spec repository: 'github://moosetechnology/Famix-Value:main/src' ]
]

{ #category : 'baselines' }
BaselineOfFamixExecutionFlow >> groups: spec [

	spec
		group: 'default'
		with:
			#( 'Famix-ExecutionFlow-Entities' 'Famix-ExecutionFlow-Entities-Extensions'
			   'Famix-ExecutionFlow-Generator' 'Famix-ExecutionFlow-Tests' );
		group: 'value'
		with: #( 'default' 'Famix-ExecutionFlow-Value-Entities'
			   'Famix-ExecutionFlow-Value-Generator'
			   'Famix-ExecutionFlow-Value-Tests' )
]

{ #category : 'baselines' }
BaselineOfFamixExecutionFlow >> packages: spec [

	spec
		package: 'Famix-ExecutionFlow-Entities';
		package: 'Famix-ExecutionFlow-Entities-Extensions'
		with: [ spec requires: #( 'Famix-ExecutionFlow-Entities' ) ];
		package: 'Famix-ExecutionFlow-Generator';
		package: 'Famix-ExecutionFlow-Tests'
		with: [
			spec requires: #( 'Famix-ExecutionFlow-Entities-Extensions' ) ].

	"With FamixValue integration"
	spec
		package: 'Famix-ExecutionFlow-Value-Entities'
		with: [
			spec requires: #( 'FamixValue' 'Famix-ExecutionFlow-Entities' ) ];
		package: 'Famix-ExecutionFlow-Value-Entities-Extensions'
		with: [ spec requires: #( 'Famix-ExecutionFlow-Value-Entities' ) ];
		package: 'Famix-ExecutionFlow-Value-Generator'
		with: [
			spec requires: #( 'FamixValue' 'Famix-ExecutionFlow-Generator' ) ];
		package: 'Famix-ExecutionFlow-Value-Tests'
		with: [ spec requires: #( 'Famix-ExecutionFlow-Value-Entities' ) ]
]
