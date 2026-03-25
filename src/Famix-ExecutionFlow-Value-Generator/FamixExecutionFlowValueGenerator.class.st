Class {
	#name : 'FamixExecutionFlowValueGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'methodCall',
		'tOfType'
	],
	#category : 'Famix-ExecutionFlow-Value-Generator',
	#package : 'Famix-ExecutionFlow-Value-Generator'
}

{ #category : 'accessing' }
FamixExecutionFlowValueGenerator class >> packageName [

	<ignoreForCoverage>
	^ #'Famix-ExecutionFlow-Value-Entities'
]

{ #category : 'accessing' }
FamixExecutionFlowValueGenerator class >> submetamodels [

	^ {
		  FamixExecutionFlowGenerator.
		  FamixValueGenerator }
]

{ #category : 'definition' }
FamixExecutionFlowValueGenerator >> defineClasses [

	methodCall := self remoteEntity: #MethodCall withPrefix: #FamixEF
]

{ #category : 'definition' }
FamixExecutionFlowValueGenerator >> defineRelations [ 

	"Relations to FamixValue"
	((methodCall property: #receiver) comment:
		 'The receiver of the call.')
	*- ((tOfType property: #receiverInMethodCall) comment:
			 'The calls that use me as receiver.').
	((methodCall property: #arguments) comment:
		 'The arguments of the call.')
	-* ((tOfType property: #argumentInMethodCall) comment:
			 'The calls that use me as an argument.').
	((methodCall property: #result) comment: 'The result of the call.')
	*- ((tOfType property: #resultInMethodCall) comment:
			 'The calls that returns me.')
]

{ #category : 'definition' }
FamixExecutionFlowValueGenerator >> defineTraits [

	tOfType := self remoteEntity: #OfType withPrefix: #FamixValue
]
