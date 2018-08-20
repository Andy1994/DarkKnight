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
    
    BOOL result;
    
    result = [database executeUpdate:
     @"CREATE TABLE IF NOT EXISTS User (" \
     "userId INTEGER PRIMARY KEY NOT NULL UNIQUE," \
     "name TEXT NOT NULL" \
     ");"];
    
    if (!result) {
        *error = [database lastError];
        return result;
    }
    
    result = [database executeUpdate:
     @"CREATE TABLE IF NOT EXISTS Message (" \
     "id INTEGER PRIMARY KEY AUTOINCREMENT," \
     "userId INTEGER," \
     "otherUserId INTEGER," \
     "content TEXT," \
     "time DATETIME," \
     "FOREIGN KEY(userId, otherUserId) REFERENCES User(userId, userId)" \
     ");"];
    
    if (!result) {
        *error = [database lastError];
        return result;
    }
    
    return result;
}

@end
