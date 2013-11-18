//
//  HomeViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yy"];
    self.theDate = [formatter stringFromDate:[NSDate date]];
    self.dateDisplay.text = self.theDate;
    
    self.recentSymptoms = [[UIView alloc] init];
    
    /*self.currentSymptoms = [[UITableView alloc] init];
    self.currentSymptoms.delegate = self;
    self.currentSymptoms.dataSource = self;
    [self.currentSymptoms setAllowsSelection:YES];
    [self.view addSubview:self.currentSymptoms];
    [self.currentSymptoms reloadData];
    
    self.symptomsArray = [[NSMutableArray alloc] initWithObjects:@"sample symptom 1", @"recent symptom blah", nil];*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.symptomsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.symptomsArray[indexPath.row];
    return cell;
}*/

@end
