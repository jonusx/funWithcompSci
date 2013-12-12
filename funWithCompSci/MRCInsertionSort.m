//
//  MRCInsertionSort.m
//  funWithCompSci
//
//  Created by mathew cruz on 12/12/13.
//
//

#import "MRCInsertionSort.h"
#import "MRCSortObject.h"

@interface MRCInsertionSort ()
@property (atomic, strong) NSMutableArray *arrayToSort;
@end

@implementation MRCInsertionSort
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

- (void)sort {
    self.status = MRCArraySortStatusInProgress;
    
    self.runTime = BNRTimeBlock(^{
        [self insertionSortArray];
    });
    
    self.status = MRCArraySortStatusFinished;
}

- (void)insertionSortArray
{
	NSInteger a = 0;
    NSInteger b = 0;
    
	MRCSortObject *temp;
    MRCSortObject *temp1;
    MRCSortObject *temp2;
    
	for (a = 1; a < [self.arrayToSort count]; ++a) {
		temp = self.arrayToSort[a];
        temp.active = YES;
        
		for (b = a - 1; (b >= 0) && ([temp compare:self.arrayToSort[b]] == NSOrderedAscending); b--) {
			[self.arrayToSort replaceObjectAtIndex:b + 1 withObject:self.arrayToSort[b]];
            
            temp1 = self.arrayToSort[b];
            temp1.active = YES;
            
            temp2 = self.arrayToSort[b + 1];
            temp2.active = YES;
            
            if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
                [self.statusDelegate algorithm:self didUpdateArray:[self.arrayToSort copy]];
            }
            
            
            temp1.active = NO;
            temp2.active = NO;
            
		}
		self.arrayToSort[b + 1] = temp;
        
        if ([self.statusDelegate respondsToSelector:@selector(algorithm:didUpdateArray:)]) {
            [self.statusDelegate algorithm:self didUpdateArray:[self.arrayToSort copy]];
        }
        
        
        temp.active = NO;
	}
}


@end
