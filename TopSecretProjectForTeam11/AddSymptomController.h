//
//  AddSymptomController.h
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomObject.h"

@interface AddSymptomController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *painNumber;
@property (weak, nonatomic) IBOutlet UISlider *painValue;

@property SymptomObject *symptom;
@property (strong, nonatomic) IBOutlet UITextField *symptomsEditText;

@property EKEventStore *symptomEventStore;


- (IBAction)painSlider:(UISlider *)sender;
- (IBAction)symptomsSave:(UIButton *)sender;
- (IBAction)symptomsReset:(UIButton *)sender;



@end
