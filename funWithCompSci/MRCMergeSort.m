//
//  MRCMergeSort.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCMergeSort.h"

@interface MRCMergeSort ()
@property (atomic, strong) NSMutableArray *arrayToSort;
@property (nonatomic, assign) MRCArraySortStatus status;
@end

@implementation MRCMergeSort

- (NSString *)complexity:(MRCBigOComplexityType)complexityType {
    static NSString *average = @"O(n log(n))";
    static NSString *best = @"O(n log(n))";
    static NSString *worst = @"O(n log(n))";
    
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

- (void)sort {
    // self.status = MRCArraySortStatusInProgress;
    self.runTime = BNRTimeBlock(^{
        [self mergeArrayWithMinIndex:0 withMaxIndex:[self.arrayToSort count] -1];
    });
    
    //self.status = MRCArraySortStatusFinished;
}

- (void)mergeArrayWithMinIndex:(NSUInteger)minIndex withMaxIndex:(NSUInteger)maxindex
{
	NSUInteger midIndex = 0;
    
	if (minIndex < maxindex) {
		midIndex = (minIndex + maxindex) / 2;
		[self mergeArrayWithMinIndex:minIndex withMaxIndex:midIndex];
		[self mergeArrayWithMinIndex:midIndex + 1 withMaxIndex:maxindex];
		[self mergeArrayWithMinimalIndex:minIndex withMediumIndex:midIndex withMaximalIndex:maxindex];
	}
}

- (void)mergeArrayWithMinimalIndex:(NSUInteger)minIndex withMediumIndex:(NSUInteger)midIndex withMaximalIndex:(NSUInteger)maxIndex
{
    NSMutableArray *temporaryArray = [NSMutableArray array];
    
    NSInteger j = minIndex,
    m = midIndex + 1;
    MRCSortObject *obj1;
    while (j <= midIndex && m <= maxIndex) {
        if ([self.arrayToSort[j] compare:self.arrayToSort[m]] == NSOrderedSame || [self.arrayToSort[j] compare:self.arrayToSort[m]] == NSOrderedAscending) {
            obj1 = self.arrayToSort[j];
            obj1.active = YES;
            [temporaryArray addObject:self.arrayToSort[j]];
            j++;
        }
        else {
            obj1 = self.arrayToSort[m];
            obj1.active = YES;
            [temporaryArray addObject:self.arrayToSort[m]];
            m++;
        }
    }
    
    if (j > midIndex) {
        while (m <= maxIndex) {
            obj1 = self.arrayToSort[m];
            obj1.active = YES;
            [temporaryArray addObject:self.arrayToSort[m++]];
        }
    }
    else {
        while (j <= midIndex) {
            obj1 = self.arrayToSort[j];
            obj1.active = YES;
            [temporaryArray addObject:self.arrayToSort[j++]];
        }
    }
    
    NSUInteger tempIndex = 0;
    while (minIndex <= maxIndex) {
        NSInteger idx = (minIndex == 0) ? 0 : minIndex - 1;
        MRCSortObject *obj1 = self.arrayToSort[idx];
        obj1.active = NO;
        MRCSortObject *obj2 = self.arrayToSort[minIndex];
        obj2.active = YES;
        
        [self.arrayToSort replaceObjectAtIndex:minIndex++ withObject:temporaryArray[tempIndex++]];
        if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
            [self.statusDelegate algorithm:self didUpdateArray:self.arrayToSort];
        }
        obj2.active = NO;
        
    }
}

@end
