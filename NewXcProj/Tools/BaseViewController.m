//
//  BaseViewController.m
//  newProject
//
//  Created by xhm on 16/3/31.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "BaseViewController.h"
#import "NSString+HXAddtions.h"
@interface BaseViewController ()
@property (strong,nonatomic)UILabel *lbshowTip;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 0, 10, 10);
    [self.view addSubview:view];
    self.automaticallyAdjustsScrollViewInsets = NO;//防止表偏移问题

    
    self.view.backgroundColor = DEFAULT_BackgroundView_COLOR;
    self.leftbarItem = [[UIButton alloc] init];
    self.leftbarItem.frame  =CGRectMake(0, 44/2-15, 30, 30);
    [self.leftbarItem setImage:[UIImage imageNamed:@"left_arrow"] forState:UIControlStateNormal];
    [self.leftbarItem addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftbarItem];
}
- (void)showNoDataView:(BOOL)isShow title:(NSString *)title
{
    CGSize size = [title sizeOfTextWidthAndHeightWithFont:15 withWidth:(WIDTH- 30)];
    if (isShow) {
        if (self.showImageViewbg) {
            self.showImageViewbg.hidden = NO;
            self.showImageView.image = [UIImage imageNamed:@"nodata"];
            self.lbshowTip.text = title;
            
            self.lbshowTip.frame = CGRectMake((WIDTH - size.width)/2, CGRectGetMaxY(self.showImageView.frame)+10, size.width, size.height);
            
            [self.view bringSubviewToFront:self.showImageViewbg];
        }else
        {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            imgView.image = nil;
            imgView.backgroundColor = [UIColor clearColor];
            self.showImageViewbg = imgView;
            self.showImageViewbg.hidden = NO;
            
            UIImageView *waitView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nodata"]];
            waitView.bounds = CGRectMake(0, 0, waitView.bounds.size.width/2, waitView.bounds.size.height/2);
            waitView.center = CGPointMake(imgView.center.x, imgView.center.y-64);
            self.showImageView = waitView;
            [imgView addSubview:waitView];
            [self.view addSubview:imgView];
            
            UILabel *lbLNoOrderTip = [[UILabel alloc] init];
            lbLNoOrderTip.frame = CGRectMake((WIDTH - size.width)/2, CGRectGetMaxY(waitView.frame)+10, size.width, size.height);
            lbLNoOrderTip.textColor = [UIColor lightGrayColor];
            lbLNoOrderTip.font = [UIFont systemFontOfSize:15];
            lbLNoOrderTip.textAlignment = NSTextAlignmentLeft;
            lbLNoOrderTip.numberOfLines = 0;
            lbLNoOrderTip.text = title;
            self.lbshowTip = lbLNoOrderTip;
            [imgView addSubview:lbLNoOrderTip];
        }
        
    }else{
        
        self.showImageViewbg.hidden = YES;
        
        
    }
}

- (void)backClick
{
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
