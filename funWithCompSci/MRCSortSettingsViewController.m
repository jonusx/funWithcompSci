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
@property (weak, nonatomic) IBOutlet UILabel *worstLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestLabel;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.sortAlgorithm = [[MRCSortAlgorithm alloc] initWithAlgorithm:self.algorithmToUse total:0];
    
    self.title = [self.sortAlgorithm algorithmName];
    self.averageLabel.text = [self.sortAlgorithm complexity:MRCBigOComplexityTypeAverage];
    self.worstLabel.text = [self.sortAlgorithm complexity:MRCBigOComplexityTypeWorst];
    self.bestLabel.text = [self.sortAlgorithm complexity:MRCBigOComplexityTypeBest];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (IBAction)beginSort:(id)sender {
    NSUInteger itemCount = [self.numberOfItemsTextField.text integerValue];
    if (itemCount > 500) {
        itemCount = 500;
    }
    self.sortAlgorithm.numberOfItems = itemCount;
    
    MRCSortViewController *sortController = [self.storyboard instantiateViewControllerWithIdentifier:@"MRCSortViewController"];
    sortController.amountOfItems = itemCount;
    sortController.sortAlgorithm = self.sortAlgorithm;
    [self.navigationController pushViewController:sortController animated:YES];
//    
//    [self.sortAlgorithm sort];
//    NSLog(@"Run time: %f", self.sortAlgorithm.runTime);
    
}

@end
