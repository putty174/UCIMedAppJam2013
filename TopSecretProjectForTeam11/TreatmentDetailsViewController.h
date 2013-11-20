//
//  TreatmentDetailsViewController.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreatmentObject.h"

@interface TreatmentDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *treatmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *frequencyLabel;
@property (weak, nonatomic) IBOutlet UITextView *notesView;

@property (strong, nonatomic) TreatmentObject *treatment;

@end
