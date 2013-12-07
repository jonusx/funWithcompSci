//
//  MRCDetailViewController.h
//  funWithCompSci
//
//  Created by Mathew Cruz on 12/7/13.
//
//

#import <UIKit/UIKit.h>

@interface MRCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
