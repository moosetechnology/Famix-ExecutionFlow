Class {
	#name : 'FamixEFVModel',
	#superclass : 'MooseModel',
	#traits : 'FamixEFTEntityCreator + FamixValueTEntityCreator',
	#classTraits : 'FamixEFTEntityCreator classTrait + FamixValueTEntityCreator classTrait',
	#category : 'Famix-ExecutionFlow-Value-Entities-Model',
	#package : 'Famix-ExecutionFlow-Value-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixEFVModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Value-Entities' #'Famix-Traits' #'Famix-ExecutionFlow-Entities')
]

{ #category : 'meta' }
FamixEFVModel class >> annotation [
	<FMClass: #FamixEFVModel super: #MooseModel>
	<package: #'Famix-ExecutionFlow-Value-Entities'>
	<generated>
]
