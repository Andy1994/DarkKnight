//
//  TableView.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/8/20.
//  Copyright © 2018 wangwenbo. All rights reserved.
//

#import "TableView.h"
#import "TableViewCell.h"

#define TableViewCellIdentifier @"TableViewCellIdentifier"

@interface TableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableView

- (instancetype)init {
    if (self = [super initWithFrame:CGRectMake(0, 0, ScreenWith, ScreenHeight)]) {
        self.rowHeight = 50;
        self.dataSource = self;
        self.delegate = self;
        self.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        [self registerClass:[TableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    }
    return self;
}

- (void)setMessages:(NSArray<Message *> *)messages {
    _messages = messages;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    cell.message = self.messages[indexPath.row];
    return cell;
}

@end
