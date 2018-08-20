//
//  TableView.h
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface TableView : UITableView

@property (nonatomic, copy) NSArray<Message *> *messages;

@end
