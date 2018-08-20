//
//  Message.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet {
    return [self objectWithResultSet:resultSet database:[FMDBManager sharedInstance].database];
}

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet database:(FMDatabase *)database; {
    Message *message = [[Message alloc] init];
    message.userId = [resultSet intForColumn:@"userId"];
    message.otherUserId = [resultSet intForColumn:@"otherUserId"];
    message.content = [resultSet stringForColumn:@"content"];
    message.time = [NSDate dateWithTimeIntervalSince1970:[resultSet doubleForColumn:@"time"]];
    
    FMResultSet *userResultSet = [database executeQuery:@"SELECT * FROM User WHERE userId = ?;",@(message.userId)];
    if ([userResultSet next]) {
        message.user = [User objectWithResultSet:userResultSet];
    }

    FMResultSet *otherUserResultSet = [database executeQuery:@"SELECT * FROM User WHERE userId = ?;",@(message.otherUserId)];
    if ([otherUserResultSet next]) {
        message.otherUser = [User objectWithResultSet:otherUserResultSet];
    }
    
    return message;
}

@end
