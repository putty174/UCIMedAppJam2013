//
//  SymptomObject.m
//  TopSecretProjectForTeam11
//
//  Created by Max on 11/15/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomObject.h"

@implementation SymptomObject

-(id)init {
    self = [super init];
    if (self) {
        self.occurrences = [[NSMutableArray alloc] init];
        self.treatments = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        [self setSymptom:[aDecoder decodeObjectForKey:@"symptom"]];
        [self setPain:[aDecoder decodeIntForKey:@"pain"]];
        [self setOccurrences:[aDecoder decodeObjectForKey:@"occurrences"]];
        [self setTreatments:[aDecoder decodeObjectForKey:@"treatments"]];
        [self setNotes:[aDecoder decodeObjectForKey:@"notes"]];
        [self setDate:[aDecoder decodeObjectForKey:@"date"]];
        [self setHome:[aDecoder decodeObjectForKey:@"home"]];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_symptom forKey:@"symptom"];
    [aCoder encodeInt:_pain forKey:@"pain"];
    [aCoder encodeObject:_occurrences forKey:@"occurrences"];
    [aCoder encodeObject:_treatments forKey:@"treatments"];
    [aCoder encodeObject:_notes forKey:@"notes"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.home forKey:@"home"];
}
@end
