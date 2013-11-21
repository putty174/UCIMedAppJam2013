//
//  SymptomsTableViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomsTableViewController.h"
#import "SymptomViewController.h"
#import "SymptomDictionary.h"

@interface SymptomsTableViewController ()

@end

@implementation SymptomsTableViewController

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
    
    _symdic = [SymptomDictionary symptomDictionary];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.symptoms = [[UITableView alloc] init];
    self.symptoms.delegate = self;
    self.symptoms.dataSource = self;
    [self.symptoms setAllowsSelection:YES];
    [self.view addSubview:self.symptoms];
    [self.symptoms reloadData];
    
    self.array = [[NSMutableArray alloc] init];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.array removeAllObjects];
    for (NSString *key in [_symdic symDictionary])
    {
        SymptomObject *obgyn = [self.symdic findSymptom:key];
        NSTimeInterval secondsPerDay = 24 * 60 * 60;
        
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:obgyn.date];
        NSInteger today = [components day];
        NSInteger tomonth = [components month];
        NSInteger toyear = [components year];
        
        NSDateComponents *compartments = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[[NSDate date] initWithTimeIntervalSinceNow:-secondsPerDay]];
        NSInteger day = [compartments day];
        NSInteger month = [compartments month];
        NSInteger year = [compartments year];
        
        NSDateComponents *composites = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[[NSDate date] init]];
        NSInteger soday = [composites day];
        NSInteger somonth = [composites month];
        NSInteger soyear = [composites year];
        
        if(((today == day) && (tomonth == month) && (toyear == year)) || ((today == soday) && (tomonth == somonth) && (toyear == soyear)))
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.index = indexPath.row;
    
    UITableViewCell *selected = [tableView cellForRowAtIndexPath:indexPath];
    NSString *name = selected.textLabel.text;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:name message:@"Would you like to update this symptom?  Pressing no will remove the symptom from recent." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", @"No", nil];
    
    alert.tag = indexPath.row;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        // do nothing
    }else if(buttonIndex == 1)
    {
        [self performSegueWithIdentifier:@"HomeTabletoDetailsSegue" sender:self];
    }else
    {
        [self.array removeObjectAtIndex:alertView.tag];
        [self.tableView reloadData];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
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
