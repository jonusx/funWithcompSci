//
//  MRCSortAlgorithm.h
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import <Foundation/Foundation.h>
#import "MRCSortObject.h"
#import "MRCBase.h"

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

@protocol MRCSortAlgorithm <NSObject>

- (NSString *)complexity:(MRCBigOComplexityType)complexityType;
- (void)sort;
- (void)reset;
- (NSString *)algorithmName;

@end

@interface MRCSortAlgorithm : MRCBase <MRCSortAlgorithm>

@property (nonatomic) NSUInteger numberOfItems;
@property (atomic, readonly, copy) NSMutableArray *arrayToSort;
@property (nonatomic, assign) MRCArraySortStatus status;
@property (nonatomic, assign) CGFloat runTime;
@property (nonatomic, weak) id<arraySortStatusDelegate> statusDelegate;

- (instancetype)initWithAlgorithm:(MRCArraySortAlgorithm)algorithm total:(NSUInteger)total;

CGFloat BNRTimeBlock (void (^block)(void));

@end
