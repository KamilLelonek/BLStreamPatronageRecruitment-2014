//
//  GpsSimulator.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

/********************************************
 * This class is used for simulation GPS. It has
 * one static method called getCurrentLocation
 * which returns the most recent GPS position.
 * It's implementation depends on random generated
 * latitude and longitude points, where each of
 * them, for the sake of example, are greater
 * than the previous one. What is more, location
 * date is always older that the one obtained
 * a moment ago to keep consistency. This location
 * returned object contains x, y, and date attributes.
 ********************************************/

#import <Foundation/Foundation.h>
#include "Location.h"

@interface GpsSimulator : NSObject
    + (Location *) getCurrentLocation;
@end