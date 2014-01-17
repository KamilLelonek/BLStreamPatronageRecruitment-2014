//
//  ZooTrip_Test.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecondTask_Tests.h"
#import "ZooTrip.h"

@interface ZooTrip_Test : SecondTask_Tests {
    ZooTrip* zooTrip;
}
@end

@implementation ZooTrip_Test

- (void)setUp
{
    [super setUp];
    zooTrip = [[ZooTrip alloc] init];
}

- (void) testFindPathBasedOnPreferences
{
    ZooPath* path = [zooTrip findBestPathByUserPreference: LongTrip];
    XCTAssertEqual(path.length, @2000);
    
    path = [zooTrip findBestPathByUserPreference: RecommendedTrip];
    XCTAssertEqual(path.rating, @6);
    
    path = [zooTrip findBestPathByUserPreference: FastTrip];
    XCTAssertEqual(path.time, @0.4f);
}

@end