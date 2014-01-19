//
//  GpsSimulator.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "GpsSimulator.h"
#import "Location.h"

#define TIME_PERIOD 60 * 60 /* minutes */ * 24 /* hours */
#define STEP_SIZE 10

static NSInteger lastPosition;
static NSDate    *date;

@implementation GpsSimulator
    + (void) initialize {
        if (self == [GpsSimulator class]) {
            date = [self getLaterDateFrom: [NSDate date] by: TIME_PERIOD];
        }
    }

    + (Location *) getCurrentLocation {
        NSInteger randomX = [self randomNumberFrom: lastPosition to: STEP_SIZE];
        NSInteger randomY = [self randomNumberFrom: lastPosition to: STEP_SIZE];
        Location *location = [[Location alloc] initWithX: randomX andY: randomY andDate: date];
        date = [self getLaterDateFrom: date by: TIME_PERIOD];
        
        lastPosition += STEP_SIZE;
        return location;
    }

    + (NSDate *) getLaterDateFrom: (NSDate *) date by: (NSInteger) period {
        return [date dateByAddingTimeInterval: period];
    }

    + (NSInteger) randomNumberFrom: (NSInteger) lowerBoundary to: (NSInteger) upperBoundary {
        return lowerBoundary + arc4random_uniform((int)upperBoundary + 1);
    }
@end