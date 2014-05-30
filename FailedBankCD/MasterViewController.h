//
//  MasterViewController.h
//  FailedBankCD
//
//  Created by iMac on 30/05/14.
//  Copyright (c) 2014 Triforce-1-Imac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
