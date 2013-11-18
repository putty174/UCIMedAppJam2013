//
//  SymptomViewController.h
//  TopSecretProjectForTeam11
//
//  Created by Max on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SymptomObject.h"

@interface SymptomViewController : UIViewController

@property (strong, nonatomic) NSString *symptomName;
@property int painValue;
@property (strong, nonatomic) IBOutlet UITextView *notesView;

@end
