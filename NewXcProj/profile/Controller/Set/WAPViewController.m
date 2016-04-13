//
//  WAPViewController.m
//  XcProject
//
//  Created by xhm on 16/4/13.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "WAPViewController.h"

@interface WAPViewController ()
{
    UIButton*_rightNavbtn;
}
@end

@implementation WAPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"意见反馈";
    _rightNavbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightNavbtn setTitle:@"发送" forState:UIControlStateNormal];
    
    [_rightNavbtn setTitleColor:UIColorFromRGB(0x333333, 1) forState:UIControlStateNormal];
    [_rightNavbtn setTitleColor:UIColorFromRGB(0x333333, 1) forState:UIControlStateSelected];
    [_rightNavbtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    _rightNavbtn.frame = CGRectMake(0, 0, 40, 40);
    
    _rightNavbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    
    [_rightNavbtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:_rightNavbtn];
    
    backBarItem.title = @"";
    
    self.navigationItem.rightBarButtonItem = backBarItem;
    // Do any additional setup after loading the view.
}
-(void)navBtnClick:(UIButton*)btn
{
    
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
