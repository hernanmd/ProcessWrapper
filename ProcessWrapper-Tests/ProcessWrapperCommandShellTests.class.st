Class {
	#name : #ProcessWrapperCommandShellTests,
	#superclass : #ProcessWrapperTests,
	#category : #'ProcessWrapper-Tests'
}

{ #category : #testing }
ProcessWrapperCommandShellTests >> testCopy [

	| file1 file2 |
	file1 := self newFileName.
	file2 := self newFileName.
	(FileSystem workingDirectory / file1) writeStream close.
	self should: (process startWithShellCommand: 'copy ', file1, ' ', file2).
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	self should: file1 asFileReference exists.
	self should: file2 asFileReference exists.

]

{ #category : #testing }
ProcessWrapperCommandShellTests >> testDelete [

	| file |
	file := self newFileName.
	(FileSystem workingDirectory / file) writeStream close.
	self should: (process startWithShellCommand: 'del ', file).
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	self shouldnt: file asFileReference exists.

]

{ #category : #testing }
ProcessWrapperCommandShellTests >> testEcho [

	process useStdout.
	self should: (process startWithShellCommand: 'echo blabla').
	self should: (process upToEnd = ('blabla', String crlf)).
	self should: (process waitForExitFor: 1000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	
]

{ #category : #testing }
ProcessWrapperCommandShellTests >> testMove [

	| file1 file2 |
	file1 := self newFileName.
	file2 := self newFileName.
	(FileSystem workingDirectory / file1) writeStream close.
	process startWithShellCommand: 'move ', file1, ' ', file2.
	process waitForExitFor: 1000.
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	self shouldnt: file1 asFileReference exists.
	self should: file2 asFileReference exists.
]

{ #category : #testing }
ProcessWrapperCommandShellTests >> testType [

	| file |
	file := self newFileName.
	(FileSystem workingDirectory / file) writeStream
		nextPutAll: 'blabla';
		close.
	process useStdout.
	self should: (process startWithShellCommand: 'type ', file).
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	self should: (process upToEnd = 'blabla').

]
