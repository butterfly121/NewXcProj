//
//  NSViewController.m
//  XcProject
//
//  Created by Jason on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "NSViewController.h"

@interface NSViewController ()

@end

@implementation NSViewController{
    NSMutableArray * array ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Action)];
    [self.view3 addGestureRecognizer:tap];
    
    self.Picker.delegate = self;
    self.Picker.dataSource = self;
    
    self.Picker.hidden = YES;
    self.PickTopView.hidden = YES;
    array = [NSMutableArray arrayWithObjects:@"我家",@"亲人",@"其他", nil];
    
    self.NSButton.enabled = NO;
}
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return array.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return array[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.ThirdLabel.text = array[row];
}
- (void)Action
{
    self.Picker.hidden = NO;
    self.PickTopView.hidden = NO;
    [self.textfield resignFirstResponder];
    
    if (self.textfield.text != nil || self.ThirdLabel.text != nil) {
        self.NSButton.backgroundColor = [UIColor orangeColor];
        self.NSButton.enabled = YES;
        
    }
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

- (IBAction)Action:(id)sender {
    
    UIAlertView  * alert = [[UIAlertView alloc]initWithTitle:@"消息提示" message:@"充值成功" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alert show];
    
}
- (IBAction)PickerButton:(id)sender {
    self.Picker.hidden = YES;
    self.PickTopView.hidden = YES;
}
@end
