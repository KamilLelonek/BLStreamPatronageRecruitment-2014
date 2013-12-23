//
//  ZooTripDelegate.h
//  SecondTask
//
//  Created by squixy on 23.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZooPath.h"

@protocol ZooTripDelegate <NSObject>
    - (void) zooTripDidStartOnPath: (ZooPath*) startPath;
@optional
    - (void) zooTripDidFinish;
@end