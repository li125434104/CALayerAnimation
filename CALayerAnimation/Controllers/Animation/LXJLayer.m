//
//  LXJLayer.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/14.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "LXJLayer.h"

@implementation LXJLayer

//重写该方法，在该方法内绘制图形
- (void)drawInContext:(CGContextRef)ctx {
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextFillPath(ctx);
}

@end
