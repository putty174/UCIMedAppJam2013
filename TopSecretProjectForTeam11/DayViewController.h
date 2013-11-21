//
//  DayViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomDictionary.h"

@interface DayViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSDate *theDate;
@property NSMutableArray *array;

@property (strong, nonatomic) SymptomDictionary *symdic;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
