Class {
	#name : #FamixExecutionFlowGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'methodCall',
		'tOfType'
	],
	#category : #'Famix-ExecutionFlow-Generator'
}

{ #category : #accessing }
FamixExecutionFlowGenerator class >> packageName [

	<ignoreForCoverage>
	^ #'Famix-ExecutionFlow-Entities'
]

{ #category : #accessing }
FamixExecutionFlowGenerator class >> prefix [

	<ignoreForCoverage>
	^ #FamixEF
]

{ #category : #accessing }
FamixExecutionFlowGenerator class >> submetamodels [

	^ {
		  FamixGenerator.
		  FamixValueGenerator }
]

{ #category : #definition }
FamixExecutionFlowGenerator >> defineClasses [

	methodCall := builder
		              newClassNamed: #MethodCall
		              comment:
			              'Represents a dynamic method call in the context of a dynamic call graph.
This entity links a method from a Famix model to actual runtime values, capturing the details of the dynamic call during program execution.'
]

{ #category : #definition }
FamixExecutionFlowGenerator >> defineProperties [

	(methodCall property: #duration type: #Object) comment:
		'Duration of the method call.'.
	(methodCall property: #timestamp type: #Object) comment:
		'Date and time of the start of the method call.'.
	(methodCall property: #numberOfCalls type: #Number defaultValue: 1)
		comment: 'The number of times this path was taken.'
]

{ #category : #definition }
FamixExecutionFlowGenerator >> defineRelations [

	((methodCall property: #next) comment:
		 'The next sibling/call in the same method context.')
	- ((methodCall property: #previous) comment:
			 'The previous sibling/call in the same method context.').
	((methodCall property: #caller) comment: 'The calling method.')
	*- ((methodCall property: #calls) comment: 'Methods called by me.').
	((methodCall property: #indirectCaller) comment:
		 'The ancestor method that leads to my call, used when the caller is unknown.')
	*- ((methodCall property: #indirectCalls) comment:
			 'The descendant methods that are indirectly called by me, used when the direct calls are unknown.').

	"Relations to Famix"
	((methodCall property: #method) comment: 'The called method.')
	*- (((self remoteTrait: #TMethod withPrefix: #Famix) property:
			  #methodCalls) comment:
			 'Actual calls to me in an ExecutionFlow model.').

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

{ #category : #definition }
FamixExecutionFlowGenerator >> defineTraits [

	tOfType := self remoteEntity: #OfType withPrefix: #FamixValue
]
