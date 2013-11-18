//
//  SymptomDictionary.m
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomDictionary.h"


@implementation SymptomDictionary

// Initialize the NSMutableDictionary called symDictionary
- (NSMutableDictionary *) symDictionary {
    if (!_symDictionary) _symDictionary = [[NSMutableDictionary alloc] init];
    return _symDictionary;
}

// Add Symptom Objects to the symDictionary
- (void)addSymptom:(SymptomObject *)symObject{
    [self.symDictionary setObject:symObject forKey:symObject.symptom];
}

// Remove Symptom Objects to the symDictionary
- (void)removeSymptom:(SymptomObject *)symObject{
    [self.symDictionary removeObjectForKey:symObject.symptom];
}

// Find Symptom Objects in the symDictionary
- (SymptomObject *) findSymptom:(NSString *)symptom{
    if ([[self.symDictionary allKeys] containsObject:symptom]){
        return self.symDictionary[symptom];
    } else {
        return NULL;
    }
}

@end
