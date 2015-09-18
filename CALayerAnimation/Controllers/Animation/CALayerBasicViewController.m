//
//  CALayerBasicViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/10.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "CALayerBasicViewController.h"

@interface CALayerBasicViewController ()

@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

@property (strong, nonatomic) CALayer *blueLayer;

@end

@implementation CALayerBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customView.layer.borderWidth = 5;
    self.customView.layer.borderColor = [UIColor greenColor].CGColor;
    self.customView.layer.cornerRadius = 10;
//    self.customView.layer.masksToBounds = YES;//裁剪图片，使之没有边缘角,但是有这句不会有阴影效果
//    self.customView.layer.contents = (__bridge id)([UIImage imageNamed:@"Image"].CGImage);
    
    //设置customView的阴影
    [self setShadow];
    
    [self image];
    
    //创建layer
    [self setLayer];
}

- (void)setShadow {
    self.customView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.customView.layer.shadowOffset = CGSizeMake(15, 5);
    self.customView.layer.shadowRadius = 5;
    self.customView.layer.shadowOpacity = 0.6;
}

- (void)image {
    self.customImageView.layer.cornerRadius = 10;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.customImageView.transform = CGAffineTransformMakeTranslation(0, 100);
//    self.customImageView.layer.transform = CATransform3DMakeTranslation(100, 20, 0);
    
    //通过kvc来设置
//    NSValue *v = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 20, 0)];
//    [self.customImageView.layer setValue:v forKeyPath:@"transform"];
//    [self.customImageView.layer setValue:@(-100) forKeyPath:@"transform.translation.x"];//-100是x方向向左移动100

    //旋转
    self.customImageView.layer.transform =CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    
    self.blueLayer.bounds = CGRectMake(0, 0, 150, 50);
    self.blueLayer.backgroundColor = [UIColor redColor].CGColor;
}

- (void)setLayer {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 64);
    layer.anchorPoint = CGPointMake(1, 0);
    //设置圆角半径为10
    layer.cornerRadius=10;
    //如果设置了图片，那么需要设置这个属性为YES才能显示圆角效果
    layer.masksToBounds=YES;
    //设置边框
    layer.borderWidth=3;
    layer.borderColor=[UIColor brownColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.blueLayer = layer;
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
