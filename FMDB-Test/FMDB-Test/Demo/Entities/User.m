//
//  User.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet {
    User *user = [[User alloc] init];
    user.userId = [resultSet intForColumn:@"userId"];
    user.name = [resultSet stringForColumn:@"name"];
    return user;
}

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet database:(FMDatabase *)database; {
    return [self objectWithResultSet:resultSet];
}

@end
