//
//  ZooTrip.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "ZooTrip.h"

NSArray *predefiniedPaths;
NSArray *descriptorsLength;
NSArray *descriptorsRecommendation;
NSArray *descriptorsTime;

@implementation ZooTrip;

+ (void)initialize {
    if (self == [ZooTrip class]) {
        ZooPath *zooPath1 = [ZooPath zooPathWithName: @"Africa"         andTime: @1.5 andLength: @1500 andRating: @6];
        ZooPath *zooPath2 = [ZooPath zooPathWithName: @"South America"  andTime: @0.4 andLength: @500  andRating: @4];
        ZooPath *zooPath3 = [ZooPath zooPathWithName: @"Australia"      andTime: @0.5 andLength: @750  andRating: @5];
        ZooPath *zooPath4 = [ZooPath zooPathWithName: @"Europe"         andTime: @3   andLength: @2000 andRating: @6];
        ZooPath *zooPath5 = [ZooPath zooPathWithName: @"Asia"           andTime: @1   andLength: @1800 andRating: @3];
        predefiniedPaths = @[zooPath1, zooPath2, zooPath3, zooPath4, zooPath5];
        
        NSSortDescriptor *sortByLength          = [[NSSortDescriptor alloc] initWithKey: LENGTH ascending: NO];
        NSSortDescriptor *sortByRecommendation  = [[NSSortDescriptor alloc] initWithKey: RATING ascending: NO];
        NSSortDescriptor *sortByTime            = [[NSSortDescriptor alloc] initWithKey: TIME   ascending: NO];
        descriptorsLength          = [NSArray arrayWithObject: sortByLength];
        descriptorsRecommendation  = [NSArray arrayWithObject: sortByRecommendation];
        descriptorsTime            = [NSArray arrayWithObject: sortByTime];
    }
}

- (id) findBestPathByUserPreference:(TripPreference) tripPreference {
    switch (tripPreference) {
        case LongTrip:
            return [self findTheLongestTrip];
        case RecommendedTrip:
            return [self findTheMostRecommendedTrip];
        case FastTrip:
            return [self findTheFastestTrip];
        default:
            return nil;
    }
}

- (id) findTheLongestTrip {
    return [predefiniedPaths sortedArrayUsingDescriptors: descriptorsLength][0];
}

- (id) findTheMostRecommendedTrip {
    return [predefiniedPaths sortedArrayUsingDescriptors: descriptorsRecommendation][0];
}

- (id) findTheFastestTrip {
    return [predefiniedPaths sortedArrayUsingDescriptors: descriptorsTime][0];
}

@end