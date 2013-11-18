//
//  CalendarViewController.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "CalendarViewController.h"
#import "DayViewController.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

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
    
    //UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //[self.view addSubview: scrollView];
    
    self.myCalendar = [[TSQCalendarView alloc] initWithFrame:self.view.bounds];
    [self.myCalendar setDelegate:self];
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    NSDate *d = [mmddccyy dateFromString:@"12/11/2008"];
    [self.myCalendar setFirstDate:d];
    NSDate *dd = [mmddccyy dateFromString:@"12/11/2009"];
    [self.myCalendar setLastDate:dd];
    
    [self.view addSubview:self.myCalendar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)calendarView:(TSQCalendarView *)calendarView didSelectDate:(NSDate *)date
{
    [self performSegueWithIdentifier:@"showDayDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  //  if ([segue.identifier isEqualToString:@"showDayDetail"])
    {
        NSDate *theDate = self.myCalendar.selectedDate;
        DayViewController *destViewController = segue.destinationViewController;
        destViewController.date = theDate;
    }
}

@end
