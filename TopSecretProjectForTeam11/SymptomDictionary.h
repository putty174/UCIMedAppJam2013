//
//  SymptomDictionary.h
//  TopSecretProjectForTeam11
//
//  Created by Brandon Lim on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSDictionary.h>
#import "SymptomObject.h"

@interface SymptomDictionary : NSObject

+ (SymptomDictionary *) symptomDictionary;

@property (strong, nonatomic) NSMutableDictionary *symDictionary;

- (void)addSymptom:(SymptomObject *)symObject;
- (void)removeSymptom:(SymptomObject *)symObject;
- (SymptomObject *) findSymptom:(NSString *)symptom;

@property (strong, nonatomic) NSArray *paths;
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *filepath;



@end
