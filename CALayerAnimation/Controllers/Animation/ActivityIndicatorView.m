//
//  ActivityIndicatorView.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/18.
//  Copyright © 2015年 GOME. All rights reserved.
//

#import "ActivityIndicatorView.h"

#define LOAD_NIB(name) [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]

@implementation ActivityIndicatorView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self showLayer];
}

+ (ActivityIndicatorView *)showActivityIndicator {
    return LOAD_NIB(@"ActivityIndicatorView");
}

//ReplicatorLayer的绘制
- (void)showLayer {
    //设置replicatorLayer
    self.replicatorLayer = [CAReplicatorLayer layer];
    self.replicatorLayer.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.replicatorLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self.layer addSublayer:self.replicatorLayer];
 
    //设置小圆点一个
    CALayer *layer= [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 30);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.cornerRadius = 5;
    [self.replicatorLayer addSublayer:layer];
    
    //复制15个小圆点
    //下面就来看看如何使用CAReplicatorLayer复制子Layer，并让子Layer形成一个圆形,首先对子Layer，也就是白色圆形复制了15份。然后将360°除以15份，算出每一个圆形针对它前一个圆形应该偏移的角度。最后我们用到了CATransform3DMakeRotation，它同样是CATransform3D的一个结构，含义是使Layer在X、Y、Z轴根据给定的角度旋转。这样我们复制的15份圆形就会按照我们计算的角度排列，并形成一个大圆
    self.replicatorLayer.instanceCount = 15;
    CGFloat angle = (2 * M_PI) / 15;
    self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);

    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnima.duration = 1.f;
    scaleAnima.fromValue = @(1.f);
    scaleAnima.toValue = @(0.1f);
    scaleAnima.repeatCount = HUGE;
    [layer addAnimation:scaleAnima forKey:nil];
    
    //1秒除以15个，这样就每个小圆点有个延迟的效果,1/15不行，必须1.0/15
    self.replicatorLayer.instanceDelay = 1.0/15;

    layer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
}

@end
