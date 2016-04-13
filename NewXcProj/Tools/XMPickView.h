//
//  XMPickView.h
//  newProject
//
//  Created by xhm on 16/4/5.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMPickView : UIView
@property (nonatomic, strong)   UIPickerView    *pickView;

@property (nonatomic, strong)   NSArray         *dataArray;

@property (nonatomic, strong)   NSString     *nameStr;
@property (nonatomic,weak)id delegate;
- (id)initWithArray:(NSArray *)array;
- (void)show;
- (void)dismiss;
-(void)removePickView;
@end
//确定按钮点击方法的代理
@protocol XMPickViewDelegate <NSObject>
@optional
- (void)pickVew:(XMPickView*)pickView sender:(UIButton*)sender withSex:(NSString*)sex;
@end
