//
//  ViewController.m
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "XCTabBar.h"
#import "CommunityViewController.h"
#import "ProfileViewController.h"
@interface ViewController ()<XCTabBarDelegate>
@property (nonatomic, weak) XCTabBar *customTabBar;
@property(nonatomic,weak)HomeViewController*homeVC;
@property(nonatomic,weak)ProfileViewController*ProfileVC;
@property(nonatomic,weak)CommunityViewController*CommunityVC;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 移除系统自动产生的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        // 私有API  UITabBarButton
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
#pragma mark - 初始化方法
- (XCTabBar *)customTabBar
{
    if (!_customTabBar) {
        XCTabBar *customTabBar = [[XCTabBar alloc] init];
        customTabBar.frame = self.tabBar.bounds;
        customTabBar.delegate = self;
        [self.tabBar addSubview:customTabBar];
        self.customTabBar = customTabBar;
    }
    return _customTabBar;
}
#pragma mark init方法内部调用

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self setupAllChildVCs];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSLog(@"lalallaala");
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 初始化自己的所有子控制器
- (void)setupAllChildVCs
{
    // 新橙社
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setupOneChildVC:home title:@"新橙社" imageName:@"homepage_normal" selectedImageName:@"homepage_selected"];
    self.homeVC = home;
    //
    //橙社区
    CommunityViewController*message = [[CommunityViewController alloc] init];
    //    message.view;
    [self setupOneChildVC:message title:@"橙社区" imageName:@"community_normal" selectedImageName:@"community_selected"];
    self.CommunityVC = message;
    //我的
    ProfileViewController*profile=[[ProfileViewController alloc]init];
    [self setupOneChildVC:profile title:@"我" imageName:@"mine_normal" selectedImageName:@"mine_selected"];
    self.ProfileVC=profile;
    
    
    
}
#pragma mark 初始化一个子控制器

- (void)setupOneChildVC:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    child.title = title;
    
    child.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (IOS7)
    { // 如果是iOS7, 不需要渲染图片
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    child.tabBarItem.selectedImage = selectedImage;
    
    
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:child];
    
    
    
    [self addChildViewController:child];
    
    [self.customTabBar addTabBarButton:child.tabBarItem];
}
#pragma mark -XCTabBarDelegate
- (void)tabBar:(XCTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to
{
    switch (to) {
        case 0:
        {
            self.title = @"新橙社";
            self.navigationItem.leftBarButtonItem = nil;
            self.navigationItem.rightBarButtonItem = nil;
        }
            break;
        case 1:
        {
            self.title = @"橙社区";
            
        }
            break;
        case 2:
        {
            self.title = @"我";
            
        }
            break;
        default:
            break;
    }
    self.selectedIndex = to;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
