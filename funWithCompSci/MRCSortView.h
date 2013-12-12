//
//  MRCSortView.h
//  matSort
//
//  Created by Mathew Cruz on 12/11/13.
//  Copyright (c) 2013 mathew cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRCSortView : UIView

@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) NSNumber *maxValue;
@property (atomic, strong) NSIndexSet *selectedSet;
@end
