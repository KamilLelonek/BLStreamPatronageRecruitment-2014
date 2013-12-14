//
//  main.m
//  FirstTask
//
//  Created by squixy on 13.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        PhoneNumber *pn = [PhoneNumber phoneNumberWithString: @"+48123456789"];
        NSLog(@"PhoneNumber: %@", pn);
        NSLog(@"\n\n-----------\n\n");
        
        [pn setNumber: @"+48000000000"];
        NSLog(@"PhoneNumber: %@", pn);
        NSLog(@"\n\n-----------\n\n");
        
        [pn setNumber: @"+48999999999"];
        NSLog(@"PhoneNumber: %@", pn);
        NSLog(@"\n\n-----------\n\n");
        
        [pn setNumber: @"18456123789"];
        NSLog(@"PhoneNumber: %@", pn);
        NSLog(@"\n\n-----------\n\n");
    }
    return 0;
}