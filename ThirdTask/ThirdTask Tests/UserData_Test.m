//
//  UserData_Test.m
//  ThirdTask
//
//  Created by squixy on 19.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UserData.h"
#import "Location.h"

@interface UserData_Test : XCTestCase

@end

@implementation UserData_Test

- (void) testUpdateValues {
    NSDate   *dateNow           = [NSDate date];
    NSDate   *dateInOneMinute   = [dateNow         dateByAddingTimeInterval: 60];
    NSDate   *dateInOneHour     = [dateInOneMinute dateByAddingTimeInterval: 60 * 60];
    Location *location          = [[Location alloc] initWithX: 0 andY:   0 andDate: dateNow];
    Location *nextLocation      = [[Location alloc] initWithX: 3 andY:   4 andDate: dateInOneMinute];
    Location *furtherLocation   = [[Location alloc] initWithX: 11 andY: 10 andDate: dateInOneHour];
    UserData *userData          = [UserData new];
    
    [userData addNewLocation: location];
    
    XCTAssertTrue([self isDouble: userData.length equalTo: 0]);
    XCTAssertTrue([self isDouble: userData.time   equalTo: 0]);
    XCTAssertTrue([self isDouble: userData.speed  equalTo: 0]);
    
    [userData addNewLocation: nextLocation];
    
    XCTAssertTrue([self isDouble: userData.length equalTo: 5]);
    XCTAssertTrue([self isDouble: userData.time   equalTo: 60]);
    XCTAssertTrue([self isDouble: userData.speed  equalTo: 5.0/60]);
    
    [userData addNewLocation: furtherLocation];
    
    XCTAssertTrue([self isDouble: userData.length equalTo: 15]);
    XCTAssertTrue([self isDouble: userData.time   equalTo: 60 + 60 * 60]);
    XCTAssertTrue([self isDouble: userData.speed  equalTo: 15.0/(60 + 60 * 60)]);
}

- (BOOL) isDouble: (double) first equalTo: (double) second {
    return abs(first - second) < DBL_EPSILON;
}

@end