//
//  PhoneNumber.m
//  FirstTask
//
//  Created by squixy on 13.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "PhoneNumber.h"

@implementation PhoneNumber

+ (id) phoneNumberWithString:(NSString *)aNumber
{
    return [[self alloc] initWithNumber: aNumber];
}

- (id) initWithNumber:(NSString *)aNumber
{
    self = [super init];
    if (self)
    {
        if (![[self class] isNumberValid: aNumber])
        {
            return NULL;
        }
        
        [self setNumber: aNumber];
    }
    
    return self;
}

- (void) setNumber: (NSString *) aNumber
{
    if (![[self class] isNumberValid: aNumber])
    {
        NSLog(@"\nNot a valid phone number");
        _areaCode = _numberAsInt = -1;
        _formattedNumber = @"-1";
        return;
    }
    
    NSString *trimmedNumber = [[self class] excapeWhitespaces: aNumber];
    
    NSString *areaCode = [trimmedNumber substringWithRange: NSMakeRange(1,2)];
    _areaCode = [areaCode integerValue];
    
    NSString *numberWithoutAreaCode = [trimmedNumber substringFromIndex: 3];
    _numberAsInt = [numberWithoutAreaCode integerValue];
    
    _formattedNumber = [[self class] formatNumber: aNumber];
}

+ (NSString *) formatNumber: (NSString *) aNumber
{
    NSString *trimmedNumber = [[self class] excapeWhitespaces: aNumber];
    NSMutableString *mutableNumber = [NSMutableString stringWithString: trimmedNumber];
    NSInteger length = [mutableNumber length];
    
    if(length > 3)
    {
        for(long i = 3; i < [mutableNumber length]; i += 4)
        {
            [mutableNumber insertString: @" " atIndex: i];
        }
        return [NSString stringWithString: mutableNumber];
    }
    else {
        return aNumber;
    }
}

- (NSString *)description
{
    return [
            NSString stringWithFormat:
            @"\nArea code: %ld, Number: %ld \nPretty representation: %@",
            (long)_areaCode, (long)_numberAsInt, _formattedNumber
            ];
}

+ (BOOL) isNumberValid: (NSString *) aNumber
{
    NSString *trimmedString = [[self class] excapeWhitespaces: aNumber];
    
    BOOL startsWithPlus = [trimmedString hasPrefix: @"+"];
    if (!startsWithPlus) return NO;
    
    NSUInteger length = [trimmedString length];
    if (length != 12) return NO;
    
    NSString *numberWithoutPlus = [trimmedString substringFromIndex: 1];
    NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];
    NSString *numberWithoutDigits = [numberWithoutPlus stringByTrimmingCharactersInSet: digits];
    if([numberWithoutDigits length] != 0) return NO;
    
    return YES;
}

+ (NSString *) excapeWhitespaces: (NSString *) string
{
    return [string stringByReplacingOccurrencesOfString: @" " withString: @""];
}

@end