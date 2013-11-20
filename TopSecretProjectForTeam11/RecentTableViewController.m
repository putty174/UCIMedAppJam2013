//
//  RecentTableViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Christine Lew on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "RecentTableViewController.h"

@interface RecentTableViewController ()

@end

@implementation RecentTableViewController

//@synthesize symptomsTable;
//@synthesize array;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //edit button
    
    self.recentTable = [[UITableView alloc] init];
    self.recentTable.delegate = self;
    self.recentTable.dataSource = self;
    [self.recentTable setAllowsSelection:YES];
    [self.view addSubview:self.recentTable];
    
    _recentSymEventStore = [[EKEventStore alloc] init];
    
    self.symArray = [[NSMutableArray alloc] init];
    
    _symdic = [SymptomDictionary symptomDictionary];
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.symArray removeAllObjects];
    [self.symArray addObject:@"Recent Symptoms"];
    for (NSString *key in [_symdic symDictionary])
    {
        [self.symArray addObject:key];
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
    return self.symArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.symArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _index = indexPath.row;
    if (_index == 0) {
        //AddSymptomController *created = [[AddSymptomController alloc] init];
        //[[self navigationController] pushViewController:created animated:YES];
        //set up permissions for Calender use
        float version = [[UIDevice currentDevice].systemVersion floatValue];
        if(version >= 6.0)
        {
            UIAlertView *accessAlert = [[UIAlertView alloc] initWithTitle:@"Permission Denied" message:@"Permission has not been granted to track new symptoms." delegate:Nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
            
            EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
            if(status == EKAuthorizationStatusNotDetermined)
            {
                [_recentSymEventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
                 {
                     if(!granted)
                     {
                         [accessAlert show];
                     }
                     else
                     {
                         [self performSegueWithIdentifier: @"addRecSymSegue" sender: self];
                     }
                 }];
                if (status == EKAuthorizationStatusAuthorized)
                {
                    [self performSegueWithIdentifier: @"addRecSymSegue" sender: self];
                }
                
            }
            else if (status == EKAuthorizationStatusDenied)
            {
                [accessAlert show];
            }
            if (status == EKAuthorizationStatusAuthorized)
            {
                [self performSegueWithIdentifier: @"addRecSymSegue" sender: self];
            }
        }
    }
    if (_index >= 1)
    {
        [self performSegueWithIdentifier:@"RecentToDetailSegue" sender:self];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"RecentToDetailSegue"])
    {
        SymptomObject *so = [[SymptomObject alloc] init];
        so = [_symdic findSymptom:[_symArray objectAtIndex:_index]];
        
        EditRecSymViewController *editSymVC = segue.destinationViewController;
        editSymVC.symptom = so;
        
    }
}



 // Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return NO;
        }
    }
    return YES;
    
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //find string of object to remove
        _stringSymptomToRemove = [_symArray objectAtIndex:indexPath.row];
        
        SymptomDictionary *symdic = [SymptomDictionary symptomDictionary];
        
        // Delete the row from the data source
        [_symArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        //find actual symptom in dictionary with string
        _symptomToRemove = [symdic findSymptom:_stringSymptomToRemove];
        //remove from dictionary
        [symdic removeSymptom:_symptomToRemove];
        
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


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