//
//  Location.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "Location.h"

@implementation Location
#define KeyDate @"date"
#define KeyX    @"x"
#define KeyY    @"y"

    NSString * (^dateFormatter)(NSDate *) = ^(NSDate * dateToFormat) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat: @"dd-MM-yyyy"];
        return [dateFormatter stringFromDate: dateToFormat];
    };

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
        NSString *textDate = dateFormatter(self.date);
        return [NSString stringWithFormat: @"x: %d, y: %d, taken at: %@", (int) self.x, (int) self.y, textDate];
    }

#pragma mark NSCoding
    - (id) initWithCoder: (NSCoder *) decoder {
        self = [super init];
        if (self) {
            self.date  = [decoder decodeObjectForKey: KeyDate ];
            self.x     = [decoder decodeFloatForKey:  KeyX    ];
            self.y     = [decoder decodeFloatForKey:  KeyY    ];
        }
        return self;
    }

    - (void) encodeWithCoder: (NSCoder *) encoder {
        [encoder encodeObject: self.date forKey: KeyDate ];
        [encoder encodeFloat:  self.x    forKey: KeyX    ];
        [encoder encodeFloat:  self.y    forKey: KeyY    ];
    }
@end