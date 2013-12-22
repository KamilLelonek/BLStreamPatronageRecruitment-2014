//
//  ZooPath_Test.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZooPath.h"

@interface ZooPath_Test : XCTestCase {
    ZooPath *zooPath;
}
@end

@implementation ZooPath_Test

- (void)setUp
{
    [super setUp];
    zooPath = [ZooPath zooPathWithName: @"" andTime: @"" andLength: @"" andRating: @0];
}

- (void) testShouldCreateZooPath {
    XCTAssertEqual(zooPath.name,    @"");
    XCTAssertEqual(zooPath.time,    @"");
    XCTAssertEqual(zooPath.length,  @"");
    XCTAssertEqual(zooPath.rating,  @0);
}

- (void) testShouldChangePathProperties {
    zooPath.name = @"name";
    XCTAssertEqual(zooPath.name, @"name");
    
    zooPath.time = @"time";
    XCTAssertEqual(zooPath.time, @"time");
    
    zooPath.length = @"length";
    XCTAssertEqual(zooPath.length, @"length");
    
    zooPath.rating = @1;
    XCTAssertEqual(zooPath.rating, @1);
}

@end