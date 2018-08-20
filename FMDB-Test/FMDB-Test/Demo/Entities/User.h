//
//  User.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : BaseObject

// 用户ID
@property (nonatomic, assign) NSInteger userId;
// 用户昵称
@property (nonatomic, copy) NSString *name;

@end
