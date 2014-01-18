//
//  ThirdTask_Tests.m
//  ThirdTask Tests
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "StorageHelper.h"
#include "UserData.h"

@interface StorageHelper_Tests : XCTestCase

@end

@implementation StorageHelper_Tests

-(void) tearDown {
    NSString *filePath          = [[StorageHelper sharedStorageHelper] filePath];
    NSFileManager *fileManager  = [NSFileManager defaultManager];
    
    [fileManager removeItemAtPath: filePath error: nil];
    [super tearDown];
}

-(void) testSeaveUserDataToArchive {
    UserData* userDataToWrite = [[UserData alloc] init];
    DataWriter dataWriter = [[StorageHelper sharedStorageHelper] writeData];
    BOOL result = dataWriter(userDataToWrite);
    XCTAssertTrue(result);
    
    DataReader dataReader = [[StorageHelper sharedStorageHelper] readData];
    UserData* userDataToRead = dataReader();
    XCTAssertNotNil(userDataToRead);
}

@end