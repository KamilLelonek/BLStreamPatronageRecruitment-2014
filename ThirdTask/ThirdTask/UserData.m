//
//  UserData.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "UserData.h"

@implementation UserData
#define KeyLocations @"locations"
#define KeyLength    @"length"
#define KeySpeed     @"speed"
#define KeyTime      @"time"

    - (id) init {
        if (self = [super init]) {
            self.locations  = [NSMutableArray new];
        }
        return self;
    }

    typedef double (^LocationUpdater)(Location *, Location *);

    LocationUpdater calculateTimeBetween =  ^(Location* previousLocation, Location* nextLocation) {
        NSTimeInterval lastDiff = [previousLocation.date timeIntervalSince1970];
        NSTimeInterval nextDiff = [nextLocation.date     timeIntervalSince1970];
        return nextDiff - lastDiff;
    };

    LocationUpdater calculateLengthBetween =  ^(Location* previousLocation, Location* nextLocation) {
        double xDiff = nextLocation.x - previousLocation.x;
        double yDiff = nextLocation.y - previousLocation.y;
        return sqrt(pow(xDiff, 2) + pow(yDiff, 2)); // Pythagorean theorem: x^2 + y^2 = distance^2
    };

    LocationUpdater calculateSpeedBetween =  ^(Location* previousLocation, Location* nextLocation) {
        double lenthInUnits  = calculateLengthBetween(previousLocation, nextLocation);
        double timeInSeconds = calculateTimeBetween(previousLocation,   nextLocation);
        return timeInSeconds ? lenthInUnits / timeInSeconds : 0;
    };

    - (void) addNewLocation: (Location*) location {
        [self updateTotalTime:      location];
        [self updateAverageSpeed:   location];
        [self updateTotalLength:    location];
        [self.locations addObject:  location];
    }

    - (void) updateTotalTime: (Location*) newLocation {
        Location *lastLocation = [self getLastLocation];
        if(lastLocation) {
            self.time += calculateTimeBetween(lastLocation, newLocation);
        }
    }

    - (void) updateAverageSpeed: (Location*) newLocation {
        unsigned long count = [self.locations count];
        
        Location *lastLocation = [self getLastLocation];
        if(lastLocation) {
            double speedSum = .0;
            
            for(int i = 0, j = 1; j < count; i++, j++) {
                Location* lastLocation  = self.locations[i];
                Location* firstLocation = self.locations[j];
                speedSum += calculateSpeedBetween(lastLocation, firstLocation);
            }
            
            speedSum += calculateSpeedBetween(lastLocation, newLocation);
            self.speed = speedSum / count;
        }
    }

    - (void) updateTotalLength: (Location*) newLocation {
        Location *lastLocation = [self getLastLocation];
        if(lastLocation) {
            self.length += calculateLengthBetween(lastLocation, newLocation);
        }
    }

    - (Location*) getLastLocation {
        BOOL hasElements = self.locations && [self.locations count];
        return hasElements ? [self.locations lastObject] : nil;
    }

    - (NSString *) description {
        return [NSString stringWithFormat: @"\nTotal time: %f, total length: %f, average speed: %f\n\n",
                self.time, self.length, self.speed];
    }

#pragma mark NSCoding
    - (id) initWithCoder: (NSCoder *) decoder {
        self = [super init];
        if (self) {
            self.locations  = [decoder decodeObjectForKey: KeyLocations];
            self.length     = [decoder decodeFloatForKey:  KeyLength   ];
            self.time       = [decoder decodeFloatForKey:  KeyTime     ];
            self.speed      = [decoder decodeFloatForKey:  KeySpeed    ];
        }
        return self;
    }

    - (void) encodeWithCoder: (NSCoder *) encoder {
        [encoder encodeObject: self.locations forKey: KeyLocations];
        [encoder encodeFloat:  self.length    forKey: KeyLength   ];
        [encoder encodeFloat:  self.time      forKey: KeyTime     ];
        [encoder encodeFloat:  self.speed     forKey: KeySpeed    ];
    }

@end