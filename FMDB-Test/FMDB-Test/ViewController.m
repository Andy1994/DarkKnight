//
//  ViewController.m
//  FMDB-Test
//
//  Created by wangwenbo on 2018/4/4.
//  Copyright © 2018年 wangwenbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FMDBManager sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
