//
//  OccurencesTable.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/16/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "OccurrencesDelegate.h"

@implementation OccurencesDelegate

- (id)initWithController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.array = [[NSMutableArray alloc] initWithObjects:@"Add New Time", nil];
        self.controller = viewController;
    }
    return self;
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
    NSInteger pos = indexPath.row;
    if (pos == 0) {
        [self.controller performSegueWithIdentifier: @"AddOccurrenceSegue" sender:self.controller];
    }
}
@end
