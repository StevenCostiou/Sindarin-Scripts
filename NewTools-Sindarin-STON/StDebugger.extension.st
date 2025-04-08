Extension { #name : 'StDebugger' }

{ #category : '*NewTools-Sindarin-STON' }
StDebugger class >> buildSindarinSTONExtentionCommandsGroupWith: stDebuggerInstance forRoot: rootCommandGroup [

	<extensionCommands>
	| commands toolbarGroup toolbarSTONGroup |
	commands := self stonReaderParsingSelectors collect: [ :selector |
		            | cmd |
		            cmd := SindarinSTONParsingCommand forSpecContext:
			                   stDebuggerInstance.
		            cmd decoratedCommand targetParsingMethod: selector asString.
		            cmd ].
	
	toolbarGroup := rootCommandGroup / StDebuggerToolbarCommandTreeBuilder groupName.
	toolbarSTONGroup := CmCommandGroup forSpec
			beToolbarPopoverButton;
			name: 'STON';
			icon: (stDebuggerInstance application iconNamed: #smallDebugIt);
			yourself.
	toolbarGroup register: toolbarSTONGroup.
	commands do: [ :c | toolbarSTONGroup register: c ].		 
]

{ #category : '*NewTools-Sindarin-STON' }
StDebugger class >> stonReaderParsingSelectors [

	^ (STONReader methods select: [ :m | 'parse*' match: m selector ])
		  collect: #selector
]
