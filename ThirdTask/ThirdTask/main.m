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
#define PERIOD_BETWEEN_MEASUREMENTS  1.0f

void simulateDelay();
void testStorage(UserData *userData);
UserData* getDataFromGPS();

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        UserData *userData = getDataFromGPS();
        testStorage(userData);
    }
    return 0;
}

UserData* getDataFromGPS() {
    UserData *userData = [UserData new];
    Location *currentLocation;
    
    for(int i = 0; i < NUMBER_OF_MEASUREMENTS; i++) {
        currentLocation = [GpsSimulator getCurrentLocation];
        NSLog(@"Current location: %@", currentLocation);
        [userData addNewLocation: currentLocation];
        simulateDelay();
    }
    return userData;
}

void simulateDelay()
{
    [NSThread sleepForTimeInterval: PERIOD_BETWEEN_MEASUREMENTS];
}

void testStorage(UserData *userData)
{
    StorageHelper *storageHelper = [StorageHelper sharedStorageHelper];
    
    NSLog(@"\nUser data: %@", userData);
    
    storageHelper.writeData(userData);
    userData = nil;
    userData = storageHelper.readData();
    
    NSLog(@"\nUser data: %@", userData);
}