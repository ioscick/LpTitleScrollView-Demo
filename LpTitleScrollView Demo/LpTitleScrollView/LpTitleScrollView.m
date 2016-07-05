//
//  LpTitleScrollView.m
//  LpTitleScrollView Demo
//
//  Created by shenliping on 16/7/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "LpTitleScrollView.h"
#import "LpButton.h"

@interface LpTitleScrollView ()<UIScrollViewDelegate>

@end

@implementation LpTitleScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:197/255.0 green:197/255.0 blue:197/255.0 alpha:1];
        self.delegate = self;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray{
    if (self = [self initWithFrame:frame]) {
        self.titleArray = titleArray;
        CGFloat buttonX = 0;
        CGFloat buttonTag = 0;
        for (NSString *title in self.titleArray) {
            LpButton *button = [[LpButton alloc] initWithFrame:CGRectMake(buttonX, 5, [self getWidthOfString:title] + 10, 30)];
            [button setTitle:title forState:UIControlStateNormal];
            button.tag = buttonTag;
            if (buttonTag == 0) {
                button.selected = YES;
            }
            [self addSubview:button];
            [button addTarget:self action:@selector(buttonChoosed:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.buttonArray addObject:button];
            buttonX += [self getWidthOfString:title] + 10;
            buttonTag++;
        }
        self.contentSize = CGSizeMake(buttonX, 0);
    }
    return self;
}

- (void)buttonChoosed:(LpButton *)sender{
    for (LpButton *buttond in _buttonArray) {
        if (buttond.tag == sender.tag) {
            buttond.selected = YES;
        }else{
            buttond.selected = NO;
        }
    }
    if (sender.frame.origin.x + sender.frame.size.width / 2 > self.center.x && sender.frame.origin.x + sender.frame.size.width / 2 < self.contentSize.width - self.center.x) {
        [self setContentOffset:CGPointMake(sender.center.x - self.center.x, 0) animated:YES];
    }else if (sender.frame.origin.x + sender.frame.size.width / 2 <= self.center.x){
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }else{
        [self setContentOffset:CGPointMake(self.contentSize.width - self.frame.size.width, 0) animated:YES];
    }
    self.block(sender.tag);
}

- (CGFloat)getWidthOfString:(NSString *)str{
    return [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 20.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20.0f]} context:nil].size.width;
}


- (NSMutableArray *)buttonArray{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _buttonArray;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
