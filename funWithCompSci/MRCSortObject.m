//
//  MRCSortObject.m
//  funWithCompSci
//
//  Created by mathew cruz on 12/12/13.
//
//

#import "MRCSortObject.h"

@implementation MRCSortObject

- (instancetype)initWithNumber:(NSNumber *)number {
    self = [super init];
    if (self) {
        _value = number;
    }
    return self;
}

- (NSComparisonResult)compare:(id)valueToCompare {
    if ([valueToCompare isKindOfClass:[self class]]) {
        return [self.value compare:((MRCSortObject *)valueToCompare).value];
    }
    return [self.value compare:valueToCompare];
}

- (NSString *)description {
    return self.value.description;
}

@end
