//
//  YJYYShakeAnimation.m
//  YJYYShakeAnimation
//
//  Created by 遇见远洋 on 16/7/26.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "YJYYShakeAnimation.h"


@interface YJYYShakeAnimation  ()
@property (weak, nonatomic) IBOutlet UITextField *userNameT;

@property (weak, nonatomic) IBOutlet UITextField *passwordT;

@end

@implementation YJYYShakeAnimation

+ (instancetype)ShakeAnimationView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}
- (IBAction)login:(id)sender {
    if (![self.userNameT hasText]) {
        [self shakeActionWithTextField:self.userNameT];
    }else if (!self.passwordT.hasText) {
        [self shakeActionWithTextField:self.passwordT];
    }
}


/**
 *  账户名为空或者密码为空时的抖动动画
 *
 *  @param textField 用户名输入框/密码输入框
 */
- (void)shakeActionWithTextField:(UITextField *)textField
{
    // 晃动次数
    static int numberOfShakes = 4;
    // 晃动幅度（相对于总宽度）
    static float vigourOfShake = 0.01f;
    // 晃动延续时常（秒）
    static float durationOfShake = 0.5f;
    //抖动动画
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CGRect frame = textField.frame;
    // 创建路径
    CGMutablePathRef shakePath = CGPathCreateMutable();
    // 起始点
    CGPathMoveToPoint(shakePath, NULL, CGRectGetMidX(frame), CGRectGetMidY(frame));
    for (int index = 0; index < numberOfShakes; index++)
    {
        // 添加晃动路径 幅度由大变小
        CGPathAddLineToPoint(shakePath, NULL, CGRectGetMidX(frame) - frame.size.width * vigourOfShake*(1-(float)index/numberOfShakes),CGRectGetMidY(frame));
        CGPathAddLineToPoint(shakePath, NULL,  CGRectGetMidX(frame) + frame.size.width * vigourOfShake*(1-(float)index/numberOfShakes),CGRectGetMidY(frame));
    }
    // 闭合
    CGPathCloseSubpath(shakePath);
    shakeAnimation.path = shakePath;
    shakeAnimation.duration = durationOfShake;
    // 释放
    CFRelease(shakePath);
    //添加动画到输入框layer上--- bingo---
    [textField.layer addAnimation:shakeAnimation forKey:kCATransition];
}

@end
