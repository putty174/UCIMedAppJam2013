//
//  UpdateViewController.m
//  TopSecretProjectForTeam11
//
//  Created by Christine Lew on 11/18/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "UpdateViewController.h"
#import "RecentViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alertButton:(UIButton *)sender
{
    UIAlertView *alertButton = [[UIAlertView alloc] initWithTitle:@"Welcome back to SymTrack!" message:@"Have you had any reocurring symptoms? (if you don't remember your last symptoms press 'YES' to see a list of recent symptoms)" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [alertButton show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        UIStoryboard *sb = self.storyboard;
        RecentViewController *recentVC = [sb instantiateViewControllerWithIdentifier:@"RecentViewController"];
        [self presentViewController:recentVC animated:YES completion:nil];
    }
}
@end
