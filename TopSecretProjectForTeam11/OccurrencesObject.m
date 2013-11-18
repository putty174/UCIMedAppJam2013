//
//  OccurrencesObject.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "OccurrencesObject.h"

@implementation OccurrencesObject
-(id) initWithStartDate:(NSDate *) startDate
            WithEndDate:(NSDate *) endDate {
    self = [super init];
    if (self) {
        self.startDate = startDate;
        self.endDate = endDate;
    }
    return self;
}

@end
