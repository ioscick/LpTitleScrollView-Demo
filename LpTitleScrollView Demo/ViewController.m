//
//  ViewController.m
//  LpTitleScrollView Demo
//
//  Created by shenliping on 16/7/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "ViewController.h"
#import "LpTitleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LpTitleScrollView *scrollView = [[LpTitleScrollView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40) TitleArray:@[@"健康", @"游戏", @"娱乐的说", @"哈哈哈", @"小标题好么", @"标题", @"对的呢", @"康忙", @"思密达", @"综艺", @"节目", @"标题"]];
    [self.view addSubview:scrollView];
    scrollView.block =^(NSInteger tag){
        NSLog(@"%d",tag);
    };
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
