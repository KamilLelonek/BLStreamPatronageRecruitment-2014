//
//  StorageHelper.h
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"

@interface StorageHelper : NSObject

typedef BOOL      (^DataWriter) (UserData *);
typedef UserData* (^DataReader) (void);

- (DataReader) readData;
- (DataWriter) writeData;
- (NSString*)  filePath;

+ (StorageHelper *) sharedStorageHelper;

@end