//
//  TreatmentDetailsViewController.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "TreatmentDetailsViewController.h"


@implementation TreatmentDetailsViewController

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
    self.treatmentLabel.text = self.treatment.treatment;
    self.frequencyLabel.text = self.treatment.frequency;
    self.notesView.text = self.treatment.notes;
    [self.notesView setEditable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
