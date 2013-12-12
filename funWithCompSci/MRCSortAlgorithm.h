//
//  MRCSortAlgorithm.h
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import <Foundation/Foundation.h>
#import "MRCSortObject.h"

typedef NS_ENUM(NSUInteger, MRCBigOComplexityType) {
    MRCBigOComplexityTypeWorst,
    MRCBigOComplexityTypeAverage,
    MRCBigOComplexityTypeBest
};

typedef NS_ENUM(NSUInteger, MRCArraySortStatus) {
    MRCArraySortStatusNotStarted,
    MRCArraySortStatusInProgress,
    MRCArraySortStatusFinished
};

typedef NS_ENUM(NSUInteger, MRCArraySortAlgorithm) {
    MRCArraySortAlgorithmMerge,
    MRCArraySortAlgorithmBubble,
    MRCArraySortAlgorithmShell,
    MRCArraySortAlgorithmQuick,
    MRCArraySortAlgorithmInsertion
};

@class MRCSortAlgorithm;

@protocol arraySortStatusDelegate <NSObject>

- (void)algorithm:(MRCSortAlgorithm *)algorithm didUpdateArray:(NSArray *)array;

@end

@interface MRCSortAlgorithm : NSObject

@property (nonatomic, readonly) NSUInteger numberOfItems;
@property (atomic, readonly, copy) NSMutableArray *arrayToSort;
@property (nonatomic, assign) MRCArraySortStatus status;
@property (nonatomic, assign) CGFloat runTime;
@property (nonatomic, weak) id<arraySortStatusDelegate> statusDelegate;

- (instancetype)initWithAlgorithm:(MRCArraySortAlgorithm)algorithm total:(NSUInteger)total;

- (NSString *)complexity:(MRCBigOComplexityType)complexityType;

- (void)sort;
- (void)reset;

CGFloat BNRTimeBlock (void (^block)(void));

@end
