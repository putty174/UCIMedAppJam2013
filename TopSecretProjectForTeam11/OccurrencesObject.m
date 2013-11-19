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

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        [self setStartDate:[aDecoder decodeObjectForKey:@"start"]];
        [self setEndDate:[aDecoder decodeObjectForKey:@"end"]];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_startDate forKey:@"start"];
    [aCoder encodeObject:_endDate forKey:@"end"];
    
}
@end
