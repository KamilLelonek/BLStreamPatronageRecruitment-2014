//
//  main.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZooPath.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        ZooPath *zooPath = [ZooPath zooPathWithName: @"" andTime: @"" andLength: @"" andRating: @1];
        NSLog([zooPath description]);
    }
    return 0;
}