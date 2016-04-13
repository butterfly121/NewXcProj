//
//  XCTabBar.m
//  CommunityService
//
//  Created by zhangmm on 15/6/4.
//  Copyright (c) 2015年 lee. All rights reserved.
//

#import "XCTabBar.h"
#import "UIView+Extension.h"


@interface XCTabBar()
@property (nonatomic, weak) UIButton *plusButton;

@property (nonatomic, weak) XCTabBarButton *selectedTabBarButton;
@end
@implementation XCTabBar


- (NSMutableArray *)tabBarButtons
{
    if (!_tabBarButtons) {
        self.tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}



- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        [self setupBg];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/**
 *  添加一个选项卡按钮
 *
 *  @param item 选项卡按钮对应的模型数据(标题\图标\选中的图标)
 */
- (void)addTabBarButton:(UITabBarItem *)item
{
  
    XCTabBarButton *button = [[XCTabBarButton alloc] init];
    button.item = item;
    [button addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    button.tag = self.tabBarButtons.count;
    [self addSubview:button];
    
  
    [self.tabBarButtons addObject:button];
    
    // 默认让最前面的按钮选中
    if (self.tabBarButtons.count == 1) {
        [self tabBarButtonClick:button];
    }
    
    
}

/**
 *  点击选项卡按钮
 */
- (void)tabBarButtonClick:(XCTabBarButton *)button
{

    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        NSInteger from = self.selectedTabBarButton.tag;
        NSInteger to = button.tag;
        [self.delegate tabBar:self didSelectButtonFrom:from to:to];
    }
    
      self.selectedTabBarButton.selected = NO;
    button.selected = YES;
    self.selectedTabBarButton = button;
}

/**
 *  设置背景
 */
- (void)setupBg
{
    if (!IOS7) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    }
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
 
    [self setupTabBarButtonFrame];
}

/**
 *  设置选项卡按钮的位置和尺寸
 */
- (void)setupTabBarButtonFrame
{
    NSInteger count = self.tabBarButtons.count;
    CGFloat buttonW = self.width / (count);
    CGFloat buttonH = self.height;
    for (int i = 0; i < count; i++) {
        XCTabBarButton *button = self.tabBarButtons[i];
        button.width = buttonW;
        button.height = buttonH;
        button.x = buttonW * i;
        button.y = 0;
    }
}


@end

