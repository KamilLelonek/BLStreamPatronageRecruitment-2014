//
//  SecondTask_Tests.m
//  SecondTask Tests
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//
#import "SecondTask_Tests.h"

@implementation SecondTask_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (BOOL) isFloat: (NSNumber*) first equalTo: (NSNumber*) second {
    return abs([first floatValue] - [second floatValue]) < FLT_EPSILON;
}

@end