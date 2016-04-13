//
//  WZGuideViewController.m 首次安装引导页
//  WZGuideViewController
//
//  Created by Wei on 13-3-11.
//  Copyright (c) 2013年 ZhuoYun. All rights reserved.
//

#import "WZGuideViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "UIImage+JSH.h"

@interface WZGuideViewController ()<UIScrollViewDelegate>

@end

@implementation WZGuideViewController

@synthesize animating = _animating;

@synthesize pageScroll = _pageScroll;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark -

- (CGRect)onscreenFrame
{
    return [UIScreen mainScreen].bounds;
//	return [UIScreen mainScreen].applicationFrame;
}

- (CGRect)offscreenFrame
{
	CGRect frame = [self onscreenFrame];
	switch ([UIApplication sharedApplication].statusBarOrientation)
    {
		case UIInterfaceOrientationPortrait:
			frame.origin.y = frame.size.height;
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			frame.origin.y = -frame.size.height;
			break;
		case UIInterfaceOrientationLandscapeLeft:
			frame.origin.x = frame.size.width;
			break;
		case UIInterfaceOrientationLandscapeRight:
			frame.origin.x = -frame.size.width;
			break;
	}
	return frame;
}

- (void)showGuide
{
	if (!_animating && self.view.superview == nil)
	{
		[WZGuideViewController sharedGuide].view.frame = [self offscreenFrame];
		[[self mainWindow] addSubview:[WZGuideViewController sharedGuide].view];
		
		_animating = YES;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(guideShown)];
		[WZGuideViewController sharedGuide].view.frame = [self onscreenFrame];
		[UIView commitAnimations];
	}
}

- (void)guideShown
{
	_animating = NO;
}

- (void)hideGuide
{
	if (!_animating && self.view.superview != nil)
	{
		_animating = YES;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(guideHidden)];
		[WZGuideViewController sharedGuide].view.frame = [self offscreenFrame];
		[UIView commitAnimations];
	}
}

- (void)guideHidden
{
	_animating = NO;
	[[[WZGuideViewController sharedGuide] view] removeFromSuperview];
}

- (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}

+ (void)show
{
    [[WZGuideViewController sharedGuide].pageScroll setContentOffset:CGPointMake(0.f, 0.f)];
	[[WZGuideViewController sharedGuide] showGuide];
}

+ (void)hide
{
	[[WZGuideViewController sharedGuide] hideGuide];
}

#pragma mark -

+ (WZGuideViewController *)sharedGuide
{
    @synchronized(self)
    {
        static WZGuideViewController *sharedGuide = nil;
        if (sharedGuide == nil)
        {
            sharedGuide = [[self alloc] init];
        }
        return sharedGuide;
    }
}

- (void)pressCheckButton:(UIButton *)checkButton
{ 
    [checkButton setSelected:!checkButton.selected];
}

- (void)pressEnterButton:(UIButton *)enterButton
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *navLogin = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:navLogin animated:YES completion:nil];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
   }

-(void)loginAutomaticly
{

}

#pragma mark - 监听textField
- (void)setupObserver
{

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupObserver];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)loginSuccessfulAnddismissInLoading
{

    
}


- (void)gotoLoginViewController
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *navLogin = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:navLogin animated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT-83.0f/2, WIDTH, 20)];
    NSArray *imageNameArray;
    if (IPHONE5)
    
    {
        if (fiveInch) {
            imageNameArray = [NSArray arrayWithObjects:@"667-1", @"667-2", @"667-3",@"667-4" ,nil];

        }else if(sixInch)
            
        {
            imageNameArray = [NSArray arrayWithObjects:@"736-1", @"736-2", @"736-3",@"736-4" ,nil];

        }else
        {
            imageNameArray = [NSArray arrayWithObjects:@"568-1", @"568-2", @"568-3",@"568-4" ,nil];

        }
        
    }
    else
    {
        imageNameArray = [NSArray arrayWithObjects:@"480-1", @"480-2", @"480-3",@"480-4", nil];
    }
    page.numberOfPages = imageNameArray.count;
    
    self.view.backgroundColor = [UIColor whiteColor];
    if ( IOSVersion >= 7.0 )
    {
        _pageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,  HEIGHT)];
        
    }
    else
    {
        _pageScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,  HEIGHT)];
        
        
    }
    self.pageScroll.pagingEnabled = YES;
    self.pageScroll.contentSize = CGSizeMake(self.view.frame.size.width * imageNameArray.count, self.view.frame.size.height);
    self.pageScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.pageScroll];
    
    _pageScroll.delegate = self;
    UIImageView *view;
    for (int i = 0; i < imageNameArray.count; i++)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width * i), 0.f, self.view.frame.size.width, self.view.frame.size.height)];
        view.image = [UIImage imageNamed:[imageNameArray objectAtIndex:i]];
        view.contentMode = UIViewContentModeScaleAspectFit;
        view.backgroundColor = [UIColor clearColor];
        
        [self.pageScroll addSubview:view];
        
        if (i == imageNameArray.count - 1) {
            
            UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
            enterButton.frame = CGRectMake(30/2, HEIGHT-159/2, WIDTH-30/2*2, 90/2);
            enterButton.layer.masksToBounds = YES;
            enterButton.layer.cornerRadius = 5;

            [enterButton setTitle:@"开启新橙社" forState:UIControlStateNormal];
            enterButton.titleLabel.font = SystemFont(36/2);
            [enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            enterButton.titleLabel.textAlignment = NSTextAlignmentCenter;//JIANG
            [enterButton setBackgroundImage:[UIImage resizedImageWithName:@"btn_login_nomal"] forState:UIControlStateNormal];
            [enterButton setBackgroundImage:[UIImage resizedImageWithName:@"btn_login_highlighted"] forState:UIControlStateHighlighted];
            view = self.pageScroll.subviews[i];//JIANG
            view.userInteractionEnabled = YES;
            CGFloat enterButtonCenterY = 0;
            if (fiveInch) {
                enterButtonCenterY = view.frame.size.height * 0.9;
            }else if(sixInch){
                 enterButtonCenterY = view.frame.size.height * 0.9;
            }
                
            else{
                 enterButtonCenterY = IPHONE5? 500.f+11 :500.f - 88+30;
            }
            [enterButton setCenter:CGPointMake(view.frame.size.width * 0.5, enterButtonCenterY)];
            [enterButton addTarget:self action:@selector(pressEnterButton:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:enterButton];
            
            
        }
    }
    [self.view addSubview:page];
    if (IOS7)
    {
        page.pageIndicatorTintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
        page.currentPageIndicatorTintColor = DEFAULT_BUTTON_COLOR;
    }
    //page.hidden = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    page.currentPage = scrollView.contentOffset.x/320;
    
    if (page.currentPage==3)
    {
        page.hidden = YES;
    }
    else
    {
        page.hidden = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
