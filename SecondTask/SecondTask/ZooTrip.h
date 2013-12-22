//
//  ZooTrip.h
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZooPath.h"

typedef NS_ENUM(NSInteger, TripPreference) {
    LongTrip,
    FastTrip,
    RecommendedTrip
};

@interface ZooTrip : NSObject {
    NSMutableArray  *visitedPaths;
}

- (id) findBestPathByUserPreference:(TripPreference) tripPreference;

@end