//
//  StorageHelper.m
//  ThirdTask
//
//  Created by squixy on 18.01.2014.
//  Copyright (c) 2014 squixy. All rights reserved.
//

#import "StorageHelper.h"

static StorageHelper *storageHelper;
static NSException   *directoryNotFoundException;
static NSString      *filePath;

@implementation StorageHelper
    #define FileName     @"user_data.bls"

    + (id) sharedStorageHelper {
        @synchronized(self) {
            if (!storageHelper) {
                storageHelper = [[self alloc] init];
            }
        }
        return storageHelper;
    }

    + (void) initialize {
        if (self == [StorageHelper class]) {
            directoryNotFoundException = [NSException
                                          exceptionWithName: @"DirectoryNotFoundException"
                                          reason:            @"Documents directory was not found within the system."
                                          userInfo: nil ];
            filePath = [self getFilePathForDocuments];
        }
    }

    + (NSString *) getFilePathForDocuments {
        BOOL expandTilde = YES;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, expandTilde);
        BOOL pathFound = paths && paths[0];
        
        if(pathFound) {
            NSString *documentsPath = paths[0];
            NSString *filePath = [documentsPath stringByAppendingPathComponent: FileName];
            return filePath;
        }
        @throw directoryNotFoundException;
    }

    - (DataReader) readData {
        return ^{
            return [NSKeyedUnarchiver unarchiveObjectWithFile: filePath];
        };
    }

    - (DataWriter) writeData {
        return ^(UserData* userData) {
            return [NSKeyedArchiver archiveRootObject: userData toFile: filePath];
        };
    }

    - (NSString*) filePath { return filePath; }

@end