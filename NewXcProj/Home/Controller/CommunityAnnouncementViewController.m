//
//  CommunityAnnouncementViewController.m
//  XcProject
//
//  Created by xhm on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "CommunityAnnouncementViewController.h"

@interface CommunityAnnouncementViewController ()

@end

@implementation CommunityAnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"还没有新的小区公告哦!";
    [self showNoDataView:YES title:str];
    // Do any additional setup after loading the view.
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
