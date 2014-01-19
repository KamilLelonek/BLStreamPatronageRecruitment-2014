//
//  main.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageHelper.h"
#import "Location.h"
#import "UserData.h"
#import "GpsSimulator.h"

#define NUMBER_OF_MEASUREMENTS 200

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        StorageHelper *storageHelper = [StorageHelper sharedStorageHelper];
        UserData *userData = [UserData new];
        Location *currentLocation;
        
        for(int i = 0; i < NUMBER_OF_MEASUREMENTS; i++) {
            currentLocation = [GpsSimulator getCurrentLocation];
            NSLog(@"Current location: %@", currentLocation);
            [userData addNewLocation: currentLocation];
            [NSThread sleepForTimeInterval: 1.0f];
        }
        
        NSLog(@"\nUser data: %@", userData);
        
        storageHelper.writeData(userData);
        userData = nil;
        userData = storageHelper.readData();
        
        NSLog(@"\nUser data: %@", userData);
    }
    return 0;
}