//
//  CALayerCustomViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/14.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "CALayerCustomViewController.h"
#import "LXJLayer.h"

@interface CALayerCustomViewController ()

@end

@implementation CALayerCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self customLayer];
    
    [self delegateLayer];
}

- (void)customLayer {
    LXJLayer *layer = [LXJLayer layer];
    //2.设置layer的属性
    layer.backgroundColor=[UIColor yellowColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.position=CGPointMake(100, 100);
    layer.cornerRadius=20;
    layer.shadowColor=[UIColor blackColor].CGColor;
    layer.shadowOffset=CGSizeMake(10, 20);
    layer.shadowOpacity=0.6;
    
    //在自定义layer中的-(void)drawInContext:方法不会自己调用，只能自己通过setNeedDisplay方法调用，在view中画东西DrawRect:方法在view第一次显示的时候会自动调用
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}

- (void)delegateLayer {
    CALayer *layer = [CALayer layer];
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.delegate = self;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}

//CALayer的delegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextFillPath(ctx);
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
