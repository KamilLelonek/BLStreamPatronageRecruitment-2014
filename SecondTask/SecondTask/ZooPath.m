//
//  ZooPath.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "ZooPath.h"

@implementation ZooPath
- (void) setName:   (NSString *)    name   { [zooPathDictionary setObject: name   forKey: NAME];   }
- (void) setTime:   (NSNumber *)    time   { [zooPathDictionary setObject: time   forKey: TIME];   }
- (void) setLength: (NSNumber *)    length { [zooPathDictionary setObject: length forKey: LENGTH]; }
- (void) setRating: (NSNumber*)     rating { [zooPathDictionary setObject: rating forKey: RATING]; }

- (NSString*) name   { return zooPathDictionary[NAME];   }
- (NSNumber*) time   { return zooPathDictionary[TIME];   }
- (NSNumber*) length { return zooPathDictionary[LENGTH]; }
- (NSNumber*) rating { return zooPathDictionary[RATING]; }

- (id) initWithName:    (NSString*) aName
            andTime:    (NSNumber*) aTime
          andLength:    (NSNumber*) aLength
          andRating:    (NSNumber*) aRating
{
    self = [super init];
    zooPathDictionary = [[NSMutableDictionary alloc] init];
    if (self) {
        [self setName:   aName];
        [self setTime:   aTime];
        [self setLength: aLength];
        [self setRating: aRating];
    }
    
    return self;
}

+ (id) zooPathWithName:    (NSString*) aName
               andTime:    (NSNumber*) aTime
             andLength:    (NSNumber*) aLength
             andRating:    (NSNumber*) aRating
{
    return [[ZooPath alloc] initWithName:   aName
                              andTime:      aTime
                            andLength:      aLength
                            andRating:      aRating];
}

- (NSString*) lengthN2S: (NSNumber*) aLength {
    return [NSString stringWithFormat: @"%@m", aLength];
}

- (NSString*) timehN2S: (NSNumber*) aTime {
    return [NSString stringWithFormat: @"%@h", aTime];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"\n{\n\tname: %@,\n\ttime: %@h,\n\tlength: %@m,\n\trating: %@\n}", [self name], [self time], [self length], [self rating]];
}

@end