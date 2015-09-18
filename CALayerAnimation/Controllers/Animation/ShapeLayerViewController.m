//
//  ShapeLayerViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/17.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "ShapeLayerViewController.h"

@interface ShapeLayerViewController ()

@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *complexLoadingView;

@property (strong, nonatomic) CAShapeLayer *ovalShapeLayer;
@property (strong, nonatomic) CAShapeLayer *anotherOvalShapeLayer;

@end

@implementation ShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setShapeLayer];
    
    [self setAnotherShapeLayer];
}

- (void)setShapeLayer {
    self.ovalShapeLayer = [CAShapeLayer layer];
    //设置笔画的颜色
    self.ovalShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    //设置填充的颜色
    self.ovalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    //设置笔画的宽度
    self.ovalShapeLayer.lineWidth = 7;
    //设置圆的半径
    float ovalRadius = self.loadingView.frame.size.height/2*0.8;
    //设置路径
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.loadingView.frame.size.width/2 - ovalRadius, self.loadingView.frame.size.height/2 - ovalRadius, ovalRadius*2, ovalRadius*2)];
    self.ovalShapeLayer.path = circlePath.CGPath;
    //设置圆形结束的位置，0~1，为整个圆形的五分之二处
    self.ovalShapeLayer.strokeEnd = 0.4;
    //设置两头为圆形，不然是平的方形的
    self.ovalShapeLayer.lineCap = kCALineCapRound;
    [self.loadingView.layer addSublayer:self.ovalShapeLayer];
    
    //添加旋转动画
    [self addAnimation];
}

- (void)addAnimation {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.duration = 2.f;
    anima.repeatCount = HUGE;
    anima.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
//    anima.removedOnCompletion = NO;
//    anima.fillMode = kCAFillModeForwards;
    [self.loadingView.layer addAnimation:anima forKey:nil];
}

- (void)setAnotherShapeLayer {
    self.anotherOvalShapeLayer = [CAShapeLayer layer];
    self.anotherOvalShapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.anotherOvalShapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.anotherOvalShapeLayer.lineWidth = 7;
    float ovalRadius = self.complexLoadingView.frame.size.height/2*0.8;
    self.anotherOvalShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.complexLoadingView.frame.size.width/2 - ovalRadius, self.complexLoadingView.frame.size.height/2 - ovalRadius, ovalRadius*2, ovalRadius*2)].CGPath;
    [self.complexLoadingView.layer addSublayer:self.anotherOvalShapeLayer];
    
    //添加动画组
    [self addAnotherAnimation];
}

- (void)addAnotherAnimation {
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @(-0.5f);
    strokeStartAnimation.toValue = @(1.0f);
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @(0.f);
    strokeEndAnimation.toValue = @(1.f);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.f;
    group.animations = [NSArray arrayWithObjects:strokeStartAnimation, strokeEndAnimation, nil];
    group.repeatCount = HUGE;
    
    [self.anotherOvalShapeLayer addAnimation:group forKey:nil];
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
