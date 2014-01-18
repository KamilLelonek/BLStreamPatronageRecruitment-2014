//
//  UserData.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject <NSCoding>
    @property (atomic) NSMutableArray *locations;
    @property (atomic) float length;
    @property (atomic) float time;
    @property (atomic) float speed;
@end