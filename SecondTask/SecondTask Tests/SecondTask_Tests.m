//
//  SecondTask_Tests.m
//  SecondTask Tests
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//
#import "SecondTask_Tests.h"

@implementation SecondTask_Tests

- (BOOL) isFloat: (NSNumber*) first equalTo: (NSNumber*) second {
    return abs([first floatValue] - [second floatValue]) < FLT_EPSILON;
}

@end