//
//  CorrelativechargesViewController.m
//  XcProject
//
//  Created by Jason on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "CorrelativechargesViewController.h"
#import "NSViewController.h"
@interface CorrelativechargesViewController ()

@end

@implementation CorrelativechargesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.big1.text = @"";
    self.big1.backgroundColor = [UIColor whiteColor];
    self.small1.text = @"燃气费";
    self.small1.font = [UIFont systemFontOfSize:15];
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Action1)];
    [self.big1 addGestureRecognizer:tap1];
    
    
    self.big2.text = @"";
    self.big2.backgroundColor = [UIColor whiteColor];
    self.small2.text = @"水费";
    self.small2.font = [UIFont systemFontOfSize:15];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Action2)];
    [self.big2 addGestureRecognizer:tap2];
    
    self.big3.text = @"";
    self.big3.backgroundColor = [UIColor whiteColor];
    self.small3.text = @"电费";
    self.small3.font = [UIFont systemFontOfSize:15];
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Action3)];
    [self.big3 addGestureRecognizer:tap3];
    
    self.RightItem = [[UIButton alloc] init];
    self.RightItem.frame  =CGRectMake(0, 44/2-15, 30, 30);
    [self.RightItem setTitle:@"上海" forState:UIControlStateNormal];
    [self.RightItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.RightItem.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.RightItem addTarget:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.RightItem];
}
- (void)rightBarButtonItemClick
{
    NSLog(@"上海");
}
- (void)Action1{
    
    NSViewController * NSVC = [[NSViewController alloc]init];
    NSVC.title = @"燃气费";
    [self.navigationController pushViewController:NSVC animated:YES];
}
- (void)Action2{
    NSViewController * NSVC = [[NSViewController alloc]init];
    NSVC.title = @"水费";
    [self.navigationController pushViewController:NSVC animated:YES];
}
- (void)Action3{
    NSViewController * NSVC = [[NSViewController alloc]init];
    NSVC.title = @"电费";
    [self.navigationController pushViewController:NSVC animated:YES];
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
