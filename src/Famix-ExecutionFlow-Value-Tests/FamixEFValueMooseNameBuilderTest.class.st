Class {
	#name : 'FamixEFValueMooseNameBuilderTest',
	#superclass : 'FamixEFMooseNameBuilderAbstractTest',
	#category : 'Famix-ExecutionFlow-Value-Tests',
	#package : 'Famix-ExecutionFlow-Value-Tests'
}

{ #category : 'configuring' }
FamixEFValueMooseNameBuilderTest >> builder [

	^ FamixEFValueMooseNameBuilder new
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOn [

	self assert: self buildMooseName equals: '<container?>.origin()'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnArgument [

	methodCall arguments: { (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')) }.

	self
		assert: self buildMooseName
		equals:
		'<container?>.origin(' , methodCall arguments first mooseName , ')'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnArgumentResult [

	methodCall arguments: { (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')) }.
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: self buildMooseName
		equals:
			'<container?>.origin(' , methodCall arguments first mooseName
			, ')->' , methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiver [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).

	self
		assert: self buildMooseName
		equals: methodCall receiver mooseName , '.origin()'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverArgument [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall arguments: { (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')) }.

	self
		assert: self buildMooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ')'
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverArgumentResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall arguments: { (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')) }.
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: self buildMooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ')->'
			, methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: self buildMooseName
		equals: methodCall receiver mooseName , '.origin()->'
			, methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnReceiverTwoArgumentsResult [

	methodCall receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	methodCall arguments: {
			(FamixValueOfPrimitiveType new
				 value: 42;
				 type: (FamixJavaPrimitiveType named: 'int')).
			(FamixValueOfPrimitiveType new
				 value: true;
				 type: (FamixJavaPrimitiveType named: 'boolean')) }.
	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: self buildMooseName
		equals: methodCall receiver mooseName , '.origin('
			, methodCall arguments first mooseName , ','
			, methodCall arguments second mooseName , ')->'
			, methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnResult [

	methodCall result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).

	self
		assert: self buildMooseName
		equals: '<container?>.origin()->' , methodCall result mooseName
]

{ #category : 'tests' }
FamixEFValueMooseNameBuilderTest >> testMooseNameOnUnknownMethod [

	methodCall method: nil.
	self assert: self buildMooseName equals: '<method?>()'
]
