//
//  MRCBubbleSort.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCBubbleSort.h"

@interface MRCBubbleSort ()
@property (atomic, strong) NSMutableArray *arrayToSort;
@end

@implementation MRCBubbleSort

- (NSString *)complexity:(MRCBigOComplexityType)complexityType {
    static NSString *average = @"O(n^2)";
    static NSString *best = @"O(n)";
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
    return @"Bubble Sort";
}

- (void)sort {
    self.status = MRCArraySortStatusInProgress;
    self.runTime = BNRTimeBlock(^{
        [self bubbleSortArray];
    });
    self.status = MRCArraySortStatusFinished;
}

- (void)bubbleSortArray
{
	MRCSortObject *temp;
    MRCSortObject *temp1;
    
	for (int i = [self.arrayToSort count] - 2; i >= 0; i--) {
		for (int j = 0; j <= i; j++) {
			if ([self.arrayToSort[j] compare:self.arrayToSort[j + 1]] == NSOrderedDescending) {
				temp = self.arrayToSort[j];
                temp.active = YES;
                
                temp1 = self.arrayToSort[j + 1];
                temp1.active = YES;
                
				[self.arrayToSort replaceObjectAtIndex:j withObject:[self.arrayToSort objectAtIndex:j + 1]];
				[self.arrayToSort replaceObjectAtIndex:j + 1 withObject:temp];
                
                if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
                    [self.statusDelegate algorithm:self didUpdateArray:self.arrayToSort];
                }
                
                temp.active = NO;
                temp1.active = NO;
			}
		}
	}
}

@end
