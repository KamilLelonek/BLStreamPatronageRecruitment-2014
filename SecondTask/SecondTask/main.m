//
//  main.m
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemotePrinter.h"
#import "ZooTrip.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        RemotePrinter *rPrinter = [[RemotePrinter alloc] init];
        ZooTrip *zooTrip = [[ZooTrip alloc] init];
        zooTrip.delegate = rPrinter;
        
        id bestPath = [zooTrip findBestPathByUserPreference:FastTrip];
        NSLog(@"Found Fastest path %@", bestPath);
        
        bestPath = [zooTrip findBestPathByUserPreference:RecommendedTrip];
        NSLog(@"Found Recommended path %@", bestPath);
        
        bestPath = [zooTrip findBestPathByUserPreference:LongTrip];
        NSLog(@"Found Longest path %@", bestPath);
        
        [zooTrip start];
    }
    return 0;
}