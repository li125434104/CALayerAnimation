//
//  ViewController.m
//  CALayerAnimation
//
//  Created by LXJ on 15/9/10.
//  Copyright (c) 2015年 GOME. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"

static NSString *kCellIdentifier = @"MainTableViewCell";

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSArray array];
    
    self.dataArray = @[@"CALayer简介", @"自定义CALayer", @"基础动画", @"关键帧动画", @"CAShapeLayer动画", @"CAReplicator动画"];
    
    [self.mainTableView registerNib:[UINib nibWithNibName:kCellIdentifier bundle:nil] forCellReuseIdentifier:kCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.titleLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    switch (row) {
        case 0:
            [self performSegueWithIdentifier:@"goToCALayer" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"toToCustomCALayer" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"goToBasicAnimation" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"goToKeyAnimation" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"goToShapeLayer" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"goToReplicatorLayer" sender:self];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
