//
//  SymptomsTableViewObject.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomsTableViewObject.h"

@implementation SymptomsTableViewObject

-(id)initWithController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] initWithObjects:@"sample 1", @"sample 2", @"sample 3", nil];
        self.controller = viewController;
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
//    NSInteger index = indexPath.row;
    UITableViewCell *clicked = [tableView cellForRowAtIndexPath:indexPath];
    //clicked.accessoryType = UITableViewCellAccessoryNone;
    if(clicked.accessoryType == UITableViewCellAccessoryNone)
    {
        clicked.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        clicked.accessoryType = UITableViewCellAccessoryNone;
    }
//    if (index >= 2)
    {
//        [self performSegueWithIdentifier:@"HomeTabletoDetailsSegue" sender:self];
    }
}

@end
