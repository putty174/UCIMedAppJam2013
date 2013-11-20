//
//  SymptomsTableView.h
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "SymptomDictionary.h"

@interface SymptomsTableView : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property EKEventStore *symptomEventStore;

@property (strong, nonatomic) SymptomDictionary *symdic;
@property int index;

@property (strong, nonatomic) IBOutlet UITableView *symptomsTable;
@property (nonatomic, strong) NSMutableArray *array;
@property NSString *stringSymptomToRemove;
@property SymptomObject *symptomToRemove;

@end
