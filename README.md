NSAlertBlockMethods
===================

Provides a category method for NSAlert to use a block based API on OS X before Mavericks.

Usage
-----

Just add the two files to your XCode Project. Include the header file and then use the `-compatibleBeginSheetModalForWindow:completionHandler:` method.

Sample:

	NSAlert *alert = [NSAlert alertWithMessageText: @"Do you want to save changes?"
									 defaultButton: @"Save"
								   alternateButton: @"Don't save"
									   otherButton: @"Cancel"
						 informativeTextWithFormat: @"If you don't save, your changes will be lost"];
	
	[alert compatibleBeginSheetModalForWindow: self.window completionHandler: ^(NSInteger returnCode){
		if (returnCode==NSAlertDefaultReturn) {
			NSLog(@"Save");
		}
		else if (returnCode==NSAlertAlternateReturn) {
			NSLog(@"Don't Save");
		}
		else if (returnCode==NSAlertOtherReturn) {
			NSLog(@"Cancel");
		}
	}];

Motivation
----------

In Mac OS X 10.6 Snow Leopard, when Apple introduced blocks, they added a really convenient method to NSSavePanel and NSOpenPanel: `-beginSheetModalForWindow:completionHandler:`.
However, it seems that they forgot to add the same API to NSAlert.
They didn't fix this in OS X 10.7 Lion, and they still didn't fix it in 10.8 Mountain Lion.
It took them until Mac OS X 10.9 Mavericks to finally add the missing API to NSAlert!

Unfortunately, my software needs to run on older Macs as well.
Seeing how easy it is to write a category that does exactly what I want, I wrote this category, and use it instead of the Mavericks API.

It might be overkill to create a github repo for this simple category, but I figured that's the easiest way to share this snippet and provide a README.

License
-------

This code is so trivial I don't want to burden it with a license. Use it in any way you want. Redistribute it under any license you like. Or not.