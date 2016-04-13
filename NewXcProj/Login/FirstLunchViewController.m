//
//  FirstLunchViewController.m
//  newProject
//
//  Created by xhm on 16/3/31.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "FirstLunchViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "WZGuideViewController.h"
//#import "XMNavigationViewController.h"
@interface FirstLunchViewController ()

@end

@implementation FirstLunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(exitLoadingVC:) withObject:self afterDelay:0];
}
-(void)exitLoadingVC:(id)params
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        //跳到启动页
        [WZGuideViewController show];
    }
    else
    {
        //跳到登录
        LoginViewController *login = [[LoginViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
        AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
        app.window.rootViewController = nav;

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
