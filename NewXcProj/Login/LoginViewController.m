//
//  LoginViewController.m
//  newProject
//
//  Created by xhm on 16/3/31.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "LoginViewController.h"
#import "homeViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "BasicControls.h"
#import "RegisterViewController.h"
#define kThirdBtnHeight 44
#define kThirdBtnBottomPadding 15
@interface LoginViewController ()<UITextFieldDelegate>
{
    UITextField*userName;
    UITextField*passWord;
    UILabel*nameLable;
    UILabel*passwordLable;
    UIButton *loginButton;
    UIView*loginview;
}

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"登录新橙社";
    self.leftbarItem.hidden=YES;
    UIButton *rbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rbtn setTitle:@"注册" forState:UIControlStateNormal];
    [rbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rbtn.frame = CGRectMake(10, 10, 40, 24);
    [rbtn addTarget:self action:@selector(jumpUserRegisterView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rbtn];
    [self createView];
    [self creatThirdTipLabel];
    [self creatThirdLoginBtn];
}
///跳到注册页面
-(void)jumpUserRegisterView
{
    RegisterViewController*userVc=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:userVc animated:YES];
}
#pragma mark 登录模块
-(void)createView
{
    loginview=[[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 100)];
    loginview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:loginview];
    
    userName=[[UITextField alloc]initWithFrame:CGRectMake(60, 0, WIDTH-80, 50)];
    passWord=[[UITextField alloc]initWithFrame:CGRectMake(60, userName.frame.origin.y+userName.frame.size.height, WIDTH-80, 50)];
    {
    userName.keyboardType=UIKeyboardTypeNumberPad;

    userName.delegate=self;
    [self.view addSubview:userName];
    userName.keyboardType=UIKeyboardTypeASCIICapable;
    userName.font = [UIFont fontWithName:@"ArialMT" size:14];
    userName.placeholder = @"登录手机号";
    [loginview addSubview:userName];
    [self showLineImageWithFrame:CGRectMake(0, userName.frame.origin.y+userName.frame.size.height, WIDTH, 0.5)];
    
    }
    {
        passWord.keyboardType=UIKeyboardTypeASCIICapable;
        passWord.font = [UIFont fontWithName:@"ArialMT" size:14];
        passWord.placeholder = @"6-20位登录密码";
        passWord.keyboardType=UIKeyboardTypeDefault;
        passWord.delegate=self;
        passWord.secureTextEntry=YES;
        [loginview addSubview:passWord];

        [self showLineImageWithFrame:CGRectMake(0, passWord.frame.origin.y+passWord.frame.size.height,WIDTH, 0.5)];
        

    }
   
    nameLable=[[UILabel alloc]initWithFrame:CGRectMake(10,5,50, 40)];
    nameLable.text=@"手机号";
    nameLable.font=[UIFont systemFontOfSize:15];
    [loginview addSubview:nameLable];
    passwordLable=[[UILabel alloc]initWithFrame:CGRectMake(10,passWord.frame.origin.y+5,50, 40)];
    passwordLable.text=@"密码";
    passwordLable.font=[UIFont systemFontOfSize:15];
    [loginview addSubview:passwordLable];
    
    
    loginButton = [[UIButton alloc] init];
    loginButton.frame  = CGRectMake(10, loginview.frame.origin.y+loginview.frame.size.height+20,WIDTH-20, 40);
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor lightGrayColor];
    loginButton.layer.cornerRadius=5;
    loginButton.layer.masksToBounds=YES;
    [self.view addSubview:loginButton];
    [loginButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton* forgetBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    forgetBtn.frame=CGRectMake(WIDTH-80, loginButton.frame.origin.y+loginButton.frame.size.height+10, 60, 40);
    [forgetBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:COLOR_BTN_GREEN forState:UIControlStateNormal];
    [self.view addSubview:forgetBtn];
    
}
///划线
- (void)showLineImageWithFrame:(CGRect)frame
{
    UIImageView* lineview = [BasicControls createImageViewWithframe:frame image:nil];
    lineview.backgroundColor = SR_Color_Line;
    [loginview addSubview:lineview];
}
#pragma mark 用户协议
- (void)creatThirdTipLabel
{
    
    NSString *topTipStr = @"未注册/绑定的微信，登录时会自动注册，并视为";
    UILabel *lbTop =  [[UILabel alloc] init];
    lbTop.font = [UIFont systemFontOfSize:12];
    lbTop.text = topTipStr;
    lbTop.numberOfLines = 0;
    lbTop.textAlignment = NSTextAlignmentCenter;
    lbTop.frame = CGRectMake(0, HEIGHT - kThirdBtnHeight - 12*2 - kThirdBtnBottomPadding-4, WIDTH, 12);
    lbTop.textColor = COLOR_Register_AgreementTitleGray;
    [self.view addSubview:lbTop];
    
    
    NSString *leftTipStr = @"同意新橙社";
    NSString *rightTipStr = @"《用户服务协议》";
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    UILabel *lbLeft =  [[UILabel alloc] init];
    lbLeft.font = lbTop.font;
    lbLeft.text = leftTipStr;
    lbLeft.numberOfLines = 0;
    lbLeft.textAlignment = NSTextAlignmentCenter;
    lbLeft.textColor = COLOR_Register_AgreementTitleGray;
    attrs[NSFontAttributeName] = lbLeft.font;
    
    CGSize sizeLeft =[leftTipStr sizeWithAttributes:attrs];
    CGSize sizeRight = [rightTipStr sizeWithAttributes:attrs];
    CGFloat totalW = sizeLeft.width + sizeRight.width;
    
    lbLeft.frame = CGRectMake((WIDTH - totalW)/2, HEIGHT - kThirdBtnHeight - sizeLeft.height - kThirdBtnBottomPadding+4, sizeLeft.width, sizeLeft.height);
    
    [self.view addSubview:lbLeft];
    
    
    UIButton *btnAgreement = [[UIButton alloc] init];
    btnAgreement.frame = CGRectMake(CGRectGetMaxX(lbLeft.frame), lbLeft.frame.origin.y,sizeRight.width, sizeRight.height);
    [btnAgreement setTitle:rightTipStr forState:UIControlStateNormal];
    [btnAgreement setTitleColor:COLOR_BTN_GREEN forState:UIControlStateNormal];
    btnAgreement.titleLabel.font = lbLeft.font;
    [btnAgreement addTarget:self action:@selector(agreement:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAgreement];
    
}
#pragma mark 第三方登录模块
- (void)creatThirdLoginBtn
{
    
    CGFloat btnWeixinLoginEdgeInset = 12;
    UIButton *btnThird = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btnThird.frame = CGRectMake(0, HEIGHT- kThirdBtnHeight, WIDTH,kThirdBtnHeight);
    btnThird.titleEdgeInsets = UIEdgeInsetsMake(0, btnWeixinLoginEdgeInset, 0, 0);
    [btnThird setBackgroundColor:[UIColor whiteColor]];
    NSString *imgIcon = @"loginbyweixin";
    [btnThird setImage:[UIImage imageNamed:imgIcon] forState:UIControlStateNormal];
    [btnThird setImage:[UIImage imageNamed:imgIcon] forState:UIControlStateHighlighted];
    [btnThird setTitle:@"微信登录" forState:UIControlStateNormal];
    [btnThird setTitleColor:UIColorFromRGB(0x676767, 1.0) forState:UIControlStateNormal];
    btnThird.titleLabel.font = [UIFont systemFontOfSize:16];
    [btnThird addTarget:self action:@selector(LoginInthirdWay:) forControlEvents:UIControlEventTouchUpInside];
    
    btnThird.layer.masksToBounds = YES;
    btnThird.tag = 0;
    
    [self.view addSubview:btnThird];
    
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, btnThird.bounds.size.width,KSeparatorLineHeight)];
    topLine.backgroundColor = KSeparatorLineColor;
    [btnThird addSubview:topLine];
    
}
#pragma mark 退出登录
-(void)agreement:(UIButton*)btn
{
    
}
#pragma mark 第三方登录
-(void)LoginInthirdWay:(UIButton*)btn
{
    
}
-(void)forgetBtnClick
{
     NSLog(@"忘记密码");
}
#pragma mark 登录按钮事件
- (void)btnClick
{
    [self.view endEditing:YES];
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UINavigationController *mainN = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    app.window.rootViewController = mainN;
}

@end
