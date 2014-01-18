//
//  UserData.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "UserData.h"

@implementation UserData
#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *) decoder {
    self = [super init];
    if (!self) { return nil; }
    
    self.locations  = [decoder decodeObjectForKey: @"locations"];
    self.length     = [decoder decodeFloatForKey:  @"length"   ];
    self.time       = [decoder decodeFloatForKey:  @"time"     ];
    self.speed      = [decoder decodeFloatForKey:  @"speed"    ];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *) encoder {
    [encoder encodeObject: self.locations forKey: @"locations"];
    [encoder encodeFloat:  self.length    forKey: @"length"   ];
    [encoder encodeFloat:  self.time      forKey: @"time"     ];
    [encoder encodeFloat:  self.speed     forKey: @"speed"    ];
}
@end