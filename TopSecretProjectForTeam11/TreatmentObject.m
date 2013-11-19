//
//  TreatmentObject.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "TreatmentObject.h"

@implementation TreatmentObject
-(id) initWithTreatment:(NSString *) treatment
          WithFrequency:(NSString *) frequency
              WithNotes:(NSString *) notes {
    self = [super init];
    if (self) {
        self.treatment = treatment;
        self.frequency = frequency;
        self.notes = notes;
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        [self setTreatment:[aDecoder decodeObjectForKey:@"treat"]];
        [self setFrequency:[aDecoder decodeObjectForKey:@"freq"]];
        [self setNotes:[aDecoder decodeObjectForKey:@"treatNotes"]];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_treatment forKey:@"treat"];
    [aCoder encodeObject:_frequency forKey:@"freq"];
    [aCoder encodeObject:_notes forKey:@"treatNotes"];
}
@end
