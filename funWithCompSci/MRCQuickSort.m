//
//  MRCQuickSort.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCQuickSort.h"

@interface MRCQuickSort ()
@property (atomic, strong) NSMutableArray *arrayToSort;
@end

@implementation MRCQuickSort

- (NSString *)complexity:(MRCBigOComplexityType)complexityType {
    static NSString *average = @"O(n1.25)";
    static NSString *best = @"O(n log(n))";
    static NSString *worst = @"O(n^2)";
    
    switch (complexityType) {
        case MRCBigOComplexityTypeAverage:
            return average;
            break;
        case MRCBigOComplexityTypeBest:
            return best;
            break;
        case MRCBigOComplexityTypeWorst:
            return worst;
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)algorithmName {
    return @"Quicksort";
}

- (void)sort {
    self.status = MRCArraySortStatusInProgress;
    
    self.runTime = BNRTimeBlock(^{
        [self quicksortWithLeftIndex:0 withRightIndex:[self.arrayToSort count] - 1];
    });
    
    self.status = MRCArraySortStatusFinished;
}

- (void)quicksortWithLeftIndex:(NSInteger)left withRightIndex:(NSInteger)right {
    if (left >= right) {
        return;
    }
    
    NSNumber *pivot = self.arrayToSort[(left + right) / 2];
    NSInteger leftCounter = left;
    NSInteger rightCounter = right;
    
    while (leftCounter <= rightCounter) {
        while ([self.arrayToSort[leftCounter] compare:pivot] == NSOrderedAscending) {
            leftCounter++;
        }
        while ([self.arrayToSort[rightCounter] compare:pivot] == NSOrderedDescending) {
            rightCounter--;
        }
        
        if (leftCounter <= rightCounter) {
            MRCSortObject *obj1 = self.arrayToSort[leftCounter];
            obj1.active = YES;
            MRCSortObject *obj2 = self.arrayToSort[rightCounter];
            obj2.active = YES;
            
            if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
                [self.statusDelegate algorithm:self didUpdateArray:[self.arrayToSort copy]];
            }
            
            [self.arrayToSort exchangeObjectAtIndex:leftCounter++ withObjectAtIndex:rightCounter--];
        }
        if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
            [self.statusDelegate algorithm:self didUpdateArray:[self.arrayToSort copy]];
        }
        
        MRCSortObject *obj1 = self.arrayToSort[leftCounter - 1];
        obj1.active = NO;
        MRCSortObject *obj2 = self.arrayToSort[rightCounter + 1];
        obj2.active = NO;
    }
    
    if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
        [self.statusDelegate algorithm:self didUpdateArray:[self.arrayToSort copy]];
    }
    
    [self quicksortWithLeftIndex:left withRightIndex:rightCounter];
    [self quicksortWithLeftIndex:leftCounter withRightIndex:right];
}

@end
