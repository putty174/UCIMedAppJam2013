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

- (void) viewDidAppear:(BOOL)animated
{
    [self.array removeAllObjects];
    for (NSString *key in [_symdic symDictionary])
    {
        SymptomObject *obgyn = [self.symdic findSymptom:key];
        //NSTimeInterval secondsPerDay = 24 * 60 * 60;
        
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:obgyn.date];
        NSInteger today = [components day];
        NSInteger tomonth = [components month];
        NSInteger toyear = [components year];
        
        NSDateComponents *compartments = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[[NSDate date] init]];
        NSInteger day = [compartments day];
        NSInteger month = [compartments month];
        NSInteger year = [compartments year];
        
        if((today == day) && (tomonth == month) && (toyear == year))
        {
            [self.array addObject:key];
        }
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

@end
