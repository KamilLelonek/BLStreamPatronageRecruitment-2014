//
//  ZooPath.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "ZooPath.h"

@implementation ZooPath
static NSString* const NAME   = @"name";
static NSString* const TIME   = @"time";
static NSString* const LENGTH = @"length";
static NSString* const RATING = @"rating";

- (void) setName:   (NSString *)    name   { [zooPathDictionary setObject:name   forKey:NAME]; }
- (void) setTime:   (NSString *)    time   { [zooPathDictionary setObject:time   forKey:TIME]; }
- (void) setLength: (NSString *)    length { [zooPathDictionary setObject:length forKey:LENGTH]; }
- (void) setRating: (NSNumber*)     rating { [zooPathDictionary setObject:rating forKey:RATING]; }

- (NSString*) name   { return zooPathDictionary[NAME]; }
- (NSString*) time   { return zooPathDictionary[TIME]; }
- (NSString*) length { return zooPathDictionary[LENGTH]; }
- (NSNumber*) rating { return zooPathDictionary[RATING]; }

- (id) initWithName:    (NSString*) aName
          andTime:      (NSString*) aTime
          andLength:    (NSString*) aLength
          andRating:    (NSNumber*) aRating
{
    self = [super init];
    if (self) {
        zooPathDictionary = [@{
                              NAME:      [aName copy],
                              TIME:      [aTime copy],
                              LENGTH:    [aLength copy],
                              RATING:    [aRating copy]
                              } mutableCopy];
    }
    
    return self;
}

+ (id) zooPathWithName:    (NSString*) aName
             andTime:      (NSString*) aTime
             andLength:    (NSString*) aLength
             andRating:    (NSNumber*) aRating
{
    return [[ZooPath alloc] initWithName:   aName
                            andTime:        aTime
                            andLength:      aLength
                            andRating:      aRating];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"\n{\n\tname: %@,\n\ttime: %@,\n\tlength: %@,\n\trating: %@\n}", [self name], [self time], [self length], [self rating]];
}

@end