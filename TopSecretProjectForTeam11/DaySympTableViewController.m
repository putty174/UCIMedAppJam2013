//
//  DaySympTableViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/21/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "DaySympTableViewController.h"
#import "SymptomViewController.h"

@interface DaySympTableViewController ()

@end

@implementation DaySympTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.symptomsTable = [[UITableView alloc] init];
    self.symptomsTable.delegate = self;
    self.symptomsTable.dataSource = self;
    [self.symptomsTable setAllowsSelection:YES];
    [self.view addSubview:self.symptomsTable];
    
    _symptomEventStore = [[EKEventStore alloc] init];
    
    self.array = [[NSMutableArray alloc] init];
    
    _symdic = [SymptomDictionary symptomDictionary];
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
        
        NSDateComponents *compartments = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.theDate];
        NSInteger day = [compartments day];
        NSInteger month = [compartments month];
        NSInteger year = [compartments year];
        self.title = [NSString stringWithFormat:@"%d day of the %d month of the %d year", day, month, year];
        
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

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.array count];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.index = indexPath.row;
    [self performSegueWithIdentifier:@"showSymp" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  //  if ([[segue identifier] isEqualToString:@"TabletoDetailSegue"])
    {
        SymptomObject *so = [[SymptomObject alloc] init];
        so = [_symdic findSymptom:[_array objectAtIndex:_index]];
        
        SymptomViewController *SVController = segue.destinationViewController;
        SVController.symptom = so;
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
