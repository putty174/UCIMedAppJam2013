//
//  RecentTableViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Christine Lew on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "SymptomDictionary.h"
#import "EditRecSymViewController.h"
#import "UpdateSymViewController.h"


@interface RecentTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property EKEventStore *recentSymEventStore;

@property (strong, nonatomic) SymptomDictionary *symdic;

@property int index;

@property NSString *stringSymptomToRemove;
@property SymptomObject *symptomToRemove;

@property (strong, nonatomic) IBOutlet UITableView *recentTable;
@property (nonatomic, strong) NSMutableArray *symArray;

@end
