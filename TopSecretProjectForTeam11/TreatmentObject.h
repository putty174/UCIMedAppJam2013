//
//  TreatmentObject.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/17/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreatmentObject : NSObject <NSCoding>
@property NSString *treatment;
@property NSString *frequency;
@property NSString *notes;

-(id) initWithTreatment:(NSString *) treatment
          WithFrequency:(NSString *) frequency
              WithNotes:(NSString *) notes;
@end
