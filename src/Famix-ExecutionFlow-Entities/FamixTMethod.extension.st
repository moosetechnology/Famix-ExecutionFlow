Extension { #name : #FamixTMethod }

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixTMethod >> methodCalls [
	"Relation named: #methodCalls type: #FamixEFMethodCall opposite: #method"

	<generated>
	<FMComment: 'Actual calls to me in an ExecutionFlow model.'>
	<derived>
	<FMProperty: #methodCalls type: #FamixEFMethodCall opposite: #method>
	<package: #'Famix-ExecutionFlow-Entities'>
	^ self attributeAt: #methodCalls ifAbsentPut: [ FMMultivalueLink on: self opposite: #method: ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-accessing' }
FamixTMethod >> methodCalls: anObject [

	<generated>
	self methodCalls value: anObject
]
