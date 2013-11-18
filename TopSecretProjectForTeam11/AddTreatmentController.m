//
//  AddTreatmentController.m
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddTreatmentController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddTreatmentController ()

@end

@implementation AddTreatmentController

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
    [self.treatmentText setDelegate:self];
    [self.frequencyText setDelegate:self];
    [self.notesText setDelegate:self];
    
    [[self.notesText layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.notesText layer] setBorderWidth:2.3];
    [[self.notesText layer] setCornerRadius:15];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textViewShouldReturn:(UITextView *)
    textView
{
    [textView resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.treatmentText endEditing:YES];
    [self.frequencyText endEditing:YES];
    [self.notesText endEditing:YES];
}


- (IBAction)saveButton:(UIButton *)sender {
    NSString *treatment = self.treatmentText.text;
    if (![treatment isEqualToString:@""]) {
        TreatmentObject *o = [[TreatmentObject alloc] initWithTreatment:treatment
                                                         WithFrequency:self.frequencyText.text
                                                             WithNotes:self.notesText.text];
        [self.treatments addObject:o];
        [self.navigationController popViewControllerAnimated:YES];
    }
    //else throw error?
}

- (IBAction)resetButton:(UIButton *)sender {
}
@end
