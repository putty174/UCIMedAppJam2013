//
//  SymptomDictionary.m
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "SymptomDictionary.h"
#import <UIKit/UIKit.h>


@implementation SymptomDictionary

+ (SymptomDictionary *) symptomDictionary
{
    static SymptomDictionary *mainDictionary = nil;
    if (!mainDictionary)
    {
        mainDictionary = [[super allocWithZone:nil] init];
    }
    return mainDictionary;
}

+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [self symptomDictionary];
}

- (id) init
{
    self = [super init];
    _paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _path = [_paths objectAtIndex:0];
    _filepath = [_path stringByAppendingPathComponent:@"symdic.plist"];
    if (self)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:_filepath])
        {
            _symDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:_filepath]];
        }
        else
        {
            _symDictionary = [[NSMutableDictionary alloc] init];
        }
    }
    return self;
}

// Add Symptom Objects to the symDictionary
- (void)addSymptom:(SymptomObject *)symObject
{
    symObject.date = [NSDate date];
    symObject.home = @"YES";
    [self.symDictionary setObject:symObject forKey:symObject.symptom];
    
    NSData *symptomDict = [NSKeyedArchiver archivedDataWithRootObject:_symDictionary];
    BOOL save = [symptomDict writeToFile:_filepath atomically:YES];
    
    if(save)
    {
        UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Symptom Saved" message:@"Your symptom has been saved." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [symptomAlert show];
    }
    else
    {
        UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Save Failed" message:@"Your symptom failed to save." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [symptomAlert show];
    }
}

// Remove Symptom Objects to the symDictionary
- (void)removeSymptom:(SymptomObject *)symObject{
    [self.symDictionary removeObjectForKey:symObject.symptom];
    
    NSData *symptomDict = [NSKeyedArchiver archivedDataWithRootObject:_symDictionary];
    BOOL save = [symptomDict writeToFile:_filepath atomically:YES];
    
    if(save)
    {
        NSLog(@"remove symptom here");
        UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Symptom Removed" message:@"Your symptom has been removed." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [symptomAlert show];
    }
    else
    {
        NSLog(@"remove symptom failed");
        UIAlertView *symptomAlert = [[UIAlertView alloc] initWithTitle:@"Remove Failed" message:@"Your symptom failed to remove." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil];
        [symptomAlert show];
    }
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
