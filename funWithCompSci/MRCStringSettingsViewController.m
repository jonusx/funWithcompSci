//
//  MRCStringSettingsViewController.m
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/12/13.
//
//

#import "MRCStringSettingsViewController.h"
#import "MRCStringReverse.h"

@interface MRCStringSettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation MRCStringSettingsViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doIt:(id)sender {
    MRCStringReverse *reverser = [MRCStringReverse new];
    self.textField.text = [reverser reverseString:self.textField.text];
    
}

@end
