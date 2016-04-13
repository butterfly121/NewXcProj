//
//  XMPickView.m
//  newProject
//
//  Created by xhm on 16/4/5.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "XMPickView.h"
#import "MaskView.h"
#define COLORA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
@interface XMPickView()<UIPickerViewDataSource, UIPickerViewDelegate,MaskViewDelegate>
{
    UIToolbar   *_toolBar;
    CGSize      _size;
    MaskView*maskView;
}
/**
 *  最底部的遮盖 ：屏蔽除菜单以外控件的事件
 */
@property (nonatomic, weak) UIButton *cover;
@end
@implementation XMPickView
- (id)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        self.alpha = 0;
        self.dataArray = array;
        _size = [[UIScreen mainScreen] bounds].size;
        self.backgroundColor = [UIColor clearColor];
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        maskView = [[MaskView alloc] initWithFrame:CGRectMake(0, 64, WIDTH , HEIGHT-64)];
        maskView.backgroundColor = COLORA(0, 0, 0, 0.2);
        maskView.delegate = self;
        [self addSubview:maskView];
        
        [self addsubViews];
    } return self;
}

- (void)addsubViews
{
    self.frame = (CGRect){CGPointZero, _size};
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    
    _toolBar = [[UIToolbar alloc] init];
    _toolBar.backgroundColor = [UIColor whiteColor];
    _toolBar.frame = (CGRect){0, _size.height, _size.width, 44};
    [self addSubview:_toolBar];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame= CGRectMake(10, 0, 80, 40);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_toolBar addSubview:button];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame=CGRectMake(WIDTH-90, 0, 80, 40);
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    [_toolBar addSubview:rightButton];
    
    self.pickView = [[UIPickerView alloc] init];
    self.pickView.showsSelectionIndicator = YES;
    self.pickView.backgroundColor =[UIColor whiteColor];
    self.pickView.dataSource = self;
    self.pickView.delegate = self;
    self.pickView.frame = (CGRect){0, _size.height + 44, _size.width, 206 - 44};
    [self addSubview:self.pickView];
}

- (void)coverClick
{
    [self maskViewClicked];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataArray[row];
}

- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.hidden = NO;
        maskView.hidden = NO;
        self.alpha = 1;
        _toolBar.frame = (CGRect){0, _size.height - 206, _size.width, 44};
        self.pickView.frame = (CGRect){0, _size.height - 206 + 44, _size.width, 206 - 44};
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        
        _toolBar.frame = (CGRect){0, _size.height, _size.width, 44};
        self.pickView.frame = (CGRect){0, _size.height + 44, _size.width, 206 - 44};
    } completion:^(BOOL finished) {
        self.hidden = YES;
        maskView.hidden = YES;
    }];
    
}
-(void)removePickView
{
    [self removeFromSuperview];
}
- (void)done:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(pickVew:sender:withSex:)]) {
        self.nameStr = [self.dataArray objectAtIndex:[self.pickView selectedRowInComponent:0]];
        [self.delegate pickVew:self sender:sender withSex:self.nameStr];
        [self dismiss];
        
    }

}
#pragma mark -MaskViewDelegate
- (void)maskViewClicked
{
    
    [self dismiss];
    
}
@end
