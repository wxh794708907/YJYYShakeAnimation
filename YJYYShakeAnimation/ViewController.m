//
//  ViewController.m
//  YJYYShakeAnimation
//
//  Created by 遇见远洋 on 16/7/26.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "ViewController.h"
#import "YJYYShakeAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YJYYShakeAnimation * shakeView = [YJYYShakeAnimation ShakeAnimationView];
    shakeView.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:shakeView];
}

@end
