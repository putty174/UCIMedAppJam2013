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
@end
