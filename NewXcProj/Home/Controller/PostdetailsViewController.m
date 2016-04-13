//
//  PostdetailsViewController.m
//  XcProject
//
//  Created by xhm on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "PostdetailsViewController.h"

@interface PostdetailsViewController ()

@end

@implementation PostdetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"帖子详情";
    NSString*str=@"暂无帖子详情";
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
