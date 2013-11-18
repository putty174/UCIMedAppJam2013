//
//  AddOccurrencesController.m
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddOccurrencesController.h"

@interface AddOccurrencesController ()

@end

@implementation AddOccurrencesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    NSString *str = [formatter stringFromDate:[self.datePicker date]];
//    
//    self.startLabel.text = self.endLabel.text = [formatter stringFromDate:[self.datePicker date]];
    self.currentSegment = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetButton:(UIButton *)sender {
}

- (IBAction)saveButton:(UIButton *)sender {
    if (self.startDate && self.endDate){
        [self.occurrences addObject:[[OccurrencesObject alloc] initWithStartDate:self.startDate WithEndDate:self.endDate]];
        [self.navigationController popViewControllerAnimated:YES];
    }
    //else throw error?
}

- (IBAction)segmentedControl:(UISegmentedControl *)sender {
    self.currentSegment = sender.selectedSegmentIndex;
    switch (self.currentSegment) {
        case 0:
            if (self.startDate) {
                self.datePickerProperty.date = self.startDate;
            }
            break;
        case 1:
            if (self.endDate) {
                self.datePickerProperty.date = self.endDate;
            }
            break;
            
        default:
            break;
    }
}
- (IBAction)datePicker:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:@"hh:mm a"];
    if (self.currentSegment == 0) {
        self.startDate = sender.date;
        self.startLabel.text = [formatter stringFromDate:self.startDate];
    }
    else {
        self.endDate = sender.date;
        self.endLabel.text = [formatter stringFromDate:self.endDate];
    }
}
@end
