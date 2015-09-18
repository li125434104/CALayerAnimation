//
//  KeyAnimationViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/16.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "KeyAnimationViewController.h"

#define angle2Radian(angle)  ((angle)/180.0*M_PI)

@interface KeyAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *customView;

@end

@implementation KeyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)keyAnimaiton:(UIButton *)sender {
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    keyAnima.values = @[value1, value2, value3, value4, value5];
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    keyAnima.duration = 4.f;
    [self.customView.layer addAnimation:keyAnima forKey:nil];
}

- (IBAction)keyPathAnimation:(UIButton *)sender {
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //创建一条路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置一个圆的路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(100, 100, 100, 100));
    keyAnima.path = path;
    //有create就要有release
    CGPathRelease(path);
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 5.f;
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.customView.layer addAnimation:keyAnima forKey:@"keyPathAnima"];
}

//停止动画
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.customView.layer removeAnimationForKey:@"keyPathAnima"];
}

//抖动动画
- (IBAction)shakeAnimation:(UIButton *)sender {
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    //设置抖动弧度
    keyAnimation.values = @[@(-angle2Radian(4)), @(angle2Radian(4)), @(-angle2Radian(4))];
    keyAnimation.duration = .3f;
    //重复次数为最大值
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.removedOnCompletion = NO;
    [self.customView.layer addAnimation:keyAnimation forKey:nil];
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
