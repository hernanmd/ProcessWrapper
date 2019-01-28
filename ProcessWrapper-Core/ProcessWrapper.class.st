Class {
	#name : #ProcessWrapper,
	#superclass : #Object,
	#instVars : [
		'processPointer',
		'useStdout',
		'useStderr',
		'stdoutStream',
		'stderrStream',
		'waiterSemaphore'
	],
	#classVars : [
		'Registry'
	],
	#category : #'ProcessWrapper-Core'
}

{ #category : #'generated primitive calls' }
ProcessWrapper class >> closeStderr: anExternalProcessPointer [

	<primitive: 'primitiveCloseStderr' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> closeStdin: anExternalProcessPointer [

	<primitive: 'primitiveCloseStdin' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> closeStdout: anExternalProcessPointer [

	<primitive: 'primitiveCloseStdout' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> exitCode: anExternalProcessPointer [

	<primitive: 'primitiveExitCode' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #finalization }
ProcessWrapper class >> finalizationRegistry [

	^Registry ifNil: [ Registry := WeakRegistry new ]

]

{ #category : #'plugin handling' }
ProcessWrapper class >> initialize [

	super initialize.
	Smalltalk 
		addToStartUpList: self;
		addToShutDownList: self.


]

{ #category : #'plugin handling' }
ProcessWrapper class >> isPluginLoaded [

	^ Smalltalk vm listLoadedModules anySatisfy: [ :each |
		each beginsWith: self pluginName ]

]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> isRunning: anExternalProcessPointer [

	<primitive: 'primitiveIsRunning' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> logLevelDebug [

	<primitive: 'primitiveLogLevelDebug' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> logLevelError [

	<primitive: 'primitiveLogLevelError' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> logLevelInfo [

	<primitive: 'primitiveLogLevelInfo' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> logLevelNone [

	<primitive: 'primitiveLogLevelNone' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> logTest [

	<primitive: 'primitiveLogTest' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'instance creation' }
ProcessWrapper class >> new [

	^super new
		processPointer: self newProcess;
		registerForFinalization;
		yourself.

	
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> newProcess [

	<primitive: 'primitiveNewProcess' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'plugin handling' }
ProcessWrapper class >> pluginName [
	
	^'ProcessWrapperPlugin'
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> pluginVersion [

	<primitive: 'primitivePluginVersion' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'startup-shutdown' }
ProcessWrapper class >> purgeFinalizationRegistry [

	self finalizationRegistry keys do: [ :each |
		self finalizationRegistry remove: each ifAbsent: [] ]

]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> readFromStderr: anExternalProcessPointer into: aByteArray size: anInteger [

	<primitive: 'primitiveReadFromStderrIntoSize' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> readFromStdout: anExternalProcessPointer into: aByteArray size: anInteger [

	<primitive: 'primitiveReadFromStdoutIntoSize' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #finalization }
ProcessWrapper class >> registerForFinalization: aProcessWrapper [

	self finalizationRegistry 
		remove: aProcessWrapper ifAbsent: [];
		add: aProcessWrapper 

]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> removeProcess: anExternalProcessPointer [

	<primitive: 'primitiveRemoveProcess' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> setStderrSemaphore: aSemaphoreIndex for: anExternalProcessPointer [

	<primitive: 'primitiveSetStderrSemaphoreFor' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> setStdoutSemaphore: aSemaphoreIndex for: anExternalProcessPointer [

	<primitive: 'primitiveSetStdoutSemaphoreFor' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> setWaiterSemaphore: aSemaphoreIndex for: anExternalProcessPointer [

	<primitive: 'primitiveSetWaiterSemaphoreFor' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> showWindowAtStartup: anExternalProcessPointer [

	<primitive: 'primitiveShowWindowAtStartup' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'startup-shutdown' }
ProcessWrapper class >> shutDown: quitting [

	quitting ifTrue: [ self purgeFinalizationRegistry ]
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> startProcess: anExternalProcessPointer withCommandLine: aString [

	<primitive: 'primitiveStartProcessWithCommandLine' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'startup-shutdown' }
ProcessWrapper class >> startUp: resuming [

	resuming ifTrue: [ self purgeFinalizationRegistry ]
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> terminate: anExternalProcessPointer [

	<primitive: 'primitiveTerminate' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'plugin handling' }
ProcessWrapper class >> unloadPlugin [

	Smalltalk garbageCollect.
	Smalltalk garbageCollect.	"To remove the executors"
	self allInstances size isZero ifFalse: [ ^self error: 'ProcessWrapper instances hanging!'].
	Smalltalk vm unloadModule: self pluginName
]

{ #category : #'generated primitive calls' }
ProcessWrapper class >> writeToStdin: anExternalProcessPointer message: aByteArray length: anInteger [

	<primitive: 'primitiveWriteToStdinMessageLength' module: 'ProcessWrapperPlugin'>
	self primitiveFailed
]

{ #category : #'private - finalization' }
ProcessWrapper >> actAsExecutor [

	super actAsExecutor.
	stdoutStream := nil.
	stderrStream := nil
	
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> close [

	^self closeStdin
]

{ #category : #'input-output handling' }
ProcessWrapper >> closeStderr [

	^self class closeStderr: processPointer 
]

{ #category : #'input-output handling' }
ProcessWrapper >> closeStdin [

	^self class closeStdin: processPointer 
]

{ #category : #'input-output handling' }
ProcessWrapper >> closeStdout [

	^self class closeStdout: processPointer 
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> errorUpToEnd [

	^stderrStream upToEnd
]

{ #category : #'runtime information' }
ProcessWrapper >> exitCode [

	^self class exitCode: processPointer 
]

{ #category : #'private - finalization' }
ProcessWrapper >> finalize [

	self class removeProcess: processPointer.
	Smalltalk unregisterExternalObject: waiterSemaphore
	

]

{ #category : #private }
ProcessWrapper >> initialize [

	useStdout := false.
	useStderr := false

	

]

{ #category : #'runtime information' }
ProcessWrapper >> isRunning [

	^self class isRunning: processPointer 
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> next [

	^stdoutStream next
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> next: anInteger [

	^stdoutStream next: anInteger
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> nextPut: aCharacterOrByte [

	^self nextPutAll: 
		(aCharacterOrByte isCharacter
			ifTrue: [ String with: aCharacterOrByte ]
			ifFalse: [ ByteArray with: aCharacterOrByte ])
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> nextPutAll: aStringOrByteArray [

	^self writeToStdin: aStringOrByteArray asByteArray
]

{ #category : #private }
ProcessWrapper >> prepareStderr [

	useStderr ifFalse: [ ^self ].
	stderrStream := PWOutputStream on: self with: #readFromStderrInto: with: #setStderrSemaphore:

]

{ #category : #private }
ProcessWrapper >> prepareStdout [

	useStdout ifFalse: [ ^self ].
	stdoutStream := PWOutputStream on: self with: #readFromStdoutInto: with: #setStdoutSemaphore:

]

{ #category : #private }
ProcessWrapper >> prepareWaiterSemaphore [ 

	| semaphoreIndex |
	waiterSemaphore := Semaphore new.
	semaphoreIndex := Smalltalk registerExternalObject: waiterSemaphore.
	self class setWaiterSemaphore: semaphoreIndex for: processPointer

]

{ #category : #private }
ProcessWrapper >> processPointer: aSmallInteger [

	processPointer ifNil: [ processPointer := aSmallInteger ]
]

{ #category : #private }
ProcessWrapper >> readFromStderrInto: aByteArrayOrString [

	^self class 
		readFromStderr: processPointer 
		into: aByteArrayOrString 
		size: aByteArrayOrString size
]

{ #category : #private }
ProcessWrapper >> readFromStdoutInto: aByteArrayOrString [

	^self class 
		readFromStdout: processPointer 
		into: aByteArrayOrString 
		size: aByteArrayOrString size
]

{ #category : #'private - finalization' }
ProcessWrapper >> registerForFinalization [
	
	self class registerForFinalization: self
]

{ #category : #private }
ProcessWrapper >> setStderrSemaphore: aSemaphoreIndex [

	^self class 
		setStderrSemaphore: aSemaphoreIndex  
		for: processPointer 
]

{ #category : #private }
ProcessWrapper >> setStdoutSemaphore: aSemaphoreIndex [

	^self class 
		setStdoutSemaphore: aSemaphoreIndex  
		for: processPointer 
]

{ #category : #'pre-start options' }
ProcessWrapper >> showWindowAtStartup [

	^self class showWindowAtStartup: processPointer 
]

{ #category : #'start-stop' }
ProcessWrapper >> startWithCommand: aStringOrByteArray [
	
	| input |
	self 
		prepareStdout;
		prepareStderr;
		prepareWaiterSemaphore;
		registerForFinalization.
	input := aStringOrByteArray asByteArray.
	input last = 0 ifFalse: [ input := input copyWith: 0 ].
	^self class startProcess: processPointer  withCommandLine: input
]

{ #category : #'start-stop' }
ProcessWrapper >> startWithShellCommand: aStringOrByteArray [

	^self startWithCommand: 'cmd.exe /C ' asByteArray, aStringOrByteArray asByteArray
]

{ #category : #'input-output handling' }
ProcessWrapper >> stderrStream [

	^stderrStream 

	
]

{ #category : #'input-output handling' }
ProcessWrapper >> stdoutStream [

	^stdoutStream 

	
]

{ #category : #'start-stop' }
ProcessWrapper >> terminate [

	^self class terminate: processPointer 
]

{ #category : #'osprocess-like streaming api' }
ProcessWrapper >> upToEnd [

	^stdoutStream upToEnd
]

{ #category : #'pre-start options' }
ProcessWrapper >> useStderr [

	useStderr := true
]

{ #category : #'pre-start options' }
ProcessWrapper >> useStdout [

	useStdout := true
]

{ #category : #'start-stop' }
ProcessWrapper >> waitForExit [

	self isRunning ifFalse: [ ^true ].
	waiterSemaphore wait.
	^self isRunning not


]

{ #category : #'start-stop' }
ProcessWrapper >> waitForExitFor: timeoutMilliseconds [

	self isRunning ifFalse: [ ^true ].
	waiterSemaphore waitTimeoutMSecs: timeoutMilliseconds.
	^self isRunning not


]

{ #category : #'input-output handling' }
ProcessWrapper >> writeToStdin: aByteArray [

	^self class writeToStdin:  processPointer message:  aByteArray length: aByteArray size
]
