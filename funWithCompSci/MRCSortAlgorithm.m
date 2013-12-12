//
//  MRCSortAlgorithm.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCSortAlgorithm.h"
#import <mach/mach_time.h>
#import "MRCMergeSort.h"
#import "MRCBubbleSort.h"
#import "MRCShellSort.h"
#import "MRCQuickSort.h"
#import "MRCInsertionSort.h"

@implementation MRCSortAlgorithm

- (instancetype)initWithAlgorithm:(MRCArraySortAlgorithm)algorithm total:(NSUInteger)total {
    switch (algorithm) {
        case MRCArraySortAlgorithmMerge:
            self = [[MRCMergeSort alloc] init];
            break;
        case MRCArraySortAlgorithmBubble:
            self = [[MRCBubbleSort alloc] init];
            break;
        case MRCArraySortAlgorithmShell:
            self = [[MRCShellSort alloc] init];
            break;
        case MRCArraySortAlgorithmQuick:
            self = [[MRCQuickSort alloc] init];
            break;
        case MRCArraySortAlgorithmInsertion:
            self = [[MRCInsertionSort alloc] init];
            break;
        default:
            break;
    }
    
    if (self) {
        _numberOfItems = total;
        [self setup];
    }
    return self;
}

- (void)reset {
    _arrayToSort = nil;
    [self setup];
}

- (void)setup {
    _status = MRCArraySortStatusNotStarted;
    _arrayToSort = [self createRandomizedArrayWithTotal:self.numberOfItems];
}

- (NSString *)complexity:(MRCBigOComplexityType)complexityType {
    return @"";
}

- (NSMutableArray *)createRandomizedArrayWithTotal:(NSUInteger)total {
    NSMutableArray *randomArray = [NSMutableArray arrayWithCapacity:total];
    
    NSUInteger index = 0;
    MRCSortObject *value;
    while (index < total) {
        @autoreleasepool {
            value = [[MRCSortObject alloc] initWithNumber:@(index++)];
            [randomArray addObject:value];
        }
    }
    
    [self randomizeArray:randomArray];
    
    return randomArray;
}

- (void)randomizeArray:(NSMutableArray *)array {
    
    for (NSUInteger i = [array count]; i > 1; i--) {
        NSUInteger j = arc4random_uniform(i);
        [array exchangeObjectAtIndex:i - 1 withObjectAtIndex:j];
    }
}

- (void)sort {
    
}

CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;
    
    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;
    
    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
    
}

@end
