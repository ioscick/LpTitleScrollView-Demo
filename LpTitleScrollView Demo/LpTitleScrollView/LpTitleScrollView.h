//
//  LpTitleScrollView.h
//  LpTitleScrollView Demo
//
//  Created by shenliping on 16/7/4.
//  Copyright © 2016年 shenliping. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^scrollBlock)(NSInteger);

@interface LpTitleScrollView : UIScrollView

@property (copy, nonatomic) NSArray *titleArray;

@property (strong, nonatomic) NSMutableArray *buttonArray;

@property (copy, nonatomic) scrollBlock block;

- (instancetype)initWithFrame:(CGRect)frame TitleArray:(NSArray *)titleArray;

@end
