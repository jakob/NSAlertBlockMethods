//
//  NSAlert+BlockMethods.m
//
//  Created by Jakob Egger on 22/11/13.
//

#import "NSAlert+BlockMethods.h"

@implementation NSAlert (BlockMethods)

-(void)compatibleBeginSheetModalForWindow:(NSWindow *)sheetWindow completionHandler:(void (^)(NSInteger returnCode))handler {
	[self beginSheetModalForWindow: sheetWindow
					 modalDelegate: self
					didEndSelector: @selector(blockBasedAlertDidEnd:returnCode:contextInfo:)
					   contextInfo: (__bridge_retained void*)handler ];
}

- (void) blockBasedAlertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
	void(^handler)(NSInteger) = (__bridge_transfer void(^)(NSInteger)) contextInfo;
	handler(returnCode);
}

@end
