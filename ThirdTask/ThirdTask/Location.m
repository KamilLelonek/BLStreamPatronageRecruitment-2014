//
//  Location.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "Location.h"

@implementation Location
    - (id) initWithX: (NSInteger) x andY: (NSInteger) y andDate: (NSDate*) date {
        self = [super init];
        if (self) {
            self.x      = x;
            self.y      = y;
            self.date   = date;
        }
        return self;
    }

    - (id) init {
        return [self initWithX: 0 andY: 0 andDate:[NSDate date]];
    }

    - (NSString *) description {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat: @"dd-MM-yyyy"];
        NSString *textDate = [dateFormatter stringFromDate: self.date];
        return [NSString stringWithFormat: @"x: %d, y: %d, taken at: %@", (int) self.x, (int) self.y, textDate];
    }
@end