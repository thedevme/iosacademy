//
//  TDMHeaderView.m
//  ToDoMovies
//
//  Created by Craig Clayton on 10/18/13.
//  Copyright (c) 2013 ToDoMovies. All rights reserved.
//

#import "TDMHeaderView.h"

@implementation TDMHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"TDMHeaderView" owner:self options:nil];
        self = [nib objectAtIndex:0];
    }
    return self;
}

@end
