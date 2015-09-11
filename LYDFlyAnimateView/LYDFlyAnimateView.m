//
//  LYDFlyAnimateView.m
//  
//
//  Created by yons on 15/9/9.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import "LYDFlyAnimateView.h"

@interface LYDFlyAnimateView ()

@property (nonatomic, assign) CGRect fromRect;

@property (nonatomic, assign) CGRect toRect;

@property (nonatomic, strong) UIImage *animateImage;

@property (nonatomic, strong) UIImageView *animateImageView;

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic, assign) CGFloat speed;

@property (nonatomic, assign) CGFloat g;

@property (nonatomic, assign) CGFloat startX;

@property (nonatomic, assign) CGFloat startY;

@property (nonatomic, assign) CGFloat totalTime;

@end

@implementation LYDFlyAnimateView

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:0.01f target:self selector:@selector(updateFrame) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

+ (instancetype)flyAnimateFromRect:(CGRect)fromRect toRect:(CGRect)toRect withImage:(UIImage *)animateImage
{
    LYDFlyAnimateView *animateView = [[LYDFlyAnimateView alloc] init];
    animateView.fromRect = fromRect;
    animateView.toRect = toRect;
    animateView.animateImage = animateImage;
    return animateView;
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
    _animateImageView = [[UIImageView alloc] init];
    [self addSubview:_animateImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _animateImageView.frame = self.bounds;
}
/*
 1.水平方向速度：Vx＝Vo 2.竖直方向速度：Vy＝gt
 3.水平方向位移：x＝Vot 4.竖直方向位移：y＝gt2/2
*/
- (void)show
{
    _animateImageView.image = _animateImage;
    // 获得主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat selfWidth = _animateImage.size.width;
    CGFloat selfHeight = _animateImage.size.height;
    CGFloat endX = _toRect.origin.x;
    CGFloat endY = _toRect.origin.y;
    _startX = _fromRect.origin.x;
    _startY = _fromRect.origin.y;
    
    if (_duration == 0.0) {
        _duration = 0.5;
    }
    _speed = (_startX - endX) / _duration;
    _g = (endY - _startY) * 2 / (_duration * _duration);
    
    self.frame = CGRectMake(_startX, _startY, selfWidth, selfHeight);
    [window addSubview:self];

    [self.timer fire];
}

- (void)updateFrame
{
    _totalTime += 0.01;
    CGFloat currentX = _startX - _speed * _totalTime;
    CGFloat currentY = _startY + _g * _totalTime * _totalTime * 0.5;
    self.frame = CGRectMake(currentX , currentY, _animateImage.size.width, _animateImage.size.height);
    if (_totalTime >= _duration) {
        [_timer invalidate];
        _timer = nil;
        [self removeFromSuperview];
    }
}

@end
