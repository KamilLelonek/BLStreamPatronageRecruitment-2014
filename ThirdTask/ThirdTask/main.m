//
//  main.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageHelper.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        [[StorageHelper sharedStorageHelper] readData];
    }
    return 0;
}