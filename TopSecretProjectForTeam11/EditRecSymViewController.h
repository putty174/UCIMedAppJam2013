//
//  EditRecSymViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Christine Lew on 11/19/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomObject.h"
#import "SummaryTreatmentDelegate.h"
#import "SummaryOccurrencesDelegate.h"
#import "TreatmentDetailsViewController.h"

@interface EditRecSymViewController : UIViewController

@property SymptomObject *symptom;
@property int selectedRow;

@end
