//
//  SummaryOccurrencesDelegate.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SummaryOccurrencesDelegate.h"

@implementation SummaryOccurrencesDelegate

- (id)initWithController:(UIViewController *)viewController AndWithArray:(NSMutableArray*) array {
    self = [super init];
    if (self) {
        self.array = array;
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
    OccurrencesObject *o = self.array[indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:@"hh:mm a"];
    NSString *time = [formatter stringFromDate:o.startDate];
    time = [time stringByAppendingString:@" - "];
    time = [time stringByAppendingString:[formatter stringFromDate:o.endDate]];
    cell.textLabel.text = time;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       //do something with self.controller ?
}

@end
