Extension { #name : 'FamixEFMethodCall' }

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> arguments [
	"Relation named: #arguments type: #FamixValueOfType opposite: #argumentInMethodCall"

	<generated>
	<FMComment: 'The arguments of the call.'>
	<derived>
	<FMProperty: #arguments type: #FamixValueOfType opposite: #argumentInMethodCall>
	<package: #'Famix-ExecutionFlow-Value-Entities'>
	^ self attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #argumentInMethodCall: ]
]

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> receiver [
	"Relation named: #receiver type: #FamixValueOfType opposite: #receiverInMethodCall"

	<generated>
	<FMComment: 'The receiver of the call.'>
	<FMProperty: #receiver type: #FamixValueOfType opposite: #receiverInMethodCall>
	<package: #'Famix-ExecutionFlow-Value-Entities'>
	^ self attributeAt: #receiver ifAbsent: [ nil ]
]

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> receiver: anObject [

	<generated>
	self attributeAt: #receiver put: (FMMultivalueLink on: self update: #receiverInMethodCall from: self receiver to: anObject).
]

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> result [
	"Relation named: #result type: #FamixValueOfType opposite: #resultInMethodCall"

	<generated>
	<FMComment: 'The result of the call.'>
	<FMProperty: #result type: #FamixValueOfType opposite: #resultInMethodCall>
	<package: #'Famix-ExecutionFlow-Value-Entities'>
	^ self attributeAt: #result ifAbsent: [ nil ]
]

{ #category : '*Famix-ExecutionFlow-Value-Entities-accessing' }
FamixEFMethodCall >> result: anObject [

	<generated>
	self attributeAt: #result put: (FMMultivalueLink on: self update: #resultInMethodCall from: self result to: anObject).
]
