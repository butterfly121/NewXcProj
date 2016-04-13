//
//  BaseViewController.h
//  newProject
//
//  Created by xhm on 16/3/31.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic,strong)UIButton *leftbarItem;
@property (strong,nonatomic) UIImageView *showImageViewbg;

@property (strong,nonatomic) UIImageView *showImageView;
- (void)showNoDataView:(BOOL)isShow title:(NSString *)title;
@end
