//
//  PrePhoneViewController.m
//  XcProject
//
//  Created by xhm on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "PrePhoneViewController.h"
#import "XMPickView.h"
@interface PrePhoneViewController ()<XMPickViewDelegate,UITextFieldDelegate>
{
    UITextField *_phoneText;
    UILabel *_placeMoney;
    UILabel *_labelMoney;
    UILabel *_phoneCom;
    UIButton *_senBtn;
    UILabel *labelMoney;
//    CGFloat _trueMoney;
//    
//    NSString *_preText;
//    UILabel *labelMoney;
}
@property (nonatomic, strong) NSArray *sendMoneyArry;
@property(nonatomic,strong) XMPickView *pickView;
@end

@implementation PrePhoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"手机充值";
     _sendMoneyArry = [NSArray arrayWithObjects:@"10", @"20", @"30", @"50", @"100", @"200", @"300", nil];
    UIView *phoneView = [[UIView alloc] init];
    phoneView.backgroundColor = [UIColor whiteColor];
    phoneView.frame = CGRectMake(0, 74, self.view.bounds.size.width, 44);
    phoneView.layer.borderColor =[UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1].CGColor;
    phoneView.layer.borderWidth = KSeparatorLineHeight;
    [self.view addSubview:phoneView];
    
    UILabel *phoneCom = [[UILabel alloc] init];
//    phoneCom.backgroundColor=[UIColor redColor];
    phoneCom.frame = CGRectMake(15, CGRectGetMaxY(phoneView.frame)+7, 200, 13);
    //    phoneCom.text = ;
    phoneCom.font = [UIFont systemFontOfSize:13];
    phoneCom.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    [self.view addSubview:phoneCom];
    _phoneCom = phoneCom;
    
    UIView *sendView = [[UIView alloc] init];
    sendView.frame = CGRectMake(0, CGRectGetMaxY(phoneView.frame)+34, self.view.bounds.size.width, 44);
    sendView.backgroundColor = [UIColor whiteColor];
    sendView.layer.borderWidth = KSeparatorLineHeight;
    sendView.layer.borderColor = [UIColor colorWithRed:218.0f/255.0f green:218.0f/255.0f blue:218.0f/255.0f alpha:1].CGColor;
    [self.view addSubview:sendView];
    
    
    _senBtn = [[UIButton alloc]init];
    [_senBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    _senBtn.frame = CGRectMake(10, CGRectGetMaxY(sendView.frame)+20, WIDTH-20, 40);
    
    [_senBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_senBtn setBackgroundColor:[UIColor lightGrayColor]];
    [_senBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _senBtn.layer.cornerRadius =5;
    _senBtn.layer.masksToBounds = YES;

    [self.view addSubview:_senBtn];
    
    UITextField *textFieldPhone = [[UITextField alloc] init];
    textFieldPhone.frame = CGRectMake(15, 0, self.view.bounds.size.width - 100, 44);
   
    textFieldPhone.placeholder = @"请输入手机号码";
    textFieldPhone.font = [UIFont systemFontOfSize:16];
    textFieldPhone.keyboardType = UIKeyboardTypeNumberPad;
    [phoneView addSubview:textFieldPhone];
    _phoneText = textFieldPhone;
    textFieldPhone.delegate = self;

    
    labelMoney = [[UILabel alloc ] init];
    labelMoney.frame = CGRectMake(15, 0, 100, 44);
    labelMoney.font = [UIFont systemFontOfSize:16];
    labelMoney.text = @"100";
    [sendView addSubview:labelMoney];
    _labelMoney = labelMoney;
    
    
    UILabel *placeMoney = [[UILabel alloc] init];
    placeMoney.frame = CGRectMake(self.view.bounds.size.width - 30 - 200, 0, 200, 44);
    placeMoney.font = [UIFont systemFontOfSize:16];
    placeMoney.textColor = [UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1];
    placeMoney.textAlignment = NSTextAlignmentRight;
    placeMoney.text = @"运营商暂不支持此面额";
    [sendView addSubview:placeMoney];
    _placeMoney = placeMoney;
    
    UIImageView *line = [[UIImageView alloc] init];
    line.frame = CGRectMake(self.view.bounds.size.width - 22, 15, 7, 13);
    line.image = [UIImage imageNamed:@"right_arrow"];
    [sendView addSubview:line];
    
    
    UITapGestureRecognizer *sendTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendViewTap:)];
    [sendView addGestureRecognizer:sendTap];
    // Do any additional setup after loading the view.
}

-(void)pickVew:(XMPickView *)pickView sender:(UIButton *)sender withSex:(NSString *)sex
{
    labelMoney.text=sex;
}
-(void)btnClick:(UIButton*)btn
{
    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"充值成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
- (void)sendViewTap:(UITapGestureRecognizer *)ges{
    [_phoneText resignFirstResponder];
    _pickView = [[XMPickView alloc] initWithArray:_sendMoneyArry];
    _pickView.delegate  =self;
    [_pickView show];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _phoneText.text=@"";
    
    _senBtn.enabled=NO;
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (_phoneText.text.length==11)
    {
        _senBtn.enabled=YES;
        _senBtn.backgroundColor=[UIColor orangeColor];
    }
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_phoneText resignFirstResponder];
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
