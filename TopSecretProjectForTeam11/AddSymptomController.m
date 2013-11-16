//
//  AddSymptomController.m
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddSymptomController.h"
#import "SymptomObject.h"

@interface AddSymptomController ()

@end

@implementation AddSymptomController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.symptom = [[SymptomObject alloc] init];
    [[self symptomsEditText] setText: @""];
    [[self painValue] setValue:0];
    [[self painNumber] setText: @"0"];
    
    _symptomEventStore = [[EKEventStore alloc] init];
    _symptom.event = [EKEvent eventWithEventStore:_symptomEventStore];
    _symptom.event.title = _symptom.symptom;
    _symptom.event.startDate = [[NSDate alloc] init];
    _symptom.event.endDate = [[NSDate alloc] init];
    [_symptom.event setCalendar:[_symptomEventStore defaultCalendarForNewEvents]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)symptomsEditText:(UITextField *)sender {
}

- (IBAction)painSlider:(UISlider *)sender {
    self.painNumber.text = [[NSString alloc] initWithFormat:@"%d", (int)sender.value];
    
}

- (IBAction)symptomsSave:(UIButton *)sender {
    _symptom.symptom = self.symptomsEditText.text;
    _symptom.pain = roundf(self.painValue.value);
    
    _symptom.event.title = _symptom.symptom;
    _symptom.event.startDate = [NSDate date];
    _symptom.event.endDate = [NSDate date];
    
    NSError *symptomErr;
    [_symptomEventStore saveEvent:_symptom.event span:EKSpanThisEvent error:&symptomErr];
    if([symptomErr code] == 0)
    {
        UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Symptom Saved" message:@"Your symptom has been saved." delegate:Nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [symptomAlert show];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)symptomsReset:(UIButton *)sender {
    [[self symptomsEditText] setText: @""];
    [[self painValue] setValue:0];
    [[self painNumber] setText: @"0"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.view endEditing:YES];
    [self.symptomsEditText endEditing:YES];
}
@end
