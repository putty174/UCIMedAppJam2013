//
//  AddSymptomController.h
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomObject.h"
#import "OccurrencesDelegate.h"
#import "TreatmentDelegate.h"

@interface AddSymptomController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *painNumber;
@property (weak, nonatomic) IBOutlet UISlider *painValue;

@property SymptomObject *symptom;
@property (strong, nonatomic) IBOutlet UITextField *symptomsEditText;

@property int currentSegment; //current segment displayed in the dynamic view

@property (strong, nonatomic) IBOutlet UIView *dynamicView; //used for adding views after changing segments

@property (strong, nonatomic) UIView *currentDynamicView; //the current view being displayed
@property (strong, nonatomic) OccurencesDelegate *occurrencesDelegate; //used for the occurrences table view
@property (strong, nonatomic) TreatmentDelegate *treatmentDelegate; //used for the treatment table view
@property (strong, nonatomic) NSString *notes; //used for holding text displayed in the notes view


- (IBAction)segmentedControl:(UISegmentedControl *)sender; //used for changing views in the dynamic view portion of the screen
- (IBAction)painSlider:(UISlider *)sender;
- (IBAction)symptomsSave:(UIButton *)sender;
- (IBAction)symptomsReset:(UIButton *)sender;



@end
