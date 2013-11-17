//
//  AddSymptomController.m
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddSymptomController.h"
#import "SymptomObject.h"
#import "OccurrencesDelegate.h"
#import "TreatmentDelegate.h"

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
    self.occurrencesDelegate = [[OccurencesDelegate alloc] init];
    self.treatmentDelegate = [[TreatmentDelegate alloc] init];
    self.symptom = [[SymptomObject alloc] init];
    self.notes = [[NSString alloc] initWithFormat:@""];
    [[self symptomsEditText] setText: @""];
    self.symptomsEditText.placeholder = @"Enter a symptom name.";
    [[self painValue] setValue:0];
    [[self painNumber] setText: @"0"];
    self.currentDynamicView = [self createOccurrancesView];
    self.currentSegment = 0;
    self.dynamicView.backgroundColor = [UIColor whiteColor];
    [self.dynamicView addSubview:self.currentDynamicView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)symptomsEditText:(UITextField *)sender {
}

/* Swap between views to add attributes for the symptom being added*/
- (IBAction)segmentedControl:(UISegmentedControl *)sender {
    
    if (self.currentSegment == 2) { //if changing segments from the text view, save the text in it
        self.notes = [((UITextField*)self.currentDynamicView) text];
    }
    self.currentSegment = sender.selectedSegmentIndex;
    switch (self.currentSegment) {
        case 0:
            [self.currentDynamicView removeFromSuperview];
            self.currentDynamicView = [self createOccurrancesView];
            [self.dynamicView addSubview:self.currentDynamicView];
            break;
            
        case 1:
            [self.currentDynamicView removeFromSuperview];
            self.currentDynamicView = [self createTreatmentView];
            [self.dynamicView addSubview:self.currentDynamicView];
            break;
        case 2:
            [self.currentDynamicView removeFromSuperview];
            self.currentDynamicView = [self createNotesField];
            [self.dynamicView addSubview:self.currentDynamicView];
        default:
            break;
    }
    
}

- (IBAction)painSlider:(UISlider *)sender {
    self.painNumber.text = [[NSString alloc] initWithFormat:@"%d", (int)sender.value];
    
}

- (IBAction)symptomsSave:(UIButton *)sender {
    if ([self.symptomsEditText.text isEqualToString:@""])
    {
        UIAlertView *blankSymptom = [[UIAlertView alloc] initWithTitle:@"Blank Symptom" message:@"Please enter a symptom name" delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
        [blankSymptom show];
    }
    else
    {
        _symptom.symptom = self.symptomsEditText.text;
        _symptom.pain = roundf(self.painValue.value);
        
        _symptom.event.title = _symptom.symptom;
        _symptom.event.startDate = [NSDate date];
        _symptom.event.endDate = [NSDate date];
        
        NSError *symptomErr;
        [_symptomEventStore saveEvent:_symptom.event span:EKSpanThisEvent error:&symptomErr];
        if([symptomErr code] == 0)
        {
            UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Symptom Saved" message:@"Your symptom has been saved." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
            [symptomAlert show];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)symptomsReset:(UIButton *)sender {
    if (![self.symptomsEditText.text isEqualToString:@""])
    {
        UIAlertView *filledFields = [[UIAlertView alloc] initWithTitle:@"Reset Fields" message:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
        [filledFields show];
    }
    else
    {
        [[self symptomsEditText] setText: @""];
        [[self painValue] setValue:0];
        [[self painNumber] setText: @"0"];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[self symptomsEditText] setText: @""];
        [[self painValue] setValue:0];
        [[self painNumber] setText: @"0"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.view endEditing:YES];
    [self.symptomsEditText endEditing:YES];
}

- (UITableView*) createOccurrancesView {
    UITableView *view = [[UITableView alloc] initWithFrame:self.dynamicView.bounds];
    view.delegate = self.occurrencesDelegate;
    view.dataSource = self.occurrencesDelegate;
    return view;
}

- (UITableView*) createTreatmentView {
    UITableView *view = [[UITableView alloc] initWithFrame:self.dynamicView.bounds];
    view.delegate = self.treatmentDelegate;
    view.dataSource = self.treatmentDelegate;
    return view;
}

- (UITextField*) createNotesField {
    UITextField *notesField = [[UITextField alloc] initWithFrame:self.dynamicView.bounds];
    notesField.text = self.notes;
    return notesField;
}
@end
