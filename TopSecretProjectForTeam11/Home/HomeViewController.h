//
//  HomeViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dateDisplay;
@property NSString *theDate;
/*@property (strong, nonatomic) IBOutlet UITableView *currentSymptoms;
@property (strong, nonatomic) NSMutableArray *symptomsArray;
 */
@property (strong, nonatomic) IBOutlet UIView *recentSymptoms;

@end
