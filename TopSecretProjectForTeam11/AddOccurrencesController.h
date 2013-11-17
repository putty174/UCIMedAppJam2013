//
//  AddOccurrencesController.h
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddOccurrencesController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)resetButton:(UIButton *)sender;
- (IBAction)saveButton:(UIButton *)sender;

@end
