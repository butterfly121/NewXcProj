//
//  MineTableViewCell.m
//  newProject
//
//  Created by xhm on 16/4/1.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)creatCell:(UITableView*)tableView Identifier:(NSString*)Identifier
{
    
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        
        cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubView];
    }
    return self;
}
- (void)creatSubView
{
    self.iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImageView];
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.font = [UIFont systemFontOfSize:15];
//    self.descLabel.textColor=[UIColor lightGrayColor];
    [self.contentView addSubview:self.descLabel];
    self.endlabel=[[UILabel alloc]init];
    self.endlabel.font=[UIFont systemFontOfSize:14];
    self.endlabel.textAlignment=NSTextAlignmentRight;
    self.endlabel.textColor=[UIColor lightGrayColor];
    [self.contentView addSubview:self.endlabel];
    self.image=[[UIImageView alloc]init];
    [self.contentView addSubview:self.image];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    float starx =10;
    self.iconImageView.frame = CGRectMake(starx, 5, 30, 30);
    self.descLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame)+starx,7, WIDTH-CGRectGetMaxX(self.iconImageView.frame)-2*starx, 30);
    self.endlabel.frame=CGRectMake(WIDTH-150, 7,120, 30);
//    self.image.frame=CGRectMake(self.endlabel.frame.origin.x+80, starx, 30, 30);
    
}

@end
