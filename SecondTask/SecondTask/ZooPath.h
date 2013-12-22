//
//  ZooPath.h
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const NAME   = @"name";
static NSString* const TIME   = @"time";
static NSString* const LENGTH = @"length";
static NSString* const RATING = @"rating";

@interface ZooPath : NSObject {
    @private NSMutableDictionary *zooPathDictionary;
}

@property (nonatomic) NSString  *name;
@property (nonatomic) NSNumber  *time;
@property (nonatomic) NSNumber  *length;
@property (nonatomic) NSNumber  *rating;

- (id) initWithName:      (NSString*)aName andTime: (NSNumber*)aTime andLength: (NSNumber*)aLength andRating: (NSNumber*)aRating;
+ (id) zooPathWithName:   (NSString*)aName andTime: (NSNumber*)aTime andLength: (NSNumber*)aLength andRating: (NSNumber*)aRating;

- (NSString *) description;

@end