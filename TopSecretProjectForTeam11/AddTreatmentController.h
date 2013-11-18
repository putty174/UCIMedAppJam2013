//
//  AddTreatmentController.h
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreatmentObject.h"

@interface AddTreatmentController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *treatmentText;
@property (weak, nonatomic) IBOutlet UITextField *frequencyText;
@property (weak, nonatomic) IBOutlet UITextView *notesText;
@property NSMutableArray *treatments;
- (IBAction)saveButton:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;

@end
