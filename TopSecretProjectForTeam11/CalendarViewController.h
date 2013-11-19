//
//  CalendarViewController.h
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/14/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TimesSquare/TimesSquare.h>

@interface CalendarViewController : UIViewController <TSQCalendarViewDelegate>

@property TSQCalendarView *myCalendar;

@end
