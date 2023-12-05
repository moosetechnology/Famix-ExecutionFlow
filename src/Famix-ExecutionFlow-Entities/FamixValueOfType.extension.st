Extension { #name : #FamixValueOfType }

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> argumentInMethodCall [
	"Relation named: #argumentInMethodCall type: #FamixEFMethodCall opposite: #arguments"

	<generated>
	<FMComment: 'The calls that use me as an argument.'>
	<FMProperty: #argumentInMethodCall type: #FamixEFMethodCall opposite: #arguments>
	<package: #'Famix-ExecutionFlow-Entities'>
	^ self attributeAt: #argumentInMethodCall ifAbsent: [ nil ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> argumentInMethodCall: anObject [

	<generated>
	self attributeAt: #argumentInMethodCall put: (FMMultivalueLink on: self update: #arguments from: self argumentInMethodCall to: anObject).
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> receiverInMethodCall [
	"Relation named: #receiverInMethodCall type: #FamixEFMethodCall opposite: #receiver"

	<generated>
	<FMComment: 'The calls that use me as receiver.'>
	<derived>
	<FMProperty: #receiverInMethodCall type: #FamixEFMethodCall opposite: #receiver>
	<package: #'Famix-ExecutionFlow-Entities'>
	^ self attributeAt: #receiverInMethodCall ifAbsentPut: [ FMMultivalueLink on: self opposite: #receiver: ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> receiverInMethodCall: anObject [

	<generated>
	self receiverInMethodCall value: anObject
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> resultInMethodCall [
	"Relation named: #resultInMethodCall type: #FamixEFMethodCall opposite: #result"

	<generated>
	<FMComment: 'The calls that returns me.'>
	<derived>
	<FMProperty: #resultInMethodCall type: #FamixEFMethodCall opposite: #result>
	<package: #'Famix-ExecutionFlow-Entities'>
	^ self attributeAt: #resultInMethodCall ifAbsentPut: [ FMMultivalueLink on: self opposite: #result: ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixValueOfType >> resultInMethodCall: anObject [

	<generated>
	self resultInMethodCall value: anObject
]
