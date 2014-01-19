//
//  GpsSimulator.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "GpsSimulator.h"
#import "Location.h"

#define TimeInterval 60 * 60 /* minutes */ * 24 /* hours */

static NSInteger step;
static NSDate    *date;

@implementation GpsSimulator
    + (void) initialize {
        if (self == [GpsSimulator class]) {
            step = 0;
            date = [[NSDate date] dateByAddingTimeInterval: TimeInterval];
        }
    }

    + (Location *) getCurrentLocation {
        NSInteger randomX = step + arc4random_uniform(11);
        NSInteger randomY = step + arc4random_uniform(11);
        Location *location = [[Location alloc] initWithX: randomX andY: randomY andDate: date];
        
        step += 10;
        date = [date dateByAddingTimeInterval: TimeInterval];
        
        return location;
    }
@end