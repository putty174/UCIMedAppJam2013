//
//  AddSymptomController.m
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddSymptomController.h"

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
    self.occurrencesDelegate = [[OccurencesDelegate alloc] initWithController:self];
    self.treatmentDelegate = [[TreatmentDelegate alloc] initWithController:self];
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
    
    _symptomsEditText.returnKeyType = UIReturnKeyDone;
    [_symptomsEditText setDelegate:self];
    // above 2 lines are setting symptomsEditText to delegate and for the return key
    
    
    //set up event property for SymptomObject
    _symptomEventStore = [[EKEventStore alloc] init];
}

-(void)viewDidAppear:(BOOL)animated {
    if (self.currentSegment == 0) {
        if (self.symptom.occurrences.count + 1 != self.occurrencesDelegate.array.count) {
            OccurrencesObject *o = [self.symptom.occurrences objectAtIndex:self.symptom.occurrences.count-1];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setDateFormat:@"hh:mm a"];
            NSString *time = [formatter stringFromDate:o.startDate];
            time = [time stringByAppendingString:@" - "];
            time = [time stringByAppendingString:[formatter stringFromDate:o.endDate]];
            [self.occurrencesDelegate.array addObject:time];
            [((UITableView*)self.currentDynamicView) reloadData];
        }
    }
    else {
        if (self.currentSegment == 1) {
            if (self.symptom.treatments.count + 1 != self.treatmentDelegate.array.count) {
                TreatmentObject *o = [self.symptom.treatments objectAtIndex:self.symptom.treatments.count-1];
                [self.treatmentDelegate.array addObject:o.treatment];
                [((UITableView*)self.currentDynamicView) reloadData];
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)symptomsEditText:(UITextField *)sender {
}

// method so that upon selecting DONE in keyboard, the keyboard disappears
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)painSlider:(UISlider *)sender {
    self.painNumber.text = [[NSString alloc] initWithFormat:@"%d", (int)sender.value];
    
}

- (IBAction)symptomsSave:(UIButton *)sender {
    if ([self.symptomsEditText.text isEqualToString:@""])
    {
        UIAlertView *blankSymptom = [[UIAlertView alloc] initWithTitle:@"No Symptom" message:@"Please enter a symptom name" delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
        [blankSymptom show];
    }
    else
    {
        _symptom.symptom = self.symptomsEditText.text;
        _symptom.pain = roundf(self.painValue.value);
        
        if (self.currentSegment == 2) { //if changing segments from the text view, save the text in it
            self.notes = [((UITextView*)self.currentDynamicView) text];
        }
        _symptom.notes = self.notes;
        
        SymptomDictionary *symdic = [SymptomDictionary symptomDictionary];
        [symdic addSymptom:(_symptom)];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)symptomsReset:(UIButton *)sender {
    if (self.currentSegment == 2) { //if changing segments from the text view, save the text in it
        self.notes = [((UITextView*)self.currentDynamicView) text];
    }
    if (![self.symptomsEditText.text isEqualToString:@""] || self.painValue.value != 0 || ![self.notes isEqualToString:@""])
    {
        UIAlertView *filledFields = [[UIAlertView alloc] initWithTitle:@"Reset Fields" message:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Reset", nil];
        [filledFields show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [[self symptomsEditText] setText: @""];
        [[self painValue] setValue:0];
        [[self painNumber] setText: @"0"];
        _notes = @"";
        self.currentSegment = 0;
        self.segmentValue.selectedSegmentIndex = 0;
        [self.currentDynamicView removeFromSuperview];
        self.currentDynamicView = [self createOccurrancesView];
        [self.dynamicView addSubview:self.currentDynamicView];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.view endEditing:YES];
    [self.symptomsEditText endEditing:YES];
    if (self.currentSegment == 2) {
        [((UITextField*)self.currentDynamicView) endEditing:YES];
    }
}

/* Swap between views to add attributes for the symptom being added*/
- (IBAction)segmentedControl:(UISegmentedControl *)sender {
    
    if (self.currentSegment == 2) { //if changing segments from the text view, save the text in it
        self.notes = [((UITextView*)self.currentDynamicView) text];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AddOccurrenceSegue"]) {
        AddOccurrencesController *ctrlr = [segue destinationViewController];
        ctrlr.occurrences = self.symptom.occurrences;
    }
    else
        if ([[segue identifier] isEqualToString:@"AddTreatmentSegue"]) {
            AddTreatmentController *ctrlr = [segue destinationViewController];
            ctrlr.treatments = self.symptom.treatments;
        }
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

- (UITextView*) createNotesField {
    UITextView *notesField = [[UITextView alloc] initWithFrame:self.dynamicView.bounds];
    notesField.text = self.notes;
    [notesField.layer setBorderColor:[[[UIColor blackColor] colorWithAlphaComponent:0.5] CGColor]];
    [notesField.layer setBorderWidth:4.0];
    //notesField.layer.cornerRadius = 5;
    notesField.clipsToBounds = YES;
    return notesField;
}

@end
