//
//  ZooPath.h
//  SecondTask
//
//  Created by squixy on 22.12.2013.
//  Copyright (c) 2013 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZooPath : NSObject {
@private NSMutableDictionary *zooPathDictionary;
}

@property (nonatomic) NSString  *name;
@property (nonatomic) NSString  *time;
@property (nonatomic) NSString  *length;
@property (nonatomic) NSNumber  *rating;

- (id) initWithName:      (NSString*)aName andTime: (NSString*)aTime andLength: (NSString*)aLength andRating: (NSNumber*)aRating;
+ (id) zooPathWithName:   (NSString*)aName andTime: (NSString*)aTime andLength: (NSString*)aLength andRating: (NSNumber*)aRating;

- (NSString *) description;

@end