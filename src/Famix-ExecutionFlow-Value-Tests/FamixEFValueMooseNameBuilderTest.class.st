Class {
	#name : 'FamixEFValueMooseNameBuilderTest',
	#superclass : 'TestCase',
	#instVars : [
		'methodCall'
	],
	#category : 'Famix-ExecutionFlow-Value-Tests',
	#package : 'Famix-ExecutionFlow-Value-Tests'
}

{ #category : 'running' }
FamixEFValueMooseNameBuilderTest >> setUp [

	super setUp.
	methodCall := FamixEFDirectMethodCall new method:
		              (FamixStMethod named: 'origin')
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOn [

	self assert: methodCall mooseName equals: 'origin()'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnArgument [

	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).

	self
		assert: methodCall mooseName
		equals: 'origin(' , methodCall arguments first mooseName , ')'
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnArgumentResult [

	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: methodCall mooseName
		equals: 'origin(' , methodCall arguments first mooseName , ')->'
			, methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiver [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).

	self
		assert: methodCall mooseName
		equals: methodCall receiver mooseName , '.origin()'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverArgument [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).

	self
		assert: methodCall mooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ')'
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverArgumentResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: methodCall mooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ')->'
			, methodCall result mooseName
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: methodCall mooseName
		equals: methodCall receiver mooseName , '.origin()->'
			, methodCall result mooseName
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverTwoArgumentsResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).
	methodCall addArgument: (FamixValueOfPrimitiveType new
			 value: true;
			 type: (FamixJavaPrimitiveType named: 'boolean')).
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: methodCall mooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ','
			, methodCall arguments second mooseName , ')->'
			, methodCall result mooseName
]

{ #category : 'nil' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnResult [

	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: methodCall mooseName
		equals: 'origin()->' , methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnUnknownMethod [

	methodCall method: nil.
	self assert: methodCall mooseName equals: '<unknownMethod>()'
]
