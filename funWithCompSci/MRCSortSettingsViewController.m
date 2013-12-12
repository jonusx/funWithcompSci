//
//  MRCSortSettingsViewController.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import "MRCSortSettingsViewController.h"
#import "MRCSortViewController.h"

@interface MRCSortSettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberOfItemsTextField;
@property (nonatomic, strong) MRCSortAlgorithm *sortAlgorithm;
@end

@implementation MRCSortSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)beginSort:(id)sender {
    NSUInteger itemCount = [self.numberOfItemsTextField.text integerValue];
    if (itemCount > 500) {
        itemCount = 500;
    }
    
    MRCSortViewController *sortController = [self.storyboard instantiateViewControllerWithIdentifier:@"MRCSortViewController"];
    sortController.amountOfItems = itemCount;
    sortController.sortAlgorithm = [[MRCSortAlgorithm alloc] initWithAlgorithm:self.algorithmToUse total:itemCount];
    [self.navigationController pushViewController:sortController animated:YES];
//    
//    [self.sortAlgorithm sort];
//    NSLog(@"Run time: %f", self.sortAlgorithm.runTime);
    
}

@end
