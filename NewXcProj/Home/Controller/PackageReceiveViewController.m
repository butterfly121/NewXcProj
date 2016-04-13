//
//  PackageReceiveViewController.m
//  XcProject
//
//  Created by xhm on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "PackageReceiveViewController.h"
#import <CoreText/CoreText.h>
#import "ReciveDelegateViewController.h"
#import "ReciveLanchViewController.h"
@interface PackageReceiveViewController ()
{
    UITableView *_tableView;
    int _heght;
    UIButton *_addPhone;
    UIView *_footView;
    UIScrollView *_scrollView;
    UIButton *_rightNavbtn;
    BOOL isEdit;
}
@property(nonatomic,weak)UILabel*noLabel;
@end

@implementation PackageReceiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"快递代收";
    isEdit=NO;
    _rightNavbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_rightNavbtn setTitle:@"编辑" forState:UIControlStateNormal];
    
    //    [_rightNavbtn setTitle:@"完成" forState:UIControlStateSelected];
    
    [_rightNavbtn setTitleColor:UIColorFromRGB(0x333333, 1) forState:UIControlStateNormal];
    [_rightNavbtn setTitleColor:UIColorFromRGB(0x333333, 1) forState:UIControlStateSelected];
    [_rightNavbtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    _rightNavbtn.frame = CGRectMake(0, 0, 40, 40);
    
    _rightNavbtn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    
    [_rightNavbtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarItem = [[UIBarButtonItem alloc] initWithCustomView:_rightNavbtn];
    
    backBarItem.title = @"";
    
    self.navigationItem.rightBarButtonItem = backBarItem;
    
}
- (void)bgView{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width , self.view.bounds.size.height - 110);
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self bgView];
    [self createSubViews];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_scrollView removeFromSuperview];
}
- (void)createSubViews
{
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(15, 74, 200, 14);
    label1.text = @"小区快递柜地址";
    label1.textColor = [UIColor lightGrayColor];
    label1.font = [UIFont systemFontOfSize:14];
    [_scrollView addSubview:label1];
    
    UIView *hView = [[UIView alloc] init];
    hView.backgroundColor = [UIColor whiteColor];
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = KSeparatorLineColor;
    line1.frame = CGRectMake(0, 0, WIDTH, 0.5);
    [hView addSubview:line1];
    
    
    UILabel *blockName = [[UILabel alloc] init];
    blockName.textColor = [UIColor blackColor];
    blockName.frame = CGRectMake(15, 15, self.view.bounds.size.width - 30, 16);
    blockName.font = [UIFont systemFontOfSize:16];
    blockName.text=@"上海总部大楼";
    [hView addSubview:blockName];
    
    UILabel *noLabel = [[UILabel alloc] init];
    noLabel.frame = CGRectMake(15, CGRectGetMaxY(blockName.frame)+10, 300, 14);
    noLabel.font = [UIFont systemFontOfSize:14];
    noLabel.textColor = [UIColor lightGrayColor];
    noLabel.text = [NSString stringWithFormat:@"小区暂未安装快递柜,已有10人支持安装"];
    [hView addSubview:noLabel];
    noLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(supportYungui)];
    [noLabel addGestureRecognizer:tapGes];
    _noLabel = noLabel;
    
    hView.frame = CGRectMake(0, CGRectGetMaxY(label1.frame)+7, self.view.bounds.size.width, 50 +21);
    [_scrollView addSubview:hView];
    
    
    UIImageView *lineColor = [[UIImageView alloc] init];
    lineColor.frame = CGRectMake(0, CGRectGetMaxY(hView.frame), self.view.bounds.size.width, 1);
    lineColor.image = [UIImage imageNamed:@"colorLine"];
    [_scrollView addSubview:lineColor];
    
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(15, CGRectGetMaxY(hView.frame)+15, 200, 14);
    label2.font = [UIFont systemFontOfSize:14];
    label2.textColor = [UIColor lightGrayColor];
    label2.text = @"收件人手机号";
    [_scrollView addSubview:label2];
    _heght =CGRectGetMaxY(label2.frame) + 7;

    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"+新增收件人手机号" forState:UIControlStateNormal];
    [addBtn setBackgroundImage:[UIImage imageNamed:@"image_xuxian"] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    addBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [addBtn setTitleColor:UIColorFromRGB(0x999999, 1) forState:UIControlStateNormal];
    addBtn.frame =CGRectMake(15, CGRectGetMaxY(label2.frame)+30, self.view.bounds.size.width - 30, 45);
    [_scrollView addSubview:addBtn];
    _addPhone = addBtn;
    
    
    UIView *footView = [[UIView alloc] init];
    footView.frame = CGRectMake(0, self.view.bounds.size.height - 100, self.view.bounds.size.width, 110);
    footView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:footView];
    _footView = footView;
    
    
    
    
    NSString *titleTishi = @"如何使用快递柜";
    NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:14]  };
    CGSize sizeTishi = [titleTishi boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    CGFloat tishiX = WIDTH/2 - sizeTishi.width/2;
    UILabel *tishi = [[UILabel alloc] init];
    tishi.frame = CGRectMake(tishiX, 5, sizeTishi.width, 14);
    tishi.text = titleTishi;
    tishi.font = [UIFont systemFontOfSize:14];
    tishi.textColor = [UIColor blackColor];
    //    tishi.backgroundColor = [UIColor redColor];
    [_footView addSubview:tishi];
    
    UIView *leftLine = [[UIView alloc] init];
    CGFloat leftW = tishiX - 15 - 10;
    leftLine.backgroundColor = KSeparatorLineColor;
    leftLine.frame = CGRectMake(15, 12, leftW, 1);
    [_footView addSubview:leftLine];
    
    UIView *rightLine = [[UIView alloc] init];
    rightLine.backgroundColor = KSeparatorLineColor;
    rightLine.frame = CGRectMake(CGRectGetMaxX(tishi.frame) + 10, 12, leftW, 1);
    [_footView addSubview:rightLine];
    
    NSArray *array = [NSArray arrayWithObjects:@"1.收件地址为城市区域+街道+小区名+'快递柜'", @"2.收件人联系方式填写为以上收件人手机号码", @"3.如有疑问,请查看快递柜是如何工作的及代收协议", nil];
    for (int i=0; i<3; i++) {
        UILabel *smallTishi = [[UILabel alloc] init];
        smallTishi.frame = CGRectMake(15, CGRectGetMaxY(tishi.frame)+10 + i*22, self.view.bounds.size.width - 30, 12);
        smallTishi.font = [UIFont systemFontOfSize:12];
        smallTishi.textColor = [UIColor lightGrayColor];
        
        if(i<2){
            smallTishi.text = array[i];
        }
        else{
            
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:array[i]];
            [string addAttribute:NSForegroundColorAttributeName value:COLOR_BTN_GREEN range:NSMakeRange(20, 4)];
            [string addAttribute:NSUnderlineStyleAttributeName
                           value:[NSNumber numberWithInt:kCTUnderlineStyleSingle]
                           range:NSMakeRange(20, 4)];
            [string addAttribute:NSForegroundColorAttributeName value:COLOR_BTN_GREEN range:NSMakeRange(10, 8)];
            [string addAttribute:NSUnderlineStyleAttributeName
                           value:[NSNumber numberWithInt:kCTUnderlineStyleSingle]
                           range:NSMakeRange(10,8)];
            smallTishi.attributedText = string;
        }
        [footView addSubview:smallTishi];
    }
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(110, 73, 100, 12);
    [btn1 addTarget:self action:@selector(xieyi:) forControlEvents:UIControlEventTouchDown];
    btn1.backgroundColor = [UIColor clearColor];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(230, 73, 50, 12);
    [btn2 addTarget:self action:@selector(xieyi:) forControlEvents:UIControlEventTouchDown];
    btn2.backgroundColor = [UIColor clearColor];
    btn1.tag = 100;
    btn2.tag = 200;
    
    [footView addSubview:btn1];
    [footView addSubview:btn2];
    
    
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, CGRectGetMaxY(_addPhone.frame)+15);
    
    
}
-(void)BtnClick:(UIButton*)btn
{
    
}
-(void)xieyi:(UIButton*)btn
{
    if(btn.tag == 100){
        ReciveLanchViewController *vc = [[ReciveLanchViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.preVC = self;
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    else
    {
        ReciveDelegateViewController*vc=[[ReciveDelegateViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)supportYungui{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"小区暂未安装云柜,督促物业加入快递柜代收服务" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"支持", nil];
    [alertView show];
}
- (void)navBtnClick:(UIBarButtonItem *)item
{
    isEdit=!isEdit;
    [_rightNavbtn setTitle:isEdit ? @"完成" : @"编辑" forState:UIControlStateNormal];
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
