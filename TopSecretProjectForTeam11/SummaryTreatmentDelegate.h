//
//  SummaryTreatmentDelegate.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreatmentObject.h"
@class SymptomViewController;

@interface SummaryTreatmentDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *array;
@property SymptomViewController *controller;

- (id) initWithController:(SymptomViewController*) viewController AndWithArray:(NSMutableArray*) array;

@end
