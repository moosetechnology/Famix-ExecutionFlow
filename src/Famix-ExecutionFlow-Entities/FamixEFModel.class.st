Class {
	#name : 'FamixEFModel',
	#superclass : 'MooseModel',
	#traits : 'FamixEFTEntityCreator',
	#classTraits : 'FamixEFTEntityCreator classTrait',
	#category : 'Famix-ExecutionFlow-Entities-Model',
	#package : 'Famix-ExecutionFlow-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixEFModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : 'meta' }
FamixEFModel class >> annotation [
	<FMClass: #FamixEFModel super: #MooseModel>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
]
