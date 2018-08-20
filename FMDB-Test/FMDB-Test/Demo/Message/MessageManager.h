//
//  MessageManager.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Message;

@interface MessageManager : NSObject

+ (instancetype)sharedInstance;

+ (void)loadMessages:(void(^)(NSArray<Message *> *))block;

@end
