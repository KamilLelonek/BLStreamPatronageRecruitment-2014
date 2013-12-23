//
//  ZooTrip+Extended.m
//  SecondTask
//
//  Created by squixy on 23.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "ZooTrip+Extended.h"

@implementation ZooTrip (Extended)
- (void) finish {
    [visitedPaths removeLastObject];
    [self.delegate zooTripDidFinish];
}
@end