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
    [self.array addObject:@"Symptom1"];
    [self.array addObject:@"recent symptoms"];
    for (NSString *key in [_symdic symDictionary])
    {
        [self.array addObject:key];
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
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _index = indexPath.row;
    UITableViewCell *clicked = [tableView cellForRowAtIndexPath:indexPath];
    //clicked.accessoryType = UITableViewCellAccessoryNone;
    if(clicked.accessoryType == UITableViewCellAccessoryNone)
    {
        clicked.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        clicked.accessoryType = UITableViewCellAccessoryNone;
    }
    if (_index >= 2)
    {
        [self performSegueWithIdentifier:@"HomeTabletoDetailsSegue" sender:self];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"HomeTabletoDetailsSegue"])
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
