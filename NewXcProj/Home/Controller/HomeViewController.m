//
//  HomeViewController.m
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "CircleScrollView.h"
#import "PropertyFeeViewController.h"
#import "CorrelativechargesViewController.h"
#import "PrePhoneViewController.h"
#import "ReciveLanchViewController.h"
#import "PackageReceiveViewController.h"
#import "CommunityAnnouncementViewController.h"
#import "PostdetailsViewController.h"
#import "PropertyViewController.h"
#import "KangManagerViewController.h"
#define KSeparatorLineColor ( UIColorFromRGB(0xd9d9d9, 1.0) )
@interface HomeViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CircleScrollDelegate>
{
    UIScrollView * HomeScroll;
    
    UIImageView * HomeBigImage;//首页大图
    
    UICollectionView * HomeFirstCollectionView;//首页头一个八小格子
    
    NSArray * FirstArray;
    
    NSArray * SecondArray;
    
    NSArray * ImageArr;
    
}
@property(nonatomic,strong)CircleScrollView *scr1;
@end

@implementation HomeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新橙社";
    self.automaticallyAdjustsScrollViewInsets = NO;//防止表偏移问题
    
    //首页框架
    [self setUpHomeUI];
    
    //首页大图
    [self createBigPic];
    
    //首页头一个功能区
    [self createFirstGrid];
    
    //轮播
    [self createHomeScroll];
    
    FirstArray = [NSArray arrayWithObjects:@"小区公告",@"物业费缴纳",@"水电费",@"手机充值",@"快递代收",@"帖子详情",@"关于物业",@"康管家", nil];
    
    SecondArray = [NSArray arrayWithObjects:@"按钮1",@"按钮2",@"按钮3",@"按钮4",@"按钮5",@"按钮6",@"按钮7",@"按钮8", nil];
    
    ImageArr = [NSArray arrayWithObjects:@"home01.png",@"home02.png",@"home03.png",@"home04.png",@"home05.png",@"home06.png",@"home07.png",@"home08.png", nil];
    //首页第二个功能区
    [self createSecondFunctionArea];
}
#pragma mark 首页第二个功能区
- (void)createSecondFunctionArea
{
    UICollectionViewFlowLayout * flowLatout = [[UICollectionViewFlowLayout alloc]init];
    flowLatout.itemSize = CGSizeMake(WIDTH/4 -0.5, WIDTH/4- 0.5);
    flowLatout.minimumLineSpacing = 1;
    flowLatout.minimumInteritemSpacing = 0;
    HomeFirstCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _scr1.maxY + 20, WIDTH, WIDTH/2)collectionViewLayout:flowLatout];
    HomeFirstCollectionView.delegate = self;
    HomeFirstCollectionView.dataSource = self;
    HomeFirstCollectionView.backgroundColor = KSeparatorLineColor;
    [HomeFirstCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HomeCollectionCellID"];
    HomeFirstCollectionView.scrollEnabled = NO;
    [HomeScroll addSubview:HomeFirstCollectionView];
}
#pragma mark 轮播
- (void)createHomeScroll
{
    NSMutableArray * viewsArray = [NSMutableArray array];
    [viewsArray addObject:@"HomeScroll01.jpg"];
    [viewsArray addObject:@"HomeScroll02.jpg"];
    [viewsArray addObject:@"HomeScroll03.jpg"];
    [viewsArray insertObject:[viewsArray lastObject] atIndex:0];
    [viewsArray insertObject:[viewsArray objectAtIndex:1] atIndex:viewsArray.count];
    
    _scr1 = [[CircleScrollView alloc]initWithImgs:@[@"HomeScroll01.jpg",@"HomeScroll02.jpg",@"HomeScroll03.jpg"] fram:CGRectMake(0,HomeFirstCollectionView.maxY+20,WIDTH, WIDTH/4)];
    _scr1.circleScrollType = CircleScrollTypePageControlAndTimer;
    _scr1.circleScrollStyle = CircleScrollStyleNone;
    _scr1.circleDelegate = self;
    [HomeScroll addSubview:_scr1];
    
}


#pragma mark 首页头一个功能区
- (void)createFirstGrid
{
    UICollectionViewFlowLayout * flowLatout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLatout.itemSize = CGSizeMake(WIDTH/4 -0.5, WIDTH/4 -0.5);
    flowLatout.minimumLineSpacing = 1;
    flowLatout.minimumInteritemSpacing = 0;
    HomeFirstCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, HomeBigImage.maxY, WIDTH, WIDTH/2)collectionViewLayout:flowLatout];
    HomeFirstCollectionView.delegate = self;
    HomeFirstCollectionView.dataSource = self;
    HomeFirstCollectionView.backgroundColor = KSeparatorLineColor;
    [HomeFirstCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"HomeCollectionCellID"];
    HomeFirstCollectionView.scrollEnabled = NO;
    [HomeScroll addSubview:HomeFirstCollectionView];
    
    
}
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"HomeCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"HomeCollectionCellID"];
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionCellID" forIndexPath:indexPath];
    cell.pic.image = [UIImage imageNamed:ImageArr[indexPath.row]];
    cell.label.text = FirstArray[indexPath.row];
    cell.label.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0:
        {
            //小区公告
            CommunityAnnouncementViewController*vc=[[CommunityAnnouncementViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            PropertyFeeViewController * PropertyFeeVC = [[PropertyFeeViewController alloc]init];
            PropertyFeeVC.title = @"物业费缴纳";
            [self.navigationController pushViewController:PropertyFeeVC animated:YES];
        }
            break;
        case 2:
        {
            CorrelativechargesViewController * CorrelativechargesVC = [[CorrelativechargesViewController alloc]init];
            CorrelativechargesVC.title = @"水电煤缴纳";
            [self.navigationController pushViewController:CorrelativechargesVC animated:YES];
        }
            break;
        case 3:
        {
            //手机充值
            PrePhoneViewController*VC=[[PrePhoneViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 4:
        {
            //快递代收
            NSNumber *firstPackage = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstPackage"];
            if(![firstPackage boolValue]){
                ReciveLanchViewController*VC=[[ReciveLanchViewController alloc]init];
                [self.navigationController pushViewController:VC animated:YES];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstPackage"];
            }
            else
            {
                PackageReceiveViewController*vc=[[PackageReceiveViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
            break;
        case 5:
        {
            //帖子详情
            PostdetailsViewController*vc=[[PostdetailsViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            //关于物业
            PropertyViewController*vc=[[PropertyViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            //康管家
            KangManagerViewController*vc=[[KangManagerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            
            break;
    }

}
#pragma mark CircleScrollDelegate
-(void)circleScroll:(CircleScrollView *)scrollView selectIndex:(NSInteger)index
{
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
#pragma mark 首页框架
- (void)setUpHomeUI
{
    HomeScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    HomeScroll.directionalLockEnabled = YES;
    HomeScroll.delegate = self;
    HomeScroll.backgroundColor = KSeparatorLineColor;
    HomeScroll.contentSize = CGSizeMake(WIDTH, 300 + WIDTH +40 + 48+ WIDTH/4);
    [self.view addSubview:HomeScroll];
    
}
#pragma mark 首页大图
- (void)createBigPic
{
    HomeBigImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    HomeBigImage.userInteractionEnabled = YES;
    HomeBigImage.image = [UIImage imageNamed:@"HomeBigPic.jpg"];
    [HomeScroll addSubview:HomeBigImage];
    
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
