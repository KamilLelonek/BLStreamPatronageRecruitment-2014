//
//  FirstTask_Tests.m
//  FirstTask Tests
//
//  Created by squixy on 14.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PhoneNumber.h"

@interface FirstTask_Tests : XCTestCase

@end

@implementation FirstTask_Tests

- (void) testShouldHaveNotValidNumbers
{
    NSString *number = @"";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
    number = @"+";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
    number = @"+48";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
    number = @"48";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
    number = @"123456789";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
    number = @"48123456789";
    XCTAssertFalse([PhoneNumber isNumberValid: number]);
}

- (void) testShouldHaveValidNumbers
{
    NSString *number = @"+48123456789";
    XCTAssertTrue([PhoneNumber isNumberValid: number]);
    number = @" +48123456789 ";
    XCTAssertTrue([PhoneNumber isNumberValid: number]);
    number = @"+48 123 456 789";
    XCTAssertTrue([PhoneNumber isNumberValid: number]);
}

- (void) testShouldNotCreateObject
{
    PhoneNumber *pn = [PhoneNumber phoneNumberWithString: @""];
    XCTAssertNil(pn);
    pn = [PhoneNumber phoneNumberWithString: @"+"];
    XCTAssertNil(pn);
    pn = [PhoneNumber phoneNumberWithString: @"+48"];
    XCTAssertNil(pn);
    pn = [PhoneNumber phoneNumberWithString: @"+485"];
    XCTAssertNil(pn);
}

- (void) testShouldCreateObject
{
    PhoneNumber *pn = [PhoneNumber phoneNumberWithString: @"+48 525 458 784"];
    XCTAssertNotNil(pn);
    pn = [PhoneNumber phoneNumberWithString: @"+48525458784"];
    XCTAssertNotNil(pn);
    pn = [PhoneNumber phoneNumberWithString: @" +48525458784 "];
    XCTAssertNotNil(pn);
}

- (void) testShouldFormatNumber
{
    NSString *number = @"";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @""]);
    number = @"+";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"+"]);
    number = @"+48";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"+48"]);
    number = @"48";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"48"]);
    number = @"123456789";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"123 456 789"]);
    number = @"48123456789";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"481 234 567 89"]);
    number = @"+48123456789";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"+48 123 456 789"]);
    number = @" +48123456789 ";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"+48 123 456 789"]);
    number = @"+48 123 456 789";
    XCTAssertTrue([[PhoneNumber formatNumber: number] isEqualToString: @"+48 123 456 789"]);
}

- (void) testShouldHaveAllFieldsSet
{
    PhoneNumber *pn = [PhoneNumber phoneNumberWithString: @"+48 525 458 784"];
    XCTAssertTrue(pn.areaCode == 48);
    XCTAssertTrue(pn.numberAsInt == 525458784);
    XCTAssertTrue(pn.formattedNumber, @"+48 525 458 784");
    
    [pn setNumber: @"+48525458784"];
    XCTAssertTrue(pn.areaCode == 48);
    XCTAssertTrue(pn.numberAsInt == 525458784);
    XCTAssertTrue(pn.formattedNumber, @"+48 525 458 784");
    
    [pn setNumber: @" + 4 8 5 2 5 4 5 8 7 8 4 "];
    XCTAssertTrue(pn.areaCode == 48);
    XCTAssertTrue(pn.numberAsInt == 525458784);
    XCTAssertTrue(pn.formattedNumber, @"+48 525 458 784");
    
    [pn setNumber: @" +00 000 000 000 "];
    XCTAssertTrue(pn.areaCode == 00);
    XCTAssertTrue(pn.numberAsInt == 0);
    XCTAssertTrue(pn.formattedNumber, @"+00 000 000 000");
}

- (void) testShouldNotHaveFieldsSet
{
    PhoneNumber *pn = [PhoneNumber phoneNumberWithString: @"525 458 784"];
    XCTAssertTrue(pn.areaCode == 0);
    XCTAssertTrue(pn.numberAsInt == 0);
    XCTAssertNil(pn.formattedNumber);
    
    pn = [PhoneNumber phoneNumberWithString: @"+48 525 458 784"];
    [pn setNumber: @"525 458 784"];
    XCTAssertTrue(pn.areaCode == 0);
    XCTAssertTrue(pn.numberAsInt == 0);
    XCTAssertNil(pn.formattedNumber);
}

@end