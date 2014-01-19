//
//  GpsSimulator.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

/*
 *
 */

#import <Foundation/Foundation.h>
#include "Location.h"

@interface GpsSimulator : NSObject
    + (Location *) getCurrentLocation;
@end