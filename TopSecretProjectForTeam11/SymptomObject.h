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

@interface SymptomObject : NSObject 

@property NSString *symptom;
@property int pain;
@property EKEvent *event;

@end
