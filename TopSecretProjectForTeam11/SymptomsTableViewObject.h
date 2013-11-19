//
//  SymptomsTableViewObject.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SymptomsTableViewObject : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UIViewController *controller;
@property (nonatomic, strong) NSMutableArray *array;
-(id) initWithController:(UIViewController*) viewController;

@end
