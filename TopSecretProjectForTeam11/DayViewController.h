//
//  DayViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayViewController : UIViewController
@property NSDate *date;
@property (strong, nonatomic) IBOutlet UILabel *dateDisplay;

@end
