"
A FamixEFMethodCallTest is a test class for testing the behavior of FamixEFMethodCall
"
Class {
	#name : #FamixEFMethodCallTest,
	#superclass : #TestCase,
	#instVars : [
		'parent',
		'child',
		'origin',
		'descendant1',
		'descendant2',
		'pSibling1',
		'pSibling2',
		'fSibling1',
		'fSibling2',
		'pSibling2Child',
		'fSibling1Child',
		'preceding',
		'following',
		'ancestor'
	],
	#category : #'Famix-ExecutionFlow-Tests'
}

{ #category : #running }
FamixEFMethodCallTest >> newCallNamed: aName [

	^ FamixEFDirectMethodCall new method: (FamixStMethod named: aName)
]

{ #category : #running }
FamixEFMethodCallTest >> setUp [

	super setUp.
	origin := (self newCallNamed: 'origin') calls:
		          { (child := self newCallNamed: 'child') }.
	child calls: {
			(descendant1 := self newCallNamed: 'descendant1').
			(descendant2 := self newCallNamed: 'descendant2') }.
	(parent := self newCallNamed: 'parent') calls: {
			(pSibling1 := self newCallNamed: 'pSibling1').
			(pSibling2 := self newCallNamed: 'pSibling2').
			origin.
			(fSibling1 := self newCallNamed: 'fSibling1').
			(fSibling2 := self newCallNamed: 'fSibling2') }.
	pSibling2 calls:
		{ (pSibling2Child := self newCallNamed: 'pSibling2Child') }.
	fSibling1 calls:
		{ (fSibling1Child := self newCallNamed: 'fSibling1Child') }.
	ancestor := (self newCallNamed: 'ancestor') calls: {
			            (preceding := self newCallNamed: 'preceding').
			            parent.
			            (following := self newCallNamed: 'following') }.

	"Set sibling relations"
	{
		ancestor.
		parent.
		child } do: [ :call |
		| calls |
		calls := call calls asOrderedCollection.
		calls withIndexDo: [ :c :i |
			i < calls size ifTrue: [ c nextSibling: (calls at: i + 1) ] ] ]
]

{ #category : #tests }
FamixEFMethodCallTest >> testAncestors [

	| ancestors |
	ancestors := origin ancestors.
	self assertCollection: ancestors equals: {
			parent.
			ancestor } asOrderedCollection
]

{ #category : #tests }
FamixEFMethodCallTest >> testDescendants [

	| descendants |
	descendants := origin descendants.
	self assertCollection: descendants equals: {
			child.
			descendant1.
			descendant2 } asOrderedCollection
]

{ #category : #tests }
FamixEFMethodCallTest >> testFollowing [

	self assertCollection: origin following equals: {
			fSibling1.
			fSibling1Child.
			fSibling2.
			following } asOrderedCollection
]

{ #category : #tests }
FamixEFMethodCallTest >> testFollowingSiblings [

	self assertCollection: origin followingSiblings equals: {
			fSibling1.
			fSibling2 } asOrderedCollection
]

{ #category : #tests }
FamixEFMethodCallTest >> testMooseNameOn [

	| method |
	method := origin method.
	origin method: nil.

	self assert: origin mooseName equals: '<unknownMethod>()'.

	origin method: method.
	self assert: origin mooseName equals: 'origin()'.

	origin receiver:
		(FamixValueOfObject new type: (FamixJavaClass named: 'Object')).
	self
		assert: origin mooseName
		equals: 'Object={0 attributes}.origin()'.

	origin addArgument: (FamixValueOfPrimitiveType new
			 value: 42;
			 type: (FamixJavaPrimitiveType named: 'int')).
	self
		assert: origin mooseName
		equals: 'Object={0 attributes}.origin(int=42)'.

	origin result: (FamixValueOfPrimitiveType new
			 value: 'meaning of life';
			 type: (FamixJavaClass named: 'String')).
	self
		assert: origin mooseName
		equals:
		'Object={0 attributes}.origin(int=42)->String=''meaning of life'''.

	origin addArgument: (FamixValueOfPrimitiveType new
			 value: true;
			 type: (FamixJavaPrimitiveType named: 'boolean')).
	self
		assert: origin mooseName
		equals:
		'Object={0 attributes}.origin(int=42,boolean=true)->String=''meaning of life'''
]

{ #category : #tests }
FamixEFMethodCallTest >> testPreceding [

	self assertCollection: origin preceding equals: {
			pSibling2Child.
			pSibling2.
			pSibling1.
			preceding } asOrderedCollection
]

{ #category : #tests }
FamixEFMethodCallTest >> testPrecedingSiblings [

	self assertCollection: origin precedingSiblings equals: {
			pSibling2.
			pSibling1 } asOrderedCollection
]
