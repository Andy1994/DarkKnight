//
//  ViewController+Insert.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/16.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "ViewController+Insert.h"

@implementation ViewController (Insert)

- (void)insert {
    [self insertUser];
    [self insertMessage];
}

- (void)insertUser {
    [[FMDBManager sharedInstance].databaseQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        for (int i = 1; i < 10; i++) {
            [db executeUpdate:@"INSERT INTO USER('userId', 'name') VALUES (?, ?);", @(i), [NSString stringWithFormat:@"User %d",i]];
        }
    }];
}

- (void)insertMessage {
    [[FMDBManager sharedInstance].databaseQueue inTransaction:^(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback) {
        for (int i = 1; i < 10000; i++) {
            [db executeUpdate:
              @"INSERT INTO Message('userId', 'otherUserId', 'content', 'time')"\
              "VALUES ("\
              "(SELECT userId FROM USER ORDER BY RANDOM() limit 1),"\
              "(SELECT userId FROM USER ORDER BY RANDOM() limit 1),"\
              "?,"\
              "?"\
              ");",[NSString stringWithFormat:@"Content %d",i],@([[NSDate date] timeIntervalSince1970] + 10 * i)] ;
        }
    }];
}

@end
