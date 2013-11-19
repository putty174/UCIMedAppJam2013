//
//  DayViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/18/13.
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
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.theDate];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];
    self.title = [NSString stringWithFormat:@"%d day of the %d month of the %d year", day, month, year];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
