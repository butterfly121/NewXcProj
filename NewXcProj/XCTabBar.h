//
//  XCTabBar.h
//  CommunityService
//
//  Created by zhangmm on 15/6/4.
//  Copyright (c) 2015年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCTabBarButton.h"

@class XCTabBar;
@protocol XCTabBarDelegate <NSObject>
@optional
- (void)tabBar:(XCTabBar *)tabBar didSelectButtonFrom:(NSInteger)from to:(NSInteger)to;
@end
@interface XCTabBar : UIView
/**
 *  添加一个选项卡按钮
 *
 *  @param item 选项卡按钮对应的模型数据(标题\图标\选中的图标)
 */
- (void)addTabBarButton:(UITabBarItem *)item;

- (void)tabBarButtonClick:(XCTabBarButton *)button;

@property (nonatomic, strong) NSMutableArray *tabBarButtons;

@property (nonatomic, weak) id<XCTabBarDelegate> delegate;

@end

