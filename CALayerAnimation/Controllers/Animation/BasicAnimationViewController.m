//
//  BasicAnimationViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/15.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()

@property (nonatomic ,strong) CALayer *layer;

@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ShowLayer];
}

- (void)ShowLayer {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position  = CGPointMake(100, 100);
    layer.bounds = CGRectMake(0, 0, 50, 80);
    layer.cornerRadius = 10.f;
    layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

//平移
- (IBAction)moveBtnClick:(UIButton *)sender {
    
    CABasicAnimation *anima = [CABasicAnimation animation];
    //1.1告诉系统要执行什么样的动画
    anima.keyPath = @"position";
    //设置通过动画，将layer从哪儿移动到哪儿
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    anima.duration = 2.f;
    //1.2设置动画执行完毕之后不删除动画
    anima.removedOnCompletion = NO;
    //1.3设置保存动画的最新状态,即动画执行完后保持在最后的位置
    anima.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anima forKey:nil];
}

//缩放
- (IBAction)scaleBtnClick:(UIButton *)sender {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anima.duration = 2.f;
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anima forKey:nil];
}

//旋转
- (IBAction)rotationBtnClick:(UIButton *)sender {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima.duration = 2.f;
    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anima forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始执行动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
