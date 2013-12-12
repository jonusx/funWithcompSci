//
//  MRCSortViewController.m
//  funWithCompSci
//
//  Created by mathew cruz on 12/10/13.
//  Copyright (c) 2013 mathew cruz. All rights reserved.
//

#import "MRCSortViewController.h"
#import "MRCSortView.h"
#import "MRCSortAlgorithm.h"

@interface MRCSortViewController () <arraySortStatusDelegate>
@property (weak, nonatomic) IBOutlet MRCSortView *sortView;
@property (nonatomic, strong) UITapGestureRecognizer *tapper;
@property (nonatomic, strong) UISwipeGestureRecognizer *swiper;
@end

@implementation MRCSortViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reset)];
    [self.sortView addGestureRecognizer:self.tapper];
    
    self.swiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self.navigationController action:@selector(popViewControllerAnimated:)];
    [self.sortView addGestureRecognizer:self.swiper];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self beginSort];
}

- (void)beginSort {
    [self.navigationController setNavigationBarHidden:YES];
    self.sortAlgorithm.statusDelegate = self;
    self.tapper.enabled = NO;
    self.swiper.enabled = NO;
    self.sortView.userInteractionEnabled = NO;
    
    [[NSOperationQueue new] addOperationWithBlock:^{
        [self logArrayWithLines:self.sortAlgorithm.arrayToSort];
        [self.sortAlgorithm sort];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.tapper.enabled = YES;
            self.swiper.enabled = YES;
            self.sortView.userInteractionEnabled = YES;
            double delayInSeconds = 1.5;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self.navigationController setNavigationBarHidden:NO animated:YES];
            });
        }];
    }];
    
}

- (void)reset {
    [self.sortAlgorithm reset];
    [self beginSort];
}

- (NSNumber *)numberFromArrayOfNumbers:(NSArray *)array {
    //ex: @[ @5, @7, @1, @0, @6]
    NSLog(@"%@", array);
    NSInteger __block placeholder = 0;
    [array enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger idx, BOOL *stop) {
        idx = [array count] - 1 - idx;
        placeholder += [num integerValue] * pow(10, idx);
        NSLog(@"%i", placeholder);
    }];
    return @(placeholder);
}

- (void)algorithm:(MRCSortAlgorithm *)algorithm didUpdateArray:(NSArray *)array {
    [self logArrayWithLines:array];
}

- (void)logArrayWithLines:(NSArray *)array {
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.sortView.values = array;
        self.sortView.maxValue = @(self.sortAlgorithm.numberOfItems);
        [self.sortView setNeedsDisplay];
        dispatch_semaphore_signal(sema);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


@end
