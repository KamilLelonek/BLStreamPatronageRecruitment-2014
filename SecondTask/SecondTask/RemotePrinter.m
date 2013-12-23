//
//  RemotePrinter.m
//  SecondTask
//
//  Created by squixy on 23.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import "RemotePrinter.h"
#import "ZooPath.h"

@implementation RemotePrinter
- (void) zooTripDidStartOnPath: (ZooPath*) startPath {
    NSLog(@"print zooTripDidStartOnPath with argument: %@", startPath);
}

- (void) zooTripDidFinish {
    NSLog(@"print zooTripDidFinish");
}
@end