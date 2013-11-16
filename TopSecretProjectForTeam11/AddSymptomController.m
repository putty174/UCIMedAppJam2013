//
//  AddSymptomController.m
//  KevinTest
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "AddSymptomController.h"
#import "SymptomObject.h"

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
    self.symptom = [[SymptomObject alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)symptomsEditText:(UITextField *)sender {
}

- (IBAction)painSlider:(UISlider *)sender {
    self.painNumber.text = [[NSString alloc] initWithFormat:@"%d", (int)sender.value];
    
}

- (IBAction)symptomsSave:(UIButton *)sender {
    _symptom.symptom = self.symptomsEditText.text;
    _symptom.pain = roundf(self.painValue.value);
}

- (IBAction)symptomsReset:(UIButton *)sender {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.view endEditing:YES];
    [self.symptomsEditText endEditing:YES];
}
@end
