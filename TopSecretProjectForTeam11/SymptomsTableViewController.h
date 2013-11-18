//
//  SymptomsTableViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomDictionary.h"

@interface SymptomsTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) SymptomDictionary *symdic;
@property int index;

@property (strong, nonatomic) IBOutlet UITableView *symptoms;
@property (strong, nonatomic) NSMutableArray *array;

@end
