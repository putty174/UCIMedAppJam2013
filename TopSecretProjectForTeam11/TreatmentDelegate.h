//
//  TreatmentTable.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreatmentDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *array;
@property (weak, nonatomic) UIViewController *controller;

- (id) initWithController:(UIViewController*) viewController;
@end
