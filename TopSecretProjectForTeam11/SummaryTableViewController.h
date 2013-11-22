//
//  SummaryTableViewController.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/19/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomDictionary.h"

@interface SummaryTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *array;
@property SymptomDictionary *symdic;
@property int selected;
@end
