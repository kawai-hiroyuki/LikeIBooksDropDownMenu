//
//  DropDownButton.m
//  LikeIBooksDropDownMenu
//
//  Created by obumin on 08/27/14.
//  Copyright (c) 2014 Kawai Hiroyuki. All rights reserved.
//
//  This code with reference to the following sites:
//  http://stackoverflow.com/questions/25530135/i-want-to-make-a-button-with-an-icon-of-the-triangle
//

#import "DropDownButton.h"

@interface DropDownButton ()

@end

@implementation DropDownButton

#pragma mark - Setup/Teardown

- (void)setup
{
    NSString *title = [self titleForState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateNormal]; //Adds arrow if title set in storyboard
}

- (void)awakeFromNib
{
    [self setup];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    title = [title stringByAppendingString:@" \u25BE"]; //Unicode - Down arrow
    [super setTitle:title forState:state];
    [self sizeToFit];
}

@end
