//
//  FMDBManager.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/16.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBManager : NSObject

@property (nonatomic, strong, readonly) FMDatabase *database;
@property (nonatomic, strong, readonly) FMDatabaseQueue *databaseQueue;

+ (instancetype)sharedInstance;

@end
