//
//  LpButton.m
//  LpTitleScrollView Demo
//
//  Created by shenliping on 16/7/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import "LpButton.h"

@implementation LpButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    if (self.selected) {
        self.titleLabel.font = [UIFont systemFontOfSize:20];
    }else{
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
