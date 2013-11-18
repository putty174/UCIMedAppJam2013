//
//  DayViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "DayViewController.h"

@interface DayViewController ()

@end

@implementation DayViewController

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
    
    NSDateComponents *theDate = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.date];
    
    NSInteger day = [theDate day];
    NSInteger month = [theDate month];
    NSInteger year = [theDate year];
    
    
    //self.dateDisplay.text = [NSString stringWithFormat:@"%d day of %d month of %d year", day, month, year];
    
    self.title =[NSString stringWithFormat:@"%d day of %d month of %d year", day, month, year];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
