//
//  FMDBCreateMigrating.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/16.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "FMDBCreateMigrating.h"

@implementation FMDBCreateMigrating

- (NSString *)name {
    return @"FMDBCreateMigrating";
}

- (uint64_t)version {
    return 0.1;
}

- (BOOL)migrateDatabase:(FMDatabase *)database error:(out NSError *__autoreleasing *)error {
    
    BOOL result = YES;
    
    result = [database executeUpdate:
     @"CREATE TABLE IF NOT EXISTS User (" \
     "userId INT PRIMARY KEY NOT NULL UNIQUE," \
     "name TEXT NOT NULL" \
     ");"];
    
    if (!result) {
        *error = [database lastError];
        return result;
    }
    
    result = [database executeUpdate:
     @"CREATE TABLE IF NOT EXISTS Message (" \
     "id INT PRIMARY KEY NOT NULL," \
     "userId INT," \
     "otherUserId INT," \
     "content TEXT," \
     "time TIMESTAMP," \
     "FOREIGN KEY(userId, otherUserId) REFERENCES User(userId, userId)" \
     ");"];
    
    if (!result) {
        *error = [database lastError];
        return result;
    }
    
    return result;
}

@end
