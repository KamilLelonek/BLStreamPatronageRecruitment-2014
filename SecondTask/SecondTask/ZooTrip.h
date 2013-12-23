//
//  ZooTrip.h
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZooPath.h"
#import "ZooTripDelegate.h"

typedef NS_ENUM(NSInteger, TripPreference) {
    LongTrip,
    FastTrip,
    RecommendedTrip
};

@interface ZooTrip : NSObject {
    NSMutableArray  *visitedPaths;
}

@property (nonatomic, weak) id <ZooTripDelegate> delegate;
- (void) start;

- (id) findBestPathByUserPreference:(TripPreference) tripPreference;

@end