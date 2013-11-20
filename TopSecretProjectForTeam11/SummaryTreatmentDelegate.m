//
//  SummaryTreatmentDelegate.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SummaryTreatmentDelegate.h"
#import "SymptomViewController.h"

@implementation SummaryTreatmentDelegate

- (id)initWithController:(SymptomViewController *)viewController AndWithArray:(NSMutableArray*) array {
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
    TreatmentObject *t = self.array[indexPath.row];
    cell.textLabel.text = t.treatment;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   //do something with self.controll
    self.controller.selectedRow = indexPath.row;
    [self.controller performSegueWithIdentifier:@"SummaryToTreatmentDetailsSegue" sender:self.controller];
}

@end
