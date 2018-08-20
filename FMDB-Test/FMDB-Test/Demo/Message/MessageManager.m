//
//  MessageManager.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "MessageManager.h"
#import "User.h"
#import "Message.h"

@implementation MessageManager

+ (instancetype)sharedInstance {
    static MessageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MessageManager alloc] init];
    });
    return manager;
}

+ (void)loadMessages:(void(^)(NSArray<Message *> *))block {
    FMDatabaseQueue *databaseQueue = [FMDBManager sharedInstance].databaseQueue;
    [databaseQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        NSMutableArray<Message *> *messages = [[NSMutableArray alloc] init];
        FMResultSet *resultSet = [db executeQuery:
                                  @"SELECT * FROM Message "\
                                  "WHERE userId = 1 AND otherUserId != 1 "\
                                  "GROUP BY otherUserId "\
                                  "ORDER BY time DESC;"];
        while ([resultSet next]) {
            [messages addObject:[Message objectWithResultSet:resultSet database:db]];
        }
        
        if (block) {
            block([messages copy]);
        }
    }];
}


@end
