//
//  Message.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Message : BaseObject

// 发送方ID
@property (nonatomic, assign) NSInteger userId;
// 发送方 User 对象
@property (nonatomic, strong) User *user;
// 接收方ID
@property (nonatomic, assign) NSInteger otherUserId;
// 接收方 User 对象
@property (nonatomic, strong) User *otherUser;
// 聊天内容
@property (nonatomic, copy) NSString *content;
// 时间
@property (nonatomic, strong) NSDate *time;

@end
