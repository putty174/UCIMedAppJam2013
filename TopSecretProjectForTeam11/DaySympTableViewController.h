//
//  DaySympTableViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/21/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomDictionary.h"

@interface DaySympTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property EKEventStore *symptomEventStore;

@property NSDate *theDate;
@property (strong, nonatomic) SymptomDictionary *symdic;
@property int index;

@property (strong, nonatomic) IBOutlet UITableView *symptomsTable;
@property (nonatomic, strong) NSMutableArray *array;

@end
