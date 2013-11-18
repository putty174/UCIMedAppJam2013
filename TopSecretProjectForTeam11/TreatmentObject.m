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
@end
