//
//  ProfileViewController.m
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIButton+WebCache.h"
#import "UIImage+JSH.h"
#import "UIView+Extension.h"
#import "MineTableViewCell.h"
#import "ProfileTableViewCell.h"
#import "SettingViewController.h"
#import "HomeAddressViewController.h"
//#import "LeftTextRightImgButton.h"
#define kTopViewHeight 193.0
#define kAreaHeight 65.0
#define kMineIconWidth 70.0
#define kMineIconY 74.0
#define NAVBAR_CHANGE_POINT 0.0
#define ScrollerFrameY  0.0
#define ScrollerContentSizeHeight   (HEIGHT-49.0-64.0)
@interface ProfileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*profileTable;
@property (nonatomic,weak)UIButton *headerView;
@property (nonatomic,weak)UIView *topView;
@property (nonatomic,weak)UIView *grayImageView;
@property (weak ,nonatomic) UIButton *btnIcon;
@property(nonatomic,strong)NSArray*imageNameArr;
@property(nonatomic,strong)NSArray*titleArr;
@property(nonatomic,strong)NSArray*endLableArr;
@property(nonatomic,strong)NSArray*titleArr2;
@property(nonatomic,strong)NSArray*imageNameArr2;
@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _profileTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
    _profileTable.delegate=self;
    _profileTable.dataSource=self;
    _profileTable.tableHeaderView=[self creatHeaderView];
    [self.view addSubview:_profileTable];
    _imageNameArr=[[NSArray alloc]initWithObjects:@"mine_myintegral",@"mine_myorder",@"mine_coupon", nil];
    _imageNameArr2=[[NSArray alloc]initWithObjects:@"mine_myinvite",@"mine_sevicephone",@"mine_feedback", nil];
    _titleArr=[[NSArray alloc]initWithObjects:@"我的橙贝",@"我的订单",@"我的优惠卷", nil];
    _titleArr2=[[NSArray alloc]initWithObjects:@"邀请邻居",@"客服意见",@"意见反馈", nil];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else if (section==1)
    {
        return 3;
    }
    else
    {
        return 3;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineTableViewCell *cell = [MineTableViewCell creatCell:tableView Identifier:@"cell2"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section==0)
    {
    ProfileTableViewCell*cell=[ProfileTableViewCell creatCell:tableView Identifier:@"cell0"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    cell.Label.text=@"上海新城盛景";
    cell.detailLabel.text=@"设置住址用橙贝抵扣物业费";
    cell.iconImageView.image=[UIImage imageNamed:@"mine_map"];
        [cell.imageBtn setBackgroundImage:[UIImage imageNamed:@"mine_setting_reddot"] forState:UIControlStateNormal];
    [cell.imageBtn setTitle:@"设置住址" forState:UIControlStateNormal];
    
    [cell.imageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return cell;
    }
    else if(indexPath.section==1)
    {
        
        MineTableViewCell *cell = [MineTableViewCell creatCell:tableView Identifier:@"cell1"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.iconImageView.image=[UIImage imageNamed:_imageNameArr[indexPath.row]];
        cell.descLabel.text=_titleArr[indexPath.row];
        if (indexPath.row==0)
        {
            cell.endlabel.text=@"0橙贝";
        }
        else if (indexPath.row==2)
        {
            cell.endlabel.text=@"0张未使用";
        }
        else
        {
            cell.endlabel.text=@"";
        }
        return cell;
    }
  
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.iconImageView.image=[UIImage imageNamed:_imageNameArr2[indexPath.row]];
        cell.descLabel.text=_titleArr2[indexPath.row];
    if (indexPath.row==0)
    {
        cell.endlabel.text=@"邀请邻居";
        
    }
    else if(indexPath.row==1)
    {
        cell.endlabel.text=@"400-823-0950";
    }
        return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 60;
    }
    return 44;
}


- (UIView *)creatHeaderView
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 175)];
    self.topView = topView;
    topView.userInteractionEnabled=YES;
    UIButton *  headerView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 175)]; ;
    UIImage *hoderImage = [UIImage imageNamed:@"mine_bg.jpg"];
   
    self.headerView = headerView;
    [headerView setImage:hoderImage forState:UIControlStateNormal];
    //图片上的灰色梦层
    UIImageView* grayImageView = [[UIImageView alloc] initWithFrame:headerView.bounds];
    grayImageView.image = [UIImage resizedImageWithName:@"bg_mc"];
    self.grayImageView = grayImageView;
    [headerView addSubview:grayImageView];
    
    
    [headerView addTarget:self action:@selector(changeTopHeaderView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.topView addSubview:headerView];
    UIButton*setBtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 10, 30, 30)];
    [setBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [setBtn setBackgroundImage:[UIImage imageNamed:@"Settings"] forState:UIControlStateNormal];
    [self.topView addSubview:setBtn];
    UIButton*headImage=[[UIButton alloc]initWithFrame:CGRectMake((topView.width-70)/2, (topView.height-70)/2, 70, 70)];
    headImage.backgroundColor=[UIColor redColor];
    [headImage setBackgroundImage:[UIImage imageNamed:@"custPic_default"] forState:UIControlStateNormal];
    headImage.layer.masksToBounds=YES;
    headImage.layer.cornerRadius=35;
    [self.topView addSubview:headImage];
    UILabel*nameLable=[[UILabel alloc]initWithFrame:CGRectMake((topView.width-70)/2, headImage.y+headImage.height+10, 40, 20)];
    nameLable.text=@"小敏";
    nameLable.textColor=[UIColor whiteColor];
    [self.topView addSubview:nameLable];
    UIImageView*sexIma=[[UIImageView alloc]initWithFrame:CGRectMake(nameLable.x+nameLable.width, nameLable.y, 20, 20)];
    sexIma.backgroundColor=[UIColor redColor];
    sexIma.image=[UIImage imageNamed:@"women"];
    sexIma.layer.masksToBounds=YES;
    sexIma.layer.cornerRadius=10;
    [self.topView addSubview:sexIma];
    return topView;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        HomeAddressViewController*vc=[[HomeAddressViewController alloc]init];
        UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:vc];
        [self.tabBarController.navigationController presentViewController:nav animated:YES completion:nil];
//        self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>
        
    }
}
-(void)BtnClick:(UIButton*)btn
{
    SettingViewController*setVC=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
}
-(void)changeTopHeaderView
{
//    NSLog(@"789");
}
-(void)gotoBasicInfo
{
    
}
- (void)didReceiveMemoryWarning {
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
