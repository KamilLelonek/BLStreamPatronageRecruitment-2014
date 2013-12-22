//
//  ZooPath_Test.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SecondTask_Tests.h"
#import "ZooPath.h"

@interface ZooPath_Test : SecondTask_Tests {
    ZooPath *zooPath;
}
@end

@implementation ZooPath_Test

- (void)setUp
{
    [super setUp];
    zooPath = [ZooPath zooPathWithName: @"" andTime: @0 andLength: @0 andRating: @0];
}

- (void) testShouldCreateZooPath {
    XCTAssertEqual(zooPath.name,    @"");
    XCTAssertTrue([self isFloat: zooPath.time equalTo: @0.0f]);
    XCTAssertEqual(zooPath.length,  @0);
    XCTAssertEqual(zooPath.rating,  @0);
}

- (void) testShouldChangePathProperties {
    zooPath.name = @"name";
    XCTAssertEqual(zooPath.name, @"name");
    
    zooPath.time = @0.5f;
    XCTAssertTrue([super isFloat:zooPath.time equalTo: @0.5f]);
    
    zooPath.length = @100;
    XCTAssertEqual(zooPath.length,  @100);
    
    zooPath.rating = @1;
    XCTAssertEqual(zooPath.rating, @1);
}

@end