//
//  PropertyFeeViewController.m
//  XcProject
//
//  Created by Jason on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "PropertyFeeViewController.h"
#define KSeparatorLineColor ( UIColorFromRGB(0xd9d9d9, 1.0) )
@interface PropertyFeeViewController ()

@end

@implementation PropertyFeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = KSeparatorLineColor;
    self.bigLabel.text = @"";
    self.bigLabel.backgroundColor = [UIColor whiteColor];
    self.bigLabel.userInteractionEnabled = YES;
    self.topSmall.font = [UIFont systemFontOfSize:15];
    self.topSmall.text = @"上海总部大楼";
    self.bottomSmall.font = [UIFont systemFontOfSize:13];
    self.bottomSmall.textColor = [UIColor grayColor];
    self.bottomSmall.text = @"暂无地址";
    self.OtherLabel.textColor = [UIColor grayColor];
    self.OtherLabel.font = [UIFont systemFontOfSize:13];
    self.OtherLabel.text = @"设置住址后才能缴纳物业费";
    [self.NsButton setImage:[UIImage imageNamed:@"right _arrow"] forState:UIControlStateNormal];
    self.NsButton.backgroundColor = [UIColor clearColor];
    [self.NsButton addTarget:self action:@selector(Action) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Action)];
    [self.bigLabel addGestureRecognizer:tap];
}
- (void)Action
{
    NSLog(@"lllll");
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
