//
//  CalendarViewController.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "CalendarViewController.h"
#import "DaySympTableViewController.h"
#import <TimesSquare/TimesSquare.h>

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
    
    self.myCalendar = [[TSQCalendarView alloc] initWithFrame:self.view.bounds];
    self.myCalendar.delegate = self;
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    NSDate *begin = [mmddccyy dateFromString:@"10/11/2013"];
    [self.myCalendar setFirstDate:begin];
    NSDate *end = [mmddccyy dateFromString:@"10/11/2014"];
    [self.myCalendar setLastDate:end];
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSDate *selectedDate = self.myCalendar.selectedDate;
    DaySympTableViewController *destViewController = segue.destinationViewController;
    destViewController.theDate = selectedDate;
}

@end
