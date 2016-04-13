//
//  NSViewController.h
//  XcProject
//
//  Created by Jason on 16/4/12.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "BaseViewController.h"

@interface NSViewController : BaseViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UILabel *ThirdLabel;
- (IBAction)Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (weak, nonatomic) IBOutlet UIButton *NSButton;

- (IBAction)PickerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *PickTopView;

@end
