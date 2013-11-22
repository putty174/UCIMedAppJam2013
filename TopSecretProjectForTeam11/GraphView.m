//
//  GraphView.m
//  TopSecretProjectForTeam11
//
//  Created by App Jam on 11/21/13.
//  Copyright (c) 2013 App Jam. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        UIImage *image = [UIImage imageNamed: @"theGraph.jpg"];
        [self setImage:image];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
