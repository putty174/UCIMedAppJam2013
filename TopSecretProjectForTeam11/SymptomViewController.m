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
@property (weak, nonatomic) IBOutlet UITableView *occurrencesTable;
@property (weak, nonatomic) IBOutlet UITableView *treatmentsTable;
@property SummaryOccurrencesDelegate *occurrencesDelegate;
@property SummaryTreatmentDelegate *treatmentDelegate;


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
    [self.SymptomText setUserInteractionEnabled:NO];
    _PainSlider.value = _symptom.pain;
    _PainNumber.text = [NSString stringWithFormat:@"%d", (int)roundf(_PainSlider.value)];
    _notesView.text = _symptom.notes;
    
    self.treatmentDelegate = [[SummaryTreatmentDelegate alloc] initWithController:self AndWithArray:self.symptom.treatments];
    self.occurrencesDelegate = [[SummaryOccurrencesDelegate alloc] initWithController:self AndWithArray:self.symptom.occurrences];
    
    self.occurrencesTable.delegate = self.occurrencesDelegate;
    self.occurrencesTable.dataSource = self.occurrencesDelegate;
    self.treatmentsTable.delegate = self.treatmentDelegate;
    self.treatmentsTable.dataSource = self.treatmentDelegate;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    TreatmentDetailsViewController *ctrlr = (TreatmentDetailsViewController*) segue.destinationViewController;
    TreatmentObject *obj = [self.symptom.treatments objectAtIndex:self.selectedRow];
    ctrlr.treatment = obj;
    
    
}

- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    if (flag == YES){
        // Change views to edit mode.
        NSLog(@"edit mode");
        _notesView.editable = YES;
        _PainSlider.enabled = YES;
    }
    else {
        SymptomDictionary *symdic = [SymptomDictionary symptomDictionary];
        //find actual symptom in dictionary with string
        _symptom = [symdic findSymptom:_SymptomText.text];
        //remove from dictionary
        [symdic removeSymptom:_symptom];
        
        
        // Save the changes if needed and change the views to noneditable.
        NSLog(@"NOT in edit mode");
        // _SymptomText.editing = NO;
        
        _notesView.editable = NO;
        _PainSlider.enabled = NO;
        
    }
}

- (IBAction)painSlider:(UISlider *)sender
{
    self.PainNumber.text = [[NSString alloc] initWithFormat:@"%d", (int)sender.value];
}

@end
