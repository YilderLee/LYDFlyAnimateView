//
//  LYDButton.m
//  
//
//  Created by yons on 15-9-8.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import "LYDButton.h"

@interface LYDButton ()

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIButton *badgeBtn;

@end

@implementation LYDButton

- (void)setBadgeValue:(NSInteger)badgeValue
{
    if (badgeValue >= 0) {
        _badgeValue = badgeValue;
    }
    if (_badgeValue > 0) {
        _badgeBtn.backgroundColor = [UIColor redColor];
        [_badgeBtn setTitle:[NSString stringWithFormat:@"%zd",_badgeValue] forState:UIControlStateNormal];
    }
    else if (_badgeValue == 0)
    {
        _badgeBtn.backgroundColor = [UIColor clearColor];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor whiteColor];
    _btn.enabled = NO;
    [self addSubview:_btn];
    
    _badgeBtn = [[UIButton alloc] init];
    _badgeBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    _badgeBtn.backgroundColor = [UIColor clearColor];
    _badgeBtn.enabled = NO;
    [self addSubview:_badgeBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _btn.frame = CGRectMake(self.bounds.origin.x + 5, self.bounds.origin.y + 5, self.frame.size.width - 10, self.frame.size.height - 10);
    
    _badgeBtn.frame = CGRectMake(self.frame.size.width - 20, 0, 20, 20);
    _badgeBtn.layer.cornerRadius = 10.0;
}

@end
