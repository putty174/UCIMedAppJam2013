//
//  RecentSymptoms.m
//  TopSecretProjectForTeam11
//
//  Created by Mary Nguyen on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "RecentSymptomsDelegate.h"

@implementation RecentSymptomsDelegate

- (id)initWithController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        // Initialization code
        self.array = [[NSMutableArray alloc] initWithObjects:@"sample symptom 1", @"recent symptom blah", nil];
        self.controller = viewController;
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *clicked = [tableView cellForRowAtIndexPath:indexPath];
    //clicked.accessoryType = UITableViewCellAccessoryNone;
    if(clicked.accessoryType == UITableViewCellAccessoryNone)
    {
        clicked.accessoryType = UITableViewCellAccessoryCheckmark;
    }else
    {
        clicked.accessoryType = UITableViewCellAccessoryNone;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
