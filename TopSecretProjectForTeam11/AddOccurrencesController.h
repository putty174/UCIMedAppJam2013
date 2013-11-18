//
//  AddOccurrencesController.h
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OccurrencesObject.h"

@interface AddOccurrencesController : UIViewController
- (IBAction)resetButton:(UIButton *)sender;
- (IBAction)saveButton:(UIButton *)sender;
- (IBAction)segmentedControl:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property int currentSegment;
@property NSDate *startDate;
@property NSDate *endDate;
@property NSMutableArray *occurrences;
- (IBAction)datePicker:(UIDatePicker *)sender;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerProperty;

@end
