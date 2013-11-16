//
//  AddSymptomController.h
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSymptomController : UIViewController
- (IBAction)symtomsText:(UITextField *)sender;
@property (weak, nonatomic) IBOutlet UILabel *painNumber;
- (IBAction)painSlider:(UISlider *)sender;

@end
