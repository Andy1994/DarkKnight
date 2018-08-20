//
//  BaseObject.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet;

+ (instancetype)objectWithResultSet:(FMResultSet *)resultSet database:(FMDatabase *)database;

@end
