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

@property SymptomObject *symptom;

- (IBAction)symtomsText:(UITextField *)sender;
- (IBAction)painSlider:(UISlider *)sender;



@end
