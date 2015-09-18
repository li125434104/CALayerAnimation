//
//  ReplicatorLayerViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/18.
//  Copyright © 2015年 GOME. All rights reserved.
//

#import "ReplicatorLayerViewController.h"
#import "ActivityIndicatorView.h"

@interface ReplicatorLayerViewController ()

@property (strong, nonatomic) ActivityIndicatorView *acInView;
@property (weak, nonatomic) IBOutlet UIView *musicView;
@property (strong, nonatomic) CAReplicatorLayer *musicLayer;

@end

@implementation ReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.acInView = [ActivityIndicatorView showActivityIndicator];
    self.acInView.frame = CGRectMake(100, 100, 80, 80);
    [self.view addSubview:self.acInView];
    
    //设置musicLayer
    [self showMusicLayer];
}

- (void)showMusicLayer {
    self.musicLayer = [CAReplicatorLayer layer];
    self.musicLayer.bounds = CGRectMake(self.musicView.frame.origin.x, self.musicView.frame.origin.y, self.musicView.frame.size.width, self.musicView.frame.size.height);
    self.musicLayer.anchorPoint = CGPointZero;
    [self.musicView.layer addSublayer:self.musicLayer];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 30, 90);
    layer.anchorPoint = CGPointZero;
    layer.position = CGPointMake(self.musicView.frame.origin.x + 10, self.musicView.frame.origin.y + 100);
    layer.cornerRadius = 2.f;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.musicLayer addSublayer:layer];
    
    CABasicAnimation *aniam = [CABasicAnimation animationWithKeyPath:@"position.y"];
    aniam.toValue = @(layer.position.y - 60);
    aniam.repeatCount = HUGE;
    aniam.duration = .7f;
    //自动回弹
    aniam.autoreverses = YES;
    [layer addAnimation:aniam forKey:nil];
    
    self.musicLayer.instanceCount = 6;
    //每个方块之间的间隔
    self.musicLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    //设置每个方块动画的间隔
    self.musicLayer.instanceDelay = 0.3;
    self.musicLayer.masksToBounds = YES;
    
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
