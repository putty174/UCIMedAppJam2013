//
//  RecentSymptoms.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecentSymptomsDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIViewController *controller;
@property (strong, nonatomic) NSMutableArray *array;
-(id)initWithController:(UIViewController *) viewController;

@end
