//
//  MRCSortObject.h
//  funWithCompSci
//
//  Created by mathew cruz on 12/12/13.
//
//

#import <Foundation/Foundation.h>

@interface MRCSortObject : NSObject
@property (nonatomic, strong, readonly) NSNumber *value;
@property (atomic) BOOL active;

- (instancetype)initWithNumber:(NSNumber *)number;
- (NSComparisonResult)compare:(id)valueToCompare;

@end
