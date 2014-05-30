//
//  DetailViewController.h
//  FailedBankCD
//
//  Created by iMac on 30/05/14.
//  Copyright (c) 2014 Triforce-1-Imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
