//
//  SummaryOccurrencesDelegate.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OccurrencesObject.h"

@interface SummaryOccurrencesDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *array;
@property (weak, nonatomic) UIViewController *controller;
- (id) initWithController:(UIViewController*) viewController AndWithArray:(NSMutableArray*) array;

@end
