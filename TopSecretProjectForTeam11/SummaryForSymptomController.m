//
//  SummaryForSymptomController.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/19/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SummaryForSymptomController.h"

@interface SummaryForSymptomController ()

@end

@implementation SummaryForSymptomController

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
    
    //scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(,,,)];// set scroll view size
    //view = [[UIView alloc] initWithFrame:CGRectMake(y1,x1,y2,x2)];  //set the view size
    UIImage *image1 = [UIImage imageNamed:@"theGraph.jpg"];
    UIImageView *image =[[UIImageView alloc]initWithImage:image1];// take image size according to view
    [self.graph addSubview:image];
    [self.graph setContentSize:image1.size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Share Graph" message:@"Enter the email to send to:" delegate:self cancelButtonTitle:@"Send" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
@end
