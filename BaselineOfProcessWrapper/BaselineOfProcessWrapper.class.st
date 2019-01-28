Class {
	#name : #BaselineOfProcessWrapper,
	#superclass : #BaselineOf,
	#classVars : [
		'LastVersionLoad'
	],
	#category : #BaselineOfProcessWrapper
}

{ #category : #baselines }
BaselineOfProcessWrapper >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec 
			package: 'ProcessWrapper-Core';
			package: 'ProcessWrapper-Tests'.
		spec 
			group: 'Core' with: #('ProcessWrapper-Core');
			group: 'Tests' with: #('ProcessWrapper-Core' 'ProcessWrapper-Tests') ].

]

{ #category : #doits }
BaselineOfProcessWrapper >> ensureMetacelloFileDownload [

	Metacello new           
		baseline: 'MetacelloFileDownload';              
		repository: 'github://hernanmd/MetacelloFileDownload';          
		load.
]

{ #category : #doits }
BaselineOfProcessWrapper >> platformFilesUrl [
	" Answer a <Collection> of download URLs for the current platform "
	
	^ #('http://leves.web.elte.hu/ProcessWrapper/ProcessWrapperPlugin.dll')
]

{ #category : #doits }
BaselineOfProcessWrapper >> preLoad [

	self unloadPlugin.
	self ensureMetacelloFileDownload.
	super preLoad.
]

{ #category : #doits }
BaselineOfProcessWrapper >> unloadPlugin [

	(Smalltalk hasClassNamed: #ProcessWrapper)
		ifFalse: [ ^ self ].
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.	"To remove the executors"
	(Smalltalk at: #ProcessWrapper) allInstances size isZero
		ifFalse: [ ^ self error: 'ProcessWrapper instances hanging!' ].
	Smalltalk vm unloadModule: 'ProcessWrapperPlugin'
]
