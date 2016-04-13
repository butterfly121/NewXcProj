//
//  MineTableViewCell.h
//  newProject
//
//  Created by xhm on 16/4/1.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineTableViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *iconImageView;
@property (nonatomic,strong)UILabel     *descLabel;
@property(nonatomic,strong)UILabel      *endlabel;
@property(nonatomic,strong)UIImageView  *image;
+(instancetype)creatCell:(UITableView*)tableView Identifier:(NSString*)Identifier;
@end
