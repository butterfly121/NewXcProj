//
//  SettingViewController.m
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "SettingViewController.h"
#import "MineTableViewCell.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "WAPViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UITableView*_setTableView;
    NSArray*_nameArr;
    
}
@property(nonatomic,copy)NSString *qq;
@property(nonatomic,copy)NSString *sevicePhone;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置";
    self.qq=@"384227979";
    self.sevicePhone=@"400-823-0950";
    _setTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,80, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    _setTableView.delegate=self;
    _setTableView.dataSource=self;
    _setTableView.tableFooterView=[self createFooterView];
    [self.view addSubview:_setTableView];
    _nameArr=[[NSArray alloc]initWithObjects:@"新消息通知",@"关于新橙社",@"意见反馈",@"缓存清理",@"用户qq群",@"客服电话",nil];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else if (section==1)
    {
        return 1;
    }
        return 6;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0)
    {
        UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        if(!cell)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.font=[UIFont systemFontOfSize:15];
        }
        cell.textLabel.text=@"登录手机号";
        return cell;
    }
   else if (indexPath.section==1)
    {
        MineTableViewCell*cell=[MineTableViewCell creatCell:tableView Identifier:@"cell1"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.iconImageView.image=[UIImage imageNamed:@""];
        cell.descLabel.text=@"微信";
        cell.endlabel.text=@"小敏";
        return cell;
    }
    else
    {
        MineTableViewCell*cell=[MineTableViewCell creatCell:tableView Identifier:@"cell2"];
        cell.textLabel.font=[UIFont systemFontOfSize:15];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text=_nameArr[indexPath.row];
        if (indexPath.row==4)
        {
            cell.endlabel.text=self.qq;
        }
        if (indexPath.row==5)
        {
            cell.endlabel.text=@"400-823-0950";
        }
        return cell;
    }

}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return @"账号设置";
    }
    else if (section==1)
    {
        return @"第三方登录账号";
    }
    else
    {
        return @"系统设置";
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2)
    {
        if (indexPath.row==2)
        {
            WAPViewController*vc=[[WAPViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if(indexPath.row==3)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"清除缓存" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"清理", nil];
            alert.tag = 200;
            [alert show];
        }
        if (indexPath.row==4)
        {
            [self setupQQAlert];
        }
        if (indexPath.row==5)
        {
            NSString *strPhone = [NSString stringWithFormat:@"tel:%@", self.sevicePhone];
            NSURL * url = [NSURL URLWithString:strPhone];
            UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
            [_setTableView addSubview:webView];
            [webView loadRequest:[NSURLRequest requestWithURL:url]];
        }
    }
}
- (void)setupQQAlert
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"搜索并加入新橙社用户QQ群，了解最新活动及优惠！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"复制群号", nil];
    alert.tag = 300;
    [alert show];
    
}
-(UIView*)createFooterView
{
    UIView *logOutView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0,150)];
    logOutView.backgroundColor = [UIColor clearColor];
    
    UIButton* logOutBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logOutBtn = [[UIButton alloc]initWithFrame:CGRectMake(10,0,WIDTH-20, 44)];
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logOutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    logOutBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    logOutBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [logOutBtn setBackgroundColor:[UIColor whiteColor]];
    logOutView.layer.masksToBounds=YES;
    logOutView.layer.cornerRadius=10;
    [logOutBtn addTarget:self action:@selector(requestUserExtiLogin) forControlEvents:UIControlEventTouchUpInside];
    [logOutView addSubview:logOutBtn];
    return logOutView;
}
-(void)requestUserExtiLogin
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定要退出吗？" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 400;
    [alert show];
    
   }
#pragma mark - alertDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [self.view endEditing:YES];
    if (buttonIndex)
    {
        if(alertView.tag==200)
        {
            NSLog(@"清理");
        }
        if (alertView.tag==300)
        {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = self.qq;
 
        }
        if (alertView.tag==400)
        {
            LoginViewController *login = [[LoginViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
            AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
            app.window.rootViewController = nil;
            app.window.rootViewController = nav;

        }
    }
}
- (void)didReceiveMemoryWarning
{
    
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
