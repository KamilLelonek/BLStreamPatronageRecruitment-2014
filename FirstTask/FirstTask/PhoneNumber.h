//
//  PhoneNumber.h
//  FirstTask
//
//  Created by squixy on 13.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneNumber : NSObject

@property (readonly) NSInteger numberAsInt;
@property (readonly) NSInteger areaCode;
@property (readonly) NSString  *formattedNumber;

+ (id)          phoneNumberWithString:  (NSString *) aNumber;
+ (BOOL)        isNumberValid:          (NSString *) aNumber;
+ (NSString *)  formatNumber:           (NSString *) aNumber;

- (void)        setNumber:              (NSString *) aNumber;
- (NSString *)  description;

@end