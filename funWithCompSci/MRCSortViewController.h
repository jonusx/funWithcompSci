//
//  MRCSortViewController.h
//  funWithCompSci
//
//  Created by mathew cruz on 12/10/13.
//  Copyright (c) 2013 mathew cruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRCSortAlgorithm;

@interface MRCSortViewController : UIViewController
@property (nonatomic, strong) MRCSortAlgorithm *sortAlgorithm;
@property (nonatomic) NSInteger amountOfItems;
@end
