//
//  UserData.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface UserData : NSObject <NSCoding>
    @property (atomic) NSMutableArray *locations;
    @property (atomic) double length;
    @property (atomic) double time;
    @property (atomic) double speed;

    - (void) addNewLocation: (Location*) location;
@end