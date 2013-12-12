//
//  MRCMasterViewController.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCMasterViewController.h"
#import "MRCSortSettingsViewController.h"

@interface MRCMasterViewController ()
@end

@implementation MRCMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    MRCSortSettingsViewController *sortController = [segue destinationViewController];
    if ([[segue identifier] isEqualToString:@"merge"]) {
        sortController.algorithmToUse = MRCArraySortAlgorithmMerge;
    }
    else if ([[segue identifier] isEqualToString:@"bubble"]) {
        sortController.algorithmToUse = MRCArraySortAlgorithmBubble;
    }
    else if ([[segue identifier] isEqualToString:@"shell"]) {
        sortController.algorithmToUse = MRCArraySortAlgorithmShell;
    }
    else if ([[segue identifier] isEqualToString:@"quick"]) {
        sortController.algorithmToUse = MRCArraySortAlgorithmQuick;
    }
    else if ([[segue identifier] isEqualToString:@"insertion"]) {
        sortController.algorithmToUse = MRCArraySortAlgorithmInsertion;
    }
}

@end
