//
//  ProfileTableViewCell.h
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *iconImageView;
@property (nonatomic,strong)UILabel     *Label;
@property(nonatomic,strong)UILabel      *detailLabel;
@property(nonatomic,strong)UIButton  *imageBtn;
+(instancetype)creatCell:(UITableView*)tableView Identifier:(NSString*)Identifier;
@property (nonatomic,strong)UILabel * label123;
@end
