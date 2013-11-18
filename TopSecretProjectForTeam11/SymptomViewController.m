//
//  SymptomViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Max on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomViewController.h"

@interface SymptomViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *ContentView;
@property (weak, nonatomic) IBOutlet UITextField *SymptomText;
@property (weak, nonatomic) IBOutlet UISlider *PainSlider;
@property (weak, nonatomic) IBOutlet UILabel *PainNumber;
@property (strong, nonatomic) IBOutlet UITextView *notesView;

@end

@implementation SymptomViewController

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
    _SymptomText.text = _symptom.symptom;
    _PainSlider.value = _symptom.pain;
    _PainNumber.text = [NSString stringWithFormat:@"%d", (int)roundf(_PainSlider.value)];
    _notesView.text = _symptom.notes;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.ContentView.bounds.size;
}
@end