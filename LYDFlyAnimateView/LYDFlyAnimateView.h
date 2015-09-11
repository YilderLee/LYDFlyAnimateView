//
//  LYDFlyAnimateView.h
//  
//
//  Created by yons on 15/9/9.
//  Copyright (c) 2015年 iron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYDFlyAnimateView : UIView
//动画持续时间，默认0.5秒
@property (nonatomic, assign) NSTimeInterval duration;
//如果你的控件是在某个控件的子控件，请注意用- (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;来将控件坐标转成控制器的view的坐标
+ (instancetype)flyAnimateFromRect:(CGRect)fromRect toRect:(CGRect)toRect withImage:(UIImage *)animateImage;
//调用该方法让动画显示在界面上
- (void)show;

@end
