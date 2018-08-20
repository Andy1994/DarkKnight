//
//  ViewController.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/4/4.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+Insert.h"
#import "TableView.h"

@interface ViewController ()

@property (nonatomic, strong) TableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self loadMessage];
}

- (void)loadMessage {
    NSLog(@"++++====StartLoadMessage:%f",[[NSDate date] timeIntervalSince1970]);
    [MessageManager loadMessages:^(NSArray<Message *> *messages) {
        self.tableView.messages = messages;
        NSLog(@"++++====FinishLoadMessage:%f",[[NSDate date] timeIntervalSince1970]);
    }];
}

- (TableView *)tableView {
    if (!_tableView) {
        _tableView = [[TableView alloc] init];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
