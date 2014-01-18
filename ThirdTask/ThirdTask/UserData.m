//
//  UserData.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "UserData.h"

@implementation UserData
#pragma mark NSCoding
#define KeyLocations @"locations"
#define KeyLength    @"length"
#define KeyTime      @"speed"
#define KeySpeed     @"time"

- (id) initWithCoder: (NSCoder *) decoder {
    self = [super init];
    if (self) {
        self.locations  = [decoder decodeObjectForKey: KeyLocations];
        self.length     = [decoder decodeFloatForKey:  KeyLength   ];
        self.time       = [decoder decodeFloatForKey:  KeySpeed    ];
        self.speed      = [decoder decodeFloatForKey:  KeySpeed    ];
    }
    return self;
}

- (void) encodeWithCoder: (NSCoder *) encoder {
    [encoder encodeObject: self.locations forKey: KeyLocations];
    [encoder encodeFloat:  self.length    forKey: KeyLength   ];
    [encoder encodeFloat:  self.time      forKey: KeySpeed    ];
    [encoder encodeFloat:  self.speed     forKey: KeySpeed    ];
}
@end