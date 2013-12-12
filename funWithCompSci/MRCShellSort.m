//
//  MRCShellSort.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCShellSort.h"

@interface MRCShellSort ()
@property (atomic, strong) NSMutableArray *arrayToSort;
@property (nonatomic, assign) MRCArraySortStatus status;
@end

@implementation MRCShellSort

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

- (void)sort {
    self.status = MRCArraySortStatusInProgress;
    self.runTime = BNRTimeBlock(^{
        [self shellSortArray];
    });
    self.status = MRCArraySortStatusFinished;
}

- (void)shellSortArray
{
    MRCSortObject *temp;
    MRCSortObject *temp1;
    
	for (NSInteger i = [self.arrayToSort count] / 2; i > 0; i = i / 2) {
		for (NSInteger j = i; j < [self.arrayToSort count]; j++) {
			for (NSInteger k = j - i; k >= 0; k = k - i) {
				if ([self.arrayToSort[k + 1] compare:self.arrayToSort[k]] == NSOrderedDescending ||[self.arrayToSort[k + 1] compare:self.arrayToSort[k]] == NSOrderedSame) {
					break;
				}
				else {
					temp = self.arrayToSort[k];
					temp1 = self.arrayToSort[k + i];
                    temp.active = YES;
                    temp1.active = YES;
                    
					[self.arrayToSort replaceObjectAtIndex:k withObject:self.arrayToSort[k + i]];
					[self.arrayToSort replaceObjectAtIndex:k + i withObject:temp];
                    
                    if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
                        [self.statusDelegate algorithm:self didUpdateArray:self.arrayToSort];
                    }
                    temp.active = NO;
                    temp1.active = NO;
				}
			}
		}
	}
}

@end
