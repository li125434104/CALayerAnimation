//
//  ActivityIndicatorView.h
//  CALayerAnimation
//
//  Created by LXJ on 15/9/18.
//  Copyright © 2015年 GOME. All rights reserved.
//

/**
    转圈小圆点Layer动画
*/
#import <UIKit/UIKit.h>

@interface ActivityIndicatorView : UIView

@property (nonatomic ,strong) CAReplicatorLayer *replicatorLayer;

+ (ActivityIndicatorView *)showActivityIndicator;

@end
