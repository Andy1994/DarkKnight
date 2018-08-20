//
//  FMDBManager.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/16.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "FMDBManager.h"

@interface FMDBManager ()

@property (nonatomic, strong, readwrite) FMDatabase *database;
@property (nonatomic, strong, readwrite) FMDatabaseQueue *databaseQueue;

@end

@implementation FMDBManager

+ (instancetype)sharedInstance {
    static FMDBManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FMDBManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        
        NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Database.sqlite"];
        NSLog(@"dbPath:%@",dbPath);
        
        _database = [FMDatabase databaseWithPath:dbPath];
        [_database open];
        [_database executeUpdate:@"PRAGMA foreign_keys = ON;"];
        [_database close];
        
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
        FMDBMigrationManager *manager = [FMDBMigrationManager managerWithDatabase:_database migrationsBundle:[NSBundle mainBundle]];
        
        BOOL resultState = NO;
        NSError *error = nil;
        if (!manager.hasMigrationsTable) {
            resultState = [manager createMigrationsTable:&error];
        }
        
        resultState = [manager migrateDatabaseToVersion:UINT64_MAX progress:nil error:&error];
        
        if (error) {
            NSLog(@"error:%@",error);
        }
    }
    return self;
}


@end
