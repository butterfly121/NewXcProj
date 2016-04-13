//
//  ProfileTableViewCell.m
//  XcProject
//
//  Created by xhm on 16/4/11.
//  Copyright © 2016年 xhm. All rights reserved.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSLog(@"12345");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatSubView];
    }
    return self;
}
+(instancetype)creatCell:(UITableView*)tableView Identifier:(NSString*)Identifier
{
    
    ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (!cell) {
        
        cell = [[ProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)creatSubView
{
    self.iconImageView=[[UIImageView alloc]init];
    [self.contentView addSubview:self.iconImageView];
    self.Label = [[UILabel alloc] init];
    self.Label.text=@"123";
    self.Label.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.Label];
    self.detailLabel=[[UILabel alloc]init];
    self.detailLabel.text=@"789";
    self.detailLabel.font = [UIFont systemFontOfSize:12];
    self.detailLabel.textColor=[UIColor lightGrayColor];
    [self.contentView addSubview:self.detailLabel];
    self.imageBtn=[[UIButton alloc]init];
    self.imageBtn.userInteractionEnabled=NO;
    self.imageBtn.font=[UIFont systemFontOfSize:10];
//    self.image.layer.masksToBounds=YES;
//    self.image.layer.cornerRadius=17;
//    self.image.backgroundColor=[UIColor redColor];
    [self.contentView addSubview:self.imageBtn];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    float starx =10;
    self.iconImageView.frame = CGRectMake(starx,15, 30, 30);
    self.Label.frame = CGRectMake(45, 10, 160, 20);
    self.detailLabel.frame=CGRectMake(45,30,160,20);
    self.imageBtn.frame=CGRectMake(WIDTH-90, 15, 50, 30);
    
}

@end
