//
//  GpsSimulator_Test.m
//  ThirdTask
//
//  Created by squixy on 19.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Location.h"
#import "GpsSimulator.h"

@interface GpsSimulator_Test : XCTestCase

@end

@implementation GpsSimulator_Test

- (void) testGenerateIncreasingLocation
{
    NSInteger lastX    = 0,
              lastY    = 0,
              currentX = 0,
              currentY = 0;
    NSDate    *currentDate,
              *lastDate = [NSDate date];
    Location  *location;
    
    for (int i = 0; i < 100; i++) {
        location     = [GpsSimulator getCurrentLocation];
        currentX     = location.x;
        currentY     = location.y;
        currentDate  = location.date;
        
        NSLog(@"\n---\nCurrentX: %3.d, CurrentY: %3.d, CurrentDate: %@ \nLastlX: %5.d, LastY: %6.d, LastDate:    %@\n---\n",
              (int)currentX, (int)currentY, currentDate, (int)lastX, (int)lastY, lastDate);
        
        XCTAssertTrue(currentX >= lastX);
        XCTAssertTrue(currentY >= lastY);
        
        NSComparisonResult dateOrder = [lastDate compare: currentDate];
        XCTAssertTrue(dateOrder == NSOrderedAscending);
        
        lastX    = currentX;
        lastY    = currentY;
        lastDate = currentDate;
    }
}

@end
