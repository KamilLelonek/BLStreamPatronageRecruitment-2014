//
//  Location.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
    @property (atomic) NSInteger x;
    @property (atomic) NSInteger y;
    @property (atomic) NSDate    *date;

    - (id) initWithX: (NSInteger) x andY: (NSInteger) y andDate: (NSDate*) date;
@end