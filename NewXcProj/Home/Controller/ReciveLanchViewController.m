//
//  ReciveLanchViewController.m
//  XcProject
//
//  Created by xhm on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "ReciveLanchViewController.h"
#import "PackageReceiveViewController.h"
#import "UIImage+JSH.h"
@interface ReciveLanchViewController ()<UIScrollViewDelegate>
{
    UIPageControl *_pageCrl;
    UIScrollView *_scrollView;
}
@property (nonatomic, strong) NSArray *imageArray;
@end

@implementation ReciveLanchViewController

- (NSArray *)imageArray{
    if(nil == _imageArray){
        if(IPHONE5){
            if(fourInch){
                _imageArray = [NSArray arrayWithObjects:@"kuaidi_1136_3", @"kuaidi_1136_2", @"kuaidi_1136_1", nil];
            }else if (fiveInch){
                _imageArray = [NSArray arrayWithObjects:@"kuaidi_1334_3", @"kuaidi_1334_2", @"kuaidi_1334_1", nil];
            }else if (sixInch){
                _imageArray = [NSArray arrayWithObjects:@"kuaidi_2208_3", @"kuaidi_2208_2", @"kuaidi_2208_1", nil];
            }
        }else{
            _imageArray = [NSArray arrayWithObjects:@"kuaidi_960_3", @"kuaidi_960_2", @"kuaidi_960_1", nil];
        }
    }
    return _imageArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"快递代收";
    [self createScrollView];
    
    if([self.preVC isKindOfClass:[PackageReceiveViewController class]]){
        [self setNav];
    }
    
}

- (void)setNav{
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"undo"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"undo"] forState:UIControlStateHighlighted];
        btn.frame = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.width);
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _scrollView.contentOffset = CGPointZero;
    
}

- (void)createScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    _scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    for (int i=0; i<self.imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(WIDTH*i, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        imageView.image = [UIImage imageNamed:self.imageArray[i]];
        
        [scrollView addSubview:imageView];
    }
    
    scrollView.contentSize = CGSizeMake(WIDTH*self.imageArray.count, self.view.bounds.size.height);
    
    UIPageControl *pageCrl = [[UIPageControl alloc] init];
    
    CGFloat pageWidth = WIDTH/3;
    pageCrl.frame = CGRectMake((WIDTH-pageWidth)/2, HEIGHT *0.85, pageWidth, 20);
    pageCrl.currentPageIndicatorTintColor = UIColorFromRGB(0xff7f00, 1);
    pageCrl.pageIndicatorTintColor = UIColorFromRGB(0xe5e5e5, 1);
    pageCrl.currentPage = 0;
    
    pageCrl.numberOfPages = self.imageArray.count;
    _pageCrl = pageCrl;
    //    pageCrl.backgroundColor = [UIColor redColor];
    [self.view addSubview:pageCrl];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(WIDTH*(self.imageArray.count-1) + 25 , self.view.bounds.size.height * 0.75, self.view.bounds.size.width-50, 45);
    [btn setTitle:@"知道了" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"btn_login_nomal"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizedImageWithName:@"btn_login_highlighted"] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:18];
    [scrollView addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick
{
    if([self.preVC isKindOfClass:[PackageReceiveViewController class]]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        PackageReceiveViewController *vc = [[PackageReceiveViewController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    _pageCrl.currentPage = (scrollView.contentOffset.x + scrollView.bounds.size.width / 2) / scrollView.bounds.size.width;
    
    if (_pageCrl.currentPage == self.imageArray.count - 1) {
        
        [UIView animateWithDuration:0.25 animations:^{
            _pageCrl.alpha = 0;
        }];
        
    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            _pageCrl.alpha = 1;
        }];
    }
    
}
@end
