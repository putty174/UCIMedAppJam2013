//
//  SymptomObject.h
//  TopSecretProjectForTeam11
//
//  Created by Max on 11/15/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EKEvent.h>
#import <EventKit/EKEventStore.h>

@interface SymptomObject : NSObject <NSCoding>

@property NSString *symptom;
@property NSInteger pain;
@property NSMutableArray *occurrences;
@property NSMutableArray *treatments;
@property NSString *notes;
@property NSDate *date;
@property NSString *home;

@end
