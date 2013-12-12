//
//  MRCStringReverse.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/12/13.
//
//

#import "MRCStringReverse.h"

@implementation MRCStringReverse

- (NSString *)reverseString:(NSString *)stringToReverse {
	NSMutableString *result = [NSMutableString stringWithCapacity:[stringToReverse length]];
    BNRTimeBlock(^{
        
        for (NSInteger index = [stringToReverse length] - 1; index >= 0; index--) {
            [result appendString:[NSString stringWithFormat:@"%C", [stringToReverse characterAtIndex:index]]];
        }
    });
    
	return [result copy];
}

@end
