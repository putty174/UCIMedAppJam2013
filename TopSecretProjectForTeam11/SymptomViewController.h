//
//  SymptomViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Max on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomObject.h"
#import "SummaryTreatmentDelegate.h"
#import "SummaryOccurrencesDelegate.h"
#import "TreatmentDetailsViewController.h"
#import "SymptomDictionary.h"

@interface SymptomViewController : UIViewController

@property (strong, nonatomic) SymptomObject *symptom;

//temp variable for the symptom that will be removed when editing
@property (strong, nonatomic) SymptomObject *symptomToRemove;

//stores symptom name before editting so can find and remove proper symptom
@property (strong, nonatomic) NSString *storeSymptomKey;
@property int selectedRow;

- (IBAction)painSlider:(UISlider *)sender;

@end
